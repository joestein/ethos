defmodule EthosWeb.PlaceControllerTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.Places
  alias Ethos.Places.DeletedPlaces

  @attrs %{
    slug: "palace-theater-waterbury",
    name: "Palace Theater",
    kind: "theater",
    summary: "A 1922 Thomas Lamb movie palace.",
    history: "Designed by **Thomas Lamb**.",
    address: "100 E. Main St., Waterbury, CT 06702",
    official_url: "https://palacetheaterct.org",
    status: "open",
    photos: [
      %{
        "src" => "/photos/ct/waterbury/palace-theater.jpg",
        "thumb" => "/photos/ct/waterbury/palace-theater_thumb.jpg",
        "title" => "Palace Theater",
        "description" => "The marquee.",
        "author" => "Jane Doe",
        "license" => "CC BY-SA 4.0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:Palace.jpg"
      }
    ]
  }

  test "renders place with JSON-LD type, attribution, breadcrumb", %{conn: conn} do
    Places.upsert_place!(@attrs)
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    assert html =~ "Palace Theater"
    assert html =~ "PerformingArtsTheater"
    assert html =~ "BreadcrumbList"
    assert html =~ "Jane Doe"
    assert html =~ "CC BY-SA 4.0"
    assert html =~ ~s(rel="nofollow noopener")
    assert html =~ "data-copy-url"
    assert html =~ "og:image"
  end

  test "closed place shows the banner", %{conn: conn} do
    Places.upsert_place!(%{@attrs | status: "closed"})
    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)
    assert html =~ "Permanently closed"
  end

  test "unknown slug 404s", %{conn: conn} do
    assert conn |> get(~p"/p/nope") |> html_response(404)
  end

  describe "a slug with no place row" do
    # The manifest ships empty and waves append to it, so this pair must not
    # assume a size. The 404 half runs at every size; the 410 half runs on
    # whatever the manifest names, which is nothing until a wave finds a
    # closure. Verified against a temporary one-entry probe manifest — without
    # that, the 410 branch is never entered and the task is untested. Do not
    # stub DeletedPlaces to fill the gap: it compiles its list at build time,
    # so a stub would test the stub.
    test "one the manifest does not name still 404s", %{conn: conn} do
      refute DeletedPlaces.deleted?("a-place-the-manifest-never-mentions")

      body =
        conn |> get(~p"/p/a-place-the-manifest-never-mentions") |> response(404)

      assert body =~ "Not Found"
    end

    test "one the manifest names is 410 Gone, not 404", %{conn: conn} do
      for entry <- DeletedPlaces.all() do
        slug = entry["slug"]
        refute Places.get_place_by_slug(slug)

        body = conn |> get(~p"/p/#{slug}") |> response(410)

        # The body distinguishes a correct branch from one that sets status 410
        # but renders the 404 template anyway.
        assert body =~ "Gone", "#{slug} answered 410 with the wrong body: #{inspect(body)}"
      end
    end
  end

  test "restaurant kind maps to Restaurant JSON-LD", %{conn: conn} do
    Places.upsert_place!(%{
      @attrs
      | slug: "dine-x",
        name: "Dine X",
        kind: "restaurant",
        photos: []
    })

    html = conn |> get(~p"/p/dine-x") |> html_response(200)
    assert html =~ ~s("@type":"Restaurant")
  end

  test "renders a 'More in this town' section listing sibling places", %{conn: conn} do
    country =
      Ethos.Destinations.upsert_destination!(%{
        path: "united-states",
        name: "United States",
        kind: "country",
        intro: "United States."
      })

    region =
      Ethos.Destinations.upsert_destination!(%{
        path: "united-states/connecticut",
        name: "Connecticut",
        kind: "region",
        intro: "Connecticut.",
        parent_id: country.id
      })

    waterbury =
      Ethos.Destinations.upsert_destination!(%{
        path: "united-states/connecticut/waterbury",
        name: "Waterbury",
        kind: "town",
        intro: "Waterbury.",
        parent_id: region.id
      })

    Places.upsert_place!(Map.put(@attrs, :destination_id, waterbury.id))

    Places.upsert_place!(
      %{
        @attrs
        | slug: "mattatuck-museum",
          name: "Mattatuck Museum",
          kind: "museum",
          photos: []
      }
      |> Map.put(:destination_id, waterbury.id)
    )

    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    assert html =~ "More in Waterbury"
    assert html =~ "Mattatuck Museum"
    assert html =~ ~s(href="/p/mattatuck-museum")
  end

  test "a place with no siblings renders no 'More in' heading", %{conn: conn} do
    Places.upsert_place!(@attrs)

    html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

    refute html =~ "More in Waterbury"
    refute html =~ "More in "
  end

  defp place_ld(html, place) do
    json_ld_of_type(html, EthosWeb.PlaceHTML.schema_type(place.kind))
  end

  # `addressLocality` and `addressRegion` come from the place's node and its
  # nearest `region` ancestor, so every address fixture below names a real
  # roster node instead of writing a town and a state of its own. That is the
  # point rather than an inconvenience: a fixture that constructs its own
  # geography tests itself, which is exactly how a Roman place came within one
  # deploy of publishing as American.
  defp place_at!(node_path, attrs) do
    Ethos.SeedDataHelpers.seed_destination_paths!([node_path])
    Places.upsert_place!(Map.put(attrs, :destination_path, node_path))
  end

  test "PostalAddress is decomposed, not stuffed", %{conn: conn} do
    place =
      place_at!("united-states/connecticut/litchfield-county/bethlehem", %{
        @attrs
        | slug: "bethlehem-green",
          name: "Bethlehem Green",
          address: "9 Main Street North, Bethlehem, CT 06751",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    # Without these two the block is an untyped object of unknown country to
    # every consumer, and nothing else in the suite pins them.
    assert address["@type"] == "PostalAddress"
    assert address["addressCountry"] == "US"

    assert address["streetAddress"] == "9 Main Street North"
    assert address["addressLocality"] == "Bethlehem"
    assert address["addressRegion"] == "Connecticut"
    assert address["postalCode"] == "06751"
    refute String.contains?(address["streetAddress"], "Bethlehem")
  end

  test "locality and region come from the node even when the address disagrees",
       %{conn: conn} do
    # The corpus's real divergence shape, and by far its most common: 840 of
    # 2,066 addressed places parse a locality that differs from the node they
    # are filed under. A neighbourhood place carries the borough in its address.
    # Both values are present and they disagree — which is the case that tells
    # the tree rule apart from "the parse happened to be nil".
    place =
      place_at!("united-states/new-york/new-york-city/brooklyn/bushwick", %{
        @attrs
        | slug: "bushwick-inlet",
          name: "Bushwick Inlet Park",
          kind: "park",
          address: "86 Kent Avenue, Brooklyn, NY 11249",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    assert address["addressLocality"] == "Bushwick"
    assert address["addressRegion"] == "New York"
    # Not the parse's "Brooklyn"/"NY", which is what the address itself says.
    refute address["addressLocality"] == "Brooklyn"
    refute address["addressRegion"] == "NY"
    # The street line is still decomposed correctly alongside the disagreement.
    assert address["streetAddress"] == "86 Kent Avenue"
    assert address["postalCode"] == "11249"
  end

  test "a descriptive location omits streetAddress rather than publishing a false one",
       %{conn: conn} do
    place =
      place_at!("united-states/connecticut/fairfield-county/greenwich", %{
        @attrs
        | slug: "greenwich-shore",
          name: "Greenwich Shore",
          address: "Along Shore Road, Greenwich, CT 06830",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Greenwich"
    assert address["addressRegion"] == "Connecticut"
    assert address["postalCode"] == "06830"
  end

  test "an address that does not decompose omits streetAddress rather than republishing itself",
       %{conn: conn} do
    raw = "Irving Ave. and Knickerbocker Ave., between Starr St. and Suydam St., Brooklyn"

    place =
      place_at!("united-states/new-york/new-york-city/brooklyn", %{
        @attrs
        | slug: "irving-square",
          name: "Irving Square",
          address: raw,
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Brooklyn"
    assert address["addressRegion"] == "New York"
    # This string carries no five-digit code, so there is no postal code to
    # recover from it either. See the sibling test below for the corpus's more
    # common case, where the postal scan still succeeds on an address the
    # full-address match rejects.
    refute Map.has_key?(address, "postalCode")

    # The whole address string is still on the page, where a human reads it.
    assert html =~ "Irving Ave. and Knickerbocker Ave."
  end

  test "an undecomposable address still publishes the postal code found inside it",
       %{conn: conn} do
    place =
      place_at!("united-states/connecticut/tolland-county/andover", %{
        @attrs
        | slug: "burnap-brook",
          name: "Burnap Brook Preserve",
          address:
            "Trailhead parking on Burnap Brook Road, Andover, CT 06232; " <>
              "additional access on Wales Road and Lake Road",
          photos: []
      })

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    address = place_ld(html, place)["address"]

    refute Map.has_key?(address, "streetAddress")
    assert address["addressLocality"] == "Andover"
    assert address["postalCode"] == "06232"
  end

  test "a place with no address emits no PostalAddress at all", %{conn: conn} do
    place =
      Places.upsert_place!(%{@attrs | slug: "no-address", address: nil, photos: []})

    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    refute Map.has_key?(place_ld(html, place), "address")
  end

  test "official_url is published as sameAs", %{conn: conn} do
    place = Places.upsert_place!(@attrs)
    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
    ld = place_ld(html, place)

    assert ld["sameAs"] == ["https://palacetheaterct.org"]
    # `url` stays on our own canonical page: repointing it at the business's
    # site would make it ambiguous which page represents the entity.
    assert ld["url"] =~ "/p/#{place.slug}"
  end

  test "a place with no official_url emits no sameAs", %{conn: conn} do
    place = Places.upsert_place!(%{@attrs | slug: "no-site", official_url: nil, photos: []})
    html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

    refute Map.has_key?(place_ld(html, place), "sameAs")
  end

  test "sitemap includes place urls", %{conn: conn} do
    Places.upsert_place!(@attrs)
    xml = conn |> get(~p"/sitemap.xml") |> response(200)
    assert xml =~ "/p/palace-theater-waterbury</loc>"
  end

  describe "addressCountry comes from the place's country node" do
    # THESE THREE ARE THE REGRESSION GUARD FOR A WHOLE CLASS OF BUG, and they
    # are deliberately built the long way round.
    #
    # Every fixture above hands the emitter a town and a state written in this
    # file. Production hands it neither: it hands it a row the seed loader
    # wrote, whose geography came from the destination tree. Those two inputs
    # diverged silently. The tree shim sets a Roman place's `state` to "Lazio",
    # the region-keyed country lookup it replaced had no "Lazio" key, and the
    # country fell through to the "US" default — while the suite stayed green,
    # because its own helper handed the emitter the literal "Italy" instead. A
    # test that constructs its own input tests itself.
    #
    # So these seed real rows from the real committed seed files through
    # `DataGuide.upsert_places!/1` — the same function `Ethos.Release` calls —
    # read them back out of the database, and assert on what the controller
    # renders. No town, state, country or locality is written in this file.
    defp seed_places_from!(file) do
      paths =
        for p <- Ethos.Seeds.DataGuide.load!(file)["places"],
            uniq: true,
            do: p["destination_path"]

      Ethos.SeedDataHelpers.seed_destination_paths!(paths)
      Ethos.Seeds.DataGuide.upsert_places!(file)
    end

    defp seed_place!(destination, basename, slug) do
      file =
        Ethos.SeedDataHelpers.seed_files(destination)
        |> Enum.find(&(Path.basename(&1) == basename))

      assert file, "#{destination}/#{basename} is no longer in the corpus"

      seed_places_from!(file)
      Places.get_place_by_slug!(slug)
    end

    defp rendered_address(conn, place) do
      html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
      place_ld(html, place)["address"]
    end

    test "a Roman place emits IT, its rione and Lazio — not the US default", %{conn: conn} do
      place = seed_place!("rome", "pigna.json", "pantheon-pigna-rome")

      # The input production actually supplies, asserted before the assertion
      # that depends on it. If the corpus ever refiles the Pantheon, this line
      # fails and says so, rather than the country assertion passing for a
      # reason that has moved.
      node = Ethos.Repo.preload(place, :destination_node).destination_node

      assert node.path == "italy/lazio/rome/pigna",
             "the loader no longer files the Pantheon under Rome's rione, so the input this " <>
               "test was built to cover has changed: #{inspect(node.path)}"

      address = rendered_address(conn, place)

      refute address["addressCountry"] == "US",
             "the Pantheon published as American — this is the live defect"

      assert address["addressCountry"] == "IT"
      assert address["addressLocality"] == "Pigna"
      assert address["addressRegion"] == "Lazio"
    end

    test "a London place emits GB and England", %{conn: conn} do
      place = seed_place!("london", "southwark.json", "tate-modern")

      address = rendered_address(conn, place)

      assert address["addressCountry"] == "GB"
      assert address["addressLocality"] == "Bankside"
      assert address["addressRegion"] == "England"
    end

    test "a Vatican place emits VA, not Italy's IT", %{conn: conn} do
      # `vatican-city` is a ROOT country node, so St Peter's has no country
      # ancestor at all — the node it is filed under is itself the country. A
      # lookup that searched only the ancestors would raise here, and one that
      # walked up to Rome would publish IT for a sovereign state.
      place = seed_place!("rome", "vatican-city.json", "st-peters-basilica-vatican-city")

      address = rendered_address(conn, place)

      assert address["addressCountry"] == "VA"
      assert address["addressLocality"] == "Vatican City"

      # No region node above a root country, so no addressRegion rather than an
      # invented one.
      refute Map.has_key?(address, "addressRegion")
    end

    test "the breadcrumb and the visible nav follow the same node trail", %{conn: conn} do
      place = seed_place!("rome", "pigna.json", "pantheon-pigna-rome")

      html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)
      crumb = json_ld_of_type(html, "BreadcrumbList")

      assert Enum.map(crumb["itemListElement"], & &1["name"]) ==
               ["Ethos", "Destinations", "Italy", "Lazio", "Rome", "Pigna", place.name]

      assert Enum.map(crumb["itemListElement"], & &1["item"]) == [
               url(~p"/"),
               url(~p"/destinations"),
               url(~p"/destinations/italy"),
               url(~p"/destinations/italy/lazio"),
               url(~p"/destinations/italy/lazio/rome"),
               url(~p"/destinations/italy/lazio/rome/pigna"),
               url(~p"/p/#{place.slug}")
             ]

      # The visible nav links the same nodes at the same paths — not the
      # single-slug legacy forms, which 301.
      assert html =~ ~s(href="/destinations/italy/lazio/rome/pigna")
      refute html =~ ~s(href="/destinations/pigna")
    end
  end
end
