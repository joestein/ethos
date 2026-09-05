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
      g = ny_guide("Belmont", "The Bronx")
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
        county: "The Bronx",
        summary: "An Arthur Avenue grocery.",
        status: "open"
      })

      html = conn |> get(~p"/p/teitel-brothers") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
    end

    # THE POSITIVE END-TO-END CASE, and the one that was missing.
    #
    # Every other New York assertion in this file builds its row by hand — a
    # fixture with `"county" => "The Bronx"` written into it. A hand-written
    # county cannot disagree with the config, so those tests stayed green
    # through the whole period in which `:counties` listed "Bronx", the tree
    # derived "The Bronx", and every real Bronx page rendered no widget.
    #
    # This one writes nothing. It runs a committed Bronx seed file through the
    # ordinary loader, reads back a place the loader created, and asserts the
    # page it serves carries the unit. The county it checks is whatever
    # `Destinations.legacy_geo/1` derived from the roster — so config, roster
    # and loader must agree, which is the only combination that pays.
    test "a Bronx place seeded through the loader carries the widget", %{conn: conn} do
      file = "priv/seed_data/bronx/belmont.json"

      # Destinations before places: the loader resolves every destination_path
      # against this table, and writing them in this order keeps async tests
      # from taking the two tables' row locks in opposite orders.
      #
      # Only the nodes this one file names, read out of the file itself. The
      # whole roster here made six async files concurrent writers of the same
      # 724 rows, which is a deadlock or a cancelled statement roughly one run
      # in three.
      Ethos.SeedDataHelpers.seed_destinations_for_file!(file)
      Ethos.Seeds.DataGuide.upsert_places!(file)

      slug =
        file
        |> Ethos.Seeds.DataGuide.load!()
        |> Map.fetch!("places")
        |> hd()
        |> Map.fetch!("slug")

      place = Places.get_place_by_slug!(slug)

      # Non-vacuous: the premise is that the loader derives the borough name
      # from the roster rather than from anything written in this file. If the
      # corpus moves Belmont out of the Bronx, this stops being a Bronx test
      # and the assertions below would pass for the wrong reason.
      assert place.state == "New York"
      assert place.county == "The Bronx"

      assert Ethos.Affiliates.locale_for(place.state_slug, place.county),
             "a real Bronx place resolved to no affiliate locale — :affiliate_locales " <>
               "and the destination tree disagree about the borough's name"

      html = conn |> get(~p"/p/#{place.slug}") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
      assert html =~ ~s(data-gyg-cmp="new-york")
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
    # A hub is now one node in the destination tree, served at that node's own
    # path, and its guides are the ones filed against it. The geography a hub
    # resolves through is still the guides' — `unanimous_locale/1` over
    # assigns[:guides] — so these seed the node and file the guide on it.
    defp hub_node!(path) do
      Ethos.SeedDataHelpers.seed_destination_paths!([path])
      Ethos.Destinations.get_by_path(path)
    end

    defp guide_on(node, title, state, county) do
      published_guide_fixture(%{
        "title" => title,
        "destination" => "#{title}, #{state}",
        "state" => state,
        "county" => county,
        "destination_id" => node.id
      })
    end

    # Named for what it covers. The region hub does NOT exercise
    # `locale_for/2`'s nil-county branch: it routes through
    # `unanimous_locale/1` over guides that each carry a real county. No layout
    # path calls `locale_for/2` with a nil county at all — that branch is
    # covered by the resolver's own unit test, not from here.
    test "the New York region hub carries the widget", %{conn: conn} do
      "united-states/new-york" |> hub_node!() |> guide_on("Belmont", "New York", "The Bronx")

      html = conn |> get(~p"/destinations/united-states/new-york") |> html_response(200)

      assert html =~ @widget
    end

    test "a New York borough hub carries the widget", %{conn: conn} do
      "united-states/new-york/new-york-city/bronx"
      |> hub_node!()
      |> guide_on("Belmont", "New York", "The Bronx")

      html =
        conn
        |> get(~p"/destinations/united-states/new-york/new-york-city/bronx")
        |> html_response(200)

      assert html =~ @widget
    end

    # A borough hub whose every guide is an orientation page used to render no
    # widget: the old county hub split its rows by tier and handed the layout an
    # EMPTY :guides list. The node hub lists guides regardless of tier, which is
    # what closes that hole — asserted here so it cannot reopen.
    test "a borough hub whose guides are all town-pages still carries the widget", %{conn: conn} do
      node = hub_node!("united-states/new-york/new-york-city/queens")

      for title <- ["Astoria", "Flushing"] do
        node
        |> guide_on(title, "New York", "Queens")
        |> Ecto.Changeset.change(tier: "town-page")
        |> Ethos.Repo.update!()
      end

      html =
        conn
        |> get(~p"/destinations/united-states/new-york/new-york-city/queens")
        |> html_response(200)

      # Non-vacuity: the hub really is town-pages only. If tier stops being the
      # thing that used to split these rows, this stops describing the case.
      rows = Ethos.Guides.list_published_guides_for_node(node.id)
      assert rows != []

      assert Enum.all?(rows, &(&1.tier == "town-page")),
             "this hub is no longer town-pages only — the test's premise is gone"

      assert html =~ @widget
    end

    test "the Connecticut region hub carries neither", %{conn: conn} do
      "united-states/connecticut"
      |> hub_node!()
      |> guide_on("Woodbury", "Connecticut", "Litchfield County")

      html = conn |> get(~p"/destinations/united-states/connecticut") |> html_response(200)

      refute html =~ @script_src
      refute html =~ @widget
    end

    # The tree ended the URL collision that used to serve Madison, New York and
    # Madison, Connecticut from one hub, but not the rule the collision
    # exercised: a hub whose guides do not agree on a locale resolves to none.
    # Two guides of different geography filed on one node is that case.
    test "a hub whose guides disagree about geography carries neither", %{conn: conn} do
      node = hub_node!("united-states/connecticut/new-haven-county/madison")

      guide_on(node, "Madison", "New York", "Brooklyn")
      guide_on(node, "Madison", "Connecticut", "New Haven County")

      html =
        conn
        |> get(~p"/destinations/united-states/connecticut/new-haven-county/madison")
        |> html_response(200)

      refute html =~ @widget
    end
  end

  describe "the unit appears once" do
    test "a New York guide page renders exactly one widget div", %{conn: conn} do
      g = ny_guide("Belmont", "The Bronx")
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      count = html |> String.split(@widget) |> length() |> Kernel.-(1)
      assert count == 1, "expected exactly one widget div, got #{count}"
    end

    # async and defer are what keep this tag from blocking render. A tag
    # missing them renders identically in a test and badly in a browser, so
    # they are asserted on the tag itself rather than on the page.
    test "the script tag carries async and defer so it never blocks render", %{conn: conn} do
      g = ny_guide("Belmont", "The Bronx")
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
        county: "The Bronx",
        summary: "An Arthur Avenue grocery.",
        status: "open"
      })

      html = conn |> get(~p"/p/teitel-brothers") |> html_response(200)

      assert html =~ @widget
      assert html =~ @disclosure
    end

    test "a New York borough hub carries the widget's own disclosure", %{conn: conn} do
      "united-states/new-york/new-york-city/bronx"
      |> hub_node!()
      |> guide_on("Belmont", "New York", "The Bronx")

      html =
        conn
        |> get(~p"/destinations/united-states/new-york/new-york-city/bronx")
        |> html_response(200)

      assert html =~ @widget
      assert html =~ @disclosure
    end

    # A guide show page is the one page type carrying BOTH candidate lines, and
    # @disclosure — the substring they share — cannot tell them apart, so a
    # presence assertion here passes with one disclosure or with two. Count.
    test "a New York guide page renders the disclosure exactly once", %{conn: conn} do
      g = ny_guide("Belmont", "The Bronx")
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
      g = ny_guide("Belmont", "The Bronx")

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
      g = ny_guide("Belmont", "The Bronx")
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
          county: "The Bronx"
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
        county: "The Bronx"
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

    # The CLS reservation is worth its cost only at :top, where the widget's
    # arrival would otherwise shove the page's <h1> itself down the viewport.
    # At :bottom the unit is the last thing before the footer, so reserving
    # the same 400px buys nothing and, when GetYourGuide's host is blocked,
    # leaves a page-load's worth of blank space sitting above the footer.
    test "a :top locale's unit reserves the min-height", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :top
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      assert html =~ "min-h-[400px]"
    end

    # The other direction. Either alone passes trivially against a template
    # that always reserves the height or never does.
    test "a :bottom locale's unit does not reserve the min-height", %{conn: conn} do
      with_locale("testonia", %{
        network: :getyourguide,
        partner_id: "ZA4AIMF",
        cmp: "testonia",
        placement: :bottom
      })

      g = guide_in("Testonia", nil)
      html = conn |> get(~p"/g/#{g.slug}") |> html_response(200)

      refute html =~ "min-h-[400px]"
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

    # THE SECOND POSITIVE END-TO-END CASE, and the one the setup above hides.
    #
    # Every other assertion in this block runs `Ethos.Seeds.RomeGuide`, which
    # hand-rolls its own upsert and writes a bare `state: "Italy"` — so it
    # resolves through the "italy" locale key and always did. The thirty Rome
    # NEIGHBOURHOOD guides are JSON seeds hanging from `italy/lazio/rome/*`, and
    # a page's state is its node's nearest `region` ancestor, so they derive
    # "Lazio". When the destination tree landed they stopped resolving and went
    # blank — thirty live pages, no failing test, because the only Rome page
    # under test was the one that does not use the tree.
    #
    # This one seeds a neighbourhood guide the ordinary way and asserts what the
    # loader derived, so the registry and the tree have to agree about Lazio.
    test "a Rome neighbourhood guide seeded through the loader carries the widget", %{
      conn: conn
    } do
      file = "priv/seed_data/rome/ardeatino.json"

      # Destinations before guides — the loader resolves destination_path
      # against that table, and the order keeps async tests off each other's
      # row locks. Only this file's own nodes, not the whole roster.
      Ethos.SeedDataHelpers.seed_destinations_for_file!(file)

      email = Ethos.AccountsFixtures.user_fixture().email
      Ethos.Seeds.DataGuide.upsert_places!(file)
      guide = Ethos.Seeds.DataGuide.upsert_guide!(file, email)

      # Non-vacuous: the premise is that this guide derives the REGION, not the
      # country. If it ever derives "Italy" again it resolves through the other
      # key and stops covering the case this test exists for.
      assert guide.state == "Lazio"
      assert guide.state_slug == "lazio"

      assert Ethos.Affiliates.locale_for(guide.state_slug, guide.county),
             "a real Rome neighbourhood guide resolved to no affiliate locale — " <>
               ":affiliate_locales and the destination tree disagree about the region"

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ @script_src
      assert html =~ @widget
      assert html =~ ~s(data-gyg-cmp="rome")
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

    test "the Italy country hub serves and carries the widget", %{conn: conn} do
      # The Rome guide hand-rolls its own upsert and names no node, so file it
      # on the country hub the way a loader-seeded guide would be.
      Ethos.SeedDataHelpers.seed_destination_paths!(["italy"])
      italy = Ethos.Destinations.get_by_path("italy")

      Ethos.Guides.get_published_guide_by_slug!("three-days-in-rome-real-trip-guide")
      |> Ecto.Changeset.change(destination_id: italy.id)
      |> Ethos.Repo.update!()

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
          "county" => "The Bronx"
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
