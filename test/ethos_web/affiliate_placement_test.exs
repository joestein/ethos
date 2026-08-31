defmodule EthosWeb.AffiliatePlacementTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.{AccountsFixtures, GuidesFixtures}

  alias Ethos.{Guides, Places}

  @script_src "https://widget.getyourguide.com/dist/pa.umd.production.min.js"
  @widget ~s(data-gyg-widget="auto")
  @amber "Planning your own trip?"

  # CAREFUL: this is the substring the two disclosure lines SHARE — the guide
  # show page's old "Some booking links on this page…" and the unit's own
  # "Tours and activities shown above…". It cannot tell them apart. The tests
  # below that assert on it are non-vacuous only because they point at place
  # pages and county hubs, which never had the old line. On a guide show page
  # this constant proves only that *a* disclosure exists, which is why the
  # "exactly once" test counts occurrences rather than asserting presence.
  @disclosure "earn Ethos a commission at no extra cost to you"
  @unit_disclosure "Tours and activities shown above"
  @old_disclosure "Some booking links on this page"

  defp ny_guide(title, county) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, New York",
      "state" => "New York",
      "county" => county
    })
  end

  defp ct_guide(title) do
    published_guide_fixture(%{
      "title" => title,
      "destination" => "#{title}, Connecticut",
      "state" => "Connecticut",
      "county" => "Litchfield County"
    })
  end

  describe "guide pages" do
    test "a New York guide carries the script and the widget, and NOT the amber CTA", %{
      conn: conn
    } do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
      assert html =~ ~s(data-gyg-cmp="new-york")
      assert html =~ ~s(data-gyg-partner-id="ZA4AIMF")
      refute html =~ @amber
    end

    # The other direction. Either assertion alone passes trivially against a
    # template that always renders one or always renders the other.
    test "a Connecticut guide carries the amber CTA and NOT the script or widget", %{conn: conn} do
      g = ct_guide("Woodbury")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @amber
      refute html =~ @script_src
      refute html =~ @widget
    end

    test "an upstate New York guide is treated as non-New-York", %{conn: conn} do
      g = ny_guide("Rhinebeck", "Dutchess")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @amber
      refute html =~ @widget
    end
  end

  describe "place pages" do
    test "a New York place carries the widget", %{conn: conn} do
      Places.upsert_place!(%{
        slug: "teitel-brothers",
        name: "Teitel Brothers",
        kind: "shop",
        town: "Belmont",
        state: "New York",
        county: "Bronx",
        summary: "An Arthur Avenue grocery.",
        status: "open"
      })

      html = conn |> get(~p"/p/teitel-brothers") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
    end

    test "a Connecticut place carries neither", %{conn: conn} do
      Places.upsert_place!(%{
        slug: "palace-theater-waterbury",
        name: "Palace Theater",
        kind: "theater",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "A 1922 movie palace.",
        status: "open"
      })

      html = conn |> get(~p"/p/palace-theater-waterbury") |> html_response(200)

      refute html =~ @script_src
      refute html =~ @widget
    end
  end

  describe "destination hubs" do
    # Named for what it covers. The state hub does NOT exercise
    # `locale_for/2`'s nil-county branch: it routes through
    # `unanimous_locale/1` over guides that each carry a real county. No layout
    # path calls `locale_for/2` with a nil county at all — that branch is
    # covered by the resolver's own unit test, not from here.
    test "the New York state hub carries the widget", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york") |> html_response(200)

      assert html =~ @widget
    end

    test "a New York county hub carries the widget", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york/bronx") |> html_response(200)

      assert html =~ @widget
    end

    # The county hub splits its rows: `:guides` is tier "guide" and everything
    # else goes to `:town_pages`. A borough seeded entirely with town-pages
    # therefore hands the layout an EMPTY :guides list — and a page full of New
    # York content rendered no widget. Brooklyn shipped 32 town-pages and the
    # Queens roster is staged, so this is reachable, and silently.
    test "a county hub whose guides are all town-pages still carries the widget", %{conn: conn} do
      for title <- ["Astoria", "Flushing"] do
        title
        |> ny_guide("Queens")
        |> Ecto.Changeset.change(tier: "town-page")
        |> Ethos.Repo.update!()
      end

      html = conn |> get(~p"/destinations/new-york/queens") |> html_response(200)

      # Non-vacuity: the controller must really be handing the layout an empty
      # :guides list. If tier stops splitting the rows, this stops describing
      # the town-page-only case and the assertion below is ceremony.
      rows = Ethos.Guides.list_published_guides_for_county("new-york", "queens")
      assert rows != []

      assert Enum.all?(rows, &(&1.tier == "town-page")),
             "this hub is no longer town-pages only — the test's premise is gone"

      assert html =~ @widget
    end

    test "the Connecticut state hub carries neither", %{conn: conn} do
      ct_guide("Woodbury")

      html = conn |> get(~p"/destinations/connecticut") |> html_response(200)

      refute html =~ @script_src
      refute html =~ @widget
    end

    # A town hub serving guides from two states is half a New York page.
    test "a mixed-state town hub carries neither", %{conn: conn} do
      published_guide_fixture(%{
        "title" => "Madison",
        "destination" => "Madison, New York",
        "state" => "New York",
        "county" => "Brooklyn"
      })

      published_guide_fixture(%{
        "title" => "Madison",
        "destination" => "Madison, Connecticut",
        "state" => "Connecticut",
        "county" => "New Haven County"
      })

      html = conn |> get(~p"/destinations/madison") |> html_response(200)

      refute html =~ @widget
    end
  end

  describe "the unit appears once" do
    test "a New York guide page renders exactly one widget div", %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(@widget) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div, got #{count}"
    end

    # async and defer are what keep this tag from blocking render. A tag
    # missing them renders identically in a test and badly in a browser, so
    # they are asserted on the tag itself rather than on the page.
    test "the script tag carries async and defer so it never blocks render", %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      tag =
        Regex.run(~r{<script[^>]*#{Regex.escape(@script_src)}[^>]*>}, html)
        |> case do
          [tag] -> tag
          nil -> flunk("no script tag matched #{@script_src}")
        end

      assert tag =~ "async"
      assert tag =~ "defer"
    end
  end

  describe "the disclosure travels with the unit" do
    # A place page has never carried any affiliate disclosure — the site's
    # only prior disclosure line lived on guide show pages. This proves the
    # disclosure comes from affiliate_unit/1 itself, not from that old line.
    test "a New York place page carries the widget's own disclosure", %{conn: conn} do
      Places.upsert_place!(%{
        slug: "teitel-brothers",
        name: "Teitel Brothers",
        kind: "shop",
        town: "Belmont",
        state: "New York",
        county: "Bronx",
        summary: "An Arthur Avenue grocery.",
        status: "open"
      })

      html = conn |> get(~p"/p/teitel-brothers") |> html_response(200)

      assert html =~ @widget
      assert html =~ @disclosure
    end

    test "a New York county hub carries the widget's own disclosure", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york/bronx") |> html_response(200)

      assert html =~ @widget
      assert html =~ @disclosure
    end

    # A guide show page is the one page type carrying BOTH candidate lines, and
    # @disclosure — the substring they share — cannot tell them apart, so a
    # presence assertion here passes with one disclosure or with two. Count.
    test "a New York guide page renders the disclosure exactly once", %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(@disclosure) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one disclosure line, got #{count}"

      # And it is the unit's, not the show page's — which would now be false
      # anyway: the amber CTA is suppressed and this guide has no entry
      # booking_url, so there are no booking links on the page at all.
      assert html =~ @unit_disclosure
      refute html =~ @old_disclosure
    end

    # The other direction: a page with no unit keeps the line it always had.
    test "a Connecticut guide page keeps the show page's own disclosure", %{conn: conn} do
      g = ct_guide("Woodbury")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ @old_disclosure
      refute html =~ @unit_disclosure
    end

    # THE REGRESSION: a New York guide with a sponsored entry booking_url gets
    # the widget's disclosure (which scopes itself to the widget only — "Tours
    # and activities shown above") AND sponsored entry links the widget's line
    # says nothing about. Suppressing the page's own disclosure whenever the
    # unit renders, with no regard for whether the page ALSO has entry
    # booking_url links, leaves those sponsored links with no disclosure at
    # all. The page-level line must survive here even though the unit renders.
    test "a New York guide with a sponsored entry booking_url still renders the page-level disclosure",
         %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")

      {:ok, _} =
        Guides.create_entry(g, %{
          kind: "tour",
          name: "Bronx Zoo",
          booking_url: "https://example.com/book-bronx-zoo",
          booking_label: "Book it"
        })

      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ ~s(rel="sponsored nofollow noopener")
      assert html =~ @old_disclosure
    end

    # The double-disclosure case the previous wave fixed, still holding: a New
    # York guide with NO entry booking_url renders only the widget's own line.
    test "a New York guide with no entry booking_url renders only the widget's disclosure",
         %{conn: conn} do
      g = ny_guide("Belmont", "Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      refute html =~ @old_disclosure
      count = html |> String.split(@unit_disclosure) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget disclosure, got #{count}"
    end

    # A non-New-York guide with a sponsored booking_url: no unit ever renders
    # here, so the page-level disclosure must keep covering it, as it always
    # did.
    test "a non-New-York guide with a sponsored booking_url still renders the page-level disclosure",
         %{conn: conn} do
      g = ct_guide("Woodbury")

      {:ok, _} =
        Guides.create_entry(g, %{
          kind: "tour",
          name: "Woodbury Outlets",
          booking_url: "https://example.com/book-woodbury",
          booking_label: "Book it"
        })

      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ ~s(rel="sponsored nofollow noopener")
      assert html =~ @old_disclosure
    end
  end

  describe "authoring LiveViews never carry the widget, even for New York guides" do
    setup %{conn: conn} do
      user = user_fixture()
      %{conn: log_in_user(conn, user), user: user}
    end

    # The guide editor assigns :guide just like the public show page does,
    # and is reachable for an unpublished draft. An impression here is not
    # visitor intent and must never render, over either the disconnected
    # (plain GET) or the connected (LiveView socket) render.
    test "the guide editor renders neither tag, on both the static and connected render", %{
      conn: conn,
      user: user
    } do
      guide =
        guide_fixture(%{
          user: user,
          title: "Belmont",
          destination: "Belmont, New York",
          state: "New York",
          county: "Bronx"
        })

      static_html = conn |> get(~p"/guides/#{guide.id}/edit") |> html_response(200)
      refute static_html =~ @script_src
      refute static_html =~ @widget

      {:ok, _lv, connected_html} = live(conn, ~p"/guides/#{guide.id}/edit")
      refute connected_html =~ @script_src
      refute connected_html =~ @widget
    end

    # The author's dashboard assigns :guides — the same shape a destination
    # hub uses — but lists the author's own guides, drafts included, not what
    # a visitor is browsing.
    test "the author's guide dashboard renders neither tag", %{conn: conn, user: user} do
      guide_fixture(%{
        user: user,
        title: "Belmont",
        destination: "Belmont, New York",
        state: "New York",
        county: "Bronx"
      })

      html = conn |> get(~p"/guides") |> html_response(200)
      refute html =~ @script_src
      refute html =~ @widget
    end
  end

  describe "per-locale placement" do
    # These use a synthetic locale via config override rather than real data,
    # so the mechanism is tested before any destination adopts it. `on_exit`
    # restores the real registry — without it every later test in the run sees
    # the synthetic one.
    #
    # IMPORTANT: this synthetic locale must stay well-formed (a valid
    # :network, non-empty :partner_id/:cmp, and a :placement of :top or
    # :bottom when present). `affiliate_corpus_test.exs`'s "every configured
    # affiliate locale is well-formed" test is ALSO `async: true` and reads
    # this same `:ethos, :affiliate_locales` global while these tests are
    # running concurrently. A deliberately-malformed locale added here to
    # exercise a negative case would make that unrelated test intermittently
    # fail, depending on ExUnit's scheduling — a failure that would look like
    # it belongs to affiliate_corpus_test.exs, not to whatever change added
    # the malformed entry here. Test malformed-registry cases with
    # `async: false`, the way `AffiliateUnsupportedNetworkTest` below does.
    defp with_locale(slug, locale) do
      original = Application.get_env(:ethos, :affiliate_locales, %{})
      Application.put_env(:ethos, :affiliate_locales, Map.put(original, slug, locale))

      ExUnit.Callbacks.on_exit(fn ->
        Application.put_env(:ethos, :affiliate_locales, original)
      end)
    end

    defp guide_in(state, county) do
      published_guide_fixture(%{
        "title" => "Placement Probe",
        "destination" => "Placement Probe, #{state}",
        "state" => state,
        "county" => county
      })
    end

    # The load-bearing assertion for the whole feature. Both placements render
    # byte-identical markup, so asserting the widget is PRESENT passes the same
    # either way and proves nothing. Position relative to the page's <h1>
    # (guide_html/show.html.heex:5) is what distinguishes them.
    test "a :top locale renders the unit before the page title", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :top
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at < title_at,
             "expected the :top unit before the <h1>, got widget at #{widget_at}, h1 at #{title_at}"
    end

    test "a :bottom locale renders the unit after the page title", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :bottom
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at > title_at,
             "expected the :bottom unit after the <h1>, got widget at #{widget_at}, h1 at #{title_at}"
    end

    # Pins the default. This is what keeps New York unchanged without editing
    # its registry entry, and what makes an entry that forgets the field behave
    # like New York rather than like Rome.
    test "a locale omitting :placement renders at the bottom", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia"
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)

      assert widget_at > title_at, "a locale with no :placement did not default to the bottom"
    end

    # Two slots exist now. This is the assertion that catches both firing.
    test "a :top locale still renders exactly one widget div", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :top
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(~s(data-gyg-widget="auto")) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div, got #{count}"
    end
  end

  describe "the Rome locale" do
    setup do
      user = Ethos.AccountsFixtures.user_fixture()
      Ethos.Seeds.RomeGuide.upsert!(user.email)
      :ok
    end

    test "the Rome guide carries the rome campaign above its title", %{conn: conn} do
      html = conn |> get(~p"/g/three-days-in-rome-real-trip-guide") |> html_response(200)

      assert html =~ @script_src
      assert html =~ ~s(data-gyg-cmp="rome")
      assert html =~ ~s(data-gyg-partner-id="ZA4AIMF")

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)
      assert widget_at < title_at, "Rome's unit did not render above the page title"

      count = html |> String.split(~s(data-gyg-widget="auto")) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div on the Rome guide, got #{count}"
    end

    # Rome is the ONLY guide in the corpus carrying both an affiliate locale and
    # a sponsored per-entry booking link, so it is the only page where this
    # interaction is observable at all.
    test "Rome's amber CTA is gone but its booking link and disclosure survive", %{conn: conn} do
      html = conn |> get(~p"/g/three-days-in-rome-real-trip-guide") |> html_response(200)

      refute html =~ @amber
      assert html =~ ~s(rel="sponsored nofollow noopener")
      assert html =~ @old_disclosure
    end

    test "the Italy state hub serves and carries the widget", %{conn: conn} do
      html = conn |> get(~p"/destinations/italy") |> html_response(200)

      assert html =~ ~s(data-gyg-cmp="rome")
    end

    # New York must not have moved. Asserted on the same run as Rome so a
    # shared-campaign or shared-placement regression cannot hide.
    test "New York is unchanged on the same deploy", %{conn: conn} do
      g =
        published_guide_fixture(%{
          "title" => "Belmont",
          "destination" => "Belmont, New York",
          "state" => "New York",
          "county" => "Bronx"
        })

      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ ~s(data-gyg-cmp="new-york")
      refute html =~ ~s(data-gyg-cmp="rome")

      widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
      title_at = :binary.match(html, "<h1") |> elem(0)
      assert widget_at > title_at, "New York's unit moved above the title"
    end
  end
end

defmodule EthosWeb.AffiliateUnsupportedNetworkTest do
  @moduledoc """
  `async: false`, deliberately: this overrides `:ethos, :affiliate_locales`,
  which is global application state. ExUnit runs synchronous modules after
  every async module has finished, so the registry-shape guard in
  `affiliate_corpus_test.exs` never observes the deliberately-bogus entry.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  @script_src "https://widget.getyourguide.com/dist/pa.umd.production.min.js"
  @widget ~s(data-gyg-widget="auto")
  @amber "Planning your own trip?"
  @old_disclosure "Some booking links on this page"

  # The gap this closes: the guide show page suppressed its fallback on "a
  # locale resolved", while the components rendered on "the locale's network is
  # one we support". A locale whose :network is a typo — or a network added to
  # the registry before its component clause lands — satisfies the first and
  # not the second, so every page in that geography carried NO affiliate unit
  # of any kind: no widget, no amber CTA, and a green suite. Both sides now ask
  # the same question, `EthosWeb.Affiliate.renders?/1`.
  test "a locale on an unsupported network falls back cleanly instead of rendering nothing", %{
    conn: conn
  } do
    previous = Application.get_env(:ethos, :affiliate_locales, %{})

    Application.put_env(
      :ethos,
      :affiliate_locales,
      Map.put(previous, "connecticut", %{
        network: :network_with_no_component_clause,
        partner_id: "CT0000",
        cmp: "connecticut"
      })
    )

    on_exit(fn -> Application.put_env(:ethos, :affiliate_locales, previous) end)

    # Non-vacuity: the entry really resolves. This is the "resolves but renders
    # nothing" case, not merely an unconfigured state.
    assert Ethos.Affiliates.locale_for("connecticut", "Litchfield County")
    refute EthosWeb.Affiliate.renders?(Ethos.Affiliates.locale_for("connecticut", nil))

    g =
      published_guide_fixture(%{
        "title" => "Woodbury",
        "destination" => "Woodbury, Connecticut",
        "state" => "Connecticut",
        "county" => "Litchfield County"
      })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

    refute html =~ @widget
    refute html =~ @script_src

    assert html =~ @amber,
           "a locale that renders no unit must not suppress the fallback CTA — " <>
             "the page would otherwise carry no affiliate unit at all"

    assert html =~ @old_disclosure
  end
end

defmodule EthosWeb.AffiliateMalformedPlacementTest do
  @moduledoc """
  `async: false`, for the same reason as `AffiliateUnsupportedNetworkTest`: the
  entry this installs is deliberately malformed, and the registry-shape guard
  in `affiliate_corpus_test.exs` runs `async: true` against the same global
  registry. Synchronous modules run after every async one has finished, so that
  guard never observes this entry.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.GuidesFixtures

  @script_src "https://widget.getyourguide.com/dist/pa.umd.production.min.js"
  @widget ~s(data-gyg-widget="auto")
  @amber "Planning your own trip?"
  @unit_disclosure "Tours and activities shown above"

  # The failure this closes, along the placement axis rather than the network
  # axis: `unit_renders?/1` is placement-agnostic, so an unrecognised placement
  # still answered "yes, a unit renders" and suppressed the amber CTA and the
  # page-level disclosure, while `affiliate_head/1` (gated on renders?/1 alone)
  # still loaded the third-party script — and neither layout slot matched, so
  # nothing rendered. Script loaded, no widget, no fallback, green suite.
  #
  # `placement/1` now degrades an unknown value to the :bottom default, so the
  # page is New York's page. The loud failure lives in CI instead:
  # `affiliate_corpus_test.exs`'s registry-shape guard still rejects :above.
  test "an unrecognised :placement degrades to the bottom instead of rendering nothing", %{
    conn: conn
  } do
    previous = Application.get_env(:ethos, :affiliate_locales, %{})

    Application.put_env(
      :ethos,
      :affiliate_locales,
      Map.put(previous, "connecticut", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "connecticut",
        placement: :above
      })
    )

    on_exit(fn -> Application.put_env(:ethos, :affiliate_locales, previous) end)

    # The unit under the HTML: the resolver still returns the locale, and the
    # component reads a valid position off it.
    assert EthosWeb.Affiliate.placement(%{placement: :above}) == :bottom

    g =
      published_guide_fixture(%{
        "title" => "Woodbury",
        "destination" => "Woodbury, Connecticut",
        "state" => "Connecticut",
        "county" => "Litchfield County"
      })

    html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

    count = html |> String.split(@widget) |> length() |> Kernel.-(1)
    assert count == 1, "expected exactly one widget div, got #{count}"

    assert html =~ @script_src

    widget_at = :binary.match(html, "data-gyg-widget") |> elem(0)
    title_at = :binary.match(html, "<h1") |> elem(0)

    assert widget_at > title_at,
           "an unrecognised placement must fall back to :bottom, not render above the title"

    # And the suppression it drives is now honest: the unit really is on the
    # page, so the amber CTA staying away is correct rather than a silent hole.
    refute html =~ @amber
    assert html =~ @unit_disclosure
  end
end
