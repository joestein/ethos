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

  # --- Hour-duration closure, patterns 21 and 22 --------------------------
  #
  # APPENDED, never interleaved: the twenty above keep their indices, because
  # the specimen test in `golf_seed_data_test.exs` pins each pattern by
  # position and a renumbering would silently re-point every specimen.
  #
  # THE HOLE THESE CLOSE. The ported set bans minutes twice — numerically
  # (pattern 1) and in word form (pattern 7) — but bans hours only once, in
  # pattern 6, whose `\d+\s*hours?` cannot cross a hyphen. Probed before the
  # fix, every one of these escaped the whole twenty-pattern set:
  #
  #     "a 3-hour drive north"               -> []
  #     "a two-hour drive from the airport"  -> []
  #     "roughly a two hour drive"           -> []
  #     "Approximately a 2.5-hour drive"     -> []
  #     "a 1.5-hour ride"                    -> []
  #
  # while "a 2.5 hours drive" was caught, and only by the accident that
  # `\b\d+` re-anchors on the "5" after the decimal point. "A 3-hour drive
  # north" is the single most natural sentence anyone writes about a golf
  # resort, and it walked through.
  #
  # TUNED AGAINST THE CORPUS, NOT AGAINST IMAGINATION (§8). Both were measured
  # over all 483 units — every `priv/seed_data/*/*.json` and every
  # `lib/ethos/seeds/*.ex` — before being kept: 0 hits each. They are the
  # phrasings this corpus has not reached for yet, and each is pinned by an
  # indexed specimen so it cannot be silently weakened.
  #
  # REJECTED CANDIDATES, with their measurements so nobody re-proposes them:
  #
  #   * bare `\d+[-\s]hours?` with no travel anchor — 19 repo-wide, and it
  #     cannot tell a journey from an opening time or a boat tour: fifteen
  #     are "24-hour" ("24-hour front desk" x3, "24-hour fitness center" x3,
  #     "24-hour access" x4, "24-hour parking", "24-hour roadside diner" x2,
  #     "a 24-hour horror movie film festival"), and four are Norwalk's
  #     sourced "3-hour cruises" to Sheffield Island Lighthouse. §8 already
  #     records this: pattern 11 is anchored on a preceding "in" for exactly
  #     this reason. Kept only in the travel-anchored form below.
  #   * bare word-form `(one|two|…|twelve)[-\s]hours?` — 57 repo-wide, all
  #     legitimate: "last ticket one hour before closing", "£3.10 for one to
  #     two hours and £6.40 all day", "plan on three to five hours at the
  #     dropzone", "a nineteenth-century six-hour clock", "the box office
  #     opens … two hours before all shows". A duration is only banned when it
  #     is a *journey* duration.
  #   * adding `from` to the travel list — 0 repo-wide today, but the corpus
  #     writes "one hour before closing" 57 times and "one hour from closing"
  #     is the same legitimate fact one preposition away. The cry-wolf cost is
  #     larger than the catch, which is already covered by `drive|ride|away`
  #     in every phrasing observed. Left out deliberately.
  #   * `round`, `delay`, `cruise`, `desk`, `access`, `parking` and friends are
  #     absent from the travel list on purpose: "a 4-hour round" is a duration
  #     but not a journey, and a round of golf is legitimately described that
  #     way in every guide this set will author.
  #
  # WHAT THEY STILL DO NOT CATCH. "It is a long way from the airport" carries
  # no number and no pattern separates it from a sourced sentence; that is
  # §7's rung (c) and the defence is the verdict trace, not this file.
  @hour_patterns [
    # 0 repo-wide. The hyphen and the decimal pattern 6 cannot cross, anchored
    # on a travel word so "24-hour front desk" and "a 4-hour round" publish.
    ~r/\b\d+(?:[.,]\d+)?[-–\s]*hours?[-–\s]+(?:drive|ride|trip|commute|journey|walk|stroll|hop|away|north|south|east|west|by car|by bus|by train|by ferry|by subway)\b/i,
    # 0 repo-wide. The word-form hours the set had no pattern for at all —
    # pattern 7 enumerates minutes only. Same travel anchor, same reason.
    ~r/\b(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)[-–\s]*hours?[-–\s]+(?:drive|ride|trip|commute|journey|walk|stroll|hop|away|north|south|east|west|by car|by bus|by train|by ferry|by subway)\b/i
  ]

  @patterns @trip_duration_patterns ++ @proximity_patterns ++ @hour_patterns

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
