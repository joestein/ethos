defmodule Ethos.VisitsTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Destinations, Places, Visits}

  defp node!(path, name, kind, parent) do
    Destinations.upsert_destination!(%{
      path: path,
      name: name,
      kind: kind,
      intro: "#{name}.",
      parent_id: parent && parent.id
    })
  end

  setup do
    litchfield_county = node!("connecticut/litchfield-county", "Litchfield County", "county", nil)
    waterbury = node!("connecticut/waterbury", "Waterbury", "town", nil)

    woodbury =
      node!("connecticut/litchfield-county/woodbury", "Woodbury", "town", litchfield_county)

    %{litchfield_county: litchfield_county, waterbury: waterbury, woodbury: woodbury}
  end

  defp place!(node, slug, overrides \\ %{}) do
    Places.upsert_place!(
      Map.merge(
        %{
          slug: slug,
          name: slug,
          kind: "museum",
          summary: "x",
          destination_id: node.id
        },
        overrides
      )
    )
  end

  test "toggle_visit creates then removes; visited? tracks", %{waterbury: waterbury} do
    user = user_fixture()
    place = place!(waterbury, "mattatuck-museum")

    assert {:ok, :visited} = Visits.toggle_visit(user, place)
    assert Visits.visited?(user, place)
    assert {:ok, :unvisited} = Visits.toggle_visit(user, place)
    refute Visits.visited?(user, place)
  end

  test "closed places cannot be checked off", %{waterbury: waterbury} do
    user = user_fixture()
    place = place!(waterbury, "gone", %{status: "closed"})
    assert {:error, :closed} = Visits.toggle_visit(user, place)
  end

  test "count helpers", %{
    waterbury: waterbury,
    woodbury: woodbury,
    litchfield_county: litchfield_county
  } do
    user = user_fixture()
    {:ok, :visited} = Visits.toggle_visit(user, place!(waterbury, "a", %{kind: "restaurant"}))
    {:ok, :visited} = Visits.toggle_visit(user, place!(waterbury, "b", %{kind: "cafe"}))
    {:ok, :visited} = Visits.toggle_visit(user, place!(woodbury, "c"))

    assert Visits.count_for_user(user) == 3
    assert Visits.count_for_user_by_node(user, waterbury.id) == 2
    assert Visits.count_for_user_by_kinds(user, ["restaurant", "cafe"]) == 2
    assert Visits.count_for_user_in_nodes(user, [woodbury.id]) == 1
    assert Visits.count_for_user_in_nodes(user, [waterbury.id, woodbury.id]) == 3
    assert Visits.count_for_user_in_nodes(user, [litchfield_county.id]) == 0
  end
end
