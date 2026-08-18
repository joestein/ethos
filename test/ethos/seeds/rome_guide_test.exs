defmodule Ethos.Seeds.RomeGuideTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Guides, Seeds.RomeGuide}
  import Ethos.AccountsFixtures

  test "upsert! creates the published guide idempotently under the owner" do
    user = user_fixture()

    guide = RomeGuide.upsert!(user.email)
    assert guide.user_id == user.id
    assert guide.status == "published"
    assert guide.slug == "three-days-in-rome-real-trip-guide"
    assert guide.destination_slug == "rome"
    assert length(guide.sections) == 4
    assert length(guide.faq) == 6

    entries = Guides.list_entries(guide)
    assert length(entries) == 8
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "partner_id=ZA4AIMF"))
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "viator.com"))

    # second run updates in place, no duplicates
    guide2 = RomeGuide.upsert!(user.email)
    assert guide2.id == guide.id
    assert length(Guides.list_entries(guide2)) == 8
  end
end
