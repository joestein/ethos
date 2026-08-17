# Ethos — Trip Log → Shareable Guide: Design Spec

Date: 2026-08-17
Status: Approved design, pre-implementation

## 1. Product summary

Ethos turns a traveler's raw trip knowledge into a polished, shareable guide.
The user dumps anything — notes, the social-media thread of recs they collected,
a rough day-by-day — and one AI call structures it into entries (food, tours,
walks, sights, stays, tips) with verdicts (loved / good / skip). The user
confirms and edits, publishes, and gets a fast public page whose link is the
growth mechanic: people share their guide instead of typing out recs.

Readers give back through **suggestions** pinned to a guide or to a specific
entry ("this tour is closed Mondays", "Bar X two blocks away is better"). The
owner accepts suggestions into the guide with public credit to the contributor.

### Core decisions (made during brainstorming)

| Decision | Choice |
|---|---|
| Core wedge | Trip log → shareable guide (ask/matching comes later) |
| Trip capture | Paste/dump → AI structures it; human confirms before persist |
| Give-back loop | Suggestions pinned to guides, accepted with credit |
| exa.ai roles | Place enrichment at capture + reader "Research this" button + gap-filling (tightly budgeted) |
| Launch bar | Polished, product-hunt-style launch — full feature set before public |
| Stack | Phoenix LiveView + Postgres + **Jido** agent pipeline for AI/exa work |

### Explicitly out of scope for v1

Remix/fork of guides, place-level pooled pages, follows/feeds, mobile apps,
the "ask for recs" posting flow, itinerary-anchored discovery.

## 2. Architecture

One Phoenix application (`ethos`), Postgres, deployed to Fly.io.

### Layers

- **Web layer**
  - Public guide pages (`/g/:slug`): plain controller-rendered HTML. No login
    to view. Fast, SEO-friendly, Open Graph meta + generated card image.
  - LiveViews: authoring (paste dump → confirm entries → edit → publish),
    suggestions (create/review/accept), "Research this" button.
  - Auth: `phx.gen.auth` (email + password). Required to create guides or
    suggest; never required to view.
- **Domain contexts**
  - `Ethos.Accounts` — users, auth.
  - `Ethos.Guides` — guides, entries, imports; publish lifecycle.
  - `Ethos.Contributions` — suggestions and acceptance-with-credit.
  - `Ethos.Research` — exa queries + `research_cache`; rate limiting.
- **Agent layer (Jido)**
  - `Ethos.Agents.GuideAgent` — supervised agent that runs the processing
    pipeline for an import (parse) and for publish (enrich + gap-fill).
  - Jido Actions (pure in/out; persistence via context functions):
    - `ParseDump` — one Claude call, structured output.
    - `EnrichEntries` — exa lookups per entry, cache-first.
    - `GapFill` — budgeted exa + one small Claude call, publish-time only.
  - Failed runs mark the import/guide processing state failed; retryable from
    the UI. Chosen over plain Oban jobs to leave room for future autonomous
    behaviors (e.g. a trip-research agent) without rework.
- **Integration clients**
  - `Ethos.Claude` and `Ethos.Exa`: thin Req-based HTTP modules behind
    behaviours, mocked with Mox in tests. Secrets via env:
    `ANTHROPIC_API_KEY`, `EXA_API_KEY`.

## 3. Data model

- `users` — standard `phx.gen.auth` fields.
- `guides` — `title`, `slug` (unique), `destination` (city/country text),
  `starts_on`, `ends_on`, `status` (`draft` | `published`), `user_id`,
  `view_count`, `og_image_path`.
- `entries` — `guide_id`, `day` (nullable int), `kind`
  (`food` | `tour` | `walk` | `sight` | `stay` | `tip`), `name`, `note`,
  `verdict` (`loved` | `good` | `skip`), `position`, `enrichment` (jsonb:
  official URL, address, extra links, source, fetched_at), `lat`/`lng`
  (nullable), `credited_user_id` (nullable — set when created from an accepted
  suggestion), `source` (`import` | `manual` | `suggestion` | `gap_fill`).
- `imports` — `guide_id`, `raw_text`, `status`
  (`pending` | `parsing` | `parsed` | `failed`), `error`, timestamps. Keeps
  the raw dump for retry and provenance.
- `suggestions` — `guide_id`, `entry_id` (nullable — pinned to guide or
  entry), `author_id`, `place_name`, `body`, `status`
  (`pending` | `accepted` | `declined`), `accepted_entry_id` (nullable).
- `research_cache` — `key` (normalized query, unique), `kind`
  (`enrichment` | `research` | `gap_fill`), `payload` (jsonb), `fetched_at`.
  Enrichment entries never expire; `research` entries expire after 7 days.

## 4. AI + exa pipeline

AI is used exactly twice in a guide's lifetime; all other behavior is
deterministic code. AI spend scales with guides *created*, not viewed.

### 4.1 ParseDump (one Claude call per import)

- Raw HTTP `POST https://api.anthropic.com/v1/messages` via Req (no official
  Elixir SDK).
- Model `claude-opus-5`, `output_config: {effort: "low"}` (extraction task),
  `max_tokens` sized for the entry list (~4000).
- **Structured outputs**: `output_config.format` with `type: "json_schema"`
  matching `{entries: [{day, kind, name, note, verdict}]}` and
  `additionalProperties: false` — guaranteed-parseable, no retry/parse loops.
- System prompt is frozen and carries
  `cache_control: {"type": "ephemeral"}` — every dump after the first reads
  the instructions from cache (~0.1× input price). Volatile content (the dump)
  goes in the user message only.
- Handle `stop_reason: "refusal"` and API errors explicitly: import marked
  `failed`, user offered retry or the manual entry form. **AI is never a hard
  dependency** — manual entry always works.
- Output is a *proposal* rendered in a confirm LiveView; the user edits,
  deletes, reorders; nothing persists as entries until confirmed.

### 4.2 EnrichEntries (exa, no AI)

- Per confirmed entry: one exa search for `"<name> <destination>"`; store
  official site, address, and up to 3 authoritative links in
  `entry.enrichment`.
- Cache-first against `research_cache` keyed by normalized `name + city`;
  cached forever. A place mentioned in 50 guides costs one exa call total.
- Failure degrades silently (entry just lacks enrichment); a retry job
  backfills.

### 4.3 GapFill (publish-time, hard-budgeted)

- Runs once at publish; manual re-run only.
- Budget: max 3 exa neighborhood/destination queries + **one** Claude call
  (same model, `effort: "low"`, structured output) selecting and phrasing up
  to 5 "nearby ideas" the author didn't mention.
- Results appear to the owner as acceptable suggestions (`source: gap_fill`);
  never auto-published to readers.

### 4.4 "Research this" (reader-side, no AI)

- Button on each entry for logged-in readers: one exa call for fresh info
  (still open? hours? recent reviews), cached 7 days in `research_cache`.
- Rate-limited: 10 research calls per user per hour.

## 5. Sharing & virality

- Public guide URL `/g/:slug`; view requires no account.
- **OG card**: at publish, render an SVG template (destination, title, entry
  count, author) to PNG, stored and referenced in `og:image`. Links pasted
  into chat apps and social are the growth channel — the card is worth the
  polish budget.
- Reader CTAs on every guide: "Suggest a place" (signup driver) and "Make
  your own guide" (creation driver).
- Accepted suggestions render "added from a suggestion by @name" — public
  credit is the contributor's payoff.
- Author publish flow ends on a share screen: link + card preview.

## 6. Error handling summary

| Failure | Behavior |
|---|---|
| Claude parse error / refusal | Import `failed`; retry button + manual entry fallback |
| exa enrichment error | Silent degrade; backfill retry job |
| GapFill error | Guide publishes anyway; gap-fill section absent |
| Research button error | Inline "couldn't fetch" message; no cache write |
| Agent crash | Supervised restart; import status reflects failure, retryable |

## 7. Testing

- `Ethos.Claude` / `Ethos.Exa` behaviours mocked with Mox.
- ExUnit tests per context (Guides, Contributions, Research incl. cache TTL
  and rate limiting).
- One test per Jido action with canned API fixtures (parse proposal shape,
  enrichment merge, gap-fill budget enforcement).
- LiveView tests for paste → confirm → publish and suggest → accept flows.
- Controller test for the public guide page incl. OG meta.

## 8. Launch checklist (v1 = polished public launch)

- Dump → confirm → guide → publish flow, manual entry fallback.
- Enrichment, gap-fill, Research button (all three exa roles).
- Suggestions with accept-and-credit.
- OG cards, landing page with an example guide, onboarding copy.
- Auth, rate limiting, error states styled.
- Deployed on Fly.io with a real domain; secrets configured.
