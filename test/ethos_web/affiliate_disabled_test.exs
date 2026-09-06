defmodule EthosWeb.AffiliateDisabledTest do
  @moduledoc """
  Every affiliate surface goes dark when the flag is off.

  `async: false` because it overrides `:ethos, :affiliate_links_enabled`, which
  is global — the same reason `AffiliateUnsupportedNetworkTest` in
  `affiliate_placement_test.exs` is sync. Global config plus async is a race.

  The test environment defaults this flag ON so the existing affiliate suite
  keeps proving the machinery works. This file is the other half: proof that
  turning it off actually removes everything.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  setup do
    previous = Application.get_env(:ethos, :affiliate_links_enabled)
    Application.put_env(:ethos, :affiliate_links_enabled, false)

    on_exit(fn -> Application.put_env(:ethos, :affiliate_links_enabled, previous) end)

    # A Manhattan guide is the case that WOULD render a widget when enabled —
    # testing a geography with no campaign would pass vacuously.
    #
    # NOTE: county must be "Manhattan", the borough name used by the
    # :affiliate_locales allowlist in config/config.exs, NOT "New York
    # County" (the official, coextensive county name). `Ethos.Affiliates
    # .locale_for("new-york", "New York County")` returns nil — verified
    # directly against this codebase — so a guide seeded with "New York
    # County" would never resolve a locale at all and every test below would
    # pass vacuously regardless of the flag. This is a correction to the
    # brief's fixture, not a divergence.
    guide =
      published_guide_fixture(%{
        title: "Affiliate off",
        destination: "Manhattan, New York",
        state: "New York",
        state_slug: "new-york",
        county: "Manhattan"
      })

    %{guide: guide}
  end

  test "the partner script is absent from the page head", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "widget.getyourguide.com"
  end

  test "the widget unit is absent", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "data-gyg-widget"
  end

  test "the fallback CTA does not appear in the widget's place", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # This is the trap: the CTA renders when no widget renders, so a naive
    # kill switch turns it ON. It must be off too.
    refute html =~ "Planning your own trip?"
    refute html =~ "getyourguide.com/?partner_id"
  end

  test "per-entry booking links are absent", %{conn: conn, guide: guide} do
    {:ok, _entry} =
      Ethos.Guides.create_entry(
        guide,
        %{
          kind: "tip",
          name: "Bookable thing",
          note: "Has a booking link.",
          booking_url: "https://example.com/book"
        },
        :privileged
      )

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "https://example.com/book"
  end

  test "enabled? reports the flag", _ do
    refute EthosWeb.Affiliate.enabled?()

    Application.put_env(:ethos, :affiliate_links_enabled, true)
    assert EthosWeb.Affiliate.enabled?()
  end

  # Amendment C: the shared disclosure phrase must not survive the flag going
  # off. It is common to both disclosure lines (the guide show page's own
  # "Some booking links..." and the widget unit's "Tours and activities shown
  # above..."), and neither should render with affiliates disabled.
  test "no commission disclosure survives with the flag off", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    refute html =~ "earn Ethos a commission"
  end

  # Amendment B: replaces the brief's original "the house ad still works with
  # affiliates off" test, which only checked the page contained its own title
  # and ran against a guide where `HouseAd.for_page/2` returns nil regardless
  # — it would have passed while proving nothing.
  #
  # This guide (Manhattan, New York — a real affiliate locale) is exactly the
  # case where, pre-Amendment-A, `HouseAd.for_page/2`'s unconditional
  # `EthosWeb.Affiliate.unit_renders?(assigns) -> nil` clause suppresses the
  # house ad even though the widget itself never renders (flag off) — leaving
  # NEITHER a widget, NOR the CTA (also gated on the flag), NOR a house ad:
  # nothing in that slot at all. Post-Amendment-A, the clause requires
  # `enabled?()` too, so with the flag off it falls through and the house ad
  # reclaims the slot.
  #
  # The pool is forced non-empty (and restored after) so this does not depend
  # on the test database happening to carry seeded Connecticut guides.
  test "the house ad reclaims the slot a disabled widget was still blocking",
       %{conn: conn, guide: guide} do
    previous_pool = Ethos.HouseAd.pool()

    :persistent_term.put({Ethos.HouseAd, :pool}, [
      %{
        "src" => "/photos/ct/avon/church.jpg",
        "thumb" => "/photos/ct/avon/church.jpg",
        "title" => "Avon Congregational Church",
        "author" => "Daderot",
        "license" => "CC0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Avon.JPG"
      }
    ])

    on_exit(fn -> :persistent_term.put({Ethos.HouseAd, :pool}, previous_pool) end)

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "Connecticut Foliage Forecast"
    assert html =~ ~s(href="/foliage")
  end
end
