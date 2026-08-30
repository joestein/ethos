defmodule Ethos.Seeds.BallparkSeedDataTest do
  @moduledoc """
  The per-set gate for the MLB ballpark corpus.

  Every ballpark's places and prose are Elixir modules, not JSON, so none of
  the JSON-scoped destination gates sees a word of it. Before this file the
  only duration coverage the set had was
  `connecticut_seed_data_test.exs:266-281`, which globs every
  `lib/ethos/seeds/*.ex` — and that is the copy `docs/site-builder.md` §8 ranks
  **last** of three: nine patterns, no specimens, no way to tell when it has
  been weakened. Run against ballpark-shaped prose it let three plain
  phrasings through:

      "the Red Line reaches the ballpark in 25 minutes"   -> escapes
      "puts you at the gate in about 2 hours"             -> escapes
      "the shuttle takes 40 minutes"                      -> escapes

  Its pattern 1 is singular-only (`minute\\b`) and it has neither pattern 10
  nor 11. This file ports the **destination** copy — eleven patterns, and the
  specimens that make each one individually load-bearing — and runs it over
  the source text of every module the set owns.

  The Connecticut scan still runs over these files too. That is duplicated
  coverage on purpose: it is the weaker copy, it is scoped by a glob rather
  than by the catalog, and a set should not depend on a gate named for another
  state noticing it.
  """
  use ExUnit.Case, async: true

  alias Ethos.Seeds.Catalog

  @repo_root Path.expand("../../..", __DIR__)

  # --- Trip-duration ban -------------------------------------------------
  #
  # Copied verbatim from test/ethos/seeds/destination_seed_data_test.exs, which
  # is the only one of the three copies that can prove it has not been
  # weakened. Do not re-derive, condense or "improve" one of these: a subtly
  # weaker pattern is exactly the failure the gate exists to prevent, and it
  # does not show up as a test failure.
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minutes?\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute|walk|stroll)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip|walk|stroll)\b/i,
    ~r/\b(?:reaches|gets you to|puts you in|takes you to)\b[^.]{0,40}\bin\s+(?:about\s+)?\d+/i,
    ~r/\bin\s+(?:about|roughly|around|under|over|just|only)?\s*\d+\s*hours?\b/i
  ]

  # Starts empty, and is empty. Confirmed false positives would be keyed on
  # {file, matched phrase} and applied after the regex runs, so only that
  # exact phrase is pardoned in that file.
  #
  # It stays empty deliberately. This gate's only candidate was Southport
  # Grocery's sourced "kitchen closing 30 minutes prior" — a closing time, not
  # a journey, and a legitimate pardon. The clause was dropped from the prose
  # instead, because a {file, phrase} key over a 300-line module would pardon
  # *any* "30 minutes" anywhere in that file, including a real travel claim
  # added later. The destination copy can key on a JSON path and narrow the
  # pardon to one field; source text has no equivalent. A minor sourced detail
  # is not worth widening a pardon that cannot be narrowed, so the gate keeps
  # its strength and the corpus publishes no duration-shaped string at all.
  #
  # Do not add an entry here without a manual read and a stated reason in a
  # wave report — and consider dropping the clause first, as this one did.
  @trip_duration_allowlist []

  # One specimen per pattern, in the order the patterns are listed above,
  # carried across with the patterns. Without these the eleven are
  # load-bearing only in aggregate: nothing in the ballpark corpus fires most
  # of them, so 4 through 11 could be deleted wholesale and this suite would
  # stay green.
  @trip_duration_specimens [
    {1, "the bleachers are a 15-minute walk from the station"},
    {2, "the ballpark sits 20 mins south of the interchange"},
    {3, "the rooftop seats are about 40 min from the loop"},
    {4, "the airport is half an hour by car from the ballpark"},
    {5, "a drive of about 25 min separates the two parks"},
    {6, "the suburbs are 3 hours away by car"},
    {7, "the marquee stands twenty minutes north of downtown"},
    {8, "the tavern is a short walk from the bleachers"},
    {9, "the museum is within a short walk of the gate"},
    {10, "the Red Line reaches the ballpark in about 25"},
    {11, "the express bus covers the same ground in about 2 hours"}
  ]

  # The three phrasings the Connecticut copy — the ballpark corpus's only
  # previous duration coverage — lets through. Pinned so nobody concludes the
  # Connecticut scan is sufficient and deletes this file.
  @escapes_the_connecticut_copy [
    "the Red Line reaches the ballpark in 25 minutes",
    "puts you at the gate in about 2 hours",
    "the shuttle takes 40 minutes"
  ]

  # --- Vague-proximity ban ------------------------------------------------
  #
  # All four Critical content defects the checkpoint review found were
  # unsourced spatial claims in guide prose: "nine blocks south", "next door",
  # "west of the ballpark", and "Both are in Lake View". Three of the four
  # defect classes this checkpoint surfaced got a gate — slug superlatives,
  # durations, module registration — and this one, the class that triggered
  # the checkpoint, was left to human review. §8's own doctrine says a rule
  # restated in a dispatch and checked in a review demonstrably does not hold,
  # and twenty-nine more guides carry the same prose surfaces.
  #
  # The rule: a spatial relationship is publishable when it is checkable — a
  # street name, a road number, a compass direction, a distance in miles, a
  # street number on a grid, a bordering relationship. It is not publishable
  # as an unmeasurable gesture. "about one-half mile to the west on Irving
  # Park Road" passes; "west of the ballpark" does not.
  #
  # TUNED AGAINST THE CORPUS, NOT AGAINST IMAGINATION. Every candidate below
  # was measured over all 272 JSON seed files and every lib/ethos/seeds/*.ex
  # before being kept or dropped, because an over-broad gate gets excluded and
  # an excluded gate is not a gate. Repo-wide hits at the time of writing, and
  # ballpark hits, are recorded per pattern.
  #
  # REJECTED CANDIDATES, recorded here with their measurements so nobody
  # re-proposes them:
  #
  #   * bare `\d+ blocks` — 49 repo-wide, and it cannot tell a proximity claim
  #     from a dimension or a name: "a 4,153-acre state forest in five blocks",
  #     "the nine-block Two Bridges Historic District", "at over 50 blocks, its
  #     largest historic district", "one block of woods". Kept only in the
  #     direction-bearing form, pattern 1.
  #   * `across from` — 16 repo-wide, and it fires on a CONFIRMED verdict's own
  #     wording: Mordecai's authorised text is "an American bistro across from
  #     the ballpark". Banning it would ban a sourced clause.
  #   * `just across` — 11 repo-wide, same problem: Hotel Zachary's verdict
  #     reads verbatim "The Hotel Zachary, just across Clark Street".
  #   * bare `across the street` — fires on Alta Vista Terrace's sourced line,
  #     "matching houses face diagonally across the street", which describes an
  #     arrangement within one street rather than a distance between two
  #     places. Narrowed to `across the street from`, which separates them: 0
  #     repo-wide, still catches the canonical defect.
  #   * `just (north|south|east|west) of` — 18 repo-wide, all legitimate: "just
  #     south of Hartford", "just west of Hartford". A direction relative to a
  #     NAMED place is a bordering relationship, which §8 explicitly publishes.
  #   * `(north|south|east|west) of the \w+` — 27 repo-wide, all legitimate,
  #     because "the" is part of the proper name: "east of the Connecticut
  #     River", "north of the Pappenheimer Preserve", "south of the UConn
  #     campus". Narrowed to a closed list of generic nouns, pattern 5.
  #   * `nearby|close by|not far` — 474 repo-wide. `nearby` is a link `kind` in
  #     the seed schema. The archetypal cry-wolf pattern; measuring it is what
  #     kept it out.
  #
  # Patterns 3, 4 and 5 have zero repo-wide hits. That is not a reason to drop
  # them — they are the phrasings this corpus has not reached for yet, and each
  # is pinned by an indexed specimen below so it cannot be silently weakened.
  #
  # WHAT THIS GATE DOES NOT CATCH, stated plainly so nobody reads it as
  # complete. Three of the checkpoint's four Critical content defects are
  # covered — "nine blocks south", "next door", "west of the ballpark", each
  # verified by probe. The fourth, **"Both are in Lake View"**, is not, and
  # cannot be by this method: it is an unsourced *containment* claim in
  # ordinary prose, naming a real community area in a grammatical form
  # indistinguishable from the sourced sentence one clause earlier. Catching it
  # needs the claim checked against the artifact, not the sentence matched
  # against a pattern.
  #
  # That is the §7 rung-(c) boundary showing up again: some things are caught
  # by a reader tracing a claim to a verdict, or they are not caught. The
  # corpus's defence there is `docs/ballparks/<site>.md`, which pins every
  # published sentence to the verdict it rests on. Say so in the dispatch
  # rather than implying the gate covers it.
  @proximity_patterns [
    # 11 repo-wide. Direction-bearing block counts only; see rejected list.
    ~r/\b(?:\d+|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)[-\s]blocks?\s+(?:north|south|east|west|away|up|down|over)\b/i,
    # 18 repo-wide, 0 in ballparks. Adjacency nothing sources.
    ~r/\bnext door\b/i,
    # 0 repo-wide in this narrowed form.
    ~r/\bacross the street from\b/i,
    # 0 repo-wide.
    ~r/\ba few doors\s+(?:down|away|up)\b/i,
    # 0 repo-wide. A closed list of generic nouns, so a direction relative to a
    # named feature ("north of Grace Street") still publishes.
    ~r/\b(?:north|south|east|west)\s+of\s+the\s+(?:ballpark|stadium|arena|venue|site|station)\b/i,
    # 18 repo-wide, 0 in ballparks. An unmeasurable distance by construction.
    ~r/\b(?:steps|a stone's throw|moments)\s+(?:from|away)\b/i,
    # 1 repo-wide. Case-SENSITIVE and lowercase on purpose: the two other
    # matches are a proper name, Manhattan's "Little Church Around the Corner".
    # This is the cry-wolf discipline the DOHMH grade-letter pattern uses. It
    # costs a capitalised sentence-initial instance, which is the cheaper miss.
    ~r/(?-i:around the corner)/,
    # 1 repo-wide.
    ~r/\b(?:down|up)\s+the\s+(?:street|road|block)\b/i,
    # 9 repo-wide, 0 in ballparks. A duration wearing a distance's clothes.
    ~r/\bwithin walking distance\b/i
  ]

  # Starts empty and is empty. Keyed {file, path, phrase} — the narrow form the
  # destination gate uses — because this gate walks to a field rather than
  # reading a whole file. Pardoning a phrase in one summary must not pardon it
  # in the intro.
  #
  # Before adding an entry, check whether the clause is sourced at all. Every
  # candidate so far was either unsourced (delete it) or already excluded by a
  # narrowed pattern above.
  @proximity_allowlist []

  # One specimen per pattern, in order. Without these the nine are load-bearing
  # only in aggregate: the ballpark corpus fires none of them, so any subset
  # could be deleted or weakened and this suite would stay green — which is the
  # exact hole the destination gate's specimens exist to close.
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
  # author toward vagueness — the opposite of the rule.
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

  defp ballpark_sources do
    for path <- Catalog.source_paths("ballparks"),
        do: {Path.basename(path), File.read!(Path.join(@repo_root, path))}
  end

  # --- Published strings, walked rather than enumerated --------------------
  #
  # The duration gate above reads raw module **source**, following the
  # Connecticut precedent: it is a superset of what ships, so it catches a
  # duration in a comment too.
  #
  # The proximity gate below reads the **published data structure** instead,
  # and the difference is load-bearing. Both moduledocs quote the phrases this
  # checkpoint removed ("a first draft carried 'nine blocks south'"), because
  # recording what was dropped is what makes the content auditable. A source
  # scan fires on that documentation — it cannot tell a banned phrase from a
  # note saying the phrase was banned. Reading the structure sees only what
  # reaches a reader.
  #
  # It also buys a narrower allowlist key. `Regex.run` returns one match per
  # unit, so a file-level unit means a pardon covers that pattern's entire
  # report for the file. Walking to a field gives {file, path, phrase}, the
  # key the destination gate uses, and `Regex.scan` below reports every match
  # rather than the first.
  #
  # Fields are walked, not named. An enumerated list — summary, history,
  # intro, body, question, answer, note — is a list someone forgets to extend
  # the day a new prose field appears, and the gate goes quiet about it.
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

  defp published_strings do
    places =
      for {place, owner} <- Catalog.places_owned(),
          owner.region == "ballparks",
          {path, text} <- collect_strings(place, to_string(place.slug)),
          do: {Path.basename(owner.seed_file), path, text}

    guides =
      for {mod, _region} <- Catalog.guide_modules("ballparks"),
          {path, text} <- collect_strings(mod.data()),
          do: {Path.basename(Catalog.source_path(mod)), path, text}

    places ++ guides
  end

  test "the set owns source files, and they are the ones the catalog names" do
    # Non-vacuous: every assertion below passes trivially against an empty
    # list, which is the exact failure docs/site-builder.md §6 records.
    sources = ballpark_sources()
    assert length(sources) >= 2

    names = sources |> Enum.map(&elem(&1, 0)) |> Enum.sort()
    assert "wrigley_field_places.ex" in names
    assert "wrigley_field_guide.ex" in names
  end

  # --- The set's roster, and its structure ---------------------------------
  #
  # A literal list, not a count and not a set derived from what the catalog
  # happens to hold, for the reason destination_seed_data_test.exs states about
  # its own thirteen destination pages: a derived expectation passes no matter
  # which modules exist, which is exactly the vacuity it exists to prevent.
  #
  # An accidental deletion fails here; so does an unreviewed twelfth ballpark
  # landing silently. Each row is `{venue place slug, guide slug}` — the two
  # things a ballpark must ship, which are also the two things a wave can
  # forget to register independently of one another.
  @ballpark_roster [
    {"american-family-field", "american-family-field-guide"},
    {"busch-stadium", "busch-stadium-guide"},
    {"citi-field", "citi-field-guide"},
    {"citizens-bank-park", "citizens-bank-park-guide"},
    {"comerica-park", "comerica-park-guide"},
    {"dodger-stadium", "dodger-stadium-guide"},
    {"fenway-park", "fenway-park-guide"},
    {"great-american-ball-park", "great-american-ball-park-guide"},
    {"kauffman-stadium", "kauffman-stadium-guide"},
    {"nationals-park", "nationals-park-guide"},
    {"oracle-park", "oracle-park-guide"},
    {"oriole-park-at-camden-yards", "oriole-park-at-camden-yards-guide"},
    {"pnc-park", "pnc-park-guide"},
    {"progressive-field", "progressive-field-guide"},
    {"rate-field", "rate-field-guide"},
    {"rogers-centre", "rogers-centre-guide"},
    {"sutter-health-park", "sutter-health-park-guide"},
    {"target-field", "target-field-guide"},
    {"wrigley-field", "wrigley-field-guide"},
    {"yankee-stadium-bronx", "yankee-stadium-guide"}
  ]

  test "the set ships exactly the rostered ballparks, each as a stadium place" do
    stadium_slugs =
      for {p, o} <- Catalog.places_owned(),
          o.region == "ballparks",
          p.kind == "stadium",
          do: to_string(p.slug)

    expected = Enum.map(@ballpark_roster, &elem(&1, 0))

    assert Enum.sort(stadium_slugs) == Enum.sort(expected),
           "the ballpark set's `stadium` places disagree with the roster — missing: " <>
             inspect(Enum.sort(expected -- stadium_slugs)) <>
             ", unexpected: " <> inspect(Enum.sort(stadium_slugs -- expected))

    guide_slugs =
      for {mod, _r} <- Catalog.guide_modules("ballparks"), do: mod.data().slug

    assert Enum.sort(guide_slugs) == Enum.sort(Enum.map(@ballpark_roster, &elem(&1, 1))),
           "the ballpark guides disagree with the roster: #{inspect(Enum.sort(guide_slugs))}"
  end

  # docs/site-builder.md and the set's dispatch: every ballpark guide carries at
  # least these three sections. A guide that quietly ships two of them still
  # renders, still seeds, and fails nothing else — which is why this is
  # mechanical rather than left to review.
  @required_headings ["Getting there", "Around the ballpark", "The ballpark and the team"]

  test "every ballpark guide carries the three required sections, and names a county" do
    guides = Catalog.guide_modules("ballparks")

    # Non-vacuous: an empty catalog region would pass every assertion below.
    assert length(guides) >= 2

    for {mod, _r} <- guides do
      data = mod.data()
      headings = Enum.map(data.sections, & &1["heading"])

      for required <- @required_headings do
        assert required in headings,
               "#{inspect(mod)} has no #{inspect(required)} section; it has #{inspect(headings)}"
      end

      # county is what derives /destinations/{state}/{county}, and a place
      # breadcrumb 404s without it. Two sites in this set carry a county that
      # repeats the city or the state on purpose — Baltimore City, St. Louis,
      # Toronto, District of Columbia — so the assertion is that the field is
      # populated, not that it differs from its neighbours.
      assert is_binary(data.state) and data.state != ""
      assert is_binary(data.county) and data.county != ""
      assert is_binary(data.destination) and data.destination != ""
    end
  end

  # Every ballpark place is fully addressed for the destination hubs, which
  # group by town, state and county. A nil county on one record breaks that
  # record's breadcrumb and nothing else, so nothing else would report it.
  test "every ballpark place carries a town, a state and a county" do
    bare =
      for {p, o} <- Catalog.places_owned(),
          o.region == "ballparks",
          field <- [:town, :state, :county],
          value = Map.get(p, field),
          not (is_binary(value) and value != ""),
          do: {to_string(p.slug), field}

    assert bare == [], "ballpark places missing hub fields: #{inspect(bare)}"
  end

  test "no ballpark seed prose states a trip duration" do
    violations =
      for {file, text} <- ballpark_sources(),
          pattern <- @trip_duration_patterns,
          match = Regex.run(pattern, text),
          not is_nil(match),
          matched = hd(match),
          {file, matched} not in @trip_duration_allowlist,
          uniq: true,
          do: {file, matched}

    assert violations == [],
           "trip-duration phrasing in ballpark seed modules (banned — state proximity as a " <>
             "road, direction, distance in miles, or bordering relationship instead): " <>
             inspect(violations)
  end

  test "each of the eleven trip-duration patterns is individually load-bearing" do
    assert length(@trip_duration_patterns) == 11
    assert length(@trip_duration_specimens) == length(@trip_duration_patterns)

    for {n, specimen} <- @trip_duration_specimens do
      pattern = Enum.at(@trip_duration_patterns, n - 1)

      assert Regex.match?(pattern, specimen),
             "trip-duration pattern #{n} no longer catches #{inspect(specimen)} — " <>
               "the pattern at that position is now #{inspect(pattern)}. These are copied " <>
               "verbatim from the destination gate and must not be re-derived, condensed " <>
               "or reordered."
    end
  end

  # The reason this file exists rather than leaning on the Connecticut scan.
  # If someone widens the Connecticut copy to eleven patterns this will start
  # failing, which is the correct prompt to delete this assertion — not this
  # file, whose specimens the Connecticut copy still lacks.
  test "the Connecticut copy misses phrasings this gate catches" do
    ct_patterns = [
      ~r/\b\d+\s*[-–]?\s*minute\b/i,
      ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|from|by car|up|down|along)/i,
      ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
      ~r/\b(?:half[-\s]?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|away|south|north|east|west|by car)/i,
      ~r/\b(?:drive|ride)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
      ~r/\b\d+\s*hours?\s+(?:drive|away|south|north|east|west|by car)/i,
      ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
      ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|walk|stroll)\b/i,
      ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|walk|stroll)\b/i
    ]

    for phrase <- @escapes_the_connecticut_copy do
      refute Enum.any?(ct_patterns, &Regex.match?(&1, phrase)),
             "the Connecticut copy now catches #{inspect(phrase)} — good, but this " <>
               "assertion is stale and should be dropped"

      assert Enum.any?(@trip_duration_patterns, &Regex.match?(&1, phrase)),
             "this gate must catch #{inspect(phrase)}"
    end
  end

  test "no ballpark published prose states a vague proximity" do
    strings = published_strings()

    # Non-vacuous: every assertion here passes trivially against an empty walk,
    # and a walk that silently returns nothing is the failure §6 records.
    assert length(strings) > 100

    violations =
      for {file, path, text} <- strings,
          pattern <- @proximity_patterns,
          [matched | _] <- Regex.scan(pattern, text),
          {file, path, matched} not in @proximity_allowlist,
          uniq: true,
          do: {file, path, matched}

    assert violations == [],
           "vague-proximity phrasing in published ballpark prose (banned — state the " <>
             "relationship as a street name, a road number, a direction, a distance in " <>
             "miles, or a bordering relationship instead): " <> inspect(violations)
  end

  test "each of the nine proximity patterns is individually load-bearing" do
    assert length(@proximity_specimens) == length(@proximity_patterns)

    for {n, specimen} <- @proximity_specimens do
      pattern = Enum.at(@proximity_patterns, n - 1)

      assert Regex.match?(pattern, specimen),
             "proximity pattern #{n} no longer catches #{inspect(specimen)} — the pattern " <>
               "at that position is now #{inspect(pattern)}. Each was tuned against the " <>
               "whole corpus; see the rejected-candidate list above before changing one."
    end
  end

  # The other half of tuning, and the half that is usually left implicit. A
  # gate is only useful if it separates the banned form from the publishable
  # one, so the publishable ones are asserted too — including Alta Vista's
  # "diagonally across the street", which is why pattern 3 is narrowed.
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

  # docs/site-builder.md §8: transit and parking are prose. Thirty ballparks
  # would otherwise mint thirty parking-garage and subway-platform records that
  # can never be more than an address, which is the exact thinness the
  # place-research backlog exists to remove.
  #
  # ONE exemption, keyed on the exact place slug so it pardons nothing else.
  #
  # `st-louis-union-station` is not transit infrastructure. Confirmed verdicts
  # in the 2026-08-30 St. Louis Cardinals artifact establish that the building
  # has carried no Amtrak service since October 31, 1978, that it has been a
  # National Historic Landmark since 1970, and that an adaptive-reuse
  # renovation begun in 1985 turned it into a 567-room hotel, an aquarium and a
  # 200-foot Ferris wheel. It is a destination in the sense this corpus
  # publishes destinations, and it has a paragraph of sourced content rather
  # than an address and nothing.
  #
  # The MetroLink station of the same name IS transit, mints no record, and is
  # prose in the guide's "Getting there" — which is the rule working, not being
  # bent. The exemption is on the slug and not on the pattern, so a future
  # `union-station` platform record, or any other place whose name contains
  # "station", still fails here.
  #
  # Do not add an entry without a manual read and a stated reason in a wave
  # report — and consider whether the place belongs in prose first.
  @not_transit_infrastructure ["st-louis-union-station"]

  test "no ballpark place record is a station, a garage or a bus route" do
    names = Enum.map(Catalog.places_owned(), fn {p, _o} -> p.name end)

    ballparks =
      for {p, o} <- Catalog.places_owned(),
          o.region == "ballparks",
          do: {to_string(p.slug), p.name}

    assert ballparks != []
    assert length(names) >= length(ballparks)

    offenders =
      for {slug, name} <- ballparks,
          slug not in @not_transit_infrastructure,
          Regex.match?(~r/\b(station|parking|garage|bus route|lot)\b/i, name),
          do: name

    assert offenders == [],
           "transit and parking are prose, never place records: #{inspect(offenders)}"

    # The exemption list must name places that exist, or it is a stale pardon
    # nobody notices — and a stale pardon is how an allowlist quietly widens.
    slugs = MapSet.new(ballparks, &elem(&1, 0))
    stale = Enum.reject(@not_transit_infrastructure, &MapSet.member?(slugs, &1))

    assert stale == [],
           "@not_transit_infrastructure names slugs no ballpark place has: #{inspect(stale)}"

    # And the pattern must still fire on the pardoned name, or the exemption is
    # doing nothing and the reader of this file is being misled about why it
    # exists.
    for slug <- @not_transit_infrastructure do
      {^slug, name} = Enum.find(ballparks, &(elem(&1, 0) == slug))

      assert Regex.match?(~r/\b(station|parking|garage|bus route|lot)\b/i, name),
             "#{slug} is exempted from a pattern that no longer matches its name " <>
               "(#{inspect(name)}) — drop the exemption"
    end
  end

  # A slug is published text: it is the URL, and the corpus gates scan it as a
  # string. The research artifact proposes a slug; only a verdict decides a
  # name. `sluggers-world-class-sports-bar` reached a first draft straight from
  # the artifact, which would have published an unsourced self-superlative in
  # an <h1> and a URL — the same claim the verifier struck four times over on
  # that record's own page.
  @superlative_in_slug ~r/\b(world-?class|world-?famous|premier|premiere|best|finest|greatest|ultimate|number-?one|top-?rated|award-?winning)\b/i

  test "no place slug or name carries a superlative" do
    offenders =
      for {place, owner} <- Catalog.places_owned(),
          field <- [place.slug, place.name],
          Regex.match?(@superlative_in_slug, field),
          do: {Path.basename(owner.seed_file), field}

    assert offenders == [],
           "a slug and a name are published text, and a superlative in either needs a " <>
             "confirmed verdict behind it — none of these has one: #{inspect(offenders)}"
  end
end
