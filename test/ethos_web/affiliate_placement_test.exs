defmodule EthosWeb.AffiliatePlacementTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.{AccountsFixtures, GuidesFixtures}

  alias Ethos.Places

  @script_src "https://widget.getyourguide.com/dist/pa.umd.production.min.js"
  @widget ~s(data-gyg-widget="auto")
  @amber "Planning your own trip?"
  @disclosure "earn Ethos a commission at no extra cost to you"

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
    test "the New York state hub carries the widget — the nil-county case", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york") |> html_response(200)

      assert html =~ @widget
    end

    test "a New York county hub carries the widget", %{conn: conn} do
      ny_guide("Belmont", "Bronx")

      html = conn |> get(~p"/destinations/new-york/bronx") |> html_response(200)

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
end
