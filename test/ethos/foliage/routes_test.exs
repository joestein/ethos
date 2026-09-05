defmodule Ethos.Foliage.RoutesTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Routes

  describe "order_along/2" do
    test "orders towns by their position along the polyline" do
      # A path running west to east.
      path = [{-73.0, 41.5}, {-72.0, 41.5}, {-71.0, 41.5}]

      towns = [
        %{slug: "east", lat: 41.5, lng: -71.1},
        %{slug: "west", lat: 41.5, lng: -72.9},
        %{slug: "middle", lat: 41.5, lng: -72.0}
      ]

      assert Routes.order_along(path, towns) == ["west", "middle", "east"]
    end

    test "handles a path that doubles back" do
      # Out east then back west; a town near the turn should not sort last.
      path = [{-73.0, 41.5}, {-71.0, 41.5}, {-73.0, 41.6}]

      towns = [
        %{slug: "start", lat: 41.5, lng: -72.9},
        %{slug: "turn", lat: 41.5, lng: -71.1},
        %{slug: "return", lat: 41.6, lng: -72.9}
      ]

      assert Routes.order_along(path, towns) == ["start", "turn", "return"]
    end
  end

  describe "guide_slug_for/2" do
    setup do
      %{
        published:
          MapSet.new([
            "avon-ct-travel-guide",
            "hartford-ct-travel-guide",
            "storrs-ct-travel-guide"
          ])
      }
    end

    test "resolves the conventional slug", %{published: published} do
      assert Routes.guide_slug_for("avon", published) == "avon-ct-travel-guide"
    end

    test "resolves Mansfield through the Storrs guide", %{published: published} do
      # Mansfield is the one CT town with no guide of its own. Storrs is a
      # village in Mansfield and its guide is what covers the town.
      assert Routes.guide_slug_for("mansfield", published) == "storrs-ct-travel-guide"
    end

    test "returns nil when no guide is published", %{published: published} do
      assert Routes.guide_slug_for("bozrah", published) == nil
    end
  end
end
