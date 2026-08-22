defmodule Ethos.Seeds.CtGuidesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds

  @towns [
    {Seeds.WaterburyGuide, "waterbury-ct-travel-guide", "New Haven County"},
    {Seeds.MiddleburyGuide, "middlebury-ct-travel-guide", "New Haven County"},
    {Seeds.DanburyGuide, "danbury-ct-travel-guide", "Fairfield County"},
    {Seeds.SouthburyGuide, "southbury-ct-travel-guide", "New Haven County"},
    {Seeds.WoodburyGuide, "woodbury-ct-travel-guide", "Litchfield County"}
  ]

  test "all five guides seed idempotently with linked entries" do
    user = user_fixture()
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, slug, county} <- @towns do
      guide = mod.upsert!(user.email)
      guide = mod.upsert!(user.email)

      assert guide.slug == slug
      assert guide.status == "published"
      assert guide.state == "Connecticut"
      assert guide.county == county
      assert guide.intro != nil
      assert guide.sections != []
      assert guide.faq != []

      entries = Guides.list_entries(guide)
      assert entries != []
      assert Enum.all?(entries, & &1.place_id), "every CT entry links a place"
    end

    # idempotency: no duplicate guides or entries
    assert Guides.list_published_guides() |> Enum.count(&(&1.state == "Connecticut")) == 5
  end

  test "every entry place_slug resolves to a seeded place" do
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, _slug, _county} <- @towns,
        entry <- mod.data().entries do
      assert Places.get_place_by_slug(entry.place_slug), "missing place #{entry.place_slug}"
    end
  end
end
