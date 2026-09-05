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
end
