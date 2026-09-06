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
  import Ethos.PlacesFixtures

  # Real paths out of priv/seed_data/destination_tree.json. A campaign is
  # matched against a node's path now, so these must be the tree's own
  # strings rather than anything hand-built.
  @manhattan "united-states/new-york/new-york-city/manhattan"
  @manhattan_segments ~w(united-states new-york new-york-city manhattan)

  setup do
    previous = Application.get_env(:ethos, :affiliate_links_enabled)
    Application.put_env(:ethos, :affiliate_links_enabled, false)

    on_exit(fn -> Application.put_env(:ethos, :affiliate_links_enabled, previous) end)

    # A Manhattan guide is the case that WOULD render a widget when enabled —
    # testing a geography with no campaign would pass vacuously.
    #
    # This guide MUST be filed on a real Manhattan node. A campaign locale is
    # matched against the destination node's path now, not against state and
    # county strings — those columns are gone. A guide with no node resolves to
    # no locale at all, `unit_renders?/1` is then false whatever the flag says,
    # and every assertion below would pass vacuously. `guide_fixture/1` drops
    # attrs Ecto does not recognise, so a stale `state:`/`county:` here would
    # not fail loudly; it would quietly stop testing anything.
    guide =
      published_guide_fixture(%{
        title: "Affiliate off",
        destination: "Manhattan, New York",
        destination_path: "united-states/new-york/new-york-city/manhattan"
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
    #
    # NOTE: this guide is Manhattan, where unit_renders?/1 is always true, so
    # `not unit_renders?(...)` alone already keeps the CTA off here regardless
    # of enabled?(). This test cannot, by itself, prove enabled?() is even
    # consulted — see the next test, on a no-campaign locale, for that.
    refute html =~ "Planning your own trip?"
    refute html =~ "getyourguide.com/?partner_id"
  end

  # This is the test that actually exercises the CTA's `enabled?()` clause.
  # The Manhattan guide above always has unit_renders? == true, so
  # `not unit_renders?(...)` alone suppresses its CTA no matter what
  # enabled?() returns — an adversarial review confirmed this by deleting
  # `EthosWeb.Affiliate.enabled?() and` from the aside's `:if` in
  # show.html.heex and finding every test in this file, including the one
  # above, still green.
  #
  # A California guide has no entry in :affiliate_locales at all, so
  # unit_renders?/1 is false regardless of the flag — the CTA's actual
  # purpose (a no-campaign locale, which is most guide pages). Forcing the
  # house-ad pool empty via the same :persistent_term key HouseAd.pool/0
  # reads (lib/ethos/house_ad.ex:28,53) makes `for_page/2` return nil too, so
  # the CTA's `:if` reduces to just `enabled?()` and the flag alone decides.
  test "the fallback CTA is genuinely gated on the flag, not merely on unit_renders?/1",
       %{conn: conn} do
    previous_pool = Ethos.HouseAd.pool()
    :persistent_term.put({Ethos.HouseAd, :pool}, [])
    on_exit(fn -> :persistent_term.put({Ethos.HouseAd, :pool}, previous_pool) end)

    # Deliberately filed on NO node: that is the shape which resolves to no
    # affiliate locale, so `unit_renders?/1` is false and the aside's `:if`
    # reduces to `enabled?()` alone — the thing actually under test.
    ca_guide =
      published_guide_fixture(%{
        title: "No campaign here",
        destination: "Napa, California"
      })

    html_off = conn |> get(~p"/g/#{ca_guide.slug}") |> html_response(200)
    refute html_off =~ "Planning your own trip?"

    Application.put_env(:ethos, :affiliate_links_enabled, true)
    html_on = conn |> get(~p"/g/#{ca_guide.slug}") |> html_response(200)
    assert html_on =~ "Planning your own trip?"
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

  # This is the test that actually distinguishes the correct AND-placement
  # from the mistake Amendment C warns against. With no entries (the test
  # above), both branches of the inner `or` are false, so `enabled?() and
  # (A or B)` and the wrong `(enabled?() and A) or B` both happen to evaluate
  # to false — an adversarial review confirmed that rewriting the show page's
  # disclosure `:if` into the wrong form left every test in this file,
  # including the one above, still green.
  #
  # Here the guide is Manhattan (unit_renders? == true, so A = `not
  # unit_renders?(...)` is false) and carries an entry with a real
  # booking_url (so B = `Enum.any?(&safe_http?(&1.booking_url))` is true).
  # Correct placement: `enabled?() and (false or true)` = `false and true` =
  # false — disclosure absent. Wrong placement: `(enabled?() and false) or
  # true` = `false or true` = true — disclosure present, claiming a
  # commission on a booking link the page (correctly) is not showing.
  test "the commission disclosure does not survive the flag off even when an entry has a booking_url",
       %{conn: conn, guide: guide} do
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

  # Amendment D: the reviewer's own measurement against the PRODUCTION flag
  # value (affiliates off) found a house ad rendering on pages that never
  # carried one under test config (affiliates on): a Manhattan place page, a
  # New York county hub, and the New York state hub. None of them assign
  # `:guide`, so `EthosWeb.HouseAd.for_page/2`'s only Connecticut-context
  # branch (`subject/1`, gated on `state_slug: "connecticut"`) never matches
  # for New York — every one of these pages falls straight through to the
  # pool-pick branch, so the pool is forced non-empty (and restored after)
  # rather than relying on seeded Connecticut guides.
  #
  # Why the flag matters here at all: with affiliates on (test config's
  # default), New York's registry entry (config/config.exs) resolves a real
  # `:getyourguide` locale for all three pages, `unit_renders?/1` is true, and
  # `for_page/2`'s `enabled?() and unit_renders?(assigns) -> nil` clause wins
  # — no house ad. With the flag off, `enabled?()` alone makes that clause
  # false regardless of `unit_renders?/1`, so the widget's absence is what
  # lets the house ad reclaim these three slots that a New York affiliate
  # widget used to occupy.
  describe "on non-guide pages in a New York affiliate locale, with the flag off" do
    setup do
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
      :ok
    end

    test "a Manhattan place page renders the house ad", %{conn: conn} do
      place =
        place_fixture(%{
          slug: "affiliate-off-manhattan-place",
          name: "A Manhattan Place",
          kind: "museum",
          summary: "A place in Manhattan, New York.",
          destination_path: @manhattan,
          photos: [
            %{
              "src" => "/photos/ny/manhattan/place.jpg",
              "thumb" => "/photos/ny/manhattan/place.jpg",
              "title" => "A Manhattan Place Photo",
              "description" => "A photo of the place.",
              "author" => "Someone",
              "license" => "CC BY-SA 4.0",
              "source_url" => "https://commons.wikimedia.org/wiki/File:ManhattanPlace.jpg"
            }
          ]
        })

      assert_widget_when_enabled(conn, ~p"/p/#{place.slug}")

      html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      refute html =~ "data-gyg-widget"
    end

    test "the New York county hub (Manhattan) renders the house ad", %{conn: conn} do
      Ethos.SeedDataHelpers.seed_destination_paths!([@manhattan])

      assert_widget_when_enabled(conn, ~p"/destinations/#{@manhattan_segments}")

      html = conn |> get(~p"/destinations/#{@manhattan_segments}") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      refute html =~ "data-gyg-widget"
    end
  end

  # A page is only a meaningful subject for these assertions if it WOULD carry
  # the affiliate widget with the flag on. On a page in no campaign locale,
  # `HouseAd.for_page/2` returns an ad whether or not it consults `enabled?/0`,
  # so the house-ad assertions would pass while proving nothing.
  #
  # Asked by rendering the page rather than by reading columns off the row: a
  # guide's geography is the destination node it names, and this check has no
  # business knowing how that resolves.
  defp assert_widget_when_enabled(conn, path) do
    Application.put_env(:ethos, :affiliate_links_enabled, true)
    html = conn |> get(path) |> html_response(200)
    Application.put_env(:ethos, :affiliate_links_enabled, false)

    assert html =~ "data-gyg-widget",
           "#{path} carries no affiliate widget even with the flag ON, so it is " <>
             "not in a campaign locale and every assertion about it is vacuous"
  end
end
