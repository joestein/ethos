defmodule Ethos.Seeds.DestinationSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Guides
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.{Catalog, DataDestination, DataGuide}

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/destination_photo_manifest.json", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/destination_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("destinations")
  defp fixture(name), do: Path.join(@fixture_dir, name)

  defp photos(data), do: data["photos"] || []

  # Total on purpose, like photo_dir/1 below: a photo with no src has no label,
  # and label_violations/1 runs before the helper that reports the missing src
  # cleanly (photo_dir_violations/1). Without this an author gets a
  # FunctionClauseError from inside Path.basename/1 instead of a file name.
  defp label(%{"src" => src}) when is_binary(src),
    do: src |> Path.basename() |> Path.rootname()

  defp label(_photo), do: nil

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
    # `walk` and `stroll` were missing from 8 and 9 in all three copies, so
    # "a short walk from the station" — the plainest vague-duration phrasing
    # there is, and the likeliest one for a walkable neighbourhood — escaped
    # every duration gate in the repo. Measured before widening: 0 hits in
    # destinations/, 0 in brooklyn/, 0 in lib/ethos/seeds/, 11 in
    # connecticut/ (all fixed in the same change), 17 in manhattan/, which
    # has no duration gate at all.
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
  # Entries here are for durations that are NOT travel claims. Every entry
  # needs a manual read and a reason. Start empty; content tasks add entries
  # with justification in their reports.
  @trip_duration_allowlist []

  # One specimen per pattern, in the order the patterns are listed above.
  #
  # Without this the eleven are load-bearing only in aggregate: the
  # trip_duration.json fixture fires patterns 1, 2 and 3, so 4 through 11 could
  # be deleted wholesale, or quietly weakened, and this suite would stay green.
  # The Brooklyn gate has the same gap. An unenforced rule is what put 58 decaying
  # travel-time claims on the live site, so "byte-identical to Brooklyn's" is
  # asserted here rather than left as a promise made at review time.
  #
  # Each specimen is a phrasing that ONLY its own pattern was written to catch —
  # other patterns may also fire on it, which is the detector overlapping by
  # design, but the assertion is indexed so deleting or weakening any single
  # pattern fails on that pattern's own line.
  @trip_duration_specimens [
    {1, "the museum is a 15-minute walk from the green"},
    {2, "the shoreline sits 20 mins south of the state line"},
    {3, "the ferry landing is about 40 min from the village"},
    {4, "the county seat is half an hour by car from the coast"},
    {5, "a drive of about 25 min separates the two greens"},
    {6, "the northwest hills are 3 hours away by car"},
    {7, "the depot stands twenty minutes north of downtown"},
    {8, "the falls are a short drive from the village center"},
    {9, "the museum is within a short drive of the campus"},
    {10, "the branch line reaches New Haven in about 45"},
    {11, "the coastal road covers the same ground in about 2 hours"}
  ]

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

  # --- The nine assertions, each a helper over a list of file paths -------

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
  #    images — a thing the namespace genuinely cannot express, and the page
  #    would print one image's credit beside another image's pixels.
  #
  #    One label standing for the SAME image in two files is not flagged.
  #    Assertion 8 forces each file's src directory to be its own path, so a
  #    shared label yields two distinct srcs from one source image and one
  #    manifest entry: the optimizer writes the same bytes into both directories
  #    and everything reconciles. Flagging it would make a state page reusing its
  #    county's photo cost a duplicated source file and a duplicated manifest
  #    entry — and a gate a content task discovers it must weaken mid-flight is a
  #    gate that gets weakened. Hence Enum.uniq/1, matching the Brooklyn and
  #    Connecticut gates. Both directions are pinned by tests below.
  defp label_violations(paths) do
    for(f <- paths, p <- photos(DataDestination.load!(f)), do: {label(p), p["source_url"]})
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
    |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)
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
        {p, label} <- Enum.map(photos(DataDestination.load!(f)), &{&1, label(&1)}),
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

  # 7. A destination record is keyed by the path of a node that already exists —
  #    the record adds an intro and photos to a hub, it does not create one. A
  #    record at a path no node owns is content nobody can navigate to, and
  #    nothing else in this gate would notice.
  #
  #    The legitimate set is the roster, read straight off
  #    `priv/seed_data/destination_tree.json`, because the roster is now the
  #    single declaration of which hubs exist:
  #    `DestinationController.show/2` resolves a path against `destinations`
  #    and 404s on a miss, and `DestinationTree.upsert_all!/0` is what puts
  #    rows in that table.
  #
  #    This replaced a set built from `Guides.list_states/0`,
  #    `list_counties_for_state/1` and `list_destinations/0` — the queries the
  #    three pre-tree routes served hubs from. Those queries return the *legacy*
  #    single-slug forms ("connecticut", "rome"), which is exactly the set of
  #    paths a curated file must no longer key on: every one of them 301s now.
  #    A file keyed there is the defect this task fixed — thirteen parentless
  #    rows that disabled thirteen redirects, entered the sitemap, and listed
  #    Connecticut, New York and Rome on `/destinations` as countries.
  defp legitimate_paths do
    MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])
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
  #
  #    `actual` is bound by the generator rather than by an `actual = ...`
  #    filter: an assignment used as a comprehension filter is ALSO a
  #    truthiness test, so binding nil there would silently drop the
  #    src-less photo this is meant to report. Same for the label binding in
  #    provenance_violations/2 above.
  #
  #    The directory is the hub's path with "/" replaced by "-", and after the
  #    re-key that is a hub's path at *either* of its names: the images sit in
  #    priv/photos/destinations/connecticut/ because that is what the record's
  #    path was when they were written. Re-keying moved the URL onto the tree
  #    ("united-states/connecticut"); it did not move a byte on disk, and there
  #    is no reason it should — a photo directory is an authoring namespace, not
  #    a URL. So a legacy dir is accepted alongside the node's own, and the one
  #    reported as `expected` is the legacy form when there is one, since that
  #    is where the files actually are.
  defp photo_dir_violations(paths) do
    for f <- paths,
        data = DataDestination.load!(f),
        acceptable = acceptable_photo_dirs(data["path"]),
        {p, actual} <- Enum.map(photos(data), &{&1, photo_dir(&1["src"])}),
        actual not in acceptable,
        do: {Path.basename(f), p["src"], hd(acceptable), actual}
  end

  # Legacy dirs first, the node's own last: a curated page's images are where
  # its pre-tree path put them, and a page authored after the tree has no legacy
  # path at all and lands under its node path.
  defp acceptable_photo_dirs(path) do
    legacy =
      Ethos.Seeds.DestinationTree.load!()
      |> Enum.find(%{}, &(&1["path"] == path))
      |> Map.get("legacy_paths", [])

    Enum.map(legacy ++ [path], &String.replace(&1, "/", "-"))
  end

  defp photo_dir(src) when is_binary(src) do
    case String.split(src, "/") do
      ["", "photos", "destinations", dir, _file] -> dir
      _ -> nil
    end
  end

  defp photo_dir(_src), do: nil

  # 9. The corpus must be exactly the destination pages shipped so far — no
  #    fewer (an accidental deletion) and no more (an unreviewed extra page
  #    landing silently, or one appearing without anyone deciding it should).
  #    This is a literal list of the paths, not a count and not a set derived
  #    from the files this test happens to find on disk: a derived expectation
  #    passes no matter which files exist, which is exactly the vacuity this
  #    assertion exists to prevent. Sourced from each file's own "path" field
  #    rather than its filename, since the filename-to-path mapping is not
  #    reversible at all any more — new-york-manhattan.json is keyed on
  #    "united-states/new-york/new-york-city/manhattan" — and the field is what
  #    the app actually serves.
  #
  #    These are node paths, not the pre-tree single-slug forms the files
  #    carried until Task 13. Each was taken from the node whose `legacy_paths`
  #    held the old key, so the curated prose and photos land on the hub the old
  #    URL now 301s to.
  #
  #    California and Illinois joined here alongside the Korean BBQ collection,
  #    and arrived keyed on the bare "california"/"illinois" forms — which are
  #    now `legacy_paths` of the real nodes, the exact defect ruling C24 fixed.
  #    `DataDestination.upsert!/1` raises on such a key, so they are re-keyed to
  #    their node paths here. Washington did not get a curated file, and the
  #    reason is simply that no page needed one: a destination record is
  #    optional decoration on a hub, and `united-states/washington` already
  #    exists in the roster with "washington" among its legacy paths, so
  #    /destinations/washington resolves with or without a curated overlay.
  @destination_roster ~w(
    united-states/california
    united-states/connecticut
    united-states/connecticut/fairfield-county
    united-states/connecticut/hartford-county
    united-states/connecticut/litchfield-county
    united-states/connecticut/middlesex-county
    united-states/connecticut/new-haven-county
    united-states/connecticut/new-london-county
    united-states/connecticut/tolland-county
    united-states/connecticut/windham-county
    united-states/illinois
    united-states/new-york
    united-states/new-york/new-york-city/brooklyn
    united-states/new-york/new-york-city/manhattan
    italy/lazio/rome
  )

  # Each curated file paired with the path it was keyed on before Task 13 — the
  # path its hub is still reachable at, as a 301. Used by the mapping test
  # below, which resolves each of these through the roster's `legacy_paths` and
  # checks the file landed on the node that owns it.
  @old_key_by_file %{
    "california.json" => "california",
    "connecticut.json" => "connecticut",
    "connecticut-fairfield-county.json" => "connecticut/fairfield-county",
    "connecticut-hartford-county.json" => "connecticut/hartford-county",
    "connecticut-litchfield-county.json" => "connecticut/litchfield-county",
    "connecticut-middlesex-county.json" => "connecticut/middlesex-county",
    "connecticut-new-haven-county.json" => "connecticut/new-haven-county",
    "connecticut-new-london-county.json" => "connecticut/new-london-county",
    "connecticut-tolland-county.json" => "connecticut/tolland-county",
    "connecticut-windham-county.json" => "connecticut/windham-county",
    "illinois.json" => "illinois",
    "new-york.json" => "new-york",
    "new-york-brooklyn.json" => "new-york/brooklyn",
    "new-york-manhattan.json" => "new-york/manhattan",
    "rome.json" => "rome"
  }

  defp roster_violations(paths) do
    paths |> Enum.map(&DataDestination.load!(&1)["path"]) |> roster_diff(@destination_roster)
  end

  # Pure set comparison, split out of roster_violations/1 so both directions
  # of the check can be pinned by a unit test below without standing up (or
  # temporarily breaking) real seed files.
  defp roster_diff(actual_paths, expected_paths) do
    actual = MapSet.new(actual_paths)
    expected = MapSet.new(expected_paths)

    missing = expected |> MapSet.difference(actual) |> Enum.sort()
    unexpected = actual |> MapSet.difference(expected) |> Enum.sort()

    {missing, unexpected}
  end

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
  # listed. RomeGuide used to be the one that carried no state; this branch
  # gave it `state: "Italy"` so the affiliate registry — keyed on state slug —
  # could reach it at all. That does not cost this gate the "rome" path:
  # legitimate_paths/0 takes its bare destination slugs from
  # `Guides.list_destinations/0`, which groups every published guide regardless
  # of state, so "rome" stays legitimate and "italy" joins the state slugs.
  #
  # Links are deliberately not applied: they resolve cross-guide references
  # and contribute nothing to state, county or destination slugs.
  # Two kinds of call here, and they are not interchangeable. The `upsert_all!`
  # pass is **places** modules; the pass below it is **guide** modules. A guide
  # seeded without its places module raises inside
  # GuideRunner.replace_entries!/2, which resolves every entry through
  # Places.get_place_by_slug!/1.
  #
  # Both lists come from Ethos.Seeds.Catalog rather than being written out
  # here, so there is one place to register a module and one test — the
  # reflection test below — that fails when a module is registered nowhere.
  defp seed_guide_corpus!(email) do
    # The loaders resolve every seed file's destination_path against the
    # destinations table and raise on a miss, so the roster comes first.
    Ethos.Seeds.DestinationTree.upsert_all!()

    for {mod, _region} <- Ethos.Seeds.Catalog.place_modules(), do: mod.upsert_all!()
    for {mod, _region} <- Ethos.Seeds.Catalog.guide_modules(), do: mod.upsert!(email)

    guide_files = SeedDataHelpers.all_seed_files()

    Enum.each(guide_files, &DataGuide.upsert_places!/1)
    Enum.each(guide_files, &DataGuide.upsert_guide!(&1, email))
  end

  # --- Registration is mechanical, not remembered -------------------------
  #
  # Everything above seeds from Ethos.Seeds.Catalog, so an unregistered guide
  # module is simply absent from this gate: it gets no loader or changeset
  # validation, and its state and county never enter legitimate_paths/0. That
  # failure is silent — nothing errors, a test just quietly covers less.
  #
  # Across a thirty-site set that is thirty chances to skip a registration and
  # never know. So the catalog is checked against the application's actual
  # modules by reflection rather than trusted: adding a guide module and
  # forgetting to register it now fails here, loudly, naming the module.
  #
  # This assertion earned itself immediately — it found AntiqueTrailGuide,
  # which had been missing from this gate since it shipped.
  #
  # Discovery is by module name, `Ethos.Seeds.<Something>Guide`, because it
  # catches RomeGuide, which hand-rolls upsert!/1 and exports no data/0 and so
  # is invisible to a behaviour-based scan. The exceptions are named
  # individually and each says why it is not a seed guide.
  @not_seed_guides [
    # The JSON loader, not a guide: it seeds priv/seed_data/*/*.json files,
    # which this gate already discovers through all_seed_files/0.
    Ethos.Seeds.DataGuide
  ]

  test "every guide module in the application is registered in the catalog" do
    {:ok, modules} = :application.get_key(:ethos, :modules)

    discovered =
      modules
      |> Enum.filter(&(inspect(&1) =~ ~r/^Ethos\.Seeds\.\w+Guide$/))
      |> Kernel.--(@not_seed_guides)
      |> MapSet.new()

    # Non-vacuous: a regex or an app-key change that matched nothing would
    # otherwise let this pass green while checking nothing at all.
    #
    # Floored at 2 and anchored on a known member rather than on today's count.
    # A floor equal to the current number of modules fails on a legitimate
    # consolidation — it would assert that guides may never be merged, which is
    # not this test's business.
    assert MapSet.size(discovered) >= 2
    assert Ethos.Seeds.WrigleyFieldGuide in discovered

    registered = Catalog.guide_modules() |> Enum.map(&elem(&1, 0)) |> MapSet.new()
    unregistered = discovered |> MapSet.difference(registered) |> Enum.sort()

    assert unregistered == [],
           "guide modules not in Ethos.Seeds.Catalog.guide_modules/0, so they are seeded by " <>
             "no gate and their destination paths never become legitimate: " <>
             inspect(unregistered)

    # And the other direction, so the catalog cannot name a module that no
    # longer exists — that would raise at seed time rather than here.
    stale = registered |> MapSet.difference(discovered) |> Enum.sort()
    assert stale == [], "catalog names guide modules that do not exist: #{inspect(stale)}"
  end

  test "every places module in the application is registered in the catalog" do
    {:ok, modules} = :application.get_key(:ethos, :modules)

    discovered =
      modules
      |> Enum.filter(&(inspect(&1) =~ ~r/^Ethos\.Seeds\.\w+Places$/))
      |> MapSet.new()

    # Anchored on a known member, not on today's count — see the guide test.
    assert MapSet.size(discovered) >= 2
    assert Ethos.Seeds.WrigleyFieldPlaces in discovered

    registered = Catalog.place_modules() |> Enum.map(&elem(&1, 0)) |> MapSet.new()

    assert MapSet.equal?(discovered, registered),
           "places modules and catalog disagree — unregistered: " <>
             inspect(MapSet.difference(discovered, registered) |> Enum.sort()) <>
             ", stale: " <> inspect(MapSet.difference(registered, discovered) |> Enum.sort())
  end

  # `Ethos.Seeds.Catalog.guides_owned/0` calls `mod.data()` on every registered
  # guide module, and the banned-prose gate reads it. A module that does not
  # export `data/0` would raise there — or, if `guides_owned/0` were ever
  # softened to skip it, would be silently unscanned, which is the exact hole
  # that function was added to close reappearing one level up.
  #
  # `Ethos.Seeds.RomeGuide` was that module: it seeds through its own path
  # rather than through `GuideRunner`, so it had no `data/0` and nothing could
  # read what it publishes without knowing its internals.
  test "every registered guide module exports data/0 with the fields the gates read" do
    for {mod, _region} <- Catalog.guide_modules() do
      assert function_exported?(mod, :data, 0),
             "#{inspect(mod)} has no data/0, so Catalog.guides_owned/0 cannot read what it " <>
               "publishes and the banned-prose gate cannot scan it"

      data = mod.data()

      assert is_map(data), "#{inspect(mod)}.data/0 did not return a map"

      assert is_binary(data[:slug]) and data[:slug] != "",
             "#{inspect(mod)}.data/0 has no slug, which the gates key their failures on"

      assert is_binary(data[:intro]) and data[:intro] != "",
             "#{inspect(mod)}.data/0 has no intro — the longest published string on the page " <>
               "and the one a prose ban most needs to see"
    end
  end

  # The catalog derives each module's source path from its name rather than
  # carrying a literal beside it, because a literal drifts from the module it
  # labels and nothing notices. This is what makes the derivation safe.
  test "every catalog module's derived source path exists on disk" do
    for {mod, _region} <- Catalog.place_modules() ++ Catalog.guide_modules() do
      path = Catalog.source_path(mod)

      assert File.exists?(Path.expand("../../../#{path}", __DIR__)),
             "#{inspect(mod)} derives source path #{path}, which does not exist"
    end
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

  # Both directions of the label rule are pinned, so neither the strict form
  # (any repeated label) nor a weaker one can be substituted for it without a
  # test failing. Only the first of these two tests exists in the Brooklyn gate.

  test "the label rule catches one label standing for two different images" do
    assert [{"duplicate-label-destinations", sources}] =
             label_violations([fixture("dup_label.json")])

    assert length(Enum.uniq(sources)) == 2
  end

  test "the label rule allows one label standing for the same image twice" do
    pair = Enum.map(~w(shared_label_a.json shared_label_b.json), &fixture/1)

    assert label_violations(pair) == []

    # The reason that is safe: assertion 8 gives each file its own src
    # directory, so the shared label resolves to one source image and one
    # manifest entry, written into two output directories.
    assert photo_dir_violations(pair) == []

    assert [
             "/photos/destinations/connecticut-windham-county/shared-label-destinations.jpg",
             "/photos/destinations/new-york-manhattan/shared-label-destinations.jpg"
           ] =
             pair
             |> Enum.flat_map(&photos(DataDestination.load!(&1)))
             |> Enum.map(& &1["src"])
             |> Enum.sort()
  end

  test "a photo with no src is reported, not raised on" do
    srcless = [fixture("no_photo_src.json")]

    # label/1 is total, so the label rule — which runs first — does not die
    # before assertion 8 can name the file.
    assert label_violations(srcless) == []

    assert [{"no_photo_src.json", nil, "new-york-brooklyn", nil}] =
             photo_dir_violations(srcless)

    # And it is not silently skipped by the provenance check either.
    assert [{"no_photo_src.json", nil, nil, _published}] =
             provenance_violations(srcless, %{})
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

  test "each of the eleven trip-duration patterns is individually load-bearing" do
    assert length(@trip_duration_patterns) == 11
    assert length(@trip_duration_specimens) == length(@trip_duration_patterns)

    for {n, specimen} <- @trip_duration_specimens do
      pattern = Enum.at(@trip_duration_patterns, n - 1)

      assert Regex.match?(pattern, specimen),
             "trip-duration pattern #{n} no longer catches #{inspect(specimen)} — " <>
               "the pattern at that position is now #{inspect(pattern)}. These are copied " <>
               "verbatim from the Brooklyn gate and must not be re-derived, condensed or " <>
               "reordered."
    end
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

  test "the path check accepts node paths at three depths and rejects one no node owns" do
    # Reads the roster off disk, so no seeding and no repo: the legitimate set
    # is the tree's own declaration of which hubs exist, and the depths below
    # are a region, a county and a city — the three shapes the thirteen curated
    # files come in.
    legitimate = legitimate_paths()

    assert "united-states/connecticut" in legitimate
    assert "united-states/connecticut/hartford-county" in legitimate
    assert "italy/lazio/rome" in legitimate

    # The pre-tree forms the files used to be keyed on are NOT legitimate — each
    # is a legacy path that 301s, and a curated record sitting on one is what
    # disabled those thirteen redirects.
    refute "connecticut" in legitimate
    refute "connecticut/hartford-county" in legitimate
    refute "rome" in legitimate

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

  # Pinned against synthetic path lists rather than real seed files, so both
  # directions of the roster check are proven permanently without standing up
  # a fourteenth fixture file or temporarily deleting a committed one.
  test "the roster diff names a missing path and an unexpected path independently" do
    assert roster_diff(~w(connecticut new-york atlantis), ~w(connecticut new-york rome)) ==
             {["rome"], ["atlantis"]}
  end

  # The mapping this task derived, pinned. Each curated file's key must be the
  # node whose `legacy_paths` holds the path the file used to be keyed on —
  # derived from the roster here rather than restated, so it stays right if a
  # node moves.
  #
  # Without this the re-key is only asserted as a list of thirteen strings in
  # @destination_roster, which anyone could edit to match a file they moved to
  # the wrong node. This says *why* each path is the one it is.
  test "each curated file sits on the node its old path redirects to" do
    legacy_owner =
      for node <- Ethos.Seeds.DestinationTree.load!(),
          legacy <- node["legacy_paths"] || [],
          into: %{},
          do: {legacy, node["path"]}

    assert map_size(@old_key_by_file) == length(files()),
           "every committed destination file needs an entry here, or the one that is missing " <>
             "is re-keyed by nobody"

    for {file, old_key} <- @old_key_by_file do
      seed_file = Enum.find(files(), &(Path.basename(&1) == file))
      assert seed_file, "#{file} is no longer a committed destination seed file"
      data = DataDestination.load!(seed_file)

      assert data["path"] == Map.get(legacy_owner, old_key),
             "#{file} is keyed on #{inspect(data["path"])}, but #{inspect(old_key)} is a " <>
               "legacy path of #{inspect(Map.get(legacy_owner, old_key))} — the curated prose " <>
               "and photos would land on a different hub than the one the old URL 301s to"
    end
  end

  test "the roster diff is empty when the two lists match, regardless of order" do
    assert roster_diff(~w(rome connecticut new-york), ~w(connecticut new-york rome)) == {[], []}
  end

  # --- The committed corpus obeys all of them ----------------------------

  test "every committed destination seed file is valid and resolves to a real page" do
    files = files()

    {missing, unexpected} = roster_violations(files)

    assert missing == [] and unexpected == [],
           "destination roster mismatch — missing: #{inspect(missing)}, " <>
             "unexpected: #{inspect(unexpected)}"

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
           "photo srcs whose directory is neither the destination's node path nor a legacy " <>
             "path of it, with \"/\" replaced by \"-\" (the optimizer trusts this segment " <>
             "literally and would write the file into another destination's directory): " <>
             inspect(dirs)

    unrouted = unresolvable_path_violations(files, legitimate_paths())

    assert unrouted == [],
           "destination seed files at a path no node in the roster owns — a curated page is " <>
             "an overlay on a hub, so its key must be that hub's node path, not a legacy " <>
             "path that 301s: " <> inspect(unrouted)

    # The records themselves must load and upsert onto nodes that already exist,
    # creating nothing. The row count is asserted to be *unchanged* across both
    # passes, which is the inverse of what this assertion said before the
    # re-key: it used to demand thirteen new rows, and those thirteen rows were
    # the defect — parentless, kindless duplicates of hubs the roster already
    # owned. The two passes stay separate so a second pass adding a row fails
    # here rather than being folded into the first.
    #
    # Seeded through seed_guide_corpus!/1 — the whole shipped corpus, the way
    # production seeds it — rather than through the roster alone. The path check
    # above no longer needs it (the roster is read off disk), but it is the only
    # place in the suite where every JSON corpus and every code seed module runs
    # end to end, and dropping it would have quietly retired that.
    user = user_fixture()
    seed_guide_corpus!(user.email)

    assert Guides.list_published_guides() != [],
           "seed_guide_corpus!/1 published nothing, so the passes below are seeding into an " <>
             "empty universe"

    before = length(Ethos.Destinations.list_destinations())

    Enum.each(files, &DataDestination.upsert!/1)
    after_first = length(Ethos.Destinations.list_destinations())

    Enum.each(files, &DataDestination.upsert!/1)
    after_second = length(Ethos.Destinations.list_destinations())

    assert after_first == before,
           "seeding the curated records created #{after_first - before} rows — every one of " <>
             "them is keyed on a node path, so all thirteen must land on rows the roster " <>
             "already owns"

    assert after_second == after_first, "re-upserting the destination records added rows"

    # Landing on the node means keeping the node's place in the tree. A record
    # that created its own row would have kind and parent_id nil, which is what
    # put Connecticut, New York and Rome on /destinations beside the countries.
    for file <- files do
      data = DataDestination.load!(file)
      node = Ethos.Destinations.get_by_path(data["path"])

      assert node.kind != nil, "#{Path.basename(file)} left #{node.path} with no kind"
      assert node.parent_id != nil, "#{Path.basename(file)} left #{node.path} a root"
      assert node.intro == data["intro"], "#{Path.basename(file)}'s intro did not reach its node"

      assert node.photos == data["photos"],
             "#{Path.basename(file)}'s photos did not reach its node"
    end
  end
end
