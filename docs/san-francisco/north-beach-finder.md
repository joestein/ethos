# North Beach, San Francisco — FINDER file

Wave 1, San Francisco programme. **Evidence, not adjudication.** A verifier adjudicates; ONE
arbitrator rules ownership of straddlers across all twelve zones. I do not resolve straddlers here.

Research date: 2026-09-03. Author: finder agent (North Beach).

---

## 0. Compliance statement (read before using anything below)

Read in full before work began: `priv/seed_data/san_francisco_roster.json` — `scope_ruling`,
`designation_ruling`, `photo_ruling`, `kind_note`, `oracle_park_ruling`,
`destination_slug_ruling`.

1. **DESIGNATION CLAIMS PUBLISH, WITH A REGISTER AND AN IDENTIFIER.** This is the opposite of the
   Rome rule. Every designation in this file carries its register and its number, and §2 records
   the URL the number came from. Where I could not find an identifier I have written
   **NO IDENTIFIER — DOES NOT PUBLISH** against the entry rather than softening the claim into
   "a designated landmark", which fails the build.
2. **"Eligible" IS NOT A DESIGNATION.** SF Planning's district datasets carry `cr` / `nr` / `a10`
   fields whose values include `Listed`, `Eligible` and `No`. Only `Listed` is a designation.
   Washington Square Historic District and Upper Grant Avenue Historic District are `Eligible`
   only and **must not** be described as designated (§2.4). This is the single most likely way a
   writer working from this file would fail the gate.
3. **`landmarkno = 0` IS A PLACEHOLDER, NOT LANDMARK NUMBER ZERO.** The Article 10 dataset
   contains 40+ rows with `landmarkno = 0` and `yeardesignated = 0.0` — properties under
   consideration or surveyed but not designated. Momo's 440 Club at 438–440 Broadway is one of
   them (§2.5). "San Francisco Landmark No. 0" is not a thing. A naive read of the dataset yields
   8 North Beach landmarks; the true count is 7.
4. **NO PHOTOGRAPHS.** Every record is `"photos": []`. I sourced, named and linked no image. Photo
   leads for the later wave are prose-only in §8. The artwork/building distinction under
   17 USC 120(a) matters here and is recorded per-item.
5. **Corpus rules observed.** No superlatives from any source, attributed or not. No trip
   durations, no orientation by impression. No page self-narration. No research method in
   reader-facing text — the provenance arguments live in this file and stop at its edge.

**On founding years.** Several operators state a trading duration on their own site — Vesuvio
"Serving All Wanderers Since 1948", Comstock Saloon "Founded in 1907", Condor "Since 1964",
Caffe Trieste "Over 50 years" / "Celebrating 65 Years". Per the brief, a founding year from an
operator's own site is a trading-duration claim and **does not publish**. I have recorded these as
*leads needing an independent source*, never as facts. Where a construction year comes instead
from SF Planning's parcel dataset it is a different claim about the building, and is marked as
such.

---

## 1. Method, and what "I know which zone" means here

**Tooling.** The WebSearch budget was assumed exhausted; every retrieval ran against URLs named in
advance, fetched with `python3` + `urllib` (never piped `curl`, never `grep` as a source of truth).
Cache at `<scratchpad>/nb/cache`, scripts at `<scratchpad>/nb/s*.py`.

**A note on the supplied tooling.** `python3 .superpowers/taken_slugs.py` was run first as
instructed. It globs `priv/seed_data/rome/*.json` **only** — it is a Rome-era script and does not
read Connecticut, New York or the code seeds, so it is not the corpus-wide check its docstring
claims. I verified the San Francisco side separately: `priv/seed_data/san_francisco/` contains
only `.gitkeep`, so **no San Francisco place is claimed by a shipped file yet**. The seven Oracle
Park places are a live code seed (`Ethos.Seeds.OracleParkPlaces`) and are listed in the roster;
none of them is in North Beach and none appears below.

**Boundary method — this is the load-bearing part.** San Francisco has no single canonical
neighborhood geometry, and North Beach is one of the worst cases in the city. I used three
independent sources and report all three per place rather than picking a winner:

| Layer | DataSF id | Units | What it says about North Beach |
|---|---|---|---|
| Analysis Neighborhoods | `j2bu-swwd` | 41 | One coarse "North Beach" polygon |
| SF Find Neighborhoods | `gfpk-269f` | 117 | Splits "North Beach", "Telegraph Hill", "Fishermans Wharf", "Northern Waterfront" |
| Enterprise Addressing System | `3mea-di5p` | per address | `nhood` field, per street address |

Rings were downloaded as GeoJSON and point-in-polygon was computed locally in Python
(`<scratchpad>/nb/geo.py`, even-odd rule with hole handling, area-weighted centroids for
parcel polygons). **EAS `nhood` was found to be identical to the Analysis Neighborhood in all 49
addresses tested** — it is not an independent third opinion, it is the Analysis layer served
per-address. So there are genuinely **two** opinions, not three, and they disagree constantly.

**Two findings that change how the boundary must be read:**

- **The Analysis "North Beach" polygon swallows Fisherman's Wharf.** An Overpass sweep inside it
  returned Pier 39, Aquarium of the Bay, Musée Mécanique, Ripley's, the Skystar Wheel and ~40
  souvenir shops — all of which belong to the Fisherman's Wharf zone in the roster. The Analysis
  layer is therefore **unusable as the guide boundary for North Beach's northern edge**. The SF
  Find layer separates them correctly. Evidence: `<scratchpad>/nb/osm_nb.json`, 143 elements.
- **The same Analysis polygon excludes the lower Columbus Avenue core**, assigning City Lights,
  Vesuvio and Jack Kerouac Alley to Chinatown. So neither layer alone describes the North Beach a
  visitor means: the Analysis layer is too generous in the north and too stingy in the south.

**Nominatim was tried and is not reliable here.** It answered 9 requests then returned HTTP 429 on
every subsequent request across two runs. Worse, its `address.neighbourhood` field returned
**"South of Market"** for 261 Columbus Avenue and "Telegraph Hill" for 666 Filbert Street. I have
not used Nominatim's neighborhood field for any assignment; the 9 coordinates it returned agreed
with the DataSF polygons and were used only as corroboration.

**Deliberate edge-hunting.** Rather than work only from the brief's seven suggested subjects, I
ran two Overpass polygon sweeps (Analysis polygon, then SF Find North Beach + Telegraph Hill
unioned) across `tourism`, `historic`, `amenity`, `shop`, `leisure`, `man_made`, `highway=steps`
and `place=square`, yielding **230 distinct named POIs** before filtering
(`<scratchpad>/nb/osm_nb2.json`). Everything in §4 that is not in the brief came out of that sweep
or out of the Article 10 / NRHP registers. A high confirmation rate would be a warning sign; I
expect the arbitrator to reassign a substantial fraction of §5.

---

## 2. Designation numbers — the citable register facts

This is where the value is. All identifiers below were read from the authoritative dataset and
each designation document was HEAD-checked and returned HTTP 200 on 2026-09-03.

### 2.1 Article 10 individual landmarks — dataset `97yj-54sx`

`https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000` — HTTP 200, 370 rows, fields
`landmarkno`, `name`, `address`, `yeardesignated`, `designationdocument`, `the_geom`.
Dataset landing page: `https://data.sfgov.org/api/views/97yj-54sx.json`

**Squarely North Beach (both boundary layers agree):**

| No. | Name | Address | Designated | Designation document |
|---|---|---|---|---|
| **5** | St. Francis of Assisi Church | 620–624 Vallejo Street | 1968 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM5.pdf` |
| **127** | Old Spaghetti Factory Cafe | 478 Green Street | 1981 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM127.pdf` |
| **129** | Bauer & Schweitzer Malting Company | 530–550 Chestnut Street | 1981 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM129.pdf` |
| **226** | Washington Square | 1651 Stockton Street & Filbert | 1999 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM226.pdf` |
| **287** | Paper Doll Bar | 524 Union Street | 2019 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM287.pdf` |

**North Beach by the Analysis layer, Telegraph Hill by SF Find:**

| No. | Name | Address | Designated | Designation document |
|---|---|---|---|---|
| **121** | Julius Castle | 302–304 Greenwich Street | 1980 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM121.pdf` |
| **165** | Coit Tower | Telegraph Hill Boulevard | 1984 | `https://sfplanninggis.org/docs/landmarks_and_districts/LM165.pdf` |

**Straddlers — Chinatown by the Analysis layer, North Beach or Chinatown by SF Find (§5):**

| No. | Name | Address | Designated | Analysis | SF Find | Document |
|---|---|---|---|---|---|---|
| **33** | Sentinel Building / Columbus Tower | 916–920 Kearny Street | 1970 | Chinatown | Chinatown | `.../LM33.pdf` |
| **52** | Transamerica Building / Old Fugazi Bank | 4 Columbus Avenue | 1973 | Chinatown | North Beach | `.../LM52.pdf` |
| **228** | City Lights Bookstore | 261–271 Columbus Avenue | 2001 | Chinatown | Chinatown | `.../LM228.pdf` |
| **237** | Drexler / Colombo Building | 1–33 Columbus Avenue | 2002 | Chinatown | Chinatown | `.../LM237.pdf` |

Document URL stem for all of the above:
`https://sfplanninggis.org/docs/landmarks_and_districts/LM{no}.pdf`

### 2.2 Article 10 historic districts — `m22e-6hkz`, field `a10`

Only two districts anywhere in the city carry `a10 = Listed` **and** an SF Planning
`neighborhood` value of "North Beach":

- **Telegraph Hill Historic District** — Article 10, Planning Code Appendix G. Adopted by
  Ordinance **442-86**, `dateadop` 1986-11-13. 101 properties, 80 contributing, 21
  non-contributing. Code text:
  `https://codelibrary.amlegal.com/codes/san_francisco/latest/sf_planning/0-0-0-28305#JD_Article10AppendixG`
  (HTTP 200). SF Planning's own description names Richard Neutra and Irvine Goldstine as
  architects within it. **Point-in-polygon results, which matter:** the Filbert Steps mid-block
  and the House at 1254–1256 Montgomery Street fall **inside** it; **Coit Tower, Julius Castle and
  the Grace Marchant Garden fall OUTSIDE it.** Do not write Coit Tower as being in the Telegraph
  Hill Historic District — it is separately Landmark No. 165.
- **Northeast Waterfront Historic District** — Article 10. Adopted by Ordinance **171-83**,
  `dateadop` 1983-04-08. SF Planning `neighborhood` = North Beach. Sits on the zone's eastern
  edge and overlaps the Financial District / Northern Waterfront claim; **straddler, §5.**

### 2.3 National Register of Historic Places

Source: NPS ArcGIS map service, layer "National Register Of Historic Places Points",
`https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query`
— HTTP 200, bbox query over NE San Francisco returned 85 features. Reference numbers are the
`NRIS_Refnum` field. **Note the field is `NRIS_Refnum`, not `REFNUM`; querying `REFNUM` returns
nulls silently, and a `County='San Francisco'` filter returns zero rows.** Both are traps.

| NRHP ref | Name | Address | Certified | Analysis | SF Find |
|---|---|---|---|---|---|
| **07001468** | Coit Memorial Tower | 1 Telegraph Hill Blvd. | 2008-01-29 | North Beach | Telegraph Hill |
| **11000501** | San Francisco Public Library North Beach Branch | 2000 Mason St. | 2011-08-08 | North Beach | North Beach |
| **100006073** | Buon Gusto Sausage Factory | 535 Green St. | 2021-02-05 | North Beach | North Beach |
| **79000532** | House at 1254–1256 Montgomery Street | 1254–1256 Montgomery St. | 1979-01-31 | North Beach | Telegraph Hill |
| **79000535** | Old Ohio Street Houses | 17–55 Osgood Pl. | 1979-05-31 | North Beach | North Beach |
| **86000207** | Belt Railroad Engine House and Sandhouse | Block bounded by Lombard, Sansome | 1986-02-13 | North Beach | Telegraph Hill |
| **13000590** | U.S. Appraisers Stores and Immigration Station | 630 Sansome St. | 2013-08-13 | North Beach | North Beach |
| **99001265** | Otis Elevator Company Building | 1 Beach St. | 1999-10-21 | North Beach | **Fishermans Wharf** |

NARA nomination scans exist for several and were HEAD-checked:
Coit Tower `https://catalog.archives.gov/id/123861079` (HTTP 200),
Old Ohio Street Houses `https://catalog.archives.gov/id/123861228`,
House at 1254–1256 Montgomery `https://catalog.archives.gov/id/123861165`,
Belt Railroad Engine House `https://catalog.archives.gov/id/123861047`,
North Beach Branch Library `https://catalog.archives.gov/id/123861291`.

**Jackson Square Historic District** — `nr = Listed`, `cr = Listed`, `dateadop` 1972-08-09, 35
contributing properties, SF Planning `neighborhood` = **North Beach**. Nomination PDF referenced
via `https://catalog.archives.gov/id/123861257` family and Article 10 Appendix B via
`http://library.amlegal.com/nxt/gateway.dll/California/planning/...#JD_Article10,AppendixB`.
**I did not recover an NRHP reference number for it** — it is a district and does not appear in
the NPS *points* layer, and I did not query a polygon layer. So a National Register claim for
Jackson Square **has no identifier in my evidence and must not be written** until someone pulls
the refnum. The Article 10 Appendix B citation is available and is the safer claim. Note also a
**data conflict**: the `m22e-6hkz` record for Jackson Square carries `a10 = No` while its own
`filepath_1` points at Article 10 Appendix B. Flagged, not resolved.

### 2.4 DESIGNATION TRAPS — claims that look citable and are not

- **Washington Square Historic District** — `cr = Eligible`, `nr = No`, `a10 = No`. Origin
  BOS 772-99 (North Beach Survey). Period of significance 1906–1939. **Not designated.** The
  park itself is separately Landmark No. 226 and that claim is fine; the *district* is not.
- **Upper Grant Avenue Historic District** — `cr = Eligible`, `a10 = No`. **Not designated.**
  Caffe Trieste sits inside it, which is why its parcel record says "California Register Historic
  District". That phrase in the parcel dataset means *eligible*, not *listed*.
- **Southeast Telegraph Hill HD** and **Gardner Dailey/Telegraph Hill HD** — both `Eligible`.
- **North Point Sewage Treatment Plant HD** — `Eligible` both registers. Not designated.
- **Jackson Square Historic District Extension** — `Eligible` both registers. Distinct from the
  listed Jackson Square HD; easy to conflate.
- The **"Historic Resource Status by Parcel"** dataset (`3tsw-4idn`) `ceqacodereason` strings such
  as "California Register Historic District" and "Historic Survey Result" are **CEQA screening
  categories, not designations.** Only `ceqacodea10a11 = A*` with reason "Article 10 Individual
  Landmark" corresponds to an actual Article 10 listing.

### 2.5 The `landmarkno = 0` placeholder rows

Confirmed by dumping every row where `landmarkno` or `yeardesignated` is 0: 40+ rows including
Momo's 440 Club (438–440 Broadway), the Alcoa Building, Fillmore Auditorium, Glide Memorial
Church, Kezar Stadium, the Peace Pagoda and Far East Cafe. All have `designationdocument = None`.
These are survey/consideration entries. **Momo's 440 Club must not be written as a landmark.**

---

## 3. Boundary evidence, place by place (for the arbitrator)

Every row below is a real query result, not an impression. `EAS` is the city's own per-address
`nhood`; it equals the Analysis layer in every case tested.

| Place | Address | Analysis / EAS | SF Find | Verdict I'd argue |
|---|---|---|---|---|
| Tosca Cafe | 242 Columbus Ave | North Beach | North Beach | North Beach, clean |
| Biordi Art Imports | 412 Columbus Ave | North Beach | North Beach | North Beach, clean |
| The Stinking Rose | 430 Columbus Ave | North Beach | North Beach | North Beach, clean |
| Hotel Boheme | 444 Columbus Ave | North Beach | North Beach | North Beach, clean |
| Stella Pastry | 446 Columbus Ave | North Beach | North Beach | North Beach, clean |
| Mario's Bohemian Cigar Store | 566 Columbus Ave | North Beach | North Beach | North Beach, clean |
| North Beach Branch Library | 850 Columbus Ave | North Beach | North Beach | North Beach, clean |
| The Beat Museum | 540 Broadway | North Beach | North Beach | North Beach, clean |
| Condor Club | 560 Broadway | North Beach | North Beach | North Beach, clean |
| Caffe Trieste | 601 Vallejo St | North Beach | North Beach | North Beach, clean |
| Sts Peter and Paul Church | 666 Filbert St | North Beach | North Beach | North Beach, clean |
| Golden Boy Pizza | 542 Green St | North Beach | North Beach | North Beach, clean |
| Sotto Mare | 552 Green St | North Beach | North Beach | North Beach, clean |
| Buon Gusto Sausage Factory | 535 Green St | North Beach | North Beach | North Beach, clean |
| Original Joe's | 601 Union St | North Beach | North Beach | North Beach, clean |
| Paper Doll Bar | 524 Union St | North Beach | North Beach | North Beach, clean |
| Liguria Bakery | 1700 Stockton St | North Beach | North Beach | North Beach, clean |
| Mama's on Washington Square | 1701 Stockton St | North Beach | North Beach | North Beach, clean |
| Tony's Pizza Napoletana | 1570 Stockton St | North Beach | North Beach | North Beach, clean |
| Victoria Pastry | 700 Filbert St | North Beach | North Beach | North Beach, clean |
| Tommaso's | 1042 Kearny St | North Beach | North Beach | North Beach, clean |
| San Remo Hotel / Fior d'Italia | 2237 Mason St | North Beach | North Beach | North Beach, clean |
| The Saloon | 1232 Grant Ave | North Beach | North Beach | North Beach, clean |
| Savoy Tivoli | 1434 Grant Ave | North Beach | North Beach | North Beach, clean |
| Telegraph Hill Books | 1501 Grant Ave | North Beach | North Beach | North Beach, clean |
| Bauer & Schweitzer Malt House | 530 Chestnut St | North Beach | North Beach | North Beach, clean |
| Joe DiMaggio Playground | 651 Lombard St | North Beach | North Beach | North Beach, clean |
| Cotogna | 490 Pacific Ave | North Beach | North Beach | North Beach, but Jackson Sq by feel |
| Via Ferlinghetti | — | North Beach | North Beach | North Beach, clean |
| Romolo Place | 15 Romolo Pl | North Beach | North Beach | North Beach, clean |
| — | — | — | — | — |
| Coit Tower | Telegraph Hill Blvd | North Beach | **Telegraph Hill** | **STRADDLE — Telegraph Hill declined as a zone; roster calls Coit Tower "North Beach's marquee"** |
| Julius Castle | 302 Greenwich St | North Beach | **Telegraph Hill** | STRADDLE, same logic |
| House at 1254–1256 Montgomery | — | North Beach | **Telegraph Hill** | STRADDLE, same logic |
| Bob Kaufman Alley | 19 Bob Kaufman Aly | North Beach | **Telegraph Hill** | STRADDLE, same logic |
| Filbert Steps / Greenwich Steps | — | North Beach | **Telegraph Hill** | STRADDLE, same logic |
| — | — | — | — | — |
| Molinari Delicatessen | 373 Columbus Ave | **Chinatown** | North Beach | **STRADDLE — layers disagree** |
| Caffè Greco | 423 Columbus Ave | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Mara's Italian Pastry | 503 Columbus Ave | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Club Fugazi | 678 Green St | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Sentinel Building | 916 Kearny St | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Fugazi Bank Building | 4 Columbus Ave | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Bix | 56 Gold St | **Chinatown** | North Beach | STRADDLE — layers disagree |
| Kenneth Rexroth Place | 5 Kenneth Rexroth Pl | **Chinatown** | North Beach | STRADDLE — layers disagree |
| William Stout Books | 804 Montgomery St | **Chinatown** | North Beach | STRADDLE — Jackson Sq |
| Belli Building | 722 Montgomery St | **Chinatown** | North Beach | STRADDLE — Jackson Sq |
| Golden Era Building | 730 Montgomery St | **Chinatown** | North Beach | STRADDLE — Jackson Sq |
| Hotaling Building | 451 Jackson St | **Chinatown** | North Beach | STRADDLE — Jackson Sq |
| — | — | — | — | — |
| **City Lights Booksellers** | 261 Columbus Ave | **Chinatown** | **Chinatown** | **HARD CASE — both layers say Chinatown** |
| **Vesuvio Cafe** | 255 Columbus Ave | **Chinatown** | **Chinatown** | **HARD CASE — both layers say Chinatown** |
| **Jack Kerouac Alley** | 17 Jack Kerouac Aly | **Chinatown** | **Chinatown** | **HARD CASE — both layers say Chinatown** |
| **Comstock Saloon** | 155 Columbus Ave | **Chinatown** | **Chinatown** | **HARD CASE — both layers say Chinatown** |
| Piazza Pellegrini | 659 Columbus Ave | **Chinatown** | **Russian Hill** | **HARD CASE — neither layer says North Beach; see §7 caveat** |
| Bimbo's 365 Club | 1025 Columbus Ave | **Russian Hill** | **Russian Hill** | Probably Russian Hill's |
| Levi's Plaza | 1155 Battery St | Financial District/South Beach | Northern Waterfront | Not North Beach's |
| Otis Elevator Company Bldg | 1 Beach St | North Beach | **Fishermans Wharf** | STRADDLE with Fisherman's Wharf |

**The Columbus Avenue finding, stated plainly.** In the city's own layers the Chinatown/North
Beach boundary runs **along Columbus Avenue itself** through the lower blocks, so the even side
(242, 412, 430, 444, 446) is North Beach and the odd side (255, 261) is Chinatown. That single
fact puts City Lights and Vesuvio — the two places a reader most expects on a North Beach page —
on the Chinatown side of both official layers, while Tosca directly across the street is North
Beach. Comstock Saloon's own website describes itself as "at the crossroads of North Beach,
Chinatown, Financial District, and Jackson square"
(`https://www.comstocksaloon.com/`), which is honest and unusable as an assignment.

**I do not resolve any of this.** The arbitrator has Chinatown's, Fisherman's Wharf's, Russian
Hill's and the Financial District's finder files alongside this one.

---

## 4. Candidate records

Kinds are drawn from the thirteen the schema allows (`museum, theater, restaurant, cafe, brewery,
hotel, bnb, park, historic-site, amusement-park, shop, stadium, attraction`). There is no church,
square, monument or bridge kind; churches and monuments are proposed as `historic-site` or
`attraction`, and I flag where the fit is poor.

### 4.1 Marquee — parks, towers and civic fabric

**Washington Square** — `park`. Bounded by Filbert, Stockton, Union and Powell Streets;
SF Rec & Park gives the address as "Filbert and Stockton, San Francisco, CA 94133". Park hours
5 a.m. to midnight; restroom hours 8 a.m.–8 p.m. spring/summer, 8 a.m.–5:30 p.m. fall/winter.
Listed features: accessible children's play area, accessible parking, accessible restroom,
playground, restrooms. **San Francisco Landmark No. 226, designated in 1999.**
Sources: `https://sfrecpark.org/Facilities/Facility/Details/Washington-Square-388` (HTTP 200);
`https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`;
`https://sfplanninggis.org/docs/landmarks_and_districts/LM226.pdf` (HTTP 200).
*Note:* the surrounding **Washington Square Historic District is CR-eligible only — not a
designation.* Do not conflate with the park's own Landmark No. 226.

**Coit Tower** — `attraction`. 1 Telegraph Hill Boulevard, San Francisco, CA 94133. Hours daily
10 a.m.–6 p.m. April–October and 10 a.m.–5 p.m. November–March; closed Thanksgiving, Christmas
Day and New Year's Day. SF Rec & Park states completion in **1933**, design by the firm of
**Arthur Brown, Jr.**, and that the tower is named for **Lillie Hitchcock Coit**, who died in 1929
leaving a bequest "for the purpose of adding to the beauty of the city I have always loved". The
murals in the base were painted in **1934** by artists employed by the **Public Works of Art
Project**. Observation deck reached by elevator; tickets sold in the gift shop.
**San Francisco Landmark No. 165, designated in 1984.** **Listed on the National Register of
Historic Places in 2008 (reference number 07001468).**
Sources: `https://sfrecpark.org/facilities/facility/details/Coit-Tower-290` (HTTP 200);
`https://sfplanninggis.org/docs/landmarks_and_districts/LM165.pdf` (HTTP 200);
NPS map service (§2.3); nomination scan `https://catalog.archives.gov/id/123861079`.
*Photo note:* the tower is a **building** — 17 USC 120(a) applies and a Commons photograph from
public land is fine. The **interior murals are artworks and are not covered.**
*Straddle:* Analysis = North Beach, SF Find = Telegraph Hill.

**Filbert Steps** — `attraction`. Filbert Street east of Telegraph Hill Boulevard, descending to
Sansome Street. OSM way tagged `highway=steps`, `tourism=attraction`. Point-in-polygon places the
mid-block **inside the Telegraph Hill Historic District (Article 10, Ordinance 442-86, adopted
1986)**. The **Grace Marchant Garden** flanks it and tested **outside** that district.
Sources: Overpass (`<scratchpad>/nb/osm_nb2.json`); `m22e-6hkz` PIP.
*Caveat:* the steps are a public right of way with no operator and no hours; no source I fetched
states hours, so none should be given.

**Greenwich Steps** — `attraction`. Parallel descent north of the Filbert Steps. OSM
`highway=steps`. Same district caveat; I did not PIP the Greenwich alignment separately.

**Grace Marchant Garden** — `park`. On the Filbert Steps, Telegraph Hill. Trust for Public Land
page `https://www.tpl.org/our-work/grace-marchant-garden` (HTTP 200). Volunteer-maintained; no
gate, no stated hours. Tested **outside** the Telegraph Hill Historic District.
*Low confidence on kind:* it is a private-land garden open to the public, not a Rec & Park park.

**Pioneer Park** — `park`. The summit park around Coit Tower, Telegraph Hill. OSM
`leisure=park`, SF Find = Telegraph Hill. **SOURCE PROBLEM:** the SF Rec & Park facility URL I
tried (`.../Pioneer-Park-303`) returned a page for *In Chan Kaajal Community Garden* — a wrong
facility id, not a 404. I have **no verified official page** for Pioneer Park and no hours.
Do not publish hours or an address for it on my evidence.

**Jack Early Park** — `park`. Telegraph Hill, off Grant Avenue. OSM `leisure=park`.
Thinly sourced; see §7.

**Joe DiMaggio Playground** — `park`. 651 Lombard Street. Both layers North Beach. Site
`http://dimaggioplayground.org/` recorded from OSM `website` tag but not fetched.
Includes the North Beach Playground bocce courts (two OSM `leisure=pitch` ways).

**North Beach Branch Library** — `attraction` (poor fit; no `library` kind). 850 Columbus Avenue
per OSM; **the NRHP record gives 2000 Mason St.** for the same institution — the building occupies
the corner and both addresses appear in official sources, which is worth stating carefully or
avoiding. **Listed on the National Register of Historic Places in 2011 (reference number
11000501).** SFPL location page `https://sfpl.org/locations/north-beach` (HTTP 200) carries
current hours; I did not isolate this branch's row from the all-locations table, so **hours are
not established in this file.**

**Telegraph Hill Historic District** — `historic-site`. **Designated under Article 10 of the
Planning Code by Ordinance 442-86 in 1986** (Appendix G). 101 properties, 80 contributing.
SF Planning's description names Richard Neutra and Irvine Goldstine among its architects.
Source: `m22e-6hkz`; code text
`https://codelibrary.amlegal.com/codes/san_francisco/latest/sf_planning/0-0-0-28305#JD_Article10AppendixG`
(HTTP 200).

**Cable car turntable, Taylor & Bay** — `attraction`. OSM `tourism=attraction`, SF Find North
Beach. The Powell–Mason line's northern terminus. Thin sourcing; the Powell/Market turntable is
Union Square's per the roster, and this is a *different* turntable — a genuine find, but I have
only OSM for it. See §7.

### 4.2 Churches and religious buildings

**Saints Peter and Paul Church** — `historic-site`. 666 Filbert Street, on the north side of
Washington Square. SF Planning's parcel record (`3tsw-4idn`, APN 0089016) gives
**`yearbuilt` 1915**. **NOT an Article 10 landmark** — I dumped every Article 10 row whose name
contains "church", "peter", "paul" or "shrine" and it is absent. Its parcel `ceqacodereason` is
"California Register Historic District", which refers to the **CR-eligible** Washington Square
Historic District and **is not a designation**. **NO DESIGNATION CLAIM PUBLISHES for this
building on my evidence.**
**SOURCE PROBLEM:** every parish domain I tried failed DNS or 404 — `stspeterpaulsf.org`,
`www.stspeterpaulsf.org`, `spp-sf.org`, `sspeterandpaulsf.org`, and the archdiocese parish
directory returned HTTP 404. So **no hours, no mass times and no official description are
established.** A page can say what it is and where it is; it cannot state hours.

**National Shrine of Saint Francis of Assisi** — `historic-site`. **610 Vallejo Street per the
shrine's own site**, but **620–624 Vallejo Street in the Article 10 dataset** — an address
discrepancy to resolve before publishing a number. **San Francisco Landmark No. 5, designated in
1968.** Parcel record names "ST. FRANCIS OF ASSISI", `yearbuilt` 1900, `ceqacodea10a11 = A*`
"Article 10 Individual Landmark". Shrine main church hours Tuesday–Saturday 10 a.m.–5 p.m.,
Sunday 10 a.m.–2 p.m., closed Monday. Porziuncola Nuova hours Thursday, Friday and Saturday
10 a.m.–4 p.m. Mass Tuesday–Saturday 12:15 p.m., Sunday 11 a.m. Confessions Tuesday–Saturday
11 a.m.–noon. Run by the Capuchin Franciscans. Office phone (415) 986-4557.
Sources: `http://shrinesf.org/` (HTTP 200 over plain HTTP; **HTTPS returned 403**);
`https://sfplanninggis.org/docs/landmarks_and_districts/LM5.pdf` (HTTP 200).

**San Francisco Chinese Baptist Church** — OSM `place_of_worship`, SF Find North Beach.
Unsourced beyond OSM; listed for completeness only.

**Church of Scientology of San Francisco** — occupies **4 Columbus Avenue**, which is the
**Fugazi Bank Building / Transamerica Building, San Francisco Landmark No. 52, designated in
1973** (parcel `yearbuilt` 1911). The building's designation is citable; the occupant is a
separate question and I make no recommendation.

### 4.3 Beat-associated places (nearly all straddlers — read §3 first)

**City Lights Booksellers & Publishers** — `shop`. 261–271 Columbus Avenue. **San Francisco
Landmark No. 228, designated in 2001.** Parcel record names "CITY LIGHTS BOOKSTORE",
`yearbuilt` **1907**, `ceqacodea10a11 = A*` "Article 10 Individual Landmark".
**BOTH boundary layers place it in Chinatown.** Official site `https://citylights.com/` returned
**HTTP 307** on three attempts including `/visit/` and the `www.` host — cross-host redirect not
followed per tooling policy, so **no hours are established from the operator.**
Sources: `97yj-54sx`; `https://sfplanninggis.org/docs/landmarks_and_districts/LM228.pdf`
(HTTP 200); `3tsw-4idn`.

**Vesuvio Cafe** — `bar`… **no `bar` kind exists**; propose `restaurant` or `attraction` and flag.
255 Columbus Avenue, at Jack Kerouac Alley. Own site states hours **Sun–Thurs 11–1, Fri–Sat
11–2** and the address "255 Columbus @ Jack Kerouac Alley, North Beach San Francisco California".
Note the operator self-describes as North Beach while **both city layers say Chinatown** — good
material for the arbitrator, and the operator's own neighborhood label is not authority.
"Serving All Wanderers Since 1948" is a trading-duration claim from the operator's own site and
**does not publish**. Source: `https://www.vesuvio.com/` (HTTP 200).

**Jack Kerouac Alley** — `attraction`. Between Columbus Avenue and Grant Avenue, linking
City Lights and Vesuvio to Chinatown. EAS address "17 JACK KEROUAC ALY", **nhood Chinatown**;
SF Find also Chinatown. The alley carries **inlaid poetry and the "Language of Birds" installation
nearby** — *artworks*, so the photo refinement applies and the artist/death-year test is unmet.
Source: `https://data.sfgov.org/resource/3mea-di5p.json` EAS query.

**The Beat Museum** — `museum`. 540 Broadway. **OPERATIONAL CAVEAT, important:** the museum's own
site announces a temporary closure for a soft-story seismic retrofit — "Now – Nov. 30, 2025 normal
operating hours; Dec. 2025 – Mid/Late 2026 building vacated for retrofit; 2026 Grand Reopening
(date to be announced)". As of the research date the reopening date is **not announced**, so
**no hours should be published** and the page should not assert that it is open. The site states
the building was **built in 1910** and is the **Swiss-American Hotel Building**; the parcel record
independently gives `yearbuilt` 1910. Both layers place it in North Beach.
Source: `https://www.kerouac.com/` (HTTP 200).

**Caffe Trieste** — `cafe`. 601 Vallejo Street, with the Caffe Trieste Annex Retail Store at 609
Vallejo Street. Own site gives phone (415) 392-6739 and Annex (415) 982-2605, and hours
"Monday – Sunday 7:00 am – 10:00 pm" for the cafe and Mon–Fri 10–5:30, Sat 10–6, closed Sunday
for the Annex — but **the page carrying those hours is dated June 18, 2020 and is a reopening
notice**, so the hours are stale and should be re-verified before publishing. Sits inside the
**CR-eligible** Upper Grant Avenue Historic District — **not a designation.** "Over 50 years" and
"Celebrating 65 Years" are trading-duration claims from the operator and do not publish.
Source: `https://caffetrieste.com/` (HTTP 200).

**Specs' Twelve Adler Museum Cafe** — 12 William Saroyan Place. OSM `amenity=pub`, SF Find North
Beach. **No EAS row for "WILLIAM SAROYAN"** street name, so I could not confirm the zone from the
city's address layer. Thinly sourced; see §7.

**Kenneth Rexroth Place, Bob Kaufman Alley, Via Ferlinghetti, Peter Macchiarini Steps,
Jack Micheline Place** — named alleys and stairs commemorating Beat and North Beach figures, all
confirmed in the EAS or OSM. Zone splits recorded in §3. These are streets, not places with
operators; a guide can name them and say where they run, nothing more on my evidence.

**Sentinel Building / Columbus Tower** — `historic-site`. 916–920 Kearny Street. **San Francisco
Landmark No. 33, designated in 1970.** OSM records architects "Salfield & Kohlberg". Houses Cafe
Zoetrope. Straddler: Analysis Chinatown, SF Find North Beach.
Source: `97yj-54sx`; `https://sfplanninggis.org/docs/landmarks_and_districts/LM33.pdf`.

### 4.4 Italian North Beach — food, drink and shops

Zone confirmations for all of these are in §3. Where I give a construction year it is SF
Planning's parcel `yearbuilt` (dataset `3tsw-4idn`), which is an assessor-derived figure and
should be treated as needing corroboration before it becomes a load-bearing sentence — one of its
values (Bauer & Schweitzer, `yearbuilt` 2001 for an 1881-era malt house) is plainly a
reconstruction date, which is the proof that the field is not a build date in every row.

| Place | Kind | Address | Parcel `yearbuilt` | Sourced extras |
|---|---|---|---|---|
| Molinari Delicatessen | shop | 373 Columbus Ave | 1910, parcel named "P G MOLINARI & SONS" | `https://www.themolinarideli.com/` HTTP 200 |
| Liguria Bakery | shop | 1700 Stockton St | — (no parcel row matched) | OSM; en:Liguria Bakery |
| Victoria Pastry Company | shop | 700 Filbert St | — | OSM |
| Stella Pastry | shop | 446 Columbus Ave | 1906/1907 (ambiguous match) | OSM |
| Mara's Italian Pastry | shop | 503 Columbus Ave | — | OSM; **straddler** |
| Biordi Art Imports | shop | 412 Columbus Ave | 1924, parcel "COLUMBUS BUILDING" | `https://www.biordi.com/` HTTP 200 |
| Little City Market | shop | Grant Ave | — | OSM `shop=butcher` |
| XOX Truffles | shop | — | — | `https://www.chocolatepicture.com/` HTTP 200 but **0 chars of text** |
| Z Cioccolato | shop | 474 Columbus Ave | — | OSM |
| Telegraph Hill Books | shop | 1501 Grant Ave | 1917 | `https://telegraphhillbooks.com/` HTTP 200 |
| Libreria Pino | shop | 548 Union St | — | OSM |
| 101 Music | shop | 1414 Grant Ave | — | OSM |
| William Stout Architectural Books | shop | 804 Montgomery St | — | `https://stoutbooks.com/`; **straddler, Jackson Sq** |
| Original Joe's | restaurant | 601 Union St | 1912, parcel "BERSAGLIERI HALL; FIOR…" | `https://originaljoes.com/` HTTP 200 |
| Tony's Pizza Napoletana | restaurant | 1570 Stockton St | 1907 | own site **HTTP 403**, http and https |
| Sotto Mare | restaurant | 552 Green St | 1906 | `https://www.sottomaresf.com/` HTTP 200 |
| Golden Boy Pizza | restaurant | 542 Green St | 1913 | `https://goldenboypizza.com/` HTTP 200 |
| Mama's on Washington Square | restaurant | 1701 Stockton St | — | OSM; en:Mama's (restaurant) |
| Ristorante Fior d'Italia | restaurant | 2237 Mason St | — | `https://fior.com/` HTTP 200 |
| Tommaso's Ristorante Italiano | restaurant | 1042 Kearny St | 1907 | `https://www.tommasos.com/` |
| The Stinking Rose | restaurant | 430 Columbus Ave | — | `https://thestinkingrose.com/` HTTP 200 |
| Mario's Bohemian Cigar Store Cafe | cafe | 566 Columbus Ave | — | `https://mariosbohemian.com/` HTTP 200 |
| Caffè Greco | cafe | 423 Columbus Ave | — | OSM; **straddler** |
| Caffè Sport, Bocce Cafe, Sodini's, Maykadeh, Il Casaro, Il Pollaio, Piazza Pellegrini, Trattoria-style others | restaurant | Green/Columbus/Grant | — | OSM only |
| The Saloon | restaurant/attraction | 1232 Grant Ave | 1900 | own site `sfblues.net` **404 and TLS failure** |
| Savoy Tivoli | restaurant/attraction | 1434 Grant Ave | 1913 | OSM |
| Comstock Saloon | restaurant | 155 Columbus Ave | 1907 (parcel "SAINT PAUL HOTEL") | `https://www.comstocksaloon.com/`; **HARD straddler** |
| Tosca Cafe | restaurant | 242 Columbus Ave | 1909 | own site **404 both schemes** |
| 15 Romolo | restaurant | 15 Romolo Pl | — | `https://www.15romolo.com/` |
| Gino and Carlo | restaurant | 548 Green St | — | OSM |
| Bix | restaurant | 56 Gold St | — | `https://www.bixrestaurant.com/`; **straddler** |
| Cotogna | restaurant | 490 Pacific Ave | — | `https://www.cotognasf.com/` |

**Buon Gusto Sausage Factory** — `historic-site`. 535 Green Street. **Listed on the National
Register of Historic Places in 2021 (reference number 100006073).** Parcel record for the named
"BUON GUSTO SAUSAGE" property gives `yearbuilt` 1948 and reason "National Register Individual".
A strong, clean, numbered find that is not in the brief's list.

**Old Spaghetti Factory Cafe** — `historic-site` (the building; the restaurant is long closed).
478 Green Street. **San Francisco Landmark No. 127, designated in 1981.** The address now hosts
Bocce Cafe per OSM — **verify occupancy before writing anything in the present tense.**

**Paper Doll Bar** — `historic-site`. 524 Union Street. **San Francisco Landmark No. 287,
designated in 2019.** Parcel `yearbuilt` 1908, `A*` "Article 10 Individual Landmark". Designated
for its significance in LGBTQ history per the designation document
`https://sfplanninggis.org/docs/landmarks_and_districts/LM287.pdf` (HTTP 200) — **I did not read
the PDF body**, only confirmed it resolves, so the significance statement above is a lead, not a
sourced fact.

**Bauer & Schweitzer Malting Company** — `historic-site`. 530–550 Chestnut Street. **San Francisco
Landmark No. 129, designated in 1981.** Parcel `yearbuilt` 2001 — treat as a reconstruction date
and do not publish it as the build year.

**Julius Castle** — `historic-site`. 302–304 Greenwich Street. **San Francisco Landmark No. 121,
designated in 1980.** Parcel `yearbuilt` 1923, named "JULIUS CASTLE". Straddler (Telegraph Hill by
SF Find). Tested **outside** the Telegraph Hill Historic District.

### 4.5 Theatres, music and nightlife

**Club Fugazi** — `theater`. 678 Green Street. Parcel record names "FUGAZI BUILDING",
`yearbuilt` **1912**. Own site confirms the address and the current production "Dear San
Francisco" by The 7 Fingers, plus a "Fugazi Funny Festival"; the site carries a "Venue History"
page and a "The Pickle Family Circus" page I did not fetch. **Straddler:** Analysis Chinatown,
SF Find North Beach. Source: `https://www.clubfugazisf.com/` (HTTP 200).

**Condor Club** — `restaurant`/`attraction` (no nightclub kind). 560 Broadway. Parcel
`yearbuilt` 1907. Own site gives phone 415-781-8222. **"San Francisco's Original Topless Club"
and "Since 1964" are a superlative and a trading-duration claim respectively and neither
publishes.** Source: `https://www.condorsf.com/` (HTTP 200).

**Bimbo's 365 Club** — `theater`. 1025 Columbus Avenue (parcel range 1001–1025), `yearbuilt`
1931. Own site lists a current show calendar with door and show times.
**BOTH layers place it in Russian Hill** — probably not North Beach's. Source:
`https://www.bimbos365club.com/` (HTTP 200).

**The Lost Church** — `theater`. 988 Columbus Avenue. `https://thelostchurch.org/` from OSM;
not fetched.

**Peña Pachamama, Monroe, Paname, Cold Drinks Bar, Grant & Green, Chief Sullivan's,
Maggie McGarry's, Kell's, Tope, Tony Nik's, Columbus Cafe, Bodega Wine Bar, Little Vine,
Otherwise Brewing (`brewery`)** — OSM-only nightlife and bar candidates within the SF Find North
Beach polygon. Listed so the verifier can see the tail; none is independently sourced.

### 4.6 Lodging

**Hotel Boheme** — `hotel`. 444 Columbus Avenue. `http://www.hotelboheme.com/` (HTTP 200).
**San Remo Hotel** — `hotel`. 2237–2239 Mason Street, parcel `yearbuilt` 1907.
`https://www.sanremohotel.com/` (HTTP 200).
**Washington Square Inn** — `hotel`/`bnb`. On Washington Square; OSM only.
**Green Tortoise Hostel** — 494 Broadway; OSM `tourism=hostel`. **No `hostel` kind exists** —
would have to be `hotel`, which is a poor fit. Flagged.
**The Basque Hotel** (15 Romolo Place), **Golden Eagle Hotel**, **Castro Hotel** (723–731
Vallejo), **Il Triangolo Hotel** (524 Columbus) — OSM `tourism=hotel` tags on residential-hotel
buildings; several are almost certainly SRO housing rather than visitor lodging. **Do not publish
any of these as hotels without independent confirmation.**

### 4.7 Monuments, plaques and public art — photo refinement applies to all

None of these is a building, so 17 USC 120(a) does **not** cover them and each needs its artist
and death year established before any photograph.

- **Statue of Benjamin Franklin**, Washington Square. OSM `memorial`; en:Statue of Benjamin
  Franklin (San Francisco).
- **Volunteer Firefighters Memorial**, Washington Square. SF Rec & Park's Coit Tower text
  confirms Lillie Hitchcock Coit's bequest funded "a monument to Coit's beloved volunteer
  firefighters, in nearby Washington Square". OSM `memorial`, `start_date` 1933.
- **Guglielmo Marconi Memorial**, Telegraph Hill. OSM `memorial`.
- **"Language of Birds"**, Broadway/Columbus at Jack Kerouac Alley. OSM `artwork`.
- **Telegraph Hill Semaphore**, **Juana Briones plaque** (links to
  `https://ohp.parks.ca.gov/listedresources/…` — a **California Historical Landmark** lead I did
  not chase to a number), **"1st Jewish Religious Services in SF"** plaque, **Frank Marini**
  (`start_date` 1949, SF Arts Commission kiosk link), **Jazz mural**, **Rosie the Riveter Plaza**.
- **Christopher Columbus statue** — formerly at Coit Tower; **removed in 2020**. I did not source
  the removal and it must not be written as present.

**Unchased lead worth the next agent's time:** the California Office of Historic Preservation
listed-resources database (`https://ohp.parks.ca.gov/listedresources/`) appears in two OSM tags in
this zone (Juana Briones; the "Farnsworth Building" on Telegraph Hill). **California Historical
Landmark numbers are exactly the kind of register-plus-identifier this programme wants** and I ran
out of budget before querying it. That is the single largest remaining gap in §2.

### 4.8 Jackson Square cluster — 20+ Article 10 landmarks, ownership contested

The Analysis layer says **Chinatown**, SF Find says **North Beach**, SF Planning's own
`neighborhood` field on the Jackson Square Historic District record says **North Beach**, and the
roster's zone list gives "Jackson Square" to the **Financial District**. Four sources, three
answers. **This is the largest single ownership question I am handing up.**

Article 10 landmarks in the cluster, all from `97yj-54sx`, all Analysis=Chinatown /
SF Find=North Beach: **LM 9** Langerman's/Belli Building (722 Montgomery, 1969), **LM 10**
Genella Building/Belli Annex (728–730 Montgomery, 1969), **LM 11** Hotaling Stables (32–42
Hotaling Pl, 1969), **LM 12** Hotaling Building (451–461 Jackson, 1969), **LM 13** Hotaling
Annex-East (443–445 Jackson, 1969), **LM 14** Medico-Dental Building (435–441 Jackson, 1969),
**LM 15** Old Ghirardelli Building (415–431 Jackson, 1969), **LM 16** Regency House/Ghirardelli
Annex (407 Jackson, 1969), **LM 19** Golden Era Building (730 Montgomery, 1969), **LM 20**
Hotaling Annex West (463–473 Jackson, 1970), **LM 22** Solari Building East (468–470 Jackson,
1970), **LM 23** Solari Building West (472 Jackson, 1970), **LM 24** Yeon Building (432 Jackson,
1970), **LM 25** Moulinie Building (458–460 Jackson, 1970), **LM 26** Bank of Lucas, Turner & Co
(800–802 Montgomery, 1970), **LM 27** Grogan-Atherton-Lent Building (701 Sansome, 1970),
**LM 212** Columbia Savings Bank Building (15 Hotaling Pl, 2000).

Plus **Old Ohio Street Houses**, 17–55 Osgood Place — **Listed on the National Register of
Historic Places in 1979 (reference number 79000535)**; SF Planning's `neighborhood` field for the
district says *Financial District* while both boundary layers say North Beach. Nomination:
`https://catalog.archives.gov/id/123861228`.

**I claim none of these.** They are recorded here so the arbitrator sees the full set in one place.

---

## 5. Explicit straddler list (the thing I am required to flag, consolidated)

1. **City Lights Booksellers (LM 228)** — both layers Chinatown; every travel source calls it
   North Beach. Contest with Chinatown.
2. **Vesuvio Cafe** — both layers Chinatown; operator self-describes as North Beach.
3. **Jack Kerouac Alley** — both layers Chinatown; it physically links the two zones.
4. **Comstock Saloon** — both layers Chinatown; operator names four neighborhoods at once.
5. **Coit Tower (LM 165 / NRHP 07001468)** — Analysis North Beach, SF Find Telegraph Hill.
   Telegraph Hill was **declined as a zone** by the roster with the note that Coit Tower is
   "North Beach's marquee", which reads as a steer but is not a ruling.
6. **Filbert Steps, Greenwich Steps, Grace Marchant Garden, Jack Early Park, Julius Castle
   (LM 121), House at 1254–1256 Montgomery (NRHP 79000532), Bob Kaufman Alley** — same
   North Beach / Telegraph Hill split.
7. **The entire Jackson Square cluster (§4.8)** — Chinatown vs North Beach vs Financial District.
8. **Molinari, Caffè Greco, Mara's, Club Fugazi, Sentinel Building (LM 33), Fugazi Bank Building
   (LM 52), Bix, Kenneth Rexroth Place** — Analysis Chinatown, SF Find North Beach.
9. **Otis Elevator Company Building (NRHP 99001265)** — Analysis North Beach, SF Find Fisherman's
   Wharf. Contest with Fisherman's Wharf.
10. **Northeast Waterfront Historic District (Article 10, Ord. 171-83)** — SF Planning says North
    Beach; geography says the Embarcadero edge, which the roster folded into Financial District
    and Fisherman's Wharf.
11. **Bimbo's 365 Club** and **Piazza Pellegrini** — both layers say Russian Hill (Piazza
    Pellegrini: Analysis Chinatown / SF Find Russian Hill). Probably **not** North Beach's despite
    sitting in the popular idea of it.
12. **Levi's Plaza** — Financial District / Northern Waterfront by both layers. Not North Beach's.
13. **Everything the Analysis polygon puts in "North Beach" north of Bay Street** — Pier 39,
    Aquarium of the Bay, Musée Mécanique, Ripley's, the Skystar Wheel, Boudin, Scoma's and ~40
    souvenir shops. These are **Fisherman's Wharf's** and I do not claim them; they are named here
    only so the arbitrator knows the Analysis layer will hand them to North Beach if anyone runs
    that query naively.

**The Transamerica Redwood Park question from the brief.** The Transamerica Pyramid is assigned to
the Financial District by the roster. My PIP put the Pyramid at Analysis=Chinatown /
SF Find=Financial District. Redwood Park is its plaza. **I did not find an independent official
source for Redwood Park** and I do not claim it; on my evidence it is not North Beach's, and the
brief's "Transamerica Redwood Park edge" is better read as the Jackson Square edge (§4.8).

---

## 6. Guide or town page — my judgement

**A guide, comfortably.** North Beach clears every bar the corpus has used: seven Article 10
individual landmarks inside the conservative boundary and ten within reach, two Article 10
historic districts, eight NRHP listings with reference numbers, a marquee attraction with
published hours and a named architect (Coit Tower), a second marquee civic space with published
hours (Washington Square), a designated church, a working cluster of long-established food and
drink businesses with live official websites, and a literary layer that is internationally legible
even after the boundary problem removes its two most famous addresses.

The zone survives even the harshest arbitration. If City Lights, Vesuvio, Jack Kerouac Alley and
the whole Jackson Square cluster are all handed to Chinatown and the Financial District, North
Beach still holds Washington Square (LM 226), Coit Tower (LM 165 / NRHP 07001468), the National
Shrine of Saint Francis of Assisi (LM 5), Saints Peter and Paul Church, the Filbert and Greenwich
Steps, Paper Doll Bar (LM 287), Old Spaghetti Factory Cafe (LM 127), Bauer & Schweitzer (LM 129),
Buon Gusto Sausage Factory (NRHP 100006073), the North Beach Branch Library (NRHP 11000501),
Caffe Trieste, The Beat Museum, Condor Club, and twenty-plus sourced Italian food and drink
addresses. That is a guide.

---

## 7. Candidates I am least confident about

**1. Piazza Pellegrini (659 Columbus Avenue).** The EAS returns exactly one row for this address
and it geocodes to **37.80098, −122.41150**, which point-in-polygon puts in **Russian Hill** on the
SF Find layer and **Chinatown** on the Analysis layer. Both answers are wrong to the eye — 659
Columbus is on Washington Square, and a Chinatown assignment for a point at latitude 37.801 is not
credible. I think the EAS coordinate for this address is bad, but **I did not prove it**, and I
will not launder a guess into a boundary claim. Treat every zone assignment for this address as
unreliable, and note that if the EAS coordinate is bad for one Columbus Avenue address it may be
bad for others in the same block.

**2. Saints Peter and Paul Church.** It is the second-most-recognisable building in the zone and
I have **no working official source for it at all** — four candidate parish domains failed DNS or
returned 404, and the archdiocese directory 404'd. Everything I have is a parcel record
(`yearbuilt` 1915) and an OSM node. It is not an Article 10 landmark and its only register-ish
attribute is membership of a **CR-eligible** district, which does not publish. So the church can
be named, placed and dated-by-parcel and nothing else — and a writer who assumes a building this
famous must be designated will fail the build. Highest-risk entry in the file.

**3. The Beat Museum.** Sourcing is good but the **fact pattern is time-sensitive and may already
be stale**: the operator's own notice says the building was vacated for retrofit through
"mid/late 2026" with a reopening "date to be announced", and the research date is September 2026.
I cannot tell from the site whether it has reopened. Anything written in the present tense about
visiting it is a claim I have not established, and the honest page states what it is and where it
is without hours.

Runners-up on the same axis: **Pioneer Park** (the Rec & Park facility id I tried served a
different park's page, so I have no official page and no hours); **Specs'** (no EAS row for
William Saroyan Place, so the zone rests on OSM alone); **the residential-hotel cluster in §4.6**,
several of which are probably SRO housing that OSM has tagged `tourism=hotel`.

---

## 8. Photograph leads for the later wave (prose only, no URLs, nothing sourced)

Coit Tower from Pioneer Park and from the Filbert Steps — a **building**, so 17 USC 120(a)
applies and a Commons file under an acceptable licence should publish without an artist test. The
same is true of Saints Peter and Paul's twin spires from Washington Square, the Sentinel Building's
flatiron from Columbus Avenue, the Fugazi Bank Building, Julius Castle, the Bauer & Schweitzer
malt house and the Jackson Square brick fronts. **The Coit Tower interior murals, the Language of
Birds installation, the Jack Kerouac Alley inlays, the Benjamin Franklin statue, the Volunteer
Firefighters Memorial and the Marconi Memorial are artworks and are NOT covered by 120(a)** —
each needs its artist and death year established before any photograph of it publishes.

---

## 9. Reproducibility

Scripts, in order: `s1`–`s3` catalog discovery, `s4` Article 10 pull, `s5` boundary layers,
`s6`–`s7` landmark classification and straddle box, `s8`–`s10` historic districts, `s11`–`s13`
NPS NRHP, `s14`–`s17` Overpass sweeps, `s18`–`s19` Nominatim (rate-limited), `s20`–`s21` EAS
geocoding, `s22` anomaly checks, `s23` parcel bulk pull, `s24`–`s26` district containment,
`s27`–`s29` official sites, `s30` gap-filling, `s31` designation-document HEAD checks.
Derived data: `lm_classified.json`, `nrhp_ne.json`, `osm_nb.json`, `osm_nb2.json`, `eas.json`,
`parcels.json` (6,181 parcels), `sites.json`, `nominatim.json`.
All under `/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/nb/`.

**Sources that answered (HTTP 200):** DataSF Socrata catalog and resource APIs, SF Planning GIS
designation PDFs (`sfplanninggis.org`), American Legal code library, NPS ArcGIS map service,
NARA catalog, Overpass API (`overpass-api.de`), SF Rec & Park, SFPL, and the operator sites named
inline. **Sources that failed:** Nominatim (HTTP 429 after 9 requests, and an unreliable
`neighbourhood` field), `citylights.com` (HTTP 307), all four Saints Peter and Paul candidate
domains, `sfheritage.org` (403), `tonyspizzanapoletana.com` (403), `toscacafesf.com` (404),
`sfblues.net` (404/TLS), the SF Rec & Park Pioneer Park facility id (served the wrong park).
