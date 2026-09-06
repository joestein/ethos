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

  test "the privacy page discloses browser storage and the badges held on an account",
       %{conn: conn} do
    html = conn |> get(~p"/privacy") |> html_response(200)

    # The whole consent gate is TCF purpose 1, "Store and/or access information
    # on a device", and PostHog is the third party it is gating. A page that
    # describes what PostHog records but never says it keeps an identifier on
    # the device omits the one fact the consent is actually about.
    assert html =~ "local storage"

    # Ethos.Badges.UserBadge stores a badge_key and an awarded_at against a
    # user, so it is account data like the guides and the reactions beside it.
    assert html =~ "badges"
    assert html =~ "awarded"
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
