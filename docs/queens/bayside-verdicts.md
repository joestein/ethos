# Bayside, Queens — VERIFIER verdicts

Role: INDEPENDENT VERIFIER. I re-fetched the finder's sources myself. Every quote below was
re-extracted by me from raw bytes (curl + `pdftotext -layout`, or Wikipedia `action=raw` wikitext —
**not** WebFetch summaries). I trusted no string the finder presented as a quote.

**Method note that matters:** the finder's Tier B strings came from WebFetch summarisation, which he
warned could not be attested. He was right to warn. I pulled the **raw wikitext** of every Wikipedia
article in question. Most Tier B strings survived; **five did not**, and one of them was the
finder's self-declared "single most consequential structural fact in this document." See §3.

---

## 0. HEADLINE COUNT

| | |
|---|---|
| **Claims adjudicated** | **186** (164 F-numbers + 22 C-rows) |
| **Confirmed** | **131** |
| **Refuted** | **11** |
| **Uncertain** | **44** |
| **Places surviving as publishable in `bayside.json`** | **16** — 8 on Tier A evidence, 8 on single Tier B sources requiring attribution |
| **Places affirmatively excluded from `bayside.json`** | **27** (15 CD7 / Fort Totten–Bay Terrace; 4 Douglaston; 4 Alley Pond Park NTA; 4 other-district name traps) |
| **Candidates resting only on DOHMH/DCWP inspection data** | **ZERO — verified, see §8** |

Sources re-fetched by me: 6 LPC designation PDFs, 8 NYC Parks pages, 3 NYC Open Data endpoints
(including one the finder never opened), 2 Bayside Historical Society pages, APEC, All Saints,
Bayside Village BID, and 7 Wikipedia articles in raw wikitext. **24 distinct sources.**

---

## 1. ALLEY POND PARK — THE MARQUEE RULING

**The finder did not pull the decisive instrument. I did. The answer is not the one the brief
anticipated, and the reasoning that settled Forest Park does not transfer.**

From DCP's 2020 NTA table `9nt8-h7nd`, re-read by me, filtered to Queens (82 rows):

```
QN1191 | Alley Pond Park              | ntatype 9 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
QN1102 | Bayside                      | ntatype 0 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
QN1103 | Douglaston-Little Neck       | ntatype 0 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
QN1104 | Oakland Gardens-Hollis Hills | ntatype 0 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
```

Set beside the two settled parks, from the same query:

```
QN8191 | Flushing Meadows-Corona Park | ntatype 9 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | ntatype 9 | QN82 Forest Park (JIA 82 Approximation)
```

### 1A. Alley Pond Park is NOT a Jointly Interested Area. Do not call it one.

**The JIA instrument is the CDTA, not the `ntatype`.** Flushing Meadows-Corona Park and Forest Park
each carry their own **JIA-class community-district tabulation area** (`QN81`, `QN82`) — that is
what removed them from every neighborhood file. Alley Pond Park carries **`QN11`, an ordinary
CD-approximation CDTA**, the same CDTA as Bayside and Douglaston themselves.

Wave 3 and wave 4 both wrote that `ntatype 9` was the device. That is imprecise. `ntatype 9` is
DCP's **park** code and it is used freely *inside* normal districts — Queens has seven such rows
(Astoria Park, Kissena Park, Cunningham Park, Spring Creek Park, Rockaway Community Park, Alley Pond
Park, and two Jamaica Bay rows). **Anyone who reaches for "another JIA, therefore nobody publishes
it" is applying the wrong test.** The arbitrator should be told this explicitly.

**The awardable precedent already ships in this corpus.** `QN0191 | Astoria Park | ntatype 9 | QN01
Astoria-Queensbridge (CD 1 Equivalent)` is the identical device, and `astoria.json` carries Astoria
Park, saying so in its own prose: *"The City files Astoria Park as a neighborhood tabulation area of
its own, named Astoria Park."* So a park with its own `ntatype 9` NTA inside a normal CDTA **can**
be awarded.

### 1B. But Bayside still does not get it — and the reason is the three-way split.

Having established the park is awardable in principle, I applied wave 4's own instrument: shared
boundary length. I computed it from the DCP polygons directly (midpoint-of-segment within 2 m of the
neighbouring ring; equirectangular projection at 40.75°N).

| Neighbour NTA | Shared boundary with QN1191 | Share of park perimeter |
|---|---|---|
| **QN1103 Douglaston-Little Neck** | **4,640 m** | **31.6%** |
| **QN1104 Oakland Gardens-Hollis Hills** | **3,519 m** | **23.9%** |
| **QN1102 Bayside** | **2,942 m** | **20.0%** |
| QN1101 Auburndale | 0 m | 0.0% |
| QN0703 Bay Terrace-Clearview | 0 m | 0.0% |
| QN0761 Fort Totten | 0 m | 0.0% |
| QN0891 Cunningham Park | 0 m | 0.0% |

Park perimeter 14,697 m; the residual ~24.5% is water, the CD13 edge and the Nassau line.

**Bayside is the third-ranked of three neighbours. It has the weakest claim of anyone who has one.**
Astoria Park was awardable because exactly one neighborhood touched it. Alley Pond Park has three,
and Bayside is last.

### 1C. RULING

> **ALLEY POND PARK IS NOT A BAYSIDE PLACE. `bayside.json` must not create a place record for it,
> nor for anything inside it.**
>
> It is not a JIA — say so, and correct anyone who says otherwise. It is a park with its own DCP
> tabulation area straddling three CD11 neighborhoods, of which Bayside is the smallest-share
> neighbour. If the coordinator awards it at all, **Douglaston has the better-evidenced claim** on
> both boundary share (31.6% vs 20.0%) and on the park's own institution: APEC self-addresses to
> `229-10 Northern Blvd., Douglaston, NY 11362`, re-quoted by me from `alleypond.org` (§4).

**Consequently also excluded from `bayside.json` as place records** — all four sit inside QN1191:
**Oakland Lake**, **the Queens Giant**, the **Alley Pond Adventure Course**, and **APEC** itself
(which is additionally Douglaston-addressed).

### 1D. What Bayside MAY still say about Alley Pond

Two Tier A hooks survive and both are naming/stewardship, not containment. Bayside may narrate them
without claiming the park:

- **BHS founding goal — CONFIRMED verbatim** by me at `baysidehistorical.org/about-bhs`: the Society
  was founded in 1964 *"with three goals: The preservation and restoration of the Lawrence Family
  Cemetery , Alley Pond and Fort Totten."* (Note: the site's own rendering carries that stray space
  before the comma.) This is a Bayside institution's claim of **stewardship**, not of containment.
- **The name's origin — CONFIRMED verbatim** by me in LP-2154: *"Initially, access was from Little
  Neck Bay, by boat, or via a road called the "Alley" that ran along the shore."* A Bayside-authored
  municipal document is the source of the Alley name. Legitimate Bayside prose.

---

## 2. FORT TOTTEN AND THE NORTHERN PENINSULA — RULING

The finder called this "the heaviest contest in this document" and listed six sources with four
answers. It is not actually close once the geographic instrument is separated from the postal one.

**Every geographic instrument puts Fort Totten outside Bayside:**

- **DCP `9nt8-h7nd`, re-read by me:** `QN0761 | Fort Totten | ntatype 6 | QN07 Flushing-Murray
  Hill-Whitestone (CD 7 Approximation)`. Fort Totten has **its own NTA in a different community
  district**. It is not inside QN1102 Bayside. Neither is `QN0703 | Bay Terrace-Clearview |
  ntatype 0 | QN07`.
- **NYC Parks, re-fetched by me** (raw metadata blocks): Fort Totten Park `Community Board: 7`,
  `Park ID: Q458`, `Acreage: 60.39`, `Zip Code: 11359, 11360`; Little Bay Park `Community Board: 7`,
  `Q010A`, `55.22`; Bay Terrace Playground `Community Board: 7`, `Q399`, `0.91`; Clearview Park Golf
  Course `Community Board: 7`, `Q010`, `110.93`. **All four confirmed exactly as the finder printed
  them.** Against these, Crocheron Park `Community Board: 11`, `Q012`, `45.79`, `Zip Code: 11361`.
  Parks is drawing a consistent line and the finder read it correctly.
- **LPC Socrata `buis-pvji`, re-queried by me:** `Fort Totten Officer's Club | 208 Totten Avenue |
  cd 407 | QN0761` and `Fort Totten Battery | Fort Totten Park | cd 407 | QN0761`.
- **LPC's own 1999 prose — CONFIRMED verbatim** from LP-2040: *"Fort Totten occupies a 136-acre site
  in northeast Queens, north of Bayside, on a peninsula jutting into the Long Island Sound."*
- **A fifth instrument the finder had but did not use.** NYC Parks' Bay Terrace Playground history,
  re-quoted by me, distinguishes the two places in one sentence: William Lawrence *"was granted a
  parcel of land by King Charles II in 1645 that included a large portion of what is today Bayside,
  in addition to College Point, Whitestone, and Fort Totten."* A city agency listing Fort Totten
  **in addition to** Bayside.

**Every pro-Bayside source is a postal-city field, not a geographic one:**

- **NRHP — CONFIRMED verbatim** by me from the raw table: `refnum=86000446 |name=Fort Totten
  Officers' Club |address=Totten and Murray Aves. |city=[[Bayside, Queens|Bayside]]
  |date=1986-03-17`. The parameter is literally `city=` — the **mailing city**.
- **LPC 1974 (LP-0827) — CONFIRMED verbatim:** *"FORT TOTTEN OFFICERS' CLUB, United States Government
  Reservation, Fort Totten Road, Bayside, Queens. Built about 1870; enlarged 1887."* A 1974 mailing
  header that the **same agency corrected in 1999**.
- **BHS — CONFIRMED verbatim** at `/visit-us`: *"Bayside Historical Society / 208 Totten Avenue /
  Fort Totten / Bayside, NY 11359"*. ZIP 11359 is the Fort Totten ZIP and its USPS city name is
  "Bayside". That is why every one of these reads "Bayside".

> **RULING: Fort Totten, Bay Terrace and the Clearview/Little Bay shoreline are NOT in Bayside.**
> `bayside.json` may not carry Fort Totten Park, the Officers' Club / The Castle, the Fort Totten
> Battery, the Fort Totten Historic District, Little Bay Park, Clearview Park Golf Course,
> Valentino's on the Green, Bay Terrace Playground, the Bay Terrace shopping center, the Throgs Neck
> Bridge's Queens landing, the FDNY EMS Training Academy or its EMS museum, Thorne-Wilkins Cemetery,
> Alicia's Jewelers, or the QPL Bay Terrace branch as Bayside place records.
>
> **The one deliberate exception the author should argue for: the Bayside Historical Society
> itself.** It is *the* Bayside institution, it is named for Bayside, its archive is "the history of
> Bayside, Queens, and its adjacent communities," and it prints its own address as ending "Bayside,
> NY 11359". If the author publishes it, publish the address **exactly as BHS prints it** —
> `208 Totten Avenue, Fort Totten, Bayside, NY 11359` — and **do not write prose asserting that Fort
> Totten is in Bayside.** The Castle is BHS's premises; it is not a Bayside landmark.

**Note the finder's F13.1 catch is good and I confirm its force:** Wikipedia's Bayside ZIP list
(11360 / 11361 / 11364) **omits 11359**, the Fort Totten ZIP. Small, but it points the same way as
DCP.

---

## 3. REFUTED — 11 claims the sources do not support

These are the adversarial findings. Each was checked against raw source text, not a summary.

**R1 — F2.2 REFUTED. The Douglaston–Little Neck boundary statement does not exist.**
The finder printed: *"bounded by Cross Island Parkway to the west, Grand Central Parkway to the
south, the New York City-Nassau County border to the east, and Little Neck Bay to the north."*
**No such sentence is in the article.** The raw wikitext reads: bordered *"to the east by [[Great
Neck]] in [[Nassau County, New York|Nassau County]], to the south by [[Glen Oaks, Queens|Glen Oaks]]
and the [[North Shore Towers]], and to the west by [[Bayside, Queens|Bayside]]."* **The western
border is the neighborhood Bayside, not the Cross Island Parkway.** This is a WebFetch fabrication.

**R2 — F2.3 REFUTED, and it was the finder's headline structural claim.**
F2.3 asserts F2.1 and F2.2 "AGREE" that the Cross Island Parkway is the Bayside/Douglaston divider,
and builds from that to "the agreed boundary … **bisects** [Alley Pond Park]", calling it *"the
single most consequential structural fact in this document."* **It rests entirely on R1 and
collapses with it.** Only the *Bayside* article names the Cross Island Parkway; Douglaston's does
not corroborate it. There is no agreed bisecting line. The author must not repeat this.

**R3 — F2.4 REFUTED.** The finder printed *"Douglaston is considered the area west of Marathon
Parkway and north of Grand Central Parkway."* The raw text reads: *"'''Little Neck''' generally
refers to the area east of Marathon Parkway and/or north of Northern Boulevard, while
'''Douglaston''' is the rest of the neighborhood; these classifications may overlap depending on
different interpretations of boundaries."* Different street, different structure, and the article
explicitly disclaims precision.

**R4 — C10 REFUTED as a double attestation.** The finder cites *Wikipedia Bayside* for "The FDNY EMS
Training Academy is in **Bay Terrace** at Fort Totten." **That sentence is not in the Bayside
article at all** — the string "FDNY EMS Training Academy" does not occur there. It appears only in
the Douglaston–Little Neck article, where I confirm it verbatim: *"The [[New York City Fire
Department Bureau of EMS|FDNY EMS]] Training Academy is located in [[Bay Terrace, Queens|Bay
Terrace]] at [[Fort Totten (Queens)|Fort Totten]]. The site also contains a museum of FDNY EMS
history."* **One claim, not two.** (The finder suspected this; he was right, and the correction is
sharper than he framed it.)

**R5 — C11 / F4.10 REFUTED. There is no Wikipedia "Queens Giant" article and the tree is not
assigned to Douglaston.** `en.wikipedia.org/wiki/Queens_Giant` returns, in full:
`#redirect [[Alley Pond Park#Queens Giant]]`. The section text reads: *"The tree is near the
Douglaston Plaza Mall, and is accessible by foot from Alley Pond Park. The tree can be viewed by
entering the park at Horace Harding Expressway and East Hampton Boulevard."* **Near a mall is not a
neighborhood assignment.** The tree is inside QN1191 and belongs to no neighborhood file.

**R6 — F4.9 / C12 REFUTED as a quotation.** *"Originally used as Flushing's water source"* is not a
string in the source. The actual sentence: *"The lake itself was used as a water source by the town
of [[Flushing, Queens|Flushing]] from the 19th century through the creation of the [[City of Greater
New York]] in 1898, when the city built a water pumping plant on the lake."* The substance survives;
**the quotation does not, and this is the one Bayside↔Flushing contact the finder logged — so it
must be re-worded before any use.** Also refuted: the finder's gloss that the lake sat *"on former
Oakland Golf Club grounds"* is only half the story — the raw text says the golf club site *"is now
the [[Queensborough Community College]] campus."*

**R7 — C19 REFUTED. Cunningham Park is not a Bayside park.** DCP: `QN0891 | Cunningham Park |
ntatype 9 | QN08 Fresh Meadows-Hillcrest-Briarwood (CD 8 Approximation)` — **a different community
district**, and 0 m of shared boundary with Alley Pond Park. Wikipedia's Bayside "Recreation"
bullet list is a proximity list; the same article elsewhere says Oakland Gardens is bounded *"to the
west by [[Cunningham Park]]"*, i.e. Cunningham Park is outside. Do not create it.

**R8 — F12.13 REFUTED. "Second-oldest home in Queens" is contradicted by its own cited source.**
The Wikipedia sentence is real, but its footnote is Kevin Walsh's Brownstoner piece, and the article
quotes that source in the adjacent reference as saying construction was *"in 1852 — venerable, but
not as aged as, say, the Lent-Riker House in Jackson Heights or the Onderdonk House in Ridgewood."*
**The source cited for the superlative denies the superlative.** The Cornell-Appleton House may be
published at `214-33 33rd Road` as "thought to be one of the oldest in Bayside" (the article's own
weaker wording, which I confirm verbatim). **The superlative and the Titanic anecdote must not
ship.**

**R9 — F7.4 note REFUTED.** The finder writes *"LP-0827 attributes the *fort's* 1857 design
elsewhere."* **LP-0827 contains no attribution of the fort's design and the string "Lee" does not
occur in it anywhere.** What it does attribute, and I confirm verbatim, is the *Club's* prototype:
*"The immediate prototype for the building was the handsome, turreted and crenellated Gothic Revival
stone library building of 1841 at West Point… designed by Major Richard Delafield (1798-1873), of
the Corps of Engineers."* The finder's conclusion — that the Robert E. Lee attribution is unsupported
by any primary source — **stands and is if anything stronger**; only his description of LP-0827 was
wrong.

**R10 — C1's framing REFUTED as under-determined.** "It belongs to no single one of the three" was
recorded as an open question resting on the (fabricated) bisection. It is now settled on a different
and correct instrument. See §1.

**R11 — F2.1's second half REFUTED as a single coherent statement, and the finder missed an internal
contradiction.** The lead sentence **is** verbatim (*"It is bounded by [[Whitestone, Queens|
Whitestone]] to the northwest, the [[Long Island Sound]] and [[Little Neck Bay]] to the northeast,
[[Douglaston-Little Neck, Queens|Douglaston]] to the east, and [[Fresh Meadows, Queens|Fresh
Meadows]] to the west"*) — I nearly refuted it and was wrong to; it is real. **But the same
article's Geography section gives a different western boundary:** *"To the east is the [[Cross Island
Parkway]]. To the west is [[Francis Lewis Boulevard]] and [[Auburndale, Queens|Auburndale]], and to
the northwest is [[Utopia Parkway]]."* **Fresh Meadows in the lead, Auburndale in the body.** The
article contradicts itself and neither version should be published as *the* boundary.

---

## 4. NEIGHBORHOOD ASSIGNMENT — the full ruling table

Rulings are on DCP NTA (`9nt8-h7nd`) first, LPC/Parks community district second, self-assignment
third, aggregators last.

| Place | Exact address (as the best source prints it) | **RULING** | Evidence |
|---|---|---|---|
| **Lawrence Graveyard** | **216th Street at 42nd Avenue** (LPC Socrata) | **BAYSIDE** ✔ | `cd 411`, `nta2020 QN1102`, LP-00630. LP-0630 header re-read by me: *"LA~RENCE GRAVEYARD, 216th Street and 42nd Avenue, Bayside, Borough of Queens. Built about 1840."* |
| **35-34 Bell Boulevard** (Cobblestone House) | **35-34 Bell Boulevard** | **BAYSIDE** ✔ | `cd 411`, `QN1102`, LP-02154. Report: *"Located on a commercial street in Bayside, Queens…"* |
| **Hawthorne Court Apartments** | **215-37 to 215-43 43rd Avenue and 42-22 to 42-38 216th Street** | **BAYSIDE** ✔ | `cd 411`, `QN1102`, LP-02461. (Socrata prints "to", not the en-dash the finder used.) |
| **John William and Lydia Ann Bell Ahles House** | **39-24 to 39-26 213th Street** | **BAYSIDE** ✔ | `cd 411`, `QN1102`, LP-02341. *"Now located on 213th Street in Bayside…"* |
| **Crocheron Park** | **214 Pl., 214 La., 215 Pl, Cross Island Pkwy. bet. 33 Ave. and 35 Ave.** | **BAYSIDE** ✔ | NYC Parks `Community Board: 11`, `Q012`, `Zip Code: 11361` |
| **John Golden Park** | *no street address in any source I reached* | **BAYSIDE** ✔ (address unresolved) | NYC Parks `Community Board: 11`, `Q012B`, ZIP 11360/11361. Its history page 302'd on me; the finder's quotes from it are **unverified — see §7** |
| **All Saints Episcopal Church** | **214-35 40th Ave. Bayside, NY 11361** | **BAYSIDE** ✔ | Parish's own site, re-quoted by me |
| **Bayside Village BID / Bell Boulevard** | *district, not an address:* "an eight block strip between Northern Blvd. and 35th Avenue along Bell Blvd." | **BAYSIDE** ✔ | BID's own site, verbatim, re-quoted by me; self-declares "served by Community Board #11" |
| **Alley Pond Park** | NYC Parks gives none; `Q001GROUP`, `Community Board: 11, 13` | **NEITHER — own DCP NTA QN1191** | §1. Douglaston has the better claim if awarded at all |
| **Oakland Lake / Queens Giant / Adventure Course** | — | **NEITHER — inside QN1191** | §1C |
| **Alley Pond Environmental Center** | **229-10 Northern Blvd. Douglaston, NY 11362** | **DOUGLASTON** | APEC's own site, re-quoted verbatim by me |
| **Fort Totten Park** | Cross Island Pkwy. bet. Totten Ave. and 15 Rd. | **NOT BAYSIDE — QN0761, CD7** | §2 |
| **Fort Totten Officers' Club / The Castle** | **208 Totten Avenue** (LPC Socrata — the authoritative one of the three) | **NOT BAYSIDE — QN0761, CD7** | §2. NRHP's "Totten and Murray Aves." is a mailing descriptor; LP-0827's "Fort Totten Road" is a 1974 header |
| **Fort Totten Battery** | *none exists* — LPC address field is literally `Fort Totten Park` | **NOT BAYSIDE — QN0761, CD7** | Confirmed in Socrata. **Not publishable as an addressed place** |
| **Bayside Historical Society** | **208 Totten Avenue, Fort Totten, Bayside, NY 11359** | **Bayside institution at a CD7 site** | §2, exception paragraph |
| **Little Bay Park / Clearview Park GC / Bay Terrace Playground** | Clearview: "202 St., Clearview Exwy., bet. Cross Island Pkwy. and 23 Ave." | **NOT BAYSIDE — CD7** | §2 |
| **Bay Terrace (place)** | — | **NOT BAYSIDE — QN0703 Bay Terrace-Clearview, CD7** | Wikipedia's *"often considered part of the larger area of Bayside"* **is verbatim** — but it is a colloquial hedge against a hard DCP boundary. Historically Bayside (Parks: *"Bay Terrace, originally included within the bounds of Bayside"* — confirmed verbatim), administratively not |
| **Throgs Neck Bridge (Queens landing)** | — | **NOT BAYSIDE** | Lands in QN0703. NYC Parks' *"which connects Bayside with the Bronx"* is confirmed verbatim but is loose sign prose, not an assignment |
| **Oakland Gardens / Hollis Hills** | — | **NOT BAYSIDE — own NTA QN1104** | DCP files `Oakland Gardens-Hollis Hills` as a **peer** of Bayside, not a sub-area. CB11 lists them as peers too (confirmed in raw wikitext). Wikipedia's *"an [[upper middle class]] neighborhood in southern Bayside"* is verbatim but is outvoted by DCP |
| **Cunningham Park** | — | **NOT BAYSIDE — QN0891, CD8** | R7 |
| **Cornelius Van Wyck House** | **37-04 Douglaston Parkway** (LPC Socrata) | **DOUGLASTON — QN1103** | The finder's flag is correct and useful: Wikipedia's "126 West Dr." disagrees with LPC. **LPC is authoritative; pass this to the Douglaston agent** |
| **Benjamin P. Allen House** | **29 Center Drive** | **DOUGLASTON — QN1103** | Confirmed in Socrata |
| **Fitzgerald/Ginsberg House** | **145-15 Bayside Avenue** | **NOT BAYSIDE — QN0704 Murray Hill-Broadway Flushing, CD7** | Confirmed. The finder's "trap" flag is correct: the street name is the only Bayside thing about it |
| **Bayside Cemetery** | — | **NOT BAYSIDE (Ozone Park)** | I did not independently confirm the Ozone Park location either. **Uncertain — but do not claim it** |
| **Corbett House** | **221-04 Corbett Road** | **BAYSIDE** (Tier B, but well-sourced) | Confirmed verbatim, and the Wikipedia citation is a real NYT piece: Barney Nagler, *"Gentleman In The House On Corbett Road"*, NYT, September 1, 1985 |
| **Cornell-Appleton House** | **214-33 33rd Road** | **BAYSIDE** (Tier B) | Confirmed verbatim; **superlative refuted, R8** |

### The Flushing gap — confirmed, and no tie was manufactured

DCP puts Flushing in CD7 (`QN0707 Flushing-Willets Point`) and Bayside in CD11 (`QN1102`), several
miles apart with **0 m** of shared boundary in my geometry run. The finder logged four Bayside↔
Flushing contacts and invented none; I confirm all four are real and correctly labelled — but note
**R6**: contact (b), Oakland Lake as Flushing's water source, is not quotable as printed and the
lake is not a Bayside place anyway. **No Flushing↔Bayside tie should appear in `bayside.json`.**

---

## 5. CONFIRMED — the Tier A backbone survived almost intact

I re-extracted and matched, string by string, and the finder's Tier A discipline was genuinely
good. **Every LPC PDF quote I tested matched the source**, including the OCR artefacts he flagged
(`LA~RENCE`, `F~ous`, `famiLy`, `nursery~en`, `Congress~onal`, `Wille.t`, `Vandalized e few years
ago`) and the sign's own errors he reproduced (`Tribororough`, `30,000,000 million`, `Mantinecock`,
`named to Bay Terrace Playground`). That is unusually careful work and the author can lean on it.

Confirmed verbatim by me, and safe to publish:

- **LP-2154 (Cobblestone House):** the Kieft/1639 purchase, the 1645 town of Flushing, the two
  Lawrence brothers, "forty members are buried in the Lawrence Graveyard", "the most recent was in
  1939", the Abraham Bell 1824 acquisition, the 246-acre farm, *"The Bell family donated the land
  for the station"*, the "Alley" road, the never-built Flushing subway extension, Rickert-Finlay,
  the Bellcourt 95-acre sale, the 1903 NYT passage, and the Summary including *"Only the pair on the
  west side of the intersection at 36th Avenue survives and the north pillar is located within the
  landmark site."* **All 12 tested strings matched.**
- **LP-2341 (Ahles House):** *"It is the only remaining example of the substantial Second Empire
  buildings erected in Bayside during the 1870s and 1880s"*, *"Very few 19th century houses survive
  in Bayside"*, the 1924 move for Christy Street/213th Street, *"one of the oldest surviving in
  Bayside"*, and the seven-year owner opposition including the Bayside Historical Society, the CB 11
  Landmarks Committee and Friends of Oakland Lake & Ravine, Inc. **All 6 matched.**
- **LP-0630 (Lawrence Graveyard):** the header, "forty-eight graves", "the last in 1925", the 1645
  patent, Cornelius W. Lawrence, Anne Willets, and the McKim children's twin marker. **All 7
  matched** (the McKim string is real; `pdftotext` splits it as "Clar ence").
- **LP-0827:** the 1974 header, "Thorne's Neck", Charles Willet's grave *"just inside the entrance of
  the post"*, the May 16 1857 sale for $200,000, the 5,000 wounded Union soldiers, the Gothic Revival
  castellated passage. **All matched except the Lee note — see R9.**
- **LP-2040:** "north of Bayside", the 136-acre site, the 1998 Army Corps study titled *"…Fort
  Totten, Bayside, Queens County, New York"*, the twelve witnesses, the 1968/1969/1971 occupancies.
- **LP-2461:** the Queens Chamber of Commerce 1931 award, Benjamin Braunstein, monk bond, jerkinhead
  roofs, the 1910 railroad tunnel.
- **NYC Parks:** all metadata blocks for Crocheron, Fort Totten, Little Bay, Clearview, Bay Terrace
  Playground and Alley Pond (`Q001GROUP`, `Property Type: Park Group`, `Community Board: 11, 13`,
  `Vickie Paladino , Linda Lee`); the Crocheron history (Boss Tweed and the Ludlow Street Jail 1875,
  the Bayside Civic Association, the hexagonal gazebos, Joseph Crocheron of Staten Island); the
  Little Bay Bayside narrative (Aaron Burr and the town clerk's fire, the 1866 railroad, the film
  colony, the shellfish beds, the Throgs Neck Bridge passage); Bay Terrace Playground (Matinecock
  "hilly country", Cord Meyer, the 1958/1962 JOP dates); Clearview (the Clearview Golf and Yacht
  Club, Alfred E. Smith, Willie Tucker, and the "Valentino's on the Green" concession headline).
- **BHS:** the 1964 founding and Joseph H. Brown, the three goals, "Completed in 1887", Robert Todd
  Lincoln and the School of Application, the 208 Totten Avenue address, the Bell Blvd & 212th Street
  entrance, the Q13/Q16.
- **APEC:** the Douglaston 11362 address, *"located in Alley Pond Park"*, the $5 suggested donation,
  (718) 229-4000.
- **All Saints:** `214-35 40th Ave. Bayside, NY 11361`, 718-229-5631, "over 130 years", Fr. Larry
  Byrne, 10:30 AM Sunday.
- **Bayside Village BID:** the full district definition and Precinct 111, verbatim.
- **Alley Pond Park's `/history` page really is empty** — confirmed, it is a Park Group landing page
  with no history text. The finder was right and this is not a fetch failure to retry.

**F7.1 and F7.2 — the finder's two "messiest knots" are real and I confirm both.** Three grave counts
(48 / 40 / "between forty and fifty") and two final-burial years (1925 / 1939) **from the same
agency and its own partner institution**; and 1637/1639/1644/1645 with four different grantors, with
NYC Parks' Little Bay sign (*"in 1644, King Charles I of England gave 16,000 acres"*) and its Bay
Terrace sign (*"granted a parcel of land by King Charles II in 1645"*) contradicting each other on
both year and monarch. **Author: pick one source, attribute it in-line, and do not synthesise.**

---

## 6. BUSINESSES AND THE DOHMH/DCWP QUESTION — as required, explicitly

**No business, restaurant or bar in this corpus rests on a DOHMH or DCWP inspection record, because
no such dataset was opened.** I verified this rather than accepting the finder's word: the finder's
document cites exactly **two** Socrata endpoints, `buis-pvji` and `skyk-mpzq`, **both LPC landmark
tables**. No DOHMH restaurant-inspection dataset ID, no DCWP licensing dataset ID, and no
`data.cityofnewyork.us` resource other than those two appears anywhere in the file. All five
mentions of "DOHMH" and all five of "DCWP" are the finder's own disclaimers.

**Therefore the standing rule "existence and address may be published but nothing may appear in
prose" has no application to this page — there is nothing in that category.**

The flip side is the finder's own §16.1, and I endorse it as the author's biggest content risk:
**there is essentially no sourced coverage of Bell Boulevard's restaurants and bars**, the
neighborhood's best-known contemporary feature. The only commercial entities in the corpus are:

- **Bayside Village BID** — Tier A, self-sourced, publishable. ✔
- **Valentino's on the Green** — Tier A (NYC Parks concession headline, re-confirmed by me on the
  Clearview page, whose Facilities list does include "Eateries") — **but it is at Clearview Golf
  Course, CD7. Not a Bayside business.**
- **Pier 25A** and **Alicia's Jewelers** — Tier B, sourced to film credits only, and Wikipedia
  itself places Alicia's in Bay Terrace. Both **uncertain**; Alicia's is additionally out of area.
- **Bay Terrace at Bayside shopping center** — out of area (QN0703), and its 2004 tenant list is two
  decades stale. Do not use.

> **Author warning: writing a Bell Boulevard dining paragraph from general knowledge would be
> unsourced invention. The honest move is to describe the corridor from the BID's own words and
> stop.**

---

## 7. UNCERTAIN — 44 claims. The ones that matter

**Do not confirm any of these; ship only with attribution, or not at all.**

1. **The Tiffany windows at All Saints (F10.2).** I searched the parish's own site: the string
   "Tiffany" **does not occur**. The claim is Wikipedia-only, cited to a Kevin Walsh/Brownstoner
   post, and the article's own adjacent quotation hedges it — *"contains local examples of **reputed**
   works executed by Louis Comfort Tiffany"*. **Ship only as "reputed", attributed, or omit.**
2. **The Straiton-Storm Cigar Factory (F12.12).** Confirmed as Wikipedia text, cited to a real NYT
   "F.Y.I." column (Daniel B. Schneider, October 17, 1999). **No address is given anywhere.** The
   finder's flag of a conflict with LP-2341's *"only remaining example of the substantial Second
   Empire buildings erected in Bayside"* is sharp and unresolved — one of them is wrong. **Not
   publishable as a place; publishable as a historical assertion only with the NYT attribution and
   the conflict acknowledged.**
3. **The John Golden Park history quotes (F8.3).** The page 302-redirected on me and **I could not
   verify a single one of the "Mr. Bayside" passages** — including *"He and his wife Margaret moved
   to Bayside in 1920"*, the white suit and silver-handled cane, the 1965 dedication, and Tony
   DePhillips's Bayside sporting goods store and 1949 little league. These are attractive, specific
   and **entirely unverified by me.** The author must re-fetch `nycgovparks.org/parks/Q012B/history`
   before using any of them.
4. **The Bayside apparitions / Veronica Lueken (F1.1).** I did not re-fetch this. The finder's own
   handling is correct — the Diocese of Brooklyn's 1986 finding is **negative** — but the site of
   the later vigils is **inside the excluded park**. **Author: this subject routes to
   `/g/citi-field-guide` at most. Do not narrate the Flushing Meadows half, and do not soften
   "completely lacked authenticity" if the Bayside half is mentioned at all.** St. Robert
   Bellarmine's own address remains unknown from any source.
5. **Everything in §13 (demographics) and §15 (notable residents).** All single-sourced to the
   Wikipedia *Bayside* article. §13.11's health figures are explicitly for **CB11 as a whole**
   (Bayside + Douglaston–Little Neck) and the finder correctly warns against attributing them to
   Bayside — I re-state that warning. The resident list is the least reliable content in any
   neighborhood article; **ship none of it unattributed.**
6. **Transit specifics (§11).** Not independently re-fetched. Note the live contradiction the finder
   found and I did not resolve: the *Bayside* article calls the LIRR station *"one of a few express
   stations on the Long Island Rail Road's Port Washington Branch"* (confirmed verbatim by me),
   while the station's own article reportedly does not. **Uncertain.**
7. **The Shrine of Our Lady of La Salette (F10.3).** The Bayside article carries only an **image
   caption**, `[[File:La Salette Shrine Bayside 204-44.JPG|thumb|Shrine of Our Lady of La Salette]]`.
   A filename is not a source and "204-44" is not an address. **Uncertain — do not publish.**
8. **The BID's "southern area of Bayside" oddity (F2.21).** The wording is verbatim; I could not
   resolve the geography. The likely explanation is that it is south relative to Bayside-plus-Bay-
   Terrace, but that is my inference, not a source. **Record the quote, don't gloss it.**
9. **QCC, the Kupferberg Holocaust Center and the QCC Art Gallery.** No street address was obtained
   for any of them. The KHC's self-description is Tier A and its disclaimer must be honored —
   *"The KHC is neither a museum nor a library: we are a learning laboratory."* **Do not call it a
   museum.** Exhibit titles are ephemeral; do not hard-code them. Same for BHS's dated 2026 tour
   listings.
10. **Bayside Cemetery's Ozone Park location** — flagged by the finder as a name trap; neither of us
    confirmed it. **Do not claim it either way.**

---

## 8. WHAT THE AUTHOR MUST BE WARNED ABOUT — the short list

1. **Do not create Alley Pond Park, Oakland Lake, the Queens Giant, the Adventure Course or APEC as
   Bayside places.** Alley Pond Park has its own DCP NTA and Bayside is its **third**-ranked
   neighbour by shared boundary. §1.
2. **Do not call Alley Pond Park a JIA.** It is not one — its CDTA is ordinary `QN11`. The Forest
   Park reasoning does not apply here and repeating it would be wrong. §1A.
3. **Do not put Fort Totten, Bay Terrace, Little Bay Park, Clearview Golf or the Throgs Neck landing
   in Bayside.** All are CD7 and outside the Bayside NTA. Every pro-Bayside source is a **postal
   city** field. §2.
4. **Do not repeat the Cross Island Parkway "agreed bisecting boundary."** The Douglaston source for
   it does not exist. R1/R2.
5. **Do not publish "second-oldest home in Queens."** Its own cited source denies it. R8.
6. **Do not attribute the Castle's design to Robert E. Lee.** No primary source supports it. R9.
7. **Do not publish the Tiffany windows without the word "reputed" and an attribution.** §7.1.
8. **Do not use any John Golden Park history quote without re-fetching the page.** §7.3.
9. **Do not write about Bell Boulevard dining beyond the BID's own words.** §6.
10. **Do not touch Flushing Meadows-Corona Park or any of the eight `CitiFieldPlaces` holdings.** The
    finder proposed none and I confirm none are present. If the apparitions subject is used at all,
    link `/g/citi-field-guide` and route the reader. §7.4.
11. **Where sources conflict on the Lawrence grant and the grave counts, pick one and attribute it
    in-line. Do not synthesise a compromise.** §5.
