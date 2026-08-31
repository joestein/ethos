# Mott Haven — finder artifact

Committed on purpose, on the `docs/ballparks/<site>.md` precedent: this was
produced under `.superpowers/sdd/2026-08-30-bronx-neighborhoods/research/`,
which `.gitignore` excludes wholesale, so a `git clean -xdf`, a worktree removal
or a fresh clone would have destroyed it silently. It holds 9 verified places
and roughly 240k tokens of completed research — the Mott Haven half of the
measurement that narrowed both NYC programmes
(`docs/superpowers/specs/2026-08-31-narrowed-nyc-scope-design.md`). Moved
unedited; its companion is `mott-haven-verdicts.md` in this directory.

`priv/seed_data/bronx/mott-haven.json` has not been authored yet. These two
files are its input.

Role: FINDER only. No verdicts below. Every line is "source says X"; adjudication
(`confirmed`/`refuted`/`uncertain`) is for an independent verifier who has not
seen this reasoning.

## Search access — report this first

**WebSearch was unavailable for this entire task.** The first WebSearch call
issued (query: "Mott Haven Bronx history neighborhood name origin") returned:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls)."

Zero WebSearch queries succeeded — the budget was exhausted before this task's
first query, matching the pattern flagged in the dispatch. Everything below was
gathered via **WebFetch** against Wikipedia, the NYPL's own site, NYC DOHMH's
restaurant-inspection Open Data endpoint (Socrata), and one hotel's own site.
WebFetch worked throughout and was not throttled. Several direct URL guesses
404'd (no WebSearch to find the correct URL first) — those are listed under
"Dead ends" so a later pass doesn't repeat them blind.

Per site-builder.md: DOHMH inspection rows below are cited as **existence/
identity evidence only**. They must never appear in prose.

---

## Neighborhood-level history and orientation

Source for all lines in this section unless otherwise noted:
`https://en.wikipedia.org/wiki/Mott_Haven,_Bronx` (fetched 2026-08-31).

- The Bronx was named after Swedish sea captain Jonas Bronck. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- In 1639, the Dutch West India Company purchased the land of today's Mott Haven from the Wecquaesgeek. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Bronck established a farm called "Emmanus" near present-day Willis Avenue and 132nd Street. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The peace treaty between Dutch authorities and Wecquaesgeek chiefs Ranaqua and Tackamuck was signed in Bronck's house. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Bronck lived in the area only four years, but the land became known as "Broncksland." — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The area was sold to the Morris family in 1670. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Jordan Lawrence Mott purchased the land for his iron works in 1849, giving the neighborhood its current name. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- A vestige of the iron works can be seen just west of the Third Avenue Bridge on East 134th Street. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The neighborhood is generally bounded by East 149th Street to the north, the Bruckner Expressway to the east and south, and the Harlem River to the west. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- East 138th Street is described as the primary east–west thoroughfare through Mott Haven. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- From the end of the 19th century through the 1940s, Mott Haven was a mixed German-American (north of East 145th Street) and Irish-American (south of East 145th Street) neighborhood. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The first Puerto Rican settlements came in the late 1940s along the length of Brook Avenue. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- One of the largest parades in New York City took place here in the late 1940s/early 1950s, organized by Irish Republican Army veterans. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The Star of Munster Ballroom, at the northeast corner of Willis Avenue and East 138th Street, was a center of Irish music for decades. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The neighborhood was earlier known as "the North Side" or "North New York" before the term "South Bronx" emerged. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The Chase Manhattan Bank building at Third Avenue and East 137th Street was originally the North Side Board of Trade Building (1912). — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The neighborhood is part of Bronx Community Board 1. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx (matches this wave's roster assignment of community_district 1)
- 2020 population figure given as 54,163 residents; area 1.180 sq mi. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx

### Getting there — raw transit facts (not yet composed into prose)

- IRT Pelham Line (6 and <6> trains) runs along East 138th Street. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Subway stations named as serving Mott Haven: 138th Street–Grand Concourse (4, 5), Third Avenue–138th Street (6, <6>), Brook Avenue (6), Cypress Avenue (6), East 143rd Street–St. Mary's Street (6), 149th Street–Grand Concourse (2, 4, 5), Third Avenue–149th Street (2, 5). — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx **(Case C: article lists these as the neighborhood's stations but does not give per-station in/out-of-neighborhood location; a couple, e.g. 149th St stations, sit right at the stated northern boundary — needs a location check before any station is written as "serving" vs. "on the edge of" Mott Haven.)**
- Metro-North stops listed for the area: Harlem–125th Street and Yankees–East 153rd Street. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx (Note: both of these are outside Mott Haven's own stated boundary — 125th St is in Manhattan, East 153rd St is well north — so this reads as "nearest Metro-North" rather than a station in the neighborhood; verifier should confirm before any "Case A" phrasing.)
- Bus routes listed: Bx1, Bx2, Bx4, Bx17, Bx19, Bx21, Bx32, Bx33, Bx41, M125. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Bridges serving the neighborhood: Triborough Bridge, Third Avenue Bridge, Madison Avenue Bridge, 145th Street Bridge, Willis Avenue Bridge. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Third Avenue Bridge: swing bridge over the Harlem River connecting Manhattan and the Bronx, carries Third Avenue traffic (southbound/Bronx-to-Manhattan direction); originally opened August 1, 1898; converted to one-way southbound August 5, 1941; original span removed 1955, rebuilt bridge reopened December 1956; major reconstruction 2001–2005, new swing span floated into place October 29, 2004. — https://en.wikipedia.org/wiki/Third_Avenue_Bridge_(New_York_City)

---

## Places

### 1. Mott Haven Historic District

**What it is:** A historic district of 19th-century row houses on Alexander Avenue. `searched: complete`

- Located on Alexander Avenue between East 138th and East 141st Streets. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Listed on the National Register of Historic Places March 25, 1980 (NRHP reference no. 80002586). — https://en.wikipedia.org/wiki/Mott_Haven_Historic_District
- Designated a New York City Landmark July 29, 1969. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Area given as 11 acres (4.5 ha). — https://en.wikipedia.org/wiki/Mott_Haven_Historic_District
- Contains row houses (four- and five-story) dating to the last half of the 19th century, in Gothic, Queen Anne, and Romanesque styles. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Includes brownstones known historically as "Doctors' Row" and "Irish Fifth Avenue." — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- The district includes the 1905 Mott Haven Branch of the New York Public Library and Saint Jerome's Roman Catholic Church, and the 40th Precinct police station sits within it. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- **Flag for verifier:** two different designation-date sources disagree on which body designated when (NRHP March 25, 1980 vs. NYC LPC July 29, 1969) — these are two different designations by two different bodies, not a contradiction, but worth confirming both independently before publishing both dates.

### 2. Mott Haven East Historic District

**What it is:** A row-house historic district adjoining the above. `searched: complete`

- Located on East 139th and East 140th Streets between Brook and Willis Avenues. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Designed by William O'Gorman and William Hornum in 1883. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Designated a New York City Landmark April 5, 1994. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- No dedicated Wikipedia article exists for this district (direct URL guess `Mott_Haven_East_Historic_District` 404'd); the two facts above are both sourced from the parent Mott Haven article and the boroughwide landmarks list, not from a page about the district itself. Treat as thinner sourcing than item 1.

### 3. Bertine Block Historic District

**What it is:** A row-house historic district designed as a unified block. `searched: complete`

- Located on East 136th Street between Brook and Willis Avenues. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Designed by Edward Bertine between 1891 and 1895. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Designated a New York City Landmark April 5, 1994. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Same caveat as item 2: no dedicated Wikipedia article found (direct guess `Bertine_Block` 404'd); sourced only from the parent article and the landmarks list.

### 4. St. Ann's Church and Graveyard (St. Ann's Episcopal Church)

**What it is:** A church, described by Wikipedia as the Bronx's oldest. `searched: complete`

- Built in 1841. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Wikipedia's Mott Haven article describes it as "the Bronx's oldest church." — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx (this is the article's own characterization, not independently cross-checked by a second source in this pass)
- Dedicated to Gouverneur Morris's mother, Ann. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Lewis Morris, a signer of the Declaration of Independence, is buried there. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Gouverneur Morris is buried there. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Listed as "St. Ann's Church and Graveyard," designated a New York City individual Landmark June 9, 1967. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- **Dead end, not a claim:** two direct-URL guesses for a dedicated Wikipedia article on this church (`St._Ann%27s_Church_(Bronx,_New_York)`, `St._Ann%27s_Church_(the_Bronx)`) either 404'd or resolved to an unrelated Roman Catholic parish in Norwood — do not reuse either title. No street address for this church was found in this pass.

### 5. Mott Haven Library (NYPL branch)

**What it is:** A Carnegie-funded public library branch. `searched: complete`

- Address: 321 East 140th Street, Bronx, NY 10454. — https://www.nypl.org/locations/mott-haven (library's own page) and https://en.wikipedia.org/wiki/Mott_Haven,_Bronx (independently agrees on the address)
- Open to the public since 1905. — https://www.nypl.org/locations/mott-haven
- Wikipedia additionally describes it as "the 1905 neo-renaissance Mott Haven Branch of the New York Public Library." — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Brick-and-limestone structure. — https://www.nypl.org/locations/mott-haven
- Declared a New York City landmark in 1969, per the library's own site. — https://www.nypl.org/locations/mott-haven (Note: this is the same 1969 date the landmarks list attaches to the broader Mott Haven Historic District, not necessarily a separate individual landmarking of the library building — worth the verifier checking whether this is one designation described two ways or two designations.)
- Described on the library's own site as "the oldest library building in the Bronx." — https://www.nypl.org/locations/mott-haven

### 6. Bronx General Post Office

**What it is:** A 1930s Art Deco post office building with WPA-era murals; sits at 558 Grand Concourse, which Wikipedia's Mott Haven article itself lists as one of the neighborhood's own post offices ("Bronx Station: 558 Grand Concourse"). `searched: complete`

- Address: 558 Grand Concourse, Bronx, NY 10451. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office ; also listed under Mott Haven's own post offices at https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- Built 1935, completed/opened May 15, 1937; groundbreaking June 13, 1936. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- Architect: Thomas Harlan Ellett. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- Interior murals (13 panels) by Ben Shahn and Bernarda Bryson, completed August 1939. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- Facade sculptures: *The Letter* by Henry Kreis and *Noah* by Charles Rudy. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- NYC Landmark (exterior) designated November 25, 1975. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- **Conflicting date, flag for verifier:** the boroughwide NYC landmarks list gives a different date for what appears to be the same building: "Bronx Post Office... Designation Date: September 14, 1976." — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx . Two sources, two dates, for what is presumably one exterior designation — needs resolution, not averaging.
- NYC Landmark (interior) designated December 17, 2013. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- Listed on the National Register of Historic Places May 6, 1980; New York State Register June 23, 1980. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office
- Mail processing operations relocated in 2011; building sold to Youngwoo & Associates in September 2014 ($19 million); resold to Maddd Equities in July 2025 ($44 million); a CUNY lease was signed September 2025. — https://en.wikipedia.org/wiki/Bronx_General_Post_Office (current-status facts — relevant to whether this still functions as a post office at all; a verdict on current use/openness would need a fresher source than Wikipedia's own account of a 2025 lease.)

### 7. St. Mary's Park

**What it is:** A city park. `searched: complete`

- 35.31 acres (14.29 ha). — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Originally part of Jonas Bronck's estate (1600–1643), then held by the Gouverneur Morris family (1752–1816). — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Used as a Loyalist military refugee camp during the Revolutionary War. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Adrian Janes purchased the land in April 1857; his iron foundry manufactured the Capitol dome, Bow Bridge, and Brooklyn Bridge railings. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Named after Adrian Janes's daughter, Mary. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- The city purchased the land for the park between 1888 and 1890. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- The borough's first playground opened here in 1914. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- New York's first full-service indoor recreation center opened here in 1951. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- A railroad tunnel was built through the park in 1905; 1.2 acres were returned to the park in 1912; an additional 0.8 acres were added in 1968. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Amenities: indoor recreation center with pool and gymnasium, playgrounds, a baseball diamond, tennis courts, a fitness loop. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Marvel Comics murals painted in the early 1970s, repainted in 1991. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Synthetic turf installed 2006. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- Operated by the NYC Department of Parks and Recreation. — https://en.wikipedia.org/wiki/St._Mary%27s_Park_(Bronx)
- **Dead end, not a claim:** the official `nycgovparks.org` page for this park returned HTTP 403 to WebFetch on two URL variants and could not be independently corroborated against the city's own site in this pass.

### 8. La Morada Restaurant

**What it is:** A Mexican restaurant. `searched: complete`

- Name and address, from NYC DOHMH restaurant inspection Open Data (Socrata dataset `43nn-pn8j`, queried directly, not via WebSearch): "LA MORADA RESTAURANT," 308 Willis Avenue, Bronx, NY 10454. — https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried 2026-08-31; this is inspection-record evidence of identity/address only — it must not be used as prose per site-builder.md)
- Cuisine classification per the same dataset: "Mexican." — same source, same caveat
- Inspection rows in the dataset carry dates through 2026-02-17 with grade "A" on the most recent rows returned. — same source, same caveat (evidence toward a trading-status verdict, not a prose fact)
- **Dead end, not a claim:** attempted to fetch what looked like the restaurant's own domain (`lamoradanyc.com`); the page returned is an unrelated, expired-domain-squat site ("NYC Cinema Guide," copyright "Abramov 2022") with no restaurant content. Do not treat that URL as the restaurant's site. A dedicated Wikipedia article title guess (`La_Morada_(restaurant)`, `La_Morada`) also 404'd. No history, founder name, or awards claim survives this pass — only the DOHMH identity/address record above.

### 9. The Bronx Brewery — Tap Room

**What it is:** A brewery taproom. `searched: complete`

- Name and address, from NYC DOHMH restaurant inspection Open Data (same dataset as above): "THE BRONX BREWERY-TAP ROOM," 856 East 136th Street, Bronx, NY 10454. — https://data.cityofnewyork.us/resource/43nn-pn8j.json (queried 2026-08-31; identity/address evidence only, not for prose)
- Cuisine classification per the same dataset: "American." — same source, same caveat
- Inspection rows include a grade "A" row dated 2023-01-11. — same source, same caveat
- The brewery's own site (https://www.thebronxbrewery.com/) confirms the business name "The Bronx Brewery," states it is a craft brewery, and states it operates a Bronx location and a second location at Hudson Yards, Manhattan — but the homepage itself does not print a street address, so the address above comes from DOHMH, not the brewery's own site. — https://www.thebronxbrewery.com/
- The brewery's own site did not state a founding year on the page fetched.

### 10. Firehouse, Engine Company 60 / Hook & Ladder Company 17

**What it is:** An active FDNY firehouse in a landmarked building. `searched: complete` — flagged as thin/borderline.

- Address: 341 East 143rd Street. — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx (FDNY station list) and https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx (landmark entry, address given there as the same street)
- Designated a New York City Landmark June 20, 2000. — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
- Houses Squad 41, Engine Company 60, Ladder Company 17, and Battalion 14 per the Mott Haven article's FDNY listing (the landmark entry itself names only "Hook and Ladder Company 17 / Engine Company 60"). — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx
- No dedicated Wikipedia article was found (two direct-URL guesses 404'd); no architect, construction date, or style claim survives this pass. This is an active, working firehouse — flagging for whoever authors this that it may not clear the "somewhere a visitor spends time" bar site-builder.md applies to place records, separate from whether the landmark fact itself is confirmed.

---

## Candidates investigated and NOT included — read before re-researching these

- **Bronx Opera House / Opera House Hotel, 436 East 149th Street.** Wikipedia's own infobox for the Bronx Opera House building states its neighborhood as **Melrose**, not Mott Haven — https://en.wikipedia.org/wiki/Bronx_Opera_House. The address sits on East 149th Street, which the Mott Haven article gives as Mott Haven's *northern boundary* — https://en.wikipedia.org/wiki/Mott_Haven,_Bronx. Given a source-stated boundary and a source-stated neighborhood assignment disagree, I did not fold this into Mott Haven. Facts gathered in case another neighborhood's finder wants them: built 1912–1913 by architect George M. Keister, opened August 30, 1913 as a 1,892-seat theater, NYC Landmark designated June 13, 2023, converted to the 78-room Opera House Hotel (opened August 11, 2013 per the hotel's own site, https://www.operahousehotel.com/). **This is exactly the mislocation shape site-builder.md warns about (§ "identity... taken from recollection") — do not assume it is Mott Haven's because it is nearby.**
- **Bruckner Bar & Grill.** Could not locate in NYC DOHMH's restaurant-inspection dataset under this name or under "Bruckner" + Bronx zip codes 10454/10455/10451 (search returned only unrelated Bruckner Boulevard businesses — Dunkin, McDonald's, Taco Bell, etc., none matching). Without WebSearch to find its correct address or confirm current existence, I am not including it. Flag as "searched, not found" rather than omitting silently.
- **Ceetay.** Same treatment — no DOHMH match found under "CEE" + Bronx zip 10454 in the time available. Not included. "Searched, not found."
- **"Estey Piano Factory."** A remembered candidate (piano-manufacturing heritage building) that could not be verified: the Wikipedia article at the obvious title (`Estey_Piano_Company_Factory`) is actually about an unrelated **Estey Organ Company** factory in Brattleboro, Vermont, with no Bronx connection. No corrected title was found without WebSearch. Not included, and this should not be treated as a lead for a later pass without independent re-verification that a Bronx building under this name exists at all.
- **Brook Park** (community-supported agriculture) — one line only, from the Mott Haven Wikipedia article ("Brook Park hosts a community-supported agriculture program"). No address or operating details found in this pass; too thin to write up as its own place block. Left as a neighborhood-level mention above, not a place candidate.

## Dedup check against the existing corpus (rung b, site-builder.md §7)

Grepped `priv/seed_data/` and `lib/ethos/seeds/` for every address and the phrase "Mott Haven" gathered above. Only hit was the roster file itself (`priv/seed_data/bronx_roster.json`, which is expected — it lists Mott Haven as a roster entry, not a place). No existing place record anywhere in the corpus collides with any address above. Also specifically checked `lib/ethos/seeds/yankee_stadium_places.ex` (12 existing Bronx places per the plan's own warning) — all its addresses cluster around East 161st Street / River Avenue, well north of every address found here.

## Summary counts

- Places researched and written up with citations: **10** (all `searched: complete`).
- Candidates investigated and explicitly excluded, with reasons recorded: **4** (Opera House Hotel — boundary conflict; Bruckner Bar & Grill and Ceetay — not found; Estey Piano Factory — unverifiable/wrong source).
- Distinct sourced claims across the neighborhood-level section and the 10 place blocks: **approximately 70** individual citation lines (count them per-line above; each line is one independently checkable claim against one URL).
- Flags left open for the verifier: the two St. Ann's-related title dead ends, the Bronx General Post Office's two conflicting exterior-landmark dates (1975 vs. 1976), the NYPL library's 1969 landmark date possibly overlapping the historic district's own 1969 date, and the Case C transit stations that need a location check before "Getting there" prose is written.
