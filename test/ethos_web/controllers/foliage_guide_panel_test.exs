defmodule EthosWeb.FoliageGuidePanelTest do
  use EthosWeb.ConnCase, async: true

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
end
