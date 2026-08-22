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
    booking_url: nil,
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

  test "closed place shows banner, no booking CTA", %{conn: conn} do
    Places.upsert_place!(%{@attrs | status: "closed", booking_url: "https://example.com/book"})
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)
    assert html =~ "Permanently closed"
    refute html =~ "https://example.com/book"
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

  test "sitemap includes place urls", %{conn: conn} do
    Places.upsert_place!(@attrs)
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/p/palace-theater-waterbury</loc>"
  end
end
