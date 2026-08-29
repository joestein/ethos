defmodule EthosWeb.PlaceControllerTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.Places

  @attrs %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "A 1922 Thomas Lamb movie palace.",
    history: "Designed by **Thomas Lamb**.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open",
    photos: [
      %{
        "src" => "/photos/ct/waterbury/palace-theater.jpg",
        "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
        "title" => "Palace Theater",
        "description" => "The marquee.",
        "author" => "Jane Doe",
        "license" => "CC BY-SA 4.0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
      }
    ]
  }

  test "renders place with JSON-LD type, attribution, breadcrumb", %{conn: conn} do
    Places.upsert_place!(@attrs)
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    assert html =~ "Palace Theater"
    assert html =~ "PerformingArtsTheater"
    assert html =~ "BreadcrumbList"
    assert html =~ "Jane Doe"
    assert html =~ "CC BY-SA 4.0"
    assert html =~ ~s(rel="nofollow noopener")
    assert html =~ "data-copy-url"
    assert html =~ "og:image"
  end

  test "closed place shows the banner", %{conn: conn} do
    Places.upsert_place!(%{@attrs | status: "closed"})
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)
    assert html =~ "Permanently closed"
  end

  test "unknown slug 404s", %{conn: conn} do
    assert conn |> get(~p"/p/nope") |> html_response(404)
  end

  test "restaurant kind maps to Restaurant JSON-LD", %{conn: conn} do
    Places.upsert_place!(%{
      @attrs
      | slug: "dine-x",
        name: "Dine X",
        kind: "restaurant",
        photos: []
    })

    html = conn |> get(~p"/p/dine-x") |> html_response(200)
    assert html =~ ~s("@type":"Restaurant")
  end

  test "renders a 'More in this town' section listing sibling places", %{conn: conn} do
    Places.upsert_place!(@attrs)

    Places.upsert_place!(%{
      @attrs
      | slug: "mattatuck-museum",
        name: "Mattatuck Museum",
        kind: "museum",
        photos: []
    })

    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    assert html =~ "More in Waterbury"
    assert html =~ "Mattatuck Museum"
    assert html =~ ~s(href="/p/mattatuck-museum")
  end

  test "a place with no siblings renders no 'More in' heading", %{conn: conn} do
    Places.upsert_place!(@attrs)

    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    refute html =~ "More in Waterbury"
    refute html =~ "More in "
  end

  defp place_ld(html, place) do
    json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))
  end

  test "PostalAddress is decomposed, not stuffed", %{conn: conn} do
    place =
      Places.upsert_place!(%{
        @attrs
        | slug: "bethlehem-green",
          name: "Bethlehem Green",
          address: "9 Main Street North, Bethlehem, CT 06751",
          town: "Bethlehem",
          state: "CT",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    # Without these two the block is an untyped object of unknown country to
    # every consumer, and nothing else in the suite pins them.
    assert address["@type"] == "PostalAddress"
    assert address["addressCountry"] == "US"

    assert address["streetAddress"] == "9 Main Street North"
    assert address["addressLocality"] == "Bethlehem"
    assert address["addressRegion"] == "CT"
    assert address["postalCode"] == "06751"
    refute String.contains?(address["streetAddress"], "Bethlehem")
  end

  test "locality and region come from the columns even when the address disagrees",
       %{conn: conn} do
    # The corpus's real divergence shape, and by far its most common: 840 of
    # 2,066 addressed places parse a locality that differs from their town
    # column. A neighbourhood place carries the borough in its address. Both
    # values are present and they disagree — which is the case that tells the
    # column rule apart from "the parse happened to be nil".
    place =
      Places.upsert_place!(%{
        @attrs
        | slug: "bushwick-inlet",
          name: "Bushwick Inlet Park",
          kind: "park",
          address: "86 Kent Avenue, Brooklyn, NY 11249",
          town: "Bushwick",
          state: "New York",
          county: "Kings County",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    assert address["addressLocality"] == "Bushwick"
    assert address["addressRegion"] == "New York"
    # Not the parse's "Brooklyn"/"NY", which is what the address itself says.
    refute address["addressLocality"] == "Brooklyn"
    refute address["addressRegion"] == "NY"
    # The street line is still decomposed correctly alongside the disagreement.
    assert address["streetAddress"] == "86 Kent Avenue"
    assert address["postalCode"] == "11249"
  end

  test "a descriptive location omits streetAddress rather than publishing a false one",
       %{conn: conn} do
    place =
      Places.upsert_place!(%{
        @attrs
        | slug: "greenwich-shore",
          name: "Greenwich Shore",
          address: "Along Shore Road, Greenwich, CT 06830",
          town: "Greenwich",
          state: "CT",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Greenwich"
    assert address["addressRegion"] == "CT"
    assert address["postalCode"] == "06830"
  end

  test "an address that does not decompose omits streetAddress rather than republishing itself",
       %{conn: conn} do
    raw = "Irving Ave. and Knickerbocker Ave., between Starr St. and Suydam St., Brooklyn"

    place =
      Places.upsert_place!(%{
        @attrs
        | slug: "irving-square",
          name: "Irving Square",
          address: raw,
          town: "Brooklyn",
          state: "NY",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Brooklyn"
    assert address["addressRegion"] == "NY"
    # This string carries no five-digit code, so there is no postal code to
    # recover from it either. See the sibling test below for the corpus's more
    # common case, where the postal scan still succeeds on an address the
    # full-address match rejects.
    refute Map.has_key?(address, "postalCode")

    # The whole address string is still on the page, where a human reads it.
    assert html =~ "Irving Ave. and Knickerbocker Ave."
  end

  test "an undecomposable address still publishes the postal code found inside it",
       %{conn: conn} do
    place =
      Places.upsert_place!(%{
        @attrs
        | slug: "burnap-brook",
          name: "Burnap Brook Preserve",
          address:
            "Trailhead parking on Burnap Brook Road, Andover, CT 06232; " <>
              "additional access on Wales Road and Lake Road",
          town: "Andover",
          state: "CT",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Andover"
    assert address["postalCode"] == "06232"
  end

  test "a place with no address emits no PostalAddress at all", %{conn: conn} do
    place =
      Places.upsert_place!(%{@attrs | slug: "no-address", address: nil, photos: []})

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    refute Map.has_key?(place_ld(html, place), "address")
  end

  test "official_url is published as sameAs", %{conn: conn} do
    place = Places.upsert_place!(@attrs)
    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    ld = place_ld(html, place)

    assert ld["sameAs"] == ["https://palacetheaterct.org"]
    # `url` stays on our own canonical page: repointing it at the business's
    # site would make it ambiguous which page represents the entity.
    assert ld["url"] =~ "/p/#{place.slug}"
  end

  test "a place with no official_url emits no sameAs", %{conn: conn} do
    place = Places.upsert_place!(%{@attrs | slug: "no-site", official_url: nil, photos: []})
    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    refute Map.has_key?(place_ld(html, place), "sameAs")
  end

  test "sitemap includes place urls", %{conn: conn} do
    Places.upsert_place!(@attrs)
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/p/palace-theater-waterbury</loc>"
  end
end
