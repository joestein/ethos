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

  test "a stadium is a StadiumOrArena, not the TouristAttraction fallback" do
    assert PlaceHTML.schema_type("stadium") == "StadiumOrArena"
    refute PlaceHTML.schema_type("stadium") == PlaceHTML.schema_type("unmapped-kind")
  end

  test "stadium is an accepted kind" do
    assert "stadium" in Place.kinds()
  end

  # schema.org has a SkiResort type. Without an entry, a ski area falls through
  # schema_type/1's default to TouristAttraction — which renders, validates, and
  # tells a search engine nothing about what the page is.
  test "a ski area is a SkiResort, not the TouristAttraction fallback" do
    assert PlaceHTML.schema_type("ski-area") == "SkiResort"
    refute PlaceHTML.schema_type("ski-area") == PlaceHTML.schema_type("unmapped-kind")
  end

  test "ski-area is an accepted kind" do
    assert "ski-area" in Place.kinds()
  end

  # The hyphenation this project did not choose. Pinned so a later corpus does
  # not quietly introduce a second spelling of the same thing.
  test "the vocabulary rejects ski-resort" do
    refute "ski-resort" in Place.kinds()
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
