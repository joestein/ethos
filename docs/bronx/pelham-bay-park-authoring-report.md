# Pelham Bay Park — authoring report

Output: `priv/seed_data/bronx/pelham-bay-park.json`
Source of truth: `docs/bronx/pelham-bay-park-verdicts.md`
Contract: `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`
Gate: `test/ethos/seeds/bronx_seed_data_test.exs`

---

## 1. Tier, floors, structure

| | |
|---|---|
| Surviving places | **4** — below six |
| Tier | **`town-page`** |
| Intro | **129 words** (floor 90; rule 8 range 90-130) |
| Outbound links | **2** (Bronx floor is 2, lowered from 3 for this borough) |
| Sections | `What's here` · `The Siwanoy, the Pell purchase and the Battle of Pell's Point` · `Getting there` |
| FAQ | 3, including `How do I get to Pelham Bay Park?` |
| Photos | `[]` — the four shipped Bronx pages carry none and no photo artifact exists |

**Written as a place, not a chronology.** The intro opens on acreage, shoreline,
the beach, the mansion and the golf courses. `What's here` — the whole of
section 1 — is what a visitor finds: the beach and its landmarked bathhouse, the
mansion, the golf facility, the sanctuaries, the islands, the lagoon. The
Siwanoy, the Pell purchase, the battle and the Hunter estate are section 2,
below the thing a visitor came for. This is the correction City Island's page
was sent back for.

### The four places

| slug | name | kind | address | official_url |
|---|---|---|---|---|
| `pelham-bay-park` | Pelham Bay Park | `park` | `null` | omitted |
| `orchard-beach` | Orchard Beach | `park` | `null` | omitted |
| `bartow-pell-mansion-museum` | Bartow-Pell Mansion Museum | `museum` | 895 Shore Road, Bronx, NY 10464 | bartowpellmansionmuseum.org |
| `pelham-bay-split-rock-golf-courses` | Pelham Bay & Split Rock Golf Courses | `attraction` | 870 Shore Road, Bronx, NY 10464 | pelhamsplitrock.com |

**The golf courses ship as ONE place.** Verdict block D: one address, one pro
shop, one phone, one booking system, one operator. Split Rock does not survive
the identity test against Pelham Bay, so shipping them separately would put a
single address on two records.

**Two `null` addresses, deliberately.** No source in the finder or the verdicts
gives a street address, a boundary list or a cross-street pair for the park
itself or for Orchard Beach. Rule 2 forbids inventing one, and `null` is the
shape `bronx-park.json` (Bronx River Forest) and `mott-haven.json`
(St. Mary's Park) already ship for exactly this.

**One address trimmed, and the trim is recorded rather than silent.** The
research gives the mansion's address as "895 Shore Road, Pelham Bay Park,
Bronx, NY 10464". The greedy street capture in `Ethos.Places.Address` emits that
as the comma-qualified street line `"895 Shore Road, Pelham Bay Park"`, which
`comma_streets <= 48` in `test/ethos/places/address_test.exs` pins so the
population of that accepted defect cannot grow silently. The park line carries
no information this page does not state in prose three times over, so the seed
carries `"895 Shore Road, Bronx, NY 10464"` — every token still traces to the
verdict's string, in order — rather than the pin being raised to 49. Noted in
the `structured_data_test.exs` comment too.

### The eight folds, honoured

Bronx Victory Memorial, Glover's Rock, Split Rock (the rock), Hunter Island,
Twin Island, Two Trees Island and Rodman's Neck are **prose in the park's own
material and are not places**. Neither the LPC boroughwide list nor the Bronx
NRHP list carries a designation record for any of them, and Rodman's Neck's
developed portion is a restricted NYPD range. The Orchard Beach bathhouse and
promenade, and the Bartow-Pell carriage house, are likewise folded into their
parents — one designation, one listing, no separate address or ticketing.

---

## 2. The two links

| target | kind | why this kind |
|---|---|---|
| `guide:city-island-bronx-guide` | **`shared-history`** | Rule 11 reserves `nearby` for two places that **share a border, nothing weaker**. City Island is "south of Pelham Bay Park" and reaches the mainland over Rodman's Neck; that is a crossing, not a shared border in the sense rule 11 means, and the verdict's own "nearby or shared-history" is resolved against `nearby` on exactly that reading. What the tie actually rests on is a **stated historical relationship**, which is `shared-history`'s definition: the shared 1654 root of title through Rodman's Neck (verdict 160) and Samuel Rodman's ferry running from that neck to Minneford Island on the site of today's crossing (161). The note quotes both, per rule 11's requirement that a `shared-history` note quote the relationship. |
| `guide:coney-island-brooklyn-guide` | **`see-also`** | Rule 11: **"`see-also` — cross-borough edges only."** This is Bronx → Brooklyn, so it is a cross-borough edge, and `see-also` is the kind the whole corpus uses for one — all twenty existing cross-borough/cross-region edges in `priv/seed_data/` are `see-also`, including `belmont.json` → `little-italy-manhattan-guide` on this borough's own side. The verdict proposed `shared-history` before applying rule 11's cross-borough clause; the *substance* it proposed it on is unchanged and is what the note carries. |

The Coney Island connection is **institutional and dated on both sides**, not
"both are beaches": Parks Commissioner Robert Moses announced Orchard Beach's
expansion on February 28, 1934 and the golf courses were created through his
efforts; the same commissioner, in the same office, reported on Coney Island's
redevelopment in 1937, relocated its boardwalk from 1949 and proposed rezoning
the peninsula in 1953. `coney-island.json` names no Moses, so the note is
written from the verdict's sources and not from that file.

**"Adjacent to City Island" is REFUTED** and appears nowhere. The Orchard Beach
article's only City Island sentence says "nearby". That strand is not leaned on
at all — the link rests on 160, 161, 163 and 165.

Link-note lengths: 132 and 143 characters (limit 160). Both resolve — the gate
seeds Manhattan and Brooklyn before the Bronx pass, and
`coney-island-brooklyn-guide` is shipped.

---

## 3. The corrections, applied exactly

| Correction | Applied |
|---|---|
| NHL date **December 8, 1976**, from the designation roll, not the museum's 1977 | Place `history` and FAQ 3 both carry December 8, 1976 |
| **No acreage** for the 1654 Pell purchase | "deeded land to Thomas Pell" — no figure, **no hedge, and no disclaimer sentence naming the range** |
| 1811/1813 is **not** a conflict | "In 1811 the Hunter family built a mansion… Hunter, his wife Elizabeth and his son Elias moved to the island in 1813" — two events, no conflict described |
| Clinton vs Howe is **not** a conflict | "General Sir Henry Clinton led the 4,000-man landing force as an advance guard; General Sir William Howe was the British commander-in-chief" |
| Reopening year **1946** | "opened as a historic house museum in May 1946". No 1945 anywhere |
| Name **Bartow-Pell Mansion Museum**, slug `bartow-pell-mansion-museum` | Both, hyphen not en dash |
| "**Last remaining masonry carriage house**" is **Wikipedia's** | Attributed to Wikipedia in the place `history` and in section 1 |
| "**Only remaining grand country estate**" is the museum's self-claim | **Cut.** Wikipedia's "last surviving manor house in the Pelham Bay Park area" ships in its place |
| Siwanoy name gloss | **Cut entirely** — "southern people" vs "salt people" is an unflagged conflict; no meaning is given for the name |
| **June 27, 1654** destabilised | **Cut.** The year 1654 ships alone |
| Delano & Aldrich date ranges swapped and conflicting | **Neither range ships.** "restored by Delano & Aldrich in the 1910s"; the garden's completion in 1916 ships, being separately confirmed |
| Hunter purchase year | "offered for lease on the death of its owner Henderson in 1804, and John Hunter… purchased the property shortly afterward" — not "purchased in 1804" |
| Blue and white tiles | Written as an **interior** finish, with the 6-foot cladding, not as the building's exterior |
| Pedestrian bridge | "it leads into the park, and not onward to City Island" |
| City Island Bridge | Referenced as the island's only connecting road; **no bridge place record on this page** |

---

## 4. The five rules earlier pages paid for

1. **DOHMH/DCWP** — the verifier reports **zero** DOHMH-only candidates and zero
   named eatery, concession or shop anywhere in the material, so no such record
   does any prose work here: no date, no grade, no cuisine, no category noun.
   A business's own site is a different source and is used as such: the golf
   courses' address, phone, booking system and operator all come from
   `pelhamsplitrock.com`, and **no superlative is taken from it**. The same
   licence carries the mansion's address and phone from its own site. The
   museum's own superlative about itself is barred and cut.
2. **No research-process prose.** One page-level negative, used **once**: "This
   page names no Metro-North station for the park." The ferry sentence is not
   page-level and does not need to be — verdict 155 confirms as a fact about the
   world that no NYC Ferry route or landing serves the park or Orchard Beach, so
   it is stated flatly.
3. **Attribution only where a claim rests on characterization.** Bus routes,
   subway service patterns, designation dates and dimensions carry no preamble.
   Attribution appears exactly three times, each on a *characterization*: two
   Wikipedia superlatives (last surviving manor house; last remaining masonry
   carriage house) and the museum's own quoted phrase for the carriage house's
   1993 reopening. The golf facility's name and operator are attributed because
   rule 4's exception is what licenses them.
4. **The verdict decided the name** (Bartow-Pell Mansion Museum; Pelham Bay &
   Split Rock Golf Courses) **and the slugs follow it.**
5. **No minimum word count** was applied to any field except the 90-word intro
   floor.

---

## 5. Gate results

| Check | Result |
|---|---|
| `mix format --check-formatted` | clean |
| `mix test` | **650 tests, 0 failures, 32 excluded** |
| Trip-duration patterns (11) | 0 hits, allowlist untouched and empty |
| Vague-proximity patterns (9) | 0 hits, allowlist untouched and empty |
| `county` | `"Bronx"` on the guide and on all four places |
| Section headed exactly `Getting there` | present, covering subway, Metro-North, bus and ferry |
| `How do I get to …?` FAQ | present |
| town-page floors | 129-word intro, 2 links |
| Place slugs globally unique | pass |
| Marquee rule | `^orchard-beach` and `^bartow-pell-mansion` each appear in **exactly one** file in `priv/seed_data/` — this one. Verified by grep across `priv/seed_data/` and `lib/ethos/seeds/connecticut_places.ex` before writing |

Tolerated warnings only: `gettext.ex:23`, `data_guide_test.exs:16`,
`ct_guides_test.exs:21`.

### The census

| assertion | before | after | delta |
|---|---:|---:|---:|
| `length(emitted)` | 2129 | **2131** | +2 |
| `streetAddress` | 1588 | **1590** | +2 |
| `is_nil(streetAddress)` | 541 | **541** | 0 |
| `postalCode` | 1718 | **1720** | +2 |
| locality-only | 251 | **251** | 0 |

Four new places; two of them addressed, so the setup — which rejects `nil`
addresses — sees +2. Following the corrected pattern in that file:
`streetAddress` +2 **together with** `is_nil(streetAddress)` unmoved proves both
new rows carry a leading house number (895 and 870 Shore Road); `postalCode` +2
proves the ZIPs, both 10464, and nothing else here does; locality-only unmoved
proves neither new row went to the street-less side, and proves nothing about
the ZIPs, a row with a non-nil `streetAddress` being definitionally outside that
bucket. Comment in `test/ethos_web/components/structured_data_test.exs` updated
with each digit accounted for, and the stale "did not move when city-island
landed" paragraph extended rather than left contradicting the number below it.

---

## 6. Cut/kept accounting — every adjudicated claim

The mechanism that catches a confirmed fact dropped during compression. Item
numbers are the verdicts file's. **Every one of the 169 is in a row.**

### Block A — the park (1-75)

| # | Claim | Kept / Cut |
|---|---|---|
| 1 | 2,772 acres (1,122 ha) | **Kept** — title, intro, summary, entry |
| 2 | 13 miles (21 km) of shoreline | **Kept** — intro, summary, entry |
| 3 | >3× the 843-acre Central Park | **Kept** — intro, summary, entry |
| 4 | Largest public park in NYC | **Kept** — intro, summary |
| 5 | Acquired 1887, a park 1888 | **Kept** — intro, §2, place history |
| 6 | $2,746,688 | **Kept** — §2, place history |
| 7 | "$98,422,987 in 2025 dollars" | **Cut** — `uncertain`, unreproduced inflation template |
| 8 | Land from multiple estates over an excess of 1,700 acres | **Kept** — §2, place history |
| 9 | Ownership to NYC 1895 on annexation east of the Bronx River | **Kept** — §2, place history |
| 10 | Operated by NYC Parks | **Kept** — summary |
| 11 | Siwanoy first tribe on the Sound's northern shoreline, east to Connecticut | **Kept** — §2, place history |
| 12 | Name means "southern people" | **Cut** — refuted/contested against "salt people"; **no gloss ships** |
| 13 | Ceremonial and burial site, wampum belts | **Kept** — §2 |
| 14 | Territory by 1640, Hell Gate to Norwalk, inland to White Plains, "Wykagyl" | **Kept** — §2 |
| 15 | Poningo largest village 1640, near modern Rye | **Kept** — §2 |
| 16 | Stockade settlements at Ann Hook's Neck, Hunter Island, Davenport Neck | **Kept** — §2. The "spiritual center" gloss: **Cut**, `uncertain` |
| 17 | Five named sagamores | **Kept** — §2, all five with diacritics |
| 18 | Signed near the mansion site under the Treaty Oak | **Kept** — §2, place history |
| 19 | Purchase acreage 9,160 vs 50,000 | **Cut** — `uncertain`; the specific is removed, not hedged, and **no disclaimer sentence names the range** |
| 20 | Deed date June 27, 1654 | **Cut** — `uncertain`; the year 1654 alone ships |
| 21 | Pelham Manor after Charles II's 1666 charter | **Kept** — §2, place history |
| 22 | Pell died 1669, willed to nephew John | **Kept** — §2 |
| 23 | John Pell sold off City Island in 1685 | **Kept** — §2 |
| 24 | 1700 to Joseph, to Joseph's son John, to the Bartow family | **Kept** — §2. "Maternal descendants of the Pells": **Cut**, `uncertain` |
| 25 | Hunter Island 166 acres, 215 before the 1930s landfill | **Kept** — §1 |
| 26 | "Laaphawachking", place of stringing beads, general vicinity | **Kept** — §2, with the vicinity correction |
| 27 | Joshua Pell, a descendant of Thomas Pell, 1743 | **Kept** — §2 |
| 28 | Hunter purchased **after** the 1804 death, not in 1804 | **Kept as corrected** — §2 |
| 29 | Mansion built 1811; family moved 1813 | **Kept as corrected**, two events, **no conflict described** — §2 |
| 30 | English Georgian, highest point, 90 feet, three stories, veranda, terraced gardens | **Kept** — §2 |
| 31 | 400+ works; Rembrandt, Rubens, van Dyck **and** da Vinci | **Kept** — §2, the complete four-name list |
| 32 | Hunter to his death 1852; descendants to 1865 | **Kept as corrected** — §2 |
| 33 | NYC acquired 1889 for $324,000 | **Kept** — §2, including the price the finder omitted |
| 34 | Half a million seasonal visitors by 1917 | **Kept** — §2 |
| 35 | Mansion demolished 1937 during Moses's construction | **Kept** — §2, Orchard Beach history |
| 36 | LeRoy's Bay lagoon filled to connect Hunter Island to the mainland | **Kept** — §2 |
| 37 | Hunter Island Marine Zoology and Geology Sanctuary, 1967 | **Kept** — §1 |
| 38 | Kazimiroff Nature Trail, **June** 1986, named for Theodore Kazimiroff | **Kept** — §1 |
| 39 | Twin Islands, landfill of 1937, to Orchard Beach and nearby Rodman's Neck | **Kept** — §1, verbatim |
| 40 | Twin Islands Salt Marsh Restoration Project, 1995, $850,000 | **Kept** — §1 |
| 41 | Two Trees Island, mudflat, rocky plateau, environmental center | **Kept** — §1, verbatim |
| 42 | Marine sanctuary's extent; largest continuous oak forest in the park | **Kept** — §1, both clauses |
| 43 | Thomas Pell Sanctuary = the westerly part of the park | **Kept** — §1 |
| 44 | Goose Creek Marsh, once part of a 5,000-acre wetland over Co-op City | **Kept** — §1 |
| 45 | Wetlands, Goose Island, Split Rock, oak–hickory bordering Split Rock GC | **Kept** — §1 and golf history |
| 46 | Both sanctuaries total 489 acres (1.98 km²) | **Kept** — intro, §1, summary |
| 47 | Both created 1967 against a planned landfill | **Kept** — intro, §1 |
| 48 | Forest at least three centuries old, colonial | **Kept** — §1 |
| 49 | Raccoon, egrets, hawks, coyotes | **Kept** — §1 |
| 50 | LeRoy's Bay name; filled in the mid-1930s reconstruction | **Kept** — §1 |
| 51 | 1964 Olympic rowing trials; four-lane 2,000-metre course; $630,000 | **Kept** — §1, including the cost the finder omitted |
| 52 | 195 acres (79 ha) of salt marsh | **Kept** — §1 |
| 53 | Rodman's Neck juts into Long Island Sound | **Kept** — §2 |
| 54 | Anne's Hoeck / Ann Hook's Neck; renamed for Samuel Rodman | **Kept** — §2 |
| 55 | Included in the 1654 purchase | **Kept** — §2, link note |
| 56 | Rodman's ferry, Minneford Island to Anne's Hoeck where the bridge is now | **Kept** — §2, link note |
| 57 | Southern third a 54-acre NYPD firing range | **Kept** — §2 |
| 58 | Built 1959, operation transferred to the NYPD | **Kept** — §2 |
| 59 | FBI, Fire Marshals, Correction, ICE — **and the National Guard, 1960s riot training** | **Kept** — §2, including the agency the finder omitted |
| 60 | Seven rifle ranges, 230 firing points | **Kept** — §2 |
| 61 | Northern side joined to form Orchard Beach and a parking lot | **Kept** — §2 |
| 62 | Battle fought Friday, October 18, 1776, Manor of Pelham | **Kept** — §2 |
| 63 | Clinton led the landing; Howe was C-in-C | **Kept as corrected**, **not framed as a conflict** — §2 |
| 64 | 750 Americans under Colonel John Glover | **Kept** — §2 |
| 65 | Stone walls, prepared positions, Washington's withdrawal to White Plains | **Kept** — §2 |
| 66 | 8 killed, 13 wounded | **Kept** — §2 |
| 67 | British 3 killed, 20 wounded, excluding Hessians | **Kept** — §2 |
| 68 | Hessian estimates disputed, 200 to 1,000 | **Kept** — §2 |
| 69 | Glover's Rock, granite erratic, plaque text | **Kept** — §2, quoted **as an inscription**, its 600 and its Howe left inside the quotation marks |
| 70 | "Contrary to popular belief, the rock had nothing to do with the battle" | **Kept** — §2, verbatim |
| 71 | The Glover claim is erroneous; inaccurate map, Glover's own estimates | **Kept** — §2, with the fuller text |
| 72 | Split Rock dimensions, 25 ft × 15 ft | **Kept** — §2 |
| 73 | Tablet approved 1904, installed 1911, stolen 1914 | **Kept** — §2 |
| 74 | Tablet inscription | **Kept** — §2, **as inscription text only** |
| 75 | Borders the golf course; within the Thomas Pell Sanctuary | **Kept** — §2 and golf history |

### Block B — Orchard Beach (76-99)

| # | Claim | Kept / Cut |
|---|---|---|
| 76 | 115 acres, 1.1 miles, part of the park, western end of the Sound | **Kept** — intro, §1, summary, FAQ 2 |
| 77 | The only public beach in the borough of the Bronx | **Kept** — intro, §1, summary, FAQ 2, entry. The strongest line available, third-party sourced |
| 78 | In the park's eastern section, along Pelham Bay on the eastern shore | **Kept** — intro, §1, summary |
| 79 | "Adjacent to City Island" | **Cut** — refuted. "Nearby" is the supportable wording and this page does not use the strand at all |
| 80 | Moses announced February 28, 1934, inspired by Jones Beach | **Kept** — §1, history, FAQ 2, link note |
| 81 | Filled approximately 110 acres of LeRoy's and Pelham Bays | **Kept** — §1, history, FAQ 2 |
| 82 | Connected Hunter Island and the Twin Islands to Rodman's Neck | **Kept** — §1, history |
| 83 | Sand from Sandy Hook, New Jersey and the Rockaway Peninsula | **Kept** — §1, history, FAQ 2 |
| 84 | Public opposition to sanitation waste as fill | **Cut** — `uncertain`, not reproduced in three re-fetches |
| 85 | Deteriorated Hunter mansion demolished during construction | **Kept** — §2, history |
| 86 | Dedicated, incomplete, July 1936 | **Kept** — §1, history, FAQ 2 |
| 87 | Officially opened June 25, 1937 | **Kept** — §1, history, FAQ 2 |
| 88 | Fully completed 1938 | **Kept** — §1, history, FAQ 2 |
| 89 | Embury, with Clarke and Rapuano | **Kept** — §1, history, FAQ 2 |
| 90 | Bathhouse: raised plaza flanked by two pavilions, north and south | **Kept** — §1, history |
| 91 | Blue and white tiles | **Kept as narrowed** — an **interior** finish, plus the 6-foot blue cladding. Not written as the exterior |
| 92 | 50-foot-wide hexagonal gray-tile promenade, full length | **Kept** — §1, history |
| 93 | The opening inventory | **Kept** — §1, history, in full |
| 94 | Today's inventory, plus the lead's playgrounds, picnic areas, parking and 26 courts | **Kept** — §1, summary |
| 95 | 1980s renovation: shops and fast food; nature center and museum **planned** | **Kept** — §1, history, with "planned" intact and no implication either exists |
| 96 | Bathhouse and promenade landmarked **June 20, 2006** | **Kept** — §1, history, FAQ 2, entry — the designation list's date, not the article's bare "2006" |
| 97 | Bx12 seasonal, Bx29 year-round nearby, 6 and `<6>` | **Kept** — §3 |
| 98 | No named concession, vendor or eatery in the material | Honoured — none invented, none proposed as a place |
| 99 | Bathhouse/promenade fold upheld | Honoured — no separate place record |

### Block C — Bartow-Pell Mansion Museum (100-126)

| # | Claim | Kept / Cut |
|---|---|---|
| 100 | Institution is "Bartow-Pell Mansion Museum"; 1959 added "Pell" to "Bartow Mansion Museum and Gardens" | **Kept as corrected** — name, slug, and the 1959 entry written as a partial change, not a wholesale rename |
| 101 | Address 895 Shore Road … 10464 | **Kept**, park line trimmed — see §1 above |
| 102 | Phone (718) 885-1461 | **Kept** — summary |
| 103 | Bartow acquired 30 acres 1836; constructed 1836-1842 | **Kept** — intro, §1, summary, FAQ 3. The museum's "moved in with his wife and children in 1842": **Cut**, a compression the verdict flags and nothing rests on |
| 104 | Greek Revival facade, federal interiors | **Kept** — intro, §1, summary, FAQ 3 |
| 105 | Maria Lorillard Bartow | **Cut** — `uncertain`; the clause ships without the name |
| 106 | Third residence; Pell houses circa 1675 and around 1790 | **Kept** — §1, summary, FAQ 3, **Wikipedia's version only, not merged with the museum's** |
| 107 | Alternately owned through 1888, NYC acquisition | **Kept** — history, FAQ 3 |
| 108 | International Garden Club leased from 1914 | **Kept** — history, FAQ 3 |
| 109 | Mrs. Charles Frederick Hoffman, 1914-1921 | **Cut** — `uncertain` |
| 110 | Delano & Aldrich restoration dates | **Neither range ships.** "restored by Delano & Aldrich in the 1910s" |
| 111 | Garden by Delano & Aldrich, completed 1916 | **Kept** — history; separately confirmed and unaffected by 110 |
| 112 | Reopened **May 1946**, interiors under Joseph Downs | **Kept as corrected** — history, FAQ 3. **No 1945 anywhere on the page** |
| 113 | NHL **December 8, 1976** | **Kept as corrected** — history, FAQ 3, entry. The roll's date, not the museum's 1977 |
| 114 | NRHP "Bartow-Pell Mansion and Carriage House", "Pelham Bay Park, Shore Rd.", December 30, 1974, ref. 74001220 | **Kept** — history, in full; FAQ 3 carries the date |
| 115 | NYC Landmark exterior February 15, 1966 | **Kept** — history, FAQ 3 |
| 116 | Interior May 27, 1975 | **Kept** — history |
| 117 | Carriage house by 1842; three storeys, masonry; stable hand's home, vehicular storage, hayloft | **Kept** — history |
| 118 | "Last remaining masonry carriage house … original design"; "last remaining outbuilding" | **Kept, attributed to Wikipedia** — §1 and history. The reattribution is what rescues it from rule 4 |
| 119 | Restored 1987-1993; reopened 1993 "as a working stable" | **Kept** — history, the range Wikipedia's and the phrase the museum's, each credited where it belongs |
| 120 | Carriage house fold upheld | Honoured — no separate place record |
| 121 | Bartow-Pell Conservancy / Bartow Pell Landmark Fund / NYC Parks owns / 2008 renaming | **Kept** — history, all four |
| 122 | "Only remaining grand country estate in Pelham Bay Park" | **Cut** — the museum's own superlative about itself, barred by rule 4. Wikipedia's "last surviving manor house in the Pelham Bay Park area" ships instead |
| 123 | "Family life in the 19th century" | **Cut** — `uncertain` |
| 124 | Garden wall height, sunken fountain, plantings | **Cut** — `uncertain`; only 111 ships |
| 125 | No stated hours or admission | Honoured — **no hours or price invented** |
| 126 | Open status `uncertain` | Honoured — the place ships with the schema default `status: "open"`, which renders nothing, and **no sentence claims it is trading** |

### Block D — the golf courses (127-138)

| # | Claim | Kept / Cut |
|---|---|---|
| 127 | `pelhamsplitrock.com` resolves | Structural — it is the `official_url` |
| 128 | Name "Pelham Bay & Split Rock Golf Courses" | **Kept** — name, summary, attributed to its own site |
| 129 | 870 Shore Road, Bronx, NY 10464 | **Kept** — address, summary, §1, entry |
| 130 | Phone (718) 885-1258 | **Kept** — summary |
| 131 | Independent tee-time booking and rate card | **Kept** — summary names the single booking system; no rate, fee or price ships |
| 132 | Operated by American Golf Corporation | **Kept** — summary, attributed to its own site and **no prose built on it beyond naming the operator** |
| 133 | Two courses, Pelham Bay and Split Rock | **Kept** — summary, §1 |
| 134 | van Kleek designed **Split Rock only** | **Kept** — §1, history, both stating the source names no designer for Pelham Bay |
| 135 | Reopened June 1935, sixteen months after construction commenced | **Kept** — §1, history, verbatim |
| 136 | Created through the efforts of park commissioner Robert Moses | **Kept** — §1, history, link note |
| 137 | Which section of the park they are in | **Cut** — `uncertain`; the article contradicts itself. The address ships instead |
| 138 | `golfnyc.com` lists nine courses and omits these two | **Cut** — directory metadata about an aggregator, no visitor-facing content; the fold ruling it supports is honoured structurally |

### Block E — Getting there (139-156)

| # | Claim | Kept / Cut |
|---|---|---|
| 139 | Northern terminal of the IRT Pelham Line | **Kept** — §3, FAQ 1 |
| 140 | 6 at all times **except** weekday peak-direction hours, when the `<6>` serves it | **Kept in the source's wording**, not the finder's looser phrasing — §3, FAQ 1 |
| 141 | Line completed to the station December 20, 1920 | **Kept** — §3 |
| 142 | Pedestrian bridge crosses the Bruckner Expressway into the park | **Kept** — §3, FAQ 1, with "not onward to City Island" |
| 143 | The only NYC Subway terminal without numerical track labels; East/West | **Kept** — §3, in the stronger form the verifier found |
| 144 | Elevators December 1989 | **Kept** — §3 |
| 145 | Bx29 terminals; runs 24 hours | **Kept** — §3, FAQ 1 |
| 146 | Bx5, Bx12, Bx12 SBS, Bx24, Bx29 | **Kept — the confirmed five only.** Bx23, Q50, BxM8 and Bee-Line 45: **Cut**, `uncertain` |
| 147 | Bx5/Bx29 URLs return the combined Bronx bus-routes list | Honoured — no dedicated-article claim made |
| 148 | Bx5 termini | **Kept in the neighbourhood form** — "between Pelham Bay and Co-op City". The street-address form: **Cut**, `uncertain` |
| 149 | Bx5 seasonal Orchard Beach service: February 1984, weekends September 1990, eliminated September 1995, discontinued again Summer 2016 | **Kept** — §3, in the fuller form the verifier found |
| 150 | Bx12 Inwood-to-Bay Plaza standing route | **Cut** — `uncertain`; only the confirmed seasonal extension ships |
| 151 | Summer Bx12 locals extended to Orchard Beach, full route at weekends | **Kept** — §3, FAQ 1 |
| 152 | Bx12 SBS began June 29, 2008, NYC's first bus rapid transit service | **Kept** — §3, both clauses |
| 153 | SBS terminates at Bay Plaza, does not serve Orchard Beach | **Kept** — §3, FAQ 1 |
| 154 | No Metro-North station named in any source fetched | **Kept as a page-level statement**, once: "This page names no Metro-North station for the park" |
| 155 | No NYC Ferry route or landing serves the park or the beach | **Kept as a fact about the world** — independently confirmed, so stated flatly, with the residents' advocacy |
| 156 | Transit as prose, not place records | Honoured — no station, landing or route is a place |

### Block F — City Island and the boundary rulings (157-167)

| # | Claim | Kept / Cut |
|---|---|---|
| 157 | The bridge is a City Island asset; the berms are the island's only connecting road | **Kept as a reference** — §2. **No bridge place record on this page** |
| 158 | City Island is south of Pelham Bay Park | **Kept** — §2 |
| 159 | The bridge's mainland end is on Rodman's Neck, whose wooded portion is in the park | **Kept** — §2, via 53, 56 and 157 together |
| 160 | Rodman's Neck in the same 1654 purchase as City Island | **Kept** — §2 and the link note. The tie's backbone |
| 161 | Rodman's ferry on the site of the modern crossing | **Kept** — §2 and the link note. The tie's second strand |
| 162 | Orchard Beach adjacency to City Island | **Cut** — refuted as worded, and **not used as the tie's backbone or at all** |
| 163 | Bx29 serves both | **Kept** — §3, FAQ 1 |
| 164 | Pelham Bay Park station as City Island's "only" subway gateway | **Cut** — the "only" is an inference from absence. City Island's own shipped file carries the narrowed form; this page's tie rests on 160, 161, 163 and 165 |
| 165 | Pelham Park & City Island Railway, 1887-1919, 3.2 miles, narrow gauge, Bartow station to Brown's Hotel | **Kept** — §2, the tie's fourth strand |
| 166 | Monk parakeets on City Island and in nearby Pelham Bay Park; wild turkeys | **Cut** — City Island's own material, confirmed only "in substance", and the park's confirmed wildlife line (49) is what ships |
| 167 | Dedup against the four shipped Bronx files | Honoured — re-verified by grep; no address or institution collides |

### Block G — folds, DOHMH, the tier, the second link

| # | Claim | Kept / Cut |
|---|---|---|
| Fold 1-2 | Golf courses promoted and **merged into one record** | Honoured |
| Fold 3 | Bronx Victory Memorial — no place at all; only the bare name survives | Honoured — **one clause in §1**, "Other landmarks in the park include the Bronx Victory Column & Memorial Grove", and nothing more |
| Fold 4 | Glover's Rock — fold upheld; the plaque is quotable park content | Honoured — §2 prose, no place record |
| Fold 5 | Split Rock — fold upheld | Honoured — §2 prose, no place record |
| Fold 6 | Hunter Island — fold upheld | Honoured — §1 and §2 prose, no place record |
| Fold 7 | Twin Island / Two Trees Island — fold upheld | Honoured — §1 prose, no place record |
| Fold 8 | Rodman's Neck — fold upheld, restricted NYPD range | Honoured — §2 prose, no place record |
| 168 | Zero DOHMH-only candidates; zero named eatery anywhere | Honoured — **no DOHMH or DCWP record appears in prose in any form** |
| — | 4 surviving places → `town-page`, 90-word intro, two links | Honoured |
| 169 | Coney Island link, Moses at both, dated on both sides | **Kept** — link note; `kind` set to `see-also` per rule 11's cross-borough clause, see §2 above |

**Totals reconciled.** 169 adjudicated: 138 confirmed, 12 refuted, 19 uncertain.
All 19 uncertains are excluded (7, 16-gloss, 19, 20, 24-gloss, 31-incomplete, 84,
105, 109, 123, 124, 126, 137, 146-in-part, 148, 150, 164-in-part, and the two
source-shape flags at 147). The three uncertain **history** facts that could have
been kept by removing the unverified specific were: 19 (kept, acreage removed),
20 (kept, date reduced to the year), 148 (kept, termini reduced to neighbourhood
names). None is hedged and none carries a disclaimer sentence. Confirmed claims
deliberately cut, with reasons, are exactly seven: 79, 103-partial, 122, 138,
162, 164 and 166.

---

## 7. Not done / not attempted

- **No push, no deploy.** One local commit on `destination-pages`.
- **No `git stash`, in any form.**
- **No photos.** No photo artifact exists for this page and the four shipped
  Bronx files carry none; `"photos": []` on the guide and on all four places.
  No manifest entry was added, so `mix ethos.optimize_bronx_photos` was not run.
- **No allowlist entries** added to either the trip-duration or the
  vague-proximity allowlist; both remain empty.
- **No gate weakened.** Neither pattern list, specimen list nor assertion in
  `bronx_seed_data_test.exs` was touched. The two edits outside the seed file
  are the census figures and their comment in `structured_data_test.exs`.
- **Research gaps for a later pass**, recorded so the flat phrasing reads as
  deliberate: no street address, boundary list or cross-street pair exists in the
  research for Pelham Bay Park or Orchard Beach, so both ship `"address": null`;
  no Metro-North station is named for the park by any source fetched, so the
  section says so at page level rather than claiming none exists; the museum's
  hours and admission are unknown and none is invented.
