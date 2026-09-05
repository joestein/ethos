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
        tier: "guide",
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
      assigns = %{guide: ct_guide(), foliage: %{town: %{name: "Avon"}}}
      assert HouseAd.for_page(assigns) == nil
    end

    test "returns nil when an affiliate widget renders" do
      ny = %{ct_guide() | state_slug: "new-york", county: "Brooklyn", destination_slug: "dumbo"}
      assert HouseAd.for_page(%{guide: ny}) == nil
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
      assert html =~ "via Wikimedia Commons"
      assert html =~ ~s(href="/foliage")
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

    test "appears on a guide page outside Connecticut", %{conn: conn} do
      # The layout call site is what puts the advert on ~480 pages. A
      # helper-only test leaves it unguarded: deleting the line from
      # app.html.heex would keep the suite green.
      guide = published_guide_fixture(%{title: "A Guide Somewhere"})
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      if Ethos.HouseAd.pool() != [] do
        assert html =~ "Connecticut Foliage Forecast"
        assert html =~ "via Wikimedia Commons"
      end
    end

    test "never appears twice on one page", %{conn: conn} do
      guide = published_guide_fixture(%{title: "Another Guide"})
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert length(Regex.scan(~r/Connecticut Foliage Forecast/, html)) <= 1
    end

    test "appears via the contextual photo, deterministically, proving the layout call site is wired",
         %{
           conn: conn
         } do
      # The two tests above are guarded by `if Ethos.HouseAd.pool() != []`,
      # because the pool resolves from seeded Connecticut guides that this
      # test database may not carry (see the task report). That guard can
      # make both of them pass vacuously even if the layout's call to
      # `EthosWeb.HouseAd.house_ad/1` were deleted entirely. This test does
      # not depend on the pool, so it fails unconditionally if that line is
      # removed.
      #
      # destination_slug is derived from the text before the first comma, so
      # a guide about "Avon, New Jersey" resolves to the slug "avon" — which
      # is also a Connecticut town in Ethos.Foliage's dataset. New Jersey has
      # no affiliate locale (config :ethos, :affiliate_locales only lists
      # "new-york" and "italy") and is not Connecticut, so neither the
      # affiliate widget nor the in-season foliage panel intervenes, and
      # HouseAd.for_page/1's contextual-photo branch fires every time.
      guide =
        published_guide_fixture(%{
          title: "Avon Weekend",
          destination: "Avon, New Jersey",
          state: "New Jersey",
          county: "Monmouth County"
        })

      {:ok, guide} =
        Ethos.Guides.update_guide_photos(guide, [
          %{
            "src" => "/photos/nj/avon/boardwalk.jpg",
            "thumb" => "/photos/nj/avon/boardwalk.jpg",
            "title" => "Avon Boardwalk",
            "description" => "The boardwalk.",
            "author" => "Someone",
            "license" => "CC BY-SA 4.0",
            "source_url" => "https://commons.wikimedia.org/wiki/File:AvonNJ.jpg"
          }
        ])

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "Avon Boardwalk"
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
