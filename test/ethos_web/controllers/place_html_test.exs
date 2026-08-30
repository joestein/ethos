defmodule EthosWeb.PlaceHTMLTest do
  use ExUnit.Case, async: true

  alias Ethos.Places.Place
  alias EthosWeb.PlaceHTML

  # A retail shop is not a tourist attraction. Before `shop` existed, an antique
  # dealer had to be filed as `attraction`, which falls through to
  # `TouristAttraction` — a type that carries none of the properties a consumer
  # expects of a store, and says the wrong thing about what the place is.
  test "a shop is a Store, not the TouristAttraction fallback" do
    assert PlaceHTML.schema_type("shop") == "Store"
    refute PlaceHTML.schema_type("shop") == PlaceHTML.schema_type("unmapped-kind")
  end

  test "shop is an accepted kind" do
    assert "shop" in Place.kinds()
  end

  test "every accepted kind maps to a schema.org type that is not the fallback" do
    fallback = PlaceHTML.schema_type("definitely-not-a-kind")

    unmapped = Enum.filter(Place.kinds(), &(PlaceHTML.schema_type(&1) == fallback))

    # `attraction` is deliberately the fallback: TouristAttraction is the right
    # type for it, so it needs no entry of its own. Everything else must map.
    assert unmapped == ["attraction"],
           "kinds with no schema.org mapping: #{inspect(unmapped)}"
  end
end
