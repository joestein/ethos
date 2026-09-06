defmodule Mix.Tasks.Ethos.Foliage.Build do
  @shortdoc "Derives the foliage dataset from CT DEEP's public services"

  @moduledoc """
  Writes `priv/foliage/{towns,routes,weeks}.json` from CT DEEP's public ArcGIS
  services. Run on a developer machine; commit the output.

  This never runs in production and the application never calls it. The point
  of committing the output is that the dataset is reviewable in a diff — which
  matters, because it is the thing being represented as derived from a state
  agency.

      mix ethos.foliage.build --towns    # geometry only
      mix ethos.foliage.build --stages   # sample the tiles (slow, ~2500 fetches)
      mix ethos.foliage.build --routes   # route/town joins; needs a seeded DB
      mix ethos.foliage.build --all

  `--routes` resolves town names to published guide slugs by querying `guides`,
  so it needs a locally seeded database. Five towns (Danbury, Middlebury,
  Southbury, Waterbury, Woodbury) are seeded from Elixir modules rather than
  JSON, and Mansfield has no guide of its own at all — it is covered by the
  Storrs guide, Storrs being a village in Mansfield. Reading the seed
  directory would miss all six.
  """

  use Mix.Task

  require Ecto.Query

  alias Ethos.Foliage.{ArcGIS, Geometry}

  @expected_towns 169
  @simplify_tolerance 0.0008
  @sample_count 25

  @sample_floor 0.6
  @expected_routes 7
  @minimum_route_towns 3
  @tile_host "https://tiles.arcgis.com/tiles/FjPcSmEFuDYlIdKC/arcgis/rest/services"
  @tile_cache "tmp/foliage_tiles"

  # Verified against the live tile services on 2026-09-05. If a change to the
  # anchors or the sampling breaks these, the derivation has drifted away from
  # what DEEP publishes and the build must not produce a dataset.
  @regional_expectations [
    {"salisbury", 4..5},
    {"norfolk", 4..5},
    {"hartford", 5..6},
    {"old-saybrook", 7..8},
    {"greenwich", 8..8}
  ]

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started(:req)

    {opts, _, _} =
      OptionParser.parse(args,
        strict: [towns: :boolean, stages: :boolean, routes: :boolean, all: :boolean]
      )

    if opts[:towns] || opts[:all], do: build_towns()
    if opts[:stages] || opts[:all], do: build_stages()
    if opts[:routes] || opts[:all], do: build_routes()
  end

  defp build_towns do
    Mix.shell().info("Fetching Connecticut town polygons…")

    towns =
      ArcGIS.fetch_towns!()
      |> ArcGIS.town_features()
      |> ArcGIS.dissolve()

    if length(towns) != @expected_towns do
      Mix.raise("Expected #{@expected_towns} towns, got #{length(towns)}. Refusing to write.")
    end

    payload =
      Enum.map(towns, fn town ->
        simplified = Geometry.simplify(town.ring, @simplify_tolerance)

        if length(simplified) < 4 do
          Mix.raise(
            "#{town.name} simplified to #{length(simplified)} points; tolerance too coarse."
          )
        end

        {lon, lat} = Geometry.centroid(town.ring)

        %{
          slug: town.slug,
          name: town.name,
          county: town.county,
          fips: town.fips,
          # Stored even though the choropleth does not use them: a town-to-town
          # drive-time matrix is the one piece of this that a later trip planner
          # can inherit, and it costs one line here.
          lat: Float.round(lat, 5),
          lng: Float.round(lon, 5),
          ring: Enum.map(simplified, fn {x, y} -> [Float.round(x, 5), Float.round(y, 5)] end),
          samples:
            town.ring
            |> Geometry.sample_points(@sample_count, :erlang.phash2(town.slug))
            |> Enum.map(fn {x, y} -> [Float.round(x, 6), Float.round(y, 6)] end)
        }
      end)

    write!("towns.json", payload)
    Mix.shell().info("Wrote #{length(payload)} towns.")
  end

  defp build_stages do
    towns = read!("towns.json")
    weeks = Ethos.Foliage.Sampler.weeks()

    stages =
      Enum.map(towns, fn town ->
        samples = Enum.map(town["samples"], fn [x, y] -> {x, y} end)

        sequence =
          Enum.map(weeks, fn week ->
            samples
            |> Enum.map(&sample_pixel(week.service, &1))
            |> Ethos.Foliage.Sampler.modal_stage(@sample_floor)
            |> case do
              {:ok, stage} ->
                stage

              {:error, :insufficient_samples} ->
                Mix.raise("#{town["name"]} week #{week.index}: too few pixels on the ramp.")
            end
          end)

        unless Ethos.Foliage.Sampler.monotonic?(sequence) do
          Mix.raise("#{town["name"]} regresses: #{inspect(sequence)}")
        end

        peak = Ethos.Foliage.Sampler.peak_week(sequence)

        unless peak && peak <= 8 do
          Mix.raise("#{town["name"]} has no usable peak week: #{inspect(sequence)}")
        end

        Map.merge(town, %{"stages" => Enum.map(sequence, &to_string/1), "peak_week" => peak})
      end)

    verify_regions!(stages)
    write!("towns.json", stages)
    write!("weeks.json", Enum.map(weeks, &encode_week/1))
    Mix.shell().info("Sampled #{length(stages)} towns across #{length(weeks)} weeks.")
  end

  defp verify_regions!(towns) do
    by_slug = Map.new(towns, &{&1["slug"], &1})

    for {slug, expected} <- @regional_expectations do
      town = Map.fetch!(by_slug, slug)

      unless town["peak_week"] in expected do
        Mix.raise("""
        #{town["name"]} peaks in week #{town["peak_week"]}, expected #{inspect(expected)}.
        The sampling has drifted from DEEP's published regional windows.
        """)
      end
    end

    Mix.shell().info("Regional windows reproduce DEEP's published dates.")
  end

  defp build_routes do
    Mix.Task.run("app.start")

    {ct_path, ct_pattern} =
      Ethos.Destinations.subtree_match(Ethos.Foliage.connecticut_path())

    # "A published Connecticut guide" is now the guide's destination node being
    # under `united-states/connecticut`, not a `state_slug` column that no
    # longer exists. Same set, expressed as ancestry.
    published =
      Ethos.Repo.all(
        Ecto.Query.from(g in Ethos.Guides.Guide,
          join: d in assoc(g, :destination_node),
          where:
            g.status == "published" and
              (d.path == ^ct_path or like(d.path, ^ct_pattern)),
          select: g.slug
        )
      )
      |> MapSet.new()

    towns = read!("towns.json")
    by_slug = Map.new(towns, &{&1["slug"], &1})
    features = ArcGIS.fetch_routes!() |> Map.fetch!("features")

    if length(features) != @expected_routes do
      Mix.raise("Expected #{@expected_routes} routes, got #{length(features)}.")
    end

    routes =
      Enum.map(features, fn %{"attributes" => a, "geometry" => g} ->
        name = a["ROUTENAME"]
        slug = Geometry.slugify(name)

        path =
          g["paths"] |> List.flatten() |> Enum.chunk_every(2) |> Enum.map(fn [x, y] -> {x, y} end)

        members =
          ArcGIS.fetch_route_towns!(g["paths"])
          |> Enum.map(&Geometry.slugify/1)
          |> Enum.filter(&Map.has_key?(by_slug, &1))
          |> Enum.map(fn s ->
            t = by_slug[s]
            %{slug: s, lat: t["lat"], lng: t["lng"]}
          end)

        ordered = Ethos.Foliage.Routes.order_along(path, members)

        if length(ordered) < @minimum_route_towns do
          Mix.raise("Route #{name} matched only #{length(ordered)} towns.")
        end

        stops =
          Enum.map(ordered, fn town_slug ->
            guide = Ethos.Foliage.Routes.guide_slug_for(town_slug, published)

            unless guide do
              Mix.raise("Route #{name}: town #{town_slug} has no published guide.")
            end

            %{"town_slug" => town_slug, "guide_slug" => guide}
          end)

        %{
          "slug" => slug,
          "name" => name,
          "deep_url" => a["URL"],
          "stops" => stops,
          "path" =>
            path
            |> Geometry.simplify(0.0005)
            |> Enum.map(fn {x, y} -> [Float.round(x, 5), Float.round(y, 5)] end)
        }
      end)
      |> Enum.sort_by(& &1["slug"])

    write!("routes.json", routes)

    for r <- routes, do: Mix.shell().info("  #{r["name"]}: #{length(r["stops"])} towns")
    Mix.shell().info("Wrote #{length(routes)} routes.")
  end

  defp sample_pixel(service, point) do
    {tx, ty, px, py} = Ethos.Foliage.Tiles.address(point)
    image = tile_image(service, tx, ty)

    case Vix.Vips.Operation.getpoint(image, px, py) do
      {:ok, [r, g, b | _]} -> Ethos.Foliage.Tiles.classify({round(r), round(g), round(b)})
      _ -> :unknown
    end
  end

  defp tile_image(service, x, y) do
    path = Path.join([@tile_cache, service, "#{x}_#{y}.jpg"])

    unless File.exists?(path) do
      File.mkdir_p!(Path.dirname(path))
      url = "#{@tile_host}/#{service}/MapServer/tile/#{Ethos.Foliage.Tiles.zoom()}/#{y}/#{x}"
      %{status: 200, body: body} = Req.get!(url, receive_timeout: 60_000, retry: :transient)
      File.write!(path, body)
    end

    {:ok, image} = Vix.Vips.Image.new_from_file(path)
    image
  end

  defp encode_week(week) do
    %{
      "index" => week.index,
      "label" => week.label,
      "starts" => week.starts && Tuple.to_list(week.starts),
      "ends" => week.ends && Tuple.to_list(week.ends)
    }
  end

  defp read!(name) do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "foliage", name])
    |> File.read!()
    |> Jason.decode!()
  end

  defp write!(name, payload) do
    dir = Path.join(:code.priv_dir(:ethos) |> to_string(), "foliage")
    File.mkdir_p!(dir)
    File.write!(Path.join(dir, name), Jason.encode_to_iodata!(payload, pretty: true))
  end
end
