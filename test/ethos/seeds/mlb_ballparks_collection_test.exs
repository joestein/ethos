defmodule Ethos.Seeds.MlbBallparksCollectionTest do
  @moduledoc """
  The membership gate for the Major League Ballparks collection.

  `mlb_clubs_roster_test.exs` asserts the roster names the same thirty venues
  the corpus seeds as `stadium` places. This file asserts the third list — the
  collection's items — names the same thirty guides the catalog seeds.

  Nothing else would say so. A collection missing one guide renders as a page
  of twenty-nine, and the guide it dropped simply stops showing *"Part of
  Major League Ballparks"* under its title. Both are silent: no raise, no
  warning, no count anywhere that disagrees. This is the same class as the
  reflection assertion in `destination_seed_data_test.exs` that found
  `AntiqueTrailGuide` unregistered in the corpus loader gate since it shipped
  — a hand-maintained list beside a mechanically-derived one — except that
  here there are thirty chances to make the omission instead of one.

  So the assertion is on set equality and fails in **both** directions. A
  count alone passes on a collection that lists twenty-nine ballparks and one
  Connecticut town, and "expected 30, got 29" sends the reader to count rows
  rather than to the guide that is missing.
  """

  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Collections, Guides}
  alias Ethos.Seeds.{Catalog, MlbBallparksCollection}

  defp catalog_guide_slugs do
    for {mod, _region} <- Catalog.guide_modules("ballparks"), do: mod.data().slug
  end

  defp item_guide_slugs, do: Enum.map(MlbBallparksCollection.data().items, & &1.guide_slug)

  test "every ballpark guide in the catalog is an item, and every item is one of them" do
    catalog = catalog_guide_slugs()
    items = item_guide_slugs()

    # Non-vacuous. Both lists are derived, and two empty lists are equal.
    assert length(catalog) == 30,
           "expected thirty ballpark guides in the catalog, found #{length(catalog)}"

    assert length(items) == length(Enum.uniq(items)),
           "a guide is listed twice in the collection: " <>
             inspect(items -- Enum.uniq(items))

    missing = catalog -- items
    unexpected = items -- catalog

    assert missing == [],
           "ballpark guides seeded by Ethos.Seeds.Catalog but absent from the " <>
             "mlb-ballparks collection, so their pages show no \"Part of\" line: " <>
             inspect(missing)

    assert unexpected == [],
           "the mlb-ballparks collection lists guides the ballparks region does not seed, " <>
             "so Collections.upsert_collection!/1 will raise at seed time: " <>
             inspect(unexpected)
  end

  # A blurb is the only thing a reader sees on /c/mlb-ballparks besides the
  # title, and `Collections.upsert_collection!/1` accepts a nil one without
  # complaint — `item[:blurb]` on a map with no `:blurb` key is nil, not an
  # error. Thirty items written by hand is thirty chances to leave one bare.
  test "every item carries a blurb" do
    bare =
      for item <- MlbBallparksCollection.data().items,
          is_nil(item[:blurb]) or String.trim(item.blurb) == "",
          do: item.guide_slug

    assert bare == [], "collection items with no blurb: #{inspect(bare)}"
  end

  test "the collection seeds idempotently over the whole ballparks region" do
    user = user_fixture()

    # The place and guide loaders resolve every destination_path against the
    # destinations table and raise on a miss, so the nodes come first.
    Ethos.SeedDataHelpers.seed_code_destinations!()

    for {mod, _r} <- Catalog.place_modules("ballparks"), do: mod.upsert_all!()
    for {mod, _r} <- Catalog.guide_modules("ballparks"), do: mod.upsert!(user.email)

    first = MlbBallparksCollection.upsert!()
    second = MlbBallparksCollection.upsert!()
    assert first.id == second.id

    collection = Collections.get_published_by_slug("mlb-ballparks")
    assert collection.title == "Major League Ballparks"
    assert length(collection.items) == 30

    slugs = collection.items |> Enum.sort_by(& &1.position) |> Enum.map(& &1.guide.slug)
    assert slugs == item_guide_slugs()

    # The "Part of Major League Ballparks" line on every ballpark page is
    # rendered from Collections.collections_for_guide/1 by the existing
    # template line at guide_html/show.html.heex:7-9. Membership is the whole
    # mechanism; no template change was made, and this asserts none is needed.
    for slug <- catalog_guide_slugs() do
      guide = Guides.get_published_guide_by_slug!(slug)

      assert "mlb-ballparks" in (guide
                                 |> Collections.collections_for_guide()
                                 |> Enum.map(& &1.slug)),
             "#{slug} would render no \"Part of Major League Ballparks\" line"
    end
  end
end
