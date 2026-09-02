# Ridgewood, Queens — VERIFIER verdicts

**Role:** Independent verifier. I re-fetched the finder's cited URLs myself and re-derived every
geographic assignment from raw polygons. I did not accept any finder string as a quote until I
re-matched it against source bytes I pulled. Where I confirm, I confirmed against the source, not
against the finder's reasoning.

## 0. METHOD — what I actually did

- **LPC PDFs (S1, S2, S4–S7):** downloaded all six from `s-media.nyc.gov` myself
  (LP-2325 2.4 MB, LP-1923 10.8 MB, LP-2081 19.5 MB, LP-2319 8.8 MB, LP-2348 20.0 MB,
  LP-2448 8.1 MB), converted with `pdftotext -layout`, and machine-matched **71 quoted passages**
  against the extracted text after Unicode/punctuation normalisation.
- **Web sources (S10–S21, S28, S32–S37):** re-fetched with `urllib` and a browser User-Agent,
  stripped to text myself, and machine-matched **74 quoted passages**.
- **Open-data APIs (S3, S8, S9, S17, S24–S27, S29, S39):** re-queried every one.
- **Wikipedia (S22, S23, S38):** pulled **raw wikitext** via the MediaWiki `action=parse` API.
  I did **not** use the WebFetch summarising layer, so every finder `[Q-2nd]` is now graded on
  actual source text.
- **Geography:** I downloaded NTA2020 (`9nt8-h7nd`) and NYC Parks Properties (`enfh-gkve`)
  GeoJSON and wrote my own ray-casting point-in-polygon test. For addresses I used **Nominatim**
  rather than DCP GeoSearch, because the finder's F001–F004 demonstrate GeoSearch mangles
  hyphenated Queens house numbers — a documented failure I independently reproduce below.
- **Local corpus (S30, S31):** read the JSON directly.

**Headline on the finder's accuracy:** it is unusually good. 143 of 145 machine-checked quoted
passages matched the source. Every apparent mismatch resolved to a PDF artifact
(footnote superscripts rendered inline as `Ridgewood2`; LP-1923 is two-column, so
`pdftotext -layout` interleaves the columns and splits sentences). The finder's three-way
`[Q]`/`[Q-2nd]`/`[P]` grading held up: **I found no paraphrase presented as a verbatim quote.**

That is not a reason to relax. The finder's errors are not in its quoting — they are in its
**inferences about its own sourcing**, and four of the eight refutations below are places where the
finder told the author something was unsourced when the finder's own cited source in fact says it.
Those under-claims are as damaging to a draft as over-claims, because they suppress publishable
material and, in one case, hid a sentence that closes the file's own headline gap.

---

## 1. THE FOREST PARK RULING — the wave's live question

**This is the most consequential finding in this file and it does not favour any of the three
wave-4 pages.**

The brief instructs me to say plainly if my sources put Forest Park inside Glendale. **They do
not.** They put it inside *itself*, and the corpus's own wave-3 precedent then decides the rest.

**V-FP1 — CONFIRMED. Forest Park has its own NTA, and it is a joint interest area.** From
NTA2020 (`9nt8-h7nd`), fetched by me:

| nta2020 | ntaname | ntatype | cdtaname |
|---|---|---|---|
| `QN8291` | `Forest Park` | **9** | `QN82 Forest Park (JIA 82 Approximation)` |
| `QN8191` | `Flushing Meadows-Corona Park` | **9** | `QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)` |

These two rows are **structurally identical**. Same `ntatype`, same "JIA … Approximation" CDTA
device. The wave-3 arbitration ruled that `QN8191` put Flushing Meadows Corona Park in **no
neighborhood file at all**. `QN8291` is the same object with a different name.

**V-FP2 — CONFIRMED. 96.8% of Forest Park's own area is in `QN8291`, and 0% is in Forest Hills.**
I took NYC Parks' own polygon for Forest Park (`gispropnum Q015`, `signname "Forest Park"`,
506.86 acres, address `80-30 PARK LANE`) and ran a 120×120 grid, keeping the 5,262 sample points
that fell inside the park:

| NTA | samples | share |
|---|---|---|
| `QN8291 Forest Park` | 5,091 | **96.8%** |
| `QN0901 Kew Gardens` | 134 | 2.5% |
| `QN0503 Glendale` | 16 | 0.3% |
| `QN0905 Woodhaven` | 15 | 0.3% |
| `QN0574 Highland Park-Cypress Hills Cemeteries (North)` | 5 | 0.1% |
| `BK0571 Highland Park-Cypress Hills Cemeteries (South)` | 1 | 0.0% |
| **`QN0602 Forest Hills`** | **0** | **0.0%** |

This **independently reproduces** the wave-3 verifier's sampling — centre in Forest Park, edges in
Kew Gardens, Richmond Hill and Glendale, **nothing in Forest Hills** — and it quantifies it. The
Glendale slivers are real but they are 0.3%. **Glendale does not contain Forest Park.**

**V-FP3 — REFUTES the wave-3 boundary arithmetic.** Forest Hills won the park in wave 3 partly on
"3.3 metres of shared boundary (against 567.9 m to Rego Park)". I measured the shared edge directly:
I walked the park polygon's 16,377 m perimeter at ~6 m spacing, offset each sample 25 m outward
along the boundary normal, and recorded which NTA the offset point lands in.

| What lies immediately outside the park boundary | metres | share |
|---|---|---|
| `QN8291 Forest Park` (its own JIA, at indentations) | 8,681 | 53.0% |
| `QN0905 Woodhaven` | 2,232 | 13.6% |
| `QN0901 Kew Gardens` | 1,937 | 11.8% |
| **`QN0503 Glendale`** | **1,359** | **8.3%** |
| `QN0902 Richmond Hill` | 1,178 | 7.2% |
| `QN0574 Highland Park-Cypress Hills Cemeteries (N)` | 514 | 3.1% |
| **`QN0602 Forest Hills`** | **409** | **2.5%** |
| `BK0571 Highland Park-Cypress Hills Cemeteries (S)` | 67 | 0.4% |

**Glendale has 1,359 m of shared boundary with Forest Park — 3.3× Forest Hills' 409 m.** Whatever
the wave-3 figures of "3.3 m" and "567.9 m" were measuring, it was not this geometry; a metre-scale
number for a 506-acre park's boundary is not a plausible measurement. Forest Hills is not merely
the weaker claim — among the park's seven neighbours it ranks **second-to-last**, behind Woodhaven,
Kew Gardens, Glendale and Richmond Hill.

**V-FP4 — RULING.** Forest Park belongs to **no neighborhood file**, by exactly the reasoning wave 3
applied to Flushing Meadows Corona Park. It is not Ridgewood's (see V-FP5), it is not Glendale's,
and the standing `forest-hills.json` assignment is the **worst-evidenced of all eight candidates**:
0.0% of area and 2.5% of boundary. I am not softening this to protect a shipped page — the brief
told me not to, and the evidence does not permit it. The coordinator should note that the shipped
record already hedges its own town field: `queens/forest-hills.json` carries
`slug = "forest-park"`, `name = "Forest Park"`, **`town = "Queens"`** (not "Forest Hills"),
`address = "80-30 Park Lane, Queens, NY 11415"` — and 11415 is a **Kew Gardens** ZIP. The record
itself declines to claim the park for Forest Hills.

**V-FP5 — CONFIRMED. Ridgewood does not touch Forest Park.** `QN0502` appears nowhere in the
adjacency table above. Forest Park is not a Ridgewood subject in any degree, and this page must not
reach for it. **No routing sentence is warranted either** — unlike the Citi Field case there is no
Ridgewood connection to route.

---

## 2. NEIGHBORHOOD ASSIGNMENT — the required per-place rulings

For each place: what the sources actually say, the exact street address string, and my ruling.
"Polygon" = my own ray-casting test against NTA2020. "Nominatim" = independent geocoder label.

### 2.1 RULED RIDGEWOOD — publishable, address confirmed

| Place | Exact address string | Evidence | Verdict |
|---|---|---|---|
| Vander Ende-Onderdonk House | `1820 Flushing Avenue, Ridgewood, NY 11385` | LPC open data `nta2020 = "QN0502"`, `bbl 4034120001`; polygon on LPC's own coords `-73.9195883, 40.7108101` → `QN0502 Ridgewood`; Nominatim → "Ridgewood, Queens"; museum: `"located in Ridgewood on the border of Queens and Brooklyn"` | **confirmed** |
| Ridgewood Theater Building | `55-27 Myrtle Avenue, Ridgewood, NY 11385` | LPC open data `nta2020 = "QN0502"`, `bbl 4034510007`; polygon on `-73.9074002, 40.7003955` → `QN0502`; Nominatim → "Ridgewood" | **confirmed** |
| St. Matthias RC Church Complex | `58-15 Catalpa Avenue, Ridgewood, NY 11385` | NRHP wikitext `city = Ridgewood, Queens`, refnum `12000599`; polygon → `QN0502`; Nominatim → "Saint Matthias Roman Catholic Church, 58-15, Catalpa Avenue, Ridgewood" | **confirmed** |
| Queens Public Library, Ridgewood branch | `20-12 Madison Street, Ridgewood, NY 11385` | Queens Library dataset `nta = "QN0502"`, `bbl 4034910001`, `bin 4083512`, `community_board 405`; polygon → `QN0502` | **confirmed** |
| Rosemary's Playground | `751 Woodward Avenue, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502`; NYC Parks: `"located in the Ridgewood neighborhood"` | **confirmed** |
| Starr Playground | `210 Onderdonk Avenue, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502` | **confirmed** |
| Grover Cleveland Playground | `3-96 Grandview Avenue, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502` | **confirmed** |
| Mafera Park | `65 Place and Shaler Avenue, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502`; see §2.3 for the Glendale caveat | **confirmed, with caveat** |
| Benninger Playground | `60-45 Madison Street, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502` | **confirmed** |
| Evergreen Park | `60-09 Saint Felix Avenue, Ridgewood, NY 11385` | Parks polygon centroid → `QN0502`; NYC Parks: `"Evergreen Park is located in the Queens neighborhood of Ridgewood"` | **confirmed** |
| Clemens Triangle | `Myrtle Avenue, Cypress Avenue and Cornelia Street, Ridgewood, NY 11385` (no street number in the dataset) | Parks polygon centroid → `QN0502`; NYC Parks: `"This park, located in the Queens neighborhood of Ridgewood"` | **confirmed** |
| Myrtle Avenue Clemens Triangle | `Myrtle Avenue, Cypress Avenue and Putnam Avenue, Ridgewood, NY 11385` (no street number) | Parks polygon centroid → `QN0502` | **confirmed** |

**V-P1 — CONFIRMED, independently re-derived.** I did not accept the finder's parks table. I pulled
NYC Parks Properties myself, filtered to Queens rows whose `communityboard` contains `405`
(39 rows), computed the **area centroid** of each polygon, and ran my own point-in-polygon test.
Exactly **eight** land in `QN0502 Ridgewood` — the same eight the finder lists. F085 confirmed.

**V-P2 — CONFIRMED. The four LPC historic districts, with `caldate` now verified.** The finder's
calendared column was not in the field I first queried; the dataset field is `caldate`, and it
confirms three of the finder's four:

| District | LP number | `caldate` | `desdate` | Verdict |
|---|---|---|---|---|
| Ridgewood North HD | LP-02319 | `2008-10-28` | `2009-09-15` | confirmed |
| Ridgewood South HD | LP-02348 | `2009-04-14` | `2010-10-26` | confirmed |
| Central Ridgewood HD | LP-02448 | `2010-10-26` | `2014-12-09` | confirmed |
| Stockholm Street HD | LP-02081 | *(not returned by my filter)* | `2000-11-28` | desdate confirmed; **caldate uncertain** |

All four carry `borough = "QN"`, `status_of_ = "DESIGNATED"`.

**V-P3 — CONFIRMED. The twelve DOE schools.** I re-queried `wg9x-4ke6` and filtered on the DOE's
own `nta_name`. Exactly twelve rows read `Ridgewood`, and they are the finder's twelve, addresses
matching. Notably:
- **Grover Cleveland High School, `21-27 Himrod Street`** — DOE `nta_name = Ridgewood`; my polygon
  test → `QN0502`; Nominatim → `"Grover Cleveland High School, 21-27, Himrod Street, Ridgewood"`.
  **F001 is confirmed as a GeoSearch failure: the school is in Ridgewood, Queens, not Bushwick,
  Brooklyn.** Three independent readings against one broken geocoder.
- **Middle Village Prep Charter School, `68-02 Metropolitan Avenue`** — DOE `nta_name = Ridgewood`,
  my polygon → `QN0502`, but **Nominatim labels it "Middle Village"**. This is a genuine
  conflict between postal/colloquial usage and the boundary data. Better evidenced: **Ridgewood**,
  on the DOE's own NTA field plus the official polygon. See the author warning in §5.

**V-P4 — CONFIRMED. Four subway stations are Ridgewood's.** Re-queried MTA `39hk-dx4f`:

| Station | Routes | MTA `borough` | polygon on MTA's coords | Verdict |
|---|---|---|---|---|
| Fresh Pond Rd | M | `Q` | `QN0502 Ridgewood` | Ridgewood |
| Forest Av | M | `Q` | `QN0502 Ridgewood` | Ridgewood |
| Seneca Av | M | `Q` | `QN0502 Ridgewood` | Ridgewood |
| Halsey St | L | `Q` | `QN0502 Ridgewood` | Ridgewood |
| Myrtle-Wyckoff Avs | M and L | **`Bk`** | `BK0402 Bushwick (East)` | **Brooklyn** |

### 2.2 RULED **NOT** RIDGEWOOD — the author must not claim these

**V-N1 — Myrtle Avenue BID office, `62-14 Myrtle Avenue`. RULING: GLENDALE.** Three independent
readings now agree against the finder's undecided C9. The City's own BID directory record says
`org_city = "Glendale"`. Nominatim returns `"62-14, Myrtle Avenue, Glendale, Queens"`. My polygon
test returns **`QN0503 Glendale`**. The same record's `org_neighborhood = "Ridgewood"` and the BID's
own `"in Ridgewood"` describe **the district it manages**, not the building it sits in. The
boundary the record itself gives — `"Myrtle Avenue from Wyckoff Avenue to Fresh Pond Road and
contiguous side streets including triangle parks"` — is Ridgewood's commercial spine and may be
narrated. **The office is not a Ridgewood place record.**

**V-N2 — Cooper Avenue Row Historic District, `6434-6446 Cooper Ave.` RULING: GLENDALE.**
Wikipedia's NRHP row assigns `city = Ridgewood, Queens` (refnum `83001765`, listed `1983-09-30`) —
I confirmed that row in the raw wikitext. But Nominatim and my polygon test both return
**Glendale**. **The Wikipedia locality field is wrong.** Drop it from the Ridgewood NRHP count.
⚠️ Note the trap: **Cooper Avenue crosses the line.** `56-06 Cooper Avenue` (Nowadays) is
`QN0502 Ridgewood`; `6434–6446 Cooper Avenue` is `QN0503 Glendale`. A draft cannot reason about
"Cooper Avenue" as a whole.

**V-N3 — Evergreens Cemetery, `1629 Bushwick Ave.` RULING: BROOKLYN.** Wikipedia's NRHP row says
`city = Ridgewood, Queens` (refnum `07001192`) — confirmed as the row's content. It is wrong. NYC
Parks says the cemetery is `"located along Bushwick Avenue on the Brooklyn-Queens border"` (verified
verbatim on the Evergreen Park history page). Brooklyn's ground.

**V-N4 — Ridgewood Reservoir. RULING: BROOKLYN'S, ALREADY SHIPPED.** Verified in the corpus:
`brooklyn/highland-park.json` carries `slug = "ridgewood-reservoir"`, `town = "Highland Park"`,
`county = "Brooklyn"`, address `"Within Highland Park, near Force Tube Avenue, on the
Brooklyn-Queens border, Brooklyn, NY"`, and its prose sentence
`"The Ridgewood Reservoir was built between 1856 and 1858 to hold drinking water, and was formally
decommissioned and drained in 1989."` is present verbatim. F010 confirmed. **The etymology may be
stated (LP-2081: `"Ridgewood was named for the reservoir…"` — verified verbatim); the reservoir may
not be claimed as a place.**

**V-N5 — Ridgewood Savings Bank, Forest Hills Branch, `107-55 Queens Boulevard`. RULING: FOREST
HILLS, ALREADY SHIPPED.** Verified: `queens/forest-hills.json` carries
`slug = "ridgewood-savings-bank-forest-hills"`, `town = "Forest Hills"`,
`address = "107-55 Queens Boulevard, Forest Hills, NY 11375"`, `county = "Queens"`. F008 confirmed.
The brief's name-collision warning is real and the finder handled it correctly.

**V-N6 — Myrtle–Wyckoff Avenues station. RULING: BROOKLYN, AND ALREADY NARRATED.** MTA
`borough = Bk` on both the M and L rows; polygon `BK0402 Bushwick (East)`. And
`brooklyn/bushwick.json` already carries the sentence verbatim:
`"Myrtle-Wyckoff Avenues is served by both the L and the M, and serves Bushwick and Ridgewood,
Queens together — Wyckoff Avenue forms the Brooklyn-Queens border at that point."` F014 confirmed.
**Link, do not narrate** — the wave-3 shape.

**V-N7 — Forest Park.** See §1. Not Ridgewood's, not Glendale's, not any neighborhood's.

### 2.3 CONTESTED — my ruling on which side is better evidenced

**V-C1 — Mafera Park. RULING: RIDGEWOOD, but the contest is real and must be stated.** NYC Parks
says, verified verbatim: `"During its early years, the park was known variously as Farmers Oval,
Ridgewood Park, and Glen Ridge Park. The latter name refers to the park's location on the boundary
between Glendale and Ridgewood."` The same page says `"the children of Ridgewood were able to enjoy
the play equipment"`, and its Glendale content is about the **Glendale Farmers Base Ball Club**, a
team, not a location. The polygon centroid is in `QN0502 Ridgewood`. Better evidenced: **Ridgewood**.
The Glendale boundary fact is good material and should be told as a boundary fact, not suppressed.

**V-C2 — Evergreen Park. RULING: RIDGEWOOD, decisively.** NYC Parks states it verbatim:
`"Evergreen Park is located in the Queens neighborhood of Ridgewood, bounded by Metropolitan Avenue
and Evergreen Cemetery."` Polygon → `QN0502`. GeoSearch's `Fresh Pond` is the outlier and
GeoSearch is the discredited instrument in this file. No real contest.

**V-C3 — The four NRHP districts Wikipedia files under `Middle Village, Queens`. RULING: leaning
RIDGEWOOD, but I did not geocode all four — treat as `uncertain`.** I confirmed the raw wikitext:
exactly four rows carry `city = [[Middle Village, Queens`, and they are the finder's four —
`Forest-Norman` (83001769), `Grove-Linden-St. John's` (83001772),
`Seneca-Onderdonk-Woodward` (83001779), `Woodbine-Palmetto-Gates` (83001783). The finder's F055 is
well made: `Woodbine-Palmetto-Gates` covers `"Roughly bounded by Forest and Fairview Aves., Woodbine
and Linden Sts."`, and LPC's **Ridgewood North HD** covers that same ground with entries on
Forest Avenue, Gates Avenue, Grandview Avenue, Palmetto Street and Woodbine Street — LPC calls it
Ridgewood. **Do not create place records for these four from this evidence.** The streets are
Ridgewood's and may be narrated as such; the NRHP district names should not be attached to a
neighborhood without a check I have not done.

**V-C4 — Onderdonk House county. RULING: QUEENS, unambiguously, today.** The finder is right that
three agencies tell three stories about the *past*, and I verified all three verbatim:
- LP-1923: `"In 1937 a county boundary adjustment by the State of New York placed the Onderdonk
  House in Queens."` (footnoted to `"Chapter 929, New York State Laws of 1937"`) and, on the 1769
  survey, `"(placing the house in Bush wick)"`.
- NYC Parks (Benninger): `"In 1769, English colonists settled the dispute by placing the
  'Arbitration Rock' at the intersection of Montrose and Onderdonk Avenues, officially defining
  Ridgewood as a part of Queens."`
- GRHS: `"The building was a prominent marker in the 1769 settlement of the boundary dispute
  between Bushwick in Kings County and Newtown in Queens County."`

The finder is correct that LPC and NYC Parks **cannot both be right about 1769**. But this is a
dispute about history, not about the record's `county` field. **The house is in Queens now**, by
LPC's own `nta2020 = "QN0502"`, and `county` must be `"Queens"` throughout, per the brief.
A draft may narrate the dispute; it must attribute each version to its agency and must not pick a
winner in its own voice.

---

## 3. THE EIGHT REFUTATIONS

**V-R1 — F082 and F125 REFUTED. The Ridgewood Theater's current use is NOT unsourced — the
finder truncated its own source mid-sentence.** The finder wrote: *"The building's current use is
UNSOURCED in this file… A draft must not state what is in the building today,"* quoting Wikipedia
as saying only that it `"operated as a 1,950-seat William Fox moviehouse until 2008"`. The raw
wikitext reads:

> `The 1,950 seat [[William Fox (producer)|William Fox]] moviehouse operated until 2008<ref>…</ref> and is now a Blink Fitness.`

The finder's ellipsis fell exactly where the answer was. **However — the finder's *caution* is
still correct, for a reason it did not have.** Nominatim resolves `55-27 Myrtle Avenue` to
**`PureGym Ridgewood`**, not Blink Fitness. Two sources, two tenants, and Wikipedia's clause carries
**no citation**. (PureGym acquired Blink Fitness in 2024, which explains the divergence, but I have
no source in this corpus that says so.) **RULING: the building is confirmed to be in gym use; the
operator's name is `uncertain` and must not be published.** Safe formulation: the theater closed in
March 2008 and the building is now occupied by a fitness club.

**V-R2 — F111 and F114 REFUTED as to TV Eye. The address IS on the venue's own site.** The finder
wrote *"I did not find the address printed on the site itself — I supplied it. Verify."* I fetched
`tveyenyc.com` and it prints, in its own footer:

> `1647 Weirfield St Ridgewood, NY (on the Bushwick border)`

plus `Hours Sun - Tue: 5PM - 2AM Wed - Sat: 5PM - 4AM`. **The address is sourced, and the site
itself says "Ridgewood, NY".** TV Eye also appears in DOHMH: `dba = "TV EYE"`, `building = "1647"`,
`street = "WEIRFIELD STREET"`, `zipcode = "11385"`, `boro = "Queens"`. Polygon and Nominatim both
→ Ridgewood.

**V-R3 — F114 REFUTED as to Trans-Pecos, and it contradicts the finder's own F112.** F112 correctly
quotes the footer; F114 then says the address was unsourced. The site prints both
`915 Wyckoff Ave. Queens NY` and `- 915 WYCKOFF AVENUE RIDGEWOOD NY -`, verified. DOHMH:
`dba = "TRANS-PECOS"`, `building = "915"`, `street = "WYCKOFF AVENUE"`, `zipcode = "11385"`.
**Address sourced twice over.**

**V-R4 — F113 and F114 REFUTED as to Nowadays. Its existence and address ARE confirmed.** The
finder could not confirm the venue from `nowadays.nyc` (I reproduce the near-empty shell — I got
222 characters of text) and concluded *"The geocode proves the address exists, not that the
business is there."* But DOHMH carries it: `dba = "NOWADAYS"`, `building = "56-06"`,
`street = "COOPER AVENUE"`, `zipcode = "11385"`, `boro = "Queens"`,
`cuisine_description = "American"`. Nominatim → `"56-06, Cooper Avenue, Ridgewood, Queens"`;
polygon → `QN0502`. **See §4: this makes Nowadays DOHMH-only, which constrains it tightly.**

**V-R5 — F086 and F027 REFUTED in one detail: Drumm Triangle is not in Glendale.** The finder lists
`Drumm Triangle` among the 11385 parks that Method B places in Glendale. My centroid test returns
**`QN0574 Highland Park-Cypress Hills Cemeteries (North)`** — a `ntatype = 7` joint interest area,
not a neighborhood. The other three (`"Uncle" Vito F. Maranzano Glendale Playground`,
`Glendale Veterans Triangle`, `Pinocchio Playground`) do return `QN0503 Glendale`, all in ZIP 11385,
so **F027's headline claim survives intact: ZIP 11385 is not a proxy for Ridgewood.** Only the
membership of the list is wrong. Everything else in F086 — the Maspeth eleven and the Middle Village
three — I reproduce exactly.

**V-R6 — F102 REFUTED in two particulars.** (a) The finder says the article "reports the bank was
founded `June 18, 1921`". The article says **chartered**: `The bank was chartered as Savings Bank of
Ridgewood on June 18, 1921.` Founded/chartered is a distinction a careful draft should keep.
(b) The finder attributes to the article the claim that *"the Ridgewood main office is **not** itself
a designated landmark."* **The article does not say that.** It is an inference. I *independently
confirm the inference* — the main office is absent from the LPC individual-landmark dataset, which
returns only `Ridgewood Theater Building` and `Adrian and Ann Wyckoff Onderdonk House` for Ridgewood
— but the author must know this is argument-from-absence, not a sourced statement.

**V-R7 — F009 REFUTED as a cross-reference.** F009 says the bank's main office is discussed at
"(F072–F074)". Those facts are about the Onderdonk House and the Greater Ridgewood Historical
Society. The bank is at **F102–F104**. A pointer error that would send an author to the wrong
material; the substance of F009 (main office ≠ Forest Hills branch) is correct and important.

**V-R8 — the finder's own quoted Wikipedia text was mangled by the summarising layer in two places,
as it warned.** Now corrected from raw wikitext:
- F026: the finder has `"newspapers around the country published...photos of Bushwick residents with
  stolen items."` The article reads `newspapers around the country published [[United Press
  International|UPI]] and ''[[Associated Press]]''{{'}} photos of Bushwick residents with stolen
  items and a police officer beating a suspected looter`. The ellipsis hid the wire services and the
  clause was cut short. Substance intact.
- F021d: the finder has `"2,543 persons' addresses...from Queens to Brooklyn"`. The article reads
  `The change resulted in 2,543 persons' addresses being reassigned from Queens to Brooklyn, and 135
  persons' addresses reassigned from Brooklyn to Queens.` Substance intact; the finder's instinct to
  grade these `[Q-2nd]` and demand re-reading was exactly right.

---

## 4. BUSINESSES — sourcing status and what may be written

The brief requires this be stated plainly for each business.

| Business | Address (publishable string) | Sources | May prose be written? |
|---|---|---|---|
| **Gottscheer Hall** | `657 Fairview Avenue, Ridgewood, NY 11385` | own site + DOHMH (`GOTTSCHEER HALL`, `657 FAIRVIEW AVENUE`, `German`) | **YES** |
| **Rudy's Bakery and Café** | `905 Seneca Avenue, Ridgewood, NY 11385` | own site + DOHMH (`RUDY'S BAKERY`, `905 SENECA AVENUE`, `Bakery Products/Desserts`) | **YES** |
| **Rolo's** | `853 Onderdonk Avenue, Ridgewood, NY 11385` | own site + DOHMH (`ROLO'S`, `853 ONDERDONK AVENUE`, `Italian`) | **YES** |
| **TV Eye** | `1647 Weirfield Street, Ridgewood, NY 11385` | own site (address + self-description) + DOHMH | **YES** — finder's caution refuted, see V-R2 |
| **Trans-Pecos** | `915 Wyckoff Avenue, Ridgewood, NY 11385` | own site (address twice) + DOHMH | **YES** — see V-R3 |
| **Onderdonk Cafe** | `353 Onderdonk Avenue, Ridgewood, NY 11385` | **DOHMH ONLY** | **NO** |
| **Nowadays** | `56-06 Cooper Avenue, Ridgewood, NY 11385` | **DOHMH ONLY** (own site is an empty shell) | **NO** |
| **Norma's** | — none — | own site, but **no Ridgewood address anywhere** and **no DOHMH row in Queens** | **NO — do not publish at all** |
| **Morscher's Pork Store** | — none — | **no usable source** | **NO — do not publish at all** |

**V-B1 — DOHMH-ONLY, stated plainly as the brief requires.** **Onderdonk Cafe** and **Nowadays**
have, as their only source, a DOHMH inspection record. **Their existence and street address may be
published. NOTHING about either may appear in prose** — no history, no character, no description,
no claim that they are open. A DOHMH row records that an establishment was inspected; it does not
establish that it is trading today.

**V-B2 — Norma's CONFIRMED as unpublishable.** I re-fetched `normascornershoppe.com`. Its
`choose a location:` module lists **only** `Wappingers Falls`. It says
`serving coffee, baked goods and laughs since 2012 in ridgewood & growing` — a claim about its
origin, with no current Ridgewood address. I ran DOHMH for `NORMA*` across Queens and got **zero
rows**. **The finder is right: do not list Norma's as an open Ridgewood business.**

**V-B3 — Morscher's CONFIRMED as unusable.** `morschersporkstore.com` returned 39,000 characters of
online-casino affiliate content. Zero `MORSCHER*` rows in DOHMH Queens. **The domain must not be
cited under any circumstance.** The finder's warning is correct and important.

**V-B4 — Rudy's hours CONFIRMED as unpublishable.** The site posts two conflicting sets of hours and
its footer reads `© Rudy's Bakery & Café 2022`. Do not publish hours. One finder quote,
`"Located in the heart of Historic Ridgewood, Queens"`, I could **not** find on the homepage, and
`/about/` returns 404 — **`uncertain`, do not use that string.** The verified strings are
`"A Ridgewood landmark since 1934"` and the phone `(718) 821-5890`.

**V-B5 — Onderdonk House visitor information CONFIRMED as contradictory, exactly as the finder
says.** `/plan-a-visit` states `"Due to construction, the Museum will be temporarily closed for
tours on Saturday and Sunday…"` and `"Tickets for Weekend Tours, are temporarily not available due
to construction in the museum."` while `/contact` still says `"Public Hours Saturday & Sunday
12-5pm"`. **Do not publish "open Saturday and Sunday 12–5" as current.** Also confirmed: `"There is
an admission charge to enter the property (including the grounds)"` with **no price stated
anywhere**. Publishable and stable: the address, the phone `(718) 456-1776`, and the directions
string `"1820 Flushing Avenue, Ridgewood, Corner of Flushing and Onderdonk Avenues"`.

---

## 5. SINGLE-SOURCED CLAIMS — and whether they may ship

The brief requires each be named and ruled on.

**MAY SHIP WITH ATTRIBUTION** (single agency source, but an authoritative one):
- **WHN radio founded by the *Ridgewood Times*.** NYC Parks (Clemens Triangle) only, verified
  verbatim: `"in 1920, he expanded the newspaper to include the new station WHN"` and
  `"The station's lack of success nearly bankrupted the paper, and eventually Schubel sold WHN to
  Loew's Theaters."` Attribute to NYC Parks. Corroborating context: LP-2081's bibliography
  independently cites `"George Schubel, A History of Greater Ridgewood (New York: Ridgewood Times
  Publishing Co., 1912)"` — verified — which confirms Schubel and the paper but **not** the radio
  station. Say "according to NYC Parks".
- **"3,982 local homes" on the National Register.** NYC Parks (Rosemary's Playground) only, verified
  verbatim. Ships with attribution. ⚠️ Both this and the BID's version say **"one of the largest"**,
  never "the largest" — I searched and found no source for the superlative. **A draft must not
  upgrade "one of the largest" to "the largest".**
- **"Landlord Square."** NYC Parks only, verified verbatim. Charming and safe with attribution.
- **The ZIP 11385 story.** Wikipedia only, but its own footnotes are contemporaneous *New York
  Daily News* reports (Rabin, Feb/May 1979). Verified verbatim: `93 percent of the returned ballots
  voted for the change` and `The change to ZIP Code 11385 was made effective January 13, 1980.`
  Ships with attribution. ⚠️ **Tension the finder missed:** LP-2325's footnote 17, on the residents'
  vote to change their address to Queens, reads `"This occurred in 1979. Encyclopedia of NY, 1004."`
  The address change (1979) and the ZIP change (effective January 1980) are **different events** and
  a draft that merges them into one date will be wrong.
- **The 1925 zig-zag boundary.** Wikipedia only, cited to qns.com. Verified verbatim:
  `In 1925, the political boundary was adapted to the street grid, resulting in a zig-zag pattern.`
  Ships with attribution.
- **Ridgewood Savings Bank, "largest mutual savings bank in New York State", HQ at Myrtle and
  Forest Avenues, built 1929, architects Halsey, McCormack and Helmer, Inc.** Wikipedia only, both
  articles agreeing. Verified verbatim in raw wikitext. Ships with attribution.

**MUST NOT SHIP:**
- **The bank's `$6.8 billion` assets figure.** Verified as present, but the infobox cites a
  "90th Anniversary" source — i.e. c. 2011, **fifteen years stale**. Do not publish as current.
- **Median household income `$42,049`.** Verified as present, but Wikipedia sources it to
  **bestplaces.net**, a commercial aggregator, not the census. The 2010 population `69,317` **is**
  properly sourced (NYC Planning Table PL-P5) and I independently confirm it in `swpk-hqdp`
  alongside `QN20 Ridgewood 2000 = 69455`, `QN19 Glendale 31071 → 32496`,
  `QN30 Maspeth 28916 → 30516`. **Use the population; drop the income.**
- **The theater's current operator.** See V-R1.
- **The bus route list (F120).** Verified as Wikipedia's text, but route lists go stale and this one
  is uncited to any MTA document. The two routes the Onderdonk House names in its own directions —
  `"Q54 to Flushing and Metropolitan Avenues. B57 to Flushing and Onderdonk Avenues"` — are
  independently sourced and safe.
- **`org_businesses = "333"` / `org_blocks = "32"`.** Single undated dataset field. Hedge or omit.

---

## 6. REMAINING UNCERTAINTIES

- **V-U1 — Ridgewood Savings Bank main office address.** The finder admitted constructing
  `71-02 Forest Avenue`. Nominatim independently returns `"Ridgewood Savings Bank, 71-02, Forest
  Avenue"` at that query, polygon `QN0502 Ridgewood` — so the finder guessed **right**. But
  OpenStreetMap is crowd-sourced and I found **no agency source**: the building is absent from the
  LPC dataset, and `ridgewoodbank.com` served me no locations page. **RULING: `uncertain`.** If the
  bank is written up, use Wikipedia's sourced formulation — `"the intersection of Myrtle and Forest
  Avenues"` — rather than a street number. Do not create a place record on a street number whose
  only support is OSM.
- **V-U2 — the 2022 NRHP district.** `Ridgewood Fresh Pond Road-Myrtle Avenue Historic District`,
  refnum `100007371`, `date = 2022-01-26`, address `Generally Fresh Pond Rd. and Myrtle Ave.` —
  I confirm all four values in the raw wikitext. The finder is right that it is the freshest
  material here and absent from every narrative source. **Existence: confirmed. Boundaries, building
  count, nomination text: uncertain** — I reached no nomination document either.
- **V-U3 — Linden Hill.** Wikipedia (verified) locates a Ridgewood subsection called Linden Hill
  `"around the Linden Hill United Methodist Cemetery and Linden Hill Jewish Cemetery, centered
  around Flushing and Metropolitan Avenues"`. That does **not** resolve F129, because NYC Parks puts
  Grover Cleveland Playground adjacent to "Linden Hill Cemetery" at Grandview/Fairview/Stanhope,
  which is over a kilometre away. **The finder's instruction stands: do not create a Linden Hill
  place record.**
- **V-U4 — St. Matthias construction dates.** LP-2348 (verified verbatim) gives 1909 for the
  combined church-and-school and 1926 for the church. I did not re-verify Wikipedia's 1911–1912.
  Prefer LPC. ⚠️ **The finder's flag is correct and important: LP-2348 calls the building a
  "cathedral" twice, and it is not one — it is a parish church. Quote LPC only if you keep the
  quotation marks; do not adopt "cathedral" in your own voice.**
- **V-U5 — Arbitration Rock's relocation date.** Confirmed as a genuine, unclosed gap. GRHS says
  `"The site is also the location of Arbitration Rock."` and `"see Arbitration Rock-the historic
  boundary between Brooklyn and Queens!"`; NYC Parks puts its original position at
  `"the intersection of Montrose and Onderdonk Avenues"`; LP-1923 (1995) never mentions it — I
  searched the full extracted text and confirm zero hits. **No source dates the move. Do not invent
  one.**
- **V-U6 — Stockholm Street HD `caldate`.** The finder's `2000-09-12` did not come back in my query.
  The designation date `2000-11-28` is confirmed.
- **V-U7 — the Onderdonk construction date.** The five-way spread is real and I verified every
  member of it, including LPC contradicting itself (LP-1923 `"third quarter"` vs LP-2081
  `"Built in the last quarter of the eighteenth century"`). The finder's reconciliation is very
  likely right — LP-1923 treats 1709 as the **land purchase**: `"The land changed hands several
  times prior to 1709, when one hundred acres were purchased by Paulus van Ende…"` — while GRHS and
  NYC Parks treat 1709 as the construction. **A draft should present the museum's 1709 as the
  museum's claim and LPC's c.1770 as LPC's, and explain the purchase/construction distinction.
  It must not assert a single date in its own voice.**

---

## 7. NOTES THE AUTHOR MUST NOT MISS

1. **County is `"Queens"` on every record.** No exceptions, whatever the sources' postal habits.
2. **Brooklyn owns the other side.** I confirm 69 `.json` files in `priv/seed_data/brooklyn/`
   (plus `.gitkeep`), including `bushwick.json`, `east-williamsburg.json`, `cypress-hills.json`
   and `highland-park.json`. I verified `cypress-hills.json` carries `beth-olam-cemetery` at
   `"2 Cypress Hills Street, Brooklyn, NY, straddling the Brooklyn-Queens border"` and
   `highland-park.json` carries `highland-park-brooklyn`. **The border-straddling places on the
   southern flank are taken.**
3. **`brewer's row` is in Brooklyn.** LP-2325, verified verbatim: `"at least eleven breweries,
   including Rheingold, were operating within a fourteen block area in **western Bushwick**"`. A
   draft that relocates brewer's row into Ridgewood asserts against LPC. The brewery heritage is
   adjacent context. Ridgewood's own industrial material is the knitting mills and factories, which
   LPC mentions only in passing.
4. **`"Ridgewood" is also a Brooklyn place name`** — in the City's own BID record:
   `"Ridgewood/Bushwick in Brooklyn"`. Verified. This is the brief's hazard stated by a city agency.
5. **Ridgewood has no waterfront.** The finder is right. LP-1923 (verified) puts the Onderdonk site
   `"adjacent to the end of a branch of the English Kills section of Newtown Creek"` — an industrial
   channel. Answer the waterfront prompt that way rather than reaching.
6. **Do not merge the two Central Ridgewood districts.** NRHP `Central Ridgewood Historic District`
   (refnum `83001762`, listed `1983-09-30`) and LPC `Central Ridgewood Historic District`
   (`LP-02448`, designated `2014-12-09`) are different designations with different boundaries,
   31 years apart, sharing a name. Same caution for `Fresh Pond-Traffic` (NRHP 1983) vs
   `Ridgewood Fresh Pond Road-Myrtle Avenue` (NRHP 2022).
7. **Middle Village Prep Charter School is in Ridgewood** by the DOE's own NTA field and by the
   polygon, but Nominatim labels `68-02 Metropolitan Avenue` "Middle Village". If the school is
   used, say the data places it in Ridgewood; do not assert it flatly against a reader's postal
   intuition without the explanation.
8. **The Onderdonk House museum directs visitors to a Brooklyn subway station** (`L to Jefferson
   Street`) — verified. A nice, true, border-illustrating detail.
9. **`"ecuavolley"` at Starr Playground** is verified in NYC Parks' 2022 renovation text and is a
   genuinely current, specific detail that ties to the demographic shift. Use it.
10. **`P.S. 81Q Jean Paul Richter`** — verified in the DOE dataset. A German writer's name sitting
    in a city dataset; a small, real artifact of the neighborhood's German history.
11. **Flushing Meadows Corona Park:** F007 confirmed. None of the eight
    `Ethos.Seeds.CitiFieldPlaces` holdings has any Ridgewood connection, and **no routing sentence
    to `/g/citi-field-guide` is warranted on this page.** Ridgewood is not adjacent to that park and
    has nothing to route.

---

## 8. HEADLINE COUNT

- **Claims adjudicated: 134** (F001–F134), resting on **145 individually re-matched quoted
  passages** — 71 against LPC PDF text I converted myself, 74 against HTML I fetched and stripped
  myself — plus independent re-derivation of every geographic assignment.
- **Confirmed: 118**
- **Refuted: 8** (V-R1 – V-R8)
- **Uncertain: 8** (V-U1 – V-U7, plus the Rudy's quote at V-B4)
- **Places surviving as publishable: 52**

Breakdown of the 52:

| Group | Count | Change from the finder's 56 |
|---|---|---|
| Individual landmarks | 2 | — |
| Church complex | 1 | — |
| LPC historic districts | 4 | — |
| NRHP districts/sites | 13 | −1: `Cooper Avenue Row HD` ruled **Glendale** (V-N2) |
| Parks in the Ridgewood NTA | 8 | — (independently re-derived) |
| Library | 1 | — |
| DOE schools | 12 | — |
| Commercial / civic bodies | 0 | −2: BID office ruled **Glendale** (V-N1); bank main office address `uncertain` (V-U1) |
| Food, drink and venues | 7 | −1: Norma's unpublishable (V-B2) |
| Subway stations | 4 | — |
| **Total** | **52** | |

Of the 7 food/drink/venue places, **2 are DOHMH-only** (Onderdonk Cafe, Nowadays) and may be
published as **existence and address only, with no prose whatsoever**.

**And the finding that reaches beyond this page: Forest Park belongs to no neighborhood file.**
It is `QN8291`, `ntatype = 9`, `QN82 Forest Park (JIA 82 Approximation)` — the same joint-interest
device as `QN8191 Flushing Meadows-Corona Park`, which wave 3 ruled belongs to nobody. 96.8% of the
park's area is in its own JIA and **0.0% is in Forest Hills**, which holds just 409 m (2.5%) of the
park's boundary against Glendale's 1,359 m (8.3%), Kew Gardens' 1,937 m and Woodhaven's 2,232 m.
The standing `forest-hills.json` assignment is the weakest of the eight candidates on both tests.
Ridgewood does not touch the park at all and makes no claim on it.
