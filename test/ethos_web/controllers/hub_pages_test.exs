defmodule EthosWeb.HubPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  alias Ethos.Destinations
  alias Ethos.SeedDataHelpers

  defp node!(path) do
    SeedDataHelpers.seed_destination_paths!([path])
    Destinations.get_by_path(path)
  end

  defp guide_at(node, title) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, Connecticut",
      "destination_id" => node.id
    })
  end

  test "a region hub lists its counties and its own guides", %{conn: conn} do
    ct = node!("united-states/connecticut")
    node!("united-states/connecticut/new-haven-county")
    node!("united-states/connecticut/litchfield-county")
    guide_at(ct, "The Antique Trail")

    html = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)

    assert html =~ "Connecticut"
    assert html =~ "New Haven County"
    assert html =~ "Litchfield County"
    assert html =~ "The Antique Trail"
  end

  test "a town hub resolves at its own depth", %{conn: conn} do
    node!("italy/lazio/rome")
    html = conn |> get(~p"/destinations/italy/lazio/rome") |> html_response(200)
    assert html =~ "Rome"
  end

  test "a county hub lists that county's guides only", %{conn: conn} do
    new_haven = node!("united-states/connecticut/new-haven-county")
    litchfield = node!("united-states/connecticut/litchfield-county")

    guide_at(new_haven, "Waterbury")
    guide_at(litchfield, "Woodbury")

    html =
      conn
      |> get(~p"/destinations/united-states/connecticut/litchfield-county")
      |> html_response(200)

    assert html =~ "Woodbury"
    refute html =~ "Waterbury"
  end

  test "a path no node holds 404s", %{conn: conn} do
    node!("united-states/connecticut")

    assert conn
           |> get(~p"/destinations/united-states/connecticut/nope-county")
           |> html_response(404)
  end

  test "destinations index shows the countries section", %{conn: conn} do
    node!("united-states/connecticut")
    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "By country"
    assert html =~ "United States"
  end

  test "destinations index lists roots only, not the tiers below them", %{conn: conn} do
    node!("united-states/connecticut")
    node!("italy/lazio/rome")

    html = conn |> get(~p"/destinations") |> html_response(200)

    assert html =~ ~s(href="/destinations/united-states")
    assert html =~ ~s(href="/destinations/italy")
    refute html =~ ~s(href="/destinations/united-states/connecticut")
    refute html =~ ~s(href="/destinations/italy/lazio/rome")
  end

  # The sitemap used to be built from the guides' legacy state/county columns
  # and so emitted the pre-tree hub URLs. It is now one pass over the tree, and
  # the hubs it lists are the same hubs this file serves — at their node paths,
  # which is where they render, rather than at the legacy paths that 301.
  test "sitemap includes state and county hubs at their node paths", %{conn: conn} do
    node!("united-states/connecticut/new-haven-county")

    published_guide_fixture(%{
      "title" => "Waterbury",
      "destination" => "Waterbury, Connecticut",
      "state" => "Connecticut",
      "county" => "New Haven County"
    })

    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/destinations/united-states/connecticut</loc>"
    assert xml =~ "/destinations/united-states/connecticut/new-haven-county</loc>"

    refute xml =~ "/destinations/connecticut</loc>"
    refute xml =~ "/destinations/connecticut/new-haven-county</loc>"
  end
end
