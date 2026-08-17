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

    # All 4 exa calls (1 enrich + 3 gap-fill queries) return no results, so
    # GapFill's empty-candidates short-circuit means pick_nearby is never
    # called — no expect/stub for it here.
    expect(Ethos.ExaMock, :search, 4, fn _q, _o -> {:ok, []} end)

    GuideAgent.publish_pipeline(guide.id, sync: true)
    assert_receive {:pipeline_done, _}
  end

  test "parse_import/2 runs the async branch under Task.Supervisor when sync: false is forced" do
    # This module is `async: false`, so `setup :set_mox_from_context` above
    # already put Mox in global mode — but force it explicitly too, per the
    # invariant this test exists to prove: a spawned Task (not the test
    # process) must still be able to call the mock. Sandbox is shared for
    # async: false DataCase tests, so the task's DB access works too.
    Mox.set_mox_global()

    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "Ramiro was amazing")
    GuideAgent.subscribe_import(imp.id)

    expect(Ethos.ClaudeMock, :parse_dump, fn _, _ ->
      {:ok, [%{"day" => nil, "kind" => "food", "name" => "Ramiro", "note" => nil, "verdict" => "loved"}]}
    end)

    assert :ok = GuideAgent.parse_import(imp.id, sync: false)

    assert_receive {:import_parsed, import_id}, 1000
    assert import_id == imp.id
    assert Guides.get_import!(imp.id).status == "parsed"
  end
end
