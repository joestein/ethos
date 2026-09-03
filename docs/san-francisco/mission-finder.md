# Mission District, San Francisco — FINDER report

Zone slug `mission`, destination string `Mission District, California` (per
`priv/seed_data/san_francisco_roster.json`). Research date 2026-09-03.
Finder output only. Nothing here is adjudicated; the verifier and the arbitrator rule.

---

## 0. Collision check against what is already owned

`python3 .superpowers/taken_slugs.py` was run. **It reads only
`priv/seed_data/rome/*.json`** (see line 11 of the script) — it is a Rome-era tool and does
not scan Connecticut, New York or San Francisco. Reported to the arbitrator as a gap.

Checked directly instead:

- `priv/seed_data/san_francisco/` contains only `.gitkeep`. No San Francisco file has shipped.
- The only live San Francisco places are the seven in `Ethos.Seeds.OracleParkPlaces`:
  `oracle-park`, `reds-java-house`, `momos-san-francisco`,
  `flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
  `blue-bottle-coffee-mission-rock`, `china-basin-park`. All sit at Mission Rock / China
  Basin in **Mission Bay**. None is in the Mission District. No candidate below touches them.
- ONE NAME TRAP: the Oracle Park seed owns `flour-and-water-pizza-shop-mission-rock`.
  Flour + Water's original restaurant at 2401 Harrison Street is a **different** place in the
  Mission District. If it is claimed the slug must not collide and the two must not be
  conflated. Flagged.
- Connecticut, New York and Rome places all carry different towns; no slug in this report
  duplicates one.

---

## 1. How zone membership was established

Two authoritative city sources, both queried live on 2026-09-03:

- **DataSF / data.sf.gov `ramy-di5m`** — *San Francisco Addresses with Units, Enterprise
  Addressing System*. Every address row carries an `nhood` field holding the city's
  Analysis Neighborhood. Queried per address, e.g.
  `https://data.sf.gov/resource/ramy-di5m.json?$select=address,nhood&address_number=3117&street_name=16TH`
  → `{"address":"3117 16TH ST","nhood":"Mission"}`.
- **DataSF / data.sf.gov `gtr9-ntp6`** — *Recreation and Parks Properties*. Carries
  `analysis_neighborhood`, `planning_neighborhood`, `acres`, `address`, `propertytype`.

Every "nhood:" line below is one of those two queries. Where no line appears, the
membership was **not** machine-verified and the arbitrator should treat it as unverified.

The Analysis Neighborhood boundary runs **down the centre line of Dolores Street**: even
(west) numbers return `Castro/Upper Market`, odd (east) numbers return `Mission`. Verified:
`320 DOLORES ST` → Castro/Upper Market; `333 DOLORES ST` → Mission. That single fact
produces most of the straddlers in section 5, including Mission Dolores itself.

---

## 2. Designation registers — what answered and what it gave

| Register | Endpoint | Result |
|---|---|---|
| Article 10 landmarks | `https://data.sf.gov/resource/97yj-54sx.json` | HTTP 200. Fields `landmarkno`, `name`, `address`, `yeardesignated`, `designationdocument.url`. 380-odd rows pulled in three pages. |
| Article 10 landmark **districts** | `https://data.sf.gov/resource/knm6-5ej6.json` | HTTP 200. Fields `district`, `appendix`, `datelisted`, `url`. |
| Historic districts (survey) | `https://data.sf.gov/resource/63x5-g3m4.json` | HTTP 200. Includes **eligible** as well as listed — do not publish "eligible" as a designation. |
| NRHP | Wikipedia listing article, wikitext via `?action=raw` | HTTP 200, reference numbers present. |
| Rec & Park properties | `https://data.sf.gov/resource/gtr9-ntp6.json` | HTTP 200. |

NOTE the older 4x4s (`uct4-hrvh`, `buis-pvji`) that surface in the *federated* Socrata
catalog at `api.us.socrata.com` are **other cities' datasets** and 404 on data.sfgov.org.
Use `search_context=data.sf.gov` on the catalog, and `data.sf.gov` (not `data.sfgov.org`)
as the resource host.

**Designation identifiers gathered: 38 Article 10 identifiers (37 landmark numbers + one
appendix letter for a district) and 11 NRHP reference numbers, plus one California
Historical Landmark number. ~50 total.**

Every Article 10 landmark below has a designation PDF at
`https://sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf` (landmarks up to 326);
the 2026 batch (327–335) uses long `citypln-m-extnl.sfgov.org/external/link.ashx?...` URLs
which are recorded in the dataset row.

---

## 3. CANDIDATES — designated, and inside the Mission

### 3.1 The Mission Dolores complex — ALL FOUR ARE STRADDLERS, see §5

**A1. Mission San Francisco de Asís (Mission Dolores)** — historic-site
- 320 Dolores Street (dataset gives "310-320 Dolores Street"); the parish gives 3321 16th Street.
- **San Francisco Landmark No. 1, designated 1968.** `https://data.sf.gov/resource/97yj-54sx.json` (landmarkno 1) · doc `https://sfplanninggis.org/docs/landmarks_and_districts/LM1.pdf`
- **Listed on the National Register of Historic Places in 1972, reference number 72000251.** `https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco`
- California Historical Landmark No. 327-1 (site of the original chapel and the Laguna de los Dolores). `https://en.wikipedia.org/wiki/Mission_San_Francisco_de_As%C3%ADs`
- The sixth of the twenty-one Alta California missions. Adobe walls begun 1788, chapel completed 1791; Ohlone labourers made about 36,000 adobe bricks. Same URL.
- **DATE CONFLICT, unresolved:** the parish site says "Misión San Francisco de Asís was founded June 29, 1776" (`https://www.missiondolores.org/`); Wikipedia gives the dedication as October 9, 1776. Both are defensible (first Mass vs. formal dedication). A page should either name both with their meanings or name neither.
- nhood: `320 DOLORES ST` → **Castro/Upper Market**.
- **BANNED TEXT, do not lift:** the parish site's "the oldest original intact Mission in California and the oldest building in San Francisco" is a superlative twice over. Drop it. The construction date carries the same information legally.

**A2. Mission Dolores Basilica** — historic-site
- 3321 16th Street. `https://www.missiondolores.org/`
- Hours from the parish site: "Monday to Friday: 10:00 a.m. - 4:00 p.m." and "Saturday/Sunday: 10:00 a.m. - 5:00 p.m." (own-site, identity/hours — publishable).
- Basilica completed 1918; Willis Polk restored the adobe building in 1917; churrigueresque ornament added in a 1926 remodelling. `https://en.wikipedia.org/wiki/Mission_San_Francisco_de_As%C3%ADs`
- nhood: `3321 16TH ST` → **Castro/Upper Market**.

**A3. Mission Dolores Cemetery** — historic-site (or fold into A1)
- Same parcel. Grave markers date between 1830 and 1898; roughly 5,000 unmarked indigenous graves; Luis Antonio Argüello and William Leidesdorff are interred. `https://en.wikipedia.org/wiki/Mission_San_Francisco_de_As%C3%ADs`
- BANNED: "the oldest cemetery in San Francisco" — superlative with a comparison class.

**A4. Mission Dolores Park** — park
- **646 Dolores Street. 15.99 acres.** propertytype "Neighborhood Park or Playground".
  `https://data.sf.gov/resource/gtr9-ntp6.json?$q=Dolores`
- nhood: `analysis_neighborhood` = **Castro/Upper Market**; `planning_neighborhood` = Castro/Upper Market; supervisor district 8.
- `501 DOLORES ST` (a park-side address) returns `Mission` in the EAS. The two city layers disagree at this parcel. Hardest single boundary call in the zone.

### 3.2 The Mission Street theatres — a genuinely strong cluster

**B1. New Mission Theater / Alamo Drafthouse New Mission** — theater
- 2550 Mission Street.
- **San Francisco Landmark No. 245, designated 2004.** doc `https://sfplanninggis.org/docs/landmarks_and_districts/LM245.pdf`
- **Listed on the National Register of Historic Places in 2001, reference number 01001206.**
- Alamo Drafthouse's own page (`https://drafthouse.com/sf/theater/new-mission`) rendered as an empty shell through WebFetch twice; screen count and hours are NOT sourced. Do not invent them.

**B2. El Capitan Theater and Hotel** — historic-site (not currently a cinema)
- 2353 Mission Street. **San Francisco Landmark No. 214, designated 1996.** LM214.pdf.

**B3. Victoria Theatre (Brown's Opera House)** — theater
- 2961 16th Street. **San Francisco Landmark No. 215, designated 1996.** LM215.pdf.
- The dataset's own name field is "Brown's Opera House (Victoria's Theater)".

**B4. Grand Theater** — historic-site
- 2665 Mission Street. **San Francisco Landmark No. 315, designated 2024.** LM315.pdf.

**B5. Roxie Theater** — theater. NO DESIGNATION.
- 3125 16th Street per its own site; the adjacent Little Roxie is 3117 16th Street.
  `https://www.roxie.com/about/`
- nhood: `3117 16TH ST` → **Mission**, supervisor district 09.
- **BANNED, and this is the trap on this candidate:** the Roxie's own page says it is "one
  of the oldest continuously operated cinemas in the United States" and that it "has
  operated for over one hundred years". The first is a superlative; the second is a
  trading-duration claim from an operator's own site. NEITHER PUBLISHES. No independent
  construction date was found. If the page cannot say more than address, kind and
  programme, it should say only that.

### 3.3 Cultural institutions with numbers

**C1. Mission Cultural Center for Latino Arts** — museum (galleries, theater, print studio)
- 2868 Mission Street.
- **San Francisco Landmark No. 303, designated 2022.** LM303.pdf.
- **Listed on the National Register of Historic Places in 2020, reference number 100005987.**
- `https://www.missionculturalcenter.org/about` returned 404; programme detail is unsourced.

**C2. The Women's Building (Mission Turn Hall)** — attraction / historic-site
- 3543 18th Street (dataset: "3541-3543 18th Street"). `https://womensbuilding.org/about/`
- **San Francisco Landmark No. 178, designated 1985.** LM178.pdf.
- **Listed on the National Register of Historic Places in 2018, reference number 100002359.**
- The MaestraPeace mural is credited by the building's own site to seven artists — "Juana
  Alicia, Miranda Bergman, Edythe Boone, Susan Kelk Cervantes, Meera Desai, Yvonne
  Littleton and Irene Perez" — dated "©1994-2009".
- **PHOTO WAVE: MaestraPeace is a mural, not a building. 17 USC 120(a) does not reach it. A
  photograph framing the facade features it. All seven artists appear to be living or
  recently deceased. Flag as photo-blocked pending the artist check.**

**C3. San Francisco Armory and Arsenal (the Armory)** — historic-site
- 1800 Mission Street. nhood: **Mission**.
- **San Francisco Landmark No. 108, designated 1980.** LM108.pdf.
- **Listed on the National Register of Historic Places in 1978, reference number 78000758.**

**C4. San Francisco Labor Temple (Redstone Building)** — historic-site
- 2940-2944 16th Street. **San Francisco Landmark No. 238, designated 2004.** LM238.pdf.

**C5. Mission Branch Library (Mission Branch Carnegie Library)** — attraction
- **ADDRESS CONFLICT:** DataSF gives 3359 24th Street; SFPL and Wikipedia give 300 Bartlett
  Street. Corner building; both are defensible, they should not both be asserted.
- **San Francisco Landmark No. 234, designated 2004.** LM234.pdf.
- **CURRENT STATUS, from SFPL:** "The Mission Branch located at 300 Bartlett Street is
  closed for renovation" and service is running "in the former Yoga Tree studio, located
  around the corner on Valencia Street" at 1234 Valencia Street, with hours Sun 1–5, Mon
  10–6, Tue–Thu 10–8, Fri 1–6, Sat 10–6. `https://sfpl.org/locations/mission`
  A page that lists the Bartlett Street building without this is wrong today.

**C6. Mission High School** — historic-site
- 3750 18th Street. **San Francisco Landmark No. 255, designated 2007.** LM255.pdf.

**C7. Schoenstein & Co. Pipe Organ Building** — historic-site
- 3101 20th Street. **San Francisco Landmark No. 99, designated 1977.** LM99.pdf.
- **Listed on the National Register of Historic Places in 1978, reference number 78000759.**

**C8. Casa Sanchez Building** — historic-site
- 2778 24th Street. **San Francisco Landmark No. 296, designated 2022.** LM296.pdf.

### 3.4 Churches, schools and institutional buildings

| # | Name | Address | Designation | nhood check |
|---|---|---|---|---|
| D1 | Notre Dame School | 333-351 Dolores St | SF Landmark No. 137, 1981 (LM137.pdf) | `333 DOLORES ST` → Mission |
| D2 | St. Charles School | 376-382 Shotwell St | SF Landmark No. 139, 1981 (LM139.pdf) | not checked |
| D3 | Trinity Presbyterian Church | 3261 23rd St | SF Landmark No. 65, 1984 (LM65 — see caveat) · **NRHP 1982, ref. 82002252** | `3261 23RD ST` → Mission |
| D4 | B'Nai David Chevra Mikvah Israel | 3535 19th St | SF Landmark No. 118, 1980 (LM118.pdf) | `3535 19TH ST` → Mission |
| D5 | Sunshine School | 2728 Bryant St | SF Landmark No. 286, 2019 (LM286.pdf) | `2728 BRYANT ST` → Mission |
| D6 | St. Matthew's Church | 3281 16th St | SF Landmark No. 334, 2026 | NOT CHECKED — likely straddler, see §5 |
| D7 | St. Nicholas Cathedral | 2005 15th St | SF Landmark No. 335, 2026 | `2005 15TH ST` → **Castro/Upper Market** — straddler |

**CAVEAT ON D3:** the Article 10 dataset contains **two rows with `landmarkno` 65** —
"Trinity Presbyterian Church, 3261 23rd Street, 1984" and "Trinity Episcopal Church, 1668
Bush Street, 1974". One of the two numbers is wrong in the city's own data. Trinity
Presbyterian's NRHP reference number 82002252 is independent and clean; **prefer the NRHP
citation and drop the landmark number** unless the verifier can settle the Article 10 row
against the designation PDF.

### 3.5 Houses and small buildings with numbers

| # | Name | Address | Designation | nhood |
|---|---|---|---|---|
| E1 | Frank M. Stone House | 1348 South Van Ness Ave | SF Landmark No. 74, 1975 | not checked |
| E2 | Havens Mansion and Carriage House | 1381 South Van Ness Ave | SF Landmark No. 125, 1981 | not checked |
| E3 | John McMullen Residence | 827 Guerrero St | SF Landmark No. 123, 1981 | not checked |
| E4 | Marsden Kershaw House | 845 Guerrero St | SF Landmark No. 136, 1981 | not checked |
| E5 | Frank G. Edwards House | 1366 Guerrero St | SF Landmark No. 189, 1988 | not checked |
| E6 | Sheet Metal Workers' Union Hall | 224-226 Guerrero St | SF Landmark No. 150, 1982 | not checked |
| E7 | Geilfuss on Guerrero | 102 Guerrero St | SF Landmark No. 330, 2026 | `102 GUERRERO ST` → Mission |
| E8 | Oakley Residence and Flats | 200-202 Fair Oaks St | SF Landmark No. 191, 1989 | not checked |
| E9 | Howard / 26th Street Cottages | 3274-3294 26th St | SF Landmark No. 206, 1994 | `3274 26TH ST` → Mission |
| E10 | Gaughran House | 2731-2735 Folsom St | SF Landmark No. 276, 2017 | not checked |
| E11 | Engine Co. No. 37 / Truck Co. No. 9 | 2501 25th St | SF Landmark No. 187, 1988 | `2501 25TH ST` → Mission |
| E12 | Engine Company No. 13 | 1458 Valencia St | SF Landmark No. 327, 2026 | not checked |
| E13 | Mission Folk Victorian Home | 361 San Jose Ave | SF Landmark No. 332, 2026 | `361 SAN JOSE AVE` → Mission |
| E14 | Tanforan Cottage | 214 Dolores St | SF Landmark No. 67, 1975 | `214 DOLORES ST` → **Castro/Upper Market** |
| E15 | Tanforan Cottage | 220 Dolores St | SF Landmark No. 68, 1975 | straddler, same block face |

**CAUTION ON THE 2026 BATCH (E7, E12, E13, D6, D7).** Landmarks 322–335 all carry
`yeardesignated` 2026 in the Article 10 dataset. Fourteen designations in one year is
unusual and their designation documents live behind long `citypln-m-extnl.sfgov.org`
redirect URLs rather than the stable `LM<n>.pdf` pattern, which is what a
recently-*initiated* rather than *completed* designation would look like. I could not
confirm completion. **Lower confidence — the verifier should open at least one designation
document before any of these five publish with a landmark number.**

### 3.6 NRHP-only listings (no Article 10 number)

| # | Name | Address | NRHP | nhood |
|---|---|---|---|---|
| F1 | Henry Geilfuss House | 811 Treat Ave | listed 2017, ref. 100001338 | `811 TREAT AVE` → Mission |
| F2 | Girls Club | 362 Capp St | listed 1979, ref. 79000531 | not checked |
| F3 | Ohlandt Newlyweds House | 1260 Potrero Ave | listed 1994, ref. 94000995 | `1260 POTRERO AVE` → Mission (but see §5) |
| F4 | Pioneer Trunk Factory / C. A. Malm & Co. | 2185-2199 Folsom St and 3180 18th St | listed 1987, ref. 86003727 | not checked |

Source for all four: `https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco`.
The reference numbers should ideally be re-confirmed against NPGallery before shipping;
Wikipedia's NRHP tables are transcribed from the federal weekly lists and are usually
correct, but they are a secondary source for a fact the gate treats as load-bearing.

### 3.7 Historic district

**G1. Liberty Hill Historic District** — historic-site / area
- **Designated under Article 10 of the Planning Code, Appendix F, listed 25 October 1985.**
  `https://data.sf.gov/resource/knm6-5ej6.json` · ordinance text
  `http://library.amlegal.com/nxt/gateway.dll/California/planning/article10preservationofhistoricalarchite?...anc=JD_Article10,AppendixF`
- Note the district geometry is `multigeom: true` — it is not one contiguous block.
- I did NOT retrieve the boundary streets from the appendix text. A page must not assert a
  boundary it has not read.

**G2. 25th Street Historic District — DO NOT PUBLISH AS A DESIGNATION.**
- It appears in `63x5-g3m4` with status **"Eligible"**, case 2024-003281HRR, period 1908.
  Eligible is not listed and not designated. Either omit it or describe the street without
  any protection claim.

---

## 4. CANDIDATES — no designation number

### 4.1 The mural alleys — ARTWORKS, photo-blocked

**H1. Balmy Alley** — attraction
- One block between 24th Street and 25th Street at Garfield Square, in the inner Mission.
- First paintings 1972 (Mia Galivez with children from a local childcare centre);
  Patricia Rodriguez and Graciela Carrillo painted a jungle-and-underwater scene in 1973,
  the beginning of Las Mujeres Muralistas; Ray Patlán led the PLACA project which produced
  twenty-seven murals in the summer of 1985 with a $2,500 Zellerbach Foundation grant;
  restoration 2014. `https://en.wikipedia.org/wiki/Balmy_Alley`
- nhood: `2 BALMY ST`, `3 BALMY ST`, `10½ BALMY ST` all → **Mission**.
- Named artists with work in the alley: Juana Alicia, Susan Kelk Cervantes, Marta Ayala,
  Miranda Bergman, Xochitl Nevel-Guerrero, Sirron Norris, Irene Perez.
- **PHOTO WAVE: murals, no freedom of panorama. Every artist named above is living or
  recently deceased. No photograph of this alley clears without artist dating. Write about
  it; do not shoot it.**

**H2. Clarion Alley (Clarion Alley Mural Project)** — attraction
- "one block (560 ft long and 15 ft. wide) in San Francisco's inner Mission District
  between 17th & 18th and Mission and Valencia streets" — CAMP's own words,
  `https://clarionalleymuralproject.org/about/`
- "Clarion Alley Mural Project (CAMP) was established in 1992 by a volunteer collective of
  six residents/ artists". Same URL.
- nhood: `47 CLARION ALY`, `28 CLARION ALY`, `40 CLARION ALY` all → **Mission**.
- The 560 ft × 15 ft figures are measurements, not superlatives — publishable.
- **PHOTO WAVE: same block as H1. Murals. Photo-blocked.**

**H3. Chata Gutiérrez Mural** — attraction, and it has a number
- 3175 24th Street. **San Francisco Landmark No. 312, designated 2024.** LM312.pdf.
- An artwork designated as a landmark. Publishable as text with the number; **photo-blocked**.

**H4. Carnaval Mural** — attraction, and it has a number
- 1311-1315 South Van Ness Avenue. **San Francisco Landmark No. 313, designated 2024.** LM313.pdf.
- Same treatment as H3.

### 4.2 Calle 24

**I1. Calle 24 Latino Cultural District** — attraction / area
- Calle 24's own site: the district covers "24th Street running from Mission Street to
  Potrero Avenue" with a wider area from 22nd Street to Army Street between those cross
  streets; the organisation was "created in 1999 by a group of long time residents,
  merchants, service providers and art organizations". `https://calle24sf.org/about/`
- **UNRESOLVED:** the *city* designation of the Calle 24 Latino Cultural District (a Board
  of Supervisors resolution, and the separate Calle 24 Special Use District in the Planning
  Code) has a legislative instrument I did NOT find. `https://sfplanning.org/project/calle-24-latino-cultural-district`
  returned 404. **Until the resolution or ordinance number is in hand, the page may
  describe the district but must not claim a city designation** — a bare designation claim
  fails the build. Highest-value single follow-up in this zone.
- Note the organisation's founding year (1999) is from its own site and describes an
  organisation, not a trading business; it is a founding date rather than a
  trading-duration claim. Verifier's call.

### 4.3 Arts and performance, no designation

| # | Name | Kind | Address | Sourced facts | URL |
|---|---|---|---|---|---|
| J1 | 826 Valencia (Pirate Supply Store) | shop | 826 Valencia St | Founded 2002 by Nínive Calegari and Dave Eggers; tutoring and writing charity; store open 12:00–18:00 daily; the store "fronts our flagship location" | `https://826valencia.org/about/` |
| J2 | The Marsh | theater | 1062 Valencia St | "a breeding ground for new performance"; theatres, comedy club, café, youth theatre; founded 1989 | `https://themarsh.org/about/` |
| J3 | Brava Theater Center | theater | 2781 24th St | "CULTIVATES THE ARTISTIC EXPRESSION OF WOMEN, PEOPLE OF COLOR, YOUTH, LGBTQIA+, AND OTHER UNDERREPRESENTED VOICES" | `https://www.brava.org/` |
| J4 | Creativity Explored | attraction (studio + gallery) | 3245 16th St | "a studio in San Francisco that partners with artists with developmental disabilities" | `https://www.creativityexplored.org/` |
| J5 | Precita Eyes Mural Arts and Visitors Center | attraction | 2981 24th St | Muralist organisation and visitor centre; runs public and private mural walks | `https://www.precitaeyes.org/` |
| J6 | Galería de la Raza | attraction | 2779 Folsom St Ste. A (administration); Studio 16 at 2840 16th St "currently under construction" | "An Interdisciplinary Chicano/Latinx Space for Art, Thought, and Activism" | `https://www.galeriadelaraza.org/` |

**J3 CAUTION:** Brava's site carries "40 Years of Brava!" and "100 Years of the Historic
Theater" as promotional copy for an October 2026 block party. Both are trading-duration
claims from the operator's own site and **do not publish**. The York Theater building at
2781 24th Street plausibly has a construction date in a secondary source; it was not found.

**J4 CAUTION:** "over 40 years of supporting artists" — same problem, does not publish. No
founding year was independently sourced.

**J5 CAUTION:** the site's "Since 1977" and the "45th Anniversary Gala" imply a 1977
founding but neither states it as a plain fact, and both are duration claims from the
operator. Treat 1977 as unsourced.

**J6 CAUTION:** Galería de la Raza left its long-time 2857 24th Street corner and its
Digital Mural Project billboard. The current site does not narrate that move. **A page that
places Galería at 24th and Bryant would be wrong today.** Address it at 2779 Folsom or omit.

### 4.4 Parks — all from `gtr9-ntp6`, all `analysis_neighborhood: Mission`

Fourteen Rec & Park properties. Acreage figures are measurements and publish.

| Name | Address | Acres | Type |
|---|---|---|---|
| Franklin Square | 2500 17th St | 5.60 | Neighborhood Park or Playground |
| Potrero del Sol | (no street address in dataset) | 4.68 | Neighborhood Park or Playground |
| Garfield Square | 3100 26th St | 3.46 | Neighborhood Park or Playground |
| James Rolph Jr Playground | 1451 Hampshire St | 2.93 | Neighborhood Park or Playground |
| Mission Playground | 3555 19th St | 2.14 | Neighborhood Park or Playground |
| Jose Coronado Playground | 2498 Folsom St | 0.97 | Neighborhood Park or Playground |
| In Chan Kaajal Park | 2080 Folsom St | 0.86 | Neighborhood Park or Playground |
| Mission Rec Center | 2450 Harrison St | 0.71 | Neighborhood Park or Playground |
| Parque Niños Unidos | 3070 23rd St | 0.70 | Neighborhood Park or Playground |
| Juri Commons | 324 San Jose Ave | 0.32 | Mini Park |
| Fallen Bridge Mini Park | 551 Utah St | 0.32 | Mini Park |
| Kid Power Park | 45 Hoff St | 0.26 | Mini Park |
| Alioto Mini Park | 3460 20th St | 0.21 | Mini Park |
| 24th & York Mini Park | 2810 24th St | 0.13 | Mini Park |

Query: `https://data.sf.gov/resource/gtr9-ntp6.json?$select=property_name,address,acres,propertytype,analysis_neighborhood&analysis_neighborhood=Mission`

Two more rows returned by that query are **not** Mission places by any vernacular reading
and are listed in §5: SOMA West Dog Park (0.62 ac) and SOMA West Skate Park (0.87 ac), plus
"49 S Van Ness Avenue" (2.53 ac, propertytype "Other Non-Park Property" — a city office
building parcel, not a visitor place; recommend dropping outright).

**Mission Dolores Park is NOT in this list** — the same dataset assigns it to
Castro/Upper Market. See §5.

**Precita Park (3200 Folsom St, 2.25 ac) and Coso & Precita Mini Park are
`analysis_neighborhood: Bernal Heights`. NOT the Mission's.** Recorded so the Bernal
material is not accidentally pulled in — Bernal Heights is a declined zone, so these belong
to nobody in wave 1.

### 4.5 Eating, drinking and shops — verified address and identity only

Trading-duration and founding-year claims from these operators' own sites do not publish.
Each row is address + what it is + hours where the operator states them.

| Name | Kind | Address | Sourced | URL |
|---|---|---|---|---|
| Foreign Cinema | restaurant | 2534 Mission St | Californian-Mediterranean restaurant that screens films outdoors; dinner Mon–Thu 17:00–21:30, Fri–Sat 17:00–22:00, Sun 17:00–21:00; brunch Sat–Sun 10:30–14:00 | `https://foreigncinema.com/` |
| Zeitgeist | brewery (beer garden; nearest allowed kind) | 199 Valencia St | Beer garden, 21 and up; Mon–Wed 14:00–23:00, Thu 14:00–00:00, Fri 14:00–01:00, Sat 12:00–01:00, Sun 11:00–21:30 | `https://www.zeitgeistsf.com/` |
| Bi-Rite Market | shop | 3639 18th St | Grocery, 08:00–21:00 daily | `https://biritemarket.com/pages/locations` |
| Bi-Rite Creamery | cafe | 3692 18th St | Ice cream, 12:00–21:00 daily | same |

**Foreign Cinema's own site calls itself "one of the most romantic and beautiful restaurants
in San Francisco". Superlative. Does not publish under any attribution.**

**Zeitgeist's kind is a problem.** The schema has no `bar`. `brewery` is the closest of the
thirteen but Zeitgeist does not brew. Flagged for the arbitrator: either accept the
approximation, use `restaurant`, or drop the candidate. Do not invent a kind — Rome shipped
three invented kinds and the changeset rejected them at seed time.

**NOT YET SOURCED, worth a verifier pass** (each is a real Mission place; none has a
confirmed address in this report and none should ship without one): Tartine Bakery
(Guerrero at 18th — `https://tartinebakery.com/` rendered as an empty shell),
La Taqueria on Mission Street (`lataqueriasf.com` does not resolve — DNS, so there may be
no official site at all), El Farolito, Pizzeria Delfina and Delfina on 18th Street,
Flour + Water on Harrison Street (**see the Oracle Park slug trap in §0**), Ritual Coffee
Roasters and Four Barrel Coffee on Valencia, La Palma Mexicatessen and La Victoria Bakery
on 24th, St. Francis Fountain, Humphry Slocombe, Mission Bowling Club, Trick Dog, Doc's
Clock, El Rio, Dog Eared Books, Alley Cat Books, Adobe Books, Paxton Gate, Community Thrift.

### 4.6 Other buildings and institutions, no designation found

- **Zuckerberg San Francisco General Hospital**, 1001 Potrero Ave. nhood `1001 POTRERO AVE`
  → **Mission**. Appears in the Article 10 dataset with `landmarkno` **0** — i.e. it is on
  the survey list but is NOT designated. **No designation claim.** Straddler, see §5.
- **Orders of Foresters / Baháʼí Temple**, 170 Valencia St. Also `landmarkno` 0 — not
  designated. Interesting building, no protection claim available.
- **St. Peter's Catholic Church**, Florida Street at 24th; St. Peter's School is at 1266
  Florida Street (`https://www.stpeterssf.org/` serves the *school*). The parish itself has
  a separate site I did not reach. No founding or construction date sourced.
- **Community Music Center**, 544 Capp St — `https://sfmusic.org/about/` refused the
  connection (ECONNREFUSED). Nothing sourced.
- **Dance Mission Theater**, 3316 24th St — `dancemission.com/about` 404. Nothing sourced.
- **The Chapel**, 777 Valencia St — `thechapelsf.com/about/` 404. Nothing sourced.
- **The Lab**, 2948 16th St, inside the Redstone Building (C4). Unsourced.
- **16th Street Mission and 24th Street Mission BART plazas** — genuine Mission landmarks in
  the vernacular sense and the two entrances a visitor actually uses. No designation, no
  source gathered. Probably belong inside prose rather than as places.

---

## 5. STRADDLERS — flagged, NOT resolved. The arbitrator rules these.

Ordered by how much they matter.

**S1. Mission Dolores, the Basilica, the cemetery and Mission Dolores Park.**
The city's Analysis Neighborhood boundary runs down Dolores Street and puts all four in
**Castro/Upper Market**: `320 DOLORES ST` → Castro/Upper Market, `3321 16TH ST` →
Castro/Upper Market, and Rec & Park assigns Mission Dolores Park (646 Dolores St, 15.99 ac)
`analysis_neighborhood: Castro/Upper Market`, supervisor district 8. Against that: the
mission is the origin of the neighborhood's name; the park is named Mission Dolores Park;
every visitor-facing source places both in the Mission. The Castro is a separate wave-1
zone with its own finder. **If the Castro's finder has also claimed these, they are in
direct conflict and only the arbitrator can settle it. This is the single most consequential
boundary call in the zone — the Mission's marquee draw is on the wrong side of the city's
own line.**

**S2. Tanforan Cottages, San Francisco Landmarks 67 and 68** (214 and 220 Dolores St).
Both return `Castro/Upper Market`. Same block face as S1, same problem, smaller stakes.

**S3. St. Nicholas Cathedral, San Francisco Landmark 335** (2005 15th St).
Returns `Castro/Upper Market`. Sits in the Mission Dolores / Duboce pocket. Contested
between the Mission and the Castro.

**S4. St. Matthew's Church, San Francisco Landmark 334** (3281 16th St).
NOT machine-checked. 3281 16th Street is within a block of the Dolores Street line, so it
could fall either side. Must be checked before it is claimed.

**S5. Zuckerberg San Francisco General Hospital** (1001 Potrero Ave) and **Ohlandt
Newlyweds House** (1260 Potrero Ave). Both return `Mission` in the EAS, but Potrero Avenue
is the conventional Mission/Potrero Hill boundary and both sit on its east side. Potrero
Hill is a **declined** zone, so no rival finder will claim them — but the city layer and
the vernacular disagree and the arbitrator should know.

**S6. Fallen Bridge Mini Park** (551 Utah St) and **Potrero del Sol**. Rec & Park tags both
`Mission`; both are commonly read as Potrero. Declined zone again, so no rival claim.

**S7. SOMA West Dog Park and SOMA West Skate Park.** Rec & Park tags both
`analysis_neighborhood: Mission`, zip 94103. They sit under the Central Freeway and are
*named* SoMa. **SoMa is a live wave-1 zone whose own roster note says "Boundaries are
genuinely contested; the arbitration barrier exists for this."** Direct conflict risk.

**S8. Juri Commons** (324 San Jose Ave, 0.32 ac) and **Mission Folk Victorian Home**, SF
Landmark 332 (361 San Jose Ave). Both return `Mission`. San Jose Avenue is the
Mission/Bernal seam. Bernal Heights is declined, so no rival claim.

**S9. Creativity Explored** (3245 16th St) and **Zeitgeist** (199 Valencia St), both zip
94103. Neither was machine-checked. 199 Valencia in particular sits at the Mission / SoMa /
Duboce triple point and SoMa is a live zone. Check before claiming.

**S10. Flour + Water, 2401 Harrison St.** Not a boundary straddler but a *slug* straddler:
`flour-and-water-pizza-shop-mission-rock` is already a live Oracle Park code-seed place in
Mission Bay. Same operator, different restaurant, different neighborhood. See §0.

**RESOLVED AND EXCLUDED — recorded so no one re-finds them:**
- David Lewis House, SF Landmark 186, 4143 23rd St → `nhood: Noe Valley`. Noe Valley's.
- Saint Francis Lutheran Church, SF Landmark 39, 152 Church St → `Castro/Upper Market`.
- Precita Park, Coso & Precita Mini Park → `Bernal Heights`.
- Royal Baking Company, SF Landmark 290, 4767-4773 Mission St → Excelsior, far south.
- S.F. & San Mateo Railroad Co. Office Building, SF Landmark 180, 2301 San Jose Ave → Glen Park / Bernal.
- Axford House (SF Landmark 133), Lyon-Martin House (292), Noe Valley Carnegie Branch (259) → Noe Valley.
- Swedish American Hall (267), New Era Hall (277), Jose Theater (241), Carmel Fallon Building (223), McCormick House (208), Bob Ross House (322) → Castro/Upper Market or Hayes Valley.

---

## 6. Rules compliance notes for whoever writes the page

- **Superlatives found and rejected, with their sources**, so they are not reintroduced:
  Roxie ("one of the oldest continuously operated cinemas in the United States"),
  Mission Dolores parish ("the oldest original intact Mission in California", "the oldest
  building in San Francisco"), Wikipedia on the cemetery ("the oldest cemetery in San
  Francisco"), Foreign Cinema ("one of the most romantic and beautiful restaurants in San
  Francisco"). **All banned regardless of attribution.**
- **Safe substitutes that carry the same information:** "the sixth of the twenty-one Alta
  California missions"; "the adobe chapel was completed in 1791"; "grave markers date
  between 1830 and 1898"; Clarion Alley's "560 ft long and 15 ft. wide"; every acreage in
  §4.4. These are sequences, dates and measurements, not rankings.
- **Trading-duration claims from operators' own sites that do not publish:** Roxie "over one
  hundred years", Brava "40 Years" and "100 Years of the Historic Theater", Creativity
  Explored "over 40 years", Precita Eyes "Since 1977".
- **Every designation sentence must carry its register and its identifier.** Templates that
  pass: "San Francisco Landmark No. 245, designated in 2004."; "Listed on the National
  Register of Historic Places in 2001, reference number 01001206."; "Designated under
  Article 10 of the Planning Code, Appendix F, in 1985."
- **Do not write "eligible for listing"** for the 25th Street Historic District or any other
  survey-status row. It is not a designation.
- **`"photos": []` everywhere.** For the photo wave: the mural places (Balmy Alley, Clarion
  Alley, MaestraPeace on the Women's Building facade, the Chata Gutiérrez Mural, the
  Carnaval Mural) are artworks, not architectural works, and 17 USC 120(a) does not reach
  them. Buildings — the Armory, the four Mission Street theatres, Mission High, the Carnegie
  library, the mission and basilica — are fine from public land. Good building elevations
  exist from the sidewalk on both sides of Mission Street between 16th and 26th.
- **Orientation language to avoid** given how compact this zone is: no "a short walk from
  Dolores Park", no "steps from the BART plaza", no "at the north end of the neighborhood".
  What is allowed: "the east side of Dolores Street"; "the block of 24th Street between
  Mission Street and Potrero Avenue"; two structures that physically adjoin (the basilica
  and the old adobe chapel do adjoin, and that may be said).

---

## 7. Judgement

**Guide, not a town page.** The zone carries thirty-seven Article 10 landmark numbers, one
Article 10 historic district, eleven NRHP reference numbers and one California Historical
Landmark number; a four-theatre cluster on one street, two mural alleys, the Women's
Building and the Mission Cultural Center, fourteen city parks with measured acreages, and
the oldest structure in the city sitting on a contested boundary. There is far more
citable, non-superlative material here than a town page can hold.

**Candidate count: 96.** Forty-seven with a designation identifier (§3), forty-nine without
(§4), of which fourteen are the Rec & Park properties. Ten straddler groups flagged (§5),
plus seven places positively excluded to other zones.

**Least confident, in order:**
1. **The 2026 landmark batch — Landmarks 327, 330, 332, 334, 335.** `yeardesignated` 2026 in
   the city dataset, but their designation documents sit behind
   `citypln-m-extnl.sfgov.org` redirect URLs rather than the stable `LM<n>.pdf` pattern
   every completed landmark uses. That is what an *initiated* designation looks like. A
   landmark number that turns out to be pending is exactly the failure the gate exists to
   catch. **Open one document before any of the five publishes with a number.**
2. **Trinity Presbyterian Church's landmark number.** The city's own Article 10 table
   contains two rows numbered 65 — Trinity Presbyterian at 3261 23rd Street (1984) and
   Trinity Episcopal at 1668 Bush Street (1974). One is wrong. The NRHP reference 82002252
   is clean and independent; prefer it.
3. **The Calle 24 Latino Cultural District's legislative instrument.** The organisation's
   own site gives 1999 and the street extent, but the Board of Supervisors resolution
   number and the Planning Code Special Use District citation were not found —
   `sfplanning.org/project/calle-24-latino-cultural-district` 404s. **Without a number, the
   page can describe Calle 24 but cannot say it is designated.** Highest-value follow-up.
4. Mission Branch Library's address (300 Bartlett vs 3359 24th) and its current closed-for-
   renovation status with interim service at 1234 Valencia — the status is well sourced,
   the address is doubly sourced and contradictory.
5. Galería de la Raza's present address. It left 24th Street; its own site gives 2779 Folsom
   for administration and 2840 16th Street "currently under construction". Whether it is a
   visitable place right now is not established.
