defmodule EthosWeb.GuideBreadcrumbCorpusTest do
  @moduledoc """
  A corpus guard on the geographic trail every guide page publishes.

  ## What this used to guard, and why the rule moved

  `GuideBreadcrumb.trail/1` used to prefer a curated `Destination` record's
  crumb over the derived state+county hierarchy whenever the guide's
  `destination_slug` matched a curated record's path. This file guarded the
  invariant that preference silently depended on: **no curated record's bare
  path may equal the `destination_slug` of a guide that carries a county.**
  When that broke, the county crumb vanished from both the visible `<nav>` and
  the `BreadcrumbList` JSON-LD, with nothing failing.

  The lookup is gone. A guide's trail is now its destination node's ancestry —
  the same walk a hub page and a place page make — so there is no curated
  record to outrank a hierarchy, and no way for one crumb to swallow the rest.

  The requirement has not moved, only its mechanism: a guide page must carry a
  real geographic trail, and the county it is filed under must appear in it. So
  this asserts the same guarantee against the new source. Read off the roster
  and the committed corpus, like `affiliate_corpus_test.exs` — a fixture
  describing a couple of nodes keeps passing long after the real corpus changes
  shape.

  ## The invariant now

  For every guide in the corpus, JSON-authored or code-authored:

  1. its `destination_path` names a node the roster owns, so the trail resolves
     at all rather than falling back to the legacy columns Task 12 deletes;
  2. the trail is root-first and ends at that node, so the last crumb is the
     guide's own place and the first is a country; and
  3. when the guide's derived county is non-empty, a node bearing that county's
     name is *in* the trail — the crumb the old rule could drop.
  """
  use ExUnit.Case, async: true

  alias Ethos.Destinations
  alias Ethos.SeedDataHelpers

  # Every guide in the corpus as `{owner, destination_path}`. Both authoring
  # forms, because a rule enforced over the JSON files alone leaves the
  # thirty-odd code guide modules unguarded — the hole `code_guides/0` was added
  # to close.
  defp corpus_guides do
    json =
      for f <- SeedDataHelpers.all_seed_files(),
          g = Ethos.Seeds.DataGuide.load!(f)["guide"],
          do: {Path.basename(f), g["destination_path"]}

    code =
      for {d, owner} <- SeedDataHelpers.code_guides(),
          do: {Path.basename(owner.seed_file), Map.get(d, :destination_path)}

    json ++ code
  end

  # `Ethos.Seeds.RomeGuide` hand-rolls its own upsert and names no node, so it
  # contributes a nil path. It is the one guide in the corpus with no node and
  # is named here rather than filtered silently: the day it gains one, this list
  # shrinks and nothing else has to change.
  @nodeless_guides ["rome_guide.ex"]

  setup_all do
    trails = SeedDataHelpers.destination_trails()
    %{trails: trails, guides: corpus_guides()}
  end

  test "every guide is filed on a node the roster owns", %{trails: trails, guides: guides} do
    unresolvable =
      for {owner, path} <- guides,
          owner not in @nodeless_guides,
          not Map.has_key?(trails, path || ""),
          do: {owner, path}

    assert unresolvable == [],
           "these guides name a destination_path no roster node owns, so their breadcrumb " <>
             "falls back to the legacy state/county columns instead of a real trail: " <>
             inspect(unresolvable)

    # Non-vacuity, both halves: a corpus of nothing, or a corpus where every
    # guide had been added to @nodeless_guides, would satisfy the refutation
    # above with nothing checked.
    resolved = for {owner, _} <- guides, owner not in @nodeless_guides, do: owner
    assert length(resolved) > 100, "the guide corpus has shrunk to #{length(resolved)} guides"
  end

  test "every guide's trail is root-first, starts at a country and ends at its own node", %{
    trails: trails,
    guides: guides
  } do
    for {owner, path} <- guides, owner not in @nodeless_guides do
      trail = Map.fetch!(trails, path)

      # Every prefix of the node's path, shortest first — which is at once
      # root-first order, a complete ancestry with no tier skipped, and a trail
      # ending at the guide's own node. A missing ancestor shortens the trail
      # and fails here.
      expected =
        path
        |> String.split("/")
        |> Enum.scan([], fn seg, acc -> acc ++ [seg] end)
        |> Enum.map(&Enum.join(&1, "/"))

      assert Enum.map(trail, & &1.path) == expected,
             "#{owner}: the trail for #{path} is not its own ancestry, root-first"

      assert List.first(trail).kind == "country",
             "#{owner}: the trail for #{path} starts at a #{List.first(trail).kind}, so the " <>
               "breadcrumb's first crumb is not a country"
    end
  end

  test "a guide filed under a county carries that county in its trail", %{
    trails: trails,
    guides: guides
  } do
    # The county is derived from the node's ancestry through
    # `legacy_geo_from_trail/1` — the same derivation the loaders write into the
    # legacy columns — rather than read from an authored `county` key, which no
    # seed file carries any more and which would pass this gate vacuously.
    with_county =
      for {owner, path} <- guides,
          owner not in @nodeless_guides,
          trail = Map.fetch!(trails, path),
          county = Destinations.legacy_geo_from_trail(trail)["county"],
          is_binary(county) and county != "",
          do: {owner, path, trail, county}

    assert length(with_county) > 100,
           "only #{length(with_county)} guides in the corpus resolve a county, so this gate " <>
             "has stopped proving anything"

    missing =
      for {owner, path, trail, county} <- with_county,
          county not in Enum.map(trail, & &1.name),
          do: {owner, path, county}

    assert missing == [],
           "these guides are filed under a county that appears nowhere in their node's " <>
             "ancestry, so the county crumb is missing from both the <nav> and the " <>
             "BreadcrumbList JSON-LD: " <> inspect(missing)
  end

  test "no curated hub page is keyed on a bare path any more", %{trails: trails} do
    # The wreckage the old rule left behind. `curated_destination_crumb/1`
    # matched only because all thirteen curated files were keyed on bare,
    # pre-tree paths ("connecticut", "rome"), and `Release.seed_destinations/0`
    # inserted those keys as rows of their own — parentless, kindless, and
    # sitting on the URLs thirteen 301s were supposed to own.
    #
    # Kept as an assertion rather than a comment because the files are the only
    # thing stopping it from coming back: re-key one by hand and the rows return.
    bare =
      for f <- SeedDataHelpers.seed_files("destinations"),
          path = Ethos.Seeds.DataDestination.load!(f)["path"],
          not Map.has_key?(trails, path),
          do: {Path.basename(f), path}

    assert bare == [],
           "these curated hub files are keyed on a path the roster does not own — each one " <>
             "seeds a parentless row that shadows a node, disables its redirect and lists " <>
             "itself on /destinations as a country: " <> inspect(bare)
  end
end
