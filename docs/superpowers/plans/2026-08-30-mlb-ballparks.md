# MLB Ballparks Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a guide for each MLB club's ballpark covering game-day surroundings, and capture the pattern in `docs/site-builder.md` so it runs again for NFL stadiums or national parks.

**Architecture:** Each ballpark is a guide whose entries are the places around it; the ballpark is also a place, typed `stadium`. The state and county hubs appear automatically because the geographic hierarchy is derived from guide fields. The pattern document is written first, because it is the durable deliverable and every later task is an instance of it.

**Tech Stack:** Phoenix 1.7.14 (dead controller views, `~p` sigil, `current_user` — **not** 1.8 scopes, not LiveView), Ecto/Postgres, ExUnit, `Workflow` for research waves.

**Spec:** `docs/superpowers/specs/2026-08-30-mlb-ballparks-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** Research happens at authoring time.
- **`cryptcom@gmail.com` is the only admin user.**
- **The authoring contract binds:** `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`.
- **There is no minimum word count, anywhere.** A floor manufactures the boilerplate it is meant to prevent.
- **A closure requires positive evidence.** "I could not confirm it is open" is `uncertain`, and uncertain never deletes.
- **A business's own site** cannot establish an award, a ranking, a superlative, or that it is still trading.
- **The finder never writes verdicts.** A separate agent adjudicates.
- **The gate scans every prose field**, not only summaries; a wave cleans every mention of its places anywhere in the file.
- **Parking and public transport are prose in a "Getting there" section, never place records.**
- **Nothing about which club plays where, or what a park is called, is taken from recollection.** A verdict establishes it or it does not ship.
- Phoenix 1.7.14 conventions. `mix format` on every file touched; `mix format --check-formatted` passes repo-wide.
- Worktree `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to `~/dev/ethos`. **Never use bare `git stash`** — the stack is shared with other live sessions; use `git show <ref>:<path>`.
- Baseline: **475 tests, 0 failures**, exactly **1** tolerated compiler warning (Gettext deprecation). Never go down; never add a warning.

---

### Task 1: `docs/site-builder.md`

**Files:**
- Create: `docs/site-builder.md`

**Interfaces:**
- Consumes: nothing.
- Produces: the pattern every later task follows. Tasks 4 and 5 cite it in their dispatches rather than restating it.

This is the durable deliverable. It must be specific enough that someone builds an NFL-stadium set from it **without reading the MLB spec**.

- [ ] **Step 1: Write the document**

Cover, in this order:

1. **What this pattern is for** — a themed set of N sites, each a guide, whose entries are the places around it. Name the instances: MLB ballparks, NFL stadiums, national parks.
2. **Roster first.** A committed list of the N sites before any research. Cite `priv/seed_data/bare_places_roster.json` and its lesson: assert the roster's *attribution* fields, not only membership, because the field a wave dispatches on is the one that must not drift. A mutation test proved a repointed `seed_file` passed every assertion.
3. **Geography is derived, never built.** `state` and `county` on the guide produce `/destinations/<state>` and `/destinations/<state>/<county>` via `GROUP BY` (`lib/ethos/guides.ex:88-107`). New York uses borough-as-county (`dumbo.json` → `county: "Brooklyn"`).
4. **The research contract.** Finder plus **independent** adversarial verifier; the finder never writes verdicts. The eight hard rules from the Global Constraints above. Record `searched: complete | rate_limited | blocked` per site — an empty result from a throttled finder is indistinguishable from a site with nothing to find.
5. **Verdicts gate publication; `searched` gates completeness accounting.** A site with at least one confirmed verdict is authored whatever its flag says. Only a site with *no* confirmed verdict and an incomplete search is re-queued.
6. **The checkpoint.** One site end to end, reviewed, contract amended, *then* the rest. Thirty-one places produced six contract amendments; every one would have compounded across four hundred.
7. **The dedup ladder.** (a) the global slug index and gate assertion — free and mechanical; (b) address matching before minting a slug, because an address collision is reliable and a name is not; (c) judgement on name variants, which is irreducible.
8. **Transit and parking are prose.** With the reason: thirty parking-garage pages are thin by construction, and that thinness is the exact defect a whole wave was spent removing.
9. **Method note.** Enumerate a site's fields by its slug through the data structure and read them; never grep for the phrasing. An entry note reading "SoHo's original five-star hotel… on Mercer Street" contains neither the place's name nor any banned word.
10. **What changes for a different set.** NFL is the same shape with a different roster. National parks differ: the "around it" radius is much larger and gateway towns matter more than walkable blocks, so the entry set is towns and trailheads rather than bars.
11. **The deferred question** — a place that owns entries, for when a region rather than a venue needs surroundings. Name what it would cost: a join table, a place-page section, a seed-format change, a loader change, gate assertions.

- [ ] **Step 2: Check it stands alone**

Re-read it as someone who has never seen the MLB spec. Every rule must carry its *reason*, because a rule without one gets optimised away by the next person. If any rule reads as arbitrary, add the failure that produced it.

- [ ] **Step 3: Commit**

```bash
git add docs/site-builder.md
git commit -m "docs: the site-builder pattern"
```

---

### Task 2: The `stadium` kind

**Files:**
- Modify: `lib/ethos/places/place.ex:7`
- Modify: `lib/ethos_web/controllers/place_html.ex:6-19`
- Test: `test/ethos_web/controllers/place_html_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `kind: "stadium"` accepted by `Place.changeset/2`; `EthosWeb.PlaceHTML.schema_type("stadium") == "StadiumOrArena"`.

Exactly the change made for `shop`, which is the model to copy.

- [ ] **Step 1: Write the failing test**

Add to `test/ethos_web/controllers/place_html_test.exs`:

```elixir
test "a stadium is a StadiumOrArena, not the TouristAttraction fallback" do
  assert PlaceHTML.schema_type("stadium") == "StadiumOrArena"
  refute PlaceHTML.schema_type("stadium") == PlaceHTML.schema_type("unmapped-kind")
end

test "stadium is an accepted kind" do
  assert "stadium" in Place.kinds()
end
```

The file's existing third test — every accepted kind maps to a real schema.org type, with `attraction` the single deliberate exception — will fail on its own if the mapping is added without the kind, or the kind without the mapping. Do not weaken it.

- [ ] **Step 2: Run it, watch it fail**

Run: `mix test test/ethos_web/controllers/place_html_test.exs`
Expected: FAIL — `"stadium"` is not in `Place.kinds()`.

- [ ] **Step 3: Add the kind and the mapping**

In `lib/ethos/places/place.ex`, add `stadium` before `attraction`:

```elixir
@kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction)
```

In `lib/ethos_web/controllers/place_html.ex`, add to `@schema_types`:

```elixir
"stadium" => "StadiumOrArena"
```

- [ ] **Step 4: Run it, watch it pass, then the full suite**

Run: `mix test`
Expected: 475 + 2 tests, 0 failures.

- [ ] **Step 5: Commit**

```bash
git add lib/ethos/places/place.ex lib/ethos_web/controllers/place_html.ex test/ethos_web/controllers/place_html_test.exs
git commit -m "feat: add a stadium kind, mapped to schema.org StadiumOrArena"
```

---

### Task 3: The club roster

**Files:**
- Create: `priv/seed_data/mlb_clubs_roster.json`
- Test: `test/ethos/seeds/mlb_clubs_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the roster Tasks 4 and 5 dispatch from. Each entry: `club`, `slug`, `venue`, `city`, `state`, `county`, `verified`.

**One entry per club, not per ballpark.** The spec is explicit: "thirty ballparks" is an assumption. Sponsorship renamings are frequent, at least one club has been playing in a temporary venue, and a club in transition may share a park.

**What is taken as given, and why.** The thirty club names are the *work list* — without them there is nothing to dispatch research at. Club names are the most stable fact in the domain; none has changed in well over a decade. **Everything else starts null**: `venue`, `city`, `state`, `county` are filled only by verified research in Tasks 4-5, and `verified` starts `false`.

That asymmetry is the point. A roster that asserted venues from recollection would launder thirty unverified facts into a committed file that later tasks would treat as settled.

- [ ] **Step 1: Write the roster**

Thirty objects, one per club, in this shape:

```json
[
  {
    "club": "Chicago Cubs",
    "slug": "chicago-cubs",
    "venue": null,
    "city": null,
    "state": null,
    "county": null,
    "verified": false
  }
]
```

- [ ] **Step 2: Write the test**

```elixir
defmodule Ethos.Seeds.MlbClubsRosterTest do
  use ExUnit.Case, async: true

  @path "priv/seed_data/mlb_clubs_roster.json"
  @external_resource @path
  @roster @path |> File.read!() |> Jason.decode!()

  test "one entry per club, no duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == 30
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate club slugs"

    names = Enum.map(@roster, & &1["club"])
    assert length(names) == length(Enum.uniq(names)), "duplicate club names"
  end

  test "every entry carries the seven keys, and no others" do
    for entry <- @roster do
      assert Enum.sort(Map.keys(entry)) ==
               ~w(city club county slug state venue verified),
             "unexpected key set on #{inspect(entry["slug"])}"

      assert is_binary(entry["club"]) and entry["club"] != ""
      assert is_binary(entry["slug"]) and entry["slug"] =~ ~r/^[a-z0-9-]+$/
      assert is_boolean(entry["verified"])
    end
  end

  # The venue fields are filled by verified research, never from recollection.
  # An entry is either fully resolved or fully unresolved — a half-filled row
  # means someone wrote down what they thought they knew and stopped.
  test "an entry is resolved together or not at all" do
    for entry <- @roster do
      venue_fields = [entry["venue"], entry["city"], entry["state"], entry["county"]]

      cond do
        entry["verified"] ->
          assert Enum.all?(venue_fields, &(is_binary(&1) and &1 != "")),
                 "#{entry["slug"]} is marked verified with a missing field"

        true ->
          assert Enum.all?(venue_fields, &is_nil/1),
                 "#{entry["slug"]} carries venue data without being verified"
      end
    end
  end
end
```

- [ ] **Step 3: Run it**

Run: `mix test test/ethos/seeds/mlb_clubs_roster_test.exs`
Expected: PASS with thirty unresolved entries.

Prove the third test bites: temporarily set one entry's `city` while leaving `verified` false, watch it fail, restore.

- [ ] **Step 4: Commit**

```bash
git add priv/seed_data/mlb_clubs_roster.json test/ethos/seeds/mlb_clubs_roster_test.exs
git commit -m "feat: MLB club roster, venues unresolved pending research"
```

---

### Task 4: The checkpoint ballpark

**Files:**
- Modify: `priv/seed_data/mlb_clubs_roster.json` (one entry resolved)
- Create: `lib/ethos/seeds/wrigley_field_guide.ex`
- Modify: `lib/ethos/seeds/connecticut_places.ex` — **no**; create `lib/ethos/seeds/ballpark_places.ex`
- Modify: `lib/ethos/release.ex`

**Interfaces:**
- Consumes: the roster (Task 3), the `stadium` kind (Task 2), the pattern (Task 1).
- Produces: `Ethos.Seeds.BallparkPlaces.upsert_all!/0`; `Ethos.Seeds.WrigleyFieldGuide.upsert!/1`; the contract amendments Task 5 inherits.

**Wrigley Field is the checkpoint** because it is the hardest useful case: dense walkable surroundings, a well-documented neighbourhood, rail service, and a new state — so it exercises geography creation, entry density and transit prose at once. A checkpoint that only sees easy cases certifies a contract the hard cases break.

- [ ] **Step 1: Research it**

Finder, then an **independent** verifier, following `docs/site-builder.md`. The finder establishes, and the verifier adjudicates: which club plays there, the venue's current name, the city, state and county; the places around it worth walking to; and the transit and parking facts for the *Getting there* prose.

**Before minting any place slug, check the existing corpus for that street address.** The gate catches slug collisions; it cannot catch the same business under a different name.

- [ ] **Step 2: Resolve the roster entry**

Fill `venue`, `city`, `state`, `county` and set `verified: true` — only from confirmed verdicts. The Task 3 test enforces that these move together.

- [ ] **Step 2b: Teach the corpus-wide gates that a second places module exists**

**Do this before creating `ballpark_places.ex`, not after.** Discovered during
Task 1's sweep and verified independently.

Three corpus-wide gates read the *code* half of the place corpus as a single
hardcoded `Ethos.Seeds.ConnecticutPlaces.places()`. A second places module is
invisible to all of them, which guts rung (a) of the dedup ladder for exactly the
shape this task introduces — a slug collision would not fail the gate; it would
surface as the production unique index firing mid-seed, part-way through a
non-transactional run, leaving earlier files published and later ones unseeded.
That is the failure `test/support/seed_data_helpers.ex` opens its moduledoc by
describing.

**Four call sites, not three** — the count matters because someone who stops at
three most plausibly drops the second one, which is the banned-prose scan:

- `test/ethos/seeds/place_content_gate_test.exs:118`
- `test/ethos/seeds/place_content_gate_test.exs:176`
- `test/ethos/seeds/bare_places_roster_test.exs:66`
- `test/support/seed_data_helpers.ex:58`

Add `Ethos.SeedDataHelpers.code_places/0`, returning every code-defined places
module's entries, and route all four through it. Note `seed_data_helpers.ex:58`
pairs each place with an owner label (`"connecticut_places.ex"`) for its
duplicate-reporting message, so the helper must preserve which module a place
came from — a collision report naming the wrong file is worse than none.

Then adding a third places module later is one edit in one place rather than
four in four.

Also hardcoded, and worth fixing while you are there:
`lib/mix/tasks/ethos.bare_places.ex:69` and `:79`. Not a gate, but it is the
generator behind the roster precedent, so a code-module set is invisible to it
too.

Prove the fix bites: add a place to `ballpark_places.ex` whose slug already
exists in `connecticut_places.ex`, confirm the uniqueness assertion fails and
names both owners, then remove it.

- [ ] **Step 3: Write the places module**

`lib/ethos/seeds/ballpark_places.ex`, following `lib/ethos/seeds/connecticut_places.ex` — **atom keys**, `upsert_all!/0` mapping `Ethos.Places.upsert_place!/1`. It holds the ballpark itself (`kind: "stadium"`) and every surrounding place. A separate module from the Connecticut one because they grow independently and neither should be opened to edit the other.

- [ ] **Step 4: Write the guide module**

`lib/ethos/seeds/wrigley_field_guide.ex`, following `lib/ethos/seeds/antique_trail_guide.ex` closely — it is the newest and cleanest example. `upsert!(email)` delegates to `Ethos.Seeds.GuideRunner.upsert!/2`, which requires `slug`, `title`, `destination`, `state`, `county`, `intro`, `sections`, `faq`, `entries`, `photos`.

Three sections minimum: **Getting there** (transit and parking as prose), **Around the ballpark**, and **The ballpark and the team**.

The moduledoc states which verdicts the content rests on and what was dropped, as `antique_trail_guide.ex` does — that docstring is what makes the content auditable a year later.

- [ ] **Step 5: Wire the seeding**

In `lib/ethos/release.ex`, add a `seed_ballparks(email)` that runs `BallparkPlaces.upsert_all!()` **then** the guide modules — places before guides, the same order `seed_connecticut/1` uses, because entries resolve by `place_slug`.

- [ ] **Step 6: Run the gate and the full suite**

Run: `mix test` and `mix test --include pending_wave`
Expected: no new failures; boilerplate stays at 4 and stubs at 6.

- [ ] **Step 7: Seed locally and render**

Confirm: the guide renders with its entries resolving; `/destinations/<state>` and `/destinations/<state>/<county>` now exist; the ballpark's place page emits `"@type":"StadiumOrArena"`.

- [ ] **Step 8: Checkpoint review — the point of this task**

Dispatch a fact-fidelity reviewer. It traces every published claim to a verdict and reports **any contract defect that would compound across the remaining twenty-nine.** Amend `docs/site-builder.md` before Task 5 begins, and record each amendment in the ledger.

- [ ] **Step 9: Commit**

---

### Task 5: The remaining clubs, in waves

**Files:**
- Modify: `priv/seed_data/mlb_clubs_roster.json`
- Modify: `lib/ethos/seeds/ballpark_places.ex`
- Create: one guide module per ballpark
- Modify: `lib/ethos/release.ex`

**Interfaces:**
- Consumes: everything above, including Task 4's contract amendments.
- Produces: a resolved roster.

Same protocol per ballpark: finder → independent verifier → resolve the roster entry → author → gate → fact-fidelity review. A wave is not complete until its review findings are fixed.

- [ ] **Step 1: Size the waves to search budget**

**Search access is the binding constraint, not concurrency.** A previous programme measured 82% rate-limiting and did not recover by reducing agents fourfold. Run small waves, check `searched` values, and stop when throttling dominates rather than pushing through and banking partial work as complete.

- [ ] **Step 2: Run waves to exhaustion of the roster**

- [ ] **Step 3: Assert the roster is fully resolved**

Mechanically, against the roster — thirty entries with `verified: true`. Thirty ballparks across parallel waves is exactly the shape where one is skipped silently.

---

### Task 6: Collection, runbook, close-out

**Files:**
- Create: `lib/ethos/seeds/mlb_ballparks_collection.ex`
- Modify: `lib/ethos/release.ex:63-68`
- Modify: `docs/runbooks/seeding.md`

**Interfaces:**
- Consumes: every ballpark guide slug from Tasks 4-5.
- Produces: `/c/mlb-ballparks`.

- [ ] **Step 1: Write the collection module**

Following `lib/ethos/seeds/antique_trail_collection.ex`. Slug `mlb-ballparks`, published, items are every ballpark guide with a one-line blurb each. Each guide then shows *"Part of MLB Ballparks"* under its title from the existing template line — no template change.

- [ ] **Step 2: Add it to `seed_collections/0`**

- [ ] **Step 3: Runbook entry**

Document `seed_ballparks` in `docs/runbooks/seeding.md`, including that places seed before guides and why.

- [ ] **Step 4: Full whole-branch review**

- [ ] **Step 5: Stop for deploy authorization**

---

## Self-Review

**Spec coverage.** Ballpark-is-a-guide → T4/T5. Ballpark-is-also-a-place, `stadium` kind → T2, T4 step 3. Borough-as-county → T1 item 3, exercised at T5. Transit/parking as prose → Global Constraints, T1 item 8, T4 step 4. Sections → T4 step 4. Collection → T6. Dedup ladder → T1 item 7, T4 step 1. `site-builder.md` → T1. Roster → T3. Checkpoint → T4 step 8. Deferred place-with-entries → T1 item 11. The "roster may not be thirty" risk → T3's design: one entry per club, venues null until verified.

**Placeholder scan.** No TBDs. The three places an implementer determines a value rather than copying one — the roster's thirty club names in T3, the research outcome in T4, and wave sizing in T5 — each say so and say what to do if the value surprises them.

**Type consistency.** `BallparkPlaces.upsert_all!/0` is arity 0 in T4 and T4 step 5. `WrigleyFieldGuide.upsert!/1` takes an email, matching `GuideRunner.upsert!/2`'s second argument, matching every existing guide module. The roster's seven keys are identical in T3's shape, T3's key-set assertion, and T4 step 2. `schema_type/1` returns a string in T2 and its test.

**Ordering.** T1 before everything, because T4 and T5 cite it rather than restating it. T2 and T3 are independent of each other and of T1. T4 consumes all three. **T5 consumes T4's amendments — that dependency is the checkpoint's whole purpose and must not be parallelised away.** T6 consumes every guide slug, so it is last.
