defmodule EthosWeb.GuideBreadcrumbCorpusTest do
  @moduledoc """
  A corpus guard for the invariant `GuideBreadcrumb.trail/1`'s
  curated-destination lookup depends on but does not enforce.

  `trail/1` prefers a curated `Destination` record's crumb over the derived
  state+county hierarchy whenever the guide's `destination_slug` matches a
  curated record's path. The moduledoc there defends this by noting county
  records are keyed `"<state>/<county>"`, never a bare destination slug — a
  fact about the curated record's own path, not the fact that actually
  matters: **no curated record's bare path may equal the `destination_slug`
  of a guide that carries a county.** When that holds, no guide's
  county crumb is ever reachable via a curated lookup. When it breaks, a
  guide with that destination_slug renders the curated crumb instead of its
  state+county hierarchy — the county crumb vanishes from both the visible
  `<nav>` and the `BreadcrumbList` JSON-LD, silently.

  Reads the committed seed files and code guide modules, like
  `affiliate_corpus_test.exs` — a fixture describing a colliding pair keeps
  passing long after the real corpus changes shape.
  """
  use ExUnit.Case, async: true

  alias Ethos.Guides.Guide
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataDestination

  # A curated record's path is "<slug>" for a state/place-level page and
  # "<state>/<county>" for a county page (see `new-york-manhattan.json`'s
  # `"path": "new-york/manhattan"`). Only the bare form can ever collide with
  # a guide's destination_slug, which is derived from a bare destination name
  # and never carries a "/".
  defp bare_curated_paths do
    for f <- SeedDataHelpers.seed_files("destinations"),
        path = DataDestination.load!(f)["path"],
        not String.contains?(path, "/"),
        do: path
  end

  defp has_county?(county), do: is_binary(county) and county != ""

  # No guide authors a county any more: both loaders derive the pair from the
  # destination node's ancestry, through `Destinations.legacy_geo_from_trail/1`.
  # So this reads the same derivation the loaders read, off the roster — asking
  # the corpus for its authored `county` key would now match nothing at all and
  # pass this gate vacuously.
  defp derived_county(trails, node_path) do
    trails
    |> Map.fetch!(node_path)
    |> Ethos.Destinations.legacy_geo_from_trail()
    |> Map.fetch!("county")
  end

  defp county_carrying_guide_slugs do
    # Built once. `destination_trails/0` walks the whole roster, and calling it
    # per guide would rebuild 719 trails for each of four hundred files.
    trails = SeedDataHelpers.destination_trails()

    json =
      for f <- SeedDataHelpers.all_seed_files(),
          g = Ethos.Seeds.DataGuide.load!(f)["guide"],
          has_county?(derived_county(trails, g["destination_path"])),
          do: {Guide.derive_destination_slug(g["destination"]), f}

    code =
      for {d, owner} <- SeedDataHelpers.code_guides(),
          path = Map.get(d, :destination_path),
          has_county?(derived_county(trails, path)),
          do: {Guide.derive_destination_slug(d.destination), owner.seed_file}

    json ++ code
  end

  test "no curated destination record's bare path collides with a county-carrying guide's destination_slug" do
    bare_paths = bare_curated_paths()
    county_slugs = county_carrying_guide_slugs()

    # Non-vacuity: if the corpus ever stopped having any bare curated record,
    # or any county-carrying guide, the refute below would pass with nothing
    # to check.
    assert bare_paths != [], "expected at least one bare curated destination path"

    assert county_slugs != [],
           "expected at least one guide in the corpus to carry a county"

    collisions = for {slug, owner} <- county_slugs, slug in bare_paths, do: {slug, owner}

    assert collisions == [],
           "these guides carry a county, but their destination_slug collides with a curated " <>
             "destination record's bare path — GuideBreadcrumb.trail/1 will render the curated " <>
             "crumb instead of the state+county hierarchy, silently dropping the county crumb " <>
             "from both the <nav> and the BreadcrumbList JSON-LD: #{inspect(collisions)}"
  end
end
