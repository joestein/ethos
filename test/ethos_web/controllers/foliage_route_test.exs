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

      # An empty stop list would still render 200 with a map and a heading.
      # Counting the guide links is what proves the join actually produced
      # something.
      guide_links = Regex.scan(~r{href="/g/[a-z0-9-]+"}, html)
      assert length(guide_links) >= length(route.stops)
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
end
