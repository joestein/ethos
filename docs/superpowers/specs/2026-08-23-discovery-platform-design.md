# Ethos Discovery Platform — Design

Date: 2026-08-23
Status: Approved in chat (design accepted by Joe; Google verification token
supplied and shipped immediately, ahead of the rest)

## Goal

Turn Ethos's pages into a navigable, searchable web: a graph knowledge base
of typed links between guides and places (the foundation for CT ↔ NYC ↔ SF
cross-linking), curated collections starting with "The Burys of
Connecticut", full-text search, a single-admin global suggestion review
queue, and the Google indexing kit. This is sub-project 1 of 2; sub-project
2 (the ~50-town Connecticut content program) builds on it and gets its own
spec.

## Non-goals

- No graph visualization UI this round (pages render their edges; a visual
  explorer can come later).
- No multi-admin roles; exactly one admin, bound to a configured email.
- No external search engine (Postgres FTS only); no AI-powered search.
- No changes to the AI pipeline; zero AI/API calls in every new feature.

## 1. Graph knowledge base — `page_links`

### Data

`page_links` table:

| Column | Type | Notes |
|---|---|---|
| `source_type` | string | `"guide"` or `"place"` |
| `source_id` | integer | id in the source table |
| `target_type` | string | `"guide"` or `"place"` |
| `target_id` | integer | |
| `kind` | string | one of `nearby`, `shared-history`, `same-region`, `see-also` |
| `note` | string | optional one-line editorial "why" (≤160 chars) |
| timestamps | utc_datetime | |

Unique index on `(source_type, source_id, target_type, target_id, kind)`;
indexes on `(source_type, source_id)` and `(target_type, target_id)`.
Self-links rejected. No FK constraints across polymorphic targets —
integrity enforced in the context (resolve-by-slug at write time) plus a
periodic-cleanup function `Links.prune_orphans/0` run at seed time.

Context `Ethos.Links`:
- `upsert_link!(%{source: {:guide, slug} | {:place, slug}, target: ..., kind:, note:})` —
  slug-resolved, idempotent by the unique index (`on_conflict` update of note).
- `links_for(node_type, node_id)` → outgoing ∪ incoming edges, each
  hydrated to `%{kind, note, other: %{type, id, slug, title, subtitle}}`
  (for guides: title + destination; for places: name + "kind · town").
  Batched (2 queries + 2 hydration queries), no N+1.
- `delete_links_for/2`, `prune_orphans/0`.

### Rendering

A **"Connected pages"** section on guide show and place show pages, after
the main content, grouped by kind with human headings: Nearby /
Shared history / Same region / See also. Each item: linked title, subtitle,
and the edge note when present. Section renders only when edges exist.

### Seeding

- Seed JSON files gain an optional top-level `"links"` array:
  `{"target": "guide:soho-manhattan-guide" | "place:central-park", "kind": "nearby", "note": "..."}`
  with the source inferred (the file's guide). `DataGuide` upserts them in
  `upsert_guide!` (after entries; slug-resolution failures raise with path).
- A backfill seed `Ethos.Seeds.BackfillLinks` (code module, data-driven
  list) connects: the CT five (Pomperaug shared history for
  Woodbury/Southbury/Middlebury; nearby chains Waterbury↔Middlebury↔
  Woodbury↔Southbury, Danbury↔Southbury), Manhattan neighborhood
  adjacencies (each neighborhood → its geographic neighbors, `nearby`),
  and cross-state `see-also` edges (Metro-North New Haven Line: Greenwich-
  area CT guides ↔ Midtown once those towns exist; for now CT five ↔
  Manhattan via "day-trip by Metro-North + I-84 corridor" notes where
  honest). Idempotent; runs from `Ethos.Release.seed_links/0`.

## 2. Collections

`collections` (slug unique, title, intro markdown, published bool) and
`collection_items` (collection_id FK delete_all, guide_id FK delete_all,
position, blurb ≤300 chars). Context `Ethos.Collections`:
`upsert_collection!/1` (slug-keyed, items replaced in a transaction),
`get_published_by_slug/1`, `list_published/0`.

Pages: `/c/{slug}` — title, intro (markdown), ordered member cards
(guide title, destination, blurb, first gallery photo thumb when present);
`CollectionPage` + `BreadcrumbList` JSON-LD; canonical; sitemap entries;
listed on `/destinations` ("Collections" section) and back-linked from
member guides via a "Part of {collection}" line under the guide header.

First collection seeded: **The Burys of Connecticut** (slug
`the-burys-of-connecticut`) with the five live -bury guides and an intro
telling the naming story; grows to ten when sub-project 2 ships Roxbury,
Canterbury, Glastonbury, Simsbury, Salisbury.

## 3. Search

Postgres full-text, English config, no extensions:

- Expression GIN indexes (migration):
  guides — `to_tsvector('english', coalesce(title,'') || ' ' || coalesce(destination,'') || ' ' || coalesce(intro,''))` (published filtered at query time);
  places — `to_tsvector('english', coalesce(name,'') || ' ' || coalesce(town,'') || ' ' || coalesce(summary,'') || ' ' || coalesce(history,''))`.
- `Ethos.Search.query(q, limit \\ 20)` → `%{guides: [...], places: [...]}`
  using `websearch_to_tsquery` + `ts_rank`, published guides only, places
  ordered rank then name. Empty/short (<2 chars) queries return empties.
- `GET /search?q=` (public): grouped results (Guides / Places) with links
  and subtitles, `noindex` meta on the search page, no JSON-LD.
- Nav search box (app layout header, GET form to /search) on all pages.

## 4. Admin review queue

- Config `:ethos, :admin_email` — runtime env `ADMIN_EMAIL`, default
  `"cryptcom@gmail.com"`. `Ethos.Accounts.admin?(user)` = email
  case-insensitive match. No DB flag; exactly one admin by construction.
- Router: `pipeline :require_admin` (after `require_authenticated_user`):
  non-admin → 404 (not 403 — don't advertise the admin surface).
- `GET /admin/suggestions`: all pending suggestions across all guides,
  newest first, each showing guide title, submitter email, place name/note,
  with Accept / Decline buttons posting to
  `POST /admin/suggestions/:id/accept|decline` — thin wrappers over the
  existing `Ethos.Contributions` accept/decline paths (credit preserved).
  Count badge of pending items. Plain controller + templates (no LiveView
  needed).
- Existing per-guide suggestion screens unchanged.

## 5. Google indexing kit (partially shipped 2026-08-23)

- SHIPPED: dynamic `/robots.txt` (Allow all + absolute `Sitemap:` URL),
  `google-site-verification` meta from `GOOGLE_SITE_VERIFICATION` env
  (secret set on Fly with Joe's token).
- Remaining in this sub-project: `docs/runbooks/google-search-console.md`
  runbook (verify property, submit sitemap, request indexing for the
  homepage + hub pages; note the URL-prefix vs Domain-property distinction
  — the meta tag verifies a URL-prefix property `https://ethosguides.com/`;
  a Domain property needs the DNS TXT record instead).
- The graph + collections work above is itself the biggest indexing lever
  (internal link density).

## Error handling

- Link upsert with unresolvable slug → raise with the offending ref (seeds
  fail loud); `links_for` on a node with dangling edges skips + logs.
- Collection upsert with unknown guide slug → raise.
- Search: `websearch_to_tsquery` is injection-safe via parameter binding;
  malformed queries return empty results, never 500.
- Admin actions on already-resolved suggestions → error flash, no crash.

## Testing

- Context tests: Links (upsert idempotency, slug resolution failure,
  union/hydration without N+1 [query-count assertion], self-link rejection,
  prune_orphans), Collections (upsert/replace idempotency, unknown slug),
  Search (rank ordering, published-only, empty/short queries, quoted
  phrases), Accounts.admin?/1.
- Controller tests: /c/{slug} (200, JSON-LD, 404 unpublished), /search
  (grouped results, noindex meta), /admin/suggestions (admin 200,
  non-admin 404, logged-out redirect, accept/decline flows + flashes),
  guide/place pages render Connected pages section, robots/meta (shipped).
- Seed tests: BackfillLinks + Burys collection idempotent; DataGuide links
  array round-trip via fixture.
- Full suite (280 at spec time) stays green.

## Global constraints

- Phoenix 1.7.14 conventions; zero AI/API calls in all new code.
- Public changesets never cast privileged fields; admin routes gated by
  email match only.
- All external URLs behind `EthosWeb.Url.safe_http?/1`; new pages carry
  canonical + JSON-LD per house pattern; search page is noindex.
- `mix format` clean, suite green before every commit.

## Build order

(1) Links schema/context + rendering + DataGuide `links` + backfill seed,
(2) Collections + Burys seed, (3) Search, (4) Admin queue, (5) runbook +
rollout (deploy, `seed_links` + collection seed in prod, verify live, push).
Sub-project 2 (Connecticut ~50 towns) follows under its own spec, authoring
`links` arrays in every new seed file.
