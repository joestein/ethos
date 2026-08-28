# Brooklyn Neighborhoods Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a page for every one of Brooklyn's 69 neighborhoods — full guides where research supports them, orientation pages where it does not — with history, transit, parks, eateries, hotels, photos and a dense link graph.

**Architecture:** Content-first program on machinery that already exists. Seed files are JSON under `priv/seed_data/brooklyn/`, loaded by the existing `Ethos.Seeds.DataGuide` three-pass loader. Three small code additions carry it: a release seed function, a photo optimizer Mix task, and a validation test. Eight content waves, each owning its own research, photos, authoring and review. No migration, no schema change, no new routes.

**Tech Stack:** Elixir 1.x / Phoenix 1.7.14 (`current_user` conventions, **not** 1.8 scopes), Ecto/Postgres, dead controller views with HEEx templates, ExUnit, Fly.io deploy.

**Spec:** `docs/superpowers/specs/2026-08-28-brooklyn-neighborhoods-design.md`

## Global Constraints

Every task's requirements implicitly include this section.

- **Zero AI calls and zero external API calls in shipped code.** Research happens in agents at authoring time; the running application never calls out.
- **`cryptcom@gmail.com` is the only admin user.** Never introduce another.
- **Phoenix 1.7.14 conventions.** `current_user`, dead views, `~p` sigil. Do not write 1.8 scope-style code.
- **Guides carry `state: "New York"`, `county: "Brooklyn"`.** The borough occupies the `county` field, exactly as Manhattan does.
- **Guide slugs are `{neighborhood-slug}-brooklyn-guide`.** Place slugs are kebab-case and globally unique across the entire site.
- **`tier` is `"guide"` or `"town-page"`, decided after research** from the count of places surviving verification: 6 or more → `"guide"`, fewer → `"town-page"`.
- **Place `kind` comes from the closed set** `museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park attraction`. Anything else fails changeset validation.
- **No trip-duration claims anywhere** — no "twenty minutes to Midtown", no "a short ride away". Station names and line designations only. Enforced by test.
- **Photo licences** are limited to `Public domain`, `CC0`, `CC BY x.y`, `CC BY-SA x.y`. Author, licence and Commons file URL are copied verbatim from the source.
- **Never invent facts, places, addresses, URLs, dates or superlatives.** Fewer verified items beat more padded ones.
- **`seed_links` runs last** in any seeding sequence. `Links.replace_outgoing_links!/2` deletes a source guide's outgoing edges before reinserting, so a seeder running after it clobbers `BackfillLinks`.
- **Research artifacts live in the plan's SDD workspace** at `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/`, which is git-ignored. They are never committed.
- **Raw source photos go to `images/brooklyn/`** (git-ignored); optimized output goes to `priv/photos/ny/brooklyn/{slug}/` (committed).
- Run `mix test` (full suite) before every commit. It must be green.

---

## File Structure

**Created:**

| Path | Responsibility |
|---|---|
| `priv/seed_data/brooklyn_roster.json` | The canonical 69-neighborhood roster: slug, display name, community district, wave. Single source of truth for coverage. |
| `test/support/seed_data_helpers.ex` | Shared seed-data assertions. Owns the global place-slug ownership check that walks every seed directory. |
| `lib/mix/tasks/ethos.optimize_brooklyn_photos.ex` | Optimizes `images/brooklyn/{label}.*` into `priv/photos/ny/brooklyn/{slug}/`, verifying manifest provenance first. |
| `test/ethos/seeds/brooklyn_seed_data_test.exs` | The Brooklyn gate: structure, tiers, floor, licences, photos, provenance, trip-duration ban, idempotent double load. |
| `priv/seed_data/brooklyn_photo_manifest.json` | Pins every photo label to its Commons file URL and sha256. |
| `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` | The binding authoring contract every content wave reads in full. |
| `priv/seed_data/brooklyn/{slug}.json` × 69 | The content. |
| `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg` | Optimized images. |
| `docs/runbooks/seeding.md` | Generalized seeding runbook covering all destinations. |

**Modified:**

| Path | Change |
|---|---|
| `lib/ethos/release.ex` | Add `seed_brooklyn/1`; collapse the three duplicated three-pass loops into one private `seed_directory/2`. |
| `test/ethos/seeds/connecticut_seed_data_test.exs` | Replace its hand-rolled ownership check with the shared helper. |
| `test/ethos/seeds/manhattan_seed_data_test.exs` | Same. |
| `.gitignore` | Fix the stale `priv/static/photos` comment; it is `priv/photos` since the photo-serving change. |
| `docs/runbooks/connecticut-seeding.md` | Removed, superseded by `docs/runbooks/seeding.md`. |

---

## Task 1: Roster and shared global slug-ownership check

**Files:**
- Create: `priv/seed_data/brooklyn_roster.json`
- Create: `test/support/seed_data_helpers.ex`
- Create: `test/ethos/seeds/seed_data_helpers_test.exs`
- Modify: `test/ethos/seeds/connecticut_seed_data_test.exs`
- Modify: `test/ethos/seeds/manhattan_seed_data_test.exs`

**Interfaces:**
- Produces: `Ethos.SeedDataHelpers.seed_files/1` (destination directory name → sorted list of absolute paths) and `Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0`. Later tasks call both.
- Produces: `priv/seed_data/brooklyn_roster.json` with shape `{"borough": "Brooklyn", "neighborhoods": [{"slug", "name", "community_district", "wave"}]}`. Every content wave reads its neighborhoods from it; Task 13 asserts the shipped file count matches it.

**Context:** `places` carries `unique_index(:places, [:slug])` (see `priv/repo/migrations/20260822121000_create_places.exs:25`), so slugs are unique site-wide. The existing tests check ownership against a hardcoded directory list — Connecticut's globs `connecticut/` and `manhattan/` plus the CT code module, Manhattan's globs only `manhattan/`. Neither would see a Brooklyn collision, and amending each sibling test per new destination does not scale.

- [ ] **Step 1: Write the roster file**

Create `priv/seed_data/brooklyn_roster.json`. Exactly these 69 entries, in this order:

```json
{
  "borough": "Brooklyn",
  "source": "NYC Department of City Planning Neighborhood Tabulation Areas, cross-checked against Community District profiles",
  "neighborhoods": [
    {"slug": "east-new-york", "name": "East New York", "community_district": 5, "wave": 1},
    {"slug": "cypress-hills", "name": "Cypress Hills", "community_district": 5, "wave": 1},
    {"slug": "city-line", "name": "City Line", "community_district": 5, "wave": 1},
    {"slug": "new-lots", "name": "New Lots", "community_district": 5, "wave": 1},
    {"slug": "starrett-city", "name": "Starrett City", "community_district": 5, "wave": 1},
    {"slug": "highland-park", "name": "Highland Park", "community_district": 5, "wave": 1},
    {"slug": "brownsville", "name": "Brownsville", "community_district": 16, "wave": 1},
    {"slug": "ocean-hill", "name": "Ocean Hill", "community_district": 16, "wave": 1},
    {"slug": "canarsie", "name": "Canarsie", "community_district": 18, "wave": 1},
    {"slug": "flatlands", "name": "Flatlands", "community_district": 18, "wave": 1},
    {"slug": "marine-park", "name": "Marine Park", "community_district": 18, "wave": 1},
    {"slug": "mill-basin", "name": "Mill Basin", "community_district": 18, "wave": 1},
    {"slug": "bergen-beach", "name": "Bergen Beach", "community_district": 18, "wave": 1},
    {"slug": "georgetown", "name": "Georgetown", "community_district": 18, "wave": 1},

    {"slug": "greenpoint", "name": "Greenpoint", "community_district": 1, "wave": 2},
    {"slug": "williamsburg", "name": "Williamsburg", "community_district": 1, "wave": 2},
    {"slug": "south-williamsburg", "name": "South Williamsburg", "community_district": 1, "wave": 2},
    {"slug": "east-williamsburg", "name": "East Williamsburg", "community_district": 1, "wave": 2},
    {"slug": "bushwick", "name": "Bushwick", "community_district": 4, "wave": 2},

    {"slug": "brooklyn-heights", "name": "Brooklyn Heights", "community_district": 2, "wave": 3},
    {"slug": "dumbo", "name": "Dumbo", "community_district": 2, "wave": 3},
    {"slug": "vinegar-hill", "name": "Vinegar Hill", "community_district": 2, "wave": 3},
    {"slug": "downtown-brooklyn", "name": "Downtown Brooklyn", "community_district": 2, "wave": 3},
    {"slug": "navy-yard", "name": "Navy Yard", "community_district": 2, "wave": 3},
    {"slug": "fort-greene", "name": "Fort Greene", "community_district": 2, "wave": 3},
    {"slug": "clinton-hill", "name": "Clinton Hill", "community_district": 2, "wave": 3},
    {"slug": "boerum-hill", "name": "Boerum Hill", "community_district": 2, "wave": 3},
    {"slug": "cobble-hill", "name": "Cobble Hill", "community_district": 2, "wave": 3},

    {"slug": "carroll-gardens", "name": "Carroll Gardens", "community_district": 6, "wave": 4},
    {"slug": "columbia-street-waterfront-district", "name": "Columbia Street Waterfront District", "community_district": 6, "wave": 4},
    {"slug": "red-hook", "name": "Red Hook", "community_district": 6, "wave": 4},
    {"slug": "gowanus", "name": "Gowanus", "community_district": 6, "wave": 4},
    {"slug": "park-slope", "name": "Park Slope", "community_district": 6, "wave": 4},
    {"slug": "windsor-terrace", "name": "Windsor Terrace", "community_district": 7, "wave": 4},
    {"slug": "greenwood", "name": "Greenwood", "community_district": 7, "wave": 4},

    {"slug": "bedford-stuyvesant", "name": "Bedford-Stuyvesant", "community_district": 3, "wave": 5},
    {"slug": "stuyvesant-heights", "name": "Stuyvesant Heights", "community_district": 3, "wave": 5},
    {"slug": "crown-heights", "name": "Crown Heights", "community_district": 8, "wave": 5},
    {"slug": "prospect-heights", "name": "Prospect Heights", "community_district": 8, "wave": 5},
    {"slug": "weeksville", "name": "Weeksville", "community_district": 8, "wave": 5},
    {"slug": "prospect-lefferts-gardens", "name": "Prospect Lefferts Gardens", "community_district": 9, "wave": 5},
    {"slug": "wingate", "name": "Wingate", "community_district": 9, "wave": 5},

    {"slug": "flatbush", "name": "Flatbush", "community_district": 14, "wave": 6},
    {"slug": "ditmas-park", "name": "Ditmas Park", "community_district": 14, "wave": 6},
    {"slug": "prospect-park-south", "name": "Prospect Park South", "community_district": 14, "wave": 6},
    {"slug": "midwood", "name": "Midwood", "community_district": 14, "wave": 6},
    {"slug": "kensington", "name": "Kensington", "community_district": 12, "wave": 6},
    {"slug": "east-flatbush", "name": "East Flatbush", "community_district": 17, "wave": 6},
    {"slug": "remsen-village", "name": "Remsen Village", "community_district": 17, "wave": 6},
    {"slug": "rugby", "name": "Rugby", "community_district": 17, "wave": 6},
    {"slug": "farragut", "name": "Farragut", "community_district": 17, "wave": 6},

    {"slug": "sunset-park", "name": "Sunset Park", "community_district": 7, "wave": 7},
    {"slug": "borough-park", "name": "Borough Park", "community_district": 12, "wave": 7},
    {"slug": "bay-ridge", "name": "Bay Ridge", "community_district": 10, "wave": 7},
    {"slug": "fort-hamilton", "name": "Fort Hamilton", "community_district": 10, "wave": 7},
    {"slug": "dyker-heights", "name": "Dyker Heights", "community_district": 10, "wave": 7},
    {"slug": "bath-beach", "name": "Bath Beach", "community_district": 11, "wave": 7},
    {"slug": "bensonhurst", "name": "Bensonhurst", "community_district": 11, "wave": 7},
    {"slug": "mapleton", "name": "Mapleton", "community_district": 11, "wave": 7},

    {"slug": "gravesend", "name": "Gravesend", "community_district": 11, "wave": 8},
    {"slug": "coney-island", "name": "Coney Island", "community_district": 13, "wave": 8},
    {"slug": "brighton-beach", "name": "Brighton Beach", "community_district": 13, "wave": 8},
    {"slug": "sea-gate", "name": "Sea Gate", "community_district": 13, "wave": 8},
    {"slug": "sheepshead-bay", "name": "Sheepshead Bay", "community_district": 15, "wave": 8},
    {"slug": "manhattan-beach", "name": "Manhattan Beach", "community_district": 15, "wave": 8},
    {"slug": "gerritsen-beach", "name": "Gerritsen Beach", "community_district": 15, "wave": 8},
    {"slug": "homecrest", "name": "Homecrest", "community_district": 15, "wave": 8},
    {"slug": "madison", "name": "Madison", "community_district": 15, "wave": 8},
    {"slug": "plumb-beach", "name": "Plumb Beach", "community_district": 15, "wave": 8}
  ]
}
```

- [ ] **Step 2: Write the failing test**

Create `test/ethos/seeds/seed_data_helpers_test.exs`:

```elixir
defmodule Ethos.SeedDataHelpersTest do
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers

  @roster_path Path.expand("../../../priv/seed_data/brooklyn_roster.json", __DIR__)

  test "the brooklyn roster is 69 uniquely-slugged neighborhoods in eight waves" do
    roster = @roster_path |> File.read!() |> Jason.decode!()
    hoods = roster["neighborhoods"]

    assert length(hoods) == 69
    assert length(Enum.uniq_by(hoods, & &1["slug"])) == 69
    assert length(Enum.uniq_by(hoods, & &1["name"])) == 69
    assert Enum.map(hoods, & &1["wave"]) |> Enum.uniq() |> Enum.sort() == Enum.to_list(1..8)

    for h <- hoods do
      assert Regex.match?(~r/^[a-z0-9]+(-[a-z0-9]+)*$/, h["slug"]),
             "bad slug #{inspect(h["slug"])}"

      assert h["community_district"] in 1..18
    end
  end

  test "seed_files/1 finds committed seed files for a destination" do
    assert SeedDataHelpers.seed_files("manhattan") != []
    assert Enum.all?(SeedDataHelpers.seed_files("manhattan"), &String.ends_with?(&1, ".json"))
    assert SeedDataHelpers.seed_files("no-such-destination") == []
  end

  test "the committed corpus has no place-slug collisions" do
    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end
end
```

- [ ] **Step 3: Run it to make sure it fails**

Run: `mix test test/ethos/seeds/seed_data_helpers_test.exs`
Expected: FAIL — `Ethos.SeedDataHelpers` is undefined and the roster file does not exist yet (if Step 1 is done first, only the module error remains).

- [ ] **Step 4: Write the helper**

Create `test/support/seed_data_helpers.ex`:

```elixir
defmodule Ethos.SeedDataHelpers do
  @moduledoc """
  Assertions shared by every destination's seed-data test.

  `places` carries a global `unique_index(:places, [:slug])`, so a slug used by
  two destinations fails at seed time in production — partway through a run
  that is not transactional, leaving earlier files published and later ones
  unseeded. Each destination test used to hardcode the sibling directories it
  compared against, so adding a destination silently narrowed the check. This
  walks every seed directory instead, and stays correct as destinations are
  added.
  """
  import ExUnit.Assertions

  alias Ethos.Seeds.DataGuide

  @seed_data_root Path.expand("../../priv/seed_data", __DIR__)

  @doc "Sorted absolute paths of a destination's committed seed files."
  def seed_files(destination) do
    @seed_data_root
    |> Path.join("#{destination}/*.json")
    |> Path.wildcard()
    |> Enum.sort()
  end

  @doc "Every seed file in every destination directory."
  def all_seed_files do
    @seed_data_root
    |> Path.join("*/*.json")
    |> Path.wildcard()
    |> Enum.sort()
  end

  @doc """
  Asserts each place slug is defined exactly once across the whole corpus:
  every `priv/seed_data/*/*.json` file plus the Connecticut code module.
  """
  def assert_place_slugs_globally_unique! do
    json_owned =
      for f <- all_seed_files(),
          p <- DataGuide.load!(f)["places"],
          # Directory-qualified: two destinations may hold the same basename,
          # which would otherwise hide a genuine cross-destination collision.
          do: {p["slug"], Path.join(Path.basename(Path.dirname(f)), Path.basename(f))}

    code_owned =
      for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

    dups =
      (json_owned ++ code_owned)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      # length/1, not uniq — two places sharing a slug inside ONE file collide too.
      |> Enum.filter(fn {_slug, owners} -> length(owners) > 1 end)

    assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"
  end
end
```

Note: `Path.wildcard("priv/seed_data/*/*.json")` matches only files one level deep inside a destination directory, so the top-level `connecticut_photo_manifest.json` and `brooklyn_roster.json` are correctly excluded.

- [ ] **Step 5: Run it to verify it passes**

Run: `mix test test/ethos/seeds/seed_data_helpers_test.exs`
Expected: PASS, 3 tests.

- [ ] **Step 6: Prove the collision check actually fires**

Temporarily add a duplicate place to a Manhattan seed file — copy the `"slug"` value of any place in `priv/seed_data/manhattan/soho.json` onto a place in `priv/seed_data/manhattan/noho.json` — and run the test again.

Run: `mix test test/ethos/seeds/seed_data_helpers_test.exs`
Expected: FAIL with `place slugs with multiple owners: [{"...", ["manhattan/noho.json", "manhattan/soho.json"]}]`

**Revert the edit** before continuing. Do not commit it.

- [ ] **Step 7: Rewire the two existing tests onto the helper**

In `test/ethos/seeds/connecticut_seed_data_test.exs`, delete the `json_owned` / `code_owned` / `dups` block (currently lines 99-116) and the now-unused `@manhattan_glob`-based ownership globbing, replacing it with:

```elixir
    Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!()
```

Keep `@manhattan_glob` — it is still used further down to seed the link-target universe.

In `test/ethos/seeds/manhattan_seed_data_test.exs`, delete the `owned` / `dups` block (currently lines 24-32) and replace it with the same single call.

- [ ] **Step 8: Run the full suite**

Run: `mix test`
Expected: PASS, no failures. The ownership coverage is now strictly wider than before, so any failure here is a real pre-existing collision — investigate rather than weaken the check.

- [ ] **Step 9: Commit**

```bash
git add priv/seed_data/brooklyn_roster.json test/support/seed_data_helpers.ex test/ethos/seeds/seed_data_helpers_test.exs test/ethos/seeds/connecticut_seed_data_test.exs test/ethos/seeds/manhattan_seed_data_test.exs
git commit -m "feat: Brooklyn roster and corpus-wide place-slug ownership check"
```

---

## Task 2: Seed function and photo optimizer

**Files:**
- Modify: `lib/ethos/release.ex`
- Create: `lib/mix/tasks/ethos.optimize_brooklyn_photos.ex`
- Create: `priv/seed_data/brooklyn/.gitkeep`
- Create: `priv/seed_data/brooklyn_photo_manifest.json`
- Modify: `.gitignore`
- Test: `test/ethos/release_test.exs`

**Interfaces:**
- Consumes: `Ethos.Seeds.DataGuide.upsert_places!/1`, `upsert_guide!/2`, `upsert_links!/1` (existing).
- Produces: `Ethos.Release.seed_brooklyn/1`, called by the runbook and by Task 13's rollout.
- Produces: `mix ethos.optimize_brooklyn_photos`, called by every content wave.

**Context:** `lib/ethos/release.ex` currently holds three byte-identical three-pass loops (`seed_manhattan/1` at lines 47-65, `seed_connecticut_expansion/1` at lines 81-99, and the shape Brooklyn needs). Adding a fourth copy is the wrong move; collapse them.

- [ ] **Step 1: Write the failing test**

Create `test/ethos/release_test.exs`:

```elixir
defmodule Ethos.ReleaseTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures

  test "seed_brooklyn/1 tolerates an empty seed directory" do
    user = user_fixture()
    before = length(Ethos.Guides.list_published_guides())

    # priv/seed_data/brooklyn/ holds no JSON until wave 1 lands. Seeding it must
    # be a no-op rather than a crash, so the runbook order is valid from day one.
    Ethos.Release.seed_brooklyn(user.email)

    assert length(Ethos.Guides.list_published_guides()) == before
  end
end
```

- [ ] **Step 2: Run it to verify it fails**

Run: `mix test test/ethos/release_test.exs`
Expected: FAIL with `UndefinedFunctionError` for `Ethos.Release.seed_brooklyn/1`.

- [ ] **Step 3: Collapse the duplicated loops and add `seed_brooklyn/1`**

In `lib/ethos/release.ex`, replace `seed_manhattan/1` and `seed_connecticut_expansion/1` with delegating one-liners and add the shared private helper plus `seed_brooklyn/1`:

```elixir
  def seed_manhattan(email), do: seed_directory("manhattan", email)

  def seed_connecticut_expansion(email), do: seed_directory("connecticut", email)

  def seed_brooklyn(email), do: seed_directory("brooklyn", email)

  # Three passes over the whole directory — all places, then all guides, then
  # all links — so an entry may reference a place, and a link may reference a
  # guide, defined in any file of the run regardless of processing order.
  defp seed_directory(dir, email) do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", dir, "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    Enum.each(files, &Ethos.Seeds.DataGuide.upsert_places!/1)

    for file <- files do
      guide = Ethos.Seeds.DataGuide.upsert_guide!(file, email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end

    Enum.each(files, &Ethos.Seeds.DataGuide.upsert_links!/1)
    IO.puts("Seeded #{length(files)} files from priv/seed_data/#{dir}")
  end
```

- [ ] **Step 4: Create the empty seed directory and manifest**

```bash
mkdir -p priv/seed_data/brooklyn
touch priv/seed_data/brooklyn/.gitkeep
printf '{}\n' > priv/seed_data/brooklyn_photo_manifest.json
```

- [ ] **Step 5: Run the test to verify it passes**

Run: `mix test test/ethos/release_test.exs`
Expected: PASS.

- [ ] **Step 6: Write the photo optimizer**

Create `lib/mix/tasks/ethos.optimize_brooklyn_photos.ex`. This mirrors `lib/mix/tasks/ethos.optimize_connecticut_photos.ex`, changed in three places: the seed glob, the expected `src` path shape (`/photos/ny/brooklyn/{neighborhood}/{label}.jpg`, one segment deeper than Connecticut's), and the source/manifest paths.

```elixir
defmodule Mix.Tasks.Ethos.OptimizeBrooklynPhotos do
  @shortdoc "Optimizes Brooklyn photos from images/brooklyn/ into priv/photos/ny/brooklyn/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/brooklyn/*.json for photo srcs and optimizes images/brooklyn/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)
  @manifest_path "priv/seed_data/brooklyn_photo_manifest.json"

  @impl true
  def run(_args) do
    files = Path.wildcard("priv/seed_data/brooklyn/*.json")

    if files == [] do
      Mix.raise(
        "no seed files matched priv/seed_data/brooklyn/*.json — run this from the project root"
      )
    end

    srcs =
      files
      |> Enum.flat_map(&photo_srcs/1)
      |> Enum.uniq()

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
      ["", "photos", "ny", "brooklyn", neighborhood, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "photos", "ny", "brooklyn", neighborhood])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise(
          "unexpected photo src path #{src} (want /photos/ny/brooklyn/{neighborhood}/{label}.jpg)"
        )
    end
  end

  defp find_source!(label) do
    path =
      Enum.find_value(@source_exts, fn ext ->
        path = Path.join(["images", "brooklyn", "#{label}.#{ext}"])
        if File.exists?(path), do: path
      end) || Mix.raise("no source image for #{label} under images/brooklyn/")

    verify_provenance!(label, path)
    path
  end

  # Source images resolve by bare label, so the wrong file under that name would
  # publish a real photo carrying another image's author and licence credit. The
  # manifest pins each label to the Commons file it was downloaded from.
  defp verify_provenance!(label, path) do
    case manifest()[label] do
      nil ->
        Mix.raise("#{label} is not in #{@manifest_path} — regenerate the manifest")

      %{"sha256" => expected} ->
        actual = :crypto.hash(:sha256, File.read!(path)) |> Base.encode16(case: :lower)

        if actual != expected do
          Mix.raise(
            "#{path} does not match the image recorded for #{label} " <>
              "(expected #{String.slice(expected, 0, 12)}…, got #{String.slice(actual, 0, 12)}…). " <>
              "The published author and licence would credit the wrong photo."
          )
        end
    end
  end

  defp manifest do
    case :persistent_term.get({__MODULE__, :manifest}, nil) do
      nil ->
        data = @manifest_path |> File.read!() |> Jason.decode!()
        :persistent_term.put({__MODULE__, :manifest}, data)
        data

      data ->
        data
    end
  end
end
```

- [ ] **Step 7: Verify the task compiles and refuses an empty corpus**

Run: `mix ethos.optimize_brooklyn_photos`
Expected: exits with `no seed files matched priv/seed_data/brooklyn/*.json` — correct, no content has shipped yet.

- [ ] **Step 8: Fix the stale gitignore comment**

`.gitignore` line 46 reads "optimized output goes to priv/static/photos". Photos moved to `priv/photos` with their own `Plug.Static` (see `lib/ethos_web/endpoint.ex`). Change the comment to say `priv/photos`. Leave the `/images/` rule itself unchanged.

- [ ] **Step 9: Run the full suite and commit**

Run: `mix test`
Expected: PASS.

```bash
git add lib/ethos/release.ex lib/mix/tasks/ethos.optimize_brooklyn_photos.ex priv/seed_data/brooklyn/.gitkeep priv/seed_data/brooklyn_photo_manifest.json test/ethos/release_test.exs .gitignore
git commit -m "feat: Brooklyn seed function and photo optimizer"
```

---

## Task 3: The Brooklyn validation gate

**Files:**
- Create: `test/ethos/seeds/brooklyn_seed_data_test.exs`
- Create: `test/support/fixtures/seed_data/brooklyn_fixtures/` (four fixture files, listed below)

**Interfaces:**
- Consumes: `Ethos.SeedDataHelpers.seed_files/1`, `assert_place_slugs_globally_unique!/0` from Task 1.
- Produces: the gate every content wave must keep green. Wave authors run `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`.

**Context:** This ports `test/ethos/seeds/connecticut_seed_data_test.exs`. Two deliberate differences: the drive-time ban becomes a **trip-duration** ban covering transit phrasing, and the roster-count assertion is **not** added here — it lands in Task 13, because asserting 69 files while zero have shipped would leave the suite red for the entire program.

The trip-duration patterns must catch transit phrasing the Connecticut drive-time patterns miss: "a 20-minute ride on the Q", "half an hour to Midtown", "twenty minutes from Atlantic Terminal". They must **not** catch legitimate non-travel durations, which do occur — a ride's length at Luna Park, a tour's length at the Navy Yard, the Cyclone's run time.

- [ ] **Step 1: Write the fixtures**

Create these four files under `test/support/fixtures/seed_data/brooklyn_fixtures/`. Each is a minimal valid seed file that violates exactly one rule, so each assertion can be proven to fire.

`trip_duration.json` — a guide whose FAQ answer contains a banned duration claim:

```json
{
  "guide": {
    "slug": "fixture-trip-duration-brooklyn-guide",
    "title": "Fixture: Trip Duration",
    "destination": "Fixture, New York",
    "state": "New York",
    "county": "Brooklyn",
    "intro": "A fixture guide used only to prove the trip-duration assertion fires.",
    "sections": [],
    "faq": [
      {
        "question": "How far is Manhattan?",
        "answer": "The Q train reaches Midtown in about 25 minutes from here."
      }
    ],
    "photos": []
  },
  "places": [],
  "entries": []
}
```

`bad_tier.json` — `tier: "town-page"` carrying six places, which is mislabelled rich content:

```json
{
  "guide": {
    "slug": "fixture-bad-tier-brooklyn-guide",
    "title": "Fixture: Bad Tier",
    "destination": "Fixture, New York",
    "state": "New York",
    "county": "Brooklyn",
    "tier": "town-page",
    "intro": "A fixture guide used only to prove the tier invariant fires.",
    "sections": [],
    "faq": [],
    "photos": []
  },
  "places": [
    {"slug": "fixture-bad-tier-one", "name": "One", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []},
    {"slug": "fixture-bad-tier-two", "name": "Two", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []},
    {"slug": "fixture-bad-tier-three", "name": "Three", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []},
    {"slug": "fixture-bad-tier-four", "name": "Four", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []},
    {"slug": "fixture-bad-tier-five", "name": "Five", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []},
    {"slug": "fixture-bad-tier-six", "name": "Six", "kind": "park", "town": "Fixture", "state": "New York", "county": "Brooklyn", "summary": "A fixture place.", "status": "open", "photos": []}
  ],
  "entries": []
}
```

`below_floor.json` — an orientation page violating both floor rules, with an intro far under 90 words and only one outbound link:

```json
{
  "guide": {
    "slug": "fixture-below-floor-brooklyn-guide",
    "title": "Fixture: Below Floor",
    "destination": "Fixture, New York",
    "state": "New York",
    "county": "Brooklyn",
    "tier": "town-page",
    "intro": "This intro is deliberately far too short to clear the ninety word floor an orientation page must reach.",
    "sections": [],
    "faq": [],
    "photos": []
  },
  "places": [],
  "entries": [],
  "links": [
    {"target": "guide:midtown-manhattan-guide", "kind": "see-also", "note": null}
  ]
}
```

`bad_license.json` — a guide photo under a licence that is not free:

```json
{
  "guide": {
    "slug": "fixture-bad-license-brooklyn-guide",
    "title": "Fixture: Bad Licence",
    "destination": "Fixture, New York",
    "state": "New York",
    "county": "Brooklyn",
    "intro": "A fixture guide used only to prove the licence allowlist fires.",
    "sections": [],
    "faq": [],
    "photos": [
      {
        "src": "/photos/ny/brooklyn/fixture/nope.jpg",
        "thumb": "/photos/ny/brooklyn/fixture/nope_thumb.jpg",
        "title": "Nope",
        "description": "A fixture photo.",
        "author": "Nobody",
        "license": "All rights reserved",
        "source_url": "https://example.com/nope"
      }
    ]
  },
  "places": [],
  "entries": []
}
```

These fixtures live outside `priv/seed_data/brooklyn/`, so they are never loaded by `seed_brooklyn/1` and never counted by the corpus test. Only the four fixture-specific tests read them, each passing an explicit path.

- [ ] **Step 2: Write the failing test**

Create `test/ethos/seeds/brooklyn_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.BrooklynSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.DataGuide

  # Photo srcs are "/photos/...", served from priv/photos by its own Plug.Static
  # rather than from priv/static — see EthosWeb.Endpoint for why.
  @static_root Path.expand("../../../priv", __DIR__)
  @manifest_path Path.expand("../../../priv/seed_data/brooklyn_photo_manifest.json", __DIR__)
  @fixture_dir Path.expand("../../support/fixtures/seed_data/brooklyn_fixtures", __DIR__)

  defp files, do: SeedDataHelpers.seed_files("brooklyn")
  defp fixture(name), do: Path.join(@fixture_dir, name)

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  # --- Trip-duration ban -------------------------------------------------
  #
  # docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md bans transit
  # trip durations categorically. Station names and line designations are
  # published and stable; "twenty minutes to Midtown" is not — it varies by
  # time of day, changes with every service revision, and no research artifact
  # supports it. This is the same failure class as Connecticut's drive times,
  # where a prose rule restated in every wave dispatch and checked in every
  # review still leaked 58 claims across 28 committed files onto the live site
  # before a mechanical gate caught them. A duration claim can hide in any of
  # six places a reviewer reads separately — the intro, a section body, an FAQ
  # answer, a place summary, a photo description, or a link note — so this
  # walks every string value in every seed file rather than the transit
  # section alone.
  @trip_duration_patterns [
    ~r/\b\d+\s*[-–]?\s*minute\b/i,
    ~r/\b\d+\s*min(?:ute)?s?\b\s*(?:south|north|east|west|away|drive|ride|from|by car|by subway|by train|by ferry|uptown|downtown|up|down|along)/i,
    ~r/\b(?:roughly|about|around|approximately|just|only|under|over|some)\s+\d+\s*min/i,
    ~r/\b(?:half[-\s]?(?:an\s+)?hour|quarter[-\s]?hour|an hour(?:\s+and\s+a\s+half)?)\b[^.]{0,40}\b(?:drive|ride|away|south|north|east|west|by car|by subway|by train|by ferry|to manhattan|to midtown)/i,
    ~r/\b(?:drive|ride|trip|commute)\s+of\s+(?:about|roughly|around)?\s*\d+\s*min/i,
    ~r/\b\d+\s*hours?\s+(?:drive|ride|away|south|north|east|west|by car|by subway|by train)/i,
    ~r/\b(?:five|ten|fifteen|twenty|twenty[-\s]five|thirty|forty|forty[-\s]five|fifty|sixty|ninety)\s*[-–]?\s*minutes?\b/i,
    ~r/\b(?:short|quick|easy|brief)\s+(?:drive|ride|hop|trip|commute)\b/i,
    ~r/\bwithin\s+(?:a\s+)?(?:short|quick|easy)\s+(?:drive|ride|trip)\b/i,
    ~r/\b(?:reaches|gets you to|puts you in|takes you to)\b[^.]{0,40}\bin\s+(?:about\s+)?\d+/i
  ]

  # Confirmed false positives, keyed on {file, json path, matched phrase} and
  # applied AFTER the regex runs, so only that exact phrase is pardoned in that
  # one string — a genuine duration claim appended to the same field still
  # fails. Keying on {file, path} alone would excuse the entire string.
  #
  # Entries here are for durations that are NOT travel claims: a ride's run
  # time, a tour's length, a ferry crossing stated as a scheduled service fact
  # from a cited source. Every entry needs a manual read and a reason. Start
  # empty; waves add entries with justification in their reports.
  @trip_duration_allowlist []

  defp collect_strings(term, path \\ "")

  defp collect_strings(map, path) when is_map(map) do
    Enum.flat_map(map, fn {k, v} ->
      sep = if path == "", do: "", else: "."
      collect_strings(v, "#{path}#{sep}#{k}")
    end)
  end

  defp collect_strings(list, path) when is_list(list) do
    list
    |> Enum.with_index()
    |> Enum.flat_map(fn {v, i} -> collect_strings(v, "#{path}[#{i}]") end)
  end

  defp collect_strings(s, path) when is_binary(s), do: [{path, s}]
  defp collect_strings(_other, _path), do: []

  defp trip_duration_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        {path, text} <- collect_strings(data),
        pattern <- @trip_duration_patterns,
        match = Regex.run(pattern, text),
        not is_nil(match),
        matched = hd(match),
        {Path.basename(f), path, matched} not in @trip_duration_allowlist,
        uniq: true,
        do: {Path.basename(f), path, matched}
  end

  defp tier_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        tier = data["guide"]["tier"] || "guide",
        n = length(data["places"]),
        violation =
          (cond do
             tier == "guide" and n < 4 -> "full guide with only #{n} places"
             tier == "town-page" and n >= 6 -> "town-page with #{n} places — should be a guide"
             true -> nil
           end),
        not is_nil(violation),
        do: {Path.basename(f), violation}
  end

  defp floor_violations(paths) do
    for f <- paths,
        data = DataGuide.load!(f),
        (data["guide"]["tier"] || "guide") == "town-page",
        words = data["guide"]["intro"] |> String.split(~r/\s+/, trim: true) |> length(),
        links = length(data["links"] || []),
        violation =
          (cond do
             words < 90 -> "intro is #{words} words, floor is 90"
             links < 3 -> "only #{links} outbound links, floor is 3"
             true -> nil
           end),
        not is_nil(violation),
        do: {Path.basename(f), violation}
  end

  defp license_violations(paths) do
    for f <- paths,
        p <- all_photos(DataGuide.load!(f)),
        not allowed_license?(p["license"]),
        do: {Path.basename(f), p["license"]}
  end

  # --- The assertions fire (proven against fixtures) ----------------------

  test "the trip-duration ban catches a duration claim" do
    assert [{"trip_duration.json", _path, _matched}] =
             trip_duration_violations([fixture("trip_duration.json")])
  end

  test "the tier invariant catches a town-page carrying six places" do
    assert [{"bad_tier.json", _}] = tier_violations([fixture("bad_tier.json")])
  end

  test "the orientation floor catches a short intro" do
    assert [{"below_floor.json", _}] = floor_violations([fixture("below_floor.json")])
  end

  test "the licence allowlist catches a non-free licence" do
    assert [{"bad_license.json", "All rights reserved"}] =
             license_violations([fixture("bad_license.json")])
  end

  # --- The committed corpus obeys all of them ----------------------------

  test "every committed brooklyn seed file is valid, globally unique, and loads twice" do
    files = files()

    SeedDataHelpers.assert_place_slugs_globally_unique!()

    assert license_violations(files) == []
    assert tier_violations(files) == [], "tier does not match place count"
    assert floor_violations(files) == [], "orientation pages below the floor"

    assert trip_duration_violations(files) == [],
           "trip-duration phrasing found (banned — name the line, station or ferry landing " <>
             "instead of how long the trip takes)"

    # Photo labels are the optimizer's lookup key: mix ethos.optimize_brooklyn_photos
    # resolves every /photos/ny/brooklyn/{hood}/{label}.jpg from images/brooklyn/{label}.*,
    # so one label may never stand for two different source images.
    label_dups =
      (for f <- files, p <- all_photos(DataGuide.load!(f)),
           do: {Path.rootname(Path.basename(p["src"])), p["source_url"]})
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.filter(fn {_label, sources} -> length(Enum.uniq(sources)) > 1 end)

    assert label_dups == [],
           "photo labels standing for more than one image: #{inspect(label_dups)}"

    # Every referenced photo must be on disk, full size and thumb, or the page
    # renders a broken image. mix ethos.optimize_brooklyn_photos writes these.
    missing =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          path <- [p["src"], p["thumb"]],
          path not in [nil, ""],
          not File.exists?(Path.join(@static_root, path)),
          do: {Path.basename(f), path}

    assert missing == [], "seed photos with no optimized file on disk: #{inspect(missing)}"

    # The manifest pins each label to the Commons file it came from, so the
    # author and licence a page prints always belong to the image beside them.
    manifest = @manifest_path |> File.read!() |> Jason.decode!()

    unpinned =
      for f <- files,
          p <- all_photos(DataGuide.load!(f)),
          label = Path.rootname(Path.basename(p["src"])),
          manifest[label]["source_url"] != p["source_url"],
          do: {Path.basename(f), label, manifest[label]["source_url"], p["source_url"]}

    assert unpinned == [],
           "photos whose manifest provenance disagrees with the published credit: #{inspect(unpinned)}"

    # Seed the link-target universe. Brooklyn files carry cross-borough
    # see-also edges to Manhattan guides, and Links.resolve!/1 raises on an
    # unknown target, aborting the whole link pass.
    user = user_fixture()

    manhattan = SeedDataHelpers.seed_files("manhattan")
    Enum.each(manhattan, &DataGuide.upsert_places!/1)
    Enum.each(manhattan, &DataGuide.upsert_guide!(&1, user.email))
    Enum.each(manhattan, &DataGuide.upsert_links!/1)

    # three-pass load, twice (idempotency)
    for _pass <- 1..2 do
      Enum.each(files, &DataGuide.upsert_places!/1)
      Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      Enum.each(files, &DataGuide.upsert_links!/1)
    end

    brooklyn_guides =
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Brooklyn"))

    assert length(brooklyn_guides) == length(files)
  end
end
```

- [ ] **Step 3: Run it to verify the fixture assertions fail first**

Write the test file before the fixtures exist, run it, and confirm the four fixture tests fail with a file-read error. Then add the fixtures from Step 1 and re-run.

Run: `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`
Expected after fixtures are in place: PASS, 5 tests. The corpus test passes vacuously over zero files — that is correct until Task 13 adds the roster-count assertion.

- [ ] **Step 4: Prove the corpus test is not permanently vacuous**

Copy `trip_duration.json` into `priv/seed_data/brooklyn/` and re-run.

Run: `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`
Expected: FAIL on `trip-duration phrasing found`.

**Delete the copied file** before continuing.

- [ ] **Step 5: Run the full suite and commit**

Run: `mix test`
Expected: PASS.

```bash
git add test/ethos/seeds/brooklyn_seed_data_test.exs test/support/fixtures/seed_data/brooklyn_fixtures
git commit -m "test: Brooklyn seed-data gate with trip-duration ban"
```

---

## Task 4: Brooklyn content authoring rules

**Files:**
- Create: `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`

**Interfaces:**
- Produces: the binding authoring contract. Every content wave dispatch (Tasks 5-12) names this path and requires the author to read it in full before writing any JSON.

**Context:** Model this on `docs/superpowers/plans/2026-08-22-manhattan-content-rules.md` (the closest precedent — read it first) and `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md` (which carries the tier and floor rules).

- [ ] **Step 1: Write the rules document**

It must cover, in this order:

1. **Inputs** — the two research artifacts each author receives, at
   `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
   and `.../photos-wave{K}.json`, with their key shapes.

2. **Verdict filtering (non-negotiable)** — `refuted` items are excluded, or the verifier's correction is used. `uncertain` items are excluded from places and lodging; an uncertain history fact may be kept **only** by rewording to remove the unverified specific. Unchecked items survive only if the researcher cited an official site or 2025-2026 coverage. Never add anything absent from the artifacts.

3. **Tier decision** — count the places surviving verdict filtering. 6 or more → `"tier": "guide"`. Fewer → `"tier": "town-page"`. Decided from what survived, never from the neighborhood's reputation. The author records the surviving count and resulting tier in its report so the reviewer can check the call.

4. **Seed JSON shape** — the exact structure, copied from the Manhattan rules and extended with `"tier"` and the top-level `"links"` array:

```json
{
  "guide": {
    "slug": "{slug}-brooklyn-guide",
    "title": "{Neighborhood}, Brooklyn: {concrete hook, 4-8 words}",
    "destination": "{Neighborhood}, New York",
    "state": "New York",
    "county": "Brooklyn",
    "tier": "guide",
    "intro": "markdown, 100-160 words",
    "sections": [{"heading": "...", "body": "markdown"}],
    "faq": [{"question": "...", "answer": "..."}],
    "photos": [{"src": "...", "thumb": "...", "title": "...", "description": "...",
                "author": "...", "license": "...", "source_url": "https://commons.wikimedia.org/wiki/File:..."}]
  },
  "places": [
    {"slug": "...", "name": "...", "kind": "...", "town": "{Neighborhood}",
     "state": "New York", "county": "Brooklyn", "address": "...",
     "official_url": "... or omit the key", "summary": "1-3 sentences",
     "history": "optional markdown", "status": "open", "photos": []}
  ],
  "entries": [
    {"kind": "sight|food|stay|walk", "name": "...", "place_slug": "...", "note": "1-2 sentences"}
  ],
  "links": [
    {"target": "guide:{other-slug}-brooklyn-guide", "kind": "nearby", "note": null}
  ]
}
```

5. **Full guide requirements** — intro 100-160 words, history-forward, third person, never a fabricated first-person experience. Two to three sections: one history deep-dive; one **"Getting there"** (rules below); optionally a third where research supports it. FAQ 4-6 entries, one of which is "How do I get to {Neighborhood}?". Six to twelve places, six to twelve entries, every entry referencing a `place_slug` defined in the same file unless the dispatch names a cross-file slug.

6. **The "Getting there" section** — the borough-specific rule, stated at length:
   - Heading is exactly `Getting there`, not `Getting there by subway`.
   - Name the subway lines and station names that serve the neighborhood.
   - Name the NYC Ferry landing and route where one exists.
   - Name the LIRR station where one exists (Atlantic Terminal, Nostrand Avenue, East New York).
   - Name a bus route only where it is the realistic answer, not for completeness.
   - **Never state a trip duration.** Not in minutes, not in hours, not as "a short ride". The gate rejects them; more importantly they are unverifiable and they decay. Say which line, which station, which landing.
   - State a service caveat only where the MTA has published one and the research artifact records it.
   - Red Hook has no subway. Write that plainly rather than straining to name a distant station as if it served the neighborhood.

7. **Lodging** — list hotels only when verified hotels are physically in the neighborhood. Otherwise write a short "Where to stay" note naming the nearest verified option and adding a `links` edge to that neighborhood's guide. Never import a neighboring neighborhood's hotel as a place record; the place's `town` would be false.

8. **Orientation page requirements** — history intro 90-130 words; "Getting there"; "What's here" listing every verified place, omitted entirely if there are none; a Nearby block; FAQ 2-3 entries; at most one photo. **Floor:** a 90+ word unique intro **and** 3+ outbound links, or the page is omitted and the omission recorded in the wave report. Never ship a stub.

9. **Place slugs** — kebab-case of the name; append `-{neighborhood-slug}` when the name is generic or could recur elsewhere. Slugs are unique across the **entire site**, not just Brooklyn — `Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0` checks Brooklyn against Manhattan, Connecticut and the CT code module. Brooklyn's known collision risks: Sunset Park, Marine Park, Washington Park, Highland Park and Manhattan Beach all name both a place and a neighborhood.

10. **Place kinds** — the closed set `museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park attraction`. Beaches and the Riegelmann Boardwalk are `park` or `attraction`; Luna Park is `amusement-park`; bakeries and delis are `cafe` or `restaurant`. A new kind fails changeset validation at seed time.

11. **Links** — `nearby` means the two neighborhoods share a border. `shared-history` needs a stated historical relationship. `same-region` for near-but-not-bordering. `see-also` for cross-borough edges, authored **only** where a real named connection exists and **only** to a Manhattan guide slug that already exists; `Links.resolve!/1` raises on an unknown target and aborts the entire link pass. Every note traces to research.

12. **Photos** — Commons only, licences `Public domain` / `CC0` / `CC BY x.y` / `CC BY-SA x.y`. Two to four per full guide, at most one per orientation page, zero when nothing acceptable exists — never substitute an unlicensed image. Paths `/photos/ny/brooklyn/{slug}/{label}.jpg` and `..._thumb.jpg`, label unique within the neighborhood and never standing for two different source images. Author, licence and file-page URL copied verbatim; `source_url` is the file page URL. Record `{label} → direct_image_url}` pairs in the report so the wave's photo step can fetch them.

13. **Boundary language** — Brooklyn's neighborhood edges are contested (Bushwick/East Williamsburg, Ocean Hill/Bed-Stuy, Gravesend/Homecrest, the Flatbush sub-neighborhoods). Describe boundaries as commonly understood; never assert a definitive line.

14. **Validation before commit** — `mix test test/ethos/seeds/brooklyn_seed_data_test.exs` then `mix test`. Both green, with the wave's files added.

15. **Copy quality bar** — concrete and specific, warm but not breathless. No filler ("nestled in the heart of"), no unverifiable superlatives ("best pizza in Brooklyn"), no AI-tells ("vibrant tapestry"). Titles name something real: "Cast Iron and Gallery Blocks", not "A Hidden Gem".

- [ ] **Step 2: Verify against the gate**

Read `test/ethos/seeds/brooklyn_seed_data_test.exs` and confirm every mechanical assertion in it has a corresponding prose rule in the document. A gate with no matching rule surprises authors; a rule with no gate is one that leaks.

- [ ] **Step 3: Commit**

```bash
git add docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md
git commit -m "docs: Brooklyn content authoring rules"
```

---

## Task 5: Wave 1 — East Brooklyn (14 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{east-new-york,cypress-hills,city-line,new-lots,starrett-city,highland-park,brownsville,ocean-hill,canarsie,flatlands,marine-park,mill-basin,bergen-beach,georgetown}.json`
- Create: `images/brooklyn/{label}.*` (git-ignored), `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json` (git-ignored)
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` (Task 4), `mix ethos.optimize_brooklyn_photos` (Task 2), the gate (Task 3), the roster (Task 1).
- Produces: 14 seed files and their manifest entries. Later waves must not redefine any place slug this wave owns.

**Wave-specific context:** This wave is first deliberately. It is the thinnest traveler material in the borough, so the orientation tier gets exercised immediately, and it carries the LIRR's East New York station, so the "Getting there" section is proven on an awkward case before Dumbo and Williamsburg. Expect a majority of orientation pages and several imageless ones. **Do not pad** — a neighborhood that cannot clear the floor is omitted and the omission recorded. `highland-park` names both a neighborhood and a park spanning the Queens line: disambiguate the place slug.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full. It binds every step below, and its verdict-filtering and trip-duration rules are not negotiable.
- [ ] **Step 2: Research.** For each of the 14 neighborhoods, run a finder agent (history, transit by every mode, parks, eateries, lodging, closures) then an adversarial verifier issuing per-item `confirmed` / `refuted` / `uncertain` verdicts. Write each to `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout.** One agent sweeping Wikimedia Commons for these neighborhoods' landmarks, recording `{landmark, neighborhood, file_page_url, direct_image_url, license, author}` to `.../research/brooklyn/photos-wave1.json`. Free licences only.
- [ ] **Step 4: Fetch and verify images.** Download each chosen `direct_image_url` to `images/brooklyn/{label}.{ext}`. **Validate magic bytes** — JPEG `FF D8 FF`, PNG `89 50 4E 47`, TIFF `49 49 2A 00` / `4D 4D 00 2A`, WebP `RIFF`. A size check is not enough: Commons returns HTML error pages that a size check accepts, and 41 of them were once saved as `.jpg` in the Connecticut program. Re-fetch anything that fails.
- [ ] **Step 5: Update the manifest.** Add each label to `priv/seed_data/brooklyn_photo_manifest.json` as `{"source_url": "<Commons file page URL>", "sha256": "<hex digest of the downloaded file>"}`.
- [ ] **Step 6: Author the seed files.** One `priv/seed_data/brooklyn/{slug}.json` per neighborhood, bound to the verdicts, tier decided from the surviving place count (6+ → `"guide"`, fewer → `"town-page"`).
- [ ] **Step 7: Optimize photos.** Run `mix ethos.optimize_brooklyn_photos`. It verifies manifest provenance before writing and fails loudly on a hash mismatch.
- [ ] **Step 8: Gate.** Run `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`. Both green before committing.
- [ ] **Step 9: Fact-fidelity review.** Dispatch a reviewer tracing every claim in every file of this wave back to the research artifacts. The wave is not complete until its findings are fixed.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 1 (East Brooklyn)"
```

**Report:** per neighborhood, the surviving verified place count and resulting tier; any neighborhood omitted and why; any `@trip_duration_allowlist` entry added, with justification; the `{label} → direct_image_url}` pairs used.

---

## Task 6: Wave 2 — North Brooklyn (5 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{greenpoint,williamsburg,south-williamsburg,east-williamsburg,bushwick}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster.
- Produces: 5 seed files. Place slugs owned by Wave 1 must not be redefined.

**Wave-specific context:** This wave exercises the NYC Ferry branch of "Getting there" — Greenpoint and North Williamsburg landings. Williamsburg's cross-borough `see-also` edge is to the Lower East Side over the Williamsburg Bridge; that target must be the existing Manhattan guide slug, since `Links.resolve!/1` raises on an unknown target and aborts the whole link pass. The Bushwick/East Williamsburg boundary is contested — follow the boundary-language rule and describe it as commonly understood.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, verdicts recorded, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout.** Commons sweep to `.../research/brooklyn/photos-wave2.json`, free licences only.
- [ ] **Step 4: Fetch and verify images.** Download to `images/brooklyn/{label}.{ext}` and **validate magic bytes** (JPEG `FF D8 FF`, PNG `89 50 4E 47`, TIFF, WebP `RIFF`). Size checks accept Commons HTML error pages; re-fetch anything that fails.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`. Both green.
- [ ] **Step 9: Fact-fidelity review** against the research artifacts; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 2 (North Brooklyn)"
```

**Report:** surviving place count and tier per neighborhood; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 7: Wave 3 — Downtown and the brownstone north (9 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{brooklyn-heights,dumbo,vinegar-hill,downtown-brooklyn,navy-yard,fort-greene,clinton-hill,boerum-hill,cobble-hill}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster.
- Produces: 9 seed files. Place slugs owned by Waves 1-2 must not be redefined.

**Wave-specific context:** The borough's densest material and most of its hotels — expect nearly all full guides, and this is where in-neighborhood lodging genuinely exists rather than requiring a "Where to stay" pointer. Cross-borough `see-also` edges run from Brooklyn Heights and Dumbo to the Financial District over the Brooklyn Bridge. Atlantic Terminal's LIRR service belongs in Downtown Brooklyn's "Getting there". Dumbo and Brooklyn Heights both have ferry landings.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave3.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes** (JPEG `FF D8 FF`, PNG `89 50 4E 47`, TIFF, WebP `RIFF`); re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 3 (Downtown and brownstone north)"
```

**Report:** surviving place count and tier per neighborhood; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 8: Wave 4 — Gowanus basin and the Slope (7 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{carroll-gardens,columbia-street-waterfront-district,red-hook,gowanus,park-slope,windsor-terrace,greenwood}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster.
- Produces: 7 seed files, including the single owner of the Prospect Park place slug. Waves 5, 6 and 10 reference that slug through links rather than redefining it.

**Wave-specific context:** **Red Hook has no subway.** This is the wave that proves the "Getting there" design — write its ferry and bus reality plainly rather than naming a distant station as if it served the neighborhood. Prospect Park borders Park Slope and Windsor Terrace and is also adjacent to Wave 5's and Wave 6's neighborhoods: define its place record in exactly one file here and have every other guide reach it through a link. The global slug-ownership check will fail the build if two files define it.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave4.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes**; re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count. Record which file owns `prospect-park` in the report.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 4 (Gowanus basin and the Slope)"
```

**Report:** surviving place count and tier per neighborhood; the owner file of `prospect-park`; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 9: Wave 5 — Central Brooklyn (7 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{bedford-stuyvesant,stuyvesant-heights,crown-heights,prospect-heights,weeksville,prospect-lefferts-gardens,wingate}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster, and Wave 4's `prospect-park` place slug (reference by link only).
- Produces: 7 seed files.

**Wave-specific context:** Nostrand Avenue's LIRR station serves this area and belongs in the relevant "Getting there" sections. Stuyvesant Heights sits inside Bedford-Stuyvesant, and Weeksville inside Crown Heights. Both are historically distinct and separately designated, so both get their own pages — but their intros must explain the containment rather than implying they are separate districts. Weeksville's history as a 19th-century free Black community is the richest verified material in this wave; build its guide around it.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave5.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes**; re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 5 (Central Brooklyn)"
```

**Report:** surviving place count and tier per neighborhood; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 10: Wave 6 — Flatbush belt (9 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{flatbush,ditmas-park,prospect-park-south,midwood,kensington,east-flatbush,remsen-village,rugby,farragut}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster, Wave 4's `prospect-park` slug.
- Produces: 9 seed files.

**Wave-specific context:** The most contested boundaries in the borough. Several of these are sub-neighborhoods of Flatbush with overlapping definitions, and Prospect Park South is a distinct landmarked district rather than a general area south of the park. Follow the boundary-language rule without exception. Expect orientation tiers in Remsen Village, Rugby and Farragut, and do not pad them to reach a full guide. `prospect-park-south` the neighborhood must not collide with Wave 4's `prospect-park` place slug.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave6.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes**; re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 6 (Flatbush belt)"
```

**Report:** surviving place count and tier per neighborhood; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 11: Wave 7 — Southwest Brooklyn (8 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{sunset-park,borough-park,bay-ridge,fort-hamilton,dyker-heights,bath-beach,bensonhurst,mapleton}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster.
- Produces: 8 seed files.

**Wave-specific context:** Sunset Park is a neighborhood **and** a park — the park's place slug must be disambiguated (`sunset-park-the-park` or similar), and the global ownership check will fail the build if it collides with anything. Bay Ridge and Sunset Park both have ferry landings. Fort Hamilton is an active Army installation with restricted access: state the access reality accurately rather than listing it as a freely visitable attraction. Dyker Heights' Christmas lights are seasonal — say so rather than presenting them as a year-round sight.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave7.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes**; re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json
git commit -m "feat: Brooklyn wave 7 (Southwest Brooklyn)"
```

**Report:** surviving place count and tier per neighborhood; the disambiguated Sunset Park place slug; omissions with reasons; allowlist additions with justification; `{label} → direct_image_url}` pairs.

---

## Task 12: Wave 8 — South shore (10 neighborhoods)

**Files:**
- Create: `priv/seed_data/brooklyn/{gravesend,coney-island,brighton-beach,sea-gate,sheepshead-bay,manhattan-beach,gerritsen-beach,homecrest,madison,plumb-beach}.json`
- Create: `images/brooklyn/{label}.*`, `priv/photos/ny/brooklyn/{slug}/{label}.jpg` + `_thumb.jpg`
- Create: `.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`
- Modify: `priv/seed_data/brooklyn_photo_manifest.json`
- Modify: `test/ethos/seeds/brooklyn_seed_data_test.exs` — only if an `@trip_duration_allowlist` entry is genuinely warranted
- Test: `test/ethos/seeds/brooklyn_seed_data_test.exs` must stay green

**Interfaces:**
- Consumes: the content rules, the optimizer, the gate, the roster.
- Produces: the final 10 seed files. After this wave the corpus is complete and Task 13 can assert roster coverage.

**Wave-specific context:** Coney Island is the borough's richest single-neighborhood attraction set — Luna Park (`amusement-park`), the Riegelmann Boardwalk (`attraction`), the New York Aquarium (`museum`), the beach (`park`), the Cyclone. It is also the one place where **non-travel durations legitimately appear**: a ride's run time, a tour's length. Those are not trip durations and the ban is not meant to reach them, but the regex cannot tell the difference. Any `@trip_duration_allowlist` entry needs a manual read and a written justification in the report, keyed on `{file, json path, matched phrase}` — never on `{file, path}` alone, which would excuse anything later appended to that string.

Sea Gate is a private gated community; state the access reality plainly rather than listing it as visitable. **Manhattan Beach is in Brooklyn** — its `county` field is `"Brooklyn"`, and its name must never leak into a Manhattan-county field or a Manhattan place slug.

- [ ] **Step 1: Read the contract.** Read `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` in full.
- [ ] **Step 2: Research.** Finder then adversarial verifier per neighborhood, written to `.../research/brooklyn/{slug}.json`.
- [ ] **Step 3: Photo scout** to `.../research/brooklyn/photos-wave8.json`, free licences only.
- [ ] **Step 4: Fetch and verify images** into `images/brooklyn/`, **validating magic bytes**; re-fetch failures.
- [ ] **Step 5: Update the manifest** with `{"source_url", "sha256"}` per label.
- [ ] **Step 6: Author the seed files**, bound to the verdicts, tier from the surviving place count.
- [ ] **Step 7: Optimize photos.** `mix ethos.optimize_brooklyn_photos`.
- [ ] **Step 8: Gate.** `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`, then `mix test`. If a legitimate non-travel duration trips the ban, add a `{file, path, phrase}` allowlist entry with a comment stating why it is not a travel claim — never widen the regex.
- [ ] **Step 9: Fact-fidelity review**; fix findings before completing.
- [ ] **Step 10: Commit.**

```bash
git add priv/seed_data/brooklyn priv/photos/ny/brooklyn priv/seed_data/brooklyn_photo_manifest.json test/ethos/seeds/brooklyn_seed_data_test.exs
git commit -m "feat: Brooklyn wave 8 (South shore)"
```

**Report:** surviving place count and tier per neighborhood; every allowlist entry with its justification; omissions with reasons; `{label} → direct_image_url}` pairs.

---

## Task 13: Roster assertion, runbook, and rollout

**Files:**
- Modify: `test/ethos/seeds/brooklyn_seed_data_test.exs`
- Create: `docs/runbooks/seeding.md`
- Delete: `docs/runbooks/connecticut-seeding.md`

**Interfaces:**
- Consumes: `priv/seed_data/brooklyn_roster.json` from Task 1, `Ethos.Release.seed_brooklyn/1` from Task 2, all eight waves' seed files.

- [ ] **Step 1: Add the roster-count assertion**

In `test/ethos/seeds/brooklyn_seed_data_test.exs`, in the corpus test, immediately after the existing `files = files()` line, add:

```elixir
    roster =
      Path.expand("../../../priv/seed_data/brooklyn_roster.json", __DIR__)
      |> File.read!()
      |> Jason.decode!()

    expected = Enum.map(roster["neighborhoods"], & &1["slug"]) |> MapSet.new()
    shipped = files |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    # Omissions are legitimate (the orientation floor exists), but they must be
    # deliberate and recorded — not silent. Any omitted slug listed here has a
    # reason in its wave report.
    assert MapSet.difference(shipped, expected) |> MapSet.to_list() == [],
           "seed files not on the roster"

    assert MapSet.size(shipped) >= 60,
           "only #{MapSet.size(shipped)} of #{MapSet.size(expected)} roster neighborhoods shipped"
```

If any neighborhood was omitted under the floor rule, record the omissions in the runbook and keep the assertion as written; if none were, tighten the second assertion to `MapSet.equal?(shipped, expected)`.

- [ ] **Step 2: Run the gate**

Run: `mix test test/ethos/seeds/brooklyn_seed_data_test.exs`
Expected: PASS.

- [ ] **Step 3: Write the generalized seeding runbook**

Create `docs/runbooks/seeding.md` carrying over everything in `docs/runbooks/connecticut-seeding.md` (read it in full first) and adding Brooklyn. It must state:

- The seed order: `seed_manhattan` → `seed_connecticut` → `seed_connecticut_expansion` → `seed_brooklyn` → `seed_collections` → `seed_links`.
- **Why `seed_links` is last:** `Links.replace_outgoing_links!/2` deletes a source guide's outgoing edges before reinserting, so any seeder running after it silently clobbers `BackfillLinks`' edges.
- **Why Manhattan is first:** thirteen Connecticut files and several Brooklyn files declare cross-borough link targets into Manhattan. `Links.resolve!/1` raises on an unknown target, aborting the whole link pass — after the guides have already been published, leaving a live-looking site with a half-replaced link graph.
- **Code-module guides are not JSON.** `seed_connecticut_expansion` walks JSON only; the CT-5 guides (Waterbury, Middlebury, Danbury, Southbury, Woodbury) seed from Elixir modules via `seed_connecticut`. A content fix in a code-module guide requires `seed_connecticut`, then collections, then links.
- Per-destination expected published counts, verified between steps.
- That seeding is **not** transactional across a run: a raise partway leaves earlier files published, the failing file an orphan draft, and later files unseeded. Re-running is idempotent by slug and heals this.
- `fly ssh console -C` strips double quotes — use the `~s(...)` sigil in rpc expressions.

Delete `docs/runbooks/connecticut-seeding.md`.

- [ ] **Step 4: Full suite**

Run: `mix test`
Expected: PASS, zero failures.

- [ ] **Step 5: Commit**

```bash
git add test/ethos/seeds/brooklyn_seed_data_test.exs docs/runbooks/seeding.md
git rm docs/runbooks/connecticut-seeding.md
git commit -m "feat: Brooklyn roster assertion and generalized seeding runbook"
```

- [ ] **Step 6: Deploy and seed**

Deploy is a side effect outside this worktree — **confirm with the user before running it.** Once confirmed:

```bash
fly deploy
fly ssh console -C "/app/bin/ethos rpc 'Ethos.Release.seed_brooklyn(~s(cryptcom@gmail.com))'"
fly ssh console -C "/app/bin/ethos rpc 'Ethos.Release.seed_collections()'"
fly ssh console -C "/app/bin/ethos rpc 'Ethos.Release.seed_links()'"
```

- [ ] **Step 7: Verify in production**

```bash
curl -s -o /dev/null -w "%{http_code}\n" https://ethosguides.com/destinations/new-york/brooklyn
curl -s https://ethosguides.com/g/red-hook-brooklyn-guide | grep -c "Getting there"
curl -s https://ethosguides.com/sitemap.xml | grep -c "brooklyn"
```

Check one photo per wave resolves (`/photos/ny/brooklyn/{slug}/{label}.jpg` returns `200 image/jpeg`), that the Brooklyn hub lists full guides before orientation pages, and that breadcrumbs read New York → Brooklyn → neighborhood.

Report the published Brooklyn guide count and the sitemap URL total to the user, and remind them to resubmit `https://ethosguides.com/sitemap.xml` in Google Search Console.
