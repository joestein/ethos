defmodule EthosWeb.GuideConfirmEditTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Guides

  setup %{conn: conn} do
    user = user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  defp guide_with_proposal(user) do
    guide = guide_fixture(%{user: user})
    {:ok, imp} = Guides.create_import(guide, "raw")

    {:ok, _} =
      Guides.mark_import(imp, "parsed", %{
        proposal: [
          %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "go early", "verdict" => "loved"},
          %{"day" => 2, "kind" => "walk", "name" => "Alfama", "note" => nil, "verdict" => "good"}
        ]
      })

    guide
  end

  test "confirm screen shows proposal and persists entries on confirm", %{conn: conn, user: user} do
    guide = guide_with_proposal(user)
    {:ok, lv, html} = live(conn, ~p"/guides/#{guide.id}/confirm")

    assert html =~ "Ramiro"
    assert html =~ "Alfama"

    lv |> element("#confirm-entries") |> render_click()
    assert_redirect(lv, ~p"/guides/#{guide.id}/edit")

    assert [%{name: "Ramiro"}, %{name: "Alfama"}] = Guides.list_entries(guide)
  end

  test "confirm screen supports inline editing of a proposed row before confirming", %{conn: conn, user: user} do
    guide = guide_with_proposal(user)
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/confirm")

    lv
    |> render_change("update_row", %{
      "index" => "0",
      "name" => "Ramiro (renamed)",
      "kind" => "food",
      "verdict" => "loved",
      "day" => "1",
      "note" => "go early"
    })

    assert render(lv) =~ "Ramiro (renamed)"

    lv |> element("#confirm-entries") |> render_click()
    assert_redirect(lv, ~p"/guides/#{guide.id}/edit")

    assert [%{name: "Ramiro (renamed)"}, %{name: "Alfama"}] = Guides.list_entries(guide)
  end

  test "confirm screen flashes an error instead of crashing when a row is invalid", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, imp} = Guides.create_import(guide, "raw")

    {:ok, _} =
      Guides.mark_import(imp, "parsed", %{
        proposal: [%{"day" => 1, "kind" => "food", "name" => "", "note" => nil, "verdict" => nil}]
      })

    {:ok, lv, _html} = live(conn, ~p"/guides/#{guide.id}/confirm")

    html = lv |> element("#confirm-entries") |> render_click()

    assert html =~ "One of the rows is invalid"
    assert Guides.list_entries(guide) == []
  end

  test "confirm screen can remove a proposed row before confirming", %{conn: conn, user: user} do
    guide = guide_with_proposal(user)
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/confirm")

    lv |> element(~s(button[phx-click="remove"][phx-value-index="0"])) |> render_click()
    lv |> element("#confirm-entries") |> render_click()

    assert [%{name: "Alfama"}] = Guides.list_entries(guide)
  end

  test "edit screen adds a manual entry", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv
    |> form("#entry-form", entry: %{kind: "food", name: "Time Out Market", verdict: "good"})
    |> render_submit()

    assert [%{name: "Time Out Market", source: "manual"}] = Guides.list_entries(guide)
    assert render(lv) =~ "Time Out Market"
  end

  test "edit screen deletes an entry", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Skip me", verdict: "skip"})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element(~s(button[phx-click="delete"][phx-value-id="#{entry.id}"])) |> render_click()
    assert Guides.list_entries(guide) == []
  end
end
