defmodule EthosWeb.SitemapControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  alias Ethos.Guides
  alias Ethos.SeedDataHelpers

  test "lists landing, destinations, hubs, and published guides", %{conn: conn} do
    # Destinations before guides, always — every test that writes both tables
    # takes its row locks in that order, so two async tests can only wait on
    # each other rather than deadlock.
    SeedDataHelpers.seed_destination_paths!(["italy/lazio/rome"])
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Oslo, Norway"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert response_content_type(conn, :xml) =~ "xml"
    assert body =~ url(~p"/")
    assert body =~ url(~p"/destinations")
    assert body =~ url(~p"/destinations/italy/lazio/rome")
    assert body =~ url(~p"/g/#{g.slug}")
    refute body =~ "oslo"
    assert body =~ "<lastmod>"
  end

  # Every destination URL used to ship without a lastmod, so a crawler holding
  # those URLs got no signal when their prose changed — which is precisely what
  # happened when all fifteen gained an intro and a photograph. Guides, places
  # and collections all carried one; destinations were the gap. Now that every
  # hub is a node and every node has an `updated_at`, the gap closes for all of
  # them rather than for the fifteen that had a curated record.
  test "a destination node carries its own lastmod", %{conn: conn} do
    SeedDataHelpers.seed_destination_paths!(["italy/lazio/rome"])
    published_guide_fixture(%{destination: "Rome, Italy"})

    node = Ethos.Destinations.get_by_path("italy/lazio/rome")

    body = conn |> get("/sitemap.xml") |> response(200)

    expected = Date.to_iso8601(DateTime.to_date(node.updated_at))

    assert body =~
             "<loc>#{url(~p"/destinations/italy/lazio/rome")}</loc><lastmod>#{expected}</lastmod>",
           "the destination URL should carry its node's lastmod"
  end

  # The inverse of the rule above, and why the guide-derived destination
  # builders were removed rather than translated. A guide's `destination` is
  # free text: "Lisbon, Portugal" derived `/destinations/lisbon`, which the
  # sitemap advertised even though nothing in the tree answers to it. That URL
  # 404s now, and a sitemap full of 404s is what makes Search Console stop
  # trusting the file.
  test "a guide destination with no node is not advertised", %{conn: conn} do
    SeedDataHelpers.seed_destination_paths!(["italy/lazio/rome"])
    published_guide_fixture(%{destination: "Lisbon, Portugal"})

    body = conn |> get("/sitemap.xml") |> response(200)

    refute body =~ "<loc>#{url(~p"/destinations/lisbon")}</loc>"
    assert body =~ "<loc>#{url(~p"/destinations/italy/lazio/rome")}</loc><lastmod>"
  end

  # A guide whose destination is a bare state name derives the same slug as the
  # state hub, so the URL was emitted twice — once from the guide-derived
  # destinations and once from the states. The Antique Trail guide, whose
  # destination is "Connecticut", is what surfaced it, but any such guide would.
  test "no URL is listed twice", %{conn: conn} do
    published_guide_fixture(%{destination: "Connecticut", state: "Connecticut"})
    published_guide_fixture(%{destination: "Woodbury, Connecticut", state: "Connecticut"})

    body = conn |> get("/sitemap.xml") |> response(200)

    locs = Regex.scan(~r{<loc>([^<]+)</loc>}, body, capture: :all_but_first) |> List.flatten()
    dupes = locs -- Enum.uniq(locs)

    assert dupes == [], "sitemap lists these URLs more than once: #{inspect(Enum.uniq(dupes))}"
  end

  test "includes /photos for photo-bearing published guides only", %{conn: conn} do
    with_photos = published_guide_fixture(%{destination: "Rome, Italy"})

    {:ok, with_photos} =
      Guides.update_guide_photos(with_photos, [
        %{
          "src" => "/photos/rome/trevi-fountain.jpg",
          "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
          "title" => "Trevi Fountain",
          "description" => "Oceanus in afternoon sun."
        }
      ])

    without_photos = published_guide_fixture(%{destination: "Lisbon, Portugal"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert body =~ url(~p"/g/#{with_photos.slug}/photos")
    refute body =~ url(~p"/g/#{without_photos.slug}/photos")
  end

  describe "foliage URLs" do
    test "lists the nine foliage pages", %{conn: conn} do
      xml = conn |> get(~p"/sitemap.xml") |> response(200)

      assert xml =~ "<loc>http://localhost:4002/foliage</loc>"
      assert xml =~ "<loc>http://localhost:4002/foliage/hartford-west</loc>"

      foliage_urls = Regex.scan(~r{<loc>[^<]*/foliage[^<]*</loc>}, xml)
      assert length(foliage_urls) == 9
    end

    test "never lists a week variant", %{conn: conn} do
      xml = conn |> get(~p"/sitemap.xml") |> response(200)
      refute xml =~ "?week="
    end
  end
end

defmodule EthosWeb.SitemapRosterTest do
  @moduledoc """
  The one sitemap assertion that needs the whole tree, held apart from the rest
  of the file so the other three stay parallel.

  `async: false`, deliberately: this seeds the whole roster, and an async
  test that does that is a concurrent writer of the same rows as every other
  full-roster seeder. Two such transactions deadlock or get cancelled, and the
  suite failed roughly one run in three until the async writers were dealt
  with. It cannot be narrowed — "every node is listed" is the assertion.
  """
  use EthosWeb.ConnCase, async: false

  # The whole roster, so this measures the real tree rather than a hand-built
  # pair of nodes: every node is listed at its own path, and no node's legacy
  # path — the URL it used to live at, which now 301s — is listed anywhere.
  # Advertising a redirect source to Google is worse than omitting it: the
  # crawler spends a hop, and the canonical URL is the one we want indexed.
  test "the sitemap lists every destination node and no legacy paths", %{conn: conn} do
    Ethos.Seeds.DestinationTree.upsert_all!()
    xml = conn |> get(~p"/sitemap.xml") |> response(200)

    assert xml =~ "/destinations/united-states/connecticut/litchfield-county"
    refute xml =~ "<loc>http://localhost:4002/destinations/connecticut</loc>"

    locs =
      Regex.scan(~r{<loc>([^<]+)</loc>}, xml, capture: :all_but_first)
      |> List.flatten()
      |> MapSet.new()

    nodes = Ethos.Destinations.list_destinations()

    missing =
      for n <- nodes,
          loc = url(~p"/destinations/#{String.split(n.path, "/")}"),
          not MapSet.member?(locs, loc),
          do: n.path

    assert missing == [],
           "these destination nodes are missing from the sitemap: #{inspect(missing)}"

    advertised_legacy =
      for n <- nodes,
          legacy <- n.legacy_paths,
          loc = url(~p"/destinations/#{String.split(legacy, "/")}"),
          MapSet.member?(locs, loc),
          do: legacy

    assert advertised_legacy == [],
           "the sitemap advertises these legacy paths, every one of which 301s: " <>
             inspect(advertised_legacy)
  end
end
