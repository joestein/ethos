defmodule Mix.Tasks.Ethos.MigrateGeoTest do
  use ExUnit.Case, async: true

  alias Mix.Tasks.Ethos.MigrateGeo

  test "maps each corpus to its full ancestry path" do
    assert MigrateGeo.path_for("connecticut", "Connecticut", "Litchfield County", "Woodbury") ==
             "united-states/connecticut/litchfield-county/woodbury"

    assert MigrateGeo.path_for("manhattan", "New York", "Manhattan", "Alphabet City") ==
             "united-states/new-york/new-york-city/manhattan/alphabet-city"

    assert MigrateGeo.path_for("brooklyn", "New York", "Brooklyn", "Bath Beach") ==
             "united-states/new-york/new-york-city/brooklyn/bath-beach"

    assert MigrateGeo.path_for("queens", "New York", "Queens", "Astoria") ==
             "united-states/new-york/new-york-city/queens/astoria"

    assert MigrateGeo.path_for("bronx", "New York", "Bronx", "Belmont") ==
             "united-states/new-york/new-york-city/bronx/belmont"

    assert MigrateGeo.path_for("san_francisco", "California", "San Francisco", "The Castro") ==
             "united-states/california/san-francisco/the-castro"

    assert MigrateGeo.path_for("rome", "Italy", "Rome", "Ardeatino") ==
             "italy/lazio/rome/ardeatino"

    assert MigrateGeo.path_for("london", "England", "London", "Barking and Dagenham") ==
             "united-kingdom/england/london/barking-and-dagenham"
  end

  test "London places nest their town under the guide's borough" do
    borough = "united-kingdom/england/london/barking-and-dagenham"

    assert MigrateGeo.place_path_for("london", borough, "Barking") ==
             "united-kingdom/england/london/barking-and-dagenham/barking"

    # A place whose town is the borough attaches to the borough itself.
    assert MigrateGeo.place_path_for("london", borough, "Barking and Dagenham") == borough
  end

  test "every other corpus puts places on the same node as their guide" do
    node = "italy/lazio/rome/ardeatino"
    assert MigrateGeo.place_path_for("rome", node, "Ardeatino") == node
    assert MigrateGeo.place_path_for("connecticut", "x/y/z/andover", "Andover") == "x/y/z/andover"
  end

  test "raises on a corpus it has no rule for rather than guessing" do
    assert_raise ArgumentError, ~r/no mapping rule/, fn ->
      MigrateGeo.path_for("atlantis", "Atlantis", "Deep", "Trench")
    end
  end
end
