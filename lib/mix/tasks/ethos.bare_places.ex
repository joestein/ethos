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
    * `Ethos.Seeds.ConnecticutPlaces.places/0` — **atom** keys.

  Both are read through their own accessor below rather than through one
  normalising pass, so a shape change fails loudly on the side that changed.

  `test/support/seed_data_helpers.ex` has the same glob as `seed_files/0` here,
  but it is compiled only in `:test`, so it cannot be called from a Mix task.
  The exclusion list is duplicated rather than shared; `seed_data_helpers_test`
  and the roster test between them keep the two honest.
  """

  use Mix.Task

  alias Ethos.Seeds.ConnecticutPlaces
  alias Ethos.Seeds.DataGuide

  @seed_data_root "priv/seed_data"

  # priv/seed_data/destinations/ holds destination-page records, which have no
  # `places` array at all — DataGuide.load!/1 raises on them. Excluded by
  # directory, matching Ethos.SeedDataHelpers, so a future non-guide directory
  # fails loudly here instead of being silently skipped.
  @non_guide_dirs ["destinations"]

  @max_summary_words 25

  @code_seed_file "lib/ethos/seeds/connecticut_places.ex"
  @code_region "connecticut"

  @impl Mix.Task
  def run(args) do
    entries = roster()

    case args do
      ["--stats"] -> IO.puts(stats(entries))
      [] -> IO.puts(encode(entries))
      other -> Mix.raise("unexpected arguments #{inspect(other)} (want none, or --stats)")
    end
  end

  @doc "Every bare place, JSON sources first, then the code-defined ones."
  def roster, do: json_entries() ++ code_entries()

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

  defp json_entries do
    for file <- seed_files(),
        place <- DataGuide.load!(file)["places"],
        bare?(place["summary"], place["photos"], place["history"]) do
      %{
        "slug" => place["slug"],
        "name" => place["name"],
        "kind" => place["kind"],
        "town" => place["town"],
        "region" => Path.basename(Path.dirname(file)),
        "seed_file" => file
      }
    end
  end

  defp code_entries do
    for place <- ConnecticutPlaces.places(),
        bare?(place[:summary], place[:photos], place[:history]) do
      %{
        "slug" => place.slug,
        "name" => place.name,
        "kind" => place.kind,
        "town" => place.town,
        "region" => @code_region,
        "seed_file" => @code_seed_file
      }
    end
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

  defp stats(entries) do
    thin =
      Enum.count(json_places(), &thin?(&1["summary"])) +
        Enum.count(ConnecticutPlaces.places(), &thin?(&1[:summary]))

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

  defp json_places, do: Enum.flat_map(seed_files(), &DataGuide.load!(&1)["places"])

  defp source_bucket(@code_seed_file), do: "code-defined"
  defp source_bucket(file), do: Path.basename(Path.dirname(file))

  defp tally(entries, key, bucket \\ & &1) do
    entries
    |> Enum.frequencies_by(&bucket.(&1[key]))
    |> Enum.sort_by(fn {name, count} -> {-count, name} end)
    |> Enum.map_join("\n", fn {name, count} -> "  #{name}: #{count}" end)
  end
end
