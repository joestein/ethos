defmodule Ethos.Seeds.DestinationSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Guides
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.{DataDestination, DataGuide}

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/destination_photo_manifest.json", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/destination_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("destinations")
  defp fixture(name), do: Path.join(@fixture_dir, name)

  defp photos(data), do: data["photos"] || []
  defp label(photo), do: photo["src"] |> Path.basename() |> Path.rootname()

  defp manifest, do: @manifest_path |> File.read!() |> Jason.decode!()

  defp allowed_license?(l),
    do:
      l in ["Public domain", "CC0"] or
        (is_binary(l) and Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l))

  # --- Trip-duration ban -------------------------------------------------
  #
  # Copied verbatim from test/ethos/seeds/brooklyn_seed_data_test.exs, which
  # copied it from the Connecticut gate. Do not re-derive, condense or
  # "improve" one of these: a subtly weaker pattern is exactly the failure the
  # gate exists to prevent, and it does not show up as a test failure.
  #
  # The rule they enforce is that a destination page may not state how long a
  # journey takes. Durations decay — they vary by time of day, change with
  # every service revision or road project, and no research artifact supports
  # them. That rule was written into every Connecticut wave's dispatch and
  # checked in every review, and it still leaked 58 claims across 28 committed
  # files onto the live public site before a mechanical gate caught them. A
  # duration claim can hide in any string a reviewer reads separately — the
  # intro, a photo title, a photo description — so this walks every string
  # value in every seed file rather than the intro alone.
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minutes?\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip)\b/i,
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
  # Entries here are for durations that are NOT travel claims. Every entry
  # needs a manual read and a reason. Start empty; content tasks add entries
  # with justification in their reports.
  @trip_duration_allowlist []

  # Copied verbatim from the Brooklyn gate.
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

  # --- The eight assertions, each a helper over a list of file paths ------

  # 1. A destination intro is the whole body of the page: too short and the
  #    page is thinner than the county listing it sits above, too long and it
  #    stops being an orientation.
  defp intro_length_violations(paths) do
    for f <- paths,
        data = DataDestination.load!(f),
        words = data["intro"] |> String.split(~r/\s+/, trim: true) |> length(),
        words < 120 or words > 180,
        do: {Path.basename(f), "intro is #{words} words, want 120-180"}
  end

  # 2. Only licences that permit republication on a commercial site.
  defp license_violations(paths) do
    for f <- paths,
        p <- photos(DataDestination.load!(f)),
        not allowed_license?(p["license"]),
        do: {Path.basename(f), p["license"]}
  end

  # 3. Photo labels are the optimizer's lookup key: mix
  #    ethos.optimize_destination_photos resolves every
  #    /photos/destinations/{dir}/{label}.jpg from images/destinations/{label}.*,
  #    a flat namespace, so one label may never stand for two different source
  #    images. Asserted as global uniqueness rather than only "no label with
  #    two source_urls", because a label reused for the same image still writes
  #    the same bytes into two output directories for no reason — if a content
  #    task genuinely wants one image on two pages, it should give the second
  #    its own label rather than weaken this.
  defp label_violations(paths) do
    for(f <- paths, p <- photos(DataDestination.load!(f)), do: {label(p), p["source_url"]})
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
    |> Enum.filter(fn {_label, sources} -> length(sources) > 1 end)
  end

  # 4. Every referenced photo must be on disk, full size and thumb, or the page
  #    renders a broken image. mix ethos.optimize_destination_photos writes these.
  defp missing_photo_violations(paths) do
    for f <- paths,
        p <- photos(DataDestination.load!(f)),
        src <- [p["src"], p["thumb"]],
        src not in [nil, ""],
        not File.exists?(Path.join(@static_root, src)),
        do: {Path.basename(f), src}
  end

  # 5. The manifest pins each label to the Commons file it came from, so the
  #    author and licence a page prints always belong to the image beside it.
  defp provenance_violations(paths, manifest) do
    for f <- paths,
        p <- photos(DataDestination.load!(f)),
        label = label(p),
        manifest[label]["source_url"] != p["source_url"],
        do: {Path.basename(f), label, manifest[label]["source_url"], p["source_url"]}
  end

  # 6. See @trip_duration_patterns. Copied verbatim from the Brooklyn gate.
  defp trip_duration_violations(paths) do
    for f <- paths,
        data = DataDestination.load!(f),
        {path, text} <- collect_strings(data),
        pattern <- @trip_duration_patterns,
        match = Regex.run(pattern, text),
        not is_nil(match),
        matched = hd(match),
        {Path.basename(f), path, matched} not in @trip_duration_allowlist,
        uniq: true,
        do: {Path.basename(f), path, matched}
  end

  # 7. A destination record is keyed by the URL path of a page that already
  #    exists — the record adds an intro and photos to a listing page, it does
  #    not create one. A record at a path nothing routes to is content nobody
  #    can navigate to, and nothing else in this gate would notice.
  #
  #    The legitimate set is exactly what EthosWeb.DestinationController can
  #    serve, built from the same queries the controller uses:
  #
  #      - `show/2` renders a state page when list_published_guides_for_state/1
  #        is non-empty — the state slugs are Guides.list_states/0.
  #      - `county/2` renders "{state}/{county}" — the county slugs for a state
  #        are Guides.list_counties_for_state/1.
  #      - `show/2` otherwise falls through to town_show/2, which renders when
  #        list_published_guides_for_destination/1 is non-empty — those slugs
  #        are Guides.list_destinations/0. This is how /destinations/rome works.
  #
  #    Two-segment paths can only ever match the county set (a destination slug
  #    never contains a "/"), so a single flat MapSet is unambiguous.
  defp legitimate_paths do
    state_slugs = Guides.list_states() |> Enum.map(& &1.slug)

    county_paths =
      for slug <- state_slugs,
          county <- Guides.list_counties_for_state(slug),
          do: "#{slug}/#{county.slug}"

    destination_slugs = Guides.list_destinations() |> Enum.map(& &1.slug)

    MapSet.new(state_slugs ++ county_paths ++ destination_slugs)
  end

  defp unresolvable_path_violations(paths, legitimate) do
    for f <- paths,
        data = DataDestination.load!(f),
        data["path"] not in legitimate,
        do: {Path.basename(f), data["path"]}
  end

  # 8. mix ethos.optimize_destination_photos takes the directory segment inside
  #    each src literally rather than deriving it from the file's own path, so a
  #    typo'd src silently writes the optimized output to another destination's
  #    directory and the photo 404s on the page that published it. The optimizer
  #    is an authoring-time tool; this is where that mistake should fail.
  defp photo_dir_violations(paths) do
    for f <- paths,
        data = DataDestination.load!(f),
        expected = String.replace(data["path"], "/", "-"),
        p <- photos(data),
        actual = photo_dir(p["src"]),
        actual != expected,
        do: {Path.basename(f), p["src"], expected, actual}
  end

  defp photo_dir(src) when is_binary(src) do
    case String.split(src, "/") do
      ["", "photos", "destinations", dir, _file] -> dir
      _ -> nil
    end
  end

  defp photo_dir(_src), do: nil

  # --- Seeding the guide corpus ------------------------------------------
  #
  # Assertion 7 asks the guides table which destination pages exist, and in
  # test that table starts empty, so the corpus test seeds the whole shipped
  # guide corpus first (~8s). It seeds through the same modules production
  # seeds through (the ones Ethos.Release.seed_* drives) rather than inserting
  # guide rows directly, because the slugs those queries group by are derived
  # inside Guide.changeset — a hand-built universe would re-derive the very
  # thing under test.
  #
  # The JSON corpora are taken from SeedDataHelpers.all_seed_files/0 rather
  # than a hardcoded directory list, so a corpus added later is seeded here
  # too and its states and counties become legitimate destination paths
  # automatically. The code-module guides have no such enumeration and are
  # listed; RomeGuide is the one that carries no state, and so is the only
  # source of a bare destination slug such as "rome".
  #
  # Links are deliberately not applied: they resolve cross-guide references
  # and contribute nothing to state, county or destination slugs.
  defp seed_guide_corpus!(email) do
    Ethos.Seeds.ConnecticutPlaces.upsert_all!()

    for mod <- [
          Ethos.Seeds.WaterburyGuide,
          Ethos.Seeds.MiddleburyGuide,
          Ethos.Seeds.DanburyGuide,
          Ethos.Seeds.SouthburyGuide,
          Ethos.Seeds.WoodburyGuide,
          Ethos.Seeds.RomeGuide
        ],
        do: mod.upsert!(email)

    guide_files = SeedDataHelpers.all_seed_files()

    Enum.each(guide_files, &DataGuide.upsert_places!/1)
    Enum.each(guide_files, &DataGuide.upsert_guide!(&1, email))
  end

  # --- The assertions fire (proven against fixtures) ----------------------
  #
  # The fixtures live outside priv/seed_data/destinations/ so they are never
  # seeded, counted, or picked up by the corpus test. Each drives exactly one
  # helper; a fixture carrying a photo necessarily also trips the on-disk and
  # provenance helpers (there are no optimized destination photos yet and the
  # manifest is empty), which is why each test names the helper it is proving
  # rather than running the whole gate over a fixture.

  test "the intro floor and ceiling catch a short intro" do
    assert [{"short_intro.json", message}] =
             intro_length_violations([fixture("short_intro.json")])

    assert message =~ "want 120-180"
  end

  test "the licence allowlist catches a non-free licence" do
    assert [{"bad_license.json", "All rights reserved"}] =
             license_violations([fixture("bad_license.json")])
  end

  test "label uniqueness catches one label standing for two images" do
    assert [{"duplicate-label-destinations", sources}] =
             label_violations([fixture("dup_label.json")])

    assert length(Enum.uniq(sources)) == 2
  end

  test "the on-disk check catches a photo that was never optimized" do
    # Guards the root itself: if @static_root were wrong every photo would look
    # missing and this helper would be useless in the direction that matters.
    assert File.dir?(Path.join(@static_root, "photos"))

    violations = missing_photo_violations([fixture("missing_photo.json")])

    assert [
             {"missing_photo.json",
              "/photos/destinations/connecticut-new-london-county/nowhere.jpg"},
             {"missing_photo.json",
              "/photos/destinations/connecticut-new-london-county/nowhere_thumb.jpg"}
           ] = violations
  end

  test "manifest provenance catches a credit that disagrees with the manifest" do
    label = "bad-license-destinations"
    published = "https://commons.wikimedia.org/wiki/File:Fixture_destination_photo.jpg"

    assert provenance_violations(
             [fixture("bad_license.json")],
             %{label => %{"source_url" => published}}
           ) == []

    assert [{"bad_license.json", ^label, "https://example.invalid/other", ^published}] =
             provenance_violations(
               [fixture("bad_license.json")],
               %{label => %{"source_url" => "https://example.invalid/other"}}
             )
  end

  test "the trip-duration ban catches a duration claim, and only there" do
    # Several of the eleven patterns legitimately fire on the same sentence —
    # that overlap is the detector working as designed, not a bug, so this
    # asserts the fixture is caught at all rather than pinning a match count.
    violations = trip_duration_violations(Path.wildcard(Path.join(@fixture_dir, "*.json")))

    assert violations != []

    assert Enum.all?(violations, fn {file, _path, _matched} -> file == "trip_duration.json" end),
           "fixtures other than trip_duration.json contain duration phrasing: #{inspect(violations)}"
  end

  test "the path check accepts state, county and town paths and rejects an unrouted one" do
    # A deliberately small universe rather than the whole corpus: one
    # Connecticut town file gives a state and a county, and the Rome guide —
    # which has no state — gives a destination slug, so all three branches of
    # legitimate_paths/0 are exercised for well under a second.
    user = user_fixture()
    avon = Path.expand("../../../priv/seed_data/connecticut/avon.json", __DIR__)

    DataGuide.upsert_places!(avon)
    DataGuide.upsert_guide!(avon, user.email)
    Ethos.Seeds.RomeGuide.upsert!(user.email)

    legitimate = legitimate_paths()

    assert "connecticut" in legitimate
    assert "connecticut/hartford-county" in legitimate
    assert "rome" in legitimate

    good = ~w(trip_duration.json short_intro.json town_path.json) |> Enum.map(&fixture/1)
    assert unresolvable_path_violations(good, legitimate) == []

    assert [{"unknown_path.json", "atlantis/lost-county"}] =
             unresolvable_path_violations([fixture("unknown_path.json")], legitimate)
  end

  test "the photo-directory check catches a src pointing at another destination" do
    assert [
             {"bad_photo_dir.json", _src, "connecticut-tolland-county",
              "connecticut-windham-county"}
           ] = photo_dir_violations([fixture("bad_photo_dir.json")])
  end

  # --- The committed corpus obeys all of them ----------------------------

  test "every committed destination seed file is valid and resolves to a real page" do
    files = files()

    # The roster-count assertion is deliberately absent here — it lands with
    # the content, in the task that ships the thirteen files. Until then this
    # test passes vacuously over an empty directory, which is correct: the
    # fixture tests above are what prove each helper actually fires.

    intros = intro_length_violations(files)
    assert intros == [], "destination intros outside 120-180 words: #{inspect(intros)}"

    licenses = license_violations(files)

    assert licenses == [],
           "photo licences that are not Public domain, CC0 or CC BY(-SA) x.y: " <>
             inspect(licenses)

    labels = label_violations(files)

    assert labels == [],
           "photo labels used more than once (the optimizer's source lookup, " <>
             "images/destinations/{label}.*, is a flat namespace): " <> inspect(labels)

    missing = missing_photo_violations(files)

    assert missing == [],
           "seed photos with no optimized file on disk — run " <>
             "mix ethos.optimize_destination_photos: " <> inspect(missing)

    unpinned = provenance_violations(files, manifest())

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: " <>
             inspect(unpinned)

    durations = trip_duration_violations(files)

    assert durations == [],
           "trip-duration phrasing found (banned — name the road, line or bordering town " <>
             "instead of how long the trip takes): " <> inspect(durations)

    dirs = photo_dir_violations(files)

    assert dirs == [],
           "photo srcs whose directory is not the destination's own path with \"/\" replaced " <>
             "by \"-\" (the optimizer trusts this segment literally and would write the file " <>
             "into another destination's directory): " <> inspect(dirs)

    user = user_fixture()
    seed_guide_corpus!(user.email)
    unrouted = unresolvable_path_violations(files, legitimate_paths())

    assert unrouted == [],
           "destination seed files at a path no destination page is served from — want a " <>
             "state slug, \"{state}/{county}\", or a published guide's destination slug: " <>
             inspect(unrouted)

    # The records themselves must load and upsert idempotently.
    for _pass <- 1..2, do: Enum.each(files, &DataDestination.upsert!/1)

    assert length(Ethos.Destinations.list_destinations()) == length(files)
  end
end
