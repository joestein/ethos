defmodule Ethos.PlacesFixtures do
  # upsert_place!/1 UPDATES on a matching slug rather than raising, so the slug below
  # must be unique per call to guarantee a fresh place each time.
  def place_fixture(attrs \\ %{}) do
    n = System.unique_integer([:positive])

    Ethos.Places.upsert_place!(
      Map.merge(
        %{
          slug: "place-#{n}",
          name: "Test Place #{n}",
          kind: "museum",
          town: "Waterbury",
          state: "Connecticut",
          county: "New Haven County",
          summary: "x",
          status: "open"
        },
        attrs
      )
    )
  end
end
