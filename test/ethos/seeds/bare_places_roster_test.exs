defmodule Ethos.Seeds.BarePlacesRosterTest do
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # The roster is read at compile time, so the file must also be a compile-time
  # dependency — otherwise editing it leaves this module stale and the suite
  # keeps asserting against the roster as it was when the test last compiled.
  @external_resource "priv/seed_data/bare_places_roster.json"

  @roster "priv/seed_data/bare_places_roster.json" |> File.read!() |> Jason.decode!()

  test "the roster is a snapshot of real places, without duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate slugs in the roster"
    assert length(slugs) == 424

    corpus =
      for(f <- SeedDataHelpers.all_seed_files(), p <- DataGuide.load!(f)["places"], do: p["slug"]) ++
        Enum.map(Ethos.Seeds.ConnecticutPlaces.places(), & &1.slug)

    missing = Enum.reject(slugs, &(&1 in corpus))

    assert missing == [],
           "roster names places that are not in the corpus: #{inspect(missing)}"
  end

  test "every roster entry carries the fields a wave dispatch needs" do
    for entry <- @roster do
      for key <- ~w(slug name kind town region seed_file) do
        assert is_binary(entry[key]) and entry[key] != "",
               "roster entry #{inspect(entry["slug"])} is missing #{key}"
      end
    end
  end
end
