defmodule Ethos.Seeds.DestinationPathGateTest do
  use ExUnit.Case, async: true

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london)

  setup_all do
    roster = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])
    %{roster: roster}
  end

  test "every seed file's guide and places resolve to a roster node", %{roster: roster} do
    for corpus <- @corpora,
        file <- Path.wildcard(Path.join(["priv", "seed_data", corpus, "*.json"])) do
      data = file |> File.read!() |> Jason.decode!()

      guide_path = data["guide"]["destination_path"]
      assert is_binary(guide_path), "#{file}: guide has no destination_path"
      assert MapSet.member?(roster, guide_path), "#{file}: unknown node #{guide_path}"

      for p <- data["places"] do
        assert is_binary(p["destination_path"]), "#{file}: place #{p["slug"]} has no path"

        assert MapSet.member?(roster, p["destination_path"]),
               "#{file}: place #{p["slug"]} references unknown node #{p["destination_path"]}"
      end
    end
  end

  test "no seed file still carries the legacy triple" do
    for corpus <- @corpora,
        file <- Path.wildcard(Path.join(["priv", "seed_data", corpus, "*.json"])) do
      data = file |> File.read!() |> Jason.decode!()

      refute Map.has_key?(data["guide"], "state"), "#{file}: guide still has state"
      refute Map.has_key?(data["guide"], "county"), "#{file}: guide still has county"

      for p <- data["places"] do
        for key <- ~w(state county town) do
          refute Map.has_key?(p, key), "#{file}: place #{p["slug"]} still has #{key}"
        end
      end
    end
  end
end
