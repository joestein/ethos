# Union Square, San Francisco — VERDICTS

Adjudicated 2026-09-03 against `docs/san-francisco/union-square-finder.md`.
I re-fetched eleven sources and **every designation identifier the finder claimed**.
Rulings below are binding on the author.

**Counts: 41 PUBLISH · 19 REWRITE · 44 DROP · 12 ESCALATED.**
**Tier: GUIDE, on 23 uncontested surviving places (41 if every straddler lands here).**
**Designation identifiers: 38 claimed, 38 survived re-fetching. Zero corrections.**

---

## 1. WHAT I RE-FETCHED, AND WHAT IT SAID

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks | **24/24 numbers confirmed** — names, addresses and years exact |
| NPS `nrhp_locations` layers 0 and 1 | **14/14 reference numbers confirmed** — every `CertDate` exact |
| `97yj-54sx` name/address sweep, all 370 rows | Curran absent; I. Magnin `landmarkno` "0"; 40 LM-zero rows; max LM **335** |
| NPS name/address query, `Curran`/`445 Geary` | **0 features on layer 0, 0 on layer 1** — the third check |
| `gtr9-ntp6` Rec & Park | Union Square: every field exact, incl. `acres` 2.6001148800000005 |
| `r7bn-7v9c` Civic Art | Dewey, Colonnade ×4, Lotta's — verbatim; **one finder error** (below) |
| `c28a-f6gs` CBD | Union Square BID: established 1999, renewed "2004, 2019", expires 2034-06-01, revenue 6858146, 15 years — exact |
| `m22e-6hkz` Historic Districts | Cable Car HD `nr`/`cr` **Listed**, period 1873; only `a11 != No` row is Mint-Mission |
| `gfpk-269f` / `j2bu-swwd` | 117 units incl. `Downtown / Union Square`; 41 units with **no Union Square**. Confirmed |
| `g8m3-pdis` business registry, 26 addresses | Mostly confirmed; **two material finder errors** (below) |
| Operator sites ×8 | milibrary, searsfinefood, britexfabrics, apple, marinesmemorial, sonesta, johnsgrill, sfmta ×2 — all confirmed verbatim |
| `unionsquarealliance.com` | **CANNOT BE FETCHED.** Strict TLS: `CERTIFICATE_VERIFY_FAILED`. Bypassing the cert: **HTTP 403**. Not reachable by any means |

### Every identifier, re-verified

**Article 10 — all 24 exact.** 37 Hallidie Building, 130-150 Sutter Street, 1971 · 72 V. C. Morris
Building, 140 Maiden Lane, 1975 · 73 Lotta's Fountain, "Geary Street/ Market Street/ Kearny
Street", 1975 · 77 Samuel's Clock, 856 Market Street, 1975 · 82 Geary Theater, "415 Geary
Boulevard & 333 Mason Street", 1976 · 113 S.F. Curb Mining Exchange, 350 Bush Street, 1980 ·
117 Hammersmith Building, 303 Sutter Street, 1980 · 131 Wells Fargo Union Trust Branch, 744
Market Street, 1981 · 132 "Savings Union Branch Of Sec.Pac.Natl Bnk", 1 Grant Avenue, 1981 ·
134 The Mechanics Institute, 57-65 Post Street, 1981 · 141 Home Telephone Company, 333 Grant
Avenue, 1981 · 143 Fire Station 2, 460 Bush Street, 1981 · 154 James Flood Building, 870-898
Market Street, 1982 · 156 Phelan Building, 760-784 Market Street, 1982 · 162 The Hobart
Building, 582-592 Market Street, 1983 · 167 Met Life-Pacific Coast Head Office, 600 Stockton
Street, 1984 · 173 "Notre Dame Des Victoires Church & Rector", 564-566 Bush Street, 1984 ·
177 First Congregational Church, 432 Mason Street, 1985 · 183 Crown Zellerbach Building, 1 Bush
Street, 1987 · 195 Islam Temple (Alcazar Theater), 650 Geary Boulevard, 1989 · 233 The Golden
Triangle Light Standards, "Along the streets bounded by Market, and Sutter Streets", 2003 ·
243 Chronicle Building, 690 Market Street, 2007 · 244 Dressler or Garfield Building, 938-942
Market Street, 2004 · 297 One Montgomery Street (Crocker National Bank Building), 1-25
MONTGOMERY ST, 2022.

**NRHP — all 14 exact.** 71000185 Hallidie Building, 130 Sutter St., 11/19/71 · 75000471 City of
Paris Building, 181-199 Geary St., 01/23/75 · 75000472 Geary Theatre, 415 Geary St., 05/27/75 ·
75000475 Lotta Crabtree Fountain, "Market, Geary, and Kearny Sts.", 06/20/75 · 97000348
"Hunter--Dulin Building", 111 Sutter St., 04/17/97 · 02000371 "San Francisco Fire Department
Engine Co. Number 2", 460 Bush St., 04/17/02 · 04000327 Building at 735 Market Street, 07/27/04
**(SoMa's)** · 04000955 Woman's Athletic Club of San Francisco, 640 Sutter St., 09/10/04 ·
09001118 Four Fifty Sutter Building, 450 Sutter St., 12/22/09 · 13001107 Mutual Savings Bank
Building, 700 Market St., 01/22/14 · 100006911 Hobart Building, 582-592 Market St., 09/17/21
**(SoMa's)** · 66000233 San Francisco Cable Cars, 1390 Washington St., 10/15/66, `Is_NHL = X` ·
91000957 Lower Nob Hill Apartment Hotel District, 07/31/91 **(Nob Hill's, already shipped)** ·
86000729 Market Street Theatre and Loft District, 04/10/86.

**Not a designation, confirmed:** I. Magnin & Company Building, "251-259 GEARY ST",
`landmarkno` **"0"**, `yeardesignated` **"0.0"**. Forty such rows exist. The finder's §4f trap
is real and correctly stated.

**Highest landmark number, confirmed:** 335, St. Nicholas Cathedral, 2005 15th ST, 2026. The
register gains rows. **Do not tally it.**

---

## 2. TWO GATE MECHANICS THE FINDER MISSED — READ BEFORE WRITING A LINE

I read `test/ethos/seeds/san_francisco_seed_data_test.exs`. Two things bind this zone harder
than any other and the finder flagged neither.

**A. `Article 11` IS NOT AN ACCEPTED CITATION.** The gate's `@designation_citation` alternation
accepts `San Francisco Landmark No. N`, `Article 10`, `National Register`, `NRHP`,
`NR reference` and `reference number NNNNNN`. **It does not contain "Article 11".** So every
sentence of the form "…is an Article 11 Conservation District…" trips `@designation_claim`
(which fires on `designated|listed|landmark|registered|nominated`) and finds no matching
citation, and **fails the build**. The finder suspected this and asked someone to find the
Article 11 appendix. Nobody needs to: even a named, numbered Article 11 district would not
satisfy the regex. **DROP ARTICLE 11 FROM READER-FACING PROSE ENTIRELY.** It survives as
research record only. This kills the Westin St. Francis's only "designation", the citizenM
new-building-in-a-conservation-district fact, and every `A*` parcel line in §5.

**B. THE WORD "REGISTERED" TRIPS THE DESIGNATION GATE.** `@designation_claim` is
`\b(?:designated|listed|landmark(?:ed)?|registered|nominated)\b`. This zone leans on the
business registry harder than any shipped zone. A sentence like "Apple has been registered at
300 Post Street since 2016" is a designation claim as far as the gate is concerned, carries no
Article 10 number, and **fails the build**. Same for "the city's registry lists…". Write
business facts without the words *registered*, *registration* and *lists*: "Apple Union Square
is at 300 Post Street" and "The city's business records give a start date of 21 May 2016."

---

## 3. TIER RULING — **GUIDE**

The finder judged GUIDE. **Upheld, and not close.** Twenty-three places survive with no other
claimant at all; forty-one if every straddler in §5 lands here. A town-page is the SHORT form —
the gate rejects `town-page` at six or more places — so it is arithmetically unavailable.

The `guide` form the gate enforces: at least four places, an intro of **100–160 words**,
**4–6** FAQ entries, a section headed **exactly** `Getting there`, and a title of 120
characters or fewer.

The finder's justification for GUIDE was itself a tally — "at least sixteen Article 10 landmark
numbers … and eight more on its disputed rim; ten National Register reference numbers". That
reasoning is fine in the research record and **must not survive into prose**. Name the
buildings, cite their numbers, never count them.

---

## 4. DROP — 44

### 4.1 Dropped because the source cannot be fetched — 25

`unionsquarealliance.com` fails certificate verification, and returns **403** when the
certificate is bypassed. The finder recorded that it "resolves in Python". It does not, today,
by either route. Everything resting on it alone goes.

**DROP entirely** (no independent source at all): Hallidie Plaza · Biscuits and Blues ·
AB Steak · Akiko's Sushi Bar · Al Pastor Papi · Amorino Gelato · Asha Tea House · Tratto at The
Marker · Roxanne Café · One65 · Christopher-Clark Fine Art · Adeeni Design Group ·
A. Lange & Söhne Salon · Acne Studios · 450 Sutter Garage · 433 Mason Garage · Axiom Hotel ·
citizenM · Club Donatello · Kensington Park Hotel · Handlery Union Square · Hotel Nikko.

**DROP the Alliance's words, keep the DataSF row** — these publish as name and address only,
with every quoted description gone: Maiden Lane's "Afternoons On Maiden Lane" programming ·
August Hall's "three full bars… three distinct rooms and three lanes of bowling" ·
Chancellor Hotel's "one of the few family owned and operated hotels in San Francisco" ·
Caldwell Snyder's "Founded… in 1983… over 50 artists" · CK Contemporary's "historic".

**"Michelin-starred O' by Claude Le Tohic" — DROP, twice over.** It is a third-party award, and
its only source is unreachable. The finder was right to forbid it and is upheld.

### 4.2 Dropped because a shipped zone already owns it — 4

| Item | Owner |
|---|---|
| **Hobart Building** (LM 162, NRHP 100006911) | **`soma.json` owns `soma-hobart-building`.** The finder's collision table searched "market street" and still missed this. Union Square may not write it |
| **Lower Nob Hill Apartment Hotel Historic District** (NRHP 91000957) | **`nob-hill.json` already publishes the reference number, the 31 July 1991 listing date and the 590–1209 Bush / 680–1156 Sutter / 600–1099 Post extent.** Restating it duplicates shipped prose |
| Building at 735 Market Street (NRHP 04000327) | `soma.json` owns `soma-735-market-street` |
| Grant Avenue and Stockton Street **as streets** | `chinatown.json`. Individual buildings on them are still available |

### 4.3 Dropped as unsourced attributions — 8

Every one of these is repeated everywhere and sourced by nothing the finder or I fetched. The
Article 10 designation documents (`designationdocument.url` in `97yj-54sx`) were never opened
and are where these actually live.

**Frank Lloyd Wright** at 140 Maiden Lane · **Willis Polk** and the glass curtain wall at the
Hallidie Building · **Timothy Pflueger** at 450 Sutter and at the Union Square Garage ·
**Burnham & Root** and 1889 at the Chronicle Building · **Philip Johnson** and 1982 at Neiman
Marcus · **Foster + Partners** and 2016 at Apple · the **Magneta clock** and **Bliss & Faville**
at the Westin · the **Ruth Asawa fountain** at the Grand Hyatt (confirmed absent from
`r7bn-7v9c` — the finder is right, and it must not be asserted).

Note that "Wright's only San Francisco building" would independently fail the superlative regex
`\b[A-Z][a-z]+(?:'s|s')\s+only\b`, and "the first glass curtain wall building in the United
States" fails it too. There is no wording that rescues them without a citation.

### 4.4 Dropped as trading duration, superlative or award — 9

All confirmed verbatim on re-fetch, all banned:

| Claim | Source | Why |
|---|---|---|
| "Since 1854" / "one of the oldest institutions on the West Coast" | milibrary.org | duration + superlative |
| "founded in 1938" / "The World Famous 18 Swedish Pancakes" | searsfinefood.com | duration + superlative |
| "Since 1908" / "one of the city's most iconic destinations" | johnsgrill.com | duration + superlative |
| "more than seven decades" / "a one of a kind sensory experience" / moved to SF in 1952 | britexfabrics.com | duration ×2 + superlative |
| "Since 1946, Marines' Memorial Club has honored…" | marinesmemorial.org | duration |
| "Over a century old" / "constructed… for the Panama-Pacific International Exposition in 1915" | sonesta.com | duration + uncorroborated operator history |
| "legendary Actors' Workshop" | marinesmemorial.org | operator puffery |
| "the glamorous Redwood Room" | sonesta.com | operator puffery |
| Chancellor "one of the few family owned… in San Francisco" | Alliance | ranking with a comparison class |

### 4.5 Dropped on zone, closure or thinness — 12

Outside on all three readings, as the finder ruled and I uphold: **Emporium dome / 865 Market ·
the Warfield · Golden Gate Theatre · Alcazar Theater (LM 195) · Hilton Union Square** (Tenderloin
on all three despite its trading name). Also **Met Life 600 Stockton (LM 167)**, **Crown
Zellerbach (LM 183)** and **S.F. Curb Mining Exchange (LM 113)** — Nob Hill and Financial
District ground, listed by the finder for completeness only.

**Closed, confirmed on re-fetch:** Saks Fifth Avenue, 384 Post St, ended **2025-05-10** ·
Farallon, ended 2020-03-16 · Lefty O'Doul's at 333 Geary, ended 2017-02-01 · Alexander McQueen,
58 Geary, ended 2023-06-30. **Do not write any of them as open.**

**Private with no public access and no hours:** the Olympic Club and the Bohemian Club. DROP.

**Powell Street Station** — DROP as a place. Nothing was fetched for it: no platform count, no
opening year, no hours. A place with no facts is not a place.

**The Strand, 1127 Market** — DROP. `landmarkno` "0" and SoMa ground on both layers.

**I. Magnin's designation** — DROP. Confirmed `landmarkno` "0", `yeardesignated` "0.0". Its only
other status was Article 11, which §2A now forbids. What is left is an address with two fashion
tenants, which is not worth a place.

**Uptown Tenderloin HD and Market Street Theatre and Loft HD** — both `Listed`, both confirmed,
both on ground this zone does not hold. DROP.

---

## 5. ESCALATED — 12

Rule on these before the author writes; they are not mine to settle alone.

**A. The Geary Street theatre block — Toni Rembe Theater (415), Curran (445), Clift (495).**
Both DataSF layers say **Tenderloin**; the Union Square BID includes all three. I checked the
roster: **the Tenderloin is not in `zones` and not in `declined`.** It does not exist in this
wave in any form. So nobody else can claim these — and that is an argument from absence, not
from data. The finder asked that this be said out loud rather than happening silently. **Said
out loud.** My recommendation: award them to Union Square, on the BID reading, and record that
the reason is that no other page exists.

**B. Market Street's north side** — Flood (LM 154), Phelan (LM 156), Chronicle (LM 243), Wells
Fargo Union Trust (LM 131), Mutual Savings (NRHP 13001107), Samuel's Clock (LM 77), 1 Grant
Avenue (LM 132). Contested with `financial-district` and `soma`, **both live this wave**. This
is the largest block at risk and it should be settled as a block, not building by building.

**C. Lotta's Fountain** — CBD reads `Downtown`, not Union Square BID. Financial District has a
real claim. Escalated.

**D. Mechanics' Institute, 57 Post** — CBD reads `Downtown`. Financial District has a real
claim at 57 Post. This is the zone's best hours-bearing asset and losing it hurts.

**E. One Montgomery Street (LM 297)** — CBD reads `Downtown`. **My recommendation: Financial
District.** Union Square's claim is the weakest of the Market set.

**F. Dressler or Garfield Building (LM 244)** — Tenderloin on the 41-layer, 938–942 Market.
**My recommendation: not Union Square.**

**G. Bush Street — Notre Dame des Victoires (LM 173), Fire Station 2 (LM 143 / NRHP 02000371).**
Both read **Chinatown** on the 117 layer and fall outside every CBD. **Chinatown is SHIPPED.**
Recommend Union Square does not take them.

**H. Sutter/Post/Taylor west of Powell** — Marines' Memorial (609 Sutter), Metropolitan Club
(640 Sutter), Chancellor (433 Powell), Sears Fine Food (439 Powell). All read Nob Hill or Lower
Nob Hill on at least one layer. **Nob Hill is SHIPPED and does not own them by slug** — I
confirmed against the corpus scan. The containment argument is live but nobody has acted on it.

**I. Metropolitan Club specifically** — NRHP **04000955**, confirmed 09/10/04, with no other
live claimant in this wave. Worth the fight, but it is outside every CBD and reads Nob Hill on
both layers. The arbitrator's call.

**J. Hallidie Plaza / Powell Street Station / the Powell & Market turntable** — 41-layer says
Tenderloin. The turntable is the one item the roster brief explicitly assigns to this zone, so
it stays; the other two I have already dropped on other grounds.

**K. First Congregational Church (LM 177)** — Tenderloin on the 41-layer. Same absence argument
as §5A.

**L. The Hobart Building** — not a straddle but a **collision**: SoMa owns it. Flagged here so
the arbitrator sees it alongside the Market Street block, since the two decisions interact.

---

## 6. REWRITE — 19, with exact replacement wording

**1. Union Square plaza — the kind and the slug.**
`union-square-park` is Manhattan's. Use **`union-square-plaza-san-francisco`**, name
"Union Square", kind **`park`**. `Civic Plaza or Square` is the city's property-type string and
is not a schema kind; do not put it in the `kind` field.
Replacement summary opening: *"Union Square is a city plaza at 333 Post Street, bounded by
Geary, Powell, Post and Stockton Streets. Recreation and Park records it as a civic plaza of
2.6 acres, owned by the department."* No hours — no source states them.

**2. The Dewey Monument — the date.**
Write **1901**, the Arts Commission's `creation_date`, or write no date. **Do not write 1903.**
Replacement: *"A bronze figure on a granite column at the centre of the plaza, by Robert
Ingersoll Aitken. The Arts Commission dates it to 1901 and gives its height as 1,265 inches,
which is 105 feet 5 inches."*

**3. The Colonnade — the date is CIRCA.** The finder wrote "1999-2002". The individual accession
records say **"c.1999-2002"** and **"c. 1999-2002"**. Replacement: *"Four columns by R. M.
Fischer stand on the south side of the plaza, in stainless steel, polycarbonate and aluminium
on granite. The Arts Commission dates them to about 1999–2002 and gives two at 240 inches high
and two at 180."* Four columns is a count of ordinary things and publishes.

**4. Lotta's Fountain — the address fields.** The finder gave the Civic Art
`street_address_or_intersection` as "333 Post Street". It is **"Market Street & Kearny Street"**,
and `facility` is **"Market and Kearny St."** The Article 10 register string is **"Geary Street/
Market Street/ Kearny Street"**. Replacement: *"Lotta's Fountain stands on the sidewalk at the
north-east corner of Market and Kearny Streets, with Geary Street behind it. It is San Francisco
Landmark No. 73, designated in 1975, and was listed on the National Register of Historic Places
on 20 June 1975 as the Lotta Crabtree Fountain, reference number 75000475. The Arts Commission
records it as cast iron, bronze and glass, 226 inches high, a gift to the city from Lotta
Crabtree in 1875."*

**5. The Powell & Market turntable — DO NOT RESTATE THE SFMTA SENTENCE.**
I checked the shipped corpus. `fishermans-wharf.json`'s two turntable places carry the
advance-purchase fact in **near-identical wording to each other**, and `nob-hill.json` carries
it **three more times**. A sixth restatement is boilerplate, and the finder was right to warn.
Replacement: *"The Powell-Hyde and Powell-Mason cable car lines both begin at Powell and Market
Streets, where the cars are turned by hand on a turntable. Fares at this stop must be bought
before boarding between 8am and 8pm. The cable cars were listed on the National Register of
Historic Places on 15 October 1966, reference number 66000233, and are a National Historic
Landmark; the San Francisco Cable Car Historic District carries a period of significance
beginning in 1873."*
**DROP "named a National Historic Landmark in 1964"** — SFMTA's word, no identifier, and it
conflicts with the NPS certification date. **DROP "Invented here 150 years ago"** — a duration
claim from an operator.

**6. The Curran — no designation, and no calendar.**
Three independent checks are now silent: absent from all 370 Article 10 rows by name and
address, absent from NPS layer 0, absent from NPS layer 1. The finder asked for one more check
before shipping; it has been made. **Write no NRHP claim and no landmark number for the Curran.**
Replacement: *"The Curran Theatre is at 445 Geary Street. SF Planning records the building as
built in 1922. It is programmed by BroadwaySF."* **DROP the 2026 show dates** — a live calendar
is not a durable fact for a guide.

**7. The Toni Rembe Theater — two venues, not three, and a sequence worth keeping.**
A.C.T.'s venues page today lists **two** venues: The Toni Rembe Theater at 415 Geary Street and
The Strand Theater at 1127 Market Street. The finder's "30 Grant Studio" is not on the page
now; do not write a third venue. The sequence publishes and is not a superlative:
*"The building was listed on the National Register of Historic Places on 27 May 1975 as the
Geary Theatre, reference number 75000472, and San Francisco designated it Landmark No. 82 the
following year, in 1976."*

**8. The Westin St. Francis — no designation sentence at all.**
Re-verified: no Article 10 row, no NRHP record. Its only status was Article 11, which §2A
forbids. Replacement: *"The Westin St. Francis is at 335 Powell Street, facing Union Square. SF
Planning records the building as built in 1904. The Clock Bar is one of its ground-floor bars,
and a Victoria's Secret and a FedEx Office take addresses in the building."* No room count, no
architect — the operator's site is unreachable.

**9. Beacon Grand — the Starlite Room has a better source than the operator.**
The city's business records place the **Starlite Room on floor 21** of 450 Powell Street, and a
Beacon Lounge on the mezzanine — independent of the hotel's own "atop the hotel". Replacement:
*"Beacon Grand is at 450 Powell Street, in a building SF Planning records as built in 1930. The
hotel traded as the Sir Francis Drake until 2021, and the city's business records show the
Beacon Grand name from 4 March 2022. Its Starlite Room bar is on the twenty-first floor."*
**DROP** "curated curiosities", the Scott Baird cocktail credit and the Beefeater doormen.

**10. The Clift — the identity publishes, the year does not.**
Replacement: *"The Clift Royal Sonesta San Francisco is at 495 Geary Street. Its bars and dining
rooms include the Redwood Room, Fredericks and The Living Room."* The finder named only the
Redwood Room; **Fredericks and The Living Room are also on the page**. **DROP the 1915
construction claim** — uncorroborated operator history, and DataSF has no parcel row for 495
Geary.

**11. Marines' Memorial — the address is not from the operator.**
The homepage carries **no street address**; the finder attributed 609 Sutter Street to it. The
address comes from the city's business records. Replacement: *"Marines' Memorial Club & Hotel is
at 609 Sutter Street. It has 138 guest rooms and suites, a rooftop restaurant called Chesty's
Bar & Grill, and the 564-seat Marines' Memorial Theatre. Membership is open to former and
serving members of all branches of the United States Armed Forces, and non-members may use the
dining rooms, the theatre and the hotel as guests."* 138 and 564 are counts of ordinary things
and publish. **DROP "Since 1946"** and **"legendary"**.

**12. The Mechanics' Institute — write only the hours the site actually maps.**
The site gives Monday–Friday with two different closing times and does not, on today's fetch,
say which days run to 8pm. Write what is unambiguous: *"The Mechanics' Institute is at 57 Post
Street. Its library opens Monday to Friday from 10am, Saturday 10am to 5pm, and closes on
Sunday. Its chess room opens Monday to Friday from 8.15am and Saturday 9.30am to 5.30pm, and
closes on Sunday. The building is San Francisco Landmark No. 134, designated in 1981."*
**DROP "Since 1854"** and **"one of the oldest institutions on the West Coast"**. Beaux Arts is
the institution's own description of its building and may be attributed to it.

**13. 1 Grant Avenue — do not reproduce the register's mangled name.**
The register string is `Savings Union Branch Of\nSec.Pac.Natl Bnk`, with a line break and two
crushed abbreviations. Name the place *"Savings Union Bank branch, 1 Grant Avenue"* and cite
*"San Francisco Landmark No. 132, designated in 1981."*

**14. Hunter-Dulin Building — the register uses a double hyphen for an en dash.**
Write **"Hunter-Dulin Building"**, and *"listed on the National Register of Historic Places on
17 April 1997, reference number 97000348."* A real find the roster brief did not name.

**15. The City of Paris Building — two facts, never joined.**
Replacement: *"The City of Paris Building at 181–199 Geary Street was listed on the National
Register of Historic Places on 23 January 1975, reference number 75000471."* Write nothing
about what survives, nothing about the rotunda's fabric, and **never write that Neiman Marcus
is on the National Register.** The finder's third least-confident finding is upheld in full.

**16. Neiman Marcus — address and trading names only.**
Replacement: *"Neiman Marcus takes addresses at 150 Stockton Street and 199 Geary Street. Prada,
Chanel and Celine also trade in the building."* Celine (from 1 August 2020) is live and the
finder missed it. **Write no closure claim and no continuity claim** — the finder's instruction
is right and I uphold it.

**17. Macy's — the finder's registry detail does not survive re-fetching. Rewrite from scratch.**
There is **no row named "Macy's"** at 170 O'Farrell Street. The finder's "Macy's (2020-05-29)",
"Macy's Wine Bar (2023-06-22)" and "Macy's Starbucks (2020-05-29)" are not in the data. What is
live: **"Wine Bar"** and **"Macy's Starbucks Nitro Bike"** (both 2020-05-29), "Macy's Backstage,
Inc.", "Macy's Corporate Services, LLC", "Macys.Com, LLC", Lenscrafters, Bluemercury, Jamba
Juice, Subway, Godiva, Mixed Greens. **"Macys West" ended 2020-12-30, not 2021-09-01.**
Replacement: *"Macy's Union Square is at 170 O'Farrell Street, with a Geary Street frontage at
251 Geary. A Cheesecake Factory has traded at 251 Geary since November 1999."*

**18. August Hall — the registry is richer than the Alliance and is reachable.**
Replacement: *"August Hall is at 420 Mason Street, with a kitchen called Fifth Arrow and Gold
Leaf Catering in the same building. The venue occupies the premises that traded as Ruby Skye
until 2017."* **DROP** the bars, rooms and bowling lanes — Alliance-only.

**19. The Golden Triangle Light Standards — paraphrase the register's broken boundary text.**
The register address really is *"Along the streets bounded by Market, and Sutter Streets"*,
comma and all. Do not quote it as though it parses. Replacement: *"The Golden Triangle Light
Standards are the cast street light standards of the retail blocks between Market and Sutter
Streets. They are San Francisco Landmark No. 233, designated in 2003."* This is a genuinely
good Union Square subject, nobody else can claim it, and it is the strongest thing in the zone
that the roster brief did not name.

---

## 7. PUBLISH — 41

### 7.1 The square and its furniture — 4
Union Square plaza (§6.1) · the Dewey Monument (§6.2) · the Union Square Colonnade (§6.3) ·
the Powell & Market cable car turntable (§6.5). The **Union Square Garage** publishes as a line
inside the plaza entry, not as a place — the schema has no `parking` kind, and its hours are
confirmed verbatim: *"Monday - Sunday: 5:00am - 11:00pm"*, 333 Post Street, 415.765.9069, run
by LAZ Parking since January 2018. **DROP** its 1942 opening, Pflueger, and every "first
underground garage" formulation.

### 7.2 Maiden Lane — 3
**Maiden Lane** as a `walk`, between Stockton and Kearny Streets, with the parcel construction
years from `3tsw-4idn` (16 built 1906, 34–40 and 50–58 and 60 in 1908, 69 in 1920, 134 in 1910,
140 in 1909, 170 in 1909, 177 in 1907, 118–120 in 2001). *"Between Stockton and Kearny Streets"*
is a named-street fact and publishes; **no trip durations, no "one street over".**

**The V. C. Morris Building, 140 Maiden Lane** — *"San Francisco Landmark No. 72, designated in
1975."* SF Planning records the shell as built in 1909. **Write the building, not a tenant.**
The finder's first least-confident finding is upheld and strengthened: I re-verified Xanadu
Gallery LLC ending 2015-08-21, and found **three further tenancies the finder missed** — Tenzing
Asian Art (2009–2015), Goop Inc (Apr–Dec 2016) and Panerai North America (Sep–Nov 2021) — with
Isaia Corp live from 2017. The churn is real. **Name no gallery.**

**134 Maiden Lane** — thin, publishes as an address with Maison Margiela in the building.

### 7.3 Hotels — 3
The Westin St. Francis (§6.8) · Beacon Grand (§6.9) · the Clift Royal Sonesta (§6.10, ESCALATED
§5A) · Marines' Memorial Club & Hotel (§6.11, ESCALATED §5H) · Chancellor Hotel, 433 Powell
Street, SF Planning records it as built in 1914 — **and do not read its 1968-10-01 business
record as an opening date; see §8.6.**

### 7.4 Theatres — 3
The Toni Rembe Theater (§6.7) · the Curran (§6.6) · the Marines' Memorial Theatre, 564 seats,
as a line inside the club entry rather than a place of its own · August Hall (§6.18).

### 7.5 The landmarked fabric — 14
Each publishes as *"San Francisco Landmark No. N, designated in YYYY"* or *"listed on the
National Register of Historic Places on DATE, reference number NNNNNNNN"*, with the year SF
Planning records for the building and **nothing else**:

Hallidie Building, 130–150 Sutter Street — **LM 37 (1971)** and **NRHP 71000185, 19 November
1971**; built 1917 · Hammersmith Building, 303 Sutter Street — **LM 117 (1980)**; built 1907;
**no live tenant, confirmed — assert none** · Four Fifty Sutter Building — **NRHP 09001118,
22 December 2009**; built 1929 · Mechanics' Institute, 57 Post Street — **LM 134 (1981)**
(§6.12, ESCALATED §5D) · James Flood Building, 870–898 Market Street — **LM 154 (1982)**; slug
**`james-flood-building-union-square`**, which cannot be confused with Nob Hill's
`flood-mansion-pacific-union-club-nob-hill` (ESCALATED §5B) · Phelan Building, 760–784 Market
Street — **LM 156 (1982)** (§5B) · Chronicle Building, 690 Market Street — **LM 243 (2007)**;
**write the number, not a year** — the parcel's 2007 is the conversion (§5B) · Wells Fargo Union
Trust Branch, 744 Market Street — **LM 131 (1981)**; built 1910 (§5B) · Mutual Savings Bank
Building, 700 Market Street — **NRHP 13001107, 22 January 2014** (§5B) · Savings Union Bank
branch, 1 Grant Avenue — **LM 132 (1981)** (§6.13, §5B) · Home Telephone Company Building,
333 Grant Avenue — **LM 141 (1981)**; **write the register's address, 333 Grant Avenue**, since
that is what carries the number, not DataSF's 327 · Samuel's Clock, 856 Market Street —
**LM 77 (1975)** (§5B) · the Golden Triangle Light Standards — **LM 233 (2003)** (§6.19) ·
First Congregational Church, 432 Mason Street — **LM 177 (1985)**; built 1913; no hours, and
**do not assert service times** (§5K) · Hunter-Dulin Building, 111 Sutter Street — **NRHP
97000348** (§6.14) · City of Paris Building — **NRHP 75000471** (§6.15) · Metropolitan Club,
640 Sutter Street — **NRHP 04000955, 10 September 2004** (ESCALATED §5I).

### 7.6 Shops — 6
Britex Fabrics — the zone's best entry, and everything in it re-verified verbatim:
*"Britex Fabrics is at 117 Post Street. It opens Monday to Friday 11am to 4pm, and on the first
Saturday of each month 11am to 4pm. Its button wall carries 75,000 styles."* Phone
(415) 392-2910. **DROP** the seven decades, the 1952 move and the "one of a kind" line.

Apple Union Square — *"Apple Union Square is at 300 Post Street. It opens 10am to 8pm Monday to
Saturday and 11am to 7pm on Sunday."* Confirmed verbatim today. The city's business records show
the store's predecessor at One Stockton Street closing and this address opening **on the same
day, 21 May 2016** — a clean relocation, and the finder is right that it is citable. Phrase it
without the word *registered* (§2B).

Gump's, 250 Post Street — no hours on the site; merchandise only; Hoogasian Flowers and Zara
also trade in the building · Tiffany & Co, 350 Post Street · Neiman Marcus (§6.16) · Macy's
(§6.17).

### 7.7 Food — 3
Sears Fine Food — *"Sears Fine Food is at 439 Powell Street. It opens every day, 7am to 3pm and
5pm to 9pm. Its Swedish pancakes are served eighteen to an order."* (ESCALATED §5H.)

John's Grill — *"John's Grill is at 63 Ellis Street and has live jazz nightly."* SF Planning
records the building as built in 1910. **DROP** "Since 1908", the "iconic" line, and Hammett —
confirmed absent from the site.

Morton's The Steakhouse, 400 Post Street; SF Planning records the building as built in 1909.
Alexander's Steakhouse (165 O'Farrell) and Kin Khao (55 Cyril Magnin) publish as name and
address only, with the Alliance's phone numbers and descriptions dropped.

### 7.8 Transit — 2
Sutter–Stockton Garage, 444 Stockton Street, **"Always open"**, with bike parking ·
Ellis–O'Farrell Garage, 123 O'Farrell Street, **"Monday - Sunday, 6:00 am - 10:00 pm"**, with
bike parking. Both re-verified verbatim from SFMTA today.

### 7.9 Districts — 1
**The San Francisco Cable Car Historic District** — `m22e-6hkz` re-verified: National Register
**Listed**, California Register **Listed**, period of significance **1873**. Use it with the
turntable. It is the only district touching this zone that no shipped file already owns.

---

## 8. WHAT THE FINDER GOT WRONG

The finder is unusually good — its collision check, its LM-0 trap, its refusal to write Wright
without a citation, and all three of its least-confident findings survived scrutiny. Eight
things did not.

**1. John's Grill — the registry contradiction does not exist.** The finder reported
`Johns Grill` ending 2012-01-01 and built an evidentiary rule on the clash with the live site:
*"A business-registry end date is NOT proof of closure… Treat the operator's live site as
authority for status and the registry as authority only for a start or a name change. This is
the general rule for §5.6 and §5.7."* Re-fetching 63 Ellis Street returns **four** rows, not
one: `Johns Grill` 1974-04-01 → 2012-01-01, **`John's Grill Inc` 2012-01-01 → live**, and
**`John's Grill - On Ellis` 2025-09-18 → live**. The entity re-registered **on the same day it
closed**, exactly like Apple's Stockton-to-Post handoff that the finder itself identified as
clean. The rule is still good practice; **its worked example is false and must not be repeated
in any later zone's research.** The finder queried one name and generalised from it.

**2. Macy's — several registry rows are misquoted.** No row named "Macy's" exists at 170
O'Farrell. "Macy's Wine Bar (2023-06-22)" is **"Wine Bar" (2020-05-29)**; "Macy's Starbucks" is
**"Macy's Starbucks Nitro Bike"**; "Macys West" ended **2020-12-30**, not 2021-09-01. See §6.17.

**3. The Hobart Building is already SoMa's.** `soma.json` owns `soma-hobart-building`. The
finder's collision table ran a `market street` needle, caught 735 Market and the Hayes Valley
masonry district, and still missed this one. LM 162 and NRHP 100006911 are both real and both
unavailable.

**4. The Lower Nob Hill Apartment Hotel Historic District is already Nob Hill's.** `nob-hill.json`
publishes NRHP **91000957**, the 31 July 1991 listing date and the full street extent in shipped
prose. The finder listed it in §4c as merely "straddling §3D".

**5. The Union Square Alliance cannot be fetched at all.** The finder recorded that it "resolves
in Python but fails WebFetch certificate verification". Today it fails **both**: strict TLS
returns `CERTIFICATE_VERIFY_FAILED`, and bypassing the certificate returns **403**. Twenty-five
candidates rested on it alone and are dropped, and five more lose everything the Alliance said
about them. This is the single largest correction in this adjudication.

**6. `1968-10-01` is the business registry's bulk-load date, not a start date.** It appears on
Britex at both addresses, on Hoogasian Flowers, on `Tiffany And Company`, on the
`439-441 Powell Bldg` and `117-119 Post St Bldg` holding entities, and on the Chancellor Hotel.
The finder treated it as meaningful for Tiffany (*"ran 1968-10-01 to 2017-01-31"*) and for the
Chancellor (*"start 1968-10-01"*). **It establishes nothing about when a business opened.**

**7. Small factual slips, all confirmed against the live sources.** The Colonnade's date is
**"c. 1999-2002"**, not "1999-2002" — it is circa. Lotta's Fountain's Civic Art address fields
are **"Market Street & Kearny Street"** and **"Market and Kearny St."**, not "333 Post Street".
The Marines' Memorial homepage carries **no street address**. The Clift names **Fredericks and
The Living Room** as well as the Redwood Room. A.C.T.'s venues page today lists **two** venues,
not three. The NRHP name is *"Engine Co. **Number** 2"*, not "No. 2".

**8. The two gate mechanics in §2.** Article 11 is not an accepted citation under
`@designation_citation`, so the finder's request that "someone fetch the Article 11 appendix" is
moot — a named district still would not pass. And `@designation_claim` fires on the word
**"registered"**, which the finder used freely and which will fail the build in a zone that
leans on the business registry as heavily as this one does.

---

## 9. STANDING INSTRUCTIONS TO THE AUTHOR

1. **Do not count the landmarks.** The finder's own GUIDE justification is a tally. Name the
   buildings, cite their numbers, never say how many there are. The register stands at LM 335
   today and gains rows.
2. **Never write "Article 11".** §2A. It fails the build.
3. **Never write "registered", "registration" or "the registry lists".** §2B. It fails the build.
4. **Emit `"photos": []` everywhere**, and say nothing about why. The Dewey Monument, the
   Colonnade, Lotta's Fountain and Samuel's Clock are all designed objects rather than
   buildings — describe them physically and stop. Do not explain the reasoning; that is now a
   regex.
5. **No trip durations, no orientation by impression.** "Between Stockton and Kearny Streets" and
   "at the corner of Market and Kearny" are named-street facts and publish. "One street over
   from Union Square" does not.
6. **Vary the cable car wording.** Five restatements of the SFMTA advance-purchase sentence are
   already shipped across two files. §6.5 gives replacement wording.
7. **Slugs:** `union-square-plaza-san-francisco` (never `union-square-park`) and
   `james-flood-building-union-square` (never anything confusable with the Flood Mansion).
   The destination string **`Union Square San Francisco, California`** is load-bearing and
   correct — I verified it against the roster and against
   `derive_destination_slug/1`'s first-comma-segment rule. Do not "clean it up".
8. **The single highest-value unopened source remains the Article 10 designation documents**
   (`designationdocument.url` in `97yj-54sx`). Wright, Polk, Pflueger, Burnham & Root and every
   construction date this adjudication dropped are in those PDFs. Opening them would convert
   eight drops into publishes.
