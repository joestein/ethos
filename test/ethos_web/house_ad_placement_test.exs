defmodule EthosWeb.HouseAdPlacementTest do
  @moduledoc """
  WHERE the house ad lands, over real requests.

  `EthosWeb.HouseAdTest` covers `for_page/2` — which pages earn an ad and which
  get `nil` — by passing it a pool directly. This covers the half that lives in
  templates and that a component test cannot see: whether the ad reaches the
  page at all, and whether it sits above the content or below it.

  It exists because the unit moved. It shipped below `{@inner_content}` in
  `app.html.heex` and was absent from the home page entirely. Both are template
  facts, and both were invisible to a green component suite.

  ## Why these tests seed a Connecticut guide they never request

  `Ethos.HouseAd.pool/0` is built at application boot from published
  Connecticut guides, so it is EMPTY in a test database and the unit renders
  nowhere — the documented, expected case. One seeded pool guide plus
  `load!/0` is the smallest thing that makes the layout's real
  `for_page/1` return an ad, which is the call these tests exist to exercise.

  The guide requested is deliberately NOT that one: the guide controller
  assigns `:foliage` for Connecticut guides, and `for_page/2` returns nil when
  that assign is present so the panel and the ad never promote the same thing
  twice.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  # The ad's own link, not its heading. The heading appears in the foliage
  # pages' <title> and <h1> too, so a heading match proves nothing there.
  @ad ~s(href="/foliage" class="flex items-center)

  setup do
    # Photos are NOT castable by create_guide/2 — Guide.changeset casts only
    # title, destination, dates, state and county, and photos have their own
    # changeset. So the guide is created first and given its photograph after.
    guide =
      published_guide_fixture(%{destination: "Chester, Connecticut", state: "Connecticut"})

    {:ok, _} =
      Ethos.Guides.update_guide_photos(guide, [
        %{
          "src" => "/photos/ct/chester/chester-main-street.jpg",
          "thumb" => "/photos/ct/chester/chester-main-street_thumb.jpg",
          "title" => "Main Street, Chester",
          "description" => "Chester's village center along Main Street.",
          "author" => "John Phelan",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Main_Street,_Chester_CT.jpg"
        }
      ])

    Ethos.HouseAd.load!()
    on_exit(&Ethos.HouseAd.load!/0)

    refute Ethos.HouseAd.pool() == [], "the pool is empty, so every assertion below is vacuous"
    :ok
  end

  defp occurrences(html), do: html |> String.split(@ad) |> length() |> Kernel.-(1)

  defp elsewhere_guide do
    published_guide_fixture(%{
      title: "Puget Sound Trip",
      destination: "Puget Sound, Washington",
      state: "Washington",
      county: "Puget Sound"
    })
  end

  test "sits above the page content, not below it", %{conn: conn} do
    # The whole point of the move, and asserted by POSITION rather than
    # presence: the ad was already on this page before, at the bottom, so a
    # presence check passes either way.
    guide = elsewhere_guide()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ @ad

    # Split on the <h1>, not on the title string: the title also appears in
    # <head>, which precedes everything and would make this pass no matter
    # where the ad sat.
    [before_h1, _] = String.split(html, "<h1", parts: 2)

    assert before_h1 =~ @ad,
           "the house ad renders after the page's <h1>, so it is still below the content"
  end

  test "renders exactly once on a guide page", %{conn: conn} do
    # Counted, not merely present. The social layer embeds a reactions LiveView
    # in every guide page and that LiveView re-renders app.html.heex, so a
    # presence check would pass while the ad was drawn twice. `for_page/2`
    # returns nil for a LiveView render, which is what holds this at one.
    guide = elsewhere_guide()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert occurrences(html) == 1
  end

  test "renders on the home page, which does not use the app layout", %{conn: conn} do
    # page_controller.ex renders with `layout: false`, so the home page draws its
    # own header and the layout's copy never reaches it. If this fails while the
    # guide test passes, the home page's own call site has been dropped.
    html = conn |> get(~p"/") |> html_response(200)

    assert occurrences(html) == 1
  end

  test "does not render on the page it advertises", %{conn: conn} do
    html = conn |> get(~p"/foliage") |> html_response(200)

    refute html =~ @ad
  end

  test "does not render in the embeddable iframe", %{conn: conn} do
    # The embed sits on somebody else's site, and it reaches this outcome by a
    # different mechanism from the page above: it disables both layouts rather
    # than setting house_ad: false.
    html = conn |> get(~p"/foliage/embed") |> html_response(200)

    refute html =~ @ad
  end
end
