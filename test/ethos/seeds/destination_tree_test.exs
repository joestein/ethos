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
