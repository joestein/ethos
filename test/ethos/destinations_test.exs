defmodule Ethos.DestinationsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations

  @valid %{
    path: "connecticut/litchfield-county",
    name: "Litchfield County",
    intro: "A county in the northwest corner of the state.",
    photos: []
  }

  test "upsert_destination!/1 creates then updates by path" do
    d = Destinations.upsert_destination!(@valid)
    assert d.path == "connecticut/litchfield-county"
    assert d.name == "Litchfield County"

    updated = Destinations.upsert_destination!(%{@valid | intro: "Revised."})
    assert updated.id == d.id
    assert updated.intro == "Revised."
    assert length(Destinations.list_destinations()) == 1
  end

  test "get_by_path/1 finds a destination and returns nil for an unknown path" do
    Destinations.upsert_destination!(@valid)

    assert %{name: "Litchfield County"} =
             Destinations.get_by_path("connecticut/litchfield-county")

    assert Destinations.get_by_path("connecticut/nope-county") == nil
  end

  test "path, name and intro are required" do
    for missing <- [:path, :name, :intro] do
      attrs = Map.delete(@valid, missing)

      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(attrs)
      end
    end
  end

  test "a non-string path fails as a changeset error, not an opaque raise" do
    # The lookup guard is is_binary/1 rather than truthiness, so a JSON
    # `"path": false` cannot short-circuit into the existing-record branch and
    # reach Destination.changeset/2 as the struct argument.
    for bad <- [false, 42, %{}] do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(%{@valid | path: bad})
      end
    end
  end

  test "path must be lowercase slug segments separated by single slashes" do
    for bad <- ["Connecticut", "new york", "new-york/", "/connecticut", "a//b"] do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(%{@valid | path: bad})
      end
    end

    for good <- ["connecticut", "new-york/brooklyn", "rome"] do
      assert %{path: ^good} = Destinations.upsert_destination!(%{@valid | path: good})
    end
  end

  test "accepts a path deeper than two segments and derives its slug" do
    d =
      Destinations.upsert_destination!(%{
        path: "united-states/new-york/new-york-city/manhattan/alphabet-city",
        name: "Alphabet City",
        intro: "Loisaida's community gardens.",
        kind: "neighborhood"
      })

    assert d.slug == "alphabet-city"
    assert d.kind == "neighborhood"
    assert d.position == 0
    assert d.legacy_paths == []
  end

  test "rejects a kind outside the vocabulary" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Destinations.upsert_destination!(%{
        path: "atlantis",
        name: "Atlantis",
        intro: "Not a real tier.",
        kind: "planet"
      })
    end
  end

  test "kinds/0 is the seven-tier vocabulary" do
    assert Ethos.Destinations.Destination.kinds() ==
             ~w(country region county city borough town neighborhood)
  end

  describe "ancestry" do
    setup do
      nodes =
        for {path, kind, name} <- [
              {"united-states", "country", "United States"},
              {"united-states/new-york", "region", "New York"},
              {"united-states/new-york/new-york-city", "city", "New York City"},
              {"united-states/new-york/new-york-city/manhattan", "borough", "Manhattan"},
              {"italy", "country", "Italy"}
            ],
            into: %{} do
          parent_path = path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

          parent =
            if parent_path == "", do: nil, else: Destinations.get_by_path(parent_path)

          d =
            Destinations.upsert_destination!(%{
              path: path,
              name: name,
              kind: kind,
              intro: "#{name}.",
              parent_id: parent && parent.id
            })

          {path, d}
        end

      %{nodes: nodes}
    end

    test "roots/0 returns only parentless nodes" do
      assert Enum.map(Destinations.roots(), & &1.path) == ["italy", "united-states"]
    end

    test "children/1 returns direct children only", %{nodes: nodes} do
      assert Enum.map(Destinations.children(nodes["united-states"]), & &1.path) ==
               ["united-states/new-york"]
    end

    test "ancestors/1 returns root first and excludes self", %{nodes: nodes} do
      manhattan = nodes["united-states/new-york/new-york-city/manhattan"]

      assert Enum.map(Destinations.ancestors(manhattan), & &1.path) == [
               "united-states",
               "united-states/new-york",
               "united-states/new-york/new-york-city"
             ]
    end

    test "ancestors/1 of a root is empty", %{nodes: nodes} do
      assert Destinations.ancestors(nodes["italy"]) == []
    end

    test "descendant_paths/1 excludes the node itself", %{nodes: nodes} do
      assert Destinations.descendant_paths(nodes["united-states/new-york"]) == [
               "united-states/new-york/new-york-city",
               "united-states/new-york/new-york-city/manhattan"
             ]
    end

    test "get_by_legacy_path/1 finds a moved node and nil otherwise", %{nodes: nodes} do
      Destinations.upsert_destination!(%{
        path: nodes["united-states/new-york/new-york-city/manhattan"].path,
        name: "Manhattan",
        intro: "Manhattan.",
        kind: "borough",
        legacy_paths: ["new-york/manhattan"]
      })

      assert %{path: "united-states/new-york/new-york-city/manhattan"} =
               Destinations.get_by_legacy_path("new-york/manhattan")

      assert Destinations.get_by_legacy_path("new-york/nowhere") == nil
    end
  end

  describe "legacy_geo/1" do
    test "reproduces the triple a corpus used to carry" do
      Ethos.Seeds.DestinationTree.upsert_all!()

      monti =
        Destinations.upsert_destination!(%{
          path: "italy/lazio/rome/monti",
          name: "Monti",
          kind: "neighborhood",
          intro: "Monti."
        })

      # "Lazio", not "Italy", which is what the Rome corpus carried before the
      # tree landed. Italy is the country and Lazio the region; a single
      # `state` column could hold only one of them, and holding the country was
      # the defect this refactor exists to fix. Anything still asserting
      # state == "Italy" for a Roman place is asserting that defect.
      assert Destinations.legacy_geo(monti) == %{
               "town" => "Monti",
               "county" => "Rome",
               "state" => "Lazio"
             }
    end

    test "falls back to the country when a node has no region ancestor" do
      # Vatican City is a root country node with no region above or below it,
      # so every tier of the triple resolves to the node itself. Without the
      # country fallback the state would be nil and Place.changeset/2 would
      # reject every Vatican place at seed time.
      vatican =
        Destinations.upsert_destination!(%{
          path: "vatican-city",
          name: "Vatican City",
          kind: "country",
          intro: "Vatican City."
        })

      assert Destinations.legacy_geo(vatican) == %{
               "town" => "Vatican City",
               "county" => "Vatican City",
               "state" => "Vatican City"
             }
    end

    test "a region node gets no county, unlike the country fallback above" do
      # The Antique Trail guide hangs from the Connecticut region node on
      # purpose: it takes in dealers across towns, so it lists on the state page
      # and under no county. The county fallback that gives Vatican City a
      # county must not fire here, or that guide would be filed under a
      # /destinations/connecticut/connecticut hub repeating the state's name.
      Ethos.Seeds.DestinationTree.upsert_all!()
      connecticut = Destinations.get_by_path("united-states/connecticut")

      assert connecticut.kind == "region"

      assert Destinations.legacy_geo(connecticut) == %{
               "town" => "Connecticut",
               "county" => nil,
               "state" => "Connecticut"
             }
    end
  end
end
