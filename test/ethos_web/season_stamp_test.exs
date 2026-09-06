defmodule EthosWeb.SeasonStampTest do
  @moduledoc "async: false — admin_fixture/1 and a global season override."
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures

  test "the home page stamps the current season", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season=")
  end

  test "an override changes the stamp", %{conn: conn} do
    {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(data-season="winter")
    refute html =~ ~s(data-season="summer")
  end

  test "a rendered 404 still has a complete page", %{conn: conn} do
    # require_admin_user/2 RENDERS a 404 through the root layout rather than
    # raising, and Plan 4a put eight routes behind it. If the layout reads
    # @season on a response the plug never touched, every one of those 404s
    # becomes a 500.
    conn = log_in_user(conn, user_fixture())
    html = conn |> get(~p"/guides/new") |> html_response(404)

    assert html =~ ~s(data-season=")
  end
end
