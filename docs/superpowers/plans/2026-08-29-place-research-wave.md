# Place Research Wave Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Research and rewrite 424 thin, photoless, history-less place records, deleting those found closed, using the finder + adversarial verifier apparatus every prior content wave used.

**Architecture:** Four infrastructure tasks land first — the work roster, explicit deletion machinery, `410 Gone` for deleted slugs, and the gate. Then research waves run in parallel across all four regions, with a checkpoint after the first wave per region so the authoring contract can be amended before it reaches ~400 places.

**Tech Stack:** Phoenix 1.7.14 (dead controller views, `~p` sigil, `current_user` — **not** 1.8 scopes, not LiveView), Ecto/Postgres, ExUnit, `Workflow` for the research waves.

**Spec:** `docs/superpowers/specs/2026-08-29-place-research-wave-design.md`

## Global Constraints

- **Zero AI calls and zero external API calls in shipped code.** Research happens at authoring time; nothing shipped reaches the network.
- **`cryptcom@gmail.com` is the only admin user.**
- **The authoring contract binds:** `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`. Verdict-restatement scope, no superlatives or rankings a verifier did not restate, no architectural style, no trip durations, hedged boundary language.
- **There is no minimum word count, anywhere.** Not in the gate, not in a brief. A floor manufactures the boilerplate it is meant to prevent.
- **Inspection records license existence, never description.** They may support a `status` verdict; they may not appear in prose, in any paraphrase.
- **The finder never writes verdicts.** A separate agent adjudicates. This separation collapsed once before and produced a 44-of-44 confirmation rate that had to be thrown out.
- Phoenix 1.7.14 conventions. `mix format` on every file touched; `mix format --check-formatted` passes repo-wide.
- Worktree `/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion`. Never `cd` to `~/dev/ethos`. **Never use bare `git stash`** — the stack is shared with other live sessions; use `git show <ref>:<path>`.
- Baseline: **432 tests, 0 failures**, exactly **1** tolerated compiler warning (Gettext deprecation). Never go down; never add a warning.

## Design refinement since the spec

The spec described a prune that deletes DB places **absent from the seed corpus**, guarded by a floor so a failed directory load could not erase hundreds of records.

**This plan inverts that: deletion is driven by an explicit manifest, never inferred from absence.** `Release.prune_deleted_places/0` deletes exactly the slugs listed in `priv/seed_data/deleted_places.json` and nothing else.

The floor guard then becomes unnecessary rather than merely satisfied — a loader that silently skips a whole directory cannot cause a deletion, because absence is not a signal. That failure mode is real: the dev database is missing all 434 Brooklyn places right now and nothing noticed. An explicit list also gives every deletion an auditable reason, which absence never can.

The cost, accepted: a place removed from a seed file *without* a manifest entry stays in the database forever. Task 4's gate closes that by asserting the manifest and the corpus are disjoint and complete with respect to each other.

---

### Task 1: The bare-place roster

**Files:**
- Create: `priv/seed_data/bare_places_roster.json`
- Create: `lib/mix/tasks/ethos.bare_places.ex`
- Test: `test/ethos/seeds/bare_places_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the roster file — a JSON array of `%{"slug", "name", "kind", "town", "region", "seed_file"}`, 424 entries — which Tasks 5 and 6 batch into waves.

The roster is a **snapshot of the work list**, generated once and committed. It is not a live query: as waves rewrite summaries, places stop being bare, so a test that recomputed the predicate would fail by design the moment work began.

- [ ] **Step 1: Write the generator as a Mix task**

`mix ethos.bare_places` prints the roster JSON to stdout. It must not write the file itself — a generator that overwrites its own committed output invites someone to "refresh" the roster mid-programme and silently drop the places already done.

The predicate, exactly: `summary` under 25 words (whitespace tokens), `photos` empty, `history` nil or empty. Sources are `priv/seed_data/{connecticut,manhattan,brooklyn}/*.json` (the `places` array of each) plus `Ethos.Seeds.ConnecticutPlaces.places/0`.

- [ ] **Step 2: Run it, redirect into the roster file, and check the count**

Run: `mix ethos.bare_places`
Expected: 424 entries. **If the count differs, stop and report it** — do not adjust the predicate to reach 424. The figure comes from a recon and the predicate above is the definition of record.

- [ ] **Step 3: Write the roster test**

```elixir
defmodule Ethos.Seeds.BarePlacesRosterTest do
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  @roster "priv/seed_data/bare_places_roster.json" |> File.read!() |> Jason.decode!()

  test "the roster is a snapshot of real places, without duplicates" do
    slugs = Enum.map(@roster, & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate slugs in the roster"
    assert length(slugs) == 424

    corpus =
      (for f <- SeedDataHelpers.all_seed_files(), p <- DataGuide.load!(f)["places"], do: p["slug"]) ++
        Enum.map(Ethos.Seeds.ConnecticutPlaces.places(), & &1.slug)

    missing = Enum.reject(slugs, &(&1 in corpus))

    assert missing == [],
           "roster names places that are not in the corpus: #{inspect(missing)}"
  end

  test "every roster entry carries the fields a wave dispatch needs" do
    for entry <- @roster do
      for key <- ~w(slug name kind town region seed_file) do
        assert is_binary(entry[key]) and entry[key] != "",
               "roster entry #{inspect(entry["slug"])} is missing #{key}"
      end
    end
  end
end
```

Note what this deliberately does **not** assert: that roster entries are still bare. They will stop being bare, one wave at a time, and that is the programme succeeding.

- [ ] **Step 4: Run the tests**

Run: `mix test test/ethos/seeds/bare_places_roster_test.exs`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add priv/seed_data/bare_places_roster.json lib/mix/tasks/ethos.bare_places.ex test/ethos/seeds/bare_places_roster_test.exs
git commit -m "feat: roster of the 424 bare places"
```

---

### Task 2: The deletion manifest and an explicit prune

**Files:**
- Create: `priv/seed_data/deleted_places.json`
- Create: `lib/ethos/places/deleted_places.ex`
- Modify: `lib/ethos/places.ex`
- Modify: `lib/ethos/release.ex`
- Test: `test/ethos/places/deleted_places_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces:
  - `Ethos.Places.DeletedPlaces.slugs/0` → `MapSet.t(String.t())`, compiled from the manifest.
  - `Ethos.Places.DeletedPlaces.all/0` → the manifest entries as maps.
  - `Ethos.Places.delete_by_slugs!/1` → `{count, nil}`.
  - `Ethos.Release.prune_deleted_places/0` → prints and returns the count deleted.

The manifest ships **empty** (`[]`) in this task. Waves append to it.

- [ ] **Step 1: Write the failing test**

```elixir
defmodule Ethos.Places.DeletedPlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places
  alias Ethos.Places.DeletedPlaces

  test "the manifest compiles into a slug set" do
    assert %MapSet{} = DeletedPlaces.slugs()
  end

  test "every manifest entry carries its evidence" do
    for entry <- DeletedPlaces.all() do
      for key <- ~w(slug name town region deleted_on reason source_url) do
        assert is_binary(entry[key]) and entry[key] != "",
               "manifest entry #{inspect(entry["slug"])} is missing #{key}"
      end
    end
  end

  test "delete_by_slugs!/1 removes exactly the named places" do
    keep = place_attrs("keep-me")
    drop = place_attrs("drop-me")
    Places.upsert_place!(keep)
    Places.upsert_place!(drop)

    assert {1, nil} = Places.delete_by_slugs!(["drop-me"])

    assert Places.get_place_by_slug("keep-me")
    refute Places.get_place_by_slug("drop-me")
  end

  test "delete_by_slugs!/1 on an empty list deletes nothing" do
    Places.upsert_place!(place_attrs("keep-me"))
    assert {0, nil} = Places.delete_by_slugs!([])
    assert Places.get_place_by_slug("keep-me")
  end

  test "a slug that is not present is not an error" do
    assert {0, nil} = Places.delete_by_slugs!(["never-existed"])
  end

  defp place_attrs(slug) do
    %{
      slug: slug,
      name: "Test Place",
      kind: "park",
      town: "Woodbury",
      state: "Connecticut",
      county: "Litchfield County",
      summary: "A park."
    }
  end
end
```

- [ ] **Step 2: Run it, watch it fail**

Run: `mix test test/ethos/places/deleted_places_test.exs`
Expected: FAIL — `Ethos.Places.DeletedPlaces` is not defined.

- [ ] **Step 3: Write the manifest and the module**

`priv/seed_data/deleted_places.json` starts as `[]`.

```elixir
defmodule Ethos.Places.DeletedPlaces do
  @moduledoc """
  Places removed from the corpus because research found them closed.

  Deletion is driven by this list and never inferred from a place's absence
  from the seed files. Inferring it would mean a loader that silently skipped
  a directory could erase hundreds of records — and that failure mode is real,
  not hypothetical.

  The manifest is also the tombstone list: `PlaceController` serves `410 Gone`
  for these slugs, so a search engine drops the URL instead of retrying it.
  """

  @manifest_path Path.join(:code.priv_dir(:ethos), "seed_data/deleted_places.json")
  @external_resource @manifest_path

  @entries @manifest_path |> File.read!() |> Jason.decode!()
  @slugs @entries |> Enum.map(& &1["slug"]) |> MapSet.new()

  @doc "Every manifest entry, with its evidence."
  def all, do: @entries

  @doc "The deleted slugs, for O(1) membership."
  def slugs, do: @slugs

  def deleted?(slug), do: MapSet.member?(@slugs, slug)
end
```

`@external_resource` matters: without it, editing the manifest does not recompile the module and the running app keeps a stale list.

In `lib/ethos/places.ex`:

```elixir
@doc """
Deletes places by slug. Used only by the deletion manifest — never by an
inferred diff against the seed corpus.
"""
def delete_by_slugs!([]), do: {0, nil}

def delete_by_slugs!(slugs) when is_list(slugs) do
  Repo.delete_all(from p in Place, where: p.slug in ^slugs)
end
```

In `lib/ethos/release.ex`, alongside the existing seed functions:

```elixir
def prune_deleted_places do
  start_app()

  slugs = Ethos.Places.DeletedPlaces.slugs() |> MapSet.to_list()
  {count, _} = Ethos.Places.delete_by_slugs!(slugs)

  IO.puts("Pruned #{count} deleted places (manifest lists #{length(slugs)})")
  count
end
```

Print both numbers. A manifest of 30 that prunes 0 means the prune already ran or the slugs never existed — and a single number cannot tell those apart from success.

- [ ] **Step 4: Run it, watch it pass**

Run: `mix test test/ethos/places/deleted_places_test.exs`
Expected: PASS. Check `Release.start_app/0`'s real name in `lib/ethos/release.ex` before writing it.

- [ ] **Step 5: Run the full suite and commit**

```bash
git add priv/seed_data/deleted_places.json lib/ethos/places lib/ethos/places.ex lib/ethos/release.ex test/ethos/places
git commit -m "feat: explicit deletion manifest and prune"
```

---

### Task 3: `410 Gone` for deleted slugs

**Files:**
- Modify: `lib/ethos_web/controllers/place_controller.ex:6-11`
- Test: `test/ethos_web/controllers/place_controller_test.exs`

**Interfaces:**
- Consumes: `Ethos.Places.DeletedPlaces.deleted?/1` (Task 2).
- Produces: nothing downstream.

A deleted place currently 404s, which search engines retry for months. `410 Gone` says the URL is intentionally dead.

- [ ] **Step 1: Write the failing test**

The manifest ships empty, so this test needs a slug in it. **Do not stub the module** — it compiles its list at build time, so a stub tests the stub. Instead assert against a real manifest entry once waves add one, and until then assert the *absence* branch plus the module contract:

```elixir
test "a slug in the deletion manifest serves 410, not 404", %{conn: conn} do
  case Enum.at(Ethos.Places.DeletedPlaces.all(), 0) do
    nil ->
      # The manifest is empty until a research wave finds a closure. Assert the
      # branch is wired rather than skipping: an unknown slug must still 404,
      # and the module must agree it is not deleted.
      refute Ethos.Places.DeletedPlaces.deleted?("nope")
      assert conn |> get(~p"/p/nope") |> response(404)

    entry ->
      assert conn |> get(~p"/p/#{entry["slug"]}") |> response(410)
  end
end
```

- [ ] **Step 2: Run it, watch it pass on the empty branch, then implement**

```elixir
def show(conn, %{"slug" => slug}) do
  case Places.get_place_by_slug(slug) do
    nil ->
      status = if Places.DeletedPlaces.deleted?(slug), do: :gone, else: :not_found

      conn
      |> put_status(status)
      |> put_view(EthosWeb.ErrorHTML)
      |> render(:"#{conn.status}")

    place ->
      # unchanged
  end
end
```

`EthosWeb.ErrorHTML.render/2` falls back to `Phoenix.Controller.status_message_from_template/1`, so `410.html` renders "Gone" with no template needed — verify that rather than assuming it.

- [ ] **Step 3: Verify the deleted place also leaves the sitemap**

`SitemapController` builds place URLs from `Places.list_places()`, a database query — so a pruned place drops out automatically. **Confirm this by reading the controller**, and note it in your report. If it read the seed corpus instead, a deleted place would stay in the sitemap while serving 410, which is a contradiction search engines punish.

- [ ] **Step 4: Run the full suite and commit**

```bash
git add lib/ethos_web/controllers/place_controller.ex test/ethos_web/controllers/place_controller_test.exs
git commit -m "feat: serve 410 Gone for deleted place slugs"
```

---

### Task 4: The gate

**Files:**
- Modify: `test/support/seed_data_helpers.ex`
- Create: `test/ethos/seeds/place_content_gate_test.exs`

**Interfaces:**
- Consumes: `Ethos.Places.DeletedPlaces.slugs/0` (Task 2), `SeedDataHelpers.all_seed_files/0`.
- Produces: the gate every wave in Tasks 5-6 must pass.

- [ ] **Step 1: Write the gate**

```elixir
defmodule Ethos.Seeds.PlaceContentGateTest do
  use ExUnit.Case, async: true

  alias Ethos.Places.DeletedPlaces
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Inspection records may support a `status` verdict. They may never appear in
  # prose — 20 summaries in this corpus read as boilerplate precisely because
  # that rule did not exist when they were written.
  @inspection ~r/inspection record|restaurant inspection|inspection dated/i

  # "A restaurant on Bath Avenue, at number 1806." — a stub wearing a sentence.
  @stub ~r/^A [a-z][a-z -]* (?:on|at) [^,]+,\s*at number \d+\.?$/

  defp corpus do
    json =
      for f <- SeedDataHelpers.all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          do: {p, Path.basename(f)}

    json ++ for(p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {stringify(p), "connecticut_places.ex"})
  end

  defp stringify(map), do: Map.new(map, fn {k, v} -> {to_string(k), v} end)

  test "no summary repeats inspection-record boilerplate" do
    hits =
      for {p, file} <- corpus(),
          text = p["summary"] || "",
          Regex.match?(@inspection, text),
          do: {p["slug"], file}

    assert hits == [], "inspection-record prose in: #{inspect(hits)}"
  end

  test "no summary is a bare address stub" do
    hits =
      for {p, file} <- corpus(),
          text = String.trim(p["summary"] || ""),
          Regex.match?(@stub, text),
          do: {p["slug"], file}

    assert hits == [], "bare address stubs in: #{inspect(hits)}"
  end

  test "every guide entry points at a place that exists" do
    slugs = MapSet.new(for {p, _f} <- corpus(), do: p["slug"])

    orphans =
      for f <- SeedDataHelpers.all_seed_files(),
          e <- DataGuide.load!(f)["entries"] || [],
          slug = e["place_slug"],
          slug not in [nil, ""],
          not MapSet.member?(slugs, slug),
          do: {slug, Path.basename(f)}

    assert orphans == [],
           "guide entries point at places that do not exist: #{inspect(orphans)}"
  end

  test "a deleted place is gone from the corpus, and a corpus place is not marked deleted" do
    slugs = MapSet.new(for {p, _f} <- corpus(), do: p["slug"])
    both = MapSet.intersection(slugs, DeletedPlaces.slugs())

    assert MapSet.size(both) == 0,
           "slugs both live in the corpus and listed as deleted: #{inspect(MapSet.to_list(both))}"
  end
end
```

**Note the deliberate absence:** there is no minimum-word-count assertion, and none may be added. A floor manufactures the boilerplate these two patterns exist to ban.

Watch the comprehension-filter hazard while writing this. In Elixir `text = p["summary"] || ""` used as a comprehension binding is fine, but a bare `text = p["summary"]` would *also* act as a truthiness test and silently drop every place with a nil summary — the exact bug this project shipped once already. Both bindings above default explicitly for that reason.

- [ ] **Step 2: Run it against the current corpus**

Run: `mix test test/ethos/seeds/place_content_gate_test.exs`
Expected: the inspection-boilerplate test **FAILS**, naming roughly 20 places. That is the gate working — those summaries are the known defect. The stub test should name roughly 6.

**Do not fix the content here.** Record the exact failing slugs in your report; the waves in Tasks 5-6 rewrite them. If you cannot land Task 4 with a red suite, mark the two content tests with `@tag :pending_wave` and an `ExUnit.configure(exclude: ...)` entry, and say clearly in your report that they are excluded and must be re-enabled in Task 7.

- [ ] **Step 3: Commit**

```bash
git add test/ethos/seeds/place_content_gate_test.exs test/support/seed_data_helpers.ex
git commit -m "test: gate banning inspection boilerplate and address stubs"
```

---

### Task 5: Wave 1 — one batch per region, the checkpoint

**Files:**
- Modify: seed files under `priv/seed_data/{connecticut,manhattan,brooklyn}/`
- Modify: `priv/seed_data/deleted_places.json` (if closures are found)
- Create: `.superpowers/sdd/<plan>/research/` artifacts (git-ignored)

**Interfaces:**
- Consumes: the roster (Task 1), the manifest (Task 2), the gate (Task 4).
- Produces: the contract amendments Task 6 inherits.

Four batches run in parallel — one town from each of Connecticut, Manhattan, Brooklyn, and the code-defined set. Pick the batch with the **most** bare places in each region, so the checkpoint sees the hardest cases rather than the easiest.

- [ ] **Step 1: Write the wave workflow script**

Two stages per batch, `pipeline`d so a batch verifies as soon as its finder returns:

- **Finder** — researches every bare place in one town. Records, per place: what it found, each fact's source URL, and whether the place is still open in 2026. Writes an artifact. **Never writes verdicts.**
- **Verifier** — an independent agent that tries to *refute*. Issues `confirmed` / `refuted` / `uncertain` per item, plus a `status` verdict of `open` or `closed`. `uncertain` is a real verdict and excludes the item from publication.

Both carry the hard rules verbatim: no trip durations, no superlatives a verdict does not restate, no architectural style, hedged boundary language, and **inspection records may support `open`/`closed` and may never appear in prose**.

- [ ] **Step 2: Run wave 1**

- [ ] **Step 3: Author the seed edits from the verdicts**

A place whose research yields nothing new **keeps its short summary**. That is a pass. Do not pad to reach a length; there is no length to reach.

- [ ] **Step 4: Handle closures**

For each place the verifier ruled `closed`: remove the place from its seed file, remove the guide entry that references it, and append to `deleted_places.json` with `slug`, `name`, `town`, `region`, `deleted_on`, `reason`, `source_url`.

- [ ] **Step 5: Run the gate and the full suite**

- [ ] **Step 6: Checkpoint review — this is the point of Task 5**

Dispatch a fact-fidelity reviewer over wave 1's output. It traces every published claim to a verifier's verdict, checks the four summarising failure modes, and — the reason this checkpoint exists — reports **any contract defect that would compound across the remaining ~400 places.**

Amend the contract before Task 6 begins. Record every amendment in the ledger.

- [ ] **Step 7: Commit**

---

### Task 6: The remaining waves

Same protocol as Task 5, all four regions in parallel, batched by town, running until the roster is exhausted. Per wave: finder → independent verifier → author → gate → fact-fidelity review. A wave is not complete until its review findings are fixed.

- [ ] **Step 1: Batch the remaining roster by town**
- [ ] **Step 2: Run waves to exhaustion, reviewing each**
- [ ] **Step 3: Confirm every roster slug has been through a wave**

Assert this mechanically against the roster rather than tracking it by hand — 424 places across parallel waves is exactly the shape where one town gets skipped silently.

---

### Task 7: Close-out

- [ ] **Step 1: Re-enable any gate test excluded in Task 4, and confirm it passes**
- [ ] **Step 2: Runbook entry for `prune_deleted_places`** in `docs/runbooks/seeding.md`, including where it falls in the sequence and what its two-number output means
- [ ] **Step 3: Record the wave's outcome** — how many rewritten, how many unchanged, how many deleted — in `docs/content-defects.md` or a sibling
- [ ] **Step 4: Full whole-branch review**
- [ ] **Step 5: Stop for deploy authorization**

---

## Self-Review

**Spec coverage.** Authoring contract → Global Constraints + T5/T6 dispatches. No-minimum-word-count → Global Constraints, T4 step 1's explicit note. Inspection-records rule → Global Constraints + T4's `@inspection` pattern. Waves in parallel, batched by guide → T5/T6. Finder/verifier separation → Global Constraints + T5 step 1. Closures deleted → T2, T5 step 4. Prune + guard → T2, refined to an explicit manifest (documented above). Manifest → T2. `410` → T3. Gate → T4. The spec's "one wave per region first" checkpoint → T5 step 6.

**Placeholder scan.** No TBDs. The three places an implementer must determine a value rather than copy one — the roster count in T1 step 2, `Release.start_app/0`'s real name in T2 step 4, and the failing-slug list in T4 step 2 — each say so and say what to do if the value surprises them.

**Type consistency.** `delete_by_slugs!/1` returns `{count, nil}` in both clauses, matching `Repo.delete_all`. `DeletedPlaces.slugs/0` is a `MapSet` in T2, T3 and T4. `deleted?/1` takes a slug string. The roster's six keys are identical in T1's generator, its test, and T5's batching.

**Ordering.** T1 and T2 are independent. T3 consumes T2. T4 consumes T2. T5 consumes all four. T6 consumes T5's amendments — that dependency is the whole point of the checkpoint and must not be parallelised away.
