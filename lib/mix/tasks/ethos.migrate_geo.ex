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

  @roster_path ["priv", "seed_data", "destination_tree.json"]

  @doc """
  Plans the whole run before writing anything, then writes the roster before
  the corpora.

  Both halves of that order are load-bearing, because this rewrite destroys its
  own inputs. A leaf node's display name exists in exactly one place — the
  `town` key the rewrite deletes — so a file that already carries a
  `destination_path` can contribute nothing to the roster ever again. Writing
  the corpora first would therefore make a crash between the two unrecoverable:
  the files would be migrated, their nodes never declared, and a re-run would
  skip them as already done. Planning first (no writes at all until every
  corpus has been read and mapped without raising) and appending the roster
  first leaves only two reachable states, both benign — nothing done, or a
  roster holding nodes whose files have yet to be rewritten, which the next run
  finishes and which `append_leaves!/1` deduplicates by path.
  """
  @impl Mix.Task
  def run(args) do
    corpora = corpora!(args)

    plans = Enum.flat_map(corpora, &plan_corpus!/1)
    appended = append_leaves!(Enum.flat_map(plans, & &1.leaves))
    Enum.each(plans, fn plan -> File.write!(plan.file, plan.content) end)

    Mix.shell().info("Rewrote #{length(corpora)} corpora, #{appended} leaf nodes")
  end

  # An unknown corpus wildcards to zero files, so without this the CLI would
  # report "Rewrote 1 corpora, 0 leaf nodes" for a typo and exit 0 — the same
  # output as a corpus that was already migrated. Checked before anything is
  # read, so the guarantee `path_for/4` makes is the one the command makes.
  defp corpora!([]), do: @corpora

  defp corpora!(args) do
    case Enum.reject(args, &(&1 in @corpora)) do
      [] ->
        args

      unknown ->
        Mix.raise(
          "no mapping rule for corpus #{Enum.map_join(unknown, ", ", &inspect/1)} " <>
            "(known: #{Enum.join(@corpora, " ")})"
        )
    end
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

  # The Vatican is a sovereign state that Rome surrounds, not a quarter of it,
  # and `state` is the only thing that says so: the corpus authored these 30
  # rows as "Vatican City" where every other Roman row says "Italy". This is
  # the case that argument exists for. Mapping them under italy/ would put St
  # Peter's in Italy, and Task 10 derives addressCountry from the country
  # ancestor — so the basilica would ship "IT", the defect
  # `EthosWeb.StructuredData`'s @country_by_region comment records as having
  # been made once already and fixed.
  #
  # Ordered before the general clause so it wins; the node it names is a root,
  # sibling to `italy`, not a child of anything.
  def path_for("rome", "Vatican City", _county, _town), do: "vatican-city"

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

  @doc """
  Drops the legacy geo keys from an object and inserts `destination_path` at
  the index the first of them occupied.

  Appending instead would put the new key after the object's last one, moving
  the comma onto the previously-final line and churning 84 extra lines per file
  for no reason. Public because that index is one of the three things keeping
  this rewrite's diff to geo keys alone, and an argued guarantee is worth less
  than a tested one.
  """
  def swap_geo(%Jason.OrderedObject{values: vs} = obj, drop_keys, path) do
    idx = Enum.find_index(vs, fn {k, _} -> k in drop_keys end)
    kept = Enum.reject(vs, fn {k, _} -> k in drop_keys end)
    %{obj | values: List.insert_at(kept, idx || length(kept), {"destination_path", path})}
  end

  @doc """
  Appends `nodes` to the JSON array in `raw` as text, leaving every byte that
  was already there exactly where it was.

  Re-encoding the roster instead would reflow all 27 hand-authored nodes — they
  are laid out two keys to a line and grouped by country — so a reviewer could
  no longer see at a glance that nothing existing changed.

  Splicing text into JSON is only safe if the result is checked, so it is: the
  spliced text is parsed and must equal the old array followed by the new
  nodes, or nothing is returned to be written.
  """
  def splice_nodes(raw, []), do: raw

  def splice_nodes(raw, nodes) do
    body = raw |> String.trim_trailing() |> String.trim_trailing("]") |> String.trim_trailing()
    appended = Enum.map_join(nodes, ",\n", &("  " <> Jason.encode!(&1)))
    spliced = body <> ",\n\n" <> appended <> "\n]\n"
    expected = Jason.decode!(raw) ++ Jason.decode!(Jason.encode!(nodes))

    case Jason.decode(spliced) do
      {:ok, ^expected} ->
        spliced

      {:ok, _other} ->
        raise ArgumentError, "roster splice changed the array it was appending to"

      {:error, err} ->
        raise ArgumentError, "roster splice produced invalid JSON — #{Exception.message(err)}"
    end
  end

  defp slug(value), do: Guide.derive_destination_slug(value)

  defp depth(path), do: path |> String.split("/") |> length()

  defp plan_corpus!(corpus) do
    Path.join(["priv", "seed_data", corpus, "*.json"])
    |> Path.wildcard()
    |> Enum.sort()
    |> Enum.map(&plan_file!(corpus, &1))
    |> Enum.reject(&is_nil/1)
  end

  # Reads and maps one file, returning the bytes it should be rewritten to and
  # the roster nodes it references. Writes nothing: see `run/1` for why.
  #
  # Idempotent: a file that already carries destination_path plans nothing.
  # Re-running after a partial rewrite, or over a corpus a concurrent worktree
  # already migrated, is a no-op rather than a crash on the missing triple.
  #
  # Decoding with `objects: :ordered_objects` is NOT optional. A plain
  # `Jason.decode!` returns bare maps, which are unordered, so re-encoding
  # reshuffles every key — measured at 692 of 700 lines changed on
  # rome/ardeatino.json. Across 393 files that makes the diff unreviewable and
  # the "no prose was touched" guarantee unverifiable. With ordered objects the
  # round-trip is byte-identical, and this rewrite touches ZERO non-geo lines.
  defp plan_file!(corpus, file) do
    data = file |> File.read!() |> Jason.decode!(objects: :ordered_objects)
    guide = data["guide"]

    unless is_binary(guide["destination_path"]) do
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

      %{
        file: file,
        content: Jason.encode!(rewritten, pretty: true) <> "\n",
        leaves: leaves_from(corpus, guide_path, guide_town, place_leaves)
      }
    end
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

  defp append_leaves!(leaves) do
    roster_file = Path.join(@roster_path)
    raw = File.read!(roster_file)
    have = raw |> Jason.decode!(objects: :ordered_objects) |> MapSet.new(& &1["path"])

    new =
      leaves
      |> Enum.uniq_by(& &1["path"])
      |> Enum.reject(&MapSet.member?(have, &1["path"]))
      |> Enum.sort_by(& &1["path"])

    unless new == [], do: File.write!(roster_file, splice_nodes(raw, new))

    length(new)
  end
end
