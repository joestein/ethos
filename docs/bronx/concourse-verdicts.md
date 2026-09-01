# Concourse — verdicts

Role: INDEPENDENT VERIFIER. The finder's reasoning was not consulted beyond the
artifact itself. Every line below is a verdict: `confirmed`, `refuted`, or
`uncertain`. Where a claim is refuted or corrected, the source's actual
wording and the re-fetched URL are given.

Input: `docs/bronx/concourse-finder.md`.
Method: WebSearch attempted once, confirmed exhausted (0 of 200) — no results
returned. Everything below is a direct WebFetch re-fetch of the finder's own
cited URLs, plus a direct grep of the code corpus (`yankee_stadium_places.ex`)
and the full `priv/seed_data/` tree to check dedup claims. `nycgovparks.org`
and `web.archive.org` not attempted.

**Headline: this is a clean but very thin pass.** Of ~67 adjudicated claims,
one is refuted outright (a false "discrepancy" the finder raised turns out to
be a real, sourced sentence, not a fetch artifact — worse than the finder
thought, not better), and it forces a fact out of the corpus rather than
resolving in the finder's favor. Two candidates get corrections that change
their disposition without promoting them. Two places survive; that is not a
guide.

---

## A. Neighborhood-level history and orientation

Source re-fetched: https://en.wikipedia.org/wiki/Concourse,_Bronx

| # | Claim | Verdict |
|---|---|---|
| A1 | Boundaries: E169th St (north), Webster Ave (east), E149th St (south), Jerome Ave/Harlem River (west) | `confirmed` |
| A2 | Bordered by Highbridge/Harlem River (west), Mount Eden (north), Claremont Village/Melrose/Morrisania (east), Mott Haven (south) | `confirmed` (verbatim: "bordered to the west by Highbridge and the Harlem River; to the north by Mount Eden; to the east by Claremont Village, Melrose, and Morrisania; and to the south by Mott Haven") |
| A3 | Bronx Community Board 4; ZIP 10451, 10452 | `confirmed` |
| A4 | Policed by the 44th Precinct, 2 East 169th Street | `confirmed` (verbatim) |
| A5 | Centered on Grand Concourse and E161st Street | `confirmed` — verbatim: "centered on the intersection of Grand Concourse and 161st Street" |
| A6 | Three subsections: West Concourse, East Concourse, Concourse Village, with Grand Concourse as main thoroughfare | `confirmed` (verbatim) |
| A7 | 2010 Census combined population 101,566 over 855.37 acres; 62.2% Hispanic/Latino, 32.7% African American, 1.6% White, 1.8% Asian | `confirmed` — population and acreage verbatim; racial breakdown matches the finder's figures |
| A8 | IRT Jerome Avenue Line "opened a decade later in 1917 and spurred enormous development" | `confirmed` (verbatim) |
| A9 | Decline after 1960, rebound starting 1990s | `confirmed`, and the source names causes the finder did not carry: "white flight, incentives to move to the suburbs, redlining, the development of Co-Op City, disinvestment by New York City, and arson." None of these additional causes were claimed by the finder, so nothing to correct — flagged as available additional sourced material if an author wants it. |
| A10 | Yankee Stadium replacement opened 2009; former stadium demolished; Heritage Field now occupies the site | `confirmed` |
| A11 | Bronx Hall of Justice opened 2007 | `confirmed` |
| A12 | Bronx Terminal Market reopened 2009 | `confirmed`, with an addition: the source pairs it with "the adjacent Mill Pond Park," also opened 2009. Not claimed by the finder; not adjudicated further since Bronx Terminal Market is code-owned and out of scope for new prose. |

**Surviving claims in this block: 12 of 12.**

---

## B. The Grand Concourse

Source re-fetched: https://en.wikipedia.org/wiki/Grand_Concourse_(Bronx)

| # | Claim | Verdict |
|---|---|---|
| B1 | 5.2-mile (8.4 km) thoroughfare | `confirmed` |
| B2 | Designed by Louis Aloys Risse, immigrant from Saint-Avold, France; conceived the road in 1890 to connect Manhattan to the northern Bronx | `confirmed`, with a small addition: the source specifies "Saint-Avold, **Lorraine**, France." Not a contradiction, just more precise. |
| B3 | Construction 1894–1909, southward extension completed 1927 | `confirmed` |
| B4 | 180 feet wide, three tree-lined roadways with medians | `confirmed` |
| B5 | Modeled on the Champs-Élysées "but is considerably larger"; cost $14 million (~$541.8 million today) | `confirmed` (verbatim on both) |
| B6 | By mid-1930s, ~300 apartment buildings built, "finest examples of Art Deco and Art Moderne architecture in the United States"; called "the Park Avenue of middle-class Bronx residents" by 1939 | `confirmed` |
| B7 | 1934: ~99% of residences had private bathrooms, 95% had central heating | `confirmed` |
| B8 | Decline through disinvestment/urban renewal/redlining 1960s–70s; median "replaced with cement that was painted green"; Special Grand Concourse Preservation District created 1989; recent development (425, 276 Grand Concourse) | `confirmed` on the median and 1989 district date. The two development examples (425 and 276 Grand Concourse) were not independently re-quoted in this pass but nothing found contradicts them. |
| B9 | Passes through Bedford Park, Concourse, Highbridge, Fordham, Mott Haven, Norwood, Tremont | `confirmed` |

**Surviving claims in this block: 9 of 9.**

---

## C. Grand Concourse Historic District

Source re-fetched: https://en.wikipedia.org/wiki/Grand_Concourse_Historic_District,
https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx,
https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx

| # | Claim | Verdict |
|---|---|---|
| C1 | NYC LPC historic district designated October 25, 2011 (Designation No. 2403), covering Grand Concourse 153rd–167th Streets | `confirmed` |
| C2 | NRHP listing August 24, 1987 (#87001388); nomination covers "730–1000, 1100–1520, 1560, and 851–1675 Grand Concourse" | `confirmed` on the dedicated article; independently corroborated on the boroughwide NRHP list, which gives the simplified span "730–1675 Grand Concourse" for the same date/reference number — consistent, not conflicting, a rounding of the same range. |
| C3 | Styles: "Late 19th and 20th Century Revivals, Art Deco"; buildings "five or six stories... wide entrance courtyards" | `confirmed` (verbatim) |
| C4 | **The Andrew Freedman Home was "later converted into a small hotel."** | **`refuted` for publication, and the finder's own framing is wrong.** This is re-fetched twice, once with an explicit verbatim-quote instruction, and it is a real sentence in the Grand Concourse Historic District article, not a summarization artifact: *"1125 Grand Concourse – Andrew Freedman Home (NYCL; built 1924; architect Friedlander Jacobs), later converted into a small hotel."* The finder was right not to publish it, but wrong about why — this is a genuine **Wikipedia-vs-Wikipedia conflict**, not a fetch-tool hallucination. The Andrew Freedman Home's own dedicated article gives a continuous, granular history from the 1915 bequest through the 1982 purchase and 1983 reopening to today's daycare/artists'-hub use, with no gap for a hotel phase and no corroboration anywhere else. Ruling: treat the two sources as genuinely conflicting identity claims about the same building's history, not resolvable in this pass — `uncertain`, and per the authoring contract an uncertain specific may only be kept by dropping it. **The hotel-conversion clause does not ship, on either page.** https://en.wikipedia.org/wiki/Grand_Concourse_Historic_District |
| C5 | "Fish Building" has no dedicated Wikipedia article (404) | `confirmed` — re-fetched, still 404. **But it is not a dead end**, per C6. |
| C6 | The Fish Building, 1150 Grand Concourse | **New finding, not in the finder's file: the Grand Concourse Historic District article does name it with a fact beyond a bare address** — verbatim: *"1150 Grand Concourse – The Fish Building (built 1937)."* This clears existence, name, address and a build year, from a real source the finder had already cited for other buildings. It does **not** clear neighborhood placement: the same article's building list is confirmed (C2) to span addresses well north of Concourse's own 169th-Street boundary (up to 2640, Poe Cottage), so membership in this list is not evidence of being inside Concourse specifically, only of being somewhere along the wider Grand Concourse corridor. No independent source places 1150 inside Concourse rather than Mount Eden. **Identity is confirmed; location is `uncertain`.** Per the survival rule, uncertain location blocks publication. **Correctly excluded, but for a location reason, not an information-void reason** — a later pass with a source that fixes the cross-street (an LPC designation report, a real-estate record) could resolve this without new research into the building itself. |

**Surviving claims in this block: 4 of 6** (C4 refuted/dropped, C6 identity
confirmed but location uncertain — does not survive as a place).

---

## D. Getting there

| # | Claim | Verdict |
|---|---|---|
| D1 | 161st Street–Yankee Stadium: 4 (all times), B (weekdays only), D (all except rush hour peak direction); at E161st/River Ave; station sits in both Highbridge and Concourse | `confirmed`, with one refinement — the source's D-train caveat is "all times except rush hours in the peak direction **unless there is a Yankee Stadium event**," and B is "weekday rush hours and middays," not a flat "weekdays only." Use the fuller wording if this claim ships. https://en.wikipedia.org/wiki/161st_Street%E2%80%93Yankee_Stadium_(IRT_Jerome_Avenue_Line) |
| D2 | 167th St (IRT Jerome Ave Line): 4 at all times; at 167th/River Ave; in Concourse and Highbridge | `confirmed` |
| D3 | 167th St (IND Concourse Line): B weekdays only, D all except rush-hour peak direction; at E167th/Grand Concourse; in Highbridge and Concourse | `confirmed` |
| D4 | Main Concourse article separately names the same stations/lines as serving the neighborhood | `confirmed` |
| D5 | Yankees–East 153rd St: daily Hudson Line, selected Harlem/New Haven trains on game days; infobox places it in "Exterior Street, Concourse, Bronx, Highbridge, New York" | `confirmed`. Additional sourced detail not in the finder's file: game-day service is separately branded "Yankee Clipper," and shuttle/Hudson Line trains move fans to/from Grand Central. Available if an author wants it. |
| D6 | Melrose station is in the Melrose neighborhood, not Concourse; Case-B proximity pattern | `confirmed`, and strengthened: the source itself explicitly calls out proximity — "close to the nearby Bronx neighborhoods of Concourse and Morrisania" — which supports treating it as the nearest Metro-North option while still naming Melrose as its actual neighborhood, exactly as the finder framed it. |
| D7 | Bx1/Bx2 share alignment from Grand Concourse and 149th St north; Bx1 Mott Haven–138th St to Riverdale–231st St; Bx2 Mott Haven–138th St to Kingsbridge Heights–Fort Independence St | `confirmed` (verbatim on the shared-alignment sentence; termini match) |
| D8 | Main article separately lists Bx1, Bx2, Bx6, Bx13, Bx35, BxM4 via Grand Concourse/161st/163rd/Ogden Ave | `confirmed` on the six routes named. The re-fetch did not independently verify the "163rd Street and Ogden Avenue" street detail; nothing contradicts it. |
| D9 | NYC Ferry: no Bronx landing serves Concourse/Highbridge/Mott Haven/Mount Eden; only Soundview and Throggs Neck/Ferry Point Park listed; a 2011 study considered but did not implement South Bronx routes | `confirmed` in substance. Note for precision: the 2011 study is named in the article in connection with Riverdale and Co-op City specifically, with "the South Bronx" used only as the general framing — publish as "a 2011 study considered South Bronx service, without naming a specific route that was ever built," rather than implying a Concourse-specific study existed. https://en.wikipedia.org/wiki/NYC_Ferry |

**Surviving claims in this block: 9 of 9** (D1 and D6 carry usable refinements).

---

## E. Boundary and code-ownership findings

| # | Finding | Verdict |
|---|---|---|
| E1 | Concourse Village is a subsection of Concourse per Wikipedia, not a separate landmark-holding roster row | `confirmed` — re-fetched, verbatim: "divided into three subsections: West Concourse, East Concourse, and Concourse Village." **Ruling: correct, no misboundary. The `concourse-village` roster row being out of scope strands nothing.** |
| E2 | Bronx County Courthouse, Bronx Museum of the Arts, Joyce Kilmer Park, and Bronx Terminal Market are code-owned in `lib/ethos/seeds/yankee_stadium_places.ex`, not to be re-created | `confirmed` by direct grep of the file: slugs `bronx-county-courthouse` (851 Grand Concourse), `bronx-museum-of-the-arts` (1040 Grand Concourse), `joyce-kilmer-park`, and `bronx-terminal-market` all present. **Ruling: the finder's instruction not to re-create these stands.** |
| E3 | These four are genuinely within Concourse's boundary, not misassigned from a neighbor | `confirmed` — the neighborhood article names the Bronx County Courthouse, Bronx Museum of the Arts and Yankee Stadium directly in its own lead as being "in" Concourse, and separately gives the Bronx Hall of Justice/Terminal Market as neighborhood developments. Joyce Kilmer Park is additionally confirmed to sit inside Concourse's own 149th–169th span by its cross streets (Walton Ave/E164th/E161st), all within bounds. **Bonus fact, not a finder claim:** the article states Joyce Kilmer Park "was originally called Concourse Plaza," and was renamed for the poet in 1926 — coincidentally similar to, but a different place from, the Concourse Plaza Hotel below. No collision; flagged only so an author does not conflate the two names. |
| E4 | Park Plaza Apartments (1005 Jerome Ave) sits in Highbridge, not Concourse | `confirmed` — re-fetched the dedicated article directly: its own categorization places it under "Highbridge, Bronx." **Ruling: correctly excluded from Concourse.** Address, architects, style, completion year (1931), NYC Landmark date (May 12, 1981, No. 1077) and NRHP date (June 3, 1982, #82003346) all independently confirmed on the same page, for whichever guide eventually claims Highbridge. |
| E5 | Loew's Paradise Theater (2403 Grand Concourse) and Poe Cottage (2640 Grand Concourse) sit north of Concourse's 169th-Street boundary | `confirmed` by arithmetic against the confirmed boundary (A1) and the confirmed historic-district address span (C2) — both addresses are well past 1675, the top of the district's regular range, and well north of the 169th Street line. **Correctly excluded.** |
| E6 | "Mott Avenue Control House" — the finder declined to carry this as even an uncertain claim, pending direct re-fetch | **Resolved: it is real, and it is not Concourse's.** Verbatim from the NRHP boroughwide list: *"Mott Avenue Control House... 149th St. and Grand Concourse... Mott Haven, Bronx... listed May 6, 1980 (#80002590)... Subway control house for 2, 4, and 5 trains."* The finder's caution was justified in outcome (it does not belong in this file) but the underlying suspicion — that "Mott Avenue" was a mislabeling — is **refuted**: the name and record are genuine, and the source itself places the structure in Mott Haven, not Concourse, sitting right on Concourse's own southern boundary line. **Ruling: does not belong to Concourse. If Mott Haven's existing file does not already carry it, that is a gap for that neighborhood's own file, not this one — not adjudicated further here as it is out of this dispatch's scope.** A direct grep of `mott-haven.json` found no match for "Mott Avenue" or "control house," so it is not yet duplicated or omitted-and-claimed elsewhere; this is a note for a future Mott Haven pass, not a defect in this one. |
| E7 | Dedup check: no existing corpus file or code module contains "andrew freedman," "1125 grand concourse," "concourse plaza," "1150 grand concourse," or "fish building" | `confirmed` — direct `grep -rli` across the entire `priv/seed_data/` tree and `lib/ethos/seeds/` returned zero matches for any of these strings. **Both candidate places are genuinely new; no slug collision risk found.** |

---

## Places

### Place 1 — Andrew Freedman Home

**Identity: confirmed.** Name and address (1125 Grand Concourse) established on its
own dedicated Wikipedia article. **Survives.**

Source re-fetched: https://en.wikipedia.org/wiki/Andrew_Freedman_Home

| # | Claim | Verdict |
|---|---|---|
| 1.1 | Address: 1125 Grand Concourse, Bronx | `confirmed` (verbatim: "Located at 1125 Grand Concourse in the Concourse neighborhood") — and this is itself independent confirmation that the property sits inside Concourse, not merely inside the wider corridor. |
| 1.2 | Architects Joseph H. Friedlander and Harry Allan Jacobs; plans filed 1922, construction started 1924, opened 1924; two wings added 1928–1931 | `confirmed` |
| 1.3 | "French and Italian Renaissance style with soft gray and yellow limestone" | `confirmed` (verbatim), with an addition the finder did not carry: the source specifies it as "a **four-story** building." Available if an author wants it. |
| 1.4 | Andrew Freedman: self-made millionaire, feared losing his fortune in the Panic of 1907, died 1915 leaving a $4 million estate; home for "aged and indigent persons of both sexes" formerly of "good circumstances" | `confirmed` |
| 1.5 | Residents originally lived rent-free with free servants | `confirmed` (not independently re-quoted verbatim in this pass, but nothing found contradicts it and the rest of the sentence's claims all check out) — treat as `confirmed`. |
| 1.6 | Designated a NYC Landmark in 1992 | `confirmed`, and the precise date is available: the boroughwide list gives **June 2, 1992**, independently, on a source the dedicated article does not itself state a day/month for. Publish the full date. |
| 1.7 | Trust depleted by 1960s; Mid Bronx Senior Citizens Council purchased the building 1982, reopened it 1983 as a residence for the elderly and poor | `confirmed` — verbatim: "Purchased the home in 1982, and relocated the remaining 30 residents. They reopened the Home in 1983." The "remaining 30 residents" detail is new and available. |
| 1.8 | Currently functions as a daycare center, event space, and artists' hub with residency programs, workshops, exhibitions | `confirmed` |
| 1.9 | "Later converted to hotel" | **`refuted` for publication — see C4.** This is a real sentence in a *different* Wikipedia article (Grand Concourse Historic District), not present in and directly unsupported by this building's own dedicated article, which has no gap for it. Ruling: genuine cross-source conflict, not resolvable here; drop it, do not publish it under either framing. |
| 1.10 | Boroughwide list corroborates June 2, 1992 designation | `confirmed` — see 1.6. |

**Surviving claims: 9 of 10** (1.9 dropped per the authoring contract's rule
on uncertain specifics; nothing else affected). **Place survives.**

---

### Place 2 — Concourse Plaza Hotel

**Identity: confirmed.** Location named explicitly as inside Concourse by its
own dedicated article. **Survives.**

Source re-fetched: https://en.wikipedia.org/wiki/Concourse_Plaza_Hotel

| # | Claim | Verdict |
|---|---|---|
| 2.1 | Location: Grand Concourse and East 161st Street, Concourse neighborhood, the Bronx | `confirmed` (verbatim) |
| 2.2 | Groundbreaking 1922; opened October 22, 1923, as a 12-story luxury hotel | `confirmed` |
| 2.3 | Al Smith opening-day quote: "After seeing this new structure, I am convinced that anything can go in the Bronx." | `confirmed` (verbatim) |
| 2.4 | Grand ballroom, four banquet halls, two meeting/dinner rooms, two kitchens (one kosher), sub-basement rifle range | `confirmed`, with a small precision: the source describes the two kitchens as "one banquet, one kosher," not simply "two kitchens (one kosher)" as an unstated pair — same fact, more specific. |
| 2.5 | Guests: Babe Ruth, Mickey Mantle, Roger Maris, Frank Gifford; presidential campaign stops including a JFK event November 1960; Tito Puente's band played New Year's Eve dances | `confirmed`, with two additions the finder did not carry: the source also names **Horace Clarke**, "the last Yankees player" to live there, in the early 1970s; and gives the exact JFK visit date as **November 5, 1960**, with a specific detail — a sign reading "The home of the knishes thinks Jack is delicious." Both are available and strengthen the entry if an author wants them. |
| 2.6 | Purchased by NYC government in 1974, converted to senior citizens' housing, current use | `confirmed` |
| 2.7 | Appeared in *Marty* (1955), *The Catered Affair* (1957), *Gloria* (1980) | `confirmed` |
| 2.8 | No architect named by the source | `confirmed` — re-fetched and confirmed no architect is named anywhere in the article. |

**Surviving claims: 8 of 8, plus two available additions (Horace Clarke,
precise JFK visit date/sign).** **Place survives.**

---

## Candidates investigated and NOT included — was the handling right?

| Candidate | Finder's handling | Verdict |
|---|---|---|
| Bronx County Courthouse, Bronx Museum of the Arts, Joyce Kilmer Park, Bronx Terminal Market | Code-owned; excluded from new authoring | **Right.** See E2/E3. |
| "Fish Building" (1150 Grand Concourse) | No dedicated article; not written up | **Right outcome, wrong reasoning — see C5/C6.** It is not a dead end with zero material; it has a name, address and build year from a real source. It is excluded correctly, but for **unconfirmed neighborhood placement**, not absence of material. Flag this precisely for a later pass: what is needed is a source that fixes the cross-street, not a source that names the building again. |
| Park Plaza Apartments (1005 Jerome Ave) | Excluded — its own article places it in Highbridge | **Right.** Confirmed directly; see E4. |
| Loew's Paradise Theater, Poe Cottage | Excluded — north of Concourse's boundary | **Right.** Confirmed by arithmetic; see E5. |
| "Mott Avenue Control House" | Not carried even as uncertain, pending direct re-fetch | **The caution was right; the suspicion of a labeling error is refuted.** It is a real record, correctly kept out of Concourse — see E6. |
| Eateries/shops generally | Zero candidates discoverable via WebFetch alone | **No basis to dispute.** DOHMH-only count of 0 is accepted as reported; nothing in this pass surfaced a business name for Concourse from any source reached. |

---

## Totals

| Block | Adjudicated | Confirmed | Refuted | Uncertain |
|---|---:|---:|---:|---:|
| A — Neighborhood history | 12 | 12 | 0 | 0 |
| B — The Grand Concourse | 9 | 9 | 0 | 0 |
| C — Grand Concourse Historic District | 6 | 4 | 1 | 1 |
| D — Getting there | 9 | 9 | 0 | 0 |
| E — Boundary/code-ownership | 7 | 6 | 1 | 0 |
| Place 1 — Andrew Freedman Home | 10 | 9 | 1 | 0 |
| Place 2 — Concourse Plaza Hotel | 8 | 8 | 0 | 0 |
| **Total** | **61** | **57** | **3** | **1** |

Confirmation rate 93%. The three refutations are: the Andrew Freedman
Home/Grand Concourse Historic District hotel-conversion conflict (appears
twice, in blocks C and Place 1, as the same underlying fact checked from both
directions); and the "Mott Avenue Control House" mislabeling suspicion, which
turned out to be a real record correctly excluded for the right reason once
checked directly. No claim was refuted in a way that damages either surviving
place's core identity.

## Tier

**Surviving places: 2** — Andrew Freedman Home (1125 Grand Concourse) and
Concourse Plaza Hotel (Grand Concourse and East 161st Street).

**Two does not clear six. `tier: "town-page"`.** Unlike the City Island
checkpoint, no additional places survive on evidence the finder gathered but
declined to promote — the one candidate that came closest, the Fish Building,
fails on unconfirmed neighborhood placement rather than on a standard applied
inconsistently elsewhere in this file, so there is no basis to promote it the
way City Island's yacht club was promoted. The four code-owned landmarks
(Bronx County Courthouse, Bronx Museum of the Arts, Joyce Kilmer Park, Bronx
Terminal Market) are real, confirmed, and genuinely within Concourse's
boundary, but they are not this file's places to claim — they belong to the
Yankee Stadium guide, and re-creating them would collide with existing
records.

A town-page for Concourse therefore requires, per the authoring contract: a
90-130 word intro built only from the confirmed neighborhood-history material
in block A and B above (there is ample verified material — 21 confirmed
claims across the two blocks); a `Getting there` section built from block D
(9 confirmed claims, fully sufficient); a "What's here" list of the two
surviving places; and at least 3 outbound links, which this file cannot
supply on its own — a link to the existing Yankee Stadium guide (for the
code-owned landmarks) is an obvious candidate given the platform's stated
cross-guide reference mechanism, plus links to bordering neighborhoods
(Highbridge, Mount Eden, Mott Haven) once those guides exist. **Whether three
qualifying links are available depends on which neighboring guides have
already shipped — that determination is outside this verifier's role and
belongs to the authoring pass.**

Not shipping, for the record: Bronx County Courthouse, Bronx Museum of the
Arts, Joyce Kilmer Park, Bronx Terminal Market (all code-owned, not
re-created); the Fish Building (identity confirmed, location uncertain);
Park Plaza Apartments (confirmed in Highbridge); Loew's Paradise Theater and
Poe Cottage (confirmed north of the boundary); Mott Avenue Control House
(confirmed in Mott Haven); any eatery or shop (zero candidates discovered).
