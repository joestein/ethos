# Hayes Valley, San Francisco — VERIFIER verdicts

Adjudication of `docs/san-francisco/hayes-valley-finder.md`. Verification date **2026-09-03**.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is PUBLISH,
REWRITE or DROP with a reason. REWRITE rows carry exact replacement wording; the author uses it
verbatim.

**Ledger: 88 PUBLISH · 13 REWRITE · 18 DROP · 9 ESCALATED.**
**Tier: GUIDE**, on **34** surviving places (48 if every straddler lands here). Conditional —
see §10, which sets out the one arbitration outcome that drops it to TOWN-PAGE.
**Designation identifiers: 22 claimed, 22 survived re-fetching.** Every number, name, address,
year, appendix letter and listing date is exact. This is the finder's strongest work.

---

## 0. What I re-fetched

Every designation identifier the finder claims, plus seven of the sources it leaned on hardest.
All fetched live today.

| Source | Result |
|---|---|
| DataSF `97yj-54sx`, the 13 Article 10 numbers + LM 21, by `$where=landmarkno in(...)` | **14/14 confirmed**, names/addresses/years exact |
| DataSF `97yj-54sx`, **full 370-row sweep + point-in-polygon** against the Hayes Valley boundary | **finder's 13 are complete** — no landmark missed, one trap found (§9.4) |
| DataSF `knm6-5ej6` landmark districts | **3/3 confirmed** — Alamo Square E 1984-07-06, Market Street Masonry M 2013-05-17, Civic Center J 1994-12-23 |
| NPS NRHP MapServer, layers 0 and 1 | **6/6 reference numbers confirmed**; field is `NRIS_Refnum`, not `REFNUM` |
| DataSF `3mea-di5p` EAS, **49 addresses re-queried one by one** | **49/49 confirmed**, including two the finder said had failed |
| DataSF `gtr9-ntp6` Rec & Park | **6/6 acreages confirmed to four decimals**; official name of one park is wrong (§2.1) |
| DataSF `4yr8-u35c` historic districts | Hayes Valley Residential HD: `cr=Listed`, `nr=Eligible`, `a10=No` — **the finder's trap warning is exactly right** |
| `sfwarmemorial.org/history/` + homepage | HTTP 200 — every date, seat count and name confirmed; **two superlatives the finder did not flag** (§3.9, §3.10) |
| `sfjazz.org/visit/` and `/visit/directions/` | HTTP 200 on retry — address, corner, neighborhood, box office hours all confirmed verbatim |
| `proxysf.net` | HTTP 200 — address, corner, programme confirmed; one claim on the page is **not** on the page (§5.2) |
| `cityarts.net/theater/`, `/about/`, `/rental-info/` | HTTP 200 — **the finder has this venue's name wrong** (§6.2) |
| `sfcm.edu` | HTTP 200 — 50 Oak Street confirmed from the institution's own site |
| Recursive scan of `priv/seed_data/**/*.json` + `oracle_park_places.ex` | **3,921 places in 333 files. The finder's tooling-defect report is correct.** No candidate collides. |

---

## 1. DESIGNATION IDENTIFIERS — 22 claimed, 22 survived

I re-queried every number against its own register rather than reading the finder's table. All
**PUBLISH**. A wrong landmark number is worse than none, so this section is exhaustive.

### 1.1 Article 10 landmarks (`97yj-54sx`) — 13/13 PUBLISH

| No. | Register name (verbatim) | Register address (verbatim) | Year |
|---|---|---|---|
| 47 | Nightingale House | 201 Buchanan Street | 1972 |
| 48 | Dietle Residence | 294 Page Street | 1972 |
| 84 | War Memorial Complex | 401 Van Ness Avenue | 1977 |
| 89 | Firehouse Engine Co. #2, Truck #6 | 1152 Oak Street | 1977 |
| 140 | High School Of Commerce | 135 Van Ness Avenue & 170-135 Fell Street | 1981 |
| 164 | McMorry-Lagan Building | 188-198 Haight Street | 1983 |
| 182 | Theodore Green Apothecary | 500-502 Divisadero Street | 1986 |
| 223 | Carmel Fallon Building | 1800-1806 Market Street | 1998 |
| 256 | Richardson Hall | 55 Laguna Street | 2007 |
| 257 | Woods Hall | 101 Webster Street | 2007 |
| 258 | Woods Hall Annex | 218 Buchanan Street | 2007 |
| 268 | R.(Rube) L. Goldberg Building | 182-198 Gough Street | 2015 |
| 316 | Sacred Heart Parish Complex | 660 Oak / 735 Fell / 546-548 + 554 Fillmore (4 parcels) | 2024 |

Citation form the author uses: **"San Francisco Landmark No. 84, designated in 1977."** That
satisfies the gate and is true.

Two register-name corrections, both REWRITE:
- **REWRITE.** LM 268 is **"R. (Rube) L. Goldberg Building"** — the finder's rendering is right;
  the register's own string has no space after the initial. Use the finder's spacing.
- **REWRITE.** LM 316 covers **four** parcels, not three. The finder wrote "546-554 Fillmore";
  the register carries `546-548 FILLMORE ST` and `554 FILLMORE ST` as separate rows. Write
  **"546-548 and 554 Fillmore Street, 735 Fell Street and 660 Oak Street."**

### 1.2 Article 10 landmark districts (`knm6-5ej6`) — 3/3 PUBLISH

| District | Appendix | Listed | Falls in |
|---|---|---|---|
| Alamo Square | E | 1984-07-06 | Hayes Valley (ESCALATED, §8.1) |
| Market Street Masonry | M | 2013-05-17 | straddles Hayes Valley / Mission (ESCALATED, §8.7) |
| Civic Center | J | 1994-12-23 | Tenderloin — not Hayes Valley's |

Citation form: **"Designated under Article 10 of the Planning Code as the Alamo Square Historic
District, Appendix E, listed on 6 July 1984."**

### 1.3 National Register (NPS) — 6/6 PUBLISH

| Ref. no. | Register name (verbatim) | Address | Listed |
|---|---|---|---|
| 83003594 | Warren, Russell, House | 465-467 Oak St. and 368 Lily St. | 12 Dec 1983 |
| 85002195 | House at 584 Page Street | 584 Page St. | 12 Sep 1985 |
| 88000026 | US Mint | 155 Hermann St. | 18 Feb 1988 |
| 07001391 | San Francisco State Teacher's College | 55 Laguna St. | 7 Jan 2008 |
| 100001665 | Sacred Heart Parish Complex | 546 and 554 Fillmore, 735 Fell & 660 Oak | 28 Sep 2017 |
| 78000757 | San Francisco Civic Center Historic District | roughly bounded by Golden Gate Ave. | 10 Oct 1978 |

`78000757` carries `Is_NHL = X` in the NPS attribute table — the finder's National Historic
Landmark claim is **confirmed**. It is Tenderloin's, not Hayes Valley's.

- **REWRITE.** The register spells 83003594 **"Warren, Russell, House"** (inverted-name form).
  Write the place as **"Russell Warren House"** and cite the number; do not quote the register's
  inverted string as the name.
- **PUBLISH.** The finder's listing years were absent; the dates above are now sourced and the
  author may use them.

### 1.4 Arithmetic correction

- **REWRITE.** The finder totals "22 designation identifiers, of which **19** attach to places
  inside Hayes Valley." It is **20**: 13 landmarks + 2 districts (Alamo Square, Market Street
  Masonry) + 5 NRHP references. Off by one.

---

## 2. PARKS — 6 acreages, 6 confirmed

Every figure matches `gtr9-ntp6` to four decimal places. All ownership is Recreation & Park.

| Park | Address | Acres (register) | Type | Ruling |
|---|---|---|---|---|
| Patricia's Green in Hayes Valley | 489 Hayes St | 0.47891084 | Neighborhood Park or Playground | REWRITE §2.1 |
| Hayes Valley Playground | 689 Hayes St | 0.75325012 | Neighborhood Park or Playground | PUBLISH |
| Koshland Park | 363 Page St | 0.96157746 | Neighborhood Park or Playground | PUBLISH |
| Page & Laguna Mini Park | 281 Page St | 0.17920747 | Mini Park | PUBLISH |
| Page Street Community Garden | 438 Page St | 0.08966064 | Community Garden | PUBLISH |
| Alamo Square | 1081 Fulton St | 13.64929367 | Neighborhood Park or Playground | ESCALATED §8.1 |

**2.1 REWRITE — the park's official name.** The finder calls it "Patricia's Green". Rec & Park's
`property_name` is **"Patricia's Green in Hayes Valley"**. Use the official name once, then the
short form. Exact opening wording:

> Patricia's Green in Hayes Valley is a Recreation & Park property of 0.48 acres at 489 Hayes
> Street, on the block of Octavia Boulevard between Hayes and Fell Streets.

**2.2 DROP — the Central Freeway sentence.** The finder writes that the park "occupies the block
of Octavia between Hayes and Fell **where the Central Freeway ramp stood**", sourced to
`gtr9-ntp6`. That dataset carries a name, a type, an address, an acreage and an owner. It says
nothing about a freeway. The claim may well be true and it is not sourced here. Drop it, or find
a source and bring it back. The block-of-Octavia locator survives on its own (see §2.1) because
it is the side of a named street, which the rules permit.

**2.3 PUBLISH — keep the community garden.** The finder offers to let a verifier fold or drop
Page Street Community Garden as "thin on its own". Keep it. It is a distinct Rec & Park property
with its own name, address, type and acreage, all four sourced. Thin is not the same as
unsourced, and the tier ruling in §10 counts it.

---

## 3. THE PERFORMING-ARTS COMPLEX

Every date and number below was read off `sfwarmemorial.org/history/` today. The finder
transcribed this source accurately. It also missed two superlatives sitting in it.

**3.1 PUBLISH.** Cornerstones of the Opera House and Veterans Building laid **11 November 1931**.
**3.2 PUBLISH.** Opera House **opened 15 October 1932** with Puccini's *Tosca*, conducted by
Gaetano Merola. Home of San Francisco Opera since it opened, and home of San Francisco Ballet.
**3.3 PUBLISH.** The Opera House housed the San Francisco Symphony until Davies opened in
September 1980. **3,006-seat auditorium** (the homepage's own figure).
**3.4 PUBLISH.** Veterans Building **opened 11 November 1932**. Fourth floor rebuilt as the
Wilsey Center, **opened 2015**.
**3.5 PUBLISH.** Herbst Theatre, **892 seats**, originally built as an auditorium, **refurbished
in 1978** with a grant from the Herbst Foundation. The finder's 1978 is correct and the page
states it twice.
**3.6 PUBLISH.** The Brangwyn murals depict Air, Earth, Fire and Water and were brought from the
Panama-Pacific International Exposition of 1915.
**3.7 PUBLISH.** Davies Symphony Hall **opened September 1980**, **2,739-seat auditorium**, home
of the San Francisco Symphony.
**3.8 PUBLISH.** Arthur Brown, Jr. designed both the War Memorial and City Hall, honouring Daniel
Burnham's vision for a unified Civic Center. Also PUBLISH: the centre is owned and operated by
the City and County of San Francisco.

**3.9 DROP — a superlative the finder did not flag, and the regex will not catch.** The history
page says the War Memorial "represents a major contribution to **one of the grandest civic
complexes in the United States**." That is a ranking with a comparison class. The gate's
`@superlative_patterns` will **not** fire on it: `grandest` appears in the first alternation but
the comparison-class list is `(city|neighborhood|neighbourhood|San Francisco|California|the Bay
Area|the Mission|the district)` and "the United States" is not in it; the `one of the (most|best|
finest|largest|oldest|greatest)` pattern does not include `grandest`. It would ship. Do not
write it. This is the rule biting where the regex does not.

**3.10 DROP — the TIME quotation.** The page quotes TIME calling the Opera House "**the most
attractive and practical building of its kind in the U.S.**" An attributed superlative is still a
superlative. The rule says "from any source, attributed or not."

**3.11 DROP — "within walking distance."** The War Memorial homepage says restaurants "are within
walking distance." Orientation by impression. Not reproducible.

**3.12 REWRITE — the United Nations claim, upgraded.** The finder writes "Site of the signing of
the United Nations Charter in 1945." The source is more precise and more interesting. Exact
replacement:

> Most plenary sessions of the 1945 United Nations Conference took place in the War Memorial
> Opera House, and the United Nations Charter was signed on 26 June 1945 on the stage of the
> Veterans Auditorium, now the Herbst Theatre.

**3.13 REWRITE — Zellerbach's opening year is an inference, not a quotation.** The finder writes
"Opened 1981, one year after Davies." The page says only "Louise M. Davies Symphony Hall opened
in 1980, followed one year later by the Harold L. Zellerbach Rehearsal Hall." Write what the
source says:

> The Harold L. Zellerbach Rehearsal Hall at 300 Franklin Street opened a year after Davies
> Symphony Hall.

**3.14 REWRITE — Davies is NOT covered by Landmark No. 84, and the finder's grouping invites the
error.** The finder lists the Opera House, Veterans Building, Herbst and Davies together as "the
marquee cluster" and attaches LM 84 to the first three. It never says Davies is landmarked, but
the layout makes the mistake easy. I checked the parcels in EAS:

- 301 Van Ness Ave (Opera House) → parcel **0786A001**
- 401 Van Ness Ave (Veterans Building) → parcel **0786A001**
- LM 84's APN in the register → **0786A001**
- 201 Van Ness Ave (Davies) → parcel **0810001** — a different parcel, no landmark

So Landmark No. 84 covers the Opera House and the Veterans Building, and **no Article 10 number
attaches to Davies Symphony Hall.** Binding instruction to the author:

> Landmark No. 84 covers the War Memorial Opera House and the Veterans Building on one parcel.
> Write no designation claim of any kind about Louise M. Davies Symphony Hall.

---

## 4. SFJAZZ CENTER

The finder's source 403'd on my first attempt. It answered 200 on retry with a browser
User-Agent, so I do not hold the fetch against it — but the finder should have recorded that this
host rate-limits, because the next agent will hit it.

**4.1 PUBLISH.** 201 Franklin Street, at the corner of Franklin and Fell Streets.
**4.2 PUBLISH.** The organisation's own site places it "in San Francisco's Hayes Valley
neighborhood", on two separate pages. This is the strongest self-placement evidence in the file.
**4.3 PUBLISH.** Box office hours: **Wednesday–Saturday 12:00–17:30, Sunday–Tuesday closed, also
open 90 minutes before showtime.** Verbatim from the page footer. The finder is exact.
**4.4 PUBLISH.** B-Side, a restaurant and bar, is inside the Center.
**4.5 PUBLISH.** The Center **opened in January 2013**. See §4.9 for why this survives and the
1983 date does not.

**4.6 DROP — the superlative.** "The first stand-alone structure in the country built specifically
for jazz." The finder flagged it and I uphold the flag as a formal DROP so it is on the record.
**4.7 DROP — "in the heart of San Francisco's cultural corridor."** Orientation by impression,
and the finder quoted the sentence containing it.
**4.8 DROP — "Founded in 1983 as a two-day festival by Randall Kline."** This is on
`sfjazz.org/about/`. It is an organisation's founding year from its own site: the trading-duration
form, banned outright. The finder did not propose it; I rule on it pre-emptively because it sits
one click from a source the author will open.

**4.9 The line I am drawing, and the arbitrator may move it.** The brief bans "a founding year
from its own site". Read at its widest that would also delete 1932, 1980 and 2015 from the War
Memorial, because those come from the operator's site too — and it would delete the gate's own
published specimen, *"The Ferry Building opened in 1898."* So the ban cannot mean every date. My
ruling: **a dated event in a structure's history publishes; a duration or heritage framing for an
organisation does not.** "The SFJAZZ Center opened in January 2013" publishes. "SFJAZZ was
founded in 1983" does not. "Serving San Francisco since 1932" would not. The author applies this
consistently or asks the arbitrator to restate it.

**4.10 DROP.** "Easily accessible from Muni Metro" — the operator's own promotional framing.
Name the stations if transit is wanted; do not grade the ease.

---

## 5. PROXY

**5.1 PUBLISH.** 432 Octavia Street, at the corner of Hayes and Octavia Streets. Confirmed
verbatim, twice, on `proxysf.net`. Free community events including the Proxy Spring and Fall Film
Festivals, Sunday SOUND concerts and the Hayes Valley Carnival: confirmed verbatim.

**5.2 DROP — "Built on former freeway parcels."** The finder attributes its Proxy material to
`proxysf.net`. I read that page in full. It does not say this. The source does not say what the
finder says it says. Drop it or source it.

**5.3 DROP — "a vibrant cultural hub."** The finder quotes Proxy's self-description. It is
promotional copy carrying no fact, and the sentence it comes from continues "in the heart of",
which is orientation by impression. Exact replacement wording:

> Proxy occupies 432 Octavia Street, at the corner of Hayes and Octavia. It houses small
> businesses and hosts free public events, among them the Proxy Spring and Fall Film Festivals,
> the Sunday SOUND concerts and the Hayes Valley Carnival.

---

## 6. THE VENUE THE FINDER NAMED WRONG

This is the finder's largest single error, and it turned its weakest candidate into one of the
zone's better places.

**6.1 The finder's position.** §3: "**Nourse Theater** · `theater` · 275 Hayes St". §6: "no
sourced operator, capacity, opening date or programme. I suspect it is a rentable auditorium
attached to the former high school rather than an independent venue, and if so it may be an entry
under High School of Commerce rather than a place. Unverified."

**6.2 DROP — the name.** `cityarts.net` states: "The **Sydney Goldstein Theater** (formerly the
Nourse Theater)". The venue was renamed. Shipping "Nourse Theater" as the place name ships a
former name as the current one. The place is the **Sydney Goldstein Theater**, 275 Hayes Street.

**6.3 PUBLISH — everything the finder said was missing.** From `cityarts.net/theater/` and
`/rental-info/`, all fetched at 200:

- Address **275 Hayes Street, at Franklin Street**, San Francisco, CA 94102.
- **Opened in 1926** as the auditorium for Commerce High School.
- The school **closed in 1952**; the auditorium then ran as a public performing-arts venue.
- That use **ended in 1985** and the hall was closed to the public.
- **Reopened in 2013**, restored under City Arts & Lectures.
- **1,687 seats.**
- Operated by **City Arts & Lectures**, which holds its events there.

**6.4 REWRITE — the adjacency claim is understated and slightly wrong.** The finder writes that
the theater "adjoins the former High School of Commerce (Landmark No. 140) ... the two structures
physically adjoin." They are not two structures. I queried EAS for every address on the landmark's
parcel:

- LM 140's APN in the Article 10 register → **0815001**
- EAS addresses on parcel 0815001 → **135 Van Ness Ave, 170 Fell St, 275 Hayes St** — and nothing
  else

275 Hayes Street is inside Landmark No. 140. The theater is the school's auditorium, not a
neighbour of it. Exact replacement wording:

> The Sydney Goldstein Theater at 275 Hayes Street opened in 1926 as the auditorium of Commerce
> High School and stands on the same parcel as the school building at 135 Van Ness Avenue, which
> is San Francisco Landmark No. 140, designated in 1981. Commerce High School closed in 1952. The
> hall was closed to the public in 1985 and reopened in 2013 with 1,687 seats. City Arts &
> Lectures operates it.

**6.5 DROP — the finder's own doubt.** "It may be an entry under High School of Commerce rather
than a place." Overruled. A venue with a sourced operator, capacity, opening year, closure year
and reopening year is a place.

**6.6 DROP — "a landmark venue."** `cityarts.net/rental-info/` calls it "a landmark venue located
in the heart of San Francisco's performing arts district." Both halves fail: a bare `landmark`
with no register or number trips `@designation_claim` with nothing to satisfy `@designation_
citation`, and "in the heart of" is orientation by impression. §6.4 gives the citable form.

**6.7 PUBLISH — San Francisco Conservatory of Music.** `sfcm.edu` gives "San Francisco
Conservatory of Music, 50 Oak Street, San Francisco, CA 94102". A place's own site establishes
identity and location, so the name-and-address entry the finder proposed is sound. I established
nothing further either. **REWRITE the scope note:** it carries a name, a street address and a
kind, and no opening date, architect or hours. Do not invent depth for it.

---

## 7. THE DESIGNATED HOUSES AND THE COMMERCIAL STREET

**7.1 PUBLISH — eight designated buildings as places.** Nightingale House (LM 47), Dietle
Residence (LM 48), Richardson Hall (LM 256 / NRHP 07001391), Woods Hall (LM 257), Woods Hall
Annex (LM 258), R. (Rube) L. Goldberg Building (LM 268), Russell Warren House (NRHP 83003594),
House at 584 Page Street (NRHP 85002195). All `historic-site`. Four of the eight sit on an
escalated edge (§8.8) and the arbitrator may move them.

**7.2 PUBLISH — the identity pairs, both correct.** LM 256 and NRHP 07001391 are the same
building at 55 Laguna Street under two registers. LM 316 and NRHP 100001665 are the same complex.
The author cites either or both and writes **one** place for each. The finder is right to warn.

**7.3 PUBLISH — the twelve Hayes Street addresses.** All twelve EAS lookups returned Hayes Valley:
Hayes Street Grill (320 Hayes), Absinthe Brasserie (398 Hayes), Souvla (517 Hayes), Rich Table
(199 Gough), Monsieur Benjamin (451 Gough), Robin (620 Gough), Birba (458 Grove), Suppenküche
(525 Laguna), Arlequin (384 Hayes), Miette (449 Octavia), Timbuk2 (506 Hayes), Azalea (411 Hayes).

I also checked whether the named businesses actually occupy those addresses, which EAS cannot
establish — an address database proves an address exists, not who trades at it. Confirmed on the
operators' own homepages: **Hayes Street Grill 320 Hayes, Absinthe 398 Hayes, Suppenküche 525
Laguna.** The other nine render their addresses from script the fetch does not execute; that is
not evidence of absence and I do not drop them. The author writes name, address and kind and
nothing more for all twelve, exactly as the finder proposed, and the finder is right to have
withheld founding years.

**7.4 REWRITE — the Octavia/Linden trio, and the finder's confidence note is simply false.** §6
says all three "failed EAS number matching and rest on geocoder output". They do not. I queried
EAS directly:

- **315 LINDEN ST → Hayes Valley.** Blue Bottle Coffee's address resolves cleanly.
- **432 OCTAVIA ST → Hayes Valley.** The Proxy parcel, shared by Ritual Coffee Roasters and
  Smitten Ice Cream, resolves cleanly.

Delete the low-confidence flag. All three carry an EAS-confirmed address on the same footing as
the twelve above. Blue Bottle Coffee remains a `cafe` at 315 Linden Street; Ritual and Smitten sit
on the Proxy parcel at 432 Octavia Street and the author should say so rather than implying three
separate street addresses.

**7.5 PUBLISH — the slug warning, upheld and verified.** `blue-bottle-coffee-mission-rock` is a
live Oracle Park code-seed slug. I read the seven slugs out of `lib/ethos/seeds/
oracle_park_places.ex` myself. The Linden Street location is a different place and needs a
distinct slug. None of the finder's other candidates collides with anything, by slug or by name,
across all 3,921 committed places.

---

## 8. STRADDLERS ESCALATED — 9

I rule on none of these. Each goes to the arbitrator with the evidence sharpened.

**8.1 Alamo Square and the Painted Ladies.** EAS puts 1081 Fulton St and 710 Steiner St in Hayes
Valley; Rec & Park gives 13.64929367 acres; Article 10 Appendix E, listed 6 July 1984. The roster
declined Alamo Square as a zone because "the Painted Ladies are its single draw and sit at the
edge of Hayes Valley's reach." Every mechanical test says Hayes Valley. It is also the largest
single thing in the zone by area and it changes the page's centre of gravity. **One caution the
finder did not raise: no designation identifier attaches to 710 Steiner Street itself.** The
Painted Ladies row publishes only inside the Alamo Square district citation, never as "a
landmarked row of houses."

**8.2 The Civic Center orphan.** I verified this and the finder is right. The DataSF analysis
neighborhood list has 41 entries; "Civic Center" is not one of them and "Tenderloin" is, and
Tenderloin appears in neither `zones` nor `declined` in the roster. City Hall (LM 21, 400 Van
Ness, 1970), the Asian Art Museum, the Main Library and Bill Graham Civic Auditorium all return
**Tenderloin** from EAS. They belong to no page in the programme. This is a roster gap, and the
finder was right not to claim them. The material in its §5 is sound and I confirmed LM 21, NRHP
78000757 (NHL) and NRHP 100001018.

**8.3 The War Memorial's own self-placement — stronger than the finder made it.** The finder
noted at §4.9 that Nominatim returns "Civic Center" for 401 Van Ness and called it "worth noting
only". It is worth more than that. **The institution's own website agrees with Nominatim, not
with EAS.** `sfwarmemorial.org` headlines itself "A Cornerstone of San Francisco's Historic Civic
Center District" and describes itself as "**Bordered by** the Hayes Valley neighborhood" — that
is, adjacent to Hayes Valley rather than in it. So two independent signals put the complex in
Civic Center and one (EAS, the authoritative one) puts it in Hayes Valley. This is a genuine
straddle, not a footnote, and it is the single ruling that most changes this page — see §10.

**8.4 Zuni Café, 1658 Market St.** EAS **Hayes Valley** (re-confirmed); Nominatim Mission;
operator's own site confirms 1658 Market St. Contested with SoMa and the Mission.

**8.5 US Mint (1937), 155 Hermann St, NRHP 88000026.** EAS **Hayes Valley**; vernacular Duboce
Triangle / Lower Haight. The finder's warning that this is not the Old Mint at Fifth and Mission
is correct and important — they are two distinct NRHP listings.

**8.6 Sacred Heart Parish Complex.** EAS **Hayes Valley** on all four parcels; Nominatim Lower
Haight. Carries LM 316 and NRHP 100001665.

**8.7 The Divisadero edge.** The Independent (628 Divisadero, address confirmed on its own site),
Theodore Green Apothecary (LM 182), Firehouse Engine Co. #2 (LM 89, 1152 Oak). All EAS Hayes
Valley; vernacular Alamo Square or NoPa.

**8.8 The Market Street and Laguna/Buchanan south edges.** McMorry-Lagan (LM 164), Carmel Fallon
(LM 223) and the Market Street Masonry district on one side; Nightingale House (LM 47),
Richardson Hall (LM 256), Woods Hall (LM 257), Woods Hall Annex (LM 258) on the other. All EAS
Hayes Valley; vernacular Duboce Triangle. **New evidence for the arbitrator:** DataSF `4yr8-u35c`
records the San Francisco State Teacher's College Historic District — the 55 Laguna / Webster /
Buchanan group — with `neighborhood = "Western Addition"`. That is a third name for the same
block, from the city's own survey. EAS still governs, but the arbitrator should know three
sources give three answers here.

**8.9 The Market Street Masonry district** straddles Hayes Valley and the Mission outright, by
the register's own geometry. Both are wave zones. Someone has to own the citation.

---

## 9. WHAT THE FINDER GOT WRONG

**9.1 It named the wrong venue.** "Nourse Theater" is the former name of the Sydney Goldstein
Theater. §6.

**9.2 It gave up on a place it could have sourced in one fetch.** It listed the same venue under
"WHAT I AM LEAST CONFIDENT ABOUT" with "no sourced operator, capacity, opening date or
programme," and suspected it was not a place at all. One page on `cityarts.net` carries the
operator, the capacity, the opening year, the closure year and the reopening year. §6.3.

**9.3 Two of its three low-confidence flags are false.** It reported that 315 Linden and 432
Octavia "failed EAS number matching." Both resolve cleanly to Hayes Valley. §7.4.

**9.4 It missed a trap in its own primary dataset — one that will bite every San Francisco zone.**
My point-in-polygon sweep of all 370 rows in `97yj-54sx` returned the finder's 13 landmarks and
one more: **First Baptist Church, `landmarkno = "0"`, `yeardesignated = "0.0"`, no address.**
There are **40 such rows** citywide, and they are not designated landmarks — they sit in the
Article 10 dataset as pending or under-consideration properties. The list includes Fillmore
Auditorium, the Peace Pagoda, Glide Memorial Church, Kezar Stadium, Far East Cafe, the I. Magnin
Building, the Strand Theater and Momo's 440 Club. Any finder who filters this dataset by
neighborhood instead of by number will harvest them as landmarks, and "First Baptist Church is a
designated landmark" would fail the gate for having no number — or worse, someone will invent
one. **A row with `landmarkno = 0` is not a landmark.** This belongs in the roster, not just in
this file, and it affects Japantown, Chinatown, Union Square, North Beach, Haight-Ashbury and the
Fillmore.

**9.5 It misreported a fetch failure.** §2: "I could not verify `78000751` ... The NPS asset fetch
404'd on it." It did not 404. `78000751` resolves perfectly well — to the **Independent Order of
Odd Fellows Building, 526 Market St, San Diego, California**, listed 31 January 1978. The hazard
was never a dead reference; it was a live reference to the wrong city, which is far more
dangerous, because a number that resolves looks verified. The finder reached the right conclusion
(cite `78000757`) by the wrong route. It also implies a field name it never used: the NPS layer
queries on `NRIS_Refnum`, not `REFNUM`, and a query on `REFNUM` returns zero features with no
error — silent, not loud.

**9.6 It let two superlatives through from its own marquee source.** "One of the grandest civic
complexes in the United States" and the TIME quotation. §3.9, §3.10. It correctly caught the
SFJAZZ one, which makes the misses harder to excuse — it was looking.

**9.7 It cited a source for a claim the source does not make.** Proxy "built on former freeway
parcels". §5.2.

**9.8 Arithmetic.** 20 identifiers attach inside Hayes Valley, not 19. §1.4.

**9.9 What it got right, and it is a lot.** All 22 designation identifiers, exactly. All 49 EAS
assignments, exactly. All six park acreages to four decimals. The Hayes Valley Residential
Historic District trap — `cr=Listed`, `nr=Eligible`, `a10=No` — is a genuinely excellent catch:
writing "listed on the National Register" there would have satisfied the gate's citation regex
and been false, and the finder saw that the gate checks form rather than truth. The
`taken_slugs.py` defect report is correct in every particular: the glob is Rome-only, the
recursive scan gives 3,921 places in 333 files, and the tool cannot see the Oracle Park code
seed it is meant to protect. That tool should be fixed before any wave-1 file is authored.

---

## 10. TIER RULING — GUIDE, on 34, conditional

Counted against what survives adjudication, not against what was harvested.

| | |
|---|---|
| Parks and open space | 5 |
| Performing-arts venues (Opera House, Veterans Building, Herbst, Davies, Zellerbach) | 5 |
| Other institutions (SFJAZZ, Proxy, SFCM, Sydney Goldstein Theater) | 4 |
| Designated buildings in the undisputed core (LM 48, LM 140, LM 268, NRHP 83003594, NRHP 85002195) | 5 |
| Food, drink and shops (12 Hayes/Gough/Grove/Laguna + Blue Bottle, Ritual, Smitten) | 15 |
| **Surviving writable places, undisputed core** | **34** |
| Straddlers that could land here (§8) | 14 |
| **Ceiling if the arbitrator gives Hayes Valley everything** | **48** |

**GUIDE.** Thirty-four is the same number Haight-Ashbury survived on, and that zone was ruled
TOWN-PAGE — so I owe the arbitrator a reason for departing, and headcount is not it. The reason
is composition. Haight-Ashbury's 34 were 25 shops whose single richest fact was unpublishable
plus four pavement-only sites. Hayes Valley's 34 include five performing-arts venues carrying
dated openings, seat counts, a named architect, resident companies and the signing of the United
Nations Charter; a theater with a sourced 1926-1952-1985-2013 history and a capacity; a jazz
centre with published hours; six Rec & Park properties with sourced acreages; and twenty
designation identifiers inside the neighborhood. Nineteen of the 34 carry narrative beyond a name
and a street. That is guide-shaped material.

**The condition, and the arbitrator should rule on it before the author starts.** If §8.3 goes
against Hayes Valley — if the performing-arts complex is ruled Civic Center's on the strength of
Nominatim and the institution's own self-description, against EAS — the page loses the Opera
House, the Veterans Building, Herbst, Davies and Zellerbach, and falls to **29 places**, of which
15 are commercial entries carrying only a name, an address and a kind, five are small parks and
five are houses nobody can enter. That is precisely the Haight-Ashbury shape, and on that outcome
**this ruling should fall back to TOWN-PAGE.** The tier here turns on one arbitration, and I
would rather say so than pick a number that survives either way.

Alamo Square does not change the tier in either direction. It adds area and a marquee, not depth.
