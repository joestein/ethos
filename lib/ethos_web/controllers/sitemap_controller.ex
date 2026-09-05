defmodule EthosWeb.SitemapController do
  use EthosWeb, :controller

  alias Ethos.{Destinations, Guides, Places}

  def index(conn, _params) do
    # One URL per node in the destination tree, and no others.
    #
    # This replaced three builders that derived destination URLs from the
    # guides table — a `GROUP BY` over destination, state and state+county —
    # which after the tree landed emitted the *legacy* single-slug forms
    # (`/destinations/connecticut`). Every one of those 301s to its node, and a
    # sitemap is a list of canonical URLs: advertising a redirect source asks
    # Google to crawl a hop to reach a page we could have named directly. The
    # guide-derived builders also emitted URLs for destinations with no node at
    # all — a guide filed under "Lisbon, Portugal" produced `/destinations/lisbon`,
    # which now 404s — so the old list advertised pages that do not exist.
    #
    # Every node carries `updated_at`, so every destination URL now ships a
    # lastmod. Before the tree the hubs were assembled from guides at request
    # time and only the thirteen curated records had a date to publish.
    urls =
      [%{loc: url(~p"/"), lastmod: nil}, %{loc: url(~p"/destinations"), lastmod: nil}] ++
        Enum.map(Destinations.list_destinations(), fn d ->
          %{loc: node_url(d.path), lastmod: DateTime.to_date(d.updated_at)}
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

    # Kept from the guide-derived era, where a guide whose destination was a
    # bare state name derived the same slug as the state hub and so arrived
    # from two builders at once — the Antique Trail guide, destination
    # "Connecticut", is what surfaced it. Destination URLs now come from one
    # builder over a uniquely-indexed `path`, so that particular collision is
    # gone, but the invariant is about the finished list and this is still the
    # one place that can enforce it across all six builders.
    urls = Enum.uniq_by(urls, & &1.loc)

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

  # A node path is many segments, and `~p` percent-encodes a `/` inside a
  # single interpolated string. Interpolating the segment LIST is what expands
  # to the glob route's real URL; `~p"/destinations/#{d.path}"` would publish
  # `/destinations/united-states%2Fconnecticut`, a 404, for every node below a
  # root. Same reason `DestinationController.node_url/1` exists.
  defp node_url(path) when is_binary(path),
    do: url(~p"/destinations/#{String.split(path, "/")}")
end
