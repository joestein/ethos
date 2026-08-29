defmodule EthosWeb.DestinationControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  test "index lists destinations with published guides", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    guide_fixture(%{destination: "Oslo, Norway"})

    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Rome"
    refute html =~ "Oslo"
  end

  test "show lists that destination's published guides with breadcrumb ld", %{conn: conn} do
    g = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "Roman Holiday"
    assert html =~ "/g/#{g.slug}"
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(name="description")
  end

  test "a county hub lists full guides above orientation pages", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)

    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)

    assert html =~ "Orientation pages"
    assert html =~ "Townville"
  end

  test "destination pages emit OpenGraph tags", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    index = conn |> get(~p"/destinations") |> html_response(200)
    assert index =~ ~s(property="og:title")
    assert index =~ ~s(<meta property="og:title" content="Destinations")

    town = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert town =~ ~s(<meta property="og:title" content="Rome travel guides")
    assert town =~ ~s(property="og:url")
    assert town =~ ~s(property="og:description")
    refute town =~ ~s(property="og:image")
  end

  test "state and county destination pages emit OpenGraph tags", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    state = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    assert state =~ ~s(<meta property="og:title" content="Connecticut travel guides")

    county = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)
    assert county =~ ~s(property="og:title")
    assert county =~ "Windham County"
  end

  test "404 for unknown destination", %{conn: conn} do
    assert conn |> get(~p"/destinations/nowhere") |> response(404)
  end
end
