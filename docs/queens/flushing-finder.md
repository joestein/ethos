# Flushing, Queens — FINDER candidate file

**Role:** Finder only. Nothing below is verified, confirmed, or adjudicated. Every entry is a
CANDIDATE awaiting the verifier. Where I put text between quotation marks, it is copied
character-for-character from the cited page as I retrieved it. Where I am summarizing in my own
words, the line is marked `[PARAPHRASE]`. Where a source is an aggregator rather than a primary or
institutional source, it is marked `[AGGREGATOR]`. Where a quotation is damaged by OCR, it is marked
`[OCR]` and the verifier must return to the PDF.

**Research constraint (disclose to verifier):** this session's WebSearch budget was exhausted before
the first Flushing query ran (200/200 already used on arrival). Everything below was gathered by
direct retrieval of URLs I could name in advance — `urllib` against the live host, plus `pdftotext`
for LPC designation reports, plus Socrata/GeoSearch API queries. Source discovery was therefore
**directed, not exhaustive**. Absence of a topic below is not evidence of absence. In particular I
could not do open-ended discovery of local press, community-organization pages, or restaurant
coverage.

**Source-quality note.** These are primary/institutional and should be treated as strong:
LPC designation reports LP-00005, LP-00139, LP-00141, LP-00142, LP-00143, LP-01257, LP-01798,
LP-01924, LP-02053, LP-02137, LP-02160, LP-02272; the LPC "Individual Landmark Sites" (`buis-pvji`)
and "Designated and Calendared Buildings and Sites" (`ncre-qhxs`) datasets; DCP's 2020 NTA table
(`9nt8-h7nd`); PLUTO (`64uk-42ks`); NYC Planning GeoSearch; NYC Parks Historical Signs Project
pages; MTA monthly station ridership (`ak4z-sape`); DOHMH restaurant inspections (`43nn-pn8j`).
Wikipedia is used where flagged and is an aggregator requiring independent confirmation.
Institution websites are self-descriptions, not third-party verification.

**Counts:** **367 candidate facts** (F1–F367, numbered contiguously, no gaps, no duplicates) across
**71 candidate places** (P1–P71).
**Contested neighborhood assignments:** **19 rows** in §L.
**Address / identity discrepancies:** **13 rows** in §M.
**Sources that contradict themselves or each other:** **27 rows** in §N.
**Explicit gaps the verifier must close:** **13 items** in §R.

---

## §0 — THE TWO HARD CONSTRAINTS ON THIS PAGE (read before writing anything)

### §0.1 The destination string

**F1.** `Ethos.Seeds.CitiFieldGuide` declares, verbatim from the source file:

```
      destination: "Flushing, New York",
```

Source: `lib/ethos/seeds/citi_field_guide.ex` (this repository, read at
`/Users/charmalloc/dev/ethos/.claude/worktrees/connecticut-expansion/lib/ethos/seeds/citi_field_guide.ex`)

**F2.** The same file's moduledoc explains the choice, quoted exactly:

> `destination: "Flushing, New York"`. The ballpark's own address is a
> Flushing one, and three of this guide's places carry Corona addresses; the
> place records keep each town as its source gives it rather than flattening
> both to the borough.

Source: `lib/ethos/seeds/citi_field_guide.ex`

→ **The brief states this as a hard requirement on the author: `flushing.json`'s `guide.destination`
must be exactly `"Flushing, New York"`.** I record F1 and F2 only so the verifier can confirm the
string against the file rather than against my memory. I am not adjudicating it.

**F3.** For what it is worth to the verifier, no source I fetched uses the bare string "Flushing,
New York" as a place name in prose; institutional sources overwhelmingly write **"Flushing, NY"**
with a ZIP. Examples, each quoted exactly:
- "37-01 BOWNE STREET, FLUSHING NY 11354" — https://www.bownehouse.org/about
- "143-35 37th Avenue / Flushing, NY 11354" — https://www.queenshistoricalsociety.org/location-hours
- "137-35 Northern Blvd., Flushing, NY 11354" — https://www.flushingtownhall.org/
- "43-50 Main Street / Flushing, NY 11355" — https://queensbotanical.org/about/
- "45-57 Bowne Street, Flushing, NY 11355" — https://nyganeshtemple.org/about/
- "163-06 46th Avenue / Flushing, NY 11358" — https://www.flushingcemetery.com/
- "34-41 137th St. Flushing, NY 11354" — https://www.lewislatimerhouse.org/visit
→ Recorded as context. This does **not** license changing the destination string; the co-listing
requirement is a project rule, not a source claim.

**F4.** NYC Planning GeoSearch returns, for every one of the fifteen landmark addresses I geocoded
(§M), the field values `"neighbourhood": "Flushing"` and `"borough": "Queens"`, with labels of the
form `"37-01 BOWNE STREET, Flushing, NY, USA"`.
Source: https://geosearch.planninglabs.nyc/v2/search?text=… (NYC Department of City Planning
GeoSearch v2, queried per-address; full list in §M)

### §0.2 The Flushing Meadows–Corona Park firewall

`Ethos.Seeds.CitiFieldPlaces` already owns eight places inside Flushing Meadows–Corona Park: Citi
Field, the Unisphere, the Queens Museum, the New York Hall of Science, the Queens Zoo, the USTA
Billie Jean King National Tennis Center, the New York State Pavilion, and the Queens Theatre.
**None may be re-created in the Flushing seed file under any slug, and their history must not be
narrated here.** Wave 3 further ruled that Flushing Meadows–Corona Park itself belongs to no
neighborhood file. The route is a link to `/g/citi-field-guide`.

Flushing's own sources mention the park constantly, because the park carries the name and the
ballpark's postal address says Flushing. I have recorded those mentions **only** where they
establish a fact about *Flushing the neighborhood*, or where they mark a boundary the writer needs
to see. Every place I found that sits inside or on the edge of the park is flagged in §I so the
firewall is visible. Flushing will read thinner in its park section than its fame suggests. That is
the firewall working, not a research gap.

**F5.** DCP's 2020 NTA table treats **Flushing Meadows–Corona Park as its own separate NTA**, not as
part of any residential neighborhood. The Queens NTA name list returned by the API contains, as
distinct entries, `Flushing Meadows-Corona Park` and `Flushing-Willets Point`.
Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json (queried
`$select=nta2020,ntaname,ntaabbrev,ntatype,cdta2020,cdtaname,borocode,boroname&$where=boroname='Queens'&$limit=200`)
→ **This is the single strongest piece of evidence for the wave-3 ruling.** The City itself does not
file the park under Flushing. Recorded, not resolved.

**F6.** Wikipedia's Flushing article nevertheless devotes a subsection headed "Flushing
Meadows-Corona Park" to it, and states: "Flushing Meadows–Corona Park , an 897-acre (3.63 km 2 )
park, is the largest park in Queens." and "The northern part of the park contains Citi Field , home
of the New York Mets of Major League Baseball ; the field, opened in 2009, replaced the former Shea
Stadium ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** this is exactly the temptation the brief warns about. The aggregator files the park and
the ballpark under Flushing. The City's own NTA table (F5) does not. Recorded, not resolved.

**F7.** The Wikipedia "Flushing" navigation template lists under "Parks and recreation → Public
parks": "Flushing Meadows–Corona Park", "Queens Botanical Garden", "Queens Zoo"; and under
"Stadiums": "Citi Field", "USTA Billie Jean King National Tennis Center", "Arthur Ashe Stadium",
"Louis Armstrong Stadium", "Etihad Park (under construction)"; and under "Public art": "Unisphere",
"Rocket Thrower", "Statue of Tom Seaver".
Source: https://en.wikipedia.org/wiki/Flushing_Armory (Flushing navbox, rendered at the foot of the
article) `[AGGREGATOR]`
→ **FLAG:** six of these are CitiFieldPlaces holdings or components of them. Two — the Rocket
Thrower and Etihad Park — are inside the park but are *not* among the eight. The verifier must rule
whether "not among the eight" means "available to Flushing" or "still inside the Jointly Interested
Area and therefore available to no one." I do not resolve it. See §I.

---

## §A — Boundaries and administrative geography

**F8.** DCP's 2020 NTA table splits Community District 7 into nine NTAs. Verbatim field values
(`nta2020 | ntaname | ntaabbrev | ntatype | cdta2020 | cdtaname`):

| nta2020 | ntaname | ntaabbrev | ntatype | cdta2020 | cdtaname |
|---|---|---|---|---|---|
| `QN0701` | `College Point` | `CllgPt` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0702` | `Whitestone-Beechhurst` | `Whtstn` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0703` | `Bay Terrace-Clearview` | `ByTr_Clrvw` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0704` | `Murray Hill-Broadway Flushing` | `MryHl_BwyF` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0705` | `East Flushing` | `EstFlshng` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0706` | `Queensboro Hill` | `QnsboroHl` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0707` | `Flushing-Willets Point` | `Flshng` | 0 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0761` | `Fort Totten` | `FtTttn` | 6 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |
| `QN0791` | `Kissena Park` | `KssnPk` | 9 | `QN07` | `QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)` |

Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json
→ **This is the most useful boundary fact in the wave for Flushing.** The City does not treat
"Flushing" as one unit. Its core NTA is named **`Flushing-Willets Point`**, pairing Flushing
administratively with Willets Point — which the project roster files as a *separate* neighborhood
(wave 6, `in_scope: false`). Recorded, not resolved.

**F9.** For comparison, DCP puts Bayside and Douglaston in a different CDTA entirely:

| nta2020 | ntaname | ntatype | cdta2020 | cdtaname |
|---|---|---|---|---|
| `QN1101` | `Auburndale` | 0 | `QN11` | `QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)` |
| `QN1102` | `Bayside` | 0 | `QN11` | `QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)` |
| `QN1103` | `Douglaston-Little Neck` | 0 | `QN11` | `QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)` |
| `QN1104` | `Oakland Gardens-Hollis Hills` | 0 | `QN11` | `QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)` |
| `QN1191` | `Alley Pond Park` | 9 | `QN11` | `QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)` |

Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json
→ Recorded for the wave, not for the Flushing page. **Flushing is in QN07; Bayside and Douglaston
are in QN11. The City's own geography puts a whole community district boundary between them.** I
found no source that ties a *place* in Flushing to Bayside or Douglaston. The only cross-references
I found are a diaspora corridor (F304, F305), a descriptive phrase about Flushing's own northeastern
edge (F314), a 19th-century cemetery plot (F263), a letter read at a landmarks hearing (F214), and a
postal-administration boundary (F24). All five are recorded in §L rows 4, 14, 16, 17 and 18.
→ Note also: DCP gives **Alley Pond Park its own NTA (`QN1191`, ntatype 9)** in CD 11, exactly as it
gives Kissena Park its own NTA (`QN0791`) in CD 7. That parallel is offered to the Bayside and
Douglaston finders; it is not mine to rule on.

**F10.** The project's own roster disagrees with DCP on East Flushing. `priv/seed_data/queens_roster.json`
contains, verbatim:

```json
{'slug': 'east-flushing', 'name': 'East Flushing', 'community_district': 11, 'wave': 8, 'in_scope': False}
```

Source: `priv/seed_data/queens_roster.json` (this repository)
→ **FLAG, and this is a coordinator-level issue, not a writer-level one.** DCP's NTA table (F8) puts
`East Flushing` (`QN0705`) in **CD 7**. The roster puts it in **CD 11** and schedules it with the
Bayside/Douglaston wave. The roster's own `source` field admits the gap, quoted exactly:
"Community district assignments for neighborhoods that straddle a district boundary are best-effort
and flagged for re-check." Recorded, not resolved.

**F11.** The roster files three CD 7 subsections in wave 5 with `in_scope: false`, verbatim:

```json
{'slug': 'murray-hill', 'name': 'Murray Hill', 'community_district': 7, 'wave': 5, 'in_scope': False}
{'slug': 'broadway-flushing', 'name': 'Broadway–Flushing', 'community_district': 7, 'wave': 5, 'in_scope': False}
{'slug': 'queensboro-hill', 'name': 'Queensboro Hill', 'community_district': 7, 'wave': 5, 'in_scope': False}
```

Source: `priv/seed_data/queens_roster.json`
→ **FLAG:** Murray Hill, Broadway–Flushing and Queensboro Hill get no file of their own. Two
landmarked museums (the Voelker Orth Museum and the Fitzgerald/Ginsberg Mansion) sit in the
`Murray Hill-Broadway Flushing` NTA (`QN0704`), not in `Flushing-Willets Point` (`QN0707`). The
verifier must rule whether the Flushing page absorbs them or whether they go unwritten. See §L rows
1–4. Recorded, not resolved.

**F12.** Wikipedia's infobox for Flushing, quoted exactly from the rendered table:
"Community District Queens 7", "Founded 1645", "Town 1683–1898", "Named after Vlissingen ,
Netherlands", "Population ( 2010 ) • Total 72,008 (176,000 with the subsections)",
"ZIP Codes 11354, 11355, 11358", "Area codes 718, 347, 929 , and 917".
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F13.** Wikipedia, quoted exactly: "Flushing is located in Queens Community District 7 , and its
ZIP Codes are 11354, 11355, and 11358."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F14.** Wikipedia, quoted exactly: "Flushing is a neighborhood in the north-central part of the New
York City borough of Queens . The neighborhood is the fourth-largest central business district in
New York City."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F15.** Wikipedia, quoted exactly: "Downtown Flushing is a major commercial and retail area, with
the intersection of Main Street and Roosevelt Avenue at its core being the third-busiest in New York
City, behind Times Square and Herald Square ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** the same encyclopedia's *Downtown Flushing* article makes a stronger and differently
shaped claim — see §N row 3.

**F16.** Wikipedia, quoted exactly: "Covering an area of 853.06 acres (345.22 ha) , the neighborhood
had a population density of 84.4 inhabitants per acre (54,000/sq mi; 20,900/km 2 ) ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F17.** Wikipedia, quoted exactly: "Based on data from the 2010 United States census , the
population of Flushing was 72,008, an increase of 2,646 (3.8%) from the 69,362 counted in 2000 ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F18.** Wikipedia, quoted exactly: "The racial makeup of the neighborhood was 69.2% (49,830) Asian ,
9.5% (6,831) white , 4.2% (3,016) black , 0.1% (74) Native American , 0.1% (59) Pacific Islander ,
0.2% (172) from other races , and 1.8% (1,303) from two or more races. Hispanic or Latino of any race
were 14.9% (10,723) of the population."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F19.** Wikipedia, quoted exactly: "The entirety of Community Board 7, which comprises Flushing,
College Point, and Whitestone, had 263,039 inhabitants as of NYC Health 's 2018 Community Health
Profile, with an average life expectancy of 84.3 years."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** this sentence names only three neighborhoods for CB7. DCP's NTA table (F8) gives CB7
nine NTAs including Bay Terrace-Clearview, Murray Hill-Broadway Flushing, East Flushing, Queensboro
Hill, Fort Totten and Kissena Park. Recorded, not resolved.

**F20.** Wikipedia, quoted exactly: "It is patrolled by the New York City Police Department 's 109th
Precinct." and "Flushing, College Point, and Whitestone are patrolled by the 109th Precinct of the
NYPD , located at 37 - 05 Union Street."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F21.** Wikipedia gives Flushing's coordinates as "40°45′54″N 73°48′18″W" / "40.765°N 73.805°W".
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F22.** Wikipedia lists three FDNY stations in Flushing, quoted exactly:
"Engine Company 273/Ladder Company 129 – 40 - 18 Union Street", "Engine Company 274/Battalion 52 –
41 - 20 Murray Street", "Engine Company 320/Ladder Company 167 – 36 - 18 Francis Lewis Boulevard",
and "In addition, FDNY EMS Station 52 is located at 135–16 38th Avenue."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F23.** Wikipedia on ZIP geography, quoted exactly: "Downtown Flushing and western Murray Hill is
covered by 11354; south Flushing, including Queensboro Hill and Waldheim, is included in 11355; and
eastern Murray Hill and Broadway-Flushing fall within 11358. ZIP Codes 11356 and 11357, which are
part of College Point and Whitestone respectively, also cover small parts of northern Flushing and
Linden Hill."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F24.** Wikipedia lists three post offices, quoted exactly: "Flushing Station – 41–65 Main Street",
"Linden Hill Station – 29–50 Union Street", "Station A – 40–03 164th Street"; and
"ZIP Codes prefixed with 113 are administered from a sectional center at the Flushing Post Office.
The 113-prefixed area extends west to Elmhurst and Jackson Heights ; southwest to Ridgewood ; south
to Forest Hills ; southeast to Fresh Meadows ; and east to Bayside and Little Neck ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** this is the one structural link between Flushing and Bayside/Little Neck that any source
gave me, and it is a **postal-administration** link, not a neighborhood link. Recorded in §L row 18.
It must not be written as a claim that the neighborhoods adjoin.

**F25.** PLUTO returns `cd: 407` — the code for Queens Community District 7 — for **all fifteen**
Flushing landmark tax lots I queried (list in §M).
Source: https://data.cityofnewyork.us/resource/64uk-42ks.json (queried by BBL)

---

## §B — Subsections of Flushing (all in CD 7; none has its own seed file)

**P1 — Broadway–Flushing (also called North Flushing).**
**F26.** Wikipedia, quoted exactly: "Broadway–Flushing , also known as North Flushing, is a
residential area with many large homes. The name refers to the area served by the "Broadway" station
of the Long Island Rail Road . The Broadway station is located immediately east of the location where
the LIRR's Port Washington Branch crosses Northern Boulevard, which when the station was opened in
1866 was called "Broadway"."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F27.** Wikipedia, quoted exactly: "Broadway-Flushing is approximately bounded by 29th Avenue to
the north, Northern Boulevard and Crocheron Avenue to the south, 155th Street to the west, and 172nd
Streets to the east."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F28.** Wikipedia, quoted exactly: "Part of this area has been designated a State and Federal
historic district due to the elegant, park-like character of the neighborhood. Much of the area has
been rezoned by the City of New York to preserve the low density, residential quality of the
neighborhood."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**P2 — Broadway–Flushing Historic District (NRHP).**
**F29.** NRHP listing row, verbatim field values: refnum `06000373`; name
`Broadway-Flushing Historic District`; address `Roughly bounded by 29th Ave., 163rd St., 32nd Ave.,
192nd St., 154th and 153rd Sts.`; city `[[Flushing, Queens|Flushing]]`; date `2006-05-12`.
Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York
(raw wikitext, `action=raw`, NRHP row templates parsed) `[AGGREGATOR]`
**F30.** The Broadway–Flushing article's own NRHP infobox gives a *different* boundary description
and adds an area, quoted exactly: "Location Roughly bounded by 29th Ave., 163rd St., 32nd Ave., 192nd
St., Crocheron Avenue, Northern Boulevard and 154th/155th Sts., Flushing, New York", "Area 250.1
acres (101.2 ha)", "Built 1906", "Architectural style Early and Mid-20th Century American Eclectic
Period", "NRHP reference number … No. 06000373", "Added to NRHP May 12, 2006".
Source: https://en.wikipedia.org/wiki/Broadway%E2%80%93Flushing_Historic_District `[AGGREGATOR]`
→ **FLAG:** two Wikipedia pages give two different boundary strings for the same NRHP reference
number. See §N row 5. The verifier should go to the NPS nomination for `06000373`.
**F31.** The Broadway–Flushing infobox gives "Population (2000) • Total 10,000", "ZIP Codes 11354,
11358", and an ethnicity block whose figures sum to more than 100%: "White 78%", "Black 2%",
"Hispanic 8%", "Asian 28%", "Other 0.7%".
Source: https://en.wikipedia.org/wiki/Broadway%E2%80%93Flushing_Historic_District `[AGGREGATOR]`
→ **FLAG:** 78+2+8+28+0.7 = 116.7. The figures are internally impossible as stated. See §N row 6.
Do not publish them.

**P3 — Linden Hill.**
**F32.** Wikipedia, quoted exactly: "Linden Hill is bound by 25th Avenue to Willets Point Boulevard
to the north, 154th Street to the east, Northern Boulevard to the south and the Whitestone
Expressway to the west."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F33.** Wikipedia, quoted exactly: "Linden Hill was originally a rural estate owned by the Mitchell
family. Ernest Mitchell owned an adjacent area to the west known as Breezy Hill and his father owned
the area now called Linden Hill. The two areas are sometimes referred to as the Mitchell-Linden
neighborhood."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F34.** Wikipedia, quoted exactly: "A major change in the rural nature of Linden Hill occurred in
the early 1950s. Neisloss Brothers with architect Benjamin Braunstein envisioned a cooperative
project to be set on Linden Hill and landfill on the adjacent swamp to the west which would provide
middle-income housing to veterans of World War II and the Korean War . The construction was carried
out under Section 213 of the Federal Housing Act of 1950 which provided mortgage insurance for
non-subsidized projects."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F35.** Wikipedia, quoted exactly: "In total, 41 six-story buildings containing 3,146 apartments
comprising the Linden Hill, Mitchell Gardens, Linden Towers, and Embassy Arms cooperatives were
erected." and "Once a primarily European-American, largely Jewish, neighborhood, Linden Hill is now
predominantly Chinese-American."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** Wikipedia disambiguates this from a different Linden Hill: ""Linden Hill, Queens"
redirects here; not to be confused with Linden Hill, Ridgewood, Queens ." (quoted exactly). Ridgewood
already ships a page. See §L row 12.

**P4 — Murray Hill (Queens).**
**F36.** Wikipedia, quoted exactly: "Murray Hill is bounded by 150th Street to the west and 160th
Street to the east and straddles ZIP Codes 11354, 11355, and 11358."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F37.** Wikipedia, quoted exactly: "Traditionally the home of families of Irish and Italian
immigrants, many Korean and Chinese immigrants have moved into Murray Hill in recent years. Murray
Hill within Flushing is often confused with the larger Murray Hill neighborhood on the East Side of
Manhattan ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the phrase "Murray Hill **within Flushing**" — the aggregator treats Murray Hill as inside
Flushing. DCP treats it as a separate NTA, `QN0704 Murray Hill-Broadway Flushing` (F8). §L row 1.
**F38.** Wikipedia, quoted exactly: "Before the area was developed for residential housing in 1889,
Murray Hill was the location of several large nurseries owned by the King, Murray, and Parsons
families."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F39.** Wikipedia, quoted exactly: "Comic strip artist Richard F. Outcault , the creator of The
Yellow Kid and Buster Brown , lived on 147th Street in Murray Hill."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F40.** Wikipedia, quoted exactly: "The Long Island Rail Road 's Murray Hill and Broadway stations
serve the area."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**P5 — Waldheim.**
**F41.** Wikipedia, quoted exactly: "The Waldheim neighborhood, an estate subdivision in Flushing
constructed primarily between 1875 and 1925, is bound by Sanford and Franklin Avenues on the north,
45th Avenue on the south, Bowne Street on the west and Parsons Boulevard on the east. The area is
immediately southeast of the downtown Flushing commercial core, and adjacent to Kissena Park. a small
district of upscale "in-town" suburban architecture. Waldheim, German for "home in the woods", is
known for its large homes of varying architectural styles and is laid out in an unusual street
pattern."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
(the sentence fragment "a small district of upscale…" is broken in the source; I have reproduced it
as found)
**F42.** Wikipedia, quoted exactly: "Waldheim was the home of some of Flushing's wealthiest residents
until the 1960s. Notable residents include the Helmann family of condiment fame, the Steinway
piano-making family, as well as A. Douglas Nash, who managed a nearby Tiffany glass plant."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** "Helmann" is almost certainly a misspelling of Hellmann (mayonnaise). Do not publish
without confirmation. Note also that a Tiffany glass connection appears in the Corona finder (the
Neustadt Collection); this is a *different* claim about a *different* person and plant, and the
verifier should not merge them.
**F43.** Wikipedia, quoted exactly: "Starting in the 1980s, homes in Waldheim were destroyed by the
Korean American Presbyterian Church of Queens, one of the area's largest land owners. In 2008, the
city rezoned the neighborhood to help preserve the low-density, residential character of the
neighborhood. As with the Broadway neighborhood, preservationists have been unable to secure
designation as an Historic District by the NYC Landmarks Preservation Commission , and as of 2017 ,
structures in Waldheim were still being torn down."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Consistent with my LPC query: **no Queens historic district in CD 7 appears in the LPC data.** The
`skyk-mpzq` historic-districts query for `borough='Queens'` returned zero rows for CD 7 (the only
Queens historic districts returned were the Douglaston and Douglaston Hill districts, in CD 11).
Source: https://data.cityofnewyork.us/resource/ncre-qhxs.json and
https://data.cityofnewyork.us/resource/skyk-mpzq.json

**P6 — Queensboro Hill.**
**F44.** Wikipedia, quoted exactly: "Queensboro Hill in southern Flushing is bordered to the west by
College Point Boulevard, to the north by Kissena Park and Kissena Corridor Park, to the south by
Reeves Avenue and the Long Island Expressway , and to the east by Kissena Boulevard . Queensboro Hill
is a part of ZIP Codes 11355 and 11367 and contains the NewYork–Presbyterian/Queens hospital. One of
the leading churches is the Queensboro Hill Community Church, a multi-racial congregation of the
Reformed Church in America. Turtle Playground serves the residents of this section of Flushing. This
area is often referred to as South Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**P7 — Pomonok, and P8 — Electchester.**
**F45.** Wikipedia, quoted exactly: "Pomonok is a neighborhood in South Flushing. This large public
housing development was built in 1949 on the former site of Pomonok Country Club . The name comes
from an Algonquian word for eastern Long Island , and means either "land of tribute" or "land where
there is travelling by water"."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F46.** Wikipedia, quoted exactly: "In Pomonok, there is also Electchester , a cooperative housing
complex at Jewel Avenue and Parsons Boulevard in Pomonok, which was established by Harry Van Arsdale
Jr. and Local 3 of the International Brotherhood of Electrical Workers in 1949, when Van Arsdale
worked with the Joint Industry Board of the Electrical Industry to purchase 103 acres (0.42 km 2 ) of
the former Pomonok Country Club and build apartment buildings. 5,550 people live in about 2,500 units
in 38 buildings, many of which are six-story brick structures."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F47.** Wikipedia, quoted exactly: "Both housing complexes are patrolled by the N.Y.P.D.'s 107th
Precinct." and "Pomonok is part of Queens Community District 8 ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG, strongly.** Wikipedia calls Pomonok "a neighborhood in South Flushing" **and** says it is
in Community District 8. DCP confirms CD 8: `QN0802 | Pomonok-Electchester-Hillcrest | Pmnk_Hlcst |
0 | QN08 | QN08 Fresh Meadows-Hillcrest-Briarwood (CD 8 Approximation)`. The project roster also
files Pomonok as CD 8, wave 7. **Pomonok and Electchester are outside CD 7 and outside this page.**
§L rows 5–6. Recorded, not resolved.

**F48.** DCP places `Kew Gardens Hills` in CD 8 as well: `QN0801 | Kew Gardens Hills | KwGrdnsHls |
0 | QN08 | QN08 Fresh Meadows-Hillcrest-Briarwood (CD 8 Approximation)`.
Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json
→ Relevant because of Queens College — see F348 and §L row 5.

---

## §C — Colonial history, the charter, and the Flushing Remonstrance

**F49.** Wikipedia, quoted exactly: "Flushing was originally inhabited by the Lenape Indians prior to
colonization and European settlement."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F50.** NYC Parks, on the James A. Bland Playground sign, quoted exactly: "This area of Flushing,
Queens was once inhabited by the Matinecock, a tribe of the Lenape. They were displaced in the 1600s
with the arrival of the Dutch. In 1645, the town of Vlissingen was established by the Dutch West
India Company. When the English took control of what would become New York, the name of the town was
anglicized to Flushing."
Source: https://www.nycgovparks.org/parks/bland-playground/history (NYC Parks Historical Signs
Project — primary/institutional)
→ Note this names the **Matinecock** specifically, where Wikipedia says only "Lenape". §N row 1.

**F51.** Queens Botanical Garden's own land acknowledgement, quoted exactly: "Queens Botanical Garden
acknowledges that it is situated on the traditional land of the Matinecock people, the first people
of Flushing, Queens. We pay respect to the Matinecock people, past, present, and future, their
ancestors who have stewarded the land for generations, and their continuing presence on this land
today." and "We thank Tecumseh Ceaser, Artist and Cultural Consultant of the Matinecock Tribal
Nation, for his guidance as we reflect on our acknowledgement."
Source: https://queensbotanical.org/about/

**F52.** Lewis Latimer House Museum's land acknowledgement, quoted in the fragment I retrieved:
"…nni Lenape and Matinecock land, the ancestral and unceded territory of the Munsee Lenape and
Matinecock peoples."
Source: https://www.lewislatimerhouse.org/visit
→ The opening of the sentence was cut in my retrieval; the verifier must re-fetch for the full
wording. Marked as partial.

**F53.** Wikipedia, quoted exactly: "On October 10, 1645, Flushing was established on the eastern
bank of Flushing Creek under charter of the Dutch West India Company and was part of the New
Netherland colony that was governed from New Amsterdam (Lower Manhattan). The settlement was named
Vlissingen, after the city of Vlissingen , which was the European base of the Dutch West India
company. By 1657, the residents called the place "Vlishing"."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F54.** The LPC's St. George's designation report gives a **different date and a different framing**,
quoted exactly: "Originally known as Vlissingen, it was founded by a group of English colonists who
were granted a patent on October 19, 1645 by William Kieft, the director general of the Dutch colony
of Nieuw Amsterdam These settlers, many of whom were Quakers, came from Massachusetts seeking
religious freedom"
Source: LPC designation report **LP-2053**, St. George's (Episcopal) Church, Old Parish House and
Graveyard, February 8, 2000, Designation List 311 — http://s-media.nyc.gov/agencies/lpc/lp/2053.pdf
→ **FLAG, and this is the most important date discrepancy in the file. October 10 (Wikipedia) vs
October 19 (LPC).** See §N row 2. Recorded, not resolved.

**F55.** The LPC's Voelker Orth report gives a third framing, quoted exactly: "The area that now
constitutes Flushing, Queens, was granted by patent to English settlers by Governor William Kieft
(along with Whitestone and College Point) in 1645."
Source: LPC designation report **LP-2272**, October 30, 2007, Designation List 397 —
http://s-media.nyc.gov/agencies/lpc/lp/2272.pdf

**F56.** The LPC's Flushing High School report gives a fourth, quoted exactly: "Flushing was first
settled in 1645 by a small group of Englishmen "Who had first emigrated to the Netherlands before
corning to this country." `[OCR]`
Source: LPC designation report **LP-1798**, January 8, 1991, Designation List 231 —
http://s-media.nyc.gov/agencies/lpc/lp/1798.pdf
→ `[OCR]`: "Who" and "corning" are scanning errors for "who" and "coming". The verifier must confirm
against the PDF before quoting.

**F57.** Wikipedia, quoted exactly: "Unlike all other towns in the region, the charter of Flushing
allowed residents freedom of religion as practiced in Holland "without the disturbance of any
magistrate or ecclesiastical minister". However, in 1656, New Amsterdam Director-General Peter
Stuyvesant issued an edict prohibiting the harboring of Quakers ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F58.** Wikipedia, quoted exactly: "In response, on December 27, 1657, the inhabitants of Flushing
approved a protest known as The Flushing Remonstrance . This petition contained religious arguments,
even mentioning freedom for "Jews, Turks, and Egyptians," and ended with a forceful declaration that
any infringement of the town charter would not be tolerated."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F59.** Wikipedia's dedicated article, quoted exactly: "The Flushing Remonstrance was a 1657 petition
to Director-General of New Netherland Peter Stuyvesant , in which some thirty residents of the small
settlement at Flushing requested an exemption to his ban on Quaker worship. It is considered a
precursor to the United States Constitution 's provision on freedom of religion in the Bill of Rights ."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]`

**F60.** Wikipedia, quoted exactly: "The Flushing Remonstrance was signed at the home of Edward Hart,
the town clerk , on December 27, 1657, by a group of Dutch citizens who were affronted by persecution
of Quakers and the religious policies of Stuyvesant. None of them were Quakers . The site of the
signing is presently occupied by the former State Armory, now a police facility, on the south side of
Northern Boulevard between Linden Place and Union Street."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]`
→ **Note "None of them were Quakers"** — a counterintuitive claim the writer may be tempted to
soften or invert. It is what the source says. Verify it.

**F61.** The Flushing article states the same site fact with a different emphasis, quoted exactly:
"The Remonstrance was signed at a house on the site of the former State Armory, now a police facility,
on the south side Northern Boulevard between Linden Place and Union Street."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Cross-check: PLUTO gives the Flushing Armory lot (BBL 4049770039, 137-58 Northern Boulevard) owner
`NYC POLICE DEPARTMENT`. Source: https://data.cityofnewyork.us/resource/64uk-42ks.json

**F62.** The Remonstrance's closing text, quoted exactly as Wikipedia reproduces it:
"The law of love, peace and liberty in the states extending to Jews, Turks and Egyptians, as they are
considered sonnes of Adam, which is the glory of the outward state of Holland, soe love, peace and
liberty, extending to all in Christ Jesus, condemns hatred, war and bondage. And because our Saviour
sayeth it is impossible but that offences will come, but woe unto him by whom they cometh, our desire
is not to offend one of his little ones, in whatsoever form, name or title hee appears in, whether
Presbyterian, Independent, Baptist or Quaker, but shall be glad to see anything of God in any of them,
desiring to doe unto all men as we desire all men should doe unto us, which is the true law both of
Church and State; for our Saviour sayeth this is the law and the prophets.
Therefore if any of these said persons come in love unto us, we cannot in conscience lay violent hands
upon them, but give them free egresse and regresse unto our Town, and houses, as God shall persuade
our consciences, for we are bounde by the law of God and man to doe good unto all men and evil to noe
man. And this is according to the patent and charter of our Towne, given unto us in the name of the
States General, which we are not willing to infringe, and violate, but shall houlde to our patent and
shall remaine, your humble subjects, the inhabitants of Vlishing."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]` — **`[QUOTE-VIA]`: this is
a 17th-century document reproduced inside an encyclopedia article. The verifier must go to a primary
transcription (the original is held by the New York State Archives) before any of it is published.**

**F63.** Wikipedia, quoted exactly: "Kieft's patent granted the English colonists, most of them
non-Anglican Protestants , the same freedom of religion which existed in the Dutch Republic , which
was one of the most religiously tolerant nations in Europe."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]`

**F64.** Wikipedia quotes a scholar's dissent, exactly: "Scholar Thomas Broderick argues that "we
cannot see the Flushing Remonstrance through our modern notions of the Bill of Rights and freedom of
religion. Rather, we must understand it as a document unique to the 17th century Dutch experience" and
concludes that "the true Dutch legacy is not one of toleration but of discussion.""
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]` `[QUOTE-VIA]`
→ **This is a valuable corrective and the writer should see it.** The triumphalist "birthplace of
religious freedom" framing is contested by at least one cited scholar. Verify the Broderick
attribution before use.

**F65.** Wikipedia, quoted exactly: "Stuyvesant's policy was not very different from the one evolving
in the Netherlands: an official recognition of the Dutch Reformed Church bundled with broad tolerance
within the church and a policy of connivance , turning a blind eye to non-conformist religious
practices."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]`

**F66.** Wikipedia, quoted exactly: "In 1656, William Wickenden , a Baptist minister from Rhode
Island, and William Hallett, Sheriff of Flushing, were arrested by Dutch colonial authorities, jailed,
fined, and exiled for baptizing Christians in Flushing. In the same year Robert Hodgson was arrested,
tried, and sentenced to two years of manual labor with slaves for his preaching of Quakerism."
Source: https://en.wikipedia.org/wiki/Flushing_Remonstrance `[AGGREGATOR]`

**F67.** Wikipedia, quoted exactly: "Subsequently, a farmer named John Bowne held Quaker meetings in
his home and was arrested for this and deported to Holland. Eventually he persuaded the Dutch West
India Company to allow Quakers and others to worship freely. As such, Flushing is claimed to be a
birthplace of religious freedom in the New World."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the hedge "**is claimed to be**". The writer must not upgrade it to a bare assertion.

**F68.** LPC's Friends Meeting House report, quoted exactly: "The Long Is land Quakers achieved
prominence from the ir very earliest years. In 1657, when Director Genera l Stuyvesant forbade their
worsh ip, Flus hing officials and citizens signed the "Flushing Remonstrance". This was perhaps the
earliest demand for rei igious I iberty made by American colonists. A few years later , when John
Bowne was banished, he argued their case in Hoi land. As a result, the "liberty of Conscience,
according to the Custome and Manner of Hoi land," granted to Flushing in its charter of 1645, was
extended in 1663 to estab lish ret igious I iberty throughout the Province of New Netherland." `[OCR]`
Source: LPC designation report **LP-0141**, Friends Meeting House, August 18, 1970, Number 5 —
http://s-media.nyc.gov/agencies/lpc/lp/0141.pdf
→ `[OCR]`: the scan mangles "Long Island", "their", "worship", "Flushing", "religious", "liberty",
"Holland". The **substance** — that the charter's liberty of conscience was extended province-wide in
**1663** — is legible and is a fact I found nowhere else. Verifier must re-read the PDF.
→ Note LPC's own hedge: "**perhaps** the earliest demand".

**F69.** Wikipedia, quoted exactly: "In 1664, the English took control of New Amsterdam , ending Dutch
control of the New Netherland colony, and renamed it the Province of New York . When Queens County was
established in 1683, the "Town of Flushing" was one of the original five towns which comprised the
county."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F70.** Wikipedia's boundary description of the historic **Town** of Flushing, quoted exactly:
"Many historical references to Flushing are to this town, bounded from Newtown on the west by Flushing
Creek (now Flushing River ), from Jamaica on the south by the watershed , and from Hempstead on the
east by what later became the Nassau County line. The town was dissolved in 1898 when Queens became a
borough of New York City, and the term "Flushing" today usually refers to a much smaller area, for
example the former Village of Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG, and this is the most dangerous sentence in the corpus for this wave.** The *historic town*
of Flushing ran east to the Nassau County line — which means it historically contained the ground that
is now Bayside and Douglaston. **The modern neighborhood does not.** A writer who conflates the two
will manufacture exactly the Flushing–Bayside–Douglaston ties the brief forbids. §L row 19. Recorded,
not resolved.

**F71.** The *Downtown Flushing* article states the same boundary with a different southern limit,
quoted exactly: "bounded from Newtown on the west by Flushing Creek (now often called the Flushing
River ), from Jamaica on the south by the "hills"—that is, the terminal moraine left by the last
glacier, and from Hempstead on the east by what later became the Nassau County line."
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`
→ "the watershed" (F70) vs "the "hills"—that is, the terminal moraine" (F71). §N row 4.

**F72.** Wikipedia, quoted exactly: "Flushing was a seat of power as the Province of New York up to
the American Revolution was led by Governor Cadwallader Colden , based at his Spring Hill estate."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F73.** Wikipedia's notable-people list entry, quoted exactly: "Cadwallader Colden (1688–1776),
Lieutenant Governor and acting Governor for the Province of New York . Estate was at Springhill, now
the location of Mount Hebron Cemetery ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** "Spring Hill" (F72) vs "Springhill" (F73) in the same article. And DCP files
`QN0871 | Mount Hebron & Cedar Grove Cemeteries | MtHbrnCem | 7 | QN08` — **Community District 8, not
7.** So Colden's estate site is, by the City's geography, outside this page. §L row 7.
Source for the NTA row: https://data.cityofnewyork.us/resource/9nt8-h7nd.json

**F74.** Wikipedia, quoted exactly: "During the American Revolution, Flushing, along with most
settlements in present-day Queens County, favored the British and quartered British troops, though one
battalion of Scottish Highlanders is known to have been stationed at Flushing during the war.
Following the Battle of Long Island , Zackary Perrine, an officer in the Continental Army , was
apprehended near Flushing Bay while on what was probably an intelligence gathering mission and was
later hanged."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the hedge "**probably**". Uncited in the source as retrieved.

**F75.** LPC's Friends Meeting House report on the Revolution, quoted exactly: "After the disastrous
Battle of Long Island in 1776, the Flushing Meeting House was briefly used by the British ar!Tly as a
prison. During the remainder of the British occupation, to 1783, the building served as a storehouse
for hay and as a hospital. In 1785 it was reopened for services, and is sti II used for this purpose."
`[OCR]`
Source: LPC **LP-0141** — http://s-media.nyc.gov/agencies/lpc/lp/0141.pdf
→ `[OCR]`: "ar!Tly" is "army"; "sti II" is "still".

**F76.** Wikipedia, quoted exactly: "On April 15, 1837, the Village of Flushing was incorporated within
the Town of Flushing." and "The official seal was merely the words, "Village of Flushing", surrounded
by nondescript flowers. No other emblem or flag is known to have been used. The Village of Flushing
included the neighbourhoods of Flushing Highlands, Bowne Park, Murray Hill , Ingleside, and Flushing
Park."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Two subsection names here — **Flushing Highlands** and **Ingleside** — appear nowhere else in
anything I fetched, and neither is a DCP NTA. Treat as unconfirmed.

**F77.** Wikipedia, quoted exactly: "In 1898, although opposed to the proposal, the Town of Flushing
(along with two other towns and other land of Queens County) was consolidated into the City of New York
to form the new Borough of Queens. All towns, villages, and cities within the new borough were
dissolved."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F78.** LPC's Flushing High School report, quoted exactly: "With the consolidation of Greater New York
in 1898, the original county of Queens was divided into two parts: Nassau County and the current Borough
of Queens. Flushing, along with Newtown and Jamaica, were the three colonial settlements that now
comprise Queens."
Source: LPC **LP-1798** — http://s-media.nyc.gov/agencies/lpc/lp/1798.pdf
→ **FLAG:** LPC says **three** original settlements (Flushing, Newtown, Jamaica); Wikipedia says
Flushing was "one of the original **five** towns" of Queens County (F69). §N row 7.

**F79.** Wikipedia, quoted exactly: "Local farmland continued to be subdivided and developed
transforming Flushing into a densely populated neighborhood of New York City. A major factor in this was
the Halleran real estate agency. From the American Civil War to the end of the 1930s its slogan "Ask
Mr. Halleran!" could be seen in ads all over Long Island, and the phrase from its maps "So This Is
Flushing" became a catchphrase."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F80.** LPC's Voelker Orth report on the suburbanisation, quoted exactly: "During the mid-to-late
nineteenth century, the Long Island Railroad created numerous lines and spurs to connect Queens and Long
Island with ferries on the East River for access to Manhattan. Many of Flushing's large farms, estates
and commercial nurseries were purchased by developers, lots were laid out, and large, sprawling houses
surrounded by trees and shrubbery filled the newly graded and paved streets. These became homes for the
families of successful businessmen who traveled to and from Manhattan each day."
Source: LPC **LP-2272** — http://s-media.nyc.gov/agencies/lpc/lp/2272.pdf

**F81.** Wikipedia on early-20th-century infrastructure, quoted exactly: "The continued construction of
bridges over the Flushing River and the development of other roads increased the volume of vehicular
traffic into Flushing. In 1909, the Queensboro Bridge over the East River opened, connecting Queens
County to midtown Manhattan . With the opening of Pennsylvania Station the next year, the Port
Washington Branch, now part of the Long Island Rail Road , started running to midtown Manhattan.
Broadway, a main roadway through Flushing, was widened and renamed Northern Boulevard."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F82.** Wikipedia, quoted exactly: "The Roosevelt Avenue Bridge over the Flushing River, which carries
four lanes of traffic and the New York City Subway 's elevated Flushing Line ( 7 and < 7 > ​ trains ),
was the largest trunnion bascule bridge in the world when it was completed in 1927. The next year, the
Main Street terminal of the Flushing subway line opened in downtown Flushing, giving the neighborhood
direct subway access."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F83.** The same article's Roads section words it differently, quoted exactly: "The Roosevelt Avenue
Bridge over Flushing Creek was the largest fixed trunnion bascule type in the world when opened in 1927.
However, it was decommissioned as a moving bridge when marine navigation was eliminated in the late
1930s."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ "largest trunnion bascule bridge" vs "largest **fixed** trunnion bascule type". §N row 8.

**F84.** Wikipedia, quoted exactly: "Flushing was a forerunner of Hollywood , when the young American
film industry was still based on the U.S. East Coast and Chicago . Decades later, the RKO Keith 's movie
palace would host vaudeville acts and appearances by the likes of Mickey Rooney , the Marx Brothers and
Bob Hope ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** the "forerunner of Hollywood" claim is uncited in the source as retrieved and is a strong
claim. The Mickey Rooney / Marx Brothers / Bob Hope list is likewise uncited. Do not publish without a
second source.

---

## §D — The nursery era (Flushing's strongest and best-sourced distinctive thread)

**F85.** Wikipedia, quoted exactly: "Flushing was the site of the first commercial tree nurseries in
North America, the most prominent being the Prince , Bloodgood, and Parsons nurseries."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F86.** NYC Parks, on the Kissena Park sign, quoted exactly: "Throughout most of the 18th and 19th
centuries, Flushing enjoyed the reputation as America's premiere horticultural center. In 1735, William
Prince established the first commercial nursery in the Americas in northern Flushing. Famous patrons of
the area's plants and trees included England's future King William IV, George Washington, and explorers
Meriwether Lewis and William Clark, who left behind specimens from their expeditions."
Source: https://www.nycgovparks.org/parks/kissena-park/history (NYC Parks Historical Signs Project)
→ **FLAG:** NYC Parks dates the Prince nursery to **1735**. LPC dates it differently — see F88.

**F87.** NYC Parks, same page, quoted exactly: "By the early 1870s, horticulturist Samuel Bowne Parsons
(1819-1906) established a nursery at the site now home to the historic tree grove. Parsons' nursery
imported over 100 varieties of exotic trees and was the first nursery to introduce Japanese maples and
propagate rhododendron. Famous landscape architect Frederick Law Olmsted (1822-1903) purchased and used
many of Parson's trees for the construction of Central Park and Brooklyn's Prospect Park."
Source: https://www.nycgovparks.org/parks/kissena-park/history

**F88.** LPC's Flushing High School report, quoted exactly: "During th e seventeenth century, Flushing
began to develop as one of the most important centers for horticulture in this country. 'Ihe first
impetus to this industry's growth in Flushing is said to have begun with the arrival of French Huguenots
"Who settled in the area after the revocation of the F.d.ict of Nantes in 1685. 'Ihese emigrants brought
with them fruit trees not native to this country. later, William Prince was the first to establish a
profitable nursery, possibly as early as 1737. Another prominent American horticulturalist associated
with Flushing was Samuel Parsons "Who established his nursery in 1839." `[OCR]`
Source: LPC **LP-1798** — http://s-media.nyc.gov/agencies/lpc/lp/1798.pdf
→ `[OCR]`: "'Ihe" is "The"; "F.d.ict" is "Edict"; ""Who" is "who". **Three separate discrepancies with
NYC Parks (F86–F87):** Prince nursery **1735** (Parks) vs "possibly as early as **1737**" (LPC);
Parsons nursery "**by the early 1870s**" (Parks) vs "**1839**" (LPC); and LPC adds a Huguenot origin
story Parks does not mention. §N row 9. Recorded, not resolved.

**F89.** Wikipedia, quoted exactly: "A 14-acre (5.7 ha) tract of Parsons's exotic specimens was
preserved on the north side of Kissena Park ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F90.** Wikipedia on the alphabetical street grid — a distinctive, checkable, walkable fact — quoted
exactly: "The nurseries are also commemorated in the names of west–east avenues that intersect Kissena
Boulevard; the streets are named after plants and ordered alphabetically from Ash Avenue in the north to
Rose Avenue in the south."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Corroborated in part by the same article's photo caption, quoted exactly: "Ash Street, now called Ash
Avenue, in the early 20th century".
→ **This is the single most attractive "travel for it" fact in the nursery thread.** Verify the ordering
against a street map.

**F91.** Wikipedia, quoted exactly: "Flushing also supplied trees to the Greensward Project , now known
as Central Park in Manhattan. Well into the 20th century, Flushing contained many horticultural
establishments and greenhouses."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F92.** Queens Historical Society, on the Kingsland Homestead page, quoted exactly: "In 1839, Captain
King's son – Joseph Harris King, married the daughter of James Bloodgood, owner of the Bloodgood
Nursery. In the mid 1840s, he purchased a controlling interest in his father-in-law's nursery. Soon after
he moved the nursery onto the Kingsland property, which was better situated on less expensive land."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead

**F93.** Wikipedia on the Flushing Cemetery's horticultural framing, quoted exactly: "In 1789 (64 years
before the cemetery was founded), George Washington had crossed the East River on a personal mission
aboard his barge. Washington, like other noted landowners, journeyed to Flushing: The community was a
center of scientific horticulture . The cemetery's floral and arboreal beauty have become a memorial to
Flushing's status as a center of horticulture to this day."
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`
→ Sourced in the article to "Stuart, Schuyler Brandon. "The Story of Flushing Cemetery ". Published for
the Tri-Centennial of Flushing 1645–1945. p. 3" — an offline 1945 pamphlet. Treat as weak.

**F94.** Queens Botanical Garden's own framing of the inheritance, quoted exactly from Wikipedia: "The
Botanical Garden carries on Flushing's horticultural tradition that dates back to the area's 18th-century
tree nurseries and seed farms."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

---

## §E — The two landmark registers, as the registers themselves state them

These two tables are the **best-sourced material in this file** and should anchor the page. Both are
machine-read from primary datasets, not from prose.

### §E.1 LPC "Individual Landmark Sites" (`buis-pvji`), filtered to CD 7 and CD 11 NTAs

**F95.** Verbatim field values (`nta2020 | lpc_name | address | lpc_lpnumb | desdate | landmarkty`):

| nta2020 | lpc_name | address | LP number | desdate | type |
|---|---|---|---|---|---|
| `QN0707` | `Bowne House` | `37-01 Bowne Street` | `LP-00143` | 2/15/1966 | Individual Landmark |
| `QN0707` | `Flushing High School` | `35-01 Union Street` | `LP-01798` | 1/8/1991 | Individual Landmark |
| `QN0707` | `Flushing Town Hall` | `137-35 Northern Boulevard` | `LP-00139` | 7/30/1968 | Individual Landmark |
| `QN0707` | `Friends Meeting House` | `137-16 Northern Boulevard` | `LP-00141` | 8/18/1970 | Individual Landmark |
| `QN0707` | `Kingsland Homestead, Amendment to Landmark Site` | `143-35 37th Avenue` | `LP-00005A` | 10/14/1965 | Individual Landmark |
| `QN0707` | `Lewis H. Latimer House` | `34-41 137th Street` | `LP-01924` | 3/21/1995 | Individual Landmark |
| `QN0707` | `Protestant Reformed Dutch Church of Flushing (Bowne Street Community Church)` | `143-11 (143-19) Roosevelt Avenue` | `LP-02137` | 12/13/2016 | Individual Landmark |
| `QN0707` | `Saint George's Church, Old Parish House and Graveyard` | `38-02 Main Street` | `LP-02053` | 2/8/2000 | Individual Landmark |
| `QN0707` | `Weeping Beech Tree` | `Weeping Beech Park, 37th Avenue between Parsons Boulevard and Bowne Street` | `LP-00142` | 4/19/1966 | Individual Landmark |
| `QN0704` | `Fitzgerald/Ginsberg House` | `145-15 Bayside Avenue` | `LP-02160` | 9/20/2005 | Individual Landmark |
| `QN0704` | `Voelker Orth Museum, Bird Sanctuary and Victorian Garden` | `149-19 38th Avenue` | `LP-02272` | 10/30/2007 | Individual Landmark |
| `QN0701` | `Poppenhusen Institute` | `114-04 14th Road` | `LP-00662` | 8/18/1970 | Individual Landmark |
| `QN0701` | `Queens Borough Public Library, Poppenhusen Branch` | `121-23 14th Avenue` | `LP-02045` | 5/30/2000 | Individual Landmark |
| `QN0701` | `Herman A. and Malvina Schleicher House` | `11-41 123rd Street` | `LP-02321` | 10/20/2009 | Individual Landmark |
| `QN0702` | `Arthur and Dorothy Dalton Hammerstein House, Wildflower` | `168-11 Powells Cove Boulevard` | `LP-01282` | 7/27/1982 | Individual Landmark |
| `QN0761` | `Fort Totten Battery` | `Fort Totten Park` | `LP-00826` | 9/24/1974 | Individual Landmark |
| `QN0761` | `Fort Totten Officer's Club` | `208 Totten Avenue` | `LP-00827` | 9/24/1974 | Individual Landmark |
| `QN1102` | `35-34 Bell Boulevard` | `35-34 Bell Boulevard` | `LP-02154` | 10/19/2004 | Individual Landmark |
| `QN1102` | `Hawthorne Court Apartments` | `215-37 to 215-43 43rd Avenue and 42-22 to 42-38 216th Street` | `LP-02461` | 11/25/2014 | Individual Landmark |
| `QN1102` | `John William and Lydia Ann Bell Ahles House` | `39-24 to 39-26 213th Street` | `LP-02341` | 4/12/2016 | Individual Landmark |
| `QN1102` | `Lawrence Graveyard` | `216th Street at 42nd Avenue` | `LP-00630` | 8/2/1967 | Individual Landmark |
| `QN1103` | `Benjamin P. Allen House` | `29 Center Drive` | `LP-00944` | 1/11/1977 | Individual Landmark |
| `QN1103` | `Cornelius Van Wyck House` | `37-04 Douglaston Parkway` | `LP-00144` | 4/19/1966 | Individual Landmark |

Source: https://data.cityofnewyork.us/resource/buis-pvji.json (queried
`$where=nta2020 in('QN0707','QN0705','QN0704','QN0706','QN0791','QN0701','QN0702','QN1101','QN1102','QN1103','QN1191','QN0703','QN0761')`)
→ **Nine individual landmarks fall in `QN0707 Flushing-Willets Point`. Two more fall in
`QN0704 Murray Hill-Broadway Flushing`.** The `QN0701`/`QN0702` rows are College Point and Whitestone
(wave 6, out of scope here); `QN0761` is Fort Totten; the `QN1102`/`QN1103` rows belong to the Bayside
and Douglaston finders and are reproduced only so the coordinator can see there is **no overlap** —
not one landmark is claimed by both Flushing and either of the other two wave-5 pages.
→ **Zero individual landmarks fall in `QN0705 East Flushing`, `QN0706 Queensboro Hill`, or
`QN0791 Kissena Park`.**

### §E.2 LPC "Designated and Calendared Buildings and Sites" (`ncre-qhxs`), same NTAs

**F96.** This dataset returns **one landmark the other does not: an Interior Landmark.** Verbatim:

| nta2020 | lm_type | lm_name | desig_addr | lp_number | desdate | status |
|---|---|---|---|---|---|---|
| `QN0707` | `Interior Landmark` | `RKO Keith's Flushing Theater` | `35-28 FARRINGTON STREET` | `LP-01257` | 2/28/1984 | `DESIGNATED` |

Source: https://data.cityofnewyork.us/resource/ncre-qhxs.json
→ **The RKO Keith's is an INTERIOR landmark, not an exterior one.** Wikipedia's Flushing article says
so obliquely — "the lobby of the former RKO Keith's movie theater" (quoted exactly). The writer must
not describe the building's exterior as landmarked. See P26.

**F97.** The same dataset gives **different addresses** for six Flushing landmarks than `buis-pvji`
does. Verbatim `desig_addr` values: `Flushing High School` → `35-01 NORTH BOULEVARD`;
`Flushing Municipal Courhouse` (sic) → `137-35 NORTHERN BOULEVARD`; `Kingsland Homestead` →
`40-25 155 STREET` (`LP-00005`, not the `LP-00005A` amendment); `Lewis H. Latimer House` →
`138-10 32 AVENUE`; `Protestant Reformed Church of Flushing (Bowne Street Community Church)` →
`38-01 BOWNE STREET`; `St. George's (Episcopal) Church, Old Parish House` → `135-33 39 AVENUE`;
`The Weeping Beech Tree` → `143-35 37 AVENUE`.
Source: https://data.cityofnewyork.us/resource/ncre-qhxs.json
→ All seven discrepancies are tabulated in §M with the third and fourth readings from NRHP and PLUTO.
→ Note `Flushing Municipal Courhouse` — the misspelling is the City's, not mine, and it is the LPC's
**original designation name** for what everyone now calls Flushing Town Hall. See P22.

### §E.3 National Register of Historic Places, Flushing rows

**F98.** Verbatim field values parsed from the NRHP row templates
(`refnum || name || address || city || date`):

| refnum | name | address | city | listed |
|---|---|---|---|---|
| `77000974` | `John Bowne House` | `37-01 Bowne St.` | Flushing | 1977-09-13 |
| `06000373` | `Broadway-Flushing Historic District` | `Roughly bounded by 29th Ave., 163rd St., 32nd Ave., 192nd St., 154th and 153rd Sts.` | Flushing | 2006-05-12 |
| `95000270` | `Flushing Armory` | `137-58 Northern Boulevard` | Flushing | 1995-03-23 |
| `91002036` | `Flushing High School` | `35-01 Union St.` | Flushing | 1992-02-10 |
| `72000904` | `Flushing Town Hall` | `137-35 Northern Blvd.` | Flushing | 1972-03-16 |
| `09000834` | `Free Synagogue of Flushing` | `41-60 Kissena Blvd.` | Flushing | 2009-10-16 |
| `72000905` | `Kingsland Homestead` | `37th St. and Parsons Blvd.` | Flushing | 1972-05-31 |
| `04001147` | `Main Street Subway Station (Dual System IRT)` | `Near jct. of Roosevelt Ave. and Main St.` | Flushing | 2004-10-14 |
| `67000015` | `Old Quaker Meetinghouse` | `S side of Northern Blvd.` | Flushing | 1967-12-24 |
| `100002079` | `Old Town of Flushing Burial Ground` | `46th Ave. between 164th & 165th St.` | Flushing | 2018-2-2 |
| `82001260` | `RKO Keith's Theater` | `129-143 Northern Boulevard` | Flushing | 1982-10-29 |
| `08000143` | `St. George's Church` | `135-32 38th Ave.` | Flushing | 2008-03-07 |
| `88002507` | `US Post Office-Flushing Main` | `4165 Main St.` | Flushing | 1988-11-17 |
| `100005569` | `Conrad Voelcker House` | `149-19 38th Ave.` | Flushing | 2020-09-18 |

Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York
(raw wikitext via `action=raw`; NRHP row templates parsed programmatically) `[AGGREGATOR]` — the
underlying authority is the NPS National Register Information System and the verifier should confirm
each refnum there.
→ The `100005569` row carries the description field, quoted exactly: "AKA the Voelker Orth Museum."
→ The `100002079` row carries, quoted exactly: "19th-century local pauper's graveyard is final resting
place of many African-American and Native American residents"
→ The `72000904` row carries, quoted exactly: "1862, now Flushing Council on the Arts"

**F99.** **Four things are on the NRHP but NOT LPC-designated:** the Flushing Armory, the Free Synagogue
of Flushing, the Main Street Subway Station, and the US Post Office–Flushing Main. Neither LPC dataset
returned any of them.
Sources: https://data.cityofnewyork.us/resource/buis-pvji.json,
https://data.cityofnewyork.us/resource/ncre-qhxs.json,
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York
→ `[PARAPHRASE]` — this is my inference from comparing the three query results, not a source's claim.
The verifier should treat it as a hypothesis to test, not a fact.

**F100.** Wikipedia summarises the same split, quoted exactly: "In addition, the Broadway-Flushing
Historic District , Free Synagogue of Flushing , United States Post Office , and Main Street Subway
Station (Dual System IRT) are listed on the National Register of Historic Places ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F101.** Wikipedia's landmarks overview, quoted exactly: "Flushing has many registered New York City
Landmarks , several of which are also located on the National Register of Historic Places . Several city
landmarks are located on the Queens Historical Society's Freedom Mile."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F102.** Wikipedia's list, quoted exactly: "Other landmarks include the Bowne House , Kingsland
Homestead , the Weeping Beech , Old Quaker Meeting House , Flushing High School , St. George's Church ,
the Lewis H. Latimer House , and the lobby of the former RKO Keith's movie theater . The Flushing
Armory , on Northern Boulevard, was formerly used by the National Guard."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F103.** Wikipedia, quoted exactly: "There are several other landmarks in Flushing, but outside the
Freedom Mile. These include the Protestant Reformed Dutch Church of Flushing , the Fitzgerald/Ginsberg
Mansion , on Bayside Avenue and the Voelker Orth Museum , Bird Sanctuary and Victorian Garden."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** "the Fitzgerald/Ginsberg Mansion , **on Bayside Avenue**". The street is Bayside Avenue;
the neighborhood, per LPC, is `QN0704 Murray Hill-Broadway Flushing`, and per GeoSearch it is
"Flushing". **A street named Bayside Avenue is not the neighborhood of Bayside.** This is exactly the
trap the brief warns about. §L row 14.

### §E.4 The Freedom Mile / Freedom Trail — a naming conflict

**F104.** Wikipedia calls it the **Freedom Mile**, twice, quoted exactly: "Several city landmarks are
located on the Queens Historical Society's Freedom Mile." and "There are several other landmarks in
Flushing, but outside the Freedom Mile."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

**F105.** Queens Historical Society, reproducing the NYC Parks sign text on its own Weeping Beech Park
page, calls it the **Freedom Trail**, quoted exactly: "The latter portion was named Carman Green in 1976
for Margaret I. Carman (1890-1976), a Flushing High School teacher who created the Flushing Freedom
Trail to link the area's rich heritage through its landmarks."
Source: https://www.queenshistoricalsociety.org/weeping-beech-park (the page ends with the line
"Information from www.nycgovparks.org", so this is NYC Parks text republished by QHS)

**F106.** Wikipedia's Flushing navbox uses a third name, quoted exactly: "Heritage Trail, Downtown
Flushing".
Source: https://en.wikipedia.org/wiki/Flushing_Armory (Flushing navbox) `[AGGREGATOR]`
→ **FLAG: three names for what may be one thing — "Freedom Mile", "Flushing Freedom Trail", "Heritage
Trail, Downtown Flushing".** The QHS website's own navigation, which I fetched, has no page for any of
them (`/freedom-mile` returned HTTP 404). The verifier must establish whether these are one route or
several, and what the current operator calls it, before the writer names it. Recorded, not resolved.
→ Margaret I. Carman is independently attested: Wikipedia's notable-people list has, quoted exactly,
"Margaret I. Carman (1890–1976), teacher who taught for 44 years at Flushing High School", citing NYC
Parks' "Local Female Leaders & Activists" page.
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

---

## §F — Candidate places: landmarks, museums and historic houses

### P9 — Bowne House
**Address (institution's own):** "37-01 BOWNE STREET, FLUSHING NY 11354" — https://www.bownehouse.org/about
**Address (LPC):** `37-01 Bowne Street` (`LP-00143`) · **NRHP:** `37-01 Bowne St.` (`77000974`) ·
**PLUTO:** `37-01 BOWNE STREET`, zip `11354`, `cd: 407`, `yearbuilt: 1661`, `lotarea: 20250`,
`bldgclass: P7`, owner `NYC DEPARTMENT OF PARKS AND RECREATION` · **GeoSearch neighbourhood:** `Flushing`
All four agree. This is the cleanest address in the file.

**F107.** LPC, quoted exactly: "BOWNE HOUSE, 37-01 Bowne Street, Flushing, Queens. 1661; architect
unknown." and "Landmark Site: Borough of Queens Tax Map Block 5013, Lot 6."
Source: LPC **LP-00143**, February 15, 1966, Number 8 — http://s-media.nyc.gov/agencies/lpc/lp/0143.pdf
**F108.** LPC, quoted exactly: "The Bowne House is one of the most attractive small English Colonial
houses remaining from an early period of our history. The original portion, containing a kitchen with
bedrooms upstairs, was constructed by John Bowne in 1661. It still stand~ little changed from its
original appearance in the Seventeenth Century. Nine generations of Bownes lived in this wood frame
house. Additions were built in 1680 and 1691 and in 1830 the roof was raised, and the north wing was
added." `[OCR]` ("stand~" is "stands")
Source: LPC **LP-00143**
**F109.** LPC, quoted exactly: "The steep picturesque roof over the main portion of the house shows
medieval influence and has three shed dormers. This house of simple wood construction was used for over
thirty years as a place of worship before the Friends Meeting House of Flushing was built in 1694."
Source: LPC **LP-00143**
**F110.** LPC, quoted exactly: "The importance of this house, the oldest in Queens, lies not only in its
age and charm but also because of its ass ociation with reli gious fre edom in America. J ohn Bowne, a
Quaker, who defied Governor Stuyvesant's ban on those he called 11 an abominable sect 11 , was fined and
jailed because he refused to re-nounce his right to religious freedom." `[OCR]` (the `11` marks are the
scanner's rendering of quotation marks around "an abominable sect")
Source: LPC **LP-00143**
→ **"the oldest [house] in Queens" is an LPC finding from 1966.** It is a strong claim and the writer
will want it. Verify whether it still stands in 2026.
**F111.** LPC, quoted exactly: "Since 1946, the building has been owned and operated as a house museum
and a "Shrine to Religi ous Freedom" by the Bowne House Historical Society." `[OCR]`
Source: LPC **LP-00143**
→ **FLAG:** PLUTO gives the current owner as `NYC DEPARTMENT OF PARKS AND RECREATION`, not the
Historical Society. Ownership evidently changed after 1966. §M row 1. Do not publish the 1966 ownership
sentence as present tense.
**F112.** LPC's findings, quoted exactly: "The Commission further finds that, among its important
qualities, the Bowne House is an extremely important example of early English Colonial archi-tecture,
that it is beautifully preserved and handsomely furnished and that it is an important symbol of
religious liberty."
Source: LPC **LP-00143**
**F113.** The Bowne House Historical Society's own mission, quoted exactly: "The dual mission of the
Bowne House Historical Society is: To educate the public about Queens, New York State, and American
history through the 300-year legacy of the Bowne and Parsons families. To further the preservation and
interpretation of the circa 1661 Bowne House, its collections, and its material and documentary heritage."
Source: https://www.bownehouse.org/about
→ Note "**circa** 1661" from the institution, against LPC's flat "1661" and PLUTO's `yearbuilt: 1661`.
**F114.** Bowne House, quoted exactly: "We focus our interpretive and research efforts on the activities
of multiple generations of Bowne House residents known for their association with liberty of conscience
and religious freedom in early America, and for their later involvement with Abolition and the
Underground Railroad."
Source: https://www.bownehouse.org/about
**F115.** Bowne House, quoted exactly: "Bowne House is a New York City landmark and is on the National
Register of Historic Places, as well a member of the National Park Service's National Underground
Railroad Network to Freedom program."
Source: https://www.bownehouse.org/about
→ **The Network to Freedom membership is a distinctive, checkable, travel-worthy fact and I found it
only here.** Verify against the NPS Network to Freedom database.
**F116.** Bowne House, quoted exactly: "Most of the approximately 5,000 objects in the Museum's
collection are original to the House; a rarity found in few cultural institutions open to the public. On
view are fine examples of English and American furniture and decorative art. The Bowne House Archives ,
an extensive collection available to readers by appointment, document the history and civic activities of
the Bowne and Parsons' families – occupants of the house from the 17th through the 20th centuries."
Source: https://www.bownehouse.org/about
**F117.** Bowne House phone, quoted exactly: "718.359.0528"
Source: https://www.bownehouse.org/about
→ **Hours and admission: NOT FOUND.** `/visit`, `/guided-tours`, `/directions-parking` and
`/nearby-sites` all returned HTTP 404 on my retrieval. The writer must not invent opening times.
**F118.** NYC Parks, on the Weeping Beech Park sign as republished by QHS, quoted exactly: "Adjacent to
the park is the oldest landmark in the area, the Bowne House, located at Bowne Street and 38th Avenue.
It was built by John Bowne in 1661 and, as perhaps the oldest existing house of worship in America, is
celebrated as a "national shrine to religious freedom.""
Source: https://www.queenshistoricalsociety.org/weeping-beech-park
→ **FLAG, hard.** This sentence calls the Bowne House a **house of worship** — "perhaps the oldest
existing house of worship in America". LPC's Friends Meeting House report calls the *Meeting House*
"the oldest house of worship standing in New York City" (F123). These two claims collide. Note also the
address given here — "Bowne Street and 38th Avenue" — is a fourth form. §N row 10; §M row 1.
**F119.** John Bowne's dates, per NYC Parks: "John Bowne (1627-1695)".
Source: https://www.nycgovparks.org/parks/bowne-park/history

### P10 — Old Quaker Meeting House / Friends Meeting House
**LPC name:** `Friends Meeting House`, `137-16 Northern Boulevard`, `LP-00141`, designated 8/18/1970 ·
**NRHP:** `Old Quaker Meetinghouse`, `S side of Northern Blvd.`, `67000015`, listed 1967-12-24 ·
**PLUTO:** `137-16 NORTHERN BOULEVARD`, zip `11354`, `cd: 407`, **`yearbuilt: 1694`**, `lotarea: 40344`,
owner `SOCIETY OF FRIENDS` · **GeoSearch:** `Flushing`
→ **Three different names for one building: "Friends Meeting House" (LPC), "Old Quaker Meetinghouse"
(NRHP), "Old Quaker Meeting House" (Wikipedia).** §M row 2.

**F120.** LPC, quoted exactly: "FRIENDS MEETING HOUSE, 137-16 Northern Boulevard, Flushing, Borough of
Queens. Built in 1694, enlarged 1716-19; architects unknown." and "Landmark Site: Borough of Queens Tax
Map Block 4977, Lot 26."
Source: LPC **LP-00141** — http://s-media.nyc.gov/agencies/lpc/lp/0141.pdf
**F121.** LPC, quoted exactly: "The Meeting House of the Rei igious Society of Friends in Flushing dates
back to 1694. At that time a smal I frame structure, the easterly third of the present building, was
built on land acquired two years previously by John Bowne and John Rodman, both wei 1-known leaders of
the Friends. In 1716-1719 the building was enlarged to its present size. The division between the two
construction periods is proven by internal structural evidence and is apparent on the south side from the
different spacing of the windows. The chimney rises on the I ine of the original west wal I." `[OCR]`
Source: LPC **LP-00141**
**F122.** LPC on the architecture, quoted exactly: "The edifice is a prime example of medieval survival
in its proportions and framing system. It is a plain rectangular building erected on a frame of forty-
~oot oak timbers, each hand hewn from a single tree. The architectural interest of the building is
derived chiefly from its unusually steep hip roof; the roof is almost as high as the two stories below
it. This feature can be traced to the high steep roofs of medieval Hoi land, which had changed from gable
roofs to the hip shape i n the 17th century ." `[OCR]` ("~oot" is "foot"; "Hoi land" is "Holland")
Source: LPC **LP-00141**
→ **"a frame of forty-foot oak timbers, each hand hewn from a single tree" is the best single physical
detail in the file.** Verify the number against the PDF.
**F123.** LPC, quoted exactly: "This is the oldest house of worship standing in New York City, and one of
the oldest in the country. The first meeting held in this building occurred on November 24, 1694."
Source: LPC **LP-00141**
**F124.** LPC, quoted exactly: "In 1695, formation of the New York Yearly Meeting for the province
included agreement that it be held at the Flushing Meeting House. It continued to assemble there from
1696 to 1778."
Source: LPC **LP-00141**
**F125.** LPC on the two doors, quoted exactly: "Both the entrances on the south front, one for men and
one for women, have double doors. The porch, add ed along this s ide in the 19th century, is supported by
slender squa re columns, and its shingled roof echoes the hip roof of the building. Simp! icity is the
keynote, both outside and inside, as the Friends desired that no worldly ostentation should distract
their attention from worship." `[OCR]`
Source: LPC **LP-00141**
**F126.** LPC on abolition preaching at the Meeting House, quoted exactly: "As early as 1716 the Flushing
Meeting House was the scene of preaching against slavery by William Burling and John Farmer. They were
followed by John Woolman , Matthew Frankl in who is buried here and Elias Hicks, alI of whom attacked the
slavery problem during the colonial period. John Murray, Jr., also buried here, was the founder, in 1785,
and first treasurer of the New York Society for the Manumission of Slaves. In his role as founder also of
the New York Public School Society, Murray is considered the father of pub! ic education in New York City."
`[OCR]`
Source: LPC **LP-00141**
→ **This is the richest single paragraph I found and it is primary.** Five named abolitionists, a burial
ground, and a founding claim about public education in New York City.
**F127.** LPC on the burial ground, quoted exactly: "The burial ground of the Meeting House has the quiet
beauty of grass and trees. Graves were not marked before 1835 and the later graves have only simple low
grave-stones, any form of ostentation being inconsistent with Quaker beliefs. The land had been given for
a burial ground as early as 1667 by John Bowne. In addition to those mentioned above, Joshua Kimber who
"kept school" in the former nearby Friends School is buried here as wei I as Samuel Leggett, organizer and
president in 1823 of the New York Gas Light Company --one of the predecessor companies of Consol !dated
Edison. He was the first resident of New York City to have his home I i ghted by gas." `[OCR]`
Source: LPC **LP-00141**
**F128.** LPC on the setting, quoted exactly: "The pleasant landscaped setting of the Meeting House was
formerly set apart from Northern Boulevard by a picket fence; it now has a stone wal I. The building stilI
faces south, however, with its back to the street." `[OCR]`
Source: LPC **LP-00141**
**F129.** Wikipedia, quoted exactly: "Landmarks remaining from the Dutch period in Flushing include the
John Bowne House (c. 1661) on Bowne Street and the Old Quaker Meeting House (1694) on Northern Boulevard ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F130.** Wikipedia lists among Flushing's houses of worship, quoted exactly: "the Dutch colonial epoch
Quaker Meeting House".
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ The congregation's own site (https://flushingfriends.org/) was fetched and returned content, but I did
not extract usable verbatim sentences from it before the file was written. **Gap for the verifier.**

### P11 — Kingsland Homestead and P12 — the Queens Historical Society
**LPC (amended site):** `Kingsland Homestead, Amendment to Landmark Site`, `143-35 37th Avenue`,
`LP-00005A`, 10/14/1965 · **LPC (original site):** `Kingsland Homestead`, `40-25 155 STREET`, `LP-00005` ·
**NRHP:** `Kingsland Homestead`, `37th St. and Parsons Blvd.`, `72000905` · **PLUTO:** `143-35 37 AVENUE`,
zip `11354`, `cd: 407`, `yearbuilt: 1785`, owner `NYC DEPARTMENT OF PARKS AND RECREATION` ·
**QHS's own:** "143-35 37th Avenue / Flushing, NY 11354"
→ **Four addresses. The house was physically moved in 1968, which explains most of it.** §M row 3.

**F131.** QHS, quoted exactly: "Built between 1774 and 1785, the Kingsland Homestead is one of the
earliest surviving examples of residential style construction common throughout Long Island, specifically
Queens, in the late 18th and 19th centuries. A Long Island half-house, it is characterized by a wide side
hall and double parlors off to one side. Other features include a central chimney between the side
parlors, a dependent kitchen wing, and three front windows on the second floor."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ **"Built between 1774 and 1785"** (QHS) vs PLUTO's flat `yearbuilt: 1785` vs Wikipedia's "The 1785
Kingsland Homestead" (F135). §M row 3.
**F132.** QHS on the hybrid architecture, quoted exactly: "The design of Kingsland exhibits a blend of
Dutch and English features brought to America by colonists from Europe. One such Dutch characteristic
includes the divided entry doors, more commonly known as Dutch doors. English colonial features are the
central chimney and the round-headed and quadrant windows in the gambrel-end. The gambrel or double-pitched
roof formed a spacious attic, sometimes used as servants' quarters."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
**F133.** QHS on Captain King, quoted exactly: "Captain Joseph King purchased this Flushing farmhouse from
his father-in-law in 1801, his family and their descendants would live there until the 1930s. Captain King
named his rural estate "Kingsland," and made improvements such as: adding gutters, installing window
shutters, and plastering and painting the upstairs rooms as well as the kitchen wing."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
**F134.** QHS on slavery, quoted exactly: "Captain King was a sea merchant and also a commercial farmer.
He raised livestock and grew such staples as corn and wheat for profit. Hired laborers did most of the work
on his sixty-acre farm. Although his father-in-law had resorted to using slaves, which was a common practice
at that time, Captain King was opposed to slavery, and he sometimes employed fugitive slaves on his farm."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ **FLAG:** this is a museum's account of its own founder's relationship to slavery and it is
self-exculpatory in structure. Record it; do not launder it. Note also it does not say the father-in-law's
enslaved people were freed.
**F135.** QHS on "Aunt Mary" and the Flushing Female Association, quoted exactly: "Captain King's daughter,
Mary Ann, the first of his children to be born at Kingsland, married Lindley Murray at the Flushing Meeting
House on what is now Northern Blvd in 1831. Mary Ann's oldest daughter, Mary (later known as Aunt Mary),
devoted herself to the cause of helping African-Americans gain an equal footing in American life. She taught
at a number of African-American Sunday schools and, in 1851, joined the Flushing Female Association, a Quaker
group that established the town's only school for African-American children."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ **"the Flushing Female Association, a Quaker group that established the town's only school for
African-American children" is a first-rate, distinctive, travel-worthy fact.** Verify independently.
**F136.** QHS on the diary, quoted exactly: "Much of what we know of Kingsland comes from the surviving
fragments of her diary. It reveals, for example, that a telephone was installed in the house on January 15,
1903 and electric wiring on June 5, 1906." and "Aunt Mary resided in her attic apartment until 1908 when her
nephew Joseph-Harris Murray moved in with his family. She then relocated to a house on Franklin Place where
she died in 1920 at the age of eighty-eight."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
**F137.** QHS on the failed subway speculation, quoted exactly: "In 1926, Kingsland was moved a few hundred
feet south on the property so the Murrays could build a luxury apartment building which they would call
"Kings Court" to capitalize on a proposed subway stop nearby. Joseph Harris Murray then moved his family back
into Kingsland." and "Unfortunately for the Murrays, the new subway stop was never built, and tenants were
scarce due to the high rent at Kings Court. When the Great Depression came, Joseph Harris King moved into a
Kings Court apartment, and in 1937 sold the house to the Dixon family."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ Note the source slips between "Joseph Harris **Murray**" and "Joseph Harris **King**" in adjacent
sentences. Flagged; do not reproduce the confusion.
**F138.** QHS on the designation and the move, quoted exactly: "Kingsland Homestead, one of the few surviving
18th century homes in Queens, was declared a New York City Landmark in 1965. It was the first structure in
Queens to receive this honor. Threatened by the development of a shopping center and new houses, a group of
concerned citizens, the Kingsland Preservation Committee, assisted by the Society for the Preservation of Long
Island Antiquities, had the historic home moved in 1968 onto a modern foundation in Weeping Beech Park. Since
the park was originally part of the Parsons Nursery and the historic site of America's first weeping beech
tree, it was an appropriate location."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ **"the first structure in Queens" to be landmarked.** LPC's own data corroborates the date: `LP-00005`,
`desdate 10/14/1965` — the lowest LP number in Queens among everything I queried. Strong.
**F139.** QHS on becoming a museum, quoted exactly: "In 1971, the Kingsland Preservation Committee merged with
the Queens Historical Society and by 1973, after extensive restoration work, the house was opened to the public
as a museum owned and operated by the historical society."
Source: https://www.queenshistoricalsociety.org/kingsland-homestead
→ **FLAG:** "owned and operated by the historical society" vs PLUTO owner `NYC DEPARTMENT OF PARKS AND
RECREATION`. Same pattern as the Bowne House (F111). §M row 3.
**F140.** QHS's own identity, quoted exactly: "The Queens Historical Society (QHS) is the historical society
for the largest borough in New York City and is dedicated to preserving the history of Queens through
educational programs, exhibitions and its role as a local history research center."
Source: https://www.queenshistoricalsociety.org/
**F141.** QHS visitor information, quoted exactly: "Queens Historical Society / 143-35 37th Avenue / Flushing,
NY 11354"; "Museum Hours For Guided Tours / 2:30pm – 4:30pm / Wednesdays, Saturdays, & Sundays";
"Admission Prices / $5 Adults / $3 Students, Seniors & Veterans / $3 for visitors with disabilities (care
partner free of charge) / Free for Members / Free for children under 12"; "Email:
info@queenshistoricalsociety.org / Phone: 718-939-0647 ext. 17"; "Entry is by advance timed ticket only!"
Source: https://www.queenshistoricalsociety.org/location-hours
**F142.** QHS accessibility and languages, quoted exactly: "Kingsland Homestead — 1st Floor Wheelchair
Accessible"; "Weeping Beech Park Accessible when contacted ahead of time"; "Tours — We have translations
available for tours in Mandarin Chinese and Spanish".
Source: https://www.queenshistoricalsociety.org/location-hours
**F143.** QHS walking directions — useful and specific, quoted exactly: "At Time Square, 5th Ave., or Grand
Central take the IRT #7 train to last stop: Main Street, Flushing. Walk two blocks east on Roosevelt Avenue to
Bowne Street. Turn left, continue walking until you reach Margaret Carman Green Park. Walk through the park.
The Society is the first house on the left hand side."
Source: https://www.queenshistoricalsociety.org/location-hours
**F144.** QHS parking, quoted exactly: "Unfortunately, there is no designated parking on the museum premises.
Street parking is available."
Source: https://www.queenshistoricalsociety.org/location-hours
**F145.** QHS's site navigation lists three sites it interprets: "Kingsland", "Weeping Beech Park",
"Moore-Jackson Cemetery".
Source: https://www.queenshistoricalsociety.org/
→ **FLAG:** the **Moore-Jackson Cemetery is in Woodside**, not Flushing — Woodside already ships a page.
QHS is a Flushing-based institution that interprets a site outside Flushing. §L row 13. Do not import it.

### P13 — The Weeping Beech Tree, and P14 — Margaret I. Carman Green–Weeping Beech Park
**LPC:** `Weeping Beech Tree`, `Weeping Beech Park, 37th Avenue between Parsons Boulevard and Bowne Street`,
`LP-00142`, designated 4/19/1966 (a **living tree** designated as an individual landmark)

**F146.** LPC's header line, quoted exactly: "THE WEEPnm BEECH TREE, .37th Avenue between Parsons Boulevard
and Bowne Street, Flushing, Borough of Queens. 1647." and "Landmark Site: Borough of Queens Tax Map Block
5012, Lot 60." `[OCR]`
Source: LPC **LP-00142**, April 19, 1966, Number 6 — http://s-media.nyc.gov/agencies/lpc/lp/0142.pdf
→ **FLAG, and treat "1647" with great suspicion.** QHS gives the tree's life as "from 1847 to 1998" (F149).
"1647" in a 1966 typescript scan is very likely a mis-set or mis-scanned "1847". **Do not publish 1647.**
§N row 11. Verifier must read the PDF image.
**F147.** LPC on the tree's provenance, quoted exactly: "Historically, it is interesting to note that, while
travelling in Europe, Samuel Parsons, a Flushing nurseryman, purchased a section from a tree on the estate of
Baron DeMann, in Beersal, Belgium, and planted it on this site.. Today it is over sixty feet high and has a
spread of about eighty-five feet. The circumference of the trunk is fourteen feet."
Source: LPC **LP-00142**
**F148.** LPC's setting description, quoted exactly: "Standing in the center of a small, neatly landscaped
park in a residential part of Flushing, and prot.e cted by an iron fence about one hundred feet in diarooter,
this extraordinary girt of nature with a spread of almost eighty-five feet stands in its inposing majesty for
all to admire. A walkway, concentric with the outer circumference of the fence, and comfortable benches,
placed at strategic points, allow visitors to enjoy this beautiful old tree from all sides." `[OCR]`
("diarooter" is "diameter"; "girt" is "gift"; "inposing" is "imposing")
Source: LPC **LP-00142**
**F149.** QHS / NYC Parks, quoted exactly: "The Weeping Beech tree that once rooted itself in this park lived
for 151 years, from 1847 to 1998 — one of the City's few trees to be landmarked. The tree originated at a
nobleman's estate in Beersal, Belgium from whence it was transported to New York City by the efforts of one
enterprising gardener. Samuel Bowne Parsons (1819-1907), a prominent horticulturalist and father of Parks
Superintendant Samuel Parsons Jr. (1844-1923), obtained the seedling and planted it on the grounds of his
renowned nursery."
Source: https://www.queenshistoricalsociety.org/weeping-beech-park (republishing NYC Parks sign text)
→ **THE TREE IS DEAD. It died in 1998.** A writer working from the 1966 LPC report alone would describe a
living landmark. This is the most likely single factual error the page could make. **Flagged in the
strongest terms.**
→ **FLAG:** Samuel Bowne Parsons's death year is given as **1907** here and as **1906** by NYC Parks'
Kissena Park sign (F87). §N row 12.
**F150.** QHS / NYC Parks on the tree's form, quoted exactly: "In its maturity, its branches touched the
ground and re-rooted, creating a ring of offspring surrounding its immense canopy. In the years before it
finally succumbed to old age, it reached sixty feet in height with a "leaf curtain" of eighty feet in
diameter. Legend has it that this tree gave rise to generations of Weeping Beeches (Fagus sylvatica) in
America."
Source: https://www.queenshistoricalsociety.org/weeping-beech-park
→ Spread: LPC says "almost eighty-five feet" and "about eighty-five feet" (F147–F148); Parks says "eighty
feet in diameter" (F150). §N row 12.
→ Note the hedge "**Legend has it**".
**F151.** QHS / NYC Parks on the park's own history, quoted exactly: "This parkland was first acquired by
Parks in 1925, and was originally known as Jackson Park due to its location on Jackson Avenue (now called
Northern Boulevard). The playground opened on October 10, 1950 and a second parcel was added in 1951. The
latter portion was named Carman Green in 1976 for Margaret I. Carman (1890-1976)…"
Source: https://www.queenshistoricalsociety.org/weeping-beech-park
→ **Northern Boulevard has had at least three names: Jackson Avenue, Broadway, Northern Boulevard.** F81
gives the Broadway→Northern Boulevard rename; F151 gives Jackson Avenue→Northern Boulevard. The verifier
should reconcile.
**F152.** QHS / NYC Parks, quoted exactly: "From Bowne's courageous defense of the Quakers' right to worship,
to Kingsland Homestead in the post-revolutionary period, to the Weeping Beech, a reminder of the nurseries
that flourished in Flushing up through the 19th century, this cluster of landmarks unites three centuries of
Queens' history." and "2.074 Acres"
Source: https://www.queenshistoricalsociety.org/weeping-beech-park
→ **This "cluster" sentence is the single best organising idea available to the writer**: Bowne House,
Kingsland Homestead and the Weeping Beech site stand within one short walk, and NYC Parks itself frames them
as one three-century sequence.
→ NYC Parks' own page for this park (`/parks/margaret-i-carman-green-weeping-beech-park/history`) returned
an empty body on every attempt; the slug is confirmed present in NYC Parks' "Other Parks Nearby" links from
the Bland Playground page as "Margaret I. Carman Green - Weeping Beech". **Gap: fetch it directly.**

### P15 — Flushing Town Hall (LPC name: Flushing Municipal Courthouse)
**LPC:** `Flushing Town Hall` / `Flushing Municipal Courhouse` (sic), `137-35 Northern Boulevard`, `LP-00139`,
designated 7/30/1968 · **NRHP:** `Flushing Town Hall`, `137-35 Northern Blvd.`, `72000904`, listed 1972-03-16 ·
**PLUTO:** `137-35 NORTHERN BOULEVARD`, zip `11354`, `cd: 407`, `yearbuilt: 1862`, `lotarea: 18000`,
`bldgclass: P5`, owner `NYC DEPARTMENT OF CULTURAL AFFAIRS` · **Institution's own:** "137-35 Northern Blvd.,
Flushing, NY 11354"

**F153.** LPC header, quoted exactly: "FLUSHING MUNICIPAL COURTHOUSE, 137-35 Northern Boulevard, Flushing,
Borough of Queens. 1862" and "Landmark Site : Borough of Queens Tax Map Block 4960 , Lot 1."
Source: LPC **LP-00139**, July 30, 1968, Number 1 — http://s-media.nyc.gov/agencies/lpc/lp/0139.pdf
**F154.** LPC on the architecture, quoted exactly: "Striking in the picturesqueness of its profiles; the
Flushing Courthouse or Town Hall is a noteworthy example of an early phase of the Romanesque Revival style so
popular in the United States, just prior to the Civil Wa r . This two - story brick building , used in later
years as a courthouse, is important architecturally as a representative example of the small town hall which
was so much a part of the American scene."
Source: LPC **LP-00139**
**F155.** LPC's façade description, quoted exactly: "The impressive front facade is divided into three parts,
sep-arated by tall , thin buttresses which rise above the walls. All the walls are finished at the roof line
with a continuous band of diminutiv e arched corbels and a plain cornice. The arched windows are paired under
l a rge round arches , and those on the second floor are quit e high. Dominating the front e ntrance , and
standing on a raised pl a tform five steps ab ov e the sidewa lk , is a striking triple-arched portico , crowned
by a classic entablature with low balustrade." `[OCR]` (LPC's scan inserts spaces inside words throughout;
the verifier must normalise before quoting)
Source: LPC **LP-00139**
**F156.** LPC on the building's uses, quoted exactly: "The Flushing Town Hall wa s the focal point of every
important town function from 1862 to 1900. It was us e d for community meet-ings , f a ncy dress balls for
military a nd volunt ee r fir e comp a ny celebratiQns and for small opera productions. Tom Thumb per-formed
there , and Teddy Roosevelt gave one of his Presidential campaign speeches from th e steps o f the portico. It
also s e rv e d later a s a courthous e , offices for municipal bureaus , a nd a police pr e cinct for th e
World 1 s Fa ir of 1964 - 65." `[OCR]`
Source: LPC **LP-00139**
→ **Tom Thumb and a Theodore Roosevelt stump speech from the portico steps are exactly the kind of detail
the page wants.** Both are uncited within the LPC report. Verify.
**F157.** LPC on the Civil War, quoted exactly: "During th e Civil War , Flushing 1 s Volunteer Artill e ry
Unit , later to b e come the 34th Ind e pendent N. Y. Battery of the Union Army , was hous e d in th e structure
. Th e Hall was used for a far e well ceremony wh e n th e men march e d to war. The Old Hamilton Rifles, l a
ter to b e com e th e 17th Sep a r a t e Company of Flushing , a lso h a d q u a rt e rs in the buildin g ."
`[OCR]`
Source: LPC **LP-00139**
**F158.** LPC on the setting — useful for the walking geography, quoted exactly: "It is locat e d i n a
historic s e tting , for in th e dir e ct vici nit y a r e th e Qu a k e r Mee tin g Hous e, the Bowne House ,
and on an isl a nd in th e boul e vard a re monuments to th e d ea d of various wa rs." `[OCR]`
Source: LPC **LP-00139**
→ **"on an island in the boulevard are monuments to the dead of various wars"** — a war-memorial island in
the middle of Northern Boulevard. I found no other source for it. Verify on the ground / in Parks data.
**F159.** LPC's finding, quoted exactly: "The Comm ission further finds that, among its important quali-ties,
th e Flushing Municipal Courthouse is a noteworthy example of the early Romanesque Rev iv a l style of
architecture, th a t in this City it r ep r ese nts the sol e r ema ining examp le of th e s ma ll town h a ll
of t he 1860 period" `[OCR]`
Source: LPC **LP-00139**
→ **"the sole remaining example of the small town hall of the 1860 period" in New York City** — a strong,
quotable superlative, from 1968. Check whether it still holds.
**F160.** Wikipedia, quoted exactly: "Flushing Town Hall on Northern Boulevard is the headquarters of the
Flushing Council on Culture and the Arts, an affiliate of the Smithsonian Institution , and houses a concert
hall and cultural center."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** "an affiliate of the Smithsonian Institution" is a strong institutional claim that I could **not**
confirm on Flushing Town Hall's own site — `/about`, `/about-us`, `/mission-history` and `/visitor-info` all
resolved to the site's 404 page on my retrieval. **Do not publish the Smithsonian affiliation without
confirmation.** The NRHP row's description field says only "1862, now Flushing Council on the Arts" (F98).
**F161.** Flushing Town Hall's own footer, quoted exactly: "137-35 Northern Blvd., Flushing, NY 11354" and
"(718) 463-7700 x 222" and "© 2026 All Rights Reserved by Flushing Town Hall".
Source: https://www.flushingtownhall.org/
**F162.** Flushing Town Hall's site navigation offers the page in seven languages, listed exactly: "English",
"Spanish", "Chinese", "Korean", "Vietnamese", "Hindi", "Arabic".
Source: https://www.flushingtownhall.org/
→ **A concrete, checkable expression of the neighborhood's linguistic makeup, from an institution rather than
a census table.** Good material.
**F163.** Flushing Town Hall's navigation includes "Monthly Jazz Jams" (under Education) and "Queens Jazz Trail
Map" (under About).
Source: https://www.flushingtownhall.org/
→ The Queens Jazz Trail Map page fetched (2170 chars) but I did not extract verbatim content from it.
**Gap for the verifier** — and note the Jazz Trail almost certainly runs to Corona and Addisleigh Park as well
as Flushing, so it is a cross-neighborhood asset. §L row 15.

### P16 — Lewis H. Latimer House Museum
**LPC:** `Lewis H. Latimer House`, `34-41 137th Street`, `LP-01924`, designated 3/21/1995 ·
**LPC (`ncre`):** `138-10 32 AVENUE` · **PLUTO:** `138-10 32 AVENUE`, zip `11354`, `cd: 407`,
`yearbuilt: 1990`, `lotarea: 325000`, `bldgclass: Q2`, owner `NYC DEPARTMENT OF PARKS AND RECREATION` ·
**Institution's own:** "34-41 137th St. Flushing, NY 11354" · **GeoSearch:** `Flushing`
→ **The house was moved in 1988; PLUTO's `yearbuilt: 1990` and `bldgclass: Q2` describe the parkland lot, not
the 1880s house.** §M row 4. **Do not publish 1990 as the build year.**

**F164.** LPC header, quoted exactly: "LEWIS H. LATIMER HOUSE, 34-41 137th Street, Flushing, Queens. Built c.
1887-89."
Source: LPC **LP-01924**, March 21, 1995, Designation List 262 — http://s-media.nyc.gov/agencies/lpc/lp/1924.pdf
**F165.** LPC's summary, quoted exactly: "The Lewis H. Latimer House was the home for twenty-six years of the
African-American inventor who is renowned for his work and writings in the field of electric lighting. This
Queen Anne style frame house (fig. 1), built c. 1887 to 1889 for Emma and William Sexton, was acquired by Lewis
and Mary Wilson Latimer in 1902. It was the only house the Latimers owned in New York, and Latimer himself
designed two additions to the house."
Source: LPC **LP-01924**
**F166.** LPC, quoted exactly: "The house not only offered a comfortable home for the Latimer family, but it was
also a meeting place for prominent African-American civic and cultural leaders."
Source: LPC **LP-01924**
**F167.** LPC on Latimer's career, quoted exactly: "Latimer (1848-1928) worked with Alexander Graham Bell in the
preparation of the patent application for the telephone in 1876, and in early 1880s, as an engineer with the
United States Electric Lighting Company, he was responsible for numerous inventions, including his most
important discovery, a method of producing long-lasting carbon filaments that made the production of light bulbs
both practical and affordable for the average household. He was hired as a patent expert by Thomas Alva Edison
around 1885 and worked in the legal department of the Edison Electric Lighting Company, later the General
Electric Company, for over twenty years."
Source: LPC **LP-01924**
**F168.** LPC, quoted exactly: "Latimer was a prominent member of the African-American community in
turn-of-the-century New York and an early advocate of civil rights and black cultural identity. As Latimer's
long-time home, this house remains the most significant site in New York City associated with Latimer, and it was
owned by the Latimer family until 1963."
Source: LPC **LP-01924**
**F169.** LPC on the move, quoted exactly: "In 1988, when the house was threatened with demolition, it was moved
to its present site across the street from the Latimer Gardens housing project, which had been named in Lewis
Latimer's honor (fig. 2) . Plans are underway to restore the house and open it as a house museum, under the
management of the Lewis H. Latimer Fund."
Source: LPC **LP-01924**
→ **The house stands across the street from a NYCHA development named for the same man.** Excellent, specific,
and it explains the address confusion.
**F170.** LPC on Latimer's origins, quoted exactly: "Born in Chelsea, Massachusetts, in 1848, Lewis H. Latimer
(fig .3) was the son of George and Rebecca Latimer, former slaves who escaped to freedom . Lewis Latimer
attended the Phillips Grammar School in Boston until family circumstances forced him to leave school at age ten."
Source: LPC **LP-01924**
**F171.** The museum's own biography, quoted exactly: "Lewis Howard Latimer was born on September 4th, 1848 in
Chelsea, Massachusetts. His parents were self-emancipated enslaved Virginians. Growing up, Latimer faced many
challenges due to racial discrimination prevalent at the time. He enlisted in the Union Navy in 1864 at the age
of 16 and –with no access to formal education– taught himself mechanical drawing. Eventually, he became a chief
draftsman, patent expert, and inventor."
Source: https://www.lewislatimerhouse.org/about
→ LPC: "former slaves who escaped to freedom"; museum: "self-emancipated enslaved Virginians". Both are
recorded; the museum's phrasing is the more current and is the institution's own.
→ **FLAG:** LPC says Latimer "left school at age ten" and enlisted; the museum says he "enlisted in the Union
Navy in 1864 at the age of 16". Wikipedia's Flushing article is silent. These are compatible but the writer
should not blend them.
**F172.** The museum, quoted exactly: "Lewis Howard Latimer / September 4, 1848 – December 11, 1928" and "Lewis
Latimer died on December 11, 1928 at the age of 80 in Flushing, Queens, New York."
Source: https://www.lewislatimerhouse.org/about
→ **He died in Flushing.** That is the anchor that makes him a Flushing subject rather than a borrowed one.
**F173.** The museum on the inventions, quoted exactly: "Latimer also worked with Thomas Alva Edison on the
development and commercialization of the incandescent light bulb. Furthermore, Latimer worked with Hiram S.
Maxim, significantly improving the production of carbon filament. His invention of a method to manufacture
carbon filament to make lightbulbs mass-producible was patented in 1882." and "In addition to helping others,
Latimer designed his own inventions including an early air conditioning unit and an improved railroad car
bathroom. In total, the United States government awarded him patents for seven of his own inventions."
Source: https://www.lewislatimerhouse.org/about
→ **FLAG on a claim the writer will be tempted to overstate.** The museum's own FAQ answers "Did Lewis Latimer
invent the lightbulb?" with, quoted exactly: "Like any invention, the lightbulb was developed over time by teams
of experts through multiple evolutions. Lewis Howard Latimer made significant contributions to the incandescent
lightbulb, working with Hiram Maxim and Thomas Alva Edison on the development and commercialization." And "Did
Lewis Latimer invent the telephone?" with: "Not exactly, but Lewis Howard Latimer worked alongside Alexander
Graham Bell to develop it." **The institution itself is careful here; the page must be too.**
**F174.** The museum on Latimer's other life, quoted exactly: "In 1873, Latimer married Mary Wilson in Fall
River, Massachusetts, and they had two daughters. The family were active members of the Unitarian Church, and
Latimer was very involved in Civil War veteran groups like the Grand Army of the Republic. He was a prominent
member of the African American community and worked to promote the education and advancement of Black people.
Latimer even taught English and mechanical drawing to recent immigrants at the Henry Street Settlement in New
York. He was a "Renaissance man," writing poems and plays, playing the flute, and was passionate about visual
arts. Some products of his artistic endeavors can be viewed at the Lewis Latimer House."
Source: https://www.lewislatimerhouse.org/about
→ **"taught English and mechanical drawing to recent immigrants"** — in a neighborhood now defined by
immigration. The resonance is the source's, not mine, but it is available.
**F175.** The museum on his naval service, quoted exactly: "Lewis Howard Latimer joined the United States Navy
when he was 16 years old and served as a landsman on the USS Massasoit. After two years, he received an
honorable discharge and remained patriotic. He was secretary and adjutant in the Grand Army of the Republic, a
veteran organization."
Source: https://www.lewislatimerhouse.org/about
**F176.** Visitor information, quoted exactly: "The Lewis Latimer House is open to the public at the following
hours: 11am-5pm on Fridays, Saturdays, and Sundays." and "K-12 groups by appointments on Tuesdays-Fridays."
Source: https://www.lewislatimerhouse.org/visit
→ **FLAG:** the same page carries a dated notice, quoted exactly: "Please note: The museum will be closed on
Saturday, July 4 and Sunday, July 12." Those dates are not identified by year. **Hours may be stale.** Do not
publish specific closure dates.
**F177.** Admission, quoted exactly: "Admission to the museum is free for all self-guided visits." and "For a
45-minute guided tour of "Light Up The World: The Legacy of Lewis H. Latimer" led by a Museum Educator, please
reserve tickets below." with the price table: "Adults $15 / Seniors (65 and over) $8 / Students $8 / Veterans $8
/ Visitors with a disability $8 / Caregiver of a visitor with a disability Free / Children (under 12) Free".
Source: https://www.lewislatimerhouse.org/visit
→ **Note: the "45-minute" tour duration is a duration and this corpus bans durations** (per the CitiFieldGuide
moduledoc's "per the duration ban"). Recorded so the writer knows to drop it, not to use it.
**F178.** Mandarin tours, quoted exactly: "For Mandarin guided tours, led by a bilingual Museum Educator,
reserve your tickets below." and "Please note: Mandarin tours are offered at 11:00am and 4:00pm once a month,
before and after our STEAM Saturday workshops."
Source: https://www.lewislatimerhouse.org/visit
**F179.** Accessibility, quoted exactly: "The museum is ADA compliant and fully accessible for wheelchairs.
Trained educator or docent on-site during open hours to answer to and assist with visitors' special needs.
Service animals are welcome in the space."
Source: https://www.lewislatimerhouse.org/visit
**F180.** Directions, quoted exactly: "By Subway – Take the 7 Train to Flushing- Main St. Exit via Main St. &
Roosevelt Ave at SE corner. From there, you can get to the museum by foot or by bus." and "By Foot
(approximately 15 minutes) - Start on Main Street. Take a right onto Northern Blvd, followed by a slight left
onto Linden Pl. Continue right back onto Northern Blvd, followed by a left onto Leavitt Street. The museum will
be on your left." and "By Bus (approximately 10 minutes) - From Main Street, take the Q25 bus (College Point 5
Ave) or Q34 bus (Whitestone 149 St). Exit at Linden Place & 35th Ave. Walk one block east and make a left onto
Leavitt St."
Source: https://www.lewislatimerhouse.org/visit
→ **FLAG:** the museum names a **Q34** bus. Wikipedia's Flushing bus list (F204) does **not** include a Q34.
§N row 13. Also note both walking and bus times are durations — banned.
**F181.** Parking, quoted exactly: "By Car – Take Exit 14 from Northern Blvd / Whitestone Expressway. Turn right
onto 137th Street. The museum and parking lot entrance will be on the left. Limited parking spaces are
available in the museum lot."
Source: https://www.lewislatimerhouse.org/visit

### P17 — St. George's (Episcopal) Church, Old Parish House and Graveyard
**LPC:** `Saint George's Church, Old Parish House and Graveyard`, `38-02 Main Street`, `LP-02053`, 2/8/2000 ·
**LPC (`ncre`):** `135-33 39 AVENUE` · **NRHP:** `St. George's Church`, `135-32 38th Ave.`, `08000143` ·
**PLUTO:** `135-33 39 AVENUE`, zip `11354`, `cd: 407`, `yearbuilt: 1907`, `lotarea: 41000`, owner
`ST GEORGE EPISCOPAL C` · **GeoSearch (38-02 Main St):** `Flushing`
→ **Four addresses across three streets.** §M row 5. Note PLUTO's `yearbuilt: 1907` matches the **Old Parish
House**, not the 1853–54 church.

**F182.** LPC header, quoted exactly: "ST. GEORGE'S (EPISCOPAL) CHURCH, OLD PARISH HOUSE AND GRAVEYARD, 38-02
Main Street(aka 135-33 391h Avenue), Flushing, Queens. Church built 1853-54, Wills &Dudley, architects;
Chancel, 1894, J. King James, architect; Old Parish House, 1907-08, Charles C. Haight, architect." `[OCR]`
("391h" is "39th")
Source: LPC **LP-02053**, February 8, 2000, Designation List 311 — http://s-media.nyc.gov/agencies/lpc/lp/2053.pdf
→ **LPC itself gives the "aka" — this resolves part of §M row 5 and the verifier should note it.**
**F183.** LPC's summary, quoted exactly: "Prominently sited on Main Street in the heart of downtown Flushing,
St. George's (Episcopal) Church is a notable example of Gothic Revival design . Erected in 1853-54, this
impressive stone building is the congregation's third church building on the site since 1746. The large size of
St. ' George's is indicative of the importance of Flushing as a major regional center during the nineteenth
century."
Source: LPC **LP-02053**
→ **"the congregation's third church building on the site since 1746"** — continuous occupation of one site
since 1746. Strong.
**F184.** LPC on ecclesiology, quoted exactly: "A rare surviving work in New York City by the leading
ecclesiastical architects Wills & Dudley, St. George's is a major example of ecclesiological church
architehure. A philosophical reform movement that had widespread influence on American Protestant Episcopal
church design in the nineteenth century, ecclesiology sought spiritual renewal by returning to the rituals and
architectural forms of the medieval church." `[OCR]` ("architehure" is "architecture")
Source: LPC **LP-02053**
**F185.** LPC on the fabric, quoted exactly: "The design is also noteworthy for handsome walls of randomly-laid
granite rubble trimmed with dressed red sandstone and stained glass windows in wood tracery derived from
English Perpendicular and Decorated Gothic sources. In 1894, the church was enlarged by the addition of a new
chancel wing that matched the older parts of the church in materials and detailing and incorporated
exceptionally fine stained glass windows. The 1907 Neo-gothic Old Parish House, designed by the prominent
architect Charles C. Haight, complements the church building and features a skillfully composed asymmetrical
design."
Source: LPC **LP-02053**
**F186.** LPC on the graveyard, quoted exactly: "The church and parish house are located in a landscaped
churchyard that contains approximately fifty gravestones and memorials dating from the, late eighteenth and
early nineteenth centuries."
Source: LPC **LP-02053**
**F187.** LPC on Samuel Seabury, quoted exactly: "near the highway leading to Jamaica (present-day Main
Street), the small frame church building was named St. George's soon after its completion. In 1761, under the
leadership of Samuel Seabury, who later became the first bishop of the Episcopal Church in America, the church
was officially incorporated under a Royal Charter from George III as "the Rector and Inhabitants of the township
of Flushing in Queens County in Communion of the Church of England.""
Source: LPC **LP-02053**
→ **Samuel Seabury — the first bishop of the Episcopal Church in America — led this congregation.** A
first-rate travel-worthy fact, primary-sourced, and I found it nowhere else.
**F188.** LPC on the public hearing, quoted exactly: "Five witnesses spoke in favor of designation including
representatives of Borough of Queens President Claire Shulman, the Queens Historical Society, the Landmarks
Conservancy, and the Historic Districts Council." and "This item was previously heard for designation on
January 11, 1966 and continued on February 8, 1966; it was reheard on December 11, 1979."
Source: LPC **LP-02053**
→ **The church waited thirty-four years and three hearings for designation (1966 → 1979 → 2000).** A good,
human detail about how landmarking actually works.
**F189.** Wikipedia lists "St. George's Episcopal Church" among Flushing's houses of worship.
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ The congregation's own website was not reachable: `https://www.stgeorgesflushing.org/` returned HTTP 404.
**Gap: no institutional self-description, no hours, no service times.**

### P18 — RKO Keith's Flushing Theater (INTERIOR landmark only)
**LPC:** `RKO Keith's Flushing Theater`, **Interior Landmark**, `LP-01257`, designated 2/28/1984 ·
**LPC designation report address:** `135-29- 135-45 Northern Boulevard` · **LPC (`ncre`) desig_addr:**
`35-28 FARRINGTON STREET` · **NRHP:** `RKO Keith's Theater`, `129-143 Northern Boulevard`, `82001260` ·
**PLUTO:** `135-27 NORTHERN BOULEVARD`, zip `11354`, `cd: 407`, `yearbuilt: 1929`, `lotarea: 41509`,
`bldgclass: J9`, owner `QUEENS THEATER OWNER LLC` · **GeoSearch (135-29 Northern Blvd):** `Flushing`
→ **Five different addresses on four streets, and two different build years (1927-28 per LPC, 1929 per
PLUTO).** The worst identity tangle in the file. §M row 6.

**F190.** LPC header, quoted exactly: "RKO KEITH'S FLUSHING THEATER, ground floor interior consisting of the
ticket lobby and original ticket booth, grand foyer, twin staircases leading to the mezzanine promenade,
women's lounge, men's lounge, auditorium (now divided into two spaces) including organ screens, proscenium and
exit halls; second floor interior consisting of the upper level and ceiling of the ticket lobby, the upper
level and ceiling of the grand foyer, the mezzanine promenade and its ceiling, the lounges adjoining the
mezzanine promenade, the upper part of the auditorium (now separated from the lower sections), including the
organ screens, wall openings, proscenium arch and exit halls; and the fixtures and the interior components of
these spaces, including but not limited to, all lighting fixtures, columns, wall surfaces, murals, ornamental
plasterwork, f~oor s~nfaces, ceiling surfaces, statues, attached furnishings, drinking fountains, and metal
grilles; 135-29- 135-45 Northern Boulevard, Flushing, Queens. Built 1927-28; architect Thomas lamb." `[OCR]`
("f~oor s~nfaces" is "floor surfaces"; "lamb" is "Lamb")
Source: LPC **LP-01257**, February 28, 1984, Designation List 169 — http://s-media.nyc.gov/agencies/lpc/lp/1257.pdf
→ **The designation is a list of interior rooms. Everything protected is inside.** The writer must not imply
the façade is landmarked.
**F191.** LPC on what it is, quoted exactly: "The RKO Keith's Flushing theater is one of a small number
surv1v1ng in. New York City, of the uniquely American institution of the movie palace. Part of the vaudeville
circuit founded by B.F. Keith, later the "Radio-Keith-Orpheum" circuit ("RKO"), the Keith's opened in 1928 to
an audience of subscription holde rs." `[OCR]` ("surv1v1ng" is "surviving")
Source: LPC **LP-01257**
**F192.** LPC on the atmospheric style — the single most vivid passage in any of the twelve reports, quoted
exactly: "Thomas lamb, who designed th e theater, was one of th e country's most prolific theater architects,
having several hundred to his cre dit. Th e Keith's, however, is one of the handful which lamb designed in the
"atmospheric" style, a type of theater design which aimed to produce an illusion of open outdoor space. The wa~ls
of :1 the Keith's were built up as stage sets showing a Spanish-style townscape in the Churrigueresque style
while the ceiling was painted blue and given electric "stars"; a special machine proj ected "clouds " moving
across the ceiling, complet-in g the illusion that the audience was s ittin g outside in a Spanish town on a
warm evening." `[OCR]`
Source: LPC **LP-01257**
**F193.** LPC on its place in the neighborhood, quoted exactly: "Located in the heart of downtown Flushing, at
the intersection of Main Street and Northern Boulevard, the 3000-seat theater was for many ¥ears the major
entertainment center for the neighborhood. Today, although divided by partitions into three theaters, the
Keith 1 s continues to serve Flushing as a movie theater, and retains almost all of the fabulous interior design
which once distinguished thousands of movie theaters,both in New York and across the country, which have long
since disappeared." `[OCR]`
Source: LPC **LP-01257**
→ **THIS SENTENCE IS FROM 1984 AND IS ALMOST CERTAINLY NO LONGER TRUE.** "continues to serve Flushing as a
movie theater" describes 1984. PLUTO's current owner is `QUEENS THEATER OWNER LLC` and `bldgclass: J9`. The
theatre's later history — decades of vacancy, deterioration and redevelopment fights — is well known but I
**could not source it** with search unavailable. **The writer must not describe the Keith's as an operating
cinema.** This is the second most likely factual error the page could make, after the Weeping Beech.
**Explicit gap for the verifier: establish the RKO Keith's current status and physical condition.**
**F194.** LPC records opposition, quoted exactly: "Six witnesses spoke in favor of designation. There were two
speakers in opposition to designation."
Source: LPC **LP-01257**
**F195.** Wikipedia, quoted exactly: "the lobby of the former RKO Keith's movie theater"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note "**former**" — the aggregator agrees it no longer operates.

### P19 — Voelker Orth Museum, Bird Sanctuary and Victorian Garden
**LPC:** `Voelker Orth Museum, Bird Sanctuary and Victorian Garden`, `149-19 38th Avenue`, `LP-02272`,
10/30/2007, in NTA **`QN0704 Murray Hill-Broadway Flushing`** · **NRHP:** `Conrad Voelcker House`,
`149-19 38th Ave.`, `100005569`, listed 2020-09-18, described as "AKA the Voelker Orth Museum." ·
**PLUTO:** `149-19 38 AVENUE`, zip `11354`, `cd: 407`, `yearbuilt: 1920`, `lotarea: 10000`, `bldgclass: P7`,
owner `VOELKER-ORTH MUSEUM, BIRD SANCTUARY AND VICTORIAN GARDEN` · **GeoSearch:** `Flushing`
→ **Note the surname is spelled "Voelcker" on the NRHP and "Voelker" by LPC and the museum.** §M row 7.
→ **Note PLUTO says `yearbuilt: 1920`; LPC says `c.1891`.** §M row 7.
→ **§L row 2: this museum is in the Murray Hill NTA, which has no seed file.**

**F196.** LPC header, quoted exactly: "VOELKER ORTH MUSEUM, BIRD SANCTUARY AND VICTORIAN GARDEN, 149-19 38th
Avenue, Flushing. Built c.1891, architect unknown."
Source: LPC **LP-02272**, October 30, 2007, Designation List 397 — http://s-media.nyc.gov/agencies/lpc/lp/2272.pdf
**F197.** LPC's summary, quoted exactly: "The Voelker Orth Museum is significant as one of the very few houses
remaining from Flushing's early period of suburban development, the years around 1900. Its exuberantly
picturesque design and large garden are typical of buildings of the late nineteenth century and recall the
period when, due to newly expanding transportation networks, Flushing was transformed from a rural area to a
suburban one."
Source: LPC **LP-02272**
**F198.** LPC on the lot's nursery provenance, quoted exactly: "The Voelker Orth house was constructed c.1891
as part of the development of the section of Flushing known as Murray Hill. First owned by James Bouton, this
house was built on land that was purchased from the Parsons estate just to the west and was one of the earliest
houses in the neighborhood."
Source: LPC **LP-02272**
→ **The house stands on ground bought from the Parsons nursery estate** — the nursery thread and the
suburban-villa thread meet on one lot. Excellent connective material.
**F199.** LPC on the display logic of the architecture, quoted exactly: "Its picturesque, eclectic style was
typical of late nineteenth century architectural exuberance. The variety of materials, rooflines and angles used
on a house was a way of showing the wealth and success of the owner."
Source: LPC **LP-02272**
**F200.** LPC on how it became a museum — a will, quoted exactly: "German immigrant Conrad Voelker purchased the
house in 1899 and it remained in the same family until 1996 when Voelker's last surviving heir, Elizabetha Orth,
died. At that time the house and grounds were converted to a small museum of Queens history, environmental
education and a bird sanctuary, according to the terms of her will."
Source: LPC **LP-02272**
→ **"according to the terms of her will" — one family, 1899 to 1996, and then a bequest.** Strong.
**F201.** LPC records the political support, quoted exactly: "There were four speakers in favor of designation,
including a representative of State Assemblywoman Ellen Young, the Queens Historical Society, the Historic
Districts Council and the President of the Voelker Orth Museum. The Commission has also received letters of
support from Queens Borough President Helen Marshall, City Council Members John Liu and Tony Avella, and State
Senator Frank Padavan."
Source: LPC **LP-02272**
**F202.** Wikipedia, quoted exactly: "The Voelker Orth Museum , Bird Sanctuary and Victorian Garden is also
located in Murray Hill."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ The museum's own site (https://www.vomuseum.org/ and /about) fetched but returned only ~2,000 chars of
navigation; I extracted no usable verbatim descriptive sentences. **Gap: hours, admission, garden season.**

### P20 — Fitzgerald/Ginsberg Mansion
**LPC:** `Fitzgerald/Ginsberg House` (`buis`) / `Fitzgerald/Ginsberg Mansion` (`ncre`), `145-15 Bayside Avenue`,
`LP-02160`, 9/20/2005, NTA **`QN0704 Murray Hill-Broadway Flushing`** · **PLUTO:** `145-15 BAYSIDE AVENUE`,
zip `11354`, `cd: 407`, `yearbuilt: 1924`, `lotarea: 30400`, `bldgclass: M1`, owner
`THE GIVING CHURCH OF NEW YORK` · **GeoSearch:** `Flushing` · **Not on the NRHP.**

**F203.** Wikipedia, quoted exactly: "the Fitzgerald/Ginsberg Mansion , on Bayside Avenue"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG (§L row 14):** the street is **Bayside Avenue**; the neighborhood is not Bayside. LPC's NTA and NYC
Planning GeoSearch both say Flushing (well, `QN0704 Murray Hill-Broadway Flushing`). **A finder or writer
skimming for "Bayside" will mis-assign this.** Recorded, not resolved.
→ **FLAG:** PLUTO's current owner is `THE GIVING CHURCH OF NEW YORK` and `bldgclass: M1` (a religious-use
class). The house is apparently in church use. I have no source describing it as visitable.
→ I downloaded LPC **LP-02160** (48,264 characters extracted) but did not read past the header before writing.
**Gap: the designation report is on disk and unread — the verifier should mine it.** Path:
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/flpages/lp_fitzgerald_2160.txt`
Source URL: http://s-media.nyc.gov/agencies/lpc/lp/2160.pdf

### P21 — Flushing High School
**LPC:** `Flushing High School`, `35-01 Union Street` (`buis`) / `35-01 NORTH BOULEVARD` (`ncre`), `LP-01798`,
1/8/1991 · **NRHP:** `35-01 Union St.`, `91002036`, listed 1992-02-10 · **PLUTO:** `35-01 UNION STREET`,
zip `11354`, `cd: 407`, `yearbuilt: 1915`, `lotarea: 204702`, `bldgclass: W1`, owner
`NYC DEPARTMENT OF EDUCATION` · **GeoSearch:** `Flushing`
→ `ncre`'s "35-01 NORTH BOULEVARD" is an outlier against three sources saying Union Street. §M row 8.

**F204.** LPC header, quoted exactly: "FIDSHING HIGH SCHOOL, 35-01 Union Street, Borough of Queens. Built
1912-15; architect C.B.J. Snyder, Superintendent of School Buildings, New York City Board of F.ducation."
`[OCR]` ("FIDSHING" is "FLUSHING"; "F.ducation" is "Education")
Source: LPC **LP-01798**, January 8, 1991, Designation List 231 — http://s-media.nyc.gov/agencies/lpc/lp/1798.pdf
**F205.** LPC's summary, quoted exactly: "Flushing High School, the oldest public secondary school institution
in New York and one of the city's architecturally distinguished educational buildings, is located in Flushing,
an historically rich area of the Borough of Queens. The brick and terra-cotta building is a striking example of
the Collegiate Gothic style which was introduced to public school architecture in New York by C.B.J. Snyder,
the Superintendent of Buildings for the Board of F.ducation." `[OCR]`
Source: LPC **LP-01798**
→ **FLAG on the superlative.** LPC says "the oldest public secondary school **institution in New York**".
Wikipedia says "the oldest free public high school (1875) in what is now New York City" (F207) and elsewhere
"The first free public high school in what is now New York City was established in Flushing in 1875" (F206).
**Three differently-scoped claims.** §N row 14. The writer must pick the one the verifier confirms and must
not silently widen it to "in the United States".
**F206.** Wikipedia, quoted exactly: "The first free public high school in what is now New York City was
established in Flushing in 1875."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F207.** Wikipedia, quoted exactly: "Flushing High School , the oldest free public high school (1875) in what
is now New York City. It is housed in a distinctive Gothic Revival building built between 1912 and 1915 and
declared a NYC Landmark in 1991."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note "Gothic Revival" (Wikipedia) vs "Collegiate Gothic" (LPC). Prefer LPC.
**F208.** LPC on the symbolism, quoted exactly: "Erected between 1912 and 1915 in a campus-like setting, the
high school with its monumental square entrance tower recalls English medieval models. It is fitting that the
city's oldest public high school institution is housed in one of its most distinguished Collegiate Gothic style
builidings. The symbolism implicit in the style, recalling the hallowed seats of learning of medieval England
and the political unity of Greater New York, is appropriate for a public school that has educated generations
of New Yorkers for over 100 years." `[OCR]` ("builidings" is "buildings")
Source: LPC **LP-01798**
**F209.** LPC excludes the later wings, quoted exactly: "Extensions which were added to the east of the
original building in 1952-54 and in 1970-74; while these extensions are on the landmark Site, they are not
included in the landmark designation."
Source: LPC **LP-01798**
**F210.** Wikipedia notes the school's athletic field, quoted exactly: "Flushing Fields is a 10-acre (40,000 m
2 ) greenbelt that includes the home athletic field of Flushing High School."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** NYC Parks gives Flushing Fields' acreage as **7.67**, not 10, and its ZIP codes as "11354, 11357"
with Council Member "Vickie Paladino". Source: https://www.nycgovparks.org/parks/flushing-fields/history
§N row 15. NYC Parks' Historical Signs narrative for Flushing Fields is **empty** — the page carries the
heading "This text is part of Parks' Historical Signs Project and can be found posted within the park." and
then no text.

### P22 — Protestant Reformed Dutch Church of Flushing (Bowne Street Community Church)
**LPC:** `143-11 Roosevelt Avenue (38-01 Bowne Street)`, `LP-02137`, designated 12/13/2016 — the most recent
Flushing designation. **Not on the NRHP.**

**F211.** LPC header, quoted exactly: "PROTESTANT REFORMED DUTCH CHURCH OF FLUSHING (BOWNE STREET COMMUNITY
CHURCH) 143-11 Roosevelt Avenue (38-01 Bowne Street), Queens Built: 1891-92; architect, George E. Potter
(attributed); builder, Edward Richardson"
Source: LPC **LP-02137**, December 13, 2016, Designation List 492 — http://s-media.nyc.gov/agencies/lpc/lp/2137.pdf
→ LPC gives both addresses in its own header, which resolves §M row 9.
**F212.** LPC's summary, quoted exactly: "Originally built for the Protestant Reformed Dutch Church, this
building is significant as an excellent example of the Romanesque Revival style, especially notable for its
prominent corner tower, decorative brickwork, and opalescent stained-glass windows. Several of the windows were
designed by artist and congregant Agnes Fairchild Northrop of Tiffany Studios. It is one of downtown Flushing's
most significant religious structures."
Source: LPC **LP-02137**
→ **Tiffany Studios windows designed by a member of the congregation, Agnes Fairchild Northrop.** This is a
first-rate travel-worthy fact and it is primary-sourced. **Note it is a *different* Tiffany connection from the
one in the Waldheim passage (F42) and from the Neustadt Collection recorded in the Corona finder. Do not
merge them.**
**F213.** LPC records that **the congregation opposed its own designation**, quoted exactly: "Two
representatives of the church, Samuel Tai, a trustee, and Aaron Chen, pastor and chair of the governing board,
spoke against designation. Ten people spoke in favor of designation, including New York City Council Member
Peter Koo, Jack Eichenbaum, Queens Borough Historian, and representatives of the Queens Historical Society,
Historic Districts Council, Victorian Society of American, Metropolitan Chapter, New York City Landmarks
Conservancy, Queens Preservation Council, the Bowne House Historical Society, and two individuals."
Source: LPC **LP-02137**
→ **FLAG on an apparent contradiction inside the same report.** At the earlier 2015 backlog hearing LPC
records the opposite, quoted exactly: "At the public hearing, Dr. Kent Chin of the Governing Board of Bowne
Street Community Church and representing the owner of the property spoke in favor of designation." §N row 16.
The church's position evidently changed between October 2015 and November 2016. Record the sequence; do not
flatten it.
**F214.** LPC records the 2015 backlog supporters, quoted exactly: "Others who spoke in favor of designation
included the following: Elaine Chung, representing New York City Council Member Peter Koo of the 20th Council
District; State Senator Tony Avella of Senate District 11; the Queens Borough Historian, Jack Eichenbaum, and
representatives of the Victorian Society, the Municipal Art Society, the NYC Landmarks Conservancy, the Historic
Districts Council, Guides Association of New York, Four Borough Neighborhood Preservation Alliance, Queens
Preservation Council, and two additional individuals. A letter from State Senator Toby Ann Stavisky in favor of
designation was also read at the public hearing. The Commission additionally received letters of support from
United States Congresswoman Grace Meng, the Queens Preservation League, the Aquinas Honor Society, and six
individuals."
Source: LPC **LP-02137**
→ Note: "A letter from Paul DiBenedetto, president of the **Bayside Historical Society**, supporting designation
was read at the public hearing." (quoted exactly, same report). **§L row 16 — this is the only appearance of a
Bayside institution in any Flushing source I fetched, and it is a letter-writer at a hearing, not a place. It
must not become a claim that Flushing and Bayside are connected.**

### P23 — Flushing Armory
**NRHP:** `Flushing Armory`, `137-58 Northern Boulevard`, `95000270`, listed 1995-03-23. **Not LPC-designated.**
**PLUTO:** `137-58 NORTHERN BOULEVARD`, zip `11354`, `cd: 407`, `yearbuilt: 1900`, `lotarea: 55600`,
`bldgclass: Y2`, owner `NYC POLICE DEPARTMENT` · **GeoSearch:** `Flushing`

**F215.** Wikipedia, quoted exactly: "The Flushing Armory is a historic National Guard armory building located
in Flushing , Queens . New York City . It is a brick and stone castle-like structure built in 1905–1906, designed
to be reminiscent of medieval military structures in Europe. It was designed by state architect George L. Heins ."
Source: https://en.wikipedia.org/wiki/Flushing_Armory `[AGGREGATOR]`
→ **FLAG:** Wikipedia's own infobox for the same building says "Built 1906"; the prose says "1905–1906"; PLUTO
says `yearbuilt: 1900`. §N row 17.
**F216.** Wikipedia, quoted exactly: "It consists of a two-story, hip-roofed administration building with an
attached 1 + 1 ⁄ 2 -story, gable -roofed drill shed, spanning open space of 11,400 square feet (1,060 m 2 ) .
Both sections are built of load bearing brick walls sitting on a brownstone foundation. The building features a
five-story octagonal tower at the northwest corner and a three-story round tower at the northeast corner. They
feature tall, narrow windows and crenellated parapets ."
Source: https://en.wikipedia.org/wiki/Flushing_Armory `[AGGREGATOR]`
**F217.** Wikipedia on its uses, quoted exactly: "Throughout the armory's history it has been used for the
National Guard , as a homeless shelter, and a gymnastics center. It is currently used by the New York City Police
Department 's Strategic Response Group ."
Source: https://en.wikipedia.org/wiki/Flushing_Armory `[AGGREGATOR]`
→ Corroborated by PLUTO's owner field `NYC POLICE DEPARTMENT`.
→ **This building matters far beyond its architecture: it stands on the site where the Flushing Remonstrance
was signed** (F60, F61). A police facility on the ground of the document. The writer should see that; the
verifier should confirm the site identification is really the same lot.
**F218.** Wikipedia's infobox, quoted exactly: "Architectural style Late Victorian, Castellated", "MPS Army
National Guard Armories in New York State MPS", "NRHP reference number … No. 95000270", "NYSRHP Number … No.
08101.006198", "Added to NRHP March 23, 1995", "Designated NYSRHP January 10, 1995".
Source: https://en.wikipedia.org/wiki/Flushing_Armory `[AGGREGATOR]`
→ The article cites a primary source the verifier should use: "Nancy L. Todd (December 1994). National Register
of Historic Places Registration: New York MPS Flushing Armory . National Archives and Records Administration ."

### P24 — United States Post Office, Flushing Main
**NRHP:** `US Post Office-Flushing Main`, `4165 Main St.`, `88002507`, listed 1988-11-17. **Not LPC-designated.**
**F219.** Wikipedia lists the Flushing post office among the neighborhood's NRHP entries (F100), and separately
gives its street address as "Flushing Station – 41–65 Main Street" (F24).
Sources: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`;
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York `[AGGREGATOR]`
→ **Note the NRHP row's address `4165 Main St.` is a de-hyphenated form of `41-65 Main Street`.** The NRHP
list's own footnote says, quoted exactly: "Address based on … USPS website. Accessed April 1, 2016." §M row 10.
→ **Gap: I fetched no dedicated source for this building — no LPC report (it has none), no NPS nomination, no
architectural description. If the writer wants it, the verifier must find the NPS nomination for `88002507`.**

### P25 — Main Street Subway Station (Dual System IRT)
**NRHP:** `Main Street Subway Station (Dual System IRT)`, `Near jct. of Roosevelt Ave. and Main St.`,
`04001147`, listed 2004-10-14. **Not LPC-designated.** Described in the NRHP row as "Subway station ({{NYCS
Flushing}} trains)".
Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York `[AGGREGATOR]`
**F220.** Wikipedia lists it among Flushing's NRHP properties (F100).
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **A working subway terminal that is also a National Register property.** Excellent material and it sits at
the exact centre of the neighborhood. See §H for ridership.
→ I fetched https://en.wikipedia.org/wiki/Main_Street_Subway_Station_(Dual_System_IRT) (65,804 chars) but did
not mine it before writing. **Gap on disk:**
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/flpages/wiki_mainstsubwaynrhp.txt`

### P26 — QUEENS BOTANICAL GARDEN — **the hardest boundary call on this page**
**PLUTO:** `43-50 MAIN STREET`, zip `11355`, `cd: 407`, `yearbuilt: 2012`, **`lotarea: 1463449`**,
`bldgclass: Q9`, owner `NYC DEPARTMENT OF PARKS AND RECREATION`, BBL `4051070200` ·
**GeoSearch:** `"neighbourhood": "Flushing"`, `"postalcode": "11355"` ·
**Institution's own:** "43-50 Main Street / Flushing, NY 11355" ·
**Not LPC-designated. Not on the NRHP. Not one of the eight CitiFieldPlaces holdings.**

**F221.** The Garden's own history page places it, in its own words, **inside the park**, quoted exactly:
"Located at the northeast corner of Flushing Meadows-Corona Park in Flushing, QBG evolved from the five-acre
"Gardens on Parade" exhibit showcased at the 1939-1940 New York World's Fair."
Source: https://queensbotanical.org/about/
→ **THIS IS THE CRUX AND I AM NOT RESOLVING IT.** Wave 3 ruled Flushing Meadows–Corona Park a Jointly
Interested Area belonging to no neighborhood file. The Queens Botanical Garden is **not** one of the eight
CitiFieldPlaces holdings, so the firewall as written does not name it. But **the Garden's own institutional
self-description says it is at the northeast corner of that park.** The verifier must rule whether QBG is
(a) a Flushing place, (b) inside the Jointly Interested Area and therefore available to no one, or (c) a
CitiFieldGuide matter. **Recorded, not resolved.**
**F222.** Evidence pointing the other way — the City's own geography treats QBG's lot as Flushing, not as
park-NTA. NYC Planning GeoSearch returns for "43-50 Main Street, Queens, NY 11355": `"label": "43-50 MAIN
STREET, Flushing, NY, USA"`, `"neighbourhood": "Flushing"`, `"borough": "Queens"`, and
`"addendum": {"pad": {"bbl": "4051070200", "bin": "4439682", "version": "26c"}}`.
Source: https://geosearch.planninglabs.nyc/v2/search?text=43-50%20Main%20Street,%20Queens,%20NY%2011355&size=1
**F223.** Further evidence: DCP's NTA list contains `Flushing Meadows-Corona Park` as a distinct NTA, and PLUTO
returns `cd: 407` (Queens CD 7) for QBG's BBL. Flushing Meadows–Corona Park itself lies substantially in CD 4.
Sources: https://data.cityofnewyork.us/resource/9nt8-h7nd.json;
https://data.cityofnewyork.us/resource/64uk-42ks.json
→ `[PARAPHRASE]` on the "substantially in CD 4" clause — I did not verify the park's CDTA directly and the
verifier must not take it from me.
**F224.** The Garden's own account of moving, quoted exactly: "Officially opening as "The Queens Botanical
Garden Society" in 1946 after local residents saved and expanded the original exhibit, the Garden remained at
the original World's Fair site until 1961, when it was moved to its current location on Main Street in Flushing.
Among the original plantings taken from the 1939 site are two blue atlas cedars that frame the iconic tree gate
sculpture at the Garden's Main Street entrance today. QBG has become a 39-acre oasis in one of New York City's
most bustling and diverse neighborhoods."
Source: https://queensbotanical.org/about/
→ **Note: "moved to its current location on Main Street in Flushing"** — the Garden's own history sentence says
Flushing, while its locating sentence (F221) says the corner of the park. **The institution says both.**
→ **Two blue atlas cedars surviving from the 1939 World's Fair, framing the Main Street tree gate** — a
concrete, findable, travel-worthy object.
**F225.** Wikipedia gives different figures, quoted exactly: "The Queens Botanical Garden is located on 39 acres
(16 ha) between College Point Boulevard and Main Street. It has been in operation continuously since its opening
as an exhibit at the 1939 New York World's Fair , and has been at its current location since 1963."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG: 1961 (the Garden's own site) vs 1963 (Wikipedia).** §N row 18. And the acreage: both say 39 acres,
but PLUTO's `lotarea: 1463449` square feet is about **33.6 acres**. §N row 18.
**F226.** The Garden's mission, quoted exactly: "Queens Botanical Garden (QBG) is an urban oasis where people,
plants, and cultures are celebrated through inspiring gardens, innovative educational programs, and real-world
applications of environmental stewardship. QBG is located on property owned by the City of New York, and its
operation is made possible in part by public funds provided through the New York City Department of Cultural
Affairs, Queens Borough President, the New York City Council, State elected officials, the New York State
Department of Parks, Recreation and Historic Preservation, along with corporate, foundation, and individual
supporters."
Source: https://queensbotanical.org/about/
**F227.** Hours and admission, quoted exactly: "Hours / April - October: 8 am to 6 pm, Tuesday through Sunday /
November - March: 8 am to 4:30pm, Tuesday through Sunday," and "Admission / April 1 - December 15 Adults $6 /
Seniors (age 62+) $4 / Students w/ID $4 / Children (age 4 thru 12) $2 / Children (age 3 & under) FREE / Members
FREE / December 16 - March 31 Free Admission"
Source: https://queensbotanical.org/about/
→ **Free admission from 16 December to 31 March** — a genuinely useful visitor fact.
**F228.** Contact, quoted exactly: "43-50 Main Street / Flushing, NY 11355" / "Phone: 718.886.3800" /
"Fax: 718.463.0263"
Source: https://queensbotanical.org/about/
→ NYC Parks has no page at `/parks/queens-botanical-garden` or `/parks/queens-botanical-garden/history` (both
HTTP 404 on my retrieval), which is itself weak evidence that Parks does not treat QBG as one of its own park
properties despite owning the land. `[PARAPHRASE]` — my inference, not a source's.

---

## §G — Parks and open space

### P27 — Kissena Park
**NYC Parks:** Park ID `Q024`; "Zip Code: 11365"; "Community Board: 7"; "Council Member: Sandra Ung";
"Acreage: 237.15"; "Property Type: Community Park".
**DCP:** its own NTA, `QN0791 | Kissena Park | KssnPk | ntatype 9 | QN07`.
**F229.** Wikipedia, quoted exactly: "Kissena Park is a 234-acre (0.95 km 2 ) park with a lake as a centerpiece."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG: 234 acres (Wikipedia) vs 237.15 acres (NYC Parks' own sidebar).** §N row 19. Prefer Parks.
→ **FLAG on the ZIP: NYC Parks gives Kissena Park's ZIP as 11365**, which is **not** one of Flushing's three
ZIPs (11354/11355/11358) per F13. 11365 is Fresh Meadows. §L row 8. Recorded, not resolved.
**F230.** NYC Parks on how the park was assembled, quoted exactly: "In 1904, the City purchased Kissena Lake
from William T. Janes, whose father-in-law had run an ice cutting and manufacturing company on the lake in the
late 19th century. Following Parsons' death in 1906, the city acquired his historic tree grove, and a year later
65 acres of what was then mostly swampland were purchased. In 1914 the city bought a training farm for the
Police Department's horses. Condemnation procedures and private purchases added to the park through 1927, and in
1947 Kissena Park became part of the "Queens Corridor" park system through the addition of Kissena Corridor
Park, which links Kissena Park with Flushing Meadows-Corona Park and Cunningham Park."
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ **An ice-cutting company, a horse farm for the police, and a nurseryman's tree grove, assembled into one
park.** Excellent.
→ Note the sentence links Kissena Corridor Park to Flushing Meadows–Corona Park. That is a **connective
statement about parkland**, not a claim about the neighborhood. Handle carefully.
**F231.** NYC Parks on the lake, quoted exactly: "In 1942, Kissena Lake was drained and transformed into a
"bathtub lake," with a concrete bottom and shoreline. The lake was drained again in 1983 due to a buildup of
algae. In 2003, the lake was restored to a more natural appearance using a new aeration system to prevent the
growth of algae and utilizing well water to replace city water."
Source: https://www.nycgovparks.org/parks/kissena-park/history
**F232.** NYC Parks on the name, quoted exactly: "The park was named in 1908 after Kissena Lake. It is thought
that Parsons, a horticulturist and amateur student of Native American lore, named the lake in the mid-19th
century after the Chippewa word "kissina," meaning "it is cold.""
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ Note the double hedge — "It is thought that" and "amateur student of Native American lore". The Chippewa
(Ojibwe) are not a Long Island people; the name is a 19th-century nurseryman's borrowing, and Parks says as
much. **The writer must not present "kissina" as a local Indigenous place name.** Kissena Boulevard, Kissena
Corridor Park, Kissena Lake and Kissena Velodrome all descend from this one coinage.
**F233.** NYC Parks on the tree grove, quoted exactly: "First planted in 1986, the Charlie Emerson Wildlife
Garden and adjacent nature center were dedicated to the memory the Queens naturalist in 1990. The tree grove
that was once part of Parsons' nursery now includes more than 100 different types of trees. In 2018, a new
public restroom was constructed. As of 2022, added green infrastructure now helps capture storm water in the park."
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ **The surviving Parsons tree grove is the physical remnant of the nursery era and it is walkable.** The
strongest link between §D and a place a visitor can stand in.

### P28 — Kissena Velodrome
**F234.** NYC Parks, quoted exactly: "The Kissena Velodrome was completed in 1963. It was showcased during the
1964 World's Fair, and that same year it hosted the U.S. Olympic Team Trials. The Siegfried Stern Kissena Park
Bicycle Track was named for Siegfried Stern, treasurer for Hartz Mountain Products and benefactor of many Jewish
organizations. After a reconstruction, the Kissena Velodrome reopened in 2004 as a state-of-the-art cycling
facility."
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ **An Olympic trials velodrome inside a Flushing park.** Note it is "showcased during the 1964 World's Fair" —
a World's Fair link that is **not** inside Flushing Meadows–Corona Park and therefore not behind the firewall.
That distinction is worth the writer's attention.
→ NYC Parks lists as related links "Kissena Cycling Club" and "Star Track: Youth Mentorship & Cycling".
Source: https://www.nycgovparks.org/parks/kissena-park/history

### P29 — Korean War Memorial, Kissena Park
**F235.** NYC Parks, quoted exactly: "Near the park's entrance at Rose Avenue and Parsons Boulevard, the Korean
War Memorial stands in honor of the Queens men and women who fought to defend South Korea between 1950 and 1953.
Completed in 2007 and designed by William Crozier (b. 1942), the main sculpture is titled The Anguish of
Experience, and features a solitary soldier whose face portrays the agony of war. On a smaller scale behind him
are the silhouettes of five soldiers carrying a stretcher and scaling the dangerous mountain terrain of Korea."
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ **A Korean War memorial at the edge of the park, in the neighborhood that anchors the Long Island
Koreatown.** The resonance is available to the writer without editorialising. Note the entrance is at **Rose
Avenue** — the southern end of the alphabetical nursery street grid (F90).

### P30 — Kissena Corridor Park
**F236.** Wikipedia, quoted exactly: "Kissena Corridor Park is a 100-acre (0.40 km 2 ) park which connects two
separate corridors, adjoining Flushing Meadows–Corona Park to Kissena Park. It contains a baseball field and a
playground called Rachel Carson Playground ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ NYC Parks splits it into at least two properties with distinct slugs, confirmed from its own "Other Parks
Nearby" links: `/parks/kissena-corridor-park-q300` and `/parks/kissena-corridor-park-q300a`. The Kissena Park
page lists "Kissena Corridor Park" twice at different distances (0.80 miles and 0.92 miles), confirming two
separate parcels.
Source: https://www.nycgovparks.org/parks/kissena-park/history
→ I fetched `/parks/kissena-corridor-park-q300/history` (1,299 chars) and it carries the Historical Signs
heading with **no narrative text**. **Gap.**

### P31 — Bowne Park
**NYC Parks:** Park ID `Q006`; "Zip Code: 11354, 11358"; "Community Board: 7"; "Council Member: Vickie
Paladino"; "Acreage: 11.79"; "Property Type: Neighborhood Park".
**F237.** NYC Parks, quoted exactly: "This was once the site of former State Senator and New York City Mayor
Walter Bowne's summer residence, "Clifton," which was built circa 1825. The two-story mansion was destroyed by a
fire in March 1925. Mayor Bowne was a decedent of John Bowne (1627-1695), one of the earliest immigrants to
Flushing and a Quaker, known for his fight for religious freedom. The Bowne family and its decedents owned large
portions of land throughout this area of Queens."
Source: https://www.nycgovparks.org/parks/bowne-park/history
→ "decedent" is NYC Parks' own error for "descendant", twice. Do not reproduce.
**F238.** NYC Parks, quoted exactly: "The City acquired this property in June 1925 by condemnation and it opened
as a playground under the Parks Department in 1935. On June 10, 1969, Bowne Park made headlines as the first city
park with an "instant playground." This creation provided ready-made modular playground equipment which consisted
of eight-sided colorful fiberglass play-cubes."
Source: https://www.nycgovparks.org/parks/bowne-park/history
→ **"the first city park with an 'instant playground'", 10 June 1969, eight-sided fiberglass play-cubes.**
Wonderfully specific and I found it only here.
**F239.** NYC Parks on the pond and the turtles, quoted exactly: "In 1994, the park was rebuilt with new
playground equipment, a spray shower, and bocce and basketball courts. In 2017 the park was again reconstructed
with treehouse-inspired multigenerational playground equipment and an expanded spray shower with a turtle theme
to pay homage to the park's popular native wildlife." and "In 2023 accumulated sediment was removed from the
park's pond bottom to improve water quality. A new pump and aeration system were installed to improve the water
quality, and two new turtle islands were added in the middle of the pond. At the same time the park's plaza and
bocce courts were renovated."
Source: https://www.nycgovparks.org/parks/bowne-park/history
→ **A pond with turtles and two turtle islands, and bocce courts.** Concrete and visitable.
**F240.** NYC Parks on Walter Bowne and the cholera quarantine, quoted exactly: "Walter Bowne (1770-1846) was
mayor from 1828-1832 and is remembered for his strict policies aimed at preventing cholera epidemics. Following
reports of an outbreak in a neighboring town during the summer of 1832, Bowne established a stringent quarantine
policy regulating travel in and out of the metropolitan area. Bowne, like others of his time, believed that
cholera was spread through direct human contact. He required that all ships maintain a distance of at least 300
yards from municipal ports and that carriages remain at least 1.5 miles from the city limits. Bowne's
well-meaning attempts to prevent a cholera outbreak failed, and hundreds of New Yorkers died of the disease."
Source: https://www.nycgovparks.org/parks/bowne-park/history
→ **FLAG:** Wikipedia says only "Bowne Park is an 11-acre (45,000 m 2 ) park developed on the former estate of
New York City Mayor Walter Bowne ." (quoted exactly) — **11 acres** against NYC Parks' **11.79**. §N row 19.
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

### P32 — James A. Bland Playground
**NYC Parks:** Park ID `Q326`; "Zip Code: 11354"; "Community Board: 7"; "Council Member: Sandra Ung";
"Acreage: 0.55"; "Property Type: Playground".
**F241.** NYC Parks, quoted exactly: "In 1949, the City of New York acquired land for this playground and the
Flushing Houses. The New York City Housing Authority transferred the playground property to NYC Parks in 1952.
The playground opened to the public soon after. The playground features multigenerational play areas equipped
with a spray shower and basketball and handball courts."
Source: https://www.nycgovparks.org/parks/bland-playground/history
**F242.** NYC Parks on James A. Bland, quoted exactly: "This playground is named in honor of James A. Bland
(1854-1911), a Flushing native known to many as the "greatest black writer of American folk songs" and the
"world's greatest minstrel man.""
Source: https://www.nycgovparks.org/parks/bland-playground/history
**F243.** NYC Parks, quoted exactly: "At a young age, Bland moved with his family to Washington, D.C., where his
father became the first African American appointed Examiner in the United States Patent Office. Bland taught
himself to play the banjo and earned money by playing and singing in the streets." and "While attending Howard
University in the early 1870s, Bland wrote many songs and was discovered by John Ford, owner of the Ford Theater.
His popularity skyrocketed almost immediately. At age 19, he wrote what remains his best-known song, "Carry Me
Back to Old Virginny," which Virginia adopted as its state song in 1940."
Source: https://www.nycgovparks.org/parks/bland-playground/history
**F244.** NYC Parks on the minstrel context — note that Parks itself supplies the framing, quoted exactly: "In
1890, Bland joined W.S. Cleveland's Colossal Colored Carnival Minstrels, an all-Black troupe, which was new in
the performing world where the artists would usually be white in Black face." and "He composed roughly 700 songs
for the minstrel stage, but only a few were copyrighted. Many of his songs became the property of other minstrel
singers and entertainers, since the owner and chief performer of a minstrel troupe could lay claim to the songs
he performed."
Source: https://www.nycgovparks.org/parks/bland-playground/history
→ **This is difficult material and Parks handles it with care. The page must not simplify it into
celebration.** "Carry Me Back to Old Virginny" was Virginia's state song; it was retired by the state in 1997,
a fact NYC Parks does **not** mention and which I could not source here. **Gap flagged for the verifier.**
**F245.** NYC Parks on the end of his life, quoted exactly: "Between 1882 and 1901, Bland lived in England and
Scotland and toured throughout Europe, where he enjoyed tremendous popularity. He performed at Buckingham Palace
for Queen Victoria, and Prince Edward of Wales often attended his stage shows. Despite his success there, Bland
gradually lost his fortune and returned to the United States in 1901, destitute and penniless." and "Despite his
many achievements, Bland died in Philadelphia and was buried in an unmarked grave. In 1939, his grave was found
by American Society of Composers, Authors and Publishers (ASCAP) and The Lions Club of Virginia dedicated and
erected a gravestone for him in 1946. James Bland was inducted into the Songwriters Hall of Fame in 1970."
Source: https://www.nycgovparks.org/parks/bland-playground/history
→ Wikipedia's notable-people list corroborates the Flushing birth, quoting the Pennsylvania Center for the Book:
"James Bland was born on October 22, 1854, in Flushing, Long Island, New York, to Allen M. Bland and Lidia Ann
(Cromwell) Bland, one of 12 children." `[QUOTE-VIA]`
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

### P33 — Bland Houses (NYCHA)
**F246.** Wikipedia has a dedicated article for the Bland Houses; I fetched it (5,270 chars) but did not mine it
before writing. NYC Parks (F241) calls the adjacent development "the Flushing Houses", not "the Bland Houses".
Sources: https://en.wikipedia.org/wiki/Bland_Houses `[AGGREGATOR]`;
https://www.nycgovparks.org/parks/bland-playground/history
→ **FLAG and gap: two names for what may be one NYCHA development.** §M row 11.

### P34 — Latimer Gardens (NYCHA)
**F247.** LPC, quoted exactly: "it was moved to its present site across the street from the Latimer Gardens
housing project, which had been named in Lewis Latimer's honor"
Source: LPC **LP-01924** — http://s-media.nyc.gov/agencies/lpc/lp/1924.pdf
→ Recorded as a place-name fact, not as a visitable attraction.

### P35 — Flushing Fields
See F210 and the acreage flag there. NYC Parks: Park ID `Q086`; "Zip Code: 11354, 11357"; "Community Board: 7";
"Acreage: 7.67"; "Property Type: Community Park". **Historical Signs narrative is empty.**
Source: https://www.nycgovparks.org/parks/flushing-fields/history

### P36 — Murray Hill Playground, and P37 — Daniel Carter Beard Mall
**F248.** I fetched `/parks/murray-hill-playground/history` (1,466 chars) and
`/parks/daniel-carter-beard-mall/history` (5,070 chars) but did not mine either before writing. **Gap on disk.**
Sources: https://www.nycgovparks.org/parks/murray-hill-playground/history;
https://www.nycgovparks.org/parks/daniel-carter-beard-mall/history
**F249.** Wikipedia's notable-people list, citing NYC Parks, quoted exactly: "Daniel Carter Beard (1850–1941),
founder of the Boy Scouts of America" with the quoted supporting line "In the early 1870s Beard and his family
moved to Flushing, Queens." `[QUOTE-VIA]`
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`, citing
https://www.nycgovparks.org/parks/Q100A/history
→ **A founder of the Boy Scouts of America lived in Flushing and has a mall named for him here.** Verify the
Parks page directly.

### Parks that are NOT Flushing — recorded so nobody imports them
**F250.** **Frank Golden Park is in College Point.** NYC Parks gives "Zip Code: 11356, 11357"; "Community Board:
7"; "Council Member: Vickie Paladino"; "Park ID: Q445"; "Acreage: 11.42", and its Historical Signs narrative is
entirely about College Point: "In 1837, Reverend William Augustus Muhlenberg (1796-1877) established the
short-lived St. Paul's College in Strattonport, which gave the region its later name of College Point." and
"Strattonport was incorporated into the village of College Point in 1870."
Source: https://www.nycgovparks.org/parks/frank-golden-park/history
→ §L row 9. **Out of scope for this page.** (Recorded because it came up in my park sweep and a careless
finder would keep it.)
**F251.** NYC Parks' "Other Parks Nearby" list on the Bland Playground page includes "Flushing Meadows Corona
Park (0.60 miles)".
Source: https://www.nycgovparks.org/parks/bland-playground/history
→ **Proximity is not membership.** Recorded so the writer sees how close the firewall runs to downtown.

---

## §H — Burial grounds and cemeteries

### P38 — The Olde Towne of Flushing Burial Ground — **the most important place on this page**
**NYC Parks:** Park ID `Q017`; "Zip Code: 11358"; "Community Board: 7"; "Council Member: Sandra Ung";
"Acreage: 3.47"; "Property Type: Neighborhood Park".
**NRHP:** `Old Town of Flushing Burial Ground`, `46th Ave. between 164th & 165th St.`, `100002079`, listed
2018-02-02, described as "19th-century local pauper's graveyard is final resting place of many African-American
and Native American residents".
→ **Note the naming: NYC Parks says "The Olde Towne of Flushing Burial Ground"; the NRHP says "Old Town of
Flushing Burial Ground".** Parks explains the current name is a 2010 renaming (F256).

**F252.** NYC Parks, quoted exactly: "Established in 1840, these grounds were purchased by the town of Flushing
as a pauper's burial ground. Over time, the burials were mostly people of African American and Native American
descent. As a result, the cemetery went through a variety of name changes from inception to present, including
"Town Ground", "Pauper's Burial Ground", and "Colored Cemetery of the Olde Towne of Flushing". This site is the
final resting place for as many as 1,000 people."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
**F253.** NYC Parks, quoted exactly: "Later the burial ground was used for people who died during the cholera
and smallpox epidemics. At the time, church burials were outlawed due to deteriorating sanitary conditions, and
living relatives believed the bodies of the ill would contaminate family plots."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
**F254.** NYC Parks on who is buried here, quoted exactly: "From burial records, it is known that more than half
of those interred here are under the age of five and only a quarter are over the age of 30. Archaeological
studies suggest that this site was a mix of individual and mass graves. The final burial took place in 1898. The
grounds were eventually transferred to the parks department in 1914. A 1919 topographic survey documented the
location of four marble headstones marking the graves of Alfred E. Bunn (died in 1876 at age 3), George H. Bunn
(died in 1887 at age 17), James Bunn (died in 1890 at age 53), and Willie Curry (died in 1874 at age 4)."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
→ **"more than half of those interred here are under the age of five."** Four named people. This is the most
affecting material in the entire file and it is primary.
**F255.** NYC Parks on the desecration — the City stating plainly what the City did, quoted exactly: "The burial
ground sat undisturbed and overgrown until the 1930s, when a playground known as "Martin's Field" was
constructed. The bodies were never relocated, and the grounds were completely desecrated. News articles written
around this time report that people saw "bones galore" being pulled out of the ground along with coins that had
been placed on the eyes of the dead."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
→ **A city agency writing "the grounds were completely desecrated" about its own predecessor's playground.**
The writer must not soften this and must not dramatise beyond it. Quote it or leave it.
**F256.** NYC Parks on Mandingo Osceola Tshaka, quoted exactly: "The site was still a playground in the 1990s
when community activist Mandingo Osceola Tshaka (1931-2022) called attention to its history as a cemetery. His
continued advocacy led to the inclusion of the burial ground on the State and National Registers of Historic
Places and prompted archeological studies that would inform the playground's transformation in 2006 into a
memorial space. The site was officially renamed The Olde Towne of Flushing Burial Ground in 2010."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
→ **One named person, still alive within living memory, who got a playground turned back into a cemetery.**
The NRHP listing date (2018-02-02, F98) is downstream of his campaign. This is a named, datable, verifiable
civic achievement and it belongs on the page.
**F257.** NYC Parks on the 2021 memorial, quoted exactly: "In 2021, a central memorial was dedicated to all who
are buried here, giving them the recognition they deserve. A commemorative wall is engraved with 320 recorded
names of those interred on this property and allows for additional names to be added if recovered. The wall is
also incised with plaques that represent the four marble headstones found in 1919 that were likely destroyed to
make way for the playground. A stacked stone wall marks the original 1840 boundary of the Burial Ground, where
most of the remains are located. This space also has a butterfly garden and seating that gives the site a feeling
of peace and tranquility."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
**F258.** NYC Parks on the Matinecock inscriptions, quoted exactly: "Inscribed cardinal directions in the
Matinecock language have been included for celebrations and ceremonies by the Native American community. A
portion of the stacked stone wall marking the original boundary has been reconstructed, further illuminating the
history of the site." and "The Olde Towne of Flushing Burial Ground is a place for meditation, reflection, and
remembrance."
Source: https://www.nycgovparks.org/parks/the-olde-towne-of-flushing-burial-ground/history
→ **Cardinal directions inscribed in the Matinecock language, on a memorial built in 2021, for ceremonies by
the Native American community.** This closes the loop with F50–F52's land acknowledgements. Outstanding
material, primary-sourced, and specific to Flushing.

### P39 — Flushing Cemetery
**Institution's own:** "163-06 46th Avenue / Flushing, NY 11358", "Phone: (718) 359-0100" ·
**PLUTO:** `163-12 46 AVENUE`, zip `11358`, `cd: 407`, `yearbuilt: 1931`, **`lotarea: 1845000`**,
`bldgclass: Z8`, owner `FLUSHING CEMETERY ASSOC` · **GeoSearch:** `Flushing`
→ Note the cemetery is on **46th Avenue**, and the Olde Towne burial ground is on **46th Avenue between 164th
and 165th** — the two are close but they are different places. Do not conflate.

**F259.** The cemetery's own description, quoted exactly: "Flushing Cemetery is a non-sectarian cemetery
conveniently located in Queens, NY and is easily accessible by all major arteries. With over 75 countryside
acres, this picturesque cemetery can accommodate burials and interment of cremains in traditional plots, chapel
niches, or outside niche locations in our Memorial Garden."
Source: https://www.flushingcemetery.com/
→ **FLAG: "over 75 countryside acres" against PLUTO's `lotarea: 1845000` square feet (~42.4 acres) on the one
lot I queried.** PLUTO may cover only part of the grounds. §N row 20. Do not publish an acreage.
**F260.** Visiting hours, quoted exactly: "Cemetery Grounds: 8:15am - 4:30pm every day" and "Cemetery Office:
8:15am - 4:15pm Monday - Friday / 8:15am - 1pm Saturday / Closed on Sundays and Holidays"
Source: https://www.flushingcemetery.com/
**F261.** Wikipedia on the founding, quoted exactly: "During 1853, in which the Flushing Cemetery was founded,
the population of Queens County was around 20,000. The land the original site for Flushing Cemetery would rest
was the 20-acre John Purchase farm, which was selected by committee. A select number of individuals who attended
the founding meeting: Reverend John Gilder, Henry Christie, William Leonard, Caleb Smith, and Robert B. Parsons."
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`
→ Note a **Parsons** among the founders. And note the article's sources are two offline pamphlets (a 1945
tri-centennial booklet and a 1953 centennial booklet) plus 1950s–60s *Long Island Daily Press* clippings. **This
whole article is weakly sourced by modern standards. Treat every number in it as unconfirmed.**
**F262.** Wikipedia, quoted exactly: "The day these founders received their charter was May 5, 1853 was the same
day in which the World's Fair in New York Crystal Palace was scheduled to open. Civil engineer Horace Daniels
was responsible for plotting the grounds. In 1875, the Whitehead Duryea farm, which measured 50 acres and
adjoined the cemetery, was purchased and added to the site."
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`
→ 20 acres + 50 acres = 70, against the cemetery's own "over 75". Roughly consistent. Still unconfirmed.
**F263.** Wikipedia on the Quaker section, quoted exactly: "The Bayside Quakers and some of their relatives and
neighbors, in about 1860, brought a half-acre within this cemetery in the western half of section I. Section I,
which is also referred to as the Quaker Burial Place of Flushing, is where 43 people (the largest in one group)
are buried, while 109 were buried in Flushing Cemetery."
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`
→ **FLAG (§L row 17): "The Bayside Quakers" bought a plot in a Flushing cemetery.** This is the second and last
Bayside cross-reference I found. It is a 19th-century burial arrangement, sourced to a 1967 newspaper column. It
is **not** a claim that the neighborhoods are contiguous or related today. "brought" is presumably "bought".
Recorded, not resolved.
**F264.** Wikipedia's burials list, reproduced exactly as the article gives it:
"Louis Armstrong (1901–1971), trumpeter and singer / Bernard Baruch (1870–1965), businessman / Laurie Bird
(1952–1979), actress and photographer / Eugene Bullard (1895–1961), the first African-American military pilot /
Ellis Parker Butler (1869–1937), writer / Adam Clayton Powell Sr. (1865–1953), pastor / Charles S. Colden
(1885–1960), lawyer and judge / Barney Corse (1799–1878), Quaker abolitionist / Albert Fish (1870–1936), serial
killer, child rapist and cannibal / Joseph Fitch (1857–1917), lawyer, politician and judge / Dizzy Gillespie
(1917–1993), jazz trumpet player / Hermann Grab (1903–1949), writer / Johnny Hodges (1907–1970), saxophonist /
Thomas B. Jackson (1797–1881), politician / Jan Matulka (1890–1972), Czech-American modern artist / Lemuel E.
Quigg (1863–1919), politician / May Robson (1858–1942), actress / Aris San (1940–1992), singer / Vincent Sardi
Sr. (1885–1969), restauranteur / Hazel Scott (1920–1981), musician and singer / Charlie Shavers (1920–1971),
trumpeter / Battling Siki (1897–1925), boxer / Frederic Storm (1844–1935), politician"
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`
→ **Louis Armstrong, Dizzy Gillespie, Johnny Hodges, Charlie Shavers and Hazel Scott are buried in Flushing.**
Five major jazz figures in one cemetery. The article's own footnote for the section cites an article titled
"Six Feet Under the Borough of Jazz" (*Grade "A" Fancy Magazine*, 21 May 2015). This connects to Flushing Town
Hall's "Queens Jazz Trail Map" and "Monthly Jazz Jams" (F163).
→ **VERIFY EVERY NAME INDIVIDUALLY.** This is an aggregator list on a weakly-sourced page. Louis Armstrong in
particular is strongly associated with **Corona**, where his house museum is; his *burial* in Flushing is a
separate fact from his *residence* in Corona and the writer must keep them apart. §L row 10.
→ **Also note Eugene Bullard and Adam Clayton Powell Sr. — neither is a Flushing figure; they are buried here.**
Burial is a legitimate connection but a thin one. Do not inflate it.
**F265.** Wikipedia gives Flushing Cemetery's coordinates as "40°45′6″N 73°47′58″W" / "40.75167°N 73.79944°W".
Source: https://en.wikipedia.org/wiki/Flushing_Cemetery `[AGGREGATOR]`

### P40 — Mount Hebron Cemetery — **NOT in this page's scope**
**F266.** DCP files it in Community District 8: `QN0871 | Mount Hebron & Cedar Grove Cemeteries | MtHbrnCem |
ntatype 7 | QN08 | QN08 Fresh Meadows-Hillcrest-Briarwood (CD 8 Approximation)`.
Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json
→ Wikipedia links it to Flushing only via Cadwallader Colden's estate site (F73). §L row 7. **Out of scope.**

---

## §I — THE FIREWALL LEDGER: places inside or on the edge of Flushing Meadows–Corona Park

Every row here is recorded **so the writer can see the boundary**, not so it can be used. **None of these may
be created as a place record on the Flushing page.** The route is a link to `/g/citi-field-guide`.

| # | Place | Owned by CitiFieldPlaces? | What the source says | Disposition I recommend the verifier consider |
|---|---|---|---|---|
| 1 | Citi Field | **YES** | F6 | Firewalled. Link only. |
| 2 | Unisphere | **YES** | F6, F7 | Firewalled. Link only. |
| 3 | Queens Museum | **YES** | F6 | Firewalled. Link only. |
| 4 | New York Hall of Science | **YES** | F6 | Firewalled. Link only. |
| 5 | Queens Zoo | **YES** | F7 | Firewalled. Link only. |
| 6 | USTA Billie Jean King National Tennis Center | **YES** | F6, F7 | Firewalled. Link only. |
| 7 | New York State Pavilion | **YES** | F6, NRHP `09000942` | Firewalled. Link only. |
| 8 | Queens Theatre | **YES** | F6 | Firewalled. Link only. |
| 9 | Flushing Meadows–Corona Park itself | Ruled wave 3: no neighborhood file | F5, F6 | Jointly Interested Area. Not a Flushing place. |
| 10 | Arthur Ashe Stadium | Component of #6 | F7 | Inside #6. Do not create. |
| 11 | Louis Armstrong Stadium | Component of #6 | F7 | Inside #6. Do not create. |
| 12 | The Rocket Thrower (sculpture) | **NO** — not among the eight | F7 | **UNRULED.** Inside the JIA. Recommend: no. |
| 13 | Statue of Tom Seaver | **NO** — not among the eight | F7 | **UNRULED.** At Citi Field. Recommend: no. |
| 14 | Etihad Park (under construction) | **NO** — not among the eight | F7 | **UNRULED.** Inside the JIA. Recommend: no. |
| 15 | 1964-65 World's Fair Carousel | **NO** | NRHP `16000038`, address `54th & 56th Aves. on 111th St.`, city Flushing | **UNRULED.** Address is a Corona one. Recommend: no. |
| 16 | Meadow Lake / Willow Lake | **NO** | F268 | **UNRULED.** Inside the JIA. Recommend: no. |
| 17 | Queens Botanical Garden | **NO** | F221 vs F222–F224 | **THE HARD ONE. See P26. Not resolved here.** |
| 18 | Mets–Willets Point LIRR station | **NO** | F282 | Transit is prose, mints no place record (site-builder §8). |
| 19 | World's Fair Marina | **NO** | fetched, unmined | **UNRULED.** On Flushing Bay at the park. Recommend: no. |
| 20 | Queens Night Market | **NO** | Recorded in the Corona finder as behind the Hall of Science | **UNRULED.** Recommend: no. |

**F267.** The NRHP row for the carousel, verbatim: refnum `16000038`; name `1964-1965 New York World's Fair
Carousel`; address `54th & 56th Aves. on 111th St.`; city `[[Flushing, Queens|Flushing]]`; date `2016-2-23`;
description "Combination of two old Coney Island carousels for World's Fair is one of few fairground attractions
left from it".
Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York `[AGGREGATOR]`
→ **FLAG: the NRHP files it under city "Flushing", but 111th Street and 54th/56th Avenues is Corona ground.**
This is the NRHP using "Flushing" as a postal designation, exactly as F24 predicts. §L row 11.
**F268.** Wikipedia on the lakes, quoted exactly: "Prior to the 1939 New York World's Fair , the southern portion
of the river was expanded into the Meadow and Willow Lakes. A part of the Flushing River was buried prior to the
1964 New York World's Fair ."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
**F269.** The NRHP row for the New York State Pavilion, verbatim: refnum `09000942`; address
`[[Flushing Meadows – Corona Park]]`; city `[[Flushing, Queens|Flushing]]`; date `2009-11-20`.
Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens,_New_York `[AGGREGATOR]`
→ Recorded only to show that the NRHP's "city" field is postal, not neighborhood. **It is owned by
CitiFieldPlaces regardless.**

---

## §J — Houses of worship

**F270.** Wikipedia's list, quoted exactly: "Houses of worship in Flushing include the Dutch colonial epoch
Quaker Meeting House, the historic Unitarian Universalist Congregation of Queens, St. Andrew Avellino Roman
Catholic Church, St. George's Episcopal Church, the Free Synagogue of Flushing , the Congregation of Georgian
Jews , St. Mel Roman Catholic Church, St. Michael's Catholic Church, St. Nicholas Greek Orthodox Shrine Church,
Holy Annunciation Russian Orthodox Church, St. John's Lutheran Church, Queensboro Hill Community Church, Hindu
Temple Society of North America, and the Muslim Center of New York."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **P41–P52.** Of these fourteen, I obtained an independent institutional source for **only two** (the Ganesh
Temple and, via LPC, St. George's and the Meeting House). `stgeorgesflushing.org`, `freesynagogue.org`,
`uucq.org`, `mcyny.org`, `sikhcenterofnewyork.org`, `standrewavellino.org` and `bownestreet.org` all failed to
resolve or returned empty. **Do not write about any of the other congregations from this list alone.**
**F271.** Wikipedia, quoted exactly: "Flushing is a religiously diverse community." and "There are more than 200
houses of worship in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **The "more than 200" figure is the single most quotable claim about religious Flushing and it is uncited in
the source as retrieved.** Verify before publishing.

### P41 — Hindu Temple Society of North America / Sri Maha Vallabha Ganapati Devasthanam
**Institution's own:** "45-57 Bowne Street, Flushing, NY 11355 – Phone: (718) 460-8484 ext. 112" ·
**PLUTO:** `45-50 SMART STREET`, zip `11355`, `cd: 407`, `yearbuilt: 1977`, `lotarea: 50110`, `bldgclass: M1`,
owner `HINDU TEMPLE SOCIETYOF NORTH AMERICA` · **GeoSearch (45-57 Bowne St):** `Flushing`
→ PLUTO's street differs from the temple's own. §M row 12.

**F272.** Wikipedia, quoted exactly: "The Sri Maha Vallabha Ganapati Devasthanam ( Sanskrit :
श्री महावल्लभ गणपति देवस्थानम्, Tamil : ஸ்ரீ மகா வல்லப கணபதி தேவஸ்தானம்) at 45–57 Bowne Street in Flushing was
the very first of the traditional Hindu temple organized in North America."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"the very first of the traditional Hindu temple organized in North America"** — the sentence is ungrammatical
in the source. The claim is major and the writer will want it. **Verify it independently; do not reproduce the
broken grammar.**
**F273.** The temple's own hours, quoted exactly: "Temple Hours : Weekdays: 8:00 am to 8:30 pm · Weekends: 7:30
am to 8:30 pm" and "Timings for admittance are subject to change at the discretion of the Temple Management"
Source: https://nyganeshtemple.org/about/
**F274.** The temple's community centre, quoted exactly: "The Community Center complex at the Hindu Temple houses
an exquisite auditorium, wedding halls, conference rooms and a canteen to host all types events, cultural meets,
functions, conferences, fairs and festivals." and "Considered one of the best performance centers in Queens, the
Hindu Temple auditorium offers state-of-the-art lighting, high-definition acoustics and an outstanding
performance space for the highest caliber of music, dance and theatrical productions including Indian classical
and contemporary music and dances, operas, orchestras and ensembles."
Source: https://nyganeshtemple.org/about/
→ "Considered one of the best performance centers in Queens" is the institution's own marketing. Attribute it or
drop it.
**F275.** The gift shop, quoted exactly: "Temple Gift Shop (Located in the Temple Canteen area) – lower level"
and "The temple gift shop carries a wide variety of items, such as pictures of Deities, Vigrahas (idols),
pendants, coins, Veda and prayer books, Amarchitra Katha (Illustrated books for children), Tulsi and Rudraksha
mala, Vibhooti, Chandana, Kumkuma, Key chains, Video/Audio Tapes, CDs, DVDs, Ayurvedic medicines and many more
items!."
Source: https://nyganeshtemple.org/about/
**F276.** The temple's tax identity, quoted exactly: "The Hindu Temple Society of North America – Fed Tax Id:
#237071891"
Source: https://nyganeshtemple.org/about/
→ Useful to the verifier for confirming the corporate entity.

### P42 — The Temple Canteen
**F277.** The temple's navigation includes "About The Canteen" and the gift shop is "Located in the Temple
Canteen area".
Source: https://nyganeshtemple.org/about/ (the dedicated `/temple-canteen/` URL returned HTTP 404)
**F278.** DOHMH restaurant inspections record: `TEMPLE CANTEEN | 45-57 BOWNE STREET | 11355 | Indian`.
Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried
`boro='Queens' AND zipcode in('11354','11355','11358') AND upper(dba) like '%TEMPLE CANTEEN%'`)
→ **SOURCING DISCLOSURE: for the Temple Canteen I have the temple's own website naming it AND the DOHMH
dataset. It is therefore NOT DOHMH-only.** The DOHMH address matches the temple's exactly. A vegetarian canteen
in the basement of the oldest traditional Hindu temple in North America is a strong, well-sourced candidate.

### P43 — Free Synagogue of Flushing
**NRHP:** `Free Synagogue of Flushing`, `41-60 Kissena Blvd.`, `09000834`, listed 2009-10-16. **Not
LPC-designated.** **PLUTO:** `136-23 SANFORD AVENUE`, zip `11355`, `cd: 407`, `yearbuilt: 1931`,
`lotarea: 21075`, `bldgclass: M1`, owner `FREE SYNAGOUGUE OF FLUSHING` (the misspelling is the City's) ·
**GeoSearch (41-60 Kissena Blvd):** `Flushing`
→ PLUTO's street differs from the NRHP's. §M row 13.
**F279.** Wikipedia, quoted exactly: "Free Synagogue of Flushing , located at 41–60 Kissena Boulevard, near
Sanford Avenue"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"near Sanford Avenue" reconciles the two addresses** — the building sits on the corner. Good.
→ `https://www.freesynagogue.org/` and `/about` both returned zero bytes. **Gap: no institutional source, no
history, no hours.** I fetched the Wikipedia article (35,548 chars) but did not mine it. **Gap on disk:**
`flpages/wiki_freesyn.txt`

### P44 — Pure Presbyterian Church
**F280.** Wikipedia photo caption, quoted exactly: "Pure Presbyterian Church, located at 142–08 32nd Avenue, near
Union Street"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Caption only. No other source. Thin.

### P45 — Sikh Center of New York
**F281.** Wikipedia photo caption, quoted exactly: "Sikh Center in Flushing"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **A caption with no address and no article.** `sikhcenterofnewyork.org` did not resolve. **Do not write about
this from a photo caption.** Recorded only so the verifier knows a Sikh gurdwara is attested in Flushing and can
go looking.

---

## §K — The Chinatown, the Koreatown, and the other enclaves

### P46 — Flushing Chinatown (法拉盛華埠)
**F282.** Wikipedia, quoted exactly: "Flushing Chinatown is centered around Main Street and the area to its west,
most prominently along Roosevelt Avenue , which have become the primary nexus of Flushing Chinatown. However,
Chinatown continues to expand southeastward along Kissena Boulevard and northward beyond Northern Boulevard ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F283.** Wikipedia, quoted exactly: "The Flushing Chinatown houses over 30,000 individuals born in China alone,
the largest Chinatown by this metric outside Asia and one of the largest and fastest-growing Chinatowns in the
world."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **Note the careful metric: "individuals born in China alone".** That is a narrower claim than "largest
Chinatown". The writer must keep the qualifier.
**F284.** Wikipedia's image caption, quoted exactly: "The segment of Main Street between Kissena Boulevard and
Roosevelt Avenue, punctuated by the Long Island Rail Road Port Washington Branch overpass, represents the cultural
heart of Flushing Chinatown."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **A precisely bounded two-block segment named as the cultural heart, with a physical landmark (the LIRR
overpass) marking it.** The best single walking instruction in the file.
**F285.** The romanisations, quoted exactly from the transcription table: "Traditional Chinese 法拉盛華埠 /
Simplified Chinese 法拉盛华埠 / Hanyu Pinyin Fǎlāshèng Huá Bù / Gwoyeu Romatzyh Faalashenq Hwabuh / Wade–Giles Fa
3 la 1 sheng 4 Hua 2 Pu 4 / Tongyong Pinyin Fǎlāshèng Húa Bú / Jyutping Faat3laa1sing4 Waa4 Bou6 / Hokkien POJ
Niú-iok Hôa-bú"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** the *Downtown Flushing* article gives a **different Jyutping** for the same characters:
"Jyutping Faat3laa1sing4 Waa4 fau6" and a different Hokkien POJ: "Hoat-la-sēng Hôa-po͘". §N row 21. **Do not
publish a romanisation without a language-competent check.**
**F286.** Wikipedia, quoted exactly: "In Mandarin , Flushing is known as "Falasheng" ( Chinese : 法拉盛 ; pinyin
: Fǎlāshèng )."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F287.** Wikipedia on the Taiwanese first wave, quoted exactly: "In the 1970s, immigrants from Taiwan
established a foothold in Flushing, whose demographic constituency had been predominantly non-Hispanic white,
interspersed with a small Japanese community. Additionally, a large South Korean population also called Flushing
home. The Taiwanese immigrants were the first wave of Chinese-speaking immigrants who spoke Mandarin (Taiwanese
also spoken) rather than Cantonese to arrive in New York City."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F288.** The *Downtown Flushing* article gives the fuller version, quoted exactly: "This wave of immigrants from
Taiwan were the first to arrive and developed Flushing's Chinatown. It was known as Little Taipei ( 小台北 ) or
Little Taiwan ( 小台灣 ). Many who arrived were the descendants of former soldiers and political supporters of
Chiang Kai-shek and the Chinese Nationalist Party , which had lost the war against the Chinese Communist Party ,
and established themselves in Taiwan."
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`
→ **"Little Taipei" / 小台北 as the neighborhood's earlier name.** A genuine historical layer.
**F289.** The *Downtown Flushing* article on why they came here rather than Manhattan, quoted exactly: "Due to the
dominance of Cantonese-speaking immigrants, who were largely working-class in Manhattan's Chinatown ( Chinese :
紐約華埠 ; Jyutping : Nau2 Joek3 Waa4 Fau6 ), as well as the language barrier and poor housing conditions there,
Taiwanese immigrants, who were more likely to have attained higher educational standards and socioeconomic status
, could not relate to Manhattan's Chinatown, and chose to settle in Flushing instead. As the Taiwanese population
grew, a Flushing Chinatown was created with a higher standard of living and better housing conditions."
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`
→ **This is the causal explanation the page needs: Flushing's Chinatown exists because Manhattan's was
Cantonese and working-class.** Verify; it is a strong sociological claim.
**F290.** Wikipedia on the later waves, quoted exactly: "The early 1990s and 2000s brought a wave of Fuzhounese
Americans and Wenzhounese immigrants, who mostly spoke Mandarin, and who settled in Flushing as well as Elmhurst
. Flushing's Chinese population became diverse over the next few decades as people from different provinces
started to arrive." and "Due to loosened emigration restrictions in mainland China, there has been a growing
Northern Chinese population in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note **Elmhurst** — which already ships a page. A shared migration history, not a shared place. §L row 6.
**F291.** Wikipedia on cuisine, quoted exactly: "The regional food cuisines have led to Flushing being considered
the "food mecca" for Chinese regional cuisine outside of Asia."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F292.** Wikipedia's cuisine list, quoted exactly: "The popular styles of Chinese cuisine are ubiquitously
accessible in Flushing, including Hakka , Taiwanese , Shanghainese , Hunanese , Sichuanese , Cantonese ,
Fujianese , Xinjiang , Zhejiang , and Korean Chinese cuisine . Even the relatively obscure Dongbei style of
cuisine indigenous to Northeast China is now available in Flushing, as well as Mongolian cuisine and Uyghur
cuisine ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F293.** Wikipedia's language list, quoted exactly: "Varieties of Chinese spoken in Flushing include Mandarin
Chinese , Fuzhou dialect , Min Nan ( Hokkien ), Wu Chinese ( Wenzhounese , Shanghainese , Suzhou dialect ,
Hangzhou dialect ), and Cantonese ; in addition, the Mongolian language is now emerging."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F294.** Wikipedia on the 1986 estimate, quoted exactly: "A 1986 estimate by the Flushing Chinese Business
Association approximated 60,000 Chinese in Flushing alone." and "By 1990, Asians constituted 41% of the
population of the core area of Flushing, with Chinese in turn representing 41% of the Asian population."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F295.** Wikipedia on the 2020s share, quoted exactly: "As of the 2020s, about 3/4 of the Asian population in
the area are of Chinese descent making them the majority of the Asian population."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F296.** Wikipedia on the Lunar New Year Parade, quoted exactly: "The Lunar New Year Parade has become a growing
annual celebration of Chinese New Year ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **A recurring public event a visitor could travel for, and I have exactly one uncited aggregator sentence for
it. Gap: find the organiser and the route.**
**F297.** Wikipedia on media, quoted exactly: "The World Journal , one of the largest Chinese-language newspapers
outside China, is headquartered in adjacent Whitestone . Numerous other Chinese- and English-language
publications are available in Flushing, including SinoVision , one of North America's largest Chinese language
television networks."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG: the World Journal is headquartered in WHITESTONE, not Flushing.** Whitestone is wave 6,
`in_scope: false`. §L row 3. **Do not create it as a Flushing place.**
**F298.** Wikipedia on supermarkets, quoted exactly: "In addition, several Chinese supermarkets such as Hong Kong
Supermarket and New York Supermarket have locations in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Chain locations. No addresses given. Thin.
**F299.** Wikipedia on gentrification, quoted exactly: "Flushing is undergoing rapid gentrification by Chinese
transnational entities."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F300.** *The Guardian*, quoted via the *Downtown Flushing* article's reference, exactly: "The influx of
transnational capital and rise of luxury developments in Flushing has displaced longtime immigrant residents and
small business owners, as well as disrupted its cultural and culinary landscape. These changes follow the
familiar script of gentrification, but with a change of actors: it is Chinese American dev" (the quotation is
truncated in the reference as I retrieved it)
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]` `[QUOTE-VIA]` — original: Wong, "'Not what
it used to be': in New York, Flushing's Asian residents brace against gentrification", *The Guardian US*, January
29, 2021.
→ **The verifier should go to the Guardian article directly.** It also supplies, in the same reference: "Tangram
Tower, a luxury mixed-use development built by F & T. Last year, prices for two-bedroom apartments started at
$1.15m" and a developer's attorney quoted as saying "They've been here, they live here, they work here, they've
invested here". **This is the best non-aggregator material I found on present-day Flushing and it is reachable.**
**F301.** Wikipedia, quoted exactly: "In January 2019, the New York Post named Flushing as New York City's "most
dynamic outer-borough neighborhood"."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]` `[QUOTE-VIA]`
**F302.** Wikipedia on Chinese Muslims, quoted exactly: "As of 2024, a significant new wave of Chinese Muslims
are fleeing religious persecution in northwestern China's Xinjiang Province and seeking religious freedom in New
York, and concentrating in Queens."
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`
→ **Note the resonance with the Flushing Remonstrance the source itself invites: people "seeking religious
freedom" arriving in the town whose charter promised liberty of conscience.** The writer may find this
irresistible. It is a 2024 claim about *Queens*, not specifically Flushing, and it is a live political matter.
**Handle with restraint and verify.**
**F303.** Wikipedia's borough-level table of Chinese American residents, verbatim: "Queens 10.2 265,135 /
Brooklyn 7.9 222,059 / Manhattan 6.6 119,208 / Staten Island 2.9 27,707 / The Bronx 0.5 7,859 / New York City
573,388"
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`

### P47 — Koreatown, Flushing (the Long Island Koreatown)
**F304.** Wikipedia, quoted exactly: "There is a Koreatown that originated in Flushing, but has since spread
eastward to Murray Hill , Bayside , Douglaston , and Little Neck in Queens, and also into Nassau County . The
Koreatown has historically been centered around Union Street, with the later growth being concentrated around
Northern Boulevard east of Union Street."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **§L rows 4 and 5, and READ THIS CAREFULLY.** This is the ONLY substantive source statement connecting
Flushing to Bayside and Douglaston, and it is a statement about a **diaspora spreading along a road**, not about
neighborhoods adjoining. The brief warns against manufacturing ties across the gap. **This is not a manufactured
tie — a source really does say it — but it is also not a claim that Flushing borders Bayside.** It must be
written, if at all, as what it is: an ethnic commercial corridor running east along Northern Boulevard through
several separate neighborhoods. **Recorded, not resolved.**
**F305.** The dedicated Koreatown article says the same with more neighborhoods, quoted exactly: "The core of
this Koreatown originated in the Flushing neighborhood of the New York City borough of Queens . This Koreatown
has continued to expand rapidly eastward alongside Northern Boulevard through the Queens neighborhoods of Murray
Hill , Auburndale , Bayside , Douglaston, Little Neck ." and "It is largely oriented around Northern Boulevard ."
Source: https://en.wikipedia.org/wiki/Koreatown,_Flushing `[AGGREGATOR]`
→ Note it adds **Auburndale** (CD 11, `in_scope: false`) to the list.
**F306.** Wikipedia on the 1980s establishment, quoted exactly: "In the 1980s, a continuous stream of Korean
immigrants emerged into Flushing, many of whom began as workers in the medical field or Korean international
students who had moved to New York City to find or initiate professional or entrepreneurial positions. They
established a foothold on Union Street in Flushing between 35th and 41st Avenues, featuring restaurants and
karaoke ( noraebang ) bars, grocery markets, education centers and bookstores , banking institutions, offices,
consumer electronics vendors, apparel boutiques , and other commercial enterprises."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"Union Street in Flushing between 35th and 41st Avenues" is a precise, walkable, six-block Flushing
address for the Koreatown's origin.** This belongs on the page; the Bayside/Douglaston extension does not.
**F307.** Wikipedia on why it grew eastward, quoted exactly: "As the community grew in wealth and population and
rose in socioeconomic status , Koreans expanded their presence eastward along Northern Boulevard, buying homes in
more affluent and less dense neighborhoods in Queens and Nassau County. This expansion has led to the creation of
an American Meokjagolmok , or Korean Restaurant Street , around the Murray Hill station . The eastward pressure
to expand was also created by the inability to move westward due to the Flushing Chinatown on Main Street."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"The eastward pressure to expand was also created by the inability to move westward due to the Flushing
Chinatown on Main Street."** A causal, geographic, checkable claim about how two enclaves pressed against each
other on one street grid. Excellent if it verifies.
→ Note the **Meokjagolmok / Korean Restaurant Street is "around the Murray Hill station"** — the LIRR station in
the Murray Hill section of Flushing, NOT Manhattan's Murray Hill and NOT Bayside. §L row 1.
**F308.** Wikipedia on scale, quoted exactly: "Per the 2010 United States census , the Korean population of
Queens was 64,107, representing the largest municipality in the United States with a density of at least 500
Korean Americans per square mile . The Korean American population, consisting of 218,764 individuals in the New
York metropolitan area , is the second largest population of ethnic Koreans outside Korea."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F309.** Wikipedia on the street scene, quoted exactly: "The Korea Times , a news organization based in Seoul,
carries a significant presence in the Long Island Koreatown. The Long Island Koreatown features numerous
restaurants that serve both traditional and/or regional Korean cuisine. Korean is spoken frequently alongside
English and Chinese varieties, and retail signs employing the Hangul alphabet are ubiquitous."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F310.** Wikipedia, quoted exactly: "There is also a significant population of Korean-Chinese or Chinese-Koreans
in Flushing who can speak Mandarin, Korean, and English."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

### P48 — Little India / the South Asian corridor south of Franklin Avenue
**F311.** Wikipedia, quoted exactly: "An area south of Franklin Avenue houses a concentration of Indian ,
Pakistani , Afghan , and Bangladeshi markets. This concentration of Indian American and other South Asian
American businesses south of Franklin Avenue has existed since the late 1970s, one of the oldest Little India
neighborhoods in North America."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"one of the oldest Little India neighborhoods in North America", since the late 1970s, south of Franklin
Avenue.** A third enclave with a precise boundary, and it is the least-written-about of the three. Uncited in
the source. Verify.
**F312.** Wikipedia, quoted exactly: "However, Indians are migrating eastward into neighborhoods in northeastern
Queens and into Nassau County, as with many Chinese and Korean immigrants."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]` — marked `[citation needed]` in the source.

### P49 — East Flushing's other communities
**F313.** Wikipedia, quoted exactly: "The neighborhood of East Flushing, technically within Greater Flushing,
also houses a substantial Chinese community along with most of Downtown Flushing . However, East Flushing also
substantially includes Irish , Greek , Russian , Italian , Jewish , Spanish , and Portuguese communities, as well
as communities of Indians , Sri Lankans , Japanese , Malaysians , and Hispanics , mostly Colombians and
Salvadorans . This neighborhood tends to be more diverse visibly than Downtown Flushing because of the more even
distribution of the ethnicities of East Flushing residents"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the phrase "**technically within Greater Flushing**" — the aggregator's own hedge. And recall F10: the
project roster files East Flushing in CD 11, DCP in CD 7. §L row 2.
**F314.** Wikipedia, quoted exactly: "The northeastern section of Flushing near Bayside continues to maintain
large Italian and Greek presences that are reflected in its many Italian and Greek bakeries, grocery stores and
restaurants. The northwest is a mix of Jews , Greeks , and Italians . Most of central Flushing is an ethnic mix
of Whites , Hispanic Americans , and Asian Americans ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **§L row 4: "The northeastern section of Flushing near Bayside".** The third and final Bayside cross-reference.
It describes a *part of Flushing* by its proximity to Bayside. It is not a claim about Bayside itself and it must
not become one.
**F315.** Wikipedia on cram schools, quoted exactly: "As a result of the high number of Chinese and Korean
immigrants with ( Confucius ) educationally orientated outlooks, there is a large number of cram schools (
Buxiban and hagwon ) located not only in Flushing, but also following Northern Blvd. west into Nassau County."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **The source says "Northern Blvd. WEST into Nassau County". Nassau County is EAST of Flushing.** The source
has its compass backwards. §N row 22. **Do not reproduce.**

---

## §L-food — Restaurants and businesses, with explicit sourcing disclosure

**READ THIS BEFORE WRITING ANY RESTAURANT.** I queried DOHMH restaurant inspections
(`data.cityofnewyork.us/resource/43nn-pn8j.json`) filtered to `boro='Queens'` and
`zipcode in('11354','11355','11358')` for twenty-five named establishments. Below, for each hit, I state
**exactly** what my sourcing is.

| # | DBA (verbatim) | Address (verbatim) | ZIP | Cuisine (verbatim) | Sourcing |
|---|---|---|---|---|---|
| P50 | `NAN XIANG XIAO LONG BAO` | `39-16 PRINCE STREET` | 11354 | `Chinese` | **DOHMH ONLY** |
| P51 | `JOE'S STEAM RICE ROLL` | `136-20 ROOSEVELT AVENUE` | 11354 | `Chinese` | **DOHMH ONLY** |
| P52 | `WHITE BEAR` | `135-02 ROOSEVELT AVENUE` | 11354 | `Chinese` | **DOHMH ONLY** |
| P53 | `XI'AN FAMOUS FOODS` | `133-36 37 AVENUE` | 11354 | `Chinese` | DOHMH + named in the Wikipedia Flushing navbox under "Commerce" |
| P54 | `XI'AN FAMOUS FOODS` | `41-10 MAIN STREET` | 11355 | `Asian/Asian Fusion` | DOHMH + navbox (a **second** location) |
| P55 | `SZECHUAN MOUNTAIN HOUSE` | `39-16 PRINCE STREET` | 11354 | `Chinese` | DOHMH + named in the Wikipedia Flushing navbox under "Commerce" |
| P56 | `SHANGHAI YOU GARDEN` | `135-33 40 ROAD` | 11354 | `Chinese` | **DOHMH ONLY** |
| P57 | `TONG SAM GYUP GOO YI` | `162-23 DEPOT ROAD` | 11358 | `Korean` | **DOHMH ONLY** |
| P42 | `TEMPLE CANTEEN` | `45-57 BOWNE STREET` | 11355 | `Indian` | DOHMH **+ the temple's own website** (F277) — not DOHMH-only |

Source for every row: https://data.cityofnewyork.us/resource/43nn-pn8j.json

**F316.** **SOURCING VERDICT, stated plainly for the verifier: six of these nine rows (P50, P51, P52, P56, P57,
and both halves of the Xi'an pair insofar as the navbox is not a real source) rest on a health-inspection dataset
and nothing else.** A DOHMH row establishes that a business with that name was inspected at that address. It
establishes **nothing** about quality, fame, history, opening hours, whether it is still open, or whether it is
worth travelling for. **The writer may not describe any DOHMH-only business as notable, famous, acclaimed,
beloved, a destination, or a must-visit.** If a business cannot be sourced beyond DOHMH, the honest options are
to omit it or to name it flatly as an address.

**F317.** The Wikipedia Flushing navbox lists exactly three commercial entities, quoted exactly: "Commerce / New
World Mall / Szechuan Mountain House / Xi'an Famous Foods".
Source: https://en.wikipedia.org/wiki/Flushing_Armory (Flushing navbox) `[AGGREGATOR]`
→ A navbox entry means an article exists, not that the business is significant. **Weak.**

**F318.** **Restaurants I searched for and did NOT find in DOHMH under those names in 11354/11355/11358:**
`SPICY & TASTY`, `HUNAN HOUSE`, `GOLDEN SHOPPING MALL`, `NEW WORLD MALL`, `LITTLE LAMB`, `GUAN FU`, `TIANJIN`,
`HAPPY STONY NOODLE`, `LAOSHAN`, `DUMPLING GALAXY`, `FU RUN`, `HANGAWI`, `KUM GANG SAN`, `MAPO KOREAN BBQ`,
`SIK GAEK`.
Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json
→ **Absence here is NOT evidence a place does not exist.** DOHMH records the legal DBA, which often differs from
the trading name, and food courts trade under the operator's name. **Do not write "X has closed" from this.**

**F319.** **Michelin and James Beard: NOT OBTAINED.** `guide.michelin.com` returned zero bytes (the site is
JavaScript-rendered and my retrieval could not execute it); `jamesbeard.org/awards/search?q=flushing` returned
3,369 characters of page chrome with no result data. **I therefore have NO third-party culinary recognition for
any Flushing restaurant.** This is a real and consequential gap: Flushing's reputation as a food destination
(F291) is asserted by an aggregator and corroborated by nothing I could fetch. **The verifier should retry
Michelin and the James Beard Foundation with a JavaScript-capable fetch before the writer describes Flushing's
food scene in superlatives.**

**F320.** The Golden Shopping Mall — a famous basement food court — appears in **none** of my sources. Wikipedia
has no article at `Golden_Shopping_Mall` (HTTP 404) and DOHMH has no matching DBA. **Recorded as a known gap.**

### P58 — New World Mall
**F321.** Wikipedia, quoted exactly: "New World Mall , at Roosevelt Avenue east of Main Street"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ I fetched https://en.wikipedia.org/wiki/New_World_Mall (16,173 chars) and https://www.newworldmallny.com/
(1,592 chars) but mined neither before writing. **Gap on disk:** `flpages/wiki_newworldmall.txt`,
`flpages/newworldmall.txt`

---

## §M-transit — Getting there (prose only; mints no place records per docs/site-builder.md §8)

### The subway
**F322.** Wikipedia, quoted exactly: "There is one New York City Subway station in Flushing, the Flushing–Main
Street station at Main Street and Roosevelt Avenue, served by the 7 and < 7 > ​ trains . It is one of the busiest
stations in the New York City Subway system as of 2018 ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F323.** The *Downtown Flushing* article makes the sharper claim, quoted exactly: "The Flushing–Main Street
station is the busiest New York City Subway station outside Manhattan."
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]`
→ **Two differently-scoped superlatives for the same station. Prefer the one the MTA data supports.**
**F324.** **MTA monthly station ridership, primary, verbatim values** for `Flushing-Main St (7)`, borough
`Queens`:

| month | ridership | transfers |
|---|---|---|
| 2026-07 | 1,281,303 | 486,534 |
| 2026-06 | 1,318,627 | 493,861 |
| 2026-05 | 1,324,646 | 490,127 |
| 2026-04 | 1,284,039 | 488,351 |
| 2026-03 | 1,321,213 | 504,552 |
| 2026-02 | 1,082,193 | 408,281 |
| 2026-01 | 1,155,236 | 426,520 |
| 2025-12 | 1,265,398 | 413,728 |
| 2025-11 | 923,334 | 313,926 |

Source: https://data.ny.gov/resource/ak4z-sape.json ("MTA Subway Station Monthly Ridership: Beginning February
2017", queried `$where=station_complex like '%Flushing%'&$order=month DESC`)
→ **Over 1.2 million riders in a typical recent month, plus roughly half a million transfers.** This is primary
MTA data and it is far better than any aggregator superlative. **Note it is monthly, not annual.**
→ **TRAP:** the same query returns `Flushing Av (M,J)` and `Flushing Av (G)`, both in **Brooklyn**. Those are a
different Flushing Avenue entirely and have nothing to do with this neighborhood. Do not let them into the page.
**F325.** Wikipedia, quoted exactly: "Flushing–Main Street , the terminal station of the IRT Flushing Line ( 7
and < 7 > ​ trains )"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **It is the eastern terminus of the 7.** Simple, true, and useful.

### The Long Island Rail Road
**F326.** Wikipedia, quoted exactly: "The Long Island Rail Road 's Port Washington Branch also serves Flushing via
the following stations: Mets–Willets Point / Flushing–Main Street / Murray Hill / Broadway"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** `Mets–Willets Point` serves Citi Field and Flushing Meadows–Corona Park. It is transit prose, so it
mints no place record, but the writer must not use it as a hook to describe the ballpark. §I row 18.
**F327.** Wikipedia, quoted exactly: "The Flushing and North Side Railroad opened its Port Washington Branch to
Flushing in 1854, providing access to Hunters Point on the East River shore."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F328.** Wikipedia, quoted exactly: "Flushing is served by several stations on the Long Island Rail Road 's Port
Washington Branch , as well as by the New York City Subway 's IRT Flushing Line ( 7 and < 7 > ​ trains ), which
has its terminus at Main Street ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

### Buses
**F329.** Wikipedia's bus list, quoted exactly and in full: "Q12 : to Little Neck via Northern Boulevard / Q13 :
to Fort Totten via Sanford Avenue and Northern Boulevard / Q15 : to Beechhurst via 41st Avenue and 150th Street /
Q16 : to Fort Totten via Union Street and Bayside Avenue / Q17 : to Jamaica via Kissena Boulevard / Q19 : to
Astoria via Northern Boulevard / Q20 : to Jamaica or College Point via Main Street and Union Street / Q25 : to
Sutphin Boulevard–Archer Avenue–JFK Airport ( E ​ , ​ J , and ​ Z trains ) or College Point via Kissena Boulevard,
Main Street, and Linden Place / Q26 : to Fresh Meadows or College Point via Parsons Boulevard and 46th Avenue /
Q27 : to Cambria Heights via Parsons Boulevard and 46th Avenue / Q28 : to Bay Terrace via Northern Boulevard and
Crocheron Avenue / Q44 SBS : to Jamaica or West Farms, Bronx via Main Street and Union Street / Q50 : to Co-op
City, Bronx via Linden Place and Whitestone Expressway / Q58 and Q98 : to Myrtle–Wyckoff Avenues ( L ​ and M
trains ) via College Point Boulevard / Q61 : to Beechhurst via Linden Place and Willets Point Boulevard / Q65 :
to Sutphin Boulevard–Archer Avenue–JFK Airport ( E ​ , ​ J , and ​ Z trains ) via Bowne Street and 45th Avenue /
Q63 and Q66 : to Queensboro Plaza ( 7 , < 7 > ​ ​ , N and ​ W trains ) via Northern Boulevard / Q90 : to
LaGuardia Airport via Roosevelt Avenue"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** the Q16 runs "via Union Street and **Bayside Avenue**" — again a *street* named Bayside, in
Flushing. §L row 14.
→ **FLAG:** no **Q34** appears here, though the Lewis Latimer House names one in its own directions (F180).
§N row 13.
→ **Two routes reach the Bronx (Q44 SBS to West Farms, Q50 to Co-op City) and one reaches Brooklyn (Q58/Q98 to
Myrtle–Wyckoff).** Notable for a Queens neighborhood.
**F330.** Wikipedia on the Nassau buses, quoted exactly: "The n20G Nassau Inter-County Express (NICE) bus route to
Great Neck, which runs along Sanford Avenue and Northern Boulevard, terminates in Flushing. The n20x NICE bus
route to Roslyn Clock Tower , which follows the n20G route that goes between Flushing and Great Neck, and the n20H
that goes between Great Neck and Hicksville."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **Great Neck is in Nassau County and is therefore outside this corpus** per the brief. The bus is a Flushing
fact; Great Neck is not a Flushing place. §L row 18.

### Roads
**F331.** Wikipedia, quoted exactly: "Major highways that serve the area include the Van Wyck Expressway and
Whitestone Expressway ( Interstate 678 ), Grand Central Parkway , and Long Island Expressway ( Interstate 495 ).
Northern Boulevard (part of New York State Route 25A ) extends from the Queensboro Bridge in Long Island City
through Flushing into Nassau County ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

---

## §N-water — The Flushing River, Flushing Bay, and the waterfront

### P59 — Flushing Creek / Flushing River
**F332.** Wikipedia, quoted exactly: "The Flushing River , also known as Flushing Creek , is a waterway that
flows northward through the borough of Queens in New York City , New York, U.S. It runs mostly within Flushing
Meadows–Corona Park , emptying into the Flushing Bay and the East River . The river runs through a valley that
may have been a larger riverbed before the last Ice Age , and it divides Queens into western and eastern halves."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
→ **"it divides Queens into western and eastern halves"** — a large claim, and it is the geographic reason
Flushing exists where it does.
→ **FLAG: "It runs mostly within Flushing Meadows–Corona Park."** The river is therefore mostly inside the
Jointly Interested Area. Only its lower, non-park reach is arguably a Flushing feature. §I context.
**F333.** Wikipedia on the tributaries, quoted exactly: "Until the 20th century, the Flushing Creek was fed by
three tributaries: Mill Creek and Kissena Creek on the eastern bank, and Horse Brook on the western bank."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
→ **Kissena Creek** links the river to Kissena Park and the nursery ground. Good connective tissue.
**F334.** Wikipedia on the historic boundary function, quoted exactly: "In the 18th and 19th centuries, it
divided the towns of Flushing on its right bank, to the east, and Newtown (now part of Corona ) on its left bank,
to the west."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
→ **The creek was the town line between Flushing and Newtown.** That is why the CitiFieldPlaces holdings carry
both "Flushing" and "Corona" towns — the park straddles a colonial boundary. Recorded as context for the
firewall; it explains it rather than breaching it.
**F335.** Wikipedia on the modern river, quoted exactly: "The modern-day river is 4 miles (6.4 km) long,
originating near the Jamaica Yard in Kew Gardens Hills . The river flows through Willow and Meadow Lakes before
entering a tunnel north of the Long Island Expressway . The Flushing River runs for 2,000 feet (610 m)
underground before resurfacing at the Tidal Gate Bridge at the northern end of Flushing Meadows–Corona Park. The
rest of the river separates the industrial portions of the Willets Point and Flushing neighborhoods before
emptying into the Flushing Bay."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
→ **FLAG, a flat self-contradiction:** the same article's infobox says "Length 2 miles (3.2 km)" while the prose
says "The modern-day river is 4 miles (6.4 km) long". §N row 23. **Do not publish a length.**
→ Note the infobox's other verbatim values: "Tributaries • left Horse Brook • right Kissena Creek , Mill Creek",
"Waterbodies Meadow Lake, Willow Lake", "Bridges 7", "source1 Jamaica Yard", "mouth Flushing Bay".
**F336.** Wikipedia on the cleanup, quoted exactly: "Following accumulations of pollution in the 20th century,
cleanup of the Flushing River started in the 1970s, though some portions of the river have yet to be restored."
Source: https://en.wikipedia.org/wiki/Flushing_River `[AGGREGATOR]`
→ **A real, unglamorous, honest fact about the waterway.** The page should not present the creek as picturesque.

### P60 — Flushing Bay
**F337.** I fetched https://en.wikipedia.org/wiki/Flushing_Bay (16,415 chars) but did not mine it before writing.
**Gap on disk:** `flpages/wiki_flushingbay.txt`
→ Wikipedia's Flushing article mentions the bay only in passing, in the Revolutionary War anecdote (F74):
"Zackary Perrine … was apprehended near Flushing Bay".
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **GAP, and it is a significant one. The brief asks specifically about "the waterfront". I have almost nothing
on Flushing's own waterfront** — the Flushing Bay Promenade, the World's Fair Marina and the Flushing Creek
waterfront redevelopment all sit at or beyond the park boundary, and my attempts at
`nycgovparks.org/parks/flushing-bay-promenade` (404),
`nyc.gov/site/planning/plans/flushing-waterfront/flushing-waterfront.page` (404) and
`en.wikipedia.org/wiki/Flushing_Bay_Promenade` (404) all failed. **The verifier must fill this in, and must
also determine whether any of it is inside the Jointly Interested Area.**

### P61 — Flushing Airport — **NOT a Flushing place**
**F338.** Wikipedia, quoted exactly: "Flushing Airport ( IATA : FLU , ICAO : KFLU , FAA LID : FLU ) was an
airfield in northern Queens in New York City . **It was located in the neighborhood of College Point , near
Flushing .** The airfield operated from 1929 to 1984."
Source: https://en.wikipedia.org/wiki/Flushing_Airport `[AGGREGATOR]` (emphasis mine)
→ **§L row 9. The name says Flushing; the source says College Point.** College Point is wave 6,
`in_scope: false`. **Do not create it as a Flushing place.** Recorded because the name is a trap.
**F339.** Wikipedia, quoted exactly: "Flushing Airport was constructed atop 250 acres (100 ha) of wetlands
beginning in 1927." and "It was originally called Speed's Airport and was one of the busiest airports in New York
City before the emergence of the larger LaGuardia Airport (which opened in 1939)." and "In 1977, a Piper Twin
Comanche crashed shortly after taking off, killing those on board. This incident, as well as frequent flooding,
led to the closing of this airport in 1984."
Source: https://en.wikipedia.org/wiki/Flushing_Airport `[AGGREGATOR]`
**F340.** Wikipedia on what became of it, quoted exactly: "The airport has largely reverted to wetland; its only
outlet is Mill Creek , a tributary of the Flushing River and Flushing Bay ." and "Mayor Eric Adams announced
plans in July 2025 to construct 3,000 apartments on the airport's site, preserving 60 acres (24 ha) as open
space."
Source: https://en.wikipedia.org/wiki/Flushing_Airport `[AGGREGATOR]`
→ Recorded as context for the Flushing River's Mill Creek tributary (F333) and because the 2025 plan is recent
and will need re-checking. **Still a College Point matter.**

---

## §O — Downtown Flushing: malls, towers and redevelopment

**F341.** Wikipedia's list of malls, quoted exactly and in full: "Queens Crossing, at 39th Avenue and 136th
Street, which opened in 2017. / New World Mall , at Roosevelt Avenue east of Main Street / One Fulton Square, at
39th Avenue and Prince Street, which opened in 2014. / The Shops at Skyview Center, at College Point Boulevard
and Roosevelt Avenue, which opened in 2010. The mall also contains a condominium development atop it. / Flushing
Commons, at 39th Avenue and Union Street, which opened its first phase in 2017. This is a multi-phase retail and
housing development project. / Tangram, at 39th Avenue and 133rd Street, which first opened in 2022. It houses a
food hall, children's swim school, and the first 4DX movie theater in Queens."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **Six developments, five of them on 39th Avenue or Roosevelt Avenue within a few blocks:**
**P62 — Queens Crossing** (39th Ave & 136th St, opened 2017) · **P58 — New World Mall** (Roosevelt Ave east of
Main St) · **P63 — One Fulton Square** (39th Ave & Prince St, opened 2014) · **P64 — The Shops at Skyview
Center** (College Point Blvd & Roosevelt Ave, opened 2010, with condominiums above) · **P65 — Flushing
Commons** (39th Ave & Union St, first phase 2017) · **P66 — Tangram** (39th Ave & 133rd St, first opened 2022).
**P67 — the Sheraton LaGuardia East Hotel**, downtown Flushing, is recorded separately at F363.
→ **"the first 4DX movie theater in Queens"** at Tangram is the only distinguishing detail offered for any of
them, and it is uncited. **Verify.**
→ Dedicated Wikipedia articles do not exist for `Sky_View_Parc`, `Flushing_Commons` or `Queens_Crossing` (all
HTTP 404). `shopsatskyview.com` did not resolve; `flushingcommons.com` returned zero bytes. I fetched
`tangramnyc.com` (5,917 chars) but did not mine it. **Gap on disk:** `flpages/tangram.txt`
**F342.** *The Guardian*, quoted via the *Downtown Flushing* reference, exactly: "Tangram Tower, a luxury
mixed-use development built by F & T. Last year, prices for two-bedroom apartments started at $1.15m"
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]` `[QUOTE-VIA]` — original: *The Guardian
US*, January 29, 2021.
→ **"Last year" is undated relative to publication.** Do not publish the price.
**F343.** *The Guardian*, quoted via the same reference, exactly: "The three developers have stressed in public
hearings that they are not outsiders to Flushing, which is 69% Asian. 'They've been here, they live here, they
work here, they've invested here,' said Ross Moskowitz, an attorney for the developers at a different public
hearing in February…"
Source: https://en.wikipedia.org/wiki/Downtown_Flushing `[AGGREGATOR]` `[QUOTE-VIA]`
→ **A quotation inside a quotation inside an encyclopedia footnote. Three removes from the source.** The
verifier must go to the Guardian.

---

## §P — Education, libraries and health

### P68 — Queens Public Library, Flushing branch
**F344.** Wikipedia, quoted exactly: "Flushing contained the first public library in Queens, founded in 1858.
Today, Queens Public Library contains five libraries in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F345.** Wikipedia, quoted exactly: "Flushing, then a small village, established a library in 1858, the oldest
in Queens County and only slightly younger than the library of the City of Brooklyn (built in 1852)."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F346.** Wikipedia on the branch itself, quoted exactly: "The largest of the libraries is the Flushing branch,
located at the intersection of Kissena Boulevard and Main Street in Flushing's central business district. It is
the busiest branch of the Queens Public Library, the highest-circulation system in the United States. This
library has an auditorium for public events. The current building, designed by Polshek Partnership Architects,
is the third to be built on the site—the first was a Carnegie library , built through a gift of Andrew Carnegie ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"the busiest branch of the highest-circulation library system in the United States", a Polshek building, and
a Carnegie library before it, all on one site.** This is a first-rate candidate and it is the kind of place a
reader can actually walk into. **Verify all three claims; all are uncited in the source as retrieved.**
→ `queenslibrary.org/about-us/locations/flushing` and `/locations/flushing` both returned 103 bytes (a redirect
stub). **Gap: no institutional source, no hours, no address beyond "Kissena Boulevard and Main Street".**
**F347.** The other four branches, quoted exactly: "East Flushing – 196 - 36 Northern Boulevard / McGoldrick –
155 - 06 Roosevelt Avenue / Mitchell-Linden – 31 - 32 Union Street / Queensboro Hill – 60 - 05 Main Street" and
"In addition, the Auburndale , Hillcrest , and Pomonok libraries carry Flushing addresses but are not located in
Flushing proper."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **"carry Flushing addresses but are not located in Flushing proper" — the aggregator itself naming the postal
trap.** §L row 18. Note **East Flushing branch at 196-36 Northern Boulevard** — that is deep east, near the CD 11
line, and bears on §L row 2.

### P69 — Queens College — **NOT in Flushing, per Wikipedia itself**
**F348.** Wikipedia, quoted exactly: "Queens College , founded in 1937, is a senior college of the City
University of New York (CUNY), and **is commonly misconstrued to be within Flushing neighborhood limits due to
its Flushing mailing address. It is actually located in the nearby neighborhood of Kew Gardens Hills** on
Kissena Boulevard near the Long Island Expressway ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]` (emphasis mine)
→ **§L row 5. This is the cleanest statement of the Flushing postal-address trap in any source I found, and the
encyclopedia states it against its own interest.** DCP corroborates: `QN0801 | Kew Gardens Hills | KwGrdnsHls |
0 | QN08` — Community District 8. The project roster files Kew Gardens Hills as CD 8, wave 7,
`in_scope: false`. **Queens College is not a Flushing place.** Recorded, not resolved, but the evidence is
one-sided.
**F349.** Wikipedia, quoted exactly: "The City University of New York School of Law was founded in 1983 adjacent
to the Queens College campus, and was located at 65–21 Main Street in Kew Gardens Hills until 2012. It moved to
Long Island City for the Fall 2012 Semester."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Also Kew Gardens Hills, and now Long Island City — which already ships a page. Out of scope both ways.
**F350.** Wikipedia, quoted exactly: "Townsend Harris High School , a selective high school located on the Queens
College campus, was once ranked by U.S. News & World Report as one of the best public high schools in the United
States."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG:** Wikipedia lists Townsend Harris among "The eight public high schools **in Flushing**" while
simultaneously locating it on the Queens College campus, which the same article says is **not** in Flushing
(F348). §N row 24. **A direct self-contradiction.** Recorded, not resolved.

### P70 — The public schools
**F351.** Wikipedia's list of the eight public high schools, quoted exactly: "John Bowne High School /
East-West School of International Studies (grades 6–12) / Robert F. Kennedy Community High School / Townsend
Harris High School … / The Flushing International High School / Flushing High School … / The Queens School of
Inquiry / Queens Academy High School"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F352.** Wikipedia's elementary list — note how many are named for people in this file — quoted exactly: "PS 20
John Bowne / PS 21 Edward Hart / PS 22 Thomas Jefferson / PS 24 Andrew Jackson (grades K-5) / PS 32 State Street
/ PS 107 Thomas A. Dooley / PS 120 / PS 163 Flushing Heights / PS 214 Cadwallader Colden / PS 242 Leonard P
Stavisky Early Childhood School (grades PK-3) / PS 244 The Active Learning Elementary School (grades PK-3)"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **PS 20 is named John Bowne; PS 21 is named Edward Hart — the Remonstrance's town clerk (F60); PS 214 is named
Cadwallader Colden.** The 1657 petition is written into the school roll. A quiet, verifiable, excellent detail.
**F353.** Wikipedia's middle schools, quoted exactly: "IS 25 Adrien Block / JHS 185 Edward Bleeker / JHS 189
Daniel Carter Beard / IS 237 Rachel Carson / East-West School of International Studies (grades 6–12). Located in
the same building as I.S. 237"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **JHS 189 Daniel Carter Beard** — see F249. **IS 237 Rachel Carson** — see the Rachel Carson Playground in
Kissena Corridor Park (F236).
**F354.** Wikipedia on private schools, quoted exactly: "The private high schools include: Archbishop Molloy
High School / Holy Cross High School"
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG: Archbishop Molloy High School is in Briarwood/Jamaica Estates, not Flushing.** I did not fetch a
source to confirm this and am flagging it as a suspicion, marked `[PARAPHRASE]` — the verifier must check.
§L row 11.
**F355.** Wikipedia on educational attainment, quoted exactly: "While 37% of residents age 25 and older have a
college education or higher, 23% have less than a high school education and 40% are high school graduates or have
some college education. By contrast, 39% of Queens residents and 43% of city residents have a college education
or higher." and "Additionally, 86% of high school students in Flushing and Whitestone graduate on time, more than
the citywide average of 75%."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note these are **"Flushing and Whitestone"** figures, not Flushing figures. The health and education statistics
throughout the Wikipedia article are keyed to a NYC Health Community Health Profile covering the whole of CB7.
**Do not attribute them to Flushing alone.**

### P71 — NewYork–Presbyterian/Queens and Flushing Hospital Medical Center
**F356.** Wikipedia, quoted exactly: "The nearest major hospitals are NewYork–Presbyterian/Queens and Flushing
Hospital Medical Center . NewYork–Presbyterian/Queens serves Flushing as well as surrounding communities with
comprehensive medical care services."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Wikipedia elsewhere places NewYork–Presbyterian/Queens in **Queensboro Hill** (F44). I fetched
`wiki_nyp_queens.txt` (27,647 chars) and `wiki_flushinghospital.txt` (11,624 chars) but mined neither. **Gap on
disk.** Note Fran Drescher "was born in Flushing Hospital" per F362.

---

## §Q — People

**F357.** Wikipedia's economics figures, quoted exactly: "Median income $39,804" (infobox, 2010) and "As of 2017,
the median household income in Community Board 7 was $51,284." and "In 2018, an estimated 25% of Flushing and
Whitestone residents lived in poverty, compared to 19% in all of Queens and 20% in all of New York City." and
"Rent burden, or the percentage of residents who have difficulty paying their rent, is 57% in Flushing and
Whitestone, higher than the boroughwide and citywide rates of 53% and 51% respectively."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **FLAG on a sentence that reads oddly:** the same paragraph concludes, quoted exactly: "Based on this
calculation, as of 2018 , Flushing and Whitestone are considered to be high-income relative to the rest of the
city and not gentrifying ." **A 25% poverty rate and a 57% rent burden described as "high-income … and not
gentrifying"** — and elsewhere the same article says Flushing "is undergoing rapid gentrification" (F299).
§N row 25. **Direct self-contradiction. Do not publish either half without the verifier.**
**F358.** Wikipedia on political representation, quoted exactly: "Taiwan -born John Liu , former New York City
Council member representing District 20, which includes Flushing and other northern Queens neighborhoods, was
elected New York City Comptroller in November 2009. In 2018, Liu defeated incumbent Tony Avella to become the
first of two Asian Americans in the New York State Senate ."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F359.** Wikipedia, quoted exactly: "At the same time, Shanghai -born Peter Koo was elected to succeed Liu to
assume this council membership seat. Additionally, in 2012 Flushing resident Grace Meng , a State Assembly
Member , was elected to Congress as the first Asian-American member of the United States House of
Representatives from the eastern United States."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **Peter Koo, John Liu, Tony Avella, Grace Meng and Toby Ann Stavisky all appear independently in the LPC
Bowne Street Community Church designation report (F213, F214) and the Voelker Orth report (F201)** — primary
corroboration that these are the neighborhood's actual elected officials. That is a genuinely useful
cross-check.
→ NYC Parks gives the current City Council members for Flushing parks as **Sandra Ung** (Kissena Park, Bland
Playground, Olde Towne Burial Ground) and **Vickie Paladino** (Bowne Park, Flushing Fields).
Sources: the NYC Parks pages cited throughout §G and §H.
**F360.** Wikipedia's notable people with Flushing anchors, each quoted from the article's own citation text:
- **Joseph Cornell**, artist (1903–1972) — *The New York Times*, quoted via Wikipedia: "he lived on sweets,
  worshiped forgotten divas and made portable shrines to them — his version of spiritual art — in the basement
  of the small house he shared with his mother and disabled brother in Flushing, Queens." `[QUOTE-VIA]`
- **Fran Drescher** (b. 1957) — *TimesLedger*, quoted via Wikipedia: "the former Queens girl talked about
  growing up in Flushing" `[QUOTE-VIA]`
- **Godfrey Cambridge** (1933–1976) — *Toledo Blade*, quoted via Wikipedia: "grew up in Flushing, Long Island."
  `[QUOTE-VIA]`
- **Action Bronson** (b. 1983) — *GQ*, quoted via Wikipedia: "we asked Bronson, a Flushing native, to take us on
  a food tour of his home city." `[QUOTE-VIA]`
- **Judd Apatow** (b. 1967) — IFC, quoted via Wikipedia: "1967:Born in Flushing, New York" `[QUOTE-VIA]`
- **Thomas Duane** (b. 1955), "first openly gay member of the New York State Senate" — *The New York Times*,
  quoted via Wikipedia: "a native New Yorker who grew up in Flushing, Queens" `[QUOTE-VIA]`
- **Margaret I. Carman** (1890–1976) — see F106.
- **James A. Bland** (1854–1911) — see F242–F245.
- **Daniel Carter Beard** (1850–1941) — see F249.
- **Cadwallader Colden** (1688–1776) — see F72–F73.
- **Arthur Blank** (b. 1942), "co-founder of The Home Depot and the owner of the Atlanta Falcons and Atlanta
  United" — no citation in the source as retrieved.
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **Every one of these is `[QUOTE-VIA]` — a quotation inside an encyclopedia footnote. The verifier must go to
each original.** Several entries in the same list carry `{{citation needed}}` in the source, including Jimmy
Durante and Black Sheep; I have excluded those.
**F361.** Wikipedia's in-popular-culture entries, the two most checkable, quoted exactly: "The first series of
Charmin toilet paper commercials featuring Mr. Whipple ( Dick Wilson ) were filmed in Flushing at the Trade Rite
(now H-Mart) supermarket on Bowne Street and Roosevelt Avenue." and "The rock band Kiss first played at the
Coventry Club on Queens Boulevard in 1973, and is said to have derived its name from Kissena Boulevard in
Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the hedge "**is said to have**" on the Kiss claim. **Both are uncited. The Charmin one names a specific,
still-standing corner (Bowne Street and Roosevelt Avenue, now an H-Mart) and is therefore checkable and charming
if it holds.**
**F362.** Wikipedia, quoted exactly: "Fran Drescher 's character Fran Fine on the TV show The Nanny , was said to
have been raised in Flushing, where her family still lived. Drescher was born in Flushing Hospital."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
**F363.** Wikipedia, quoted exactly: "The eponymous celebration in Taiwanese director Ang Lee 's 1993 comedy hit
The Wedding Banquet takes place in Downtown Flushing's Sheraton LaGuardia East Hotel."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **A named, still-extant hotel in downtown Flushing used as a location in a major film about a Taiwanese
family** — which is exactly the community that founded the Chinatown (F287–F289). Uncited. **Verify; if it holds
it is one of the best items in the file.**
**F364.** Wikipedia, quoted exactly: "The 2014 novel Preparation for the Next Life by Atticus Lish takes place
largely in Flushing and surrounding neighborhoods. The novel depicts the unlikely romance between an Iraq War
veteran and a Uighur immigrant."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ Note the resonance with F292's "Uyghur cuisine" and F302's Xinjiang migration.
**F365.** Wikipedia, quoted exactly: "F. Scott Fitzgerald 's The Great Gatsby alludes to Flushing: "About half
way between West Egg ( Great Neck ) and New York, the motor road hastily joins the railroad and runs beside it
for a quarter of a mile.""
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]` `[QUOTE-VIA]`
→ **FLAG:** the quoted Gatsby sentence does not contain the word "Flushing". The claim that it "alludes to
Flushing" is the encyclopedia's interpretation, not Fitzgerald's statement. The valley of ashes is conventionally
identified with the **Corona** ash dumps that became Flushing Meadows. **This is an inference, presented as an
allusion. Do not publish it as a fact about Flushing.** §N row 26.
**F366.** Wikipedia, quoted exactly: "Flushing was the location of the Stark Industries (later Stark
International) munitions plant in Marvel Comics ' original Iron Man series. In the movie Iron Man 2 , the Stark
Expo is located in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`
→ **The Iron Man 2 Stark Expo was filmed at and set in Flushing Meadows–Corona Park (the Unisphere and the New
York State Pavilion appear in it).** That places the claim behind the firewall. **Do not use it.** `[PARAPHRASE]`
— my identification, unsourced here; the verifier should not rely on it either, and the safe move is omission.
**F367.** Wikipedia, quoted exactly: "On the Norman Lear -produced TV show All in the Family , in the episode
when Edith Bunker was arrested for shoplifting , she mentions the names of a few long-gone stores that were in
downtown Flushing. The Bunkers also mention having lived on Union Street in Flushing."
Source: https://en.wikipedia.org/wiki/Flushing,_Queens `[AGGREGATOR]`

---

## §L — CONTESTED NEIGHBOURHOOD ASSIGNMENTS

Every row is a place or entity that **at least one source assigns somewhere other than Flushing**, or that a
Flushing source claims but another authority places elsewhere. **I do not resolve any of them.** Rows 4, 14, 16,
17 and 18 are the ones that touch Bayside or Douglaston and they are marked ⚠.

| # | Place / entity | Flushing claim | Competing assignment | Sources |
|---|---|---|---|---|
| 1 | **Murray Hill (Queens)**, incl. the Meokjagolmok / Korean Restaurant Street and Murray Hill LIRR station | Wikipedia: "Murray Hill within Flushing" | DCP: its own NTA `QN0704 Murray Hill-Broadway Flushing`; roster: separate slug, `in_scope: false` | F8, F11, F37, F307 |
| 2 | **East Flushing** (incl. QPL East Flushing branch, 196-36 Northern Blvd) | Wikipedia: "technically within Greater Flushing" | **DCP: `QN0705`, CD 7. Project roster: CD 11, wave 8.** The roster and the City disagree. | F8, F10, F313, F347 |
| 3 | **The World Journal** (newspaper HQ) | Named in Flushing's Chinatown section | Wikipedia itself: "headquartered in adjacent **Whitestone**" | F297 |
| 4 | ⚠ **The Long Island Koreatown** east of Union Street | "originated in Flushing" | Spreads to Murray Hill, Auburndale, **Bayside**, **Douglaston**, Little Neck, Nassau County | F304, F305 |
| 5 | **Queens College**, CUNY School of Law site, Townsend Harris HS | Flushing mailing address; listed among Flushing's high schools | Wikipedia: "It is actually located in the nearby neighborhood of **Kew Gardens Hills**"; DCP: `QN0801`, CD 8 | F48, F348, F349, F350 |
| 6 | **Pomonok, Electchester** | Wikipedia: "a neighborhood in South Flushing" | Wikipedia and DCP and the roster: **Community District 8** | F45–F47 |
| 7 | **Mount Hebron Cemetery** (Cadwallader Colden's Spring Hill estate site) | Linked to Flushing via Colden | DCP: `QN0871`, **CD 8** | F73, F266 |
| 8 | **Kissena Park** | DCP NTA `QN0791` is in CD 7; Wikipedia lists it under Flushing | **NYC Parks gives its ZIP as 11365** — a Fresh Meadows ZIP, not one of Flushing's three | F13, F229 |
| 9 | **Flushing Airport**; **Frank Golden Park** | Both carry "Flushing"/CB7 associations | Wikipedia: airport "located in the neighborhood of **College Point**"; Parks: Golden Park ZIPs 11356/11357, narrative entirely College Point | F250, F338 |
| 10 | **Louis Armstrong** | Buried in Flushing Cemetery | Resident of **Corona**; his house museum is there | F264 |
| 11 | **1964-65 World's Fair Carousel**; **Archbishop Molloy High School** | NRHP city field says "Flushing"; Wikipedia lists Molloy under Flushing private schools | Carousel address `54th & 56th Aves. on 111th St.` is Corona ground; Molloy is believed to be Briarwood/Jamaica Estates `[PARAPHRASE]` | F267, F354 |
| 12 | **Linden Hill** | A Flushing subsection | Wikipedia disambiguates from **Linden Hill, Ridgewood** — Ridgewood already ships a page | F35 |
| 13 | **Moore-Jackson Cemetery** | Interpreted by the Queens Historical Society, a Flushing institution | The cemetery is in **Woodside**, which already ships a page | F145 |
| 14 | ⚠ **Fitzgerald/Ginsberg Mansion**, 145-15 **Bayside Avenue**; and the **Q16 bus** "via Union Street and Bayside Avenue" | LPC NTA `QN0704`; GeoSearch `Flushing` | The street name reads as "Bayside" and will mislead a skimmer. **Bayside Avenue is in Flushing; Bayside is not.** | F203, F329 |
| 15 | **The Queens Jazz Trail** | Mapped and published by Flushing Town Hall | The trail almost certainly runs to Corona and Addisleigh Park too `[PARAPHRASE]` | F163 |
| 16 | ⚠ **The Bayside Historical Society** | Its president wrote in support of a Flushing landmark designation | It is a **Bayside** institution. A letter at a hearing is not a place. | F214 |
| 17 | ⚠ **"The Bayside Quakers"** plot, Section I, Flushing Cemetery | Half an acre inside a Flushing cemetery, c. 1860 | The people were **Bayside** Quakers. Sourced to a 1967 newspaper column. | F263 |
| 18 | ⚠ **The 113- ZIP sectional centre**; the **n20G NICE bus to Great Neck**; the Auburndale, Hillcrest and Pomonok library branches | All administered from or terminating in Flushing | The 113 area "extends … east to **Bayside** and **Little Neck**"; Great Neck is **Nassau County** and outside this corpus; the three branches "carry Flushing addresses but are not located in Flushing proper" | F24, F330, F347 |
| 19 | ⚠ **The historic TOWN of Flushing (1683–1898)** | Ran "from Hempstead on the east by what later became the **Nassau County line**" | **The historic town contained the ground that is now Bayside and Douglaston. The modern neighborhood does not.** This is the single largest risk of manufacturing a false tie. | F70, F71 |

---

## §M — ADDRESS AND IDENTITY DISCREPANCIES

| # | Place | Readings found | Note |
|---|---|---|---|
| 1 | **Bowne House** | Address agrees across four sources (`37-01 Bowne Street`); QHS gives a fifth form "Bowne Street and 38th Avenue". **Ownership** conflicts: LPC 1966 "owned and operated … by the Bowne House Historical Society" vs PLUTO `NYC DEPARTMENT OF PARKS AND RECREATION`. **Date:** LPC "1661" and PLUTO `1661` vs the Society's own "circa 1661". | F107, F111, F113, F118 |
| 2 | **Quaker Meeting House** | Three names: `Friends Meeting House` (LPC), `Old Quaker Meetinghouse` (NRHP), `Old Quaker Meeting House` (Wikipedia). Address `137-16 Northern Boulevard` vs NRHP's vaguer `S side of Northern Blvd.` | F98, F120, F129 |
| 3 | **Kingsland Homestead** | Four addresses: `143-35 37th Avenue` (LPC amendment + PLUTO + QHS), `40-25 155 STREET` (LPC original, `LP-00005`), `37th St. and Parsons Blvd.` (NRHP). **The house was moved in 1968.** Build date: "between 1774 and 1785" (QHS) vs `1785` (PLUTO) vs "The 1785 Kingsland Homestead" (Wikipedia). Ownership: QHS "owned and operated by the historical society" vs PLUTO NYC Parks. | F95, F97, F98, F131, F138, F139 |
| 4 | **Lewis H. Latimer House** | `34-41 137th Street` (LPC report, LPC `buis`, the museum's own site) vs `138-10 32 AVENUE` (LPC `ncre`, PLUTO). **The house was moved in 1988.** PLUTO's `yearbuilt: 1990` and `lotarea: 325000` describe the parkland lot, **not** the c.1887–89 house. | F95, F97, F164, F169 |
| 5 | **St. George's Church** | `38-02 Main Street` (LPC `buis`), `135-33 39 AVENUE` (LPC `ncre`, PLUTO), `135-32 38th Ave.` (NRHP). **LPC's own report gives the aka: "38-02 Main Street(aka 135-33 39th Avenue)", which resolves two of the three.** PLUTO `yearbuilt: 1907` is the Old Parish House, not the 1853–54 church. | F95, F97, F98, F182 |
| 6 | **RKO Keith's** | Five: `135-29 - 135-45 Northern Boulevard` (LPC report), `35-28 FARRINGTON STREET` (LPC `ncre`), `129-143 Northern Boulevard` (NRHP), `135-27 NORTHERN BOULEVARD` (PLUTO), "Main Street and Northern Boulevard" (LPC prose). Build year `1927-28` (LPC) vs `1929` (PLUTO). **Worst tangle in the file.** | F96, F190, F193 |
| 7 | **Voelker Orth Museum** | Surname `Voelker` (LPC, museum) vs `Voelcker` (NRHP, `Conrad Voelcker House`). Build year `c.1891` (LPC) vs `1920` (PLUTO). Address agrees: `149-19 38th Avenue`. | F95, F98, F196 |
| 8 | **Flushing High School** | `35-01 Union Street` (LPC `buis`, LPC report, NRHP, PLUTO) vs `35-01 NORTH BOULEVARD` (LPC `ncre`). Four to one; `ncre` is the outlier. | F95, F97, F98, F204 |
| 9 | **Bowne Street Community Church** | `143-11 (143-19) Roosevelt Avenue` (LPC `buis`) vs `38-01 BOWNE STREET` (LPC `ncre`). **LPC's own report header gives both — "143-11 Roosevelt Avenue (38-01 Bowne Street)" — resolving it.** | F95, F97, F211 |
| 10 | **US Post Office–Flushing Main** | `4165 Main St.` (NRHP, de-hyphenated, footnoted to the USPS website accessed 2016) vs `41–65 Main Street` (Wikipedia). Same building. | F24, F98, F219 |
| 11 | **Bland Houses vs Flushing Houses** | NYC Parks calls the adjacent NYCHA development "the Flushing Houses"; Wikipedia has an article titled "Bland Houses". **May be one development under two names, or two developments.** | F241, F246 |
| 12 | **Ganesh Temple** | `45-57 Bowne Street` (temple's own, Wikipedia, DOHMH) vs `45-50 SMART STREET` (PLUTO). | F272, F276, F278 |
| 13 | **Free Synagogue of Flushing** | `41-60 Kissena Blvd.` (NRHP, Wikipedia) vs `136-23 SANFORD AVENUE` (PLUTO). Wikipedia's "near Sanford Avenue" reconciles them: a corner building. PLUTO spells the owner `FREE SYNAGOUGUE OF FLUSHING`. | F279 |

**Full GeoSearch results** (all fifteen returned `"neighbourhood": "Flushing"`, `"borough": "Queens"`):
`43-50 Main Street` (11355, BBL 4051070200) · `37-01 Bowne Street` (11354, 4050130006) ·
`137-16 Northern Boulevard` (11354, 4049770026) · `137-35 Northern Boulevard` (11354, 4049600001) ·
`143-35 37th Avenue` (11354, 4050120060) · `34-41 137th Street` (11354, 4049530001) ·
`149-19 38th Avenue` (11354, 4050170031) · `45-57 Bowne Street` (11355, 4052030037) ·
`41-60 Kissena Boulevard` (11355, 4050430050) · `35-01 Union Street` (11354, 4050020001) ·
`163-06 46th Avenue` (11358, 4054620001) · `135-29 Northern Boulevard` (11354, 4049580038) ·
`38-02 Main Street` (11354, 4049750001) · `145-15 Bayside Avenue` (11354, 4047860064) ·
`137-58 Northern Boulevard` (11354, 4049770039)
Source: https://geosearch.planninglabs.nyc/v2/search

---

## §N — SOURCES THAT CONTRADICT THEMSELVES OR EACH OTHER

| # | Subject | The conflict | Refs |
|---|---|---|---|
| 1 | Indigenous people | Wikipedia: "Lenape Indians". NYC Parks: "the Matinecock, a tribe of the Lenape". QBG: "the Matinecock people, the first people of Flushing". Latimer House: "Munsee Lenape and Matinecock peoples". | F49–F52 |
| 2 | **Founding date** | **October 10, 1645** (Wikipedia) vs **October 19, 1645** (LPC LP-2053). | F53, F54 |
| 3 | Main St / Roosevelt Ave intersection | "the third-busiest in New York City, behind Times Square and Herald Square" vs "one of the world's busiest pedestrian intersections" vs "the third-busiest pedestrian intersection in New York City". | F15, F282–F284 |
| 4 | Southern boundary of the historic town | "from Jamaica on the south by the **watershed**" vs "by the **'hills'—that is, the terminal moraine left by the last glacier**". | F70, F71 |
| 5 | Broadway–Flushing HD boundary | Two Wikipedia pages give two boundary strings for NRHP `06000373`. | F29, F30 |
| 6 | Broadway–Flushing ethnicity | 78% + 2% + 8% + 28% + 0.7% = **116.7%**. Impossible as stated. | F31 |
| 7 | Original towns of Queens County | LPC: "**three** colonial settlements" (Flushing, Newtown, Jamaica). Wikipedia: "one of the original **five** towns". | F69, F78 |
| 8 | Roosevelt Avenue Bridge | "the largest trunnion bascule bridge in the world" vs "the largest **fixed** trunnion bascule type in the world" — in the same article. | F82, F83 |
| 9 | **Nursery dates** | Prince nursery **1735** (NYC Parks) vs "possibly as early as **1737**" (LPC). Parsons nursery "by the early **1870s**" (NYC Parks) vs "**1839**" (LPC). LPC adds a Huguenot origin NYC Parks omits. | F86–F88 |
| 10 | Oldest house of worship | QHS/Parks call the **Bowne House** "perhaps the oldest existing house of worship in America". LPC calls the **Meeting House** "the oldest house of worship standing in New York City". | F118, F123 |
| 11 | **Weeping Beech planting date** | LPC header: **"1647"**. QHS/Parks: **"from 1847 to 1998"**. Almost certainly an OCR or typesetting error for 1847. **Do not publish 1647.** | F146, F149 |
| 12 | Weeping Beech / Samuel Parsons | Spread "almost eighty-five feet" and "about eighty-five feet" (LPC) vs "eighty feet in diameter" (Parks). Parsons died **1906** (Parks, Kissena) vs **1907** (Parks via QHS, Weeping Beech). | F87, F147–F150 |
| 13 | The Q34 bus | The Lewis Latimer House gives directions "take the Q25 bus … or **Q34** bus"; Wikipedia's Flushing bus list has no Q34. | F180, F329 |
| 14 | **Flushing High School superlative** | "the oldest public secondary school institution **in New York**" (LPC) vs "the **first free** public high school **in what is now New York City**" (Wikipedia) vs "the oldest free public high school (1875) in what is now New York City". Three different scopes. | F205–F207 |
| 15 | Flushing Fields acreage | **10 acres** (Wikipedia) vs **7.67** (NYC Parks sidebar). | F210 |
| 16 | Bowne Street Community Church designation | The same LPC report records the church **in favour** at the 2015 backlog hearing and **against** at the 2016 hearing. (Probably a genuine change of position, not an error — but it must be written as a sequence.) | F213, F214 |
| 17 | Flushing Armory build date | "built in **1905–1906**" (prose) vs "Built **1906**" (infobox) vs `yearbuilt: 1900` (PLUTO). | F215, F218 |
| 18 | Queens Botanical Garden | Moved to Main Street in **1961** (QBG's own site) vs **1963** (Wikipedia). Acreage **39** (both) vs PLUTO's `lotarea: 1463449` sq ft ≈ **33.6 acres**. And QBG says it is both "at the northeast corner of Flushing Meadows-Corona Park" **and** "on Main Street in Flushing". | F221, F224, F225 |
| 19 | Park acreages | Kissena Park **234** (Wikipedia) vs **237.15** (Parks). Bowne Park **11** (Wikipedia) vs **11.79** (Parks). Prefer Parks. | F229, F240 |
| 20 | Flushing Cemetery acreage | "over **75** countryside acres" (cemetery's own) vs PLUTO `lotarea: 1845000` sq ft ≈ **42.4 acres** on the queried lot vs 20 + 50 = **70** acres implied by the founding narrative. | F259, F261, F262 |
| 21 | Chinatown romanisation | Jyutping `Faat3laa1sing4 Waa4 **Bou6**` vs `Faat3laa1sing4 Waa4 **fau6**`; Hokkien POJ `Niú-iok Hôa-bú` vs `Hoat-la-sēng Hôa-po͘`. Two Wikipedia articles, same characters. | F285 |
| 22 | Direction of Nassau County | "following Northern Blvd. **west** into Nassau County." Nassau is **east**. The source's compass is wrong. | F315 |
| 23 | **Flushing River length** | Infobox "Length **2 miles** (3.2 km)" vs prose "The modern-day river is **4 miles** (6.4 km) long" — same article. | F335 |
| 24 | Townsend Harris High School | Listed among "The eight public high schools **in Flushing**" while the same article says the Queens College campus it sits on is **not** in Flushing. | F348, F350 |
| 25 | Gentrification | "Flushing is undergoing **rapid gentrification** by Chinese transnational entities" vs "Flushing and Whitestone are considered to be high-income relative to the rest of the city and **not gentrifying**" — same article. Alongside a 25% poverty rate and a 57% rent burden. | F299, F357 |
| 26 | *The Great Gatsby* | The quoted sentence contains no reference to Flushing. "alludes to Flushing" is the encyclopedia's inference. | F365 |
| 27 | Which is NYC's largest Chinatown | The Flushing article cites a 2011 *Daily News* piece ranking Flushing **second** behind Brooklyn. The Downtown Flushing article says Flushing "ranks as New York City's **largest** Chinese community with 33,526 Chinese" **and in the same paragraph** gives Brooklyn 34,218 — a larger number. | F283, and https://en.wikipedia.org/wiki/Downtown_Flushing |

---

## §R — EXPLICIT GAPS: what a verifier or a second finder must still get

1. **The waterfront.** Flushing Bay, the Flushing Bay Promenade, the World's Fair Marina and the Flushing Creek
   waterfront rezoning. Four URLs tried, all 404 or unmined. **The brief asked for this specifically and I do
   not have it.** Determine also how much of it is inside the Jointly Interested Area.
2. **The RKO Keith's present condition.** LPC's "continues to serve Flushing as a movie theater" is from 1984.
   What is there now?
3. **Michelin / James Beard / any third-party culinary recognition.** Both hosts defeated my retrieval. Without
   this, Flushing's food reputation rests on one uncited aggregator sentence.
4. **The Golden Shopping Mall** and the food-court scene generally. Absent from every source I reached.
5. **The Lunar New Year Parade** — organiser, route, date.
6. **Congregational sources.** St. George's, the Free Synagogue, the Unitarian Universalist Congregation of
   Queens, the Muslim Center of New York, the Sikh Center, St. Andrew Avellino, Bowne Street Community Church:
   seven domains that failed to resolve or returned empty.
7. **Flushing Town Hall's own about/history/visitor pages** — all resolved to the site's 404. The Smithsonian
   affiliation claim (F160) is unconfirmed.
8. **Queens Public Library Flushing branch** — no institutional source, no address beyond a corner.
9. **NYC Parks pages that returned empty bodies:** Margaret I. Carman Green–Weeping Beech Park (the tree's own
   park), and the Kissena Corridor Park narratives.
10. **Files fetched but not mined, on disk at**
    `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/flpages/`:
    `lp_fitzgerald_2160.txt` (48k), `lp_kingsland_0005.txt` (12k), `wiki_mainstsubwaynrhp.txt` (66k),
    `wiki_freesyn.txt` (36k), `wiki_flushingbay.txt` (16k), `wiki_newworldmall.txt` (16k), `tangram.txt`,
    `wiki_nyp_queens.txt` (28k), `wiki_flushinghospital.txt` (12k), `wiki_bland.txt`, `wiki_kissenavelodrome.txt`,
    `wiki_worldsfairmarina.txt`, `wiki_matinecock.txt`, `wiki_johnbowne.txt`, `wiki_lewishoward.txt`,
    `parks_murrayhill_pg.txt`, `parks_dcbeard.txt`, `wiki_broadway_flushing.txt`, `wiki_murrayhill_q.txt`,
    `wiki_queensnightmarket.txt`, `wiki_flushingline.txt`, `wiki_portwashington.txt`, `wiki_q44.txt`.
    **These are already downloaded. A second pass costs no network.**
11. **The Flushing Remonstrance primary text.** The New York State Archives holds the original. Everything I have
    is `[QUOTE-VIA]` Wikipedia.
12. **"Carry Me Back to Old Virginny" was retired as Virginia's state song in 1997** — believed, unsourced here,
    and NYC Parks omits it. If the page mentions Bland's song it should not stop at 1940.
13. **The Freedom Mile / Freedom Trail / Heritage Trail** — three names, no working QHS page. Establish what it
    is currently called and what is on it.

---

## §S — WHAT I THINK THE RICHEST VEINS ARE (a finder's note, not a verdict)

Offered as orientation only. The verifier adjudicates; the writer chooses.

1. **The three-century walk NYC Parks itself describes (F152):** Bowne House (1661) → Old Quaker Meeting House
   (1694) → Kingsland Homestead (1774–85) → the Weeping Beech site → Flushing Town Hall (1862) → St. George's
   (1853–54). Six landmarks, all within a few blocks of the 7 terminal, all primary-sourced, all with LPC reports
   I have already pulled.
2. **The nursery era and its physical survivals:** the Parsons tree grove in Kissena Park, the alphabetical
   plant-named avenues from Ash to Rose, the Queens Botanical Garden's two 1939 blue atlas cedars, and the fact
   that Central Park's trees came from here.
3. **The Olde Towne of Flushing Burial Ground** — a paupers' cemetery mostly of African American and Native
   American burials, more than half of them children under five, built over as a playground in the 1930s,
   recovered by one named activist, memorialised in 2021 with 320 names and cardinal directions in Matinecock.
4. **The Remonstrance and its afterlife** — including the scholarly dissent (F64), the fact that none of the
   signers were Quakers (F60), and that the site is now a police facility (F60–F61, F217).
5. **The Chinatown and the Koreatown as a bounded, walkable geography** — Main Street between Kissena and
   Roosevelt (F284); Union Street between 35th and 41st (F306); and the causal account of why each is where it
   is (F289, F307).
6. **Lewis H. Latimer** — a Black inventor who died in Flushing, whose house was saved by being moved across the
   street from a housing project named after him, and whose museum is careful about what he did and did not
   invent.
7. **The jazz burials at Flushing Cemetery** — Armstrong, Gillespie, Hodges, Shavers, Scott — tied to Flushing
   Town Hall's jazz programming. Needs individual verification.
8. **Agnes Fairchild Northrop's Tiffany windows** at the Bowne Street Community Church, designed by a member of
   the congregation.
9. **Samuel Seabury**, first bishop of the Episcopal Church in America, leading the St. George's congregation in
   1761.
10. **The Flushing–Main Street station** — a National Register property, the eastern terminus of the 7, and
    1.2–1.3 million riders a month on primary MTA data.

---

*End of finder file. Nothing above is verified. 367 candidate facts (F1–F367, contiguous), 71 candidate places
(P1–P71), 19 contested neighbourhood assignments, 13 address/identity discrepancies, 27 self-contradictions or
cross-source conflicts, 13 explicit gaps. No verdicts have been recorded and nothing has been adjudicated.*
