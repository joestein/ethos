defmodule Ethos.Seeds.BurysCollectionTest do
  # Sync, like every other test that loads a corpus. This one seeds the whole
  # destination roster, the whole Connecticut places corpus and ten guides in a
  # single transaction; run concurrently with the other async tests that write
  # those same rows it deadlocked, reproducibly, on the Connecticut place
  # inserts. Its siblings — the per-directory seed-data gates — are `async:
  # false` for the same reason.
  use Ethos.DataCase, async: false

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

  # The other five Burys are data-driven seed files rather than code modules.
  @data_bury_towns ~w(salisbury roxbury simsbury glastonbury canterbury)

  @expected_slugs_in_position_order [
    "waterbury-ct-travel-guide",
    "danbury-ct-travel-guide",
    "middlebury-ct-travel-guide",
    "southbury-ct-travel-guide",
    "woodbury-ct-travel-guide",
    "salisbury-ct-travel-guide",
    "roxbury-ct-travel-guide",
    "simsbury-ct-travel-guide",
    "glastonbury-ct-travel-guide",
    "canterbury-ct-travel-guide"
  ]

  defp bury_seed_files do
    for town <- @data_bury_towns,
        do: Path.expand("../../../priv/seed_data/connecticut/#{town}.json", __DIR__)
  end

  test "seeds The Burys of Connecticut collection idempotently with stable item order" do
    user = user_fixture()

    # The loaders resolve every seed file's destination_path against the
    # destinations table and raise on a miss, so the roster is a precondition
    # of any corpus load — Ethos.Release seeds it before every corpus for the
    # same reason.
    Ethos.Seeds.DestinationTree.upsert_all!()

    Seeds.ConnecticutPlaces.upsert_all!()
    for mod <- @town_modules, do: mod.upsert!(user.email)

    files = bury_seed_files()
    Enum.each(files, &Seeds.DataGuide.upsert_places!/1)
    Enum.each(files, &Seeds.DataGuide.upsert_guide!(&1, user.email))

    collection1 = Seeds.BurysCollection.upsert!()
    collection2 = Seeds.BurysCollection.upsert!()

    assert collection1.id == collection2.id
    assert collection2.published == true

    collection = Collections.get_published_by_slug("the-burys-of-connecticut")
    assert collection.id == collection1.id
    assert length(collection.items) == 10

    slugs_in_position_order =
      collection.items
      |> Enum.sort_by(& &1.position)
      |> Enum.map(& &1.guide.slug)

    assert slugs_in_position_order == @expected_slugs_in_position_order

    assert Repo.aggregate(
             from(i in CollectionItem, where: i.collection_id == ^collection.id),
             :count
           ) == 10
  end
end
