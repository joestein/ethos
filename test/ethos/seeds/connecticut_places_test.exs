defmodule Ethos.Seeds.ConnecticutPlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places
  alias Ethos.Seeds.ConnecticutPlaces

  test "upsert_all! is idempotent and seeds all towns" do
    first = ConnecticutPlaces.upsert_all!()
    second = ConnecticutPlaces.upsert_all!()
    assert length(first) == length(second)
    assert length(first) == 50
    assert Repo.aggregate(Places.Place, :count) == 50

    assert %{kind: "theater", county_slug: "new-haven-county"} =
             Places.get_place_by_slug!("palace-theater-waterbury")

    assert %{kind: "bnb", county_slug: "litchfield-county"} =
             Places.get_place_by_slug!("1754-house-woodbury")

    for town <- ~w(waterbury middlebury danbury southbury woodbury) do
      assert Places.list_places(town_slug: town) != []
    end
  end
end
