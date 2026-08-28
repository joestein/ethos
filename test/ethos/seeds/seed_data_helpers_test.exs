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

  test "the committed corpus has no place-slug collisions" do
    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end
end
