defmodule EthosWeb.SocialIslandLayoutTest do
  @moduledoc """
  The embedded social island must not render the site layout.

  `use EthosWeb, :live_view` sets `layout: {EthosWeb.Layouts, :app}`, which is
  correct for a LiveView that owns a page and wrong for one embedded with
  `live_render/3`. Without `layout: false` the island wrapped its own output in
  the full site chrome, and every place, guide and collection page served two
  site headers, two search boxes and two footers nested inside itself.

  It survived for as long as the island sat at the bottom of the page, where
  stray chrome reads as part of the real footer. Nothing asserted the page
  contained exactly one of anything, so no test could see it — which is the
  whole reason this file exists.
  """
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  import Ethos.PlacesFixtures

  # The site header's own wrapper, from EthosWeb.Layouts.site_header/1.
  defp site_headers(html), do: count(html, ~s(<header class="px-4))
  # The SITE footer specifically. The guide page has its own in-article
  # <footer> of navigation links, which is legitimate — counting every <footer>
  # made this assertion fail on a page that was already correct.
  defp footers(html), do: count(html, ~s(<footer class="mt-16 border-t border-line))
  defp search_forms(html), do: count(html, ~s(action="/search"))

  defp count(haystack, needle),
    do: haystack |> String.split(needle) |> length() |> Kernel.-(1)

  test "a guide page renders the chrome exactly once", %{conn: conn} do
    guide = published_guide_fixture()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert site_headers(html) == 1, "expected one site header, got #{site_headers(html)}"
    assert footers(html) == 1, "expected one footer, got #{footers(html)}"
    assert search_forms(html) == 1, "expected one search box, got #{search_forms(html)}"

    # The island itself is still there — a page that renders the chrome once
    # because the island vanished would pass the assertions above.
    assert html =~ "data-phx-session"
  end

  test "a place page renders the chrome exactly once", %{conn: conn} do
    place = place_fixture()

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    assert site_headers(html) == 1, "expected one site header, got #{site_headers(html)}"
    assert footers(html) == 1, "expected one footer, got #{footers(html)}"
    assert search_forms(html) == 1, "expected one search box, got #{search_forms(html)}"
    assert html =~ "data-phx-session"
  end
end
