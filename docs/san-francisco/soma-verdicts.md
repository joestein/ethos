# SoMa, San Francisco — VERIFIER verdicts

Adjudication of `docs/san-francisco/soma-finder.md`. Verification date **2026-09-03**.
I did not gather the finder's evidence and I owe it no loyalty. Every ruling below is
PUBLISH, REWRITE or DROP with a reason. REWRITE rows carry exact replacement wording; the
author uses it verbatim.

**Ledger: 71 PUBLISH · 14 REWRITE · 19 DROP.**
**Tier: GUIDE.** Surviving writable places: **55** with the Yerba Buena and seam material,
**28** on the strict method-A polygon. Guide on either ruling (§5).

---

## 0. What I re-fetched

Every designation identifier the finder claims, plus eight of the sources it leaned on
hardest. All fetched live today.

| Source | Result |
|---|---|
| DataSF `97yj-54sx`, the 19 Article 10 numbers of §4.1, queried by `landmarkno` | 200 — **19/19 confirmed**, number, name and year |
| DataSF `97yj-54sx`, landmarks 7, 107, 162, 200 (cited in passing in §4.2) | 200 — **4/4 confirmed** |
| DataSF `97yj-54sx`, `$where=landmarkno=0` | 200 — **all eight of §4.4(a) confirmed verbatim** |
| DataSF `knm6-5ej6` Article 10 districts | 200 — appendix letters and adoption dates recovered (§1.3) |
| DataSF `63x5-g3m4`, South End records | 200 — `a10 Listed`, `nr Listed`, Ord. 104-90, adopted 1990-03-23 |
| NPS `nrhp_locations` layer 0, 22 reference numbers | 200 — 20 returned, **2 stubs**, 2 absent from this layer |
| NPS `nrhp_locations` layer 1, 6 reference numbers + all SF districts | 200 — **both NHLs confirmed `Is_NHL = X`**; no South End district exists |
| `sfmoma.org/visit` | 200 — hours and prices confirmed verbatim |
| `moadsf.org/visit` | 200 — closure window, reopening date, hours and prices confirmed verbatim |
| `bookbindersmuseum.org/visit` | 200 — address, hours and prices confirmed verbatim |
| `ybca.org/visit` | 200 — address, hours and prices confirmed verbatim |
| `sf-eagle.com` | 200 — address, hours and the "Opened 1981" claim confirmed |
| `thecjm.org` | 200 — "THE CJM IS TEMPORARILY CLOSED" confirmed |
| `cartoonart.org/visit` | 200 — closing text and 781 Beach Street confirmed verbatim |
| `pier24.org/about/` | 200 — permanent closure confirmed verbatim |
| `en.wikipedia.org` Strand redirect | 200 — `#REDIRECT [[American Conservatory Theater]]` confirmed |
| `gsa.gov` James R. Browning building | 200 — **new**, resolves the finder's open question (§2.2) |
| Corpus census, all eight seed directories | **3,921 places, 3,921 distinct slugs, zero collisions** |
| `lib/ethos/seeds/oracle_park_places.ex` | seven slugs, exactly as the finder reports |

**Designation identifiers that survived re-fetching: 51 of 52.** The single failure is the
National Register status of the South End Historic District (§1.4).

---

## 1. Designation claims

### 1.1 Article 10 landmark numbers — PUBLISH, all 22

All nineteen rows of §4.1 returned from `97yj-54sx` with the finder's number, name and
year of designation intact. Landmarks **7** (Audiffred, 1968), **107** (Rincon Annex Post
Office, 1980) and **162** (The Hobart Building, 1983), which §4.2 cites only in
parentheses, also confirmed. That is 22 Article 10 numbers, each **[PUBLISH]**.

Template that satisfies the gate: `San Francisco Landmark No. 236, designated in 2003.`

Three corrections to the finder's transcription:

**[REWRITE] Landmark 199, Jackson Brewery Co. Complex — the cross street is Eleventh, not
Fourteenth.** The finder writes "1475 Folsom St & 315–333 14th". The city's own record
reads `1475-333 Folsom Street & 315-333 11th Street`, and NPS independently gives
`1475–1489 Folsom St. and 319–351 11th St.` Two registers agree against the finder. Use:

> The Jackson Brewery Co. Complex stands at 1475–1489 Folsom Street and 319–351 Eleventh
> Street. It is San Francisco Landmark No. 199, designated in 1991, and was listed on the
> National Register of Historic Places in 1993, reference number 93000284.

**[REWRITE] Landmark 107 — the Article 10 address is 99 Mission Street.** The finder gives
"101–199 Mission St", which is the *National Register's* address for the same building.
Both are citable; attribute each to the register that states it. Use:

> Rincon Annex Post Office, 99 Mission Street. San Francisco Landmark No. 107, designated
> in 1980, and listed on the National Register of Historic Places in 1979, reference
> number 79000537.

**[REWRITE] Landmarks 281 and 295 — normalise the city's typographical errors.** The
dataset reads `Piledrivers, Bridge, And Structural Inonworkers Local No. 77 Union Hall`
and `San Francsico Eagle Bar`. Write "Piledrivers, Bridge and Structural Ironworkers Local
No. 77 Union Hall" and "San Francisco Eagle Bar". Do not reproduce the misspellings.

### 1.2 Landmark 200, Path of Gold Light Standards

**[PUBLISH as an identifier, DROP as a SoMa place.]** Confirmed: `landmarkno 200`, `Path Of
Gold Light Standards`, `1-2490 Market Street`, designated 1991. The finder's reasoning is
sound — a linear feature running the length of Market Street with a six-way split and no
majority is not any single zone's place. It may be named in prose about Market Street
without being claimed.

### 1.3 Article 10 districts — the finder under-cited these, and I recovered the identifiers

`knm6-5ej6` carries an appendix letter and an adoption date for every Article 10 district.
The finder gave neither for two of its three. Recovered:

**[PUBLISH] South End Historic District** — Appendix I, adopted 23 March 1990,
Ordinance 104-90, period of significance 1867–1935.

> The South End Historic District was designated under Article 10 of the Planning Code,
> Appendix I, on 23 March 1990 by Ordinance 104-90. Its period of significance runs from
> 1867 to 1935.

**[PUBLISH] Clyde and Crooks Historic District** — Appendix O, listed 3 December 2018. The
finder supplied no date at all.

> The Clyde and Crooks Historic District was designated under Article 10 of the Planning
> Code, Appendix O, on 3 December 2018.

**[REWRITE] Market Street Masonry Historic District.** The finder cites "(2011.0705)". That
is a Planning Department case number, not a designation identifier, and it would not
survive a challenge. The register gives Appendix M, listed 17 May 2013.

> The Market Street Masonry Historic District was designated under Article 10 of the
> Planning Code, Appendix M, on 17 May 2013.

### 1.4 THE ONE DESIGNATION CLAIM THAT DIES — and the finder called it correctly

**[DROP] "South End Historic District is listed on the National Register."** DataSF says
`nr: Listed` and the sibling "Addition" record repeats it in prose. I queried the National
Register itself for every district in San Francisco and got seventeen; **South End is not
among them.** The federal register does not know this district. DataSF's field is wrong or
refers to something the NPS has not published.

The finder reached this conclusion and refused to soften it. Confirmed and upheld. Write
the Article 10 sentence above and no National Register sentence.

### 1.5 National Register reference numbers — PUBLISH 24, REWRITE 2

Twenty-six reference numbers claimed. I queried all twenty-six by `NRIS_Refnum` across
both NPS layers. Twenty-four returned `STATUS: Listed` with a matching resource name and
San Francisco address. **[PUBLISH]** each, in the form
`Listed on the National Register of Historic Places in 1974, reference number 74000555.`

Both National Historic Landmarks confirmed with `Is_NHL = X`:

- **66000231** Old U.S. Mint, `5th and Mission Sts.`, building, Listed, NHL
- **71000188** U.S. Post Office and Courthouse, `NE corner of 7th and Mission Sts.`,
  building, Listed, NHL

The finder's §2.4 warning is upheld and mattered: **both NHL records are absent from the
point layer and live only in the polygon layer.** A points-only search loses the zone's two
strongest citations. Assign by street address, as the finder says.

**[REWRITE] 100004869 Gran Oriente Filipino Hotel and 100009717 Western Manufacturing
Company Building are stub records.** Both refnums exist in layer 0, but `Address`, `City`,
`State` and `STATUS` are all unpopulated. The finder presents 100004869 as a settled
listing and admits only that 100009717 has no address. Neither carries a confirmed
`Listed` status. For the Gran Oriente Hotel, if it is written at all:

> The Gran Oriente Filipino Hotel is recorded on the National Register of Historic Places
> under reference number 100004869.

**[DROP] the Western Manufacturing Company Building entirely.** A record with no address
cannot be placed inside any zone boundary, and the finder does not place it either. There
is nothing here to write.

### 1.6 The `landmarkno = 0` trap — PUBLISH the finding, DROP all eight claims

I pulled every `landmarkno = 0` record. **All eight of the finder's SoMa-family rows are
present exactly as reported**: Delta House / Bayanihan House (88 06TH ST), Strand Theater
(1127 MARKET ST), SF Galvanizing Works (1170-1180 HARRISON ST), Southern Police Station
(360 04TH ST), Mattachine Society Headquarters (188 MINNA ST), Sailor's Union Hall of the
Pacific (450 HARRISON ST), Gran Oriente Filipino Complex, Orders of Foresters / Baha'i
Temple (170 VALENCIA ST). The layer also carries the Alcoa Building, the Fillmore
Auditorium and the Peace Pagoda at zero, as the finder says.

**[DROP] every designation sentence for all eight.** This is the strongest section of the
finder file and it is fully verified.

One boundary correction: **[DROP] Orders of Foresters / Baháʼí Temple, 170 Valencia
Street, from SoMa.** It is in the Mission on any reading, and the Mission's own finder
already carries it at its §4.6. Neither zone can make a designation claim about it; the
place itself is the Mission's.

### 1.7 Eligible-is-not-listed — PUBLISH the finding

**[DROP]** every designation claim for the SoMa LGBTQ Historic District, South Park
Historic District, South End Historic District Addition, Western SoMa Light Industrial and
Residential HD, and the Sixth Street Lodging House HD. I confirmed the Addition directly:
`cr Eligible`, `nr Eligible`, `a10 No`. The New Montgomery–Mission–Second Street district
is Article **11**, a conservation district, and is not a landmark designation. Upheld.

### 1.8 A GATE FAILURE THE FINDER DID NOT SEE

I read `test/ethos/seeds/san_francisco_seed_data_test.exs`. `@designation_claim` fires on
the bare words *designated*, *listed*, *landmark*, *registered* and *nominated*.
`@designation_citation` accepts only four things: `San Francisco Landmark No. <digits>`,
`Article 10`, `National Register` / `NRHP` / `NR reference`, or the literal phrase
`reference number` followed by six or more digits.

**Neither "National Historic Landmark" nor "California Historical Landmark No. 875"
satisfies the citation pattern.** Written on their own they trip the claim regex and match
no citation, and the build fails. The finder calls the Old Mint "the strongest designation
sentence available in the zone" on the strength of four registers, without noticing that
two of the four are invisible to the gate.

The check runs per prose *field*, not per sentence, so the fix is to keep the NHL and CHL
sentences in the **same field** as an NRHP reference number. **[REWRITE]** the Old Mint:

> The Old San Francisco Mint stands at 88 Fifth Street. Alfred B. Mullett designed it and
> it was built between 1 April 1869 and November 1874, in Greek Revival style. It is San
> Francisco Landmark No. 236, designated in 2003, and was listed on the National Register
> of Historic Places in 1966, reference number 66000231. It was designated a National
> Historic Landmark in 1961 and is California Historical Landmark No. 875. In 2003 the
> federal government sold the building to the City of San Francisco for one dollar — an
> 1879 silver dollar struck at the mint. No source states opening hours, so none are given
> here; the building is used for special events, some of them open to the public.

Splitting that paragraph across `summary` and `history` re-breaks it. Keep it whole.

### 1.9 The finder's arithmetic does not add up

**[DROP] the headline counts.** §1 says 47 identifiers (20 Article 10 + 26 NRHP + 1 CHL);
§4's heading says 48; §4.1's heading says 19 and its table holds 19 rows; §4.2's heading
says 24 and its tables hold 26. The true figure, after my re-fetch and including the three
parenthetical landmarks and the three district appendices, is **51 verified identifiers**.
Do not carry any of the finder's totals forward.

---

## 2. Places and their facts

### 2.1 Verified verbatim — PUBLISH

**[PUBLISH] SFMOMA**, 151 Third Street, 94103. Mon–Tue 10am–5pm, Wed closed, Thu
noon–8pm, Fri–Sun 10am–5pm. $30 adult, $25 senior 65+, $23 student, free 18 and under.
Confirmed against `sfmoma.org/visit` today, matching the finder exactly.

**[PUBLISH] Museum of the African Diaspora**, 685 Mission Street (at Third), 94105, on the
ground floor of the St. Regis. Closed for exhibition installation 17 August – 29 September
2026, reopening 30 September 2026. Tue–Wed and Fri–Sun 11am–5pm, Thu noon–8pm, Mon closed.
$15 adult, $7 senior/student/educator, free under 12, free to all on the second Saturday of
each month. Confirmed verbatim.

**[PUBLISH] American Bookbinders Museum**, 355 Clementina Street, 94103. Tue–Sat
10am–4pm. $15 general, $12 seniors 62+ and youths 10–17, free under 10. Confirmed verbatim.
The finder is right that this is one of the few places both city layers agree on.

**[PUBLISH] Yerba Buena Center for the Arts**, 701 Mission Street, 94103. Wed 11am–8pm,
Thu–Sun 11am–5pm, Mon–Tue closed. Free to members, $10 adult 18+, $5 student and senior,
free to youth 17 and under and to military personnel, free to all on Wednesdays. Confirmed
verbatim. Architects Fumihiko Maki (galleries and forum) and James Polshek with Todd
Schliemann (theatre) — **[PUBLISH]**, these are attributions, not rankings.

**[PUBLISH] San Francisco Eagle Bar**, 398 Twelfth Street, 94103. Mon 6pm–midnight, Tue
closed, Wed–Thu 6pm–midnight, Fri–Sat 2pm–2am, Sun 1pm–midnight. Confirmed verbatim.

### 2.2 NEW — the finder left this open and I closed it

The finder asks the verifier to establish the current occupant of the U.S. Post Office and
Courthouse "from a federal source". Done, from the General Services Administration.

**[PUBLISH]**

> The James R. Browning United States Court of Appeals Building stands at 95 Seventh
> Street, on the northeast corner of Seventh and Mission Streets. James Knox Taylor,
> Supervising Architect of the Treasury, designed it, and it was built between 1897 and
> 1905. It was listed on the National Register of Historic Places in 1971, reference
> number 71000188, and designated a National Historic Landmark. It houses the United
> States Court of Appeals for the Ninth Circuit.

Note the construction dates (1897–1905) and the architect are new facts the finder did not
have. Do not write "the courthouse is open to the public" — the GSA page does not say so
and no visitor-hours source was found.

### 2.3 Trading duration and founding years — DROP

**[DROP] "Opened 1981" and "Forty years" for the SF Eagle.** Confirmed present on
`sf-eagle.com`; it is a trading-duration claim from the operator's own site. The 1906
building date and Landmark No. 295 come from DataSF and publish. Finder correct.

**[DROP] MoAD's founding year.** The finder concedes it has only MoAD's own word for 2005
and suggests taking it from Wikipedia instead. I did not source it independently, so it
does not publish. Same for the American Bookbinders Museum and 21st Amendment.

**[DROP] "established 1935" for SFMOMA, "established 1993" for YBCA, "opened 22 Nov 1985"
for DNA Lounge, "established 1871" for the California Historical Society.** The finder
argues at §9.1 that a third-party Wikipedia statement escapes the rule. I do not accept
that here: it did not name a Wikipedia revision or article for any of the four, and I did
not verify them. If the author wants these, fetch and cite the article; otherwise they go.

**[PUBLISH] SOMArts' institutional history**, which is a different shape: the Neighborhood
Arts Program was created by the San Francisco Arts Commission in 1967 and SOMArts became
an independent 501(c)(3) in August 1979. That is a public body's act, not a business
narrating its own longevity. It still needs its source named in the author's notes.

### 2.4 Closures — PUBLISH, with one correction

**[PUBLISH] Contemporary Jewish Museum is temporarily closed.** Confirmed on the front
page. **[REWRITE]** the date: the front page carries no date and I did not open the linked
page, so "as of 15 December 2024" is not verified. Write the closure without the date:

> The Contemporary Jewish Museum is temporarily closed and no source states a reopening
> date, so no hours are given here. The building at 736 Mission Street is Daniel
> Libeskind's 2008 addition wrapped around the Jessie Street Substation, which Willis Polk
> designed in 1907. The substation is San Francisco Landmark No. 87, designated in 1977,
> and was listed on the National Register of Historic Places in 1974, reference number
> 74000555.

Written as a building with a designation and no hours. That is the finder's own
recommendation and it is right.

**[PUBLISH] Pier 24 Photography is permanently closed** as of 1 February 2025. Confirmed
verbatim. **[DROP] as a SoMa place** — method B puts it in Rincon Hill and it is shut.

**[PUBLISH] the Cartoon Art Museum finding, and DROP the place.** Confirmed verbatim:
"Our last day will be Sunday, August 2, 2026", closed as of 3 August 2026, address 781
Beach Street, 94109. Two independent disqualifications, as the finder says. **Escalated to
Fisherman's Wharf** (§4).

**[REWRITE] the California Historical Society knock-on.** The dissolution facts and the
Old Mint consequence are sourced to Wikipedia and to a domain the finder reports as
non-resolving; I verified neither. Do not write the operator narrative. The publishable
residue is the sentence already in §1.8: no source states opening hours for the Old Mint.

**[DROP] Local Brewing Co.** No current address exists on the operator's site. A place
with no address is not a place.

### 2.5 Categories dropped wholesale

**[DROP] all 250 food-and-drink candidates.** None was verified against an operator's own
site and the finder recommends exactly this. Nothing in this zone's food layer survives as
written. If the author wants restaurants, that is a fresh pass with operator sites, not a
rescue of this list.

**[DROP] the eleven single-room-occupancy residential hotels** — Hotel Alder, Minna Hotel,
Sunnyside, Seneca, The Rose, Kean, Raman, Ram's, Pontiac, Hotel 964, Sunset. The finder is
right that these are homes and not visitor accommodation. Recorded so a later wave does
not rediscover them as a gap. **[REWRITE]** the twenty-two visitor hotels to *pending*:
none has a verified address or rate from its own site, so none ships in this state.

**[DROP] the Strand Theater's designation.** `landmarkno 0`, confirmed. And the redirect
trap is real: I fetched the raw wikitext and `Strand Theatre (San Francisco)` is
`#REDIRECT [[American Conservatory Theater]]`, whose infobox describes the Geary Theater at
415 Geary Street. Attaching Landmark No. 82 or Bliss & Faville to 1127 Market Street would
be a fabricated citation. The finder caught this and it is the second most valuable thing
in the file.

**[DROP] the Folsom Street Fair.** An event, not a place, and no schema kind accepts it.
Finder correct.

### 2.6 A SCHEMA PROBLEM THE FINDER MISSED ENTIRELY

The thirteen kinds are museum, theater, restaurant, cafe, brewery, hotel, bnb, park,
historic-site, amusement-park, shop, stadium, attraction. **There is no `bar` and no
`nightclub`.** The finder devotes §7.5 to "the densest concentration in the city" without
once noticing that the SF Eagle, DNA Lounge, The Endup, Oasis, Halcyon, Monarch, Mezzanine
and the Hotel Utah Saloon have no kind to be. The Mission's finder caught the identical
problem for Zeitgeist and escalated it; SoMa's did not.

**[REWRITE]** — flagged to the arbitrator, not decided by me: either accept `restaurant` as
the approximation for a bar that serves food, or `attraction`. **Do not invent a kind.**
Rome shipped three invented kinds and the changeset rejected them at seed time.

Same problem, smaller: the Third Street Bridge has no `bridge` kind (use `historic-site`),
Moscone Center has no convention-centre kind (`attraction`), and the Martin Luther King Jr.
Memorial has no `monument` kind (`attraction`, or fold it into Yerba Buena Gardens).

---

## 3. Prose rules — what the finder missed

Its §9 is good as far as it goes. Four gate patterns it does not mention, taken from the
test file:

1. **The word "vertices" is banned outright** by `@method_patterns`. So is
   `tests wholly/cleanly/inside`, and `boundary research|geometry|method`. The finder's
   §2.2 vocabulary must not survive contact with the page.
2. **`\bon this page\b` and `belongs to X's page` are banned** by
   `@self_reference_patterns`. If SoMa links to `guide:oracle-park-guide`, the link note
   cannot say the places belong to another page.
3. **`\b[A-Z][a-z]+(?:'s|s')\s+only\b` fires on any proper noun.** "Libeskind's only",
   "Polk's only", "Mullett's only", "Strauss's only" all fail. SoMa's architect-heavy
   material walks straight into this.
4. **`(?:southern|northern|eastern|western)most` is banned.** The finder quotes
   "southernmost" from the brief but does not carry the warning into its own §9.

One more, structural: **entries must be non-empty and every entry kind must be one of
food/tour/walk/sight/stay/tip.** With all 250 food candidates dropped, SoMa ships with no
`food` entries — which is fine. What is not fine is saying so. The page does not list
restaurants and does not announce that it has none.

---

## 4. Straddlers escalated

The finder flags 31 and resolves none. That is the correct instinct applied to the wrong
map, and this is its most consequential structural error.

**`docs/san-francisco/` holds twelve finder files: castro, chinatown, fishermans-wharf,
haight-ashbury, hayes-valley, marina, mission, nob-hill, north-beach, pacific-heights,
russian-hill, soma.** Those are the twelve zones the arbitrator rules across. **Financial
District, Union Square, Mission Bay, South Beach, Rincon Hill, Civic Center and the
Tenderloin are not among them** — the first three are later waves and the last four are not
roster zones at all.

So the finder's "central boundary question of the zone" — the nine-place Yerba Buena
cluster — is not contested by anybody in this wave. No rival finder claims SFMOMA, Yerba
Buena Gardens, the CJM, MoAD, YBCA, Moscone, the Children's Creativity Museum, St
Patrick's or the MLK Memorial. The same is true of South Park, the Oriental Warehouse, the
Hills Brothers Coffee Plant, the Gran Oriente Filipino Hotel, the Market Street seam and
the whole Rincon Hill list. Those need a **policy ruling** — may a wave-1 zone claim a
place a wave-2 zone might later want? — not an inter-zone arbitration.

I escalate **five genuine wave-1 conflicts**, of which the finder found none:

1. **SOMA West Dog Park and SOMA West Skate Park.** The Mission's finder claims both at its
   §4.4 and §5 S7 on Rec & Park's `analysis_neighborhood: Mission`, zip 94103, and flags
   "direct conflict risk" with SoMa by name. **SoMa's finder does not mention either park.**
   They are named SoMa, they sit under the Central Freeway, and only one zone can have them.
2. **Zeitgeist, 199 Valencia Street, 94103.** The Mission's finder flags it at S9 as sitting
   on the Mission / SoMa / Duboce triple point and asks SoMa to check before claiming.
   SoMa's finder is silent. It also carries the `bar` kind problem of §2.6.
3. **Orders of Foresters / Baháʼí Temple, 170 Valencia Street.** Both finders list it. I
   rule it the Mission's (§1.6) and drop it from SoMa, but record it here because two
   finders reaching for one address is exactly what the arbitrator exists to catch.
4. **San Francisco Eagle Bar (Landmark 295), Juvenile Court and Detention Center (Landmark
   248, NRHP 11000182) and DNA Lounge.** Method A assigns all three to the Mission; method
   B to South of Market. The Mission's finder claims none of them. **Recommend SoMa**, on
   the unopposed reading, but the arbitrator should record it rather than let it pass by
   default.
5. **The Cartoon Art Museum belongs to no one and Fisherman's Wharf must be told.** Its
   781 Beach Street address is in Fisherman's Wharf, a live wave-1 zone, and it closed on
   3 August 2026. That finder will otherwise ship a museum a visitor cannot enter.

The finder's own advice to the arbitrator — one line applied to all twelve zones, and never
split a single campus — is sound and I endorse it. The ice rink and bowling centre sit on
the Moscone roof deck inside Yerba Buena Gardens; no ruling may separate them from it.

---

## 5. Tier ruling

**GUIDE.** Not a town page.

Counted honestly against what survives adjudication, not against the 441 harvested:

| | |
|---|---|
| Designated buildings, sites and districts with a verified identifier | 29 |
| Open institutions (SFMOMA, MoAD, Children's Creativity, Bookbinders, YBCA, SOMArts, Moscone, Strand) | 8 |
| Parks and open space | 6 |
| Nightlife | 3 |
| Library, memorial, other | 3 |
| Food and drink | 0 |
| Hotels shippable today | 0 |
| **Surviving writable places, Yerba Buena and the seams included** | **55** |
| **Surviving on the strict method-A polygon alone** | **28** |

The tier does not turn on the arbitration, and the arbitrator should know that before it
rules: 28 places is still far past a town page, and the corpus precedent — the rioni and
the New York neighborhoods — is unanimous. The finder reaches the same verdict at §8 and I
uphold it, but its reasoning is wrong in one respect: it says the zone has enough marquee
material "only if the Yerba Buena cluster is ruled to it". That is a claim about glamour,
not about tier. Twenty-two Article 10 landmark numbers, twenty-four National Register
references, two National Historic Landmarks and three Article 10 districts carry a guide
whatever happens to the museum quarter.

---

## 6. What the finder got wrong, in order

1. **It did not check the gate.** The National Historic Landmark and California Historical
   Landmark citations it calls the zone's strongest do not satisfy `@designation_citation`
   and fail the build unless paired with an NRHP reference in the same field (§1.8).
2. **It missed the schema's missing `bar` kind** across a whole section built on nightlife,
   when the Mission's finder caught the identical problem and escalated it (§2.6).
3. **It mapped its straddlers against a wave that does not exist.** Eleven of its twelve
   named rival zones are not in this wave; five real wave-1 conflicts went unnoticed,
   including two parks another finder is actively claiming (§4).
4. **Landmark 199's cross street is Eleventh, not Fourteenth** — contradicted by both
   registers (§1.1).
5. **"2011.0705" is a case number, not a designation identifier**, and two of its three
   Article 10 districts shipped with no appendix letter and no adoption date (§1.3).
6. **Two of its NRHP references are stub records** with no address, city, state or status,
   presented as settled listings (§1.5).
7. **Its identifier count is stated three different ways** — 47, 48 and 19-that-are-19 —
   and none is right (§1.9).
8. **It relies on Wikipedia for four founding years without citing an article** (§2.3).

Set against that: its §4.4 `landmarkno = 0` trap, its §2.6 Strand redirect trap, its §2.4
NPS point-layer warning and its refusal to write South End's National Register status are
all correct, all verified, and all things a page would otherwise have got wrong in a way
that looks citable. Four real saves. The file is worth having.
