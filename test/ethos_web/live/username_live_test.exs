defmodule EthosWeb.UsernameLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures

  describe "/users/username" do
    test "redirects a logged-out visitor to log in", %{conn: conn} do
      assert {:error, {:redirect, %{to: "/users/log_in"}}} = live(conn, ~p"/users/username")
    end

    test "renders the picker empty, not prefilled with the current name", %{conn: conn} do
      user = user_fixture(%{username: "user123"})
      {:ok, _lv, html} = conn |> log_in_user(user) |> live(~p"/users/username")

      assert html =~ "Pick your username"
      refute html =~ ~s(value="user123")
    end

    test "saves a valid username and clears the provisional flag", %{conn: conn} do
      # Bypass the changeset deliberately: username_changeset/3 always clears
      # this flag, so the only way to set up a backfilled user is to write it
      # directly, the way the migration does.
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      result =
        lv
        |> form("#username_form", user: %{"username" => "voyager"})
        |> render_submit()

      assert {:error, {:redirect, %{to: "/"}}} = result

      reloaded = Ethos.Accounts.get_user!(user.id)
      assert reloaded.username == "voyager"
      refute reloaded.username_provisional
    end

    test "shows an error for a reserved username", %{conn: conn} do
      user = user_fixture()
      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      html =
        lv
        |> form("#username_form", user: %{"username" => "admin"})
        |> render_submit()

      assert html =~ "is reserved"
    end

    test "shows an error for a username someone else holds", %{conn: conn} do
      user_fixture(%{username: "voyager"})
      user = user_fixture()
      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      html =
        lv
        |> form("#username_form", user: %{"username" => "voyager"})
        |> render_submit()

      assert html =~ "has already been taken"
    end

    test "shows an error for the admin's public username", %{conn: conn} do
      user = user_fixture()
      {:ok, lv, _html} = conn |> log_in_user(user) |> live(~p"/users/username")

      html =
        lv
        |> form("#username_form", user: %{"username" => "buoewe"})
        |> render_submit()

      assert html =~ "is reserved"
    end
  end
end
