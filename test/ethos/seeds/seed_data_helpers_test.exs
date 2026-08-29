defmodule Ethos.SeedDataHelpersTest do
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers

  @roster_path Path.expand("../../../priv/seed_data/brooklyn_roster.json", __DIR__)

  test "the brooklyn roster is 69 uniquely-slugged neighborhoods in eight waves" do
    roster = @roster_path |> File.read!() |> Jason.decode!()
    hoods = roster["neighborhoods"]

    assert length(hoods) == 69
    assert length(Enum.uniq_by(hoods, & &1["slug"])) == 69
    assert length(Enum.uniq_by(hoods, & &1["name"])) == 69
    assert Enum.map(hoods, & &1["wave"]) |> Enum.uniq() |> Enum.sort() == Enum.to_list(1..8)

    for h <- hoods do
      assert Regex.match?(~r/^[a-z0-9]+(-[a-z0-9]+)*$/, h["slug"]),
             "bad slug #{inspect(h["slug"])}"

      assert h["community_district"] in 1..18
    end
  end

  test "seed_files/1 finds committed seed files for a destination" do
    assert SeedDataHelpers.seed_files("manhattan") != []
    assert Enum.all?(SeedDataHelpers.seed_files("manhattan"), &String.ends_with?(&1, ".json"))
    assert SeedDataHelpers.seed_files("no-such-destination") == []
  end

  test "all_seed_files/0 walks the whole committed corpus" do
    # Every corpus-wide slug assertion passes vacuously if this ever returns [],
    # and that check is the only thing standing between a cross-destination slug
    # collision and a failure partway through a non-transactional production seed.
    assert length(SeedDataHelpers.all_seed_files()) > 200
  end

  test "all_seed_files/0 excludes destination-page content, which is not a guide file" do
    # priv/seed_data/destinations/*.json matches the wildcard glob but has no
    # guide/places/entries, so DataGuide.load!/1 raises on it and every caller
    # of all_seed_files/0 dies. Vacuous until the destination content ships,
    # and the reason three existing corpus tests do not break when it does.
    #
    # Enum.all?/2 over an empty list is true, so pin that there is in fact
    # destination content to exclude — otherwise this passes whether or not
    # the exclusion works.
    assert SeedDataHelpers.seed_files("destinations") != []

    assert Enum.all?(
             SeedDataHelpers.all_seed_files(),
             &(&1 |> Path.dirname() |> Path.basename() != "destinations")
           )
  end

  test "the committed corpus has no place-slug collisions" do
    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end
end
