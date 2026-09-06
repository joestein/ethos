defmodule Ethos.Seeds.SteakhouseRosterTest do
  use ExUnit.Case, async: true

  @roster Path.join(["priv", "seed_data", "steakhouse_roster.json"])
  @statuses ~w(build drop)

  defp roster, do: @roster |> File.read!() |> Jason.decode!()

  test "every row carries the keys the corpus reads" do
    for row <- roster() do
      for key <- ~w(slug city path status note) do
        assert is_binary(row[key]) and row[key] != "",
               "#{row["slug"]}: #{key} is missing or blank"
      end
    end
  end

  test "every status is one the corpus understands" do
    for row <- roster() do
      assert row["status"] in @statuses or
               String.starts_with?(row["status"], "merged-into:"),
             "#{row["slug"]} has status #{inspect(row["status"])}"
    end
  end

  test "a merge names a row that is itself built" do
    rows = roster()
    built = for r <- rows, r["status"] == "build", into: MapSet.new(), do: r["slug"]

    for r <- rows, String.starts_with?(r["status"], "merged-into:") do
      target = String.replace_prefix(r["status"], "merged-into:", "")

      assert MapSet.member?(built, target),
             "#{r["slug"]} merges into #{target}, which is not a built page"
    end
  end

  test "slugs are unique" do
    slugs = Enum.map(roster(), & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs))
  end

  test "the wave actually measured something" do
    rows = roster()
    assert length(rows) >= 10, "the wave returned #{length(rows)} rows for fourteen candidates"
    assert Enum.any?(rows, &(&1["status"] == "build"))
  end
end
