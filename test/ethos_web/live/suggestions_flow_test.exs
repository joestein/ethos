defmodule EthosWeb.SuggestionsFlowTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.{Contributions, Guides}

  test "reader submits a suggestion", %{conn: conn} do
    guide = published_guide_fixture()
    reader = user_fixture()
    conn = log_in_user(conn, reader)

    {:ok, lv, _html} = live(conn, ~p"/g/#{guide.slug}/suggest")

    lv
    |> form("#suggest-form", suggestion: %{place_name: "Bar da Velha", kind_hint: "food", body: "hidden gem"})
    |> render_submit()

    assert_redirect(lv, ~p"/g/#{guide.slug}")
    assert [%{place_name: "Bar da Velha", origin: "user"}] = Contributions.list_pending_suggestions(guide)
  end

  test "owner accepts a suggestion which creates a credited entry", %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "Bar da Velha", body: "gem"})

    conn = log_in_user(conn, owner)
    {:ok, lv, html} = live(conn, ~p"/guides/#{guide.id}/suggestions")
    assert html =~ "Bar da Velha"

    lv |> element(~s(button[phx-click="accept"][phx-value-id="#{sugg.id}"])) |> render_click()

    assert [entry] = Guides.list_entries(guide)
    assert entry.credited_user_id == reader.id
    refute render(lv) =~ "Bar da Velha"
  end

  test "owner declines a suggestion", %{conn: conn} do
    owner = user_fixture()
    guide = published_guide_fixture(%{user: owner})
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "Meh place", body: "eh"})

    conn = log_in_user(conn, owner)
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/suggestions")

    lv |> element(~s(button[phx-click="decline"][phx-value-id="#{sugg.id}"])) |> render_click()
    assert Guides.list_entries(guide) == []
    assert Contributions.list_pending_suggestions(guide) == []
  end

  test "non-owner cannot open the review screen", %{conn: conn} do
    guide = published_guide_fixture()
    other = user_fixture()
    conn = log_in_user(conn, other)

    assert_error_sent 404, fn -> live(conn, ~p"/guides/#{guide.id}/suggestions") end
  end
end
