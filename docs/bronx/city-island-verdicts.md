# City Island — verdicts

Role: INDEPENDENT VERIFIER. The finder's reasoning was not consulted beyond the
artifact itself. Every line below is a verdict: `confirmed`, `refuted`, or
`uncertain`. Where a claim is refuted or corrected, the source's actual wording
and the URL re-fetched are given.

Input: `docs/bronx/city-island-finder.md`.
Method: WebFetch re-fetch of every cited URL carrying a number, date, name or
superlative, plus direct `curl` against the DOHMH Socrata endpoint
(`43nn-pn8j`) to re-run the finder's negative queries. WebSearch not used
(exhausted). `nycgovparks.org` and `web.archive.org` not attempted.

**Headline: this is not a clean pass.** Four claims are refuted, five corrected,
three uncertain. Two of the refutations change the shape of the page — one
dissolves the Sammy's discrepancy and fixes a slug, one reclassifies an
"excluded, does not exist" business into the DOHMH-only bucket. Five landmarked
houses the finder declined to write up survive on the survival test, and one
yacht club the finder excluded survives on the same evidentiary pattern the
finder itself accepted elsewhere.

---

## A. Neighborhood-level history and orientation

Source re-fetched: https://en.wikipedia.org/wiki/City_Island,_Bronx

| # | Claim | Verdict |
|---|---|---|
| A1 | Island/neighborhood in the northeastern Bronx, ~1.5 mi (2.4 km) long by 0.5 mi (0.80 km) wide | `confirmed` |
| A2 | Land area 0.395 sq mi (1.02 km²) | `confirmed` |
| A3 | "at the extreme western end of Long Island Sound, south of Pelham Bay Park and east of Eastchester Bay" | `confirmed` (verbatim) |
| A4 | Bronx Community District 10; ZIP 10464 | `confirmed` — note the article says "Community **District** 10", not "Community Board 10". Use "Community District 10". |
| A5 | Pre-colonial Native American inhabitation, possibly the Wiechquaeskeck band of the Lenape; shell middens from oysters and clams | `confirmed` |
| A6 | 1654 — Thomas Pell established ownership via treaty signed by five Lenape sachems | `confirmed`. Article adds "English physician Thomas Pell". |
| A7 | 1761 — Benjamin Palmer purchased the island, renamed it "New City Island", later shortened | `confirmed`. Article says "Benjamin Palmer of New York" and "later dropping the 'New.'" It does **not** attribute the prior names "Minnewits"/"Minneford" in this sentence — see A7b. |
| A7b | Prior name "Minnewits"/"Minneford" attached to the 1761 renaming | `uncertain` — the renaming sentence names neither. "Minneford Island" as an earlier name is separately confirmed from the Rodman's Neck article (E5). Do not publish the two as one sentence. |
| A8 | Annexed to the town of Pelham, Westchester County, 1819 | `confirmed` |
| A9 | "narrowly voted to become a part of New York City in 1895, in exchange for a new bridge" | `confirmed`. Full text: "in exchange for a new bridge **to the mainland**". |
| A10 | Consolidated as part of the Bronx in 1898 | `confirmed` |
| A11 | "In the mid-20th century, City Island developed as a shipbuilding community, before becoming a daytrippers' destination" | `confirmed` (verbatim) |
| A12 | Boating industry declining; boatyards sold and converted into condominiums | `confirmed` |
| A13 | 2020 Census population 4,417 | `confirmed` |
| A14 | Hart Island east (uninhabited); High Island northeast; Stepping Stones Light off the southern tip | `confirmed`. Article adds that the water between City Island and Hart Island is City Island Harbor, and that Stepping Stones Light marks "the main shipping channel into New York". |
| A15 | Small rope ferry began operating 1760 | `confirmed` — "Starting in 1760, a small rope ferry ran between the mainland and City Island". |
| A16 | Belden Point named for William Belden, who opened an amusement park and resort in 1887 | `confirmed`. Article specifies Belden was "a developer". |
| A17 | Early-20th-century recreation spot for Vincent Astor, J.P. Morgan, William Randolph Hearst | `confirmed` — "favored recreation location for business tycoons including…". The finder's "early-20th-century" framing is not in the quoted sentence; publish without the date qualifier. |
| A18 | 1910–1914 IRT monorail; first journey July 1910 ended with the monorail toppling on its side | `confirmed`. Article gives the end date precisely: "ceased operation on April 3, 1914". |
| A19 | Pelham Park & City Island Railway operated 1887–1919 | `confirmed`. Article: "connected City Island to Pelham Bay Park from 1887 to 1919". |
| A20 | *The Island Current* first printed October 1971 | `confirmed` — "The first issue was printed in October 1971". |
| A21 | cityisland.com describes the island as "a small community at the edge of New York City located just beyond Pelham Bay Park in the Bronx and surrounded by the waters of the Long Island Sound" | `confirmed` (re-fetched http://www.cityisland.com). Note the source page reads "in th Bronx" — a typo in the original. Do not reproduce the quotation verbatim; paraphrase or silently correct. |

**Surviving claims in this block: 21 of 22** (A7b uncertain).

---

## B. Shipbuilding, yacht clubs, and the America's Cup

| # | Claim | Verdict |
|---|---|---|
| B1 | "Many of the boats which competed and won in the America's Cup in years past were built in the Nevins Boat Yard on City Island" | `confirmed` (verbatim) — https://en.wikipedia.org/wiki/City_Island,_Bronx |
| B2 | Museum's own site: exhibits include America's Cup winners, "many of which were built on City Island"; maritime legacy spanning "a century of boat building and sail making" | `confirmed` — https://www.cityislandmuseum.org/ . Exact text: "the Museum's newest exhibit on America's Cup winners, many of which were built on City Island." |
| B3 | Henry B. Nevins founded his company on City Island in 1907 at age 29, after purchasing the Hansen Boat Yard | `confirmed` — "At age 29, Nevins bought the nearby Hansen Boat Yard in City Island in 1907 and founded Henry B. Nevins, Incorporated." https://en.wikipedia.org/wiki/Henry_B._Nevins |
| B4 | He later acquired the adjacent Byles Yard | `confirmed` — "Later Nevins would purchase the nearby Byles Yard to increase his acreage." Note "nearby", not "adjacent". |
| B5 | Nevins yard, with naval architect George Crouch, built *Baby Bootlegger*, winner of the APBA Gold Cup 1924 and 1925 | `confirmed` |
| B6 | Nevins built minesweepers during WWII alongside custom cruising and racing craft | `confirmed` |
| B7 | **Finder's flag:** Nevins's own article does not mention the America's Cup | `confirmed` — re-fetched and searched; the article makes no mention of the America's Cup anywhere. **See ruling 5 below: this is silence, not contradiction. B1 stands on its own source.** |
| B8 | Consolidated Yachts / Consolidated Shipbuilding Corporation formed June 1896 by merger of Charles L. Seabury Company (founded 1885, Nyack NY) and Gas Engine & Power Company (Morris Heights, Bronx) | `confirmed` — https://en.wikipedia.org/wiki/Consolidated_Shipbuilding_Corporation |
| B9 | Relocated to City Island, to the former Robert Jacobs shipyard, after WWII | `confirmed` — "Upon the conclusion of World War II, the company moved from Morris Heights to the former Robert Jacobs shipyard on City Island". |
| B10 | July 16, 1908 launch of "the largest yacht in the world driven by motor power"; 111 ft, 21-ft beam, 260 hp | `confirmed`. Note this is the source reporting a contemporaneous description; it is a quoted characterisation, not an independent superlative. Attribute it as such. |
| B11 | 475-ton steam yacht *Kanahwa* (1899) for John P. Duncan, converted to USS *Piqua* 1917 | `confirmed` |
| B12 | WWII: tugboats and 51 of the 343 PC-461-class submarine chasers; up to 3,000 workers | `confirmed` — "51 of 343"; "as many as 3,000 skilled tradespeople". |
| B13 | Ceased shipbuilding 1958, becoming a marine-service company | `confirmed` (1958 confirmed) |
| B14 | Harlem Yacht Club incorporated 1883; "the third oldest continuously functioning yacht club in New York City" after NYYC (1844) and Williamsburgh YC (1871) | `confirmed`. Exact wording is "in the City of New York". This is a superlative carried by the source; per the ninth rule it may ship only in the source's own words. |
| B15 | Purchased City Island property 1894; station on Hunter Avenue | `confirmed` |
| B16 | Victorian clubhouse built 1898–1899 | `confirmed` — construction began 1898, opened June 1899. |
| B17 | A fire destroyed it and the current three-story clubhouse was built in 1915 | `confirmed`, **with a correction available**: the source dates the fire precisely to **May 29, 1915**, and the current structure was built the same year. Publish the precise date if the clause is used. |
| B18 | 1901 *New York Times*: "in place of the fishing smacks and oyster boats that once anchored in East Chester Bay is the fleet of the Harlem Yacht Club" | `confirmed` (verbatim) |
| B19 | Hosted the first Star-class regatta in 1911; Star class became an Olympic sailing class in 1932 | `confirmed` |
| B20 | Memorial Day Regatta marked the start of the racing season "on Long Island Sound" for over 60 years | **`refuted` as worded — correction supplied.** The source says the race "was considered to be the start of the yacht racing season in **western** Long Island Sound". The finder dropped "western", widening a regional claim. Publish "western Long Island Sound". https://en.wikipedia.org/wiki/Harlem_Yacht_Club |
| B21 | 70 yachts took part in an 1892 regatta | `confirmed` — "Seventy yachts participated". |
| B22 | Three yacht clubs on the island today: Harlem YC, City Island YC, Morris Yacht and Beach Club | `confirmed`, and **incomplete**: the same sentence also names "Barron's Boatyard, the North Minneford Yacht Club and the South Minneford Yacht Club… on the east side". Do not publish "three yacht clubs" as an exhaustive count. |
| B23 | Morris Yacht & Beach Club carries a DOHMH record at 25 City Island Avenue | `confirmed` — DOHMH row `MORRIS YACHT & BEACH CLUB | 25 | CITY ISLAND AVENUE`, zip 10464. Existence/address evidence only. |

**Surviving claims in this block: 22 of 23** (B20 refuted, correction supplied
and usable).

---

## C. Boundary and identity flags raised by the finder

| # | Item | Verdict |
|---|---|---|
| C1 | The City Island Bridge spans a boundary: eastern end on City Island, western end on Rodman's Neck inside Pelham Bay Park | `confirmed`. The bridge article: it connects "City Island with Rodman's Neck on the mainland." The Rodman's Neck article places the wooded portion within Pelham Bay Park. **See ruling 4.** |
| C2 | An unresolved name/address discrepancy between "Sammy's Fish Box" (41 City Island Ave, own site) and DOHMH's "SAMMY'S ORIGINAL SHRIMP BOX" (64 City Island Ave) | **`refuted` — the discrepancy does not exist.** Re-running the DOHMH query for zip 10464 returns **both** rows: `SAMMY'S FISHBOX | 41 | CITY ISLAND AVENUE` **and** `SAMMY'S ORIGINAL SHRIMP BOX | 64 | CITY ISLAND AVENUE`. They are two separate businesses at two separate addresses. The finder's query surfaced only the second. **See ruling 2.** Source: `https://data.cityofnewyork.us/resource/43nn-pn8j.json?$where=zipcode='10464'` |

---

## D. Getting there

| # | Claim | Verdict |
|---|---|---|
| D1 | No subway reaches City Island; nearest station is Pelham Bay Park at Bruckner Expressway and Westchester Avenue | `confirmed` — https://en.wikipedia.org/wiki/Pelham_Bay_Park_station and the main City Island article |
| D2 | Served by the 6 at all times, with `<6>` express during weekday peak hours in the peak direction | `confirmed` |
| D3 | Northern terminus of the IRT Pelham Line | `confirmed` |
| D4 | Bx29 western terminal "City Island Avenue and Rochelle Street"; eastern terminal Bruckner Boulevard at Pelham Bay Park station, connecting to the 6; runs 24 hours | `confirmed` — https://en.wikipedia.org/wiki/Bx29 |
| D5 | Main article: island transit is "the Bx29 bus route to Pelham Bay Park station" plus "two rush-hour BxM8 express trips to Manhattan" | `confirmed` in substance. Exact text: "two rush-hour extended **round-trips** of the BxM8 express route". "Trips" understates it; publish "round-trips". |
| D6 | Pelham Bay Park station additionally served by Bx5, Bx12, Bx12 SBS, Bx24, Bx29 (NYCT); Bx23, Q50, BxM8 (MTA Bus); Bee-Line 45 | `confirmed`, with the categorisation exactly as the finder gives it |
| D7 | Station elevators installed December 1989, "one of the earliest to comply with the Americans with Disabilities Act of 1990" | `confirmed` (verbatim) |
| D8 | A pedestrian bridge from the station crosses the Bruckner Expressway into Pelham Bay Park, giving access toward Orchard Beach, Hunter Island, the Bartow-Pell Mansion, **and City Island** | **`refuted` in part — correction supplied.** The source says only: "There is also a pedestrian bridge from the station entrance that crosses the Bruckner Expressway and leads to Pelham Bay Park." Bartow-Pell Mansion, Hunter Island and Orchard Beach are named as points of interest **within the park**; **City Island is listed separately as a nearby point of interest and is not stated to be reachable via this bridge** — and could not be, since the only road link is the City Island Bridge. Corrected claim: *a pedestrian bridge from the station crosses the Bruckner Expressway and leads into Pelham Bay Park.* https://en.wikipedia.org/wiki/Pelham_Bay_Park_station |
| D9 | Metro-North: nothing fetched names a station serving City Island or Pelham Bay Park | `confirmed` as a statement about the pass. Not publishable as a fact that none exists. |
| D10 | NYC Ferry: no route serves City Island, Pelham Bay or Orchard Beach; the article notes residents "advocated for a stop there" but does not state service was established | `confirmed` — https://en.wikipedia.org/wiki/NYC_Ferry . Publishable only as the advocacy fact, not as "no ferry exists". |
| D11 | The City Island Bridge is the only road connection to the mainland | `confirmed` — Pelham Bay Park article: "Two small land berms between Rodman's Neck and City Island consist of the island's only connecting road to the mainland." |

**Surviving claims in this block: 11 of 11** (D8 survives in corrected form).

---

## E. The Pelham Bay relationship

This block is load-bearing for the Pelham Bay page as well. Every verdict here
is one a link note may trace to.

| # | Claim | Verdict |
|---|---|---|
| E1 | City Island sits south of Pelham Bay Park | `confirmed` |
| E2 | Pelham Bay Park: 2,772 acres, 13 miles of shoreline | `confirmed` — "2,772 acres (1,122 hectares)"; "13 miles (21 km) of shoreline" |
| E3 | Hunter Island, Twin Island and Two Trees Island connected to the mainland by 1930s landfill during the Orchard Beach development | `confirmed`. The source dates the Twin Islands landfill specifically to **1937**. |
| E4 | Pelham Bay "connects to Eastchester Bay at the south, and opens onto Long Island Sound and City Island Harbor at the east," lying between City Island and Orchard Beach | `confirmed` (verbatim) |
| E5 | "Two small land berms between Rodman's Neck and City Island consist of the island's only connecting road to the mainland" | `confirmed` (verbatim) — https://en.wikipedia.org/wiki/Pelham_Bay_Park |
| E6 | Rodman's Neck, the bridge's mainland landing, was formerly "Ann Hook's Neck", and was included in Thomas Pell's 1654 purchase — the same transaction in City Island's history | `confirmed` — "Rodman's Neck (formerly Ann Hook's Neck)"; "The land was included in the purchase made by Thomas Pell in 1654." Both articles name 1654 and Pell independently. https://en.wikipedia.org/wiki/Rodman%27s_Neck |
| E7 | Samuel Rodman operated a ferry connecting Minneford Island (City Island) to "Anne's Hoeck", at the site where the current bridge stands | `confirmed` — the article places the ferry "where the bridge is now". |
| E8 | Rodman's Neck's southern third (54 acres) is an NYPD firing range used by multiple agencies including the FBI and ICE; the rest is wooded parkland within Pelham Bay Park | `confirmed` on all counts. Source also names Fire Department Fire Marshals and the Correction Department, and notes the range portion was separated by eminent domain in the late 1980s. |
| E9 | Rodman's Neck's northern side connects to former Hunter Island and Twin Island, "now forming Orchard Beach and its parking area" | `confirmed`. Exact wording: "The north side is joined to what used to be **Hunters** Island and Twin Island to form Orchard Beach and a parking lot." |
| E10 | Orchard Beach sits within Pelham Bay Park on the western end of Long Island Sound; 1.1 miles long, 115 acres; "is adjacent to City Island, from which sewage once seeped onto the beach" | Dimensions and location `confirmed` ("115-acre (47 ha), 1.1-mile-long (1.8 km)"). The quoted clause is **corrected**: the source reads "Sewage from **nearby** City Island also seeped onto the beach, and Moses threatened to close the beach until the city agreed to build a new sewage pipe for the island." The word "adjacent" and the quotation marks around the finder's phrasing are the finder's, not the source's. Publish adjacency as *nearby*, and the sewage fact in the source's own terms. https://en.wikipedia.org/wiki/Orchard_Beach_(Bronx) |
| E11 | Orchard Beach dedicated (incomplete) July 1936, officially opened June 25, 1937, fully completed 1938, under Moses's 1930s landfill expansion | `confirmed` |
| E12 | Orchard Beach promenade and bathhouse designated a NYC landmark by the LPC in 2006 | `confirmed` — the designation covers "the promenade and bathhouse", 2006. |
| E13 | Orchard Beach transit: Bx12 seasonally; Bx29 (the City Island route) "year-round nearby"; Pelham Bay Park station via 6 and `<6>` across the Hutchinson River | `confirmed`. Precise wording: "The Bx12 bus serves Orchard Beach during **summer weekends**. The Bx29 bus to City Island runs nearby year-round." Publish "summer weekends" rather than "seasonally". |

**Surviving claims in this block: 13 of 13** (E10 survives in corrected form).
**All six Pelham Bay relationship threads named in the dispatch are confirmed —
see ruling 6.**

---

## F. City Island Bridge — full history

Source re-fetched twice, including the infobox: https://en.wikipedia.org/wiki/City_Island_Bridge

| # | Claim | Verdict |
|---|---|---|
| F1 | Construction of the original bridge began 1898 | **`uncertain` — the source contradicts itself.** Its prose reads "was begun in 1898 and completed in 1901"; its infobox field "Construction start" reads **1899**. Neither is corroborated elsewhere in this pass. Per the authoring contract an uncertain specific may be kept only by removing it: publish the completion date and omit the start year. |
| F2 | Completed and opened July 4, 1901 | `confirmed` (prose and infobox agree) |
| F3 | Built of stone and steel | `confirmed` — "Steel and stone" |
| F4 | 950 feet long | `confirmed` — infobox "Total length: 950 feet (290 m)" |
| F5 | 7 spans | `confirmed` as the infobox value ("No. of spans: 7"), but **flagged**: the prose describes "five fixed spans and a central swing section", which totals six. The two do not reconcile. Publish the prose configuration, not the number. |
| F6 | Cost $200,000 (about $7.74 million in 2025 dollars) | **corrected.** The article says "a **projected** cost of $200,000" — a projection, not a settled cost. The 2025 equivalent "$7,740,000" is confirmed as the source's own conversion of that figure. Publish as a projected cost. |
| F7 | A swing bridge: five fixed spans plus one central swing section allowing ship passage | `confirmed` (verbatim) |
| F8 | Sole vehicle entry/exit point for the island | `confirmed` — "The bridge was the sole entry and exit for vehicles on City Island." |
| F9 | Swing mechanism deactivated and fixed permanently in place in 1963 | `confirmed` — "The swing section was deactivated and turned into a fixed span in 1963." |
| F10 | Managed by the NYC Department of Transportation | `confirmed` |
| F11 | By 2002 it showed significant corrosion, prompting replacement discussions | `confirmed` — "By 2002, the bridge was in bad shape, and city leaders held a meeting about the deteriorating bridge, showing images of corrosion on the supports." |
| F12 | Initial replacement was a cable-stayed design with a 150-foot tower; estimated $50 million in 2005, $120 million by 2009 | `confirmed` |
| F13 | Community opposition to the tower's height led the city to choose a causeway design in May 2014, reducing cost | `confirmed` in substance — "chose to go with a slightly cheaper and much shorter causeway-style bridge". |
| F14 | A temporary steel bridge erected 2015 partially collapsed that September, delaying opening | `confirmed` — note the source says the collapse "delayed the opening of the **temporary** bridge", not of the new permanent bridge. Do not conflate. |
| F15 | The original 1901 bridge closed December 18, 2015 | `confirmed` |
| F16 | The new causeway bridge opened October 29, 2017 | `confirmed` |
| F17 | Final contractor bid $102.7 million; contractor Tutor Perini | `confirmed` |
| F18 | 2016 data: 14,473 vehicles daily | `confirmed` |

**Surviving claims in this block: 17 of 18** (F1 uncertain and must be dropped;
F5 and F6 survive in corrected/narrowed form).

---

## Places

### Place 1 — City Island Nautical Museum (Public School 17 building)

Identity: **confirmed.** Name and address established by two independent
sources — the Wikipedia article for the building and the museum's own site,
which agree on 190 Fordham Street. **Survives.**

| # | Claim | Verdict |
|---|---|---|
| 1.1 | Museum occupies the former Public School 17 building at 190 Fordham Street, City Island | `confirmed` — https://en.wikipedia.org/wiki/Public_School_17 ("190 Fordham Street, Bronx, New York") and https://www.cityislandmuseum.org/ ("190 Fordham Street, City Island, NY 10464") |
| 1.2 | Built 1897, architect C. B. J. Snyder | `confirmed` |
| 1.3 | Neo-Georgian style | **corrected.** The article gives the style as "**Gothic, Neo-Georgian**". Publish both or neither; "Neo-Georgian" alone is a partial restatement. Per the ninth rule, architectural style is exactly the clause a verifier must pin — this one is pinned to the two-part form. |
| 1.4 | "a two-story, five-bay brick building on a high basement" with Doric columns at its entrance | `confirmed` — the source specifies "a shallow wooden entrance porch with Doric order columns". |
| 1.5 | Rear addition added 1930 | `confirmed` |
| 1.6 | Served as a school until 1975 | `confirmed` |
| 1.7 | Listed on the NRHP September 27, 1984, reference no. 84002065 | `confirmed` |
| 1.8 | The museum opened in 1976 | `confirmed` |
| 1.9 | City sold the building to developer Haim Joseph in the 1980s for condominium conversion | `confirmed`, with an available addition: the sale price was **$500,000**. |
| 1.10 | "the museum and a community center received a 99-year rent-free lease, and reopened in 1995 after renovations" | `confirmed` (verbatim) |
| 1.11 | Operated by the City Island Historical Society | `confirmed` |
| 1.12 | A vandal-set fire on July 13, 2007 damaged the building's façade | `confirmed` — "A fire **allegedly** set by vandals on July 13, 2007". Keep "allegedly" or drop the attribution of cause. |
| 1.13 | Own site: exhibits include America's Cup winners "many of which were built on City Island"; maritime artifacts, photographs, navigational instruments; "a century of boat building and sail making" | `confirmed` as the museum's description of its own holdings — permitted under rule 4 (what it is, what it shows, where). Source also names "Permanent Collection Galleries, including the Community and Nautical Rooms" and historic vessels. |
| 1.14 | Own site: seasonal hours (last Saturday of April to last weekend of October, weekends 1–4 PM) and admission (members free, adults $10, children under 12 free) | `confirmed` **as the site's own statement only**. Per rule 4 this cannot establish that the museum is currently trading, and hours/prices are volatile. Recommend not publishing prices; hours may ship only if attributed as the museum's own posted schedule. |

**Surviving claims: 14 of 14** (1.3 corrected, 1.12 narrowed, 1.14 restricted in use).

---

### Place 2 — Grace Episcopal Church

Identity: **confirmed.** Name and address on a dedicated Wikipedia article and
independently on the boroughwide NRHP listings page, which agree on 116 City
Island Avenue. **Survives.**

| # | Claim | Verdict |
|---|---|---|
| 2.1 | 116 City Island Avenue, City Island, Bronx | `confirmed` — dedicated article and https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx ("116 City Island Ave.") |
| 2.2 | Founded and built 1862; church Carpenter Gothic, rectory (also c. 1862) Italianate | `confirmed`. The source also gives the rectory as "Italian Villa style" — the two are given together; publish "Italianate" alone only, as the finder did, or both. |
| 2.3 | Listed on the NRHP September 13, 2006, reference no. 06000820 | `confirmed` **twice independently** — the dedicated article and the boroughwide NRHP list agree on date and reference number. |
| 2.4 | The main City Island article names St. Mary Star of the Sea RC Church, Trinity United Methodist Church, Grace Episcopal Church, and Temple Beth El (founded 1934) | `confirmed`, with corrections to two names: the source reads "**Saint Mary Star of the Sea Holy Roman Catholic Church**" and describes Temple Beth El as "a non-denominational liberal synagogue". The source frames these as "four houses of worship". |

**Surviving claims: 4 of 4.**

---

### Place 3 — House at 175 Belden Street

Identity: **confirmed.** Dedicated Wikipedia article plus two independent
boroughwide lists (NYC landmarks and NRHP), all agreeing on 175 Belden Street.
**Survives.**

| # | Claim | Verdict |
|---|---|---|
| 3.1 | 175 Belden Street, City Island | `confirmed` three ways — dedicated article ("175 Belden St., Bronx, New York"), NYC landmarks list, NRHP list |
| 3.2 | Built circa 1880; "a simple, small picturesque cottage" with "an asymmetrical cruciform plan" | `confirmed` — "Built about 1880"; the descriptive phrase is verbatim. |
| 3.3 | Designated a NYC Landmark July 28, 1981 (NYCL No. 1082) | `confirmed` on the dedicated article and **independently** on https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx, which gives the same date. This is the pattern the programme has been burned on before — a designation date taken from a secondary footnote rather than the designation record. Here two Wikipedia pages agree and the date is not in dispute. |
| 3.4 | Listed on the NRHP June 3, 1982, reference no. 82003345 | `confirmed` on the dedicated article and independently on the NRHP boroughwide list |
| 3.5 | Finder's "date discrepancy" note across two boroughwide lists | **`refuted` as a discrepancy — there is none.** The 1981 date is the NYC landmark designation; the 1982 date is the National Register listing. They are two different designations by two different bodies, not two versions of one date. The finder's own note concedes they are "consistent"; the framing as a discrepancy is what is refuted. Nothing to correct downstream. |

**Surviving claims: 4 of 4** (3.5 was a non-claim).

---

### Place 4 — Sammy's Fish Box

**Identity: confirmed, and the name/address question is settled. Survives.**

The finder's own site source and the DOHMH dataset **agree**. Re-running the
zip-10464 query returns a row `SAMMY'S FISHBOX | 41 | CITY ISLAND AVENUE`,
matching the own site's 41 City Island Avenue exactly. The separate row
`SAMMY'S ORIGINAL SHRIMP BOX | 64 | CITY ISLAND AVENUE` is a different business
at a different address. The finder's query missed the first row and read the
second as a conflict.

| # | Claim | Verdict |
|---|---|---|
| 4.1 | Name "Sammy's Fish Box"; 41 City Island Ave, Bronx, NY 10464; phone (718) 885-0920 | `confirmed` — https://www.sammysfishbox.com/ for the styled name and phone, DOHMH for independent existence at 41 City Island Avenue. **Publish the name as "Sammy's Fish Box"** (the operator's own styling); DOHMH's "SAMMY'S FISHBOX" is a dataset normalisation, not a naming authority. **Slug: `sammys-fish-box`.** |
| 4.2 | Founded 1966 | `confirmed` **as the restaurant's own statement** — "Since 1966, Sammy's Fish Box has proudly continued the great tradition". Rule 4 permits an own-site founding claim as description; it is not an award, ranking or trading status. Ships attributed or plainly. |
| 4.3 | Serves "fresh seafood, lobster feasts, and waterfront dining", incl. surf and turf, lobster dishes, fried seafood | `confirmed` as own-site description of what it serves — permitted by rule 4. Exact: "Fresh Seafood, Lobster Feasts and Waterfront Dining". |
| 4.4 | "over 55 years" of operation; "legendary" portions | **`uncertain` — excluded.** Correctly flagged by the finder and correctly withheld. The site also carries "World Famous Seafood", "landmark institution" and "iconic, over-the-top seafood platters" — all self-referential superlatives barred by rule 4. None may ship. |
| 4.5 | Currently trading | `uncertain` — no non-own-site evidence of current operation. Per rule 3 this is **not** a closure and the place is **not** deleted. Publish no open/closed status. |

**Surviving claims: 3 of 5** (4.4 and 4.5 uncertain, both correctly excluded
from prose; neither affects survival).

---

### Place 5 — Johnny's Reef Restaurant

**Identity: confirmed. Survives.** Own site gives 2 City Island Ave; DOHMH
independently carries `JOHNNY'S REEF RESTAURANT | 2 | CITY ISLAND AVENUE`,
zip 10464 — an exact address match. The finder did not cite this
corroboration; it exists and it settles identity on non-own-site evidence.

| # | Claim | Verdict |
|---|---|---|
| 5.1 | Name "Johnny's Reef Restaurant"; 2 City Island Ave, Bronx, NY 10464; phone (718) 885-2086 | `confirmed` — https://www.johnnysreefrestaurant.com/ plus the DOHMH row above |
| 5.2 | Cafeteria-style service with Fried Section (fries and coleslaw), Steam Section (Italian bread), Clam Section, Soda Section, and a bar; indoor/outdoor picnic-table seating overlooking the water | `confirmed` as own-site description of what it is and what it serves — permitted by rule 4 |
| 5.3 | "has been serving City Island for over 60 years" | **`uncertain` — excluded.** This is a trading-duration claim on the operator's own site, which rule 4 bars. It cannot ship, not even hedged. |
| 5.4 | Michael Bloomberg quotation about baskets of fried clams | **`uncertain` — excluded, and the finder's note needs correcting.** The finder wrote that the site gives no source for the quote; it does — the site **attributes it to the New York Post**. But the Post piece was not reachable in this pass, so the quotation remains an own-site relay of a third-party attribution. It does not ship. Correction to the finder's characterisation, not to a published claim. |
| 5.5 | Self-described as "named among NYC's best seafood restaurants" and "one of the area's best backyards and patios" | **`uncertain` — excluded.** Correctly flagged. The site actually reproduces four press-list titles ("The 13 best seafood restaurants in NYC", "The 10 best backyards, rooftops and patios…", "NYC's 16 best restaurants for group dining", "18 Fried Seafood Destinations for Fish and Chips"). Rule 4 bars all of them on this evidence; none of the underlying articles was re-fetched. |

**Surviving claims: 2 of 5.** Identity survives on 5.1; the three exclusions are
all rule-4 superlatives and trading claims, and none bears on survival.

---

### Place 6 — The Original Crab Shanty

**Identity: confirmed. Survives.** Own site plus an exact-matching DOHMH row.

| # | Claim | Verdict |
|---|---|---|
| 6.1 | Name "The Original Crab Shanty Restaurant"; 361 City Island Ave, Bronx, NY 10464; phone 718-885-1810 | `confirmed`. Note the site's own heading styles it **"The Original Crab Shanty"**; "Restaurant" appears in the longer form. Either is defensible; prefer "The Original Crab Shanty". https://www.originalcrabshanty.com/ |
| 6.2 | DOHMH row "CRAB SHANTY" at 361 City Island Avenue | `confirmed` — exact address match, zip 10464. Existence and location evidence only. |
| 6.3 | Current operators took over the property in 1977 | `confirmed` as the site's own statement of its own history — permitted by rule 4 |
| 6.4 | Building originally constructed as "a silent movie theater" in the early 1900s | `confirmed` as own-site history. The site adds the detail of distinctive tall ceilings. |
| 6.5 | Later served as the City Island Post Office | `confirmed` as own-site history — "the federal government took the building over and made it into the City Island Post Office, which served The City Island community for many years." |
| 6.6 | A road called "Crab Lane" once ran through what is now the parking lot | `confirmed` as own-site history — "Ironically there was even a road that went though our current parking lot, which was named Crab Lane!!" The site states the road no longer exists. |
| 6.7 | "Voted Best Restaurant in the Bronx 2017" | **`uncertain` — excluded.** Correctly flagged and correctly withheld. The page names no awarding body and rule 4 bars an own-site award outright. |
| 6.8 | `crabshanty.com` (without "original") is a GoDaddy parking page, not this business | `confirmed` as a dead end. Do not link it. |

**Surviving claims: 7 of 8.**

---

## Place 7 — Samuel Pell House

**Identity: confirmed. Survives.** — see ruling 3.

| # | Claim | Verdict |
|---|---|---|
| 7.1 | Samuel Pell House, 586 City Island Avenue | `confirmed` — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx |
| 7.2 | Designated a NYC Landmark October 29, 2002 | `confirmed` (same source, re-fetched) |

**Surviving claims: 2 of 2.**

## Place 8 — William H. Schofield House

**Identity: confirmed. Survives.**

| # | Claim | Verdict |
|---|---|---|
| 8.1 | William H. Schofield House, 65 Schofield Street | `confirmed` |
| 8.2 | Designated April 12, 2012 | `confirmed` |

**Surviving claims: 2 of 2.**

## Place 9 — Captain John H. Stafford House

**Identity: confirmed. Survives.**

| # | Claim | Verdict |
|---|---|---|
| 9.1 | Captain John H. Stafford House, 95 Pell Place | `confirmed` |
| 9.2 | Designated November 28, 2017 | `confirmed` |

**Surviving claims: 2 of 2.**

## Place 10 — Samuel H. and Mary T. Booth House

**Identity: confirmed. Survives.**

| # | Claim | Verdict |
|---|---|---|
| 10.1 | Samuel H. and Mary T. Booth House, 30 Centre Street | `confirmed` |
| 10.2 | Designated November 28, 2017 | `confirmed` |

**Surviving claims: 2 of 2.**

## Place 11 — 21 Tier Street

**Identity: confirmed. Survives.**

| # | Claim | Verdict |
|---|---|---|
| 11.1 | The designated landmark at 21 Tier Street — the list gives "21 Tier Street" as both name and address | `confirmed` |
| 11.2 | Designated June 20, 2000 | `confirmed` |

**Surviving claims: 2 of 2.**

**Note on places 7–11:** each carries exactly two confirmed claims — name with
address, and designation date. That is thin, and under the no-minimum-length
rule a two-sentence entry is a legitimate pass. Nothing about their
architecture, appearance or history is confirmed and none may be invented. Only
what is in the table above may ship.

## Place 12 — City Island Yacht Club

**Identity: confirmed. Survives.** — a place the finder excluded that should
not have been.

| # | Claim | Verdict |
|---|---|---|
| 12.1 | The City Island Yacht Club is one of the yacht clubs on City Island | `confirmed` — named in https://en.wikipedia.org/wiki/City_Island,_Bronx |
| 12.2 | Located at 63 Pilot Street, City Island | `confirmed` — DOHMH row `CITY ISLAND YACHT CLUB | 63 | PILOT STREET`, zip 10464, as existence and address evidence only |

The finder excluded this for "lack of independent material" after its dedicated
Wikipedia article 404'd. But this is **the identical evidentiary pattern the
finder itself accepted for the Morris Yacht & Beach Club** (B23): a name-mention
in the main Wikipedia article plus a DOHMH row supplying the address. Applied
consistently, it clears the survival test — identity plus location, from a
non-DOHMH source for the name and DOHMH for the address. Nothing descriptive
survives; the entry ships on those two facts alone or not at all.

**Surviving claims: 2 of 2.**

---

## Exclusions — was the handling right?

| Item | Finder's handling | Verdict |
|---|---|---|
| **Tony's Pier Restaurant**, 1 City Island Ave | DOHMH-only; excluded from prose | **Right.** DOHMH row confirmed (`TONY'S PIER RESTAURANT | 1 | CITY ISLAND AVENUE`, 10464). Existence only. It does not ship as a place and no category noun may be published. |
| **Seashore Restaurant**, 591 City Island Ave | DOHMH-only; excluded from prose | **Right.** DOHMH row confirmed (`SEASHORE RESTAURANT | 591 | CITY ISLAND AVENUE`, 10464). Same treatment. |
| **"City Island Lobster House"** | "no DOHMH row for any Bronx business with 'LOBSTER' in the name"; excluded as not existing | **`refuted`.** Re-running the query Bronx-wide returns `CITY ISLAND LOBSTER HOUSE | 691 | BRIDGE STREET | 10464`. **Correction: the business exists in DOHMH at 691 Bridge Street, City Island.** The outcome is unchanged — it still does not ship, having no non-DOHMH source — but the *reason* changes: it is a **third DOHMH-only exclusion**, not a name that could not be found. The finder's DOHMH-only count of 2 is wrong; it is **3**. Query: `$where=boro='Bronx' AND upper(dba) like '%LOBSTER%'` against `43nn-pn8j`. |
| **"Artie's Steak & Seafood"** | no DOHMH row for any Bronx business starting "ARTIE"; excluded | **Right, and independently re-verified.** `$where=boro='Bronx' AND upper(dba) like 'ARTIE%'` returns zero rows. Correctly excluded as unconfirmed. |
| **Le Refuge Inn** | domain unreachable, Wikipedia 404; excluded | **Right as an exclusion, but the reasoning must not become a closure.** Per rule 3, an unreachable domain is not positive evidence of closure. `uncertain`, excluded, not recorded as closed. |
| **Pelham Cemetery** | bare photo caption only; excluded | **Right.** A caption with no descriptive text does not establish identity plus location. Not re-chased per dispatch. |
| **Turtle Cove** | "No mention found anywhere in this pass… zero facts found" | **Partially `refuted`.** The zip-10464 DOHMH pull I ran for other purposes returns `TURTLE COVE GOLF CENTER | 1 | CITY ISLAND ROAD`, 10464. **Correction: an entity of that name exists in DOHMH.** It remains DOHMH-only and cannot ship prose, so the exclusion stands — but "zero facts found" is not accurate. Not chased further, per dispatch. |
| **Minneford Yacht Yard** | Wikipedia 404; excluded | **Right,** though note the main City Island article names "the North Minneford Yacht Club and the South Minneford Yacht Club" — different entities from the yard, and no address was found for either. Excluded. |
| **City Island Avenue as a place** | street, not a place record | **Right.** |
| **City Island Yacht Club** | excluded for lack of material | **`refuted` — see Place 12.** It survives. |

---

## The six adjudications

**1. The three restaurants — do their identities survive on non-DOHMH sourcing?**
**All three survive; all three clear it on more than the own site alone.**
- *Sammy's Fish Box* — own site for name/address/phone, **plus** an independent
  DOHMH row at the same address (41 City Island Avenue). Survives.
- *Johnny's Reef Restaurant* — own site, **plus** an exact-matching DOHMH row at
  2 City Island Avenue that the finder did not cite. Survives.
- *The Original Crab Shanty* — own site, plus the DOHMH row at 361 City Island
  Avenue the finder did cite. Survives.
Rule 4 is respected throughout: every award, ranking, superlative and
trading-duration claim from all three sites is excluded (4.4, 5.3, 5.4, 5.5,
6.7). What ships is identity, location, what each serves, and — for Sammy's and
the Crab Shanty — own-site history that is descriptive rather than
self-promotional. No open/closed status ships for any of the three, and per rule
3 none is deleted for want of one.

**2. The Sammy's name/address mismatch — the name, and the slug.**
**There is no mismatch.** Re-running the DOHMH zip-10464 query returns both
`SAMMY'S FISHBOX | 41 | CITY ISLAND AVENUE` and `SAMMY'S ORIGINAL SHRIMP BOX |
64 | CITY ISLAND AVENUE`. Two businesses, two addresses; the finder's query
surfaced only the second and read it as a conflict with the first. The conflict
dissolves on a direct re-query, exactly like the 1900/1901 case in the
programme's history. **Name: "Sammy's Fish Box". Address: 41 City Island
Avenue. Slug: `sammys-fish-box`.** The Shrimp Box at 64 is a separate business,
DOHMH-only in this pass, and must not be merged into this record or published.

**3. The five individually-landmarked houses — do they survive?**
**Yes, all five, and I re-fetched the landmarks list to confirm each name,
address and date independently of the finder.** The survival test is confirmed
identity — current name plus address — for a real, visitable thing, and an LPC
designation record is authoritative for exactly that. Claim count does not
decide survival, and the dispatch says so. Samuel Pell House (586 City Island
Avenue, Oct 29 2002), William H. Schofield House (65 Schofield Street, Apr 12
2012), Captain John H. Stafford House (95 Pell Place, Nov 28 2017), Samuel H.
and Mary T. Booth House (30 Centre Street, Nov 28 2017), and 21 Tier Street
(June 20 2000) all survive. They are thin — two confirmed claims each, nothing
descriptive — and must ship thin. **With these five plus the City Island Yacht
Club, the page is not balanced on the threshold; it clears it comfortably.**

**4. The City Island Bridge — island side or park side?**
**Neither exclusively: it lands on both, and it belongs to City Island.** The
bridge article states it connects "City Island with Rodman's Neck on the
mainland"; the Rodman's Neck article places that peninsula's wooded portion
inside Pelham Bay Park. So the western abutment is in Pelham Bay Park and the
eastern is on City Island. **Ruling for the corpus: the City Island Bridge is a
City Island asset.** It is named for the island, it exists to serve the island,
and the Pelham Bay Park article itself frames it as "the **island's** only
connecting road to the mainland" — the source describes it as belonging to City
Island's geography, not the park's. **Pelham Bay must reference the bridge as a
relationship (its mainland end at Rodman's Neck), never claim it as its own
place.** That gives the two neighborhoods a clean, non-overlapping split.

**5. The Nevins / America's Cup gap.**
**The gap is not a conflict — it is silence, and the claim survives.** I
re-fetched the Nevins article and confirmed the finder's observation: it makes
no mention of the America's Cup anywhere. But it does not contradict the claim
either. The City Island article states plainly and citably: "Many of the boats
which competed and won in the America's Cup in years past were built in the
Nevins Boat Yard on City Island." That is `confirmed` on its own source and may
ship **in that form, attributed to the yard, not to Henry Nevins personally**.
The museum's site independently says its America's Cup exhibit covers winners
"many of which were built on City Island" — corroborating the island, not the
yard. All of Nevins's own biography survives separately: 1907, age 29, the
Hansen Boat Yard, the later Byles Yard, *Baby Bootlegger* with George Crouch and
the 1924–25 Gold Cups, WWII minesweepers. Shipbuilding as the island's defining
history is well sourced and ships intact — Nevins, Consolidated (1896–1958,
51 of 343 submarine chasers, 3,000 workers), and the Harlem Yacht Club material.

**6. The Pelham Bay relationship — load-bearing for two pages.**
**All six threads confirmed; five clean, one corrected.** (a) The bridge's
mainland end on Rodman's Neck — confirmed, E6/C1. (b) The 1654 Pell purchase as
a shared origin — confirmed **independently on both articles**, which is what
makes it usable as a link note. (c) The historic Rodman ferry at the bridge's
exact site — confirmed, "where the bridge is now", E7. (d) Orchard Beach
adjacency — confirmed in substance but **the finder's quotation is not the
source's**: publish "nearby City Island", not "adjacent to City Island" (E10).
(e) Shared Bx29 service — confirmed from both sides: the Bx29 is City Island's
route, and the Orchard Beach article says "The Bx29 bus to City Island runs
nearby year-round" (E13, D4). (f) Pelham Bay Park station as City Island's sole
subway gateway — confirmed (D1–D4). **One caution for the Pelham Bay page:** the
station's pedestrian bridge leads into Pelham Bay Park only. It does **not**
reach City Island (D8, refuted), and a link note must not imply a walking route
between the two.

---

## Totals

| Block | Adjudicated | Confirmed | Refuted | Uncertain |
|---|---:|---:|---:|---:|
| A — Neighborhood history | 22 | 21 | 0 | 1 |
| B — Shipbuilding & yacht clubs | 23 | 22 | 1 | 0 |
| C — Boundary/identity flags | 2 | 1 | 1 | 0 |
| D — Getting there | 11 | 10 | 1 | 0 |
| E — Pelham Bay relationship | 13 | 13 | 0 | 0 |
| F — City Island Bridge | 18 | 17 | 0 | 1 |
| Place 1 — Nautical Museum | 14 | 14 | 0 | 0 |
| Place 2 — Grace Episcopal | 4 | 4 | 0 | 0 |
| Place 3 — 175 Belden Street | 5 | 4 | 1 | 0 |
| Place 4 — Sammy's Fish Box | 5 | 3 | 0 | 2 |
| Place 5 — Johnny's Reef | 5 | 2 | 0 | 3 |
| Place 6 — Original Crab Shanty | 8 | 7 | 0 | 1 |
| Places 7–11 — landmarked houses | 10 | 10 | 0 | 0 |
| Place 12 — City Island Yacht Club | 2 | 2 | 0 | 0 |
| Exclusion handling | 10 | 7 | 3 | 0 |
| **Total** | **152** | **137** | **8** | **7** |

Confirmation rate 90%. Eight refutations and five further corrections; the two
consequential ones are the Sammy's non-discrepancy (C2) and the Lobster House
DOHMH row (exclusions), both found by re-running the finder's own query rather
than by reading its prose.

## Tier

**Surviving places: 12.**

1. City Island Nautical Museum (PS 17 building), 190 Fordham Street
2. Grace Episcopal Church, 116 City Island Avenue
3. House at 175 Belden Street
4. Sammy's Fish Box, 41 City Island Avenue
5. Johnny's Reef Restaurant, 2 City Island Avenue
6. The Original Crab Shanty, 361 City Island Avenue
7. Samuel Pell House, 586 City Island Avenue
8. William H. Schofield House, 65 Schofield Street
9. Captain John H. Stafford House, 95 Pell Place
10. Samuel H. and Mary T. Booth House, 30 Centre Street
11. 21 Tier Street
12. City Island Yacht Club, 63 Pilot Street

**Twelve clears six. `tier: "guide"`** — and not marginally. The finder proposed
six and would have left the page balanced on the threshold; six further places
survive the identity test on evidence the finder gathered but declined to
promote (the five LPC-designated houses) or excluded on an inconsistently
applied standard (the yacht club). No 90-word intro or outbound-link minimum
applies.

Not shipping, for the record: Tony's Pier Restaurant, Seashore Restaurant and
City Island Lobster House (all DOHMH-only, existence evidence only, no prose of
any kind including a category noun); Turtle Cove Golf Center (same); Artie's
Steak & Seafood (unconfirmed); Le Refuge Inn (`uncertain`, not closed); Pelham
Cemetery; Minneford Yacht Yard.
