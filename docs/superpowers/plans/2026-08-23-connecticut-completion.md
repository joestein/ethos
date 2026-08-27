# Connecticut Completion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a page for every one of Connecticut's 169 towns by adding the 115 not yet covered, using a two-tier format so thin towns get an honest orientation page rather than a padded guide.

**Architecture:** Both tiers are the same `Guide` record, separated by a new stored `tier` column (`"guide"` | `"town-page"`) that the seed JSON declares. A town's tier is decided *after* research from how many places survived adversarial verification — 6 or more earns a full guide. County hubs, search, the `page_links` graph, the sitemap and collections consume guides unchanged; only the rendering template branches.

**Tech Stack:** Phoenix 1.7.14 (`current_user` conventions, NOT 1.8 scopes), Ecto/Postgres, dead controller views, JSON seed files under `priv/seed_data/connecticut/`.

**Spec:** `docs/superpowers/specs/2026-08-23-connecticut-completion-design.md`

## Global Constraints

- **Zero AI or external API calls in shipped code.** Guides are static seed data. This has been the binding constraint on every build in this repo.
- **Every published claim must trace to a verified research item.** Refuted items are excluded or corrected exactly as the verifier stated; uncertain places and lodging are excluded; uncertain history facts survive only if reworded to drop the disputed specific.
- **`nearby` means the two towns share a border.** Towns that are close but have another town between them are `same-region`. When unsure, use `same-region`.
- **No claim about where a named rail service runs** unless that town's own research states it. No invented stations. This was the critical finding in four of seven waves of the previous build.
- **No drive times anywhere.** Proximity is stated in checkable terms: "borders Canterbury", "12 miles north of Norwich on Route 97".
- **Place slugs and photo labels are globally unique** across `priv/seed_data/connecticut/*.json`, `priv/seed_data/manhattan/*.json`, and `lib/ethos/seeds/connecticut_places.ex`.
- **Photo licences** limited to `Public domain`, `CC0`, `CC BY x.x`, `CC BY-SA x.x`; author and licence copied verbatim; `source_url` is the Commons file page.
- **A dropped fact must be dropped everywhere** — intro, section, FAQ, place summary and link note each restate the same material, often in different words. Re-grep after every removal.
- Full `mix test` green before every commit.

---

### Task 1: The `tier` column and its seed path

**Files:**
- Create: `priv/repo/migrations/20260823130000_add_tier_to_guides.exs`
- Modify: `lib/ethos/guides/guide.ex` (schema + `changeset/2`)
- Modify: `lib/ethos/seeds/guide_runner.ex` (pass `tier` through)
- Modify: `lib/ethos/seeds/data_guide.ex` (read + validate `tier`)
- Create: `test/support/fixtures/seed_data/townville.json`
- Test: `test/ethos/seeds/data_guide_test.exs`

**Interfaces:**
- Produces: `Guide.tier` — a string, `"guide"` or `"town-page"`, defaulting to `"guide"`. Seed JSON declares it at `data["guide"]["tier"]`; omitting it means `"guide"`. `DataGuide.load!/1` raises `ArgumentError` prefixed with the file path on any other value.

- [ ] **Step 1: Write the failing test**

Add to `test/ethos/seeds/data_guide_test.exs`:

```elixir
  @townville Path.join(@fixtures, "townville.json")

  test "tier defaults to guide and is read from the seed file" do
    user = user_fixture()

    guide = DataGuide.upsert_from_file!(@testville, user.email)
    assert guide.tier == "guide"

    town = DataGuide.upsert_from_file!(@townville, user.email)
    assert town.tier == "town-page"
  end

  test "an unknown tier raises with the file path" do
    bad = Path.join(System.tmp_dir!(), "bad-tier-seed.json")

    File.write!(
      bad,
      ~s({"guide": {"slug": "bad-tier-guide", "title": "Bad", "destination": "Bad, Connecticut", "state": "Connecticut", "county": "Windham County", "intro": "x", "tier": "leaflet", "sections": [], "faq": [], "photos": []}, "places": [], "entries": []})
    )

    assert_raise ArgumentError, ~r/bad-tier-seed\.json.*leaflet/s, fn -> DataGuide.load!(bad) end
  end
```

Create the fixture `test/support/fixtures/seed_data/townville.json`:

```json
{
  "guide": {
    "slug": "townville-ct-travel-guide",
    "title": "Townville, Connecticut: A Fixture Town",
    "destination": "Townville, Connecticut",
    "state": "Connecticut",
    "county": "Windham County",
    "tier": "town-page",
    "intro": "A fixture orientation page used by the seed tests.",
    "sections": [{"heading": "Getting there", "body": "Route 1."}],
    "faq": [{"question": "How do I get to Townville?", "answer": "Route 1."}],
    "photos": []
  },
  "places": [
    {
      "slug": "townville-green",
      "name": "Townville Green",
      "kind": "park",
      "town": "Townville",
      "state": "Connecticut",
      "county": "Windham County",
      "summary": "The town green.",
      "status": "open",
      "photos": []
    }
  ],
  "entries": [
    {"kind": "sight", "name": "Townville Green", "place_slug": "townville-green", "note": "The green."}
  ],
  "links": []
}
```

- [ ] **Step 2: Run the tests to verify they fail**

Run: `mix test test/ethos/seeds/data_guide_test.exs`
Expected: FAIL — `key :tier not found` on the `Guide` struct.

- [ ] **Step 3: Write the migration**

`priv/repo/migrations/20260823130000_add_tier_to_guides.exs`:

```elixir
defmodule Ethos.Repo.Migrations.AddTierToGuides do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :tier, :string, null: false, default: "guide"
    end

    create constraint(:guides, :guides_tier_check, check: "tier in ('guide', 'town-page')")
  end
end
```

- [ ] **Step 4: Add the field and cast it**

In `lib/ethos/guides/guide.ex`, add to the schema next to `:status`:

```elixir
    field :tier, :string, default: "guide"
```

and change `changeset/2` to cast and validate it:

```elixir
  @tiers ~w(guide town-page)

  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:title, :destination, :starts_on, :ends_on, :state, :county, :tier])
    |> validate_required([:title, :destination])
    |> validate_length(:title, max: 120)
    |> validate_inclusion(:tier, @tiers)
    |> maybe_put_slug()
    |> put_destination_slug()
    |> put_geo_slugs()
    |> unique_constraint(:slug)
  end
```

- [ ] **Step 5: Pass tier through the runner**

In `lib/ethos/seeds/guide_runner.ex`, inside `upsert!/2`, add `"tier"` to the map passed to `Guide.changeset/2`:

```elixir
          |> Guide.changeset(%{
            "title" => data.title,
            "destination" => data.destination,
            "state" => data.state,
            "county" => data.county,
            "tier" => Map.get(data, :tier, "guide")
          })
```

- [ ] **Step 6: Read and validate tier in DataGuide**

In `lib/ethos/seeds/data_guide.ex`, add `tier:` to `runner_data` inside `upsert_guide!/2`:

```elixir
      tier: g["tier"] || "guide",
```

and add this clause to `validate_shape!/2`, inside the existing `cond`, immediately before the final `true -> :ok`:

```elixir
      not is_nil(guide["tier"]) and guide["tier"] not in ["guide", "town-page"] ->
        raise ArgumentError,
              "#{path}: bad tier #{inspect(guide["tier"])} (want \"guide\" or \"town-page\")"
```

- [ ] **Step 7: Run the tests to verify they pass**

Run: `mix ecto.migrate && mix test test/ethos/seeds/data_guide_test.exs`
Expected: PASS, 10 tests.

- [ ] **Step 8: Run the full suite**

Run: `mix test`
Expected: PASS — no existing test asserts on a guide's full field set, so the new column is additive.

- [ ] **Step 9: Commit**

```bash
mix format
git add priv/repo/migrations lib/ethos/guides/guide.ex lib/ethos/seeds test/ethos/seeds/data_guide_test.exs test/support/fixtures/seed_data/townville.json
git commit -m "feat: guides carry a tier, seeded from the JSON that declares it"
```

---

### Task 2: Orientation-page rendering and hub grouping

**Files:**
- Create: `lib/ethos_web/controllers/guide_html/town_page.html.heex`
- Modify: `lib/ethos_web/controllers/guide_controller.ex:44` (the `render/3` call)
- Modify: `lib/ethos_web/controllers/destination_controller.ex:82` (county assigns)
- Modify: `lib/ethos_web/controllers/destination_html/county.html.heex`
- Test: `test/ethos_web/controllers/guide_controller_test.exs`, `test/ethos_web/controllers/destination_controller_test.exs`

**Interfaces:**
- Consumes: `Guide.tier` from Task 1.
- Produces: the county hub assigns `:guides` (full guides only) and `:town_pages` (orientation pages), both already sorted by the context function.

- [ ] **Step 1: Write the failing tests**

Add to `test/ethos_web/controllers/guide_controller_test.exs`:

```elixir
  test "an orientation page renders the leaner template", %{conn: conn} do
    user = user_fixture()

    guide =
      Ethos.Seeds.DataGuide.upsert_from_file!(
        Path.expand("../../support/fixtures/seed_data/townville.json", __DIR__),
        user.email
      )

    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert html =~ "What&#39;s here"
    assert html =~ "Orientation"
    refute html =~ "Explore tours"
  end
```

Add to `test/ethos_web/controllers/destination_controller_test.exs`:

```elixir
  test "a county hub lists full guides above orientation pages", %{conn: conn} do
    user = user_fixture()
    fixtures = Path.expand("../../support/fixtures/seed_data", __DIR__)

    Ethos.Seeds.DataGuide.upsert_from_file!(Path.join(fixtures, "townville.json"), user.email)

    html = conn |> get(~p"/destinations/connecticut/windham-county") |> html_response(200)

    assert html =~ "Orientation pages"
    assert html =~ "Townville"
  end
```

- [ ] **Step 2: Run them to verify they fail**

Run: `mix test test/ethos_web/controllers/guide_controller_test.exs test/ethos_web/controllers/destination_controller_test.exs`
Expected: FAIL — the guide renders the full template (so "Explore tours" is present), and the county hub has no "Orientation pages" heading.

- [ ] **Step 3: Branch the controller on tier**

In `lib/ethos_web/controllers/guide_controller.ex`, change the `render(conn, :show,` line in `show/2` to:

```elixir
    render(conn, template_for(guide),
```

and add this private function immediately after `show/2`:

```elixir
  defp template_for(%Guide{tier: "town-page"}), do: :town_page
  defp template_for(%Guide{}), do: :show
```

- [ ] **Step 4: Write the orientation template**

`lib/ethos_web/controllers/guide_html/town_page.html.heex`:

```heex
<article class="mx-auto max-w-2xl px-4 py-10">
  <header>
    <p class="text-xs font-semibold uppercase tracking-wide text-zinc-500">Orientation</p>
    <h1 class="mt-1 text-3xl font-bold">{@guide.title}</h1>
    <p class="mt-1 text-zinc-500">{@guide.destination}</p>
  </header>

  <section :if={(@guide.photos || []) != []} class="mt-6">
    <img
      src={hd(@guide.photos)["src"]}
      alt={hd(@guide.photos)["title"]}
      loading="lazy"
      class="w-full rounded-xl object-cover"
    />
  </section>

  <div :if={@guide.intro} class="prose mt-6">{EthosWeb.Markdown.render(@guide.intro)}</div>

  <section :for={section <- @guide.sections || []} class="mt-10">
    <h2 class="font-semibold">{section["heading"]}</h2>
    <div class="prose mt-2">{EthosWeb.Markdown.render(section["body"])}</div>
  </section>

  <section :if={@entries != []} class="mt-10">
    <h2 class="font-semibold">What's here</h2>
    <ul class="mt-3 space-y-3">
      <li :for={entry <- @entries} class="rounded-xl border p-4">
        <.link
          :if={entry.place}
          navigate={~p"/p/#{entry.place.slug}"}
          class="font-semibold hover:underline"
        >
          {entry.name}
        </.link>
        <span :if={is_nil(entry.place)} class="font-semibold">{entry.name}</span>
        <p :if={entry.note} class="mt-1 text-sm text-zinc-600">{entry.note}</p>
      </li>
    </ul>
  </section>

  <section :if={(@guide.faq || []) != []} class="mt-10">
    <h2 class="font-semibold">Questions</h2>
    <div class="mt-3 space-y-4">
      <div :for={item <- @guide.faq}>
        <p class="font-medium">{item["question"]}</p>
        <p class="text-sm text-zinc-600">{item["answer"]}</p>
      </div>
    </div>
  </section>

  <EthosWeb.ConnectedPages.connected_pages connected={@connected} />
</article>
```

- [ ] **Step 5: Split the county hub**

In `lib/ethos_web/controllers/destination_controller.ex`, inside `county/2`, replace the `guides: guides,` assign with:

```elixir
          guides: Enum.filter(guides, &(&1.tier == "guide")),
          town_pages: Enum.filter(guides, &(&1.tier == "town-page")),
```

Then in `lib/ethos_web/controllers/destination_html/county.html.heex`, replace the `<ul>` block with:

```heex
  <ul :if={@guides != []} class="mt-6 space-y-3">
    <li :for={g <- @guides} class="rounded-xl border p-4">
      <.link navigate={~p"/g/#{g.slug}"} class="font-semibold hover:underline">{g.title}</.link>
      <p class="text-sm text-zinc-500">{g.destination}</p>
    </li>
  </ul>

  <section :if={@town_pages != []} class="mt-10">
    <h2 class="font-semibold">Orientation pages</h2>
    <p class="text-sm text-zinc-500">
      Smaller towns — history, how to get there, and what's nearby.
    </p>
    <ul class="mt-3 space-y-2">
      <li :for={g <- @town_pages} class="rounded-lg border p-3">
        <.link navigate={~p"/g/#{g.slug}"} class="font-medium hover:underline">
          {g.destination |> String.split(",") |> List.first()}
        </.link>
      </li>
    </ul>
  </section>
```

- [ ] **Step 6: Run the tests to verify they pass**

Run: `mix test test/ethos_web/controllers/guide_controller_test.exs test/ethos_web/controllers/destination_controller_test.exs`
Expected: PASS.

- [ ] **Step 7: Run the full suite and commit**

```bash
mix test
mix format
git add lib/ethos_web test/ethos_web
git commit -m "feat: orientation pages render leaner and group separately on county hubs"
```

---

### Task 3: Extend the authoring contract and the validation gate

**Files:**
- Modify: `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`
- Modify: `test/ethos/seeds/connecticut_seed_data_test.exs`

**Interfaces:**
- Consumes: `Guide.tier` from Task 1.
- Produces: the rules every content wave (Tasks 4-10) is bound by, and the gate that enforces them.

- [ ] **Step 1: Write the failing assertions**

Add to the big test in `test/ethos/seeds/connecticut_seed_data_test.exs`, immediately after the licence loop:

```elixir
    # Tier invariants: the tier a file declares must match the evidence it ships.
    tier_violations =
      for f <- files,
          data = DataGuide.load!(f),
          tier = data["guide"]["tier"] || "guide",
          n = length(data["places"]),
          violation =
            cond do
              tier == "guide" and n < 6 -> "full guide with only #{n} places"
              tier == "town-page" and n >= 6 -> "town-page with #{n} places — should be a guide"
              true -> nil
            end,
          not is_nil(violation),
          do: {Path.basename(f), violation}

    assert tier_violations == [], "tier does not match place count: #{inspect(tier_violations)}"

    # The floor an orientation page must clear, or it should not have shipped.
    floor_violations =
      for f <- files,
          data = DataGuide.load!(f),
          (data["guide"]["tier"] || "guide") == "town-page",
          words = data["guide"]["intro"] |> String.split(~r/\s+/, trim: true) |> length(),
          links = length(data["links"] || []),
          violation =
            cond do
              words < 90 -> "intro is #{words} words, floor is 90"
              links < 3 -> "only #{links} outbound links, floor is 3"
              true -> nil
            end,
          not is_nil(violation),
          do: {Path.basename(f), violation}

    assert floor_violations == [],
           "orientation pages below the floor: #{inspect(floor_violations)}"
```

- [ ] **Step 2: Prove the assertions are not vacuous**

The 50 files on disk are all full guides, so both comprehensions currently produce empty lists for reasons that have nothing to do with the assertion working. Temporarily set `"tier": "town-page"` in `priv/seed_data/connecticut/hartford.json`, run the test, and confirm it fails with `town-page with 9 places — should be a guide`. Then revert the file.

Run: `mix test test/ethos/seeds/connecticut_seed_data_test.exs`
Expected: FAIL while the edit is in place, PASS after reverting.

- [ ] **Step 3: Extend the rules document**

Append this section to `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`:

```markdown
## Tiers (Connecticut completion onward)

Every seed file declares `"tier"` inside its `guide` object: `"guide"` or
`"town-page"`. Omitting it means `"guide"`.

**The tier is decided by the research, after verdict filtering — never by the
town's reputation beforehand.** Count the places that survive filtering:

- **6 or more → `"guide"`.** The full format, exactly as specified above.
- **Fewer than 6 → `"town-page"`.** The orientation format below.

Record the surviving count and the resulting tier in your report so the
reviewer can check the call rather than take it on trust. A town nobody
expects much from can earn a full guide; a well-known town whose listings
will not verify does not get padded into one.

### The orientation format

- **Intro**: 90-130 words, history-forward, from verified `history_facts` only.
- **Sections**: a "Getting there" section, from the research's `getting_there`
  data. Optional second section only where the research genuinely supports one.
- **Entries and places**: every verified place, however few. If a town yields
  ZERO verified places, ship `"places": []` and `"entries": []` — the template
  omits the section rather than rendering it empty.
- **FAQ**: 2-3 entries, one of which is "How do I get to {Town}?".
- **Photos**: one if a free-licensed candidate exists for that town, otherwise
  `"photos": []`. Do not reach for a loosely-related image.
- **Links**: at least 3, and this is a floor the validation test enforces.

### The floor — what does not ship

An orientation page must clear BOTH:

- an intro of at least 90 words of real, town-specific history, and
- at least 3 outbound links to neighbouring covered towns.

A town that cannot clear the floor is **omitted**, and the omission is recorded
in your wave report with the reason. Never ship a stub to fill the roster.

### Proximity language

No drive times, ever — nothing in the research supports them. State proximity
in checkable terms only: "borders Canterbury", "12 miles north of Norwich on
Route 97". Distances and roads come from the research like any other fact.
```

- [ ] **Step 4: Run the suite and commit**

```bash
mix test
mix format
git add docs/superpowers/plans/2026-08-23-connecticut-content-rules.md test/ethos/seeds/connecticut_seed_data_test.exs
git commit -m "feat: tier and orientation-page rules, enforced by the validation gate"
```

---

## Content waves (Tasks 4-10)

Each wave task below has its own heading so `scripts/task-brief` can extract it
— the previous build used one combined heading and every brief had to be
hand-written as a result.

Every wave follows the same shape, so it is written once here and referenced by
each task rather than repeated:

**Research inputs.** The controller runs the two-agent research workflow per
town before dispatching the wave, and persists artifacts to
`scratchpad/research/connecticut/{slug}.json` plus a per-wave photo artifact at
`scratchpad/research/connecticut/photos-completion-wave{N}.json`. The exact
absolute scratchpad path is given in each dispatch.

**Steps for every wave task:**

- [ ] **Step 1:** Read `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md` in full, including the Tiers section.
- [ ] **Step 2:** Read every research artifact for the wave's towns, and the wave's photo artifact.
- [ ] **Step 3:** For each town, verdict-filter first, then count surviving places and set `"tier"` accordingly (6+ → `"guide"`, else `"town-page"`).
- [ ] **Step 4:** Author each seed file at `priv/seed_data/connecticut/{slug}.json` in the format its tier requires.
- [ ] **Step 5:** Validate: `mix test test/ethos/seeds/connecticut_seed_data_test.exs`, then full `mix test`. Both green.
- [ ] **Step 6:** Write the report to the dispatch's report path, including per town: items dropped and why, the surviving place count, the resulting tier, intro word count, any town omitted for failing the floor, and the complete photo download-pair list (`{town_slug}/{label} → direct_image_url`, plus author, licence and Commons file page).
- [ ] **Step 7:** Commit with the wave's commit message.

**Link rules for every wave.** Safe targets are this wave's towns, all
previously committed Connecticut towns, the CT-5
(`{waterbury,danbury,middlebury,southbury,woodbury}-ct-travel-guide`), and
Manhattan guides. Never a town from a later wave. `nearby` requires a shared
border; the dispatch names the qualifying pairs it has verified, and everything
else is `same-region`.

---

### Task 4: Wave 1 — Tolland and Windham counties (21 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for each town below.

| Town | County |
|---|---|
| Andover, Bolton, Columbia, Ellington, Hebron, Somers, Stafford, Tolland, Union, Willington | Tolland County |
| Ashford, Brooklyn, Chaplin, Eastford, Hampton, Killingly, Plainfield, Scotland, Sterling, Thompson, Windham | Windham County |

Guide slugs `{basename}-ct-travel-guide`; state `"Connecticut"`.

This wave is deliberately first: it is the thinnest visitor material in the
state, so it is the real test of the orientation format. Expect most of these
21 to land as `"town-page"`. That is the design working.

Watch the homonyms: **Windham** (the town) is distinct from Willimantic (a
borough within it) and from South Windham; **Killingly** is not Killingworth
(Middlesex, Task 5).

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 1 (Tolland and Windham counties)`

---

### Task 5: Wave 2 — Middlesex County (9 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Cromwell, Deep River, Durham, East Hampton, Haddam, Killingworth, Middlefield, Portland, Westbrook. County `"Middlesex County"` for all nine.

Westbrook sits on the shoreline between Clinton and Old Saybrook, both already
covered — it is a genuine `nearby` on both sides. Deep River sits between Essex
and Chester, which is why those two were retagged `same-region` in the previous
build; Deep River is `nearby` to both.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 2 (Middlesex County)`

---

### Task 6: Wave 3 — New London County (14 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Bozrah, Colchester, East Lyme, Franklin, Griswold, Lebanon, Lisbon, Lyme, North Stonington, Preston, Salem, Sprague, Voluntown, Waterford. County `"New London County"` for all fourteen.

Lyme and Old Lyme are different towns and Old Lyme is already covered — keep
their slugs and content strictly separate. North Stonington is likewise distinct
from Stonington.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 3 (New London County)`

---

### Task 7: Wave 4 — Fairfield County (15 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Bethel, Brookfield, Darien, Easton, Monroe, New Canaan, New Fairfield, Newtown, Redding, Shelton, Sherman, Stratford, Trumbull, Weston, Wilton. County `"Fairfield County"` for all fifteen.

Several of these are Metro-North New Haven Line or Danbury Branch towns. Rail
claims are the highest-risk category in this project: state only what the town's
own research states, and never assert where a named service runs unless the
artifact says so. Stratford sits between Milford and Bridgeport, both covered —
it is `nearby` to both, and its arrival makes the existing Milford/Bridgeport
`same-region` edge read correctly.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 4 (Fairfield County)`

---

### Task 8: Wave 5 — New Haven County (17 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Ansonia, Beacon Falls, Bethany, Cheshire, Derby, East Haven, Naugatuck, North Branford, North Haven, Orange, Oxford, Prospect, Seymour, Wallingford, West Haven, Wolcott, Woodbridge. County `"New Haven County"` for all seventeen.

East Haven sits between New Haven and Branford, both covered — its arrival makes
the existing New Haven/Branford `same-region` edge read correctly. North Branford
is a different town from Branford. The Shore Line Trolley Museum's real address
is in East Haven, and Branford's guide already says so honestly — this is the
town that owns that place.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 5 (New Haven County)`

---

### Task 9: Wave 6 — Litchfield County (17 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Barkhamsted, Bethlehem, Bridgewater, Canaan, Colebrook, Goshen, Harwinton, Morris, New Hartford, North Canaan, Plymouth, Sharon, Thomaston, Torrington, Warren, Watertown, Winchester. County `"Litchfield County"` for all seventeen.

**Canaan and North Canaan are two different towns**, and confusingly the village
of Canaan lies inside North Canaan. Keep slugs, places and history strictly
separate, and do not let one town's research bleed into the other's file. New
Hartford is not Hartford. Winchester contains the city of Winsted.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 6 (Litchfield County)`

---

### Task 10: Wave 7 — Hartford County (22 towns)

**Files:** create `priv/seed_data/connecticut/{slug}.json` for: Avon, Berlin, Bloomfield, Bristol, Burlington, Canton, East Granby, East Hartford, East Windsor, Enfield, Granby, Hartland, Manchester, Marlborough, Newington, Plainville, Rocky Hill, Southington, South Windsor, Suffield, Windsor, Windsor Locks. County `"Hartford County"` for all twenty-two.

The largest wave, and the one most likely to produce full guides — Bristol has
the carousel and clock museums, Windsor is the state's oldest town, Manchester
and Enfield are sizeable. Rocky Hill is the other end of the Rocky Hill-Glastonbury
ferry already described in Glastonbury's guide; that is a real `shared-history`
edge if the research supports it. East Granby is not Granby.

- [ ] Follow Steps 1-7 from the "Content waves" section above.
- [ ] Commit: `feat: Connecticut completion wave 7 (Hartford County)`

---

### Task 11: Photos, manifest, and the completed roster

**Files:**
- Modify: `priv/seed_data/connecticut_photo_manifest.json` (regenerated)
- Modify: `priv/static/photos/ct/**` (new optimized images)
- Modify: `test/ethos/seeds/connecticut_seed_data_test.exs` (roster count)

**Interfaces:**
- Consumes: the download-pair lists from all seven wave reports.

- [ ] **Step 1: Download every new source image**

For each pair in the wave reports, fetch the Commons original into
`images/connecticut/{label}.{ext}`. The controller's existing script derives the
URL from each photo's `source_url` and is idempotent; rate-limit to about one
request every three seconds with backoff, because Wikimedia returns HTTP 429 to
faster loops.

- [ ] **Step 2: Regenerate the provenance manifest**

Rebuild `priv/seed_data/connecticut_photo_manifest.json` so every label maps to
its `source_url` and the sha256 of the file on disk. The manifest is what stops
a published author/licence credit from drifting onto a different image.

- [ ] **Step 3: Optimize**

Run: `mix ethos.optimize_connecticut_photos`
Expected: reports `optimized N photos from 165 seed files` and raises on any
label whose bytes do not match the manifest.

- [ ] **Step 4: Update the roster assertion**

In `test/ethos/seeds/connecticut_seed_data_test.exs`, change the file-count
assertion to the real total once every wave has landed:

```elixir
    assert length(files) == 165,
           "expected 165 connecticut seed files, found #{length(files)}"
```

165 = the 50 already shipped plus the 115 added here, minus any town omitted
for failing the floor. If any were omitted, use the actual number and note the
omissions in the commit message.

For the arithmetic: 165 seed files plus the 5 CT-5 code-module guides is 170
guide records, covering all 169 towns plus Mystic. Mystic is a village
straddling Groton and Stonington rather than a town, and Storrs stands in for
the Town of Mansfield — so guides exceed towns by exactly one.

- [ ] **Step 5: Run the full suite and commit**

```bash
mix test
git add priv/seed_data priv/static/photos test/ethos/seeds/connecticut_seed_data_test.exs
git commit -m "feat: photos and provenance manifest for the completed Connecticut roster"
```

---

### Task 12: Rollout (controller only)

**Files:** none — this task deploys and verifies.

- [ ] **Step 1: Merge to main.** This session's worktree is isolated from the shared checkout, so merge via a PR on the remote (`gh pr create` then `gh pr merge --merge`) rather than a local merge.

- [ ] **Step 2: Deploy.** `fly deploy -a ethos --now`

- [ ] **Step 3: Migrate.** The release command runs `/app/bin/migrate` on deploy, which applies the `tier` migration from Task 1. Confirm it ran before seeding.

- [ ] **Step 4: Seed, in this order.** Order matters: links now use replace semantics, so `seed_links` must run last or it will be wiped.

```bash
fly ssh console -a ethos -C '/app/bin/ethos rpc Ethos.Release.seed_connecticut_expansion(~s(cryptcom@gmail.com))'
fly ssh console -a ethos -C '/app/bin/ethos rpc Ethos.Release.seed_collections()'
fly ssh console -a ethos -C '/app/bin/ethos rpc Ethos.Release.seed_links()'
```

Note the `~s()` sigil — `fly ssh console -C` strips double quotes, so a
quoted string argument fails to parse.

- [ ] **Step 5: Verify live.** Every county hub renders with both tiers grouped; a sample full guide and a sample orientation page from each wave return 200; `/sitemap.xml` lists only `ethosguides.com` URLs; `/search` finds a newly added town.

- [ ] **Step 6: Report to the user**, including the tier split (how many full guides versus orientation pages), any towns omitted for failing the floor, and the reminder to resubmit the sitemap in Google Search Console.

---

## Self-review

**Spec coverage.** Two tiers decided by evidence → Task 3 rules plus each wave's Step 3. Orientation page contents → Task 3 rules and Task 2 template. The floor → Task 3 assertions. Data model → Task 1. Rendering and hub grouping → Task 2. Sequencing → Tasks 4-10 in the spec's order. Quality gates → Task 3 plus the per-wave review the executing skill dispatches. Photo provenance → Task 11. Homonym risk → called out by name in Tasks 4, 6, 9 and 10.

**Type consistency.** `tier` is a string everywhere: the migration's column, the schema field, `data["guide"]["tier"]` in the seed JSON, `Map.get(data, :tier, "guide")` in `GuideRunner`, and `%Guide{tier: "town-page"}` in the controller's pattern match. Valid values are exactly `"guide"` and `"town-page"` in all five places, and the database check constraint agrees with `Guide.@tiers` and with `DataGuide.validate_shape!/2`.

**One deliberate omission.** The 165 in Task 11 Step 4 is the arithmetic total; the step says explicitly to use the real number if any town is omitted for failing the floor, since the plan cannot know in advance which towns those are.
