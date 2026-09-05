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

  alias Ethos.Foliage.{ArcGIS, Geometry}

  @expected_towns 169
  @simplify_tolerance 0.0008
  @sample_count 25

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started(:req)

    {opts, _, _} =
      OptionParser.parse(args,
        strict: [towns: :boolean, stages: :boolean, routes: :boolean, all: :boolean]
      )

    if opts[:towns] || opts[:all], do: build_towns()
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

  defp write!(name, payload) do
    dir = Path.join(:code.priv_dir(:ethos) |> to_string(), "foliage")
    File.mkdir_p!(dir)
    File.write!(Path.join(dir, name), Jason.encode_to_iodata!(payload, pretty: true))
  end
end
