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
end
