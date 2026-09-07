# Steakhouse Content Authoring Rules

Binding rules for every content wave in
`docs/superpowers/plans/2026-09-06-steakhouses.md` (Task 7 onward).
Read this whole file before authoring any seed JSON. Nothing here is advisory.

The vertical follows `korean_bbq`: one guide per metro, the rooms as places
inside it, one flat collection at `/c/steakhouses`. The reason that corpus
holds together is that it has a single sentence that settles every judgment
call — *a grill set into the table*. This document is the steakhouse
equivalent, plus the tests that make it stick.

## Inputs

Read all four before writing a word.

| Input | What it is |
| --- | --- |
| `priv/seed_data/steakhouse_roster.json` | Task 1's output: 11 `build`, 2 `drop`, 1 `merged-into`. The `note` on your city is the scoping reasoning; your intro and FAQ should agree with it. |
| `<session scratchpad>/steak/rooms.md` | Task 1's per-room verification artifact — one row per room with its address, its evidence and its verdict, plus the rejects and why. **The scratchpad lives outside the worktree**; the path is in your dispatch. This artifact is the room census. Do not re-derive it. |
| `priv/seed_data/korean_bbq/*.json` | The sibling corpus's actual shape. `puget-sound.json` is the file to imitate for a multi-municipality page; `manhattan.json` for the overlap pattern. |
| `test/ethos/seeds/steakhouse_seed_data_test.exs` | Task 4's gate. Every ban below is a regex in that file. Read the regexes, not just this prose. **The file does not exist until Task 4 lands**; until then §8 transcribes its patterns from Task 4's step 1 in the plan. |

Your own research wave adds evidence for the rooms Task 1 named. It does not
add rooms Task 1 did not name, and it does not restore rooms Task 1 rejected.
If a wave finds Task 1 was wrong, say so in the report and change the roster —
do not quietly widen the list.

## 1. The inclusion rule

Verbatim, and it is the rule the gate enforces:

> **Steak is the menu's centre of gravity, plus the beef-centric genres
> (churrascaria, Argentine parrilla, Japanese wagyu counter, Korean-style beef
> room). A restaurant that merely serves a good steak is out.**

The breadth is deliberate. In Miami and Los Angeles the beef culture genuinely
is churrascaria and parrilla, and a page that excluded them would describe a
different city than the one that exists.

**In — publish these:**

| Room | Why |
| --- | --- |
| Keens, 72 W 36th St | American chophouse; chops and porterhouse are the menu |
| Fogo de Chão, 661 N LaSalle Dr | Churrascaria — a named beef-centric genre |
| La Cabaña Argentina, 86-07 Northern Blvd | Argentine parrilla; the whole Queens page rests on this belt |
| Kokkaku, Belltown | Japanese wagyu counter |
| Salt + Charcoal, 171 Grand St | Japanese wagyu / yakiniku room |
| Bateau, 1040 E Union St | Whole-animal steak room; beef is the programme |
| Flat Iron, 17 Beak St | One cut, and the cut is beef |

**Out — do not publish these, and do not argue the line back open:**

| Room | Why it fails |
| --- | --- |
| Balthazar, 80 Spring St | Brasserie. Steak frites on a French menu is not a centre of gravity |
| Minetta Tavern, 113 MacDougal St | Bistro with a famous burger and a good steak. "Merely serves a good steak" is exactly this case |
| Tokyo Steak House, Queens | Hibachi. The genre admitted is the *wagyu counter*, not the teppanyaki show |
| Joe's Place, the Bronx | Puerto Rican kitchen; steak is one dish among many |
| Filippo's Italian Steakhouse, 86 Page Ave | An Italian restaurant with "steakhouse" in the name. The name is not evidence |
| Sea Shore, City Island | Seafood house |
| Rafaeli's Palace, Queens | Catering hall |
| Outback, LongHorn, Texas Roadhouse | See the chain rule below |

The name is never the evidence. Filippo's Italian Steakhouse is out and Brat
(4 Redchurch St, whole-beef over fire) is in.

### 1a. The chain-outpost rule

Carried verbatim from Task 1's artifact, where it was applied uniformly across
all fourteen cities:

> National **fine-dining** steakhouses (Capital Grille, Ruth's Chris, Morton's,
> Fleming's, Smith & Wollensky, Fogo de Chão, Mastro's, Del Frisco's) COUNT —
> they are steakhouses under the rule. National **casual** chains (Outback,
> LongHorn, Texas Roadhouse) do NOT — they are not destination rooms.

Each outpost is its own place with its own address and its own slug. Smith &
Wollensky appears in six of the eleven cities; Fogo de Chão in seven. That is
correct and expected. Write each one's summary about *that room* — its street,
its floor, its city — never a paragraph about the brand pasted into six files.

### 1b. The venue-embedded test

Carried **verbatim** from Task 1's artifact, in the form its fix round 2
settled. It must not drift:

> A room inside a larger venue counts if a reader can walk in and dine on its
> own terms — without a ticket, admission, or entry to a separate event.

**Independent public access is the whole test.** An earlier wording also
required the room to have its own street address; Task 1 retired that clause
because the address was a proxy that misfires — Gordon Ramsay Steak's 1525
Russell Street *is* the Horseshoe Casino's own address, so the conjunction
would have failed a room that plainly qualifies. Do not reintroduce the address
limb, and do not reject a room for sharing a door number with its host.

Worked, from Task 1's own rulings:

| Room | Ruling |
| --- | --- |
| Gordon Ramsay Steak, 1525 Russell St | **PASS** — a reader walks in off the casino floor and dines with no ticket, even though the address is the casino's |
| RW Prime, Resorts World, South Ozone Park | **PASS** — free entry, no ticket required |
| Bogie's Place, 25 Temple Pl, Boston | **PASS** — walk-in, on its own terms, inside jm Curley at 21 Temple Place |
| NYY Steak, Yankee Stadium | **FAIL** — behind a stadium gate on game days |
| Lobel's, Yankee Stadium | **FAIL** — same gate |
| Audi Yankees Club, Yankee Stadium | **FAIL** — same gate |

Task 1's rulings are binding; you apply the test only to a room Task 1 did not
reach. When you write a room that sits inside a larger venue, put the access
fact in the summary — "entered from the casino floor, no ticket required" — so
a later reader can see why the test was passed rather than re-litigating it.

### 1c. The gate enforces this rule

Task 4 asserts that **every published place's `summary` + `history` matches at
least one beef-evidence pattern**: `dry-aged`, `porterhouse`, `ribeye`,
`rib eye`, `strip steak`, `filet`, `t-bone`, `tomahawk`, `chophouse`,
`steakhouse`, `steak(s)`, `churrasco`, `rodizio`, `parrilla`, `wagyu`, `asado`,
`beef`.

This is not a formality to satisfy with the word "steakhouse" once. A room you
cannot describe in beef without straining is a room that fails §1. If your
summary for a parrilla reads *"a warm Argentine dining room in Elmhurst with a
tiled floor and a long bar"*, the gate fails it — and the gate is right, because
that sentence would describe an empanada shop equally well. Write what is on
the fire.

## 2. Verdict filtering

Non-negotiable, identical to every corpus since Manhattan.

- Verdict `refuted` → **excluded**, or, where the verifier supplied a
  correction, use the corrected fact and keep it. Task 1 did exactly this for
  Del Frisco's Double Eagle at 1221 Sixth Avenue: a prior claim of a 2020
  closure was refuted, corrected to open, and the room stands.
- Verdict `uncertain` → **excluded from `places` entirely.** Not softened, not
  hedged, not published with "reportedly". Alfred's Steakhouse and Sullivan's
  are both `uncertain` on post-2020 status and neither is published. Alfred's is
  a **different room** from Alexander's Steakhouse, which is counted — do not
  collapse the two.
- Items the verifier never checked → keep only where the researcher's evidence
  cites the operator's own site or 2025-2026 coverage.
- Never add a room, a date, an address or a claim that is not in the artifacts.
  Twelve verified rooms beat twenty padded ones; Boston ships twelve.

## 3. The overlap rule

**Place slugs are globally unique across every corpus.** A duplicate is not a
style question — `Places.upsert_place!/1` and the gate's cross-corpus test both
reject it, and the seed fails outright.

### The procedure, every time, before adding a room as a place

```bash
grep -rl '"slug": "the-room-slug"' priv/seed_data/
```

- **No hit** → add it to `places`, add its `entries` row, done.
- **A hit outside `priv/seed_data/steakhouse/`** → **the first publisher owns
  the place.** Your guide names the room in prose (intro, a section body, or an
  FAQ answer) and carries a `links` entry pointing at the owning guide. You do
  **not** add it to `places`, and you do **not** add an `entries` row for it —
  Task 4 asserts every entry resolves to a place defined *in the same file*, so
  a foreign `place_slug` in `entries` fails the gate. This is stricter than
  `korean_bbq/manhattan.json`, which does carry foreign entries; do not copy
  that file's entry list as a pattern.

One place row, two pages that both acknowledge it.

### The rooms this actually hits

This is Task 1's fix-round-2 overlap register, resolved to slugs and link
targets. **Fourteen rooms** across five cities are already owned and must be
prose-and-link, not restated:

| Wave city | Room | Slug already owned | Owning file | `links` target |
| --- | --- | --- | --- | --- |
| Manhattan | Keens Steakhouse | `keens-steakhouse` | `manhattan/garment-district.json` | `guide:garment-district-manhattan-guide` |
| Manhattan | Delmonico's | `delmonicos` | `manhattan/financial-district.json` | `guide:financial-district-manhattan-guide` |
| Manhattan | Old Homestead | `old-homestead-steakhouse` | `manhattan/meatpacking-district.json` | `guide:meatpacking-district-manhattan-guide` |
| Manhattan | Wolfgang's (Park Ave) | `wolfgangs-steakhouse-park-avenue` | `manhattan/murray-hill.json` | `guide:murray-hill-manhattan-guide` |
| Manhattan | COTE Korean Steakhouse | `cote-korean-steakhouse-flatiron` | `manhattan/flatiron-district.json` | `guide:flatiron-district-manhattan-guide` |
| Brooklyn | Peter Luger | `peter-luger-steak-house` | `brooklyn/south-williamsburg.json` | `guide:south-williamsburg-brooklyn-guide` |
| Brooklyn | Gage & Tollner | `gage-and-tollner` | `brooklyn/downtown-brooklyn.json` | `guide:downtown-brooklyn-brooklyn-guide` |
| Queens | Iron Age Korean Steakhouse, Rego Park | `iron-age-rego-park` | `queens/rego-park.json` | `guide:rego-park-queens-guide` |
| Chicago | Iron Age Korean Steakhouse, Wicker Park | `iron-age-wicker-park` | `korean_bbq/chicago.json` | `guide:chicago-korean-bbq-guide` |
| Chicago | Perilla Steakhouse, 225 N Wabash | `perilla-steakhouse-chicago` | `korean_bbq/chicago.json` | `guide:chicago-korean-bbq-guide` |
| Chicago | Shinhwa Korean Steakhouse | `shinhwa-korean-steakhouse-chicago` | `korean_bbq/chicago.json` | `guide:chicago-korean-bbq-guide` |
| San Francisco | Morton's, 400 Post St | `mortons-the-steakhouse-union-square` | `san_francisco/union-square.json` | `guide:union-square-san-francisco-guide` |
| San Francisco | Alexander's Steakhouse, 165 O'Farrell St | `alexanders-steakhouse-union-square` | `san_francisco/union-square.json` | `guide:union-square-san-francisco-guide` |
| San Francisco | ABSteak by Akira Back, 124 Ellis St | `absteak-union-square-san-francisco` | `san_francisco/union-square.json` | `guide:union-square-san-francisco-guide` |

**The count is fourteen, not thirteen.** Task 1's register prose says "13 of
them are rooms in this wave's census" above a table of fourteen rows. Fourteen
is right, and the per-city tallies in the artifact's own city sections prove it:
Manhattan 5 + Brooklyn 2 + Queens 1 + Chicago 3 + San Francisco 3 = 14. Every
row above was re-resolved against the corpus for this document — file, place
slug and owning guide slug all verified present.

London, the Bronx, Baltimore, Boston, Washington DC, Los Angeles, Miami, Seattle
and Staten Island have **no** overlap: the first two have corpora with no
steakhouse-shaped places in them, and the rest have no corpus of their own. You
still grep. Connecticut's steakhouses (Joseph's, J. Gilbert's, Chuck's, Michael
Jordan's Montville) are owned by the Connecticut corpus and none is in a wave
city — but they do constrain your slugs, see below.

One node caveat carried from the register: Peter Luger's owning node is
`south-williamsburg`, not `williamsburg`.

Two consequences worth stating plainly:

1. **The spec's own example is a trap.** `docs/superpowers/specs/2026-09-06-steakhouses-design.md` §5
   shows `{"slug": "keens-steakhouse", …}` inside the Manhattan `places` array.
   That is illustrative shape only — copying it ships a duplicate and fails the
   gate. Keens is prose-and-link.
2. **Manhattan loses five of its most-cited rooms from `places`, and San
   Francisco and Chicago three each.** That is the design working, not a loss.
   The intro should carry them by name with the link, and the section that would
   have held them should be honest: the rooms are published on their
   neighbourhood or Korean BBQ guides and this page points at them.

### The Korean beef room case

The fourth inclusion example, and it is larger than one room. COTE at 16 W 22nd
Street is a Korean beef room, so it is **in** under §1 — and it is published at
`cote-korean-steakhouse-flatiron` by `manhattan/flatiron-district.json`, which
`korean_bbq/manhattan.json` already references rather than restating. The
steakhouse Manhattan guide does the same thing: name it in prose, link it, and
add a second `links` entry to `guide:manhattan-korean-bbq-guide` with a note
saying why one room appears on two food verticals.

The roster note for Manhattan says the overlap is with "the korean_bbq corpus."
It is not: `korean_bbq/manhattan.json` carries `"places": []`. The owner is the
Manhattan neighbourhood corpus. Grep before you link, and link the owner.

**The same reasoning puts Chicago's Korean steakhouses in the census, and they
belong in the page.** Perilla Steakhouse (225 N Wabash), Shinhwa Korean
Steakhouse (2407 S Wentworth) and Iron Age Wicker Park (1265 N Milwaukee) all
qualify on exactly COTE's ground — Korean-style beef rooms, a genre §1 names.
Task 1's first census left them out while counting COTE, and its fix round 2
corrected that inconsistency: Chicago is **24 rooms**, not 21. The Chicago
guide names all three in prose and links `guide:chicago-korean-bbq-guide`; it
does not restate them as places, because `korean_bbq/chicago.json` owns them.
Iron Age Glenview is the north-suburbs page's room and stays there — it is not
in the city and is not yours.

Queens carries the same case in one room: Iron Age Rego Park at 61-35 Junction
Boulevard is `iron-age-rego-park`, owned by `queens/rego-park.json`, and the
Queens guide is **17 rooms** counting it. Prose and link, not a place.

### Slugs for the rooms you do own

- Kebab-case of the room's name.
- **Disambiguate any name that exists more than once anywhere.** Suffix with
  the municipality or the neighbourhood, whichever makes it unique and readable:
  - Smith & Wollensky ships in six cities →
    `smith-and-wollensky-manhattan`, `-london`, `-chicago`, `-boston`,
    `-washington-dc`, `-miami-beach`.
  - Bourbon Steak ships in three → `bourbon-steak-financial-district`,
    `bourbon-steak-georgetown`, `bourbon-steak-aventura`.
  - Chicago's Michael Jordan's Steak House cannot be
    `michael-jordans-steak-house`, because Connecticut already publishes
    `michael-jordans-steak-house-montville`; use
    `michael-jordans-steak-house-chicago`.
  - Multi-site operators within one city disambiguate by site:
    `hawksmoor-spitalfields`, `hawksmoor-borough`, `hawksmoor-guildhall`;
    `daniels-broiler-lake-union`, `daniels-broiler-leschi`;
    `medium-rare-cleveland-park`, `medium-rare-capitol-hill`.
- Never re-use a slug across waves. Grep is cheap; a failed production seed is
  not.

## 4. Geography: the guide's node and the room's node are independent

**A guide and its places need not share a destination node.** This is the
established pattern, not an exception: `korean_bbq/puget-sound.json` is one
guide whose 16 places carry **11 distinct `destination_path` values** across 11
municipalities, while the guide itself sits on
`united-states/washington/seattle`.

**Give every room the node of the municipality it is actually in. Never default
a room to the guide's node.**

Two pages in this corpus absorb neighbouring municipalities:

| Guide | Guide node | Place nodes it must use |
| --- | --- | --- |
| `los-angeles` | `united-states/california/los-angeles` | that node for the 15 City of LA rooms; `united-states/california/beverly-hills` for the 7; `united-states/california/west-hollywood` for the 2 |
| `miami` | `united-states/florida/miami` | that node for the 9 Miami rooms; `united-states/florida/miami-beach` for the 8; `united-states/florida/coral-gables` for the 2; `united-states/florida/aventura` for 1 |

Concretely: **CUT at 9500 Wilshire Boulevard carries `destination_path:
"united-states/california/beverly-hills"` even though it is published on the
Los Angeles guide.** Mastro's on N Canon Drive, Lawry's on N La Cienega,
Steak 48, Matu, Wolfgang's and Nusr-Et all do the same. BOA and Dan Tana's take
`west-hollywood`. Prime 112 and Papi Steak take `miami-beach`, not `miami`.
Carlitos Gardel at 7963 Melrose is Beverly Grove, which **is** the City of Los
Angeles — take the LA node, not `beverly-hills`, however Beverly the street
sounds.

Those five nodes are Task 3's job, and none of them exists in
`priv/seed_data/destination_tree.json` yet. If they are still missing when your
wave runs, stop and add them with their state parents rather than mis-filing a
room onto the guide's node — `DataDestination.upsert!/1` raises on an unknown
path, and the gate asserts every `destination_path` resolves.

### The Bronx merge

The roster carries `bronx` as `merged-into:manhattan`: 6 verified rooms against
a bar of 8, with a real Riverdale cluster of 3. It becomes **a note on the
Manhattan page — prose and links, no places.** Do not publish Jake's, Arnauld's,
Riverdale Steak House, Fiorentina, Willie's or Parrilla Latina as places on the
Manhattan guide. Name the Riverdale three in a paragraph and link
`guide:riverdale-bronx-guide`; link `guide:throgs-neck-bronx-guide` where the
prose names Fiorentina. Say why in the prose: six rooms is under the bar the
wave set, and the borough fails on count rather than on shape.

Staten Island and Baltimore are `drop`. No file, no node, no mention.

## 5. The seed JSON shape

Output file: `priv/seed_data/steakhouse/{roster slug}.json` — the basename must
equal the roster row's `slug`, because the gate compares the two lists.

```json
{
  "guide": {
    "slug": "{roster slug}-steakhouse-guide",
    "title": "Steakhouses in {City}: {specific hook, 4-10 words}",
    "destination": "{City} Steakhouses, {State or Country}",
    "destination_path": "{the roster row's path}",
    "tier": "guide",
    "intro": "markdown, 100-160 words",
    "sections": [{"heading": "...", "body": "markdown"}],
    "faq": [{"question": "...", "answer": "..."}],
    "photos": [
      {"src": "/photos/steakhouse/{city}/{label}.jpg",
       "thumb": "/photos/steakhouse/{city}/{label}_thumb.jpg",
       "title": "...", "description": "...",
       "author": "...", "license": "CC BY-SA 4.0",
       "source_url": "https://commons.wikimedia.org/wiki/File:..."}
    ]
  },
  "places": [
    {"slug": "...", "name": "...", "kind": "restaurant",
     "destination_path": "the room's OWN municipality node",
     "address": "...", "official_url": "... or omit",
     "summary": "1-3 sentences", "history": "optional markdown, else \"\"",
     "status": "open", "photos": []}
  ],
  "entries": [
    {"kind": "food", "name": "...", "place_slug": "...",
     "note": "1-2 sentence editorial note"}
  ],
  "links": [
    {"target": "guide:...", "kind": "see-also", "note": "..."}
  ]
}
```

Hard vocabulary, enforced by the schemas:

- Place `kind` is **`restaurant`**, always. Entry `kind` is **`food`**, always.
- Place `status` is **`open`** or **`closed`**; nothing else validates.
- Link `kind` is one of `nearby`, `shared-history`, `same-region`, `see-also`.
  The spec's example uses `nearby`; `see-also` is right for a cross-vertical
  link and `same-region` for a neighbourhood guide inside the same metro.
- `name` is **required** on a place even though the spec's §5 example omits it.
- `entries` must never be empty and every `place_slug` must be defined in the
  same file. An empty `entries` array orphans every place in the file: the seed
  and the images still pass, and the guide renders with no rooms on it. Count
  your `entries` against your `places` before you commit — they should be 1:1.

## 6. Guide content requirements

- **Intro: 100-160 words.** Lead with the count and the geography, the way
  `korean_bbq` does — *"Twenty-one rooms, and every one of them inside the city
  limits."* Name streets and corridors. Built only from verified material, never
  first-person, never a fake visit.
- **Sections: 2-4**, clustering rooms by neighbourhood or corridor, exactly the
  way `korean_bbq` clusters grills. Task 1's `note` field already names your
  clusters — use them as the section skeleton:
  - Manhattan → Midtown 34th-58th; the Financial District; the Village
  - Brooklyn → Williamsburg; the Midwood and Borough Park kosher belt; Bay Ridge; Downtown
  - Queens → the parrilla belt through Jackson Heights, Elmhurst and Corona (8 of 17); Astoria (2); seven outliers in their own neighbourhoods
  - Chicago → River North; the Gold Coast; the Loop and West Loop; the three Korean steakhouses `korean_bbq` owns, by prose and link
  - Seattle → downtown and Belltown; Capitol Hill, Ballard, Queen Anne and the lake neighbourhoods
  - Boston → Back Bay (5); the Seaport (4); Beacon Hill (1) and Downtown Crossing (2) between them
  - Washington DC → the K Street corridor; Georgetown
  - San Francisco → the Van Ness / Nob Hill spine (3); Union Square (3, all three owned elsewhere); the Financial District and Embarcadero (3); Marina, Cow Hollow, Market/SoMa, the Design District and the Mission behind them
  - London → Mayfair, Soho and the City; the multi-site operators across the boroughs
  - Los Angeles → City of LA; Beverly Hills; West Hollywood
  - Miami → Miami proper; Miami Beach and South of Fifth; Coral Gables and Aventura
- **FAQ: 4-6.** At least one must answer the scoping question the roster note
  answers — *"Why does this page cover Beverly Hills?"*, *"Why is there no
  Staten Island page?"*, *"Is this the District, or the District and Northern
  Virginia?"* At least one should state the inclusion rule in the reader's
  language, the way `korean_bbq` answers *"What makes a room a tabletop Korean
  barbecue room?"* and then names the famous places that fail it.
- **Entries: one per place, `kind: "food"`,** with a note that adds something
  the summary does not — the floor, the street, the cut, the cluster it belongs
  to.
- **British English in the London file only.** Every other file is American.

## 7. Photos

- **One photo on the guide. Zero on every place.** Verified: all ten
  `korean_bbq` files do exactly this, and Task 4 asserts both halves.
- Wikimedia Commons only, licence in the allowlist: `CC0`, `Public domain`,
  `CC BY 2.0/3.0/4.0`, `CC BY-SA 2.0/3.0/4.0`. Nothing else.
- `author`, `license` and `source_url` copied verbatim from the Commons file
  page; `source_url` **is** the file page URL and must start with
  `https://commons.wikimedia.org/`.
- **Never hotlink.** `src` and `thumb` are local paths under
  `/photos/steakhouse/{city}/`, and the gate asserts the file exists on disk
  under `priv/static/`. Record the `{label} → direct_image_url` pair in
  `priv/seed_data/steakhouse_photo_manifest.json` so
  `mix ethos.optimize_steakhouse_photos` can fetch and resize it.
- Prefer a streetscape or an exterior that carries the page's geography — the
  corridor, not a plated steak. `korean_bbq` uses the West 32nd Street canyon
  and the City of Shoreline gateway for exactly this reason.
- `description` is a real alt-text sentence describing what is in the frame,
  not a caption about the city.

## 8. The prose bans

Four bans. Each is a regex set in
`test/ethos/seeds/steakhouse_seed_data_test.exs`, run over **every** prose
field: the guide intro, every section body, every FAQ question and answer,
every place summary, every place history, and every entry note. The gate has no
allowlist and no proper-noun exemption.

**That file does not exist until Task 4 lands.** Until it does, the pattern
sets below are the authority — they are transcribed from Task 4's step 1 in
`docs/superpowers/plans/2026-09-06-steakhouses.md`, and every specimen in this
section was executed against them. Once the gate is committed, read the file
itself; if it and this section ever disagree, the file wins and this section is
the bug.

### 8a. No superlatives

Patterns: `\bbest\b`, `\bfinest\b`, `\bmost famous\b`, `\bgreatest\b`,
`\bunrivalled\b`, `\bunrivaled\b`.

**Must be caught:**

1. `"the best steak in the city"`
2. `"the finest dry-aging programme in London"`
3. `"Midtown's most famous dining room"`
4. `"the greatest porterhouse in New York"`

**Must publish:**

1. `"a James Beard award in 2019"` — an award is a fact with an awarder
2. `"placed 13th on the 2026 World's 101 ranking of steak restaurants"`
3. `"the dining room seats 180 under a stained-glass skylight"`
4. `"Michelin awarded the room one star"`

**The trap you will hit.** Nine London rooms are on the *World's 101 Best Steak
Restaurants 2026* list, and Task 1's artifact cites it by that name. **The title
contains `Best` and the gate will fail on it**, because `\bbest\b` matches
without regard to capitals or proper nouns. Do not quote the title. Write the
ranking as *"placed 13th on the 2026 World's 101 ranking of steak restaurants"*
or attribute it as *"ranked 17th by the 2026 World's 101 list"*. The same
applies to any "Best of" award name.

Two notes on those rewrites. **The rank numbers above are placeholders** — 13th
and 17th are illustrative, not facts about any particular room; take the real
placing from the artifact row. And **dropping "Best" from a real award title is
a deliberate editorial choice, not a transcription slip.** The ban is on the
word wherever it lands, and the project has decided that a paraphrased ranking
citation is a better trade than an unenforceable regex with a proper-noun
allowlist. Do not "correct" the title back in a later pass.

### 8b. No unsourced dry-aging duration, and no uniqueness claim about a programme

Patterns: `\baged (?:for )?\d+ days?\b`, `\b\d+-day dry-aged?\b`.
A hit publishes **only** if the *same field* also matches a source marker:
`according to`, `per`, `the restaurant says`, `its own`, `register`,
`landmark`.

**Must be caught:**

1. `"aged 45 days in house"` — a number with no source
2. `"a 28-day dry-aged ribeye"` — same claim, the other form
3. `"beef aged for 60 days in a glass locker by the door"`
4. `"the only in-house dry-aging programme in the city"` — the uniqueness half

**Must publish:**

1. `"aged 45 days, according to the restaurant's own menu"` — trips the pattern, spared by the source
2. `"a dry-aging room visible from the bar"` — a fact you can see, no duration
3. `"the beef hangs in a glass-fronted locker at the entrance"`
4. `"dry-aged beef, per the operator's own description of the programme"`

**Two things to note.** The source marker must sit in the **same prose field**
as the claim — the gate tests one string at a time, so a citation two paragraphs
away does not save you. And the *uniqueness* half of this ban is **not covered
by a regex**: specimen 4 above ("the only in-house dry-aging programme in the
city", or "the city's sole Himalayan salt-tiled aging room") passes the gate and
must be caught in review. Do not write it. If Task 4 is ever extended,
`\bthe only\b` and `\bsole\b` are the patterns to add.

### 8c. No founding date or "oldest" claim without a source

Patterns: `\boldest\b`, `\bsince \d{4}\b`, `\bfounded in \d{4}\b`. Same
same-field source-marker rule as 8b.

Steakhouse mythology is thick and frequently wrong — Task 1 had to reject a
"Peter Luger Bronx" that does not exist, and three Staten Island rooms that are
SEO phantoms. Assume a date is wrong until a source says otherwise.

**Must be caught:**

1. `"the oldest steakhouse in the city"`
2. `"serving chops since 1885"`
3. `"founded in 1868 by the Gallagher family"`
4. `"New York's oldest continuously operating dining room"`

**Must publish:**

1. `"the oldest continuously operating steakhouse in the borough, per the Landmarks Preservation Commission designation report"` — trips `\boldest\b`, spared by `per`
2. `"trading since 1885, according to the restaurant's own history"` — trips `\bsince 1885\b`, spared by `according to`
3. `"the room opened in the 1880s and closed for renovation in 2021"` — a decade and a modern date trip nothing
4. `"the building carries an 1885 date stone above the door"` — describes the evidence rather than asserting the claim

Specimen 3 is the cheapest way to comply: **if you cannot source the year, drop
the year.** "Reopened in 2023" for Delmonico's and "reopened 2021" for Gage &
Tollner are recent, well-covered facts and are fine; the eighteen-hundreds
founding dates for the same two rooms are the mythology and need the source in
the sentence.

### 8d. No price points or tasting-menu costs

Patterns: `\$\d`, `\bper person\b`, `\btasting menu costs\b`. Prices date faster
than the page and there is no correction workflow.

**Must be caught:**

1. `"the porterhouse is $140"`
2. `"about ninety dollars per person"`
3. `"an all-you-can-eat option runs at $100 per person"`
4. `"the tasting menu costs £95"`

**Must publish:**

1. `"opened in 1885"` — a year is not a price
2. `"the porterhouse is carved for two at the table"`
3. `"the rodizio price covers fourteen cuts carried round on skewers"`
4. `"a fixed-price chop house menu, with the cuts listed by weight"`

**A precedent that does not carry over.** `korean_bbq/manhattan.json` publishes
*"an all-you-can-eat option runs at $100 per person"* in its intro. That corpus
has no price ban; this one does. The sibling files are the model for shape,
clustering and photo policy — **not** for what may be said about money.

## 9. `status`, checked at authoring time

Steakhouses close, and they close between the research wave and the commit.

- Check every room's current status at the moment you author, not from a
  research artifact that may be days old. The operator's own site or a 2025-2026
  source.
- `status` carries `open` or `closed`. Nothing else validates.
- A room that closed but still matters to the page's story may ship with
  `status: "closed"` and prose that says so plainly — Churrascaria Plataforma's
  Tribeca site closed in 2014 while the West 49th Street room is open, and that
  is a sentence, not a reason to omit either.
- A room that is *permanently* closed and carries no story is simply excluded.
  The Palm at 837 Second Avenue and Palm Too at 840 Second Avenue are both
  permanently closed and neither ships.
- A room whose status you cannot verify is `uncertain` and is excluded by §2.
- A room that has changed hands is **one room, not two**. The Ruxton opened in
  March 2024 in the former Fleming's space at 720 Aliceanna Street; same
  address, successive tenants, one place row. Counting both is the error that
  moved Baltimore from `build` to `drop`.

## 10. Copy quality bar

Write like the `korean_bbq` guides: concrete, specific, warm but not
breathless. Facts with addresses and floor numbers, not atmosphere.

- No filler: "nestled in the heart of", "a hidden gem", "a culinary journey".
- No AI-tells: "vibrant tapestry", "boasts", "a testament to".
- No invented sensory experience. You were not there.
- Titles follow `Steakhouses in {City}: {hook}` and the hook names something
  real — "Twenty-Seven Rooms Between 34th and 58th", not "Where the Locals Eat".
- Numbers over adjectives. "Eight of the seventeen sit on one belt" beats "a
  remarkable concentration".

## 11. Before you commit

```bash
MIX_TEST_PARTITION=steak mix test test/ethos/seeds/steakhouse_seed_data_test.exs
MIX_TEST_PARTITION=steak mix test
mix format
```

Checklist, in order:

1. Every room in your file is on Task 1's list for that city, and every room on
   Task 1's list is either in your `places` or named in your prose with a link.
2. `grep -rl '"slug": "…"' priv/seed_data/` run for **every** place slug, and
   no hit outside `priv/seed_data/steakhouse/`.
3. `places` and `entries` are the same length, and every `place_slug` resolves
   inside the file.
4. Every `destination_path` is the room's **own** municipality, and every one of
   them exists in `destination_tree.json`.
5. Exactly one photo on the guide, zero on every place, licence in the
   allowlist, file on disk under `priv/static/`.
6. Intro is 100-160 words; 2-4 sections; 4-6 FAQ.
7. Your city has an item and a blurb in
   `lib/ethos/seeds/steakhouse_collection.ex` — the collection test fails a wave
   that forgets.
8. **Never run a test command without `MIX_TEST_PARTITION`.**
