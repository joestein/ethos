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
end
