# Steakhouses Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** A steakhouse guide for every city that can sustain one, built to the `korean_bbq` shape — one guide per metro, the rooms as places inside it, one flat collection.

**Architecture:** A new JSON corpus at `priv/seed_data/steakhouse/`, loaded by the existing `DataGuide` two-pass loader, seeded by a one-line `Ethos.Release.seed_steakhouse/1` delegating to `seed_directory/2`. No schema change: `restaurant` and `food` are already in their vocabularies, and all but one candidate city already has a destination node. A scoping wave decides the city list before any content is written.

**Tech Stack:** Elixir 1.x, Phoenix 1.7.14, Ecto/Postgres, ExUnit.

**Spec:** `docs/superpowers/specs/2026-09-06-steakhouses-design.md`

## Global Constraints

- **Every test command MUST set `MIX_TEST_PARTITION`** (e.g. `MIX_TEST_PARTITION=steak mix test`). Other worktrees share `ethos_test`; without it you will see mass phantom failures that are not yours.
- The suite must be green before every commit. Run it in the **foreground**; do not background a test run and wait for a notification.
- Never weaken, skip or delete a test to reach green.
- **Place slugs are globally unique across every seed source.** This is what enforces the overlap rule — a room `korean_bbq` already publishes must be linked, never restated.
- Photos: Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed, never hotlinked. One photo per **guide**, none per place — matching `korean_bbq` exactly.
- Inclusion rule, verbatim from the spec: **steak is the menu's centre of gravity, plus the beef-centric genres** (churrascaria, Argentine parrilla, Japanese wagyu counter, Korean-style beef room). A restaurant that merely serves a good steak is out.
- `mix format --check-formatted` clean for files you touch. Several inherited files are already unformatted; they are not yours.
- Phoenix 1.7.14. No AI or network calls in shipped code.

## File Structure

| File | Responsibility |
| --- | --- |
| `priv/seed_data/steakhouse_roster.json` | The city list the scoping wave returned: slug, city, node path, status, notes |
| `priv/seed_data/steakhouse/{city}.json` | One guide + its places + entries + links, per city |
| `priv/seed_data/steakhouse_photo_manifest.json` | Commons source per guide photo |
| `docs/superpowers/plans/2026-09-06-steakhouse-content-rules.md` | Binding authoring rules for every content wave |
| `lib/ethos/release.ex` | `seed_steakhouse/1`, one line, delegating to `seed_directory/2` |
| `lib/ethos/seeds/steakhouse_collection.ex` | The flat `/c/steakhouses` collection |
| `lib/mix/tasks/ethos.optimize_steakhouse_photos.ex` | Photo optimisation, mirroring the per-corpus tasks |
| `test/ethos/seeds/steakhouse_seed_data_test.exs` | The corpus gate |
| `test/ethos/seeds/steakhouse_roster_test.exs` | The roster gate |
| `docs/runbooks/seeding.md` | Gains a numbered seed step |

---

### Task 1: The scoping wave and its roster

**Files:**
- Create: `priv/seed_data/steakhouse_roster.json`
- Create: `test/ethos/seeds/steakhouse_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the roster, whose `path` values every later task reads. Shape: a JSON array of objects with keys `slug`, `city`, `path`, `status`, `note`.

This task is research, then a file. No content is authored here.

**The wave.** For each of the fourteen candidates — London, Manhattan, Brooklyn, Queens, the Bronx, Staten Island, Chicago, Los Angeles, San Francisco, Seattle, Boston, Washington DC, Baltimore, Miami — measure, under the inclusion rule in Global Constraints:

- how many qualifying rooms the metro holds, and where they cluster;
- whether the density is inside the city limits or suburban, which is what turned `korean_bbq`'s "Seattle" into "Puget Sound";
- whether a metro should split into two pages (`korean_bbq` split Chicago and San Francisco);
- whether a candidate cannot sustain a page and should merge or drop.

Use the two-agent pattern every corpus since Manhattan has used: one agent finds with evidence, one adversarially verifies. Write artifacts to scratchpad. A city's count is only as good as its verified rooms — an unverified list is not a measurement.

- [ ] **Step 1: Run the scoping wave**

Dispatch find + verify agents per candidate city. Each city's artifact must record, per room: name, address, the evidence that it qualifies under the inclusion rule, and the verdict.

- [ ] **Step 2: Write the roster from what the wave found**

`priv/seed_data/steakhouse_roster.json`. One row per page that will be built. `path` must be an existing node in `priv/seed_data/destination_tree.json` — **except** where the wave proves a page is needed at a node that does not exist yet, in which case set `path` to the intended path and record it in `note`; Task 3 adds the node.

```json
[
  {"slug": "manhattan", "city": "Manhattan", "status": "build",
   "path": "united-states/new-york/new-york-city/manhattan",
   "note": "23 qualifying rooms; densest of the fourteen"},
  {"slug": "staten-island", "city": "Staten Island", "status": "drop",
   "path": "united-states/new-york/new-york-city/staten-island",
   "note": "4 qualifying rooms, none with verifiable history; folded into a note on the Brooklyn page"}
]
```

`status` is one of `build`, `drop`, or `merged-into:{slug}`.

- [ ] **Step 3: Write the roster gate test**

`test/ethos/seeds/steakhouse_roster_test.exs`:

```elixir
defmodule Ethos.Seeds.SteakhouseRosterTest do
  use ExUnit.Case, async: true

  @roster Path.join(["priv", "seed_data", "steakhouse_roster.json"])
  @statuses ~w(build drop)

  defp roster, do: @roster |> File.read!() |> Jason.decode!()

  test "every row carries the keys the corpus reads" do
    for row <- roster() do
      for key <- ~w(slug city path status note) do
        assert is_binary(row[key]) and row[key] != "",
               "#{row["slug"]}: #{key} is missing or blank"
      end
    end
  end

  test "every status is one the corpus understands" do
    for row <- roster() do
      assert row["status"] in @statuses or
               String.starts_with?(row["status"], "merged-into:"),
             "#{row["slug"]} has status #{inspect(row["status"])}"
    end
  end

  test "a merge names a row that is itself built" do
    rows = roster()
    built = for r <- rows, r["status"] == "build", into: MapSet.new(), do: r["slug"]

    for r <- rows, String.starts_with?(r["status"], "merged-into:") do
      target = String.replace_prefix(r["status"], "merged-into:", "")

      assert MapSet.member?(built, target),
             "#{r["slug"]} merges into #{target}, which is not a built page"
    end
  end

  test "slugs are unique" do
    slugs = Enum.map(roster(), & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs))
  end

  test "the wave actually measured something" do
    rows = roster()
    assert length(rows) >= 10, "the wave returned #{length(rows)} rows for fourteen candidates"
    assert Enum.any?(rows, &(&1["status"] == "build"))
  end
end
```

- [ ] **Step 4: Run the roster gate**

Run: `MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_roster_test.exs`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
mix format
git add priv/seed_data/steakhouse_roster.json test/ethos/seeds/steakhouse_roster_test.exs
git commit -m "feat: scope the steakhouse cities and gate the roster"
```

---

### Task 2: The content rules document

**Files:**
- Create: `docs/superpowers/plans/2026-09-06-steakhouse-content-rules.md`

**Interfaces:**
- Consumes: the roster from Task 1.
- Produces: the binding rules every content wave (Task 6+) reads before authoring. No code.

Model it on `docs/superpowers/plans/2026-08-22-manhattan-content-rules.md`. It must state, concretely enough that two researchers reach the same answer:

- **The inclusion rule** verbatim from Global Constraints, with worked examples on both sides of the line: Keens is in; a brasserie with steak frites is out; Fogo de Chão is in; a Korean beef room `korean_bbq` already publishes is in *by prose reference only* (see below).
- **The overlap rule.** Before adding a place, check whether its slug already exists anywhere in `priv/seed_data/`. If it does, the guide names the room in prose and adds a `links` entry to the owning guide — it does **not** restate the place. Place slugs are globally unique; a duplicate fails the seed.
- **Verdict filtering**: `refuted` excluded or corrected; `uncertain` excluded from places entirely; unverified items never published.
- **The prose bans**, each with two specimens that must be caught and two that must publish:
  - superlatives ("best steak in the city", "finest", "most famous")
  - dry-aging duration without a named source, and any uniqueness claim about a programme
  - founding dates and "oldest" claims without a source
  - price points and tasting-menu costs
- **Guide shape**: intro 100-160 words; 2-4 sections clustering rooms by neighbourhood or corridor, the way `korean_bbq` does; 4-6 FAQ; one Commons photo.
- **`status`** is checked at authoring time and carries `open` or `closed`.

- [ ] **Step 1: Write the document**

- [ ] **Step 2: Commit**

```bash
git add docs/superpowers/plans/2026-09-06-steakhouse-content-rules.md
git commit -m "docs: steakhouse content authoring rules"
```

---

### Task 3: Corpus directory, seeder, and any missing nodes

**Files:**
- Create: `priv/seed_data/steakhouse/.gitkeep`
- Modify: `lib/ethos/release.ex`
- Modify: `priv/seed_data/destination_tree.json` (only if Task 1's roster needs a node that does not exist)
- Modify: `docs/runbooks/seeding.md`
- Test: `test/ethos/release_test.exs`

**Interfaces:**
- Consumes: `priv/seed_data/steakhouse_roster.json`.
- Produces: `Ethos.Release.seed_steakhouse/1`, which every later task and the runbook call.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/release_test.exs`, matching how the other corpus seeders are tested there:

```elixir
  test "seed_steakhouse/1 names the steakhouse seed directory" do
    assert function_exported?(Ethos.Release, :seed_steakhouse, 1)
  end
```

- [ ] **Step 2: Run it to verify it fails**

Run: `MIX_TEST_PARTITION=steak mix test test/ethos/release_test.exs`
Expected: FAIL — `seed_steakhouse/1` is not exported.

- [ ] **Step 3: Add the seeder**

In `lib/ethos/release.ex`, beside `seed_korean_bbq/1`:

```elixir
  def seed_steakhouse(email), do: seed_directory("steakhouse", email)
```

`seed_directory/2` already calls `DestinationTree.upsert_all!/0` first, does the two-pass places-then-guides load, and then resolves links — so nothing else is needed.

- [ ] **Step 4: Add any node the roster requires**

Read `priv/seed_data/steakhouse_roster.json`. For every `path` on a `build` row, confirm it exists in `priv/seed_data/destination_tree.json`. Thirteen of the fourteen candidates already have nodes; **Staten Island does not**, and a metro the wave split may need one too.

For each missing node, add it with its parents. A Staten Island page would need:

```json
{"path": "united-states/new-york/new-york-city/staten-island",
 "kind": "borough", "name": "Staten Island", "intro": "Staten Island."}
```

`DataDestination.upsert!/1` raises on a path no node owns, so a missing node fails at seed time rather than silently.

- [ ] **Step 5: Add the runbook step**

In `docs/runbooks/seeding.md`, add `Ethos.Release.seed_steakhouse(email)` to the numbered seed order, immediately after `seed_korean_bbq`. Renumber the steps below it. Update the step count in the surrounding prose.

**This is not optional.** `korean_bbq` was omitted from that list when it shipped, and an operator following the runbook would have restored production missing the entire corpus with nothing erroring.

- [ ] **Step 6: Run the tests and commit**

```bash
MIX_TEST_PARTITION=steak mix test
mix format
git add lib/ethos/release.ex priv/seed_data/steakhouse/.gitkeep priv/seed_data/destination_tree.json docs/runbooks/seeding.md test/ethos/release_test.exs
git commit -m "feat: seed the steakhouse corpus"
```

---

### Task 4: The corpus gate

**Files:**
- Create: `test/ethos/seeds/steakhouse_seed_data_test.exs`

**Interfaces:**
- Consumes: the roster, the corpus directory, `Ethos.Seeds.DestinationTree.load!/0`.
- Produces: the gate every content wave must satisfy.

Model it on `test/ethos/seeds/korean_bbq_seed_data_test.exs` (747 lines, 21 tests). That gate's most valuable property is that **it enforces its inclusion rule as a test** — *"every presented restaurant's prose names a grill at the table."* Steakhouses need the equivalent.

The gate must run green against an empty corpus so it can land before content, then bite as files arrive.

- [ ] **Step 1: Write the gate**

```elixir
defmodule Ethos.Seeds.SteakhouseSeedDataTest do
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

  @superlatives [~r/\bbest\b/i, ~r/\bfinest\b/i, ~r/\bmost famous\b/i,
                 ~r/\bgreatest\b/i, ~r/\bunrivalled\b/i, ~r/\bunrivaled\b/i]
  @price [~r/\$\d/, ~r/\bper person\b/i, ~r/\btasting menu costs\b/i]

  test "the superlative ban catches a ranking and spares an award" do
    assert Enum.any?(@superlatives, &Regex.match?(&1, "the best steak in the city"))
    assert Enum.any?(@superlatives, &Regex.match?(&1, "the finest dry-aging programme"))
    refute Enum.any?(@superlatives, &Regex.match?(&1, "a James Beard award in 2019"))
    refute Enum.any?(@superlatives, &Regex.match?(&1, "the oldest room on the block, per the city register"))
  end

  test "the price ban catches a figure and spares a year" do
    assert Enum.any?(@price, &Regex.match?(&1, "the porterhouse is $140"))
    assert Enum.any?(@price, &Regex.match?(&1, "about ninety dollars per person"))
    refute Enum.any?(@price, &Regex.match?(&1, "opened in 1885"))
  end

  test "no committed prose publishes a superlative or a price" do
    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      refute Enum.any?(@superlatives, &Regex.match?(&1, text)),
             "#{file}: superlative in #{inspect(String.slice(text, 0, 120))}"

      refute Enum.any?(@price, &Regex.match?(&1, text)),
             "#{file}: price in #{inspect(String.slice(text, 0, 120))}"
    end
  end

  # The inclusion rule, enforced. This is the steakhouse equivalent of
  # korean_bbq's "every presented restaurant's prose names a grill at the
  # table", and it is the single most valuable test in this file: without it,
  # "steak is the centre of gravity" is a sentence in a document that nothing
  # checks, and the city lists drift.
  @beef_evidence [
    ~r/\bdry-aged?\b/i, ~r/\bporterhouse\b/i, ~r/\bribeye\b/i, ~r/\brib eye\b/i,
    ~r/\bstrip steak\b/i, ~r/\bfilet\b/i, ~r/\bt-bone\b/i, ~r/\btomahawk\b/i,
    ~r/\bchophouse\b/i, ~r/\bsteakhouse\b/i, ~r/\bsteaks?\b/i,
    ~r/\bchurrasco\b/i, ~r/\brodizio\b/i, ~r/\bparrilla\b/i, ~r/\bwagyu\b/i,
    ~r/\basado\b/i, ~r/\bbeef\b/i
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

  @unsourced_age [~r/\boldest\b/i, ~r/\bsince \d{4}\b/i, ~r/\bfounded in \d{4}\b/i]
  @unsourced_aging [~r/\baged (?:for )?\d+ days?\b/i, ~r/\b\d+-day dry-aged?\b/i]

  test "the age and dry-aging bans catch an unsourced claim and spare a sourced one" do
    assert Enum.any?(@unsourced_age, &Regex.match?(&1, "the oldest steakhouse in the city"))
    assert Enum.any?(@unsourced_aging, &Regex.match?(&1, "aged 45 days in house"))
    refute Enum.any?(@unsourced_aging, &Regex.match?(&1, "a dry-aging room visible from the bar"))
  end

  test "no age or dry-aging claim publishes without naming its source" do
    sourced? = fn text ->
      Regex.match?(~r/\b(according to|per|the restaurant says|its own|register|landmark)\b/i, text)
    end

    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      hit = Enum.any?(@unsourced_age ++ @unsourced_aging, &Regex.match?(&1, text))

      if hit do
        assert sourced?.(text),
               "#{file}: an age or dry-aging claim publishes with no source: " <>
                 inspect(String.slice(text, 0, 140))
      end
    end
  end

  test "every place is a restaurant with a status the schema accepts" do
    for {file, doc} <- docs(), p <- doc["places"] do
      assert p["kind"] == "restaurant", "#{file}: #{p["slug"]} has kind #{inspect(p["kind"])}"
      assert p["status"] in ~w(open closed), "#{file}: #{p["slug"]} status #{inspect(p["status"])}"
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

  test "every guide carries exactly one photo, and every place none" do
    for {file, doc} <- docs() do
      assert length(doc["guide"]["photos"] || []) == 1,
             "#{file}: guide carries #{length(doc["guide"]["photos"] || [])} photos, expected 1"

      for p <- doc["places"] do
        assert (p["photos"] || []) == [], "#{file}: #{p["slug"]} carries a photo; places carry none"
      end
    end
  end

  test "every photograph carries a publishable licence and its attribution" do
    allowed = ["CC0", "Public domain", "CC BY 2.0", "CC BY 3.0", "CC BY 4.0",
               "CC BY-SA 2.0", "CC BY-SA 3.0", "CC BY-SA 4.0"]

    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      assert photo["license"] in allowed, "#{file}: licence #{inspect(photo["license"])}"
      assert is_binary(photo["author"]) and photo["author"] != "", "#{file}: photo has no author"

      assert String.starts_with?(photo["source_url"] || "", "https://commons.wikimedia.org/"),
             "#{file}: photo source is not Commons"

      assert File.exists?(Path.join(["priv", "static", photo["src"]])),
             "#{file}: photo file #{photo["src"]} is not on disk"
    end
  end

  test "the corpus matches the roster's built rows" do
    expected = built() |> Enum.map(& &1["slug"]) |> Enum.sort()
    actual = files() |> Enum.map(&(&1 |> Path.basename() |> Path.rootname())) |> Enum.sort()

    assert actual == expected,
           "corpus and roster disagree — only in corpus: #{inspect(actual -- expected)}, " <>
             "only in roster: #{inspect(expected -- actual)}"
  end
end
```

- [ ] **Step 2: Run the gate**

Run: `MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_seed_data_test.exs`
Expected: PASS. With no content yet, the corpus-versus-roster test fails if Task 1 marked any city `build` — that is correct, and Task 6 clears it.

- [ ] **Step 3: Prove the gates bite — all three classes**

Each of these must be watched failing, then reverted. **A gate you have not watched fail is not a gate**, and this project has already seen a negative-only affiliate test stay green through two live outages.

1. **Superlative:** add `"the best steak in the city"` to a committed guide's intro. Expect the prose test to fail naming that file.
2. **Inclusion rule:** change a committed place's `summary` and `history` to prose with no beef in it — `"a handsome room with a pressed-tin ceiling"`. Expect *"is published as a steakhouse but its prose never evidences beef"* naming that slug.
3. **Overlap:** copy a place slug that `korean_bbq` owns into a steakhouse file's `places`. Expect the cross-corpus test to fail listing that slug.

Record the three failure messages in your report.

- [ ] **Step 4: Commit**

```bash
mix format
git add test/ethos/seeds/steakhouse_seed_data_test.exs
git commit -m "test: gate the steakhouse corpus"
```

---

### Task 5: The collection

**Files:**
- Create: `lib/ethos/seeds/steakhouse_collection.ex`
- Modify: `lib/ethos/release.ex` (register in `seed_collections/0`)
- Test: `test/ethos/seeds/steakhouse_collection_test.exs`

**Interfaces:**
- Consumes: guides seeded by `seed_steakhouse/1`.
- Produces: `Ethos.Seeds.SteakhouseCollection.upsert!/0` and `attrs/0`.

Mirror `lib/ethos/seeds/korean_bbq_collection.ex`, including its practice of exposing `attrs/0` separately from `upsert!/0` so the gate can read the module's prose without writing to the repo.

- [ ] **Step 1: Write the failing test**

```elixir
defmodule Ethos.Seeds.SteakhouseCollectionTest do
  use Ethos.DataCase, async: false

  alias Ethos.Seeds.SteakhouseCollection

  test "attrs/0 describes a published collection with a blurb per guide" do
    attrs = SteakhouseCollection.attrs()

    assert attrs.slug == "steakhouses"
    assert attrs.published == true
    assert String.length(attrs.intro) > 200

    for item <- attrs.items do
      assert String.ends_with?(item.guide_slug, "-steakhouse-guide")
      assert is_binary(item.blurb) and item.blurb != ""
      assert String.length(item.blurb) <= 300
    end
  end

  test "every built roster row has an item, and every item a roster row" do
    roster =
      ["priv", "seed_data", "steakhouse_roster.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    expected =
      for r <- roster, r["status"] == "build", into: MapSet.new(), do: "#{r["slug"]}-steakhouse-guide"

    actual = MapSet.new(SteakhouseCollection.attrs().items, & &1.guide_slug)

    assert MapSet.equal?(actual, expected),
           "collection and roster disagree — only in collection: " <>
             "#{inspect(MapSet.difference(actual, expected))}, " <>
             "only in roster: #{inspect(MapSet.difference(expected, actual))}"
  end
end
```

- [ ] **Step 2: Run it to verify it fails**

Run: `MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_collection_test.exs`
Expected: FAIL — the module does not exist.

- [ ] **Step 3: Write the module**

`lib/ethos/seeds/steakhouse_collection.ex`, with `@moduledoc` recording why the city list is what it is — the way `KoreanBbqCollection` records why Seattle became Puget Sound. Take the reasoning from Task 1's roster `note` fields.

```elixir
defmodule Ethos.Seeds.SteakhouseCollection do
  @moduledoc """
  Seeds the Steakhouses collection. Idempotent by slug.

  `Collections.upsert_collection!/1` raises on an item whose guide slug has no
  row yet, so this must run after `seed_steakhouse/1` — which is why
  `seed_collections/0` runs last in the release sequence.
  """

  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(attrs())

  @doc """
  The collection's attrs, exposed separately from `upsert!/0` so the seed data
  gate can read this module's own prose without writing to the repo.
  """
  def attrs do
    %{
      slug: "steakhouses",
      title: "Steakhouses",
      published: true,
      intro: """
      …
      """,
      items: [
        %{guide_slug: "manhattan-steakhouse-guide", blurb: "…"}
      ]
    }
  end
end
```

- [ ] **Step 4: Register it**

In `lib/ethos/release.ex`'s `seed_collections/0`, add `Ethos.Seeds.SteakhouseCollection` alongside the existing collection modules.

- [ ] **Step 5: Run the tests and commit**

```bash
MIX_TEST_PARTITION=steak mix test
mix format
git add lib/ethos/seeds/steakhouse_collection.ex lib/ethos/release.ex test/ethos/seeds/steakhouse_collection_test.exs
git commit -m "feat: the steakhouses collection"
```

---

### Task 6: Photo manifest and optimisation task

**Files:**
- Create: `priv/seed_data/steakhouse_photo_manifest.json`
- Create: `lib/mix/tasks/ethos.optimize_steakhouse_photos.ex`

**Interfaces:**
- Consumes: the corpus.
- Produces: `mix ethos.optimize_steakhouse_photos`, and photos under `/photos/steakhouse/{city}/`.

Mirror `lib/mix/tasks/ethos.optimize_sf_photos.ex` (or whichever per-corpus task is closest), pointed at the steakhouse seed directory, sourcing originals from a git-ignored `images/steakhouse/`.

- [ ] **Step 1: Write the manifest**

One entry per guide photo: the Commons file page URL, the direct image URL, licence, author, and the destination `src`/`thumb` paths. Match the shape of `priv/seed_data/korean_bbq_photo_manifest.json`.

- [ ] **Step 2: Write the mix task**

Copy the closest existing optimize task, change the corpus directory and photo root. It must scan the seed JSON for `photos[].src`, find the corresponding original, and write optimised full and thumb JPEGs.

- [ ] **Step 3: Run it and confirm the gate passes**

Run: `mix ethos.optimize_steakhouse_photos` then
`MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_seed_data_test.exs`
Expected: the photo test passes — every `src` exists on disk.

- [ ] **Step 4: Commit**

```bash
mix format
git add priv/seed_data/steakhouse_photo_manifest.json lib/mix/tasks/ethos.optimize_steakhouse_photos.ex priv/static/photos/steakhouse
git commit -m "feat: steakhouse photo manifest and optimisation task"
```

---

### Task 7 onward: Content waves

One task per wave of 3-4 cities, until every `build` row in the roster has a file. Each wave is identical in shape, so this section describes one; repeat it per batch, naming the cities in that batch.

**Files:**
- Create: `priv/seed_data/steakhouse/{city}.json` for each city in the wave.

**Interfaces:**
- Consumes: the roster (Task 1), the content rules (Task 2), the gate (Task 4).
- Produces: guides the collection (Task 5) lists.

- [ ] **Step 1: Read the content rules**

`docs/superpowers/plans/2026-09-06-steakhouse-content-rules.md`, in full, before authoring. It is binding.

- [ ] **Step 2: Run the research for this wave's cities**

Two agents per city — find, then adversarially verify. Artifacts to scratchpad. Author only from `confirmed` verdicts.

- [ ] **Step 3: Author the files**

One JSON per city, in the shape the spec's §5 gives. For every room, before adding it as a place, grep `priv/seed_data/` for its slug: **if another corpus already owns it, reference it in prose and add a `links` entry to the owning guide instead of restating the place.** The gate's cross-corpus test enforces this, and a duplicate fails the seed.

- [ ] **Step 4: Run the gate**

Run: `MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_seed_data_test.exs`
Expected: PASS for the files in this wave.

- [ ] **Step 5: Add this wave's cities to the collection**

Add an item and blurb per new guide in `lib/ethos/seeds/steakhouse_collection.ex`. The collection test asserts collection and roster agree, so a wave that forgets this fails.

- [ ] **Step 6: Run the full suite and commit**

```bash
MIX_TEST_PARTITION=steak mix test
mix format
git add priv/seed_data/steakhouse/ lib/ethos/seeds/steakhouse_collection.ex
git commit -m "feat: steakhouse guides for <cities in this wave>"
```

---

## Deployment

After every wave has landed and the suite is green:

```bash
fly deploy
fly ssh console --app ethos -C '/app/bin/ethos eval Ethos.Release.seed_steakhouse(~s[cryptcom@gmail.com])'
fly ssh console --app ethos -C '/app/bin/ethos eval Ethos.Release.seed_collections()'
```

Note the `~s[...]` sigil rather than quotes — `fly ssh console` strips quotes.

`seed_steakhouse` must run **before** `seed_collections`, because `Collections.upsert_collection!/1` raises on an item whose guide has no row yet.

Verify live: the collection at `/c/steakhouses`, one guide per built city, a place page for a room, and that a room `korean_bbq` owns still resolves to its original guide rather than a duplicate.

## Notes for the executor

- **Never run a test command without `MIX_TEST_PARTITION`.** See Global Constraints.
- The overlap rule is the one a researcher will get wrong. When in doubt, grep first: `grep -rl '"slug": "the-room-slug"' priv/seed_data/`.
- If a wave discovers a city the roster marked `build` cannot actually sustain a page, do not pad it. Change the roster row to `drop` or `merged-into:`, update the collection, and say so in the commit — the roster gate and the collection test will both keep you honest.
