defmodule Ethos.PlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations
  alias Ethos.Places

  @valid %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    summary: "A 1922 Thomas Lamb theater on East Main Street.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open"
  }

  defp node!(path, name, kind \\ "town", parent \\ nil) do
    Destinations.upsert_destination!(%{
      path: path,
      name: name,
      kind: kind,
      intro: "#{name}.",
      parent_id: parent && parent.id
    })
  end

  # Attaches a place to `node` by `destination_id`, which is the whole of a
  # place's geography.
  defp place_in(node, slug, name, overrides \\ %{}) do
    Places.upsert_place!(
      Map.merge(
        %{
          slug: slug,
          name: name,
          kind: "museum",
          summary: "x",
          destination_id: node.id
        },
        overrides
      )
    )
  end

  defp seed_town(node, count) do
    for n <- 1..count do
      place_in(
        node,
        "waterbury-place-#{n}",
        "Waterbury Place #{String.pad_leading(to_string(n), 2, "0")}"
      )
    end
  end

  test "upsert_place! resolves a destination_path and is idempotent" do
    node = node!("connecticut/waterbury", "Waterbury")

    place = Places.upsert_place!(Map.put(@valid, :destination_path, "connecticut/waterbury"))

    # `destination_path` is what a seed file writes; `destination_id` is what
    # the column holds, and the resolution raises rather than writing a nil.
    assert place.destination_id == node.id
    assert place.status == "open"

    again = Places.upsert_place!(%{@valid | summary: "Updated."})
    assert again.id == place.id
    assert again.summary == "Updated."
    assert Repo.aggregate(Places.Place, :count) == 1
  end

  test "rejects bad kind, bad status, unsafe urls" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | kind: "castle"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | official_url: "javascript:alert(1)"})
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(%{@valid | status: "gone"})
    end
  end

  test "photos require attribution fields and /photos/ paths" do
    good = %{
      "src" => "/photos/ct/waterbury/palace-theater.jpg",
      "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
      "title" => "Palace Theater",
      "description" => "The marquee.",
      "author" => "Jane Doe",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
    }

    assert %{photos: [_]} = Places.upsert_place!(Map.put(@valid, :photos, [good]))

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(Map.put(@valid, :photos, [Map.delete(good, "license")]))
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Places.upsert_place!(
        Map.put(@valid, :photos, [%{good | "src" => "https://evil.example/x.jpg"}])
      )
    end
  end

  test "list_places filters and count_open_places_in_node" do
    waterbury = node!("connecticut/waterbury", "Waterbury")
    litchfield = node!("connecticut/litchfield-county", "Litchfield County", "county")

    Places.upsert_place!(Map.put(@valid, :destination_id, waterbury.id))

    Places.upsert_place!(
      %{
        @valid
        | slug: "mattatuck-museum",
          name: "Mattatuck Museum",
          kind: "museum"
      }
      |> Map.put(:destination_id, waterbury.id)
    )

    Places.upsert_place!(
      %{
        @valid
        | slug: "glebe-house",
          name: "Glebe House",
          kind: "museum",
          status: "closed"
      }
      |> Map.put(:destination_id, litchfield.id)
    )

    assert length(Places.list_places(destination_id: waterbury.id)) == 2
    assert [%{name: "Mattatuck Museum"}] = Places.list_places(kind: "museum", status: "open")
    assert length(Places.list_places(kinds: ["museum", "theater"])) == 3
    assert Places.count_open_places_in_node(waterbury.id) == 2
    assert Places.count_open_places_in_node(litchfield.id) == 0
  end

  test "count_open_places_in_nodes sums across a set of nodes" do
    waterbury = node!("connecticut/waterbury", "Waterbury")
    woodbury = node!("connecticut/woodbury", "Woodbury")
    elsewhere = node!("connecticut/danbury", "Danbury")

    place_in(waterbury, "wtby-a", "A")
    place_in(woodbury, "wdby-a", "B")
    place_in(woodbury, "wdby-b", "C", %{status: "closed"})
    place_in(elsewhere, "danbury-a", "D")

    assert Places.count_open_places_in_nodes([waterbury.id, woodbury.id]) == 2
  end

  describe "list_siblings/2" do
    test "siblings are places sharing a destination node" do
      node =
        Destinations.upsert_destination!(%{
          path: "italy/lazio/rome/monti",
          name: "Monti",
          kind: "neighborhood",
          intro: "Monti."
        })

      other =
        Destinations.upsert_destination!(%{
          path: "italy/lazio/rome/trastevere",
          name: "Trastevere",
          kind: "neighborhood",
          intro: "Trastevere."
        })

      a = place_in(node, "sibling-a", "A")
      b = place_in(node, "sibling-b", "B")
      _elsewhere = place_in(other, "sibling-c", "C")

      assert Enum.map(Places.list_siblings(a), & &1.slug) == [b.slug]
    end

    test "returns other open places in the same town, by name, excluding itself" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      woodbury = node!("connecticut/woodbury", "Woodbury")

      palace =
        place_in(waterbury, "palace-theater-waterbury", "Palace Theater", %{kind: "theater"})

      mattatuck = place_in(waterbury, "mattatuck-museum", "Mattatuck Museum")
      _other_town = place_in(woodbury, "glebe-house", "Glebe House")
      _closed = place_in(waterbury, "abbots-frozen-custard", "Abbots", %{status: "closed"})

      assert [%{slug: "mattatuck-museum"}] = Places.list_siblings(palace)
      assert [%{slug: "palace-theater-waterbury"}] = Places.list_siblings(mattatuck)
    end

    # A destination node is one point in the tree, not a pair of strings that
    # can collide across regions — two nodes named "Washington" are two
    # distinct rows with two distinct ids, whatever their names print as. The
    # old slug-pair design let Washington, Connecticut and Washington, D.C.
    # collide on `town_slug: "washington"`, putting Nationals Park in a
    # Litchfield County town's "More in Washington" and four Connecticut
    # museums in Nationals Park's. Twelve pages of wrong geography, no error.
    test "two nodes of the same name are not siblings" do
      ct_washington = node!("connecticut/washington", "Washington")
      dc_washington = node!("district-of-columbia/washington", "Washington")

      ct =
        place_in(ct_washington, "gunn-historical-museum", "Gunn Historical Museum", %{
          kind: "museum"
        })

      dc =
        place_in(dc_washington, "nationals-park", "Nationals Park", %{kind: "stadium"})

      assert ct_washington.name == dc_washington.name
      refute ct.destination_id == dc.destination_id
      assert Places.list_siblings(ct) == []
      assert Places.list_siblings(dc) == []

      same_town =
        place_in(ct_washington, "gw-tavern", "G.W. Tavern", %{kind: "restaurant"})

      assert [%{slug: "gw-tavern"}] = Places.list_siblings(ct)
      assert [%{slug: "gunn-historical-museum"}] = Places.list_siblings(same_town)
      assert Places.list_siblings(dc) == []
    end

    test "returns [] for a place with no destination node" do
      only = Places.upsert_place!(@valid)
      assert only.destination_id == nil
      assert Places.list_siblings(only) == []
    end

    test "caps the number of siblings returned" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      seed_town(waterbury, 12)

      anchor = Places.get_place_by_slug!("waterbury-place-1")

      siblings = Places.list_siblings(anchor)
      assert length(siblings) == 8
      refute Enum.any?(siblings, &(&1.id == anchor.id))

      assert Places.list_siblings(anchor, limit: 3) |> length() == 3
    end

    # A window that always starts at the alphabetical top of the town renders
    # the same eight names on every place page in it, so in a town of more than
    # nine places the rest have no inbound in-site link at all. Belmont, the
    # Bronx has 40 places; 22 of them were unreachable by navigation. The window
    # rotates instead: each place shows the eight that follow it, wrapping.
    test "the union of every place's siblings covers the whole town" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      places = seed_town(waterbury, 20)
      all_slugs = places |> Enum.map(& &1.slug) |> MapSet.new()

      covered =
        places
        |> Enum.flat_map(&Places.list_siblings/1)
        |> Enum.map(& &1.slug)
        |> MapSet.new()

      assert MapSet.equal?(covered, all_slugs)
      assert Enum.all?(places, &(length(Places.list_siblings(&1)) == 8))
    end

    test "every place in the town has at least one inbound sibling link" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      places = seed_town(waterbury, 20)

      inbound =
        Map.new(places, fn place ->
          linkers =
            places
            |> Enum.reject(&(&1.id == place.id))
            |> Enum.filter(fn other ->
              Enum.any?(Places.list_siblings(other), &(&1.id == place.id))
            end)

          {place.slug, length(linkers)}
        end)

      orphans = for {slug, 0} <- inbound, do: slug
      assert orphans == []
      assert Enum.all?(inbound, fn {_slug, n} -> n == 8 end)
    end

    test "the window rotates: siblings are the eight successors by name, wrapping" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      seed_town(waterbury, 20)

      anchor = Places.get_place_by_slug!("waterbury-place-15")

      assert Enum.map(Places.list_siblings(anchor), & &1.name) == [
               "Waterbury Place 16",
               "Waterbury Place 17",
               "Waterbury Place 18",
               "Waterbury Place 19",
               "Waterbury Place 20",
               "Waterbury Place 01",
               "Waterbury Place 02",
               "Waterbury Place 03"
             ]

      last = Places.get_place_by_slug!("waterbury-place-20")

      assert Enum.map(Places.list_siblings(last), & &1.name) == [
               "Waterbury Place 01",
               "Waterbury Place 02",
               "Waterbury Place 03",
               "Waterbury Place 04",
               "Waterbury Place 05",
               "Waterbury Place 06",
               "Waterbury Place 07",
               "Waterbury Place 08"
             ]
    end

    test "a town smaller than the cap still shows every other place" do
      waterbury = node!("connecticut/waterbury", "Waterbury")
      places = seed_town(waterbury, 5)

      for place <- places do
        siblings = Places.list_siblings(place)
        assert length(siblings) == 4

        assert MapSet.new(siblings, & &1.slug) ==
                 places
                 |> Enum.reject(&(&1.id == place.id))
                 |> MapSet.new(& &1.slug)
      end
    end

    # The tiebreak is `id`, so the twins' order is theirs alone — and asserting
    # it by id is what makes this test discriminate. Three identical queries
    # returning the same rows proves nothing: Postgres does that anyway for an
    # unchanged table, so that assertion passes with the tiebreak deleted.
    test "two places sharing a name in one town order by id, deterministically" do
      waterbury = node!("connecticut/waterbury", "Waterbury")

      twin_a =
        place_in(waterbury, "sacred-heart-church-waterbury", "Sacred Heart", %{
          kind: "historic-site"
        })

      twin_b = place_in(waterbury, "sacred-heart-school-waterbury", "Sacred Heart")

      seed_town(waterbury, 6)

      anchor = Places.get_place_by_slug!("waterbury-place-1")
      [lower, higher] = Enum.sort_by([twin_a, twin_b], & &1.id)

      siblings = Places.list_siblings(anchor) |> Enum.map(& &1.id)
      assert siblings == Places.list_siblings(anchor) |> Enum.map(& &1.id)

      assert Enum.filter(siblings, &(&1 in [twin_a.id, twin_b.id])) == [lower.id, higher.id]

      # The window is row-wise over `(name, id)`, not over `name` alone, so an
      # equal-name block is entered rather than jumped: the lower twin's window
      # opens on the higher one, and neither twin ever sees itself.
      a_siblings = Places.list_siblings(lower) |> Enum.map(& &1.id)
      assert List.first(a_siblings) == higher.id
      refute lower.id in a_siblings
    end

    # A predicate over `name` alone against a sort key of `(name, id)` starts
    # the rotation past the anchor's *whole* equal-name block, so a block larger
    # than the window is jumped over by its own members and only partly reached
    # from outside — 9 identical names orphan 1, twelve orphan 4. Unreachable
    # with real data, but it is one character of asymmetry between the predicate
    # and the sort key, and the row-wise form makes coverage unconditional
    # rather than contingent on the corpus not containing something.
    for block <- [2, 5, 9, 12, 20] do
      test "a town containing an equal-name block of #{block} is fully covered" do
        waterbury = node!("connecticut/waterbury", "Waterbury")

        block =
          for n <- 1..unquote(block) do
            place_in(waterbury, "sacred-heart-#{n}-waterbury", "Sacred Heart")
          end

        # Three places outside the block, so the block's members compete for
        # window slots. Without them a block of exactly nine hides the defect:
        # each anchor excludes itself, leaving exactly eight, and the cap never
        # bites. With them, the name-only predicate orphans one.
        places = block ++ seed_town(waterbury, 3)

        covered =
          places
          |> Enum.flat_map(&Places.list_siblings/1)
          |> MapSet.new(& &1.id)

        assert MapSet.equal?(covered, MapSet.new(places, & &1.id))
      end
    end
  end

  test "a place can be attached to a destination node" do
    node =
      Ethos.Destinations.upsert_destination!(%{
        path: "italy/lazio/rome/monti",
        name: "Monti",
        kind: "neighborhood",
        intro: "Monti."
      })

    place =
      Places.upsert_place!(%{
        "slug" => "test-monti-place",
        "name" => "A place in Monti",
        "kind" => "restaurant",
        "town" => "Monti",
        "state" => "Italy",
        "county" => "Rome",
        "summary" => "A place.",
        "destination_id" => node.id
      })

    assert place.destination_id == node.id
  end
end
