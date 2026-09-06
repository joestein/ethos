defmodule EthosWeb.GuideShareTest do
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  alias Ethos.Guides

  setup :verify_on_exit!
  setup :set_mox_from_context

  # Guide authoring is admin-only, so the acting user here must be the admin —
  # a regular user gets a 404 from every one of these routes.
  setup %{conn: conn} do
    user = admin_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "visiting share publishes the guide and shows the public link", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    # publish pipeline runs sync in tests via config below; stub its calls
    stub(Ethos.ExaMock, :search, fn _q, _o -> {:ok, []} end)
    stub(Ethos.ClaudeMock, :pick_nearby, fn _, _, _ -> {:ok, []} end)

    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/share")

    assert html =~ "/g/#{guide.slug}"
    assert Guides.get_guide!(guide.id).status == "published"
  end

  test "share screen on an already-published guide does not re-run the pipeline", %{
    conn: conn,
    user: user
  } do
    guide = published_guide_fixture(%{user: user})
    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/share")
    assert html =~ "/g/#{guide.slug}"
  end

  test "static (disconnected) render does not publish; connecting does", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    stub(Ethos.ExaMock, :search, fn _q, _o -> {:ok, []} end)
    stub(Ethos.ClaudeMock, :pick_nearby, fn _, _, _ -> {:ok, []} end)

    static_conn = get(conn, ~p"/guides/#{guide.id}/share")
    assert html_response(static_conn, 200)
    assert Guides.get_guide!(guide.id).status == "draft"

    {:ok, _lv, html} = live(conn, ~p"/guides/#{guide.id}/share")
    assert html =~ "/g/#{guide.slug}"
    assert Guides.get_guide!(guide.id).status == "published"
  end
end
