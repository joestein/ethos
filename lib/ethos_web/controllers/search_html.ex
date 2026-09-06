defmodule EthosWeb.SearchHTML do
  use EthosWeb, :html

  embed_templates "search_html/*"

  @doc """
  A place result's kind and geography — "brewery · Waterbury".

  The geography is the name of the node the place is filed on, which
  `Ethos.Search` preloads for exactly this. One node name, not the "town, state"
  pair the dropped columns printed: a result row has no ancestry loaded, and a
  second query per result to qualify a name in a list is not worth it. The
  place's own page prints the full trail.

  Built here rather than in the template so the separator travels with the thing
  it separates. A place with no node returns just the kind — a template joining
  the two itself printed a dangling "· brewery · " with nothing after it.
  """
  def place_meta(%Ethos.Places.Place{} = place) do
    case place.destination_node do
      %Ethos.Destinations.Destination{name: name} -> "#{place.kind} · #{name}"
      _ -> place.kind
    end
  end
end
