# City Island — finder artifact

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

`priv/seed_data/bronx/city-island.json` has not been authored yet. This file is
its input, alongside whatever verifier artifact follows it.

Roster: `priv/seed_data/bronx_roster.json`, slug `city-island`, community
district 10, wave 5, `in_scope: true`.

## Search access — report this first

**WebSearch was attempted once and confirmed unavailable.** Query issued:
"City Island Bronx Nautical Museum history". Result:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded (the one attempt above is the only one). Note
that despite the failure, the tool did return five pre-cached search snippets
in that response (Wikipedia and similar); those snippets were not treated as
sourced material here — everything below was independently re-fetched via
**WebFetch**, not taken from the failed search's incidental output.

Everything below was gathered via WebFetch against Wikipedia, restaurants'
own sites, and the NYC DOHMH restaurant-inspection Open Data endpoint
(Socrata dataset `43nn-pn8j`, queried directly by zip/name filter, not via
WebSearch). WebFetch worked throughout and was not throttled.
`web.archive.org` was not attempted (per the dispatch's standing note that the
tool refuses it outright). `nycgovparks.org` was not attempted either, per
the dispatch's note that it has 403'd on three prior passes.

## DOHMH-only count — read before anything else

**2 eateries are DOHMH-only**, per the rule that inspection-dataset rows may
establish existence only and may never appear in prose, including a coarsened
category noun:

- **Tony's Pier Restaurant**, 1 City Island Avenue — confirmed to exist only
  via the DOHMH dataset (see below). No own-site, no Wikipedia article, no
  press piece was reachable. `tonyspier.com` and `tonyspierrestaurant.com`
  both fail to resolve (DNS `ENOTFOUND`); no dedicated Wikipedia article
  exists. **Not written up as a place below** — flagged here only.
- **Seashore Restaurant**, 591 City Island Avenue — same treatment. DOHMH
  confirms existence; `seashorerestaurantny.com` fails to resolve; no
  Wikipedia article found. **Not written up as a place below.**

Two more candidate names were checked and found **nowhere at all** — not even
in DOHMH — so they are not "DOHMH-only," they are simply unconfirmed and
excluded outright: "City Island Lobster House" (`cityislandlobsterhouse.com`
does not resolve; no DOHMH row for any Bronx business with "LOBSTER" in the
name) and "Artie's Steak & Seafood" (`artiesteakandseafood.com` does not
resolve; no DOHMH row for any Bronx business starting "ARTIE"). See Dead ends.

Three eateries below **do** clear the bar with non-DOHMH sourcing (own
restaurant sites, used only for identity/location/history, never for an
award or superlative per the finder contract) and are written up as places:
Sammy's Fish Box, Johnny's Reef Restaurant, and The Original Crab Shanty.

So: **of 5 candidate eateries actually investigated, 3 ship with non-DOHMH
sourcing, 2 are DOHMH-only and excluded, and 2 more names could not be
confirmed to exist under those names at all.**

---

## Neighborhood-level history and orientation

- City Island is "an island and neighborhood... in the northeastern Bronx... approximately 1.5 miles (2.4 km) long by 0.5 miles (0.80 km) wide," with a land area of 0.395 square miles (1.02 km²). — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Located "at the extreme western end of Long Island Sound, south of Pelham Bay Park and east of Eastchester Bay." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Part of Bronx Community Board 10; ZIP code 10464. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Prior to European colonization the island was inhabited by Native Americans, possibly the Wiechquaeskeck band of the Lenape, who left shell middens indicating oyster and clam gathering. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- In 1654, Thomas Pell established ownership of the area (including this island) through a treaty signed by five Lenape sachems. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- In 1761, Benjamin Palmer purchased the island and renamed it from "Minnewits"/"Minneford" to "New City Island," later shortened to City Island. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Annexed to the town of Pelham, Westchester County, in 1819. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- "Narrowly voted to become a part of New York City in 1895, in exchange for a new bridge." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Consolidated as part of the Bronx in 1898. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- "In the mid-20th century, City Island developed as a shipbuilding community, before becoming a daytrippers' destination." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- "The sail and power boating industry has been declining in recent years, as boatyards are being sold and converted into condominiums." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- 2020 Census population of City Island proper: 4,417. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Neighboring geography: Hart Island lies to the east (uninhabited); High Island lies to the northeast; Stepping Stones Light sits off the southern tip. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Before the first bridge, a small rope ferry began operating in 1760. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Samuel Rodman operated a ferry connecting Minneford Island (City Island's earlier name) to "Anne's Hoeck," at the site where the modern bridge now stands. — https://en.wikipedia.org/wiki/Rodman%27s_Neck
- A community website describes City Island as "a small community at the edge of New York City located just beyond Pelham Bay Park in the Bronx and surrounded by the waters of the Long Island Sound." — http://www.cityisland.com
- Belden Point on the island is named for William Belden, who "opened an amusement park and resort in the area in 1887"; it was an early-20th-century recreation spot for Vincent Astor, J.P. Morgan, and William Randolph Hearst. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- A 1910–1914 monorail system operated by the Interborough Rapid Transit Company served the island; its "first journey in July 1910 ended with the monorail toppling on its side." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- The Pelham Park & City Island Railway, a separate rail line, operated 1887–1919. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- A local monthly newspaper, *The Island Current*, first printed in October 1971. — https://en.wikipedia.org/wiki/City_Island,_Bronx

### Shipbuilding and America's Cup history

- "Many of the boats which competed and won in the America's Cup in years past were built in the Nevins Boat Yard on City Island." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- The City Island Nautical Museum's own site independently states its current exhibits include America's Cup winners, "many of which were built on City Island," and that the island's maritime legacy spans "a century of boat building and sail making." — https://www.cityislandmuseum.org/
- **Henry B. Nevins** founded his eponymous shipbuilding company on City Island in 1907, at age 29, after purchasing the Hansen Boat Yard; he later acquired the adjacent Byles Yard. — https://en.wikipedia.org/wiki/Henry_B._Nevins
- The Nevins yard, working with naval architect George Crouch, built the *Baby Bootlegger*, winner of the APBA Gold Cup in 1924 and 1925. — https://en.wikipedia.org/wiki/Henry_B._Nevins
- During World War II, the Nevins company built minesweepers alongside its custom cruising and racing craft. — https://en.wikipedia.org/wiki/Henry_B._Nevins
- **Note for the verifier:** Henry B. Nevins's own dedicated Wikipedia article does not itself mention America's Cup yachts — that claim comes only from the general City Island article (and independently from the museum's own site, which does not name Nevins specifically). Not resolved here.
- **Consolidated Yachts** (also found as "Consolidated Shipbuilding Corporation") operated on City Island; formed June 1896 by the merger of the Charles L. Seabury Company (founded 1885, Nyack, NY) and the Gas Engine & Power Company (Morris Heights, Bronx); relocated to City Island (the former Robert Jacobs shipyard) after World War II. — https://en.wikipedia.org/wiki/Consolidated_Shipbuilding_Corporation
- On July 16, 1908, the yard launched what was described as "the largest yacht in the world driven by motor power" — 111 feet, 21-foot beam, 260 horsepower. — same source
- Built the 475-ton luxury steam yacht *Kanahwa* (1899) for John P. Duncan, later converted to USS *Piqua* in 1917. — same source
- During WWII, built tugboats and 51 of the 343 PC-461-class submarine chasers, employing up to 3,000 workers. — same source
- Ceased shipbuilding operations in 1958, transitioning into a marine-service company. — same source
- **Harlem Yacht Club**, incorporated in 1883, is "the third oldest continuously functioning yacht club in New York City" after the New York Yacht Club (1844) and Williamsburgh Yacht Club (1871). — https://en.wikipedia.org/wiki/Harlem_Yacht_Club
- The club purchased City Island property in 1894 (station on Hunter Avenue) and built a Victorian clubhouse there in 1898–1899; a fire destroyed it and the current three-story clubhouse was built in 1915. — same source
- By 1901, the *New York Times* observed: "in place of the fishing smacks and oyster boats that once anchored in East Chester Bay is the fleet of the Harlem Yacht Club." — same source
- The club hosted the first Star-class regatta in 1911 (Star class became an Olympic sailing class in 1932); its Memorial Day Regatta marked the start of the racing season on Long Island Sound for over 60 years; 70 yachts took part in an 1892 regatta. — same source
- The main City Island Wikipedia article separately names three yacht clubs present on the island today: Harlem Yacht Club, City Island Yacht Club, and Morris Yacht and Beach Club. — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Independent corroboration that Morris Yacht & Beach Club exists at a City Island address: it carries a NYC DOHMH record at 25 City Island Avenue. — https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried by zipcode=10464; identity/address evidence only, cited here only alongside the independent Wikipedia mention above, not standing alone)

### Boundary flags for the verifier

- **The City Island Bridge itself spans a boundary, not a point wholly on the island.** Its eastern end lands on City Island; its western end lands on Rodman's Neck, which sources place inside Pelham Bay Park (see Pelham Bay relationship section below). Flagging per the dispatch's instruction to let the verifier rule on which side of a line a place sits, rather than assuming the bridge is "a City Island place" outright.
- **A discrepancy between two seafood-restaurant sources, not resolved here:** the restaurant's own site names it "Sammy's Fish Box" at 41 City Island Avenue (https://www.sammysfishbox.com/), while the NYC DOHMH dataset independently carries a business named "SAMMY'S ORIGINAL SHRIMP BOX" at 64 City Island Avenue (https://data.cityofnewyork.us/resource/43nn-pn8j.json, queried by zipcode=10464). Different name, different address. This may be two distinct businesses, a renamed/relocated single business, or a DOHMH record for a different Sammy's entirely — not adjudicated here.

---

## Getting there

**Subway.** No subway line reaches City Island directly; the nearest station is Pelham Bay Park, at the intersection of the Bruckner Expressway and Westchester Avenue, served by the 6 train (all times) with `<6>` express service during weekday peak hours in the peak direction; it is the northern terminus of the IRT Pelham Line. — https://en.wikipedia.org/wiki/Pelham_Bay_Park_station

**Bus.** The Bx29 connects City Island to the subway: its western terminal is "City Island Avenue and Rochelle Street" on the island, and its eastern terminal is at Bruckner Boulevard at Pelham Bay Park station, where it connects to the 6 train; the route runs 24 hours a day. — https://en.wikipedia.org/wiki/Bx29

- The main City Island Wikipedia article separately states the island's current public transit is "the Bx29 bus route to Pelham Bay Park station," plus "two rush-hour BxM8 express trips to Manhattan." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Pelham Bay Park station is additionally served by NYCT buses Bx5, Bx12, Bx12 SBS, Bx24, and Bx29; MTA buses Bx23, Q50, and BxM8; and Bee-Line Bus Route 45 (a Westchester County route). — https://en.wikipedia.org/wiki/Pelham_Bay_Park_station
- The station's elevators were installed in December 1989, making it "one of the earliest to comply with the Americans with Disabilities Act of 1990." — same source
- A pedestrian bridge from the station crosses the Bruckner Expressway into Pelham Bay Park, giving access toward Orchard Beach, Hunter Island, the Bartow-Pell Mansion, and City Island. — same source

**Metro-North.** No source fetched in this pass names a Metro-North station serving City Island or Pelham Bay Park; not stated as a claim that none exists anywhere nearby, only that nothing fetched names one for this area. (Bronx Park's finder separately found a "Botanical Garden" Harlem Line station serving that neighborhood, which is not near City Island.)

**Ferry — dead end, not a claim.** Checked Wikipedia's own NYC Ferry article for every route and landing by name: none serves City Island, Pelham Bay, or Orchard Beach. The article notes City Island residents "advocated for a stop there," but does not state that service was ever established. — https://en.wikipedia.org/wiki/NYC_Ferry

**Bridge.** The only road connection to the mainland is the City Island Bridge (see the Pelham Bay relationship section below for its full history); it is described elsewhere as the island's "only connecting road to the mainland." — https://en.wikipedia.org/wiki/Pelham_Bay_Park

---

## The Pelham Bay relationship

- City Island sits "south of Pelham Bay Park." — https://en.wikipedia.org/wiki/City_Island,_Bronx
- Pelham Bay Park encompasses 2,772 acres with 13 miles of shoreline; several formerly distinct islands (Hunter Island, Twin Island, Two Trees Island) were connected to the mainland by 1930s landfill during the Orchard Beach development. — https://en.wikipedia.org/wiki/Pelham_Bay_Park
- Pelham Bay itself (the body of water) "connects to Eastchester Bay at the south, and opens onto Long Island Sound and City Island Harbor at the east," lying between City Island and Orchard Beach. — https://en.wikipedia.org/wiki/Pelham_Bay_Park
- "Two small land berms between Rodman's Neck and City Island consist of the island's only connecting road to the mainland." — https://en.wikipedia.org/wiki/Pelham_Bay_Park
- **Rodman's Neck**, the peninsula the bridge's mainland end lands on, was formerly called "Ann Hook's Neck"; it was included in Thomas Pell's 1654 purchase — the same 1654 transaction named in City Island's own history above. — https://en.wikipedia.org/wiki/Rodman%27s_Neck
- Samuel Rodman operated a ferry connecting Minneford Island (City Island) to "Anne's Hoeck," at the exact site where the current bridge now stands. — https://en.wikipedia.org/wiki/Rodman%27s_Neck
- Rodman's Neck's southern third (54 acres) is now an NYPD firing range used by multiple agencies including the FBI and ICE; the rest is wooded parkland within Pelham Bay Park. — https://en.wikipedia.org/wiki/Rodman%27s_Neck
- Rodman's Neck's northern side connects to what were once Hunter Island and Twin Island, "now forming Orchard Beach and its parking area" — i.e., the same landfill project named in the Pelham Bay Park entry above. — https://en.wikipedia.org/wiki/Rodman%27s_Neck
- **Orchard Beach** sits within Pelham Bay Park, on the western end of Long Island Sound, 1.1 miles long and 115 acres, and "is adjacent to City Island, from which sewage once seeped onto the beach." — https://en.wikipedia.org/wiki/Orchard_Beach_(Bronx)
- Orchard Beach was dedicated (incomplete) in July 1936, officially opened June 25, 1937, and fully completed in 1938, under Robert Moses's 1930s landfill expansion. — same source
- The Orchard Beach promenade and bathhouse were designated a NYC landmark by the Landmarks Preservation Commission in 2006. — same source
- Orchard Beach transit: the Bx12 bus serves it seasonally; the Bx29 (the same route serving City Island) runs "year-round nearby"; Pelham Bay Park subway station serves it via the 6 and `<6>` trains across the Hutchinson River. — same source

**City Island Bridge — full history (the physical link to Pelham Bay Park):**

- The original bridge: construction began 1898, completed and opened July 4, 1901; built of stone and steel, 950 feet long with 7 spans; cost $200,000 (about $7.74 million in 2025 dollars). — https://en.wikipedia.org/wiki/City_Island_Bridge
- It was a swing bridge — five fixed spans plus one central swing section allowing ship passage — and was the sole vehicle entry/exit point for the island; the swing mechanism was deactivated and fixed permanently in place in 1963. — same source
- Managed by the NYC Department of Transportation; by 2002 it showed significant corrosion, prompting replacement discussions. — same source
- An initial replacement design was a cable-stayed bridge with a 150-foot tower (estimated at $50 million in 2005, $120 million by 2009); community opposition to the tower's height led the city to choose a causeway-style design instead in May 2014, reducing cost. — same source
- A temporary steel bridge erected in 2015 partially collapsed that September, delaying opening; the original 1901 bridge closed December 18, 2015. — same source
- The new causeway bridge opened October 29, 2017; the final contractor bid was $102.7 million (contractor: Tutor Perini). — same source
- 2016 data recorded 14,473 vehicles crossing daily. — same source

---

## Places

### 1. City Island Nautical Museum (Public School 17 building)

**What it is:** A maritime-heritage museum on City Island, housed in a former public school building. `searched: complete`

- The museum occupies the former Public School 17 building at 190 Fordham Street, City Island. — https://en.wikipedia.org/wiki/Public_School_17 (Wikipedia's article title for the building itself is "Public School 17," not "City Island Nautical Museum")
- PS 17 was built in 1897, designed by architect C. B. J. Snyder in Neo-Georgian style, "a two-story, five-bay brick building on a high basement" with Doric columns at its entrance; a rear addition was added in 1930; it served as a school until 1975. — same source
- Listed on the National Register of Historic Places September 27, 1984 (NRHP reference no. 84002065). — same source
- The museum opened in 1976; after the city sold the building to developer Haim Joseph in the 1980s for condominium conversion, "the museum and a community center received a 99-year rent-free lease, and reopened in 1995 after renovations." — same source
- Operated by the City Island Historical Society; a vandal-set fire on July 13, 2007, damaged the building's façade. — same source
- The museum's own site independently gives its address as 190 Fordham Street, City Island, NY 10464, and states its exhibits include "America's Cup winners, many of which were built on City Island," alongside collections of maritime artifacts, photographs, and navigational instruments spanning "a century of boat building and sail making." — https://www.cityislandmuseum.org/
- The museum's own site states current seasonal hours (last Saturday of April through last weekend of October, weekends 1–4 PM) and admission prices (members free, adults $10, children under 12 free) — cited here as the museum's own description of its own operations, not as an independent trading-status confirmation. — https://www.cityislandmuseum.org/

### 2. Grace Episcopal Church

**What it is:** An Episcopal parish church on City Island Avenue, individually listed on the National Register. `searched: complete`

- Address: 116 City Island Avenue, City Island, Bronx. — https://en.wikipedia.org/wiki/Grace_Episcopal_Church_(Bronx)
- Founded and built in 1862; the church itself is Carpenter Gothic style, the rectory (also c. 1862) Italianate. — same source
- Listed on the National Register of Historic Places September 13, 2006 (NRHP reference no. 06000820). — same source
- The main City Island Wikipedia article separately names "St. Mary Star of the Sea Roman Catholic Church, Trinity United Methodist Church, Grace Episcopal Church" and "Temple Beth El (founded 1934)" among the island's churches and synagogue. — https://en.wikipedia.org/wiki/City_Island,_Bronx

### 3. House at 175 Belden Street

**What it is:** A small late-19th-century cottage, individually landmarked and separately National Register-listed. `searched: complete`

- Address: 175 Belden Street, City Island. Built circa 1880, described as "a simple, small picturesque cottage" with "an asymmetrical cruciform plan." — https://en.wikipedia.org/wiki/House_at_175_Belden_Street
- Designated a NYC Landmark July 28, 1981 (NYCL No. 1082); listed on the National Register of Historic Places June 3, 1982 (NRHP reference no. 82003345). — same source
- **Note on a date discrepancy across two Wikipedia lists, not resolved here:** the borough-wide NYC landmarks list gives the same property's designation date as July 28, 1981, while the borough-wide NRHP-listings page separately gives its National Register date as "June 3, 1982" — these are consistent with each other and with the dedicated article, cited together only to show three independent Wikipedia pages agree on this one property. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx and https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx

### 4. Sammy's Fish Box

**What it is:** A seafood restaurant on City Island Avenue. `searched: complete`

- Own site states name "Sammy's Fish Box," address 41 City Island Ave, Bronx, NY 10464, phone (718) 885-0920. — https://www.sammysfishbox.com/
- Own site states it was founded in 1966 and describes itself as serving "fresh seafood, lobster feasts, and waterfront dining," including "surf and turf, lobster dishes, and fried seafood specialties." — same source
- **Flag, not carried into a claim:** the same site's self-description of "over 55 years" of operation and its characterization of its own portions as "legendary" are the restaurant's own claims about itself and are not corroborated by any independent source found in this pass; per the finder contract a business's own site cannot establish a superlative or trading status, only identity, what it serves, and where.
- **See the boundary/discrepancy flag above:** a differently-named, differently-addressed DOHMH record ("SAMMY'S ORIGINAL SHRIMP BOX," 64 City Island Ave) exists in the same dataset; relationship to this business not established here.

### 5. Johnny's Reef Restaurant

**What it is:** A cafeteria-style seafood restaurant on City Island Avenue. `searched: complete`

- Own site states name "Johnny's Reef Restaurant," address 2 City Island Ave, Bronx, NY 10464, phone (718) 885-2086. — https://www.johnnysreefrestaurant.com/
- Own site describes cafeteria-style service divided into a Fried Section (served with fries and coleslaw), Steam Section (served with Italian bread), Clam Section, Soda Section, and a bar, with indoor/outdoor picnic-table seating overlooking the water. — same source
- Own site states it "has been serving City Island for over 60 years." — same source
- Own site quotes former NYC Mayor Michael Bloomberg: "We would order baskets of fried clams and eat them outside on the picnic tables overlooking the water." — same source
- **Flag, not carried into a claim as a superlative:** the same page's statements that it is "named among NYC's best seafood restaurants" and "one of the area's best backyards and patios" are the restaurant's own self-description, not independently corroborated in this pass; per the finder contract, an operator's own site cannot establish a ranking or award for itself. The Bloomberg quotation is reported only on the restaurant's own site as well, with no independent source found confirming where or when he said it.

### 6. The Original Crab Shanty

**What it is:** A seafood restaurant on City Island Avenue, in a building with a documented multi-use history predating the restaurant. `searched: complete`

- Own site states name "The Original Crab Shanty Restaurant," address 361 City Island Ave, Bronx, NY 10464, phone 718-885-1810. — https://www.originalcrabshanty.com/
- Own site states current operators took over the property in 1977. — same source
- Own site states the building was originally constructed as "a silent movie theater" in the early 1900s, later served as the City Island Post Office, and that a road called "Crab Lane" once ran through what is now the parking lot. — same source
- Independent existence/address corroboration: a NYC DOHMH record for "CRAB SHANTY" at 361 City Island Avenue matches this address exactly. — https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried by zipcode=10464; cited only as corroboration alongside the own-site source, not as the sole source)
- **Flag, not carried into a claim:** the same page's stated award, "Voted Best Restaurant in the Bronx 2017," is the restaurant's own claim about itself with no naming of the awarding body found on the page, and per the finder contract a business's own site cannot establish an award for itself.
- **Dead end on a related domain:** `crabshanty.com` (without "original") redirects to a GoDaddy domain-parking/for-sale page, not the restaurant — do not treat that URL as this business's site.

---

## Candidates investigated and NOT included — read before re-researching these

- **Tony's Pier Restaurant** (1 City Island Ave) and **Seashore Restaurant** (591 City Island Ave) — DOHMH-only, per the section at the top of this file. Not written up as places.
- **"City Island Lobster House"** — no DNS resolution for `cityislandlobsterhouse.com`; no matching DOHMH row for any Bronx business with "LOBSTER" in the name. Not confirmed to exist under this name; not included.
- **"Artie's Steak & Seafood"** — no DNS resolution for `artiesteakandseafood.com`; no matching DOHMH row for any Bronx business starting "ARTIE." Not confirmed to exist under this name; not included.
- **Le Refuge Inn** — a remembered candidate (a City Island bed-and-breakfast). `en.wikipedia.org/wiki/Le_Refuge_Inn` 404'd; `lerefugeinn.com` failed with an SSL error on the first attempt and a connection reset on the second. Not included; not verified to exist under any reachable source in this pass.
- **Pelham Cemetery** — named explicitly in the assignment brief as a thing to look for. The only mention found anywhere in this pass is a bare photo caption in the main City Island Wikipedia article ("Pelham Cemetery") with zero descriptive text attached. `en.wikipedia.org/wiki/Pelham_Cemetery`, `en.wikipedia.org/wiki/Pelham_Cemetery_(City_Island,_New_York)`, and `en.wikipedia.org/wiki/Trinity_Church_Cemetery_(City_Island)` all 404'd. The City Island Historical Society's own site (cityislandmuseum.org) does not mention it. A community site, cityisland.com, was reached but returned only a thin landing-page excerpt with no cemetery content. **Not included as a place; no descriptive fact survives this pass beyond its bare name appearing once.**
- **Turtle Cove** — named explicitly in the assignment brief. No mention found anywhere in this pass, including the main City Island article. `en.wikipedia.org/wiki/Turtle_Cove_(Bronx)` and `en.wikipedia.org/wiki/Turtle_Cove,_Bronx` both 404'd. **Not included; zero facts found.**
- **Minneford Yacht Yard** — a remembered candidate. `en.wikipedia.org/wiki/Minneford_Yacht_Yard` 404'd. Not included; no corrected title found without WebSearch.
- **City Island Yacht Club as a standalone place** — named alongside Harlem Yacht Club and Morris Yacht & Beach Club in the main City Island article, but has no dedicated Wikipedia article (`en.wikipedia.org/wiki/City_Island_Yacht_Club` 404'd) and no own-site was attempted in this pass. Its bare name-mention is captured above under the shipbuilding/yacht-club section; not written up as its own place block for lack of independent material.
- **City Island Avenue as a standalone place** — the island's commercial spine, referenced constantly above as an address street, but has no dedicated Wikipedia article (`en.wikipedia.org/wiki/City_Island_Avenue` 404'd). Treated only as a street name in other places' addresses, not as its own place record.
- **Samuel Pell House** (586 City Island Ave), **William H. Schofield House** (65 Schofield St), **Captain John H. Stafford House** (95 Pell Place), **Samuel H. and Mary T. Booth House** (30 Centre St), and the landmark at **21 Tier Street** — all appear only in the borough-wide NYC designated-landmarks list, with a name, address, and designation date each (Pell House: Oct 29, 2002; Schofield House: Apr 12, 2012; Stafford House and Booth House: both Nov 28, 2017; 21 Tier Street: June 20, 2000 — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx). None has a dedicated Wikipedia article, and no own-site or further source was pursued for any of them in this pass given time budget. Not written up as individual place blocks; flagged here as a group in case a later pass has budget to pursue them individually — each has at minimum a name, address, and confirmed designation date sourced from a single independent list.

## Dead ends — for a later pass, not for publication

- `www.tonyspier.com` — DNS `ENOTFOUND`.
- `www.tonyspierrestaurant.com` — DNS `ENOTFOUND`.
- `en.wikipedia.org/wiki/Tony%27s_Pier_Restaurant` — HTTP 404.
- `www.seashorerestaurantny.com` — DNS `ENOTFOUND`.
- `cityislandlobsterhouse.com` — DNS `ENOTFOUND`.
- `www.artiesteakandseafood.com` — DNS `ENOTFOUND`.
- `www.crabshanty.com` (no "original") — redirects to a GoDaddy domain-parking page, not the restaurant.
- `www.lerefugeinn.com` — SSL error on first attempt (`TLSV1_ALERT_UNRECOGNIZED_NAME`), connection reset on retry.
- `en.wikipedia.org/wiki/Le_Refuge_Inn` — HTTP 404.
- `en.wikipedia.org/wiki/Pelham_Cemetery` — HTTP 404.
- `en.wikipedia.org/wiki/Pelham_Cemetery_(City_Island,_New_York)` — HTTP 404.
- `en.wikipedia.org/wiki/Trinity_Church_Cemetery_(City_Island)` — HTTP 404.
- `http://www.cityisland.com/history.htm` — HTTP 404.
- `en.wikipedia.org/wiki/Turtle_Cove_(Bronx)` — HTTP 404.
- `en.wikipedia.org/wiki/Turtle_Cove,_Bronx` — HTTP 404.
- `en.wikipedia.org/wiki/Minneford_Yacht_Yard` — HTTP 404.
- `en.wikipedia.org/wiki/City_Island_Yacht_Club` — HTTP 404.
- `en.wikipedia.org/wiki/City_Island_Avenue` — HTTP 404.
- `en.wikipedia.org/wiki/St._Mary_Star_of_the_Sea_Church_(City_Island,_New_York)` — HTTP 404.
- `en.wikipedia.org/wiki/Special_Interest_District_(City_Island)` — HTTP 404 (a guessed title; no zoning/historic-district Wikipedia article found for City Island under any title tried).
- `en.wikipedia.org/wiki/BxM8` — HTTP 404 (no dedicated article; the route is named only inside the main City Island article and the Pelham Bay Park station article).
- `nycgovparks.org` — not attempted this pass, per the dispatch's note that it has 403'd on three prior passes.
- `web.archive.org` — not attempted this pass, per the dispatch's note that the tool refuses it outright.
- DOHMH queries for "LOBSTER" (Bronx-wide) and "ARTIE%" (Bronx-wide) both returned zero rows — see the DOHMH-only section above.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Checked all three shipped Bronx files directly: `priv/seed_data/bronx/belmont.json`,
`priv/seed_data/bronx/bronx-park.json`, and `priv/seed_data/bronx/mott-haven.json`.
A case-insensitive grep for "city island," "pelham bay," and "orchard beach"
across all three returned no matches. No existing place record anywhere in
the corpus collides with any address or institution named above. No
`pelham-bay.json` or `throgs-neck.json` file exists yet in `priv/seed_data/bronx/`
(both are wave-5 neighbors still unresearched), so there is no risk of
colliding with either at this time.

## Summary counts

- Places researched and written up with citations: **6** — City Island
  Nautical Museum (PS 17 building), Grace Episcopal Church, House at 175
  Belden Street, Sammy's Fish Box, Johnny's Reef Restaurant, The Original
  Crab Shanty. All `searched: complete`.
- **DOHMH-only eateries: 2** (Tony's Pier Restaurant, Seashore Restaurant) —
  excluded per the provenance rule, not written up as places.
- Eatery names investigated but not confirmed to exist at all (not even in
  DOHMH): **2** (City Island Lobster House, Artie's Steak & Seafood).
- Distinct sourced claims across the neighborhood-level, transit, Pelham Bay
  relationship, and place sections: **approximately 75** individual citation
  lines.
- WebSearch: attempted once, confirmed exhausted (0 of 200 available);
  everything above is WebFetch-sourced.
- Transit claims: **subway (1 station named), bus (2 routes named with
  termini, plus 6 more bus lines named serving the connecting subway
  station), ferry (dead end, stated plainly), Metro-North (dead end, stated
  plainly), bridge (full history, 8+ claims)** — roughly 20 individual
  transit-related citation lines in total.
- Pelham Bay relationship: **citable**, and substantial — the bridge's
  mainland landing point (Rodman's Neck), the shared 1654 Pell purchase, the
  historic Rodman ferry at the bridge's exact site, Orchard Beach's adjacency
  and shared Bx29 service, and the Pelham Bay Park station's role as City
  Island's only subway gateway are all sourced above with citations.
- Flags left open for the verifier: the City Island Bridge's boundary
  position (island side vs. Pelham Bay Park side); the Henry B. Nevins
  America's Cup claim appearing only in the general City Island article and
  the museum's own site, not in Nevins's own dedicated article; the
  Sammy's Fish Box / Sammy's Original Shrimp Box name-and-address
  discrepancy between the restaurant's own site and the DOHMH dataset; and
  the group of five individually-landmarked houses/buildings named in
  "Candidates investigated and NOT included" that have a confirmed name,
  address and designation date but no independent second source pursued in
  this pass.
