defmodule Ethos.Agents.Actions.ParseDumpTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.ParseDump
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "parses the dump, stores proposal, marks import parsed" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "day 1: Ramiro (unreal), then walked Alfama")

    expect(Ethos.ClaudeMock, :parse_dump, fn raw, dest ->
      assert raw =~ "Ramiro"
      assert dest == guide.destination

      {:ok,
       [
         %{
           "day" => 1,
           "kind" => "food",
           "name" => "Ramiro",
           "note" => "unreal",
           "verdict" => "loved"
         },
         %{"day" => 1, "kind" => "banquet", "name" => "junk", "note" => nil, "verdict" => nil}
       ]}
    end)

    assert {:ok, %{proposal: [%{"name" => "Ramiro"}]}} = ParseDump.run(%{import_id: imp.id}, %{})

    imp = Guides.get_import!(imp.id)
    assert imp.status == "parsed"
    assert [%{"name" => "Ramiro"}] = imp.proposal
  end

  test "marks import failed on refusal" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ -> {:error, :refusal} end)

    assert {:error, _} = ParseDump.run(%{import_id: imp.id}, %{})
    assert Guides.get_import!(imp.id).status == "failed"
  end
end
