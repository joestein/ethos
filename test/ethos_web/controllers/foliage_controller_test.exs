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
        assert html =~ route.name
        assert html =~ ~p"/foliage/#{route.slug}"
      end
    end

    test "renders every town", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      assert length(Regex.scan(~r/data-town="/, html)) == 169
    end
  end

  describe "week selection without JavaScript" do
    test "renders different fills for different weeks", %{conn: conn} do
      early = conn |> get(~p"/foliage?week=1") |> html_response(200)
      late = conn |> get(~p"/foliage?week=8") |> html_response(200)

      refute early == late
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
