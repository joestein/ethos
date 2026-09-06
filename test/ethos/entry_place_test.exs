defmodule Ethos.EntryPlaceTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Guides, Places}

  @place %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    summary: "Historic theater."
  }

  test "public changeset cannot set place_id; privileged can" do
    place = Places.upsert_place!(@place)
    guide = published_guide_fixture()

    {:ok, public_entry} =
      Guides.create_entry(guide, %{"kind" => "sight", "name" => "X", "place_id" => place.id})

    assert public_entry.place_id == nil

    {:ok, priv_entry} =
      Guides.create_entry(
        guide,
        %{"kind" => "sight", "name" => "X", "place_id" => place.id},
        :privileged
      )

    assert priv_entry.place_id == place.id
  end

  test "list_entries preloads place and guides_featuring finds published guides" do
    place = Places.upsert_place!(@place)
    guide = published_guide_fixture()

    {:ok, _} =
      Guides.create_entry(
        guide,
        %{"kind" => "sight", "name" => "X", "place_id" => place.id},
        :privileged
      )

    assert [%{place: %Places.Place{slug: "palace-theater-waterbury"}}] =
             Guides.list_entries(guide)

    assert [found] = Places.guides_featuring(place)
    assert found.id == guide.id
  end
end
