defmodule Ethos.Seeds.BackfillLinksTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.Seeds

  test "backfill is idempotent and only links pages that exist" do
    user = user_fixture()
    Ethos.SeedDataHelpers.seed_destinations_for!([Seeds.ConnecticutPlaces])
    Seeds.ConnecticutPlaces.upsert_all!()
    Seeds.WoodburyGuide.upsert!(user.email)
    Seeds.SouthburyGuide.upsert!(user.email)
    # Manhattan guides absent — their edges must be skipped, not raise

    n1 = Seeds.BackfillLinks.upsert_all!()
    n2 = Seeds.BackfillLinks.upsert_all!()
    assert n1 == n2 and n1 > 0

    woodbury = Ethos.Guides.get_published_guide_by_slug!("woodbury-ct-travel-guide")
    connected = Ethos.Links.links_for("guide", woodbury.id)

    assert Enum.any?(
             connected,
             &(&1.other.slug == "southbury-ct-travel-guide" and &1.kind == "shared-history")
           )
  end
end
