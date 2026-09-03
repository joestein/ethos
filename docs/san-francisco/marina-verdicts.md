# Marina District, San Francisco — VERDICTS

Zone slug `marina`; roster destination string `Marina District, California`.
Adjudicated 2026-09-03 by the verifier. **This file overrides `marina-finder.md` wherever the two
disagree.** The author writes from this file, not from the finder's.

Every source below was re-fetched independently. The scripts are
`.superpowers/vf_fetch.py` (Article 10), `.superpowers/vf_nrhp.py` (NPS map service),
`.superpowers/vf_datasf.py` (Rec & Park, civic art, historic districts),
`.superpowers/vf_sites.py` / `vf_sites2.py` / `vf_sites3.py` (own sites and Wikipedia),
`.superpowers/vf_hoods.py` (point-in-polygon against both neighborhood layers),
`.superpowers/vf_taken_all.py` (corpus-wide slug scan).

---

## 0. HEADLINE

| | count |
|---|---|
| PUBLISH as the finder wrote it | 9 |
| REWRITE — fact sound, wording or detail overreaches | 16 |
| DROP | 29 |
| ESCALATED to the arbitrator, not counted as surviving | 2 |
| **Surviving places** | **25** |

**TIER RULING: `guide`.** The invariant is `tier == "guide"` requires at least 4 places and
`tier == "town-page"` fails at 6 or more (`test/ethos/seeds/bronx_seed_data_test.exs`,
`tier_violations/1`). Twenty-five clears the guide floor by a wide margin, and the tier is not at
risk under any straddler outcome: strip the entire Fort Mason block and the Marina still holds 17.

**Designation numbers: 19 of 19 identifiers survived re-fetching.** Two of the nineteen
*statements* needed correction — see §1.

---

## 1. DESIGNATION NUMBERS — RE-FETCHED, ONE BY ONE

### 1a. Article 10 — 10 of 10 verified exactly
Re-fetched `https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000`, HTTP 200, 370 rows.
Number, register spelling, address, year of designation and ordinance URL all match the finder
for every row. Nothing here needs changing.

| LM | name as the register spells it | address | designated | ordinance |
|---|---|---|---|---|
| 88 | Palace Of Fine Arts | 3301 Lyon Street | 1977 | `sfplanninggis.org/docs/landmarks_and_districts/LM88.pdf` |
| 262 | Marina Branch Library | 1890 Chestnut Street | 2010 | …/LM262.pdf |
| 320 | Ladies' Protection and Relief Society | 3400 Laguna Street | 2024 | `files.sfplanning.org/documents/preservation/LM320.pdf` |
| 58 | Merryvale Antiques (S.F. Gas Light Co.) | 3640 Buchanan Street | 1974 | …/LM58.pdf |
| 218 | North End Police Station and Garage | 2475 Greenwich Street | 1996 | …/LM218.pdf |
| 261 | Metro Theater | 2055 Union Street | 2009 | …/LM261.pdf |
| 17 | Colonial Dames Octagon House | 2645 Gough Street | 1969 | …/LM17.pdf |
| 49 | Sherman House | 2160 Green Street | 1972 | …/LM49.pdf |
| 300 | Golden Gate Valley Carnegie Library | 1801 Green Street | 2022 | …/LM300.pdf |
| 31 | Burr House | 1772 Vallejo Street | 1970 | …/LM31.pdf |

Sentence forms that pass `@designation_citation`:
> San Francisco Landmark No. 88, designated in 1977.
> Designated under Article 10 of the Planning Code as San Francisco Landmark No. 262 in 2010.

### 1b. National Register — 9 of 9 reference numbers exist; 2 statements corrected
Re-fetched the NPS map service, layers 0 and 1, envelope `-122.475,37.788,-122.405,37.820`.
HTTP 200; 55 point features and 12 polygon features. Every refnum the finder claimed is present
with the RESNAME and Address it gave, and `CertDate` matches in every case.

| refnum | RESNAME | CertDate | Is_NHL | contributing |
|---|---|---|---|---|
| 04000659 | Palace of Fine Arts | 12/05/05 | — | 1 bldg, 4 structures |
| 72000109 | Fort Mason Historic District | 04/25/72 | — | 4 bldgs |
| 79000530 | Fort Mason Historic District (Boundary Increase) | 04/23/79 | — | 45 bldgs, 2 objects, 10 structures |
| 85002433 | San Francisco Port of Embarkation, US Army | 02/04/85 | **X** | **14 bldgs**, 5 structures |
| 78003405 | SS JEREMIAH O'BRIEN | 06/07/78 | **X** | 1 structure |
| 01000281 | San Francisco Maritime National Historic Site | 06/27/88 | — | null |
| 72000250 | McElroy Octagon House | 02/23/72 | — | 1 bldg |
| 14000967 | Burr House | 06/08/15 | — | 2 bldgs |
| 76000177 | Pumping Station No. 2, SFFD AWSS | 05/13/76 | — | 1 bldg, 3 structures |

**CORRECTION 1 — 78003405.** The finder wrote "A National Historic Landmark, National Register
reference number 78003405, listed 7 June 1978", conflating two different designations. 7 June 1978
is the NRHP listing date; the **NHL designation is 14 January 1986** (Wikipedia's NRHP infobox,
`designated_nrhp_type = 14 January 1986`, citing the NPS NHL summary listing). The Fisherman's
Wharf finder got this right and the Marina finder did not. Whichever zone ends up with the ship
writes the two dates separately or writes only the 1978 listing.

**CORRECTION 2 — 01000281.** The register field says certified 27 June 1988, but a reference
number in the `01……` series is a 2001 listing. The record is internally incoherent, so **no date
publishes for this listing at all.** The finder repeated the 1988 field without noticing. If the
Maritime site is written anywhere, write the reference number and no date.

### 1c. The "Eligible only" negative finding — VERIFIED, and it is the finder's best work
Re-fetched `63x5-g3m4`, HTTP 200, 204 rows. All seven districts return `cr: "Eligible"`,
`nr: "No"`, `a10: "No"`, with exactly the case numbers the finder gave: Marina Historic District
(2015-010161ENV et al.), Marina Corporation Residential (2016-013786ENV), its Extension
(2019-014071ENV), Baker Street (2016-002430ENV), Baker Street Period Revival Bungalows
(2021-008228ENV), Cow Hollow First Bay Tradition (2013.0433E), Lombard Street (2016-009258ENV).

**Carry this into the author's brief verbatim as a do-not-write list.** None of these seven may be
called designated, listed or landmarked. "Eligible" is not a designation and has no identifier,
so any sentence about them trips `@designation_claim` with nothing to satisfy
`@designation_citation`.

---

## 2. PRE-FLIGHT — the finder was right about the tool, and its conclusion holds

`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only and reports 1279 places
across 31 files. I re-ran across `priv/seed_data/**/*.json`: **3921 places across 337 files.**
No Marina candidate collides with anything committed. The nearest name matches are Marina Bar &
Grill (Gerritsen Beach), Saybrook Point Resort & Marina (Old Saybrook), Palazzo Marina (Flaminio),
Burr Pond State Park (Torrington), Sherman Playhouse (Sherman, CT) and Great Meadows Marsh
(Stratford) — all different places in different corpora. None of the seven Oracle Park code-seed
places is in this zone. **Cleared.**

---

## 3. BOUNDARY — the finder's layer assignments are correct

I point-tested every contested candidate against both layers directly
(`intersects(the_geom, 'POINT (lon lat)')`). `j2bu-swwd` returns 41 rows; `gfpk-269f` returns 117.
Every assignment in the finder's tables reproduces:

| point | Analysis Neighborhood | SF Find |
|---|---|---|
| Palace of Fine Arts | Marina | Marina |
| Wave Organ | Marina | Marina |
| Moscone Rec Center, Marina Branch Library, 3400 Laguna, 3640 Buchanan | Marina | Marina |
| Fort Mason Center | Marina | Aquatic Park / Ft. Mason |
| Octagon House, Sherman House, Metro Theater, Allyne Park, Balboa Cafe, Perry's | Marina | Union Street |
| North End Police Station, Cow Hollow Playground, Liverpool Lil's | Marina | Cow Hollow |
| Burr House, Golden Gate Valley Carnegie Library | Marina | Pacific Heights |

Two footnotes the finder did not catch, neither of which changes an outcome:

- **Marina Green and the yacht harbours return nothing from the Analysis Neighborhood layer** —
  they lie outside its land polygon. "Both layers agree" is not literally true for them. SF Find
  says Marina and Rec & Park's own `analysis_neighborhood` attribute says Marina, so the
  assignment stands, but do not describe the two layers as agreeing.
- **Rec & Park property 111 (Palace of Fine Arts) carries `analysis_neighborhood: "Marina,
  Presidio"`** — the 19.74-acre grounds cross the Presidio line even though the building tests
  Marina on both polygon layers. The finder's §4.7 ruling that the Palace "is NOT a straddler" is
  right about the building and wrong about the grounds. Write the building; do not write the
  acreage as if the whole parcel were the Marina's.

---

## 4. VERDICTS, CANDIDATE BY CANDIDATE

Numbering follows the finder's. #16 (Marina Middle School) and #44 (CCSF Fort Mason Art Campus)
were correctly recorded as non-candidates — no schema kind fits — and are not adjudicated.

### 4a. Marina core

**#1 Palace of Fine Arts — REWRITE, then PUBLISH.** `historic-site`.
LM 88 (1977) and NRHP 04000659 (5 December 2005) both re-verified. Address: the registers use
3301 Lyon Street, Rec & Park property 111 uses 3601 Lyon Street; write 3301 Lyon Street and note
the grounds as Rec & Park property 111.
- **Architect line is incomplete.** The finder wrote "Designed by Bernard Maybeck". Wikipedia's
  infobox names two. Replacement wording, verbatim:
  > The architects of record are William Gladstone Merchant and Bernard Maybeck, and the structure
  > was built for the 1915 Panama–Pacific International Exposition.
- The rebuild description survives re-fetch: "the colonnade and rotunda were … framed in wood and
  then covered with staff, a mixture of plaster and burlap-type fiber", and the 1964–1974 rebuild
  "in permanent, lightweight, poured-in-place concrete, and steel I-beams were hoisted into place
  for the dome of the rotunda". PUBLISH.
- **Do not write** Wikipedia's "it is the only structure from the exposition that survives on
  site" or "one of San Francisco's most recognizable landmarks". Both are rankings and the second
  would additionally trip the designation gate.
- **The finder missed three good sourced facts.** All publish:
  > The Panama–Pacific International Exposition opened on 20 February 1915 and closed on
  > 4 December 1915, covering 636 acres and recording 18,876,438 visitors.
  > On 6 October 1976 the Palace of Fine Arts hosted the second presidential debate between
  > Gerald Ford and Jimmy Carter.
  (`en.wikipedia.org/wiki/Panama–Pacific_International_Exposition`,
  `en.wikipedia.org/wiki/Palace_of_Fine_Arts`.) Counts and dates, not rankings.

**#2 Palace of Fine Arts Theatre — PUBLISH.** `theater`. 3301 Lyon Street. "in 1970, also became
the home of the 966-seat Palace of Fine Arts Theater" re-verified. No hours sourced, so none are
given.

**#3 The Exploratorium's former home — DROP as a place.** The finder flagged this itself and the
flag is correct: as a *place* it is the same building as #1 and #2. The history publishes inside
the Palace entry, and from Wikipedia rather than the museum's own site:
> The former exhibit hall became home to the Exploratorium in 1969; the museum closed there in
> January 2013 before moving to the Embarcadero.
The founding year on `exploratorium.edu/about/our-story` is a trading-duration claim from the
institution's own site and does not publish from there. Wikipedia carries 1969 independently.

**#4 Wave Organ — REWRITE, then PUBLISH.** `attraction`. Both layers Marina (re-tested).
Every Exploratorium sentence the finder quoted survives re-fetch verbatim: the Bill Fontana vent
pipe in Sydney, the 1980 National Endowment for the Arts planning grant, the New Music '81
Festival prototype, construction beginning September 1985 "seven months after Oppenheimer's
death", completion May 1986, the June dedication, the demolished-cemetery granite and marble, and
"25 organ pipes made of PVC and concrete". All PUBLISH.
- **Artist names must not come from DataSF.** Accession 1111.2 records the artist string as
  "Richards, George and Gonzalez, Peter", which garbles the two men. Use the Exploratorium's
  wording. Replacement, verbatim:
  > The concept was developed by Peter Richards and installed in collaboration with the sculptor
  > and master stone mason George Gonzalez.
- Add from DataSF `r7bn-7v9c`: street address **83 Marina Green Drive**, creation date 1986,
  medium "granite, concrete, marble, brick, pipes", accession number 1111.2.
- **PHOTO BLOCKED** in the photo wave. A sculpture, not a building; 17 USC 120(a) does not reach
  it. Wave 1 emits `"photos": []` regardless.

**#5 Marina Green — REWRITE, then PUBLISH.** `park`.
- **The finder's "No street address is published in either dataset" is false.** `gtr9-ntp6`
  property 112 carries `address: "1 Marina Green Dr"`. Write it.
- The 165.47 acres belongs to the joint property "Yacht Harbor and Marina Green" and must not be
  written as Marina Green's own extent. Replacement, verbatim:
  > Rec & Park files it jointly with the yacht harbour as property 112, "Yacht Harbor and Marina
  > Green", a regional park of 165.47 acres at 1 Marina Green Drive.
- The Wikipedia sentence re-verified verbatim and publishes: "the Marina Green, a park adjacent to
  the municipal boat marina from which the neighborhood takes its name."
- Do not say the two layers agree here (see §3).

**#6 Little Marina Green — DROP.** Inside Rec & Park property 112 with no separate `property_id`,
sourced to an OSM polygon alone. Not a distinct place.

**#7 San Francisco Marina Yacht Harbor — REWRITE, then PUBLISH as one place.** `attraction`.
Both OSM polygons sit inside property 112; write one harbour, not two.
**DROP "Gashouse Cove"** — the finder marked it unsourced and it is.

**#8 Marina Branch Library — REWRITE, then PUBLISH.** `attraction`.
LM 262 (2010) re-verified; the ordinance PDF is scanned images, so architect and build year stay
unwritten — that part of the finder's ruling holds.
- **The finder's "its body is JavaScript-rendered and no hours were extracted" is false.**
  `https://sfpl.org/locations/marina` served them in the HTML on re-fetch. The Marina block reads:
  address 1890 Chestnut Street, San Francisco, CA 94123; telephone 415-355-2823; Sun 1–5, Mon
  10–6, Tue 10–6, **Wed 1–8**, **Thu 10–8**, Fri 1–6, Sat 10–6. Note Wednesday and Thursday differ
  from the branch listed immediately above it on the same page — do not transcribe the wrong
  block. **Hours publish.**

**#9 Moscone Recreation Center — REWRITE, then PUBLISH.** `park`.
Rec & Park property 132 re-verified: 12.73 acres, 1800 Chestnut Street, type "Neighborhood Park or
Playground", complex "Marina Complex", `analysis_neighborhood: "Marina"`. The register's own
property name is "Moscone Rec Center".
- **The finder's "title truncated in the API response" is false.** Accession 2002.9 returns its
  full title, **"The Pink Short-spined Starfish"**, Jonathan Beery, 2002.
- *Passage* (Kent Roberts, 2010, accession 2010.7) and *Leatherback Sea Turtle* (Jonathan Beery,
  2002, accession 2002.8) re-verified. All three may be named in prose; all three are
  **PHOTO BLOCKED** — living artists, sculptures not buildings.
- **DROP the dog play area at 1895 Chestnut Street** — OSM only.

**#10 Ladies' Protection and Relief Society — PUBLISH.** `historic-site`. 3400 Laguna Street.
LM 320 (2024) re-verified, including the `files.sfplanning.org` ordinance URL. Both layers Marina.
Architect and build year stay unwritten. The finder is right that this is the most under-covered
find in the zone; say so by writing it well, not by saying it.

**#11 Merryvale Antiques (S.F. Gas Light Co.) — REWRITE, then PUBLISH.** `historic-site`.
3640 Buchanan Street. LM 58 (1974) re-verified. The finder's caution holds: the current occupant
is unsourced, so write it as a landmark building and not as a shop.
**DROP "the edge of the Fort Mason block"** — unsourced orientation. The street address carries it.

**#12 Chestnut Street — PUBLISH.** `attraction`. The Wikipedia sentence re-verified verbatim:
"Stretching from Fillmore Street down to Lyon Street, Chestnut is lined with a collection of
stores, restaurants, bakeries, coffee shops and bars." Two named streets is permitted orientation.

**#13 Marina Theatre — DROP.** `cinemasf.com/marina` returned 404 again on re-fetch. An OSM
cinema node with no operator and no status is not a place, and the finder says it may be closed.

**#14 Presidio Theater, 2340 Chestnut Street — DROP.** OSM only, status unsourced, and the name
collides with the Presidio Theatre at 99 Moraga Avenue, which is another zone's. The risk of
publishing the wrong building under a shared name is not worth an unsourced node.

**#15 Marina Safeway — DROP.** "Safeway" does not appear in the Wikipedia article. The 1959 date
and the social reputation are unsourced; what remains is that a supermarket exists at 15 Marina
Boulevard, which is not a place worth a page.

**#17 Marina Air Field memorial — DROP.** Neither "airfield" nor "air field" appears in the
Wikipedia article. OSM node only, plaque text not obtained.

**MISSED BY THE FINDER, and it is the most important thing about this neighborhood.**
The Wikipedia article carries material the finder did not surface at all, and it belongs in the
guide intro rather than in any single place:
> The neighborhood sits on the site of the 1915 Panama–Pacific International Exposition, staged
> after the 1906 San Francisco earthquake. Aside from the Palace of Fine Arts, all other buildings
> were demolished to make the current neighborhood. Much of the Marina is built on former
> landfill and is susceptible to soil liquefaction during strong earthquakes, which caused
> extensive damage to the neighborhood during the 1989 Loma Prieta earthquake.
All of it publishes: dates, a named event, a named mechanism. No ranking, no impression.

### 4b. Fort Mason

**The block is much less contested than the finder believed.** Fisherman's Wharf's own finder
releases it: its straddle table reads "Fort Mason Center | **Marina**" and its prose says the
Maritime park HQ is "in **Fort Mason**, i.e. the Marina, not the wharf". The neighbour is not
claiming it. **I rule the block provisionally Marina** and escalate only the GGNRA question, which
is the arbitrator's and not a finder's.

**#18 Fort Mason (the post) — REWRITE, then PUBLISH.** `historic-site`.
NRHP 72000109 (25 April 1972) and 79000530 (23 April 1979) re-verified. Every NPS sentence the
finder quoted survives re-fetch word for word: the Black Point community of John Fremont, Jessie
Benton Fremont and Leonides Haskell; "The outbreak of the Civil War forced the army to take back
possession of Black Point, evict the civilian residents, and re-establish the original name,
Point San Jose"; "In 1864, the army fortified Point San Jose with more guns"; "In 1882, the post
was renamed Fort Mason to honor Colonel Richard Barnes Mason, the second military governor and
commander of California".
- **DROP the number "three".** The finder wrote "three of the Black Point houses survive as
  Quarters 3 and Quarters 4". The NPS says only: "These buildings, now refered to as Quarters 3
  and Quarters 4, still stand today." Replacement, verbatim:
  > Two of the private houses built on the north end of Black Point still stand, and are now
  > called Quarters 3 and Quarters 4.
  If even "two" feels like an inference from the names, write "the surviving houses are now called
  Quarters 3 and Quarters 4."
- **DROP "201 Fort Mason, San Francisco, CA 94123" as the post's address.** Re-fetching the NPS
  page shows 201 Fort Mason in the page footer as the **mailing address of Golden Gate National
  Recreation Area**, not as a street address for the post. Do not publish a park-service mailbox
  as a place's address.
- Wikipedia additions that publish: "Originally named Punta Medanos and Punta de San José by the
  Spanish settlers, it was renamed Black Point after 1849", and Black Point "was named for the
  abundance of dark-colored California bay laurel trees that grew on the bluff".

**#19 San Francisco Port of Embarkation — REWRITE, then PUBLISH the designation only.**
`historic-site`. NHL, NRHP reference number 85002433, designated 4 February 1985, **14 contributing
buildings** — all four re-verified against the map service (`Is_NHL: "X"`, `NumCBldg: 14`).
- **DROP "Established 6 May 1932."** Not on the cited Wikipedia page. The page's section heading
  gives the span, so this publishes instead:
  > Wikipedia records the San Francisco Port of Embarkation as operating from 1932 to 1955.
- **DROP "roughly 1.6 million passengers and 23 million tons of cargo."** Neither figure appears
  on the cited page; what is there is a chart caption, "Army Ports: Passengers and tons of cargo
  embarked during the period December 1941 – August 1945", with no numbers in the text. A figure
  the source does not state is not a sourced figure.
- **DROP "the principal Pacific shipping hub in the Second World War."** A ranking with a
  comparison class. Replacement, verbatim:
  > During the Second World War, Fort Mason became the headquarters of the San Francisco Port of
  > Embarkation, controlling a network of shipping facilities across the Bay Area.

**#20 Fort Mason Center for Arts & Culture — REWRITE, then PUBLISH.** `attraction`.
2 Marina Blvd, Landmark Building C, Suite 260, San Francisco, CA 94123. "in the Marina District
along the northern waterfront" re-verified verbatim. 13-acre campus re-verified. Venues from 500
to 50,000 square feet and more than 100,000 square feet of rentable space re-verified.
- **"11–12 venues" → "11".** The site says "11 venue options". Write 11.
- **DROP "more than 500 on-site parking spaces."** Not on either page fetched.
- **The finder's "write neither, or write the disagreement" is over-cautious.** 1977 from
  `fortmason.org/about/` is a trading-duration claim on the operator's own site and does not
  publish. But Wikipedia is not the operator, and it says: "In 1976 lower Fort Mason became the
  Fort Mason Center, a non profit organization." That is third-party and it publishes. Replacement,
  verbatim:
  > Wikipedia records that lower Fort Mason became the Fort Mason Center, a nonprofit
  > organization, in 1976.
- Add, from the same own-site page and permissible as a count rather than a superlative:
  "approximately 1.5 million visitors annually". The finder missed it.
- The centre is "the nonprofit steward of the former San Francisco Port of Embarkation" —
  publishes, and links #20 to #19 without any proximity language.

**#21 Festival Pavilion, #22 Gateway Pavilion, #24 Gallery 308, #25 The Firehouse, #26 The Store
House — DROP as places; fold the measurements into #20.** These are rooms for hire, not
destinations, and the finder flagged the possibility itself. The measurements re-verified and may
be written inside the #20 entry: Festival Pavilion 50,000 square feet with capacity up to 3,840;
Gateway Pavilion 40,000 square feet, up to 2,000.
- **Do not write "Award-winning"** (the site's word for the Gateway Pavilion) — an award sourced
  only to the operator.
- **Do not write "Fort Mason Center's largest rental venue"** (the site's phrase for the Festival
  Pavilion) — a ranking with a comparison class.
- Wikipedia also names the **Herbst Pavilion**, which the finder missed and which housed a San
  Francisco Art Institute graduate campus from 2017 until its closure in 2022.

**#23 Cowell Theater — PUBLISH.** `theater`. 2 Marina Boulevard. "437-Seat Theater with proscenium
stage" re-verified. This one earns a place of its own; the other five venues do not.

**#27 Greens Restaurant — REWRITE, then PUBLISH.** `restaurant`. Fort Mason Center, Landmark
Building A, 2 Marina Boulevard, San Francisco, CA 94123. Hours re-verified exactly as the finder
gave them: Lunch Tue–Fri 11.30am–2.30pm; Brunch Sat–Sun 10.30am–2.30pm; Dinner Tue–Sun
5.00pm–9.00pm. Vegetarian, with menus tied to the Green Gulch farm.
**DROP the 1979 founding year.** The finder's own-site ruling is correct and I confirm it: the
site's line is "Celebrating Vegetables Since 1979", which is a trading-duration claim on the
business's own page. Address and hours publish; the year does not.

**#28 The Interval at Long Now — PUBLISH.** `cafe`. 2 Marina Boulevard. Hours re-verified exactly:
Mon 5pm–10pm; Tue–Fri 10am–11pm; Sat 5pm–11pm; Sun 3pm–10pm. "We do not otherwise accept
reservations" re-verified. Operated by the Long Now Foundation.
**Do not write** the page's pulled review quote "the only-in-San Francisco Long Now futurist
society" — a ranking, and attribution does not rescue it.

**#29 Magic Theatre — REWRITE, then PUBLISH identity and address only.** `theater`. Fort Mason
Center for Arts & Culture, Landmark Building D, 2 Marina Boulevard, San Francisco, CA 94123.
**DROP the 1967 founding year** — own site; the finder's ruling is correct.
**Also do not write** "Among the first arts organizations to make a home at Fort Mason", which is
on the same page and is a ranking.

**#30 Museo Italo Americano — DROP.** The finder obtained an OSM address and nothing else: no
hours, no admission, no founding, no description. A place with one datum is not a place.

**#31 BATS Improv, #32 Southside Theater, #33 Young Performers Theatre, #34 San Francisco
Children's Art Center — DROP, all four.** OSM nodes with, in the finder's own words, "no detail
sourced beyond the OSM node".

**#35 Maritime Research Center — DROP from this zone; escalate.** NRHP 01000281 carries the
incoherent date described in §1b, so nothing datable publishes. Beyond that it is the library of
San Francisco Maritime National Historical Park, whose visitor material is Fisherman's Wharf's.
Not the Marina's to write.

**#36 Fort Mason Chapel — DROP.** OSM `place_of_worship` node, no independent source. Sitting
inside the NRHP 72000109 boundary does not make the chapel itself a listed thing, and writing it
that way would be exactly the "eligible versus listed" error §1c guards against.

**#37 Black Point Fortifications — REWRITE UPWARD, then PUBLISH.** `historic-site`.
The finder wrote "What survives on the ground is NOT sourced." **It is sourced, on the page the
finder already cited.** Wikipedia's Fort Mason article, re-fetched:
> A breast-high wall of brick and mounts for six 10-inch Rodman cannons and six 42-pounder guns
> were built on the site. Excavation in the early 1980s uncovered the well-preserved remains of
> the western-half of the temporary battery, and it has now been restored to its condition during
> the Civil War.
Both sentences publish. This is the strongest Fort Mason find after the post itself and the finder
left it half-written.

**#38 The Great Meadow — DROP.** Re-checked against the NPS Fort Mason page and the Wikipedia
Fort Mason article: "Great Meadow" appears on neither. The brief named it; no source carries it.
The page simply does not list it — it does not remark on its absence.

**#39 Phillip Burton statue — DROP.** "Phillip Burton" appears nowhere on the Wikipedia article.
OSM artwork node only, sculptor unestablished, and photo-blocked besides.

**#40 Fort Mason Farmers' Market, #42 San Francisco Sea Scout Base, #43 Black Point Pier — DROP,
all three.** OSM only.

**#41 SS Jeremiah O'Brien — DROP from the Marina; escalate away.**
This is the finder's largest single misreading, and it runs in the opposite direction to the
caution it wrote. Wikipedia's NRHP infobox gives `location = Pier 35, San Francisco`, and the
lead photograph is captioned "SS Jeremiah O'Brien at its **former** berth at Pier 45". So Pier 45
is the old berth, Pier 35 is the current one, and "Pier 3, Fort Mason Center" is the address the
register froze in 1978. None of the three is the Marina today. The finder's instruction not to
publish a berth was right; its inference that the ship might therefore be the Marina's was not.
Escalated to the arbitrator as Fisherman's Wharf or the Embarcadero. See also Correction 1, §1b.

**#45 Goody Cafe, Equator Coffees, Radhaus — DROP, all three.** The finder's own note is
disqualifying: "identity, address and hours would publish, **none fetched in detail**." A
candidate whose sources were never opened is not a candidate. Any of the three could be recovered
by a later wave that actually fetches them.

### 4c. Cow Hollow / Union Street straddlers

Pacific Heights' finder concedes most of this block in writing — its §, listing what is "Marina's,
on the official reading", names Octagon House, Sherman House, Burr House, Metro Theater, Golden
Gate Valley Carnegie Library and North End Police Station. It then contradicts itself by claiming
Burr House and Golden Gate Valley back in its §5b table. Those two, and only those two, escalate.
Union Street and Cow Hollow are not rostered zones, so everything else in this block falls to the
Marina by default.

**#46 Colonial Dames Octagon House — PUBLISH.** `museum`. 2645 Gough Street. LM 17 (1969) and
NRHP 72000250 (23 February 1972, as "McElroy Octagon House") both re-verified. Two registers, two
identifiers, and the neighbour concedes it. The strongest straddler in the zone, as the finder
said.

**#47 Metro Theater — REWRITE, then PUBLISH the landmark only.** `theater`. 2055 Union Street.
LM 261 (2009) re-verified. The Wikipedia article for it returns 404, so **write no current use and
no closure date.** Pacific Heights' file mentions a 2017 closure; that is its source to defend,
not this page's.

**#48 Sherman House — REWRITE, then PUBLISH the landmark only.** `historic-site`. 2160 Green
Street. LM 49 (1972) re-verified. **DROP "a hotel historically"** — unsourced in the finder's
file and not in the register row.

**#49 North End Police Station and Garage — PUBLISH.** `historic-site`. 2475 Greenwich Street.
LM 218 (1996) re-verified. Current use stays unwritten, as the finder said.

**#50 Golden Gate Valley Carnegie Library — ESCALATE.** `attraction`. 1801 Green Street. LM 300
(2022) re-verified. AN=Marina, SF Find=Pacific Heights, and Pacific Heights both concedes it and
claims it in the same file. Not counted in the surviving 25.

**#51 Burr House — ESCALATE.** `historic-site`. 1772 Vallejo Street. LM 31 (1970) and NRHP
14000967 (8 June 2015) both re-verified. AN=Marina, SF Find=Pacific Heights, actively claimed by
Pacific Heights. Not counted in the surviving 25.

**#52 Allyne Park — PUBLISH.** `park`. 2609 Gough Street. Rec & Park property 131 re-verified:
0.88 acres, "Neighborhood Park or Playground", complex "Marina Complex",
`analysis_neighborhood: "Marina"`. Pacific Heights concedes it.

**#53 Cow Hollow Playground — PUBLISH.** `park`. 1 Miley Street. Rec & Park property 110
re-verified: 0.15 acres, "Mini Park", complex "Marina Complex", `analysis_neighborhood: "Marina"`.
The name is not evidence; the city's own attribute is. Write the park, not the argument about it.

**#54 Liverpool Lil's, #55 Balboa Cafe, #56 Perry's — DROP, all three.** An OSM address and an
unfetched own-site URL, three times over. The finder correctly ruled that no founding year
publishes for any of them, which leaves nothing at all.

### 4d. Chestnut Street commercial

**#57 Lucca Delicatessen — REWRITE, then PUBLISH, reduced.** `shop`.
- **DROP the founding year.** I fetched the site: it reads "Three generations strong ~ Authentic
  Italian goodness since 1929". That is a trading-duration claim on the business's own page and it
  does not publish, exactly as the finder ruled. No third-party source was found for it and I did
  not find one either.
- **The finder missed what does publish.** The same page gives the address **2120 Chestnut
  Street** and hours **open daily 9am–6pm**, telephone 415-921-7873. Identity, location and hours
  from a place's own site are publishable. Write those.
- **Caution for the author:** that page also carries injected spam text about counterfeit
  handbags, so the site is compromised. The address is independently corroborated by OSM; take
  the address and hours and nothing else, and do not quote the page.

**#58 Books Inc., Marina — DROP.** `booksinc.net/SFMarina` returns 404 on re-fetch. The finder
listed it as a live URL without opening it.

**The 23 remaining Chestnut Street addresses and the six Lombard Street motels — DROP as a class.**
The finder recorded them honestly as "sourced only to OSM addresses … none was individually
fetched". An address list is a research lead, not a candidate list. If the guide needs more food
entries, a later pass fetches them properly; it does not promote them on the strength of a map tag.

---

## 5. STRADDLERS ESCALATED TO THE ARBITRATOR

1. **Golden Gate Valley Carnegie Library, LM 300 (#50)** and **Burr House, LM 31 / NRHP 14000967
   (#51).** AN=Marina, SF Find=Pacific Heights. Pacific Heights' finder lists both as "Marina's,
   on the official reading" in one section and claims both in its §5b table. Its file cannot be
   read as a concession. **Hard collision with a rostered zone; the arbitrator rules.**

2. **The Fort Mason block (#18–#20, #23, #27–#29, #37).** Downgraded from the finder's framing.
   Fisherman's Wharf's finder explicitly releases it to the Marina, so the SF Find "Aquatic Park /
   Ft. Mason" polygon is not evidence of a live contest. What remains for the arbitrator is
   narrower and purely a matter of principle: **Fort Mason is GGNRA land under NPS administration,
   which is the same argument the roster used to give the Presidio its own page.** Fort Mason is
   not on the roster as a page. If the arbitrator applies the Presidio principle consistently, the
   block belongs to nobody; if it applies the roster as written, it is the Marina's. **I rule it
   provisionally Marina and note that the tier survives either way** — 25 places with it, 17
   without.

3. **SS Jeremiah O'Brien (#41), escalated away from the Marina.** Wikipedia's infobox gives the
   present berth as Pier 35 and captions Pier 45 as the former berth; the register's "Pier 3,
   Fort Mason Center" is the 1978 address. Fisherman's Wharf or the Embarcadero, not here.
   Whoever takes it must separate the NRHP listing (7 June 1978) from the NHL designation
   (14 January 1986).

4. **Maritime Research Center (#35), escalated away.** The library of San Francisco Maritime
   National Historical Park. Fisherman's Wharf's material, and NRHP 01000281 carries no publishable
   date.

5. **Palace of Fine Arts grounds (#1), noted not escalated.** The building is Marina on both
   polygon layers; Rec & Park property 111 spans "Marina, Presidio". The Marina writes the
   building. The Presidio page should be told the parcel crosses the line.

---

## 6. WHAT THE FINDER GOT WRONG

In order of consequence.

1. **SS Jeremiah O'Brien.** Called it a straddler that might be the Marina's; the present berth is
   Pier 35 and Pier 45 is the former one. Also conflated the 1978 NRHP listing with the 1986 NHL
   designation.
2. **Three claims that a source could not be read, all of which read fine on re-fetch.** SFPL's
   Marina hours ("JavaScript-rendered", they are in the HTML); Marina Green's street address
   ("no street address is published in either dataset", it is `1 Marina Green Dr`); accession
   2002.9's title ("truncated in the API response", it returns in full). Each of these cost the
   page a publishable fact, and each was a claim about the research rather than about the world.
3. **Two figures attributed to a page that does not carry them** — the Port of Embarkation's
   6 May 1932 establishment and its 1.6 million passengers and 23 million tons of cargo.
4. **An invented count** — "three of the Black Point houses" where the NPS names two.
5. **A mailing address published as a street address** — 201 Fort Mason is GGNRA's mailbox.
6. **Under-research on its own best material.** The Black Point battery's survival is on the page
   it already cited. So are the Loma Prieta liquefaction, the landfill, the 1976 Ford–Carter
   debate, the PPIE's dates and attendance, the Herbst Pavilion, and the Punta Medanos name
   origin. The finder cited these pages and then did not read down them.
7. **Nine candidates admitted as unfetched and listed anyway** (#30, #45 ×3, #54, #55, #56, #58,
   plus the 23-address Chestnut list). Recording a lead is useful; numbering it as a candidate
   inflates the zone.
8. **One over-cautious drop** — Fort Mason Center's 1976 founding, which Wikipedia carries
   independently of the operator and which therefore publishes.

**What it got right, and it matters.** All ten Article 10 numbers and all nine NRHP reference
numbers survived independent re-fetching with their registers, addresses and dates intact. The
seven "Eligible, not listed" districts are verified exactly and are the sharpest piece of research
in the file. Every boundary assignment in its straddle tables reproduces under point-in-polygon
testing. And its own-site discipline — refusing founding years for Greens, Magic Theatre, Lucca,
Balboa and Perry's — was applied consistently and correctly every time.
