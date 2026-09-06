defmodule Ethos.AdjacencyTest do
  use ExUnit.Case, async: true

  alias Ethos.Adjacency

  describe "pairs_from_rows/1" do
    test "builds a symmetric map from town-line rows" do
      rows = [
        %{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Canton"},
        %{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Simsbury"}
      ]

      assert %{"avon" => avon, "canton" => ["avon"], "simsbury" => ["avon"]} =
               Adjacency.pairs_from_rows(rows)

      assert Enum.sort(avon) == ["canton", "simsbury"]
    end

    test "ignores rows where either side is blank" do
      # A state-boundary segment has one side blank: the neighbour is
      # Massachusetts or New York, not another Connecticut town.
      rows = [
        %{"TOWN_LEFT" => " ", "TOWN_RIGHT" => "Salisbury"},
        %{"TOWN_LEFT" => "Salisbury", "TOWN_RIGHT" => ""}
      ]

      assert Adjacency.pairs_from_rows(rows) == %{}
    end

    test "ignores a town bordering itself" do
      rows = [%{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Avon"}]
      assert Adjacency.pairs_from_rows(rows) == %{}
    end

    test "deduplicates repeated segments between the same two towns" do
      # A border is many short line segments in the source, not one row.
      rows = List.duplicate(%{"TOWN_LEFT" => "Avon", "TOWN_RIGHT" => "Canton"}, 12)
      assert Adjacency.pairs_from_rows(rows) == %{"avon" => ["canton"], "canton" => ["avon"]}
    end

    test "slugifies town names" do
      rows = [%{"TOWN_LEFT" => "New Hartford", "TOWN_RIGHT" => "Barkhamsted"}]

      assert Adjacency.pairs_from_rows(rows) == %{
               "new-hartford" => ["barkhamsted"],
               "barkhamsted" => ["new-hartford"]
             }
    end
  end

  describe "all/0 and neighbours/1" do
    test "loads the committed dataset with every Connecticut town" do
      assert map_size(Adjacency.all()) == 169
    end

    test "Avon borders exactly its six real neighbours" do
      # Six, not five. Verified against the fetched dataset — West Hartford
      # borders Avon and is easy to forget because the two feel far apart.
      assert Enum.sort(Adjacency.neighbours("avon")) ==
               [
                 "bloomfield",
                 "burlington",
                 "canton",
                 "farmington",
                 "simsbury",
                 "west-hartford"
               ]
    end

    test "returns an empty list for an unknown town" do
      assert Adjacency.neighbours("nowhere") == []
    end

    test "is symmetric across the whole dataset" do
      all = Adjacency.all()

      for {town, neighbours} <- all, neighbour <- neighbours do
        assert town in Map.fetch!(all, neighbour),
               "#{town} lists #{neighbour} but not the reverse"
      end
    end

    test "no town borders itself" do
      for {town, neighbours} <- Adjacency.all() do
        refute town in neighbours
      end
    end

    test "every neighbour is a known town" do
      all = Adjacency.all()
      known = MapSet.new(Map.keys(all))

      for {_town, neighbours} <- all, n <- neighbours do
        assert MapSet.member?(known, n)
      end
    end
  end

  describe "ordered_pairs/0" do
    test "returns each border exactly once, alphabetically ordered" do
      pairs = Adjacency.ordered_pairs()

      assert length(pairs) == 446
      assert Enum.all?(pairs, fn {a, b} -> a < b end)
      assert length(Enum.uniq(pairs)) == length(pairs)
    end

    test "the pair count is half the directed edge count" do
      directed = Adjacency.all() |> Map.values() |> Enum.map(&length/1) |> Enum.sum()
      assert length(Adjacency.ordered_pairs()) == div(directed, 2)
    end
  end
end
