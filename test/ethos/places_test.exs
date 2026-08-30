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

  describe "list_siblings/2" do
    test "returns other open places in the same town, by name, excluding itself" do
      palace = Places.upsert_place!(@valid)

      mattatuck =
        Places.upsert_place!(%{
          @valid
          | slug: "mattatuck-museum",
            name: "Mattatuck Museum",
            kind: "museum"
        })

      _other_town =
        Places.upsert_place!(%{
          @valid
          | slug: "glebe-house",
            name: "Glebe House",
            kind: "museum",
            town: "Woodbury",
            county: "Litchfield County"
        })

      _closed =
        Places.upsert_place!(%{
          @valid
          | slug: "abbots-frozen-custard",
            name: "Abbots",
            kind: "restaurant",
            status: "closed"
        })

      assert [%{slug: "mattatuck-museum"}] = Places.list_siblings(palace)
      assert [%{slug: "palace-theater-waterbury"}] = Places.list_siblings(mattatuck)
    end

    # `town_slug` is not a town. Washington, Connecticut and Washington,
    # District of Columbia both derive `town_slug: "washington"`, as do Madison,
    # Connecticut and Madison, Brooklyn — so a town-only filter put Nationals
    # Park in a Litchfield County town's "More in Washington", and Connecticut
    # museums in Nationals Park's. Twelve pages of wrong geography, no error.
    test "two towns of the same name in different states are not siblings" do
      ct =
        Places.upsert_place!(%{
          @valid
          | slug: "gunn-historical-museum",
            name: "Gunn Historical Museum",
            kind: "museum",
            town: "Washington",
            state: "Connecticut",
            county: "Litchfield County"
        })

      dc =
        Places.upsert_place!(%{
          @valid
          | slug: "nationals-park",
            name: "Nationals Park",
            kind: "stadium",
            town: "Washington",
            state: "District of Columbia",
            county: "District of Columbia"
        })

      assert ct.town_slug == dc.town_slug
      assert Places.list_siblings(ct) == []
      assert Places.list_siblings(dc) == []

      same_town =
        Places.upsert_place!(%{
          @valid
          | slug: "gw-tavern",
            name: "G.W. Tavern",
            kind: "restaurant",
            town: "Washington",
            state: "Connecticut",
            county: "Litchfield County"
        })

      assert [%{slug: "gw-tavern"}] = Places.list_siblings(ct)
      assert [%{slug: "gunn-historical-museum"}] = Places.list_siblings(same_town)
      assert Places.list_siblings(dc) == []
    end

    test "returns [] for a town with only one place" do
      only = Places.upsert_place!(@valid)
      assert Places.list_siblings(only) == []
    end

    test "caps the number of siblings returned" do
      for n <- 1..12 do
        Places.upsert_place!(%{
          @valid
          | slug: "waterbury-place-#{n}",
            name: "Waterbury Place #{String.pad_leading(to_string(n), 2, "0")}"
        })
      end

      anchor = Places.get_place_by_slug!("waterbury-place-1")

      siblings = Places.list_siblings(anchor)
      assert length(siblings) == 8
      refute Enum.any?(siblings, &(&1.id == anchor.id))

      assert Places.list_siblings(anchor, limit: 3) |> length() == 3
    end
  end
end
