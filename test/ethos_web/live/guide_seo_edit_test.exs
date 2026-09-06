defmodule EthosWeb.GuideSeoEditTest do
  # async: false because admin_fixture/1 inserts the configured admin email,
  # and guide authoring (the /guides/:id/edit route this exercises) is
  # admin-only now.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.{AccountsFixtures, GuidesFixtures}
  alias Ethos.Guides

  setup %{conn: conn} do
    user = admin_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  test "saves intro, a section, and a faq row", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element("#add-section") |> render_click()
    lv |> element("#add-faq") |> render_click()

    lv
    |> form("#seo-form",
      seo: %{
        intro: "Three real days in Rome.",
        sections: %{"0" => %{heading: "Getting around", body: "Walk."}},
        faq: %{"0" => %{question: "Worth it?", answer: "Yes."}}
      }
    )
    |> render_submit()

    guide = Guides.get_guide!(guide.id)
    assert guide.intro =~ "Three real days"
    assert [%{"heading" => "Getting around", "body" => "Walk."}] = guide.sections
    assert [%{"question" => "Worth it?", "answer" => "Yes."}] = guide.faq
  end

  test "adds an entry with booking url and label", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv
    |> form("#entry-form",
      entry: %{
        kind: "tour",
        name: "Arena floor",
        verdict: "loved",
        booking_url: "https://example.com/t",
        booking_label: "Book it"
      }
    )
    |> render_submit()

    assert [%{booking_url: "https://example.com/t", booking_label: "Book it"}] =
             Guides.list_entries(guide)
  end

  test "seo_changed keeps a blank section row while intro is edited", %{conn: conn, user: user} do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element("#add-section") |> render_click()

    html =
      lv
      |> form("#seo-form",
        seo: %{
          intro: "Three real days in Rome.",
          sections: %{"0" => %{heading: "", body: ""}}
        }
      )
      |> render_change()

    assert html =~ "Section heading"
    assert html =~ "Remove section"
  end

  test "remove-section ignores a malformed index instead of crashing", %{
    conn: conn,
    user: user
  } do
    guide = guide_fixture(%{user: user})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv |> element("#add-section") |> render_click()
    html = render_click(lv, "remove-section", %{"index" => "not-a-number"})

    assert html =~ "Section heading"
  end

  test "updates an entry's booking url/label via the inline per-entry form", %{
    conn: conn,
    user: user
  } do
    guide = guide_fixture(%{user: user})
    {:ok, entry} = Guides.create_entry(guide, %{kind: "tour", name: "Arena floor"})
    {:ok, lv, _} = live(conn, ~p"/guides/#{guide.id}/edit")

    lv
    |> form("form[phx-submit='update_booking']",
      entry: %{
        id: entry.id,
        booking_url: "https://example.com/book-it",
        booking_label: "Book it"
      }
    )
    |> render_submit()

    assert %{booking_url: "https://example.com/book-it", booking_label: "Book it"} =
             Guides.get_entry!(guide, entry.id)
  end
end
