defmodule EthosWeb.GuideSeoEditTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.{AccountsFixtures, GuidesFixtures}
  alias Ethos.Guides

  setup %{conn: conn} do
    user = user_fixture()
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
end
