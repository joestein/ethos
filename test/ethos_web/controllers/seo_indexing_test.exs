defmodule EthosWeb.SeoIndexingTest do
  use EthosWeb.ConnCase, async: false

  test "robots.txt allows crawling and points at the absolute sitemap URL", %{conn: conn} do
    conn = get(conn, ~p"/robots.txt")
    body = response(conn, 200)

    assert response_content_type(conn, :text)
    assert body =~ "User-agent: *"
    assert body =~ "Allow: /"
    assert body =~ "Sitemap: " <> url(~p"/sitemap.xml")
  end

  test "google-site-verification meta renders only when configured", %{conn: conn} do
    original = Application.get_env(:ethos, :google_site_verification)

    try do
      Application.put_env(:ethos, :google_site_verification, "test-token-123")
      html = conn |> get(~p"/") |> html_response(200)
      assert html =~ ~s(<meta name="google-site-verification" content="test-token-123")

      Application.put_env(:ethos, :google_site_verification, nil)
      html = build_conn() |> get(~p"/") |> html_response(200)
      refute html =~ "google-site-verification"
    after
      Application.put_env(:ethos, :google_site_verification, original)
    end
  end
end
