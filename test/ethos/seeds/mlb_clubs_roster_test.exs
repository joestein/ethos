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

  # Shape is not attribution. Every assertion above passes if a resolved row
  # names a venue, city, state or county that disagrees with what actually
  # shipped — which is exactly the mutation the bare-places roster learned to
  # check for (docs/site-builder.md §2): membership alone leaves the fields a
  # later wave dispatches on unguarded, and a roster that sends an agent to the
  # wrong county is worse than one that sends it nowhere.
  #
  # So a resolved row is checked against the corpus on the whole tuple. This is
  # done now, with one row to get right, rather than at thirty when the rows
  # have to be reconciled instead of written.
  #
  # Matched on the venue place record rather than on the guide, because the
  # roster's four fields are place fields: the venue is a place, and its town,
  # state and county are the ones the destination hubs group by.
  test "a resolved roster row agrees with the place the corpus actually seeds" do
    resolved = Enum.filter(@roster, & &1["verified"])

    # Non-vacuous: at zero resolved rows every assertion below is skipped and
    # this test passes while checking nothing. The roster starts fully
    # unresolved, so without this the check would have shipped green and empty.
    assert resolved != [], "no resolved roster rows — this assertion is checking nothing"

    # Scoped to the ballparks region, and asserted collision-free before it is
    # built into a map.
    #
    # `into: %{}` keeps the last write silently, and place NAMES are not
    # unique: there is a global slug-uniqueness gate and no name gate, and the
    # code corpus already holds "Maggie McFly's" twice — connecticut_places.ex
    # :328 and :598, two different towns. Across thirty venues and a growing
    # code corpus, an unscoped name-keyed map would validate a roster row
    # against the wrong record: green on a wrong row, or red with a message
    # naming a place in another state. Every roster row passes through here.
    ballpark_places =
      for {place, owner} <- Ethos.Seeds.Catalog.places_owned(),
          owner.region == "ballparks",
          do: place

    names = Enum.map(ballpark_places, & &1.name)

    assert length(names) == length(Enum.uniq(names)),
           "two ballpark places share a name, so the map below would silently drop one: " <>
             inspect(names -- Enum.uniq(names))

    corpus = Map.new(ballpark_places, &{&1.name, {&1.town, &1.state, &1.county}})

    for entry <- resolved do
      slug = entry["slug"]

      assert Map.has_key?(corpus, entry["venue"]),
             "#{slug} names venue #{inspect(entry["venue"])}, which no seeded place matches"

      assert corpus[entry["venue"]] == {entry["city"], entry["state"], entry["county"]},
             "#{slug} disagrees with the corpus: roster has " <>
               inspect({entry["city"], entry["state"], entry["county"]}) <>
               ", the #{inspect(entry["venue"])} place record has " <>
               inspect(corpus[entry["venue"]])
    end
  end
end
