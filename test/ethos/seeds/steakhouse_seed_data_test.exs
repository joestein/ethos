defmodule Ethos.Seeds.SteakhouseSeedDataTest do
  @moduledoc """
  The gate every steakhouse content wave must pass.

  Modelled on `Ethos.Seeds.KoreanBbqSeedDataTest`, whose most valuable property
  is that it enforces its inclusion rule as a test — *every presented
  restaurant's prose names a grill at the table*. The steakhouse equivalent is
  `every presented room's prose evidences that steak is its centre of gravity`,
  and without it "steak is the menu's centre of gravity" is a sentence in a
  document that nothing checks.

  ## The authority

  `docs/superpowers/plans/2026-09-06-steakhouse-content-rules.md` is the prose
  authority; this file is the mechanical one. §8 of that document says so
  explicitly: *"Once the gate is committed, read the file itself; if it and this
  section ever disagree, the file wins and this section is the bug."* Every
  specimen in §8a-§8d is carried below as a self-test, so the document's claims
  about what is caught and what publishes are executed rather than asserted in
  prose.

  ## The four bans

  Superlatives (§8a), unsourced dry-aging durations (§8b), unsourced founding
  and "oldest" claims (§8c) and prices (§8d), run over every prose field: the
  guide intro, every section body, every FAQ question and answer, every place
  summary, every place history and every entry note. There is no allowlist and
  no proper-noun exemption — §8a's own worked example is that the award title
  *World's 101 Best Steak Restaurants* trips `\\bbest\\b` and must be
  paraphrased.

  ## One ban is deliberately NOT automated

  §8b bans two things: an unsourced dry-aging duration, and a *uniqueness claim
  about a programme*. Only the first is a regex. See the comment above
  `@unsourced_aging` — the uniqueness half is reviewer-enforced by decision, and
  neither silently automated here nor silently dropped.

  ## Green against an empty corpus

  The gate lands before the content so it can bite as files arrive. Every test
  here is a comprehension over `docs/0`, so an empty corpus passes vacuously —
  with one deliberate exception, `the corpus matches the roster's built rows`,
  which is red from this commit until the content waves author the eleven
  `build` cities. That red is expected and was ruled on; any *other* red test in
  this file is a real failure and must not be allowed to hide behind it.
  """
  use ExUnit.Case, async: true

  @dir Path.join(["priv", "seed_data", "steakhouse"])
  @roster Path.join(["priv", "seed_data", "steakhouse_roster.json"])

  defp files, do: Path.wildcard(Path.join(@dir, "*.json")) |> Enum.sort()
  defp docs, do: Enum.map(files(), &{&1, &1 |> File.read!() |> Jason.decode!()})
  defp roster, do: @roster |> File.read!() |> Jason.decode!()
  defp built, do: for(r <- roster(), r["status"] == "build", do: r)

  defp prose(doc) do
    g = doc["guide"]

    [g["intro"] | Enum.map(g["sections"] || [], & &1["body"])] ++
      Enum.flat_map(g["faq"] || [], &[&1["question"], &1["answer"]]) ++
      Enum.map(doc["places"] || [], & &1["summary"]) ++
      Enum.map(doc["places"] || [], &(&1["history"] || "")) ++
      Enum.map(doc["entries"] || [], & &1["note"])
  end

  # ------------------------------------------------------------------
  # §8a — no superlatives
  # ------------------------------------------------------------------

  @superlatives [
    ~r/\bbest\b/i,
    ~r/\bfinest\b/i,
    ~r/\bmost famous\b/i,
    ~r/\bgreatest\b/i,
    ~r/\bunrivalled\b/i,
    ~r/\bunrivaled\b/i
  ]

  defp superlative?(text) when is_binary(text),
    do: Enum.any?(@superlatives, &Regex.match?(&1, text))

  # ------------------------------------------------------------------
  # §8d — no price points or tasting-menu costs
  # ------------------------------------------------------------------

  @price [~r/\$\d/, ~r/\bper person\b/i, ~r/\btasting menu costs\b/i]

  defp price?(text) when is_binary(text), do: Enum.any?(@price, &Regex.match?(&1, text))

  test "the superlative ban catches every §8a specimen it must and spares every one it must not" do
    for specimen <- [
          "the best steak in the city",
          "the finest dry-aging programme in London",
          "Midtown's most famous dining room",
          "the greatest porterhouse in New York"
        ] do
      assert superlative?(specimen), "§8a says this must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "a James Beard award in 2019",
          "placed 13th on the 2026 World's 101 ranking of steak restaurants",
          "the dining room seats 180 under a stained-glass skylight",
          "Michelin awarded the room one star",
          "the oldest room on the block, per the city register"
        ] do
      refute superlative?(specimen), "§8a says this must publish: #{inspect(specimen)}"
    end

    # The trap §8a names: the award title itself trips the ban, which is why the
    # ranking is paraphrased rather than quoted. Pinned so nobody "corrects" the
    # title back in and expects the gate to tolerate it.
    assert superlative?("on the World's 101 Best Steak Restaurants 2026 list")
  end

  test "the price ban catches every §8d specimen it must and spares every one it must not" do
    for specimen <- [
          "the porterhouse is $140",
          "about ninety dollars per person",
          "an all-you-can-eat option runs at $100 per person",
          "the tasting menu costs £95"
        ] do
      assert price?(specimen), "§8d says this must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "opened in 1885",
          "the porterhouse is carved for two at the table",
          "the rodizio price covers fourteen cuts carried round on skewers",
          "a fixed-price chop house menu, with the cuts listed by weight"
        ] do
      refute price?(specimen), "§8d says this must publish: #{inspect(specimen)}"
    end
  end

  test "no committed prose publishes a superlative or a price" do
    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      refute superlative?(text),
             "#{file}: superlative in #{inspect(String.slice(text, 0, 120))}"

      refute price?(text), "#{file}: price in #{inspect(String.slice(text, 0, 120))}"
    end
  end

  # ------------------------------------------------------------------
  # §1c — the inclusion rule, enforced
  # ------------------------------------------------------------------

  # This is the steakhouse equivalent of korean_bbq's "every presented
  # restaurant's prose names a grill at the table", and it is the single most
  # valuable test in this file: without it, "steak is the centre of gravity" is
  # a sentence in a document that nothing checks, and the city lists drift.
  @beef_evidence [
    ~r/\bdry-aged?\b/i,
    ~r/\bporterhouse\b/i,
    ~r/\bribeye\b/i,
    ~r/\brib eye\b/i,
    ~r/\bstrip steak\b/i,
    ~r/\bfilet\b/i,
    ~r/\bt-bone\b/i,
    ~r/\btomahawk\b/i,
    ~r/\bchophouse\b/i,
    ~r/\bsteakhouse\b/i,
    ~r/\bsteaks?\b/i,
    ~r/\bchurrasco\b/i,
    ~r/\brodizio\b/i,
    ~r/\bparrilla\b/i,
    ~r/\bwagyu\b/i,
    ~r/\basado\b/i,
    ~r/\bbeef\b/i
  ]

  defp beef_evidence?(text) when is_binary(text),
    do: Enum.any?(@beef_evidence, &Regex.match?(&1, text))

  defp beef_evidence?(_), do: false

  test "the beef-evidence patterns recognise a steak room and reject a brasserie" do
    assert beef_evidence?("a dry-aged porterhouse for two, carved tableside")
    assert beef_evidence?("a churrasco rodizio with fourteen cuts")
    assert beef_evidence?("an Argentine parrilla over quebracho coals")
    assert beef_evidence?("a counter serving A5 wagyu by the ounce")

    refute beef_evidence?("a neighbourhood bistro with a raw bar and a wine list")
    refute beef_evidence?("the dining room seats sixty under a pressed-tin ceiling")

    # §1c's own worked failure: a summary that would describe an empanada shop
    # equally well is a summary the gate is right to reject.
    refute beef_evidence?(
             "a warm Argentine dining room in Elmhurst with a tiled floor and a long bar"
           )
  end

  test "every presented room's prose evidences that steak is its centre of gravity" do
    for {file, doc} <- docs(), p <- doc["places"] do
      text = "#{p["summary"]} #{p["history"]}"

      assert beef_evidence?(text),
             "#{file}: #{p["slug"]} is published as a steakhouse but its prose never " <>
               "evidences beef — the inclusion rule is that steak is the menu's centre " <>
               "of gravity, and this room does not read like one"
    end
  end

  # ------------------------------------------------------------------
  # §8b and §8c — claims that need their source in the same field
  # ------------------------------------------------------------------

  @unsourced_age [~r/\boldest\b/i, ~r/\bsince \d{4}\b/i, ~r/\bfounded in \d{4}\b/i]

  # §8b's uniqueness half is DELIBERATELY NOT AUTOMATED.
  #
  # The ban is "no unsourced dry-aging duration, AND no uniqueness claim about a
  # programme". Only the duration is a regex. "the only in-house dry-aging
  # programme in the city" and "the city's sole Himalayan salt-tiled aging room"
  # match nothing below and pass this gate; the content rules record them as
  # reviewer-enforced, and a reviewer must catch them.
  #
  # `\bthe only\b` and `\bsole\b` are the patterns to add if the project ever
  # decides to automate it — they are named here so the omission is a recorded
  # decision rather than an oversight. Adding them is not free: "the only room
  # on the block with a dry-aging locker" is a sourceable fact, and the ban as
  # written has no source-marker escape hatch for it.
  @unsourced_aging [~r/\baged (?:for )?\d+ days?\b/i, ~r/\b\d+-day dry-aged?\b/i]

  @source_marker ~r/\b(according to|per|the restaurant says|its own|register|landmark)\b/i

  defp sourced?(text) when is_binary(text), do: Regex.match?(@source_marker, text)

  defp age_or_aging_claim?(text) when is_binary(text),
    do: Enum.any?(@unsourced_age ++ @unsourced_aging, &Regex.match?(&1, text))

  # A claim publishes only if the SAME field carries the source. The gate tests
  # one string at a time, so a citation two paragraphs away does not save you.
  defp unsourced_claim?(text) when is_binary(text),
    do: age_or_aging_claim?(text) and not sourced?(text)

  test "the age and dry-aging bans catch every specimen §8b and §8c say they must" do
    for specimen <- [
          "aged 45 days in house",
          "a 28-day dry-aged ribeye",
          "beef aged for 60 days in a glass locker by the door"
        ] do
      assert unsourced_claim?(specimen), "§8b says this must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "the oldest steakhouse in the city",
          "serving chops since 1885",
          "founded in 1868 by the Gallagher family",
          "New York's oldest continuously operating dining room"
        ] do
      assert unsourced_claim?(specimen), "§8c says this must be caught: #{inspect(specimen)}"
    end
  end

  test "the age and dry-aging bans spare every specimen §8b and §8c say must publish" do
    for specimen <- [
          "aged 45 days, according to the restaurant's own menu",
          "a dry-aging room visible from the bar",
          "the beef hangs in a glass-fronted locker at the entrance",
          "dry-aged beef, per the operator's own description of the programme"
        ] do
      refute unsourced_claim?(specimen), "§8b says this must publish: #{inspect(specimen)}"
    end

    for specimen <- [
          "the oldest continuously operating steakhouse in the borough, per the Landmarks Preservation Commission designation report",
          "trading since 1885, according to the restaurant's own history",
          "the room opened in the 1880s and closed for renovation in 2021",
          "the building carries an 1885 date stone above the door"
        ] do
      refute unsourced_claim?(specimen), "§8c says this must publish: #{inspect(specimen)}"
    end

    # There are two ways to publish, and they are not the same test. These trip
    # a pattern and are spared only because the source sits in the same field —
    # a `refute unsourced_claim?` alone would pass even if the pattern had been
    # broken and never fired at all.
    for specimen <- [
          "aged 45 days, according to the restaurant's own menu",
          "the oldest continuously operating steakhouse in the borough, per the Landmarks Preservation Commission designation report",
          "trading since 1885, according to the restaurant's own history"
        ] do
      assert age_or_aging_claim?(specimen),
             "this specimen is meant to trip a pattern and be spared by its source, " <>
               "but nothing fired: #{inspect(specimen)}"
    end

    # These publish because they assert nothing the ban covers.
    for specimen <- [
          "a dry-aging room visible from the bar",
          "the beef hangs in a glass-fronted locker at the entrance",
          "dry-aged beef, per the operator's own description of the programme",
          "the room opened in the 1880s and closed for renovation in 2021",
          "the building carries an 1885 date stone above the door"
        ] do
      refute age_or_aging_claim?(specimen),
             "this specimen should trip no pattern at all: #{inspect(specimen)}"
    end
  end

  test "no age or dry-aging claim publishes without naming its source" do
    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      refute unsourced_claim?(text),
             "#{file}: an age or dry-aging claim publishes with no source: " <>
               inspect(String.slice(text, 0, 140))
    end
  end

  # ------------------------------------------------------------------
  # Shape
  # ------------------------------------------------------------------

  test "every place is a restaurant with a status the schema accepts" do
    for {file, doc} <- docs(), p <- doc["places"] do
      assert p["kind"] == "restaurant", "#{file}: #{p["slug"]} has kind #{inspect(p["kind"])}"

      assert p["status"] in ~w(open closed),
             "#{file}: #{p["slug"]} status #{inspect(p["status"])}"
    end
  end

  test "every entry resolves to a place in its own file" do
    for {file, doc} <- docs() do
      slugs = MapSet.new(doc["places"], & &1["slug"])

      for e <- doc["entries"] do
        assert e["kind"] == "food", "#{file}: entry #{e["name"]} has kind #{inspect(e["kind"])}"

        assert MapSet.member?(slugs, e["place_slug"]),
               "#{file}: entry #{e["name"]} names #{e["place_slug"]}, which the file does not define"
      end
    end
  end

  # Beyond the brief, from content rules §5: an empty `entries` array orphans
  # every place in the file — the seed passes, the images pass, and the guide
  # renders with no rooms on it. It has happened in this project before. The
  # rule is one entry per place, so the two lists are the same length.
  test "every place is carried by an entry, so no room is orphaned on its guide" do
    for {file, doc} <- docs() do
      places = doc["places"] || []
      entries = doc["entries"] || []

      refute entries == [], "#{file}: entries is empty, which orphans every place in the file"

      linked = MapSet.new(entries, & &1["place_slug"])

      for p <- places do
        assert MapSet.member?(linked, p["slug"]),
               "#{file}: #{p["slug"]} is a place no entry names, so it renders on no guide"
      end

      assert length(entries) == length(places),
             "#{file}: #{length(entries)} entries against #{length(places)} places; they are 1:1"
    end
  end

  test "no steakhouse place restates one another corpus already owns" do
    ours = for {_f, doc} <- docs(), p <- doc["places"], into: MapSet.new(), do: p["slug"]

    theirs =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          not String.contains?(f, "/steakhouse/"),
          doc = f |> File.read!() |> Jason.decode!(),
          is_list(doc["places"]),
          p <- doc["places"],
          into: MapSet.new(),
          do: p["slug"]

    dupes = MapSet.intersection(ours, theirs) |> MapSet.to_list()

    assert dupes == [],
           "these rooms are already published by another corpus and must be linked, not restated: #{inspect(dupes)}"
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

  # ------------------------------------------------------------------
  # §7 — photos
  # ------------------------------------------------------------------

  test "every guide carries exactly one photo, and every place none" do
    for {file, doc} <- docs() do
      assert length(doc["guide"]["photos"] || []) == 1,
             "#{file}: guide carries #{length(doc["guide"]["photos"] || [])} photos, expected 1"

      for p <- doc["places"] do
        assert (p["photos"] || []) == [],
               "#{file}: #{p["slug"]} carries a photo; places carry none"
      end
    end
  end

  test "every photograph carries a publishable licence and its attribution" do
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

      # Photos are served from priv/photos by their own Plug.Static (see
      # endpoint.ex), not from priv/static — EthosWeb.static_paths/0 never
      # lists a "photos" directory, so a file resolved under priv/static
      # would pass this gate and 404 in production. Strip the leading
      # "/photos/" and resolve under priv/photos/, matching every sibling
      # corpus's seed-data test (e.g. Ethos.Seeds.ManhattanSeedDataTest).
      assert File.exists?(
               Path.join(["priv", "photos", String.trim_leading(photo["src"], "/photos/")])
             ),
             "#{file}: photo file #{photo["src"]} is not on disk under priv/photos/"
    end
  end

  # ------------------------------------------------------------------
  # The corpus against the roster
  # ------------------------------------------------------------------

  # EXPECTED RED until the content waves land. The roster names eleven `build`
  # cities and the corpus is empty, so this fails from the commit that
  # introduces it. That is the point: it is the checklist that says which files
  # are still owed. Every other test in this file must be green, and a second
  # failure here is a real one.
  test "the corpus matches the roster's built rows" do
    expected = built() |> Enum.map(& &1["slug"]) |> Enum.sort()
    actual = files() |> Enum.map(&(&1 |> Path.basename() |> Path.rootname())) |> Enum.sort()

    assert actual == expected,
           "corpus and roster disagree — only in corpus: #{inspect(actual -- expected)}, " <>
             "only in roster: #{inspect(expected -- actual)}"
  end
end
