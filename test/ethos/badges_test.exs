defmodule Ethos.BadgesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Badges, Places, Visits}

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

  defp visit!(user, place) do
    {:ok, :visited} = Visits.toggle_visit(user, place)
    Badges.check_and_award(user, place)
  end

  test "first visit awards first-steps only (with county not yet complete)" do
    user = user_fixture()
    place!("p1")
    place!("p2")

    awarded = visit!(user, Places.get_place_by_slug!("p1"))
    assert Enum.map(awarded, & &1.key) == ["first-steps"]
  end

  test "5th Waterbury place awards explorer-waterbury at the boundary" do
    user = user_fixture()
    places = for i <- 1..5, do: place!("wtby-#{i}")
    extra = place!("wtby-6")

    [p1, p2, p3, p4, p5] = places
    visit!(user, p1)
    visit!(user, p2)
    visit!(user, p3)
    assert visit!(user, p4) == []

    awarded = visit!(user, p5)
    assert "explorer-waterbury" in Enum.map(awarded, & &1.key)

    # already earned — not re-awarded
    assert visit!(user, extra) |> Enum.map(& &1.key) |> Enum.member?("explorer-waterbury") ==
             false
  end

  test "foodie counts restaurant/cafe/brewery kinds" do
    user = user_fixture()

    for {slug, kind} <- [
          {"r1", "restaurant"},
          {"r2", "cafe"},
          {"r3", "brewery"},
          {"r4", "restaurant"}
        ] do
      visit!(user, place!(slug, %{kind: kind}))
    end

    awarded = visit!(user, place!("r5", %{kind: "restaurant"}))
    assert "foodie" in Enum.map(awarded, & &1.key)
  end

  test "county-complete awards when every open place in the county is visited" do
    user = user_fixture()
    a = place!("only-a", %{town: "Woodbury", county: "Litchfield County"})
    b = place!("only-b", %{town: "Woodbury", county: "Litchfield County"})
    place!("closed-c", %{town: "Woodbury", county: "Litchfield County", status: "closed"})

    visit!(user, a)
    awarded = visit!(user, b)
    assert "county-complete-litchfield-county" in Enum.map(awarded, & &1.key)
  end

  test "un-visiting does not revoke badges" do
    user = user_fixture()
    p = place!("keep")
    awarded_keys = visit!(user, p) |> Enum.map(& &1.key) |> Enum.sort()
    # sole open place in its county: both badges land on the first visit
    assert awarded_keys == ["county-complete-new-haven-county", "first-steps"]

    {:ok, :unvisited} = Visits.toggle_visit(user, p)

    assert Badges.earned_badges(user) |> Enum.map(& &1.badge_key) |> Enum.sort() ==
             awarded_keys
  end

  test "definitions include dynamic county badges for counties with open places" do
    place!("x1")
    keys = Badges.definitions() |> Enum.map(& &1.key)
    assert "county-complete-new-haven-county" in keys
    assert "first-steps" in keys
  end

  describe "dynamic town explorer badges" do
    test "CT towns keep their historical names and thresholds" do
      # a town needs >=3 open places for its dynamic badge to exist at all
      for i <- 1..3, do: place!("w-#{i}")
      # Middlebury: give it 5+ open places, threshold must still be 3
      for i <- 1..5, do: place!("mid-#{i}", %{town: "Middlebury"})

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "Brass City Explorer", rule: {:town, "waterbury", 5}} =
               defs["explorer-waterbury"]

      assert %{name: "Middlebury Explorer", rule: {:town, "middlebury", 3}} =
               defs["explorer-middlebury"]
    end

    test "new towns get default names and min(5, count) thresholds; <3 places emit none" do
      for i <- 1..3,
          do: place!("soho-#{i}", %{town: "SoHo", state: "New York", county: "Manhattan"})

      for i <- 1..7,
          do: place!("harlem-#{i}", %{town: "Harlem", state: "New York", county: "Manhattan"})

      place!("tiny-1", %{town: "Two Bridges", state: "New York", county: "Manhattan"})

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "SoHo Explorer", rule: {:town, "soho", 3}} = defs["explorer-soho"]
      assert %{name: "Harlem Explorer", rule: {:town, "harlem", 5}} = defs["explorer-harlem"]
      refute Map.has_key?(defs, "explorer-two-bridges")
    end

    test "closed places don't count toward the dynamic threshold basis" do
      for i <- 1..2, do: place!("x-#{i}", %{town: "Xtown"})
      place!("x-closed", %{town: "Xtown", status: "closed"})

      refute Enum.any?(Badges.definitions(), &(&1.key == "explorer-xtown"))
    end
  end
end
