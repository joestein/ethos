defmodule Ethos.Seeds.DestinationIntroPrecedenceTest do
  @moduledoc """
  Which loader's `intro` a node ends up with, and that seed *order* cannot
  change the answer.

  The roster and the thirteen curated hub files both write `intro`, so before
  this was settled the last seeder to run won and the pair flip-flopped:
  `Release.seed_destinations/0` put ~1KB of curated prose on Connecticut's node,
  and the next `seed_region/1` — which calls `upsert_all!/0` — put "Connecticut,
  county by county." back over it. No error, no failing test, and the only
  visible symptom was a hub page that had gone thin again.

  Order is the whole defect, so these seed in order, and seed the tree twice. A
  test that seeded each loader once would pass against the broken version.

  `async: false`, unlike `destination_tree_test.exs`, and deliberately: the
  reverse-order test writes Connecticut's row *before* the roster writes United
  States', which is the one lock order no other test in the suite takes. Run
  async it deadlocks against any test seeding the same ancestors shallowest
  first — which is every one of them.
  """
  use Ethos.DataCase, async: false

  alias Ethos.Destinations
  alias Ethos.Seeds.{DataDestination, DestinationTree}

  @curated_path "united-states/connecticut"

  defp curated_file do
    Path.join([
      :code.priv_dir(:ethos) |> to_string(),
      "seed_data",
      "destinations",
      "connecticut.json"
    ])
  end

  test "the tree, then the destinations, then the tree again" do
    curated = DataDestination.load!(curated_file())
    roster_stub = Enum.find(DestinationTree.load!(), &(&1["path"] == @curated_path))["intro"]

    # Non-vacuity: if the roster ever carried the curated prose itself there
    # would be nothing for a re-seed to clobber, and this would pass against
    # any implementation at all.
    refute roster_stub == curated["intro"]
    assert String.length(curated["intro"]) > 500

    DestinationTree.upsert_all!()
    DataDestination.upsert!(curated_file())
    DestinationTree.upsert_all!()

    node = Destinations.get_by_path(@curated_path)

    assert node.intro == curated["intro"],
           "re-seeding the tree replaced the curated intro with #{inspect(node.intro)}"

    # Photos were never at risk — they are not in the tree upsert's attrs — but
    # a future author adding them there would silently blank every curated hub's
    # images, and this is where that would fail.
    assert node.photos == curated["photos"]

    # And the node is still a node: the overlay adds prose to the row the roster
    # owns rather than creating one beside it.
    assert node.kind == "region"
    assert Enum.map(Destinations.ancestors(node), & &1.path) == ["united-states"]
  end

  test "the destinations first, then the tree, on a database that has never seen the roster" do
    # The reverse order, which is what a fresh production database gets if
    # `seed_destinations/0` is run before any other seeder. The curated intro
    # must win here too — precedence is resolved at the point the roster's intro
    # is read, not by whoever ran last.
    curated = DataDestination.load!(curated_file())

    DataDestination.upsert!(curated_file())
    DestinationTree.upsert_all!()

    assert Destinations.get_by_path(@curated_path).intro == curated["intro"]
  end

  test "a node with no curated file keeps the roster's own intro" do
    DestinationTree.upsert_all!()

    node = Destinations.get_by_path("united-states/connecticut/windham-county/pomfret")
    roster = Enum.find(DestinationTree.load!(), &(&1["path"] == node.path))

    assert node.intro == roster["intro"]
  end

  test "every curated file's prose reaches its node, whichever loader seeded it" do
    # All thirteen, not just Connecticut: a precedence rule that resolved one
    # path by accident — a stale row, a lucky ordering — would pass the tests
    # above.
    DestinationTree.upsert_all!()

    for file <- Path.wildcard(Path.join(Path.dirname(curated_file()), "*.json")) do
      curated = DataDestination.load!(file)
      node = Destinations.get_by_path(curated["path"])

      assert node, "#{Path.basename(file)} is keyed on #{curated["path"]}, which no node owns"

      assert node.intro == curated["intro"],
             "#{Path.basename(file)}'s prose did not reach #{curated["path"]} from the tree seed"
    end
  end
end
