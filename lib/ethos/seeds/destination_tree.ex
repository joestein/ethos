defmodule Ethos.Seeds.DestinationTree do
  @moduledoc """
  Loads `priv/seed_data/destinations/tree.json` — the single declaration of the
  geographic hierarchy — into the `destinations` table.

  Parentage is derived from `path`, never authored, so the file cannot declare a
  node whose parent is missing without this loader raising. Nodes are seeded
  shallowest first so a parent always exists before its children.

  Idempotent: upserts by path, so re-running adopts new nodes and leaves
  existing ids alone.
  """

  alias Ethos.Destinations

  @roster "destinations/tree.json"

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

  def upsert_all! do
    nodes = load!()

    nodes
    |> Enum.sort_by(&depth(&1["path"]))
    |> Enum.each(fn node ->
      Destinations.upsert_destination!(%{
        "path" => node["path"],
        "name" => node["name"],
        "kind" => node["kind"],
        "intro" => node["intro"],
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
