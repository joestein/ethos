defmodule EthosWeb.SitemapController do
  use EthosWeb, :controller

  alias Ethos.Guides

  def index(conn, _params) do
    urls =
      [%{loc: url(~p"/"), lastmod: nil}, %{loc: url(~p"/destinations"), lastmod: nil}] ++
        Enum.map(Guides.list_destinations(), fn d ->
          %{loc: url(~p"/destinations/#{d.slug}"), lastmod: nil}
        end) ++
        Enum.map(Guides.list_published_guides(), fn g ->
          %{loc: url(~p"/g/#{g.slug}"), lastmod: DateTime.to_date(g.updated_at)}
        end)

    xml =
      [
        ~s(<?xml version="1.0" encoding="UTF-8"?>),
        ~s(<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">),
        Enum.map(urls, fn %{loc: loc, lastmod: lastmod} ->
          [
            "<url><loc>",
            loc,
            "</loc>",
            if(lastmod, do: ["<lastmod>", Date.to_iso8601(lastmod), "</lastmod>"], else: []),
            "</url>"
          ]
        end),
        "</urlset>"
      ]

    conn
    |> put_resp_content_type("application/xml")
    |> put_resp_header("cache-control", "public, max-age=3600")
    |> send_resp(200, IO.iodata_to_binary(xml))
  end
end
