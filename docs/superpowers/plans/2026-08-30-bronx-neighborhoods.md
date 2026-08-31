# Bronx Neighborhoods Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Cover the Bronx neighborhood by neighborhood to the standard Brooklyn and Manhattan already meet — history, getting there, parks, eateries, lodging, and the places a traveler would actually go.

**Architecture:** A committed roster, a per-directory gate ported from the strongest existing copy, then one neighborhood end to end as a checkpoint before the remaining waves. Everything else already exists: the seed-directory loader, the destination hub, and the corpus-wide gates a new directory inherits for free.

**Tech Stack:** Phoenix 1.7.14 (dead controller views, `~p` sigil, `current_user` — **not** 1.8 scopes, not LiveView), Ecto/Postgres, ExUnit, `Workflow` for research waves.

**Spec:** `docs/superpowers/specs/2026-08-30-bronx-neighborhoods-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** Research is authoring-time only.
- **`cryptcom@gmail.com` is the only admin user.**
- **The authoring contract binds:** `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` and `docs/site-builder.md` §4 and §8.
- **`county: "Bronx"`, never `"Bronx County"`.** Borough-as-county is established; the legal name would derive `bronx-county` and split the borough hub.
- **No trip durations, in any form, including "a short walk".**
- **No vague proximity** — "N blocks south", "next door", "across the street from", "steps from", "within walking distance".
- **Inspection records license existence, never description.** DOHMH data may support a status verdict; it may never appear in prose.
- **There is no minimum word count.** A floor manufactures the boilerplate it is meant to prevent.
- **The finder never writes verdicts.** A separate agent adjudicates.
- **Uncertain identity blocks publication; uncertain trading does not.**
- **A verdict decides the name; the slug follows the name.**
- **Boundary language stays hedged.** Bronx neighborhood lines are contested.
- Phoenix 1.7.14 conventions. `mix format` on every file touched; `mix format --check-formatted` passes repo-wide.
- Worktree `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to `~/dev/ethos`. **No stash of any kind** — the stack is shared with other live sessions; use a temporary WIP commit.
- Baseline: **513 tests, 0 failures, 2 excluded**, exactly **1** tolerated compiler warning (Gettext deprecation). Never go down; never add a warning.

---

### Task 1: The roster

**Files:**
- Create: `priv/seed_data/bronx_roster.json`
- Test: `test/ethos/seeds/bronx_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the roster Tasks 3-5 dispatch from. Shape: `%{"borough", "source", "neighborhoods" => [%{"slug", "name", "community_district", "wave"}]}`.

Committed before any research so nothing is silently skipped. `priv/seed_data/brooklyn_roster.json` is the exact precedent — read it first.

- [ ] **Step 1: Write the roster**

Every NYC DCP Neighborhood Tabulation Area in the Bronx. Same four keys per entry as Brooklyn's. Assign waves of roughly 8-12, grouped by community district so a wave's neighborhoods share sources.

`source` names where the list came from, as Brooklyn's does.

**The neighborhood names and community districts are the work list and the only thing taken as given.** Do not assign a `tier` — the tier is an outcome of research, set later, never an input.

- [ ] **Step 2: Write the test**

```elixir
defmodule Ethos.Seeds.BronxRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/bronx_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  test "the roster names a borough and its source" do
    assert @roster["borough"] == "Bronx"
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
end
```

- [ ] **Step 3: Run it**

Run: `mix test test/ethos/seeds/bronx_roster_test.exs`
Expected: PASS. Report the neighborhood count — do not adjust the list to hit a round number.

Prove the fourth test bites: temporarily add `"tier": "guide"` to one entry, watch it fail naming that slug, restore.

- [ ] **Step 4: Commit**

```bash
git add priv/seed_data/bronx_roster.json test/ethos/seeds/bronx_roster_test.exs
git commit -m "feat: the Bronx neighborhood roster"
```

---

### Task 2: The gate

**Files:**
- Create: `test/ethos/seeds/bronx_seed_data_test.exs`
- Create: `test/support/fixtures/seed_data/bronx_fixtures/` (fixture files)
- Create: `priv/seed_data/bronx/.gitkeep`
- Create: `priv/seed_data/bronx_photo_manifest.json` (initialised to `{}`)
- Create: `lib/mix/tasks/ethos.optimize_bronx_photos.ex`
- Modify: `lib/ethos/release.ex`

**Interfaces:**
- Consumes: the roster (Task 1).
- Produces: `Ethos.Release.seed_bronx/1`; the gate every wave must pass.

- [ ] **Step 1: Port the duration gate from the RIGHT copy**

**Copy from `test/ethos/seeds/destination_seed_data_test.exs`, NOT from `brooklyn_seed_data_test.exs`.**

This is the one place the Bronx must not follow Brooklyn. Both carry eleven trip-duration patterns, but Brooklyn's has **no specimens** — its own comment records that patterns 4 through 11 could be deleted or quietly weakened and the suite would stay green, because the fixture only fires patterns 1, 2 and 3. The destination copy adds `@trip_duration_specimens` (`:100-112`) and a test at `:457` asserting each of the eleven is individually load-bearing.

Carry the specimens with the patterns. `destination_seed_data_test.exs:36-41` says so itself: *"Do not re-derive, condense or 'improve' one of these."*

- [ ] **Step 2: Port the proximity gate**

From `test/ethos/seeds/ballpark_seed_data_test.exs` — nine patterns, each with its specimen, an **empty allowlist**, and the must-pass list of sourced spatial claims. That must-pass list matters: a gate that bans the checkable form pushes authors toward vagueness, which is the opposite of the goal.

- [ ] **Step 3: Port the rest from Brooklyn, which is the right template for these**

Scoped with `defp files, do: SeedDataHelpers.seed_files("bronx")`:

- **Roster equality**, failing in both directions and naming which slugs are missing and which unexpected.
- **The tier invariant** — `brooklyn_seed_data_test.exs:109-122`: a `guide` with fewer than 4 places, or a `town-page` with 6 or more, is a violation.
- **The town-page floor** — `:124-138`: intro at least 90 words, at least 3 outbound links.
- **Licence allowlist**, photo labels globally unique, every referenced photo present on disk, manifest provenance matching the published credit.
- **`county: "Bronx"` on every guide**, never `"Bronx County"`.

Each content assertion gets a fixture that violates exactly one rule, in `bronx_fixtures/`, outside `priv/seed_data/` so it is never seeded.

- [ ] **Step 4: Add the seeding hook and the optimizer**

In `lib/ethos/release.ex`, beside `seed_brooklyn/1` at line 65:

```elixir
def seed_bronx(email), do: seed_directory("bronx", email)
```

`lib/mix/tasks/ethos.optimize_bronx_photos.ex` follows `ethos.optimize_destination_photos.ex` — read it; it delegates to `Ethos.PhotoManifest` rather than reimplementing. Point it at `priv/seed_data/bronx/*.json` and `priv/seed_data/bronx_photo_manifest.json`.

- [ ] **Step 5: Run the gate over an empty directory**

Run: `mix test test/ethos/seeds/bronx_seed_data_test.exs`

**Expect the roster assertion to fail**, naming every neighborhood as missing — the directory holds only `.gitkeep`. That is correct and is the assertion working.

**Ruling, so nobody weakens it:** the roster assertion is tagged `:pending_wave` and excluded until Task 5 completes, exactly as the place-content gate's two assertions were. Every other assertion in the file runs from the start and must pass over an empty collection *only because* the collection is genuinely empty — add a non-vacuity floor to each so it cannot pass silently once files exist.

- [ ] **Step 6: Prove the specimens bite**

Delete one duration pattern, confirm its specimen test fails naming the index, restore. Do the same for one proximity pattern. Report what the failure messages said.

- [ ] **Step 7: Commit**

---

### Task 3: The checkpoint neighborhood

**Files:**
- Create: `priv/seed_data/bronx/<slug>.json`
- Modify: `priv/seed_data/bronx_photo_manifest.json`
- Create: `.superpowers/sdd/<plan>/research/<slug>.json` (git-ignored)

**Interfaces:**
- Consumes: the roster (Task 1), the gate (Task 2).
- Produces: the contract amendments Tasks 4-5 inherit.

**Pick the neighborhood with the most to research, not the least.** Belmont (Arthur Avenue) or Fordham. A checkpoint that only sees an easy case certifies a contract the hard cases break — the ballpark checkpoint deliberately took Wrigleyville for exactly this reason and returned twelve findings.

- [ ] **Step 1: Research it**

Finder, then an **independent** verifier, following `docs/site-builder.md` §4.

Gather: history and name origin; **getting there** — subway lines and stations, Metro-North where it serves, bus routes where they are the realistic answer, ferry if a landing genuinely serves it; parks, attractions, museums, historic sites; food; lodging physically inside the neighborhood; and `closed_or_unverified`.

**Check the corpus for each candidate's street address before minting a slug.** Twelve Bronx places already exist in `lib/ethos/seeds/yankee_stadium_places.ex`. Reference an existing slug; never re-create one under a new name.

- [ ] **Step 2: Decide the tier from the verdicts**

Six or more surviving verified places makes a `guide`; fewer makes `tier: "town-page"` with its 90-word intro and 3-link floor. The gate enforces both directions.

- [ ] **Step 3: Author the seed file**

Only what a `confirmed` verdict's own `item` text restates.

- [ ] **Step 4: Photos**

Wikimedia Commons only, licences `Public domain` / `CC0` / `CC BY x.y` / `CC BY-SA x.y`. **Open each image and confirm it depicts what the candidate claims** — fourteen candidates across the Brooklyn programme did not. Shipping with no photo is an acceptable outcome.

- [ ] **Step 5: Run the gate and the full suite**

- [ ] **Step 6: Checkpoint review — the point of this task**

Dispatch a fact-fidelity reviewer. It traces every published claim to a verdict and reports **any contract defect that would compound across the remaining neighborhoods.** Amend `docs/site-builder.md` and the ledger before Task 4 begins.

- [ ] **Step 7: Commit**

---

### Task 4: The remaining waves

**Files:**
- Create: `priv/seed_data/bronx/*.json`
- Modify: `priv/seed_data/bronx_photo_manifest.json`

**Interfaces:**
- Consumes: everything above, including Task 3's amendments.
- Produces: a complete directory.

Same protocol per neighborhood: finder → independent verifier → tier from verdicts → author → gate → fact-fidelity review. A wave is not complete until its review findings are fixed.

- [ ] **Step 1: Size the waves to search budget**

**Search access is the binding constraint, and it is session-cumulative rather than concurrency-scaled** — a 394-place wave came back 82% throttled and did not recover at a quarter of the agents. Record `searched` per place; anything not `complete` with **no confirmed verdicts** is re-queued. A place with confirmed verdicts is authored whatever its flag says.

**When search dies, NYC open data is the fallback that works.** DOHMH restaurant inspections and business licence records are dated and authoritative for existence and a dated commercial act. They may never appear in prose.

- [ ] **Step 2: Run waves to exhaustion of the roster**

- [ ] **Step 3: Assert the roster is fully covered**

Mechanically, against the roster. A borough across many waves is exactly the shape where one neighborhood is skipped silently.

*Superseded 2026-08-31 by `docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`: the gate asserts equality against the in-scope subset (14 rows), not the full 66-row roster.*

---

### Task 5: Close-out

- [ ] **Step 1: Re-enable the roster assertion** tagged in Task 2 and confirm it passes with strict equality. **Delete the tag**, do not merely note it — an excluded gate is not a gate.

- [ ] **Step 2: Runbook entry** for `seed_bronx` in `docs/runbooks/seeding.md`, following the entries already there.

- [ ] **Step 3: Record the outcome** in `docs/site-builder.md` — neighborhood count, the guide/town-page split, and the defect classes the waves found. The pattern's own evidence, with the honest numbers.

- [ ] **Step 4: Full whole-branch review**

- [ ] **Step 5: Stop for deploy authorization**

---

## Self-Review

**Spec coverage.** Roster → T1. Two tiers decided after research → T2 step 3 (the invariant), T3 step 2. Getting there with Metro-North weighting → T3 step 1. The gate ported from the destination copy → T2 steps 1-2, with the reason. Overlap rule → T3 step 1. Photos → T2 step 4, T3 step 4. Research contract → Global Constraints, T3 step 1, T4 step 1. Checkpoint → T3 step 6. Sequencing → task order. Risks: search budget → T4 step 1; inspection records → Global Constraints and T4 step 1; contested boundaries → Global Constraints.

**Placeholder scan.** No TBDs. The three places an implementer determines a value rather than copying one — the neighborhood list in T1, the checkpoint's research outcome in T3, and wave sizing in T4 — each say so and say what to do if the value surprises them.

**Type consistency.** The roster's four keys are identical in T1's shape, T1's key-set assertion, and T3/T4's dispatch. `seed_bronx/1` takes an email, matching `seed_brooklyn/1` and `seed_directory/2`. `tier` is `"guide" | "town-page"` in T2 and T3, matching `brooklyn_seed_data_test.exs:112-118`.

**Ordering.** T1 and T2 are independent of each other; T2's roster assertion consumes T1 but is excluded until T5. T3 consumes both. **T4 consumes T3's amendments — that dependency is the checkpoint's whole purpose and must not be parallelised away.** T5 is last by necessity.
