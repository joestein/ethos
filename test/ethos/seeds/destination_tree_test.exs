defmodule Ethos.Seeds.DestinationTreeTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations
  alias Ethos.Seeds.DestinationTree

  test "every roster node declares a known kind and a resolvable parent" do
    nodes = DestinationTree.load!()
    paths = MapSet.new(nodes, & &1["path"])

    for node <- nodes do
      assert node["kind"] in Ethos.Destinations.Destination.kinds(),
             "#{node["path"]} has kind #{inspect(node["kind"])}"

      parent = node["path"] |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      if parent != "" do
        assert MapSet.member?(paths, parent),
               "#{node["path"]} has no parent node #{parent}"
      end
    end
  end

  test "roster paths are unique" do
    paths = Enum.map(DestinationTree.load!(), & &1["path"])
    assert length(paths) == length(Enum.uniq(paths))
  end

  test "legacy paths are unique across the whole roster" do
    legacy = Enum.flat_map(DestinationTree.load!(), &(&1["legacy_paths"] || []))
    assert length(legacy) == length(Enum.uniq(legacy))
  end

  # The structural guard behind the 301s, and it names its offenders because
  # the roster now carries hundreds of legacy paths and "485 != 484" locates
  # nothing.
  #
  # Repeated: `Destinations.get_by_legacy_path/1` is a `Repo.one`, which
  # *raises* on a second match rather than picking one. A duplicate would not
  # be a wrong redirect, it would be a 500 on one unlucky indexed URL and a
  # green suite everywhere else.
  #
  # Shadowing: a legacy path equal to some node's own path is a URL two nodes
  # claim. `DestinationController.show/2` resolves the exact node first, so the
  # real node wins and the legacy entry is dead weight that reads like a live
  # redirect — `vatican-city` is the case this caught, a country node and a
  # guide's town slug at once. The rule is that the roster cannot express one.
  test "no legacy path repeats, and none shadows a real node path" do
    nodes = DestinationTree.load!()

    owners =
      for node <- nodes, legacy <- node["legacy_paths"] || [], reduce: %{} do
        acc -> Map.update(acc, legacy, [node["path"]], &[node["path"] | &1])
      end

    repeated = for {legacy, [_, _ | _] = claimants} <- owners, do: {legacy, Enum.sort(claimants)}

    assert repeated == [],
           "legacy paths claimed by more than one node: #{inspect(repeated)}"

    paths = MapSet.new(nodes, & &1["path"])
    shadowing = for {legacy, _} <- owners, MapSet.member?(paths, legacy), do: legacy

    assert shadowing == [],
           "legacy paths that are also real node paths, so the redirect is dead: " <>
             inspect(Enum.sort(shadowing))
  end

  test "upsert_all!/0 wires parent_id to match every path, idempotently" do
    count = DestinationTree.upsert_all!()
    assert count == length(DestinationTree.load!())

    manhattan = Destinations.get_by_path("united-states/new-york/new-york-city/manhattan")
    assert manhattan.kind == "borough"

    assert Enum.map(Destinations.ancestors(manhattan), & &1.path) == [
             "united-states",
             "united-states/new-york",
             "united-states/new-york/new-york-city"
           ]

    assert DestinationTree.upsert_all!() == count

    assert Destinations.get_by_path("united-states/new-york/new-york-city/manhattan").id ==
             manhattan.id
  end

  test "every seeded node's parent_id agrees with its path" do
    DestinationTree.upsert_all!()

    for d <- Destinations.list_destinations() do
      expected = d.path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      case d.parent_id do
        nil -> assert expected == "", "#{d.path} is a root but its path has a parent"
        id -> assert Ethos.Repo.get!(Destinations.Destination, id).path == expected
      end
    end
  end
end
