defmodule EthosWeb.FoliageRouteTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.Foliage

  describe "GET /foliage/:route_slug" do
    test "renders each of the seven routes", %{conn: conn} do
      for route <- Foliage.routes() do
        html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)
        escaped = route.name |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()
        assert html =~ escaped
      end
    end

    test "lists every town on the route in order", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)

      for stop <- route.stops do
        town = Foliage.town(stop.town_slug)
        assert html =~ town.name
      end
    end

    test "links a guide for every town on the route", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)

      # An empty stop list would still render 200 with a map and a heading, and
      # `>=` against zero stops would pass trivially — exactly the orphan case
      # this test exists to guard. Assert each stop's own guide link is
      # present, AND that the count of /g/ links on the page matches the stop
      # count exactly, so neither a missing link nor a duplicate/stray one
      # slips through.
      for stop <- route.stops do
        assert html =~ ~s(href="/g/#{stop.guide_slug}")
      end

      assert length(Regex.scan(~r{href="/g/[a-z0-9-]+"}, html)) == length(route.stops)
    end

    test "shows each town's estimated peak window", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west") |> html_response(200)
      assert html =~ Foliage.peak_label(Foliage.town("avon"))
    end

    test "links back to the state's own page for the route", %{conn: conn} do
      route = Foliage.route("hartford-west")
      html = conn |> get(~p"/foliage/#{route.slug}") |> html_response(200)
      assert html =~ route.deep_url
    end

    test "carries the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west") |> html_response(200)
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
    end

    test "supports week selection without JavaScript", %{conn: conn} do
      early = conn |> get(~p"/foliage/hartford-west?week=1") |> html_response(200)
      late = conn |> get(~p"/foliage/hartford-west?week=8") |> html_response(200)
      refute early == late
    end

    test "canonicalises week variants to the route URL", %{conn: conn} do
      html = conn |> get(~p"/foliage/hartford-west?week=5") |> html_response(200)
      assert html =~ ~s(<link rel="canonical" href="http://localhost:4002/foliage/hartford-west")
    end

    test "404s an unknown route", %{conn: conn} do
      assert conn |> get(~p"/foliage/not-a-route") |> html_response(404)
    end
  end

  describe "the peak/most-advanced distinction (spec §5)" do
    # connecticut-heritage has both kinds of stop: north-stonington never
    # reaches DEEP's peak band, plainfield does. Picking one route with both
    # avoids relying on two separate page loads to prove the branch works.
    test "an unverified-peak town says most advanced, not estimated peak", %{conn: conn} do
      html = conn |> get(~p"/foliage/connecticut-heritage") |> html_response(200)

      town = Foliage.town("north-stonington")
      refute Foliage.peak_verified?(town)

      snippet = stop_snippet(html, town.name)
      assert snippet =~ "most advanced #{Foliage.peak_label(town)}"
      refute snippet =~ "estimated peak"
    end

    test "a verified-peak town says estimated peak, not most advanced", %{conn: conn} do
      html = conn |> get(~p"/foliage/connecticut-heritage") |> html_response(200)

      town = Foliage.town("plainfield")
      assert Foliage.peak_verified?(town)

      snippet = stop_snippet(html, town.name)
      assert snippet =~ "estimated peak #{Foliage.peak_label(town)}"
      refute snippet =~ "most advanced"
    end

    test "explains the most-advanced towns once, only on a route that has any", %{conn: conn} do
      explanation = "never reach full colour on the state's map"

      with_unverified = conn |> get(~p"/foliage/connecticut-heritage") |> html_response(200)
      assert with_unverified =~ explanation

      # hartford-west's eleven stops all reach DEEP's peak band (see
      # priv/foliage/towns.json), so the caveat has nothing to explain there.
      all_verified =
        Enum.all?(Foliage.route("hartford-west").stops, fn stop ->
          Foliage.peak_verified?(Foliage.town(stop.town_slug))
        end)

      assert all_verified

      without_unverified = conn |> get(~p"/foliage/hartford-west") |> html_response(200)
      refute without_unverified =~ explanation
    end
  end

  # Isolates the <li> for one town, so an assertion about its own wording
  # cannot accidentally match another stop's <li>, the nav bar's <li>s, or
  # the TouristTrip JSON-LD block (which also names every town). Scoped to
  # the "Towns along the route" <section> first, then split on the stop
  # <li>s themselves — a lazy `<li.*?TownName.*?</li>` regex over the whole
  # page instead matches from the very first <li> in the document (the nav
  # bar) all the way past however many stops it takes to reach the name.
  defp stop_snippet(html, town_name) do
    [_, section] =
      Regex.run(~r{<h2 class="font-semibold">Towns along the route</h2>(.*?)</section>}s, html)

    Enum.find(String.split(section, "<li"), &(&1 =~ town_name))
  end
end
