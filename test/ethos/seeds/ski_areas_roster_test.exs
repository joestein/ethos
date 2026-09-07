defmodule Ethos.Seeds.SkiAreasRosterTest do
  @moduledoc """
  The roster's own shape gate, separate from the corpus gate in
  `Ethos.Seeds.SkiSeedDataTest`.

  The roster is the authority on scope for the whole ski programme, and it is
  the thing every content wave slices its work out of. Its shape therefore has
  to be checkable before a single guide exists — this file lands with an empty
  `areas` list and every assertion here is a comprehension over it, so an empty
  roster passes vacuously except where a test says otherwise.

  Modelled on `Ethos.Seeds.MlbClubsRosterTest`, whose most valuable property is
  the "resolved together or not at all" rule: a half-filled row means somebody
  wrote down what they thought they knew and stopped, and a roster that sends a
  research agent to the wrong county is worse than one that sends it nowhere.
  """
  use ExUnit.Case, async: true

  @path "priv/seed_data/ski_areas_roster.json"
  @external_resource @path

  @statuses ~w(build drop)
  @region_statuses ~w(landed planned)
  @resolved_fields ~w(state county destination_path)

  defp roster, do: @path |> File.read!() |> Jason.decode!()
  defp regions, do: roster()["regions"]
  defp areas, do: roster()["areas"]

  test "the file is an object with the two blocks the corpus reads" do
    r = roster()
    assert is_list(r["regions"]), "regions must be a list"
    assert is_list(r["areas"]), "areas must be a list"
  end

  test "the seven regions are declared, each with an estimate and a status" do
    slugs = Enum.map(regions(), & &1["slug"])

    assert Enum.sort(slugs) ==
             ~w(alaska mid-atlantic midwest new-england pacific rockies southeast),
           "the seven regions of spec §8 are the seven regions of this file: #{inspect(slugs)}"

    for region <- regions() do
      assert is_binary(region["name"]) and region["name"] != ""
      assert is_integer(region["estimate"]) and region["estimate"] > 0
      assert region["status"] in @region_statuses, "#{region["slug"]}: #{region["status"]}"
      assert is_list(region["states"]) and region["states"] != []
    end
  end

  test "new-england is the landed region of this round" do
    landed = for r <- regions(), r["status"] == "landed", do: r["slug"]

    assert landed == ["new-england"],
           "Project A lands New England and nothing else; landed regions are #{inspect(landed)}"
  end

  test "every area row carries the keys the corpus reads, and no others" do
    for area <- areas() do
      assert Enum.sort(Map.keys(area)) ==
               ~w(county destination_path name note region slug state status town verified),
             "unexpected key set on #{inspect(area["slug"])}: #{inspect(Enum.sort(Map.keys(area)))}"

      assert is_binary(area["slug"]) and area["slug"] =~ ~r/^[a-z0-9-]+$/,
             "#{inspect(area["slug"])} is not a kebab-case slug"

      assert is_binary(area["name"]) and area["name"] != ""
      assert is_binary(area["note"]) and area["note"] != "", "#{area["slug"]}: note is blank"
      assert area["status"] in @statuses, "#{area["slug"]}: status #{inspect(area["status"])}"
      assert is_boolean(area["verified"]), "#{area["slug"]}: verified is not a boolean"
    end
  end

  test "every area names a region that is declared and landed" do
    landed = for r <- regions(), r["status"] == "landed", into: MapSet.new(), do: r["slug"]

    for area <- areas() do
      assert MapSet.member?(landed, area["region"]),
             "#{area["slug"]} names region #{inspect(area["region"])}, which is not landed — " <>
               "a row cannot be added before its region's project runs"
    end
  end

  test "every area's state is one its region declares" do
    states = Map.new(regions(), &{&1["slug"], MapSet.new(&1["states"])})

    for area <- areas(), area["verified"] do
      assert MapSet.member?(states[area["region"]], area["state"]),
             "#{area["slug"]} is in #{inspect(area["state"])}, which #{area["region"]} " <>
               "does not list"
    end
  end

  test "a row is resolved together or not at all" do
    for area <- areas() do
      values = Enum.map(@resolved_fields, &area[&1])

      if area["verified"] do
        assert Enum.all?(values, &(is_binary(&1) and &1 != "")),
               "#{area["slug"]} is marked verified with a missing field: " <>
                 inspect(Enum.zip(@resolved_fields, values))
      else
        assert Enum.all?(values, &is_nil/1),
               "#{area["slug"]} carries geography without being verified: " <>
                 inspect(Enum.zip(@resolved_fields, values))

        assert is_nil(area["town"]), "#{area["slug"]} carries a town without being verified"
      end
    end
  end

  # The rule that decides node depth (spec §3). A town node where the area sits
  # in an incorporated town, the county node otherwise — and the path must
  # actually end in the slugified town or county, not merely mention it.
  test "destination_path ends at the town where there is one and the county where there is not" do
    for area <- areas(), area["verified"] do
      last = area["destination_path"] |> String.split("/") |> List.last()

      expected =
        Ethos.Guides.Guide.derive_destination_slug(area["town"] || area["county"])

      assert last == expected,
             "#{area["slug"]}: path #{area["destination_path"]} ends in #{inspect(last)}, " <>
               "but the row's #{if area["town"], do: "town", else: "county"} slugifies to " <>
               inspect(expected)
    end
  end

  test "every destination_path names the state and county the row claims" do
    for area <- areas(), area["verified"] do
      segments = String.split(area["destination_path"], "/")

      assert Enum.at(segments, 0) == "united-states",
             "#{area["slug"]}: path does not start at united-states"

      assert Enum.at(segments, 1) == Ethos.Guides.Guide.derive_destination_slug(area["state"]),
             "#{area["slug"]}: path #{area["destination_path"]} disagrees with state " <>
               inspect(area["state"])

      assert Enum.at(segments, 2) == Ethos.Guides.Guide.derive_destination_slug(area["county"]),
             "#{area["slug"]}: path #{area["destination_path"]} disagrees with county " <>
               inspect(area["county"])
    end
  end

  test "slugs and names are unique" do
    slugs = Enum.map(areas(), & &1["slug"])

    assert length(slugs) == length(Enum.uniq(slugs)),
           "duplicate slugs: #{inspect(slugs -- Enum.uniq(slugs))}"

    names = Enum.map(areas(), & &1["name"])

    assert length(names) == length(Enum.uniq(names)),
           "duplicate names: #{inspect(names -- Enum.uniq(names))}"
  end

  # NOT vacuous, and deliberately so. This is the assertion that turns "we
  # researched New England" from a claim in a wave report into a fact, and it
  # is EXPECTED RED from the commit that creates the empty roster until Step 3
  # of this task lands the research. Every other test in this file must be
  # green; a second failure here is a real one.
  test "the New England research actually happened" do
    ne = for a <- areas(), a["region"] == "new-england", do: a

    assert length(ne) >= 60,
           "the roster holds #{length(ne)} New England rows; the spec estimates about 85 " <>
             "operating areas and 60 is the floor below which the research plainly did not finish"

    built = for a <- ne, a["status"] == "build", do: a
    assert built != [], "no New England row is marked build"

    unverified = for a <- built, not a["verified"], do: a["slug"]

    assert unverified == [],
           "these rows are marked build but not verified: #{inspect(unverified)}"

    dropped = for a <- ne, a["status"] == "drop", do: a

    assert dropped != [],
           "not one area was examined and excluded — New England has defunct hills, " <>
             "private club areas and Nordic-only centres, and a research pass that " <>
             "dropped none of them did not look at them"
  end
end
