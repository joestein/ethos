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
end
