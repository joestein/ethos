defmodule Ethos.Seeds.SkiSeedDataTest do
  @moduledoc """
  The gate every ski content wave must pass.

  Modelled on `Ethos.Seeds.SteakhouseSeedDataTest` and, through it, on
  `Ethos.Seeds.KoreanBbqSeedDataTest`, whose most valuable property is that it
  enforces its inclusion rule as a test rather than as a sentence in a
  document. The ski equivalent is *every published ski area's prose evidences
  lift-served skiing* — without it "operating, lift-served, open to the public"
  is a rule nothing checks, and the roster drifts region by region.

  ## What this gate cannot do

  Spec §5's amendment, written after the steakhouse corpus shipped three waves
  of unsourced prose past a gate at least this thorough: **a prose gate catches
  shapes. It cannot tell a verified sentence from a well-formed invented one.**
  Every ban below is a regex over published strings. "Mount Snow's summit is at
  3,600 feet" trips the elevation ban and is spared by a source marker; nothing
  here can tell whether the source named is the source that says it. That is
  what `docs/ski/new-england.md` and the reverse check are for.

  ## The bans, and what they sweep

  Superlatives, unsourced mountain statistics (vertical drop, acreage, lift
  count, elevation), unsourced snowfall averages, undated pass affiliations,
  unsourced distances and drive times, and atmosphere presented as observation
  — run over every prose field: the guide intro, every section body, every FAQ
  question and answer, every place summary, every place history, every entry
  note and every photo `title` and `description`. A caption is published prose
  and is swept like any other sentence.

  ## Green against an empty corpus

  Every test is a comprehension over `docs/0`, so an empty corpus passes
  vacuously — except `the corpus matches the roster's built rows`, which is
  red from this commit until the last content wave lands. That red is expected;
  any *other* red in this file is real.
  """
  use ExUnit.Case, async: true

  @dir Path.join(["priv", "seed_data", "ski"])
  @roster Path.join(["priv", "seed_data", "ski_areas_roster.json"])

  defp files, do: Path.wildcard(Path.join(@dir, "*.json")) |> Enum.sort()
  defp docs, do: Enum.map(files(), &{&1, &1 |> File.read!() |> Jason.decode!()})
  defp roster, do: @roster |> File.read!() |> Jason.decode!()
  defp built, do: for(a <- roster()["areas"], a["status"] == "build", do: a)

  # Every published string in the file.
  defp prose(doc) do
    g = doc["guide"]
    photos = (g["photos"] || []) ++ Enum.flat_map(doc["places"] || [], &(&1["photos"] || []))

    [g["intro"] | Enum.map(g["sections"] || [], & &1["body"])] ++
      Enum.flat_map(g["faq"] || [], &[&1["question"], &1["answer"]]) ++
      Enum.map(doc["places"] || [], & &1["summary"]) ++
      Enum.map(doc["places"] || [], &(&1["history"] || "")) ++
      Enum.map(doc["entries"] || [], & &1["note"]) ++
      Enum.flat_map(photos, &[&1["title"], &1["description"]])
  end

  # ------------------------------------------------------------------
  # The source marker, shared by four bans
  # ------------------------------------------------------------------

  # A claim publishes only if the SAME field carries its source. The gate tests
  # one string at a time, so a citation two paragraphs away does not save you —
  # and that is deliberate: a reader meets the number and the attribution in the
  # same breath or not at all.
  @source_marker ~r/\b(according to|per |reported by|the operator|the resort's own|its own|the state of|state of \w+|register|survey|U\.S\. Forest Service|Forest Service|National Weather Service|NOAA|Ski (?:Areas?|Vermont|New Hampshire|Maine))\b/i

  defp sourced?(text) when is_binary(text), do: Regex.match?(@source_marker, text)

  # ------------------------------------------------------------------
  # Ban 1 — superlatives (spec §5)
  # ------------------------------------------------------------------

  @superlatives [
    ~r/\bbest\b/i,
    ~r/\bfinest\b/i,
    ~r/\bsteepest\b/i,
    ~r/\bmost challenging\b/i,
    ~r/\bmost difficult\b/i,
    ~r/\bgreatest\b/i,
    ~r/\bunrivalled\b/i,
    ~r/\bunrivaled\b/i
  ]

  defp superlative?(text) when is_binary(text),
    do: Enum.any?(@superlatives, &Regex.match?(&1, text))

  test "the superlative ban catches what it must and spares what it must not" do
    for specimen <- [
          "the best skiing in New England",
          "the steepest lift-served pitch in the East",
          "the most challenging terrain in Vermont",
          "the finest glades in the state"
        ] do
      assert superlative?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "a single chairlift serves the summit",
          "the trail network is rated more difficult than most of its neighbours by the operator",
          "the co-operative bought the mountain in 1995",
          "twenty-seven named trails, per the operator's own trail listing"
        ] do
      refute superlative?(specimen), "must publish: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 2 — mountain statistics (spec §5: "these are marketing numbers and
  # sources disagree")
  # ------------------------------------------------------------------

  @statistics [
    ~r/\bvertical (?:drop|rise)\b/i,
    ~r/\b[\d,]+\s*(?:vertical\s+)?(?:feet|ft\.?)\b/i,
    ~r/\b[\d,]+\s*(?:skiable\s+)?acres\b/i,
    ~r/\b\d+\s*(?:chair)?lifts?\b/i,
    ~r/\b\d+\s*(?:named\s+)?trails?\b/i,
    ~r/\b\d+\s*(?:ski\s+)?runs?\b/i
  ]

  defp statistic?(text) when is_binary(text),
    do: Enum.any?(@statistics, &Regex.match?(&1, text))

  defp unsourced_statistic?(text) when is_binary(text),
    do: statistic?(text) and not sourced?(text)

  test "the statistics ban catches an unsourced number and spares a sourced one" do
    for specimen <- [
          "a vertical drop of 2,037 feet",
          "2,600 skiable acres across three peaks",
          "11 lifts serve the mountain",
          "the mountain has 145 trails"
        ] do
      assert unsourced_statistic?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "a vertical drop of 2,037 feet, according to the operator's own mountain statistics",
          "2,600 skiable acres, per the resort's own trail map legend",
          "eleven lifts, per the operator's lift listing for the current season"
        ] do
      refute unsourced_statistic?(specimen), "must publish: #{inspect(specimen)}"
    end

    # Non-vacuity, and it is a different assertion from the two above. These
    # trip a pattern and are spared only because the source sits in the same
    # field. A `refute unsourced_statistic?` alone would also pass if every
    # pattern here had been broken and fired on nothing at all.
    for specimen <- [
          "a vertical drop of 2,037 feet, according to the operator's own mountain statistics",
          "2,600 skiable acres, per the resort's own trail map legend"
        ] do
      assert statistic?(specimen),
             "this specimen must trip a pattern and be spared by its source, " <>
               "but nothing fired: #{inspect(specimen)}"
    end

    # And these trip nothing at all, which is the third distinct case.
    for specimen <- [
          "a single chairlift, unchanged since 1948",
          "the base lodge burned in 1975 and was rebuilt the following season",
          "the co-operative issues shares to skiers rather than to investors"
        ] do
      refute statistic?(specimen), "this specimen should trip no pattern: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 3 — snowfall (spec §5: named source AND the period it covers)
  # ------------------------------------------------------------------

  @snowfall [
    ~r/\b(?:annual|average)\s+snowfall\b/i,
    ~r/\bsnowfall\s+aver/i,
    ~r/\b[\d,]+\s*(?:inches|in\.|")\s+of\s+snow\b/i,
    ~r/\b[\d,]+\s*(?:inches|in\.|")\s+(?:annually|a\s+year|per\s+(?:year|season))\b/i
  ]

  # The period the average covers, in the same field — "1991-2020", "over
  # thirty seasons", "the last ten winters". A snowfall average with no period
  # is not a weaker claim than one with a period; it is a different and
  # unfalsifiable claim.
  @period ~r/\b(?:19|20)\d\d\s*[-–]\s*(?:19|20)?\d\d\b|\b(?:over|across|the last)\s+\w+\s+(?:years|seasons|winters)\b/i

  defp snowfall?(text) when is_binary(text), do: Enum.any?(@snowfall, &Regex.match?(&1, text))

  defp unsourced_snowfall?(text) when is_binary(text),
    do: snowfall?(text) and not (sourced?(text) and Regex.match?(@period, text))

  test "the snowfall ban demands both a source and a period" do
    for specimen <- [
          "average snowfall of 250 inches",
          "the mountain gets 180 inches of snow",
          "annual snowfall is among the heaviest in the state",
          "250 inches a year, according to the operator"
        ] do
      assert unsourced_snowfall?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "average snowfall of 250 inches over the 1991-2020 normal period, per the National Weather Service",
          "the summit recorded 180 inches of snow across the last ten winters, according to the operator's own log"
        ] do
      refute unsourced_snowfall?(specimen), "must publish: #{inspect(specimen)}"
    end

    # Non-vacuity: the sparing above must come from the source and the period,
    # not from a pattern that never fired.
    assert snowfall?(
             "average snowfall of 250 inches over the 1991-2020 normal period, per the National Weather Service"
           )

    # The fourth caught specimen is the one that matters most: it HAS a source
    # and is still caught, because it has no period.
    assert sourced?("250 inches a year, according to the operator")
    assert unsourced_snowfall?("250 inches a year, according to the operator")
  end

  # ------------------------------------------------------------------
  # Ban 4 — pass affiliation (spec §5: current season's source, date-stamped)
  # ------------------------------------------------------------------

  @pass ~r/\b(Epic|Ikon|Indy|Mountain Collective)\s+Pass\b/i
  @season ~r/\b20\d\d\s*[-–\/]\s*(?:20)?\d\d\b/

  defp pass_claim?(text) when is_binary(text), do: Regex.match?(@pass, text)

  defp undated_pass?(text) when is_binary(text),
    do: pass_claim?(text) and not (sourced?(text) and Regex.match?(@season, text))

  test "a pass affiliation publishes only date-stamped and sourced" do
    for specimen <- [
          "on the Ikon Pass",
          "an Epic Pass mountain",
          "the Indy Pass includes two days here",
          "on the Ikon Pass, according to the operator"
        ] do
      assert undated_pass?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "on the Ikon Pass for the 2026-27 season, per the operator's own pass page",
          "the Indy Pass listed the area for 2026/27, according to the pass operator"
        ] do
      refute undated_pass?(specimen), "must publish: #{inspect(specimen)}"
    end

    assert pass_claim?(
             "on the Ikon Pass for the 2026-27 season, per the operator's own pass page"
           )
  end

  # ------------------------------------------------------------------
  # Ban 5 — derived relational geography (spec §5's first named class)
  # ------------------------------------------------------------------

  # A per-area artifact can record two areas' locations without recording the
  # distance or direction between them, so this is a class the artifact
  # structurally cannot catch and the gate must. Both the steakhouse corpus and
  # the geography refactor shipped defects here.
  @distance [
    ~r/\b[\d.]+\s*(?:miles?|mi\.|kilometres?|kilometers?|km)\b/i,
    ~r/\b\d+\s*(?:minutes?|min\.|hours?)\b[^.]{0,40}\b(?:drive|driving|away|north|south|east|west)\b/i,
    ~r/\ba\s+\w+[- ]minute\s+drive\b/i
  ]

  defp distance?(text) when is_binary(text), do: Enum.any?(@distance, &Regex.match?(&1, text))

  defp unsourced_distance?(text) when is_binary(text),
    do: distance?(text) and not sourced?(text)

  test "the distance ban catches a derived distance and spares a sourced one" do
    for specimen <- [
          "6 miles down the valley from Sugarbush",
          "a twenty-minute drive north",
          "40 minutes away by car",
          "1.5 km from the village"
        ] do
      assert unsourced_distance?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "6 miles from Waitsfield, per the state of Vermont's highway log",
          "the access road runs 2.5 miles from Route 17, according to the town of Fayston"
        ] do
      refute unsourced_distance?(specimen), "must publish: #{inspect(specimen)}"
    end

    assert distance?("6 miles from Waitsfield, per the state of Vermont's highway log")

    for specimen <- [
          "the road climbs from the valley floor to the base lodge",
          "Sugarbush lies further down the same valley"
        ] do
      refute distance?(specimen), "this specimen should trip no pattern: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 6 — atmosphere presented as observation (spec §5's second named class)
  # ------------------------------------------------------------------

  # "The lift line thins after two" is the spec's own example. Nobody observed
  # it, no source says it, and it reads as reportage. There is no source-marker
  # escape here: a sourced crowd claim is a strange thing to want, and the ban
  # is cheaper to enforce absolutely than to argue case by case. If a wave
  # genuinely needs one, it changes this list in its own commit with the reason.
  @atmosphere [
    ~r/\blift\s+lines?\b/i,
    ~r/\bqueues?\b/i,
    ~r/\bcrowd(?:s|ed|ing)?\b/i,
    ~r/\blocals?\s+know\b/i,
    ~r/\bin\s+the\s+know\b/i,
    ~r/\bhidden\s+gem\b/i,
    ~r/\byou'?ll\s+(?:find|feel|notice)\b/i,
    ~r/\bthins?\s+out\b/i
  ]

  defp atmosphere?(text) when is_binary(text),
    do: Enum.any?(@atmosphere, &Regex.match?(&1, text))

  test "the atmosphere ban catches observation nobody made" do
    for specimen <- [
          "the lift line thins after two",
          "queues build on Saturday mornings",
          "never crowded, even in February",
          "locals know to park at the lower lot",
          "a hidden gem in the Northeast Kingdom",
          "you'll find the glades quieter than the front side"
        ] do
      assert atmosphere?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "the single chair carries one skier at a time",
          "the co-operative caps ticket sales on peak days, per its own policy page",
          "the base lodge dates from 1948"
        ] do
      refute atmosphere?(specimen), "must publish: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # The bans over the committed corpus
  # ------------------------------------------------------------------

  # The bans are only as wide as `prose/1`. A photo caption renders on the page
  # like any other sentence, so it is swept — and this pins that, because
  # dropping the two fields back out of `prose/1` would leave every ban test
  # below still green while a superlative sat in a caption.
  test "the ban sweep reaches photo titles and descriptions" do
    synthetic = %{
      "guide" => %{
        "intro" => "an intro",
        "photos" => [%{"title" => "a caption title", "description" => "a caption description"}]
      },
      "places" => [
        %{
          "summary" => "s",
          "photos" => [%{"title" => "a place title", "description" => "a place description"}]
        }
      ],
      "entries" => []
    }

    texts = prose(synthetic)

    for field <- [
          "a caption title",
          "a caption description",
          "a place title",
          "a place description"
        ] do
      assert field in texts, "prose/1 does not sweep #{inspect(field)}"
    end
  end

  test "no committed prose trips any of the six bans" do
    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      base = "#{Path.basename(file)}: #{inspect(String.slice(text, 0, 140))}"

      refute superlative?(text), "superlative — #{base}"

      refute unsourced_statistic?(text),
             "mountain statistic with no source in the same field — #{base}"

      refute unsourced_snowfall?(text), "snowfall with no source or no period — #{base}"
      refute undated_pass?(text), "pass affiliation with no season or no source — #{base}"
      refute unsourced_distance?(text), "distance or drive time with no source — #{base}"
      refute atmosphere?(text), "atmosphere presented as observation — #{base}"
    end
  end

  # ------------------------------------------------------------------
  # The inclusion rule, enforced
  # ------------------------------------------------------------------

  # The ski equivalent of korean_bbq's "every presented restaurant's prose names
  # a grill at the table", and the single most valuable test in this file:
  # without it, "operating, lift-served, open to the public" is a rule nothing
  # checks and the roster drifts region by region.
  @lift_evidence [
    ~r/\bchair\s?lifts?\b/i,
    ~r/\bdouble chair\b/i,
    ~r/\btriple chair\b/i,
    ~r/\bquad\b/i,
    ~r/\bgondola\b/i,
    ~r/\bt-bar\b/i,
    ~r/\bj-bar\b/i,
    ~r/\brope tow\b/i,
    ~r/\bsurface lift\b/i,
    ~r/\bpoma\b/i,
    ~r/\bplatter\b/i,
    ~r/\bmagic carpet\b/i,
    ~r/\bhandle tow\b/i,
    ~r/\blift-served\b/i,
    ~r/\bski area\b/i,
    ~r/\bski(?:ing|ers?)\b/i,
    ~r/\bsnowboard/i,
    ~r/\btrail network\b/i,
    ~r/\bsnowmaking\b/i,
    ~r/\bglades?\b/i
  ]

  defp lift_evidence?(text) when is_binary(text),
    do: Enum.any?(@lift_evidence, &Regex.match?(&1, text))

  defp lift_evidence?(_), do: false

  test "the lift-evidence patterns recognise a ski area and reject a village green" do
    assert lift_evidence?("a single chairlift built in 1948 carries skiers to the summit")
    assert lift_evidence?("two T-bars and a rope tow serve the town hill")
    assert lift_evidence?("a gondola from the base village")
    assert lift_evidence?("snowmaking covers the lower trail network")

    refute lift_evidence?("a general store on the village green with a post office counter")
    refute lift_evidence?("the base lodge was rebuilt in stone after the 1975 fire")
  end

  test "every published ski area's prose evidences lift-served skiing" do
    for {file, doc} <- docs(), p <- doc["places"], p["kind"] == "ski-area" do
      text = "#{p["summary"]} #{p["history"]}"

      assert lift_evidence?(text),
             "#{file}: #{p["slug"]} is published as a ski area but its prose never " <>
               "evidences lift-served skiing — the inclusion rule is an operating, " <>
               "lift-served area open to the public, and this does not read like one"
    end
  end

  # ------------------------------------------------------------------
  # Shape
  # ------------------------------------------------------------------

  test "every file carries exactly one ski area, named for the file itself" do
    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      areas = for p <- doc["places"], p["kind"] == "ski-area", do: p

      assert length(areas) == 1,
             "#{file}: #{length(areas)} places of kind ski-area, expected exactly 1"

      assert hd(areas)["slug"] == slug,
             "#{file}: the ski area's slug is #{inspect(hd(areas)["slug"])}, but the file " <>
               "is named #{inspect(slug)} — the roster, the file and the place slug are one name"
    end
  end

  test "the guide is named for the area and sits on the area's own node" do
    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))

      assert doc["guide"]["slug"] == "#{slug}-ski-guide",
             "#{file}: guide slug is #{inspect(doc["guide"]["slug"])}, expected #{slug}-ski-guide"

      assert doc["guide"]["destination_path"] == area["destination_path"],
             "#{file}: the guide sits on #{doc["guide"]["destination_path"]} and the mountain " <>
               "on #{area["destination_path"]}; the guide is the mountain's page and they " <>
               "share a node"

      assert doc["guide"]["tier"] == "guide", "#{file}: tier is #{inspect(doc["guide"]["tier"])}"
    end
  end

  test "every place carries a kind the vocabulary accepts and a status the schema accepts" do
    kinds = MapSet.new(Ethos.Places.Place.kinds())

    for {file, doc} <- docs(), p <- doc["places"] do
      assert MapSet.member?(kinds, p["kind"]),
             "#{file}: #{p["slug"]} has kind #{inspect(p["kind"])}"

      assert p["status"] in ~w(open closed),
             "#{file}: #{p["slug"]} status #{inspect(p["status"])}"
    end

    # Spec §1: operating areas only. A closed ski area is a roster question, not
    # a content question — drop the row rather than publishing a dead mountain.
    for {file, doc} <- docs(), p <- doc["places"], p["kind"] == "ski-area" do
      assert p["status"] == "open",
             "#{file}: #{p["slug"]} is a ski area with status closed; the corpus covers " <>
               "operating areas only, so this is a roster drop, not a published guide"
    end
  end

  test "the ski area is carried by a sight entry" do
    for {file, doc} <- docs() do
      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))
      entry = Enum.find(doc["entries"], &(&1["place_slug"] == area["slug"]))

      assert entry, "#{file}: no entry names the mountain itself, so it renders on no guide"

      assert entry["kind"] == "sight",
             "#{file}: the mountain's entry has kind #{inspect(entry["kind"])}, expected sight"
    end
  end

  # An empty `entries` array orphans every place in the file — the seed passes,
  # the images pass, and the guide renders with no places on it. It has happened
  # in this project before. The rule is one entry per place, so the two lists
  # are the same length.
  test "every place is carried by an entry, so nothing is orphaned on its guide" do
    entry_kinds = MapSet.new(Ethos.Guides.Entry.kinds())

    for {file, doc} <- docs() do
      places = doc["places"] || []
      entries = doc["entries"] || []

      refute entries == [], "#{file}: entries is empty, which orphans every place in the file"

      linked = MapSet.new(entries, & &1["place_slug"])

      for p <- places do
        assert MapSet.member?(linked, p["slug"]),
               "#{file}: #{p["slug"]} is a place no entry names, so it renders on no guide"
      end

      for e <- entries do
        assert MapSet.member?(entry_kinds, e["kind"]),
               "#{file}: entry #{e["name"]} has kind #{inspect(e["kind"])}"

        assert MapSet.member?(MapSet.new(places, & &1["slug"]), e["place_slug"]),
               "#{file}: entry #{e["name"]} names #{e["place_slug"]}, which the file does not define"
      end

      assert length(entries) == length(places),
             "#{file}: #{length(entries)} entries against #{length(places)} places; they are 1:1"
    end
  end

  test "no ski place restates one another corpus already owns" do
    ours = for {_f, doc} <- docs(), p <- doc["places"], into: MapSet.new(), do: p["slug"]

    theirs =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          not String.contains?(f, "/ski/"),
          doc = f |> File.read!() |> Jason.decode!(),
          is_list(doc["places"]),
          p <- doc["places"],
          into: MapSet.new(),
          do: p["slug"]

    dupes = ours |> MapSet.intersection(theirs) |> MapSet.to_list()

    assert dupes == [],
           "these places are already published by another corpus and must be linked, " <>
             "not restated: #{inspect(dupes)}"
  end

  test "every destination_path resolves to a roster node" do
    nodes = MapSet.new(Ethos.Seeds.DestinationTree.load!(), & &1["path"])

    for {file, doc} <- docs() do
      assert MapSet.member?(nodes, doc["guide"]["destination_path"]),
             "#{file}: guide names unknown node #{doc["guide"]["destination_path"]}"

      for p <- doc["places"] do
        assert MapSet.member?(nodes, p["destination_path"]),
               "#{file}: #{p["slug"]} names unknown node #{p["destination_path"]}"
      end
    end
  end

  # Spec §2: entries cover the ski area, anything at its base area, and verified
  # places within the town or county node the guide attaches to. The tree node
  # IS the nearby rule, and this is what makes that a fact rather than a
  # sentence — a place three towns away is exactly the drift the rule exists to
  # prevent, and it is invisible on a rendered page.
  test "every place sits on the guide's node or inside its subtree" do
    for {file, doc} <- docs() do
      guide_path = doc["guide"]["destination_path"]

      for p <- doc["places"] do
        assert p["destination_path"] == guide_path or
                 String.starts_with?(p["destination_path"], guide_path <> "/"),
               "#{file}: #{p["slug"]} sits on #{p["destination_path"]}, outside the guide's " <>
                 "node #{guide_path} — the tree node is the nearby rule (spec §2)"
      end
    end
  end

  test "every link note fits the cap Ethos.Links.Link enforces" do
    for {file, doc} <- docs(), link <- doc["links"] || [] do
      note = link["note"] || ""

      assert String.length(note) <= 160,
             "#{Path.basename(file)}: link note is #{String.length(note)} characters, " <>
               "over the 160 Ethos.Links.Link.changeset/2 accepts:\n#{note}"
    end
  end

  test "every link target is a guide or place this corpus can resolve" do
    guides = for {_f, doc} <- docs(), into: MapSet.new(), do: doc["guide"]["slug"]

    all_guides =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          doc = f |> File.read!() |> Jason.decode!(),
          is_map(doc["guide"]),
          into: MapSet.new(),
          do: doc["guide"]["slug"]

    for {file, doc} <- docs(), link <- doc["links"] || [] do
      case link["target"] do
        "guide:" <> slug ->
          assert MapSet.member?(all_guides, slug),
                 "#{Path.basename(file)}: links to guide #{slug}, which no JSON corpus " <>
                   "defines. If it is a code-module guide, that is an ordering constraint " <>
                   "for docs/runbooks/seeding.md — Links.resolve!/1 raises on an unseeded " <>
                   "target and aborts the run partway"

          if not MapSet.member?(guides, slug) do
            IO.warn("#{Path.basename(file)}: links outside the ski corpus to #{slug}")
          end

        "place:" <> _slug ->
          :ok

        other ->
          flunk("#{Path.basename(file)}: bad link target #{inspect(other)}")
      end
    end
  end

  # ------------------------------------------------------------------
  # Photos (spec §6)
  # ------------------------------------------------------------------

  test "a guide carries between zero and three photos, and places carry none" do
    for {file, doc} <- docs() do
      n = length(doc["guide"]["photos"] || [])

      assert n <= 3, "#{file}: guide carries #{n} photos; spec §6 allows one to three"

      for p <- doc["places"] do
        assert (p["photos"] || []) == [],
               "#{file}: #{p["slug"]} carries a photo; the photos hang off the guide"
      end
    end
  end

  test "every photograph carries a publishable licence, its attribution and its file" do
    allowed = [
      "CC0",
      "Public domain",
      "CC BY 2.0",
      "CC BY 3.0",
      "CC BY 4.0",
      "CC BY-SA 2.0",
      "CC BY-SA 3.0",
      "CC BY-SA 4.0"
    ]

    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      assert photo["license"] in allowed, "#{file}: licence #{inspect(photo["license"])}"
      assert is_binary(photo["author"]) and photo["author"] != "", "#{file}: photo has no author"

      assert String.starts_with?(photo["source_url"] || "", "https://commons.wikimedia.org/"),
             "#{file}: photo source is not Commons"

      # Photos are served from priv/photos by their own Plug.Static (endpoint.ex),
      # not from priv/static — EthosWeb.static_paths/0 never lists a "photos"
      # directory, so a file resolved under priv/static would pass this gate and
      # 404 in production.
      assert File.exists?(
               Path.join(["priv", "photos", String.trim_leading(photo["src"], "/photos/")])
             ),
             "#{file}: photo file #{photo["src"]} is not on disk under priv/photos/"
    end
  end

  test "every photo src is under this corpus's own path" do
    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      slug = file |> Path.basename() |> Path.rootname()

      assert String.starts_with?(photo["src"], "/photos/ski/#{slug}/"),
             "#{file}: photo src #{photo["src"]} is not under /photos/ski/#{slug}/"
    end
  end

  # Spec §5: no trail maps or logos — both copyrighted. This is the ski
  # equivalent of London's Fourth Plinth exclusion, and a Commons licence on the
  # file does not make a photograph OF a copyrighted trail map publishable.
  test "no photograph is a trail map or a logo" do
    banned = [~r/\btrail map\b/i, ~r/\bpiste map\b/i, ~r/\blogo\b/i, ~r/\bsignage\b/i]

    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      text = "#{photo["title"]} #{photo["description"]} #{photo["source_url"]}"

      for pattern <- banned do
        refute Regex.match?(pattern, text),
               "#{file}: photo #{photo["src"]} looks like a trail map or a logo, " <>
                 "which spec §5 excludes: #{inspect(text)}"
      end
    end
  end

  # ------------------------------------------------------------------
  # The corpus against the roster, in BOTH directions (spec §1)
  # ------------------------------------------------------------------

  # EXPECTED RED until the last content wave lands. The roster names every
  # built New England area and the corpus starts empty, so this fails from the
  # commit that introduces it. That is the point: it is the checklist that says
  # which mountains are still owed. Every other test in this file must be
  # green, and a second failure here is a real one.
  test "the corpus matches the roster's built rows" do
    expected = built() |> Enum.map(& &1["slug"]) |> Enum.sort()
    actual = files() |> Enum.map(&(&1 |> Path.basename() |> Path.rootname())) |> Enum.sort()

    assert actual == expected,
           "corpus and roster disagree — only in corpus: #{inspect(actual -- expected)}, " <>
             "only in roster: #{inspect(expected -- actual)}"
  end

  test "each file sits on the node its roster row names" do
    by_slug = Map.new(built(), &{&1["slug"], &1})

    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      row = by_slug[slug]

      assert row, "#{file}: no roster row named #{slug}"

      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))

      assert area["destination_path"] == row["destination_path"],
             "#{file}: the mountain sits on #{area["destination_path"]}, the roster says " <>
               row["destination_path"]

      assert area["name"] == row["name"],
             "#{file}: the mountain is named #{inspect(area["name"])}, the roster says " <>
               inspect(row["name"])
    end
  end
end
