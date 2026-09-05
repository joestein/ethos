defmodule EthosWeb.FoliageGuidePanelTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias EthosWeb.GuideController

  describe "foliage_assign/2" do
    test "returns nil outside the season" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "connecticut",
        destination_slug: "avon"
      }

      assert GuideController.foliage_assign(guide, ~D[2026-06-15]) == nil
    end

    test "returns nil for a guide outside Connecticut" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "new-york",
        destination_slug: "brooklyn"
      }

      assert GuideController.foliage_assign(guide, ~D[2026-10-15]) == nil
    end

    test "returns the town for a Connecticut town guide regardless of tier" do
      # Only 10 of the 169 CT town guides carry tier "town-page"; the rest are
      # plain "guide". Presence in the foliage dataset is the real gate.
      guide = %Ethos.Guides.Guide{
        tier: "guide",
        state_slug: "connecticut",
        destination_slug: "avon"
      }

      assert %{town: %{name: "Avon"}} = GuideController.foliage_assign(guide, ~D[2026-10-15])
    end

    test "returns nil for a Connecticut town with no foliage record" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "connecticut",
        destination_slug: "mystic"
      }

      assert GuideController.foliage_assign(guide, ~D[2026-10-15]) == nil
    end

    test "returns the town, stage and week in season" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "connecticut",
        destination_slug: "avon"
      }

      assert %{town: town, stage: stage, week: week} =
               GuideController.foliage_assign(guide, ~D[2026-10-15])

      assert town.name == "Avon"
      assert stage in [:green, :turning, :near_peak, :peak, :past_peak]
      assert week in 1..9
    end

    test "names the route when the town is on one" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "connecticut",
        destination_slug: "avon"
      }

      assert %{route: %{slug: "hartford-west"}} =
               GuideController.foliage_assign(guide, ~D[2026-10-15])
    end

    test "leaves route nil for a town on no route" do
      guide = %Ethos.Guides.Guide{
        tier: "town-page",
        state_slug: "connecticut",
        destination_slug: "bozrah"
      }

      assert %{route: nil} = GuideController.foliage_assign(guide, ~D[2026-10-15])
    end
  end

  # Deleting `<EthosWeb.FoliagePanel.foliage_panel foliage={@foliage} />` from
  # either guide template leaves every test above green — they call
  # foliage_assign/2 directly and never touch a template. These render real
  # pages through the actual controller, which is the only path that would
  # catch that regression.
  #
  # This depends on the wall clock: `foliage_assign/2` defaults to
  # `Date.utc_today()`, which the test cannot override through an HTTP
  # request, and the panel only renders in season (Sept 1 - Nov 30). At the
  # time this was written, today is 2026-09-05, in season, so the assertions
  # below are the direct ones. The static assertions further down (that both
  # templates still reference `FoliagePanel`) do not depend on the date, and
  # exist so this file still catches the regression the other eleven months
  # of the year.
  describe "rendering on the guide page (in-season, present-day-dependent)" do
    test "a Connecticut town guide (plain tier, show.html.heex) shows the panel" do
      user = user_fixture()
      # upsert_from_file!/2 also replays the file's page links, which name
      # neighbouring CT town guides this test does not seed — resolving them
      # is Ethos.Foliage.LinkBuilderTest's job, not this one's, so seed only
      # places and the guide itself.
      path = Path.expand("../../../priv/seed_data/connecticut/avon.json", __DIR__)
      Ethos.Seeds.DataGuide.upsert_places!(path)
      guide = Ethos.Seeds.DataGuide.upsert_guide!(path, user.email)

      assert guide.tier == "guide"

      html = build_conn() |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Foliage"
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
    end

    test "a Connecticut town guide (town-page tier, town_page.html.heex) shows the panel" do
      user = user_fixture()
      path = Path.expand("../../../priv/seed_data/connecticut/andover.json", __DIR__)
      Ethos.Seeds.DataGuide.upsert_places!(path)
      guide = Ethos.Seeds.DataGuide.upsert_guide!(path, user.email)

      assert guide.tier == "town-page"

      html = build_conn() |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Foliage"
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
    end

    test "a non-Connecticut guide page does not show the panel" do
      guide = published_guide_fixture(%{destination: "Lisbon, Portugal"})

      html = build_conn() |> get(~p"/g/#{guide.slug}") |> html_response(200)

      refute html =~ "<h2 class=\"font-semibold\">Foliage</h2>"
    end
  end

  # Same present-day dependency as the section above: the panel only renders
  # in season, and today (2026-09-05) is in season.
  describe "the peak/most-advanced distinction on the guide panel (spec §5)" do
    test "Greenwich (never reaches peak) says most advanced, not estimated peak" do
      user = user_fixture()
      path = Path.expand("../../../priv/seed_data/connecticut/greenwich.json", __DIR__)
      Ethos.Seeds.DataGuide.upsert_places!(path)
      guide = Ethos.Seeds.DataGuide.upsert_guide!(path, user.email)

      town = Ethos.Foliage.town("greenwich")
      refute Ethos.Foliage.peak_verified?(town)

      html = build_conn() |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "most advanced #{Ethos.Foliage.peak_label(town)}"
      refute html =~ "estimated peak"
    end

    test "Salisbury (reaches peak) says estimated peak, not most advanced" do
      user = user_fixture()
      path = Path.expand("../../../priv/seed_data/connecticut/salisbury.json", __DIR__)
      Ethos.Seeds.DataGuide.upsert_places!(path)
      guide = Ethos.Seeds.DataGuide.upsert_guide!(path, user.email)

      town = Ethos.Foliage.town("salisbury")
      assert Ethos.Foliage.peak_verified?(town)

      html = build_conn() |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "estimated peak #{Ethos.Foliage.peak_label(town)}"
      refute html =~ "most advanced"
    end
  end

  describe "the guide templates still call the foliage panel component" do
    test "show.html.heex references FoliagePanel" do
      assert File.read!("lib/ethos_web/controllers/guide_html/show.html.heex") =~
               "FoliagePanel.foliage_panel"
    end

    test "town_page.html.heex references FoliagePanel" do
      assert File.read!("lib/ethos_web/controllers/guide_html/town_page.html.heex") =~
               "FoliagePanel.foliage_panel"
    end
  end
end
