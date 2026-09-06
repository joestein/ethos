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

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london korean_bbq)

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

  # Korean BBQ is the one corpus whose GUIDE node does not derive from its
  # triple, so this is a table rather than a rule. Every other corpus files one
  # guide per real place — a Connecticut town, a Roman neighbourhood — and the
  # first comma-segment of `destination` names it. These ten name a dish and a
  # market area: "Brooklyn Korean BBQ", "Puget Sound", "South Bay", "Chicago
  # North Suburbs". Deriving a node from those strings would invent
  # `united-states/washington/puget-sound` — a hub for a body of water, with no
  # county, city or region behind it.
  #
  # Two of the labels are not geography at all and the mapping is a judgement,
  # recorded here rather than in a commit message:
  #
  #   * "Puget Sound" is a marketing region spanning three real counties (King,
  #     Pierce, Snohomish, which the PLACES carry correctly). The guide is
  #     centred on Seattle and Seattle is a real node the ballpark corpus
  #     already created, so the guide files there. No Puget Sound node exists.
  #   * "South Bay" is likewise a region, not a county; its places are in Santa
  #     Clara and Alameda counties. The guide files on Santa Clara, the city
  #     most of its rooms are in.
  #
  # The name half of each pair is what the roster node is called. Without it
  # `leaves_from/4` would name the new Niles node "Chicago North Suburbs" and
  # the new Santa Clara node "South Bay", because a guide node's display name
  # otherwise comes from that same marketing label.
  @korean_bbq_guides %{
    "Brooklyn Korean BBQ" => {"united-states/new-york/new-york-city/brooklyn", "Brooklyn"},
    "Manhattan Korean BBQ" => {"united-states/new-york/new-york-city/manhattan", "Manhattan"},
    "Queens Korean BBQ" => {"united-states/new-york/new-york-city/queens", "Queens"},
    "London Korean BBQ" => {"united-kingdom/england/london", "London"},
    "San Francisco Korean BBQ" => {"united-states/california/san-francisco", "San Francisco"},
    "Chicago" => {"united-states/illinois/chicago", "Chicago"},
    "Chicago North Suburbs" => {"united-states/illinois/niles", "Niles"},
    "Los Angeles" => {"united-states/california/los-angeles", "Los Angeles"},
    "Puget Sound" => {"united-states/washington/seattle", "Seattle"},
    "South Bay" => {"united-states/california/santa-clara", "Santa Clara"}
  }

  def path_for("korean_bbq", _state, _county, guide_town) do
    case Map.fetch(@korean_bbq_guides, guide_town) do
      {:ok, {path, _name}} ->
        path

      :error ->
        raise ArgumentError,
              "korean_bbq: no node for guide destination #{inspect(guide_town)}. " <>
                "This corpus's guide nodes are a hand-checked table, not a rule — " <>
                "add the new guide to @korean_bbq_guides."
    end
  end

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
  The node path for one Korean BBQ place.

  Unlike every other corpus, these places do NOT sit on their guide's node: the
  Puget Sound guide covers eleven cities across three counties and the South
  Bay guide covers three across two, so a place is placed from its own triple
  rather than from the guide it appears in.

  The triples are honest at the place level even where the guide's is not —
  every place carries a real county — but no county node is created for them.
  California, Illinois and Washington are modelled city-directly-under-region
  in this roster (`united-states/illinois/chicago`,
  `united-states/washington/seattle`), and inventing a county tier for one
  corpus would give those states two incompatible shapes.

  A `nil` town attaches the place to the hub the guide covers — the borough or
  the city itself — rather than to a node named after nothing. That is the only
  honest answer: a place the corpus declines to put in a neighbourhood is in
  the borough, and the borough node exists.
  """
  def korean_bbq_place_path(state, county, town)

  def korean_bbq_place_path("New York", borough, town),
    do: nest("united-states/new-york/new-york-city/#{slug(borough)}", borough, town)

  def korean_bbq_place_path("England", "London", town),
    do: nest("united-kingdom/england/london", "London", town)

  def korean_bbq_place_path("California", "San Francisco", town),
    do: nest("united-states/california/san-francisco", "San Francisco", town)

  def korean_bbq_place_path("California", _county, town),
    do: nest("united-states/california", nil, town)

  def korean_bbq_place_path("Illinois", _county, town),
    do: nest("united-states/illinois", nil, town)

  def korean_bbq_place_path("Washington", _county, town),
    do: nest("united-states/washington", nil, town)

  def korean_bbq_place_path(state, county, town) do
    raise ArgumentError,
          "korean_bbq: no mapping rule for place " <>
            inspect({state, county, town})
  end

  # `parent_name` is the node `parent_path` already names, so a place whose
  # town repeats it ("Barking and Dagenham" inside the Barking and Dagenham
  # borough) attaches to that node instead of nesting a duplicate beneath it.
  # `nil` means the parent is a region no place may attach to directly, so a
  # town is required there.
  defp nest(parent_path, parent_name, town) do
    cond do
      is_nil(town) and is_nil(parent_name) ->
        raise ArgumentError, "korean_bbq: a place under #{parent_path} needs a town"

      is_nil(town) ->
        parent_path

      not is_nil(parent_name) and slug(town) == slug(parent_name) ->
        parent_path

      true ->
        "#{parent_path}/#{slug(town)}"
    end
  end

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
  # Idempotent PER KEY, not per file. The first version of this tested only the
  # guide — a file whose guide already carried `destination_path` planned
  # nothing at all — and that is exactly wrong for the case this task exists to
  # serve. A concurrent worktree does not usually add whole corpora; it adds
  # PLACES to corpora this branch already migrated. Twenty-six such files
  # arrived with the Korean BBQ merge, each an already-migrated guide holding
  # one to twelve new places still carrying the legacy triple, and a file-level
  # skip walked straight past all of them. The seed-file gate caught it, which
  # is the only reason this note is not a postmortem.
  #
  # So: the guide is migrated if it still needs it, each place is migrated if
  # it still needs it, and a file where nothing needs it plans nothing. A place
  # that is already migrated is left byte-identical rather than passed through
  # `swap_geo/3`, which would find no legacy key and append a SECOND
  # `destination_path`.
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
    places = data["places"]

    guide_stale? = not is_binary(guide["destination_path"])
    stale_places = Enum.filter(places, &(not is_binary(&1["destination_path"])))

    if guide_stale? or stale_places != [] do
      guide_town = guide["destination"] |> String.split(",") |> List.first() |> String.trim()

      guide_path =
        if guide_stale?,
          do: path_for(corpus, guide["state"], guide["county"], guide_town),
          else: guide["destination_path"]

      # Computed from the ORIGINAL objects, before the geo keys are dropped —
      # `town` is the only place a leaf node's display name is written down.
      place_leaves =
        Enum.map(stale_places, fn p ->
          {place_node_path(corpus, guide_path, p), p["town"]}
        end)

      new_guide =
        if guide_stale?, do: swap_geo(guide, ~w(state county), guide_path), else: guide

      new_places =
        Enum.map(places, fn p ->
          if is_binary(p["destination_path"]) do
            p
          else
            swap_geo(p, ~w(state county town), place_node_path(corpus, guide_path, p))
          end
        end)

      rewritten = data |> oput("guide", new_guide) |> oput("places", new_places)

      guide_leaf = if guide_stale?, do: [{guide_path, node_name(corpus, guide_town)}], else: []

      %{
        file: file,
        content: Jason.encode!(rewritten, pretty: true) <> "\n",
        leaves: leaves_from(corpus, guide_path, guide_leaf ++ place_leaves)
      }
    end
  end

  # Korean BBQ places are placed from their own triple; every other corpus's
  # places hang off the guide's node. Split out so `place_path_for/3` and its
  # tests keep the town-only signature the eight original corpora need.
  defp place_node_path("korean_bbq", _guide_path, place),
    do: korean_bbq_place_path(place["state"], place["county"], place["town"])

  defp place_node_path(corpus, guide_path, place),
    do: place_path_for(corpus, guide_path, place["town"])

  defp oput(%Jason.OrderedObject{values: vs} = obj, key, value) do
    if List.keymember?(vs, key, 0) do
      %{obj | values: List.keyreplace(vs, key, 0, {key, value})}
    else
      %{obj | values: vs ++ [{key, value}]}
    end
  end

  # One roster entry per distinct node the file's UNMIGRATED rows reference. The
  # guide's own node takes the corpus kind; a place node deeper than the guide's
  # is a town inside it — only London produces those.
  #
  # `guide_path` is still passed even when the guide itself contributes no leaf,
  # because it is the depth every place node's kind is measured against.
  defp leaves_from(corpus, guide_path, leaves) do
    leaves
    |> Enum.reject(fn {path, _} -> is_nil(path) end)
    |> Enum.uniq_by(fn {path, _} -> path end)
    |> Enum.map(fn {path, name} ->
      name = name || path |> String.split("/") |> List.last()
      kind = leaf_kind(corpus, path, guide_path)

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

  # A guide node's display name is the guide's own destination label, except
  # for Korean BBQ, whose labels name a dish — see @korean_bbq_guides.
  defp node_name("korean_bbq", guide_town) do
    {_path, name} = Map.fetch!(@korean_bbq_guides, guide_town)
    name
  end

  defp node_name(_corpus, guide_town), do: guide_town

  # Every other corpus is one tier deep and uniform, so its kind is the corpus
  # kind and anything deeper than the guide is a town inside it. Korean BBQ
  # spans four tiers across four countries' worth of shapes, so its kind comes
  # from the shape of the path itself.
  defp leaf_kind("korean_bbq", path, _guide_path) do
    case String.split(path, "/") do
      ["united-states", "new-york", "new-york-city", _borough] -> "borough"
      ["united-states", "new-york", "new-york-city", _borough, _neighborhood] -> "neighborhood"
      ["united-kingdom", "england", "london"] -> "city"
      ["united-kingdom", "england", "london", _borough] -> "borough"
      ["united-states", "california", "san-francisco"] -> "city"
      ["united-states", "california", "san-francisco", _neighborhood] -> "neighborhood"
      [_country, _region, _city] -> "city"
      _ -> raise ArgumentError, "korean_bbq: no kind for node #{inspect(path)}"
    end
  end

  defp leaf_kind(corpus, path, guide_path) do
    if depth(path) > depth(guide_path),
      do: "town",
      else: Map.fetch!(@leaf_kinds, corpus)
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
