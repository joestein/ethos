# The Presidio, San Francisco — FINDER

Zone slug `presidio`. Research date 2026-09-03. Author: finder agent.
**Nothing here is a shipping decision.** The verifier adjudicates each candidate; the arbitrator
rules ownership across all eleven zones with all eleven files in front of it.

---

## 0. PRE-FLIGHT

`python3 .superpowers/taken_slugs.py` was run. Its glob is `priv/seed_data/rome/*.json` only, so it
does not see San Francisco at all — it reported 468 places across 31 Rome files and zero matches for
`presidio`, `crissy` or `fort`. **That result is worthless for this zone.** The check was redone
directly against `priv/seed_data/san_francisco/*.json` (12 files, 468 places):

    python3 -c "import json,glob,io; ..."   # full loop in §7

Result: **no Presidio place is owned by a shipped file**, with one exception and one near-miss.

| Term | Owned by | Slug |
|---|---|---|
| **Lyon Street Steps** | **pacific-heights** | `lyon-street-steps-pacific-heights` — **TAKEN, dropped from this file** |
| Fort Mason, Port of Embarkation, Black Point Fortifications | marina | Fort Mason is a separate reservation. Not claimed here. |
| Palace of Fine Arts | marina | Outside the Presidio polygon in both layers. Not claimed here. |
| Presidio Library Mini Park | pacific-heights | Name collision only; a Pacific Heights mini park, not in the Presidio. |

The seven Oracle Park code-seed places are all Mission Bay / Mission Rock. None is claimed here.

---

## 1. HOW THE BOUNDARY WAS ESTABLISHED

The brief is right that the edges are the real question. Two independent DataSF polygon layers were
downloaded whole and every candidate was point-in-polygon tested against both.

| Layer | Dataset | Units | What it calls this ground |
|---|---|---|---|
| Analysis Neighborhoods | `j2bu-swwd` | 41 | **"Presidio"** |
| SF Find Neighborhoods | `gfpk-269f` | 117 | **"Presidio National Park"** |

Unlike the Marina, **the two layers agree almost everywhere.** Of 94 points tested, they disagreed
on exactly two, and both disagreements are at Mountain Lake (§4). Both layers also carry separate
units named **"Presidio Heights"**, and `gfpk-269f` additionally carries **"Presidio Terrace"** and
**"Lake Street"** — these are residential neighborhoods that share a word with the park and are not
it. Nothing whose only claim is the word "Presidio" in its name was admitted.

Two classes of artifact appeared and are **not** real straddlers:

* **Over-water points fall outside both polygons.** Torpedo Wharf, the Fort Point fishing pier and
  the West Bluff picnic terrace all returned no neighborhood, because both layers stop at the
  shoreline. They are on Presidio ground; the polygons simply end.
* **The Golden Gate Bridge leaves the polygon 300 m out.** The south tower and toll plaza test
  inside the Presidio in both layers; midspan and the north tower test outside every San Francisco
  polygon because they are in Marin County. Flagged in §4, not resolved.

Working rule offered to the arbitrator, not imposed: **a candidate is Presidio core only when both
layers say Presidio.** Everything else is listed in §4 and left open.

---

## 2. THE STRUCTURAL FINDING: THERE IS NO CITY LANDMARK HERE

All 370 rows of the DataSF Article 10 landmark dataset `97yj-54sx` were downloaded and centroid
point-in-polygon tested. **Zero Article 10 landmarks fall inside the Presidio.** The six rows that
returned any "Presidio" string are all in Presidio Heights or Presidio Terrace — Koshland House
(No. 95), Roos Residence (No. 56), Russell House, St. John's Presbyterian Church (No. 83),
Theodore Roosevelt Middle School (No. 285), Wolski House. Every one of them belongs to another
zone's ground.

This is not a gap in the research. The Presidio is federal land; the city's landmark ordinance does
not reach it. **The workhorse citation format of waves 1 — "San Francisco Landmark No. N,
designated in YYYY" — is unavailable in this zone.** A verifier expecting that shape here will find
nothing, and a writer who invents one will fail the build.

What is available instead is the National Register, and it is thin by design: the whole post is one
district listing.

---

## 3. THE DESIGNATION NUMBERS — THREE, EACH RE-FETCHED

All three were pulled live from the NPS `nrhp_locations` MapServer layer, which was queried for
`County='San Francisco'` (170 rows returned) and then point-in-polygon filtered against the two
Presidio polygons.

### 3.1 Presidio of San Francisco — NHL district
* **NRHP reference number 66000232**, certification date **10/15/66**.
* **National Historic Landmark, designated 06/13/62.**
* Sources: <https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query?where=NRIS_Refnum%3D%2766000232%27&outFields=*&f=json>
  and the NPS NHL-by-state list, which renders the row as `Presidio — 06/13/62`:
  <https://www.nps.gov/subjects/nationalhistoriclandmarks/list-of-nhls-by-state.htm>
* NPS park page corroborates the year in prose: "In 1962, the Presidio was designated a National
  Historic Landmark." <https://www.nps.gov/prsf/learn/historyculture/index.htm>
* **DEFECT TO FLAG.** The `RESNAME` field on reference 66000232 reads **"Presidio Chapel"**, and
  `ResType` reads `building`. That is a dataset defect, not the district's name — the same record
  carries `NumCBldg 477`, `NumCStru 166`, `NumCSite 11`, `NumCObj 8` and `Is_NHL X`, which is a
  district, not a chapel. **Do not write "Presidio Chapel" as the name of the NHL.** The record's
  `Address` field is also stale: it cites "I-480", a freeway designation retired decades ago.
* **DO NOT COUNT.** Those four contributing-resource numbers are exactly the tally the arbitrator
  banned. They are recorded here for the verifier and must not reach prose in any form —
  not as a number, not as "hundreds of", not as "nearly five hundred".

### 3.2 Fort Point
* **NRHP reference number 70000146**, certification date **10/16/70**. `Is_NHL` is null — Fort Point
  is a National Register listing inside the NHL district, not a separate landmark.
* Corroborated independently in NPS prose: "On October 16, 1970, Fort Point became a National
  Historic Site." <https://www.nps.gov/fopo/learn/historyculture/index.htm>
* The register record and the park page agree on the day. Two sources, one date.

### 3.3 Six-Inch Rifled Gun No. 9
* **NRHP reference number 79000255**, certification date **02/07/79**, register address **"Baker
  Beach"**. This is a listed *object*, separate from the district.
* It is the gun standing in emplacement four at Battery Chamberlin: "A Six-Inch Rifle Gun Number
  Nine was received in 1977 from the Smithsonian Institution and installed at gun emplacement
  Number Four." <https://www.nps.gov/places/battery-chamberlin.htm>
* This is the single most citable object in the zone and it is nearly always missed.

### 3.4 What could NOT be verified — do not publish
* **California Historical Landmark numbers.** The Presidio, Fort Point and the Golden Gate Bridge
  are each routinely cited as CHLs. The session's web-search budget was exhausted, and
  `ohp.parks.ca.gov` renders its listing client-side and returned no data to a plain fetch. **No CHL
  number was confirmed against a live register, so no CHL claim may ship.** If a later pass wants
  them, the register must be re-fetched and the number read off it, exactly as wave 1 did.
* **The Golden Gate Bridge is not on the National Register.** It does not appear in the 170-row
  San Francisco county result. Any writer who assumes it is listed will invent a number.
* One record, **Waybur, Julian, House** (ref 11000143, 03/28/11, 3232 Pacific Ave) point-tests
  `A=Presidio, B=Presidio Heights`. Its street address is Pacific Avenue. It is a boundary artifact
  of the analysis layer, not a Presidio building. Not claimed. Flagged in §4.

---

## 4. STRADDLERS — FLAGGED, NOT RESOLVED

**Six. The arbitrator resolves these, not this file.**

1. **Mountain Lake / Mountain Lake Park.** The only place the two layers disagree with each other.
   The *water* tests `A=Presidio, B=Presidio National Park` at three separate points across the
   lake. The *park* does not: the playground tests `A=Inner Richmond, B=Presidio Terrace` and the
   tennis courts test `A=Inner Richmond, B=Inner Richmond`. NPS treats the lake as its own and
   says it "lies nearly hidden at the southern edge of the Presidio"
   (<https://www.nps.gov/prsf/planyourvisit/mountain-lake.htm>) — note that phrase is itself a
   banned orientation-by-impression and must be paraphrased to a fact if used. **The lake and the
   park may be two places or one. Both readings are defensible and neither is settled here.**

2. **The Golden Gate Bridge.** South tower and toll plaza: Presidio in both layers. Midspan and
   north tower: outside every San Francisco polygon, in Marin County. The bridge is a physical
   object that begins in this zone and ends outside the city. The **Golden Gate Bridge Welcome
   Center** and **Golden Gate Overlook** are unambiguously Presidio and are separate candidates
   below; the span itself is not. No other zone in this wave has a competing claim, but the
   containment is genuinely partial and the arbitrator should say so explicitly.

3. **Baker Beach's south end.** The main beach and Battery Chamberlin test Presidio in both layers.
   The **mouth of Lobos Creek at the beach's south end tests `A=Seacliff, B=Seacliff`.** The beach
   is one continuous strand across a neighborhood line. Lobos Creek Valley itself, inland, is
   Presidio in both layers.

4. **Julius Kahn Playground** (`A=Presidio Heights, B=Presidio Heights`). Both layers put it
   outside. It sits against the Presidio wall on ground the Army long held, and it is reached from
   inside the park. Both layers say Presidio Heights, so the working rule excludes it — but the
   physical adjacency is real and the arbitrator may see it differently. **Presidio Wall Playground**
   tests the same way and has the same problem in its name.

5. **Waybur, Julian, House**, 3232 Pacific Ave, NRHP 11000143. `A=Presidio, B=Presidio Heights`.
   A street address on Pacific Avenue that the analysis layer swallows. Almost certainly an artifact.
   Listed only so no one later "discovers" a Presidio NRHP building that is not one.

6. **Fort Mason** — resolved, recorded for completeness. Fort Mason was an Army subpost historically
   tied to the Presidio, and its **San Francisco Port of Embarkation** is a separate NHL (04/02/85).
   It is **already owned by `marina`** in five places. Not claimed here, not contested.

---

## 5. CANDIDATES

**66 candidates.** Every one point-tests Presidio in both DataSF layers unless the row says
otherwise. Kind is a suggestion. Addresses are given only where a source states them.

Legend: **[OWN-SITE]** = the fact comes from the operator's own page and establishes identity,
location and hours only. **[HAZARD]** = the source sentence contains something the regex bans; the
fact is usable, the wording is not.

### 5.1 The register-backed core

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 1 | **Fort Point** | historic-site | Long Ave & Marine Dr, San Francisco, CA 94129 | Third System masonry fort, "built between 1853 and 1861" by U.S. Army Engineers. NRHP 70000146, listed 16 October 1970 — "On October 16, 1970, Fort Point became a National Historic Site." Open Thursday through Monday, 10:00am–5:00pm. Stands beneath the Golden Gate Bridge's south approach; the bridge's arch was redesigned over it. | <https://www.nps.gov/fopo/learn/historyculture/index.htm> · <https://www.nps.gov/fopo/planyourvisit/hours.htm> · NRHP layer query above |
| 2 | **Presidio of San Francisco** (the post itself) | historic-site | — | Spanish post founded 1776; "For 218 years, the Presidio served as an army post for three nations" (1776 + 218 = 1994). NHL designated 13 June 1962; NRHP ref 66000232, listed 15 October 1966. Part of Golden Gate National Recreation Area since 1994. **This is the town-page subject, not a place row — see §6.** | <https://www.nps.gov/prsf/index.htm> · <https://www.nps.gov/prsf/learn/historyculture/index.htm> · NHL-by-state list |
| 3 | **Battery Chamberlin** | historic-site | North end of Baker Beach | "completed and armed in 1904 with four six-inch guns mounted on disappearing carriages"; modified in 1920 to take "two six-inch guns on simple barbette carriages". Holds **Six-Inch Rifled Gun No. 9, NRHP ref 79000255, listed 7 February 1979**, "received in 1977 from the Smithsonian Institution and installed at gun emplacement Number Four". Loading demonstrations 11AM–3PM on the first full weekend of the month. | <https://www.nps.gov/places/battery-chamberlin.htm> · NRHP layer |

### 5.2 Crissy Field and the north shore

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 4 | **Crissy Field** | park | Along Mason St / Old Mason St | Army airfield laid out on the ground where "the outline of the Panama-Pacific International Exposition racetrack was still visible". "The plan was approved in 1921 and implemented under the supervision of Henry 'Hap' Arnold." Douglas O-25 replaced De Havillands in 1930. Reopened to the public in **May 2001** after planning and fundraising "in earnest in 1994". **[HAZARD]** NPS calls it "the military's first Air Coast Defense Station on the Pacific coast" — a sequence-superlative; the *date* publishes, the *ranking* does not. | <https://www.nps.gov/prsf/learn/historyculture/crissy-field.htm> · <https://www.parksconservancy.org/parks/crissy-field> |
| 5 | **Crissy Field Marsh** | nature-site | — | Restored tidal marsh on the airfield's east side. NPS page carries no dimensions; the Parks Conservancy page carries none either. **Size and restoration completion date remain unsourced.** | <https://www.nps.gov/prsf/planyourvisit/crissy-field-marsh-and-beach.htm> |
| 6 | **Crissy Field East Beach** | beach | East end of Crissy Field, off Mason St | Sand beach with restrooms built during the restoration. Named on both NPS and Conservancy pages. | <https://www.nps.gov/prsf/planyourvisit/things2do.htm> |
| 7 | **Crissy Field Center** | visitor-center | Building 603, Mason St | "The Crissy Field Center at Building 603 along Mason St. serves as a dynamic hub of youth engagement." Building number stated by the operator. | <https://www.parksconservancy.org/parks/crissy-field> |
| 8 | **Warming Hut** | shop-cafe | West end of Crissy Field | Park store and café. Named on the Conservancy's Crissy Field page; a dedicated page 404s. **Building number (983) is commonly cited and was NOT confirmed — do not publish it.** | <https://www.parksconservancy.org/parks/crissy-field> |
| 9 | **Torpedo Wharf** | pier | — | Pier off the Crissy Field shore, named by the Presidio Trust as one of its bridge viewpoints: "delivers close-up views of the complete bridge span". Tests outside both polygons because it is over water. | <https://presidio.gov/explore/attractions/golden-gate-bridge/> |
| 10 | **West Bluff Picnic Area** | picnic-area | — | Named picnic ground; NPS shows "Park visitors at the West Bluff picnic area". Over-water/edge point returned no polygon. | <https://www.nps.gov/prsf/planyourvisit/things2do.htm> |
| 11 | **Quartermaster Reach** | nature-site | — | Restored marsh channel between the Main Post and Crissy Field. Presidio in both layers. **No dedicated page was found; facts are thin.** | point test only — needs a source before it can ship |

### 5.3 Presidio Tunnel Tops and the visitor front door

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 12 | **Presidio Tunnel Tops** | park | 210 Lincoln Boulevard, San Francisco, CA 94129 **[OWN-SITE]** | Landscape built over the Presidio Parkway tunnels. Named sub-features on the operator's page: the Outpost, the Field Station, Outpost Meadow Picnic Area, Picnic Place, East Meadow, West Lawn. **Opening date, acreage and landscape architect are NOT on the page and were not otherwise sourced.** | <https://presidio.gov/explore/attractions/presidio-tunnel-tops/> |
| 13 | **Presidio Visitor Center** | visitor-center | 210 Lincoln Boulevard, San Francisco, CA 94129 **[OWN-SITE]** | "open daily from 10 a.m. to 5 p.m.", closed Thanksgiving, Christmas and New Year's Day. Holds a large three-dimensional model of the Presidio with touch screens, wall-sized digital displays and an interactive digital table. Maps in English, Spanish and Chinese; audio tours and Braille materials. | <https://presidio.gov/explore/attractions/presidio-visitor-center/> |
| 14 | **The Outpost** | playground | At Presidio Tunnel Tops, east entrance **[OWN-SITE]** | Nature playground; "play structures inspired by nature and history". | <https://presidio.gov/explore/attractions/presidio-tunnel-tops/> · <https://presidio.gov/explore/self-guided-adventures/> |
| 15 | **Presidio Field Station** | visitor-facility | At Presidio Tunnel Tops **[OWN-SITE]** | "a curiosity lab"; base camp for guides and borrowable gear. | same as 14 |
| 16 | **Presidio Transit Center** | transport | Adjacent to the Presidio Visitor Center **[OWN-SITE]** | Bus hub; restrooms for the visitor centre are here. | <https://presidio.gov/explore/attractions/presidio-visitor-center/> |
| 17 | **Main Parade Lawn** | park | Main Post **[OWN-SITE]** | Named lawn on the Main Post, listed by the Trust alongside Presidio Plaza and the Main Post Lawns; Presidio Pop Up vendors trade here. | <https://presidio.gov/explore/attractions/presidio-tunnel-tops/> · <https://presidio.gov/eat/> |

### 5.4 The Golden Gate Bridge and its viewpoints

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 18 | **Golden Gate Bridge** | bridge | — | Opened 27 May 1937. Total length 1.7 miles (8,981 ft / 2,737 m); main span 4,200 ft (1,280 m); tower height above water 746 ft (227 m); roadway width 62 ft (19 m). International Orange, Art Deco. **STRADDLER — see §4.2. Not on the National Register.** | <https://www.goldengate.org/bridge/history-research/statistics-data/design-construction-stats/> · <https://presidio.gov/explore/attractions/golden-gate-bridge/> |
| 19 | **Golden Gate Bridge Welcome Center** | visitor-center | San Francisco, CA 94129, at the south end of the bridge plaza **[OWN-SITE]** | "open from 9 a.m. to 6 p.m. seven days a week, except Thanksgiving and Christmas". Holds construction artefacts — rivets, workers' hard hats — and a 12-foot stainless steel test tower from 1933. Street-level automatic doors; accessible restrooms in a separate building across the car park. | <https://presidio.gov/explore/attractions/golden-gate-bridge-welcome-center/> |
| 20 | **Golden Gate Overlook** | viewpoint | On the California Coastal Trail **[OWN-SITE]** | Named Trust viewpoint; bridge towers framed by cypress. | <https://presidio.gov/explore/attractions/golden-gate-bridge/> |
| 21 | **Battery East Vista** | viewpoint | — | Named Trust viewpoint on the Battery East earthworks. | same as 20 |
| 22 | **Pacific Overlook** | viewpoint | Western side of the Presidio **[OWN-SITE]** | Named Trust viewpoint. | same as 20 |
| 23 | **Immigrant Point Overlook** | viewpoint | Washington Blvd | Named overlook on the western bluff; point-tests Presidio in both layers. **No dedicated NPS or Trust page was found — facts are thin.** | point test only |
| 24 | **Inspiration Point Overlook** | viewpoint | Arguello Blvd | Named as the reference point for Spire's location: Spire stands "west of Inspiration Point Overlook". | <https://www.for-site.org/andy-goldsworthy-in-the-presidio> |

### 5.5 Andy Goldsworthy — four works by a living artist

Written about freely; **a photograph featuring one may not be used**, which the photo wave handles.
Nothing about why is to appear in prose.

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 25 | **Spire** | artwork | On the Bay Area Ridge Trail near the Arguello Gate, west of Inspiration Point Overlook and north of the Presidio Golf Course Clubhouse | 2008. Built from "trunks of 37 Monterey cypress trees felled as part of the Presidio's reforestation effort"; "15-foot diameter"; "rises more than 90 feet into the air". Free, open to the public. | <https://www.for-site.org/andy-goldsworthy-in-the-presidio> |
| 26 | **Wood Line** | artwork | In the cypress grove near the intersection of Presidio Boulevard and West Pacific Avenue, just off Lovers' Lane | 2011. Eucalyptus branches laid on the forest floor. Free, open. | same as 25 |
| 27 | **Tree Fall** | artwork | Inside the Powder Magazine, Building 95, Main Post | 2013. A eucalyptus felled for the Presidio Parkway project, worked with clay derived from surrounding land, in the vault of the historic Powder Magazine. **Status: "Closed until further notice"** — verify before shipping any status. | same as 25 |
| 28 | **Earth Wall** | artwork | Hardie Courtyard, Presidio Officers' Club, 50 Moraga Avenue | Fourth Goldsworthy work in the park; named by the Presidio Trust among the four. **Year (commonly given as 2014), materials and dimensions were NOT confirmed — the FOR-SITE project page 404s. Least confident of the four; see §8.** | <https://presidio.gov/explore/self-guided-adventures/> (names it); dimensions unsourced |

### 5.6 The Main Post

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 29 | **Presidio Officers' Club** | historic-site | 50 Moraga Avenue, San Francisco, CA 94129 **[OWN-SITE]** | Adobe walls "date to the 1790s"; "first rebuilt by the army around 1847"; the wooden pavilion-like assembly room, the Moraga room today, "completed in 1885"; WPA-funded Mission Revival remodelling in the 1930s; a tower added "in the early 1970s". Heritage exhibitions Friday–Sunday 11 a.m.–4 p.m. Rooms: Moraga Hall, Ortega Ballroom, Hardie Courtyard. **[HAZARD]** NPS calls it "One of San Francisco's oldest buildings" — banned superlative; the 1790s date publishes, the ranking does not. | <https://www.nps.gov/prsf/learn/historyculture/officers-club.htm> · <https://presidio.gov/explore/attractions/presidio-officers-club/> |
| 30 | **Old Post Hospital** | historic-site | Main Post | "This 1864 building displays both Italianate and Greek Revival architectural styles." An octagonal surgical tower with windows on all sides was added in 1897. "housed the Presidio Army Museum from 1974 until February 2000". | <https://www.nps.gov/prsf/planyourvisit/old-post-hospital.htm> |
| 31 | **Golden Gate Club** | events-venue | Main Post | "originally dedicated in 1949" as a service club for enlisted personnel; Spanish Colonial Revival exterior; now a conference and events centre. Hosted treaty signings in the Korean War era. | <https://www.nps.gov/prsf/planyourvisit/golden-gate-club.htm> |
| 32 | **Presidio Theatre** | theatre | 99 Moraga Avenue, San Francisco, CA 94129 **[OWN-SITE]** | "Built in 1939 by the U.S. Army with WPA funding" as a venue for soldiers and their families. Closed **28 August 1994** — the last film shown was *Maverick*. Restored 2017–2019, excavation doubling usable space and relocating the proscenium arch; reopened **September 2019**. Seat count and architect not stated. | <https://www.presidiotheatre.org/history> |
| 33 | **Pershing Square** | square | Main Post | Named Main Post feature on the NPS historic-sites index. **No page content was retrieved — facts are thin.** | <https://www.nps.gov/prsf/learn/historyculture/main-post.htm> |
| 34 | **Montgomery Street Barracks** | historic-site | Montgomery Street, Main Post | Named Main Post feature. Row of brick barracks facing the parade ground. **Dates unsourced.** | same as 33 |
| 35 | **Funston Avenue Officers' Quarters** | historic-site | Funston Avenue, Main Post | Named Main Post feature; the Victorian officers' row. **Dates unsourced.** | same as 33 |
| 36 | **The Alameda** | street | Corner of Funston Ave. & Presidio Blvd. | Named Main Post feature with an address given by NPS. | same as 33 |
| 37 | **Presidio Fire Station** | historic-site | Main Post | Named Main Post feature. **Dates unsourced.** | same as 33 |
| 38 | **Post Interfaith Chapel** | church | Main Post | On the NPS architectural-sites index; its own page 404s. **Nothing was sourced beyond the name. See §8 — this is one of the least confident rows, and it shares a word with the "Presidio Chapel" data defect in §3.1.** | <https://www.nps.gov/prsf/planyourvisit/architectural-sites.htm> |
| 39 | **Powder Magazine (Building 95)** | historic-site | Main Post | Building number given by FOR-SITE as *Tree Fall*'s container. Whether it ships as its own row or only as the artwork's location is a verifier call. | <https://www.for-site.org/andy-goldsworthy-in-the-presidio> |

### 5.7 The cemeteries and memorials

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 40 | **San Francisco National Cemetery** | cemetery | Within the Presidio; administered from 1300 Sneath Lane, San Bruno, CA 94066 | General Order 133 set aside "a part of the reservation at the Presidio, including the post cemetery thereon…to be known as the San Francisco National Cemetery". First known American burial 1854. "The final expansion of the cemetery occurred in 1932, when it reached its current size of 28.34 acres." Among those buried: Civil War generals, Medal of Honor recipients, Buffalo Soldiers, a Union spy. Maintained by the Department of Veterans Affairs. **[HAZARD]** NPS says it was placed under the Quartermaster General in 1884 "as the first National Cemetery on the west coast" — the 1884 date publishes, the ranking does not. **[HAZARD]** "Among the 30,000 Americans laid to rest here" is a live, growing figure. | <https://www.nps.gov/prsf/learn/historyculture/san-francisco-national-cemetery.htm> |
| 41 | **Presidio Pet Cemetery** | cemetery | Presidio of San Francisco, CA 94123 | Grave markers date back to the 1950s; "officially closed to new interments". During the 1970s "an anonymous former Navy man became the unofficial caretaker". Sits under the Presidio Parkway viaduct. **STATUS RISK:** the NPS page still says it is "closed during construction of the Presidio Parkway viaduct" — that construction finished years ago and the page is stale. **Do not publish a status from this page without re-checking. See §8.** | <https://www.nps.gov/prsf/learn/historyculture/pet-cemetery.htm> |
| 42 | **World War II West Coast Memorial** | memorial | Overlooking the Pacific, western Presidio | "Dedicated November 29, 1960". "A curved wall of California granite set in a grove of Monterey pine and cypress". Statue of Columbia by New York sculptor Jean de Marco. "It bears the names of 413 members of the armed forces who were lost or buried at sea in U.S. Pacific waters between 1941 and 1945". **The statue is a sculpture, not a building — relevant to the photo wave only, never to prose.** | <https://www.nps.gov/prsf/learn/historyculture/world-war-ii-memorial.htm> |

### 5.8 Fort Winfield Scott and the coast defenses

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 43 | **Fort Winfield Scott** | historic-site | Western Presidio | "On June 19, 1912, Fort Winfield Scott was established in the western part of the Presidio as a coast artillery post". Housed "seventeen Endicott-era gun batteries that were constructed, armed, and manned between 1891 and 1946". | <https://www.nps.gov/prsf/learn/historyculture/fort-scott.htm> |
| 44 | **Battery East** | historic-site | Coastal bluffs behind Fort Point | Construction began 1873. Took 8-inch rifled Rodman cannon during the Spanish-American War, 1898. "the earthen works built to protect the large Rodman guns are still visible, as are the brick-lined magazines used to store ammunition". | <https://www.nps.gov/prsf/learn/historyculture/batteries-east-and-west.htm> |
| 45 | **Battery West** | historic-site | Coastal bluffs behind Fort Point | Completed by 1873 with "twelve 15-inch Rodman cannon"; "almost completely destroyed" during 1890s Endicott-period construction. | same as 44 |
| 46 | **Battery Godfrey** | historic-site | Above Baker Beach, Fort Scott | One of the Endicott batteries named on the NPS Fort Scott batteries index. Presidio in both layers. **Individual dates not retrieved — the index page carries names only.** | <https://www.nps.gov/prsf/learn/historyculture/fort-scott-batteries.htm> |
| 47 | **Battery Crosby** | historic-site | South of Baker Beach | Named on the same index. Dates not retrieved. | same as 46 |
| 48 | **Battery Boutelle** | historic-site | Fort Scott bluffs | Named on the same index. Dates not retrieved. | same as 46 |
| 49 | **Battery Marcus Miller** | historic-site | Below the bridge approach | Named on the same index. Dates not retrieved. | same as 46 |
| 50 | **Battery Cranston** | historic-site | Fort Scott | Named on the same index. Dates not retrieved. | same as 46 |
| 51 | **Battery Dynamite** | historic-site | Fort Scott | Named on the same index. Dates not retrieved. | same as 46 |
| 52 | **Battery Saffold** | historic-site | Fort Scott | Named on the same index. Dates not retrieved. | same as 46 |

The index also names Baldwin, Blaney, Howe-Wagner, Lancaster, McKinnon-Stotsenberg, Sherwood and
Slaughter. **They are recorded here as existing and are deliberately NOT carried as candidates**:
nothing beyond a name was sourced, and a row that is only a name is not a place a guide can write
about. **Under no circumstances tally the batteries** — the NPS "seventeen" is a count of gun
batteries built by the Army, which is a fact about the fort, but any count of *what survives* would
be a claim about a changing landscape.

### 5.9 Beaches, water and forest

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 53 | **Baker Beach** | beach | Off Gibson Rd, western Presidio | Strand below the coastal bluffs. Battery Chamberlin stands at its north end; the register address of Six-Inch Rifled Gun No. 9 is simply "Baker Beach". **STRADDLER — the south end at Lobos Creek tests Seacliff in both layers (§4.3).** The dedicated NPS page 404s; facts come from the Battery Chamberlin page and the register. | <https://www.nps.gov/places/battery-chamberlin.htm> · NRHP 79000255 |
| 54 | **Marshall's Beach** | beach | Below the bluffs south of Fort Point | Reached from the Batteries to Bluffs Trail. Cliff-top and sand points both test Presidio in both layers. **No dedicated page was retrieved — facts are thin.** | point test only |
| 55 | **Mountain Lake** | nature-site | Southern Presidio | "the campsite of the Anza settlement party in 1776"; "became a source of fresh water for San Francisco during the early years"; "Much of the lake's shoreline was buried in the 1930s to provide a freeway approach to the Golden Gate Bridge". Ducks and waterfowl among the tule reeds. **STRADDLER — §4.1.** **[HAZARD]** "lies nearly hidden at the southern edge of the Presidio" is banned orientation-by-impression. | <https://www.nps.gov/prsf/planyourvisit/mountain-lake.htm> |
| 56 | **Mountain Lake Park** | park | Lake Street at 8th–12th Ave | Playground, tennis courts and a Par Course on the lake's south side. **Tests OUTSIDE the Presidio in both layers — see §4.1. This row may belong to a Richmond zone that does not exist in this wave.** | same as 55 |
| 57 | **Lobos Creek Valley** | nature-site | Western Presidio | "The creek has long been a source of water for the Presidio, and a flume from the creek to San Francisco provided water to the town in its early days." Coastal-scrub restoration is ongoing. Boardwalk length, flow figures and species were not on the page. | <https://www.nps.gov/prsf/planyourvisit/lobos-creek-valley.htm> |
| 58 | **El Polín Spring** | nature-site | Tennessee Hollow, MacArthur Ave | Spring at the head of Tennessee Hollow; the creek running from it passes under the brick footbridge on Lovers' Lane. Listed by NPS as a picnic location. Its own history page 404s; the Lovers' Lane page carries the connection. | <https://www.nps.gov/prsf/planyourvisit/lovers-lane.htm> · <https://www.nps.gov/prsf/planyourvisit/things2do.htm> |
| 59 | **Presidio Forest** | nature-site | Across the Presidio's hills | Planted by the Army "from the 1880s through the 1940s" — pine, cypress and eucalyptus — "in order to make the area appear larger with more relief, to limit visibility within the Presidio, and to beautify the post." | <https://www.nps.gov/prsf/planyourvisit/presidio-forest.htm> |
| 60 | **Presidio Coastal Bluffs** | nature-site | Western shoreline | On the NPS nature-and-recreation index. **Nothing sourced beyond the name.** | <https://www.nps.gov/prsf/planyourvisit/nature-and-recreation-sites.htm> |

### 5.10 Trails

The Presidio Trust names twelve trails and states the park "has more than two dozen miles of
trails", but publishes no per-trail length, grade or trailhead. Only the two with real sourced
content are carried as candidates; the rest are recorded for the verifier.

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 61 | **Lovers' Lane** | trail | Begins at Funston Avenue & Presidio Blvd; ends at the Presidio Boulevard Gate | "an easy, one-mile walk". "crosses a tiny brick footbridge over the creek running down Tennessee Hollow from El Polin spring." "U.S. soldiers used Lovers Lane to access the trolley line to visit their lovers and family in San Francisco starting in the late 1800s." **[HAZARD]** "One of the oldest foot trails in the Presidio" is a banned superlative. | <https://www.nps.gov/prsf/planyourvisit/lovers-lane.htm> |
| 62 | **Batteries to Bluffs Trail** | trail | Between Battery Crosby and Marshall's Beach | Named Trust trail; the access route to Marshall's Beach. **Length not published by the operator.** | <https://presidio.gov/explore/trails/> |

Also named by the Trust and **not carried** for want of any sourced content: Bay Area Ridge Trail
(Spire stands on it), California Coastal Trail (the Golden Gate Overlook is on it), Ecology Trail,
Golden Gate Promenade / Bay Trail SF, Juan Bautista de Anza National Historic Trail, Lobos Creek
Valley Trail, Mountain Lake Trail, Park Trail, Presidio Promenade Trail, Tennessee Hollow Trail.

### 5.11 Museums, tenants and trade

| # | Name | Kind | Address | What / when / who | Sources |
|---|---|---|---|---|---|
| 63 | **The Walt Disney Family Museum** | museum | 104 Montgomery Street in the Presidio, San Francisco, CA 94129 **[OWN-SITE]** | "Thu–Sun, 10am–5:30pm (last entry at 4:30pm)", with extended Monday hours from Memorial Day to Labor Day. Telephone 415.345.6800. Occupies a Montgomery Street barracks building on the Main Post. **Founding year deliberately omitted — a founding year from an operator's own site is a trading-duration claim and does not publish.** | <https://www.waltdisney.org/visit> |
| 64 | **Letterman Digital Arts Center** | office-campus | 1 Letterman Drive | Built on the site of Letterman General Hospital, which was "Built between 1899 and 1902", "Renamed for the Union Army's Surgeon General in 1911", treated soldiers returning from the Spanish-American War in the Philippines, admitted injured civilians after the 1906 earthquake, and "cared for more than 18,000 soldiers returning from World War I". **The hospital's demolition date and the campus's opening date were NOT sourced.** | <https://www.nps.gov/prsf/learn/historyculture/letterman-complex.htm> |
| 65 | **Presidio Golf Course** | golf-course | 300 Finley Rd, San Francisco, CA 94129 **[OWN-SITE]** | 18 holes; the Clubhouse takes events from twelve to 200 people. **[HAZARD + OWN-SITE]** The operator writes "built in 1895, making it one of the oldest courses on the West Coast" — the ranking is a banned superlative, and 1895 is a founding year on the operator's own page, so **it does not publish from this source.** A third-party date was not found. | <https://presidio.gov/explore/attractions/presidio-golf-course/> |
| 66 | **Rob Hill Campground** | campground | 1475 Central Magazine Road, San Francisco, CA 94129 **[OWN-SITE]** | Four group campsites, each taking up to 30 people. "Open for public tent camping from April 1 to October 31"; November to March it takes day-use picnic reservations. "Army records show the monarch has come to the Presidio to overwinter and mate in Rob Hill's nearby eucalyptus trees since the beginning of the 19th century." **[HAZARD]** "one of just two campgrounds in San Francisco" is a count-superlative and does not publish. | <https://presidio.gov/explore/attractions/rob-hill-campground/> |

**Lodging, recorded but held.** Two hotels test Presidio in both layers and have operator-stated
addresses, but each has a gap the verifier must close:

* **Inn at the Presidio**, 42 Moraga Avenue, San Francisco, CA 94129. "The Inn has 22 rooms, 17 of
  which are suites with gas fireplaces and sleeper sofas." Described as "a former home to unmarried
  Army officers"; construction date and hotel opening date are not on the page.
  <https://presidio.gov/explore/attractions/inn-at-the-presidio/>
* **Lodge at the Presidio**, 105 Montgomery Street, San Francisco, CA 94129. The page states only
  that it is "among the registered Historic Hotels of America" — **that is a membership programme,
  not a register with an identifier, and it does not satisfy the designation rule.** Room count,
  original army use and opening date are all absent.
  <https://presidio.gov/explore/attractions/lodge-at-the-presidio/>

**Trade named by the Trust but not sourced to an address**, and therefore not carried: Presidio
Bowl, Colibri Mexican Bistro (in the Officers' Club, "seven days a week for lunch and dinner"),
Il Parco (at Tunnel Tops), the Warming Hut Park Store, and Presidio Pop Up food trucks at Tunnel
Tops and the Main Parade Lawn. The Trust says only "More than a dozen restaurants".
<https://presidio.gov/eat/> · <https://presidio.gov/explore/attractions/presidio-officers-club/>

**Buildings that point-test Presidio and are named on the NPS indexes but returned nothing usable**,
recorded so the next pass does not re-walk them: Infantry Row, Housing Areas, Public Health Service
Hospital (page 404s), Cavalry Stables — of which only this survives: "Built in 1914, the five brick
cavalry stables could each house 102 horses"
(<https://www.nps.gov/prsf/planyourvisit/cavalry-stables-and-pet-cemetery.htm>).

---

## 6. GUIDE OR TOWN PAGE

**Town page.** In my judgement this is not a guide.

A guide is a route through a neighborhood a reader walks. The Presidio is 1,400-odd acres of
federal land whose named places sit two and three miles apart across forested hills — Fort Point to
Baker Beach is not a walk, and any prose that made it one would need exactly the trip-duration and
orientation-by-impression phrasing the rules ban. There is no high street. There is no continuous
frontage. The zone's own sources describe it as four separate districts (Main Post, Crissy Field,
Fort Scott, the southern woodlands) and route visitors between them by shuttle.

A town page also handles the containment problem honestly. The Presidio is not inside a
neighborhood and does not contain the Golden Gate Bridge, Mountain Lake Park or Baker Beach's south
end cleanly. A town page can carry a place list with straddlers flagged; a guide would have to
assert a walking order that implies a containment none of the boundary evidence supports.

---

## 7. HOW TO REPRODUCE THE BOUNDARY WORK

    # both polygon layers, whole
    https://data.sfgov.org/resource/j2bu-swwd.json?$limit=100     # Analysis Neighborhoods, 41 units
    https://data.sfgov.org/resource/gfpk-269f.json?$limit=200     # SF Find Neighborhoods, 117 units

    # every Article 10 landmark, then centroid point-in-polygon
    https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000    # 370 rows, ZERO in the Presidio

    # every National Register record in the county, then point-in-polygon
    https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/
      MapServer/0/query?where=County='San Francisco'&outFields=RESNAME,NRIS_Refnum,CertDate,
      Address,Is_NHL&returnGeometry=true&outSR=4326&f=json&resultRecordCount=1000   # 170 rows

    # collision check against shipped San Francisco files (taken_slugs.py does NOT cover these)
    python3 -c "import json,glob,io
    for f in sorted(glob.glob('priv/seed_data/san_francisco/*.json')):
        d=json.load(io.open(f,encoding='utf-8'))
        for p in d['places']: print(f, p['slug'], p['name'])"

94 points were tested. Ray-casting point-in-polygon with hole handling; both layers are MultiPolygon
in WGS84.

---

## 8. LEAST CONFIDENT

1. **Andy Goldsworthy's *Earth Wall* (#28).** The Presidio Trust names it as one of the four works,
   and it is the only one of the four for which no year, no materials and no dimensions were
   obtained — the FOR-SITE project page 404s and the Trust's own art page could not be located. The
   commonly cited year of 2014 is **not sourced here and must not be written.** Either the work
   ships as a bare named artwork in the Officers' Club courtyard, or it does not ship. This is the
   thinnest row in the file and it is thin about the one thing that would make it interesting.

2. **The Presidio Pet Cemetery's status (#41).** The NPS page says it is "closed during construction
   of the Presidio Parkway viaduct". That construction ended years ago and the page has not been
   revised. A status field written from this source would be wrong today, and a status field written
   from memory would be unsourced. This needs a fresh check against a current operator page before
   any `status` value is set — and the closure sentence must not be paraphrased into prose either,
   because a stale closure reads as a fact about the place.

3. **The Post Interfaith Chapel (#38), and the "Presidio Chapel" trap behind it.** The chapel is
   named on the NPS architectural-sites index and its own page 404s, so nothing about it was
   sourced. That would make it merely thin — except that the National Register layer files the
   *entire NHL district*, reference 66000232, under the resource name **"Presidio Chapel"**. Anyone
   who researches this row without reading §3.1 first will find a register record that appears to
   name the chapel, carry it across as "Presidio Chapel, NRHP 66000232", and publish a citation that
   attaches the whole post's district listing to one building. **That is the single most likely
   defect this zone can produce, and it would pass the regex.**

Honourable mention: **the California Historical Landmark numbers (§3.4)**. Three obvious CHL
candidates sit in this zone and not one number was confirmed against a live register. That is a real
gap rather than a doubt — but it is the gap most likely to be filled from memory by whoever writes
next, and a remembered landmark number is exactly the failure wave 1's re-fetch caught.
