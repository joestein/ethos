defmodule Ethos.EntriesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "create_entry/2 validates kind and verdict" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{kind: "food", name: "Cervejaria Ramiro", verdict: "loved"})

    assert entry.source == "manual"
    assert entry.position == 0

    {:error, changeset} = Guides.create_entry(guide, %{kind: "banquet", name: "X"})
    assert %{kind: _} = errors_on(changeset)
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
