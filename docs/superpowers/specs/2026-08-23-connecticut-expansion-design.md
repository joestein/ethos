# Connecticut Expansion — Design

Date: 2026-08-23
Status: Draft for review (scope "~45 tourism towns + 5 new Burys" chosen by
Joe during decomposition)

## Goal

Build out the rest of Connecticut for the CT Office of Tourism audience:
50 new town guides across all 8 counties, authored as JSON seeds through
the Manhattan pipeline (`Ethos.Seeds.DataGuide`), each wired into the page
graph at authoring time, with the Burys of Connecticut collection completed
to all ten members. County hubs, badges, search, sitemap, and connected
pages all light up automatically from data — the only code changes are two
seed-module updates.

## Non-goals

- No new schema, routes, or web code (the discovery platform provides
  everything).
- No towns beyond the 50 listed (later rounds can add the remaining ~114).
- No paid-attraction affiliate integrations this round.

## Content policy (unchanged, binding)

Editorial destination-guide voice; every fact verified by the two-agent
research program (find + adversarial verify) or excluded; verdict filtering
per the content rules; honest lodging notes; Wikimedia Commons
PD/CC0/CC-BY/CC-BY-SA photos only, attributed, never hotlinked.

## 1. The 50 towns (by county — county hubs derive automatically)

- **Fairfield County (7):** Greenwich, Stamford, Norwalk, Westport,
  Ridgefield, Fairfield, Bridgeport
- **New Haven County (7):** New Haven, Guilford, Madison, Milford,
  Branford, Hamden, Meriden
- **Middlesex County (6):** Essex, Old Saybrook, Chester, East Haddam,
  Middletown, Clinton
- **New London County (8):** Mystic, Stonington, New London, Groton,
  Norwich, Old Lyme, Ledyard, Montville
- **Hartford County (7):** Hartford, West Hartford, Wethersfield,
  Farmington, New Britain, **Simsbury**, **Glastonbury**
- **Litchfield County (8):** Litchfield, Kent, **Salisbury**, **Roxbury**,
  Washington, Cornwall, Norfolk, New Milford
- **Tolland County (3):** Storrs (Mansfield), Coventry, Vernon
- **Windham County (4):** Putnam, Woodstock, Pomfret, **Canterbury**

Bolded = the five new Burys completing the ten-member collection.
Naming notes: **Mystic** is a village spanning Groton/Stonington but is the
destination travelers search — it gets its own guide (destination
"Mystic, Connecticut", county "New London County"), with `nearby` +
`shared-history` edges to Stonington and Groton; Stonington's and Groton's
guides cover their non-Mystic identities. **Storrs (Mansfield)** uses
destination "Storrs, Connecticut". Slugs: `{destination_slug}-ct-travel-guide`
(matching the CT five); all 50 derive unique slugs.

## 2. Authoring pipeline (all data, no new code)

- Seed files: `priv/seed_data/connecticut/{slug}.json`, exact same shape as
  Manhattan's, loaded by the existing `DataGuide` two-pass loader via a new
  `Ethos.Release.seed_connecticut_expansion/1` (identical to
  `seed_manhattan/1` but over the connecticut directory — the ONLY new
  function; ~8 lines).
- A Connecticut content-rules doc
  (`docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`)
  adapted from Manhattan's: the subway section becomes **"Getting there"**
  (highway corridors, Metro-North New Haven Line/branches, Shore Line
  East, Amtrak, CTrail Hartford Line — only research-verified specifics),
  place kinds unchanged, photos under `/photos/ct/{town_slug}/` (the
  existing CT photo root; the CT-5 already use it), optimized by
  `mix ethos.optimize_connecticut_photos` (a JSON-scanning variant of the
  NY task pointed at the connecticut seed dir, sourcing originals from
  git-ignored `images/connecticut/` — second new code file, ~50 lines,
  mirrors `ethos.optimize_ny_photos`).
- **Graph links authored per-file**: every seed carries a `links` array —
  `nearby` edges to adjacent covered towns (including the CT five),
  `shared-history` where research supports it (e.g. Mystic↔Stonington
  shipbuilding, Hartford↔Wethersfield colonial capitals, New London↔Groton
  whaling/submarines), and `see-also` edges to Manhattan where honest
  (Metro-North New Haven Line towns ↔ Midtown). Cross-file targets resolve
  via the two-pass seeding order plus already-seeded pages.
- **Burys collection update**: `Ethos.Seeds.BurysCollection` gains the five
  new members with blurbs (10 items total; intro updated from "five of
  them sit within a short drive" to cover the statewide ten).

## 3. Research program

Same verified two-agent pattern as Manhattan, adapted prompts (town-level:
history, getting-there by road/rail, attractions incl. state parks and
museums, food, lodging incl. inns/B&Bs — CT towns often have real inns),
run in 7 waves of 7-8 towns (~100 research agents) plus per-wave Commons
photo scouts (~14 agents). Artifacts to
`scratchpad/research/connecticut/{slug}.json` + `photos-wave{N}.json`.
Verdict filtering identical. Content authored in 7 content-wave tasks
(one per research wave), each fact-fidelity-reviewed like Manhattan.

## 4. Photos

2-3 Commons photos per town (~125 photos ≈ 250 optimized JPEGs, est.
30-60MB committed — acceptable; repo/image size noted as a growing cost,
with a future move to object storage flagged as a someday item, not this
round).

## 5. Testing & validation

- The existing `manhattan_seed_data_test.exs` pattern generalized: a
  `connecticut_seed_data_test.exs` validating all connecticut/*.json
  (structure, global place-slug ownership across BOTH seed dirs and the
  code-module CT-5 places, license allowlist, two-pass load-twice
  idempotency, photo file existence — final task flips the guard exactly
  as Manhattan's did).
- Burys collection test updated to 10 members.
- Full suite (311 at spec time) stays green throughout.

## 6. Rollout

Engineering prep (release fn + mix task + rules doc) → research waves →
content waves 1-7 → photos + final validation → final review → merge →
deploy → prod: `seed_connecticut_expansion("cryptcom@gmail.com")` +
re-run `seed_collections` (10-member Burys) + `seed_links` (prune) →
verify live (county hubs ×8, 6+ guides across regions, Burys page with 10,
graph edges, search hits for "Mystic") → push → resubmit sitemap in GSC
per the runbook.

## Global constraints

- Phoenix 1.7.14; zero AI/API calls in shipped code; content policy and
  image licensing as above; place-slug global uniqueness across all seed
  sources; photo paths `/photos/ct/{town_slug}/...` matching the existing
  regex; `mix format` clean and suite green before every commit.
