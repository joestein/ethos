defmodule EthosWeb.DestinationRootsTest do
  @moduledoc """
  `/destinations` under the combination production actually seeds: the roster
  **and** the fifteen curated overlays.

  This is the one combination in which consequence (3) of the Task 13 defect
  appeared, and until this test nothing automated exercised it. The curated
  files were keyed on bare, pre-tree paths, so `Release.seed_destinations/0`
  inserted thirteen rows of their own with `parent_id: nil` — and
  `Destinations.roots/0` is "every row with no parent". Connecticut, New York
  and Rome therefore rendered on the index beside the United States and Italy,
  as countries. Every other gate in the suite seeds one half or the other and
  cannot see it.

  `async: false`: seeds the full roster, so running it concurrently
  makes it a writer of rows every other full-roster seeder writes, which
  deadlocks. Do not flip this back for speed.
  """
  use EthosWeb.ConnCase, async: false

  alias Ethos.Destinations

  setup do
    Ethos.Seeds.DestinationTree.upsert_all!()

    files =
      [:code.priv_dir(:ethos) |> to_string(), "seed_data", "destinations", "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    # Non-vacuity: if the curated corpus were ever emptied this whole module
    # would degrade into a roster-only test, which is the half that never had
    # the bug.
    assert length(files) == 15

    Enum.each(files, &Ethos.Seeds.DataDestination.upsert!/1)

    %{files: files}
  end

  test "roots/0 is exactly the roster's country nodes" do
    expected =
      for n <- Ethos.Seeds.DestinationTree.load!(),
          n["kind"] == "country",
          into: MapSet.new(),
          do: n["path"]

    roots = Destinations.roots()

    assert MapSet.new(roots, & &1.path) == expected,
           "roots/0 is not the set of country nodes — extra: " <>
             inspect(Enum.sort(MapSet.difference(MapSet.new(roots, & &1.path), expected))) <>
             ", missing: " <>
             inspect(Enum.sort(MapSet.difference(expected, MapSet.new(roots, & &1.path))))

    assert Enum.all?(roots, &(&1.kind == "country")),
           "a root with no kind is a row a curated file created instead of overlaying: " <>
             inspect(for r <- roots, r.kind != "country", do: {r.path, r.kind})

    assert MapSet.size(expected) == 5
  end

  test "every curated file overlays a node instead of adding a row", %{files: files} do
    assert length(Destinations.list_destinations()) == length(Ethos.Seeds.DestinationTree.load!())

    for file <- files do
      node = Destinations.get_by_path(Ethos.Seeds.DataDestination.load!(file)["path"])

      assert node.kind != nil, "#{Path.basename(file)} left its node with no kind"
      assert node.parent_id != nil, "#{Path.basename(file)} left its node a root"
    end
  end

  test "the index lists the five countries and none of the curated hubs", %{conn: conn} do
    html = conn |> get(~p"/destinations") |> html_response(200)

    for country <- ~w(united-states italy united-kingdom canada vatican-city) do
      assert html =~ ~s(href="/destinations/#{country}")
    end

    # The visible symptom: three curated hubs rendered on the index as
    # countries, each linking at the bare path its 301 was supposed to own.
    for bare <- ~w(connecticut new-york rome) do
      refute html =~ ~s(href="/destinations/#{bare}"),
             "/destinations links #{bare} as a country"
    end
  end
end
