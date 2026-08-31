# Narrowed NYC Scope Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Flag 35 of 177 rostered neighborhoods as in-scope, and re-point the two gates that define "done" so they measure the committed scope rather than the whole borough.

**Architecture:** Two tasks. Task 1 adds an `in_scope` boolean to every roster row and pins the chosen set in the roster tests. Task 2 re-points both seed-data gates' roster-equality assertions at the in-scope subset and corrects the tag-removal schedules that three files describe.

**Tech Stack:** Elixir, ExUnit, JSON seed data.

**Spec:** `docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`

## Global Constraints

- **All 177 roster rows stay.** The mechanism is a flag, not a trim. Deleting rows destroys the record of what was deferred.
- **The in-scope sets are exactly 14 Bronx and 21 Queens**, named verbatim in Task 1. Do not add, remove or substitute a slug.
- **Both `@marquee_institutions` lists ship UNCHANGED.** All ten institutions were verified to sit in in-scope neighborhoods. An implementer who "filters" them is removing coverage for no reason.
- **These four Queens roster assertions are NOT affected and must not be touched:** all 14 community districts represented (`queens_roster_test.exs:66`), roster not trivially small (`:75`), every CD in 1..14 (`:56`), wave contiguity. They are properties of the roster, which stays complete.
- **Do NOT relax roster equality to a one-directional check**, despite the Bronx gate's own comment recommending it. That loses truncated-corpus detection, which the same comment says is the only reason the test exists.
- Zero AI calls and zero server-side external API calls in shipped code.
- Work only in the worktree `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to the original repo root.
- **Never use `git stash` in any form** — the stash stack is shared with the main checkout and other Claude sessions. Use a WIP commit.
- Do NOT push and do NOT deploy. Commit locally only, on branch `destination-pages`.
- Run `mix format --check-formatted` and the full `mix test` before every commit. Baseline is 642 tests, 0 failures, 31 excluded.
- Tolerated pre-existing warnings: `lib/ethos_web/gettext.ex:23`, `test/ethos/seeds/data_guide_test.exs:16`, `test/ethos/seeds/ct_guides_test.exs:21`. Any OTHER new warning is a defect.
- If `mix test` fails with `** (Mix) Could not load Ethos.Repo`, run `mix compile --force` once.

---

## File Structure

| File | Responsibility | Task |
|---|---|---|
| `priv/seed_data/bronx_roster.json` | `in_scope` on all 66 rows | 1 |
| `priv/seed_data/queens_roster.json` | `in_scope` on all 111 rows | 1 |
| `test/ethos/seeds/bronx_roster_test.exs` | five-key assertion; pin the 14 | 1 |
| `test/ethos/seeds/queens_roster_test.exs` | five-key assertion; pin the 21 | 1 |
| `test/ethos/seeds/bronx_seed_data_test.exs` | roster equality over in-scope; moduledoc; the misleading comment | 2 |
| `test/ethos/seeds/queens_seed_data_test.exs` | roster equality over in-scope; moduledoc | 2 |
| `test/test_helper.exs` | tag-removal comment | 2 |

---

### Task 1: The rosters

**Files:**
- Modify: `priv/seed_data/bronx_roster.json`
- Modify: `priv/seed_data/queens_roster.json`
- Modify: `test/ethos/seeds/bronx_roster_test.exs:13`
- Modify: `test/ethos/seeds/queens_roster_test.exs:18`

**Interfaces:**
- Consumes: nothing.
- Produces: every roster row carries `in_scope`, a boolean. Task 2 filters on it with `Enum.filter(& &1["in_scope"])`.

**Context:** Both roster tests currently assert `Enum.sort(Map.keys(n)) == ~w(community_district name slug wave)`. The `and no others` is the point — a stray or misspelled key must fail loudly. Adding a fifth key breaks it by design; the fix is to extend the list to five, not to loosen the equality.

Note the sorted order: `in_scope` sorts before `name`, so the list becomes `~w(community_district in_scope name slug wave)`.

- [ ] **Step 1: Write the failing tests**

Add to `test/ethos/seeds/bronx_roster_test.exs`:

```elixir
  # The scope decision, pinned. Without this the flag is 66 independent
  # booleans that any later edit can widen or narrow silently — and the thing
  # that would notice is the roster-equality gate, which is excluded until the
  # last in-scope neighborhood ships. This is the only assertion standing
  # between a scope change and nobody knowing.
  #
  # Source: docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md
  @in_scope ~w(
    belmont mott-haven riverdale city-island fordham-heights kingsbridge
    pelham-bay throgs-neck concourse woodlawn morris-park bronx-park
    hunts-point van-cortlandt-park
  )

  test "exactly the committed in-scope neighborhoods are flagged" do
    flagged =
      @roster["neighborhoods"] |> Enum.filter(& &1["in_scope"]) |> Enum.map(& &1["slug"])

    assert Enum.sort(flagged) == Enum.sort(@in_scope),
           "in-scope set drifted from the spec — " <>
             "flagged but not committed: #{inspect(Enum.sort(flagged -- @in_scope))}; " <>
             "committed but not flagged: #{inspect(Enum.sort(@in_scope -- flagged))}"
  end

  test "every neighborhood carries an in_scope boolean" do
    for n <- @roster["neighborhoods"] do
      assert is_boolean(n["in_scope"]), "#{n["slug"]} has in_scope #{inspect(n["in_scope"])}"
    end
  end

  # The roster is the record of what the borough contains; the flag records
  # what this programme committed to. Trimming the out-of-scope rows would
  # destroy the only written account of what was deferred.
  test "the roster still names the whole borough" do
    assert length(@roster["neighborhoods"]) == 66
  end
```

Add the same three to `test/ethos/seeds/queens_roster_test.exs`, with the Queens values:

```elixir
  # The scope decision, pinned. Without this the flag is 111 independent
  # booleans that any later edit can widen or narrow silently — and the thing
  # that would notice is the roster-equality gate, which is excluded until the
  # last in-scope neighborhood ships. This is the only assertion standing
  # between a scope change and nobody knowing.
  #
  # Source: docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md
  @in_scope ~w(
    astoria long-island-city ditmars-steinway flushing jackson-heights elmhurst
    corona sunnyside woodside forest-hills rego-park kew-gardens ridgewood
    glendale maspeth richmond-hill jamaica bayside douglaston rockaway-beach
    far-rockaway
  )

  test "exactly the committed in-scope neighborhoods are flagged" do
    flagged =
      @roster["neighborhoods"] |> Enum.filter(& &1["in_scope"]) |> Enum.map(& &1["slug"])

    assert Enum.sort(flagged) == Enum.sort(@in_scope),
           "in-scope set drifted from the spec — " <>
             "flagged but not committed: #{inspect(Enum.sort(flagged -- @in_scope))}; " <>
             "committed but not flagged: #{inspect(Enum.sort(@in_scope -- flagged))}"
  end

  test "every neighborhood carries an in_scope boolean" do
    for n <- @roster["neighborhoods"] do
      assert is_boolean(n["in_scope"]), "#{n["slug"]} has in_scope #{inspect(n["in_scope"])}"
    end
  end

  # The roster is the record of what the borough contains; the flag records
  # what this programme committed to. Trimming the out-of-scope rows would
  # destroy the only written account of what was deferred.
  test "the roster still names the whole borough" do
    assert length(@roster["neighborhoods"]) == 111
  end
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `mix test test/ethos/seeds/bronx_roster_test.exs test/ethos/seeds/queens_roster_test.exs`

Expected: the two `in_scope` tests in each file FAIL — no row carries the key, so `Enum.filter` returns `[]` and `is_boolean(nil)` is false. The two "still names the whole borough" tests PASS already. Report which failed.

- [ ] **Step 3: Update the dispatch-key assertions**

In BOTH roster tests, change the key list from four to five. `in_scope` sorts between `community_district` and `name`:

```elixir
      assert Enum.sort(Map.keys(n)) == ~w(community_district in_scope name slug wave)
```

Keep the assertion as exact equality. Do not replace it with a subset check — the `and no others` property is why it exists.

- [ ] **Step 4: Add the flag to both rosters**

Add `"in_scope": true` to the 14 Bronx rows and 21 Queens rows named in Step 1, and `"in_scope": false` to every other row. All 66 and 111 rows keep their existing keys and values.

Do this with a script rather than by hand — 177 hand edits is where a typo'd slug hides. Something in this shape, run from the worktree root:

```bash
python3 - <<'PY'
import json

SETS = {
  "priv/seed_data/bronx_roster.json": {
    "belmont","mott-haven","riverdale","city-island","fordham-heights",
    "kingsbridge","pelham-bay","throgs-neck","concourse","woodlawn",
    "morris-park","bronx-park","hunts-point","van-cortlandt-park",
  },
  "priv/seed_data/queens_roster.json": {
    "astoria","long-island-city","ditmars-steinway","flushing",
    "jackson-heights","elmhurst","corona","sunnyside","woodside",
    "forest-hills","rego-park","kew-gardens","ridgewood","glendale",
    "maspeth","richmond-hill","jamaica","bayside","douglaston",
    "rockaway-beach","far-rockaway",
  },
}

for path, want in SETS.items():
    r = json.load(open(path))
    slugs = {n["slug"] for n in r["neighborhoods"]}
    missing = want - slugs
    assert not missing, f"{path}: in-scope slugs not in roster: {sorted(missing)}"
    for n in r["neighborhoods"]:
        n["in_scope"] = n["slug"] in want
    json.dump(r, open(path, "w"), indent=2, ensure_ascii=False)
    open(path, "a").write("\n")
    print(path, "rows:", len(r["neighborhoods"]),
          "in_scope:", sum(1 for n in r["neighborhoods"] if n["in_scope"]))
PY
```

The `assert not missing` line is the point of scripting it: a slug that does not exist in the roster fails loudly instead of silently flagging nothing.

**Check the diff before committing.** `json.dump` with `indent=2` may reformat rows that were previously one-per-line. If the diff is larger than 177 changed lines plus the key additions, the reformat has obscured the change — regenerate preserving the original layout, or hand-verify the reformat is faithful.

- [ ] **Step 5: Run the tests to verify they pass**

Run: `mix test test/ethos/seeds/bronx_roster_test.exs test/ethos/seeds/queens_roster_test.exs`

Expected: PASS. Bronx 8 tests, Queens 11 tests, 0 failures.

- [ ] **Step 6: Prove the scope-pin can fail**

Temporarily flip one out-of-scope row to `"in_scope": true` — `van-cortlandt-village` in the Bronx roster is a good choice, since its name is close enough to an in-scope slug to be a realistic mistake. Re-run:

Run: `mix test test/ethos/seeds/bronx_roster_test.exs`

Expected: `"exactly the committed in-scope neighborhoods are flagged"` FAILS, naming `van-cortlandt-village` under "flagged but not committed". **Revert and re-run to confirm green.**

Report the exact failure text. This assertion is the only thing standing between a silent scope change and nobody noticing, so a version of it that has never fired is not one anybody has checked.

- [ ] **Step 7: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 642 baseline + 6 new, 0 failures, 31 excluded.

- [ ] **Step 8: Commit**

```bash
git add priv/seed_data/bronx_roster.json priv/seed_data/queens_roster.json \
        test/ethos/seeds/bronx_roster_test.exs test/ethos/seeds/queens_roster_test.exs
git commit -m "Flag 35 of 177 rostered neighborhoods as in scope

A flag, not a trim: all 177 rows stay, so the roster remains the record of
what each borough contains and the flag records what this programme
committed to. A later expansion flips booleans rather than re-deriving the
neighborhood list.

The dispatch-key assertions go from four keys to five and stay exact — the
'and no others' property is why they exist, and loosening them to a subset
check would let a misspelled key through silently."
```

---

### Task 2: The gates

**Files:**
- Modify: `test/ethos/seeds/bronx_seed_data_test.exs` — roster equality at `:839`, its comment, and the moduledoc's tag schedule at `:10-24`
- Modify: `test/ethos/seeds/queens_seed_data_test.exs` — roster equality at `:978`, and the moduledoc's tag schedule at `:47-55`
- Modify: `test/test_helper.exs` — the tag-removal comment

**Interfaces:**
- Consumes: `in_scope` on every roster row, from Task 1.
- Produces: nothing consumed by a later task.

**Context — what you are changing and what you are not:**

Each gate has a `@tag :pending_*` test named `"the shipped <borough> corpus matches the roster exactly"`. It builds `expected` from every roster slug and asserts `MapSet.equal?(shipped, expected)`. Under the narrowed scope that can never pass.

**Both `@marquee_institutions` lists ship UNCHANGED.** All ten institutions were verified to sit in in-scope neighborhoods — the spec carries the table. Do not touch them.

**The Bronx gate's roster-equality test carries a comment recommending the wrong fix:**

> If a future roster entry is deliberately omitted — a neighborhood that cannot clear the orientation floor is omitted rather than stubbed — relax this to a one-directional difference check and record the omission and its reason in the wave report.

Do not take that route, and do not leave the comment recommending it. A one-directional check loses truncated-corpus detection — and the same comment says two paragraphs earlier that "deleting a seed file passes every other check in this file", which is precisely what that detection is for.

- [ ] **Step 1: Write the failing test**

Add to `test/ethos/seeds/bronx_seed_data_test.exs`, NOT tagged — it must run today:

```elixir
  # The narrowed-scope gate's own guard. The roster-equality test below is
  # tagged and dark until the last in-scope neighborhood ships, so nothing
  # would otherwise notice if `expected` silently reverted to the full roster
  # — every in-scope file would still be present and the set would just be
  # bigger. This asserts the subset is what the gate measures, today.
  test "roster equality is scoped to in-scope neighborhoods, not the whole roster" do
    roster = @roster_path |> File.read!() |> Jason.decode!()

    all = roster["neighborhoods"] |> Enum.map(& &1["slug"]) |> MapSet.new()
    scoped = roster["neighborhoods"] |> Enum.filter(& &1["in_scope"]) |> Enum.map(& &1["slug"]) |> MapSet.new()

    assert MapSet.size(scoped) > 0, "no neighborhood is in scope"

    assert MapSet.size(scoped) < MapSet.size(all),
           "the in-scope set is the whole roster — either the narrowing was reverted " <>
             "or the flag is not being read"
  end
```

Add the identical test to `test/ethos/seeds/queens_seed_data_test.exs`.

- [ ] **Step 2: Run the tests to verify they pass**

Run: `mix test test/ethos/seeds/bronx_seed_data_test.exs test/ethos/seeds/queens_seed_data_test.exs`

Expected: PASS. These assert a property of the roster that Task 1 already established, so they are green immediately. That is correct — they exist to catch a *future* revert, not to drive this change.

The Queens file is whole-module excluded (`@moduletag :pending_queens`), so its copy will report as excluded rather than passing. That is expected; it becomes live with the first Queens seed file.

- [ ] **Step 3: Re-point the Bronx roster equality**

In `test/ethos/seeds/bronx_seed_data_test.exs`, inside `"the shipped bronx corpus matches the roster exactly"`, change:

```elixir
    expected = roster["neighborhoods"] |> Enum.map(& &1["slug"]) |> MapSet.new()
```

to:

```elixir
    expected =
      roster["neighborhoods"]
      |> Enum.filter(& &1["in_scope"])
      |> Enum.map(& &1["slug"])
      |> MapSet.new()
```

Rename the test to `"the shipped bronx corpus matches the in-scope roster exactly"`.

The existing non-vacuity assertion (`MapSet.size(expected) > 0`) still holds and must stay — update its message from "the bronx roster names no neighborhoods" to "no bronx neighborhood is in scope", which is now the failure it actually describes.

- [ ] **Step 4: Replace the misleading comment**

In the same test, replace the paragraph beginning "If a future roster entry is deliberately omitted" with:

```elixir
    # Scoped to in-scope rows. The programme narrowed to 14 Bronx
    # neighborhoods on 2026-08-31 when search exhaustion dropped per-
    # neighborhood yield from 40 places to 9; the other 52 keep their roster
    # rows and their `in_scope: false`.
    #
    # An earlier version of this comment recommended relaxing this to a
    # one-directional difference check if entries were ever omitted. Do NOT.
    # One direction loses the truncated-corpus detection this test exists for
    # — see the paragraph above: "deleting a seed file passes every other
    # check in this file". Equality against the in-scope subset keeps both
    # directions over the set actually committed to, which is strictly
    # stronger than the relaxation.
```

- [ ] **Step 5: Re-point the Queens roster equality**

Apply Steps 3 and 4's equivalent to `test/ethos/seeds/queens_seed_data_test.exs`, inside `"the shipped queens corpus matches the roster exactly"`. Rename it to `"the shipped queens corpus matches the in-scope roster exactly"`, filter `expected` on `in_scope`, and update the non-vacuity message.

The Queens gate has no equivalent misleading comment to replace, but add the same scoping note with Queens' numbers: 21 in scope, 90 deferred.

- [ ] **Step 6: Correct the three tag schedules**

Three places describe a removal condition that is now wrong.

`test/ethos/seeds/bronx_seed_data_test.exs`'s moduledoc says Task 5 "completes the last wave". Replace that bullet with:

```
  * **The last in-scope wave** — 14 neighborhoods, not the full 66 — deletes
    those two `@tag` lines and the `:pending_bronx` entry in
    `test/test_helper.exs`. The programme narrowed on 2026-08-31; see
    docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md.
```

`test/ethos/seeds/queens_seed_data_test.exs`'s moduledoc says "The final wave deletes the two remaining `@tag :pending_queens` lines". Replace "The final wave" with "The last in-scope wave — 21 neighborhoods, not the full 111 —" and add the same spec reference.

`test/test_helper.exs`'s comment describes the same schedules. Correct both mentions.

A tag whose removal condition is unreachable is a tag that never comes off, and both gates' roster-equality and marquee assertions stay dark forever. That is what these three edits prevent.

- [ ] **Step 7: Prove the re-pointed gate can pass**

The Bronx roster-equality test is `@tag :pending_bronx` and excluded. Run it directly to confirm the re-point works:

Run: `mix test test/ethos/seeds/bronx_seed_data_test.exs --include pending_bronx`

Expected: `"the shipped bronx corpus matches the in-scope roster exactly"` still FAILS — 1 shipped file (`belmont.json`) against 14 in-scope slugs. **Read the failure message** and confirm it lists the 13 unshipped in-scope neighborhoods and NOT the 52 out-of-scope ones. If out-of-scope slugs appear, the filter is not applied.

Report the failure message. This is the check that the re-point actually took.

- [ ] **Step 8: Run the full suite and the formatter**

Run: `mix format && mix test`

Expected: 0 failures.

- [ ] **Step 9: Commit**

```bash
git add test/ethos/seeds/bronx_seed_data_test.exs \
        test/ethos/seeds/queens_seed_data_test.exs test/test_helper.exs
git commit -m "Scope both roster-equality gates to the in-scope subset

Equality, both directions, over the set actually committed to — not the
one-directional relaxation the Bronx gate's own comment recommended. One
direction loses truncated-corpus detection, which that same comment says
two paragraphs earlier is the only reason the test exists. The comment is
replaced rather than left recommending the weaker fix.

Adds an untagged guard to each gate asserting the in-scope set is a proper
subset of the roster. The roster-equality tests are dark until their last
wave ships, so nothing would otherwise notice a silent revert to the full
roster — every in-scope file would still be present and the set would
just be bigger.

Corrects the tag-removal schedules in three files: both moduledocs and
test_helper.exs described completion at 66 and 111 neighborhoods, which
is no longer reachable."
```

---

## Self-Review

**1. Spec coverage.**

| Spec section | Task |
|---|---|
| The 35-neighborhood scope | 1 (Step 1 pins it, Step 4 applies it) |
| A flag, not a trim; all 177 rows stay | 1 (Step 1's "still names the whole borough", Step 4's script) |
| Dispatch-key assertion → five keys | 1 (Step 3) |
| Roster equality → in-scope subset, bidirectional | 2 (Steps 3, 5) |
| Reject the one-directional relaxation, replace the comment | 2 (Step 4) |
| The four Queens roster assertions untouched | Global Constraints; no task touches them |
| Marquee lists unchanged | Global Constraints; Task 2 Context says do not touch |
| Tag lifecycle 14 and 21 | 2 (Step 6) |
| Out-of-scope deferred, not abandoned | 1 (Step 4 writes `false`, Step 1 asserts row count) |

No gaps.

**2. Placeholder scan.** No TBD/TODO, no "similar to Task N". Every assertion and every code block is complete. Line references were read from source before this plan was committed: `bronx_roster_test.exs:13`, `queens_roster_test.exs:18`, `bronx_seed_data_test.exs:839` and its moduledoc at `:10-24`, `queens_seed_data_test.exs:978` and its moduledoc at `:47-55`.

**3. Type consistency.** `in_scope` is a JSON boolean throughout; every filter is `Enum.filter(& &1["in_scope"])` with string-key access, matching how both rosters are already read (`Jason.decode!` without `keys: :atoms`). `@in_scope` is a list of slug strings in both roster tests, compared with `Enum.sort/1` on both sides so ordering never matters.

**Two things I fixed while reviewing:**

- Task 1's key list was initially written as `~w(community_district name slug wave in_scope)`, which fails: the assertion sorts the keys, and `in_scope` sorts *before* `name`. The correct list is `~w(community_district in_scope name slug wave)`. This would have failed immediately rather than silently, but it would have cost the implementer a confusing minute on an assertion that looks obviously right.
- Task 2 originally had no untagged test at all. Both roster-equality tests are excluded until their last wave ships, so a later edit reverting `expected` to the full roster would go unnoticed for months — every in-scope file would still be present, the set would just be bigger, and the only test that could tell is the dark one. The new subset guard runs today and closes that.
