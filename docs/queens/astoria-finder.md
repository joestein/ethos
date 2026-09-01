# Astoria, Queens — FINDER candidate file

**Role:** Finder. Nothing below is verified, confirmed, or adjudicated. Every entry is a
**candidate** awaiting a verifier. Where I paraphrase, I say so. Where I quote, the quoted string
is copied from the fetched source text.

**Wave hazard:** Astoria, Ditmars–Steinway and Long Island City abut each other and sources
disagree about where each begins. Every place below carries its street address and whatever
neighborhood label its source actually used. Conflicts are recorded, not resolved. See
§12 (Contested Assignment Register).

---

## 0. Method and its limits (read before trusting anything here)

- The session's **WebSearch budget was exhausted before I ran a single search** (200/200 already
  consumed). All research below was done by fetching URLs directly. That means this file is
  **discovery-limited**: it is strong on sources I could name in advance (NYC Parks, LPC, DCP,
  DCLA, DOHMH, MTA) and weak on anything I would have had to find by searching (press coverage,
  local journalism, oral history, most restaurant writing).
- Several sites refused the fetch or are effectively unreachable: `movingimage.org` (Cloudflare
  block), `guide.michelin.com` (empty), `wellingcourtmuralproject.org` (empty),
  `riselightandpower.com` (empty), `stdemetriosastoria.org` (empty),
  `communityprofiles.planning.nyc.gov` (JS-only shell). **Museum of the Moving Image, the Welling
  Court Mural Project, the Astoria Generating Station, and St. Demetrios Cathedral are therefore
  under-sourced here** and need a second pass.
- **Two domains that look like legitimate Astoria sources are now hijacked** and must not be cited
  (§14).
- Two fetch traps I hit and corrected, flagged so the verifier does not repeat them:
  - `nycgovparks.org/parks/rainey-park/history` silently serves **Bill Rainey Park in the Bronx**
    (Park ID X255, CB 2, zips 10455/10459), not Queens' Rainey Park. `/parks/Q015/history` serves
    **Forest Park**. Queens' Rainey Park is **not sourced in this file**.
  - Wikipedia content in §1 reached me through WebFetch's summarizing model, not as raw page text.
    Its "quotes" are **second-hand and may be that model's paraphrase**. Treat them as leads only.

---

## 1. Leads relayed via a summarizer — NOT reliable quotes

Source: https://en.wikipedia.org/wiki/Astoria,_Queens (aggregator; retrieved via WebFetch, whose
summarizer model produced the wording below). **The verifier must re-read the page directly before
using any of these.** I am listing them as leads, not as quotations.

- **F1.** Lead: the area was originally called Hallett's Cove after William Hallett, who is said to
  have settled there in 1652 "with his wife, Elizabeth Fones." (Note: NYC Parks names the wife
  **Elizabeth Feake** — see F19. Both names may attach to the same person; do not merge them
  without checking.)
- **F2.** Lead: Steinway and Sons "built a piano factory and worker housing in the northernmost
  portion of Astoria" in 1870.
- **F3.** Lead: Broadway is "traditionally considered the border" between Astoria and Ravenswood.
- **F4.** Lead: "The eastern end of Astoria, with Steinway Street as its main thoroughfare, is
  sometimes referred to simply as 'Steinway,' and the northern end around Ditmars Boulevard is
  sometimes referred to as 'Ditmars,' with their convergence point bearing the neighborhood name
  'Ditmars-Steinway.'" — **directly on this wave's hazard; verify verbatim.**
- **F5.** Lead: Ravenswood is "the strip of land bordering the East River and Long Island City, and
  is part of Astoria."
- **F6.** Lead: estimated population 198,608 (2024); 2020 census composition 14.6% Asian, 4.1%
  Black, 28.3% Hispanic, 47.3% White; median household income $93,460; poverty 13.8%; "The
  percentage of persons with a language other than English spoken at home is 50.9%." **Every one of
  these numbers depends on an Astoria boundary definition the source does not pin down — high risk.**
- **F7.** Lead: people from around 100 countries resided there as of 2015.
- **F8.** Lead: nicknames "Actoria," "The People's Republic of Astoria," "The Big Apple's Fruit
  Basket."
- **F9.** Lead: notable natives include Tony Bennett, Cyndi Lauper, Christopher Walken, John
  Frusciante; Maria Callas in early childhood.
- **F10.** Lead: St. Michael's Cemetery burials include Scott Joplin and Frank Costello.

---

## 2. Administrative geography — the primary boundary evidence

This is the most load-bearing section for the adjacency problem, and it is the best-sourced.

**Source: NYC Dept. of City Planning 2020 Neighborhood Tabulation Areas (NTAs), via NYC Open Data**
`https://data.cityofnewyork.us/resource/9nt8-h7nd.json?$limit=300&boroname=Queens`

- **F11.** DCP does not define a single polygon called "Astoria." It divides Queens Community
  District 1 into these NTAs, all carrying `cdtaname` exactly `"QN01 Astoria-Queensbridge (CD 1
  Equivalent)"`:
  | nta2020 | ntaname (verbatim) |
  |---|---|
  | QN0101 | `Astoria (North)-Ditmars-Steinway` |
  | QN0102 | `Old Astoria-Hallets Point` |
  | QN0103 | `Astoria (Central)` |
  | QN0104 | `Astoria (East)-Woodside (North)` |
  | QN0105 | `Queensbridge-Ravenswood-Dutch Kills` |
  | QN0161 | `Sunnyside Yards (North)` |
  | QN0171 | `St. Michael's Cemetery` |
  | QN0191 | `Astoria Park` |

- **F12.** **DCP hyphenates Astoria and Ditmars–Steinway into one unit** (QN0101). On this source
  there is no boundary between them at all — they are a single tabulation area. This is a
  first-order problem for any seed that treats them as two neighborhoods.

- **F13.** **DCP places "Long Island City-Hunters Point" (QN0201) in `QN02 Long Island City-Sunnyside-Woodside
  (CD 2 Approximation)` — i.e. Community District 2, NOT CD 1.** The CD-1 NTA that most sources
  would colloquially call "Long Island City" is instead `Queensbridge-Ravenswood-Dutch Kills`
  (QN0105).
  **This contradicts the premise handed to this wave** (that Astoria, Ditmars–Steinway and Long
  Island City "all sit in Queens Community District 1"). Recorded, not resolved: on DCP's data,
  the LIC that sits in CD 1 and the LIC that carries the name are not the same polygon.

- **F14.** Astoria Park is carved out as its own NTA (QN0191, `ntatype` 9), and St. Michael's
  Cemetery as another (QN0171, `ntatype` 7) — so park and cemetery acreage sits outside any
  residential "Astoria" NTA. Anyone computing Astoria statistics must decide whether to include them.

- **F15.** NYC Parks assigns **Community Board 1** and zips **11102, 11105** to Astoria Park;
  **CB 1**, zip **11106** to Socrates Sculpture Park; **CB 1**, zip **11102** to Hallets Cove
  Playground. (Source: the "More About…" panels on the NYC Parks pages cited below.)

---

## 3. History and etymology

**Source: NYC Parks, Astoria Park history (Historical Signs Project)**
`https://www.nycgovparks.org/parks/astoria-park/history`
NYC Parks states this text "is part of Parks' Historical Signs Project and can be found posted
within the park."

- **F16.** Verbatim: "A trail through the park led to a Lenape village at Pot Cove, where Indigenous
  peoples grew maize on the shores, fished in Hell Gate, and drew water from Linden Brook, a small
  stream that still flows under Astoria Park South."
- **F17.** Verbatim: "In the mid-1600s the Dutch parceled out this land to various colonists,
  including William Hallet (1616-1706) whose grant included hundreds of acres."
- **F18.** Verbatim: "Stephen Halsey, who founded the village of Astoria in 1839, named the area for
  his friend, fur merchant John Jacob Astor (1763-1848)."
- **F19.** Verbatim, from NYC Parks' **Hallets Cove Playground** history
  (`https://www.nycgovparks.org/parks/hallets-cove-playground/history`): "This cove was named after
  William Hallet (1616-1706), a dissident Puritan who married Elizabeth Feake after she was
  abandoned by her previous husband, who was also Hallet's business partner. The scandalous union
  forced the couple to leave Connecticut and in 1659 they established their home at Hallet's Neck."
  — **Conflicts with F1** on both the wife's surname (Feake vs. Fones) and the settlement date
  (1659 vs. 1652).
- **F20.** Verbatim: "Astoria Park was named after Astor as an attempt to get him to invest in the
  newly formed neighborhood in 1839. Although he never did, the name remained."
- **F21.** Verbatim: "During the 19th century, fashionable families like the Barclays, Potters,
  Woolseys, and Hoyts built country houses on the heights along the shore."
- **F22.** Verbatim: "In 1780 the frigate Hussar and its reported million-dollar cargo sank to the
  bottom of Hell Gate where, despite the removal of some of the cannons, the treasure was never
  recovered."
- **F23.** Verbatim: "During the American Revolution, several British and Hessian regiments were
  stationed in the area."

**Source: NYC Parks, Athens Square history** `https://www.nycgovparks.org/parks/athens-square/history`

- **F24.** Verbatim: "This area of Queens was formerly known by the Algonquian name of Sunswick,
  derived from the word Sunkisq, meaning 'woman chief.'"
- **F25.** Verbatim: "In 1839 developer Stephen A. Halsey incorporated the village of Astoria, named
  in honor of fur trader and landowner John Jacob Astor (1763-1848). Within a few decades, the area
  was home to a number of wealthy merchants, a substantial German-American community, and the
  Steinway piano company."

**Source: LPC designation report LP-2675, Barkin, Levin & Company Office Pavilion (Dec 19, 2023)**
`http://s-media.nyc.gov/agencies/lpc/lp/2675.pdf` — this report contains the single most useful
sentence found on the Astoria/LIC boundary.

- **F26.** Verbatim: **"Today, the area north of the Queensboro Bridge is called Astoria, though at
  the time of the factory's construction it was generally described as Long Island City."**
- **F27.** Verbatim: "Originally divided into five wards – the villages of Hunter's Point,
  Blisswood-Laurel Hill, Ravenswood, and two sections of Astoria – Long Island City was incorporated
  as a city in 1870."
- **F28.** Verbatim: "Sunswick Creek, which meandered north from Hunter's Point into Hallet's Cove
  at Ridge Street (now 33rd Avenue), was called 'Sunkisq' by local tribes, meaning 'place of the
  chief's wife." — **note this glosses Sunkisq differently from F24** ("place of the chief's wife"
  vs. "woman chief"). Also note the source text as extracted has an unbalanced quotation mark.
- **F29.** Verbatim: "William Hallet acquired Benfyn's land in 1652." and "Twelve years later, he
  expanded his holdings to include nearly all of present-day Astoria."
- **F30.** Verbatim: "The village of Astoria was incorporated in 1839."
- **F31.** Verbatim (partial sentence as extracted, OCR/layout break mid-sentence): "Halsey, who
  moved from Flushing, … purportedly named the area Astoria to attract financial backing from
  millionaire John Jacob Astor, who made a donation to build St." — **the sentence is cut off in my
  extraction; the church name is missing. Do not use without re-reading the PDF.** Note also that
  this says Astor **did** make a donation, which sits awkwardly against F20 ("Although he never
  did"). Recorded as a conflict, not resolved.
- **F32.** Verbatim: "Ferry service connecting Astoria and New York City was introduced in the
  mid-1700s."
- **F33.** Verbatim: "Halsey was an investor in the Hell Gate Ferry, which connected East 86th
  Street in Manhattan with Fulton Avenue, one of the main thoroughfares in Astoria, until 1866, when
  the Manhattan terminal was moved to East 92nd Street."
- **F34.** Verbatim: "Service was provided by a succession of private firms, including the Astoria
  Ferry Company, the Queens County Ferry Company, and the New York & East River Ferry Company."
- **F35.** Verbatim: "On Vernon Avenue (now Boulevard) a street railway connected Astoria to
  Hunter's Point and Williamsburgh, and 'fast steamers' served Harlem and Lower Manhattan from a
  dock close to Jamaica Avenue (now 31st Avenue)."

**Source: LPC designation report LP-2196, Astoria Park Pool and Play Center (Jun 20, 2006)**
`http://s-media.nyc.gov/agencies/lpc/lp/2196.pdf`

- **F36.** Verbatim: "Long Island City and Astoria became part of greater New York City in the
  consolidation of 1898."
- **F37.** Verbatim: "By 1907, the land now occupied by Astoria Park and its surroundings remained
  occupied by fading, former estates of prominent families and ship captains, who had moved away as
  industrial and residential developments loomed ever closer."

---

## 4. The waterfront, Hell Gate, and disasters

- **F38.** NYC Parks (Astoria Park history), verbatim: "Although attempts were made to remove the
  dangerous rocks in Hell Gate in the 1850s and 1870s, the waters were the site of New York City's
  worst maritime disaster on June 15, 1904. En route to Long Island's North Shore with the
  congregation of St. Mark's German Lutheran Church on board, the steamer General Slocum caught
  fire. At least 1,021 passengers out of 1,300 burned to death or drowned in the turbulent waters of
  the East River before the ship grounded on North Brother Island."
- **F39.** NYC Parks (Socrates Sculpture Park history,
  `https://www.nycgovparks.org/parks/socrates-sculpture-park/history`), verbatim: "Situated at the
  confluence of the Harlem and East Rivers, the site has a picturesque view of 'Hell Gate,' or
  'Hellegat' as originally named by the Dutch colonists. Throughout the 17th and 18th centuries,
  this narrow strait between Astoria and Wards Island was infamous for treacherous navigational
  conditions caused by powerful tides and dangerous rock outcroppings."
- **F40.** Same source, verbatim: "The 1780 shipwreck of the British ship Hussar and numerous other
  marine tragedies which occurred in this channel necessitated an 1876 effort by the Army Corps of
  Engineers to blast away much of the dangerous ledge." — **date conflict with F22/F38**, which give
  the blasting attempts as "the 1850s and 1870s"; this one names 1876 specifically.
- **F41.** NYC Parks (Astoria Park history), verbatim: "As the Queens waterfront was industrialized
  after the Civil War, strong public sentiment for public access to the East River emerged."
- **F42.** LPC LP-2196, verbatim: "The Hell Gate Bridge, designed by engineer Gustav Lindenthal and
  architect Henry Hornbostel, was constructed over the northern park of Astoria Park in 1917; its
  majestic towers forming the park's northern vista." — the word "park" in "northern park" is
  **almost certainly an OCR error for "part"**; flagging rather than silently fixing.
- **F43.** NYC Parks (Hallets Cove Playground history), verbatim: "Hallets Point is a knob-shaped
  peninsula at the westernmost tip of Queens, framed by Pot Cove on the north and Hallett's Cove on
  the south. Hallets Point was initially the commercial center of Astoria and featured a ferry
  terminal."
- **F44.** Same source, verbatim: "Following the completion of the elevated Astoria Line in 1917 and
  the Triborough Bridge in 1936, many businesses relocated to be closer to these transportation
  hubs. Ferry service ended in 1936."
- **F45.** Same source, verbatim: "Subsequently, the City designated the peninsula a 'slum' to allow
  it to be cleared for the Astoria Houses, a public housing complex that opened in 1948."
- **F46.** Same source, verbatim: "In a project completed in portions in 2013, the Queens East River
  and North Shore Greenway linked this playground to other Queens waterfront parks to the north and
  south, including Astoria Park, Queensbridge Park, Rainey Park, Socrates Sculpture Park, and Ralph
  DeMarco Park. The Greenway is a shared-access trail that runs along the Queens shoreline."
- **F47.** Same source, verbatim: "The seawall that runs west and then north from the playground was
  repaired and partially reconstructed in 2021. The handball courts and multipurpose synthetic turf
  fields were rebuilt in 2023."

---

## 5. Parks

### P1. Astoria Park — 19th Street / Astoria Park South to Ditmars Blvd, zips 11102 & 11105
Source: NYC Parks `https://www.nycgovparks.org/parks/astoria-park/history`. Park ID **Q004**,
Community Board **1**, listed **Acreage: 59.96**, Property Type "Community Park."
Source assigns it to: **Astoria** (the neighborhood is named in the park's own name and text).

- **F48.** Verbatim: "In October 1913 the City of New York acquired more than 56 acres of land along
  the river for a park. It was originally called William J. Gaynor Park for the mayor who served
  from 1910 to 1913. It was later known as East River Park, but the Board of Aldermen officially
  named it Astoria Park in December 1913."
- **F49.** Verbatim: "The park was expanded twice, first with a four-and-a-half-acre parcel beneath
  the RFK (Triborough) Bridge in 1937 and later a five-acre strip (known as Ralph DeMarco Park)
  along the East River in 1969."
- **F50.** Verbatim: "In 1926 community members gathered to dedicate the Astoria Park Memorial in
  tribute to the sons of Long Island City who died in World War I." — note the memorial commemorates
  **Long Island City's** dead, in a park called Astoria Park. Relevant to §12.
- **F51.** Verbatim: "Major improvements in Astoria Park were undertaken by Parks Commissioner
  Robert Moses and the Works Progress Administration, notably the opening of the pool complex in
  1936. This facility hosted the swimming and diving trials for the U.S. Olympic Teams in 1936 and
  1964."
- **F52.** Verbatim: "Astoria Park is part of the Anchor Parks Initiative, a capital improvement
  program that invests in larger parks that serve as focal points for the surrounding community.
  Between 2019 and 2021, Charybdis Playground was rebuilt with all new equipment, a spray shower,
  and a complete renovation of the park house. The project also included an eight-lane track
  surrounding a synthetic turf soccer field; an adult fitness area adjacent to the track; amenities
  including water fountains and seating lining the waterfront; and a new rain garden and much needed
  erosion control."
- **F53. ACREAGE CONFLICT (three values, three sources).** NYC Parks' own data panel says
  **59.96** acres; NYC Parks' own narrative says "more than 56 acres" acquired in 1913 plus 4.5
  acres (1937) plus 5 acres (1969); LPC LP-2196 calls it "the sloping, **sixty-six acre** Astoria
  Park." Do not pick one silently.

### P2. Astoria Park Pool and Play Center — 19th Street between 22nd Drive and Hoyt Avenue North
Individual NYC Landmark **LP-02196**, designated **6/20/2006**. LPC record gives CD **401**, NTA
**QN0191** (Astoria Park). Source assigns it to: **Astoria** ("Astoria Park, Borough of Queens").

- **F54.** LP-2196 verbatim: "Constructed 1934-36; John M. Hatton and others, Architects; Aymar
  Embury II, Consulting Architect; Gilmore D. Clarke and others, Landscape Architects."
- **F55.** Verbatim: "The Astoria Play Center is one of a group of eleven immense new outdoor
  swimming pools which were opened in the summer of 1936 in a series of grand ceremonies presided
  over by Mayor Fiorello LaGuardia and Park Commissioner Robert Moses."
- **F56.** Verbatim: "Opened on July 2, 1936, with a capacity of 6,200 swimmers, and designed mainly
  by consulting Park Department architect John Matthews Hatton, the Astoria Play Center commands a
  striking waterfront location in Astoria Park."
- **F57.** Verbatim: "Astoria was the city's largest pool at 54,450 square feet, and the second
  largest WPA project in Queens after Jacob Riis Park."
- **F58.** Verbatim: "Harry Hopkins, the WPA administrator, called the Astoria Pool 'the finest in
  the world.'" (LP-2196 attaches footnote 18 to this.)
- **F59.** Verbatim: "It remains the city's largest public pool, and one of the major achievements of
  the New Deal in New York City."
- **F60.** Verbatim: "the final trials for the 1936 Summer Olympics were held here."
- **F61.** Verbatim: "The vast scale of the pool complex is complemented by that of its setting –
  the distant vistas westward framed by the monumental forms of the Hell Gate and Triborough
  Bridges."
- **F62.** Verbatim: "Among the Center's more unusual design elements are the whimsical saucerlike
  roofs atop the upper portions of the filter house structure on the western side of the swimming
  pool."
- **F63.** Verbatim: "Surviving documents also indicate that Robert Moses, himself a long-time
  swimming enthusiast, gave detailed attention to the designs for the new pool complexes."
- **F64.** Verbatim: "Most of the other pools, including Astoria, were placed in white
  neighborhoods." — **This is a sensitive claim about race and siting. I captured it as a standalone
  extracted sentence; I did NOT capture the surrounding paragraph, so its subject ("the other
  pools" relative to what) is unestablished in my extraction. Do not use until the full paragraph is
  read.**
- **F65. SIZE-CLAIM CONFLICT.** LP-2196 measures the pool as "**54,450 square feet**" and calls it
  the city's largest; the Wikipedia lead (F6 family) reportedly frames it as "the largest of New
  York City's public pools (at **330 feet long**)." Different metrics, possibly both true; do not
  conflate.

### P3. Socrates Sculpture Park — 32-01 Vernon Boulevard, zip 11106
**HEAVILY CONTESTED — see §12.** NYC Parks: Park ID **Q465**, CB **1**, Acreage **6.28**,
Property Type "Neighborhood Park."

- **F66.** NYC Parks history, verbatim: "In 1985 a coalition of artists led by local sculptor Mark
  di Suvero came here with a vision for an outdoor sculpture laboratory dedicated to up-and-coming
  artists."
- **F67.** Verbatim: "That year, they began the arduous process of restoring the site, and named it
  Socrates Sculpture Park - both in honor of Socrates (469-399 B.C.), the great Greek philosopher,
  and also as a tribute to **the people of Astoria, New York's largest Greek community**." (emphasis
  mine; the words are the source's.)
- **F68.** Verbatim: "in the years preceding 1985, the long-abandoned Marine Terminal had become
  desecrated with illegal dumping and graffiti, its panoramic vista inaccessible to citizens of
  **Astoria and Long Island City**." — the source itself straddles both names.
- **F69.** Verbatim: "By 1990, when Socrates Sculpture Inc. was formed to raise funds, oversee the
  arts programming, and manage the daily operations of the park…"
- **F70.** Verbatim: "Since 1993, the park has been under the jurisdiction of Parks."
- **F71.** Verbatim: "Socrates Sculpture Park was officially assigned as Parkland on December 14,
  1998."
- **F72.** The park's **own website footer** (`https://socratessculpturepark.org/about/`) gives the
  address verbatim as: "32-01 Vernon Boulevard, Long Island City, NY 11106" — i.e. **the
  institution calls itself Long Island City while the City's park history calls it a tribute to
  Astoria.**
- **F73.** The park's site navigation names features including "The Cubes," "The Sticks I & II,"
  "The Point," "Hallet's Cove Beach," "Seawall Reconstruction," "The Socrates Annual Fellowship,"
  and a "40th anniversary" initiative. (Nav labels, not prose.)

### P4. Athens Square (a/k/a The Park at Athens Square) — adjacent to P.S. 17, Astoria
Source: NYC Parks `https://www.nycgovparks.org/parks/athens-square/history`.
Source assigns it to: **Astoria** ("Astoria's citizens," "a little bit of Athens in Astoria").

- **F74.** Verbatim: "In 1963, this .9-acre site was acquired for a playground to be operated jointly
  by Parks and the Board of Education. A new school and playground were built, and P.S. 17 welcomed
  its first pupils in 1967." "P.S. 17 is named the Henry David Thoreau School, for the American
  naturalist and philosopher (1812-62)."
- **F75.** Verbatim: "The idea to reuse the play space as a neighborhood gathering place originated
  with members of Astoria's sizable Greek-American population, many of whom had immigrated to New
  York after the Greek civil war of 1945-49 and the relaxation of restrictive American immigration
  laws in 1962."
- **F76.** Verbatim: "Athens Square, Inc., a community-based group, formed to promote the park
  renovation, and Stamatios P. Lykos was engaged as the architect." "The group said its intention
  was to create 'a little bit of Athens in Astoria.'"
- **F77.** Verbatim: "A bronze statue of the philosopher Socrates (469-399 BC) mounted on a granite
  base, was unveiled in the park. Designed by artist Anthony Frudakis, the statue depicts Socrates
  in a seated position, gesturing as if engaged in dialogue."
- **F78.** Verbatim: "In 1996, three fluted Doric columns supporting a curved entablature, all of
  granite, were installed adjacent to the amphitheater. This composition echoes that of the Tholos
  of Athena Pronaia in Delphi (c. 390-380 BC)."
- **F79.** Verbatim: "Demetris Avramopoulos, Mayor of Athens, presented a replica of the Piraeus
  Athena (c. 350 BC) for installation in the park as a gift to the City of New York on March 28,
  1998. Sculptors Stavros Georgopoulos and Spiro Goggakis fashioned this bronze copy based on the
  ancient statue of Athena…"
- **F80.** Verbatim: "The Park at Athens Square has raised approximately $360,000 for Socrates and
  the columns."

### P5. Hallets Cove Playground — zip 11102, Park ID Q226, CB 1, Acreage 5.84
Source assigns it to: **Astoria** (Hallets Point "initially the commercial center of Astoria").
Facts F19, F43–F47 above.
- **F81.** Verbatim: "The land was vested to the City of New York in 1946 and transferred to NYC
  Parks in 1949. This site was originally named Astoria Houses Playground." "In 1987, the playground
  was renamed Hallets Cove Playground."

### P6. Ralph DeMarco Park
- **F82.** Named in F49 as the "five-acre strip … along the East River" added to Astoria Park in
  1969, and in F46 as a Greenway-linked waterfront park. I fetched its page but did **not** extract
  its text; **unsourced beyond these two mentions.**

### P7. Queens Rainey Park — **NOT SOURCED.** See §0; my two attempts both hit the wrong park.
Mentioned only inside F46's Parks quote.

---

## 6. Landmarked buildings — LPC individual landmarks in Queens CD 1

**Source: LPC "Individual Landmark Sites," NYC Open Data**
`https://data.cityofnewyork.us/resource/buis-pvji.json?cd=401&$limit=200`
This returns **exactly nine** individual landmarks with `cd = 401`. Listed verbatim from the
dataset, with the DCP NTA the dataset itself assigns:

| # | lpc_name | LP number | address | designated | nta2020 |
|---|---|---|---|---|---|
| P8 | Astoria Park Pool and Play Center | LP-02196 | 19th Street between 22nd Drive and Hoyt Avenue North | 6/20/2006 | QN0191 |
| P9 | Famous Players-Lasky Studio | LP-00977 | 35-11 35th Avenue | 3/14/1978 | QN0103 |
| P10 | Sohmer & Company Piano Factory | LP-02172 | 31-01 Vernon Boulevard | 2/27/2007 | QN0102 |
| P11 | Benjamin T. Pike House | LP-00632 | 18-33 41st Street | 2/15/1967 | QN0101 |
| P12 | Lawrence Family Graveyard | LP-00136 | southeast corner of 20th Road and 35th Street | 4/19/1966 | QN0101 |
| P13 | Abraham Lent House | LP-00135 | 78-03 19th Road | 3/15/1966 | QN0101 |
| P14 | Moore-Jackson Cemetery | LP-01956 | 51st to 54th Streets between 31st and … | 3/18/1997 | QN0104 |
| P15 | Barkin, Levin & Company Office Pavilion | LP-02675 | 12-12 33rd Avenue | 12/19/2023 | QN0105 |
| P16 | Bank of the Manhattan Company Building, Long Island City | LP-02570 | 29-27 Queens Plaza North | 5/12/2015 | QN0105 |

- **F83.** The dataset's `lpc_altern` field for LP-00977 reads verbatim: "now Kaufman's Astoria
  Motion Picture and Television Center, designated as Paramount Studios Building No. 1."
- **F84.** For contrast, LPC individual landmarks with `cd = 402` (the "other" LIC) are only four:
  Pepsi-Cola Sign (LP-01653), New York Architectural Terra Cotta Company Building (LP-01304), Fire
  Engine Company 258 / Hook and Ladder (LP-02200), and New York State Supreme Court, Queens County,
  Long Island City (LP-00925).

### P9 detail — Famous Players-Lasky Studio / Paramount Studios Building No. 1 / Kaufman Astoria
Source: LPC LP-0977 `http://s-media.nyc.gov/agencies/lpc/lp/0977.pdf` (OCR'd; the extraction has
characteristic `I`/`l` errors, reproduced below as extracted).

- **F85.** LP-0977 header verbatim: "PARAMOUNT STUDIOS, BUILDING N0.1 (MAIN BUILDING), 35-11 35th
  Avenue, **Astoria**, Borough of Queens. Bui It 1920-1921; Designed by the Fleischman Construction
  Company." — **LPC's own header assigns the address to Astoria.**
- **F86.** Verbatim (OCR artifacts intact): "1 (Main Bui !ding) at 35-11 35th Avenue in Astoria,
  Queens, is one of the few active studios in New York dating from the early 1900s when the city was
  the motion picture capital of the nation."
- **F87.** Verbatim: "To serve as their eastern production headquarters the Famous Players Lasky
  Corporation built a motion picture studio in Astoria, Queens, in 1920-21…"
- **F88.** Verbatim: "The construction of a 'New Mi l I ion Dollar Moving Picture Studio' in Astoria
  for the Famous Players Lasky Corporation was first announced in the New York Times on April 20,
  1919."
- **F89.** Verbatim: "The first feature length sound picture produced at the Astoria studio was 'The
  Letter,' starring Jeanne Eagels, in 1929."
- **F90.** Verbatim: "Paramount moved alI studio operations to California in 1932, and turned the
  Astoria studio over to independent producers whose films were released through Paramount, Of these
  more than twenty independent productions none was more controversial than the Paul Robeson film of
  Eugene O'Nei I I 's 'The Emperor Jones.'"
- **F91.** Verbatim: "In January 1942, the Astoria studio was transferred to the War Department, and
  Army productions began within several months."
- **F92.** Verbatim: "The Astoria Studio was in continuous use until 1970 when Armed Forces
  productions ceased operations and the bui I ding was turned over to New York City."
- **F93.** Verbatim: "The Astoria Motion Picture and Television Center Foundation, a not-for-profit
  corporation, has managed the Astoria studio since 1977…"
- **F94.** Verbatim: "It is appropriate that the Astoria studio has been declared eligible for
  I !sting on the Nat ional Register of Historic Places as 'one of the most significant movie
  complexes in the nation.'" — note in 1978 LPC says only **eligible for** listing.
- **F95.** Kaufman Astoria Studios' own site (`https://kaufmanastoria.com/about/`) verbatim:
  "Originally opened in **1920** by Famous Players-Lasky (later known as Paramount)…" and "KAS was
  among the earliest motion picture studios to be listed on the National Register of Historic
  Places." **Date tension with F85/F87 ("1920-1921" / "1920-21") and with LP-2196's "1919-21"
  (F103). Three different construction windows across three City/company documents.**
- **F96.** Kaufman site verbatim: "With over 120 silent and sound films produced on its stages, the
  studio has hosted cinematic legends such as The Marx Brothers, Rudolph Valentino, Gloria Swanson,
  and W.C. Fields."
- **F97.** Kaufman site verbatim: "…the preferred location for renowned directors including Martin
  Scorsese, Spike Lee, Norman Jewison, Woody Allen, Francis Ford Coppola, and Ava DuVernay. The
  studio has also served as the backdrop for groundbreaking television series and films, including
  Succession, Sesame Street, Birdman, Orange is the New Black, Nurse Jackie, and American Horror
  Story."
- **F98.** Kaufman site footer verbatim: "KAUFMAN ASTORIA STUDIOS | **34-12 36th STREET** |
  718-392-5600" — **the company's street address differs from the landmark address (35-11 35th
  Avenue).** Likely a large complex with multiple frontages; record both, do not merge.

### P10 detail — Sohmer & Company Piano Factory Building, 31-01 Vernon Boulevard
Source: LPC LP-2172 `http://s-media.nyc.gov/agencies/lpc/lp/2172.pdf` (clean text layer).
**This is the sharpest single Astoria/LIC conflict in the file.**

- **F99.** Header verbatim: "SOHMER & COMPANY PIANO FACTORY BUILDING, 31-01 Vernon Boulevard (a/k/a
  11-02 to 11-16 31st Avenue), Borough of Queens. Built c. 1886 (Berger & Baylies, architects);
  addition: c.1906-07 (attributed to Franklin Baylies)."
- **F100.** Verbatim: "One of the most prominent structures along the Queens side of the East River
  **in Long Island City**, the Sohmer & Co. Piano Factory Building is distinguished by its
  monumental scale and prominent mansard-roofed clock tower."
- **F101.** Verbatim, and note the section heading itself hedges: section titled "**The Industrial
  Development of Long Island City/Astoria**" opens "The Sohmer & Company Piano Factory Building is
  located **in the northern part of Long Island City near Astoria** on the East River waterfront of
  Queens."
- **F102.** Verbatim: "In 1870, Long Island City became an incorporated municipality, the fourth
  within the current boundaries of New York City, after New York City itself, Brooklyn, and
  Williamsburgh. That year, the Steinway family began to acquire 400 acres of land on the East River
  at the present-day Steinway Street and laid out Steinway Village, which attracted many residents
  of German extraction. At about the same time, the German United Cabinet Workers bought four area
  farms and developed an area known as Germantown."
- **F103.** Verbatim: "Beginning in the 1870s, and continuing until the turn of the century, large
  oil refineries, lumber yards, and factories for asphalt, ceramic pipe, barrels, tin ware, and
  glass, as well as chemical and gas plants lined the shoreline from Hunter's Point to Astoria,
  replacing the area's earlier country estates and farms, creating jobs and the need for housing."
  And: "The area also gained importance in the fledgling movie industry with the opening of the
  Famous Players – Lasky Studios, later Paramount Studios, in **1919-21** (35-11 35th Avenue, a
  designated New York City Landmark). The Triborough Bridge, connecting the neighborhood to the
  Bronx and the mainland, opened in 1936."
- **F104.** Verbatim: "Sohmer & Co. was founded in 1872 in Manhattan by the German immigrant Hugo
  Sohmer (1845-1931). The firm specialized in the making of 'verticals' or upright pianos…"
- **F105.** Verbatim: "In 1872, there were 171 piano manufacturers in New York City; now, most
  pianos are produced abroad."
- **F106.** Verbatim: "Composer Victor Herbert owned several Sohmer pianos and the noted American
  songwriter Irving Berlin had three Sohmers with transposing keyboards that he used that he used to
  write his music." (the doubled "that he used" is in the source as extracted.)
- **F107.** Verbatim: "The company remained at the plant until 1982, when it was acquired by the
  Pratt, Read & Co., America's leading manufacturer of piano keyboards and actions, which moved the
  factory to Ivoryton, Connecticut. Sohmer pianos are now made in Korea. After Sohmer departed, the
  factory in Queens was acquired by the Adirondack Chair Company."
- **F108.** Verbatim: "The Sohmer Building, which is one of the few extant survivors of the
  once-thriving piano-manufacturing industry in New York City, is a significant reminder of the
  industrial past of the East River waterfront, and is one of the rare surviving nineteenth-century
  factory buildings found in Queens."
- **F109.** Verbatim, on the contested designation politics: "Queensborough President Helen
  Marshall, City Councilmember Peter F. Vallone, Jr., and State Senator George Onorato sent letters
  opposing designation." And: "Eight witnesses testified in favor of the designation, including
  representatives of Metropolitan Waterfront Alliance, the Municipal Arts Society, and the Historic
  Districts Council."
- **F110.** Verbatim: "The Landmarks Preservation Commission held earlier public hearings on November
  15, 1983 (LP-1462), which was continued on June 12, 1984 and on July 10, 1990 (LP-1799), which was
  continued on September 11, 1990."

### P11 detail — Benjamin T. Pike House / "Steinway House" / Steinway Mansion, 18-33 41st Street
Source: LPC LP-0632 `http://s-media.nyc.gov/agencies/lpc/lp/0632.pdf` (**badly OCR'd 1967 typescript
— quotes below contain obvious scanning corruption, reproduced as extracted; treat every quote here
as needing re-reading from the PDF image**).

- **F111.** Header verbatim as extracted: "STEINWAY HOUSE, 18-33 41st Street, **Steinway**, Borough
  of Queens. Built about 1840; architect unknown." — **LPC's 1967 neighborhood label is "Steinway,"
  not "Astoria."** Directly relevant to §12.
- **F112.** Verbatim as extracted: "The Steinway House was originally built ·in a delightful rural
  setting on the river as a spacious Ita ianate country villa. It is built of handsome, roughhewn
  blocks of granite."
- **F113.** Verbatim as extracted: "In the 1850's when it was · built, American architects had
  departed from the rigid square or rectangular plan…" — **contradicts its own header (F111,
  "Built about 1840").**
- **F114. THREE-WAY DATE CONFLICT.** LPC header: "about 1840." LPC body: "In the 1850's when it was
  built." NYC **PLUTO** (`data.cityofnewyork.us/resource/64uk-42ks.json`) records `18-33 41 STREET`,
  owner `STEINWAY MANSION 1 LLC`, zip 11105, cd 401, **`yearbuilt: 1858`**, lotarea 10000,
  numbldgs 2, bldgclass A7.
- **F115.** Verbatim as extracted: "In the Steinway House the plan for its twenty-seven rooms is both
  rambling and asymmetrical."
- **F116.** Verbatim as extracted: "The main entrance porch, one bay in depth, rests on four
  cast-iron Corinthian columns."
- **F117.** Verbatim as extracted: "The house was originally built for Benjamin Pike. During the
  18?0t s William S-teinway, the piano manUfacturer, bought it, and his family occupied the house
  until the 1920's. The Steinways had a piano manufacturing plant and a village for their workers in
  the area. Originally the house was surrounded by tennis courts, stables, lawns and orchards." —
  **the acquisition decade is literally illegible ("18?0t s") in the OCR. Do not state a decade.**

### P13 detail — Abraham Lent House / Lent Homestead, 78-03 19th Road
Source: LPC LP-0135 `http://s-media.nyc.gov/agencies/lpc/lp/0135.pdf` (OCR'd).
- **F118.** Header verbatim as extracted: "LENT HOMESTEAD, 78-03 19th Road, **Steinway**, Queens.
  Built about 1729; architect unknown." — again **LPC's neighborhood label is "Steinway."** DCP puts
  this address in QN0101 (Astoria (North)-Ditmars-Steinway).
- **F119.** Verbatim as extracted: "The farmhouse dates from about 1729 and was built by Abraham
  Lent, grandson of Abraham Riker. On the prop..:::rty was an important family cemetery with early
  tombs of the Rikers and Lents. The garden side of thu grounds opens to the East River…"
- **F120.** Verbatim as extracted: "Fire destroyed the upper part of the house about 1955, but since
  then repai.rs have been made, and the homestead has been restored."
- **F121.** Verbatim as extracted: "…it is one of tho very last of tho Dutch Colonial farmhouses
  remaining in Queens County."

### P12 detail — Lawrence Family Graveyard
Source: LPC LP-0136 `http://s-media.nyc.gov/agencies/lpc/lp/0136.pdf` (OCR'd).
- **F122.** Header verbatim as extracted: "LAWRENCE FAMILY GRAVEYARD, Southeast corner of 2oth Road
  and 35th Street intersection, **Steinway**, Borough of Queens. 1703." — **third LPC "Steinway"
  label.** ("2oth" is an OCR error for "20th".)
- **F123.** Verbatim as extracted: "Miss Ruth Lawrence, the last member of the Lawrence family to
  live **in Astoria**, was the last member of the family to be buried there in 1956." — **the same
  document uses "Steinway" in its header and "Astoria" in its body for the same site.** This is the
  cleanest single-document demonstration of the boundary problem.

### P15 detail — Barkin, Levin & Company Office Pavilion, 12-12 33rd Avenue
- **F124.** LP-2675 "LOCATION" block verbatim: "Borough of Queens / 12-12 33rd Avenue, **Long Island
  City**."
- **F125.** Verbatim: "An elegant mid-20th century modern office building with an unusual
  umbrella-like structural system, designed by the German American architect Ulrich Franzen."
- **F126.** Verbatim: "Located in the northernmost part of Long Island City, close to the Noguchi
  Museum and Socrates Sculpture Park, this graceful minimalist structure was originally part of a
  factory that manufactured women's coats."
- **F127.** Verbatim: "The Barkin, Levin & Company Office Pavilion stands several blocks from the
  East River in Queens on 33rd Avenue, one block south of Broadway."
- **F128.** Photo credit line verbatim: "Barkin Levin Plant, October 1958 / Ezra Stoller/Esto."

### P16 detail — Bank of the Manhattan Company Building, Long Island City, 29-27 Queens Plaza North
- **F129.** Header verbatim: "BANK OF THE MANHATTAN COMPANY BUILDING, LONG ISLAND CITY / 29-27
  Queens Plaza North (aka 29-27 41st Avenue, 29-39 Northern Blvd), Borough of Queens / Built
  1925-27; Morrell Smith, architect."
- **F130.** Verbatim: "The Bank of the Manhattan Company Building is located in the **Dutch Kills
  section of Long Island City**, in northwestern Queens." (DCP NTA: QN0105, CD 1.)
- **F131.** Verbatim: "In subsequent years, the population of Long Island City surged, rising from
  90,000 in 1920 to an estimated 163,000 in 1928."
- **F132.** Verbatim: "The first of these, the elevated Queensboro Plaza Station, accommodating the
  Astoria and Flushing lines, opened in April 1917."
- **F133.** Bibliographic lead, verbatim from LP-2570's notes: "Seyfried, Three Hundred Years of Long
  Island City 1630-1930, (Queens Community Series: Astoria, New York, 1984), 139." — **Vincent
  Seyfried's book is the likely underlying authority for much of the LIC/Astoria history in these
  reports; a verifier should consider going to it directly.**

---

## 7. Museums and cultural institutions

**Primary source for addresses and City-assigned neighborhood: DCLA Cultural Organizations,**
NYC Open Data `https://data.cityofnewyork.us/resource/u35m-9t32.json`. Fields quoted are the
dataset's own `address` / `city` / `postcode` / `community_board` / `nta` values.

### P17. Museum of the Moving Image — 36-01 35th Avenue, zip 11106
- **F134.** DCLA record verbatim: `organization_name: "American Museum of the Moving Image"`,
  `address: "36-01 35th Avenue"`, `city: "Astoria"`, `postcode: "11106"`,
  `community_board: "Queens Community Board #1"`, `discipline: "Film/Video/Audio"`,
  `main_phone: "(718) 784-4520"`. **Source assigns it to: Astoria.**
  Note the dataset still uses the museum's older name ("American Museum of the Moving Image").
- **F135.** From NYC-ARTS (`https://www.nyc-arts.org/organizations/museum-of-the-moving-image/`, a
  secondary directory that **states on its own page "This website is no longer actively maintained"
  — use with caution**), verbatim: "Founded in 1981, Museum of the Moving Image is the nation's only
  museum devoted to film, television and digital media."
- **F136.** Same (stale) source, verbatim: "The core exhibition, Behind the Screen, spans two floors
  and 15,000 square feet and utilizes more than 1,400 historical artifacts, commissioned artworks,
  video clips and interactive exhibits…"
- **F137.** Same, verbatim: "The museum completed a major expansion and renovation, reopening its
  doors on January 15, 2011. Designed by architect Thomas Leeser, the project doubles the size of
  the building."
- **F138.** Same, verbatim: "The museum is located on the site of the historic Astoria Studios, once
  Paramount Pictures' East Coast facility. Across the street, the Kaufman-Astoria Studios is an
  active film and television studio."
- **F139.** Same, verbatim: "Each year the museum screens more than 400 films…"
- **NOTE:** the museum's own site was unreachable. **F135–F139 all rest on one stale aggregator.**
  This institution deserves a fresh primary source before anything is written about it.

### P18. The Noguchi Museum — CONTESTED
- **F140.** The museum's own About page (`https://www.noguchi.org/museum/about/`) verbatim:
  "**Located in Long Island City, Queens**, the Museum itself is widely viewed as among the artist's
  greatest achievements."
- **F141.** Its own footer address, verbatim: "The Isamu Noguchi Foundation and Garden Museum / 9-01
  33rd Road (at Vernon Boulevard) / Long Island City, New York 11106 / 718.204.7088"
- **F142.** DCLA's record for the same institution gives a **different street address**:
  `organization_name: "Isamu Noguchi Foundation and Garden Museum"`, `address: "32-37 Vernon
  Boulevard"`, `city: "Long Island City"`, `postcode: "11106"`, `community_board: "Queens Community
  Board #1"`. **Two City/institution sources, two addresses (9-01 33rd Road vs. 32-37 Vernon Blvd),
  same zip. Do not merge.**
- **F143.** Own site, verbatim: "Founded in 1985 by category-defying artist Isamu Noguchi
  (1904–1988), The Isamu Noguchi Garden Museum (now known as The Noguchi Museum), was the first
  museum in the United States to be established, designed, and installed by a living artist to show
  their own work."
- **F144.** Verbatim: "Isamu Noguchi established his studio in Long Island City in 1961. By 1974,
  Noguchi also purchased an abandoned factory building and vacant lot across the street, and over
  the following decade transformed these derelict spaces into an oasis for the display of his life's
  work. In 1980, Noguchi renamed his Akari Foundation as the Isamu Noguchi Foundation in
  anticipation of the Museum's creation. The Isamu Noguchi Garden Museum officially opened to the
  public on May 11, 1985."
- **F145.** Verbatim: "It features open air and indoor galleries in a repurposed 1920s industrial
  building and a serene outdoor sculpture garden." (Extracted as: "Holding the world's largest
  collection of his works, it features open air and indoor galleries in a repurposed 1920s
  industrial building and a serene outdoor sculpture garden.")
- **F146.** Verbatim: "Seasonal until 1999, significant renovations of the main building were
  completed in 2004 and the Museum has been open to the public year-round since."
- **F147.** Verbatim: "The Noguchi Museum is a 501(c)(3) public charity; and accredited by the
  American Alliance of Museums (AAM)."
- **F148.** Archive caption verbatim: "Isamu Noguchi at **32-37 Vernon Boulevard**, Long Island
  City, New York, 1980s. The Noguchi Museum Archives, 04160." — this reconciles F142: 32-37 Vernon
  appears to be a historic/studio address. **Recorded; not resolved.**

### P19. Socrates Sculpture Park, Inc. (organization)
- **F149.** DCLA record verbatim: `address: "32-01 Vernon Blvd."`, `city: "Long Island City"`,
  `postcode: "11106"`, `community_board: "Queens Community Board #1"`, `nta: "QN0105"`,
  `discipline: "Visual Arts"`. **DCLA's NTA (QN0105, Queensbridge-Ravenswood-Dutch Kills) differs
  from what LPC's dataset assigns to the neighboring Sohmer building at 31-01 Vernon (QN0102, Old
  Astoria-Hallets Point) — adjacent addresses, different NTAs across two City datasets.**

### P20. Greater Astoria Historical Society — CONTESTED BY ITS OWN NAME
- **F150.** DCLA record verbatim: `organization_name: "Greater Astoria Historical Society"`,
  `address: "32-63 48 Street"`, `city: "**Long Island City**"`, `postcode: "11103"`,
  `community_board: "Queens Community Board #1"`, `discipline: "Humanities"`,
  `main_phone: "(718) 278-0700"`.
- **F151.** Its own website (`https://www.astorialic.org/` — **note the domain literally combines
  "astoria" and "lic"**) tagline verbatim: "Greater Astoria Historical Society / Serving the Borough
  of Queens Since 1985."
- **F152.** Own site verbatim: "From our collection, which is the largest outside of NYPL, to
  research and educational programming—We are dedicated to helping Astoria Residents understand the
  history of this great Neighborhood." — **an unusually strong claim ("largest outside of NYPL")
  from a self-description; flag for scrutiny.**
- **F153.** Own site footer verbatim: "© 2025 Greater Astoria Historical Society" and the events
  panel reads "No upcoming events." (Site appears lightly maintained.)

### P21. Astoria Performing Arts Center
- **F154.** DCLA record verbatim: `address: "Kaufman Astoria Studios"`, `city: "Astoria"`,
  `postcode: "11106"`, `community_board: "Queens Community Board #1"`, `nta: "QN0103"`,
  `discipline: "Theater"`, `main_phone: "(917) 566-0969"`. **The dataset records a studio name, not
  a street address.** Its own site (`apacny.org`) returned no usable content.

### P22. Kaufman Arts District Foundation
- **F155.** DCLA record verbatim: `address: "c/o Kaufman Astoria Studios"`, `city: "Astoria"`,
  `postcode: "11106"`, `community_board: "Queens Community Board #1"`.
  **WARNING: `kaufmanartsdistrict.org` is now a hijacked domain (§14). Only the DCLA record supports
  this entity's existence in my research.**

### Other DCLA-listed cultural organizations with Astoria/LIC addresses (all verbatim field values)
Each line is a **candidate place**; the `city` value is the source's own neighborhood assignment.

- **P23. F156.** `Greek Cultural Center, Inc.` — `27-18 Hoyt Avenue South`, `Astoria`, `11102`,
  CB #1, Theater.
- **P24. F157.** `Greek American Educational Public Information System, Inc.` — `23-18 29th Street`,
  `Astoria`, `11105`, CB #1.
- **P25. F158.** `AKTINA Productions, Inc.` and **P26.** `CYPRECO of America, Inc.` — both at
  `21-02 28th Avenue`, `Astoria`, `11102`, CB #1 (Music; Folk Arts). Same address, two organizations.
- **P27. F159.** `Greek-American Broadcasting Information & Cultural Activities Corporation` —
  `20-12 20th Street, Apt. 2C`, `Astoria`, `11105`, CB #1.
- **P28. F160.** `Central Astoria Local Development Coalition, Inc.` — `25-69 38th St`, `Astoria`,
  `11103`, CB #1.
- **P29. F161.** `Art House Astoria Conservatory for Music and Art` — `23-35 Broadway`, `Astoria`,
  `11106`, CB #1.
- **P30. F162.** `Variety Boys & Girls Club of Queens, Inc.` and **P31.** `Titan Productions
  Incorporated` — both `21-12 30th Road`, `Astoria`, `11102`, CB #1, `nta: QN0102`.
- **P32. F163.** `Muslim American Society of Queens` — `46-01 20th Ave`, `Astoria`, `11105`, CB #1.
- **P33. F164.** `Syrian Music Preservation Initiative Corp` — `2568 36th St`, `Astoria`, `11103`,
  CB #1, Music.
- **P34. F165.** `Astoria Music Society, Inc.` — `22-70 23rd Street`, `Astoria`, `11105`, CB #1.
- **P35. F166.** `IndieSpace, Inc.` — `48-15 28th Avenue`, `Astoria`, `11103`, CB #1, Theater.
- **P36. F167.** `Epic Theatre Center, Inc.` — `31-01 Vernon Blvd`, **`Astoria`**, `11106`, CB #1.
  **CONTESTED: this is the Sohmer Piano Factory address, which LPC calls Long Island City (F100).**
- **P37. F168.** `Ecuadorian American Cultural Center, Inc.` — `36-32 34th St`, **`Long Island
  City`**, `11106`, CB #1.
- **P38. F169.** `Theatron, Inc.` — `32-15 38th Street`, **`Long Island City`**, `11103`, CB #1,
  `nta: QN0104` (Astoria (East)-Woodside (North)). **CONTESTED.**
- **P39. F170.** `Flux Factory` — `39-31 29TH STREET`, `LONG ISLAND CITY`, `11101`, **CB #1**,
  Visual Arts. **CONTESTED (LIC address, Astoria's community board).**
- **P40. F171.** `CultureNOW, Inc.` — `37-24 24th Street`, `LONG ISLAND CITY`, `11101`, **CB #1**.
- **P41. F172.** `Chinese Theatre Works, Inc.` — `3718 Northern Blvd`, `Long Island City`, `11101`,
  **CB #1**.
- **P42. F173.** `Together in Dance, Inc.` — `34-18 Northern Blvd`, `Long Island City`, `11101`,
  CB #1, `nta: QN0161` (Sunnyside Yards (North)).
- **P43. F174.** `Theater et al` — `38-33 24th Street`, `Long Island City`, `11101`, CB #1,
  `nta: QN0105`.
- **P44. F175.** `Astoria Film Festival Inc` — `3355 14 St`, **`Astoria`**, `11106`, but
  **`community_board: "Queens Community Board #2"`**. **CONTESTED in the opposite direction.**
- **P45. F176.** `Williamsburg Art Nexus, Inc.` — `24-26 26th Street`, `Astoria`, `11102`,
  `nta: QN0101` (Astoria (North)-**Ditmars-Steinway**). **CONTESTED Astoria/Ditmars-Steinway.**
- **P46. F177.** `Stage Aurora NY` — `24-54 29th Street #2A`, `Astoria`, `11102`, `nta: QN0101`.
  **Same Astoria/Ditmars-Steinway conflict.**
- **P47. F178.** `Wreckio Ensemble Theatre, Inc.` — `23-54 23rd Street`, `Astoria`, `11105`,
  `nta: QN0101`. **Same conflict.**
- **P48. F179.** `Jon Lehrer Dance, Inc.` — `44-14 Newtown Road`, `Astoria`, `11103`, CB #1,
  `nta: QN0104`.
- **P49. F180.** `Goliard Concerts, Inc.` — `30-87 46th Street`, `Astoria`, `11103`, CB #1.
- **P50. F181.** `Random Access Music, Ltd.` — `3368 21st St.`, `Astoria`, `11106`, CB #1.
- **P51. F182.** `Creative Netwerk` — `25-18 43rd Street`, `Astoria`, `11103`, CB #1.
- **P52. F183.** `New Thread Quartet, Inc.` — `2138 Crescent St D3`, `Astoria`, `11105`, CB #1.
- **P53. F184.** `Make Music New York, Inc.` — `1919 24th Avenue, L210`, `Astoria`, `11102`, CB #1.
- **P54. F185.** `Abingdon Theatre Company` — `31-57 31st St, Unit 617`, `Astoria`, `11106`, CB #1.
- **P55. F186.** `Wide Eyed Productions` — `24-50 29th St., Apt 3A`, `Astoria`, `11102`, CB #1.
- **P56. F187.** `Poverty Elimination And Community Education Foundation, Inc.` — `35-28, 30th
  Street`, `Astoria`, `11106`, CB #1.
- **CAUTION on the whole block above:** many of these are **apartment-unit addresses** (`Apt. 2C`,
  `#2A`, `Apt 3A`, `Unit 617`, `D3`). Those are administrative mailing addresses of small
  nonprofits, **not visitable venues**. Do not present them to a traveler as places.

---

## 8. Industry, immigration and demographics

- **F188.** Greek community, NYC Parks (Socrates), verbatim: "the people of Astoria, **New York's
  largest Greek community**" (F67). This is signage text of uncertain vintage (the same page
  references Mayor Giuliani and Borough President Claire Shulman, so it is likely late-1990s).
  **Age-sensitive claim — do not present as current without a contemporary source.**
- **F189.** Greek immigration timing, NYC Parks (Athens Square), verbatim: "many of whom had
  immigrated to New York after the Greek civil war of 1945-49 and the relaxation of restrictive
  American immigration laws in 1962" (F75).
- **F190.** German/piano industry, LPC LP-2172, verbatim: Steinway "began to acquire 400 acres of
  land on the East River at the present-day Steinway Street and laid out Steinway Village, which
  attracted many residents of German extraction," alongside "the German United Cabinet Workers…
  developed an area known as Germantown" (F102).
- **F191.** Czech/Slovak presence: Bohemian Hall & Beer Garden's own site, verbatim: "We continue to
  honor the traditions of those who established it through traditional Czech and Slovak beer
  selections, cuisine, decor and more. Our premises have been a haven for culture in Astoria for
  generations."
- **F192.** Arab/Egyptian presence — **weakly sourced.** The only evidence I could assemble is
  indirect: DOHMH lists two restaurants with `cuisine_description: "Egyptian"` on **Steinway
  Street** (Kabab Cafe, 25-12 Steinway Street; Mombar, 25-22 Steinway Street), and DCLA lists
  `Muslim American Society of Queens` (46-01 20th Ave, Astoria) and `Syrian Music Preservation
  Initiative Corp` (2568 36th St, Astoria). **I found no source that uses the phrase "Little Egypt"
  or that characterizes Steinway Street's Arab commercial corridor. This vein is real but
  under-sourced here and needs a dedicated pass.**
- **F193.** Bangladeshi, Brazilian, Latin American and South Asian Astoria: **no source obtained.**
  DOHMH cuisine tags in the four zips do include Latin American (Arepas Cafe, 33-07 36 Avenue),
  Indian (Seva, 34-11 30 Avenue), Thai (Pye Boat Noodle, 35-13 Broadway) and Japanese (Hinomaru
  Ramen, 33-18 Ditmars Boulevard), but **cuisine tags are not evidence about communities.** Gap.
- **F194.** Astoria Generating Station / "Big Allis" / the Con Edison–Astoria power complex:
  **NO SOURCE OBTAINED.** `riselightandpower.com` returned empty. Given how much of the Astoria
  waterfront these plants occupy, this is a real gap.
- **F195.** Public housing: Astoria Houses "opened in 1948" (F45, NYC Parks). NYCHA's development
  page returned only navigation chrome; **no NYCHA-sourced unit counts or dates obtained.**
- **F196.** Demographics: see F6 and its warning. **I obtained no census-sourced or DOHMH Community
  Health Profile figures** — the CHP PDF fetch returned an nyc.gov error page and the DCP Community
  Profiles site is a JavaScript shell. **Astoria has no reliably sourced population figure in this
  file.**

---

## 9. Religious institutions and cemeteries

- **F197.** **St. Demetrios Cathedral: NO SOURCE OBTAINED.** Both `stdemetriosastoria.com` and
  `stdemetriosastoria.org` returned empty, and `goarch.org` blocked the fetch. Widely regarded as
  central to Greek Astoria; **entirely unsourced here.** Priority gap.
- **F198.** St. Michael's Cemetery is significant enough that **DCP gives it its own NTA**, QN0171,
  within CD 1 (F11). Burials claim (Joplin, Costello) is F10 — summarizer-relayed, unverified.
- **F199.** Moore-Jackson Cemetery is an individual NYC Landmark, LP-01956, designated 3/18/1997,
  "51st to 54th Streets between 31st and …" (address truncated in the dataset row), NTA QN0104.
- **F200.** Lawrence Family Graveyard (1703) — F122/F123. Note LPC's date field is simply "1703."
- **F201.** The Lent Homestead had "an important family cemetery with early tombs of the Rikers and
  Lents" on the property (F119).
- **F202.** LP-2675 (F31) states Astor "made a donation to build St. ___" — **the church name is
  missing from my extraction.** If recovered, this is a specific, checkable Astoria church fact.

---

## 10. Transit

**Source: MTA Subway Stations, NY State Open Data** `https://data.ny.gov/resource/39hk-dx4f.json`

- **F203.** The dataset's `line` value **"Astoria"** covers nine stations. The six in Queens, verbatim
  from the dataset (`stop_name` | `daytime_routes` | `structure` | `gtfs_stop_id`):
  - `Astoria-Ditmars Blvd` | `N W` | Elevated | R01
  - `Astoria Blvd` | `N W` | Elevated | R03
  - `30 Av` | `N W` | Elevated | R04
  - `Broadway` | `N W` | Elevated | R05
  - `36 Av` | `N W` | Elevated | R06
  - `39 Av-Dutch Kills` | `N W` | Elevated | R08
  - (plus `Queensboro Plaza` | `N W` | Elevated | R09, and two Manhattan stations, `Lexington Av/59 St`
    and `5 Av/59 St`, both `N R W`.)
- **F204.** Several Queens stations on the line carry `north_direction_label: "Astoria"` — i.e. the
  MTA uses "Astoria" as a **direction**, not only a place.
- **F205.** The northern terminal's name, `Astoria-Ditmars Blvd`, **hyphenates the two contested
  neighborhood names into a single station name** — worth noting for §12.
- **F206.** `39 Av-Dutch Kills` names a **third** neighborhood on the same line.
- **F207.** Steinway Street station, verbatim from the dataset: `stop_name: "Steinway St"`,
  `line: "Queens Blvd"`, `daytime_routes: "M R"`, `structure: "Subway"`, `division: "IND"`,
  `gtfs_stop_id: "G19"`, `ada: "0"`. **Note it is on a different line (IND Queens Blvd) from the
  BMT Astoria Line.**
- **F208.** LP-2570, verbatim: "the elevated Queensboro Plaza Station, accommodating the Astoria and
  Flushing lines, opened in April 1917."
- **F209.** NYC Parks, verbatim: "the completion of the elevated Astoria Line in 1917" (F44).
- **F210.** NYC Ferry (`https://www.ferry.nyc/routes-and-schedules/route/astoria/`) verbatim: "The
  Astoria route of NYC Ferry connects the growing residential and business communities of Western
  Queens and Roosevelt Island."
- **F211.** Same page, verbatim landing list for the Astoria route: "East 34th Street: 2319805 /
  Wall St./Pier 11: 2319811 / **Astoria: 2319818** / Roosevelt Island: 2319819 / **Long Island
  City: 2319820** / East 90th St: 2319872 / Brooklyn Navy Yard: 2319875." — **NYC Ferry operates
  distinct "Astoria" and "Long Island City" landings on the same route**, which is useful evidence
  that the City treats them as separate places at the waterfront. The page does **not** give the
  street location of the Astoria landing; that is still unsourced.
- **F212.** Same page, verbatim: "Approximate Total Time / 49 min."
- **F213.** Bus service: **NO SOURCE OBTAINED.** F6's summarizer lead mentions Q18, Q19, Q63, Q66,
  Q69, Q100–Q104 and the M60 SBS, but that is second-hand. **No MTA bus source was fetched.** Gap.
- **F214.** Bridges: Hell Gate Bridge (1917, Lindenthal/Hornbostel — F42) and the Triborough/RFK
  Bridge (opened 1936 — F44, F49, F103). `mta.info`'s RFK page returned no content; **no MTA
  Bridges & Tunnels source obtained.**

---

## 11. Food and businesses — SOURCING STATUS DECLARED PER ENTRY

Per the wave rule, each entry below states explicitly whether a **DOHMH restaurant-inspection
dataset is the ONLY source.** The dataset is
`https://data.cityofnewyork.us/resource/43nn-pn8j.json` (DOHMH Restaurant Inspection Results),
queried for zips 11102, 11103, 11105, 11106; it returned **513 distinct establishments**.
**Critical constraint: the DOHMH dataset carries a ZIP CODE and nothing else geographic — it has no
neighborhood field at all. It can never settle an Astoria/Ditmars/LIC question.**

### Has a non-DOHMH source (own website)
- **P57. Bohemian Hall & Beer Garden — 29-19 24th Avenue, Astoria, New York 11102.**
  **NOT DOHMH-only.** Own site `https://www.bohemianhall.com/`.
  - **F215.** Own site verbatim: "BOHEMIAN HALL & BEER GARDEN / New York City's Oldest Beer Garden /
    est. 1910."
  - **F216.** Own site verbatim: "Bohemian Hall & Beer Garden is an original New York City public
    house, having survived through prohibition."
  - **F217.** Own site verbatim address block: "29-19 24th Avenue / Astoria, New York 11102."
    **Source assigns it to: Astoria.**
  - **F218.** DOHMH corroborates independently: `BOHEMIAN HALL & BEER GARDEN`, `29-19 24 AVENUE`,
    `11102`, `cuisine_description: "Czech"`.
  - **CAUTION:** "New York City's Oldest Beer Garden" is the **business's own marketing claim**, not
    an independent finding.
- **P58. Taverna Kyclades — 36-01 Ditmars Blvd, ΝΥ, 11105.** **NOT DOHMH-only.** Own site
  `https://www.tavernakyclades.com/`.
  - **F219.** Own site verbatim: "Taverna Kyclades, in Astoria Queens, is one of the top Greek
    restaurants in New York City." **Source assigns it to: Astoria.**
  - **F220.** Own site verbatim: "Known for its large Greek population, Astoria, Queens is a hub for
    Greek food. Taverna Kyclades, centrally located on Ditmars Blvd., stands out for its seafood."
    — **note this is the restaurant describing itself on Ditmars Blvd. while calling the
    neighborhood Astoria. Relevant to §12.**
  - **F221.** Own site verbatim address: "Taverna Kyclades in Astoria / 36-01 Ditmars Blvd, ΝΥ,
    11105" (the "ΝΥ" uses a Greek capital Nu in the source). DOHMH corroborates: `36-01 DITMARS
    BOULEVARD`, `11105`, `Greek`.
  - **CAUTION:** F219/F220 are promotional self-description.
- **P59. Bahari Estiatorio — 31-14 Broadway, Astoria, NY 11106.** **NOT DOHMH-only.** Own site
  `https://www.bahariestiatorio.com/`.
  - **F222.** Own site verbatim address block: "31-14 Broadway / Astoria, NY 11106 / (718) 204-8968."
    **Source assigns it to: Astoria.**
  - **F223.** Own site verbatim: "Bahari (μπαχάρι in Greek, pronounced bah-HAH-ree), **formerly
    known as Stamatis and under the same proprietors**, now takes its authentic taste of Greece to a
    whole new level."
  - **F224. NOTE A COMPLICATION:** DOHMH lists **both** `BAHARI ESTIATORIO` (31-14 BROADWAY, 11106)
    **and** a separate `STAMATIS` (29-09 23 AVENUE, 11105). Bahari says it was "formerly known as
    Stamatis"; there is nonetheless a Stamatis at a different address in a different zip.
    **Do not assume these are the same business or that either is closed.**
- **P60. Sweet Afton — 30-09 34th St, Astoria, NY 11103.** **NOT DOHMH-only** (own site
  `https://www.sweetaftonbar.com/`); **it did not appear in my DOHMH extraction**, so it is
  effectively own-site-only here.
  - **F225.** Own site verbatim: "View Sweet Afton at 30-09 34th St, Astoria, NY 11103 on Google
    Maps." **Source assigns it to: Astoria.**
  - **F226.** Own site verbatim: "Astoria's Neighborhood spot. Enjoy a meal or drink at our garden
    patio or sidewalk cafe."

### DOHMH INSPECTION DATASET IS THE ONLY SOURCE
Everything in this block is sourced **solely** from
`https://data.cityofnewyork.us/resource/43nn-pn8j.json`. That dataset establishes only that a
permitted food-service establishment with this name, address and cuisine tag existed in the data.
**It does not establish that a business is open, notable, good, historically significant, or in any
particular neighborhood.** Values are verbatim dataset fields.

- **P61. F227.** `AGNANTI` — `19-06 DITMARS BOULEVARD`, `11105`, `Greek`. **DOHMH-only.** (Its
  apparent domain `agnantimeze.com` is hijacked — §14.)
- **P62. F228.** `TELLY'S TAVERNA` — `28-11 23 AVENUE`, `11105`, `Greek`. **DOHMH-only.**
- **P63. F229.** `ELIAS CORNER FOR FISH` — `24-02 31 STREET`, `11102`, `Seafood`. **DOHMH-only.**
- **P64. F230.** `STAMATIS` — `29-09 23 AVENUE`, `11105`, `Greek`. **DOHMH-only.** (See F224.)
- **P65. F231.** `CHRISTOS STEAKHOUSE` — `41-08 23 AVENUE`, `11105`, `Steakhouse`. **DOHMH-only.**
- **P66. F232.** `OMONIA CAFE` — `32-20 BROADWAY`, `11106`, `Greek`; and **P67.** `OMONIA NEXT DOOR`
  — `32-16 BROADWAY`, `11106`, `Bakery Products/Desserts`. **DOHMH-only.**
- **P68. F233.** `KABAB CAFE` — `25-12 STEINWAY STREET`, `11103`, `Egyptian`. **DOHMH-only.**
- **P69. F234.** `MOMBAR` — `25-22 STEINWAY STREET`, `11103`, `Egyptian`. **DOHMH-only.**
- **P70. F235.** `MILKFLOWER` — `34-12 31 AVENUE`, `11106`, `Pizza`. **DOHMH-only.**
- **P71. F236.** `PYE BOAT NOODLE` — `35-13 BROADWAY`, `11106`, `Thai`. **DOHMH-only.**
- **P72. F237.** `SEVA INDIAN CUISINE` — `34-11 30 AVENUE`, `11103`, `Indian`. **DOHMH-only.**
- **P73. F238.** `RIZZO'S FINE PIZZA` — `30-13 STEINWAY STREET`, `11103`, `Pizza`. **DOHMH-only.**
- **P74. F239.** `HINOMARU RAMEN` — `33-18 DITMARS BOULEVARD`, `11105`, `Japanese`. **DOHMH-only.**
- **P75. F240.** `AREPAS CAFE` — `33-07 36 AVENUE`, `11106`, `Latin American`. **DOHMH-only.**
- **P76. F241.** `GYRO UNO` — `28-01 STEINWAY STREET`, `11103`, `Mediterranean`. **DOHMH-only.**
- **P77. F242.** `GYRO WORLD` — `36-02 30 AVENUE`, `11103`, `Mediterranean`. **DOHMH-only.**
- **P78. F243.** `GYRO CITY` — `37-06 30 AVENUE`, `11103` (blank cuisine). **DOHMH-only.**
- **P79. F244.** `TASTE OF GYRO` — `20-48 42 STREET`, `11105`, `Greek`. **DOHMH-only.**

- **F245.** **Titan Foods** (the Greek grocery frequently associated with Astoria): **no source
  obtained** — it did not surface in my DOHMH extraction (it is a grocer, likely under DCWP rather
  than DOHMH) and I could not search. Gap.
- **F246.** **The Astoria Bookshop, Q.E.D., Astoria Bier & Cheese** and similar retail: **no source
  obtained** (`astoriabookshop.com/about` returned 24 bytes). Gap.
- **F247.** Steinway Street as a commercial corridor: NYC **PLUTO** (`64uk-42ks`) shows a dense run
  of small commercial lots on Steinway Street in zip **11105**, `cd: "401"`, with `bldgclass` values
  in the S- and E- (store/warehouse) families and `yearbuilt` values clustering **1890–1920** with a
  second cluster in **1988–2001** — e.g. `20-11 STEINWAY STREET` (1890), `20-65 STEINWAY STREET`
  (1890), `20-71 STEINWAY STREET` (1890), `20-78 STEINWAY STREET` (1915), `20-35 STEINWAY STREET`
  (1920), `19-79 STEINWAY STREET` (1931). **This is my inference from the tax-lot data, not a
  statement any source makes; treat as a lead about the corridor's age, not a fact.**

---

## 12. CONTESTED ASSIGNMENT REGISTER (the required deliverable)

Every place below is assigned to **different one of {Astoria, Ditmars–Steinway, Long Island City}**
by at least two sources. **Recorded, not resolved.**

| Place | Address | Source A says | Source B says |
|---|---|---|---|
| **Sohmer & Company Piano Factory Building** | 31-01 Vernon Blvd (a/k/a 11-02 to 11-16 31st Ave) | LPC LP-2172: "in the northern part of **Long Island City** near Astoria"; "in Long Island City" | LPC's own landmarks dataset: NTA **QN0102 Old Astoria-Hallets Point**, cd 401. And DCLA lists `Epic Theatre Center` at **31-01 Vernon Blvd, "Astoria"** |
| **Socrates Sculpture Park** | 32-01 Vernon Blvd, 11106 | Own website footer: "**Long Island City**, NY 11106"; DCLA `city: "Long Island City"`, `nta: QN0105` | NYC Parks history: named "as a tribute to the people of **Astoria**"; and "inaccessible to citizens of Astoria and Long Island City" |
| **The Noguchi Museum** | 9-01 33rd Road (own site) / 32-37 Vernon Blvd (DCLA), 11106 | Own site: "Located in **Long Island City**, Queens"; DCLA `city: "Long Island City"` | Sits in **Queens Community Board #1** (Astoria's board) per DCLA; LPC LP-2675 groups it with "the northernmost part of Long Island City" |
| **Greater Astoria Historical Society** | 32-63 48 Street, 11103 | DCLA `city: "**Long Island City**"` | Its own name is "Greater **Astoria** Historical Society"; its domain is `astorialic.org` — it refuses to choose |
| **Barkin, Levin & Company Office Pavilion** | 12-12 33rd Avenue | LPC LP-2675 LOCATION: "**Long Island City**"; "located in Long Island City, Queens" | Same report: "Today, the area north of the Queensboro Bridge is called **Astoria**"; LPC dataset NTA **QN0105**, cd 401 |
| **Bank of the Manhattan Company Building** | 29-27 Queens Plaza North | LPC LP-2570: "the **Dutch Kills** section of **Long Island City**"; the landmark's official name contains "Long Island City" | LPC dataset: **cd 401** (Astoria's CD), NTA QN0105 |
| **Benjamin T. Pike House / Steinway Mansion** | 18-33 41st Street, 11105 | LPC LP-0632 header: "18-33 41st Street, **Steinway**, Borough of Queens" | LPC dataset NTA **QN0101 "Astoria (North)-Ditmars-Steinway"**; PLUTO owner name is "STEINWAY MANSION 1 LLC"; commonly written as Astoria |
| **Abraham Lent House / Lent Homestead** | 78-03 19th Road | LPC LP-0135 header: "78-03 19th Road, **Steinway**, Queens" | LPC dataset NTA **QN0101 (Astoria (North)-Ditmars-Steinway)**. Also note: the address is far east and may belong to East Elmhurst / Astoria Heights entirely — a **fourth** candidate neighborhood |
| **Lawrence Family Graveyard** | SE corner 20th Road & 35th Street | LPC LP-0136 **header**: "**Steinway**, Borough of Queens" | LPC LP-0136 **body**, same document: "the last member of the Lawrence family to live **in Astoria**" |
| **Astoria Park Memorial** (in Astoria Park) | Astoria Park | Located in **Astoria** Park per NYC Parks | NYC Parks: dedicated "in tribute to the sons of **Long Island City** who died in World War I" |
| **Theatron, Inc.** | 32-15 38th Street, 11103 | DCLA `city: "**Long Island City**"` | DCLA `nta: "QN0104"` = **Astoria (East)**-Woodside (North); CB #1 |
| **Flux Factory** | 39-31 29th Street, 11101 | DCLA `city: "**LONG ISLAND CITY**"` | DCLA `community_board: "Queens Community Board #1"` (Astoria's board) |
| **CultureNOW, Inc.** | 37-24 24th Street, 11101 | DCLA `city: "**LONG ISLAND CITY**"` | DCLA CB **#1** |
| **Chinese Theatre Works** | 3718 Northern Blvd, 11101 | DCLA `city: "**Long Island City**"` | DCLA CB **#1** |
| **Ecuadorian American Cultural Center** | 36-32 34th St, 11106 | DCLA `city: "**Long Island City**"` | DCLA CB **#1**; zip 11106 is shared with Astoria-labeled entries |
| **Together in Dance** | 34-18 Northern Blvd, 11101 | DCLA `city: "**Long Island City**"` | DCLA CB #1, `nta: QN0161` (**Sunnyside Yards (North)** — a fifth label) |
| **Theater et al** | 38-33 24th Street, 11101 | DCLA `city: "**Long Island City**"` | DCLA CB #1, `nta: QN0105` |
| **Astoria Film Festival Inc** | 3355 14 St, 11106 | DCLA `city: "**Astoria**"` | DCLA `community_board: "Queens Community Board **#2**"` — i.e. LIC's board. **Conflict runs the other way.** |
| **Williamsburg Art Nexus** | 24-26 26th Street, 11102 | DCLA `city: "**Astoria**"` | DCLA `nta: "QN0101"` = Astoria (North)-**Ditmars-Steinway** |
| **Stage Aurora NY** | 24-54 29th Street, 11102 | DCLA `city: "**Astoria**"` | DCLA `nta: "QN0101"` (**Ditmars-Steinway**) |
| **Wreckio Ensemble Theatre** | 23-54 23rd Street, 11105 | DCLA `city: "**Astoria**"` | DCLA `nta: "QN0101"` (**Ditmars-Steinway**) |
| **Taverna Kyclades** | 36-01 Ditmars Blvd, 11105 | Own site: "Taverna Kyclades in **Astoria**" | Its own street is **Ditmars** Blvd; DCP puts 11105/Ditmars in QN0101 (**Ditmars-Steinway**) |
| **Agnanti** | 19-06 Ditmars Blvd, 11105 | DOHMH: zip 11105 only — **no neighborhood field at all** | DCP NTA for this area: QN0101 (**Astoria (North)-Ditmars-Steinway**) |
| **Hinomaru Ramen** | 33-18 Ditmars Blvd, 11105 | DOHMH: zip only | DCP: QN0101 (**Ditmars-Steinway**) |
| **Kabab Cafe / Mombar / Gyro Uno / Rizzo's** | 25-12, 25-22, 28-01, 30-13 Steinway Street, 11103 | DOHMH: zip only | On **Steinway** Street; DCP splits 11103 across QN0101 (Ditmars-Steinway), QN0103 (Astoria Central) and QN0104 (Astoria East) |
| **Astoria-Ditmars Blvd subway station** | BMT Astoria Line terminal | MTA `stop_name` hyphenates **both** names into one | — (the MTA declines to choose; recorded as evidence, not a conflict) |
| **"Long Island City" itself** | — | Task premise: LIC sits in Queens **CD 1** | DCP: `Long Island City-Hunters Point` (QN0201) is in **CD 2**; the CD-1 unit is `Queensbridge-Ravenswood-Dutch Kills` (QN0105) |

**Places whose assignment I found NO conflict for** (single consistent label across every source I
reached): Astoria Park (P1), Astoria Park Pool and Play Center (P2), Athens Square (P4), Hallets
Cove Playground (P5), Famous Players-Lasky Studio / Kaufman Astoria Studios (P9 — LPC header,
LPC dataset NTA QN0103, and the company's own site all say Astoria), Museum of the Moving Image
(P17 — DCLA says Astoria, CB #1, NTA-consistent), Bohemian Hall (P57), Bahari Estiatorio (P59),
Sweet Afton (P60), Greek Cultural Center (P23).

---

## 13. Internal discrepancies flagged for the verifier

1. **F1 vs F19** — William Hallet's wife: "Elizabeth Fones" vs "Elizabeth Feake"; settlement 1652 vs
   1659. (F29 gives 1652 for the land acquisition specifically, which may reconcile them.)
2. **F24 vs F28** — "Sunkisq" glossed as "woman chief" (NYC Parks) vs "place of the chief's wife"
   (LPC LP-2675).
3. **F20 vs F31** — Astor "never did" invest (NYC Parks) vs Astor "made a donation to build St. ___"
   (LPC LP-2675).
4. **F53** — Astoria Park acreage: 59.96 (Parks data panel) / "more than 56" + 4.5 + 5 (Parks
   narrative) / "sixty-six acre" (LPC).
5. **F65** — Astoria Pool size: "54,450 square feet" (LPC) vs "330 feet long" (Wikipedia lead).
6. **F95 / F85 / F103** — Kaufman/Paramount studio construction: "1920" (company) / "1920-1921"
   (LP-0977) / "1919-21" (LP-2172).
7. **F98** — Kaufman Astoria Studios' own address (34-12 36th Street) ≠ the landmark address
   (35-11 35th Avenue).
8. **F114** — Steinway Mansion build date: "about 1840" (LPC header) / "the 1850's" (LPC body) /
   `yearbuilt 1858` (PLUTO).
9. **F142 / F141 / F148** — Noguchi Museum address: 9-01 33rd Road (own footer) vs 32-37 Vernon
   Boulevard (DCLA and the museum's own 1980s archive caption).
10. **F22/F38 vs F40** — Hell Gate rock removal: "the 1850s and 1870s" vs "an 1876 effort by the
    Army Corps of Engineers."
11. **F224** — Bahari "formerly known as Stamatis" while a Stamatis is separately listed at another
    address.
12. **OCR warning** — LP-0632, LP-0135, LP-0136 and LP-0977 are scanned typescripts. Their quoted
    text above contains visible scanning corruption (`Ita ianate`, `18?0t s`, `2oth`, `Bui !ding`,
    `I !sting`). **Any of these quotes must be re-read from the PDF image before publication.**
13. **F42** — "northern park of Astoria Park" is near-certainly OCR for "northern part."
14. **F64** — the pool/race sentence lacks its surrounding paragraph in my extraction.

---

## 14. Domains that must NOT be cited (hijacked or dead)

- **`kaufmanartsdistrict.org`** — now serves an Indonesian online-gambling site ("Bakso108 Situs
  Game Online"). The Kaufman Arts District Foundation exists in DCLA data (F155); its website does
  not.
- **`agnantimeze.com`** — now serves an Indonesian online-gambling site ("SIP69"). Do not cite for
  the Agnanti restaurant.
- **`nyc-arts.org`** — states on its own page: "This website is no longer actively maintained. Some
  material and features may be unavailable." F135–F139 depend on it; downgrade accordingly.
- **`nycgovparks.org/parks/rainey-park/...`** and **`/parks/Q015/...`** — resolve to the wrong
  parks (Bronx / Forest Park). See §0.

---

## 15. Priority gaps for a second finder pass

1. **Museum of the Moving Image** — own site unreachable; currently resting on a defunct aggregator.
2. **St. Demetrios Cathedral** and Greek Orthodox institutional Astoria — zero sources obtained.
3. **Steinway & Sons factory itself** (as opposed to Steinway Street / Steinway Mansion) — the
   company's site 404'd on every path tried; **no address, no operating status, no LIC-vs-Astoria
   label obtained.** Note it is widely written as "Long Island City, NY 11105," which if true is
   another §12 entry.
4. **Astoria Generating Station / "Big Allis" / the waterfront power complex** — nothing obtained.
5. **Welling Court Mural Project** — nothing obtained.
6. **Population and demographics from a real source** — F6 is second-hand and boundary-dependent.
7. **Bus routes** — no MTA source fetched.
8. **The Arab/Egyptian Steinway Street corridor** — real but supported here only by two DOHMH
   cuisine tags.
9. **Queens' Rainey Park** — never successfully sourced.
10. **NYC Ferry Astoria landing's street location** — the route page does not give it.

---

## Tally

- **Candidate facts recorded: 247** (F1–F247).
- **Candidate places recorded: 79** (P1–P79).
- **Places with a contested neighborhood assignment: 27** (see §12 table).
- **Facts flagged as second-hand / summarizer-relayed: 10** (F1–F10).
- **Internal discrepancies flagged: 14** (§13).
