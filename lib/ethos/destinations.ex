defmodule Ethos.Destinations do
  @moduledoc """
  Editorial content for destination pages. See `Ethos.Destinations.Destination`
  for why records are keyed by URL path.
  """
  import Ecto.Query, warn: false

  alias Ethos.Destinations.Destination
  alias Ethos.Repo

  def get_by_path(path) when is_binary(path), do: Repo.get_by(Destination, path: path)

  def list_destinations, do: Repo.all(from d in Destination, order_by: [asc: d.path])

  def upsert_destination!(attrs) do
    attrs = Map.new(attrs, fn {k, v} -> {to_string(k), v} end)

    # is_binary/1, not truthiness: a non-string path (`"path": false` in a seed
    # file) would otherwise reach Destination.changeset/2 as the struct
    # argument and raise something opaque instead of a changeset error.
    # The lookup short-circuits to `false`, not `nil`, so match the struct
    # rather than testing for nil.
    case is_binary(attrs["path"]) && Repo.get_by(Destination, path: attrs["path"]) do
      %Destination{} = existing -> existing
      _ -> %Destination{}
    end
    |> Destination.changeset(attrs)
    |> Repo.insert_or_update!()
  end

  def roots do
    Repo.all(
      from d in Destination,
        where: is_nil(d.parent_id),
        order_by: [asc: d.position, asc: d.name]
    )
  end

  def children(%Destination{id: id}) do
    Repo.all(
      from d in Destination,
        where: d.parent_id == ^id,
        order_by: [asc: d.position, asc: d.name]
    )
  end

  @doc """
  Ancestors root-first, excluding the node itself.

  Derived from the path's prefixes rather than by walking `parent_id`, so a
  five-deep node costs one query instead of four. `parent_id` and `path` are
  asserted to agree by the tree-integrity test, which is what makes the
  shortcut safe.
  """
  def ancestors(%Destination{path: path}) do
    prefixes =
      path
      |> String.split("/")
      |> Enum.drop(-1)
      |> Enum.scan([], fn seg, acc -> acc ++ [seg] end)
      |> Enum.map(&Enum.join(&1, "/"))

    case prefixes do
      [] ->
        []

      prefixes ->
        Repo.all(from d in Destination, where: d.path in ^prefixes)
        |> Enum.sort_by(&String.length(&1.path))
    end
  end

  def descendant_paths(%Destination{path: path}) do
    Repo.all(
      from d in Destination,
        where: like(d.path, ^(path <> "/%")),
        order_by: [asc: d.path],
        select: d.path
    )
  end

  def get_by_legacy_path(path) when is_binary(path) do
    Repo.one(from d in Destination, where: ^path in d.legacy_paths)
  end

  @doc """
  The legacy `town`/`state`/`county` triple for a node, derived from its
  ancestry.

  Transitional. Tasks 8-11 move each reader onto `destination_id`, and the
  final migration drops the columns and this function with them. It exists so
  that re-seeding during the transition writes the same values the corpora
  used to carry, rather than nulls that would fail `Place.changeset/2`.

  The tiers map by position from the leaf: the node itself is the town, its
  nearest `county`-or-`borough`-or-`city` ancestor is the county, and its
  nearest `region` ancestor is the state.

  A `region` node has no county and gets none. Every other kind falls back to
  its own name when no county-ish ancestor exists — that fallback is what gives
  Vatican City, a root `country` with nothing below it, a county to hang a
  breadcrumb on. A region is the one kind that is never a leaf jurisdiction, and
  fabricating `county: "Connecticut"` for the state node would file a
  state-level guide under a county hub repeating the state's own name.
  """
  def legacy_geo(%Destination{} = node), do: legacy_geo_from_trail(ancestors(node) ++ [node])

  @doc """
  `legacy_geo/1` over an ancestry trail instead of a stored node.

  Root-first, the node itself last, each entry anything answering to `.kind`
  and `.name`. The seam exists for the corpus gates, which read
  `priv/seed_data/destination_tree.json` off disk with no repo in sight
  (`ExUnit.Case`, not `DataCase`) and would otherwise need a second copy of the
  tier rules to check what the loaders write. One derivation, two entry points,
  so the gates and the shim cannot drift.
  """
  def legacy_geo_from_trail([_ | _] = trail) do
    node = List.last(trail)

    %{
      "town" => node.name,
      "county" => nearest(trail, ~w(county borough city)) || own_county(node),
      "state" => nearest(trail, ~w(region)) || nearest(trail, ~w(country)) || node.name
    }
  end

  defp own_county(%{kind: "region"}), do: nil
  defp own_county(node), do: node.name

  defp nearest(trail, kinds) do
    trail
    |> Enum.reverse()
    |> Enum.find_value(fn d -> if d.kind in kinds, do: d.name end)
  end
end
