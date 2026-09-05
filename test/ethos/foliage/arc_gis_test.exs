defmodule Ethos.Foliage.ArcGISTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.ArcGIS

  setup do
    json =
      Path.join([__DIR__, "..", "..", "support", "fixtures", "foliage", "towns_response.json"])
      |> Path.expand()
      |> File.read!()
      |> Jason.decode!()

    %{json: json}
  end

  describe "town_features/1" do
    test "parses attributes and rings into {lon, lat} tuples", %{json: json} do
      features = ArcGIS.town_features(json)

      assert length(features) == 3
      andover = Enum.find(features, &(&1.name == "Andover"))
      assert andover.county == "Tolland"
      assert andover.fips == "09013"
      assert [ring] = andover.rings
      assert {-72.4, 41.7} in ring
    end
  end

  describe "dissolve/1" do
    test "collapses multipart towns to one ring each", %{json: json} do
      dissolved = json |> ArcGIS.town_features() |> ArcGIS.dissolve()

      assert length(dissolved) == 2
      assert Enum.map(dissolved, & &1.name) |> Enum.sort() == ["Andover", "Groton"]
    end

    test "keeps the largest part of a multipart town", %{json: json} do
      groton =
        json |> ArcGIS.town_features() |> ArcGIS.dissolve() |> Enum.find(&(&1.name == "Groton"))

      # The mainland ring spans 0.1 degrees; the island ring spans 0.01. Keeping
      # the island would put Groton's centroid in Long Island Sound.
      {min_x, _, max_x, _} = Ethos.Foliage.Geometry.bbox(groton.ring)
      assert_in_delta max_x - min_x, 0.1, 0.001
    end

    test "carries a slug derived from the town name", %{json: json} do
      dissolved = json |> ArcGIS.town_features() |> ArcGIS.dissolve()
      assert Enum.find(dissolved, &(&1.slug == "andover"))
    end
  end
end
