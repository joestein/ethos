defmodule Ethos.Seeds.BurysCollectionTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.Collections
  alias Ethos.Collections.CollectionItem
  alias Ethos.Seeds

  @town_modules [
    Seeds.WaterburyGuide,
    Seeds.DanburyGuide,
    Seeds.MiddleburyGuide,
    Seeds.SouthburyGuide,
    Seeds.WoodburyGuide
  ]

  @expected_slugs_in_position_order [
    "waterbury-ct-travel-guide",
    "danbury-ct-travel-guide",
    "middlebury-ct-travel-guide",
    "southbury-ct-travel-guide",
    "woodbury-ct-travel-guide"
  ]

  test "seeds The Burys of Connecticut collection idempotently with stable item order" do
    user = user_fixture()

    Seeds.ConnecticutPlaces.upsert_all!()
    for mod <- @town_modules, do: mod.upsert!(user.email)

    collection1 = Seeds.BurysCollection.upsert!()
    collection2 = Seeds.BurysCollection.upsert!()

    assert collection1.id == collection2.id
    assert collection2.published == true

    collection = Collections.get_published_by_slug("the-burys-of-connecticut")
    assert collection.id == collection1.id
    assert length(collection.items) == 5

    slugs_in_position_order =
      collection.items
      |> Enum.sort_by(& &1.position)
      |> Enum.map(& &1.guide.slug)

    assert slugs_in_position_order == @expected_slugs_in_position_order

    assert Repo.aggregate(
             from(i in CollectionItem, where: i.collection_id == ^collection.id),
             :count
           ) == 5
  end
end
