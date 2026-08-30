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

  defp ballpark_sources do
    for path <- Catalog.source_paths("ballparks"),
        do: {Path.basename(path), File.read!(Path.join(@repo_root, path))}
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

  # docs/site-builder.md §8: transit and parking are prose. Thirty ballparks
  # would otherwise mint thirty parking-garage and subway-platform records that
  # can never be more than an address, which is the exact thinness the
  # place-research backlog exists to remove.
  test "no ballpark place record is a station, a garage or a bus route" do
    names = Enum.map(Catalog.places_owned(), fn {p, _o} -> p.name end)
    ballparks = for {p, o} <- Catalog.places_owned(), o.region == "ballparks", do: p.name

    assert ballparks != []
    assert length(names) >= length(ballparks)

    offenders =
      Enum.filter(ballparks, &Regex.match?(~r/\b(station|parking|garage|bus route|lot)\b/i, &1))

    assert offenders == [],
           "transit and parking are prose, never place records: #{inspect(offenders)}"
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
