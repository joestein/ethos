# Ethos — Guide Photo Galleries: Design Spec

Date: 2026-08-19
Status: Approved design, pre-implementation
Builds on: `2026-08-18-seo-affiliate-pages-design.md` (deployed; guide at
`/g/three-days-in-rome-real-trip-guide`)

## 1. Goal

Give guides a photo gallery page at `/g/:slug/photos`, cross-linked with the
guide page, seeded with the founder's 13 real Rome photos (titles and
descriptions from `images/manifest.yaml`), optimized for web delivery and
Google Images indexing. Keep the existing indexed guide URL untouched.

## 2. Data model

- `guides` new column: `photos` — jsonb list, each item
  `{"src": "/photos/rome/arch-of-constantine.jpg", "thumb": "/photos/rome/arch-of-constantine_thumb.jpg", "title": string, "description": string}`.
- No photo-editing UI in this iteration; photos are set by seeds/context
  functions. `Guides.update_guide_photos(guide, photos_list)` added for
  seeds and future UI.

## 3. Image optimization (one-time, dev-side)

- Dev mix task `mix ethos.optimize_photos`:
  - Reads `images/manifest.yaml` (file/label/name/description) and each
    `images/*.png`.
  - Writes `priv/static/photos/rome/{label}.jpg` (max edge 1600px) and
    `{label}_thumb.jpg` (max edge 480px), JPEG quality ~82, via Vix.
  - Idempotent; skips missing files with a warning.
- Outputs are committed to git (~5MB total) and ship inside the Docker
  image — durable on Fly's ephemeral disks.
- `photos` added to `EthosWeb.static_paths/0` so Plug.Static serves them
  and `mix assets.deploy`/`phx.digest` fingerprints them.
- `images/` (originals + manifest) added to `.gitignore` and stays local.

## 4. Gallery page — `GET /g/:slug/photos`

- Public controller action; guide must be published AND have non-empty
  `photos`, else 404 (no thin pages).
- Content: heading "Pictures from {Destination first segment}", subtitle
  linking the guide title; "← Back to the guide" links at top and bottom
  (to `/g/:slug`); responsive grid of `<figure>` cards — thumbnail `<img>`
  with `alt` = title, `loading="lazy"`, wrapped in a link to the full
  1600px image; `<figcaption>` shows title + description.
- SEO: `page_title` "Pictures from {Name} — {Guide title}", meta
  description, canonical URL, JSON-LD: `BreadcrumbList` (Home →
  Destinations → {Name} → {Guide} → Photos) and `ImageGallery` with
  `ImageObject` entries (name, description, contentUrl = absolute full-size
  URL, thumbnailUrl). All JSON-LD escaped with `escape: :html_safe` (same
  as existing pages).

## 5. Guide page teaser

- On `/g/:slug`, directly after the header (title/destination) and before
  the intro: a "Pictures from {Name}" strip — first 4 thumbnails (alt
  text, lazy) + "See all {count} photos →" linking to the gallery. Renders
  only when `photos` non-empty.

## 6. Sitemap

- `/g/:slug/photos` entries added for published guides with photos
  (lastmod = guide updated_at).

## 7. Rome seed

- `Ethos.Seeds.RomeGuide` gains a `@photos` list — the 13 entries with
  src/thumb paths under `/photos/rome/` and the manifest's titles and
  descriptions (founder's later corrections happen by editing the seed and
  re-running it; it remains idempotent, photos replaced wholesale).
- The two uncertain entries ship with best-guess titles (flatbread lunch;
  Flaminio Obelisk) minus the "confirm" annotations.

## 8. Testing

- Context: update_guide_photos round-trip.
- Optimize task: with a small generated PNG fixture + minimal manifest in a
  tmp dir, produces both JPEGs with bounded dimensions.
- Controller: gallery renders captions, back-links, alt text, ImageGallery
  JSON-LD; 404 for no-photos guide and for draft; teaser appears on guide
  page only when photos exist; sitemap includes the photos URL.
- Seed test: photos list length 13 with valid paths.

## 9. Rollout

1. Run `mix ethos.optimize_photos`; commit generated JPEGs.
2. Tests green, format clean → commit → push to main.
3. `fly deploy`; re-run prod seed (`Ethos.Release.seed_rome/1`) to attach
   photos to the live guide.
4. Verify live: gallery page, teaser, back-links, JSON-LD, sitemap entry;
   spot-check an image URL serves with cache headers.

## Out of scope

- Photo upload/management UI for guide owners.
- Object storage (revisit when user photos arrive).
- Lightbox JS; plain links to full-size images are v1.
