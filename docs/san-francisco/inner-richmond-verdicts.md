# Inner Richmond — verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/inner-richmond-finder.md`.
I re-fetched eleven sources, not the five required, and every designation
identifier the finder claimed. Rulings below are binding on the author.

**Counts: 44 PUBLISH · 19 REWRITE · 18 DROP · 6 ESCALATED.** (87 candidates, all ruled.)
**Tier: GUIDE, on 62 surviving places.**
**Designation identifiers: 6 claimed, 6 survived re-fetching. 3 of them are usable in this zone.**

---

## 1. WHAT I RE-FETCHED, AND WHAT IT SAID

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks | **5/5 numbers confirmed** — names, addresses, years and APNs exact |
| NPS `nrhp_locations` layer 0 | **95001555 confirmed** — Listed, CertDate `01/22/96` |
| NPS layer 0, zone-wide sweep | **Only St. John's.** No Emanu-El, no Columbarium, nothing on Clement, Funston or Arguello. The finder's negative finding holds |
| `3mea-di5p` EAS, 34 probe addresses | Every zone assignment confirmed — **and three "no row" claims refuted** |
| `gtr9-ntp6` Rec & Park | 4 properties, acreages and the two multi-zone strings exact |
| `r7bn-7v9c` Civic Art | 8 rows confirmed by title, artist, accession, year, address — **but the dataset has no `medium`, `dimensions`, `credit` or `facility` field** |
| `m22e-6hkz` survey districts | objectids 34, 97, 98 confirmed, all `cr: Eligible / nr: No / a10: No / a11: No` |
| `g8m3-pdis` business register | Full Clement audit, ~400 live rows. Every finder address matched; three name/count errors found |
| `burmasuperstar.com` | hours and phone verbatim exact |
| `theploughandstars.com` | hours, phone, seisiún and jam schedule exact; the award is still on the page |
| `schubertsbakery.com` | hours exact; **the phone number in the finder is wrong** |
| `cinderellabakery.com` | "Open Daily 7am-7pm" exact; two phone numbers the finder did not record |
| `sfpl.org/locations/richmond` | all seven days of hours and the phone exact |
| `dignitymemorial.com` (Columbarium) | rotunda copy confirmed; **stained-glass claim overstated by the finder** |
| `greenapplebooks.com` | three locations and the Sell-Us hours confirmed |
| `presidio.gov/places/mountain-lake` | "Southern Wilds Region" confirmed; restoration credited to the **Partnership for the Presidio** |
| `en.wikipedia.org/wiki/Internet_Archive` | 2009, 300 Funston, "a former Christian Science Church", Presidio 1996–2009 — all confirmed |
| `en.wikipedia.org/wiki/Congregation_Emanu-El_(San_Francisco)` | dedication sentence carries citation [6]; **year, architect and dome height are uncited infobox values** |
| `emanuelsf.org/about/our-building/` | 403 again. The finder is right that it will not answer |

### Every identifier, re-verified

| Property | Identifier | Verified value |
|---|---|---|
| St. John's Presbyterian Church | SF Landmark **83** | 25 Lake Street, designated **1976**, APN 1361001 |
| St. John's Presbyterian Church | NRHP **95001555** | "Saint John's Presbyterian Church", 25 Lake St. and 201 Arguello Blvd., **Listed, 01/22/96** |
| Campfire Girls Building | SF Landmark **169** | 325 Arguello Boulevard, designated **1984**, APN 1432003 |
| Richmond Branch Carnegie Library | SF Landmark **247** | **351-359 9th Avenue**, designated **2005**, APN 1441007 |
| San Francisco Memorial Columbarium (Odd Fellows Columbarium) | SF Landmark **209** | 1 Loraine Court, designated **1996**, APN 1084002 |
| Theodore Roosevelt Middle School | SF Landmark **285** | 460 Arguello Boulevard, designated **2019**, APN 1061049 |

All six survive. Two of them (209, 285) sit outside the zone by EAS and are escalated
or dropped, so **three identifiers are available to this page: 83, 169 and 247, plus
NRHP 95001555.**

One dataset inconsistency worth recording and not writing about: LM 209's `apn` field
reads `1084002` while its own PIM link points at `1132/001`. Use neither in prose.

**Do not tally these.** Name the buildings, cite the numbers, never say how many there are.

---

## 2. WHAT THE FINDER GOT WRONG

**2.1 It misquoted its own brief.** The roster's draw for `inner-richmond` reads:
*"Clement Street, the Columbarium, Temple Emanu-El, Presidio Heights edge, the Green
Apple Books block."* The finder's opening line adds "the Internet Archive building on
Funston" and "the Russian and Chinese institutions along Geary" — neither is in the
roster. §7 then spends a paragraph demolishing a premise nobody made. The Internet
Archive survives on its merits; the Geary paragraph is noise.

**2.2 "The eleven zones" is wrong — there are twenty-three.** The roster carries twenty
neighborhoods plus the Presidio, Golden Gate Park and Ocean Beach. The finder repeats
"eleven" four times. Its *conclusion* survives intact: Lone Mountain/USF and Presidio
Heights are not among the twenty-three, so S2, S3 and S4 really are orphaned. But the
count is wrong and an author reading §3 would be misled about how many zones exist.

**2.3 It attributed fields to `r7bn-7v9c` that the dataset does not have.** The Civic Art
Collection resource carries exactly these fields: `creation_date`, `accession_number`,
`artist`, `display_title`, `current_location`, `location_description`,
`street_address_or_intersection`, `zip_code`, `latitude`, `longitude`,
`number_of_districts`, `supervisor_district`, `analysis_neighborhood`, `the_geom`, plus
timestamps. There is **no `medium`, no `dimensions`, no credit line and no `facility`.**

So every one of these is unsourced against the citation given and does not publish:

- "Painted steel on concrete, 84 × 52 × 36 inches" (Red Gothic)
- "gift of the Syril Lerner Foundation"
- "Epoxy bronze, porcelain enamel, concrete and steel; 36 × 50 × 50 inches" (Touching Earth)
- "commissioned by the San Francisco Arts Commission for the Richmond Branch library"
- "Bronze on cast concrete", "115 × 72 × 48 in.", "116 × 87 × 64 in.", "Gift of Suzanna Brown"
- "marble, granite and bronze, 72 × 72 in."; "sandblasted granite, 48 × 48 in."; "glass, five panels (two door, three transom)"
- "All three commissioned by the San Francisco Art Commission for the Richmond Police Station"

They may all be true and they may all be on `sfartscommission.org`. They are not in the
dataset the finder cited, and a verifier who re-fetched found nothing behind them. Either
reach the Arts Commission's own object pages or write title, artist, year, accession and
address and stop.

**The same defect breaks straddler S6.** The finder's case is *"`facility` = Golden Gate
Park"* and *"the Arts Commission and Rec & Park disagree about which side of Fulton
Street the piece stands on."* There is no `facility` field, so no such disagreement was
observed. What the dataset actually says is `location_description`: **"8th Avenue Entrance
At Fulton St. Northeast Corner"** (Bear) and **"Northwest Corner"** (Lion). The straddle is
real — a park entrance is a park entrance — but it must be argued from the corner strings,
not from a field that does not exist.

**2.4 Schubert's Bakery's phone number is wrong.** The finder gives **415-752-5180**.
The bakery's contact page gives **415-752-1580**. A transposition. This is exactly the
class of error Wave 1 caught in an NRHP certification date: it looks citable and it is
not. Publish 415-752-1580.

**2.5 Three EAS "no row" findings are false.** All three addresses return rows, and all
three return Inner Richmond:

| Address the finder said returned nothing | What EAS actually returns |
|---|---|
| `600 05TH AVE` (Katia's Russian Tea Room) | **Inner Richmond** |
| `251 06TH AVE` (George Peabody Elementary) | **Inner Richmond** |
| `651 06TH AVE` (Frank McCoppin Elementary) | **Inner Richmond** |

The finder documented the zero-padding quirk in §1(a) and then appears to have tripped
over it anyway. None of the three changes a ruling — the businesses and institutions
behind them are still unsourced — but §6.7 and §6.8 state a false negative about a live
dataset and the record has to be corrected.

**2.6 The Columbarium's stained glass is overstated.** The finder writes *"six ground-floor
rooms with stained glass, some attributed to Louis Comfort Tiffany and John La Farge."*
The operator's page says: *"Six of the ground-floor rooms have stained-glass windows, one
of which has been attributed to both Louis Comfort Tiffany and John La Farge."* One
window, not "some"; a single disputed attribution, not two artists dividing the work.

**2.7 The Arguello odd/even rule is overgeneralised.** §2 states *"Even-numbered
(east-side) addresses are Presidio Heights"* as a rule for the whole street. It holds in
the northern stretch — 200, 350 and 460 all return Presidio Heights, confirmed — and
fails south of California: **600 ARGUELLO BLVD and 798 ARGUELLO BLVD both return Lone
Mountain/USF.** The finder's own §6.5 item 20 and §6.9 item 87 contradict its §2 rule and
nobody reconciled them.

**2.8 Green Apple's "annex at 520 Clement Street" has no source.** The register carries no
Green Apple registration at 520. What is registered there is *La Clement LLC* and
*Trending Houseware Inc*. 520 Clement is a real EAS address and it is not established as
Green Apple's.

**2.9 642 Clement carries four registrations, not three** — *Locals Cafe*, *Richmond
Republic*, *Richmond Burritos* and a row named literally *"Clement Street"*.

**2.10 Two smaller misreadings.** `presidio.gov` credits the lake restoration to the
**Partnership for the Presidio** working "with scientists and volunteers", not to the
Presidio Trust's "own restoration". And the Plough and Stars page as re-fetched carries no
"live performances from 9pm"; it gives Seisiún, Old Time Jam ("**Odd** Tuesdays", not
"selected"), Set Dancing and Board Game Night, with times.

**2.11 What the finder got right and should be credited for.** `.superpowers/taken_slugs.py`
really does glob `priv/seed_data/rome/*.json` only and is blind to twelve shipped San
Francisco files — I confirmed it by reading the source. `vf_taken_all.py` is the correct
tool and reports 4,389 places across 349 files. I re-ran it against eighteen needles:
**zero collisions.** The `richmond` hits are all Richmond Hill, Queens; `presidio` hits
only `presidio-library-mini-park-pacific-heights`; `emanu` and `clement` are all Rome.
The Arsicault warning is also correct and binding — `arsicault-bakery-mission-rock` is an
Oracle Park **code seed**, which `vf_taken_all.py` cannot see because it globs seed JSON
only.

The finder's negative finding on Temple Emanu-El is correct and I confirmed it twice: no
Article 10 row, and a zone-wide NRHP sweep returning exactly one San Francisco feature
for Lake/Arguello/Clement/Funston — St. John's. **Write no protection sentence about
Temple Emanu-El.**

The §5 survey-district trap is correct in every particular and I confirmed all three
objectids. `Eligible / No / No / No` is not a designation and there is no identifier to
cite. Two facts the finder buried and the author may use, because they are architectural
history rather than protection claims: the Inner Richmond Nelson district records
**Fernando Nelson** as builder, 1910–1914; Richmond Heights records **Joseph Leonard and
the Urban Realty Improvement Company**, 1910–1911. Neither sentence may use the word
"district" as a designation.

---

## 3. PUBLISH — 44

### 3.1 Designated, in zone under both readings — 2

**St. John's Presbyterian Church** — 25 Lake Street / 201 Arguello Boulevard. Kind
`historic-site`. Designation sentence, verbatim:

> San Francisco Landmark No. 83, designated in 1976, and listed on the National Register of Historic Places in 1996 under reference number 95001555.

Publishable supporting facts: built 1905; architects George Dodge and J. Walter Dolliver;
the National Register record gives the address as "25 Lake St. and 201 Arguello Blvd." and
the building occupies the corner. EAS returns Inner Richmond at 37.786787, -122.459671.
The day-level date (8 April 1976, City Planning Commission Resolution 7473) comes from
noehill; publish the year alone unless the author reaches the resolution itself.

**Campfire Girls Building** — 325 Arguello Boulevard. Kind `historic-site`.

> San Francisco Landmark No. 169, designated in 1984 under Article 10 of the Planning Code.

Built 1929; architect Henry Gutterson; APN 1432003; EAS 37.784590, -122.459491. noehill's
interior description — redwood trim, panelling and beams in trussed cathedral vaults in
the central meeting hall — publishes as description. **Write it from the street.** No
current occupant, no hours and no public access is established, so the page must not
imply a traveller can go in. It must also not say that nothing was found.

### 3.2 Undesignated anchors — 3

**Internet Archive** — 300 Funston Avenue, 94118. Kind `attraction`. EAS confirms Inner
Richmond, 37.782303, -122.471748, APN 1444041. Publishable: the headquarters have been
at 300 Funston Avenue since 2009; the building was formerly a Christian Science church;
from 1996 to 2009 the Archive was in the Presidio. **No build year. No architect. No
former parish name. No tour or visiting hours.** "Fourth Church of Christ, Scientist,
1923" is not sourced and naming it would be invention. If the page says nothing about
visiting, it says nothing about visiting — it does not explain the absence.

**San Francisco Police Department, Richmond Station** — 461 6th Avenue. Kind
`historic-site`. EAS confirms Inner Richmond, 37.780031, -122.464405. Three Arts
Commission works are catalogued to this address and publish as **title, artist, year and
accession only**:

- *Untitled #1*, Jaap (Jacob) Bongers, 1991, accession 1991.2.1 — recorded on the lobby floor, under the skylight.
- *Untitled #2*, Bongers, 1991, accession 1991.2.2 — recorded on the lobby floor, inside the entrance.
- *Good Luck Piece*, Shelley Jurs, 1991, accession 1991.4 — recorded at the front doors.

The dataset marks all three `current_location: City Agency`, not `Public Display`; only
*Good Luck Piece* is at the doors. Say where each one is; do not promise a traveller can
see them. Build year and architect of the station are unsourced and stay out.

**Arsicault Bakery** — 397 Arguello Boulevard. Kind `cafe`. EAS confirms Inner Richmond,
37.783389, -122.459225, APN 1432017. **Name, address and kind only** — no hours, no
founding year, no award. **Slug and summary must not be confusable with
`arsicault-bakery-mission-rock`, which the Oracle Park code seed already owns.** Suggested
slug: `arsicault-bakery-inner-richmond`. The summary must name Arguello Boulevard.

### 3.3 Clement Street shopfronts — 39

All thirty-nine publish **as name, address and kind only.** I audited the full
`g8m3-pdis` Clement run for zip 94118 with `location_end_date IS NULL` — roughly four
hundred live rows — and every address the finder gave matched the register exactly. That
is enough for existence and for an address. It is enough for nothing else.

Binding constraints on all thirty-nine:

1. **No `location_start_date` may appear as prose.** It is a tax registration date. Green
   Apple, See's Candies, Busvan and four building-owner rows all carry `1968-10-01`,
   which is the dataset's floor value, not a founding year. Schubert's carries
   `2025-09-04` at 521 Clement — that is a move, not an opening.
2. **No cuisine adjective, no atmosphere, no "beloved", no "long-running".** The register
   establishes a name and a door.
3. **No hours** except for the four operators whose own pages were re-fetched (§3.4).
4. Where a business holds two registrations at two numbers, write both numbers as the
   register does and say nothing about which is which.

Toy Boat by Jane (401) · Blue Danube Coffee House (306) · Wing Lee Bakery (503) · Good
Luck Dim Sum (736) · Kamei Restaurant Supply and Kamei Household Wares (525 and 547) ·
Cheung Hing Chinese Deli (323) · Giorgio's Pizzeria (151) · Chapeau! (126) · Foggy Notion
(124) · Woot Bear (147) · Standard Plumbing Ace Hardware (144 and 152) · Wako Japanese
Restaurant (211) · Kitchen Istanbul (349) · Pasta Supply Co. (236) · Genki Crepes & Mini
Mart (330) · High Treason (443) · Mamahuhu (517) · Lost Marbles Brewpub (823) · Clement
Seafood Center (831) · Wing Hing Seafood Market (633) · Red A Bakery / Red A Dim Sum
(634) · Cherry Blossom Bakery (844) · Tai Hing Book Store (848) · See's Candies (754) ·
Heroes Club (840) · Cable Car Wine and Spirits (841) · Keeva Indian Kitchen (908) · All
Stars Donuts (901) · Nakorn Thai (639) · Xiao Long Bao Restaurant (625) · Sakesan (626) ·
Taishan Taste Hot Pot (354) · Mais Vietnamese Restaurant (316) · Café Bunn Mi (417) ·
King's Thai Cuisine (346) · Lime Tree (836) · Tenglong Chinese Restaurant (208) · 7th and
Clement Market (538) · Clement Dung Market (645) · Yong Fong Co. (612).

That is forty names; **Richmond New May Wah Supermarket is ruled REWRITE at 4.14** and is
counted there, leaving thirty-nine here.

---

## 4. REWRITE — 19

### 4.1 Richmond / Senator Milton Marks Branch Library — 351 9th Avenue

Kind `attraction`. Designation sentence, verbatim:

> San Francisco Landmark No. 247, designated in 2005 under Article 10 of the Planning Code.

The register gives the address as **351-359 9th Avenue**; the library's own page gives
351 9th Avenue. Use 351 9th Avenue as the place address.

**The Carnegie ordinal does not publish.** SFPL's "the first library building in San
Francisco constructed with Andrew Carnegie grant funds" matches the superlative regex
directly — `first` + two words + `in` + `San Francisco`. noehill's "the first of seven
Carnegie branch libraries built in San Francisco" evades the regex on word count and is
the same ranking claim. Both are cut. So is "the fourth branch established within the
San Francisco Public Library system" — it is closer to a sequence than a ranking, but the
comparison class is a system that gains branches, and the safe form costs nothing.

Replacement wording:

> Bliss & Faville designed the branch in the Classical Revival style and it opened in 1914, built with a grant from Andrew Carnegie. A Richmond branch had operated since 1892 at 809 Point Lobos Avenue. The renovation was completed on 16 May 2009.

Hours publish as re-fetched and confirmed verbatim: Sunday 1–5, Monday 10–6, Tuesday
10–8, Wednesday 10–8, Thursday 10–8, Friday 1–6, Saturday 10–6. Phone 415-355-5600.

### 4.2 Temple Emanu-El — 2 Lake Street

Kind `historic-site`. The zone assignment is the strongest in the file: EAS returns Inner
Richmond at 37.787030, -122.459776 on parcel 1355011, and the finder's independent
point-in-polygon agrees. **It stays in the zone.**

The building facts do not survive as written. Wikipedia's infobox carries the completion
year, the architect, the dome height and the style with **no citation attached to any of
them**; only the dedication sentence carries a reference. `emanuelsf.org` returned 403 to
me as it did to the finder.

- **DROP** "dome height 150 feet" — uncited infobox number.
- **DROP** "architect Arthur Brown Jr." — uncited infobox value. If the author reaches a
  cited source, it publishes; from the infobox alone it does not.
- **KEEP**, on the article's reference [6], and only if the author re-checks that
  reference: the synagogue was dedicated over three days, 16, 17 and 18 April 1926.

Replacement wording for the whole entry:

> Congregation Emanu-El's synagogue stands at 2 Lake Street, on the block bounded by Lake Street, Arguello Boulevard, California Street and 2nd Avenue. It was dedicated over three days, on 16, 17 and 18 April 1926.

**No protection sentence of any kind.** Not "historic", not "landmark", not "listed". It
carries nothing, on either register, and I confirmed that twice.

### 4.3 10th Avenue & Clement Mini Park

Kind `park`. Rec & Park's dataset names it **"10th Ave & Clement Park"**; Rec & Park's own
facility page names it **"10th Avenue & Clement Mini Park"**. Use the facility page's
name — it is the operator's public-facing name. **Do not write a sentence explaining that
two records disagree**; that is research method and it fails the build.

The finder's adjacency claim is cut. Rec & Park gives the park's address as **351 Ninth
Ave** — the library's address — at 37.781849, -122.468112, which is the same point EAS
returns for `351 09TH AVE`. That is a shared address record, not an observed adjoining
wall, and the park's own name puts it at 10th and Clement. Replacement wording:

> Recreation and Park gives the park's address as 351 Ninth Avenue and its area as 0.93 acres. It has a playground with swings, soft rubber flooring, grass and benches.

Hours (5 a.m. to midnight; restroom 8 a.m. to 8 p.m.) rest on the Rec & Park facility page,
which I did not re-fetch. **Confirm it or drop the hours.**

### 4.4 Muriel Leff Mini Park — 450 7th Avenue

Kind `park`. Confirmed: EAS returns `450 07TH AVE`, Inner Richmond, 37.780049,
-122.464767; Rec & Park gives 0.24 acres, propertytype "Mini Park", `analysis_neighborhood`
Inner Richmond, centroid 37.780069, -122.465047.

**DROP "Renovated and reopened April 2023"** — the finder's only cited link for this park
is a URL whose path reads `Mountain-Lake-Park-192`, and no source I re-fetched carries the
date. **DROP the cross-street sentence.** Rec & Park's record and the Arts Commission's
record give different cross-streets, and writing "the park runs between them" is our
reconciliation, not a source's. Replacement wording:

> Muriel Leff Mini Park is a Recreation and Park mini park of 0.24 acres at 450 7th Avenue.

Park hours 5 a.m. to midnight: same ruling as 4.3 — confirm the facility page or cut.

### 4.5 "Red Gothic", Aristides Demetrios

Confirmed in `r7bn-7v9c`: `display_title` Red Gothic, `artist` Demetrios, Aristides,
`accession_number` 1987.42, `creation_date` **1986**, `street_address_or_intersection`
7th Avenue & Anza Street, `current_location` Public Display, Inner Richmond.

**DROP the medium, the dimensions and the donor** (§2.3). Replacement wording:

> Red Gothic, by Aristides Demetrios, dates from 1986 and stands at 7th Avenue and Anza Street. The San Francisco Arts Commission catalogues it under accession number 1987.42.

Note the finder's own §6.5 header reads "1986" while the entry title reads "1986" — both
correct; the dataset's `creation_date` is 1986, not 1987. 1987.42 is an accession, not a year.

### 4.6 "Touching Earth", Scott Donahue

Confirmed: accession 2010.5.1-2, `creation_date` 2010, 351 9th Avenue, Public Display,
Inner Richmond. **DROP the medium, the dimensions and the commission sentence.**

> Touching Earth, by Scott Donahue, dates from 2010 and stands at 351 9th Avenue. The San Francisco Arts Commission catalogues it under accession number 2010.5.1-2.

### 4.7 Clement Street

Kind `attraction`. **DROP "the hub of the Inner Richmond"** — an impression, and Wikipedia's.
**DROP the cuisine list** as Wikipedia phrases it; the corridor's composition is shown by
the forty shopfronts the page carries, not asserted over them. **DROP "The 2 bus runs on
Clement"** — no Muni source was reached and a bus route is exactly the kind of fact a
reader will act on. Replacement wording:

> Clement Street runs west from Arguello Boulevard. The city's address records place the 1 to 1156 blocks in the Inner Richmond; from the 1200 block the street is in the Outer Richmond.

### 4.8 Green Apple Books — 506 Clement Street

Kind `shop`. Register confirms "Green Apple Bookstore", 506 Clement St, 94118; EAS
confirms Inner Richmond at 37.783198, -122.464707, APN 1427014.

- **DROP the 1968-10-01 registration date.** It is the dataset floor, shared by See's
  Candies, Busvan and four building rows. It is not a founding year and it does not
  publish even as one.
- **DROP the 520 Clement annex.** No Green Apple registration exists at 520; the register
  shows La Clement LLC and Trending Houseware Inc there.
- **DROP general opening hours** — none were published on any page reached, and the page
  says nothing about that.
- **KEEP**, verbatim from the shop's own site: Sell Us Your Books runs 10am–6pm daily,
  at the Clement Street shop only.
- The other two shops are out of zone: 1231 9th Avenue is in the **Inner Sunset**, which
  has its own page, and Browser Books is on Fillmore Street. Name neither.

### 4.9 Clement Street Farmers Market — 244 Clement Street

Kind `shop`. Register confirms "Clement Farmers Market" at 244 Clement St and the
**Agricultural Institute of Marin** at the same address. Twenty-odd vendors register
there; I confirmed Rize Up Bakery, Volcano Kimchi, Cap'n Mike's Holy Smoke, The Hummus
Guy, Joodooboo, Canteen Meats and Saltwater Bakeshop, all at 244 Clement St, all live.

**DROP the day and the hours.** `sfmarkets.org` does not resolve and no AIM listing was
reached. The page gives no day and does not explain why.

> The Clement Street Farmers' Market operates at 244 Clement Street. The Agricultural Institute of Marin holds a business registration at the same address. Vendors registered there include Rize Up Bakery, Volcano Kimchi, Cap'n Mike's Holy Smoke, The Hummus Guy, Joodooboo, Canteen Meats and Saltwater Bakeshop.

### 4.10 Burma Superstar — 309 Clement Street

Kind `restaurant`. All eight hour ranges and the phone re-fetched and **exact**. Publish
them verbatim: dine-in lunch Monday–Thursday 11.30am–3pm and Friday–Sunday 11.30am–3.30pm;
dine-in dinner Sunday–Thursday 5pm–9.30pm and Friday–Saturday 5pm–10pm; takeout lunch
Monday–Thursday 11.30am–2.30pm and Friday–Sunday 11.30am–3pm; takeout dinner
Sunday–Thursday 5pm–10.30pm and Friday–Saturday 5pm–10.30pm. Phone (415) 387-2147.

**DROP "the original restaurant."** It is the operator's own trading-sequence claim about
its own business. **Do not name the other branches.**

### 4.11 The Plough and Stars — 116 Clement Street

Kind `brewery`. Hours re-fetched and exact: Sunday 11am–2am; Monday 5pm–2am; Tuesday
5pm–2am; Wednesday 3pm–2am; Thursday 4pm–2am; Friday 3pm–2am; Saturday 2pm–2am. Phone
(415) 751-1122. EAS confirms 37.783370, -122.460518-ish at 2nd Avenue.

Schedule, corrected to the page as re-fetched: Seisiún Saturday and Sunday afternoons
1–4pm; Old Time Jam on **odd** Tuesdays 7–9.30pm (the finder wrote "selected"); Set
Dancing on various Wednesdays with rotating bands; Board Game Night on the first and third
Mondays from 6.30pm.

- **DROP "live performances from 9pm"** — not on the page.
- **DROP "voted best Irish pub by SF Weekly"** — a superlative, attributed or not.
- **DROP "Home of Traditional Irish Music in the Bay Area"** — same ruling, it is a
  ranking wearing a slogan's clothes.
- Cover charge on Friday and Saturday nights publishes as a fact about the door.

### 4.12 Park Life — 220 Clement Street

Kind `shop`. Register confirms Park Life at 220 Clement St. **DROP "since 2006"** — a
trading-duration claim from the operator's own site, and the register's matching
`2006-08-01` is a registration date, which does not rescue it. Publishable: it is a shop
and gallery; it stocks books, design objects, editions, apparel, art, stationery, gifts,
prints, bags, hats and jewellery; the gallery runs rotating exhibitions. No hours were
published on any page reached.

### 4.13 Schubert's Bakery — 521 Clement Street

Kind `cafe`. Hours re-fetched and exact: Wednesday to Saturday 9am–5pm; Sunday 9am–4pm;
closed Monday and Tuesday.

**The phone number is corrected. Publish 415-752-1580, not 415-752-5180.** The contact
page adds that the phone is answered Wednesday to Friday, 9.00am–5.00pm.

**DROP "since 1911"** and every derivative of it. **DROP the 2025-09-04 registration date**
and any narrative about the move. Address is "521 Clement Street, between 6th Avenue and
7th Avenue" per the bakery's own page, which is a permitted locator.

### 4.14 Richmond New May Wah Supermarket

Kind `shop`. The register carries **two** live rows: `Richmond New May Wah Supermket` at
`707 Clement St #711` and at `719 Clement St`. Write the numbers as the register does —
707 and 719 Clement Street — and expand the name to *Richmond New May Wah Supermarket*.
**DROP "Occupies more than one shopfront"** as a characterisation; two registered
addresses is the fact, and the reader can see it.

### 4.15 Sixth Avenue Aquarium — 425 Clement Street

Kind `shop`. Register confirms "Sixth Ave. Aquarium" at 425 Clement St. **DROP "the shop's
name and its street do not agree, which is worth a sentence."** That is the page
adjudicating its own material. Publish the name and the address and let the reader notice.

### 4.16 Cinderella Bakery & Café — 436 Balboa Street

Kind `cafe`. EAS confirms Inner Richmond at 37.777459, -122.463741, APN 1548027. Hours
re-fetched verbatim: **Open Daily 7am–7pm.** The finder missed the phone numbers, which
are on the same page: (415) 751-9690 and (415) 751-6723.

Publishable menu description, from the operator's own site: Napoleon cakes, honey cakes,
piroshki, Russian pies, and Russian appetisers, entrées and side dishes.

**DROP the Mission District second location.** It is announced as "Coming Soon in 2026" at
2937 24th Street — a future opening, in a shipped zone that is not this one. **DROP "the
Russian institution the roster draw is reaching for"** — the roster draw says no such
thing, and the sentence is the page ranking its own contents.

### 4.17 Arguello Boulevard as the zone's east edge

**Not a place.** It survives as a fact for the guide's "Getting there" section, rewritten:

> Arguello Boulevard is the zone's eastern limit. The city's address records place 201, 325 and 397 Arguello Boulevard in the Inner Richmond and 200, 350 and 460 across the street in Presidio Heights.

**DROP "the centre line of Arguello is the boundary" as a general rule.** It holds only in
the northern stretch: 600 and 798 Arguello Boulevard both return **Lone Mountain/USF**,
not Presidio Heights. Do not state the odd/even rule without the qualifier, and do not
state the qualifier as a discovery about datasets.

---

## 5. DROP — 18

**Star of the Sea Church, 4420 Geary Boulevard.** EAS confirms the address is Inner
Richmond (37.781207, -122.466998, APN 1440018A) and that is all that is confirmed.
`staroftheseasf.com` is now an unrelated site and the Archdiocese page 403s. An address
row is not a parish. Nothing about the institution is sourced and the page cannot say so.

**St. James Episcopal Church, 4620 California Street.** Same ruling. EAS confirms 4620
California Street is Inner Richmond; the finder itself records "no other fact sourced."

**Congregation Anshey Sfard (1500 Clement), Congregation Beth Sholom (301 14th Avenue),
Holy Virgin Cathedral (6210 Geary).** All Outer Richmond. Correctly excluded by the
finder; recorded here as ruled. (Anshey Sfard appears in the Clement register at 1500
Clement St, which is Outer Richmond by EAS — confirmed.)

**Funston Avenue north of the Presidio wall.** A boundary fact, not a place. The break —
`63 FUNSTON AVE` returns Presidio, `120 FUNSTON AVE` returns Inner Richmond — is confirmed
and may be used in "Getting there". It is not an entry.

**Golden Gate Park's north kerb along Fulton Street.** The finder does not offer it as a
candidate and I agree. Golden Gate Park is its own page.

**Paper Museum Press, 220 Clement Street.** A press registered at Park Life's address.
Not a door a traveller opens.

**Neck of the Woods, 406 Clement Street.** The register carries a live row with a 2012
start and no end date. A tax registration with no end date does not establish that a music
venue currently trades, no operator source was reachable, and the finder flagged it
itself. Writing it as open would be the kind of claim a reader acts on and finds false.

**Locals Cafe / Richmond Republic, 642 Clement Street.** **Four** live registrations at
one address, not three — Locals Cafe, Richmond Republic, Richmond Burritos and a row
named "Clement Street". Which trades is unestablished and the page cannot say so.

**Katia's Russian Tea Room, 600 5th Avenue.** DROP the place — `katias.com` 404s and
nothing establishes the business. **But correct the finder's record: `600 05TH AVE`
returns a live EAS row and it is Inner Richmond.** The finder's stated reason for the drop
is false; the drop still stands on the business, not the address.

**San Francisco Fire Department station, 441 12th Avenue.** EAS confirms `441 12TH AVE` is
Inner Richmond, APN 1532007. That is the whole of it — no station number, no year, no
architect, and the finder's own instruction is not to publish a station number. An address
with nothing attached is not an entry.

**George Peabody Elementary School (251 6th Avenue) and Frank McCoppin Elementary School
(651 6th Avenue).** DROP as places — public elementary schools with no visitor function
and no source beyond a Wikipedia list. **But correct the finder's record: both `251 06TH
AVE` and `651 06TH AVE` return live EAS rows and both are Inner Richmond.** The finder's
"neither exact house number returned an EAS row" is false.

**Geary Boulevard between 3600 and 4800**, **California Street between 3900 and 5000**,
**Lake Street**, and **Balboa, Cabrillo and Anza Streets**. Four entries, all dropped as
places. A street segment defined by an address range is a boundary finding, not a
destination, and the guide already carries the corridor that is a destination. The
segments may inform "Getting there". Two cautions: `4800 GEARY BLVD` (Inner Richmond) and
`5000 GEARY BLVD` (Outer Richmond) are confirmed, as is `4620 CALIFORNIA ST` (Inner
Richmond); **the Anza claim is not** — `800 ANZA ST` returns Lone Mountain/USF as the
finder says, but `1000 ANZA ST` returned no row, so "Inner Richmond from 1000 to 2000"
rests on nothing I could confirm. Do not write it.

**Velo Rouge Café, 798 Arguello Boulevard.** EAS returns **Lone Mountain/USF** at
37.775372, -122.458263. Out of zone. The finder's instinct to leave it out of §3 was right.

---

## 6. ESCALATED TO THE ARBITRATOR — 6

**E1 — San Francisco Columbarium & Funeral Home, 1 Loraine Court (S2).** EAS returns
**Lone Mountain/USF** at 37.780615, -122.457077, APN 1084002, and I confirmed it directly.
Lone Mountain/USF is not one of the twenty-three zones, so honouring DataSF orphans a
landmark that the roster's own draw for this zone names by name. That is the arbitrator's
call, not mine, and it is the sharpest conflict in the file: **the roster asks for it and
the city's address system says it is somewhere else.** I note that Wikipedia and the
operator both place it in the Richmond District, and that noehill's own header reads
"Between Stanyan and Arguello Off Anza, Lone Mountain."

If it lands here, these constraints bind:

> San Francisco Landmark No. 209, designated in 1996 under Article 10 of the Planning Code.

Completed 1898; architect Bernard J. S. Cahill; neo-classical with a copper dome; a
rotunda with mosaic tile floors, stained-glass windows and a domed skylight; balconies
across four floors; three main halls named the Hall of Olympians, the Hall of Titans and
the Hall of Heroes; office hours Monday to Friday 9am–5pm; phone 415-771-0717. It stood in
the Odd Fellows Cemetery; San Francisco prohibited cremation in 1910 and the cemetery's
burials were moved out of the city; the Neptune Society of Northern California began
restoration in 1980.

- **DROP the niche count entirely.** The operator says approximately 8,500 and noehill
  says "over five thousand". Two sources, one order of magnitude apart. No number publishes.
- **DROP the atrium and rotunda measurements.** Same reason — 45 feet from the operator,
  64 / 29 / 45 feet from Wikipedia, and they are not measuring the same thing.
- **REWRITE the stained glass** to what the source says: *Six ground-floor rooms have
  stained-glass windows. One of them has been attributed to both Louis Comfort Tiffany and
  John La Farge.* Not "some", not two artists.
- **DROP "the last remaining nondenominational place within San Francisco to memorialize
  loved ones"** and every earlier phrasing of it. A superlative from the operator is still
  a superlative.

**E2 — Mountain Lake Park, 1 11th Avenue (S1).** Rec & Park's `analysis_neighborhood` is
the literal string **"Inner Richmond, Presidio"**; the dataset declines to choose and so
do I. 12.96 acres, propertytype "Neighborhood Park or Playground", Rec & Park centroid
37.787242, -122.469103, EAS row `1 11TH AVE` at 37.786830, -122.470167, Inner Richmond,
APN 1345001. Both figures in the finder are right; they come from different datasets and
the finder did not say so.

One fact the arbitrator should have, which the finder did not surface: **presidio.gov's
own page describes the city playground and dog park as adjacent amenities**, which is the
Presidio's own site treating the city park as a neighbour rather than as part of itself.
That is the strongest argument for the lake going to the Presidio page and the park coming
here. Note also that the restoration is credited to the **Partnership for the Presidio**
working with scientists and volunteers — not, as the finder wrote, to the Presidio Trust's
own work.

**E3 — "Bear and Lion", M. Earl Cummings, 1908 (S6).** Three live rows, all confirmed:
`1908.3.a-b` (the pair), `1908.3.a` "Bear", `1908.3.b` "Lion", all 1908, all Cummings, all
`street_address_or_intersection` "8th Avenue & Fulton Street", all `analysis_neighborhood`
**Inner Richmond**, all Public Display.

**The finder's evidence for the straddle does not exist** — there is no `facility` field
in `r7bn-7v9c` (§2.3). The real evidence is the `location_description` strings: **"8th
Avenue Entrance At Fulton St. Northeast Corner"** for Bear and **"Northwest Corner"** for
Lion. A park entrance is contested ground between the park page and the neighbourhood
page, and the arbitrator holds both. Whoever takes it: title, artist, year and accession
only, no medium, no dimensions, no donor.

**E4 — Park Presidio Boulevard (S7).** Confirmed: Rec & Park propertytype "Parkway",
20.39 acres, no street address, centroid 37.780140, -122.472301,
`analysis_neighborhood` = **"Outer Richmond, Inner Richmond, Seacliff, Presidio"**. Four
zones in one string, and two of them are zones the arbitrator holds. It is also this
zone's western limit. I have no basis for preferring a claimant.

**E5 — Theodore Roosevelt Middle School, 460 Arguello Boulevard (S3).** DROPPED from this
zone: EAS returns **Presidio Heights**, confirmed directly, and the Article 10 APN
`1061049` matches the Presidio Heights parcel. Presidio Heights is not one of the
twenty-three zones, so **SF Landmark No. 285 is orphaned corpus-wide.** Escalated because
that is a roster problem, not a zone problem. If the arbitrator places it: Landmark No.
285, designated 2019; built 1929–1930; architect Timothy Pflueger; three New Deal murals,
two by Horatio Nelson Poole in the main lobby and one by George Wilson Walker in the
auditorium. **Both of noehill's phrasings are banned** — "the only known example of this
avant-garde approach in San Francisco and possibly the entire United States" and "an
exceptional example". Describe the murals; say nothing about why there is no photograph.

**E6 — Angelo J. Rossi Playground, 600 Arguello Boulevard (S4).** DROPPED from this zone:
EAS returns **Lone Mountain/USF**, confirmed directly at 37.779081, -122.458262. Same
orphaning as E1 and E5. 7.08 acres. **"The largest Rec & Park holding anywhere near the
zone" is a superlative and does not publish in any zone** — the acreage does.

**Not escalated, and I record why.** The finder's §2 flags the vernacular north boundary
(Wikipedia's California Street) as "the single most consequential disagreement in this
file". **I rule for DataSF and close it.** The city's Analysis Neighborhood polygon is the
authority this corpus uses everywhere else, EAS agrees with it on every one of the finder's
forty-plus probes, and Wikipedia's boundary sentence is unsourced. Temple Emanu-El, Lake
Street and the 3900–5000 blocks of California Street are **in**. The page must never
mention that two readings exist.

---

## 7. TIER RULING

**GUIDE, on 62 surviving places.**

A town-page is the short form — under six places, a 90-word intro floor, two outbound
links. Sixty-two is an order of magnitude past it, and `san_francisco_seed_data_test.exs`
fails any file labelled `town-page` carrying six or more.

The `guide` form binds the author to all of:

- at least four places — satisfied many times over;
- an intro of **100 to 160 words** — the test rejects both under and over;
- **four to six FAQ entries** — not three, not seven;
- a section headed **exactly** `Getting there`;
- `state: "California"`, `county: "San Francisco"`, `destination: "Inner Richmond, California"`;
- `"photos": []` everywhere — photographs are a separate wave;
- a title of 120 characters or fewer;
- every place reachable from `entries`, each with a `place_slug` that resolves and a
  `kind` in food/tour/walk/sight/stay/tip;
- every `links` entry carrying a valid `kind` and a note of 160 characters or fewer.

**Kinds.** There is no `church`, `library`, `market`, `street` or `sculpture` kind. Map:
churches and landmarks to `historic-site`; the library and the Internet Archive to
`attraction`; parks to `park`; Clement Street to `attraction`; the two sculptures to
`attraction`; bakeries and cafés to `cafe`; the Plough and Stars and Lost Marbles to
`brewery`; markets, groceries, hardware and bookshops to `shop`; restaurants to
`restaurant`.

**A caution on composition.** Thirty-nine of the sixty-two are register-only shopfronts
carrying a name, an address and a kind. That is a real corridor honestly described, and it
is also most of the file. The guide's prose must carry its weight on the six or seven
entries that have more than an address — St. John's, the Carnegie library, the Campfire
Girls Building, the Internet Archive, Burma Superstar, the Plough and Stars, Schubert's,
Cinderella and Green Apple — and must not inflate the rest to compensate.

**The designation floor.** Three identifiers are available to this page: San Francisco
Landmark No. 83 and NRHP 95001555 at St. John's, No. 169 at the Campfire Girls Building,
No. 247 at the Richmond Branch. Every sentence that uses the words *designated*, *listed*,
*landmark*, *registered* or *nominated* must carry one of them or an Article 10 reference,
or it fails the build. **And the page must never say how many there are.**
