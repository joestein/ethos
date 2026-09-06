defmodule Ethos.Destinations do
  @moduledoc """
  Editorial content for destination pages. See `Ethos.Destinations.Destination`
  for why records are keyed by URL path.
  """
  import Ecto.Query, warn: false

  alias Ethos.Destinations.Destination
  alias Ethos.Repo

  def get_by_path(path) when is_binary(path), do: Repo.get_by(Destination, path: path)

  @doc """
  A node by id, or nil.

  For a caller holding a `destination_id` off a guide or place row that was
  fetched without the association preloaded — `nil` rather than a raise, since
  a guide authored through the web UI names no node.
  """
  def get(id) when is_integer(id), do: Repo.get(Destination, id)

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

  @doc """
  Every node beneath `node`, as ids, excluding the node itself.

  The id counterpart of `descendant_paths/1`, and the one to reach for whenever
  the caller wants rows or counts rather than URLs. A caller holding paths and
  wanting ids has to resolve each one — `Ethos.Badges` did exactly that and
  paid a query per descendant, 1,083 of them across the county-tier subtrees of
  a 752-node roster, on **every reaction**. Selecting the id in the same single
  `LIKE` query costs nothing extra and removes the whole N+1.

  `descendant_paths/1` stays for the callers that genuinely want the URLs.
  """
  def descendant_ids(%Destination{path: path}) do
    Repo.all(
      from d in Destination,
        where: like(d.path, ^(path <> "/%")),
        order_by: [asc: d.path],
        select: d.id
    )
  end

  def get_by_legacy_path(path) when is_binary(path) do
    Repo.one(from d in Destination, where: ^path in d.legacy_paths)
  end

  @doc """
  Whether `node` is `ancestor_path` itself or lies beneath it.

  Pure string work on the materialised path — no query — because every caller
  runs per row: the foliage panel on every guide page, the house ad on every
  guide and place page. A `parent_id` walk there would cost a read per row, the
  cost ruling C18 rejected for affiliate locale matching for the same reason.

  This is what replaced the `state_slug == "connecticut"` guards those callers
  used to carry, and it is strictly more precise than they were. A slug said
  only which *name* a page's state happened to derive to; ancestry says the
  node is genuinely inside that region, so a Connecticut town is one because it
  sits under `united-states/connecticut`, not because a string matched.

  `false` for `nil` or an unloaded association, so a caller holding a row whose
  `destination_node` was never preloaded degrades to "not in that region"
  rather than raising out of a template.
  """
  def under?(%Destination{path: path}, ancestor_path) when is_binary(ancestor_path),
    do: path == ancestor_path or String.starts_with?(path, ancestor_path <> "/")

  def under?(_node, _ancestor_path), do: false

  @doc """
  `{exact_path, like_pattern}` for matching a subtree inside an Ecto query —
  the query-side counterpart of `under?/2`, for a caller selecting whole lists
  rather than testing one row it already holds.

  Node paths are slugs joined by "/" (`[a-z0-9-]` only, enforced by
  `Destination.changeset/2`), so neither LIKE wildcard can occur in
  `ancestor_path` and it needs no escaping.
  """
  def subtree_match(ancestor_path) when is_binary(ancestor_path),
    do: {ancestor_path, ancestor_path <> "/%"}
end
