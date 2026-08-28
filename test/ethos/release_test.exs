defmodule Ethos.ReleaseTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures

  test "seed_brooklyn/1 tolerates an empty seed directory" do
    user = user_fixture()
    before = length(Ethos.Guides.list_published_guides())

    # priv/seed_data/brooklyn/ holds no JSON until wave 1 lands. Seeding it must
    # be a no-op rather than a crash, so the runbook order is valid from day one.
    Ethos.Release.seed_brooklyn(user.email)

    assert length(Ethos.Guides.list_published_guides()) == before
  end
end
