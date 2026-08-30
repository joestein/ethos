defmodule Ethos.Seeds.MlbClubsRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/mlb_clubs_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  test "one entry per club, no duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == 30
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate club slugs"

    names = Enum.map(@roster, & &1["club"])
    assert length(names) == length(Enum.uniq(names)), "duplicate club names"
  end

  test "every entry carries the seven keys, and no others" do
    for entry <- @roster do
      assert Enum.sort(Map.keys(entry)) ==
               ~w(city club county slug state venue verified),
             "unexpected key set on #{inspect(entry["slug"])}"

      assert is_binary(entry["club"]) and entry["club"] != ""
      assert is_binary(entry["slug"]) and entry["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_boolean(entry["verified"])
    end
  end

  # The venue fields are filled by verified research, never from recollection.
  # An entry is either fully resolved or fully unresolved — a half-filled row
  # means someone wrote down what they thought they knew and stopped.
  test "an entry is resolved together or not at all" do
    for entry <- @roster do
      venue_fields = [entry["venue"], entry["city"], entry["state"], entry["county"]]

      cond do
        entry["verified"] ->
          assert Enum.all?(venue_fields, &(is_binary(&1) and &1 != "")),
                 "#{entry["slug"]} is marked verified with a missing field"

        true ->
          assert Enum.all?(venue_fields, &is_nil/1),
                 "#{entry["slug"]} carries venue data without being verified"
      end
    end
  end
end
