defmodule EthosWeb.HouseAdPlacementTest do
  @moduledoc """
  Where the house ad actually lands, over real requests.

  `EthosWeb.HouseAdTest` proves the component decides correctly given assigns.
  This proves the assigns reach it — which is the half a component test cannot
  see, and the half that broke twice while this was being built: the home page
  renders with `layout: false` and so never passes through `app.html.heex`, and
  `/foliage/embed` disables both layouts.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  # Distinctive enough that a match is the ad and not some other Chester
  # reference: only the house ad renders this thumbnail.
  @ad "chester-main-street_thumb.jpg"

  defp occurrences(html), do: html |> String.split(@ad) |> length() |> Kernel.-(1)

  test "renders exactly once on a guide page", %{conn: conn} do
    guide = published_guide_fixture()

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "Connecticut Foliage Forecast"

    # ONCE, counted rather than merely present. The social layer embeds a
    # reactions LiveView in every guide page, and that LiveView re-renders
    # app.html.heex — so a presence check passes while the ad is drawn twice,
    # which is exactly what happened before Affiliate.live_render?/1 was
    # consulted here.
    assert occurrences(html) == 1
  end

  test "renders on the home page, which does not use the app layout", %{conn: conn} do
    # page_controller.ex renders with `layout: false`, so the home page draws
    # its own header and the layout's copy of the ad never reaches it. If this
    # fails while the guide test above passes, the home page's own call site
    # has been dropped.
    html = conn |> get(~p"/") |> html_response(200)

    assert html =~ "Connecticut Foliage Forecast"
    assert occurrences(html) == 1
  end

  test "does not render on the page it advertises", %{conn: conn} do
    html = conn |> get(~p"/foliage") |> html_response(200)

    refute html =~ @ad
  end

  test "does not render on a foliage route page", %{conn: conn} do
    html = conn |> get(~p"/foliage/hartford-west") |> html_response(200)

    refute html =~ @ad
  end

  test "does not render in the embeddable iframe", %{conn: conn} do
    # The embed is meant to sit on somebody else's site. A house ad there
    # advertises Ethos on their page, which is a different decision from
    # advertising on ours — and it reaches this outcome by a different
    # mechanism from the two pages above: it disables both layouts rather than
    # setting the assign.
    html = conn |> get(~p"/foliage/embed") |> html_response(200)

    refute html =~ @ad
  end

  test "yields the top slot to Rome's paid affiliate unit", %{conn: conn} do
    # Italy is `placement: :top` in the registry, so a Rome guide already
    # carries a GetYourGuide widget in this exact slot.
    guide = published_guide_fixture(%{state: "Italy", county: "Rome", destination: "Rome, Italy"})

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ @ad
  end
end
