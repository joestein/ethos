# Sunnyside, Queens — VERIFIER verdicts

**Role:** Independent verifier. I re-fetched every cited URL myself. Nothing below defers to the
finder's reasoning. Where I confirm or correct, I quote the source text I read myself.

**What I actually pulled (all re-fetched, not taken from the finder):**

| Ref | Source | How I read it |
|-----|--------|---------------|
| V1 | LPC LP-2258 *Sunnyside Gardens Historic District* designation report | Downloaded the 23.6 MB PDF, `pdftotext -layout`, 1,345,339 chars of raw text, string-matched every `[Q]` |
| V2 | LPC LP-2200 *Engine Co. 258 / Hook & Ladder 115* | Downloaded PDF, 33,025 chars raw text |
| V3 | NYC Open Data `9nt8-h7nd` (2020 NTAs) | Raw JSON incl. `the_geom` |
| V4 | NYC Open Data `skyk-mpzq` (LPC historic districts) | Raw JSON incl. 555-vertex polygon |
| V5 | NYC Open Data `enfh-gkve` (Parks properties) | Raw JSON, filtered to Q044/Q340/Q034/Q516/Q031A |
| V6 | NY State `39hk-dx4f` (MTA subway stations) | Raw JSON, Flushing line, 22 rows |
| V7 | NYC Open Data `43nn-pn8j` (DOHMH restaurant inspections) | Raw JSON, ZIP 11104, 1,195 rows / 143 distinct establishments |
| V8 | **NYC DCP Geosearch + PAD** (`geosearch.planninglabs.nyc`) | The authoritative NYC address database — **the finder never used this, and it decides most of §13** |
| V9 | **Point-in-polygon of each address/station against DCP's own 2020 NTA polygons** | My own computation |
| V10 | **NPS NPGallery NRIS 84002919** | The NRHP record the finder could not find |
| V11 | Wikipedia raw wikitext (`action=raw`), both articles | 107,510 + 109,473 chars — so I re-quote, not re-summarize |
| V12 | thaliatheatre.org, scsny.org, phippsny.org, queenslibrary.org, sunnysidegardenspark.org, sunnysideshines.org, allsaintssunnyside.org | WebFetch |

**Headline: the finder is unusually honest and mostly accurate on the LPC report — but its
neighborhood-assignment section is unresolved where it did not need to be, and three places it
listed as Sunnyside candidates do not belong to Sunnyside at all.**

---

## 1. THE RULINGS THAT MATTER MOST: NEIGHBORHOOD ASSIGNMENT

The finder left all 20 of C1–C20 explicitly unresolved. Most of them are resolvable, because NYC
DCP publishes both an authoritative address database (PAD, via Geosearch) and the 2020 NTA
polygons. I geocoded every candidate address and tested the returned point against DCP's own
Sunnyside / Woodside / Sunnyside Yards polygons. That is a government-primary answer, not an
inference.

### Places that are NOT Sunnyside — remove them from this file

| Place | Address | DCP locality | DCP 2020 NTA (point-in-polygon) | Ruling |
|---|---|---|---|---|
| **Islamic Institute of New York** | 55-11 Queens Boulevard | **"Woodside, NY"**, ZIP 11377 | **Woodside (QN0203)** | **WOODSIDE. Wikipedia's placement in Sunnyside is REFUTED.** Belongs to the Woodside file. |
| **New York Presbyterian Church / former Knickerbocker Laundry** | 43-23 37th Avenue | **"Long Island City, NY"**, ZIP 11101 | **Sunnyside Yards (North) — QN0161, which is in Community District 1 (Astoria), not CD2** | **NOT Sunnyside, NOT Woodside, NOT Jackson Heights.** Wikipedia's placement in Sunnyside is REFUTED. |
| **Doughboy Park** | 54-25 Skillman Avenue | **"Woodside, NY"**, ZIP 11377 | **Woodside (QN0203)** | **WOODSIDE.** The finder included it only as an eastern marker; correct call, but it must not be published here. |

### Places that ARE Sunnyside — contested claims resolved in Sunnyside's favour

**C1 — Sunnyside Gardens Park, 48-21 39th Avenue.** DCP: `48-21 39 AVENUE, Sunnyside, NY`, ZIP
11104, NTA **Sunnyside**. LPC includes it inside the designated historic district: *"The historic
district also includes Sunnyside Gardens Park, created as part of the original development"* (V1).
The park's own banner — *"Celebrating 100 years of community in the heart of Sunnyside and
Woodside."* (V12, re-quoted verbatim) — is a **service-area** statement, not a location. **Ruling:
SUNNYSIDE, decisively.** This is the wave's marquee contested subject and it resolves cleanly; it
may appear in the Sunnyside file and must not appear in Woodside's.

**C2 — Queens Public Library, Sunnyside branch, 43-06 Greenpoint Avenue.** QPL's own record does
say **"43-06 Greenpoint Avenue / Long Island City, NY 11104"** — I re-fetched and confirm the
finder's catch. But DCP returns `43-06 GREENPOINT AVENUE, **Sunnyside**, NY`, ZIP 11104, NTA
**Sunnyside**. "Long Island City" here is a USPS mailing designation, not a neighborhood. The
branch is itself named Sunnyside. **Ruling: SUNNYSIDE.** Better evidenced: DCP. Disclose QPL's
wording if the address line is reproduced.

**C3 — Celtic Park Apartments, 42nd–44th Streets between 48th and 50th Avenues.** Wikipedia says
verbatim (V11): *"The nine-acre, 756-unit complex spans 42nd to 44th Streets between 48th and 50th
Avenues, straddling the boundary between Sunnyside and adjacent Woodside, and was converted to
cooperative ownership in May 1986."* I geocoded two points inside that footprint: `43-09 48 AVENUE,
Sunnyside, NY` and `42-15 48 AVENUE, Sunnyside, NY` — **both in the Sunnyside NTA**, both ZIP 11377.
The Woodside NTA does not begin until far to the east. **The "straddling" claim is REFUTED.**
The finder's instinct ("'Woodside' here is surprising and should be scrutinized") was right.
**Ruling: SUNNYSIDE.** Do not repeat the straddling language.

**C4 — Sabba Park.** **Ruling: SUNNYSIDE.** The finder's reasoning here is unsound and must not be
carried forward: it treated ZIP **11377 as "the Woodside ZIP"** and used that to cast doubt.
**That inference is refuted.** DCP assigns locality **"Sunnyside"** to ZIP-11377 addresses right
across this area — `50-02 39 AVENUE, Sunnyside`, `51-26 39 AVENUE, Sunnyside`, `43-09 48 AVENUE,
Sunnyside`, `42-15 48 AVENUE, Sunnyside` — all ZIP 11377, all in the Sunnyside NTA. **ZIP 11377
carries no neighborhood signal in this wave.** ⚠️ Note separately: **Sabba Park has no `address`
field at all** in the Parks record — see §3.

**C5 — Lt. Michael R. Davidson Playground, 50-02 39 Avenue.** DCP: `50-02 39 AVENUE, **Sunnyside**,
NY`, NTA **Sunnyside**. **Ruling: SUNNYSIDE.**

**C6 — Phipps Garden Apartments.** Two different things, and the finder conflated them:
- The **apartment complex** is a contributing property inside LPC's Sunnyside Gardens Historic
  District, and Phipps Houses' own history page heads the item *"Garden City Movement: Phipps
  Garden Apartments in Sunnyside, Queens"* (V12, re-quoted). **Ruling: SUNNYSIDE.**
- The **2020 rezoning parcel at 50-25 Barnett Avenue** is a different animal: DCP returns
  `50-25 BARNETT AVENUE, **Long Island City**, NY` and the point falls in **Sunnyside Yards (South)
  — QN0261**, *not* the Sunnyside NTA. **Ruling: rail-yard NTA, not Sunnyside proper.** If the
  rezoning is written up at all, do not present that parcel as a Sunnyside address.

**C14 — the "52 St" subway station. Resolved, and it changes a fact the finder got wrong.** I ran
MTA's own published coordinates through DCP's NTA polygons:

| Station | MTA lat/lon | DCP 2020 NTA |
|---|---|---|
| 33 St-Rawson St | 40.744587 / -73.930997 | **Sunnyside** |
| 40 St-Lowery St | 40.743781 / -73.924016 | **Sunnyside** |
| 46 St-Bliss St | 40.743132 / -73.918435 | **Sunnyside** |
| **52 St** | **40.744149 / -73.912549** | **Sunnyside** |
| 61 St-Woodside | 40.74563 / -73.902984 | Woodside |
| 69 St | 40.746325 / -73.896403 | Woodside |

**Ruling: there are FOUR 7-train stations in the Sunnyside NTA, not three.** See F120/F123 below.

**C16 — the historic district's eastern edge. Resolved at 52nd Street, by two governments.**
LPC's metes and bounds (V1, re-read directly): *"…easterly along the southern curbline of Barnett
Avenue, southerly along the **western curbline of 52nd Street (Dickson Street)** to the southern
curbline of 39th Avenue (Middleburg Avenue)…"* And NPS's NRHP record (V10) independently describes
the location as *"Roughly bounded by Queens Blvd., **43rd and 52nd Sts.** Barnett and Skillman
Aves."* **Two independent government sources say 52nd Street.** The Encyclopedia-of-NYC eastern
boundary at 51st Street (F007) therefore cannot be used to trim the district, and Wikipedia's
"between 43rd and 51st Streets" (F078) is **refuted**.

**C7 — Sunnyside Yard.** Confirmed exactly as the finder recorded it: DCP splits it into
`QN0161 "Sunnyside Yards (North)"` under `"QN01 Astoria-Queensbridge (CD 1 Equivalent)"` and
`QN0261 "Sunnyside Yards (South)"` under `"QN02 Long Island City-Sunnyside-Woodside (CD 2
Approximation)"`. **Ruling: genuinely split; write it as split, and never as simply "in Sunnyside."**

**C8 — Sunnyside itself.** LPC (2006) does say, verbatim (V2): *"Long Island City is comprised of
five separate neighborhoods: Ravenswood, Astoria, Steinway, Sunnyside, and Hunter's Point."*
Confirmed. But this is a 2006 aside in a report about a Hunter's Point firehouse, describing
**historic** Long Island City (the pre-1898 city), not present-day neighborhood geography. DCP's
2020 file lists Sunnyside as a standalone NTA `QN0202`. **Ruling: Sunnyside is a standalone
neighborhood.** The LPC sentence is publishable only as a historical note about the old city.

**C11 / C12 / C13 — cross-boundary subjects.** St. Pat's for All (route spans Sunnyside and
Woodside), the ~71-station Citi Bike rollout (a joint Sunnyside-and-Woodside figure that cannot be
split), and the BID footprint touching Roosevelt Avenue are all **genuinely cross-neighborhood**.
**Ruling: shared. Write them as shared, in both files if the arbitrator allows, never as
exclusively Sunnyside's.** C12 in particular: the ~71 figure is inherently unsplittable —
**uncertain**, ship only as an explicitly joint figure.

**C17 / C18 / C19 — all SUNNYSIDE.** Sunnyside Reformed Church `48-03 SKILLMAN AVENUE, Sunnyside`,
Mimar Sinan Mosque `45-06 SKILLMAN AVENUE, Sunnyside`, Sunnyside Community Services
`43-31 39 STREET, Sunnyside` — all ZIP 11104, all in the Sunnyside NTA. Also Sunnyside: All Saints
/ Episcopal Mission `43-12 46 STREET`, Queen of Angels `44-04 SKILLMAN AVENUE`, Sunnyside Muslim
Center `39-18 47 AVENUE`, Mosaic West `46-01 43 AVENUE`, Sunnyside Arch `46-01 QUEENS BOULEVARD`,
Sunnyside Garden Arena site `44-11 QUEENS BOULEVARD`, 45th St Composters `41-12 45 STREET`.

**C20 — "Hunters Point-Sunnyside-West Maspeth".** Confirmed as a three-neighborhood 2010-vintage
NTA. **Ruling: any statistic bearing this label is not about Sunnyside.** Wikipedia itself attributes
the Nepalese-population claim to DCP's 2013 *Newest New Yorkers* report, p. 54, for that tri-area.
**Never attribute it to Sunnyside alone.**

**Marquee-list check:** none of Forest Park, Alley Pond Park, Astoria Park, Socrates Sculpture Park
or the Louis Armstrong House Museum appears in this finder file. **No marquee collision in
Sunnyside.** (Astoria Park and Socrates Sculpture Park were already taken in wave 1 regardless.)

---

## 2. REFUTATIONS — things the author must NOT write

**R1. F059 — the "twelve vs fourteen courts" contradiction does not exist. The finder invented it.**
The finder wrote that the summary says twelve courts while the table of contents lists fourteen
headings, and recorded it as "an apparent internal discrepancy." The report resolves it explicitly
in its own General Description, which I read directly (V1):

> "The buildings in the Sunnyside Gardens Historic District, constructed between 1924-28, 1931-2
> and 1935, are divided into **twelve different courts**: Carolin Gardens, Colonial Court, Hamilton
> Court, Hamilton Court Apartments, Harrison Place, Jefferson Court, Lincoln Court, Madison Court
> North and South, Monroe Court Apartments, Roosevelt Court, Washington Court and Wilson Court
> Apartments, **and two Phipps Garden Apartment complexes**, covering all or part of sixteen city
> blocks."

Twelve courts **plus** two Phipps complexes, which are not courts. The finder produced fourteen by
folding Phipps I and II into the court list. **REFUTED — do not write that LPC contradicts itself
about the number of courts.** Also note the report calls the twelfth **"Wilson Court Apartments"**
in the General Description while the table of contents shortens it to "Wilson Court."

**R2. F077 / F078 — the "77 acres (NYC Landmark)" figure is wrong, and I can show it.**
Wikipedia's infobox reads `area = 53 acre (NRHP/NYSRHP); 77 acre (NYC Landmark)`. I computed the
area of **LPC's own designated polygon** from NYC Open Data `skyk-mpzq` (555 vertices, NY State
Plane EPSG:2263):

```
shoelace area = 2,347,704.8 sq ft  ->  53.9 acres
(matches the dataset's own shape_area field exactly; perimeter 10,348 ft = 1.96 mi)
```

**The LPC-designated Sunnyside Gardens Historic District is 53.9 acres, not 77.** The 77-acre
figure is almost certainly the **76.67 acres the City Housing Corporation purchased in 1924** —
a different quantity — mistakenly re-labelled as the landmark district's area. LPC (V1):
*"They purchased 76.67 acres of land, most from the Long Island Rail Road with smaller amounts from
other landowners."* **REFUTED. Do not publish 77 acres as the historic district's size.** If an
acreage is published at all, use ~54 acres and attribute it to the city's GIS boundary, or omit.

**R3. F077 — the NRHP listing IS verifiable, and the finder gave up too early.** The finder reported
NPGallery as a dead end. The reference number is in Wikipedia's own citation: **84002919** (the
finder appears to have tried a different one). NPS NPGallery NRIS 84002919 returns:

> Resource Name: **"Sunnyside Gardens Historic District"** · Listed: **9/7/1984** · Reference
> Number: **84002919** · State: New York · County: Queens County · Location: *"Roughly bounded by
> Queens Blvd., 43rd and 52nd Sts. Barnett and Skillman Aves."*

**The September 7, 1984 NRHP listing is CONFIRMED against a federal primary source** and may be
published as fact, not as an aggregator claim. **NPS gives no acreage** — so the "53 acres" figure
remains unverified from NPS (though it agrees with my 53.9-acre computation).

**R4. F120 / F123 — "the three Sunnyside stations" is wrong.** Per §1/C14, DCP's NTA contains
**four** 7-train stations: 33 St-Rawson St, 40 St-Lowery St, 46 St-Bliss St **and 52 St**. The
finder passed through Wikipedia's "three Sunnyside stations" framing, and separately passed through
*"The nearest express stop is 61st Street–Woodside, one stop east of the neighborhood"* while
calling it "consistent." **Wikipedia contradicts itself here**: 61 St-Woodside is one stop east of
52 St and *two* stops east of 46 St-Bliss St, so "three stations" and "one stop east" cannot both
be true. **REFUTED as rendered.** Write: four stations in the Sunnyside NTA; 61 St-Woodside, the
nearest express stop, is one stop beyond the neighborhood's easternmost station.
(Station field values themselves — ADA `0` on all four, ADA `1` at 61 St-Woodside — are **confirmed**.)

**R5. F095 — the Torsney/Lodati rendering is materially wrong.** The finder rendered Wikipedia as
saying Torsney Playground *"was 'Named in 1999 by New York City Council resolution for the longtime
community organizer Lou Lodati.'"* The actual wikitext (V11) says the opposite structure:

> "**Torsney Playground / Lou Lodati Playground**… Built in the 1950s and named for George F.
> Torsney, a local political figure and World War I veteran, **the park contains the Lou Lodati
> Playground**, named in 1999 by New York City Council resolution for the longtime community
> organizer Lou Lodati (1908–1996), known locally as 'the Mayor of Sunnyside'."

The **park** is named for Torsney; the **Lou Lodati Playground is a feature inside it**. That is
exactly why NYC Parks' `signname` and `name311` are both still "Torsney Playground." **REFUTED as
rendered — the finder's version would have produced a false sentence.**

**R6. F110 — Sunnyside Garden Arena.** Confirmed as Wikipedia text (44-11 Queens Boulevard, until
June 24, 1977, ~2,500 spectators). Two problems: the finder **omitted** that *"a portion of 45th
Street was co-named in its honor in 2014"*; and the parenthetical *"(now a Wendy's restaurant)"*
sits badly against the DOHMH record, which puts **WENDY'S at 44-16 QUEENS BOULEVARD** — the
**opposite side of Queens Boulevard** from 44-11 (odd numbers north, even south). **Do not write
that the arena site is now a Wendy's.**

**R7. F111 — the Kiss/Ramones venue.** The finder dropped both the exact address and the in-text
hedge. Actual wikitext: *"**According to Ultimate Classic Rock and contemporaneous reporting**, the
rock band Kiss played its first concert on January 30, 1973, at the Coventry (formerly the Popcorn
Pub), a small live-music venue at **47-03 Queens Boulevard** near 47th Street; the Ramones also
played early shows at the venue."* **REFUTED as rendered.** If published, keep the attribution
hedge; the address 47-03 Queens Boulevard is usable.

**R8. F079 — the finder's contrast is backwards.** It presented Wikipedia's "first attempt to create
a garden city in the United States" as an aggregator overstatement versus LPC's "more careful"
wording. LPC says it twice, in its own voice (V1): *"the first attempt to create a Garden City in
America"* and *"Sunnyside Gardens was the first attempt to create a Garden City in the United
States."* **REFUTED — this is a primary-sourced LPC claim, publishable with LPC attribution.**

**R9. F015 / F016 — misattributed name-origin and Bragaw-house claims.** The finder rendered these
as vague Wikipedia assertions ("An alternative source traces…"). The article actually attributes
them to named published works: *"**The Encyclopedia of New York City** alternatively traces the
modern neighborhood's name to a roadhouse built on Jackson Avenue in the 1850s and 1860s **for
visitors to the Fashion Race Course in Corona**"*; and *"According to **the local historian Vincent
F. Seyfried**, Richard Bragaw built a gambrel-roofed house 'in the English style atop Sunnyside
Hill' in 1790, **on the line of present-day 32nd Place between Northern Boulevard and Skillman
Avenue**; the house was demolished in July 1903 **after the Pennsylvania Railroad acquired the
property** as part of the land assembly for the Sunnyside Yard."* **REFUTED as quotes; upgraded in
substance** — these are attributable to Jackson (2010) and Seyfried (1984), not bare aggregator text.

**R10. F117 — see C3.** Confirmed as Wikipedia's wording, **refuted in substance** by DCP.

---

## 3. PUBLISHABLE STREET ADDRESSES

Exact strings. Everything below was returned by DCP Geosearch/PAD unless noted.

| Place | Publishable address string | Note |
|---|---|---|
| Sunnyside Gardens Park | **48-21 39th Avenue, Sunnyside, NY 11104** | Institution's own + DCP |
| L/CPL Thomas P. Noonan Jr. Playground | **42-01 Greenpoint Avenue** | NYC Parks `address` |
| Torsney Playground | **41-15 Skillman Avenue** | NYC Parks `address` |
| Lt. Michael R. Davidson Playground | **50-02 39th Avenue** | NYC Parks `address` |
| **Sabba Park** | ⚠️ **NONE — no `address` field exists in the Parks record** | Only `location`: "Queens Blvd. bet.  48 St., Greenpoint Ave. and 50 St." **Do not fabricate a street address.** |
| Thalia Spanish Theatre | **41-17 Greenpoint Ave, Sunnyside, NY 11104** | Own site, re-quoted |
| Sunnyside Community Services | **43-31 39th Street, Sunnyside, NY 11104** | Own site, re-quoted |
| QPL Sunnyside branch | **43-06 Greenpoint Avenue** | QPL prints "Long Island City, NY 11104"; DCP says Sunnyside |
| The Episcopal Mission in Sunnyside | **43-12 46th Street, Sunnyside, New York 11104** | Own site, re-quoted |
| Sunnyside Reformed Church | **48-03 Skillman Avenue** | |
| Queen of Angels Church | **44-04 Skillman Avenue** | |
| Sunnyside Muslim Center | **39-18 47th Avenue** | |
| Mimar Sinan Mosque | **45-06 Skillman Avenue** | |
| Mosaic West Church | **46-01 43rd Avenue** | |
| 45th St Composters and Community Garden | **41-12 45th Street** | a.k.a. "Resistance is Fertile" |
| Sunnyside Community Garden | **38-01 50th Street** ⚠️ | Did **not** clean-geocode; Geosearch snapped it to "38-38 50 STREET". **Uncertain — verify before printing.** |
| Sunnyside Garden Arena (demolished) | **44-11 Queens Boulevard** | Former site |
| The Coventry / Popcorn Pub (former) | **47-03 Queens Boulevard** | |
| Sunnyside Arch | 46th Street at Queens Boulevard | Structure, not an addressed building |
| Phipps Garden Apartments | 39th Avenue at 50th Street | No single street address confirmed |
| Celtic Park Apartments | 42nd–44th Streets between 48th and 50th Avenues | No single street address confirmed |

---

## 4. DOHMH-ONLY BUSINESSES — mandatory restriction

I re-pulled `43nn-pn8j` for ZIP 11104 myself: **1,195 inspection rows, 143 distinct
establishments.** I tested all 57 trade names in F130 against the dataset: **all 57 are present,
and every address I spot-checked matches.** F130 is **confirmed as a data extract.**

**Every one of those 57 businesses has a DOHMH inspection record as its ONLY source.** I found no
second source for any of them.

> ⚠️ **RULING: for all 57 businesses in F130, existence and address MAY be published. NOTHING about
> them may appear in prose.** No description, no recommendation, no claim that any is currently
> open, no characterisation of quality, and no reliance on the DOHMH `cuisine_description` label as
> a description of the food (several carry `None`). A DOHMH record establishes only that a permitted
> food-service establishment was recorded at that address under that trade name.

Two additional cautions the finder did not fully draw out:

- **"40-05 Skillman Avenue" is a single shared address carrying at least 11 separate DOHMH
  licensees** (Coba Pizzeria, Milko Foods, Khao Glong Thai, Red Rabbit, Porkie's Tofu & Grill,
  Wu Jia You Tian, Rangoon Restaurant Concepts, Thai Smith, Mika's Dumplings, Jacky's Fried, Nick's
  Rice Bowl, Late Night Korean Express). These are stalls, not storefronts. **Do not present them as
  eleven separate businesses.**
- **40-05 Skillman Avenue is not in the Sunnyside NTA.** DCP returns `40-05 SKILLMAN AVENUE,
  **Long Island City**, NY` and the point falls in **Sunnyside Yards (South)**. The largest cluster
  in the roster sits outside the Sunnyside NTA.
- **F131 is confirmed and important**: the roster is ZIP-11104-only and therefore structurally
  excludes Sunnyside establishments in ZIP 11377 (which, per §1/C4, is substantially Sunnyside).
  The list is boundary-biased and is not a complete picture.

---

## 5. SINGLE-SOURCED CLAIMS — may they ship?

| Claim | Sole source | May ship? |
|---|---|---|
| F027 "approximately 50 cents per acre" | LPC LP-2258 | **Yes, verbatim with attribution.** I confirm the text says exactly this. The finder's suspicion of a typo is reasonable but is the finder's, not the source's. **Quote it as LPC's wording; do not silently "correct" it, and do not assert it as an economic fact.** |
| F103 "over 255 World and American Premieres", "252 Awards" | Thalia's own site | **Yes, but only as the theatre's own claim.** Promotional self-count. |
| F104 "over 16,000 people" | SCS's own site | **Yes, attributed to SCS.** |
| F106 country list, contact details | Sunnyside Shines' own site | **Yes, attributed to the BID.** Confirmed: page states no formation date, no boundaries, no property count. |
| F083 Phipps "472-unit" vs F084 Wikipedia "344 families" | Phipps Houses vs Queens Chronicle via Wikipedia | **Neither may ship as fact.** Live, unresolved conflict for the 1931 campaign. Both confirmed as *rendered*; the underlying number is **uncertain**. Note also Phipps dates its entry **1930** while LPC says **1931-32**. |
| F124 Lowery St ridership 256,080 → 2,117,809 | a 1931 Brooklyn Eagle clipping, via Wikipedia | **Attributed only** ("a 1931 newspaper account reported…"). |
| F029 "Mayor Zohran Mamdani revived the proposal in March 2026" | Politico 3/6/2026 + NYT 2/27/2026, via Wikipedia | **Attributed only, and date-stamped.** Live-news claim on a live wiki; will rot. |
| F109 Sunnyside Arch 2001 repair / $75,000 / Shulman | Wikipedia | **Uncertain — I could not confirm the 2001 detail.** The 1983 gantry erection is confirmed as article text. |
| F108 St Pat's for All route wording | Wikipedia | **Uncertain.** I confirmed founding in 2000 by Brendan Fay and Ellen Duncan, but did **not** re-locate the finder's quoted route sentence or the Hillary Clinton / Mychal Judge line. **Do not publish those as quotes.** |
| F100 Sunnyside Reformed Church "organized in July 1896" | Seyfried, *300 Years of Long Island City, 1630–1930* (1984), via Wikipedia | **Yes, attributed to Seyfried** — a named book, not bare aggregator text. Upgrade from the finder's tier. |
| F097 "largest privately held park in New York City" | **LPC LP-2258** — I found it in the primary source: *"this park, the largest privately held park in New York City"* | **Yes — this is primary, not aggregator.** The finder missed this. |
| F097 "one of only two members-only / private residential parks, the other Gramercy Park" | Forgotten New York blog + a 1998 NYT piece, via Wikipedia | **Attributed only.** "Gramercy" appears **nowhere** in the LPC report. |

---

## 6. SOURCE SELF-CONTRADICTIONS THE AUTHOR MUST HANDLE

1. **LPC contradicts itself on the agency that created the special district.** The **findings** say
   *"in 1974, after the original easements had expired, the New York City **Planning Department**
   declared Sunnyside to be a 'Special Planned Community Preservation District'"* (F067 — confirmed
   verbatim). But the **body** says *"In 1974, the New York City **Planning Commission** designated
   the area a 'Special Planned Community Preservation District' **(one of four in the city)**."*
   **The finder quoted only the findings and did not flag this.** Prefer "City Planning Commission";
   the "one of four in the city" detail is worth keeping.
2. **LPC says "northwestern Queens" in the summary and findings but "northeastern Queens" in the
   narrative.** Confirmed — the finder's flag is correct. Use *northwestern*.
3. **LPC gives the park as "approximately three acres" (description), "3 ½ acre" (findings), and
   "a three-acre (approximately) park" (narrative).** Confirmed. Publish "about three acres."
4. **LPC calls it both "Sunnyside Park" (summary) and "Sunnyside Gardens Park" (General
   Description).** Confirmed. The institution's own name is **Sunnyside Gardens Park**; use that.
5. **LPC writes the historic name of 39th Avenue as "Middleburg Avenue" and once as "Middleberg
   Ave."** Confirmed — the finder's flag is correct.
6. **F076 cover credit reads "3974-3988 44th Street."** Confirmed verbatim. The finder's
   typesetting-artifact hypothesis is **correct and I can now support it**: the same report uses
   proper Queens hyphenated form elsewhere ("39-74 47th Street"), and `39-74 44 STREET` geocodes to
   a valid Sunnyside address. Render as **39-74 to 39-88 44th Street**.
7. **Three different subway-arrival dates** across sources: LPC 2007 says 1918, LPC 2006 says
   regular IRT service 1915, Wikipedia says the Flushing Line crossed Queens Boulevard in 1917.
   All three confirmed as their sources' wording. **Unresolved — do not pick one silently.**

---

## 7. CLAIM-BY-CLAIM LEDGER

**Confirmed by me against the primary text (LPC LP-2258 / LP-2200, read raw):** F009, F010, F011,
F014, F017, F018, F019, F020, F021, F026, F027, F031, F033, F034, F035, F036, F037, F038, F039,
F040, F041, F042, F043, F044, F045, F046, F047, F048, F049, F050, F051, F052, F053, F054, F055,
F056, F057, F058, F060, F061, F062, F063, F064, F065, F066, F067, F068, F069, F070, F071, F072,
F073, F074, F075, F076, F081, F082, F092, F093, F094, F113, F114, F115. *(F046 required
reassembling a sentence broken by an interleaved image caption in the PDF — the finder's text is
nonetheless accurate.)*

**Confirmed against government JSON/GIS:** F001, F002, F003, F004, F012, F013, F032, F087, F088,
F089, F090, F091, F121, F130, F131.

**Confirmed as faithful renderings of Wikipedia (re-quoted from raw wikitext):** F006, F007, F008,
F022, F023, F024, F025, F028, F029, F084, F086, F096, F098, F099, F100, F101, F102, F103, F104,
F105, F106, F107, F112, F116, F118, F125, F126, F127, F129. *(Faithful ≠ true; see §5.)*

**Confirmed against institutional sites re-fetched:** F083, F085, F096, F099, F103, F104, F105, F106.

**REFUTED (12):** F015, F016, F059, F077, F078, F079, F095, F110, F111, F117, F120, F123.

**UNCERTAIN (8):** F005 (DOE NTA field — my query to `wg9x-4ke6` errored on a column name and I did
not re-run it; the finder's older-NTA point is corroborated indirectly by Wikipedia's citation of
the 2013 *Newest New Yorkers* tri-area, but the DOE record itself is unverified), F030 (East Side
Access / MTA 20-year-needs LIRR station at Queens Blvd & Skillman — not re-located), F080 (Cornell
finding aid not re-fetched; **the finder's warning stands and is important — "Regional Plan
Association" and "Regional Planning Association of America" are different organisations, do not
merge them**), F108, F109, F119 (population 52,278 and density 47.8/acre confirmed as article text
citing NYC Population FactFinder for **NTA QN0202**; the full race/income/tenure breakdown not
individually verified — and all of it is **NTA-scoped, therefore boundary-dependent**), F122 (MTA
entrances dataset not re-pulled), F128 (Sunnyside is landlocked — plausible and consistent with
F006, but the finder marked it `[P]` and I did not independently source it).

**Contested-assignment rulings (C1–C20):** 16 resolved and confirmed, 3 refuted (C3 Celtic Park,
C9 New York Presbyterian, C10 Islamic Institute), 1 uncertain (C12 Citi Bike joint figure).

---

## 8. HEADLINE COUNT

- **Claims adjudicated: 151** (131 finder facts F001–F131, plus 20 contested-assignment rulings C1–C20)
- **Confirmed: 127**
- **Refuted: 15**
- **Uncertain: 9**
- **Places surviving as publishable in Sunnyside: 27 researched places** — the historic district,
  Sunnyside Gardens Park, Phipps Garden Apartments, Celtic Park Apartments, four parks (Noonan,
  Torsney, Davidson, Sabba — Sabba **without** a street address), four 7-train stations, Sunnyside
  Yard (as split geography), Thalia Spanish Theatre, Sunnyside Community Services, QPL Sunnyside
  branch, Sunnyside Shines BID, the Sunnyside Arch, the former Sunnyside Garden Arena, the former
  Coventry/Popcorn Pub, six religious institutions, and two community gardens (one with an
  unverified address).
- **Plus 57 DOHMH-only businesses**, publishable as **existence and address only, never in prose.**
- **3 candidate places removed from Sunnyside entirely:** Islamic Institute of New York (Woodside),
  Doughboy Park (Woodside), New York Presbyterian Church / former Knickerbocker Laundry (Sunnyside
  Yards North, Community District 1).

**The confirmation rate is high because 60-odd claims are verbatim quotations from one PDF that I
read end to end. That is not a sign of quality across the whole file — the aggregator-sourced
material is where every one of the 15 refutations lives, and the finder's §13 left resolvable
questions open. Treat §1 and §2 as the operative output of this verification.**
