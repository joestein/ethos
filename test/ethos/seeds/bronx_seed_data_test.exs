defmodule Ethos.Seeds.BronxSeedDataTest do
  @moduledoc """
  The per-directory gate every Bronx research wave must pass.

  It is written before the corpus it guards, which is the point: a gate written
  after the content is a gate tuned to the content. What that costs is a
  staging discipline, recorded here so nobody has to reconstruct it.

  ## Which tag comes off when

  * **Task 2 (this file's own task)** — the whole module carries `@moduletag
    :pending_bronx` and `priv/seed_data/bronx/` holds only `.gitkeep`. Nothing
    here runs. The non-vacuity floors below (`assert files != []` and friends)
    fail by construction over an empty directory, and so does the roster
    equality; a gate that is red because there is nothing to check yet is noise
    a later implementer cannot tell from their own regression.
  * **Task 3**, which lands the first neighborhood end to end, deletes the
    `@moduletag` line. Every test here then runs, and the floors become
    meaningful for the first time — a collection now exists to be non-empty.
    The two tests carrying their own `@tag :pending_bronx` stay excluded:
    neither can pass until the last wave has landed.
  * **Task 5**, which completes the last wave, deletes those two `@tag` lines
    and the `:pending_bronx` entry in `test/test_helper.exs`.

  `:pending_bronx` is deliberately NOT `:pending_wave`. That tag belongs to the
  place-research backlog, which still owes 320 places and gates two assertions
  in `Ethos.Seeds.PlaceContentGateTest`. Sharing it would mean Task 5 either
  cannot delete the tag or, deleting it, un-excludes an unrelated gate that
  fails on pre-existing defects this programme never touched.

  ## Where each part came from

  * The **trip-duration** ban is the copy from
    `test/ethos/seeds/destination_seed_data_test.exs`, not the Brooklyn one.
    Both carry the same eleven patterns; only the destination copy carries the
    specimens that make each pattern individually load-bearing. Brooklyn's own
    comment records that its fixture fires patterns 1, 2 and 3, so 4 through 11
    could be deleted or quietly weakened there and the suite would stay green.
  * The **vague-proximity** ban is from
    `test/ethos/seeds/ballpark_seed_data_test.exs` — nine patterns, each with
    an indexed specimen, an empty allowlist, and the must-pass list of sourced
    spatial claims. That last list is half the tuning: a gate that bans the
    checkable form pushes an author toward vagueness, which is the opposite of
    the rule.
  * Everything else is Brooklyn's, which is the right template for it —
    including the two transit rules, whose heading this gate *fixes* rather
    than inherits from a content-rules document, because the Bronx has none.
    See `getting_there_violations/1` for what that does and does not decide.
  """
  use Ethos.DataCase, async: false

  # Delete this line in Task 3. See the moduledoc.
  @moduletag :pending_bronx

  import Ethos.AccountsFixtures
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/bronx_photo_manifest.json", __DIR__)
  @roster_path Path.expand("../../../priv/seed_data/bronx_roster.json", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/bronx_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("bronx")
  defp fixture(name), do: Path.join(@fixture_dir, name)
  defp fixtures, do: @fixture_dir |> Path.join("*.json") |> Path.wildcard() |> Enum.sort()

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
  # rather than restated in Bronx terms: byte-identity with the copy these were
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
  # unsourced *containment* claim in ordinary prose ("Both are in Belmont")
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
  # each narrowing was measured against, and paraphrasing them into Bronx
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
  # Three roster rows are parks spanning more than one community district:
  # Bronx Park (CD 6 and 7), Van Cortlandt Park (7 and 12), Pelham Bay Park (11
  # and 12). The New York Botanical Garden sits on Bronx Park's CD 7 side,
  # abutting Bedford Park — which is in a different wave. So a wave-2 finder can
  # reasonably assume the garden belongs to wave 3, a wave-3 finder can
  # reasonably assume it was already covered, and the borough's best-known
  # garden falls through the gap with every other assertion in this file
  # passing.
  #
  # Asserted as EXACTLY ONCE, not at-least-once, and the symmetry is the point:
  # at-least-once catches the omission, exactly-once also catches the
  # duplicate — the zoo written up in both Belmont and Bronx Park, two records
  # with two sets of hours drifting apart. Neither failure produces a symptom
  # any other gate here reports.
  #
  # WHY THIS LIST IS HAND-WRITTEN AND MUST STAY THAT WAY: derived from the
  # corpus it would be vacuous. "Every institution the corpus names appears in
  # the corpus" is true of any corpus, including the one that omits the
  # garden — which is the exact failure this exists to prevent. It has to be
  # written from outside the thing it checks.
  #
  # Matched on the place SLUG, not the display name: the slug is the corpus's
  # stable identifier (`places` carries a global unique index on it), while a
  # display name legitimately varies with the verdict that fixes it ("Bartow-
  # Pell Mansion" vs "Bartow-Pell Mansion Museum"). Anchored at the front so a
  # qualified slug still matches. If a wave's verdict fixes a name whose slug
  # this pattern misses, WIDEN the pattern in the same commit and say so in the
  # wave report — never delete a row, which is the one edit that silently
  # restores the gap.
  @marquee_institutions [
    {"New York Botanical Garden", ~r/^new-york-botanical-garden/},
    {"Bronx Zoo", ~r/^bronx-zoo/},
    {"Van Cortlandt House Museum", ~r/^van-cortlandt-house/},
    {"Orchard Beach", ~r/^orchard-beach/},
    {"Bartow-Pell Mansion", ~r/^bartow-pell-mansion/}
  ]

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
  # legal name would derive `bronx-county` — splitting the borough hub away
  # from Brooklyn's and Manhattan's. The value is one word and it is wrong in
  # exactly one plausible way, so it is asserted rather than reviewed.
  #
  # PLACES ARE CHECKED TOO, not just the guide. `Ethos.Places.Place` derives
  # `county_slug` from a place's own `county` by the identical mechanism
  # (place.ex:89), and `count_open_places_in_county/2` filters on it. A guide
  # filed under "Bronx" whose places carry "Bronx County" passes every other
  # assertion in this file and silently splits the borough's place counts on
  # the hub — sixty-six guides times a dozen places each. The two fields are
  # written in different parts of a seed file by the same author, so the guide
  # being right is no evidence at all about the places.
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
        county != "Bronx",
        do: {Path.basename(f), where, county}
  end

  # --- The unified transit section ----------------------------------------
  #
  # docs/superpowers/specs/2026-08-30-bronx-neighborhoods-design.md §"Getting
  # there": "One unified section per neighborhood covering subway, Metro-North,
  # bus and ferry, as Brooklyn's did." That is a requirement, and sixty-six
  # guides will be written by many agents across many waves — a rule that
  # survives only as long as each dispatch remembers to restate it is a rule
  # that does not survive. Both tiers carry the section: an orientation page
  # has one too.
  #
  # THE HEADING IS FIXED BY THIS GATE, not by a content-rules document. There
  # is no Bronx equivalent of docs/superpowers/plans/2026-08-28-brooklyn-
  # content-rules.md, so without this assertion Task 3 would be choosing the
  # heading and every later wave would be guessing at it. It is exactly
  # "Getting there" — not Manhattan's "Getting there by subway", which 38
  # committed Manhattan guides will have taught every author to reach for.
  #
  # WHAT THIS GATE DOES NOT SAY, stated plainly because the Manhattan heading
  # carries an assumption with it: the section is not subway-first. The Bronx's
  # weighting genuinely differs — Metro-North's Harlem and Hudson lines matter
  # more than the subway for the northern and western neighborhoods, and NYC
  # Ferry serves Soundview. A section leading with the subway everywhere is
  # accurate for the South Bronx and wrong for Riverdale. This fixes the
  # heading and the section's existence; what leads inside it is the wave's
  # judgement, and no gate can check it.
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
  # answered, so a wave that writes "How do I get to City Island without a
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
  # The patterns are front-anchored, so `^orchard-beach` also matches
  # `orchard-beach-pavilion` — a real, separately notable structure — and
  # `^bronx-zoo` matches any sub-attraction a wave writes up. Both are
  # legitimate content in ONE guide. Counting matching places would take those
  # to 2 and fail at Task 5 saying "two neighborhoods wrote it up", which would
  # be untrue, on the row most likely to be the one someone deletes. Counting
  # files keeps the failure honest: the cross-wave duplicate is still two
  # files, the sub-place is one.
  defp marquee_file_count(occurrences),
    do: occurrences |> Enum.map(&elem(&1, 0)) |> Enum.uniq() |> length()

  # --- The assertions fire (proven against fixtures) ----------------------
  #
  # The fixtures live outside priv/seed_data/bronx/ so they are never seeded,
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
  # The spec expects the Bronx to skew toward orientation pages, so this floor
  # is the quality gate on the majority of sixty-six guides. Two fixtures now,
  # each violating one rule, each message pinned.

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
  # a guide filed under "Bronx" whose places carry the legal name passes every
  # other assertion here and splits the borough's place counts on the hub.

  test "the county assertion catches the legal name on a guide" do
    assert [{"bad_county.json", "guide", "Bronx County"}] =
             county_violations([fixture("bad_county.json")])
  end

  test "the county assertion catches the legal name on a place" do
    assert [{"bad_place_county.json", "place fixture-bronx-bad-place-county", "Bronx County"}] =
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
  # Without one, each passes trivially over an empty priv/seed_data/bronx/ —
  # and a gate that is green because it inspected nothing is worse than no gate,
  # because it is reported as coverage.

  test "no committed bronx prose states a trip duration" do
    files = files()
    assert files != [], "no bronx seed files — every assertion below would pass vacuously"

    walked = strings(files)
    assert walked != [], "the string walk found nothing in #{length(files)} seed files"

    assert trip_duration_violations(files) == [],
           "trip-duration phrasing found (banned — name the line, station or ferry landing " <>
             "instead of how long the trip takes)"
  end

  test "no committed bronx prose states a vague proximity" do
    files = files()
    assert files != [], "no bronx seed files — every assertion below would pass vacuously"

    walked = strings(files)
    assert walked != [], "the string walk found nothing in #{length(files)} seed files"

    assert proximity_violations(files) == [],
           "vague-proximity phrasing found (banned — state the relationship as a street name, " <>
             "a road number, a compass direction, a distance in miles, or a bordering " <>
             "relationship instead)"
  end

  test "every committed bronx seed file is valid, globally unique, and loads twice" do
    files = files()
    assert files != [], "no bronx seed files — every assertion below would pass vacuously"

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    assert license_violations(files) == []
    assert tier_violations(files) == [], "tier does not match place count"
    assert floor_violations(files) == [], "orientation pages below the floor"

    assert county_violations(files) == [],
           "guides not filed under county \"Bronx\" (the legal name \"Bronx County\" would " <>
             "derive bronx-county and split the borough hub away from Brooklyn and Manhattan)"

    assert getting_there_violations(files) == [],
           "guides with no section headed exactly \"Getting there\" (the spec requires one " <>
             "unified section covering subway, Metro-North, bus and ferry — not Manhattan's " <>
             "\"Getting there by subway\", which presumes the mode the Bronx often answers " <>
             "differently)"

    assert transit_faq_violations(files) == [],
           "guides whose FAQ has no \"How do I get to ...?\" question"

    photos = for f <- files, p <- all_photos(DataGuide.load!(f)), do: {Path.basename(f), p}

    # The photo floor is conditional, and the measurement is why: Brooklyn
    # ships 4 full guides and several orientation pages carrying no photos at
    # all, so a photo-free corpus is a legitimate state for a small one and an
    # unconditional floor here would fail Task 3 for a defensible reason — the
    # fastest way to get a floor deleted. Across a whole borough it is not
    # legitimate, so the floor arrives with the corpus.
    if length(files) > 10 do
      assert photos != [],
             "#{length(files)} bronx seed files and not one photo between them — the three " <>
               "photo assertions below are inspecting an empty collection"
    end

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_bronx_photos
    # resolves every /photos/ny/bronx/{hood}/{label}.jpg from images/bronx/{label}.*,
    # so one label may never stand for two different source images.
    label_dups =
      for({_f, p} <- photos, do: {Path.rootname(Path.basename(p["src"])), p["source_url"]})
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must be on disk, full size and thumb, or the page
    # renders a broken image. mix ethos.optimize_bronx_photos writes these.
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

    # Seed the link-target universe. Bronx files carry cross-borough see-also
    # edges, and Links.resolve!/1 raises on an unknown target, aborting the
    # whole link pass.
    user = user_fixture()

    for sibling <- ["manhattan", "brooklyn"] do
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

    bronx_guides =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Bronx"))

    assert length(bronx_guides) == length(files)
  end

  # Delete this @tag in Task 5, not before: until the last wave has landed the
  # corpus is a prefix of the roster and this fails by construction.
  @tag :pending_bronx
  test "the shipped bronx corpus matches the roster exactly" do
    files = files()

    # Roster coverage. Without this, deleting a seed file passes every other
    # check in this file — each one only inspects the files that happen to be
    # present. The roster is the programme's definition of "all of the Bronx",
    # so it is the only thing that can tell a shipped corpus from a truncated
    # one.
    #
    # Asserted as equality, and it fails in both directions: a rostered
    # neighborhood with no seed file, and a seed file no roster row claims. If
    # a future roster entry is deliberately omitted — a neighborhood that
    # cannot clear the orientation floor is omitted rather than stubbed —
    # relax this to a one-directional difference check and record the omission
    # and its reason in the wave report.
    roster = @roster_path |> File.read!() |> Jason.decode!()

    expected = roster["neighborhoods"] |> Enum.map(& &1["slug"]) |> MapSet.new()
    shipped = files |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    # Non-vacuity: MapSet.equal?/2 on two empty sets is true, so an empty
    # roster and an empty corpus would agree perfectly and prove nothing.
    assert MapSet.size(expected) > 0, "the bronx roster names no neighborhoods"

    assert MapSet.equal?(shipped, expected),
           "bronx seed corpus does not match the roster — " <>
             "on the roster with no seed file: " <>
             inspect(MapSet.difference(expected, shipped) |> Enum.sort()) <>
             "; seed files with no roster entry: " <>
             inspect(MapSet.difference(shipped, expected) |> Enum.sort())
  end

  # Delete this @tag in Task 5, with the one above. An institution can only be
  # counted once the wave that owns it has landed, and which wave that is, is
  # exactly what this assertion refuses to take on trust.
  @tag :pending_bronx
  test "each marquee bronx institution appears in exactly one neighborhood" do
    files = files()
    assert files != [], "no bronx seed files — this would report every institution as missing"

    for {name, pattern} <- @marquee_institutions do
      found = marquee_occurrences(files, pattern)
      n = marquee_file_count(found)

      assert n == 1,
             "#{name} appears in #{n} bronx seed files, want exactly 1: " <>
               inspect(found) <>
               ". Zero means it fell between two waves — the park rows span community " <>
               "districts, so each wave can assume the other covered it. More than one " <>
               "means two neighborhoods wrote it up, and the two records will drift. " <>
               "A sub-place in the same file (orchard-beach-pavilion) is one file and " <>
               "passes; widen the pattern if a verdict's slug misses it, never delete the row."
    end
  end

  # The counting rule proven twice, on literals and through the real walk,
  # because the corpus that would exercise it does not exist until Task 5 — by
  # which time getting it wrong means a false "two neighborhoods wrote it up"
  # on a row a wave is being asked to trust.
  #
  # The literals pin the SEMANTICS a later simplifier would collapse. On their
  # own they are thin: they hand-build the {file, slug} tuple shape rather than
  # obtaining it, so if marquee_occurrences/2 ever emitted {slug, file} or a
  # third element, this test would keep passing while the corpus assertion
  # silently counted distinct slugs — putting `bronx-zoo` plus
  # `bronx-zoo-congo-gorilla-forest` back at 2, the exact false failure the
  # file-counting rule exists to prevent. Hence the fixture test below, which
  # runs the whole pipeline and would catch that.
  test "marquee_file_count/1 counts distinct files, not matching places" do
    one_guide = [{"bronx-park.json", "bronx-zoo"}, {"bronx-park.json", "bronx-zoo-congo"}]
    two_guides = [{"bronx-park.json", "bronx-zoo"}, {"belmont.json", "bronx-zoo"}]

    assert marquee_file_count(one_guide) == 1
    assert marquee_file_count(two_guides) == 2
    assert marquee_file_count([]) == 0
  end

  # Driven through marquee_occurrences/2 with the SHIPPED pattern, so the tuple
  # shape, the front anchor and the counting rule are all exercised together.
  test "the marquee walk counts a sub-place in one guide once and a duplicate twice" do
    {_name, zoo} = Enum.find(@marquee_institutions, fn {name, _} -> name == "Bronx Zoo" end)

    with_sub_place = [fixture("marquee_with_sub_place.json")]
    two_guides = with_sub_place ++ [fixture("marquee_duplicate.json")]

    # The front anchor matches both the institution and its sub-place, which is
    # the over-match — legitimate content, two places, ONE guide.
    assert length(marquee_occurrences(with_sub_place, zoo)) == 2
    assert marquee_file_count(marquee_occurrences(with_sub_place, zoo)) == 1

    # The same slug in a second guide is the cross-wave duplicate, and it must
    # still count as two.
    assert marquee_file_count(marquee_occurrences(two_guides, zoo)) == 2

    assert marquee_file_count(marquee_occurrences([fixture("bad_tier.json")], zoo)) == 0
  end
end
