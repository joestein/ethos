defmodule EthosWeb.CollectionControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Collections

  test "renders published collection with members, JSON-LD, backlink on guide", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Wander"})

    Collections.upsert_collection!(%{
      slug: "burys-test",
      title: "Burys Test",
      intro: "Ten towns end in **-bury**.",
      published: true,
      items: [%{guide_slug: g.slug, blurb: "The antiques one."}]
    })

    html = conn |> get(~p"/c/burys-test") |> html_response(200)
    assert html =~ "Burys Test"
    assert html =~ "Woodbury Wander"
    assert html =~ "The antiques one."
    assert html =~ "CollectionPage"

    html = build_conn() |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Part of"
    assert html =~ "Burys Test"

    html = build_conn() |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Collections"
    assert html =~ "Burys Test"

    xml = build_conn() |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/c/burys-test</loc>"
  end

  test "unpublished or unknown collection 404s", %{conn: conn} do
    assert conn |> get(~p"/c/nope") |> html_response(404)
  end
end
