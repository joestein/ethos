# Steakhouses — Design

Date: 2026-09-06
Status: Draft for review

## Goal

A steakhouse guide for each of the cities that can sustain one, built to the
shape `korean_bbq` established: one guide per metro, the rooms as places inside
it, one flat collection. No schema change of any kind.

The candidate list is London, Manhattan, Brooklyn, Queens, the Bronx, Staten
Island, Chicago, Los Angeles, San Francisco, Seattle, Boston, Washington DC,
Baltimore and Miami. The final list comes out of a scoping wave, not out of
this document.

## Why this shape

This project was first brainstormed as nested collections with a guide per
steakhouse — roughly 180-210 guides. Two things have changed since.

**Nested collections were never built.** They remain a schema project, and
nothing else needs them urgently.

**`korean_bbq` shipped**, and it is the same problem: a themed restaurant
vertical across substantially the same cities — eight of these fourteen. It
answers the structural question with ten guides rather than two hundred, and
its answer reads truer. A guide per venue earns its keep when the venue is a
destination with genuine surroundings; you plan a day around Fenway Park or
around Vail. You do not plan one around Peter Luger. You go for dinner.

So: one guide per city, rooms as places, exactly as the sibling does.

## Non-goals

- No schema change. `restaurant` is already in the place-kind vocabulary.
- No nested collections.
- No per-restaurant photos — the sibling carries one photo per guide (§5).
- No new geography except where the scoping wave proves a city needs it (§3).

## 1. Inclusion rule

`korean_bbq` works because it has a sentence that answers every judgment call:
a grill set into the table. Steakhouse needs the same or the lists drift city
by city.

**Steak is the menu's centre of gravity, plus the beef-centric genres.**

- **In:** the American chophouse and its descendants, dry-aging temples, modern
  steakhouses — and churrascarias, Argentine parrillas, Japanese wagyu counters
  and Korean-style beef rooms where the city's beef culture runs through them.
- **Out:** a restaurant that merely serves a good steak. A brasserie with steak
  frites is not a steakhouse.

The breadth is deliberate: in Miami and Los Angeles the beef culture genuinely
is churrascaria and parrilla, and a page that excluded them would be a page
about a different city than the one that exists. The cost is that the pages are
less comparable to each other, and §2 is how that cost is contained.

## 2. Overlap with korean_bbq

The broad rule in §1 admits rooms `korean_bbq` already publishes, in eight
shared cities. **Place slugs are globally unique across every corpus**, so a
duplicate is not a style question — the second seed fails.

**The first publisher owns the place.** A steakhouse guide names such a room in
prose and carries a link to the Korean BBQ guide; it does not restate the
place. This is the pattern the Mission Bay guide already uses for the seven San
Francisco places `OracleParkPlaces` owns.

```
korean_bbq owns   /p/jongro-bbq-manhattan
steakhouse guide  prose mention + link -> /g/manhattan-korean-bbq-guide
```

One place row, two pages that both acknowledge it. The seed gate's global
uniqueness assertion is what enforces this; a researcher who restates a room
gets a failing test, not a duplicate page.

## 3. Geography

**Thirteen of the fourteen candidate cities already have tree nodes**, verified
against the roster:

| City | Node | Kind |
| --- | --- | --- |
| London | `united-kingdom/england/london` | city |
| Manhattan / Brooklyn / Queens / Bronx | `united-states/new-york/new-york-city/…` | borough |
| Chicago | `united-states/illinois/chicago` | city |
| Los Angeles / San Francisco | `united-states/california/…` | city |
| Seattle | `united-states/washington/seattle` | city |
| Boston | `united-states/massachusetts/boston` | city |
| Washington DC | `united-states/district-of-columbia/washington` | city |
| Baltimore | `united-states/maryland/baltimore` | city |
| Miami | `united-states/florida/miami` | city |

**Staten Island has no node.** It is also the city whose page viability is most
in doubt, so the scoping wave answers both questions at once: if it sustains a
page, it gets a `borough` node under `new-york-city`; if not, no node is added.

A metro that the scoping wave splits (§4) may need a node that does not exist —
Chicago's north suburbs needed `niles` when `korean_bbq` split it. Those are
added with their county and state parents, and `DataDestination.upsert!/1`
raises on a path no node owns, so a missing node fails at seed time.

## 4. Scoping wave

`korean_bbq` did not take its city list as given, and the measuring changed the
answer three times: Seattle became Puget Sound because the density is four
suburban corridors up to forty miles out; Chicago split because Lawrence
Avenue's Koreatown fell from 158 Korean businesses to 50 between 1997 and 2017
and the surviving mass is Niles and Glenview; San Francisco split because the
Bay Area's centre of gravity is Santa Clara.

One research wave measures the same way across the fourteen, and returns:

- which cities sustain a page under §1's rule,
- which should split (city plus a suburban corridor),
- which should merge or drop,
- and the count, which is an output rather than an input.

Open questions it exists to answer: does Staten Island have enough? Should the
Bronx stand alone or fold into a New York page? Is Miami the city or
Miami-Dade? Is Washington DC the District or DC plus Northern Virginia?

**No content is written until this wave reports.**

## 5. Corpus shape

One file per city at `priv/seed_data/steakhouse/{city}.json`:

```json
{
  "guide": {
    "slug": "manhattan-steakhouse-guide",
    "title": "Steakhouses in Manhattan: …",
    "destination": "Manhattan, New York",
    "destination_path": "united-states/new-york/new-york-city/manhattan",
    "tier": "guide",
    "intro": "…", "sections": [], "faq": [],
    "photos": [
      {"src": "/photos/steakhouse/manhattan/keens-dining-room.jpg",
       "thumb": "/photos/steakhouse/manhattan/keens-dining-room_thumb.jpg",
       "title": "…", "description": "…",
       "author": "…", "license": "CC BY-SA 4.0",
       "source_url": "https://commons.wikimedia.org/wiki/File:…"}
    ]
  },
  "places": [
    {"slug": "keens-steakhouse", "kind": "restaurant",
     "destination_path": "united-states/new-york/new-york-city/manhattan",
     "address": "…", "summary": "…", "history": "…", "status": "open",
     "photos": []}
  ],
  "entries": [
    {"kind": "food", "name": "Keens Steakhouse",
     "place_slug": "keens-steakhouse", "note": "…"}
  ],
  "links": [
    {"target": "guide:manhattan-korean-bbq-guide", "kind": "nearby", "note": "…"}
  ]
}
```

`restaurant` and `food` are both already in their vocabularies. Nothing is added.

**Photos follow the sibling exactly**: `korean_bbq` carries one guide photo and
zero place photos in all ten of its files. Steakhouse guides do the same — one
Commons photo per city, none per room. Wikimedia Commons PD/CC0/CC-BY/CC-BY-SA
only, attributed, never hotlinked. `priv/seed_data/steakhouse_photo_manifest.json`
and `mix ethos.optimize_steakhouse_photos` follow the per-corpus pattern; photos
live under `/photos/steakhouse/{city}/`.

A collection module `Ethos.Seeds.SteakhouseCollection` seeds one flat
collection at `/c/steakhouses`, mirroring `KoreanBbqCollection` — including its
practice of exposing `attrs/0` separately from `upsert!/0` so the seed gate can
read the module's own prose without writing to the repo.

## 6. Research and content rules

Two agents per city — one finds with evidence, one adversarially verifies —
with content authored only from `confirmed` verdicts, as every corpus since
Manhattan has done. `refuted` is excluded or corrected; `uncertain` is excluded
from places entirely.

Content rules specific to this vertical:

- **No superlatives** — "best steak in the city", "finest", "most famous".
- **No dry-aging duration** without the restaurant or a named source, and no
  claim that a programme is unique.
- **No founding date or "oldest" claim** without a source; steakhouse
  mythology is thick and frequently wrong.
- **No price points or tasting-menu costs** — they date faster than the page.
- **Closures are checked at authoring time.** Steakhouses close; `status`
  carries `open` or `closed` per place.

## 7. Gates

`test/ethos/seeds/steakhouse_seed_data_test.exs`, following the `korean_bbq`
gate:

- Every file valid, loading twice idempotently.
- **Place slugs globally unique across all corpora** — this is what enforces §2.
- Every `destination_path` resolving to a real node.
- Licence allowlist for photos, files present on disk.
- The §6 prose gates, each with a non-vacuity assertion.
- A collection test asserting membership matches the corpus.

`MIX_TEST_PARTITION` is mandatory on every test command while other worktrees
are live.

## 8. Sequencing

| Project | Work |
| --- | --- |
| A | Scoping wave. Returns the final city list, splits and drops. No content. |
| B | Foundation + content: corpus dir, seeder, collection module, photo task, gates, and the guides for whatever A returned. |

Project A is deliberately its own project. Its output changes what B builds,
and `korean_bbq` demonstrates that the measuring genuinely changes the answer.

## 9. Deployment obligation

`Ethos.Release.seed_steakhouse/1` **must be added to the numbered seed order in
`docs/runbooks/seeding.md`**, and `seed_collections` already runs last so the
collection resolves. `korean_bbq` was omitted from that list when it shipped,
and an operator following the runbook would have restored production missing
the entire corpus with nothing erroring.

## Global constraints

Phoenix 1.7.14; no AI or network calls in shipped code; place-slug global
uniqueness across every seed source; Commons licensing as in §5; `mix format`
clean and the suite green before every commit.
