defmodule Ethos.PlacesFixturesTest do
  use Ethos.DataCase, async: true

  import Ethos.PlacesFixtures

  describe "place_fixture/1" do
    # These three replace assertions on `town_slug`, `county_slug` and
    # `state_slug`, which the fixture derived from a town/state/county triple.
    # Those columns no longer exist: a place's geography is the destination node
    # it names. Re-pointed rather than deleted, because the property they
    # guarded still matters — the fixture must give a place real geography, or
    # every badge count in the callers below is silently zero.
    test "files the place on the default roster node" do
      place = place_fixture()

      assert Ethos.Destinations.get(place.destination_id).path ==
               "united-states/connecticut/new-haven-county/waterbury"
    end

    test "destination_path: files the place on that node instead" do
      place =
        place_fixture(%{destination_path: "united-states/connecticut/fairfield-county/danbury"})

      node = Ethos.Destinations.get(place.destination_id)

      assert node.path == "united-states/connecticut/fairfield-county/danbury"
      assert node.slug == "danbury"
    end

    test "destination_path: nil makes a place with no node" do
      # The shape a place authored through the admin UI has. `destination_id`
      # is nullable, so this must produce a row rather than raise.
      assert place_fixture(%{destination_path: nil}).destination_id == nil
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
