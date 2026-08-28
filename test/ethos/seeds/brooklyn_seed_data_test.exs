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
    ~r/\b\d+\s*[-–]?\s*minute\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip)\b/i,
    ~r/\b(?:reaches|gets you to|puts you in|takes you to)\b[^.]{0,40}\bin\s+(?:about\s+)?\d+/i
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

  # --- The assertions fire (proven against fixtures) ----------------------

  test "the trip-duration ban catches a duration claim" do
    # Several of the ten patterns legitimately fire on the same sentence
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

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    assert license_violations(files) == []
    assert tier_violations(files) == [], "tier does not match place count"
    assert floor_violations(files) == [], "orientation pages below the floor"

    assert trip_duration_violations(files) == [],
           "trip-duration phrasing found (banned — name the line, station or ferry landing " <>
             "instead of how long the trip takes)"

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_brooklyn_photos
    # resolves every /photos/ny/brooklyn/{hood}/{label}.jpg from images/brooklyn/{label}.*,
    # so one label may never stand for two different source images.
    label_dups =
      (for f <- files, p <- all_photos(DataGuide.load!(f)),
           do: {Path.rootname(Path.basename(p["src"])), p["source_url"]})
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
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Brooklyn"))

    assert length(brooklyn_guides) == length(files)
  end
end
