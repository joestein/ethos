defmodule EthosWeb.AdminFoliageTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures

  defp admin_conn(_) do
    admin = user_fixture(%{email: "cryptcom@gmail.com"})
    %{conn: log_in_user(build_conn(), admin), admin: admin}
  end

  describe "GET /admin/foliage/notes" do
    test "redirects an anonymous visitor to log in", %{conn: conn} do
      conn = get(conn, ~p"/admin/foliage/notes")
      assert redirected_to(conn) == ~p"/users/log_in"
    end

    test "404s for a signed-in non-admin", %{conn: conn} do
      conn = conn |> log_in_user(user_fixture())
      assert conn |> get(~p"/admin/foliage/notes") |> html_response(404)
    end

    test "renders the form for an admin", _context do
      %{conn: conn} = admin_conn(nil)
      html = conn |> get(~p"/admin/foliage/notes") |> html_response(200)
      assert html =~ "Field notes"
    end
  end

  describe "POST /admin/foliage/notes" do
    setup :admin_conn

    test "creates a statewide note", %{conn: conn} do
      params = %{
        "note" => %{
          "scope" => "statewide",
          "published_on" => "2026-10-09",
          "body" => "The Route 6 maples east of the lake turned late last week."
        }
      }

      conn = post(conn, ~p"/admin/foliage/notes", params)
      assert redirected_to(conn) == ~p"/admin/foliage/notes"
      assert Ethos.Foliage.latest_note("statewide")
    end

    test "creates a route note", %{conn: conn} do
      params = %{
        "note" => %{
          "scope" => "route",
          "ref" => "hartford-west",
          "published_on" => "2026-10-09",
          "body" => "The Hartford West stretch is running about a week ahead of normal."
        }
      }

      conn = post(conn, ~p"/admin/foliage/notes", params)
      assert redirected_to(conn) == ~p"/admin/foliage/notes"
      assert Ethos.Foliage.latest_note("route", "hartford-west")
    end

    test "rerenders with errors on invalid input", %{conn: conn} do
      params = %{"note" => %{"scope" => "statewide", "published_on" => "", "body" => "short"}}
      assert conn |> post(~p"/admin/foliage/notes", params) |> html_response(200) =~ "Field notes"
    end
  end
end
