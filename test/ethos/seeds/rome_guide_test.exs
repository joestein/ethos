defmodule Ethos.Seeds.RomeGuideTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Accounts, Guides, Seeds.RomeGuide}
  alias Ethos.Accounts.Username
  import Ethos.AccountsFixtures

  test "upsert! creates the published guide idempotently under the owner" do
    user = user_fixture()

    guide = RomeGuide.upsert!(user.email)
    assert guide.user_id == user.id
    assert guide.status == "published"
    assert guide.slug == "three-days-in-rome-real-trip-guide"
    assert guide.destination_slug == "rome"

    # The affiliate registry is keyed on state_slug. Without this the Rome
    # locale silently never fires, and every affiliate test still passes
    # because they exercise fixtures rather than the seeder.
    assert guide.state_slug == "italy"
    assert length(guide.sections) == 4
    assert length(guide.faq) == 6
    assert length(guide.photos) == 13

    assert Enum.all?(guide.photos, fn p ->
             p["src"] =~ ~r{^/photos/rome/[a-z0-9-]+\.jpg$}
           end)

    entries = Guides.list_entries(guide)
    assert length(entries) == 8
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "partner_id=ZA4AIMF"))
    assert Enum.any?(entries, &(&1.booking_url && &1.booking_url =~ "viator.com"))

    arena_floor =
      Enum.find(entries, &(&1.name == "Colosseum arena floor, Roman Forum & Palatine Hill"))

    assert %{
             "links" => [
               %{
                 "title" => "The Roman Guy — Colosseum arena floor tour",
                 "url" => "https://theromanguy.com/tours/italy/rome/colosseum-tour-arena-floor"
               }
             ],
             "source" => "seed"
           } = arena_floor.enrichment

    # second run updates in place, no duplicates
    guide2 = RomeGuide.upsert!(user.email)
    assert guide2.id == guide.id
    assert length(Guides.list_entries(guide2)) == 8
    assert length(guide2.photos) == 13
  end

  test "auto-creates the owner account with a derived username when it does not exist yet" do
    fresh_email = "fresh-owner-#{System.unique_integer([:positive])}@example.com"
    refute Accounts.get_user_by_email(fresh_email)

    guide = RomeGuide.upsert!(fresh_email)

    user = Accounts.get_user_by_email(fresh_email)
    assert user
    assert guide.user_id == user.id
    assert user.username == Username.derive_from_email(fresh_email)
    assert Regex.match?(Username.format(), user.username)
  end

  test "raises instead of auto-creating the owner account outside dev/test" do
    Application.put_env(:ethos, :env, :prod)
    on_exit(fn -> Application.put_env(:ethos, :env, :test) end)

    assert_raise RuntimeError, ~r/owner account .* not found/, fn ->
      RomeGuide.upsert!("no-such-owner@example.com")
    end
  end
end
