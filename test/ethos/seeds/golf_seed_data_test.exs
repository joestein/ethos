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
    {20, "the inn is within walking distance"}
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
    "Bandon, Oregon, in Coos County"
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
