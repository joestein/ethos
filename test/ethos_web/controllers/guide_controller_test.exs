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

  test "a guide with a state and county renders the full breadcrumb hierarchy", %{conn: conn} do
    guide =
      published_guide_fixture(%{
        title: "A Day in Waterbury",
        destination: "Waterbury, Connecticut",
        state: "Connecticut",
        county: "New Haven County"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)

    assert nav =~ ~s(href="/destinations")
    assert nav =~ ~s(href="/destinations/connecticut")
    assert nav =~ ~s(href="/destinations/connecticut/new-haven-county")
    assert nav =~ "Destinations"
    assert nav =~ "Connecticut"
    assert nav =~ "New Haven County"

    # and the machine-readable version matches the visible one
    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Connecticut",
             "New Haven County",
             "A Day in Waterbury"
           ]

    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2, 3, 4, 5]

    assert Enum.map(ld["itemListElement"], & &1["item"]) == [
             url(~p"/"),
             url(~p"/destinations"),
             url(~p"/destinations/connecticut"),
             url(~p"/destinations/connecticut/new-haven-county"),
             url(~p"/g/#{guide.slug}")
           ]
  end

  test "a guide with no state or county falls back to its destination, with no nil-slug links", %{
    conn: conn
  } do
    guide = published_guide_fixture(%{title: "Roman Holiday", destination: "Rome, Italy"})

    assert guide.state == nil
    assert guide.county == nil

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # no empty or nil slug ever reaches an href
    refute html =~ "/destinations//"
    refute html =~ ~s(href="/destinations/")

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations")
    assert nav =~ ~s(href="/destinations/rome")
    assert nav =~ "Rome"
    refute nav =~ "New Haven"

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Rome",
             "Roman Holiday"
           ]

    assert Enum.map(ld["itemListElement"], & &1["position"]) == [1, 2, 3, 4]
  end

  test "an orientation page renders the same breadcrumb as a full guide", %{conn: conn} do
    user = user_fixture()

    guide =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user.email
      )

    assert guide.tier == "town-page"

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations")
    assert nav =~ ~s(href="/destinations/connecticut")
    assert nav =~ ~s(href="/destinations/connecticut/windham-county")
    assert nav =~ "Windham County"

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Connecticut",
             "Windham County",
             guide.title
           ]
  end

  test "a guide with a state but no county stops the breadcrumb at the state", %{conn: conn} do
    guide =
      published_guide_fixture(%{
        title: "Statewide Roundup",
        destination: "Connecticut",
        state: "Connecticut"
      })

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/connecticut")
    refute nav =~ ~s(href="/destinations/connecticut/)

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Connecticut",
             "Statewide Roundup"
           ]
  end

  # The two halves of the curated-destination rule. Each alone passes against a
  # component that always prefers one source: the first would pass if the
  # destination hub were ALWAYS the crumb, the second if the state hub always
  # were. Only together do they pin "curated record wins, otherwise geography".
  test "a guide whose destination has a curated record links to it, not to its state hub", %{
    conn: conn
  } do
    Ethos.Destinations.upsert_destination!(%{
      "path" => "rome",
      "name" => "Rome",
      "intro" => "Three full days covers the Vatican, ancient Rome and the historic centre."
    })

    guide =
      published_guide_fixture(%{
        title: "Three Days in Rome",
        destination: "Rome, Italy",
        state: "Italy"
      })

    # Non-vacuity: the guide really does have a state hub to lose to. Without
    # this the test would pass for a guide with no state, which is the case the
    # old fallback already handled.
    assert guide.state_slug == "italy"

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/rome")
    refute nav =~ ~s(href="/destinations/italy")
    assert nav =~ "Rome"
    refute nav =~ "Italy"

    # The JSON-LD is the half that search engines read, and it is generated
    # from the same trail/1 — so it must have moved too.
    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Rome",
             "Three Days in Rome"
           ]

    assert Enum.map(ld["itemListElement"], & &1["item"]) == [
             url(~p"/"),
             url(~p"/destinations"),
             url(~p"/destinations/rome"),
             url(~p"/g/#{guide.slug}")
           ]
  end

  test "a guide whose destination has no curated record still points at its state hub", %{
    conn: conn
  } do
    guide =
      published_guide_fixture(%{
        title: "A Day in Waterbury",
        destination: "Waterbury, Connecticut",
        state: "Connecticut",
        county: "New Haven County"
      })

    # Non-vacuity: no curated record exists at this destination slug, so the
    # fallback is what is under test rather than a lookup that happened to hit.
    refute Ethos.Destinations.get_by_path(guide.destination_slug)

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    nav = breadcrumb_nav(html)
    assert nav =~ ~s(href="/destinations/connecticut")
    assert nav =~ ~s(href="/destinations/connecticut/new-haven-county")
    refute nav =~ ~s(href="/destinations/waterbury")

    ld = breadcrumb_json_ld(html)

    assert Enum.map(ld["itemListElement"], & &1["name"]) == [
             "Ethos",
             "Destinations",
             "Connecticut",
             "New Haven County",
             "A Day in Waterbury"
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

  test "research action fetches and redirects back", %{conn: conn} do
    guide = published_guide_fixture()
    {:ok, entry} = Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})
    user = user_fixture()
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
    user = user_fixture()
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
