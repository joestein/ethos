defmodule Ethos.Seeds.BarePlacesRosterTest do
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # `mix test` re-requires every test file on each run, so @roster is re-read
  # regardless; this only matters under `mix test --stale`, which decides what
  # to recompile from the declared resources.
  @external_resource "priv/seed_data/bare_places_roster.json"

  @roster "priv/seed_data/bare_places_roster.json" |> File.read!() |> Jason.decode!()

  test "the roster is a snapshot of real places, without duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate slugs in the roster"
    assert length(slugs) == 424

    corpus = MapSet.new(corpus())

    misattributed =
      @roster
      |> Enum.map(&identity/1)
      |> Enum.reject(&MapSet.member?(corpus, &1))

    assert misattributed == [],
           "roster entries that match no corpus place on {slug, name, region, seed_file}: " <>
             explain(misattributed)
  end

  test "every roster entry carries the fields a wave dispatch needs" do
    for entry <- @roster do
      for key <- ~w(slug name kind town region seed_file) do
        assert is_binary(entry[key]) and entry[key] != "",
               "roster entry #{inspect(entry["slug"])} is missing #{key}"
      end
    end
  end

  # The roster is checked on the whole {slug, name, region, seed_file} tuple, not
  # on the slug alone. Membership alone would leave attribution unguarded: a
  # hand-edit that repointed one row's `seed_file` would still pass, and that is
  # the field ~850 wave runs dispatch on — the agent would open a file that does
  # not contain the slug, while Task 6's roster-exhaustion check still counted
  # the row as covered. Silent, in the one place we can least afford it.
  #
  # `kind` and `town` are deliberately not in the tuple: they are asserted
  # non-empty above, and a wave that rewrites a place may legitimately correct
  # either, which would then fail this test for doing its job. `seed_file`,
  # `region` and `name` identify *which record this is* and must not drift.
  defp corpus do
    json =
      for file <- SeedDataHelpers.all_seed_files(),
          place <- DataGuide.load!(file)["places"] do
        # Directory-qualified rather than by basename, following
        # SeedDataHelpers.assert_place_slugs_globally_unique!/0: two
        # destinations may hold the same basename.
        region = Path.basename(Path.dirname(file))

        {place["slug"], place["name"], region,
         Path.join(["priv/seed_data", region, Path.basename(file)])}
      end

    code =
      for {place, owner} <- SeedDataHelpers.code_places() do
        # Atom keys here, string keys above — the corpus has two shapes and each
        # is read through its own accessor rather than one normalising pass.
        # The region and seed_file come from the owning module rather than being
        # hardcoded, so a second places module is attributed to its own file.
        {place.slug, place.name, owner.region, owner.seed_file}
      end

    json ++ code
  end

  defp identity(entry),
    do: {entry["slug"], entry["name"], entry["region"], entry["seed_file"]}

  # A repointed seed_file reads as "no such place" otherwise, which sends the
  # reader hunting for a deleted record. Show what the corpus actually holds for
  # that slug, so the diff is the diagnosis.
  defp explain(entries) do
    Enum.map_join(entries, "; ", fn {slug, _, _, _} = entry ->
      actual = Enum.filter(corpus(), fn {s, _, _, _} -> s == slug end)
      "roster has #{inspect(entry)}, corpus has #{inspect(actual)}"
    end)
  end
end
