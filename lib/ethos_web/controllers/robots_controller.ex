defmodule EthosWeb.RobotsController do
  use EthosWeb, :controller

  def index(conn, _params) do
    body = """
    User-agent: *
    Allow: /

    Sitemap: #{url(~p"/sitemap.xml")}
    """

    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("cache-control", "public, max-age=3600")
    |> send_resp(200, body)
  end
end
