# A Public Course in Every State — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish fifty guides, one per US state, each anchored on the top-ranked publicly accessible golf course in that state and carrying the weekend around it — lodging, dining, a second public course, and how to get there.

**Architecture:** Pure data buildout through the existing `Ethos.Seeds.DataGuide` two-pass JSON pipeline. Fifty seed files under `priv/seed_data/golf/`, one roster, one per-directory gate, one collection module, one photo task, and three one-line wiring edits. No schema, no migration, no route.

**Tech Stack:** Elixir/Phoenix, Ecto, ExUnit, Vix (via `Ethos.PhotoOptimizer`), `Ethos.Seeds.DataGuide`, `Ethos.Collections`, `Ethos.Links`.

**Spec:** `docs/superpowers/specs/2026-09-05-golf-courses-design.md`

**Operating manual:** `docs/site-builder.md` — binding. Tasks cite it rather than restating it. A rule weakened there is weakened everywhere.

## Global Constraints

- **`MIX_TEST_PARTITION=_golf` is required for every `mix test` in this worktree.** The shared `ethos_test` database belongs to another branch (its `users` table has `username`, `username_provisional`, `trusted_at`, `banned_at`, `ban_reason`, none of which exist in any migration here). Without the partition, 333 of 746 tests fail on a not-null violation unrelated to this work.
- Baseline before Task 1: **746 tests, 0 failures, 4 excluded.** Every task ends with the full suite green and `mix format` clean.
- Guide slugs: `{state-slug}-golf-guide`. Guide `destination`: `"{Basecamp City}, {State}"`. Guide `state`: the state's full name. Guide `county`: researched, never derived.
- Seed files: `priv/seed_data/golf/{state-slug}.json`, exactly the shape of `priv/seed_data/manhattan/*.json`.
- Photos: Wikimedia Commons **Public domain / CC0 / CC BY x.y / CC BY-SA x.y only**, attributed, never hotlinked, under `/photos/us/golf/{state-slug}/`.
- Every published clause traces to a `confirmed` verdict. The finder never writes verdicts (§4).
- No trip durations, anywhere (§8). No vague proximity (§8 sibling ban). `Getting there` is the exact heading — lowercase `t`, no trailing mode.
- No minimum word count is to be added anywhere, ever (§4 rule 2).

---

## File Structure

**Created:**

| path | responsibility |
|---|---|
| `priv/seed_data/golf_courses_roster.json` | the work list: 50 rows, identity given, research null |
| `priv/seed_data/golf/{state-slug}.json` ×50 | one guide + its places + its entries + its links |
| `priv/seed_data/golf_photo_manifest.json` | photo provenance, verified by `Ethos.PhotoManifest` |
| `test/ethos/seeds/golf_courses_roster_test.exs` | roster shape, attribution, exhaustion |
| `test/ethos/seeds/golf_seed_data_test.exs` | the per-directory gate: prose bans, sections, photos, idempotency |
| `test/ethos/seeds/golf_collection_test.exs` | collection membership, both directions |
| `lib/ethos/seeds/golf_collection.ex` | the collection: slug, intro, 50 blurbs |
| `lib/mix/tasks/ethos.optimize_golf_photos.ex` | Commons originals → `priv/photos/us/golf/` |
| `docs/golf/{state-slug}.md` ×50 | audit trail: every published sentence against its verdict |

**Modified:**

| path | change |
|---|---|
| `lib/ethos/places/place.ex:7` | add `golf-course` to `@kinds` |
| `lib/ethos_web/controllers/place_html.ex:6-19` | add `"golf-course" => "GolfCourse"` |
| `lib/ethos/release.ex` | add `seed_golf/1`; add the collection to `seed_collections/0` |
| `docs/runbooks/seeding.md` | the new step, with its ordering constraint |
| `docs/site-builder.md` §10 | the golf amendment; refresh §3's stale line citations |

---

## Task 1: The `golf-course` place kind

A course cannot be seeded at all until `Place.changeset/2` accepts its kind, and the structured-data corpus test asserts every kind maps to a real schema.org type. This is the smallest change that unblocks everything and it carries its own test cycle.

**Files:**
- Modify: `lib/ethos/places/place.ex:7`
- Modify: `lib/ethos_web/controllers/place_html.ex:6-19`
- Test: `test/ethos_web/controllers/place_html_test.exs` (or the existing kind-mapping test — locate it with `grep -rn "schema_type" test/`)

**Interfaces:**
- Consumes: nothing.
- Produces: `"golf-course"` is a valid `Place.kind`, and `EthosWeb.PlaceHTML.schema_type("golf-course") == "GolfCourse"`.

- [ ] **Step 1: Find the existing kind-mapping test**

```bash
grep -rn "schema_type\|Place.kinds()" test/ | head
```

Read whatever it asserts. It already requires every kind in `Place.kinds/0` to map to a non-default schema.org type; that is the test this task must keep green.

- [ ] **Step 2: Write the failing test**

Add to the file found in Step 1:

```elixir
test "a golf course maps to the schema.org GolfCourse type" do
  assert "golf-course" in Ethos.Places.Place.kinds()
  assert EthosWeb.PlaceHTML.schema_type("golf-course") == "GolfCourse"
end
```

- [ ] **Step 3: Run it and watch it fail**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos_web/controllers/place_html_test.exs
```

Expected: FAIL — `"golf-course" in Place.kinds()` is false. If it fails instead on `schema_type` returning `"TouristAttraction"`, that is the fallback in `place_html.ex:21` and is also correct-to-fail.

- [ ] **Step 4: Add the kind**

`lib/ethos/places/place.ex:7` — append `golf-course` to the sigil, keeping the existing order and adding at the end:

```elixir
@kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction golf-course)
```

- [ ] **Step 5: Add the schema type**

`lib/ethos_web/controllers/place_html.ex`, inside `@schema_types`, after `"stadium" => "StadiumOrArena"`:

```elixir
    "stadium" => "StadiumOrArena",
    "golf-course" => "GolfCourse"
```

- [ ] **Step 6: Run the full suite**

```bash
MIX_TEST_PARTITION=_golf mix test
```

Expected: 747 tests, 0 failures. If `test/ethos_web/components/structured_data_test.exs` fails, read its message — it walks the whole corpus and will tell you exactly which assertion the new kind broke.

- [ ] **Step 7: Format and commit**

```bash
mix format
git add lib/ethos/places/place.ex lib/ethos_web/controllers/place_html.ex test/
git commit -m "feat: a golf course is a kind of place

schema.org GolfCourse. The kind has to exist before any course can be
seeded, and the corpus structured-data test requires every kind to map to
a real type rather than falling through to TouristAttraction."
```

---

## Task 2: The roster, asserting almost nothing

§2: commit the work list **before any research**. Fifty rows whose only given fields are the state and its slug; everything a verdict must establish starts `null`. A roster that asserted fifty course names up front would launder fifty unverified facts into a committed file every later task would treat as settled.

**Files:**
- Create: `priv/seed_data/golf_courses_roster.json`
- Create: `test/ethos/seeds/golf_courses_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `priv/seed_data/golf_courses_roster.json` — a JSON array of 50 objects, each with exactly these twelve keys: `state`, `slug`, `course`, `facility`, `city`, `county`, `access`, `ranking_source`, `ranking_edition`, `ranking_position`, `second_course`, `criterion`, `verified`. `slug` is the state slug (e.g. `"new-hampshire"`); the guide's own slug is `"{slug}-golf-guide"`. `verified` is a boolean; every other researched field is `null` or a non-empty string. Later tasks fill rows; nothing else reads this file at runtime.

- [ ] **Step 1: Generate the roster**

Run this from the project root. A generator rather than fifty hand-typed rows, because a typo in a state name would be silent and this is deterministic:

```bash
python3 - <<'PY'
import json, re
STATES = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut",
"Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas",
"Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota",
"Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey",
"New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon",
"Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah",
"Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
assert len(STATES) == 50
def slug(s): return re.sub(r"[^a-z0-9]+", "-", s.lower()).strip("-")
rows = [{
    "state": s, "slug": slug(s),
    "course": None, "facility": None, "city": None, "county": None,
    "access": None, "ranking_source": None, "ranking_edition": None,
    "ranking_position": None, "second_course": None, "criterion": None,
    "verified": False,
} for s in STATES]
with open("priv/seed_data/golf_courses_roster.json", "w") as f:
    f.write("[\n" + ",\n".join(json.dumps(r, sort_keys=True) for r in rows) + "\n]\n")
print(len(rows), "rows")
PY
```

Expected output: `50 rows`. One row per line, keys sorted, matching the one-object-per-line style of `priv/seed_data/mlb_clubs_roster.json`.

- [ ] **Step 2: Write the failing gate**

Create `test/ethos/seeds/golf_courses_roster_test.exs`. This is `mlb_clubs_roster_test.exs` ported, with the exhaustion test deliberately written to **fail now and pass at the end** — it is the mechanical proof that no state was skipped, and §2 says exhaustion is a check, not a feeling.

```elixir
defmodule Ethos.Seeds.GolfCoursesRosterTest do
  @moduledoc """
  The work list for the golf set, and the three things that can go wrong with
  one.

  Ported from `mlb_clubs_roster_test.exs`, which learned each of these the
  expensive way. The attribution test in particular is not optional: the
  bare-places roster originally flattened the corpus to a list of slugs and
  checked membership, and under mutation a repointed `seed_file`, a `region`
  set to "atlantis" and a changed `name` all passed every assertion.

  `second_course`, `ranking_position` and `access` stay OUT of the attribution
  tuple while still being asserted non-empty on a resolved row. A later wave
  may legitimately correct any of them — asserting them would fail this test
  for the programme doing its job. The tuple holds the fields that identify
  *which record this is*; the work is allowed to improve the rest (§2).
  """
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  @path "priv/seed_data/golf_courses_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  @researched ~w(course facility city county access ranking_source
                 ranking_edition ranking_position criterion)

  test "one row per state, no duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == 50
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate state slugs"

    states = Enum.map(@roster, & &1["state"])
    assert length(states) == length(Enum.uniq(states)), "duplicate state names"
  end

  test "every row carries the same key set, and the identity fields are given" do
    expected = Enum.sort(~w(access city county course criterion facility
                            ranking_edition ranking_position ranking_source
                            second_course slug state verified))

    for entry <- @roster do
      assert Enum.sort(Map.keys(entry)) == expected,
             "unexpected key set on #{inspect(entry["slug"])}"

      assert is_binary(entry["state"]) and entry["state"] != ""
      assert is_binary(entry["slug"]) and entry["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_boolean(entry["verified"])
    end
  end

  # Resolved together or not at all. A half-filled row means someone wrote down
  # what they thought they knew and stopped, and nothing downstream
  # distinguishes it from research output.
  #
  # `second_course` is exempt from the "resolved means non-null" half: a state
  # may genuinely have no second public course worth naming, and publishing
  # without one is a legitimate outcome (§4 rule 2 — there is no floor).
  test "a row is resolved together or not at all" do
    for entry <- @roster do
      required = for k <- @researched, do: entry[k]

      if entry["verified"] do
        assert Enum.all?(required, &(is_binary(&1) and &1 != "")),
               "#{entry["slug"]} is marked verified with a missing field: " <>
                 inspect(for k <- @researched, is_nil(entry[k]) or entry[k] == "", do: k)
      else
        assert Enum.all?(required, &is_nil/1),
               "#{entry["slug"]} carries researched data without being verified"

        assert is_nil(entry["second_course"]),
               "#{entry["slug"]} names a second course without being verified"
      end
    end
  end

  # Shape is not attribution. Every assertion above passes while a resolved row
  # names a course, city, state or county that disagrees with what shipped.
  test "a resolved row agrees with the place the corpus actually seeds" do
    resolved = Enum.filter(@roster, & &1["verified"])

    # Non-vacuous. The roster starts fully unresolved, so without this the
    # check would ship green and empty and stay that way through five waves.
    assert resolved != [], "no resolved roster rows — this assertion is checking nothing"

    golf_places =
      for f <- SeedDataHelpers.seed_files("golf"),
          p <- DataGuide.load!(f)["places"],
          p["kind"] == "golf-course",
          do: p

    names = Enum.map(golf_places, & &1["name"])

    assert length(names) == length(Enum.uniq(names)),
           "two golf-course places share a name, so the map below would drop one: " <>
             inspect(names -- Enum.uniq(names))

    corpus = Map.new(golf_places, &{&1["name"], {&1["town"], &1["state"], &1["county"]}})

    for entry <- resolved do
      slug = entry["slug"]

      assert Map.has_key?(corpus, entry["course"]),
             "#{slug} names course #{inspect(entry["course"])}, which no seeded place matches"

      assert corpus[entry["course"]] == {entry["city"], entry["state"], entry["county"]},
             "#{slug} disagrees with the corpus: roster has " <>
               inspect({entry["city"], entry["state"], entry["county"]}) <>
               ", the #{inspect(entry["course"])} place record has " <>
               inspect(corpus[entry["course"]])
    end
  end

  # §3's shadowing trap, mechanised. Fifty new destination slugs is fifty
  # chances to take a URL an existing town guide already answers on. The
  # remedy when it happens is the shadowed-guide line the state hub already
  # renders (`Guides.list_guides_shadowed_by_state/1`), not a rename — but it
  # must be a decision somebody made, not one nobody noticed.
  test "no golf guide's destination slug silently takes an existing page's URL" do
    golf_files = SeedDataHelpers.seed_files("golf")

    golf_dests =
      for f <- golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          do: {Path.basename(f), Ethos.Guides.Guide.derive_destination_slug(d)}

    other_dests =
      for f <- SeedDataHelpers.all_seed_files(),
          f not in golf_files,
          d = DataGuide.load!(f)["guide"]["destination"],
          into: MapSet.new(),
          do: Ethos.Guides.Guide.derive_destination_slug(d)

    collisions =
      for {file, slug} <- golf_dests, MapSet.member?(other_dests, slug), do: {file, slug}

    assert collisions == [],
           "golf basecamps whose destination slug is already answered by another guide — " <>
             "decide whether to share the hub or rebase, and record it in the guide's file: " <>
             inspect(collisions)
  end

  # The set is finished, and this is what makes "finished" a fact rather than a
  # claim in a wave report. It FAILS until wave 5 lands. That is intended: a
  # red exhaustion check is the visible remainder of the work.
  @tag :pending_golf
  test "all fifty states are resolved, against the courses the corpus seeds" do
    unresolved = for entry <- @roster, not entry["verified"], do: entry["slug"]

    assert unresolved == [],
           "these state rows are unresolved: #{inspect(unresolved)}"

    roster_courses = @roster |> Enum.map(& &1["course"]) |> Enum.sort()

    seeded_courses =
      for f <- SeedDataHelpers.seed_files("golf"),
          p <- DataGuide.load!(f)["places"],
          p["kind"] == "golf-course",
          do: p["name"]

    assert length(roster_courses) == 50

    assert roster_courses == Enum.sort(seeded_courses) |> Enum.uniq(),
           "the roster and the seeded courses disagree — in the roster only: " <>
             inspect(roster_courses -- seeded_courses) <>
             ", seeded only: " <> inspect(seeded_courses -- roster_courses)
  end
end
```

- [ ] **Step 3: Exclude `:pending_golf` until the waves resolve rows**

`test/test_helper.exs` has **exactly one** `ExUnit.configure/1` call, and that is load-bearing. The file says so three separate times, in the words of three previous programmes:

> All three tags live in ONE `ExUnit.configure` call because a second call passing `exclude:` **replaces** the list rather than appending to it — which would silently re-enable the two `:pending_wave` tests and the Bronx gate, and turn the suite red on pre-existing defects neither programme owns.

So **edit the existing list in place.** Do not add a second call. The current line is:

```elixir
ExUnit.configure(exclude: [:pending_wave, :pending_bronx])
```

Change it to:

```elixir
ExUnit.configure(exclude: [:pending_wave, :pending_bronx, :pending_golf])
```

The tag name follows the house convention — `:pending_bronx`, `:pending_queens`, `:pending_rome`, `:pending_san_francisco` and `:pending_london` all came and went this way. It is a **separate** tag rather than a reuse of `:pending_bronx`, for the reason that file gives every time: the Bronx programme still has Fordham Heights outstanding, and whichever finishes first would either be unable to delete a shared tag or, deleting it, un-exclude the other's gate and turn the suite red on a corpus it never touched.

Add an explanatory comment above the call in the style of the others already there — what the tag guards, why it is separate, and the two stages of its removal (Task 6 resolves the first row, which makes the attribution test meaningful; Task 13 removes the tag once all fifty are resolved).

**Note one deliberate deviation from the house pattern, and keep it.** Previous gates carried `@moduletag :pending_<set>` over the *whole* file, which the London entry records as a real cost: *"Its self-tests — the ones proving each ban can fail and does not fire on prose that must publish — are the reason the gate is worth landing before the corpus, and they are also excluded until the first wave."* The golf gate in Task 3 is written with no vacuity floors, so it runs green **and non-vacuously** on an empty directory and needs no tag at all. Only the two roster tests that genuinely cannot check anything before a row is resolved carry `@tag :pending_golf`.

- [ ] **Step 4: Run the gate**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_courses_roster_test.exs
```

Expected: the attribution test FAILS with `"no resolved roster rows — this assertion is checking nothing"`. Everything else passes. **This failure is correct and expected** — it is the non-vacuity guard doing its job on an unresolved roster.

- [ ] **Step 5: Make the attribution test skip cleanly until the checkpoint**

Tag it so an unresolved roster does not hold the suite red for the whole programme, while keeping the guard:

```elixir
  @tag :pending_golf
  test "a resolved row agrees with the place the corpus actually seeds" do
```

Re-run. Expected: all remaining tests pass, two excluded.

- [ ] **Step 6: Run the full suite, format, commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add priv/seed_data/golf_courses_roster.json test/ethos/seeds/golf_courses_roster_test.exs test/test_helper.exs
git commit -m "test: the golf roster, asserting almost nothing

Fifty rows, state and slug given, every researched field null. Fifty
states is a fact; fifty courses is an assumption, and the roster refuses
to launder the second into a committed file.

Ports the mlb_clubs_roster attribution tuple, which mutation testing
showed a slug-membership check passes straight through, and adds the
destination-slug collision sweep §3 asks for. The exhaustion and
attribution tests are tagged :pending_golf and excluded until the waves
resolve rows; a red exhaustion check is the visible remainder."
```

---

## Task 3: The per-directory gate, written before any content

§1 step 4, and the ordering is the point: *"Write it before the checkpoint, so the checkpoint site is the first thing it checks."* §8's own doctrine is that a prose rule restated in every dispatch and checked in every review **demonstrably does not hold** — the Wrigley checkpoint's four Critical defects were all unsourced spatial claims that a reviewer caught and no gate did.

The gate is built around a pure `banned_phrases/1` so every pattern is pinned by a specimen from day one, with no golf content in the repo yet. Without specimens the patterns are load-bearing only in aggregate: nothing in an empty corpus fires them, so any subset could be deleted and the suite would stay green.

**Files:**
- Create: `test/ethos/seeds/golf_seed_data_test.exs`

**Interfaces:**
- Consumes: `Ethos.SeedDataHelpers.seed_files("golf")`, `Ethos.Seeds.DataGuide.load!/1`, `Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0`.
- Produces: nothing other tasks call. Waves 1-5 and the checkpoint must keep it green.

- [ ] **Step 1: Write the gate**

Create `test/ethos/seeds/golf_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.GolfSeedDataTest do
  @moduledoc """
  The per-set gate for the golf corpus.

  Written before a single guide exists, because §1 step 4 puts it there and
  because the alternative is measurable: the Wrigley Field checkpoint's four
  Critical content defects were **all** unsourced spatial claims, caught by a
  reviewer on a programme whose §8 already said a reviewed rule does not hold.

  ## What golf strains that no previous set did

  "A thirty-minute drive from the airport" is the most natural sentence anyone
  will write about a golf resort, and this corpus has already shipped
  "within a short drive", "ten minutes east" and "about ten minutes away" to
  production from `burys_collection.ex` and `middlebury_guide.ex`. The
  duration patterns below are copied VERBATIM from
  `destination_seed_data_test.exs` — the one of the three copies that can
  prove it has not been weakened. Do not re-derive, condense or "improve" one
  of them: a subtly weaker pattern is exactly the failure this gate exists to
  prevent, and it does not show up as a test failure.

  ## Tuning

  The proximity patterns are ported from `ballpark_seed_data_test.exs`, whose
  header records the four candidates rejected on measurement over 272 files —
  bare `\\d+ blocks` (49 hits), `across from` (16, one of them a confirmed
  verdict's own wording), `just north/south/east/west of` (18) and
  `nearby|close by` (474, because `nearby` is a link kind). Pattern 5's noun
  list is re-pointed at golf nouns; everything else is carried across
  unchanged. **Before adding a pattern of your own, measure it over the whole
  corpus first** — an over-broad gate gets excluded, and an excluded gate is
  not a gate.

  ## What this does not catch

  An unsourced *containment* claim in ordinary prose — "both are in Ponte
  Vedra Beach" — is grammatically identical to the sourced sentence beside it
  and no pattern separates them. That is §7's rung (c), and the defence is the
  committed per-state verdict trace in `docs/golf/`, not this file. Say so in
  the dispatch rather than implying the gate covers it.
  """
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  defp files, do: SeedDataHelpers.seed_files("golf")

  # --- Trip-duration ban, verbatim from destination_seed_data_test.exs -----
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minutes?\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute|walk|stroll)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip|walk|stroll)\b/i,
    ~r/\b(?:reaches|gets you to|puts you in|takes you to)\b[^.]{0,40}\bin\s+(?:about\s+)?\d+/i,
    ~r/\bin\s+(?:about|roughly|around|under|over|just|only)?\s*\d+\s*hours?\b/i
  ]

  # --- Vague-proximity ban, ported from ballpark_seed_data_test.exs --------
  @proximity_patterns [
    ~r/\b(?:\d+|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)[-\s]blocks?\s+(?:north|south|east|west|away|up|down|over)\b/i,
    ~r/\bnext door\b/i,
    ~r/\bacross the street from\b/i,
    ~r/\ba few doors\s+(?:down|away|up)\b/i,
    # Noun list re-pointed at golf. A direction relative to a NAMED feature
    # ("north of Highway 101") still publishes; §8 explicitly allows a
    # bordering relationship.
    ~r/\b(?:north|south|east|west)\s+of\s+the\s+(?:course|clubhouse|resort|links|property|site|first tee)\b/i,
    ~r/\b(?:steps|a stone's throw|moments)\s+(?:from|away)\b/i,
    # Case-SENSITIVE and lowercase on purpose, following the ballpark copy:
    # the capitalised form appears in a proper name in the Manhattan corpus.
    ~r/(?-i:around the corner)/,
    ~r/\b(?:down|up)\s+the\s+(?:street|road|block)\b/i,
    ~r/\bwithin walking distance\b/i
  ]

  @patterns @trip_duration_patterns ++ @proximity_patterns

  # Starts empty and must stay empty without a manual read and a stated reason
  # in a wave report. Keyed {file, json path, matched phrase} — the narrow form
  # — so pardoning a phrase in one summary does not pardon it in the intro.
  @allowlist []

  @doc false
  def banned_phrases(text) when is_binary(text) do
    for p <- @patterns, m = Regex.run(p, text), not is_nil(m), uniq: true, do: hd(m)
  end

  # Walks the PUBLISHED structure, not raw file text. §8: a source scan cannot
  # tell a defect from a moduledoc recording one, and walking the data yields a
  # {file, path, phrase} allowlist key instead of {file, phrase}.
  defp collect_strings(data, path \\ [])
  defp collect_strings(s, path) when is_binary(s), do: [{Enum.reverse(path), s}]

  defp collect_strings(m, path) when is_map(m),
    do: Enum.flat_map(m, fn {k, v} -> collect_strings(v, [k | path]) end)

  defp collect_strings(l, path) when is_list(l),
    do: l |> Enum.with_index() |> Enum.flat_map(fn {v, i} -> collect_strings(v, [i | path]) end)

  defp collect_strings(_, _), do: []

  defp violations do
    for f <- files(),
        {path, text} <- collect_strings(DataGuide.load!(f)),
        phrase <- banned_phrases(text),
        {Path.basename(f), path, phrase} not in @allowlist,
        uniq: true,
        do: {Path.basename(f), Enum.join(path, "."), phrase}
  end

  # --- Specimens: each pattern individually load-bearing -------------------
  #
  # Indexed and in the order the patterns are declared. Without these, an
  # empty or thin golf corpus fires almost none of them, so any subset could
  # be deleted or weakened and this suite would stay green — which is the
  # exact hole the destination gate's specimens exist to close.
  @specimens [
    {1, "the clubhouse is a 15-minute walk from the lodge"},
    {2, "the resort sits 20 mins south of the airport"},
    {3, "the second course is about 40 min from the first"},
    {4, "the airport is half an hour by car from the resort"},
    {5, "a drive of about 25 min separates the two courses"},
    {6, "the coast is 3 hours away by car"},
    {7, "the inn stands twenty minutes north of the links"},
    {8, "the tavern is a short drive from the clubhouse"},
    {9, "the hotel is within a short drive of the first tee"},
    {10, "the shuttle reaches the clubhouse in about 25"},
    {11, "the highway covers the same ground in about 2 hours"},
    {12, "the practice green is three blocks north"},
    {13, "the pro shop is next door"},
    {14, "the diner is across the street from the range"},
    {15, "the bar is a few doors down"},
    {16, "the dunes lie north of the course"},
    {17, "the lodge is steps from the tee"},
    {18, "the halfway house is around the corner"},
    {19, "the caddie shack is down the road"},
    {20, "the inn is within walking distance"}
  ]

  test "every banned pattern fires on its own specimen" do
    assert length(@specimens) == length(@patterns),
           "one specimen per pattern, in order — #{length(@specimens)} specimens " <>
             "for #{length(@patterns)} patterns"

    for {index, text} <- @specimens do
      pattern = Enum.at(@patterns, index - 1)

      assert Regex.match?(pattern, text),
             "pattern #{index} (#{inspect(pattern)}) no longer fires on its specimen " <>
               "#{inspect(text)} — it has been weakened"
    end
  end

  # Assert the PUBLISHABLE form too. A gate that bans the checkable form
  # alongside the vague one pushes authors toward vagueness, which is the
  # opposite of the rule, and nothing else would notice (§8).
  @publishable [
    "about one-half mile west on US-101",
    "the resort is 25 miles north of Coos Bay on US-101",
    "the lodge sits on Round Lake Drive, north of Highway 101",
    "open 24 hours",
    "the kitchen serves until 9 p.m.",
    "Bandon, Oregon, in Coos County"
  ]

  test "sourced, checkable spatial and time claims still publish" do
    for text <- @publishable do
      assert banned_phrases(text) == [],
             "a publishable claim was caught: #{inspect(text)} matched " <>
               inspect(banned_phrases(text))
    end
  end

  # --- Corpus assertions ---------------------------------------------------

  test "no golf file publishes a trip duration or a vague proximity" do
    found = violations()

    assert found == [],
           "banned phrasing in the golf corpus (name the road, the direction and " <>
             "the mileage instead of how long the trip takes, and make every spatial " <>
             "claim checkable): " <> inspect(found)
  end

  test "every golf guide carries the required sections, with the exact heading" do
    for f <- files() do
      data = DataGuide.load!(f)
      headings = Enum.map(data["guide"]["sections"] || [], & &1["heading"])
      base = Path.basename(f)

      assert length(headings) >= 3,
             "#{base}: three sections minimum — Getting there, around the course, " <>
               "the course itself. Found: #{inspect(headings)}"

      assert "Getting there" in headings,
             "#{base}: the heading is exactly \"Getting there\" — lowercase t, no " <>
               "trailing mode. Found: #{inspect(headings)}"
    end
  end

  # The one fact the whole product rests on. A page that tells someone they can
  # play a course they cannot is worse than a wrong date, because it is acted
  # on. A required element going missing belongs in a test, not to a reviewer.
  test "every golf guide states whether and how the course can be played" do
    for f <- files() do
      data = DataGuide.load!(f)
      questions = Enum.map(data["guide"]["faq"] || [], & &1["question"])
      base = Path.basename(f)

      assert Enum.any?(questions, &(&1 =~ ~r/\b(play|tee time|tee times|book)\b/i)),
             "#{base}: no FAQ answers how a visitor plays this course. " <>
               "Found: #{inspect(questions)}"
    end
  end

  test "each guide anchors on exactly one ranked course and at most one other" do
    for f <- files() do
      data = DataGuide.load!(f)
      courses = Enum.filter(data["places"], &(&1["kind"] == "golf-course"))
      base = Path.basename(f)

      assert length(courses) >= 1,
             "#{base}: no golf-course place — the guide has no anchor"

      assert length(courses) <= 2,
             "#{base}: #{length(courses)} golf-course places. The ranked course and " <>
               "at most one second course; a third belongs in its own state's file " <>
               "or as a see-also link: " <> inspect(Enum.map(courses, & &1["slug"]))
    end
  end

  test "every entry resolves to a place defined in its own file" do
    for f <- files() do
      data = DataGuide.load!(f)
      slugs = MapSet.new(data["places"], & &1["slug"])

      orphans =
        for e <- data["entries"], not MapSet.member?(slugs, e["place_slug"]), do: e["place_slug"]

      assert orphans == [],
             "#{Path.basename(f)}: entries pointing at places this file does not " <>
               "define — GuideRunner raises on these at seed time: " <> inspect(orphans)
    end
  end

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every golf photo is freely licensed, attributed, and on disk" do
    static_root = Path.expand("../../../priv", __DIR__)

    for f <- files(), p <- all_photos(DataGuide.load!(f)) do
      base = Path.basename(f)

      assert allowed_license?(p["license"]),
             "#{base}: bad license #{inspect(p["license"])}"

      assert is_binary(p["author"]) and p["author"] != "",
             "#{base}: photo #{inspect(p["src"])} has no author"

      assert String.starts_with?(p["src"], "/photos/us/golf/"),
             "#{base}: photo src outside /photos/us/golf/: #{inspect(p["src"])}"

      assert File.exists?(Path.join(static_root, p["src"])),
             "missing #{p["src"]} — run mix ethos.optimize_golf_photos"

      assert File.exists?(Path.join(static_root, p["thumb"])), "missing #{p["thumb"]}"
    end
  end

  test "the golf corpus loads twice, and its slugs collide with nothing" do
    files = files()

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    user = user_fixture()

    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    seeded =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&String.ends_with?(&1.slug, "-golf-guide"))

    assert length(seeded) == length(files)
  end
end
```

- [ ] **Step 2: Run it against the empty directory**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs
```

Expected: **all tests pass.** The specimen and publishable-form tests are doing real work with no content in the repo; the corpus tests iterate over an empty list. That is the point of the specimens.

- [ ] **Step 3: Prove the gate actually bites**

Temporarily create `priv/seed_data/golf/probe.json` with a banned phrase, run the gate, confirm it fails, then delete the probe. A gate nobody has watched fail is a gate nobody knows works:

```bash
mkdir -p priv/seed_data/golf
cat > priv/seed_data/golf/probe.json <<'JSON'
{
  "guide": {
    "slug": "probe-golf-guide",
    "title": "Probe",
    "destination": "Probe, Oregon",
    "state": "Oregon",
    "county": "Coos County",
    "intro": "The lodge is a short drive from the clubhouse.",
    "sections": [],
    "faq": [],
    "photos": []
  },
  "places": [],
  "entries": []
}
JSON
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs
```

Expected: FAIL on at least three assertions — the banned phrase (`"short drive"`), the missing sections, and the missing play/tee-time FAQ. Read each message and confirm it names `probe.json`.

```bash
rm priv/seed_data/golf/probe.json
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs
```

Expected: green again.

- [ ] **Step 4: Full suite, format, commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add test/ethos/seeds/golf_seed_data_test.exs
git commit -m "test: the golf gate, before the golf content

Written at §1 step 4 so the checkpoint is the first thing it checks.
Twenty patterns, each pinned by an indexed specimen so none can be
weakened silently, plus the publishable-form assertions that stop the
gate pushing authors toward vagueness.

Durations copied verbatim from destination_seed_data_test.exs, the copy
that can prove it has not been weakened. Proximity ported from the
ballpark gate with pattern 5's noun list re-pointed at golf. Allowlist
starts empty and is empty.

Watched fail on a probe file before landing."
```

---

## Task 4: Wiring, the photo task, and the §10 amendment

§1 step 1 says the pattern document is amended **first**, for anything the set changes. Everything in this task is mechanical and none of it depends on research, so it lands before Task 5 and the checkpoint runs against a fully wired pipeline.

**Files:**
- Modify: `lib/ethos/release.ex`
- Create: `lib/mix/tasks/ethos.optimize_golf_photos.ex`
- Create: `priv/seed_data/golf_photo_manifest.json`
- Modify: `docs/runbooks/seeding.md`
- Modify: `docs/site-builder.md`

**Interfaces:**
- Consumes: `Ethos.Release.seed_directory/2` (private, already exists — see `seed_brooklyn/1` at `lib/ethos/release.ex:65` for the exact form).
- Produces: `Ethos.Release.seed_golf(email)` seeds `priv/seed_data/golf/*.json`, places before guides. `mix ethos.optimize_golf_photos` reads `priv/seed_data/golf/*.json`, sources originals from `images/golf/{label}.{ext}`, verifies provenance against `priv/seed_data/golf_photo_manifest.json`, and writes to `priv/photos/us/golf/{state-slug}/`.

- [ ] **Step 1: Add the release function**

`lib/ethos/release.ex`, beside the other one-line directory seeders (after `seed_queens/1`):

```elixir
  def seed_golf(email), do: seed_directory("golf", email)
```

- [ ] **Step 2: Create the empty photo manifest**

```bash
mkdir -p priv/seed_data/golf priv/photos/us/golf images/golf
touch priv/seed_data/golf/.gitkeep
echo '{}' > priv/seed_data/golf_photo_manifest.json
```

The `.gitkeep` follows the house convention — `priv/seed_data/bronx/`, `queens/`, `rome/`, `san_francisco/` and `london/` each held only a `.gitkeep` while their gate was landed ahead of their corpus. Delete it in Task 6 when `oregon.json` lands.

Note: `images/` is git-ignored (originals are not committed; the optimized derivatives under `priv/photos/` are). Confirm with `git check-ignore -v images/golf` before assuming.

- [ ] **Step 3: Write the photo task**

Create `lib/mix/tasks/ethos.optimize_golf_photos.ex`. Modelled on `ethos.optimize_sf_photos.ex` rather than the London one, because the governing law is US:

```elixir
defmodule Mix.Tasks.Ethos.OptimizeGolfPhotos do
  @shortdoc "Optimizes golf photos from images/golf/ into priv/photos/us/golf/"
  @moduledoc """
  Scans `priv/seed_data/golf/*.json` for photo srcs and optimizes
  `images/golf/{label}.*` accordingly, into `priv/photos/us/golf/{state}/`.

  ## The path segment is the set, not the city

  San Francisco writes to `priv/photos/us/ca/san-francisco/{zone}/` — country,
  state, city. Golf writes to `priv/photos/us/golf/{state-slug}/` instead,
  because the set is national and its unit is the state rather than a city:
  fifty basecamps across fifty states would otherwise scatter the corpus into
  fifty single-file city directories that nothing else ever reads. The
  optimizer trusts this segment literally, and the seed-data gate asserts every
  golf photo src starts `/photos/us/golf/`, so a typo lands nowhere silently.

  ## What this refuses

  17 USC 120(a) permits pictorial representation of an **architectural work**
  ordinarily visible from a public place. It covers buildings — a clubhouse, a
  lodge, a hotel — and it does **not** cover sculptures, murals or other public
  artworks, which keep their own copyright. That is the same rule
  `ethos.optimize_sf_photos` enforces, and the exclusion list below is the same
  shape.

  A golf course itself is landscape, not an architectural work, and needs no
  exemption: a photograph of a fairway, a dune or a green is a photograph of
  land. What needs care is a course's commissioned sculpture or a clubhouse
  mural, which is why the list exists at all.

  `Ethos.Seeds.GolfSeedDataTest` holds the licence and on-disk assertions; this
  is a second copy of the subject rule at the last point before pixels land in
  `priv/`. The duplication is deliberate — a reviewer changing one is meant to
  notice the other.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/golf_photo_manifest.json"

  # Keep in sync with the licence rule in the seed-data gate.
  @excluded_subjects [
    {"sculpture",
     "a sculpture keeps its own copyright — 17 USC 120(a) reaches architectural works only"},
    {"mural", "a mural is a pictorial work, not an architectural one"},
    {"statue", "a statue keeps its own copyright, whatever it stands next to"},
    {"memorial",
     "a memorial is commonly a sculptural work rather than a building; photograph the " <>
       "clubhouse or the landscape instead"}
  ]

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/golf/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/golf/*.json — run this from the project root"
      )
    end

    srcs = files |> Enum.flat_map(&photo_srcs/1) |> Enum.uniq()

    Enum.each(srcs, &optimize_src/1)
    Mix.shell().info("optimized #{length(srcs)} photos from #{length(files)} seed files")
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "us", "golf", state, file] ->
        label = Path.rootname(file)
        refute_excluded_subject!(label)
        out_dir = Path.join(["priv", "photos", "us", "golf", state])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/us/golf/{state-slug}/{label}.jpg)"
        )
    end
  end

  defp refute_excluded_subject!(label) do
    downcased = String.downcase(label)

    case Enum.find(@excluded_subjects, fn {needle, _} -> String.contains?(downcased, needle) end) do
      nil ->
        :ok

      {needle, why} ->
        Mix.raise("""
        refusing to optimize #{label}: it names #{needle} (#{why}).

        17 USC 120(a) covers architectural works ordinarily visible from a public place. \
        Photograph the clubhouse, the lodge or the landscape instead; do not work around \
        this by renaming the file.\
        """)
    end
  end

  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "golf", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/golf/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
```

- [ ] **Step 4: Verify the task compiles and refuses cleanly**

```bash
MIX_ENV=dev mix compile
mix ethos.optimize_golf_photos
```

Expected: `** (Mix) no seed files matched priv/seed_data/golf/*.json` — the empty-directory guard firing, which is correct at this point.

- [ ] **Step 5: Amend `docs/site-builder.md` §10**

Add a **Golf courses** subsection to §10, after the national-parks one, and refresh §3's stale citations while in the file. Six rules, each carrying its failure — that is the property §10's own header says makes a rule survive:

```markdown
**Golf courses: a third radius, and two facts no previous set handled.** Fifty
sites, one per US state, anchored on the top-ranked publicly accessible course
per a named ranking at a named edition — because "the best course in Nebraska"
is a judgment no verifier can adjudicate, and §4 rule 8 forbids shipping one.
Six things change:

- **The radius is the basecamp: wherever a visitor sleeps.** Not a walk, not a
  park boundary, and — this is what makes golf new — **not consistent across
  the set.** Three shapes recur: resort (lodging on the property), municipal or
  daily-fee inside a city (the surrounding neighbourhood, which the corpus may
  already publish), and remote (a gateway town on a named road). Each guide
  records which shape it is and why, as a national park's county choice is
  recorded.
- **A second course is an entry, not a guide.** The first set whose entries
  include another instance of the site type. It takes a `golf-course` place
  record and no guide — unless it is another state's ranked course, in which
  case it is a `see-also` link and no second record is minted. Some states have
  no second course worth naming; publish without one, as Kauffman Stadium
  published a single place and said so.
- **Airports are prose**, extending §8 past transit and parking. Golf is flown
  to, so *Getting there* carries more load here than it did for ballparks. A
  terminal is still not somewhere a visitor spends the day.
- **Tee-time access is an identity fact.** Resort-guest priority, municipal
  resident lotteries, advance-booking windows, and whether a course is publicly
  accessible at all. Verified, never assumed. **This is the worst failure the
  set can ship** — a page telling someone they can play a course they cannot is
  worse than a wrong date, because it is acted on. `golf_seed_data_test.exs`
  requires every guide to answer it.
- **Green fees are priced facts that go stale seasonally.** Publish only with
  the source's own dated qualifier, or omit and name the gap — the discipline
  that left Fenway's parking price unpublished and the Dodger Stadium Express
  headways out entirely.
- **The duration ban is at maximum strain.** "A thirty-minute drive from the
  airport" is the most natural sentence about a golf resort, and §12 records
  this corpus shipping "within a short drive" and "about ten minutes away" to
  production. State the road, the direction and the mileage.

Golf's places live in JSON, so it inherits the corpus-wide gates and writes only
the per-directory ones — the inverse of the ballpark set, and the reason the
choice went that way: a source-scanning gate cannot tell a defect from a
moduledoc recording one, and golf is the set most likely to reach for a drive
time.
```

Then fix §3's two citations: `Ethos.Guides.list_states/0` is at `lib/ethos/guides.ex:123`, and `list_counties_for_state/1` at `:133`. The stale `:88-96` now lands inside `list_guides_shadowed_by_state/1`, a function that did not exist when §3 was written — and trusting the citation instead of opening the file put a wrong claim into the first draft of the golf spec.

- [ ] **Step 6: Add the runbook step**

In `docs/runbooks/seeding.md`, add the golf step immediately before `seed_collections`, following the shape of step 8 (ballparks) at `docs/runbooks/seeding.md:60-76`. State the ordering constraint explicitly: places before guides inside the step (`seed_directory/2` already does this), and `seed_collections` after it, because `Ethos.Seeds.GolfCollection` names all fifty golf guides and running collections first raises `collection public-course-every-state references unknown guide <slug>`. Update the "Expected published counts" section with the golf count.

- [ ] **Step 7: Full suite, format, commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add lib/ethos/release.ex lib/mix/tasks/ethos.optimize_golf_photos.ex \
        priv/seed_data/golf_photo_manifest.json docs/
git commit -m "feat: wire the golf set, and amend the pattern document

One release function, one photo task, one runbook step. §10 gains the
golf amendment first, per §1 step 1 — the basecamp radius, a second
course as an entry, airports as prose, tee-time access as verified
identity, green fees only with a dated qualifier, and the duration ban
at maximum strain.

Photos go to priv/photos/us/golf/{state}/ rather than the country/state/
city shape: the set is national and its unit is the state, so the city
shape would scatter it into fifty single-file directories.

Also refreshes §3's citations for list_states/0 and
list_counties_for_state/1, which were stale by ~35 lines and produced a
wrong claim in the golf spec's first draft."
```

---

## Task 5: Pin the ranking (research Task 0)

Nothing downstream is safe until this returns. The criterion is *the highest-ranked publicly accessible course in state X per a named ranking at a named edition* — and whether such a ranking is fetchable, current, and fifty-state complete is itself a research question, not an assumption.

**Files:**
- Modify: `priv/seed_data/golf_courses_roster.json` (fills `ranking_source`, `ranking_edition`, `criterion` reasoning per row — but **not** `verified`, which needs the course's own geography confirmed)
- Create: `docs/golf/00-ranking.md`

**Interfaces:**
- Consumes: nothing.
- Produces: `docs/golf/00-ranking.md` — the named ranking, its edition, its access, its fifty-state coverage, and the fallback set. Every later wave dispatch cites this file.

- [ ] **Step 1: Dispatch the finder and the verifier**

**Two agents, and they must be two** (§4). Use the Workflow tool with two agents in sequence — a finder, then an independent verifier that re-fetches every cited page. Do not let one agent do both: an agent asked to check its own work confirms its own work, and the Brooklyn programme's 44-of-44 confirmation rate had to be thrown out entirely.

Finder prompt, in full:

> Identify published rankings of golf courses in the United States that are organised by state and restricted to, or clearly flag, **publicly accessible** courses (daily-fee, municipal, or resort courses a non-member can book). For each candidate ranking report: the publication, the exact edition or year, the URL, whether the full ranking is readable without a subscription or paywall, whether it covers all fifty states, and how it defines "publicly accessible". Cite a fetchable URL for every claim. Report `"searched": "complete" | "rate_limited" | "blocked"`. Do NOT write verdicts and do NOT rank the candidates — gather and cite only.

Verifier prompt, in full:

> You are an independent verifier. For each ranking the finder reported, **re-fetch the cited URL** and adjudicate each claim `confirmed`, `refuted` or `uncertain`. A claim is `confirmed` only if you found it in the page you fetched — not if you believe it is true. County-miscitation is the single most transferable finding of the previous set's run: the fact was true and the cited page did not contain it, in every wave. Pay specific attention to: whether the ranking is genuinely paywall-free, whether it truly covers all fifty states, and whether "public" in that publication's usage means bookable by a non-member. Supply a correction for anything refuted. Report `"searched"` as above.

- [ ] **Step 2: Decide, and record the decision**

Write `docs/golf/00-ranking.md` recording the chosen ranking, its edition, the confirmed verdicts it rests on, and — explicitly — **which states it does not cover**.

If no ranking is fetchable or the coverage is partial, the fallback stated in the spec applies: those states use *the publicly accessible course in that state with the strongest verifiable tournament record*. Record which rule decides each state. The roster's `criterion` field carries this per row, so a mixed set stays auditable.

- [ ] **Step 3: Commit the decision before any content**

```bash
git add docs/golf/00-ranking.md priv/seed_data/golf_courses_roster.json
git commit -m "docs: pin the ranking the golf set selects on

The criterion has to reduce to something a verifier can re-fetch, because
'the best course in Nebraska' is a judgment no verdict can settle. Records
the publication, the edition, its paywall status and its state coverage,
plus the fallback criterion for states it does not reach."
```

---

## Task 6: The checkpoint — Bandon Dunes, Oregon, then stop

§6, and the ordering constraint is the one most likely to be parallelised away by someone in a hurry. **One site end to end, then stop.** Everything the five waves are gated on is learned here, from one state.

Bandon strains every new rule at once: on-property basecamp, five courses on one property (exercising the second-course rule and the dedup ladder), roughly twenty-five miles from Coos Bay on US-101 (the duration ban's worst temptation), and an airport that must stay prose.

**Files:**
- Create: `priv/seed_data/golf/oregon.json`
- Create: `docs/golf/oregon.md`
- Modify: `priv/seed_data/golf_courses_roster.json` (the Oregon row)
- Modify: `docs/site-builder.md` §10 (amend with what the checkpoint taught)

**Interfaces:**
- Consumes: `docs/golf/00-ranking.md`, the gate from Task 3, the wiring from Task 4.
- Produces: `priv/seed_data/golf/oregon.json` — the canonical shape every wave file copies. Guide slug `oregon-golf-guide`, `destination: "Bandon, Oregon"`, `state: "Oregon"`, `county` as researched.

- [ ] **Step 1: Research, two agents**

Finder and independent verifier, prompts restating **the eight hard rules of §4 verbatim — do not paraphrase them**. The finder gathers and cites; the verifier re-fetches every cited page and adjudicates. Record `"searched"` for the site. Artifacts to the scratchpad; the committed audit trail is `docs/golf/oregon.md`.

What the research must establish, each as its own verdict: the ranked course's identity and full name; its city and **county** (researched, not derived — county miscitation recurred in every wave of the ballpark run); whether and how a non-member books a tee time; the on-property lodging and dining; the second course; the road access with numbers and directions; the airport served; and any green fee **only** if a source states it with its own dated qualifier.

- [ ] **Step 2: Author `priv/seed_data/golf/oregon.json`**

Copy the structural shape of `priv/seed_data/manhattan/alphabet-city.json` exactly: top-level `guide` (with `slug`, `title`, `destination`, `state`, `county`, `intro`, `sections`, `faq`, `photos`), `places`, `entries`, and optionally `links`.

Three sections minimum, the first headed exactly `Getting there`. Every clause traces to a `confirmed` verdict, or to the correction a `refuted` verdict supplied — used exactly as given. `uncertain` on identity does not publish; `uncertain` on trading status publishes with no trading claim.

- [ ] **Step 3: Run the gate**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs
```

Expected: green. If the duration or proximity gate fires, **fix the prose, do not add an allowlist entry.** §8: every allowlist candidate so far was either unsourced (delete it) or already excluded by a narrowed pattern. An entry needs a manual read and a stated reason in the wave report.

- [ ] **Step 4: Resolve the Oregon roster row and un-exclude the guards**

Fill the Oregon row from confirmed verdicts and set `verified: true`. Then run the two `:pending_golf`-tagged tests explicitly to confirm the attribution guard now has something to check:

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_courses_roster_test.exs --include pending_golf
```

Expected: the attribution test now PASSES (one resolved row, matching the seeded place). The exhaustion test still FAILS, naming the forty-nine unresolved states. That is correct.

- [ ] **Step 5: Write the audit trail**

`docs/golf/oregon.md`, modelled on `docs/ballparks/fenway-park.md`: every published sentence quoted against the verdict it rests on, and **every omission recorded with its reason**. This is what makes the content auditable a year from now, when the research workspace is gone — `.superpowers/` is git-ignored and the Brooklyn artifacts were lost exactly that way.

- [ ] **Step 6: Seed it and look at the page**

```bash
MIX_TEST_PARTITION=_golf mix test
mix ecto.reset && mix run -e 'Ethos.Seeds.DataGuide.upsert_places!("priv/seed_data/golf/oregon.json"); Ethos.Seeds.DataGuide.upsert_guide!("priv/seed_data/golf/oregon.json", "you@example.com")'
mix phx.server
```

Open `/g/oregon-golf-guide`, `/p/<the course slug>`, and `/destinations/oregon`. Confirm the course page renders `GolfCourse` structured data and the state hub exists.

- [ ] **Step 7: Review, and amend `docs/site-builder.md` §10 with what this taught**

**This is the step the checkpoint exists for.** Review the Oregon guide against §8 and the §10 amendment, list every defect by class, and write what changed back into §10. The ballpark checkpoint's four Critical defects were all unsourced spatial claims, and everything the later waves were gated on came from that one review.

- [ ] **Step 8: Commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add priv/seed_data/golf/oregon.json docs/golf/oregon.md \
        priv/seed_data/golf_courses_roster.json docs/site-builder.md
git commit -m "feat: Bandon Dunes, and what one site teaches

The checkpoint, per §6: one state end to end, then stop. On-property
basecamp, five courses on one property, US-101 mileage rather than a
drive time, and an airport that stays prose.

Amends §10 with what the review found. Everything the five waves are
gated on is learned here."
```

**STOP HERE.** Do not start Task 7 until the checkpoint review is done and §10 is amended. §6 exists because this is the step a hurried run skips.

---

## Tasks 7-11: The five waves

Ten states per wave, twenty research agents per wave (a finder and an independent verifier each). **Waves are sized to search budget, not to concurrency** — the ballpark run measured 6% blocked at 8 concurrent agents and **82% at 24**, and re-running at 8 restored nothing. Expect a wave to be parked and resumed.

Each wave is one task with the same six steps. The state groupings below are geographic, so a wave's basecamps and second courses cluster and the dedup ladder does real work within a batch rather than across the whole set.

| task | wave | states |
|---|---|---|
| 7 | 1 — Pacific & Mountain | Washington, California, Nevada, Arizona, Idaho, Montana, Wyoming, Colorado, Utah, Alaska |
| 8 | 2 — Plains & Upper Midwest | North Dakota, South Dakota, Nebraska, Kansas, Minnesota, Iowa, Missouri, Wisconsin, Michigan, Illinois |
| 9 | 3 — South Central & Gulf | Texas, Oklahoma, Arkansas, Louisiana, Mississippi, Alabama, Tennessee, Kentucky, New Mexico, Hawaii |
| 10 | 4 — Southeast & Mid-Atlantic | Florida, Georgia, South Carolina, North Carolina, Virginia, West Virginia, Maryland, Delaware, Ohio, Indiana |
| 11 | 5 — Northeast | New York, New Jersey, Pennsylvania, Connecticut, Rhode Island, Massachusetts, Vermont, New Hampshire, Maine |

Wave 5 carries nine states; Oregon was the checkpoint. 10+10+10+10+9+1 = 50.

**Files (per wave):**
- Create: `priv/seed_data/golf/{state-slug}.json` ×10
- Create: `docs/golf/{state-slug}.md` ×10
- Modify: `priv/seed_data/golf_courses_roster.json` (ten rows resolved)
- Modify: `priv/seed_data/golf_photo_manifest.json` (photo provenance)

**Interfaces:**
- Consumes: `docs/golf/00-ranking.md`, `priv/seed_data/golf/oregon.json` as the shape template, the §10 amendment as amended by the checkpoint.
- Produces: ten seed files in the canonical shape; ten resolved roster rows.

Repeat these steps for each of Tasks 7, 8, 9, 10 and 11, substituting the wave's state list:

- [ ] **Step 1: Dispatch ten finder/verifier pairs**

One pair per state. **Restate the eight hard rules of §4 verbatim in every dispatch** — do not paraphrase them, and do not summarise them as "follow the content rules". Cite `docs/golf/00-ranking.md` for the criterion and `docs/site-builder.md` §10 for what golf changes.

Each finder returns, per state: the ranked course's identity and official name; city and **county** (researched — county miscitation recurred in every single wave of the ballpark run, always with a true fact and a citation to a page that does not contain it); tee-time access; the basecamp and its lodging, dining and sights; the second public course if there is one; road access with numbers, directions and mileage; the airport; and `"searched": "complete" | "rate_limited" | "blocked"`.

Each verifier **re-fetches every cited page** and adjudicates `confirmed` / `refuted` / `uncertain`, supplying a correction for anything refuted. Budget for the re-fetch; it is most of the verifier's cost, and it is the only thing that catches a true fact with a fabricated citation.

- [ ] **Step 2: Triage on verdicts, not on the flag**

§5, and getting this backwards costs a wave. **A state with at least one confirmed verdict is authored, whatever its `searched` value says.** Only a state with **no confirmed verdict AND an incomplete search** is re-queued. In the ballpark run, 60 of 73 places were flagged rate-limited or blocked and 64 of 73 still carried a confirmed verdict — the flag and the yield are almost decoupled, and the literal reading would have re-queued 60 places holding 226 confirmed facts, forever.

Re-queued states **extend** their existing artifact rather than starting over.

- [ ] **Step 3: Author ten seed files**

Copy the structure of `priv/seed_data/golf/oregon.json`. Three sections minimum, first headed exactly `Getting there`.

**Expect the yield to vary wildly.** The ballpark run ranged from 1 to 21 places per site. A state whose ranked course sits alone on a highway publishes a short guide and says so; it is not a failure and must not be padded. §4 rule 2: there is no minimum word count anywhere, and none may be added.

- [ ] **Step 4: Run the gate after every file, not at the end**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_seed_data_test.exs
```

Fix prose rather than widening the allowlist. If a state genuinely needs an allowlist entry, it needs a manual read and a stated reason recorded in this wave's commit message.

- [ ] **Step 5: Photos**

Source 1-3 Wikimedia Commons images per state (PD / CC0 / CC BY / CC BY-SA only), record provenance in `priv/seed_data/golf_photo_manifest.json`, drop the originals into `images/golf/`, and run:

```bash
mix ethos.optimize_golf_photos
```

**A state with no freely licensed photo ships none.** Commons is thinner on golf than on cities, and padding with a wrong-licence image is the one outcome the licence gate exists to prevent.

- [ ] **Step 6: Resolve ten roster rows, run everything, commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_courses_roster_test.exs --include pending_golf
```

Expected: the full suite green; the attribution test green; the exhaustion test still failing with a shrinking list of unresolved states. Record in the commit message: how many states came back `complete` vs `rate_limited` vs `blocked`, how many were re-queued, and any allowlist entry with its reason.

```bash
git add priv/seed_data/golf/ docs/golf/ priv/seed_data/golf_courses_roster.json \
        priv/seed_data/golf_photo_manifest.json priv/photos/us/golf/
git commit -m "feat: golf wave N — <states>

<counts: places, guides, searched breakdown, re-queued>"
```

---

## Task 12: The collection, gated in both directions

A collection missing one guide is silent in both directions: the page is simply short, and the dropped guide simply stops rendering its *"Part of"* line. Nothing raises and no count disagrees. Across a set of fifty that is fifty chances to make the omission.

**Files:**
- Create: `lib/ethos/seeds/golf_collection.ex`
- Create: `test/ethos/seeds/golf_collection_test.exs`
- Modify: `lib/ethos/release.ex` (`seed_collections/0`)

**Interfaces:**
- Consumes: all fifty files in `priv/seed_data/golf/`.
- Produces: `Ethos.Seeds.GolfCollection.data/0` returning `%{slug: "public-course-every-state", title: "A Public Course in Every State", published: true, intro: binary, items: [%{guide_slug: binary, blurb: binary}]}` with fifty items; `Ethos.Seeds.GolfCollection.upsert!/0` seeding it.

- [ ] **Step 1: Write the collection module**

Create `lib/ethos/seeds/golf_collection.ex`, modelled on `lib/ethos/seeds/mlb_ballparks_collection.ex`. Note the `data/0` split — `upsert!/0` delegates to it so the membership gate can compare lists **without seeding fifty guides and 300 places first**:

```elixir
defmodule Ethos.Seeds.GolfCollection do
  @moduledoc """
  Seeds the "A Public Course in Every State" collection. Idempotent by slug.

  All fifty state guides are items. That membership is the whole mechanism
  behind the *"Part of A Public Course in Every State"* line each guide carries
  under its title: `guide_html/show.html.heex:7-9` renders one line per
  published collection a guide belongs to. No template change was needed and
  none was made.

  ## The blurbs are content, and the content rules bind them

  Each blurb restates something the guide it points at already publishes, so it
  inherits that guide's verdict trace. Nothing here is new writing. No trip
  durations and no vague proximity — `burys_collection.ex` is one of the two
  files that shipped banned drive-time phrasing to production, and it is a
  collection module exactly like this one.

  Some states have less to say than others. Publish the plainer blurb rather
  than padding it.
  """
  alias Ethos.Collections

  def upsert!, do: Collections.upsert_collection!(data())

  def data do
    %{
      slug: "public-course-every-state",
      title: "A Public Course in Every State",
      published: true,
      intro: """
      Fifty states, fifty courses you can actually book, one guide each. Every
      guide takes the course first — who built it, what it has hosted, and how
      a visitor gets on it — and then the weekend around it: where to stay,
      where to eat, and a second course for the second day. Where no basecamp
      could be established from a source, the guide says so instead of
      inventing one. Start with your own state, or the one you have been
      meaning to drive to.
      """,
      items: [
        # One entry per state, in the order the collection page should read.
        # %{guide_slug: "oregon-golf-guide", blurb: "..."},
      ]
    }
  end
end
```

Fill `items` with all fifty, each blurb drawn only from what its guide publishes.

- [ ] **Step 2: Write the failing membership gate**

Create `test/ethos/seeds/golf_collection_test.exs`:

```elixir
defmodule Ethos.Seeds.GolfCollectionTest do
  @moduledoc """
  The membership gate for the golf collection.

  A collection missing one guide renders as a page of forty-nine, and the guide
  it dropped simply stops showing *"Part of A Public Course in Every State"*
  under its title. Both are silent: no raise, no warning, no count anywhere
  that disagrees.

  So the assertion is set equality and it fails in **both** directions. A count
  alone passes on a collection listing forty-nine golf guides and one
  Connecticut town, and "expected 50, got 49" sends the reader to count rows
  rather than to the guide that is missing.

  The ballpark copy compares against `Ethos.Seeds.Catalog.guide_modules/1`.
  Golf's guides are JSON, so the corpus side is the directory listing — which
  is strictly better, because it is derived from the files that actually seed
  rather than from a hand-maintained list.
  """
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.{DataGuide, GolfCollection}

  defp corpus_guide_slugs do
    for f <- SeedDataHelpers.seed_files("golf"), do: DataGuide.load!(f)["guide"]["slug"]
  end

  defp item_guide_slugs, do: Enum.map(GolfCollection.data().items, & &1.guide_slug)

  test "every golf guide is an item, and every item is a golf guide" do
    corpus = corpus_guide_slugs()
    items = item_guide_slugs()

    # Non-vacuous. Both lists are derived, and two empty lists are equal.
    assert length(corpus) == 50,
           "expected fifty golf guides in priv/seed_data/golf/, found #{length(corpus)}"

    assert length(items) == length(Enum.uniq(items)),
           "a guide is listed twice in the collection: " <> inspect(items -- Enum.uniq(items))

    missing = corpus -- items
    unexpected = items -- corpus

    assert missing == [],
           "golf guides that seed but are absent from the collection, so their pages " <>
             "show no \"Part of\" line: " <> inspect(missing)

    assert unexpected == [],
           "the collection lists guides the golf directory does not seed, so " <>
             "Collections.upsert_collection!/1 will raise at seed time: " <> inspect(unexpected)
  end

  test "every blurb is free of banned phrasing" do
    offenders =
      for item <- GolfCollection.data().items,
          phrase <- Ethos.Seeds.GolfSeedDataTest.banned_phrases(item.blurb),
          do: {item.guide_slug, phrase}

    assert offenders == [],
           "collection blurbs are prose in an Elixir module, which the JSON gate does " <>
             "not see — this is exactly how burys_collection.ex shipped \"within a short " <>
             "drive\" to production: " <> inspect(offenders)
  end

  test "the intro is free of banned phrasing" do
    assert Ethos.Seeds.GolfSeedDataTest.banned_phrases(GolfCollection.data().intro) == []
  end
end
```

- [ ] **Step 3: Run it, watch it fail, then fill the items**

```bash
MIX_TEST_PARTITION=_golf mix test test/ethos/seeds/golf_collection_test.exs
```

Expected first run: FAIL naming all fifty slugs as `missing`. Fill `items` until green.

- [ ] **Step 4: Register the collection**

`lib/ethos/release.ex`, in `seed_collections/0`, append to the list:

```elixir
    collections = [
      Ethos.Seeds.BurysCollection,
      Ethos.Seeds.AntiqueTrailCollection,
      Ethos.Seeds.MlbBallparksCollection,
      Ethos.Seeds.GolfCollection
    ]
```

Update the comment above it: `seed_collections/0` is now unsatisfiable without `seed_golf/1` having run, for the same reason it became unsatisfiable without `seed_ballparks/1`.

- [ ] **Step 5: Full suite, format, commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add lib/ethos/seeds/golf_collection.ex test/ethos/seeds/golf_collection_test.exs lib/ethos/release.ex
git commit -m "feat: A Public Course in Every State

Fifty items, gated on set equality in both directions — a collection
missing one guide is silent both ways, and fifty members is fifty chances
to make the omission.

The blurb gate is not decoration: blurbs are prose in an Elixir module,
which the JSON gate does not see, and burys_collection.ex is one of the
two files that shipped banned drive-time phrasing to production."
```

---

## Task 13: Close out — exhaustion, and what the run actually cost

§2: exhaustion is a mechanical check, not a feeling. §12: the close-out numbers are the ones the next set plans against, and they must be the honest ones, not the encouraging ones.

**Files:**
- Modify: `test/test_helper.exs` (drop the `:pending_golf` exclusion)
- Modify: `docs/site-builder.md` (a §14 close-out)
- Modify: `docs/runbooks/seeding.md` (final published counts)

**Interfaces:**
- Consumes: everything.
- Produces: a green suite with no excluded golf tags.

- [ ] **Step 1: Un-exclude `:pending_golf`**

Edit the single `ExUnit.configure/1` call in `test/test_helper.exs` **in place**, removing `:pending_golf` from the list. Never add a second call — a second `exclude:` replaces the list rather than appending, which would silently re-enable `:pending_wave` and the Bronx gate.

Then replace this tag's explanatory comment with a closing note, exactly as `:pending_queens`, `:pending_rome`, `:pending_san_francisco` and `:pending_london` each got one:

```
# :pending_golf removed 2026-<MM-DD> by wave 5, which resolved the last nine
# state rows and brought the set to all fifty. Both `@tag :pending_golf` lines
# came off with it — roster attribution and roster exhaustion — so the tag now
# names nothing and excluding it would only hide a future typo. The single-call
# rule above still binds: this list is edited in place, never by adding a second
# ExUnit.configure/1.
```

- [ ] **Step 2: Run everything**

```bash
mix format --check-formatted
MIX_TEST_PARTITION=_golf mix test
```

Expected: green, including both previously-excluded roster tests. If exhaustion fails, it names the unresolved states — finish them; do not re-add the tag.

- [ ] **Step 3: Seed a clean database end to end and verify the ordering**

```bash
MIX_ENV=dev mix ecto.reset
mix run -e 'Ethos.Release.seed_golf("you@example.com"); Ethos.Release.seed_collections()'
```

Then deliberately prove the ordering constraint is real, because the runbook now asserts it:

```bash
MIX_ENV=dev mix ecto.reset
mix run -e 'Ethos.Release.seed_collections()'
```

Expected: raises `collection public-course-every-state references unknown guide <slug>`. That is the constraint the runbook step documents.

- [ ] **Step 4: Write the §14 close-out**

Add to `docs/site-builder.md`, following §12's shape. Record the honest numbers: sites, places, guides, audit files, the collection, suite growth, the **spread** of places per state (min and max), how many states came back `complete` vs `rate_limited` vs `blocked` per wave, how many were re-queued, every defect class the verifiers caught, every allowlist entry with its reason, and **anything the corpus could not publish and why** — as §12 records the two Dodger Stadium Express headways dropped rather than published, and Mill Street Pier named in prose because its address could not be established.

Also record what golf taught that the next set needs: whether the basecamp radius held, whether the second-course rule earned itself, and whether the deferred §11 question (a place that owns entries) looks different after fifty resort-shaped sites than it did after thirty ballparks.

- [ ] **Step 5: Final commit**

```bash
mix format
MIX_TEST_PARTITION=_golf mix test
git add test/test_helper.exs docs/
git commit -m "docs: close out the golf set

Fifty states resolved, exhaustion un-excluded and green. §14 records what
the run cost and what it found — the honest numbers, including the spread
of places per state and everything the corpus could not publish."
```

---

## Self-Review

**Spec coverage.** Every section of `2026-09-05-golf-courses-design.md` maps to a task: authoring surface → Task 4 wiring + all wave tasks; place kind → Task 1; basecamp radius and second course → §10 amendment in Task 4, enforced by Task 3's gate; tee-time access and green fees → Task 3's FAQ assertion and the §10 amendment; roster → Task 2; Task 0 ranking → Task 5; checkpoint → Task 6; waves → Tasks 7-11; photos → Task 4 (task) and wave step 5; collection → Task 12; link graph → wave step 3 (the `links` array, validated by Task 3's two-pass load); dedup by address → §4 rules restated in every wave dispatch; success criteria → Task 13.

**Two spec items deliberately carried as constraints rather than tasks**, because they are rules an author obeys rather than code anyone writes: "no minimum word count" and "expect a 1-to-21 spread". Both appear in Global Constraints and in wave step 3.

**Known ordering risk.** Task 3's gate references `Ethos.Guides.Guide.derive_destination_slug/1` from Task 2's roster test. That function already exists on `main` (`lib/ethos/guides/guide.ex`), so there is no forward dependency — verify with `grep -n "def derive_destination_slug" lib/ethos/guides/guide.ex` before starting Task 2.

**One house rule the plan nearly broke.** An earlier draft told the engineer to add a second `ExUnit.configure(exclude: ...)` call to `test/test_helper.exs`. That file warns three separate times that a second call **replaces** the exclusion list rather than appending — it would have silently re-enabled `:pending_wave` and the Bronx gate and turned the suite red on defects this programme does not own. Task 2 Step 3 now edits the single call in place, and uses the house `:pending_<set>` tag name.

**Known cross-task coupling.** Task 12's collection gate calls `Ethos.Seeds.GolfSeedDataTest.banned_phrases/1`, a public function on a test module. Test modules are compiled in the test environment and are reachable from other test files, and this is deliberate: one definition of "banned", used by both the JSON gate and the Elixir-prose gate, is the whole point — two copies is how one drifts weaker. If the compiler objects to the cross-module call, extract `banned_phrases/1` and the pattern lists into `test/support/golf_prose.ex` and have both call it, rather than duplicating the patterns.
