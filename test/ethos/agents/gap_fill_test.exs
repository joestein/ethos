defmodule Ethos.Agents.Actions.GapFillTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Agents.Actions.GapFill
  alias Ethos.{Contributions, Guides}
  import Ethos.GuidesFixtures

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "gathers candidates, one Claude pick, creates suggestions" do
    guide = guide_fixture()
    {:ok, _} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    expect(Ethos.ExaMock, :search, 3, fn _query, _opts ->
      {:ok, [%{title: "LX Factory", url: "https://lxfactory.com", snippet: "creative hub"}]}
    end)

    expect(Ethos.ClaudeMock, :pick_nearby, 1, fn dest, existing, candidates ->
      assert dest == guide.destination
      assert "Ramiro" in existing
      assert length(candidates) > 0
      {:ok, [%{"name" => "LX Factory", "kind" => "sight", "reason" => "creative hub", "url" => "https://lxfactory.com"}]}
    end)

    assert {:ok, %{created: 1}} = GapFill.run(%{guide_id: guide.id}, %{})
    assert [%{place_name: "LX Factory", origin: "gap_fill"}] = Contributions.list_pending_suggestions(guide)
  end

  test "degrades to zero suggestions on Claude error" do
    guide = guide_fixture()

    expect(Ethos.ExaMock, :search, 3, fn _q, _o -> {:ok, []} end)
    expect(Ethos.ClaudeMock, :pick_nearby, 1, fn _, _, _ -> {:error, :refusal} end)

    assert {:ok, %{created: 0}} = GapFill.run(%{guide_id: guide.id}, %{})
  end
end
