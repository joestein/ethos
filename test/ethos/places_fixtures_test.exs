defmodule Ethos.PlacesFixturesTest do
  use Ethos.DataCase, async: true

  import Ethos.PlacesFixtures

  describe "place_fixture/1" do
    test "derives town_slug from the given town" do
      place = place_fixture(%{town: "Danbury"})
      assert place.town_slug == "danbury"
    end

    test "derives county_slug including the -county suffix" do
      place = place_fixture(%{county: "New Haven County"})
      assert place.county_slug == "new-haven-county"
    end

    test "derives state_slug from the given state" do
      place = place_fixture(%{state: "Connecticut"})
      assert place.state_slug == "connecticut"
    end

    test "repeated calls produce distinct places with distinct slugs" do
      # Ethos.Places.upsert_place!/1 UPDATES an existing row when the slug
      # matches rather than raising — a slug collision here would silently
      # return the same place twice instead of failing loudly.
      place1 = place_fixture()
      place2 = place_fixture()

      assert place1.slug != place2.slug
      assert place1.id != place2.id
    end

    test "status: override takes effect" do
      place = place_fixture(%{status: "closed"})
      assert place.status == "closed"
    end

    test "kind: override takes effect" do
      place = place_fixture(%{kind: "restaurant"})
      assert place.kind == "restaurant"
    end
  end
end
