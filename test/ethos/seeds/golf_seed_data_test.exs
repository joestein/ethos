defmodule Ethos.Seeds.GolfSeedDataTest do
  @moduledoc """
  The per-set gate for the golf corpus.

  Written before a single guide exists, because §1 step 4 puts it there and
  because the alternative is measurable: the Wrigley Field checkpoint's four
  Critical content defects were **all** unsourced spatial claims, caught by a
  reviewer on a programme whose §8 already said a reviewed rule does not hold.

  ## What golf strains that no previous set did

  "A thirty-minute drive from the airport" is the most natural sentence anyone
  will write about a golf resort, and this corpus has already shipped
  "within a short drive", "ten minutes east" and "about ten minutes away" to
  production from `burys_collection.ex` and `middlebury_guide.ex`. The
  duration patterns below are copied VERBATIM from
  `destination_seed_data_test.exs` — the one of the three copies that can
  prove it has not been weakened. Do not re-derive, condense or "improve" one
  of them: a subtly weaker pattern is exactly the failure this gate exists to
  prevent, and it does not show up as a test failure.

  ## Tuning

  The proximity patterns are ported from `ballpark_seed_data_test.exs`, whose
  header records the four candidates rejected on measurement over 272 files —
  bare `\\d+ blocks` (49 hits), `across from` (16, one of them a confirmed
  verdict's own wording), `just north/south/east/west of` (18) and
  `nearby|close by` (474, because `nearby` is a link kind). Pattern 5's noun
  list is re-pointed at golf nouns; everything else is carried across
  unchanged. **Before adding a pattern of your own, measure it over the whole
  corpus first** — an over-broad gate gets excluded, and an excluded gate is
  not a gate.

  Patterns 21 and 22 were added that way, **appended** so the twenty above keep
  their indices. The ported set banned minutes twice — numerically and in word
  form — but hours only once, in a pattern whose `\\d+\\s*hours?` cannot cross a
  hyphen, so "a 3-hour drive north" and "a two-hour drive from the airport"
  published clean. Both new patterns measure 0 hits over all 483 corpus units;
  the rejected wider forms and their counts are recorded beside them in
  `Ethos.GolfProse`.

  Patterns 23 to 28 were added the same way, and for a defect that had already
  shipped twice. `golf/kansas.json` published "Today is September 5, 2026: …
  the first of those dates eight days away" and `golf/missouri.json` published
  "Today is 5 September 2026, so that closure begins in three days" — sentences
  that were true on their writing day and false the next morning, in guides
  read months after authoring. Both files keep every absolute date and lost
  only the offset from an unstated now. Nine candidates were rejected on
  measurement over 503 corpus units, among them bare `today is` (17 hits, 15 of
  them the evergreen "the building today is …" idiom), `currently closed` (30,
  mostly the negative epistemic sentences this programme wants) and
  `last <weekday>` (19, every one "the last Sunday of the month"); the counts
  and the strings are recorded beside the patterns in `Ethos.GolfProse`.

  ## What this does not catch

  An unsourced *containment* claim in ordinary prose — "both are in Ponte
  Vedra Beach" — is grammatically identical to the sourced sentence beside it
  and no pattern separates them. That is §7's rung (c), and the defence is the
  committed per-state verdict trace in `docs/golf/`, not this file. Say so in
  the dispatch rather than implying the gate covers it.
  """
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  defp files, do: SeedDataHelpers.seed_files("golf")

  # Walks the PUBLISHED structure, not raw file text. §8: a source scan cannot
  # tell a defect from a moduledoc recording one, and walking the data yields a
  # {file, path, phrase} allowlist key instead of {file, phrase}.
  defp collect_strings(data, path \\ [])
  defp collect_strings(s, path) when is_binary(s), do: [{Enum.reverse(path), s}]

  defp collect_strings(m, path) when is_map(m),
    do: Enum.flat_map(m, fn {k, v} -> collect_strings(v, [k | path]) end)

  defp collect_strings(l, path) when is_list(l),
    do: l |> Enum.with_index() |> Enum.flat_map(fn {v, i} -> collect_strings(v, [i | path]) end)

  defp collect_strings(_, _), do: []

  defp violations do
    for f <- files(),
        {path, text} <- collect_strings(DataGuide.load!(f)),
        phrase <- Ethos.GolfProse.banned_phrases(text),
        {Path.basename(f), path, phrase} not in Ethos.GolfProse.allowlist(),
        uniq: true,
        do: {Path.basename(f), Enum.join(path, "."), phrase}
  end

  # --- Specimens: each pattern individually load-bearing -------------------
  #
  # Indexed and in the order the patterns are declared. Without these, an
  # empty or thin golf corpus fires almost none of them, so any subset could
  # be deleted or weakened and this suite would stay green — which is the
  # exact hole the destination gate's specimens exist to close.
  @specimens [
    {1, "the clubhouse is a 15-minute walk from the lodge"},
    {2, "the resort sits 20 mins south of the airport"},
    {3, "the second course is about 40 min from the first"},
    {4, "the airport is half an hour by car from the resort"},
    {5, "a drive of about 25 min separates the two courses"},
    {6, "the coast is 3 hours away by car"},
    {7, "the inn stands twenty minutes north of the links"},
    {8, "the tavern is a short drive from the clubhouse"},
    {9, "the hotel is within a short drive of the first tee"},
    {10, "the shuttle reaches the clubhouse in about 25"},
    {11, "the highway covers the same ground in about 2 hours"},
    {12, "the practice green is three blocks north"},
    {13, "the pro shop is next door"},
    {14, "the diner is across the street from the range"},
    {15, "the bar is a few doors down"},
    {16, "the dunes lie north of the course"},
    {17, "the lodge is steps from the tee"},
    {18, "the halfway house is around the corner"},
    {19, "the caddie shack is down the road"},
    {20, "the inn is within walking distance"},
    {21, "the resort is a 3-hour drive north"},
    {22, "the links are a two-hour drive from the airport"},
    {23, "the first of those dates is eight days away"},
    {24, "the aeration closure begins three days from today"},
    {25, "Today is September 5, 2026, and the course is open"},
    {26, "as of today the clubhouse is shut"},
    {27, "the greens are aerated next week"},
    {28, "the course reopened last week after aeration"}
  ]

  # The self-dating sentences two published guides actually carried. Both were
  # true on the day they were written and false the next morning, and both
  # survived twenty-two patterns. Kept as strings for the same reason the
  # hour-duration list is: six patterns, more phrasings than patterns.
  @self_dated_before_23_to_28 [
    # golf/kansas.json, intro and FAQ answer.
    "the first of those dates eight days away",
    "Today is September 5, 2026: the course's own closures calendar shows",
    # golf/missouri.json, section body and FAQ answer.
    "Today is 5 September 2026, so that closure begins in three days",
    "today is 5 September 2026, so that closure begins in three days",
    # The same class in the phrasings neither file happened to reach for.
    "three days from today",
    "a week from now",
    "as of now the course is closed",
    "the tournament is two weeks away",
    "the aeration window opens this coming Monday",
    "the range was resurfaced last weekend"
  ]

  # The five phrasings that escaped the whole twenty-pattern set before
  # patterns 21 and 22 were appended. Kept as strings rather than specimens
  # because two patterns cover five phrasings, and the specimen list is
  # one-per-pattern by construction. Each is the golf sentence the gate was
  # supposed to stop and did not.
  @escaped_before_21_and_22 [
    "a 3-hour drive north",
    "a two-hour drive from the airport",
    "roughly a two hour drive",
    "Approximately a 2.5-hour drive",
    "a 1.5-hour ride",
    # This one was caught, and only by the accident that `\b\d+` re-anchors on
    # the "5" after the decimal point. Pinned so the accident stops mattering.
    "a 2.5 hours drive"
  ]

  # The spelled-number gap in pattern 7. An author hit pattern 1 on
  # "12-minute tee times", respelled it as "twelve-minute tee times" and
  # published — the identical content in a form the gate could not see,
  # because pattern 7's alternation enumerated eleven numbers and "twelve"
  # was not one of them. The clause was DELETED from `golf/utah.json`, not
  # rephrased and not allowlisted, and the alternation now runs one to
  # ninety-nine. These are pinned as strings rather than as `@specimens`
  # entries because the specimen list is one-per-pattern by construction and
  # pattern 7 already has its specimen; a second entry would break the
  # length assertion this file makes.
  @spelled_minute_gap [
    "twelve-minute tee times",
    "an eleven minute walk to the range",
    "a three-minute ride to the second course",
    "two minutes south of the clubhouse",
    "a seven-minute walk from the lodge",
    "the shuttle runs every ninety minutes",
    "a twenty-two minute drive",
    "one minute from the first tee"
  ]

  test "every banned pattern fires on its own specimen" do
    assert length(@specimens) == length(Ethos.GolfProse.patterns()),
           "one specimen per pattern, in order — #{length(@specimens)} specimens " <>
             "for #{length(Ethos.GolfProse.patterns())} patterns"

    for {index, text} <- @specimens do
      pattern = Enum.at(Ethos.GolfProse.patterns(), index - 1)

      assert Regex.match?(pattern, text),
             "pattern #{index} (#{inspect(pattern)}) no longer fires on its specimen " <>
               "#{inspect(text)} — it has been weakened"
    end

    for text <- @escaped_before_21_and_22 do
      assert Ethos.GolfProse.banned_phrases(text) != [],
             "hour-duration phrasing escaped the gate again: #{inspect(text)}. " <>
               "Patterns 21 and 22 exist because every one of these published clean."
    end

    for text <- @spelled_minute_gap do
      assert Ethos.GolfProse.banned_phrases(text) != [],
             "a spelled-out minute count escaped the gate again: #{inspect(text)}. " <>
               "Pattern 7 covers one to ninety-nine because an author respelled " <>
               "\"12-minute\" as \"twelve-minute\" and walked through the gap."
    end

    for text <- @self_dated_before_23_to_28 do
      assert Ethos.GolfProse.banned_phrases(text) != [],
             "a guide dated itself against its writing day again: #{inspect(text)}. " <>
               "Patterns 23 to 28 exist because kansas.json and missouri.json both " <>
               "published this and both were already wrong the next morning. Keep " <>
               "the absolute date, drop the offset from now."
    end
  end

  # Assert the PUBLISHABLE form too. A gate that bans the checkable form
  # alongside the vague one pushes authors toward vagueness, which is the
  # opposite of the rule, and nothing else would notice (§8).
  @publishable [
    "about one-half mile west on US-101",
    "the resort is 25 miles north of Coos Bay on US-101",
    "the lodge sits on Round Lake Drive, north of Highway 101",
    "open 24 hours",
    "the kitchen serves until 9 p.m.",
    "Bandon, Oregon, in Coos County",
    # An hour is a journey duration or it is nothing. Patterns 21 and 22 are
    # anchored on a travel word so that a round of golf, an opening time and a
    # weather stoppage — all of which the corpus states from a source — keep
    # publishing. Nineteen "24-hour"/"3-hour cruises" strings elsewhere in the
    # repo are the measurement behind this list.
    "a 4-hour round",
    "the pace of play is a four-hour round",
    "24-hour front desk",
    "an indoor pool and a 24-hour fitness center",
    "the Seaport Association runs 3-hour cruises to the lighthouse",
    "a 3-hour rain delay",
    "last ticket one hour before closing",
    "a nineteenth-century six-hour clock",
    # Widening pattern 7 to spelled numbers must not spill onto the other
    # things a number word attaches to. Measured: 0 non-journey minute
    # strings in 492 corpus units, so minutes stay banned outright in BOTH
    # numeral and word form, exactly as pattern 1 has always banned them.
    "carts capable of fifteen miles per hour",
    "a twelve-hole loop and a nine-hole short course",
    "twelve months of the year",
    "at least 48 hours in advance",
    "book within 48 hours by calling the Pro Shop",
    "180 days in advance",
    # Patterns 23 to 28 ban the offset from an unstated now, never the date
    # itself. An absolute date does not rot, and an as-of date is a statement
    # about when the source was read, so both are the FIX for the Kansas and
    # Missouri defect and must never be caught by the gate that names it.
    "closed all day September 13, 14 and 15, and again September 27, 28 and 29",
    "As of September 5, 2026, the course's own closures calendar shows",
    "the season runs April 1 – November 30",
    "Fall 2026 Aeration Dates: September 8 – 10: Closed",
    "as of the ranking data's own November 14, 2025 update",
    "the rate table is current as of a September 5, 2026 reading of its own site",
    # The two shapes measurement protects. A question about the reader's
    # present is the correct thing for a guide to ask — it is the answer that
    # carries the date — and `right now` scores 25 repo-wide, three of them
    # this very question.
    "Is the course open right now?",
    "Is Quintero open right now?",
    # A NEGATIVE epistemic statement is true at any present moment, because it
    # asserts an absence of evidence rather than a fact about a week. This
    # exact sentence is in oregon, idaho, minnesota, missouri and utah, and
    # `this week` scores 5 repo-wide — all five of them this.
    "none of them says whether any given one is serving this week, " <>
      "so this guide does not say so either",
    "neither says whether either is trading today, so this guide does not say so either",
    "that list is presented as of the reopening and not as of today",
    "it is not known whether the restaurant is currently open for service",
    # Historical "next year" is anchored to a stated year, not to now.
    "built in 1876 and completed the next year",
    # A recurring schedule, not a past date. 19 repo-wide.
    "open the last Sunday of every month except December",
    "from the last Sunday of October to the last Saturday of March",
    # Booking windows are durations, not countdowns.
    "book Ozarks National up to 30 days ahead",
    "the tenant remains obligated under its lease which expires in January 2031"
  ]

  test "sourced, checkable spatial and time claims still publish" do
    for text <- @publishable do
      assert Ethos.GolfProse.banned_phrases(text) == [],
             "a publishable claim was caught: #{inspect(text)} matched " <>
               inspect(Ethos.GolfProse.banned_phrases(text))
    end
  end

  # --- Corpus assertions ---------------------------------------------------

  test "no golf file publishes a trip duration or a vague proximity" do
    found = violations()

    assert found == [],
           "banned phrasing in the golf corpus (name the road, the direction and " <>
             "the mileage instead of how long the trip takes, and make every spatial " <>
             "claim checkable): " <> inspect(found)
  end

  test "every golf guide carries the required sections, with the exact heading" do
    for f <- files() do
      data = DataGuide.load!(f)
      headings = Enum.map(data["guide"]["sections"] || [], & &1["heading"])
      base = Path.basename(f)

      assert length(headings) >= 3,
             "#{base}: three sections minimum — Getting there, around the course, " <>
               "the course itself. Found: #{inspect(headings)}"

      assert "Getting there" in headings,
             "#{base}: the heading is exactly \"Getting there\" — lowercase t, no " <>
               "trailing mode. Found: #{inspect(headings)}"
    end
  end

  # The one fact the whole product rests on. A page that tells someone they can
  # play a course they cannot is worse than a wrong date, because it is acted
  # on. A required element going missing belongs in a test, not to a reviewer.
  test "every golf guide states whether and how the course can be played" do
    for f <- files() do
      data = DataGuide.load!(f)
      questions = Enum.map(data["guide"]["faq"] || [], & &1["question"])
      base = Path.basename(f)

      assert Enum.any?(questions, &(&1 =~ ~r/\b(play|tee time|tee times|book)\b/i)),
             "#{base}: no FAQ answers how a visitor plays this course. " <>
               "Found: #{inspect(questions)}"
    end
  end

  test "each guide anchors on exactly one ranked course and at most one other" do
    for f <- files() do
      data = DataGuide.load!(f)
      courses = Enum.filter(data["places"], &(&1["kind"] == "golf-course"))
      base = Path.basename(f)

      assert length(courses) >= 1,
             "#{base}: no golf-course place — the guide has no anchor"

      assert length(courses) <= 2,
             "#{base}: #{length(courses)} golf-course places. The ranked course and " <>
               "at most one second course; a third belongs in its own state's file " <>
               "or as a see-also link: " <> inspect(Enum.map(courses, & &1["slug"]))
    end
  end

  test "every entry resolves to a place defined in its own file" do
    for f <- files() do
      data = DataGuide.load!(f)
      slugs = MapSet.new(data["places"], & &1["slug"])

      orphans =
        for e <- data["entries"], not MapSet.member?(slugs, e["place_slug"]), do: e["place_slug"]

      assert orphans == [],
             "#{Path.basename(f)}: entries pointing at places this file does not " <>
               "define — GuideRunner raises on these at seed time: " <> inspect(orphans)
    end
  end

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every golf photo is freely licensed, attributed, and on disk" do
    static_root = Path.expand("../../../priv", __DIR__)

    for f <- files(), p <- all_photos(DataGuide.load!(f)) do
      base = Path.basename(f)

      assert allowed_license?(p["license"]),
             "#{base}: bad license #{inspect(p["license"])}"

      assert is_binary(p["author"]) and p["author"] != "",
             "#{base}: photo #{inspect(p["src"])} has no author"

      assert String.starts_with?(p["src"], "/photos/us/golf/"),
             "#{base}: photo src outside /photos/us/golf/: #{inspect(p["src"])}"

      assert File.exists?(Path.join(static_root, p["src"])),
             "missing #{p["src"]} — run mix ethos.optimize_golf_photos"

      assert File.exists?(Path.join(static_root, p["thumb"])), "missing #{p["thumb"]}"
    end
  end

  test "the golf corpus loads twice, and its slugs collide with nothing" do
    files = files()

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    user = user_fixture()

    # The destination roster has to be in the database before any place can be
    # filed against it: `DataGuide.upsert_places!/1` resolves each place's
    # `destination_path` through `resolve_node!/2`, which RAISES on a path no
    # node owns. `Ethos.Release.seed_directory/2` does exactly this first line
    # for the same reason, so seeding it here mirrors production rather than
    # working around it. This test module is `async: false`, which is what
    # makes a full-roster write safe here — see the note in
    # `destination_tree_test.exs` about concurrent roster writers deadlocking.
    Ethos.Seeds.DestinationTree.upsert_all!()

    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    seeded =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&String.ends_with?(&1.slug, "-golf-guide"))

    assert length(seeded) == length(files)
  end
end
