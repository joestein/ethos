defmodule Ethos.Seeds.DataDestinationTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Destinations, Seeds.DataDestination}

  @fixture Path.expand("../../support/fixtures/seed_data/destination.json", __DIR__)

  test "loads a seed file and upserts it idempotently" do
    d = DataDestination.upsert!(@fixture)
    assert d.path == "united-states/connecticut/litchfield-county"
    assert d.name == "Litchfield County"
    assert String.contains?(d.intro, "northwest")

    DataDestination.upsert!(@fixture)
    assert length(Destinations.list_destinations()) == 1
  end

  test "raises with the file path when a required key is missing" do
    bad = Path.expand("../../support/fixtures/seed_data/destination_missing_intro.json", __DIR__)

    assert_raise ArgumentError, ~r/destination_missing_intro\.json/, fn ->
      DataDestination.load!(bad)
    end
  end
end
