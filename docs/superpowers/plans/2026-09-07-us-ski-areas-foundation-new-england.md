# US Ski Areas — Foundation + New England Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship Project A of the US ski corpus — the `ski-area` place kind, the roster, the seeder, the gate, the photo tooling, the New England destination nodes, a guide for every operating New England ski area, and the two collections that carry them.

**Architecture:** One JSON file per ski area under `priv/seed_data/ski/`, loaded by the existing two-pass `Ethos.Seeds.DataGuide` loader — the authoring format every corpus since Manhattan uses. Each file carries the mountain as a `ski-area` place plus whatever is verifiably around it, filed on the town or county node the area actually sits in. A roster (`priv/seed_data/ski_areas_roster.json`) is the authority on scope, and a gate test asserts roster and corpus agree in both directions so a missed mountain is a red test rather than a silent gap. No schema change and no migration: `places.kind` has no database check constraint.

**Tech Stack:** Elixir, Phoenix 1.7.14, Ecto, PostgreSQL, ExUnit, Jason.

**Spec:** `docs/superpowers/specs/2026-09-06-us-ski-areas-design.md` — read it before Task 1. This plan argues from it; where they disagree, the spec wins and the disagreement is a bug in this plan, except at the four points marked **Deviation from spec** below, each of which states its reason and its cost.

## Global Constraints

Copied verbatim from the spec's "Global constraints" and §7. Every task's requirements include these.

- Phoenix 1.7.14.
- No AI or network calls in shipped code.
- Place-slug global uniqueness across every seed source.
- Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed, never hotlinked.
- `mix format` clean and the suite green before every commit.
- **`MIX_TEST_PARTITION` on every test command.** The `ethos_test` database is shared with other worktrees; without it you will see phantom failures from another branch's migrations. Every test command in this plan already carries it. Use `MIX_TEST_PARTITION=ski`.
- No new schema and no migration. One place-kind vocabulary entry only.
- No defunct areas. Operating only, with `status` carried per place.
- No nested collections.

### Content constraints (spec §5), binding on every content wave

- **No vertical drop, skiable acreage or lift count** without the operator or a named authority in the same prose field.
- **No snowfall average** without a named source and the period it covers.
- **No pass affiliation** (Epic, Ikon, Indy) without the current season's source, date-stamped.
- **No trail maps or logos** in photos — both copyrighted.
- **No superlatives** — "best", "steepest", "most challenging".
- **The artifact is written during authoring, not after.** One row per concrete claim: the area, the claim, the specific named source, the verdict. A source must be nameable — an operator page, a dated news item, a state tourism register. Not "the resort's site". If a claim cannot be sourced, the sentence does not get written. Retro-fitting rows from already-published prose is transcription, not verification, and is forbidden.
- **Artifacts are committed, not left in scratchpad**: `docs/ski/new-england.md`, in the repository, from the first wave.
- **Every wave review runs the reverse check**: pull concrete specifics *out of the published guides* and find the row for each. Report every published specific with no row.

---

## Reading the plan before you start

Two facts about this codebase that every task depends on and no task repeats:

1. **Photos are served from `priv/photos/`, not `priv/static/`.** `endpoint.ex` mounts a `Plug.Static` at `/photos` with `from: {:ethos, "priv/photos"}`, and `EthosWeb.static_paths/0` never lists a `photos` directory. A photo file written under `priv/static/` exists on disk and 404s in production. Every disk check in this plan strips the leading `/photos/` and joins under `priv/photos/`.
2. **Seeding is not transactional and the loaders raise.** `Ethos.Seeds.DataGuide.upsert_places!/1` raises on a `destination_path` no node owns; `Ethos.Seeds.GuideRunner.replace_entries!/2` raises on an entry naming a place nothing has seeded; `Ethos.Links.resolve!/1` raises on a link target nothing has seeded. A raise aborts the run partway, leaving earlier files published. This is why node order and runbook order are load-bearing.

## File Structure

**Created:**

| File | Responsibility |
| --- | --- |
| `priv/seed_data/ski_areas_roster.json` | The authority on scope: every operating New England ski area, one row each, plus the seven-region metadata block. |
| `test/ethos/seeds/ski_areas_roster_test.exs` | The roster's own shape gate — keys, statuses, uniqueness, region metadata. |
| `priv/seed_data/ski/` | The corpus. One JSON file per area, named `{slug}.json`. |
| `test/ethos/seeds/ski_seed_data_test.exs` | The corpus gate: prose bans with non-vacuity specimens, shape, photos, nodes, roster agreement in both directions. |
| `priv/seed_data/ski_photo_manifest.json` | Photo provenance: label → `{sha256, source_url}`. |
| `lib/mix/tasks/ethos.optimize_ski_photos.ex` | Optimizes `images/ski/{label}.*` into `priv/photos/ski/{slug}/`. |
| `lib/ethos/seeds/ski_collections.ex` | `Ethos.Seeds.SkiCollections` — the parent collection and the New England regional collection. |
| `test/ethos/seeds/ski_collections_test.exs` | Collection gate: membership derived from the roster, blurb and intro caps. |
| `docs/ski/new-england.md` | The committed verification artifact. One row per concrete published claim. |

**Modified:**

| File | Change |
| --- | --- |
| `lib/ethos/places/place.ex:5` | Add `ski-area` to `@kinds`. |
| `lib/ethos_web/controllers/place_html.ex:6-19` | Map `"ski-area" => "SkiResort"` in `@schema_types`. |
| `test/ethos_web/controllers/place_html_test.exs` | The kind/type pair for `ski-area`, in the file's existing style. |
| `priv/seed_data/destination_tree.json` | New England region, county and town nodes. |
| `test/ethos/seeds/destination_tree_test.exs:46` | The roster-count literal the runbook quotes. |
| `lib/ethos/release.ex` | `seed_ski/1`; `Ethos.Seeds.SkiCollections` in `seed_collections/0`. |
| `test/ethos/release_test.exs` | A test for `seed_ski/1`. |
| `docs/runbooks/seeding.md` | `seed_ski` as step 13, everything after renumbered, node counts updated. |

---

### Task 1: The `ski-area` place kind

**Files:**
- Modify: `lib/ethos/places/place.ex:5`
- Modify: `lib/ethos_web/controllers/place_html.ex:6-19`
- Test: `test/ethos_web/controllers/place_html_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: `"ski-area"` is a valid `Ethos.Places.Place` kind; `EthosWeb.PlaceHTML.schema_type("ski-area") == "SkiResort"`.

There is **no migration**. `places.kind` is a plain string column with no database check constraint — verified in the spec's non-goals — so the vocabulary lives only in the changeset's `validate_inclusion`.

`test/ethos_web/controllers/place_html_test.exs` already exists and is where `shop` and `stadium` were each added. Follow that file's own pattern: a pair of tests per kind. Do **not** add a vocabulary test to `test/ethos/places_test.exs` — that file is about `Ethos.Places` query and upsert behaviour and does not alias `Place`.

**The exhaustiveness test already in that file is the one that matters.** It reads:

```elixir
  test "every accepted kind maps to a schema.org type that is not the fallback" do
    fallback = PlaceHTML.schema_type("definitely-not-a-kind")
    unmapped = Enum.filter(Place.kinds(), &(PlaceHTML.schema_type(&1) == fallback))
    assert unmapped == ["attraction"], "kinds with no schema.org mapping: #{inspect(unmapped)}"
  end
```

It goes red the moment you widen `@kinds` without widening `@schema_types` — exactly the failure that would otherwise have shipped a ski area as a `TouristAttraction`. Leave it alone; it is doing its job, and Steps 3 and 4 below make you watch it do it.

- [ ] **Step 1: Write the failing tests**

Append to `test/ethos_web/controllers/place_html_test.exs`, before the existing exhaustiveness test, in the file's own style (it already aliases both `Place` and `PlaceHTML`):

```elixir
  # schema.org has a SkiResort type. Without an entry, a ski area falls through
  # schema_type/1's default to TouristAttraction — which renders, validates, and
  # tells a search engine nothing about what the page is.
  test "a ski area is a SkiResort, not the TouristAttraction fallback" do
    assert PlaceHTML.schema_type("ski-area") == "SkiResort"
    refute PlaceHTML.schema_type("ski-area") == PlaceHTML.schema_type("unmapped-kind")
  end

  test "ski-area is an accepted kind" do
    assert "ski-area" in Place.kinds()
  end

  # The hyphenation this project did not choose. Pinned so a later corpus does
  # not quietly introduce a second spelling of the same thing.
  test "the vocabulary rejects ski-resort" do
    refute "ski-resort" in Place.kinds()
  end
```

- [ ] **Step 2: Run the tests and watch them fail**

```
MIX_TEST_PARTITION=ski mix test test/ethos_web/controllers/place_html_test.exs
```

Expected: 2 failures — "a ski area is a SkiResort" (`"TouristAttraction" != "SkiResort"`) and "ski-area is an accepted kind". The exhaustiveness test is still green here, because `@kinds` has not been widened yet.

- [ ] **Step 3: Add the kind, and watch the exhaustiveness test catch the omission**

In `lib/ethos/places/place.ex`, replace line 5:

```elixir
  @kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction)
```

with:

```elixir
  @kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction ski-area)
```

Run the tests again:

```
MIX_TEST_PARTITION=ski mix test test/ethos_web/controllers/place_html_test.exs
```

Expected: "ski-area is an accepted kind" now passes, and the exhaustiveness test is **red**, reporting `kinds with no schema.org mapping: ["attraction", "ski-area"]`. That is a real omission being caught — do not edit the assertion.

- [ ] **Step 4: Map the schema.org type**

In `lib/ethos_web/controllers/place_html.ex`, add the entry to `@schema_types` after `"stadium"`:

```elixir
  @schema_types %{
    "museum" => "Museum",
    "theater" => "PerformingArtsTheater",
    "restaurant" => "Restaurant",
    "cafe" => "CafeOrCoffeeShop",
    "brewery" => "Brewery",
    "hotel" => "Hotel",
    "bnb" => "BedAndBreakfast",
    "park" => "Park",
    "historic-site" => "LandmarksOrHistoricalBuildings",
    "amusement-park" => "AmusementPark",
    "shop" => "Store",
    "stadium" => "StadiumOrArena",
    "ski-area" => "SkiResort"
  }
```

- [ ] **Step 5: Run the tests and watch them pass**

```
MIX_TEST_PARTITION=ski mix test test/ethos_web/controllers/place_html_test.exs
```

Expected: PASS, including the exhaustiveness test back to `unmapped == ["attraction"]`.

- [ ] **Step 6: Run the whole suite**

```
MIX_TEST_PARTITION=ski mix test
```

Expected: 0 failures. `test/ethos_web/controllers/json_ld_parity_test.exs` also reads the kind→type mapping; if it fails, read it before changing it — it may be asserting a property worth keeping.

- [ ] **Step 7: Format and commit**

```bash
mix format
git add lib/ethos/places/place.ex lib/ethos_web/controllers/place_html.ex \
        test/ethos_web/controllers/place_html_test.exs
git commit -m "feat: add the ski-area place kind and its schema.org SkiResort type"
```

---

### Task 2: The roster

**Files:**
- Create: `priv/seed_data/ski_areas_roster.json`
- Test: `test/ethos/seeds/ski_areas_roster_test.exs`

**Interfaces:**
- Consumes: nothing.
- Produces: the roster file, read by Tasks 3, 5, 7–15 and 16. Its shape is fixed here and nothing may change it later without changing this task's gate.

This is a **research task**, not a transcription task. The roster is what makes "every operating New England ski area" checkable rather than aspirational, and it is the input every later task slices.

**Deviation from spec (1 of 4).** Spec §1 describes a roster covering all ~470 US areas. This task builds it **New England-complete only**, with a `regions` metadata block naming all seven regions, their estimated counts, and a `landed`/`planned` status. Reason: producing 385 verified rows for regions nobody is about to build duplicates the research each later project must do anyway, and an unverified row is worse than an absent one — the ballpark roster test's own comment says a roster that sends an agent to the wrong county is worse than one that sends it nowhere. Cost: "all ~470 is checkable" becomes "all of each landed region is checkable, and the gap is named in the file". Projects B–G each append their region's rows and flip its status to `landed`.

#### The shape

```json
{
  "regions": [
    {"slug": "new-england", "name": "New England", "estimate": 85, "status": "landed",
     "states": ["Maine", "New Hampshire", "Vermont", "Massachusetts", "Connecticut", "Rhode Island"]},
    {"slug": "rockies", "name": "The Rockies", "estimate": 110, "status": "planned",
     "states": ["Colorado", "Utah", "Wyoming", "Montana", "Idaho", "New Mexico"]},
    {"slug": "midwest", "name": "The Midwest", "estimate": 120, "status": "planned",
     "states": ["Michigan", "Wisconsin", "Minnesota", "Iowa", "Illinois", "Indiana", "Ohio", "Missouri", "North Dakota", "South Dakota", "Nebraska"]},
    {"slug": "pacific", "name": "The Pacific", "estimate": 75, "status": "planned",
     "states": ["California", "Oregon", "Washington", "Nevada", "Arizona"]},
    {"slug": "mid-atlantic", "name": "The Mid-Atlantic", "estimate": 45, "status": "planned",
     "states": ["New York", "Pennsylvania", "New Jersey", "Maryland", "West Virginia", "Virginia"]},
    {"slug": "southeast", "name": "The Southeast", "estimate": 18, "status": "planned",
     "states": ["North Carolina", "Tennessee", "Georgia"]},
    {"slug": "alaska", "name": "Alaska", "estimate": 10, "status": "planned",
     "states": ["Alaska"]}
  ],
  "areas": [
    {
      "slug": "mad-river-glen",
      "name": "Mad River Glen",
      "region": "new-england",
      "state": "Vermont",
      "county": "Washington County",
      "town": "Fayston",
      "destination_path": "united-states/vermont/washington-county/fayston",
      "status": "build",
      "verified": true,
      "note": "Co-operatively owned since 1995; the single chair is the reason the area is nationally known. Snowboarding is not permitted, which the guide must say plainly rather than implying the area is a snowboard destination."
    }
  ]
}
```

**Field rules, all enforced by the gate below:**

- `slug` — kebab-case, globally unique across the whole `areas` list, and the basename of the area's seed file.
- `name` — the operating name as the operator writes it.
- `region` — a `slug` present in `regions`, whose `status` is `landed`.
- `state`, `county` — the verified administrative geography. `county` is required; every US ski area is in one.
- `town` — the incorporated town or `null` where the area sits in unincorporated land. This is the field that decides node depth (spec §3).
- `destination_path` — the town node where `town` is non-null, the county node where it is null. Task 3 creates every path this field names.
- `status` — `build` or `drop`. A `drop` row is an area the research examined and excluded; its `note` must say why.
- `verified` — `true` only when `state`, `county`, `destination_path` and `name` are all research-confirmed. A row is resolved together or not at all: an unverified row carries `null` in `state`, `county`, `town` and `destination_path`.
- `note` — non-empty on every row. On a `build` row it is what the researcher found worth carrying into the guide; on a `drop` row it is the reason.

**Scope rule for `build` vs `drop`:** in scope is every **operating, lift-served area open to the public**. Out of scope, recorded as `drop` with the reason:

- defunct or not operating this season;
- private (club-members-only, school-owned with no public ticket, military-base-only);
- surface-lift-only rope-tow hills with no public ticketing (a town rope tow with a published lift ticket **is** in scope — spec §2 exists for exactly these);
- Nordic/cross-country-only centres with no lift-served alpine terrain.

Two spec §3 edge cases, already ruled and not to be re-litigated:

- an area spanning two states attaches to the state operating the base area, with the other named in prose;
- linked areas sharing terrain stay two rows and two guides, joined later by a `nearby` link, never merged.

- [ ] **Step 1: Write the roster gate first, against an empty roster**

Create `priv/seed_data/ski_areas_roster.json` with the `regions` block exactly as printed above and `"areas": []`. Then create `test/ethos/seeds/ski_areas_roster_test.exs`:

```elixir
defmodule Ethos.Seeds.SkiAreasRosterTest do
  @moduledoc """
  The roster's own shape gate, separate from the corpus gate in
  `Ethos.Seeds.SkiSeedDataTest`.

  The roster is the authority on scope for the whole ski programme, and it is
  the thing every content wave slices its work out of. Its shape therefore has
  to be checkable before a single guide exists — this file lands with an empty
  `areas` list and every assertion here is a comprehension over it, so an empty
  roster passes vacuously except where a test says otherwise.

  Modelled on `Ethos.Seeds.MlbClubsRosterTest`, whose most valuable property is
  the "resolved together or not at all" rule: a half-filled row means somebody
  wrote down what they thought they knew and stopped, and a roster that sends a
  research agent to the wrong county is worse than one that sends it nowhere.
  """
  use ExUnit.Case, async: true

  @path "priv/seed_data/ski_areas_roster.json"
  @external_resource @path

  @statuses ~w(build drop)
  @region_statuses ~w(landed planned)
  @resolved_fields ~w(state county destination_path)

  defp roster, do: @path |> File.read!() |> Jason.decode!()
  defp regions, do: roster()["regions"]
  defp areas, do: roster()["areas"]

  test "the file is an object with the two blocks the corpus reads" do
    r = roster()
    assert is_list(r["regions"]), "regions must be a list"
    assert is_list(r["areas"]), "areas must be a list"
  end

  test "the seven regions are declared, each with an estimate and a status" do
    slugs = Enum.map(regions(), & &1["slug"])

    assert Enum.sort(slugs) ==
             ~w(alaska mid-atlantic midwest new-england pacific rockies southeast),
           "the seven regions of spec §8 are the seven regions of this file: #{inspect(slugs)}"

    for region <- regions() do
      assert is_binary(region["name"]) and region["name"] != ""
      assert is_integer(region["estimate"]) and region["estimate"] > 0
      assert region["status"] in @region_statuses, "#{region["slug"]}: #{region["status"]}"
      assert is_list(region["states"]) and region["states"] != []
    end
  end

  test "new-england is the landed region of this round" do
    landed = for r <- regions(), r["status"] == "landed", do: r["slug"]

    assert landed == ["new-england"],
           "Project A lands New England and nothing else; landed regions are #{inspect(landed)}"
  end

  test "every area row carries the keys the corpus reads, and no others" do
    for area <- areas() do
      assert Enum.sort(Map.keys(area)) ==
               ~w(county destination_path name note region slug state status town verified),
             "unexpected key set on #{inspect(area["slug"])}: #{inspect(Enum.sort(Map.keys(area)))}"

      assert is_binary(area["slug"]) and area["slug"] =~ ~r/^[a-z0-9-]+$/,
             "#{inspect(area["slug"])} is not a kebab-case slug"

      assert is_binary(area["name"]) and area["name"] != ""
      assert is_binary(area["note"]) and area["note"] != "", "#{area["slug"]}: note is blank"
      assert area["status"] in @statuses, "#{area["slug"]}: status #{inspect(area["status"])}"
      assert is_boolean(area["verified"]), "#{area["slug"]}: verified is not a boolean"
    end
  end

  test "every area names a region that is declared and landed" do
    landed = for r <- regions(), r["status"] == "landed", into: MapSet.new(), do: r["slug"]

    for area <- areas() do
      assert MapSet.member?(landed, area["region"]),
             "#{area["slug"]} names region #{inspect(area["region"])}, which is not landed — " <>
               "a row cannot be added before its region's project runs"
    end
  end

  test "every area's state is one its region declares" do
    states = Map.new(regions(), &{&1["slug"], MapSet.new(&1["states"])})

    for area <- areas(), area["verified"] do
      assert MapSet.member?(states[area["region"]], area["state"]),
             "#{area["slug"]} is in #{inspect(area["state"])}, which #{area["region"]} " <>
               "does not list"
    end
  end

  test "a row is resolved together or not at all" do
    for area <- areas() do
      values = Enum.map(@resolved_fields, &area[&1])

      if area["verified"] do
        assert Enum.all?(values, &(is_binary(&1) and &1 != "")),
               "#{area["slug"]} is marked verified with a missing field: " <>
                 inspect(Enum.zip(@resolved_fields, values))
      else
        assert Enum.all?(values, &is_nil/1),
               "#{area["slug"]} carries geography without being verified: " <>
                 inspect(Enum.zip(@resolved_fields, values))

        assert is_nil(area["town"]), "#{area["slug"]} carries a town without being verified"
      end
    end
  end

  # The rule that decides node depth (spec §3). A town node where the area sits
  # in an incorporated town, the county node otherwise — and the path must
  # actually end in the slugified town or county, not merely mention it.
  test "destination_path ends at the town where there is one and the county where there is not" do
    for area <- areas(), area["verified"] do
      last = area["destination_path"] |> String.split("/") |> List.last()

      expected =
        Ethos.Guides.Guide.derive_destination_slug(area["town"] || area["county"])

      assert last == expected,
             "#{area["slug"]}: path #{area["destination_path"]} ends in #{inspect(last)}, " <>
               "but the row's #{if area["town"], do: "town", else: "county"} slugifies to " <>
               inspect(expected)
    end
  end

  test "every destination_path names the state and county the row claims" do
    for area <- areas(), area["verified"] do
      segments = String.split(area["destination_path"], "/")

      assert Enum.at(segments, 0) == "united-states",
             "#{area["slug"]}: path does not start at united-states"

      assert Enum.at(segments, 1) == Ethos.Guides.Guide.derive_destination_slug(area["state"]),
             "#{area["slug"]}: path #{area["destination_path"]} disagrees with state " <>
               inspect(area["state"])

      assert Enum.at(segments, 2) == Ethos.Guides.Guide.derive_destination_slug(area["county"]),
             "#{area["slug"]}: path #{area["destination_path"]} disagrees with county " <>
               inspect(area["county"])
    end
  end

  test "slugs and names are unique" do
    slugs = Enum.map(areas(), & &1["slug"])
    assert length(slugs) == length(Enum.uniq(slugs)), "duplicate slugs: #{inspect(slugs -- Enum.uniq(slugs))}"

    names = Enum.map(areas(), & &1["name"])
    assert length(names) == length(Enum.uniq(names)), "duplicate names: #{inspect(names -- Enum.uniq(names))}"
  end

  # NOT vacuous, and deliberately so. This is the assertion that turns "we
  # researched New England" from a claim in a wave report into a fact, and it
  # is EXPECTED RED from the commit that creates the empty roster until Step 3
  # of this task lands the research. Every other test in this file must be
  # green; a second failure here is a real one.
  test "the New England research actually happened" do
    ne = for a <- areas(), a["region"] == "new-england", do: a

    assert length(ne) >= 60,
           "the roster holds #{length(ne)} New England rows; the spec estimates about 85 " <>
             "operating areas and 60 is the floor below which the research plainly did not finish"

    built = for a <- ne, a["status"] == "build", do: a
    assert built != [], "no New England row is marked build"

    unverified = for a <- built, not a["verified"], do: a["slug"]

    assert unverified == [],
           "these rows are marked build but not verified: #{inspect(unverified)}"

    dropped = for a <- ne, a["status"] == "drop", do: a

    assert dropped != [],
           "not one area was examined and excluded — New England has defunct hills, " <>
             "private club areas and Nordic-only centres, and a research pass that " <>
             "dropped none of them did not look at them"
  end
end
```

- [ ] **Step 2: Run the gate and confirm exactly one red**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_areas_roster_test.exs
```

Expected: 1 failure — "the New England research actually happened", on `0 New England rows`. Every other test green. If any *other* test is red, fix it before doing any research: it means the `regions` block you wrote does not match the shape above.

- [ ] **Step 3: Do the research and fill the roster**

Dispatch research in parallel by state, one agent per state, each returning a JSON array of rows in the shape above. Six states: Maine, New Hampshire, Vermont, Massachusetts, Connecticut, Rhode Island.

Each agent's instructions, verbatim:

> Enumerate every **operating, lift-served ski area open to the public** in {STATE} for the current season. For each, return one JSON object with keys `slug`, `name`, `region` (always `"new-england"`), `state`, `county`, `town` (the incorporated town, or `null` if the area sits in unincorporated land), `destination_path`, `status` (`"build"`), `verified` (`true`), and `note`.
>
> Also return a row with `status: "drop"`, `verified: false`, and `state`/`county`/`town`/`destination_path` all `null`, for every area you examined and excluded — defunct, private/club-only, Nordic-only, or no public lift ticket. The `note` must say which of those it is and name the source that establishes it.
>
> `destination_path` is `united-states/{state-slug}/{county-slug}/{town-slug}` where the area is in an incorporated town, and `united-states/{state-slug}/{county-slug}` where it is not. Slugs are lowercase kebab-case with no punctuation: "Washington County" → `washington-county`, "St. Johnsbury" → `st-johnsbury`.
>
> Every field must come from a named source you can cite: the operator's own site, a state tourism or ski-association register, a state GIS or municipal boundary source. Do not guess a county from a town name. Do not fill a field you could not source — mark the row `verified: false` and null every geography field instead.
>
> Return **only** the JSON array. Do not write any prose about the areas; that is a later wave's job and writing it now produces exactly the unsourced prose this project exists to avoid.

Then dispatch one adversarial verifier over the combined result:

> Here is a roster of New England ski areas. For each `build` row, independently confirm: (a) the area is operating this season, (b) it is lift-served and open to the public, (c) the county is correct for the town, and (d) the town is the incorporated municipality the base area is in, or is correctly `null`. Report every row where you found a discrepancy, with the source that establishes the correction. Also report any operating public lift-served area in these six states that the roster omits entirely — that direction is the one a roster cannot check itself.

Apply the verifier's corrections. A row the verifier could not confirm becomes `verified: false` with nulled geography, not a guess.

Write the combined `areas` list into `priv/seed_data/ski_areas_roster.json`, sorted by `state` then `slug`, and pretty-printed with two-space indentation.

- [ ] **Step 4: Run the gate and watch it go green**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_areas_roster_test.exs
```

Expected: PASS, all tests. If "a row is resolved together or not at all" fires, a row is half-filled — null its geography rather than inventing the missing field.

- [ ] **Step 5: Report the counts the rest of the plan slices on**

```bash
python3 - <<'PY'
import json, collections
r = json.load(open('priv/seed_data/ski_areas_roster.json'))
areas = r['areas']
build = [a for a in areas if a['status'] == 'build']
print('rows:', len(areas), 'build:', len(build), 'drop:', len(areas) - len(build))
for state, n in sorted(collections.Counter(a['state'] for a in build).items()):
    print(f'  {state}: {n}')
PY
```

Record these numbers in the ledger. Tasks 7–15 slice on them, and Task 3 creates a node for every distinct `destination_path` among the `build` rows.

- [ ] **Step 6: Format and commit**

```bash
mix format
git add priv/seed_data/ski_areas_roster.json test/ethos/seeds/ski_areas_roster_test.exs
git commit -m "feat: the ski areas roster, New England researched and verified"
```

---

### Task 3: The New England destination nodes

**Files:**
- Modify: `priv/seed_data/destination_tree.json`
- Modify: `test/ethos/seeds/destination_tree_test.exs:46`
- Modify: `docs/runbooks/seeding.md` (the node-count figures)
- Test: `test/ethos/seeds/destination_tree_test.exs`

**Interfaces:**
- Consumes: `priv/seed_data/ski_areas_roster.json` from Task 2 — specifically every distinct `destination_path` on a `build` row.
- Produces: a node for every one of those paths, plus their county and state parents. Tasks 7–15 depend on this: `DataGuide.upsert_places!/1` raises on a path no node owns.

Today the tree holds 757 nodes. Of the six New England states only **Massachusetts** and **Connecticut** have region nodes; Connecticut has all eight of its counties and Massachusetts has none (only `united-states/massachusetts/boston`, a `city` directly under the region). Vermont, New Hampshire, Maine and Rhode Island have no nodes at all.

**Ruling, recorded rather than fixed:** adding county nodes under Massachusetts leaves `united-states/massachusetts/boston` sitting beside its counties rather than inside Suffolk County. That inconsistency predates this project, the tree is deliberately variable-depth, and re-parenting Boston would move a live URL for no benefit to this corpus. Leave it. Note it in `docs/ski/new-england.md` as a known inconsistency.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/seeds/destination_tree_test.exs`:

```elixir
  # The ski corpus files every area on the town node where it sits in an
  # incorporated town and the county node where it does not (spec §3), and
  # `DataGuide.upsert_places!/1` RAISES on a path no node owns — a missing node
  # is a seed-time abort partway through a production restore, not a silent
  # orphan. So the roster's paths and the tree's paths are checked against each
  # other here, before any content exists to trip over them.
  test "every built ski roster row names a node the tree declares" do
    roster =
      ["priv", "seed_data", "ski_areas_roster.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    paths = MapSet.new(DestinationTree.load!(), & &1["path"])

    missing =
      for area <- roster["areas"],
          area["status"] == "build",
          not MapSet.member?(paths, area["destination_path"]),
          do: "#{area["slug"]} -> #{area["destination_path"]}"

    assert missing == [],
           "these ski areas name destination nodes the roster does not declare, and " <>
             "seeding them would raise: #{inspect(missing)}"
  end
```

- [ ] **Step 2: Run it and watch it fail**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/destination_tree_test.exs
```

Expected: FAIL, listing every New England path with no node. Also expect "the roster and overlay counts docs/runbooks/seeding.md quotes are still true" to be **green** at this point — it goes red in Step 4, which is correct.

- [ ] **Step 3: Generate the nodes**

Every node needed is derivable from the roster. Write and run this script; it emits the new nodes and leaves the existing 757 untouched.

```bash
python3 - <<'PY'
import json

STATE_INTRO = "{name} — the towns and counties this site covers."
COUNTY_INTRO = "{name}."
TOWN_INTRO = "{name}, {state}."

tree = json.load(open('priv/seed_data/destination_tree.json'))
have = {n['path'] for n in tree}
roster = json.load(open('priv/seed_data/ski_areas_roster.json'))

# name lookups, so a generated node carries the roster's own spelling
state_name, county_name, town_name = {}, {}, {}
for a in roster['areas']:
    if a['status'] != 'build':
        continue
    segs = a['destination_path'].split('/')
    state_name['/'.join(segs[:2])] = a['state']
    county_name['/'.join(segs[:3])] = a['county']
    if a['town']:
        town_name['/'.join(segs[:4])] = (a['town'], a['state'])

new = []
for path in sorted(state_name):
    if path not in have:
        n = state_name[path]
        new.append({"path": path, "kind": "region", "name": n,
                    "intro": STATE_INTRO.format(name=n)})
        have.add(path)
for path in sorted(county_name):
    if path not in have:
        n = county_name[path]
        new.append({"path": path, "kind": "county", "name": n,
                    "intro": COUNTY_INTRO.format(name=n)})
        have.add(path)
for path in sorted(town_name):
    if path not in have:
        n, st = town_name[path]
        new.append({"path": path, "kind": "town", "name": n,
                    "intro": TOWN_INTRO.format(name=n, state=st)})
        have.add(path)

print(f'{len(new)} new nodes ({len(tree)} -> {len(tree) + len(new)})')
for n in new:
    print(' ', n['kind'], n['path'])

json.dump(tree + new, open('priv/seed_data/destination_tree.json', 'w'),
          indent=2, ensure_ascii=False)
open('priv/seed_data/destination_tree.json', 'a').write('\n')
PY
```

Three properties of this script that matter and must not be "simplified" away:

- **No `legacy_paths`.** These towns had no pre-existing `/destinations/:slug` URL, so there is nothing to redirect. The tree test's "legacy paths are unique across the whole roster" assertion is what would catch a well-meant addition here that shadowed another node.
- **Shallowest first, appended in order** — region, then county, then town. `DestinationTree.upsert_all!/0` sorts by depth anyway, but a file that reads in dependency order is a file whose diff can be reviewed.
- **The roster's own spellings.** `name` comes from the roster row, not from the slug, so "St. Johnsbury" stays "St. Johnsbury" rather than becoming "St Johnsbury".

- [ ] **Step 4: Update the two count literals**

The script printed the new total. In `test/ethos/seeds/destination_tree_test.exs`, replace `757` in the "roster and overlay counts" test with that number, in **both** the assertion and its failure message. Then update `docs/runbooks/seeding.md` everywhere it quotes `757` or the `772` tripwire (`772` is `757 + 15` overlays; recompute it as `<new count> + 15`).

```bash
grep -n "757\|772" docs/runbooks/seeding.md test/ethos/seeds/destination_tree_test.exs
```

Both numbers must change in this one commit. The test's own comment says so: "change both in the same commit, never one alone."

- [ ] **Step 5: Run the tree tests and the suite**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/destination_tree_test.exs
MIX_TEST_PARTITION=ski mix test
```

Expected: PASS. Watch particularly for "every roster node declares a known kind and a resolvable parent" — a town node whose county parent the script failed to create fails there.

- [ ] **Step 6: Verify the nodes actually seed**

```
MIX_TEST_PARTITION=ski mix test test/ethos/release_test.exs
```

Expected: PASS. `upsert_all!/0` raises `"parent ... is not in the roster"` on a broken hierarchy, and several release tests call it.

- [ ] **Step 7: Format and commit**

```bash
mix format
git add priv/seed_data/destination_tree.json test/ethos/seeds/destination_tree_test.exs docs/runbooks/seeding.md
git commit -m "feat: New England destination nodes for the ski corpus"
```

---

### Task 4: The corpus directory, the seeder, and the runbook

**Files:**
- Create: `priv/seed_data/ski/.gitkeep`
- Modify: `lib/ethos/release.ex` (after `seed_steakhouse/1`, around line 156)
- Modify: `test/ethos/release_test.exs`
- Modify: `docs/runbooks/seeding.md`

**Interfaces:**
- Consumes: Task 3's nodes.
- Produces: `Ethos.Release.seed_ski/1` — same arity and contract as `seed_steakhouse/1`: takes an author email, seeds the destination tree, then runs the three-pass directory load over `priv/seed_data/ski/*.json`.

Spec §9 makes this task's runbook edit an obligation, not a nicety: `korean_bbq` was omitted from the numbered list, and an operator following it would have restored production missing an entire corpus with nothing erroring.

- [ ] **Step 1: Write the failing test**

Append to `test/ethos/release_test.exs`, in the top-level module beside the steakhouse test:

```elixir
  # `seed_ski/1` is a plain `seed_directory/2` call, and the two things worth
  # pinning are that it exists at all — spec §9's whole point is that a seeder
  # missing from the runbook restores production short with nothing erroring —
  # and that it names a directory that is really there. `Path.wildcard/1` on a
  # missing directory returns `[]` rather than raising, so a typo'd directory
  # name is a seeder that quietly seeds nothing.
  test "seed_ski/1 names a ski seed directory that exists" do
    assert function_exported?(Ethos.Release, :seed_ski, 1)

    dir = Path.join([Application.app_dir(:ethos, "priv"), "seed_data", "ski"])

    assert File.dir?(dir),
           "seed_ski/1 names priv/seed_data/ski, which does not exist — Path.wildcard/1 " <>
             "would return [] and the seeder would silently publish nothing"
  end

  test "seed_ski/1 publishes the committed ski seed files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("ski"))

    ski = fn ->
      Ethos.Guides.list_published_guides()
      |> Enum.count(&String.ends_with?(&1.slug, "-ski-guide"))
    end

    before = ski.()
    capture_io(fn -> Ethos.Release.seed_ski(user.email) end)
    after_first = ski.()

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_ski(user.email) end)
    assert ski.() == after_first, "seed_ski/1 is not idempotent"
  end
```

- [ ] **Step 2: Run it and watch it fail**

```
MIX_TEST_PARTITION=ski mix test test/ethos/release_test.exs
```

Expected: FAIL with `function_exported?(Ethos.Release, :seed_ski, 1)` returning false.

- [ ] **Step 3: Create the directory and the seeder**

```bash
mkdir -p priv/seed_data/ski
touch priv/seed_data/ski/.gitkeep
```

In `lib/ethos/release.ex`, immediately after `def seed_steakhouse(email), do: seed_directory("steakhouse", email)`:

```elixir
  @doc """
  Seeds the US ski corpus under `priv/seed_data/ski/`.

  One file per operating ski area, each carrying the mountain as a `ski-area`
  place plus whatever is verifiably around it. Scope is
  `priv/seed_data/ski_areas_roster.json`, and
  `test/ethos/seeds/ski_seed_data_test.exs` asserts the roster and the corpus
  agree in both directions — a roster row with no file fails, and a file with
  no roster row fails.

  **Preconditions are the nodes, not other corpora.** Unlike
  `seed_steakhouse/1`, which must follow six other steps because its `"links"`
  edges name guides in six other corpora, the New England round's `nearby`
  links are all between ski guides in this same directory, and
  `seed_directory/2`'s third pass runs after every guide in the run has been
  published. What this step genuinely needs is the destination tree, which it
  seeds itself on the line below — every area sits on a New England town or
  county node, and roughly all of them were added by this project.

  The day a ski file links outward — to a Vermont town guide, or to a ballpark
  in a later region — that becomes a documented ordering constraint in
  `docs/runbooks/seeding.md` like step 12's, because `Links.resolve!/1` raises
  on a target nothing has seeded and seeding is not transactional.
  """
  def seed_ski(email), do: seed_directory("ski", email)
```

- [ ] **Step 4: Run the release tests**

```
MIX_TEST_PARTITION=ski mix test test/ethos/release_test.exs
```

Expected: PASS. The idempotency test passes vacuously at `expected == 0` while the corpus is empty; Task 7 is the first wave that gives it something to count.

- [ ] **Step 5: Insert the runbook step and renumber**

In `docs/runbooks/seeding.md`, insert after step 12 (`seed_steakhouse`) and before the current step 13 (`seed_destinations`):

```markdown
13. `Ethos.Release.seed_ski(email)` — one JSON file per operating ski area in
    `priv/seed_data/ski/`, scoped by `priv/seed_data/ski_areas_roster.json`.
    New England only in this round; the roster's `regions` block names the six
    regions still to come and their estimated counts.

    **No corpus precondition.** Every `"links"` edge in this corpus targets
    another guide in the same directory, and `seed_directory/2`'s link pass
    runs after every guide of the run is published, so `Links.resolve!/1` has
    nothing to raise on. This is the opposite of step 12, whose 14 edges reach
    13 guides in six other corpora — do not copy step 12's precondition list
    here on the assumption that a themed corpus must have one.

    What this step does need is the destination nodes, and it seeds the tree
    itself first, the way every other seeder does. Those nodes are the reason
    the roster count in step 0 changed: New England's town and county nodes
    were added by this project, and `DataGuide.upsert_places!/1` **raises** on
    a path no node owns — a missing node aborts the restore partway, after
    earlier files have published.

    Step 15 depends on this one: `Ethos.Seeds.SkiCollections` names every ski
    guide in both of its collections.
```

Then renumber. The current steps 13–17 become 14–18, and six cross-references move with them:

```bash
grep -n "step 1[1-7]\|Step 1[1-7]" docs/runbooks/seeding.md
```

Work through every hit. The ones that change: line ~71 (`seed_destinations` is "step 13" → step 14), line ~109 (`step 14 needs it` → step 15), line ~138 (`Step 14 depends on this one`, in the Korean BBQ step → Step 15), line ~175 (the same sentence in the steakhouse step → Step 15), line ~196 (the collections step's own list of which step each collection came from — `Steakhouses (step 12)` is unchanged, but the step's own number changes), line ~295 (`step 13's fifteen overlay files` → step 14's). References to steps 1–12 do **not** change.

- [ ] **Step 6: Verify the renumbering is internally consistent**

```bash
python3 - <<'PY'
import re
text = open('docs/runbooks/seeding.md').read()
declared = [int(m) for m in re.findall(r'^(\d+)\. `Ethos\.Release', text, re.M)]
print('declared step numbers:', declared)
assert declared == list(range(1, len(declared) + 1)), 'steps are not 1..N in order'
referenced = sorted({int(m) for m in re.findall(r'[Ss]tep (\d+)', text)})
print('referenced step numbers:', referenced)
assert max(referenced) <= max(declared), 'a reference points past the last step'
print('consistent')
PY
```

Expected: `consistent`, with `declared` running 1..18.

- [ ] **Step 7: Run the suite, format, commit**

```
MIX_TEST_PARTITION=ski mix test
mix format
```

```bash
git add priv/seed_data/ski/.gitkeep lib/ethos/release.ex test/ethos/release_test.exs docs/runbooks/seeding.md
git commit -m "feat: seed_ski/1 and its runbook step"
```

---

### Task 5: The corpus gate

**Files:**
- Create: `test/ethos/seeds/ski_seed_data_test.exs`

**Interfaces:**
- Consumes: `priv/seed_data/ski_areas_roster.json` (Task 2), `priv/seed_data/ski/*.json` (Tasks 7–15), `Ethos.Seeds.DestinationTree.load!/0`.
- Produces: the gate every content wave must pass. Waves 7–15 run `mix test test/ethos/seeds/ski_seed_data_test.exs` as their inner loop.

The gate lands **before** the content so it bites as files arrive. Every test here is a comprehension over `docs/0`, so an empty corpus passes vacuously — with one deliberate exception, `the corpus matches the roster's built rows`, which is red from this commit until Task 15 finishes. That red is expected and ruled on; **any other red test in this file is a real failure and must not be allowed to hide behind it.**

Read the amendment in spec §5 before writing this file. Its central claim is the reason this gate is not the whole control: *a prose gate catches shapes; it cannot tell a verified sentence from a well-formed invented one.* "Seats 222" is grammatical, unbanned, and false. The gate is necessary and insufficient; `docs/ski/new-england.md` and Task 17's reverse check are the rest.

- [ ] **Step 1: Write the gate**

Create `test/ethos/seeds/ski_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.SkiSeedDataTest do
  @moduledoc """
  The gate every ski content wave must pass.

  Modelled on `Ethos.Seeds.SteakhouseSeedDataTest` and, through it, on
  `Ethos.Seeds.KoreanBbqSeedDataTest`, whose most valuable property is that it
  enforces its inclusion rule as a test rather than as a sentence in a
  document. The ski equivalent is *every published ski area's prose evidences
  lift-served skiing* — without it "operating, lift-served, open to the public"
  is a rule nothing checks, and the roster drifts region by region.

  ## What this gate cannot do

  Spec §5's amendment, written after the steakhouse corpus shipped three waves
  of unsourced prose past a gate at least this thorough: **a prose gate catches
  shapes. It cannot tell a verified sentence from a well-formed invented one.**
  Every ban below is a regex over published strings. "Mount Snow's summit is at
  3,600 feet" trips the elevation ban and is spared by a source marker; nothing
  here can tell whether the source named is the source that says it. That is
  what `docs/ski/new-england.md` and the reverse check are for.

  ## The bans, and what they sweep

  Superlatives, unsourced mountain statistics (vertical drop, acreage, lift
  count, elevation), unsourced snowfall averages, undated pass affiliations,
  unsourced distances and drive times, and atmosphere presented as observation
  — run over every prose field: the guide intro, every section body, every FAQ
  question and answer, every place summary, every place history, every entry
  note and every photo `title` and `description`. A caption is published prose
  and is swept like any other sentence.

  ## Green against an empty corpus

  Every test is a comprehension over `docs/0`, so an empty corpus passes
  vacuously — except `the corpus matches the roster's built rows`, which is
  red from this commit until the last content wave lands. That red is expected;
  any *other* red in this file is real.
  """
  use ExUnit.Case, async: true

  @dir Path.join(["priv", "seed_data", "ski"])
  @roster Path.join(["priv", "seed_data", "ski_areas_roster.json"])

  defp files, do: Path.wildcard(Path.join(@dir, "*.json")) |> Enum.sort()
  defp docs, do: Enum.map(files(), &{&1, &1 |> File.read!() |> Jason.decode!()})
  defp roster, do: @roster |> File.read!() |> Jason.decode!()
  defp built, do: for(a <- roster()["areas"], a["status"] == "build", do: a)

  # Every published string in the file.
  defp prose(doc) do
    g = doc["guide"]
    photos = (g["photos"] || []) ++ Enum.flat_map(doc["places"] || [], &(&1["photos"] || []))

    [g["intro"] | Enum.map(g["sections"] || [], & &1["body"])] ++
      Enum.flat_map(g["faq"] || [], &[&1["question"], &1["answer"]]) ++
      Enum.map(doc["places"] || [], & &1["summary"]) ++
      Enum.map(doc["places"] || [], &(&1["history"] || "")) ++
      Enum.map(doc["entries"] || [], & &1["note"]) ++
      Enum.flat_map(photos, &[&1["title"], &1["description"]])
  end

  # ------------------------------------------------------------------
  # The source marker, shared by four bans
  # ------------------------------------------------------------------

  # A claim publishes only if the SAME field carries its source. The gate tests
  # one string at a time, so a citation two paragraphs away does not save you —
  # and that is deliberate: a reader meets the number and the attribution in the
  # same breath or not at all.
  @source_marker ~r/\b(according to|per |reported by|the operator|the resort's own|its own|the state of|state of \w+|register|survey|U\.S\. Forest Service|Forest Service|National Weather Service|NOAA|Ski (?:Areas?|Vermont|New Hampshire|Maine))\b/i

  defp sourced?(text) when is_binary(text), do: Regex.match?(@source_marker, text)

  # ------------------------------------------------------------------
  # Ban 1 — superlatives (spec §5)
  # ------------------------------------------------------------------

  @superlatives [
    ~r/\bbest\b/i,
    ~r/\bfinest\b/i,
    ~r/\bsteepest\b/i,
    ~r/\bmost challenging\b/i,
    ~r/\bmost difficult\b/i,
    ~r/\bgreatest\b/i,
    ~r/\bunrivalled\b/i,
    ~r/\bunrivaled\b/i
  ]

  defp superlative?(text) when is_binary(text),
    do: Enum.any?(@superlatives, &Regex.match?(&1, text))

  test "the superlative ban catches what it must and spares what it must not" do
    for specimen <- [
          "the best skiing in New England",
          "the steepest lift-served pitch in the East",
          "the most challenging terrain in Vermont",
          "the finest glades in the state"
        ] do
      assert superlative?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "a single chairlift serves the summit",
          "the trail network is rated more difficult than most of its neighbours by the operator",
          "the co-operative bought the mountain in 1995",
          "twenty-seven named trails, per the operator's own trail listing"
        ] do
      refute superlative?(specimen), "must publish: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 2 — mountain statistics (spec §5: "these are marketing numbers and
  # sources disagree")
  # ------------------------------------------------------------------

  @statistics [
    ~r/\bvertical (?:drop|rise)\b/i,
    ~r/\b[\d,]+\s*(?:vertical\s+)?(?:feet|ft\.?)\b/i,
    ~r/\b[\d,]+\s*(?:skiable\s+)?acres\b/i,
    ~r/\b\d+\s*(?:chair)?lifts?\b/i,
    ~r/\b\d+\s*(?:named\s+)?trails?\b/i,
    ~r/\b\d+\s*(?:ski\s+)?runs?\b/i
  ]

  defp statistic?(text) when is_binary(text),
    do: Enum.any?(@statistics, &Regex.match?(&1, text))

  defp unsourced_statistic?(text) when is_binary(text),
    do: statistic?(text) and not sourced?(text)

  test "the statistics ban catches an unsourced number and spares a sourced one" do
    for specimen <- [
          "a vertical drop of 2,037 feet",
          "2,600 skiable acres across three peaks",
          "eleven lifts serve the mountain",
          "the mountain has 145 trails"
        ] do
      assert unsourced_statistic?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "a vertical drop of 2,037 feet, according to the operator's own mountain statistics",
          "2,600 skiable acres, per the resort's own trail map legend",
          "eleven lifts, per the operator's lift listing for the current season"
        ] do
      refute unsourced_statistic?(specimen), "must publish: #{inspect(specimen)}"
    end

    # Non-vacuity, and it is a different assertion from the two above. These
    # trip a pattern and are spared only because the source sits in the same
    # field. A `refute unsourced_statistic?` alone would also pass if every
    # pattern here had been broken and fired on nothing at all.
    for specimen <- [
          "a vertical drop of 2,037 feet, according to the operator's own mountain statistics",
          "2,600 skiable acres, per the resort's own trail map legend"
        ] do
      assert statistic?(specimen),
             "this specimen must trip a pattern and be spared by its source, " <>
               "but nothing fired: #{inspect(specimen)}"
    end

    # And these trip nothing at all, which is the third distinct case.
    for specimen <- [
          "a single chairlift, unchanged since 1948",
          "the base lodge burned in 1975 and was rebuilt the following season",
          "the co-operative issues shares to skiers rather than to investors"
        ] do
      refute statistic?(specimen), "this specimen should trip no pattern: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 3 — snowfall (spec §5: named source AND the period it covers)
  # ------------------------------------------------------------------

  @snowfall [
    ~r/\b(?:annual|average)\s+snowfall\b/i,
    ~r/\bsnowfall\s+aver/i,
    ~r/\b[\d,]+\s*(?:inches|in\.|")\s+of\s+snow\b/i,
    ~r/\b[\d,]+\s*(?:inches|in\.|")\s+(?:annually|a\s+year|per\s+(?:year|season))\b/i
  ]

  # The period the average covers, in the same field — "1991-2020", "over
  # thirty seasons", "the last ten winters". A snowfall average with no period
  # is not a weaker claim than one with a period; it is a different and
  # unfalsifiable claim.
  @period ~r/\b(?:19|20)\d\d\s*[-–]\s*(?:19|20)?\d\d\b|\b(?:over|across|the last)\s+\w+\s+(?:years|seasons|winters)\b/i

  defp snowfall?(text) when is_binary(text), do: Enum.any?(@snowfall, &Regex.match?(&1, text))

  defp unsourced_snowfall?(text) when is_binary(text),
    do: snowfall?(text) and not (sourced?(text) and Regex.match?(@period, text))

  test "the snowfall ban demands both a source and a period" do
    for specimen <- [
          "average snowfall of 250 inches",
          "the mountain gets 180 inches of snow",
          "annual snowfall is among the heaviest in the state",
          "250 inches a year, according to the operator"
        ] do
      assert unsourced_snowfall?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "average snowfall of 250 inches over the 1991-2020 normal period, per the National Weather Service",
          "the summit recorded 180 inches of snow across the last ten winters, according to the operator's own log"
        ] do
      refute unsourced_snowfall?(specimen), "must publish: #{inspect(specimen)}"
    end

    # Non-vacuity: the sparing above must come from the source and the period,
    # not from a pattern that never fired.
    assert snowfall?(
             "average snowfall of 250 inches over the 1991-2020 normal period, per the National Weather Service"
           )

    # The fourth caught specimen is the one that matters most: it HAS a source
    # and is still caught, because it has no period.
    assert sourced?("250 inches a year, according to the operator")
    assert unsourced_snowfall?("250 inches a year, according to the operator")
  end

  # ------------------------------------------------------------------
  # Ban 4 — pass affiliation (spec §5: current season's source, date-stamped)
  # ------------------------------------------------------------------

  @pass ~r/\b(Epic|Ikon|Indy|Mountain Collective)\s+Pass\b/i
  @season ~r/\b20\d\d\s*[-–\/]\s*(?:20)?\d\d\b/

  defp pass_claim?(text) when is_binary(text), do: Regex.match?(@pass, text)

  defp undated_pass?(text) when is_binary(text),
    do: pass_claim?(text) and not (sourced?(text) and Regex.match?(@season, text))

  test "a pass affiliation publishes only date-stamped and sourced" do
    for specimen <- [
          "on the Ikon Pass",
          "an Epic Pass mountain",
          "the Indy Pass includes two days here",
          "on the Ikon Pass, according to the operator"
        ] do
      assert undated_pass?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "on the Ikon Pass for the 2026-27 season, per the operator's own pass page",
          "the Indy Pass listed the area for 2026/27, according to the pass operator"
        ] do
      refute undated_pass?(specimen), "must publish: #{inspect(specimen)}"
    end

    assert pass_claim?("on the Ikon Pass for the 2026-27 season, per the operator's own pass page")
  end

  # ------------------------------------------------------------------
  # Ban 5 — derived relational geography (spec §5's first named class)
  # ------------------------------------------------------------------

  # A per-area artifact can record two areas' locations without recording the
  # distance or direction between them, so this is a class the artifact
  # structurally cannot catch and the gate must. Both the steakhouse corpus and
  # the geography refactor shipped defects here.
  @distance [
    ~r/\b[\d.]+\s*(?:miles?|mi\.|kilometres?|kilometers?|km)\b/i,
    ~r/\b\d+\s*(?:minutes?|min\.|hours?)\b[^.]{0,40}\b(?:drive|driving|away|north|south|east|west)\b/i,
    ~r/\ba\s+\w+[- ]minute\s+drive\b/i
  ]

  defp distance?(text) when is_binary(text), do: Enum.any?(@distance, &Regex.match?(&1, text))

  defp unsourced_distance?(text) when is_binary(text),
    do: distance?(text) and not sourced?(text)

  test "the distance ban catches a derived distance and spares a sourced one" do
    for specimen <- [
          "six miles down the valley from Sugarbush",
          "a twenty-minute drive north",
          "40 minutes away by car",
          "1.5 km from the village"
        ] do
      assert unsourced_distance?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "six miles from Waitsfield, per the state of Vermont's highway log",
          "the access road runs 2.5 miles from Route 17, according to the town of Fayston"
        ] do
      refute unsourced_distance?(specimen), "must publish: #{inspect(specimen)}"
    end

    assert distance?("six miles from Waitsfield, per the state of Vermont's highway log")

    for specimen <- [
          "the road climbs from the valley floor to the base lodge",
          "Sugarbush lies further down the same valley"
        ] do
      refute distance?(specimen), "this specimen should trip no pattern: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # Ban 6 — atmosphere presented as observation (spec §5's second named class)
  # ------------------------------------------------------------------

  # "The lift line thins after two" is the spec's own example. Nobody observed
  # it, no source says it, and it reads as reportage. There is no source-marker
  # escape here: a sourced crowd claim is a strange thing to want, and the ban
  # is cheaper to enforce absolutely than to argue case by case. If a wave
  # genuinely needs one, it changes this list in its own commit with the reason.
  @atmosphere [
    ~r/\blift\s+lines?\b/i,
    ~r/\bqueues?\b/i,
    ~r/\bcrowd(?:s|ed|ing)?\b/i,
    ~r/\blocals?\s+know\b/i,
    ~r/\bin\s+the\s+know\b/i,
    ~r/\bhidden\s+gem\b/i,
    ~r/\byou'?ll\s+(?:find|feel|notice)\b/i,
    ~r/\bthins?\s+out\b/i
  ]

  defp atmosphere?(text) when is_binary(text),
    do: Enum.any?(@atmosphere, &Regex.match?(&1, text))

  test "the atmosphere ban catches observation nobody made" do
    for specimen <- [
          "the lift line thins after two",
          "queues build on Saturday mornings",
          "never crowded, even in February",
          "locals know to park at the lower lot",
          "a hidden gem in the Northeast Kingdom",
          "you'll find the glades quieter than the front side"
        ] do
      assert atmosphere?(specimen), "must be caught: #{inspect(specimen)}"
    end

    for specimen <- [
          "the single chair carries one skier at a time",
          "the co-operative caps ticket sales on peak days, per its own policy page",
          "the base lodge dates from 1948"
        ] do
      refute atmosphere?(specimen), "must publish: #{inspect(specimen)}"
    end
  end

  # ------------------------------------------------------------------
  # The bans over the committed corpus
  # ------------------------------------------------------------------

  # The bans are only as wide as `prose/1`. A photo caption renders on the page
  # like any other sentence, so it is swept — and this pins that, because
  # dropping the two fields back out of `prose/1` would leave every ban test
  # below still green while a superlative sat in a caption.
  test "the ban sweep reaches photo titles and descriptions" do
    synthetic = %{
      "guide" => %{
        "intro" => "an intro",
        "photos" => [%{"title" => "a caption title", "description" => "a caption description"}]
      },
      "places" => [
        %{
          "summary" => "s",
          "photos" => [%{"title" => "a place title", "description" => "a place description"}]
        }
      ],
      "entries" => []
    }

    texts = prose(synthetic)

    for field <- ["a caption title", "a caption description", "a place title", "a place description"] do
      assert field in texts, "prose/1 does not sweep #{inspect(field)}"
    end
  end

  test "no committed prose trips any of the six bans" do
    for {file, doc} <- docs(), text <- prose(doc), is_binary(text) do
      base = "#{Path.basename(file)}: #{inspect(String.slice(text, 0, 140))}"

      refute superlative?(text), "superlative — #{base}"
      refute unsourced_statistic?(text), "mountain statistic with no source in the same field — #{base}"
      refute unsourced_snowfall?(text), "snowfall with no source or no period — #{base}"
      refute undated_pass?(text), "pass affiliation with no season or no source — #{base}"
      refute unsourced_distance?(text), "distance or drive time with no source — #{base}"
      refute atmosphere?(text), "atmosphere presented as observation — #{base}"
    end
  end

  # ------------------------------------------------------------------
  # The inclusion rule, enforced
  # ------------------------------------------------------------------

  # The ski equivalent of korean_bbq's "every presented restaurant's prose names
  # a grill at the table", and the single most valuable test in this file:
  # without it, "operating, lift-served, open to the public" is a rule nothing
  # checks and the roster drifts region by region.
  @lift_evidence [
    ~r/\bchair\s?lifts?\b/i,
    ~r/\bdouble chair\b/i,
    ~r/\btriple chair\b/i,
    ~r/\bquad\b/i,
    ~r/\bgondola\b/i,
    ~r/\bt-bar\b/i,
    ~r/\bj-bar\b/i,
    ~r/\brope tow\b/i,
    ~r/\bsurface lift\b/i,
    ~r/\bpoma\b/i,
    ~r/\bplatter\b/i,
    ~r/\bmagic carpet\b/i,
    ~r/\bhandle tow\b/i,
    ~r/\blift-served\b/i,
    ~r/\bski area\b/i,
    ~r/\bski(?:ing|ers?)\b/i,
    ~r/\bsnowboard/i,
    ~r/\btrail network\b/i,
    ~r/\bsnowmaking\b/i,
    ~r/\bglades?\b/i
  ]

  defp lift_evidence?(text) when is_binary(text),
    do: Enum.any?(@lift_evidence, &Regex.match?(&1, text))

  defp lift_evidence?(_), do: false

  test "the lift-evidence patterns recognise a ski area and reject a village green" do
    assert lift_evidence?("a single chairlift built in 1948 carries skiers to the summit")
    assert lift_evidence?("two T-bars and a rope tow serve the town hill")
    assert lift_evidence?("a gondola from the base village")
    assert lift_evidence?("snowmaking covers the lower trail network")

    refute lift_evidence?("a general store on the village green with a post office counter")
    refute lift_evidence?("the base lodge was rebuilt in stone after the 1975 fire")
  end

  test "every published ski area's prose evidences lift-served skiing" do
    for {file, doc} <- docs(), p <- doc["places"], p["kind"] == "ski-area" do
      text = "#{p["summary"]} #{p["history"]}"

      assert lift_evidence?(text),
             "#{file}: #{p["slug"]} is published as a ski area but its prose never " <>
               "evidences lift-served skiing — the inclusion rule is an operating, " <>
               "lift-served area open to the public, and this does not read like one"
    end
  end

  # ------------------------------------------------------------------
  # Shape
  # ------------------------------------------------------------------

  test "every file carries exactly one ski area, named for the file itself" do
    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      areas = for p <- doc["places"], p["kind"] == "ski-area", do: p

      assert length(areas) == 1,
             "#{file}: #{length(areas)} places of kind ski-area, expected exactly 1"

      assert hd(areas)["slug"] == slug,
             "#{file}: the ski area's slug is #{inspect(hd(areas)["slug"])}, but the file " <>
               "is named #{inspect(slug)} — the roster, the file and the place slug are one name"
    end
  end

  test "the guide is named for the area and sits on the area's own node" do
    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))

      assert doc["guide"]["slug"] == "#{slug}-ski-guide",
             "#{file}: guide slug is #{inspect(doc["guide"]["slug"])}, expected #{slug}-ski-guide"

      assert doc["guide"]["destination_path"] == area["destination_path"],
             "#{file}: the guide sits on #{doc["guide"]["destination_path"]} and the mountain " <>
               "on #{area["destination_path"]}; the guide is the mountain's page and they " <>
               "share a node"

      assert doc["guide"]["tier"] == "guide", "#{file}: tier is #{inspect(doc["guide"]["tier"])}"
    end
  end

  test "every place carries a kind the vocabulary accepts and a status the schema accepts" do
    kinds = MapSet.new(Ethos.Places.Place.kinds())

    for {file, doc} <- docs(), p <- doc["places"] do
      assert MapSet.member?(kinds, p["kind"]),
             "#{file}: #{p["slug"]} has kind #{inspect(p["kind"])}"

      assert p["status"] in ~w(open closed), "#{file}: #{p["slug"]} status #{inspect(p["status"])}"
    end

    # Spec §1: operating areas only. A closed ski area is a roster question, not
    # a content question — drop the row rather than publishing a dead mountain.
    for {file, doc} <- docs(), p <- doc["places"], p["kind"] == "ski-area" do
      assert p["status"] == "open",
             "#{file}: #{p["slug"]} is a ski area with status closed; the corpus covers " <>
               "operating areas only, so this is a roster drop, not a published guide"
    end
  end

  test "the ski area is carried by a sight entry" do
    for {file, doc} <- docs() do
      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))
      entry = Enum.find(doc["entries"], &(&1["place_slug"] == area["slug"]))

      assert entry, "#{file}: no entry names the mountain itself, so it renders on no guide"

      assert entry["kind"] == "sight",
             "#{file}: the mountain's entry has kind #{inspect(entry["kind"])}, expected sight"
    end
  end

  # An empty `entries` array orphans every place in the file — the seed passes,
  # the images pass, and the guide renders with no places on it. It has happened
  # in this project before. The rule is one entry per place, so the two lists
  # are the same length.
  test "every place is carried by an entry, so nothing is orphaned on its guide" do
    entry_kinds = MapSet.new(Ethos.Guides.Entry.kinds())

    for {file, doc} <- docs() do
      places = doc["places"] || []
      entries = doc["entries"] || []

      refute entries == [], "#{file}: entries is empty, which orphans every place in the file"

      linked = MapSet.new(entries, & &1["place_slug"])

      for p <- places do
        assert MapSet.member?(linked, p["slug"]),
               "#{file}: #{p["slug"]} is a place no entry names, so it renders on no guide"
      end

      for e <- entries do
        assert MapSet.member?(entry_kinds, e["kind"]),
               "#{file}: entry #{e["name"]} has kind #{inspect(e["kind"])}"

        assert MapSet.member?(MapSet.new(places, & &1["slug"]), e["place_slug"]),
               "#{file}: entry #{e["name"]} names #{e["place_slug"]}, which the file does not define"
      end

      assert length(entries) == length(places),
             "#{file}: #{length(entries)} entries against #{length(places)} places; they are 1:1"
    end
  end

  test "no ski place restates one another corpus already owns" do
    ours = for {_f, doc} <- docs(), p <- doc["places"], into: MapSet.new(), do: p["slug"]

    theirs =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          not String.contains?(f, "/ski/"),
          doc = f |> File.read!() |> Jason.decode!(),
          is_list(doc["places"]),
          p <- doc["places"],
          into: MapSet.new(),
          do: p["slug"]

    dupes = ours |> MapSet.intersection(theirs) |> MapSet.to_list()

    assert dupes == [],
           "these places are already published by another corpus and must be linked, " <>
             "not restated: #{inspect(dupes)}"
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

  # Spec §2: entries cover the ski area, anything at its base area, and verified
  # places within the town or county node the guide attaches to. The tree node
  # IS the nearby rule, and this is what makes that a fact rather than a
  # sentence — a place three towns away is exactly the drift the rule exists to
  # prevent, and it is invisible on a rendered page.
  test "every place sits on the guide's node or inside its subtree" do
    for {file, doc} <- docs() do
      guide_path = doc["guide"]["destination_path"]

      for p <- doc["places"] do
        assert p["destination_path"] == guide_path or
                 String.starts_with?(p["destination_path"], guide_path <> "/"),
               "#{file}: #{p["slug"]} sits on #{p["destination_path"]}, outside the guide's " <>
                 "node #{guide_path} — the tree node is the nearby rule (spec §2)"
      end
    end
  end

  test "every link note fits the cap Ethos.Links.Link enforces" do
    for {file, doc} <- docs(), link <- doc["links"] || [] do
      note = link["note"] || ""

      assert String.length(note) <= 160,
             "#{Path.basename(file)}: link note is #{String.length(note)} characters, " <>
               "over the 160 Ethos.Links.Link.changeset/2 accepts:\n#{note}"
    end
  end

  test "every link target is a guide or place this corpus can resolve" do
    guides = for {_f, doc} <- docs(), into: MapSet.new(), do: doc["guide"]["slug"]

    all_guides =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          doc = f |> File.read!() |> Jason.decode!(),
          is_map(doc["guide"]),
          into: MapSet.new(),
          do: doc["guide"]["slug"]

    for {file, doc} <- docs(), link <- doc["links"] || [] do
      case link["target"] do
        "guide:" <> slug ->
          assert MapSet.member?(all_guides, slug),
                 "#{Path.basename(file)}: links to guide #{slug}, which no JSON corpus " <>
                   "defines. If it is a code-module guide, that is an ordering constraint " <>
                   "for docs/runbooks/seeding.md — Links.resolve!/1 raises on an unseeded " <>
                   "target and aborts the run partway"

          if not MapSet.member?(guides, slug) do
            IO.warn("#{Path.basename(file)}: links outside the ski corpus to #{slug}")
          end

        "place:" <> _slug ->
          :ok

        other ->
          flunk("#{Path.basename(file)}: bad link target #{inspect(other)}")
      end
    end
  end

  # ------------------------------------------------------------------
  # Photos (spec §6)
  # ------------------------------------------------------------------

  test "a guide carries between zero and three photos, and places carry none" do
    for {file, doc} <- docs() do
      n = length(doc["guide"]["photos"] || [])

      assert n <= 3, "#{file}: guide carries #{n} photos; spec §6 allows one to three"

      for p <- doc["places"] do
        assert (p["photos"] || []) == [],
               "#{file}: #{p["slug"]} carries a photo; the photos hang off the guide"
      end
    end
  end

  test "every photograph carries a publishable licence, its attribution and its file" do
    allowed = [
      "CC0",
      "Public domain",
      "CC BY 2.0",
      "CC BY 3.0",
      "CC BY 4.0",
      "CC BY-SA 2.0",
      "CC BY-SA 3.0",
      "CC BY-SA 4.0"
    ]

    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      assert photo["license"] in allowed, "#{file}: licence #{inspect(photo["license"])}"
      assert is_binary(photo["author"]) and photo["author"] != "", "#{file}: photo has no author"

      assert String.starts_with?(photo["source_url"] || "", "https://commons.wikimedia.org/"),
             "#{file}: photo source is not Commons"

      # Photos are served from priv/photos by their own Plug.Static (endpoint.ex),
      # not from priv/static — EthosWeb.static_paths/0 never lists a "photos"
      # directory, so a file resolved under priv/static would pass this gate and
      # 404 in production.
      assert File.exists?(
               Path.join(["priv", "photos", String.trim_leading(photo["src"], "/photos/")])
             ),
             "#{file}: photo file #{photo["src"]} is not on disk under priv/photos/"
    end
  end

  test "every photo src is under this corpus's own path" do
    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      slug = file |> Path.basename() |> Path.rootname()

      assert String.starts_with?(photo["src"], "/photos/ski/#{slug}/"),
             "#{file}: photo src #{photo["src"]} is not under /photos/ski/#{slug}/"
    end
  end

  # Spec §5: no trail maps or logos — both copyrighted. This is the ski
  # equivalent of London's Fourth Plinth exclusion, and a Commons licence on the
  # file does not make a photograph OF a copyrighted trail map publishable.
  test "no photograph is a trail map or a logo" do
    banned = [~r/\btrail map\b/i, ~r/\bpiste map\b/i, ~r/\blogo\b/i, ~r/\bsignage\b/i]

    for {file, doc} <- docs(), photo <- doc["guide"]["photos"] || [] do
      text = "#{photo["title"]} #{photo["description"]} #{photo["source_url"]}"

      for pattern <- banned do
        refute Regex.match?(pattern, text),
               "#{file}: photo #{photo["src"]} looks like a trail map or a logo, " <>
                 "which spec §5 excludes: #{inspect(text)}"
      end
    end
  end

  # ------------------------------------------------------------------
  # The corpus against the roster, in BOTH directions (spec §1)
  # ------------------------------------------------------------------

  # EXPECTED RED until the last content wave lands. The roster names every
  # built New England area and the corpus starts empty, so this fails from the
  # commit that introduces it. That is the point: it is the checklist that says
  # which mountains are still owed. Every other test in this file must be
  # green, and a second failure here is a real one.
  test "the corpus matches the roster's built rows" do
    expected = built() |> Enum.map(& &1["slug"]) |> Enum.sort()
    actual = files() |> Enum.map(&(&1 |> Path.basename() |> Path.rootname())) |> Enum.sort()

    assert actual == expected,
           "corpus and roster disagree — only in corpus: #{inspect(actual -- expected)}, " <>
             "only in roster: #{inspect(expected -- actual)}"
  end

  test "each file sits on the node its roster row names" do
    by_slug = Map.new(built(), &{&1["slug"], &1})

    for {file, doc} <- docs() do
      slug = file |> Path.basename() |> Path.rootname()
      row = by_slug[slug]

      assert row, "#{file}: no roster row named #{slug}"

      area = Enum.find(doc["places"], &(&1["kind"] == "ski-area"))

      assert area["destination_path"] == row["destination_path"],
             "#{file}: the mountain sits on #{area["destination_path"]}, the roster says " <>
               row["destination_path"]

      assert area["name"] == row["name"],
             "#{file}: the mountain is named #{inspect(area["name"])}, the roster says " <>
               inspect(row["name"])
    end
  end
end
```

- [ ] **Step 2: Run the gate and confirm exactly one red**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_seed_data_test.exs
```

Expected: exactly **1 failure** — "the corpus matches the roster's built rows", reporting every roster slug as "only in roster". Every other test green.

If any other test is red, it is a real defect in the gate — most likely a specimen test where a pattern is broader or narrower than intended. Fix the pattern or the specimen, not the assertion.

- [ ] **Step 3: Record the expected red in the ledger, format, commit**

```bash
mix format
git add test/ethos/seeds/ski_seed_data_test.exs
git commit -m "test: the ski corpus gate, red on the roster until the waves land"
```

Ledger line: `Task 5: ski_seed_data_test.exs lands with 1 expected red ("the corpus matches the roster's built rows"). Any second red from here is real.`

---

### Task 6: The photo manifest and the optimize task

**Files:**
- Create: `priv/seed_data/ski_photo_manifest.json`
- Create: `lib/mix/tasks/ethos.optimize_ski_photos.ex`
- Test: `test/mix/tasks/ethos_optimize_ski_photos_test.exs`

**Interfaces:**
- Consumes: `Ethos.PhotoManifest.verify!/3`, `Ethos.PhotoOptimizer.optimize/3` — both already exist.
- Produces: `mix ethos.optimize_ski_photos`, which reads `priv/seed_data/ski/*.json` for photo srcs and writes optimized files into `priv/photos/ski/{slug}/`. Every content wave (Tasks 7–15) adds its manifest rows and runs this before committing.

**Deviation from spec (2 of 4) — none here.** Spec §6 says photos live under `/photos/ski/{slug}/`, and that is what this builds. It differs from `steakhouse`'s `/photos/{country}/steakhouse/{city}/` deliberately: a ski area's slug is globally unique across the whole programme, so a later Canadian or Japanese round needs no country segment to avoid a collision.

- [ ] **Step 1: Write the failing test**

Create `test/mix/tasks/ethos_optimize_ski_photos_test.exs`:

```elixir
defmodule Mix.Tasks.Ethos.OptimizeSkiPhotosTest do
  use ExUnit.Case, async: true

  # Running the real optimizer needs source images on disk, which the corpus
  # does not have until a wave lands. What is worth pinning without them is the
  # contract every wave depends on: the task exists, it exits zero rather than
  # raising against an empty corpus, and the manifest it reads is well-formed
  # JSON in the shape PhotoManifest.verify!/3 expects.
  test "the task is registered" do
    assert Mix.Task.get("ethos.optimize_ski_photos")
  end

  test "the manifest is an object of label => {sha256, source_url}" do
    manifest =
      ["priv", "seed_data", "ski_photo_manifest.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    assert is_map(manifest)

    for {label, entry} <- manifest do
      assert label =~ ~r/^[a-z0-9-]+$/, "#{label} is not a kebab-case label"

      assert entry["sha256"] =~ ~r/^[0-9a-f]{64}$/,
             "#{label}: sha256 is #{inspect(entry["sha256"])}"

      assert String.starts_with?(entry["source_url"] || "", "https://commons.wikimedia.org/"),
             "#{label}: source_url is not Commons"
    end
  end

  # Every photo the corpus publishes must have a manifest row, or the task
  # raises mid-run and a wave commits a src pointing at a file nothing wrote.
  test "every published photo has a manifest row" do
    manifest =
      ["priv", "seed_data", "ski_photo_manifest.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    labels =
      for file <- Path.wildcard(Path.join(["priv", "seed_data", "ski", "*.json"])),
          doc = file |> File.read!() |> Jason.decode!(),
          photo <- doc["guide"]["photos"] || [],
          do: {Path.basename(file), photo["src"] |> Path.basename() |> Path.rootname()}

    missing = for {file, label} <- labels, not Map.has_key?(manifest, label), do: "#{file}: #{label}"

    assert missing == [],
           "these published photos have no provenance row in the manifest: #{inspect(missing)}"
  end
end
```

- [ ] **Step 2: Run it and watch it fail**

```
MIX_TEST_PARTITION=ski mix test test/mix/tasks/ethos_optimize_ski_photos_test.exs
```

Expected: FAIL — the task is not registered and the manifest file does not exist.

- [ ] **Step 3: Create the empty manifest**

```bash
printf '{}\n' > priv/seed_data/ski_photo_manifest.json
```

- [ ] **Step 4: Write the task**

Create `lib/mix/tasks/ethos.optimize_ski_photos.ex`:

```elixir
defmodule Mix.Tasks.Ethos.OptimizeSkiPhotos do
  @shortdoc "Optimizes ski photos from images/ski/ into priv/photos/ski/{slug}/"
  @moduledoc """
  Scans `priv/seed_data/ski/*.json` for photo srcs and optimizes
  `images/ski/{label}.*` accordingly.

  A src has the shape `/photos/ski/{slug}/{label}.jpg`, where `slug` is the ski
  area's own slug — the roster row, the seed file's basename and the place slug
  are all the same name. There is no country segment, unlike
  `Mix.Tasks.Ethos.OptimizeSteakhousePhotos`, and that is a decision rather than
  an oversight: a steakhouse called Hawksmoor exists in more than one country,
  while a ski area's slug is globally unique across the whole programme, so a
  later Canadian or Japanese round can write `/photos/ski/{slug}/` with no risk
  of collision and no migration of the paths this round writes.

  The destination root is `priv/photos/`, the directory the endpoint's own
  `/photos` `Plug.Static` serves (`from: {:ethos, "priv/photos"}`) — see
  `endpoint.ex`. `priv/static/` is not this: `EthosWeb.static_paths/0` never
  lists a `photos` directory, so a file written there would exist on disk and
  404 in production. `Ethos.Seeds.SkiSeedDataTest`'s photo test resolves a src
  the same way, by stripping the leading `/photos/` and joining under
  `priv/photos/`.

  ## The manifest

  `priv/seed_data/ski_photo_manifest.json` is a provenance manifest in the shape
  of `priv/seed_data/steakhouse_photo_manifest.json`: a flat object keyed by
  `label`, each value

      {"sha256": "<hex sha256 of the source file>",
       "source_url": "https://commons.wikimedia.org/wiki/File:..."}

  `find_source!/1` calls `Ethos.PhotoManifest.verify!/3`, which raises unless the
  label is present and its recorded sha256 matches the file found under
  `images/ski/`. It ships empty (`{}`) because no ski guide exists yet; each
  content wave adds its own rows before running this task.

  ## Running it against an empty corpus

  Run with no seed files present and this prints a message and exits zero rather
  than raising — the corpus not existing yet is not this task's error to report.

  Many guides ship photoless by design (spec §6: Commons has nothing for a great
  many small hills, and a guide without a photo is better than a guide with a
  borrowed substitute), so a run that optimizes far fewer photos than there are
  seed files is the expected case, not a symptom.
  """
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/ski_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/ski/*.json")

    if files == [] do
      Mix.shell().info("no seed files matched priv/seed_data/ski/*.json — nothing to optimize yet")
    else
      srcs = files |> Enum.flat_map(&photo_srcs/1) |> Enum.uniq()

      Enum.each(srcs, &optimize_src/1)
      Mix.shell().info("optimized #{length(srcs)} photos from #{length(files)} seed files")
    end
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "ski", slug, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ski", slug])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/ski/{slug}/{label}.jpg)")
    end
  end

  # Provenance is Ethos.PhotoManifest's job, not this task's: the manifest is
  # what keeps a page's printed author and licence attached to the pixels beside
  # them, and a per-task reimplementation of that check is how one copy drifts
  # weaker than the rest.
  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "ski", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/ski/")

    try do
      Ethos.PhotoManifest.verify!(@manifest_path, label, path)
    rescue
      e -> Mix.raise(Exception.message(e))
    end

    path
  end
end
```

- [ ] **Step 5: Run the tests and the task**

```
MIX_TEST_PARTITION=ski mix test test/mix/tasks/ethos_optimize_ski_photos_test.exs
mix ethos.optimize_ski_photos
```

Expected: tests PASS; the task prints `no seed files matched priv/seed_data/ski/*.json — nothing to optimize yet` and exits 0.

- [ ] **Step 6: Format and commit**

```bash
mix format
git add priv/seed_data/ski_photo_manifest.json lib/mix/tasks/ethos.optimize_ski_photos.ex \
        test/mix/tasks/ethos_optimize_ski_photos_test.exs
git commit -m "feat: the ski photo manifest and optimize task"
```

---

## Tasks 7–15: the content waves

Nine waves, each a slice of the roster. The slices are determinate the moment Task 2's roster exists; nothing here is a placeholder.

**The slice rule.** Order the roster's `build` rows by `state`, then by `slug`. Each wave below names a state and a range within that state's ordered rows. A range that runs past the end of its state's rows takes whatever remains; **a wave whose slice is empty is a no-op** — record `Task N: slice empty (state has M rows, wave takes rows X-Y), no work` in the ledger and mark it complete without a commit.

| Task | State | Rows in that state's ordered list |
| --- | --- | --- |
| 7 | Vermont | 1–12 |
| 8 | Vermont | 13–24 |
| 9 | New Hampshire | 1–12 |
| 10 | New Hampshire | 13–24 |
| 11 | New Hampshire | 25–36 |
| 12 | Maine | 1–12 |
| 13 | Maine | 13–24 |
| 14 | Massachusetts | 1–12 |
| 15 | Connecticut and Rhode Island | all rows in both |

Print your own slice before you start:

```bash
python3 - <<'PY'
STATE, LO, HI = 'Vermont', 1, 12      # <- edit to this wave's row
import json
r = json.load(open('priv/seed_data/ski_areas_roster.json'))
rows = sorted([a for a in r['areas'] if a['status'] == 'build' and a['state'] == STATE],
              key=lambda a: a['slug'])
print(f'{STATE}: {len(rows)} built rows; this wave takes {LO}-{HI}')
for a in rows[LO - 1:HI]:
    print(f"  {a['slug']:32} {a['destination_path']}")
PY
```

### The wave procedure (identical for Tasks 7 through 15)

Every wave runs these eleven steps. The steps are written once here; each task below names only its slice and its ledger line. Read this section in full before running any wave.

- [ ] **Step 1: Print the slice**

Run the script above with this wave's `STATE`, `LO`, `HI`. If it prints zero rows, stop: this wave is the no-op case described above.

- [ ] **Step 2: Research — two agents per area, in parallel across the slice**

For each area in the slice, dispatch a **finder**:

> Research {NAME}, a ski area in {TOWN}, {COUNTY}, {STATE}. Return a JSON object with two keys.
>
> `"claims"`: an array of rows, one per **concrete factual claim** you can establish. Each row is `{"claim": "...", "source": "...", "source_url": "...", "verdict": "confirmed"}`. The `source` must be nameable and specific — "the operator's mountain-statistics page", "the Vermont Ski Areas Association 2026 member list", "the Rutland Herald, 14 March 2019". **Not** "the resort's site" and never "general knowledge". A claim you cannot source does not get a row, and a sentence that is not backed by a row does not get written later.
>
> `"surroundings"`: an array of **places genuinely within {TOWN}** (or within {COUNTY} if the area is unincorporated) that a person visiting the mountain would plausibly use — a base lodge, an inn, a general store, a state park, a covered bridge, a brewery. Each with `{"name": "...", "kind": "<one of: museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop attraction>", "address": "...", "claims": [...same row shape...]}`. **Do not pad this list.** A hill whose town holds two things gets two; that is the point of spec §2's variable depth, and a padded list is the failure this project is built to avoid.
>
> Hard exclusions: no vertical drop, acreage, lift count, elevation or trail count without a named operator or authority in the row's `source`; no snowfall average without both a source and the period it covers; no pass affiliation without the current season named and a source; no distance or drive time you derived yourself rather than read somewhere; nothing about crowds, lift lines, queues or what "locals know" — nobody observed those and no source states them.
>
> Return only the JSON.

Then, for each area, dispatch an **adversarial verifier** over that finder's output:

> Here is a research result for the ski area {NAME}. Your job is to **refute** it, not to confirm it. For every claim row: check whether the named source actually establishes the claim as written; check whether the number has been rounded, transposed or taken from a different season; check whether the source is the operator repeating a marketing figure that a state or federal register contradicts. Return the same rows with `verdict` set to `confirmed`, `refuted` or `uncertain`, and for anything not `confirmed`, a `"note"` saying what is wrong and what the correct version is if you can establish one.
>
> Also check the `surroundings` list: is each place actually inside {TOWN}? Is it operating? Mark any that is not.

- [ ] **Step 3: Write the artifact rows — before writing any prose**

Append this wave's rows to `docs/ski/new-england.md`, creating it on the first wave with this header:

```markdown
# New England ski corpus — verification artifact

One row per concrete published claim: the area, the claim as published, the
specific named source that establishes it, and the verdict the adversarial
pass returned.

This file is the control. `test/ethos/seeds/ski_seed_data_test.exs` catches
shapes — banned words, missing sources beside a number, orphaned places,
licences, node resolution, roster agreement. It cannot tell a verified sentence
from a well-formed invented one, and the steakhouse corpus shipped three waves
of the second kind past a gate at least as thorough (spec §5, amended
2026-09-07). Rows are written during authoring, from research output, and never
transcribed back out of finished prose.

`uncertain` and `refuted` rows are kept, not deleted. A row that says a claim
was examined and rejected is how the next wave knows not to re-derive it.

## Known inconsistencies

- `united-states/massachusetts/boston` sits directly under the Massachusetts
  region rather than inside Suffolk County, while every county node this
  project added sits between the region and its towns. That predates this
  corpus; re-parenting Boston would move a live URL for no benefit here.

## Wave index

| Wave | Slice | Areas | Commit |
| --- | --- | --- | --- |
```

Each wave adds its index row and a section:

```markdown
## Wave N — {STATE} rows {LO}-{HI}

| Area | Claim as published | Source | URL | Verdict |
| --- | --- | --- | --- | --- |
```

**Content is authored only from `confirmed` rows.** `refuted` is excluded or corrected. `uncertain` is excluded from places and lodging entirely, and survives in history prose only by rewording out the unverified specific — "the lodge dates from the 1940s" where the year itself is uncertain, never "the lodge dates from 1948".

- [ ] **Step 4: Author the seed files**

One file per area at `priv/seed_data/ski/{slug}.json`. The shape, complete:

```json
{
  "guide": {
    "slug": "mad-river-glen-ski-guide",
    "title": "Mad River Glen, Vermont: the single chair and the co-op that owns it",
    "destination": "Fayston, Vermont",
    "destination_path": "united-states/vermont/washington-county/fayston",
    "tier": "guide",
    "intro": "…",
    "sections": [{"heading": "…", "body": "…"}],
    "faq": [{"question": "…", "answer": "…"}],
    "photos": [
      {
        "src": "/photos/ski/mad-river-glen/single-chair.jpg",
        "thumb": "/photos/ski/mad-river-glen/single-chair_thumb.jpg",
        "title": "…",
        "description": "…",
        "author": "…",
        "license": "CC BY-SA 4.0",
        "source_url": "https://commons.wikimedia.org/wiki/File:…"
      }
    ]
  },
  "places": [
    {
      "slug": "mad-river-glen",
      "name": "Mad River Glen",
      "kind": "ski-area",
      "destination_path": "united-states/vermont/washington-county/fayston",
      "address": "…",
      "summary": "…",
      "history": "…",
      "status": "open",
      "photos": []
    }
  ],
  "entries": [
    {"kind": "sight", "name": "Mad River Glen", "place_slug": "mad-river-glen", "note": "…"}
  ],
  "links": [
    {"target": "guide:sugarbush-ski-guide", "kind": "nearby", "note": "…"}
  ]
}
```

Rules the gate enforces and you should not have to discover by failing:

- The guide slug is `{area-slug}-ski-guide`. The file basename, the ski-area place slug and the roster row slug are the same string.
- The guide sits on the same node as the mountain. Other places sit on that node or inside its subtree — **the tree node is the nearby rule** (spec §2); there is no second radius.
- Exactly one place of kind `ski-area`, carried by an entry of kind `sight`.
- One entry per place, no exceptions: `entries` and `places` are the same length. An empty `entries` array orphans every place while the seed, the images and the page all still pass.
- `status` is `open` on the mountain (spec §1 covers operating areas only) and `open`/`closed` on the rest.
- `links[*].note` is at most 160 characters — `Ethos.Links.Link.changeset/2` caps it, and over-length notes have aborted a production seed after the guides had published.
- Depth follows what is verifiable. Vail-scale mountains get ~12 entries and 3 sections; a two-lift community hill gets ~3 entries and 1 section, and the page says plainly that the town holds little else. **Nothing is padded and nothing is invented.**

`nearby` links between mountains are authored per file — the adjacency subsystem is Connecticut town borders and does not generalise here. Link only to ski guides **inside this corpus**; a link to a guide in another corpus is an ordering constraint for `docs/runbooks/seeding.md` and must be raised as a finding, not quietly added.

- [ ] **Step 5: Photos**

Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed, never hotlinked. One to three of the mountain, its base area or its lodge where Commons has them; **where it does not, the guide ships photoless.** Do not borrow a substitute, and do not use a trail map or a logo — both are copyrighted regardless of the licence on the photograph of them.

For each photo: download the source into `images/ski/{label}.{ext}`, add its row to `priv/seed_data/ski_photo_manifest.json`:

```bash
python3 - <<'PY'
import hashlib, json, sys
label, path, url = sys.argv[1], sys.argv[2], sys.argv[3]
m = json.load(open('priv/seed_data/ski_photo_manifest.json'))
m[label] = {"sha256": hashlib.sha256(open(path, 'rb').read()).hexdigest(), "source_url": url}
json.dump(dict(sorted(m.items())), open('priv/seed_data/ski_photo_manifest.json', 'w'),
          indent=2, ensure_ascii=False)
open('priv/seed_data/ski_photo_manifest.json', 'a').write('\n')
PY
```

then run the optimizer:

```bash
mix ethos.optimize_ski_photos
```

- [ ] **Step 6: Run the gate**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_seed_data_test.exs
```

Expected: the one known red ("the corpus matches the roster's built rows") until the final wave, and **nothing else**. Fix every other failure before proceeding — a ban that fires is prose to rewrite or a source to add, never a pattern to loosen. Loosening a pattern is a finding for the reviewer, not an edit you make alone.

- [ ] **Step 7: Run the two sweeps the artifact structurally cannot catch**

Spec §5 names two classes a per-area artifact cannot hold. The gate covers both, and this grep is the belt to its braces — it reads the whole slice at once and catches a phrasing the regexes miss:

```bash
python3 - <<'PY'
import json, re, glob
PATTERNS = {
  'distance/direction': r'\b[\d.]+\s*(miles?|mi\.|km|kilomet)|\bminute\b|\bdrive\b|\bnorth of\b|\bsouth of\b|\beast of\b|\bwest of\b|\bnearby\b|\bjust up the road\b',
  'atmosphere':         r'\bcrowd|\bqueue|\blift line|\blocals?\b|\bquiet\b|\bbusy\b|\byou\'?ll\b|\bfeels?\b|\bthins? out\b',
}
def texts(d):
    g = d['guide']
    yield g['intro']
    for s in g.get('sections', []): yield s['body']
    for f in g.get('faq', []): yield f['question']; yield f['answer']
    for p in d.get('places', []): yield p.get('summary', ''); yield p.get('history', '')
    for e in d.get('entries', []): yield e.get('note', '')
    for ph in g.get('photos', []): yield ph.get('title', ''); yield ph.get('description', '')
hits = 0
for f in sorted(glob.glob('priv/seed_data/ski/*.json')):
    d = json.load(open(f))
    for t in texts(d):
        for name, pat in PATTERNS.items():
            for m in re.finditer(pat, t or '', re.I):
                lo, hi = max(0, m.start() - 60), m.end() + 60
                print(f'{f.split("/")[-1]:34} [{name}] …{t[lo:hi]}…')
                hits += 1
print(f'\n{hits} hits to read by hand')
PY
```

Read every hit. A hit is not automatically a defect — "the access road climbs north out of the valley, per the town's road inventory" is fine — but every hit must be one you have looked at and can justify from an artifact row.

- [ ] **Step 8: Run the reverse check on your own slice**

Not "does each artifact row have a source" — that direction passed in all three steakhouse waves while the prose outran the evidence. Pull the specifics **out of the published prose** and find their rows:

```bash
python3 - <<'PY'
import json, re, glob, sys
SLICE = sys.argv[1:]   # slugs in this wave
SPECIFIC = r'\b(1[6-9]\d\d|20[0-2]\d)\b|\b[\d,]{2,}\s*(feet|ft|acres|inches)\b|\b\d+\s*(lifts?|trails?|runs?|chairs?)\b|\b[A-Z][a-z]+(?:\s+[A-Z][a-z]+)*\s+(Pass|Association|Commission|Company|Corporation)\b'
def texts(d):
    g = d['guide']
    yield g['intro']
    for s in g.get('sections', []): yield s['body']
    for f in g.get('faq', []): yield f['answer']
    for p in d.get('places', []): yield p.get('summary', ''); yield p.get('history', '')
    for e in d.get('entries', []): yield e.get('note', '')
for slug in SLICE:
    d = json.load(open(f'priv/seed_data/ski/{slug}.json'))
    found = sorted({m.group(0) for t in texts(d) for m in re.finditer(SPECIFIC, t or '')})
    print(f'{slug}: {found}')
PY
```

For each specific this prints, open `docs/ski/new-england.md` and find the row. **Every published specific with no row is either given one from the research output or deleted from the prose.** Retro-fitting a row from the prose is transcription, not verification, and is forbidden — if the research never established it, the sentence goes.

- [ ] **Step 9: Run the whole suite**

```
MIX_TEST_PARTITION=ski mix test
```

Expected: the one known ski red and nothing else. Watch particularly for the global place-slug uniqueness test — a mountain-town inn named "The Inn at Long Trail" may collide with a place another corpus already owns, in which case link to that corpus's guide rather than restating the place.

- [ ] **Step 10: Format and commit**

```bash
mix format
git add priv/seed_data/ski/ priv/seed_data/ski_photo_manifest.json priv/photos/ski/ \
        images/ski/ docs/ski/new-england.md
git commit -m "content: ski wave N — {STATE} rows {LO}-{HI}"
```

- [ ] **Step 11: Ledger**

`Task N: wave N committed <sha>. K areas, P photos, Q artifact rows. Reverse check: R published specifics, all matched to rows. Sweeps: S hits, all justified.`

---

### Task 7: Content wave 1 — Vermont, rows 1–12

Run the wave procedure with `STATE = 'Vermont'`, `LO = 1`, `HI = 12`.

This is the first wave and therefore also creates `docs/ski/new-england.md` with the header printed in Step 3 above, including its "Known inconsistencies" section.

Vermont first because the state carries the widest depth range in the region — Killington and Stowe alongside genuine two-lift community hills — and spec §8 chose New England as the pilot for exactly that reason. If the variable-depth rule is going to be got wrong, it will be got wrong here, in the wave with the most eyes on it.

### Task 8: Content wave 2 — Vermont, rows 13–24

Run the wave procedure with `STATE = 'Vermont'`, `LO = 13`, `HI = 24`.

### Task 9: Content wave 3 — New Hampshire, rows 1–12

Run the wave procedure with `STATE = 'New Hampshire'`, `LO = 1`, `HI = 12`.

### Task 10: Content wave 4 — New Hampshire, rows 13–24

Run the wave procedure with `STATE = 'New Hampshire'`, `LO = 13`, `HI = 24`.

### Task 11: Content wave 5 — New Hampshire, rows 25–36

Run the wave procedure with `STATE = 'New Hampshire'`, `LO = 25`, `HI = 36`.

### Task 12: Content wave 6 — Maine, rows 1–12

Run the wave procedure with `STATE = 'Maine'`, `LO = 1`, `HI = 12`.

### Task 13: Content wave 7 — Maine, rows 13–24

Run the wave procedure with `STATE = 'Maine'`, `LO = 13`, `HI = 24`.

### Task 14: Content wave 8 — Massachusetts, rows 1–12

Run the wave procedure with `STATE = 'Massachusetts'`, `LO = 1`, `HI = 12`.

### Task 15: Content wave 9 — Connecticut and Rhode Island, all rows

Run the wave procedure twice within this one task — once with `STATE = 'Connecticut'`, `LO = 1`, `HI = 99`, and once with `STATE = 'Rhode Island'`, `LO = 1`, `HI = 99` — and commit both together. These two states hold few enough areas between them that splitting them into separate reviews buys nothing.

**This is the last wave, and the gate's expected red must clear here.** After Step 6, `the corpus matches the roster's built rows` must go **green**. If it does not, the message names exactly which mountains are still owed; finish them in this task rather than deferring. Update the ledger line to say the expected red is cleared, so no later task keeps excusing a failure that is now real.

---

### Task 16: The collections

**Files:**
- Create: `lib/ethos/seeds/ski_collections.ex`
- Create: `test/ethos/seeds/ski_collections_test.exs`
- Modify: `lib/ethos/release.ex` (`seed_collections/0`)
- Modify: `docs/runbooks/seeding.md` (the collections step's count and list)

**Interfaces:**
- Consumes: every guide from Tasks 7–15; `priv/seed_data/ski_areas_roster.json`.
- Produces: `Ethos.Seeds.SkiCollections.upsert_all!/0` returning a list of collections; `regional/0` and `parent/0` returning attrs maps, exposed separately so the gate can read the module's own prose without writing to the repo.

`Collections.upsert_collection!/1` raises `"collection ... references unknown guide ..."` on an item whose guide has no row yet, which is why `seed_collections/0` runs last in the release sequence and why this task comes after every content wave.

**Deviation from spec (3 of 4).** Spec §4 names seven regional collections plus a parent. This round ships **two**: `/c/skiing-new-england` and the parent `/c/skiing-and-snowboarding-united-states`. The other six regions have no guides, and a collection naming a guide that does not exist raises at seed time. The parent ships now rather than waiting, because its items are a *different* selection from the regional collection's — a curated 12-15 spanning the range, against New England's complete list — so it is a real page and not a duplicate. Its intro names all seven regions in prose but links only to the one that exists; Projects B–G each add a `defp` and extend the parent. Cost: for the life of round one the parent's curated selection is drawn from one region, which its own intro must say plainly rather than implying a national selection.

**Deviation from spec (4 of 4).** Spec §7 asks for "a collections test asserting seven regional collections and the parent, with membership counts derived from the roster rather than hardcoded." The count assertion here is **two collections**, for the reason above; the derived-membership half is implemented exactly as specified.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/seeds/ski_collections_test.exs`:

```elixir
defmodule Ethos.Seeds.SkiCollectionsTest do
  use Ethos.DataCase, async: false

  alias Ethos.Seeds.SkiCollections

  @roster Path.join(["priv", "seed_data", "ski_areas_roster.json"])

  defp roster, do: @roster |> File.read!() |> Jason.decode!()

  test "the regional collection is published, with a blurb per guide" do
    attrs = SkiCollections.regional()

    assert attrs.slug == "skiing-new-england"
    assert attrs.published == true
    assert String.length(attrs.intro) > 200

    for item <- attrs.items do
      assert String.ends_with?(item.guide_slug, "-ski-guide")
      assert is_binary(item.blurb) and item.blurb != ""
    end
  end

  # Membership is DERIVED from the roster, never hardcoded (spec §7). A regional
  # collection that lists 60 of 62 mountains is a page that looks complete and
  # is not, and no rendered page would say so.
  test "the New England collection holds every built New England guide, and only those" do
    expected =
      for a <- roster()["areas"],
          a["status"] == "build",
          a["region"] == "new-england",
          into: MapSet.new(),
          do: "#{a["slug"]}-ski-guide"

    actual = MapSet.new(SkiCollections.regional().items, & &1.guide_slug)

    assert MapSet.equal?(actual, expected),
           "collection and roster disagree — only in collection: " <>
             "#{inspect(MapSet.difference(actual, expected))}, " <>
             "only in roster: #{inspect(MapSet.difference(expected, actual))}"
  end

  test "the parent is a curated selection, not a second copy of the regional list" do
    parent = SkiCollections.parent()

    assert parent.slug == "skiing-and-snowboarding-united-states"
    assert parent.published == true

    n = length(parent.items)
    assert n >= 12 and n <= 15, "the parent curates 12-15 mountains; it has #{n}"

    regional = MapSet.new(SkiCollections.regional().items, & &1.guide_slug)
    curated = MapSet.new(parent.items, & &1.guide_slug)

    assert MapSet.subset?(curated, regional),
           "the parent names guides no regional collection carries: " <>
             inspect(MapSet.difference(curated, regional))

    assert MapSet.size(curated) < MapSet.size(regional),
           "the parent is a curated selection; if it holds everything the regional " <>
             "collection holds, it is a duplicate page"
  end

  # Round one publishes one region, and the parent's intro must say so rather
  # than implying a national selection — its 12-15 mountains are all in New
  # England. It must also not link to five collections that do not exist.
  test "the parent's intro is honest about what is published" do
    intro = SkiCollections.parent().intro

    assert intro =~ ~r/New England/,
           "the parent curates New England mountains only; its intro must say so"

    for absent <- ~w(skiing-the-rockies skiing-the-midwest skiing-the-pacific
                     skiing-the-mid-atlantic skiing-the-southeast skiing-alaska) do
      refute intro =~ absent,
             "the intro links to /c/#{absent}, which does not exist — a dead collection " <>
               "link renders as an ordinary link and 404s"
    end
  end

  # `Collections.upsert_collection!/1` writes each item through
  # `CollectionItem.changeset/2`, which caps `:blurb` at 255 and is a
  # varchar(255) underneath. Seven over-length steakhouse blurbs aborted
  # seed_collections/0 in production, leaving the collection unseeded.
  test "every blurb fits the cap CollectionItem enforces" do
    for attrs <- [SkiCollections.regional(), SkiCollections.parent()],
        item <- attrs.items do
      blurb = item[:blurb] || ""

      assert String.length(blurb) <= 255,
             "#{attrs.slug}/#{item[:guide_slug]}: blurb is #{String.length(blurb)} " <>
               "characters, over the 255 CollectionItem.changeset/2 accepts:\n#{blurb}"
    end
  end

  test "upsert_all!/0 seeds both collections, idempotently" do
    user = Ethos.AccountsFixtures.user_fixture()
    ExUnit.CaptureIO.capture_io(fn -> Ethos.Release.seed_ski(user.email) end)

    slugs = SkiCollections.upsert_all!() |> Enum.map(& &1.slug) |> Enum.sort()
    assert slugs == ["skiing-and-snowboarding-united-states", "skiing-new-england"]

    assert SkiCollections.upsert_all!() |> Enum.map(& &1.slug) |> Enum.sort() == slugs
  end
end
```

- [ ] **Step 2: Run it and watch it fail**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_collections_test.exs
```

Expected: FAIL — `Ethos.Seeds.SkiCollections` is undefined.

- [ ] **Step 3: Write the module**

Create `lib/ethos/seeds/ski_collections.ex`. The structure is fixed; the prose is yours to write from the corpus you now have in front of you, and every specific in it is subject to the same rule as the guides — an artifact row or it does not get written.

```elixir
defmodule Ethos.Seeds.SkiCollections do
  @moduledoc """
  Seeds the ski collections. Idempotent by slug.

  Two collections in this round, not the eight spec §4 describes, and the gap
  is deliberate rather than unfinished. `Collections.upsert_collection!/1`
  raises on an item whose guide slug has no row, so a regional collection can
  exist only once its region's guides do — and only New England is published.
  Projects B through G each add a `defp` here and extend `parent/0`'s curated
  list; nothing in this module has to be restructured for them.

  `Collections.upsert_collection!/1` raises on an unseeded guide, so this must
  run after `seed_ski/1` — which is why `seed_collections/0` runs last in the
  release sequence.

  ## The parent is a selection, not a directory

  Collections hold guides, flat, so the parent cannot list the regional
  collections as members. It links them from its intro and carries a curated
  selection of mountains as its items. That selection is drawn from New England
  alone while New England is all there is, and the intro says so — a page
  headed "Skiing and Snowboarding in the United States" whose twelve mountains
  are all in Vermont, New Hampshire and Maine, and which does not admit it, is
  a page that misleads about its own scope.
  """

  alias Ethos.Collections

  def upsert_all! do
    [regional(), parent()]
    |> Enum.map(&Collections.upsert_collection!/1)
  end

  @doc """
  The New England regional collection's attrs.

  Exposed separately from `upsert_all!/0` so the seed gate can read this
  module's own prose — intro and every item blurb — without writing to the repo,
  the practice `Ethos.Seeds.SteakhouseCollection` established.
  """
  def regional do
    %{
      slug: "skiing-new-england",
      title: "Skiing New England",
      published: true,
      intro: """
      <write this from the corpus: how many mountains, across which six states,
      and what the range actually is — the largest lift-served areas in the
      region alongside town hills running a single rope tow. Say plainly that
      the list is every operating lift-served area open to the public, not a
      selection, because that is what makes it worth having. Name the roster as
      the authority on scope.>
      """,
      items: [
        # One per built New England roster row, in the order you want them read.
        # The test derives the SET from the roster; the ORDER is an editorial
        # decision and yours to make.
        %{
          guide_slug: "mad-river-glen-ski-guide",
          blurb: "<one or two sentences, at most 255 characters, saying what this mountain is>"
        }
      ]
    }
  end

  @doc """
  The parent collection's attrs — a curated 12-15 mountains spanning the range.

  Same separation and the same reason as `regional/0`.
  """
  def parent do
    %{
      slug: "skiing-and-snowboarding-united-states",
      title: "Skiing and Snowboarding in the United States",
      published: true,
      intro: """
      <write this from the corpus. It must: (1) name New England as the region
      published so far and say the twelve to fifteen mountains below are drawn
      from it; (2) name the six regions still to come — the Rockies, the
      Midwest, the Pacific, the Mid-Atlantic, the Southeast and Alaska — in
      prose, WITHOUT linking to their collections, which do not exist; (3) link
      /c/skiing-new-england, which does.>
      """,
      items: [
        # 12-15 guides, every one of them also in regional/0's list. Span the
        # range deliberately: the largest areas, a co-operative, a town hill, a
        # rope tow. A curated list that is just the twelve biggest is a list the
        # regional collection already sorts you to.
        %{
          guide_slug: "mad-river-glen-ski-guide",
          blurb: "<why this mountain is in a selection of fifteen, at most 255 characters>"
        }
      ]
    }
  end
end
```

- [ ] **Step 4: Wire it into the release**

In `lib/ethos/release.ex`, `seed_collections/0` currently ends with the `ScenicBywaysCollections` loop. `SkiCollections` returns a list like that one, so add a matching loop after it:

```elixir
    for collection <- Ethos.Seeds.ScenicBywaysCollections.upsert_all!() do
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end

    for collection <- Ethos.Seeds.SkiCollections.upsert_all!() do
      IO.puts("Seeded collection: /c/#{collection.slug}")
    end
```

- [ ] **Step 5: Run the collections tests**

```
MIX_TEST_PARTITION=ski mix test test/ethos/seeds/ski_collections_test.exs
```

Expected: PASS. "the New England collection holds every built New England guide" names exactly which mountains you missed if it fails.

- [ ] **Step 6: Update the runbook's collections step**

`docs/runbooks/seeding.md` step 15 (the renumbered `seed_collections`) says "nine collections". It is now eleven. Update the count and add the two to its list, naming step 13 as the source:

```markdown
    ... and Skiing New England plus its parent, Skiing and Snowboarding in the
    United States (both step 13 — the parent's curated items are New England
    guides, so it has the same precondition the regional collection does).
```

- [ ] **Step 7: Run the whole suite**

```
MIX_TEST_PARTITION=ski mix test
```

Expected: 0 failures. The ski gate's expected red cleared in Task 15; if it is red here, Task 15 did not finish.

- [ ] **Step 8: Format and commit**

```bash
mix format
git add lib/ethos/seeds/ski_collections.ex test/ethos/seeds/ski_collections_test.exs \
        lib/ethos/release.ex docs/runbooks/seeding.md
git commit -m "feat: the New England ski collection and its parent"
```

---

### Task 17: The whole-corpus reverse check

**Files:**
- Modify: `docs/ski/new-england.md`
- Modify: any seed file whose prose outran its evidence

**Interfaces:**
- Consumes: the whole corpus and the whole artifact.
- Produces: an artifact whose rows account for every published specific, and a "Findings" section recording what was deleted and why.

Each wave ran the reverse check on its own slice. This task runs it across all nine at once, which catches what a per-slice check structurally cannot: a claim that appears in two guides sourced in one, a source cited in wave 2 that wave 7 contradicts, and the drift that comes of nine waves each reading the rules slightly differently.

The steakhouse corpus is the reason this task exists as its own gate rather than as a line in the last wave. All three of its waves passed their own reviews; the defects surfaced only when someone read finished prose across the whole corpus hunting for rows — 40 claims deleted in wave 1's fix round, 5 in wave 2, about 15 in wave 3 including one that contradicted its own artifact row.

- [ ] **Step 1: Extract every published specific in the corpus**

```bash
python3 - <<'PY'
import json, re, glob, collections
SPECIFIC = r'\b(1[6-9]\d\d|20[0-2]\d)\b|\b[\d,]{2,}\s*(feet|ft|acres|inches|metres|meters)\b|\b\d+\s*(lifts?|trails?|runs?|chairs?|tows?)\b|\b(Epic|Ikon|Indy|Mountain Collective)\s+Pass\b'
def texts(d):
    g = d['guide']
    yield g['intro']
    for s in g.get('sections', []): yield s['body']
    for f in g.get('faq', []): yield f['question']; yield f['answer']
    for p in d.get('places', []): yield p.get('summary',''); yield p.get('history','')
    for e in d.get('entries', []): yield e.get('note','')
    for ph in g.get('photos', []): yield ph.get('title',''); yield ph.get('description','')
rows = []
for f in sorted(glob.glob('priv/seed_data/ski/*.json')):
    slug = f.split('/')[-1][:-5]
    for t in texts(json.load(open(f))):
        for m in re.finditer(SPECIFIC, t or ''):
            lo, hi = max(0, m.start()-70), m.end()+70
            rows.append((slug, m.group(0), (t[lo:hi]).replace('\n', ' ')))
print(f'{len(rows)} published specifics across {len(set(r[0] for r in rows))} guides\n')
for slug, spec, ctx in rows:
    print(f'{slug}\t{spec}\t…{ctx}…')
PY
```

Write the output to the scratchpad — it is long and does not belong in a report.

- [ ] **Step 2: Match every one against the artifact**

For each row, find its row in `docs/ski/new-england.md`. Three outcomes and only three:

1. **A row exists and says the same thing.** Nothing to do.
2. **A row exists and says something different.** The artifact wins; the prose is wrong. Correct the prose to the row.
3. **No row exists.** Delete the sentence, or the clause carrying the specific. Do not write a row for it now — that is transcription, not verification, and it is precisely how a corpus launders an invention into a cited fact.

- [ ] **Step 3: Check the corpus against itself**

```bash
python3 - <<'PY'
import json, re, glob, collections
# A claim asserted in two guides should be sourced the same way in both.
YEARS = collections.defaultdict(set)
for f in sorted(glob.glob('priv/seed_data/ski/*.json')):
    slug = f.split('/')[-1][:-5]
    d = json.load(open(f))
    blob = json.dumps(d)
    for y in set(re.findall(r'\b(1[6-9]\d\d|20[0-2]\d)\b', blob)):
        YEARS[y].add(slug)
shared = {y: s for y, s in YEARS.items() if len(s) > 1}
for y, s in sorted(shared.items()):
    print(f'{y}: {sorted(s)}')
print(f'\n{len(shared)} years asserted in more than one guide — check each pair says the same thing')
PY
```

- [ ] **Step 4: Record the findings**

Append a section to `docs/ski/new-england.md`:

```markdown
## Whole-corpus reverse check

Run across all nine waves after the last one landed. N published specifics
extracted; M matched an existing row; K corrected against their row; J deleted
for having none.

| Area | Specific | Outcome | Why |
| --- | --- | --- | --- |
```

If J is zero across nine waves and ~85 guides, that is not a clean result — it is a check that did not bite, and the reviewer should treat it as one. Say so in the section rather than presenting it as a pass.

- [ ] **Step 5: Run the whole suite**

```
MIX_TEST_PARTITION=ski mix test
```

Expected: 0 failures.

- [ ] **Step 6: Verify what actually renders**

Prose gates and JSON shape checks both pass on a page that renders nothing. The geography refactor's worst defects were all HTTP-200-with-a-correct-looking-page failures: seven interior hubs rendering no unit, two affiliate widgets silently dead, thirteen redirects disabled by shadowing rows. Seed the corpus locally and count what comes out:

```bash
MIX_TEST_PARTITION=ski mix run -e '
  {:ok, _} = Application.ensure_all_started(:ethos)
  email = Ethos.Repo.one(Ecto.Query.from(u in Ethos.Accounts.User, limit: 1, select: u.email))
  Ethos.Release.seed_ski(email)
  Ethos.Seeds.SkiCollections.upsert_all!()
' 2>&1 | tail -20
```

Then, with the server running, check that a guide page actually carries its places:

```bash
mix phx.server &
sleep 8
python3 - <<'PY'
import json, glob, re, urllib.request
for f in sorted(glob.glob('priv/seed_data/ski/*.json'))[:8]:
    d = json.load(open(f))
    slug = d['guide']['slug']
    html = urllib.request.urlopen(f'http://localhost:4000/g/{slug}').read().decode()
    links = set(re.findall(r'href="(/p/[a-z0-9-]+)"', html))
    print(f'{slug:44} {len(links):3} place links, expected {len(d["places"])}')
PY
PY
kill %1
```

Every guide must show as many `/p/` links as it has places. A guide showing zero is the orphaned-entries failure this project has shipped before, and it passes every JSON gate.

- [ ] **Step 7: Format and commit**

```bash
mix format
git add docs/ski/new-england.md priv/seed_data/ski/
git commit -m "fix: whole-corpus reverse check across all nine New England waves"
```

---

## Self-review

**Spec coverage.**

| Spec section | Task |
| --- | --- |
| §1 scope and roster; both-directions agreement | 2 (roster + gate), 5 (`the corpus matches the roster's built rows`) |
| §2 variable depth; "the tree node is the nearby rule" | 5 (`every place sits on the guide's node or inside its subtree`), 7–15 Step 4 |
| §3 town-or-county node placement; new nodes; no legacy paths | 2 (`destination_path` rules), 3 |
| §3 two-state areas; linked areas stay two guides | 2 (stated in the roster's scope rules) |
| §4 corpus shape, `ski-area` kind, JSON not Elixir modules | 1, 5, 7–15 |
| §4 collections, flat-collection limitation, parent's markdown intro | 16 |
| §5 research: finder + adversarial verifier, confirmed-only authoring | 7–15 Steps 2–3 |
| §5 amendment: artifact during authoring, committed, reverse check | 7–15 Steps 3 and 8; 17 |
| §5 the two classes an artifact cannot hold | 5 (bans 5 and 6), 7–15 Step 7 |
| §5 ski content rules (statistics, snowfall, passes, trail maps, superlatives) | 5 (bans 1–4, trail-map test) |
| §6 photos: Commons only, 1–3 or photoless, manifest, optimize task | 5, 6, 7–15 Step 5 |
| §7 gates, each with a non-vacuity assertion | 5 |
| §7 `MIX_TEST_PARTITION` mandatory | Global Constraints; every test command in the plan |
| §8 Project A carries all the code; New England is the pilot | 1–6 (code), 7–15 (pilot) |
| §9 `seed_ski/1` in the numbered runbook order | 4 |
| §9 new nodes seed before the corpus | 3 before 7; and `seed_directory/2` seeds the tree itself |

**Four deviations, each stated where it occurs:** the roster is New England-complete rather than all-470 (Task 2); two collections rather than eight (Task 16); the collections test asserts two rather than seven-plus-parent (Task 16); photos use `/photos/ski/{slug}/` with no country segment, which is what §6 specifies and differs from the steakhouse sibling deliberately (Task 6).

**Type and name consistency.** `seed_ski/1` (Task 4) is the name used in Tasks 4, 16 and the runbook. `Ethos.Seeds.SkiCollections.regional/0`, `parent/0` and `upsert_all!/0` (Task 16) are the names its test uses. `ski_areas_roster.json` is the filename in Tasks 2, 3, 5 and 16; `ski_seed_data_test.exs` in Tasks 5 and 7–15; `ski_photo_manifest.json` in Tasks 6 and 7–15. `"ski-area"` is the kind in Tasks 1, 5 and 7–15. `{slug}-ski-guide` is the guide-slug rule in Tasks 5, 7–15 and 16. `docs/ski/new-england.md` is the artifact path in Tasks 3, 7–15 and 17.
