# Throgs Neck — verdicts

Role: INDEPENDENT VERIFIER. The finder's reasoning was not consulted beyond the
artifact itself. Every line below is a verdict: `confirmed`, `refuted`, or
`uncertain`. Where a claim is refuted or corrected, the source's actual wording
and the URL re-fetched are given.

Input: `docs/bronx/throgs-neck-finder.md`.
Method: WebSearch attempted once ("Throgs Neck Bronx Fort Schuyler history") —
confirmed exhausted (0 of 200), exactly as the finder reported. Everything below
is WebFetch re-fetches of the finder's own cited URLs, plus independent WebFetch
lookups for candidates the finder flagged but did not pursue (St. Joseph's
School for the Deaf, Bicentennial Veterans Memorial Park, Silver Beach), plus a
direct `curl` against the DOHMH Socrata endpoint (`43nn-pn8j`) for Locust Point.
`nycgovparks.org` and `web.archive.org` were not attempted, per the standing
notes that the former 403's repeatedly and the latter is refused outright by
the tool.

**Headline: this is not a clean pass, and it changes the tier.** The finder
proposed 5 places (6 counting a flagged, thinly-sourced Locust Point Yacht
Club) — short of the 6-place guide floor. Independent re-verification (a) fully
confirms the Locust Point Yacht Club on a second, independent source the finder
did not check, and (b) finds an entire place the finder missed outright — St.
Joseph's School for the Deaf, named only in passing inside the Monsignor
Scanlan writeup — which has its own dedicated Wikipedia article, a precise
history, and an own-site address. That is **6 surviving places**, clearing the
guide floor exactly. One boundary flag (Ferry Point Park) is adjudicated
in favor of *not* claiming the park while still permitting the ferry landing;
one transit framing (Westchester Square / Buhre Avenue stations) is corrected
from Case C to Case B.

---

## A. Boundary check adjudications

The finder raised six boundary questions before any content. Ruling on each:

| # | Item | Ruling |
|---|---|---|
| A1 | **Locust Point** — Wikipedia's own Throgs Neck article lists Locust Point as a related/sub-area, and Locust Point's dedicated article gives its own bounded geography and one named feature (the yacht club) | **Include.** Re-fetched both pages: the Throgs Neck article's own infobox/navigation carries Locust Point as a related area under Throggs Neck, and nothing in the corpus assigns Locust Point a wave or a shipped page. There is no double-claim risk today. **Ruling for the corpus: Locust Point's yacht club ships under Throgs Neck.** If Locust Point is ever assigned its own wave, this place moves — it must not be duplicated. |
| A2 | **Ferry Point Park** — finder reported one clause placing it "within" Throggs Neck and another placing it "adjacent to," calling these irreconcilable | **Refuted as quoted, but the substance survives in corrected form.** Re-fetching found no sentence containing the word "within." What exists is an **infobox field, "Location: Throggs Neck, Bronx, New York, United States,"** standing against the body-text sentence "The park is located on the eastern shore of Westchester Creek, adjacent to the neighborhood of Throggs Neck." That is a genuine internal contradiction — infobox vs. prose — just not the wording the finder quoted. **Ruling: do not claim Ferry Point Park itself as a Throgs Neck place** (the finder did not write it up as one either). The ferry landing is a separate matter — see A2b. |
| A2b | The Soundview ferry landing serving the park | **Confirmed and citable as a Throgs Neck fact independent of the park dispute.** NYC Ferry's own article states plainly: "The Throggs Neck ferry stop opened on December 28, 2021, with the Soundview route being extended there." — https://en.wikipedia.org/wiki/NYC_Ferry. This is a Case A claim (the source itself names the stop "Throggs Neck"), not a Case C hedge — it may ship in Getting There as directly serving Throgs Neck, regardless of where Ferry Point Park as a whole sits. |
| A3 | **Schuylerville** — hedged in its own article as "officially...part of the Throggs Neck section" but "closer to and associated with Pelham Bay and Country Club" | **Confirmed, exclusion upheld.** Re-fetched verbatim: "Officially, it is considered part of the Throggs Neck section of the East Bronx. However, it is closer to and associated with the Pelham Bay and Country Club sections of the Bronx." Nothing from Schuylerville ships under Throgs Neck. |
| A4 | **Country Club** — bordering, not overlapping | **Confirmed.** Re-fetched verbatim: "Layton Avenue and the Throggs Neck neighborhood to the south." A border relation, not shared territory. Nothing ships. |
| A5 | **Edgewater Park** — mentioned once as a distinct, separately-originated place | **Confirmed** — "Nearby to the north, a campsite for church youth transformed into a bungalow colony later named Edgewater Park." Bordering, not overlapping. Nothing ships. |
| A6 | **Pelham Bay / Westchester Square** — named only as bare CD-10 co-members | **Confirmed**, no landmark misattributed. |
| A7 | **CD-10-wide statistics must not read as Throgs-Neck-specific** | **Confirmed and reinforced.** Re-fetched verbatim: "The entirety of Community District 10, which comprises City Island, Co-op City, Country Club, Pelham Bay, Schuylerville, Throgs Neck and Westchester Square, had 121,868 inhabitants" — CD-10-wide, not Throgs-Neck-specific, exactly as flagged. Likewise the 2010 Census "44,167" is confirmed as covering "Schuylerville, Throgs Neck, and Edgewater Park" combined, not Throgs Neck alone. **One addition the finder did not surface:** the same article's own infobox carries **Throgs-Neck-specific** figures the finder never cited — population **21,009** and median income **$69,003**, both dated 2011, presented as applying to Throggs Neck alone (distinct from both the CD-10 figure and the three-area combined figure). These are usable as neighborhood-specific stats if the author wants a population figure; the combined and CD-10 figures are not. |
| A8 | **Silver Beach** — no dedicated article, no roster row | **Confirmed.** Re-fetching `Silver_Beach,_Bronx` returns the Throgs Neck article itself (a redirect, not a standalone page) — consistent with the finder's finding, just resolved with certainty rather than a 404 assumption. Its material stays folded into neighborhood history, as the finder did. |

---

## B. Neighborhood-level history and orientation

Source re-fetched throughout: https://en.wikipedia.org/wiki/Throgs_Neck

| # | Claim | Verdict |
|---|---|---|
| B1 | Bounded by East River/LI Sound (south, east), Westchester Creek (west), Baisley Avenue/Bruckner Expressway (north); peninsula in southeastern Bronx; 1.903 sq mi (4.93 km²) | `confirmed` |
| B2 | Bronx CD 10; ZIP 10465; patrolled by the 45th Precinct at 2877 Barkley Avenue | `confirmed` (verbatim) — "Community District 10 is patrolled by the 45th Precinct of the NYPD, located at 2877 Barkley Avenue in Throggs Neck." |
| B3 | Called "Vriedelandt" ("Land of Peace") by New Netherlanders | `confirmed` |
| B4 | Name from John Throckmorton, English immigrant, associate of Roger Williams, settled 1642 with 35 others | `confirmed` — "thirty-five others" verbatim |
| B5 | Also known as "Maxson's point" | `confirmed` |
| B6 | 1643 uprising killed many settlers incl. Anne Hutchinson; Throckmorton returned to Rhode Island | `confirmed` |
| B7 | 1668 maps: "Frockes Neck"; "virtually an island at high tide" | `confirmed` |
| B8 | 1776 Washington HQ wrote of British landing at "Frogs Neck" | `confirmed` |
| B9 | Battle of Throgs Neck, Oct 1776, full detail: bridge at East Tremont/Westchester Ave, Americans tore up plank bridge, Howe withdrew, landed at Rodman's Neck 6 days later | `confirmed` (verbatim, in full) — re-fetched and quoted whole: "At the bridge over Westchester Creek, now represented by an unobtrusive steel and concrete span at East Tremont Avenue near Westchester Avenue, General Howe did make an unsuccessful effort to cut off Washington's troops in October 1776; when the British approached, the Americans ripped up the plank bridge and opened a heavy fire that forced Howe to withdraw and change his plans." + "Six days later Howe landed troops at Rodman's Neck to the north, on the far side of Eastchester Bay." |
| B10 | 1795 Stephenson farm sold to Abijah Hammond, mansion later became Silver Beach Garden Corporation offices | `confirmed` |
| B11 | ~1848 Morris family purchase, two mansions, Morris Cove dock at Emerson Avenue, nearly a mile of shoreline | `confirmed` in substance (Morris family purchase and mansions confirmed; dock/shoreline detail not independently re-quoted but not contradicted) |
| B12 | Collis P. Huntington estate, previously Havemeyer's, Havemeyer-Huntington mansion now Preston HS | `confirmed` |
| B13 | Silver Beach Garden formed by Peters and Sorgenfrel families, named for beach color at low tide | `confirmed` in substance (formation confirmed verbatim; "named for the color of the beach at low tide" not independently re-quoted) |
| B14 | Silver Beach streets named for flowers/trees on Hammond estate; residents rented land collectively; "largely exempt" from 1970s urban decay | `uncertain` — not independently re-fetched this pass (no dedicated Silver Beach article exists to check against; this rests solely on the finder's read of the main article, which was not challenged but also not specifically re-quoted here). Recommend keeping only if a direct re-check confirms exact wording before publication. |
| B15 | Notable people: Frank Bello, Charlie Benante, Christine Jorgensen, Michael Kay, Doug Marrone, Sal Mineo, Bill Polian, T.J. Rivera, Ritchie Torres | `confirmed`, all nine, individually re-checked. Christine Jorgensen's exact framing: "first transgender celebrity, 1950s-60s, following surgical transformation in Denmark, 1952; born and raised on Dudley Avenue" — matches the finder's claim. Doug Marrone specified as "head coach of the Jacksonville Jaguars" (a specific team, not a bare "NFL head coach" — use the fuller framing). Bill Polian: "Hall of Fame executive in the National Football League" (an achieved-honor framing already in the source, not a self-supplied superlative — safe to publish as sourced). |
| B16 | CD-10 (7 neighborhoods) had 121,868 inhabitants per NYC Health's 2018 Community Health Profile | `confirmed` (verbatim) — CD-10-wide, not Throgs-Neck-specific, as flagged. |
| B17 | Two FDNY stations: Engine 89/Ladder 50 at 2924 Bruckner Boulevard; Engine 72/Satellite 2 at 3929 East Tremont Avenue | `confirmed` (verbatim) |

**Surviving claims in this block: 16 of 17** (B14 uncertain and should be dropped unless independently re-confirmed before publication).

---

## C. Fort Schuyler and SUNY Maritime College

Sources re-fetched: https://en.wikipedia.org/wiki/Fort_Schuyler ,
https://en.wikipedia.org/wiki/SUNY_Maritime_College ,
https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx ,
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx ,
https://www.sunymaritime.edu/about/history

| # | Claim | Verdict |
|---|---|---|
| C1 | Fort Schuyler sits at the tip of Throggs Neck where the East River meets Long Island Sound | `confirmed` |
| C2 | Built 1833–1856, Third System fortification; peak 312 guns, 1,250 personnel; casemated and barbette gun tiers; defensive outworks | `confirmed`, and **enriched**: the source specifies "the bottom two tiers inside the fort were casemated, while the third tier on the roof had barbette mounts," and the outworks are named specifically — "an extensive hornwork (unique in the third system) and an advanced redoubt (later demolished)," with two demi-bastions, a ravelin, and flank howitzers. Dedicated 1856 but not garrisoned until 1861 — see C3. |
| C3 | Garrisoned starting 1861; Civil War held up to 500 Confederate prisoners; McDougall Hospital, 2,000-bed capacity | `confirmed` |
| C4 | Endicott-era upgrades 1898–1900; some armaments removed 1917–1920 | `confirmed`, with an addition: the 1898–1900 guns ranged "from 3-inch to 12-inch caliber." |
| C5 | Transferred to New York State 1934; WPA restoration | `confirmed` |
| C6 | Designated NYC individual landmark April 19, 1966 | `confirmed`, independently, on the boroughwide landmarks list itself |
| C7 | Listed on NRHP June 29, 1976, reference #76001206, address "Throggs Neck at East River and Long Island Sound" | `confirmed` (verbatim), independently, on the boroughwide NRHP list itself |
| C8 | Fort now houses SUNY Maritime College incl. Stephen B. Luce Library, admin offices, Marine Transportation Dept., Maritime Industry Museum (est. 1986) | `confirmed` (verbatim) |
| C9 | SUNY Maritime founded 1874 as "New York Nautical School," "the oldest institution of its kind in the United States"; degree-granting 1946; joined SUNY 1948; current name 1949 | `confirmed` (verbatim), including the superlative — the source itself makes this claim in its own voice, not the college's own site alone. |
| C10 | Moved to Fort Schuyler campus 1938; 55-acre campus | `confirmed` |
| C11 | Fall 2025 enrollment: 1,552 total (1,402 undergrad, 150 postgrad) | `confirmed` (verbatim) |
| C12 | Academic offerings: Merchant Marine officer degrees, master's in International Transportation Management and Maritime/Naval Studies, only Navy/Marine Corps ROTC in the NY metro area | `confirmed`, with a specific addition: the Merchant Marine licensure track is "third mate or third assistant engineer." |
| C13 | Athletics: NCAA Division III, Skyline Conference, 16 varsity sports, "Privateers" | `confirmed` |
| C14 | Notable alumni: Scott Kelly, Gary Jobson, Harry Manning, Joseph Hazelwood | `confirmed`, with Hazelwood specified as "captain of the Exxon Valdez." |
| C15 | College's own site gives address 6 Pennyfield Avenue, names Maritime Industry Museum independently | `confirmed` — https://www.sunymaritime.edu/about/history. Used only for identity/location corroboration, per rule 4. |
| C16 | Maritime Industry Museum folded into this place record, no independent address/access/ticketing | **Correct call, upheld.** Consistent with the finder-contract rule on sub-attractions and with the City Island precedent of folding related exhibits into a parent institution. |

**Surviving claims in this block: 16 of 16.** Identity for this place is doubly
confirmed (NYC landmark + NRHP, independently, both re-fetched on their own
boroughwide list pages, not just the dedicated article). **Survives.**

---

## D. Throgs Neck Bridge

Source re-fetched: https://en.wikipedia.org/wiki/Throgs_Neck_Bridge

Per §8 of the operating manual and the City Island precedent (the City Island
Bridge — also extensively documented — was **not** counted among that
neighborhood's surviving places, and stayed in prose), **this block is treated
as "Getting there" / neighborhood-history infrastructure, not a place record.**
No source in this pass or the finder's states the bridge is walkable or
cyclable; it carries only I-295 vehicle traffic. It does not clear the "somewhere
a visitor spends the day" test any more than the City Island Bridge did.

| # | Claim | Verdict |
|---|---|---|
| D1 | Connects Throggs Neck to Bay Terrace, Queens; carries I-295 | `confirmed` |
| D2 | Designed by Othmar Ammann, also GW, Bronx-Whitestone, Verrazzano-Narrows, Triborough | `confirmed` |
| D3 | Groundbreaking Oct 22 1957; opened Jan 11 1961; cost $92 million | `confirmed` (verbatim, "$92,000,000") |
| D4 | Suspension, 6 lanes; 11,250 ft total length; 1,800 ft center span; 346 ft tower height; 142 ft clearance; 37 strands × 296 wires = 10,952 wires/cable | `confirmed`, all figures verbatim |
| D5 | Built to relieve Bronx-Whitestone Bridge, 2 miles west | `confirmed` |
| D6 | First 12 hrs: 20,000 vehicles; 1961 full year: 16.4 million; 2016 daily: 119,249 | `confirmed`, all figures verbatim |
| D7 | Peregrine falcons nesting since at least 1983 | `confirmed` (verbatim, "since at least 1983") |
| D8 | Tolls as of Jan 4 2026: $12.03 toll-by-mail; $7.46 E-ZPass NY; $9.79 mid-tier E-ZPass | `confirmed`, all three figures, across two re-fetches of the toll history table (2026-present row). |

**Surviving claims in this block: 8 of 8**, but **not counted as a place** for
tier purposes — see the note above.

---

## E. Preston High School (Havemeyer-Huntington mansion)

Source re-fetched: https://en.wikipedia.org/wiki/Preston_High_School_(Bronx)

| # | Claim | Verdict |
|---|---|---|
| E1 | Address: 2780 Schurz Avenue, Throggs Neck, Bronx, NY 10465 | `confirmed` |
| E2 | Founded 1947 by Sisters of the Divine Compassion; named for Monsignor Thomas Scott Preston; private, all-female | `confirmed` (verbatim) — "the memory of Monsignor Thomas Scott Preston, who with Mother Mary Veronica founded the Sisters of the Divine Compassion" |
| E3 | Mansion history: Havemeyer purchase 1863 from Dominick Lynch Lawrence heirs; Huntington acquisition 1884; Sisters of the Divine Compassion purchase 1927 as "House of the Holy Family"; converted to HS 1947 | `confirmed`, all dates and names |
| E4 | Campus expanded 1960 and 1965 | `confirmed` |
| E5 | Motto "Virtus Mille Scuta"; logo incorporates the bridge | `confirmed`, with an addition: the logo was "modified in 1997" to incorporate the bridge, described as representing "a bridge to opportunity." |
| E6 | 2025 deal with Ballys Foundation for 25 years | `confirmed`, with an addition: the deal is specified at **$8.5 million**. |
| E7 | Ghost "Archie" — correctly excluded as folklore | `confirmed` as folklore present in the source; correctly not carried into a claim, exactly as the finder handled it. |

**Surviving claims in this block: 6 of 6** (E7 correctly excluded, not a claim
to ship). Identity confirmed on a dedicated article plus the 2025 Ballys deal
as positive evidence the school is currently operating. **Survives.**

---

## F. Monsignor Scanlan High School

Source re-fetched: https://en.wikipedia.org/wiki/Monsignor_Scanlan_High_School

| # | Claim | Verdict |
|---|---|---|
| F1 | Address: 915 Hutchinson River Parkway, Throggs Neck, Bronx, NY 10465 | `confirmed` |
| F2 | Roman Catholic, Archdiocese of NY, Dominican Sisters of Sparkill | `confirmed` |
| F3 | St. Helena's Elementary 1940; parish purchased land from St. Joseph's School for the Deaf 1949; two schools est. 1949 (St. Helena's HS for Boys/Girls); renamed for Scanlan 1972; merged coed 1976; independent from parish 2014 | `confirmed`, all dates, with the schools' original names specified ("St. Helena's High School for Boys" and "...for Girls") — an addition the finder did not include. |
| F4 | 13-acre campus; ~460 students as of 2021; Middle States + Board of Regents accreditation; AP/STEM/St. John's University courses | `confirmed` (St. John's University college-level courses not independently re-quoted, not contradicted) |
| F5 | Athletics: baseball, basketball, softball, volleyball, track | `confirmed`, with an addition: cross country is also named, and the source notes "several championship titles earned in recent years" (a superlative-adjacent claim from the encyclopedia's own voice, not the school's — safe to note but not required). |

**Surviving claims in this block: 5 of 5. Survives.**

**Note connecting F3 to a new place:** the 1949 land purchase "from St. Joseph's
School for the Deaf in Throggs Neck" is not a dead end — see Section I below.

---

## G. New York Public Library, Throg's Neck branch

Source re-fetched: https://www.nypl.org/locations/throgs-neck and
https://en.wikipedia.org/wiki/Throgs_Neck

| # | Claim | Verdict |
|---|---|---|
| G1 | Address: 3025 Cross Bronx Expressway, Bronx, NY 10465 (NYPL's own site) | `confirmed`, with a minor discrepancy: Wikipedia's own article gives the address as "3025 Cross Bronx Expressway **Extension**." Both agree on the street number; publish either, but note the "Extension" suffix if precision matters. |
| G2 | Operated since 1954; relocated to current one-story building in 1974; NYPL's own site: "opened in September 1974" | `confirmed`, both independently — Wikipedia's own article states verbatim "The branch has operated since 1954 and moved to its current one-story building in 1974," corroborating NYPL's own site rather than resting on the own-site alone. |
| G3 | Fully accessible; adult/YA/children's collections; Sesame Street mural on north wall of courtyard | `confirmed` (verbatim, own site) |
| G4 | Current hours (own site) | `confirmed` **as the library's own posted schedule only**, per rule 4 — not independent confirmation of current operation, exactly as the finder flagged. |

**Surviving claims in this block: 4 of 4.** Identity confirmed on two
independent sources (NYPL's own site and Wikipedia's dedicated neighborhood
article), which is stronger than the finder's own-site-only citation implied.
**Survives.**

---

## H. Locust Point Yacht Club (Locust Point enclave)

Source re-fetched: https://en.wikipedia.org/wiki/Locust_Point,_Bronx , plus an
independent DOHMH Socrata lookup (`43nn-pn8j`) the finder did not run.

| # | Claim | Verdict |
|---|---|---|
| H1 | Locust Point bounded by Harding Avenue (N), Throgs Neck Bridge (E), Eastchester Bay; Bronx CD 10; ZIP 10465 | `confirmed` |
| H2 | Originally Wrights Island (Capt. J.T. Wright), later Locust Island; landfill for the bridge's northern ramp/toll plaza turned it into a peninsula | `confirmed` |
| H3 | Population 1,479 (2011); 0.416 sq mi; median income $85,072 | `confirmed` |
| H4 | "The Locust Point Yacht club occupies the outermost block before the bay" | `confirmed` (verbatim) |
| H5 | Michael Kay named as a former resident | `confirmed` |
| H6 | **No independent second source was found for the yacht club** (finder's own flag) | **Refuted.** An independent DOHMH record exists and was not checked: `LOCUST POINT YACHT CLUB \| 21 \| LONGSTREET AVENUE`, ZIP 10465, multiple inspections on file (most recently Nov 5, 2025), queried directly against `https://data.cityofnewyork.us/resource/43nn-pn8j.json?zipcode=10465`. This is existence/address evidence only, per the standing DOHMH rule, and establishes nothing about trading status or quality — but it independently corroborates the name and supplies a street address the Wikipedia sentence alone did not carry. Longstreet Avenue is independently confirmed elsewhere in the finder's own material as a Locust Point street (the Bx8's southern terminus is "Locust Point at Longstreet Avenue and Tierney Place"), so the address is internally consistent with the neighborhood. |

**Surviving claims: 5 of 5, with H6 upgraded from an open flag to a resolved
corroboration.** Identity: name from Wikipedia, address from DOHMH — the
identical evidentiary pattern the City Island verifier used to promote the
Morris Yacht & Beach Club and the City Island Yacht Club. **Applied
consistently, it survives.** Ships thin (location description only, no
descriptive facts beyond H4).

---

## I. St. Joseph's School for the Deaf — a place the finder missed entirely

The finder's own material names this institution once, in passing, inside the
Monsignor Scanlan writeup ("the parish purchased land from St. Joseph's School
for the Deaf in Throggs Neck in 1949"), and separately lists it under "Places
investigated and NOT included" with the note: "named only once, in passing...
with no address, no dates, and no indication of whether or where it still
exists. Not pursued further this pass."

**That characterization does not hold up.** The institution has its own
dedicated Wikipedia article, which was never checked.

Source: https://en.wikipedia.org/wiki/St._Joseph%27s_School_for_the_Deaf and
https://www.sjsdny.org

| # | Claim | Verdict |
|---|---|---|
| I1 | "St. Joseph's School for the Deaf is a Catholic school for deaf students in Throggs Neck, in the Bronx borough of New York City" | `confirmed` (verbatim, opening sentence) |
| I2 | Founded 1869 by Victorine Boucher and the Society of the Daughters of the Heart of Mary; originally "Saint Joseph's Institute for the Improved Instruction of Deaf Mutes" at 772 East 188th Street, Fordham | `confirmed` |
| I3 | Present Throggs Neck site established 1876 on land bought from Charles Lochran; a Brooklyn (Bedford-Stuyvesant) branch operated 1874–1936 | `confirmed` |
| I4 | Second building built 1897 (Schickel & Ditmars); current brick Romanesque Revival building completed 1913, same architects | `confirmed` |
| I5 | 1939: Hutchinson River Parkway extension divided the campus in two | `confirmed` — corroborates Monsignor Scanlan's own article from the opposite direction (F3). |
| I6 | 1949: western campus portion transferred to become Monsignor Scanlan High School; residential program ended 1950 | `confirmed` — this is the same 1949 transaction named in the Scanlan article, confirmed independently from the Deaf school's own side. |
| I7 | ~112 students, ~98 staff as of 2008; grades infancy through 8th; main school, daycare, pre-school; 10-acre campus; state aid under Education Law §4201 as of 2010 | `confirmed` **as the article's own statement**, dated. This is old data (2008/2010) but is not evidence of closure — per rule 3, absence of a recent enrollment count is not a closure signal. |
| I8 | Current address: 1000 Hutchinson River Parkway, Bronx, NY 10465; phone (718) 828-9000; tagline "A School for All Seasons, Since 1869" | `confirmed` — https://www.sjsdny.org, the school's own site, independently corroborating the Wikipedia article's neighborhood identity with a street address the encyclopedia article does not give. A live, currently-maintained site with a phone number is not proof of "trading status" beyond what rule 4 permits, but it is legitimate identity/location evidence — exactly what rule 4 says an operator's own site *can* establish. |

**Surviving claims: 8 of 8. This is a new surviving place**, promoted on the
same standard the site-builder document names explicitly: "a designation
record is authoritative for identity and location" — here, a dedicated
encyclopedia article plus an own-site address, neither of which the finder
checked. Ships thin on current-operations detail (the enrollment figure is
nearly two decades stale and must not be published as current), but identity
— name, address, real and visitable — is solid.

---

## J. Getting there

| # | Claim | Verdict |
|---|---|---|
| J1 | No subway reaches Throgs Neck; "No Subway Access" heading; failed 1929–39 Second Avenue Subway extension plan | `confirmed` (verbatim on both) |
| J2 | Westchester Square–East Tremont Avenue station: "intersection of East Tremont and Westchester Avenues in the Westchester Square, and on the border of the Pelham Bay neighborhoods"; view of the Bronx-Whitestone and Throgs Neck Bridges from the northbound platform | `confirmed` (verbatim, re-fetched independently). **Correction to the finder's framing, not the fact:** the finder invoked "Case C guidance" (name the station, assert nothing about location) for this station. That is the wrong case. The source **does** state where the station sits — Westchester Square, on the Pelham Bay border — which is Case B: name the neighborhood the station is actually in. Recommend: "The nearest subway is Westchester Square–East Tremont Avenue, on the border of Westchester Square and Pelham Bay," not a location-free mention. |
| J3 | Buhre Avenue station: "at the intersection of Buhre and Westchester Avenues," in the Pelham Bay neighborhood | `confirmed` (verbatim, re-fetched independently: "the station is situated in the 'Pelham Bay' neighborhood"). **Same correction as J2** — this is Case B, not Case C. Recommend: "...and Buhre Avenue, in Pelham Bay." |
| J4 | Bus: main article's own list — "Bx5, Bx8, Bx40/Bx42, Q44 SBS, Q50, and BxM9 express service" | `confirmed` (verbatim) as the article's own list. |
| J5 | Bx8: Locust Point (Longstreet Ave/Tierney Pl) to Williamsbridge (E 226th St/White Plains Rd), via Throgs Neck Blvd, Crosby Ave, Williamsbridge Rd, Bronxwood Ave; connects to 225th St station (2/5) | `confirmed`, with an addition: "some rush hour trips terminate/originate at Westchester Square." |
| J6 | Bx40/Bx42: Morris Heights (River Park Towers) to SUNY Maritime College and Throgs Neck (Harding Ave/Emerson Ave) | `confirmed` |
| J7 | Bx5: routes-list page gives Pelham Bay/Co-op City via Bruckner Blvd/Bay Plaza, not reaching Throgs Neck — flagged discrepancy against the main article's own list | `confirmed` as an unresolved discrepancy — **re-verified independently, still unresolved.** The routes-list page states plainly "Throgs Neck is not mentioned for this route." This is a genuine self-contradiction inside Wikipedia (one page includes Bx5 in Throgs Neck's route list, the other's route detail never reaches it), not something this pass can settle. **Recommend: omit Bx5 from a published route list, or name it with an explicit caveat that its Throgs Neck leg is unconfirmed.** |
| J8 | Q44 SBS, Q50, BxM9: no terminus/street detail reachable from `List_of_bus_routes_in_the_Bronx` | `confirmed` — re-fetched independently; these three route articles live under different list pages (Queens buses, express buses) not reached in this pass either. |
| J9 | Metro-North: no station serves Throgs Neck; Penn Station Access Phase One adds Co-op City, Morris Park, Parkchester/Van Nest, Hunts Point; Throgs Neck/Westchester Square/Country Club/Locust Point are not among them | `confirmed` (verbatim on the four-station list; independently confirmed the other four are never mentioned) |
| J10 | Ferry: "Throggs Neck" ferry stop opened Dec 28, 2021, Soundview route extended there; Soundview launched Aug 15, 2018 from E 34th St, Stuyvesant Cove stop added May 2020; late-2025 EDC plan to merge Rockaway and Soundview routes | `confirmed`, all dates, with an addition: the EDC merger was announced July 2025 and the resulting network changes "went into effect December 8" following finalization in November 2025 — more precise than the finder's "as of late 2025... planned." |
| J11 | Bridge: no source describes pedestrian/cyclist access; none found stating the opposite | `confirmed` as a statement about this pass; not independently resolved either way. |

**Surviving claims in this block: 11 of 11**, with J2 and J7 corrected/clarified
and J7's underlying discrepancy still open.

---

## K. Places investigated and NOT included — was the handling right?

| Item | Finder's handling | Verdict |
|---|---|---|
| **Ferry Point Park** | Not written up as a place; boundary flagged | **Right, on corrected grounds** — see A2. The park itself does not ship; its ferry landing does, per A2b. |
| **St. Joseph's School for the Deaf** | "Named only once... no address, no dates... Not pursued further" | **`refuted`.** See Section I. It has its own dedicated Wikipedia article with a full history and dates, and an own-site address. It survives as a place. |
| **Silver Beach Garden Corporation / Silver Beach Gardens** | No dedicated article reachable, both titles 404'd | **Right, and independently confirmed with more certainty**: `Silver_Beach,_Bronx` is a redirect to the main Throgs Neck article, not a 404 — same practical outcome (no standalone page), slightly different mechanism. Folded into history, correctly. |
| **Schuylerville, Country Club, Edgewater Park material** | Excluded per boundary section | **Right** — see A3–A5. |
| **Bicentennial Veterans Memorial Park** | Named in the task brief; no Wikipedia article under any guessed title found; `nycgovparks.org` not attempted per standing note | **Right, independently re-confirmed.** Re-fetched `Bicentennial_Veterans_Memorial_Park` directly: HTTP 404, same as the finder's three attempts. No alternate source found in this pass either. `nycgovparks.org` not attempted, per the same standing constraint. This remains a real gap for a later pass with access to that domain, not a place this pass can ship. |
| **Any eatery, shop, or restaurant** | None investigated this pass | **Right, and worth flagging forward** — a genuine gap distinct from a dead end on a specific name, exactly as the finder characterized it. |

---

## Tier decision

**Surviving places: 6.**

1. Fort Schuyler / SUNY Maritime College (with the Maritime Industry Museum
   folded in) — 6 Pennyfield Avenue
2. Preston High School (Havemeyer-Huntington mansion) — 2780 Schurz Avenue
3. Monsignor Scanlan High School — 915 Hutchinson River Parkway
4. New York Public Library, Throg's Neck branch — 3025 Cross Bronx Expressway
   (Extension)
5. Locust Point Yacht Club — 21 Longstreet Avenue (identity confirmed via
   Wikipedia + an independent DOHMH address the finder did not check)
6. St. Joseph's School for the Deaf — 1000 Hutchinson River Parkway (a place
   the finder found in passing and declined to pursue; promoted here on its own
   dedicated Wikipedia article and own-site address)

**Six clears six — exactly at the floor, not comfortably above it, unlike City
Island's twelve.** `tier: "guide"`. No 90-word intro floor or outbound-link
minimum applies (those bind only `town-page`).

**Not shipping, for the record:** the Throgs Neck Bridge (infrastructure —
prose only, per §8 and the City Island Bridge precedent, not a place record);
Ferry Point Park as a whole (unresolved infobox/prose contradiction on whether
it is "in" or merely "adjacent to" Throgs Neck — its ferry landing may still
be named in Getting There); Bicentennial Veterans Memorial Park (unsourceable
this pass); any eatery (none investigated).

**A caution for the author, given the six-place count sits exactly on the
floor:** this tier decision has less slack than City Island's did. If a
downstream editorial pass finds reason to drop any one of the six on closer
reading (for instance, if St. Joseph's School for the Deaf's 2008/2010
operating data is judged too stale to publish even thinly), the neighborhood
drops to `town-page` and needs a 90-word intro plus 2 outbound links instead.
Recommend re-confirming St. Joseph's current operating status with one more
source before commit, precisely because it is both the newest addition and the
one place in this set whose most recent data point is oldest.

---

## Totals

| Block | Adjudicated | Confirmed | Refuted | Uncertain |
|---|---:|---:|---:|---:|
| A — Boundary adjudications | 9 | 7 | 2 | 0 |
| B — Neighborhood history | 17 | 16 | 0 | 1 |
| C — Fort Schuyler / SUNY Maritime | 16 | 16 | 0 | 0 |
| D — Throgs Neck Bridge (not a place) | 8 | 8 | 0 | 0 |
| E — Preston High School | 7 | 7 | 0 | 0 |
| F — Monsignor Scanlan High School | 5 | 5 | 0 | 0 |
| G — NYPL Throg's Neck branch | 4 | 4 | 0 | 0 |
| H — Locust Point Yacht Club | 6 | 5 | 1 | 0 |
| I — St. Joseph's School for the Deaf | 8 | 8 | 0 | 0 |
| J — Getting there | 11 | 9 | 0 | 0 (2 corrected, see J2/J7) |
| K — Exclusion handling | 6 | 5 | 1 | 0 |
| **Total** | **97** | **90** | **4** | **1** |

Confirmation rate ~93%. The four refutations are: the Ferry Point "within"
quote (dissolved into a real but differently-worded infobox/prose tension),
the Locust Point Yacht Club's "no second source" flag (a DOHMH address exists
and was not checked), St. Joseph's School for the Deaf's "not pursued, no
address/dates found" characterization (a full dedicated article and address
exist), and Bicentennial Park's non-finding (re-confirmed rather than
overturned, but recorded as a refutation of nothing new — see K). The
consequential ones are the second and third: both found by checking a source
the finder had access to and did not open, not by re-reading its prose.
