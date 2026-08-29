# Destination Pages Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give all thirteen destination pages a 120-180 word intro and a photograph, so `/destinations/connecticut` and `/destinations/new-york/brooklyn` stop being bare lists of links.

**Architecture:** One new table keyed by URL path, one seed loader, one photo optimizer, three template changes. The record is purely additive — guide lists keep deriving from `GROUP BY` queries, and a destination with no record renders exactly as it does today. Content is synthesized from the committed seed files of each destination's constituent guides; no new research.

**Tech Stack:** Elixir / Phoenix 1.7.14 (`current_user` conventions, dead controller views, **not** 1.8 scopes), Ecto/Postgres, ExUnit, Fly.io deploy.

**Spec:** `docs/superpowers/specs/2026-08-29-destination-pages-design.md`

## Global Constraints

Every task's requirements implicitly include this section.

- **Zero AI calls and zero external API calls in shipped code.**
- **Phoenix 1.7.14 conventions.** `current_user`, dead views, `~p` sigil. No LiveView, no 1.8 scopes.
- **The `Destination` record is additive.** Never change how `Guides.list_states/0` or `Guides.list_counties_for_state/1` build their lists. A page with no record must render exactly as it does today.
- **The thirteen paths are fixed:** `connecticut`, `new-york`, `rome`, `connecticut/{fairfield,hartford,litchfield,middlesex,new-haven,new-london,tolland,windham}-county`, `new-york/brooklyn`, `new-york/manhattan`. They are produced by `Guide.derive_destination_slug/1`; do not invent a slugging rule.
- **Intros are 120-180 words** and contain **nothing that is not in a constituent seed file**. A claim true of one town is not thereby true of its county.
- **No superlatives, rankings or attributions** that the constituent guides do not carry; **no architectural style** unless a guide states it; **no trip durations**; **no exclusivity sentences** — a summary page reaches for "the only" and "the three" by nature.
- **Photo licences** limited to `Public domain`, `CC0`, `CC BY x.y`, `CC BY-SA x.y`; author, licence and Commons file URL copied verbatim.
- Run `mix test` (full suite) before every commit. It is at **351 tests, 0 failures**.
- Run `mix format` on files you touch.

---

## File Structure

**Created:**

| Path | Responsibility |
|---|---|
| `priv/repo/migrations/*_create_destinations.exs` | The table: `path` (unique), `name`, `intro`, `photos`. |
| `lib/ethos/destinations/destination.ex` | Schema and changeset. Validates path shape and photo maps. |
| `lib/ethos/destinations.ex` | Context: `get_by_path/1`, `upsert_destination!/1`, `list_destinations/0`. |
| `lib/ethos/seeds/data_destination.ex` | Loads a seed JSON and upserts it. Mirrors `Ethos.Seeds.DataGuide`. |
| `lib/mix/tasks/ethos.optimize_destination_photos.ex` | Optimizes `images/destinations/` into `priv/photos/destinations/`, verifying manifest provenance via `Ethos.PhotoManifest`. |
| `priv/seed_data/destinations/*.json` × 13 | The content. |
| `priv/seed_data/destination_photo_manifest.json` | Label → Commons file URL + sha256. |
| `test/ethos/seeds/destination_seed_data_test.exs` | The gate. |
| `test/ethos/destinations_test.exs` | Context unit tests. |

**Modified:**

| Path | Change |
|---|---|
| `lib/ethos/release.ex` | Add `seed_destinations/1`. |
| `lib/ethos_web/controllers/destination_controller.ex` | Load the record by path in all four branches; pass it to the view; use its photo as the `page_og` image. |
| `destination_html/{state,county,show}.html.heex` | Intro block and photo above the guide list, guarded on record presence. |
| `docs/runbooks/seeding.md` | Add `seed_destinations` to the order. |

---

## Task 1: The destinations table and context

**Files:**
- Create: `priv/repo/migrations/20260829120000_create_destinations.exs`
- Create: `lib/ethos/destinations/destination.ex`
- Create: `lib/ethos/destinations.ex`
- Test: `test/ethos/destinations_test.exs`

**Interfaces:**
- Produces: `Ethos.Destinations.get_by_path/1` (path string → `%Destination{}` or `nil`), `upsert_destination!/1`, `list_destinations/0`. Tasks 2, 4 and 5 consume these.
- Produces: `%Ethos.Destinations.Destination{path, name, intro, photos}`.

**Context:** Read `lib/ethos/places/place.ex` and `lib/ethos/places.ex` first — this schema and context follow their shape, including the `photos` array-of-maps field and the `upsert_place!/1` pattern.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/destinations_test.exs`:

```elixir
defmodule Ethos.DestinationsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations

  @valid %{
    path: "connecticut/litchfield-county",
    name: "Litchfield County",
    intro: "A county in the northwest corner of the state.",
    photos: []
  }

  test "upsert_destination!/1 creates then updates by path" do
    d = Destinations.upsert_destination!(@valid)
    assert d.path == "connecticut/litchfield-county"
    assert d.name == "Litchfield County"

    updated = Destinations.upsert_destination!(%{@valid | intro: "Revised."})
    assert updated.id == d.id
    assert updated.intro == "Revised."
    assert length(Destinations.list_destinations()) == 1
  end

  test "get_by_path/1 finds a destination and returns nil for an unknown path" do
    Destinations.upsert_destination!(@valid)
    assert %{name: "Litchfield County"} = Destinations.get_by_path("connecticut/litchfield-county")
    assert Destinations.get_by_path("connecticut/nope-county") == nil
  end

  test "path, name and intro are required" do
    for missing <- [:path, :name, :intro] do
      attrs = Map.delete(@valid, missing)

      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(attrs)
      end
    end
  end

  test "path must be lowercase slug segments separated by single slashes" do
    for bad <- ["Connecticut", "new york", "new-york/", "/connecticut", "a//b"] do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(%{@valid | path: bad})
      end
    end

    for good <- ["connecticut", "new-york/brooklyn", "rome"] do
      assert %{path: ^good} = Destinations.upsert_destination!(%{@valid | path: good})
    end
  end
end
```

- [ ] **Step 2: Run it to verify it fails**

Run: `mix test test/ethos/destinations_test.exs`
Expected: FAIL — `Ethos.Destinations` is undefined.

- [ ] **Step 3: Write the migration**

Create `priv/repo/migrations/20260829120000_create_destinations.exs`:

```elixir
defmodule Ethos.Repo.Migrations.CreateDestinations do
  use Ecto.Migration

  def change do
    create table(:destinations) do
      add :path, :string, null: false
      add :name, :string, null: false
      add :intro, :text, null: false
      add :photos, {:array, :map}, null: false, default: []

      timestamps(type: :utc_datetime)
    end

    create unique_index(:destinations, [:path])
  end
end
```

- [ ] **Step 4: Write the schema**

Create `lib/ethos/destinations/destination.ex`. The `path` regex is the invariant that keeps records addressable by the router: one or two lowercase slug segments, no leading or trailing slash, no empty segment.

```elixir
defmodule Ethos.Destinations.Destination do
  @moduledoc """
  Editorial content for a destination page — a state, a county or borough, or a
  standalone town.

  Keyed by `path`, the URL segment(s) after `/destinations/`: "connecticut",
  "new-york/brooklyn", "rome". Destinations come in three shapes, so a
  state_slug/county_slug pair would need a nullable column and a partial unique
  index to express what the router already knows.

  The record is additive. Guide lists are still derived by `Ethos.Guides`; this
  supplies an intro and photos and nothing else.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @path_format ~r{^[a-z0-9]+(-[a-z0-9]+)*(/[a-z0-9]+(-[a-z0-9]+)*)?$}

  schema "destinations" do
    field :path, :string
    field :name, :string
    field :intro, :string
    field :photos, {:array, :map}, default: []

    timestamps(type: :utc_datetime)
  end

  def changeset(destination, attrs) do
    destination
    |> cast(attrs, [:path, :name, :intro, :photos])
    |> validate_required([:path, :name, :intro])
    |> validate_format(:path, @path_format)
    |> unique_constraint(:path)
  end
end
```

- [ ] **Step 5: Write the context**

Create `lib/ethos/destinations.ex`:

```elixir
defmodule Ethos.Destinations do
  @moduledoc """
  Editorial content for destination pages. See `Ethos.Destinations.Destination`
  for why records are keyed by URL path.
  """
  import Ecto.Query, warn: false

  alias Ethos.Destinations.Destination
  alias Ethos.Repo

  def get_by_path(path) when is_binary(path), do: Repo.get_by(Destination, path: path)

  def list_destinations, do: Repo.all(from d in Destination, order_by: [asc: d.path])

  def upsert_destination!(attrs) do
    attrs = Map.new(attrs, fn {k, v} -> {to_string(k), v} end)

    case Repo.get_by(Destination, path: attrs["path"]) do
      nil -> %Destination{}
      existing -> existing
    end
    |> Destination.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
```

- [ ] **Step 6: Run the test to verify it passes**

Run: `mix ecto.migrate && mix test test/ethos/destinations_test.exs`
Expected: PASS, 4 tests.

- [ ] **Step 7: Run the full suite and commit**

Run: `mix test`
Expected: PASS.

```bash
git add priv/repo/migrations lib/ethos/destinations.ex lib/ethos/destinations test/ethos/destinations_test.exs
git commit -m "feat: destinations table for destination-page content"
```

---

## Task 2: Seed loader, release function, photo optimizer

**Files:**
- Create: `lib/ethos/seeds/data_destination.ex`
- Create: `lib/mix/tasks/ethos.optimize_destination_photos.ex`
- Create: `priv/seed_data/destinations/.gitkeep`
- Create: `priv/seed_data/destination_photo_manifest.json` (containing `{}`)
- Modify: `lib/ethos/release.ex`
- Test: `test/ethos/seeds/data_destination_test.exs`

**Interfaces:**
- Consumes: `Ethos.Destinations.upsert_destination!/1` (Task 1), `Ethos.PhotoManifest.verify!/3` (existing).
- Produces: `Ethos.Seeds.DataDestination.load!/1` and `upsert!/1`; `Ethos.Release.seed_destinations/0`; `mix ethos.optimize_destination_photos`.

**Context:** `lib/ethos/seeds/data_guide.ex` is the model for the loader — note its `validate_shape!/2` raising path-prefixed errors. `lib/mix/tasks/ethos.optimize_brooklyn_photos.ex` is the model for the optimizer; it already delegates hashing to `Ethos.PhotoManifest`, so **do not reimplement provenance verification**.

Note `seed_destinations` takes **no email argument** — destinations have no author, unlike guides.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/seeds/data_destination_test.exs`:

```elixir
defmodule Ethos.Seeds.DataDestinationTest do
  use Ethos.DataCase, async: false

  alias Ethos.{Destinations, Seeds.DataDestination}

  @fixture Path.expand("../../support/fixtures/seed_data/destination.json", __DIR__)

  test "loads a seed file and upserts it idempotently" do
    d = DataDestination.upsert!(@fixture)
    assert d.path == "connecticut/litchfield-county"
    assert d.name == "Litchfield County"
    assert String.contains?(d.intro, "northwest")

    DataDestination.upsert!(@fixture)
    assert length(Destinations.list_destinations()) == 1
  end

  test "raises with the file path when a required key is missing" do
    bad = Path.expand("../../support/fixtures/seed_data/destination_missing_intro.json", __DIR__)

    assert_raise ArgumentError, ~r/destination_missing_intro\.json/, fn ->
      DataDestination.load!(bad)
    end
  end
end
```

Create `test/support/fixtures/seed_data/destination.json`:

```json
{
  "path": "connecticut/litchfield-county",
  "name": "Litchfield County",
  "intro": "A county in the northwest corner of the state, where the hills rise toward the Berkshires.",
  "photos": []
}
```

Create `test/support/fixtures/seed_data/destination_missing_intro.json` — the same object with `intro` removed.

- [ ] **Step 2: Run it to verify it fails**

Run: `mix test test/ethos/seeds/data_destination_test.exs`
Expected: FAIL — `Ethos.Seeds.DataDestination` is undefined.

- [ ] **Step 3: Write the loader**

Create `lib/ethos/seeds/data_destination.ex`:

```elixir
defmodule Ethos.Seeds.DataDestination do
  @moduledoc """
  Loads a destination seed file and upserts it. Seed files live in
  `priv/seed_data/destinations/` and are the authoring format for destination
  page content.

  Unlike `Ethos.Seeds.DataGuide` this is single-pass: a destination references
  no places, resolves no links, and has no author.
  """

  alias Ethos.Destinations

  @required ~w(path name intro)

  def upsert!(file), do: file |> load!() |> Destinations.upsert_destination!()

  def load!(path) do
    raw =
      case File.read(path) do
        {:ok, raw} -> raw
        {:error, reason} -> raise ArgumentError, "#{path}: cannot read (#{inspect(reason)})"
      end

    data =
      case Jason.decode(raw) do
        {:ok, data} -> data
        {:error, err} -> raise ArgumentError, "#{path}: invalid JSON — #{Exception.message(err)}"
      end

    validate_shape!(path, data)
    data
  end

  defp validate_shape!(path, data) do
    missing = Enum.filter(@required, &(not is_binary(data[&1]) or data[&1] == ""))

    if missing != [] do
      raise ArgumentError, "#{path}: missing required keys #{inspect(missing)}"
    end

    if not is_list(data["photos"] || []) do
      raise ArgumentError, "#{path}: photos must be a list"
    end

    :ok
  end
end
```

- [ ] **Step 4: Add the release function**

In `lib/ethos/release.ex`, add alongside the other seed functions:

```elixir
  def seed_destinations do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", "destinations", "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    for file <- files do
      d = Ethos.Seeds.DataDestination.upsert!(file)
      IO.puts("Seeded destination: /destinations/#{d.path}")
    end

    IO.puts("Seeded #{length(files)} destinations")
  end
```

- [ ] **Step 5: Create the empty seed directory and manifest**

```bash
mkdir -p priv/seed_data/destinations
touch priv/seed_data/destinations/.gitkeep
printf '{}\n' > priv/seed_data/destination_photo_manifest.json
```

- [ ] **Step 6: Write the photo optimizer**

Create `lib/mix/tasks/ethos.optimize_destination_photos.ex`, modeled on `ethos.optimize_brooklyn_photos.ex`. Differences: it reads `priv/seed_data/destinations/*.json`, photos live only at the top level (there are no places), the source directory is `images/destinations/`, the manifest is `priv/seed_data/destination_photo_manifest.json`, and the expected `src` shape is `/photos/destinations/{dir}/{label}.jpg` where `{dir}` is the destination's `path` with `/` replaced by `-`.

Delegate provenance to `Ethos.PhotoManifest.verify!/3` exactly as the Brooklyn task does. Do not copy its hashing or caching code.

- [ ] **Step 7: Run the tests and commit**

Run: `mix test test/ethos/seeds/data_destination_test.exs`, then `mix test`
Expected: PASS. Then `mix ethos.optimize_destination_photos` should exit with "no seed files matched" — correct, no content yet. Record the output.

```bash
git add lib/ethos/seeds/data_destination.ex lib/mix/tasks/ethos.optimize_destination_photos.ex lib/ethos/release.ex priv/seed_data/destinations priv/seed_data/destination_photo_manifest.json test/
git commit -m "feat: destination seed loader, release function and photo optimizer"
```

---

## Task 3: The validation gate

**Files:**
- Create: `test/ethos/seeds/destination_seed_data_test.exs`
- Create: `test/support/fixtures/seed_data/destination_fixtures/` (three fixtures)

**Interfaces:**
- Consumes: `Ethos.Seeds.DataDestination.load!/1` (Task 2), `Ethos.Guides.list_states/0` and `list_counties_for_state/1` (existing).
- Produces: the gate every content task must keep green.

**Context:** Port `test/ethos/seeds/brooklyn_seed_data_test.exs`. Copy its `collect_strings/2` helper and its **eleven** `@trip_duration_patterns` verbatim — do not re-derive a regex; a subtly weaker pattern is the failure this gate exists to prevent.

**The roster-count assertion is deliberately NOT in this task.** It lands in Task 6. Asserting thirteen files while zero have shipped would leave the suite red for the whole program.

- [ ] **Step 1: Write the fixtures**

Under `test/support/fixtures/seed_data/destination_fixtures/`, each violating exactly one rule:

`trip_duration.json` — a valid destination whose `intro` contains "the shoreline towns are about 40 minutes from Hartford".

`bad_license.json` — a valid destination with one photo whose `"license"` is `"All rights reserved"`.

`short_intro.json` — a valid destination whose `intro` is under 120 words.

Give each a distinct `path` so they cannot collide, and keep them outside `priv/seed_data/destinations/` so they are never seeded or counted.

- [ ] **Step 2: Write the gate**

Create `test/ethos/seeds/destination_seed_data_test.exs`. It must assert, over `priv/seed_data/destinations/*.json`:

1. **Every intro is 120-180 words.**
2. **Every photo licence** is `Public domain`, `CC0`, or matches `~r/^CC BY(-SA)? \d\.\d$/`.
3. **Photo labels are globally unique** and no label stands for two different `source_url`s.
4. **Every referenced photo exists on disk** under `priv/`, both `src` and `thumb`.
5. **Manifest provenance** — `manifest[label]["source_url"]` equals the published `source_url`.
6. **No trip durations**, using the eleven patterns over every string in every file.
7. **Every path resolves to a real destination page.** This is the assertion with no Brooklyn equivalent and the one most likely to catch a real mistake. Build the set of legitimate paths from the guides table — `Guides.list_states/0` gives state slugs, `Guides.list_counties_for_state/1` gives `"#{state}/#{county}"`, and a single-segment path that is not a state must match a published guide's `destination_slug`. Assert every seed file's path is in that set, naming any that is not.

Write each assertion as a helper taking a list of paths (as the Brooklyn gate does) so the fixtures can drive it, then a corpus test that applies all of them to the committed files.

- [ ] **Step 3: Prove each assertion fires**

Add a test per fixture asserting the corresponding helper returns a violation for it. Run and confirm they pass.

Run: `mix test test/ethos/seeds/destination_seed_data_test.exs`
Expected: PASS. The corpus test passes vacuously over zero files — correct until Task 6.

- [ ] **Step 4: Prove the corpus test is not permanently vacuous**

Copy `trip_duration.json` into `priv/seed_data/destinations/`, run the gate, confirm it fails on the duration assertion, then **delete the copy** and confirm `git status` is clean. Record the failure output.

- [ ] **Step 5: Run the full suite and commit**

```bash
git add test/ethos/seeds/destination_seed_data_test.exs test/support/fixtures/seed_data/destination_fixtures
git commit -m "test: destination seed-data gate"
```

---

## Task 4: Rendering

**Files:**
- Modify: `lib/ethos_web/controllers/destination_controller.ex`
- Modify: `lib/ethos_web/controllers/destination_html/state.html.heex`
- Modify: `lib/ethos_web/controllers/destination_html/county.html.heex`
- Modify: `lib/ethos_web/controllers/destination_html/show.html.heex`
- Test: `test/ethos_web/controllers/destination_controller_test.exs`

**Interfaces:**
- Consumes: `Ethos.Destinations.get_by_path/1` (Task 1).

**Context:** The controller has four render paths — `index`, `show`'s state branch (`state_show/3`), `show`'s town branch (`town_show/2`), and `county`. Three of them render a destination that can have a record; `index` cannot. Each already computes a `page_title` and `page_meta_description` and, since 2026-08-29, a `page_og` map with `image: nil`.

**The record is optional.** A page with no record must render byte-identically to today. That is what makes this shippable before any content exists.

- [ ] **Step 1: Write the failing tests**

In `test/ethos_web/controllers/destination_controller_test.exs`, add tests that:
- a state page with a `Destination` record renders its intro text;
- a state page **without** a record renders successfully and shows no intro block;
- a county page with a record renders its intro;
- a record with a photo supplies the `og:image` meta tag.

Use `Ethos.Destinations.upsert_destination!/1` to set up, and match paths to whatever the existing test fixtures produce.

- [ ] **Step 2: Run to verify they fail**

Run: `mix test test/ethos_web/controllers/destination_controller_test.exs`
Expected: FAIL — the intro is not rendered.

- [ ] **Step 3: Load the record in the controller**

In each of `state_show/3`, `town_show/2` and `county/2`, look up the record by the path that branch is rendering — `slug` for a state or town, `"#{state_slug}/#{county_slug}"` for a county — and pass it as a `destination:` assign. Where the record has a photo, use its `src` as the `page_og` image, joined to the site URL the same way `place_controller.ex` does.

- [ ] **Step 4: Render it**

In each of the three templates, above the existing guide list and below the `<h1>`, add a block guarded on the assign:

```heex
<section :if={@destination} class="mt-6">
  <img
    :if={photo = List.first(@destination.photos)}
    src={photo["src"]}
    alt={photo["title"]}
    class="w-full rounded-xl"
    loading="lazy"
  />
  <div class="prose mt-4">{EthosWeb.Markdown.render(@destination.intro)}</div>
</section>
```

`EthosWeb.Markdown.render/1` returns `{:safe, iodata}`, so it interpolates directly — **do not wrap it in `raw/1`**. This matches `guide_html/show.html.heex:33`, which is the idiom to follow.

You must also render the **photo credit** — author, licence and a link to the Commons file page. That is a licence obligation, not decoration, and shipping a CC BY-SA image without attribution is the breach this project has already made once. Copy the credit markup from `place_html/show.html.heex`, which renders it for place photos.

Assign `destination: nil` in any branch that has no record so the templates need no `assigns[:destination]` guard.

- [ ] **Step 5: Run the tests, then the suite, and commit**

```bash
git add lib/ethos_web/controllers/destination_controller.ex lib/ethos_web/controllers/destination_html test/ethos_web/controllers/destination_controller_test.exs
git commit -m "feat: render destination intros and photos"
```

---

## Task 5: The thirteen destination pages

**Files:**
- Create: `priv/seed_data/destinations/{connecticut,new-york,rome,connecticut-fairfield-county,connecticut-hartford-county,connecticut-litchfield-county,connecticut-middlesex-county,connecticut-new-haven-county,connecticut-new-london-county,connecticut-tolland-county,connecticut-windham-county,new-york-brooklyn,new-york-manhattan}.json`
- Create: `images/destinations/{label}.*` (git-ignored), `priv/photos/destinations/{dir}/{label}.jpg` + `_thumb.jpg`
- Modify: `priv/seed_data/destination_photo_manifest.json`
- Test: `test/ethos/seeds/destination_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the loader, the optimizer and the gate from Tasks 2 and 3.

**File naming:** the JSON filename is the `path` with `/` replaced by `-`; the `path` field inside carries the real slashed value.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full. Its rules bind here with one addition and one subtraction: **the source is the constituent seed files, not research artifacts**, and there are no places, entries, links or tiers to author.

- [ ] **Step 2: Identify each destination's constituent guides.** For a county, every file in `priv/seed_data/{connecticut,brooklyn,manhattan}/` whose `guide.county` matches. For a state, every file whose `guide.state` matches. For `rome`, the Rome code-module guide in `lib/ethos/seeds/rome_guide.ex`. Record the counts; they must match the spec's table.

- [ ] **Step 3: Write each intro, 120-180 words.** Every claim must appear in a constituent guide. Where only one town supports a claim, name that town rather than generalising to the county — "Salisbury's iron furnaces" not "the county's iron industry", unless a guide says the latter. Prefer what recurs across several guides: that is what a summary is for.

- [ ] **Step 4: Scout photos.** Wikimedia Commons, free licences only, one or two per destination. **A destination with no usable candidate ships `"photos": []`** — county-level Commons coverage is uneven and that is an expected outcome.

- [ ] **Step 5: Fetch and verify images.** Download to `images/destinations/{label}.{ext}`, **validate magic bytes** (JPEG `FF D8 FF`, PNG `89 50 4E 47`, TIFF, WebP `RIFF`), and **open each image to confirm it depicts what the candidate claims** — fourteen candidates in the Brooklyn program did not.

- [ ] **Step 6: Update the manifest** with `{"source_url", "sha256"}` per label, rebuilt from the seed files rather than hand-edited.

- [ ] **Step 7: Optimize.** Run `mix ethos.optimize_destination_photos`.

- [ ] **Step 8: Gate.** Run `mix test test/ethos/seeds/destination_seed_data_test.exs`, then `mix test`. Both green.

- [ ] **Step 9: Fact-fidelity review.** Dispatch a reviewer that traces every claim in every intro back to a named constituent seed file. Not complete until findings are fixed.

- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/destinations priv/photos/destinations priv/seed_data/destination_photo_manifest.json
git commit -m "feat: content and photos for the thirteen destination pages"
```

**Report:** per destination, its constituent guide count, its intro word count, whether a photo shipped and why not if none, and any claim you could not source and therefore dropped.

---

## Task 6: Roster assertion, runbook, rollout

**Files:**
- Modify: `test/ethos/seeds/destination_seed_data_test.exs`
- Modify: `docs/runbooks/seeding.md`

- [ ] **Step 1: Add the roster assertion**

In the corpus test, immediately after the file list is built, assert the committed paths equal the thirteen expected exactly, failing in both directions and naming which paths are missing and which are unexpected. Build the expected set as a module attribute listing the thirteen literal paths — this is a fixed roster, not a derived one, and writing it out is what makes an accidental deletion fail.

- [ ] **Step 2: Prove it fails correctly**

Move one seed file aside, run the gate, confirm it names that path, restore it, confirm green. Record both runs. Do not commit the temporary state.

- [ ] **Step 3: Update the runbook**

Add `seed_destinations` to the order in `docs/runbooks/seeding.md`, after `seed_brooklyn` and before `seed_collections`. State that it is order-independent — it writes its own table, references nothing and resolves nothing — and is placed there for consistency rather than necessity.

- [ ] **Step 4: Full suite**

Run: `mix test`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add test/ethos/seeds/destination_seed_data_test.exs docs/runbooks/seeding.md
git commit -m "feat: destination roster assertion and runbook entry"
```

- [ ] **Step 6: Deploy — confirm with the user first**

Deploying and seeding production is outward-facing. **Do not run these without explicit authorization.** Once given:

```bash
fly deploy
fly ssh console -C "/app/bin/ethos rpc 'Ethos.Release.seed_destinations()'"
```

Note `seed_destinations` takes no argument.

- [ ] **Step 7: Verify in production**

Check that `/destinations/connecticut`, `/destinations/new-york/brooklyn` and `/destinations/connecticut/litchfield-county` each render their intro; that a destination photo resolves as `image/jpeg`; and that a destination page emits an `og:image`. Report the count of seeded destinations.
