defmodule Ethos.Seeds.SteakhouseCollectionTest do
  use Ethos.DataCase, async: false

  alias Ethos.Seeds.SteakhouseCollection

  test "attrs/0 describes a published collection with a blurb per guide" do
    attrs = SteakhouseCollection.attrs()

    assert attrs.slug == "steakhouses"
    assert attrs.published == true
    assert String.length(attrs.intro) > 200

    for item <- attrs.items do
      assert String.ends_with?(item.guide_slug, "-steakhouse-guide")
      assert is_binary(item.blurb) and item.blurb != ""
      assert String.length(item.blurb) <= 300
    end
  end

  test "every built roster row has an item, and every item a roster row" do
    roster =
      ["priv", "seed_data", "steakhouse_roster.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    expected =
      for r <- roster,
          r["status"] == "build",
          into: MapSet.new(),
          do: "#{r["slug"]}-steakhouse-guide"

    actual = MapSet.new(SteakhouseCollection.attrs().items, & &1.guide_slug)

    assert MapSet.equal?(actual, expected),
           "collection and roster disagree — only in collection: " <>
             "#{inspect(MapSet.difference(actual, expected))}, " <>
             "only in roster: #{inspect(MapSet.difference(expected, actual))}"
  end

  # `Collections.upsert_collection!/1` writes each item through
  # `Ethos.Collections.CollectionItem.changeset/2`, which caps `:blurb` at 255
  # (lib/ethos/collections/collection_item.ex) — and the column is a varchar(255)
  # underneath. Seven blurbs shipped between 261 and 273 characters and aborted
  # seed_collections/0 in production, leaving the collection unseeded.
  test "every blurb fits the cap CollectionItem enforces" do
    for item <- SteakhouseCollection.attrs().items do
      blurb = item[:blurb] || ""

      assert String.length(blurb) <= 255,
             "#{item[:guide_slug]}: blurb is #{String.length(blurb)} characters, " <>
               "over the 255 CollectionItem.changeset/2 accepts:\n#{blurb}"
    end
  end
end
