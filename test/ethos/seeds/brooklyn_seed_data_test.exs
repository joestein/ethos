defmodule Ethos.Seeds.BrooklynSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/brooklyn_photo_manifest.json", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/brooklyn_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("brooklyn")
  defp fixture(name), do: Path.join(@fixture_dir, name)

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  # --- Trip-duration ban -------------------------------------------------
  #
  # docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md bans transit
  # trip durations categorically. Station names and line designations are
  # published and stable; "twenty minutes to Midtown" is not — it varies by
  # time of day, changes with every service revision, and no research artifact
  # supports it. This is the same failure class as Connecticut's drive times,
  # where a prose rule restated in every wave dispatch and checked in every
  # review still leaked 58 claims across 28 committed files onto the live site
  # before a mechanical gate caught them. A duration claim can hide in any of
  # six places a reviewer reads separately — the intro, a section body, an FAQ
  # answer, a place summary, a photo description, or a link note — so this
  # walks every string value in every seed file rather than the transit
  # section alone.
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minutes?\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    # `walk`/`stroll` added to 8 and 9 across all three copies: "a short walk
    # from the station" escaped every duration gate in the repo. 0 hits in
    # brooklyn/ when it was added.
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
  # empty; waves add entries with justification in their reports.
  @trip_duration_allowlist []

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

  defp trip_duration_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        {path, text} <- collect_strings(data),
        pattern <- @trip_duration_patterns,
        match = Regex.run(pattern, text),
        not is_nil(match),
        matched = hd(match),
        {Path.basename(f), path, matched} not in @trip_duration_allowlist,
        uniq: true,
        do: {Path.basename(f), path, matched}
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

  # Brooklyn heads this section "Getting there", not Manhattan's uniform
  # "Getting there by subway" — because in Brooklyn the subway is often not
  # the answer. Red Hook has no station at all; Greenpoint and the
  # Williamsburg waterfront are ferry-first; East New York has an LIRR stop.
  # Eight waves of authors will have read 38 Manhattan guides that all use
  # the subway heading, so drifting back to it is the single most likely
  # regression in this program — and the heading does not drift alone, it
  # takes the whole multi-modal transit rule with it. Both tiers carry the
  # section: an orientation page has one too.
  # Pulls `key` from a list of maps, tolerating a nil list and skipping any
  # entry that is not a map. Both structural assertions below go through this
  # so a malformed section or FAQ entry fails its assertion with a readable
  # message instead of raising an Access error from inside the comprehension.
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

  # The one FAQ entry the content rules make mandatory, on both tiers.
  # Matched loosely on purpose: the rules fix the question as "How do I get
  # to {Neighborhood}?", but a wave that writes "How do I get to Red Hook
  # without a subway?" has still answered it, and pinning the exact string
  # would fail that file for no reason. This catches the entry going missing,
  # not its wording.
  defp transit_faq_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        questions = field_values(data["guide"]["faq"], "question"),
        not Enum.any?(questions, &(is_binary(&1) and Regex.match?(~r/how do i get to/i, &1))),
        do: {Path.basename(f), questions}
  end

  # --- The assertions fire (proven against fixtures) ----------------------

  test "the trip-duration ban catches a duration claim" do
    # Several of the eleven patterns legitimately fire on the same sentence
    # ("...reaches Midtown in about 25 minutes from here." trips the digit+
    # direction-word pattern, the roughly/about+min pattern, and the
    # reaches-you-to-in-N pattern all at once) — that overlap is the detector
    # working as designed, not a bug, so this asserts the fixture file is
    # caught at all rather than pinning an exact match count.
    violations = trip_duration_violations([fixture("trip_duration.json")])
    assert violations != []
    assert Enum.all?(violations, fn {file, _path, _matched} -> file == "trip_duration.json" end)
  end

  test "the tier invariant catches a town-page carrying six places" do
    assert [{"bad_tier.json", _}] = tier_violations([fixture("bad_tier.json")])
  end

  test "the orientation floor catches a short intro" do
    assert [{"below_floor.json", _}] = floor_violations([fixture("below_floor.json")])
  end

  test "the licence allowlist catches a non-free licence" do
    assert [{"bad_license.json", "All rights reserved"}] =
             license_violations([fixture("bad_license.json")])
  end

  # --- The committed corpus obeys all of them ----------------------------

  test "every committed brooklyn seed file is valid, globally unique, and loads twice" do
    files = files()

    # Roster coverage. Without this, deleting a seed file passes every other
    # check in this test — each one only inspects the files that happen to be
    # present. The roster is the program's definition of "all of Brooklyn", so
    # it is the only thing that can tell a shipped corpus from a truncated one.
    #
    # Asserted as equality, not a floor. The plan allowed for omissions — a
    # neighborhood that cannot clear the orientation floor (90-word intro, 3
    # outbound links) is omitted rather than stubbed — but all 69 roster
    # neighborhoods shipped, so the stronger form holds. If a future roster
    # entry is deliberately omitted, relax this to a difference check in one
    # direction and record the omission and its reason in the wave report.
    roster =
      Path.expand("../../../priv/seed_data/brooklyn_roster.json", __DIR__)
      |> File.read!()
      |> Jason.decode!()

    expected = roster["neighborhoods"] |> Enum.map(& &1["slug"]) |> MapSet.new()
    shipped = files |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    assert MapSet.equal?(shipped, expected),
           "brooklyn seed corpus does not match the roster — " <>
             "on the roster with no seed file: " <>
             inspect(MapSet.difference(expected, shipped) |> Enum.sort()) <>
             "; seed files with no roster entry: " <>
             inspect(MapSet.difference(shipped, expected) |> Enum.sort())

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    assert license_violations(files) == []
    assert tier_violations(files) == [], "tier does not match place count"
    assert floor_violations(files) == [], "orientation pages below the floor"

    assert getting_there_violations(files) == [],
           "guides with no section headed exactly \"Getting there\" (Brooklyn does not use " <>
             "Manhattan's \"Getting there by subway\" — the heading is the whole multi-modal rule)"

    assert transit_faq_violations(files) == [],
           "guides whose FAQ has no \"How do I get to ...?\" question"

    assert trip_duration_violations(files) == [],
           "trip-duration phrasing found (banned — name the line, station or ferry landing " <>
             "instead of how long the trip takes)"

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_brooklyn_photos
    # resolves every /photos/ny/brooklyn/{hood}/{label}.jpg from images/brooklyn/{label}.*,
    # so one label may never stand for two different source images.
    label_dups =
      for(
        f <- files,
        p <- all_photos(DataGuide.load!(f)),
        do: {Path.rootname(Path.basename(p["src"])), p["source_url"]}
      )
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must be on disk, full size and thumb, or the page
    # renders a broken image. mix ethos.optimize_brooklyn_photos writes these.
    missing =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          path <- [p["src"], p["thumb"]],
          path not in [nil, ""],
          not File.exists?(Path.join(@static_root, path)),
          do: {Path.basename(f), path}

    assert missing == [], "seed photos with no optimized file on disk: #{inspect(missing)}"

    # The manifest pins each label to the Commons file it came from, so the
    # author and licence a page prints always belong to the image beside them.
    manifest = @manifest_path |> File.read!() |> Jason.decode!()

    unpinned =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          label = Path.rootname(Path.basename(p["src"])),
          manifest[label]["source_url"] != p["source_url"],
          do: {Path.basename(f), label, manifest[label]["source_url"], p["source_url"]}

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: #{inspect(unpinned)}"

    # Seed the link-target universe. Brooklyn files carry cross-borough
    # see-also edges to Manhattan guides, and Links.resolve!/1 raises on an
    # unknown target, aborting the whole link pass.
    user = user_fixture()

    # The loaders resolve every seed file's destination_path against the
    # destinations table and raise on a miss, so the roster is a precondition
    # of any corpus load — Ethos.Release seeds it before every corpus for the
    # same reason.
    Ethos.Seeds.DestinationTree.upsert_all!()

    manhattan = SeedDataHelpers.seed_files("manhattan")
    Enum.each(manhattan, &DataGuide.upsert_places!/1)
    Enum.each(manhattan, &DataGuide.upsert_guide!(&1, user.email))
    Enum.each(manhattan, &DataGuide.upsert_links!/1)

    # three-pass load, twice (idempotency)
    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    brooklyn_guides =
      Ethos.SeedDataHelpers.published_guides_under(
        "united-states/new-york/new-york-city/brooklyn"
      )

    assert length(brooklyn_guides) == length(files)
  end
end
