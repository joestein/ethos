# Manhattan Neighborhood Guides Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship 38 published Manhattan neighborhood guides (with places, subway sections, badges, and attributed Commons photos) on a new data-driven JSON seed subsystem, live under `/destinations/new-york/manhattan`.

**Architecture:** Generalize the CT guide runner into `Ethos.Seeds.GuideRunner`, add a JSON loader (`Ethos.Seeds.DataGuide`) reading `priv/seed_data/manhattan/*.json` via two-pass seeding (all places, then all guides), dynamize per-town explorer badges from seeded data, and author the 38 seed files in five content waves from verified research artifacts.

**Tech Stack:** Elixir/Phoenix 1.7.14, Ecto/Postgres, Jason, Vix/PhotoOptimizer.

**Spec:** `docs/superpowers/specs/2026-08-22-manhattan-neighborhoods-design.md`

**Content rules (binding for Tasks 4-8):** `docs/superpowers/plans/2026-08-22-manhattan-content-rules.md`

## Global Constraints

- Phoenix 1.7.14 conventions (`current_user`, not 1.8 scopes); zero AI/API calls in all shipped code.
- Editorial voice; no fabricated experiences; only research-verified facts (verdict filtering per the content rules doc).
- Images: Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA only, attributed (7-key photo maps), never hotlinked; photo paths match `~r{^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$}`.
- Public changesets never cast privileged fields (`place_id`, `source`, `credited_user_id`).
- External URLs render only behind `EthosWeb.Url.safe_http?/1`.
- `mix format` clean and full suite green (270 tests at plan time) before every commit.
- Guide slugs `{slug}-manhattan-guide`; destinations `"{Neighborhood}, New York"`; state `"New York"`; county `"Manhattan"`.

## Research inputs (controller-run, not implementer tasks)

The session controller runs the research program (five find+verify workflow
waves plus per-wave Commons photo scouts) and writes artifacts to:

- `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/research/manhattan/{slug}.json`
- `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/research/manhattan/photos-wave{1-5}.json`

Content-wave tasks (4-8) are dispatched only after their wave's artifacts
exist; each dispatch names the exact input files.

### Wave → neighborhood map (display name / slug)

- **Wave 1 (Downtown A):** Financial District/financial-district, Battery Park City/battery-park-city, Tribeca/tribeca, Chinatown/chinatown, Little Italy/little-italy, NoLIta/nolita, Lower East Side/lower-east-side, Two Bridges/two-bridges
- **Wave 2 (Downtown B):** SoHo/soho, NoHo/noho, Greenwich Village/greenwich-village, West Village/west-village, East Village/east-village, Alphabet City/alphabet-city, Union Square/union-square, Flatiron District/flatiron-district
- **Wave 3 (Midtown A):** Gramercy/gramercy, Chelsea/chelsea, Meatpacking District/meatpacking-district, Hudson Yards/hudson-yards, Garment District/garment-district, Koreatown/koreatown, Murray Hill/murray-hill, Kips Bay/kips-bay
- **Wave 4 (Midtown B):** NoMad/nomad, Midtown/midtown, Theater District/theater-district, Hell's Kitchen/hell-s-kitchen, Upper West Side/upper-west-side, Upper East Side/upper-east-side, Yorkville/yorkville
- **Wave 5 (Uptown):** Carnegie Hill/carnegie-hill, Morningside Heights/morningside-heights, Harlem/harlem, East Harlem/east-harlem, Hamilton Heights/hamilton-heights, Washington Heights/washington-heights, Inwood/inwood

Cross-file shared place: `central-park` is DEFINED in the Upper West Side
file; the Upper East Side guide may reference it in entries only.

---

### Task 1: GuideRunner generalization + DataGuide JSON loader + seed_manhattan

**Files:**
- Create: `lib/ethos/seeds/guide_runner.ex` (renamed/generalized from `ct_guide_runner.ex`)
- Delete: `lib/ethos/seeds/ct_guide_runner.ex`
- Modify: `lib/ethos/seeds/waterbury_guide.ex`, `middlebury_guide.ex`, `danbury_guide.ex`, `southbury_guide.ex`, `woodbury_guide.ex` (module ref + `state:` key)
- Create: `lib/ethos/seeds/data_guide.ex`
- Modify: `lib/ethos/release.ex` (add `seed_manhattan/1`)
- Create: `test/support/fixtures/seed_data/testville.json`, `test/support/fixtures/seed_data/refville.json`
- Test: `test/ethos/seeds/data_guide_test.exs`, `test/ethos/seeds/manhattan_seed_data_test.exs`

**Interfaces:**
- Consumes: `Ethos.Seeds.CtGuideRunner.upsert!/2` (existing — becomes `GuideRunner.upsert!/2`), `Places.upsert_place!/1` (accepts string-keyed maps), `Ethos.AccountsFixtures.user_fixture/0`.
- Produces: `Ethos.Seeds.GuideRunner.upsert!(data, email)` where `data` now REQUIRES `:state` (no Connecticut default); `Ethos.Seeds.DataGuide.load!(path)` → decoded map or raises `ArgumentError` with path; `DataGuide.upsert_places!(path)` → `[%Place{}]`; `DataGuide.upsert_guide!(path, email)` → `%Guide{}`; `DataGuide.upsert_from_file!(path, email)` → `%Guide{}`; `Ethos.Release.seed_manhattan/1` (two-pass). Tasks 4-9 rely on `mix test test/ethos/seeds/manhattan_seed_data_test.exs` as their validation gate.

- [ ] **Step 1: Rename and generalize the runner**

`git mv lib/ethos/seeds/ct_guide_runner.ex lib/ethos/seeds/guide_runner.ex`, then in the file: rename the module to `Ethos.Seeds.GuideRunner`, update the `@moduledoc` to say it serves both code-module seeds (CT) and JSON data seeds (Manhattan), and in `upsert_guide!/2` replace the hardcoded `"state" => "Connecticut"` with `"state" => data.state`. In each of the five CT town modules: change `Ethos.Seeds.CtGuideRunner.upsert!(data(), email)` to `Ethos.Seeds.GuideRunner.upsert!(data(), email)` and add `state: "Connecticut",` to the `data/0` map (next to `county:`).

- [ ] **Step 2: Run the CT seed test to prove the rename is behavior-neutral**

Run: `mix test test/ethos/seeds/ct_guides_test.exs` — expect PASS (6 guides logic unchanged).

- [ ] **Step 3: Write the fixtures**

`test/support/fixtures/seed_data/testville.json`:

```json
{
  "guide": {
    "slug": "testville-manhattan-guide",
    "title": "Testville, Manhattan: A Fixture Guide",
    "destination": "Testville, New York",
    "state": "New York",
    "county": "Manhattan",
    "intro": "A fixture neighborhood used only in tests.",
    "sections": [
      {"heading": "Getting there by subway", "body": "The T train stops at Test Sq."}
    ],
    "faq": [
      {"question": "How do I get to Testville by subway?", "answer": "Take the T to Test Sq."}
    ],
    "photos": []
  },
  "places": [
    {
      "slug": "test-square-park",
      "name": "Test Square Park",
      "kind": "park",
      "town": "Testville",
      "state": "New York",
      "county": "Manhattan",
      "address": "1 Test Sq, New York, NY",
      "summary": "A small fixture park.",
      "status": "open",
      "photos": []
    },
    {
      "slug": "fixture-diner-testville",
      "name": "Fixture Diner",
      "kind": "restaurant",
      "town": "Testville",
      "state": "New York",
      "county": "Manhattan",
      "summary": "A fixture diner.",
      "status": "open",
      "photos": []
    }
  ],
  "entries": [
    {"kind": "sight", "name": "Test Square Park", "place_slug": "test-square-park", "note": "The fixture park."},
    {"kind": "food", "name": "Fixture Diner", "place_slug": "fixture-diner-testville", "note": "The fixture diner."}
  ]
}
```

`test/support/fixtures/seed_data/refville.json` (exercises cross-file reference — its entries use testville's park):

```json
{
  "guide": {
    "slug": "refville-manhattan-guide",
    "title": "Refville, Manhattan: A Cross-Reference Fixture",
    "destination": "Refville, New York",
    "state": "New York",
    "county": "Manhattan",
    "intro": "A fixture neighborhood that references a shared place.",
    "sections": [],
    "faq": [],
    "photos": []
  },
  "places": [],
  "entries": [
    {"kind": "walk", "name": "Test Square Park", "place_slug": "test-square-park", "note": "Shared park next door."}
  ]
}
```

- [ ] **Step 4: Write the failing loader tests**

`test/ethos/seeds/data_guide_test.exs`:

```elixir
defmodule Ethos.Seeds.DataGuideTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds.DataGuide

  @fixtures Path.expand("../../support/fixtures/seed_data", __DIR__)
  @testville Path.join(@fixtures, "testville.json")
  @refville Path.join(@fixtures, "refville.json")

  test "upsert_from_file! creates places, guide, and linked entries; idempotent" do
    user = user_fixture()

    guide = DataGuide.upsert_from_file!(@testville, user.email)
    guide = DataGuide.upsert_from_file!(@testville, user.email)

    assert guide.slug == "testville-manhattan-guide"
    assert guide.status == "published"
    assert guide.state == "New York"
    assert guide.county == "Manhattan"
    assert guide.intro =~ "fixture neighborhood"

    entries = Guides.list_entries(guide)
    assert length(entries) == 2
    assert Enum.all?(entries, & &1.place_id)

    assert %{kind: "park", town_slug: "testville"} = Places.get_place_by_slug!("test-square-park")
    assert Repo.aggregate(Places.Place, :count) == 2
  end

  test "cross-file entry references resolve after two-pass ordering" do
    user = user_fixture()

    for path <- [@testville, @refville], do: DataGuide.upsert_places!(path)
    for path <- [@testville, @refville], do: DataGuide.upsert_guide!(path, user.email)

    ref = Guides.get_published_guide_by_slug!("refville-manhattan-guide")
    assert [%{place: %{slug: "test-square-park"}}] = Guides.list_entries(ref)
  end

  test "malformed JSON and missing keys raise with the path" do
    bad = Path.join(System.tmp_dir!(), "bad-seed.json")
    File.write!(bad, "{not json")

    assert_raise ArgumentError, ~r/bad-seed\.json/, fn -> DataGuide.load!(bad) end

    File.write!(bad, ~s({"guide": {}}))
    assert_raise ArgumentError, ~r/missing/, fn -> DataGuide.load!(bad) end
  end

  test "unknown place_slug in entries raises" do
    user = user_fixture()
    bad = Path.join(System.tmp_dir!(), "bad-ref-seed.json")

    File.write!(
      bad,
      ~s({"guide": {"slug": "bad-ref-guide", "title": "Bad", "destination": "Bad, New York", "state": "New York", "county": "Manhattan", "intro": "x", "sections": [], "faq": [], "photos": []}, "places": [], "entries": [{"kind": "sight", "name": "Ghost", "place_slug": "no-such-place", "note": "x"}]})
    )

    DataGuide.upsert_places!(bad)
    assert_raise Ecto.NoResultsError, fn -> DataGuide.upsert_guide!(bad, user.email) end
  end
end
```

- [ ] **Step 5: Run to verify failure** — `mix test test/ethos/seeds/data_guide_test.exs`.

- [ ] **Step 6: Implement the loader**

`lib/ethos/seeds/data_guide.ex`:

```elixir
defmodule Ethos.Seeds.DataGuide do
  @moduledoc """
  Loads a JSON seed file (guide + places + entries) and upserts it through
  `Ethos.Seeds.GuideRunner`. Seed files live under `priv/seed_data/` and are
  the authoring format for all data-driven destinations (Manhattan onward).

  Seeding is two-pass at the directory level (see `Ethos.Release.seed_manhattan/1`):
  all files' places first, then all guides — so entries may reference places
  defined in any file of the same run.
  """

  alias Ethos.Places
  alias Ethos.Seeds.GuideRunner

  @required_guide_keys ~w(slug title destination state county intro)

  def upsert_from_file!(path, email) do
    upsert_places!(path)
    upsert_guide!(path, email)
  end

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

  def upsert_places!(path) do
    data = load!(path)
    Enum.map(data["places"], &Places.upsert_place!/1)
  end

  def upsert_guide!(path, email) do
    data = load!(path)
    g = data["guide"]

    runner_data = %{
      slug: g["slug"],
      title: g["title"],
      destination: g["destination"],
      state: g["state"],
      county: g["county"],
      intro: g["intro"],
      sections: g["sections"] || [],
      faq: g["faq"] || [],
      photos: g["photos"] || [],
      entries:
        Enum.map(data["entries"], fn e ->
          %{kind: e["kind"], name: e["name"], note: e["note"], place_slug: e["place_slug"]}
        end)
    }

    GuideRunner.upsert!(runner_data, email)
  end

  defp validate_shape!(path, data) do
    guide = data["guide"]

    cond do
      not (is_map(guide) and is_list(data["places"]) and is_list(data["entries"])) ->
        raise ArgumentError, "#{path}: missing guide/places/entries keys"

      Enum.any?(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == "")) ->
        missing = Enum.filter(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == ""))
        raise ArgumentError, "#{path}: guide missing required keys #{inspect(missing)}"

      true ->
        :ok
    end
  end
end
```

(`Places.upsert_place!/1` accepts string-keyed maps — the changeset casts
them and `attrs["slug"]` is read for the lookup. Entries flow through
`GuideRunner.upsert!/2` exactly as the CT modules' atom-keyed entry maps do.)

- [ ] **Step 7: Add `seed_manhattan/1` to `lib/ethos/release.ex`** (after `seed_connecticut/1`)

```elixir
  def seed_manhattan(email) do
    load_app()
    Application.ensure_all_started(@app)

    files =
      [:code.priv_dir(@app) |> to_string(), "seed_data", "manhattan", "*.json"]
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

- [ ] **Step 8: Write the (initially vacuous) seed-data validation test**

`test/ethos/seeds/manhattan_seed_data_test.exs`:

```elixir
defmodule Ethos.Seeds.ManhattanSeedDataTest do
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  alias Ethos.Seeds.DataGuide

  @seed_glob Path.expand("../../../priv/seed_data/manhattan/*.json", __DIR__)

  defp files, do: @seed_glob |> Path.wildcard() |> Enum.sort()

  defp all_photos(data) do
    (get_in(data, ["guide", "photos"]) || []) ++
      Enum.flat_map(data["places"], &(&1["photos"] || []))
  end

  defp allowed_license?(l),
    do: l in ["Public domain", "CC0"] or Regex.match?(~r/^CC BY(-SA)? \d\.\d$/, l)

  test "every committed manhattan seed file is valid, unique, and loads twice" do
    files = files()

    if files != [] do
      # global place-slug ownership: a slug is defined in exactly one file
      owned =
        for f <- files, p <- DataGuide.load!(f)["places"], do: {p["slug"], Path.basename(f)}

      dups =
        owned
        |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
        |> Enum.filter(fn {_slug, fs} -> length(fs) > 1 end)

      assert dups == [], "place slugs defined in multiple files: #{inspect(dups)}"

      # licenses
      for f <- files, p <- all_photos(DataGuide.load!(f)) do
        assert allowed_license?(p["license"]),
               "#{Path.basename(f)}: bad license #{inspect(p["license"])}"
      end

      # two-pass load, twice (idempotency)
      user = user_fixture()

      for _pass <- 1..2 do
        Enum.each(files, &DataGuide.upsert_places!/1)
        Enum.each(files, &DataGuide.upsert_guide!(&1, user.email))
      end

      manhattan_guides =
        Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Manhattan"))

      assert length(manhattan_guides) == length(files)
    end
  end
end
```

(Task 9 extends this test with photo-file-existence assertions and flips it
to require `files != []`.)

- [ ] **Step 9: Run all tests, full suite, commit**

Run: `mix test test/ethos/seeds/ && mix test` — all green.

```bash
mix format && git add -A && git commit -m "feat: data-driven JSON seed loader, generalized guide runner, seed_manhattan"
```

---

### Task 2: Dynamic town-explorer badges

**Files:**
- Modify: `lib/ethos/badges.ex`
- Test: `test/ethos/badges_test.exs` (extend)

**Interfaces:**
- Consumes: `Ethos.Places.Place` fields `town`, `town_slug`, `status`; existing `Badges.definitions/0` structure and `{:town, slug, n}` rule evaluation (unchanged).
- Produces: `definitions/0` now emits `explorer-{town_slug}` dynamically for every town with ≥3 open places; the five CT badges keep their exact keys, names, emoji, and thresholds via `@town_overrides`.

- [ ] **Step 1: Write the failing tests** (append to `test/ethos/badges_test.exs`)

```elixir
  describe "dynamic town explorer badges" do
    test "CT towns keep their historical names and thresholds" do
      # a town needs >=3 open places for its dynamic badge to exist at all
      for i <- 1..3, do: place!("w-#{i}")
      # Middlebury: give it 5+ open places, threshold must still be 3
      for i <- 1..5, do: place!("mid-#{i}", %{town: "Middlebury"})

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "Brass City Explorer", rule: {:town, "waterbury", 5}} =
               defs["explorer-waterbury"]

      assert %{name: "Middlebury Explorer", rule: {:town, "middlebury", 3}} =
               defs["explorer-middlebury"]
    end

    test "new towns get default names and min(5, count) thresholds; <3 places emit none" do
      for i <- 1..3, do: place!("soho-#{i}", %{town: "SoHo", state: "New York", county: "Manhattan"})
      for i <- 1..7, do: place!("harlem-#{i}", %{town: "Harlem", state: "New York", county: "Manhattan"})
      place!("tiny-1", %{town: "Two Bridges", state: "New York", county: "Manhattan"})

      defs = Map.new(Badges.definitions(), &{&1.key, &1})

      assert %{name: "SoHo Explorer", rule: {:town, "soho", 3}} = defs["explorer-soho"]
      assert %{name: "Harlem Explorer", rule: {:town, "harlem", 5}} = defs["explorer-harlem"]
      refute Map.has_key?(defs, "explorer-two-bridges")
    end

    test "closed places don't count toward the dynamic threshold basis" do
      for i <- 1..2, do: place!("x-#{i}", %{town: "Xtown"})
      place!("x-closed", %{town: "Xtown", status: "closed"})

      refute Enum.any?(Badges.definitions(), &(&1.key == "explorer-xtown"))
    end
  end
```

(`place!/2` is the existing helper in this test file — it defaults to
Waterbury/museum. Each test creates its own places: dynamic badges exist
only for towns with ≥3 open places in that test's sandbox, which is why
the first test seeds three Waterbury places before asserting.)

- [ ] **Step 2: Run to verify failure** — the first assertion fails because explorer badges are still static (present even with no places) or thresholds mismatch.

- [ ] **Step 3: Implement**

In `lib/ethos/badges.ex`: delete the five `explorer-*` maps from `@static_defs`, add:

```elixir
  @town_overrides %{
    "waterbury" => %{name: "Brass City Explorer", emoji: "🏭", threshold: 5},
    "danbury" => %{name: "Hat City Explorer", emoji: "🎩", threshold: 5},
    "middlebury" => %{name: "Middlebury Explorer", emoji: "🎡", threshold: 3},
    "southbury" => %{name: "Southbury Explorer", emoji: "🌳", threshold: 3},
    "woodbury" => %{name: "Woodbury Explorer", emoji: "🪑", threshold: 3}
  }

  defp town_defs do
    Repo.all(
      from p in Place,
        where: p.status == "open",
        group_by: [p.town, p.town_slug],
        having: count(p.id) >= 3,
        select: %{town: p.town, town_slug: p.town_slug, count: count(p.id)}
    )
    |> Enum.map(fn t ->
      o = Map.get(@town_overrides, t.town_slug, %{})
      threshold = Map.get(o, :threshold, min(5, t.count))

      %{
        key: "explorer-#{t.town_slug}",
        name: Map.get(o, :name, "#{t.town} Explorer"),
        emoji: Map.get(o, :emoji, "🧭"),
        description: "Check off #{threshold} places in #{t.town}.",
        rule: {:town, t.town_slug, threshold}
      }
    end)
  end
```

and change `definitions/0` to `@static_defs ++ town_defs() ++ county_defs()`.

- [ ] **Step 4: Run the badges tests and full suite** — existing CT badge tests (5-visit boundary etc.) must still pass because the dynamic defs reproduce identical rules once places exist; if an existing test created visits without enough open places for the badge to exist, adjust the TEST setup by adding places (never weaken assertions).

- [ ] **Step 5: Commit**

```bash
mix format && git add -A && git commit -m "feat: dynamic per-town explorer badges with CT overrides"
```

---

### Task 3: Manhattan photo mix task (seed-JSON-driven mapping)

**Files:**
- Create: `lib/mix/tasks/ethos.optimize_ny_photos.ex`

**Interfaces:**
- Consumes: `Ethos.PhotoOptimizer.optimize/3`; committed seed JSONs' photo `src` paths (`/photos/ny/manhattan/{town_slug}/{label}.jpg`); originals downloaded to git-ignored `images/ny/{label}.{ext}`.
- Produces: `mix ethos.optimize_ny_photos` — derives the mapping by scanning `priv/seed_data/manhattan/*.json`, writes JPEG pairs under `priv/static/photos/ny/manhattan/{town_slug}/`. Task 9 runs it.

- [ ] **Step 1: Implement** (mirrors `ethos.optimize_ct_photos` structure — read it first)

```elixir
defmodule Mix.Tasks.Ethos.OptimizeNyPhotos do
  @shortdoc "Optimizes NY source photos from images/ny/ into priv/static/photos/ny/, driven by seed JSONs"
  @moduledoc "Scans priv/seed_data/manhattan/*.json for photo srcs and optimizes images/ny/{label}.* accordingly."
  use Mix.Task

  @source_exts ~w(jpg jpeg png tif tiff JPG JPEG PNG)

  @impl true
  def run(_args) do
    "priv/seed_data/manhattan/*.json"
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
      ["", "photos", "ny", "manhattan", town, file] ->
        label = Path.rootname(file)
        out_dir = Path.join(["priv", "static", "photos", "ny", "manhattan", town])
        File.mkdir_p!(out_dir)

        case Ethos.PhotoOptimizer.optimize(find_source!(label), out_dir, label) do
          {:ok, %{jpg: jpg}} -> Mix.shell().info("ok #{jpg}")
          {:error, reason} -> Mix.raise("failed #{label}: #{inspect(reason)}")
        end

      _ ->
        Mix.raise("unexpected photo src path #{src} (want /photos/ny/manhattan/{town}/{label}.jpg)")
    end
  end

  defp find_source!(label) do
    Enum.find_value(@source_exts, fn ext ->
      path = Path.join(["images", "ny", "#{label}.#{ext}"])
      if File.exists?(path), do: path
    end) || Mix.raise("no source image for #{label} under images/ny/")
  end
end
```

- [ ] **Step 2: Verify it compiles and no-ops cleanly with zero seed files**

Run: `mix ethos.optimize_ny_photos` — expect no output, exit 0. Then `mix format --check-formatted && mix test`.

- [ ] **Step 3: Commit**

```bash
git add lib/mix && git commit -m "feat: seed-JSON-driven NY photo optimization task"
```

---

### Tasks 4-8: Content waves (one task per wave)

Each wave task is identical in shape; only the neighborhood set and input
files differ (see the Wave → neighborhood map above).

**Files (per wave):**
- Create: `priv/seed_data/manhattan/{slug}.json` for each of the wave's 7-8 neighborhoods.

**Interfaces:**
- Consumes: `docs/superpowers/plans/2026-08-22-manhattan-content-rules.md` (BINDING — the full authoring contract: verdict filtering, JSON shape, slug rules, photo rules, copy quality bar); the wave's research artifacts (exact paths in the dispatch); `mix test test/ethos/seeds/manhattan_seed_data_test.exs` as the validation gate (Task 1).
- Produces: committed seed JSONs; a report listing, for every photo used, `{label} → direct_image_url` download pairs (Task 9 consumes these).

- [ ] **Step 1: Read the content rules doc in full**, then read every research artifact for the wave's neighborhoods.
- [ ] **Step 2: For each neighborhood, apply verdict filtering** (refuted → excluded or corrected; uncertain → excluded/reworded per the rules) and author `priv/seed_data/manhattan/{slug}.json` with 6-12 places, 6-12 entries, the "Getting there by subway" section, the subway FAQ, and 2-4 photos chosen only from the wave's photo artifact.
- [ ] **Step 3: Validate** — `mix test test/ethos/seeds/manhattan_seed_data_test.exs` (loads ALL committed files including earlier waves' — global slug ownership and licenses enforced), then `mix test` full suite.
- [ ] **Step 4: Report the photo download pairs** (`{town_slug}/{label} → direct_image_url`, plus author/license/file page for cross-checking) in your task report.
- [ ] **Step 5: Commit**

```bash
mix format && git add priv/seed_data && git commit -m "feat: Manhattan seed data wave N (<neighborhood list>)"
```

- **Task 4 = Wave 1 (Downtown A)**, **Task 5 = Wave 2 (Downtown B)**, **Task 6 = Wave 3 (Midtown A)**, **Task 7 = Wave 4 (Midtown B)**, **Task 8 = Wave 5 (Uptown)**.

---

### Task 9: Photo downloads, optimization, and final validation

**Files:**
- Downloads (git-ignored): `images/ny/*`
- Create (binary, committed): `priv/static/photos/ny/manhattan/{town_slug}/*.jpg`
- Modify: `test/ethos/seeds/manhattan_seed_data_test.exs` (finalize)

**Interfaces:**
- Consumes: Tasks 4-8 reports' `{label} → direct_image_url` pairs (the dispatch aggregates them into a download list); `mix ethos.optimize_ny_photos` (Task 3).
- Produces: all photo files referenced by seed JSONs committed; the validation test now REQUIRES files and asserts photo existence.

- [ ] **Step 1: Download every original** with the CT pattern (curl with the EthosPhotoFetch UA into `images/ny/{label}.{ext}`; retry transient 429s; on 404 re-resolve the SAME file via its Commons file page — never substitute).
- [ ] **Step 2: Run `mix ethos.optimize_ny_photos`**; verify the produced pair count equals `(number of distinct photo srcs) × 2` via `find priv/static/photos/ny -name '*.jpg' | wc -l` (use `rtk proxy` if counts look wrong). Visually spot-check 4+ images (Read the JPEGs) for orientation/conversion quality.
- [ ] **Step 3: Finalize the validation test** — in `manhattan_seed_data_test.exs`, replace the `if files != [] do` guard with `assert files != []` and add inside the per-photo loop:

```elixir
        static_root = Path.expand("../../../priv/static", __DIR__)
        assert File.exists?(Path.join(static_root, p["src"])), "missing #{p["src"]}"
        assert File.exists?(Path.join(static_root, p["thumb"])), "missing #{p["thumb"]}"
```

(Hoist `static_root` above the loop.)

- [ ] **Step 4: Run the validation test and full suite** — green.
- [ ] **Step 5: Commit**

```bash
mix format && git add -A && git commit -m "feat: Manhattan Commons photos optimized and validated"
```

---

### Task 10 (controller-executed, NOT for implementation subagents): rollout

After the final whole-branch review and merge to main: `fly deploy`, then
`fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_manhattan(\"cryptcom@gmail.com\")'"`,
then verify live on ethosguides.com: `/destinations/new-york`,
`/destinations/new-york/manhattan`, 3+ neighborhood guides across
Downtown/Midtown/Uptown, 3+ place pages, a check-off awarding a
"{Town} Explorer" badge, sitemap containing the new URLs, and the homepage
"Latest guides" section showing Manhattan guides. Then `git push`.
