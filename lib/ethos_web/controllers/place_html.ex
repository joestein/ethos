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
end
