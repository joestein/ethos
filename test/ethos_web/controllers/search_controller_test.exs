defmodule EthosWeb.SearchControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  test "search page groups results and is noindex", %{conn: conn} do
    published_guide_fixture(%{"title" => "Harlem Heritage", "destination" => "Harlem, New York"})

    html = conn |> get(~p"/search?q=harlem") |> html_response(200)
    assert html =~ "Guides"
    assert html =~ "Harlem Heritage"
    assert html =~ ~s(<meta name="robots" content="noindex")
  end

  test "empty query renders the form without results", %{conn: conn} do
    html = conn |> get(~p"/search") |> html_response(200)
    assert html =~ "Search"
    refute html =~ "No results"
  end

  test "nav search box present on other pages", %{conn: conn} do
    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ ~s(action="/search")
  end

  test "array-valued q param does not crash the controller", %{conn: conn} do
    html = conn |> get("/search?q[]=x") |> html_response(200)
    assert html =~ "Search"
    refute html =~ "No results"
  end
end
