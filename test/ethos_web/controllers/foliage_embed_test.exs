defmodule EthosWeb.FoliageEmbedTest do
  use EthosWeb.ConnCase, async: true

  describe "GET /foliage/embed" do
    test "renders a self-contained map", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)

      assert length(Regex.scan(~r/data-town="/, html)) == 169
      refute html =~ "<script"
    end

    test "links back to the forecast", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)

      # The whole point of the embed is this link, and it must be followable.
      assert html =~ "http://localhost:4002/foliage"
      refute html =~ ~s(rel="nofollow")
    end

    test "carries the attribution", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)
      assert html =~ "Connecticut DEEP"
    end

    test "is not indexable on its own", %{conn: conn} do
      html = conn |> get(~p"/foliage/embed") |> html_response(200)
      assert html =~ ~s(name="robots")
      assert html =~ "noindex"
    end

    test "allows framing", %{conn: conn} do
      conn = get(conn, ~p"/foliage/embed")

      # `put_secure_browser_headers` sets SAMEORIGIN, which would block the one
      # thing an embed must permit. Assert the header is gone, not merely that
      # it is not one particular value.
      assert get_resp_header(conn, "x-frame-options") == []
      assert get_resp_header(conn, "content-security-policy") == ["frame-ancestors *"]
    end

    test "the copy-paste snippet is on the main page", %{conn: conn} do
      html = conn |> get(~p"/foliage") |> html_response(200)
      assert html =~ "&lt;iframe"
      assert html =~ "/foliage/embed"
    end
  end
end
