defmodule EthosWeb.Admin.CommentsLiveTest do
  # async: false — every test here builds an admin via `admin_fixture/1`,
  # whose email is fixed (it must match the configured :admin_email).
  # Running alongside other async modules that do the same caused
  # intermittent Postgres deadlocks on the concurrent same-email inserts;
  # do not flip this back without giving admin fixtures distinct emails
  # instead.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Ethos.PlacesFixtures

  alias Ethos.Moderation
  alias Ethos.Repo
  alias Ethos.Social

  setup do
    # Admin-ness is keyed off the EMAIL matching :admin_email config, not the
    # username. Do not try to give this fixture the username "buoewe" — Plan 1
    # put that name on the reserved list, so `register_user/1` refuses it and
    # the fixture would fail.
    admin = admin_fixture(%{username: "adminuser"})
    author = user_fixture(%{username: "voyager"})
    guide = published_guide_fixture()

    {:ok, review} =
      Social.create_review(author, guide, %{"rating" => "9", "body" => "Pending words."})

    %{admin: admin, author: author, guide: guide, review: review}
  end

  # Both of these use get/2 rather than live/2 on purpose. The guards are
  # PLUGS in the router pipeline, so they act on the HTTP request and halt
  # before the LiveView ever mounts. `require_admin_user` RENDERS a 404 and
  # halts — it does not raise — so `assert_error_sent` would never fire.
  # This matches the existing pattern in
  # test/ethos_web/controllers/admin_suggestion_controller_test.exs:61-68.
  test "a logged-out visitor is sent to log in", %{conn: conn} do
    assert conn |> get(~p"/admin/comments") |> redirected_to() == ~p"/users/log_in"
  end

  test "a non-admin gets a 404 rather than a hint the page exists", %{conn: conn} do
    conn = log_in_user(conn, user_fixture(%{email: "not-admin@example.com"}))

    assert conn |> get(~p"/admin/comments") |> html_response(404)
  end

  test "the admin sees pending comments with author and rating", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ "Pending words."
    assert html =~ "voyager"
    assert html =~ "9"
  end

  test "approving publishes the comment", %{
    conn: conn,
    admin: admin,
    review: review,
    guide: guide
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    view |> element("button[phx-value-id=#{review.id}][phx-click=approve]") |> render_click()

    assert [visible] = Social.approved_reviews(guide)
    assert visible.id == review.id
  end

  test "an approved comment leaves the pending queue", %{conn: conn, admin: admin, review: review} do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    view |> element("button[phx-value-id=#{review.id}][phx-click=approve]") |> render_click()

    # The body legitimately still appears once the comment is published — an
    # admin can't judge what to revoke without reading it. What this test
    # actually checks is that the comment MOVED: gone from the pending
    # section, present in the published one.
    refute view |> element("#pending-comments") |> render() =~ "Pending words."
    assert view |> element("#published-comments") |> render() =~ "Pending words."
  end

  test "revoking hides a published comment", %{
    conn: conn,
    admin: admin,
    review: review,
    guide: guide
  } do
    {:ok, _} = Moderation.approve_review(review, admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    view |> element("button[phx-value-id=#{review.id}][phx-click=revoke]") |> render_click()

    assert Social.approved_reviews(guide) == []
  end

  test "the queue reports when it is empty", %{conn: conn, admin: admin, review: review} do
    {:ok, _} = Moderation.approve_review(review, admin)

    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ "Nothing waiting"
  end

  test "approving a comment that no longer exists shows a message instead of crashing",
       %{conn: conn, admin: admin} do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    # A crafted event with an id the DOM would never produce — e.g. a stale
    # tab clicking a row an admin already decided elsewhere, or a decided
    # row's id typed by hand.
    html = render_click(view, "approve", %{"id" => "999999"})

    assert html =~ "That comment no longer exists."
    assert Process.alive?(view.pid)
  end

  test "revoking a comment that no longer exists shows a message instead of crashing",
       %{conn: conn, admin: admin} do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    html = render_click(view, "revoke", %{"id" => "999999"})

    assert html =~ "That comment no longer exists."
    assert Process.alive?(view.pid)
  end

  test "the console links to the suggestions tab", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ ~s(href="/admin/suggestions")
  end

  # The console's core job is letting a moderator judge whether a comment is
  # on-topic, spam, or about the wrong business — impossible if all it shows
  # is the literal string "guide".
  test "the queue shows the subject's name linked to its public page", %{
    conn: conn,
    admin: admin,
    guide: guide
  } do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ guide.title
    assert html =~ ~s(href="#{~p"/g/#{guide.slug}"}")
  end

  # `reviews.subject_id` is polymorphic with no foreign key, so the place,
  # guide or collection a review points at can be deleted out from under
  # it. The queue must say so honestly rather than crash.
  test "a review whose subject no longer exists still renders without crashing", %{
    conn: conn,
    admin: admin
  } do
    place = place_fixture()
    author = user_fixture(%{username: "ghostwriter"})

    {:ok, _review} =
      Social.create_review(author, place, %{"rating" => "7", "body" => "Nice while it lasted."})

    Repo.delete!(place)

    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/comments")

    assert html =~ "Nice while it lasted."
    assert html =~ "deleted place"
  end
end
