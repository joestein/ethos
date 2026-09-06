defmodule EthosWeb.Admin.UsersLiveTest do
  # async: false — admin_fixture/1 inserts the configured admin email.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures

  alias Ethos.Moderation

  setup do
    %{admin: admin_fixture(), user: user_fixture(%{username: "wanderer"})}
  end

  # get/2, not live/2: the guards are plugs on the router pipeline and act on
  # the HTTP request before any mount. require_admin_user RENDERS a 404 and
  # halts rather than raising.
  test "a logged-out visitor is sent to log in", %{conn: conn} do
    assert conn |> get(~p"/admin/users") |> redirected_to() == ~p"/users/log_in"
  end

  test "a non-admin gets a 404", %{conn: conn} do
    conn = log_in_user(conn, user_fixture(%{email: "not-admin@example.com"}))

    assert conn |> get(~p"/admin/users") |> html_response(404)
  end

  test "the admin sees users by username", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    assert html =~ "wanderer"
  end

  test "searching narrows the list", %{conn: conn, admin: admin} do
    user_fixture(%{username: "otherperson"})

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html = view |> form("#user-search", search: %{query: "wander"}) |> render_change()

    assert html =~ "wanderer"
    refute html =~ "otherperson"
  end

  test "banning an account blocks it and shows the reason", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html =
      view
      |> form("#ban-#{user.id}", ban: %{reason: "Spamming every guide."})
      |> render_submit()

    assert html =~ "Spamming every guide."
    assert Moderation.banned?(Ethos.Repo.reload!(user))
  end

  test "unbanning restores the account", %{conn: conn, admin: admin, user: user} do
    {:ok, _} = Moderation.ban_user(user, "Temporary.", admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=unban][phx-value-id=#{user.id}]") |> render_click()

    refute Moderation.banned?(Ethos.Repo.reload!(user))
  end

  test "trusting from the console fast-lanes that author's next comment", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=trust][phx-value-id=#{user.id}]") |> render_click()

    assert Ethos.Repo.reload!(user).trusted_at

    {:ok, review} =
      Ethos.Social.create_review(
        Ethos.Repo.reload!(user),
        Ethos.GuidesFixtures.guide_fixture(),
        %{"rating" => "8", "body" => "Straight through."}
      )

    assert review.status == "approved"
  end

  test "untrusting sends that author back to the queue", %{
    conn: conn,
    admin: admin,
    user: user
  } do
    {:ok, _} = Moderation.trust_user(user, admin)

    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    view |> element("button[phx-click=untrust][phx-value-id=#{user.id}]") |> render_click()

    refute Ethos.Repo.reload!(user).trusted_at
  end

  test "the admin's own row cannot be banned", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    refute html =~ ~s(id="ban-#{admin.id}")
  end

  # The ban form is already hidden on this row (see the test above); the
  # trust/untrust buttons were not, which is what let the admin self-trust
  # and self-untrust with no crafted id needed.
  test "the admin's own row has no trust or untrust control", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    refute html =~ ~s(phx-click="trust" phx-value-id="#{admin.id}")
    refute html =~ ~s(phx-click="untrust" phx-value-id="#{admin.id}")
  end

  test "a crafted trust event against the admin's own id is refused with a clear flash", %{
    conn: conn,
    admin: admin
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html = render_click(view, "trust", %{"id" => to_string(admin.id)})

    assert html =~ "You cannot change your own trust status."
    refute Ethos.Repo.reload!(admin).trusted_at
  end

  test "a crafted untrust event against the admin's own id is refused with a clear flash", %{
    conn: conn,
    admin: admin
  } do
    {:ok, view, _html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    html = render_click(view, "untrust", %{"id" => to_string(admin.id)})

    assert html =~ "You cannot change your own trust status."
  end

  test "the console links to the other tabs", %{conn: conn, admin: admin} do
    {:ok, _view, html} = conn |> log_in_user(admin) |> live(~p"/admin/users")

    assert html =~ ~s(href="/admin/comments")
    assert html =~ ~s(href="/admin/suggestions")
  end
end
