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
  # roster's four fields describe the venue: it is a place, and the destination
  # hubs group by what its node derives.
  #
  # The corpus no longer stores a town/state/county triple — a place names a
  # destination node and the loaders derive the triple from that node's
  # ancestry — so the three checks below read the node instead:
  #
  #   * `state` against the node's `region` ancestor, by name;
  #   * `city` against the node's own path segment, which is what the roster's
  #     city slugifies to. `Bronx` in the roster and `The Bronx` in the tree are
  #     the same borough spelled two ways, and the segment `bronx` is what both
  #     agree on;
  #   * `county` against the source of the two modules that publish the venue.
  #     The ballparks model no county tier, so there is no field left to compare
  #     a county against — but the county is still a verified research fact, and
  #     a roster row claiming one the corpus never mentions is the same
  #     mis-dispatch this test was written to catch. Nothing else would say so.
  # A roster row's "state" is the node's nearest `region` ancestor — Illinois for
  # Wrigley, Ontario for the Rogers Centre. Read nearest-first off the trail,
  # the same rule `StructuredData.postal_address/2` follows for addressRegion,
  # rather than from a column: there is no column left, and there was never a
  # second place for the two to disagree.
  defp region_name(trail) do
    trail
    |> Enum.reverse()
    |> Enum.find_value(fn d -> if d.kind == "region", do: d.name end)
  end

  test "a resolved roster row agrees with the node the corpus actually seeds" do
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
          do: {place, owner}

    names = Enum.map(ballpark_places, fn {p, _o} -> p.name end)

    assert length(names) == length(Enum.uniq(names)),
           "two ballpark places share a name, so the map below would silently drop one: " <>
             inspect(names -- Enum.uniq(names))

    corpus =
      Map.new(ballpark_places, fn {p, o} -> {p.name, {p[:destination_path], o.seed_file}} end)

    trails = Ethos.SeedDataHelpers.destination_trails()

    for entry <- resolved do
      slug = entry["slug"]

      assert Map.has_key?(corpus, entry["venue"]),
             "#{slug} names venue #{inspect(entry["venue"])}, which no seeded place matches"

      {path, places_file} = corpus[entry["venue"]]
      region = region_name(Map.fetch!(trails, path))

      assert region == entry["state"],
             "#{slug} disagrees with the corpus: roster has state " <>
               inspect(entry["state"]) <> ", node #{path} sits in " <> inspect(region)

      city_segment = path |> String.split("/") |> List.last()

      assert city_segment == Ethos.Guides.Guide.derive_destination_slug(entry["city"]),
             "#{slug} disagrees with the corpus: roster has city " <>
               inspect(entry["city"]) <>
               ", the #{inspect(entry["venue"])} place hangs from " <>
               path

      # Both modules, because the county is documented in whichever of the pair
      # the research put it in: ten venues name it only in the guide's
      # moduledoc, the rest in the places module.
      guide_file = String.replace_suffix(places_file, "_places.ex", "_guide.ex")

      assert File.exists?(guide_file),
             "#{places_file} has no paired guide module at #{guide_file}, so this check " <>
               "would silently read half the corpus"

      source = File.read!(places_file) <> File.read!(guide_file)

      assert String.contains?(source, entry["county"]),
             "#{slug}'s roster county #{inspect(entry["county"])} appears nowhere in " <>
               "#{Path.basename(places_file)} or #{Path.basename(guide_file)} — the corpus " <>
               "no longer models a county tier, so those two modules are the only record " <>
               "the roster can be checked against"
    end
  end

  # The set is finished, and this is what makes "finished" a fact rather than a
  # claim in a wave report.
  #
  # Every assertion above is satisfied by a roster that is half unresolved: the
  # shape check passes on a `null` row, the together-or-not-at-all check passes
  # on a row with nothing in it, and the attribution check only walks the rows
  # that happen to be resolved. That was correct while the waves were in flight
  # — a partially researched roster had to stay green — and it is exactly wrong
  # now. Three waves resolved thirty rows; without this, a thirty-first change
  # could blank one and nothing would say so.
  #
  # The second half is the part a count alone would miss. The roster is one
  # list of thirty venue names and `Ethos.Seeds.Catalog` is another, built from
  # the `stadium` places the ballparks region actually seeds, and nothing
  # previously asserted that the two name the same thirty venues. A roster row
  # pointing at a venue the corpus does not seed is caught by the attribution
  # test above; a *seeded* ballpark that no roster row names is not, and that
  # is the direction a thirty-first ballpark would fail in.
  test "all thirty clubs are resolved, against the thirty stadiums the corpus seeds" do
    unresolved = for entry <- @roster, not entry["verified"], do: entry["slug"]

    assert unresolved == [],
           "the MLB set is complete; these club rows are unresolved: #{inspect(unresolved)}"

    roster_venues = @roster |> Enum.map(& &1["venue"]) |> Enum.sort()

    seeded_venues =
      for {place, owner} <- Ethos.Seeds.Catalog.places_owned(),
          owner.region == "ballparks",
          place.kind == "stadium",
          do: place.name

    assert length(roster_venues) == 30

    assert roster_venues == Enum.sort(seeded_venues),
           "the roster and the seeded ballparks disagree — in the roster only: " <>
             inspect(roster_venues -- seeded_venues) <>
             ", seeded only: " <> inspect(seeded_venues -- roster_venues)
  end
end
