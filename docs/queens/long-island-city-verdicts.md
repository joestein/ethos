# Long Island City, Queens — VERIFIER verdicts

**Role:** Independent verifier. Every claim in `long-island-city-finder.md` is adjudicated below as
`confirmed`, `refuted` or `uncertain`. I re-fetched the finder's cited URLs myself and re-quoted the
sources. I did not defer to the finder's reasoning.

**Date of verification:** 2026-09-01
**Verification method:** raw `urllib` fetches with gzip decoding and `<title>` verification (stored in
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/licverify_jsv/`);
all seven LPC designation PDFs downloaded from `s-media.nyc.gov` and extracted with `pdftotext -layout`;
`parks.ny.gov`, `queenslibrary.org` and `momaps1.org/en/about` re-read through a second, independent
client after my direct client was rejected or blocked.

**Verdict scheme.** I deliberately do NOT treat "the aggregator really does say this" as confirmation.
- `confirmed` — a **primary/authoritative** source (LPC, NYC Parks, NYC DOT, NYC Ferry, or the
  institution's own site) says it, and I re-quoted that source myself.
- `uncertain` — the finder's quote is **accurate** but the only source is Wikipedia or another
  aggregator, or is second-hand. The transcription is fine; the underlying fact is unverified.
- `refuted` — the source does not say what is claimed, or better evidence contradicts it.

---

## 0. Headline finding on the finder's reliability

**I could not find a single fabricated quote.** I string-matched all sixteen LP-0450 claims, all
LP-0925 claims, and the load-bearing spans of LP-1304, LP-1653, LP-2200, LP-2570 and LP-0828 against
the actual PDF text, and all twenty-two aggregator quotes I tested against the live Wikipedia article.
Every one matched, including the OCR corruption the finder flagged (`goverrnnent`, `far $100,000`,
`B~CH`, `nee-English`) and including NYC DOT's genuine misspelling `Hornbosted`.

**This is not a reason to relax.** The finder's weakness is not invention, it is **tier**: 45 of 112
claims rest on Wikipedia alone and are adjudicated `uncertain` below regardless of how plausible they
read. The finder labelled these honestly, which is why the file is usable at all.

**Three of the finder's own cautions are wrong in the author's favour** — it declared three addresses
uncapturable that are in fact published on the very pages it fetched. See §3.

---

## 1. HEADLINE COUNT

| Metric | Count |
|---|---|
| **Claims adjudicated** | **128** (112 facts F1–F112 + 16 assignment entries J1–J16) |
| **Confirmed** | **73** (63 facts verified to a primary source + 10 assignment rulings resolved) |
| **Refuted** | **4** |
| **Uncertain** | **51** (45 aggregator-only or second-hand facts + 6 assignments left genuinely open) |
| **Places surviving as publishable** | **24 with a verified street address** (+1 held pending arbitration) |

---

## 2. NEIGHBOURHOOD ASSIGNMENT — the rulings the author and arbitrator depend on

### 2.1 The two marquee institutions

#### Astoria Park — NOT CLAIMED BY THIS FILE. No conflict to arbitrate.
The LIC finder never proposes Astoria Park as an LIC place. It appears exactly once in the whole file,
**inside a quotation** from NYC Parks' Hallets Cove Playground page, which I re-fetched and confirmed
verbatim:

> "In a project completed in portions in 2013, the Queens East River and North Shore Greenway linked
> this playground to other Queens waterfront parks to the north and south, including **Astoria Park**,
> Queensbridge Park, Rainey Park, Socrates Sculpture Park, and Ralph DeMarco Park."
> — https://www.nycgovparks.org/parks/hallets-cove-playground/history

**Ruling: `confirmed` as a quotation only.** Astoria Park is named as a *neighbouring* park on a shared
greenway, not as an LIC place. The author may reproduce this sentence but **must not** create an Astoria
Park entry. No marquee collision exists here.

#### Socrates Sculpture Park — **CONTESTED. DO NOT PUBLISH IN THE LIC FILE WITHOUT ARBITRATION.**
Exact street address, verified by me on the institution's own site:
**`32-01 Vernon Boulevard, Long Island City, NY 11106`**

Evidence placing it in **Long Island City**:
- The park's own website, verbatim: "32-01 Vernon Boulevard, Long Island City, NY 11106" —
  https://socratessculpturepark.org/about/
- NYC Parks data fields, verbatim: "Zip Code: 11106 / Community Board: 1 / Park ID: Q465 / Acreage: 6.28"
- Wikipedia's own infobox Location field, verbatim: "32-01 Vernon Boulevard, Long Island City , NY 11106"
- Wikipedia categorises the article under **both** "Astoria, Queens" **and** "Long Island City".

Evidence placing it in **Astoria**:
- Wikipedia prose, verbatim: "It is located one block from the Noguchi Museum at the intersection of
  Broadway and Vernon Boulevard **in the neighborhood of Astoria , Queens** , New York City."
- Wikipedia's Astoria navbox lists Socrates Sculpture Park under "Astoria … Parks".
- NYC Parks sign text, three Astoria-inflected passages, all re-confirmed verbatim by me.

**My ruling on the NYC Parks passages: they are NOT neighbourhood assignments, and the finder was right
to record them but the Ditmars-Steinway verifier over-read them.** Read exactly, they say the 17th–18th
century *strait* lay "between Astoria and Wards Island"; that the vista was "inaccessible to citizens of
**Astoria and Long Island City**" — naming both neighbourhoods symmetrically; and that the name honours
"the people of Astoria, New York's largest Greek community" — an explanation of the *Greek* name, not a
location. **None of the three states where the park is.**

**On the balance of evidence the better-evidenced assignment is Long Island City**, because the only
unambiguous locational statements — the institution's own published address, the City's ZIP field, and
Wikipedia's own infobox — all say Long Island City, and the single explicit "in the neighborhood of
Astoria" sentence is aggregator prose contradicted by the infobox directly above it.

**⚠ COLLISION WARNING — THE ARBITRATOR MUST RESOLVE THIS.** The Ditmars-Steinway verdicts file
(`docs/queens/ditmars-steinway-verdicts.md`) has already ruled, verbatim: *"Astoria (prose) vs LIC
(postal); Astoria better evidenced. NOT Ditmars-Steinway"*, and instructs *"Do not take Astoria Park,
Astoria Pool, or Socrates Sculpture Park."* That file steers Socrates toward **Astoria**; my reading of
the same sources steers it toward **Long Island City**. Since a marquee institution may appear in
**exactly one** file corpus-wide, **the LIC author must not publish Socrates Sculpture Park until the
arbitrator rules.** Verdict recorded as `uncertain` — not because the evidence is thin, but because two
verifiers reading the same sources disagree and double-publication is the failure mode that matters.

### 2.2 Assignments I resolve

| # | Place | Exact street address | Ruling | Basis (re-quoted by me) |
|---|---|---|---|---|
| J2 | **The Noguchi Museum** | `9-01 33rd Road (at Vernon Boulevard), Long Island City, New York 11106` | **Long Island City — `refuted` as contested** | Own site: "**Located in Long Island City, Queens**". Wikipedia agrees: "a museum and sculpture garden at 32-37 Vernon Boulevard in the **Long Island City** neighborhood of Queens". Both sources agree; there is no conflict. The finder's Section J flag rested on the museum's *ferry directions* naming the Astoria landing — that is a travel instruction, not a neighbourhood assignment. **Note two published address forms:** the museum publishes `9-01 33rd Road`; Wikipedia publishes `32-37 Vernon Boulevard` (which the museum's own archive caption uses for Noguchi's **studio**). Prefer the museum's own form. |
| J3 | **Rainey Park** | No street address published; NYC Parks gives Park ID `Q048`, **Zip 11106, Community Board 1, Acreage 8.09** | **Long Island City** | NYC Parks, verbatim: "The project backed by citizens of **Long Island City**"; namesake "Dr. Thomas Rainey (1824-1910), **a resident of Ravenswood**". Title-verified as "Rainey Park Highlights : NYC Parks" on my own independent fetch — **the finder's wrong-page warning did not reproduce for me.** The Greenway sentence lists it among waterfront parks, which is not an assignment. **The finder omitted this park's ZIP/CB/acreage entirely; I supply them.** |
| J4 | **Ravenswood Playground** | No street address; `Zip 11106 / CB 1 / Q333 / Acreage 2.76` | **Long Island City** | NYC Parks states it outright: named after "Ravenswood, **the shoreside Long Island City neighborhood in which it resides**". |
| J5 | **Ravenswood (sub-neighbourhood)** | n/a | **Absorbed into Long Island City** | LPC primary, verbatim: "the once rural **Ravenswood area of Queens (now Long Island City}**" — LP-1304. Primary and explicit. |
| J8 | **Museum of the Moving Image** | `36-01 35 Ave, Astoria, NY 11106` | **ASTORIA — `refuted` for LIC** | Its own site publishes an **Astoria** address and heads its navigation "Getting to & Exploring Astoria". **Must not appear in the LIC file.** |
| J10 | **Silvercup "North" lot** | `295 Locust Avenue, Bronx, New York 10454` | **The BRONX — `refuted` for Astoria** | Company's own site. The popular "Silvercup North is in Astoria" attribution is wrong. |
| J12 | **Van Alst Playground** | No street address; "bounded by 14th and 21st Streets and 29th and 30th Avenues"; `Zip 11102 / CB 1` | **ASTORIA** | NYC Parks states it outright: "Van Alst Playground **is located in Astoria**". Boundary marker on the Astoria side. Not an LIC place despite its LIC-surveyor namesake. |
| J13 | **Hallets Cove Playground** | No street address; `Zip 11102 / CB 1 / Q321` | **ASTORIA** | NYC Parks: "Hallets Point was initially the commercial center of **Astoria**"; originally named "Astoria Houses Playground". Not an LIC place. |
| J14 | **Dutch Kills** | `Zip 11101, 11106` (per Dutch Kills Playground) | **A sub-area of Long Island City** | NYC Parks, verbatim: "Dutch Kills joined Astoria Village, Hunter's Point, Ravenswood, Middletown, and Blissville (now Sunnyside) **to form Long Island City in 1870**". |
| J16 | **LIC community district** | n/a | **CD 1 *and* CD 2 — the wave brief is `refuted`** | See §4. |

### 2.3 Assignments that stay open

| # | Place | Why it stays `uncertain` |
|---|---|---|
| J1 | Socrates Sculpture Park | Verifier-vs-verifier collision. See §2.1. |
| J6 | Ravenswood Generating Station | Aggregator says "in Long Island City"; operator's site unreachable to me as well. **The finder's "38-54 Vernon Blvd" is unverified — do not publish a street number.** |
| J7 | Queensbridge Park / Houses | NYC Parks assigns the park to **both** boards, verbatim "Community Board: 1, 2". Genuinely straddles. |
| J9 | Greater Astoria Historical Society | **See §3 — it publishes a PO Box, not a street address.** |
| J11 | Frank Sinatra School of the Arts | Aggregator-only on both sides; not re-sourced. |
| J15 | Blissville | NYC Parks writes "**Blissville (now Sunnyside)**" — confirmed verbatim — while Wikipedia makes them separate places inside LIC. Irreconcilable from the sources fetched. |

### 2.4 ⚠ Community Board is NOT a neighbourhood discriminator in this wave

Both the finder and the Ditmars-Steinway verifier lean on "Community Board: 1" as if it distinguished
Astoria from LIC. **It does not.** Wikipedia's own LIC article, verbatim:

> "The entirety of Queens Community Board 1, which comprises **northern Long Island City and Astoria**…"

CB 1 covers **both** neighbourhoods. That is precisely why Socrates (CB 1, 11106), Rainey Park (CB 1,
11106) and Ravenswood Playground (CB 1, 11106) sit in the ambiguous band while Van Alst and Hallets Cove
(CB 1, **11102**) are firmly Astoria. **The ZIP separates them; the community board does not.** Any
argument in the arbitration note that rests on CB 1 is non-probative and should be discarded.

---

## 3. PUBLISHABLE STREET ADDRESSES — including three the finder wrongly said were unavailable

### 3.1 `refuted` — addresses the finder said it could not capture, which ARE published

| Place | Finder said | **Actual published address, re-quoted by me** |
|---|---|---|
| **New York Irish Center** | "Street number not captured — only 'our building on Jackson Avenue'. **Do not invent a number.**" | **`1040 Jackson Avenue, Long Island City, NY 11101`** — on the very page the finder fetched (https://www.newyorkirishcenter.org/mission-2), immediately below the mission text: "1040 Jackson Avenue Long Island City, NY 11101 ( One stop from Grand Central on the 7 train.) (718) 482-0909". **Publishable.** |
| **Court Square Diner** | "No street address was captured in the fetched text — do not invent one." | **`45-30 23rd St, Long Island City, NY 11101`** — published in the page `<title>` and again in the page footer: "45-30 23rd St, Long Island City, NY 11101". **Publishable.** |
| **Greater Astoria Historical Society** | "Not captured" | **`PO Box 3445, Long Island City NY 11103-0445`** — https://astorialic.org/contact/, verbatim: "Address: Greater Astoria Historical Society PO Box 3445 Long Island City NY 11103-0445 Hours: **By Appointment**". **This is a PO Box, NOT a street address — it is not a visitable location and must not be presented as one.** Note the ZIP 11103 is an Astoria ZIP even though the line reads "Long Island City". |

### 3.2 The 24 places that survive as publishable

Each has a street address I re-quoted from a primary source **and** an LIC assignment.

| # | Place | Exact address string | Source tier |
|---|---|---|---|
| 1 | MoMA PS1 | `22-25 Jackson Avenue, Queens, NY 11101` | own site (primary) |
| 2 | The Noguchi Museum | `9-01 33rd Road (at Vernon Boulevard), Long Island City, New York 11106` | own site (primary) |
| 3 | SculptureCenter | `44–19 Purves Street, Long Island City, NY 11101` | own site (primary) |
| 4 | Gantry Plaza State Park | `4-44 47th Road, Long Island City, NY 11101` | NY State Parks (primary) |
| 5 | Hunter's Point South Park | `Center Blvd. bet. 50 Ave. and 2 St.` | NYC Parks (primary) |
| 6 | Andrews Grove / Andrews Playground | `intersection of 49th Avenue, 5th Street, and Vernon Boulevard` | NYC Parks (primary) |
| 7 | Hunters Point Historic District | `45th Avenue between 21st and 23rd Streets` | LPC LP-0450 |
| 8 | NYS Supreme Court, Queens Co., LIC Branch | `25-10 Court Square` | LPC LP-0925 |
| 9 | New York Architectural Terra Cotta Works Building | `42-10 -- 42-16 Vernon Boulevard` | LPC LP-1304 |
| 10 | Pepsi-Cola Sign | `4-09 47th Road` | LPC LP-1653 |
| 11 | Fire Engine Co. 258 / Hook & Ladder 115 | `10-40 47th Avenue (aka 10-38 to 10-40 47th Avenue)` | LPC LP-2200 |
| 12 | Bank of the Manhattan Company Building | `29-27 Queens Plaza North (aka 29-27 41st Avenue, 29-39 Northern Blvd)` | LPC LP-2570 |
| 13 | Ed Koch Queensboro Bridge | `11th Street and Bridge Plaza North and Bridge Plaza South` | LPC LP-0828 |
| 14 | Silvercup Studios — Main Lot | `42-22 22nd Street, Long Island City, New York 11101` | own site (primary) |
| 15 | Silvercup Studios — East Lot | `34-02 Starr Avenue, Long Island City, New York 11101` | own site (primary) |
| 16 | New York Irish Center | `1040 Jackson Avenue, Long Island City, NY 11101` | own site (primary) |
| 17 | Long Island City Library (QPL) | `37-44 21 Street, Long Island City, NY 11101` | QPL (primary) |
| 18 | Court Square Diner | `45-30 23rd St, Long Island City, NY 11101` | own site (primary) |
| 19 | Queensbridge Park | no street address; `Zip 11101 / CB 1, 2 / Q104 / 20.86 ac` | NYC Parks (primary) |
| 20 | Rainey Park | no street address; `Zip 11106 / CB 1 / Q048 / 8.09 ac` | NYC Parks (primary) |
| 21 | Murray Playground | no street address; `Zip 11101 / CB 2 / Q141` | NYC Parks (primary) |
| 22 | Dutch Kills Playground | no street address; `Zip 11101, 11106 / CB 1 / Q218 / 2.40 ac` | NYC Parks (primary) |
| 23 | Notorious LIC Park (Bridge and Tunnel Park) | no street address; `Zip 11101 / CB 2 / Q360U / 0.32 ac` | NYC Parks (primary) |
| 24 | Ravenswood Playground | no street address; `Zip 11106 / CB 1 / Q333 / 2.76 ac` | NYC Parks (primary) |

**Held pending arbitration (would be #25):** Socrates Sculpture Park, `32-01 Vernon Boulevard, Long
Island City, NY 11106`.

### 3.3 Places with NO publishable street address — name them in prose only, or not at all

- **M. Wells** — own site gives only "Long Island City, NY 11101" and a phone number. `confirmed` that
  no street address is published. **Also: the page does not establish which of "the Diner, the Dinette,
  the Steakhouse and the Mothership" are currently open. Do not assert any of them is operating.**
- **Culture Lab LIC** — no address in the fetched text; I did not re-fetch. `uncertain`.
- **Greater Astoria Historical Society** — PO Box only (§3.1).
- **Ravenswood Generating Station** — address unverified. **Do not publish a street number.**
- **Hunters Point Community Library** — the striking `47-40 Center Boulevard` address is
  **aggregator-only**; the finder's QPL fetch returned only site chrome and mine was rejected outright
  ("Request Rejected"). `uncertain` — ship only with attribution to Wikipedia, or omit.

---

## 4. The wave brief is wrong about Long Island City — `REFUTED`

The brief states Astoria, Ditmars-Steinway and LIC "all sit in Queens Community District 1." For LIC
this is false, and the finder was right to flag it. Confirmed verbatim from Wikipedia:

> "Long Island City is **split between Queens Community Board 1 to the north of Queens Plaza and Queens
> Community Board 2 south of Queens Plaza**."

and independently corroborated by the City itself — I re-read all seven NYC Parks data blocks:

| Park | Community Board |
|---|---|
| Hunter's Point South Park | **2** |
| Andrews Grove | **2** |
| Murray Playground | **2** |
| Notorious LIC Park | **2** |
| Socrates Sculpture Park | 1 |
| Ravenswood Playground | 1 |
| Dutch Kills Playground | 1 |
| Rainey Park | 1 |
| **Queensbridge Park** | **1, 2** (both) |

**Ruling: `confirmed` that LIC spans CD 1 and CD 2. The brief's premise is `refuted`.** Hunters Point,
the courthouse, the Pepsi sign, the firehouse and Gantry Plaza — the neighbourhood's entire marquee
core — are in **CD 2**, not CD 1.

---

## 5. DOHMH / DCWP SOURCING DISCLOSURE — `confirmed`, and it is clean

The finder states it consulted **no** DOHMH or DCWP inspection dataset. Nothing in the file contradicts
this: every business claim traces to a company website or to Wikipedia, and no inspection-record fields
(violation codes, grades, CAMIS/licence numbers) appear anywhere.

**Ruling: NO business in this file is DOHMH/DCWP-only sourced. The "existence and address may be
published but nothing may appear in prose" restriction is therefore NOT triggered for any LIC place.**

The two businesses sourced to their own sites — **Court Square Diner** and **M. Wells** — may be written
about in prose, attributed to the business's own website. Every other business (Wonton Foods, Brooks
Brothers, Troma, Jim Henson Company, Brooklyn Grange, JetBlue, Standard Motor Products) is
**aggregator-only** and must be re-sourced before any prose is written about it. Silvercup Studios is
the exception: its own site is primary and its two LIC addresses are `confirmed`.

---

## 6. SINGLE-SOURCED CLAIMS — what may ship, and how

**45 of 112 facts rest on Wikipedia alone.** All are `uncertain`. They fall into two groups.

### 6.1 May ship WITH explicit attribution (low-harm, non-superlative, non-numeric)
F1 boundaries · F3 ZIP list · F4 postal station · F6 precinct · F8 constituent villages · F9 1870
incorporation · F12 population at incorporation · F17 coat of arms · F18 the Astoria secession petition
· F20 1898 consolidation · F21 Newtown seat · F45–F46 Blissville · F48 Dutch Kills in the Revolution ·
F50–F52 20th-century decline and rezoning · F54 the BID · F89 bakery-to-studio lineage · F98 closed
Court Square branch · F100 Court Square complex history · F102 LIRR · F105 roads.
Phrase as "according to Wikipedia" or re-source. **Do not state as fact in the museum's own voice.**

### 6.2 MUST NOT ship without re-sourcing — superlatives, money, courts, and volatile numbers
- **F53 Amazon HQ2** — high-salience corporate/political history, aggregator-only.
- **F55 Asian population "fivefold since 2010… 34%"** — an aggregator's summary of a **paywalled NYT
  article**. Numbers unverified. **Do not publish the figures.**
- **F57 Hunters Point Historic District: 47 townhouses vs 19 contributing buildings** — both aggregator,
  irreconcilable. **Publish no count.**
- **F74 5 Pointz $6.75 million VARA judgment** — a **court decision** cited to an encyclopedia. Source it
  to the ruling or omit.
- **F91 Queensbridge Houses "largest in the Western Hemisphere" vs "largest in North America"** — the
  same article contradicts itself. **Publish neither superlative.**
- **F91 hip-hop heritage (Marley Marl, MC Shan, Mobb Deep, Nas, Roxanne Shanté)** — the strongest
  visitor-interest thread in LIC and it is aggregator-only. Re-source before use.
- **F94 tall buildings** — heights and "tallest in the borough" rankings are volatile and internally
  inconsistent. Treat all as unverified.
- **F96 Hunters Point Community Library** — architecture, cost, artists, criticism: all aggregator-only.
- **F99 subway / F101 buses** — **mta.info returned 403 to the finder and I did not obtain it either.
  There is NO primary transit source in this corpus.** Partial corroboration exists only from the
  Noguchi Museum's and QPL's own directions pages.
- **F107 "only non-tolled automotive route"** — a superlative likely invalidated by congestion pricing.
- **F92 Ravenswood Generating Station** — aggregator-only; operator's site unreachable.
- **F70 SculptureCenter's 1928 founding, "former trolley repair shop", Maya Lin 2002 renovation, and
  "New York City's only non-profit exhibition space"** — all aggregator-only. **Only the address is
  `confirmed`.**
- **F67 MoMA PS1 "oldest and second-largest non-profit arts center in the United States"** —
  aggregator-only superlative. The museum's own About page, which I read directly, does **not** make
  this claim. Omit it.

### 6.3 `confirmed` upgrades — second-hand quotes I promoted to first-hand
The finder flagged these as second-hand and asked me to re-read them. I did, through an independent
client, and **all are confirmed verbatim**:
- **Gantry Plaza State Park** (finder blocked by HTTP 403): address `4-44 47th Road, Long Island City,
  NY 11101`, "a 12-acre riverside oasis", and both the gantry and skyline sentences. **Now primary.**
- **MoMA PS1 `/en/about`** (finder used a summarising tool): the 1976 *Rooms* exhibition, "a historic
  nineteenth-century public school building", "Decommissioned as a public school in 1963", the 2000 MoMA
  affiliation, Warm Up (1998) and the Young Architects Program (1999–2019) are **all** on the page.
- **QPL Long Island City branch**: `37-44 21 Street, Long Island City, NY 11101`, (718) 752-3700, and
  the full hours table. Note the primary form really is "21 Street", not "21st Street".

---

## 7. Cross-source discrepancies — adjudicated

All eighteen Section K discrepancies are **real**; I reproduced each from the sources. Rulings:

| K# | Discrepancy | Ruling |
|---|---|---|
| 1 | LIC incorporation May 4 (Wikipedia) vs **May 6** (LP-0925) | **Prefer LPC.** Verbatim: "on **May 6** of that year incorporation of the area as a township was approved by the state legislature." Note LPC also says **township**, not city. |
| 2 | "A.D. Ditmars" vs "Abram D. Ditmars" | **Prefer LPC's "Abram D. Ditmars"** (primary). Same surname as the adjacent neighbourhood — relevant to this wave. |
| 3 | Name origin: Levi Hayden 1853 / "Long Island City Star" / "Long Island Star" | **All three confirmed verbatim; all three are genuinely in the sources.** LP-0925 contains *both* the Hayden and "Long Island Star" accounts; NYC Parks' Van Alst page has "the **Long Island City Star**". **Unresolved — present as competing accounts or omit.** |
| 4 | 47 townhouses vs 19 contributing buildings | Both aggregator. **Publish no count.** |
| 5 | Clocktower "1925-27" vs "1927" | **Prefer LPC "Built 1925-27"** (confirmed in the PDF header). "Queens' first skyscraper" is aggregator-only. |
| 6 | Queensboro Bridge: **March 30, 1909** (LPC) vs **June 18, 1909** (DOT); 3,725 ft vs "over 7,000 feet"; Hornbostel vs Hornbosted; three designation dates | **All confirmed verbatim on both sides — two City agencies genuinely disagree.** The length conflict *is* reconcilable: DOT's own "Total length including the approaches: **7,449 feet**" matches LPC's "over 7,000 feet". **The opening date is not reconcilable — publish neither, or publish both with attribution.** LPC's "Hornbostel" is the correct spelling; DOT's "Hornbosted" is an error on the City's page. |
| 7 | Hunter's Point South Park: 22.81 / "10-acre" / 11 acres | **Confirmed three ways, including 22.81 and "10-acre" on the same NYC Parks page.** Publish no acreage. |
| 8 | Andrews Grove: 2.542 acres (prose) vs 0.52 (data field) | **Confirmed, same page.** Publish no acreage. |
| 9 | "in 1848 by condemnation for the Pulaski Bridge approach" | **Confirmed verbatim — the City's sign really says 1848.** Chronologically impossible; almost certainly 1948. **Do not repeat the date.** |
| 10 | Queensbridge Houses superlative | Self-contradictory. Publish neither. |
| 11 | NYC Ferry ZIP 10044 | **Confirmed verbatim, twice**: the Roosevelt Island landing is labelled "Long Island City, NY 10044" *and* the LIC landing at "46th Avenue and Center Boulevard" is given "10044". **Both are operator errors. Never propagate ZIP 10044 for LIC.** |
| 12 | Where the LIC ferry stop is | Operator's current page is authoritative: **`46th Avenue and Center Boulevard`**. The Hunters Point South / Gantry Plaza descriptions are aggregator and stale. |
| 13 | LP-0925 "Newtown and Astoria" | **Confirmed verbatim.** Conflicts with the standard account; the LPC sentence is loose. Prefer the standard account, do not quote this line. |
| 14 | "only major manufacturer" (LPC) vs "sole manufacturer" (aggregator) | **Use LPC's "New York's only major manufacturer".** "Sole" overstates it. |
| 15 | "Murray Park" vs "Murray Playground" | NYC Parks has **one** park, `Murray Playground`, Q141. Use that name. |
| 16 | "Notorious LIC Park" vs "Bridge and Tunnel Park" | **Confirmed:** the page `<title>` really is "Notorious LIC Park Highlights : NYC Parks" while the sign body says "Bridge and Tunnel Park" and the slug stays `bridge-and-tunnel-park`. Reason unexplained. **Do not guess why.** |
| 17 | Noguchi building: "repurposed 1920s industrial building" vs "photo-engraving plant" | Prefer the museum's own wording. |
| 18 | Silvercup square footage doesn't reconcile | **Confirmed** on the company's own page. Publish no totals. |

---

## 8. Warnings the author must read before writing a word

1. **Do not publish Socrates Sculpture Park until the arbitrator rules.** Two verifiers reading the same
   sources reached opposite conclusions; it may appear in exactly one file corpus-wide. §2.1.
2. **Do not create an Astoria Park entry.** It appears here only inside a quotation about a shared
   greenway. §2.1.
3. **Museum of the Moving Image, Van Alst Playground and Hallets Cove Playground are Astoria.** Their own
   sources say so explicitly. Do not import them.
4. **Never use "Community Board 1" as evidence of Astoria vs LIC.** CB 1 covers both. §2.4.
5. **The brief's "all in Community District 1" is wrong for LIC** — the neighbourhood's marquee core is
   in CD 2. §4.
6. **Three addresses the finder said were unavailable are in fact published** — New York Irish Center,
   Court Square Diner, and (as a PO Box only) GAHS. §3.1.
7. **There is no primary transit source anywhere in this corpus.** Every subway and bus fact is
   aggregator-only. Attribute or omit.
8. **Historic churches are entirely uncovered** — St. Mary's and St. Patrick's both returned connection
   failures. Their absence is a **sourcing gap, not evidence they are unimportant.** Do not fill it from
   memory.
9. **Publish no acreage for Hunter's Point South Park or Andrews Grove**, and no building count for the
   Hunters Point Historic District — each source contradicts itself.
10. **Never publish ZIP 10044 for anything in LIC.** It is Roosevelt Island's, and the ferry operator's
    own page propagates the error.
11. **Do not assert that M. Wells' Diner, Dinette, Steakhouse or Mothership are open.** The page does not
    say so.
12. **Queensbridge Park has no City history narrative** — the Historical Signs body is genuinely empty,
    which I confirmed independently. Do not fill the gap.
13. **The finder's wrong-page warning did not reproduce for me.** Every one of my fetches was
    `<title>`-verified and correct, including Rainey Park. The environment hazard appears real but
    intermittent; treat any single uncorroborated fetch with suspicion.
