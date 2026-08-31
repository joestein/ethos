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

  Both patterns are checked against every string in all three halves of the
  corpus — every JSON seed file, every code-defined places module, and every
  code-defined guide module. Place `summary` and `history`, guide `intro`,
  section `body`, FAQ `question` and `answer`, entry `note`, link `note`, and
  anything a later format adds. See `collect_strings/2` below for why the
  fields are walked rather than named, and `prose/0` for the three sources.

  **The third of those was missing until a defect found it.** `prose/0` walked
  the JSON files and `code_places/0` and stopped, so thirty-seven guide
  modules — every Connecticut town guide, the Antique Trail, Rome and thirty
  ballparks — were outside this gate entirely. A banned phrase in
  `yankee_stadium_places.ex` failed here while six strings carrying the
  identical sentence in `yankee_stadium_guide.ex` passed. The fix is
  `Ethos.Seeds.Catalog.guides_owned/0`, driven from the catalog rather than
  from a list in this file, so a guide module added tomorrow is scanned
  without anyone remembering this gate exists.

  ## Why two of these are excluded by default

  The two content assertions carry `@tag :pending_wave`, excluded in
  `test/test_helper.exs`. They fail on today's corpus — that is the gate
  working, and those failures are the work list the research waves consume. A
  red baseline would make every later task's test run ambiguous: an implementer
  could not tell their own regression from the expected failure. Re-enable them
  (delete the tags and the exclusion) once the waves have rewritten the prose.

  Run them meanwhile with:

      mix test test/ethos/seeds/place_content_gate_test.exs --include pending_wave

  The other four assertions pass today and run by default: two protect the
  deletion machinery while the waves are in flight, and two hold the
  inspection pattern set itself in place — one specimen per alternative, plus
  the corpus sentences a rejected candidate would have broken. Those two
  inspect the patterns rather than the corpus, so they are green today and
  must never be tagged.

  ## A pattern set tuned to the corpus is a pattern set with the corpus's
  ## blind spots

  The comment on `@inspection` says every alternative was derived by surveying
  what the corpus really says. That is the right method and it has one failure
  mode, which this file has already been bitten by: it cannot see a phrasing
  nobody had written yet. Three summaries in
  `lib/ethos/seeds/yankee_stadium_places.ex` published a food-inspection record
  in prose with the word "inspection" and the grade letter deliberately
  removed, and no alternative here matched them. Widening the set is therefore
  not a tidy-up — it is the maintenance this method requires. Measure any new
  alternative over the whole corpus before adding it, record the count, and
  give it a specimen.
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
  # ## The four alternatives that name the record without naming inspection
  #
  # The first eleven alternatives all contain the word "inspection", a grade
  # letter, or "health". An author who strips those three things can publish
  # the whole record anyway, and one did: `yankee_stadium_places.ex` shipped
  # three summaries reading "carried under American cuisine on New York City's
  # public restaurant dataset, in a row dated October 29, 2025", and the same
  # file's moduledoc claimed the records "stop there". A grep for "inspection"
  # found nothing. Every pattern above passed over it.
  #
  # So the last four alternatives ban the record's other three identifying
  # marks — the dataset it came from, the row's date, and the cuisine field —
  # rather than the word for the act. Each was measured over every string in
  # `priv/seed_data/*/*.json` plus every string literal in
  # `lib/ethos/seeds/*.ex` before being kept; counts are per alternative,
  # corpus-visible fields first:
  #
  #   * `restaurant[-\s]data(?:set|base)?` — 3 fields, all three the defect.
  #   * `\brows?\s+dated\b` — 3 fields, all three the defect. Adjacency is the
  #     whole narrowing: bare `\brow\b` is 73 fields of rowhouses, row of
  #     brownstones and Chinatown's Mott Street row, and "a row of brownstones
  #     dated to 1890" still passes because "row" and "dated" are not adjacent.
  #   * `carried\s+under…cuisine` — 2 fields, both the defect.
  #   * `\bcuisine\s+category\b` — 0 fields. Prophylactic, and cheap by the
  #     rule above: it is the dataset's own field name written out in plain
  #     words, which is where an author goes once the three phrasings that do
  #     exist are closed.
  #
  # Deliberately NOT included, having been considered and rejected:
  #   * bare `grade` / case-insensitive grade letters — see above.
  #   * `hygiene` — its only two occurrences are Bridgeport's "first dental
  #     hygiene school in 1949". Zero true positives.
  #   * bare `inspected` — too close to legitimate prose about inspecting
  #     anything else; the date-anchored alternative below covers the real
  #     phrasings without reaching that far. Shelton's farmers-market summary
  #     ("Vendors are inspected to confirm they are growers") is the live
  #     false positive it would take.
  #   * `DOHMH` — appears nowhere in the corpus prose. Harmless to add, but a
  #     bare agency acronym could legitimately be cited in a note about the
  #     agency itself rather than about a place's record.
  #   * bare `\bdataset\b` — 8 fields, and 5 of them legitimate: Homecrest's
  #     and Madison's "query of the city's property dataset for ZIP code
  #     11229", and three Fenway summaries citing "the City of Boston's Active
  #     Food Establishment Licenses dataset". A licence register is not an
  #     inspection record, and citing one is how a third of the ballpark
  #     corpus establishes an address.
  #   * `public\s+restaurant` — 4 fields, and Bloomfield's "The public
  #     restaurant at Wintonbury Hills Golf Course" is one of them. The word
  #     "public" is doing no work; `restaurant data` catches the same three
  #     without it.
  #   * `open\s+data` — 4 fields, every one legitimate NYC open data
  #     provenance for a park or a property (Gravesend x3, Homecrest x1).
  #   * `\bregistry\b` — 5 fields, every one Oracle Park citing the San
  #     Francisco business registry.
  #   * `\bdatabase\b` — 1 field, the James Beard entry for Versailles.
  #   * widening the cuisine alternative to `carried\s+under…(cuisine|category)`
  #     — 3 fields today and no false positive, but `category` is a word this
  #     corpus uses for NYC Parks' `typecategory` ("carried under the
  #     Neighborhood Park category"), and a gate one plausible sentence away
  #     from an allowlist is a gate that gets one. `cuisine` is food-specific
  #     and the third summary is caught by the two alternatives above anyway.
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
    | restaurant[-\s]data(?:set|base)?\b
    | \brows?\s+dated\b
    | carried\s+under\b[^.]{0,40}\bcuisine\b
    | \bcuisine\s+category\b
  /ix

  # One specimen per alternative, labelled rather than indexed because
  # `@inspection` is one regex and not a list.
  #
  # It still makes each alternative individually load-bearing, by the same
  # mechanism the Bronx gate's indexed specimens use: every specimen below was
  # checked to fire **exactly one** alternative and no other, so deleting or
  # weakening that alternative makes `Regex.match?/2` return false on its own
  # line. Without this the fifteen are load-bearing only in aggregate — today's
  # corpus fires five of them, so ten could be deleted wholesale and this suite
  # would stay green. That is the state this gate was in when the Yankee
  # Stadium summaries were written, and it is why they were written.
  #
  # `(?:shows?|showing)\s+it\s+inspected` has no specimen and no label of its
  # own: it is wholly contained by the date-anchored alternative below it for
  # every phrasing that carries a date, and the two are listed separately for
  # readability. If it is given a specimen it must be one no other alternative
  # catches, or the specimen proves nothing.
  @inspection_specimens [
    {"inspection-records", "the shop appears in the city's inspection records"},
    {"restaurant-inspection", "a restaurant inspection is evidence, not a sentence"},
    {"inspection-dated", "the address carries an inspection dated July 9"},
    {"inspected-by-the-city", "a bakery inspected by the city, and nothing else"},
    {"health-department", "health department records show the same address"},
    {"city-health-records", "the city's health records carry this address"},
    {"health-inspection", "a health inspection supports a status, not a summary"},
    {"inspection-history", "its inspection history is not published here"},
    {"inspected-on-a-date", "the stall was inspected in August 2025"},
    {"graded-letter", "the counter was graded A in July 2026"},
    {"letter-grade", "the diner holds an A grade"},
    {"restaurant-dataset", "carried on the city's public restaurant dataset"},
    {"row-dated", "in a row dated October 29, 2025"},
    {"carried-under-cuisine", "carried under American cuisine at that address"},
    {"cuisine-category", "the record gives only its cuisine category"}
  ]

  # The other half of the tuning, and the half that decides whether this gate
  # survives: a pattern that fires on legitimate prose gets excluded, and an
  # excluded gate is not a gate — this one is already excluded once.
  #
  # Every string here is a real or near-real corpus sentence that a rejected
  # candidate above WOULD have failed. They are asserted so that re-proposing
  # one of those candidates fails here with the sentence it would break,
  # instead of failing three waves later as a mystery in someone else's file.
  @publishable_prose [
    # `\bdataset\b` — Homecrest's and Madison's hotel FAQ.
    "A query of the city's property dataset for ZIP code 11229 returned no property carrying a hotel building class.",
    # `\bdataset\b` — Fenway's licence-register provenance, three summaries.
    "the City of Boston's Active Food Establishment Licenses dataset carries a Food Service licence for \"Cask N Flagon\"",
    # `public\s+restaurant` — Bloomfield.
    "The public restaurant at Wintonbury Hills Golf Course, serving breakfast, lunch, dinner and snacks.",
    # `open\s+data` — Gravesend.
    "NYC open data files it under Community Board 13 and sources associate it with Bath Beach.",
    # `\bregistry\b` — Oracle Park.
    "Red's Java House Inc has been on the San Francisco business registry at Pier 40 since 1997.",
    # Case-insensitive grade letters — Cobble Hill and Homecrest.
    "a grade-separated right-of-way to South Ferry",
    "the original at-grade station at Avenue U opened on the surface Brighton Beach Railroad",
    # Bare `grade` — it hides inside this word.
    "NYC Parks opened $5.4 million of accessibility upgrades to the playground.",
    # Bare `inspected` — Shelton's farmers market.
    "Vendors are inspected to confirm they are growers selling their own produce, not resellers.",
    # Bare `\brow\b`, and the adjacency narrowing on `rows? dated`.
    "a row of brownstones dated by the landmarks commission to 1890",
    # The rejected `category` widening, and a parks-dataset attribution.
    "the park is carried under the Neighborhood Park category by NYC Parks",
    "It is a Neighborhood Park in the parks properties dataset, 0.553 acres."
  ]

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

    # Code-defined guides. Added late, and the reason is the whole point of
    # this gate: a phrase banned in `yankee_stadium_places.ex` and caught there
    # sat in six strings of `yankee_stadium_guide.ex` with the suite green,
    # because the two walks above are the only two that existed. Thirty-seven
    # guide modules — every Connecticut town guide, the Antique Trail, Rome and
    # thirty ballparks — published intros, section bodies, FAQ answers and
    # entry notes no corpus gate had ever read.
    #
    # Keyed on the guide's own slug for the same reason the places walk is
    # keyed on a place's, and driven from `Ethos.Seeds.Catalog` rather than a
    # list here, so a guide module added tomorrow is scanned without anyone
    # remembering this file exists.
    guides =
      for {data, owner} <- SeedDataHelpers.code_guides(),
          {path, text} <- collect_strings(data, to_string(data[:slug])),
          do: {Path.basename(owner.seed_file), path, text}

    json ++ code ++ guides
  end

  # --- Each alternative is individually load-bearing ----------------------
  #
  # These two run by default. They inspect the patterns, not the corpus, so
  # they are unaffected by the waves still owed and must never carry
  # `:pending_wave` — the whole point is that they stay green while the
  # corpus assertions below are excluded, and fail the moment the pattern set
  # is weakened.

  test "each inspection alternative is individually load-bearing" do
    labels = Enum.map(@inspection_specimens, &elem(&1, 0))

    assert labels == Enum.uniq(labels),
           "duplicate specimen labels leave an alternative unguarded: #{inspect(labels)}"

    for {label, specimen} <- @inspection_specimens do
      assert Regex.match?(@inspection, specimen),
             "the #{label} alternative no longer catches #{inspect(specimen)}. Each specimen " <>
               "fires exactly one alternative, so this failure names the alternative that was " <>
               "deleted or narrowed. Do not fix it by editing the specimen — measure the " <>
               "replacement pattern over priv/seed_data/*/*.json and lib/ethos/seeds/*.ex first, " <>
               "as the rejected-candidate list above records for every pattern not here."
    end
  end

  test "legitimate prose still publishes" do
    for text <- @publishable_prose do
      refute Regex.match?(@inspection, text),
             "the inspection ban fires on prose this corpus legitimately publishes: " <>
               "#{inspect(text)}. A licence register, an open-data property query, a railway " <>
               "grade separation and a farmers market inspecting its growers are none of them " <>
               "an inspection record in a place's summary. A gate that cries wolf gets " <>
               "excluded, and this one is already excluded once."
    end
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
