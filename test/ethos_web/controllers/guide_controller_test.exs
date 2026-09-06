defmodule EthosWeb.GuideControllerTest do
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  import Mox

  alias Ethos.Guides

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "shows a published guide with entries, credit lines, and OG meta", %{conn: conn} do
    guide = published_guide_fixture()
    contributor = user_fixture()

    {:ok, _} =
      Guides.create_entry(guide, %{
        kind: "food",
        name: "Ramiro",
        verdict: "loved",
        note: "go early"
      })

    {:ok, _} =
      Guides.create_entry(
        guide,
        %{
          kind: "sight",
          name: "LX Factory",
          source: "suggestion",
          credited_user_id: contributor.id
        },
        :privileged
      )

    conn = get(conn, ~p"/g/#{guide.slug}")
    html = html_response(conn, 200)

    assert html =~ guide.title
    assert html =~ "Ramiro"
    assert html =~ "go early"
    assert html =~ "added from a reader suggestion"
    assert html =~ ~s(property="og:title")
    assert [title_tag] = Regex.run(~r{<title[^>]*>(.*?)</title>}s, html, capture: :all_but_first)
    assert title_tag =~ guide.title
    assert Guides.get_guide!(guide.id).view_count == 1
  end

  test "lazily regenerates the OG image if og_image_path is set but the file is missing (ephemeral fs)",
       %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, guide} = Ethos.OGCard.generate(guide)

    path = Path.join([:code.priv_dir(:ethos), "uploads", "og", "#{guide.slug}.png"])
    assert File.exists?(path)

    # Simulate an ephemeral Fly machine losing the generated file while the
    # DB row still points at it.
    File.rm!(path)
    refute File.exists?(path)

    conn = get(conn, ~p"/g/#{guide.slug}")
    html_response(conn, 200)

    assert File.exists?(path)
    on_exit(fn -> File.rm(path) end)
  end

  test "an orientation page renders the leaner template", %{conn: conn} do
    user = user_fixture()

    Ethos.SeedDataHelpers.seed_fixture_destinations!()

    guide =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user.email
      )

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "What's here"
    assert html =~ "Orientation"
    refute html =~ "Explore tours"

    # The guide photo carries an attribution-required licence (CC BY 4.0); the
    # page must credit the photographer and link to the full credit on the
    # photos page rather than publishing the image bare.
    assert html =~ "JJBers"
    assert html =~ ~p"/g/#{guide.slug}/photos"
  end

  test "a guide filed on a node renders that node's full ancestry as its breadcrumb", %{
    conn: conn
  } do
    guide =
      published_guide_fixture(%{
        title: "A Day in Waterbury",
        destination: "Waterbury, Connecticut",
        destination_path: "united-states/connecticut/new-haven-county/waterbury"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)

    assert nav =~ ~s(href="/destinations")
    assert nav =~ ~s(href="/destinations/united-states/connecticut")
    assert nav =~ ~s(href="/destinations/united-states/connecticut/new-haven-county")
    assert nav =~ ~s(href="/destinations/united-states/connecticut/new-haven-county/waterbury")
    assert nav =~ "Destinations"
    assert nav =~ "Connecticut"
    assert nav =~ "New Haven County"

    # and the machine-readable version matches the visible one
    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "United States",
             "Connecticut",
             "New Haven County",
             "Waterbury",
             "A Day in Waterbury"
           ]

    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2, 3, 4, 5, 6, 7]

    assert Enum.map(ld["itemListElement"], & &1["item"]) == [
             url(~p"/"),
             url(~p"/destinations"),
             url(~p"/destinations/united-states"),
             url(~p"/destinations/united-states/connecticut"),
             url(~p"/destinations/united-states/connecticut/new-haven-county"),
             url(~p"/destinations/united-states/connecticut/new-haven-county/waterbury"),
             url(~p"/g/#{guide.slug}")
           ]
  end

  # A guide authored through the web UI names no node — it has only the
  # free-text destination a traveller typed — and the two tests below are the
  # two halves of what that guide's breadcrumb does now.
  #
  # It used to link the derived `destination_slug` at `/destinations/:slug`
  # unconditionally. That URL is only served when a node owns it as its path or
  # as a legacy path, so for anything else it was a 404 in the visible <nav> and
  # in the BreadcrumbList JSON-LD both. The rule now resolves the slug the way
  # `DestinationController` resolves a request, and emits nothing when it
  # resolves to nothing. See `EthosWeb.GuideBreadcrumb.legacy_trail/1`.
  test "a guide on no node whose destination names nothing gets no geography crumb", %{
    conn: conn
  } do
    guide = published_guide_fixture(%{title: "Alfama Weekend", destination: "Lisbon, Portugal"})

    refute guide.destination_id

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # no empty or nil slug ever reaches an href
    refute html =~ "/destinations//"
    refute html =~ ~s(href="/destinations/")

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations")

    # The crumb that used to 404. Nothing owns `lisbon`, as a path or as a
    # legacy path, so the trail stops at the Destinations index.
    refute nav =~ ~s(href="/destinations/lisbon")

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Alfama Weekend"
           ]

    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2, 3]
  end

  test "a guide on no node whose destination names a legacy path gets that node's trail", %{
    conn: conn
  } do
    # `rome` is a legacy path of `italy/lazio/rome`, which is exactly the case
    # the old fallback got wrong twice over: it linked the legacy form, which
    # 301s rather than resolving, and it published that redirect source as a
    # canonical `item` URL in the JSON-LD.
    Ethos.SeedDataHelpers.seed_destination_paths!(["italy/lazio/rome"])

    guide = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})
    refute guide.destination_id

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/italy/lazio/rome")
    assert nav =~ "Rome"
    refute nav =~ ~s(href="/destinations/rome")
    refute nav =~ "New Haven"

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Italy",
             "Lazio",
             "Rome",
             "Roman Holiday"
           ]

    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2, 3, 4, 5, 6]
  end

  test "an orientation page renders the same breadcrumb as a full guide", %{conn: conn} do
    user = user_fixture()

    Ethos.SeedDataHelpers.seed_fixture_destinations!()

    guide =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user.email
      )

    assert guide.tier == "town-page"

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # A seeded guide is filed on a node, so its trail is that node's ancestry —
    # four crumbs deep, where the state/county pair could only ever emit two.
    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations")
    assert nav =~ ~s(href="/destinations/united-states")
    assert nav =~ ~s(href="/destinations/united-states/connecticut")
    assert nav =~ ~s(href="/destinations/united-states/connecticut/windham-county")
    assert nav =~ ~s(href="/destinations/united-states/connecticut/windham-county/townville")
    assert nav =~ "Windham County"
    refute nav =~ "%2F"

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "United States",
             "Connecticut",
             "Windham County",
             "Townville",
             guide.title
           ]
  end

  test "a guide filed on a state stops the breadcrumb at the state", %{conn: conn} do
    # `connecticut` is the region node's legacy path, so this nodeless guide
    # resolves to the region and the trail ends there — no county is invented
    # below it, which is what the `county_slug` column used to supply.
    Ethos.SeedDataHelpers.seed_destination_paths!(["united-states/connecticut"])

    guide =
      published_guide_fixture(%{
        title: "Statewide Roundup",
        destination: "Connecticut"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/united-states/connecticut")
    refute nav =~ ~s(href="/destinations/united-states/connecticut/)
    # the bare legacy form, which 301s rather than resolving
    refute nav =~ ~s(href="/destinations/connecticut")

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "United States",
             "Connecticut",
             "Statewide Roundup"
           ]
  end

  # The two halves of the node rule. Each alone passes against a component that
  # always prefers one source: the first would pass if the node's ancestry were
  # ALWAYS the crumb, the second if the legacy pair always were. Only together
  # do they pin "the node's ancestry, and the legacy columns only when there is
  # no node".
  #
  # This pair replaced the curated-destination rule, which preferred a
  # `Destination` row whose path equalled the guide's `destination_slug`. That
  # rule's whole reason for existing was that a hub was a `GROUP BY` and a
  # curated record was a separate row beside it; the tree merged the two, and
  # the fifteen curated pages are overlays on nodes now. The rule was also the
  # last reader keeping those records keyed on bare paths, which is what left
  # `/destinations/connecticut` rendering a parentless row instead of 301ing.
  test "a guide filed on a node gets its node's ancestry, not the legacy state hub", %{
    conn: conn
  } do
    Ethos.SeedDataHelpers.seed_destination_paths!(["italy/lazio/rome"])
    node = Ethos.Destinations.get_by_path("italy/lazio/rome")

    guide =
      published_guide_fixture(%{
        title: "Three Days in Rome",
        destination: "Rome, Italy",
        destination_id: node.id
      })

    # Non-vacuity: the guide's own `destination` still slugifies to "rome", so
    # the single-slug fallback below has something to emit and the node ancestry
    # has something to beat. Without this the test would pass for a guide whose
    # fallback would have produced nothing either way.
    assert guide.destination_slug == "rome"

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/italy")
    assert nav =~ ~s(href="/destinations/italy/lazio")
    assert nav =~ ~s(href="/destinations/italy/lazio/rome")
    assert nav =~ "Rome"

    # The legacy single-slug hub the retired rule pointed at. It 301s now, and
    # a breadcrumb must name the canonical URL rather than a redirect source.
    refute nav =~ ~s(href="/destinations/rome")

    # A "/" inside a single `~p` interpolation percent-encodes, and
    # `/destinations/italy%2Flazio%2Frome` is a 404 that renders as an ordinary
    # link. Every crumb goes through `DestinationHTML.node_path/1` instead.
    refute html =~ "%2F"

    # The JSON-LD is the half that search engines read, and it is generated
    # from the same trail/1 — so it must have moved too.
    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Italy",
             "Lazio",
             "Rome",
             "Three Days in Rome"
           ]

    assert Enum.map(ld["itemListElement"], & &1["item"]) == [
             url(~p"/"),
             url(~p"/destinations"),
             url(~p"/destinations/italy"),
             url(~p"/destinations/italy/lazio"),
             url(~p"/destinations/italy/lazio/rome"),
             url(~p"/g/#{guide.slug}")
           ]
  end

  # THE GUARD ON A DELETION. A guide on no node used to get a state and a county
  # crumb built from the `state_slug`/`county_slug` columns — two crumbs the
  # guide's author never wrote and the tree never confirmed, pointing at
  # single-slug hub URLs that 301. The columns are gone, and so is any crumb
  # invented from them: a nodeless guide's trail is a real node's ancestry read
  # out of the tree, or it is nothing. Every URL below is a node's own path, so
  # a derived trail — or a link to the legacy single-slug form — fails here.
  test "a guide with no node takes its trail from the tree, never from a derived slug", %{
    conn: conn
  } do
    Ethos.SeedDataHelpers.seed_destination_paths!([
      "united-states/connecticut/new-haven-county/waterbury"
    ])

    guide =
      published_guide_fixture(%{
        title: "A Day in Waterbury",
        destination: "Waterbury, Connecticut"
      })

    # Non-vacuity: the guide is on no node, so what is under test is the
    # fallback rather than the ancestry walk a filed guide takes.
    refute guide.destination_id

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)

    # `waterbury` is the town node's legacy path, so the trail is that node's
    # ancestry, at canonical URLs.
    assert nav =~
             ~s(href="/destinations/united-states/connecticut/new-haven-county/waterbury")

    assert nav =~ "New Haven County"

    # None of the single-slug forms the deleted columns produced.
    refute nav =~ ~s(href="/destinations/waterbury")
    refute nav =~ ~s(href="/destinations/connecticut")
    refute nav =~ ~s(href="/destinations/new-haven-county")

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "United States",
             "Connecticut",
             "New Haven County",
             "Waterbury",
             "A Day in Waterbury"
           ]

    assert Enum.map(ld["itemListElement"], & &1["item"]) == [
             url(~p"/"),
             url(~p"/destinations"),
             url(~p"/destinations/united-states"),
             url(~p"/destinations/united-states/connecticut"),
             url(~p"/destinations/united-states/connecticut/new-haven-county"),
             url(~p"/destinations/united-states/connecticut/new-haven-county/waterbury"),
             url(~p"/g/#{guide.slug}")
           ]
  end

  # The site header also has a <nav>; the breadcrumb is the one inside <article>.
  defp breadcrumb_nav(html) do
    [nav] = Regex.run(~r{<article.*?(<nav.*?</nav>)}s, html, capture: :all_but_first)
    nav
  end

  test "404s for drafts", %{conn: conn} do
    guide = guide_fixture()

    assert_error_sent 404, fn -> get(conn, ~p"/g/#{guide.slug}") end
  end

  test "research action requires login", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

    conn = post(conn, ~p"/g/#{guide.slug}/entries/#{entry.id}/research")
    assert redirected_to(conn) == ~p"/users/log_in"
  end

  # The route itself is the real control here, not the hidden form: this is a
  # mutating endpoint that calls the Exa API and spends a per-user
  # rate-limit budget. A logged-in but non-admin user must be turned away by
  # the router's `:require_admin_user` plug, the same way the authoring
  # LiveViews are.
  test "research action 404s for a logged-in non-admin", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    user = user_fixture()

    conn =
      conn
      |> log_in_user(user)
      |> post(~p"/g/#{guide.slug}/entries/#{entry.id}/research")

    assert html_response(conn, 404)
  end

  test "research action fetches and redirects back", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    # The research POST route is admin-only authoring now.
    user = admin_fixture()
    Ethos.Research.RateLimiter.reset(user.id)

    expect(Ethos.ExaMock, :search, fn _q, _o ->
      {:ok, [%{title: "Update", url: "https://example.com", snippet: "still open, book ahead"}]}
    end)

    conn =
      conn
      |> log_in_user(user)
      |> post(~p"/g/#{guide.slug}/entries/#{entry.id}/research")

    assert redirected_to(conn) =~ "/g/#{guide.slug}"

    # rendered page now shows the cached research
    conn = get(build_conn(), ~p"/g/#{guide.slug}")
    assert html_response(conn, 200) =~ "still open, book ahead"
  end

  test "cache hits do not consume rate-limit slots", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    # The research POST route is admin-only authoring now.
    user = admin_fixture()
    Ethos.Research.RateLimiter.reset(user.id)

    # Exa is called exactly once — every later hit is served from the 7-day cache.
    expect(Ethos.ExaMock, :search, fn _q, _o ->
      {:ok, [%{title: "Update", url: "https://example.com", snippet: "still open, book ahead"}]}
    end)

    first =
      conn
      |> log_in_user(user)
      |> post(~p"/g/#{guide.slug}/entries/#{entry.id}/research")

    refute Phoenix.Flash.get(first.assigns.flash, :error)

    # The rate limit is 10/hour. If cache hits consumed a slot, the 11th of these
    # would trip "Research limit reached" — they must not, since the entry is cached.
    for _ <- 1..11 do
      resp =
        build_conn()
        |> log_in_user(user)
        |> post(~p"/g/#{guide.slug}/entries/#{entry.id}/research")

      refute Phoenix.Flash.get(resp.assigns.flash, :error)
    end
  end
end
