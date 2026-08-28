defmodule Ethos.ReleaseTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures

  alias Ethos.SeedDataHelpers

  # This test was originally written against an empty priv/seed_data/brooklyn/,
  # asserting that seeding it was a no-op rather than a crash so the release
  # runbook order was valid before any wave landed. Wave 1 has landed, so the
  # empty-directory premise is gone; what still needs proving is the same
  # runbook property in its post-wave form — seed_brooklyn/1 publishes exactly
  # the committed files and can be run again without duplicating them.
  test "seed_brooklyn/1 publishes the committed Brooklyn seed files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("brooklyn"))

    Ethos.Release.seed_brooklyn(user.email)

    brooklyn = fn ->
      Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Brooklyn"))
    end

    assert length(brooklyn.()) == expected

    Ethos.Release.seed_brooklyn(user.email)

    assert length(brooklyn.()) == expected
  end
end
