defmodule EthosWeb.PrivacyTest do
  use EthosWeb.ConnCase, async: true

  test "the privacy page renders and names every third party the site loads",
       %{conn: conn} do
    html = conn |> get(~p"/privacy") |> html_response(200)

    # Each of these actually runs on the site. A privacy policy that omits one
    # is worse than none: it is a specific false statement about what the page
    # does, rather than a gap.
    assert html =~ "PostHog"
    assert html =~ "Google AdSense"
    assert html =~ "GetYourGuide"

    # The first-party cookies, which people forget because they are not
    # third-party scripts.
    assert html =~ "session"
    assert html =~ "remember"
  end

  test "the footer links to the privacy page from a guide", %{conn: conn} do
    guide = Ethos.GuidesFixtures.published_guide_fixture()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ ~s(href="/privacy")
  end

  test "the footer links to the privacy page from the home page", %{conn: conn} do
    # The home page renders with `layout: false` (page_controller.ex), so it
    # never passes through app.html.heex and needs its own footer call. If this
    # fails while the guide test passes, that second call site was dropped.
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ ~s(href="/privacy")
  end
end
