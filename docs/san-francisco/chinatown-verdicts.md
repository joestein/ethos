# Chinatown, San Francisco — VERIFIER'S VERDICTS

Adjudicating `docs/san-francisco/chinatown-finder.md`. Ruled 2026-09-03. I did not gather this
evidence and I owe it no loyalty. Every ruling below is mine.

| | |
|---|---|
| Numbered candidates adjudicated | **100** |
| **PUBLISH** (ships once the finder's own DO-NOT-PUBLISH items are struck) | **31** |
| **REWRITE** (fact sound, wording overreaches — exact replacement given below) | **10** |
| **DROP** | **42** |
| **ESCALATED to the arbitrator** (straddler; Chinatown's author writes none of them) | **17** |
| **Surviving Chinatown place records** | **41** |
| **TIER RULING** | **GUIDE** |
| Designation identifiers re-fetched | **33 attempted, 32 survive, 1 dropped** |
| Claim-level excisions inside surviving records | **24** (§5) |

**TIER: GUIDE, on 41 surviving places.** The Bronx precedent sets the floor at six
(`docs/bronx/concourse-verdicts.md`: "Two does not clear six. `tier: \"town-page\"`"); Rome's floor
was four. Forty-one clears either by a wide margin, and it clears it *after* I dropped 42 of the
finder's candidates and removed 17 straddlers from the count. The yield is not padded: 41 survives
even if every escalation is ruled against Chinatown, because I have already excluded all 17 from
the total. Chinatown ships as `"tier": "guide"`.

---

## 0. Collision check — run, not assumed

`priv/seed_data/san_francisco/` contains **only `.gitkeep`**. No San Francisco place is owned by a
shipped seed file yet, so no candidate below can collide with one.

**`.superpowers/taken_slugs.py` is not the corpus-wide check its docstring claims.** I read it: it
globs `priv/seed_data/rome/*.json` **only**. It does not read Connecticut, New York, San Francisco
or the code seeds. I ran the corpus-wide equivalent over `priv/seed_data/*/*.json` instead. The
North Beach finder caught the same defect independently (`north-beach-finder.md` §1) and is right.

**Oracle Park:** none of its seven code-seeded places (`oracle-park`, `reds-java-house`,
`momos-san-francisco`, `flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`) appears anywhere in this file. Clean.

**Roster reservations:** `san_francisco_roster.json` names **City Lights Booksellers** and
**Washington Square** in North Beach's draw, the **Cable Car Museum** in Nob Hill's, the **cable
car turntable at Powell and Market** in Union Square's, and **Jackson Square** and the **Wells
Fargo History Museum** in the Financial District's. Every one of those appears in this finder file
and every one is dropped or escalated below.

---

## 1. RE-FETCH LOG — thirteen sources, including all five the finder leaned on hardest

Fetched this session with `python3` + `urllib` (WebFetch only where urllib was refused), and I read
the returned bytes myself. Scripts at `.tmp_verify/`.

| Source | Result | Verdict on the finder's use of it |
|---|---|---|
| `data.sfgov.org/resource/97yj-54sx.json?$limit=5000` (Article 10 landmarks) | 200, **370 rows** | **Confirmed.** All 17 landmark numbers claimed re-fetch with the finder's names, addresses and designation years. |
| `data.sfgov.org/resource/j2bu-swwd.json?$limit=200` (Analysis Neighborhoods) | 200, **41 polygons** | **Confirmed to the digit.** Chinatown is a single 65-vertex ring, lon −122.41290800 to −122.40014900, lat 37.79204300 to 37.80218400 — exactly the finder's figures. Every PIP result I re-tested reproduces. |
| `data.sfgov.org/resource/gtr9-ntp6.json?$limit=1000` (Rec & Park properties) | 200, **255 rows** | **Confirmed**, with one correction and one addition (§2.2, §2.3). |
| `data.sfgov.org/resource/63x5-g3m4.json?$limit=500` (historic districts) | 200, **204 rows** | **Confirmed verbatim**, including the Chinatown Historic District's origin note. §2.4. |
| `data.sfgov.org/resource/knm6-5ej6.json?$limit=100` (Article 10 districts) | 200, **20 rows** | **Confirmed.** No Chinatown district exists. Jackson Square is Appendix B, listed 1972-08-09. |
| `data.sfgov.org/resource/3tsw-4idn.json` (Historic Resource Status by Parcel) | 200 | **Confirmed on every parcel I spot-checked**, including the two landmines. §2.5. |
| `data.sfgov.org/resource/r7bn-7v9c.json?$limit=2000` (Civic Art Collection) | 200, **1,038 rows** | **Confirmed**, with two corrections that change the St Mary's Square straddle. §2.3. |
| NPS `nrhp_locations` MapServer layers 0 and 1 | 200 | **All 12 NRHP reference numbers confirmed**, with names, certification dates and NHL flags. §2.1. |
| `ohp.parks.ca.gov/ListedResources/?view=county&criteria=38` | 200 | Three CHL numbers confirmed. **CHL 192 does not appear.** §2.6. |
| `sfrecpark.org/1166/Portsmouth-Square-Improvement-Project` | 200 | **Confirmed verbatim**, closure and bridge demolition both. §2.7. |
| `sfrecpark.org/1175/Willie-Woo-Woo-Wong-Playground-Improveme` | 200 | **Confirmed verbatim**, including the Hang Ah containment sentence. Plus one superlative the finder missed. |
| `chsa.org/visit/` | 403 to urllib, 200 via WebFetch | **Confirmed:** 965 Clay Street, 94108; "OPEN: Wed & Sat 10am–5pm"; "CLOSED: Mon, Tues, Thurs, Fri, Sun". No admission price stated. |
| `sfpl.org/locations/chinatown` | 200 | **The finder was wrong that this page does not render hours. It does, and they contradict OSM.** §2.8. |
| `misterjius.com` · `cccsf.us/visit` · `goldengatefortunecookies.com/contact` · `greatstartheater.org` · `bucsf.com` · `chinatownalleywaytours.org` | all 200 | Confirmed verbatim, with three consequences the finder drew wrongly. §2.9. |

---

## 2. WHAT THE RE-FETCH CHANGED

### 2.1 Every designation number survives except one — and the one that fails is the one the finder already doubted

**Seventeen San Francisco Article 10 landmark numbers**, all confirmed with name, address and year:
**2** Old St. Mary's Church, 660-680 California Street, 1968 · **9** Langerman's/Belli, 722
Montgomery, 1969 · **10** Genella/Belli Annex, 728-730 Montgomery, 1969 · **11** Hotaling Stables,
32-42 Hotaling Place, 1969 · **12** Hotaling Building, 451-461 Jackson, 1969 · **13** Hotaling
Annex-East, 443-445 Jackson, 1969 · **14** Medico-Dental, 435-441 Jackson, 1969 · **15** Old
Ghirardelli, 415-431 Jackson, 1969 · **16** Regency House–Ghirardelli Annex, 407 Jackson, 1969 ·
**19** Golden Era, 730 Montgomery, 1969 · **20** Hotaling Annex West, 463-473 Jackson, 1969 ·
**22** Solari East, 468-470 Jackson, 1970 · **23** Solari West, 472 Jackson, 1970 · **24** Yeon,
432 Jackson, 1970 · **25** Moulinie, 458-460 Jackson, 1970 · **26** Bank of Lucas, Turner & Co,
800-802 Montgomery, 1970 · **27** Grogan-Atherton-Lent, 701 Sansome, 1970 · **33**
Sentinel/Columbus Tower, 916-920 Kearny, 1970 · **34** U.S. Mint & Subtreasury, 608-610 Commercial,
1970 · **43** Cable Car Barn and Power House, 1201 Mason, 1971 · **44** Donaldina Cameron House,
920 Sacramento, 1971 · **52** Transamerica/Old Fugazi Bank, 4 Columbus, 1973 · **122** Clay Street
Center, 965 Clay, 1981 · **142** PG&E Old Station J, 565-569 Commercial, 1981 · **143** Fire
Station 2, 460 Bush, 1981 · **158** Federal Reserve Bank, 400 Sansome, 1983 · **167** Met
Life–Pacific Coast Head Office, 600 Stockton, 1984 · **173** Notre Dame Des Victoires Church &
Rector, 564-566 Bush, 1984 · **212** Columbia Savings Bank Building, 2000 · **228** City Lights
Bookstore, 261-271 Columbus, 2001 · **235** Chinatown Branch Carnegie Library, 1135 Powell, 2002 ·
**237** Drexler/Colombo, 1-33 Columbus, 2002 · **299** Jones-Thierbach Coffee Company, 447 Battery,
2022.

*(One correction: the finder tabulated No. 212 inside "the Hotaling / Jackson Street group". Its
actual dataset name is **Columbia Savings Bank Building**, at 15 Hotaling Place & 580-15 Washington
Street & 700-15 Montgomery Street. Use the dataset name if it is ever written.)*

**Twelve NRHP reference numbers**, all confirmed from the NPS service with certification dates:
66000233 San Francisco Cable Cars, 15 Oct 1966, **NHL**, 1390 Washington St · 66000230 Flood, James
C., Mansion, 13 Nov 1966, **NHL** · 71000186 Jackson Square Historic District, 18 Nov 1971 ·
78000754 Bank of Italy, 2 Jun 1978, **NHL** · 86003514 PG&E Substation J, 29 Dec 1986 · 89000009
Federal Reserve Bank of San Francisco, 31 Jul 1989 · 91000563 NIANTIC (Storeship), 16 May 1991 ·
91000957 Lower Nob Hill Apartment Hotel District, 31 Jul 1991 · 99000894 Second and Howard Streets
District, 28 Jul 1999 · 06000372 Port of San Francisco Embarcadero HD, 12 May 2006 · 07001469
Colombo Building, 31 Jan 2008 · 00000525 San Francisco–Oakland Bay Bridge, 7 Jan 2022.

**One Article 10 landmark district** confirmed: Jackson Square, Appendix B, listed 1972-08-09.

**The one that dies: California Historical Landmark No. 192.** The finder attributed it to the
Jenny Lind Theatre / first City Hall site under the Hilton, from Wikipedia, and said it could not
confirm it against OHP. I searched the full OHP San Francisco county list. **No. 192 is not in it,
and neither "JENNY LIND" nor "CITY HALL" appears anywhere in the list.** **DROP the CHL 192 claim
entirely.** The finder was right to doubt it; a writer must not resurrect it.

### 2.2 Rec & Park confirms every attribution table, and one finder sentence overstates

| Property | analysis | mons | planning | realtor |
|---|---|---|---|---|
| 136 St. Mary's Square, 633 California St, 1.44146 ac / 62,790 sq ft | Financial District/South Beach | **Chinatown** | **Chinatown** | Financial District/Barbary Coast |
| 139 Willie Woo Woo Wong Playground, **850 Sacramento St**, 0.65635 ac / 28,591 sq ft | **Chinatown** | **Chinatown** | **Chinatown** | Financial District/Barbary Coast |
| 141 Portsmouth Square, **745 Kearny St**, 1.48364 ac / 64,627 sq ft | **Chinatown** | **Chinatown** | **Chinatown** | Financial District/Barbary Coast |
| 147 Washington Square, 600 Columbus Ave | **North Beach, Chinatown** | North Beach | North Beach, Russian Hill | North Beach, Telegraph Hill |
| 170 Woh Hei Yuen Playground, 922 Jackson St, 0.35613 ac / 15,513 sq ft | **Chinatown** | Nob Hill | Nob Hill | Nob Hill |

Every figure the finder gave is confirmed. **One overstatement:** the finder called Portsmouth
Square "**Uncontested**" on the strength of three matching fields. Its fourth field,
`realtor_neighborhood`, says Financial District/Barbary Coast. Three-of-four is still decisive and
the roster names the square as Chinatown's, so the ruling does not change — but "uncontested" is
not what the dataset says, and the author must not write it that way.

### 2.3 Civic Art moves the St Mary's Square straddle further from Chinatown

Two corrections the finder did not record:

1. **The Sun Yat-Sen statue carries accession number 1936.1.** The finder printed "—".
2. **Civic Art's own `analysis_neighborhood` field assigns BOTH the Sun Yat-Sen statue AND the
   Comfort Women's Column of Strength to "Financial District/South Beach"** — not Chinatown. The
   finder listed both in §8 without noting this.

That takes St Mary's Square from 2-against-2 to **four independent City attributions for the
Financial District** (Rec & Park `analysis`, Rec & Park `realtor`, Civic Art on the Bufano, Civic
Art on the Whyte) against **two for Chinatown** (Rec & Park `mons`, Rec & Park `planning`). I carry
that to the arbitrator with my recommendation. Everything else in §8 re-fetched clean: Goddess of
Democracy (Marsh, 1990, 1990.9), Take Root (Yung, 1996, 1996.7.a-i, 1135 Powell), Tectonic Melange
(Leong, 1999, 1999.18), the two Mary Fuller McChesney sets (1985.14.1-6 and 1999.19.x), Moon Face
(Donahue, 1994, 1999.20.a/b), Language of the Birds (Goggin and Keehn, 2008, T2009.1, Civic Art
nhood **Chinatown**), Auspicious Clouds | Heavy Fog (Arcega, 2018.4.a–g, 618–840 Broadway, creation
date genuinely null), Stenciled Fortunes (Rubin and Fletcher, 2002, 735 Vallejo), Robert Louis
Stevenson Memorial (Porter, 1894, 1897.2).

### 2.4 §3.4 is upheld in full, and it is the finder's best work

`63x5-g3m4`, Chinatown Historic District, verbatim: **`a10 = No`, `a11 = No`, `cr = Eligible`,
`nr = Eligible`**, `pos_1 = 1906-1930/1938`, origin note *"Local and NR, neither have been
formalized officially, Chinatown Historic Survey"*. The description string matches the finder's
quotation. Confirmed for comparison: Jackson Square HD `a10 = Listed`; San Francisco Cable Car
Historic District `cr = Listed`, `nr = Listed`; Commercial-Leidesdorff Conservation District
`a11 = Listed`; Washington Square HD and Upper Grant Avenue HD `cr = Eligible` only.

**The ruling stands: no Chinatown building may be written as "listed on the National Register."**
The finder's regex reading is also correct — I checked it against the gate: "eligible" is not in
`@designation_claim`, and "National Register" satisfies `@designation_citation` anyway.

I re-ran both landmark counts mechanically. **30** Article 10 centroids fall inside the DataSF
Chinatown polygon and **10** fall inside the finder's vernacular quadrilateral — both exactly as
claimed, and the ten are exactly Nos. 2, 33, 44, 122, 143, 167, 173, 228, 235 plus the Far East
Cafe placeholder. *(Nit: §3.3 says "Twenty-six of them are things no guide would call Chinatown."
The correct count of non-core rows is 25 landmarks plus the Far East Cafe `landmarkno = 0`
placeholder. Do not publish either number; neither is reader-facing.)*

*(§2's summary table says "Article 10 individual landmarks inside the vernacular boundary: **four**"
while §3.5 says ten. §3.5 is right and §2 means "core". Internal sloppiness, not an error of fact.)*

### 2.5 Both landmines are real. I detonated them myself.

- **Far East Cafe, 631-645 GRANT AV:** `landmarkno = "0"`, `yeardesignated = "0.0"`, no designation
  document. Its parcel reason string reads **"Article 10 Individual Landmark Work Program, National
  Register Historic District, California Register Historic District…"** — confirmed character for
  character. **It is not a designated landmark.** 40 rows carry `landmarkno = 0`. This is the
  single most valuable thing in the finder file.
- **Portsmouth Square pedestrian bridge:** demolition completion confirmed on Rec & Park's own
  construction update. It does not exist.

Parcel spot-checks, all confirmed: 125-129 Waverly 1911 · 109-115 Waverly 1907 · 1-15 Waverly 1908 ·
29-35 Waverly 1911 · 700-720 Grant 1906 · 615-625 Grant 1907 · 829-843 Grant 1908 · 1019-1029 Grant
1924 · **616-616 Grant 1900** (the Sing Chong artefact) · **838-838 Grant 1966** · **660-660
California 1966, reason "Article 11 Individual…"** (the Old St Mary's artefact) · 965-979 and
965-965 Clay 1932 "Article 10 Individual Landmark" · 1135-1135 Powell 1921 · 920-920 Sacramento
1908 · 626-636 Jackson 1925 · 840-846 Jackson 1910 CEQA B · 831-845 Jackson 2016 CEQA C "Not 45
years or older".

### 2.6 The CHL warning is correct — and I verified the regex myself

CHL 810 "SITE OF OLD ST. MARY'S CHURCH", 12/30/1965 · CHL 119 "PORTSMOUTH PLAZA", 3/29/1933 ·
CHL 87 "SITE OF FIRST U.S. BRANCH MINT IN CALIFORNIA", 3/29/1933 — all three present in the OHP
list. And the finder is right that a bare CHL citation **fails the gate**: `@designation_claim`
fires on "registered"/"listed"/"designated", and `@designation_citation` recognises only
`San Francisco Landmark … \d+`, `Article 10`, `National Register`, `NRHP`, `NR reference` and
`reference number \d{6,}`. "California Historical Landmark No. 119" matches none of them.
**Ruling: no CHL number publishes alone.** Exact permitted pairing wording is in §4, record 19.

### 2.7 Portsmouth Square, confirmed verbatim, plus a superlative the finder missed

*"CONSTRUCTION ADVISORY: Portsmouth Square is now closed for renovation through mid-2028."* —
verbatim. *"the demolition of the pedestrian bridge over Kearny Street was fully completed on
August 14."* — verbatim. *"The park is eligible for listing in the California Register of Historic
Resources for its role as an important cultural space for the Chinatown community"* — verbatim, and
it publishes, because "eligible" makes no designation claim.

**The same sentence on that page reads "…is one of San Francisco's most significant historic,
cultural, and civic spaces."** The finder caught this one. It **also** missed one on the Willie Wong
page: *"serves one of San Francisco's densest and most culturally celebrated neighborhoods."* Both
trip `@superlative_patterns` on `one of the most`. Added to the §5 excision list.

### 2.8 The library hours the finder told the author to publish are WRONG

The finder said SFPL's branch page "did not render its hours block to my fetch" and told the author
to use OSM's `Su 13:00-17:00; Mo,Fr 13:00-18:00; Tu-Th 10:00-20:00; Sa 10:00-18:00`. **I fetched
the page and it renders hours.** SFPL's own page:

> Sunday 1–5 PM · Monday 10 AM–6 PM · Tuesday 10 AM–8 PM · Wednesday 10 AM–8 PM ·
> Thursday 10 AM–8 PM · Friday 1–6 PM · Saturday 10 AM–6 PM

**OSM is wrong on Monday** (says 1–6 PM; the library says 10–6). The library's own site wins.
Replacement wording in §4, record 28.

### 2.9 Three operator conclusions the finder drew wrongly

1. **`matsuusa.org` and `hangahtearoom.com` both resolve DNS.** The finder said neither did.
   (`hangahteahouse.com` — a different domain the finder also names in §1 — genuinely does not.)
   This never reaches a reader, but it means the finder abandoned two operator hour-sources it
   could have had. Records 18 and 70 are downgraded to REWRITE for that reason.
2. **Buddha's Universal Church: "Since 1966, our members have kept the tradition of producing a
   bilingual musical production…" is on the church's OWN site.** Confirmed verbatim. The finder
   presented it as a publishable fact. **It is a trading-duration claim from the operator and it
   does not publish.** The finder applied this rule scrupulously to R&G Lounge and the fortune
   cookie factory and then missed it here.
3. **Great Star Theater's own site heads a series "A Century of Cultural Heritage (1925-2025)".**
   Confirmed. The finder correctly recorded it as the operator's own strapline. **It does not
   publish.** The 1925 date survives *only* because SF Planning's parcel record independently gives
   `yearbuilt = 1925` for 626-636 Jackson — that is a claim about the building, not about trading.
   Also confirmed on the theater's own site: **636 Jackson Street, San Francisco, CA 94133** and
   "Home of the Cantonese Opera". The **410 seats** figure is Wikipedia's, not the operator's.

Also confirmed verbatim and unchanged: Mister Jiu's 28 Waverly Place 94108 / Tue–Thu 5pm–9pm /
Fri & Sat 5pm–9:30pm / Sun & Mon closed / Moongate Lounge; CCC 667 Grant Ave 11 a.m.–6 p.m.
Thursday–Monday and 750 Kearny Street 3rd Floor Mezzanine 94108, office 9AM–6PM, (415) 986-1822 ext.
025; the fortune cookie factory's hours contradiction **and** its ZIP contradiction (94113 in one
block, 94133 in the other) on one page; Chinatown Alleyway Tours with no meeting point and no price.

**One fact the finder missed on a page it fetched:** cccsf.us/visit states *"The Mark Lai Learning
Center 750 Kearny Street, 3rd Floor **By Appointment**"*. That publishes.

---

## 3. THE ROSTER ALREADY SETTLED THE DRAGON GATE. IT IS NOT A STRADDLER.

The finder's §3.1 is factually flawless — the Dragon Gate, at 37.79075/−122.40584 and at Wikidata's
37.790685/−122.405585, tests **Financial District/South Beach** against the analysis polygon, whose
southern edge along Grant runs at about latitude 37.7924. I reproduced every row of that table.

**But it is not the arbitrator's to decide, because the roster already decided it.**
`priv/seed_data/san_francisco_roster.json`, `zones[chinatown].draw`, reads: *"The Dragon Gate at
Grant and Bush, Waverly Place, Tin How Temple, the Golden Gate Fortune Cookie Factory, Portsmouth
Square."* Four of the finder's candidates are named there by the roster itself. SF Planning's own
Chinatown Historic District description — which I re-fetched — runs the district *"between Broadway
and Bush"*, agreeing with the roster and against the analysis layer.

**Ruling: the Dragon Gate, Waverly Place, Tin How Temple, the Golden Gate Fortune Cookie Factory
and Portsmouth Square are Chinatown's. Do not escalate them. Do not narrate the disagreement.**

The analysis-polygon evidence is provenance and stops at this file's edge — `@method_patterns` bans
`\btests? (?:wholly|cleanly|inside|into)\b` and `\bno vertex\b|\bvertices\b`, and
`@self_reference_patterns` bans `\bbelongs? to \w+(?:'s)? (?:page|guide)\b`. The finder's own
vernacular quadrilateral is likewise unciteable, exactly as the finder said.

---

## 4. RECORD-BY-RECORD RULINGS

Format: **number — name — VERDICT — reason.** REWRITE rulings carry exact replacement wording; the
author uses it verbatim.

### §4 Streets, alleys and the gate

**1. Dragon Gate — PUBLISH.** Roster-named (§3). Design competition 1967 under Mayor Shelley,
Clayton Lee with Melvin H. Lee and Joseph Yee; roof tiles, roofing and guardian lions fabricated and
donated by the Republic of China in 1969; construction contract to Moreau Construction at
$90,889.15; dedicated 18 October 1970; restored 1995. Inscriptions 天下為公 and 忠孝仁愛. All
attributed to the aggregator. **DROP both rankings the finder flagged**, and drop "Built in 1969"
from the article lead in favour of the dedication date the article body gives.

**2. Grant Avenue — REWRITE.** Two problems. (a) The finder writes Dupont Street was named "for a
naval officer of the USS *Portsmouth*". Grant Avenue's Dupont derives from Samuel Francis Du Pont,
who commanded the *Cyane*, not the *Portsmouth*; the finder's own source for the *Portsmouth* is
the article it is paraphrasing loosely. Drop the ship. (b) "the blocks south of Bush are Union
Square's" is an editorial statement about coverage, not a fact. Use exactly:

> Grant Avenue runs north through Chinatown as 都板街, Du Pon Gai. It was called Dupont Street
> until the rebuilding that followed 1906, when it was renamed for President Ulysses S. Grant.
> Between Sutter and Geary two blocks were converted to two-way running in 2012 while Stockton
> Street was closed for Central Subway construction.

Parcel build years for the streetscape (700-720 Grant 1906, 715-717 1907, 733-741 1906, 824-843
1908, 900-916 1908, 942-951 1907, 1019-1029 1924) publish from SF Planning as building claims.

**3. Stockton Street — REWRITE.** Wikipedia's "frequented less often by tourists" is a comparison
against a class and an impression besides. Cut it. Use exactly:

> Stockton Street is Chinatown's produce and fish market street, lined with three- and four-storey
> buildings with shops at street level and flats above.

**4. Waverly Place — PUBLISH.** Roster-named. The nineteen parcel build years are the strongest
block of evidence in the file and all four I re-checked are exact. **DROP "the Street of Painted
Balconies"** — a guidebook coinage with no institutional source, as the finder says. The date range
publishes: the street was rebuilt in the decade after 1906.

**5. Ross Alley — PUBLISH.** Laid out 1849 beside Charles L. Ross's house; formerly Stout's Alley
for Dr Arthur Breese Stout; iron doors on gambling houses banned by city ordinance in 1889.
Attributed to the aggregator. **DROP "the oldest alley in San Francisco"** and the unattributed
brothel history.

**6. Spofford Street — DROP.** Seven parcel build years and a Chinese name. No history sourced. The
finder calls it weak and it is; the build years can sit inside Waverly Place's prose if wanted.

**7. Hang Ah Alley / Pagoda Place — DROP as a place, MERGE into record 45.** SF Rec & Park states
the containment in terms and I confirmed it verbatim. An alley wholly inside a park is not a
separate place. Move this sentence into Willie Wong Playground:

> At the park's western edge, Hang Ah Alley lies wholly within the park boundary.

**8. Beckett Street — DROP as a place.** Former names from an aggregator whose own sourcing includes
a blog, plus one parcel year. Its only substance is the Ma-Tsu Temple at No. 30; that fact belongs
to record 18.

**9. Walter U. Lum Place — DROP as a place, MERGE into record 43.** Its sourced content is that it
forms Portsmouth Square's western boundary. The October 2026 sewer works are a transient
construction note about a park that is shut until 2028. Move only this into Portsmouth Square:
"Walter U. Lum Place forms the square's western boundary."

**10. Old Chinatown Lane — DROP.** Three former names from an aggregator and nothing else.

**11. Commercial Street — ESCALATE.** Chinatown ↔ Financial District. PIP puts 608 and 565
Commercial in Chinatown; the roster's Financial District draw names Jackson Square and the Wells
Fargo History Museum, which is where this street's material sits. Commercial-Leidesdorff
Conservation District `a11 = Listed` confirmed and handed on. **DROP the Ferry Building comparison.**
My recommendation: Financial District.

**12. Jack Kerouac Alley — ESCALATE.** Chinatown ↔ North Beach. The alley's own definition is that
it joins Grant to Columbus and continues as William Saroyan Alley. My recommendation: North Beach,
which owns City Lights by roster and to whose page this alley is an appendix. The CHSA's first
permanent home at 17 Adler Place (1966) survives regardless and belongs to record 26.

**13. Stockton Street Tunnel — ESCALATE.** Chinatown ↔ Union Square ↔ Nob Hill. North portal
Sacramento, south portal Bush. The grade figures (18%, 12%, 4.29%) are **measurements and publish** —
the gate's own specimen is "The cable car climbs a grade of 21 percent." Handing them on intact.

**14. Broadway Tunnel — DROP.** The finder fetched no dedicated source and says so. Nothing to ship.

**15. The remaining named alleys — DROP as a class.** An aggregator sourced to three external links
including a blog, which does not distinguish official Chinese names from alternates and says so.
The Chinese names must not be presented as official.

### §5 Temples, churches and missions

**16. Tin How Temple — REWRITE.** Roster-named, so it ships. Two excisions. (a) The **hours**
("daily 10:00–15:00, admission free with the attendant's permission") come from Wikipedia, not from
the temple. An aggregator is not an operator for opening hours. **Drop them.** (b) The address 125
Waverly Place is supported by the parcel record 125-129 Waverly (1911, CEQA A, confirmed) and by
Wikidata's coordinate, which PIPs into Chinatown — that is enough for the street number. Use:

> Tin How Temple occupies the top floor of a building at 125 Waverly Place and is dedicated to the
> sea goddess Mazu, known in Cantonese as Tin How. The Sue Hing Benevolent Association, which had
> acquired the temple before the 1906 fire, put up the present four-storey building on the site and
> reopened the temple in 1910; SF Planning records the building's construction year as 1911. The
> temple closed in 1955 and reopened on 4 May 1975. Photography is not permitted inside. No source
> states its opening hours, so none are given here.

**DROP both rankings.** The hedged c. 1852–53 founding may be written only as the aggregator hedges
it, or omitted; I prefer omitted.

**17. Kong Chow Temple — REWRITE.** The address conflict is unresolved and 855 Stockton has no
parcel row. **Ship with no street number.** Use:

> Kong Chow Temple stands on Stockton Street above the post office and is dedicated to Guan Di. The
> association behind it was founded in 1849 and took the name Kong Chow Clan Association in 1854.
> The temple was destroyed in 1906 and rebuilt on its original Pine Street site; the present
> building dates from 1977. A prediction slip drawn by Bess Truman on a visit in 1948 is displayed
> inside.

**18. Ma-Tsu Temple of U.S.A. — REWRITE.** 30 Beckett Street, 94133, confirmed by OSM and by parcel
26-30 Beckett (1908). Founded 1986, moved from Grant Avenue to Beckett Street in 1996 — from
Wikipedia and Wikidata, **not** from the operator, so the founding year publishes. **But
`matsuusa.org` resolves.** Fetch it for hours before shipping. If it gives none, the sanctioned
sentence is "No source states its opening hours, so none are given here."

**19. Old St Mary's — PUBLISH.** **San Francisco Landmark No. 2, designated 1968** — confirmed at
660-680 California Street. 660 California Street, 94108, at Grant Avenue. Cornerstone 17 July 1853,
dedicated at Christmas midnight mass 1854, Gothic Revival by William Craine and Thomas England,
brick round Cape Horn and granite cut in China, cathedral until 1891, gutted by fire in 1906 with
only the brick walls and bell tower standing. Clock inscription "Son, observe the time and fly from
evil." **DROP both rankings. DROP the parcel `yearbuilt = 1966`** — confirmed as the modern parish
building on the same parcel. If the California landmark is wanted, the **only** permitted form
pairs it with the SF number in one sentence:

> Old St Mary's is San Francisco Landmark No. 2, designated in 1968, and the site is also
> California Historical Landmark No. 810, listed on 30 December 1965.

**No hours.** oldsaintmarys.org's mass-times URL was not found; write "No source states its mass
times, so none are given here", or chase the working URL first.

**20. Buddha's Universal Church — REWRITE.** 720 Washington Street; SF Planning gives the building
1964. **DROP the "Since 1966" musical claim** — operator trading duration, confirmed by me on the
church's own site (§2.9). **DROP the Zoom schedule and the tour arrangement** — the site is
demonstrably stale, still leading on COVID-19. Ship the thin version:

> Buddha's Universal Church is a Buddhist church at 720 Washington Street. SF Planning records the
> building's construction year as 1964.

**21. First Chinese Baptist Church — PUBLISH.** 15 Waverly Place; parcel 1-15 Waverly 1908
confirmed. Founded 1880 by J. B. Hartwell as a Southern Baptist mission; permanent church at
Waverly Place and Sacramento Street from 1888; the congregation left over Mayor Kalloch's
anti-Chinese politics and became Northern Baptist; the building burned in 1906 and the congregation
relocated to Oakland while it was rebuilt.

**22. Presbyterian Church in Chinatown — DROP.** 925 Stockton is unconfirmed and OSM puts a
different body at that door. A place record with no confirmed address is not a place record. The
1853 Speer material may go in guide prose without an address. **DROP the ranking.**

**23. Chinese United Methodist Church — DROP.** An address and a build year. The finder calls it
weak; agreed.

**24. St Mary's Chinese Catholic Center / Mission and schools — DROP.** Four addresses for two or
three institutions, untangled by nobody. Publishing any of them asserts a containment that may be
false.

**25. Notre-Dame-des-Victoires — ESCALATE, and DROP from Chinatown.** **San Francisco Landmark No.
173, designated 1984**, 564-566 Bush Street — confirmed and handed on so the receiving zone need
not re-find it. It is the French national parish, it sits on Bush, and it PIPs to Financial
District. The finder's own honest reading is that it is not Chinatown's and I agree. My
recommendation: Union Square.

### §6 Museums, institutions and civic buildings

**26. CHSA Museum and Learning Center — PUBLISH.** **San Francisco Landmark No. 122, "Clay Street
Center", designated 1981** — confirmed, 965 Clay Street. Parcel `yearbuilt = 1932` confirmed.
**Hours: Wed & Sat 10 a.m.–5 p.m., from the society's own site — I re-fetched it; it beats OSM.**
The building is the Chinatown YWCA, designed by Julia Morgan, built 1932, sold to CHSA in 1996; the
museum opened in the building in November 2001. Society incorporated 5 January 1963; earlier homes
at 17 Adler Place from 1966 and 650 Commercial Street from June 1989. Collection: twelve *Gum Shan*
paintings by Jake Lee, and James Leong's *One Hundred Years: History of the Chinese in America* on
permanent display. **DROP the lead ranking. DROP the two awards** (2004 National Trust, 2005
California Heritage Council) — single-source, aggregator-only, and they read as promotion.
"Lantern on the Hill" publishes as an attributed nickname.

**27. Chinese Culture Center — PUBLISH**, on 667 Grant Avenue. Confirmed verbatim: CCC Art Center &
Design Store, 667 Grant Avenue, 11 a.m.–6 p.m., Thursday to Monday; CCC Office, 750 Kearny Street,
3rd Floor Mezzanine, 94108, office hours 9 a.m.–6 p.m., (415) 986-1822 ext. 025. **Add the fact the
finder missed: the Him Mark Lai Learning Center at 750 Kearny, 3rd Floor, is by appointment.**
Non-profit established 1965; the Chinese Culture Foundation incorporated 15 October 1965. Because
750 Kearny sits inside the Hilton (record 89, escalated), anchor the record on 667 Grant.

**28. Chinatown / Him Mark Lai Branch Library — PUBLISH, with rewritten hours.** **San Francisco
Landmark No. 235, "Chinatown Branch Carnegie Library", designated 2002** — confirmed, 1135 Powell
Street. Parcel `yearbuilt = 1921` confirmed. Full official branch name "Chinatown/Him Mark Lai",
1135 Powell Street, 94108, 415 355-2888. **Do not use the finder's OSM hours; they are wrong on
Monday.** Use the library's own, which I re-fetched:

> Sunday 1–5pm; Monday 10am–6pm; Tuesday to Thursday 10am–8pm; Friday 1–6pm; Saturday 10am–6pm.

Photo wave: the façade carries Rene Yung's *Take Root* (1996), artist living — blocked.

**29. Donaldina Cameron House — PUBLISH.** **San Francisco Landmark No. 44, designated 1971** —
confirmed, 920 Sacramento Street. Parcel `yearbuilt = 1908` confirmed; do not merge with the 1982
building on the adjoining parcel. The Presbyterian Women's Occidental Board organised 1873; the
Mission House formed in Chinatown 1876 under Margaret Culbertson, first in a wooden building at 933
Sacramento Street; Donaldina Cameron joined 1895. **DROP "Founded in 1874"** — a trading-duration
claim from the charity's own site, and it contradicts the history besides. **DROP "Tien Fuh Wu
Way"** until someone confirms it is an official street name.

**30. Great Star Theater — PUBLISH.** 636 Jackson Street, 94133, confirmed on the theater's own
site; 415 735-4159. Parcel `yearbuilt = 1925` confirmed — **that is the source for 1925, not the
operator's centenary strapline, which does not publish.** Built as the Great China Theater for
Chinese opera; 410 seats; the Pacific Chinese Dramatic Club took offices there in 1930; Bruce Lee
appeared as an infant in *Golden Gate Girl* (1941, dir. Esther Eng); refurbished from 2010;
reopened 18 June 2021 by Alice Chu and Roger Pincombe. "Home of the Cantonese Opera" publishes as
the operator's own self-description. **DROP both rankings. DROP the 2015 death investigation and
the ghost-tour material** — I agree with the finder without reservation.

**31. San Francisco Historical Society Museum — ESCALATE, and DROP from Chinatown.** **San
Francisco Landmark No. 34, "U.S. Mint & Subtreasury Building", designated 1970**, 608-610
Commercial Street — confirmed and handed on. PIP says Chinatown; the roster gives the Financial
District the Wells Fargo History Museum and Jackson Square, which is the shelf this belongs on.
My recommendation, and the finder's: Financial District.

**32. Chinese Consolidated Benevolent Association — PUBLISH.** 843 Stockton Street; parcel
`yearbuilt = 1908`. Organised in the 1850s and formally established 1882; known in English as the
Chinese Six Companies; its members came mainly from eight districts on the west side of the Pearl
River Delta.

**33. Chinese American Citizens Alliance — PUBLISH.** 1044 Stockton Street; parcel 1040-1044
Stockton `yearbuilt = 1920`, which corroborates the early-1920s completion. Founded 1895 as the
Native Sons of the Golden State, renamed 1915; lodges chartered in Los Angeles 1914, San Francisco
1915 and Oakland 1917; twenty local lodges as of 2026 — a count, and it publishes. **DROP the
ranking.**

**34. Bing Kong Tong Benevolent Association — PUBLISH, thin.** 35 Waverly Place, 94108, 415
982-2551; parcel 29-35 Waverly `yearbuilt = 1911` confirmed. It has a confirmed address, a phone
and a build year, and it is one of the halls that give Waverly Place its substance. **No history
publishes** — the finder did not fetch the article it knew existed. Ship the address and the build
year only, or fetch the article first.

**35. Other family and district association halls — DROP.** No sourced street addresses.

**36. Nam Kue School — DROP.** A build year and an address, and it is a working school.

**37. Gordon J. Lau Elementary School — DROP as a place record.** A functioning elementary school
with no visitor access. The history — opened September 1859 as a segregated public school for
Chinese children, later the Oriental Public School, renamed 1998 for the city's first Chinese
American supervisor, against the 1860 state law barring "Negroes, Mongolians, and Indians" from the
public schools — is strong and belongs in guide prose, not in a place card.

**38. Chinese Hospital — PUBLISH.** 845 Jackson Street, 94133, 415 982-2400. **Two buildings, two
dates, confirmed by me: 831-845 Jackson `yearbuilt = 2016`, CEQA C; 840-846 Jackson `yearbuilt =
1910`, CEQA B. Do not merge them.** Origins in 1899 with the Oriental Dispensary; the Tung Wah Yi
Kuk opened at 828 Sacramento Street and moved after 1906 to 14 Trenton Street. Bruce Lee was born
here on 27 November 1940. Operates the Chinese Community Health Plan. **DROP "the only Chinese
hospital in the United States"** — it trips `@superlative_patterns` on "the only" and it is a
ranking. Write it from the street; do not imply visitor access.

**39. Chinese Telephone Exchange / Bank of Canton — REWRITE.** 743 Washington Street; parcel
`yearbuilt = 1909`, CEQA A. **DROP the 1949 closure and the 1960 Bank of Canton purchase** — their
only source is `sanfranciscochinatown.com`, a commercial promotion site, and the finder says so
itself. **Do not repeat the parcel reason string as an NRHP listing** (§2.4). Ship:

> The building at 743 Washington Street housed the Chinese Telephone Exchange. SF Planning records
> its construction year as 1909.

This is a genuine research gap on one of Chinatown's best-known buildings and it should be filled
before the file ships if anyone has budget for it.

**40. Chinatown Alleyway Tours — DROP.** I re-fetched the site: no meeting point, no price, no
schedule. A tour with no meeting point cannot be written honestly.

**41. Chinatown YMCA — DROP.** No address established.

**42. Far East Cafe — PUBLISH as a restaurant, with an absolute prohibition.** 631-645 Grant
Avenue; parcel `yearbuilt = 1908`, CEQA A. **It is NOT a designated landmark** (§2.5). No sentence
in this file may contain "landmark", "designated", "listed" or "registered" in connection with it.
It ships as a Grant Avenue restaurant in a 1908 building and nothing more.

### §7 Parks and squares

**43. Portsmouth Square — PUBLISH, and the closure leads.** Roster-named. **Address: use 745 Kearny
Street** (Rec & Park's own property dataset, property 141) or no number; do not use 733, which is
the garage. 1.484 acres / 64,627 square feet. **"Portsmouth Square is closed for renovation through
mid-2028"** — confirmed verbatim and it is the most important operational fact in the zone.
Demolition of the Kearny Street pedestrian bridge was completed on 14 August 2026. The renovation
will bring an outdoor event space with an elevated stage, an 8,500 sq ft clubhouse, a shade
structure and a consolidated playground. Rec & Park states the park is eligible for listing in the
California Register of Historic Resources — **"eligible", never "listed"**. Dated events publish:
platted circa 1835, renamed after the USS *Portsmouth* in 1846, Captain Montgomery raised the flag
with 17 men on 9 July 1846, Sam Brannan announced the gold discovery on 11 May 1848, a refugee camp
after 1906. **DROP all three rankings**, including Rec & Park's own. If CHL 119 is wanted it must
be paired as in record 19; I recommend omitting it. **DROP the garage source** — the fortune cookie
factory citing a third party is not a source for garage hours. Add Walter U. Lum Place as the
western boundary (record 9).

**44. St Mary's Square — ESCALATE, and DROP from Chinatown.** DataSF contradicts itself and the
re-fetch moved the balance further from Chinatown: **four City attributions for the Financial
District against two for Chinatown** (§2.3). The Sun Yat-Sen statue, the Column of Strength and the
Rose Pak Memorial Tree all inherit the ruling. My recommendation: Financial District.

**45. Willie "Woo Woo" Wong Playground — PUBLISH.** **Address: use 830 Sacramento Street**, the
number on Rec & Park's own project page and in OSM; note the dataset says 850. Three of four City
attributions say Chinatown. 0.656 acres / 28,591 square feet. Named for the Chinese American USF
basketball player Willie "Woo Woo" Wong; two sand-floor playgrounds, tennis and volleyball courts,
a clubhouse with a rooftop basketball court, on a terraced hillside site. **$14.5 million** budget
from the 2012 Clean and Safe Neighborhood Parks Bond and the Downtown Parks Fund; completed and
open to the public February 2021. Add the Hang Ah Alley containment sentence from record 7. Add the
sourced historical note: 828 Sacramento Street, the site the park now occupies, was where the Tung
Wah Yi Kuk opened in 1899. **DROP the sfrecpark page's "one of San Francisco's densest and most
culturally celebrated neighborhoods"** — the finder missed this one (§2.7).

**46. Woh Hei Yuen Park — ESCALATE, and DROP from Chinatown.** Confirmed: `analysis` says
Chinatown, `mons`, `planning` and `realtor` all say Nob Hill. Three to one against. My
recommendation: Nob Hill.

### §8 Monuments and public art — none ships as a place

**47–55, 57, 58 — DROP as place records.** Every one is an artwork inside another place (Portsmouth
Square, St Mary's Square, the library, Woh Hei Yuen) and every one is photo-blocked. They are prose
material for their parent records and photo-wave notes, nothing more. The finder's copyright
analysis is sound and its two Civic Art errors are corrected in §2.3. **DROP the "just around the
corner" line from the Stevenson article** — it is on `@proximity_patterns` verbatim.

**56. Language of the Birds — ESCALATE with record 12.** Civic Art assigns it `Chinatown`; it sits
at Columbus and Broadway, which is the Kerouac Alley seam. Rides with whatever the arbitrator says
about that corner. Artists living — blocked.

**59. Rose Pak Memorial Tree — DROP from Chinatown**, rides with record 44.

**60. Historic Asian Memorials at St Mary's Square — DROP.** Two OSM nodes with a name and no other
tag. Nobody knows what they are.

**61. Ping Yuen Mural — DROP.** No artist, no date, and therefore blocked for photography by
default. **DROP the "largest murals in Chinatown" ranking.**

**62. Chinatown–Rose Pak station artworks — DROP as records**, keep as prose inside record 63. All
four artists living; all blocked. Carin Mui's couplet and its translation publish as text.

### §9 Transport

**63. Chinatown–Rose Pak station — PUBLISH.** Under Stockton Street at Washington; opened 19
November 2022 as part of the Central Subway; named for Rose Pak; designed by Kwan Henmi; the
structure extends 100 feet below ground and carries a 5,400 sq ft plaza on its roof. The
construction history publishes: the building at 933-949 Stockton, housing 56 low-income residents,
was acquired by eminent domain and demolished, and residents were relocated to a new building at
Broadway and Sansome with $8 million from the SFMTA among other grants. **DROP all three rankings,
including John King's — an attributed ranking is still a ranking.**

**64. California Street cable car line at Grant Avenue — DROP as a place; ESCALATE the
designation.** NRHP reference number **66000233** is confirmed — National Historic Landmark,
certified 15 October 1966, address given as 1390 Washington Street, which is Nob Hill. The
designation is one object spanning at least four rostered zones and the roster has already given
the Cable Car Museum to Nob Hill and the Powell and Market turntable to Union Square. Chinatown's
honest claim is that the California Street line crosses Grant Avenue; that is a sentence for guide
prose with **no designation claim attached**, not a place card.

### §10 Eating, drinking and shopping

**65. Mister Jiu's — PUBLISH.** 28 Waverly Place, 94108. Hours confirmed verbatim from the
operator: Tue–Thu 5pm–9pm; Fri & Sat 5pm–9:30pm; Sun & Mon closed. Reservations online only.
Moongate Lounge upstairs. **DROP the Michelin quotation** — an attributed ranking, and it trips
`@superlative_patterns` on "one of the most".

**66. R&G Lounge — REWRITE.** 631 Kearny Street, 94108, 415 982-7877 publish. **DROP "serving our
patrons since 1985"** (operator trading duration) **and "winning numerous awards"** (unnamed
awards). The hours are OSM's; either verify them on rnglounge.com or omit them. Ship the address
and phone with no hours rather than second-hand hours.

**67. Z & Y Restaurant — PUBLISH, thin.** 655 Jackson Street; parcel 655-657 Jackson 1907. No hours
captured; write none.

**68. Great Eastern Restaurant — PUBLISH, thin.** 649 Jackson Street; parcel 647-649 Jackson 1908.
Hours are OSM's — omit or verify on greateasternsf.com.

**69. House of Nanking — PUBLISH, thin.** 919 Kearny Street. Hours are OSM's — omit or verify.

**70. Hang Ah Tea Room — REWRITE.** 1 Pagoda Place, 94108, 415 982-5686; parcel 1-1 Pagoda Place
1911. **The finder's premise is false: `hangahtearoom.com` resolves.** Fetch it for hours before
shipping. Do not publish OSM hours as the operator's.

**71. Sam Wo — PUBLISH.** 713 Clay Street, 94108; parcel 713-721 Clay 1912. The earlier restaurant
at 813 Washington Street closed in 2012; the business reopened on Clay Street in 2015; it closed
briefly in 2025 and reopened the same year under new management. Edsel Ford Fung, who died in 1984,
worked there in the 1960s and some of his signs survive. **DROP every ranking**, and **DROP 1912 as
a founding year** — the article itself says nothing is documented and gives a competing 1907. The
1912 figure survives only as SF Planning's construction year for the Clay Street building.

**72. Good Mong Kok Bakery — PUBLISH, thin.** 1039 Stockton Street, 94108, 415 397-2688. Hours are
OSM's — omit or verify on goodmongkokbakery.com.

**73. Golden Gate Bakery — DROP.** An address and a parcel year. No hours, no website, no operator
source, and "known for closing without notice" has no source at all. There is nothing here a guide
can honestly tell a reader.

**74. Eastern Bakery — PUBLISH.** 720 Grant Avenue; parcel 700-720 Grant 1906. The OSM hours carry
no day specification and are unusable — omit them. **The two-door fact publishes and is well made:**
its Commercial Street side entrance is Sullivan's Grotto at 776 Commercial Street, a location in
the 1950 film *Woman on the Run*. That is a physical relation between two named addresses, not
orientation by impression.

**75. Empress by Boon — DROP.** No operator source, no article, and the name change from Empress of
China is unsourced. The building's 1966 parcel year may be mentioned inside Grant Avenue's prose.

**76. China Live — ESCALATE.** Chinatown ↔ North Beach. 644 Broadway, 94133; PIP says Chinatown,
Nominatim says Telegraph Hill, and Broadway is the conventional northern edge. No hours captured.
Whichever zone takes it must fetch chinalivesf.com for hours.

**77. Li Po Cocktail Lounge — PUBLISH as `restaurant`.** 916 Grant Avenue, 415 982-0072; parcel
900-916 Grant 1908. **DROP the OSM `start_date = 1937`** — an uncited tag. On the kind: the schema
has no `bar`, and `Ethos.Places.Place.kinds/0` is a closed list the gate reads directly.
`restaurant` is the nearest honest fit and `attraction` would be worse. Ship as `restaurant`.

**78. Bow Bow Cocktails — DROP.** No address.

**79. Buddha Lounge — DROP.** No address; 901 Grant is convention, not a source.

**80. Four Kings — DROP.** No address at all.

**81. Golden Gate Fortune Cookie Factory — PUBLISH.** Roster-named. 56 Ross Alley, main entrance off
Ross Alley between Jackson and Washington; 415 781-3956. **ZIP 94133** — I confirmed both numbers
appear on the one page and that 94113 is not a San Francisco ZIP. **Publish no hours**: the
operator's own page gives 9 a.m.–7 p.m. in one block and 9 a.m.–6 p.m. in another, and a page
cannot pick between them. Use: "The factory's own site states two different sets of opening hours,
so none are given here." The **10,000 cookies a day** figure is a measurement and publishes. The
**50-cent charge for photographs** is a fact about the place; attribute it to the aggregator or
omit. **DROP "Handmade In San Francisco Since 1962"** — confirmed by me on the operator's own site,
and a trading-duration claim.

**82. The Wok Shop — PUBLISH.** 718 Grant Avenue, 94108, 415 989-3797; parcel 700-720 Grant 1906.
Hours are OSM's — verify on wokshop.com or omit.

**83. Chinatown Kite Shop — PUBLISH, thin.** 717 Grant Avenue; parcel 715-717 Grant 1907. No hours,
no website.

**84. Red Blossom Tea Company — PUBLISH, thin.** 831 Grant Avenue, 415 395-0868; parcel 829-843
Grant 1908. No hours captured.

**85. Vital Tea Leaf — DROP.** No confirmed street number.

**86. Ten Ren Tea — DROP.** A parcel row and nothing else.

**87. New Asia Market — DROP.** An OSM-only address with no hours, no website and no second source.

### §11 Housing, hotels and buildings

**88. Ping Yuen — PUBLISH as a historic-site, written from the street.** Four buildings along
Pacific Avenue, 434 apartments; West, Central and East dedicated 1951, North Ping Yuen 1961; the
formal effort began 1939; each apartment had its own bathroom and kitchen from 1951, unlike the
single-room-occupancy housing typical of the quarter; the murder of Julia Wong in 1978 prompted a
residents' rent strike led by the future mayor Ed Lee; ownership passed from the city to the
Chinatown Community Development Center in 2016. **DROP both rankings and the 1939 slum quotation.**
It is occupied housing; imply no access.

**89. Hilton San Francisco Financial District — ESCALATE, and DROP from Chinatown.** The hotel calls
itself the Financial District and Wikipedia calls the site the border. **DROP CHL 192 outright** —
it is not in the OHP list (§2.1). The Chinese Culture Center's tenancy is written on record 27 from
667 Grant, so Chinatown loses nothing.

**90. International Hotel / Manilatown Center — ESCALATE, and flag the roster.** 868 Kearny Street.
PIP says Chinatown; the place's own identity is **Manilatown**, which is not one of the
twenty-three rostered zones. The eviction of all tenants on 4 August 1977, the 1981 demolition and
the 2005 reopening are strong, sourced history with nowhere honest to go. This is the one straddler
where the roster itself is the problem, and the arbitrator should say so.

**91. Sing Chong Building — REWRITE.** 616 Grant Avenue at California Street. **DROP the parcel
`yearbuilt = 1900`** — confirmed as the dataset value and, as the finder says, an artefact, since
the corner burned in 1906. **DROP "one of the first places rebuilt"** — a ranking, and from the
weakest source in the file. Ship with no date:

> The Sing Chong Building stands at 616 Grant Avenue on the corner of California Street, facing the
> Sing Fat Building across the intersection.

**92. Sing Fat Building — DROP.** No address established; it survives only as the sentence above.

**93. Golden Dragon Restaurant site — DROP.** The restaurant closed in 2006 and the place no longer
exists. I agree with the finder without qualification: a mass-shooting site is not a travel entry,
and the material available is lurid.

**94. Portsmouth Square Pedestrian Bridge — DROP, and record why.** **Demolished; completion
confirmed 14 August 2026 on Rec & Park's own construction update.** Guidebooks still describe it as
standing. It must not appear as an existing place, and its skateboarding history ("China Banks")
must not be written in the present tense. Keep it in this verdicts file so a later wave does not
re-add it from a stale source.

**95. Norras Temple — DROP.** The address is a guidebook convention the finder could not
corroborate; no article, no OSM node, no operator site.

### §12 Places inside DataSF's Chinatown that belong to somebody else

**96–100 — DROP from Chinatown, ESCALATE with their identifiers so the receiving zone need not
re-find them.** All confirmed by me: Jackson Square Historic District (**Article 10 Appendix B,
listed 9 August 1972**, and **NRHP 71000186, listed 18 November 1971**, period 1850–1911) · City
Lights Bookstore (**San Francisco Landmark No. 228, 261-271 Columbus Avenue, designated 2001**) —
**North Beach's by roster, not arguable** · Sentinel Building / Columbus Tower (**San Francisco
Landmark No. 33, 916-920 Kearny Street, designated 1970**) · Met Life–Pacific Coast Head Office
(**San Francisco Landmark No. 167, 600 Stockton Street, designated 1984**) · PG&E Substation J
(**NRHP 86003514**, 29 Dec 1986, and **SF Landmark No. 142**, 1981) · Federal Reserve Bank of San
Francisco (**NRHP 89000009**, 31 Jul 1989, and **SF Landmark No. 158**, 1983) · Colombo Building
(**NRHP 07001469**, 31 Jan 2008; **SF Landmark No. 237** as Drexler/Colombo, 1-33 Columbus, 2002) ·
NIANTIC storeship (**NRHP 91000563**, 16 May 1991).

---

## 5. CLAIM-LEVEL EXCISIONS INSIDE SURVIVING RECORDS

Twenty-four strings that must not reach a reader even though their record ships.

1. Every superlative in the finder's §14.1 list — all 18 of them, without exception, attributed or
   not. The finder assembled that list correctly and it is the most useful page in the file.
2. Rec & Park's **"one of San Francisco's most significant historic, cultural, and civic spaces"**
   (Portsmouth Square page) — confirmed present by me.
3. Rec & Park's **"serves one of San Francisco's densest and most culturally celebrated
   neighborhoods"** (Willie Wong page) — **the finder missed this one.**
4. The sfrecpark.org footer boilerplate on **every** page: "In 2017, San Francisco became the first
   city where every resident lives within a 10-minute walk of a park." A writer copying park text
   will lift this by accident.
5. **"just around the corner"** from the Robert Louis Stevenson article — on `@proximity_patterns`
   verbatim.
6. Every founding year taken from an operator's own site: **"Handmade In San Francisco Since 1962"**
   (fortune cookie factory), **"serving our patrons since 1985"** (R&G Lounge), **"Founded in
   1874"** (Cameron House), **"Since 1966"** (Buddha's Universal Church), **"A Century of Cultural
   Heritage (1925-2025)"** (Great Star Theater). The last two are mine, not the finder's.
7. **"winning numerous awards"** (R&G Lounge) and the two CHSA preservation awards.
8. **California Historical Landmark No. 192** — it does not exist in the register the finder cites.
9. Any bare CHL citation for Nos. 119, 810 or 87 — the register exists but the gate's citation
   regex does not know it. Pair with an SF Landmark number or drop.
10. Any sentence describing a Chinatown building as **"listed on the National Register"**. The
    correct word is **eligible**, and only for the district.
11. Any designation word attached to the **Far East Cafe**.
12. The parcel `yearbuilt` values **1966** (Old St Mary's), **1900** (Sing Chong) and **1966**
    (838 Grant).
13. The **1949** and **1960** dates for the Chinese Telephone Exchange.
14. The OSM tag **`start_date = 1937`** for Li Po.
15. The finder's **vernacular quadrilateral**, all point-in-polygon results, all HTTP outcomes, the
    Nominatim `address.neighbourhood` trap, and the DNS notes. All provenance; all stop here.
16. Wikipedia's **"frequented less often by tourists"** for Stockton Street.
17. **"the Street of Painted Balconies"** for Waverly Place.
18. **Tin How Temple's hours** as given by an aggregator.
19. The **library's OSM hours** — wrong on Monday.
20. The **fortune cookie factory's hours** — the operator contradicts itself.
21. **ZIP 94113** anywhere.
22. The garage citation sourced to the fortune cookie factory's parking list.
23. The **2015 Great Star death investigation** and ghost-tour material.
24. The **1939 "worst slum in the world"** quotation about Ping Yuen.

---

## 6. STRADDLERS ESCALATED — 17

Chinatown's author writes none of these.

| # | Object | Contest | My recommendation |
|---|---|---|---|
| 11 | Commercial Street | Chinatown ↔ Financial District | Financial District |
| 12 | Jack Kerouac Alley | Chinatown ↔ North Beach | North Beach |
| 13 | Stockton Street Tunnel | Chinatown ↔ Union Square ↔ Nob Hill | Union Square (south portal is the visitor-facing end) |
| 25 | Notre-Dame-des-Victoires (SF Landmark 173) | Chinatown ↔ Union Square | Union Square |
| 31 | SF Historical Society Museum (SF Landmark 34) | Chinatown ↔ Financial District | Financial District |
| 44 | St Mary's Square, + Sun Yat-Sen, Column of Strength, Rose Pak Tree | Chinatown ↔ Financial District ↔ Union Square | **Financial District — 4 City attributions to 2, see §2.3** |
| 46 | Woh Hei Yuen Park | Chinatown ↔ Nob Hill | Nob Hill — 3 to 1 |
| 56 | Language of the Birds | Chinatown ↔ North Beach | rides with 12 |
| 64 | Cable car system (NRHP 66000233) | four zones at once | none of them; a system-wide designation |
| 76 | China Live | Chinatown ↔ North Beach | North Beach |
| 89 | Hilton SF Financial District | Chinatown ↔ Financial District | Financial District |
| 90 | International Hotel / Manilatown Center | Chinatown ↔ Financial District ↔ **Manilatown, unrostered** | **flag the roster** |
| 96 | Jackson Square Historic District | Chinatown ↔ Financial District | Financial District |
| 97 | City Lights Bookstore | — | **North Beach, by roster. Not arguable.** |
| 98 | Sentinel Building / Columbus Tower | Chinatown ↔ North Beach ↔ Jackson Square | North Beach |
| 99 | Met Life, 600 Stockton | Chinatown ↔ Union Square ↔ Nob Hill | Union Square |
| 100 | PG&E Substation J, Federal Reserve, Colombo, NIANTIC | Chinatown ↔ Financial District | Financial District |

**Not escalated, because the roster already ruled:** the Dragon Gate, Waverly Place, Tin How Temple,
the Golden Gate Fortune Cookie Factory and Portsmouth Square. See §3.

---

## 7. WHAT THE FINDER GOT WRONG

The evidence base is unusually sound. Every designation number, every parcel, every neighborhood
attribution, both landmine flags and the entire boundary analysis reproduce exactly. The errors are
all of the same kind — **it under-fetched, then reasoned from the gap** — and there are five.

1. **The library hours.** It declared SFPL's own page unable to render hours and told the author to
   publish OSM's. The page renders hours and OSM is wrong on Monday. A reader would have been sent
   to a closed library.
2. **Two domains it called dead are alive.** `matsuusa.org` and `hangahtearoom.com` both resolve.
   Two operator hour-sources were abandoned on a false premise.
3. **It applied its own trading-duration rule unevenly.** It caught the fortune cookie factory,
   R&G Lounge and Cameron House, then published Buddha's Universal Church's "Since 1966" as fact and
   let the Great Star's own centenary strapline stand beside a parcel year that does the same work
   legitimately.
4. **It missed two superlatives on pages it fetched** — one on the Willie Wong project page, and the
   sfrecpark footer boilerplate that sits on every one of them.
5. **It called Portsmouth Square's attribution "uncontested"** when the fourth field says Financial
   District/Barbary Coast, and it printed no accession number for the Sun Yat-Sen statue while
   missing that Civic Art assigns that statue and the Column of Strength to the Financial District —
   the two facts that decide the St Mary's Square straddle.

Against that: **CHL 192, the one designation the finder itself refused to certify, is the one that
died on re-fetch.** Its instinct about its own evidence was correct.
