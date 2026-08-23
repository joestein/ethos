defmodule EthosWeb.ConnectedPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Links, Places}

  test "guide and place pages render grouped connected pages", %{conn: conn} do
    g = published_guide_fixture(%{title: "Woodbury Guide", destination: "Woodbury, Connecticut"})

    _p =
      Places.upsert_place!(%{
        slug: "glebe-house-x",
        name: "Glebe House X",
        kind: "museum",
        town: "Woodbury",
        state: "Connecticut",
        county: "Litchfield County",
        summary: "x"
      })

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "glebe-house-x"},
      kind: "shared-history",
      note: "Same parish story"
    })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Shared history"
    assert html =~ "Glebe House X"
    assert html =~ "Same parish story"

    html = build_conn() |> get(~p"/p/glebe-house-x") |> html_response(200)
    assert html =~ "Connected pages"
    assert html =~ "Woodbury Guide"
  end

  test "section absent when no links", %{conn: conn} do
    g = published_guide_fixture(%{title: "Lonely"})
    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)
    refute html =~ "Connected pages"
  end
end
