# Chinatown, San Francisco — FINDER file

Wave 1, San Francisco programme. **Evidence, not adjudication.** A verifier adjudicates what ships;
one arbitrator rules ownership of straddlers across all twelve zones. I do not resolve straddlers
here — I flag them and give the evidence on both sides.

Research date: 2026-09-03. Author: finder agent. Zone slug `chinatown`, destination string
`San Francisco Chinatown, California` (disambiguated from Manhattan's Chinatown by
`priv/seed_data/san_francisco_roster.json`, `destination_slug_ruling`).

**Candidate count: 100.** Roughly 40 are strong, 25 are usable with the caveats noted, and 35 are
weak, closed, contested or belong to somebody else. That ratio is deliberate; a finder that only
returns things it is sure about has not gone to the edges.

---

## 0. Compliance statement — read before lifting anything below

Three binding rulings from `priv/seed_data/san_francisco_roster.json`, plus the five prose bans in
`test/ethos/seeds/san_francisco_seed_data_test.exs`, were read in full before work began.

1. **DESIGNATION CLAIMS PUBLISH, WITH A REGISTER AND AN IDENTIFIER.** Every designation in this
   file carries its register and its number. Where I could only establish that a thing is
   *eligible* rather than *listed*, I say so in those words, and §3.4 explains why the distinction
   is load-bearing in Chinatown specifically.
2. **NO SUPERLATIVES.** Chinatown's sources are unusually dense with them — "the oldest Chinatown
   in North America", "the last Chinese theater in any Chinatown in the United States", "the oldest
   extant Taoist temple in Chinatown", "the first park in San Francisco". Every one of those is
   quoted below only inside a **DO NOT PUBLISH** marker, so the verifier can catch a writer who
   lifts it. §9.1 lists them all in one place.
3. **NO PHOTOGRAPHS.** Every record is `"photos": []`. Chinatown is unusually dense with public
   sculpture whose artists are living or recently dead, and §8 lists them with death years so the
   photo wave does not have to rediscover the problem.

Corpus rules observed throughout: no trip durations, no orientation by impression, aggregators
attributed as aggregators, every factual claim carries the URL I actually fetched.

---

## 1. Method

**Tooling.** The WebSearch budget was assumed exhausted, so every retrieval ran against URLs named
in advance, fetched with `python3 urllib` (never piped `curl`, never `grep` as a source of truth).
Scripts and a response cache live at `<scratchpad>/ct/`.

**What answered.** DataSF's Socrata API (`data.sfgov.org`), the Socrata catalog
(`api.us.socrata.com`), SF Planning's parcel and district datasets, the NPS National Register
ArcGIS service (`mapservices.nps.gov`), the California Office of Historic Preservation
(`ohp.parks.ca.gov`), `en.wikipedia.org` and most operators' own sites.

**What did not.** `nominatim.openstreetmap.org` returned HTTP 429 on all but ten of 68 queries and
never recovered, so per-point reverse geocoding was NOT the boundary method here. `chsa.org`
returns 403 to a plain urllib request and had to be read through WebFetch. `overpass-api.de`
returns 406 to both GET and POST from this network and `overpass.kumi.systems` timed out; the
`overpass.private.coffee` mirror answered and supplied the OSM cross-check. `matsuusa.org` and
`hangahteahouse.com` do not resolve DNS. **All of this is provenance argument and none of it may
reach a reader** — the gate's `@method_patterns` bans "did not resolve", "could not be reached",
and any HTTP status code in prose.

**The boundary method, which is the load-bearing part.** Neighborhood assignment rests on
point-in-polygon against DataSF's **Analysis Neighborhoods** layer, resource `j2bu-swwd`
(41 polygons, `nhood` field), assembled and tested locally in Python:

```
https://data.sfgov.org/resource/j2bu-swwd.json?$limit=200
```

When a record below says **"DataSF PIP: Chinatown"** it means the stated coordinate, tested against
that polygon, falls inside it. Attribute it to the City's *analysis* neighborhood layer and to
nothing else. It is a census-tract aggregation, not a cadastre, and §3 is entirely about the ways
it disagrees with every other definition of Chinatown the City itself publishes.

**Second and third independent checks** on most records: (a) SF Recreation and Parks' property
dataset `gtr9-ntp6`, which uniquely carries **four** competing neighborhood attributions per
property (`analysis_neighborhood`, `mons_neighborhood`, `planning_neighborhood`,
`realtor_neighborhood`); (b) OpenStreetMap tags for the same object, pulled in one Overpass call
over the bounding box `37.7895,-122.4130,37.8025,-122.4030` (2,061 named elements).

---

## 2. The neighborhood itself

| Fact | Value | Source I fetched |
|---|---|---|
| DataSF analysis-neighborhood name | `Chinatown` | `https://data.sfgov.org/resource/j2bu-swwd.json?$limit=200` |
| DataSF polygon extent | lon −122.41291 to −122.40015; lat 37.79204 to 37.80218; a single 65-vertex ring | same, computed locally |
| SF Planning's own stated extent | "some 350 buildings along Stockton Street, Grant Avenue, Kearney Street, and connecting sidestreets and alleys between Broadway and Bush" | `https://data.sfgov.org/resource/63x5-g3m4.json?$limit=500`, record `Chinatown Historic District`, `description` field |
| Period of significance SF Planning assigns | 1906–1930/1938 | same record, `pos_1` field |
| Wikipedia's stated extent (aggregator) | "approximately, Kearny Street in the east, Broadway in the north, Powell in the west, and Bush Street in the south"; "covers 24 square blocks"; ZIPs 94108, 94133, 94111, 94102, 94109 | `https://en.wikipedia.org/wiki/Chinatown,_San_Francisco` |
| Two principal north–south streets | Grant Avenue and Stockton Street | same |
| Grant Avenue's former name | Dupont Street, renamed for President Ulysses S. Grant when the street was rebuilt after 1906; still 都板街 *Du Pon Gai* in Chinese | `https://en.wikipedia.org/wiki/Grant_Avenue` |
| Article 10 individual landmarks inside the vernacular boundary | **four**: Nos. 2, 44, 122, 235 | `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000` |
| Article 10 landmark **districts** covering Chinatown | **none.** The twenty district records in `knm6-5ej6` are Alamo Square, Northeast Waterfront, Telegraph Hill, Jackson Square, Clyde and Crooks, Liberty Hill, Blackstone Court, Bush Street–Cottage Row, Civic Center, Dogpatch, South End, Webster St, Market Street Masonry, Duboce Park | `https://data.sfgov.org/resource/knm6-5ej6.json?$limit=100` |
| NRHP listings inside the vernacular boundary | **none** | NPS ArcGIS, see §3.4 |

**Historical spine** (all from `https://en.wikipedia.org/wiki/Chinatown,_San_Francisco`,
`https://en.wikipedia.org/wiki/Grant_Avenue` and `https://en.wikipedia.org/wiki/Portsmouth_Square`
— **aggregators**; a writer should re-source or attribute): Yerba Buena's plaza laid out under
Mexican California from 1835; the first house of the settlement built by William A. Richardson in
1835 on what is now Grant between Clay and Washington; Chinese settlement on Dupont Street from the
early 1850s; the 1906 earthquake and fire levelling the quarter; rebuilding in place, in the
deliberately "Chinese" idiom that produced the surviving streetscape, which is why SF Planning's
period of significance starts in 1906 and not earlier.

---

## 3. BOUNDARY WORK — four incompatible Chinatowns, all published by the City

This is the single most important section in this file. **Do not resolve any of it. Arbitrator.**

### 3.1 The Dragon Gate is not in DataSF's Chinatown

The gate at Grant Avenue and Bush Street, the object every guide uses as Chinatown's front door,
tests **outside** the analysis-neighborhood polygon.

| Point | Coordinate | DataSF PIP result |
|---|---|---|
| Dragon Gate, Grant & Bush | 37.79075, −122.40584 | **Financial District/South Beach** |
| Dragon Gate (Wikidata coordinate) | 37.790685, −122.405585 | **Financial District/South Beach** |
| Grant & Pine | 37.79000, −122.40560 | **Financial District/South Beach** |
| Old St Mary's, 660 California | 37.79288, −122.40564 | Chinatown |

The polygon's southern edge along Grant runs at about latitude 37.7924, i.e. two blocks north of
Bush. SF Planning's own Chinatown Historic District description, quoted in §2, explicitly runs
"between Broadway and **Bush**". Wikipedia's stated boundary also reaches Bush. **Three City-adjacent
sources put the gate in Chinatown and the City's analysis layer does not.** Flagged, not resolved.

### 3.2 St Mary's Square: DataSF contradicts itself inside one dataset

SF Rec & Park property `136`, St. Mary's Square, 633 California St, 1.441 acres:

| Attribution field | Value |
|---|---|
| `analysis_neighborhood` | Financial District/South Beach |
| `mons_neighborhood` | **Chinatown** |
| `planning_neighborhood` | **Chinatown** |
| `realtor_neighborhood` | Financial District/Barbary Coast |

`https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=1000`. Two of the City's four neighborhood
schemes put this park in Chinatown and two do not. The Sun Yat-sen statue, the Comfort Women's
Column of Strength and the Rose Pak Memorial Tree all sit inside it and inherit the same problem.
**Arbitrator — Chinatown ↔ Financial District ↔ Union Square.**

### 3.3 The analysis polygon swallows Jackson Square and part of North Beach

Point-in-polygon over all 370 Article 10 landmark records returns **30** whose centroid falls in
DataSF's "Chinatown". Twenty-six of them are things no guide would call Chinatown:

| SF Landmark No. | Name | Address | Designated | What a reader would call it |
|---|---|---|---|---|
| 9, 10, 11, 12, 13, 14, 15, 16, 19, 20, 22, 23, 24, 25, 26, 27, 212 | the Hotaling / Jackson Street group | 407–473 Jackson St, 722–802 Montgomery St, Hotaling Place | 1969–2000 | Jackson Square |
| 33 | Sentinel Building / Columbus Tower | 916–920 Kearny St | 1970 | North Beach / Jackson Square |
| 34 | U.S. Mint & Subtreasury Building | 608–610 Commercial St | 1970 | Financial District |
| 52 | Transamerica Building / Old Fugazi Bank | 4 Columbus Ave | 1973 | Jackson Square |
| 142 | PG&E Old Station J | 565–569 Commercial St | 1981 | Financial District |
| 158 | Federal Reserve Bank Building | 400 Sansome St | 1983 | Financial District |
| 228 | City Lights Bookstore | 261–271 Columbus Ave | 2001 | **North Beach — already the roster's** |
| 237 | Drexler/Colombo Building | 1–33 Columbus Ave | 2002 | Jackson Square |
| 299 | Jones-Thierbach Coffee Company Building | 447 Battery St | 2022 | Financial District |

`https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`. **City Lights is named in the roster's
North Beach draw.** A pipeline that trusts the analysis polygon alone would put it in Chinatown's
file and break the global slug-uniqueness assertion. Recorded here as the proof that the polygon
must not be used unsupervised.

The corrective I used for the rest of this file: a hand-built quadrilateral for the **vernacular**
Chinatown — Bush on the south, Broadway on the north, Kearny on the east, Powell on the west, at
corners (−122.40430, 37.79055), (−122.40935, 37.78990), (−122.41255, 37.80030), (−122.40515,
37.79800). Ten Article 10 landmarks fall inside it, listed in §3.5. **That quadrilateral is mine,
not a source's, and nothing in the corpus may cite it.**

### 3.4 "National Register" in SF Planning's parcel data is not an NRHP listing

SF Planning's `Historic Resource Status by Parcel` (`3tsw-4idn`) gives 130 Chinatown parcels the
CEQA reason string **"National Register Historic District, California Register Historic District,
Historic Survey Result"**. Examples, all CEQA code A:

```
1-15   WAVERLY PL   built 1908      125-129 WAVERLY PL  built 1911
109-115 WAVERLY PL  built 1907      20 ROSS ALY         built 1907
22-30  SPOFFORD ST  built 1908      743 WASHINGTON ST   built 1909
```
`https://data.sfgov.org/resource/3tsw-4idn.json?$where=upper(stname)='WAVERLY'%20AND%20upper(sttype)='PL'`

But SF Planning's own **districts** dataset gives the Chinatown Historic District
`nr = "Eligible"`, `a10 = "No"`, `a11 = "No"`, with the origin note *"Local and NR, neither have
been formalized officially, Chinatown Historic Survey"*
(`https://data.sfgov.org/resource/63x5-g3m4.json?$limit=500`). And the NPS National Register
polygon layer, queried over the box `−122.42,37.785,−122.395,37.81`, returns eight districts, none
of them Chinatown:

```
https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query
Bank of Italy 78000754 (NHL) · Flood Mansion 66000230 (NHL) · Port of SF Embarcadero HD 06000372
Jackson Square HD 71000186 · Lower Nob Hill Apartment Hotel HD 91000957
Second and Howard Streets HD 99000894 · SF–Oakland Bay Bridge 00000525 · SF Cable Cars 66000233 (NHL)
```

The NPS **point** layer over the whole city (175 records) returns four inside DataSF's Chinatown
polygon — PG&E Substation J `86003514`, Federal Reserve Bank `89000009`, Colombo Building
`07001469`, NIANTIC storeship `91000563` — and **all four are in the Jackson Square / Financial
District overspill of §3.3.** Not one NRHP listing sits in vernacular Chinatown.

**Ruling for the writer: no Chinatown building may be written as "listed on the National Register."**
The honest sentence is that SF Planning has determined the Chinatown Historic District eligible for
the National Register and the California Register, and that no formal listing has been made. Note
for the verifier: the word "eligible" does not trip `@designation_claim`, and the phrase "National
Register" satisfies `@designation_citation` regardless, so a sentence built that way passes the
gate — but it must be *true*, and "listed" would not be.

### 3.5 The ten Article 10 landmarks inside the vernacular quadrilateral

| No. | Name | Address | Designated | DataSF PIP | Verdict |
|---|---|---|---|---|---|
| **2** | Old St. Mary's Church | 660–680 California St | 1968 | Chinatown | **core** |
| **44** | Donaldina Cameron House | 920 Sacramento St | 1971 | Chinatown | **core** |
| **122** | Clay Street Center | 965 Clay St | 1981 | Chinatown | **core** (the CHSA building) |
| **235** | Chinatown Branch Carnegie Library | 1135 Powell St | 2002 | Chinatown | **core** |
| 33 | Sentinel Building / Columbus Tower | 916–920 Kearny St | 1970 | Chinatown | STRADDLER → North Beach |
| 143 | Fire Station 2 | 460 Bush St | 1981 | Fin. District | STRADDLER |
| 167 | Met Life–Pacific Coast Head Office | 600 Stockton St | 1984 | Fin. District | STRADDLER → Union Square / Nob Hill |
| 173 | Notre Dame des Victoires Church & Rector | 564–566 Bush St | 1984 | Fin. District | STRADDLER → Union Square |
| 228 | City Lights Bookstore | 261–271 Columbus Ave | 2001 | Chinatown | **North Beach's, per roster** |
| — | Far East Cafe | 631–645 Grant Ave | **not designated** | Chinatown | see §5.11 |

Designation PDFs, one per landmark, at
`https://sfplanninggis.org/docs/landmarks_and_districts/LM<N>.pdf`.

### 3.6 Parks: two more straddlers

`gtr9-ntp6` again. Woh Hei Yuen Playground, 922 Jackson St, 0.356 ac:
`analysis_neighborhood = Chinatown` but `mons_neighborhood = planning_neighborhood =
realtor_neighborhood = **Nob Hill**`. Three of four say Nob Hill. **Arbitrator.**
Washington Square, 600 Columbus Ave, carries `analysis_neighborhood = "North Beach, Chinatown"` —
the dataset itself records it as a straddle, and it is plainly North Beach's marquee.

### 3.7 A trap worth recording about Nominatim

The ten Nominatim queries that got through before the 429s returned, for Chinatown addresses, an
`address` block whose `neighbourhood` key reads **"South of Market"** while the `display_name`
correctly contains "Chinatown". Example: Good Mong Kok Bakery, 1039 Stockton St →
`display_name` "…, Chinatown, South of Market, …", `address.neighbourhood` "South of Market".
**A pipeline that reads `address.neighbourhood` from Nominatim will file most of Chinatown under
SoMa.** Do not use that field for San Francisco.

---

## 4. Streets, alleys and the gate

**1. Dragon Gate (Chinatown Gate; 龍門) — attraction — STRADDLER**
- Location: Grant Avenue at Bush Street. OSM tags it `addr:housenumber = 401`, `addr:street = Grant Avenue`, `man_made = ceremonial_gate`, `tourism = attraction` — Overpass over the Chinatown box. Wikidata `Q40729318` gives 37.790685, −122.405585.
- What/when: a south-facing three-portal *pailou*. Design competition sponsored by Mayor John F. Shelley in 1967 with a $70,000 budget, open to architects of Chinese descent; **won by architect Clayton Lee of San Mateo with landscape architects Melvin H. Lee and Joseph Yee**. More than twenty entrants; jury of Thomas D. Church, Worley Wong, Charles Griffith and Morton Rader, with Merrill Jew as professional adviser. Groundbreaking October 1967, construction began August 1968. **Materials — 120 ochre roof tiles, roofing and the guardian lions — fabricated and donated by the Republic of China (Taiwan) in 1969**, the tiles valued at $45,000. Construction contract to Moreau Construction, completed at $90,889.15. Largely finished April 1969 but **dedicated 18 October 1970**, with a half-mile parade and a crowd of about 3,000 including roughly 50 protesters; Mayor Joseph Alioto and Vice-President Yen Chia-kan attended. Restored 1995 (roof tiles replaced, lights upgraded, steps repaired, handrails installed). — `https://en.wikipedia.org/wiki/Dragon_Gate_(San_Francisco)` (**aggregator**, but densely footnoted to contemporary press).
- Design detail from the same source: stone rather than wooden support columns; a male guardian lion at the west portal with his right fore paw on a pearl, a female at the east with her left fore paw on a cub; fish and dragons on the roof with a ball between the dragons. Central portal inscription 天下為公 *tiānxià wèi gōng*, attributed to Sun Yat-sen; east portal 忠孝仁愛.
- **DO NOT PUBLISH from this article:** "one of the most photographed locations in Chinatown" and "It is the first permanent ceremonial gate to be installed in the United States." Both are rankings.
- Zone: **STRADDLER, Chinatown ↔ Financial District.** DataSF PIP → Financial District/South Beach; SF Planning's Chinatown Historic District description runs to Bush. **Arbitrator.** See §3.1.
- Photos: []

**2. Grant Avenue (都板街) — the Chinatown stretch — historic-site or attraction**
- What/when: named Dupont Street after the Mexican–American War, for a naval officer of the USS *Portsmouth*; renamed Grant Avenue for President Ulysses S. Grant during the post-1906 rebuild. The first house of Yerba Buena was built by William A. Richardson in 1835 on Grant between Clay and Washington. One-way northbound through Chinatown; the two blocks between Sutter and Geary were converted to two-way in 2012 during the Stockton Street closure for Central Subway construction. — `https://en.wikipedia.org/wiki/Grant_Avenue` (aggregator).
- Parcel evidence for the streetscape, SF Planning `3tsw-4idn`: 700–720 Grant built 1906; 715–717 built 1907; 733–741 built 1906; 824–843 built 1908; 900–916 built 1908; 942–951 built 1907; 1019–1029 built 1924. All CEQA code A.
- Zone: Chinatown north of Bush; **the blocks south of Bush are Union Square's / the Financial District's.** DataSF PIP flips at about 37.7924. Flagged.
- Photos: []

**3. Stockton Street (市德頓街) — the Chinatown stretch — historic-site or attraction**
- What it is, from `https://en.wikipedia.org/wiki/Chinatown,_San_Francisco` (aggregator): the produce-and-fish-market street, "frequented less often by tourists", three- to four-storey mixed-use buildings with shops below and flats above.
- Zone: **Chinatown — DataSF PIP** at Stockton & Broadway, 37.79800, −122.40866, and at Vallejo & Stockton, 37.79730, −122.40900. The **south** end at 600 Stockton (Landmark No. 167) tests Financial District. Straddle flagged in §3.5.
- Photos: []

**4. Waverly Place (天后廟街, "Tin How Temple Street"; formerly Pike Street) — historic-site**
- What/when: one block between Sacramento and Washington, west of and parallel to Grant. Its Chinese name is *Tianhou miao jie*, "Tin How Temple Street" — `https://en.wikipedia.org/wiki/Tin_How_Temple`. Former name Pike Street — `https://en.wikipedia.org/w/index.php?action=raw&title=List_of_streets_and_alleys_in_Chinatown,_San_Francisco`.
- Build dates, parcel by parcel, SF Planning `3tsw-4idn`, every one CEQA code A: 1–15 (1908), 16 (1907), 18–20 (1907), 29–35 (1911), 37–39 (1911), 41–45 (1907), 100–108 (1906), 109–115 (1907), 112–118 (1906), 117–123 (1907), 124–132 (1907), 125–129 (1911), 131–133 (1907), 137–141 (1909), 138–142 (1910), 143–147 (1906), 146–150 (1907), 151–155 (1906), 160–162 (1954). **This is the sourced basis for saying the street was rebuilt in the decade after 1906 — a date range, not a superlative.**
- **DO NOT PUBLISH:** "the Street of Painted Balconies". It is a guidebook coinage; I found no City or institutional source for it.
- Zone: **Chinatown — DataSF PIP** at 37.79430, −122.40680.
- Photos: []

**5. Ross Alley (舊呂宋巷; formerly Stout's Alley) — historic-site**
- What/when: runs north–south one block between Jackson and Washington, between and parallel to Stockton and Grant. Laid out **1849** beside the house of the merchant Charles L. Ross, from whom the name comes; originally Stout's Alley for Dr Arthur Breese Stout, who bought Ross's house. Iron doors on its gambling establishments were banned by city ordinance in **1889**. — `https://en.wikipedia.org/wiki/Ross_Alley` (aggregator).
- Parcels, `3tsw-4idn`, all CEQA A: 8–14 (1906), 20 (1907), 22–24 (1907), 35 (1910), 41–53 (1908). **Note 56 Ross Alley, the fortune cookie factory, has no parcel row under this street name** — it is carried under an adjoining street's parcel.
- **DO NOT PUBLISH:** "The oldest alley in San Francisco" and "one of the main locations for brothels" as ranking or as unattributed vice history. The 1889 ordinance and the 1849 date publish; the ranking does not.
- Zone: **Chinatown — DataSF PIP** at 37.79531, −122.40706 and 37.79570, −122.40700.
- Photos: []

**6. Spofford Street (新呂宋巷) — historic-site**
- Parcels, `3tsw-4idn`, all CEQA A: 22–30 (1908), 31–37 (1907), 32–34 (1907), 36–38 (1907), 39–49 (1907), 44–54 (1907), 48–50 (1906).
- Zone: **Chinatown — DataSF PIP** at 37.79470, −122.40730.
- **Thin.** No dedicated Wikipedia article; I have build dates and a Chinese name and nothing else. The tong-hall history a guide would want is not sourced here. Weak candidate as written.
- Photos: []

**7. Hang Ah Alley / Pagoda Place (香亞街) — historic-site**
- OSM carries it as a single way named `Hang Ah Alley;Pagoda Alley`, `name:zh = 香亞街`.
- **Hang Ah Alley lies wholly inside the boundary of Willie "Woo Woo" Wong Playground** — stated in terms by SF Rec & Park: *"at the Western edge, Hangh Ah Alley is wholly within the park boundary"* (their spelling), `https://sfrecpark.org/1175/Willie-Woo-Woo-Wong-Playground-Improveme`. This is a **physical containment a source states**, so it publishes; it is not orientation by impression.
- Zone: **Chinatown.**
- Photos: []

**8. Beckett Street (白話轉街; formerly Bartlett Alley, then Lozier Street) — historic-site**
- Former names from the alley list (aggregator). Parcels 26–30 Beckett built 1908, CEQA A — `3tsw-4idn`. Carries the Ma-Tsu Temple at No. 30.
- Zone: **Chinatown.**
- Photos: []

**9. Walter U. Lum Place (林華耀街 / 花園街; formerly Brenham Place) — historic-site**
- Forms the western boundary of Portsmouth Square — `https://en.wikipedia.org/wiki/Portsmouth_Square`. Named for Walter U. Lum; the alley list gives the former name Brenham Place. Sewer replacement under the roadway was scheduled to start October 2026 for up to four weeks as part of the Portsmouth Square works — `https://sfrecpark.org/1166/Portsmouth-Square-Improvement-Project`.
- Zone: **Chinatown.**
- Photos: []

**10. Old Chinatown Lane (舊華埠巷 / 馬房巷; formerly Cameron Alley, Portola Alley, Church Court) — historic-site**
- Three recorded former names, from the alley list (aggregator). Nothing else sourced. **Weak.**
- Photos: []

**11. Commercial Street (襟美慎街) — historic-site — STRADDLER**
- What/when: runs Sansome to Grant; its eastern end was the original waterfront before filling. Site of the original San Francisco Mint and of the U.S. Sub-Treasury completed 1877, most of which was destroyed in 1906; the surviving first-floor façade and part of the subterranean vaults now house the San Francisco Historical Society at 608 Commercial. Parts of the street retain circular embedded-brick paving patterns. — `https://en.wikipedia.org/wiki/Commercial_Street_(San_Francisco)` (aggregator).
- **DO NOT PUBLISH:** "one of only two streets in San Francisco oriented directly toward the tower of the Ferry Building" — a comparison class, banned.
- Zone: **STRADDLER, Chinatown ↔ Financial District.** DataSF PIP at 608 Commercial → Chinatown; at 565 Commercial → Chinatown; every reader calls it Financial District. Also carries a **Conservation District**: `Commercial-Leidesdorff Conservation District`, `a11 = Listed` — `https://data.sfgov.org/resource/63x5-g3m4.json?$limit=500`. **Arbitrator.**
- Photos: []

**12. Jack Kerouac Alley (亞打罅巷; formerly Adler Place) — historic-site — STRADDLER**
- What/when: one-way alley connecting Grant Avenue to Columbus Avenue; continues across Columbus as William Saroyan Alley. Lawrence Ferlinghetti proposed the conversion to the Board of Supervisors in 1988; repaved as a pedestrian way and **reopened March 2007**, with a dedication ceremony April 2007. Paving carries engraved texts in English and Chinese by Steinbeck, Angelou, Ferlinghetti and Kerouac. — `https://en.wikipedia.org/wiki/Jack_Kerouac_Alley` (aggregator).
- Historical note worth a line: the Chinese Historical Society of America's first permanent home, from 1966, was at **17 Adler Place** (off 1140 Grant Avenue), i.e. in this alley under its old name — `https://en.wikipedia.org/wiki/Chinese_Historical_Society_of_America`.
- Zone: **STRADDLER, Chinatown ↔ North Beach.** The alley's own definition is that it joins the two. **Arbitrator.**
- Photos: [] — note the engraved pavement texts are literary quotations set as artwork; treat as artwork, not architecture, in the photo wave.

**13. Stockton Street Tunnel — historic-site — STRADDLER**
- What/when: **opened 1914**; south portal at Bush Street, north portal at Sacramento Street. Built to cut the grade: before it, the maximum grade north from Sutter was 18% and south from Sacramento 12%; the tunnel holds a maximum of **4.29%** between Sacramento and Sutter. Planned at 1,400 ft in 1909, shortened to 750 ft in 1910 at 55 ft wide and 25 ft high, narrowed in 1912 to 42 ft by 18 ft. Built primarily for the streetcars of the F Stockton line; petition filed 23 January 1909. Stockton Street was lowered at the south approach, visible at 417 Stockton (Mystic Hotel), where the basement became the ground floor and the old front door is a marked window bay on the second floor. — `https://en.wikipedia.org/wiki/Stockton_Street_Tunnel` (aggregator). **Those grades are measurements, not superlatives, and publish.**
- Zone: **STRADDLER, Chinatown ↔ Union Square ↔ Nob Hill.** The north portal at Sacramento is squarely Chinatown; the south portal at Bush is not. **Arbitrator.**
- Photos: []

**14. Broadway Tunnel (Robert C. Levy Tunnel) — historic-site — STRADDLER**
- Zone: **Chinatown — DataSF PIP** at the west portal, 37.79830, −122.41100. But the tunnel runs west under Russian Hill and its far portal is not Chinatown's. **Arbitrator, Chinatown ↔ Russian Hill ↔ Nob Hill.**
- **Weak as written.** I did not fetch a dedicated source for its dates; a writer must before shipping.
- Photos: []

**15. The remaining named alleys — one grouped record or none**
From `https://en.wikipedia.org/w/index.php?action=raw&title=List_of_streets_and_alleys_in_Chinatown,_San_Francisco`, with official Chinese names and former names where the list gives them: Adele Court 亞打利巷; Bedford Place 百福巷; Brooklyn Place 布閣倫巷; Codman Place 吉民巷; Cooper Alley 谷巴巷; Cordelia Street 歌地利亞街; Dawson Place 杜臣巷; Doric Alley 多域巷; Duncombe Alley 燈琴巷/肥仔巷; Fisher Alley; James Place; Jason Court 金菊園巷 (formerly Sullivan Alley); John Street; Joice Street 哉思街; Keyes Alley 其士巷; Miles Court 邁奧司巷; Miller Place 美拿巷; Parkhurst Alley 柏可思巷; Pelton Place 柏頓巷; Pontiac Alley 麵包巷; Pratt Place 庇提巷 (formerly Ellick Lane); Sabin Place 沙賓巷 (formerly Salina Place); Shepard Place 舒伯巷; St Louis Place 聖路易巷/火燒巷; Stark Alley 士登巷; Stone Street 市東街; Trenton Street 登頓街; Wayne Place 威恩巷 (formerly Scott Place); Wentworth Place 德和街 (formerly Washington Place); Wetmore Street 域磨街.
- **Aggregator, and the article's own sourcing is three external links, one of them a blog.** The Chinese names are worth having but a writer must not present them as official without a better source. Note the list itself is titled "official Chinese name/alternate Chinese name" and does not say which is which.
- Photos: []

---

## 5. Temples, churches and missions

**16. Tin How Temple (Tien Hau, 天后古廟) — historic-site**
- Address: **125 Waverly Place**, top floor of a four-storey building. The address is *not* in OSM (the node carries no `addr:*` tags) and *not* in Wikipedia's text; it comes from the parcel record 125–129 Waverly Place, built **1911**, CEQA A, `https://data.sfgov.org/resource/3tsw-4idn.json`, cross-checked against Wikidata `Q2135574`'s coordinate 37.794681, −122.406975. **The street number is the weakest fact in this record — confirm before publishing it.**
- What/when: dedicated to the sea goddess Mazu, known in Cantonese as Tin How. Founded **c. 1852–53**, reportedly at the present site, by Day Ju. Destroyed in the 1906 fire, with the image of the goddess, the temple bell and part of the altar surviving. Ownership had by then passed to the **Sue Hing Benevolent Association**, which reopened the temple in **1910** on the top floor of a four-storey building it put up on the site. Closed 1955; **reopened 4 May 1975**. Centenary procession May 2010. — `https://en.wikipedia.org/wiki/Tin_How_Temple` (aggregator; the article hedges the founding with "purportedly").
- **Date conflict, flagged:** Wikipedia's 1910 reopening against SF Planning's parcel build year of 1911 for 125–129 Waverly. Both may be right (built 1910, assessed 1911) — do not assert one.
- Visiting, same source: open daily 10:00–15:00 except holidays; admission free with the attendant's permission; donations accepted; **photography is not allowed inside.** That last is a fact about the place and publishes; it also means the photo wave gets nothing here but an exterior.
- **DO NOT PUBLISH:** "the oldest extant Taoist temple in San Francisco's Chinatown", "one of the oldest still-operating Chinese temples in the United States" — both rankings, and both appear twice across the Tin How and Ma-Tsu articles.
- Zone: **Chinatown — DataSF PIP** at 37.79458, −122.40676 and at the Wikidata coordinate.
- Photos: []

**17. Kong Chow Temple (岡州古廟) — historic-site**
- **ADDRESS CONFLICT, flagged.** OSM tags the building `addr:housenumber = 865`, `addr:street = Stockton Street`. Most guidebook usage gives 855 Stockton Street, above the U.S. Post Office. Wikipedia gives no number at all. **855 has no parcel row in `3tsw-4idn` under Stockton; 865 was not tested.** Do not publish a street number until this is settled.
- What/when: dedicated to Guan Di. Founded **1849** by Cantonese residents; renamed the Kong Chow Clan Association in **1854**. Destroyed in 1906 and rebuilt on its original site at 520 Pine, near St Mary's Square. In 1968–69 Charlotte Ah Tye Chang, then in her nineties, led protests against the demolition of the old temple, joined by her niece the artist Nanying Stella Wong; the old temple was demolished and a new one built **in 1977** at the present Stockton Street building, known as the Kong Chow Building. Bess Truman visited in **1948** and drew a *kau cim* stick; the prediction slip is displayed in the temple. — `https://en.wikipedia.org/wiki/Kong_Chow_Temple` (aggregator).
- Zone: **Chinatown — DataSF PIP** at 37.79380, −122.40760 and at Wikidata `Q6429111`'s 37.7938, −122.408.
- Photos: []

**18. Ma-Tsu Temple of U.S.A. (媽祖廟) — historic-site**
- Address: **30 Beckett Street, San Francisco, CA 94133** — OSM `addr:housenumber = 30`, `addr:street = Beckett Street`, `addr:postcode = 94133`, `religion = taoist`, `denomination = mazu`. Parcel 26–30 Beckett built **1908**, CEQA A — `3tsw-4idn`.
- What/when: **founded 1986**, dedicated to Mazu, with foundational ties to the Chaotian Temple in Beigang, Yunlin, Taiwan. Originally on Grant Avenue; **moved to Beckett Street in 1996**. Its founding is described in the literature as reflecting the demographic change after the Immigration and Nationality Act of 1965 and the rise of a transnational Taiwanese-American community. — `https://en.wikipedia.org/wiki/Ma-Tsu_Temple_(San_Francisco)` (aggregator, citing Miller, *Chinese Religions in Contemporary Societies*, 2006); Wikidata `Q18351171` gives inception 1986.
- **Its own site `matsuusa.org` does not resolve DNS from here**, so no hours. Write "no source states its opening hours, so none are given here" or say nothing.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**19. Old St Mary's Cathedral (Old Cathedral of St Mary of the Immaculate Conception) — historic-site**
- Address: **660 California Street, San Francisco, CA 94108**, at Grant Avenue — OSM `addr:housenumber = 660`, `addr:street = California Street`, `addr:postcode = 94108`; phone +1 415-288-3800; site `https://www.oldsaintmarys.org/`.
- **Designation, two registers, both with identifiers:**
  - **San Francisco Landmark No. 2**, designated **1968** — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`, record `landmarkno = 2`, `yeardesignated = 1968.0`, `address = 660-680 California Street`; designation document `https://sfplanninggis.org/docs/landmarks_and_districts/LM2.pdf`. Wikipedia dates the designation precisely to **11 April 1968** — `https://en.wikipedia.org/wiki/Old_St._Mary%27s_Cathedral`.
  - **California Historical Landmark: "SITE OF OLD ST. MARY'S CHURCH", plaque number 810, listed 30 December 1965** — `https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38`. **WARNING for the verifier: a sentence citing only the CHL number FAILS `@designation_citation`,** which recognises SF Landmark numbers, Article 10, the National Register, NRHP and six-digit reference numbers, and nothing else. Pair it with the SF Landmark number or drop it.
- What/when: cornerstone laid Sunday **17 July 1853** at California and Dupont by Bishop Joseph S. Alemany; built by Chinese labourers with brick brought round Cape Horn and granite cut in China; **Gothic Revival, designed by William Craine and Thomas England**; dedicated at Christmas midnight mass, **1854**, becoming the first cathedral of the Archdiocese of San Francisco. Cathedral 1854–1891, then a parish church. Under the clock face: *"Son, observe the time and fly from evil"* (Ecclesiasticus 4:23). Survived the 1906 earthquake and was gutted by the fire the next day — only the exterior brick walls and the bell tower remained; the bells and marble altar melted. — `https://en.wikipedia.org/wiki/Old_St._Mary%27s_Cathedral` (aggregator).
- **DO NOT PUBLISH:** "When it opened, it was the tallest building in San Francisco and all of California" and "the first cathedral in California to be built for the express purpose of serving as a cathedral". Rankings.
- **Data conflict, flagged:** SF Planning's parcel record for 660–660 California gives `yearbuilt = 1966` with reason *"Article 11 Individual, National Register Historic District, California Register Historic District"* — that is the modern parish building on the same parcel, not the 1854 church. A pipeline that reads `yearbuilt` will publish 1966 for Old St Mary's. `3tsw-4idn`.
- Related: **Paulist Center at Old Saint Mary's Cathedral, 614 Grant Avenue** — OSM, `shop = religion`. A separate address on the same complex.
- **No hours captured.** `oldsaintmarys.org` has a "Mass Times" item in its nav but `/mass`, `/mass-times`, `/mass-schedule` and `/contact` all return 404 and the site publishes no sitemap. Someone should chase the working URL before shipping mass times.
- Zone: **Chinatown — DataSF PIP** at 37.79288, −122.40564.
- Photos: []

**20. Buddha's Universal Church — historic-site**
- Address: **720 Washington Street** — OSM `amenity = place_of_worship`, `religion = buddhist`, phones +1 415 982-6116/6117/6118, site `https://www.bucsf.com/`. Parcel 720–720 Washington, built **1964**, CEQA A — `3tsw-4idn`.
- From the church's own site: a bilingual musical production for Chinese New Year has been produced by its members since 1966; lectures on Buddhism moved to Zoom during the pandemic and meet the second and fourth Sunday of the month at 10:30 a.m. Pacific, with no service on the fourth Sundays of November and December. Tours of the church "will resume when safe", given after the lecture and discussion group on the second and fourth Sundays, starting at the golden image of the Buddha at the main altar. — `https://www.bucsf.com/`.
- **The site is stale** — it still leads on COVID-19 and a George Floyd statement. Treat the tour arrangement as unverified and do not present the Zoom schedule as current without a re-check.
- Zone: **Chinatown — DataSF PIP** at 37.79500, −122.40566.
- Photos: []

**21. First Chinese Baptist Church of San Francisco — historic-site**
- Address: **15 Waverly Place** — parcel 1–15 Waverly Place, built **1908**, CEQA A, `3tsw-4idn`.
- What/when: founded **1880** by the missionary J. B. Hartwell as a Southern Baptist mission, first in a rented storefront; a permanent church under the Home Mission Board established **1888** at Waverly Place and Sacramento Street. The congregation broke away with thirteen others over Mayor Isaac Kalloch's anti-Chinese politics and became Northern Baptist. The building was destroyed by fire in the 1906 earthquake and the congregation relocated to Oakland while it was rebuilt. — `https://en.wikipedia.org/wiki/First_Chinese_Baptist_Church_of_San_Francisco` (aggregator).
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**22. Presbyterian Church in Chinatown — historic-site**
- Address: **925 Stockton Street** is the conventional address; OSM has a node "Saint Mary's Chinese Mission" at 925 Stockton, which is a *different* body, so **the address is unconfirmed and must not be published as read.**
- What/when: the Presbyterian Chinese Mission held its first meeting **6 November 1853** with four members, under **William Speer** (1822–1904), a Presbyterian minister sent by the Board of Foreign Missions after missionary service in Canton. Put under the Board of National Missions and renamed the Chinese Presbyterian Church in **1925**; renamed Presbyterian Church in Chinatown in **1958**. — `https://en.wikipedia.org/wiki/Presbyterian_Church_in_Chinatown` (aggregator; the article is four paragraphs long).
- **DO NOT PUBLISH:** "the oldest Chinese American or Asian American church in North America" — the article's own lead sentence, and a ranking.
- Photos: []

**23. Chinese United Methodist Church — historic-site**
- Address: **1009 Stockton Street.** Parcels 1009–1011 Stockton built **1910** and 1000–1032 Stockton built **1907**, both CEQA A — `3tsw-4idn`.
- **Thin.** No dedicated article fetched; I have an address and a build year. Weak candidate.
- Photos: []

**24. St Mary's Chinese Catholic Center / St Mary's Chinese Mission and schools — historic-site**
- Addresses: **902 Stockton Street** (parcel 901–907 Stockton, built **1907**, CEQA A — `3tsw-4idn`); OSM separately carries "Saint Mary's Chinese Mission" at **925 Stockton Street** (`building = church`), "St. Mary's School" at **838 Kearny Street** (`building = school`), "Saint Mary's Chinese Day School" and "Saint Mary's Chinese Language School" as unaddressed school nodes. Old St Mary's own navigation lists a "St. Mary's Chinese Language School" — `https://www.oldsaintmarys.org/`.
- **Four addresses for what may be two or three institutions.** Do not publish any of them until someone untangles which body is at which door. Flagged for the verifier.
- Photos: []

**25. Notre-Dame-des-Victoires — historic-site — STRADDLER**
- **San Francisco Landmark No. 173**, designated **1984**, "Notre Dame Des Victoires Church & Rector", 564–566 Bush Street — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`; document `https://sfplanninggis.org/docs/landmarks_and_districts/LM173.pdf`.
- Zone: **STRADDLER.** DataSF PIP → Financial District/South Beach; it sits on Bush, the street SF Planning names as Chinatown's southern edge; it is the French national parish and reads as Union Square's. **Arbitrator — and my honest reading is that it is not Chinatown's.**
- Photos: []

---

## 6. Museums, institutions and civic buildings

**26. Chinese Historical Society of America Museum and Learning Center — museum**
- Address: **965 Clay Street, San Francisco, CA 94108** — the society's own visit page, read through WebFetch because `chsa.org` returns 403 to urllib: `https://chsa.org/visit/`.
- **Hours conflict, flagged.** The society's own page: *"OPEN: Wed & Sat 10am–5pm CLOSED: Mon, Tues, Thurs, Fri, Sun"*. OSM tags the same building `opening_hours = We-Su 11:00-16:00; Jan 1 off, Jun 19 off, Jul 4 off, Nov Th[4] off, Dec 24-25 off`. **A place's own site wins.** Publish Wed & Sat 10:00–17:00 or publish nothing. Admission prices are not stated on the visit page.
- **Designation: San Francisco Landmark No. 122, "Clay Street Center", designated 1981** — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`; document `https://sfplanninggis.org/docs/landmarks_and_districts/LM122.pdf`. SF Planning's parcel record for 965–979 Clay gives `yearbuilt = 1932`, CEQA A/A*, reason *"Article 10 Individual Landmark, Historic Survey Result"* — `3tsw-4idn`.
- The building: the **Chinatown YWCA**, **designed by Julia Morgan**. The San Francisco YWCA resolved in October 1929 to build on three lots bounded by Joice, Clay and Powell; Morgan was contracted and, after consultation with Chinese-Americans, incorporated elements from Chinese arts and crafts. It housed the Chinatown YWCA from **1932** until damage in the 1989 Loma Prieta earthquake; the YWCA board agreed to sell to CHSA in **1996**. **CHSA opened its museum in the building in November 2001.** The National Trust for Historic Preservation gave CHSA a National Preservation Honor Award in 2004 for the restoration and retrofit, and the California Heritage Council a further award in 2005. The building is nicknamed "Lantern on the Hill". — `https://en.wikipedia.org/wiki/Chinese_Historical_Society_of_America` (aggregator).
- The society: conceived autumn 1962, incorporated **5 January 1963**, founded by Thomas W. Chinn, C. H. Kwock, Chingwah Lee, H. K. Wong and Thomas W. S. Wu. Previous homes: 17 Adler Place off 1140 Grant Avenue from 1966; 650 Commercial Street from June 1989. — same source.
- Collection highlights, same source: twelve *Gum Shan* (金山) paintings by **Jake Lee**, originally commissioned for a private dining room in Johnny Kan's restaurant, which opened 1959; and on permanent display, **James Leong's mural *One Hundred Years: History of the Chinese in America***, commissioned for the Ping Yuen housing project in the early 1950s. **Both are artworks by named artists — see §8.**
- **DO NOT PUBLISH:** "the oldest and largest archive and history center documenting the Chinese American experience in the United States", the article's own lead. Ranking.
- Zone: **Chinatown — DataSF PIP** at 37.79361, −122.40905.
- Photos: []

**27. Chinese Culture Center of San Francisco — museum (two addresses)**
- Addresses, from the centre's own visit page `https://www.cccsf.us/visit`: **CCC Art Center & Design Store, 667 Grant Avenue**, hours **11 a.m.–6 p.m., Thursday to Monday**; **CCC Office and Him Mark Lai Learning Center, 750 Kearny Street, 3rd Floor Mezzanine, San Francisco, CA 94108**, office hours 9 a.m.–6 p.m., +1 (415) 986-1822 ext. 025.
- What/when: a non-profit established **1965** as the operations centre of the Chinese Culture Foundation, which incorporated **15 October 1965**. Facilities total 20,000 sq ft inside the hotel building and include a 299-seat auditorium, a 2,935 sq ft gallery, a gallery shop, a classroom and offices. Work began on the centre's facilities **27 January 1973**. Executive director Jenny Leung since 2020; Mabel Teng 2009–2019. The Culture Center leases its space at a nominal cost following lobbying by the local Chinese-American community. — `https://en.wikipedia.org/wiki/Chinese_Culture_Center` and `https://en.wikipedia.org/wiki/Hilton_San_Francisco_Financial_District` (aggregators).
- Zone: **Chinatown — DataSF PIP** at 750 Kearny, 37.79457, −122.40515, and at 667 Grant. The building it sits in is the Hilton, which is itself a straddler (§8 below, record 62). **Flagged.**
- Photos: []

**28. Chinatown / Him Mark Lai Branch Library — attraction**
- Address: **1135 Powell Street, San Francisco, CA 94108**; +1 415 355-2888; `https://sfpl.org/chinatown`. The branch's full official name on SFPL's own page is **"Chinatown/Him Mark Lai"** — `https://sfpl.org/locations/chinatown`.
- Hours, from OSM `opening_hours`: `Su 13:00-17:00; Mo,Fr 13:00-18:00; Tu-Th 10:00-20:00; Sa 10:00-18:00; PH off`. **Second-hand — SFPL's own branch page did not render its hours block to my fetch, so re-check on the library's own site before publishing hours.**
- **Designation: San Francisco Landmark No. 235, "Chinatown Branch Carnegie Library", designated 2002** — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`; document `https://sfplanninggis.org/docs/landmarks_and_districts/LM235.pdf`. Parcel 1135–1135 Powell, `yearbuilt = 1921`, CEQA A/A*, reason *"Article 10 Individual Landmark"* — `3tsw-4idn`. OSM independently tags `start_date = 1921`.
- Holdings note from SFPL: "An extensive file of pamphlets, newspapers and magazine articles on Chinatown's history and issues of concern to the Chinese and Asian American community."
- Zone: **Chinatown — DataSF PIP** at 37.79527, −122.41019.
- Photos: [] — but see §8: the building carries **Rene Yung's *Take Root* (1996)**, nine copper panels and lamps, accession 1996.7.a–i, at this address.

**29. Donaldina Cameron House — historic-site**
- Address: **920 Sacramento Street.** Parcel 920–920 Sacramento, `yearbuilt = 1908`, CEQA A/A*, reason *"Article 10 Individual Landmark, Historic Survey Result"* — `3tsw-4idn`. (The adjoining parcel 901–945 Sacramento is a 1982 building, CEQA C — do not merge the two.)
- **Designation: San Francisco Landmark No. 44, designated 1971** — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`; document `https://sfplanninggis.org/docs/landmarks_and_districts/LM44.pdf`. Wikipedia dates the designation to **10 October 1971** — `https://en.wikipedia.org/wiki/Donaldina_Cameron_House`.
- What/when: built **1908**; formerly the Occidental Board Presbyterian Mission House and the Chinese Presbyterian Mission House. The Presbyterian Women's Occidental Board of Foreign Missions was organised by five women in **1873**; the Mission House was formed in Chinatown in **1876** under Margaret Culbertson (1834–1897) as a home for Chinese girls escaping abusive employment or prostitution, first in a wooden building across the street at **933 Sacramento Street**. Donaldina Cameron joined in **1895** and later directed the house. — same article (aggregator).
- The organisation today, from its own site `https://www.cameronhouse.org/about`: "Cameron House empowers the San Francisco Chinese community to build strength and resilience through family-centered programs"; **"Founded in 1874"**. **Note the conflict:** the charity's own site says 1874; Wikipedia's history says the board organised 1873 and the mission house formed 1876. Do not assert a founding year.
- Its own site also names **"Tien Fuh Wu Way"** and a "Community Commons" construction project — worth a line, and worth checking whether Tien Fuh Wu Way is an official street name.
- Zone: **Chinatown — DataSF PIP** at 37.79333, −122.40835.
- Photos: []

**30. Great Star Theater (大星劇院) — theater**
- Address: **636 Jackson Street, San Francisco, CA 94133**; +1 415 735-4159; `https://greatstartheater.org` — OSM tags, cross-checked to the theater's own site.
- What/when: **built 1925** as the Great China Theater for Chinese opera, as a rival of the Mandarin Theater of 1924 one block away (renamed Sun Sing in 1949). **410 seats.** The Pacific Chinese Dramatic Club opened offices in the theater in 1930. Showed Chinese-language films through and after the Second World War. Bruce Lee's father performed on its stage and Lee appeared as an infant in the 1941 Cantonese film *Golden Gate Girl*, directed by Esther Eng. Refurbished from 2010 under a ten-year lease by George Kaskanlian Jr. and Kenny Montero. **Reopened 18 June 2021** by Alice Chu and Roger Pincombe on a ten-year lease, who formed a non-profit and spent $150,000 on restoration. Owned as of 2015 by Julie Lee; operated by Paul Nathan. — `https://en.wikipedia.org/wiki/Great_Star_Theater` (aggregator, well footnoted to the *Examiner* and *SFGate*).
- Parcel 626–636 Jackson, `yearbuilt = 1925`, CEQA A — `3tsw-4idn`. **The parcel year corroborates the article.**
- Its own site heads a blog series "A Century of Cultural Heritage (1925–2025)" and "Home of the Cantonese Opera" — `https://www.greatstartheater.org/`.
- **DO NOT PUBLISH:** "the last Chinese theater in any Chinatown in the United States" (article lead) and the 1959 *Examiner* line "the last active Chinese opera house in the United States". Rankings, attributed or not.
- **Also do not publish:** the 2015 death investigation and the ghost-tour material. Not travel-guide content and the article's own framing is lurid.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**31. San Francisco Historical Society Museum — museum — STRADDLER**
- Address: **608 Commercial Street, San Francisco, CA 94111**; +1 415 537-1105; `https://www.sfhistory.org` — OSM `tourism = museum`, `opening_hours = Tu-Sa 10:00-16:00`.
- The building: **San Francisco Landmark No. 34, "U.S. Mint & Subtreasury Building", 608–610 Commercial Street, designated 1970** — `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`; document `https://sfplanninggis.org/docs/landmarks_and_districts/LM34.pdf`. Also a **California Historical Landmark: "SITE OF FIRST U.S. BRANCH MINT IN CALIFORNIA", plaque number 87, listed 29 March 1933** — `https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38`. **Same CHL citation warning as record 19.**
- What survives: the first-floor façade and part of the subterranean vaults of the 1877 Sub-Treasury, most of which was destroyed in 1906 — `https://en.wikipedia.org/wiki/Commercial_Street_(San_Francisco)`.
- The society's own site confirms it operates a "Museum of San Francisco" with exhibits, tours and memberships at that address — `https://www.sfhistory.org/`, `https://www.sfhistory.org/visitus`.
- Zone: **STRADDLER, Chinatown ↔ Financial District.** DataSF PIP at 37.79438, −122.40354 → Chinatown; every reader calls this the Financial District, and the roster's Financial District draw names the Wells Fargo History Museum and Jackson Square. **Arbitrator, and my reading is that this is the Financial District's.**
- Photos: []

**32. Chinese Consolidated Benevolent Association (the Chinese Six Companies, 中華會館) — historic-site**
- Address: **843 Stockton Street** — OSM `building = yes`, `addr:housenumber = 843`. Parcel 843–843 Stockton, `yearbuilt = 1908`, CEQA A; the adjoining 830–848 Stockton parcel is **1915** — `3tsw-4idn`.
- What/when: organised in the 1850s and **formally established in 1882** in San Francisco's Chinatown; known in English as the Chinese Six Companies in San Francisco; 中華會館 in the western United States and western Canada. Its clientele were Chinese immigrants mainly from eight districts on the west side of the Pearl River Delta in Guangdong. — `https://en.wikipedia.org/wiki/Chinese_Consolidated_Benevolent_Association` (aggregator).
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**33. Chinese American Citizens Alliance national headquarters — historic-site**
- Address: **1044 Stockton Street.** Parcel 1040–1044 Stockton, `yearbuilt = 1920`, CEQA A — `3tsw-4idn`.
- What/when: founded **1895** in San Francisco as the Native Sons of the Golden State; renamed the Chinese American Citizens Alliance in **1915**. Lodges chartered in Los Angeles (1914), San Francisco (1915) and Oakland (1917). **The national headquarters building at 1044 Stockton Street was completed in the early 1920s** — which the parcel year of 1920 corroborates. Twenty local lodges as of 2026. — `https://en.wikipedia.org/wiki/Chinese_American_Citizens_Alliance` (aggregator).
- **DO NOT PUBLISH:** "the United States' oldest Asian American civil rights organization". Ranking.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**34. Bing Kong Tong Benevolent Association — historic-site**
- Address: **35 Waverly Place, San Francisco, CA 94108**; +1 415 982-2551; `https://bingkongtong.com/` — OSM `amenity = social_centre`. Parcel 29–35 Waverly Place, `yearbuilt = 1911`, CEQA A — `3tsw-4idn`.
- Wikipedia has an article "Bing Kong Tong" in `Category:Chinatown, San Francisco` which I did not fetch. **A writer should.**
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**35. Other family and district association halls — a group, not yet individual records**
OSM in the Chinatown box carries, with no useful tags beyond a name: **Quong Fook Tong Benevolent Association (廣福堂), Clay Street**; **積善堂 Jack Sen Benevolent Association**, `http://www.jacksentong.org/`. Wikipedia's Chinatown category further names **Chee Kung Tong**, **Suey Sing Association**, **Soo Yuen Benevolent Association**, **Eng Suey Sun Association**, **Gin Family Association** and **Lung Kong Tin Yee Association**. Chee Kung Tong (致公堂, also the "Chinese Freemasons") was established **1880** with its headquarters in San Francisco — `https://en.wikipedia.org/wiki/Chee_Kung_Tong` (aggregator).
- **None of these has a sourced street address in my hands except Bing Kong Tong.** They are the substance of Waverly Place and Spofford Street and a good guide would want two or three of them; a writer must source addresses first.
- Photos: []

**36. Nam Kue School (南僑學校) — historic-site**
- Address: **765 Sacramento Street.** Parcel 765–769 Sacramento, `yearbuilt = 1924`, CEQA A — `3tsw-4idn`. OSM has a node "Nam Kue School" with no address tags.
- **Thin — a build year and an address and nothing else.** Weak.
- Photos: []

**37. Gordon J. Lau Elementary School — historic-site**
- Address: **950 Clay Street, San Francisco, CA 94108**; +1 415 291-7921 — OSM.
- What/when: founded as the Chinese School and opened **September 1859** as a segregated public school for Chinese children; later the Oriental Public School. Renamed in **1998** for Gordon J. Lau, the city's first Chinese-American supervisor. A California law of 1860 barred "Negroes, Mongolians, and Indians" from the public schools and permitted segregated schools instead. — `https://en.wikipedia.org/wiki/Gordon_J._Lau_Elementary_School` (aggregator).
- **It is a working elementary school.** A travel guide writes about it from the street or not at all; do not imply visitor access.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**38. Chinese Hospital (東華醫院) — historic-site**
- Address: **845 Jackson Street, San Francisco, CA 94133**; +1 415 982-2400; `http://www.chinesehospital-sf.org/`; OSM `amenity = hospital`, `opening_hours = 24/7`.
- Parcels, `3tsw-4idn`: **831–845 Jackson, `yearbuilt = 2016`, CEQA C, "Not 45 years or older"** — the current tower; and **840–846 Jackson, `yearbuilt = 1910`, CEQA B** — the older fabric across the street. **Two buildings, two dates; do not merge them.**
- What/when: traces its origins to **1899**, when the Oriental Dispensary, with ties to the Tung Wah Group of Hospitals in Hong Kong, was founded over the protests of Sacramento Street property owners. The Tung Wah Yi Kuk opened at **828 Sacramento Street**, a site now occupied by the Willie "Woo Woo" Wong Playground; after 1906 it moved to **14 Trenton Street**, a building 25 by 60 ft. In 1888 the Chinese Hospital Association had been refused permission to build in University Mound. **Bruce Lee was born at Chinese Hospital on 27 November 1940.** Operates the Chinese Community Health Plan; staff serve in English, Mandarin, Cantonese and Taishanese. — `https://en.wikipedia.org/wiki/San_Francisco_Chinese_Hospital` (aggregator).
- **DO NOT PUBLISH:** "the only Chinese hospital in the United States", the article's own lead. Ranking, and it trips `@superlative_patterns` on "the only".
- Zone: **Chinatown — DataSF PIP** at 37.79590, −122.40840.
- Photos: []

**39. Chinese Telephone Exchange building / Bank of Canton — historic-site**
- Address: **743 Washington Street.** Parcel 743–743 Washington, `yearbuilt = 1909`, CEQA A, reason *"National Register Historic District, California Register Historic District, Historic Survey Result"* — `3tsw-4idn`. **Read §3.4 before repeating that reason string as an NRHP listing.**
- What/when: *"This was formerly the Chinese Telephone Exchange. The exchange was closed in 1949, when technology changed from switchboard-operator system to rotary-dial telephones. The Bank of Canton bought and restored the building in 1960."* — `http://www.sanfranciscochinatown.com/attractions/index.html`. **This is a commercial neighbourhood-promotion site, i.e. an aggregator of unknown editorial standard, and the English is loose.** Wikipedia has no article at "Chinese Telephone Exchange". A writer must find a better source before shipping the 1949 and 1960 dates; the 1909 build year from SF Planning is solid on its own.
- **This is one of the three best-known buildings in Chinatown and I could not source it properly.** Flagged as a research gap, not as a rejection.
- Zone: **Chinatown — DataSF PIP** at 37.79511, −122.40592.
- Photos: []

**40. Chinatown Alleyway Tours — attraction**
- What it is, from its own site: *"Our non-profit, youth-run, youth-led program Chinatown Alleyway Tours (CATs) is now open to the public for in person tours at Chinatown… we will take you off the main streets and into the alleyways to learn about the daily life, rich history, and modern-day issues of San Francisco's Chinatown."* Groups of ten or more are asked to email rather than book online. — `https://www.chinatownalleywaytours.org/`.
- **No address, no meeting point, no price and no schedule captured** — the site's booking flow is behind a "BOOK NOW" button I did not follow. A tour with no stated meeting point is hard to write honestly. Flagged.
- Kind: the schema has no `tour` kind; this would have to be `attraction`.
- Photos: []

**41. Chinatown YMCA — historic-site**
- **855 Sacramento Street has no parcel row in `3tsw-4idn`**, and OSM has no node. I could not establish an address. **Weak; drop unless someone sources it.**
- Photos: []

**42. Far East Cafe — restaurant — DESIGNATION TRAP**
- Address: **631–645 Grant Avenue** — OSM `amenity = restaurant`, `cuisine = seafood`, `addr:housenumber = 631`. Parcel 631–645 Grant, `yearbuilt = 1908`, CEQA A.
- **It appears in the Article 10 landmarks dataset with `landmarkno = "0"` and `yeardesignated = "0.0"` and no designation document**, and its parcel CEQA reason begins *"Article 10 Individual Landmark **Work Program**"* — i.e. it is a candidate on SF Planning's designation work programme and **is not a designated landmark.** `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000` and `https://data.sfgov.org/resource/3tsw-4idn.json`. Forty other records in that dataset carry `landmarkno = 0` the same way (Glide Memorial Church, Fillmore Auditorium, the Peace Pagoda, Momo's 440 Club and others).
- **A writer who reads the landmarks dataset and does not check `landmarkno` will publish "Far East Cafe is a San Francisco landmark" and it will be false.** This is the single most likely factual error in the Chinatown file. Flagged loudly.
- Photos: []

---

## 7. Parks and squares

**43. Portsmouth Square (花園角) — park — CLOSED TO THE PUBLIC UNTIL MID-2028**
- Address, **conflicting**: SF Rec & Park's project page says **733 Kearny Street, between Clay Street and Washington Street**; SF Rec & Park's own property dataset says **745 Kearny St**; Wikipedia says it is bounded by Kearny east, Washington north, Clay south and Walter Lum Place west. — `https://sfrecpark.org/1166/Portsmouth-Square-Improvement-Project`; `https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=1000`; `https://en.wikipedia.org/wiki/Portsmouth_Square`. **Two City sources, two numbers. Do not publish a street number until one is chosen.**
- Size: **1.484 acres / 64,627 sq ft** per Rec & Park property 141; Wikipedia says 1.5 acres. Consistent.
- **CLOSURE — the most important operational fact in this whole file.** Rec & Park's project page carries a standing advisory: *"Portsmouth Square is now closed for renovation through mid-2028."* Schedule on the same page: **Planning 2017, Design 2020, Construction begins 10 June 2026, Open to the Public mid-2028.** Construction updates on the same page record that **demolition of the pedestrian bridge over Kearny Street was fully completed on 14 August 2026**, and that sewer replacement under Walter U. Lum Place was to begin in October 2026 for up to four weeks. Swinerton Builders is the contractor. — `https://sfrecpark.org/1166/Portsmouth-Square-Improvement-Project`.
- What the renovation will bring, same source: a large flexible outdoor event space with an elevated stage; a new 8,500 sq ft community clubhouse with assembly area and meeting rooms; a large shade structure; a consolidated playground with adult fitness equipment; removal of the Kearny Street pedestrian bridge. Funded from the 2020 Health and Recovery Bond, Transit Center impact fees and Community Facilities District funding, state grants secured by Assemblymember Phil Ting and State Senator Scott Wiener, the Downtown Park Fund and Sustainable Chinatown.
- **Designation, and it is the one Chinatown place with a state one:** **California Historical Landmark "PORTSMOUTH PLAZA", plaque number 119, listed 29 March 1933** — `https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38`. **Same CHL citation warning as record 19 — the gate will not accept the CHL number alone.** SF Rec & Park separately states the park *"is eligible for listing in the California Register of Historic Resources for its role as an important cultural space for the Chinatown community"* — same project page. Eligible, not listed.
- History, from Rec & Park's own project page (a City source, better than Wikipedia here): the plaza was platted circa 1835 for the Yerba Buena settlement; renamed after the USS *Portsmouth* in 1846; the site of the 1848 declaration, the 1849 proclamation of the discovery of gold, California's first public school, the first City Hall, and a refugee camp after the 1906 earthquake and fire. Wikipedia adds: a public gathering site from 1833, set aside as an official plaza in 1835; surveyed by Jean Jacques Vioget in 1839; a Mexican custom house at the northwest corner in 1844; **Captain John Berrien Montgomery of the USS *Portsmouth* landed with 17 men and raised the flag near the custom house on 9 July 1846**; Sam Brannan announced the gold discovery on **11 May 1848**. — `https://en.wikipedia.org/wiki/Portsmouth_Square`.
- **DO NOT PUBLISH:** Wikipedia's "Portsmouth Square is the first park in San Francisco, predating both Washington Square (1847) and Union Square (1850)" and Rec & Park's "the city's earliest public square" and "one of San Francisco's most significant historic, cultural, and civic spaces". All three are rankings; the first trips `@superlative_patterns` directly on "first park in San Francisco". The **dated events** publish; the ranking does not.
- The park sits above the **Portsmouth Square Plaza Garage, 733 Kearny St**, open 24 hours — `https://www.goldengatefortunecookies.com/visit` (the fortune cookie factory's parking list, an operator citing a third party — weak; find the garage's own source).
- Zone: **Chinatown — DataSF PIP** at 37.79493, −122.40546, and `analysis_neighborhood = mons_neighborhood = planning_neighborhood = Chinatown` in `gtr9-ntp6`. **Uncontested.**
- Photos: [] — and see §8; the square's monuments are the copyright problem.

**44. St Mary's Square — park — STRADDLER**
- Address: **633 California Street** per Rec & Park property 136; OSM separately carries "St. Mary's Square" as a **building** at 500 Pine Street with `website = hellermanus.com/500_Pine_Street.html`, which is the **rooftop extension**, not the original park. Two distinct things sharing a name.
- Size: **1.441 acres / 62,790 sq ft** — `gtr9-ntp6`.
- What/when: **designed in 1957 by Robert Royston**, a rooftop park on the top level of a parking garage; grids and multiple tones of concrete, low seat walls, curved planting beds, a wide concrete staircase at one end and an at-grade entrance at the other; an existing row of poplars retained as a backdrop. — `https://en.wikipedia.org/wiki/Saint_Mary%27s_Square_(San_Francisco)` (aggregator; the article's prose is poor and partly uncapitalised, which is a quality signal).
- The **extension**: the Planning Commission approved a 4½-storey office building at 500 Pine on **15 March 2001** and a 19-storey building at 350 Bush on **1 November 2001**, both conditioned on the sponsor building a **6,127 sq ft extension of St Mary's Square on the roof of 500 Pine** — `https://sfrecpark.org/602/500-Pine-Street---St-Marys-Square-Extens`.
- Zone: **STRADDLER — and DataSF contradicts itself, see §3.2.** **Arbitrator.**
- Photos: [] — three copyright-live artworks, §8.

**45. Willie "Woo Woo" Wong Playground — park**
- **ADDRESS CONFLICT, flagged.** Rec & Park's project page: *"Willie Woo Woo Wong Playground is located at **830 Sacramento Street** between Waverly Place and Pagoda Place in Chinatown"* — `https://sfrecpark.org/1175/Willie-Woo-Woo-Wong-Playground-Improveme`. OSM agrees: 830 Sacramento Street, 94108, +1 415 274-0202. **Rec & Park's own property dataset says 850 Sacramento St** — `gtr9-ntp6`. Two City sources, two numbers.
- Size: **0.656 acres / 28,591 sq ft** — `gtr9-ntp6`; Rec & Park's prose says "approximately half-acre".
- What/when: **named for the Chinese American USF basketball player Willie "Woo Woo" Wong.** Two sand-floor playgrounds, tennis and volleyball courts, a clubhouse with a rooftop basketball court, on a terraced hillside site. **Hang Ah Alley lies wholly within the park boundary.** Renovated under the 2012 Clean and Safe Neighborhood Parks Bond and the Downtown Parks Fund at a **$14.5 million** budget; **completed and open to the public February 2021**, opened **12 February**. — same project page.
- Historical note: **828 Sacramento Street, the site now occupied by this park, was where the Tung Wah Yi Kuk — the ancestor of Chinese Hospital — opened in 1899** — `https://en.wikipedia.org/wiki/San_Francisco_Chinese_Hospital`. Good, sourced, and specific.
- Zone: **Chinatown** on three of four `gtr9-ntp6` attributions.
- Photos: []

**46. Woh Hei Yuen Park and Recreation Center (和喜園) — park — STRADDLER**
- Address: **922 Jackson Street**, ZIP 94133 — `gtr9-ntp6` and OSM.
- Size: **0.356 acres / 15,513 sq ft**, property type "Mini Park" — `gtr9-ntp6`.
- Zone: **STRADDLER, Chinatown ↔ Nob Hill.** `analysis_neighborhood = Chinatown` but `mons_neighborhood`, `planning_neighborhood` and `realtor_neighborhood` all say **Nob Hill**. Three to one against Chinatown. **Arbitrator.**
- Carries public art at Powell & John Street — §8.
- Photos: []

---

## 8. Monuments, public art and the photo problem

**17 USC 120(a) covers buildings and not sculptures or murals.** Every item here is an artwork with a
named artist, so the photo wave needs a death year before any of them can be *featured* in a frame.
Source for the whole section unless stated: the City's **Civic Art Collection** dataset,
`https://data.sfgov.org/resource/r7bn-7v9c.json?$limit=2000`, which carries artist, display title,
creation date, street intersection, accession number and analysis neighborhood.

| # | Work | Artist | Date (Civic Art) | Location | Accession | Copyright status |
|---|---|---|---|---|---|---|
| **47** | Goddess of Democracy (民主女神像) | Thomas Marsh | 1990 | Clay & Kearny (Portsmouth Square) | 1990.9 | **artist living — BLOCKED** |
| **48** | Robert Louis Stevenson (1850–1894) Memorial | Bruce Porter | 1894 | Walter Lum Place & Washington | 1897.2 | pre-1929, public domain |
| **49** | Sun Yat-Sen | Beniamino Bufano | 1936 | 651 California St (St Mary's Square) | — | **Bufano d. 1970; a 1936/37 sculpture is still in term — BLOCKED** |
| **50** | Comfort Women's Column of Strength | Steven Whyte | 2017 | 651 California St (St Mary's Square) | — | **artist living — BLOCKED** |
| **51** | Take Root (nine lamps and copper panels) | Rene Yung | 1996 | 1135 Powell St (the library) | 1996.7.a–i | **artist living — BLOCKED** |
| **52** | Zodiac animals: Dragon, Serpent, Ram, Rabbit, Tiger, Monkey | Mary Fuller (McChesney) | 1984 | Clay & Kearny (Portsmouth Square) | 1985.14.1-6 | **Fuller d. 2022 — BLOCKED** |
| **53** | Serpent Wall, Lions and fifteen bench supports (Rat, Ox, Tiger, Hare, Dragon, Serpent, Horse, Ram, Monkey, Rooster, Dog, Pig) | Mary Fuller (McChesney) | 1999 | Clay & Kearny (Portsmouth Square) | 1999.19.1-15 | **BLOCKED** |
| **54** | Tectonic Melange | Lampo Leong | 1999 | John & Powell (Woh Hei Yuen) | 1999.18 | **artist living — BLOCKED** |
| **55** | Five Carved Stones (Moon Face ×2, Peach ×2, Persimmon) | Marcia Donahue | 1994 | Powell & John (Woh Hei Yuen) | 1999.20.a-e | **artist living — BLOCKED** |
| **56** | Language of the Birds | Brian Goggin and Dorka Keehn | 2008 | Columbus Ave & Broadway | T2009.1 | **artists living — BLOCKED; also a Chinatown/North Beach straddler** |
| **57** | Auspicious Clouds \| Heavy Fog (seven parts) | Michael Arcega | n.d. | 618–840 Broadway | 2018.4.a–g | **artist living — BLOCKED** |
| **58** | Photos of People from the Neighborhood Enlarged; Stenciled Fortunes | Jon Rubin and Harrell Fletcher | 2002 | 735 Vallejo St | 2002.2.1.a–k, 2002.2.2 | **artists living — BLOCKED** |

**Date conflicts on the Goddess of Democracy, flagged three ways.** Civic Art gives `creation_date =
1990`; OSM gives `start_date = 1994-06-04`; Wikidata `Q40733116` gives inception 1989. Wikipedia says
only that it is a replica of the statue made during the Tiananmen Square protests of 1989 and that
it stands in Portsmouth Square — `https://en.wikipedia.org/wiki/Goddess_of_Democracy_(San_Francisco)`.
**Do not publish a year.**

**Sun Yat-sen statue, date conflict:** Civic Art says 1936; Wikipedia says **erected in St Mary's
Square in 1937**, 14 feet, red granite and stainless steel, with an inscription beginning *"Dr. Sun
Yat Sen 1866-1925 Father of the Chinese Republic…"* — `https://en.wikipedia.org/wiki/Statue_of_Sun_Yat-sen_(San_Francisco)`
and `https://en.wikipedia.org/wiki/Saint_Mary%27s_Square_(San_Francisco)`. Note the second article
misspells the sculptor "Benny Bufano"; Civic Art's "Bufano, Beniamino" is authoritative.

**Robert Louis Stevenson Memorial, attribution conflict:** Civic Art credits **Bruce Porter**;
Wikipedia says the project was brought to the Board of Supervisors by **Willis Polk (architect),
Bruce Porter (artist) and Douglas Tilden (sculptor)**, was initially rejected, and was then
simplified and privately funded — `https://en.wikipedia.org/wiki/Robert_Louis_Stevenson_Memorial`.
Both can be true. **DO NOT PUBLISH** Wikipedia's "where Stevenson had lived just around the corner"
— `just around the corner` is on the proximity blocklist verbatim.

**59. Rose Pak Memorial Tree (白蘭紀念樹) — STRADDLER.** OSM `historic = memorial`, `start_date = 2017`,
in St Mary's Square, DataSF PIP → Financial District/South Beach. A tree, not a copyrightable work.

**60. Historic Asian Memorials at St Mary's Square** — two OSM `tourism = information` nodes with
that name and no further tags. Unresolved; someone should find what they are.

**61. Ping Yuen Mural** — an OSM `tourism = artwork` node with no artist and no date. Wikipedia says
"Some of the largest murals in Chinatown are painted on Ping Yuen" — **a ranking, do not publish** —
`https://en.wikipedia.org/wiki/Ping_Yuen`. **Artist unknown, so BLOCKED for photography by default.**

**62. Chinatown–Rose Pak station artworks** — three installed works, all by living artists and all
**BLOCKED**: *Yang Ge Dance of Northeast China* by **Yumei Hou**, two laser-cut red-painted metal
panels based on Chinese paper cutting, one 16 × 37 ft in the mezzanine landing and one 30 × 35 ft in
the ticketing hall; *Urban Archaeology* by **Tomie Arai**, a 100 ft architectural-glass mural on the
headhouse wall varying between 4 and 9 ft in height; *A Sense of Community* by **Clare Rojas**, a
tile mural in a Cathedral Quilting pattern, a semicircle of about 35 × 14½ ft on the mezzanine cavern
wall. Plus a couplet by **Carin Mui (黃立慈)**, winner of a 2016 Chinatown Community Development Center
contest, printed in calligraphy on red opaque glass at the station plaza: 昔日漂洋採金礦，今朝劈地鋳銀龍 —
"In the past we traveled across the Pacific to mine for gold; Now, we break through earth to form a
silver dragon." — `https://en.wikipedia.org/wiki/Chinatown_station_(Muni_Metro)` (aggregator).

---

## 9. Transport

**63. Chinatown–Rose Pak station (華埠-白蘭站) — attraction**
- Location: **under Stockton Street at Washington Street.** OSM `start_date = 2022-11-19`; Wikidata `Q16957763`.
- What/when: an underground Muni Metro light-rail station, **opened 19 November 2022** as part of the Central Subway. Officially named for **Rose Pak**, the Chinatown political activist who helped secure support and funding for the station and the T Third Street extension. **Designed by Kwan Henmi, now DLR Group.** Retail space at ground level and a rooftop patio; the structure extends **100 feet below ground**; a **5,400 sq ft** public plaza on its roof. Also served by Muni routes 1, 8, 30 and 45, the 8AX and 8BX peak expresses, and the T Bus and 91 Owl. The Powell–Hyde and Powell–Mason cable car lines stop at Powell and Washington, one block west. — `https://en.wikipedia.org/wiki/Chinatown_station_(Muni_Metro)` (aggregator).
- Construction history worth a sentence, same source: the building at **933–949 Stockton**, housing 56 low-income residents, was acquired by eminent domain and demolished for the station; residents were relocated to a new building at Broadway and Sansome with $8 million from the SFMTA among other grants. Stockton stayed open throughout construction from 2013; a half-block of Washington Street was closed.
- **DO NOT PUBLISH:** "required the deepest building excavation in the City of San Francisco", "only the fifth open space park in the Chinatown neighborhood", and John King's "the best architectural experience, bottom to top". All rankings, the third an attributed one — and attributed rankings are banned too.
- Zone: **Chinatown — DataSF PIP.**
- Photos: [] — the station's three artworks are blocked, §8 record 62.

**64. California Street cable car line at Grant Avenue — attraction — STRADDLER**
- The **San Francisco Cable Cars are a National Historic Landmark, NRHP reference number 66000233**, certified **15 October 1966**, address given as 1390 Washington St — NPS ArcGIS polygon layer, `https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/1/query`. SF Planning separately carries a "San Francisco Cable Car Historic District", `cr = Listed`, `nr = Listed` — `https://data.sfgov.org/resource/63x5-g3m4.json?$limit=500`.
- **The whole system is one designation across at least four zones** — Nob Hill (the Cable Car Museum and powerhouse, San Francisco Landmark No. 43, 1201 Mason Street, designated 1971), Union Square (the Powell and Market turntable), Fisherman's Wharf and Chinatown. **Arbitrator, and it may belong to none of them.** Chinatown's honest claim is only that the California Street line crosses Grant Avenue.
- Photos: []

---

## 10. Eating, drinking and shopping

Every hours block below was read on the date at the head of this file. **A founding year taken from
an operator's own site is a trading-duration claim and does not publish** — I record them so the
verifier can catch a writer who lifts one, and each is marked.

**65. Mister Jiu's — restaurant**
- **28 Waverly Place, San Francisco, CA 94108.** Hours: **Tue–Thu 5 p.m.–9 p.m.; Fri & Sat 5 p.m.–9:30 p.m.; Sun & Mon closed.** Reservations online only — "We are not able to accept reservations by phone or email." — `https://www.misterjius.com/`. OSM corroborates 28 Waverly Place, 94108.
- Its own site names an upstairs room, **Moongate Lounge**, available for seated dinners and standing receptions, and the ground floor for seated dinners.
- **DO NOT PUBLISH** the Michelin Guide quotation the restaurant reproduces on its own homepage — *"undoubtedly one of the city's most well-appointed dining halls"* — it is an attributed ranking and trips `@superlative_patterns` on "one of the most".
- **28 Waverly Place has no row in `3tsw-4idn`**, so no independent build year.
- Zone: **Chinatown.**
- Photos: []

**66. R&G Lounge — restaurant**
- **631 Kearny Street, San Francisco, CA 94108**; +1 415 982-7877; hours per OSM `Su-Th 11:00-21:00; Fr-Sa 11:00-21:30`; `https://www.rnglounge.com/`. Parcels 630–632 Kearny (1908) and 631–633 Kearny (1910), both CEQA A — `3tsw-4idn`.
- Its own site says "serving our patrons since 1985" and "winning numerous awards" — **neither publishes**: the first is a trading-duration claim from the operator, the second an unnamed award.
- Zone: **Chinatown — DataSF PIP** at 37.79410, −122.40490 (Nominatim, one of the ten that answered).
- Photos: []

**67. Z & Y Restaurant — restaurant**
- **655 Jackson Street**; `https://www.zandyrestaurant.com/`; OSM `cuisine = chinese`. Parcel 655–657 Jackson, `yearbuilt = 1907`, CEQA A. **No hours captured.**
- Zone: **Chinatown — DataSF PIP** at 37.79601, −122.40605.
- Photos: []

**68. Great Eastern Restaurant — restaurant**
- **649 Jackson Street**; hours per OSM `We-Mo 10:00-21:00`; `http://www.greateasternsf.com`. Parcel 647–649 Jackson, `yearbuilt = 1908`, CEQA A.
- Zone: **Chinatown — DataSF PIP** at 37.79603, −122.40595.
- Photos: []

**69. House of Nanking — restaurant**
- **919 Kearny Street**; hours per OSM `Mo-Fr 11:00-21:00; Sa-Su 12:00-21:00`; `https://www.houseofnankingsf.com/`. **No parcel row at 919 Kearny in `3tsw-4idn`.**
- Zone: **Chinatown — DataSF PIP** at 37.79651, −122.40536.
- Photos: []

**70. Hang Ah Tea Room — restaurant**
- **1 Pagoda Place, San Francisco, CA 94108**; +1 415 982-5686; hours per OSM `Mo-Su 10:30-20:30`; `hangahtearoom.com`. **The domain does not resolve from here**, so the hours are OSM's and unverified against the operator. Parcel 1–1 Pagoda Place, `yearbuilt = 1911`, CEQA A — `3tsw-4idn`.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**71. Sam Wo (三和粥粉麵) — restaurant**
- **713 Clay Street, San Francisco, CA 94108**; hours per OSM `We-Sa 11:00-20:00; Su-Mo 11:00-18:00`; `https://samworestaurant.com`. Parcel 713–721 Clay, `yearbuilt = 1912`, CEQA A — `3tsw-4idn`.
- What/when: the earlier restaurant at **813 Washington Street** closed **2012** for safety reasons; the business **reopened on Clay Street in 2015**; it **closed briefly in 2025 and reopened the same year under new management**. Famous in the 1960s as the workplace of **Edsel Ford Fung**, who died in 1984; some of his signs from the Washington Street room survive. A Beat Generation hangout in the 1950s. — `https://en.wikipedia.org/wiki/Sam_Wo` (aggregator; the article itself says "There is no documented history on Sam Wo Restaurant and its early beginnings from its founding in 1912").
- **DO NOT PUBLISH:** "the oldest restaurant in Chinatown", "world's rudest waiter", "world's rudest, worst, most insulting waiter". All rankings. **And do not publish 1912 as a founding year** — the article's own text says one account gives 1907 and that nothing is documented.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**72. Good Mong Kok Bakery — cafe or shop**
- **1039 Stockton Street, San Francisco, CA 94108**; +1 415 397-2688; hours per OSM `Mo-Su 07:00-18:00`; `https://goodmongkokbakery.com/`. **No parcel row at 1039 Stockton.**
- Zone: **Chinatown — DataSF PIP** at 37.79545, −122.40834 (Nominatim, one of the ten that answered — and see §3.7, its `address.neighbourhood` field says "South of Market").
- Photos: []

**73. Golden Gate Bakery — cafe or shop**
- **1029 Grant Avenue.** Parcel 1019–1029 Grant, `yearbuilt = 1924`, CEQA A. OSM has the name and `shop = bakery` and **no address, no hours, no website**.
- **Known for closing without notice for long stretches.** With no operator source at all, a guide can honestly give the address and nothing else. **Weak — and one of the three candidates I am least confident about.**
- Photos: []

**74. Eastern Bakery (東亞餅食公司) — cafe or shop**
- **720 Grant Avenue**; hours per OSM `11:00-16:00` (no day specification, i.e. incomplete); `shop = bakery`. Parcel 700–720 Grant, `yearbuilt = 1906`, CEQA A.
- Its Commercial Street side entrance is **Sullivan's Grotto at 776 Commercial Street**, a location in the 1950 film *Woman on the Run* directed by Norman Foster — `https://en.wikipedia.org/wiki/Commercial_Street_(San_Francisco)`. **Two doors, two streets — a nice, sourced, physically-true detail that is not orientation by impression.**
- Photos: []

**75. Empress by Boon, in the Empress of China building — restaurant**
- **838 Grant Avenue.** OSM still carries the node as "Empress of China", `amenity = restaurant`. **SF Planning gives 838–838 Grant `yearbuilt = 1966`** and the adjoining 829–843 Grant `yearbuilt = 1908`, both CEQA A — `3tsw-4idn`. The 1966 date is the Empress of China's own building.
- **I found no operator source.** Wikipedia has no article. The name change from Empress of China to Empress by Boon is not sourced here. **Weak; a writer must fetch the restaurant's own site.**
- Photos: []

**76. China Live — restaurant — STRADDLER**
- **644 Broadway, San Francisco, CA 94133**; +1 415 788-8188; `https://chinalivesf.com/`. **No hours captured** — the site's contact page is behind a nav I did not resolve.
- Zone: **STRADDLER, Chinatown ↔ North Beach.** DataSF PIP at 37.79791, −122.40788 → Chinatown; Nominatim's own address block calls it **Telegraph Hill**; Broadway is the conventional northern edge of Chinatown, which puts a Broadway address on the line. **Arbitrator.**
- Photos: []

**77. Li Po Cocktail Lounge — restaurant (the schema has no `bar` kind)**
- **916 Grant Avenue**; +1 415 982-0072; hours per OSM `Mo-Su 14:00-25:30` (i.e. to 1:30 a.m.); `https://lipolounge.com/`; OSM `start_date = 1937`. Parcel 900–916 Grant, `yearbuilt = 1908`, CEQA A.
- **The 1937 date is an OSM tag with no cited source.** Do not publish it.
- **Kind problem, flagged for the verifier:** `Ethos.Places.Place.kinds/0` has no `bar`. Li Po, Bow Bow and Buddha Lounge would each have to ship as `restaurant` or not at all.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**78. Bow Bow Cocktails — restaurant**
- OSM `amenity = bar`, name only, **no address, no hours, no website.** Parcel evidence unavailable without a number. **Weak.**
- Photos: []

**79. Buddha Lounge — restaurant**
- OSM carries a bar simply named "Buddha" with no address. Conventionally 901 Grant Avenue; **unsourced.** **Weak.**
- Photos: []

**80. Four Kings — restaurant**
- Named in current Chinatown restaurant coverage; **Nominatim returned nothing and OSM has no node**, so I have no address at all. **Weak — recorded so the verifier knows it was looked for and not found.**
- Photos: []

**81. Golden Gate Fortune Cookie Factory (金門餅食公司) — shop**
- **56 Ross Alley, San Francisco, CA 94133**, main entrance off Ross Alley between Jackson and Washington. Phone +1 415 781-3956; custom orders +1 415 806-8243. — the factory's own contact page, `https://www.goldengatefortunecookies.com/contact`, and OSM.
- **HOURS CONFLICT INSIDE ONE PAGE.** That contact page states, in one block, *"Hours: Mon – Sun, 9 am – 7 pm. Winter Hours: Mon – Sun, 9 am – 6:30 pm"*, and immediately below, in a second block, a day-by-day list reading 9 a.m.–6 p.m. for every day of the week (with two days typoed as "6::00pm"). **The operator's own site disagrees with itself. Do not publish hours until someone chooses, and say so to the verifier rather than picking silently.**
- **ZIP CODE CONFLICT INSIDE THE SAME PAGE:** "San Francisco, CA 94113" in one block and "San Francisco, CA, 94133" in the other. **94113 is not a San Francisco ZIP.** Publish 94133 or nothing.
- What it does, from its own site: cookies made from scratch and assembled in-store; chocolate, strawberry and green-tea flavours; custom fortunes for in-store pick-up; *"We make up to 10,000 fortune cookies a day, baked fresh on a cast iron rotating griddle wheel."* Wikipedia adds a charge of **50 cents for photographs of the workers and the factory interior**, boxes at $17 and bags of flat cookies at $10, and gives the owner as Franklin Yee — `https://en.wikipedia.org/wiki/Golden_Gate_Fortune_Cookie_Company` (aggregator; prices there are undated and should not be published).
- **DO NOT PUBLISH:** the site's own strapline "Handmade In San Francisco Since 1962" and Wikipedia's "The cookie company was opened in 1962". **A founding year from an operator's own site is a trading-duration claim.** The 10,000-a-day figure is a *measurement* and publishes.
- **The 50-cent photography charge is a fact about the place and publishes** — and it also tells the photo wave that interior photographs here are commercially conditioned, whatever 17 USC 120(a) says about the building.
- Zone: **Chinatown — DataSF PIP** at 37.79531, −122.40706.
- Photos: []

**82. The Wok Shop — shop**
- **718 Grant Avenue, San Francisco, CA 94108**; +1 415 989-3797; hours per OSM `Mo-Su 10:00-18:00`; `https://www.wokshop.com/`. Parcel 700–720 Grant, `yearbuilt = 1906`, CEQA A.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**83. Chinatown Kite Shop — shop**
- **717 Grant Avenue** — OSM node "Chinatown Kites", `shop = kites`. Parcel 715–717 Grant, `yearbuilt = 1907`, CEQA A. **No hours, no website captured.**
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**84. Red Blossom Tea Company — shop**
- **831 Grant Avenue**; +1 415 395-0868; `https://redblossomtea.com/`; OSM `shop = tea`. Parcel 829–843 Grant, `yearbuilt = 1908`, CEQA A. **No hours captured.**
- Zone: **Chinatown — DataSF PIP** at 37.79468, −122.40650 (Nominatim, answered).
- Photos: []

**85. Vital Tea Leaf — shop**
- Grant Avenue; +1 415 981-9322; `https://vitaltealeaf.net/`; OSM `shop = tea` with **no street number.** Nominatim placed it at 37.79530, −122.40662. **No confirmed address. Weak.**
- Photos: []

**86. Ten Ren Tea — shop**
- **949 Grant Avenue.** Parcel 949–951 Grant, `yearbuilt = 1907`, CEQA A. **No OSM node with tags, no hours, no website captured. Weak.**
- Photos: []

**87. New Asia Market — shop**
- **772 Pacific Avenue, San Francisco, CA 94133** — OSM `shop = supermarket`. **No hours, no website.**
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

---

## 11. Housing, hotels and buildings

**88. Ping Yuen and North Ping Yuen (平園, "the Pings") — historic-site**
- Addresses, from OSM: **West Ping Yuen 895 Pacific Avenue**; **Central Ping Yuen 711/795/799 Pacific Avenue**; **East Ping Yuen 655 Pacific Avenue (東平園)**; **North Ping Yuen** with a 94133 postcode and no number. All ZIP 94133.
- What/when: a four-building public housing complex along Pacific Avenue, **434 apartments in total.** The three on the south side of Pacific — West, Central and East — were **dedicated 1951**; North Ping Yuen followed in **1961**. The formal effort began in **1939**. Unlike the single-room-occupancy housing typical of Chinatown, each apartment had its own bathroom and kitchen from the first building's opening in 1951. The murder of Julia Wong in 1978 prompted a residents' rent strike, led by the future mayor **Ed Lee**, over maintenance and security. **Ownership passed from the city to the Chinatown Community Development Center in 2016.** — `https://en.wikipedia.org/wiki/Ping_Yuen` (aggregator).
- **DO NOT PUBLISH:** "Some of the largest murals in Chinatown are painted on Ping Yuen", "it was the first public housing project completed in the neighborhood", and the 1939 quotation calling Chinatown "the worst [slum] in the world". Two rankings and one slur.
- **It is occupied housing.** A guide writes about it from the street.
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**89. Hilton San Francisco Financial District — hotel — STRADDLER**
- **750 Kearny Street, San Francisco, CA 94108**; +1 415 433-6600 — OSM `tourism = hotel`, `building = hotel`; Wikidata `Q14682267`. SF Planning parcel 750–750 Kearny, `yearbuilt = 1970`, CEQA A, reason *"Manual change by Planning staff"* — `3tsw-4idn`.
- What/when: **opened 1971**, originally the Holiday Inn Financial District and often called the Holiday Inn Chinatown, on the site of the San Francisco Hall of Justice, SFPD headquarters until 1961. The Chinese Culture Center leases about 20,000 sq ft inside it for rotating exhibitions at nominal cost. Before the Hall of Justice the site held the Jenny Lind Theatre, destroyed by fire in May and June 1851 and rebuilt, and then, from 1852, the city's first City Hall — **for which the site is California Historical Landmark no. 192.** The Hall of Justice and Morgue cornerstone was laid December 1896 and the building completed September 1900. — `https://en.wikipedia.org/wiki/Hilton_San_Francisco_Financial_District` (aggregator).
- **CHL 192 does not satisfy the gate's `@designation_citation`.** See the warning at record 19.
- Zone: **STRADDLER by its own name.** DataSF PIP → Chinatown; the hotel calls itself Financial District; Wikipedia calls the site "on the border between the Financial District and Chinatown". **Arbitrator.**
- Photos: []

**90. International Hotel / Manilatown Center — historic-site — STRADDLER**
- **868 Kearny Street** — OSM node "International Hotel Manilatown Center", `addr:housenumber = 868`.
- What/when: the I-Hotel was a low-income single-room-occupancy hotel in **Manilatown**, home to a large Filipino American population; from about 1954 its basement housed Enrico Banducci's original "hungry i". **All tenants were evicted on 4 August 1977 and the hotel was demolished in 1981.** The site was bought by International Hotel Senior Housing Inc., rebuilt, and **opened in 2005**; it now shares space with St Mary's School and the Manilatown Center. Established as a hotel for travellers in 1854, relocated to Kearny Street in 1873, rebuilt in 1907 after the 1906 earthquake and fire. — `https://en.wikipedia.org/wiki/International_Hotel_(San_Francisco)` (aggregator).
- Zone: **STRADDLER, Chinatown ↔ Financial District ↔ Manilatown.** DataSF PIP → Chinatown; **Manilatown is not one of the twenty rostered zones**, so a real neighbourhood identity has nowhere to go. **Arbitrator, and worth a note in the roster.**
- Photos: []

**91. Sing Chong Building — historic-site**
- **616 Grant Avenue**, at California Street. SF Planning gives 616–616 Grant `yearbuilt = 1900` and the adjoining 615–625 Grant `yearbuilt = 1907`, both CEQA A — `3tsw-4idn`. **The 1900 date is almost certainly a data artefact** — the corner burned in 1906 — and `sanfranciscochinatown.com` says *"This was one of the first places rebuilt after the 1906 eathquake"* (their typo). **Do not publish 1900. Do not publish "one of the first" either — it is a ranking.**
- Zone: **Chinatown — DataSF PIP.**
- Photos: []

**92. Sing Fat Building — historic-site**
- The companion corner at Grant and California, named alongside Sing Chong in `https://en.wikipedia.org/wiki/Dragon_Gate_(San_Francisco)` as "the older Sing Fat and Sing Chong buildings (at Grant and California)". **601 Grant Avenue has no parcel row in `3tsw-4idn`** and OSM has no node. **I could not establish its address. Weak.**
- Photos: []

**93. Golden Dragon Restaurant site, 822 Washington Street — historic-site**
- The restaurant was the scene of a mass shooting on **4 September 1977** in which five people died and eleven were injured, none of them gang members; seven perpetrators were convicted. **The restaurant closed in 2006.** — `https://en.wikipedia.org/wiki/Golden_Dragon_massacre` (aggregator).
- **Recorded because a Chinatown guide has to decide about it, not because it should ship.** The place no longer exists; writing a murder site as a travel entry is an editorial call well above a finder's pay grade. **Flagged for the verifier, recommended against.**
- Photos: []

**94. Portsmouth Square Pedestrian Bridge (Dr Rolland and Kathryn Lowe Community Bridge; "China Banks") — DEMOLISHED, DO NOT PUBLISH AS EXISTING**
- It spanned Kearny Street from Portsmouth Square to the second and third floors of the Hilton. Approved 1970, built 1970–71, **opened 1971** as a privately owned public space, air rights held by Justice Investors. A community room connected to its underside on the west opened to the public in 2001. Its brutalist banked sides made it a continuously used street-skateboarding spot from the late 1970s, known as **China Banks**. **Demolished in August 2026** as part of the Portsmouth Square renovation. — `https://en.wikipedia.org/wiki/Portsmouth_Square_pedestrian_bridge`; the demolition completion date of **14 August 2026** is confirmed by SF Rec & Park's own construction update, `https://sfrecpark.org/1166/Portsmouth-Square-Improvement-Project`.
- **This is the second landmine in the Chinatown file.** Every guidebook and half the web still describes the bridge as standing. **It does not exist.** Flagged loudly.
- Photos: []

**95. Norras Temple — historic-site**
- Conventionally 109 Waverly Place. Parcel 109–115 Waverly Place, `yearbuilt = 1907`, CEQA A — `3tsw-4idn`. **No Wikipedia article, no OSM node, no operator site, and the address is a guidebook convention I could not corroborate.** **Weak — one of the three I am least confident about.**
- Photos: []

---

## 12. Places inside DataSF's Chinatown that are almost certainly somebody else's

All of these test **inside** the analysis-neighborhood polygon and none of them is Chinatown to a
reader. Listed with their designation identifiers so the zone that does claim them does not have to
re-find them. **All arbitrator.**

**96. Jackson Square Historic District** — **San Francisco Article 10 Landmark District, Appendix B, listed 9 August 1972** (`https://data.sfgov.org/resource/knm6-5ej6.json?$limit=100`) and **National Register reference number 71000186, listed 18 November 1971**, "roughly bounded by Broadway on N, Sansome St. on E, Washington St. on S, and Columbus Ave. on W" (NPS ArcGIS polygon layer). Period of significance 1850–1911. A "Jackson Square Historic District Extension", `cr = Eligible`, `nr = Eligible`, 1865–1920, also exists — `63x5-g3m4`. **Seventeen individual Article 10 landmarks sit inside it; §3.3 lists them.**

**97. City Lights Bookstore** — **San Francisco Landmark No. 228, 261–271 Columbus Avenue, designated 2001.** DataSF PIP → Chinatown. **The roster names it in North Beach's draw. It is North Beach's.**

**98. Sentinel Building / Columbus Tower** — **San Francisco Landmark No. 33, 916–920 Kearny Street, designated 1970.** DataSF PIP → Chinatown; reads as North Beach / Jackson Square.

**99. Met Life–Pacific Coast Head Office** — **San Francisco Landmark No. 167, 600 Stockton Street, designated 1984.** On Stockton inside SF Planning's stated Chinatown extent, but DataSF PIP → Financial District and the block reads as Union Square / Nob Hill.

**100. Four more with National Register numbers, all in the Jackson Square / Financial District overspill** — PG&E Substation J, 565 Commercial and 568 Sacramento, **NRHP 86003514**, certified 29 December 1986, and **San Francisco Landmark No. 142** (designated 1981); Federal Reserve Bank of San Francisco, 400 Sansome Street, **NRHP 89000009**, certified 31 July 1989, and **San Francisco Landmark No. 158** (1983); Colombo Building, 1–21 Columbus Ave, **NRHP 07001469**, certified 31 January 2008; NIANTIC storeship, northwest corner of Clay and Sansome, **NRHP 91000563**, certified 16 May 1991. All from `https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query` over the SF bounding box and `https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000`.

---

## 13. Designation tally

**Ten designation identifiers found inside the vernacular Chinatown quadrilateral**, of which four
are core:

| Register | Identifier | Place |
|---|---|---|
| San Francisco Article 10 | Landmark No. **2** (1968) | Old St Mary's Church |
| San Francisco Article 10 | Landmark No. **44** (1971) | Donaldina Cameron House |
| San Francisco Article 10 | Landmark No. **122** (1981) | Clay Street Center / CHSA |
| San Francisco Article 10 | Landmark No. **235** (2002) | Chinatown Branch Carnegie Library |
| San Francisco Article 10 | Landmark No. **33** (1970) | Sentinel Building — straddler |
| San Francisco Article 10 | Landmark No. **143** (1981) | Fire Station 2 — straddler |
| San Francisco Article 10 | Landmark No. **167** (1984) | Met Life, 600 Stockton — straddler |
| San Francisco Article 10 | Landmark No. **173** (1984) | Notre Dame des Victoires — straddler |
| San Francisco Article 10 | Landmark No. **228** (2001) | City Lights — North Beach's |
| San Francisco Article 10 | Landmark No. **34** (1970) | U.S. Mint & Subtreasury, 608 Commercial — straddler |

**Plus, in the wider DataSF Chinatown polygon**, twenty further Article 10 numbers (§3.3), one
Article 10 landmark **district** (Jackson Square, Appendix B, 1972), and four **NRHP reference
numbers** (86003514, 89000009, 07001469, 91000563) plus the Jackson Square district's 71000186.

**Three California Historical Landmark plaque numbers**, all in or on the edge of Chinatown, **none
of which satisfies the gate's citation regex**: Portsmouth Plaza **No. 119** (29 March 1933); Site of
Old St Mary's Church **No. 810** (30 December 1965); Site of First U.S. Branch Mint in California
**No. 87** (29 March 1933). A fourth, **No. 192** for the first City Hall / Jenny Lind Theatre site
under the Hilton, comes from Wikipedia rather than from the OHP county list and I could not confirm
it there. Source: `https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38`.

**Zero NRHP listings and zero Article 10 landmark districts in vernacular Chinatown.** The Chinatown
Historic District is **eligible** for both the National Register and the California Register and
formalised in neither. §3.4.

---

## 14. Notes for the verifier and the gate

### 14.1 Every superlative I found, in one place — none may publish
- "the oldest Chinatown in North America"; "one of the largest Chinese enclaves outside Asia"; "the oldest and largest of the four notable Chinese enclaves within San Francisco"; "drawing more visitors annually than the Golden Gate Bridge" — `Chinatown, San Francisco`
- "one of the most photographed locations in Chinatown"; "the first permanent ceremonial gate to be installed in the United States" — `Dragon Gate (San Francisco)`
- "the oldest extant Taoist temple in San Francisco's Chinatown"; "one of the oldest still-operating Chinese temples in the United States" — `Tin How Temple`; repeated as "the oldest extant Taoist temple in Chinatown" in `Ma-Tsu Temple (San Francisco)`
- "the first park in San Francisco"; "the city's earliest public square"; "one of San Francisco's most significant historic, cultural, and civic spaces" — `Portsmouth Square` and SF Rec & Park
- "the last Chinese theater in any Chinatown in the United States"; "the last active Chinese opera house in the United States"; "the best Chinese theater we have seen in just about 30 years" — `Great Star Theater`
- "the only Chinese hospital in the United States" — `San Francisco Chinese Hospital`
- "the oldest Chinese American or Asian American church in North America" — `Presbyterian Church in Chinatown`
- "the United States' oldest Asian American civil rights organization" — `Chinese American Citizens Alliance`
- "the oldest and largest archive and history center documenting the Chinese American experience" — `Chinese Historical Society of America`
- "the oldest alley in San Francisco" — `Ross Alley`
- "the oldest restaurant in Chinatown"; "world's rudest waiter" — `Sam Wo`
- "one of the oldest streets in the city's Chinatown district" — `Grant Avenue`
- "the deepest building excavation in the City of San Francisco"; "only the fifth open space park in the Chinatown neighborhood"; "the best architectural experience, bottom to top" — `Chinatown station (Muni Metro)`
- "one of only two streets in San Francisco oriented directly toward the tower of the Ferry Building" — `Commercial Street (San Francisco)`
- "some of the largest murals in Chinatown"; "the first public housing project completed in the neighborhood" — `Ping Yuen`
- "undoubtedly one of the city's most well-appointed dining halls" — Michelin, quoted on `misterjius.com`
- "one of the first places rebuilt after the 1906 e[a]rthquake" — `sanfranciscochinatown.com` on Sing Chong
- "In 2017, San Francisco became the first city where every resident lives within a 10-minute walk of a park" — the boilerplate footer on **every** sfrecpark.org page. **A writer copying park text will lift this by accident.**

### 14.2 Proximity-ban tripwires already present in my sources
- "just around the corner" — `Robert Louis Stevenson Memorial`, verbatim on the blocklist.
- "one block west of the station", "two blocks north of it", "one block apart from each other" — these are **counted blocks**, which are measurements, and my reading is that they publish. `@proximity_patterns` does not match them. Flagged so the verifier rules deliberately rather than by accident.

### 14.3 Gate limitations this zone exposes
1. **California Historical Landmark numbers fail `@designation_citation`.** Chinatown's oldest designations are CHLs (Portsmouth Plaza 119, 1933). A sentence like "Portsmouth Plaza was registered as California Historical Landmark No. 119 in 1933" contains "registered" and therefore **fails the gate**, because the citation regex knows only SF Landmark numbers, Article 10, the National Register, NRHP, "NR reference" and six-digit reference numbers. Either the corpus drops California's register entirely — losing the 1933 designation of the city's founding square — or the regex gains a `California Historical Landmark` alternative. **Not my call. Flagged.**
2. **`landmarkno = "0"` in the Article 10 dataset means "on the work programme", not "designated".** Forty records carry it, one of them in Chinatown (Far East Cafe, §6 record 42). Nothing in the gate catches a false landmark claim built on that row.
3. **The schema has no `bar` kind.** Li Po, Bow Bow and Buddha Lounge have no honest home; `restaurant` is a stretch and `attraction` is worse.
4. **The schema has no `tour` kind.** Chinatown Alleyway Tours would have to be `attraction`.

### 14.4 Address and data conflicts, collected
| Place | Conflict |
|---|---|
| Portsmouth Square | 733 Kearny (Rec & Park project page) vs 745 Kearny (Rec & Park property dataset) |
| Willie "Woo Woo" Wong Playground | 830 Sacramento (Rec & Park project page, OSM) vs 850 Sacramento (Rec & Park property dataset) |
| Kong Chow Temple | 865 Stockton (OSM) vs 855 Stockton (conventional usage) |
| Golden Gate Fortune Cookie Factory | 9 a.m.–7 p.m. vs 9 a.m.–6 p.m. on the same page; ZIP 94113 vs 94133 on the same page |
| CHSA | Wed & Sat 10–17 (own site) vs We–Su 11–16 (OSM) |
| Old St Mary's | `yearbuilt = 1966` in SF Planning's parcel record vs 1854 for the church |
| Sing Chong Building | `yearbuilt = 1900` in SF Planning's parcel record vs a post-1906 rebuild |
| Tin How Temple | reopened 1910 (Wikipedia) vs parcel `yearbuilt = 1911` |
| Goddess of Democracy | 1990 (Civic Art) vs 1994-06-04 (OSM) vs 1989 (Wikidata) |
| Sun Yat-sen statue | 1936 (Civic Art) vs 1937 (Wikipedia, twice) |
| Cameron House | founded 1874 (own site) vs board organised 1873 / house formed 1876 (Wikipedia) |
| Dragon Gate | "Built in 1969" (article lead) vs dedicated 18 October 1970 (article body) |
| Chinese Hospital | 831–845 Jackson built 2016 vs 840–846 Jackson built 1910 — two buildings |
| St Mary's Chinese institutions | 902 Stockton, 925 Stockton, 838 Kearny for two or three bodies |

### 14.5 Things that are gone or shut, which most sources still describe as open
- **Portsmouth Square: closed for renovation, construction began 10 June 2026, reopening mid-2028.**
- **Portsmouth Square pedestrian bridge / China Banks: demolition completed 14 August 2026.**
- Golden Dragon Restaurant, 822 Washington: closed 2006.
- Buddha's Universal Church tours: "will resume when safe"; the site is stale.
- Sam Wo: closed briefly in 2025, reopened the same year under new management.

---

## 15. Photo leads for the later wave — prose only, no URLs, per the compliance statement

Buildings are covered by 17 USC 120(a) and are the easy cases: the Dragon Gate is a structure rather
than a sculpture and its guardian lions are architectural fittings, though a frame that features the
lions alone is arguable; Old St Mary's brick tower and clock face; the Sing Chong corner at Grant and
California; the Julia Morgan YWCA at 965 Clay; the Carnegie library at 1135 Powell; the balconied
frontages along Waverly Place; the Great Star Theater marquee on Jackson.

The hard cases are all in §8 and every one of them is blocked: Portsmouth Square is a copyright
minefield containing the Goddess of Democracy, the Bufano-adjacent monuments and twenty-one separate
Mary Fuller McChesney pieces, and it is also shut until 2028; St Mary's Square holds three blocked
works; the library's own façade carries Rene Yung's *Take Root*; the Rose Pak station's three murals
are all by living artists. **A photographer should be told in advance that the two squares a guide
would most want to picture are the two it may not.** Tin How Temple prohibits interior photography as
a matter of house rule, and the fortune cookie factory charges fifty cents for it.

---

## 16. Sources fetched

DataSF / Socrata:
`https://api.us.socrata.com/api/catalog/v1?search_context=data.sfgov.org&q=landmark&limit=40` ·
`https://data.sfgov.org/resource/97yj-54sx.json?$limit=5000` (Article 10 landmarks, 370 rows) ·
`https://data.sfgov.org/resource/knm6-5ej6.json?$limit=100` (Article 10 districts, 20 rows) ·
`https://data.sfgov.org/resource/63x5-g3m4.json?$limit=500` (historic districts, 204 rows) ·
`https://data.sfgov.org/resource/3tsw-4idn.json` (historic resource status by parcel) ·
`https://data.sfgov.org/resource/j2bu-swwd.json?$limit=200` (analysis neighborhoods, 41 polygons) ·
`https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=1000` (Rec & Park properties, 255 rows) ·
`https://data.sfgov.org/resource/r7bn-7v9c.json?$limit=2000` (Civic Art Collection, 1,038 rows)

Federal and state registers:
`https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/0/query` ·
`.../MapServer/1/query` · `https://ohp.parks.ca.gov/ListedResources/?view=county&criteria=38`

City agencies: `https://sfrecpark.org/1166/Portsmouth-Square-Improvement-Project` ·
`https://sfrecpark.org/1175/Willie-Woo-Woo-Wong-Playground-Improveme` ·
`https://sfrecpark.org/602/500-Pine-Street---St-Marys-Square-Extens` ·
`https://sfpl.org/locations/chinatown` · `https://sfplanninggis.org/docs/landmarks_and_districts/LM<N>.pdf`

Operators' own sites: `https://chsa.org/visit/` · `https://www.cccsf.us/visit` ·
`https://www.goldengatefortunecookies.com/contact` · `https://www.goldengatefortunecookies.com/visit` ·
`https://www.oldsaintmarys.org/` · `https://www.cameronhouse.org/about` · `https://www.bucsf.com/` ·
`https://www.greatstartheater.org/` · `https://www.misterjius.com/` · `https://www.rnglounge.com/` ·
`https://www.chinalivesf.com/` · `https://www.sfhistory.org/` · `https://www.chinatownalleywaytours.org/`

Aggregators, attributed as such throughout: `en.wikipedia.org` (Chinatown San Francisco; Dragon Gate;
Grant Avenue; Ross Alley; Jack Kerouac Alley; Stockton Street Tunnel; List of streets and alleys in
Chinatown; Tin How Temple; Kong Chow Temple; Ma-Tsu Temple; Old St. Mary's Cathedral; Portsmouth
Square; Portsmouth Square pedestrian bridge; Saint Mary's Square; Statue of Sun Yat-sen; Robert Louis
Stevenson Memorial; Goddess of Democracy; Chinese Historical Society of America; Chinese Culture
Center; Donaldina Cameron House; Great Star Theater; San Francisco Chinese Hospital; Chinese
Consolidated Benevolent Association; Chinese American Citizens Alliance; First Chinese Baptist
Church; Presbyterian Church in Chinatown; Gordon J. Lau Elementary School; Ping Yuen; Golden Dragon
massacre; International Hotel; Commercial Street; Chee Kung Tong; Sam Wo; Golden Gate Fortune Cookie
Company; Hilton San Francisco Financial District; Chinatown station (Muni Metro)) ·
`www.wikidata.org/w/api.php` (Q2135574, Q6429111, Q18351171, Q40729318, Q40733116, Q40699786,
Q40731422) · `overpass.private.coffee` (2,061 named OSM elements over the Chinatown box) ·
`http://www.sanfranciscochinatown.com/attractions/index.html` (a commercial promotion site — the
weakest source used here, and the only source for the Chinese Telephone Exchange dates)
