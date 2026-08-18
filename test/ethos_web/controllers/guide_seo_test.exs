defmodule EthosWeb.GuideSeoTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  @gyg "https://www.getyourguide.com/rome-l33/rome-colosseum-gladiator-floor-access-roman-forum-tour-t633431/?partner_id=ZA4AIMF&currency=USD&travel_agent=1&cmp=share_to_earn"

  defp seo_guide do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})

    {:ok, guide} =
      Guides.update_guide_seo(guide, %{
        intro: "Three **real** days in Rome, from the arena floor to Monti.",
        sections: [%{"heading" => "Getting around", "body" => "Walk everywhere."}],
        faq: [%{"question" => "Worth it?", "answer" => "Yes."}]
      })

    {:ok, _} =
      Guides.create_entry(guide, %{
        kind: "tour",
        name: "Colosseum arena floor",
        verdict: "loved",
        booking_url: @gyg,
        booking_label: "Book the arena-floor tour"
      })

    guide
  end

  test "renders intro, sections, faq, CTA with sponsored rel, and disclosure", %{conn: conn} do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "<strong>real</strong>"
    assert html =~ "Getting around"
    assert html =~ "Worth it?"
    assert html =~ "Book the arena-floor tour"
    assert html =~ ~s(rel="sponsored nofollow noopener")
    assert html =~ "partner_id=ZA4AIMF"
    assert html =~ "earn Ethos a commission"
  end

  test "GetYourGuide house ad and disclosure render on every guide page", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "Planning your own trip?"
    assert html =~ "https://www.getyourguide.com/?partner_id=ZA4AIMF&amp;cmp=share_to_earn"
    assert html =~ "Explore tours"
    # the house ad is an earning link, so the disclosure now always shows
    assert html =~ "earn Ethos a commission"
  end

  test "emits Article, FAQPage, BreadcrumbList JSON-LD, canonical, meta description", %{
    conn: conn
  } do
    guide = seo_guide()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s("@type":"Article")
    assert html =~ ~s("@type":"FAQPage")
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(<link rel="canonical" href="#{url(~p"/g/#{guide.slug}")}")
    assert html =~ ~s(name="description")
  end

  test "no FAQPage block when faq empty", %{conn: conn} do
    guide = published_guide_fixture()
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)
    refute html =~ ~s("@type":"FAQPage")
  end

  test "escapes </script> in JSON-LD so it cannot break out of the script tag", %{conn: conn} do
    guide =
      published_guide_fixture(%{
        title: "Rome</script><script>window.xss=1</script>",
        destination: "Rome, Italy"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "</script><script>window.xss=1</script>"
    assert html =~ ~s("@type":"Article")
  end
end
