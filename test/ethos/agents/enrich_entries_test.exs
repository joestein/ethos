defmodule Ethos.Agents.Actions.EnrichEntriesTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.EnrichEntries
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "enriches entries lacking enrichment, skips tips, tolerates failures" do
    guide = guide_fixture()
    {:ok, e1} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    {:ok, _tip} = Guides.create_entry(guide, %{kind: "tip", name: "Carry coins", verdict: nil})

    {:ok, _e2} =
      Guides.create_entry(guide, %{kind: "sight", name: "Belem Tower", verdict: "good"})

    expect(Ethos.ExaMock, :search, 2, fn query, _opts ->
      if query =~ "Ramiro" do
        {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "seafood"}]}
      else
        {:error, :timeout}
      end
    end)

    assert {:ok, %{enriched: 1, failed: 1}} = EnrichEntries.run(%{guide_id: guide.id}, %{})

    assert Guides.get_entry!(guide, e1.id).enrichment["official_url"] ==
             "https://cervejariaramiro.pt"
  end
end
