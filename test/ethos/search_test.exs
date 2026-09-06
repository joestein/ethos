defmodule Ethos.SearchTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Places, Search}

  @waterbury "united-states/connecticut/new-haven-county/waterbury"

  test "finds published guides and places by words; name matches rank first" do
    published_guide_fixture(%{
      "title" => "Brass City Weekend",
      "destination" => "Waterbury, Connecticut"
    })

    draft = guide_fixture(%{"title" => "Brass Unpublished"})

    Places.upsert_place!(%{
      slug: "brass-works",
      name: "Brass Works Brewing",
      kind: "brewery",
      summary: "Named for the brass heritage."
    })

    Places.upsert_place!(%{
      slug: "other-museum",
      name: "History Museum",
      kind: "museum",
      summary: "A museum that mentions brass once."
    })

    %{guides: guides, places: places} = Search.query("brass")
    assert Enum.map(guides, & &1.title) == ["Brass City Weekend"]
    refute Enum.any?(guides, &(&1.id == draft.id))
    assert List.first(places).slug == "brass-works"
    assert Enum.any?(places, &(&1.slug == "other-museum"))
  end

  test "quoted phrase narrows results to that exact word order" do
    published_guide_fixture(%{title: "Cast Iron District Guide"})
    published_guide_fixture(%{title: "Iron Cast Backwards"})

    %{guides: guides} = Search.query(~s("cast iron"))

    assert Enum.map(guides, & &1.title) == ["Cast Iron District Guide"]
  end

  test "a place is found by the name of the destination node it sits in" do
    # `places.town` was in the FTS vector before the tree, so "Waterbury" found
    # the town's places. Nothing on the place row spells its geography any more
    # — the node does — so without the join in `search_places/2` this returns
    # nothing at all, at HTTP 200, with a search box that looks like it works.
    Ethos.SeedDataHelpers.seed_destination_paths!([@waterbury])

    Places.upsert_place!(%{
      slug: "timexpo-museum",
      name: "Timexpo Museum",
      kind: "museum",
      summary: "Clockmaking on the Naugatuck.",
      destination_path: @waterbury
    })

    Places.upsert_place!(%{
      slug: "elsewhere-diner",
      name: "Elsewhere Diner",
      kind: "restaurant",
      summary: "Nowhere near it."
    })

    %{places: places} = Search.query("Waterbury")

    slugs = Enum.map(places, & &1.slug)
    assert "timexpo-museum" in slugs
    refute "elsewhere-diner" in slugs
  end

  test "short and empty queries return empties" do
    assert Search.query("") == %{guides: [], places: []}
    assert Search.query("a") == %{guides: [], places: []}
    assert Search.query("   ") == %{guides: [], places: []}
  end
end
