defmodule EthosWeb.SitemapControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "lists landing, destinations, hubs, and published guides", %{conn: conn} do
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Oslo, Norway"})

    conn = get(conn, "/sitemap.xml")
    body = response(conn, 200)

    assert response_content_type(conn, :xml) =~ "xml"
    assert body =~ url(~p"/")
    assert body =~ url(~p"/destinations")
    assert body =~ url(~p"/destinations/rome")
    assert body =~ url(~p"/g/#{g.slug}")
    refute body =~ "oslo"
    assert body =~ "<lastmod>"
  end

  # Every destination URL used to ship without a lastmod, so a crawler holding
  # those URLs got no signal when their prose changed — which is precisely what
  # happened when all thirteen gained an intro and a photograph. Guides, places
  # and collections all carried one; destinations were the gap.
  test "a destination with a record carries its record's lastmod", %{conn: conn} do
    published_guide_fixture(%{destination: "Rome, Italy"})

    {:ok, destination} =
      Ethos.Destinations.upsert_destination!(%{
        "path" => "rome",
        "name" => "Rome",
        "intro" => "A destination with a record, and therefore a modification date."
      })
      |> then(&{:ok, &1})

    body = conn |> get("/sitemap.xml") |> response(200)

    expected = Date.to_iso8601(DateTime.to_date(destination.updated_at))

    assert body =~
             "<loc>#{url(~p"/destinations/rome")}</loc><lastmod>#{expected}</lastmod>",
           "the destination URL should carry its record's lastmod"
  end

  test "a destination with no record still lists, without a lastmod", %{conn: conn} do
    published_guide_fixture(%{destination: "Lisbon, Portugal"})

    body = conn |> get("/sitemap.xml") |> response(200)

    # Present, because the guide produces it; no lastmod, because nothing owns
    # a modification date for it. Listing it without a date beats omitting it.
    assert body =~ "<loc>#{url(~p"/destinations/lisbon")}</loc></url>"
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
end
