# Japantown — Verifier's Verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/japantown-finder.md`.
Every ruling below is PUBLISH, REWRITE or DROP with a reason. Straddlers are escalated to the
arbitrator, not settled here.

**Counts: 24 PUBLISH · 11 REWRITE · 28 DROP. Surviving places: 34. Tier: GUIDE.**

---

## 0. WHAT I RE-FETCHED

Five hardest-leaned sources, plus every designation number the finder claims.

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks | 370 rows, exactly **40** with `landmarkno = 0`. Trap 1 reproduced. |
| `3mea-di5p` EAS addressing | **546** rows stamped `nhood='Japantown'`. **No BUSH row. No PINE row.** Reproduced exactly, street by street. 42 per-address lookups run individually. |
| NPS `nrhp_locations` layer 0 | All four reference numbers returned. Field is `NRIS_Refnum`, not `REFNUM`. |
| `r7bn-7v9c` Civic Art | All six accession numbers returned with dimensions verbatim. |
| `gtr9-ntp6` Rec & Park | All five properties returned with acreage and `analysis_neighborhood`. |
| `m22e-6hkz` districts | Both district rows returned in full. |
| `sfjapantown.org` + `/directory` | **Ten businesses. That is the whole directory.** |
| `sfrecpark.org/CivicAlerts.aspx` | Peace Plaza construction update, posted **2 September 2026**, recovered verbatim. |
| `sokoji.org`, `jcccnc.org`, `njahs.org`, `konkosf.org` | All four answered. |
| `en.wikipedia.org` Japantown / Japan Center / Issei Women's Building | All three answered. |
| `codelibrary.amlegal.com` Appendix K | **403 again.** The Article 10 district claim stays unverifiable. |
| NRHP nominations 73000443, 73000444, 82000983 | **Opened, all three.** npgallery times out in the foreground but serves in the background. The finder's transcriptions are accurate; see §3. |

---

## 1. DESIGNATION NUMBERS — EVERY ONE RE-FETCHED

### Article 10, from the live register

| Claimed | Register returned | Verdict |
|---|---|---|
| LM **65**, Trinity Episcopal, 1668 Bush, 1974 | `65 | Trinity Episcopal Church | 1668 Bush Street | 1974.0` | **SURVIVES** |
| LM **65**, Trinity Presbyterian, 3261 23rd, 1984 | `65 | Trinity Presbyterian Church | 3261 23rd Street | 1984.0` | **SURVIVES.** The number IS reused. The finder's warning is correct and must be honoured by anyone citing 65. |
| LM **66**, Stanyan House, 2006 Bush, 1975 | `66 | Stanyan House | 2006 Bush Street | 1975.0` | **SURVIVES** |
| LM **81**, Ohabai Shalome/Bush Street Temple, 1881 Bush, 1976 | `81 | Ohabai Shalome/Bush Street\nTemple | 1881 Bush Street | 1976.0` | **SURVIVES** |
| LM **202**, Golden Gate Commandery, 2135 Sutter, 1993 | `202 | Golden Gate Commandery of the Knights Templar (Macedonia Missionary Baptist Church) | 2135 Sutter Street | 1993.0` | **SURVIVES** |
| LM **211**, Madame C J Walker House, 2066 Pine, 1999 | `211 | Madame C J Walker House (Home for Girls) | 2066 Pine Street | 1999.0` | **SURVIVES — and is already owned by `pacific-heights.json`.** |
| LM **245**, The New Mission Theater, 2550 Mission, 2004 | `245 | The New Mission Theater | 2550 Mission Street | 2004.0` | **SURVIVES** |
| LM **266**, Marcus Books/Jimbo's Bop City, 1712-1716 Fillmore, 2014 | `266 | Marcus Books and Jimbo's Bop City | 1712-1716 Fillmore Street | 2014.0` | **SURVIVES** |
| LM **288**, Kinmon Gakuen, 2031 Bush, 2019 | `288 | Kinmon Gakuen | 2031 Bush Street | 2019.0` | **SURVIVES** |
| LM **291**, Japanese YWCA/Issei Women's Building, 1830 Sutter, 2021 | `291 | Japanese YWCA/Issei Women's Building | 1830 Sutter Street | 2021.0` | **SURVIVES** |

**TRAP 2 CONFIRMED INDEPENDENTLY.** I re-fetched the Wikipedia article: it says "San Francisco
Designated Landmark #245, designated April 30, 2021." The register says 245 is the New Mission
Theater, designated 2004, and the Japanese YWCA is 291. **Wikipedia is wrong. The finder is right.**
This is the second wave in a row where an encyclopedia's designation field failed re-fetching.

**One correction to the finder.** The dataset has no designation-DATE column — only `yeardesignated`,
carrying a year. So "Kinmon Gakuen, designated 1 November 2019" cannot be cited to the register;
the day comes from Wikipedia alone. **REWRITE to "San Francisco Landmark No. 288, designated 2019."**

**TRAP 1 CONFIRMED.** 40 zero rows. On the zone's streets: `Peace Pagoda / Plaza | 1610 GEARY BL |
0.0`, `Japanese American Citizen League | 1765 SUTTER ST | 0.0`, `Western Addition Branch Library |
1900 Geary Boulevard | 0.0`, `National Urban League, SF Chapter | 2015 STEINER ST | 0.0`. The
finder also missed four more in reach — Mel's Diner Sit Ins at 3355 Geary, Congregation Emanu-El
School Buildings at 1337 Sutter, the Office of Dr. Carlton B. Goodlett at 1843-1849 Fillmore, and
I. Magnin at 251-259 Geary. **No protection claim may be written for any of them.**

### National Register, from the NPS locations layer

| Claimed | Layer returned | Verdict |
|---|---|---|
| **73000443**, 1813–1813B Sutter, 8 Mar 1973 | `73000443 | Building at 1813--1813B Sutter Street | 1813--1813B Sutter St. | San Francisco | 03/08/73 | building` | **SURVIVES** |
| **73000444**, 1735–1737 Webster, 8 Mar 1973 | `73000444 | Building at 1735--1737 Webster Street | 1735--1737 Webster St. | San Francisco | 03/08/73 | building` | **SURVIVES** |
| **100004868**, Japanese YWCA, 10 Jan 2020 | `100004868 | Japanese YWCA | 1830 Sutter St. | San Francisco | 01/10/20 | building` | **SURVIVES.** RESNAME is "Japanese YWCA" flat — the register does not carry "Issei Women's Building". |
| **82000983**, Bush Street–Cottage Row HD, 27 Dec 1982 | `82000983 | Bush Street-Cottage Row Historic District | 2101-2125 Bush St., 1-6 Cottage Row, and 1940-1948 Sutter St. | San Francisco | 12/27/82 | district` | **SURVIVES** |

**The finder's claimed 2026 National Register listing for Kinmon Gakuen does not exist in the
layer.** I queried `NRIS_Refnum` and `RESNAME LIKE '%Kinmon%'` and got nothing. The finder was
right to refuse it. **DROP, and do not revisit.**

### The Article 10 district claim for Cottage Row — DROP

The finder suspected a copied field and could not check it. I can now do better than suspicion.
The `m22e-6hkz` row reads:

    a10 = Listed
    nr = Listed
    dateadop = 1982-12-27T00:00:00.000Z
    origin = National Register

**`origin` says the row came from the National Register.** That is affirmative evidence, not a
coincidence of dates, that `dateadop` is inherited from the Keeper's entry rather than recording a
Board of Supervisors ordinance. There is no district-number field in the dataset, amlegal returned
403 again, and the standard the corpus already meets is `pacific-heights.json`'s "San Francisco
Landmark District No. 2, designated under Article 10 of the Planning Code by Ordinance 166-81 on
8 April 1981." Cottage Row can meet none of that.

**RULING: the Article 10 district claim DROPS. Cite only "National Register of Historic Places,
reference number 82000983, listed 27 December 1982."**

---

## 2. THE ZONE RULING — I RULE AGAINST CROSSING SUTTER STREET

The finder called §4a the most consequential thing in the file and declined to resolve it. I
resolve it, and I resolve it against the vernacular reading.

**The evidence.** I did not take the finder's word for the polygon. I pulled all 546 EAS rows
myself and reproduced the street table to the address range, including the residual nine on Avery,
Erkson, Garden and Hemlock. **Bush Street returns zero rows. Pine Street returns zero rows.** Then
I ran 42 individual per-address lookups. Every single one matched the finder:

    1830 SUTTER -> Pacific Heights      1765 SUTTER -> Japantown
    1840 SUTTER -> Pacific Heights      1813 SUTTER -> Japantown
    2031 BUSH   -> Pacific Heights      2135 SUTTER -> Japantown
    1881 BUSH   -> Pacific Heights      2501 SUTTER -> Japantown
    1909 BUSH   -> Pacific Heights      1712 FILLMORE -> Japantown
    2101 BUSH   -> Pacific Heights      1610 GEARY  -> Japantown
    1881 PINE   -> Pacific Heights      1550 SCOTT  -> Japantown
    1737 WEBSTER-> Pacific Heights      1707 BUCHANAN -> Japantown
    1668 BUSH   -> Western Addition     1501 OFARRELL -> Western Addition
    1298 PINE   -> NO EAS ROW           22 PEACE PLAZA -> NO EAS ROW

**Why the official reading wins.** The vernacular reading has no locator behind it. Nominatim
429'd on all nine of the finder's points, so the finder substituted "general reference" — which is
not a source that answers, and cannot be re-fetched. Against that stands a per-address, parcel-exact
city file that I reproduced in full. A guide that takes 1830 Sutter into Japantown asserts a
containment the city's own address file denies, and asserts it on the strength of a source that
does not exist in the file.

**Pacific Heights not having claimed them is not an argument.** It makes them unclaimed. It does
not make them Japantown's.

**Consequence, stated plainly for the arbitrator:** Japantown ships without the Japanese YWCA,
without Kinmon Gakuen, without the JCCCNC, without Konko Church, without the Bush Street Temple and
without the Cottage Row district. Three of the four National Register listings and both Article 10
landmarks that exist *because the buildings are Japanese-American* fall outside. That is a real
loss and I am not pretending otherwise. It is the arbitrator's to overturn — but it must be
overturned on a locator, not on a feeling.

**And one thing the finder got wrong, which changes the west edge.** The finder wrote that Pacific
Heights "already owns Fillmore Street as a street" and that Japantown taking Fillmore-frontage
buildings means "two shipped zones describe the same pavement." I read the shipped entry:

> `fillmore-street-pacific-heights` — "The shopping street of the ridge, running north-south
> across it. **The blocks between Bush Street and Broadway** carry the restaurants, bakeries and
> clothing shops."

Marcus Books at 1712–1716 Fillmore is *south* of Bush. **There is no overlap. The conflict does
not exist.** Marcus Books and the Golden Gate Commandery are free, EAS-stamped Japantown, and
publish.

---

## 3. RULINGS, CANDIDATE BY CANDIDATE

### 3.1 The Peace Plaza and the Japan Center

**1. Japantown Peace Plaza — REWRITE.**
Verified: `Japantown Peace Plaza | Civic Plaza or Square | 0.80398626 acres | Japantown | 1610
Geary Blvd`. The finder's highest-priority open question is now closed. Rec & Park's own news feed,
posted **2 September 2026**, is reachable at `sfrecpark.org/CivicAlerts.aspx` and says verbatim:

> "In the coming months, we will be working to complete more sections of the plaza near Geary
> Boulevard and the two fenced seating nooks near Post Street. Saturday work will continue
> intermittently throughout September and October… Waterproofing continues around the Pagoda. The
> upper plaza is being built up to meet the base of the Pagoda… Access from Post Street: Use the
> new posted detours through the center of the plaza to access both East Mall and West Mall
> entrances. Sidewalk: Accessible pedestrian detour is open along the north side of Geary between
> Laguna to Buchanan Streets."

**The plaza is an active construction site with fenced seating nooks and posted detours through
its centre.** A page describing it as walkable today would be wrong, exactly as the finder feared.

Exact replacement wording:

> "A civic plaza of 0.80 acres at 1610 Geary Boulevard, held by San Francisco Recreation and Park.
> The plaza is under renovation. Recreation and Park's September 2026 construction update puts
> Saturday work through September and October, waterproofing around the pagoda, and posted
> pedestrian detours through the centre of the plaza to the East and West Mall entrances. An
> accessible pedestrian detour runs along the north side of Geary between Laguna and Buchanan
> Streets."

Note the verbs: this is a fact about the plaza from its owner, not a note about our fetching.
Do not write a percentage of paint completed — it will be stale within a month.

**2. San Francisco Peace Pagoda — REWRITE.**
Landmarkno = 0 confirmed. **No designation claim of any kind.** The finder cited the Japantown
article first for Taniguchi, Murokami and the 2003 rededication; I re-fetched it and **it carries
none of them.** It gives only "a five-tiered concrete stupa designed by Japanese architect Yoshiro
Taniguchi and presented to San Francisco by the people of Osaka, Japan." The rest is in the *Japan
Center* article, which does carry, verbatim: "The Peace Plaza was originally designed by Japanese
architect Yoshirō Taniguchi"; "An update in 2000 by Kenji Murokami removed a large covered walkway
on the north side"; "The Peace Plaza was rededicated by Mayor Willie Brown in 2003."

**Cite the Japan Center article, not the Japantown article.** The facts survive; the attribution
was wrong. Note also that the 2000 update and the 2003 rededication are the **plaza's**, not the
pagoda's — the finder collapsed the two. Write them of the plaza.

**3. Japan Center — PUBLISH.** "It opened in March 1968 and was originally called the Japanese
Cultural and Trade Center"; Minoru Yamasaki; "Van Bourg/Nakamura drafted the plans"; interiors by
"Takenaka & Associates of Osaka." All verbatim from the article. Sound.

**4. Japan Center West (formerly Kintetsu Mall) — REWRITE.**
**5. Japan Center East (formerly Miyako Mall) — REWRITE.**
The article confirms "By 2020, 3D Investments had bought the former Kintetsu Mall and Miyako Mall."
It does **not** give 1581 Webster or 1737 Post. Those addresses rest on EAS rows alone, which
establish that an address exists, not what stands on it. Keep the addresses (EAS is a city record
of the address) but **drop any implication the cited article supplies them**, and do not write the
malls' names as though the source named them at those numbers.

**6. Kinokuniya Building — PUBLISH.** The article lists "the Kinokuniya Building at 1825 Post."
Sourced at the address. Sound.

**7. Webster Street Bridge / Bridge of Shops — PUBLISH.** Verbatim: "Structural steel for the
Bridge of Shops was supplied by U.S. Steel, American Bridge Division in South San Francisco,
California." Two structures that physically adjoin, which the orientation rule permits. Sound.

**8. Books Kinokuniya — DROP.** The finder cited `sfjapantown.org`. **It is not there.** I fetched
the homepage and the directory; the directory holds ten businesses and this is not one. The Japan
Center article says "Kinokuniya Mall" and nothing about a bookshop at 1581 Webster. No source
places this business at this address.

**9. AMC Kabuki 8 — REWRITE, with a deletion.** The cinema is named in the Japan Center article and
survives at 1881 Post. **"Hosts the Northern California Cherry Blossom Queen Program" DROPS.**
I re-fetched both cited articles. Neither contains it. It is not in the source.

**10. Hotel Kabuki — DROP.** The operator page 301s to a Hyatt brand landing. It is not in the
merchants' directory. What remains is an EAS address row and the fact that a restaurant called Nari
is at 1625 Post. **An address row does not establish that a hotel trades there.** The source could
not be fetched; the rule is DROP.

**11. Kabuki Springs & Spa — DROP.** Own site 403, not in the directory. Same reasoning.

**12. Japan Center Garage — REWRITE, and it now has a source.** Rec & Park's construction update
names "Japan Center Malls and Garage" and directs readers to "the Geary Boulevard parking garage to
access both East Mall and West Mall." That is an official live source for the garage's existence
and function. Publish on that; drop "City-owned," which no source I reached states.

**13. San Francisco Go Club — PUBLISH.** In the directory: "San Francisco Go Club — 22 Peace Plaza,
#501 | Community Organization, Entertainment." I confirmed there is **no EAS row** for any 22 Peace
Plaza address. Locate by the plaza. Do not write the suite number as if it were a city address.

### 3.2 The Buchanan block

**14. Osaka Way / the 1700 block of Buchanan Street — REWRITE, and rename it.**
EAS Buchanan-in-Japantown runs 1705–1762, reproduced exactly; that is this block and nothing else.
"one block of Buchanan Street in Japantown was renamed Osaka Way on September 8, 2007" is verbatim
in the article. **But the phrase "Buchanan Street Mall" must not appear.** Rec & Park owns a
property of that exact name — `Buchanan St Mall | Neighborhood Park or Playground | 1.97 acres |
1151 Buchanan St | analysis_neighborhood: Western Addition, Hayes Valley` — and runs a standing
news category for it. Hayes Valley is shipped. Trap 3 confirmed. **Name this place "Osaka Way" and
describe it by its address range.**

**15. Ruth Asawa, *Origami Fountain*, accession 1999.22.1 — PUBLISH.** Verified verbatim: bronze on
bricks, 1999, `78 x 96 x 96 in.`, 1731 Buchanan Street, "In middle of Buchannan pedestrian walkway;
Between Post And Sutter St., In space between 1731 and 1740 Buchanan, closer to Sutter Street",
commissioned by the Redevelopment Agency, `analysis_neighborhood` Japantown.

**16. Ruth Asawa, *Origami Fountain*, accession 1999.22.2 — PUBLISH.** Verified verbatim: `78 x 44
x 44 in.`, 1707 Buchanan Street, "closer to Post St."

One thing the finder missed: the dataset carries a **third** row, accession `1999.22.1-2`,
display_title "Origami Fountain**s**", dimensions `6 1/2' x 8' diam; 6 1/2' x 3 3/4' diam`, keyed to
"Buchanan Street & Post Street". It is a combined record of the same two objects, not a third
fountain. **Do not publish three fountains.** There are two.

Both are sculptures. Write about them; say nothing about photographs or why there are none.

**17. Paper Tree — DROP. 18. Nijiya Market — DROP.**
The finder gave these nothing but "EAS: Japantown." That is an address, not a business. Neither is
in the merchants' directory. No source establishes that either shop trades.

**19. Hinodeya Ramen Bar — PUBLISH.** In the directory: "1737 Buchanan Street | Ramen/Udon/Soba,
Restaurant." Sound.

**20. Benkyodo — DROP.** The finder's own confidence is low, the closure is unconfirmed, and it is
absent from the directory. If it is shut it is not a place, and nothing I reached says it is open.

**21. SF76 — DROP.** Not in the directory. The finder's "per the merchants' directory" does not
hold; the fetch places it in Instagram posts only.

### 3.3 Post and Sutter, inside the polygon

**22. NJAHS Peace Gallery & Archives — PUBLISH.** `njahs.org/about` confirms "1684 Post Street" and
the self-description "A 501 c (3) non-profit organization, incorporated in 1981, and dedicated to
the collection, preservation, authentic interpretation, and sharing of historical information of
the Japanese American experience." **No hours are stated on the site; write none.** ⚠ Straddler,
escalated — see §4. Correct the finder's address for the second premises: the site says **"640 Old
Mason Street, Crissy Field West"**, not "Building 640."

**23. JACL building / Nichi Bei Kai, 1765 Sutter — REWRITE.** EAS Japantown confirmed.
`landmarkno = 0` confirmed. **No designation claim.** And the finder's own instinct is right and I
am enforcing it: **the designation work programme must not reach the page.** A pending process is
not a fact about the building, and writing "is on Planning's work programme" is the page narrating
a status rather than describing a place. Publish the building at its address, or not at all.

**24. Building at 1813–1813B Sutter Street — PUBLISH, with one deletion.**
NRHP 73000443, 8 March 1973, verified against the NPS layer. EAS Japantown confirmed. **And I got
the nomination open** — npgallery timed out in the foreground but served 568 KB in the background,
so unlike the finder I have read the signed form. Every detail it transcribed is in the document,
verbatim:

> "The San Francisco Water Department records show this building as being connected to the water
> system in 1876." · "The original owner was Mr. or Ms. Gantzer who lived at 417 Kearny Street.
> This Italianate Victorian structure was built as a rental property. After the original owner,
> there were six owners before the final purchase by the San Francisco Redevelopment Agency. All
> of the previous owners were absentee landlords." · "This Italianate Victorian structure survived
> the 1906 earthquake and fire." · "its previous uses have been varied and interesting, including
> its use as a Bonsai store and currently as a Japanese church." · "1624 Post is to be moved to
> Block 685, Lot 30… and will be one of a row of extremely handsome Italianate Victorians on
> Sutter near Buchanan." · "1,679 sq. ft." · "Enid T. Sales, Rehabilitation Supervisor; Susan
> Bragstad, Architect… January 9, 1973."

The description adds usable fabric the finder missed: a two-storey angled bay window reaching
almost to the ground on the east side, round-headed double-hung windows flanked by flat pilasters,
a carved pierced wooden detail above the doorway arch, a wooden keystone over the upstairs window,
a flat roof projecting to a dominant cornice on eave brackets, and a rusticated facade.
**The nomination narrative PUBLISHES in full.**

**One deletion.** "1624 Post Street is one of the six most important Victorian structures chosen by
the San Francisco Landmarks Preservation Advisory Board as having exceptional merit." That is a
ranking with a comparison class and it **DROPS**, from this source as from any other. The finder
attached this sentence to candidate 55 instead; it appears in *both* nominations, and it publishes
in neither.

Also correct the tense. The nomination is written before the move — "is to be moved." The building
now stands at 1813 Sutter, which is the name the register carries, so the move happened; write it
as accomplished, not as a plan.

**25. Sokoji Soto Zen Mission, 1691 Laguna — REWRITE.** EAS Japantown confirmed. `sokoji.org`
answered and confirms every date the finder gives.

- **DROP the 1934 founding.** "Founded by Reverend Hosen Isobe and Japanese-Americans in San
  Francisco" in 1934 is a founding year from the congregation's own site. The rule is explicit and
  it does not publish.
- **PUBLISH the 1984 move:** the site says the new temple at 1691 Laguna Street took four years to
  build and "In April, Dedication ceremonies are held at the new temple" in 1984. That is a dated
  building event, not a trading-duration claim.
- **CORRECT THE FINDER on the corroboration.** The finder wrote that the Bush Street address is
  "corroborated by Landmark No. 81's designation of 1881 Bush." It is not. LM 81 designates
  *Ohabai Shalome/Bush Street Temple*; the register says nothing whatever about Sokoji. What LM 81
  corroborates is that a landmarked synagogue stands at 1881 Bush. The congregation's occupancy of
  it rests on the congregation's own site and nothing else. Write it that way or not at all.
- **KIND WARNING:** there is no `church` kind. Rome shipped three and the changeset rejected them.
  Use `historic-site`.

**26. Soko Hardware — DROP.** "EAS: Japantown" and nothing else. Not in the directory. No source
establishes the business.

**27–34. San Wang, 3 Pillars, Animon Life, Katachi, Tokaido Arts, On The Bridge, Yakitori Edomasa,
Nari — PUBLISH, all eight.** Every one is in the merchants' directory with the address the finder
gives, and every address falls inside the EAS Japantown ranges I reproduced. The finder told me to
"cut hard" here. I am not cutting them, because they are the only eight of its retail candidates
that a source actually names. The cut fell on the six it could not source.

Directory entries verified verbatim: `3 Pillars — 1630 Post St`; `Yakitori Edomasa — 1581 Webster
St #270, Kinokuniya Mall`; `Animon LIfe — 1737 Post Street #305`; `Tokaido Arts — 1581 Webster
Street #203`; `San Wang Restaurant — 1674 Post Street`; `On The Bridge — 1581 Webster Street #206`;
`Nari — 1625 Post Street`; `Katachi — 1737 Post Street #326`.

### 3.4 Hamilton

**35. Hamilton Recreation Center — PUBLISH.** Verified: `Hamilton Rec Center | Neighborhood Park or
Playground | 3.65430877 acres | Japantown | 1900 Geary Blvd`. EAS 1900 Geary: Japantown. ⚠ Straddler,
escalated. Note the Rec & Park name is "Hamilton Rec Center"; the Civic Art rows say "Hamilton
Recreation Center."

**36. Mary E. Erckenbrack, *Ceramic Mural on Athletics*, 1955.21 — PUBLISH.** Verified verbatim:
1955, "Carved and glazed ceramic", `300 x 192 x 1 1/2 in.`, "Post St. External Facade."

**37. Horace Washington, untitled, 2014.147.a-i — PUBLISH.** Verified: 2009, "Glazed ceramic tile,
glass", `48 x 1560 x 404 in.`, "Exterior Upper Facade", "Commissioned by the San Francisco Arts
Commission for Hamilton Recreation Center."

**38. Johanna Poethig, *Celebrate Ability*, 2014.146.a-f — PUBLISH.** Verified: 2013, "Hand-painted
ceramic tile and byzantine glass smalti Mosaic", `48 in. diameter x 1 in. (each)`, "Inside Main
Hall Walls."

All three are artworks. Describe them. Say nothing about photographs.

**39. Western Addition Branch Library, 1550 Scott — PUBLISH.** Verified: `Western Addition Branch
Library | Library | 0.89918193 acres | Japantown | 1550 Scott Street`. EAS 1550 Scott: Japantown.
The finder's flagged discrepancy is real — the Article 10 layer carries a zero-row for a "Western
Addition Branch Library" at 1900 Geary Boulevard, which is Hamilton's address — but that belongs in
this file, not on the page. **The page states the address and nothing about datasets disagreeing.**
⚠ Straddler by name, escalated.

**40. Westside Courts and the Bufano — SPLIT: the sculpture PUBLISHES, the housing project DROPS.**
The Bufano is fully verified: `1942.13 | Bufano, Beniamino | Horse and Rider (St. Francis on
Horseback) | 1935 | Granite | 164 x 62 x 26 in. | Created for the Works Progress Administration |
2501 Sutter Street | analysis_neighborhood: Japantown`. EAS 2501 Sutter: Japantown. The record's
self-contradiction is real — its own `location_description` opens "Lower Pacific Heights, Westside
Courts Housing Project, Central Courtyard" — and again, that is a fact about a dataset, not about
the place, and stays here.

**Westside Courts itself drops as a place.** It is a private residential courtyard and **no source
establishes public access.** A guide entry that sends a reader into a housing project's courtyard on
no authority is the kind of thing this gate exists to stop. Publish the sculpture with its address;
do not invite anyone in.

### 3.5 North of Sutter — DROP FROM JAPANTOWN, ESCALATE

Every entry here is EAS Pacific Heights, verified individually. Per §2, all drop from this zone
and are escalated. **None is claimed by shipped Pacific Heights, so nothing has to be taken back
and every one is available to the arbitrator.**

**41. Japanese YWCA / Issei Women's Building — DROP from Japantown. ESCALATE, first in the queue.**
Designations verified and clean: **SF Landmark No. 291, designated 2021**, and **NRHP reference
number 100004868, listed 10 January 2020**. Julia Morgan "designed the building _pro bono_"; the
facility opened 1932; began 1912; the SF YWCA "purchased and held the property in trust" under the
Alien Land Law; closed 1942 under Executive Order 9066; AFSC leased from 1943; CORE headquartered
there from 1943; the Mattachine Society held a convention there in 1954; Nihonmachi Little Friends
has rented since 1985 and bought the building in 2002 after the 1996 sale dispute. All verified.

Corrections: the finder's AFSC end-date of **1959 is not in the article** and is unverified — drop
it. The article adds an **annex in 2017** the finder missed. And the finder is right that "the first
independent Japanese YWCA in the United States" is a banned superlative — **DROP**, from any source.

**42. JCCCNC, 1840 Sutter — DROP from Japantown. ESCALATE.** Facts verified verbatim at
`jcccnc.org/about/history/`: the Redevelopment Agency's Nihonmachi Master Plan; "'Vision 80's,' the
$3 million capital campaign led by then-Mayor Dianne Feinstein and Yori Wada began" in 1982; Phase I
finished 1986; "Phase II construction (gymnasium/community hall) began" in 1988. The site names five
tenants, not two: Kimochi, Inc.; Japanese Community Youth Council; Nihonmachi Legal Outreach (now
Asian Pacific Islander Legal Outreach); Nobiru-kai Newcomer Services; and Japantown Arts and Media.

**43. Kimochi, Inc. — DROP.** Folds into 42, and 42 is escalated. Not a separate place.

**44. Kinmon Gakuen, 2031 Bush — DROP from Japantown. ESCALATE.** **SF Landmark No. 288, designated
2019** — verified, and cite the year only, not 1 November. The 2026 National Register listing is
absent from the NPS layer: **DROP.** The finder never obtained a construction year or architect,
and LM288.pdf defeated both of us on size. 1911 is the institute's founding, not the building's,
and the finder correctly refused to conflate them.

**45. Ohabai Shalome / Bush Street Temple, 1881 Bush — DROP from Japantown. ESCALATE.**
**SF Landmark No. 81, designated 1976** — verified.

**46. Konko Church, 1909 Bush — DROP from Japantown. ESCALATE.** `konkosf.org` answered and gives
"1909 Bush St, San Francisco, CA 94115" and "Since 1930, we have opened our doors to serve the local
San Francisco Community & beyond." **The 1930 date is a trading-duration claim from the operator's
own site and DROPS.** No architect, no construction year, no designation. What survives is an
identity and a location, which an operator's own site does establish — enough to publish as a bare
entry *if* the arbitrator brings the north side in, and not enough to be worth fighting for. The
roster names it; the roster cannot make a source say more than it says.

**47. Buddhist Church of San Francisco, 1881 Pine — DROP outright, not merely from this zone.**
I tried again. The domain I reached is not the congregation — it now serves an online gambling
site. Every source is gone. The finder had an address and nothing else and that is still true.
**No source could be fetched: DROP.**

**48. Christ United Presbyterian, 1700 Sutter — DROP.** EAS Pacific Heights, and unresearched.
**49. St. Francis Xavier, 1801 Octavia — DROP.** EAS Pacific Heights, and unresearched.
**50. Pine United Methodist, 1298 Pine — DROP.** I confirmed: **no EAS row.** No locator, no zone.
**51. Super Mira Market, 1790 Sutter — DROP.** EAS Pacific Heights, no source beyond the address.

### 3.6 Cottage Row — DROP FROM JAPANTOWN, ESCALATE

**52. Bush Street–Cottage Row Historic District — DROP from Japantown. ESCALATE.**
EAS on 2101 Bush, 2125 Bush and 1948 Sutter: **Pacific Heights, all three**, verified individually.
**NRHP reference number 82000983, listed 27 December 1982** — verified. **The Article 10 claim
DROPS** for the reasons in §1.

**I reopened this nomination as well**, and it confirms the finder exactly: "The Bush Street–Cottage
Row Historic District comprises 20 residences, a walkway and a small park"; "All these are two-story
frame structures of Italianate or early Stick style, with channel rustic siding, double-hung
windows, and paneled entry recess"; "The only non-residential use is an original small corner
grocery store on the ground floor of a residence" at 2101–2101A Bush; `Specific dates 1874–1882`;
`Builder/Architect T.R.E.A. and C.L. Taylor`; "In September 1874 the company had bought the whole
block west of what is now Cottage Row for $25,250 and… had subdivided the land into 23 lots";
William Hollis (1839–1895).

It adds material the finder missed and which is worth having: TREA sold the 23 lots "for $4,200 to
$6,623 from 16 Jan. to 28 August 1875"; the subdivision ran "three facing Fillmore and ten each
facing Bush and Sutter"; TREA grouped the more expensive houses on Bush and Sutter and the more
economical on Fillmore, and sited the whole next to the horse-car line then running along Bush
Street; architectural services in 1875 came from Silas P. Ford, Superintendent of the company's
Building Department.

**Two deletions.** "The Real Estate Associates (TREA), San Francisco's largest residential housing
developer of the 1870s" is a ranking — **DROP** the clause, keep TREA. And the Planning survey
ratings of "1" and "3" on a 0–5 scale are a ranking — **DROP**, as already ruled.

**One conflict to note:** the nomination's description says "There are no intrusions or
non-contributing structures except two small park shelters and some minor rear garden sheds," while
`m22e-6hkz` scores the district `contributors = 21, non_contrib = 1`. The two do not reconcile.
Another reason not to publish element counts.

The nomination narrative is corroborated a second way. `m22e-6hkz` independently returns
`arch = "C.L Taylor; The Real Estate Assocation"`, `people = "William Hollis"`, `pos_1 = "1874 -
1882"`, `contributors = 21`, `non_contrib = 1`, `total_prop = 22`. That matches the finder's read of
the nomination and is a genuine second source for the builders and the construction dates.

Two cautions. The same row's own description says the residences were "constructed between 1870 and
1885" — **one row, two date ranges.** Cite 1874–1882, which the nomination and `pos_1` agree on.
And **do not publish the element counts as a tally.** "20 residences, a walkway and a small park" is
a count of ordinary things and is fine; "21 contributors and 1 non-contributing" is a count off a
live dataset and is exactly what the standing ban exists for.

The Planning survey ratings of "1" and "3" on a 0–5 scale are a ranking. **DROP.**

**53. Cottage Row, the walk — DROP from Japantown. ESCALATE.** The finder is right that it is the
best thing to walk in the zone. It is also, by the city's address file, in Pacific Heights.

**54. Cottage Row Mini Park — DROP from Japantown.** Verified: `Cottage Row Mini Park | Mini Park |
0.17142016 acres | analysis_neighborhood: Pacific Heights`, no street address in Rec & Park. Both
locators agree. This one is not even a straddler.

**55. Building at 1735–1737 Webster Street — DROP from Japantown. ESCALATE.**
EAS 1737 Webster: **Pacific Heights**, verified. (1735 Webster returns no EAS row.) **NRHP reference
number 73000444, listed 8 March 1973** — verified. **I reopened this nomination too**, and it
confirms the finder line for line: "A two-story and basement wood frame dwelling, designed
originally for a single family, this tall house in the Stick Eastlake Style"; the square bay
"rising over two stories to a crowning gable and steeple"; "connected to the water system in 1876";
"Mr. F. Vollerni was the original owner. Mr. J. J. Volmer was the second owner who resided a few
doors down Turk Street"; "there were three owners up until the San Francisco Redevelopment Agency
purchased the property in 1967. All of the owners were absentee landlords"; "773 Turk will be moved
to Block 677, Lot 2, to become one in a row of handsome Victorian buildings which are to be
rehabilitated."

**The Newsom attribution DROPS — and now on evidence, not suspicion.** I read the whole form: the
Builder/Architect field is blank and no architect is named anywhere. The attribution exists only in
the neighbouring district's nomination. One sentence in a different document is not an attribution.

**"773 Turk is one of the six most important Victorian structures…" DROPS** as a ranking, here and
at candidate 24.

**And a date conflict the finder did not surface.** The same paragraph reads: "The San Francisco
Water Department records show that this building was connected to the water system in 1876. The
Junior League of San Francisco's book *Here Today* puts the date at 'late 1880's'." **The nomination
carries two construction dates and does not choose.** Cite the 1876 water connection as what the
Water Department records show, which is what the document actually asserts — never as the year the
house was built.

**56. Stanyan House, 2006 Bush — DROP from Japantown.** **SF Landmark No. 66, designated 1975** —
verified. EAS Pacific Heights. Unresearched beyond the register row, so there is little to escalate.

**57. Trinity Episcopal Church, 1668 Bush — DROP from Japantown. ESCALATE, awkwardly.**
**SF Landmark No. 65, designated 1974** — verified, and so is the collision: the register also holds
`65 | Trinity Presbyterian Church | 3261 23rd Street | 1984.0`. **Anyone citing Landmark No. 65 must
name the building.** EAS says Western Addition, which is not a rostered zone at all — so this
building falls outside every in-scope page. That is a roster problem, not a Japantown problem, and
the arbitrator should see it.

### 3.7 West of Fillmore — PUBLISH, ESCALATE

**58. Marcus Books and Jimbo's Bop City, 1712–1716 Fillmore — PUBLISH. ESCALATE.**
**SF Landmark No. 266, designated 2014** — verified. EAS on both 1712 and 1716 Fillmore: Japantown,
verified individually. And per §2 there is **no conflict** with Pacific Heights' Fillmore Street
entry, which claims only Bush to Broadway. The finder called this the most consequential straddler
in the file and it is: the Fillmore's African-American heritage anchor sits on ground the city's
address file calls Japantown. It publishes on the evidence. The arbitrator may want it elsewhere,
and should say so explicitly rather than let a boundary decide it silently.

**59. Golden Gate Commandery of the Knights Templar (Macedonia Missionary Baptist Church),
2135 Sutter — PUBLISH. ESCALATE.** **SF Landmark No. 202, designated 1993** — verified. EAS 2135
Sutter: Japantown, verified. Same shape of straddle. Use `historic-site`, not `church`.

**60. Rosa Parks Elementary / JBBP, 1501 O'Farrell — DROP.** EAS returns
`1501 OFARRELL ST | Western Addition`, verified. Outside the polygon and outside every rostered
zone. The JBBP is a genuine Japantown institution on ground that is not Japantown's; that is a fact
for the guide's prose, not a place on its list.

**61. National Urban League, SF Chapter, 2015 Steiner — DROP.** EAS Pacific Heights, verified.
`landmarkno = 0`, verified. No facts beyond an address.

### 3.8 Area-scale entities

**62. Japantown Community & Cultural Historic District — REWRITE, and it is not a place.**
Verified in full: `cr = Eligible`, `nr = Eligible`, `a10 = No`, `a11 = No`, `contributors = 87`,
`pos_1 = 1906 - 1960`, `origin = 2014.1007E / San Francisco Japantown Historic Resources Survey`,
`neighborhood = Western Addition`. The finder is right on every field.

**It is an eligibility finding. It carries no register identifier. It cannot be written as
protection status, and it cannot be a place.** But Planning's own description is the best sourced
narrative in this zone and it belongs in the guide's prose: the Western Addition site was an
established Victorian-era neighbourhood; the 1900 Census showed a concentration of people born in
German-speaking parts of Europe and no Japanese households; after the earthquake San Francisco's
Japanese relocated there in numbers, encouraged by editorials in *Shin-Sekai* predicting rents
would fall as ruined parts of the city were rebuilt; by 1940 the population numbered over 5,000 with
more than 200 Japanese-owned businesses; most buildings are Victorian-era frame structures
pre-dating the Japantown period.

**DROP the "87 contributors" figure.** It is a count off a live dataset that gains rows, which is
the same defect as tallying landmarks. The period of significance, 1906–1960, is a date range and
publishes.

**63. Japantown Cultural District — DROP.** The `cultural_districts: Japantown Cultural District`
stamp on both Asawa rows is real and I verified it. It is a field value, not an instrument. No
resolution, no ordinance, no boundaries. **Do not claim it as a designation.**

**Not places, correctly identified as such:** the Northern California Cherry Blossom Festival ("two
weekends every April"), the Nihonmachi Street Fair ("one weekend in the month of August"), the Osaka
sister-city relationship ("In 1957, San Francisco entered into a sister city relationship with the
city of Osaka", ended by Osaka in 2018) and Japantown Bowl ("founded in 1976", "closed in September
2000"). All four verified in the Japantown article. Good facts for prose.

---

## 4. STRADDLERS ESCALATED TO THE ARBITRATOR

Six, in descending order of consequence.

**(1) The Sutter Street line.** Seventeen candidates north of Sutter, all EAS Pacific Heights,
carrying three of the four National Register listings and both Article 10 landmarks that exist
because the buildings are Japanese-American: the Japanese YWCA (LM 291 / NRHP 100004868), Kinmon
Gakuen (LM 288), the Bush Street Temple (LM 81), the Cottage Row district (NRHP 82000983), 1735–1737
Webster (NRHP 73000444), Stanyan House (LM 66), the JCCCNC and Konko Church. I ruled them out of
Japantown on the locator. **Shipped Pacific Heights claimed none of them, so all are still available
and nothing has to be taken back.** If the arbitrator overturns me, it should say on what locator.

**(2) Marcus Books / Jimbo's Bop City (LM 266) and the Golden Gate Commandery (LM 202).** EAS
Japantown; no guide calls either Japantown. I publish them. The Fillmore Street conflict the finder
feared does not exist. Whether the Fillmore's heritage anchor should sit on Japantown's page is a
judgement above a verifier.

**(3) NJAHS, one organisation in two zones.** Peace Gallery at 1684 Post (Japantown); Military
Intelligence Service Historic Learning Center at 640 Old Mason Street, Crissy Field West
(**Presidio**, unshipped).

**(4) "Buchanan Street Mall," one name for two places.** Osaka Way, the 1700 block in Japantown,
against Rec & Park's `Buchanan St Mall` at 1151 Buchanan stamped "Western Addition, Hayes Valley."
**Hayes Valley is shipped.** I resolved it by renaming mine; the roster draw still uses the
ambiguous phrase and should be corrected.

**(5) Hamilton Rec Center, Western Addition Branch Library and the Bufano at Westside Courts.**
All three stamped Japantown by the city, all three read by everyone else as the Fillmore or Lower
Pacific Heights. Published on the stamp.

**(6) Trinity Episcopal Church (LM 65), 1668 Bush.** EAS Western Addition — a zone that is not on
the roster at all. This landmark currently belongs to no in-scope page. That is a roster gap.

---

## 5. TIER RULING

**GUIDE. 34 surviving places.**

Counted honestly: 24 PUBLISH plus 11 REWRITE is 35 rulings, less candidate 62, which is guide prose
and not a place. Candidate 40 yields one place, not two.

A town-page is the short form — **under six places**, a 90-word intro floor and two outbound links.
Thirty-four is not close to that boundary, and `Ethos.Seeds.SanFranciscoSeedDataTest` fails any file
labelled `town-page` carrying six or more. Wave 1 shipped two files mislabelled this way; do not
make it three.

`guide` therefore binds this file to all of it: at least four places (34, comfortably), an intro of
**100–160 words**, **4–6 FAQ entries**, and a section headed **exactly** `Getting there`. Entries
must be non-empty and every `place_slug` must resolve to a place in the same file, or the seed run
aborts — and seeding is not transactional, so the twelve already-shipped files stay published while
this one does not.

Note what the tier ruling rests on. Thirty-four is a comfortable guide even though I ruled the
entire institutional heart out of the zone. Japantown does not need the north side to reach the
form; it needs it to be the neighbourhood everyone means. Those are different arguments and the
arbitrator should not let the first one settle the second.

**Kind warnings, since there is no `church` kind and Rome lost three places to exactly this:**
Sokoji, the Golden Gate Commandery → `historic-site`. Osaka Way is a Public Works street, not a
Rec & Park park → `attraction`, never `park`. Hamilton Rec Center → `park`. The Western Addition
Branch Library and the Japan Center Garage → `attraction`.

---

## 6. WHAT THE FINDER GOT WRONG

**(1) The merchants' directory does not say what the file says it says.** `sfjapantown.org` lists
**ten** businesses, total. The finder cited it for Books Kinokuniya, Hotel Kabuki and SF76, none of
which are in it, and gave Paper Tree, Nijiya Market and Soko Hardware nothing but an EAS row. An EAS
row establishes that an address exists. It does not establish that a business trades there. **Six
retail candidates dropped on this one defect, plus Kabuki Springs on an unreachable site.**

**(2) A fact that is in no cited source.** "AMC Kabuki 8… Hosts the Northern California Cherry
Blossom Queen Program." I re-fetched both articles the finder cites. Neither contains it.

**(3) The wrong article for the pagoda.** Taniguchi, Murokami's 2000 update and Willie Brown's 2003
rededication are in the *Japan Center* article. The *Japantown* article, cited first, carries only
Taniguchi and the gift from Osaka. And the 2000 update and 2003 rededication belong to the **plaza**,
not the pagoda; the finder merged them.

**(4) It invented a conflict that does not exist.** Pacific Heights' `fillmore-street` entry claims
"the blocks between Bush Street and Broadway." Marcus Books is south of Bush. The finder's §4b
warning that "two shipped zones describe the same pavement" is wrong on the shipped text.

**(5) It misquoted the roster.** The roster draw reads: "The Peace Pagoda and Peace Plaza, the Japan
Center malls, Buchanan Street Mall, the Sundance Kabuki, Konko Church." The finder's quoted draw
adds the JCCCNC, "the Nihonmachi street," and a sentence about the 1906 fire and the wartime
incarceration being "the two events every source treats as central." That sentence is not in the
roster. A research file must not put words in its own brief.

**(6) It left the headline place unresolved when the answer was one hop away.** The finder had the
string "Japantown Peace Plaza Renovation | Construction update, September 2026" and stopped at a
CivicPlus redirect. The full update — dates, detours, fenced seating nooks, the pedestrian route on
the north side of Geary — is on `sfrecpark.org/CivicAlerts.aspx`, in the same feed the string came
from.

**(7) A citation that does not support what it is attached to.** Landmark No. 81 designates Ohabai
Shalome/Bush Street Temple. It does not corroborate Sokoji's occupancy of the building, which rests
on the congregation's own site alone.

**(8) A date the register does not carry.** `97yj-54sx` has `yeardesignated` and no day-level field.
"Kinmon Gakuen, designated 1 November 2019" cannot be cited to it.

**(9) It sent Westside Courts to a private courtyard** with no established public access, on the
strength of a sculpture record.

**(10) It carried three superlatives out of the nominations without flagging them.** "One of the six
most important Victorian structures chosen by the San Francisco Landmarks Preservation Advisory
Board" (it softened this to "one of six… as having exceptional merit", which is the same ranking
with the adjective removed, and attached it to the wrong nomination), TREA as "San Francisco's
largest residential housing developer of the 1870s", and the 1976 Planning survey's 0–5 ratings.
All three drop.

**(11) It missed a date conflict inside 73000444.** The nomination gives the 1876 water connection
*and* the Junior League's "late 1880's" in consecutive sentences. A guide that writes "built in
1876" states something its own source declines to state.

**And what it got right, which is most of it.** All three data traps are real and I reproduced all
three independently. Forty zero-rows, exactly. Wikipedia's Landmark 245 for the Japanese YWCA is
wrong and the correct number is 291. The Buchanan Street Mall name genuinely denotes two places a
mile apart, one of them Hayes Valley's. Its refusal of the unverified 2026 NR listing, of the
"first independent Japanese YWCA" superlative, of the 1934 and 1930 founding years and of the Article
10 date on Cottage Row were all correct, and on the last of those I was able to turn its suspicion
into evidence: `origin = "National Register"`. **All nine Article 10 numbers and all four National
Register references survived re-fetching against the live registers** — every landmark number to
the right building and year, every NRHP reference to the right certification date. Its three
nomination transcriptions, which I could not check when I first ruled on them, turned out to be
accurate line for line once I got the PDFs open. The only designation error in the file is a day it
took from Wikipedia rather than the register. That is a better record than wave 1 managed.
