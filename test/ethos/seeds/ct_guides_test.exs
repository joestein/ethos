defmodule Ethos.Seeds.CtGuidesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds

  # The county each guide sits under is a segment of its destination node's
  # path now rather than a column of its own, so the expectation is the path.
  @towns [
    {Seeds.WaterburyGuide, "waterbury-ct-travel-guide",
     "united-states/connecticut/new-haven-county/waterbury"},
    {Seeds.MiddleburyGuide, "middlebury-ct-travel-guide",
     "united-states/connecticut/new-haven-county/middlebury"},
    {Seeds.DanburyGuide, "danbury-ct-travel-guide",
     "united-states/connecticut/fairfield-county/danbury"},
    {Seeds.SouthburyGuide, "southbury-ct-travel-guide",
     "united-states/connecticut/new-haven-county/southbury"},
    {Seeds.WoodburyGuide, "woodbury-ct-travel-guide",
     "united-states/connecticut/litchfield-county/woodbury"}
  ]

  test "all five guides seed idempotently with linked entries" do
    user = user_fixture()
    Ethos.SeedDataHelpers.seed_destinations_for!([Seeds.ConnecticutPlaces])
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, slug, node_path} <- @towns do
      guide = mod.upsert!(user.email)
      guide = mod.upsert!(user.email)

      assert guide.slug == slug
      assert guide.status == "published"
      assert Ethos.Repo.preload(guide, :destination_node).destination_node.path == node_path
      assert guide.intro != nil
      assert guide.sections != []
      assert guide.faq != []

      entries = Guides.list_entries(guide)
      assert entries != []
      assert Enum.all?(entries, & &1.place_id), "every CT entry links a place"
    end

    # idempotency: no duplicate guides or entries
    assert length(Ethos.SeedDataHelpers.published_guides_under("united-states/connecticut")) ==
             5
  end

  test "every entry place_slug resolves to a seeded place" do
    Ethos.SeedDataHelpers.seed_destinations_for!([Seeds.ConnecticutPlaces])
    Seeds.ConnecticutPlaces.upsert_all!()

    for {mod, _slug, _node_path} <- @towns,
        entry <- mod.data().entries do
      assert Places.get_place_by_slug(entry.place_slug), "missing place #{entry.place_slug}"
    end
  end
end
