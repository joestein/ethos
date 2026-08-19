defmodule EthosWeb.SitemapControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "lists landing, destinations, hubs, and published guides", %{conn: conn} do
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Oslo, Norway"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert response_content_type(conn, :xml) =~ "xml"
    assert body =~ url(~p"/")
    assert body =~ url(~p"/destinations")
    assert body =~ url(~p"/destinations/rome")
    assert body =~ url(~p"/g/#{g.slug}")
    refute body =~ "oslo"
    assert body =~ "<lastmod>"
  end

  test "includes /photos for photo-bearing published guides only", %{conn: conn} do
    with_photos = published_guide_fixture(%{destination: "Rome, Italy"})

    {:ok, with_photos} =
      Guides.update_guide_photos(with_photos, [
        %{
          "src" => "/photos/rome/trevi-fountain.jpg",
          "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
          "title" => "Trevi Fountain",
          "description" => "Oceanus in afternoon sun."
        }
      ])

    without_photos = published_guide_fixture(%{destination: "Lisbon, Portugal"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert body =~ url(~p"/g/#{with_photos.slug}/photos")
    refute body =~ url(~p"/g/#{without_photos.slug}/photos")
  end
end
