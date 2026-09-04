# Mission Bay — Finder's Research File

Zone: `mission-bay` · destination `Mission Bay, California` · town `Mission Bay` · county San Francisco
Roster draw: "Chase Center, the UCSF Mission Bay campus, Mission Creek and the houseboats. ORACLE
PARK AND ITS SEVEN PLACES ARE A CODE SEED — link to `guide:oracle-park-guide` and restate none of
them."

Compiled 2026-09-03, after the fact. **This file exists because it did not exist.** The wave-2
finder for this zone died on a connection error and never wrote a finder or a verdicts file, and
`mission-bay.json` was authored anyway — three sentences with a document behind them (LM 194,
LM 229, the Mariposa line) and roughly twenty universal negatives of the form "No source states X"
asserted against no fetch at all. Everything below is a fetch I actually made. Where a fact has no
URL here, it does not go on the page.

Every fetch was `python3` + `urllib.request` with a browser User-Agent, except four marked
`WebFetch`/failed. Scripts are in the session scratchpad.

---

## 0. RESERVATION CHECK — Oracle Park's seven, and the boundary

`.superpowers/taken_slugs.py` only globs `priv/seed_data/rome/*.json` and is worthless here (the
Dogpatch finder recorded the same defect). I globbed `priv/seed_data/**/*.json` directly instead.

**Oracle Park's seven code-seed slugs** (`lib/ethos/seeds/oracle_park_places.ex`, per
wave2-arbitration §3.1): `oracle-park`, `reds-java-house`, `momos-san-francisco`,
`flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`. **None is claimed here, and none is named on
the page — not in a place, not in an entry, not in the link note.** The reviewer's finding on the
old file was that the link note named three of them ("holding Red's Java House, China Basin Park and
the Mission Rock cafes"). The replacement note names streets only.

Consequences of that ruling for research, which I honoured:

- **Mission Rock is Oracle Park's ground.** Wikipedia's Mission Bay article names "China Basin Park
  and Bayfront Park" as the new waterfront parks
  (https://en.wikipedia.org/wiki/Mission_Bay,_San_Francisco). **Bayfront Park is at Mission Rock**,
  where three of the seven code-seed places sit. I researched it and then **dropped it** rather
  than risk restating the ballpark guide's ground. It is not on this page.
- **Pier 48 / the Embarcadero NRHP district** is likewise excluded — see §3.

**Slug collisions:** none. `mission-creek-park-mission-bay`, `mission-bay-park`,
`mariposa-park-mission-bay` are all free. `fallen-bridge-mini-park-mission-district` and
`juri-commons-mission-district` belong to the Mission and are not confusable with anything here.

**The zone envelope, from two DataSF polygon layers:**

| layer | dataset | Mission Bay bbox (lon / lat) |
|---|---|---|
| Analysis Neighborhoods | `j2bu-swwd` | -122.40499 → -122.38146 / **37.76438** → 37.78294 |
| SF Find Neighborhoods | `gfpk-269f` | -122.40166 → -122.38146 / **37.76402** → 37.77885 |

https://data.sfgov.org/resource/j2bu-swwd.json · https://data.sfgov.org/resource/gfpk-269f.json

Both southern edges land on **37.764**, which is Mariposa Street. **This independently confirms
wave2-arbitration §1.7's ruling that Mariposa Street is the Dogpatch / Mission Bay line** — I did
not take it on the arbitration's word. The Analysis polygon runs north to 37.78294, i.e. it carries
the ground north of Mission Creek Channel including King Street; the SF Find polygon stops at
37.77885 and does not. That disagreement is why 128 King Street needs the note in §1.2.

---

## 1. ARTICLE 10 — the landmark dataset, queried and geometrically filtered

**Dataset `97yj-54sx`, 370 rows, HTTP 200.**
https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000

Fields are `landmarkno`, `name`, `address`, `yeardesignated`, `designationdocument`, `the_geom`.
(The old file's author had no fetch record at all, so this is the first time the register has been
consulted for this zone.) I computed a centroid for every polygon and filtered to
lon -122.402 → -122.380, lat 37.760 → 37.782.

**Inside the Mission Bay envelope — two records, named individually. No count appears on the page.**

### 1.1 Third Street Bridge — landmark number 194

```
landmarkno      194
name            Third Street Bridge
address         Third Street over Mission Channel at China Basin
yeardesignated  1989.0
centroid        -122.39021 / 37.77678
document        https://sfplanninggis.org/docs/landmarks_and_districts/LM194.pdf
```

**PUBLISHES as "San Francisco Landmark No. 194, designated in 1989."** Register named, identifier
present.

**The designation PDF is a scan.** I downloaded it (181,022 bytes, HTTP 200); it contains
`/Image`, no `/Font`, one Flate stream — image-only, no text layer. **It yielded no fact.** I did
not treat the download as a read.

**THE 1931 DATE IN THE ARBITRATION IS WRONG AND I AM CONTRADICTING IT.** wave2-arbitration §3.3
writes "Strauss Engineering Corporation, **1931**", and the old `mission-bay.json` carried "the
Strauss Engineering Corporation built it in 1931" in five separate places. Two independent
fetches say 1933:

- **noehill.com, Landmark #194** (https://noehill.com/sf/landmarks/sf194.asp, HTTP 200) —
  "San Francisco Landmark #194 Third Street Bridge … **Ribbon Cutting 1933** … The Lefty O'Doul
  Bridge is a heel trunnion type bascule drawbridge **designed and patented by the Strauss
  Engineering Corporation**." Also: 143-foot single-leaf bascule truss over the shipping channel,
  four 23-foot concrete girder approach spans at the south end, one 54.5-foot steel girder span at
  the other, 104-foot channel, Operator's and Watchman's Houses original and extant on the piers.
- **Wikipedia, Lefty O'Doul Bridge** (https://en.wikipedia.org/wiki/Lefty_O%27Doul_Bridge, via the
  MediaWiki extracts API) — "**The previous bridge on the site closed to traffic after November 25,
  1931. The modern bridge opened on May 12, 1933**, at a ceremony attended by Mayor Angelo Joseph
  Rossi, having been designed by Joseph Strauss, chief engineer of the Golden Gate Bridge."

**1931 is the year the PREVIOUS bridge closed.** That is almost certainly how the error entered.
The page now says the Strauss Engineering Corporation designed it and it opened in 1933.

**Unresolved conflict, so no date is written for the renaming:** noehill says "Rechristened Francis
'Lefty' O'Doul Bridge in **1969**"; Wikipedia says "renamed in **1980** in honor of baseball player
Lefty O'Doul". Both agree on the name. The page gives the alternate name and **no year**.

**Superlatives stripped from noehill, not carried:** its entry ends "This is the only brid…". Also
its aesthetic judgement "the design lacks grace" — opinion, out.

### 1.2 Garcia and Maggini Warehouse — landmark number 229

```
landmarkno      229
name            Garcia And Maggini Warehouse
address         128 King Street
yeardesignated  2002.0
centroid        -122.39074 / 37.77948
document        https://sfplanninggis.org/docs/landmarks_and_districts/LM229.pdf
```

**PUBLISHES as "San Francisco Landmark No. 229, designated in 2002."**

Same scan problem: LM229.pdf is 193,083 bytes, `/Image`, no `/Font`. **No text, no facts.**
I therefore have **no construction date, no architect and no present occupant** for this building,
and the page asserts none — and asserts no negative about them either, because a PDF I could not
read is a failed fetch, not a tested absence. Say less.

**Zone note:** its centroid 37.77948 is inside the Analysis Neighborhoods Mission Bay polygon
(north edge 37.78294) and outside the SF Find one (north edge 37.77885). It is on King Street,
which is Oracle Park's street. **It is not one of the seven code-seed slugs** — I checked all seven
— and wave2-arbitration §3.3 explicitly reserves it to Mission Bay. Kept, on the arbitration's
reservation plus the Analysis polygon.

### 1.3 Rejected — inside the crude bbox, outside the zone

Named so a later reader does not re-find them and wonder: Baker & Hamilton Building (700-768 7th
Street), New Pullman Hotel (228-248 Townsend), Hotel Utah (500-504 4th Street), Piledrivers …
Local No. 77 Union Hall (457 Bryant), Southern Police Station (360 4th St, `landmarkno` 0),
Gran Oriente Filipino Complex (`landmarkno` 0). All are SoMa or Showplace Square ground and none
is written on this page. **The two zero-numbered rows are the Peace Pagoda trap in another costume
— `landmarkno = 0` is not a landmark number and must never be printed as one.**

---

## 2. CHASE CENTER — chasecenter.com, and where its own site is silent

**https://www.chasecenter.com/** — HTTP 200, 83,787 bytes. It is a Next.js application; the served
HTML carries no readable body copy and no `<a href>` beyond three build assets. What it does carry:

- `<title>Home | Chase Center</title>`
- `<meta name="description" content="Chase Center, a state-of-the-art sports and entertainment arena
  in San Francisco, is home to the Golden State Warriors and nearly 200 events per year.">`

**https://www.chasecenter.com/about/** — HTTP 200, 69,431 bytes. The RSC payload is readable with a
regex. Three usable strings:

1. "**Chase Center is an award-winning sports and entertainment arena in San Francisco's Mission
   Bay neighborhood.**"
2. "**Since its opening in 2019**, Chase Center has come to represent all the irreplaceable assets
   that we've come to know and love from the area that we call home."
3. "**In addition to being the home of the Golden State Warriors and Golden State Valkyries, Chase
   Center and its surrounding district, Thrive City**, provides guests with the opportunity to
   experience a limitless cu…"

**PUBLISHES:** opened 2019; home of the Golden State Warriors and the Golden State Valkyries;
Mission Bay; the surrounding district is called Thrive City.

**STRIPPED:** "state-of-the-art", "award-winning", "irreplaceable" — promotional, and the whole
"designed and built with one goal in mind… a beacon for the entire Bay Area community" meta blurb.
"Nearly 200 events per year" is vague and does not go on the page.

**Attempted and failed — recorded so the negative below is honest, not assumed:**
`/plan-your-visit` 404 · `/arena-information` 404 · `/getting-here` 404 · `/faq` 404 ·
`/arena-guide` 404 · `/sitemap.xml` 404 · `/robots.txt` 404 · **`/contact` returns HTTP 200 but
serves the site's 404 body** ("Please check the URL in the address bar and try again") ·
`nba.com/warriors/chasecenter` 404 · a `WebFetch` of the home page returned only the title.

I grepped all three retrieved Chase pages for `Warriors Way`, `941\d\d`, `address`, `Address` and
`San Francisco` in the raw payloads. **Zero hits for a street address, zero for opening hours,
zero for a ticket price.** So the page's line "No source states general opening hours or ticket
prices for the arena" is one I looked for and did not find, twice, on the operator's own site.
**The old file's "no source states a street address" is now FALSE and is removed** — see §2.1.

### 2.1 The address, from DataSF rather than from the arena

**Enterprise address base, `ramy-di5m`** —
`https://data.sfgov.org/resource/ramy-di5m.json?$where=upper(street_name) like '%WARRIOR%'` returns
nine points, all ZIP **94158**, including **`1 WARRIORS WAY`** at -122.38756 / 37.76800, plus 5, 7,
73, 99, 101, 150, 151 and 191 Warriors Way.

**Registered business locations, `g8m3-pdis`** —
`upper(dba_name) like '%CHASE CENTER%'` returns seven rows, every one with
`neighborhoods_analysis_boundaries = "Mission Bay"`:

| dba_name | address | start |
|---|---|---|
| Golden State Warriors Chase Center Store | **1 Warriors Way** | 2016-01-01 |
| Bon Appetit @ Chase Center | 1 Warriors Way | 1987-07-01 |
| Chase Center, Gsw Arena LLC | **150 Warriors Way** | 2012-11-01 |
| Chase Center, Gsw Arena LLC | **99 Warriors Way** | 2012-11-01 |
| Baked Bear Chase Center | 680 Terry A Francois Blvd | 2024-08-01 |
| Bon Appetit @ Chase Center | 300 16th St | 1987-07-01 |
| Golden State Warriors-Chase Center | Mission Bay Blocks 29-32 | 2012-11-01 |

https://data.sfgov.org/resource/g8m3-pdis.json

The city ties the name **Chase Center** to **1 Warriors Way** in Mission Bay, and the address point
`1 WARRIORS WAY` carries ZIP **94158**. The page publishes
**`1 Warriors Way, San Francisco, CA 94158`**. The registry rows for the arena LLC at 99 and 150
Warriors Way are a suite-numbering artefact and are not written.

**Designation:** wave2-arbitration §4 lists Chase Center's citation as "**None known**". My §1 sweep
found no Article 10 record near -122.3876 / 37.7680 and §3 found no NRHP point there. **No
designation is claimed and no absence is tallied.**

---

## 3. NRHP — nps.gov, queried by envelope

**https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query**
with `geometry=-122.402,37.760,-122.378,37.782`, `inSR=4326`, `outFields=*`, `f=json`. HTTP 200.

**Layer 0 (points) returns three features, all outside the zone:**

- **Baker and Hamilton**, 601 Townsend St., ref **05000001**, certified 02/09/05, at
  -122.40157 / 37.77182 — Showplace Square.
- **Gran Oriente Filipino Hotel**, ref **100004869**, at -122.39437 / 37.78161 — SoMa.
- **Bethlehem Shipbuilding Corporation Hospital**, 331 Pennsylvania Ave., ref **100008498**,
  certified 01/06/23, at -122.39344 / 37.76241 — **Potrero Hill, and already Dogpatch's place**
  (`dogpatch.json` carries it). Not touched.

**Layer 1 (polygons) returns one feature: Port of San Francisco Embarcadero Historic District, ref
06000372, "From Pier 45 to Pier 48, The Embarcadero", certified 05/12/06.** Its `BND_TYPE` is
"Circumscribed polygon" and its ring is a nine-vertex bowtie spanning the whole northeast
waterfront — it is a bounding sketch, not a boundary, so its overlap with my envelope is **not
evidence of anything**. Independently, wave2-arbitration §3.3 carries the wave-1 caution that this
district touches **Red's Java House**, an Oracle Park code seed: **do not re-claim.** Excluded on
both grounds. No NRHP reference number appears on the page.

---

## 4. UCSF MISSION BAY — ucsf.edu

**https://www.ucsf.edu/about/locations** — HTTP 200, 91,290 bytes. The Mission Bay paragraph, in
full:

> "UCSF Mission Bay is a teaching, research and clinical care campus with a daily population of
> about 3,500 UCSF faculty, staff, students, patients and other visitors. With more than 1 million
> square feet of research space, the thriving campus also includes an integrated hospital that
> serves women, children and cancer patients."

**PUBLISHES:** teaching, research and clinical care campus; daily population about 3,500; more than
1 million square feet of research space; includes an integrated hospital serving women, children
and cancer patients. **"Thriving" is stripped** as promotional.

**Also fetched, and empty of usable content:**
- `https://www.ucsf.edu/maps/mission-bay` — HTTP 200, 69,464 bytes, but the map and the location
  list are JS-rendered; extracted text is site chrome only. **No street address, no hours.**
- `https://campusplanning.ucsf.edu/mission-bay` — HTTP 200, 44,195 bytes; the content is a
  Parnassus Heights construction-update feed. **Nothing on Mission Bay's founding or opening.**
- `https://www.ucsf.edu/about/history` 404 · `https://www.ucsfhealth.org/hospitals/mission-bay` 404
  · `https://www.ucsfhealth.org/locations` HTTP 200 but wholly JS-rendered, zero occurrences of the
  string "Mission Bay" in the served HTML · a 2003 news-archive URL 404.

**So: I have no founding year and no opening year for the campus, and the page gives none and
claims no absence about them.** The old file's "No source states a date for its founding or its
construction" is replaced by silence — I searched four UCSF hosts and a failed search is not a fact
about the world. **What I did test and can stand behind is visitor hours and a public entrance:**
absent from all four UCSF pages above. That negative stays, in the subject form.

**Addresses inside the campus**, from `g8m3-pdis` filtered to
`upper(dba_name) like '%UCSF%' AND neighborhoods_analysis_boundaries='Mission Bay'` — 21 rows:
**1500 Owens Street** (Orthopaedics Institute, Pharmacy, Physical Therapy, Executive Health),
**499 Illinois Street** (Office of the Chancellor, School of Medicine),
**505 Gene Friend Way** (campus farmers' market, Caulia's Kitchen),
**727 Nelson Rising Lane** (child care, shuttles), **600 16th Street**, **1650 3rd Street**
(campus parking operation), **185 Berry Street**.
https://data.sfgov.org/resource/g8m3-pdis.json

The campus is multi-block and no one of these is "the" address, so the place carries `address: null`
and the streets are named in prose. That is a shape decision, not a claim of absence.

---

## 5. THE PARKS — DataSF Rec & Park properties `gtr9-ntp6`

https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=1000 — 255 rows, HTTP 200. Each row carries
four independent neighborhood fields (`analysis_`, `mons_`, `planning_`, `realtor_`), which the
Dogpatch finder already showed can disagree three ways in one row. Filtered to the zone envelope
and to any row whose neighborhood fields say Mission Bay:

| property_name | address | ZIP | acres | type | analysis / mons |
|---|---|---|---|---|---|
| **Mission Creek Park** | **290 Channel St** | 94158 | 17.1685 | Neighborhood Park or Playground | Mission Bay / Mission Bay |
| **Mission Bay Park** | *(none)* | 94158 | 11.6226 | Neighborhood Park or Playground | Mission Bay / Mission Bay |
| **Mariposa Park** | *(none)* | 94158 | 2.6578 | Neighborhood Park or Playground | Potrero Hill / **Mission Bay** |
| Esprit Park | 700 Minnesota St | 94107 | 2.2295 | Neighborhood Park or Playground | Potrero Hill / **Dogpatch** |
| Jackson Playground | 1645 17th St | 94107 | 4.9389 | — | Potrero Hill / Potrero Hill |
| South Park | 100 South Park St | 94107 | 1.1179 | — | Fin. Dist./South Beach / South Beach |

Ownership on all: **Recreation & Park**. Complex on the first four: **Mission Bay Complex**.

**Taken: Mission Creek Park, Mission Bay Park, Mariposa Park.** All three are Rec & Park property,
all three ZIP 94158, all three inside the envelope.

**Not taken:** **Esprit Park is Dogpatch's** — wave2-arbitration §1.7 rules the `Mission Bay
Complex` stamp is an operations label and not a neighborhood, and `dogpatch.json` already carries
it. Jackson Playground (Potrero Hill) and South Park (South Beach) are other zones' ground.

**Mariposa Park's `analysis_neighborhood` is Potrero Hill and its `mons_neighborhood` and
`realtor_neighborhood` are Mission Bay.** Its point is -122.39177 / 37.76462, which is on the 37.764
line — i.e. Mariposa Street itself, the ruled boundary. Two of four fields say Mission Bay and the
arbitration puts the line at Mariposa, so it is claimed here. **Flagged for the verifier as the one
genuinely arguable place on this page.**

**Mission Bay Park has no address in the register** and the page therefore gives none. I did not
write a negative about it; a null field is not a claim.

**`missionbayparks.com`** (HTTP 200, 141,394 bytes) is the operator site — "The Mission Bay Park
System is delivered to the community by the San Francisco Office of Community Investment and
Infrastructure | OCII", contact **451 Berry Street**. Its WordPress REST API is disabled (404 on
`/wp-json/wp/v2/pages`, `/posts`, `/types`), so only the home page's rendered text was available.
It names "Mission Creek Park" and "The Bay Front Mariposa Park". **Nothing from it is written on the
page** — it is corroboration for the register, and its promotional register ("the new gems of San
Francisco", "beautiful", "fabulous") is a superlative field I stayed out of. **"Mission Bay
Commons" appears nowhere in the Rec & Park register** (`'commons'` across all 255 rows returns
only *Juri Commons*, 324 San Jose Ave, in the Mission). **It is not written.**

---

## 6. MISSION CREEK AND THE HOUSEBOATS

**What I have:** `g8m3-pdis`, `upper(dba_name) like '%MISSION CREEK%'` returns 20 rows; one is in
the zone —

```
dba_name        Mission Creek Harbor Assoc Inc
address         300 Channel St Apt 1, San Francisco, CA
neighborhood    Mission Bay
dba_start_date  1978-12-22
```

https://data.sfgov.org/resource/g8m3-pdis.json

**PUBLISHES:** the Mission Creek Harbor Association is recorded at 300 Channel Street, with a
registration date of 22 December 1978. That is a register fact stated as a register fact, not a
founding date for the moorings.

**What I do not have, and looked for.** The Port of San Francisco:

- `https://www.portofsanfrancisco.com/` — **HTTP 409 Conflict.**
- `https://www.sfport.com/` — HTTP 200, 43,376 bytes. 25 internal links, none matching
  harbor/creek/berth/houseboat.
- `https://www.sfport.com/maritime` — HTTP 200. Under **Harbors**: "**Port manages two harbors for
  recreational and commercial vessels. South Beach Harbor is located at Pier 40 near the Giants'
  ballpark and berths recreational vessels and commercial charters. Hyde Street Harbor is located
  in Fisherman's Wharf and serves commercial fishing boats.**" **Mission Creek Harbor is not among
  the harbours this page describes.**
- `https://www.sfport.com/mission-creek-harbor` 404 · `/mission-creek-harbor-0` not attempted after
  the 404 · `https://www.sfport.com/search?keys=mission+creek` HTTP 200 but the results widget is
  JS-only and returned "Add a search keyword(s) and click on Apply to see results".

**Consequence:** I cannot source who administers the berths, and the page does not say. **I can
stand behind "no source states visiting arrangements or a berth address for the moorings", because
I asked the Port four ways and the city register once.** Everything else the old file asserted
about the houseboats — when the moorings were established, a dock address, a public access point —
**goes**, because those were never asked.

**Mission Creek Channel itself** is named in two registers I did read: the LM 194 address string
("Third Street over Mission Channel at China Basin") and Mission Creek Park's address (290 Channel
Street). **I did not create a standalone `mission-creek-mission-bay` place**, because the old one
was an entity with nothing sourced under it; the waterway appears as the thing the bridge crosses
and the park's frontage. Slug retired.

---

## 7. TRANSIT — sfmta.com

**https://www.sfmta.com/routes/t-third-street** — HTTP 200, 106,342 bytes.

The **Muni Metro T Third Street** line's stop list includes "**UCSF/Chase Center**",
"**UCSF / Chase Center (16th St)**" and "**UCSF Medical Center**". Routing text: "From Chinatown
Station, exit Central Subway, continue on 4th St, left on Channel, right on 3rd St to Bayshore Blvd
to the terminal at Bayshore & Sunnydale." Project text: "In anticipation of the new Golden State
Warriors' Chase Center and the growth in jobs, housing, healthcare and retail in the Mission Bay,
the SFMTA is constructing a new center platform along 3rd Street between South and 16th streets."

**This is the positive replacement for the sentence the coordinator already struck from all fifteen
files** ("No source states a bus route or a rail station"). It was false here as everywhere: the T
Third runs up Third Street through this zone and stops at UCSF/Chase Center at 16th Street. The
page now says so.

---

## 8. WHAT THE OLD FILE ASSERTED, AND WHAT HAPPENED TO IT

| old claim | disposition |
|---|---|
| LM 194, designated 1989 | **KEPT** — §1.1, dataset `97yj-54sx` |
| LM 229, designated 2002 | **KEPT** — §1.2, dataset `97yj-54sx` |
| Mariposa Street is the Dogpatch line | **KEPT** — §0, confirmed against two polygon layers |
| "Strauss Engineering Corporation built it in **1931**" (×5) | **CORRECTED to designed by the Strauss Engineering Corporation, opened 1933** — §1.1 |
| "No source states a street address … for the arena" (×4) | **FALSE, REMOVED.** 1 Warriors Way, 94158 — §2.1 |
| "No source states opening hours or ticket prices for the arena" | **KEPT** — now tested against nine Chase URLs, §2 |
| "No source states visitor hours or a public entrance" for UCSF | **KEPT** — now tested against four UCSF hosts, §4 |
| "No source states a date for [UCSF's] founding or its construction" | **REMOVED.** Four hosts gave me nothing; that is my gap, not the world's |
| "No source states a public access point … for the creek's banks" (×3) | **REMOVED.** Never asked. Mission Creek Park at 290 Channel Street replaces it with a fact |
| "No source states when the moorings were established" | **REMOVED.** Never asked |
| "No source states a dock address … for [the houseboats]" (×4) | **REWRITTEN to berth address + visiting arrangements**, tested against the Port four ways, §6 |
| "No source states an opening schedule for the span" (×3) | **REMOVED.** It is a public street; the clause was filler |
| "No source states its present occupant, its construction date or any public access" (warehouse) | **REMOVED.** The designation PDF is a scan I could not read; an unreadable fetch is not a tested absence — §1.2 |
| "No source states a designation" for Chase Center / UCSF / Mission Creek | **REMOVED.** Reads as a tally of zero; §1 and §3 are the record instead |
| link note "holding Red's Java House, China Basin Park and the Mission Rock cafes" | **REMOVED** — §0. The note names streets and no code-seed place |
| standalone `mission-creek-mission-bay` place | **RETIRED** — §6 |
| standalone `mission-creek-houseboats-mission-bay` place | **KEPT**, rewritten on the harbour-association record |

**Exactly three distinct "No source states…" negatives survive**, repeated across intro, section,
FAQ, place and entry for ten instances in all:

1. *"No source states general opening hours or ticket prices for the arena"* — tested against nine
   chasecenter.com URLs plus a raw-payload grep, §2.
2. *"No source states visitor hours or a public entrance for the campus"* — tested against four
   UCSF hosts, §4.
3. *"No source states visiting arrangements or a berth address for the moorings"* — tested against
   the Port four ways and the city business register once, §6.

**Roughly twenty other universal negatives the old file carried are gone.** Every one of them was
asserted against a zone whose finder never ran.

---

## 9. PLACES CLAIMED — eight, all with a URL

| slug | name | kind | address | source |
|---|---|---|---|---|
| `chase-center-mission-bay` | Chase Center | `stadium` | 1 Warriors Way, San Francisco, CA 94158 | chasecenter.com/about · `ramy-di5m` · `g8m3-pdis` |
| `ucsf-mission-bay-campus` | UCSF Mission Bay campus | `attraction` | null | ucsf.edu/about/locations · `g8m3-pdis` |
| `mission-creek-park-mission-bay` | Mission Creek Park | `park` | 290 Channel Street, San Francisco, CA 94158 | `gtr9-ntp6` |
| `mission-bay-park` | Mission Bay Park | `park` | null | `gtr9-ntp6` |
| `mariposa-park-mission-bay` | Mariposa Park | `park` | null | `gtr9-ntp6` |
| `mission-creek-houseboats-mission-bay` | Mission Creek houseboats | `attraction` | null | `g8m3-pdis` · sfport.com/maritime |
| `third-street-bridge-mission-bay` | Third Street Bridge | `historic-site` | null | `97yj-54sx` · noehill · Wikipedia |
| `garcia-and-maggini-warehouse-mission-bay` | Garcia and Maggini Warehouse | `historic-site` | 128 King Street, San Francisco, CA | `97yj-54sx` |

All eight kinds are on the thirteen the schema allows (roster `kind_note`). Eight clears the
six-place guide floor, so **tier `guide`**, not `town-page`.

**Designation numbers found: two, and they are named individually in §1.1 and §1.2. This file
does not state how many, and neither does the page.**

## 10. FLAGS FOR THE VERIFIER

1. **The 1933/1931 contradiction with wave2-arbitration §3.3** is deliberate and is the one place
   this page departs from a standing ruling. Two sources, §1.1. If the arbitrator wants 1931 back,
   it needs a source that says the bridge *opened* in 1931.
2. **Mariposa Park** is claimed on 2 of 4 neighborhood fields plus the Mariposa ruling — §5.
3. **128 King Street** sits in one neighborhood polygon and not the other, on Oracle Park's street —
   §1.2. Kept on the arbitration's explicit reservation.
4. **Bayfront Park and Mission Rock were researched and deliberately dropped** to Oracle Park — §0.
5. **No photos anywhere.** `"photos": []` throughout, so the roster's 17 USC 120(a) refinement is
   not engaged.
