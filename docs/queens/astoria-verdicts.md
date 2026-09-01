# Astoria, Queens — VERIFIER verdicts

**Role:** Independent verifier. I did not defer to the finder's reasoning. Every quote below that I
mark `confirmed` I re-extracted myself from the source, in this session, and re-read against the
finder's string character by character.

## Method — what I could and could not reach

- **LPC designation reports:** downloaded all eight PDFs directly from `s-media.nyc.gov` and
  extracted text locally with `pdftotext -layout`. LP-2172, LP-2196, LP-2570 and LP-2675 have clean
  born-digital text layers. LP-0135, LP-0136, LP-0632 and LP-0977 are scanned 1966–78 typescripts;
  my extraction shows the same OCR corruption the finder reported, which is corroboration that the
  finder really read them.
  - **Two-column layout trap:** `pdftotext -layout` interleaves the two columns of LP-2675, so a
    naive substring search *misses* sentences that are genuinely present. I hit this on F26 — the
    single most load-bearing quote in the file — and only found it by reading the surrounding
    block. **Any future checker searching these PDFs must de-column before concluding "not found."**
- **NYC Open Data / NY State Open Data:** re-queried NTA (`9nt8-h7nd`), LPC Individual Landmark
  Sites (`buis-pvji`), DCLA Cultural Organizations (`u35m-9t32`), DOHMH Restaurant Inspections
  (`43nn-pn8j`), PLUTO (`64uk-42ks`), MTA Subway Stations (`39hk-dx4f`). All reachable.
- **`nycgovparks.org` refused me** — CloudFront 403 on both curl and WebFetch, for every path.
  I reached the four Parks history pages through **web.archive.org**, and I deliberately pulled the
  *newest* capture of each rather than the default:
  | page | capture used |
  |---|---|
  | Astoria Park history | `20260723010412` |
  | Socrates Sculpture Park history | `20250122182154` |
  | Socrates Sculpture Park main | `20260718200708` |
  | Hallets Cove Playground history | `20260103003501` |
  | Athens Square history | `20240731065544` |
  - **This matters and nearly produced a false refutation.** The default `/web/2024/` capture of the
    Astoria Park history page (which resolves to `20250413094541`) carries an **older revision of
    the signage text** in which the same facts are worded differently — "an Indian village
    flourished at Pot Cove" not "a Lenape village"; "its five-million-dollar cargo" not "its
    reported million-dollar cargo"; the pool "opened on July 4 of that year" not the undated
    "opening of the pool complex in 1936"; and no Anchor Parks paragraph at all. Against that
    capture the finder looks fabricated. Against the **July 2026** capture the finder is exact.
    NYC Parks rewrote this page. **The finder was reading the live current page and quoting it
    correctly.** I record this so no later reviewer re-refutes these on a stale capture.
- **Institution and restaurant websites:** fetched live with `curl --compressed`. Socrates' site
  serves brotli/gzip and returns binary garbage without `--compressed` — another trap.
- **Wikipedia:** re-fetched, but WebFetch is summarizer-mediated for me exactly as it was for the
  finder. I therefore treat §1 as *corroborated-as-present*, never as independently quoted.

---

## HEADLINE

| Metric | Count |
|---|---|
| Claims adjudicated | **255** |
| Confirmed | **230** |
| Refuted | **11** |
| Uncertain | **14** |
| Candidate places (P1–P79) | 79 |
| **Places surviving as publishable in some form** | **71** |
| — of those, places that may carry **prose** | **20** |
| — of those, **address/existence only, no prose** | **51** |
| Places that survive at all | 71 (8 do not) |

**The 90% confirmation rate is a warning sign and I want to say exactly what kind.** It is high
because roughly 200 of these 247 claims are verbatim strings copied out of primary City documents
that I could re-extract byte-for-byte — LPC PDFs and Open Data JSON. Those are cheap to confirm and
the finder copied them honestly.

The signal is in **where the errors cluster**. Every one of my 11 refutations is in the same class:
the finder's own **counts, address strings, and diagnostic asides** — the places where it stopped
transcribing and started asserting. Its quotation is excellent. Its arithmetic and its
address-construction are not. **The author should trust the finder's quotes and independently check
every number and every address string it presents.**

---

## THE ELEVEN REFUTATIONS

**R1 — §11 preamble: "it returned 513 distinct establishments."** REFUTED. My query of
`43nn-pn8j` for zips 11102/11103/11105/11106 returns 7,615 inspection rows, **756 distinct
`camis`** and 745 distinct name+address triples. Not 513. The number is wrong by ~48%. Do not
publish any "N restaurants in Astoria" figure derived from it.

**R2 — P60: Sweet Afton "did not appear in my DOHMH extraction."** REFUTED. It is in the dataset,
under a compound DBA: **`SWEET AFTON / SIDEKICK`, `30-09 34 STREET`, `11103`,
`cuisine_description: "New American"`**. Sweet Afton is therefore **double-sourced** (own site +
DOHMH), not own-site-only. This upgrades it.

**R3 — P1 heading: Astoria Park "19th Street / Astoria Park South to Ditmars Blvd."** REFUTED as
sourced. **No page I reached gives Astoria Park a street address.** The 2026 NYC Parks history page
gives only `Zip Code: 11102, 11105`, `Community Board: 1`, `Park ID: Q004`, `Acreage: 59.96`,
`Property Type: Community Park`. The finder's boundary string is its own construction. See the
address ruling below.

**R4 — F199: Moore-Jackson Cemetery, "address truncated in the dataset row."** REFUTED. The
`buis-pvji` row is complete: **`51st to 54th Streets between 31st and 32nd Avenues`**. Nothing is
truncated; the finder truncated it.

**R5 — F203: "The six in Queens."** REFUTED. The dataset's `line: "Astoria"` has **nine** stations,
of which **seven** are in Queens (`borough: "Q"`) — the six the finder lists **plus Queensboro
Plaza**, which it relegates to a parenthesis. Two are Manhattan.

**R6 — F31: "the sentence is cut off in my extraction; the church name is missing."** REFUTED as
unrecoverable — **I recovered it.** LP-2675 verbatim: *"purportedly named the area Astoria to
attract financial backing from millionaire John Jacob Astor, who **made a donation to build St.
George's Episcopal Church**."* This also sharpens discrepancy §13.3: LPC says Astor **donated to a
church**; NYC Parks says of the *park's* naming that Astor "never did" invest. **These are not
actually in conflict** — different objects. The author may state both.

**R7 — F28: "the source text as extracted has an unbalanced quotation mark."** REFUTED. That was an
artifact of the finder's extraction. The PDF closes the quote: *"was called "Sunkisq" by local
tribes, meaning "place of the chief's wife.""* The gloss conflict with F24 ("woman chief") is real
and stands; the punctuation worry does not.

**R8 — F42: "the word 'park' in 'northern park' is almost certainly an OCR error for 'part'."**
REFUTED as an OCR diagnosis. LP-2196 is **born-digital with a clean text layer** — there is no OCR
in the loop. The text really reads "the northern park of Astoria Park." It is a **typographical
error in LPC's own published report**, not a scanning artifact. Quote it with `[sic]` or silently
correct with a note; do not attribute it to OCR.

**R9 — F62: "whimsical saucerlike roofs."** REFUTED as verbatim. LP-2196 reads **"saucer-
like"** (hyphenated across a line break). Trivial, but the finder presented it as an exact quote and
it is not one.

**R10 — F3: Broadway "traditionally considered the border" presented as a Wikipedia lead.**
REFUTED as wording. The article reads: *"The area south of Astoria was called Ravenswood, and
traditionally, Broadway was considered the border between the two."* Substance survives; the string
does not.

**R11 — F6: "2020 census composition."** REFUTED. The article attributes **all** of these to
**2024**, and to **"Astoria/Queensbridge"**, not to Astoria: *"In 2024, there were an estimated
198,608 people in Astoria/Queensbridge, of which 14.6% identified as Asian, 4.1% identified as
Black, 28.3% identified as Hispanic, and 47.3% identified as White."* The finder's own warning that
these depend on an unpinned boundary was right, and understated — the source **names** the
boundary, and it is the CD-1 unit including Queensbridge, not the neighborhood. **Do not publish
any of these figures as Astoria's.**

---

## NEIGHBORHOOD ASSIGNMENT RULINGS

For every candidate: what the sources **actually** say, quoted, plus the exact publishable address
string.

### The two marquee institutions — each may appear in exactly ONE neighborhood file corpus-wide

#### ASTORIA PARK → **ASTORIA.** Unambiguous. No street address.

- **NYC Parks** (`/parks/astoria-park/history`, capture `20260723010412`), verbatim:
  *"Stephen Halsey, who founded the village of Astoria in 1839, named the area for his friend, fur
  merchant John Jacob Astor (1763-1848)."* and *"The pool, park, and surrounding neighborhood are
  named after John Jacob Astor."* The park, the pool and the neighborhood are one naming act.
- **NYC DCP** carves it out as its **own NTA, `QN0191`, `ntaname: "Astoria Park"`, `ntatype: 9`**,
  inside `cdtaname: "QN01 Astoria-Queensbridge (CD 1 Equivalent)"`. Confirmed from the JSON.
- **NYC Parks data panel:** `Zip Code: 11102, 11105`, `Community Board: 1`, `Park ID: Q004`,
  `Acreage: 59.96`, `Property Type: Community Park`.
- **The sibling Ditmars-Steinway verifier independently ruled the same way** — "ASTORIA. Conflict
  REFUTED" — from a completely different source (Wikipedia's Astoria Park article, "a 59.96-acre
  public park"). Two verifiers, disjoint sources, same ruling, and the 59.96 figure matches.
- **The only contrary datum is F50, and it is not contrary.** NYC Parks verbatim: *"In 1926
  community members gathered to dedicate the Astoria Park Memorial in tribute to the sons of **Long
  Island City** who died in World War I."* Confirmed verbatim. That is a 1926 **municipal** name for
  the war dead's home city, not a location claim about the park. It does not license putting Astoria
  Park in the LIC file. **The author may quote it inside the Astoria file as a historical note.**

> **ADDRESS RULING: Astoria Park has NO publishable street address.** Not from any source in this
> corpus. Ship it with `Astoria, Queens, NY 11102 / 11105` or with the pool's address, and say which.

#### SOCRATES SCULPTURE PARK → **CONTESTED, AND THE CONFLICT IS REAL.** Best evidence: **Long Island City** for the address, **Astoria** for the prose.

The finder called this "heavily contested." It is right, and I confirmed both sides verbatim.

- **Long Island City side — the park's own institutional address.** Footer of
  `socratessculpturepark.org`, verbatim: **"32-01 Vernon Boulevard, Long Island City, NY 11106"**.
  Re-fetched live this session (needs `--compressed`; without it the response is binary).
- **Long Island City side — DCLA.** `organization_name: "Socrates Sculpture Park, Inc."`,
  `address: "32-01 Vernon Blvd."`, `city: "Long Island City"`, `postcode: "11106"`,
  `community_board: "Queens Community Board #1"`, `nta: "QN0105"` (Queensbridge-Ravenswood-Dutch
  Kills), `discipline: "Visual Arts"`. Confirmed from the JSON.
- **Astoria side — NYC Parks' own signage text**, verbatim: *"they began the arduous process of
  restoring the site, and named it Socrates Sculpture Park - both in honor of Socrates (469-399
  B.C.), the great Greek philosopher, and also as a tribute to **the people of Astoria, New York's
  largest Greek community**."*
- **The source straddles both, in one sentence**, verbatim: *"its panoramic vista inaccessible to
  citizens of **Astoria and Long Island City**."*
- **A datum the finder missed and the author needs.** NYC Parks' **main** park page gives the
  location line as **"Vernon Blvd. bet. Broadway and 30 Dr."** — the City does not use "32-01
  Vernon Boulevard" at all. Panel: `Zip Code: 11106`, `Community Board: 1`, `Park ID: Q465`,
  `Acreage: 6.28`, `Property Type: Neighborhood Park`. All confirmed.
- **The sibling Ditmars-Steinway verifier reached the same impasse** from Wikipedia — prose says
  Astoria, infobox says LIC — and ruled *"Neither reading is Ditmars-Steinway."*

> **RULING FOR THE ARBITRATOR.** Ditmars-Steinway is eliminated; two verifiers agree. The live
> choice is Astoria vs. Long Island City, and **the two sides are not symmetric**:
> - The **LIC** evidence is *current, institutional and self-declared* — the park's own footer and
>   the City's cultural-organizations registry, agreeing on `32-01 Vernon Boulevard, Long Island
>   City, NY 11106` and on NTA `QN0105`.
> - The **Astoria** evidence is *historical and dedicatory* — signage text of late-1990s vintage
>   (it names Mayor Giuliani and Borough President Claire Shulman) explaining **why the park was
>   named**, not where it is.
>
> **I rule the Long Island City assignment better evidenced for the place, and the Astoria material
> better evidenced as prose about the park's naming.** If Socrates must sit in exactly one file, it
> should be **Long Island City** — and the Astoria file may still quote the "tribute to the people
> of Astoria" line, with attribution, without claiming the park.

### Every other contested place

| Place | Exact publishable address | What the sources actually say | Ruling |
|---|---|---|---|
| **Astoria Park Pool and Play Center** | **`19th Street between 22nd Drive and Hoyt Avenue North`** (LPC dataset, verbatim) | LP-2196: *"the Astoria Play Center commands a striking waterfront location in Astoria Park."* LPC dataset NTA `QN0191`, `cd 401`, designated `6/20/2006`. | **ASTORIA.** No conflict. Sibling verifier concurs. |
| **Famous Players-Lasky Studio / Paramount Bldg. No. 1** | **`35-11 35th Avenue`** | LP-0977 header verbatim: *"PARAMOUNT STUDIOS, BUILDING N0.1 (MAIN BUILDING), 35-11 35th Avenue, **Astoria**, Borough of Queens."* Body: *"at 35-11 35th Avenue in Astoria, Queens."* Dataset NTA `QN0103` (Astoria (Central)). | **ASTORIA.** Three independent City attestations. Strongest assignment in the file. |
| **Kaufman Astoria Studios** (the company) | **`34-12 36th Street`** | Own site footer verbatim: *"KAUFMAN ASTORIA STUDIOS \| 34-12 36th STREET \| 718-392-5600"*. | **ASTORIA.** The finder is right that this differs from the landmark address. **Record both; they are one complex with two frontages. Do not merge, do not pick.** |
| **Sohmer & Company Piano Factory** | **`31-01 Vernon Boulevard`** (a/k/a `11-02 to 11-16 31st Avenue`) | LP-2172 verbatim: *"One of the most prominent structures along the Queens side of the East River **in Long Island City**"*; section heading *"The Industrial Development of Long Island City/Astoria"*; *"located **in the northern part of Long Island City near Astoria**."* **Against:** LPC's own dataset assigns NTA **`QN0102` Old Astoria-Hallets Point**; DCLA lists `Epic Theatre Center, Inc.` at `31-01 Vernon Blvd`, `city: "Astoria"`, `nta: QN0102`. | **CONTESTED, LIC better evidenced in prose, Astoria better evidenced in the geodata.** The designation report is explicit and repeated; the NTA is a polygon lookup. **Say "Long Island City, near Astoria" — the report's own hedge is the honest answer.** |
| **Benjamin T. Pike House / Steinway Mansion** | **`18-33 41st Street`** | LP-0632 header verbatim: *"STEINWAY HOUSE, 18-33 41st Street, **Steinway**, Borough of Queens. Built about 1840."* **The report never says "Astoria."** Dataset: NTA `QN0101` (Astoria (North)-Ditmars-Steinway), `lpc_altern: "designated as Steinway House"`. PLUTO: `18-33 41 STREET`, `STEINWAY MANSION 1 LLC`, zip `11105`, `cd 401`, `yearbuilt 1858`. | **"Steinway" per LPC; QN0101 per DCP.** Sibling verifier ruled **ASTORIA** from Wikipedia and explicitly refuted Ditmars-Steinway. **Astoria is the safe assignment; note LPC's "Steinway" label in prose.** |
| **Abraham Lent House / Lent Homestead** | **`78-03 19th Road`** | LP-0135 header verbatim: *"LENT HOMESTEAD, 78-03 19th Road, **Steinway**, Queens. Built about 1729."* Dataset NTA `QN0101`, `lpc_altern: "also known as the Lent-Riker-Smith Homestead"`. | **DO NOT PUT THIS IN THE ASTORIA FILE.** The sibling verifier found Wikipedia placing it verbatim *"in the **Steinway and East Elmhurst** neighborhoods"* with address *"78-03 19th Rd., East Elmhurst."* The finder's own suspicion was right. **Refer to the arbitrator.** |
| **Lawrence Family Graveyard** | **`southeast corner of 20th Road and 35th Street`** | LP-0136 **header**: *"…**Steinway**, Borough of Queens. 1703."* LP-0136 **body**: *"Miss Ruth Lawrence, the last member of the Lawrence family to live **in Astoria**…"* Dataset NTA `QN0101`. | **CONFIRMED as the cleanest single-document contradiction in the corpus.** Both quotes verified verbatim in the same 1966 PDF. **ASTORIA per the body; disclose the header.** |
| **Barkin, Levin & Company Office Pavilion** | **`12-12 33rd Avenue`** | LP-2675 LOCATION block verbatim: *"Borough of Queens / 12-12 33rd Avenue, **Long Island City**."* And *"Located in the northernmost part of Long Island City."* **But the same report:** *"**Today, the area north of the Queensboro Bridge is called Astoria**, though at the time of the factory's construction it was generally described as Long Island City."* Dataset NTA `QN0105`. | **LONG ISLAND CITY as designated.** The F26 sentence is the single best boundary quote in the corpus and I confirm it verbatim — **but it is a general statement about the area, not a reassignment of this building, which LPC addresses to LIC in 2023.** Do not use F26 to move this building. |
| **Bank of the Manhattan Company Building, LIC** | **`29-27 Queens Plaza North`** (aka `29-27 41st Avenue`, `29-39 Northern Blvd`) | LP-2570 verbatim: *"located in the **Dutch Kills section of Long Island City**, in northwestern Queens."* Landmark's official name contains "Long Island City." Dataset `cd 401`, NTA `QN0105`. | **LONG ISLAND CITY / Dutch Kills.** Not Astoria. The CD-1 fact is a boundary artifact, not evidence. |
| **The Noguchi Museum** | **`9-01 33rd Road (at Vernon Boulevard)`** — use this one | Own footer verbatim: *"The Isamu Noguchi Foundation and Garden Museum / 9-01 33rd Road (at Vernon Boulevard) / Long Island City, New York 11106."* Own About verbatim: *"**Located in Long Island City, Queens**."* DCLA gives `32-37 Vernon Boulevard`. | **LONG ISLAND CITY.** And **the finder's own F148 resolves the address conflict it declined to resolve**: the museum's archive caption reads *"Isamu Noguchi at **32-37 Vernon Boulevard**, Long Island City, New York, **1980s**."* 32-37 Vernon is the **historic studio address**; 9-01 33rd Road is the **current visitor address**. Publish 9-01 33rd Road. |
| **Museum of the Moving Image** | **`36-01 35th Avenue`, Astoria, NY 11106** | DCLA verbatim: `organization_name: "American Museum of the Moving Image"`, `address: "36-01 35th Avenue"`, `city: "Astoria"`, `postcode: "11106"`, `community_board: "Queens Community Board #1"`, `nta: "QN0103"`. Confirmed from JSON. | **ASTORIA.** Address is solid. **Prose is NOT — see the warnings.** |
| **Greater Astoria Historical Society** | **`32-63 48 Street`, 11103** | DCLA verbatim: `city: "**Long Island City**"`, `nta: "QN0104"` (Astoria (East)-Woodside (North)), CB #1. Own site: *"Greater **Astoria** Historical Society / Serving the Borough of Queens Since 1985."* Domain `astorialic.org`. | **The institution refuses to choose and so should we.** Confirmed. Note the finder omitted the NTA (`QN0104`, i.e. Astoria (East)) — which tilts it toward **Astoria**. |
| **Epic Theatre Center, Inc.** | `31-01 Vernon Blvd`, 11106 | DCLA `city: "Astoria"`, `nta: "QN0102"`. Same building LPC calls Long Island City. | **CONTESTED.** Confirmed verbatim. |
| **Astoria Film Festival Inc** | `3355 14 St`, 11106 | DCLA `city: "**Astoria**"` but `community_board: "Queens Community Board **#2**"`, `nta: "QN0105"`. | **CONFIRMED — conflict runs the other way, exactly as the finder said.** |
| **Theatron, Inc.** | `32-15 38th Street`, 11103 | DCLA `city: "Long Island City"`, `nta: "QN0104"` (Astoria (East)), CB #1. | CONFIRMED contested. |
| **Flux Factory** | `39-31 29TH STREET`, 11101 | DCLA `city: "LONG ISLAND CITY"`, CB #1, `nta: "QN0105"`. | CONFIRMED contested. |
| **CultureNOW, Inc.** | `37-24 24th Street`, 11101 | DCLA `city: "LONG ISLAND CITY"`, CB #1, `nta: "QN0105"`. | CONFIRMED contested. |
| **Chinese Theatre Works** | `3718 Northern Blvd`, 11101 | DCLA `city: "Long Island City"`, CB #1, **`nta: "QN0161"` (Sunnyside Yards (North))** — the finder reported no NTA here. | CONFIRMED contested; a **fifth** label. |
| **Together in Dance** | `34-18 Northern Blvd`, 11101 | DCLA `city: "Long Island City"`, CB #1, `nta: "QN0161"`. | CONFIRMED contested. |
| **Theater et al** | `38-33 24th Street`, 11101 | DCLA `city: "Long Island City"`, CB #1, `nta: "QN0105"`. | CONFIRMED contested. |
| **Ecuadorian American Cultural Center** | `36-32 34th St`, 11106 | DCLA `city: "Long Island City"`, CB #1, `nta: "QN0105"`. | CONFIRMED contested. |
| **Williamsburg Art Nexus** | `24-26 26th Street`, 11102 | DCLA `city: "Astoria"`, `nta: "QN0101"` (Astoria (North)-Ditmars-Steinway). | CONFIRMED — Astoria/Ditmars-Steinway. |
| **Stage Aurora NY** | `24-54 29th Street #2A`, 11102 | DCLA `city: "Astoria"`, `nta: "QN0101"`. | CONFIRMED. **Apartment address — not a venue.** |
| **Wreckio Ensemble Theatre** | `23-54 23rd Street`, 11105 | DCLA `city: "Astoria"`, `nta: "QN0101"`. | CONFIRMED. |
| **Muslim American Society of Queens** | `46-01 20th Ave`, 11105 | DCLA `city: "Astoria"`, `nta: "**QN0101**"` — **the finder did not flag this one and should have.** | **NEW Astoria/Ditmars-Steinway conflict the finder missed.** |
| **Astoria Music Society, Inc.** | `22-70 23rd Street`, 11105 | DCLA `city: "Astoria"`, `nta: "**QN0101**"`. | **NEW conflict the finder missed.** |
| **Greek American Educational Public Information System** | `23-18 29th Street`, 11105 | DCLA `city: "Astoria"`, `nta: "**QN0101**"`. | **NEW conflict the finder missed.** |
| **Greek-American Broadcasting…** | `20-12 20th Street, Apt. 2C`, 11105 | DCLA `city: "Astoria"`, `nta: "**QN0101**"`. | **NEW conflict.** Apartment address — not a venue. |
| **New Thread Quartet / Make Music New York** | `2138 Crescent St D3` / `1919 24th Avenue, L210` | Both DCLA `city: "Astoria"`, `nta: "QN0101"`. | **NEW conflicts.** Both are unit addresses — not venues. |
| **Taverna Kyclades** | **`36-01 Ditmars Blvd`, 11105** | Own site verbatim: *"Taverna Kyclades, in **Astoria** Queens, is one of the top Greek restaurants in New York City"*; *"centrally located on **Ditmars** Blvd."* DOHMH: `36-01 DITMARS BOULEVARD`, `11105`, `Greek`. | **ASTORIA per the business.** Street name is not evidence of neighborhood. |
| **Bohemian Hall & Beer Garden** | **`29-19 24th Avenue, Astoria, New York 11102`** | Own site footer, verbatim, exactly that string. DOHMH: `29-19 24 AVENUE`, **`11102`**, `Czech`. | **ASTORIA. But see the ZIP warning below — the sibling file has 11105 and is wrong.** |
| **Athens Square** | **none published** | NYC Parks: *"a little bit of Athens in Astoria"*; *"Astoria's citizens"*. Panel: `Zip Code: 11102`, `CB 01`, `Park ID: Q436`. | **ASTORIA.** No street address in any source. |
| **Hallets Cove Playground** | **none published** | NYC Parks: *"Hallets Point was initially the commercial center of **Astoria**."* Panel: `Zip Code: 11102`, `CB 1`. | **ASTORIA.** No street address. |
| **"Long Island City" itself** | — | DCP JSON, confirmed: `QN0201 Long Island City-Hunters Point` sits in `QN02 … (CD 2 Approximation)`. The CD-1 unit is `QN0105 Queensbridge-Ravenswood-Dutch Kills`. | **The finder's F13 is CONFIRMED and it contradicts the wave premise.** See warnings. |

---

## PUBLISHABLE STREET ADDRESSES — the exact strings

**Have a publishable street address (verified this session):**

| Place | Exact string |
|---|---|
| Astoria Park Pool and Play Center | `19th Street between 22nd Drive and Hoyt Avenue North` |
| Famous Players-Lasky Studio | `35-11 35th Avenue` |
| Kaufman Astoria Studios (company) | `34-12 36th Street` |
| Sohmer & Company Piano Factory | `31-01 Vernon Boulevard` (a/k/a `11-02 to 11-16 31st Avenue`) |
| Benjamin T. Pike House / Steinway Mansion | `18-33 41st Street` |
| Lawrence Family Graveyard | `southeast corner of 20th Road and 35th Street` |
| Abraham Lent House | `78-03 19th Road` |
| Moore-Jackson Cemetery | `51st to 54th Streets between 31st and 32nd Avenues` |
| Barkin, Levin & Company Office Pavilion | `12-12 33rd Avenue` |
| Bank of the Manhattan Company Building | `29-27 Queens Plaza North` |
| Socrates Sculpture Park | `32-01 Vernon Boulevard` (institution) / `Vernon Blvd. bet. Broadway and 30 Dr.` (NYC Parks) |
| Museum of the Moving Image | `36-01 35th Avenue` |
| The Noguchi Museum | `9-01 33rd Road (at Vernon Boulevard)` |
| Greater Astoria Historical Society | `32-63 48 Street` |
| Bohemian Hall & Beer Garden | `29-19 24th Avenue` |
| Taverna Kyclades | `36-01 Ditmars Blvd` |
| Bahari Estiatorio | `31-14 Broadway` |
| Sweet Afton | `30-09 34th St` |
| + the 19 DOHMH-only businesses and ~30 DCLA-listed organizations | as recorded, verbatim |

**Have NO publishable street address:**
- **Astoria Park** (R3)
- **Athens Square** — "adjacent to P.S. 17" is not an address
- **Hallets Cove Playground**
- **Ralph DeMarco Park**, **Queens' Rainey Park** — unsourced entirely
- **Astoria Performing Arts Center** — DCLA `address` field literally reads `"Kaufman Astoria Studios"`
- **Kaufman Arts District Foundation** — DCLA `address` field reads `"c/o Kaufman Astoria Studios"`

---

## DOHMH-ONLY PLACES — existence and address may ship, NOTHING in prose

**These 19 businesses have NO source other than the DOHMH restaurant-inspection dataset.** I
re-queried and confirmed every field value verbatim. **Their existence and their address may be
published. Nothing about them may appear in prose** — not that they are good, notable, old,
authentic, popular, Greek-in-any-cultural-sense, or even open. A permit record establishes that a
permitted establishment with that name and address was inspected. That is the entire claim.

`AGNANTI` `19-06 DITMARS BOULEVARD` 11105 Greek · `TELLY'S TAVERNA` `28-11 23 AVENUE` 11105 Greek ·
`ELIAS CORNER FOR FISH` `24-02 31 STREET` 11102 Seafood · `STAMATIS` `29-09 23 AVENUE` 11105 Greek ·
`CHRISTOS STEAKHOUSE` `41-08 23 AVENUE` **11105** Steakhouse · `OMONIA CAFE` `32-20 BROADWAY` 11106
Greek · `OMONIA NEXT DOOR` `32-16 BROADWAY` 11106 Bakery Products/Desserts · `KABAB CAFE` `25-12
STEINWAY STREET` 11103 Egyptian · `MOMBAR` `25-22 STEINWAY STREET` 11103 Egyptian · `MILKFLOWER`
`34-12 31 AVENUE` 11106 Pizza · `PYE BOAT NOODLE` `35-13 BROADWAY` 11106 Thai · `SEVA INDIAN
CUISINE` `34-11 30 AVENUE` 11103 Indian · `RIZZO'S FINE PIZZA` `30-13 STEINWAY STREET` 11103 Pizza ·
`HINOMARU RAMEN` `33-18 DITMARS BOULEVARD` 11105 Japanese · `AREPAS CAFE` `33-07 36 AVENUE` 11106
Latin American · `GYRO UNO` `28-01 STEINWAY STREET` 11103 Mediterranean · `GYRO WORLD` `36-02 30
AVENUE` 11103 Mediterranean · `GYRO CITY` `37-06 30 AVENUE` 11103 (blank cuisine) · `TASTE OF GYRO`
`20-48 42 STREET` 11105 Greek

Corrections to the finder's block: `CHRISTOS STEAKHOUSE` is zip **11105** (the finder wrote 11105 —
correct); `HINOMARU` also appears as a second record with no cuisine tag at the same address; and
`SWEET AFTON / SIDEKICK` **is** in the dataset (R2), so Sweet Afton is not DOHMH-only.

**The finder's central constraint is CONFIRMED and I want it restated:** the DOHMH dataset carries
a ZIP code and no neighborhood field whatsoever. **It can never settle an Astoria / Ditmars-Steinway
/ LIC question, in either direction.**

---

## SINGLE-SOURCED CLAIMS — may they ship?

| Claim | Sole source | May it ship? |
|---|---|---|
| **Everything about Museum of the Moving Image except its address** (F135–F139: founding 1981, "the nation's only museum devoted to film, television and digital media", *Behind the Screen* 15,000 sq ft / 1,400 artifacts, 2011 Leeser expansion, 400 films/year) | `nyc-arts.org`, which **states on its own page that it is no longer actively maintained** | **NO.** I did not re-fetch it and would not rely on it if I had. **UNCERTAIN — hold all five.** The address (`36-01 35th Avenue`, DCLA) ships; the museum ships as a name and an address only until someone reaches a primary source. |
| **"New York City's Oldest Beer Garden / est. 1910"** | Bohemian Hall's own marketing | **With attribution only** — "the bar describes itself as…". Not as fact. |
| **"the largest [collection] outside of NYPL"** (GAHS) | GAHS's own website | **With attribution only.** Extraordinary claim, self-made, unaudited. |
| **"Taverna Kyclades… is one of the top Greek restaurants in New York City"** | The restaurant's own site | **NO.** Pure promotion. The *address* and the fact that it is Greek ship. |
| **"Astoria's Neighborhood spot"** (Sweet Afton) | Own site | Attribution only. |
| **"the people of Astoria, New York's largest Greek community"** | NYC Parks signage, late-1990s vintage (the same page names Giuliani and Shulman) | **Attribution + date-hedge required.** "Park signage installed in the late 1990s describes…" **Never as a present-tense fact.** |
| **All Wikipedia material (F1–F10)** | `en.wikipedia.org`, reached through a summarizing model by both the finder and me | **Leads only.** F1 (Elizabeth Fones / 1652) is directly contradicted by NYC Parks (Elizabeth **Feake** / 1659) — **prefer NYC Parks.** F6 is refuted (R11). F9/F10 uncertain. |
| **F247 Steinway Street PLUTO lot ages** | The finder's own inference from tax-lot data | **NO.** The finder labelled it an inference and was right to. I did not re-run the query. **UNCERTAIN.** No source says this. |
| **Astoria Park acreage** | Three sources, three numbers | Ship **59.96** (NYC Parks data panel, confirmed, and independently matched by the sibling verifier). Note LP-2196's "sixty-six acre" — confirmed verbatim — as a discrepancy if you mention it at all. |

---

## UNCERTAIN — 14 claims I will not confirm

F9 (notable natives beyond Bennett/Walken) · F10 (St. Michael's burials; the article's sentence is
*"Both are interred at St. Michael's Cemetery"* with an antecedent I could not resolve) · F121
(Lent house "one of tho very last of tho Dutch Colonial farmhouses" — I confirmed the surrounding
passage but not this exact string) · F135–F139 (all five MoMI claims, stale aggregator) · F197
(St. Demetrios — I did not re-test the domains) · F82 (Ralph DeMarco Park) · Rainey Park · Hallets
Cove `Park ID Q226` / `Acreage 5.84` (I captured the page but not that panel) · Athens Square street
address · F247 (PLUTO corridor inference).

---

## WARNINGS FOR THE AUTHOR

1. **The wave premise is wrong and this is now confirmed twice over.** DCP's own JSON puts
   `Long Island City-Hunters Point` (`QN0201`) in **CD 2**, not CD 1. Astoria and Ditmars-Steinway
   really are contiguous and really do share CD 1 — DCP in fact **fuses them into one NTA,
   `QN0101 "Astoria (North)-Ditmars-Steinway"`, with no boundary between them at all.** But the LIC
   that carries the name is not in Astoria's community district. **Do not write "all three sit in
   Queens Community District 1."**

2. **`QN0101` is a trap for this wave.** It is a *single* tabulation area covering both Astoria
   (North) **and** Ditmars-Steinway. Any place the author assigns using `nta = QN0101` has been
   assigned to **both** neighborhoods simultaneously. At least **eight** DCLA organizations sit in
   QN0101 with `city: "Astoria"` — including four the finder never flagged (Muslim American Society
   of Queens, Astoria Music Society, Greek American Educational Public Information System,
   Greek-American Broadcasting). **QN0101 cannot arbitrate Astoria vs. Ditmars-Steinway. Nothing
   can, on this data.**

3. **Bohemian Hall's ZIP: use 11102, not 11105.** The sibling Ditmars-Steinway verdicts file records
   *"29-19 24th Avenue, Astoria, Queens, New York, U.S. 11105"* from Wikipedia. **Two primary
   sources say 11102** — the business's own site footer (`"29-19 24th Avenue / Astoria, New York
   11102"`) and DOHMH (`29-19 24 AVENUE`, `11102`). **The Astoria file's ZIP is better evidenced.**
   Flag this to the arbitrator so the two files do not ship contradicting each other.

4. **F64 is now safe to use, and only now.** The finder correctly refused to publish *"Most of the
   other pools, including Astoria, were placed in white neighborhoods"* without its paragraph. I
   recovered it. LP-2196 verbatim: *"Moses was also known to have been insensitive to people of
   color, and tried to restrict access to many of his recreational facilities, including the pools.
   He determined that the Colonial Park pool in Harlem would be the only one for minority use. Most
   of the other pools, including Astoria, were placed in white neighborhoods."* The subject is
   **Robert Moses's deliberate siting of the eleven 1936 WPA pools**. It is publishable **with that
   context and attributed to LPC designation report LP-2196**. It is **not** publishable as a
   free-floating sentence about Astoria.

5. **Astoria Park has no street address.** Do not let the finder's constructed boundary string reach
   print (R3).

6. **Never cite `kaufmanartsdistrict.org` or `agnantimeze.com`.** I re-fetched both. Confirmed
   hijacked: they now serve Indonesian gambling sites ("Bakso108" and "SIP69" respectively). The
   Kaufman Arts District Foundation exists only as a DCLA row (`c/o Kaufman Astoria Studios`,
   Astoria, 11106, CB #1, phone `(718) 705-5075`) — **no address, no website, no prose.**

7. **Apartment-unit addresses are not venues.** The finder's caution is correct and I extend it:
   `20-12 20th Street, Apt. 2C` · `24-54 29th Street #2A` · `24-50 29th St., Apt 3A` ·
   `31-57 31st St, Unit 617` · `2138 Crescent St D3` · `1919 24th Avenue, L210` are the mailing
   addresses of small nonprofits. **Never present these to a traveler as places to visit.**

8. **The Astoria Park history page was rewritten between April 2025 and July 2026.** If any later
   reviewer checks the finder's Parks quotes against a stale capture they will wrongly conclude the
   finder fabricated them. It did not. Pin the capture.

9. **Steinway & Sons, St. Demetrios Cathedral, the Astoria Generating Station / "Big Allis", the
   Welling Court Mural Project, Titan Foods, and any Astoria population figure remain unsourced.**
   The finder's gap list is honest and I confirm every item on it. **These are gaps in method, not
   evidence that the things are unimportant** — several are among the most significant things in
   the neighborhood. Do not let their absence from the file shape the article's emphasis.
