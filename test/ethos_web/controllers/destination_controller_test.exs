defmodule EthosWeb.DestinationControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures

  import EthosWeb.DestinationHTML, only: [node_path: 1]

  alias Ethos.Destinations
  alias Ethos.SeedDataHelpers

  # The whole roster. Used only where the test is about depth — a country, a
  # county and a five-deep neighborhood served by one route — because seeding
  # 724 rows per test is not free. Everything else names the two or three nodes
  # it actually needs.
  defp seed_tree, do: Ethos.Seeds.DestinationTree.upsert_all!()

  # A roster node plus its ancestors, and nothing else, so a hub's children
  # list is exactly what the test asked for.
  defp node!(path) do
    SeedDataHelpers.seed_destination_paths!([path])
    Destinations.get_by_path(path)
  end

  defp guide_at(node, attrs) do
    published_guide_fixture(
      Map.merge(
        %{title: "A Guide", destination: node.name, destination_id: node.id},
        attrs
      )
    )
  end

  describe "one route, every depth" do
    test "a country hub lists its regions", %{conn: conn} do
      seed_tree()
      conn = get(conn, ~p"/destinations/united-states")
      assert html_response(conn, 200) =~ "Connecticut"
    end

    test "a county hub lists its towns", %{conn: conn} do
      seed_tree()
      conn = get(conn, ~p"/destinations/united-states/connecticut/litchfield-county")
      assert html_response(conn, 200) =~ "Litchfield County"
    end

    test "a five-deep neighborhood hub renders", %{conn: conn} do
      seed_tree()

      conn =
        get(conn, ~p"/destinations/united-states/new-york/new-york-city/manhattan/alphabet-city")

      assert html_response(conn, 200) =~ "Alphabet City"
    end

    test "an unknown path is a 404", %{conn: conn} do
      seed_tree()
      conn = get(conn, ~p"/destinations/atlantis/deep/trench")
      assert html_response(conn, 404)
    end

    # The URL a state hub and a town hub used to fight over. Two nodes named
    # Washington now hold two different URLs, so neither can displace the
    # other and no hub has to advertise the guides it is hiding.
    test "two nodes of the same name are two hubs, not one", %{conn: conn} do
      state = node!("united-states/washington")
      town = node!("united-states/connecticut/litchfield-county/washington")

      refute state.id == town.id

      state_guide = guide_at(state, %{title: "Ballpark by the Sound"})
      town_guide = guide_at(town, %{title: "The Gunnery and Five Villages"})

      state_html = conn |> get(~p"/destinations/united-states/washington") |> html_response(200)
      assert state_html =~ "/g/#{state_guide.slug}"
      refute state_html =~ "/g/#{town_guide.slug}"

      town_html =
        conn
        |> get(~p"/destinations/united-states/connecticut/litchfield-county/washington")
        |> html_response(200)

      assert town_html =~ "/g/#{town_guide.slug}"
      refute town_html =~ "/g/#{state_guide.slug}"
    end
  end

  describe "the one glob route" do
    # `/destinations` and `/destinations/*path` cannot both own the bare path.
    # The index is declared first so it keeps it; without that ordering the glob
    # answers with an empty segment list and every visitor lands on a 404.
    test "/destinations still resolves to the index, not the glob", %{conn: conn} do
      node!("united-states/connecticut")

      html = conn |> get(~p"/destinations") |> html_response(200)

      assert html =~ "Real trip guides by destination."
      assert html =~ "By country"
      refute html =~ "No guides here yet."
    end

    # `~p"/destinations/#{"a/b"}"` percent-encodes the separator, which is how a
    # hub link comes out as `/destinations/united-states%2Fconnecticut` — a 404
    # that renders as a perfectly ordinary-looking link. `node_path/1` exists to
    # stop that, and this is what pins it.
    test "a hub link is real path segments, never a percent-encoded path", %{conn: conn} do
      node!("united-states/connecticut/litchfield-county")

      index = conn |> get(~p"/destinations") |> html_response(200)
      hub = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)

      refute index =~ "%2F"
      refute hub =~ "%2F"
      assert hub =~ ~s(href="/destinations/united-states/connecticut/litchfield-county")
    end

    test "the nav links every ancestor at its own path", %{conn: conn} do
      node!("united-states/connecticut/litchfield-county")

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/litchfield-county")
        |> html_response(200)

      assert html =~ ~s(href="/destinations")
      assert html =~ ~s(href="/destinations/united-states")
      assert html =~ ~s(href="/destinations/united-states/connecticut")
    end
  end

  describe "the index" do
    test "lists the tree's countries and not the towns beneath them", %{conn: conn} do
      seed_tree()

      html = conn |> get(~p"/destinations") |> html_response(200)

      assert html =~ "United States"
      assert html =~ ~s(href="/destinations/united-states")
      assert html =~ ~s(href="/destinations/italy")

      # The flat list of every town holding a guide is what the tree replaced.
      refute html =~ ~s(href="/destinations/italy/lazio/rome")
    end

    test "emits OpenGraph tags", %{conn: conn} do
      html = conn |> get(~p"/destinations") |> html_response(200)

      assert html =~ ~s(property="og:title")
      assert html =~ ~s(<meta property="og:title" content="Destinations")
    end
  end

  describe "a node hub's own content" do
    test "lists that node's published guides with breadcrumb ld and a description", %{conn: conn} do
      node = node!("italy/lazio/rome")
      g = guide_at(node, %{title: "Roman Holiday"})

      html = conn |> get(~p"/destinations/italy/lazio/rome") |> html_response(200)

      assert html =~ "Roman Holiday"
      assert html =~ "/g/#{g.slug}"
      assert html =~ ~s("@type":"BreadcrumbList")
      assert html =~ ~s(name="description")
    end

    test "does not list a draft guide", %{conn: conn} do
      node = node!("italy/lazio/rome")

      draft =
        Ethos.GuidesFixtures.guide_fixture(%{
          title: "Unfinished Roman Holiday",
          destination: node.name,
          destination_id: node.id
        })

      html = conn |> get(~p"/destinations/italy/lazio/rome") |> html_response(200)

      refute html =~ "Unfinished Roman Holiday"
      refute html =~ "/g/#{draft.slug}"
    end

    test "does not list a sibling node's guides", %{conn: conn} do
      windham = node!("united-states/connecticut/windham-county")
      litchfield = node!("united-states/connecticut/litchfield-county")

      guide_at(windham, %{title: "Windham Weekend"})
      guide_at(litchfield, %{title: "Litchfield Weekend"})

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/litchfield-county")
        |> html_response(200)

      assert html =~ "Litchfield Weekend"
      refute html =~ "Windham Weekend"
    end

    test "emits OpenGraph tags naming the node", %{conn: conn} do
      node!("united-states/connecticut")

      html = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)

      assert html =~ ~s(<meta property="og:title" content="Connecticut travel guides")
      assert html =~ ~s(property="og:url")
      assert html =~ ~s(property="og:description")
      refute html =~ ~s(property="og:image")
    end

    test "renders the node's intro", %{conn: conn} do
      node = node!("united-states/connecticut")

      Destinations.upsert_destination!(%{
        path: node.path,
        name: node.name,
        intro: "The land of steady habits.",
        photos: []
      })

      html = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)
      assert html =~ "The land of steady habits."
    end

    # A node has all three of children, guides and prose, or some of them, or
    # only its prose. A leaf with nothing filed under it yet is the last case,
    # and it must not ship a heading over an empty list.
    test "a leaf node with no children and no guides renders no empty lists", %{conn: conn} do
      node!("united-states/connecticut/windham-county/ashford")

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/windham-county/ashford")
        |> html_response(200)

      # Non-vacuity: this really is the hub.
      assert html =~ "Ashford"

      refute html =~ "In Ashford"
      refute html =~ "All Ashford guides"
      assert html =~ "No guides here yet."
    end

    test "a node with children lists them and links each at its full path", %{conn: conn} do
      node!("united-states/connecticut/litchfield-county/kent")

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/litchfield-county")
        |> html_response(200)

      assert html =~ "In Litchfield County"
      assert html =~ ~s(href="/destinations/united-states/connecticut/litchfield-county/kent")
    end
  end

  describe "a node's photos" do
    @photo %{
      "src" => "/photos/destinations/connecticut-windham-county/hero.jpg",
      "thumb" => "/photos/destinations/connecticut-windham-county/hero_thumb.jpg",
      "title" => "Windham County hills",
      "description" => "Rolling hills.",
      "author" => "Fixture Author",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:Fixture.jpg"
    }

    defp with_photos(path, photos) do
      node = node!(path)

      Destinations.upsert_destination!(%{
        path: node.path,
        name: node.name,
        intro: "Quiet hills in the state's northeast corner.",
        photos: photos
      })
    end

    test "a node with a photo supplies the og:image meta tag and its credit line", %{conn: conn} do
      with_photos("united-states/connecticut/windham-county", [@photo])

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/windham-county")
        |> html_response(200)

      assert html =~ ~s(property="og:image")

      assert html =~
               ~s(content="http://localhost:4002/photos/destinations/connecticut-windham-county/hero.jpg")

      assert html =~ "Fixture Author"
      assert html =~ "CC BY-SA 4.0"
      assert html =~ "https://commons.wikimedia.org/wiki/File:Fixture.jpg"
    end

    test "a node with two photos renders both, each with its own credit line", %{conn: conn} do
      first = %{
        @photo
        | "src" => "/photos/destinations/connecticut-windham-county/first.jpg",
          "thumb" => "/photos/destinations/connecticut-windham-county/first_thumb.jpg",
          "title" => "First photo",
          "author" => "First Author",
          "source_url" => "https://commons.wikimedia.org/wiki/File:First.jpg"
      }

      second = %{
        @photo
        | "src" => "/photos/destinations/connecticut-windham-county/second.jpg",
          "thumb" => "/photos/destinations/connecticut-windham-county/second_thumb.jpg",
          "title" => "Second photo",
          "author" => "Second Author",
          "license" => "CC BY 3.0",
          "source_url" => "https://commons.wikimedia.org/wiki/File:Second.jpg"
      }

      with_photos("united-states/connecticut/windham-county", [first, second])

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/windham-county")
        |> html_response(200)

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
  end

  describe "the CollectionPage every hub emits" do
    test "the index names itself and, having no node, carries no description", %{conn: conn} do
      ld =
        conn |> get(~p"/destinations") |> html_response(200) |> json_ld_of_type("CollectionPage")

      assert ld["@context"] == "https://schema.org"
      assert ld["name"] == "Destinations"
      assert ld["url"] == url(~p"/destinations")
      refute Map.has_key?(ld, "description")
    end

    test "a node hub emits one alongside its breadcrumb", %{conn: conn} do
      node!("italy/lazio/rome")

      html = conn |> get(~p"/destinations/italy/lazio/rome") |> html_response(200)

      assert Enum.sort(Enum.map(json_ld_blocks(html), & &1["@type"])) ==
               ["BreadcrumbList", "CollectionPage"]

      ld = json_ld_of_type(html, "CollectionPage")
      assert ld["name"] == "Rome travel guides"
      assert ld["url"] == url(~p"/destinations/italy/lazio/rome")
    end

    test "a node hub carries its intro, and the page shows that prose", %{conn: conn} do
      node = node!("united-states/connecticut")

      Destinations.upsert_destination!(%{
        path: node.path,
        name: node.name,
        intro: "The land of steady habits.",
        photos: []
      })

      html = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)
      ld = json_ld_of_type(html, "CollectionPage")

      assert ld["description"] == "The land of steady habits."
      # schema.org wants a description of what the page shows; this is on it
      assert html =~ "The land of steady habits."
    end

    # The index is the one hub with no node behind it, so it is the one hub with
    # no description to publish. An empty-string description would be a claim
    # the page makes and cannot support. Every node hub takes the other branch:
    # `intro` is required on a node, so a hub built from one always has prose.
    test "the index omits description while every node hub publishes its intro", %{conn: conn} do
      for path <- ["united-states/connecticut", "united-states/connecticut/windham-county"] do
        node = node!(path)

        ld =
          conn
          |> get(node_path(node.path))
          |> html_response(200)
          |> json_ld_of_type("CollectionPage")

        assert ld["description"] == node.intro
        assert ld["description"] not in [nil, ""]
      end

      ld =
        conn |> get(~p"/destinations") |> html_response(200) |> json_ld_of_type("CollectionPage")

      assert Map.keys(ld) |> Enum.sort() == ["@context", "@type", "name", "url"]
      refute Map.has_key?(ld, "description")
    end
  end

  describe "the Twitter card a hub advertises" do
    test "a hub with no photo asks for a summary card, not a large image", %{conn: conn} do
      node = node!("italy/lazio/rome")

      # Non-vacuity: a roster node ships without photos, and that is the case
      # under test — not a node whose photos this test forgot to clear.
      assert node.photos == []

      for path <- ["/destinations", "/destinations/italy/lazio/rome"] do
        html = conn |> get(path) |> html_response(200)

        assert html =~ ~s(<meta name="twitter:card" content="summary")
        refute html =~ "summary_large_image"
        refute html =~ ~s(property="og:image")
      end
    end

    test "a hub with a photo keeps the large-image card", %{conn: conn} do
      node = node!("italy/lazio/rome")

      Destinations.upsert_destination!(%{
        path: node.path,
        name: node.name,
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

      html = conn |> get(~p"/destinations/italy/lazio/rome") |> html_response(200)

      assert html =~ ~s(property="og:image")
      assert html =~ ~s(<meta name="twitter:card" content="summary_large_image")
    end
  end
end
