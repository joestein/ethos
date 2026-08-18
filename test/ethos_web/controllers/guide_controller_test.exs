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
