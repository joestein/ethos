# Nob Hill, San Francisco — FINDER

Compiled 2026-09-03. Zone slug `nob-hill`, destination string `Nob Hill, California`
(per `priv/seed_data/san_francisco_roster.json`). This file is the research record, not
reader-facing prose: provenance arguments, failed sources and superlatives quoted from
sources all live here and must not cross into a seed file.

**Collision check run before anything else.** `python3 .superpowers/taken_slugs.py` reads
only `priv/seed_data/rome/*.json`, so it does not cover the corpus its docstring claims.
I scanned all 350 committed seed files across `priv/seed_data/*/` directly — 3,921 places.
Nothing in Nob Hill's candidate set collides by slug or by name. The nearest name matches
are all elsewhere: `grace-episcopal-church-city-island` (Bronx), `grace-farms` (New Canaan),
`collis-p-huntington-state-park` (Redding CT), `hopkins-inn` (Warren CT), `hotel-stanford`
(Koreatown). None is a San Francisco place. The seven Oracle Park code-seed slugs are all
Mission Bay/Mission Rock and touch nothing here.

**Judgement: this is a GUIDE, not a town page.** Nob Hill carries seven Article 10
landmarks inside the analysis-neighborhood boundary, two National Historic Landmarks, a
cathedral with published dimensions and hours, a working museum inside an operating
powerhouse, a public park with two catalogued sculptures, and enough restaurants, bars and
hotels to fill entry kinds `sight`, `stay`, `food` and `walk`. The material is dense and
mostly citable to a register.

---

## 1. HOW ZONE MEMBERSHIP WAS ESTABLISHED

Three independent readings were taken for every candidate. They do not agree, which is why
straddlers are flagged rather than resolved here.

| source | dataset | what it is |
|---|---|---|
| DataSF Analysis Neighborhoods | `j2bu-swwd` — https://data.sfgov.org/resource/j2bu-swwd.json | 41 official planning units; has a `Nob Hill` polygon |
| DataSF SF Find Neighborhoods | `gfpk-269f` — https://data.sfgov.org/resource/gfpk-269f.json | 117 vernacular units; has BOTH `Nob Hill` and `Lower Nob Hill` |
| Nominatim reverse geocode | https://nominatim.openstreetmap.org/reverse | returns `quarter` / `neighbourhood` per point |

Note the two DataSF datasets whose IDs appear first in a catalogue search (`p5b7-5n3h`,
`pty2-tcw4`) return rows with **no columns at all** over the SODA API — the geometry and
name fields are not exposed. `j2bu-swwd` and `gfpk-269f` are the same layers with readable
`nhood` / `name` columns and are the ones used. Catalogue queried through
`https://api.us.socrata.com/api/catalog/v1?search_context=data.sfgov.org&domains=data.sfgov.org`;
without `search_context` the federated catalogue returns other cities' datasets and
`domains=` alone yields zero results.

Point-in-polygon was done in plain Python (even-odd ray casting over exterior rings) and
sanity-checked against known points: the Lombard crooked block returns Russian Hill in both
datasets, Grace Cathedral returns Nob Hill in both, the Powell/Market turntable returns
Tenderloin / Downtown-Union Square. The method separates the neighbourhoods correctly.

**Bounding facts.** The Analysis Neighborhood `Nob Hill` polygon spans
lon −122.42278…−122.40715, lat 37.78662…37.79910. It is much larger than the vernacular
hill: it reaches south past Bush to about Geary, absorbing what SF Find calls
`Lower Nob Hill`, and it reaches north on the eastern side to Broadway, absorbing blocks
SF Find gives to Russian Hill. SF Find's `Nob Hill` polygon is the tighter reading
(lon −122.42011…−122.40715, lat 37.78983…37.79651).

**Nominatim is the weakest of the three and should be discounted.** It returns
`suburb: South of Market` for every single Nob Hill point tested, which is plainly wrong.
Its `quarter` field is usable and mostly returns `Nob Hill`, but it puts the Chambord
Apartments, the Brocklebank and the Nob Hill Cafe in `Chinatown` — all three sit well
inside both DataSF Nob Hill polygons. Its `neighbourhood` field returns `Lower Nob Hill`
for Grace Cathedral, the Fairmont, Huntington Park and the Masonic, which contradicts SF
Find directly. Recorded for completeness; not relied on.

---

## 2. DESIGNATION NUMBERS FOUND

**Total: 17 Article 10 landmark numbers and 9 National Register reference numbers** across
the candidate set. Two of the NRHP entries are National Historic Landmarks. Of the Article
10 numbers, 12 fall inside the Analysis Neighborhood polygon (8 of those also inside the
tighter SF Find polygon) and 5 more are straddlers SF Find or the analysis layer places in
Nob Hill while the other disagrees. A tenth NRHP number, 100009644, was found but is
unusable — see §4.

### Sources
- Article 10 landmarks, all 370 of them, with number, name, address, year designated,
  APN and a designation-document URL:
  https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000
  (dataset "Landmarks Listed in Article 10 of the San Francisco Planning Code", `97yj-54sx`)
- Historic districts with California Register / National Register / Article 10 status:
  https://data.sfgov.org/resource/63x5-g3m4.json?$limit=400 (`63x5-g3m4`)
- Parcel-level CEQA historic status and year built:
  https://data.sfgov.org/resource/3tsw-4idn.json (`3tsw-4idn`)
- National Register point layer:
  https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query
- National Register **polygon** layer (this is where the districts and the NHLs live —
  layer 0 alone is incomplete and misses the Flood Mansion, the cable cars and the Lower
  Nob Hill district entirely):
  https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query

### Article 10 landmarks INSIDE the Analysis Neighborhood

| No. | name (as designated) | address | designated | SF Find hood |
|---|---|---|---|---|
| 42 | Dennis T. Sullivan Memorial Home | 870 Bush Street | 1971 | Lower Nob Hill |
| 43 | Cable Car Barn And Power House | 1201 Mason Street | 1971 | Nob Hill |
| 64 | Old Flood Mansion – Pacific Union Club | 1000 California Street | 1974 | Nob Hill |
| 106 | Chambord Apartments | 1298 Sacramento Street | 1979 | Nob Hill |
| 170 | Grace Cathedral | 1051–1055 Taylor Street | 1984 | Nob Hill |
| 184 | Mark Hopkins Hotel | 850 Mason Street | 1987 | Nob Hill |
| 185 | Fairmont Hotel | 950 Mason Street | 1987 | Nob Hill |
| 251 | Glazer-Keating House | 1110 Taylor Street | 2005 | Nob Hill |
| 36 | Feusier Octagon House / Kenny Residence | 1067 Green Street | 1970 | **Russian Hill** |
| 46 | House Of The Flag; Old Sheppard-Dakin House | 1652–1656 Taylor Street | 1972 | **Russian Hill** |
| 97 | Atkinson-Escher House | 1032 Broadway Street | 1977 | **Russian Hill** |
| 204 | Our Lady of Guadalupe Church | 906 Broadway Street | 1993 | **Russian Hill** |

Each has a designation document at
`https://sfplanninggis.org/docs/landmarks_and_districts/LM<number>.pdf` and most have a
photograph at `https://sfplanninggis.org/Preservation/Landmarks/Large/<number>.jpg`.
**These PDFs are scanned images with no extractable text** — I decompressed the streams and
recovered only image data. They confirm number, name, address and year (already in the
dataset) and yield no architect or construction date.

### Article 10 landmarks SF Find puts in Nob Hill but the Analysis Neighborhood does not

| No. | name | address | designated | analysis hood |
|---|---|---|---|---|
| 44 | Donaldina Cameron House | 920 Sacramento Street | 1971 | Chinatown |
| 122 | Clay Street Center | 965 Clay Street | 1981 | Chinatown |
| 235 | Chinatown Branch Carnegie Library | 1135 Powell Street | 2002 | Chinatown |
| 159 | Gaylord Hotel | 620 Jones Street | 1983 | Tenderloin (SF Find: Lower Nob Hill) |
| 195 | Islam Temple (Alcazar Theater) | 650 Geary Boulevard | 1989 | Tenderloin (SF Find: Lower Nob Hill) |

### National Register reference numbers

| NRHP ref | name | address | listed | NHL? |
|---|---|---|---|---|
| **66000230** | Flood, James C., Mansion | California and Mason Sts. | 1966-11-13 | **yes** |
| **66000233** | San Francisco Cable Cars | 1390 Washington St. | 1966-10-15 | **yes** |
| 02000373 | Fairmont Hotel | 950 Mason St. | 2002-04-17 | no |
| 84001184 | Chambord Apartments | 1298 Sacramento St. | 1984-09-20 | no |
| 91000957 | Lower Nob Hill Apartment Hotel District | roughly 590–1209 Bush, 680–1156 Sutter, 600–1099 Post Sts. | 1991-07-31 | no |
| 74000554 | Feusier Octagon House | 1067 Green St. | 1974-03-24 | no |
| 87002289 | Russian Hill–Vallejo Street Crest District | roughly 1020–1032 Broadway, 1–49 Florence, 1728–1742 Jones, 1–7 Russian Hill Pl., 1629–1715 Taylor, 1000–1085 Vallejo | 1988-01-22 | no |
| 87002288 | Russian Hill–Paris Block Architectural District | roughly 1017–1067 Green St. | 1988-01-07 | no |
| 87002290 | Engine House No. 31 | 1088 Green St. | 1988-01-07 | no |

The last four are Russian Hill's by name and by SF Find; they are listed because the
Analysis Neighborhood `Nob Hill` polygon overlaps them and the arbitrator needs to see that.

**Two districts overlap Nob Hill materially**, from `63x5-g3m4`:
- **San Francisco Cable Car Historic District** — `cr: Listed`, `nr: Listed`, period 1873,
  adopted 1978-04-03. 281 polygon vertices fall inside the Nob Hill polygon; this is the
  track network itself.
- **Lower Nob Hill Apartment Hotel Historic District** — `cr: Listed`, `nr: Listed`,
  period 1906–1940, adopted 1991-07-31, 131 vertices inside. SF Planning's own summary:
  "a dense area primarily comprised of 3- to 7-story multi-unit residential buildings.
  Most of the structures were built between 1906 and 1925, leading to a stylistically
  consistent district." The nomination (NRHP 91000957) states the district "has 296
  contributing buildings" and that its "period of significance begins in 1906 when the
  great earthquake and fire necessitated entirely new structures throughout the area; it
  ends with the arbitrary date of 1940". Architect/Builder field: `n/a`.
  Also present: a `Lower Nob Hill Apartment Hotel Historic District - Addition`, `cr:
  Eligible`, `nr: No` — eligible only, so no NR claim publishes for the addition.
- Also overlapping the bbox but with zero vertices inside: Uptown Tenderloin HD (NRHP
  08001407), Chinatown HD (eligible only), Market Street Cultural Landscape District.
- **Kearny-Market-Mason-Sutter Conservation District** touches (54 vertices inside) but is
  `cr: No`, `nr: No`, `a10: No` — a conservation district under Article 11, not a
  designation with a number. **No designation claim may be made from it.**

### A CONFLICT THE VERIFIER MUST RULE ON
SF Planning's parcel record for **1075 California Street (Huntington Hotel, built 1924)**
gives `ceqacode: A` with reason **"National Register Individual"**. The NPS layers return
nothing at that address and nothing named Huntington in San Francisco County on either
layer 0 or layer 1. I could not obtain a reference number. **Do not publish an NR claim for
the Huntington Hotel** — a claim without an identifier fails the gate, and I cannot supply
one. Write the building without a designation sentence, or drop the sentence.

---

## 3. CORE CANDIDATES — inside both DataSF Nob Hill polygons

### Grace Cathedral — `historic-site` (there is no `church` kind; Rome shipped three and the changeset rejected them)
- Article 10: **San Francisco Landmark No. 170, designated 1984** (`97yj-54sx`, address
  given as 1051–1055 Taylor Street). Parcel APN 0246001.
- The cathedral's own address, from its own site: **"1100 California Street, San Francisco,
  CA 94108"** — https://gracecathedral.org. SF Planning's Taylor Street address is the
  parcel; California Street is the entrance. Flag the discrepancy for the writer; use the
  cathedral's own.
- Hours, verbatim from its own site footer: **"Monday-Saturday: 10 am – 5 pm / Sundays: 1 – 5 pm"**.
- Seat of the Diocese of California. https://gracecathedral.org
- Architecture, from https://gracecathedral.org/architecture/ :
  architect **Lewis Hobart** chose French Gothic; "The cruciform plan, twin towers, central
  fleche and polygonal apse are all French in origin, with the cathedrals of Amiens, Paris
  (Notre Dame), Beauvais and Chartres being principal influences." Interior features are
  Aragonese Gothic (Palma, Majorca); the nave clerestory is English; **the Chapel of Grace
  was inspired by the Sainte-Chapelle in Paris**.
- **Measurements, all from the cathedral's own site**: "The Cathedral is 329 feet (100m)
  long, 162 (49m) feet wide at the transepts and the nave vaulting rises to 91 feet (27m)."
  Measurements are explicitly permitted by the gate.
- Fabric: raw concrete and steel, "the 1906 earthquake made structural strength necessary."
  "The first part of the cathedral was built of riveted steel lattices, beams and rebar
  (1927-1943), and the last portion of clustered steel rebar and beams (1960-1964)."
  Guastavino acoustic tile for the vaulting.
- History, from https://gracecathedral.org/history/ :
  Grace Chapel built in the 1849 Gold Rush on Powell near Jackson; a third, brick Gothic
  church opened at California and Stockton in 1862 and burned in 1906. **The William H.
  Crockers gave their Nob Hill block to the diocese as a cathedral site.** A temporary
  pro-cathedral was built in 1907; the cornerstone was laid in 1910; George Bodley prepared
  plans, his death led to a design by partner Cecil Hare, and Hobart, Hare's local agent,
  was made official architect and redesigned it. The Founders Crypt served from 1914 to
  1930. **"The present cathedral was begun in 1927 and the Chapel of Grace opened in 1930.
  By 1934 the two-thirds-built cathedral was opened for use, but the Depression stopped
  further work."** A north tower was built 1936–1943; work resumed 1960;
  **"The largely completed cathedral was consecrated in 1964."**
  A Cathedral School for Boys was begun in 1956. The cathedral close was finished in 1995.
  **"Grace Cathedral's close occupies a 2.5-acre (1hc) city block near the summit of
  historic Nob Hill."**
- Nob Hill's name, from the same page: **"In 1876 Charles Crocker, one of the Big Four
  builders of America's first transcontinental railroad, built his huge Deuxieme-Empire
  mansion on the future cathedral nave site… Other Big Four (Stanford, Hopkins, Huntington)
  built or occupied mansions nearby, and the derisive name 'Nob' Hill (from 'nabob' or
  'rich man') was born."** Also: German undertaker Nicholas Yung refused to sell to Crocker
  in 1874; "A tall fence rose around his property and, although Yung soon moved his house,
  the famous eyesore fence remained until 1904." (The spite fence — good material, and a
  date rather than a ranking.)
- **CAUTION — "America's first transcontinental railroad" is a superlative** by the gate's
  comparison-class test and its first pattern would not catch it but the third might not
  either. Do not carry that clause. "One of the Big Four builders of the transcontinental
  railroad" is safe.
- **CAUTION — the site also says Grace is "the third largest Episcopal Cathedral in the
  nation". That is a ranking and must not publish.**

### The labyrinths — part of Grace Cathedral, or a separate `attraction`
- https://gracecathedral.org/our-labyrinths/ : **"Grace Cathedral has an indoor and an
  outdoor labyrinth. The indoor one is available to you during cathedral visitor services
  hours, and the latter is available to you 24/7!"** Both are Chartres-style.
- From the history page: **"Canon Artress introduced the labyrinth in 1991."** The
  labyrinth page says Grace is "home to… the Modern Labyrinth Movement that began in 1991."
  The second phrasing edges toward a claim of primacy; use the plain 1991 date.
- Photo note: the labyrinths are floor/paving works, not architecture. Under 17 USC 120(a)
  they are NOT covered. Treat as artwork for the photo wave. Designer credit is Lauren
  Artress' programme; the Chartres pattern itself is medieval.

### Chapel of Grace — inside the cathedral
Opened 1930 (cathedral's own history page). Inspired by the Sainte-Chapelle.
Probably an entry rather than a place of its own.

### AIDS Interfaith Memorial Chapel / Keith Haring altarpiece
The cathedral's history page records that "The cathedral responded early to the AIDS
crisis". The Haring altarpiece is a **live-copyright artwork** (Keith Haring d. 1990;
copyright runs to 2060) and is indoors, so 17 USC 120(a) does not reach it at all.
**Writable as a place, not photographable.** I did not obtain a page on the cathedral's own
site naming the altarpiece; `gracecathedral.org/art-and-exhibits/` is a 404 and
`/visit/` and `/plan-your-visit/` both refuse with 403. Treat the Haring attribution as
UNVERIFIED until a source names it.

### Cable Car Museum — `museum`
- Its own site, https://www.cablecarmuseum.org : address **"1201 Mason Street - San
  Francisco"**; admission **free**; it describes itself as being in the
  **"Washington-Mason powerhouse and carbarn on Nob Hill"**. The site shows both
  "Open Daily" and "Closed Mondays" in different places — **contradictory on its own site,
  so give days cautiously or not at all.**
- The building: **San Francisco Landmark No. 43 (Cable Car Barn And Power House),
  designated 1971**, and it is the built anchor of the National Historic Landmark listed on
  the National Register as San Francisco Cable Cars, **NRHP reference number 66000233**,
  listed 1966-10-15. NPS gives the NHL address as **1390 Washington Street** — the same
  building, addressed off the other street. SF Planning parcel `3tsw-4idn` gives
  1201 Mason St, name "CABLE CAR BARN AND POWER HOUSE", **year built 1900**, CEQA code A,
  reason "Article 10 Individual Landmark, National Register Historic D[istrict]".
- From the NHL nomination text (66000233): the landmark "consists of the cable cars
  themselves, the mileage of track and cable which remains today (approximately 10 miles on
  8 different streets), and the building at Washington and Mason Streets which serves as
  both the power house and the car-barn, as well as the turning mechanisms which one finds
  at the ends of the various lines of track." The building is "a simple brick commercial
  structure"; its footprint is "a 150 foot square at the northwest corner of Washington and
  Mason Streets", "Fronting approximately 150 feet on each of those streets", about half an
  acre.
- Also from the nomination: **"The first underground cable track was laid from Kearny Street
  over Nob Hill to Leavenworth, in August 1873."** A date and a route — publishes.
  The same document says eight companies later put down 112 miles of cable track. A count —
  publishes.
- **CAUTION — the SF Planning district blurb for the cable cars says the cars "are the only
  ones still operating in a United States City". That is a ranking; it must not publish.**

### The cable car lines themselves — `attraction`
- SFMTA, https://www.sfmta.com/getting-around/muni/cable-cars : three lines operate — the
  California line, running from "California and Market and continues to Van Ness Avenue",
  and the Powell/Hyde and Powell/Mason lines, which "start at Powell and Market and continue
  to the Fisherman's Wharf area". SFMTA also states: "To board cable cars at Powell & Market,
  Bay & Taylor and Hyde & Beach Streets, you must purchase your fare in advance (applies
  8 a.m. to 8 p.m. daily)." No grade percentage and no fare figure appears on that page.
- From the NHL nomination, the eight streets carrying track: Hyde (Beach–Washington),
  Washington (Hyde–Powell), Powell (Market–Jackson), Jackson (Hyde–Powell), California
  (Van Ness–Market), Mason (Washington–Columbus), Columbia Ave (Mason–Taylor), Taylor
  (Bay–Chestnut). Note the nomination is from the 1970s; the SFMTA page is current.
- OSM carries every California Street cable stop inside Nob Hill: Powell, Mason, Taylor,
  Jones, Leavenworth, Hyde, Larkin, Stockton.
- **The California Street line is the one that crosses the hill's summit** and is the one a
  Nob Hill page has the strongest claim on; Powell/Market and its turntable belong to Union
  Square. Flag for the arbitrator.

### Pacific-Union Club (Flood Mansion) — `historic-site`
- **San Francisco Landmark No. 64 (Old Flood Mansion – Pacific Union Club), designated
  1974**, at 1000 California Street, APN 0245001.
- **Listed on the National Register of Historic Places as the James C. Flood Mansion,
  reference number 66000230, on 1966-11-13; it is a National Historic Landmark**
  (NPS layer 1, `Is_NHL: X`; NPS address "California and Mason Sts.").
- From the Fairmont's own NRHP nomination (ref 02000373), which is a National Register
  document and therefore citable: **"The Flood Mansion, which was constructed in 1886, was
  designed as a residence by architect Augustus Laver. In 1909, the building was renovated
  by architect Willis Polk and converted into the private Pacific Union Club."**
- SF Planning parcel gives year built 1911 (the Polk rebuild), CEQA A, "Article 10
  Individual Landmark, National Register Individual".
- It is a private club — no hours, no admission. Write the building, not a visit.
- **CAUTION — the same nomination says the Fairmont and the Pacific Union Club "are the only
  remaining pre-earthquake structures on Nob Hill". Ranking. Must not publish.**

### The Fairmont San Francisco — `hotel`
- **San Francisco Landmark No. 185, designated 1987**, and **listed on the National Register
  of Historic Places in 2002, reference number 02000373** (listed 2002-04-17).
- Own site https://www.fairmont-san-francisco.com/ : address **"950 Mason Street San
  Francisco, California 94108, United States"**. Dining venues named on its own site:
  **Tonga Room & Hurricane Bar, Laurel Court Restaurant & Bar, Cirque Bar**, plus in-room
  dining. **No hours are given for any of them on the hotel's own site.**
- From its NRHP nomination: Architectural Classification **Beaux Arts Classicism**;
  **Architect/Builder: "Reid Brothers (pre-1906), Julia Morgan (post-1906)"**; Period of
  Significance **1907–1945**; Significant Dates 1907, 1945; Areas of Significance
  Politics/government and Architecture; certified as nationally significant.
- Interior, from the nomination: lobby-level rooms are "the front vestibule, the main lobby,
  the Laurel Court, the Gold Room, the Venetian Room, the French Room, and the Cirque Bar."
  The **Tonga Room occupies what the nomination calls "the Plunge"** — "the rooftop of the
  Plunge (now the Tonga Room)". A swimming pool became a tiki bar; that is the good fact.
- "Between 1999 and 2000, a renovation program was completed and the main public spaces were
  restored to their 1907 Beaux Arts character," including the white marble floor of the
  lobby and Laurel Court and the Laurel Court's ceiling domes and mosaic flooring.
- A 1984 cornice and parapet replacement was made to meet the SF Building Code.
- The Tonga Room's own domain `tongaroom.com` failed to return a page; the Fairmont's
  `/dining/` and `/dining/tonga-room-hurricane-bar/` paths are both 404. **No source states
  the Tonga Room's hours, so none can be given.**

### InterContinental Mark Hopkins — `hotel`
- **San Francisco Landmark No. 184 (Mark Hopkins Hotel), designated 1987.** SF Planning
  gives the landmark address as 850 Mason Street; the parcel record gives **999 California
  Street, "MARK HOPKINS HOTEL", year built 1926**, CEQA A, "Article 10 Individual Landmark,
  Historic Survey Result". Two addresses for one corner building.
- **Architect: Weeks and Day, 1925** — stated in the Fairmont NRHP nomination:
  "the Mark Hopkins Hotel, designed by Weeks and Day (1925)". Note SF Planning's parcel says
  1926 and the nomination says 1925. **Sources disagree by one year; say so or pick the
  register.**
- **No NRHP listing.** Do not claim one.
- The hotel's own site refused an SSL handshake and the IHG detail page returns 403.
  Address comes from SF Planning and from Top of the Mark's own site.

### Top of the Mark — `restaurant` (bar/lounge; there is no `bar` kind)
- Own site https://www.topofthemark.com/ : address **"999 California Street, San Francisco,
  CA 94108"**; described as a **"penthouse" cocktail lounge**; hours
  **Sunday–Thursday 4:00 pm – 11:00 pm, Friday–Saturday 3:00 pm – 12:30 am**, kitchen closes
  9:30 pm nightly.
- **CAUTION — the site calls it "San Francisco's favorite penthouse cocktail lounge".
  Ranking. Must not publish.**

### The Masonic — `theater`
- Own site https://sfmasonic.com/ : official name **The Masonic**, address
  **"1111 California St, San Francisco, CA 94108"**. The site states no capacity, no
  architect and no construction date.
- SF Planning parcel `3tsw-4idn`: 1111–1171 California St, name **"CALIFORNIA MEMORIAL
  MASONIC TEMPLE"**, **year built 1956**, CEQA code A, reason "Historic Survey Result".
- **NOT an Article 10 landmark and not on the National Register.** Its CEQA A rating comes
  from a survey, which is not a register with an identifier. **No designation sentence.**
- Wikipedia gives architect Albert Roller and an opening of 28 September 1958 with capacity
  3,481, but the architect, date, address and capacity all sit in the infobox **without
  citations** (only the $6m cost carries a footnote). LOW CONFIDENCE — treat the architect
  and the 1958 opening as unsourced. SF Planning's 1956 is the only sourced year and it
  conflicts with Wikipedia's 1958.

### Huntington Park — `park`
- SF Recreation and Parks property register, https://data.sfgov.org/resource/gtr9-ntp6.json
  (`gtr9-ntp6`), property_id 137: official name **"Collis P Huntington Park"**, address
  **1000 Taylor St**, zip 94108, **1.29616036 acres / 56,460.97 square feet**, property type
  **"Civic Plaza or Square"**, ownership Recreation & Park, supervisor district 3,
  analysis neighborhood Nob Hill.
- The SF Rec & Park facility page `sfrecpark.org/facilities/facility/details/Huntington-Park-152`
  returns 404. **No source states park hours, so none can be given.**
- Two catalogued sculptures, from the Civic Art Collection,
  https://data.sfgov.org/resource/r7bn-7v9c.json (`r7bn-7v9c`):
  - **"Fountain of the Tortoises"**, artist **Taddeo**, creation date **1900**, marble and
    bronze, accession 1954.18, credit line "Gift of Mrs. William H. Crocker", location
    description **"In center of park, Park boarded by Taylor, Sacramento, California and
    Cushman Streets"**, intersection California Street & Taylor Street. 1900 creation, so
    the work is out of copyright and photographable.
  - **"Dancing Sprites"**, artist **Henri Leon Greber**, **ca. 1942**, bronze, 45" H by
    4' diameter, accession 1942.1, credit line "Gift of Mrs. James L. Flood", Huntington
    Park. **Greber died in 1941 — verify. If the artist died 1941 the work is likely still
    in copyright in the US depending on publication; treat as artwork, not architecture,
    for the photo wave.**
- OSM also carries a "Huntington Children's Play Area" inside the park.

### Chambord Apartments — `historic-site`
- **San Francisco Landmark No. 106, designated 1979**, at 1298 Sacramento Street, APN
  0221125. **Listed on the National Register of Historic Places in 1984, reference number
  84001184** (1984-09-20). SF Planning parcel: **year built 1922**, CEQA A, "Article 10
  Individual Landmark, National Register Individual". No architect obtained.

### Glazer-Keating House — `historic-site`
**San Francisco Landmark No. 251, designated 2005**, 1110 Taylor Street, APN 0222018.
SF Planning parcel: 1110 Taylor, **year built 1906**, CEQA A. No architect obtained.

### Brocklebank Apartments — `historic-site` or skip
1000 Mason Street. SF Planning parcel name "BROCKLEBANK APARTMENTS", **year built 1926**,
CEQA code **B** ("Historic Survey Result and 45 years or older"). No landmark number, no
NRHP. Widely known as a *Vertigo* location; I found no citable source for that in this
research and it must not be asserted without one.

### Other named buildings inside the polygon with a sourced year built
All from `3tsw-4idn`; all CEQA "A" unless noted; **none of these is a landmark and none may
carry a designation sentence.**
- 1001 California St — **Morsehead Apartments**, 1914 (CEQA B)
- 1233 California St — **De Martini, John and David Building**, 1924
- 1201 California St — **Cathedral Apartments** (CEQA B, no year given)
- 1100 California St — record reads **"CATHEDRAL HOUSE-DEMOLISHED 1994"**, year 1962,
  CEQA A "Article 10 Individual Landmark". This is the Grace Cathedral parcel; the record
  names a demolished building on it. Do not repeat this as a present-tense fact.
- 1100 Sacramento St — **The Park Lane**, 1933 (CEQA B)
- 1190 Sacramento St — **The Nob Hill** (CEQA B, no year)
- 1201–1205 Pine St — **Marie Antoinette Apartments**, 1909
- 901 Powell St — **The Saint Elizabeth**, 1912 (CEQA B)
- 1059–1079 Powell St — **Salomon, M., Building**, 1916
- 1123 Powell St — **San Francisco Korean Methodist Church**, 1930
- 1060 Powell St — **Low Apartments**, 1926 (CEQA B)
- 925 Jones St — **Lambert Apartments**, 1922, CEQA A, reason "National Register Historic
  District, California Register" — this is a **contributor to the Lower Nob Hill Apartment
  Hotel District, NRHP 91000957**, so a designation sentence IS available for it.
- 901–905 California St — **Stanford Court Hotel**, year built **1971**, CEQA B.
- 1075 California St — **Huntington Hotel**, year built **1924**, CEQA A, reason "National
  Register Individual" — see the conflict flagged in §2.

### Hotels currently trading, inside SF Find Nob Hill
From OSM (`tourism=hotel`), each cross-checked to the Nob Hill polygon:
**The Fairmont San Francisco** (950 Mason), **InterContinental Mark Hopkins** (999
California), **Stanford Court San Francisco** (905 California — its own site gives
**"905 California Street, Nob Hill, San Francisco, CA 94108"**, https://www.stanfordcourt.com/,
and says nothing about the building's history), **The Huntington Hotel** (1075 California),
**Nob Hill Inn** (1000 Pine), **Courtyard On Nob Hill** (1255 California), **Executive Hotel
Vintage Court** (650 Bush), **Cable Car Hotel** (1388 California), **San Francisco Suites**.

**The Huntington Hotel's own domain `huntingtonhotel.com` timed out and did not answer, and
so did `big4restaurant.com`.** Its operating status is therefore UNESTABLISHED. Do not write
either as trading without a source; both are LOW CONFIDENCE (see §6).

### Food and drink inside SF Find Nob Hill (OSM, addresses as tagged)
- **Nob Hill Cafe**, 1152 Taylor Street — its own site https://www.nobhillcafe.com/ gives
  **"1152 Taylor Street, San Francisco, CA 94108"**, home-cooked Italian, dinner
  **Sun–Thu 5–9pm, Fri & Sat 5–10pm**, brunch **Sat–Sun 11am–3pm**. (OSM tags 1148 Taylor;
  the restaurant's own site says 1152. Use the restaurant's own.)
- **The Big Four**, 1075 California Street (in the Huntington Hotel) — status unestablished.
- **Tonga Room & Hurricane Bar**, 950 Mason Street.
- **Laurel Court**, 950 Mason Street.
- **Venticello** (Taylor/Jackson area, no housenumber in OSM).
- **Ciccino**, 1400 California Street.
- **Wreck Room**, 1390 California Street (bar).
- **The Hyde Out**, 1068 Hyde Street (pub).
- **Uncle Vito's Pizzeria**, 700 Bush Street.
- **Sushi Rapture**, 1401 Washington Street.
- **CityPop**, 1494 California Street (cafe).
- **Beanstalk Cafe**, 724 Bush Street.
- **altoVino**, 1358 Mason Street (analysis: Chinatown / SF Find: Nob Hill — straddler).
- **Inga Donut**.
- Groceries and shops with addresses: **Le Beau Market** 1263 Leavenworth, **Trader Joe's**
  1095 Hyde, **Nob Hill Hardware** 1414 California, **Pine-Taylor Market** 996 Pine,
  **Cottage Market Liquors** 798 Bush, **VJ Grocery** 1199 Taylor, **Larkin Corner Market**
  1496 Larkin, **Presidio Post** 1301 Mason (clothes).
- **None of these has been checked against its own website.** OSM tags are the only source
  for most. A guide entry needs at least the operator's own site for address and hours;
  otherwise write only what the register or the map supports.

### Institutions and civic fabric inside the polygon
- **Cathedral School for Boys** — begun 1956 (Grace Cathedral's own history page).
- **Betty Ann Ong Chinese Recreation Center**, 1199 Mason Street — SF Rec & Park property
  140 at 1101 Washington St, 0.751 acres. Carries four Civic Art works: Colette Crutcher's
  **"Plaything of the Wind"** (2012, ceramic tile, crockery, glass, recycled mirrors, on the
  playground exterior south wall, in three parts) and Shan Shan Sheng's **"Active Memory"**
  (2012, Venetian handmade glass and stainless steel, in the lobby). Both artists are living
  — **artworks, not architecture; do not photograph.**
- **Chi Sin Buddhist and Taoist Association**; **First Chinese Southern Baptist Church**.
- **KPOO-FM transmitter tower** (OSM `man_made=tower`).
- **The brick cisterns** — OSM records covered reservoirs marked in the street surface at
  Taylor & Clay, Powell & Bush, Mason & California and Jones & Jackson inside Nob Hill,
  with more in Chinatown and Russian Hill. These are the circular brick rings in the
  roadway, part of the Auxiliary Water Supply System, which appears in `63x5-g3m4` as a
  discontiguous district, **`cr: Eligible`, `nr: Eligible` — eligible only, so NO
  designation claim.** Good walk material; write them as street fabric with no register
  sentence.
- **Cushman Street** and **Pleasant Street** — the two short streets bounding Huntington
  Park's block, named in the Civic Art Collection's location description.
- **"The Great Stairs at Grace Cathedral"** — Nominatim returns this as the road name at
  the cathedral's California Street frontage. A named stair, worth a walk entry; corroborate
  before publishing since Nominatim is the only source.

---

## 4. STRADDLERS — flagged, NOT resolved. The arbitrator rules with all twelve zones in front of it.

### Nob Hill ↔ Russian Hill
The Analysis Neighborhood polygon reaches north to Broadway on the eastern side; SF Find
does not. Every one of these is inside `Nob Hill` by DataSF analysis and inside
`Russian Hill` by SF Find:
1. **Feusier Octagon House / Kenny Residence**, 1067 Green Street — SF Landmark No. 36
   (1970) **and NRHP 74000554** (1974-03-24). Strong Russian Hill claim by name and by
   SF Find; the Russian Hill finder will want it.
2. **House of the Flag (Old Sheppard-Dakin House)**, 1652–1656 Taylor Street — SF Landmark
   No. 46 (1972).
3. **Atkinson-Escher House**, 1032 Broadway Street — SF Landmark No. 97 (1977). Also a
   contributor address in the **Russian Hill–Vallejo Street Crest District, NRHP 87002289**.
4. **Our Lady of Guadalupe Church**, 906 Broadway Street — SF Landmark No. 204 (1993).
5. **Russian Hill–Vallejo Street Crest District** (NRHP 87002289) and **Russian
   Hill–Paris Block Architectural District** (NRHP 87002288) — both overlap the Nob Hill
   analysis polygon; both are Russian Hill's by name.
6. **Ina Coolbrith Park**, 1700 Taylor St — SF Rec & Park property 145, 0.867 acres,
   analysis neighborhood Nob Hill, SF Find Russian Hill.
7. **Spring Valley Elementary School**, **Collina** (1550 Hyde), **Cafe Nook** (1500 Hyde),
   **Hot Sauce and Panko** (1468 Hyde), **Restorante Milano**, **Hope's Books and
   Stationary** — analysis Russian Hill, SF Find Nob Hill. These run the *other* way.
8. **Broadway Tunnel West Mini Park** (1201 Broadway) and **Washington & Hyde Mini Park**
   (1470 Washington) sit on the seam.
9. **Engine Company Number 31 Firehouse**, 1088 Green St — SF Landmark No. 220 (1998) and
   **NRHP 87002290** (Engine House No. 31, 1988-01-07). Analysis and SF Find both say
   Russian Hill; recorded so Nob Hill does not take it by accident.

**My reading: 1–5 belong to Russian Hill.** The vernacular hill Nob Hill's readers mean
stops at about Pacific/Jackson, and SF Find agrees. But I am not the arbitrator.

### Nob Hill ↔ Chinatown
Inside SF Find `Nob Hill` but inside the analysis `Chinatown` polygon:
1. **Donaldina Cameron House**, 920 Sacramento Street — **SF Landmark No. 44 (1971)**.
2. **Clay Street Center**, 965 Clay Street — **SF Landmark No. 122 (1981)**. This is the
   building the **Chinese Historical Society of America Museum** occupies; its own site
   (https://chsa.org/visit/) gives **"965 Clay Street, San Francisco, CA 94108"** and hours
   **"Wed & Sat 10am-5pm"**, closed Mon/Tue/Thu/Fri/Sun, and says nothing about the
   building's architect, original use or date. **My reading: Chinatown's**, both by the
   analysis polygon and by subject.
3. **Chinatown Branch Carnegie Library**, 1135 Powell Street — **SF Landmark No. 235
   (2002)**; SF Planning parcel gives **year built 1921**. **My reading: Chinatown's.**
4. **Chinatown Station post office**, 867 Stockton Street; **Chinese Central High School**;
   **altoVino**, 1358 Mason; **Kiki Supermarket**; **Powell Gifts**; the Pacific Avenue
   shop row (Faces Plus 1019, Jindi's 1045, Love Your Face 1075).
5. **Resting Hermes** (OSM `tourism=artwork`) — analysis Chinatown, SF Find Nob Hill.

### Nob Hill ↔ Tenderloin / Lower Nob Hill / Union Square
The Analysis Neighborhood `Nob Hill` polygon runs south past Bush and swallows the whole of
SF Find's `Lower Nob Hill`. **This is the largest straddle in the zone and it interacts with
SoMa, Union Square and the Tenderloin.**
1. **Lower Nob Hill Apartment Hotel Historic District — NRHP 91000957, listed 1991-07-31,
   296 contributing buildings, period of significance 1906–1940**, roughly 590–1209 Bush,
   680–1156 Sutter and 600–1099 Post Streets. Its address range straddles Nob Hill, Lower
   Nob Hill and the Tenderloin. **No single zone owns it.**
2. **Dennis T. Sullivan Memorial Home**, 870 Bush Street — **SF Landmark No. 42 (1971)**.
   Analysis: Nob Hill. SF Find: Lower Nob Hill. It is the Fire Chief's residence and carries
   M. Earl Cummings' **1921 bronze "Dennis T. Sullivan (1852-1906) Plaque"** (Civic Art
   accession 1921.1, 88 × 41½ × 5½ in., purchased with funds raised by SF firemen in 1922).
   **Cummings died in 1936, so the plaque is photographable.**
3. **Bohemian Club**, 624 Taylor Street — analysis Nob Hill, SF Find Lower Nob Hill,
   Nominatim `quarter: Tenderloin`. Three sources, three answers.
4. **The Olympic Club**, 524 Post Street; **Metropolitan Club**, 640/650 Sutter;
   **The Francisca Club**, 595 Sutter — analysis Nob Hill, SF Find Lower Nob Hill or
   Downtown/Union Square.
5. **Marines' Memorial Club & Hotel** and **Marine's Memorial Theater** — analysis Nob Hill,
   SF Find Lower Nob Hill.
6. **White Swan Inn** (845 Bush) and **Petite Auberge** (863 Bush); **Mayflower Hotel**
   (975 Bush); **Nob Hill Hotel** (835 Hyde); **JW Marriott** (515 Mason); **Beresford
   Hotel** (635 Sutter); **Club Wyndham Canterbury** (750 Sutter); **Hotel Julian**
   (940 Sutter); **Mithila Hotel** (972 Sutter); **Taylor Hotel** (615 Taylor);
   **Music City** (1353 Bush) — all analysis Nob Hill, SF Find Lower Nob Hill.
7. **Stookey's Club Moderne**, 895 Bush Street (bar) — same split.
8. **Gaylord Hotel**, 620 Jones Street — **SF Landmark No. 159 (1983)**; analysis Tenderloin,
   SF Find Lower Nob Hill.
9. **Islam Temple (Alcazar Theater)**, 650 Geary Boulevard — **SF Landmark No. 195 (1989)**;
   analysis Tenderloin, SF Find Lower Nob Hill.
10. **San Francisco Playhouse**, **Un-Scripted Theater Company** (533 Sutter),
    **Gallery 444** (444 Post), **Kensington Park Hotel** (450–460 Post), **Chancellor
    Hotel** (433 Powell) — analysis Nob Hill, SF Find Downtown/Union Square. **These are
    Union Square's on any reasonable reading.**
11. Galleries at the Sutter Street end: **Hashimoto Contemporary** (804 Sutter),
    **Vanitas Contemporary** (909 Sutter), **Soft Times** (905 Sutter) — analysis Nob Hill,
    SF Find Lower Nob Hill.

**My reading: everything south of Bush Street belongs to Lower Nob Hill / the Tenderloin /
Union Square, not to the Nob Hill guide**, and the Nob Hill page should be built on the
SF Find polygon rather than the analysis polygon. The roster does not carry a Lower Nob Hill
or Tenderloin zone, so items 8–11 in particular have no home in the twenty and will simply
go unwritten unless the arbitrator assigns them.

### Nob Hill ↔ Polk Gulch / Van Ness
Analysis Nob Hill, SF Find Polk Gulch: **Old First Presbyterian Church**, **Saint Lukes
Episcopal Church**, **Hi-Lo Club** (1423 Polk), **Encore Karaoke** (1550 California),
**Providence** (1351 Polk), **St. George and Kidanemheret Ethiopian Orthodox Church**
(1300 Polk), **SFMTA Bush & Polk Garage** (with Bruce Hasson's 1993 cast-aluminium
**"Trolleys"**, Civic Art 1993.6, on the 2nd–4th floors — living artist, do not photograph).
Note the NPS layer carries **St. Luke's Episcopal Church, NRHP reference 100009644**, but
with a **null address, null city and null certification date** — the record is incomplete
and I could not confirm it is the San Francisco church. **Do not cite 100009644.**

---

## 5. PHOTOGRAPHS — for the later wave

Emit `"photos": []` everywhere in wave 1. For the record:

**Buildings, covered by 17 USC 120(a), photographable from public land:** Grace Cathedral,
the Cable Car Barn and Power House, the Flood Mansion / Pacific-Union Club, the Fairmont,
the Mark Hopkins, the Masonic, the Stanford Court, the Chambord, the Glazer-Keating House,
the Brocklebank, and every apartment building listed in §3.

**NOT covered — artworks, needing artist and death year:**
- Grace Cathedral's **indoor and outdoor labyrinths** (paving, not architecture).
- The **Keith Haring altarpiece** (Haring d. 1990) — indoors, so 120(a) never applied.
- **"Dancing Sprites"**, Henri Leon Greber, ca. 1942, Huntington Park — establish the death
  year before shooting.
- **"Plaything of the Wind"** (Colette Crutcher, 2012) and **"Active Memory"**
  (Shan Shan Sheng, 2012) at the Betty Ann Ong Center — both artists living.
- **"Trolleys"** (Bruce Hasson, 1993), Polk-Bush Garage — living.
- **Resting Hermes** (OSM artwork, Nob Hill/Chinatown seam) — artist unestablished.

**Artworks that ARE clear:** **"Fountain of the Tortoises"**, Taddeo, 1900, Huntington Park;
**"Dennis T. Sullivan Plaque"**, M. Earl Cummings, 1921 (Cummings d. 1936).

SF Planning hosts its own landmark photographs at
`https://sfplanninggis.org/Preservation/Landmarks/Large/<number>.jpg` for LM 36, 42, 43, 44,
46, 64, 106, 122, 159, 170, 184, 185, 195. **Their licence is not stated anywhere I could
find, so they are NOT on the allowlist and must not be used.** They are useful only as a
visual check that a landmark record matches the building.

---

## 6. LEAST CONFIDENT — the three to look at hardest

1. **The Huntington Hotel and The Big 4 restaurant, 1075 California Street.** Both domains
   timed out with no response. SF Planning says the building is 1924 and claims a
   "National Register Individual" status that the NPS layers do not corroborate and for
   which I could find no reference number. So: the building is real and dated, its
   designation claim cannot be made, and I cannot show either business is trading. This is
   the candidate most likely to be wrong in a guide.
2. **The Masonic, 1111 California Street.** The venue is unambiguously real and its own site
   confirms name and address. But its year is contested — SF Planning's parcel says 1956,
   Wikipedia's uncited infobox says a 1958 opening — and the architect (Albert Roller) rests
   entirely on an uncited Wikipedia infobox. It has no landmark number and no NRHP listing,
   so nothing anchors it to a register. Write it thin or find a better source.
3. **The Keith Haring altarpiece and the AIDS Interfaith Memorial Chapel at Grace
   Cathedral.** The cathedral's history page confirms an early response to the AIDS crisis
   but never names the chapel or the altarpiece, and the two pages that would
   (`/visit/`, `/plan-your-visit/`) both refuse with 403 while `/art-and-exhibits/` is a
   404. The attribution is from general knowledge, not from a source I obtained. Do not
   publish it as written until a page names it.

Honourable mentions for doubt: **the Brocklebank's film association** (no source obtained);
**"The Great Stairs at Grace Cathedral"** (Nominatim only); **Venticello** (no housenumber,
no site checked); and the whole **shops-and-groceries block of §3**, which rests on OSM tags
alone and would need each operator's own site before any of it becomes an entry.

---

## 7. SOURCES THAT DID NOT ANSWER

Recorded here and nowhere else — none of this may reach a reader.
- `gracecathedral.org/visit/` and `/plan-your-visit/` — 403 to both WebFetch and a
  browser-UA urllib request. `/art-and-exhibits/` — 404. The root, `/history/`,
  `/architecture/` and `/our-labyrinths/` all answered.
- `huntingtonhotel.com` and `big4restaurant.com` — connection timeouts, no response.
- `tongaroom.com` — no usable response. `fairmont-san-francisco.com/dining/` and
  `/dining/tonga-room-hurricane-bar/` — 404.
- `intercontinentalmarkhopkins.com` — TLS handshake failure.
  `ihg.com/…/sfodt/hoteldetail` — 403.
- `sfrecpark.org/facilities/facility/details/Huntington-Park-152` — 404. The Rec & Park
  Socrata property register answered instead and is the better source anyway.
- `cablecarmuseum.org/visiting.html` and `/visiting-the-museum` — 404. The root answered.
- DataSF `p5b7-5n3h` and `pty2-tcw4` return rows with no columns over SODA; the
  `.geojson` endpoint returns features with empty `properties`. Use `j2bu-swwd` and
  `gfpk-269f`.
- All thirteen Article 10 designation PDFs are scanned images. Decompressing the PDF
  streams yields image data, not text. No architect or construction date is recoverable
  from them.
- NPS `nrhp_locations` layer 0 (points) is missing the Flood Mansion, the San Francisco
  Cable Cars and the Lower Nob Hill district. All three are on layer 1 (polygons). Query
  both layers or the count comes out wrong.
- Overpass rejected a regex-keyed query with 406; an explicit per-key union succeeded on
  `overpass-api.de` and returned 1,722 elements, 1,624 distinct named places, for the
  bounding box 37.7880,−122.4235 to 37.8000,−122.4055.

---

## 8. COUNT

**87 distinct candidates** recorded: 44 inside both DataSF Nob Hill polygons, 43 flagged as
straddlers across Russian Hill, Chinatown, Lower Nob Hill / Tenderloin, Union Square and
Polk Gulch. **17 Article 10 landmark numbers and 9 usable National Register reference
numbers**, two of them National Historic Landmarks.
