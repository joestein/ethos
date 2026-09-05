defmodule EthosWeb.PublicIdentityTest do
  @moduledoc """
  The email address is private. The username is the public byline.

  This is the regression guard for the whole social layer: any template that
  reaches for `current_user.email` on a public page fails here. Plan 3
  extends it to review bylines once reviews exist.
  """
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Contributions

  setup do
    user = user_fixture(%{email: "verysecret@example.com", username: "buoewe"})
    %{user: user}
  end

  test "the header shows the username, not the email", %{conn: conn, user: user} do
    response =
      conn
      |> log_in_user(user)
      |> get(~p"/")
      |> html_response(200)

    assert response =~ "buoewe"
    refute response =~ "verysecret@example.com"
  end

  test "a logged-out visitor sees neither", %{conn: conn} do
    response = conn |> get(~p"/") |> html_response(200)

    refute response =~ "buoewe"
    refute response =~ "verysecret@example.com"
  end

  test "the account's own settings page may still show the email", %{conn: conn, user: user} do
    response =
      conn
      |> log_in_user(user)
      |> get(~p"/users/settings")
      |> html_response(200)

    assert response =~ "verysecret@example.com"
  end

  test "guide owner's suggestion review screen shows the suggester's username, not their email",
       %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})
    suggester = user_fixture(%{email: "suggester-secret@example.com", username: "hopsuggester"})

    {:ok, _sugg} =
      Contributions.create_suggestion(suggester, guide, %{
        place_name: "Bar da Velha",
        body: "hidden gem"
      })

    conn = log_in_user(conn, owner)
    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/suggestions")

    assert html =~ "hopsuggester"
    refute html =~ "suggester-secret@example.com"
  end

  test "admin suggestion queue shows the suggester's username, not their email", %{conn: conn} do
    admin = user_fixture(%{email: "cryptcom@gmail.com"})
    guide = published_guide_fixture()
    suggester = user_fixture(%{email: "admin-secret@example.com", username: "adminsuggester"})

    {:ok, _sugg} =
      Contributions.create_suggestion(suggester, guide, %{
        place_name: "New Spot",
        body: "Try this"
      })

    response =
      conn
      |> log_in_user(admin)
      |> get(~p"/admin/suggestions")
      |> html_response(200)

    assert response =~ "adminsuggester"
    refute response =~ "admin-secret@example.com"
  end
end
