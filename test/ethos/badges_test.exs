defmodule Ethos.BadgesTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Badges, Destinations, Places, Social}

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
    connecticut = node!("connecticut", "Connecticut", "region", nil)

    new_haven_county =
      node!("connecticut/new-haven-county", "New Haven County", "county", connecticut)

    litchfield_county =
      node!("connecticut/litchfield-county", "Litchfield County", "county", connecticut)

    waterbury =
      node!("connecticut/new-haven-county/waterbury", "Waterbury", "town", new_haven_county)

    middlebury =
      node!("connecticut/new-haven-county/middlebury", "Middlebury", "town", new_haven_county)

    woodbury =
      node!("connecticut/litchfield-county/woodbury", "Woodbury", "town", litchfield_county)

    bethlehem =
      node!("connecticut/litchfield-county/bethlehem", "Bethlehem", "town", litchfield_county)

    xtown = node!("connecticut/litchfield-county/xtown", "Xtown", "town", litchfield_county)

    new_york = node!("new-york", "New York", "region", nil)
    manhattan = node!("new-york/manhattan", "Manhattan", "borough", new_york)
    soho = node!("new-york/manhattan/soho", "SoHo", "neighborhood", manhattan)
    harlem = node!("new-york/manhattan/harlem", "Harlem", "neighborhood", manhattan)

    two_bridges =
      node!("new-york/manhattan/two-bridges", "Two Bridges", "neighborhood", manhattan)

    %{
      new_haven_county: new_haven_county,
      litchfield_county: litchfield_county,
      waterbury: waterbury,
      middlebury: middlebury,
      woodbury: woodbury,
      bethlehem: bethlehem,
      xtown: xtown,
      manhattan: manhattan,
      soho: soho,
      harlem: harlem,
      two_bridges: two_bridges
    }
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

  # Reacting awards badges as a side effect, so this reports the difference
  # rather than calling check_and_award/2 a second time — a second call always
  # returns [] because the badges already landed. Shaped as %{key: ...} maps so
  # every existing assertion below still reads `& &1.key`.
  defp visit!(user, place) do
    before = MapSet.new(Badges.earned_badges(user), & &1.badge_key)

    {:ok, _outcome} = Social.react(user, place, "up")

    Badges.earned_badges(user)
    |> Enum.reject(&MapSet.member?(before, &1.badge_key))
    |> Enum.map(&%{key: &1.badge_key})
  end

  test "first visit awards first-steps only (with county not yet complete)", %{
    waterbury: waterbury
  } do
    user = user_fixture()
    place!(waterbury, "p1")
    place!(waterbury, "p2")

    awarded = visit!(user, Places.get_place_by_slug!("p1"))
    assert Enum.map(awarded, & &1.key) == ["first-steps"]
  end

  test "5th Waterbury place awards explorer-waterbury at the boundary", %{waterbury: waterbury} do
    user = user_fixture()
    places = for i <- 1..5, do: place!(waterbury, "wtby-#{i}")
    extra = place!(waterbury, "wtby-6")

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

  test "foodie counts restaurant/cafe/brewery kinds", %{waterbury: waterbury} do
    user = user_fixture()

    for {slug, kind} <- [
          {"r1", "restaurant"},
          {"r2", "cafe"},
          {"r3", "brewery"},
          {"r4", "restaurant"}
        ] do
      visit!(user, place!(waterbury, slug, %{kind: kind}))
    end

    awarded = visit!(user, place!(waterbury, "r5", %{kind: "restaurant"}))
    assert "foodie" in Enum.map(awarded, & &1.key)
  end

  test "county-complete awards when every open place in the county is visited", %{
    woodbury: woodbury
  } do
    user = user_fixture()
    a = place!(woodbury, "only-a")
    b = place!(woodbury, "only-b")
    place!(woodbury, "closed-c", %{status: "closed"})

    visit!(user, a)
    awarded = visit!(user, b)
    assert "county-complete-litchfield-county" in Enum.map(awarded, & &1.key)
  end

  # The county-tier badge spans every town beneath it, not just the town the
  # place happens to be attached to — this is the behavior
  # `Destinations.descendant_ids/1` makes possible: Woodbury and Bethlehem
  # are different destination nodes, both under Litchfield County, and neither
  # alone completes it.
  test "county-complete aggregates open places across every town in the county", %{
    woodbury: woodbury,
    bethlehem: bethlehem
  } do
    user = user_fixture()
    a = place!(woodbury, "woodbury-a")
    b = place!(bethlehem, "bethlehem-a")

    assert visit!(user, a)
           |> Enum.map(& &1.key)
           |> Enum.member?("county-complete-litchfield-county") ==
             false

    awarded = visit!(user, b)
    assert "county-complete-litchfield-county" in Enum.map(awarded, & &1.key)
  end

  # Regression for the deleted closed-place guard: `reacted_place_count_in_nodes/2`
  # counts all reacted places while `Places.count_open_places_in_nodes/1` counts
  # open ones only. Before `Social.react/3` refused closed places, a user could
  # react to every closed place plus fewer than all the open ones and still trip
  # `reacted_count >= open_count`, awarding "County Complete" with open places
  # never touched — permanently, since badges are never revoked.
  test "county-complete is not awarded early via reactions to closed places", %{
    bethlehem: bethlehem
  } do
    user = user_fixture()
    open_a = place!(bethlehem, "open-a")
    open_b = place!(bethlehem, "open-b")
    open_c = place!(bethlehem, "open-c")

    closed_a = place!(bethlehem, "closed-a", %{status: "closed"})
    closed_b = place!(bethlehem, "closed-b", %{status: "closed"})

    # Reacting to a closed place must be refused outright, not just excluded
    # from the county-complete count.
    assert {:error, :closed} = Social.react(user, closed_a, "up")
    assert {:error, :closed} = Social.react(user, closed_b, "up")

    # Only 1 of the 3 open places reacted to — county is not complete.
    visit!(user, open_a)

    refute Badges.earned_badges(user)
           |> Enum.any?(&(&1.badge_key == "county-complete-litchfield-county"))

    # Completing the remaining open places does award it — proves the badge
    # rule itself, and the fixtures above, still work.
    visit!(user, open_b)
    awarded = visit!(user, open_c)
    assert "county-complete-litchfield-county" in Enum.map(awarded, & &1.key)
  end

  test "un-visiting does not revoke badges", %{waterbury: waterbury} do
    user = user_fixture()
    p = place!(waterbury, "keep")
    awarded_keys = visit!(user, p) |> Enum.map(& &1.key) |> Enum.sort()
    # sole open place in its county: both badges land on the first visit
    assert awarded_keys == ["county-complete-new-haven-county", "first-steps"]

    {:ok, :cleared} = Social.react(user, p, "up")

    assert Badges.earned_badges(user) |> Enum.map(& &1.badge_key) |> Enum.sort() ==
             awarded_keys
  end

  test "definitions include dynamic county badges for counties with open places", %{
    waterbury: waterbury
  } do
    place!(waterbury, "x1")
    keys = Badges.definitions() |> Enum.map(& &1.key)
    assert "county-complete-new-haven-county" in keys
    assert "first-steps" in keys
  end

  describe "dynamic town explorer badges" do
    test "CT towns keep their historical names and thresholds", %{
      waterbury: waterbury,
      middlebury: middlebury
    } do
      # a town needs >=3 open places for its dynamic badge to exist at all
      for i <- 1..3, do: place!(waterbury, "w-#{i}")
      # Middlebury: give it 5+ open places, threshold must still be 3
      for i <- 1..5, do: place!(middlebury, "mid-#{i}")

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "Brass City Explorer", rule: {:town, town_id, 5}} =
               defs["explorer-waterbury"]

      assert town_id == waterbury.id

      assert %{name: "Middlebury Explorer", rule: {:town, town_id2, 3}} =
               defs["explorer-middlebury"]

      assert town_id2 == middlebury.id
    end

    test "new towns get default names and min(5, count) thresholds; <3 places emit none", %{
      soho: soho,
      harlem: harlem,
      two_bridges: two_bridges
    } do
      for i <- 1..3, do: place!(soho, "soho-#{i}")
      for i <- 1..7, do: place!(harlem, "harlem-#{i}")
      place!(two_bridges, "tiny-1")

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "SoHo Explorer", rule: {:town, soho_id, 3}} = defs["explorer-soho"]
      assert soho_id == soho.id

      assert %{name: "Harlem Explorer", rule: {:town, harlem_id, 5}} = defs["explorer-harlem"]
      assert harlem_id == harlem.id

      refute Map.has_key?(defs, "explorer-two-bridges")
    end

    test "closed places don't count toward the dynamic threshold basis", %{xtown: xtown} do
      for i <- 1..2, do: place!(xtown, "x-#{i}")
      place!(xtown, "x-closed", %{status: "closed"})

      refute Enum.any?(Badges.definitions(), &(&1.key == "explorer-xtown"))
    end
  end

  describe "reactions drive badges" do
    import Ethos.AccountsFixtures
    import Ethos.PlacesFixtures

    test "a thumbs-down earns badge progress" do
      user = user_fixture()
      place = place_fixture(%{status: "open"})

      Ethos.Social.react(user, place, "down")

      assert Enum.any?(Ethos.Badges.earned_badges(user), &(&1.badge_key == "first-steps"))
    end

    test "clearing a reaction does not revoke an earned badge" do
      user = user_fixture()
      place = place_fixture(%{status: "open"})

      Ethos.Social.react(user, place, "up")
      Ethos.Social.react(user, place, "up")

      assert Enum.any?(Ethos.Badges.earned_badges(user), &(&1.badge_key == "first-steps"))
    end

    test "a reaction on a guide awards nothing" do
      user = user_fixture()

      Ethos.Social.react(user, Ethos.GuidesFixtures.guide_fixture(), "up")

      assert Ethos.Badges.earned_badges(user) == []
    end
  end
end
