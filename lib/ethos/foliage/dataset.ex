defmodule Ethos.Foliage.Dataset do
  @moduledoc """
  Loads the committed foliage JSON into `:persistent_term` once at boot.

  `:persistent_term` rather than ETS or a GenServer because the data is written
  exactly once and then read on every request: reads are a direct memory
  access with no copy, and the write cost that makes `:persistent_term` a bad
  fit for mutable state never applies here.

  Validation happens at boot rather than at first request, so a bad deploy
  fails to start instead of serving a broken map.
  """

  require Logger

  @key {__MODULE__, :data}
  @expected_towns 169
  @expected_routes 7
  @expected_weeks 9

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  def load! do
    # Force-load Tiles so the stage atoms its @stages attribute defines exist
    # in the atom table before decode_town/1 calls String.to_existing_atom/1.
    # In a fresh VM (boot, not `mix test` under a warm code server) nothing
    # else references Tiles this early, so without this the very first boot
    # raises ArgumentError instead of just working in dev.
    Code.ensure_loaded!(Ethos.Foliage.Tiles)

    towns = read!("towns.json") |> Enum.map(&decode_town/1)
    routes = read!("routes.json") |> Enum.map(&decode_route/1)
    weeks = read!("weeks.json") |> Enum.map(&decode_week/1)

    validate!(towns, routes, weeks)

    :persistent_term.put(@key, %{
      towns: towns,
      towns_by_slug: Map.new(towns, &{&1.slug, &1}),
      routes: routes,
      routes_by_slug: Map.new(routes, &{&1.slug, &1}),
      weeks: weeks
    })

    :ok
  end

  def fetch! do
    :persistent_term.get(@key)
  rescue
    ArgumentError ->
      load!()
      :persistent_term.get(@key)
  end

  defp validate!(towns, routes, weeks) do
    if length(towns) != @expected_towns,
      do: raise("foliage: #{length(towns)} towns, expected #{@expected_towns}")

    if length(routes) != @expected_routes,
      do: raise("foliage: #{length(routes)} routes, expected #{@expected_routes}")

    if length(weeks) != @expected_weeks,
      do: raise("foliage: #{length(weeks)} weeks, expected #{@expected_weeks}")

    for town <- towns do
      if length(town.stages) != @expected_weeks do
        raise "foliage: #{town.slug} has #{length(town.stages)} stages"
      end
    end

    slugs = MapSet.new(towns, & &1.slug)

    for route <- routes, stop <- route.stops, not MapSet.member?(slugs, stop.town_slug) do
      raise "foliage: route #{route.slug} references unknown town #{stop.town_slug}"
    end

    for route <- routes, route.stops == [] do
      raise "foliage: route #{route.slug} has no stops"
    end

    :ok
  end

  @doc """
  Logs any route stop whose guide has been unpublished or renamed.

  Not a raise: a guide going missing should not take the site down, but it
  silently orphans a link, so it has to be loud in the log. Called from
  `Ethos.Release.foliage_links/0`, the only way to run this after a deploy —
  production runs a release, not Mix.
  """
  def warn_dangling_guides(published_slugs) do
    for route <- fetch!().routes,
        stop <- route.stops,
        not MapSet.member?(published_slugs, stop.guide_slug) do
      Logger.warning("foliage: route #{route.slug} links missing guide #{stop.guide_slug}")
    end

    :ok
  end

  defp decode_town(t) do
    %{
      slug: t["slug"],
      name: t["name"],
      county: t["county"],
      fips: t["fips"],
      lat: t["lat"],
      lng: t["lng"],
      ring: Enum.map(t["ring"], fn [x, y] -> {x, y} end),
      stages: Enum.map(t["stages"], &String.to_existing_atom/1),
      peak_week: t["peak_week"]
    }
  end

  defp decode_route(r) do
    %{
      slug: r["slug"],
      name: r["name"],
      deep_url: r["deep_url"],
      path: Enum.map(r["path"], fn [x, y] -> {x, y} end),
      stops: Enum.map(r["stops"], &%{town_slug: &1["town_slug"], guide_slug: &1["guide_slug"]})
    }
  end

  defp decode_week(w) do
    %{
      index: w["index"],
      label: w["label"],
      starts: w["starts"] && List.to_tuple(w["starts"]),
      ends: w["ends"] && List.to_tuple(w["ends"])
    }
  end

  defp read!(name) do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "foliage", name])
    |> File.read!()
    |> Jason.decode!()
  end
end
