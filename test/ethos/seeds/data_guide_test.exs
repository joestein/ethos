defmodule Ethos.Seeds.DataGuideTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds.DataGuide

  @fixtures Path.expand("../../support/fixtures/seed_data", __DIR__)
  @testville Path.join(@fixtures, "testville.json")
  @refville Path.join(@fixtures, "refville.json")

  test "upsert_from_file! creates places, guide, and linked entries; idempotent" do
    user = user_fixture()

    guide = DataGuide.upsert_from_file!(@testville, user.email)
    guide = DataGuide.upsert_from_file!(@testville, user.email)

    assert guide.slug == "testville-manhattan-guide"
    assert guide.status == "published"
    assert guide.state == "New York"
    assert guide.county == "Manhattan"
    assert guide.intro =~ "fixture neighborhood"

    entries = Guides.list_entries(guide)
    assert length(entries) == 2
    assert Enum.all?(entries, & &1.place_id)

    assert %{kind: "park", town_slug: "testville"} = Places.get_place_by_slug!("test-square-park")
    assert Repo.aggregate(Places.Place, :count) == 2
  end

  test "cross-file entry references resolve after two-pass ordering" do
    user = user_fixture()

    for path <- [@testville, @refville], do: DataGuide.upsert_places!(path)
    for path <- [@testville, @refville], do: DataGuide.upsert_guide!(path, user.email)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    assert [%{place: %{slug: "test-square-park"}}] = Guides.list_entries(ref)
  end

  test "malformed JSON and missing keys raise with the path" do
    bad = Path.join(System.tmp_dir!(), "bad-seed.json")
    File.write!(bad, "{not json")

    assert_raise ArgumentError, ~r/bad-seed\.json/, fn -> DataGuide.load!(bad) end

    File.write!(bad, ~s({"guide": {}}))
    assert_raise ArgumentError, ~r/missing/, fn -> DataGuide.load!(bad) end
  end

  test "unknown place_slug in entries raises" do
    user = user_fixture()
    bad = Path.join(System.tmp_dir!(), "bad-ref-seed.json")

    File.write!(
      bad,
      ~s({"guide": {"slug": "bad-ref-guide", "title": "Bad", "destination": "Bad, New York", "state": "New York", "county": "Manhattan", "intro": "x", "sections": [], "faq": [], "photos": []}, "places": [], "entries": [{"kind": "sight", "name": "Ghost", "place_slug": "no-such-place", "note": "x"}]})
    )

    DataGuide.upsert_places!(bad)
    assert_raise Ecto.NoResultsError, fn -> DataGuide.upsert_guide!(bad, user.email) end
  end

  test "seed file links array creates edges from the guide" do
    user = user_fixture()
    for path <- [@testville, @refville], do: DataGuide.upsert_places!(path)
    for path <- [@testville, @refville], do: DataGuide.upsert_guide!(path, user.email)
    # run twice — idempotent
    DataGuide.upsert_guide!(@refville, user.email)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    connected = Ethos.Links.links_for("guide", ref.id)

    assert Enum.any?(
             connected,
             &(&1.kind == "nearby" and &1.other.slug == "testville-manhattan-guide")
           )

    assert Enum.any?(connected, &(&1.kind == "see-also" and &1.other.slug == "test-square-park"))
    assert length(connected) == 2
  end
end
