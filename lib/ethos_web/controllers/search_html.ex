defmodule EthosWeb.SearchHTML do
  use EthosWeb, :html

  embed_templates "search_html/*"

  @doc """
  A place result's geography, by the name of the node it is filed on.

  `Ethos.Search` preloads `:destination_node` for exactly this. One node name,
  not the "town, state" pair the dropped columns printed: a result row has no
  ancestry loaded, and a second query per result to qualify a name in a list is
  not worth it. The place's own page prints the full trail.
  """
  def place_geo(%Ethos.Places.Place{destination_node: %Ethos.Destinations.Destination{} = node}),
    do: node.name

  def place_geo(%Ethos.Places.Place{}), do: nil
end
