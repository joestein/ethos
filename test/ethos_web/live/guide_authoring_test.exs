defmodule EthosWeb.GuideAuthoringTest do
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  setup :verify_on_exit!
  setup :set_mox_from_context

  # Guide authoring is admin-only, so the acting user here must be the admin —
  # a regular user gets a 404 from every one of these routes.
  setup %{conn: conn} do
    user = admin_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "creates a guide from the new form", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/guides/new")

    {:ok, _lv, html} =
      lv
      |> form("#guide-form", guide: %{title: "Lisbon week", destination: "Lisbon, Portugal"})
      |> render_submit()
      |> follow_redirect(conn)

    assert html =~ "Paste your trip notes"
  end

  test "import page submits a dump and kicks off parsing", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ ->
      {:ok,
       [%{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => nil, "verdict" => "loved"}]}
    end)

    {:ok, lv, _html} = live(conn, ~p"/guides/#{guide.id}/import")

    lv
    |> form("#import-form", import: %{raw_text: "day 1 Ramiro, incredible"})
    |> render_submit()

    # LiveView subscribed and gets redirected to confirm once parse completes
    assert_redirect(lv, ~p"/guides/#{guide.id}/confirm")
  end

  test "index lists my guides", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user, title: "Tokyo Sprint"})
    {:ok, _lv, html} = live(conn, ~p"/guides")
    assert html =~ "Tokyo Sprint"
    assert html =~ guide.destination
  end
end
