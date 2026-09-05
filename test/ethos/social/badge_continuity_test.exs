defmodule Ethos.Social.BadgeContinuityTest do
  @moduledoc """
  Proves badge continuity across the visits-to-reactions migration: a user
  holding the reactions that migration produces still earns the badges they
  had. It cannot test the migration itself — the test database is already
  migrated and `place_visits` is gone by the time this runs — so it stands
  in for that by reproducing the reaction the migration would have written
  and checking the badge follows it.
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
