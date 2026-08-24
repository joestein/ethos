defmodule Ethos.Seeds.ConnecticutSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @ct_glob Path.expand("../../../priv/seed_data/connecticut/*.json", __DIR__)
  @manhattan_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)
  @static_root Path.expand("../../../priv/static", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/connecticut_photo_manifest.json", __DIR__)

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
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride)\b/i
  ]

  # The one confirmed false positive the patterns above can't tell apart from
  # a real violation: a guided-tour duration ("tours run about 45 minutes"),
  # not a travel/proximity claim. research/connecticut/farmington.json cites
  # "~45-minute tours" as a fact about the Stanley-Whitman House visit itself,
  # with no town-to-town distance implied. Confirmed by manual read during
  # task 55; do not add further entries here without the same scrutiny.
  @drive_time_allowlist [{"farmington.json", "places[1].summary"}]

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
    assert length(files) == 143,
           "expected 143 connecticut seed files, found #{length(files)}"

    # place-slug ownership across connecticut + manhattan + CT-5 code module
    json_owned =
      for f <- files ++ Path.wildcard(@manhattan_glob),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: connecticut/ and manhattan/ may hold the same
          # basename, which would hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"

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
          {Path.basename(f), path} not in @drive_time_allowlist,
          pattern <- @drive_time_patterns,
          match = Regex.run(pattern, text),
          not is_nil(match),
          uniq: true,
          do: {Path.basename(f), path, hd(match)}

    assert drive_time_violations == [],
           "drive-time phrasing found (banned — state proximity as a road, direction, " <>
             "distance in miles, or bordering relationship instead): #{inspect(drive_time_violations)}"

    # Seed the link-target universe (mirrors prod seeding order):
    user = user_fixture()

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
      Ethos.Guides.list_published_guides()
      |> Enum.filter(
        &(&1.state == "Connecticut" and String.ends_with?(&1.slug, "-ct-travel-guide"))
      )

    assert length(ct_guides) == length(files) + 5
  end
end
