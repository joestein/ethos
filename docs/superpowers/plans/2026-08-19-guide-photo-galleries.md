# Guide Photo Galleries Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Photo gallery pages at `/g/:slug/photos` with optimized committed JPEGs, a teaser strip on guide pages, ImageGallery JSON-LD, sitemap entries, and the 13 Rome photos live in production.

**Architecture:** `photos` jsonb on guides; dev-side Vix optimization task producing committed `priv/static/photos/rome/*.jpg`; gallery action on the existing `GuideController`; teaser in `guide_html/show`; seed extension. No new deps.

**Tech Stack:** Existing app (Phoenix 1.7, Vix, Earmark). yaml parsing for the manifest via `:yamerl` (Erlang/OTP-adjacent) — AVOID new deps: instead the optimize task parses the manifest with a tiny hand-rolled parser OR the photo metadata is passed inline; see Task 2 (we hand the task a hardcoded label list — the manifest is only documentation).

**Spec:** `docs/superpowers/specs/2026-08-19-guide-photo-galleries-design.md`

## Global Constraints

- The guide URL `/g/:slug` must not change. Gallery is `/g/:slug/photos`.
- Gallery 404s unless the guide is published AND has non-empty photos.
- Photo files: `priv/static/photos/rome/{label}.jpg` (max edge 1600px) and `{label}_thumb.jpg` (max edge 480px), JPEG q≈82, committed to git. `photos` added to `EthosWeb.static_paths/0`.
- `/images/` (originals + manifest.yaml) gitignored, never committed, never in the Docker context.
- All JSON-LD emitted through the existing escaped path (root layout loop, `escape: :html_safe`).
- Photo `src`/`thumb` are site-relative paths starting `/photos/`; JSON-LD `contentUrl`/`thumbnailUrl` are absolute (via `url/1`).
- `mix test` green + `mix format --check-formatted` clean before every commit. Read files before editing — the codebase has evolved (e.g. `create_entry/3` privileged mode, `Ethos.Url.safe_http?/1`, JSON-LD helpers in `GuideController`).
- The 13 photo labels (filenames under `/photos/rome/`): `food-flatbread-lunch, arch-of-constantine, arch-of-titus-menorah-relief, arch-across-the-forum, vittoriano-and-domes, palatine-forum-view, colosseum-exterior-arches, colosseum-hypogeum, colosseum-interior-wide, trevi-fountain, obelisk-and-church, street-art-michelangelo, santa-maria-in-trastevere`.

---

### Task 1: photos field + context + static path + gitignore

**Files:**
- Create: migration `add_photos_to_guides`
- Modify: `lib/ethos/guides/guide.ex` (add field), `lib/ethos/guides.ex`, `lib/ethos_web.ex` (`static_paths`), `.gitignore`
- Test: `test/ethos/guide_photos_test.exs`

**Interfaces:**
- Produces: `guides.photos` jsonb (`{:array, :map}`, consistent with sections/faq); `Guides.update_guide_photos(guide, photos) :: {:ok, guide} | {:error, changeset}` validating each item has non-empty string `"src"` starting with `/photos/` plus string `"thumb"`, `"title"`, `"description"`; `"photos" in EthosWeb.static_paths()`; `/images/` gitignored.

- [ ] **Step 1: Failing test**

```elixir
defmodule Ethos.GuidePhotosTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  @photo %{
    "src" => "/photos/rome/trevi-fountain.jpg",
    "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
    "title" => "Trevi Fountain",
    "description" => "Oceanus and the tritons in afternoon sun."
  }

  test "update_guide_photos/2 stores a valid photo list" do
    guide = guide_fixture()
    {:ok, guide} = Guides.update_guide_photos(guide, [@photo])
    assert [%{"title" => "Trevi Fountain"}] = guide.photos
  end

  test "rejects photos with missing fields or foreign src" do
    guide = guide_fixture()
    {:error, _} = Guides.update_guide_photos(guide, [%{"src" => "/photos/x.jpg"}])
    {:error, _} = Guides.update_guide_photos(guide, [Map.put(@photo, "src", "https://evil.example/x.jpg")])
  end
end
```

- [ ] **Step 2: Run to verify failure** — `mix test test/ethos/guide_photos_test.exs`
- [ ] **Step 3: Implement**

Migration: `alter table(:guides) do add :photos, {:array, :map} end`.

`guide.ex`: add `field :photos, {:array, :map}` and:

```elixir
def photos_changeset(guide, attrs) do
  guide
  |> cast(attrs, [:photos])
  |> validate_change(:photos, fn :photos, photos ->
    ok? =
      is_list(photos) and
        Enum.all?(photos, fn p ->
          is_map(p) and
            Enum.all?(~w(src thumb title description), &is_binary(Map.get(p, &1))) and
            String.starts_with?(p["src"], "/photos/") and
            String.starts_with?(p["thumb"], "/photos/")
        end)

    if ok?, do: [], else: [photos: "each photo needs src/thumb under /photos/ plus title and description"]
  end)
end
```

`guides.ex`:

```elixir
def update_guide_photos(%Guide{} = guide, photos) do
  guide |> Guide.photos_changeset(%{photos: photos}) |> Repo.update()
end
```

`lib/ethos_web.ex`: add `photos` to the `static_paths` list. `.gitignore`: add `/images/`.

- [ ] **Step 4: Tests pass** — focused + `mix test`; `mix ecto.migrate` first.
- [ ] **Step 5: Commit** — `feat: photos field on guides with static path`

---

### Task 2: photo optimization mix task

**Files:**
- Create: `lib/mix/tasks/ethos.optimize_photos.ex`, `lib/ethos/photo_optimizer.ex`
- Test: `test/ethos/photo_optimizer_test.exs`

**Interfaces:**
- Produces: `Ethos.PhotoOptimizer.optimize(src_png_path, out_dir, label) :: {:ok, %{jpg: path, thumb: path}} | {:error, term}` — writes `{label}.jpg` (max edge 1600) + `{label}_thumb.jpg` (max edge 480), JPEG Q=82, via Vix (`Vix.Vips.Operation.thumbnail!/2` or `Image.thumbnail` equivalents — use `Vix.Vips.Operation.thumbnail(path, width_px, height: ...)`; simplest correct: `Vix.Vips.Operation.thumbnail(png_path, 1600)` which caps the WIDTH — to cap the LONG edge, load the image, compare width/height, and pass `1600` with `height: 1600` opt if supported, or compute scale manually with `Vix.Vips.Operation.resize`; verify the actual Vix 0.41 API from deps source and note what you used). Mix task `mix ethos.optimize_photos` maps the 13 labels (Global Constraints) to `images/IMG_XXXX.png` files via a hardcoded `{label, filename}` list (order matches the manifest: 3618 food-flatbread-lunch, 3622 arch-of-constantine, 3623 arch-of-titus-menorah-relief, 3624 arch-across-the-forum, 3625 vittoriano-and-domes, 3626 palatine-forum-view, 3627 colosseum-exterior-arches, 3629 colosseum-hypogeum, 3631 colosseum-interior-wide, 3637 trevi-fountain, 3639 obelisk-and-church, 3642 street-art-michelangelo, 3643 santa-maria-in-trastevere), writing to `priv/static/photos/rome/`; skips-with-warning on missing sources; prints a summary.

- [ ] **Step 1: Failing test** — generate a 64x32 PNG fixture with Vix in the test (write to tmp_dir), run `optimize/3`, assert both JPEGs exist, are non-empty, and (loading them back with Vix) their long edges are ≤1600/≤480 and aspect preserved.

```elixir
defmodule Ethos.PhotoOptimizerTest do
  use ExUnit.Case, async: true

  @moduletag :tmp_dir

  test "produces bounded jpg and thumb", %{tmp_dir: tmp} do
    src = Path.join(tmp, "src.png")
    {:ok, img} = Vix.Vips.Operation.black(2000, 1000)
    :ok = Vix.Vips.Image.write_to_file(img, src)

    {:ok, %{jpg: jpg, thumb: thumb}} = Ethos.PhotoOptimizer.optimize(src, tmp, "test-photo")

    assert Path.basename(jpg) == "test-photo.jpg"
    assert Path.basename(thumb) == "test-photo_thumb.jpg"

    {:ok, j} = Vix.Vips.Image.new_from_file(jpg)
    {:ok, t} = Vix.Vips.Image.new_from_file(thumb)
    assert max(Vix.Vips.Image.width(j), Vix.Vips.Image.height(j)) <= 1600
    assert max(Vix.Vips.Image.width(t), Vix.Vips.Image.height(t)) <= 480
  end
end
```

(Adjust `Vix.Vips.Operation.black/2` arity/return to the installed API; the intent is any programmatically generated image.)

- [ ] **Step 2: Verify failure.**
- [ ] **Step 3: Implement** `PhotoOptimizer.optimize/3` (load → compute scale for long edge → resize → `write_to_file(out, Q: 82)` — jpg quality via suffix options `"file.jpg[Q=82]"` if the keyword isn't supported; verify against deps) and the mix task (iterate mapping, mkdir_p, call optimize, print report; `@shortdoc "Optimize trip photos into priv/static/photos"`).
- [ ] **Step 4: Tests pass.**
- [ ] **Step 5: Commit** — `feat: photo optimization task`

---

### Task 3: gallery page

**Files:**
- Modify: `lib/ethos_web/router.ex` (public scope: `get "/g/:slug/photos", GuideController, :photos`), `lib/ethos_web/controllers/guide_controller.ex`
- Create: `lib/ethos_web/controllers/guide_html/photos.html.heex`
- Test: `test/ethos_web/controllers/guide_photos_page_test.exs`

**Interfaces:**
- Produces: `GuideController.photos/2` — loads published guide by slug; 404 (same idiom as DestinationController) when `photos` nil/empty; assigns `guide`, `photos`, `page_title` ("Pictures from {Name} — {Guide title}"), `page_meta_description`, `page_canonical`, `json_ld` (breadcrumb with 5th "Photos" item + ImageGallery).

- [ ] **Step 1: Failing test**

```elixir
defmodule EthosWeb.GuidePhotosPageTest do
  use EthosWeb.ConnCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Guides

  @photos [
    %{"src" => "/photos/rome/trevi-fountain.jpg", "thumb" => "/photos/rome/trevi-fountain_thumb.jpg",
      "title" => "Trevi Fountain", "description" => "Oceanus in afternoon sun."},
    %{"src" => "/photos/rome/arch-of-constantine.jpg", "thumb" => "/photos/rome/arch-of-constantine_thumb.jpg",
      "title" => "Arch of Constantine", "description" => "Triple arch beside the Colosseum."}
  ]

  defp photo_guide do
    guide = published_guide_fixture(%{title: "Three Days", destination: "Rome, Italy"})
    {:ok, guide} = Guides.update_guide_photos(guide, @photos)
    guide
  end

  test "renders captions, alt text, back links, and ImageGallery JSON-LD", %{conn: conn} do
    guide = photo_guide()
    html = conn |> get(~p"/g/#{guide.slug}/photos") |> html_response(200)

    assert html =~ "Pictures from Rome"
    assert html =~ "Trevi Fountain"
    assert html =~ "Oceanus in afternoon sun."
    assert html =~ ~s(alt="Trevi Fountain")
    assert html =~ ~s(loading="lazy")
    assert html =~ "/photos/rome/trevi-fountain_thumb.jpg"
    assert html =~ "Back to the guide"
    assert html =~ ~s("@type":"ImageGallery")
    assert html =~ ~s("@type":"ImageObject")
    assert html =~ "<title>Pictures from Rome"
  end

  test "404 when guide has no photos and for drafts", %{conn: conn} do
    guide = published_guide_fixture()
    assert conn |> get(~p"/g/#{guide.slug}/photos") |> response(404)

    draft = guide_fixture()
    {:ok, _} = Ethos.Guides.update_guide_photos(draft, @photos)
    assert conn |> get(~p"/g/#{draft.slug}/photos") |> response(404)
  end
end
```

- [ ] **Step 2: Verify failure.**
- [ ] **Step 3: Implement** — controller action (rescue/return 404 when `get_published_guide_by_slug!` raises for drafts: use `Repo.get_by` style — read how DestinationController does 404 and mirror it; simplest: fetch with a non-bang query and branch), ImageGallery builder:

```elixir
defp gallery_ld(guide) do
  %{
    "@context" => "https://schema.org",
    "@type" => "ImageGallery",
    "name" => "Pictures from #{destination_name(guide)} — #{guide.title}",
    "url" => url(~p"/g/#{guide.slug}/photos"),
    "image" =>
      Enum.map(guide.photos, fn p ->
        %{"@type" => "ImageObject", "name" => p["title"], "description" => p["description"],
          "contentUrl" => url(~p"/#{String.trim_leading(p["src"], "/")}"),
          "thumbnailUrl" => url(~p"/#{String.trim_leading(p["thumb"], "/")}")}
      end)
  }
end
```

(For `url(~p...)` with dynamic paths, `url(~p"/") <> String.trim_leading(p["src"], "/")` avoids verified-route warnings — pick the warning-free form.) Template: header + back link, `<div class="grid grid-cols-2 sm:grid-cols-3 gap-4">` of figures, bottom back link.

- [ ] **Step 4: Tests pass.**
- [ ] **Step 5: Commit** — `feat: photo gallery pages with ImageGallery JSON-LD`

---

### Task 4: guide teaser + sitemap

**Files:**
- Modify: `lib/ethos_web/controllers/guide_html/show.html.heex` (teaser after `</header>`), `lib/ethos_web/controllers/sitemap_controller.ex`
- Test: extend `test/ethos_web/controllers/guide_photos_page_test.exs` + sitemap test

**Interfaces:**
- Produces: teaser strip (first 4 thumbs + "See all {n} photos →" link) rendered iff `@guide.photos` non-empty; sitemap gains `/g/:slug/photos` for published guides with photos.

- [ ] **Step 1: Failing tests** — guide page shows "See all 2 photos" + a thumb + link `/g/#{slug}/photos` when photos present, and no "photos" teaser text otherwise; sitemap test (extend existing file) asserts the photos URL appears for a photo-bearing published guide and not for one without photos.
- [ ] **Step 2: Verify failure.**
- [ ] **Step 3: Implement** — teaser heex after the header block:

```heex
<section :if={(@guide.photos || []) != []} class="mt-6">
  <div class="flex items-center justify-between">
    <h2 class="font-semibold">Pictures from {@guide.destination |> String.split(",") |> List.first()}</h2>
    <.link navigate={~p"/g/#{@guide.slug}/photos"} class="text-sm underline">
      See all {length(@guide.photos)} photos →
    </.link>
  </div>
  <div class="mt-3 grid grid-cols-4 gap-2">
    <.link :for={p <- Enum.take(@guide.photos, 4)} navigate={~p"/g/#{@guide.slug}/photos"}>
      <img src={p["thumb"]} alt={p["title"]} loading="lazy" class="aspect-square w-full rounded-lg object-cover" />
    </.link>
  </div>
</section>
```

Sitemap: in the guides mapping, also emit `%{loc: url(~p"/g/#{g.slug}/photos"), lastmod: ...}` when `g.photos not in [nil, []]`.

- [ ] **Step 4: Tests pass (full suite).**
- [ ] **Step 5: Commit** — `feat: photo teaser on guides and gallery sitemap entries`

---

### Task 5: Rome seed photos

**Files:**
- Modify: `lib/ethos/seeds/rome_guide.ex`, `test/ethos/seeds/rome_guide_test.exs`

**Interfaces:**
- Produces: seed sets the 13-photo list (titles/descriptions below, canonical — transcribe verbatim); `upsert!/1` calls `Guides.update_guide_photos/2` inside its transaction; idempotent (wholesale replace).

Canonical `@photos` (src/thumb derive from label under `/photos/rome/`):

```elixir
@photos [
  %{label: "arch-of-constantine", title: "Arch of Constantine",
    description: "The triple Arch of Constantine beside the Colosseum, medallions and attic inscription in full sun."},
  %{label: "arch-of-titus-menorah-relief", title: "Arch of Titus — Spoils of Jerusalem",
    description: "The interior relief of the Arch of Titus showing the triumphal procession carrying the menorah from the Temple in Jerusalem."},
  %{label: "colosseum-exterior-arches", title: "Colosseum, looking up",
    description: "The travertine arcades of the Colosseum stacked against a blue summer sky."},
  %{label: "colosseum-hypogeum", title: "The hypogeum",
    description: "The maze of corridors and lift shafts beneath where the arena floor once stood."},
  %{label: "colosseum-interior-wide", title: "Inside the Colosseum",
    description: "Wide view from near arena level — hypogeum, seating tiers, and the outer wall in the summer haze."},
  %{label: "arch-across-the-forum", title: "Across the Forum",
    description: "A triumphal arch seen through the trees and tall grass of the Roman Forum."},
  %{label: "palatine-forum-view", title: "Over the Forum rooftops",
    description: "Looking out from the Palatine over ancient brick, pines, and the domes of the city."},
  %{label: "vittoriano-and-domes", title: "Domes and the Vittoriano",
    description: "Baroque domes in the foreground with the winged victories of the Altare della Patria behind."},
  %{label: "trevi-fountain", title: "Trevi Fountain",
    description: "Oceanus on his shell chariot, tritons and sea-horses over the travertine rockwork, in strong afternoon sun."},
  %{label: "obelisk-and-church", title: "Obelisk on the final-day walk",
    description: "A hieroglyph-covered Egyptian obelisk on its Roman base, a Baroque dome under restoration behind."},
  %{label: "santa-maria-in-trastevere", title: "Santa Maria in Trastevere",
    description: "The golden 12th-century mosaic and Romanesque bell tower of the basilica where we lit a candle."},
  %{label: "food-flatbread-lunch", title: "Side-street lunch",
    description: "Grilled stuffed flatbread with melted cheese and a pile of fresh arugula — the kind of lunch you find one street off the main drag."},
  %{label: "street-art-michelangelo", title: "MICHELANGELO",
    description: "Roman street art: Michelangelo in a Ninja Turtle mask. The Renaissance fights back."}
]
```

- [ ] **Step 1: Failing test** — extend the seed test: `length(guide.photos) == 13`, every src matches `~r{^/photos/rome/[a-z0-9-]+\.jpg$}`, second run still 13 (no dupes).
- [ ] **Step 2: Verify failure.**
- [ ] **Step 3: Implement** — build `%{"src" => "/photos/rome/#{label}.jpg", "thumb" => ".../#{label}_thumb.jpg", "title" => ..., "description" => ...}` from `@photos`; call `update_guide_photos` in the transaction after the SEO update.
- [ ] **Step 4: Tests pass (full suite + `mix ecto.reset` seeds clean).**
- [ ] **Step 5: Commit** — `feat: Rome guide photo seed`

---

### Task 6: Ship

- [ ] **Step 1:** `mix ethos.optimize_photos` against the real `images/` (13×2 JPEGs into `priv/static/photos/rome/`); sanity-check a couple of file sizes (full ≤ ~600KB, thumbs ≤ ~80KB) and that `git status` shows them as the only new files. Commit as `feat: optimized Rome trip photos`.
- [ ] **Step 2:** `mix test` + `mix format --check-formatted`; run `mix ethos.seed_rome --owner demo@ethos.example` in dev and eyeball `http://localhost:4000/g/three-days-in-rome-real-trip-guide/photos` if a server is running (optional).
- [ ] **Step 3:** Push main, `fly deploy -a ethos`.
- [ ] **Step 4:** `fly ssh console -a ethos -C "/app/bin/ethos eval 'Ethos.Release.seed_rome(\"cryptcom@gmail.com\")'"`.
- [ ] **Step 5:** Verify live: gallery 200 with captions + ImageGallery JSON-LD; teaser on the guide; sitemap contains `/photos`; one image URL returns 200 with a cache-control header.
