defmodule EthosWeb.HouseAdTest do
  use EthosWeb.ConnCase, async: true

  require Phoenix.LiveViewTest

  alias EthosWeb.HouseAd

  defp photo(attrs \\ %{}) do
    Map.merge(
      %{
        "src" => "/photos/ct/avon/church.jpg",
        "thumb" => "/photos/ct/avon/church.jpg",
        "title" => "Avon Congregational Church",
        "author" => "Daderot",
        "license" => "CC0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Avon.JPG"
      },
      attrs
    )
  end

  defp ct_guide(attrs \\ %{}) do
    Map.merge(
      %{
        __struct__: Ethos.Guides.Guide,
        state_slug: "connecticut",
        destination_slug: "avon",
        county: "Hartford County",
        # town-page: the only guide tier that carries neither the foliage
        # panel's fallback-free rendering nor show.html.heex's amber
        # GetYourGuide CTA — see the "guide tier" describe block below for the
        # tier: "guide" case this default deliberately does not cover.
        tier: "town-page",
        photos: [photo()]
      },
      attrs
    )
  end

  describe "for_page/1 — when it must not render" do
    test "returns nil on a LiveView" do
      # locale_for/2 returns nil for LiveViews, so "no affiliate here" is
      # trivially true on every authoring screen. Without this clause the ad
      # would appear on the guide editor and user settings.
      assert HouseAd.for_page(%{socket: %{}, guide: ct_guide()}) == nil
      assert HouseAd.for_page(%{live_module: SomeLive, guide: ct_guide()}) == nil
    end

    test "returns nil when the foliage panel is on the page" do
      # Otherwise a Connecticut town guide promotes the forecast twice within
      # about 200 pixels.
      assigns = %{
        guide: ct_guide(),
        foliage: %{town: %{name: "Avon"}},
        page_canonical: "http://x/g/avon"
      }

      assert HouseAd.for_page(assigns) == nil
    end

    test "returns nil when an affiliate widget renders" do
      ny = %{ct_guide() | state_slug: "new-york", county: "Brooklyn", destination_slug: "dumbo"}
      assert HouseAd.for_page(%{guide: ny, page_canonical: "http://x/g/dumbo"}) == nil
    end

    test "returns nil when the page opts out with house_ad: false" do
      # /foliage and its route pages: the ad promotes the forecast, so an ad
      # on the forecast's own page would advertise the page to itself.
      assigns = %{page_canonical: "http://x/foliage", house_ad: false}
      assert HouseAd.for_page(assigns) == nil
    end

    test "returns nil when the page assigns no page_canonical" do
      # page_canonical is assigned only by the six public HTML controllers.
      # Its absence — every admin screen, /badges, robots.txt, the sitemap,
      # the session controller, and /search — means this is not "a
      # controller-rendered public page" per the design, whether or not the
      # page happens to be a LiveView.
      assert HouseAd.for_page(%{guide: ct_guide()}) == nil
    end

    test "returns nil for a Connecticut guide whose tier is not town-page" do
      # show.html.heex (every tier other than "town-page") renders its own
      # GetYourGuide fallback CTA under the same "no affiliate here" condition
      # this ad renders under. Rendering both put two ad-shaped units on the
      # ~270 guide pages outside New York and Italy.
      assigns = %{guide: ct_guide(%{tier: "guide"}), page_canonical: "http://x/g/avon-guide"}
      assert HouseAd.for_page(assigns) == nil
    end

    test "a guide outside Connecticut that shares a town slug gets no Connecticut town" do
      # Production carries /g/greenwich-london-guide and /g/enfield-london-guide,
      # both London boroughs whose slug matches a Connecticut town. Matching on
      # the slug alone would put "Connecticut Foliage Forecast — Greenwich,
      # estimated peak Nov 4-10" on a page about London.
      guide = %{
        __struct__: Ethos.Guides.Guide,
        state_slug: "england",
        destination_slug: "greenwich",
        county: nil,
        photos: [photo()]
      }

      case HouseAd.for_page(%{guide: guide, page_canonical: "http://x/g/greenwich-london-guide"}) do
        nil -> :ok
        %{town: town} -> assert town == nil
      end
    end
  end

  describe "for_page/1 — choosing the photograph" do
    test "uses the town's own photograph on a Connecticut guide out of season" do
      assigns = %{guide: ct_guide(), foliage: nil, page_canonical: "http://x/g/avon"}
      assert %{photo: p, town: town} = HouseAd.for_page(assigns)
      assert p["title"] == "Avon Congregational Church"
      assert town.name == "Avon"
    end

    test "uses a place's town_slug, not destination_slug" do
      # Place has no destination_slug at all; reading it would return nil and
      # silently fall through to the pool.
      place = %{
        __struct__: Ethos.Places.Place,
        state_slug: "connecticut",
        town_slug: "avon",
        county: "Hartford County",
        photos: [photo(%{"title" => "A place photo"})]
      }

      assert %{photo: p, town: town} =
               HouseAd.for_page(%{place: place, page_canonical: "http://x/p/y"})

      assert p["title"] == "A place photo"
      assert town.name == "Avon"
    end

    test "falls back to the pool with no town when there is no Connecticut context" do
      assigns = %{page_canonical: "http://x/c/mlb-ballparks"}

      case HouseAd.for_page(assigns) do
        nil -> assert Ethos.HouseAd.pool() == []
        %{photo: p, town: nil} -> assert Ethos.HouseAd.usable?(p)
      end
    end

    test "skips a contextual photograph that cannot be attributed" do
      guide = ct_guide(%{photos: [photo(%{"author" => ""})]})
      result = HouseAd.for_page(%{guide: guide, page_canonical: "http://x/g/avon"})

      # It may fall back to the pool, but it must never return the unattributable photo.
      refute match?(%{photo: %{"author" => ""}}, result)
    end

    test "returns nil when there is no context and the pool is empty" do
      # An empty pool must render no advert at all, never a broken image.
      assert HouseAd.for_page(%{page_canonical: "http://x/y"}, []) == nil
    end
  end

  describe "rendering" do
    test "renders nothing when ad is nil" do
      assert render_ad(nil) == ""
    end

    test "renders the forecast name, the photo and the attribution" do
      html = render_ad(%{photo: photo(), town: nil})

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "/photos/ct/avon/church.jpg"
      assert html =~ "Daderot"
      assert html =~ "CC0"
      # "via" and "Wikimedia Commons" sit either side of an <a> tag in the
      # markup — a browser collapses that whitespace into "via Wikimedia
      # Commons" when it renders, but the raw HTML does not.
      assert html =~ "via"
      assert html =~ "Wikimedia Commons"
      assert html =~ ~s(href="/foliage")
    end

    test "links the credit line to the photograph's source when the URL is safe" do
      html = render_ad(%{photo: photo(), town: nil})

      assert html =~ ~s(href="https://commons.wikimedia.org/wiki/File:Avon.JPG")
    end

    test "the credit line sits outside the /foliage link, not nested inside it" do
      # A nested <a> is invalid HTML — the fix for the missing source link had
      # to move the credit line out of the wrapping <.link href="/foliage">.
      html = render_ad(%{photo: photo(), town: nil})

      foliage_link_close = :binary.match(html, "</a>") |> elem(0)
      source_link_open = :binary.match(html, ~s(href="https://commons.wikimedia.org)) |> elem(0)

      assert foliage_link_close < source_link_open
    end

    test "falls back to unlinked text when the source URL is unsafe" do
      html = render_ad(%{photo: photo(%{"source_url" => "javascript:alert(1)"}), town: nil})

      assert html =~ "Wikimedia Commons"
      refute html =~ ~s|href="javascript:alert(1)"|
    end

    test "names the town and its window when there is a town" do
      town = Ethos.Foliage.town("avon")
      html = render_ad(%{photo: photo(), town: town})

      assert html =~ "Avon"
      assert html =~ Ethos.Foliage.peak_label(town)
    end

    test "says most advanced, not estimated peak, for an unverified town" do
      # The honesty rule does not get relaxed because the surface is an advert.
      greenwich = Ethos.Foliage.town("greenwich")
      refute Ethos.Foliage.peak_verified?(greenwich)

      html = render_ad(%{photo: photo(), town: greenwich})
      assert html =~ "most advanced"
      refute html =~ "estimated peak"
    end

    test "says estimated peak for a verified town" do
      salisbury = Ethos.Foliage.town("salisbury")
      assert Ethos.Foliage.peak_verified?(salisbury)

      html = render_ad(%{photo: photo(), town: salisbury})
      assert html =~ "estimated peak"
      refute html =~ "most advanced"
    end

    test "carries no tourism-board branding" do
      html = render_ad(%{photo: photo(), town: nil})
      refute html =~ ~r/visit connecticut/i
    end
  end

  describe "through a real request" do
    import Ethos.GuidesFixtures
    import Ethos.AccountsFixtures

    test "does not appear on a tier: guide page, which already carries the GetYourGuide fallback CTA",
         %{conn: conn} do
      # Before the tier gate, show.html.heex's amber CTA
      # (`:if={not EthosWeb.Affiliate.unit_renders?(assigns)}`) and this ad
      # rendered under the same condition — two ad-shaped units on ~270 guide
      # pages outside New York and Italy. Only town-page-tier guides render
      # this ad now; the CTA is unaffected.
      guide = published_guide_fixture(%{title: "A Guide Somewhere"})
      assert guide.tier == "guide"

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      refute html =~ "Connecticut Foliage Forecast"
      assert html =~ "Explore tours"
    end

    test "does not appear on /foliage, which it would otherwise advertise to itself", %{
      conn: conn
    } do
      # /foliage's own <title>, og:title and JSON-LD all legitimately say
      # "Connecticut Foliage Forecast", so the assertion targets a CSS class
      # unique to the ad's markup rather than that phrase.
      html = conn |> get(~p"/foliage") |> html_response(200)
      refute html =~ "hover:border-zinc-400"
    end

    test "does not appear on a foliage route page", %{conn: conn} do
      route = Ethos.Foliage.routes() |> List.first()
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)
      refute html =~ "hover:border-zinc-400"
    end

    test "does not appear on the admin suggestions inbox", %{conn: conn} do
      admin = user_fixture(%{email: "cryptcom@gmail.com"})
      conn = log_in_user(conn, admin)

      html = conn |> get(~p"/admin/suggestions") |> html_response(200)
      refute html =~ "Connecticut Foliage Forecast"
    end

    test "does not appear on /badges", %{conn: conn} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      html = conn |> get(~p"/badges") |> html_response(200)
      refute html =~ "Connecticut Foliage Forecast"
    end

    test "appears exactly once on a Connecticut place page, deterministically, proving the layout call site is wired",
         %{conn: conn} do
      # Unlike a guide page, this scenario does not depend on the pool
      # (which resolves from seeded Connecticut guides this test database
      # may not carry) or on the tier gate, so it cannot pass vacuously.
      #
      # A Connecticut place page does not have this problem: the foliage
      # panel lives only in the guide templates, so `/p/:slug` never carries
      # one; Connecticut resolves no affiliate locale; and a place in Avon (a
      # real foliage-dataset town) hits HouseAd.for_page/1's contextual
      # branch year-round, in or out of season, needing no pool at all. So
      # this test fails unconditionally if the layout line is removed.
      place =
        Ethos.Places.upsert_place!(%{
          slug: "avon-house-ad-test-place",
          name: "Avon Test Place",
          kind: "museum",
          town: "Avon",
          state: "Connecticut",
          county: "Hartford County",
          summary: "A place in Avon, Connecticut.",
          photos: [
            %{
              "src" => "/photos/ct/avon/place.jpg",
              "thumb" => "/photos/ct/avon/place.jpg",
              "title" => "Avon Place Photo",
              "description" => "A photo of the place.",
              "author" => "Someone",
              "license" => "CC BY-SA 4.0",
              "source_url" => "https://commons.wikimedia.org/wiki/File:AvonPlace.jpg"
            }
          ]
        })

      html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

      # Exactly one, not merely present: this is the non-vacuous replacement
      # for a prior "never appears twice" assertion of `<= 1`, which a count
      # of 0 (the ad never rendering at all) also satisfied.
      assert length(Regex.scan(~r/Connecticut Foliage Forecast/, html)) == 1
      assert html =~ "Avon"
      assert html =~ "Avon Place Photo"
    end
  end

  # Defined at module level, not inside a describe block. This repo's
  # convention for rendering a function component in tests: pipe through
  # Phoenix.LiveViewTest.render_component/2 rather than calling the function
  # directly and threading Phoenix.HTML.Safe.to_iodata/1, which is fragile
  # against how HEEx components return %Phoenix.LiveView.Rendered{}.
  defp render_ad(ad) do
    Phoenix.LiveViewTest.render_component(&EthosWeb.HouseAd.house_ad/1, ad: ad)
  end
end
