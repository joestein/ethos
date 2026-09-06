defmodule EthosWeb.PlaceHTML do
  use EthosWeb, :html

  embed_templates "place_html/*"

  @schema_types %{
    "museum" => "Museum",
    "theater" => "PerformingArtsTheater",
    "restaurant" => "Restaurant",
    "cafe" => "CafeOrCoffeeShop",
    "brewery" => "Brewery",
    "hotel" => "Hotel",
    "bnb" => "BedAndBreakfast",
    "park" => "Park",
    "historic-site" => "LandmarksOrHistoricalBuildings",
    "amusement-park" => "AmusementPark",
    "shop" => "Store",
    "stadium" => "StadiumOrArena"
  }

  def schema_type(kind), do: Map.get(@schema_types, kind, "TouristAttraction")

  def kind_label(kind), do: kind |> String.replace("-", " ") |> String.capitalize()

  @doc """
  The node a place sits on, by name — "Waterbury", "Monti", "Belmont".

  Takes the ancestry trail `PlaceController` builds, root-first with the place's
  own node last, so the heading over "More in …" names the same node the
  siblings query is scoped by. `nil` for a place with no node.
  """
  def locality([]), do: nil
  def locality(trail) when is_list(trail), do: List.last(trail).name

  @doc """
  A place's geography as one line — "Waterbury, Connecticut", "Monti, Lazio".

  The node's own name, qualified by its nearest `region` ancestor or, above a
  region, its country. Read off the trail rather than off the row: this is what
  the `state` column used to hold, and deriving it from the ancestry is what
  keeps the title, the subtitle and the breadcrumb describing one geography.

  A qualifier equal to the node itself prints once — Vatican City is a root
  country with nothing below it, and the pair of columns this replaced published
  it as "Vatican City, Vatican City".
  """
  def geo_label([]), do: nil

  def geo_label(trail) when is_list(trail) do
    leaf = List.last(trail)

    case qualifier(trail) do
      nil -> leaf.name
      same when same == leaf.name -> leaf.name
      name -> "#{leaf.name}, #{name}"
    end
  end

  # Nearest-first, matching `StructuredData.postal_address/2`'s region rule.
  defp qualifier(trail) do
    trail
    |> Enum.reverse()
    |> Enum.find_value(fn d -> if d.kind in ~w(region country), do: d.name end)
  end
end
