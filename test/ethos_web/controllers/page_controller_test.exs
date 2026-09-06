defmodule EthosWeb.PageControllerTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  test "GET / shows hero and CTA without any guides", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)
    assert html =~ "Places worth the trip"
    assert html =~ "Browse destinations"
  end

  test "does not invite a visitor to make a guide", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    refute html =~ "Make your guide"
    refute html =~ "Paste your notes"
    # The header CTA is already gated on admin?/1 (false for a logged-out
    # visitor), so once the hero button is gone this string should appear
    # nowhere on the page at all.
    refute html =~ ~s(href="/guides/new")
  end

  test "points visitors at the destinations instead", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    # Assert on the hero button's text, NOT on a bare `href="/destinations"`
    # — the site header renders that link on every page, so a bare href
    # assertion would pass even if the hero button pointed somewhere else
    # entirely (e.g. the logged-in-only `/badges`).
    assert html =~ "Browse destinations"

    # Pin the hero button's OWN anchor, distinct from the header's
    # Destinations link, by matching its href together with its distinctive
    # class. Attribute order and the `data-phx-link*` attributes come from
    # `<.link navigate={...}>` and are exactly what gets rendered.
    assert html =~
             ~s(href="/destinations" data-phx-link="redirect" data-phx-link-state="push" class="rounded-md bg-zinc-900)
  end

  # The home page renders with `layout: false`, so it does not inherit the app
  # layout's header. It had none at all, which meant a logged-out visitor
  # landing on the front door got no search box and no way into the
  # destinations — while every other page on the site gave them both.
  test "GET / carries the header's search and Destinations link while logged out", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    refute html =~ "Log out"
    assert html =~ ~s(action="/search")
    assert html =~ ~s(name="q")
    assert html =~ ~s(href="/destinations")
  end

  test "GET / does not offer signed-in navigation to a logged-out visitor", %{conn: conn} do
    html = conn |> get(~p"/") |> html_response(200)

    refute html =~ "Your guides"
    refute html =~ "Badges"
    refute html =~ "Admin"
  end

  test "GET / features a published guide when one exists", %{conn: conn} do
    guide = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(guide)

    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Featured Lisbon"
  end

  test "GET / lists latest guides besides the featured one, with destinations link", %{conn: conn} do
    featured = published_guide_fixture(%{title: "Featured Lisbon"})
    Guides.increment_view_count(featured)
    published_guide_fixture(%{title: "Waterbury Weekend", destination: "Waterbury, Connecticut"})

    html = conn |> get(~p"/") |> html_response(200)
    assert html =~ "Latest guides"
    assert html =~ "Waterbury Weekend"
    assert html =~ "Browse all destinations"
    # the featured guide is not duplicated in the latest list
    assert length(String.split(html, "Featured Lisbon")) == 2
  end

  describe "GET / metadata" do
    test "carries a title, description, canonical and OpenGraph tags", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      # The layout appends " · Ethos" on its own line, so the rendered title is
      # only a single string once whitespace is collapsed the way a browser
      # collapses it — a raw substring match here would pass on anything.
      # An unset page_title renders "Ethos · Ethos"; that is what this fixes.
      assert title(html) == "Travel guides from real trips · Ethos"
      refute title(html) == "Ethos · Ethos"

      assert html =~ ~s(<link rel="canonical" href="#{url(~p"/")}")

      assert [description] =
               Regex.run(~r{<meta name="description" content="([^"]+)"}, html,
                 capture: :all_but_first
               )

      assert description =~ "Connecticut"
      assert description =~ "Manhattan"
      assert description =~ "Brooklyn"
      assert description =~ "Rome"
      assert String.length(description) <= 160

      assert html =~ ~s(<meta property="og:title" content="Ethos — travel guides from real trips")
      assert html =~ ~s(<meta property="og:type" content="website")
      assert html =~ ~s(<meta property="og:url" content="#{url(~p"/")}")
      assert html =~ ~s(<meta property="og:description" content=")
      # no raster OG image exists yet, so the layout must not emit an empty one
      refute html =~ ~s(<meta property="og:image")
    end

    # The home page has no share image, so it must not ask a card renderer for
    # a layout built around one. Every page whose page_og carries no image is
    # in the same position; this is the one that has no image by construction.
    test "advertises a summary Twitter card, not a large image it does not have", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ ~s(<meta name="twitter:card" content="summary")
      refute html =~ "summary_large_image"
    end

    test "emits exactly the Organization and WebSite site-level nodes", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert Enum.map(json_ld_blocks(html), & &1["@type"]) == ["Organization", "WebSite"]
    end

    test "the Organization node names, locates and illustrates the publisher", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      org = json_ld_of_type(html, "Organization")

      assert org["@context"] == "https://schema.org"
      assert org["name"] == "Ethos"
      assert org["url"] == url(~p"/")
      # Deliberately *not* `== static_url(Endpoint, "/images/logo.svg")`: both
      # sides would call the same function, so the assertion held whatever that
      # function returned. `static_url/2` verifies nothing at compile time — it
      # concatenates two endpoint calls — and only `~p` verifies, and only
      # router routes, which a static asset has none of. So the logo is pinned
      # to a literal and then actually fetched. Delete or rename the file and
      # this fails, where before the suite stayed green while the home page and
      # every guide's Article.publisher.logo pointed at a 404.
      assert org["logo"] =~ ~r{^https?://}
      assert org["logo"] =~ "images/logo"
      assert conn |> get(URI.parse(org["logo"]).path) |> response(200)
    end

    test "the WebSite node carries a SearchAction the search route actually answers", %{
      conn: conn
    } do
      html = conn |> get(~p"/") |> html_response(200)

      site = json_ld_of_type(html, "WebSite")

      assert site["@context"] == "https://schema.org"
      assert site["name"] == "Ethos"
      assert site["url"] == url(~p"/")

      action = site["potentialAction"]
      assert action["@type"] == "SearchAction"
      assert action["query-input"] == "required name=search_term_string"

      target = action["target"]
      assert target["@type"] == "EntryPoint"
      assert target["urlTemplate"] == url(~p"/search") <> "?q={search_term_string}"
    end

    test "the SearchAction template resolves to a page the router serves", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      template =
        json_ld_of_type(html, "WebSite")["potentialAction"]["target"]["urlTemplate"]

      # substitute a real term the way a search engine would, then fetch it
      %URI{path: path, query: query} =
        URI.parse(String.replace(template, "{search_term_string}", "lisbon"))

      published_guide_fixture(%{title: "Lisbon In Three Days"})

      body = conn |> get(path <> "?" <> query) |> html_response(200)
      assert body =~ "Lisbon In Three Days"
    end
  end

  describe "travel guides and collections" do
    test "lists the five deepest hubs with their counts", %{conn: conn} do
      published_guide_fixture(%{
        title: "Woodbury Wander",
        destination: "Woodbury, Connecticut",
        state: "Connecticut",
        county: "Litchfield"
      })

      published_guide_fixture(%{
        title: "Roman Holiday",
        destination: "Rome, Italy",
        state: "Italy",
        county: "Lazio"
      })

      # Connecticut and Italy both have explicit @hub_nouns entries, so without
      # a third state the "guides" fallback never executes even though it
      # fires on real data. Tennessee has no entry.
      published_guide_fixture(%{
        title: "Music City Weekend",
        destination: "Nashville, Tennessee",
        state: "Tennessee",
        county: "Davidson"
      })

      html = conn |> get(~p"/") |> html_response(200)
      hubs = Ethos.Guides.list_states() |> Enum.take(5)

      assert length(hubs) > 1
      assert html =~ "Travel Guides"

      for hub <- hubs do
        assert html =~ hub.state
        assert html =~ ~s(href="/destinations/#{hub.slug}")

        # The count alone is ambient on the page — Tailwind classes, the
        # AdSense id, the port all contain small integers, so matching a bare
        # "2" passes even when the count is not rendered at all. The phrase
        # is what the reader sees and what the noun map is for.
        assert html =~ "#{hub.count} #{EthosWeb.PageHTML.hub_noun(hub.slug)}"
      end
    end

    test "links to all destinations with a count that matches the hub list", %{conn: conn} do
      published_guide_fixture(%{
        title: "Woodbury Wander",
        destination: "Woodbury, Connecticut",
        state: "Connecticut",
        county: "Litchfield"
      })

      html = conn |> get(~p"/") |> html_response(200)

      # /destinations lists states PLUS Guides.list_destinations_without_state/0
      # (destination_controller.ex) — the ballpark-only destinations with no
      # state. The count must match that page's total, not just the state hubs,
      # or the homepage undercounts the page it links to.
      total =
        length(Ethos.Guides.list_states()) +
          length(Ethos.Guides.list_destinations_without_state())

      # The count is computed, not a literal, so it cannot drift from the
      # page it points at.
      assert html =~ "All #{total} destinations"
      assert html =~ ~s(href="/destinations")
    end

    test "lists every published collection", %{conn: conn} do
      guide = published_guide_fixture(%{title: "Woodbury Wander"})

      Ethos.Collections.upsert_collection!(%{
        slug: "burys-home-test",
        title: "Burys Home Test",
        published: true,
        items: [%{guide_slug: guide.slug, blurb: "The antiques one."}]
      })

      html = conn |> get(~p"/") |> html_response(200)
      collections = Ethos.Collections.list_published()

      assert collections != []
      assert html =~ "Collections"

      for c <- collections do
        escaped = c.title |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()
        assert html =~ escaped
        assert html =~ ~s(href="/c/#{c.slug}")
      end
    end

    test "keeps the featured guide and the foliage line", %{conn: conn} do
      featured = published_guide_fixture(%{title: "Featured Trip"})
      Guides.increment_view_count(featured)
      published_guide_fixture(%{title: "Another Trip"})

      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ "Featured Trip"
      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "Latest guides"
    end
  end

  describe "foliage driving routes" do
    test "lists all seven routes with their links", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      routes = Ethos.Foliage.routes()

      assert length(routes) == 7
      assert html =~ "Foliage driving routes"

      for route <- routes do
        # One route is "New Haven & Neighborhood"; HEEx escapes the ampersand,
        # so compare against what the page actually contains.
        escaped = route.name |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()

        assert html =~ escaped
        assert html =~ ~s(href="/foliage/#{route.slug}")
      end
    end

    test "shows each route's town count", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)
      route = Ethos.Foliage.route("hartford-west")

      assert html =~ "#{length(route.stops)} towns"
    end

    test "keeps the Collections section above it", %{conn: conn} do
      # Collections are seeded in production via `Ethos.Release.seed_collections/0`,
      # which does not run against the test database, so the Collections section
      # is otherwise empty (and thus absent — it is `:if`-guarded) here. A
      # published collection is created directly so both headings actually
      # render and the ordering assertion below is meaningful.
      guide = published_guide_fixture(%{title: "Woodbury Wander"})

      Ethos.Collections.upsert_collection!(%{
        slug: "burys-ordering-test",
        title: "Burys Ordering Test",
        published: true,
        items: [%{guide_slug: guide.slug, blurb: "The antiques one."}]
      })

      html = conn |> get(~p"/") |> html_response(200)

      # Match the headings themselves, not the bare words — "Collections"
      # could appear earlier in a meta tag or a link label, and `:binary.match`
      # returns the first hit wherever it is.
      collections_heading =
        ~s(<h2 class="text-sm uppercase tracking-wide text-zinc-400">Collections</h2>)

      routes_heading =
        ~s(<h2 class="text-sm uppercase tracking-wide text-zinc-400">Foliage driving routes</h2>)

      assert [{collections_at, _}] = :binary.matches(html, collections_heading)
      assert [{routes_at, _}] = :binary.matches(html, routes_heading)
      assert collections_at < routes_at
    end
  end

  # The rendered <title>, whitespace-collapsed the way a browser collapses it.
  defp title(html) do
    [inner] = Regex.run(~r{<title[^>]*>(.*?)</title>}s, html, capture: :all_but_first)

    inner |> String.split() |> Enum.join(" ")
  end
end
