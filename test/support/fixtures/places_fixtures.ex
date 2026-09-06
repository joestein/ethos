defmodule Ethos.PlacesFixtures do
  @moduledoc """
  A place for tests that need one but do not care where it is.

  Filed on a real roster node by default. A place's geography is nothing but
  the node it names now — the town/state/county triple this fixture used to
  write no longer exists as columns — so `destination_path:` is the only
  geography knob, and it is a path out of
  `priv/seed_data/destination_tree.json` rather than a free string: the node
  and its ancestors are seeded before the place is written.

  Waterbury by default because the badge rules the callers exercise are keyed
  on it (`@town_overrides` gives it "Brass City Explorer"), and because a
  fixture with no node at all would make every badge count silently zero.

  Pass `destination_path: nil` for a nodeless place — the shape a place
  created through the admin UI has, which must degrade to no badge, no
  crumbs and no PostalAddress rather than crashing.
  """

  @default_path "united-states/connecticut/new-haven-county/waterbury"

  # upsert_place!/1 UPDATES on a matching slug rather than raising, so the slug below
  # must be unique per call to guarantee a fresh place each time.
  def place_fixture(attrs \\ %{}) do
    n = System.unique_integer([:positive])

    attrs = Map.new(attrs, fn {k, v} -> {normalize_key(k), v} end)
    {path, attrs} = Map.pop_lazy(attrs, :destination_path, fn -> @default_path end)

    attrs =
      case path do
        nil -> attrs
        path -> Map.put(attrs, :destination_id, node_id!(path))
      end

    Ethos.Places.upsert_place!(
      Map.merge(
        %{
          slug: "place-#{n}",
          name: "Test Place #{n}",
          kind: "museum",
          summary: "x",
          status: "open"
        },
        attrs
      )
    )
  end

  defp node_id!(path) do
    Ethos.SeedDataHelpers.seed_destination_paths!([path])
    Ethos.Destinations.get_by_path(path).id
  end

  defp normalize_key(k) when is_binary(k), do: String.to_existing_atom(k)
  defp normalize_key(k), do: k
end
