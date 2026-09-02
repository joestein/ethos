# Maspeth, Queens — VERDICTS (independent verification of maspeth-finder.md)

**Role:** VERIFIER. Every URL cited by the finder was re-fetched by me. Every string the finder
presented as a **QUOTE:** was string-matched against the raw source I fetched myself, after
normalising for wiki markup, HTML entities, curly quotes and en/em-dashes. I did not read the
finder's reasoning as evidence for anything.

**Method, stated so it can be audited.**
- Wikipedia: fetched as raw wikitext via `Special:Export`, not through any summarising tool. 106
  quoted strings checked programmatically. Working files under
  `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/maspeth_verify/`.
- NYC Open Data: re-queried `enfh-gkve` (Parks Properties), `buis-pvji` (LPC Individual Landmarks),
  `43nn-pn8j` (DOHMH Restaurant Inspections) directly.
- DCP GeoSearch: 21 addresses re-geocoded by me, plus spine-street probes along 65th Place and
  Fresh Pond Road that the finder did not run.
- NYC Parks, metropolitanoval.org, ussoccer.com, nylandmarks.org, qns.com, maspethtownhall.org,
  maspethfederal.com, queenslibrary.org, and Wikipedia article pages: fetched as HTML, tags
  stripped, matched.
- **One source I could not reach: `knockdown.center`. Every attempt (four, across two paths, with
  varied headers and delays) returned HTTP 429.** Everything the finder attributes to the venue's
  own website is therefore marked `uncertain` below — not because I doubt it, but because I did not
  see it, and this file does not confirm what it has not read.

**Headline finding on the finder's reliability.** This is an unusually honest dossier. 106 of 106
quote-integrity checks passed. The finder's self-reported error correction in §5 (hand-counted 21,
programmatically re-derived 17) is true — the correct figure is 17, and I got 17 independently. Its
explicit negatives are real. Its refusal to resolve §12 was correct. **That is not a reason to wave
it through, and I have not.** The failures below are failures of *scope and framing*, not of
quotation, and two of them are load-bearing.

---

## 1. HEADLINE COUNTS

| | |
|---|---|
| Claims adjudicated (F1–F96 + C1–C24) | **120** |
| Confirmed | **89** |
| Refuted | **5** |
| Uncertain | **26** |
| Places surviving as publishable | **45** |

Publishable breakdown: **17** NYC Parks properties in ZIP 11378 (verified row-by-row against
`enfh-gkve`); **8** named non-park Maspeth places carrying a source and an address; **20**
DOHMH-only food businesses, publishable as *existence + address only, no prose whatsoever*.

---

## 2. THE FIVE REFUTATIONS

### REFUTED-1 — The finder's CD5 parks census is incomplete, and Forest Park is what it misses
**Finder claim (§5 method note):** "I queried NYC Open Data's Parks Properties dataset for Queens
Community Board 5 … The query returned **36** properties across all of CD5."

The 36 is correct — I got 36. **But `?communityboard=405` is an exact-match filter on a
multi-valued, concatenated string field, so it silently drops every park that spans more than one
community district.** Forest Park's `enfh-gkve` row carries
`communityboard = "305405406409"` and is therefore invisible to that query, despite containing
Queens CD5. The finder's §5 is a valid list of *single-district* CD5 parks; it is **not** "every
NYC Parks property inside" the district, and §12/C20 must not be read as an exhaustive division of
CD5 parkland between Ridgewood and Glendale. **This matters for Glendale and Ridgewood, not for
Maspeth** — but the coordinator should assume the same query was run for those pages and re-run it.

### REFUTED-2 — Luke J. Lang Square: Wikipedia claims far more than the finder reports
**Finder (F34):** "Wikipedia calls it **Maspeth's** smallest park and gives the same 0.001 acres."

Wikipedia's actual wording, verbatim from the raw article: **"The smallest park in New York City,
Luke J. Lang Square, is located at the triangle caused by the intersection of Fresh Pond Road, 59th
Road, and 61st Street."** The claim is *smallest park in New York City*, not smallest in Maspeth.
That is a citywide superlative and a much bigger assertion. NYC Parks' own page does not make it.
**The author must not repeat the citywide superlative on Wikipedia's word alone.** The 0.001-acre
figure is separately confirmed in Open Data (Q063) and may ship.

### REFUTED-3 — F86's Queens Library hours and programming are already stale
**Finder (F86):** "the page listed same-day hours of 10:00AM–6:00PM at fetch time and advertised
programming including a Toddler Learning Center and a **Hispanic Heritage Month** event."

On my fetch the same page reads: **"Sunday: Closed Monday: Closed Tuesday: 1:00 pm/6:00 pm
Wednesday: 10:00 am/6:00 pm Thursday: 12:00 pm/8:00 pm Friday: 10:00 am/6:00 pm Saturday: Closed
Currently closed"**, and the advertised event is **"Back-to-School Movie: 'School of Rock' Sep 10"**.
Not a fabrication — a volatility failure. **No opening hours and no event listing from this page may
be published.** The address and phone are stable and confirmed (below).

### REFUTED-4 — F47's "grammatical ambiguity" about James Maurice is not ambiguous
**Finder (F47):** "The Wikipedia sentence is grammatically ambiguous about whether Maurice is a
founder or an interment."

The sentence reads: **"In addition to one of the founders, former U.S. Congressman James Maurice,
the cemetery is also home to Georges V. Matchabelli, Helena Rubinstein, and Legs Diamond."** It
states both — Maurice is a founder *and* is interred. NYC Parks independently calls him "a founder
of the nearby Mount Olivet Cemetery" (Frank Principe Park sign, confirmed). No ambiguity survives.

**And the finder under-states its own best catch (C6).** Mount Olivet is not merely "non-sectarian"
by contrast with NYC Parks' "Mt. Olivet **Lutheran**": the article states **"Originally established
as an [Episcopal] cemetery, that restriction was lifted in 1851,"** and the infobox `type` field
reads **"Non-sectarian."** Mount Olivet was **Episcopal, then non-sectarian — never Lutheran.**
NYC Parks' "Mt. Olivet Lutheran Cemetery," repeated verbatim across three sign texts, is a
straightforward agency error, almost certainly a conflation with All Faiths (formerly Lutheran)
Cemetery in Middle Village. **The phrase "Mt. Olivet Lutheran Cemetery" must never appear on the
page, even as a quotation, without an explicit correction attached.**

### REFUTED-5 — F44's characterisation of the six residual parks
**Finder (F44):** "Six of Maspeth's parks are unnamed slivers under 0.2 acres."

Two of the six carry names in the agency's own `signname` field — **"Sitting Area 127 CXXVII"**
(Q360Q, 0.17 ac) and **"Park Slope"** (Q360P, 0.005 ac). Four are literally named `Park`. Three are
"Behind overpass" (Q360Y1, Q360P, Q360Y2 — confirmed). Trivial as a fact, but the finder's *trap*
warning is correct and I reinforce it: **"Park Slope" (Q360P) is a 0.005-acre strip behind an
overpass at 61st Street and Borden Avenue. It is not the Brooklyn neighbourhood. A writer who
treats it as one produces a howler.**

---

## 3. NEIGHBORHOOD ASSIGNMENT — RULINGS

Every ruling below rests on evidence I fetched myself. Where GeoSearch is cited I note what the
finder correctly noted: the `neighbourhood` field is a **Who's on First polygon served through a
DCP endpoint, not an official DCP Neighborhood Tabulation Area.** It is good evidence. It is not an
NTA.

### 3.1 FOREST PARK — the standing Forest Hills assignment is not supported by any source I can find, and Glendale's claim is at least as strong

This is the ruling the brief demands and I am not softening it.

**Maspeth makes no claim on Forest Park.** No candidate in this dossier touches it; it is miles from
Maspeth; it did not surface anywhere in Maspeth research. The finder was right to leave it out.
That said, I fetched the primary records, and they do not say what the wave-3 ruling assumed.

**NYC Parks' own page for Forest Park (nycgovparks.org/parks/forest-park), verbatim:**
> "More About Forest Park Zip Code: **11375, 11385, 11415, 11418, 11421** Community Board: **5, 6,
> 9** Council Member: Lynn Schulman , Joann Ariola Park ID: **Q015** Acreage: **506.86** Property
> Type: Flagship Park"

**NYC Open Data row for Q015:** `zipcode = "11375, 11385, 11415, 11421"`,
`communityboard = "305405406409"`, `acres = 506.86`, `councildistrict = "29, 32"`.

Read that carefully. **ZIP 11385 is the Glendale/Ridgewood ZIP and Community Board 5 is
Glendale/Ridgewood/Maspeth — both appear on the agency's own list for Forest Park, alongside 11375
(Forest Hills) and CB 6.** The wave-3 ruling for Forest Hills rested in part on "appearing in the
park's own NYC Parks ZIP and community-board lists." **Glendale appears on those exact same two
lists, in the same fields, from the same agency.** That ground does not discriminate between the
two; it supports them equally.

**Neither the NYC Parks page nor Wikipedia ever says Forest Park is *in* Forest Hills.** I counted
neighbourhood mentions on the NYC Parks page: Glendale 1, Woodhaven 1, Kew Gardens 1, Forest Hills
1, Richmond Hill 1, **Maspeth 0, Ridgewood 0.** Wikipedia's Forest Park article, raw wikitext, puts
all five in one list as *neighbours*:
> "…draw the participation of the **surrounding neighborhoods** of Kew Gardens, Woodhaven, Richmond
> Hill, Forest Hills, and **Glendale**."

That sentence is the opposite of a containment claim, and it names Glendale and Forest Hills as
coequals. The same article gives the park's western boundary as Cypress Hills Cemetery and its
southern boundaries as Park Lane South — nothing that puts it inside Forest Hills.

**Ruling.** On the evidence I gathered: (a) no source states Forest Park is in Forest Hills; (b) the
NYC Parks ZIP/CB ground cited in wave 3 supports Glendale exactly as much as Forest Hills; (c) the
wave-3 verifier's polygon sampling put **QN0503 Glendale** at the edges and **nothing** in Forest
Hills; (d) the "named after the park" argument is an etymology of the *neighbourhood*, not a
location of the *park*, and Forest Hills Gardens being named for a nearby forest does not place the
forest inside it. **The standing forest-hills.json assignment is weakly evidenced and I would
overturn it. Glendale is better evidenced than Forest Hills on the agency's own records; a
no-neighborhood ruling (as with Flushing Meadows Corona Park) is also defensible for a 506-acre
flagship park spanning three community boards and five ZIPs. Maspeth is not a candidate.**

### 3.2 Places confirmed to MASPETH — with exact addresses

All GeoSearch results below are mine, re-run today.

| Place | Exact address | Evidence |
|---|---|---|
| Transfiguration Catholic Church | **64-14 Clinton Avenue, Maspeth, NY 11378** | Wikipedia: "a Roman Catholic church at 64-14 Clinton Avenue in **Maspeth**, Queens" (confirmed in raw). GeoSearch: `64-14 CLINTON AVENUE, Maspeth`. |
| Holy Cross Roman Catholic Church | **61-21 56th Road, Maspeth, NY 11378** | Wikipedia: "located at 61-21 56th Road in **Maspeth**, Queens" (confirmed). GeoSearch: `61-21 56 ROAD, Maspeth`. |
| Metropolitan Oval | **60-58 60th Street, Maspeth, NY 11378** | Org's own Location page, verbatim: "60th St &, 60th Ct, **Maspeth**, NY 11378". U.S. Soccer headline: "The Oval & the Open Cup: Making History in **Maspeth**, Queens". GeoSearch: `60-58 60 STREET, Maspeth`. |
| Knockdown Center | **52-19 Flushing Avenue, Maspeth, NY 11378** | Wikipedia: "located in the **Maspeth** neighborhood of Queens" (confirmed). GeoSearch: `52-19 FLUSHING AVENUE, Maspeth`. Venue site 429 — see uncertainty note. |
| Maspeth Town Hall | **53-37 72nd Street, Maspeth, NY 11378** | Its own site, verbatim: "vISIT 53-37 72nd Street, Maspeth, NY 11378" and "Contact Us 53-37 72nd Street Maspeth, NY 11378 (718) 335 - 6049". GeoSearch: Maspeth. |
| Queens Public Library, Maspeth branch | **69-70 Grand Avenue, Maspeth, NY 11378** | QPL's own page: "69-70 Grand Avenue Maspeth, NY 11378 (718) 639-5228". GeoSearch: Maspeth. |
| Reiff Playground | **59-25 Fresh Pond Road** | The only Maspeth Parks row carrying a house number in `enfh-gkve`. GeoSearch: Maspeth. |
| Mount Olivet Cemetery | *(in Maspeth; no street address obtained)* | Wikipedia: "located in the **Maspeth** neighborhood of Queens". Established 1850, 71 acres after 1878, type "Non-sectarian". |
| Maspeth Station (USPS) | **55-02 69th Street** *(single-sourced)* | Wikipedia only. GeoSearch: `55-02 69 STREET, Maspeth`. Trivially checkable against USPS — do that first. |

The **17 NYC Parks properties** in ZIP 11378 are all confirmed Maspeth on the agency's own record;
sixteen carry a cross-street `location` string rather than a house number, and those strings are the
only address the City publishes for them.

### 3.3 Places confirmed NOT Maspeth's

| Place | Ruling | Evidence I re-fetched |
|---|---|---|
| **Ridgewood Theater Building, 55-27 Myrtle Avenue** | **RIDGEWOOD** | LPC `buis-pvji?cd=405` returns exactly **two** rows for all of Queens CD5. This one: `LP-02325`, designated `1/12/2010`, NTA `QN0502`. GeoSearch: `55-27 MYRTLE AVENUE, **Ridgewood**`. |
| **Adrian and Ann Wyckoff Onderdonk House, 1820 Flushing Avenue** | **RIDGEWOOD** | Same dataset: `LP-01923`, designated `3/21/1995`, NTA `QN0502`. GeoSearch: `1820 FLUSHING AVENUE, **Ridgewood**`. |
| **All Faiths Cemetery** | **MIDDLE VILLAGE** (not in this wave) | NYLC verbatim: "All Faiths Cemetery in **Middle Village**, Queens." QNS verbatim: "a forgotten corner of All Faiths Cemetery in **Middle Village**." Both confirmed. |
| **Elmhurst Park / the Elmhurst gas tanks** | **ELMHURST** (already ships) | NYC Parks page verbatim: "Zip Code: **11373** Community Board: **4** … Park ID: **Q492** Acreage: 6.22". Not in the CD5 set at all. |
| **Juniper Valley Park (55.6 ac), Middle Village Playground, Middle Village Veterans Triangle** | **MIDDLE VILLAGE** | `enfh-gkve`, ZIP **11379**. Juniper Valley confirmed at 55.639 acres — by far the largest in CD5, and not Maspeth's. |
| **The twelve CD5 parks in ZIP 11385** | **RIDGEWOOD / GLENDALE** | All twelve confirmed row-by-row: Mafera Q305, Starr Q291, Rosemary's Q398, Benninger Q038, Grover Cleveland Q002, Myrtle Ave Clemens Q124, Glendale Veterans Q075, Clemens Q056, Drumm Q139, Pinocchio Q289, Evergreen Q302, "Uncle" Vito F. Maranzano Glendale Playground Q290. **But see REFUTED-1 — this is not the complete 11385 set.** |
| **Calvary Cemetery office, 49-02 Laurel Hill Boulevard** | **SUNNYSIDE** (already ships) | GeoSearch: `49-02 LAUREL HILL BOULEVARD, **Sunnyside**`. |
| **Calvary Veterans Park** | **not Maspeth** | In Old Calvary, which the article places Sunnyside/Blissville side; absent from the CD5 query. |
| **Grover Cleveland High School** | **not Maspeth** | NYC Parks' Reiff sign says only "**nearby** Grover Cleveland High School"; the associated playground Q002 is ZIP 11385. |

### 3.4 Genuinely contested — my adjudication, with the better-evidenced side named

**CALVARY CEMETERY — Sunnyside / Maspeth / Woodside.** Confirmed verbatim: "Calvary Cemetery is a
Catholic cemetery in **Sunnyside, Maspeth, and Woodside**, Queens." Also confirmed: the 1845
purchase of "71 acres of land from John McMenoy and John McNolte in **Maspeth**". **Better
evidenced: Sunnyside/Woodside for the cemetery as a single place** — the office geocodes to
Sunnyside and both those pages already ship. Maspeth's honest, non-duplicating claim is **Fourth
Calvary** ("south of the Long Island Expressway, and also bounded by 55th Avenue, 50th Street and
58th Street") and the 1845 land purchase. **A marquee place cannot live in two files; Maspeth should
not create a Calvary Cemetery record.**

**METROPOLITAN OVAL — field Maspeth, club Ridgewood.** Both halves confirmed against the Oval's own
About page. The field: Maspeth on the org's own Location page, on GeoSearch, and in U.S. Soccer's
headline and dek ("four-time U.S. Open Cup Final venue", by Tobias Carroll, October 10, 2023 —
verbatim confirmed). The club's social world: **"in Ridgewood, Queens, already home to a bustling
German community"** and a clubhouse at **"576 Fairview"** — which GeoSearch returns as
`576 FAIRVIEW AVENUE, **Ridgewood**`. **Better evidenced: the FIELD is Maspeth's, unambiguously.
The German-Hungarian club's community story is Ridgewood's.** Maspeth may write the field, the
surface, the Open Cup finals and the Oval's own account of Maspeth's neighbours' behaviour (§4
below). It may not annex the Ridgewood community history.

**RIDGEWOOD GARDENS / RIDGEWOOD PLATEAU — unresolved, and Ridgewood's claim is weaker than its name
suggests.** Wikipedia (Maspeth article) is the sole source: "There are few apartment buildings,
except for the **Ridgewood Gardens** co-ops along 65th Place." No address, no acreage, no
institutional source — I found none either. **New evidence I ran that the finder did not:** I probed
eight addresses along 65th Place through GeoSearch. They return **Maspeth** (53-73, 54-55, 52-58,
53-68), **Woodside** (39-60, 39-62), **Middle Village** (64-20) and **Fresh Pond** (70-10). **Not one
returns Ridgewood.** The name "Ridgewood Gardens" is therefore not evidence of location. Still
`uncertain` — nobody may place this complex without an address — but the presumption should be
Maspeth, not Ridgewood.

**LUKE J. LANG — park Maspeth, the man Ridgewood.** Both confirmed verbatim from the same NYC Parks
sign: **"This triangle is located in the Queens neighborhood of Maspeth"** and **"Lang lived on
Bleecker Street in the nearby neighborhood of Ridgewood."** Wikipedia's Maspeth article calls him "a
local resident who died in World War I" — confirmed, and **wrong on the agency's own evidence.**
**Better evidenced: NYC Parks.** The park is Maspeth's; **the author must not write Lang as a Maspeth
resident.**

**ANDREW J. REIFF — park Maspeth, association named Ridgewood.** Confirmed verbatim: "president of
the **Ridgewood**-Metropolitan Civic Association of Queens for over 30 years" and "disputes over land
development in **his neighborhood of Maspeth**." The agency assigns the man to Maspeth and the
organisation's name to Ridgewood. **Park is Maspeth's**, address 59-25 Fresh Pond Road, GeoSearch
Maspeth. No conflict.

**FRANK PRINCIPE PARK — the agency contradicts itself and Maspeth wins.** Both halves confirmed: the
**NYC Parks web page** prints "Zip Code: **11377, 11378**"; the **Open Data row for Q131** carries
`zipcode = "11378"` alone. 11377 is Woodside, which ships. **Better evidenced: Maspeth.** The
structured dataset says 11378 only; the park's entire sign text is Maspeth-framed; its namesake is
called "**Mr. Maspeth**" by the agency. A possible postal straddle at the northern edge is not an
assignment.

**FRESH POND ROAD — I established where the line actually falls.** GeoSearch probes I ran: `59-25`,
`60-54` and `62-00` return **Maspeth**; `65-20` and `70-20` return **Ridgewood**. **Every
Fresh-Pond-Road business in the finder's DOHMH table (60-39, 60-54, 60-61) is on the Maspeth side
and may be claimed.** Anything from roughly 65-xx south is Ridgewood's.

**MASPETH HIGH SCHOOL — four neighbourhoods across two articles.** All confirmed verbatim:
its own article opens **"Maspeth High School is a public high school in *Elmhurst*, Queens"** and
then says it "moved to its own building located at **54-40 74th Street in Maspeth**"; the Maspeth
article says it "opened on September 6, **2012**" and "was originally located in **Middle Village**";
the school article says 2013 at the Metropolitan Avenue Campus in **Forest Hills**. GeoSearch:
`54-40 74 STREET, **Maspeth**`. **Better evidenced: Maspeth for the current building**, on the
address, the geocoder and the school's own article's more specific sentence. The lede's "Elmhurst" is
unsupported by anything else. **Elmhurst and Forest Hills already ship — neither should carry it.**

**KNOCKDOWN CENTER — Maspeth, not contested.** Wikipedia ("located in the Maspeth neighborhood of
Queens") and GeoSearch (`52-19 FLUSHING AVENUE, Maspeth`) both confirmed by me. Flushing Avenue here
abuts the Brooklyn line and press files it under Bushwick/East Williamsburg/Ridgewood; **that is
press error, not evidence.** Maspeth's.

**ST. SAVIOUR'S — site Maspeth, fabric Middle Village.** Confirmed. Site: Rust Street and 57th Drive
(Wikipedia) / "off the corner of Rust Street and **57th Road** in Maspeth" (QNS) — **the suffix
conflict is real; write neither silently.** The object is in Middle Village and is not Maspeth's to
record as a place. The *story* is Maspeth's.

**NEWTOWN CREEK / KOSCIUSZKO BRIDGE / GRAND STREET BRIDGE — cross-boundary, no single page owns
them.** Confirmed: the creek "drained parts of what are now the neighborhoods of Bushwick,
Williamsburg, and Greenpoint in Brooklyn; and **Maspeth, Ridgewood, Sunnyside, and Long Island
City** in Queens." Maspeth's distinct claim is **Maspeth Creek**. The **Greenpoint oil spill is a
Brooklyn event** and must not be annexed — Brooklyn ships separately with 69 guides.

**RIDGEWOOD SAVINGS BANK, 107-55 Queens Boulevard.** Never surfaced in Maspeth research. Confirmed
absent from this dossier. Forest Hills'. Not claimed.

**FLUSHING MEADOWS CORONA PARK and the eight `Ethos.Seeds.CitiFieldPlaces` holdings.** Confirmed
absent. Nothing in Maspeth's CD5 dataset, GeoSearch, or narrative sources reaches CD4/CD7. The
firewall held. Link to `/g/citi-field-guide` only if a routing sentence is genuinely warranted, which
for Maspeth it is not.

---

## 4. DOHMH-ONLY BUSINESSES — the disclosure ruling

**I re-ran the query myself: `43nn-pn8j?zipcode=11378` returns 1,026 inspection rows resolving to
89 unique CAMIS records.** The finder's figures are exact. So is its cuisine tally: American 21,
Latin American 9, Chinese 9, Pizza 8, Bakery Products/Desserts 5, Japanese 5, Mexican 3, Irish 2,
Polish 1, Italian 1 — all reproduced independently.

**RULING: all twenty businesses in F81 are sourced to the DOHMH inspection dataset and nothing
else.** I confirmed every trade name and address against the dataset myself; all twenty match
exactly. **Their existence and their address may be published. NOTHING about them may appear in
prose** — not a recommendation, not "neighbourhood institution", not "beloved", not "longstanding",
not a cuisine characterisation beyond the administrative label, not an implication that any of them
is still open. A DOHMH row proves registration at an address in a ZIP. It proves nothing else.

The two exceptions the finder names are correct and I confirm both: **Knockdown Center** (Wikipedia
article, which I verified; its own site I could not reach) and **Maspeth Federal Savings** (its own
website, which I verified).

**One caution the finder missed:** the dataset contains **two** Lechoneria records — `LECHONERIA NY`
at 52-27 69 Street and `LECHONERIA` at 71-04 Grand Avenue (no cuisine label). If the author lists
one, it must not be described in a way that merges the two.

**And the finder's own "pattern worth noting" must not ship.** Its inference — that Maspeth's
Polish/Italian/Irish reputation is contradicted by a Latin-American-and-Chinese restaurant register —
is arithmetically true of the dataset and analytically unsound, for exactly the reasons the finder
itself gives (coarse labels, groceries and delis absent from a restaurant dataset). It is a
hypothesis, not a finding. **Do not publish it as an observation about the neighbourhood.**

---

## 5. SINGLE-SOURCED CLAIMS — may they ship?

**Ship with explicit attribution ("according to …"), never in the page's own voice:**
- The Metropolitan Oval's claims about itself — "one of the oldest continually used fields in the
  country", "The history of the Metropolitan Oval is the history of soccer in America" (both
  confirmed verbatim on metropolitanoval.org). Attribute to the Oval.
- The Oval's account of **1994** — confirmed verbatim: "A 1994 New York Times article described how
  the mostly white community of Maspeth was simply uncomfortable with and unwelcoming to people from
  a different culture in their neighborhood." **Attribute this to metropolitanoval.org and to nobody
  else. Nobody in this pipeline has read the 1994 NYT article. Citing the NYT for it is citing a
  source no one has seen.**
- Maspeth Federal Savings' "Founded in 1947" and its slogan "Your Story is our story. Bank Community.
  Bank Maspeth." — both confirmed verbatim on the bank's own About page. **Its street address is
  NOT on that page — I checked, and there is no address string anywhere on it.** `56-18 69 STREET`
  geocodes to Maspeth but is unsourced. **Publish the bank without an address, or find one.**
- NYC Parks' sign texts generally — attribute to the sign. They are an agency's public history, and
  in at least one case ("Mt. Olivet Lutheran") demonstrably wrong.

**Do NOT ship on present evidence (single-sourced to Wikipedia, and consequential):**
- **FDNY Squad 288/Hazmat 1's 19 fatalities.** Confirmed as Wikipedia's wording — "The firehouse lost
  19 firefighters in the collapse of the towers, the largest loss from any firehouse in the city" —
  and separately "the largest of any FDNY unit". **Wikipedia is the only source and it phrases the
  superlative two different ways on one page. Check against FDNY or the 9/11 Memorial before writing
  a word. A wrong 9/11 casualty count is not a small error.** The firehouse address 56-29 68th Street
  is confirmed by GeoSearch and may ship.
- **The Boyash (Ludar) shanty town, 1925–1939, bulldozed.** Confirmed as Wikipedia's wording. One
  uncited sentence about a Romani community and its forced removal. **Must not be published without
  a real source, and if sourced, must not be reduced to colour.**
- **Phelps Dodge contaminating Newtown Creek.** A pollution allegation against a named corporation,
  sourced to one Wikipedia sentence. **Needs an EPA or DEC record. Not publishable as is.**
- **The Clinton Diner, its 1935 date, the *Goodfellas* connection and the 2018 fire.** Wikipedia only.
  Filming-location claims circulate without sources. Not publishable as is.
- **Maspeth Theater / Judy Garland / Fausner's / Wielback's / the Queens County Hotel / 1 Hill Street
  / Hagstrom Map.** All Wikipedia-only, all demolished. Hagstrom is checkable against the company's
  own history; do that or drop it.
- **Maspeth Town Hall's building history** (one-room schoolhouse 1897–1932 → girls' club/WPA → NYPD
  precinct to 1971 → community centre 1972). Confirmed as Wikipedia's wording. **The building's own
  operator does not tell this story — I read maspethtownhall.org and it is not there.** This is the
  best standing-building narrative Maspeth has and the least verified thing in the dossier. Priority
  target. The **address is fully confirmed** and may ship regardless.
- **The 1850s houses on 57th Avenue.** Wikipedia only, no address. Best streetscape lead, unusable
  as is.
- **PS 153's Polish dual-language program.** Wikipedia only. Genuinely distinctive; verify against
  NYC DOE, then it is one of the page's best facts.
- **The 2010 and 2020 population figures.** Both confirmed as Wikipedia's wording. 30,516 → 43,257 is
  a 42% decade increase in a built-out low-density neighbourhood. **Publish no growth rate from
  these two numbers.**
- **The Maspeth house-price range and the bus-route list.** Undated and stale respectively. I
  independently confirmed only **Q18, Q58, Q59, Q67** — those four are printed on the Queens Library
  Maspeth branch page. The other seven routes in F74 are unverified.

**Confirmed as quoted but NOT Maspeth facts — do not present them as such:** every health,
education, safety and crime figure in F93/F94 is a combined **"Maspeth and Ridgewood"** statistic.
I confirmed the wording of all of them. **Ridgewood is a page in this same wave and could publish
the identical numbers.** Worse, the source itself says the 104th Precinct's area is too large to read
as Maspeth's and then asserts "Maspeth and Middle Village are generally seen as safer than
Ridgewood" — an unattributed comparative judgement about a sibling page. **That sentence must not
appear in any form.**

---

## 6. THINGS THE AUTHOR MUST BE WARNED ABOUT

1. **Maspeth's landmark count is zero and must be allowed to be zero.** Re-verified from primary
   registries: LPC `buis-pvji?cd=405` returns exactly **two** individual landmarks in all of Queens
   CD5, both NTA `QN0502` (Ridgewood), neither at a Maspeth address. The NRHP Queens list contains
   the string "Maspeth" **zero** times. (I also chased a false positive: "Glendale" appears 15 times
   in that list, but every occurrence is inside an *image filename* —
   `RIDGEWOOD-GLENDALE-FRESH POND 098.JPG` — and every one of those listings carries
   `city=Ridgewood`. The finder's "Glendale, Woodside and Maspeth return none" is **correct**.)
   **Do not reach for the Ridgewood Theater or the Onderdonk House to fill the vacuum.**

2. **The Reiff Playground sign cannot be quoted triumphally.** I confirmed all of it: the campaign
   opposed "the substantial influx of people a new intermediate school would bring", against a school
   the Board of Education argued would foster **"better ethnic distribution of children."** NYC Parks
   frames this as a civic victory. **A page that repeats the framing without the second half is
   misrepresenting its own source.** Paired with the Oval's 1994 account, two independent
   institutional sources describe exclusionary community politics in 20th-century Maspeth. Writing
   Maspeth as a warm small town while omitting both is selecting evidence.

3. **NYC Parks contradicts itself constantly and the author will be tempted to tidy it.** All
   confirmed by me: Maspeth is at the "**head**" of Newtown Creek (Lang, Quick Brown Fox) and at the
   "**mouth**" of it (Hull). Q360G is "**Whitefish Triangle**" (Open Data), "**Oliver Hazard
   Triangle**" (page header) and "originally known as **Hamilton Place Triangle**" (sign) — and the
   sign says "adjacent Perry **Street**" while Open Data says "Perry **Ave**." Q360F is "Technical
   Sergeant Thomas J. Davey Triangle" (Open Data) and "**Cowbird Triangle**" (page) and "was once
   named **Alexander** Triangle" (sign) — **and the sign never says who Davey was. There is no source
   for Davey anywhere. Do not invent one.** Q090 is "Federalist Triangle" / "Federalist North
   Triangle". **Pick the agency's structured `signname` and note the alternates; never silently
   choose.**

4. **Use the agency's spellings, not Wikipedia's.** "**Peter Chahales Park**" (NYC Parks + Open Data)
   not "Peter Charles Park" (Wikipedia) — confirmed both ways. "**Quick Brown Fox Triangle**" not
   "Quick Brown Fox Park". Related: Wikipedia says a horse cart barn "at Brown Place, one block east
   of Grand Avenue … is now Peter Charles Park", while NYC Parks says the Maspeth Depot "was only a
   few blocks from this parkland" — **i.e. not on the site. The two conflict; do not merge them.**

5. **Frontera Park's former bus garage is not the Grand Avenue Bus Depot.** Confirmed: Frontera "was
   originally the home of the **Maspeth Bus Garage**", surrendered to the City in 1955. The Grand
   Avenue Bus Depot is a separate modern facility, and the only independent evidence I have for it is
   a DOHMH row — "MTA MASPETH CAFETERIA, 48-05 GRAND AVENUE" — which confirms an MTA facility with a
   cafeteria at a Maspeth address and **nothing about fleet or routes.** Wikipedia's "decent
   battery-electric fleet" is editorialising and unusable.

6. **The Interborough Express is unbuilt. Present tense is forbidden.** Confirmed as a proposal
   throughout, with an MTA estimate of "the early 2030s".

7. **There are two Metropolitan Ovals.** U.S. Soccer's own caution, confirmed verbatim:
   "(Confusingly, another Metropolitan Oval in the city — this one located in the **Bronx** — also
   hosted games in the first half of the 20th century.)" **The corpus ships Bronx pages.**

8. **The St. Saviour's trailer conflict is real and both sources are institutional.** NYLC, from a
   site visit dated **January 22nd, 2026**: "The stored old-growth wood appeared to be in **good
   condition**, but the challenges of rebuilding the building are significant," and photo captions
   reading "stored in **locked** trailers". QNS, from a **Dec. 4** visit: "a QNS/Ridgewood Times
   reporter observed the contents — mostly moldy piles of wood filled with rusted nails — stored
   within the **unlocked** trailers, located in public view, with no gates or warning signs nearby to
   prohibit access." **Both verbatim, both confirmed, seven weeks apart. Record both; assert
   neither.**

9. **Garlinge Triangle's "World's Fair benches" is not a route into World's Fair material.**
   Confirmed as the sign's own phrase; it does not say which fair. Given the wave-wide firewall,
   treat it as a bench description and nothing more.

10. **Knockdown Center's own website was unreachable for me.** Everything in F67 — the address string
    as the venue prints it, "50,000 square-foot", "Gleason-Tiebout glass factory", "invented here in
    **1956** by **Samuel Sklar**" — is `uncertain` in this file. What I *did* confirm is Wikipedia's
    conflicting account: "Constructed in **1903**", "**In the 1930s**, the proprietor … transitioned
    the warehouse for a door manufacturing company", "**20,000 square-foot** main hall". **The
    invention date differs by two decades between the two accounts and only one names a person.
    Re-fetch knockdown.center before publishing either. Do not blend them.**

11. **The notable-people list must be handled as the finder says.** Not one entry states the nature of
    the Maspeth connection. **Hermine Braunsteiner** was a Nazi camp guard; she does not belong in a
    "notable locals" list beside artists and ballplayers. Two Bonanno bosses on an eleven-name list is
    not a source for a "mob neighbourhood" framing and such a framing is defamatory-adjacent about a
    living community.

12. **Maspeth has no subway.** Confirmed twice and independently: Wikipedia's "Maspeth is devoid of
    direct transit connections to Manhattan, as there are no New York City Subway stations and no
    express bus stops in Maspeth," and the Queens Public Library's own branch page, which prints
    **"NO TRAINS STOP HERE"** under *Getting Here*. The nearest station,
    Middle Village–Metropolitan Avenue, is in **Middle Village**. Any "getting there" prose must say
    so.

---

## 7. WHAT SURVIVES

The finder's §G5 assessment is, on my independent reading of the same evidence, correct and I endorse
it: Transfiguration as the one building of architectural consequence; the Metropolitan Oval as a
nationally significant sporting site with the Ridgewood boundary handled openly; Knockdown Center as
the one contemporary visitor draw; Maspeth Town Hall and the Maspeth Library as civic anchors with
clean, verified addresses; the cemeteries as the defining land use; the Long Island Expressway as the
physical fact that shaped the neighbourhood, with six pocket parks as its scar tissue; and St.
Saviour's as the honest story of what Maspeth lost and why.

**Maspeth's landmark count is zero. The page must be built on that, not around it.**
