# Ocean Beach, San Francisco — VERDICTS

Verifier adjudication of `docs/san-francisco/ocean-beach-finder.md`. Adjudicated 2026-09-03.
63 candidates ruled. **PUBLISH 8 · REWRITE 14 · DROP 41.**
**TIER: TOWN PAGE.** Five uncontested places survive; six counting one straddler.

---

## 0. WHAT I RE-FETCHED

Bash was intermittently unavailable; every fetch below was made twice — once through `python3 +
urllib`, once through an independent fetch — and both agreed unless noted.

**Ownership.** `.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only. The finder is
right about this and right to have used `vf_taken_all.py` instead. I re-ran the corpus-wide scan
with 45 needles covering every candidate in the file: **4,389 places across 349 files**, and **no
Ocean Beach candidate is owned.** The only hits are the four the finder already named
(`ocean-beach-park-new-london`, `cliffs-variety-castro`, `castro-camera-harvey-milk-residence`) plus
three harmless name fragments in other cities (`east-river-waterfront-esplanade-pier-35`,
`millwrights-restaurant` in Simsbury, `shipwreck-tavern` in Killingworth). I also counted the twelve
shipped San Francisco files place by place: **468**, matching the brief exactly.

**Boundary layers.** `j2bu-swwd` returns **41** rows, `gfpk-269f` returns **117**. Neither contains a
unit named "Ocean Beach". `gfpk-269f` does carry **"Sutro Heights"** and **"Lincoln Park / Ft.
Miley"**; `j2bu-swwd` carries neither and has **"Lincoln Park"** and **"Lakeshore"**. The finder's §1
is confirmed on its own terms.

I also found a **second, stronger confirmation the finder missed**: the Rec & Park property register
`gtr9-ntp6` carries its own `analysis_neighborhood` and `mons_neighborhood` fields, and they
reproduce the disagreement without any point-in-polygon work at all. Balboa Natural Area (property
174) is `analysis_neighborhood: "Outer Richmond"` and `mons_neighborhood: "Sutro Heights"`. Sunset
Dunes (163) is `"Sunset/Parkside"` against `"Outer Sunset, Parkside"`. Lincoln Park (103) is
`"Lincoln Park, Outer Richmond, Seacliff"` against `"Lincoln Park / Ft. Miley, Outer Richmond"`. The
city ships the ambiguity in the dataset. A later pass should use these fields rather than rerunning
ray casts.

---

## 1. THE DESIGNATION NUMBERS — EVERY ONE RE-FETCHED

### 1.1 SURVIVED — National Register, points layer 0

| Ref | RESNAME as the register writes it | CertDate | Address on the record |
|---|---|---|---|
| **01000522** | Camera Obscura | 05/23/2001 | 1096 Point Lobos Ave. |
| **81000172** | Beach Chalet | 07/22/1981 | 1000 Great Hwy. |
| **83001232** | Moss Flats Building | 02/24/1983 | 1626 Great Hwy. |
| **79000529** | Fleishhacker, Delia, Memorial Building | 12/31/1979 | Zoo Rd. and Sloat Blvd. |

### 1.2 SURVIVED — National Register, polygon layer 1

| Ref | RESNAME | CertDate | Address |
|---|---|---|---|
| **04001137** | Golden Gate Park | 10/15/2004 | Bounded by Fulton St., Stanyan St., Fell St., Baker St., Oak St., Lincoln Way and The Great Highway |
| **05001112** | Veterans Affairs Medical Center--San Francisco, California | 04/20/2009 | 4150 Clement St. |
| **80000371** | Fort Miley Military Reservation | 05/23/1980 | Off CA 1 |

Every date matches the finder's table character for character. No wrong certification date this time.

### 1.3 SURVIVED — San Francisco Article 10, `97yj-54sx`

Queried by `$where landmarkno in (...)`, all six returned:

| No. | `name` | `yeardesignated` | `address` | `apn` |
|---|---|---|---|---|
| **147** | Dutch Windmill (North Windmill) | 1981.0 | Golden Gate Park | 1700001 |
| **179** | Beach Chalet | 1985.0 | 1000 Great Highway | 1700001 |
| **210** | Murphy Windmill and Millwright's Cottage | 2000 | M.L. King Drive & Golden Gate Park | 1700001 |
| **254** | Doggie Diner Sign | 2006.0 | Sloat Blvd | *null* |
| **304** | Mother's Building | 2022.0 | 1 Zoo Road | 7281006 |
| **306** | City Cemetery | 2022.0 | 90-100 34TH AV | 1313029 |

All six exact. Note `254` has a **null APN**, which the finder did not record and which a drafter
should not mistake for a missing landmark.

### 1.4 DID NOT SURVIVE — 86001014 and 76000176. **This is the finder's largest error.**

The finder cites, for the King Philip / Reporter wreck site and for the Point Lobos Archeological
Sites, "**California OHP row `N1441`, registration date 5/8/1986**" and "**OHP row `N445`,
registration date 11/7/1976**", and presents these as cross-checks **of the reference numbers**.

I fetched both OHP detail pages. They resolve, and they carry exactly four fields:

> KING PHILIP (SHIP) AND REPORTER (SCHOONER) SHIPWRECK SITE — Registration Date: 5/8/1986 —
> Location: San Francisco — County: San Francisco

> POINT LOBOS ARCHEOLOGICAL SITES — Registration Date: 11/7/1976 — Location: San Francisco —
> County: San Francisco

**Neither page contains a National Register reference number.** `N1441` and `N445` are OHP's own row
identifiers. OHP confirms the *name* and the *date*; it does not confirm `86001014` or `76000176`,
and the finder's table says it does.

The finder's fallback — that `npgallery.nps.gov/NRHP/GetAsset/NRHP/86001014_text` returns a live NPS
document — does not rescue it. I retrieved that asset and extracted its text. It is one page and it
reads, in full: *"The PDF file for this National Register record has not yet been digitized."* It
names no property. It binds nothing to anything. (A nonsense refnum returns a PNG instead of a PDF,
so the asset table does distinguish real refnums from fake ones — but that establishes only that
*some* record numbered 86001014 exists, not that it is the King Philip.)

Third check, to be sure the map service really withholds them rather than the finder mis-querying:
layer 1, `RESNAME LIKE '%King Philip%' OR RESNAME LIKE '%Point Lobos%'`, nationwide, returns exactly
one feature — **King Philip Mills, 83000687, Fall River, Massachusetts.** Nothing in California.

**RULING: both reference numbers are DROPPED.** A designation claim needs a register *and* an
identifier; "Listed on the National Register of Historic Places on May 8, 1986" has a register and no
identifier and fails the rule. The wreck site survives as a place on non-designation facts (§3, A5).
The archaeological district does not survive at all (§3, B16).

Also unverified: **George Washington High School, ref 100013126**, which §2.6 states was listed
2026-06-11. It is absent from layer 0 of the map service. It is not claimed, so nothing turns on it,
but it must not be repeated as a fact.

### 1.5 THE BIG NEGATIVE HOLDS

`RESNAME LIKE '%Sutro%' OR RESNAME LIKE '%Cliff House%'` on layer 0, nationwide, returns two
features: **New Cliff House, 86002962, Newport, Oregon** and **Cliff House, 80000897, Manitou
Springs, Colorado.** The San Francisco Cliff House is not on the National Register, and there is no
Sutro listing anywhere. GGNRA's own NHL page names five and none is here. §2.3 and §2.4 are correct
and are the most valuable pages in the finder.

**But the finder's own §2.4 language needs care in a draft.** The Sutro PDF calls the area "The Sutro
**Historic Landscape** District" in its boundary paragraph and "Adolph Sutro Historic District" in
its title. Neither is a listing. Say nothing that implies one.

---

## 2. THE FIVE SOURCES IT LEANED ON HARDEST — RE-FETCHED

**1. `nps.gov/goga/planyourvisit/oceanbeach.htm`.** Fire rings, plover and accessible-route
sentences are verbatim correct. **One splice to fix:** the finder renders the length as *"a 3.5-mile
stretch of white beach … on the westernmost border of San Francisco, adjacent to Golden Gate
Park."* The page's actual sentence is **"Picture a 3.5-mile stretch of white beach with few tourists
and no highrises."** The ellipsis joins two separate statements into one quotation. Fix the quote.
The page states **no hours**.

**2. `sutro_history.pdf`.** The finder's URL 301-redirects; the live one is
`home.nps.gov/goga/learn/historyculture/upload/sutro_history.pdf`. All 34 pages extracted. The
boundary paragraph, the "five mile long Ocean Beach strand", the July 1 1909 / Reid Bros. passage,
the well house, the semi-circular parapet, the octagonal gatekeepers' houses and "Since 1976" are all
verbatim as quoted.

**3. NRHP 81000172 (Beach Chalet).** Every figure checks: 58' x 104', $60,000, Willis Polk, eight
pairs of doric columns / seven interior bays, 6' Seal of the Park Commission mosaic, 200 diners,
W.Q. Banks 1900, Hattie and Minnie Mooser 1930, coastal defense headquarters, William McCarthy 1947,
.8767 acres, 144 / 575 / 276 feet, 1,500 sq ft of Labaudt frescoes, Primo Caredio, Michael von Meyer.
The "last design … who died in 1924" sentence exists verbatim.

**4. NRHP 04001137 (Golden Gate Park), 74 pages.** Confirmed verbatim: "City Landmark #147",
"City Landmark #179, listed on National Register", "City Landmark #210" twice; Alpheus Bull, Jr. of
the Union Iron Works, 30,000 gallons per hour, 75 feet tall, 5-foot foundation 33 feet across, wood
shingles, electrified 1913; Murphy's Windmill **1905**, Samuel Murphy, 40,000 gph, 95 feet tall, 114
foot span, slate shingles, "English Windmill", not used after 1913; Millwright's House 1909, two
story brick, slate shingle roof, Reid Brothers; Queen Wilhelmina named on her death in 1962; Amundsen
dedicated 1929, Gjoa removed 1972. **The finder missed one usable fact here**: the nomination gives
the monument's maker and material — *"Roald Amundsen, 1929, Contributing Object by Hans Jauchen, red
Norwegian granite and bronze."*

**5. NRHP 01000522 (Camera Obscura).** ENGINEERING; Period of Significance 1946; "1946 constructed;
1957 exterior remodeled"; Architect/Builder Floyd Jennings (Builder); 17.5 by 17.5 feet; circular
parabolic dish of shaped plywood surfaced with white enamel, rod anchored to native rock; 6-foot
projection table; lens and mirror 150 inches above; George K. Whitney, Sr. and the "giant camera"
remodel. All verbatim.

**Bonus re-fetches.** 36 CFR 7.97(d) retrieved from govinfo (ecfr.gov 302s to an unblock gateway):
the SPPA text, "Stairwell 21 to Sloat Boulevard", "1,000 feet offshore", six-foot leash, July 1 to
May 15 and the citation `[38 FR 32931, Nov. 29, 1973, as amended at 49 FR 18452, Apr. 30, 1984;
57 FR 58716, Dec. 11, 1992; 73 FR 54321, Sept. 19, 2008]` are all exact — **the finder's citation
line is incomplete; it gives only the first and "as amended".** GGNRA's linked-data file confirms
680 Point Lobos Ave, 94121, 4154265240, −122.511611527 / 37.7797300961, 09:00–17:00 and "Lands End
Lookout is open 7 days a week 9am to 5pm." Rec & Park properties 12, 103, 163 and 174 confirm every
acreage, type, ownership and centroid quoted. `sf.gov/sunset-dunes` confirms the six access streets
and every superlative the finder flagged.

---

## 3. RULINGS

### 3.A THE STRAND — 12 candidates

**A1 Ocean Beach — REWRITE.** Keep: 24/7 (Parks Conservancy), the fire-ring season and Stairwells 15
to 20, the Western Snowy Plover as a threatened species wintering here. **Drop the length entirely.**
NPS says 3.5 miles, the Sutro nomination says five, and the coincidence that the Golden Gate Park
nomination describes *the park* as stretching "3.5 miles (by .5 miles wide)" makes the NPS figure
suspect as a borrowed number. Two federal documents in conflict and a plausible source of the
conflict: give neither. Drop "westernmost".

**A2 The Esplanade — DROP.** Its only content is that NPS names it and that accessible routes reach
"the Promenade". Who built it, when, how long, of what, and whether Esplanade / Promenade / seawall
are one structure are all unsourced. Nothing survives that is not already in A1.

**A3 Fire rings — DROP as a place.** It is a rule about A1, not a subject of its own. The wording
moves into A1 unchanged.

**A4 Ocean Beach Snowy Plover Protection Area — PUBLISH.** A named federal instrument with a
citation, re-verified against the CFR text. Publish as: *the Ocean Beach Snowy Plover Protection
Area, defined at 36 CFR 7.97(d), covers the shoreline and beach between Stairwell 21 and Sloat
Boulevard and the tidelands and submerged lands to 1,000 feet offshore; dogs must be leashed on a
leash of not more than six feet from July 1 to May 15.* Cite the section, not the finder's truncated
FR history.

**A5 King Philip (ship) and Reporter (schooner) Shipwreck Site — REWRITE.** The place survives; the
designation does not (§1.4). Ship exactly: *At the foot of Ortega Street, at very low tides, the worn
ribs of the hull of the ship King Philip stand out of the sand. Between 1850 and 1926, 20 ships came
to grief on Ocean Beach.* Both sentences are the Parks Conservancy's, both re-fetched.
**No reference number. No "listed on the National Register."**

**A6 The Ocean Beach seawall — DROP.** Undated, unattributed, and possibly not a distinct structure.
The finder is right to have flagged it and right that nothing dated may ship; with the dates gone
there is no entry left.

**A7 Sunset Dunes — REWRITE. Straddler, escalated.** Publish the register facts only: Recreation &
Park property, propertytype Parkway, 50.60 acres, ownership Recreation & Park, Stern Grove Complex;
access from Irving, Judah, Lawton, Noriega, Taraval and Sloat. **Do not ship 501 Stanyan St** — it is
Rec & Park's own mailing address, and the finder says so but a drafter reading the JSON will not.
No opening date, no ballot measure, no hours.

**A8 Balboa Natural Area — REWRITE. Straddler, escalated.** Name, 1.84 acres, Recreation & Park
ownership, Richmond Complex. No address exists in the dataset; do not invent one. The dataset's own
fields put it in Outer Richmond and in Sutro Heights simultaneously — that is the arbitrator's
problem, and it must never be written down for a reader.

**A9 The Great Highway — DROP.** A roadway with no sourced length, paving date or closure history.
Its only role is as Golden Gate Park's register boundary, which belongs to that district's entry.

**A10 Roald Amundsen monument — DROP from this zone. Escalated to Golden Gate Park.** Both layers
put it inside Golden Gate Park and the GGP nomination lists it as a contributing object of 04001137.
If it lands here instead, add Hans Jauchen, red Norwegian granite and bronze.

**A11 Moss Flats Building, 1626 Great Highway — PUBLISH.** **NRHP reference number 83001232, listed
February 24, 1983**, re-fetched from layer 0 with the register's own address. Thin — architect, date
and appearance are unsourced and the nomination PDF was not obtained — but the number, the date and
the address are solid and the building faces the strand and belongs to nothing else. This and A5 are
the two places that are Ocean Beach's alone.

**A12 Stairwells — DROP as a place.** They are how the CFR and NPS address the beach; they are not a
subject. The finder's "do not count them" instruction is correct and stands.

### 3.B THE SUTRO HEADLAND AND LANDS END — 22 candidates, ALL ESCALATED

The ownership question is the arbitrator's and I do not decide it. I do rule on each candidate's
content, conditional on award. The evidence against award is strong and should be in front of the
arbitrator: `gfpk-269f` gives this ground to **Sutro Heights** and **Lincoln Park / Ft. Miley**,
`j2bu-swwd` to **Outer Richmond** and **Lincoln Park**, and the Sutro nomination's own boundary
paragraph places Ocean Beach **outside** the district, to its south, across a vacant lot.

**B1 Cliff House — REWRITE.** All eleven dated facts re-verified against nps.gov and the nomination.
**No designation of any kind.** Do not write hours, do not write "closed", do not write "reopened":
the NPS history page was last updated **September 13, 2023** and says nothing about a current
restaurant, and the things-to-do page does not mention the Cliff House at all. The **1090 Point Lobos
Avenue** street number was not confirmed against any record I could fetch; drop it or find it.

**B2 Camera Obscura — PUBLISH.** **NRHP reference number 01000522, listed May 23, 2001.**
Re-fetched, address 1096 Point Lobos Ave. on the record. Ship the apparatus and the housing:
17.5 by 17.5 feet as built in 1946, a circular parabolic dish of shaped plywood surfaced with white
enamel, a six-foot projection table, lens and mirror 150 inches above it, remodelled in 1957 to
resemble a giant camera at George K. Whitney, Sr.'s wish, built by Floyd Jennings. **The "last
example … in the United States" sentence does not publish.** Operating status unestablished.

**B3 Sutro Baths ruins — REWRITE.** Every figure re-verified. **Drop the GGNRA acquisition year.**
NPS's own page says 1973 and NPS's own nomination says 1976; there is no basis to prefer either and
splitting them is forbidden. Say the ruins are administered by the National Park Service and give no
year. No designation. The Harris v. Sutro history belongs in this entry.

**B4 Sutro Heights Park — REWRITE.** 1885, over twenty acres, over 200 concrete replicas from
Belgium, the Dolce far Niente balcony, the observation platform plaza, the conservatory, the two
octagonal gatekeepers' houses of 1885–86 with rooster weathervanes: all verbatim. Hours **6 a.m.
until one hour after sunset** confirmed on GGNRA's hours page, which names Sutro Heights Park and
Lands End and does **not** name Ocean Beach. **Drop "846 Point Lobos Avenue"** — unconfirmed.
On the staff, the two NPS sources differ: the web page says "a full-time staff of 17 gardeners,
machinist and drivers", the nomination says "A full-time staff of seventeen — ten gardeners, a tree
man, a coachman, driver, gatekeeper, machinist and helper, and a road maker". Use the nomination's
breakdown; it is the primary document and the web page's phrasing is a garbled compression of it.

**B5 The Parapet — DROP as a place.** A feature of B4. The parapet sentence and the photograph-
concession sentence move into B4.

**B6 The well house — REWRITE.** Ship it as the finder's own suggested fix: *a small wood-frame
building on an elevated foundation of cut and dressed sandstone, built around 1885, originally with
carved wooden posts, iron grillwork doors on the north and south facades, decorative shingles and
finials.* **"the last surviving building from the Sutro era" does not publish.**

**B7 Lion statues and main gate — DROP as a place.** A feature of B4; the circa-1885 caption moves
there. Note the nomination says the present lions are *"reproductions of the originals"* — the finder
did not catch this, and a draft that calls them Sutro's lions will be wrong.

**B8 Merrie Way — REWRITE.** Only one sourced sentence survives: wheelchair-accessible trails begin
from the Merrie Way parking lot. The Sutro Pleasure Grounds page was never read; nothing about it may
ship.

**B9 Lands End Lookout Visitor Center — PUBLISH.** 680 Point Lobos Avenue, San Francisco 94121;
(415) 426-5240; open 9 a.m. to 5 p.m., seven days. All four re-verified in GGNRA's own structured
data and the phone independently on the Lands End page. The cleanest candidate in section B.

**B10 The Coastal Trail — REWRITE.** Drop "the edge of the city — and the continent". Keep: the
trails wind around rocky cliffs above the ocean through stands of cypress and eucalyptus; Lands End
is open 6 a.m. until one hour after sunset. No length, no surface, no trailheads beyond Merrie Way.

**B11 El Camino del Mar Trail — DROP.** One sentence of NPS itinerary copy and nothing else.

**B12 Mile Rock Beach — DROP.** No source at all, by the finder's own admission.

**B13 Lands End Labyrinth — DROP.** Creator and date unconfirmed against any primary source.

**B14 Eagle's Point overlook — DROP.** No source at all.

**B15 USS San Francisco Memorial — REWRITE.** Only the NPS sentence survives: a memorial to the USS
San Francisco, a WWII cruiser that sustained 45 hits and 25 fires during the Battle of Guadalcanal in
1942. What the memorial physically is, and when it was dedicated, are unsourced; two NPS URLs 404'd.
Do not describe the object.

**B16 Point Lobos Archeological Sites — DROP.** The reference number cannot be confirmed (§1.4), NPS
withholds the locations by design, and with the number and the locations gone there is no place left.
The Yelamu Ohlone context and the 1776 date belong in B18 or B3, not in an entry that pretends to a
listing.

**B17 Seal Rocks — DROP.** The finder flagged the designation claim as lacking an identifier and was
right, but understated the problem: **the same document says two incompatible things.** Page one:
the rocks "were designated a wildlife preserve by the United States Congress." Later: "Sutro's
efforts led to Congressional passage of an 1887 act granting the Seal Rocks to the City and County of
San Francisco in trust for the people of the United States." A grant in trust to a city is not a
wildlife-preserve designation. One source, two readings, no statute number. With the designation gone
the entry is one sentence of orientation and does not stand.

**B18 Point Lobos, the headland — REWRITE.** Drop "westernmost". **And re-attribute the elevation:**
the Fort Miley nomination says "*The reservation* contained 54 1/20 acres and was located on top of
the headland at an elevation of approximately 350 feet" — 350 feet is the reservation's elevation,
not a measurement of Point Lobos, and the finder's B18 presents it as the latter. Keep Rancho Punta
de Lobos and the *lobos marinos* naming.

**B19 Adolph Sutro — DROP.** A person. Correctly listed by the finder only as a warning.

**B20 Harris v. Sutro — DROP as a place.** History for B3. The finder's caution about NPS's "67
years" gloss is well taken; do not reuse it.

**B21 Sutro Baths cave / tunnel — DROP.** Unsourced. (The nomination does describe an 8-foot by
153-foot tunnel cut through the cliff to fill the 1894 aquarium basin — that is a fact for B3, not a
separate place.)

**B22 Giant Camera gift shop / Louis' Restaurant — DROP.** Unverified as trading, and the only thing
anyone would want from them is a founding year, which does not publish.

### 3.C GOLDEN GATE PARK'S WESTERN EDGE — 10 candidates, ALL ESCALATED

The register text makes the Great Highway the district's western boundary and both layers put every
one of these inside Golden Gate Park, which is a live zone in this wave. My reading is that they are
Golden Gate Park's. Content rulings, conditional:

**C1 Beach Chalet — PUBLISH.** **NRHP reference number 81000172, listed July 22, 1981**, and **San
Francisco Landmark No. 179, designated in 1985.** Both re-fetched. Every construction fact verified.
On Polk: the finder's proposed safe rewrite is correct and I adopt it — **Willis Polk designed it and
died in 1924, before it was finished.** Do not write "last design" or "last commission".

**C2 The Beach Chalet frescoes — REWRITE.** A feature of C1: 1,500 square feet of walls, ceiling and
stairwell frescoed in 1936 by Lucien Labaudt, framed in mosaic designed by Labaudt and executed by
Primo Caredio, with sculpture by Michael von Meyer on columns and stair railings. Say nothing about
photographs.

**C3 Park Chalet — DROP.** The operator's site was never read and nothing is asserted. There is no
entry here, only a URL that resolves.

**C4 Golden Gate Park Senior Center — DROP.** Unsourced; the current occupant was never established.

**C5 Dutch Windmill — PUBLISH.** **San Francisco Landmark No. 147, designated in 1981**, re-fetched
from `97yj-54sx` and independently corroborated in the register nomination as "City Landmark #147".
1902; Alpheus Bull, Jr., a mechanical engineer from the Union Iron Works; 30,000 gallons per hour;
75 feet tall; a five-foot-thick concrete foundation 33 feet across; a wood frame tower covered with
wood shingles; pumps electrified in 1913.

**C6 Queen Wilhelmina Tulip Garden — REWRITE.** The register records the date as unknown; say so as a
fact about the garden, not about our research. Keep: it was named for Queen Wilhelmina of the
Netherlands on her death in 1962.

**C7 Murphy Windmill — PUBLISH.** **San Francisco Landmark No. 210, designated in 2000.** On the
date, I rule with the finder: **1905**, cited to the Golden Gate Park nomination, which says it twice
in two different registers of the document. 1908 has no register behind it in this file. Samuel
Murphy's funds, 40,000 gallons per hour, 95 feet tall, a 114-foot span, a concrete foundation under a
wood-framed tower covered with slate shingles, sometimes called the English Windmill, out of use for
pumping after 1913. **"the largest windmill of its kind in the world" does not publish.**

**C8 Millwright's House — PUBLISH.** Part of **San Francisco Landmark No. 210, designated in 2000**;
built 1909 just east of the Murphy Windmill, a small two-story brick building with a slate shingle
roof, designed by the Reid Brothers. The two registers' different names for it are a fact about the
registers; write the building, not the discrepancy.

**C9 Beach Chalet Soccer Fields — DROP.** An inventory line with the date recorded as unknown.

**C10 Golden Gate Park (the district) — DROP from this zone.** 04001137, 10/15/2004, 1,017 acres,
all confirmed — and all the Golden Gate Park zone's. The finder's "DO NOT COUNT" warning about the
nomination's contributing-resource tally is correct and I restate it: **that number must not reach
prose in any form.**

### 3.D FORT MILEY AND LINCOLN PARK — 6 candidates, all DROP from this zone

Both layers agree these are Lincoln Park, and the Fort Miley nomination says in its own words that
"**The Lands End area, outside the boundary and west of Fort Miley** … is separated from West Fort
Miley by a paved road and a significantly lower elevation" and that "**Lincoln Park, adjacent to but
outside Fort Miley** on the north and east". Both quotations re-verified. This is not Ocean Beach's
ground under any reading. **D1** Fort Miley (80000371, 05/23/1980 — confirmed, acquired by
condemnation from the City and County in 1893, 54 1/20 acres, nominated acreage approx. 27.5 marked
ACREAGE NOT VERIFIED on the form), **D2** Battery James Chester (1899–1904, all dates confirmed),
**D3** VA Medical Center (05001112, 04/20/2009 — confirmed, and a working hospital campus, not a
guide subject), **D4** Lincoln Park (property 103, Regional Park, 112.82 acres, 100 34th Ave —
confirmed), **D5** City Cemetery (Landmark No. 306, 2022 — confirmed, nothing else sourced),
**D6** Legion of Honor (nothing sourced). Numbers preserved above so a Richmond zone can use them.

### 3.E THE SOUTH END AT SLOAT — 3 candidates, all DROP from this zone

**E1 Doggie Diner Sign** — Landmark No. 254, 2006, confirmed, APN null; nothing else sourced, and
the two layers split it between Lakeshore and Parkside. **E2 Mother's Building** — Landmark No. 304
(2022) and NRHP 79000529 (12/31/1979), both confirmed; Lakeshore in both layers. **E3 San Francisco
Zoo** — property 12, 131.54 acres, Lakeshore in both layers. That 36 CFR 7.97(d) makes Sloat the
southern terminus of the plover area draws a federal line for plovers, not a zone boundary, and the
finder is right to say so.

### 3.F THE BEACHFRONT TRADE — 10 candidates, all DROP from this wave

Every one is Outer Sunset in both layers and in Rec & Park's own neighborhood fields, and the only
source is a promotional sf.gov page whose usable content is a name, a street and a kind. I re-fetched
it: the superlatives and trading durations the finder quarantined are all there verbatim
("continuously running cooperative since 1974", "opened in 1971", "A San Francisco institution …
for decades", "one of the Outer Sunset's most iconic bars"), and the finder is right that none may be
paraphrased. Two corrections: **the page writes "Blackbird Bookstore", one word**, not "Black Bird
Bookstore"; and **the street addresses for Java Beach Cafe (1396 La Playa) and Outerlands (4001
Judah) are not on that page and are not sourced anywhere in the finder.** Neither address may ship.

---

## 4. STRADDLERS ESCALATED TO THE ARBITRATOR

Seven groups, matching the finder's §3, with my content rulings attached:

1. **The Beach Chalet cluster** (C1, C2, C5, C6, C7, C8 surviving; A10 with them) — six named
   buildings and objects, four carrying Article 10 numbers and one an NRHP number, all inside the
   Golden Gate Park district by register text and inside Golden Gate Park by both city layers.
   **My reading: Golden Gate Park's.** They are also the richest content in the file, and if the
   arbitrator gives them to Golden Gate Park then Ocean Beach loses its best material.
2. **The Sutro / Lands End headland** (B1, B2, B3, B4, B6, B8, B9, B10, B15, B18 surviving) — ten
   places, one NRHP number between them. **My reading: not Ocean Beach's**, on the strength of the
   nomination placing Ocean Beach outside the district and both city layers treating the headland as
   its own unit. This is the decision that determines the tier.
3. **The south end at Sloat** (E1) — Lakeshore against Parkside; nothing sourced beyond a register
   row either way.
4. **Fort Miley, the VA, Lincoln Park, the Legion of Honor and City Cemetery** (D1–D6) — a Richmond
   question, not an Ocean Beach one.
5. **Sunset Dunes** (A7) — city parkland on the former roadway, inland of federal sand. The one
   straddler I would actually award to Ocean Beach if forced, because nothing else in this wave
   touches it.
6. **Balboa Natural Area** (A8) — the dataset itself files it under Outer Richmond and Sutro Heights
   at once. Thin either way.
7. **The Outer Sunset beachfront trade** (F1–F10) — plainly an Outer Sunset zone's if one ever ships.

---

## 5. TIER RULING

Places that survive **and** belong to Ocean Beach with no other claimant:

| | |
|---|---|
| A1 | Ocean Beach |
| A4 | Ocean Beach Snowy Plover Protection Area |
| A5 | King Philip (ship) and Reporter (schooner) Shipwreck Site |
| A7 | Sunset Dunes *(straddler, but uncontested in this wave)* |
| A11 | Moss Flats Building, 1626 Great Highway |

**Five.** Six if Balboa Natural Area (A8) is allowed on 1.84 acres and a name.

**RULING: TOWN PAGE.** Under six places, so a 90-word intro floor and two links. That is the honest
count and it should not be padded: A2, A3, A6, A9 and A12 were all pushed forward by the finder as
strand candidates and all five collapse on inspection — three are features of A1, one is unsourced,
one is a road.

**Re-tier if the arbitrator awards either escalated block.** The Sutro / Lands End block adds ten and
the Beach Chalet cluster adds six; either one alone lifts this well past a full zone. But on the
evidence in front of me, both belong somewhere else, and a town page of five well-sourced places is a
better outcome than a zone page padded with ground the city's own data and the National Park
Service's own nomination assign elsewhere.

---

## 6. WHAT THE FINDER GOT WRONG

1. **The OHP cross-check does not do what the file says it does.** OHP detail pages carry a name, a
   registration date, a location and a county — and no National Register reference number. The file
   presents `N1441` and `N445` as confirming `86001014` and `76000176`. They confirm the dates and
   nothing else, and both numbers are dropped as a result. This is the one finding that would have
   shipped a citable-looking number with nothing behind it.
2. **The NPGallery "not yet digitized" page is content-free** and cannot corroborate a reference
   number. The file treats it as a confirming source.
3. **A spliced quotation** on the Ocean Beach page: "a 3.5-mile stretch of white beach … on the
   westernmost border of San Francisco" joins two separate statements with an ellipsis.
4. **The Seal Rocks source contradicts itself** and the file quotes only one half. A wildlife-preserve
   designation and an act granting the rocks to the City in trust are not the same instrument.
5. **350 feet is the Fort Miley reservation's elevation**, not Point Lobos'. B18 reattributes it.
6. **The lion statues at Sutro Heights are reproductions**, per the nomination the file itself
   quotes; the file does not say so.
7. **The staff-of-seventeen figure** is quoted from the NPS web page's compressed version rather than
   the nomination's actual breakdown, which reads very differently.
8. **The 36 CFR citation history is truncated** — three later amendments are omitted.
9. **"Black Bird Bookstore"** is written "Blackbird Bookstore" on the source; and the Java Beach and
   Outerlands street addresses are unsourced.
10. **The Sutro PDF URL 301-redirects**; cite the live one.
11. **George Washington High School's 2026 listing (100013126) is unverified** — absent from the map
    service layer the file used for everything else.

**What it got right, and it is a lot.** The pre-flight caught that `taken_slugs.py` is Rome-only and
redid the check properly. §2.4 — that the Adolph Sutro nomination is a nomination and not a listing —
is the single most valuable page in the file and would have caught a false designation on four
subjects. §2.3, §2.5 and the "County AND State returns zero" note are all correct and all save a
later pass real time. The trap table in §6 is accurate and complete as far as it goes. The boundary
work in §1 is right, and the file's discipline about not resolving what it was not asked to resolve
made this adjudication straightforward.
