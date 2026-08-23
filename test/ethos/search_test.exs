defmodule Ethos.SearchTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Places, Search}

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
      town: "Waterbury",
      state: "Connecticut",
      county: "New Haven County",
      summary: "Named for the brass heritage."
    })

    Places.upsert_place!(%{
      slug: "other-museum",
      name: "History Museum",
      kind: "museum",
      town: "Elsewhere",
      state: "Connecticut",
      county: "New Haven County",
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

  test "short and empty queries return empties" do
    assert Search.query("") == %{guides: [], places: []}
    assert Search.query("a") == %{guides: [], places: []}
    assert Search.query("   ") == %{guides: [], places: []}
  end
end
