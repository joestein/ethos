defmodule Ethos.Seeds.BronxRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/bronx_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  test "the roster names a borough and its source" do
    assert @roster["borough"] == "Bronx"
    assert is_binary(@roster["source"]) and @roster["source"] != ""
  end

  test "every neighborhood carries the four dispatch keys, and no others" do
    for n <- @roster["neighborhoods"] do
      assert Enum.sort(Map.keys(n)) == ~w(community_district name slug wave)

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
end
