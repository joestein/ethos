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
    # WIDENED. The alternation used to enumerate eleven spelled numbers and an
    # author walked straight through the gap: "12-minute tee times" fired
    # pattern 1, was respelled as "twelve-minute tee times", and published —
    # identical content in a form the gate could not see. A gate that teaches
    # authors to spell numbers out is worse than no gate, so the alternation
    # now covers one through ninety-nine, and the Utah clause was DELETED
    # rather than allowlisted (docs/site-builder.md §12's Dodger Stadium
    # Express precedent: drop a minor sourced detail before widening a hole).
    #
    # MEASURED over all 492 corpus units — every `priv/seed_data/*/*.json` and
    # every `lib/ethos/seeds/*.ex` — before being kept. The old alternation
    # scored 31; the widened one scored 40 on the corpus as it stood, and 39
    # after the Utah deletion below. All 9 newly-caught strings were read one
    # by one and every one is a journey duration, the class this bans:
    #
    #   * hammersmith-and-fulham "two minutes south of the traffic"      (1)
    #   * haringey "a seven-minute walk up Bruce Grove"                  (1)
    #   * havering "the market bus stops as two minutes away",
    #     "St George's Park two minutes away"                            (4)
    #   * sutton "a three-minute walk" (Little Holland House)            (2)
    #   * golf/utah "twelve-minute tee times"                            (1)
    #
    # Zero false positives: no "one minute of silence", no non-journey
    # interval. Only the golf files are gated by this module, and after the
    # Utah deletion the golf corpus is at 0 hits. The eight London strings are
    # a real finding for the destination set, not a reason to narrow this.
    #
    # REJECTED on the same measurement: making spelled minutes conditional on
    # a travel word, the way patterns 21/22 anchor hours. Minutes are banned
    # unconditionally in numeral form by pattern 1 and always have been; making
    # the word form conditional would leave "twelve-minute tee times" legal
    # while "12-minute tee times" stayed banned — the exact asymmetry that
    # produced this evasion. Hours are anchored because "open 24 hours" and "a
    # 4-hour round" are ordinary facts; there is no comparable minutes idiom in
    # this corpus (0 non-journey minute strings in 492 units).
    ~r/\b(?:(?:twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety)(?:[-\s](?:one|two|three|four|five|six|seven|eight|nine))?|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|one|two|three|four|five|six|seven|eight|nine)\s*[-–]?\s*minutes?\b/i,
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

  # --- Self-dating and relative dates, patterns 23 to 28 ------------------
  #
  # APPENDED, never interleaved, for the same reason patterns 21 and 22 were:
  # the specimen test pins each pattern by position.
  #
  # THE DEFECT THESE CLOSE. `golf/kansas.json` shipped "Today is September 5,
  # 2026: the course's own closures calendar shows … closed all day September
  # 13, 14 and 15, and again September 27, 28 and 29 — the first of those dates
  # eight days away", and the same FAQ answer repeated "eight days away" under
  # an "As of September 5, 2026" opener. `golf/missouri.json` shipped the
  # identical shape twice: "Today is 5 September 2026, so that closure begins
  # in three days." Every one of those sentences was true on the day it was
  # written and false the next morning. These guides are read months after
  # authoring, so a claim that is true only on its writing day is a defect —
  # and "Today is …" additionally makes the guide speak as though the reader
  # shares its writing date.
  #
  # THE FIX IS NOT TO DROP THE DATE. Absolute dates are the useful content and
  # they do not rot: "September 13, 14 and 15" and "April 1 – November 30" must
  # keep publishing, and are pinned in `@publishable`. What is banned is the
  # offset from an unstated now. An as-of date — "As of September 5, 2026, the
  # calendar shows …" — is a statement about when the source was read, which
  # stays true forever; that is the form both files were rewritten into.
  #
  # MEASURED over all 503 corpus units — every `priv/seed_data/*/*.json` and
  # every `lib/ethos/seeds/*.ex`. All six score 0 today. Pattern 25 scored 2
  # before `golf/missouri.json` was rewritten; those two were the only hits any
  # of the six had outside Kansas, they were read, they were the same defect,
  # and the prose was fixed rather than the pattern narrowed.
  #
  # REJECTED CANDIDATES, with their measurements so nobody re-proposes them:
  #
  #   * bare `today is` — 17 repo-wide and 15 of them legitimate. The corpus's
  #     commonest use of the words is the "X today is Y" idiom, which dates
  #     nothing: "its Brooklyn terminal today is 56th Drive", "the building
  #     today is the Himalaya Palace Shopping Centre", "what a visitor walks
  #     today is not the quarter that stood here in 1935", "the nearest station
  #     today is Hartford Union Station", "Whether the theater is operating
  #     today is not established". Only "Today is <a date>" rots, so pattern 25
  #     requires a month name, a weekday or a numeral after it.
  #   * bare `today|tomorrow|yesterday` — 338 repo-wide. Not arguable.
  #     `tomorrow` alone is 3, and all three are proper names: Wingate's "High
  #     School for Public Service: Heroes of Tomorrow" and Tower Hamlets'
  #     'This is Tomorrow' (Whitechapel, 1956). `yesterday` is 0.
  #   * `currently closed|open|under|running` — 30 repo-wide, all sourced
  #     status, and five of them in golf files. Worse, most are the *negative*
  #     epistemic sentence this programme wants authors to write: california
  #     "it is not known whether the restaurant is currently open for service"
  #     (x3), nevada "naming them here is not a claim that any is currently
  #     open", lambeth "the operator states that the palace is not currently
  #     running a regular programme of guided tours", guilford "currently
  #     closed for restoration". Banning the phrase would push authors to state
  #     the status flat instead of hedging it, which is the opposite of the
  #     rule. Bare `currently` is 160. Both dropped.
  #   * `at the time of writing` — 0 repo-wide in that exact spelling, but its
  #     synonym `as of this writing` is 3, one of them in a golf file:
  #     iowa "As of this writing, tee times are bookable", gramercy "as of this
  #     writing the hotel remains closed" and "Closed for summer recess as of
  #     this writing". Banning one spelling while the other publishes is
  #     exactly the respelling evasion recorded above pattern 7 — an author who
  #     hits the gate rewrites the words, not the claim — so the whole arm was
  #     dropped rather than half of it kept. An undated hedge is weaker than an
  #     as-of date but it does not become false, which is the line these six
  #     patterns draw.
  #   * `next month|next year` — 7 repo-wide, all of them historical and all of
  #     them anchored to a stated year, not to now: greenwood "built in 1876
  #     and completed the next year" (x2), forest-hills "a site was purchased
  #     in 1912 and the clubhouse was built the next year" (x4),
  #     pacific-heights "streetcars began running in July 1895 and a
  #     counterbalance was installed the next month". Pattern 27 keeps the week
  #     and weekday arms, which are 0, and drops month and year.
  #   * `last <weekday>` — 19 repo-wide, every one of them the recurring
  #     opening-hours idiom and not a past date: "the first and last Sunday of
  #     the month" (weston), "every Tuesday and the last Sunday of the month"
  #     (enfield x3), "the last Sunday of every month except December"
  #     (hackney x4), "from the last Sunday of October to the last Saturday of
  #     March" (pinciano x4), vatican-city x3, campo-marzio x2, windsor "through
  #     last Saturday in October". Pattern 28 bans `last week|weekend|night`
  #     only, which is 0.
  #   * `in <n> days` — 13 repo-wide once missouri's two were fixed, and the
  #     remaining eleven are booking windows and construction durations, not
  #     offsets from now: maspeth "in 30 days", ostiense "in 45 days",
  #     testaccio "in 330 days", vinegar-hill "in six months", parioli "in
  #     eight months", castro-pretorio "in eighteen months", vatican-city "in
  #     22 months", pinciano "in three months". The golf corpus writes "book up
  #     to 30 days ahead" as a matter of course. No pattern separates a booking
  #     window from a countdown, so this is §7 rung (c), not a gate.
  #   * bare `from today|from now` with no unit in front — 0 repo-wide, and
  #     `from now on` is 0 too, but `today's` is 52 ("today's availability" in
  #     golf/arizona among them) and "differs from today's routing" is one
  #     apostrophe away from a false positive on a construction the corpus
  #     writes fifty-two times. Pattern 24 is anchored on a preceding time
  #     unit for the same reason pattern 11 is anchored on "in".
  #   * `at present|at the moment|right now` — 25 repo-wide, and three are the
  #     evergreen FAQ question this set asks by design: "Is the course open
  #     right now?" (utah), "Is Quintero open right now?" (arizona), "is it
  #     open right now?" (missouri). A question about the reader's present is
  #     the correct thing for a guide to answer; it is the *answer* that must
  #     be dated. Pinned in `@publishable`.
  #   * `this week|this month|this weekend` — 5 repo-wide and all five are the
  #     same negative epistemic sentence, in idaho, minnesota, missouri, oregon
  #     and utah: "none of them says whether any given one is serving this
  #     week, so this guide does not say so either". That sentence is true at
  #     any present moment because it asserts an absence of evidence, not a
  #     fact about a week. Pinned in `@publishable`.
  #   * `soon` — 17 repo-wide, including golf/utah's quoted "Coming Soon" from
  #     the resort's own collection list and kansas's FAQ heading "Is Colbert
  #     Hills closed anytime soon?". A quoted marketing label is not a dated
  #     claim. Dropped.
  #
  # WHAT THEY STILL DO NOT CATCH. "The course has just reopened" carries no
  # date word and no pattern separates it from a sourced sentence; §7's rung
  # (c) again, and the defence is the verdict trace.
  @self_dating_patterns [
    # 0 repo-wide, 1 before golf/kansas.json was rewritten. Bare, with no
    # quantifier in front, because `days away` scores 0 on its own and the
    # quantifier is the part an author varies.
    ~r/\b(?:days?|weeks?|months?)\s+away\b/i,
    # 0 repo-wide. Unit-anchored: see the `from today` rejection above.
    ~r/\b(?:days?|weeks?|weekends?|months?|years?)\s+from\s+(?:today|now)\b/i,
    # 2 repo-wide, both golf/missouri.json, both fixed; 0 now. Requires a date
    # or a weekday after it so the "X today is Y" idiom (15 legitimate uses)
    # keeps publishing.
    ~r/\btoday\s+is\s+(?:the\s+)?(?:\d{1,2}\b|january|february|march|april|may|june|july|august|september|october|november|december|monday|tuesday|wednesday|thursday|friday|saturday|sunday)/i,
    # 0 repo-wide with the guard, 1 without it: yankee_stadium_guide.ex's "that
    # list is presented as of the reopening and not as of today", which is a
    # correct statement about what the guide does NOT claim. The negation is
    # excluded rather than the pattern dropped, because "As of today, the
    # course is closed" is the Kansas defect with different words.
    ~r/(?<!not )\bas of (?:today|now)\b/i,
    # 0 repo-wide. Month and year arms deliberately absent — 7 legitimate
    # "the next year" hits, all anchored to a stated year.
    ~r/\b(?:next|this\s+coming)\s+(?:week|weekend|monday|tuesday|wednesday|thursday|friday|saturday|sunday)\b/i,
    # 0 repo-wide. Weekday arm deliberately absent — "the last Sunday of the
    # month" is 19 legitimate hits and is a recurring schedule, not a date.
    ~r/\blast\s+(?:week|weekend|night)\b/i
  ]

  @patterns @trip_duration_patterns ++
              @proximity_patterns ++ @hour_patterns ++ @self_dating_patterns

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
