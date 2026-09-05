defmodule EthosWeb.PublicIdentityTest do
  @moduledoc """
  The email address is private. The username is the public byline.

  This is the regression guard for the whole social layer: any template that
  reaches for `current_user.email` on a public page fails here. Plan 3
  extends it to review bylines once reviews exist.
  """
  # async: false — two tests here build an admin via `admin_fixture/1`, whose
  # email is fixed (it must match the configured :admin_email). Running
  # alongside other async modules that do the same caused intermittent
  # Postgres deadlocks on the concurrent same-email inserts; do not flip
  # this back without giving admin fixtures distinct emails instead.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Contributions

  setup do
    user = user_fixture(%{email: "verysecret@example.com", username: "voyager"})
    %{user: user}
  end

  test "the header shows the username, not the email", %{conn: conn, user: user} do
    response =
      conn
      |> log_in_user(user)
      |> get(~p"/")
      |> html_response(200)

    assert response =~ "voyager"
    refute response =~ "verysecret@example.com"
  end

  test "a logged-out visitor sees neither", %{conn: conn} do
    response = conn |> get(~p"/") |> html_response(200)

    refute response =~ "voyager"
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
    admin = admin_fixture()
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

  test "guide owner's suggestion review screen does not leak a provisional suggester's derived name",
       %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})

    suggester =
      user_fixture(%{email: "provisional-secret@example.com", username: "provisionalsecret"})
      |> Ecto.Changeset.change(username_provisional: true)
      |> Ethos.Repo.update!()

    {:ok, _sugg} =
      Contributions.create_suggestion(suggester, guide, %{
        place_name: "Bar da Velha",
        body: "hidden gem"
      })

    conn = log_in_user(conn, owner)
    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/suggestions")

    refute html =~ "provisionalsecret"
    assert html =~ "a traveler"
  end

  test "admin suggestion queue does not leak a provisional suggester's derived name",
       %{conn: conn} do
    admin = admin_fixture()
    guide = published_guide_fixture()

    suggester =
      user_fixture(%{
        email: "provisional-admin-secret@example.com",
        username: "provadminsuggester"
      })
      |> Ecto.Changeset.change(username_provisional: true)
      |> Ethos.Repo.update!()

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

    refute response =~ "provadminsuggester"
    assert response =~ "a traveler"
  end

  describe "review bylines" do
    setup do
      %{guide: Ethos.GuidesFixtures.published_guide_fixture()}
    end

    test "an approved review shows the username and never the email", %{
      conn: conn,
      guide: guide
    } do
      # A real admin, not `user_fixture()` — `Ethos.Moderation.approve_review/2`
      # now refuses to publish for anyone else, so this fixture also stands
      # in as the regression guard for that check.
      admin = admin_fixture()

      # username is "reviewvoyager", not "voyager" — the module-level setup
      # above already creates an unrelated user with username "voyager" in
      # this same test's transaction, so reusing that name would collide on
      # the unique-username constraint instead of exercising the guard.
      author = user_fixture(%{email: "reviewer-secret@example.com", username: "reviewvoyager"})

      {:ok, review} =
        Ethos.Social.create_review(author, guide, %{"rating" => "9", "body" => "Real words."})

      {:ok, _} = Ethos.Moderation.approve_review(review, admin)

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Real words."
      assert html =~ "reviewvoyager"
      refute html =~ "reviewer-secret@example.com"
    end

    test "the admin queue shows the username and never the email", %{
      conn: conn,
      guide: guide
    } do
      # Use admin_fixture/0 rather than spelling the admin email out. The
      # literal is load-bearing — it must match :admin_email config for
      # Accounts.admin?/1 — and having it in several files at once caused a
      # Postgres deadlock between concurrent async inserts. The helper is the
      # single place it lives now; this file is `async: false` for the same
      # reason.
      admin = admin_fixture()
      author = user_fixture(%{email: "queued-secret@example.com", username: "traveller"})

      {:ok, _} =
        Ethos.Social.create_review(author, guide, %{"rating" => "4", "body" => "In the queue."})

      html =
        conn
        |> log_in_user(admin)
        |> get(~p"/admin/comments")
        |> html_response(200)

      assert html =~ "traveller"
      refute html =~ "queued-secret@example.com"
    end
  end
end
