defmodule Ethos.ImportsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "create_import/2 stores raw text as pending" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "day 1 we ate at Ramiro, amazing")
    assert imp.status == "pending"
    assert Guides.latest_import(guide).id == imp.id
  end

  test "mark_import/3 transitions status and stores proposal or error" do
    guide = guide_fixture()
    {:ok, imp} = Guides.create_import(guide, "notes")

    {:ok, imp} =
      Guides.mark_import(imp, "parsed", %{proposal: [%{"name" => "Ramiro", "kind" => "food"}]})

    assert imp.status == "parsed"
    assert [%{"name" => "Ramiro"}] = imp.proposal

    {:ok, imp} = Guides.mark_import(imp, "failed", %{error: "refusal"})
    assert imp.error == "refusal"
  end

  test "create_import/2 rejects blank text" do
    guide = guide_fixture()
    assert {:error, _} = Guides.create_import(guide, "   ")
  end
end
