defmodule Ethos.Foliage.TilesTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Tiles

  describe "address/2" do
    test "places central Connecticut on the tile observed from the live service" do
      # Verified against the DEEP tile service on 2026-09-05: 41.6N, 72.7W at
      # zoom 9 is tile x=152, y=190.
      assert {152, 190, _, _} = Tiles.address({-72.7, 41.6}, 9)
    end

    test "pixel offsets are within a tile" do
      {_, _, px, py} = Tiles.address({-72.7, 41.6}, 12)
      assert px in 0..255
      assert py in 0..255
    end

    test "moving east increases x" do
      {x0, _, _, _} = Tiles.address({-73.5, 41.6}, 12)
      {x1, _, _, _} = Tiles.address({-71.9, 41.6}, 12)
      assert x1 > x0
    end

    test "moving north decreases y" do
      {_, y0, _, _} = Tiles.address({-72.7, 42.0}, 12)
      {_, y1, _, _} = Tiles.address({-72.7, 41.0}, 12)
      assert y1 > y0
    end
  end

  describe "tiles_covering/2" do
    test "covers the Connecticut bounding box without gaps" do
      bbox = {-73.8, 40.9, -71.7, 42.1}
      tiles = Tiles.tiles_covering(bbox, 12)

      assert length(tiles) > 100
      assert Enum.uniq(tiles) == tiles

      # Every corner of the bbox must be inside one of the returned tiles.
      for corner <- [{-73.8, 42.1}, {-71.7, 42.1}, {-73.8, 40.9}, {-71.7, 40.9}] do
        {x, y, _, _} = Tiles.address(corner, 12)
        assert {x, y} in tiles
      end
    end
  end

  describe "classify/1" do
    test "classifies the ramp anchors observed on the live tiles" do
      # Every colour below was read from DEEP's tile services on 2026-09-05.
      assert Tiles.classify({0, 115, 8}) == {:ok, :green}
      assert Tiles.classify({20, 115, 23}) == {:ok, :green}
      assert Tiles.classify({115, 182, 15}) == {:ok, :turning}
      assert Tiles.classify({247, 242, 39}) == {:ok, :turning}
      assert Tiles.classify({255, 147, 10}) == {:ok, :near_peak}
      assert Tiles.classify({254, 60, 24}) == {:ok, :peak}
      assert Tiles.classify({145, 0, 3}) == {:ok, :past_peak}
    end

    test "tolerates JPEG drift around an anchor" do
      assert Tiles.classify({2, 117, 10}) == {:ok, :green}
      assert Tiles.classify({251, 58, 27}) == {:ok, :peak}
    end

    test "rejects colours that are not on the ramp" do
      # Road casing, borders, labels and the ocean must not be counted.
      assert Tiles.classify({255, 255, 255}) == :unknown
      assert Tiles.classify({0, 0, 0}) == :unknown
      assert Tiles.classify({160, 160, 160}) == :unknown
    end
  end

  describe "stages/0" do
    test "is ordered from green through past peak" do
      assert Tiles.stages() == [:green, :turning, :near_peak, :peak, :past_peak]
    end
  end
end
