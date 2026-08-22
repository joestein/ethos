defmodule Ethos.PlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places

  @valid %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "A 1922 Thomas Lamb theater on East Main Street.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open"
  }

  test "upsert_place! inserts, derives slugs, and is idempotent" do
    place = Places.upsert_place!(@valid)
    assert place.town_slug == "waterbury"
    assert place.state_slug == "connecticut"
    assert place.county_slug == "new-haven-county"
    assert place.status == "open"

    again = Places.upsert_place!(%{@valid | summary: "Updated."})
    assert again.id == place.id
    assert again.summary == "Updated."
    assert Repo.aggregate(Places.Place, :count) == 1
  end

  test "rejects bad kind, bad status, unsafe urls" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | kind: "castle"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | official_url: "javascript:alert(1)"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | status: "gone"})
    end
  end

  test "photos require attribution fields and /photos/ paths" do
    good = %{
      "src" => "/photos/ct/waterbury/palace-theater.jpg",
      "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
      "title" => "Palace Theater",
      "description" => "The marquee.",
      "author" => "Jane Doe",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
    }

    assert %{photos: [_]} = Places.upsert_place!(Map.put(@valid, :photos, [good]))

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(Map.put(@valid, :photos, [Map.delete(good, "license")]))
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(
        Map.put(@valid, :photos, [%{good | "src" => "https://evil.example/x.jpg"}])
      )
    end
  end

  test "list_places filters and count_open_places_in_county" do
    Places.upsert_place!(@valid)

    Places.upsert_place!(%{
      @valid
      | slug: "mattatuck-museum",
        name: "Mattatuck Museum",
        kind: "museum"
    })

    Places.upsert_place!(%{
      @valid
      | slug: "glebe-house",
        name: "Glebe House",
        kind: "museum",
        town: "Woodbury",
        county: "Litchfield County",
        status: "closed"
    })

    assert length(Places.list_places(town_slug: "waterbury")) == 2
    assert [%{name: "Mattatuck Museum"}] = Places.list_places(kind: "museum", status: "open")
    assert length(Places.list_places(kinds: ["museum", "theater"])) == 3
    assert Places.count_open_places_in_county("connecticut", "new-haven-county") == 2
    assert Places.count_open_places_in_county("connecticut", "litchfield-county") == 0
  end
end
