defmodule Ethos.Seeds.QueensRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/queens_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  # Queens has exactly 14 community districts, numbered 1..14. This is the one
  # structural fact about the borough a gate can check, and the Bronx roster
  # test has no equivalent because it was written generically.
  @community_districts 1..14

  test "the roster names a borough and its source" do
    assert @roster["borough"] == "Queens"
    assert is_binary(@roster["source"]) and @roster["source"] != ""
  end

  test "every neighborhood carries the four dispatch keys, and no others" do
    for n <- @roster["neighborhoods"] do
      assert Enum.sort(Map.keys(n)) == ~w(community_district in_scope name slug wave)

      assert is_binary(n["slug"]) and n["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_binary(n["name"]) and n["name"] != ""
      assert is_integer(n["community_district"]) and n["community_district"] > 0
      assert is_integer(n["wave"]) and n["wave"] > 0
    end
  end

  test "slugs and names are unique" do
    slugs = Enum.map(@roster["neighborhoods"], & &1["slug"])
    names = Enum.map(@roster["neighborhoods"], & &1["name"])

    assert slugs == Enum.uniq(slugs), "duplicate slugs"
    assert names == Enum.uniq(names), "duplicate names"
  end

  # The attribution lesson from bare_places_roster_test: assert the fields a
  # wave DISPATCHES on, not only that entries exist. A mutation test there
  # proved a repointed field passed every assertion that checked membership.
  test "no neighborhood carries a tier — the tier is an outcome of research" do
    for n <- @roster["neighborhoods"] do
      refute Map.has_key?(n, "tier"), "#{n["slug"]} carries a tier in the roster"
    end
  end

  test "waves are contiguous from 1 and none is empty" do
    waves = @roster["neighborhoods"] |> Enum.map(& &1["wave"]) |> Enum.uniq() |> Enum.sort()
    assert waves == Enum.to_list(1..length(waves)), "waves are not 1..n: #{inspect(waves)}"
  end

  # Two directions, because each catches a different error. Out-of-range
  # catches a typo or a Bronx/Brooklyn district number pasted across; missing
  # districts catch a roster that dropped a whole swathe of the borough —
  # which is invisible to every assertion above, since a roster of 40
  # neighborhoods covering 9 districts satisfies all of them.
  test "every community district is in 1..14" do
    out_of_range =
      for n <- @roster["neighborhoods"],
          n["community_district"] not in @community_districts,
          do: {n["slug"], n["community_district"]}

    assert out_of_range == [],
           "Queens has 14 community districts; these are outside 1..14: #{inspect(out_of_range)}"
  end

  test "all 14 community districts are represented" do
    present = @roster["neighborhoods"] |> Enum.map(& &1["community_district"]) |> MapSet.new()
    missing = @community_districts |> Enum.reject(&MapSet.member?(present, &1))

    assert missing == [],
           "no neighborhood in community districts #{inspect(missing)} — a whole swathe of " <>
             "the borough is missing from the roster"
  end

  test "the roster is not trivially small" do
    assert length(@roster["neighborhoods"]) >= 80,
           "Queens runs to roughly 100 neighborhoods; a roster this short is a partial " <>
             "enumeration, not the borough"
  end

  # The scope decision, pinned. Without this the flag is 111 independent
  # booleans that any later edit can widen or narrow silently — and the thing
  # that would notice is the roster-equality gate, which is excluded until the
  # last in-scope neighborhood ships. This is the only assertion standing
  # between a scope change and nobody knowing.
  #
  # Source: docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md
  @in_scope ~w(
    astoria long-island-city ditmars-steinway flushing jackson-heights elmhurst
    corona sunnyside woodside forest-hills rego-park kew-gardens ridgewood
    glendale maspeth richmond-hill jamaica bayside douglaston rockaway-beach
    far-rockaway
  )

  test "exactly the committed in-scope neighborhoods are flagged" do
    flagged =
      @roster["neighborhoods"] |> Enum.filter(& &1["in_scope"]) |> Enum.map(& &1["slug"])

    assert Enum.sort(flagged) == Enum.sort(@in_scope),
           "in-scope set drifted from the spec — " <>
             "flagged but not committed: #{inspect(Enum.sort(flagged -- @in_scope))}; " <>
             "committed but not flagged: #{inspect(Enum.sort(@in_scope -- flagged))}"
  end

  test "every neighborhood carries an in_scope boolean" do
    for n <- @roster["neighborhoods"] do
      assert is_boolean(n["in_scope"]), "#{n["slug"]} has in_scope #{inspect(n["in_scope"])}"
    end
  end

  # The roster is the record of what the borough contains; the flag records
  # what this programme committed to. Trimming the out-of-scope rows would
  # destroy the only written account of what was deferred.
  test "the roster still names the whole borough" do
    assert length(@roster["neighborhoods"]) == 111
  end
end
