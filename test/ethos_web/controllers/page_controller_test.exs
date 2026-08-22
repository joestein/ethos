defmodule EthosWeb.PageControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "GET / shows hero and CTA without any guides", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)
    assert html =~ "Turn your trip into a guide"
    assert html =~ "Make your guide"
  end

  test "GET / features a published guide when one exists", %{conn: conn} do
    guide = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(guide)

    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Featured Lisbon"
  end

  test "GET / lists latest guides besides the featured one, with destinations link", %{conn: conn} do
    featured = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(featured)
    published_guide_fixture(%{title: "Waterbury Weekend", destination: "Waterbury, Connecticut"})

    html = conn |> get(~p"/") |> html_response(200)
    assert html =~ "Latest guides"
    assert html =~ "Waterbury Weekend"
    assert html =~ "Browse all destinations"
    # the featured guide is not duplicated in the latest list
    assert length(String.split(html, "Featured Lisbon")) == 2
  end
end
