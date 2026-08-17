defmodule Ethos.ContributionsTest do
  use Ethos.DataCase, async: true

  alias Ethos.{Contributions, Guides}
  import Ethos.{AccountsFixtures, GuidesFixtures}

  test "accept_suggestion/1 creates a credited entry and links it" do
    guide = guide_fixture()
    reader = user_fixture()

    {:ok, sugg} =
      Contributions.create_suggestion(reader, guide, %{
        place_name: "Bar da Velha",
        body: "Two blocks from Ramiro, better vibe"
      })

    assert sugg.status == "pending"
    {:ok, %{suggestion: sugg, entry: entry}} = Contributions.accept_suggestion(sugg)

    assert sugg.status == "accepted"
    assert sugg.accepted_entry_id == entry.id
    assert entry.credited_user_id == reader.id
    assert entry.source == "suggestion"
    assert entry.name == "Bar da Velha"
  end

  test "accept_suggestion/1 on an already-processed suggestion returns an error instead of crashing" do
    guide = guide_fixture()
    reader = user_fixture()

    {:ok, sugg} =
      Contributions.create_suggestion(reader, guide, %{place_name: "Bar da Velha", body: "gem"})

    assert {:ok, _} = Contributions.accept_suggestion(sugg)

    # Re-fetch to get the updated (now "accepted") status, simulating a
    # double-click where the second request loads the suggestion again.
    reloaded = Contributions.get_suggestion!(guide, sugg.id)
    assert reloaded.status == "accepted"
    assert Contributions.accept_suggestion(reloaded) == {:error, :already_processed}

    # Only one entry was created — the second accept did not insert another.
    assert length(Guides.list_entries(guide)) == 1
  end

  test "decline_suggestion/1 on an already-processed suggestion returns an error instead of crashing" do
    guide = guide_fixture()
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "X", body: "y"})
    {:ok, declined} = Contributions.decline_suggestion(sugg)

    assert Contributions.decline_suggestion(declined) == {:error, :already_processed}
  end

  test "decline_suggestion/1 sets declined without creating an entry" do
    guide = guide_fixture()
    reader = user_fixture()
    {:ok, sugg} = Contributions.create_suggestion(reader, guide, %{place_name: "X", body: "y"})
    {:ok, sugg} = Contributions.decline_suggestion(sugg)
    assert sugg.status == "declined"
    assert Guides.list_entries(guide) == []
  end

  test "create_gap_fill_suggestions/2 creates authorless pending suggestions" do
    guide = guide_fixture()

    {:ok, suggs} =
      Contributions.create_gap_fill_suggestions(guide, [
        %{
          "name" => "LX Factory",
          "kind" => "sight",
          "reason" => "creative hub",
          "url" => "https://lxfactory.com"
        }
      ])

    assert [%{origin: "gap_fill", author_id: nil, place_name: "LX Factory", status: "pending"}] =
             suggs
  end
end
