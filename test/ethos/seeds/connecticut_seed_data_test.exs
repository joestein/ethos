defmodule Ethos.Seeds.ConnecticutSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @ct_glob Path.expand("../../../priv/seed_data/connecticut/*.json", __DIR__)
  @manhattan_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)
  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/connecticut_photo_manifest.json", __DIR__)
  @seed_module_glob Path.expand("../../../lib/ethos/seeds/*.ex", __DIR__)

  defp ct_files, do: @ct_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  # --- Drive-time ban ---------------------------------------------------
  #
  # docs/superpowers/plans/2026-08-23-connecticut-content-rules.md bans drive
  # times categorically in Connecticut seed copy: nothing in the research
  # supports them, they date badly, and they are unverifiable for a reader.
  # Proximity has to be stated in checkable terms — a road, a direction, a
  # distance in miles, or a bordering relationship.
  #
  # That rule was already written into every wave's dispatch and checked in
  # every review, and it still leaked: task 55 found 58 occurrences across 28
  # committed files (some of them from an earlier project and live on the
  # public site) that reviewers had read past. A prose rule restated by hand
  # each wave was proven insufficient. A drive-time claim can hide in any of
  # six places a reviewer has to read separately — the intro, a section body,
  # an FAQ answer, a place summary, a photo caption/description, or a link
  # note — and across several waves at least one of the six was missed every
  # time. This assertion walks every string value in every seed file (not
  # just the "getting there" section) so the ban is enforced mechanically
  # instead of by memory. Patterns are ported from the detector script used
  # to find and fix the 58 (scratchpad/find_drive_times.py): digit-minute
  # forms ("15-minute", "20 min south"), half/quarter/hour-plus-drive forms,
  # spelled-out numbers five through ninety ("ten minutes south"), and vague
  # duration phrasing ("a short drive", "a quick hop").
  @drive_time_patterns [
    ~r/\b\d+\s*[-–]?\s*minute\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|from|by car|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|away|south|north|east|west|by car)/i,
    ~r/\b(?:drive|ride)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|away|south|north|east|west|by car)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    # `walk`/`stroll` added to 8 and 9 across all three copies: "a short walk
    # from the station" is the plainest vague-duration phrasing there is and
    # it escaped every duration gate in the repo. Measured before widening:
    # 11 hits in connecticut/, all rewritten in the same change to state the
    # relationship without a duration; 0 in brooklyn/, destinations/ and
    # lib/ethos/seeds/. Manhattan has 17 and no duration gate to catch them.
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|walk|stroll)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|walk|stroll)\b/i
  ]

  # The one confirmed false positive the patterns above can't tell apart from
  # a real violation: a guided-tour duration ("tours run about 45 minutes"),
  # not a travel/proximity claim. research/connecticut/farmington.json cites
  # "~45-minute tours" as a fact about the Stanley-Whitman House visit itself,
  # with no town-to-town distance implied. Confirmed by manual read during
  # task 55; do not add further entries here without the same scrutiny.
  #
  # Keyed on {file, path, matched phrase} and applied AFTER the regex runs
  # (see the filter below), so only that exact phrase is pardoned in that
  # string — a second, genuine drive-time claim appended to the same field
  # still fails. Earlier this was keyed on {file, path} alone, which excused
  # the *entire* string at that path regardless of what was appended to it.
  @drive_time_allowlist [{"farmington.json", "places[1].summary", "about 45 min"}]

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

  test "every committed connecticut seed file is valid, globally unique, and loads twice" do
    files = ct_files()

    # The expansion has shipped: this gate is no longer allowed to pass vacuously.
    assert length(files) == 165,
           "expected 165 connecticut seed files, found #{length(files)}"

    Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!()

    # licenses
    for f <- files, p <- all_photos(DataGuide.load!(f)) do
      assert allowed_license?(p["license"]),
             "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
    end

    # Tier invariants. The rules doc's "6+ places → full guide" is the authoring
    # decision for a new town; this gate is the backstop for clear mislabels, not
    # the arbiter of editorial judgement. A town-page shipping 6+ places is
    # mislabelled rich content. A guide shipping fewer than 4 places is padding or
    # a mislabel. Roxbury sits legitimately between: 5 places, but 3 sections,
    # 5 FAQ and 3 photos of genuinely verified material.
    tier_violations =
      for f <- files,
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

    assert tier_violations == [], "tier does not match place count: #{inspect(tier_violations)}"

    # The floor an orientation page must clear, or it should not have shipped.
    floor_violations =
      for f <- files,
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

    assert floor_violations == [],
           "orientation pages below the floor: #{inspect(floor_violations)}"

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_connecticut_photos
    # resolves every /photos/ct/{town}/{label}.jpg from images/connecticut/{label}.*, so
    # one label may never stand for two different source images.
    label_sources =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          do: {Path.rootname(Path.basename(p["src"])), p["source_url"]}

    label_dups =
      label_sources
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must actually be on disk, full size and thumb, or the
    # guide renders a broken image. mix ethos.optimize_connecticut_photos writes these.
    missing =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          path <- [p["src"], p["thumb"]],
          path not in [nil, ""],
          not File.exists?(Path.join(@static_root, path)),
          do: {Path.basename(f), path}

    assert missing == [], "seed photos with no optimized file on disk: #{inspect(missing)}"

    # The manifest pins each label to the Commons file it came from, so the author
    # and licence a page prints always belong to the image beside them.
    manifest = @manifest_path |> File.read!() |> Jason.decode!()

    unpinned =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          label = Path.rootname(Path.basename(p["src"])),
          manifest[label]["source_url"] != p["source_url"],
          do: {Path.basename(f), label, manifest[label]["source_url"], p["source_url"]}

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: #{inspect(unpinned)}"

    # Drive-time ban — see the @drive_time_patterns comment above for why this
    # exists as a mechanical gate rather than a prose rule.
    drive_time_violations =
      for f <- files,
          data = DataGuide.load!(f),
          {path, text} <- collect_strings(data),
          pattern <- @drive_time_patterns,
          match = Regex.run(pattern, text),
          not is_nil(match),
          matched = hd(match),
          {Path.basename(f), path, matched} not in @drive_time_allowlist,
          uniq: true,
          do: {Path.basename(f), path, matched}

    assert drive_time_violations == [],
           "drive-time phrasing found (banned — state proximity as a road, direction, " <>
             "distance in miles, or bordering relationship instead): #{inspect(drive_time_violations)}"

    # Seed the link-target universe (mirrors prod seeding order):
    user = user_fixture()

    # The loaders resolve every seed file's destination_path against the
    # destinations table and raise on a miss, so the roster is a precondition
    # of any corpus load — Ethos.Release seeds it before every corpus for the
    # same reason.
    Ethos.Seeds.DestinationTree.upsert_all!()

    Ethos.Seeds.ConnecticutPlaces.upsert_all!()

    for mod <- [
          Ethos.Seeds.WaterburyGuide,
          Ethos.Seeds.MiddleburyGuide,
          Ethos.Seeds.DanburyGuide,
          Ethos.Seeds.SouthburyGuide,
          Ethos.Seeds.WoodburyGuide
        ],
        do: mod.upsert!(user.email)

    manhattan_files = @manhattan_glob |> Path.wildcard() |> Enum.sort()
    Enum.each(manhattan_files, &DataGuide.upsert_places!/1)
    Enum.each(manhattan_files, &DataGuide.upsert_guide!(&1, user.email))
    Enum.each(manhattan_files, &DataGuide.upsert_links!/1)

    # three-pass load, twice
    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    ct_guides =
      Ethos.SeedDataHelpers.published_guides_under("united-states/connecticut")
      |> Enum.filter(&String.ends_with?(&1.slug, "-ct-travel-guide"))

    assert length(ct_guides) == length(files) + 5
  end

  # Connecticut reader-facing prose lives in two places: the JSON seed files
  # under priv/seed_data/connecticut/*.json, which the drive-time scan above
  # walks field by field, and the Elixir seed modules under
  # lib/ethos/seeds/*.ex (the CT-5 code guides plus BurysCollection), whose
  # strings are embedded directly in source and were never covered by the
  # JSON-only glob. That gap was live: burys_collection.ex and
  # middlebury_guide.ex shipped "within a short drive", "ten minutes east",
  # "ten minutes southwest" and "about ten minutes away" to production
  # because nothing scanned code-module source. Both locations must be
  # covered for the ban to mean what it claims to mean.
  #
  # This reads each seed module as plain text and runs the same
  # @drive_time_patterns over it — coarser than the JSON walk (no per-field
  # path, and it cannot distinguish prose from a code comment or a variable
  # name), but it is simple, honest, and needs no Elixir parsing.
  #
  # rome_guide.ex predates the Connecticut expansion and seeds an unrelated
  # destination; the Connecticut content-rules doc's drive-time ban was never
  # meant to reach it (it correctly contains "20-minute walk" as a walkable
  # distance, reviewed under Rome's own rules), so it is excluded by name
  # rather than left to silently fail this Connecticut-specific gate.
  @non_connecticut_seed_modules ["rome_guide.ex"]

  test "connecticut prose in lib/ethos/seeds/*.ex is free of banned drive-time phrasing" do
    violations =
      for f <- @seed_module_glob |> Path.wildcard() |> Enum.sort(),
          Path.basename(f) not in @non_connecticut_seed_modules,
          text = File.read!(f),
          pattern <- @drive_time_patterns,
          match = Regex.run(pattern, text),
          not is_nil(match),
          uniq: true,
          do: {Path.basename(f), hd(match)}

    assert violations == [],
           "drive-time phrasing found in seed module source (banned — state proximity as a " <>
             "road, direction, distance in miles, or bordering relationship instead): " <>
             inspect(violations)
  end
end
