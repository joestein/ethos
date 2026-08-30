defmodule Ethos.Seeds.AntiqueTrailTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Collections, Guides, Places}
  alias Ethos.Seeds

  defp seed_trail!(email) do
    Seeds.ConnecticutPlaces.upsert_all!()
    Seeds.WoodburyGuide.upsert!(email)
    Seeds.AntiqueTrailGuide.upsert!(email)
  end

  test "the trail guide seeds idempotently with every entry linked to a place" do
    user = user_fixture()
    seed_trail!(user.email)
    guide = Seeds.AntiqueTrailGuide.upsert!(user.email)

    assert guide.slug == "antique-trail-of-connecticut"
    assert guide.status == "published"
    assert guide.state == "Connecticut"

    # No county on purpose: the guide lists on the Connecticut destination page
    # rather than under Litchfield County, so it can take in dealers in other
    # counties as later research waves confirm them.
    assert guide.county == nil
    assert guide.county_slug == nil

    entries = Guides.list_entries(guide)
    assert length(entries) == 17
    assert Enum.all?(entries, & &1.place_id), "every trail entry links a place"

    # Idempotent: a second run replaces the entries rather than doubling them.
    assert Guides.list_published_guides()
           |> Enum.count(&(&1.slug == "antique-trail-of-connecticut")) == 1
  end

  test "every trail entry place_slug resolves to a seeded Woodbury shop" do
    Seeds.ConnecticutPlaces.upsert_all!()

    for entry <- Seeds.AntiqueTrailGuide.data().entries do
      place = Places.get_place_by_slug(entry.place_slug)
      assert place, "missing place #{entry.place_slug}"
      assert place.kind == "shop"
      assert place.town == "Woodbury"
    end
  end

  test "the collection lists the trail guide and the Woodbury guide, idempotently" do
    user = user_fixture()
    seed_trail!(user.email)

    first = Seeds.AntiqueTrailCollection.upsert!()
    second = Seeds.AntiqueTrailCollection.upsert!()
    assert first.id == second.id

    collection = Collections.get_published_by_slug("antique-trail-of-ct")
    assert collection.title == "Antique Trail of CT"

    slugs = collection.items |> Enum.sort_by(& &1.position) |> Enum.map(& &1.guide.slug)
    assert slugs == ["antique-trail-of-connecticut", "woodbury-ct-travel-guide"]
  end

  # The "Part of Antique Trail of CT" line on the Woodbury page is rendered
  # from Collections.collections_for_guide/1, so membership is the whole
  # mechanism — there is no template change behind it.
  test "the Woodbury guide belongs to the collection" do
    user = user_fixture()
    seed_trail!(user.email)
    Seeds.AntiqueTrailCollection.upsert!()

    woodbury = Guides.get_published_guide_by_slug!("woodbury-ct-travel-guide")

    assert Collections.collections_for_guide(woodbury) |> Enum.map(& &1.slug) ==
             ["antique-trail-of-ct"]
  end

  # Adorn Vintage and Restoration is a Southbury business that one directory
  # listed at a Woodbury address. It is not on this trail.
  test "the trail names no shop the verification excluded" do
    data = Seeds.AntiqueTrailGuide.data()
    text = inspect(data)

    refute text =~ "Adorn"
    refute text =~ "319 Main Street South"
  end
end
