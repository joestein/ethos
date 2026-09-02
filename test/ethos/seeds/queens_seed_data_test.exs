defmodule Ethos.Seeds.QueensSeedDataTest do
  @moduledoc """
  The per-directory gate every Queens research wave must pass.

  It is written before the corpus it guards, and before the research that
  will fill that corpus is even scheduled — which is the point twice over.
  A gate written after the content is a gate tuned to the content; a gate
  written while the decisions are fresh is one that records them.

  ## This gate does not run yet

  The whole module carries `@moduletag :pending_queens` and
  `priv/seed_data/queens/` holds only `.gitkeep`. Nothing here executes.

  That is deliberate, not an oversight. The non-vacuity floors below
  (`assert files != []` and friends) fail by construction over an empty
  directory, and so does the roster equality. A gate that is red because
  there is nothing to check yet is noise a later implementer cannot
  distinguish from their own regression.

  **Nothing in this file may be described as enforced until the moduletag
  comes off.** The trip-duration and vague-proximity patterns ARE enforced
  today — but by `destination_seed_data_test.exs` and
  `bronx_seed_data_test.exs`, which run. This copy adds no coverage while
  dormant; it adds a reviewed record of the Queens-specific decisions.

  That "no coverage" is true with exactly one exception, named here because a
  blanket claim of dormancy is the kind that stops being true quietly: **"the
  Citi Field place list this gate guards is still accurate" has no
  seed-directory dependency and would pass today.** It reads
  `Ethos.Seeds.CitiFieldPlaces` and a literal list, and the whole-module tag
  switches it off along with everything that genuinely cannot run — so this
  module is, for the duration, one live assertion short of what it could be.
  The same now goes for its sibling on `@code_owned_queens_guides`. Accepted:
  splitting two tests into their own file to buy back that coverage costs a
  second file and a second place to look, for a list that changes when
  `citi_field_places.ex` changes and at no other time. Do not describe the
  no-re-creation rule as guarded until the moduletag comes off.

  ## Which tag comes off when

  * **The first Queens research wave** lands the first seed file and deletes
    the `@moduletag` line above. Every corpus-scanning test here becomes
    meaningful at that moment, and the floors become checks rather than
    tripwires.
  * **The wave that lands `flushing.json`** — wave 5 of 12 on the current
    roster, NOT the final wave — deletes the `@tag :pending_queens` on the
    Flushing destination-string assertion. That test self-guards on
    `File.exists?`, so it cannot pass before its subject ships and has nothing
    left to wait for after; and the co-listing invariant it checks is the
    stated reason this scaffolding was written ahead of the research. Holding
    it for seven further waves would defeat that reason.
  * **The last in-scope wave** — 21 neighborhoods, not the full 111 — deletes
    the two remaining `@tag :pending_queens` lines — roster equality and
    marquee institutions, both of which genuinely need the whole corpus — and
    the `:pending_queens` entry in `test/test_helper.exs`. The tags go; the
    tests stay and start running. The programme narrowed on 2026-08-31; see
    docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md.

  `:pending_queens` is deliberately a THIRD tag, not shared with
  `:pending_bronx` or `:pending_wave`. `:pending_wave` belongs to the
  place-research backlog, which still owes 320 places; `:pending_bronx`
  belongs to a programme that is mid-flight with 13 in-scope neighborhoods
  left.
  Sharing a tag across programmes means whichever finishes first either
  cannot delete it or, deleting it, un-excludes an unrelated gate that fails
  on defects it never touched.

  ## Where each part came from

  Ported wholesale from `test/ethos/seeds/bronx_seed_data_test.exs`, which is
  the strongest of the several copies of these patterns: it carries the
  eleven trip-duration patterns WITH the `@trip_duration_specimens` that
  prove each individually load-bearing, and the ballpark programme's nine
  vague-proximity patterns with their must-pass list of sourced spatial
  claims. `brooklyn_seed_data_test.exs` carries the same eleven patterns and
  no specimens; its own comment records that patterns 4 through 11 could be
  deleted there and the suite would stay green. Nobody should port from it.

  What is NOT ported is listed in the sections below: the transit modes, the
  marquee list, the park-duplication prefixes, and the county-count
  assertion, which needed a real change rather than a rename.
  """
  use Ethos.DataCase, async: false

  # The module tag that stood here is gone, deleted 2026-09-01 by the first
  # Queens research wave exactly as the moduledoc above specifies: astoria.json,
  # ditmars-steinway.json and long-island-city.json landed together, so
  # priv/seed_data/queens/ is no longer empty and every corpus-scanning
  # assertion below is now a real check rather than a tripwire over nothing.
  #
  # Three `@tag :pending_queens` lines remain further down and are NOT touched
  # here — they come off on their own schedule, which the moduledoc records:
  # the Flushing destination-string assertion when wave 5 lands flushing.json,
  # and roster equality and marquee institutions when the last in-scope wave
  # lands, since both genuinely need the whole corpus. The `:pending_queens`
  # entry in test/test_helper.exs stays until then too, which is what keeps
  # those three excluded now that the module itself runs.

  import Ethos.AccountsFixtures
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/queens_photo_manifest.json", __DIR__)
  @roster_path Path.expand("../../../priv/seed_data/queens_roster.json", __DIR__)
  @seed_dir Path.expand("../../../priv/seed_data/queens", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/queens_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("queens")
  defp fixture(name), do: Path.join(@fixture_dir, name)
  defp fixtures, do: @fixture_dir |> Path.join("*.json") |> Path.wildcard() |> Enum.sort()

  defp roster_rows,
    do: @roster_path |> File.read!() |> Jason.decode!() |> Map.fetch!("neighborhoods")

  # The reference set the roster-equality gate measures the corpus against.
  # Extracted so that the untagged guard below and the tagged gate share ONE
  # definition: a guard reading the roster itself would stay green after the
  # filter here was deleted, which is the exact revert it exists to catch.
  defp in_scope_slugs,
    do: roster_rows() |> Enum.filter(& &1["in_scope"]) |> MapSet.new(& &1["slug"])

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  # --- Trip-duration ban -------------------------------------------------
  #
  # Copied verbatim from test/ethos/seeds/destination_seed_data_test.exs. Do
  # not re-derive, condense or "improve" one of these: a subtly weaker pattern
  # is exactly the failure the gate exists to prevent, and it does not show up
  # as a test failure.
  #
  # The rule is that a page may not state how long a journey takes. Durations
  # decay — they vary by time of day, change with every service revision, and
  # no research artifact supports them. That rule was written into every
  # Connecticut wave's dispatch and checked in every review, and it still
  # leaked 58 claims across 28 committed files onto the live public site before
  # a mechanical gate caught them. A duration claim can hide in any of six
  # places a reviewer reads separately — the intro, a section body, an FAQ
  # answer, a place summary, a photo description, or a link note — so this
  # walks every string value in every seed file rather than the transit section
  # alone.
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minutes?\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    # `walk` and `stroll` are in 8 and 9 because "a short walk from the
    # station" — the plainest vague-duration phrasing there is, and the
    # likeliest one for a walkable neighborhood — escaped every duration gate
    # in the repo until they were added.
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute|walk|stroll)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip|walk|stroll)\b/i,
    ~r/\b(?:reaches|gets you to|puts you in|takes you to)\b[^.]{0,40}\bin\s+(?:about\s+)?\d+/i,
    # "...in 25 minutes" / "...in about 2 hours" — the plainest way to state
    # the banned claim, and it escaped all ten of the patterns above: 1 was
    # singular-only, 2 needs a direction or mode word AFTER the duration,
    # 3 needs a hedge BEFORE it, 7 is spelled-out numbers only, and 10 needs
    # one of its four specific verbs ("runs to" is not among them). Pattern 1
    # is now plural-tolerant, which closes the minutes half; this closes the
    # hours half, which 6 catches only when a mode word follows.
    #
    # Deliberately anchored on a preceding "in" rather than a bare
    # \b\d+\s*hours?\b, because the bare form fires on "open 24 hours" — a
    # legitimate and common thing to say about a diner.
    ~r/\bin\s+(?:about|roughly|around|under|over|just|only)?\s*\d+\s*hours?\b/i
  ]

  # Confirmed false positives, keyed on {file, json path, matched phrase} and
  # applied AFTER the regex runs, so only that exact phrase is pardoned in that
  # one string — a genuine duration claim appended to the same field still
  # fails. Keying on {file, path} alone would excuse the entire string.
  #
  # Entries here are for durations that are NOT travel claims: a ride's run
  # time, a tour's length, a ferry crossing stated as a scheduled service fact
  # from a cited source. Every entry needs a manual read and a reason. Start
  # empty; waves add entries with justification in their wave reports.
  @trip_duration_allowlist []

  # One specimen per pattern, in the order the patterns are listed above.
  #
  # Without these the eleven are load-bearing only in aggregate: the
  # trip_duration.json fixture fires patterns 1, 2 and 3, so 4 through 11 could
  # be deleted wholesale, or quietly weakened, and this suite would stay green.
  # That is the state the Brooklyn gate is in. An unenforced rule is what put
  # 58 decaying travel-time claims on the live site.
  #
  # Carried over verbatim with the patterns, Connecticut phrasing and all,
  # rather than restated in Queens terms: byte-identity with the copy these were
  # tuned against is checkable by reading two files side by side, and a
  # rewritten specimen is a silent chance to pick a phrase the pattern happens
  # to catch for a different reason.
  #
  # Each specimen is a phrasing that ONLY its own pattern was written to catch —
  # other patterns may also fire on it, which is the detector overlapping by
  # design, but the assertion is indexed so deleting or weakening any single
  # pattern fails on that pattern's own line.
  @trip_duration_specimens [
    {1, "the museum is a 15-minute walk from the green"},
    {2, "the shoreline sits 20 mins south of the state line"},
    {3, "the ferry landing is about 40 min from the village"},
    {4, "the county seat is half an hour by car from the coast"},
    {5, "a drive of about 25 min separates the two greens"},
    {6, "the northwest hills are 3 hours away by car"},
    {7, "the depot stands twenty minutes north of downtown"},
    {8, "the falls are a short drive from the village center"},
    {9, "the museum is within a short drive of the campus"},
    {10, "the branch line reaches New Haven in about 45"},
    {11, "the coastal road covers the same ground in about 2 hours"}
  ]

  # --- Vague-proximity ban ------------------------------------------------
  #
  # Ported from test/ethos/seeds/ballpark_seed_data_test.exs, where it was
  # tuned against the whole corpus rather than against imagination: every
  # candidate was measured over all seed files before being kept or dropped,
  # because an over-broad gate gets excluded and an excluded gate is not a
  # gate. Repo-wide hit counts at the time of tuning are recorded per pattern.
  #
  # The rule: a spatial relationship is publishable when it is checkable — a
  # street name, a road number, a compass direction, a distance in miles, a
  # street number on a grid, a bordering relationship. It is not publishable as
  # an unmeasurable gesture. "about one-half mile to the west on Irving Park
  # Road" passes; "west of the ballpark" does not.
  #
  # REJECTED CANDIDATES, kept here with their measurements so nobody
  # re-proposes them: bare `\d+ blocks` (49 repo-wide; cannot tell a proximity
  # claim from a dimension or a name); `across from` (16, and it is the wording
  # of a confirmed verdict); `just across` (11, same); bare `across the street`
  # (fires on a sourced line describing an arrangement within one street);
  # `just (north|south|east|west) of` (18, all legitimate — a direction
  # relative to a NAMED place is a bordering relationship); `(north|south|
  # east|west) of the \w+` (27, all legitimate, because "the" is part of the
  # proper name); `nearby|close by|not far` (474 — and `nearby` is a link
  # `kind` in the seed schema).
  #
  # WHAT THIS DOES NOT CATCH, stated plainly so nobody reads it as complete: an
  # unsourced *containment* claim in ordinary prose ("Both are in Astoria")
  # names a real neighborhood in a form indistinguishable from the sourced
  # sentence one clause earlier. Catching that needs the claim checked against
  # the artifact, not the sentence matched against a pattern. Say so in the
  # dispatch rather than implying the gate covers it.
  @proximity_patterns [
    # 11 repo-wide. Direction-bearing block counts only; see rejected list.
    ~r/\b(?:\d+|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)[-\s]blocks?\s+(?:north|south|east|west|away|up|down|over)\b/i,
    # 18 repo-wide. Adjacency nothing sources.
    ~r/\bnext door\b/i,
    # 0 repo-wide in this narrowed form.
    ~r/\bacross the street from\b/i,
    # 0 repo-wide.
    ~r/\ba few doors\s+(?:down|away|up)\b/i,
    # 0 repo-wide. A closed list of generic nouns, so a direction relative to a
    # named feature ("north of Grace Street") still publishes.
    ~r/\b(?:north|south|east|west)\s+of\s+the\s+(?:ballpark|stadium|arena|venue|site|station)\b/i,
    # 18 repo-wide. An unmeasurable distance by construction.
    ~r/\b(?:steps|a stone's throw|moments)\s+(?:from|away)\b/i,
    # 1 repo-wide. Case-SENSITIVE and lowercase on purpose: the other matches
    # are a proper name, Manhattan's "Little Church Around the Corner". It
    # costs a capitalised sentence-initial instance, which is the cheaper miss.
    ~r/(?-i:around the corner)/,
    # 1 repo-wide.
    ~r/\b(?:down|up)\s+the\s+(?:street|road|block)\b/i,
    # 9 repo-wide. A duration wearing a distance's clothes.
    ~r/\bwithin walking distance\b/i
  ]

  # Starts empty and is empty. Keyed {file, path, phrase}, the narrow form —
  # pardoning a phrase in one place summary must not pardon it in the intro.
  #
  # Before adding an entry, check whether the clause is sourced at all. Every
  # candidate so far was either unsourced (delete it) or already excluded by a
  # narrowed pattern above.
  @proximity_allowlist []

  # One specimen per pattern, in order, carried verbatim with the patterns for
  # the same reason the duration specimens are. Without these the nine are
  # load-bearing only in aggregate: a corpus that fires none of them lets any
  # subset be deleted or weakened with the suite staying green.
  @proximity_specimens [
    {1, "the lounge is nine blocks south of the marquee"},
    {2, "the tavern is next door to the music venue"},
    {3, "the grill is across the street from the bleachers"},
    {4, "the shop is a few doors down from the gate"},
    {5, "the cinema is west of the ballpark"},
    {6, "the hotel is steps from the entrance"},
    {7, "the bar is around the corner"},
    {8, "the diner is down the street"},
    {9, "the museum is within walking distance"}
  ]

  # Sourced spatial claims that MUST keep publishing. A gate that fails these
  # is banning the checkable form along with the vague one, which would push an
  # author toward vagueness — the opposite of the rule. Carried verbatim from
  # the ballpark gate, Chicago examples and all: these are the exact sentences
  # each narrowing was measured against, and paraphrasing them into Queens
  # streets would test a different, untested set.
  @sourced_spatial_claims [
    "about one-half mile to the west on Irving Park Road",
    "just across Clark Street from Wrigley Field",
    "an American bistro across from the ballpark, serving classic dishes",
    "It stands north of Grace Street (3800 North)",
    "A one-block street in Lake View at 1050 West on the Chicago street grid",
    "The street is one block long and contains 40 small, single-family rowhouses",
    "Wrigley Field is less than a mile from it",
    "Cornelia Avenue, which is north of 3145 N",
    "matching houses face diagonally across the street"
  ]

  # --- The borough's marquee institutions ---------------------------------
  #
  # Not a content rule — a coverage rule, and the only one here that a dispatch
  # note cannot substitute for.
  #
  # Institutions that span neighborhood lines are the ones a multi-wave
  # programme writes up twice. Forest Park runs through Woodhaven, Richmond
  # Hill, Glendale and Kew Gardens — community districts 5 and 9; Alley Pond
  # Park through Bayside, Douglaston and Oakland Gardens, in district 11; and
  # Flushing Meadows–Corona Park touches districts 3, 4, 6 and 7, though its
  # places are code-owned and no row here names them (see
  # @code_owned_queens_places below). Socrates Sculpture Park sits on the
  # Astoria/Long Island City line. Each must appear in exactly one seed file.
  #
  # A wave that owns one half of a park can reasonably assume the other half's
  # wave covered the institution, and that wave can reasonably assume the
  # reverse, and the institution falls through the gap with every other
  # assertion in this file passing.
  #
  # Asserted as EXACTLY ONCE, not at-least-once, and the symmetry is the point:
  # at-least-once catches the omission, exactly-once also catches the
  # duplicate — the same park written up in both Woodhaven and Glendale, two
  # records with two sets of hours drifting apart. Neither failure produces a
  # symptom any other gate here reports.
  #
  # WHY THIS LIST IS HAND-WRITTEN AND MUST STAY THAT WAY: derived from the
  # corpus it would be vacuous. "Every institution the corpus names appears in
  # the corpus" is true of any corpus, including the one that omits Forest
  # Park — which is the exact failure this exists to prevent. It has to be
  # written from outside the thing it checks.
  #
  # Matched on slug prefix, not display name: the slug is the stable
  # identifier (`places` carries a global unique index on it), while a display
  # name legitimately varies with the verdict that fixes it. Anchored at the
  # front so a qualified slug still matches. If a wave's verdict fixes a name
  # whose slug this pattern misses, WIDEN the pattern in the same commit and
  # say so in the wave report — never delete a row, which is the one edit that
  # silently restores the gap.
  #
  # DELIBERATELY ABSENT: every place owned by Ethos.Seeds.CitiFieldPlaces —
  # citi-field, unisphere, queens-museum, new-york-hall-of-science, queens-zoo,
  # usta-billie-jean-king-national-tennis-center, new-york-state-pavilion,
  # queens-theatre. They are code-defined and appear in ZERO seed files, so
  # listing them here would make this test report all eight as missing forever.
  # They are guarded by @code_owned_queens_places below instead.
  #
  # Candidates a later wave may add once their slugs are fixed by a verdict:
  # Rockaway Beach (spans the whole peninsula) — `rockaway-beach` is in scope,
  # so a row for it is safe to add.
  #
  # Jamaica Bay Wildlife Refuge is NOT such a candidate today. It sits in
  # `broad-channel` and `howard-beach`, both `in_scope: false`, so no seed file
  # will ever carry it and a row for it would report the refuge missing
  # forever — the same failure mode as the Citi Field places above. It becomes
  # addable only if one of those two neighborhoods is flipped in scope and
  # ships. See docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md.
  @marquee_institutions [
    {"Forest Park", ~r/^forest-park/},
    {"Alley Pond Park", ~r/^alley-pond-park/},
    {"Astoria Park", ~r/^astoria-park/},
    {"Socrates Sculpture Park", ~r/^socrates-sculpture-park/},
    {"Louis Armstrong House Museum", ~r/^louis-armstrong-house/}
  ]

  # --- The places this borough already owns in code ------------------------
  #
  # Ethos.Seeds.CitiFieldPlaces already owns eight places in county "Queens",
  # under towns "Flushing" and "Corona" — the same slot a neighborhood guide
  # occupies. Neighborhood guides REFERENCE these by slug and never re-create
  # them.
  #
  # The global slug-uniqueness gate in SeedDataHelpers already catches the
  # exact-slug case mechanically. This assertion exists for the two cases it
  # cannot see: a wave re-creating one of the eight under a DIFFERENT slug
  # (caught by the research contract's address check, and reported here by
  # name so the reviewer knows what to look for), and this list going stale
  # because a place was removed from citi_field_places.ex without anyone
  # updating the gate that guards it.
  @code_owned_queens_places ~w(
    citi-field
    unisphere
    queens-museum
    new-york-hall-of-science
    queens-zoo
    usta-billie-jean-king-national-tennis-center
    new-york-state-pavilion
    queens-theatre
  )

  # citi-field-guide is code-defined and carries county "Queens", so a plain
  # count against length(files) is a trap: it passes today only because that
  # test never seeds code guides, and would fail confusingly the day it does,
  # pointing at the seed directory rather than at the guide it did not expect.
  # Named and subtracted instead, in the corpus test near the end of the file.
  @code_owned_queens_guides MapSet.new(["citi-field-guide"])

  # The same staleness guard the place list gets, and it exists because the
  # asymmetry was the defect: @code_owned_queens_places had an accuracy test
  # against CitiFieldPlaces.places() with an explicit "guards a stale list"
  # rationale, and the guide slug two lines above it had nothing. A rename in
  # citi_field_guide.ex would leave the set below subtracting a slug that no
  # longer exists, so the real guide would show up as "unexpected" in the corpus
  # test's set difference — a failure pointing at the seed directory, which is
  # exactly the confusion @code_owned_queens_guides was introduced to avoid.
  test "the Citi Field guide slug this gate subtracts is still accurate" do
    assert MapSet.equal?(
             @code_owned_queens_guides,
             MapSet.new([Ethos.Seeds.CitiFieldGuide.data().slug])
           ),
           "@code_owned_queens_guides has drifted from Ethos.Seeds.CitiFieldGuide — the " <>
             "corpus test subtracts a stale slug and will report the real code guide as an " <>
             "unexpected seed guide"
  end

  test "the Citi Field place list this gate guards is still accurate" do
    actual =
      Ethos.Seeds.CitiFieldPlaces.places()
      |> Enum.map(& &1.slug)
      |> Enum.sort()

    assert actual == Enum.sort(@code_owned_queens_places),
           "@code_owned_queens_places has drifted from Ethos.Seeds.CitiFieldPlaces — the " <>
             "no-re-creation rule guards a stale list"
  end

  # No non-vacuity floor here, deliberately: over an empty priv/seed_data/queens/
  # this correctly reports no violations, and it is the test ABOVE whose job it
  # is to fail if the guarded list goes stale. Adding a floor here would turn
  # the module red for the whole time the directory is empty, which is exactly
  # what the moduletag exists to avoid. Do not "fix" this.
  test "no queens seed file re-creates a Citi Field place" do
    files = files()

    recreated =
      for f <- files,
          p <- DataGuide.load!(f)["places"],
          p["slug"] in @code_owned_queens_places,
          do: {Path.basename(f), p["slug"]}

    assert recreated == [],
           "queens seed files re-creating code-owned Citi Field places: #{inspect(recreated)}"
  end

  # --- String walk --------------------------------------------------------
  #
  # Fields are walked, not named. An enumerated list — intro, body, summary,
  # question, answer, note — is a list someone forgets to extend the day a new
  # prose field appears, and the gate goes quiet about it.
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

  defp strings(paths) do
    for f <- paths,
        {path, text} <- collect_strings(DataGuide.load!(f)),
        do: {Path.basename(f), path, text}
  end

  # --- The assertions, each a helper over a list of file paths ------------

  defp trip_duration_violations(paths) do
    for {file, path, text} <- strings(paths),
        pattern <- @trip_duration_patterns,
        match = Regex.run(pattern, text),
        not is_nil(match),
        matched = hd(match),
        {file, path, matched} not in @trip_duration_allowlist,
        uniq: true,
        do: {file, path, matched}
  end

  # Regex.scan rather than Regex.run, matching the ballpark gate: it reports
  # every occurrence in a string rather than the first, so a second banned
  # phrase in the same paragraph is not hidden by the first being reported.
  defp proximity_violations(paths) do
    for {file, path, text} <- strings(paths),
        pattern <- @proximity_patterns,
        [matched | _] <- Regex.scan(pattern, text),
        {file, path, matched} not in @proximity_allowlist,
        uniq: true,
        do: {file, path, matched}
  end

  defp tier_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        tier = data["guide"]["tier"] || "guide",
        n = length(data["places"]),
        violation =
          (cond do
             tier == "guide" and n < 4 -> "full guide with only #{n} places"
             tier == "town-page" and n >= 6 -> "town-page with #{n} places — should be a guide"
             true -> nil
           end),
        not is_nil(violation),
        do: {Path.basename(f), violation}
  end

  # The Bronx lowered this floor from 3 to 2 and its comment left Queens open:
  # "its narrowing to 21 neighborhoods may or may not produce the same edge-page
  # shortage, but that hasn't been checked, so the two boroughs are inconsistent
  # by omission rather than by a decision. Fold Queens in only after someone
  # looks." Looked, 2026-09-01, and the answer is no change.
  #
  # What forced the Bronx change was one specific page: bronx-park could reach
  # two honest links and not three, because the narrowing put both of its
  # non-Belmont neighbours out of scope. That structural condition — an in-scope
  # page whose neighbours are all out-of-scope — does not appear in the Queens
  # in-scope set, which narrowed by community district and so kept its clusters
  # intact: CD1 keeps astoria, ditmars-steinway and long-island-city together,
  # CD5 keeps glendale, maspeth and ridgewood, and CD2/4/6/9/11/14 each keep a
  # pair. Every in-scope Queens neighborhood has at least one in-scope
  # neighbour, and most have two or three. Twenty-one pages also offer more
  # interconnection than the Bronx's thirteen, not less.
  #
  # So the floor stays at 3 here — not because 3 is principled where 2 was not,
  # but because the circumstance that justified lowering it does not exist in
  # this borough, and lowering a floor without that circumstance is just
  # weakening it. If a later wave hits a genuine wall, revisit it then, with the
  # concrete page in view — which is the standard the Bronx change was held to.
  defp floor_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        (data["guide"]["tier"] || "guide") == "town-page",
        words = data["guide"]["intro"] |> String.split(~r/\s+/, trim: true) |> length(),
        links = length(data["links"] || []),
        violation =
          (cond do
             words < 90 -> "intro is #{words} words, floor is 90"
             links < 3 -> "only #{links} outbound links, floor is 3"
             true -> nil
           end),
        not is_nil(violation),
        do: {Path.basename(f), violation}
  end

  defp license_violations(paths) do
    for f <- paths,
        p <- all_photos(DataGuide.load!(f)),
        not allowed_license?(p["license"]),
        do: {Path.basename(f), p["license"]}
  end

  # Borough-as-county is how every NYC guide in this corpus is filed, and the
  # legal name would derive `queens-county` — splitting the borough hub away
  # from Brooklyn's, Manhattan's and the Bronx's, and away from
  # `citi-field-guide`, which already carries county "Queens". The value is one
  # word and it is wrong in exactly one plausible way, so it is asserted rather
  # than reviewed.
  #
  # PLACES ARE CHECKED TOO, not just the guide. `Ethos.Places.Place` derives
  # `county_slug` from a place's own `county` by the identical mechanism
  # (place.ex:89), and `count_open_places_in_county/2` filters on it. A guide
  # filed under "Queens" whose places carry "Queens County" passes every other
  # assertion in this file and silently splits the borough's place counts on
  # the hub — over a hundred guides times a dozen places each. The two fields
  # are written in different parts of a seed file by the same author, so the
  # guide being right is no evidence at all about the places.
  #
  # Each violation names WHERE it was found, so a place-level miss is not
  # reported as a guide-level one.
  defp county_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        {where, county} <-
          [
            {"guide", data["guide"]["county"]}
            | for(p <- data["places"], do: {"place #{p["slug"]}", p["county"]})
          ],
        county != "Queens",
        do: {Path.basename(f), where, county}
  end

  # --- The unified transit section ----------------------------------------
  #
  # docs/superpowers/specs/2026-08-31-queens-neighborhoods-design.md §"Getting
  # there": one unified section per neighborhood covering subway, LIRR, bus,
  # ferry and AirTrain. That is a requirement, and roughly a hundred guides
  # will be written by many agents across many waves — a rule that survives
  # only as long as each dispatch remembers to restate it is a rule that does
  # not survive. Both tiers carry the section: an orientation page has one too.
  #
  # THE HEADING IS FIXED BY THIS GATE. It is exactly "Getting there" — not
  # Manhattan's "Getting there by subway", which 38 committed Manhattan guides
  # will have taught every author to reach for.
  #
  # WHAT THIS GATE DOES NOT SAY: the section is not subway-first. Queens'
  # weighting differs from every borough before it. Jamaica is the LIRR's own
  # hub and the primary regional link for the eastern and southern
  # neighborhoods; NYC Ferry serves Astoria, Long Island City and the
  # Rockaways; and both airports sit inside the borough, reached differently —
  # JFK by AirTrain from Jamaica and Howard Beach, LaGuardia by bus only,
  # since the LaGuardia AirTrain project was cancelled in 2023. A section
  # leading with the subway everywhere is accurate for the western
  # neighborhoods and wrong for the eastern half. This fixes the heading and
  # the section's existence; what leads inside it is the wave's judgement, and
  # no gate can check it.
  #
  # Pulls `key` from a list of maps, tolerating a nil list and skipping any
  # entry that is not a map, so a malformed section or FAQ entry fails its
  # assertion with a readable message instead of raising an Access error from
  # inside the comprehension.
  defp field_values(list, key) when is_list(list),
    do: for(item <- list, is_map(item), do: item[key])

  defp field_values(_not_a_list, _key), do: []

  defp getting_there_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        headings = field_values(data["guide"]["sections"], "heading"),
        "Getting there" not in headings,
        do: {Path.basename(f), headings}
  end

  # The one FAQ entry the transit rule makes mandatory, on both tiers.
  # Matched loosely on purpose: the requirement is that the question is
  # answered, so a wave that writes "How do I get to Breezy Point without a
  # subway?" has satisfied it, and pinning the exact string would fail that
  # file for no reason. This catches the entry going missing, not its wording.
  defp transit_faq_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        questions = field_values(data["guide"]["faq"], "question"),
        not Enum.any?(questions, &(is_binary(&1) and Regex.match?(~r/how do i get to/i, &1))),
        do: {Path.basename(f), questions}
  end

  defp marquee_occurrences(paths, pattern) do
    for f <- paths,
        p <- DataGuide.load!(f)["places"],
        is_binary(p["slug"]),
        Regex.match?(pattern, p["slug"]),
        do: {Path.basename(f), p["slug"]}
  end

  # Counted as DISTINCT FILES, not as matching places, and the difference is
  # the difference between a gate that survives and one that gets deleted.
  #
  # The patterns are front-anchored, so `^forest-park` also matches
  # `forest-park-carousel` — a real, separately notable structure — and
  # `^astoria-park` matches any sub-feature a wave writes up. Both are
  # legitimate content in ONE guide. Counting matching places would take those
  # to 2 and fail at the final wave saying "two neighborhoods wrote it up",
  # which would be untrue, on the row most likely to be the one someone
  # deletes. Counting files keeps the failure honest: the cross-wave duplicate
  # is still two files, the sub-place is one.
  defp marquee_file_count(occurrences),
    do: occurrences |> Enum.map(&elem(&1, 0)) |> Enum.uniq() |> length()

  # --- The assertions fire (proven against fixtures) ----------------------
  #
  # The fixtures live outside priv/seed_data/queens/ so they are never seeded,
  # counted, or picked up by the corpus tests. Each violates exactly one rule.

  test "the trip-duration ban catches a duration claim, and only there" do
    # Several of the eleven patterns legitimately fire on the same sentence —
    # that overlap is the detector working as designed, not a bug, so this
    # asserts the fixture is caught at all rather than pinning a match count.
    # Run over EVERY fixture, not just its own: that is what proves the other
    # five fixtures are clean of duration phrasing, so a future one cannot
    # quietly stop being a single-rule fixture.
    violations = trip_duration_violations(fixtures())

    assert violations != []

    assert Enum.all?(violations, fn {file, _path, _matched} -> file == "trip_duration.json" end),
           "fixtures other than trip_duration.json contain duration phrasing: #{inspect(violations)}"
  end

  test "the vague-proximity ban catches an unmeasurable spatial claim, and only there" do
    violations = proximity_violations(fixtures())

    assert violations != []

    assert Enum.all?(violations, fn {file, _path, _matched} -> file == "vague_proximity.json" end),
           "fixtures other than vague_proximity.json contain proximity phrasing: #{inspect(violations)}"
  end

  # Both branches of the tier invariant are proven, and both messages are
  # pinned. With one fixture and a wildcard message, deleting the thin-guide
  # branch left the suite green: `bad_tier.json` exercises the town-page branch
  # only, and a `cond` reports whichever branch matched first.
  #
  # Pinning the message is the cheap half of the fix — a wildcard `_` also
  # accepts the OTHER branch's message, so the test cannot tell which rule
  # fired.

  test "the tier invariant catches a town-page carrying six places" do
    assert [{"bad_tier.json", "town-page with 6 places — should be a guide"}] =
             tier_violations([fixture("bad_tier.json")])
  end

  test "the tier invariant catches a full guide with too few places" do
    assert [{"thin_guide.json", "full guide with only 3 places"}] =
             tier_violations([fixture("thin_guide.json")])
  end

  # The same hole, and the one that mattered most: `below_floor.json` violated
  # BOTH floor rules (an 18-word intro and 1 outbound link), `floor_violations/1`
  # is a `cond` that reports only the first violated branch, and the assertion
  # wildcarded the message. Probed: deleting `words < 90` left the suite green
  # because the link rule then fired instead; deleting `links < 3` left it green
  # because the word rule was firing already. Each rule was covered only by the
  # other one failing first.
  #
  # The spec expects Queens to skew toward orientation pages, so this floor is
  # the quality gate on the majority of the borough's hundred-odd guides. Two
  # fixtures now, each violating one rule, each message pinned.

  test "the orientation floor catches a short intro" do
    assert [{"below_floor.json", "intro is 18 words, floor is 90"}] =
             floor_violations([fixture("below_floor.json")])
  end

  test "the orientation floor catches too few outbound links" do
    assert [{"below_link_floor.json", "only 2 outbound links, floor is 3"}] =
             floor_violations([fixture("below_link_floor.json")])
  end

  test "the licence allowlist catches a non-free licence" do
    assert [{"bad_license.json", "All rights reserved"}] =
             license_violations([fixture("bad_license.json")])
  end

  # The two transit fixtures are complementary on purpose: each satisfies the
  # rule the other breaks. missing_getting_there.json carries the mandatory FAQ
  # entry and Manhattan's heading; missing_transit_faq.json carries the correct
  # heading and no transit question. So neither assertion can be passing because
  # of the other, and a future edit that collapses them into one rule fails here.

  test "the transit-heading assertion catches Manhattan's heading" do
    assert [{"missing_getting_there.json", ["Getting there by subway"]}] =
             getting_there_violations([fixture("missing_getting_there.json")])

    assert getting_there_violations([fixture("missing_transit_faq.json")]) == []
  end

  test "the transit-FAQ assertion catches a guide with no way-in question" do
    assert [{"missing_transit_faq.json", ["Where should I eat?"]}] =
             transit_faq_violations([fixture("missing_transit_faq.json")])

    assert transit_faq_violations([fixture("missing_getting_there.json")]) == []
  end

  # Both arms of the county rule, each with its own fixture and each naming
  # where the bad value was found. The place arm is the one that matters more:
  # a guide filed under "Queens" whose places carry the legal name passes every
  # other assertion here and splits the borough's place counts on the hub.

  test "the county assertion catches the legal name on a guide" do
    assert [{"bad_county.json", "guide", "Queens County"}] =
             county_violations([fixture("bad_county.json")])
  end

  test "the county assertion catches the legal name on a place" do
    assert [{"bad_place_county.json", "place fixture-queens-bad-place-county", "Queens County"}] =
             county_violations([fixture("bad_place_county.json")])
  end

  # --- Each pattern is individually load-bearing --------------------------

  test "each of the eleven trip-duration patterns is individually load-bearing" do
    assert length(@trip_duration_patterns) == 11
    assert length(@trip_duration_specimens) == length(@trip_duration_patterns)

    # A hole in the specimen mechanism itself, closed here: matching lengths
    # alone allow a duplicated index. Replacing {5, ...} with a second {1, ...}
    # keeps the count at eleven, checks pattern 1 twice, and leaves pattern 5
    # unguarded with the suite green. The indices must be exactly 1..11, once
    # each, in order.
    assert Enum.map(@trip_duration_specimens, &elem(&1, 0)) == Enum.to_list(1..11)

    for {n, specimen} <- @trip_duration_specimens do
      pattern = Enum.at(@trip_duration_patterns, n - 1)

      assert Regex.match?(pattern, specimen),
             "trip-duration pattern #{n} no longer catches #{inspect(specimen)} — " <>
               "the pattern at that position is now #{inspect(pattern)}. These are copied " <>
               "verbatim from the destination gate and must not be re-derived, condensed or " <>
               "reordered."
    end
  end

  test "each of the nine proximity patterns is individually load-bearing" do
    assert length(@proximity_patterns) == 9
    assert length(@proximity_specimens) == length(@proximity_patterns)
    assert Enum.map(@proximity_specimens, &elem(&1, 0)) == Enum.to_list(1..9)

    for {n, specimen} <- @proximity_specimens do
      pattern = Enum.at(@proximity_patterns, n - 1)

      assert Regex.match?(pattern, specimen),
             "proximity pattern #{n} no longer catches #{inspect(specimen)} — the pattern " <>
               "at that position is now #{inspect(pattern)}. Each was tuned against the " <>
               "whole corpus; see the rejected-candidate list above before changing one."
    end
  end

  # The other half of tuning, and the half usually left implicit. A gate is
  # only useful if it separates the banned form from the publishable one, so
  # the publishable ones are asserted too.
  test "sourced spatial claims still publish" do
    for claim <- @sourced_spatial_claims do
      firing =
        for {pattern, n} <- Enum.with_index(@proximity_patterns, 1),
            Regex.match?(pattern, claim),
            do: n

      assert firing == [],
             "proximity pattern(s) #{inspect(firing)} fire on a sourced, checkable spatial " <>
               "claim: #{inspect(claim)}. A gate that bans the checkable form pushes authors " <>
               "toward vagueness."
    end
  end

  # The same both-directions discipline applied to the licence allowlist, which
  # otherwise had only its negative half. Narrowing `allowed_license?/1` to
  # `l in ["Public domain", "CC0"]` — dropping every Creative Commons
  # attribution licence, which is what most Commons photos actually carry —
  # left the suite green: bad_license.json still fails, because a narrower rule
  # rejects strictly more. It would surface at the first CC BY photo rather
  # than silently, so this is the cheapest of the closures, but it costs three
  # lines and it mirrors "sourced spatial claims still publish".
  @publishable_licenses [
    "Public domain",
    "CC0",
    "CC BY 2.0",
    "CC BY 3.0",
    "CC BY 4.0",
    "CC BY-SA 2.0",
    "CC BY-SA 3.0",
    "CC BY-SA 4.0"
  ]

  test "publishable licences still pass the allowlist" do
    for l <- @publishable_licenses do
      assert allowed_license?(l),
             "#{inspect(l)} is a licence this corpus publishes under and the allowlist now " <>
               "rejects it — a gate that rejects the free forms makes the licence field " <>
               "unusable, and most Commons photos carry one of these."
    end

    refute allowed_license?("All rights reserved")
    refute allowed_license?("CC BY-NC 4.0"), "non-commercial is not publishable on this site"
    refute allowed_license?("CC BY-ND 4.0"), "no-derivatives forbids the optimizer's resize"
  end

  # --- The committed corpus obeys all of them -----------------------------
  #
  # Every test below opens with a non-vacuity floor on the collection it walks.
  # Without one, each passes trivially over an empty priv/seed_data/queens/ —
  # and a gate that is green because it inspected nothing is worse than no gate,
  # because it is reported as coverage.

  test "no committed queens prose states a trip duration" do
    files = files()
    assert files != [], "no queens seed files — every assertion below would pass vacuously"

    walked = strings(files)
    assert walked != [], "the string walk found nothing in #{length(files)} seed files"

    assert trip_duration_violations(files) == [],
           "trip-duration phrasing found (banned — name the line, station or ferry landing " <>
             "instead of how long the trip takes)"
  end

  test "no committed queens prose states a vague proximity" do
    files = files()
    assert files != [], "no queens seed files — every assertion below would pass vacuously"

    walked = strings(files)
    assert walked != [], "the string walk found nothing in #{length(files)} seed files"

    assert proximity_violations(files) == [],
           "vague-proximity phrasing found (banned — state the relationship as a street name, " <>
             "a road number, a compass direction, a distance in miles, or a bordering " <>
             "relationship instead)"
  end

  test "every committed queens seed file is valid, globally unique, and loads twice" do
    files = files()
    assert files != [], "no queens seed files — every assertion below would pass vacuously"

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    assert license_violations(files) == []
    assert tier_violations(files) == [], "tier does not match place count"
    assert floor_violations(files) == [], "orientation pages below the floor"

    assert county_violations(files) == [],
           "guides not filed under county \"Queens\" (the legal name \"Queens County\" would " <>
             "derive queens-county and split the borough hub away from Brooklyn, Manhattan " <>
             "and the Bronx)"

    assert getting_there_violations(files) == [],
           "guides with no section headed exactly \"Getting there\" (the spec requires one " <>
             "unified section covering subway, LIRR, bus, ferry and AirTrain — not " <>
             "Manhattan's \"Getting there by subway\", which presumes the mode Queens often " <>
             "answers differently)"

    assert transit_faq_violations(files) == [],
           "guides whose FAQ has no \"How do I get to ...?\" question"

    photos = for f <- files, p <- all_photos(DataGuide.load!(f)), do: {Path.basename(f), p}

    # The photo floor is conditional, and the measurement is why: Brooklyn
    # ships 4 full guides and several orientation pages carrying no photos at
    # all, so a photo-free corpus is a legitimate state for a small one and an
    # unconditional floor here would fail the first wave for a defensible
    # reason — the fastest way to get a floor deleted. Across a whole borough it
    # is not legitimate, so the floor arrives with the corpus.
    if length(files) > 10 do
      assert photos != [],
             "#{length(files)} queens seed files and not one photo between them — the three " <>
               "photo assertions below are inspecting an empty collection"
    end

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_queens_photos
    # resolves every /photos/ny/queens/{hood}/{label}.jpg from images/queens/{label}.*,
    # so one label may never stand for two different source images.
    label_dups =
      for({_f, p} <- photos, do: {Path.rootname(Path.basename(p["src"])), p["source_url"]})
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must be on disk, full size and thumb, or the page
    # renders a broken image. mix ethos.optimize_queens_photos writes these.
    missing =
      for {f, p} <- photos,
          path <- [p["src"], p["thumb"]],
          path not in [nil, ""],
          not File.exists?(Path.join(@static_root, path)),
          do: {f, path}

    assert missing == [], "seed photos with no optimized file on disk: #{inspect(missing)}"

    # The manifest pins each label to the Commons file it came from, so the
    # author and licence a page prints always belong to the image beside them.
    manifest = @manifest_path |> File.read!() |> Jason.decode!()

    unpinned =
      for {f, p} <- photos,
          label = Path.rootname(Path.basename(p["src"])),
          manifest[label]["source_url"] != p["source_url"],
          do: {f, label, manifest[label]["source_url"], p["source_url"]}

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: #{inspect(unpinned)}"

    # Seed the link-target universe. Queens files carry cross-borough see-also
    # edges to any of the three prior boroughs, and Links.resolve!/1 raises on
    # an unknown target rather than skipping the edge, aborting the whole link
    # pass.
    user = user_fixture()

    # Two link targets in this universe are CODE seeds, not JSON directories,
    # and the sibling loop below cannot reach either.
    #
    # Citi Field is Queens' own: this borough's guides link to
    # /g/citi-field-guide because Ethos.Seeds.CitiFieldPlaces already owns eight
    # places in county "Queens" — the Unisphere, the Queens Museum, the Hall of
    # Science, the Queens Zoo, the Tennis Center, the State Pavilion and the
    # Queens Theatre, alongside the ballpark. A neighborhood guide references
    # them and never re-creates them, so the link is the mechanism that keeps
    # that rule honest, and it has to resolve.
    #
    # Yankee Stadium arrives with the Bronx, not with Queens: seeding "bronx"
    # below pulls in concourse.json, whose link to /g/yankee-stadium-guide is
    # load-bearing for the same reason. Without this the Bronx link pass raises
    # here and takes the whole Queens gate down with it — which is exactly what
    # happened the first two times this module ran.
    #
    # These four calls MUST come BEFORE the sibling loop, not after. The loop
    # resolves each sibling's links as it seeds it, so by the time it reaches
    # concourse.json the Yankee Stadium guide has to exist already. Putting the
    # block after the loop reads more naturally and fails identically to having
    # no block at all — which was the second failure.
    Ethos.Seeds.CitiFieldPlaces.upsert_all!()
    Ethos.Seeds.CitiFieldGuide.upsert!(user.email)
    Ethos.Seeds.YankeeStadiumPlaces.upsert_all!()
    Ethos.Seeds.YankeeStadiumGuide.upsert!(user.email)

    for sibling <- ["manhattan", "brooklyn", "bronx"] do
      sibling_files = SeedDataHelpers.seed_files(sibling)
      Enum.each(sibling_files, &DataGuide.upsert_places!/1)
      Enum.each(sibling_files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(sibling_files, &DataGuide.upsert_links!/1)
    end

    # three-pass load, twice (idempotency)
    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    # An explicit set comparison rather than a count. See
    # @code_owned_queens_guides above for why a plain
    # `length(guides) == length(files)` is a trap here that the Bronx copy could
    # afford and this one cannot.
    expected_slugs =
      for f <- files, into: MapSet.new(), do: DataGuide.load!(f)["guide"]["slug"]

    published =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Queens"))
      |> MapSet.new(& &1.slug)
      |> MapSet.difference(@code_owned_queens_guides)

    assert MapSet.equal?(published, expected_slugs),
           "published Queens-county guides do not match the seed corpus — " <>
             "missing: #{inspect(MapSet.difference(expected_slugs, published))}, " <>
             "unexpected: #{inspect(MapSet.difference(published, expected_slugs))}"
  end

  # The narrowed-scope gate's own guard. The roster-equality test below carries
  # its own `@tag :pending_queens` on top of the module tag and stays dark
  # until the last in-scope wave lands, so nothing there would notice if its
  # reference set silently reverted to the full roster — every in-scope file
  # would still be present and the set would just be bigger.
  #
  # This calls `in_scope_slugs/0`, THE SAME function the tagged gate calls, and
  # asserts it returns strictly fewer slugs than the roster holds. Deleting the
  # `in_scope` filter from that function makes the two sizes equal and fails
  # this test. It does not re-derive the subset from the roster, because a test
  # that did would only be checking the JSON file and would survive that
  # deletion untouched.
  #
  # It carries no tag of its own and becomes live the moment the `@moduletag`
  # above comes off, at the first Queens wave — eleven waves earlier than the
  # gate it guards, whose own `@tag :pending_queens` does not come off until
  # the twelfth and last in-scope wave. Per this module's own rule, it is NOT
  # enforced until then; the Bronx copy of this guard runs today and is where
  # the property is actually held.
  test "the roster-equality reference set is the in-scope subset, not the whole roster" do
    all = roster_rows() |> MapSet.new(& &1["slug"])
    scoped = in_scope_slugs()

    assert MapSet.size(scoped) > 0, "no queens neighborhood is in scope"

    assert MapSet.subset?(scoped, all),
           "in_scope_slugs/0 returned slugs the roster does not carry: " <>
             inspect(MapSet.difference(scoped, all) |> Enum.sort())

    assert MapSet.size(scoped) < MapSet.size(all),
           "in_scope_slugs/0 returned the whole roster (#{MapSet.size(all)} slugs) — " <>
             "either it stopped applying the `in_scope` filter or the narrowing was reverted"
  end

  # Delete this @tag when the last IN-SCOPE wave lands — 21 neighborhoods, not
  # the full 111 — and not before: until then the corpus is a prefix of the
  # in-scope set and this fails by construction.
  @tag :pending_queens
  test "the shipped queens corpus matches the in-scope roster exactly" do
    files = files()

    # Roster coverage. Without this, deleting a seed file passes every other
    # check in this file — each one only inspects the files that happen to be
    # present. The in-scope subset of the roster is the programme's definition
    # of what the Queens corpus owes, so it is the only thing that can tell a
    # shipped corpus from a truncated one. (The roster itself remains the
    # record of what the borough contains; the flag records what was committed
    # to.)
    #
    # Asserted as equality, and it fails in both directions: a rostered
    # neighborhood with no seed file, and a seed file no roster row claims.
    #
    # Scoped to in-scope rows. The programme narrowed to 21 Queens
    # neighborhoods on 2026-08-31 when search exhaustion dropped per-
    # neighborhood yield from 40 places to 9; the other 90 keep their roster
    # rows and their `in_scope: false`.
    expected = in_scope_slugs()

    shipped = files |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    # Non-vacuity: MapSet.equal?/2 on two empty sets is true, so an empty
    # roster and an empty corpus would agree perfectly and prove nothing.
    assert MapSet.size(expected) > 0, "no queens neighborhood is in scope"

    assert MapSet.equal?(shipped, expected),
           "queens seed corpus does not match the in-scope roster — " <>
             "on the roster with no seed file: " <>
             inspect(MapSet.difference(expected, shipped) |> Enum.sort()) <>
             "; seed files with no roster entry: " <>
             inspect(MapSet.difference(shipped, expected) |> Enum.sort())
  end

  # Delete this @tag when the last in-scope wave lands — 21 neighborhoods, not
  # the full 111 — with the one above. An institution can
  # only be counted once the wave that owns it has landed, and which wave that
  # is, is exactly what this assertion refuses to take on trust.
  @tag :pending_queens
  test "each marquee queens institution appears in exactly one neighborhood" do
    files = files()
    assert files != [], "no queens seed files — this would report every institution as missing"

    for {name, pattern} <- @marquee_institutions do
      found = marquee_occurrences(files, pattern)
      n = marquee_file_count(found)

      assert n == 1,
             "#{name} appears in #{n} queens seed files, want exactly 1: " <>
               inspect(found) <>
               ". Zero means it fell between two waves — the park rows span community " <>
               "districts, so each wave can assume the other covered it. More than one " <>
               "means two neighborhoods wrote it up, and the two records will drift. " <>
               "A sub-place in the same file (forest-park-carousel) is one file and " <>
               "passes; widen the pattern if a verdict's slug misses it, never delete the row."
    end
  end

  # Flushing is the one Queens neighborhood that already exists as a
  # destination: Ethos.Seeds.CitiFieldGuide carries
  # destination: "Flushing, New York". Identical destination strings derive
  # identical destination_slugs, which is what makes the two guides CO-LIST
  # under one destination rather than compete for it.
  #
  # This is not the /destinations/washington defect. That was a state hub
  # silently shadowed by a town of the same name across two states, and
  # Guides.list_guides_shadowed_by_state/1 exists because of it. Two
  # town-level destinations in the same state merge, which is correct — a
  # destination page exists to group the guides that share it. Correct-today
  # and asserted are different states, so: asserted.
  #
  # Kept a pure data assertion — it reads the seed file and the code module —
  # so it needs no database.
  #
  # WHEN DOES THIS TAG COME OFF: in the wave that lands
  # priv/seed_data/queens/flushing.json — wave 5 of 12 on the current roster,
  # NOT the final wave, which is what an earlier draft of the moduledoc and the
  # spec both said. The test self-guards on File.exists? above, so it fails by
  # construction before that wave and has nothing left to wait for after it.
  # The two tags above genuinely need the whole corpus; this one needs one file.
  # The co-listing invariant is the stated reason this scaffolding was written
  # ahead of the research, so holding it dormant for seven waves after its
  # subject shipped would defeat the reason it exists.
  # Tag removed 2026-09-02 by the wave that landed priv/seed_data/queens/
  # flushing.json — wave 5, exactly as the comment above specifies. The
  # File.exists? guard below is now satisfied, so this assertion runs and the
  # co-listing invariant is enforced rather than merely documented. Two
  # `@tag :pending_queens` lines remain in this file (roster equality and
  # marquee institutions); both genuinely need the whole corpus and come off
  # with the last in-scope wave, along with the entry in test_helper.exs.
  test "the Flushing guide shares the Citi Field guide's destination string" do
    path = Path.join(@seed_dir, "flushing.json")

    assert File.exists?(path), "no flushing.json — this test cannot run before Flushing ships"

    seeded = DataGuide.load!(path)["guide"]["destination"]
    code = Ethos.Seeds.CitiFieldGuide.data().destination

    assert seeded == code,
           "flushing.json declares destination #{inspect(seeded)} but citi-field-guide " <>
             "declares #{inspect(code)} — differing strings derive differing " <>
             "destination_slugs, and the two guides stop co-listing"
  end

  # --- Derived-slug collisions with the rest of the corpus -----------------
  #
  # Flushing merging with citi-field-guide is the intended case above. This is
  # the unintended one, and the spec got it wrong on the first pass.
  #
  # Ethos.Guides.Guide.derive_destination_slug/1 (guide.ex:74) splits the
  # destination on a comma and keeps ONLY THE FIRST PART — the state is thrown
  # away. So "Newtown, New York" and "Newtown, Connecticut" are two different
  # strings that derive one slug and co-list on one destination page, across two
  # states. That is the /destinations/washington shape.
  #
  # The spec's original scan compared full destination STRINGS and reported no
  # collisions, which is what a string comparison must report for exactly the
  # pairs that matter. Comparing derived slugs instead, the roster carries three:
  # murray-hill (Manhattan's, same state), newtown and roxbury (both
  # Connecticut's, cross-state).
  #
  # WHY THIS IS QUEENS-SCOPED AND NOT CORPUS-WIDE, which is the obvious
  # "improvement" and must not be made: the corpus ALREADY has one of these.
  # priv/seed_data/brooklyn/madison.json ("Madison, New York") and
  # priv/seed_data/connecticut/madison.json ("Madison, Connecticut") both derive
  # `madison` and co-list today. A corpus-wide assertion here would go red at
  # the first Queens wave on a defect this programme never touched, on a file it
  # does not own, and a gate that fails on somebody else's defect is a gate that
  # gets excluded. The madison collision is recorded in docs/content-defects.md
  # instead. Widen this to corpus-wide in the same commit that fixes madison,
  # not before.
  #
  # Calls the real derive_destination_slug/1 rather than reimplementing the
  # comma-split: a local copy would keep passing on the day the derivation
  # changes, which is the one day this assertion has anything to say.
  defp destination_slug_collisions(queens_paths) do
    others =
      for f <- SeedDataHelpers.all_seed_files() -- queens_paths,
          dest = DataGuide.load!(f)["guide"]["destination"],
          is_binary(dest),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(dest), {Path.relative_to_cwd(f), dest}}

    for f <- queens_paths,
        dest = DataGuide.load!(f)["guide"]["destination"],
        is_binary(dest),
        slug = Ethos.Guides.Guide.derive_destination_slug(dest),
        # citi-field-guide is code-defined, not a seed file, so it is not in
        # `others` and Flushing's intended merge cannot trip this.
        other = others[slug],
        do: {Path.basename(f), dest, slug, other}
  end

  test "no queens destination derives a slug already used outside queens" do
    files = files()
    assert files != [], "no queens seed files — every assertion below would pass vacuously"

    collisions = destination_slug_collisions(files)

    assert collisions == [],
           "queens destinations deriving a destination_slug that a non-queens seed file " <>
             "already derives. The state is discarded by derive_destination_slug/1, so these " <>
             "guides co-list on ONE destination page — cross-state, that is the " <>
             "/destinations/washington shape. Known roster candidates: murray-hill " <>
             "(Manhattan), newtown and roxbury (Connecticut). Resolve by changing the " <>
             "destination string, not by deleting this assertion. Deliberately scoped to " <>
             "Queens: the pre-existing brooklyn/connecticut `madison` collision is a corpus " <>
             "defect this programme did not introduce (docs/content-defects.md): " <>
             "#{inspect(collisions)}"
  end

  # The counting rule proven twice, on literals and through the real walk,
  # because the corpus that would exercise it does not exist until the final
  # wave — by which time getting it wrong means a false "two neighborhoods
  # wrote it up" on a row a wave is being asked to trust.
  #
  # The literals pin the SEMANTICS a later simplifier would collapse. On their
  # own they are thin: they hand-build the {file, slug} tuple shape rather than
  # obtaining it, so if marquee_occurrences/2 ever emitted {slug, file} or a
  # third element, this test would keep passing while the corpus assertion
  # silently counted distinct slugs — putting `forest-park` plus
  # `forest-park-carousel` back at 2, the exact false failure the file-counting
  # rule exists to prevent. Hence the fixture test below, which runs the whole
  # pipeline and would catch that.
  test "marquee_file_count/1 counts distinct files, not matching places" do
    one_guide = [{"woodhaven.json", "forest-park"}, {"woodhaven.json", "forest-park-carousel"}]
    two_guides = [{"woodhaven.json", "forest-park"}, {"glendale.json", "forest-park"}]

    assert marquee_file_count(one_guide) == 1
    assert marquee_file_count(two_guides) == 2
    assert marquee_file_count([]) == 0
  end

  # Driven through marquee_occurrences/2 with the SHIPPED pattern, so the tuple
  # shape, the front anchor and the counting rule are all exercised together.
  test "the marquee walk counts a sub-place in one guide once and a duplicate twice" do
    {_name, park} = Enum.find(@marquee_institutions, fn {name, _} -> name == "Forest Park" end)

    with_sub_place = [fixture("marquee_with_sub_place.json")]
    two_guides = with_sub_place ++ [fixture("marquee_duplicate.json")]

    # The front anchor matches both the institution and its sub-place, which is
    # the over-match — legitimate content, two places, ONE guide.
    assert length(marquee_occurrences(with_sub_place, park)) == 2
    assert marquee_file_count(marquee_occurrences(with_sub_place, park)) == 1

    # The same slug in a second guide is the cross-wave duplicate, and it must
    # still count as two.
    assert marquee_file_count(marquee_occurrences(two_guides, park)) == 2

    assert marquee_file_count(marquee_occurrences([fixture("bad_tier.json")], park)) == 0
  end
end
