defmodule EthosWeb.SitemapControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

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
end
