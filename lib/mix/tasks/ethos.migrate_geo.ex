defmodule Mix.Tasks.Ethos.MigrateGeo do
  @shortdoc "Rewrites seed files from state/county/town to a destination_path"
  @moduledoc """
  One-shot, idempotent rewrite of the JSON seed corpora onto the destination
  tree.

  For every guide and place it computes the node path from the corpus and the
  existing `(state, county, town)` triple, writes `destination_path`, and drops
  the three legacy keys. Leaf nodes are appended to
  `priv/seed_data/destination_tree.json` so the roster and the corpora cannot
  disagree.

  A file whose triple matches no rule raises with its path. Guessing here would
  put a place in the wrong country and nothing downstream would notice.

      mix ethos.migrate_geo          # rewrite every corpus
      mix ethos.migrate_geo rome     # rewrite one
  """
  use Mix.Task

  alias Ethos.Guides.Guide

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london)

  @leaf_kinds %{
    "connecticut" => "town",
    "manhattan" => "neighborhood",
    "brooklyn" => "neighborhood",
    "queens" => "neighborhood",
    "bronx" => "neighborhood",
    "san_francisco" => "neighborhood",
    "rome" => "neighborhood",
    "london" => "borough"
  }

  @impl Mix.Task
  def run(args) do
    corpora = if args == [], do: @corpora, else: args
    leaves = Enum.flat_map(corpora, &rewrite_corpus!/1)
    appended = append_leaves!(leaves)
    Mix.shell().info("Rewrote #{length(corpora)} corpora, #{appended} leaf nodes")
  end

  @doc "The node path for one corpus's (state, county, town) triple."
  def path_for(corpus, state, county, town)

  def path_for("connecticut", _state, county, town),
    do: "united-states/connecticut/#{slug(county)}/#{slug(town)}"

  def path_for(borough, _state, _county, town)
      when borough in ~w(manhattan brooklyn queens bronx),
      do: "united-states/new-york/new-york-city/#{borough}/#{slug(town)}"

  def path_for("san_francisco", _state, _county, town),
    do: "united-states/california/san-francisco/#{slug(town)}"

  def path_for("rome", _state, _county, town), do: "italy/lazio/rome/#{slug(town)}"

  def path_for("london", _state, _county, town),
    do: "united-kingdom/england/london/#{slug(town)}"

  def path_for(corpus, _state, _county, _town),
    do: raise(ArgumentError, "no mapping rule for corpus #{inspect(corpus)}")

  @doc """
  The node path for one place, given its guide's node.

  Everywhere except London a place sits on the same node as its guide — the
  corpora were authored one file per neighborhood. London's files are one per
  borough with places in the towns inside it, so those nest a level deeper.
  """
  def place_path_for("london", guide_path, town) do
    town_slug = slug(town)
    borough_slug = guide_path |> String.split("/") |> List.last()

    if town_slug == borough_slug,
      do: guide_path,
      else: "#{guide_path}/#{town_slug}"
  end

  def place_path_for(_corpus, guide_path, _town), do: guide_path

  defp slug(value), do: Guide.derive_destination_slug(value)

  defp depth(path), do: path |> String.split("/") |> length()

  defp rewrite_corpus!(corpus) do
    Path.join(["priv", "seed_data", corpus, "*.json"])
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.flat_map(&rewrite_file!(corpus, &1))
  end

  # Idempotent: a file that already carries destination_path is left alone.
  # Re-running after a partial rewrite, or over a corpus a concurrent worktree
  # already migrated, is a no-op rather than a crash on the missing triple.
  #
  # Decoding with `objects: :ordered_objects` is NOT optional. A plain
  # `Jason.decode!` returns bare maps, which are unordered, so re-encoding
  # reshuffles every key — measured at 692 of 700 lines changed on
  # rome/ardeatino.json. Across 393 files that makes the diff unreviewable and
  # the "no prose was touched" guarantee unverifiable. With ordered objects the
  # round-trip is byte-identical, and this rewrite touches ZERO non-geo lines.
  defp rewrite_file!(corpus, file) do
    data = file |> File.read!() |> Jason.decode!(objects: :ordered_objects)
    guide = data["guide"]

    if is_binary(guide["destination_path"]) do
      # Already migrated. The roster already holds its nodes, and the names
      # needed to rebuild them (`town`) are gone, so contribute nothing.
      []
    else
      guide_town = guide["destination"] |> String.split(",") |> List.first() |> String.trim()
      guide_path = path_for(corpus, guide["state"], guide["county"], guide_town)

      # Computed from the ORIGINAL objects, before the geo keys are dropped —
      # `town` is the only place a leaf node's display name is written down.
      place_leaves =
        Enum.map(data["places"], fn p ->
          {place_path_for(corpus, guide_path, p["town"]), p["town"]}
        end)

      new_guide = swap_geo(guide, ~w(state county), guide_path)

      new_places =
        data["places"]
        |> Enum.zip(place_leaves)
        |> Enum.map(fn {p, {path, _name}} -> swap_geo(p, ~w(state county town), path) end)

      rewritten = data |> oput("guide", new_guide) |> oput("places", new_places)
      File.write!(file, Jason.encode!(rewritten, pretty: true) <> "\n")

      leaves_from(corpus, guide_path, guide_town, place_leaves)
    end
  end

  # Drops the legacy geo keys and inserts `destination_path` at the index the
  # first of them occupied. Appending instead would add a trailing comma to the
  # preceding key, churning 84 extra lines per file for no reason.
  defp swap_geo(%Jason.OrderedObject{values: vs} = obj, drop_keys, path) do
    idx = Enum.find_index(vs, fn {k, _} -> k in drop_keys end)
    kept = Enum.reject(vs, fn {k, _} -> k in drop_keys end)
    %{obj | values: List.insert_at(kept, idx || length(kept), {"destination_path", path})}
  end

  defp oput(%Jason.OrderedObject{values: vs} = obj, key, value) do
    if List.keymember?(vs, key, 0) do
      %{obj | values: List.keyreplace(vs, key, 0, {key, value})}
    else
      %{obj | values: vs ++ [{key, value}]}
    end
  end

  # One roster entry per distinct node the file references. The guide's own
  # node takes the corpus kind; a place node deeper than the guide's is a town
  # inside it — only London produces those.
  defp leaves_from(corpus, guide_path, guide_name, place_leaves) do
    guide_kind = Map.fetch!(@leaf_kinds, corpus)
    guide_depth = depth(guide_path)

    [{guide_path, guide_name} | place_leaves]
    |> Enum.reject(fn {path, _} -> is_nil(path) end)
    |> Enum.uniq_by(fn {path, _} -> path end)
    |> Enum.map(fn {path, name} ->
      name = name || path |> String.split("/") |> List.last()
      kind = if depth(path) > guide_depth, do: "town", else: guide_kind

      # An ordered object, not a map: these are encoded straight into the
      # roster, and a bare map would emit its four keys in whatever order the
      # runtime chose, alphabetically as it happens — leaving the appended
      # nodes keyed differently from the 27 hand-authored ones above them.
      Jason.OrderedObject.new([
        {"path", path},
        {"kind", kind},
        {"name", name},
        {"intro", "#{name}."}
      ])
    end)
  end

  # Appends by splicing text before the roster's closing bracket rather than
  # re-encoding the file. The 27 hand-authored nodes are laid out two keys to a
  # line and grouped by country; `Jason.encode!(pretty: true)` would reflow all
  # of them, so a reviewer of this commit could no longer see at a glance that
  # nothing existing changed. Returns the number of nodes actually added.
  defp append_leaves!(leaves) do
    roster_file = Path.join(["priv", "seed_data", "destination_tree.json"])
    raw = File.read!(roster_file)
    existing = Jason.decode!(raw, objects: :ordered_objects)
    have = MapSet.new(existing, & &1["path"])

    new =
      leaves
      |> Enum.uniq_by(& &1["path"])
      |> Enum.reject(&MapSet.member?(have, &1["path"]))
      |> Enum.sort_by(& &1["path"])

    unless new == [] do
      body = raw |> String.trim_trailing() |> String.trim_trailing("]") |> String.trim_trailing()
      appended = Enum.map_join(new, ",\n", &("  " <> Jason.encode!(&1)))
      File.write!(roster_file, body <> ",\n\n" <> appended <> "\n]\n")
    end

    length(new)
  end
end
