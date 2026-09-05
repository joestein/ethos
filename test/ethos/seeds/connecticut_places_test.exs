defmodule Ethos.Seeds.ConnecticutPlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places
  alias Ethos.Seeds.ConnecticutPlaces

  # 50 places for the five town guides, plus the 16 Woodbury antiques dealers
  # the Antique Trail guide walks.
  @expected 66

  test "upsert_all! is idempotent and seeds all towns" do
    Ethos.SeedDataHelpers.seed_destinations_for!([ConnecticutPlaces])
    first = ConnecticutPlaces.upsert_all!()
    second = ConnecticutPlaces.upsert_all!()
    assert length(first) == length(second)
    assert length(first) == @expected
    assert Repo.aggregate(Places.Place, :count) == @expected

    assert %{kind: "theater", county_slug: "new-haven-county"} =
             Places.get_place_by_slug!("palace-theater-waterbury")

    assert %{kind: "bnb", county_slug: "litchfield-county"} =
             Places.get_place_by_slug!("1754-house-woodbury")

    for town <- ~w(waterbury middlebury danbury southbury woodbury) do
      assert Places.list_places(town_slug: town) != []
    end
  end

  test "the antiques dealers seed as Woodbury shops that make no trading claim" do
    Ethos.SeedDataHelpers.seed_destinations_for!([ConnecticutPlaces])
    ConnecticutPlaces.upsert_all!()

    shops = Enum.filter(ConnecticutPlaces.places(), &(&1.kind == "shop"))
    assert length(shops) == 16

    for shop <- shops do
      place = Places.get_place_by_slug!(shop.slug)
      assert place.town == "Woodbury"
      assert place.county_slug == "litchfield-county"

      # No dealer in this batch was found closed, and nine of the sixteen
      # could not be shown to be trading at all. "open" is the schema default
      # and renders nothing; a "closed" here would publish a claim the
      # research does not carry.
      assert place.status == "open"
    end
  end

  # Two of the eighteen researched dealers do not ship. Adorn Vintage and
  # Restoration is a Southbury business one directory mislocated in Woodbury
  # (see below). George Champion Modern rested entirely on one unverified line
  # in the association's courtesy list — no website, no state tourism listing,
  # nothing stating what it deals in — and that list is the same one still
  # carrying a company the state revoked in 2013.
  test "George Champion Modern is not in the corpus" do
    slugs = Enum.map(ConnecticutPlaces.places(), & &1.slug)
    refute "george-champion-modern-woodbury" in slugs
  end

  # Adorn Vintage and Restoration was listed at 319 Main Street South by the
  # dealers' association, but the Connecticut registry and the business's own
  # site both place it in Southbury. It is not a Woodbury shop and must not
  # reappear under a Woodbury address.
  test "Adorn Vintage and Restoration is not in the corpus" do
    slugs = Enum.map(ConnecticutPlaces.places(), & &1.slug)
    refute Enum.any?(slugs, &String.contains?(&1, "adorn"))

    # Enum.reject/2 rather than a comprehension binding: in a comprehension
    # `a = p[:address]` is also a truthiness test, so places with no address
    # would vanish rather than be checked.
    addresses =
      ConnecticutPlaces.places() |> Enum.map(& &1[:address]) |> Enum.reject(&is_nil/1)

    refute Enum.any?(addresses, &String.starts_with?(&1, "319 Main Street South"))
  end
end
