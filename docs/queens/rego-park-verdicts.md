# Rego Park, Queens — VERIFIER verdicts (wave 3)

**Role:** INDEPENDENT VERIFIER. I re-fetched the finder's cited URLs myself and re-quoted every
string I confirm. I did not defer to the finder's reasoning. Where the finder's *quote* is accurate
but the finder's *gloss* is wrong, I say so and refute the gloss, not the quote.

**Retrieval date: 2026-09-01.**

**Tools that worked for me where the finder said they failed:** `nycgovparks.org` returns HTTP 200
to plain `curl` with a browser UA (the finder's 403 was a WebFetch artifact). The SEC returns 200
with a contact-bearing UA. So I re-read all six Parks history pages and the whole Alexander's 10-K.

**Tools that failed for me:** `geosearch.planninglabs.nyc` (HTTP 503 all session);
`queenslibrary.org` (Akamai "Request Rejected" bot block — I could NOT re-verify any QPL claim).

**How I geocoded.** The finder declined to geocode and left five contested places open. I resolved
them with **two independent city datasets that agree with each other**:
1. DCP 2020 NTA polygons — `https://data.cityofnewyork.us/resource/9nt8-h7nd.json` with
   `$where=intersects(the_geom,'POINT(lon lat)')`, using lot coordinates from PLUTO
   (`64uk-42ks`) or park geometry centroids from `enfh-gkve`.
2. DOB Permit Issuance (`ipu4-2q9a`), which carries its own `gis_nta_name` per permit.

---

## HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated (F1–F223) | **223** |
| Confirmed | **187** |
| Refuted | **10** |
| Uncertain | **26** |
| Candidate places (P1–P49) | 49 |
| **Places that survive as publishable on a Rego Park page** | **16 named places** (2 of them currently closed) **+ 72 address-only DOHMH food businesses** |

Places struck from Rego Park on neighborhood grounds: **11** (P12, P14, P23, P25, P26, P32, P33,
P34, P36, P37, P43). Places struck or held for lack of sourcing/status: P15/P16, P31, P38, P39,
P41, P42.

---

## 1. THE REQUIRED NEIGHBORHOOD RULINGS

Every ruling below is stated with the exact street address I ruled from, the source's own wording,
and which evidence is better.

### 1.1 The two marquee places the wave brief named

**FOREST PARK — NOT Rego Park, and NOT Forest Hills either. Verdict: `refuted` as a Forest Hills claim.**

NYC Parks property record `Q015 | Forest Park | Myrtle Ave, Union Tpke, Park Lane S | 506.86 acres`,
ZIPs `11375, 11385, 11415, 11421`, community boards `305405406409`
(https://data.cityofnewyork.us/resource/enfh-gkve.json). It has **no single street address** — the
Parks location string is a three-road boundary, which is the string to publish if it is published
at all.

DCP gives Forest Park **its own Neighborhood Tabulation Area**: I ran the park's own geometry
centroid (40.704300, −73.852151) through the 2020 NTA layer and got
`{'nta2020': 'QN8291', 'ntaname': 'Forest Park'}`. Sampling its edges: Union Tpke/Park Lane S →
`QN0901 Kew Gardens`; Seuffert Bandshell → `QN0902 Richmond Hill`; Myrtle & 71st → `QN0503 Glendale`;
visitor centre and carousel → `QN8291 Forest Park`. **No sample landed in `QN0602 Forest Hills`.**

The only thing tying Forest Park to Forest Hills in this corpus is an etymology, and it is a
one-way one. LPC LP-2066, which I re-read from the PDF, says of Cord Meyer in 1906:
> "Changing the name to Forest Hills because of its high ground and its proximity to the beautiful
> terrain of Forest Park, he began to lay out streets, install utilities, and construct the first
> houses."

*Forest Hills* is named after *Forest Park*. That is not a claim on the park.

→ **Ruling: Forest Park belongs to no file in this wave.** A Rego Park page may not claim it. A
Forest Hills page may not claim it either without better evidence than proximity; the honest
handling is Woodhaven/Glendale/Richmond Hill/Kew Gardens, or a dedicated Forest Park page. Note
for the arbiter: NYC Parks lists Forest Park as the Remsen Family Cemetery's nearest other park
("Forest Park (0.51 miles)"), which is a *walkability* fact a Rego Park page may state — it is not
an ownership claim.

**LOUIS ARMSTRONG HOUSE MUSEUM, 34-56 107th Street — NOT Rego Park under any reading. Verdict: `confirmed` as Corona's, with a caveat the Corona author must see.**

PLUTO, queried on the exact address the brief gives:
`{'address': '34-56 107 STREET', 'zipcode': '11368', 'cd': '403', 'council': '21', 'block': '1748',
'lot': '36', 'latitude': '40.7545640', 'longitude': '-73.8615973', 'ownername': 'NYC DEPARTMENT OF
CULTURAL AFFAIRS', 'yearbuilt': '1910', 'bldgclass': 'P7'}`.

**Publishable street address: `34-56 107th Street, Corona, NY 11368`.**

That point resolves to `{'nta2020': 'QN0303', 'ntaname': 'North Corona', 'cdtaname': 'QN03 Jackson
Heights-East Elmhurst (CD 3 Approximation)'}`.

→ **Ruling for Rego Park: emphatically not ours.** Rego Park's 107th/108th Street addresses are
`63-xx` to `70-xx` — the low-60s-to-70s grid in Community District 6, five kilometres and three
community districts away from `34-56`. Any Rego Park draft that reaches for Armstrong because it
sees "107th Street" is making a street-numbering error, not a judgement call.

→ **Warning to the arbiter and the Corona author:** by postal address it is Corona (11368), but by
DCP's own 2020 NTA it is **North Corona (QN0303) in Community District 3**, not the `QN0402 Corona`
NTA of this wave's CD4 pair. If the corpus is assigning by NTA anywhere else, that inconsistency
has to be decided deliberately rather than by accident. Rego Park has no stake in the outcome.

### 1.2 The finder's contested table, adjudicated

The finder's section 10 left C1, C2, C4, C11 and C14 "needs geocoding" and took no position on
C3 or C6. I geocoded all of them.

| # | Place | Exact address I ruled from | DCP 2020 NTA | DOB `gis_nta_name` | **Verdict** |
|---|---|---|---|---|---|
| C1 | **Trylon Theater** | 98-81 Queens Boulevard (block 2105) | **QN0602 Forest Hills** | Forest Hills (all 60 permits on the block) | **NOT Rego Park** — `refuted` |
| C2 | **108th St "Bukharian Broadway"** | 108th Street, ZIPs 11374/11375 | **QN0602 Forest Hills** at 63rd Dr, 66th Rd and 70th Rd | Forest Hills (200/200 permits) | **NOT Rego Park** — `refuted` |
| C3 | **Remsen Family Cemetery** | adjacent to 69-43 Trotting Course Lane; Block 3178 Lot 44 | **QN0601 Rego Park** (park-geometry centroid 40.712442, −73.858474) | — | **Rego Park** — `confirmed` |
| C4 | **Rego Park I / II / The Alexander tower** | 61-35 Junction Boulevard | **QN0601 Rego Park** | Rego Park (200/200 permits at 61-35 Junction Blvd) | **Rego Park** — `confirmed` |
| C5 | **Ridgewood Savings Bank, Forest Hills Branch** | 107-55 Queens Boulevard, Block 2216 Lot 1 | QN0602 Forest Hills | — | **Forest Hills** — `confirmed`, never contested |
| C6 | **67th Avenue station** | 67th Ave & Queens Blvd | **QN0602 Forest Hills** | — | **NOT Rego Park** — `refuted` |
| C7 | **Woodhaven Blvd station / Slattery Plaza** | Queens Blvd & Woodhaven Blvd | **QN0401 Elmhurst** | — | **Elmhurst** — `confirmed` |
| C8 | **Queens Center Mall** | 90-15 Queens Boulevard (ZIP 11373, CD 404, owner Macerich) | **QN0401 Elmhurst** | — | **Elmhurst** — `confirmed` |
| C9 | **LeFrak City** | Junction Blvd / 57th Ave / 99th St / LIE | — | — | **Corona–Elmhurst, CB4** — `confirmed` |
| C10 | **Real Good Playground** | Horace Harding Expwy Svc Rd S., 62 Ave bet. 99 St and 102 St | **QN0602 Forest Hills** (centroid 40.735584, −73.857133) | — | **GENUINE CONFLICT — see below** |
| C11 | **The Painter's Playground** | Alderton St bet. Dieterle Cr. and Ellwell Cr. | **QN0601 Rego Park** (centroid 40.720542, −73.860144) | — | **Rego Park** — `confirmed` |
| C12 | **112th Precinct stationhouse** | 68-40 Austin Street | QN0602 Forest Hills (PLUTO ZIP **11375**) | — | **Forest Hills** — `confirmed` |
| C13 | **Firehouse E305 / L151** | 111-02 Queens Boulevard | QN0602 Forest Hills | — | **Forest Hills** — `confirmed` |
| C14 | **Whitepot Junction** | LIRR Main Line × Rockaway Beach Branch ROW | **QN0601 Rego Park** | — | **Rego Park** — `confirmed` |
| C15 | **Drake Theater / Joe Abbracciamento** | Woodhaven Boulevard, house number never stated by any source | — | — | **`uncertain`, and see the Woodhaven Boulevard rule below** |

**Two rulings the finder did not even list, and both matter more than most of the table:**

| Place | Exact address | DCP 2020 NTA | DOB `gis_nta_name` | Verdict |
|---|---|---|---|---|
| **London Lennie's** (finder's P36) | 63-88 Woodhaven Boulevard | **QN0504 Middle Village** | Middle Village (7/7 permits) | **NOT Rego Park** — `refuted` |
| **Masbia of Queens** (finder's P37) | 98-08 Queens Boulevard | — | **Forest Hills** (10/10 permits) | **NOT Rego Park** — `refuted` |

Where sources conflict on these two, I say plainly which is better evidenced:

- **London Lennie's.** Its own site header says, and I re-quote it verbatim from
  https://www.londonlennies.com/about: *"63-88 Woodhaven Boulevard, Rego Park, NY 11374"*. DOHMH
  independently records `LONDON LENNIE'S | 63-88 WOODHAVEN BOULEVARD | Seafood`, zipcode 11374.
  Both are **postal** facts. The ZIP boundary and the neighborhood boundary are not the same line:
  DCP's `QN0601 Rego Park` / `QN0504 Middle Village` seam runs down Woodhaven Boulevard, and the
  restaurant's lot is on the Middle Village side. **Better evidenced: DCP + DOB (two agencies,
  agreeing, on lot geometry) over a restaurant's own letterhead.** The honest sentence is "63-88
  Woodhaven Boulevard, on the Middle Village side of Woodhaven Boulevard, with a Rego Park mailing
  address" — or leave it to the Middle Village file.
- **Masbia.** The *Queens Chronicle* piece Masbia republishes does say "at 98-08 Queens Blvd. in
  Rego Park" (I re-quote it below). But 98-08 Queens Boulevard is inside `QN0602 Forest Hills` on
  DOB's own tagging of every permit at that address. **Better evidenced: the agency geometry.** A
  newspaper naming a neighborhood in passing is weaker than a lot-level city assignment.

**The one genuine, unresolvable conflict: C10, Real Good Playground.** NYC Parks' own history sign
says, and I re-quote it verbatim from
https://www.nycgovparks.org/parks/real-good-playground/history:
> "The neighborhood Rego Park, where this property is located, takes its name from the Real Good
> Construction Company…"

But the park's own polygon centroid (40.735584, −73.857133) resolves to `QN0602 Forest Hills`, and
NYC Parks' *own* property page lists **"Zip Code: 11374, 11375"** — it straddles. Interior samples
at (40.7352, −73.8578), (40.7358, −73.8565) and (40.7355, −73.8572) all return Forest Hills;
(40.7350, −73.8590) returns Rego Park. **The park physically spans the line.** Neither source is
wrong. This is the one place in the wave where I decline to pick a winner: an NYC agency, in a sign
posted in the park, calls it Rego Park; DCP's boundary puts most of it in Forest Hills. If the
corpus needs one answer, take **Rego Park on the strength of the agency's own posted text plus the
name** — but the page must not imply the boundary is crisp, and the Forest Hills file must be told
so both do not claim it.

### 1.3 Where the DCP line actually runs (the fact the author most needs)

The `QN0601 Rego Park` / `QN0602 Forest Hills` seam on Queens Boulevard falls between the 96-xx and
98-xx blocks, **not at 108th Street** as the prose sources imply:

- `96-05 QUEENS BOULEVARD` (ZIP 11374, CD 406) → **Rego Park**
- `97-30 QUEENS BOULEVARD` (Rego Park Jewish Center) → **Rego Park**
- `98-81 QUEENS BOULEVARD` (Trylon) → **Forest Hills**
- `99-01 QUEENS BOULEVARD` (ZIP 11374, CD 406) → **Forest Hills**

**Consequence the author must internalise: ZIP 11374 is not Rego Park.** Of the 93 distinct
establishments in the DOHMH ZIP-11374 extract, only **72** fall inside the Rego Park NTA. Twelve
fall in **Middle Village** (every Woodhaven Boulevard address: Aroma/Sugar N Coal, Asia Chinese,
Cups N Cakes, Gyro Grill, Haven Grill & Sushi, Joya Hall, London Lennie's, Nur Thai, Parceros
Bakery, Pollos a la Brasa Mario, Salsa Pizzeria, Uyghur Lagman House). Eight fall in **Forest
Hills** (Grand Sichuan 98-108 Queens Blvd, Imperial 98-92, Lime & Salt Bar 98-102, Marakand 98-98,
Pho 99 at 65-37 99 St, Rego Park Best Pizza 99-10 63 Rd, Tandoori Food & Bakery 99-04 63 Rd, Vista
65 at 97-12 65 Rd). One — Panda Express, 90-04 Metropolitan Avenue — falls in **Glendale**.

Note the trap: two of the businesses that carry "Rego Park" *in their own names* (Rego Park Best
Pizza & Fried Chicken; and the 99-04 63 Road bakery) are outside the Rego Park NTA. Names are not
evidence.

---

## 2. THE FLUSHING MEADOWS CORONA PARK RULE

**`confirmed`, and the finder handled it correctly.** Rego Park contains no part of Flushing
Meadows Corona Park; the park is across the Long Island Expressway and Grand Central Parkway in
Corona and Flushing. Nothing in the finder's dossier re-creates Citi Field, the Unisphere, the
Queens Museum, the New York Hall of Science, the Queens Zoo, the USTA Billie Jean King National
Tennis Center, the New York State Pavilion or the Queens Theatre.

The finder's two World's-Fair touches are both **naming facts about non-park buildings** and are
both `confirmed` verbatim:

- **F169** — Wikipedia, *LeFrak City*: "The buildings are all named after cities or countries around
  the world and are grouped in clusters of four based on their theme. This naming system came about
  during the 1964 New York World's Fair, which was located in nearby Flushing Meadows–Corona Park."
  (LeFrak City is Corona/Elmhurst's anyway — see C9. Rego Park cannot use it.)
- **F101** — 1939nyworldsfair.com: "The Trylon Theater opened in 1939 and was named after the famous
  centerpice of the 1939 World's Fair which was held in nearby Flushing Meadows." (Confirmed
  verbatim, misspelling and all — **but the Trylon is Forest Hills' and it is gone; see §4.**)

→ **Instruction to the author, restated:** the correct move is a link to `/g/citi-field-guide`.
Linking routes the reader; narrating steals another file's places. After my C1 ruling, Rego Park
has *no* remaining World's Fair hook of its own. Do not manufacture one.

---

## 3. VERDICTS BY CLAIM

Format: verdict, then the source's actual wording where I confirm or correct. Every quotation below
is one I re-fetched and re-read myself; I have trusted no string the finder presented as a quote.

### 3.1 Boundaries and administrative geography (F1–F11)

`confirmed`: **F1, F2, F4, F7, F8, F9, F10, F11.** The article the finder cites
(`Rego_Park,_Queens`) is a redirect — `#REDIRECT [[Rego Park]]` — so the live title is
**`https://en.wikipedia.org/wiki/Rego_Park`**. Content re-read from the raw wikitext:
> "Rego Park is bordered to the north by Elmhurst and Corona, to the east and south by Forest Hills,
> and to the west by Middle Village. Rego Park's boundaries include Queens Boulevard, the Long
> Island Expressway, Woodhaven Boulevard, and Yellowstone Boulevard."
> "Rego Park is located in Queens Community District 6 and its ZIP Code is 11374."
> "It is patrolled by the New York City Police Department's 112th Precinct."
> "Politically, Rego Park is represented by the New York City Council's 29th District and a small
> part of the 24th and 25th Districts."

`confirmed` **F5 / F6** exactly as the finder reported, from
https://data.cityofnewyork.us/resource/9nt8-h7nd.json:
`QN0601 | Rego Park | QN06 Forest Hills-Rego Park (CD 6 Approximation)`;
`QN0602 | Forest Hills`; `QN0401 | Elmhurst`; `QN0402 | Corona`, both `QN04 Elmhurst-Corona (CD 4
Approximation)`. **CD6 contains exactly these two NTAs and no third.**

`confirmed` **F8's council-member caution**, re-read from the six live Parks pages today: Lost
Battalion Hall, Real Good Playground and Horace Harding Playground print **"Council Member: James
F. Gennaro"**; Fleetwood Triangle, The Painter's Playground and Remsen Family Cemetery print
**"Council Member: Phil Wong"**. The LPC dataset independently assigns Remsen Cemetery to
`council: 30` and both Forest Hills landmarks to `council: 29`. The finder's read — "council
districts are a moving target; treat as low-value" — is correct. **Do not print a council member.**

`confirmed` **F9's internal inconsistency**: the body says "Covering an area of {{convert|455.74|acres}}"
while the infobox carries `area_total_sq_mi = 1.945`. Both strings are live in the same article
today. Flagging stands; do not print either without saying which.

`confirmed` and **upgraded, F11.** The finder guessed the hyphen; I confirmed the lot. PLUTO:
`{'address': '92-24 QUEENS BOULEVARD', 'zipcode': '11374', 'cd': '406', 'block': '3075', 'lot': '6',
'ownername': 'UNITED STATES POSTAL SERVICE', 'yearbuilt': '1948'}`, resolving to `QN0601 Rego Park`.
→ **Publishable address: `92-24 Queens Boulevard, Rego Park, NY 11374`.** Wikipedia's unhyphenated
"9224 Queens Boulevard" is a transcription of the USPS locator string, not an address.

`uncertain` **F10 (underlying source only).** The Wikipedia sentence is confirmed verbatim —
"The entirety of Community Board 6, which comprises Rego Park and Forest Hills, had 115,119
inhabitants as of NYC Health's 2018 Community Health Profile, with an average life expectancy of
85.4 years." I did **not** fetch `2018chp-qn6.pdf` either. The figure is a CD6 figure, i.e. Rego
Park **and** Forest Hills together; it is not a Rego Park statistic and must never be printed as one.

### 3.2 History (F12–F35)

`confirmed` verbatim: **F12, F13, F14, F15, F16, F17, F18, F19, F20, F21, F22, F24, F25, F26, F27,
F28, F29, F30, F31, F32, F33, F34, F35.**

The Parks signs, re-read live today:
> (Lost Battalion Hall) "Once farmland, the area had only one road, called Remsen's Lane. Chinese
> farmers worked the soil in an exclusive enclave, selling produce only to Chinatown. In the 1920s,
> the Real Good Construction bought out these farms and built one-family row houses, multi-family
> homes, and apartment buildings. Developers Henry Schloh and Charles Hausmann named the area in
> 1923, taking the first two letters from the first two words in the Real Good Construction
> Company's name."
> (Horace Harding) "Prior to development, Chinese farmers had owned this land and formed an
> exclusive farming enclave in this area, growing produce for sale in Manhattan's Chinatown."

`confirmed` **F20's owned-vs-leased conflict.** It is real and both halves survive re-reading.
Forgotten NY: *"the colonial farm families had been replaced by Chinese farmers, who leased the land
on which they grew their own crops to sell at the markets of Chinatown."* Do not smooth it. If one
must be chosen, note that the Real Good Playground sign says only that they "formed an exclusive
enclave," without asserting ownership — so "owned" rests on a single sign.

**`refuted` — F23's gloss (not its quote).** The quote is exact:
> "The neighborhood Rego Park, where this property is located, takes its name from the Real Good
> Construction Company, which developed this area in 1920. 'Re' comes from Real, 'Go' comes from
> Good, hence Rego Park."

But the finder's conclusion — *"1920 … 1923 … 1925 are all in circulation for the founding/naming.
This is the single most frequently mis-stated fact"* — is wrong, and it is wrong because the finder
stopped reading two sentences early. **The very same Real Good Playground sign continues:**
> "In 1923, developers Henry Schloh and Charles Hausmann named the area."

So NYC Parks is internally consistent across all three signs: **the area was developed from 1920 and
named in 1923.** There is no three-way dispute. There is one two-way dispute, and it is narrow:
*naming* is **1923** on three city signs and in Forgotten NY; Wikipedia's "1925" is a *development
start* date ("began development of the area in 1925," cited to a 1930 *New York Times* piece), not a
naming date. → **The author may state 1923 for the name and attribute it to NYC Parks.** That is a
material improvement over what the finder handed up.

`confirmed` **F32–F35** verbatim from
https://regoforestpreservation.blogspot.com/2012/02/tale-of-2-libraries-rego-park-edition.html:
> "it had only a storefront library, established in 1938, according to Queens Library records. Then
> in 1956, the community got a branch library, located at 91-34 63rd Drive between Austin Street and
> the Long Island Rail Road tracks."
> "A bigger blaze engulfed the entire strip of storefronts, including the library on Feb. 20, 1972,
> destroying it."
> "After a time with only a bookmobile serving Rego Park, the city bought the Shell gas station
> across the street, a mainstay of the neighborhood since the 1930s, and erected a new library in
> its place. The old location is now home to the Shalimar Diner."

Two additions the finder missed, both usable: the column locates the fire block precisely — *"the
short block on the east side of 63rd between Austin and the LIRR trestle"* — and closes with *"The
library underwent major renovations in 1989."* The 1959-vs-1960 tension the finder flagged is
`confirmed`: the same page says both "In 1960, after a fire at the bar" and "the 1959 fire wasn't
the only one." Print neither year unattributed.

### 3.3 Parks (F36–F83)

`confirmed`: **F36–F42, F44, F45, F46, F48, F49, F51, F52, F53, F55, F56, F57, F58, F59, F60, F61,
F62, F63, F65, F66, F67, F68, F69, F70, F71, F72–F83.**

The Open Data completeness check is `confirmed` exactly: `zipcode=11374` on
`enfh-gkve` returns **six** properties and no more — Q401 Lost Battalion Hall (2.412 ac), Q357B Real
Good Playground (1.598 ac), Q428 Horace Harding Playground (1.304 ac), Q062 Fleetwood Triangle
(0.027 ac), Q480 Remsen Family Cemetery (0.247 ac), Q306 The Painter's Playground (1.699 ac), all
community board `406`.

**F44 is `confirmed` as still true at 2026-09-01.** The banner is live on the page right now:
> "Lost Battalion Hall Recreation Center is closed due to construction. Visit our Capital Tracker
> page for updates on this project."

**`refuted` — F47's sourcing.** The finder attributes the dual ZIP "11374, 11375" to the **Open Data
record**. It is not there: the `enfh-gkve` row for Q357B returns `zipcode: 11374`. The dual ZIP
appears only on the nycgovparks.org page ("Zip Code: 11374, 11375"). Trivial as a fact, material as
a habit — the finder cited the wrong source for the one datum that turned out to decide C10.

`confirmed` **F57**, and I verified the negative the finder asserted: the Horace Harding sign's
directorship roster reads "the New York Municipal Railways System, American Exchange Irving Trust,
Bronx Gas and Electric, American Express, Continental Can Company, Public Service Corporation of New
Jersey, Southern Pacific Company, United States Industrial Alcohol, American Beet Sugar Company, and
the Wabash Railway" — **the New York, New Haven and Hartford Railroad is genuinely absent.** The
discrepancy with Wikipedia is real.

`confirmed` **F68 and F82**, the two important negatives: the history pages for The Painter's
Playground and Remsen Family Cemetery render the Historical Signs boilerplate and then stop. There
is no agency narrative for either. **Anyone writing one is inventing it.**

`confirmed` **F72–F80** verbatim against the LP-1177 PDF, which I converted and read in full:
> "REMSEN CEMETERY, between Alderton Street and Trotting Course Lane, adjoining 69-43 Trotting
> Course Lane, Borough of Queens. Landmark Site: Borough of Queens Tax Map Block 3178, Lot 44."
> "The oldest known grave is that of Jeromus Remsen, from 1790."
> "These tombstones date from 1790 through 1819."
> "A World War I memorial, honoring the community's service in that war, occupies the center of the
> cemetery. It consists of two doughboy statues flanking a flagpole."

`confirmed` **F72's key negative**: the report names no neighborhood, only "Borough of Queens."
`confirmed` **F81**: LPC says **Jeromus** throughout, including in the formal findings ("Colonel
Jeromus Remsen of American Revolutionary War fame"); Forgotten NY says "Colonel **Jacobus** Remsen."
**Print Jeromus. LPC is the primary document and Forgotten NY is a volunteer article.**

Two details the finder did not extract and the author may use, both from LP-1177: the younger
Jeromus was "born on November 22, 1735," and the 1925 survey's eight graves "included those of
Colonel Jeromus Remsen, his wife Ann(a) Remsen, a Jeromus Remsen who was probably their son, three
Remsen children, a Bridget Remsen, and Major Abraham Remsen."

`uncertain`: **F43** (the "two historic murals" — restored in 1995, nobody has identified the artist,
and the building is shut), **F54** (the concrete dinosaur/turtle/porpoise — the same paragraph still
says "Mayor Giuliani has provided $160,000 for an upcoming playground renovation," dating the text to
the late 1990s), **F64** (the compass with astrological signs and butterfly block art, a 1997
renovation), **F80** (the doughboys, as of 1981). **All four are 1980s–1990s sightings on signs that
have not been rewritten. None may be asserted in the present tense without a site check.**

### 3.4 Landmarks (F84–F110)

`confirmed` **F84 and F85**, and I ran the finder's completeness check on **both** datasets myself.
`buis-pvji` with `cd=406` returns three records; `ncre-qhxs` with `cd=406` returns the same three,
all `status: DESIGNATED`, all `hist_distr: No`. **There are exactly three individual landmarks in
Queens CD6, no historic districts, and no calendared-but-undesignated sites.** Remsen Cemetery
(`nta2020: QN0601`) is the only one in Rego Park. The finder's consequence stands: *if a draft
claims a Rego Park landmark other than Remsen Cemetery, it is wrong.*

`confirmed` **F86–F92** verbatim against the LP-2066 PDF, including the OCR artifact "modem" for
"modern," and the Cord Meyer passage quoted in §1.1 above.

`confirmed` **F93, F94** — re-fetched from https://www.regoparkjewishcenter.org/ today:
> "97-30 Queens Blvd, Rego Park, Queens, 11374"
> "The Rego Park Jewish Center is a traditional Conservative synagogue that balances a commitment to
> the time-honored traditions and ceremonies of Halakhic Judaism with everyday life in the modern
> world."
Also on the page and usable: phone **718-459-1000**, office@rpjc.org.

`confirmed` **F95, F96** — and the contradiction is worse than the finder said, because both halves
of it cite the **same** source. Wikipedia's *Rego Park* article: "notable for an A. Raymond Katz-designed
façade with Old Testament scenes and symbols **carved into it**." Wikipedia's *Rego Park Jewish
Center* article: "The façade features a **mosaic** by Hungarian-born artist A. Raymond Katz." Both
sentences carry the same `nylandmarks.org` citation. Forgotten NY offers a third placement, confirmed
verbatim: a mosaic "above the doorways to the sanctuary," i.e. interior. Infobox facts confirmed:
architect Frank Grad, "Frank Grad & Sons" in the body; `established = 1939 (as a congregation)`;
`completed = 1948`; NRHP `ref_num = 09000864`, nomination by "Virginia L. Bartos, June 2009."
**A fourth number nobody has: PLUTO gives block 3084 lot 14 a `yearbuilt` of 1956.** → **Do not
print a construction year and do not describe the Katz work until someone reads the nomination.**

`uncertain` **F97.** I did not independently test NPGallery or CRIS. The finder's blocker is
plausible and I could not clear it. Everything descriptive about the Katz work remains secondary.

`confirmed` **F98** as a faithful summary of the Wikipedia text, which cites NY Post, ABC7, The
Guardian and NBC New York, May 2026, and names Congregation Machane Chodosh and the Rego Park Jewish
Center. **I agree with the finder's recommendation not to put it on a visitor page** — it is a hate
crime four months old, the wave brief does not ask for it, and a travel page is the wrong container.

`confirmed` **F99** (verbatim), **F100, F101, F102, F103, F104, F105, F106, F107** — all re-fetched.

> (Rego-Forest) "This theater at 98-81 Queens Blvd, **Forest Hills** had cultural, architectural, and
> historical significance to the 1939 – 1940 World's Fair… It was the 'Theater of Tomorrow'…"
> (Rego-Forest) "The Trylon Theater's landmark application was denied, but much of the building's
> original decor is still in tact."
> (Rego-Forest) "In short, when former councilmember, Melinda Katz, did NOT support landmarking sites
> in Forest Hills, the Landmarks Preservation Commission backed off from the Trylon Theater."
> (1939nyworldsfair.com) "I also learned that the architect of the Trylon Theater was Joseph Unger,
> who also designed homes Queenswide and elsewhere."

**`refuted` — F99's gloss.** The finder calls Wikipedia's "closed in 2009" versus Perlman's
"December 31, 1999" a *"ten-year discrepancy on a headline fact."* It is not a discrepancy; it is
two different closures of two different things. Perlman dates the **movie house**'s closing
("closed on December 31, 1999 after its lease expired"); Wikipedia's 2009 sentence sits inside a
paragraph about the **synagogue** that occupied it from 2006 and is cited to a Daily News piece
about the synagogue's later eviction fight. Both can stand. Nothing needs averaging.

**`refuted` — F103's currency, and this is the single most important correction in this document.**
See §4.

`confirmed` **F108, F109, F110**, including the finder's provenance warning, which I verified
word-for-word in Forgotten NY: *"One anecdote from Cinematreasures is illuminating: In December,
1978, the Drake's interior was heavily damaged during a midnight screening of a Led Zeppelin concert
movie."* Wikipedia has laundered a user-contributed anecdote into encyclopedic voice. **The 1978
riot may not be stated as fact.**

### 3.5 Streets (F111–F126)

`confirmed`: **F111–F126**, all re-read. Highlights re-quoted:
> (Forgotten NY) "The semi-circular streets were laid out and given aristocratic-sounding
> alphabetized names from A through F: Asquith, Boelsen, Cromwell, Dieterle, Elwell and Fitchett."
> (Forgotten NY) "Two lines of the LIRR, the Main Line and the Rockaway Branch, border the Crescents,
> and prevented them from being completed as circles."
> (Forgotten NY) "The Rego Park of today fills a triangular piece of land bordered by three major
> Boulevards: Queens, Woodhaven and Yellowstone."
> (Forgotten NY) "Yellowstone Boulevard (named by an early-20th century realtor; its derivation is
> unclear)"
> (Forgotten NY) "We are technically just in Elmhurst, albeit right on its border with Rego Park."

`confirmed` **F123's contradiction of F122.** Both strings are in the same Forgotten NY article:
"One of these was Whitepot Road, known as Yellowstone Boulevard today," and, later, that the
derivation "is unclear" and the name came from a realtor. Wikipedia's "It was named after the area's
original name" is unsupported by the source it cites. **Do not print the Whitepot etymology for
Yellowstone Boulevard.**

`confirmed` **F121's caution.** The "Boulevard of Death" nickname is sourced to a 2006 volunteer
article and a 2015 WSJ piece. I found no current DOT source either. **Do not present it as a
current description.**

**`refuted` — F3's byline.** The Forgotten NY article is bylined **"REGO PARK, Queens by Kevin Walsh
March 19, 2006."** Christina Wilkinson is a contributor whose passages are interleaved and marked in
the text ("Back to Christina:", "Christina resumes…", "Your webmaster:"). The finder attributes the
whole article, including the "Your Webmaster believes" hedges, to Wilkinson. **Any attribution line
must read Kevin Walsh / Forgotten New York, with Christina Wilkinson credited as contributor.** This
matters: several of the article's most quotable opinions are explicitly the webmaster's, not hers.

### 3.6 Transit (F127–F152)

`confirmed`: **F127–F145, F151.** All re-read from the raw wikitext of the four station articles.

> (63rd Drive–Rego Park) "The 63rd Drive–Rego Park station is a local station on the IND Queens
> Boulevard Line of the New York City Subway, consisting of four tracks. Located at 63rd Drive and
> Queens Boulevard in the Rego Park neighborhood of Queens…"
> "Both platforms have a blue tile band with a black border and mosaic name tablets reading '63RD
> DRIVE' in white sans-serif lettering on a black background and matching blue border. A few of
> these tablets have modern metal signs above them reading 'Rego Park.'"
> "East of this station, there is an unfinished signal tower on the Jamaica-bound (railroad north)
> platform and a bellmouth that diverges to the south from the local track."
> "In July 2025, the MTA announced that it would install elevators at 12 stations, including the
> 63rd Drive–Rego Park station, as part of its 2025–2029 capital program."
> (Rego Park station, LIRR) "Prior to the construction of the Rego Park station, two former stations
> near Whitepot Junction were named Matawok… Both stations were named for the Matawok Land Company,
> which built the neighborhood surrounding the junction known at the time as 'Forest Hills West.'"
> "Two parades were held in Rego Park on May 26 to commemorate the opening of the station."

`confirmed` **F132's implication**: the elevator announcement means the station is **not currently
ADA-accessible**. The article's own infobox carries `accessible=future`. **A visitor page must say
so.**

**`refuted` — F134 as a Rego Park claim.** The quote is exact — "on the border of Forest Hills and
Rego Park" — but "border case" is not a neighborhood assignment, and the finder left C6 unresolved
on that basis. The station lot sits in `QN0602 Forest Hills`. **67th Avenue is Forest Hills'
station.** Rego Park has exactly one subway station of its own, 63rd Drive–Rego Park, and the finder
was right that it is "unambiguously assigned to Rego Park by every source" — that part is `confirmed`.

`confirmed` **F136/F137** — "Located in Elmhurst, Queens"; the surviving SLATTERY PLAZA mosaic name
tablets are real and findable **but they are in Elmhurst.** Hand them to the Elmhurst file.

`confirmed` **F146–F150**, re-fetched from both advocacy sites:
> (thequeensway.org) "The QueensWay is a community-led effort to transform a blighted, 3.5 mile
> stretch of abandoned railway in Central Queens into a family-friendly linear park and cultural
> greenway."
> (queenslink.org) "The QueensLink would extend the existing 'M' subway line south from 63rd Dr-Rego
> Park to the Rockaways… then running beneith the right-of-way until Metropolitan Ave."
> (queenslink.org) "Tunneling to Metropolitan Avenue would make it possible for all the land at White
> Pot Junction in Rego Park to be used for park space, community gardens, walking trails, and bike
> trails."
> (queenslink.org) "The Forest Hills Little League could continue to use the land just north of Fleet
> Street that was once part of the right-of-way."

**Both organisations are partisan and the finder's instruction is right: attribute, never adopt.**
Note that both sites are advocacy marketing — "blighted" is QueensWay's word for a place readers
might walk past, and it must appear in quotation marks or not at all.

`uncertain` **F152.** I could not re-verify. queenslibrary.org returns an Akamai bot block
("Request Rejected") to every UA I tried. The finder's QPL bus list may be accurate; **I cannot
confirm it and neither should the author.** The finder's broader caution stands independently:
Wikipedia's thirteen-route local-bus list counts routes touching the neighborhood's edges, and the
Queens bus network redesign postdates the citation. **Print no bus list.**

### 3.7 Commerce and housing (F153–F176)

`confirmed` **F153, F154, F155, F156, F158, F159**, all re-read from the Alexander's Form 10-K
(SEC returns 200 with a contact-bearing UA):
> "Rego Park II, a 606,000 square foot shopping center, is located on Junction Boulevard in Queens.
> The center is anchored by a 145,000 square foot Costco and a 133,000 square foot Kohl's. The center
> also includes a 60,000 square foot Burlington, a 47,000 square foot Best Buy, and a 40,000 square
> foot Marshalls. Kohl's' store is currently closed but the tenant remains obligated under its lease
> which expires in January 2031"
> "Rego Park I, a 338,000 square foot shopping center, is located adjacent to our Rego Park II
> shopping center. The property is now vacant since the relocation of Burlington and Marshalls to
> Rego Park II in 2025. We are currently exploring sale opportunities for the property and are in
> advanced negotiations with a potential buyer."
> "The Alexander apartment tower, located above our Rego Park II shopping center, contains 312 units
> aggregating 255,000 square feet."

Two facts the finder missed, both in the same filing and both useful: **Rego Park I "contains a paid
parking deck (1,241 spaces),"** and the Alexander tower is **97.7% occupied** as of December 31, 2025.

**`refuted` — F157's gloss, twice over.**
1. The finder writes: *"Wikipedia cites Curbed for the opening only, not the closing."* False.
   Wikipedia cites **Time Out New York** for the closing — "The only IKEA in Queens will close before
   the end of the year," and quotes it in the reference: *"the chain revealed that the location will
   shutter on December 3, 2022."* The IKEA closure is sourced.
2. More consequentially, Wikipedia puts the IKEA in **Phase II**. The 10-K puts it in **Rego Park I**:
   "$9,001,000 of lower rental revenue from **IKEA's lease expiration at Rego Park I**." The 10-K is
   the landlord's own audited filing. **Use the 10-K.** The finder's own instruction — "Every number
   conflicts with the 10-K. Use the 10-K." — was right and should have been applied here too.

`confirmed` **F160** (Vornado/alx-inc pages unreachable) — I did not re-test, but nothing rests on it;
marked `uncertain` in the count only where a fact depends on it, which is nowhere.

`confirmed` **F161, F162** as accurate quotations of Forgotten NY. But note what they are: a
volunteer article, twenty years old, in an explicitly personal register.
`uncertain` **F162's substance** — "Celebrity chef Jacques Pepin once worked here" carries no
citation on the page. It is a great hook and it is unsourced. **Lead, not fact.** The Walmart claim
in F161 is worse — opinionated, uncited, and about a political dispute. **Drop it.**

`confirmed` **F163–F166** (Queens Center Mall and Fairyland are Elmhurst's). PLUTO adds a
tiebreaker on the finder's unresolved 1972-vs-1973: the mall's lot, `90-15 QUEENS BOULEVARD`, block
1860 lot 100, owner `MACERICH QUEENS LIMITED PARTNERSHIP`, carries `yearbuilt: 1972` — consistent
with Forgotten NY's "Opened in 1972" as a construction date and Wikipedia's "September 12, 1973" as
an opening date. **Not Rego Park's problem either way; hand the whole thread to Elmhurst.**

`confirmed` **F167–F171**. LeFrak City is "in the southernmost region of Corona and the easternmost
part of Elmhurst" and "is part of Queens Community Board 4." **Decisive against Rego Park**, and
Forgotten NY's "The Lefrak Organization has definitely made its presence known in Rego Park and
neighboring Corona" is a sentence about a *developer*, not a *location*.

`confirmed` **F173, F175, F176** as quotations. `uncertain` **F172** (The Carol House, Savoy Gardens,
Jupiter Court, The Brussels, Walden Terrace — five names, zero independent sources, no addresses).
`uncertain` **F174** — I did not reach the NYT piece; the *phenomenon* is well attested and the
*editorializing* ("cheaply made," "polluting NYC streetscapes") belongs to Wikipedia and to Forgotten
NY's webmaster respectively. **If Fedders houses are described, describe them neutrally and cite the
NYT, or not at all.**

### 3.8 Food and drink (F177–F191)

`confirmed` **F177** exactly: `zipcode='11374'` on `43nn-pn8j` returns 966 inspection rows across
**94 distinct CAMIS**, **93 distinct name+address pairs**. The finder's count is right.

`confirmed` **F178** exactly: the `cuisine_description` field labels **13** establishments
`Jewish/Kosher`, **1** `Eastern European` (Registan Plov Center) and **1** `Russian` (Versailles
Palace). Full distribution: Jewish/Kosher 13, American 9, Pizza 7, Coffee/Tea 6, blank 6, Chinese 5,
Thai 4, Asian/Asian Fusion 4, Japanese 4, then singles and pairs.

**THE DOHMH-ONLY RULE — my ruling, stated plainly as the brief requires.**

For **every** establishment on the finder's list except London Lennie's, **the DOHMH inspection
record is the only source.** A DOHMH row proves that a food-service permit existed at an address and
was inspected. It proves nothing else. Therefore:

> **Their existence and their street address may be published. NOTHING about them may appear in
> prose.** No founding date. No ownership or family history. No cuisine narrative. No adjective. No
> recommendation. No "beloved," "legendary," "since," "family-run," "the best." A name and an
> address in a list is the entire permitted surface.

This binds all of: Almaz Palace, Ansor, Art of Grill, Avellino, Bagel Chef, Bagelette, Barosa,
Black Sea Fish & Grill, Cafe Bora-Bora, Chaikhana 7:40, **Cheburechnaya**, Champion Pizza, Don Alex,
Fatsa, Fortune, Fu Ying, Grand Sichuan, Haifa, Il Primo Caffe, Imperial, Iron Age, J&D Pizzeria,
Jade Bamboo, L'Chaim, Marakand, Marani, Omakase Ramen, Oceanic Boil, Paris Baguette, Peri Peri,
Pho 99, Pho Thai, Posh Fusion, Prestige, RB Bakery, **Registan Plov Center**, Rego Bagels, Rego
Garden, Rego Park Coffee Shop, Rego Slice, **Shashlichnaya/Sezam**, Spring Thai, Sushi 33, Sushi Ya,
Tandoor, Tandoori Food & Bakery, Tasty and Co, The Chicken Shack, The Dinerbar, The Taco Place,
Tropix, UThai, **Uyghur Lagman House**, **Versailles Palace**, Vista 65, and every chain outlet.

The finder bolded five of these — Cheburechnaya, Registan, Shashlichnaya/Sezam, Uyghur Lagman House,
Versailles Palace — because they are the interesting ones. **That is exactly the trap.** The
interesting ones are the ones a writer will be tempted to narrate, and they are the ones with the
least behind them. The finder's own §12 concedes it: these places "have no narrative sourcing
whatsoever beyond DOHMH rows." I confirm that and I am hardening it into a rule.

`confirmed` **F178's framing constraint too.** The Bukharian-restaurant density is a real and
publishable observation *because it is a count in a city dataset* — "the city's food-inspection
records list thirteen kosher establishments in ZIP 11374" is defensible; "Rego Park's celebrated
Bukharian restaurant row" is not. **Frame it as data or drop it.**

`confirmed` **F179**: Ben's Best, Knish Nosh, Joe Abbracciamento and Shalimar Diner are all absent
from the 11374 extract, and the finder is right that absence is not proof. **Do not assert any
closure from this.** (Shalimar alone is independently confirmed demolished — F186.)

**`refuted` — F180/P36's neighborhood.** See §1.2. The quotes are all `confirmed` verbatim from
https://www.londonlennies.com/about — "63-88 Woodhaven Boulevard, Rego Park, NY 11374"; "What began
as a neighborhood fish market evolved into one of Queens' most beloved seafood restaurants";
"Today, while honoring our rich history, London Lennie's is entering an exciting new chapter. Under
new ownership…" — and **F181 and F182 are the finder's best two findings in the whole dossier**: the
site gives **no founding year**, and the restaurant is **under new ownership**. The commonly
repeated founding dates are not on the restaurant's own site. **Print no year, and print no
"family-run institution" framing.** But the place itself is Middle Village's, not Rego Park's.
Phone confirmed: (718) 894-8084.

**`refuted` — F184/P37's neighborhood.** The quote is `confirmed` verbatim from
https://www.masbia.org/queens:
> "the Masbia Soup Kitchen Network, which was founded just under a decade ago and opened its latest
> location, its third, at 98-08 Queens Blvd. in Rego Park in March 2010."
> "Tucked inauspiciously between a pharmacy and an Indian seafood restaurant, the kitchen could
> easily be mistaken for just one more restaurant in a neighborhood that overflows with eating
> establishments."

But 98-08 Queens Boulevard is in `QN0602 Forest Hills` on DOB's tagging of all ten permits at that
address. **Also: this is a soup kitchen serving people in need. Even if it were Rego Park's, it is
not a visitor attraction and must not be listed as one.** If it appears at all, it appears as a
service, in a service register, with no invitation to visit.

`confirmed` **F185's corroborating Wikipedia text, F186, F187, F188** — all re-fetched from QNS.com:
> "The iconic Rego Park eatery, which served the community for 45 years, was destroyed by its new
> property owner Wednesday as the efforts of two men who grew up in Forest Hills and hoped to move
> the diner to another location fell through."
> "In April, preservasionist Michael Perlman started looking for an ally that could save the diner
> and transport it to a new location."
> "We tried but the diner would not fit in with the zoning on my property in Riverhead… We feel
> terrible but they have restrictive zoning with certain architectural requirements that prohibited
> this type of structure."

One detail the finder dropped that the QNS piece supplies: former Mets outfielder **Lenny Dykstra**
was part of the group hoping to market the relocated diner as a brewery.

`confirmed` **F189, F190.** `uncertain` **F189's build year** — QNS's "45 years" (⇒ c. 1974),
Forgotten NY's "built in 1972," and a NY Post headline from 2018 also saying "after 45 years" do not
reconcile. **Do not print a build year for the Shalimar.**

`uncertain` **F191.** The Jay Dee Bakery quote is `confirmed` verbatim, including the source's own
hedge — "Your Webmaster **believes** the sign dates to the 1950s." That is a guess in print. It is
also twenty years old and Jay Dee is absent from the DOHMH extract. **Do not send a reader to see a
neon sign nobody has verified this decade.**

### 3.9 Institutions, education, culture, people (F192–F223)

`uncertain` **F192, F193.** I could not reach queenslibrary.org at all. **Consequence: the library's
closure and its Winter 2029–2030 reopening are unverified by me.** The finder's instruction is
nonetheless the safe one and I endorse it on independent grounds: PLUTO confirms `91-41 63 DRIVE`,
block 3103 lot 43, `ownername: QUEENS PUBLIC LIBRARY`, `yearbuilt: 1974`, `bldgclass: P8`, in
`QN0601 Rego Park`. **Do not tell a reader to visit this library.** If the page mentions it, mention
it as a building under replacement, sourced to QPL, and re-check at ship time.

`confirmed` **F194, F195.** Wikipedia's "two-story, 18,000-square-foot building between 2021 and
2024" is `confirmed` as present in the article and is `refuted` as current by the finder's QPL
reading — which I cannot check. **Print neither timeline.** The 91-34 → 91-41 address drift is
`confirmed` and is consistent with the "new library across the street" account.

`confirmed` as quotations, `uncertain` as facts: **F196, F197, F198, F199, F200.** Wikipedia's own
wording is "The following elementary schools **serve** Rego Park" — serving is not siting, as the
finder correctly noted. I got no addresses for Our Lady of the Angelus, Resurrection-Ascension, Our
Saviour Lutheran School, the Jewish Institute of Queens, Valence College Prep or Central Queens
Academy either. **No school may be given an address, and none may be described as "located in Rego
Park," on this evidence.**

`confirmed` as quotations, `uncertain` as facts: **F201, F202.** No first-party source for Our
Saviour Lutheran Church exists in either dossier. Wikipedia spells it "Saviour," Forgotten NY
"Savior," and the 1926 date rests on a single uncited Wikipedia sentence plus a 2006 "almost 80
years" back-calculation. **Do not print a founding year.**

`confirmed` as a quotation, **`uncertain` as a fact: F203.** The sentence is live — "Most of the
residents are Bukharan Jewish" — and I traced its citation: `ref name=wsj201502`, the *Wall Street
Journal*, "New Residences, Proposed QueensWay Advance in Rego Park, Queens," February 5, 2015. So it
is single-sourced to a 2015 real-estate feature, and the finder is right that the census figures in
F9 (46.2% White, 31.7% Asian, 16.6% Hispanic) do not obviously support it. **It may not ship even
with attribution.** A superlative demographic claim about a living community, resting on one
paywalled property-section sentence from 2015, is exactly the kind of thing that should be replaced
by what can be counted — see F178.

`confirmed` **F204.**

`confirmed` **F205, F206, F207, F208** as quotations, re-fetched from barrypopik.com:
> (Popik, own voice) "Rego Park is sometimes given a '-stan' suffix (like the countries of Uzbekistan
> and Tajikistan) and is nicknamed 'Rego Parkistan.'"
> (Popik, own voice) "108th Street in Rego Park has been called the 'Bukharan Broadway' or 'Bukharian
> Broadway.'"
> (Wikipedia's *Bukharan Jews*, quoted on the same page) "New York City's 108th Street, often
> referred to as 'Buharlem' or 'Bukharian Broadway' in Forest Hills, Queens, is filled with Bukharian
> restaurants and gift shops."

**`refuted` — F206's geography.** The quote is accurate; the claim inside it is not. All 200 DOB
permits on 108th Street in ZIPs 11374/11375 carry `gis_nta_name: Forest Hills`, and DCP's NTA layer
returns `QN0602 Forest Hills` at 63rd Drive, 66th Road and 70th Road. **"Bukharian Broadway" is
Forest Hills' street.** A Rego Park page may say Rego Park is part of a Bukharian community that
extends into Forest Hills — that is well supported, including by Popik's own "mainly Rego Park and
Forest Hills" and by the Rego-Forest Preservation Council's twinned name — but it may not claim
108th Street.

`confirmed` **F208's caution about the source**, which I verified by reading the page: below Popik's
headnote the page is a scroll of quoted forum posts, including crude and slur-laden material.
**Popik's own headnote is usable. Nothing else on that page is.**

`confirmed` **F209, F210, F211** — re-fetched from arts.gov:
> "Fatima Kuinova / Bukharan Jewish Singer / 1992 / NEA National Heritage Fellow / **Rego Park, New
> York**"
> "Fatima Kuinova was born on December 28, 1920, in Samarkand, Tajikistan, in Soviet Central Asia,
> one of 10 children…"

The finder's two catches are both `confirmed`: the NEA's own text misplaces Samarkand in Tajikistan
(it is in Uzbekistan), and Wikipedia gives Kuinova's dates as **(1926–2021)** against the NEA's
December 28, **1920**. **This is Rego Park's single best-sourced cultural fact — a federal honour
filed under "Rego Park, New York" — and the author should lead with it.** Print the fellowship and
the year (1992). Do **not** print a birth year: two sources, two answers, one of them the same
source Wikipedia cites.

`confirmed` as a quotation, `uncertain` as a fact: **F212** (Malika Kalontarova; Wikipedia's citation
is a post on askanewyorker.com, a forum).

`confirmed` **F213** as a quotation, `uncertain` as to present existence. Wikipedia's only citation is
`regoparkgreencommittee.blogspot.com`. However — a detail the finder missed that partly rescues it —
the article carries an image captioned **"'REal GOod' mural on 63rd Drive at the LIRR overpass"**
(`File:REal GOod -mural2.jpg`), which is independent-ish evidence the mural existed and tells the
author what it depicts. **Still needs a site check before a reader is sent to it.**

`confirmed` **F214, F215**:
> "Rego-Forest Preservation Council seeks to preserve and commemorate the architectural and cultural
> history of Rego Park, Forest Hills, and adjacent neighborhoods of Queens, NY."

And the finder's inference is sound and worth keeping: **the organisation's own name pairs Rego Park
and Forest Hills as one constituency.** That is real evidence about how the boundary is lived — and
it does not override where the lots actually are.

`confirmed` **F216, F217, F218** as quotations. The *Maus* connection is `confirmed` as Wikipedia's
text and is separately supported by the reference Wikipedia gives, *The Age*, March 27, 2004:
"*Maus*… leaps between Poland during the war to Rego Park, New York." **This is the richest cultural
thread available and it is properly sourced. Use it.** F218 (*Dear John*) is `confirmed` and the
finder's instruction not to connect it to Lost Battalion Hall is correct — the source does not.

`uncertain` **F219, F220.** Two lists, minimal overlap, no citations on most names, and Wikipedia's
own *LeFrak City* article claims Kenny Anderson for LeFrak City (i.e. CB4). **Treat every name as
unverified.** Where Wikipedia does cite an obituary — Fred Silverman ("grew up in Rego Park,
Queens"), August Howard ("lived in Rego Park, Queens") — the name may ship with that attribution.
The rest may not.

`confirmed` **F221, F222, F223**, with the geography nailed down: `68-40 AUSTIN STREET`, block 3234
lot 22, `ownername: NYC POLICE DEPARTMENT`, **ZIP 11375**, `QN0602 Forest Hills`. The 112th Precinct
covers Rego Park; its stationhouse is in Forest Hills. Engine Co. 305 / Ladder 151 at 111-02 Queens
Boulevard is likewise Forest Hills and is one of the three CD6 landmarks.

---

## 4. ⚠ THE THING THE AUTHOR MUST BE WARNED ABOUT: THE TRYLON THEATER IS GONE

The finder's "richest veins" §11 item 6 offers the author a preservation story with "a survivor and
a casualty on the same boulevard," the casualty being the Trylon Theater, "stripped in 2005 with its
landmark application denied." Every historical fact in that sentence is `confirmed`. The present
tense is `refuted`.

**Evidence, from two city datasets:**

1. **DOB Permit Issuance (`ipu4-2q9a`), block 02105, Queens** — three **`DM` (demolition)** permits
   issued to **`TRYLON LLC`** in 2022:
   - `06/28/2022 | 98-81 QUEENS BLVD | lot 00014 | DM | TRYLON LLC | NTA: Forest Hills`
   - `03/24/2022 | 98-87 QUEENS BLVD | lot 00001 | DM | TRYLON LLC | NTA: Forest Hills`
   - `03/28/2022 | 66-02 99 STREET  | lot 00016 | DM | TRYLON LLC | NTA: Forest Hills`
2. **PLUTO (`64uk-42ks`)** now records a single condominium billing lot at that address:
   `{'address': '98-81 QUEENS BOULEVARD', 'lot': '7501', 'bldgclass': 'RM', 'yearbuilt': '2022',
   'numfloors': '16', 'unitstotal': '257', 'ownername': 'TRYLON, LLC', 'zipcode': '11374'}`

A sixteen-storey, 257-unit mixed residential/commercial building completed in 2022 now stands where
the theatre stood, on a merged lot, after demolition permits issued to an owner named for it. The
last preservation-side description of the building's state — Rego-Forest's "much of the building's
original decor is still in tact" — is from **January 2012**.

→ **Rulings:**
- **Neighborhood:** the Trylon site is `QN0602 Forest Hills`, per DCP and per all 60 DOB permits on
  the block — and per the Rego-Forest Preservation Council itself, which writes "This theater at
  98-81 Queens Blvd, **Forest Hills**." Rego Park may not claim it.
- **Existence:** the author must not describe the Trylon in the present tense, must not tell a
  reader to go look at its façade, marquee, terrazzo floor, mosaic ticket booth or Trylon fountain,
  and must not imply the building survives in altered form. If the Forest Hills file wants the
  story, it is theirs, and it now ends in 2022, not 2005.
- **F103 remains `confirmed` on its own terms** — the Trylon was never designated and never
  calendared, so *"any draft saying the Trylon 'is landmarked' is false"* is right. It is now false
  in a second way as well.

---

## 5. OTHER WARNINGS FOR THE AUTHOR

1. **Two of the sixteen surviving places are shut.** Lost Battalion Hall Recreation Center is
   "closed due to construction" — banner live today. The Rego Park library is closed for
   rebuilding. Neither may be presented as visitable. Both need re-checking at ship time.
2. **Do not print a bus list, a founding year for Our Saviour Lutheran Church, a build year for the
   Shalimar Diner, a construction year for the Rego Park Jewish Center, a birth year for Fatima
   Kuinova, or a council member.** Each of those has two or more live, irreconcilable values.
3. **Do not print "Boulevard of Death"** as a present-tense description without a current DOT
   source. I found none either.
4. **Do not narrate the December 1978 Drake Theater riot.** Wikipedia laundered it from a
   user-contributed Cinema Treasures anecdote; Forgotten NY says so out loud.
5. **Do not repeat the Walmart claim (F161) or the Melinda Katz claim (F104)** in the site's own
   voice. Both are advocacy/opinion. Attribute or drop.
6. **Do not assert any of the four 1980s–1990s sightings** — the Horace Harding animal sculptures,
   the Fleetwood Triangle compass and butterfly art, the Lost Battalion Hall murals, the Remsen
   Cemetery doughboys, or the Green Alliance mural — in the present tense.
7. **Attribute Forgotten New York to Kevin Walsh**, with Christina Wilkinson as contributor. The
   finder had this wrong throughout.
8. **The May 2026 antisemitic vandalism does not belong on a visitor page.** The finder made no
   recommendation; I am making one. It is recent, it is a hate crime, and the wave brief does not
   ask for it.
9. **ZIP 11374 ≠ Rego Park.** Twenty-one of the ninety-three ZIP-11374 food businesses are in
   Middle Village, Forest Hills or Glendale. Every Woodhaven Boulevard address is Middle Village.
   Every 98-xx and 99-xx Queens Boulevard address is Forest Hills. Check each address individually
   or publish none of them.
10. **Rego Park will look thin, and that is correct.** After the eleven neighborhood strikes, what
    remains is one landmark, four small parks, one subway station, one synagogue, one shopping
    complex, one vanished railway and a very well-documented naming story. That is an honest page.
    The temptation to pad it with Forest Hills' 108th Street, Forest Hills' Trylon, Middle Village's
    London Lennie's and Elmhurst's mall is exactly the failure mode this wave is watching for.

---

## 6. WHAT SURVIVES AS PUBLISHABLE

**Named places, with the exact address string to publish (16):**

| Place | Publishable address | Note |
|---|---|---|
| Rego Park (neighborhood) | Queens CD6; NTA `QN0601`; ZIP 11374 | |
| Remsen Family Cemetery | adjacent to 69-43 Trotting Course Lane, at Alderton Street | NYC Individual Landmark LP-1177; the only one in Rego Park |
| Lost Battalion Hall Recreation Center | Queens Blvd between 62nd Ave and 62nd Rd | **CLOSED for construction** |
| Horace Harding Playground | 62nd Drive between 97th Place and 98th Street | |
| Fleetwood Triangle | Woodhaven Blvd / 63rd Dr / Penelope Ave | |
| The Painter's Playground | Alderton St between Dieterle and Ellwell Crescents | no agency history text exists |
| Real Good Playground | Horace Harding Expwy Svc Rd S., 62nd Ave, 99th–102nd Sts | **straddles the Forest Hills line — coordinate with that file** |
| Rego Park Jewish Center | 97-30 Queens Boulevard, Rego Park, NY 11374 | no construction year may be printed |
| 63rd Drive–Rego Park station | 63rd Drive and Queens Boulevard | not ADA-accessible |
| Rego Park LIRR station (site of) | 63rd Drive at the LIRR overpass, between Austin and Alderton | nothing remains |
| Rego Center / Rego Park I & II / The Alexander | 61-35 Junction Boulevard | Rego Park I is **vacant and for sale** |
| Queens Public Library, Rego Park branch | 91-41 63rd Drive | **CLOSED** |
| US Post Office, Rego Park Station | 92-24 Queens Boulevard | |
| 63rd Drive / 63rd Road commercial spine | Woodhaven Blvd to Queens Blvd | |
| The Crescents | Asquith, Boelsen, Cromwell, Dieterle, Elwell, Fitchett | |
| Whitepot Junction / Rockaway Beach Branch ROW | LIRR Main Line × Rockaway Beach Branch | QueensWay/QueensLink both partisan |

**Plus 72 DOHMH-only food businesses inside the Rego Park NTA** — name and address only, no prose,
per §3.8.

**Struck on neighborhood grounds (11):** Trylon Theater, Ridgewood Savings Bank, Slattery Plaza,
67th Avenue station, Woodhaven Boulevard station, Queens Center Mall, Fairyland, LeFrak City,
London Lennie's, Masbia of Queens, 108th Street "Bukharian Broadway".

**Held for sourcing or status:** Drake Theater / Joe Abbracciamento (no house number, wrong side of
Woodhaven Blvd), the former Alexander's / Howard Johnson's site, Shalimar Diner (demolished 2019 —
publishable as history only), Jay Dee Bakery (status unknown), all schools, Our Saviour Lutheran
Church, the Rego Park Green Alliance mural (existence unverified).
