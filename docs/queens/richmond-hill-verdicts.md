# Richmond Hill, Queens — VERIFIER verdicts (wave 6, CD 9)

**Role: INDEPENDENT VERIFIER.** I re-fetched the finder's cited sources myself and re-quoted from my
own retrievals. I did not take any string the finder presented as a quote on trust.

## 0. WHAT I RETRIEVED MYSELF

Everything below rests on my own fetches, not the finder's:

- **NRHP nomination 100003430** (Richmond Hill Historic District), `npgallery.nps.gov`, 12,579,666
  bytes, extracted with `pdftotext` **twice** — once with `-layout` and once without. *(The second
  extraction matters; see §2.)*
- **LPC designation reports** LP-2126 (5,426,695 B), LP-2317 (2,820,961 B), LP-2473 (5,778,996 B),
  LP-2175 (1,550,606 B), from `s-media.nyc.gov`.
- **Wikipedia action API** extracts for 21 articles, plus `action=parse` wikitext for the
  *National Register of Historic Places listings in Queens, New York* table and for the main
  Richmond Hill article.
- **NYC Open Data**: NTA 2020 (`9nt8-h7nd`, 262 rows / 82 Queens), Parks Properties (`enfh-gkve`),
  LPC Individual Landmark Sites (`buis-pvji`, 86 Queens rows), **LPC Historic Districts
  (`skyk-mpzq`)** — a dataset the finder did not query — and DOHMH `43nn-pn8j`.
- **DCP GeoSearch** geocodes and my own ray-casting point-in-polygon implementation, run
  independently of the finder's.
- **NYC Parks** pages for Q217, Q129, Jacob Riis Triangle, **Q217/monuments** and Alley Pond Park.
- `richmondhillhistory.org` home, CHURCHES and BUSINESSES pages.

**Bulk quote audit.** I mechanically extracted every string the finder presents inside `"…"` after a
**QUOTE:** marker — **410 strings across the 396 facts** — and tested each against my own retrievals.
**378 located; 350 of those byte-exact after whitespace/typography normalisation.** I then resolved
all 32 non-locating strings by hand. Twenty-five were artefacts of my own corpus (dataset JSON and
HTML-list files excluded from the automated pass, or line-wrap). **Seven were real problems**, and
they are the refutations in §2.

**A high hit rate is not a clean bill of health.** The finder is an unusually accurate transcriber —
its Wikipedia and primary-PDF quotations are near-flawless. Its failures are not misquotation. They
are **four confident negative claims ("this is not in evidence") that are false**, one **blanket
geographic claim that is false for two of its own candidates**, and a handful of **fabricated
sentence boundaries**. Those are more dangerous than a misquote, because a negative claim tells the
author to stop looking.

---

## 1. HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated | **396** (F1–F396, contiguous; I re-verified the numbering programmatically) |
| **Confirmed** | **341** |
| **Refuted** | **14** |
| **Uncertain** | **41** |
| Candidate places | 62 (P1–P62) |
| **Places surviving as publishable** | **23** |

---

## 2. REFUTED — fourteen findings

### R1. F9 is false. The Parks monuments endpoint works.

**F9 claims:** `nycgovparks.org/parks/Q217/monuments` "returned a zero-byte response."

**It does not.** My fetch returned **22,368 bytes**. It is a complete monument record.

### R2. F284 is false, and it is the most consequential error in the dossier.

**F284 claims** the one sentence on the McConnell history page "is the ENTIRE evidence base," and
that "**No dedication date, no sculptor, no inscription is in evidence.**"

All three are in evidence. From my retrieval of `nycgovparks.org/parks/Q217/monuments`, verbatim:

> **QUOTE:** `"Morris Park World War Memorial"` … `"Dedicated: 1923; 1973"` …
> `"Location: Atlantic Avenue and Lefferts Blvd."` … `"Description: Stele, 2 tablets"` …
> `"Architect: H. Adler"` … `"Materials: Bronze, Deer Island granite"` …
> `"Dimensions: Plaque 1 H: 4'6" W: 2'6"; Plaque 2 H: 28 1/2" W: 12"; Plinth H: 10' W: 5'4" D: 2'"` …
> `"Donor: Lt. F. J. McConnell Post No.229, V.F.W. (new plaque)"`

And the inscription, which F284 says does not exist:

> **QUOTE:** `"Plaque 1: DEDICATED / TO THE SONS OF MORRIS PARK AND / VICINITY WHO SERVED IN THE /
> WORLD WAR -1917-18 AND IN LOVING / REMEMBRANCE OF THE FOLLOWING / MEN WHO MADE THE SUPREME
> SACRIFICE / (NAMES OF 70 WAR DEAD)/ Plaque 2: (EAGLE) / V.F.W. SEAL / WITH UNDYING LOVE / AND
> GRATITUDE / TO GIVE HOMAG…"`

**P43 goes from a one-sentence stub to a fully documented monument.** Note the parenthetical
`"(NAMES OF 70 WAR DEAD)"` is **Parks' own editorial summary of the plaque**, not the plaque's text —
do not write that the plaque literally reads that.

**NAME CONFLICT, newly established.** Parks' monument record titles it
**`"Morris Park World War Memorial"`**. Parks' *own* McConnell history page calls it
**`"the Morris Park World War I Memorial"`**. The monument record is the custodial source for the
monument; prefer it, and note the variant.

### R3. F391 is false. The Haugaard sentence is not cut off.

**F391 claims** LP-2126's `"William E. Haugaard became New York State"` "is cut off at the scan's
column break," that the completion "is **NOT** in evidence," and "**Do not complete it.**"

The finder extracted LP-2126 with column-preserving layout, which interleaves the two columns. I
extracted it **without** `-layout`. The sentence is complete and continuous:

> **QUOTE (LP-2126):** `"The Haugaard architectural legacy did, however, continue on into the next
> generation with two of the Haugaard sons becoming noteworthy in their fields. William E. Haugaard
> became New York State Architect in 1928 and John T. Haugaard Jr. worked as Senior Housing Control
> Architect and Associate Architect for the State of New York."`

### R4. F126 is false, by the same mechanism.

**F126 claims** the LP-2126 demographic sentence "is cut off at a column break in the scan; the
continuation is not legible. **Do not complete it.**" It is legible:

> **QUOTE (LP-2126):** `"…a population of mostly German and Irish descent gave way to an influx of
> Latin Americans. Still, Richmond Hill remains a low-rise neighborhood of two-family houses and
> apartment buildings."`

**Author: R3 and R4 share one root cause.** Any other place the finder says an LP-2126 sentence is
"cut off at a column break," assume it is not, and re-extract.

### R5. The §3.1 blanket geographic claim is false for two of its own candidates.

**§3.1 states:** "All are inside the NRHP district; **all geocode to NTA `QN0902 Richmond Hill`**."

I geocoded all sixteen addresses named in §3.1 through GeoSearch and ran my own point-in-polygon.
**Two are in Kew Gardens by every instrument** — and they are **P5**, the pair the nomination
singles out as its Wade & Cullingford exemplars (F142):

| Address | GeoSearch label | ZIP | PIP |
|---|---|---|---|
| **84-48 118th Street** | `84-48 118 STREET, Kew Gardens, NY, USA` | **11415** (Kew Gardens ZIP) | **QN0901 Kew Gardens** |
| **117-03 85th Avenue** | `117-03 85 AVENUE, Kew Gardens, NY, USA` | 11418 | **QN0901 Kew Gardens** |

Four more return **GeoSearch neighbourhood `Kew Gardens`** while PIP still says Richmond Hill —
including **P1, 116-03 85th Avenue**, the Albon Platt Man house the finder leads §3.1 with:
`116-03 85 AVENUE, Kew Gardens, NY, USA`. Also `84-27 116th Street`, `114-03 84th Avenue`,
`84-50 117th Street`.

**This is structural, not clerical.** The historic district's northern tier — 84th Avenue, the
original Division Avenue — *is* the Kew Gardens line, exactly as the nomination says (F23, F26, F27).
A house can be in the Richmond Hill Historic District and in Kew Gardens' tabulation area at once.

### R6. F359 is resolvable, and it resolves against Richmond Hill.

The finder marks Engine Co. 285 / Ladder Co. 142 at **103-17 98th Street** "Contested; record, do not
resolve," arguing only from §1 boundaries. It is not contested once you geocode it:

> GeoSearch: `103-17 98 STREET, **Ozone Park**, NY, USA`, **postal code 11417** — not one of the
> ZIPs any §1 source assigns to Richmond Hill. My PIP: **`QN1002 Ozone Park`, CDTA `QN10`
> (Community District 10)**.

The city's own geocoder names the neighborhood, and it is not this one. **Wikipedia's `"Richmond
Hill contains"` is refuted. Do not give this firehouse a Richmond Hill record.**

The other two survive: **Engine 294 / Ladder 143, 101-02 Jamaica Avenue** and **Squad 270 /
Division 13, 91-45 121st Street** both geocode `Richmond Hill, NY`, ZIP 11418, PIP `QN0902`.

### R7. F308's establishment count is wrong today.

F308 gives "**202** unique establishments (by CAMIS)" in 11418/11419 and "(blank) **14**." My query
of the same dataset returns **205 unique CAMIS** and **17 blanks**. Every other cuisine count
replicates exactly (Caribbean 45, Indian 21, American 16, Chinese 15, Latin American 11, Pizza 11,
Bakery 8, Spanish 7, Mexican 6, Donuts 6, Sandwiches 4, Fusion 4, Italian 4, Hamburgers 4, Chicken 4,
Tex-Mex 3, Coffee/Tea 3). **The total is a live permit count and drifts week to week. Never publish
it as a number.** F309's *shape* claim survives and is confirmed: Caribbean at 45 is more than double
Indian at 21, and the two together are 66/205 ≈ a third.

### R8. F182's reasoning is circular; its conclusion is right for a different reason.

F182 infers "there is no LPC-designated historic district in Richmond Hill" from the fact that "the
LPC dataset returns only individual landmarks for CD 409." That dataset is **Individual Landmark
Sites** — it can only ever return individual landmarks. The inference is vacuous.

**The conclusion is nonetheless correct**, on a source the finder did not query. LPC **Historic
Districts** (`skyk-mpzq`) has 141 rows, **13 in Queens**: Cambria Heights-222nd St, Cambria
Heights-227th St, Ridgewood South, Jackson Heights, Addisleigh Park, Central Ridgewood, Sunnyside
Gardens, Stockholm Street, Hunters Point, Douglaston, Douglaston Hill (amendment), Ridgewood North,
Fort Totten. **None is in Richmond Hill.** Confirmed on evidence.

### R9–R11. Three quotations have fabricated sentence boundaries.

The strings are accurate; the **punctuation is not**, and each is quoted as a complete sentence when
the source runs on. The author must not reproduce these as sentences.

- **F32** — finder: `"The district includes 200 contributing buildings built between 1890 and 1915."`
  Source continues without a stop: `"…between 1890 and 1915 next to the former South Side Railroad
  line (now the Long Island Rail Road's Montauk Branch) and the Richmond Hill station at Hillside
  Avenue, shaped roughly like a triangle."`
- **F36** — finder: `"The dominant architecture is called the Shingle style."` Source is a comma
  splice: `"The dominant architecture is called the Shingle style, there are also many in an earlier
  style called the Stick style…"` The finder's framing of F36 as contradicting the nomination
  survives; the sentence does not.
- **F203 / F344 / F375** — all three present **bullet lists** as comma-separated prose. Wikipedia's
  private-schools list, its elementary-school list and RHHS's activities list are line items. The
  content is confirmed; the comma-joined "quotes" are the finder's construction. *(Counted as one
  refutation.)*

### R12. F326 overcounts the RKO name variants.

F326 claims three spellings and attributes `"RKO Keith's Richmond Hill Theatre"` to the Wikipedia
Historic District article. **That article says "Theater," not "Theatre"** — identical to the main
article:

> **QUOTE (Wikipedia HD article):** `"Between Myrtle Avenue and the Montauk Line railroad is a former
> movie theatre, RKO Keith's Richmond Hill Theater, opened in 1929, functioning since 1968 as a bingo
> hall."`

**Two variants, not three:** `RKO Keith's Theater` (its own article) and `RKO Keith's Richmond Hill
Theater` (both other articles). The "-tre" spelling is not in evidence.

### R13. F330 understates the overlap.

F330 says the HD article "repeats [the Jahn's sentence] nearly verbatim." It repeats it **exactly**,
as it does the RKO sentence and the Gati sentence. **The two Wikipedia articles are not independent
witnesses to any of this. Treat all three as single-source.**

### R14. F220's attribution is off by a word.

The finder's quote opens `"The Richmond Hill station was originally built…"`. The article's History
section reads `"Richmond Hill station was originally built…"` — no leading article. Trivial in
itself, recorded because it is the only transcription slip I found in 410 strings and the author may
be quoting verbatim. **The substance, including `"distinct from the nearby Clarenceville station on
the Atlantic Branch,"` is confirmed** — it is in the History section, not the lead, which is why a
lead-only check would appear to refute it.

---

## 3. NEIGHBORHOOD ASSIGNMENT — RULINGS

Method for every row: DCP GeoSearch geocode (label, neighbourhood field, postal code) + my own
ray-casting point-in-polygon against the 82 Queens NTA-2020 polygons, cross-read against what each
prose source actually says. Where a source states a neighborhood in words, the words outrank the
geometry; where no source states one, geometry decides; where they conflict I say so.

The relevant tabulation geography, from DCP's own field, confirmed by my fetch:

> **QUOTE (`9nt8-h7nd`, cdtaname):** `"QN09 Kew Gardens-Richmond Hill-Woodhaven (CD 9 Approximation)"`

containing `QN0901 Kew Gardens` (shape_area 20,284,899), **`QN0902 Richmond Hill` (30,269,746)** and
**`QN0903 South Richmond Hill` (15,849,140)**. F12 and F13 confirmed exactly.

### 3.1 RICHMOND HILL — confirmed, with exact address

| Place | Exact address string | Evidence |
|---|---|---|
| **P15 Richmond Hill Republican Club** | `86-15 Lefferts Boulevard, Richmond Hill, NY 11418` | LP-2126 header verbatim; LPC row NTA `QN0902`; my geocode `86-15 LEFFERTS BOULEVARD, Richmond Hill, NY`; PIP `QN0902`. LP-2126: `"An integral part of downtown Richmond Hill"` |
| **P16 Public School 66** | `85-11 102nd Street, Richmond Hill, NY 11418` | LP-2317: `"P.S. 66 is geographically located in east central Queens, just south of the verdant Forest Park in the neighborhood of Richmond Hill."` NRHP table city=`Richmond Hill`. PIP `QN0902` |
| **P17 Eldridge House** | `87-61 111th Street, Richmond Hill, NY 11418` | LP-2473 header verbatim; PIP `QN0902`. *LPC dataset spells it `"87-61 111st Street"` — a dataset typo; use LP-2473's `111th`* |
| **P19 Church of the Resurrection** | `85-09 118th Street, Richmond Hill, NY 11415` | see §3.2 |
| **P20 St. Benedict Joseph Labre Parish** | `94-40 118th Street, Richmond Hill, NY 11419` | see §3.2 |
| **P41 Phil "Scooter" Rizzuto Park** | `125-02 Atlantic Avenue, Richmond Hill, NY 11419` | see §3.2 |
| **P53 Richmond Hill High School** | `89-30 114th Street, Richmond Hill, NY 11418` | geocode + PIP `QN0902` |
| **P56 102nd Precinct** | `87-34 118th Street, Richmond Hill, NY 11418` | geocode + PIP `QN0902`. **A three-neighborhood command** — Wikipedia: `"Kew Gardens, Richmond Hill, and Woodhaven are patrolled by the 102nd Precinct"` |
| **P57 Engine 294 / Ladder 143** | `101-02 Jamaica Avenue, Richmond Hill, NY 11418` | geocode + PIP `QN0902` |
| **P57 Squad 270 / Division 13** | `91-45 121st Street, Richmond Hill, NY 11418` | geocode + PIP `QN0902` |
| **P58 Richmond Hill Station (USPS)** | `122-01 Jamaica Avenue, Richmond Hill, NY 11418` | geocode + PIP `QN0902`. *Wikipedia hedges: `"two post offices nearby"`* |
| **P60 Richmond Hill Historical Society** | `112-13 84th Avenue, Richmond Hill, NY 11418` | its own site, verbatim from my fetch; PIP `QN0902`; inside the NRHP district |
| **P50 RKO Keith's Theater** | `117-09 Hillside Avenue, Richmond Hill, NY 11418` | article text verbatim; PIP `QN0902` |
| **P23 Holy Child Jesus** | `111-11 86th Avenue, Richmond Hill, NY 11418` | geocode + PIP `QN0902`. **Existence and address only** — no source describes the church |
| **QPL Richmond Hill branch** | `118-14 Hillside Avenue, Richmond Hill, NY 11418` | Wikipedia; PIP `QN0902`. **Uncontested** |

### 3.2 CONTESTED — resolved

**P19 CHURCH OF THE RESURRECTION → RICHMOND HILL.** The finder called this "the single most contested
place in the dossier" and declined to resolve. It resolves. Six instruments, and the count is
lopsided:

- **NRHP table** (my `action=parse` fetch of the wikitext, verbatim):
  `|address=85-09 118th St. |city=[[Kew Gardens, Queens|Kew Gardens]]/[[Richmond Hill, Queens|Richmond Hill]]`
  — names both, decides nothing.
- **The article's own first sentence:** `"The Church of the Resurrection is a historic Episcopal
  church and rectory in Richmond Hill, Queens, New York City."` — **prose, unambiguous.**
- **Wikipedia's Richmond Hill article:** `"The northern edge of Richmond Hill contains the Church of
  the Resurrection."`
- **GeoSearch:** `85-09 118 STREET, Richmond Hill, NY, USA`, neighbourhood field **`Richmond Hill`**.
- **My PIP, twice** — on the geocode and independently on the NRHP table's own coordinate
  (40.702291, −73.83242): **`QN0902 Richmond Hill`** both times.
- **Against:** the Wikipedia article *title* is `Church of the Resurrection (Kew Gardens, Borough of
  Queens, New York)`, and the ZIP is **11415, the Kew Gardens ZIP**.

**A page title is a disambiguator, not a claim, and it is contradicted by the article's own first
sentence.** The ZIP is the only real counter-evidence, and postal geography is not neighborhood
geography — the nomination's own cover sheet gives the whole historic district as `"11415, 11418"`
(F22, confirmed), so 11415 reaches well into Richmond Hill. **Richmond Hill is much better evidenced.
Assign it here.** Record the ZIP oddity in prose; it is a genuine fact about the seam.

Separately, the nomination places the building **outside** the district — `"it was built in 1874 on
land donated by the Man estate just east of the historic district"` — while the HD article says
`"On the eastern edge of the district sits the Church of the Resurrection."` **The nomination is the
primary document and defines the district. Do not write that the church is in the historic district.**

**P20 ST. BENEDICT JOSEPH LABRE → RICHMOND HILL** (South Richmond Hill sub-area). NRHP table
`|address=94-40 118th St. |city=[[Richmond Hill, New York|Richmond Hill]]`; the article: `"located at
94-40 118th Street in Richmond Hill, Queens, New York City."` My PIP returns **`QN0903 South Richmond
Hill`** on both the geocode and the NRHP coordinate. **These do not conflict** — Wikipedia itself
(F19, confirmed): `"The portion of the neighborhood south of Atlantic Avenue is also known as South
Richmond Hill."` South Richmond Hill is *part of* Richmond Hill, not a rival. **The record belongs
here; the prose may say South Richmond Hill.** Same reasoning disposes of **P41 Rizzuto Park**
(PIP `QN0903`, Parks says ZIP `"11418, 11419"`, address `125-02 ATLANTIC AVENUE`) and the P22
hypothesis.

**P21 KENT MANOR → KEW GARDENS. Not this file.** NRHP: `|city=[[Kew Gardens, Queens|Kew Gardens]]`.
My PIP on the geocode **and** on the NRHP's own coordinate (40.7082, −73.8372): **`QN0901 Kew
Gardens`** both times. The only Richmond Hill signal is ZIP 11418. GeoSearch's third answer is real
and I reproduce it exactly — `117-01 PARK LANE SOUTH, **Forest Park**, NY, USA` — and it is
**not a licence to write about Forest Park.** Two independent instruments say Kew Gardens; one says a
park that belongs to no file. **Kew Gardens, clearly.**

**P18 RALPH BUNCHE HOUSE → KEW GARDENS. Not this file.** LPC row NTA `QN0901`; NRHP
`|city=[[Kew Gardens, Queens|Kew Gardens]]`; my PIP on the LPC coordinate (40.7064299, −73.8369942)
and on the NRHP coordinate (40.706944, −73.837778): `QN0901` both. GeoSearch: `115-24 GROSVENOR ROAD,
**Kew Gardens**, NY`. **No source anywhere places it in Richmond Hill.** The finder's address
discrepancy (F181) is confirmed — LPC `115-24`, NRHP table `115-125`. **One thing the finder missed:
the NRHP row is `|type=NHL` — this is a National Historic *Landmark*, not an ordinary listing.** If
Kew Gardens' file has not said so, tell the coordinator.

**P29 QPL LEFFERTS BRANCH → NOT THIS FILE.** Wikipedia claims it (`"two branches in Richmond Hill"`)
and GeoSearch's neighbourhood field says `Richmond Hill`, but my PIP puts `103-34 Lefferts Boulevard`
in **`QN1001 South Ozone Park`, CDTA `QN10` — Community District 10.** A branch in another community
district is not this neighborhood's institution on one encyclopedia sentence. **Uncertain-to-
negative: do not give it a record here.** The Hillside Avenue branch is uncontested and sufficient.

**P58 SOUTH RICHMOND HILL POST OFFICE → NOT THIS FILE.** The finder did not test this one. I did:
`117-04 101 AVENUE`, GeoSearch neighbourhood `Richmond Hill`, ZIP 11419, but **PIP `QN1001 South
Ozone Park`, CD 10.** Same disposition as P29, and Wikipedia's own hedge is `"nearby"`.

**P30 121ST STREET STATION → SHARED, and Kew Gardens has the equal claim.** Confirmed verbatim from
my own fetch of the correct article: `"Located at the intersection of 121st Street and Jamaica Avenue
in Richmond Hill and Kew Gardens, Queens"`. **One sentence, two neighborhoods. Coordinator: this
must not be written up in both files.**

**P31 / P32 / P33 → NOT THIS FILE.** Each station article names another neighborhood first and the
Richmond Hill claim rests solely on a list sentence in Wikipedia's RH article (F209, confirmed as a
quote). `"located on Liberty Avenue at 111th Street in **South Ozone Park and South Richmond Hill**"`;
`"not actually located in Ozone Park, but rather in the adjacent neighborhood of **South Ozone
Park**, with part of the station also in South Richmond Hill"`. Jamaica–Van Wyck sits on the Van Wyck
Expressway, which **every** §1 source makes Richmond Hill's *eastern edge* — an edge is a boundary,
not a container, and the station carries **Jamaica** in its name. **Route to them; do not claim them.**

**P37 111th Street (BMT Jamaica) and P38 104th Street (BMT Jamaica) → RICHMOND HILL.** The only two
stations any source assigns to Richmond Hill alone: `"in Richmond Hill, Queens, it is served at all
times by the J train"` and `"located on Jamaica Avenue between 102nd and 104th Streets in Richmond
Hill, Queens."` Both confirmed verbatim.

**P34 MORRIS PARK FACILITY (LIRR) → UNCERTAIN, no assignment.** Confirmed that **no source assigns it
a neighborhood.** It is named for Richmond Hill's Morris Park sub-settlement (F57, confirmed) and
adjoins a yard named Richmond Hill. That is suggestive and it is not evidence. **State the
relationship; do not state a location.**

**P35 RICHMOND HILL LIRR STATION → RICHMOND HILL, location unresolved.** Three incompatible
locations, all now confirmed from my own fetches — and there is a **third** the finder did not have:

- RH main article: `"on Hillside Avenue and Babbage Street along the Montauk Branch"`
- Station article: `"located at Myrtle Avenue and cuts diagonally from the intersection of Jamaica
  Avenue and Lefferts Boulevard through to Hillside Avenue"`
- **Clarenceville station (LIRR) article** (my fetch; the finder's returned a 245-byte stub):
  `"Richmond Hill station to the north, **at Jamaica Avenue and Lefferts Boulevard**, was also
  originally named Clarenceville Station when it opened in 1868, but that name was changed in 1871."`

**No publishable street address. Describe it by its Montauk Branch viaduct, not by an intersection.**

**P36 CLARENCEVILLE STATION (Atlantic Branch) → RICHMOND HILL.** Newly in evidence from my fetch:
`"The Clarenceville station was on the Atlantic Branch of the Long Island Rail Road, located on
Atlantic Avenue west of 111th Street in the Richmond Hill section of Queens, New York City."`

**P45 LIBERTY AVENUE → PARTIAL ONLY.** Confirmed: `"Liberty Avenue is an 8-mile (13 km) long
west-east avenue in Brooklyn and Queens"`. **May not be claimed whole.** The nomination supplies the
governing precedent *from this neighborhood's own primary document* (F136, confirmed verbatim):
`"As a portion of a resource cannot be listed and the bridge extends far beyond the boundaries of the
historic district, NPS staff recommended this course of action."` Same logic, same answer. Write only
the South Richmond Hill stretch.

**P40 / P42 parks → RICHMOND HILL, but neither has a street address.** McConnell carries the only
direct agency assignment in the dossier, confirmed verbatim from my fetch of Q217/history:
`"This park is located in Richmond Hill."` **Neither `Q142` nor `Q217` has an `address` field in
Parks Properties** — only `location` strings (`"Bessemer St., 116 St., 85 Ave."` and `"94 Ave.,
Atlantic Ave. bet. Leffers Blvd. and 120 St."`, the dataset's own `"Leffers"` typo confirmed).
**Publish the location string, not a fabricated street address.** F260's 2× acreage discrepancy is
confirmed (`0.005` in open data, `"Acreage: 0.01"` on the page); F282's is confirmed (`0.207` vs
`0.21`). Both parks are `councildistrict 29`, confirming F382 against Wikipedia's F381 list of 28/30/32.

**FOREST PARK, FLUSHING MEADOWS–CORONA PARK, CITI FIELD PLACES.** The finder's restraint (F392, F393)
is confirmed and correct. Forest Park appears only as a boundary or a relatum. **One live temptation
remains and the author must be told:** the Battle of Long Island claim (F47) is confirmed in **two**
sources — Wikipedia and, verbatim from my own fetch of the McConnell page, `"In 1776 the Battle of
Long Island was fought along the ridge in Forest Park, near what is now the golf course clubhouse."`
**It is an event located inside Forest Park. It is out of scope. Do not narrate it.**

**One item the finder missed on that same page**, offered because it is a Richmond Hill fact and not a
Forest Park one: `"The neighborhood gets its name from a hill that was formed by a glacial moraine
from the Wisconsin Glacier."` Confirmed verbatim, NYC Parks Historical Signs Project. **Note it
conflicts with every naming account in §2.6** (London suburb / Edward Richmond) — Parks is explaining
the *hill*, not the *name*, and the sentence is loose. Use with care or not at all.

**P22 SIKH CULTURAL SOCIETY → NO ASSIGNMENT POSSIBLE. DROP.** The finder is right and I confirm it
the hard way: **the address `95-30 118th Street` is the finder's own hypothesis and no retrieved
source states it.** A geocode is not a source. **No record. No prose. Not even a mention of the
address.** This is a real hole in the page — the neighborhood Wikipedia says has `"the largest Sikh
population in the city"` will ship with no gurdwara — and that is the honest outcome of the evidence.
Flag it to the coordinator for a targeted retrieval; do not let the author paper over it.

---

## 4. THE ALLEY POND PARK STRUCTURAL QUESTION — RULING: **(a)**

**Alley Pond Park gets a hosted record, in `bayside.json`, following the Forest Park pattern exactly.**

**Why not (c).** The gate's own comment states its design rationale: *"Asserted as EXACTLY ONCE, not
at-least-once, and the symmetry is the point: at-least-once catches the omission, exactly-once also
catches the duplicate."* Any amendment that lets a listed institution sit at zero reopens the exact
gap the gate was written to close — a future wave could decline to write a park up and cite the
exemption, and no other assertion in the file would notice. The gate also says *"derived from the
corpus it would be vacuous… It has to be written from outside the thing it checks."* An exemption
keyed to a verdict is a corpus-derived carve-out wearing a hand-written coat. **This is weakening a
gate to make a failure go away, which is the thing the brief told me not to do.**

**Why not (b).** It is strictly worse. Forest Park **has** a publishable street address
(`80-30 Park Lane, Queens, NY 11415`), is a 506.86-acre NYC Parks Flagship Park, and its shipped
record in `forest-hills.json` is correct and useful. Deleting it destroys good content — and it does
not even satisfy the gate, which would then fail at **zero for both**. (b) only works if you also do
(c), so it inherits (c)'s defect and adds a deletion.

**Why (a) is right on the merits, not on effort.** *"No neighborhood may claim it"* and *"no file may
host its record"* are different statements, and **wave 4 already resolved the difference correctly.**
The Forest Park record demonstrates the pattern: `town: "Queens"`, no containment claim, and prose
saying plainly *"The park is not administratively part of any neighborhood."* **Hosting is a filing
decision; containment is a factual claim.** The corpus is inconsistent today only because Alley Pond
Park never got the filing decision, not because the ruling differed. (a) makes the corpus consistent
with itself and leaves the invariant at full strength.

**Which file, and why Bayside.** Neither abutter has an evidentiary claim — that is settled. So the
tiebreak must be a stated rule, and it must be labelled as a filing convenience, not as evidence.
Among the **in-scope** abutters, the prior ruling's own findings give exactly one signal that points
anywhere: **area favours Bayside**. Boundary favoured Douglaston, but the third abutter that
outranked Bayside is Oakland Gardens, which is out of scope and cannot host. Forest Park's
tiebreak — the neighborhood named after the park — has no Alley Pond analogue. **`bayside.json`.**

**What the record may contain** (all verified by me against Parks Properties `Q001` and the Alley
Pond Park page):

- `town: "Queens"` — **never `"Bayside"`**. `state: "New York"`, `county: "Queens"`.
- `address: null`. **There is no `address` field on `Q001`.** Do not synthesise one. This is the same
  instrument that says no source places the park anywhere.
- Publishable facts: `signname` **"Alley Pond Park"**, park ID **Q001**, **635.514 acres**,
  `typecategory` **"Flagship Park"**, acquired **1934-08-16**, `location` **"Little Neck Bay to
  Springfield Blvd, Union Tpke"**, ZIPs **11361, 11362, 11363, 11364, 11426**, and — the fact that
  proves the ruling — **Community Board "11, 13"** on the Parks page, reaching Community District 13
  exactly as the prior verdict found.
- Prose **must** state it is in no neighborhood, in the Forest Park register.
- **`in_scope` neighborhoods it touches that have no page — Little Neck, Oakland Gardens, Bellerose —
  must not be narrated.**

**This is an instruction to the coordinator, not to a wave-6 author.** `bayside.json` and
`douglaston.json` have already shipped; wave 6 authors must not touch either. And **the `@tag
:pending_queens` on the marquee test comes off only when this record exists** — landing wave 6
without it wakes the gate to a failure at zero.

---

## 5. DOHMH/DCWP-ONLY BUSINESSES — THE RULE, STATED PLAINLY

**F307 is confirmed in full, and I confirm it against the dataset myself.** For **every** food
business in §10 — and for the 101st Avenue cluster in F306 — **the DOHMH restaurant inspection
dataset is the only source.** No press, no website, no institutional description, no history.

**Their existence and their address may be published. NOTHING about them may appear in prose.**

Not a sentence about what they serve, when they opened, whether they are good, whether they are still
trading, or what they mean to the neighborhood. **A DOHMH row is a permit record, not a description.**
An agency-assigned cuisine label is a filing category and is not a claim about the food.

I re-queried the dataset and confirm these rows exist as the finder reports them (address and ZIP
verbatim from my own fetch):

`TROPICAL ISLE ROTI SHOP & BAKERY, 118-19 Liberty Avenue, 11419` · `JULIE'S BAKERY & ROTI SHOP,
117-16 Liberty Avenue, 11419` · `Slight Pepper Roti Shop, 125-01 Liberty Avenue, 11419` ·
`BAKEWELL BAKERY & RESTAURANT, 127-08 Liberty Avenue, 11419` · `SHIVRAM'S, 129-05 Liberty Avenue,
11419` · `NEW THRIVING RESTAURANT, 120-12 Liberty Avenue, 11419` · `NEW CHINESE GARDEN OF GUYANA,
109-10 Liberty Avenue, 11419` · `SHERIFF STREET LOUNGE, 120-09 Liberty Avenue, 11419` ·
`LITTLE BROWN JUG, 124-02 Jamaica Avenue, 11418` · `INDIA CAFE, 94-08 Lefferts Boulevard, 11419` ·
`APNA PIND, 131-09 101 Avenue, 11419` · `NEW APNA VIRSA, 118-05 101 Avenue, 11419` · `DESI PIZZA,
111-03 101 Avenue, 11419` · `SR 101 MEAT SHOP, 116-01 101 Avenue, 11419` · `SOHNA MEAT SHOP, 115-04
101 Avenue, 11419` · `1313 CAFE & JUICE BAR, 111-18 101 Avenue, 11419` · four `TROPICAL JADE`
locations at 108-01, 112-16, 118-03 and 121-14 Liberty Avenue, all 11419.

**Two corrections to the finder's list:** there are **two** `NEW THRIVING` rows, at 120-12 (cuisine
`Asian/Asian Fusion`) and 116-20 (`Caribbean`) Liberty Avenue — do not merge them; and `TROPICAL
JADE` has **four** locations, not "several."

**F312 / OLIGARCH is confirmed and is the trap in this section.** `OLIGARCH, 86-15 LEFFERTS
BOULEVARD, 11418, Jewish/Kosher` — **the Richmond Hill Republican Club's address (P15).** LP-2126's
`"Vacant since the mid 1980s"` is confirmed verbatim and **describes the building as of 2002.**

**The author must do exactly one thing with this and nothing more: not write that the landmark is
vacant.** Do **not** write that a restaurant occupies it. A permit at an address is not an occupancy
finding, the permit may be stale, and P15's record is a landmark record. **Say nothing about the
building's present use in either direction.**

**F309's aggregate observation is the one thing that may be written**, because it is a property of the
distribution rather than of any business, and I replicated it: Caribbean is the largest cuisine
category at 45, more than double the next non-generic category, and Caribbean plus Indian are about a
third of all establishments in 11418/11419. **Publish the shape. Never the count. Never a name.**

---

## 6. SINGLE-SOURCED CLAIMS — MAY IT SHIP?

Every row's quotation is **confirmed verbatim from my own fetch**. The verdict is about the claim.

| Claim | Sole source | Ships? |
|---|---|---|
| **F300** Liberty Ave co-named `"Little Guyana Avenue" on May 29, 2021` | Wikipedia | **Yes, with attribution.** Attribute in-text; no Council or DOT record retrieved. A precise date on one encyclopedia sentence must not be stated flatly |
| **F251** MTA `"Welcome to Little Guyana"` sign, early 2024 | Wikipedia | **Yes, with attribution.** But the station is only *partly* in South Richmond Hill (§3.2) — do not use it to claim the station |
| **F324** RKO Keith's on the **State** Register only, owner refused NRHP | Wikipedia | **Yes, with attribution — and it is important.** `"the property owner refused listing on the National Register"`. **It will not appear in any NRHP dataset. Checking NRHP and finding nothing does NOT refute it** |
| **F314** `"James J. Creegan Square"` | Wikipedia | **Yes, bare.** No date, no biography anywhere. Name the co-naming, say nothing about Creegan |
| **F317–F319** Triangle Hofbrau; Mae West | Wikipedia | **Dates: NO.** `"opened as a hotel in 1893 and as a restaurant in 1893"` — the same year twice; the sentence is corrupt. Confirmed verbatim. **Do not repair it silently.** Mae West is folklore-grade: attribute or omit |
| **F329** Jahn's closed late 2007 | Wikipedia ×2, **identical text** (R13) | **Yes, with attribution.** One source, not two |
| **F380** Felix Cuervo Corner | Wikipedia | **Yes, with attribution.** No designation date, no dates for Cuervo. No street address — a corner is not an address |
| **F305/F301** 101st Ave `"Little Punjab"` / `"Punjab Avenue"` | Wikipedia ×2, disagreeing | **Weakly.** Sources split on `"evolved into"` vs `"renamed"` and on the name; **no date anywhere.** Say the avenue is known by the name; assert no mechanism and no date |
| **F149 / P13** William Gati's house at 84th Ave & 113th St | Wikipedia | **NO. Do not publish.** A living private individual and his home location. The finder's privacy flag is upheld |
| **F387** Joseph Baldi, `"The Queens Creeper"` | Wikipedia list, unsourced | **NO.** A grave criminal allegation about a named person with no citation |
| **F386** Marx Brothers | Wikipedia list | **NO.** A bare name with no dates, no address, no claim of residence |
| **F388** Anaïs Nin | Wikipedia list | **NO — confirmed incoherent.** I re-read it: `"Anaïs Nin (1923-1977) … who lived in Richmond Hill prior to moving to Paris in 1924."` Nin was born 1903. The entry is impossible on its face |
| **F389** Kerouac `"1950 to 1955"` | Wikipedia list | **Attribute or omit.** No address in evidence; **do not supply one** |
| **F341** RHHS `"striving to prove that it is one of the top High Schools"` | Wikipedia | **NO.** Editorialising. `"voted the 100 U.S. Best High School in 2005"` is garbled and unattributed — also no |
| **F35/F37/F38** HD-article errors | Wikipedia HD | **NO.** `"Englishman"` (nomination says Manhattan lawyer), `"Hollis Hill"` (in no primary source), LPC `"accepted"` the district (LPC does not administer the State Register), and the Clarenceville bisection claim, now refuted by the station article I retrieved. Confirmed as quotes; **unusable as facts** |
| **F117/F124** *NYT* material | **nomination quoting the NYT** | **Yes — attributed that way and only that way.** I confirmed both inside nomination 100003430. Neither NYT original was retrieved by finder or by me |
| **F274/F275** Parks dashboard values (`"$4M Recent Investment"`, condition score `"72"`) | NYC Parks live page | **NO.** Live dashboard values; they drift |

**A conflict the finder did not record, found in my de-interleaved LP-2126.** LP-2126 says Henry
Haugaard was **`"Born in 1867 in Brooklyn"`** and was **`"one of three brothers"`** — while the
nomination gives **`"Henry Edward Haugaard (1866-1939)"`** and names the brothers as
**John August Theodore Neilsen** and **William Conrad Haugaard**, where LP-2126 names them
**William C. Haugaard and John T. Haugaard**. **A birth-year conflict and a surname conflict, in the
two best sources on the neighborhood's most important architect. Do not state his birth year flatly,
and do not silently harmonise the brother's surname.** Likewise LP-2126 puts his 1888 office at
**`"Jamaica Plank Road and Lefferts Boulevard"`**; the nomination puts it at **`"Jamaica Avenue and
Lefferts Boulevard"`**.

---

## 7. THE 41 UNCERTAINS, GROUPED

1. **Not re-reachable, so not re-verified (7).** F7 (`resurrectionrh.org` DNS), F8 (RHHS `/homes`,
   `/noteworthy-people`, forgotten-ny, QPL branch pages). Recorded as the finder found them; I did
   not independently retest each. **F4 and F5 I did retest and both are CONFIRMED** — the three NRHP
   stubs are a 1-page PDF, and `100007667_text` really is a **PNG image, 150×90**, not a document.
2. **Nomination-quoting-a-third-party (4).** F117, F124, F79/F80 (the unnamed newspaper article the
   nomination itself dates `"more than two decades after the fact"` and is openly sceptical of).
   The nomination's text is confirmed; the underlying sources are not in evidence.
3. **Unresolved source-vs-source conflicts (12).** Man's occupation (lawyer ×3 vs banker ×2 — all
   five confirmed verbatim); Clarenceville's platter and extent (F49/F50/F51); Morris Park 1884/1885
   and incorporation 1894/1895 (F58/F59); the Indigenous people, Jameco/Yamecah ×2 institutional vs
   Rockaway ×1 Wikipedia (F42) — **note the brief's Rockaway warning: this is an ethnonym, not a tie
   to the peninsula**; the Richmond Hill station's three locations; the RKO's two addresses; the
   Carnegie library's lineage (F350/F351 — **do not assert a lineage**); council district 29 vs
   28/30/32. **Record both sides. The page is better for the honesty.**
4. **Name-only, insufficient for a record (10).** P24–P27, P54's eight elementary schools, P28
   Arcaneum/Arcanium, P52's lumber mill and Hillside Bank Building.
5. **Statistics that cannot be disaggregated (8).** **F13 is confirmed and it governs §9 and §11.6–11.7
   entirely: no health, education, income, rent-burden or crime figure in this dossier is a
   Richmond-Hill-only number.** Every one is CD 9, covering Kew Gardens and Woodhaven too. **F368's
   `"For every supermarket… there are 11 bodegas"` is the most quotable and the most misleading — it
   is a three-neighborhood figure.** F286's census is 2010. **Attribute the geography every time or
   drop the statistic.**

---

## 8. WHAT THE AUTHOR MUST BE WARNED ABOUT

1. **P43 is now a real place.** Use the monument record in R2. Prefer Parks' own title `"Morris Park
   World War Memorial"`; note the `"World War I Memorial"` variant on Parks' own history page.
2. **Do not treat "not in evidence" claims in this dossier as final.** Four were false (R1–R4), all
   from PDF column-interleaving or one bad fetch.
3. **The historic district's northern tier is in Kew Gardens' tabulation area** (R5), including the
   Man house at 116-03 85th Avenue and both Wade & Cullingford houses. **84-48 118th Street and
   117-03 85th Avenue are Kew Gardens by every instrument and must not be written as Richmond Hill
   addresses.**
4. **The twelve contributing houses (P1–P12) are private single-family residences.** They are
   *material for prose about the district*, not place records, and P13 must not appear at all.
5. **Nothing in §10 may be narrated.** Existence and address only. Say nothing about what occupies
   86-15 Lefferts Boulevard today.
6. **The Sikh Cultural Society does not exist in this evidence.** No record, no address, no mention.
7. **Forest Park, Flushing Meadows–Corona Park and the eight `CitiFieldPlaces` holdings stay out** —
   as records and as prose. That includes the Battle of Long Island ridge story, which two sources
   place *inside Forest Park*. Link to `/g/citi-field-guide` only if a routing sentence is genuinely
   warranted; on this evidence (F393, confirmed) **it is not.**
8. **Liberty Avenue may not be claimed whole**, and the nomination's own viaduct reasoning (F136) is
   the precedent to follow.
9. **"Jamaica" is jurisdictional in most of this dossier** — F395 is confirmed. The nomination's
   `"the Town of Jamaica"` and `"western Jamaica"` are the colonial town, not the neighborhood.
   **Jamaica Bay appears in no Richmond Hill source and must not be introduced.**
10. **P30 (121st Street) is shared with Kew Gardens by a single sentence naming both.** Coordinator:
    one file only.
11. **`bayside.json` needs the Alley Pond Park record before the marquee gate's tag comes off** (§4).

---

*Verified independently. Sources re-fetched and re-quoted by the verifier; no string was accepted on
the finder's authority.*
