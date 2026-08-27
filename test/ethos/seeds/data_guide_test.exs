defmodule Ethos.Seeds.DataGuideTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds.DataGuide

  @fixtures Path.expand("../../support/fixtures/seed_data", __DIR__)
  @testville Path.join(@fixtures, "testville.json")
  @refville Path.join(@fixtures, "refville.json")
  @townville Path.join(@fixtures, "townville.json")

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
    for path <- [@testville, @refville], do: DataGuide.upsert_links!(path)
    # run twice — idempotent
    DataGuide.upsert_links!(@refville)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    connected = Ethos.Links.links_for("guide", ref.id)

    assert Enum.any?(
             connected,
             &(&1.kind == "nearby" and &1.other.slug == "testville-manhattan-guide")
           )

    assert Enum.any?(connected, &(&1.kind == "see-also" and &1.other.slug == "test-square-park"))
    assert length(connected) == 2
  end

  test "unknown link target in links array raises with the file path" do
    user = user_fixture()
    bad = Path.join(System.tmp_dir!(), "bad-link-seed.json")

    File.write!(
      bad,
      ~s({"guide": {"slug": "bad-link-guide", "title": "Bad", "destination": "Bad, New York", "state": "New York", "county": "Manhattan", "intro": "x", "sections": [], "faq": [], "photos": []}, "places": [], "entries": [], "links": [{"target": "guide:no-such-guide-slug", "kind": "nearby", "note": null}]})
    )

    DataGuide.upsert_places!(bad)
    DataGuide.upsert_guide!(bad, user.email)

    assert_raise ArgumentError, ~r/bad-link-seed\.json.*no-such-guide-slug/s, fn ->
      DataGuide.upsert_links!(bad)
    end
  end

  test "re-seeding a corrected links array retires the edge it corrected" do
    user = user_fixture()
    for path <- [@testville, @refville], do: DataGuide.upsert_places!(path)
    for path <- [@testville, @refville], do: DataGuide.upsert_guide!(path, user.email)
    for path <- [@testville, @refville], do: DataGuide.upsert_links!(path)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    assert Enum.any?(Ethos.Links.links_for("guide", ref.id), &(&1.kind == "nearby"))

    # Same edge, re-typed — exactly what the wave reviews kept producing.
    corrected = Path.join(System.tmp_dir!(), "refville-corrected.json")

    @refville
    |> File.read!()
    |> String.replace(~s("kind": "nearby"), ~s("kind": "same-region"))
    |> then(&File.write!(corrected, &1))

    DataGuide.upsert_links!(corrected)

    kinds =
      "guide"
      |> Ethos.Links.links_for(ref.id)
      |> Enum.filter(&(&1.other.slug == "testville-manhattan-guide"))
      |> Enum.map(& &1.kind)

    assert kinds == ["same-region"],
           "stale edge survived correction — target would render under two headings"
  end

  test "tier defaults to guide and is read from the seed file" do
    user = user_fixture()

    guide = DataGuide.upsert_from_file!(@testville, user.email)
    assert guide.tier == "guide"

    town = DataGuide.upsert_from_file!(@townville, user.email)
    assert town.tier == "town-page"
  end

  test "an unknown tier raises with the file path" do
    bad = Path.join(System.tmp_dir!(), "bad-tier-seed.json")

    File.write!(
      bad,
      ~s({"guide": {"slug": "bad-tier-guide", "title": "Bad", "destination": "Bad, Connecticut", "state": "Connecticut", "county": "Windham County", "intro": "x", "tier": "leaflet", "sections": [], "faq": [], "photos": []}, "places": [], "entries": []})
    )

    assert_raise ArgumentError, ~r/bad-tier-seed\.json.*leaflet/s, fn -> DataGuide.load!(bad) end
  end

  test "links resolve regardless of file order — a file may link forward" do
    user = user_fixture()
    # @testville links to nothing; @refville links back to it. Seeding guides in
    # reverse order would break a link applied during guide creation.
    for path <- [@refville, @testville], do: DataGuide.upsert_places!(path)
    for path <- [@refville, @testville], do: DataGuide.upsert_guide!(path, user.email)
    for path <- [@refville, @testville], do: DataGuide.upsert_links!(path)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")

    assert Enum.any?(
             Ethos.Links.links_for("guide", ref.id),
             &(&1.kind == "nearby" and &1.other.slug == "testville-manhattan-guide")
           )
  end
end
