defmodule Ethos.Seeds.DestinationTree do
  @moduledoc """
  Loads `priv/seed_data/destination_tree.json` — the single declaration of the
  geographic hierarchy — into the `destinations` table.

  Parentage is derived from `path`, never authored, so the file cannot declare a
  node whose parent is missing without this loader raising. Nodes are seeded
  shallowest first so a parent always exists before its children.

  Idempotent: upserts by path, so re-running adopts new nodes and leaves
  existing ids alone.

  ## The roster's `intro` is a default, not the last word

  The roster carries a one-line stub for every node ("Connecticut, county by
  county."). Thirteen of those nodes also have a hand-written page in
  `priv/seed_data/destinations/`, which is where a hub's real prose and its
  photos are authored. Both loaders write `intro`, so without a precedence rule
  the last one to run wins and the pair flip-flops: re-seeding the tree after
  `Ethos.Release.seed_destinations/0` put the stub back over ~1KB of curated
  prose, silently, with no error and no failing test.

  So precedence is resolved *here*, at the point the value is read, rather than
  left to run order: `curated_intros/0` reads the same overlay files
  `Ethos.Seeds.DataDestination` seeds, and a node with an overlay takes its
  intro from there. Both loaders now write the same string for those thirteen
  nodes, so seeding the tree and the destinations in either order — or either
  one twice — converges on the curated prose. Photos are unaffected either way:
  they are not in this upsert's attrs.

  `name` is the other field both loaders write, and takes the same rule for the
  same reason — see `name_for/2`. The overlay wins both; `kind`, `position`,
  `legacy_paths` and `parent_id` are structural and only the roster declares
  them.
  """

  alias Ethos.Destinations
  alias Ethos.Seeds.DataDestination

  @roster "destination_tree.json"
  @overlay_dir "destinations"

  def path do
    Path.join([:code.priv_dir(:ethos) |> to_string(), "seed_data", @roster])
  end

  def load! do
    path = path()

    raw =
      case File.read(path) do
        {:ok, raw} -> raw
        {:error, reason} -> raise ArgumentError, "#{path}: cannot read (#{inspect(reason)})"
      end

    case Jason.decode(raw) do
      {:ok, nodes} when is_list(nodes) -> nodes
      {:ok, _} -> raise ArgumentError, "#{path}: expected a JSON array of nodes"
      {:error, err} -> raise ArgumentError, "#{path}: invalid JSON — #{Exception.message(err)}"
    end
  end

  @doc """
  Every curated hub file's path mapped to the intro it authors.

  The overlay `upsert_all!/0` defers to, exposed because the test helpers that
  seed a handful of roster nodes have to resolve the same precedence — a node
  seeded by a helper and the same node seeded in production must carry the same
  prose, or a gate reads a stub production never serves.
  """
  def curated_intros, do: Map.new(curated_overlays(), fn {path, d} -> {path, d["intro"]} end)

  @doc """
  Every curated hub file's path mapped to the name it authors.

  The `name` counterpart to `curated_intros/0`. Both loaders write `name` as
  well as `intro`, so it needs the same precedence rule for the same reason —
  see `name_for/2`.
  """
  def curated_names, do: Map.new(curated_overlays(), fn {path, d} -> {path, d["name"]} end)

  defp curated_overlays do
    [:code.priv_dir(:ethos) |> to_string(), "seed_data", @overlay_dir, "*.json"]
    |> Path.join()
    |> Path.wildcard()
    |> Map.new(fn file ->
      data = DataDestination.load!(file)
      {data["path"], data}
    end)
  end

  @doc """
  The intro to seed a roster node with: its curated overlay, or the roster stub.

  `curated` is the map from `curated_intros/0`, passed in rather than read per
  node — the roster is 700-odd nodes and the overlay is 13 files on disk.
  """
  def intro_for(node, curated), do: Map.get(curated, node["path"]) || node["intro"]

  @doc """
  The name to seed a roster node with: its curated overlay's, or the roster's.

  The same rule as `intro_for/2`, and it exists for the same reason. `name` is
  the other field both loaders write — `DataDestination.upsert!/1` passes the
  whole file through to `Destinations.upsert_destination!/1`, `name` included —
  so without a rule the last seeder to run wins it. Today all thirteen overlays
  and the roster agree, which is precisely why this is worth pinning: the
  divergence would arrive as an ordinary copy edit to one file, and re-seeding
  would then flip a hub's `<h1>`, its breadcrumb and its `BreadcrumbList`
  between two names with no error and nothing failing. That is the seed-order
  flip-flop Task 13 retired for `intro`, reopened through a second field.

  Overlay wins, as with `intro`: a curated file is the authority on the content
  fields it authors, and the roster's is the default for the 711 nodes with no
  file. `curated` is the map from `curated_names/0`.
  """
  def name_for(node, curated), do: Map.get(curated, node["path"]) || node["name"]

  def upsert_all! do
    nodes = load!()
    curated = curated_intros()
    names = curated_names()

    nodes
    |> Enum.sort_by(&depth(&1["path"]))
    |> Enum.each(fn node ->
      Destinations.upsert_destination!(%{
        "path" => node["path"],
        "name" => name_for(node, names),
        "kind" => node["kind"],
        "intro" => intro_for(node, curated),
        "position" => node["position"] || 0,
        "legacy_paths" => node["legacy_paths"] || [],
        "parent_id" => parent_id!(node["path"])
      })
    end)

    length(nodes)
  end

  defp depth(path), do: path |> String.split("/") |> length()

  defp parent_id!(path) do
    case path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/") do
      "" ->
        nil

      parent_path ->
        case Destinations.get_by_path(parent_path) do
          nil -> raise ArgumentError, "#{path}: parent #{parent_path} is not in the roster"
          parent -> parent.id
        end
    end
  end
end
