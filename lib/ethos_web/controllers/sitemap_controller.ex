defmodule EthosWeb.SitemapController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Guides, Places}

  def index(conn, _params) do
    # Destination pages are assembled from the guides table at request time, so
    # nothing about the page itself has a modification date — every destination
    # URL used to ship without a lastmod. A `Destination` record supplies the
    # prose and the photograph, and it does have one, so the pages whose content
    # can actually change are the ones that now carry a date. Loaded once as a
    # map rather than queried per URL: there are 291 destination URLs and 13
    # records.
    dest_lastmod =
      Map.new(Destinations.list_destinations(), fn d ->
        {d.path, DateTime.to_date(d.updated_at)}
      end)

    urls =
      [%{loc: url(~p"/"), lastmod: nil}, %{loc: url(~p"/destinations"), lastmod: nil}] ++
        Enum.map(Guides.list_destinations(), fn d ->
          %{loc: url(~p"/destinations/#{d.slug}"), lastmod: dest_lastmod[d.slug]}
        end) ++
        Enum.map(Guides.list_states(), fn s ->
          %{loc: url(~p"/destinations/#{s.slug}"), lastmod: dest_lastmod[s.slug]}
        end) ++
        Enum.flat_map(Guides.list_states(), fn s ->
          Enum.map(Guides.list_counties_for_state(s.slug), fn c ->
            path = "#{s.slug}/#{c.slug}"
            %{loc: url(~p"/destinations/#{s.slug}/#{c.slug}"), lastmod: dest_lastmod[path]}
          end)
        end) ++
        Enum.flat_map(Guides.list_published_guides(), fn g ->
          lastmod = DateTime.to_date(g.updated_at)

          [%{loc: url(~p"/g/#{g.slug}"), lastmod: lastmod}] ++
            if g.photos not in [nil, []] do
              [%{loc: url(~p"/g/#{g.slug}/photos"), lastmod: lastmod}]
            else
              []
            end
        end) ++
        Enum.map(Places.list_places(), fn p ->
          %{loc: url(~p"/p/#{p.slug}"), lastmod: DateTime.to_date(p.updated_at)}
        end) ++
        Enum.map(Ethos.Collections.list_published(), fn c ->
          %{loc: url(~p"/c/#{c.slug}"), lastmod: DateTime.to_date(c.updated_at)}
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
