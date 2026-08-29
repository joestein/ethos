defmodule EthosWeb.DestinationControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Destinations

  test "index lists destinations with published guides", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    guide_fixture(%{destination: "Oslo, Norway"})

    html = conn |> get(~p"/destinations") |> html_response(200)
    assert html =~ "Rome"
    refute html =~ "Oslo"
  end

  test "show lists that destination's published guides with breadcrumb ld", %{conn: conn} do
    g = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "Roman Holiday"
    assert html =~ "/g/#{g.slug}"
    assert html =~ ~s("@type":"BreadcrumbList")
    assert html =~ ~s(name="description")
  end

  test "a county hub lists full guides above orientation pages", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)

    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)

    assert html =~ "Orientation pages"
    assert html =~ "Townville"
  end

  test "destination pages emit OpenGraph tags", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    index = conn |> get(~p"/destinations") |> html_response(200)
    assert index =~ ~s(property="og:title")
    assert index =~ ~s(<meta property="og:title" content="Destinations")

    town = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert town =~ ~s(<meta property="og:title" content="Rome travel guides")
    assert town =~ ~s(property="og:url")
    assert town =~ ~s(property="og:description")
    refute town =~ ~s(property="og:image")
  end

  test "state and county destination pages emit OpenGraph tags", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    state = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    assert state =~ ~s(<meta property="og:title" content="Connecticut travel guides")

    county = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)
    assert county =~ ~s(property="og:title")
    assert county =~ "Windham County"
  end

  test "404 for unknown destination", %{conn: conn} do
    assert conn |> get(~p"/destinations/nowhere") |> response(404)
  end

  test "a state page with a destination record renders its intro", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    Destinations.upsert_destination!(%{
      path: "connecticut",
      name: "Connecticut",
      intro: "The land of steady habits.",
      photos: []
    })

    html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    assert html =~ "The land of steady habits."
  end

  test "a state page without a record renders successfully and shows no intro block", %{
    conn: conn
  } do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
    refute html =~ "<section"
  end

  test "a county page with a record renders its intro", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    Destinations.upsert_destination!(%{
      path: "connecticut/windham-county",
      name: "Windham County",
      intro: "Quiet hills in the northeast corner of the state.",
      photos: []
    })

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)
    assert html =~ "Quiet hills in the northeast corner of the state."
  end

  test "a record with a photo supplies the og:image meta tag", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    Destinations.upsert_destination!(%{
      path: "connecticut/windham-county",
      name: "Windham County",
      intro: "Quiet hills in the state's northeast corner.",
      photos: [
        %{
          "src" => "/photos/destinations/connecticut-windham-county/hero.jpg",
          "thumb" => "/photos/destinations/connecticut-windham-county/hero_thumb.jpg",
          "title" => "Windham County hills",
          "description" => "Rolling hills.",
          "author" => "Fixture Author",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Fixture.jpg"
        }
      ]
    })

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)

    assert html =~ ~s(property="og:image")

    assert html =~
             ~s(content="http://localhost:4002/photos/destinations/connecticut-windham-county/hero.jpg")

    assert html =~ "Fixture Author"
    assert html =~ "CC BY-SA 4.0"
    assert html =~ "https://commons.wikimedia.org/wiki/File:Fixture.jpg"
  end

  test "a record with two photos renders both, each with its own credit line", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    Destinations.upsert_destination!(%{
      path: "connecticut/windham-county",
      name: "Windham County",
      intro: "Quiet hills in the state's northeast corner.",
      photos: [
        %{
          "src" => "/photos/destinations/connecticut-windham-county/first.jpg",
          "thumb" => "/photos/destinations/connecticut-windham-county/first_thumb.jpg",
          "title" => "First photo",
          "description" => "The first one.",
          "author" => "First Author",
          "license" => "CC BY-SA 4.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:First.jpg"
        },
        %{
          "src" => "/photos/destinations/connecticut-windham-county/second.jpg",
          "thumb" => "/photos/destinations/connecticut-windham-county/second_thumb.jpg",
          "title" => "Second photo",
          "description" => "The second one.",
          "author" => "Second Author",
          "license" => "CC BY 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Second.jpg"
        }
      ]
    })

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)

    # Both images reach the page, in the order the record lists them.
    assert html =~ ~s(src="/photos/destinations/connecticut-windham-county/first.jpg")
    assert html =~ ~s(src="/photos/destinations/connecticut-windham-county/second.jpg")

    assert :binary.match(html, "first.jpg") < :binary.match(html, "second.jpg")

    # Each photo carries its own credit — the second is the one that used to
    # ship with its Commons attribution appearing nowhere a visitor could see.
    assert html =~ "First Author"
    assert html =~ "Second Author"
    assert html =~ "CC BY 3.0"
    assert html =~ "https://commons.wikimedia.org/wiki/File:First.jpg"
    assert html =~ "https://commons.wikimedia.org/wiki/File:Second.jpg"

    # A social card still takes exactly one image: the first.
    assert html =~
             ~s(content="http://localhost:4002/photos/destinations/connecticut-windham-county/first.jpg")

    refute html =~
             ~s(property="og:image" content="http://localhost:4002/photos/destinations/connecticut-windham-county/second.jpg")
  end

  describe "the CollectionPage every hub emits" do
    # Every hub below needs guides, or the hub does not resolve at all: a state
    # or county page is assembled from the guides filed under it, and a town
    # page 404s without one.
    defp seed_connecticut do
      user = user_fixture()
      fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)
      Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)
      :ok
    end

    test "the index names itself and, having no record, carries no description", %{conn: conn} do
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      ld =
        conn |> get(~p"/destinations") |> html_response(200) |> json_ld_of_type("CollectionPage")

      assert ld["@context"] == "https://schema.org"
      assert ld["name"] == "Destinations"
      assert ld["url"] == url(~p"/destinations")
      refute Map.has_key?(ld, "description")
    end

    test "a town hub emits one alongside its breadcrumb", %{conn: conn} do
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      html = conn |> get(~p"/destinations/rome") |> html_response(200)

      assert Enum.sort(Enum.map(json_ld_blocks(html), & &1["@type"])) ==
               ["BreadcrumbList", "CollectionPage"]

      ld = json_ld_of_type(html, "CollectionPage")
      assert ld["name"] == "Rome travel guides"
      assert ld["url"] == url(~p"/destinations/rome")
    end

    test "a state hub carries the record's intro, and the page shows that prose", %{conn: conn} do
      seed_connecticut()

      Destinations.upsert_destination!(%{
        path: "connecticut",
        name: "Connecticut",
        intro: "The land of steady habits.",
        photos: []
      })

      html = conn |> get(~p"/destinations/connecticut") |> html_response(200)
      ld = json_ld_of_type(html, "CollectionPage")

      assert ld["description"] == "The land of steady habits."
      # schema.org wants a description of what the page shows; this is on it
      assert html =~ "The land of steady habits."
    end

    test "a county hub carries the record's intro", %{conn: conn} do
      seed_connecticut()

      Destinations.upsert_destination!(%{
        path: "connecticut/windham-county",
        name: "Windham County",
        intro: "Quiet hills in the northeast corner of the state.",
        photos: []
      })

      html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)
      ld = json_ld_of_type(html, "CollectionPage")

      assert ld["description"] == "Quiet hills in the northeast corner of the state."
      assert html =~ "Quiet hills in the northeast corner of the state."
    end

    test "a town hub carries its record's intro too", %{conn: conn} do
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      Destinations.upsert_destination!(%{
        path: "rome",
        name: "Rome",
        intro: "The Eternal City rewards slow mornings and long walks.",
        photos: []
      })

      html = conn |> get(~p"/destinations/rome") |> html_response(200)
      ld = json_ld_of_type(html, "CollectionPage")

      assert ld["description"] == "The Eternal City rewards slow mornings and long walks."
      assert html =~ "The Eternal City rewards slow mornings and long walks."
    end

    # The whole destination feature is additive: a page with no record must ship
    # exactly the keys it shipped before one existed. An empty-string
    # description would be a claim the page makes and cannot support.
    test "hubs with no record omit description rather than emitting an empty one", %{conn: conn} do
      seed_connecticut()
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      for path <- [
            "/destinations/connecticut",
            "/destinations/connecticut/windham-county",
            "/destinations/rome",
            "/destinations"
          ] do
        ld = conn |> get(path) |> html_response(200) |> json_ld_of_type("CollectionPage")

        assert Map.keys(ld) |> Enum.sort() == ["@context", "@type", "name", "url"]
        refute Map.has_key?(ld, "description")
      end
    end
  end

  describe "the Twitter card a hub advertises" do
    test "a hub with no photo asks for a summary card, not a large image", %{conn: conn} do
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      for path <- ["/destinations", "/destinations/rome"] do
        html = conn |> get(path) |> html_response(200)

        assert html =~ ~s(<meta name="twitter:card" content="summary")
        refute html =~ "summary_large_image"
        refute html =~ ~s(property="og:image")
      end
    end

    test "a hub with a photo keeps the large-image card", %{conn: conn} do
      published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

      Destinations.upsert_destination!(%{
        path: "rome",
        name: "Rome",
        intro: "The Eternal City.",
        photos: [
          %{
            "src" => "/photos/destinations/rome/hero.jpg",
            "thumb" => "/photos/destinations/rome/hero_thumb.jpg",
            "title" => "Rome",
            "description" => "A hero shot.",
            "author" => "Fixture Author",
            "license" => "CC BY-SA 4.0",
            "source_url" => "https://commons.wikimedia.org/wiki/File:Fixture.jpg"
          }
        ]
      })

      html = conn |> get(~p"/destinations/rome") |> html_response(200)

      assert html =~ ~s(property="og:image")
      assert html =~ ~s(<meta name="twitter:card" content="summary_large_image")
    end
  end

  test "a town page with a destination record renders its intro", %{conn: conn} do
    published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    Destinations.upsert_destination!(%{
      path: "rome",
      name: "Rome",
      intro: "The Eternal City rewards slow mornings and long walks.",
      photos: []
    })

    html = conn |> get(~p"/destinations/rome") |> html_response(200)
    assert html =~ "The Eternal City rewards slow mornings and long walks."
  end
end
