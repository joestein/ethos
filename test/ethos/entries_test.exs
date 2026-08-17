defmodule Ethos.EntriesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures
  import Ethos.AccountsFixtures

  test "create_entry/2 validates kind and verdict" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{kind: "food", name: "Cervejaria Ramiro", verdict: "loved"})

    assert entry.source == "manual"
    assert entry.position == 0

    {:error, changeset} = Guides.create_entry(guide, %{kind: "banquet", name: "X"})
    assert %{kind: _} = errors_on(changeset)
  end

  test "create_entry/2 (public/web path) never sets source or credited_user_id from attrs" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{
        "kind" => "food",
        "name" => "Forged Entry",
        "source" => "suggestion",
        "credited_user_id" => 123
      })

    assert entry.source == "manual"
    assert entry.credited_user_id == nil
  end

  test "create_entry/3 with :privileged mode does allow setting source and credited_user_id" do
    guide = guide_fixture()
    reader = user_fixture()

    {:ok, entry} =
      Guides.create_entry(
        guide,
        %{kind: "tip", name: "Trusted entry", source: "suggestion", credited_user_id: reader.id},
        :privileged
      )

    assert entry.source == "suggestion"
    assert entry.credited_user_id == reader.id
  end

  test "replace_entries_from_proposal/2 rolls back and returns an error changeset for an invalid row" do
    guide = guide_fixture()

    proposal = [
      %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "garlic shrimp", "verdict" => "loved"},
      %{"day" => 1, "kind" => "food", "name" => "", "note" => nil, "verdict" => nil}
    ]

    assert {:error, %Ecto.Changeset{}} = Guides.replace_entries_from_proposal(guide, proposal)
    assert Guides.list_entries(guide) == []
  end

  test "replace_entries_from_proposal/2 inserts ordered import entries" do
    guide = guide_fixture()

    proposal = [
      %{"day" => 1, "kind" => "food", "name" => "Ramiro", "note" => "garlic shrimp", "verdict" => "loved"},
      %{"day" => 1, "kind" => "walk", "name" => "Alfama wander", "note" => nil, "verdict" => "good"}
    ]

    {:ok, entries} = Guides.replace_entries_from_proposal(guide, proposal)

    assert [%{name: "Ramiro", position: 0, source: "import"}, %{name: "Alfama wander", position: 1}] =
             entries

    assert length(Guides.list_entries(guide)) == 2
  end

  test "set_entry_enrichment/2 merges enrichment payload" do
    guide = guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "sight", name: "Belem Tower", verdict: "good"})
    {:ok, entry} = Guides.set_entry_enrichment(entry, %{"official_url" => "https://example.com"})
    assert entry.enrichment["official_url"] == "https://example.com"
  end
end
