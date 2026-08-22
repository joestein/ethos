defmodule EthosWeb.HubPagesTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  defp ct_guide(title, county) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, Connecticut",
      "state" => "Connecticut",
      "county" => county
    })
  end

  test "state hub lists counties and guides", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    ct_guide("Woodbury", "Litchfield County")

    html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    assert html =~ "Connecticut"
    assert html =~ "New Haven County"
    assert html =~ "Litchfield County"
    assert html =~ "Waterbury"
  end

  test "town hub still resolves when slug is not a state", %{conn: conn} do
    published_guide_fixture(%{"title" => "Rome trip", "destination" => "Rome, Italy"})
    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "Rome"
  end

  test "county hub lists that county's guides only", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    ct_guide("Woodbury", "Litchfield County")

    html =
      conn |> get(~p"/destinations/connecticut/litchfield-county") |> html_response(200)

    assert html =~ "Woodbury"
    refute html =~ "Waterbury"
  end

  test "unknown county hub 404s", %{conn: conn} do
    assert conn |> get(~p"/destinations/connecticut/nope-county") |> html_response(404)
  end

  test "destinations index shows states section", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Connecticut"
  end

  test "sitemap includes state, county hubs", %{conn: conn} do
    ct_guide("Waterbury", "New Haven County")
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/destinations/connecticut</loc>"
    assert xml =~ "/destinations/connecticut/new-haven-county</loc>"
  end
end
