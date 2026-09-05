defmodule Ethos.GolfProse do
  @moduledoc """
  The one definition of "banned phrasing" for the golf set.

  Read by `Ethos.Seeds.GolfSeedDataTest`, which walks the JSON corpus, and by
  `Ethos.Seeds.GolfCollectionTest`, which walks the collection module's blurbs.
  The second is not optional coverage: §8 records that a collection module's
  prose is invisible to every JSON gate, and that `burys_collection.ex` and
  `middlebury_guide.ex` shipped four banned drive-time phrasings to production
  because of it.
  """

  # --- Trip-duration ban, verbatim from destination_seed_data_test.exs -----
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

  # --- Vague-proximity ban, ported from ballpark_seed_data_test.exs --------
  @proximity_patterns [
    ~r/\b(?:\d+|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)[-\s]blocks?\s+(?:north|south|east|west|away|up|down|over)\b/i,
    ~r/\bnext door\b/i,
    ~r/\bacross the street from\b/i,
    ~r/\ba few doors\s+(?:down|away|up)\b/i,
    # Noun list re-pointed at golf. A direction relative to a NAMED feature
    # ("north of Highway 101") still publishes; §8 explicitly allows a
    # bordering relationship.
    ~r/\b(?:north|south|east|west)\s+of\s+the\s+(?:course|clubhouse|resort|links|property|site|first tee)\b/i,
    ~r/\b(?:steps|a stone's throw|moments)\s+(?:from|away)\b/i,
    # Case-SENSITIVE and lowercase on purpose, following the ballpark copy:
    # the capitalised form appears in a proper name in the Manhattan corpus.
    ~r/(?-i:around the corner)/,
    ~r/\b(?:down|up)\s+the\s+(?:street|road|block)\b/i,
    ~r/\bwithin walking distance\b/i
  ]

  @patterns @trip_duration_patterns ++ @proximity_patterns

  # Starts empty and must stay empty without a manual read and a stated reason
  # in a wave report. Keyed {file, json path, matched phrase} — the narrow form
  # — so pardoning a phrase in one summary does not pardon it in the intro.
  @allowlist []

  def banned_phrases(text) when is_binary(text) do
    for p <- @patterns, m = Regex.run(p, text), not is_nil(m), uniq: true, do: hd(m)
  end

  def patterns, do: @patterns

  def allowlist, do: @allowlist
end
