defmodule EthosWeb.FoliageControllerTest do
  use EthosWeb.ConnCase, async: true

  describe "GET /foliage" do
    test "renders the map and the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      assert html =~ "Connecticut Foliage Forecast"
      assert html =~ "Derived from the Connecticut DEEP fall foliage map"
      assert html =~ "Stage names are ours"
    end

    test "never describes itself as live or a tracker", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      refute html =~ ~r/\blive\b|real-time|tracker/i
    end

    test "lists all seven driving routes", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      for route <- Ethos.Foliage.routes() do
        # HEEx escapes route names, and one of the seven is
        # "New Haven & Neighborhood" — so compare against what the page
        # actually contains, rather than turning escaping off to match.
        escaped = route.name |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()

        assert html =~ escaped
        assert html =~ ~p"/foliage/#{route.slug}"
      end
    end

    test "renders every town", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      assert length(Regex.scan(~r/data-town="/, html)) == 169
    end
  end

  describe "week selection without JavaScript" do
    test "renders different map fills for different weeks", %{conn: conn} do
      green = Ethos.Foliage.stage_color(:green)
      early = conn |> get(~p"/foliage?week=1") |> html_response(200)
      late = build_conn() |> get(~p"/foliage?week=8") |> html_response(200)

      # Week 1 is green statewide in DEEP's data; week 8 is almost entirely
      # past peak. Counting fills proves the week parameter reached the
      # renderer — comparing whole pages only proves the selector highlighted
      # a different link.
      assert length(Regex.scan(~r/fill="#{green}"/, early)) == 169
      assert length(Regex.scan(~r/fill="#{green}"/, late)) == 0
    end

    test "the selector is plain links", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)

      for index <- 1..9 do
        assert html =~ ~s(href="/foliage?week=#{index}")
      end
    end

    test "clamps an out-of-range week", %{conn: conn} do
      assert conn |> get(~p"/foliage?week=99") |> html_response(200)
      assert conn |> get(~p"/foliage?week=nonsense") |> html_response(200)
    end

    test "week variants canonicalise to the bare URL", %{conn: conn} do
      html = conn |> get(~p"/foliage?week=5") |> html_response(200)
      assert html =~ ~s(<link rel="canonical" href="http://localhost:4002/foliage")
      refute html =~ ~s(rel="canonical" href="http://localhost:4002/foliage?week=5")
    end
  end
end
