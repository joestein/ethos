# The Presidio, San Francisco — VERDICTS

Zone slug `presidio`. Adjudicated 2026-09-03. Verifier agent, ruling on `presidio-finder.md`.

**Counts.** 68 rows considered (66 numbered candidates + 2 held hotels).
**18 PUBLISH · 16 REWRITE · 33 DROP · 1 reclassified as the guide subject rather than a place.**
**Surviving place rows: 32 firm, 34 if both awardable straddlers land.**

**Tier: GUIDE.** The finder's town-page recommendation is overruled. See §3.

---

## 1. RE-FETCH LOG

Seventeen live fetches. Every designation number the finder claims was re-read off the register;
the five sources it leaned on hardest were re-read against its quotations.

### 1.1 All three designation numbers survive, exactly as written

| Ref | RESNAME (live) | CertDate (live) | Is_NHL | Verdict |
|---|---|---|---|---|
| **66000232** | "Presidio Chapel" | **10/15/66** | **X** | number, date and NHL flag CONFIRMED |
| **70000146** | "Fort Point National Historic Site" | **10/16/70** | null | CONFIRMED |
| **79000255** | "Six-Inch Rifled Gun No. 9" | **02/07/79** | null | CONFIRMED; `Address` = "Baker Beach" |

Wave 1 caught a wrong certification date this way. This zone has none. All three publish.

**The "Presidio Chapel" trap is real and the finder's §8.3 warning is upheld.** Reference 66000232
returns `RESNAME "Presidio Chapel"` and `ResType building` while simultaneously carrying
`NumCBldg 477`, `NumCStru 166`, `NumCSite 11`, `NumCObj 8` and `Is_NHL X`. It is the district.
Any row reading "Presidio Chapel, NRHP 66000232" is a defect that would pass the regex. The Post
Interfaith Chapel is dropped at §5 partly for this reason.

Those four contributing-resource figures are the banned tally. They appear in this file for the
writer's protection and must not reach prose as a number, as "hundreds of", or as any paraphrase.

**One narrowing on the NHL date.** `nps.gov/prsf/learn/historyculture/index.htm` was re-read and
states verbatim: *"In 1962, the Presidio was designated a National Historic Landmark."* The
**year publishes.** The finder's exact day, **06/13/62, came from the NHL-by-state list, which was
not re-fetched here — the day does not publish** until someone reads it off that list again. Write
the year.

### 1.2 Article 10 — the structural finding is upheld

Zero Article 10 landmarks in the Presidio. This is what federal land looks like: the city ordinance
does not reach it. The workhorse "San Francisco Landmark No. N" citation is genuinely unavailable
in this zone, and a writer who produces one has invented it.

### 1.3 The five heaviest sources, re-read against the finder's quotations

| Source | Result |
|---|---|
| NPS Battery Chamberlin | 1904 / four six-inch / disappearing carriages / 1920 barbette / 11AM–3PM first full weekend — all CONFIRMED. **Gun sentence misquoted, see §4.3.** |
| FOR-SITE Goldsworthy | Spire 2008, 37 Monterey cypress, 15-foot diameter, "more than 90 feet" CONFIRMED. Tree Fall 2013, Building 95, "Closed until further notice" CONFIRMED. **Earth Wall absent CONFIRMED. Wood Line grove species WRONG, see §4.2.** |
| NPS San Francisco National Cemetery | General Order 133, 1854, 1932, 28.34 acres, VA maintenance — all CONFIRMED verbatim. Both hazards real. |
| NPS Presidio Officers' Club | 1790s adobe, ~1847, 1885 Moraga room, 1930s WPA, early-1970s tower — all CONFIRMED. **"One of San Francisco's oldest buildings" present; excise.** |
| presidio.gov Presidio Visitor Center | 210 Lincoln Blvd, 3D model, touch screens, wall-sized display, interactive table, English/Spanish/Chinese, audio tour, Braille, Transit Center restrooms — all CONFIRMED. |

Also re-fetched and confirmed: Parks Conservancy Crissy Field (May 2001; "in earnest in 1994";
Building 603); NPS Crissy Field (racetrack outline, 1921 Hap Arnold, Douglas O-25 1930);
presidiotheatre.org (1939 WPA, *Maverick* 28 August 1994, 2017–2019 excavation and proscenium,
September 2019); goldengate.org stats (8,981 ft / 4,200 ft / 746 ft / 62 ft, all verbatim);
NPS Fort Point history and hours; NPS pet cemetery; presidio.gov Rob Hill, golf course,
self-guided-adventures.

---

## 2. PRE-FLIGHT — the finder's critique is correct and its table reproduces

`taken_slugs.py` globs `priv/seed_data/rome/*.json` only. Its Presidio result is worthless, exactly
as the finder said. An independent pass over all 468 places in `priv/seed_data/san_francisco/*.json`
returns the finder's table unchanged:

* `lyon-street-steps-pacific-heights` — **TAKEN.** Correctly already dropped.
* `presidio-library-mini-park-pacific-heights` — name collision only, not the Presidio.
* Fort Mason cluster (9 rows incl. `port-of-embarkation-fort-mason-marina`) — **marina's.** Not claimed here. Correct.
* Zero hits corpus-wide for crissy, goldsworthy, disney, letterman, marshall, chapel, battery, cemetery, mountain, lobos.

No surviving row collides with a shipped zone or with the seven Oracle Park code-seed places.

---

## 3. TIER RULING — **GUIDE**, and the finder is overruled

The finder ruled town-page on editorial grounds: no high street, no continuous frontage, named
places two and three miles apart. **That reasoning is sound and irrelevant.** `tier` is a size
class, not a shape class, and the gate says so numerically:

```
guide["tier"] == "town-page" and places >= 6 ->
  {file, "tier town-page carries #{places} places; the form is for fewer than six"}
```

A town-page is **under six places**, with a 90-word intro floor and two links. **Thirty-two rows
survive this adjudication.** A town-page label on this file fails the build on the first assertion
it meets, and the gate's own comment records that wave 1 produced two files marked town-page
carrying 41 and 26 places. The finder recommended the identical defect.

**Ruling: `tier: "guide"`.** It clears every floor comfortably — 32 places against a minimum of 4.
The writer owes an intro of **100–160 words**, **4–6 FAQ entries**, and a section headed **exactly
`Getting there`**, which is where the shuttle, the three-district geography and the parking belong.
Nothing in the guide form requires asserting a walking order, so the finder's real worry is
answered by writing the guide by district rather than by demoting the tier.

---

## 4. WHAT THE FINDER GOT WRONG

### 4.1 Every `kind` in the file is a suggestion, and most are invalid
`Ethos.Places.Place.kinds/0` allows exactly thirteen:
`museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction`.

The finder used roughly twenty-two kinds that do not exist — `nature-site`, `beach`, `viewpoint`,
`artwork`, `cemetery`, `memorial`, `pier`, `trail`, `bridge`, `visitor-center`, `visitor-facility`,
`campground`, `golf-course`, `church`, `square`, `street`, `playground`, `transport`,
`events-venue`, `picnic-area`, `office-campus`, `shop-cafe` — and spelled **`theatre`** for
Presidio Theatre where the schema wants **`theater`**. Rome shipped three places with an invented
kind and the changeset rejected them at seed time, surfacing in unrelated suites. Kind assignments
for every surviving row are given in §5.

### 4.2 *Wood Line* stands in a **eucalyptus** grove, not a cypress grove
The finder's address column reads "In the cypress grove near the intersection of Presidio Boulevard
and West Pacific Avenue". FOR-SITE, re-fetched twice including once targeted at this exact
question, reads: *"Wood Line (2011) is made from eucalyptus branches laid out in a sloping, sinuous
curve through a standing eucalyptus grove near Lovers' Lane."* **Eucalyptus branches through a
eucalyptus grove.** The finder's own What column says eucalyptus branches, so the file contradicts
itself one column over. Corrected wording in §5.

### 4.3 Three quotations contain paraphrase inside quotation marks
* **Battery Chamberlin.** Finder: *"A Six-Inch Rifle Gun Number Nine was received in 1977 from the Smithsonian Institution and installed at gun emplacement Number Four."* NPS actually reads: *"In 1977, the National Park Service received the Six-Inch Rifle Gun Number Nine and disappearing carriage…from the Smithsonian Institution. The gun and carriage were installed at gun emplacement Number Four at Battery Chamberlin."* The **carriage came with the gun** and the finder lost it.
* **Presidio Visitor Center.** Finder: *"open daily from 10 a.m. to 5 p.m."* Source: *"Open every day from 10 a.m. to 5 p.m."*
* **Pet cemetery caretaker.** NPS introduces it as ***"Legend has it that*** an anonymous former Navy man became the unofficial caretaker". The finder dropped the hedge and rendered a legend as an event.

### 4.4 Mountain Lake Park's claimant exists and is in this wave
The finder writes that Mountain Lake Park "may belong to a Richmond zone that does not exist in
this wave." **`inner-richmond` is in scope in `san_francisco_roster.json` and has a finder file in
this wave**, and its roster draw explicitly names the "Presidio Heights edge". The park tests
`A=Inner Richmond` on the finder's own points. Escalated to the arbitrator as a live contest, not
as an orphan.

### 4.5 The Warming Hut's number was already in a source the finder cited
The finder wrote "Building number (983) is commonly cited and was NOT confirmed — do not publish
it." The Parks Conservancy page it cites for the Warming Hut carries **"983 Marine Drive"** as the
street address. The caution was right in kind and wrong in fact: publish it as an **address**, never
as a building number.

### 4.6 The Golden Gate Bridge opening date is not on the page cited for it
"Opened 27 May 1937" is attributed to goldengate.org's design-construction stats page. Re-fetched:
that page gives the four measurements verbatim and **no opening date** — it references 1937 and an
"Opening Fiesta Week" only. The measurements publish; **the 27 May date does not publish from this
citation.**

### 4.7 Three banned superlatives sit unflagged in sources the finder quoted
The finder flagged five hazards well and missed three:
* **Fort Point** — *"the only fortification of this impressive design constructed west of the Mississippi River."*
* **NPS Presidio history** — *"the **northernmost** outpost of their empire"*. This one is live ammunition: `~r/\b(?:southern|northern|eastern|western)most\b/i` fires on it directly.
* **presidio.gov self-guided adventures** — *"the largest collection of works by artist Andy Goldsworthy on public view in North America."*

### 4.8 Credit where it is owed
The `taken_slugs.py` critique, the "Presidio Chapel" trap, the blanket refusal of every CHL number,
the refusal of the golf course's 1895, the refusal to tally the batteries or the contributing
resources, and the correct observation that no Article 10 citation exists in this zone are all
upheld on re-fetch. The bare-name standard the finder articulated for the batteries — *"a row that
is only a name is not a place a guide can write about"* — is the right standard. §5 applies it
uniformly, which the finder did not.

---

## 5. THE RULINGS

### 5.1 PUBLISH — 18

Ships with the finder's facts intact, after the excisions named.

| # | Name | `kind` | Note |
|---|---|---|---|
| 1 | Fort Point | `historic-site` | NRHP 70000146, listed 16 October 1970. Built 1853–1861, Third System, U.S. Army Engineers. Open Thursday–Monday 10:00am–5:00pm; roof access closes 4:30pm; closed Thanksgiving, Christmas, New Year's Day. Strauss's arch carried the bridge over it. **EXCISE the "only fortification…west of the Mississippi" superlative.** |
| 4 | Crissy Field | `park` | Racetrack outline; plan approved 1921 under Henry "Hap" Arnold; Douglas O-25 replaced the De Havillands in 1930; opened to the public May 2001; planning and fundraising "in earnest in 1994". **EXCISE "the military's first Air Coast Defense Station on the Pacific coast."** |
| 7 | Crissy Field Center | `attraction` | Building 603 along Mason St. Verbatim and confirmed. |
| 13 | Presidio Visitor Center | `attraction` | 210 Lincoln Boulevard. "Open every day from 10 a.m. to 5 p.m.", closed Thanksgiving, Christmas, New Year's Day. 3D model, touch screens, wall-sized display, interactive table; maps in English, Spanish and Chinese; audio tour and Braille brochures; restrooms next door in the Transit Center. |
| 19 | Golden Gate Bridge Welcome Center | `attraction` | 9 a.m.–6 p.m. seven days, except Thanksgiving and Christmas. Rivets, hard hats, a 12-foot stainless steel test tower from 1933. |
| 25 | Spire | `attraction` | 2008. 37 Monterey cypress trunks felled in the reforestation; 15-foot diameter; rises more than 90 feet. Bay Area Ridge Trail near the Arguello Gate. **Photo wave: blocked. Say nothing about why.** |
| 29 | Presidio Officers' Club | `historic-site` | 50 Moraga Avenue. Adobe walls dating to the 1790s; first rebuilt around 1847; Moraga room completed 1885; 1930s WPA remodelling; tower added in the early 1970s. Heritage exhibitions Friday–Sunday 11 a.m.–4 p.m., no ticket. **EXCISE "One of San Francisco's oldest buildings."** |
| 30 | Old Post Hospital | `historic-site` | 1864, Italianate and Greek Revival; octagonal surgical tower 1897; Presidio Army Museum 1974 to February 2000. |
| 31 | Golden Gate Club | `attraction` | Dedicated 1949 as a service club for enlisted personnel; Spanish Colonial Revival. |
| 32 | Presidio Theatre | **`theater`** | 99 Moraga Avenue. Built 1939 by the U.S. Army with WPA funding; last film *Maverick*, 28 August 1994; excavation doubled usable space and the proscenium arch moved forward, 2017–2019; reopened September 2019. **Kind corrected from `theatre`.** |
| 40 | San Francisco National Cemetery | `historic-site` | General Order 133; first known American burial 1854; under the Quartermaster General from 1884; final expansion 1932 to 28.34 acres; maintained by the Department of Veterans Affairs. **EXCISE "the first National Cemetery on the west coast" and the 30,000 figure** — the first is a ranking, the second is a live number that grows. |
| 42 | World War II West Coast Memorial | `historic-site` | Dedicated 29 November 1960. A curved wall of California granite in a grove of Monterey pine and cypress; 413 names of those lost or buried at sea in U.S. Pacific waters, 1941–1945; Columbia by Jean de Marco. |
| 43 | Fort Winfield Scott | `historic-site` | Established 19 June 1912 as a coast artillery post. Seventeen Endicott-era gun batteries constructed, armed and manned between 1891 and 1946 — **this is NPS's count of what the Army built and publishes as such; a count of what survives does not.** |
| 44 | Battery East | `historic-site` | Construction began 1873; 8-inch rifled Rodman cannon during the Spanish-American War, 1898; earthworks and brick-lined magazines still standing. |
| 45 | Battery West | `historic-site` | Completed by 1873 with twelve 15-inch Rodman cannon; almost completely destroyed during 1890s Endicott construction. |
| 57 | Lobos Creek Valley | `park` | A flume from the creek supplied the town in its early days; coastal-scrub restoration ongoing. |
| 61 | Lovers' Lane | `attraction` | A one-mile walk. Crosses a brick footbridge over the creek running down Tennessee Hollow from El Polín. Soldiers used it to reach the trolley line from the late 1800s. **EXCISE "One of the oldest foot trails in the Presidio" and the source's "easy".** |
| 63 | The Walt Disney Family Museum | `museum` | 104 Montgomery Street. Thu–Sun 10am–5:30pm, last entry 4:30pm; extended Monday hours Memorial Day to Labor Day. Founding year correctly withheld — **do not restore it.** |
| 66 | Rob Hill Campground | `attraction` | 1475 Central Magazine Road. Four group campsites, maximum 30 people per site. Tent camping 1 April to 31 October; day-use picnicking November to March. Monarchs overwintering in the eucalyptus per Army records. **EXCISE "one of just two campgrounds in San Francisco"** — the regex misses it and the rule still binds. |

### 5.2 REWRITE — 16

| # | Name | `kind` | Replacement wording |
|---|---|---|---|
| 3 | Battery Chamberlin | `historic-site` | "Completed and armed in 1904 with four six-inch guns on disappearing carriages, and modified in 1920 to take two six-inch guns on simple barbette carriages. In 1977 the National Park Service received Six-Inch Rifled Gun No. 9 and its disappearing carriage from the Smithsonian Institution, and installed them at gun emplacement Number Four. The gun is listed on the National Register of Historic Places, reference number 79000255, certified 7 February 1979. Loading demonstrations run 11AM–3PM on the first full weekend of the month." |
| 5 | Crissy Field Marsh | `park` | "A tidal marsh restored on the east side of the former airfield." **No size and no completion date** — none is sourced. Ships only because it holds a dedicated NPS page. |
| 8 | Warming Hut | `cafe` | Address **983 Marine Drive** — an address, not a building number. "A park store and café at the west end of Crissy Field, serving tea, hot chocolate and Equator Coffee." |
| 12 | Presidio Tunnel Tops | `park` | 210 Lincoln Boulevard. "A landscape built over the Presidio Parkway tunnels. Its named grounds include the Outpost, the Field Station, Outpost Meadow Picnic Area, Picnic Place, East Meadow and West Lawn." **No opening date, no acreage, no landscape architect** — none is sourced. |
| 14/15/16/17 | Outpost, Field Station, Transit Center, Main Parade Lawn | — | **Folded into #12 and #13 as named grounds, not carried as rows.** See §5.3. |
| 26 | Wood Line | `attraction` | "2011. Eucalyptus branches laid in a sloping, sinuous curve through a standing **eucalyptus** grove near Lovers' Lane, by the intersection of Presidio Boulevard and West Pacific Avenue." **"Cypress grove" is wrong and must not ship.** |
| 27 | Tree Fall | `attraction` | "2013. A eucalyptus felled for the Presidio Parkway project, worked with clay drawn from the surrounding land, in the vault of the Powder Magazine, Building 95, on the Main Post." Source says **"Closed until further notice"**; set `status: "closed"` and let the field carry it. Do not narrate the closure in prose. |
| 41 | Presidio Pet Cemetery | `historic-site` | "Grave markers date back to the 1950s, when about 2,000 army families lived at the Presidio. The cemetery is officially closed to new interments. The Presidio Parkway viaduct towers over it." **DROP the construction-closure sentence entirely** — the page is stale and a stale closure reads as a fact about the place. **DROP the anonymous caretaker** or carry the source's "Legend has it" hedge intact; do not render a legend as an event. |
| 53 | Baker Beach | `park` | "A strand below the coastal bluffs of the western Presidio, with Battery Chamberlin at its north end." **STRADDLER — §6.2.** |
| 55 | Mountain Lake | `park` | "The campsite of the Anza settlement party in 1776, and a source of fresh water for San Francisco in the town's early years. Much of the shoreline was buried in the 1930s for a freeway approach to the Golden Gate Bridge. Ducks and waterfowl shelter among the tule reeds." **DROP "lies nearly hidden at the southern edge of the Presidio"** — banned orientation by impression, correctly flagged by the finder. **STRADDLER — §6.3.** |
| 58 | El Polín Spring | `park` | "A spring at the head of Tennessee Hollow. The creek running from it passes under the brick footbridge on Lovers' Lane." Thin, and ships only on that adjacency. |
| 59 | Presidio Forest | `attraction` | "The Army planted the Presidio's hills with pine, cypress and eucalyptus from the 1880s through the 1940s, to make the ground appear larger with more relief, to limit visibility within the post, and to beautify it." |
| 64 | Letterman Complex | `historic-site` | **Recast from "Letterman Digital Arts Center", which has no sourced facts of its own.** Ships as the hospital site: "Letterman General Hospital was built between 1899 and 1902 and renamed for the Union Army's Surgeon General in 1911. It treated soldiers returning from the Philippines, admitted injured civilians after the 1906 earthquake, and cared for more than 18,000 soldiers returning from World War I." Address 1 Letterman Drive. **No demolition date and no campus opening date** — neither is sourced, so neither ships. |
| 65 | Presidio Golf Course | `attraction` | "An 18-hole public golf course at 300 Finley Rd. The clubhouse takes gatherings from twelve to 200 people." **The 1895 date does not publish** — it is a founding year on the operator's own page, and the sentence carrying it also carries "one of the oldest courses on the West Coast". The finder's ruling is upheld on re-fetch. |
| — | Inn at the Presidio | `hotel` | 42 Moraga Avenue. "The Inn has 22 rooms, 17 of which are suites with gas fireplaces and sleeper sofas." **DROP "a former home to unmarried Army officers"** — a historical claim about the building sourced only to the business trading in it. |
| — | Lodge at the Presidio | `hotel` | Ships as name, `kind`, and address 105 Montgomery Street only. **"Among the registered Historic Hotels of America" does not publish** — a membership programme is not a register with an identifier, and the finder is right. No room count, no army use, no opening date is sourced. |

### 5.3 DROP — 33

**Bare names.** The finder's own standard, applied uniformly: a row that is only a name and a
point-in-polygon test is not a place a guide can write about.

`#6 Crissy Field East Beach` · `#9 Torpedo Wharf` · `#10 West Bluff Picnic Area` ·
`#11 Quartermaster Reach` (no source at all) · `#14 The Outpost` · `#15 Presidio Field Station` ·
`#16 Presidio Transit Center` · `#17 Main Parade Lawn` · `#20 Golden Gate Overlook` ·
`#21 Battery East Vista` · `#22 Pacific Overlook` · `#23 Immigrant Point Overlook` ·
`#24 Inspiration Point Overlook` · `#33 Pershing Square` · `#34 Montgomery Street Barracks` ·
`#35 Funston Avenue Officers' Quarters` · `#36 The Alameda` · `#37 Presidio Fire Station` ·
`#54 Marshall's Beach` · `#60 Presidio Coastal Bluffs` · `#62 Batteries to Bluffs Trail`
(the Trust publishes no length).

Numbers 14, 15, 16 and 17 survive as **named grounds inside** Presidio Tunnel Tops and the Visitor
Center rows, which is what the sources actually establish them as.

**The seven named-only batteries** — `#46 Godfrey`, `#47 Crosby`, `#48 Boutelle`,
`#49 Marcus Miller`, `#50 Cranston`, `#51 Dynamite`, `#52 Saffold`. The index page carries names
only. Batteries East, West and Chamberlin have dates and survive; these do not. **Do not tally
what remains.**

**Dropped on the rules, not on thinness:**

* **`#38 Post Interfaith Chapel`.** Nothing sourced beyond the name, its own page 404s, and it
  shares a word with the `RESNAME` on reference 66000232. The most dangerous row in the file.
* **`#39 Powder Magazine (Building 95)`.** Ships as *Tree Fall*'s location inside #27, not as a row.
* **`#28 Earth Wall`.** DROP. FOR-SITE carries no entry, and the Officers' Club page does not
  mention it; only a list on presidio.gov names it. The commonly cited year 2014 is unsourced and
  must not be written. The finder's own framing — ship it bare or not at all — resolves against it.
* **`#18 Golden Gate Bridge`.** DROP as a place row; **§6.1.**
* **`#56 Mountain Lake Park`.** DROP from `presidio`; **escalated to `inner-richmond`, §6.4.**
* **`#2 Presidio of San Francisco`.** Not a drop — **reclassified as the guide subject.** The NHL
  and the district listing belong in the guide intro: "The Presidio was designated a National
  Historic Landmark in 1962 and is listed on the National Register of Historic Places, reference
  number 66000232, certified 15 October 1966." Founded 1776; *"For 218 years, the Presidio served
  as an army post for three nations"* (`nps.gov/prsf/index.htm`, re-fetched and confirmed there —
  **not** on the history page the finder co-cited, which gives 148 years for the U.S. Army alone;
  do not mix them). **Do not restore the finder's "(1776 + 218 = 1994)" arithmetic** — quote the
  218 years or give 1776 and 1994 as dates, not a subtraction.

---

## 6. STRADDLERS ESCALATED TO THE ARBITRATOR — six

1. **Golden Gate Bridge.** South tower and toll plaza test Presidio in both layers; midspan and
   north tower are in Marin County. **Recommend: no zone carries the span as a place row.** No
   other zone in this wave competes, but a place row asserts containment the geometry refuses. The
   bridge stays present in prose through Fort Point's arch and through the Welcome Center, which is
   unambiguously Presidio and ships. Verified measurements (8,981 ft total, 4,200 ft main span,
   746 ft towers, 62 ft roadway) publish wherever it is written about. **The 27 May 1937 opening
   date does not publish on the finder's citation — §4.6.** It is not on the National Register.

2. **Baker Beach's south end.** Beach and Battery Chamberlin test Presidio in both layers; the
   Lobos Creek mouth tests `Seacliff` in both. **Recommend: award to `presidio`.** Seacliff appears
   in neither the roster's in-scope zones nor its declined list, so no competing claimant exists,
   and the register address of Six-Inch Rifled Gun No. 9 is literally "Baker Beach".

3. **Mountain Lake (the water).** The one place the two layers disagree. Water tests Presidio in
   both at three points; NPS administers it. **Recommend: award to `presidio`.**

4. **Mountain Lake Park (the park).** Playground tests `A=Inner Richmond`, tennis courts test
   `Inner Richmond` in both. **Recommend: award to `inner-richmond`, which is in scope and has a
   finder in this wave** — the finder wrongly believed no claimant existed (§4.4). The arbitrator
   should rule the lake and the park as **two places**, which is what both layers and the
   administering agencies say.

5. **Julius Kahn Playground and Presidio Wall Playground.** Both test `Presidio Heights` in both
   layers. Presidio Heights is not a roster zone; `inner-richmond`'s draw names the "Presidio
   Heights edge". **Recommend: neither ships in `presidio`; escalate to `inner-richmond`.** The
   physical adjacency to the Presidio wall is real and is not a claim of containment.

6. **Waybur, Julian, House**, 3232 Pacific Ave, NRHP 11000143. `A=Presidio, B=Presidio Heights`, on
   a Pacific Avenue address. **Recommend: a boundary artifact; claimed by nobody as a Presidio
   building.** Agreed with the finder, and recorded so a later pass does not "discover" it.

**Fort Mason** is not escalated. It is `marina`'s in nine rows including the Port of Embarkation
NHL, it is not claimed here, and it is not contested.

---

## 7. STANDING PROHIBITIONS FOR THE WRITER

* **No California Historical Landmark number may ship.** Not one was confirmed against a live
  register. Three obvious candidates sit in this zone and the temptation to fill the gap from
  memory is exactly the failure wave 1's re-fetch caught. Upheld without qualification.
* **No count of landmarks, designations or surviving batteries.** NPS's "seventeen Endicott-era
  batteries built between 1891 and 1946" is a sourced fact about what the Army constructed and
  publishes as one. The 477/166/11/8 contributing-resource figures on reference 66000232 do not
  publish in any form, including "hundreds of".
* **`"photos": []` everywhere.** The Goldsworthy works are written about freely. Nothing about why
  they carry no photograph reaches the page — not as copyright reasoning, not as a description of
  a rule, not at all.
* **No trip durations between districts.** Fort Point to Baker Beach is not a walk and the page
  must not say how long anything takes. The `Getting there` section carries the shuttle and the
  transit, which are facts.
