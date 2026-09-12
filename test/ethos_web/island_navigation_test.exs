defmodule EthosWeb.IslandNavigationTest do
  @moduledoc """
  Pages that embed the social island must not use live navigation.

  `<.link navigate={...}>` emits `data-phx-link="redirect"`, which LiveView's
  JS intercepts. Its handler calls `this.main.isMain()`, and `main` is only
  assigned for a root element carrying `data-phx-main`:

      if (rootEl.hasAttribute(PHX_MAIN)) { this.main = view }

  An island rendered with `live_render/3` into a controller page has
  `data-phx-session` but never `data-phx-main`. So on those pages `main` is
  null, `isConnected()` is true because the island joined, the handler throws
  a TypeError on null — and `preventDefault()` has already run. The click does
  nothing whatsoever.

  Pages without an island are unaffected: `isConnected()` is false there, so
  the handler short-circuits to a plain browser redirect before ever touching
  `main`. That is exactly why this broke on place, guide and collection pages
  and nowhere else.

  Nothing failed loudly. Every affected link simply stopped working — the
  breadcrumbs, "See all photos", the site header's own nav, and the thumbs'
  log-in link, which is how it was reported: "the thumbs don't work".
  """
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  import Ethos.PlacesFixtures

  defp live_links(html) do
    html
    |> Floki.parse_document!()
    |> Floki.find("[data-phx-link]")
    |> Enum.map(&(Floki.attribute(&1, "href") |> List.first()))
  end

  test "a guide page carries no live-navigation links", %{conn: conn} do
    guide = published_guide_fixture()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert live_links(html) == [],
           "these links are dead on an island page: #{inspect(live_links(html))}"

    # The island is present — a page that passed because the island vanished
    # would prove nothing.
    assert html =~ "data-phx-session"
  end

  test "a place page carries no live-navigation links", %{conn: conn} do
    place = place_fixture()

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    assert live_links(html) == [],
           "these links are dead on an island page: #{inspect(live_links(html))}"

    assert html =~ "data-phx-session"
  end

  test "the thumbs' log-in link is a real navigation", %{conn: conn} do
    place = place_fixture()

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    thumbs =
      html
      |> Floki.parse_document!()
      |> Floki.find(~s(a[href="/users/log_in"]))
      |> Enum.filter(&(Floki.find(&1, "[data-reaction-count]") != []))

    assert length(thumbs) == 2

    for t <- thumbs do
      assert Floki.attribute(t, "data-phx-link") == [],
             "a thumb's log-in link still uses live navigation, so clicking it does nothing"
    end
  end
end
