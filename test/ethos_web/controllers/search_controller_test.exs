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

  # A place result prints its geography, and that used to be the `town`/`state`
  # column pair. It is the destination node's name now, which `Ethos.Search`
  # preloads for exactly this — an unpreloaded association would be an
  # `Ecto.Association.NotLoaded` out of the template, and no other test renders
  # a place into this page.
  test "a place result names the destination node it is filed on", %{conn: conn} do
    node_path = "united-states/connecticut/new-haven-county/waterbury"
    Ethos.SeedDataHelpers.seed_destination_paths!([node_path])

    Ethos.Places.upsert_place!(%{
      slug: "brass-works",
      name: "Brass Works Brewing",
      kind: "brewery",
      destination_path: node_path,
      summary: "Named for the brass heritage."
    })

    html = conn |> get(~p"/search?q=brass") |> html_response(200)

    assert html =~ "Brass Works Brewing"
    assert html =~ "brewery · Waterbury"
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
