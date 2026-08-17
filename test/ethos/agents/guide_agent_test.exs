defmodule Ethos.Agents.GuideAgentTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "parse_import/2 runs ParseDump and broadcasts completion" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "Ramiro was amazing")
    GuideAgent.subscribe_import(imp.id)

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ ->
      {:ok, [%{"day" => nil, "kind" => "food", "name" => "Ramiro", "note" => nil, "verdict" => "loved"}]}
    end)

    GuideAgent.parse_import(imp.id, sync: true)

    assert_receive {:import_parsed, import_id}
    assert import_id == imp.id
    assert Guides.get_import!(imp.id).status == "parsed"
  end

  test "parse_import/2 broadcasts failure" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")
    GuideAgent.subscribe_import(imp.id)

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ -> {:error, :refusal} end)

    GuideAgent.parse_import(imp.id, sync: true)
    assert_receive {:import_failed, _}
  end

  test "publish_pipeline/2 enriches then gap-fills then broadcasts" do
    guide = guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    GuideAgent.subscribe_guide(guide.id)

    expect(Ethos.ExaMock, :search, 4, fn _q, _o -> {:ok, []} end)
    expect(Ethos.ClaudeMock, :pick_nearby, fn _, _, _ -> {:ok, []} end)

    GuideAgent.publish_pipeline(guide.id, sync: true)
    assert_receive {:pipeline_done, _}
  end
end
