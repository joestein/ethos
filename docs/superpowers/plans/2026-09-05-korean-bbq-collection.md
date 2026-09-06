# Korean BBQ Collection Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish at least 100 tabletop-grill Korean BBQ restaurants across ten guides, all reachable from `/c/korean-bbq`.

**Architecture:** A collection holds guides, not places, so ten Korean BBQ guides sit in the collection and the restaurants live inside them as entries. Where the corpus already covers a neighborhood, the restaurant's place record joins that neighborhood's seed file and the Korean BBQ guide reaches it by entry — the seeder's three-pass directory load makes a cross-file entry legal. Where it does not, the Korean BBQ file owns the place outright.

**Tech Stack:** Elixir 1.18, Phoenix 1.7.14, Ecto/Postgres, ExUnit, Vix (photo optimization), Jason.

**Spec:** `docs/superpowers/specs/2026-09-05-korean-bbq-collection-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** Research happens in waves; the code that ships never calls out.
- **A restaurant qualifies only if meat is cooked at the table on a built-in grill.** Tofu houses, fried chicken, grill-less Korean restaurants, tasting menus without a grill, and kitchen-grilled meat are all excluded. AYCE is **in** when the grill is at the table.
- **The definition never moves to make the count.** If verification lands under 100 the gate goes red and the user decides.
- **`kind` must be one of exactly thirteen:** `museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction`. Every Korean BBQ place is `restaurant`. There is no `bbq`, `grill` or `korean` kind.
- **`status` is exactly `"open"` or `"closed"`.** Not prose.
- **`town` names the physical municipality, never the postal one.** Yetgol Old Village prints "Seattle, WA 98133" and is in Shoreline.
- **Buena Park and Garden Grove are Orange County** and appear on no page in this collection.
- **Northridge and Van Nuys are City of Los Angeles neighborhoods**, not separate cities.
- **`entries` is never empty**, and every `place_slug` must resolve — `Places.get_place_by_slug!/1` raises, aborting a non-transactional seed run partway.
- **A place added to a seed file must get an entry in the same file**, or it is orphaned: it exists and no guide links it. This is invisible to an HTTP check.
- **Place slugs carry a global unique index** across all 2,600+ committed places.
- **Guide slug follows the file**, never the destination string.
- **British English in the London file only**; American English everywhere else.
- **Deploy and push are outward-facing** — confirm with the user before either.
- **Work in the worktree** `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`; never `cd` to the repo root.
- **Never bare `git stash`** — the stash stack is shared with other sessions.

---

### Task 1: The gate, landing dark

**Files:**
- Create: `test/ethos/seeds/korean_bbq_seed_data_test.exs`
- Create: `priv/seed_data/korean_bbq/.gitkeep`
- Modify: `test/test_helper.exs` (the single `ExUnit.configure/1` call at the end)

**Interfaces:**
- Consumes: `Ethos.SeedDataHelpers.seed_files/1`, `Ethos.SeedDataHelpers.all_seed_files/0`, `Ethos.SeedDataHelpers.code_guides/0`, `Ethos.Places.Place.kinds/0`, `Ethos.Links.Link.kinds/0`, `Ethos.Guides.Guide.derive_destination_slug/1`.
- Produces: the `:pending_korean_bbq` tag, removed in two stages — Task 5 deletes the `@moduletag`, Task 8 deletes the `@tag` and the exclude entry.

The gate is written before the corpus it guards, as every predecessor was. Over a directory holding only `.gitkeep` the roster and non-vacuity assertions fail by construction, so it lands excluded rather than red — a gate failing for want of content is noise, not information.

- [ ] **Step 1: Create the empty seed directory**

```bash
mkdir -p priv/seed_data/korean_bbq && touch priv/seed_data/korean_bbq/.gitkeep
```

- [ ] **Step 2: Write the gate**

Create `test/ethos/seeds/korean_bbq_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.KoreanBbqSeedDataTest do
  @moduledoc """
  The gate every Korean BBQ research wave must pass.

  ## Five bans, not seven

  It inherits research method, editorial self-reference, superlative, proximity
  and photo policy from the London gate, each with the self-test proving it can
  fail and the specimen list proving it does not fire on prose that must
  publish. Two are deliberately DROPPED rather than inherited unexamined:

    * **Designation citation.** A restaurant has no NHLE number, and the rule
      would fire on the ordinary word "listed" in a sentence like "the menu
      lists eight cuts".
    * **The transit negative.** These are subject pages, not area pages. They
      carry no "Getting there" section for it to police.

  The superlative ban matters more here than in any previous corpus. Restaurant
  writing is made of rankings, and "the best Korean BBQ in Los Angeles" is
  exactly the sentence this corpus does not write. A price, a founding date, a
  count of grills and a published closing time are facts and all publish.

  ## The grill assertion is the collection

  `every place's prose names the grill` is the definition made mechanical. A
  place whose summary cannot say the meat is cooked at the table does not belong
  here, and this is what stops a later wave quietly re-admitting a tofu house
  because it is famous.
  """
  use Ethos.DataCase, async: false

  @moduletag :pending_korean_bbq

  alias Ethos.SeedDataHelpers

  @seed_dir Path.expand("../../../priv/seed_data/korean_bbq", __DIR__)

  @zones ~w(
    los-angeles manhattan queens brooklyn london chicago
    chicago-north-suburbs san-francisco south-bay puget-sound
  )

  @collection_slug "korean-bbq"

  # ------------------------------------------------------------------
  # The five inherited bans
  # ------------------------------------------------------------------

  @method_patterns [
    ~r/\bcould not be (?:reached|re-?read|certified|confirmed)\b/i,
    ~r/\b(?:did not|does not|failed to) (?:resolve|answer)\b/i,
    ~r/\bHTTP\s*\d{3}\b/i,
    ~r/\breturn(?:s|ed) (?:an?\s+)?(?:error|\d{3})\b/i,
    ~r/\b(?:during|for|in) (?:this |the )?research\b(?!\s+for\b)/i,
    ~r/\bthis research\b/i,
    ~r/\bre-?fetched on\b/i,
    ~r/\bfor this guide\b/i,
    ~r/\bis published here\b/i,
    ~r/\b(?:was|were) reached\b/i,
    ~r/\bdead (?:website|site)\b/i,
    ~r/\bno website\b/i
  ]

  @method_specimens [
    "No source states its opening hours, so none are given here.",
    "The restaurant's own menu names eight cuts of beef.",
    "It opened in 1996 and moved to West 32nd Street in 2004."
  ]

  @self_reference_patterns [
    ~r/\b(?:is|are|was|were)\s+(?:not\s+)?written\s+(?:here|there|on this page|as a place|in\b)/i,
    ~r/\bon this page\b/i,
    ~r/\bthis page (?:carries|holds|cannot|does not|gives|says|stops|publishes)\b/i,
    ~r/\bthis guide (?:carries|holds|writes|does not pretend|gives none|establishes)\b/i,
    ~r/\bthis collection (?:carries|holds|counts|excludes|does not)\b/i,
    ~r/\bbelongs? to \w+(?:'s)? (?:page|guide)\b/i,
    ~r/\b(?:is|are) (?:recorded|reported|gathered) here\b/i,
    ~r/\ba gap in this guide\b/i
  ]

  @self_reference_specimens [
    "No source states its opening hours, so none are given here.",
    "The grill is set into the table and the meat is cooked in front of you.",
    "Jongro stands at 22 West 32nd Street."
  ]

  @superlative_patterns [
    ~r/(?<![-\w])(?:only|first|oldest|largest|best|finest|greatest|most\s+\w+)\s+(?:\w+\s+){0,2}(?:in|of|on)\s+(?:the\s+)?(?:city|borough|neighborhood|neighbourhood|country|county|area|region|Los Angeles|Manhattan|Queens|Brooklyn|London|Chicago|San Francisco|Seattle)\b/i,
    ~r/\bone of the (?:most|best|finest|largest|oldest|greatest)\b/i,
    ~r/\b(?:the city's|LA's|London's|Chicago's|Manhattan's)\s+(?:only|oldest|largest|finest|greatest|best)\b/i,
    ~r/\bbest Korean\b/i,
    ~r/\bmust-(?:try|visit|eat)\b/i,
    ~r/\bworth the (?:trip|wait|queue|line)\b/i,
    ~r/\bhidden gem\b/i,
    ~r/\bmost (?:travellers|travelers|visitors|diners|people)\b/i,
    ~r/\bthe only (?:one|place|restaurant)\b/i
  ]

  # A date, a count, a price and a rank in an official series are facts. So is
  # a Michelin distinction, which is an award a body conferred on a date, not
  # the corpus ranking anything itself.
  @superlative_specimens [
    "It opened in 1996.",
    "Eleven of the fifteen are on West 32nd Street.",
    "Dinner service ends at 11pm.",
    "It holds one Michelin star, awarded in 2019."
  ]

  @proximity_patterns [
    ~r/\ba (?:short|ten-minute|five-minute|brief) walk\b/i,
    ~r/\bjust (?:around the corner|off|beyond)\b/i,
    ~r/\ba stone's throw\b/i,
    ~r/\bsteps (?:from|away)\b/i,
    ~r/\bnot far from\b/i,
    ~r/\bworth the walk\b/i,
    ~r/\bone street over\b/i
  ]

  # A named street, a block count a map confirms, and adjacency between
  # buildings that touch all publish.
  @proximity_specimens [
    "It stands on West 32nd Street between Fifth Avenue and Broadway.",
    "Mapo BBQ is one block from the Murray Hill LIRR station.",
    "The dining room is above the market on the same block."
  ]

  @photo_policy_patterns [
    ~r/\bfreedom of panorama\b/i,
    ~r/\bs\.?\s?62\b|\bsection 62\b/i,
    ~r/\bCDPA\b/,
    ~r/\bpermanently situated\b/i,
    ~r/\bgraphic work\b/i,
    ~r/\b17 USC\b/i
  ]

  @photo_policy_specimens [
    "The dining room has thirty tables, each with a gas grill set into it.",
    "The sign above the door is in Hangul and English."
  ]

  # ------------------------------------------------------------------
  # The grill assertion — the definition, made mechanical
  # ------------------------------------------------------------------

  @grill_evidence ~r/\b(?:grill(?:s|ed|ing)?|grille)\b/i

  @tabletop_evidence ~r/(?:set into the table|built into the table|in the table|at the table|tabletop|table-top|table grill|smokeless grill|charcoal grill|gas grill|grill at each table|grills? (?:are )?set into)/i

  # ------------------------------------------------------------------
  # Helpers
  # ------------------------------------------------------------------

  defp files, do: SeedDataHelpers.seed_files("korean_bbq")

  defp decoded_files do
    Enum.map(files(), fn path ->
      {Path.basename(path), path |> File.read!() |> Jason.decode!()}
    end)
  end

  defp prose(doc) do
    guide = doc["guide"] || %{}

    [
      guide["title"],
      guide["intro"],
      (guide["sections"] || []) |> Enum.flat_map(&[&1["heading"], &1["body"]]),
      (guide["faq"] || []) |> Enum.flat_map(&[&1["question"], &1["answer"]]),
      (doc["places"] || []) |> Enum.flat_map(&[&1["name"], &1["summary"], &1["history"]]),
      (doc["links"] || []) |> Enum.map(& &1["note"]),
      (doc["entries"] || []) |> Enum.flat_map(&[&1["name"], &1["note"]])
    ]
    |> List.flatten()
    |> Enum.filter(&is_binary/1)
  end

  defp hit?(patterns, text), do: Enum.any?(patterns, &Regex.match?(&1, text))

  # ------------------------------------------------------------------
  # Self-tests — these hold from the day this file lands
  # ------------------------------------------------------------------

  test "the research-method ban catches leaked provenance, and only there" do
    assert hit?(@method_patterns, "The restaurant's site returned a 403.")
    assert hit?(@method_patterns, "It has a dead website.")

    for s <- @method_specimens do
      refute hit?(@method_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the self-reference ban separates the page from the fact" do
    assert hit?(@self_reference_patterns, "This collection excludes tofu houses.")
    assert hit?(@self_reference_patterns, "This page carries no fried chicken.")

    for s <- @self_reference_specimens do
      refute hit?(@self_reference_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the superlative ban catches a ranking and spares an award" do
    assert hit?(@superlative_patterns, "The best Korean BBQ in Los Angeles.")
    assert hit?(@superlative_patterns, "It is one of the finest grills in the city.")
    assert hit?(@superlative_patterns, "A hidden gem.")

    for s <- @superlative_specimens do
      refute hit?(@superlative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the proximity ban separates wayfinding from a named location" do
    assert hit?(@proximity_patterns, "It is a short walk from the station.")

    for s <- @proximity_specimens do
      refute hit?(@proximity_patterns, s), "rejected a location that must publish: #{s}"
    end
  end

  test "the photo-policy ban keeps copyright reasoning off the page" do
    assert hit?(@photo_policy_patterns, "Section 62 does not reach a graphic work.")

    for s <- @photo_policy_specimens do
      refute hit?(@photo_policy_patterns, s), "rejected a description that must publish: #{s}"
    end
  end

  test "the grill evidence patterns recognise a tabletop grill and reject a kitchen one" do
    assert Regex.match?(@tabletop_evidence, "A gas grill is set into each table.")
    assert Regex.match?(@tabletop_evidence, "Charcoal grills at the table.")
    assert Regex.match?(@tabletop_evidence, "Every table has a smokeless grill.")

    refute Regex.match?(@tabletop_evidence, "The kitchen grills the short rib and brings it out.")
    refute Regex.match?(@tabletop_evidence, "A soondubu house with no grill.")
  end

  # ------------------------------------------------------------------
  # Corpus assertions
  # ------------------------------------------------------------------

  for {name, key, label} <- [
        {"narrates the research", :method, "research method"},
        {"adjudicates its own coverage", :self_reference, "editorial self-reference"},
        {"states a superlative", :superlative, "a ranking claim"},
        {"orients by impression", :proximity, "orientation no source states"},
        {"explains the photo policy", :photo_policy, "the corpus's own copyright reasoning"}
      ] do
    @key key
    @label label
    test "no committed korean bbq prose #{name}" do
      patterns =
        case @key do
          :method -> @method_patterns
          :self_reference -> @self_reference_patterns
          :superlative -> @superlative_patterns
          :proximity -> @proximity_patterns
          :photo_policy -> @photo_policy_patterns
        end

      offenders =
        for {file, doc} <- decoded_files(),
            text <- prose(doc),
            hit?(patterns, text),
            do: {file, String.slice(text, 0, 140)}

      assert offenders == [],
             "korean bbq prose carries #{@label}:\n" <>
               Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
    end
  end

  test "every place's prose names a grill at the table" do
    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          text = "#{place["summary"]} #{place["history"]}",
          not (Regex.match?(@grill_evidence, text) and Regex.match?(@tabletop_evidence, text)),
          do: {file, place["slug"]}

    assert offenders == [],
           "places whose prose does not establish a grill at the table. This collection " <>
             "promises tabletop Korean BBQ, and a place that cannot say the meat is cooked " <>
             "at the table does not belong in it:\n" <>
             Enum.map_join(offenders, "\n", fn {f, s} -> "  #{f}: #{s}" end)
  end

  test "every place is a restaurant, with a status the schema accepts" do
    valid = MapSet.new(Ethos.Places.Place.kinds())
    assert MapSet.member?(valid, "restaurant"), "the schema no longer has a restaurant kind"

    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          place["kind"] != "restaurant" or place["status"] not in ["open", "closed"],
          do: {file, place["slug"], place["kind"], place["status"]}

    assert offenders == [],
           "every place in this collection is a restaurant with status open or closed:\n" <>
             Enum.map_join(offenders, "\n", fn {f, s, k, st} ->
               "  #{f}: #{s} — kind #{inspect(k)}, status #{inspect(st)}"
             end)
  end

  test "every guide carries entries that resolve, and links that name a guide which exists" do
    entry_kinds = MapSet.new(~w(food tour walk sight stay tip))
    link_kinds = MapSet.new(Ethos.Links.Link.kinds())
    known = known_guide_slugs()

    offenders =
      for {file, doc} <- decoded_files() do
        entries = doc["entries"] || []
        own = MapSet.new(doc["places"] || [], & &1["slug"])

        bad_link =
          Enum.find(doc["links"] || [], fn l ->
            not MapSet.member?(link_kinds, l["kind"]) or
              (String.starts_with?(l["target"] || "", "guide:") and
                 not MapSet.member?(known, String.replace_prefix(l["target"], "guide:", "")))
          end)

        cond do
          entries == [] ->
            {file, "entries is empty — every place unreachable from the guide"}

          Enum.any?(entries, &(not MapSet.member?(entry_kinds, &1["kind"]))) ->
            {file, "an entry kind is not one of food/tour/walk/sight/stay/tip"}

          # A place this file OWNS must have an entry here, or it is orphaned.
          not MapSet.subset?(own, MapSet.new(entries, & &1["place_slug"])) ->
            {file, "a place this file owns has no entry, so no guide links it"}

          bad_link ->
            {file, "link #{inspect(bad_link["target"])} names no guide that exists, or a bad kind"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [], Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  defp known_guide_slugs do
    from_files =
      for path <- SeedDataHelpers.all_seed_files(),
          slug = path |> File.read!() |> Jason.decode!() |> get_in(["guide", "slug"]),
          is_binary(slug),
          do: slug

    from_code = for {guide, _owner} <- SeedDataHelpers.code_guides(), do: guide.slug

    MapSet.new(from_files ++ from_code)
  end

  test "a guide's shape matches its file, with two to four cluster sections" do
    # There is NO "Getting there" section, and that is deliberate. Every
    # previous gate required one because every previous guide was an area page
    # a reader travels to. These are subject pages; the clusters are what a
    # reader navigates by, and a page that lists forty restaurants in one
    # undifferentiated run has failed even if every fact is sourced.
    offenders =
      for {file, doc} <- decoded_files() do
        g = doc["guide"] || %{}
        words = g["intro"] |> to_string() |> String.split(~r/\s+/, trim: true) |> length()
        sections = length(g["sections"] || [])
        faq = length(g["faq"] || [])
        expected_slug = Path.rootname(file) <> "-korean-bbq-guide"

        cond do
          g["slug"] != expected_slug ->
            {file, "guide slug is #{inspect(g["slug"])}, want #{inspect(expected_slug)}"}

          String.length(g["title"] || "") > 120 ->
            {file, "title is #{String.length(g["title"])} characters, limit is 120"}

          words < 100 or words > 160 ->
            {file, "intro is #{words} words, want 100-160"}

          sections < 2 or sections > 4 ->
            {file, "has #{sections} sections, want 2-4 cluster sections"}

          faq < 4 or faq > 6 ->
            {file, "has #{faq} FAQ entries, want 4-6"}

          length(doc["links"] || []) < 2 ->
            {file, "has fewer than two links"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [], Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "no korean bbq destination derives a slug already used elsewhere" do
    ours =
      for {name, doc} <- decoded_files(),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(doc["guide"]["destination"]), name}

    others =
      for path <- SeedDataHelpers.all_seed_files(),
          not String.contains?(path, "/korean_bbq/"),
          doc = path |> File.read!() |> Jason.decode!(),
          dest = get_in(doc, ["guide", "destination"]),
          is_binary(dest),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(dest), Path.basename(path)}

    collisions = for {slug, name} <- ours, other = others[slug], do: {name, slug, other}

    assert collisions == [],
           "a korean bbq destination derives a slug another seed file already derives, which " <>
             "co-lists two places on one page: #{inspect(collisions)}"
  end

  test "the seed directory the gate reads is the one the corpus lives in" do
    assert File.dir?(@seed_dir), "priv/seed_data/korean_bbq does not exist"
  end

  # Delete this @tag when the last wave lands, and not before: until then the
  # corpus is a prefix of the ten and both assertions fail by construction.
  @tag :pending_korean_bbq
  test "all ten guides ship and the collection holds at least 100 restaurants" do
    shipped = files() |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()
    expected = MapSet.new(@zones)

    assert MapSet.equal?(shipped, expected),
           "corpus does not match the ten guides.\n" <>
             "  expected but not shipped: " <>
             inspect(expected |> MapSet.difference(shipped) |> Enum.sort()) <>
             "\n  shipped but not expected: " <>
             inspect(shipped |> MapSet.difference(expected) |> Enum.sort())

    # Counts every restaurant the collection PRESENTS, which is entries rather
    # than places: a restaurant whose place record lives in a neighborhood file
    # still counts, and that is most of Manhattan, London and San Francisco.
    total =
      decoded_files()
      |> Enum.flat_map(fn {_f, doc} -> doc["entries"] || [] end)
      |> Enum.map(& &1["place_slug"])
      |> Enum.uniq()
      |> length()

    assert total >= 100,
           "the collection presents #{total} restaurants and promises at least 100. " <>
             "DO NOT loosen the grill definition to close this gap — extend to Atlanta " <>
             "(Duluth/Gwinnett) and northern Virginia (Annandale), or lower the promise."
  end

  test "the collection exists, is published, and holds every korean bbq guide" do
    collection = Ethos.Collections.get_published_by_slug(@collection_slug)

    assert collection, "no published collection at /c/#{@collection_slug}"

    item_slugs = MapSet.new(collection.items, & &1.guide.slug)
    want = MapSet.new(@zones, &(&1 <> "-korean-bbq-guide"))

    assert MapSet.subset?(want, item_slugs),
           "the collection is missing: " <>
             inspect(want |> MapSet.difference(item_slugs) |> Enum.sort())
  end
end
```

- [ ] **Step 3: Add the exclusion tag**

In `test/test_helper.exs`, edit the single `ExUnit.configure/1` call **in place** — never add a second call, which replaces the list rather than appending and would silently re-enable other gates:

```elixir
ExUnit.configure(exclude: [:pending_wave, :pending_bronx, :pending_korean_bbq])
```

Add above it:

```
# Ethos.Seeds.KoreanBbqSeedDataTest is the gate every Korean BBQ wave must
# pass, written before the corpus it guards. Over a priv/seed_data/korean_bbq/
# holding only .gitkeep, the ten-guide and 100-restaurant assertions fail by
# construction.
#
# Removed in two stages, both inside the Korean BBQ plan:
#
#   * Task 5, which lands the first guides, deletes the `@moduletag`.
#   * Task 8, which lands the collection and the tenth guide, deletes the
#     `@tag` and this entry.
#
#     mix test --include pending_korean_bbq
```

- [ ] **Step 4: Run the gate with the tag included, and confirm it fails only by construction**

Run: `mix test test/ethos/seeds/korean_bbq_seed_data_test.exs --include pending_korean_bbq`

Expected: the six self-tests PASS. Exactly two tests fail — "all ten guides ship and the collection holds at least 100 restaurants" (no files) and "the collection exists, is published, and holds every korean bbq guide" (no collection). Any other failure is a defect in the gate, not in the corpus; fix it now.

- [ ] **Step 5: Run the full suite and confirm it is green**

Run: `mix test`
Expected: 0 failures. The new module is excluded.

- [ ] **Step 6: Commit**

```bash
git add test/ethos/seeds/korean_bbq_seed_data_test.exs test/test_helper.exs priv/seed_data/korean_bbq/.gitkeep
git commit -m "test: land the Korean BBQ gate before the corpus it guards"
```

---

### Task 2: The seeder and its release test

**Files:**
- Modify: `lib/ethos/release.ex` (add `seed_korean_bbq/1` after `seed_london/1`)
- Modify: `test/ethos/release_test.exs` (add a test after the `seed_london/1` test)

**Interfaces:**
- Consumes: the private `seed_directory/2` already in `lib/ethos/release.ex`.
- Produces: `Ethos.Release.seed_korean_bbq/1`, called by Task 9's production seed.

- [ ] **Step 1: Write the failing release test**

Add to `test/ethos/release_test.exs`, after the `seed_london/1` test:

```elixir
  # Korean BBQ ships before its research does, so `expected` is 0 for now and
  # the publishes-what-was-committed half is vacuous. The directory-literal
  # half is fully load-bearing at zero files, because seed_directory/2 prints
  # its report whether or not it matched anything: a seeder pointed at
  # priv/seed_data/korean_bbqs would seed nothing, raise nothing, and report
  # success, and the corpus gate cannot catch that because the gate reads the
  # directory rather than the seeder.
  test "seed_korean_bbq/1 names its seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("korean_bbq"))

    kbbq = fn ->
      Ethos.Guides.list_published_guides()
      |> Enum.count(&String.ends_with?(&1.slug, "-korean-bbq-guide"))
    end

    before = kbbq.()

    output = capture_io(fn -> Ethos.Release.seed_korean_bbq(user.email) end)

    # Parsed back OUT of the report and compared for equality, not containment —
    # "Seeded 0 files from priv/seed_data/korean_bbqs\n" CONTAINS the right
    # path, so every prefix-extension typo survives `=~`.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_korean_bbq/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "korean_bbq",
           "seed_korean_bbq/1 seeds priv/seed_data/#{dir} — a directory literal that " <>
             "matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_korean_bbq/1 names priv/seed_data/#{dir}, which does not exist"

    after_first = kbbq.()
    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_korean_bbq(user.email) end)
    assert kbbq.() == after_first, "seed_korean_bbq/1 is not idempotent"
  end
```

- [ ] **Step 2: Run it and watch it fail**

Run: `mix test test/ethos/release_test.exs`
Expected: FAIL with `function Ethos.Release.seed_korean_bbq/1 is undefined`. ExUnit has no
name filter — to run this one test alone, use its line number: `mix test
test/ethos/release_test.exs:NNN`.

- [ ] **Step 3: Add the seeder**

In `lib/ethos/release.ex`, immediately after `seed_london/1`:

```elixir
  @doc """
  Seeds the Korean BBQ collection's guides under `priv/seed_data/korean_bbq/`.

  MUST RUN AFTER every destination whose neighborhood files own places these
  guides reach by entry — Manhattan, Queens, Brooklyn, San Francisco and
  London. `GuideRunner.replace_entries!/2` resolves each entry through
  `Places.get_place_by_slug!/1`, which raises rather than skipping, and seeding
  is not transactional, so a missing place aborts the run partway and leaves
  earlier guides published.

  That ordering is not enforceable from here — these files reference places in
  five other directories, and calling all five would re-seed a thousand guides
  on every run. It is stated instead, and the release test that follows the
  corpus asserts the entries resolve.
  """
  def seed_korean_bbq(email), do: seed_directory("korean_bbq", email)
```

- [ ] **Step 4: Run the test again**

Run: `mix test test/ethos/release_test.exs`
Expected: PASS.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: 0 failures.

- [ ] **Step 6: Commit**

```bash
git add lib/ethos/release.ex test/ethos/release_test.exs
git commit -m "feat: add the Korean BBQ seeder and its release test"
```

---

### Task 3: Verification wave — resolve all 114 uncertain candidates

**Files:**
- Create: `.superpowers/kbbq-verified/{city}.json` (10 files; `.superpowers/` is git-ignored)

**Interfaces:**
- Consumes: `.superpowers/kbbq-scoping/{city}.json` from the scoping wave.
- Produces: verified dossiers keyed by the ten guide slugs in Task 1's `@zones`, each with a `qualifying` array whose objects carry `name`, `municipality`, `neighborhood`, `address`, `grill_evidence`, `source_url`, `hours`, `status`.

This is the wave that turns 91 into 100+. It is research, not code: no test, and the deliverable is data under `.superpowers/`.

- [ ] **Step 1: Write the verification workflow**

Create a workflow script with one agent per city. Each agent gets:

- Its scoping file at `.superpowers/kbbq-scoping/{city}.json`.
- **The definition verbatim** from the Global Constraints above.
- The instruction to **refute, not confirm**: the job is to prove a restaurant does *not* have a tabletop grill. Evidence that qualifies: the restaurant's own menu or site describing tabletop grilling, photographs showing grills set into tables, or press describing the grill. Evidence that does not: being categorised "Korean" or "barbecue" by an aggregator.
- The instruction to **check the restaurant is still open** — Palmi, Trove, Girin, Kang Nam and Gogi are all confirmed closed, and a closed restaurant does not count.
- The geography ruling for its city, copied verbatim from the spec.
- The instruction to record `municipality` as the **physical** city, never the postal one.

The ten cities map to guides as follows, and an agent whose restaurants split across two guides must assign each one:

| Scoping file | Guide(s) it feeds |
|---|---|
| `los-angeles` | `los-angeles` only; LA County and Orange County cities are dropped |
| `manhattan` | `manhattan` |
| `queens` | `queens` |
| `brooklyn` | `brooklyn` |
| `london` | `london` |
| `chicago` | `chicago` (city) and `chicago-north-suburbs` (Niles, Morton Grove, Glenview, Northbrook) |
| `san-francisco` | `san-francisco` (city) and `south-bay` (Santa Clara, Sunnyvale, Fremont) |
| `seattle` | `puget-sound` (all of it — Seattle, Federal Way, Lynnwood, Edmonds, Lakewood, Shoreline) |

- [ ] **Step 2: Run the workflow and record the real count**

Run the workflow. When it completes, count what verified:

```bash
python3 -c "
import json, glob
tot = 0
for f in sorted(glob.glob('.superpowers/kbbq-verified/*.json')):
    d = json.load(open(f)); n = len(d.get('qualifying', []))
    tot += n
    print('%-24s %d' % (d.get('guide', f), n))
print('TOTAL', tot)
"
```

- [ ] **Step 3: Gate on the total, and STOP if it is under 100**

If the total is 100 or more, continue to Task 4.

If it is under 100, **stop and report the number to the user**. Do not loosen the definition, and do not proceed to authoring. The user's options, which are theirs to choose:
1. Extend to Atlanta (Duluth/Gwinnett) and northern Virginia (Annandale), the next largest Korean-American centres — each needs its own guide and destination.
2. Lower the promise below 100 and amend the spec's assertion.

- [ ] **Step 4: No commit**

`.superpowers/` is git-ignored. Nothing to commit; the dossiers are wave tooling, as Rome's, San Francisco's and London's were.

---

### Task 4: Arbitration — one arbitrator, before any prose

**Files:**
- Create: `.superpowers/kbbq-arbitration.md` (git-ignored)

**Interfaces:**
- Consumes: the ten `.superpowers/kbbq-verified/{city}.json` dossiers.
- Produces: rulings the Task 5 and Task 6 authors are bound by — final municipality assignment, the slug map, the neighborhood-file assignment, and the link graph.

**ONE arbitrator, not several.** Rome ran three blind arbitrators on one wave and it cost a real collision, because each could see only its own share. London ran one per wave and it overturned the roster on the Tower of London and caught forty invalid place kinds.

- [ ] **Step 1: Dispatch a single arbitrator**

It reads all ten dossiers, every file under `priv/seed_data/`, and the spec. It resolves and writes to `.superpowers/kbbq-arbitration.md`:

1. **Place slugs.** Every proposed slug checked against every slug in `priv/seed_data/` — 2,600+ places, global unique index. A collision aborts the seed run partway. Chain branches need distinguishing suffixes: KPOT has two Brooklyn locations, Nubiani two in Manhattan, Hanoo Kalbi two in LA.
2. **Neighborhood-file assignment.** For each restaurant, which file owns its place record. A neighborhood guide must **exist** for it to own one — verify by listing the directory, never by assuming. Known gaps the dossiers will hit: Queens has no Murray Hill, Auburndale or Little Neck guide, and San Francisco has no Central or Outer Richmond guide. Those places are owned by the Korean BBQ file.
3. **New Wonjo is already a place** in `manhattan/koreatown.json`. It must **not** be created again; the Manhattan Korean BBQ guide reaches it by entry. Cho Dang Gol, HanGawi and Osamil are in the corpus and do **not** qualify — they are not to be added to this collection.
4. **Municipality assignment**, against the spec's geography rulings. Northridge and Van Nuys are City of LA. Torrance, Cerritos, Alhambra, Glendale, West Covina, Temple City and Arcadia are separate cities. Rowland Heights is unincorporated. Buena Park and Garden Grove are Orange County and are dropped.
5. **The link graph.** Two to four targets per guide, drawn only from guides that exist — the nine sibling Korean BBQ guides and the neighborhood guides whose places these pages reach. Full `{slug}-korean-bbq-guide` or `{slug}-{city}-guide` form.
6. **Section clusters per guide**, 2 to 4, since the gate requires them and the dossiers hold the geography that decides them.

- [ ] **Step 2: Read the rulings and confirm the slug map is complete**

Every restaurant in every dossier must appear in the slug map with an owner file. Any restaurant the arbitrator left unassigned is a gap that will surface as a seed-time abort.

- [ ] **Step 3: No commit** — `.superpowers/` is git-ignored.

---

### Task 5: Author the five guides that own all their places

**Files:**
- Create: `priv/seed_data/korean_bbq/los-angeles.json`
- Create: `priv/seed_data/korean_bbq/chicago.json`
- Create: `priv/seed_data/korean_bbq/chicago-north-suburbs.json`
- Create: `priv/seed_data/korean_bbq/south-bay.json`
- Create: `priv/seed_data/korean_bbq/puget-sound.json`
- Modify: `test/ethos/seeds/korean_bbq_seed_data_test.exs` (delete the `@moduletag`)

**Interfaces:**
- Consumes: `.superpowers/kbbq-verified/{city}.json`, `.superpowers/kbbq-arbitration.md`.
- Produces: five seed files. Their guide slugs — `los-angeles-korean-bbq-guide` and so on — become legal link targets for Task 6.

These five have **no neighborhood corpus**, so each file owns every place it presents and touches no other file. They go first for exactly that reason: the risky half is Task 6.

The state and county for each, which the gate does not check but routing depends on:

| File | `state` | `county` | `destination` |
|---|---|---|---|
| `los-angeles` | `California` | `Los Angeles` | `Los Angeles, California` |
| `chicago` | `Illinois` | `Cook County` | `Chicago, Illinois` |
| `chicago-north-suburbs` | `Illinois` | `Cook County` | `Chicago North Suburbs, Illinois` |
| `south-bay` | `California` | `Santa Clara` | `South Bay, California` |
| `puget-sound` | `Washington` | `Puget Sound` | `Puget Sound, Washington` |

- [ ] **Step 1: Author the five files in parallel**

Each author gets its dossier, the arbitration rulings, the five prose bans, the guide shape from the spec, and `priv/seed_data/london/southwark.json` as a shape reference. Every place: `kind: "restaurant"`, `status` `"open"` or `"closed"`, `town` the physical municipality, `photos: []`, and a summary that **names the grill at the table** — the gate asserts it.

- [ ] **Step 2: Scan each file**

Run: `python3 .superpowers/london_scan.py priv/seed_data/korean_bbq/*.json`

That script checks JSON shape and the shared prose bans. It does **not** know this collection's rules — no "Getting there" is required here and its designation rule does not apply — so treat its section-count and Getting-there findings as noise and fix only the prose-ban and shape findings. The gate in Step 3 is the oracle.

- [ ] **Step 3: Delete the moduletag and run the gate**

In `test/ethos/seeds/korean_bbq_seed_data_test.exs`, replace:

```elixir
  @moduletag :pending_korean_bbq
```

with:

```elixir
  # @moduletag :pending_korean_bbq removed by the wave that landed the first
  # five guides. Everything now runs except the ten-guide and 100-restaurant
  # assertion, which keeps its own `@tag` until the corpus is complete.
```

Run: `mix test test/ethos/seeds/korean_bbq_seed_data_test.exs`
Expected: PASS except the one tagged test, which stays excluded. Fix every finding; do not delete an assertion to pass it.

- [ ] **Step 4: Run the full suite**

Run: `mix test`
Expected: 0 failures. The release test from Task 2 now seeds five real files.

- [ ] **Step 5: Commit**

```bash
git add priv/seed_data/korean_bbq/ test/ethos/seeds/korean_bbq_seed_data_test.exs
git commit -m "feat: Korean BBQ guides for LA, Chicago, the north suburbs, the South Bay and Puget Sound"
```

---

### Task 6: Author the five guides that patch live neighborhood files

**Files:**
- Create: `priv/seed_data/korean_bbq/manhattan.json`
- Create: `priv/seed_data/korean_bbq/queens.json`
- Create: `priv/seed_data/korean_bbq/brooklyn.json`
- Create: `priv/seed_data/korean_bbq/san-francisco.json`
- Create: `priv/seed_data/korean_bbq/london.json`
- Modify: neighborhood files named by the Task 4 arbitration, under `priv/seed_data/manhattan/`, `priv/seed_data/queens/`, `priv/seed_data/brooklyn/`, `priv/seed_data/san_francisco/`, `priv/seed_data/london/`

**Interfaces:**
- Consumes: the arbitration's neighborhood-file assignment and slug map; the five guide slugs from Task 5 as legal link targets.
- Produces: the five remaining seed files, completing the ten.

**This task edits files that are live in production.** Five corpora, and two of them — San Francisco and London — are behind gates that will re-run over every edit. It is separated from Task 5 for that reason and gets its own review.

The state and county:

| File | `state` | `county` | `destination` |
|---|---|---|---|
| `manhattan` | `New York` | `Manhattan` | `Manhattan Korean BBQ, New York` |
| `queens` | `New York` | `Queens` | `Queens Korean BBQ, New York` |
| `brooklyn` | `New York` | `Brooklyn` | `Brooklyn Korean BBQ, New York` |
| `san-francisco` | `California` | `San Francisco` | `San Francisco Korean BBQ, California` |
| `london` | `England` | `London` | `London Korean BBQ, England` |

The destination strings carry "Korean BBQ" because `derive_destination_slug/1` truncates at the first comma: a plain `Manhattan, New York` derives `manhattan`, which 38 committed Manhattan guides already derive, and the gate's collision assertion would reject it.

- [ ] **Step 1: Patch the neighborhood files**

For each restaurant the arbitration assigned to a neighborhood file, add **both** a place and an entry to that file. A place without an entry is orphaned — it exists and no guide links it, which is invisible to an HTTP check and is what happened to 450 Rome places in production.

The place goes in the file's `places` array with `kind: "restaurant"`, the entry in its `entries` array with `kind: "food"` and a `place_slug` matching. British English in the London files only.

- [ ] **Step 2: Author the five Korean BBQ files**

Each carries an entry for every restaurant it presents, including those whose place records the neighborhood files now own. Its own `places` array holds only the restaurants no neighborhood guide could take — Queens' Murray Hill, Auburndale and Little Neck restaurants, and San Francisco's Central and Outer Richmond ones.

- [ ] **Step 3: Run the gates that guard the files you edited**

Run: `mix test test/ethos/seeds/san_francisco_seed_data_test.exs test/ethos/seeds/london_seed_data_test.exs test/ethos/seeds/korean_bbq_seed_data_test.exs`

Expected: PASS. The San Francisco and London gates re-run over every neighborhood file this task touched. Their prose bans are stricter than this collection's in places — London's designation rule fires on "listed", and both require a "Getting there" section that the files already have. Fix findings in the neighborhood files rather than weakening either gate.

- [ ] **Step 4: Run the full suite**

Run: `mix test`
Expected: 0 failures.

Two known ways this fails, and the fix for each:
- **`EthosWeb.StructuredDataTest` "the emitted split matches the corpus"** will fail with a new total, because the neighborhood files gained addressed places. Re-measure and update the recorded numbers with every digit accounted for; never adjust a number to make a test pass without explaining the delta.
- **`Ethos.Places.AddressTest`** may fail if a new address form appears — Korean restaurant addresses in Los Angeles and Chicago are plain American and should parse unchanged, but a suite-style address (`3465 W 6th St #20`) is worth checking.

- [ ] **Step 5: Commit**

```bash
git add priv/seed_data/
git commit -m "feat: Korean BBQ guides for Manhattan, Queens, Brooklyn, San Francisco and London"
```

---

### Task 7: The destination records

**Files:**
- Create: `priv/seed_data/destinations/washington.json`
- Create: `priv/seed_data/destinations/illinois.json`
- Create: `priv/seed_data/destinations/california.json`

**Interfaces:**
- Consumes: nothing from earlier tasks.
- Produces: destination hub pages at `/destinations/washington`, `/destinations/illinois`, `/destinations/california`.

Destination records add an intro and photos to a hub page. They are optional — San Francisco and London both shipped without one — but the user asked for the new cities to be created properly, and California has never had one despite carrying 23 San Francisco guides and now the LA and South Bay guides too.

- [ ] **Step 1: Write the three records**

Each follows `priv/seed_data/destinations/new-york-brooklyn.json` exactly: `path`, `name`, `intro`, `photos`. The `path` is the state slug: `washington`, `illinois`, `california`. Ship `"photos": []` — Task 8 fills them.

The intro is prose about the state as a destination, subject to the same five prose bans. It is not about Korean BBQ.

- [ ] **Step 2: Verify they load**

Run: `mix test test/ethos/seeds/destination_seed_data_test.exs`
Expected: PASS.

- [ ] **Step 3: Run the full suite**

Run: `mix test`
Expected: 0 failures.

- [ ] **Step 4: Commit**

```bash
git add priv/seed_data/destinations/
git commit -m "feat: destination records for California, Illinois and Washington"
```

---

### Task 8: The collection

**Files:**
- Create: `lib/ethos/seeds/korean_bbq_collection.ex`
- Modify: `lib/ethos/release.ex` (the `collections` list inside `seed_collections/0`)
- Modify: `test/ethos/seeds/korean_bbq_seed_data_test.exs` (delete the last `@tag`)
- Modify: `test/test_helper.exs` (delete the `:pending_korean_bbq` entry)

**Interfaces:**
- Consumes: the ten guide slugs from Tasks 5 and 6.
- Produces: `Ethos.Seeds.KoreanBbqCollection.upsert!/0`, called by `Ethos.Release.seed_collections/0`.

- [ ] **Step 1: Write the collection seed**

Create `lib/ethos/seeds/korean_bbq_collection.ex`:

```elixir
defmodule Ethos.Seeds.KoreanBbqCollection do
  @moduledoc """
  Seeds the Korean BBQ collection. Idempotent by slug.

  Ten guides, and the reason there are ten rather than eight is geography the
  scoping wave measured rather than assumed. Seattle has four tabletop grills
  inside its city limits and the region's Korean BBQ is four suburban corridors
  up to forty miles out, so the page is Puget Sound. Chicago's Koreatown on
  Lawrence Avenue fell from 158 Korean businesses to 50 between 1997 and 2017
  and the surviving density is suburban Niles and Glenview, which are separate
  municipalities and get their own page. San Francisco proper holds nine and the
  Bay Area's mass is Santa Clara, so the South Bay gets its own.

  `Collections.upsert_collection!/1` raises on an item whose guide slug has no
  row yet, so this must run after `seed_korean_bbq/1` — which is why
  `seed_collections/0` runs last in the release sequence.
  """

  alias Ethos.Collections

  def upsert! do
    Collections.upsert_collection!(%{
      slug: "korean-bbq",
      title: "Korean BBQ",
      published: true,
      intro: """
      Korean barbecue means one thing here: a grill set into the table, and meat
      you cook in front of you. Not a tofu house, not fried chicken, not a
      kitchen that grills the short rib and carries it out. That line decides
      every restaurant in this collection, and it is why some famous names are
      missing from it.

      Ten guides, drawn where the grills actually are rather than where the city
      limits fall. Los Angeles is Koreatown and needs no apology. Manhattan is
      five blocks of West 32nd Street. Queens is a five-mile belt along Northern
      Boulevard. Seattle turned out to be Puget Sound, Chicago turned out to be
      two pages, and San Francisco turned out to be smaller than its reputation.
      """,
      items: [
        %{
          guide_slug: "los-angeles-korean-bbq-guide",
          blurb:
            "Koreatown, inside the City of Los Angeles: the densest concentration of tabletop grills in the country, most of them walkable from one another."
        },
        %{
          guide_slug: "manhattan-korean-bbq-guide",
          blurb:
            "West 32nd Street between Fifth and Broadway, where eleven of the borough's grills sit on one block, plus the three that don't."
        },
        %{
          guide_slug: "queens-korean-bbq-guide",
          blurb:
            "The Kimchi Belt: five miles east from Flushing along Northern Boulevard through Murray Hill, Auburndale, Bayside and Little Neck."
        },
        %{
          guide_slug: "brooklyn-korean-bbq-guide",
          blurb:
            "A complete borough census rather than a best-of — every tabletop grill in Brooklyn, in four of its sixty-nine neighborhoods."
        },
        %{
          guide_slug: "london-korean-bbq-guide",
          blurb:
            "Grills across nine boroughs, from Westminster and Camden out to Lewisham, Greenwich, Newham and Merton."
        },
        %{
          guide_slug: "chicago-korean-bbq-guide",
          blurb:
            "Inside the city limits, scattered rather than clustered: Chinatown, Wicker Park, the West Loop, Streeterville, and three on the north side."
        },
        %{
          guide_slug: "chicago-north-suburbs-korean-bbq-guide",
          blurb:
            "Niles, Morton Grove, Glenview and Northbrook, where Chicago's Korean barbecue actually concentrated after Lawrence Avenue thinned out."
        },
        %{
          guide_slug: "san-francisco-korean-bbq-guide",
          blurb:
            "Three clusters that share no walking radius: the Richmond's Geary corridor, Inner Sunset's 9th Avenue, and Japantown's Post Street."
        },
        %{
          guide_slug: "south-bay-korean-bbq-guide",
          blurb:
            "Santa Clara, Sunnyvale and Fremont — where the Bay Area's tabletop grilling actually is, an hour south of San Francisco."
        },
        %{
          guide_slug: "puget-sound-korean-bbq-guide",
          blurb:
            "Four suburban corridors: Pacific Highway S in Federal Way, Highway 99 in Lynnwood, S Tacoma Way in Lakewood, and Aurora Ave N in Shoreline."
        }
      ]
    })
  end
end
```

- [ ] **Step 2: Register it in the release**

In `lib/ethos/release.ex`, in `seed_collections/0`, add to the `collections` list:

```elixir
    collections = [
      Ethos.Seeds.BurysCollection,
      Ethos.Seeds.AntiqueTrailCollection,
      Ethos.Seeds.MlbBallparksCollection,
      Ethos.Seeds.KoreanBbqCollection
    ]
```

- [ ] **Step 3: Delete the last tag**

In `test/ethos/seeds/korean_bbq_seed_data_test.exs`, replace:

```elixir
  @tag :pending_korean_bbq
  test "all ten guides ship and the collection holds at least 100 restaurants" do
```

with:

```elixir
  # @tag :pending_korean_bbq removed by the wave that completed the ten. This
  # assertion now runs, and from here it is what stops a guide being deleted or
  # the collection quietly falling below its promise.
  test "all ten guides ship and the collection holds at least 100 restaurants" do
```

In `test/test_helper.exs`, edit the `ExUnit.configure/1` call **in place** back to:

```elixir
ExUnit.configure(exclude: [:pending_wave, :pending_bronx])
```

- [ ] **Step 4: Run the gate in full**

Run: `mix test test/ethos/seeds/korean_bbq_seed_data_test.exs`

Expected: PASS, including the ten-guide and 100-restaurant assertion and the collection assertion.

If the 100 assertion fails, the corpus is genuinely short. **Do not loosen the grill definition.** Report the number to the user and take Task 3 Step 3's options.

The collection assertion needs the collection seeded into the test database. `Ethos.DataCase` runs in a sandbox, so add a `setup` block to that one test calling `Ethos.Seeds.KoreanBbqCollection.upsert!()` after seeding the guides it names — or, if the test suite already seeds collections globally, confirm which and rely on it rather than double-seeding.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: 0 failures, and `:pending_korean_bbq` no longer appears in the excluded list.

- [ ] **Step 6: Commit**

```bash
git add lib/ethos/seeds/korean_bbq_collection.ex lib/ethos/release.ex test/
git commit -m "feat: the Korean BBQ collection, and the corpus completes at ten guides"
```

---

### Task 9: Photos

**Files:**
- Create: `lib/mix/tasks/ethos.optimize_korean_bbq_photos.ex`
- Create: `priv/seed_data/korean_bbq_photo_manifest.json`
- Create: `.superpowers/verify_kbbq_photos.py` (git-ignored)
- Modify: the ten files in `priv/seed_data/korean_bbq/` (each gains one guide photo)
- Create: `priv/photos/{country}/korean-bbq/{zone}/{label}.jpg` and `_thumb.jpg`

**Interfaces:**
- Consumes: `Ethos.PhotoOptimizer.optimize/3`, `Ethos.PhotoManifest.verify!/3`.
- Produces: one photo per guide.

**A restaurant interior is a very different photo problem from a building**, and this is the task's real content. The UK's s.62 exempts photographing buildings from a public place; it says nothing useful about a restaurant's dining room, and the US has no equivalent at all. So the rule here is licence-first and subject-simple: the photograph must be on Wikimedia Commons under one of the eight allowed licences, and its subject must be a **storefront, exterior or streetscape** rather than an interior, a dish, or a person. Exteriors are what Commons actually holds for restaurants, and they carry none of the interior's model-release and trade-dress questions.

Where no Commons photograph of a restaurant exists — which will be common — use a **streetscape of the block**: West 32nd Street, Northern Boulevard in Murray Hill, Pacific Highway S. That is a truthful photograph of where the guide sends a reader.

- [ ] **Step 1: Write the optimizer task**

Create `lib/mix/tasks/ethos.optimize_korean_bbq_photos.ex`, modelled exactly on `lib/mix/tasks/ethos.optimize_london_photos.ex`, with:
- `@manifest_path "priv/seed_data/korean_bbq_photo_manifest.json"`
- source images under `images/korean_bbq/`
- the `optimize_src/1` path match accepting `["", "photos", country, "korean-bbq", zone, file]`, since these guides span three countries
- an `@excluded_subjects` list refusing labels containing `interior`, `dining-room`, `menu`, `dish`, `banchan`, `portrait` and `mural`, with the reason that the collection publishes exteriors and streetscapes only

- [ ] **Step 2: Source the photos**

Run a workflow with one agent per guide. Each: reads its committed seed file, picks a subject the guide covers, finds a Commons file whose subject is a **storefront, exterior or streetscape**, reads the licence off the **file page**, downloads via `Special:FilePath` to `images/korean_bbq/{label}.jpg`, checks `file` reports a JPEG rather than an HTML error page, computes `shasum -a 256`, and writes a fragment to `.superpowers/kbbq-photo-fragments/{zone}.json`.

Licence must be exactly one of: `CC0`, `CC BY 2.0`, `CC BY 3.0`, `CC BY 4.0`, `CC BY-SA 2.0`, `CC BY-SA 3.0`, `CC BY-SA 4.0`, `Public domain`. Pick a different file rather than rounding a licence — a false licence claim is worse than no photograph.

- [ ] **Step 3: Verify the fragments against the bytes on disk**

Write `.superpowers/verify_kbbq_photos.py` modelled on `.superpowers/verify_london_photos.py`: recompute each sha256 and compare it to the recorded one, run `file` to confirm a real image, enforce a size floor, reconstruct `src` and `thumb` from zone and label, check the licence against the eight, check the URL is a Commons file page, and reject duplicate labels or duplicate image hashes.

Run it. An agent's report that it downloaded a JPEG is not evidence that it did, and a recorded hash that does not match its bytes publishes a photograph crediting the wrong author.

Expected: `all 10 fragments verified against the files on disk`.

- [ ] **Step 4: Merge serially and optimize**

Merge the fragments into the manifest and the ten seed files with a single process — thirty-three parallel writers on one manifest is how a merge silently loses entries, which is why the fragment pattern exists. Then:

Run: `mix ethos.optimize_korean_bbq_photos`
Expected: `optimized 10 photos from 10 seed files`.

- [ ] **Step 5: Run the full suite**

Run: `mix test`
Expected: 0 failures.

- [ ] **Step 6: Commit**

```bash
git add lib/mix/tasks/ethos.optimize_korean_bbq_photos.ex priv/seed_data/ priv/photos/
git commit -m "feat: one photograph for each of the ten Korean BBQ guides"
```

---

### Task 10: Deploy and verify live

**Files:** none created or modified.

**Interfaces:**
- Consumes: everything above.

**Push and deploy are outward-facing. Ask the user before either**, and do not treat approval of this plan as approval to deploy.

- [ ] **Step 1: Confirm the suite is green**

Run: `mix test`
Expected: 0 failures.

- [ ] **Step 2: Ask the user to approve push and deploy**

Report the final restaurant count, the ten guides, and what will change in production. Wait for an explicit yes.

- [ ] **Step 3: Push**

```bash
git push origin HEAD:main
```

- [ ] **Step 4: Deploy**

```bash
fly deploy --now
```

- [ ] **Step 5: Seed, in this order**

`fly ssh console` strips quotes, so use `~s[...]` sigils. The Korean BBQ guides reach places in five other directories, and `Places.get_place_by_slug!/1` raises on a miss, so the neighborhood files must be re-seeded **first** — Task 6 added places to them:

```bash
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_manhattan(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_queens(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_brooklyn(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_san_francisco(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_london(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_korean_bbq(~s[cryptcom@gmail.com])"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_destinations()"
fly ssh console -C "/app/bin/ethos eval Ethos.Release.seed_collections()"
```

- [ ] **Step 6: Verify live, in Python rather than through the shell**

rtk garbles piped shell output, so `curl | grep` counts are not evidence. Write a Python script using `urllib` that, for each of the ten guides, asserts HTTP 200, counts distinct `/p/` links, and asserts at least four. Then assert `/c/korean-bbq` returns 200 and links all ten guides, and fetch one place page to confirm the place records published.

The `/p/` count is the assertion that matters. A guide with an empty `entries` array returns 200 and renders perfectly while orphaning every place it owns — which is invisible to a status check and is what happened to 450 Rome places.

---

## Self-Review

**Spec coverage.** Every spec section maps to a task: the collection constraint and ten guides → Tasks 5, 6, 8; the definition → the Global Constraints and Task 1's grill assertion; yield and the 114 uncertain → Task 3; place ownership split → Tasks 5 and 6; the six geography rulings → Task 4's arbitration and Tasks 5–6's authoring; guide shape → Task 1's shape assertion and Tasks 5–6; the gate's five bans and three specific assertions → Task 1; waves → Tasks 3–9; testing → each task's test steps and Task 10's live verification; out-of-scope items appear in no task.

**Placeholder scan.** No TBD, TODO, "similar to Task N", or "add error handling". Every code step carries real code. Task 3 and Task 4 are research tasks whose deliverable is data rather than code, and both state exactly what the data must contain and where it goes.

**Type consistency.** Guide slugs are `{zone}-korean-bbq-guide` in Task 1's shape assertion, Task 2's release test, Task 8's collection module and Task 10's verification. The ten zone slugs in Task 1's `@zones` match the file names in Tasks 5 and 6 and the `guide_slug` values in Task 8. `Ethos.Release.seed_korean_bbq/1` is defined in Task 2 and called in Task 10. `Ethos.Seeds.KoreanBbqCollection.upsert!/0` is defined in Task 8 and registered in the same task.

**One gap found and fixed inline:** Task 8's collection assertion needs the collection present in the test database, which `Ethos.DataCase`'s sandbox does not provide by default. Step 4 now says so and names both resolutions rather than leaving the implementer to discover it at runtime.
