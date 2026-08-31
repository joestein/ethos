# Queens Scaffolding Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the roster, gate, seeder and runbook that a later Queens research programme will run against — and commission no research.

**Architecture:** Three independent tasks. Task 1 writes the neighborhood roster and its test. Task 2 creates the empty seed directory and photo manifest, ports the Bronx per-directory gate to Queens, and registers a third `:pending_*` tag. Task 3 adds `Ethos.Release.seed_queens/1`, its release test, and the runbook entries. Nothing here writes neighborhood content; `priv/seed_data/queens/` ends this plan holding only `.gitkeep`.

**Tech Stack:** Elixir, Phoenix 1.7.14, Ecto/Postgres, ExUnit, Jason.

**Spec:** `docs/superpowers/specs/2026-08-31-queens-neighborhoods-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** This is absolute and predates this plan.
- **Work only in the worktree** `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to the original repo root.
- **Never use bare `git stash`.** The stash stack is shared with other sessions. Use a WIP commit instead.
- **Do not push and do not deploy.** Both are outward-facing and need the owner's explicit say-so. Commit locally only.
- **Borough-as-county:** `county: "Queens"`, never `"Queens County"`. The legal name would derive `queens-county` and split the borough hub away from Brooklyn, Manhattan and the Bronx.
- **`ExUnit.configure(exclude:)` replaces the list rather than appending.** There is exactly ONE `ExUnit.configure` call in `test/test_helper.exs` and it must stay that way.
- **This plan commissions no research.** No neighborhood prose, no place records, no seed JSON beyond `.gitkeep` and an empty photo manifest.
- **Run the full suite before every commit:** `mix test`. Expected baseline is 554 tests, 0 failures, 4 excluded. Formatting: `mix format --check-formatted`.
- One pre-existing Gettext warning is tolerated. Any *new* compiler warning is a defect.

---

## File Structure

| File | Responsibility | Task |
|---|---|---|
| `priv/seed_data/queens_roster.json` | The ~100 neighborhoods, each with community district and wave. The dispatch backbone for later research. | 1 |
| `test/ethos/seeds/queens_roster_test.exs` | Structural and attribution assertions on the roster. Runs immediately. | 1 |
| `priv/seed_data/queens/.gitkeep` | Makes the seed directory exist so `seed_files("queens")` and `seed_queens/1` resolve. | 2 |
| `priv/seed_data/queens_photo_manifest.json` | Empty manifest so the gate's provenance test has a target. | 2 |
| `test/ethos/seeds/queens_seed_data_test.exs` | The per-directory gate. Ships whole-module excluded. | 2 |
| `test/support/fixtures/seed_data/queens_fixtures/*.json` | Negative fixtures proving each gate rule is load-bearing. | 2 |
| `test/test_helper.exs` | Adds `:pending_queens` to the single existing `ExUnit.configure` call. | 2 |
| `lib/ethos/release.ex` | Adds `seed_queens/1`. | 3 |
| `test/ethos/release_test.exs` | Adds the `seed_queens/1` release test. | 3 |
| `docs/runbooks/seeding.md` | Adds the Queens entry and the missing Bronx entry. | 3 |

---

### Task 1: The Queens roster

**Files:**
- Create: `priv/seed_data/queens_roster.json`
- Create: `test/ethos/seeds/queens_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `priv/seed_data/queens_roster.json` with top-level keys `borough` (string, `"Queens"`), `source` (non-empty string), `neighborhoods` (list). Each neighborhood is a map with exactly four keys — `slug`, `name`, `community_district`, `wave` — and no `tier` key. Task 2's gate reads this file at `@roster_path` and derives expected slugs from `neighborhoods[].slug`.

**Context:** Queens has exactly **14 community districts**, numbered 1–14. The NYC DCP Neighborhood Tabulation Areas and the commonly-used neighborhood list disagree at the edges; reconciling them is this task's real work. Model this file on `priv/seed_data/bronx_roster.json` and `priv/seed_data/brooklyn_roster.json`, which are the same shape.

**On sourcing:** Use WebSearch if it is available to confirm community-district assignments. If search is rate-limited or exhausted — which is the current normal — work from documented knowledge and say so plainly in the `source` field. **Do not invent a source you did not use.** In the task report, list every neighborhood whose community district you were not confident about, so a later wave can re-check rather than inherit a silent error.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/seeds/queens_roster_test.exs`:

```elixir
defmodule Ethos.Seeds.QueensRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/queens_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  # Queens has exactly 14 community districts, numbered 1..14. This is the one
  # structural fact about the borough a gate can check, and the Bronx roster
  # test has no equivalent because it was written generically.
  @community_districts 1..14

  test "the roster names a borough and its source" do
    assert @roster["borough"] == "Queens"
    assert is_binary(@roster["source"]) and @roster["source"] != ""
  end

  test "every neighborhood carries the four dispatch keys, and no others" do
    for n <- @roster["neighborhoods"] do
      assert Enum.sort(Map.keys(n)) == ~w(community_district name slug wave)

      assert is_binary(n["slug"]) and n["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_binary(n["name"]) and n["name"] != ""
      assert is_integer(n["community_district"]) and n["community_district"] > 0
      assert is_integer(n["wave"]) and n["wave"] > 0
    end
  end

  test "slugs and names are unique" do
    slugs = Enum.map(@roster["neighborhoods"], & &1["slug"])
    names = Enum.map(@roster["neighborhoods"], & &1["name"])

    assert slugs == Enum.uniq(slugs), "duplicate slugs"
    assert names == Enum.uniq(names), "duplicate names"
  end

  # The attribution lesson from bare_places_roster_test: assert the fields a
  # wave DISPATCHES on, not only that entries exist. A mutation test there
  # proved a repointed field passed every assertion that checked membership.
  test "no neighborhood carries a tier — the tier is an outcome of research" do
    for n <- @roster["neighborhoods"] do
      refute Map.has_key?(n, "tier"), "#{n["slug"]} carries a tier in the roster"
    end
  end

  test "waves are contiguous from 1 and none is empty" do
    waves = @roster["neighborhoods"] |> Enum.map(& &1["wave"]) |> Enum.uniq() |> Enum.sort()
    assert waves == Enum.to_list(1..length(waves)), "waves are not 1..n: #{inspect(waves)}"
  end

  # Two directions, because each catches a different error. Out-of-range
  # catches a typo or a Bronx/Brooklyn district number pasted across; missing
  # districts catch a roster that dropped a whole swathe of the borough —
  # which is invisible to every assertion above, since a roster of 40
  # neighborhoods covering 9 districts satisfies all of them.
  test "every community district is in 1..14" do
    out_of_range =
      for n <- @roster["neighborhoods"],
          n["community_district"] not in @community_districts,
          do: {n["slug"], n["community_district"]}

    assert out_of_range == [],
           "Queens has 14 community districts; these are outside 1..14: #{inspect(out_of_range)}"
  end

  test "all 14 community districts are represented" do
    present = @roster["neighborhoods"] |> Enum.map(& &1["community_district"]) |> MapSet.new()
    missing = @community_districts |> Enum.reject(&MapSet.member?(present, &1))

    assert missing == [],
           "no neighborhood in community districts #{inspect(missing)} — a whole swathe of " <>
             "the borough is missing from the roster"
  end

  test "the roster is not trivially small" do
    assert length(@roster["neighborhoods"]) >= 80,
           "Queens runs to roughly 100 neighborhoods; a roster this short is a partial " <>
             "enumeration, not the borough"
  end
end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/seeds/queens_roster_test.exs`

Expected: FAIL at compile time — `File.read!("priv/seed_data/queens_roster.json")` raises `File.Error, no such file or directory`. The module attribute is evaluated at compile time, so this is a compilation error, not a test failure. That is the expected first failure.

- [ ] **Step 3: Write the roster**

Create `priv/seed_data/queens_roster.json`. Shape, with real data in place of the ellipsis:

```json
{
  "borough": "Queens",
  "source": "NYC Department of City Planning Neighborhood Tabulation Areas, cross-checked against Community District profiles",
  "neighborhoods": [
    {"slug": "astoria", "name": "Astoria", "community_district": 1, "wave": 1},
    {"slug": "long-island-city", "name": "Long Island City", "community_district": 1, "wave": 1},
    {"slug": "ditmars-steinway", "name": "Ditmars–Steinway", "community_district": 1, "wave": 1}
  ]
}
```

Rules for the data:

- **Slugs are lowercase, digits and hyphens only** (`^[a-z0-9-]+$`). Transliterate en-dashes and apostrophes out of the slug but keep them in `name` — `{"slug": "ditmars-steinway", "name": "Ditmars–Steinway"}`.
- **No `tier` key on any entry.** The tier is decided after research, never in the roster.
- **Waves run 1..n contiguously, none empty.** Group by community district so a wave is geographically coherent — the Bronx used seven waves of 8–12 for 66 neighborhoods; Queens at ~100 across 14 districts suggests **ten to twelve waves of 8–10**. Pick a grouping and keep it consistent.
- **All 14 community districts must appear.** Queens CDs map roughly: 1 Astoria/LIC, 2 Sunnyside/Woodside, 3 Jackson Heights/East Elmhurst, 4 Elmhurst/Corona, 5 Ridgewood/Glendale/Maspeth, 6 Forest Hills/Rego Park, 7 Flushing/Whitestone/College Point, 8 Fresh Meadows/Briarwood, 9 Richmond Hill/Woodhaven/Kew Gardens, 10 Ozone Park/Howard Beach, 11 Bayside/Douglaston/Little Neck, 12 Jamaica/St. Albans/Hollis, 13 Queens Village/Rosedale/Laurelton, 14 the Rockaways and Broad Channel. **Verify these rather than trusting the summary** — it is a memory aid for coverage, not a source.
- Include the Rockaway peninsula neighborhoods (Far Rockaway, Arverne, Edgemere, Rockaway Beach, Rockaway Park, Belle Harbor, Neponsit, Breezy Point) and Broad Channel. They are easy to forget and are a whole community district.

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/seeds/queens_roster_test.exs`

Expected: PASS, 8 tests, 0 failures.

- [ ] **Step 5: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 554 baseline tests plus this file's 8, 0 failures, 4 excluded.

- [ ] **Step 6: Commit**

```bash
git add priv/seed_data/queens_roster.json test/ethos/seeds/queens_roster_test.exs
git commit -m "Add the Queens neighborhood roster and its gate

Fourth borough roster, same shape as Brooklyn's and the Bronx's: slug,
name, community_district, wave, and deliberately no tier — the tier is an
outcome of research.

Two assertions the Bronx roster test lacks, both cheap and both catching
errors nothing else would: community districts must fall in 1..14, and all
fourteen must be represented. A roster covering nine districts satisfies
every structural assertion while missing a third of the borough."
```

---

### Task 2: The seed directory, the photo manifest, and the gate

**Files:**
- Create: `priv/seed_data/queens/.gitkeep`
- Create: `priv/seed_data/queens_photo_manifest.json`
- Create: `test/ethos/seeds/queens_seed_data_test.exs`
- Create: `test/support/fixtures/seed_data/queens_fixtures/` (13 JSON files, ported)
- Modify: `test/test_helper.exs` — the single `ExUnit.configure` call

**Interfaces:**
- Consumes: `priv/seed_data/queens_roster.json` from Task 1, read at `@roster_path`.
- Produces: `priv/seed_data/queens/` as an existing directory, which Task 3's `seed_queens/1` and its release test both require. `SeedDataHelpers.seed_files("queens")` returns `[]` over it until research runs — that is expected and correct.

**Context — read before starting:**

`test/ethos/seeds/bronx_seed_data_test.exs` is 935 lines and is the source to port from. **Do not port from `brooklyn_seed_data_test.exs`.** Its own comment records that its fixture fires only trip-duration patterns 1, 2 and 3, so patterns 4 through 11 could be deleted or quietly weakened there and the suite would stay green. The Bronx copy carries `@trip_duration_specimens` proving each pattern individually load-bearing, plus the ballpark programme's nine vague-proximity patterns.

**Why the whole module ships excluded.** The gate carries non-vacuity floors — `assert files != [], "no queens seed files — every assertion below would pass vacuously"` — that **fail by construction over an empty directory**. A gate that is red because there is nothing to check yet is noise a later implementer cannot tell apart from their own regression. So the module gets a whole-file `@moduletag :pending_queens` and runs nothing. This is exactly what the Bronx did at its Task 2, and the Bronx moduledoc records the reasoning.

Be honest about what this buys in your report: **the gate is written and reviewed, not enforcing.** The trip-duration specimens stay live throughout via `destination_seed_data_test.exs` and `bronx_seed_data_test.exs`, both of which run today.

- [ ] **Step 1: Create the directory and the empty photo manifest**

```bash
mkdir -p priv/seed_data/queens
touch priv/seed_data/queens/.gitkeep
printf '{}' > priv/seed_data/queens_photo_manifest.json
```

Verify `priv/seed_data/bronx_photo_manifest.json` to confirm the empty form — it is `{}`. Match it exactly.

- [ ] **Step 2: Copy the gate and the fixtures**

```bash
cp test/ethos/seeds/bronx_seed_data_test.exs test/ethos/seeds/queens_seed_data_test.exs
cp -R test/support/fixtures/seed_data/bronx_fixtures test/support/fixtures/seed_data/queens_fixtures
```

The 13 fixture files are: `bad_county.json`, `bad_license.json`, `bad_place_county.json`, `bad_tier.json`, `below_floor.json`, `below_link_floor.json`, `marquee_duplicate.json`, `marquee_with_sub_place.json`, `missing_getting_there.json`, `missing_transit_faq.json`, `thin_guide.json`, `trip_duration.json`, `vague_proximity.json`.

- [ ] **Step 3: Apply the mechanical substitutions**

In `test/ethos/seeds/queens_seed_data_test.exs` and in every file under `test/support/fixtures/seed_data/queens_fixtures/`:

| From | To |
|---|---|
| `BronxSeedDataTest` | `QueensSeedDataTest` |
| `seed_files("bronx")` | `seed_files("queens")` |
| `bronx_roster.json` | `queens_roster.json` |
| `bronx_photo_manifest.json` | `queens_photo_manifest.json` |
| `bronx_fixtures` | `queens_fixtures` |
| `:pending_bronx` | `:pending_queens` |
| `"Bronx"` | `"Queens"` |
| `"Bronx County"` | `"Queens County"` |
| `bronx-county` | `queens-county` |
| `photos/ny/bronx/` | `photos/ny/queens/` |
| `images/bronx/` | `images/queens/` |
| `optimize_bronx_photos` | `optimize_queens_photos` |
| `fixture-bronx-` | `fixture-queens-` |
| the word `bronx` in assertion messages | `queens` |

**Do not blind-substitute `Bronx` → `Queens` in prose comments.** Several comments cite the Bronx spec by path and describe Bronx-specific reasoning; those need rewriting, not renaming. Steps 4–8 cover every one.

- [ ] **Step 4: Rewrite the moduledoc**

Replace the ported moduledoc's staging narrative. The Bronx version describes its Tasks 2/3/5; Queens has a different shape because research is deferred to a later plan entirely.

```elixir
defmodule Ethos.Seeds.QueensSeedDataTest do
  @moduledoc """
  The per-directory gate every Queens research wave must pass.

  It is written before the corpus it guards, and before the research that
  will fill that corpus is even scheduled — which is the point twice over.
  A gate written after the content is a gate tuned to the content; a gate
  written while the decisions are fresh is one that records them.

  ## This gate does not run yet

  The whole module carries `@moduletag :pending_queens` and
  `priv/seed_data/queens/` holds only `.gitkeep`. Nothing here executes.

  That is deliberate, not an oversight. The non-vacuity floors below
  (`assert files != []` and friends) fail by construction over an empty
  directory, and so does the roster equality. A gate that is red because
  there is nothing to check yet is noise a later implementer cannot
  distinguish from their own regression.

  **Nothing in this file may be described as enforced until the moduletag
  comes off.** The trip-duration and vague-proximity patterns ARE enforced
  today — but by `destination_seed_data_test.exs` and
  `bronx_seed_data_test.exs`, which run. This copy adds no coverage while
  dormant; it adds a reviewed record of the Queens-specific decisions.

  ## Which tag comes off when

  * **The first Queens research wave** lands the first seed file and deletes
    the `@moduletag` line above. Every corpus-scanning test here becomes
    meaningful at that moment, and the floors become checks rather than
    tripwires.
  * **The final wave** deletes the three tests' own `@tag :pending_queens`
    lines — roster equality, marquee institutions, and the Flushing
    destination-string assertion — and the `:pending_queens` entry in
    `test/test_helper.exs`. The tags go; the tests stay and start running.

  `:pending_queens` is deliberately a THIRD tag, not shared with
  `:pending_bronx` or `:pending_wave`. `:pending_wave` belongs to the
  place-research backlog, which still owes 320 places; `:pending_bronx`
  belongs to a programme that is mid-flight with 65 neighborhoods left.
  Sharing a tag across programmes means whichever finishes first either
  cannot delete it or, deleting it, un-excludes an unrelated gate that fails
  on defects it never touched.

  ## Where each part came from

  Ported wholesale from `test/ethos/seeds/bronx_seed_data_test.exs`, which is
  the strongest of the several copies of these patterns: it carries the
  eleven trip-duration patterns WITH the `@trip_duration_specimens` that
  prove each individually load-bearing, and the ballpark programme's nine
  vague-proximity patterns with their must-pass list of sourced spatial
  claims. `brooklyn_seed_data_test.exs` carries the same eleven patterns and
  no specimens; its own comment records that patterns 4 through 11 could be
  deleted there and the suite would stay green. Nobody should port from it.

  What is NOT ported is listed in the sections below: the transit modes, the
  marquee list, the park-duplication prefixes, and the county-count
  assertion, which needed a real change rather than a rename.
  """
```

- [ ] **Step 5: Rewrite the transit section for Queens modes**

The ported comment block and assertion message name the Bronx's modes. Queens has different ones. Find the `# --- The unified transit section ---` comment block and replace its body, and update the assertion message.

The comment block becomes:

```elixir
  # --- The unified transit section ----------------------------------------
  #
  # docs/superpowers/specs/2026-08-31-queens-neighborhoods-design.md §"Getting
  # there": one unified section per neighborhood covering subway, LIRR, bus,
  # ferry and AirTrain. That is a requirement, and roughly a hundred guides
  # will be written by many agents across many waves — a rule that survives
  # only as long as each dispatch remembers to restate it is a rule that does
  # not survive. Both tiers carry the section: an orientation page has one too.
  #
  # THE HEADING IS FIXED BY THIS GATE. It is exactly "Getting there" — not
  # Manhattan's "Getting there by subway", which 38 committed Manhattan guides
  # will have taught every author to reach for.
  #
  # WHAT THIS GATE DOES NOT SAY: the section is not subway-first. Queens'
  # weighting differs from every borough before it. Jamaica is the LIRR's own
  # hub and the primary regional link for the eastern and southern
  # neighborhoods; NYC Ferry serves Astoria, Long Island City and the
  # Rockaways; and both airports sit inside the borough, reached differently —
  # JFK by AirTrain from Jamaica and Howard Beach, LaGuardia by bus only,
  # since the LaGuardia AirTrain project was cancelled in 2023. A section
  # leading with the subway everywhere is accurate for the western
  # neighborhoods and wrong for the eastern half. This fixes the heading and
  # the section's existence; what leads inside it is the wave's judgement, and
  # no gate can check it.
```

And the assertion message in the corpus test becomes:

```elixir
    assert getting_there_violations(files) == [],
           "guides with no section headed exactly \"Getting there\" (the spec requires one " <>
             "unified section covering subway, LIRR, bus, ferry and AirTrain — not " <>
             "Manhattan's \"Getting there by subway\", which presumes the mode Queens often " <>
             "answers differently)"
```

- [ ] **Step 6: Replace the marquee institutions list**

The ported list names Bronx institutions. Replace `@marquee_institutions` and the comment above it that cites Bronx parks:

```elixir
  # Institutions that span neighborhood lines are the ones a multi-wave
  # programme writes up twice. Forest Park runs through Woodhaven, Richmond
  # Hill, Glendale and Kew Gardens; Alley Pond Park through Bayside,
  # Douglaston and Oakland Gardens; Socrates Sculpture Park sits on the
  # Astoria/Long Island City line. Each must appear in exactly one seed file.
  #
  # Matched on slug prefix, not display name: the slug is the stable
  # identifier (`places` carries a global unique index on it), while a display
  # name legitimately varies with the verdict that fixes it. Anchored at the
  # front so a qualified slug still matches. If a wave's verdict fixes a name
  # whose slug this pattern misses, WIDEN the pattern in the same commit and
  # say so in the wave report — never delete a row, which is the one edit that
  # silently restores the gap.
  #
  # DELIBERATELY ABSENT: every place owned by Ethos.Seeds.CitiFieldPlaces —
  # citi-field, unisphere, queens-museum, new-york-hall-of-science, queens-zoo,
  # usta-billie-jean-king-national-tennis-center, new-york-state-pavilion,
  # queens-theatre. They are code-defined and appear in ZERO seed files, so
  # listing them here would make this test report all eight as missing forever.
  # They are guarded by @code_owned_queens_places below instead.
  #
  # Candidates a later wave may add once their slugs are fixed by a verdict:
  # Rockaway Beach (spans the whole peninsula) and Jamaica Bay Wildlife Refuge
  # (Broad Channel and Howard Beach).
  @marquee_institutions [
    {"Forest Park", ~r/^forest-park/},
    {"Alley Pond Park", ~r/^alley-pond-park/},
    {"Astoria Park", ~r/^astoria-park/},
    {"Socrates Sculpture Park", ~r/^socrates-sculpture-park/},
    {"Louis Armstrong House Museum", ~r/^louis-armstrong-house/}
  ]
```

Then find the two mutation-guard assertions near the end of the file that reference `"Bronx Zoo"` and the `bronx-zoo` / `bronx-park.json` literals, and re-point them at a Queens marquee entry. The Bronx version reads:

```elixir
    one_guide = [{"bronx-park.json", "bronx-zoo"}, {"bronx-park.json", "bronx-zoo-congo"}]
    two_guides = [{"bronx-park.json", "bronx-zoo"}, {"belmont.json", "bronx-zoo"}]
```

becomes:

```elixir
    one_guide = [{"woodhaven.json", "forest-park"}, {"woodhaven.json", "forest-park-carousel"}]
    two_guides = [{"woodhaven.json", "forest-park"}, {"glendale.json", "forest-park"}]
```

and the lookup below it:

```elixir
    {_name, park} = Enum.find(@marquee_institutions, fn {name, _} -> name == "Forest Park" end)
```

Rename the bound variable from `zoo` to `park` at every use inside that test.

- [ ] **Step 7: Add the Citi Field no-re-creation assertion**

This is new — the Bronx gate has no equivalent because nothing pre-existed in its directory's towns. Add near the marquee list:

```elixir
  # Ethos.Seeds.CitiFieldPlaces already owns eight places in county "Queens",
  # under towns "Flushing" and "Corona" — the same slot a neighborhood guide
  # occupies. Neighborhood guides REFERENCE these by slug and never re-create
  # them.
  #
  # The global slug-uniqueness gate in SeedDataHelpers already catches the
  # exact-slug case mechanically. This assertion exists for the two cases it
  # cannot see: a wave re-creating one of the eight under a DIFFERENT slug
  # (caught by the research contract's address check, and reported here by
  # name so the reviewer knows what to look for), and this list going stale
  # because a place was removed from citi_field_places.ex without anyone
  # updating the gate that guards it.
  @code_owned_queens_places ~w(
    citi-field
    unisphere
    queens-museum
    new-york-hall-of-science
    queens-zoo
    usta-billie-jean-king-national-tennis-center
    new-york-state-pavilion
    queens-theatre
  )

  test "the Citi Field place list this gate guards is still accurate" do
    actual =
      Ethos.Seeds.CitiFieldPlaces.places()
      |> Enum.map(& &1.slug)
      |> Enum.sort()

    assert actual == Enum.sort(@code_owned_queens_places),
           "@code_owned_queens_places has drifted from Ethos.Seeds.CitiFieldPlaces — the " <>
             "no-re-creation rule guards a stale list"
  end

  test "no queens seed file re-creates a Citi Field place" do
    files = files()

    recreated =
      for f <- files,
          p <- DataGuide.load!(f)["places"],
          p["slug"] in @code_owned_queens_places,
          do: {Path.basename(f), p["slug"]}

    assert recreated == [],
           "queens seed files re-creating code-owned Citi Field places: #{inspect(recreated)}"
  end
```

The accessor is `places/0`, not `data/0` — verified at `lib/ethos/seeds/citi_field_places.ex:65`. It returns a bare list of maps, each with an atom `:slug` key. (`CitiFieldGuide` does use `data/0`, at `citi_field_guide.ex:44` — the two modules differ, which is why Step 8 calls one and Step 7 the other.) Do not add a public function to either seeds module for the test's benefit.

Note the second test needs no non-vacuity floor: over an empty directory it correctly reports no violations, and it is the *first* test's job to fail if the guarded list goes stale. Say so in a comment so a later reader does not "fix" it by adding a floor that turns the module red.

- [ ] **Step 8: Add the Flushing destination-string assertion**

Kept a pure data assertion so it needs no database:

```elixir
  # Flushing is the one Queens neighborhood that already exists as a
  # destination: Ethos.Seeds.CitiFieldGuide carries
  # destination: "Flushing, New York". Identical destination strings derive
  # identical destination_slugs, which is what makes the two guides CO-LIST
  # under one destination rather than compete for it.
  #
  # This is not the /destinations/washington defect. That was a state hub
  # silently shadowed by a town of the same name across two states, and
  # Guides.list_guides_shadowed_by_state/1 exists because of it. Two
  # town-level destinations in the same state merge, which is correct — a
  # destination page exists to group the guides that share it. Correct-today
  # and asserted are different states, so: asserted.
  @tag :pending_queens
  test "the Flushing guide shares the Citi Field guide's destination string" do
    path = Path.join(Path.dirname(hd(files() ++ ["priv/seed_data/queens/x"])), "flushing.json")

    assert File.exists?(path), "no flushing.json — this test cannot run before Flushing ships"

    seeded = DataGuide.load!(path)["guide"]["destination"]
    code = Ethos.Seeds.CitiFieldGuide.data().destination

    assert seeded == code,
           "flushing.json declares destination #{inspect(seeded)} but citi-field-guide " <>
             "declares #{inspect(code)} — differing strings derive differing " <>
             "destination_slugs, and the two guides stop co-listing"
  end
```

Simplify the path expression if `files()` gives you a cleaner handle — the intent is `priv/seed_data/queens/flushing.json` resolved the same way the rest of the module resolves paths. Prefer matching the module's existing `Path.expand(..., __DIR__)` idiom over the expression above if that is what the file already uses.

- [ ] **Step 9: Fix the county-count assertion — the real porting hazard**

The Bronx version ends its corpus test with:

```elixir
    bronx_guides =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Bronx"))

    assert length(bronx_guides) == length(files)
```

**Ported mechanically to Queens this is wrong.** `citi-field-guide` carries `county: "Queens"`, so any future change that seeds code guides in this test makes the count exceed `length(files)` and the failure message will point at the seed directory, which is innocent. Replace with an explicit set comparison that names the exception:

```elixir
    # citi-field-guide is code-defined and carries county "Queens", so a plain
    # count against length(files) is a trap: it passes today only because this
    # test never seeds code guides, and would fail confusingly the day it does,
    # pointing at the seed directory rather than at the guide it did not expect.
    # Named and subtracted instead.
    @code_owned_queens_guides MapSet.new(["citi-field-guide"])

    expected_slugs =
      for f <- files, into: MapSet.new(), do: DataGuide.load!(f)["guide"]["slug"]

    published =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Queens"))
      |> MapSet.new(& &1.slug)
      |> MapSet.difference(@code_owned_queens_guides)

    assert MapSet.equal?(published, expected_slugs),
           "published Queens-county guides do not match the seed corpus — " <>
             "missing: #{inspect(MapSet.difference(expected_slugs, published))}, " <>
             "unexpected: #{inspect(MapSet.difference(published, expected_slugs))}"
```

Module attributes cannot be defined inside a test body — hoist `@code_owned_queens_guides` to the top of the module beside `@code_owned_queens_places`.

Also extend the sibling-seeding loop in that same test. The Bronx version seeds `["manhattan", "brooklyn"]`; Queens guides may carry see-also edges to any of the three prior boroughs, and `Links.resolve!/1` raises on an unknown target rather than skipping the edge:

```elixir
    for sibling <- ["manhattan", "brooklyn", "bronx"] do
```

- [ ] **Step 10: Rewrite the remaining Bronx-specific comments**

Search the ported file for every remaining mention and rewrite each to Queens reasoning. Run:

```bash
grep -niE 'bronx|belmont|arthur|yankee|harlem|metro-north|fordham|riverdale|soundview|van cortlandt|pelham|orchard beach|bartow' test/ethos/seeds/queens_seed_data_test.exs
```

Expected after this step: **only** references that are deliberately about the Bronx — the moduledoc's "ported from `bronx_seed_data_test.exs`" provenance line, the `:pending_bronx` explanation in the tag section, and the `["manhattan", "brooklyn", "bronx"]` sibling list. Every other hit is an unported comment. In particular the park-duplication comment naming Bronx Park, Van Cortlandt Park and Pelham Bay Park must become the Queens equivalent — Forest Park (CDs 5 and 9), Alley Pond Park (11), Flushing Meadows–Corona Park (3, 4, 6 and 7), noting that the Flushing Meadows places are code-owned and guarded separately.

- [ ] **Step 11: Add the moduletag**

Immediately after the moduledoc, before any attribute:

```elixir
  use ExUnit.Case, async: true

  # Deleted by the first Queens research wave, which lands the first seed file.
  # Until then every assertion below either passes vacuously or fails by
  # construction over an empty priv/seed_data/queens/, and neither is a signal.
  @moduletag :pending_queens
```

Keep whatever `use` line the Bronx file has — do not change its async setting or its case module.

- [ ] **Step 12: Register the tag**

Modify the SINGLE `ExUnit.configure` call in `test/test_helper.exs`:

```elixir
ExUnit.configure(exclude: [:pending_wave, :pending_bronx, :pending_queens])
```

Extend the comment above it to name the third tag and why it exists. **Do not add a second `ExUnit.configure` call** — `exclude:` replaces the list rather than appending, so a second call silently re-enables `:pending_wave` and `:pending_bronx` and turns the suite red on pre-existing defects neither programme owns. The existing comment already records this; extend it, do not replace it.

- [ ] **Step 13: Verify the port left nothing behind**

```bash
diff test/ethos/seeds/bronx_seed_data_test.exs test/ethos/seeds/queens_seed_data_test.exs
```

Read **every** hunk and confirm it is intentional. This is the step that catches a missed substitution; a mechanical port's failure mode is silent, not loud. In your report, state the number of hunks and confirm you read them all.

Then confirm the module really is excluded:

```bash
mix test test/ethos/seeds/queens_seed_data_test.exs
```

Expected: `0 failures, N excluded` where N is every test in the file. **If any test runs, the moduletag is not applied** — fix it before continuing.

And confirm it compiles and would run when un-excluded:

```bash
mix test test/ethos/seeds/queens_seed_data_test.exs --include pending_queens
```

Expected: failures, and that is fine and expected — the directory is empty, so the non-vacuity floors fail exactly as designed. What must NOT appear is a compile error, an `UndefinedFunctionError`, or a `KeyError`. Those mean the port is broken rather than merely dormant. Report which failures you saw and confirm each is a non-vacuity floor or the roster equality.

- [ ] **Step 14: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 0 failures. Excluded count rises from 4 to 4 + every test in the new module.

- [ ] **Step 15: Commit**

```bash
git add priv/seed_data/queens/.gitkeep priv/seed_data/queens_photo_manifest.json \
        test/ethos/seeds/queens_seed_data_test.exs \
        test/support/fixtures/seed_data/queens_fixtures \
        test/test_helper.exs
git commit -m "Add the Queens per-directory gate, shipped excluded

Ported from the Bronx copy — the strongest of the several copies of these
patterns, and the only one whose trip-duration specimens prove each pattern
individually load-bearing. Brooklyn's copy would have been the wrong source.

The whole module carries @moduletag :pending_queens and runs nothing. The
non-vacuity floors fail by construction over an empty directory, and a gate
that is red because there is nothing to check yet is noise a later
implementer cannot tell from their own regression. This is written and
reviewed, not enforcing, and the moduledoc says so.

Three things needed real changes rather than renames: the transit modes
(LIRR, ferry and AirTrain, with LaGuardia having no AirTrain), the marquee
list, and the county-count assertion — Citi Field already carries county
\"Queens\", so counting against length(files) was a trap that passes today
and misattributes the failure the day it stops."
```

---

### Task 3: The seeder, its release test, and the runbook

**Files:**
- Modify: `lib/ethos/release.ex` — add `seed_queens/1` beside `seed_bronx/1`
- Modify: `test/ethos/release_test.exs` — add the `seed_queens/1` test
- Modify: `docs/runbooks/seeding.md` — Queens entry and the missing Bronx entry

**Interfaces:**
- Consumes: `priv/seed_data/queens/` existing, from Task 2.
- Produces: `Ethos.Release.seed_queens(email :: String.t()) :: :ok`, delegating to the private `seed_directory("queens", email)`.

**Context:** `seed_directory/2` is already private in `lib/ethos/release.ex` and does the three-pass load (all places, then all guides, then all links) and prints `"Seeded N files from priv/seed_data/<dir>"`. `seed_queens/1` is a one-line delegation. The work in this task is the test and the docs.

- [ ] **Step 1: Write the failing test**

Add to `test/ethos/release_test.exs`, modelled on the existing `seed_bronx/1` test:

```elixir
  # Queens ships before its research does, so `expected` is 0 for now and the
  # publishes-exactly-the-committed-files half of this test is vacuous. The
  # directory-literal half is NOT — it is fully load-bearing at zero files,
  # because seed_directory/2 prints its report whether or not it matched
  # anything. That is the exact inversion of the gate's situation, and it is
  # why this test ships running rather than tagged.
  test "seed_queens/1 names the Queens seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("queens"))

    # Manhattan is reproduced because Links.resolve!/1 raises on an unknown
    # target rather than skipping the edge. When a wave authors see-also edges
    # to Brooklyn or Bronx guides, add those seeders here too.
    Ethos.Release.seed_manhattan(user.email)

    before =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    output = capture_io(fn -> Ethos.Release.seed_queens(user.email) end)

    # The directory literal is the thing under test, and the only place it is
    # observable is what the module prints — so parse it back OUT of the report
    # rather than asserting a substring of it. `=~` is containment, which is the
    # wrong tool here: "Seeded 0 files from priv/seed_data/queenss\n" CONTAINS
    # "…/queens". Every prefix-extension typo — queenss, queens2, queens_guides,
    # "queens/" — survives containment. Captured to the newline and compared for
    # equality, then resolved on disk through the SAME captured value.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_queens/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "queens",
           "seed_queens/1 seeds priv/seed_data/#{dir}, not priv/seed_data/queens — a directory " <>
             "literal that matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_queens/1 names priv/seed_data/#{dir}, which does not exist — a silent no-op"

    # A DELTA, not an absolute count. citi-field-guide is code-defined and
    # carries county "Queens"; an absolute count would be correct only for as
    # long as this test never seeds code guides, and would then fail pointing
    # at the seed directory rather than at the guide it did not expect.
    after_first =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_queens(user.email) end)

    after_second =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    assert after_second == after_first, "seed_queens/1 is not idempotent"
  end
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `mix test test/ethos/release_test.exs`

Expected: FAIL with `UndefinedFunctionError: function Ethos.Release.seed_queens/1 is undefined or private`.

- [ ] **Step 3: Add the seeder**

In `lib/ethos/release.ex`, immediately after `def seed_bronx(email), do: seed_directory("bronx", email)`:

```elixir
  def seed_queens(email), do: seed_directory("queens", email)
```

- [ ] **Step 4: Run the test to verify it passes**

Run: `mix test test/ethos/release_test.exs`

Expected: PASS.

- [ ] **Step 5: Update the runbook**

In `docs/runbooks/seeding.md`, under `## Seed order`:

The Brooklyn line reads `4. Ethos.Release.seed_brooklyn(email) — 69 JSON files`, and 69 is **correct** — verified. Leave it alone. (An earlier draft of this plan had a step to "fix" it based on a miscount. Do not change it.)

Add the two missing entries after Brooklyn, renumbering the steps below them. `seed_destinations` currently sits after `seed_brooklyn`; keep it after the new entries, since it depends on nothing and nothing depends on it.

```markdown
5. `Ethos.Release.seed_bronx(email)` — JSON files in `priv/seed_data/bronx/`.
   One neighborhood has shipped so far; the remaining 65 are in progress.
6. `Ethos.Release.seed_queens(email)` — JSON files in `priv/seed_data/queens/`.
   **The directory is empty.** The scaffolding shipped ahead of the research,
   so this call currently seeds nothing and reports `Seeded 0 files`. That is
   the expected output, not a failure. Run it anyway: it is in the order so
   that the day the first wave lands, nobody has to remember to add it.
```

Do not write a hardcoded file count for either new entry. Brooklyn's 69 happens to be right today, but nothing checks it — the next wave to add a Brooklyn file makes it wrong silently, and the Bronx's count will change 65 more times.

- [ ] **Step 6: Run the full suite and the formatter**

Run: `mix format --check-formatted && mix test`

Expected: 0 failures.

- [ ] **Step 7: Commit**

```bash
git add lib/ethos/release.ex test/ethos/release_test.exs docs/runbooks/seeding.md
git commit -m "Add seed_queens/1, its release test, and the runbook entries

The seeder is a one-line delegation; the test is the work. Its
publishes-exactly-the-committed-files half is vacuous at zero files, but the
directory-literal half is fully load-bearing — seed_directory/2 prints its
report whether or not it matched anything, so a typo'd literal is catchable
today. Parsed back out of the report and compared for equality rather than
containment, because containment lets every prefix-extension typo through.

Counts the Queens-county guides as a delta rather than an absolute, since
citi-field-guide already carries that county.

Also adds the seed_bronx runbook entry, which was never written, and
corrects Brooklyn's count, which had drifted — both while adding the line
directly below them."
```

---

## Self-Review

**1. Spec coverage.** Walked each spec section against a task:

| Spec section | Task |
|---|---|
| The roster | 1 |
| Two tiers, decided after research | 1 (no `tier` key asserted); tier rule itself is in the ported gate, Task 2 |
| Getting there | 2 (Step 5) |
| The gate — port source, carried-over assertions | 2 (Steps 2–3, 10) |
| Gate — no-re-creation assertion | 2 (Step 7) |
| Gate — Flushing destination-string assertion | 2 (Step 8) |
| Gate — staging, moduletag | 2 (Steps 4, 11, 13) |
| Gate — the ExUnit hazard | 2 (Step 12) |
| The overlap rule | 2 (Step 7); the prose half is a research-phase rule, correctly absent here |
| Seeder, release test, runbook | 3 |
| Photos — empty manifest now | 2 (Step 1) |
| Photos — optimizer deferred | correctly absent; deferred to the research plan by the spec |
| Research contract | correctly absent; this plan commissions no research |

No gaps. Two spec items are deliberately unimplemented and named as such.

**2. Placeholder scan.** No TBD/TODO, no "add appropriate error handling", no "similar to Task N". Every accessor named in a code block was resolved against the source before the plan was committed rather than left for the implementer to discover.

**Two errors of my own, caught in this review and fixed inline:**

- Task 2 Step 7 called `Ethos.Seeds.CitiFieldPlaces.data()`. There is no such function — the module exposes `places/0` (`citi_field_places.ex:65`). `CitiFieldGuide` *does* use `data/0` (`citi_field_guide.ex:44`), which is how the confusion arose, and Steps 7 and 8 call different modules. Both now name the right one.
- Task 3 Step 5 instructed a "fix" of the runbook's Brooklyn count from 69 to 71. **69 is correct.** The 71 came from a miscount on my part; the runbook has no drift. The step now says explicitly to leave it alone, because a plan that tells an implementer to correct a correct number gets that number corrected.

**3. Type consistency.** `@code_owned_queens_places` (list of slug strings) and `@code_owned_queens_guides` (MapSet of guide slugs) are distinct names for distinct things and used consistently. `seed_queens/1` is named identically in Task 3 Steps 1, 3, 5 and 7. `:pending_queens` is spelled identically in Task 2 Steps 3, 8, 11, 12 and 13. `files()` is the Bronx module's existing private helper, re-pointed at `seed_files("queens")` in Step 3 and used unchanged thereafter.

**One correction found and fixed during review:** Task 2 Step 9 originally placed `@code_owned_queens_guides` inside the test body, where Elixir does not permit a module attribute definition. Hoisted to module scope, and the step now says so.
