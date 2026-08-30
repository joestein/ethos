defmodule Ethos.Seeds.PlaceContentGateTest do
  @moduledoc """
  The content gate every research wave must pass.

  ## There is no minimum word count here, and none may be added

  A length floor is the obvious way to enforce "no more thin summaries", and it
  would manufacture the exact defect this gate exists to ban: roughly twenty
  summaries in this corpus read as inspection-record boilerplate *because
  something had to fill the space*. The two content assertions below ban
  **patterns**, not brevity. A seven-word summary that says the one true thing
  is a pass.

  ## The content assertions cover every string, not just `summary`

  Both patterns are checked against every string in every seed source — place
  `summary` and `history`, guide `intro`, section `body`, FAQ `question` and
  `answer`, entry `note`, link `note`, and anything a later format adds. See
  `collect_strings/2` below for why the fields are walked rather than named.

  ## Why two of these are excluded by default

  The two content assertions carry `@tag :pending_wave`, excluded in
  `test/test_helper.exs`. They fail on today's corpus — that is the gate
  working, and those failures are the work list the research waves consume. A
  red baseline would make every later task's test run ambiguous: an implementer
  could not tell their own regression from the expected failure. Re-enable them
  (delete the tags and the exclusion) once the waves have rewritten the prose.

  Run them meanwhile with:

      mix test test/ethos/seeds/place_content_gate_test.exs --include pending_wave

  The other two assertions pass today and run by default. They protect the
  deletion machinery while the waves are in flight.
  """
  use ExUnit.Case, async: true

  alias Ethos.Places.DeletedPlaces
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Inspection records may support a `status` verdict. They may never appear in
  # prose — 20 summaries in this corpus read as boilerplate precisely because
  # that rule did not exist when they were written.
  #
  # This bans the **practice**, not one phrasing of it. The first version of
  # this pattern listed three phrasings and missed "inspected by the city in
  # August 2025", "City health records show...", "City health department records
  # show it inspected...", "restaurant-inspection data" and a bare "graded A in
  # July 2026" — 33 fields across nine files, most of the actual problem. Every
  # alternative below was derived by surveying what the corpus really says, not
  # by guessing; a phrasing nobody has written yet is cheap to add, but a
  # phrasing already in the corpus and not listed here is a hole.
  #
  # ## The grade letter is case-sensitive on purpose
  #
  # `(?-i:[A-C])` inside an otherwise case-insensitive pattern is the whole
  # reason this does not cry wolf. A case-insensitive `[a-c]\s+grade` matches
  # the indefinite article in "a grade-separated right-of-way" (Cobble Hill,
  # Berlin) and "the original at-grade station" (Homecrest) — five hits in this
  # corpus, all legitimate railway and roadway prose, none of them an inspection
  # grade. A bare `grade` is worse still: it fires inside "accessibility
  # upgrades". Requiring a capital A-C keeps "graded A in July 2026" caught and
  # every one of those clean. A gate that cries wolf gets excluded, and this one
  # is already excluded once.
  #
  # Deliberately NOT included, having been considered and rejected:
  #   * bare `grade` / case-insensitive grade letters — see above.
  #   * `hygiene` — its only two occurrences are Bridgeport's "first dental
  #     hygiene school in 1949". Zero true positives.
  #   * bare `inspected` — too close to legitimate prose about inspecting
  #     anything else; the date-anchored alternative below covers the real
  #     phrasings without reaching that far.
  #   * `DOHMH` — appears nowhere in the corpus prose. Harmless to add, but a
  #     bare agency acronym could legitimately be cited in a note about the
  #     agency itself rather than about a place's record.
  @inspection ~r/
      inspection[-\s]records?
    | restaurant[-\s]inspection
    | inspections?\s+dated
    | inspected\s+by\s+the\s+city
    | health[-\s]department\s+(?:records?|inspection)
    | city(?:'s)?\s+health\s+records?
    | health\s+inspection
    | inspection\s+history
    | (?:re-)?inspect(?:ed|ion)s?\b[^.]{0,25}\b(?:on|in)\s+(?:\d|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)
    | (?:shows?|showing)\s+it\s+inspected
    | \bgrade[ds]?\s+(?-i:[A-C])\b
    | \b(?-i:[A-C])\s+grade\b
  /ix

  # "A restaurant on Bath Avenue, at number 1806." — a stub wearing a sentence.
  @stub ~r/^A [a-z][a-z -]* (?:on|at) [^,]+,\s*at number \d+\.?$/

  # Places arrive in two key shapes, and conflating them has bitten this project
  # before: the `"places"` array of each guide seed file has **string** keys,
  # while `SeedDataHelpers.code_places/0` yields **atom**-keyed maps. A
  # string-key read of those records silently yields nil for every field, which
  # would make this gate pass over them in silence. Following the precedent of
  # `Mix.Tasks.Ethos.BarePlaces`, each source is read through its own accessor
  # rather than through one normalising pass.
  #
  # Note also that this comprehension has no filters. In Elixir a comprehension
  # binding is *also* a truthiness test, so `summary = p["summary"]` would
  # silently drop every place with a nil summary — the elements an assertion
  # about slugs most needs to see. Every filter lives in the tests below where
  # it reads as a filter.
  defp corpus_slugs do
    json =
      for f <- SeedDataHelpers.all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          do: p["slug"]

    code = for {p, _owner} <- SeedDataHelpers.code_places(), do: p[:slug]

    MapSet.new(json ++ code)
  end

  # --- Every prose field, not just `summary` ------------------------------
  #
  # A ban on a phrase that covers only `summary` is not a ban, it is a
  # preference. `madison.json` proved it: eight summaries were rewritten to
  # drop the DOHMH boilerplate while the section body one field away still
  # read "Each is carried in the city's restaurant inspection records at its
  # address, with an inspection dated 2025 or 2026." Same file, same banned
  # phrase, invisible to a summary-only gate.
  #
  # So this walks the decoded structure and gathers every string, exactly as
  # `Ethos.Seeds.BrooklynSeedDataTest` does for the trip-duration ban, rather
  # than enumerating field paths. An enumerated list — summary, history, intro,
  # body, question, answer, note — is a list someone forgets to extend the day
  # a new prose field is added to the seed format, and the gate goes quiet
  # about it. The walk cannot go quiet; a new field is covered the moment it
  # holds a string.
  #
  # This also sweeps fields that are not prose at all (slug, address,
  # official_url, photo source_url). That is deliberate: both patterns are
  # narrow enough that a URL or a slug cannot match one, so the cost of the
  # over-broad sweep is nil and the cost of guessing wrong about which fields
  # are "prose" is a hole.
  defp collect_strings(term, path \\ "")

  defp collect_strings(map, path) when is_map(map) do
    Enum.flat_map(map, fn {k, v} ->
      sep = if path == "", do: "", else: "."
      collect_strings(v, "#{path}#{sep}#{k}")
    end)
  end

  defp collect_strings(list, path) when is_list(list) do
    list
    |> Enum.with_index()
    |> Enum.flat_map(fn {v, i} -> collect_strings(v, "#{path}[#{i}]") end)
  end

  defp collect_strings(s, path) when is_binary(s), do: [{path, s}]
  defp collect_strings(_other, _path), do: []

  # `DataGuide.load!/1` is called inside the generator rather than bound as
  # `data = DataGuide.load!(f)`, because a binding in a comprehension is also a
  # truthiness test — the hazard this project has shipped twice. A generator
  # cannot silently drop an element the way a falsy binding can.
  defp prose do
    json =
      for f <- SeedDataHelpers.all_seed_files(),
          {path, text} <- collect_strings(DataGuide.load!(f)),
          do: {Path.basename(f), path, text}

    # Keyed on the record's own slug rather than a list index, so a failure
    # message names the place a reader can go and find — and on its owning
    # module's file, so a hit in a second places module does not read as a hit
    # in the first.
    code =
      for {p, owner} <- SeedDataHelpers.code_places(),
          {path, text} <- collect_strings(p, to_string(p[:slug])),
          do: {Path.basename(owner.seed_file), path, text}

    json ++ code
  end

  @tag :pending_wave
  test "no seed prose repeats inspection-record boilerplate" do
    hits =
      for {file, path, text} <- prose(),
          Regex.match?(@inspection, text),
          do: {file, path}

    assert hits == [],
           "inspection-record prose in #{length(hits)} fields: #{inspect(hits)}"
  end

  @tag :pending_wave
  test "no seed prose is a bare address stub" do
    hits =
      for {file, path, text} <- prose(),
          Regex.match?(@stub, String.trim(text)),
          do: {file, path}

    assert hits == [], "bare address stubs in #{length(hits)} fields: #{inspect(hits)}"
  end

  test "every guide entry points at a place that exists" do
    slugs = corpus_slugs()

    orphans =
      for f <- SeedDataHelpers.all_seed_files(),
          e <- DataGuide.load!(f)["entries"] || [],
          slug = e["place_slug"] || "",
          slug != "",
          not MapSet.member?(slugs, slug),
          do: {slug, Path.basename(f)}

    assert orphans == [],
           "guide entries point at places that do not exist: #{inspect(orphans)}"
  end

  test "a deleted place is gone from the corpus, and a corpus place is not marked deleted" do
    both = MapSet.intersection(corpus_slugs(), DeletedPlaces.slugs())

    assert MapSet.size(both) == 0,
           """
           slugs both live in the corpus and listed as deleted: \
           #{inspect(MapSet.to_list(both))}

           Removing a place and recording it as deleted are two halves of ONE
           change: delete it from its seed file AND add it to
           priv/seed_data/deleted_places.json. The half above is missing.

           This is not cosmetic. Ethos.Release.prune_deleted_places/0 runs after
           seeding, and seeding is upsert-only — so a manifest entry whose place
           is still in a seed file gets re-created by every seed run and deleted
           again by every prune, indefinitely. Drop these slugs from their seed
           files, or drop them from the manifest.\
           """
  end
end
