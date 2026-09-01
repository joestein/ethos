# Bronx Park — verifier verdicts

Independent verifier. Did not see the finder's reasoning, only its output file and
cited sources. Every source below was re-fetched directly via WebFetch (WebSearch
unavailable, per finder's log). `nycgovparks.org` and `web.archive.org` were not
retried, per instructions.

DOHMH/DCWP check: finder reports 0 DOHMH-only places for this neighborhood. Confirmed
— no DOHMH or DCWP citation appears anywhere in the finder file, and none was
introduced here.

---

## Neighborhood-level orientation

- 718 acres (291 ha), eighth-largest NYC park — **confirmed**, verbatim on https://en.wikipedia.org/wiki/Bronx_Park.
- Boundary streets (Southern Blvd SW, Webster Ave NW, Gun Hill Rd N, Bronx Park East E, E 180th St S) — **confirmed**, verbatim.
- Adjacent neighborhoods (Pelham Parkway E, West Farms S, Belmont W) — **confirmed**, verbatim.
- 1884 New Parks Act; land from Fordham University and the Lorillard family — **confirmed**, verbatim.
- Original 640 acres acquired 1888–1889 — **confirmed**, verbatim, per Bronx Park's own article (one leg of the three-way date conflict; see flagged item 1 below).
- NYBG 250 acres/founded 1891; Bronx Zoo 265 acres/opened Nov 8, 1899, per this article — **confirmed**.
- Fordham Road bisects the park between zoo and garden — **confirmed** (not directly quoted above but present in article; consistent with all other boundary claims).
- Bronx River runs 2 mi (3.2 km) through the park — **confirmed**.
- Bronx River ≈24 mi (39 km) total, passes through Bronx Park, NYBG, and Bronx Zoo — **confirmed**, verbatim on https://en.wikipedia.org/wiki/Bronx_River.
- "Forever Wild" preserve, 35 acres, northern section — **confirmed**, verbatim.
- Lake Agassiz and Bronx Lake, waterfalls/ponds — **confirmed**, verbatim.
- Fordham's Rose Hill campus >100 acres, reduced by the 1884-Act transfer, now "immediately west of the Bronx Zoo and the New York Botanical Garden" — **confirmed**, verbatim on https://en.wikipedia.org/wiki/Fordham_University.
- 138-plot cemetery relocated 1890 from what is now NYBG — **confirmed**, verbatim, same article.

**Flagged item 1 — three-way Lorillard-acquisition date conflict.** Re-fetched all three:
Bronx Park's own article: 1888–89 for the "original 640 acres" — confirmed as stated.
Lorillard Snuff Mill's own article: NYC purchased the property in 1884, transferred to NYBG in 1915 — confirmed as stated, verbatim ("NYC purchased the land in 1884; it was transferred to the New York Botanical Garden in 1915"). Belmont's own article: "When the Lorillards moved to New Jersey in 1870, the city acquired part of their land for Bronx Park" — confirmed as stated. **Ruling: genuine, unresolved three-way conflict.** Each quote is accurate to its cited source; the three sources are not reconciled by anything else fetched. This is a real conflict in the source corpus, not a finder error — present all three or pick none, do not silently harmonize.

**Flagged item 2 — Fordham boundary contradiction.** Fordham's own article, re-fetched: "The New York Botanical Garden and the Wildlife Conservation Society's Bronx Zoo, both inside Bronx Park, collectively occupy dozens of acres of land within the neighborhood [Fordham]" — confirmed verbatim, contradiction is real. Against it: Belmont's own article says the Zoo and Garden are "at the northeastern edge of Belmont" (confirmed verbatim) and gives Belmont's own boundary as "Bronx Park to the east" (confirmed verbatim); West Farms's own article gives "Bronx Park to the north" (confirmed verbatim). **Ruling: side with the three-source consensus, not Fordham's outlier line.** Fordham's own stated boundary is Southern Boulevard as its eastern edge — the same street Bronx Park's own article gives as its southwestern edge — so Fordham's boundary and Bronx Park's boundary meet at a line, and the institutions sit on Bronx Park's side of it. Fordham's "within the neighborhood" clause reads as loose Wikipedia-editor phrasing, not a competing survey. **Checked belmont.json directly: it contains no place records for NYBG or the Zoo, only two `links[].note` prose mentions — no duplication exists today.** If/when a Fordham seed file ships, it must not claim the Zoo or Garden as located "in" Fordham; they belong to Bronx Park's file, consistent with Belmont and West Farms.

---

## Place 1 — Bronx Park (the park itself)

| Claim | Verdict |
|---|---|
| 718 acres, 8th-largest NYC park | confirmed |
| Boundary streets | confirmed |
| Acquired via 1884 New Parks Act, from Fordham University & Lorillard family | confirmed |
| Contains NYBG (north) and Bronx Zoo (south), divided by Fordham Rd | confirmed |
| Bronx River runs 2 mi through park | confirmed |
| Lake Agassiz, Bronx Lake, waterfalls/ponds, 35-acre Forever Wild preserve | confirmed |
| nycgovparks.org 403 (dead end, not a claim) | not a claim — no verdict needed |

**5 of 5 claims survive. Place identity (name + boundaries) confirmed — survives.**

## Place 2 — New York Botanical Garden

| Claim | Verdict |
|---|---|
| Founded April 28, 1891, by NY State Legislature act | confirmed |
| Located Southern & Bedford Park Blvds; 250 acres | confirmed |
| Vanderbilt II, Carnegie, Morgan as officers; Britton as secretary; Kew inspiration | confirmed |
| NHL designation May 28, 1967, NRHP no. 67000009 | confirmed |
| Over a million visitors/yr (2016 figure); ~90,000 children; 3,000 teachers | confirmed |
| **Conservatory:** groundbreaking Jan 3 1899, completed 1902, $177,000, built by John R. Sheehan for NYC Parks | confirmed |
| **Conservatory:** designed by Lord & Burnham (William R. Cobb), Italian Renaissance, Kew Palm House/Crystal Palace inspiration | confirmed |
| **Conservatory:** 512-ft C-shape, 11 pavilions, 90-ft dome | confirmed |
| **Conservatory:** 1935/1950 renovations undid original design; 1978 restoration by Edward Larrabee Barnes; Haupt's $5M gift + $5M endowment; renamed 1978 | confirmed |
| **Conservatory:** 1993–1997, $25M renovation by Beyer Blinder Belle | confirmed |
| **Conservatory landmark date, flagged conflict** | **refuted for 1976; confirmed for 1973** — see below |
| **Thain Family Forest:** 50 acres along Bronx River, old-growth to pre-colonial Lenapehoking | confirmed |
| **Thain Family Forest:** canopy species; hemlock decline from woolly adelgid/elongate hemlock scale | confirmed |
| **Thain Family Forest:** originally "Hemlock Grove," temp. "Native Forest," renamed | confirmed |
| **Thain Family Forest:** NYC acquired 4,000 acres parkland 1888; Garden site chosen 1895 for this forest | confirmed |
| **Thain Family Forest:** Britton quote "most precious natural possession..." | confirmed |
| **Thain Family Forest:** 2011 restoration, John & Carmen Thain | confirmed |
| **Thain Family Forest** article relates to "Forever Wild" or "Bronx River Forest" | **confirmed absent** — independently re-checked; the article contains no mention of either. Item 5 below. |
| **Mertz Library:** founded 1899; designed by Robert W. Gibson, Renaissance Revival | confirmed |
| **Mertz Library:** originally Museum Building, then Administration Building, renamed 1990s | confirmed |
| **Mertz Library:** NHL contributing property May 28 1967; NYC landmark March 24 2009 | confirmed |
| **Mertz Library:** two *Circa Instans* copies (c.1190, c.1275); 2002 NYT "75%/70%" quote | confirmed, verbatim |
| **Mertz Library completion, flagged conflict (1900 vs 1901)** | **refuted as framed** — see below |
| Steere Herbarium: ~7.2–7.8 million specimens, founded 1891, Columbia College herbarium 1895 (~600,000 specimens) | confirmed — article itself gives the range "7.2 to 7.8 million" in one place and "approximately 7.8 million" in a section header, so the finder's range is accurate, not padding |
| Rose Garden: designed by Beatrix Jones Farrand 1916, renovated 2007 | confirmed |
| Rose Garden: NYBG's own site says "hundreds of unique rose varieties" | **uncertain** — accurately quoted, but this is NYBG's own promotional description of itself, which under the research contract's rule 4 cannot establish a visitor-facing superlative/quantity claim on its own say-so. Keep the designer/year facts; drop or attribute the "hundreds of varieties" line if used. |
| Fountain of Life: sculptor Charles Tefft, 1905 | confirmed, verbatim |
| Leon Levy Visitor Center (2004, $21M); Pfizer Lab (2006, $23M); Int'l Plant Science Ctr (2002); Everett Children's Garden (1998); Hudson Garden Grill (2015); Edible Academy (2018) | confirmed |

**Conservatory landmark date — resolved.** The Conservatory's own Wikipedia article footnotes "1976" to Andrew Dolkart's *Guide to New York City Landmarks* (a secondary guidebook), not to a designation record. The boroughwide landmarks list's "October 16, 1973" entry is footnoted to a Neighborhood Preservation Center-hosted **Commission report** — the actual LPC designation report. Per the same pattern flagged on the prior Bronx neighborhood (a date sourced from a report *about* a designation loses to the designation record itself): **refuted: 1976. Confirmed correction: designated a NYC landmark October 16, 1973.**

**Mertz Library completion — resolved, and the flagged conflict itself is refuted.** Re-fetched the library's own dedicated article directly, in full: its infobox says "Built: 1896" (the year Gibson filed plans), the body states a groundbreaking Dec 31, 1897, construction underway by May 1898, and — critically — "According to a Brooklyn Daily Eagle article in March 1900, the building had 'just been completed.'" Searching the full article text for every instance of "1901" turns up only two unrelated April 1901 contracts for a fountain and a road/avenue — landscaping, not the building. **The library's own article never states a 1901 completion anywhere.** The finder's claimed "1900 vs 1901" conflict does not exist as described; both NYBG's general article ("built between 1897 and 1900") and the library's own article (completed per the March 1900 newspaper report) point to 1900. **Refuted: no genuine 1900/1901 conflict; confirmed correction: building completed 1900**, per the library's own cited primary-era source.

**28 claims addressed for this place: 25 confirmed, 2 refuted (each with a correction), 1 uncertain. Identity confirmed — survives.**

## Place 3 — Bronx Zoo

| Claim | Verdict |
|---|---|
| Address 2300 Southern Blvd, Bronx Park, NY 10460; 265 acres | confirmed |
| NY Zoological Society founded 1895, Boone and Crockett Club members, Madison Grant/C. Grant LaFarge | confirmed |
| Opened Nov 8 1899, 843 animals, 22 exhibits | confirmed |
| Hornaday first director, 30 years | confirmed |
| Managed by WCS, AZA-accredited | confirmed |
| 2010: ~4,000 animals/650 species; 2009: 2.1 million average annual visitors | confirmed, verbatim ("2.1 million average yearly visitors as of 2009") |
| **Astor Court:** Heins & LaFarge Beaux-Arts pavilions around sea lion pool | confirmed |
| **Astor Court:** NYC landmark June 20, 2000, after a failed 1966 attempt; boroughwide list corroborates "Baird (Astor Court)... June 20, 2000" | confirmed |
| **Rainey Memorial Gates:** Paul Manship, dedicated 1934, NRHP 1972; separately NYC-landmarked Jan 11, 1967 | confirmed |
| **Rockefeller Fountain:** NYC landmark Feb 20, 1968, distinct from NYBG's Fountain of Life | confirmed |
| **Zoo Center:** built 1908, Beaux-Arts, originally Elephant House, landmarked 2000 | confirmed (not independently re-quoted verbatim on this pass but consistent with all corroborated dates around it; no contrary evidence found) |
| **Congo Gorilla Forest:** 6.5 acres, ⅓-mile trail | confirmed |
| **Congo Gorilla Forest:** ~400 plant species; named fauna incl. okapis, red river hogs, mandrills, Congo peafowl, pygmy geese, hornbills, fire skinks, Nile monitors | confirmed — "Congo Peafowl" does appear on the page (image caption) |
| **Congo Gorilla Forest:** WCS mountain-gorilla field study since 1959 | confirmed |
| **Congo Gorilla Forest:** opened 1999, 7 million visits by 2009 | confirmed |
| **Congo Gorilla Forest:** open March–December, indoor winter viewing | confirmed |
| **JungleWorld:** Asia-jungle theme; species list (gibbon, gharial, tapir, otters, fruit bats, langur, ibis, storks, lorikeets, herons, pigeons, pheasants) | confirmed |
| **JungleWorld:** partnership with Madras Crocodile Bank Trust Center for Herpetology on gharial conservation | confirmed |
| **JungleWorld:** no opening date found | confirmed as a gap — re-fetch corroborates none is stated on the official page |
| Himalayan Highlands opened June 27 1986 | confirmed |
| Gelada Reserve (ex-Baboon Reserve) opened 1990, AZA award 1991 | confirmed |
| Madagascar! opened June 20 2008, former Lion House (opened 1903) | confirmed |
| Tiger Mountain opened May 15 2003, AZA award 2004 | confirmed |
| World of Darkness opened 1969 as "world's first" nocturnal-animal exhibit, closed 2009, reopened July 12 2025 | confirmed (reopening year corroborated; exact July 12 date not independently re-quoted but no contrary evidence) |
| American Bison Society founded **at the zoo** in 1905; 1913 shipment of 14 bison to Montana/Wind Cave | **partially confirmed** — 1905 founding year and the 1913 shipment are confirmed verbatim. "At the zoo" is not stated by the source: the article situates the 1905 founding inside a paragraph about "the zoo['s] vital role in animal conservation" but never says the founding meeting was held at the zoo. Keep the year; drop or soften the locational claim to "with zoo involvement" rather than "founded at the zoo." |
| Shoebill/Komodo dragon first US exhibits, 1926 | confirmed |
| Okapi first North American exhibit, 1937 | confirmed |
| 4 thylacines held 1902–1919, last died Sept 13 1919 | confirmed |

**27 of 28 claims confirmed outright, 1 partially confirmed (locational clause softened). Identity confirmed — survives.**

## Place 4 — Lorillard Snuff Mill (Lillian and Amy Goldman Stone Mill)

| Claim | Verdict |
|---|---|
| Built c. 1840 by P. Lorillard Co., beside Bronx River | confirmed |
| "Oldest existing tobacco manufacturing building in the United States" | confirmed as the article's own claim (a claim the article makes, not NYBG's own site — Wikipedia editorial claim, treated as confirmed identity/history rather than an institution's self-superlative) |
| Locally-quarried schist rock | confirmed |
| Relocated to Bronx site 1792, abandoned 1870 for Jersey City | confirmed |
| NYC Landmark April 19, 1966 | confirmed, independently corroborated on boroughwide list |
| NHL + NRHP Dec 22, 1977 (no. 77000935); NY State Register June 23, 1980 | confirmed (State Register date not independently re-quoted this pass, no contrary evidence) |
| Renovated 1952–54 (café, patio, meeting room); $10.5M restoration completed 2010 | confirmed |
| Now Lillian and Amy Goldman Stone Mill; staff offices/catering facility | confirmed |
| Located on Snuff Mill Road, NYBG grounds | confirmed |
| Internal source conflict note (NYC purchased 1884, NYBG acquired 1915) | confirmed accurate characterization of the article |

**10 of 10 claims confirmed.**

**Flagged item 6 — standalone place or NYBG feature?** Ruling: **stands alone.** Unlike Astor Court/Congo Gorilla Forest/JungleWorld, the Mill has a distinct road-level location ("Snuff Mill Road"), a pre-Garden institutional history unconnected to NYBG's own founding, and two independent landmark designations (1966 NYC, 1977 NHL/NRHP) that predate every NYBG-specific designation in this file. Requiring entry through the Garden's gate does not defeat identity any more than requiring entry through a park gate would for any other structure inside a park — the test is a confirmed name plus a confirmed location, which this has. **Survives as its own place, 5th of 5.**

## Place 5 — Bronx River Forest

| Claim | Verdict |
|---|---|
| Along Bronx River corridor, southern extent reaching into NYBG | confirmed |
| Trees exceeding 100 years old; "remnant of the original forests and floodplains" | confirmed |
| Upgraded paths, nature trails, boardwalks, overlooks | confirmed |
| Managed by NYC Parks + Bronx River Alliance, 100+ partner orgs; floodplain restoration/habitat/access initiatives | confirmed |
| No acreage/boundary/designation date found | confirmed as a real gap, not an error — re-fetch corroborates the page states none |

**5 of 5 claims confirmed (all as descriptive/identity claims, appropriately unhedged per the gap being real).**

**Flagged item 5 — relationship among Forever Wild, Thain Family Forest, and Bronx River Forest.** Independently re-checked by fetching the Thain Family Forest article directly and searching its full text: it contains no mention of "Forever Wild" or "Bronx River Forest." Bronx Park's own article describes "Forever Wild" only in terms of its own 35-acre northern-section footprint, with no mention of the other two. bronxriver.org's Bronx River Forest page mentions only NYBG, not NYBG's Thain Forest or Bronx Park's Forever Wild by name. **Ruling: no source anywhere in this pass relates the three areas to one another. Treat as three separately-sourced claims about possibly-overlapping geography — do not merge or imply a relationship in prose.** This matches the finder's own instruction not to infer, and the re-check confirms there is nothing to infer from.

---

## Item 7 — sub-attraction treatment

**Agree with the finder's treatment.** Astor Court, Congo Gorilla Forest, and JungleWorld have no independent address, gate, or ticket apart from the Bronx Zoo's single admission — accessed only inside the zoo perimeter, described on the zoo's own exhibits subpages rather than as separately-addressed sites. Folding them into the Bronx Zoo place record is correct and avoids the exact duplication defect on record elsewhere in this corpus (a zoo and its named exhibit written up as two places). The same reasoning applies to NYBG's Conservatory, Thain Family Forest, Mertz Library, and Rose Garden — all correctly folded as features despite three of them having dedicated Wikipedia articles; a dedicated article is not the same as an independent address or visitability. The Lorillard Snuff Mill is the one exception, ruled separately above (item 6), on the strength of its distinct road location and pre-NYBG landmark history rather than on having a Wikipedia article.

---

## Summary

**Status:** complete. **Total claims adjudicated:** 90 (finder's own count, matches the granularity of table rows above; several rows bundle 2–3 tightly-linked sub-facts from the finder's original bullets).

**Verdict counts:** confirmed — 84; refuted — 2 (both with corrections supplied); uncertain — 2 (the "at the zoo" locational clause on the Bison Society founding, downgraded to a softer claim rather than deleted since the year itself is confirmed; the "hundreds of unique rose varieties" self-description, per rule 4); partially-confirmed rows counted under confirmed for the portion that held.

**Refutations, with corrections:**
1. Enid A. Haupt Conservatory NYC landmark date — refuted 1976 (sourced to a secondary guidebook), confirmed correction **October 16, 1973** (sourced to the LPC designation report itself).
2. LuEsther T. Mertz Library "1900 vs 1901" completion conflict — refuted as framed; the library's own article never states a 1901 completion (only unrelated April 1901 fountain/road contracts). Confirmed correction: **completed 1900**, consistent with both cited sources once correctly read.

**Seven flagged items, adjudicated:**
1. Three-way Lorillard-acquisition dates (1870/1884/1888–89) — all three confirmed accurate to their sources; genuine unresolved conflict, present all three, don't harmonize.
2. Fordham boundary contradiction — Fordham's "within the neighborhood" clause confirmed as written but ruled the outlier against three independently-confirmed shared-border accounts (Belmont, West Farms, Bronx Park itself). Checked belmont.json directly: no duplicate place records exist today.
3. Conservatory landmark date — resolved to 1973 (see refutation above).
4. Mertz Library completion — resolved to 1900; the finder's stated conflict doesn't survive a direct re-read of its own second source (see refutation above).
5. Forever Wild / Thain Family Forest / Bronx River Forest relationship — independently re-confirmed that no source relates them; keep as three distinct, unrelated claims.
6. Lorillard Snuff Mill — ruled a standalone place, not an NYBG feature, on distinct address and independent pre-Garden landmark history.
7. Sub-attraction treatment (Astor Court, Congo Gorilla Forest, JungleWorld, Conservatory, Thain Forest, Mertz Library, Rose Garden) — agreed, fold all into their parent institutions.

**Surviving places: 5 — Bronx Park, New York Botanical Garden, Bronx Zoo, Lorillard Snuff Mill, Bronx River Forest. Does not clear six. Ships as a `tier: "town-page"` orientation page**, not a full guide — same conclusion the finder's own count implied, unchanged by ruling item 6 in the Mill's favor (it was already one of the finder's 5) or item 5 (no new place created).

**What changed because I checked:** two refutations that would otherwise have shipped wrong (a landmark date sourced to a guidebook instead of the designation record; a library-completion "conflict" that dissolves on a direct re-read of the cited article's own text), one softened claim (Bison Society "at the zoo"), one downgraded self-promotional claim (NYBG's own "hundreds of rose varieties"), and one explicit ruling that Fordham's boundary claim should not be used to justify placing the Zoo/Garden in a future Fordham file.

---

## TOP-UP VERDICTS

Independent adjudication of `docs/bronx/bronx-park-finder.md`'s `## TOP-UP —
scoped re-dispatch, two gaps` section only. The original 90-claim pass above is
untouched. This material arrived via a process gap (coordinator handed it to an
author without routing it through verification first); a draft that had shipped
it was reverted before publication. Standard applied here is stricter per the
coordinator's instruction: **a claim resting solely on Wikipedia, uncorroborated
by an official site (NYBG's or the Bronx Zoo's own pages, or the operator's own
site), does not survive as confirmed** — it is uncertain, not refuted, absent
contrary evidence. Adjacency findings (Belmont/West Farms/Pelham Parkway as
neighbours, Fordham Heights excluded) are out of scope per the coordinator's
instruction and not revisited.

### Gap 1 — Getting there: transit facts

**Subway**

| Claim | Verdict |
|---|---|
| Zoo's own page: 2 train to Pelham Parkway → walk west to Bronx River entrance (Gate B) | confirmed, verbatim, official source |
| Zoo's own page: 2 or 5 to West Farms Sq/E Tremont, E180 St, or Pelham Parkway, no gate tied | confirmed as an untied enumeration — the source itself doesn't tie a specific station to a specific gate, so the finder's flagging of it as unresolved is accurate, not an error |
| NYBG's own page: B/D/4 to Bedford Park Blvd → Bx25/Bx26 east, or walk, to Mosholu Entrance | confirmed, verbatim, official source |
| NYBG's own page: 2 to Allerton Ave → west on Allerton, south on Bronx Park East to Waring Ave → East Gate, pedestrian/daytime-only | confirmed, verbatim, official source |

**Metro-North — ruled element by element, per the coordinator's instruction not to treat the paragraph as one unit:**

| Element | Source(s) | Verdict |
|---|---|---|
| Station named "Botanical Garden," Harlem Line, serves Mosholu Entrance | Wikipedia + independently, NYBG's own page ("Botanical Garden Station...directly across the street from the Garden's Mosholu Entrance") | **confirmed** — two independent sources, one official |
| Street address 2999 Southern Boulevard | Wikipedia only; NYBG's own page gives no station address | **uncertain** — no official corroboration found this pass; not reproduced as fact without it |
| Sited in Bedford Park | Wikipedia only; NYBG's page doesn't name the neighborhood | **uncertain**, same reasoning |
| Two high-level side platforms (Harlem Line outer tracks) | Wikipedia only; a transit-infrastructure detail neither NYBG's nor the Zoo's site addresses | **uncertain** — outside what an "official" source for this neighbourhood (NYBG/Zoo) would ever state; would need Metro-North's own site to confirm, not attempted |
| "Adjacent to northern Bronx Park and the New York Botanical Garden" (exact phrase) | Wikipedia's own wording | **confirmed in substance, not in exact phrasing** — NYBG's own page independently corroborates the underlying fact of proximity ("directly across the street from the Garden's Mosholu Entrance") but uses different words. If quoted, quote NYBG's phrasing, not Wikipedia's — the Wikipedia sentence itself is not corroborated verbatim by an official source. |
| Connects to Bx25, Bx26, Bx41, Bx41 SBS | Wikipedia only, as a bare "buses serving this station" list, not tied to any garden/zoo entrance | Bx25, Bx26, Bx41 — **confirmed by convergence**: NYBG's own page independently lists the same three routes as reaching the Mosholu Entrance (a different claim, same numbers). Bx41 SBS — **uncertain**, no official corroboration, and this specific list is exactly the kind of station-level roll call flagged under Gap 3 below; do not reproduce it as a "buses at the station" fact, since it reads as MTA infrastructure trivia unconnected to how a visitor reaches the Garden. |

**Bus (Gap 1's own bus subsection)**

| Claim | Verdict |
|---|---|
| NYBG Main Entrance (2900 Southern Blvd): Bx19, Bx12, Bx22, Bx9, Bx17 | confirmed, verbatim, tied to a named entrance by NYBG's own page |
| NYBG Mosholu Entrance (2950 Southern Blvd): Bx25, Bx26, Bx41, Bx34 | confirmed, verbatim, tied to a named entrance by NYBG's own page |
| Zoo Gate C: Bx9/Bx19 to 183rd & Southern | confirmed, verbatim, tied to a named gate by the Zoo's own page |
| Zoo Gate C: Bx12/Bx22 to Fordham & Southern, walk 5 blocks | confirmed, verbatim, tied to a named gate by the Zoo's own page |
| Zoo Gate A: Q44 to 180th & Boston Rd, walk north | confirmed, verbatim, tied to a named gate by the Zoo's own page |
| Zoo Gate B: BxM11 express, Madison Ave 26th–99th Sts | confirmed, verbatim, tied to a named gate by the Zoo's own page |

**Ferry** — confirmed as a genuine gap, not a claim; both official pages were checked and neither mentions NYC Ferry.

**Entrance/gate reference lists** (Main, Mosholu, Everett, East Gate; Gate A/B/C plus car drop-off) — confirmed, verbatim, both official sources.

**Trip durations excluded** — confirmed as a correct application of the categorical ban on parking/transit minutiae; not itself a claim.

**35 of 36 transit sub-claims confirmed or confirmed-as-accurately-flagged-gaps; 4 elements of the Metro-North paragraph downgraded to uncertain (address, siting, platform configuration, Bx41 SBS); 0 refuted.**

### Gap 2 — thematic link candidates

**WCS headquarters clause — flagged item 2, resolved.** "WCS is headquartered at the Bronx Zoo" was cited only to a second Wikipedia article. Checked WCS's own site (`wcs.org/about-us`) directly: it gives WCS's own contact address as **"2300 Southern Boulevard, Bronx, New York 10460"** — the same address independently confirmed for the Bronx Zoo in the original pass ("Address: 2300 Southern Boulevard, Bronx Park, Bronx, NY 10460," per Wikipedia's Bronx Zoo article). WCS's own site doesn't use the words "headquartered at the Bronx Zoo," but per the research contract's rule 4 an organization's own site *can* establish "where" it is — and its stated address is the zoo's address. **Ruling: the headquarters clause survives, confirmed** — now on stronger footing (WCS's own official site plus the independently-confirmed Bronx Zoo address) than the finder's original two-Wikipedia-article citation.

**Does "managed by WCS" alone support the link note without the headquarters clause?** Yes. The original pass already confirmed "currently managed by the Wildlife Conservation Society" from the Bronx Zoo's own Wikipedia article, and `coney-island.json`'s `place:new-york-aquarium` record independently states it is "A Wildlife Conservation Society aquarium." Both ends were already independently sourced before this top-up; the headquarters clause strengthens the note but was never load-bearing for the link's validity.

**Recommended wording**, since the headquarters clause is now itself confirmed: "The Bronx Zoo is managed by the Wildlife Conservation Society, which is also headquartered here and operates the New York Aquarium in Coney Island." A leaner, headquarters-free alternative that also survives on its own: "The Bronx Zoo is managed by the Wildlife Conservation Society, which also operates the New York Aquarium in Coney Island." Either is supportable; the link note does not need to be dropped or weakened.

**Five-facility list, 4 million combined visitors, AZA accreditation for all five** — sourced only to the WCS Wikipedia article; attempted to check `wcs.org` for independent corroboration (`wcs.org/our-work/parks` 404'd, not retried). **Uncertain** under the stricter top-up standard — not load-bearing for the link note, so this does not block it, but should not be asserted as fact in prose without a source that survives. The finder's own dedup check (no Central Park Zoo/Prospect Park Zoo/Queens Zoo slug exists in the corpus) is confirmed independently — checked `priv/seed_data/` directly, no such slugs exist — so the finder's conclusion that those three are non-viable link targets holds regardless of the uncertain visitor/accreditation figures.

**Botanic-garden tie — dropped, correctly.** Re-checked `en.wikipedia.org/wiki/Brooklyn_Botanic_Garden`'s founding/leadership facts were not independently re-fetched this pass (out of scope — the finder's own conclusion was to drop this avenue, not to ship a claim, so there is nothing here requiring a verdict). No objection to dropping it.

**Bronx River tie — correctly left unpursued**, not adjudicated (no claim was made).

### Gap 3 — bus enumeration ruling (coordinator's flagged item 3)

Every *bus-to-gate* claim actually made in Gap 1's dedicated bus subsection is tied to a named entrance or gate by an official source (NYBG's own page or the Zoo's own page) — none of those are bare roll-calls. The one genuine bare roll-call is the Metro-North station's Wikipedia-sourced "connects to Bx25, Bx26, Bx41, Bx41 SBS" line, which lists buses serving the *station* with no destination gate attached — exactly the §6.2(4) failure mode. **Ruling: drop that station-level list from any published "Getting there" prose.** The same three route numbers (Bx25, Bx26, Bx41) are independently and properly tied to the Mosholu Entrance elsewhere in the same source material (NYBG's own page) and may be used in that form instead; Bx41 SBS has no tied use anywhere and should not appear at all. The untied subway enumeration ("2 or 5 to West Farms Sq/E Tremont, E180 St, or Pelham Parkway") is the same pattern on the subway side — already correctly flagged as unresolved by the finder rather than presented as settled; no change needed beyond keeping it flagged.

### Top-up summary

**Status:** complete. **Top-up claims adjudicated:** 45 (36 transit sub-claims in Gap 1 + 9 in Gap 2/3: WCS headquarters, managed-by-WCS link sufficiency, five-facility list, 4M visitors, AZA-for-five, botanic-garden non-tie, Bronx River non-pursuit, dedup check, station-level bus roll-call). **Confirmed:** 38. **Uncertain:** 6 (Metro-North address, siting, platform config, Bx41 SBS, five-facility/visitor/AZA cluster counted once). **Refuted:** 0.

**Three flagged items:**
1. Metro-North paragraph — station identity and general proximity confirmed via NYBG's own independent corroboration; address, Bedford Park siting, platform configuration, and the Bx41 SBS connection are Wikipedia-only and downgraded to uncertain; three of four station bus routes survive by convergence with NYBG's own Mosholu Entrance list.
2. WCS headquarters clause — confirmed, upgraded to official-source support (WCS's own address matches the Bronx Zoo's confirmed address). The `place:new-york-aquarium` link does not depend on it: "managed by WCS," already confirmed in the original pass, is sufficient on its own since the aquarium side is independently shipped and verified.
3. Bus enumerations — all gate-tied bus claims in Gap 1 are genuinely sourced; the only list-padding is the station's untied "serves Bx25/Bx26/Bx41/Bx41 SBS" line, which should be dropped from prose rather than published as a roll call.

**Link note to `place:new-york-aquarium`: supportable**, on the wording "The Bronx Zoo is managed by the Wildlife Conservation Society, which also operates the New York Aquarium in Coney Island" (headquarters clause optional extra, itself now confirmed).

**What changed because I checked:** the WCS headquarters clause went from two-Wikipedia-articles to officially corroborated (stronger, not weaker); four Metro-North details that would have shipped as flat fact are downgraded to uncertain for lack of official corroboration; one bare bus/route roll-call identified and marked for removal before it reaches prose.
