# Pacific Heights — Finder's research file

Zone slug `pacific-heights`, in scope per `priv/seed_data/san_francisco_roster.json`.
Finder pass, 2026-09-03. Nothing here is adjudicated: a verifier rules on each fact and one
arbitrator rules ownership across all twelve zones. Straddlers are flagged, never resolved.

**85 candidates.** In my judgement this is a **guide**, not a town page — see §7.
**42 designation identifiers found** (28 San Francisco Article 10 landmark numbers, 2 Article 10
landmark district numbers, 21 NRHP reference numbers, 1 NHL; the sets overlap).

---

## 0. The shipped taken-slug script does not cover San Francisco

`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only (line 11). Run as the brief
instructs, it reports **"0 places already owned"** for `pacific`, `haas`, `lilienthal`,
`spreckels`, `oracle` and every other San Francisco string — a false all-clear. The Fisherman's
Wharf finder reported the same defect; it is still unfixed. It also cannot see the Oracle Park
code seed, which lives in `lib/`, not `priv/`.

I wrote a corpus-wide replacement at
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/check.py`
walking all eight `priv/seed_data` regions plus `lib/**/*.ex`: **5,235 slug/name rows**.

**Result of the real check: no Pacific Heights candidate is taken.** Zero corpus-wide hits on
*haas, lilienthal, spreckels, whittier, bourn, atherton, tobin, sherith, swedenborg, alta plaza,
casebolt, cottage row, kinmon, octagon, audium, drisco, presidio heights, cow hollow*. The only
near-misses are unrelated: `pacific-branch-brooklyn-public-library` (Boerum Hill),
`lafayette-grand-cafe-bakery` (NoHo), `the-fillmore-detroit` (Comerica Park code seed),
`westbourne-playground` (Far Rockaway), `bryan-andrew-house` (Orange CT). The Oracle Park seven
are all Mission Bay and touch nothing here.

---

## 1. The boundary problem — read before ruling on any place

Unlike Fisherman's Wharf, **Pacific Heights exists as an official unit**: it is one of SF
Planning's 41 Analysis Neighborhoods (DataSF `j2bu-swwd`, 41 features, verified by pulling the
polygons and running point-in-polygon myself). So there is a defensible answer for every point.

The complication is that the official polygon is **wider than the vernacular neighborhood at the
south edge and narrower at the north edge**, and both discrepancies land on in-scope zones.

Analysis-neighborhood polygon extent: lon −122.44673…−122.42233, lat 37.78483…37.79669.
In street terms: Lyon to Van Ness/Polk, Sutter up to Vallejo/Green.

### Two independent authorities, both DataSF, deliberately chosen

Nominatim answered during the programme's scoping on 2026-09-03 but returned HTTP 429 on every
request during this pass, including single probes with a descriptive User-Agent. Rather than ship
one authority, I substituted a second DataSF layer that is genuinely independent of the first and
better suited to the job: **SF Find Neighborhoods** (`pty2-tcw4`, 117 features), which is the
vernacular geography and carries the units the official 41 collapse — `Cow Hollow`,
`Lower Pacific Heights`, `Cathedral Hill`, `Union Street`, `Polk Gulch`, `Presidio Heights`,
`Japantown`.

A third authority arrives free with the parks: DataSF's Recreation and Parks Properties
(`gtr9-ntp6`) stamps every property with **four** neighborhood attributions —
`analysis_neighborhood`, `mons_neighborhood` (Mayor's Office of Neighborhood Services),
`realtor_neighborhood` and `planning_neighborhood`. Where those four agree, the case is closed.

NPS `mapservices.nps.gov/.../nrhp_locations` (layers 0 and 1) was queried directly for the
bounding box and confirms every NRHP reference number below independently of Wikipedia.

### Where the two authorities disagree

| Point | Analysis nbhd | SF Find | Reading |
|---|---|---|---|
| Cottage Row, Kinmon Gakuen, Japanese YWCA, Stanyan House, Ohabai Shalome, 1735 Webster | **Pacific Heights** | **Japantown** | contested with an in-scope zone |
| Sweet Maple, 2101 Sutter | **Pacific Heights** | **Japantown** | contested with an in-scope zone |
| Albert Wilford Houses, Vedanta New Temple, Golden Gate Valley Library, Burr House | **Marina** | **Pacific Heights** | contested with an in-scope zone |
| Swedenborgian Church, Roos House, Koshland House, Wolski House, Russell House, Julius Kahn Playground, Spruce, SF University High | **Presidio Heights** | **Presidio Heights** | no in-scope zone owns it |
| Trinity Episcopal, Audium, St Mary of the Assumption, Hotel Majestic, Grabhorn Press, Goodman Building, Paige Motor Car | **Western Addition** or **Tenderloin** | **Cathedral Hill** | no in-scope zone owns it |
| Octagon House, Sherman House, Metro Theater, Allyne Park, Vedanta Old Temple, former Russian consulate | **Marina** | **Cow Hollow / Union Street** | Marina's under the official reading |
| Alhambra Theatre, Engine Co. #8, Church for the Fellowship of All People | **Russian Hill** | **Polk Gulch** | Russian Hill's |

**Everything else in §3 returns Pacific Heights or Lower Pacific Heights on both.** "Lower Pacific
Heights" is a SF Find sub-unit that nests entirely inside the Pacific Heights analysis polygon; it
is not a competing zone and no other in-scope zone claims it. I treat those as clean, but say so.

### What the sources say in words

Wikipedia's own extent section is unusually candid and is worth quoting to the verifier:

> "'Pacific Heights' is the general term for the hilltop neighborhood found between Cow Hollow to
> the north, the Upper Fillmore or Lower Pacific Heights to the south, the Presidio and Presidio
> Heights to the west, and Polk Gulch to the east. However, definitions vary… The San Francisco
> Association of Realtors and the San Francisco Mayor's Office of Neighborhood Services generally
> designate the area between Green Street in the north, California Street in the south, and Lyon
> Street in the west… The Pacific Heights Residents Association defines the neighborhood more
> broadly, stretching from Union Street in the north to Bush Street in the south… Additionally,
> the Cow Hollow Association includes the area north of Pacific Street and west of Pierce Street
> as belonging in their neighborhood."
> <https://en.wikipedia.org/wiki/Pacific_Heights,_San_Francisco>

Also from that page, publishable and useful: the ridge "rises sharply from the Marina District and
Cow Hollow neighborhoods to the north to a maximum height of 370 feet (110 m) above sea level."
That is a measurement, not an impression.

---

## 2. Designation identifiers — the citable core

### 2a. San Francisco Article 10 landmark numbers
Source for all: DataSF Socrata `97yj-54sx`, "Landmarks Listed in Article 10 of the San Francisco
Planning Code", 370 rows pulled in full, fields `landmarkno` / `name` / `address` /
`yeardesignated` / `designationdocument`. <https://data.sfgov.org/resource/97yj-54sx.json>
Each row also carries a designation-report PDF at
`https://sfplanninggis.org/docs/landmarks_and_districts/LM<N>.pdf`.

Both authorities return Pacific Heights (or Lower Pacific Heights) unless the last column says
otherwise.

| # | Landmark | Address | Designated | Note |
|---|---|---|---|---|
| **No. 69** | Haas-Lilienthal House | 2007 Franklin Street | 1975 | |
| **No. 197** | Spreckels Mansion | 2080 Washington Street | 1990 | |
| **No. 75** | Whittier Mansion | 2090 Jackson Street | 1975 | |
| **No. 38** | Bourn Mansion (dataset spells "Bourne") | 2550 Webster Street | 1971 | |
| **No. 70** | Atherton House | 1990 California Street | 1975 | |
| **No. 260** | Tobin House | 1969 California Street | 2008 | |
| **No. 103** | Calvary Presbyterian Church | 2501–2515 Fillmore St & 2428–2515 | 1978 | |
| **No. 302** | Clay Theatre (dataset spells "Filmore") | 2261 Fillmore Street | 2022 | |
| **No. 252** | St. Brigid's Church | 2151 Van Ness Avenue | 2006 | |
| **No. 57** | Talbot-Dutton House | 1782 Pacific Street | 1973 | |
| **No. 45** | Leale House | 2475 Pacific Avenue | 1972 | |
| **No. 207** | Ellinwood House | 2799 Pacific Avenue | 1994 | |
| **No. 203** | Gibbs Residence and Caretaker's Cottage | 2622–2624 Jackson St & 2629–2624 | 1993 | |
| **No. 119** | Chambers Mansion | 2220–2222 Sacramento Street | 1980 | |
| **No. 198** | Richard E. Queen House | 2212 Sacramento Street | 1990 | |
| **No. 115** | Health Sciences Library | 2395 Sacramento Street | 1980 | |
| **No. 54** | Edward Coleman House | 1701 Franklin Street | 1973 | |
| **No. 53** | Isaac Wormser House / John C. Coleman House | 1834 California Street | 1973 | |
| **No. 55** | Lilienthal-Orville Pratt House | 1818–1820 California Street | 1973 | |
| **No. 168** | William Vale House | 2226 California Street | 1984 | |
| **No. 51** | Casebolt House | 2727 Pierce Street | 1973 | Wikipedia calls it Cow Hollow — §5 |
| **No. 211** | Madame C J Walker House (Home for Girls) | 2066 Pine Street | 1999 | |
| **No. 98** | Ortman-Shumate House | 1901 Scott Street | 1977 | |
| **No. 288** | Kinmon Gakuen | 2031 Bush Street | 2019 | Japantown straddle |
| **No. 291** | Japanese YWCA / Issei Women's Building | 1830 Sutter Street | 2021 | Japantown straddle |
| **No. 66** | Stanyan House | 2006 Bush Street | 1975 | Japantown straddle |
| **No. 81** | Ohabai Shalome / Bush Street Temple | 1881 Bush Street | 1976 | Japantown straddle |
| **No. 65** | Trinity Episcopal Church | 1668 Bush Street | 1974 | Cathedral Hill orphan — §6 |

Marina's, on the official reading, listed so no one re-derives them: No. 17 Colonial Dames Octagon
House (2645 Gough, 1969), No. 49 Sherman House (2160 Green, 1972), No. 31 Burr House (1772
Vallejo, 1970), No. 261 Metro Theater (2055 Union, 2009), No. 300 Golden Gate Valley Carnegie
Library (1801 Green, 2022), No. 218 North End Police Station (2475 Greenwich, 1996).
Russian Hill's: No. 217 Alhambra Theater (2330 Polk, 1996), No. 188 Engine Co. #8 / Truck Co. #4
(1648 Pacific, 1988), No. 309 Church for the Fellowship of All People (2041 Larkin, 2023).
Presidio Heights: No. 56 Roos Residence (3500 Jackson, 1973), No. 95 Koshland House (3800
Washington, 1977).
Japantown proper: No. 202 Golden Gate Commandery of the Knights Templar (2135 Sutter, 1993),
No. 266 Marcus Books / Jimbo's Bop City (1712–1716 Fillmore, 2014).

**There is no Article 10 landmark number for Lafayette Park, Alta Plaza Park, Congregation Sherith
Israel, St. Dominic's, the Lyon Street Steps, the Broadway consulate row, Hotel Drisco, or any
Fillmore Street shop. Do not invent one.** Sherith Israel and the two parks each carry other
citable identifiers; the rest carry none and must be written with no protection claim at all.

Four rows in the dataset carry `landmarkno = 0` and `yeardesignated = 0.0` — pending or
initiated designations, not completed ones. In this area they are: Wolski House (3655 Clay),
Russell House (3778 Washington), National Urban League SF Chapter (2015 Steiner), Office of
Dr. Carlton B. Goodlett (1843–1849 Fillmore), Congregation Emanu-El School Buildings (1337
Sutter). **These have no number and therefore no publishable designation claim.**

### 2b. San Francisco Article 10 landmark DISTRICT numbers
Source: `List of San Francisco Designated Landmarks`, districts table
(<https://en.wikipedia.org/wiki/List_of_San_Francisco_Designated_Landmarks>), cross-checked
against DataSF `63x5-g3m4` "Historic Districts" (`a10` field = Listed).

| # | District | Designated | Size | Note |
|---|---|---|---|---|
| **No. 2** | Webster Street | 1981 | 3 blocks, 25 parcels | both authorities Pacific Heights |
| **No. 9** | Bush Street–Cottage Row | 1991 | 2 blocks, 23 parcels | analysis PH / SF Find Japantown |

**Only these two are Article 10 districts here.** DataSF `63x5-g3m4` also returns seven districts
in or near the zone that are **California Register *eligible* and nothing more** — Pacific Heights
Historic District (1895–1930), Upper Fillmore Neighborhood Commercial Historic District
(1865–1905; 1906–1929), Raycliff Terrace Historic District (1941–1951), Normandie Terrace Historic
District (1937–1941), Japantown Community & Cultural Historic District (1906–1960), Presidio
Heights Historic District, California Street Historic District. **Eligible is not designated.**
None of these publishes a designation claim. They are useful only as evidence that a corridor
holds a coherent building group, which can be written as description without any register word.

### 2c. National Register reference numbers
Confirmed twice: NPS ArcGIS `nrhp_locations` MapServer layers 0 and 1, envelope
−122.4600/37.7830/−122.4190/37.8000, fields `NRIS_Refnum` / `Address` / `CertDate` / `Is_NHL`;
and <https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco>.

| Resource | NRHP ref | Certified | Neighborhood reading |
|---|---|---|---|
| Haas-Lilienthal House, 2007 Franklin St | **73000438** | 1973-07-02 | PH / PH |
| Whittier Mansion, 2090 Jackson St | **76000524** | 1976-04-26 | PH / PH |
| Atherton House, 1990 California St | **79000527** | 1979-01-31 | PH / PH |
| Tobin House, 1969 California St | **09000806** | 2009-10-05 | PH / PH |
| Temple Sherith Israel, 2266 California St | **10000114** | 2010-03-31 | PH / PH |
| Calvary Presbyterian Church, 2501–2515 Fillmore St | **78000755** | 1978-05-03 | PH / PH |
| C. A. Belden House, 2004–2010 Gough St | **83001229** | 1983-08-11 | PH / PH |
| Dallam-Merritt House, 2355 Washington St | **84001185** | 1984-04-19 | PH / PH |
| The Real Estate Associates (TREA) Houses, 2503/2524/2530/2536 Clay St | **85000705** | 1985-04-04 | PH / PH |
| Fillmore-Pine Building, 1946 Fillmore St | **82002247** | 1982-01-11 | PH / Lower PH |
| Paige Motor Car Co. Building, 1699 Van Ness Ave | **83001234** | 1983-02-24 | PH per NPS point; §6 |
| Bush Street–Cottage Row Historic District, 2101–2125 Bush St, 1–6 Cottage Row | **82000983** | 1982-12-27 | PH / Japantown |
| Japanese YWCA, 1830 Sutter St | **100004868** | 2020-01-10 | PH / Japantown |
| Albert Wilford Houses, 2121 & 2127 Vallejo St | **85001914** | 1985-08-29 | Marina / PH |
| Building at 1735–1737 Webster St | **73000444** | 1973-03-08 | PH / Japantown — see caveat |
| Swedenborgian Church, 3200 Washington St | **04001154** | 2004-08-18 | **NHL**; Presidio Heights on both |
| Roos House, 3500 Jackson St | **09000805** | 2009-10-08 | Presidio Heights |
| Koshland House, 3800 Washington St | **84001186** | 1984-01-05 | Presidio Heights |
| McElroy Octagon House, 2645 Gough St | **72000250** | 1972-02-23 | Marina / Union St |
| Burr House, 1772 Vallejo St | **14000967** | 2015-06-08 | Marina / PH |
| Kinmon Gakuen, 2031 Bush St | **100012857** | listed 2026 | **see caveat** |

Two caveats the verifier must resolve, not me:

- **Kinmon Gakuen NRHP 100012857** appears only on Wikipedia
  (<https://en.wikipedia.org/wiki/Kinmon_Gakuen>), which gives the listing year as 2026. The NPS
  ArcGIS layer returned the building without a `NRIS_Refnum` for the NRHP listing. Its **Article
  10 number 288 (2019) is solid** and comes straight from DataSF. If only one identifier survives
  verification, use the landmark number.
- **Building at 1735–1737 Webster Street, 73000444** is on the Wikipedia NRHP list but did not
  come back in the NPS envelope query, which covered its coordinates. Treat as unconfirmed.

Adjacent-zone NRHP references, recorded so no one re-derives them: Grabhorn Press Building 1335
Sutter (**97000349**), Theodore F. Payne House 1409 Sutter (**80000847**), Goodman Building 1117
Geary (**75000473**), Myrtle Street Flats (**76000520**), Building at 1813–1813B Sutter
(**73000443**, Japantown on both), St. John's Presbyterian Church 25 Lake St (**95001555**, Inner
Richmond), Julian Waybur House 3232 Pacific Ave (**11000143**, Presidio/Presidio Heights), Don Lee
Building 1000 Van Ness (**01001179**, Tenderloin).

---

## 3. Candidates — both authorities return Pacific Heights or Lower Pacific Heights

Kind is my suggestion against the thirteen `Ethos.Places.Place.kinds/0` allows. **There is no
church, monument, mansion or district kind**; churches and houses take `historic-site` or
`attraction`.

### 3a. The one place open to the public as a museum

**1. Haas-Lilienthal House** — `museum` — 2007 Franklin Street, San Francisco CA 94109.
Built 1886 for the merchant William Haas and Bertha Greenebaum Haas; architect Peter R. Schmidt,
contractors McCann & Biddell. Queen Anne, 11,500 square feet. Survived the 1906 earthquake; the
family watched the fire from the roof and evacuated to Lafayette Park; the fire stopped at Van
Ness Avenue. A 1928 addition of living quarters over a garage is by Gardner Dailey. Alice
Haas-Lilienthal died in 1972 after living there nearly eighty years; her children gave the house
to the Foundation for San Francisco's Architectural Heritage (now SF Heritage) in 1973. Designated
a National Treasure by the National Trust for Historic Preservation in 2012.
**San Francisco Landmark No. 69, designated 1975. Listed on the National Register of Historic
Places, reference number 73000438, in 1973.**
Operator's own site, so identity/location/hours publish:
2026 docent-led tours on select Wednesdays (12.30pm, 2pm) and Saturdays (noon, 1pm, 2pm).
General admission $10; children 12 and under free; SF Heritage members free. Allow at least one
hour. Wheelchair accessible at ground level through the tour entrance; a lift serves the upper
floors. Phone (415) 441-3000.
Sources: <https://www.haas-lilienthalhouse.org/>, <https://www.haas-lilienthalhouse.org/house-tours>,
<https://www.sfheritage.org/>, <https://en.wikipedia.org/wiki/Haas%E2%80%93Lilienthal_House>.
**Do NOT write "the one Victorian open to the public"** — comparison class, banned. Write what it
is and when it opens.

Same operator, and a genuine second entry: **2. SF Heritage's self-guided Pacific Heights walking
tour** — the house publishes a downloadable PDF and a Google Maps route covering "approximately
15 blocks (0.8 miles) of Pacific Heights", described by the operator as moderate with a few hills;
plus a separate self-guided Broadway walking tour.
<https://www.haas-lilienthalhouse.org/walking-tours>. Sourced measurement, so it survives the
proximity ban. Their own blurb calls Pacific Heights "one of the most expensive and wealthiest
neighborhoods" — **that is a superlative and must not be carried over.**

### 3b. Parks — DataSF gives acreage and address, four attributions agreeing
Source for all four rows: DataSF `gtr9-ntp6`, Recreation and Parks Properties.

**3. Lafayette Park** — `park` — 2101 Washington Street, 94109. 12.48 acres (543,742 sq ft).
`analysis / mons / realtor / planning` all **Pacific Heights**. Bounded by Washington, Sacramento,
Gough and Laguna. Two tennis courts, a children's playground, an off-leash dog area, restrooms, a
picnic area. Refugees from the 1906 fire camped here, including the Haas family.
Wikipedia gives 12.5 acres and says the park was "originally created in 1936", which contradicts
the 1906 camping account and every history of the block; **the date is unreliable and should not
be written.** <https://en.wikipedia.org/wiki/Lafayette_Park_(San_Francisco)>

**4. Alta Plaza Park** — `park` — 2501 Jackson Street, 94115. 12.94 acres (563,451 sq ft).
All four attributions **Pacific Heights**. Four square blocks: Jackson north, Clay south, Steiner
east, Scott west; the plaza interrupts Washington Street east–west and Pierce Street north–south.
Three hard-surface tennis courts, a playground at the centre, grass on the northern half and
terraced lawns on the southern. The terraced south steps appear in *What's Up, Doc?* (1972); they
were used without permission and damaged during the car-chase sequence.
Has a **Historic American Landscapes Survey record, HALS No. CA-16** — a citable identifier of a
different kind, and useful because there is no landmark number.
<https://en.wikipedia.org/wiki/Alta_Plaza_Park>

**5. Cottage Row Mini Park** — `park` — 0.171 acres, 37.78656 / −122.43232, no street address in
the dataset. **This is the four-way split that proves the boundary is contested:**
`analysis_neighborhood` = Pacific Heights, `mons_neighborhood` = Japantown,
`realtor_neighborhood` = Lower Pacific Heights, `planning_neighborhood` = Western Addition.
Flagged in §5.

**6. Bush & Broderick Mini Park** — `park` — 2748 Bush Street. 0.195 acres.
analysis = Pacific Heights, mons and realtor = Lower Pacific Heights. An edge find; small.

**7. Presidio Library Mini Park** — `park` — 3150 Sacramento Street. 0.679 acres.
All three of analysis / mons / realtor = **Pacific Heights** in the RecPark row, and my
point-in-polygon at the dataset's own coordinates (37.78893 / −122.44486) returns Pacific Heights
on both authorities. Sits at the Presidio Heights edge; worth a second look but currently clean.

### 3c. The great houses — landmark number, no public access
Every one of these is a **private residence or private institution**. A guide may describe the
street elevation and the designation; **it must not imply entry**, and no source states opening
hours for any of them, so none should be given.

**8. Spreckels Mansion** — `historic-site` — 2080 Washington Street. Built c. 1912–13 for Adolph
B. Spreckels; architects George Adrian Applegarth (1876–1972) and Kenneth A. MacDonald Jr., of
MacDonald & Applegarth. French Baroque château manner, three storeys, reported 55 rooms and a
Louis XVI ballroom. Alma de Bretteville Spreckels stocked it from Europe and on the same journey
met Auguste Rodin, bringing thirteen bronzes back for the 1915 Panama-Pacific International
Exposition — the seed of the Legion of Honor. Eight Victorian houses were moved to Jackson and
Washington Streets to clear the combined lots. Divided into four units after 1968; bought and
restored to a single residence by the novelist Danielle Steel, who planted the tall front hedge.
Exterior used as the nightclub in *Pal Joey* (1957). Faces Lafayette Park across Washington Street
— an adjacency a reader can act on, so it publishes.
**San Francisco Landmark No. 197, designated 1990.**
<https://en.wikipedia.org/wiki/Spreckels_Mansion_(San_Francisco)>

**9. Whittier Mansion** — `historic-site` — 2090 Jackson Street. Built 1894–96 for William Franklin
Whittier (1832–1917), a paint and white-lead manufacturer; cost $152,000 to build and furnish,
paid from the 32 monthly instalments of the $400,000 sale of his firm to the Fuller family in
1893. Occupied from August 1896. Survived the 1906 earthquake. Later the West Coast headquarters
of the Nazi Party, and later still occupied by the California Historical Society.
**San Francisco Landmark No. 75, designated 1975. Listed on the National Register, reference
number 76000524, in 1976.**
The Wikipedia article says the mansion "is purported to be haunted" and calls it "one of few
buildings to survive the 1906 Earthquake" — **the second is a comparison class and does not
publish.** <https://en.wikipedia.org/wiki/Whittier_Mansion>

**10. Bourn Mansion** — `historic-site` — 2550 Webster Street. Built 1896 for William Bowers Bourn
II, owner of the Empire Mine, and Agnes Moody Bourn; architect **Willis Polk**, who later built
Bourn's Filoli. Red clinker brick, English-townhouse manner, 9,762 sq ft, 28 rooms, 14 fireplaces.
Seismically retrofitted 2011, renovated 2012.
**San Francisco Landmark No. 38, designated 1971.**
<https://en.wikipedia.org/wiki/Bourn_Mansion>

**11. Atherton House** — `historic-site` — 1990 California Street. Built 1881–82 for Dominga de
Goñi Atherton (1823–1890), widow of Faxon Atherton and mother-in-law of the novelist Gertrude
Atherton, who wrote about the house in her memoirs. Architect thought to be John Marquis, also
attributed to the Moore Brothers. Queen Anne blended with Stick-Eastlake; horizontal lines, a
clipped gable, a short tower. Renumbered from 1950 to 1990 California Street in 1900. Subdivided
into 13 apartments in 1923 by the architect Charles J. Rousseau; his widow Carrie lived there with
fifty cats until 1974.
**San Francisco Landmark No. 70, designated 1975. Listed on the National Register, reference
number 79000527, in 1979.** <https://en.wikipedia.org/wiki/Atherton_House>

**12–24. The remaining Article 10 houses**, each with a number and a designation year from
`97yj-54sx` and a designation-report PDF at `sfplanninggis.org/docs/landmarks_and_districts/LM<N>.pdf`.
No Wikipedia article for most; the PDF is the source of record and the verifier should open it
before any biographical claim is written:
Tobin House (1969 California, **No. 260**, 2008; also NRHP **09000806**);
Talbot-Dutton House (1782 Pacific, **No. 57**, 1973);
Leale House (2475 Pacific Ave, **No. 45**, 1972);
Ellinwood House (2799 Pacific Ave, **No. 207**, 1994);
Gibbs Residence and Caretaker's Cottage (2622–2624 Jackson, **No. 203**, 1993);
Chambers Mansion (2220–2222 Sacramento, **No. 119**, 1980);
Richard E. Queen House (2212 Sacramento, **No. 198**, 1990);
Edward Coleman House (1701 Franklin, **No. 54**, 1973);
Isaac Wormser House / John C. Coleman House (1834 California, **No. 53**, 1973);
Lilienthal-Orville Pratt House (1818–1820 California, **No. 55**, 1973);
William Vale House (2226 California, **No. 168**, 1984);
Madame C J Walker House / Home for Girls (2066 Pine, **No. 211**, 1999);
Ortman-Shumate House (1901 Scott, **No. 98**, 1977).

Madame C J Walker House is the strongest of that list for a guide: a Black women's residence
named for the entrepreneur, on Pine Street, designated 1999. Worth its own entry if the verifier
can source the history from LM211.pdf.

**25–27. NRHP-only houses**, no landmark number, so the claim must cite the National Register:
C. A. Belden House (2004–2010 Gough, **83001229**, 1983);
Dallam-Merritt House (2355 Washington, **84001185**, 1984);
The Real Estate Associates (TREA) Houses (2503, 2524, 2530 and 2536 Clay, **85000705**, 1985).
The TREA houses connect directly to the Cottage Row story: TREA was the developer that built
2115–2125 Bush Street and 1942–1948 Sutter Street, and built over 1,000 houses in the Mission,
Western Addition and Pacific Heights in the 1870s for the working-class market on easy credit.
<https://en.wikipedia.org/wiki/Bush_Street%E2%80%93Cottage_Row_Historic_District>

**28. Webster Street Landmark District** — `historic-site` —
**San Francisco Landmark District No. 2, designated 1981**, 3 blocks and 25 parcels, a unified
Italianate group. DataSF `63x5-g3m4` records it `a10 = Listed` and puts it in Pacific Heights on
both authorities. Wikipedia's districts table describes it as "in the Western Addition", which is
the older name for the ground. A district, not a building — kind must be `historic-site`.

### 3d. Places of worship
**29. Congregation Sherith Israel** — `historic-site` — 2266 California Street, 94115,
(415) 346-1720. Reform congregation founded 1851; the present sanctuary was completed in 1905 and
served as the courtroom for the San Francisco graft prosecution trials of 1905–08. A seismic
retrofit is documented on the congregation's own site, which also lists historic-sanctuary tours,
a Czech Torah and its organ.
**Listed on the National Register of Historic Places, reference number 10000114, in 2010.**
No Article 10 number — the congregation is not in `97yj-54sx`. The National Register is the only
register that may be cited here.
The Wikipedia article says the congregation "is one of the oldest synagogues in the United States"
and the building "one of San Francisco's most prominent architectural landmarks" — **both are
rankings and neither publishes.** The founding year does publish because it is on the National
Register nomination and not merely on the congregation's own site.
<https://www.sherithisrael.org/>, <https://en.wikipedia.org/wiki/Congregation_Sherith_Israel_(San_Francisco)>

**30. Calvary Presbyterian Church** — `historic-site` — 2501–2515 Fillmore Street, at Jackson.
Congregation founded 23 July 1854; first building on Bush Street dedicated 14 January 1855; second
on Union Square dedicated 16 May 1869; the present building went up in 1901 reusing one million
bricks, all the pews, the metal balcony supports and much of the woodwork from the Union Square
church. First service on Fillmore on Thanksgiving Day 1902; dedicated 7 February 1904. Untouched
by the 1906 earthquake, after which St. Luke's Episcopal, Old First Presbyterian and Temple
Emanu-El all worshipped in it and the Superior Court sat in a temporary courtroom in the basement.
**San Francisco Landmark No. 103, designated 1978. Listed on the National Register, reference
number 78000755, in 1978.**
The Wikipedia article calls the 1855 building "the largest Protestant church building on the west
coast" — **a ranking; drop it.**
<https://en.wikipedia.org/wiki/Calvary_Presbyterian_Church_(San_Francisco)>

**31. St. Brigid's Church** — `historic-site` — 2151 Van Ness Avenue.
**San Francisco Landmark No. 252, designated 2006.** Closed as a parish and now in academic use.
No Wikipedia extract; the designation report LM252.pdf is the source of record. Both authorities
return Pacific Heights, though a reader would call this Van Ness. Low information so far —
verifier should open the PDF or find the Archdiocese record before this ships.

**32. St. Dominic's Catholic Church** — `historic-site` — 2390 Bush Street, at Steiner.
analysis = Pacific Heights, SF Find = Lower Pacific Heights. A large Gothic Revival parish church
with a Shrine of St. Jude, a columbarium, and its own docent tour programme ("Docent Tours",
"Twilight Tour Hosted by St. Dominic's Docents") and mass-times page on the parish site.
<https://www.stdominics.org/>. **It is NOT in the Article 10 dataset and NOT on the National
Register** — I checked both by street and by name. Any protection claim about it would fail the
gate. Write it with none. The parish site establishes identity, location and service times only;
its "Parish History" page is an operator claim about founding and must not be used for a
trading-duration statement.

**33. Ohabai Shalome / Bush Street Temple** — 1881 Bush Street.
**San Francisco Landmark No. 81, designated 1976.** Japantown straddle — §5.

### 3e. Theatres, halls and film
**34. Clay Theatre** — `theater` — 2261 Fillmore Street. Opened c. 1913–14 as The Regent, a
nickelodeon; The Avalon from 1931; The Clay International from 1935 under Herbert Rosener, showing
foreign film — *The Song to Her* (1934) and *Goodbye, Beautiful Days* (1935) screened in 1935. The
exterior was heavily altered in the 1950s; the ticket booth moved and the entrance archway went.
325 seats latterly. Landmark's Clay from 1991. Closed by Landmark Theatres in late January 2020;
the seating was removed in 2021 and a retail-conversion application filed; the community campaigned
and the city designated it in May 2022. The Wikipedia article notes a February 2024 development
concerning the theatre and the adjacent building that my extract truncated — **the verifier must
establish its current operating status before any hours are written.**
**San Francisco Landmark No. 302, designated 6 May 2022.**
Wikipedia says it "was the first theater in the city dedicated to foreign film" — that is a
sequence claim with a comparison class attached to the city; **safest to drop it.**
<https://en.wikipedia.org/wiki/Clay_Theatre>

**35. The house at 2640 Steiner Street** — used as the Hillard family home in *Mrs. Doubtfire*
(1993). Both authorities return Pacific Heights for that coordinate. **I could not source the
address to anything authoritative** — the Wikipedia article on the film does not name it. Listed
here so the verifier can rule on it; my recommendation is to drop it unless a solid source turns
up. It is a private residence in any case.

**36.** For the record and against re-derivation: **the 1990 film *Pacific Heights* was not filmed
at a Pacific Heights address.** Do not put it on the page.

### 3f. Schools and institutions on Broadway — the "Gold Coast"
**37. Convent & Stuart Hall (Schools of the Sacred Heart), Flood Mansion campus** — `historic-site`
— 2222 Broadway. Both authorities Pacific Heights. The school's own site
(<https://www.sacredsf.org/>) establishes the institution; I could not reach a campus page giving
the building history, and the campus-overview URL 404s. **No designation: not in `97yj-54sx`, not
on the NPS layer.** Note the naming trap — the *James C. Flood Mansion* at 1000 California Street
is **Nob Hill's**, is San Francisco Landmark No. 64 (1974) and a National Historic Landmark, and
is the Pacific-Union Club. Two different Flood houses. Do not merge them.

**38. The Hamlin School** — `historic-site` — 2120 Broadway. Both authorities Pacific Heights. A
private day school for girls, K–8. Sarah Dix Hamlin bought the Van Ness Seminary School at 1849
Jackson Street in April 1896; renamed Miss Hamlin's School for Girls in 1898; moved to a mansion
at 2230 Pacific Avenue in 1907; Hamlin died 25 August 1923. Wikipedia places the campus "at 2120
Broadway, San Francisco, near Pacific Heights" — note "near", which is Wikipedia hedging and not
what my polygons say. No designation.
<https://en.wikipedia.org/wiki/Hamlin_School>

**39. Town School for Boys** — 2750 Jackson Street. Both authorities Pacific Heights. No
designation, thin sourcing; low priority.

**40. The Broadway consulate row** — the roster's brief names it. What I can actually establish:
Consulate General of Italy is commonly given as 2590 Webster Street and Consulate General of
Germany as 1960 Jackson Street; **both coordinates return Pacific Heights on both authorities, but
I could not reach either consulate's own site** (the Italian domain did not resolve; I did not
reach the German one). **The Russian consulate at 2790 Green Street is documented on Wikipedia and
is Cow Hollow / Marina, not this zone**, and it has been closed since 2017 with the building still
Russian government property
(<https://en.wikipedia.org/wiki/Consulate_General_of_Russia,_San_Francisco>).
My recommendation: **do not write a "consulate row" entry.** It is an unsourced vernacular label,
the one consulate I can source is in another zone, and working diplomatic missions are a poor
travel-guide subject. If anything survives, it is a Broadway street entry (below).

**41. Broadway between Divisadero and Lyon** — `attraction` — the mansion corridor. Both
authorities Pacific Heights across the whole run (I probed Broadway at Fillmore, Steiner,
Broderick and Lyon). SF Heritage publishes a self-guided **Broadway walking tour** of it
(<https://www.haas-lilienthalhouse.org/walking-tours>), which is a citable reason for the entry to
exist. **Do not call it "Billionaires' Row" or "the Gold Coast" and do not rank it** — every
formulation I found for this street is a wealth superlative.

### 3g. Streets, stairs and terraces
**42. Fillmore Street (Upper Fillmore)** — `attraction`. Named for Millard Fillmore; laid out when
the Western Addition was platted in the 1860s; the area acquired the name "The Fillmore" in the
1880s. Streetcar service began July 1895 and **the Fillmore Counterbalance was installed the
following month to work the 24.54 percent grade between Green and Broadway** — a measurement, and
the single best hard fact on the street. Decorative arches lined the intersections between 1907
and 1943 and were scrapped for the war effort. The whole street is served by Muni's 22 Fillmore.
Wikipedia describes the commercial concentration as "the three blocks south and nine blocks north
of Geary Boulevard" for the Lower and Upper Fillmore respectively.
<https://en.wikipedia.org/wiki/Fillmore_Street>
**Boundary care required:** Fillmore *runs through* Japantown, the Fillmore District, Pacific
Heights, Cow Hollow and the Marina. The Pacific Heights claim is to the blocks between roughly
Bush and Broadway. The Fillmore Auditorium at 1805 Geary is Western Addition on both authorities
and is **not** this zone's; neither is Marcus Books at 1712–1716 Fillmore (Japantown).

**43. Lyon Street Steps** — `attraction`. Between Broadway and Green on the Presidio wall. The
Broadway end returns Pacific Heights on both authorities; **the top of the stair at Washington
returns Presidio and Presidio Heights.** No Wikipedia article. No designation. A real straddler —
§5.

**44. Raycliff Terrace** and **45. Normandie Terrace** — private cul-de-sacs off Pacific Avenue
and off Vallejo. Both authorities Pacific Heights. Each is a California-Register-**eligible**
historic district in DataSF `63x5-g3m4` (Raycliff 1941–51, Normandie 1937–41) — **eligible, not
designated, so no register claim.** Both are gated private streets; a guide can say what they are
and should not send anyone up them.

### 3h. Food, drink, shops and beds
Operator sites establish identity, location and hours. **None of them establishes a founding year,
an award or a superlative, and I have deliberately recorded no founding years below.**

**46. b. patisserie** — `cafe` — 2821 California Street at Divisadero, 94115. (415) 440-1700.
Hours from the shop's own front page: **Wednesday to Friday 8–4, Saturday and Sunday 8–5, closed
Monday and Tuesday.** The site names a sister restaurant at 2794 California Street, across the
road, which I did not identify. analysis Pacific Heights / SF Find Lower Pacific Heights.
<https://bpatisserie.com/>

**47. SPQR** — `restaurant` — 1911 Fillmore Street. Italian; reservations via Resy. From the
restaurant's own site: à la carte or a $102 four-course menu, seven days a week, 5–9pm; a $69
five-course pasta tasting menu on Wednesdays and Thursdays, 5–9pm; online reservations for parties
up to six; corkage stated on site. analysis Pacific Heights / SF Find Lower Pacific Heights.
<https://www.spqrsf.com/>

**48. Pizzeria Delfina, Pacific Heights** — `restaurant` — 2406 California Street. The group's own
site lists exactly four locations and names one of them **"Pacific Heights"**, which is a
self-declared neighborhood attribution and unusually good evidence. Both authorities agree
(analysis Pacific Heights / SF Find Lower Pacific Heights). I did not get a clean address-and-hours
block off their location page — **the verifier should pull it.**
<https://www.pizzeriadelfina.com/>

**49. Hotel Drisco** — `hotel` — Pacific Avenue, 94115, +1 415 346 2880. Both authorities Pacific
Heights. The hotel's own site calls it "a boutique Pacific Heights hideaway" and has a dining room,
meetings and events. **It does not state the street number on its front page**; 2901 Pacific Avenue
is the address I probed and it is widely used, but the verifier must confirm it from the hotel's
own location page before it is written. <https://www.hoteldrisco.com/>

**50. Jackson Court** — `bnb` — 2198 Jackson Street. Both authorities Pacific Heights. The site
returned HTTP 200 with an empty body on my pull; **unverified. Recommend dropping unless the
verifier gets a real page.**

**51. Molly Stone's Markets, Pacific Heights** — `shop` — 2435 California Street. analysis Pacific
Heights / SF Find Lower Pacific Heights. Chain grocer; thin as a guide entry. Low priority.

**52. Browser Books** — `shop` — 2195 Fillmore Street. Both authorities Pacific Heights.
**`browserbooks.com` is a parked domain for sale** — the shop's old site is gone. It may still
trade under different ownership, but **I could not establish that it is open** and it should not
ship without a working operator page or a current news source.

**53. Jane on Fillmore** — 2123 Fillmore Street. **`janeonfillmore.com` is also a parked
for-sale domain.** Same warning.

**54. The Elite Cafe** — 2049 Fillmore Street. **`theelitecafe.com` now serves an unrelated
gambling site.** Closed. Recorded so nobody re-adds it.

**55. La Méditerranée** — 2210 Fillmore Street. `lamedsf.com` did not resolve. Status unknown.

Other Upper Fillmore names a guide would reach for and which I did **not** verify at all —
recorded as leads only, not as candidates: Florio (1915 Fillmore), Jackson Fillmore Trattoria
(2506 Fillmore), Harry's Bar (2020 Fillmore), Bun Mee (2015 Fillmore), The Grove Fillmore
(2016 Fillmore), Fillmore Bakeshop, Margaret O'Leary (2400 Fillmore). **Sweet Maple (2101 Sutter)
is a Japantown straddle on SF Find and should not be assumed.**

---

## 4. Places a reader would call Pacific Heights that official geography gives away

Listed so the arbitrator sees them and no one writes them twice.

- **Vedanta Society Old Temple, 2963 Webster Street** — analysis **Marina**, SF Find **Union
  Street**. Built under Swami Trigunatitananda and completed 7 January 1906; withstood the
  earthquake months later. Trigunatitananda was fatally injured by a bomb during a Sunday service
  on 28 December 1914. Wikipedia itself places it in Cow Hollow and places the Society's 1959
  "New Temple" **in Pacific Heights** — and the New Temple at 2323 Vallejo Street returns analysis
  **Marina** / SF Find **Pacific Heights**, i.e. the reverse. Both are the Marina's under the
  official reading; the New Temple is a straddle.
  <https://en.wikipedia.org/wiki/Vedanta_Society_of_Northern_California>
- **Colonial Dames Octagon House, 2645 Gough Street** — Marina / Union Street. San Francisco
  Landmark No. 17 (1969); NRHP **72000250** (1972). A genuine house museum and a real loss to this
  page, but it is not this zone's.
- **Sherman House (2160 Green, No. 49, 1972)**, **Metro Theater (2055 Union, No. 261, 2009)**,
  **Golden Gate Valley Carnegie Library (1801 Green, No. 300, 2022)**, **Allyne Park (2609 Gough,
  0.88 acres)** — all Marina on the analysis layer.
- **Alhambra Theater, 2330 Polk Street** — Russian Hill / Polk Gulch. San Francisco Landmark
  No. 217, designated 21 February 1996. Moorish Revival by Miller & Pflueger, opened 5 November
  1926 with 1,625 seats at a cost of $500,000; twinned 1976, back to one screen 1988, closed as a
  cinema 22 February 1998; now a Crunch Fitness with the marquee, dome and screen retained.
  Russian Hill's. <https://en.wikipedia.org/wiki/Alhambra_Theatre_(San_Francisco)>
- **The Fillmore, 1805 Geary Boulevard** — Western Addition on both. Not this zone's, and not
  Japantown's on the analysis layer either.
- **Marcus Books / Jimbo's Bop City, 1712–1716 Fillmore Street** — San Francisco Landmark No. 266,
  designated 2014 — Japantown on the analysis layer, Western Addition in Wikipedia's own words.

---

## 5. STRADDLERS — flagged, not resolved

### 5a. Against Japantown (an in-scope zone)
The analysis-neighborhood polygon runs south to Sutter, taking in ground that SF Find, the Mayor's
Office and Wikipedia all call Japantown. **Six landmarked subjects and a park sit in the overlap.**

| Subject | Identifier | analysis | SF Find | MONS |
|---|---|---|---|---|
| Bush Street–Cottage Row Historic District | **SF Landmark District No. 9** (1991); NRHP **82000983** (1982) | Pacific Heights | Japantown | — |
| Cottage Row Mini Park | — | Pacific Heights | Japantown | **Japantown** (realtor: Lower Pacific Heights; planning: Western Addition) |
| Kinmon Gakuen, 2031 Bush | **SF Landmark No. 288** (2019) | Pacific Heights | Japantown | — |
| Japanese YWCA / Issei Women's Building, 1830 Sutter | **SF Landmark No. 291** (2021); NRHP **100004868** (2020) | Pacific Heights | Japantown | — |
| Stanyan House, 2006 Bush | **SF Landmark No. 66** (1975) | Pacific Heights | Japantown | — |
| Ohabai Shalome / Bush Street Temple, 1881 Bush | **SF Landmark No. 81** (1976) | Pacific Heights | Japantown | — |
| Building at 1735–1737 Webster St | NRHP **73000444** (unconfirmed) | Pacific Heights | Japantown | — |
| Sweet Maple, 2101 Sutter | — | Pacific Heights | Japantown | — |

My view, offered and not acted on: **the Japanese-American subjects belong with Japantown by
subject even where the polygon says otherwise.** Kinmon Gakuen is a Japanese language school
visited by Hirohito in 1933 and 1935 and by Crown Prince Akihito and Crown Princess Michiko in
1960; the Japanese YWCA is the Issei Women's Building. Wikipedia's own article on the Bush
Street–Cottage Row district says flatly that it is "located in the Japantown area". Ohabai Shalome
and Stanyan House are less clear-cut. **The arbitrator decides.**

### 5b. Against the Marina (an in-scope zone)
| Subject | Identifier | analysis | SF Find |
|---|---|---|---|
| Albert Wilford Houses, 2121 & 2127 Vallejo | NRHP **85001914** (1985) | Marina | **Pacific Heights** |
| Burr House, 1772 Vallejo | SF Landmark No. 31 (1970); NRHP **14000967** (2015) | Marina | **Pacific Heights** |
| Golden Gate Valley Carnegie Library, 1801 Green | SF Landmark No. 300 (2022) | Marina | **Pacific Heights** |
| Vedanta New Temple, 2323 Vallejo | — | Marina | **Pacific Heights** |
| Casebolt House, 2727 Pierce | SF Landmark No. 51 (1973) | **Pacific Heights** | **Pacific Heights** |

Casebolt is the interesting one and runs the other way: **both DataSF layers put it in Pacific
Heights, but Wikipedia's article opens "Casebolt House is a historic residence in the Cow Hollow
district"** and the Cow Hollow Association's own boundary (per the Wikipedia extent section)
claims everything north of Pacific and west of Pierce — which is exactly this lot. Built c. 1865
for Henry Casebolt (c. 1816–1892), a Virginia-born blacksmith who owned the Sutter, Polk and
Larkin Street cable lines; architects Hoagland and Newsom; four storeys, roughly 5,875 sq ft,
built partly from salvaged material. **Wikipedia also calls it "the oldest house in the
neighborhood" — a ranking; it does not publish under any circumstances.**
<https://en.wikipedia.org/wiki/Casebolt_House>

### 5c. The Lyon Street Steps
The Broadway end is Pacific Heights on both layers; the Washington end is Presidio (analysis) and
Presidio Heights (SF Find). The stair is a single object crossing three units, one of which is a
separate in-scope page. **Flagged for the Presidio finder as well.**

### 5d. Fillmore Street itself
The street runs the length of five in-scope or adjacent zones. Pacific Heights, Japantown and the
Marina all have a real claim to a Fillmore Street entry. **Do not let three pages each write "the
street".**

---

## 6. ORPHANS — no in-scope zone owns them

The roster's twenty neighborhoods leave four inhabited units unclaimed on the analysis layer:
**Presidio Heights, Western Addition, Cathedral Hill (SF Find only) and Cow Hollow (SF Find only,
folded into Marina by the analysis layer).** Cow Hollow resolves to the Marina; the other three do
not resolve to anything. The following carry citable identifiers and will otherwise be lost:

- **Swedenborgian Church** — 2107 Lyon Street (sanctuary and garden) / 3200 Washington Street
  (office and mail), at Lyon and Washington. **A National Historic Landmark, NRHP reference number
  04001154, designated 2004.** Built 1895; the first pastor, Rev. Joseph Worcester (1836–1913),
  bought the land and worked on the design with A. C. Schweinfurth, A. Page Brown, Bernard
  Maybeck, William Keith and Bruce Porter. Church, parsonage and parish house around a garden;
  arched Lyon Street portico, tile roof, thick brick walls, exposed heavy timbers of madrone clad
  in Douglas fir, hand-wrought iron hinges on tongue-and-groove oak doors. Office and visiting
  hours Monday–Friday 10am–6pm and Sunday noon–2pm, closed major holidays except Sundays; Sunday
  worship 11am–noon; drop-in looks welcome during office hours and in-depth tours by arrangement;
  (415) 346-6466. <https://www.sfswedenborgian.org/contact/>,
  <https://en.wikipedia.org/wiki/Swedenborgian_Church_(San_Francisco)>
  **Both DataSF layers say Presidio Heights. Wikipedia's own first sentence says "in the Pacific
  Heights neighborhood of San Francisco".** This is the single most valuable orphan in the area —
  an NHL that is genuinely open, welcomes visitors, and states its hours. If the arbitrator lets
  Pacific Heights reach one block past its polygon anywhere, it should be here. **Superlative
  warning: every write-up of this building reaches for "one of California's earliest pure Arts and
  Crafts buildings" and "Maybeck's only…". Neither publishes.**
- **Roos House**, 3500 Jackson Street — **San Francisco Landmark No. 56 (1973); NRHP 09000805
  (2009)**. Built 1909, **Bernard Maybeck**, Tudor Revival with Gothic ornament, three storeys over
  basement, 9,000 sq ft, T-plan; Maybeck also designed its light fittings and some furniture. The
  rear garden, also Maybeck's, was sold off in 1989 to fund Loma Prieta repairs. Presidio Heights
  on both. <https://en.wikipedia.org/wiki/Roos_House_(San_Francisco)>
- **Koshland House ("Le Petit Trianon")**, 3800 Washington Street — **San Francisco Landmark
  No. 95, designated 9 July 1977; NRHP 84001186, 9 December 1983** (the NPS layer certifies
  1984-01-05; the two dates differ and the verifier should pick the NPS one). Built 1902–04 for
  Marcus and Corinne Koshland, modelled on the Petit Trianon after a 1900 European tour. Corinne
  Koshland's musical evenings supported the founding of the San Francisco Symphony and Opera;
  Menuhin, Stern, Bernstein, Heifetz, Monteux and Stravinsky were guests. Presidio Heights on both.
  Wikipedia calls it "one of San Francisco's most prominent and celebrated homes" — **a ranking.**
  <https://en.wikipedia.org/wiki/Koshland_House>
- **Trinity Episcopal Church**, 1668 Bush Street — **San Francisco Landmark No. 65 (1974)**.
  analysis Western Addition / SF Find Cathedral Hill.
- **Audium**, 1616 Bush Street — analysis Western Addition / SF Find Cathedral Hill. A
  purpose-built sound-sculpture theatre: **176 speakers, 49 seats, performances in darkness**, open
  most weekends with the schedule posted about two weeks ahead. Founded by Stan Shaff; the current
  programme is *Audium V: Rewind*, remixed by David Shaff. No designation.
  <https://www.audium.org/>. Nothing else in San Francisco is like it and no in-scope page owns it.
  Worth raising with the arbitrator.
- **Cathedral of St. Mary of the Assumption**, 1111 Gough Street — analysis Western Addition /
  SF Find Cathedral Hill. Not researched further; no designation found.
- **Hotel Majestic** (1500 Sutter) and **Queen Anne Hotel** (1590 Sutter) — Cathedral Hill on
  SF Find; Western Addition and Japantown respectively on the analysis layer.
- **Wolski House** (3655 Clay) and **Russell House** (3778 Washington) — Presidio Heights on both,
  and both carry `landmarkno = 0` in the Article 10 dataset, i.e. **no number, no claim**.
- **Julius Kahn Playground**, **Spruce** (3640 Sacramento), **San Francisco University High
  School** (3065 Jackson) — Presidio Heights on both.
- **Paige Motor Car Co. Building**, 1699 Van Ness Avenue — NRHP **83001234** (1983). The NPS point
  falls inside the Pacific Heights polygon on both layers; a reader would call it Van Ness. Weak
  but citable.

---

## 7. Guide or town page — my judgement

**Guide.** Pacific Heights carries a museum with published tour times and admission, two
twelve-acre parks with DataSF acreage, two Article 10 landmark districts, twenty-eight numbered
city landmarks, twenty-one National Register references and a shopping street with a sourced
gradient. That is enough material for sections, a walk and a FAQ; a bare town page would waste it.

The shape I would suggest, if it helps the writer: the Haas-Lilienthal House as the one interior;
the two parks as the two open spaces; a mansions section built on numbers rather than adjectives;
a Fillmore Street section anchored on the counterbalance grade and the 1907–43 arches; and a
short, honest note that most of the great houses are private and no source states hours for them.

**Two structural cautions for whoever writes it.**

First, **this zone is a superlative minefield.** Almost every source sentence about Pacific Heights
is a wealth ranking — "one of the most expensive neighborhoods in the United States", "one of the
ten most expensive neighborhoods in San Francisco", "the oldest house in the neighborhood",
"Maybeck's only…", "one of California's earliest pure Arts and Crafts buildings", "San Francisco's
most prominent architectural landmarks". The regex in
`test/ethos/seeds/san_francisco_seed_data_test.exs` catches `one of the (most|best|finest|largest|oldest|greatest)`,
`[A-Z][a-z]+'s only`, and `(only|first|oldest|…) … (in|of|on) (the )?(city|neighborhood|San Francisco|California|…)`,
but it will not catch every paraphrase. The page must be written from dates, counts, measurements
and register numbers, and from nothing else.

Second, **the designation rule cuts both ways here.** There are forty-two identifiers, so most of
the marquee subjects can carry a claim — but St. Dominic's, Hotel Drisco, the Lyon Street Steps,
the Broadway corridor, Alta Plaza and Lafayette have **no Article 10 number and no NRHP reference**,
and the seven "California Register eligible" districts in §2b are **eligible, not designated**.
A sentence like "Alta Plaza is a designated landmark" would fail the build, and correctly.
Alta Plaza's HALS No. CA-16 is the nearest thing it has to an identifier and is a survey record,
not a protection.

---

## 8. Photographs

Emit `"photos": []` everywhere; photographs are a separate wave. For that wave's benefit:
**everything of consequence in this zone is a BUILDING**, so 17 USC 120(a) covers it and the
simpler Bronx/Queens licence rule applies. I found **no public sculpture or mural in Pacific
Heights that would trigger the artwork blocklist** — the Balmy Alley, Clarion Alley, Cupid's Span,
Vaillancourt and Goldsworthy problems are all in other zones. The Peace Pagoda, which is a
sculpture, is Japantown's.

Best photographic subjects, all from public streets: the Haas-Lilienthal House gable and turret
from Franklin Street; the Spreckels Mansion from the Lafayette Park side of Washington (the hedge
is the framing problem, not the copyright); the Alta Plaza south terraces; the Lyon Street Steps
looking north to the Bay; Calvary Presbyterian's portico at Fillmore and Jackson; the Swedenborgian
Church's Lyon Street portico, if the arbitrator gives us the church.

---

## 9. Sources

- DataSF Socrata `97yj-54sx` — Landmarks Listed in Article 10 of the San Francisco Planning Code
  (370 rows). <https://data.sfgov.org/resource/97yj-54sx.json>
- DataSF Socrata `63x5-g3m4` — Historic Districts (fields `a10`, `nr`, `cr`, `pos_1`, `link`).
- DataSF Socrata `j2bu-swwd` — Analysis Neighborhoods, 41 polygons **with geometry**. Note that
  `p5b7-5n3h`, the other "Analysis Neighborhoods" dataset, is the one the Fisherman's Wharf finder
  found returning empty rows.
- DataSF Socrata `pty2-tcw4` — SF Find Neighborhoods, 117 polygons.
- DataSF Socrata `gtr9-ntp6` — Recreation and Parks Properties, 255 rows, four neighborhood
  attributions per property plus acreage and address.
- NPS `https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer/{0,1}/query`
  — authoritative NRHP reference numbers, certification dates and NHL flags.
- SF Planning designation reports, `https://sfplanninggis.org/docs/landmarks_and_districts/LM<N>.pdf`
  (older) and `https://files.sfplanning.org/documents/preservation/LM<N>.pdf` (recent).
- SF Heritage / Haas-Lilienthal House: <https://www.sfheritage.org/>,
  <https://www.haas-lilienthalhouse.org/>, <https://www.haas-lilienthalhouse.org/house-tours>,
  <https://www.haas-lilienthalhouse.org/walking-tours>
- Swedenborgian Church: <https://www.sfswedenborgian.org/contact/>
- Congregation Sherith Israel: <https://www.sherithisrael.org/>
- St. Dominic's: <https://www.stdominics.org/>
- Audium: <https://www.audium.org/>
- b. patisserie: <https://bpatisserie.com/> · SPQR: <https://www.spqrsf.com/> ·
  Pizzeria Delfina: <https://www.pizzeriadelfina.com/> · Hotel Drisco: <https://www.hoteldrisco.com/> ·
  Convent & Stuart Hall: <https://www.sacredsf.org/>
- Wikipedia articles cited inline: Pacific Heights, Haas–Lilienthal House, Spreckels Mansion,
  Whittier Mansion, Bourn Mansion, Atherton House, Casebolt House, Calvary Presbyterian Church,
  Congregation Sherith Israel, Lafayette Park, Alta Plaza Park, Fillmore Street, Fillmore District,
  Clay Theatre, Alhambra Theatre, Metro Theatre, Bush Street–Cottage Row Historic District,
  Swedenborgian Church, Roos House, Koshland House, Kinmon Gakuen, Hamlin School,
  Vedanta Society of Northern California, Consulate General of Russia, James C. Flood Mansion,
  List of San Francisco Designated Landmarks, NRHP listings in San Francisco.

**Provenance note on Nominatim.** It answered for the programme during scoping on 2026-09-03 but
returned 429 for every request I made, including a single probe with a descriptive User-Agent and
a five-second backoff. Nothing in this file rests on it. The second authority used throughout is
DataSF's SF Find Neighborhoods layer, which is independent of the Analysis Neighborhoods layer and
carries the vernacular units the official 41 collapse. Where a third reading was available — the
Recreation and Parks Properties row — I recorded all four of its attributions rather than the one
that suited.
