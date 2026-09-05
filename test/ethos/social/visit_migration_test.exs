defmodule Ethos.Social.VisitMigrationTest do
  @moduledoc """
  The migration itself cannot be tested after the fact — the test database is
  already migrated and `place_visits` is gone. What CAN be tested, and is what
  actually matters, is that a user holding the reactions the migration produces
  still earns the badges they had.
  """
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.PlacesFixtures

  test "a user with five Waterbury reactions holds Brass City Explorer" do
    user = user_fixture()

    # `town`, not `town_slug` — the changeset derives the slug and silently
    # ignores a slug key.
    for _ <- 1..5 do
      place = place_fixture(%{status: "open", town: "Waterbury"})
      Ethos.Social.react(user, place, "up")
    end

    keys = Enum.map(Ethos.Badges.earned_badges(user), & &1.badge_key)

    assert "explorer-waterbury" in keys
    assert "first-steps" in keys
  end
end
