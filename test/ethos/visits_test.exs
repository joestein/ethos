defmodule Ethos.VisitsTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Places, Visits}

  defp place!(slug, overrides \\ %{}) do
    Places.upsert_place!(
      Map.merge(
        %{
          slug: slug,
          name: slug,
          kind: "museum",
          town: "Waterbury",
          state: "Connecticut",
          county: "New Haven County",
          summary: "x"
        },
        overrides
      )
    )
  end

  test "toggle_visit creates then removes; visited? tracks" do
    user = user_fixture()
    place = place!("mattatuck-museum")

    assert {:ok, :visited} = Visits.toggle_visit(user, place)
    assert Visits.visited?(user, place)
    assert {:ok, :unvisited} = Visits.toggle_visit(user, place)
    refute Visits.visited?(user, place)
  end

  test "closed places cannot be checked off" do
    user = user_fixture()
    place = place!("gone", %{status: "closed"})
    assert {:error, :closed} = Visits.toggle_visit(user, place)
  end

  test "count helpers" do
    user = user_fixture()
    {:ok, :visited} = Visits.toggle_visit(user, place!("a", %{kind: "restaurant"}))
    {:ok, :visited} = Visits.toggle_visit(user, place!("b", %{kind: "cafe"}))

    {:ok, :visited} =
      Visits.toggle_visit(user, place!("c", %{town: "Woodbury", county: "Litchfield County"}))

    assert Visits.count_for_user(user) == 3
    assert Visits.count_for_user_by_town(user, "waterbury") == 2
    assert Visits.count_for_user_by_kinds(user, ["restaurant", "cafe"]) == 2
    assert Visits.count_for_user_in_county(user, "connecticut", "litchfield-county") == 1
  end
end
