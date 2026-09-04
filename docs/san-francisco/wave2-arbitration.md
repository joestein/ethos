# San Francisco WAVE 2 — ARBITRATION

One arbitrator, eleven zones, ruled 2026-09-03 against every finder and verdicts file produced for
wave 2, and against `wave1-arbitration.md`, which binds me. **Authors follow this file. Where it
differs from a verdicts file, this file wins, and every such override is named in §9 so nobody
follows the looser document.**

Zones ruled: `japantown`, `financial-district`, `union-square`, `inner-richmond`, `inner-sunset`,
`dogpatch`, `mission-bay`, `noe-valley`, `presidio`, `golden-gate-park`, `ocean-beach`.

---

## 0. THE STATE OF THE WAVE, AND ONE BLOCKING GAP

I was asked to read twenty-two files. **Twenty exist. `mission-bay-finder.md` and
`mission-bay-verdicts.md` were never written.** I verified this by directory listing and by size,
twice, and confirmed it a third way: the string "Chase Center" — the first item in `mission-bay`'s
own roster draw — appears **nowhere in any of the forty-five files in `docs/san-francisco/`.**

This is not a documentation gap. `test/ethos/seeds/san_francisco_seed_data_test.exs` carries:

```
@tag :pending_san_francisco
test "the shipped corpus matches the in-scope roster exactly"
```

The tag exists because "until the last in-scope wave lands — 23 zones — the corpus is a prefix of
the in-scope set and this fails by construction." Twelve zones shipped in wave 1; wave 2 is eleven;
twelve plus eleven is twenty-three. **Wave 2 is the last wave, so the tag comes off when it lands,
and the assertion fails the moment it does unless `mission-bay.json` ships.** Mission Bay is the
twenty-third zone and the corpus cannot close without it.

I rule everything Mission Bay is entitled to in §3 so that a finder run against it starts with the
boundary, the marquee and the Oracle Park rule already settled. **Escalated to the coordinator as
the one thing in this wave that stops the roster closing.**

### 0.1 The three principles, inherited

Wave 1 §0 stated them and told a wave-2 arbitrator to inherit them. Inherited, unchanged, and every
ruling below follows from them.

**P1 — the roster's `draw` string beats every boundary layer.** **P2 — where the roster is silent,
the city's per-address assignment governs, and the register's own name is evidence.** **P3 — never
split a campus, a block face or a single structure.**

Nominatim's `neighbourhood` field is not an instrument and no ruling rests on it. Four wave-1
finders proved it wrong; two wave-2 files leaned on it anyway and I discarded both arguments.

### 0.2 P1 is the most-ignored ruling of wave 1, and three of this wave's verifiers broke it

Wave 1 wrote: *"one finder wasted its largest section fighting it."* In wave 2 the failure moved up
a level — it is the **verifiers** who overrode the roster, and each did it while ruling a
**roster-named place out of its own zone**:

- **Japantown's verifier ruled Konko Church out of Japantown.** `japantown`'s draw names Konko
  Church in terms.
- **Noe Valley's verifier ruled Billy Goat Hill "ships nowhere in this wave" and wrote "the roster
  is wrong."** `noe-valley`'s draw names Billy Goat Hill in terms.
- **Ocean Beach's verifier ruled the Cliff House, the Sutro Baths, Sutro Heights and Lands End "not
  Ocean Beach's."** `ocean-beach`'s draw names the Cliff House site, the Sutro Baths ruins, the
  Lands End trail and the Camera Obscura in terms.

All three are overturned in §1 and §2. A verifier may correct a number, a quotation or a fetch. **It
may not overrule the document that creates the pages.** If the roster is wrong, that is escalated to
the coordinator and fixed in the roster; it is never solved by a page declining its own draw.

---

## 1. OWNERSHIP TABLE — every place claimed by two files

Assigned to exactly one zone, with the evidence. Hosting is not containment. A dataset's
`analysis_neighborhood` stamp on a centroid is not a statement of what an object belongs to.

### 1.1 Union Square ↔ Financial District — the largest contest in the wave

Nineteen subjects appear in both files. Neither roster draw names any of them, so P1 does not
decide, and both verifiers escalated the block rather than grabbing it. That was correct.

**RULED: Kearny Street is the line, from Market Street to Bush Street.** West of Kearny is Union
Square's; east of Kearny is the Financial District's.

I chose it because it is the only line that **reproduces wave 1 §4b exactly without being told to.**
Wave 1 reserved Notre-Dame-des-Victoires (564–566 Bush), Met Life (600 Stockton), Fire Station 2
(460 Bush), the Kensington Park Hotel (450–460 Post) and the Chancellor Hotel (433 Powell) for Union
Square. Every one of those addresses falls west of Kearny, and no other candidate line puts all five
on the right side. A line that independently returns an answer already ruled is the line to take.

| Place | Identifier | Ruling |
|---|---|---|
| **Hallidie Building**, 130–150 Sutter St | LM 37 (1971); NRHP 71000185 (19 Nov 1971) | **FINANCIAL DISTRICT** — §4. Between Kearny and Montgomery. |
| Hunter-Dulin Building, 111 Sutter St | NRHP 97000348 (17 Apr 1997) | **FINANCIAL DISTRICT** — at Montgomery. Write the single hyphen; the register's `--` is an en dash. |
| The Mechanics' Institute, 57–65 Post St | LM 134 (1981) | **FINANCIAL DISTRICT** — east of Kearny, and the CBD layer independently reads `Downtown`. Union Square loses its best hours-bearing asset and survives on Britex, Apple, Sears, John's Grill and the two garages. |
| Crocker Galleria, 50 Post St | — | **FINANCIAL DISTRICT** — same block. Third floor, not the roof. |
| Sam's Grill & Seafood, 374 Bush St; Sam's Tavern, 368 Bush St | — | **FINANCIAL DISTRICT** — Bush between Kearny and Montgomery. |
| One Montgomery Street | LM 297 (2022) | **FINANCIAL DISTRICT** — CBD `Downtown`; Union Square's own verifier recommends it. |
| **Lotta's Fountain**, Market/Geary/Kearny | LM 73 (1975); NRHP 75000475 (20 Jun 1975) | **FINANCIAL DISTRICT.** The one object standing *on* the line. Decided by the CBD reading of `Downtown`, which is the only purpose-built instrument either file produced for it. |
| S.F. Curb Mining Exchange, 350 Bush St | LM 113 (1980) | **FINANCIAL DISTRICT** — Union Square drops it already. |
| Crown Zellerbach Building, 1 Bush St | LM 183 (**1987**, not 1983) | **FINANCIAL DISTRICT** — Union Square drops it already. **No Article 11 sentence: there is no Article 11 row for 1 Bush Street.** |
| Flatiron Building, 540–548 Market St | LM 155 (1982) | **FINANCIAL DISTRICT.** |
| **V. C. Morris Building**, 140 Maiden Lane | LM 72 (1975) | **UNION SQUARE** — Maiden Lane is `union-square`'s roster draw (P1) and Maiden Lane is one walk (P3). The Financial District's §1a claim to LM 72 is **struck**. |
| Hammersmith Building, 303 Sutter St | LM 117 (1980) | **UNION SQUARE** — at Grant, west of Kearny, adjoining Maiden Lane's block. No live tenant is established; assert none. |
| Four Fifty Sutter Building, 450 Sutter St | NRHP 09001118 (22 Dec 2009) | **UNION SQUARE.** |
| **The Market Street north side, Fifth Street to Kearny Street, entire** — James Flood Building 870–898 (LM 154), Samuel's Clock 856 (LM 77), Phelan Building 760–784 (LM 156), Wells Fargo Union Trust Branch 744 (LM 131), Chronicle Building 690 (LM 243), 1 Grant Avenue (LM 132) | | **UNION SQUARE.** Wave 1 §3a gave SoMa the **south** side from Fifth to Second and wrote "a street has two sides and SoMa gets the south one." The north side is the other page's, and it is one block face, which P3 forbids splitting six ways. The Powell & Market turntable anchors its west end and is the roster's Union Square item. |
| Notre-Dame-des-Victoires, 564–566 Bush St | LM 173 (1984) | **UNION SQUARE** — **wave 1 §4b, binding.** §9.1. |
| Fire Station 2, 460 Bush St | LM 143 (1981); NRHP 02000371 (17 Apr 2002) | **UNION SQUARE** — wave 1 §4b, binding. §9.1. The NRHP name is "Engine Co. **Number** 2". |
| Met Life – Pacific Coast Head Office, 600 Stockton St | LM 167 (1984) | **UNION SQUARE** — wave 1 §4b, binding. §9.1. |
| Perbacco (230 California), Wayfare Tavern (201 Pine), Schroeder's (240 Front), Tadich Grill (240–242 California, LM 145), Punch Line (444 Battery), Embarcadero Center | | **FINANCIAL DISTRICT**, uncontested. |
| Chancellor Hotel, 433 Powell St; Kensington Park Hotel, 450–460 Post St | — | **UNION SQUARE** — wave 1 §4b. |

**Ruled out of both, and out of the wave:** the **Hobart Building** (LM 162 / NRHP 100006911), the
**Mutual Savings Bank Building**, 700 Market Street (NRHP 13001107), **735 Market Street** (NRHP
04000327) and the **Palace Hotel** (LM 18). All four are **already shipped in `soma.json`** — I read
the file and confirmed the slugs and addresses. Union Square caught two of the four; **it did not
catch Mutual Savings and lists NRHP 13001107 in its PUBLISH column.** §9.4.

Also out of both: **Bix, 56 Gold Street** (`bix-north-beach`, shipped) and the **California Street
cable car line** (`california-street-cable-car-line-nob-hill`, shipped). The Ferry Building page may
say the California Street line reaches the building, because the Marketplace's own transit list says
so — that is a fact about the Ferry Building, not a second claim on the line.

**Dressler / Garfield Building, 938–942 Market Street (LM 244)** — **OUT.** West of Fifth Street,
past the Flood Building, on the ground the Market Street Theatre and Loft Historic District covers,
which wave 1 §4g ruled belongs to no page in any wave. Union Square's verifier recommends "not Union
Square" and is right for a better reason than the one it gives.

**Islam Temple / Alcazar Theater, 650 Geary Boulevard (LM 195)** — **OUT.** Wave 1 §4g already ruled
it orphaned and I do not reopen it. It sits outside the Union Square BID; the Geary theatre block at
415–495 sits inside it (§2d).

### 1.2 Inner Richmond ↔ Inner Sunset — Green Apple Books

One Legacy Business nomination, **LBR-2015-16-022, certified 3 October 2016**, covers two location
rows: **506 Clement Street** (Inner Richmond) and **1231 9th Avenue** (Inner Sunset). Inner Sunset's
verifier found this; Inner Richmond's file missed it entirely.

**RULED: two places, two zones, one shared number.**

- **Green Apple Books, 506 Clement Street → INNER RICHMOND.** Slug `green-apple-books-inner-richmond`.
- **Books on the Park, 1231 9th Avenue → INNER SUNSET.** Slug `books-on-the-park-inner-sunset`.
  This is the operator's own name for that store and the two are separately named on
  `greenapplebooks.com`.

Both may cite the nomination number. **Neither restates the other's address**, and neither names
Browser Books on Fillmore.

**STRICTER THAN BOTH VERIFIERS: only the Clement Street entry may carry the 1967 establishment
date.** Inner Sunset's §2.5 licenses `Established_Date` "cited to the registry with the nomination
number in the same sentence" — a sound rule, and applied to Books on the Park it would print
"established in 1967" over a later branch, which is false. The registry's date is a fact about the
**business**, and it attaches to the door the business started behind. Books on the Park ships with
the nomination number and **no date**.

### 1.3 Inner Richmond ↔ Presidio (4 places)

| Place | Ruling | Evidence |
|---|---|---|
| **Mountain Lake**, the water | **PRESIDIO** | Both layers Presidio at three points; NPS administers it. |
| **Mountain Lake Park**, 1 11th Avenue, 12.96 ac | **INNER RICHMOND** | Rec & Park's `analysis_neighborhood` is the literal string "Inner Richmond, Presidio"; the playground and the tennis courts both test Inner Richmond. Decisive, and Inner Richmond's verifier surfaced it: **`presidio.gov`'s own page describes the city playground and dog park as *adjacent amenities*** — the Presidio treating the city park as a neighbour. |
| | | **The lake and the park are TWO places**, which is what both layers and both administering agencies say. The Presidio finder believed no claimant existed; `inner-richmond` is in scope and has a file. |
| **Julius Kahn Playground** and **Presidio Wall Playground** | **INNER RICHMOND** | Both test Presidio Heights on both layers. Presidio Heights is a zone in no wave; `inner-richmond`'s draw names the "Presidio Heights edge". Physical adjacency to the Presidio wall is real and is not containment. |

**Waybur, Julian, House, 3232 Pacific Avenue (NRHP 11000143)** — a boundary artifact on a Pacific
Avenue address. **Nobody's.** Recorded so a later pass does not "discover" it.

**Park Presidio Boulevard** — `analysis_neighborhood` is "Outer Richmond, Inner Richmond, Seacliff,
Presidio". Four units, two of them zones I hold, and no file gathered a fact about it beyond 20.39
acres and a centroid. **Nobody's.** It is a highway approach, not a destination.

### 1.4 Golden Gate Park ↔ Inner Richmond — the Fulton Street edge (8 places)

**All eight: GOLDEN GATE PARK.** Candidates 59 Arguello Gate, 60 Brown Gate, 61 the Stanyan/Fulton
wall, 80 Heroes Redwood Grove and Gold Star Mothers Rock, 87 Ninth Avenue playground, 113 the San
Francisco Model Yacht Club, 114 the Senior Center, 138 the archery field.

The contest is real only for **Brown Gate**, which both files work up: Golden Gate Park as candidate
60, Inner Richmond as item 19 / E3. The Civic Art rows stamp `analysis_neighborhood: Inner Richmond`
on **Bear** (1908.3.a) and **Lion** (1908.3.b), and Golden Gate Park's verifier called that "the City
contradicting the default the finder assumed."

**It is not.** The same rows carry `location_description` **"8th Avenue Entrance At Fulton St.
Northeast Corner"** and **"Northwest Corner"**. It is a **park entrance gate**, and the two figures
stand on either side of it. An `analysis_neighborhood` stamp is a point-in-polygon result on a
sidewalk corner; it does not say what an object belongs to, and a gate belongs to the park it opens
into. P3 forbids splitting a single structure across two pages, and this gate would be split down
the middle of 8th Avenue. **Write Bear and Lion, both M. Earl Cummings, bronze on sandstone, 1908,
the gift of Suzanna Brown, at 8th Avenue and Fulton Street. Title, artist, year, accession and
address only — no medium, no dimensions, no donor line beyond what the row carries.**

Inner Richmond has sixty-two places and loses nothing it needs. Its file correctly declines "Golden
Gate Park's north kerb along Fulton Street" elsewhere; this is the same concession one object later.

**The finder's stated evidence for the straddle does not exist.** `r7bn-7v9c` has no `facility`
field. Inner Richmond's verifier proved that and the argument must not be repeated.

### 1.5 Golden Gate Park ↔ Ocean Beach — the Great Highway edge (11 places)

**All eleven: GOLDEN GATE PARK.** Both verifiers reached this independently and I confirm it.

Beach Chalet (**LM 179, 1985**; **NRHP 81000172, 22 July 1981**) · the Labaudt frescoes, as a feature
of the Beach Chalet and not a place · Dutch Windmill / North Windmill (**LM 147, 1981**) · Murphy
Windmill (**LM 210, 2000**) · Millwright's House, part of the same landmark · Queen Wilhelmina Tulip
Garden · the Roald Amundsen monument · the golf course · the archery field · the western park entry
monuments · Speedway Meadow.

Evidence: the National Register district text makes **the Great Highway the district's western
boundary** and every one of these is inside it; Rec & Park Section 6 is coded "Golden Gate Park,
Outer Richmond" with **no Ocean Beach component**; and `r7bn-7v9c` assigns every 1000 Great Highway
row to `analysis_neighborhood` **Golden Gate Park**. `ocean-beach`'s roster draw names none of them,
so P1 does not pull the other way.

**Park Chalet DROPS** on sourcing — the operator's site was never read — and the drop is about the
source, not the zone.

**The Beach Chalet restaurant's "SINCE 1996" and "A San Francisco landmark" both DROP**: a trading
duration and a bare designation claim, one sentence apart on the same page. LM 179 and NRHP 81000172
cover the building and are the only designation sentences that publish for it.

### 1.6 Golden Gate Park ↔ Inner Sunset ↔ Haight-Ashbury (shipped)

**No neighbourhood file claims a park institution. Confirmed, and this is the roster's scope_ruling
working exactly as intended.** I checked by string across all twenty wave-2 files and all
twenty-four wave-1 files:

- "de Young" appears in `inner-sunset` **only** at S11 and in its own concession list — *"the de
  Young and the Academy of Sciences are explicitly not Inner Sunset's; neither is anything else
  north of Lincoln Way."*
- "Academy of Sciences", "Conservatory of Flowers", "Stow Lake", "Beach Chalet" likewise appear in
  `inner-sunset` only inside that same concession.
- "Japanese Tea Garden" and "Botanical Garden" appear in **no file but Golden Gate Park's.**
- `haight-ashbury` mentions the Conservatory once, inside a quotation locating something else.

**Kezar Stadium, Kezar Pavilion and the Kezar Stadium Gates → GOLDEN GATE PARK.** Both DataSF
datasets say Golden Gate Park, Haight-Ashbury shipped without them, and Inner Sunset conceded
correctly. Address **670 Kezar Drive**, from `r7bn-7v9c` 1991.3.a-l — **not** the Wikipedia
infobox's 670 Stanyan Street. Kezar Stadium carries `landmarkno` 0 and **is not a landmark**; do not
write one. Kezar Pavilion **drops the architect's firm name**: the nomination as scanned reads
"Masten, Bangs, **Kurd**, and Chace" and a wrong architect reads as citable exactly the way a wrong
landmark number does.

**The San Francisco Botanical Garden → GOLDEN GATE PARK**, on `r7bn-7v9c` 1958.26 and 1968.66, both
at 1199 9th Avenue, both `analysis_neighborhood` Golden Gate Park. Its Ninth Avenue address does not
move it.

**Breon Gate at 19th and Lincoln, and the 46th Avenue playground → GOLDEN GATE PARK.** Golden Gate
Park's verifier left them "open for the Sunset". There is no Sunset page: **Outer Sunset is
declined**, and `inner-sunset` does not reach 19th or 46th Avenue on any reading. Leaving them open
orphans them.

**Tank Hill (3.02 ac, 100 Twin Peaks Blvd) and the Interior Greenbelt (21.37 ac) → INNER SUNSET.**
Rec & Park's own joined column says Inner Sunset for both; the Greenbelt's dual code names Twin
Peaks, which is **declined**. Shipped Haight-Ashbury does not own Tank Hill and its draw stops at
"the Victorians of Ashbury Heights".

**Mount Sutro and the UCSF Parnassus campus → INNER SUNSET.** `inner-sunset`'s draw names both in
terms. P1, and it was in the roster the whole time.

**Sutro Tower → OUT.** Twin Peaks / Clarendon Heights on both datasets, Twin Peaks declined, and
"the thing you see from Grand View Park" is orientation by impression besides.

### 1.7 Dogpatch ↔ Mission Bay ↔ the declined ground

The `dogpatch` draw names the Minnesota Street Project, the Museum of Craft and Design, the Pier 70
historic yard, Esprit Park and the workers' cottages. **All five are Dogpatch's on P1** and none is a
straddler. Dogpatch's file spent its largest section arguing a question P1 closed, which is the
identical defect wave 1 named; its verifier caught that and is upheld.

There is a second reason the five-locator exercise could not have worked, and it is worth recording:
**EAS and the Analysis Neighborhoods share the same 41-unit geography, and that geography contains no
Dogpatch at all.** Every address queried returns `nhood: "Potrero Hill"`. An instrument that can only
ever return one answer cannot adjudicate anything. Wave 1 §3a already ruled that **SF Find's 117
units beat the 41 Analysis units for a block-scale question**, and that ruling governs here.

| Place | Identifier | Ruling |
|---|---|---|
| Crane Cove Park, 18th & Illinois | — | **DOGPATCH** — the Port's own page says the park is "in the Dogpatch neighborhood", in a source the finder cited and did not read. |
| Warm Water Cove Park | — | **DOGPATCH** — the Port's own page says Dogpatch; no rival zone exists. |
| **Bethlehem Shipbuilding Corporation Hospital**, 331 Pennsylvania Ave | NRHP **100008498** | **DOGPATCH.** Potrero Hill was declined with the reason *"Adjacent to Dogpatch, which took the industrial-heritage material"* — the roster saying where its material goes. The Telegraph Hill precedent applies: if Dogpatch does not take it, nobody can. **Write the reference number and NO listing date** (§6.4). |
| Harmonic Brewing, 1050 26th Street | — | **DOGPATCH**, and only on an operator fetch. Vernacular Dogpatch reaches Cesar Chavez. |
| The Midway, 900 Marin Street | — | **OUT.** Past Cesar Chavez, on Bayview Hunters Point ground with no page. |
| Potrero Power Station / Station A, 1201 Illinois St | — | **OUT** — no sourced fact exists, so there is nothing to award. |
| 22nd Street Caltrain station | — | **DROP** for want of any operator source, independent of zone. |

**The Dogpatch / Mission Bay line is MARIPOSA STREET.** Dogpatch runs from Mariposa to Cesar Chavez.
Nothing turns on it in this wave — the five north-edge candidates (Moshi Moshi, Autumn's Cafe, The
Gantry, Tercera, The Cove) are registry-only and drop on sourcing regardless — but Mission Bay's
author needs the line before drafting.

**Esprit Park's Rec & Park record carries `complex: "Mission Bay Complex"`. That is an operations
grouping, not a neighbourhood, and nobody may read it as one** — the same trap as the "North Beach
Complex" stamp on four Financial District parks. Esprit Park is roster-named for Dogpatch and stays.

### 1.8 Japantown ↔ Pacific Heights (shipped) — see §2a, which reverses the file

### 1.9 Noe Valley ↔ the Mission (shipped) ↔ Glen Park — see §2e

---

## 2. THE PARK PAGES AND THE FOUR BOUNDARY REVERSALS

### 2a. JAPANTOWN — the Sutter Street line is OVERTURNED. Wave 1 already ruled it.

Japantown's verifier ruled that the zone stops at Sutter Street, on 546 EAS rows and 42 individual
per-address lookups, all of which I accept as accurate. It then wrote, honestly:

> *"Japantown ships without the Japanese YWCA, without Kinmon Gakuen, without the JCCCNC, without
> Konko Church, without the Bush Street Temple and without the Cottage Row district… That is a real
> loss and I am not pretending otherwise. It is the arbitrator's to overturn — but it must be
> overturned on a locator, not on a feeling."*

**It is overturned, and not on a feeling. It is overturned on wave 1 §4c, which is binding on me and
which already awarded every one of them to Japantown**, in terms, having already considered and
rejected the analysis polygon:

> *"### 4c. Japantown (wave 2) — Cottage Row Mini Park · the **Bush Street–Cottage Row Historic
> District** (Article 10; DataSF's own prose places it in the Western Addition and Wikipedia's table
> places it in Japantown — **only the analysis polygon says Pacific Heights**) · Kinmon Gakuen
> (**LM 288, 2019**…) · the Japanese YWCA / Issei Women's Building · Stanyan House · Ohabai Shalome /
> Bush Street Temple (**LM 81, 1976**) · **Building at 1735–1737 Webster Street, NRHP 73000444**… ·
> the Peace Pagoda… · Marcus Books."*

Wave 1 saw the polygon, named it, and ruled against it. A wave-2 verifier re-deriving the polygon
does not reopen a decided question.

Three further reasons, so the ruling does not rest on precedent alone:

1. **The verifier ruled a roster-named place out of its own zone.** `japantown`'s draw is *"The Peace
   Pagoda and Peace Plaza, the Japan Center malls, Buchanan Street Mall, the Sundance Kabuki, **Konko
   Church**."* Konko Church is at 1909 Bush. Under the verifier's line it is Pacific Heights'. **P1
   settles that on its own**, and a line that expels a roster item is the wrong line.
2. **Pacific Heights is SHIPPED and claimed none of them.** The verifier says so itself — *"nothing
   has to be taken back and every one is available."* Honouring EAS therefore orphans **two Article
   10 landmarks and two National Register listings** on a page that has already published without
   them. That is unfixable in this wave. Wave 1 §3b refused exactly this outcome for Hayes Valley,
   and §3c refused it for the Swedenborgian Church.
3. **P2's second clause: the register's own name is evidence.** The federal register calls 82000983
   the **Bush Street–Cottage Row Historic District**, and a district the United States registered
   across Bush Street cannot be ruled out of a zone for being on Bush Street.

**RULED: Japantown takes the north side of Sutter Street. All ten surviving candidates return.**

| Place | Identifier | Notes |
|---|---|---|
| Japanese YWCA / Issei Women's Building, 1830 Sutter St | **LM 291 (2021)**; **NRHP 100004868, listed 10 Jan 2020** | RESNAME is "Japanese YWCA" flat. Julia Morgan designed it *pro bono*; opened 1932. **DROP the AFSC end-date of 1959** (not in the article) and **DROP "the first independent Japanese YWCA in the United States."** The 2017 annex publishes. |
| Kinmon Gakuen, 2031 Bush St | **LM 288, designated 2019** | **Year only.** `97yj-54sx` has `yeardesignated` and no day-level field, so "1 November 2019" cannot be cited to it. **NRHP 100012857 does not verify** (wave 1 §6b #5) and **no 2026 listing exists** — I confirmed the second by refnum and by name. 1911 is the institute's founding, not the building's. |
| Ohabai Shalome / Bush Street Temple, 1881 Bush St | **LM 81, designated 1976** | |
| **Konko Church, 1909 Bush St** | — | **Roster-named. P1.** Identity and address publish from `konkosf.org`. **"Since 1930" DROPS** — trading duration from the operator's own site. |
| JCCCNC, 1840 Sutter St | — | The Nihonmachi Master Plan; "Vision 80's" from 1982; Phase I 1986; Phase II 1988. **Five tenants, not two.** Kimochi, Inc. folds in and is not a place. |
| Bush Street–Cottage Row Historic District | **NRHP 82000983, listed 27 Dec 1982** | **The Article 10 claim DROPS.** `m22e-6hkz` gives `origin = "National Register"` — affirmative evidence that `dateadop` is inherited from the Keeper's entry, not a Board ordinance. Cite the federal number alone. **DROP "TREA, San Francisco's largest residential housing developer of the 1870s"**, the 1976 survey's 0–5 ratings, and every element count. |
| Cottage Row, the walk | — | The best thing to walk in the zone. |
| Cottage Row Mini Park, 0.17 ac | — | Named by wave 1 §4c. |
| Building at 1735–1737 Webster St | **NRHP 73000444, listed 8 Mar 1973** | **The Newsom attribution DROPS on evidence:** the Builder/Architect field is blank and no architect is named anywhere in the form. **Do not write "built in 1876"** — the nomination gives the water connection of 1876 *and* the Junior League's "late 1880's" in consecutive sentences and declines to choose. Write what the Water Department records show. |
| Stanyan House, 2006 Bush St | **LM 66, designated 1975** | Thin; ships on the register row. |

**Also Japantown's, and uncontested:** Marcus Books and Jimbo's Bop City, 1712–1716 Fillmore (**LM
266, 2014**) and the Golden Gate Commandery of the Knights Templar / Macedonia Missionary Baptist
Church, 2135 Sutter (**LM 202, 1993**). Both are EAS Japantown, and **the Fillmore Street conflict the
finder feared does not exist**: shipped `fillmore-street-pacific-heights` claims only "the blocks
between Bush Street and Broadway", and 1712 Fillmore is south of Bush. The verifier read the shipped
text and was right.

**Still dropped, on sourcing rather than zone** — the ruling above does not rescue them: the Buddhist
Church of San Francisco, 1881 Pine (every source gone; the domain now serves gambling spam) · Christ
United Presbyterian, 1700 Sutter · St. Francis Xavier, 1801 Octavia · Pine United Methodist, 1298
Pine (**no EAS row at all**) · Super Mira Market, 1790 Sutter · the National Urban League SF Chapter,
2015 Steiner (`landmarkno` 0).

**Trinity Episcopal Church, 1668 Bush (LM 65) — OUT.** Wave 1 §4c does not name it, EAS says Western
Addition, and 1668 Bush is a block east of Japantown's Bush frontage, at Franklin. **Western Addition
is in neither `zones` nor `declined`, so LM 65 is orphaned corpus-wide.** Recorded to the coordinator
as a roster gap alongside wave 1 §4g. **And the number is reused:** `97yj-54sx` carries both
`65 | Trinity Episcopal Church | 1668 Bush Street | 1974` and `65 | Trinity Presbyterian Church |
3261 23rd Street | 1984`. **Anyone citing Landmark No. 65 must name the building.** Wave 1 §6b #11
already ruled the Presbyterian one publishes by ordinance (82-84, 28 February 1984) rather than by
number; that ruling stands and this is the reason it was right.

**Rosa Parks Elementary / JBBP, 1501 O'Farrell — OUT.** Western Addition, and a school besides: wave
1 §7.2 rules that no kind fits a school. The JBBP is a genuine Japantown institution on ground that
is not Japantown's — that is a fact for guide prose, not a place.

**Westside Courts — the Bufano PUBLISHES, the housing project DROPS.** *Horse and Rider (St. Francis
on Horseback)*, Beniamino Bufano, 1935, granite, 164 × 62 × 26 in., created for the WPA, 2501 Sutter
Street. **No source establishes public access to the courtyard and the page does not send anyone into
one.**

Japantown's tier is unaffected: **GUIDE**, and it rises from 34 to about 45. §7.

### 2b. GOLDEN GATE PARK — and the Panhandle, which wave 1 already ruled

**Golden Gate Park is claimed by no neighborhood. Confirmed at §1.6.** Its edges are ruled at §1.4,
§1.5 and §1.6. One reversal remains.

**THE PANHANDLE → GOLDEN GATE PARK.** Candidates 142 (the Panhandle), 143 (the William McKinley
Monument) and 144 (the Panhandle playground and basketball court).

Golden Gate Park's verifier ruled **DROP** and left the strip unclaimed, on a genuinely careful
four-way reading: the National Register boundary includes it; Rec & Park Section 1 reads "Golden Gate
Park, Panhandle"; SF Planning's survey puts the Panhandle Historic District in Haight Ashbury; and
`r7bn-7v9c` assigns the McKinley Monument to `analysis_neighborhood` "Lone Mountain/USF".

**Wave 1 §4f already decided it**, and in terms that answer the argument directly:

> *"### 4f. Golden Gate Park… (wave 2) — Alvord Lake and the Alvord Lake Bridge · Hippie Hill ·
> Kezar Stadium · **the Panhandle** · Golden Gate Park Section 1 · the AIDS Memorial Grove. The
> roster makes Golden Gate Park a standalone page 'claimed by no neighborhood'; a
> `planning_neighborhood` of 'Golden Gate Park, Haight Ashbury' does not override it."*

Haight-Ashbury is **shipped** and did not take the strip. Lone Mountain/USF is a zone in no wave. If
Golden Gate Park does not take the Panhandle, **nobody does**, and an Article 10-adjacent public
park a mile long falls out of the corpus. The physical detachment from the park's rectangle is real
and is not a reason: the strip is Rec & Park's Golden Gate Park Section 1, and the register draws
the district around it.

**The McKinley Monument rides with the Panhandle as prose inside it, not as a separate place.** Do
not seed a page for a statue.

**Everything else in Golden Gate Park stands as its verifier ruled it**, and its designation work was
the best in the wave: thirteen identifiers claimed, thirteen survived. Reaffirmed with two additions:

- **The lake is STOW LAKE.** `3psu-pn9h` carries `STOW LAKE DR`, active; `BLUE HERON LAKE DR` does
  not exist in it; `stowlakeboathouse.com` returns **403, not a 301**, so the finder's "strong
  evidence" of a renaming does not reproduce. **Do not write "Blue Heron Lake", "Blue Heron
  Boathouse" or "50 Blue Heron Lake Dr".** Same ruling in reverse for Hellman Hollow: **write
  Speedway Meadow.**
- **"In operation since 1893" on `blueheronboathouse.com` DROPS.** 1893 publishes as a *construction*
  date from the nomination and does not publish as a trading duration from the business. The same
  year, two statuses.

### 2c. THE PRESIDIO — wave 1's Marina seam applied, not reopened

**Wave 1 §3c and §10.1 bind and I do not reopen them: Lyon Street is the line and Fort Mason is
inside it.**

- **Fort Mason is the MARINA's** — nine shipped rows including the Port of Embarkation NHL. The
  Presidio page **does not restate it**. Confirmed: the Presidio file does not claim it and does not
  escalate it.
- **The Palace of Fine Arts is the MARINA's.** The Presidio page does not restate it. **Rec & Park
  property 111 carries `analysis_neighborhood: "Marina, Presidio"` and the 19.74-acre parcel crosses
  the line** — wave 1's warning, restated because it is the one thing that could pull the Palace back
  across.
- **The Lyon Street Steps are PACIFIC HEIGHTS'.** Not restated here.
- **Crissy Field, the Crissy Field Center (Building 603), Presidio Tunnel Tops (210 Lincoln Blvd) and
  the Presidio Theatre (99 Moraga Avenue) are the PRESIDIO's**, exactly as wave 1 §3c ruled them out
  of the Marina. The Marina's file releases them in writing and claims none.
- **There are two Presidio Theatres.** The OSM node at 2340 Chestnut Street is a different building.
  Wave 1 dropped it; **it must not be resurrected as the Moraga Avenue venue.** The Presidio file
  correctly writes 99 Moraga and the kind is **`theater`**, not `theatre`.
- **Fort Point → PRESIDIO.** **NRHP 70000146, listed 16 October 1970** — re-fetched and confirmed.
  Built 1853–1861. **EXCISE "the only fortification of this impressive design constructed west of the
  Mississippi River."**

**The Presidio of San Francisco itself is the guide subject, not a place row.** The designation
belongs in the intro: *"The Presidio was designated a National Historic Landmark in 1962 and is
listed on the National Register of Historic Places, reference number 66000232, certified 15 October
1966."* **Write the NHL year, not the day** — 06/13/62 came from a list nobody re-fetched, and
`nps.gov/prsf` states only "In 1962". Do not restore the "(1776 + 218 = 1994)" arithmetic.

**THE "PRESIDIO CHAPEL" TRAP, which every author must read.** Reference **66000232** returns
`RESNAME "Presidio Chapel"` and `ResType building` while carrying `NumCBldg 477`, `NumCStru 166`,
`NumCSite 11`, `NumCObj 8` and `Is_NHL X`. **It is the district, not a chapel.** A row reading
"Presidio Chapel, NRHP 66000232" would pass the regex and be false. The Post Interfaith Chapel is
dropped partly for sharing a word with it, and that drop stands. **Those four contributing-resource
figures are the banned tally and do not publish in any form, including "hundreds of."**

**Zero Article 10 landmarks exist in the Presidio.** This is what federal land looks like: the city
ordinance does not reach it. **A writer who produces "San Francisco Landmark No. N" in this zone has
invented it.** Equally, **no California Historical Landmark number may ship** — not one was confirmed
against a live register, three obvious candidates sit in the zone, and CHL numbers do not satisfy the
citation regex anyway (wave 1 §6a).

**Baker Beach and its south end → PRESIDIO.** The Lobos Creek mouth tests Seacliff, which appears in
neither `zones` nor `declined`, so no claimant exists — and the register address of **Six-Inch Rifled
Gun No. 9 (NRHP 79000255, certified 7 February 1979)** is literally "Baker Beach."

**The Golden Gate Bridge is nobody's place row.** The south tower and toll plaza test Presidio;
midspan and the north tower are in Marin County. A place row would assert a containment the geometry
refuses. It stays present in prose through Fort Point's arch and through the Golden Gate Bridge
Welcome Center, which is unambiguously Presidio and ships. The measurements (8,981 ft, 4,200 ft, 746
ft, 62 ft) publish wherever it is written about. **The 27 May 1937 opening date does not publish on
the citation given** — that page carries no opening date.

*Wood Line* stands in a **eucalyptus** grove, not a cypress grove. **Piccino Presidio, 1 Letterman
Drive**, assigned to this page by wave 1 §3c, was never picked up by the Presidio file; it is
unclaimed, and Dogpatch's `piccino-dogpatch` is safe either way.

### 2d. OCEAN BEACH — the headland is Ocean Beach's, and the tier changes

Ocean Beach's verifier ruled **TOWN PAGE on five places**, having ruled the entire Sutro/Lands End
headland out of the zone. Its evidence was real: `gfpk-269f` gives the ground to "Sutro Heights" and
"Lincoln Park / Ft. Miley", `j2bu-swwd` to "Outer Richmond" and "Lincoln Park", and the Sutro
nomination's boundary paragraph places Ocean Beach *outside* the district, to its south.

**OVERTURNED. The Sutro / Lands End headland is OCEAN BEACH's, and the reason is P1.**

`ocean-beach`'s roster draw reads, in full: *"The beach itself, **the Cliff House site**, **Sutro
Baths ruins**, **Lands End trail**, **the Camera Obscura**. Claimed by no neighborhood — GGNRA
land."*

Four of the five items the verifier expelled are **named in the draw**. A verifier cannot rule a
zone's own draw out of the zone. Three further reasons:

1. **The scope_ruling says why the page exists**: *"Ocean Beach is GGNRA."* Sutro Heights Park and
   Lands End are GGNRA, administered by the National Park Service, and the Cliff House and Camera
   Obscura sit on that ground. The page was created for exactly this land.
2. **Sutro Heights and Lincoln Park appear in neither `zones` nor `declined`.** Honouring the layers
   orphans ten places, an NRHP reference number and every NPS-sourced fact in the file. The Telegraph
   Hill precedent governs: a declined-or-absent unit cannot take them, so if Ocean Beach does not,
   nobody can.
3. **The Sutro boundary paragraph proves the opposite of what it was used for.** It describes the
   extent of a *historic district that is not listed*; it is not a neighbourhood boundary and cannot
   move a page.

**OCEAN BEACH's, ruled:**

| Place | Identifier | Notes |
|---|---|---|
| Ocean Beach | — | **Drop the length entirely.** NPS says 3.5 miles, the Sutro nomination says five, and the Golden Gate Park nomination describes *the park* as 3.5 miles — a plausible source of the borrowed figure. Two federal documents in conflict: give neither. **Drop "westernmost"** — it is a live regex. |
| Ocean Beach Snowy Plover Protection Area | **36 CFR 7.97(d)** | Stairwell 21 to Sloat Boulevard, tidelands to 1,000 feet offshore, six-foot leash, 1 July to 15 May. **Cite the section, not the truncated FR history.** |
| King Philip (ship) and Reporter (schooner) Shipwreck Site | **none** | §6.2. |
| Moss Flats Building, 1626 Great Highway | **NRHP 83001232, listed 24 Feb 1983** | |
| Sunset Dunes, 50.60 ac | — | **Do not ship 501 Stanyan Street** — that is Rec & Park's own mailing address, on every property row. Outer Sunset is declined and its stated reason is that "its principal visitor draw is Ocean Beach, which has its own page." |
| Balboa Natural Area, 1.84 ac | — | The dataset files it under Outer Richmond and Sutro Heights at once. Sutro Heights is Ocean Beach's under this ruling. **No address exists in the dataset; do not invent one.** |
| **Cliff House** | **none, of any kind** | §6.3. Do not write hours, "closed" or "reopened". **Drop the 1090 Point Lobos street number** — unconfirmed. |
| **Camera Obscura** | **NRHP 01000522, listed 23 May 2001** | 1096 Point Lobos Ave. on the record. 17.5 × 17.5 feet, 1946; a circular parabolic dish of shaped plywood surfaced with white enamel; six-foot projection table; lens and mirror 150 inches above; remodelled 1957; built by Floyd Jennings. **"the last example… in the United States" does not publish.** |
| **Sutro Baths ruins** | **none** | **Drop the GGNRA acquisition year** — NPS's page says 1973, NPS's own nomination says 1976, and splitting them is forbidden. Say the ruins are administered by the National Park Service and give no year. Harris v. Sutro belongs here. |
| Sutro Heights Park | — | 1885; over twenty acres; over 200 concrete replicas from Belgium; the Dolce far Niente balcony; the conservatory; the two octagonal gatekeepers' houses of 1885–86 with rooster weathervanes. Hours **6 a.m. until one hour after sunset**. **Drop "846 Point Lobos Avenue"** — unconfirmed. **The lions are reproductions of the originals**, per the nomination; a draft calling them Sutro's lions is wrong. Use the nomination's staff breakdown, not the web page's compression of it. |
| The well house | — | **"the last surviving building from the Sutro era" does not publish.** |
| Merrie Way | — | One sourced sentence: wheelchair-accessible trails begin from the parking lot. |
| **Lands End Lookout Visitor Center** | — | 680 Point Lobos Avenue, 94121; (415) 426-5240; 9 a.m.–5 p.m. seven days. The cleanest entry in the zone. |
| The Coastal Trail | — | **Drop "the edge of the city — and the continent."** Lands End is open 6 a.m. to one hour after sunset. |
| USS San Francisco Memorial | — | Only the NPS sentence survives. **Do not describe the object** — what it is and when it was dedicated are unsourced. |
| Point Lobos, the headland | — | **Drop "westernmost". Re-attribute the elevation:** 350 feet is the **Fort Miley reservation's** elevation, not a measurement of Point Lobos. Keep Rancho Punta de Lobos and the *lobos marinos* naming. |

**Ocean Beach's tier moves from TOWN PAGE to GUIDE.** §7.

**NOT Ocean Beach's, and OUT of the wave:** Fort Miley (NRHP 80000371, 23 May 1980), Battery James
Chester, the VA Medical Center (NRHP 05001112, 20 Apr 2009), Lincoln Park, City Cemetery (**LM 306,
2022**) and the Legion of Honor. The Fort Miley nomination says in its own words that *"The Lands End
area, outside the boundary and west of Fort Miley"* and *"Lincoln Park, adjacent to but outside Fort
Miley"* — the federal document distinguishing the two grounds. Lincoln Park and the Outer Richmond
have no page. **Nobody's; identifiers preserved here for a later wave.**

**Also OUT:** the Doggie Diner Sign (**LM 254, 2006**, APN null), the Mother's Building (**LM 304,
2022**; **NRHP 79000529, 31 Dec 1979**) and the San Francisco Zoo — Lakeshore and Parkside, neither a
zone nor declined. That 36 CFR 7.97(d) makes Sloat the plover area's southern terminus draws a
federal line for plovers, not a zone boundary.

**The Outer Sunset beachfront trade (ten candidates) DROPS on sourcing, not on zone.** Outer Sunset
is declined and its material would come here; but the only source is a promotional sf.gov page whose
usable content is a name and a street, **the Java Beach (1396 La Playa) and Outerlands (4001 Judah)
addresses are on no source at all**, and every founding year and superlative on it is barred. Recorded
so a later wave knows the zone rather than the status. The page is **"Blackbird Bookstore"**, one
word.

### 2e. NOE VALLEY — Billy Goat Hill and the two Liberty districts

**Billy Goat Hill → NOE VALLEY.** Noe Valley's verifier dropped it and wrote *"The roster's own draw
for `noe-valley` names it and the roster is wrong."* Three locators do say Glen Park and zero of 224
vertices fall inside the Noe Valley polygon; I accept the geometry.

**It does not matter. Wave 1 §4e ruled the identical question, on the identical draw sentence:**

> *"The roster gives 'the Victorians of Liberty Hill' to Noe Valley; EAS returns Mission for 50 and
> 150 Liberty Street. **P1 governs: the roster wins, and Noe Valley takes both districts in wave
> 2.**"*

Billy Goat Hill and Liberty Hill are named in the same draw string — *"24th Street, the Noe Valley
Town Square, Billy Goat Hill, the Victorians of Liberty Hill."* Wave 1 took one against the city's
address layer; the other follows. **Glen Park is in neither `zones` nor `declined`**, so the
alternative is that a 3.67-acre public hill in the roster's own draw ships nowhere at all.

**Liberty Hill Historic District → NOE VALLEY.** Article 10, **Appendix F, adopted 25 October 1985,
Ordinance 484-85**. The ordinance number is a genuine addition to wave 1's record, recovered by Noe
Valley's verifier from `m22e-6hkz` objectid 57, and the author cites it.

**Liberty Street Historic District → NOE VALLEY.** **NRHP 83001230, certified 15 September 1983**,
"Roughly 15–188 Liberty St." Both re-fetched and exact. **The Mission page does not reopen** — it
shipped 69 places and owns neither; I read `mission.json` and confirmed it.

**STRICTER THAN THE VERDICTS: neither the 51 nor the 37 publishes.** Noe Valley's verifier corrected
the finder's "51 contributing buildings" to `total_prop 51 / contributors 37 / non_contrib 14` and
then wrote *"If this ships anywhere, ship 37."* **No.** A contributing-resource count is a count off
a live preservation dataset — the same defect as counting landmarks, and the same defect its own §7
condemned two pages earlier when the finder counted the eligible districts and got six of seven.
Name the district, cite the identifier, count nothing. §6.5.

**Portola Open Space → NOE VALLEY.** `analysis_neighborhood` "Noe Valley, Twin Peaks", 157 of 226
vertices inside, **Twin Peaks declined**. 0.81 acres, no street address — write none.

**La Ciccia, 291 30th Street → NOE VALLEY.** EAS returns Glen Park, which is neither a zone nor a
declined candidate, so the alternative is nowhere. **Binding condition, on the wave-1 Swedenborgian
model: the entry states its address and never states which neighbourhood it is in.** Note the address
is ambiguous citywide — EAS also carries a 291 30th **Avenue** in Seacliff. **"Sardinian" was not on
the page and must be re-sourced before it ships.**

**Walter Haas Playground, Topaz Open Space, George Christopher Playground and Glen Canyon Park —
OUT.** Unclaimed, Glen Park has no page, and no file gathered facts for them.

---

## 3. MISSION BAY AND ORACLE PARK

### 3.1 Oracle Park — confirmed clean, for the third time

I read `lib/ethos/seeds/oracle_park_places.ex` rather than trusting the brief. It owns exactly seven
slugs, every one `town: "San Francisco"`: `oracle-park`, `reds-java-house`, `momos-san-francisco`,
`flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`.

**No wave-2 file claims any of the seven.** I checked each slug against all twenty files: the only
hits are pre-flight checks in `dogpatch-finder.md` and `inner-richmond-finder.md`/`-verdicts.md`,
which name them precisely in order to exclude them. Correct in both.

### 3.2 The Mission Bay rule, confirmed and carried forward

**Mission Bay LINKS to `guide:oracle-park-guide` and restates none of the seven places.** The roster
says so, wave 1 §10.5 says so, and it is a genuine precondition: `Links.resolve!/1` raises on an
unknown target and aborts a run that is not transactional, so `seed_ballparks/1` must have run.

**I cannot confirm the page does it, because the page does not exist** (§0). This is the roster entry
that exists largely to demonstrate the rule, and the rule is currently undemonstrated.

### 3.3 What Mission Bay is entitled to, ruled now so its author starts settled

- **Its draw, on P1: Chase Center, the UCSF Mission Bay campus, Mission Creek and the houseboats.**
  **Chase Center is Mission Bay's marquee and is one file** (§4). Kind **`stadium`**.
- **Third Street Bridge**, Third Street over Mission Channel — **LM 194, 1989**, Strauss Engineering
  Corporation, 1931. Kind `historic-site` (there is no `bridge` kind). Wave 1 §4d and §10.5 reserved
  it; I verified it is **not** one of the seven code-seed slugs.
- **Garcia and Maggini Warehouse, 128 King Street** — **LM 229, 2002.** Same reservation, same check.
- **The Dogpatch line is Mariposa Street** (§1.7).
- **Caution inherited from wave 1 §4a:** the Port of San Francisco Embarcadero Historic District
  (NRHP 06000372) touches **Red's Java House**, an Oracle Park code seed. **Do not re-claim it.**
- **Esprit Park is Dogpatch's** despite its `complex: "Mission Bay Complex"` stamp (§1.7).

---

## 4. THE MARQUEE RULE — sixteen names, sixteen files, now and forever

| Marquee | Zone | Citation it carries |
|---|---|---|
| The Transamerica Pyramid | **financial-district** | **None.** Roster draw, P1. Chinatown is shipped with 42 places and does not contain it. **`thepyramidsf.com` is no longer the building's site** — it 301s to a former owner's portfolio page. William Pereira, completed 1972, white quartz, over 3,000 windows, Foster + Partners remastering completed 2024, 600 Montgomery. **"853 feet" is not sourced** — the page says "over 850 feet". |
| The Ferry Building | **financial-district** | **LM 90, designated 1977; NRHP 78000760, listed 1 December 1978** (as Union Ferry Depot). Opened 13 July 1898. |
| The Hallidie Building | **financial-district** | **LM 37, designated 1971; NRHP 71000185, listed 19 November 1971.** §1.1. **Willis Polk and the glass curtain wall are unsourced attributions and DROP**, and "the first glass curtain wall building in the United States" independently fails the superlative rule. |
| Union Square and the Dewey Monument | **union-square** | **None.** Roster draw. Plaza: 333 Post Street, Rec & Park civic plaza, 2.6 acres, kind `park`, slug **`union-square-plaza-san-francisco`** (`union-square-park` is Manhattan's). Dewey: **write 1901 or no date, never 1903**; Robert Ingersoll Aitken; 1,265 inches. |
| The Peace Pagoda | **japantown** | **None. `landmarkno = 0`. Do not invent one.** A five-tiered concrete stupa by Yoshiro Taniguchi, presented by the people of Osaka. **The 2000 Murokami update and the 2003 rededication are the PLAZA's, not the pagoda's**, and they are in the *Japan Center* article, not the *Japantown* one. |
| The Columbarium | **inner-richmond** | **San Francisco Landmark No. 209, designated in 1996.** §4.1. |
| The de Young Museum | **golden-gate-park** | **None.** 50 Hagiwara Tea Garden Drive. **Write the predecessor building only** — 1894 Midwinter Fair Fine Arts building, 1919 rebuilding, tower 1921, west wing 1925, original demolished 1929, Brundidge wing 1965, demolished 2003. **No architect and no opening year for the present building; no hours.** `famsf.org` returned 403 to two independent fetches and the gap stands. |
| The California Academy of Sciences | **golden-gate-park** | **None.** Steinhart Aquarium and Morrison Planetarium fold in as named venues, not places. Thursday NightLife 6–10 p.m., 21+; the 212,000-gallon living coral reef and over 1,000 animal species publish as measurements. **Both superlatives strip.** |
| The Japanese Tea Garden | **golden-gate-park** | **None.** Address and both seasonal hour ranges verbatim, gate times included. Superlatives strip. |
| The Conservatory of Flowers | **golden-gate-park** | **San Francisco Landmark No. 50, designated in 1972; listed on the National Register of Historic Places in 1971, reference number 71000184.** **Three superlatives strip**, one of them the nomination's own *"remains its most significant"*. Drop the West Gallery closure. |
| Fort Point | **presidio** | **Listed on the National Register of Historic Places on 16 October 1970, reference number 70000146.** |
| Crissy Field | **presidio** | **None.** Racetrack outline; plan approved 1921 under Henry "Hap" Arnold; Douglas O-25 replaced the De Havillands in 1930; opened to the public May 2001. **EXCISE "the military's first Air Coast Defense Station on the Pacific coast."** |
| The Walt Disney Family Museum | **presidio** | **None.** 104 Montgomery Street. Thu–Sun 10am–5:30pm, last entry 4:30pm. **The founding year is correctly withheld — do not restore it.** |
| The Sutro Baths | **ocean-beach** | **None, of any kind.** §2d. `RESNAME LIKE '%Sutro%' OR '%Cliff House%'` nationwide returns two features, in **Oregon** and **Colorado**. There is no San Francisco Sutro or Cliff House listing anywhere. |
| Chase Center | **mission-bay** | **None known.** Kind `stadium`. §3.3, and the page does not yet exist. |
| Pier 70 and the Union Iron Works yard | **dogpatch** | **ONE place.** **The Union Iron Works Historic District was listed on the National Register of Historic Places on 17 April 2014, reference number 14000150.** Sixty-six acres at Potrero Point. §6.3. |

**Trap carried at the marquee level:** NPS layer 0 carries **Union Iron Works Powerhouse (80000793)**
and **Union Iron Works Turbine Machine Shop (80000794)**, both at Webster Street in **Alameda**.
Different city, different listing. **Neither number may appear on the Dogpatch page.**

---

## 5. RULED OUT OF WAVE 2 — nothing below appears in any wave-2 file

The roster gaps wave 1 §4g named are unchanged and I add to them rather than solving them by
annexation. **This should be fixed in the roster, not by a neighbouring page reaching.**

- **Lincoln Park, Fort Miley, the Legion of Honor, the VA Medical Center and City Cemetery** — §2d.
  Identifiers preserved: NRHP 80000371 (23 May 1980), NRHP 05001112 (20 Apr 2009), **LM 306 (2022)**.
- **The south end at Sloat** — the Doggie Diner Sign (**LM 254, 2006**), the Mother's Building
  (**LM 304, 2022** / **NRHP 79000529, 31 Dec 1979**), the San Francisco Zoo. Lakeshore and Parkside.
- **The Outer Sunset beachfront trade** — declined zone, and drops on sourcing besides (§2d).
- **Trinity Episcopal Church, 1668 Bush Street (LM 65)** — Western Addition, a unit in neither
  `zones` nor `declined`. **A third orphaned Article 10 number**, alongside wave 1's LM 21, LM 159
  and LM 195.
- **Theodore Roosevelt Middle School, 460 Arguello Boulevard (LM 285, 2019)** — EAS Presidio Heights,
  and the Article 10 APN `1061049` matches the Presidio Heights parcel. Presidio Heights is a zone in
  no wave. **A fourth orphaned Article 10 number.** If a later wave places it: built 1929–1930,
  Timothy Pflueger, three New Deal murals — two by Horatio Nelson Poole in the main lobby, one by
  George Wilson Walker in the auditorium. **Both of noehill's phrasings are banned.**
- **Angelo J. Rossi Playground, 600 Arguello Boulevard** — EAS Lone Mountain/USF, no page. 7.08
  acres. **"The largest Rec & Park holding anywhere near the zone" is a superlative and publishes in
  no zone**; the acreage does.
- **Dressler / Garfield Building (LM 244)** and **Islam Temple / Alcazar Theater (LM 195)** — §1.1.
- **Park Presidio Boulevard**, **the Waybur House (NRHP 11000143)**, **the Golden Gate Bridge as a
  place row**, **The Midway (900 Marin Street)**, **Sutro Tower**, **Potrero Power Station** — §1.3,
  §1.6, §1.7, §2c.
- **Walter Haas Playground, Topaz Open Space, George Christopher Playground, Glen Canyon Park** —
  §2e.
- **Rosa Parks Elementary / JBBP (1501 O'Farrell)** — §2a.
- **The Hobart Building, the Mutual Savings Bank Building, 735 Market Street, the Palace Hotel, Bix,
  the California Street cable car line** — **already shipped**, §1.1. Not orphans; collisions.
- **The Path of Gold Light Standards (LM 200)** — wave 1 §3a ruled it nobody's place and gave SoMa
  alone the right to name it in prose. **The Financial District may not claim it.** The **Golden
  Triangle Light Standards (LM 233)** are a different, smaller instrument and **are Union Square's**
  (§4-adjacent): they are confined to the retail blocks between Market and Sutter, nobody else claims
  them, and the register carries the number.

### 5.1 Dead, closed or unwritable — not a boundary question

- **The Wells Fargo History Museum.** `wellsfargohistory.com/museums/` 301s to `history.wf.com`,
  which carries **no museum listing, no address and no hours anywhere**. **The `financial-district`
  roster draw names it as a marquee subject and it cannot be written.** Escalated to the coordinator:
  **the roster draw is stale.**
- **The Union Square Alliance.** `unionsquarealliance.com` fails certificate verification and returns
  **403** when the certificate is bypassed. **Twenty-five Union Square candidates rest on it alone
  and all twenty-five drop**, and five more lose every description it supplied. This is the single
  largest content loss in the wave.
- **ICA SF** sits in the business registry at 901 Minnesota Street with a null end date while its own
  site places it at the Transamerica Pyramid Center. **A null end date means the tax registration is
  open, not the door.** Dogpatch's finder produced this catch and it is the best methodological work
  in the wave; **it binds every remaining zone.**
- **Confirmed closed:** Saks Fifth Avenue, 384 Post (2025-05-10) · Farallon (2020-03-16) · Lefty
  O'Doul's, 333 Geary (2017-02-01) · Alexander McQueen, 58 Geary (2023-06-30) · Serpentine ·
  Neighbor Bakehouse · Triple Voodoo · Workshop Residence · Poquito. **None is written and no page
  explains that they closed.**
- **Dead or hijacked hosts:** `foliosf.com` now redirects off-domain to `gairloch-fishing.co.uk`
  serving gambling spam · the Buddhist Church of San Francisco's domain, likewise · `charliescorner.com`
  returns 200 with zero bytes · `hiddengardensteps.org` resolves to a tree-service company in
  Longview, Texas · `innersunsetfarmersmarket.com` fails DNS · `katias.com` 404s · `stanne.com`
  serves St. Anne **School** at a different address · `sfmarkets.org` does not resolve ·
  `staroftheseasf.com` is an unrelated site. **None is a source, and no page mentions that any of
  them was tried.**
- **UC Hall, 533 Parnassus Avenue** — the frescoes were removed in 2021 and the building torn down. A
  reader sent there would find neither. **LM 289 may be cited in prose about the frescoes as objects;
  it may not anchor a visitable place at that address.**
- **The Japantown Peace Plaza is an active construction site**, per Rec & Park's own update of 2
  September 2026: Saturday work through September and October, waterproofing around the pagoda,
  fenced seating nooks, and posted pedestrian detours **through the centre of the plaza**. **A page
  describing it as walkable today would be wrong.** Write it as a fact about the plaza from its
  owner. Do not write a percentage of paint completed.

---

## 6. DESIGNATION CLAIMS — the register, the identifier, and what dies

### 6.1 The gate mechanics, restated because two zones nearly shipped a build failure

`@designation_claim` fires on **designated, listed, landmark(ed), registered, nominated**.
`@designation_citation` accepts **only** `San Francisco Landmark [District] No./number <digits>`,
`Article 10`, `National Register [of Historic Places]`, `NRHP`, `NR reference`, or `reference number`
+ six or more digits. `prose/1` tests each `summary`, `history` and entry `note` **as a whole
string**, so claim and citation must live in the **same field**.

**TWO NEW MECHANICS, both caught in wave 2, both binding corpus-wide:**

1. **"Article 11" IS NOT AN ACCEPTED CITATION.** The alternation contains `Article\s*10\b` and
   nothing for 11. So *"…is listed as Category I under Article 11…"* trips the claim regex, finds no
   citation and **fails the build**. Even a named, numbered Article 11 conservation district would
   not pass. **Never write "Article 11" beside any of the five claim words.**
   > SAFE: *"The Merchants Exchange at 465 California Street carries Category I under Article 11 of
   > the San Francisco Planning Code."*
   > FAILS: *"…is listed as Category I under Article 11…"*
   This kills the Westin St. Francis's only "designation" and every `A*` parcel line.
2. **The word "REGISTERED" trips the designation gate.** Union Square and Inner Richmond lean on the
   business registry harder than any shipped zone. *"Apple has been registered at 300 Post Street
   since 2016"* is a designation claim as far as the gate is concerned. **Write business facts
   without "registered", "registration" or "the registry lists":** *"Apple Union Square is at 300 Post
   Street"* and *"the city's business records give a start date of 21 May 2016."*

**Three registers that still do not satisfy the citation pattern** (wave 1 §6a, unchanged): National
Historic Landmark · California Historical Landmark No. N · any National Trust programme label. Each
publishes **only in the same field as** an SF Landmark number, an Article 10 citation or an NRHP
reference number. **Every NHL in wave 2 — the Presidio (66000232), the Bank of Italy (78000754), the
cable cars (66000233) — must carry its NRHP reference number in the same field.**

**"Eligible" is not "listed."** No register word attaches to: the Third Street Industrial District,
Bridges and Tunnels or the SF General Hospital district (Dogpatch) · the Irving Street and 15th Avenue
Neighborhood Commercial district or the 1952 Firehouse Bond Act Thematic District (Inner Sunset) · the
three Inner Richmond survey districts · the seven Noe Valley rows · the Japantown Community & Cultural
Historic District. **"Eligible" does not trip the claim regex and is the honest word.**

**The Japantown Cultural District is a field value, not an instrument.** No resolution, no ordinance,
no boundaries. **Do not claim it as a designation.**

### 6.2 KILLED — claims that survived a finder or a verifier

| # | Claim | Ruling |
|---|---|---|
| 1 | **NRHP 86001014, King Philip / Reporter shipwreck site**, and **NRHP 76000176, Point Lobos Archeological Sites** | **KILLED, and this is the wave's most dangerous survivor.** The finder presented California OHP rows `N1441` and `N445` as cross-checks **of the reference numbers**. Both OHP pages resolve and carry exactly four fields — name, registration date, location, county — and **no National Register reference number**. The NPGallery fallback asset reads, in full, *"The PDF file for this National Register record has not yet been digitized."* It names no property. A nationwide `RESNAME` query for King Philip or Point Lobos returns one feature: **King Philip Mills, 83000687, Fall River, Massachusetts.** **Both numbers DROP.** The wreck site survives on non-designation facts; the archaeological district does not survive at all. |
| 2 | **NRHP 100006997, Alberta Candy Factory** | **KILLED as a claim; the place DROPS.** The finder sourced it to "NPS `nrhp_locations` layer 0 queried by bbox and by refnum"; that query returns **zero features on layers 0 and 1, by reference number and by resource name**. Its verifier proved four federal routes can neither confirm nor deny it and recommended against publishing; I adopt that. It rests on the Wikipedia NRHP table alone. Wave 1's worst error was a fabricated reference number that "reads as authority" — this one cannot be stood up, and beyond it the place has no construction date, no architect and no account of what the building is. |
| 3 | **NRHP 100012857, Kinmon Gakuen**, and any 2026 National Register listing for it | **KILLED**, confirming wave 1 §6b #5. Zero features by refnum and by name. **LM 288 (2019) is solid; the federal claim must not be written.** |
| 4 | **The Article 10 district claim for Bush Street–Cottage Row** | **KILLED on evidence, not suspicion.** `m22e-6hkz` gives `origin = "National Register"`, so `dateadop` is inherited from the Keeper's entry rather than recording an ordinance. There is no district number, no ordinance and no appendix. **Cite NRHP 82000983 alone.** |
| 5 | **"Appendix L" for the Dogpatch Historic District** | **KILLED.** The finder asserted it and admitted in its own §7 that it never opened the appendix, because the American Legal page is a JavaScript shell. An appendix letter nobody read is not a citation. **Ordinance 66-03, adopted 18 April 2003, is verified and is enough.** Also **drop the Wikipedia year 2002** — `dateadop` is 2003-04-18 and 66-03 is consistent with 2003. |
| 6 | **Any National Register claim for the Dogpatch Historic District** | **KILLED.** The row carries `nr: No`. It matters because the neighbouring **Union Iron Works** district *is* federally listed and the two sit one paragraph apart. |
| 7 | **NRHP or landmark status for the Curran Theatre** | **KILLED on three independent checks** — absent from all 370 Article 10 rows by name and by address, absent from NPS layer 0, absent from NPS layer 1. **Write no reference number and no landmark number for the Curran.** |
| 8 | **Any protection sentence for Temple Emanu-El** | **KILLED.** No Article 10 row; a zone-wide NRHP sweep of Lake/Arguello/Clement/Funston returns exactly one San Francisco feature, and it is St. John's. Confirmed twice. **Not "historic", not "landmark", not "listed."** |
| 9 | **"Named a National Historic Landmark in 1964" for the cable cars** | **KILLED**, confirming wave 1 §2. `Is_NHL = X` is in the record; **the 1964 date is not.** Cite NR 66000233, certified 15 October 1966. |
| 10 | **Article 11 for the Crown Zellerbach Building** | **KILLED.** There is no row for 1 Bush Street and none whose name contains Zellerbach. LM 183 (**1987**) is sound; the Article 11 sentence is invented — and would fail the build anyway (§6.1). |
| 11 | **Any National Register claim for the Northeast Waterfront Historic District** | **KILLED preemptively.** `a10: Listed`, `origin: Ord. 171-83`, `nr: No`. Nobody made the claim; nobody downstream may. |
| 12 | **"National Historic Civil Engineering Landmark, designated 1969"** (Alvord Lake Bridge) | **PUBLISHES.** The register is named, ASCE issues no numbers, and the nomination carries the designation twice — once in narrative and once as a standing entry in its own resource inventory. Write it as the nomination has it and attach no number. The finder asked; the answer is yes. |
| 13 | **The Sally Brunn Library's National Register status** | **KILLED.** The ordinance says the board found the building *eligible* under Criteria A and C. Eligible is not listed, and the NPS query returns zero listed properties inside Noe Valley. |
| 14 | **George Washington High School, NRHP 100013126** | **UNVERIFIED — must not be repeated as a fact.** Absent from the layer the file used for everything else. Nothing is claimed on it. |
| 15 | **NRHP 100008498's listing date** | **NOT KILLED — SUSPENDED.** The number is real (RESNAME "Bethlehem Shipbuilding Corporation Hospital", 331 Pennsylvania Ave.). NPS `CertDate` renders **6 January 2023**; Wikipedia says **29 December 2022**. **Write the reference number and no date** until one is settled against the nomination or the weekly list. |

**Two register-name and address corrections carried forward:** the Article 10 designation-document
host is **`files.sfplanning.org/documents/preservation/LM<n>.pdf`** for most rows and
**`sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf`** for LM 138 — research-facing only, but
a later wave will otherwise follow a dead path. And the NPS reference-number field is **`NRIS_Refnum`,
not `REFNUM`**; a `REFNUM IN (...)` query 400s, **which is how a verifier gets a false "not listed."**

### 6.3 Numbers that survived, and the two zones that got everything right

Golden Gate Park claimed thirteen identifiers and thirteen survived. Union Square claimed thirty-eight
and thirty-eight survived, with **zero corrections**. The Financial District claimed seventy-nine and
seventy-nine survived. Japantown's nine Article 10 numbers and four National Register references all
survived, with one day-level date corrected to a year. **That is the part a verifier exists to break,
and in four zones it did not break.**

### 6.4 THE TALLY BAN — binding on all eleven, and four files broke it

Wave 1 §9.7 extended North Beach's ruling to all twelve zones. **I extend it to all twenty-three, and
to counts of contributing resources and eligible districts as well as of landmarks.** Every count
produced in wave 2 was wrong or self-contradicting:

- **The Financial District's §4 heading says "SIXTEEN NUMBERED LANDMARKS" over a table of seventeen
  rows** — Castro's defect exactly. Its §2 says "49 Article 10 landmark numbers" and then cites
  fifty-one of them; its "77 designation identifiers" only sums one way.
- **Noe Valley's finder counted the eligible districts and got six. There are seven** — the seventh
  is a mislabelled North Point row filed under `neighborhood = Noe Valley`, which is the point. The
  same file correctly refused to count its own four landmarks and said so.
- **Inner Sunset's headline reads "9 designation identifiers across 8 distinct properties."**
- **Union Square's own tier justification is a tally** — "at least sixteen Article 10 landmark
  numbers… ten National Register reference numbers."

**No page, no section heading, no FAQ answer and no tier justification may carry a count of
designations, contributing resources, contributors, or eligible districts.** The registers gain rows:
the highest landmark number is **335** today. **Golden Gate Park has 133 contributing resources this
month.** Name the buildings, cite their numbers, count nothing.

**A count of ordinary things still publishes** and the distinction is worth stating, because four
files blurred it: 163 steps and 90 feet at the 16th Avenue Tiled Steps · four columns in the Union
Square Colonnade · 138 guest rooms and 564 theatre seats at Marines' Memorial · Britex's 75,000 button
styles · "20 residences, a walkway and a small park" in the Cottage Row nomination · **"seventeen
Endicott-era gun batteries constructed, armed and manned between 1891 and 1946"**, which is NPS's
count of what the Army built. **A count of what survives does not.**

### 6.5 `landmarkno = 0` — still forty rows, still not landmark number zero

Confirmed independently by four more verifiers. New wave-2 members of the list, none of which may
carry a designation sentence in any zone: **the Peace Pagoda** (1610 Geary) · **Kezar Stadium** ·
**the Stow Lake Boathouse** · **the Japanese American Citizens League** (1765 Sutter) · **the Western
Addition Branch Library** (1900 Geary) · **the I. Magnin Building** (251–259 Geary) · **the Alcoa
Building** · **Residence at 2 Clarendon Avenue** · **Mel's Diner Sit Ins** (3355 Geary) · **the Office
of Dr. Carlton B. Goodlett** (1843–1849 Fillmore) · **Congregation Emanu-El School Buildings** (1337
Sutter) · **the National Urban League SF Chapter** (2015 Steiner) · **the Strand** (1127 Market).

**And the designation work programme must not reach any page.** Japantown's JACL building sits on
Planning's work programme; a pending process is not a fact about a building, and writing "is on
Planning's work programme" is a page narrating a status rather than describing a place.

### 6.6 The Legacy Business Registry — ruled once, corpus-wide

Inner Sunset asked and its answer is right, so I make it binding for every zone. `Established_Date`
is a field in a **City register** a business must document to be certified, arriving attached to a
nomination number — not the operator's own marketing. **It publishes only when cited to the registry
with the nomination number in the same sentence, and never bare:**

> The Legacy Business Registry certified it on 3 October 2016 under nomination number LBR-2015-16-022
> and records the business as established in 1967.

A bare *"since 1967"* DROPS. **And the date attaches to the door the business started behind, not to
a later branch** (§1.2). **Everything else in a registry row is the applicant's own submission**:
Ambiance's *"proud of our multiple awards for 'Best Boutique'"* and San Francisco Women Artists'
*"Beautiful Gallery ~ Incredible Artworks!"* are advertising, and drop.

**A `location_start_date` in the general business register is a tax registration date and is not
this.** It publishes in no form as a founding date or trading duration. **`1968-10-01` is the
register's bulk-load floor value** — it appears on Green Apple, See's Candies, Busvan, four
building-owner rows, Britex at both addresses, Hoogasian Flowers, Tiffany and the Chancellor Hotel.
**It establishes nothing about when anything opened.**

---

## 7. TIER RULINGS

The gate is arithmetic and both floors are hard: **town-page is fewer than six places**, with a
90-word intro floor and two outbound links; **guide is at least four places**, a **100–160 word**
intro (the test rejects both under and over), **four to six** FAQ entries, and a section headed
**exactly** `Getting there`. Wave 1 shipped two files marked town-page carrying 41 and 26 places and
the gate now fails that.

| Zone | Tier | Surviving after this file | Note |
|---|---|---|---|
| `japantown` | **guide** | 34 **+ the ten north-of-Sutter returns** = **~45** | §2a. Note what the tier does **not** rest on: its verifier reached 34 having ruled the institutional heart out. Thirty-four made the form; forty-five makes it the neighbourhood everyone means. Those are different arguments and the first must not settle the second. |
| `financial-district` | **guide** | 34 uncontested **+ the Kearny-east awards** = **~50** | Clears before any ruling is applied. |
| `union-square` | **guide** | 23 uncontested **+ Maiden Lane, the Market north side, the Geary block, wave 1 §4b** = **~41** | Its own GUIDE reasoning was a tally; the tier is right and the reasoning must not survive into prose. |
| `inner-richmond` | **guide** | **62** | Thirty-nine are register-only shopfronts with a name, an address and a kind. That is a real corridor honestly described, and the prose must carry its weight on the seven entries that have more — St. John's, the Carnegie branch, the Campfire Girls Building, the Internet Archive, Burma Superstar, the Plough and Stars, Cinderella — and **must not inflate the rest to compensate.** |
| `inner-sunset` | **guide** | **19**, and **11 on the most hostile reading** | The finder's town-page verdict is wrong on three independent grounds and its verifier is upheld. Golden Gate Heights, Parnassus Heights, Forest Knolls, Forest Hill and Ashbury Heights **have no pages**; Twin Peaks is declined. **Nothing can be lost to a polygon that has no page.** |
| `dogpatch` | **guide** | **23**, **24 with Bethlehem** | Clears six on its anchors alone and is not conditional on any escalation. |
| `mission-bay` | **guide, provisionally** | **unknown — the page does not exist** | On its roster draw plus the two wave-1 reservations it starts at four (Chase Center, the UCSF campus, Mission Creek, the Third Street Bridge, the Garcia and Maggini Warehouse) and will comfortably clear the guide floor. **§0.** |
| `noe-valley` | **guide** | 21 **+ Portola, La Ciccia, Billy Goat Hill and the two Liberty districts** = **26** | §2e. Never near the town-page line, so the 90-word floor never binds. |
| `presidio` | **guide** | **32**, **34 if both awardable straddlers land** | The finder's town-page recommendation is overruled and its verifier is upheld. Its reasoning — no high street, no continuous frontage, named places two and three miles apart — **is sound and irrelevant**: `tier` is a size class, not a shape class. The real worry is answered by **writing the guide by district**, which is what `Getting there` is for. |
| `golden-gate-park` | **guide** | **92**, **72 if every straddler landed elsewhere** | The fifty remaining survivors are monuments, fountains, tunnels, gates, plaques and single sculptures. **They are prose inside a place, not places. Seed the Music Concourse and write the statues into it.** |
| `ocean-beach` | **guide** | **15**, and **11 on the thinnest reading** | **Changed from TOWN PAGE by §2d.** |

### 7.1 The two-link floor — dissolved, not solved

I was asked to solve the floor for Ocean Beach and Noe Valley rather than leave it in the author's
lap. **Neither needs solving: both are guides.** Noe Valley was never close, and Ocean Beach's town
page existed only because the headland had been ruled away from it.

Both should still carry outbound links, and the natural ones are unchanged: **`ocean-beach` →
`guide:golden-gate-park-guide`** (the Great Highway edge ruled to the park at §1.5 — the Beach
Chalet, both windmills and the Amundsen monument) and **`guide:presidio-guide`** (Baker Beach, the
Coastal Trail and the GGNRA administration they share). **`noe-valley` → `guide:castro-guide`** (Noe
Street runs between them and the Castro owns the Noe Street market) and **`guide:mission-guide`**
(Dolores Street is the shared edge and the Liberty Hill question sits on it).

**No link note may say why.** `@self_reference_patterns` fires on
`\bbelongs? to \w+(?:'s)? (?:page|guide)\b` and on `\bon this page\b`. **The link is the mechanism; it
needs no narration.**

### 7.2 Kinds — the closed list of thirteen, and twenty-two inventions in one file

`museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium
attraction`. **The Presidio file used roughly twenty-two kinds that do not exist** — `nature-site`,
`beach`, `viewpoint`, `artwork`, `cemetery`, `memorial`, `pier`, `trail`, `bridge`, `visitor-center`,
`campground`, `golf-course`, `church`, `square`, `street`, `playground`, `transport`, `events-venue`,
`picnic-area`, `office-campus` and more — and spelled **`theatre`** where the schema wants
**`theater`**. Rome shipped three invented kinds and the changeset rejected them at seed time,
surfacing in unrelated suites.

New wave-2 mappings, on wave 1 §7.2's pattern: a beach, a lake, a meadow, an open space, a community
garden or a campground → **`park`** · a trail, a walk, a street, a gate, a plaza, a garage, a visitor
center, a library, a public artwork, an events venue, a viewpoint, a bridge approach → **`attraction`**
· a church, a temple, a battery, a fort, a cemetery, a memorial, a bridge, a designated house →
**`historic-site`** · a working church a visitor can enter → **`attraction`** · Chase Center →
**`stadium`** · Kezar Stadium → **`stadium`** · Osaka Way is a Public Works street, not a Rec & Park
park → **`attraction`, never `park`** · the Union Square plaza → **`park`** (`Civic Plaza or Square` is
the city's property-type string, not a schema kind, and must not go in the `kind` field).

**Do not create a second place record for an artwork inside a place you are already writing.** The
Beach Chalet frescoes fold into the Beach Chalet · the three Hamilton artworks into Hamilton Rec
Center · the two Asawa *Origami Fountain* pieces stand as their own subject on Osaka Way but **there
are TWO, not three** — the third row, accession `1999.22.1-2` titled "Origami Fountain**s**", is a
combined record of the same two objects · the Wowhaus, Corliss and Anderson pieces fold into the Noe
Valley parks that hold them · the Dewey Monument and the Colonnade fold into Union Square · the
Steinhart Aquarium and Morrison Planetarium fold into the Academy · *Tree Fall* carries the Powder
Magazine, not the reverse.

### 7.3 Slugs

Every wave-2 slug must survive `assert_place_slugs_globally_unique!/0` against **4,389 places across
349 files** — not the 468 San Francisco places, and not the 1,279 that `.superpowers/taken_slugs.py`
can see. Ruled:

- **Every Financial District place slug carries a `-financial-district` suffix.** Manhattan's
  `financial-district` seed file owns `the-battery` and `trinity-church-wall-street` under bare slugs,
  and the roster resolves only the destination-string half of this collision.
- `union-square-plaza-san-francisco`, never `union-square-park` (Manhattan's).
- `james-flood-building-union-square`, never anything confusable with Nob Hill's
  `flood-mansion-pacific-union-club-nob-hill`.
- `souvla-dogpatch` against shipped `souvla-hayes-valley`. **Dogpatch's finder ran the collision test
  correctly on Arsicault and then declared "no candidate below collides", which is false.**
- `arsicault-bakery-inner-richmond` (397 Arguello) and `arsicault-bakery-dogpatch` (2565 3rd St
  #202), both against the code seed's `arsicault-bakery-mission-rock`. Three shops, three slugs.
  Dogpatch's ships only if its author fetches the operator's own site.
- `piccino-dogpatch`, keeping clear of wave 1's Piccino Presidio.
- `humphry-slocombe-dogpatch`, against unshipped Ferry Building and Capp Street rows.
- `green-apple-books-inner-richmond` and `books-on-the-park-inner-sunset` (§1.2).

**The tooling defect is now three waves old.** `.superpowers/taken_slugs.py` globs
`priv/seed_data/rome/*.json` only, cannot see `lib/`, and every wave-2 file that checked found it
independently. `.superpowers/vf_taken_all.py` is the correct tool. **Escalated again: fix the glob to
`priv/seed_data/**/*.json` and append the seven code-seed slugs before any further wave runs.**

---

## 8. PROSE — what survived a verifier and must not reach an author

`"photos": []` everywhere, in every zone, without exception.

### 8.1 Superlatives confirmed present at source and killed here

**Live regex ammunition, which would fail the build outright:** NPS's *"the **northernmost** outpost
of their empire"* (Presidio) · *"the **westernmost** border of San Francisco"* (Ocean Beach) ·
*"Wright's **only** San Francisco building"* and any `Proper-noun's only` construction · SFPL's *"the
**first** library building **in San Francisco** constructed with Andrew Carnegie grant funds"*.

**Banned by the rule though the regex misses them** — and this is most of them: Fort Point's *"the
only fortification of this impressive design constructed west of the Mississippi River"* ·
presidio.gov's *"the largest collection of works by artist Andy Goldsworthy on public view in North
America"* · *"One of San Francisco's oldest buildings"* (Officers' Club) · *"the first National
Cemetery on the west coast"* · *"One of the oldest foot trails in the Presidio"* · *"one of just two
campgrounds in San Francisco"* · *"the largest windmill of its kind in the world"* (Murphy Windmill) ·
*"the largest lake in Golden Gate Park"* and *"the largest bedrock hill in the park"* · *"the first
application of Olmsted park design priciples in the western United States"*, typo and all, **which
sits in `m22e-6hkz` objectid 158 as well as in the nomination and will be rediscovered** · *"the first
public lawn bowling green in the United States"* · *"the last example… in the United States"* (Camera
Obscura) · *"the last surviving building from the Sutro era"* · *"the last remaining nondenominational
place within San Francisco to memorialize loved ones"* (Columbarium) · *"the first lesbian-rights
organization in the United States"*, **which is the Lyon-Martin ordinance's own finding and is barred
anyway — the rule says from any source, attributed or not** · *"the first independent Japanese YWCA in
the United States"* · *"TREA, San Francisco's largest residential housing developer of the 1870s"* ·
*"one of the six most important Victorian structures chosen by the San Francisco Landmarks
Preservation Advisory Board"*, **which appears in BOTH the 73000443 and 73000444 nominations and
publishes in neither** · *"the Bay Area's only culinary bookshop"* · *"the largest firehouse building
campaign undertaken by the City"* · *"One of the oldest arts organizations in California"* · *"the poor
man's Frank Lloyd Wright"* and *"a master builder"* (Doelger, by attribution) · LM 289's *"an excellent
example"*, *"master artist"*, *"the largest, most immersive fresco buono work of Zakheim's career"* and
*"the last fresco commission the artist completed in San Francisco"* · the 1976 Planning survey's 0–5
ratings, which are a ranking in numeral form · *"the largest Rec & Park holding anywhere near the
zone"* · *"the ONLY Rec & Park property whose `mons_neighborhood` reads Dogpatch"*, **which is true, and
is a superlative, and is a statement about a dataset field** · *"the oldest surviving public school
building in the city"* · *"one of the largest mixed-use complexes in the Western United States"* · *"the
second tallest building in San Francisco"* and *"the most recognizable landmark on the San Francisco
skyline"* · *"the oldest, continuously run restaurant in California, and third oldest in the United
States"* · Michelin, James Beard and "Best Boutique" awards from any source including a City register.

**Two counts wearing hats, which are the subtlest form and both nearly shipped:** the Golden Gate Park
Senior Center's *"one of only three park buildings that face outward"* — the nomination's actual
sentence is *"the **only** building in the park, other than the Beach Chalet and the Park Emergency Aid
Station, that is…"*, **an only-construction repackaged as a count.** And Inner Sunset's *"the only
formal recognition the Irving Street commercial strip carries"*, **which is a superlative and factually
wrong, since a second eligible district sits in the same polygon.**

### 8.2 Trading duration and founding years — wave 1 §8.3 restated and reapplied

**A dated event in a *structure's* history publishes. A founding year or a duration for an
*organisation or a business*, taken from that body's own site, does not.**

Dropped, every one confirmed present at source: *"In operation since 1893"* (Blue Heron Boathouse) ·
*"SINCE 1996"* (Beach Chalet restaurant) · *"Since 1993"* (Peasant Pies) · *"Founded in 1983"*
(Ambiance) · *"Since 1995"* (Noe Valley Bakery) · *"Est. 2008"* (Omnivore) · *"for over 100 years"*
(Drewes Bros.) · *"since 2006"* (Park Life) · *"since 1911"* (Schubert's) · *"the original restaurant"*
(Burma Superstar) · *"Since 1930"* (Konko Church) · the 1934 Sokoji founding · *"Since 1854"*
(Mechanics' Institute) · *"founded in 1938"* (Sears) · *"Since 1908"* (John's Grill) · *"more than seven
decades"* and the 1952 move (Britex) · *"Since 1946"* (Marines' Memorial) · *"Over a century old"*
(Sonesta) · *"Serving San Francisco since 1849"* (Tadich) · *"over the past 75 years"* (Sam's) ·
*"Originally founded in 1893"* and *"for the past 120 years"* (Schroeder's) · *"Founded in 2003"*
(Quince) · the Presidio Golf Course's **1895** — *"a founding year on the operator's own page, and the
sentence carrying it also carries 'one of the oldest courses on the West Coast'"* · the Walt Disney
Family Museum's founding year, correctly withheld — **do not restore it** · the Inn at the Presidio's
*"a former home to unmarried Army officers"*, **a historical claim about a building sourced only to the
business trading in it** · the Lodge at the Presidio's *"Among the registered Historic Hotels of
America"*, **a membership programme, not a register with an identifier** · the Museum of Craft and
Design's *"opened in spring 2013"* · Crane Cove Park's 2020.

**A third-party source rescues the fact only if the author names and fetches the article.** Fort Mason
Center's 1976 remains the model.

### 8.3 Research-method leaks, self-reference and orientation

**Banned and confirmed present:** *"the shop's name and its street do not agree, which is worth a
sentence"* (Inner Richmond — **the page adjudicating its own material**) · *"the Russian institution
the roster draw is reaching for"* (**the page ranking its own contents against its brief**) · *"the
only one of the four individual designations that does"* (Dogpatch — **a superlative about the file's
own polygon test**) · *"the hub of the Inner Richmond"* · *"the thing you see from Grand View Park"* ·
*"one hill east of anything else on this list"* · *"the northern lip of Forest Hill"* · *"lies nearly
hidden at the southern edge of the Presidio"* · *"the edge of the city — and the continent"* · *"in the
Dogpatch neighborhood" is fine as the Port's own words about its own park; "within one block" of a
Muni stop is not* · *"separated from the rest of the park by the busy Kezar Drive… have little
relationship to the rest of the park"* — **the named street may be written; "busy" may not** ·
*"nestled within the industrial central waterfront"* is the Port's own copy and survives only because
it is a description of the park, not a distance.

**No page may narrate a dataset disagreement.** Not the two Arguello readings, not the two Rec & Park
names for the 10th Avenue & Clement park, not the Bufano row that files itself in Lower Pacific
Heights and Japantown at once, not the Western Addition Branch Library's zero-row twin at 1900 Geary,
not the Cottage Row nomination's two date ranges, not the two boundary readings of anything. **The
page states where things are and stops.** Those facts belong in the research files and I have
preserved every one of them here.

**No absence announcements.** *"There is no National Register listing here"*, *"no monument"*, *"this
page carries no…"* are editorial self-reference and fail the gate. **The sanctioned form for a silent
source is always about the world:** *"No source states its opening hours, so none are given here."*
Not *"no hours were obtained."*

**Say nothing about why a photograph is absent** — not for the Goldsworthy pieces, not for the Beach
Chalet frescoes, not for the Zakheim frescoes, not for the 16th Avenue mosaic, not for the Asawa
fountains, not for the Bufano, not for the Dewey Monument, not for Lotta's Fountain, not at all.
**Describe the thing instead.**

### 8.4 Live-status facts an author must not write past

The Japantown Peace Plaza under construction with posted detours through its centre · the Museum of
Craft and Design's and Letterform Archive's full hours and prices, which are the spine of Dogpatch ·
*Tree Fall* **"Closed until further notice"** — set `status: "closed"` and **let the field carry it;
do not narrate the closure** · the Presidio Pet Cemetery's construction-closure sentence, which is
stale and reads as a fact about the place — **drop it entirely**, and drop the anonymous caretaker or
carry the source's **"Legend has it"** hedge intact, because the finder rendered a legend as an event ·
the Curran's 2026 show dates, which are a live calendar and not a durable fact · ICA SF at the
Transamerica Pyramid Center, not at 901 Minnesota · Cinderella Bakery's Mission second location,
announced as "Coming Soon in 2026" in a shipped zone that is not this one.

---

## 9. WHERE I AM STRICTER THAN A VERIFIER — read this twice

**In every previous programme the Criticals were authors following the looser document. These are the
looser documents. Where a verdicts file says one thing and this section says another, this section
governs.**

1. **Union Square's §5G is overruled: LM 173, LM 143 / NRHP 02000371 and LM 167 are UNION SQUARE's.**
   Its verifier recommends *"Union Square does not take them"* and sends Notre-Dame-des-Victoires and
   Fire Station 2 toward Chinatown on the 117-unit layer. **Chinatown is shipped with 42 places and
   owns none of them**, and **wave 1 §4b assigned all three to Union Square by name.** Its §4.5 drop
   of LM 167 is likewise reversed. Following the verdicts file would orphan three Article 10 numbers
   and one National Register listing.

2. **Union Square must also drop the Mutual Savings Bank Building.** Its §7.5 lists **NRHP 13001107,
   700 Market Street** in the PUBLISH column. `soma.json` ships `soma-mutual-savings-bank-building` at
   700 Market Street — I read the file. The verifier caught the Hobart and 735 Market collisions and
   **missed the third one in the same block.** Restating it puts one building in two seed files, which
   is exactly the ground on which Golden Gate Park's Park Emergency Hospital was dropped.

3. **Japantown's §2 is overturned in full** (§2a). Its verifier ruled the zone stops at Sutter Street
   and shipped a Japantown without the Japanese YWCA, Kinmon Gakuen, the Bush Street Temple, Cottage
   Row, the JCCCNC and **Konko Church, which is named in the zone's own roster draw**. Wave 1 §4c had
   already awarded every one of them to Japantown, **having named and rejected the analysis polygon in
   the ruling itself.** An author following the verdicts file would publish the wrong neighbourhood.

4. **Ocean Beach's §3.B and its TIER RULING are overturned** (§2d). Its verifier ruled the Sutro /
   Lands End headland out of the zone and dropped to a five-place town page. Four of the ten places it
   expelled are **named in the `ocean-beach` roster draw**, and the ground is GGNRA, which the
   scope_ruling gives as the reason the page exists. **Ocean Beach is a GUIDE at fifteen places.**

5. **Noe Valley's §8 is overturned on Billy Goat Hill and on both Liberty districts** (§2e). Its
   verifier wrote *"the roster is wrong"* about a place named in the zone's own draw, and escalated
   Liberty Hill as *"unowned, and not Noe Valley's"* when **wave 1 §4e and §10.4 had already ruled both
   districts to Noe Valley on the identical draw sentence, against the identical address layer.**

6. **Golden Gate Park's S1 is overturned: the Panhandle is the park's** (§2b). Its verifier ruled
   DROP and left the strip unclaimed. **Wave 1 §4f had already awarded it**, and Haight-Ashbury is
   shipped without it, so "unclaimed" means "lost".

7. **Noe Valley's "if this ships anywhere, ship 37" is refused.** No contributing-resource count
   publishes, in any zone, in any form. §6.4. Its own §7 condemns exactly this defect two pages
   earlier.

8. **The Alberta Candy Factory's NRHP 100006997 does not publish and the place does not ship.** Its
   verifier ruled the number "neither confirmed nor disproved" and recommended against; **I make that
   binding rather than advisory**, because a reference number is the one thing on these pages that
   reads as unanswerable authority. Wave 1 §6b #1 was the worst thing in its wave for exactly this
   reason.

9. **The Presidio's `#2 Presidio of San Francisco` is the guide subject and not a place row**, and its
   **NHL date is the year 1962 with no day.** The verifier ruled both correctly; I restate them because
   the finder's day-level date and its "(1776 + 218 = 1994)" arithmetic are the sort of thing an author
   restores while tidying.

10. **Where two files disagree on a fetch, the one that got a response wins, and the failure is never
    recorded as a fact about the world.** Wave 2 repeats wave 1's pattern: `sfrecpark.org/CivicAlerts.aspx`
    (Japantown's headline place, one hop from a string the finder already held) · three NRHP nominations
    that npgallery served in the background after timing out in the foreground · three EAS addresses
    Inner Richmond reported as "no row" that all return **Inner Richmond** · `cotognasf.com` · the
    Mechanics' Institute hours, on `/about-us` rather than the two 404s tried. **Each cost a publishable
    fact and each was a claim about the research rather than about the world.**

11. **Three facts attributed to sources that do not carry them DROP**, named because they were
    presented with citations: the Mount Sutro **Rotary Meadow grant, the 80% eucalyptus share and the
    355-step Warren-to-Crestmont stairway**, none of which is on the Sutro Stewards page · **AMC Kabuki
    8's Cherry Blossom Queen Program**, in neither cited article · **Crane Cove Park's "swimming
    prohibited"**, which is not on the Port page — **an invented safety restriction, and the worst class
    of invention in the wave.**

12. **Union Square's §8.1 evidentiary rule survives; its worked example does not.** The finder built a
    general rule on `Johns Grill` ending 2012-01-01 while the site traded. Re-fetching 63 Ellis Street
    returns **four rows**, including `John's Grill Inc` starting **the same day** the first ended — a
    clean re-registration, exactly like Apple's Stockton-to-Post handoff the same file identified as
    clean. **The rule is good practice; the example is false and must not be repeated in any later
    zone's research.**

---

## 10. WHAT THE NEXT WAVE INHERITS

1. **Mission Bay must ship or the roster cannot close** (§0). It is the twenty-third zone, the
   `@tag :pending_san_francisco` assertion comes off when wave 2 lands, and there is no finder file.
2. **Kearny Street is the Union Square / Financial District line**, Market to Bush, and it reproduces
   wave 1 §4b without being told to (§1.1).
3. **Mariposa Street is the Dogpatch / Mission Bay line** (§1.7).
4. **The roster gaps have grown.** Wave 1 named four orphaned Article 10 numbers; wave 2 adds **LM 65
   (Trinity Episcopal, Western Addition)** and **LM 285 (Theodore Roosevelt Middle School, Presidio
   Heights)**, plus the Doggie Diner Sign (LM 254), the Mother's Building (LM 304 / NRHP 79000529) and
   City Cemetery (LM 306) at Lakeshore, Parkside and Lincoln Park. **Western Addition, Presidio
   Heights, Lone Mountain/USF, Seacliff, Sutro Heights, Lincoln Park, Glen Park, Central Waterfront
   and Lakeshore appear in neither `zones` nor `declined`.**
5. **Two roster defects to fix rather than write around:** the `financial-district` draw names the
   **Wells Fargo History Museum**, which no longer publishes an address or hours anywhere (§5.1); and
   the `japantown` draw says **"Buchanan Street Mall"**, which is Rec & Park's name for a 1.97-acre
   property at 1151 Buchanan stamped "Western Addition, Hayes Valley" — **a mile from the 1700 block
   the draw means, and in a shipped zone.** Japantown writes **Osaka Way**; the roster should say so.
6. **`.superpowers/taken_slugs.py` is still Rome-only, three waves on** (§7.3).
