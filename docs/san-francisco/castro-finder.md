# The Castro — finder file

Zone: `castro` / "The Castro" / destination "The Castro, California" (per
`priv/seed_data/san_francisco_roster.json`).
Finder pass date: 2026-09-03. Wave 1. This file is research, not reader-facing copy.

**Ownership check run first.** `python3 .superpowers/taken_slugs.py` reads only
`priv/seed_data/rome/*.json`, so it under-reports; I additionally walked every
`priv/seed_data/*/*.json` (3,921 places across bronx, brooklyn, connecticut, destinations,
manhattan, queens, rome). `priv/seed_data/san_francisco/` contains only `.gitkeep`. The seven
Oracle Park code-seed places (oracle-park, reds-java-house, momos-san-francisco,
flour-and-water-pizza-shop-mission-rock, arsicault-bakery-mission-rock,
blue-bottle-coffee-mission-rock, china-basin-park) are all Mission Rock / China Basin and
collide with nothing below. **No candidate in this file is already owned.**

---

## How zone membership was decided

Three independent tests, all recorded per candidate:

1. **DataSF Analysis Neighborhoods** (`j2bu-swwd`, 41 polygons; the `nhood` value for this zone
   is `Castro/Upper Market`). I downloaded the polygons and ran point-in-polygon locally.
   https://data.sfgov.org/resource/j2bu-swwd.json
2. **DataSF Recreation and Parks Properties** (`gtr9-ntp6`) carries an `analysis_neighborhood`
   column per park, which is the city's own assignment rather than mine.
   https://data.sfgov.org/resource/gtr9-ntp6.json?$where=analysis_neighborhood%20like%20%27%25Castro%25%27
3. **Nominatim reverse geocode**, which returns `quarter` and `suburb`.
   https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=…&lon=…&zoom=18&addressdetails=1

**The three disagree, and the disagreement is the finding.** DataSF's Castro/Upper Market
polygon runs east all the way to Dolores Street, so Mission Dolores, Mission High School and
Dolores Park all fall inside it. Nominatim returns `suburb=Mission, quarter=Castro District`
for the same points. Meanwhile DataSF puts Kite Hill and the Seward slides in `Twin Peaks`
while Nominatim returns `quarter=Castro District` for both. Every such case is flagged under
STRADDLERS below and **left unresolved for the arbitrator**.

---

## Designation sources

- **Article 10 landmarks**: DataSF `97yj-54sx`, "Landmarks Listed in Article 10 of the San
  Francisco Planning Code", 370 rows, carries `landmarkno`, `yeardesignated`, `apn`, `address`
  and a `designationdocument` URL. https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000
  I fetched all 18 Castro-area designation PDFs and **every one returned HTTP 200**, so each
  number below has a live ordinance document behind it.
- **Historic districts**: DataSF `63x5-g3m4`. Note the columns `a10` (Article 10 listed),
  `nr` (National Register) and `cr` (California Register). Castro-area districts are almost all
  `cr=Eligible, nr=No, a10=No` — i.e. **survey-identified, not designated**. "Eligible" is not
  a designation and must not be written as one.
- **NRHP**: reference numbers taken from the Wikipedia NRHP listings table for San Francisco
  (`refnum` field), which is transcribed from the National Register nomination records.
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco

**Designation identifiers found: 28 Article 10 landmark numbers plus 6 NRHP reference numbers = 34.**
Of the 28 landmark numbers, **18 sit inside the Castro/Upper Market polygon uncontested**
(section A); 5 more sit inside it but are straddlers (LM 1, 67, 68, 255 on the Dolores seam);
and 5 are recorded for neighbouring finders (LM 133, 137, 178, 186, 259, 331). Every Article 10
designation document I fetched returned HTTP 200.

---

## A. DESIGNATED, UNCONTESTED IN THIS ZONE

All coordinates verified inside the `Castro/Upper Market` analysis-neighborhood polygon.

### A1. Castro Theatre — theater — 429 Castro Street
- San Francisco Landmark No. 100, designated 1977. Ordinance PDF (200):
  https://sfplanninggis.org/docs/landmarks_and_districts/LM100.pdf
- Opened 22 June 1922. Architect Timothy L. Pflueger. Capacity 1,400 for concerts, 1,150 for
  films. Art Deco marquee added 1937. https://en.wikipedia.org/wiki/Castro_Theatre
- Own site confirms address and that it is trading:
  https://www.castrotheatre.com/ (title "Home | The Castro Theatre", "429 Castro St, San
  Francisco, CA 94114", live calendar). Site also states the venue reopened after a
  renovation that added a digital organ, revived the neon blade sign and marquee, and made the
  orchestra level ADA accessible. Wikipedia cites an SF Chronicle piece dated 7 Feb 2026 on the
  reopening.
- **Copy caution**: "one of San Francisco's premier movie houses" (Wikipedia) is a superlative —
  drop it. "the world's largest and most versatile digital organ" (own site) is a superlative
  from an operator — drop it. The 1922 opening date, the architect and the seat counts are all
  facts and all publish.

### A2. Castro Camera and Harvey Milk Residence — historic-site — 573–575 Castro Street
- San Francisco Landmark No. 227, designated 2000.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM227.pdf
- Harvey Milk's camera shop and campaign headquarters; his flat was above it. A memorial plaque
  and an interior mural are at the site; a smaller mural of Milk sits above the sidewalk on the
  building. https://en.wikipedia.org/wiki/Castro_District,_San_Francisco
- **Photo caution**: the murals are artworks, not architecture — 17 USC 120(a) does not reach
  them. The building facade does.

### A3. Twin Peaks Tavern — 401 Castro Street (Castro at Market, north-east corner)
- San Francisco Landmark No. 264, designated 2012.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM264.pdf
- Its own site (twinpeakstavern.com) resolves but serves almost no crawlable text and the
  https certificate failed on one attempt; treat hours as unsourced.
- **Copy caution**: Wikipedia's framing — "the first gay bar in the city, and possibly in the
  United States, with plate glass windows" — is a superlative with a comparison class. It does
  not publish in any form, attributed or not. What publishes: the landmark number, the address,
  and that the designation ordinance is the plate-glass-window building at Castro and Market.
- **Kind problem for the verifier**: a bar is not one of the thirteen allowed kinds. `restaurant`
  or `attraction` are the only honest fits; I have not chosen.

### A4. Rainbow Flag at Harvey Milk Plaza — attraction — Market/Castro/17th Streets
- San Francisco Landmark No. 319, designated 2024. Address in the dataset is literally "N/A"
  (the landmark is the flag and flagpole, not a parcel).
  https://sfplanning.org/sites/default/files/documents/preserv/landmarks_designation/LM319.pdf
- Flagpole added 1997 for the 20th anniversary of Milk's election. Plaza dedicated to Milk in
  1985. Castro station and the plaza were designed by Reid & Tarics Associates.
  https://en.wikipedia.org/wiki/Harvey_Milk_Plaza
- **Photo caution**: the rainbow flag is a designed work by Gilbert Baker (d. 2017). Not a
  building. Wave-2 problem; note and move on.

### A5. Bank of Italy Branch Building — 400–410 Castro Street
- San Francisco Landmark No. 325, designated 2026. Designation document (200) via the SF
  Planning external document vault, linked from the `97yj-54sx` row.
- Sits diagonally opposite A3 at the Castro/Market corner.

### A6. Castro Rock Steam Baths — 578–582 Castro Street
- San Francisco Landmark No. 326, designated 2026. Designation document 200.
- Adjoins the Castro Camera block on the west side of Castro.

### A7. San Francisco AIDS Foundation — 514–520 Castro Street
- San Francisco Landmark No. 333, designated 2026. Designation document 200.

### A8. Full Moon Coffeehouse — 4416 18th Street
- San Francisco Landmark No. 329, designated 2026. Designation document 200.
- A lesbian coffeehouse site; the 2026 cohort of Castro designations is clearly an
  LGBTQ-heritage batch.

### A9. Bob Ross House — 4200 20th Street
- San Francisco Landmark No. 322, designated 2026. Designation document 200.
- Bob Ross founded the *Bay Area Reporter*. (Founding fact NOT yet independently sourced —
  see UNCERTAIN.)

### A10. Sha'ar Zahav (Historic Location) — 220 Danvers Street
- San Francisco Landmark No. 323, designated 2026. Designation document 200.
- Note the dataset's own name carries "(Historic Location)": the congregation is elsewhere now.
  Any copy must say what the building *was*, not where the congregation *is*.

### A11. The José Theater / NAMES Project Building — 2362 Market Street
- San Francisco Landmark No. 241, designated 2004.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM241.pdf
- Named for José Sarria; later the NAMES Project (AIDS Memorial Quilt) storefront.

### A12. Swedish American Hall — 2174–2178 Market Street
- San Francisco Landmark No. 267, designated 2015.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM267.pdf
- **Listed on the National Register of Historic Places on 20 September 2019, reference number
  100004413**, as "Swedish American Hall, 2168–2174 Market St."
  https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco
- Operating: Café du Nord occupies the lower level and the Hall the upper; the venue's own site
  lists a live calendar under both room names and gives "2174 MARKET ST, SAN FRANCISCO, CA".
  https://www.cafedunord.com/
- This is the strongest single candidate in the file: two registers, two identifiers, a live
  operator site, and a plausible `theater` or `restaurant` kind.

### A13. New Era Hall — 2117–2123 Market Street
- San Francisco Landmark No. 277, designated 2018.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM277.pdf
- Across Market from A12.

### A14. Alfred E. "Nobby" Clarke Mansion — 250 Douglass Street
- San Francisco Landmark No. 80, designated 1975.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM80.pdf

### A15. The McCormick House — 4040 17th Street
- San Francisco Landmark No. 208, designated 2000.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM208.pdf

### A16. Benedict-Gieling House — 22 Beaver Street
- San Francisco Landmark No. 284, designated 2019.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM284.pdf
- On the Corona Heights side of the zone.

### A17. Saint Francis Lutheran Church — 152 Church Street
- San Francisco Landmark No. 39, designated 1971.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM39.pdf
- Inside the Castro/Upper Market polygon, but colloquially Duboce Triangle. Duboce Triangle is
  not a zone in the roster, so this does not straddle another *page* — but see D3.

### A18. Miller-Joost House — 3224 Market Street
- San Francisco Landmark No. 79, designated 1975.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM79.pdf
- Upper Market, west of the business district, near the Corbett Avenue slope.

---

## B. MUSEUMS AND CIVIC INSTITUTIONS

### B1. GLBT Historical Society Museum — museum — 4127 18th Street, SF CA 94114
- Own site: https://www.glbthistory.org/museum — address, phone (415) 777-5455, and hours
  **Tuesday–Sunday 11:00 a.m.–1:00 p.m. and 1:30 p.m.–5:00 p.m., closed Monday**. (The same page
  carries a stale second hours block reading Wed–Sun 10:30–5; use the primary block.)
- Opened for previews 10 December 2010; grand opening 13 January 2011. A project of the GLBT
  Historical Society, founded 1985; the Society's archives are at 989 Market Street, Lower Level
  (SoMa — a different zone, and not this page's to claim).
  https://en.wikipedia.org/wiki/GLBT_Historical_Society
- Offers a 35-minute audioguide to the long-term exhibition "Queer Past Becomes Present".
- **Copy caution**: "the first full-scale, stand-alone museum of lesbian, gay, bisexual and
  transgender history in the United States", "only the second in the world", and the Swedish
  Exhibition Agency's "one of just three established museums" are all superlatives with
  comparison classes. None publish. The 2011 opening date does.

### B2. Randall Museum — museum — 199 Museum Way, SF CA 94114
- Own site: https://randallmuseum.org/ — address, phone (415) 554-9600, **open Tuesday through
  Saturday 10 a.m.–5 p.m., closed Sunday and Monday, admission free**. Café Josephine on site,
  Tue–Fri 9:30–3, Sat 9:30–4.
- Owned and operated by SF Recreation & Parks. Established 1937 as the Junior Museum in a former
  city jail on what is now the City College campus; opened at the Corona Heights site in 1951 in
  a building by architect William Merchant; dedicated by Mayor Elmer Robinson on 23 September
  1951 as the Josephine D. Randall Junior Museum.
  https://en.wikipedia.org/wiki/Randall_Museum
- Sits inside Corona Heights Park (C1). The two adjoin physically, which is a permitted
  orientation fact.

### B3. Eureka Valley / Harvey Milk Memorial Branch Library — 1 José Sarria Court, SF CA 94114
- SFPL own page: https://sfpl.org/locations/eureka-valley — address, phone 415-355-5616, hours
  **Sun 1–5, Mon 10–6, Tue 10–8, Wed 10–8, Thu 10–8, Fri 1–6, Sat 10–6**.
- Appears in the Article 10 dataset (`97yj-54sx`) with `landmarkno = 0` and
  `yeardesignated = 0.0`. **That is not a designation.** Rows with zero in those columns are
  under-consideration parcels. Do not write a landmark claim for this building.
- The `gtr9-ntp6` row calls it "Eureka Valley Branch Library", propertytype `Community Garden`,
  0.43 acres, address 3555 16th St, analysis neighborhood Castro/Upper Market — the RPD row
  covers the adjoining garden parcel, not the library. Worth flagging so the verifier does not
  merge the two into one place with contradictory addresses.

---

## C. PARKS AND OPEN SPACE — DataSF assigns these to Castro/Upper Market

All from `gtr9-ntp6` with `analysis_neighborhood = "Castro/Upper Market"`. Acreage and address
are the city's own values.

| Place | Address | Type | Acres |
|---|---|---|---|
| C1 Corona Heights Park | 199 Museum Way (RPD facility page gives "Roosevelt and Museum Way") | Neighborhood Park or Playground | 13.25 |
| C2 States Street Playground | 122 States Street | Neighborhood Park or Playground | 2.91 |
| C3 Eureka Valley Rec Center | 100 Collingwood Street | Neighborhood Park or Playground | 2.25 |
| C4 Peixotto Playground | 2475 15th Street | Neighborhood Park or Playground | 0.82 |
| C5 Roosevelt & Henry Stairs | 299 Henry Street | Mini Park | 0.39 |
| C6 Saturn Street Steps | 70 Ord Street | Mini Park | 0.19 |
| C7 Noe & Beaver Mini Park | 1 Beaver Street | Mini Park | 0.11 |

**C1 Corona Heights Park** has an RPD facility page confirming **park hours 5 a.m. to midnight**
and describing Bill Kraus Meadow, "a triangular shaped patch of lawn at the park entrance at
Museum Way and Roosevelt Way", and the Bill Kraus Pathway leading to the off-leash dog area.
https://sfrecpark.org/facilities/facility/details/coronaheightspark-328
Wikipedia adds: Franciscan chert bedrock, exposed terra-cotta-red at the summit; base of the hill
about 300 ft, peak about 520 ft. https://en.wikipedia.org/wiki/Corona_Heights_Park
The steps to the peak have no handrails — a genuine visitor fact worth keeping.
**Copy caution**: "an unobstructed panoramic view" is fine as description; "one of the city's
most prominent political leaders" (RPD's own words about Bill Kraus) is a superlative and does
not publish.

### C8. Pink Triangle Park and Memorial — Castro, Market and 17th Streets
- Own site: https://pinktrianglepark.org/ — **15 granite pylons**, each representing 1,000 lives
  lost; **formally dedicated 10 December 2001**, the anniversary of the Universal Declaration of
  Human Rights. Volunteer-run 501(c)(3).
- Wikipedia: less than 4,000 sq ft, faces Market with 17th Street behind, sits directly above
  Castro station. Dedicated by the Eureka Valley Promotion Association. A loose rock-filled
  triangle at the centre holds rose crystals visitors are invited to take.
  https://en.wikipedia.org/wiki/Pink_Triangle_Park
- **Copy caution**: "the first permanent, free-standing memorial in America dedicated to…"
  (Wikipedia) and "The first LGBTQ+ Holocaust memorial in the United States" (own site) are both
  superlatives with a comparison class. Neither publishes. The count of 15 pylons, the dedication
  date and the square footage all publish.
- **Photo caution**: the pylons are sculpture. 17 USC 120(a) does not cover them.

### C9. Harvey Milk Plaza — Market, Castro and 17th Streets
- The southern entrance to Castro station. Plaza dedicated to Milk 1985; flagpole 1997.
  Designed by Reid & Tarics Associates. https://en.wikipedia.org/wiki/Harvey_Milk_Plaza
- Carries Landmark No. 319 (A4). The plaza and the landmark are arguably one place; the verifier
  should decide whether to ship one entry or two. I would ship one.
- An SFMTA elevator/accessibility project has been under construction in the plaza.

### C10. Jane Warner Plaza — Castro at Market and 17th
- A pedestrian plaza at the F Market streetcar turnaround.
  https://en.wikipedia.org/wiki/Castro_District,_San_Francisco
- **Weakest sourcing of any park candidate.** I could not reach an SFMTA or Public Works page
  for it (the obvious SFMTA project URL 404s), and it is not in the RPD properties dataset. If
  no city page is found, this should not ship as its own place.

---

## D. WALKS, STREETSCAPE AND TRANSIT

### D1. Rainbow Honor Walk
- Own site: https://rainbowhonorwalk.org/ — bronze sidewalk plaques in the Castro; the site's
  own counters read **46 installed plaques and 28 planned**. Self-guided tour published.
- Founded by David Perry. First round of twenty plaques installed 2014; a second round of
  twenty-four completed 2019. Planned to run from the Harvey Milk Civil Rights Academy at 19th
  and Collingwood along Castro to Market, then along Market to the San Francisco LGBTQ Community
  Center at Octavia — **note that the Market Street leg leaves this zone**, so any copy should
  describe the Castro-street segment rather than the whole planned route.
  https://en.wikipedia.org/wiki/Rainbow_Honor_Walk
- **Photo caution**: the plaques are artworks.
- **Copy caution**: "world-famous Castro neighborhood" (own site) does not publish.

### D2. Castro Street History Walk
- Twenty historical fact plaques in the sidewalk, ten covering pre-1776 to the 1960s and ten
  covering events associated with the queer community in the Castro, contained within the 400
  and 500 blocks of Castro Street between 19th and Market.
  https://en.wikipedia.org/wiki/Rainbow_Honor_Walk
- Physically overlaps D1 on the same blocks. Probably one place, not two; the verifier decides.

### D3. Castro Street Streetscape Improvement Project (rainbow crosswalks and widened sidewalks)
- SF Public Works project page: https://www.sfpublicworks.org/castrostreet — **Status:
  Completed. Location: Castro Street between Market and 19th Streets. Budget $10,000,000.
  District 8.** Scope included wider sidewalks, repaving, new lighting, street trees, hosting the
  Rainbow Honor Walk plaques, supplemental lighting and decorative crosswalks.
- This is infrastructure, not a visitable "place". I include it because it is the sourced origin
  of the rainbow crosswalks a guide will want to mention inside another entry.

### D4. Castro Street Station (Muni Metro) and the F Market streetcar terminus
- The F Market heritage streetcar line turnaround is at Market and 17th Streets; below Harvey
  Milk Plaza is the main entrance to Castro station, served by Muni Metro K, L, M and S.
  https://en.wikipedia.org/wiki/Castro_District,_San_Francisco
- The GLBT museum's own directions page independently confirms the K/L/M/S service to Castro
  station and the F-Market streetcar. https://www.glbthistory.org/museum
- The SFMTA stop page I tried 404s. Transit is usually context rather than a place; noting it
  because the F-line terminus is a genuine visitor draw.

---

## E. WORSHIP AND COMMUNITY

### E1. Most Holy Redeemer Catholic Church — 100 Diamond Street, SF CA 94114
- Own site: https://www.mhr.org/ — address, parish office (415) 863-6259, and **Mass times: daily
  Mon–Fri 8:00 a.m.; Saturday vigil 5:00 p.m.; Sunday 8:00 a.m., 10:00 a.m. and 6:30 p.m.; holy
  days 8:00 a.m. and 7:00 p.m.; reconciliation Saturdays 3:45–4:30 p.m.**
- The site's navigation lists a Commemorative Wall & Fountain and an MHR AIDS Memorial. The
  parish is the subject of a book on the inclusion of the gay community in a Catholic parish
  (Godfrey, *Gays and Grays*, Lexington Books, 2008), cited from
  https://en.wikipedia.org/wiki/Castro_District,_San_Francisco
- **Kind problem**: there is no `church` kind. `historic-site` or `attraction` are the options.

### E2. Metropolitan Community Church of San Francisco — 150 Eureka Street
- Own site resolves: https://www.mccsf.org/ — but the crawlable text gives no street address and
  no service time; the address above comes from the Castro Wikipedia article's link, not from
  the church. **Address needs a second source before this ships.**

### E3. Hartford Street Zen Center — 57 Hartford Street
- Named in the Castro Wikipedia article.
  https://en.wikipedia.org/wiki/Castro_District,_San_Francisco
- **Its own domain did not resolve** (DNS failure on both hartfordstreetzen.org and
  www.hartfordstreetzen.org). Street number is from general reference, not from the institution.
  Weak. Do not ship without a city or diocesan-equivalent source.

### E4. Harvey Milk Civil Rights Academy — 4235 19th Street
- SFUSD school page confirms the address:
  https://www.sfusd.edu/school/harvey-milk-civil-rights-academy
- A public elementary school. It anchors the south end of the Rainbow Honor Walk's planned
  route, which is the only reason a guide would name it. Probably context inside D1 rather than
  its own entry.

### E5. Castro Country Club — 4058 18th Street
- Own site: https://castrocountryclub.org/ — **address 4058 18th St, phone 415-552-6102, hours
  Sunday–Thursday from 7:00 a.m.** (the tail of the hours string was truncated in my fetch;
  re-read before publishing hours). A sober-community coffeehouse and recovery space.
- Plausible `cafe`.

---

## F. TRADING PLACES — shops, food, bars

Each of these has an address I could source. Several have nothing else, and a founding year from
an operator's own site is a trading-duration claim and does not publish — I have marked those.

- **F1. Cliff's Variety — shop — 471–479 Castro Street.** Own site:
  https://cliffsvariety.com/ — address, email, (415) 431-5365, hours **Mon–Sat 10:00 a.m.–6:30
  p.m., Sun 10:00 a.m.–6:00 p.m.** Services listed: keying and lock repair, knife sharpening,
  glass/acrylic/wood cutting, pipe threading, cable crimping. The site says "Since our founding
  in 1936" — **that is an operator's own trading-duration claim and does not publish.** Separately,
  Wikipedia's Castro Theatre article states the original 1910 Castro Theatre at 479 Castro was
  remodelled into a retail store occupied by Cliff's Variety since 1971, citing the SF Chronicle
  — that is a third-party source for the 1971 occupancy, which is a different and citable fact.
- **F2. Café du Nord — restaurant/theater — 2174 Market Street.** See A12; same building.
- **F3. The Café — 2369 Market Street, SF CA 94114.** Own site: https://cafesf.com/ — address,
  (415) 779-3171, **hours Thursday–Saturday 9 p.m.–2 a.m.**, describes itself as across the
  street from Harvey Milk Plaza / Castro Muni Station, above the Chevron station. ("the best of
  the 21+ Castro bar scene" is the operator's superlative — does not publish.)
- **F4. Midnight Sun — 4067 18th Street.** Own site: https://www.midnightsunsf.com/ — states the
  bar began at 506 Castro Street in the 1970s and **moved to 4067 18th Street in 1981**, and that
  the 18th Street building was originally a windowless plumbing warehouse. The 1981 move is an
  operator's own trading-history claim; the *address* publishes, the *duration* does not.
- **F5. Beaux — 2344 Market Street.** Own site: https://www.beauxsf.com/ — address appears in
  event listings ("Beaux • 2344 Market, SF"). Address only.
- **F6. Starbelly — restaurant — 3583 16th Street.** Own site: https://www.starbellysf.com/ —
  address only from the crawl.
- **F7. Frances — restaurant — 3870 17th Street.** Own site: https://www.frances-sf.com/ —
  address only from the crawl. Note the Michelin listing widely attributed to it is an award and
  **does not publish**.
- **F8. Thorough Bread and Pastry — cafe — 248 Church Street.** Own site:
  https://www.thoroughbreadandpastry.com/ — address only. On the Church Street edge; see
  STRADDLERS.
- **F9. Castro Farmers' Market — 270 Noe Street.** Pacific Coast Farmers' Market Association
  page: https://www.pcfma.org/market/castro-farmers-market — address confirmed. Wikipedia
  describes it as held on Noe Street near Beaver on Wednesday afternoons in spring, summer and
  autumn. Seasonal; check current season before writing hours.
- **F10. Anchor Oyster Bar — 579 Castro Street.** Site certificate verification FAILED on https
  and the http body was empty. **Address unsourced from the operator.** Do not ship without one.
- **F11. Orphan Andy's — 3991 17th Street.** Domain did not resolve. Same problem.
- **F12. Hot Cookie — 407 Castro Street.** https://hotcookie.com/ returns 200 but the home page
  crawl carried no address and /locations/ 404s. Address unsourced.
- **F13. Harvey's — 500 Castro Street.** https://www.harveyssf.com/ returns 200 with **zero**
  extractable text (JS-only). Formerly the Elephant Walk, raided by police after the White Night
  Riots — sourced to the *Bay Area Reporter* and the *SF Examiner* via
  https://en.wikipedia.org/wiki/Castro_District,_San_Francisco. Historically the most
  interesting of the bars; the least verifiable operationally.
- **F14. Dog Eared Books Castro — 489 Castro Street.** https://www.dogearedbooks.com/ returned
  200 but no address in the crawl; the /castro path 404s. Address unsourced.
- **F15. Toad Hall — 4146 18th Street.** Site returns 403 to a plain fetch. Unsourced.
- **F16. Moby Dick — 4049 18th Street.** Domain did not resolve. Unsourced.
- **F17. Reveille Coffee — 4076 18th Street.** Locations page 404s. Unsourced.

Not chased, listed so a later pass does not have to rediscover them: The Mix (4086 18th),
440 Castro, The Edge (4149 18th), Lookout (3600 16th), Marcello's Pizza, Poesia (4072 18th),
Castro Village Wine Co.

---

## G. HISTORIC DISTRICTS — context, NOT designation claims

From DataSF `63x5-g3m4`. **Every one of these reads `a10=No, nr=No, cr=Eligible`** — they are
survey findings, not listings. They may be used to describe what a block *is*; they may not be
written as protection.

- Eureka Valley Commercial & Castro Village LGBTQ+ Historic District — period of significance
  1879–1932 and 1963–1980 — origin 2013.0160E and the SF Citywide Cultural Resources Survey.
- Upper Market Street Commercial Historic District, and its Extension — 1886–1958; 1970–1979 —
  origin Market Octavia.
- Hartford Street Historic District — 1900–1902 — origin 2015-011303ENV.
- 19th and Noe Historic District — 1905–1906 — origin 2007.0554E.
- L. Arthur 18th Street Flats Historic District — 1904 — SF Citywide Cultural Resources Survey.
- Dorland Street Bungalows Historic District — 1931 — origin 2022-002367GEN.
- Duboce Triangle Historic District (ca 1870 – ca 1920) and Duboce Triangle Historic District
  Extension.
- Castro & Liberty Streets Historic District — 1897–1906 — origin 2017-004885ENV. Straddles
  toward Noe Valley.

Full dataset: https://data.sfgov.org/resource/63x5-g3m4.json?$limit=200

---

## H. STRADDLERS — FLAGGED, NOT RESOLVED

I am not resolving any of these. The arbitrator has all twelve zones in front of it and I do not.

### H1. Mission San Francisco de Asís (Mission Dolores) — 310–320 Dolores Street
- **San Francisco Landmark No. 1, designated 1968**
  (https://sfplanninggis.org/docs/landmarks_and_districts/LM1.pdf) and **listed on the National
  Register of Historic Places on 16 March 1972, reference number 72000251.**
- **DataSF Analysis Neighborhoods puts it inside `Castro/Upper Market`.** Nominatim returns
  `suburb=Mission, quarter=Castro District, neighbourhood=Duboce Triangle` for the same point.
- The roster's `mission` zone draw names "Mission Dolores" explicitly. So the city's own polygon
  and the roster's editorial intent disagree. **This is the single most consequential straddle in
  the file** — it is the oldest and highest-numbered-by-priority landmark in San Francisco and
  both zones have a claim.

### H2. Mission Dolores Park — 646 Dolores Street — 15.99 acres
- **The DataSF Recreation and Parks Properties row states `analysis_neighborhood =
  "Castro/Upper Market"`** — this is the city's own assignment, not my inference.
- The roster's `mission` zone draw names "Dolores Park". Nominatim returns `suburb=Mission`.
- Same collision as H1, same block of the city.

### H3. Mission High School — 3750 18th Street
- San Francisco Landmark No. 255, designated 2007.
  https://sfplanninggis.org/docs/landmarks_and_districts/LM255.pdf
- Inside the `Castro/Upper Market` polygon; faces Dolores Park; named "Mission" High School.
  Every signal points a different way.

### H4. Tanforan Cottages — 214 and 220 Dolores Street
- San Francisco Landmark No. 67 and No. 68, both designated 1975.
- Both inside the `Castro/Upper Market` polygon. Same Dolores-Street problem as H1–H3.

### H5. Kite Hill — 10 Stanton Street — 2.87 acres
- **DataSF Rec & Park assigns `analysis_neighborhood = "Twin Peaks"`.** Nominatim returns
  `quarter=Castro District`. The Castro Wikipedia article states flatly that "Kite Hill is a city
  park located in the Castro", citing the SF Chronicle.
- **Twin Peaks is a DECLINED zone** (roster: "Twenty was the number chosen. A viewpoint rather
  than a neighborhood"). So if the arbitrator follows DataSF, Kite Hill has no page at all. That
  is a reason to look at it carefully, not a reason for me to grab it.

### H6. Seward Mini Park / the Seward Street Slides — 70 Corwin Street — 0.42 acres
- Identical situation to H5: DataSF says `Twin Peaks`, Nominatim says `quarter=Castro District`.
  Same orphaning risk.

### H7. Duboce Park and the Harvey Milk Center for the Arts — 50 Scott Street — 4.79 acres
- **DataSF Rec & Park assigns `analysis_neighborhood = "Haight Ashbury"`.** Nominatim returns
  `neighbourhood=Duboce Triangle, suburb=Western Addition`. Colloquially it is Duboce Triangle,
  which most sources fold into the Castro. Three sources, three answers.
- The Randall Museum's own site links "Harvey Milk Art Center" as a sibling RPD facility.

### H8. Buena Vista Park — 1293 Haight Street — 38.35 acres
- DataSF: `Haight Ashbury`. Corona Heights Park's Wikipedia article says Corona Heights "is
  situated immediately to the south of Buena Vista Park" — the two adjoin. Almost certainly
  Haight-Ashbury's, but the adjacency to C1 means both pages will want to mention it.

### H9. Buena Vista–edge NRHP listings
- **Delano House, 70 Buena Vista Terrace, NRHP reference number 82000984, listed 29 October
  1982.** **St. Joseph's Hospital, 355 Buena Vista Avenue East, NRHP reference number 85001016,
  listed 9 May 1985.** Both are Buena Vista/Haight side of the ridge and both fall outside the
  Castro/Upper Market polygon. Recording them so the Haight finder has the reference numbers.

### H10. Thorough Bread and Pastry — 248 Church Street
- Church Street is the eastern seam. Inside the Castro/Upper Market polygon by my test, but the
  Mission finder may reasonably reach for it.

### H11. Saint Francis Lutheran Church (A17) and Swedish American Hall (A12)
- Both inside the Castro/Upper Market polygon, both in what Nominatim calls
  `neighbourhood=Duboce Triangle`. Duboce Triangle is not a zone, so there is no competing page —
  but if the arbitrator ever creates one, these move.

### H12. Noe Valley seam
- Outside the polygon and recorded only so the Noe Valley finder has the numbers: Axford House,
  1190 Noe Street, San Francisco Landmark No. 133 (1981); David Lewis House, 4143 23rd Street,
  Landmark No. 186 (1988); Carnegie Noe Valley / Sally Brunn Branch Library, 451–455 Jersey
  Street, Landmark No. 259 (2008).

### H13. Haight seam
- Maud's, 929–941 Cole Street, **San Francisco Landmark No. 331, designated 2026** — a lesbian
  bar site, part of the same 2026 LGBTQ-heritage designation batch as A5–A10, but the polygon
  puts it in `Haight Ashbury`. The Haight finder should have it; the Castro page should not
  claim it.

---

## I. THINGS I DELIBERATELY DID NOT CLAIM

- **Twin Peaks summit and the annual Pink Triangle installed on it.** The summit is in the
  `Twin Peaks` polygon and Twin Peaks is a declined zone. The Twin Peaks Pink Triangle is also a
  temporary annual installation, not a standing place.
- **Tank Hill.** DataSF: `Inner Sunset`.
- **The Women's Building, 3543 18th Street** — Landmark No. 178 (1985), NRHP 100002359 (30 April
  2018). Polygon says `Mission`. Not mine.
- **Notre Dame School, 333–351 Dolores** — Landmark No. 137 (1981). Polygon says `Mission`.
- **Timothy L. Pflueger House, 1015 Guerrero Street, NRHP 100008228, listed 30 September 2022.**
  Mission side. Interesting only because Pflueger designed the Castro Theatre; the Castro page
  can say who he was without claiming his house.
- **AIDS Memorial Grove.** Golden Gate Park's, which is its own page.
- **Events**: Castro Street Fair, Frameline, Dyke March, Halloween in the Castro (discontinued
  2007), Pink Saturday (discontinued in the Castro 2016). Events are not places.

---

## J. NOTES FOR THE WRITER

1. **Kind coverage is a real problem here.** The thirteen allowed kinds have no `church`, no
   `bar`, no `plaza`, no `library`, no `school`, no `memorial`. Most Holy Redeemer, Twin Peaks
   Tavern, Harvey Milk Plaza, Pink Triangle Park, the Eureka Valley branch library and the
   Rainbow Honor Walk all need a kind chosen from {historic-site, attraction, park, shop, cafe,
   restaurant, theater, museum}. Expect `attraction` and `historic-site` to carry a lot of load.
2. **The 2026 designation batch (LM 322, 323, 325, 326, 329, 331, 333) is the freshest material
   in the file** and I found nothing about several of these outside the dataset row and its
   ordinance PDF. The number and the address are solid; the *story* is not yet sourced. Someone
   should read the ordinance PDFs, which all returned 200.
3. **Rows with `landmarkno = 0` and `yeardesignated = 0.0` in `97yj-54sx` are not designated.**
   In the Castro box these are: the Eureka Valley branch library, First Baptist Church, Orders of
   Foresters / Baha'i Temple (170 Valencia), Society for Individual Rights (529 Clayton), and
   2 Clarendon Avenue. A landmark claim on any of them fails the build and deserves to.
4. **Superlative traps specific to this zone**, all of which appear verbatim in sources and none
   of which publish: "one of the first gay neighborhoods in the United States", "one of the most
   prominent symbols of… activism in the world", "the first gay bar in the city", "the first
   full-scale, stand-alone museum of LGBT history in the United States", "the first LGBTQ+
   Holocaust memorial in the United States", "the first permanent, free-standing memorial in
   America", "world-famous Castro neighborhood", "San Francisco's most prominent architects",
   "the world's largest and most versatile digital organ", "one of the city's most prominent
   political leaders". Dates, counts and measurements survive; rankings do not.
5. **Photographs (wave 2, recorded here so it is not re-derived).** Buildings are fine under
   17 USC 120(a): the Castro Theatre facade and marquee, 575 Castro, the Swedish American Hall,
   the Bank of Italy branch, the Randall Museum. NOT covered, because they are artworks: the
   Pink Triangle Park pylons, every Rainbow Honor Walk and Castro Street History Walk plaque,
   the rainbow flag at Harvey Milk Plaza, the Harvey Milk murals at 575 Castro, and the rainbow
   crosswalks. Emit `"photos": []` everywhere for now.
6. **Live-status warnings.** The Castro Theatre's own site shows a live calendar, so it is
   trading. Café du Nord's own site shows dated shows through October, so it is trading. Harvey's,
   Anchor Oyster Bar, Orphan Andy's, Moby Dick, Toad Hall, Dog Eared Books and Hot Cookie could
   not be confirmed as trading from their own sites; the Human Rights Campaign Action Center that
   once occupied 575 Castro has already turned over once. Confirm before writing any of them.

---

## K. TALLY

- **68 candidates recorded.** 18 carry an uncontested Article 10 landmark number; 1 of those
  (Swedish American Hall) carries an NRHP reference number as well; 13 entries are flagged
  straddlers; 8 trading places have addresses I could not source from any authority and should
  not ship as written; 6 are recorded as explicitly not-ours.
- **34 designation identifiers found**: 28 Article 10 landmark numbers and 6 NRHP reference
  numbers. Every Article 10 designation document fetched returned HTTP 200.
- My judgement: **guide**, not a town page. The Castro has a museum, a landmark theatre, a
  13-acre park with a second museum inside it, eighteen numbered landmarks and a walkable
  half-mile core. That is guide-shaped. But note that the strongest single entries (Mission
  Dolores, Dolores Park) are the contested ones, so the shape of the guide depends on how the
  arbitrator rules on the Dolores seam.
