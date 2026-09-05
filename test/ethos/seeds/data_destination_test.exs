defmodule Ethos.Seeds.DataDestinationTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Destinations, SeedDataHelpers, Seeds.DataDestination}

  @fixture Path.expand("../../support/fixtures/seed_data/destination.json", __DIR__)

  test "loads a seed file and overlays it onto its node, idempotently" do
    SeedDataHelpers.seed_destination_paths!(["united-states/connecticut/litchfield-county"])
    before = length(Destinations.list_destinations())

    d = DataDestination.upsert!(@fixture)
    assert d.path == "united-states/connecticut/litchfield-county"
    assert d.name == "Litchfield County"
    assert String.contains?(d.intro, "northwest")

    # The overlay lands on the roster's row: same node, still filed under
    # Connecticut. A record that created its own row would have neither.
    assert d.kind == "county"

    assert Enum.map(Destinations.ancestors(d), & &1.path) == [
             "united-states",
             "united-states/connecticut"
           ]

    DataDestination.upsert!(@fixture)
    assert length(Destinations.list_destinations()) == before
  end

  # The mechanism of the defect Task 13 fixed, now unrepresentable rather than
  # merely caught by a corpus gate: a file keyed outside the tree inserted a
  # parentless, kindless row that shadowed a node's URL, disabled its redirect
  # and listed itself on /destinations as a country.
  test "raises with the file and the path when the path is not a node" do
    bad =
      Path.expand(
        "../../support/fixtures/seed_data/destination_fixtures/unknown_path.json",
        __DIR__
      )

    assert_raise ArgumentError, ~r/unknown_path\.json.*"atlantis\/lost-county"/s, fn ->
      DataDestination.upsert!(bad)
    end

    assert Destinations.list_destinations() == []
  end

  # The same guard from the other side: the pre-Task-13 keys are legacy paths,
  # and a file re-keyed back to one is refused rather than seeded.
  test "raises when the path is a legacy path rather than the node's own" do
    SeedDataHelpers.seed_destination_paths!(["united-states/connecticut/litchfield-county"])

    # Non-vacuity, read off the roster rather than the table: the helper that
    # seeds a handful of nodes does not write `legacy_paths`, so a database
    # lookup would report nothing here even though production has it.
    assert "connecticut/litchfield-county" in (Ethos.Seeds.DestinationTree.load!()
                                               |> Enum.find(
                                                 &(&1["path"] ==
                                                     "united-states/connecticut/litchfield-county")
                                               )
                                               |> Map.fetch!("legacy_paths"))

    tmp = Path.join(System.tmp_dir!(), "legacy_keyed_destination.json")

    File.write!(
      tmp,
      @fixture
      |> File.read!()
      |> String.replace(
        ~s("path": "united-states/connecticut/litchfield-county"),
        ~s("path": "connecticut/litchfield-county")
      )
    )

    assert_raise ArgumentError, ~r/"connecticut\/litchfield-county"/, fn ->
      DataDestination.upsert!(tmp)
    end

    File.rm!(tmp)
  end

  test "raises with the file path when a required key is missing" do
    bad = Path.expand("../../support/fixtures/seed_data/destination_missing_intro.json", __DIR__)

    assert_raise ArgumentError, ~r/destination_missing_intro\.json/, fn ->
      DataDestination.load!(bad)
    end
  end
end
