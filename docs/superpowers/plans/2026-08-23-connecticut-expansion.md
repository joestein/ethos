# Connecticut Expansion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship 50 verified Connecticut town guides across all 8 counties as JSON seeds, complete the ten-Bury collection, and wire every new page into the graph.

**Architecture:** Pure data buildout through the existing `Ethos.Seeds.DataGuide` two-pass pipeline: one ~8-line release function and one JSON-scanning photo mix task are the only new code; 50 seed files authored in 7 county waves from verified research; Burys collection seed updated to 10 members.

**Tech Stack:** Elixir/Phoenix 1.7.14, existing DataGuide/Links/Collections subsystems, Vix/PhotoOptimizer.

**Spec:** `docs/superpowers/specs/2026-08-23-connecticut-expansion-design.md`

**Content rules (binding for Tasks 2-8):** `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`

## Global Constraints

- Phoenix 1.7.14; zero AI/API calls in shipped code; `mix format` clean and full suite (311 at plan time) green before every commit.
- Guide slugs `{destination_slug}-ct-travel-guide`; destinations `"{Town}, Connecticut"`; state `"Connecticut"`; counties exactly as the wave tables list them.
- Place-slug and photo-label uniqueness are GLOBAL across connecticut/*.json, manhattan/*.json, and the CT-5 code-module places (content rules doc details).
- Photos `/photos/ct/{town_slug}/...` (existing regex-compatible); PD/CC0/CC-BY/CC-BY-SA only, attributed; originals in git-ignored `images/connecticut/`.
- Verdict filtering and copy rules per the content rules doc; rail claims only when research-verified.

## Research inputs (controller-run, not implementer tasks)

The controller runs 7 find+verify research waves plus per-wave photo scouts,
persisting artifacts to:
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/research/connecticut/{slug}.json`
and `.../photos-wave{1-7}.json`. Content-wave tasks dispatch only after
their artifacts exist; each dispatch names its exact input files.

### Wave → town map (Town / slug / county)

- **Wave 1 — Fairfield County:** Greenwich/greenwich, Stamford/stamford, Norwalk/norwalk, Westport/westport, Ridgefield/ridgefield, Fairfield/fairfield, Bridgeport/bridgeport — county "Fairfield County"
- **Wave 2 — New Haven County:** New Haven/new-haven, Guilford/guilford, Madison/madison, Milford/milford, Branford/branford, Hamden/hamden, Meriden/meriden — county "New Haven County"
- **Wave 3 — Middlesex County:** Essex/essex, Old Saybrook/old-saybrook, Chester/chester, East Haddam/east-haddam, Middletown/middletown, Clinton/clinton — county "Middlesex County"
- **Wave 4 — New London County:** Mystic/mystic, Stonington/stonington, New London/new-london, Groton/groton, Norwich/norwich, Old Lyme/old-lyme, Ledyard/ledyard, Montville/montville — county "New London County"
- **Wave 5 — Hartford County:** Hartford/hartford, West Hartford/west-hartford, Wethersfield/wethersfield, Farmington/farmington, New Britain/new-britain, Simsbury/simsbury, Glastonbury/glastonbury — county "Hartford County"
- **Wave 6 — Litchfield County:** Litchfield/litchfield, Kent/kent, Salisbury/salisbury, Roxbury/roxbury, Washington/washington, Cornwall/cornwall, Norfolk/norfolk, New Milford/new-milford — county "Litchfield County"
- **Wave 7 — Tolland + Windham:** Storrs/storrs, Coventry/coventry, Vernon/vernon — county "Tolland County"; Putnam/putnam, Woodstock/woodstock, Pomfret/pomfret, Canterbury/canterbury — county "Windham County"

Special content notes carried into dispatches: Mystic/Stonington/Groton
shared-history triangle; Roxbury/Woodbury nearby edge (links to the CT-5);
New Haven Line towns (Greenwich, Stamford, Norwalk, Westport, Fairfield,
Bridgeport, Milford, New Haven) may carry a `see-also` →
`guide:midtown-manhattan-guide` Metro-North note; Litchfield-County towns
link `nearby` into the CT-5 where adjacent (the
New Milford↔Roxbury↔Woodbury chain, and Washington↔Roxbury).

---

### Task 1: Engineering prep (release fn + photo task + validation test)

**Files:**
- Modify: `lib/ethos/release.ex` (add `seed_connecticut_expansion/1` after `seed_collections/0`)
- Create: `lib/mix/tasks/ethos.optimize_connecticut_photos.ex`
- Create: `test/ethos/seeds/connecticut_seed_data_test.exs`

**Interfaces:**
- Consumes: `Ethos.Seeds.DataGuide.load!/1`, `upsert_places!/1`, `upsert_guide!/2` (existing); `Ethos.PhotoOptimizer.optimize/3`; `Ethos.Seeds.ConnecticutPlaces.places/0` (CT-5 code-module place list).
- Produces: `Ethos.Release.seed_connecticut_expansion/1` (email; two-pass over sorted `priv/seed_data/connecticut/*.json`); `mix ethos.optimize_connecticut_photos`; the validation gate test used by every content wave.

- [ ] **Step 1: Release function** — in `lib/ethos/release.ex`:

```elixir
  def seed_connecticut_expansion(email) do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", "connecticut", "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> Enum.sort()

    Enum.each(files, &Ethos.Seeds.DataGuide.upsert_places!/1)

    for file <- files do
      guide = Ethos.Seeds.DataGuide.upsert_guide!(file, email)
      IO.puts("Seeded: /g/#{guide.slug}")
    end
  end
```

- [ ] **Step 2: Photo mix task** — `lib/mix/tasks/ethos.optimize_connecticut_photos.ex` (read `lib/mix/tasks/ethos.optimize_ny_photos.ex` first; this is the same shape with three differences: seed glob, expected src prefix, source dir):

```elixir
defmodule Mix.Tasks.Ethos.OptimizeConnecticutPhotos do
  @shortdoc "Optimizes CT-expansion photos from images/connecticut/ into priv/static/photos/ct/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/connecticut/*.json for photo srcs and optimizes images/connecticut/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)

  @impl true
  def run(_args) do
    "priv/seed_data/connecticut/*.json"
    |> Path.wildcard()
    |> Enum.flat_map(&photo_srcs/1)
    |> Enum.uniq()
    |> Enum.each(&optimize_src/1)
  end

  defp photo_srcs(file) do
    data = file |> File.read!() |> Jason.decode!()

    ((get_in(data, ["guide", "photos"]) || []) ++
       Enum.flat_map(data["places"] || [], &(&1["photos"] || [])))
    |> Enum.map(& &1["src"])
  end

  defp optimize_src(src) do
    case String.split(src, "/") do
      ["", "photos", "ct", town, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "static", "photos", "ct", town])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/ct/{town}/{label}.jpg)")
    end
  end

  defp find_source!(label) do
    Enum.find_value(@source_exts, fn ext ->
      path = Path.join(["images", "connecticut", "#{label}.#{ext}"])
      if File.exists?(path), do: path
    end) || Mix.raise("no source image for #{label} under images/connecticut/")
  end
end
```

- [ ] **Step 3: Validation test** (vacuous-pass until content lands; Task 10 flips the guard):

`test/ethos/seeds/connecticut_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.ConnecticutSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @ct_glob Path.expand("../../../priv/seed_data/connecticut/*.json", __DIR__)
  @manhattan_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)

  defp ct_files, do: @ct_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every committed connecticut seed file is valid, globally unique, and loads twice" do
    files = ct_files()

    if files != [] do
      # place-slug ownership across connecticut + manhattan + CT-5 code module
      json_owned =
        for f <- files ++ Path.wildcard(@manhattan_glob),
            p <- DataGuide.load!(f)["places"],
            do: {p["slug"], Path.basename(f)}

      code_owned =
        for p <- Ethos.Seeds.ConnecticutPlaces.places(), do: {p.slug, "connecticut_places.ex"}

      dups =
        (json_owned ++ code_owned)
        |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
        |> Enum.filter(fn {_slug, owners} -> length(Enum.uniq(owners)) > 1 end)

      assert dups == [], "place slugs with multiple owners: #{inspect(dups)}"

      # licenses
      for f <- files, p <- all_photos(DataGuide.load!(f)) do
        assert allowed_license?(p["license"]),
               "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
      end

      # two-pass load, twice
      user = user_fixture()

      for _pass <- 1..2 do
        Enum.each(files, &DataGuide.upsert_places!/1)
        Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      end

      ct_guides =
        Ethos.Guides.list_published_guides()
        |> Enum.filter(&(&1.state == "Connecticut" and String.ends_with?(&1.slug, "-ct-travel-guide")))

      assert length(ct_guides) >= length(files)
    end
  end
end
```

(The `>=` accounts for the five code-module CT guides sharing the slug
suffix; exact accounting: `length(ct_guides) == length(files)` only when
the CT-5 aren't seeded in the sandbox — use `>=` as written.)

- [ ] **Step 4: Verify** — `mix ethos.optimize_connecticut_photos` no-ops cleanly (no seed files yet); `mix test test/ethos/seeds/connecticut_seed_data_test.exs` passes vacuously; `mix format --check-formatted && mix test` green.

- [ ] **Step 5: Commit**

```bash
git add -A && git commit -m "feat: Connecticut expansion seeding + photo pipeline + validation gate"
```

---

### Tasks 2-8: Content waves 1-7 (one task per wave)

**Files (per wave):** Create `priv/seed_data/connecticut/{slug}.json` for each of the wave's towns (see the Wave → town map above; counties exactly as listed).

**Interfaces:**
- Consumes: `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md` (BINDING — JSON shape, verdict filtering, links requirements, global slug/label uniqueness, photo rules, copy bar); the wave's research artifacts (exact paths in dispatch); `mix test test/ethos/seeds/connecticut_seed_data_test.exs` as the validation gate.
- Produces: committed seed JSONs with per-file `links` arrays; a report listing every photo's `{town_slug}/{label} → direct_image_url` download pair.

- [ ] **Step 1:** Read the content rules doc in full, then every research artifact for the wave.
- [ ] **Step 2:** For each town: verdict-filter, then author the seed JSON — 6-12 places, 6-12 entries, history intro (100-155 words, counted), "Getting there" section + FAQ, 4-6 FAQ total, 2-3 photos from the wave's photo artifact, and the `links` array (nearby edges among this wave + previously committed towns + CT-5/Manhattan targets named in the dispatch; shared-history with notes where research supports).
- [ ] **Step 3:** Validate: the connecticut seed-data test, then full `mix test`.
- [ ] **Step 4:** Report photo download pairs.
- [ ] **Step 5:** Commit: `mix format && git add priv/seed_data && git commit -m "feat: Connecticut seed data wave N (<county>)"`

Task 2 = Wave 1 (Fairfield), Task 3 = Wave 2 (New Haven), Task 4 = Wave 3
(Middlesex), Task 5 = Wave 4 (New London), Task 6 = Wave 5 (Hartford),
Task 7 = Wave 6 (Litchfield), Task 8 = Wave 7 (Tolland + Windham).

---

### Task 9: Ten-Bury collection update

**Files:**
- Modify: `lib/ethos/seeds/burys_collection.ex`
- Modify: `test/ethos/seeds/burys_collection_test.exs`

**Interfaces:**
- Consumes: the five new Bury guides seeded by waves 5-7 (simsbury, glastonbury from Wave 5; salisbury, roxbury from Wave 6; canterbury from Wave 7) — this task runs after Task 8.
- Produces: `BurysCollection.upsert!/0` with 10 items.

- [ ] **Step 1:** Update the intro (replace the "Five of them sit within a short drive of each other" sentence with statewide framing):

```elixir
      intro: """
      Connecticut has a habit of naming towns with the Old English ending
      *-bury* — "fortified settlement" — and ten of its towns carry it,
      from the brass mills of the Naugatuck Valley to the Quiet Corner.
      Five cluster in the western hills; the other five stretch across the
      Farmington Valley, the Litchfield Hills, and the northeast. This
      collection gathers our guides to all ten Burys — start anywhere and
      follow the connections.
      """,
```

- [ ] **Step 2:** Append five items after the existing five (order: the original five, then):

```elixir
        %{
          guide_slug: "simsbury-ct-travel-guide",
          blurb: "Farmington Valley greenways, Talcott Mountain's tower views, and one of New England's oldest towns."
        },
        %{
          guide_slug: "glastonbury-ct-travel-guide",
          blurb: "Orchard country on the Connecticut River, crossed by one of America's oldest continuously running ferries."
        },
        %{
          guide_slug: "salisbury-ct-travel-guide",
          blurb: "The northwest corner: Appalachian Trail towns, lakes, and Lime Rock's racing heritage."
        },
        %{
          guide_slug: "roxbury-ct-travel-guide",
          blurb: "The quietest Bury — Litchfield Hills farmland that artists and writers call home."
        },
        %{
          guide_slug: "canterbury-ct-travel-guide",
          blurb: "Quiet Corner history, anchored by Prudence Crandall's pioneering school for Black women."
        }
```

IMPORTANT: if any blurb states a fact not verified by that town's research
artifact (check the wave 5-7 artifacts), soften it to what the research
supports — blurbs obey the same content policy.

- [ ] **Step 3:** Update the test: seed the five new guides' seed files (via `DataGuide.upsert_from_file!`) plus the CT-5 modules before `upsert!()`; assert 10 items, stable order (original five then the new five), idempotent double-run, published.
- [ ] **Step 4:** Run the test + full suite; `mix format`; commit `"feat: complete the ten-Bury collection"`.

---

### Task 10: Photos + final validation

**Files:**
- Downloads (git-ignored): `images/connecticut/*`
- Create (binary, committed): `priv/static/photos/ct/{town_slug}/*.jpg`
- Modify: `test/ethos/seeds/connecticut_seed_data_test.exs` (finalize)

**Interfaces:**
- Consumes: Tasks 2-8 reports' photo download pairs (dispatch aggregates them); `mix ethos.optimize_connecticut_photos` (Task 1).
- Produces: all referenced photo files committed; the validation test requires files and asserts photo existence.

- [ ] **Step 1:** Download every original with the established pattern (`curl -fsSL -A "EthosPhotoFetch/1.0 (https://ethos.fly.dev; cryptcom@gmail.com)"` into `images/connecticut/{label}.{ext}`; retry 429s with backoff; on 404 re-resolve the SAME file via its Commons page; NEVER substitute). If two towns share a label for DIFFERENT images, STOP and report BLOCKED with the collision (labels are globally unique per the rules doc — a collision is an authoring bug to fix by renaming in the seed JSON with controller approval).
- [ ] **Step 2:** `mix ethos.optimize_connecticut_photos`; verify JPEG pair count = distinct srcs × 2 (`rtk proxy find` if piped counts look wrong); visually spot-check 5+ images across counties (Read the files) for orientation/conversion.
- [ ] **Step 3:** Finalize the validation test: replace `if files != [] do` with `assert files != []`; add inside the per-photo loop (hoisting `static_root = Path.expand("../../../priv/static", __DIR__)` above it):

```elixir
        assert File.exists?(Path.join(static_root, p["src"])), "missing #{p["src"]}"
        assert File.exists?(Path.join(static_root, p["thumb"])), "missing #{p["thumb"]}"
```

- [ ] **Step 4:** Validation test + full suite green; `mix format`; commit ONLY test + priv/static/photos/ct (+ any controller-approved label renames): `"feat: Connecticut expansion photos optimized and validated"`.

---

### Task 11 (controller-executed, NOT for implementation subagents): rollout

After final whole-branch review and merge to main: `fly deploy` →
`fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_connecticut_expansion(\"cryptcom@gmail.com\")'"` →
`... eval 'Ethos.Release.seed_collections()'` (ten-Bury) →
`... eval 'Ethos.Release.seed_links()'` (prune + backfill) →
verify live on ethosguides.com: all 8 county hubs under
/destinations/connecticut, 6+ new guides across regions (incl.
/g/mystic-ct-travel-guide and /g/greenwich-ct-travel-guide), the
ten-member /c/the-burys-of-connecticut, Connected pages on a shoreline and
a hills town, /search?q=mystic, sitemap growth (~100+ new URLs) → `git push`
→ note in the final report: resubmit sitemap in GSC per
docs/runbooks/google-search-console.md.
