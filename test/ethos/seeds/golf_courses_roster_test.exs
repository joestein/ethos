defmodule Ethos.Seeds.GolfCoursesRosterTest do
  @moduledoc """
  The work list for the golf set, and the three things that can go wrong with
  one.

  Ported from `mlb_clubs_roster_test.exs`, which learned each of these the
  expensive way. The attribution test in particular is not optional: the
  bare-places roster originally flattened the corpus to a list of slugs and
  checked membership, and under mutation a repointed `seed_file`, a `region`
  set to "atlantis" and a changed `name` all passed every assertion.

  `second_course`, `ranking_position` and `access` stay OUT of the attribution
  tuple while still being asserted non-empty on a resolved row. A later wave
  may legitimately correct any of them — asserting them would fail this test
  for the programme doing its job. The tuple holds the fields that identify
  *which record this is*; the work is allowed to improve the rest (§2).
  """
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  @path "priv/seed_data/golf_courses_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  # Always required on a verified row.
  @always ~w(course facility city county access criterion)

  # Required only when `criterion` is "ranking", and required to be NULL
  # otherwise. Task 5's contingency lets a state fall back to the
  # championship-venue criterion when the ranking is unreachable or does not
  # reach that state, and a fallback row has no ranking to cite. Making the
  # triple merely optional would let a half-cited row through; making the two
  # shapes mutually exclusive keeps "which rule decided this row" answerable.
  @ranking ~w(ranking_source ranking_edition ranking_position)

  test "one row per state, no duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == 50
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate state slugs"

    states = Enum.map(@roster, & &1["state"])
    assert length(states) == length(Enum.uniq(states)), "duplicate state names"
  end

  test "every row carries the same key set, and the identity fields are given" do
    expected = Enum.sort(~w(access city county course criterion facility
                            ranking_edition ranking_position ranking_source
                            second_course slug state verified))

    for entry <- @roster do
      assert Enum.sort(Map.keys(entry)) == expected,
             "unexpected key set on #{inspect(entry["slug"])}"

      assert is_binary(entry["state"]) and entry["state"] != ""
      assert is_binary(entry["slug"]) and entry["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_boolean(entry["verified"])
    end
  end

  # Resolved together or not at all. A half-filled row means someone wrote down
  # what they thought they knew and stopped, and nothing downstream
  # distinguishes it from research output.
  #
  # `second_course` is exempt from the "resolved means non-null" half: a state
  # may genuinely have no second public course worth naming, and publishing
  # without one is a legitimate outcome (§4 rule 2 — there is no floor).
  test "a row is resolved together or not at all" do
    for entry <- @roster do
      slug = entry["slug"]

      if entry["verified"] do
        blank = for k <- @always, is_nil(entry[k]) or entry[k] == "", do: k

        assert blank == [],
               "#{slug} is marked verified with missing fields: #{inspect(blank)}"

        case entry["criterion"] do
          "ranking" ->
            missing = for k <- @ranking, is_nil(entry[k]) or entry[k] == "", do: k

            assert missing == [],
                   "#{slug} selects on the ranking criterion but cites no ranking: " <>
                     inspect(missing)

          "championship" ->
            present = for k <- @ranking, not is_nil(entry[k]), do: k

            assert present == [],
                   "#{slug} fell back to the championship criterion but carries ranking " <>
                     "fields — the two shapes are mutually exclusive so that which rule " <>
                     "decided a row stays answerable: " <> inspect(present)

          other ->
            flunk(
              "#{slug} has criterion #{inspect(other)}; expected \"ranking\" or \"championship\""
            )
        end
      else
        set = for k <- @always ++ @ranking ++ ["second_course"], not is_nil(entry[k]), do: k

        assert set == [],
               "#{slug} carries researched data without being verified: #{inspect(set)}"
      end
    end
  end

  # Shape is not attribution. Every assertion above passes while a resolved row
  # names a course, city, state or county that disagrees with what shipped.
  @tag :pending_golf
  test "a resolved row agrees with the place the corpus actually seeds" do
    resolved = Enum.filter(@roster, & &1["verified"])

    # Non-vacuous. The roster starts fully unresolved, so without this the
    # check would ship green and empty and stay that way through five waves.
    assert resolved != [], "no resolved roster rows — this assertion is checking nothing"

    golf_places =
      for f <- SeedDataHelpers.seed_files("golf"),
          p <- DataGuide.load!(f)["places"],
          p["kind"] == "golf-course",
          do: p

    names = Enum.map(golf_places, & &1["name"])

    assert length(names) == length(Enum.uniq(names)),
           "two golf-course places share a name, so the map below would drop one: " <>
             inspect(names -- Enum.uniq(names))

    corpus = Map.new(golf_places, &{&1["name"], {&1["town"], &1["state"], &1["county"]}})

    for entry <- resolved do
      slug = entry["slug"]

      assert Map.has_key?(corpus, entry["course"]),
             "#{slug} names course #{inspect(entry["course"])}, which no seeded place matches"

      assert corpus[entry["course"]] == {entry["city"], entry["state"], entry["county"]},
             "#{slug} disagrees with the corpus: roster has " <>
               inspect({entry["city"], entry["state"], entry["county"]}) <>
               ", the #{inspect(entry["course"])} place record has " <>
               inspect(corpus[entry["course"]])

      # Scoped to criterion == "ranking" on purpose. A row that fell back to
      # the "championship" criterion (see the mutual-exclusion test above)
      # legitimately cites a different source, or none at all — asserting
      # this across every resolved row would fail that case for doing its
      # job. Oregon's row carried "2025-'26 (25th edition)" and "Golf Digest
      # Best in State, Oregon" for hours after the descriptor was dropped
      # everywhere else, and nothing here caught it; this closes that gap.
      if entry["criterion"] == "ranking" do
        assert entry["ranking_source"] == "Golf Digest Best in State" and
                 entry["ranking_edition"] == "2025-'26",
               "#{slug} disagrees with the rest of the roster about the ranking it cites: " <>
                 "ranking_source #{inspect(entry["ranking_source"])}, ranking_edition " <>
                 inspect(entry["ranking_edition"])
      end
    end
  end

  # §3's shadowing trap, mechanised. Fifty new destination slugs is fifty
  # chances to take a URL an existing town guide already answers on. The
  # remedy when it happens is the shadowed-guide line the state hub already
  # renders (`Guides.list_guides_shadowed_by_state/1`), not a rename — but it
  # must be a decision somebody made, not one nobody noticed.
  test "no golf guide's destination slug silently takes an existing page's URL" do
    golf_files = SeedDataHelpers.seed_files("golf")

    golf_dests =
      for f <- golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          do: {Path.basename(f), Ethos.Guides.Guide.derive_destination_slug(d)}

    other_dests =
      for f <- SeedDataHelpers.all_seed_files(),
          f not in golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          into: MapSet.new(),
          do: Ethos.Guides.Guide.derive_destination_slug(d)

    collisions =
      for {file, slug} <- golf_dests, MapSet.member?(other_dests, slug), do: {file, slug}

    assert collisions == [],
           "golf basecamps whose destination slug is already answered by another guide — " <>
             "decide whether to share the hub or rebase, and record it in the guide's file: " <>
             inspect(collisions)
  end

  # The set is finished, and this is what makes "finished" a fact rather than a
  # claim in a wave report. It FAILS until wave 5 lands. That is intended: a
  # red exhaustion check is the visible remainder of the work.
  @tag :pending_golf
  test "all fifty states are resolved, and every ranked course is seeded" do
    unresolved = for entry <- @roster, not entry["verified"], do: entry["slug"]

    assert unresolved == [],
           "these state rows are unresolved: #{inspect(unresolved)}"

    roster_courses = Enum.map(@roster, & &1["course"])
    assert length(roster_courses) == 50

    seeded =
      MapSet.new(
        for f <- SeedDataHelpers.seed_files("golf"),
            p <- DataGuide.load!(f)["places"],
            p["kind"] == "golf-course",
            do: p["name"]
      )

    # Subset, not equality: a state's file may also define its second public
    # course as a golf-course place, and the roster deliberately does not
    # enumerate those. Per-row geography is checked by the attribution test
    # above; what remains here is that no ranked course went unseeded.
    missing = Enum.reject(roster_courses, &MapSet.member?(seeded, &1))

    assert missing == [],
           "roster rows naming a course the corpus does not seed: " <> inspect(missing)
  end
end
