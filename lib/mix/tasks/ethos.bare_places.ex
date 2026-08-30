defmodule Mix.Tasks.Ethos.BarePlaces do
  @shortdoc "Prints the roster of bare places (thin summary, no photos, no history) as JSON"

  @moduledoc """
  Prints the bare-place roster to stdout as a JSON array.

      mix ethos.bare_places           # the roster JSON
      mix ethos.bare_places --stats   # the counts only, for calibration

  A place is **bare** when all three hold:

    * its `summary` is under 25 whitespace-separated words — the same
      counting method the seed-data authoring gates use
      (`String.split(~r/\\s+/, trim: true) |> length()`),
    * it has no `photos`,
    * it has no `history`.

  ## Why this only prints

  The roster is a *snapshot* of a work list, committed once at
  `priv/seed_data/bare_places_roster.json` and then consumed by the research
  waves. It is deliberately not a live query: every wave that rewrites a
  summary makes some places stop being bare, so re-running this task later
  produces a *smaller* roster. If the task wrote the file itself, someone
  would eventually "refresh" it mid-programme and silently drop the places
  already researched. It prints; a human commits.

  ## The two place shapes

  Places arrive from two sources with two different key shapes, and conflating
  them has bitten this project before:

    * the `"places"` array of each guide seed file — **string** keys,
    * `Ethos.Seeds.Catalog.places_owned/0` — **atom** keys.

  Both are read through their own accessor below rather than through one
  normalising pass, so a shape change fails loudly on the side that changed.

  ## Where the module list lives, and why it moved

  This task used to name `Ethos.Seeds.ConnecticutPlaces` directly and hardcode
  its region and file, because `test/support/seed_data_helpers.ex` is compiled
  only in `:test` and a Mix task cannot call it. That made this the fifth copy
  of a four-copy list — and the one no gate covers, since a Mix task is not a
  test. A second places module would have been silently omitted from every
  roster this task generates.

  It now reads `Ethos.Seeds.Catalog`, which lives in `lib/` precisely so that
  both this task and test support can reach it. Region and seed file come from
  the owning module rather than from constants here.

  `test/support/seed_data_helpers.ex` still has its own copy of the same glob
  as `seed_files/0` here, for the same compile-environment reason;
  `seed_data_helpers_test` and the roster test between them keep the two
  honest.
  """

  use Mix.Task

  alias Ethos.Seeds.Catalog
  alias Ethos.Seeds.DataGuide

  @seed_data_root "priv/seed_data"

  # priv/seed_data/destinations/ holds destination-page records, which have no
  # `places` array at all — DataGuide.load!/1 raises on them. Excluded by
  # directory, matching Ethos.SeedDataHelpers, so a future non-guide directory
  # fails loudly here instead of being silently skipped.
  @non_guide_dirs ["destinations"]

  @max_summary_words 25

  @impl Mix.Task
  def run(args) do
    # Read once and threaded through both paths. `--stats` reports on exactly
    # the places the roster is built from, and does not re-glob and re-decode
    # all 272 seed files to do it.
    json = load_json_places()
    code = Catalog.places_owned()

    case args do
      [] -> IO.puts(encode(bare_entries(json, code)))
      ["--stats"] -> IO.puts(stats(json, code))
      other -> Mix.raise("unexpected arguments #{inspect(other)} (want none, or --stats)")
    end
  end

  @doc "Every bare place, JSON sources first, then the code-defined ones."
  def roster, do: bare_entries(load_json_places(), Catalog.places_owned())

  @doc "Sorted repo-relative paths of every guide seed file."
  def seed_files do
    @seed_data_root
    |> Path.join("*/*.json")
    |> Path.wildcard()
    |> Enum.reject(&(Path.basename(Path.dirname(&1)) in @non_guide_dirs))
    |> Enum.sort()
  end

  # One line per entry inside the array: valid JSON, but a diff of a later
  # roster shows which places moved rather than one 400-place line.
  defp encode(entries), do: "[\n" <> Enum.map_join(entries, ",\n", &Jason.encode!/1) <> "\n]"

  @doc "Every JSON place paired with the seed file that defines it."
  def load_json_places do
    for file <- seed_files(), place <- DataGuide.load!(file)["places"], do: {file, place}
  end

  defp bare_entries(json, code) do
    for({f, p} <- json, bare?(p["summary"], p["photos"], p["history"]), do: json_entry(f, p)) ++
      for(
        {p, owner} <- code,
        bare?(p[:summary], p[:photos], p[:history]),
        do: code_entry(p, owner)
      )
  end

  defp json_entry(file, place) do
    %{
      "slug" => place["slug"],
      "name" => place["name"],
      "kind" => place["kind"],
      "town" => place["town"],
      "region" => Path.basename(Path.dirname(file)),
      "seed_file" => file
    }
  end

  defp code_entry(place, owner) do
    %{
      "slug" => place.slug,
      "name" => place.name,
      "kind" => place.kind,
      "town" => place.town,
      "region" => owner.region,
      "seed_file" => owner.seed_file
    }
  end

  defp bare?(summary, photos, history),
    do: thin?(summary) and blank?(photos) and blank?(history)

  defp thin?(summary), do: word_count(summary) < @max_summary_words

  defp word_count(nil), do: 0
  defp word_count(text), do: text |> String.split(~r/\s+/, trim: true) |> length()

  defp blank?(nil), do: true
  defp blank?(""), do: true
  defp blank?([]), do: true
  defp blank?(_), do: false

  defp stats(json, code) do
    entries = bare_entries(json, code)

    thin =
      Enum.count(json, fn {_file, place} -> thin?(place["summary"]) end) +
        Enum.count(code, fn {place, _owner} -> thin?(place[:summary]) end)

    """
    summaries under #{@max_summary_words} words: #{thin}
    of those, also photoless and history-less (bare): #{length(entries)}

    by region:
    #{tally(entries, "region")}
    by seed source:
    #{tally(entries, "seed_file", &source_bucket/1)}
    by kind:
    #{tally(entries, "kind")}\
    """
  end

  # Every code-defined module buckets together, matched by directory rather
  # than against one hardcoded filename — that literal silently stopped
  # matching the moment a second places module existed.
  defp source_bucket("lib/" <> _ = _file), do: "code-defined"
  defp source_bucket(file), do: Path.basename(Path.dirname(file))

  defp tally(entries, key, bucket \\ & &1) do
    entries
    |> Enum.frequencies_by(&bucket.(&1[key]))
    |> Enum.sort_by(fn {name, count} -> {-count, name} end)
    |> Enum.map_join("\n", fn {name, count} -> "  #{name}: #{count}" end)
  end
end
