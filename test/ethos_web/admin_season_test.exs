defmodule EthosWeb.AdminSeasonTest do
  @moduledoc "async: false — admin_fixture/1 inserts the configured admin email."
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures

  describe "as the admin" do
    setup %{conn: conn}, do: %{conn: log_in_user(conn, admin_fixture())}

    test "the season page lists every season plus Auto", %{conn: conn} do
      html = conn |> get(~p"/admin/season") |> html_response(200)

      for label <- ~w(Auto Spring Summer Autumn Winter) do
        assert html =~ label
      end
    end

    test "choosing a season sets the override", %{conn: conn} do
      conn = post(conn, ~p"/admin/season", %{"season" => "winter"})

      assert redirected_to(conn) == ~p"/admin/season"
      assert Ethos.SiteSettings.season_override() == :winter
    end

    test "choosing Auto clears it", %{conn: conn} do
      {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

      post(conn, ~p"/admin/season", %{"season" => "auto"})

      assert Ethos.SiteSettings.season_override() == nil
    end

    test "a junk season is refused rather than stored", %{conn: conn} do
      post(conn, ~p"/admin/season", %{"season" => "monsoon"})

      assert Ethos.SiteSettings.season_override() == nil
    end
  end

  test "a regular user gets a 404", %{conn: conn} do
    conn = log_in_user(conn, user_fixture())

    assert conn |> get(~p"/admin/season") |> html_response(404)
  end

  test "a logged-out visitor is redirected to log in, not 404ed", %{conn: conn} do
    assert conn |> get(~p"/admin/season") |> redirected_to() == ~p"/users/log_in"
  end
end
