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

  # The roster and the corpus must agree about WHICH states are done, and they
  # must agree now rather than at close-out.
  #
  # This is deliberately not tagged `:pending_golf`. Every other cross-check
  # between roster and corpus waits for all fifty rows, which means that during
  # the waves — the entire period when states are actually being added — nothing
  # compares the two at all. Florida shipped a full guide, ten place records and
  # a passing suite while its roster row still read `verified: false` with every
  # field null, and no gate noticed: the attribution test below only binds rows
  # already marked verified, so an unresolved row is invisible to it by
  # construction. A row that claims a state is unresearched, sitting beside that
  # state's published guide, is a contradiction the roster exists to prevent.
  #
  # Both directions matter and they fail differently. A guide without a resolved
  # row understates the corpus: the state is live on the site while the work list
  # says it is not, so a later wave can research it a second time. A resolved row
  # without a guide overstates it: the roster claims a state is published when no
  # file seeds it, which is the shape the close-out exhaustion check assumes has
  # already been ruled out.
  test "every golf guide has a resolved roster row, and every resolved row has a guide" do
    guides =
      for f <- SeedDataHelpers.seed_files("golf"),
          into: MapSet.new(),
          do: Path.basename(f, ".json")

    resolved = for e <- @roster, e["verified"], into: MapSet.new(), do: e["slug"]

    # Non-vacuous in both directions. An empty corpus or a fully unresolved
    # roster would satisfy the two assertions below while checking nothing.
    assert MapSet.size(guides) > 0, "no golf guides seed — this assertion is checking nothing"

    assert MapSet.size(resolved) > 0,
           "no resolved roster rows — this assertion is checking nothing"

    unrostered = guides |> MapSet.difference(resolved) |> Enum.sort()

    assert unrostered == [],
           "these states seed a guide but their roster row is not resolved, so the work list " <>
             "says they are unresearched while the site publishes them: #{inspect(unrostered)}"

    unseeded = resolved |> MapSet.difference(guides) |> Enum.sort()

    assert unseeded == [],
           "these roster rows are resolved but no guide file seeds them: #{inspect(unseeded)}"
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

  # §3's shadowing trap, mechanised — as a REGISTER, not a prohibition.
  #
  # `derive_destination_slug/1` keeps only the text before the first comma, so
  # fifty new golf destinations are fifty chances to answer on a URL an existing
  # town guide already answers on. §3 of `docs/site-builder.md` does not forbid
  # that: `"Kansas City, Missouri"` and `"Kansas City, Kansas"` both derive
  # `kansas-city` and merge into one hub, and the doctrine's words are that this
  # "may be what you want. It is never what you want by accident — decide, and
  # record the decision."
  #
  # So the rule is not that a collision must be absent. It is that a collision
  # must be DECLARED, right here, naming both files and saying why. An outright
  # ban forces a false choice between a wrong destination and a red build, and
  # the wrong destination wins: Iowa was rebased to "Spirit Hollow, Iowa" to
  # clear this gate, contradicting all four of its own place records, every one
  # of which carries town "Burlington".
  #
  # Each entry names both colliding files, the slug they share, and the reason.
  @destination_merges [
    %{
      golf_file: "priv/seed_data/golf/iowa.json",
      other_file: "priv/seed_data/connecticut/burlington.json",
      slug: "burlington",
      why:
        "There are genuinely two Burlingtons, and this guide's own place records " <>
          "settle which one it is about: Spirit Hollow, Flint Hills Municipal, The " <>
          "Lodge at Spirit Hollow and Lambo's all carry town \"Burlington\". Any " <>
          "other destination would contradict the file it sits in, and would name a " <>
          "destination hub after a golf course rather than after anywhere a visitor " <>
          "sleeps. /destinations/burlington therefore lists this guide beside the " <>
          "Connecticut town guide, deliberately, on §3's Kansas City precedent."
    },
    %{
      golf_file: "priv/seed_data/golf/connecticut.json",
      other_file: "priv/seed_data/connecticut/new-haven.json",
      slug: "new-haven",
      why:
        "One New Haven, not two, and both guides are about it. Yale Golf Course is " <>
          "inside the city and the basecamp is the city, so any other destination " <>
          "would name the hub after somewhere the visitor does not sleep. Sharing is " <>
          "the better outcome here rather than merely the permitted one: a reader at " <>
          "/destinations/new-haven sees the town guide and the golf guide together, " <>
          "which is what someone planning a weekend around a round actually wants. " <>
          "Note the separate, non-colliding overlap with connecticut/woodbridge.json: " <>
          "that guide already publishes the second course as place record " <>
          "tradition-golf-club-oak-lane, so the golf guide mints no duplicate record " <>
          "and names it in prose instead. That is a place merge, not a destination " <>
          "one, and it derives no woodbridge slug — which is why it is described " <>
          "here but not declared as an entry."
    }
  ]

  # Both directions, and the second is the one that keeps the register honest.
  # A register that only pardoned collisions would rot into a list of stale
  # pardons: an entry left behind after a destination changed would go on
  # silently pardoning whatever collision next landed on that pair. So a
  # declared collision that no longer occurs fails too, and every line above has
  # to still be true.
  test "every golf destination-slug collision is declared, and every declaration is live" do
    golf_files = SeedDataHelpers.seed_files("golf")

    golf_dests =
      for f <- golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          do: {rel(f), Ethos.Guides.Guide.derive_destination_slug(d)}

    others =
      for f <- SeedDataHelpers.all_seed_files(),
          f not in golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          reduce: %{} do
        acc ->
          Map.update(
            acc,
            Ethos.Guides.Guide.derive_destination_slug(d),
            [rel(f)],
            &[rel(f) | &1]
          )
      end

    found =
      MapSet.new(
        for {golf_file, slug} <- golf_dests,
            other_file <- Map.get(others, slug, []),
            do: {golf_file, other_file, slug}
      )

    declared = MapSet.new(@destination_merges, &{&1.golf_file, &1.other_file, &1.slug})

    undeclared = found |> MapSet.difference(declared) |> Enum.sort()

    assert undeclared == [],
           "golf destination slugs already answered by another guide, with no entry in " <>
             "@destination_merges — a merged hub is allowed (§3, the Kansas City " <>
             "precedent) but never silent. Decide whether to share the hub or rebase, " <>
             "and if you share it, add an entry naming both files and the reason: " <>
             inspect(undeclared)

    stale = declared |> MapSet.difference(found) |> Enum.sort()

    assert stale == [],
           "@destination_merges declares collisions that no longer happen. A pardon for " <>
             "a collision that is not occurring is a pardon lying in wait for the next " <>
             "one to land on the same pair; delete these entries: " <> inspect(stale)
  end

  # Repo-relative, so the register reads as the paths a person would type.
  defp rel(path), do: Path.relative_to(path, File.cwd!())

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
