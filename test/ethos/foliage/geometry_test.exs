defmodule Ethos.Foliage.GeometryTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Geometry

  describe "slugify/1" do
    test "lowercases and hyphenates town names" do
      assert Geometry.slugify("New Hartford") == "new-hartford"
      assert Geometry.slugify("Windsor Locks") == "windsor-locks"
      assert Geometry.slugify("New Haven & Neighborhood") == "new-haven-neighborhood"
    end
  end

  describe "centroid/1" do
    test "returns the centre of a unit square" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      assert {x, y} = Geometry.centroid(square)
      assert_in_delta x, 1.0, 0.0001
      assert_in_delta y, 1.0, 0.0001
    end

    test "is area-weighted, not vertex-averaged" do
      # An L shape: vertex-averaging would pull the point off-centre differently
      # than area-weighting. This asserts we did the area-weighted version.
      l_shape = [{0.0, 0.0}, {4.0, 0.0}, {4.0, 1.0}, {1.0, 1.0}, {1.0, 4.0}, {0.0, 4.0}]
      assert {x, y} = Geometry.centroid(l_shape)
      assert_in_delta x, 1.0, 0.4
      assert_in_delta y, 1.0, 0.4
    end
  end

  describe "point_in_polygon?/2" do
    setup do
      %{square: [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]}
    end

    test "detects interior points", %{square: square} do
      assert Geometry.point_in_polygon?({1.0, 1.0}, square)
    end

    test "rejects exterior points", %{square: square} do
      refute Geometry.point_in_polygon?({3.0, 1.0}, square)
      refute Geometry.point_in_polygon?({1.0, -1.0}, square)
    end

    test "handles a concave polygon" do
      # A C shape open to the right; the notch is outside.
      c = [
        {0.0, 0.0},
        {3.0, 0.0},
        {3.0, 1.0},
        {1.0, 1.0},
        {1.0, 2.0},
        {3.0, 2.0},
        {3.0, 3.0},
        {0.0, 3.0}
      ]

      assert Geometry.point_in_polygon?({0.5, 1.5}, c)
      refute Geometry.point_in_polygon?({2.0, 1.5}, c)
    end
  end

  describe "simplify/2" do
    test "drops collinear points" do
      line = [{0.0, 0.0}, {1.0, 0.0}, {2.0, 0.0}, {3.0, 0.0}]
      assert Geometry.simplify(line, 0.01) == [{0.0, 0.0}, {3.0, 0.0}]
    end

    test "keeps points that exceed the tolerance" do
      spike = [{0.0, 0.0}, {1.0, 1.0}, {2.0, 0.0}]
      assert Geometry.simplify(spike, 0.5) == spike
    end

    test "never returns fewer than two points" do
      assert length(Geometry.simplify([{0.0, 0.0}, {1.0, 0.0}], 100.0)) == 2
    end
  end

  describe "sample_points/3" do
    test "returns the requested number of interior points" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      points = Geometry.sample_points(square, 25, 42)

      assert length(points) == 25
      assert Enum.all?(points, &Geometry.point_in_polygon?(&1, square))
    end

    test "is deterministic for a given seed" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      assert Geometry.sample_points(square, 10, 7) == Geometry.sample_points(square, 10, 7)
    end

    test "differs across seeds" do
      square = [{0.0, 0.0}, {2.0, 0.0}, {2.0, 2.0}, {0.0, 2.0}]
      refute Geometry.sample_points(square, 10, 7) == Geometry.sample_points(square, 10, 8)
    end
  end

  describe "project/3" do
    test "maps the bbox corners to the viewBox corners" do
      bbox = {-73.7, 40.9, -71.7, 42.1}
      assert {x0, y0} = Geometry.project({-73.7, 42.1}, bbox, {800, 520})
      assert {x1, y1} = Geometry.project({-71.7, 40.9}, bbox, {800, 520})

      assert_in_delta x0, 0.0, 0.01
      assert_in_delta y0, 0.0, 0.01
      assert_in_delta x1, 800.0, 0.01
      assert_in_delta y1, 520.0, 0.01
    end

    test "y increases southward" do
      bbox = {-73.7, 40.9, -71.7, 42.1}
      {_, north} = Geometry.project({-72.7, 42.0}, bbox, {800, 520})
      {_, south} = Geometry.project({-72.7, 41.0}, bbox, {800, 520})
      assert south > north
    end
  end
end
