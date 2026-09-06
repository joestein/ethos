defmodule EthosWeb.DestinationHTML do
  use EthosWeb, :html

  embed_templates "destination_html/*"

  @doc """
  The hub URL for a node path.

  `~p` percent-encodes a `/` inside a single interpolated string, so a
  multi-segment node path has to be interpolated as a segment LIST to expand to
  the glob route's real URL. One helper, so no template can get it wrong.
  """
  def node_path(path) when is_binary(path), do: ~p"/destinations/#{String.split(path, "/")}"

  @doc """
  The same URL, absolute — canonical tags, OG URLs, JSON-LD `BreadcrumbList`
  items and sitemap `<loc>`s, all of which must carry the host.

  It lives here, beside `node_path/1`, because `url/1` requires a **literal**
  `~p` at its own call site: it cannot be handed the result of `node_path/1`,
  so every module that wanted an absolute hub URL used to write the sigil out
  again. `DestinationController`, `PlaceController` and `SitemapController` each
  carried an identical private copy, each with a comment noting that the other
  two existed. Three copies of one route expansion is three places for a
  segment-list interpolation to be quietly rewritten back into
  `~p"/destinations/\#{path}"` — which percent-encodes the separators and
  publishes `/destinations/united-states%2Fconnecticut`, a 404, into the sitemap
  and every canonical tag below a root node.
  """
  def node_url(path) when is_binary(path),
    do: url(~p"/destinations/#{String.split(path, "/")}")
end
