# Japantown — Finder's Research File

Zone: `japantown` · destination `Japantown, California` · town `San Francisco`
Roster draw: "The Peace Pagoda and Peace Plaza, the Japan Center malls and the Buchanan Street
Mall, the Kabuki cinema, Konko Church, the Japanese Cultural and Community Center, the Nihonmachi
street. The 1906 fire and the wartime incarceration are the two events every source treats as
central."

Compiled 2026-09-03. Everything below is candidate material for a verifier and an arbitrator.
Nothing here is an ownership ruling. Straddlers are flagged, never resolved.

---

## 0. RESERVATION CHECK — and the same tooling defect Hayes Valley found

`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only. It cannot see the twelve
shipped San Francisco files. I ran the corpus-wide scanner instead:

    python3 .superpowers/vf_taken_all.py japan nihonmachi pagoda buchanan kabuki geary \
        fillmore sutter post webster laguna octavia konko cathedral peace
    → 4,389 places across 349 files

**Result: Japantown is almost entirely unclaimed.** Two collisions and one near-miss:

| Slug already owned | Owner | Effect on me |
|---|---|---|
| `madame-c-j-walker-house-pacific-heights` | pacific-heights.json | **TAKEN.** 2066 Pine St, SF Landmark No. 211. I do not claim it. |
| `fillmore-street-pacific-heights` | pacific-heights.json | Pacific Heights owns *Fillmore Street as a street*. My Fillmore-frontage candidates are buildings, not the street — but see §4. |
| `webster-street-historic-district-pacific-heights` | pacific-heights.json | Different district (2000–2100 Webster, far north). **Not** the Bush Street–Cottage Row district and **not** the NRHP "Building at 1735–1737 Webster Street." Name-similarity trap for the arbitrator. |

Pacific Heights claimed **no** Japanese-American institution: no Konko Church, no Kinmon Gakuen,
no Bush Street Temple, no Cottage Row, no Japanese YWCA, no JCCCNC. All of those are free — and
all of them sit in Pacific Heights by the city's own address data. That is §4, and it is the
central problem in this zone.

Checked against the seven Oracle Park code-seed slugs: no collision.

---

## 1. HOW I ESTABLISHED WHICH ZONE EACH PLACE IS IN

**Japantown is one of San Francisco's 41 official Analysis Neighborhoods.** Confirmed against
`j2bu-swwd` — the list contains `Japantown` alongside `Pacific Heights`, `Western Addition`,
`Presidio` and the rest. That is unusual luck: most vernacular districts have no official polygon.
It also turns out to be a trap, because the official polygon and the Japantown every source
describes are not the same shape.

Three locators, recorded where they disagree:

**(a) DataSF Enterprise Addressing System — `3mea-di5p`.** Per-address, parcel-exact. Every SF
address carries the city's Analysis Neighborhood in `nhood`. This is my primary locator.

**(b) The `analysis_neighborhood` stamp** carried on DataSF's Rec & Park properties (`gtr9-ntp6`)
and Civic Art Collection (`r7bn-7v9c`) rows — independent of (a), computed from geometry.

**(c) Nominatim** reverse lookup for the vernacular reading. **This one failed.** Nine reverse
lookups all returned HTTP 429; the endpoint is rate-limited, presumably by the other ten finders
in this wave. I have two official locators and no vernacular locator, so for (c) I substituted the
*stated* boundaries in Planning's own Japantown historic-district record and in general reference.

### The Japantown polygon, read out of the address file

Every EAS address stamped `nhood='Japantown'` — 546 of them — falls on these streets:

| Street | Count | Address range in Japantown |
|---|---|---|
| POST | 177 | 1400–2492 |
| SUTTER | 157 | 1501–2593 |
| FILLMORE | 34 | 1601–1761 |
| GEARY | 29 | 1400–2398 |
| BUCHANAN | 21 | 1705–1762 |
| BRODERICK | 37 | 1405–1565 |
| BAKER | 16 | 1322–1464 |
| STEINER | 15 | 1640–1777 |
| LAGUNA | 13 | 1603–1691 |
| DIVISADERO | 10 | 1501–1661 |
| WEBSTER | 10 | 1580–1650 |
| PIERCE | 8 | 1625–1637 |
| SCOTT | 5 | 1515–1658 |
| GOUGH | 4 | 1333–1407 |
| OCTAVIA | 1 | 1544 |
| plus AVERY, ERKSON, GARDEN, HEMLOCK | 9 | — |

**BUSH STREET DOES NOT APPEAR. Not one address.** Nor does PINE.

So the city's Japantown is a long thin band running Sutter-to-Geary, from Gough all the way west
to Baker — most of a mile — and it stops dead at the Sutter Street centreline on the north.
General reference gives the neighbourhood as "Post Street between Fillmore and Laguna, northern
border Bush or Pine, southern border Geary" — roughly six blocks. The two readings share the
Japan Center and disagree about everything else, in *both* directions:

- the official polygon **excludes** the Bush Street institutions every guide calls Japantown;
- the official polygon **includes** eight blocks of the Fillmore that no guide calls Japantown.

**I have not resolved this. It is the single most consequential thing on this page for the
arbitrator, and it is §4.**

---

## 2. THE THREE DATA TRAPS I HIT — read before writing a single designation claim

### TRAP 1 — Forty rows in the Article 10 landmark dataset are NOT landmarks

`97yj-54sx` is titled "Landmarks Listed in Article 10 of the San Francisco Planning Code." It
holds 370 rows. **Forty of them carry `landmarkno = "0"` and `yeardesignated = "0.0"`.** Those are
not designated landmarks. Four of them are in or beside my zone:

| Row in the landmark dataset | Address | `landmarkno` |
|---|---|---|
| **Peace Pagoda / Plaza** | 1610 Geary Bl | **0** |
| **Japanese American Citizen League** | 1765 Sutter St | **0** |
| **Western Addition Branch Library** | 1900 Geary Boulevard | **0** |
| **National Urban League, SF Chapter** | 2015 Steiner St | **0** |

The company they keep in the zero-block is unmistakable — Black Cat Cafe, Mattachine Society
Headquarters, the Pan American Unity mural, Far East Cafe, Kezar Stadium, Glide Memorial. That is
Planning's designation *work programme*, riding in the same layer as the finished designations.

**Consequence: the Peace Pagoda is not a designated landmark, and neither is the Peace Plaza.**
Anybody who greps this dataset for "Peace Pagoda" and writes "a designated landmark" has published
a false claim from an authoritative-looking source. The two anchor sites of this entire zone carry
no protection number at all.
Source: <https://data.sfgov.org/resource/97yj-54sx.json?$where=landmarkno='0'&$limit=200>

### TRAP 2 — Wikipedia gives the Japanese YWCA the wrong landmark number

The Wikipedia article states "San Francisco Designated Landmark No. 245, designated April 30,
2021." I re-fetched the register:

    LM 245  The New Mission Theater        2550 Mission Street   2004
    LM 291  Japanese YWCA/Issei Women's Building  1830 Sutter Street  2021

**Landmark No. 245 is the New Mission Theater, designated 2004.** The Japanese YWCA is
**Landmark No. 291**, designated 2021. Wave 1's reviewers caught one wrong certification date by
re-fetching; this is the same failure mode in a different field. Do not take a landmark number
from an encyclopedia.
Source: <https://data.sfgov.org/resource/97yj-54sx.json?$limit=1000>

### TRAP 3 — "Buchanan Street Mall" names two different places a mile apart

The Rec & Park property register has exactly one **Buchanan St Mall**: 1151 Buchanan St, 1.97
acres, `analysis_neighborhood` = **"Western Addition, Hayes Valley"**. That is the landscaped
median south of Geary, between Eddy and Grove. It is **not** the pedestrianised 1700 block of
Buchanan in Japantown that carries the Asawa fountains and the cherry trees — that block is a
Public Works street, not a park, and it appears in no park register.

The roster draw says "the Buchanan Street Mall." Both readings are defensible; they are different
places; one of them belongs to Hayes Valley's zone by the city's own stamp. **Flagged, not
resolved.** My candidate is the Japantown block, and I name it by its address range and by
Osaka Way rather than by the ambiguous phrase.
Source: <https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>

---

## 3. CANDIDATES

Zone column: **EAS** = per-address `nhood` from `3mea-di5p`. **stamp** = `analysis_neighborhood`
on a Rec & Park or Civic Art row. Every straddler is marked ⚠ and listed again in §4.

### 3.1 The Peace Plaza and the Japan Center — the uncontested core

**1. Japantown Peace Plaza** — civic plaza, 1610 Geary Blvd.
Recreation & Park property, propertytype "Civic Plaza or Square", **0.80 acres**. EAS: Japantown.
stamp: Japantown. ⚠ **Currently under construction.** The Rec & Park capital-projects feed carries
"Japantown Peace Plaza Renovation | Construction update, September 2026." I could not open the
project page — it sits behind a CivicPlus identity-server redirect — so I have the existence of
the renovation and none of its scope or dates. **A guide that describes this plaza as walkable
today may be wrong. Verifier must resolve before this ships.**
<https://data.sfgov.org/resource/gtr9-ntp6.json?$limit=3000>

**2. San Francisco Peace Pagoda** — five-tiered concrete stupa, in the Peace Plaza.
Designed by the Japanese architect **Yoshirō Taniguchi**; a gift from Osaka. Taniguchi designed
the plaza itself; the pagoda was updated in 2000 by **Kenji Murokami** and rededicated by Mayor
Willie Brown in 2003. **NOT a designated landmark — see Trap 1.**
<https://en.wikipedia.org/wiki/Japantown,_San_Francisco> ·
<https://en.wikipedia.org/wiki/Japan_Center_(San_Francisco)>
*Photo note for the later wave: this is a stupa, an architectural structure, not a sculpture.
Different footing from the Asawa fountains. Say nothing about it in prose.*

**3. Japan Center** — the complex. Opened **March 1968**. Architecture by **Minoru Yamasaki**,
plans drafted by **Van Bourg/Nakamura**, interiors by **Takenaka & Associates of Osaka**.
<https://en.wikipedia.org/wiki/Japan_Center_(San_Francisco)>

**4. Japan Center West** (formerly Kintetsu Mall) — 1581 Webster St. EAS: Japantown.
Acquired 2020 by 3D Investments. Same source.

**5. Japan Center East** (formerly Miyako Mall) — 1737 Post St. EAS: Japantown. Same owner, same
source.

**6. Kinokuniya Building** — 1825 Post St. EAS: Japantown. Owned by Kinokuniya Book Stores of
America — the one part of the complex still in the original kind of hands. Same source.

**7. The Webster Street Bridge / Bridge of Shops** — the enclosed span over Webster Street joining
the two malls. Structural steel supplied by U.S. Steel's American Bridge Division, South San
Francisco. Same source. *A physical adjoining structure, which the orientation rule permits.*

**8. Books Kinokuniya** — bookshop, 1581 Webster St. EAS: Japantown.
<https://www.sfjapantown.org/>

**9. AMC Kabuki 8** — cinema, 1881 Post St. EAS: Japantown. The roster's "Kabuki cinema." Hosts
the Northern California Cherry Blossom Queen Program.
<https://en.wikipedia.org/wiki/Japantown,_San_Francisco>

**10. Hotel Kabuki** — 1625 Post St. EAS: Japantown. I could **not** reach an operator page: the
JdV URL 301s to a Hyatt brand landing page. Address confirmed by EAS and by the Japantown
merchants' directory, which lists the restaurant **Nari** at the same address.
<https://www.sfjapantown.org/>

**11. Kabuki Springs & Spa** — 1750 Geary Blvd. EAS: Japantown. Own site returned HTTP 403; the
address is EAS-confirmed. Communal-bath schedule unverified — do not write it.

**12. Japan Center Garage** — 1596 and 1620 Post St. EAS: Japantown. City-owned parking under the
complex. Thin, but it is a real place with a real address.

**13. San Francisco Go Club** — 22 Peace Plaza #501. Listed in the merchants' directory. Note
that "22 Peace Plaza" returns **no EAS row** — Peace Plaza suite addresses are not in the address
file. Locate by the plaza, not by the number.
<https://www.sfjapantown.org/>

### 3.2 The Buchanan block

**14. Buchanan Street Mall / Osaka Way** — the pedestrianised 1700 block of Buchanan St between
Post and Sutter. EAS Buchanan addresses in Japantown run **1705–1762**, which is exactly this
block and nothing else. One block of Buchanan was renamed **Osaka Way on 8 September 2007**.
⚠ **Name collides with the Rec & Park Buchanan St Mall at 1151 Buchanan (Western Addition, Hayes
Valley) — see Trap 3.**
<https://en.wikipedia.org/wiki/Japantown,_San_Francisco> · EAS `3mea-di5p`

**15. Ruth Asawa, *Origami Fountain*** (accession **1999.22.1**) — bronze on bricks, 1999,
**78 × 96 × 96 in.** Located at 1731 Buchanan St, "in the space between 1731 and 1740 Buchanan,
closer to Sutter Street." Commissioned by the Redevelopment Agency. Civic-art stamp: Japantown;
also stamped `cultural_districts: Japantown Cultural District`.

**16. Ruth Asawa, *Origami Fountain*** (accession **1999.22.2**) — bronze on bricks, 1999,
**78 × 44 × 44 in.** At 1707 Buchanan St, "in middle of Buchanan pedestrian walkway, between Post
and Sutter St., closer to Post St." Same commission, same stamps.
Both: <https://data.sfgov.org/resource/r7bn-7v9c.json?$limit=6000>
*Photo note: sculptures. 17 USC 120(a) does not reach them. Write about them; do not explain why
there is no photograph.*

**17. Paper Tree** — origami and paper shop, 1743 Buchanan St. EAS: Japantown.
**18. Nijiya Market** — grocer, 1737 Buchanan St. EAS: Japantown.
**19. Hinodeya Ramen Bar** — 1737 Buchanan St. EAS: Japantown. <https://www.sfjapantown.org/>
**20. Benkyodo** — 1747 Buchanan St. EAS: Japantown. ⚠ **Reported closed in 2021 and I could not
confirm current status from any source I reached.** If it is shut it is not a place. Low confidence.
**21. SF76** — 1758 Buchanan St. EAS: Japantown. A pop-up venue per the merchants' directory;
probably too ephemeral to ship. <https://www.sfjapantown.org/>

### 3.3 Post and Sutter, inside the official polygon

**22. National Japanese American Historical Society — Peace Gallery & Archives** — 1684 Post St.
EAS: Japantown. A storefront gallery and archive. ⚠ NJAHS also runs the **Military Intelligence
Service Historic Learning Center, Building 640, Crissy Field West, Presidio of San Francisco** —
**a straddler with the Presidio zone.** One organisation, two premises, two zones. Flagged.
Hours not stated on the site; do not write hours.
<https://www.njahs.org/about>

**23. Japanese American Citizens League building / Nichi Bei Kai** — 1765 Sutter St.
EAS: Japantown. Appears in the Article 10 layer with `landmarkno = 0` — **not designated**, see
Trap 1. It is on Planning's designation work programme, which is a fact about a pending process
and reads to me like exactly the kind of thing the "no editorial decisions" rule wants kept out.

**24. Building at 1813–1813B Sutter Street** — **National Register of Historic Places, reference
number 73000443, listed 8 March 1973.** EAS: Japantown. The full nomination reads:

- originally **1624 Post Street**; Italianate; narrow two-storey wood-frame single-family dwelling;
- San Francisco Water Department records show it connected to the water system in **1876**;
- original owner Mr. or Ms. **Gantzer**, who lived at 417 Kearny Street; built as rental property;
  six owners followed before the San Francisco Redevelopment Agency bought it;
- it survived the 1906 earthquake and fire;
- earlier uses included a **bonsai store**, and at nomination it was in use as a Japanese church;
- it was **moved one block**, to Block 685 Lot 30, into "a row of extremely handsome Italianate
  Victorians on Sutter near Buchanan";
- 1,679 sq ft; nomination prepared by **Enid T. Sales** and **Susan Bragstad**, San Francisco
  Redevelopment Agency, 9 January 1973; Keeper's entry 3/8/73.

<https://npgallery.nps.gov/NRHP/GetAsset/NRHP/73000443_text> ·
NPS nrhp_locations layer, RESNAME "Building at 1813--1813B Sutter Street"

**25. Sokoji Soto Zen Mission** — 1691 Laguna St. EAS: Japantown. The congregation's own site
gives founding 8 December 1934, the former home at 1881 Bush Street, the 1942 closure and 1948
reopening, **Shunryu Suzuki** assigned in 1959 and establishing a zazen practice for
non-Japanese-speaking members in 1961, and the move to Laguna Street in **April 1984** after four
years of construction. ⚠ **The 1934 founding is an operator's own trading-duration claim and does
not publish under the rules.** The Bush Street address and the 1984 move are facts about
buildings, corroborated by Landmark No. 81's designation of 1881 Bush; those look publishable.
<http://www.sokoji.org/about-us>

**26. Soko Hardware** — 1698 Post St. EAS: Japantown.
**27. San Wang Restaurant** — 1674 Post St. **28. 3 Pillars** (gallery/merchandise) — 1630 Post St.
**29. Animon Life** — 1737 Post St #305. **30. Katachi** — 1737 Post St #326.
**31. Tokaido Arts** — 1581 Webster St #203. **32. On The Bridge** — 1581 Webster St #206.
**33. Yakitori Edomasa** — 1581 Webster St #270. **34. Nari** — 1625 Post St.
All from <https://www.sfjapantown.org/>, all inside the EAS Japantown ranges. These are a
merchant directory, not history; the verifier should cut hard.

### 3.4 Hamilton — a real park nobody put on the roster

**35. Hamilton Recreation Center** — 1900 Geary Blvd. Recreation & Park, "Neighborhood Park or
Playground", **3.65 acres**. EAS: Japantown. stamp: Japantown. The civic-art record locates it
"bounded by Geary Blvd., Steiner St., and Post St."

**36. Mary E. Erckenbrack, *Ceramic Mural on Athletics***, 1955, accession **1955.21**. Carved and
glazed ceramic, **300 × 192 × 1½ in.**, on the **Post Street external facade**.

**37. Horace Washington, untitled**, 2009, accession **2014.147.a-i**. Glazed ceramic tile and
glass, **48 × 1560 × 404 in.**, exterior upper facade. Commissioned by the Arts Commission for
Hamilton Recreation Center.

**38. Johanna Poethig, *Celebrate Ability***, 2013, accession **2014.146.a-f**. Hand-painted
ceramic tile and Byzantine glass smalti mosaic, roundels **48 in. diameter**, inside the main hall.
All three: <https://data.sfgov.org/resource/r7bn-7v9c.json?$limit=6000>

**39. Western Addition Branch Library** — 1550 Scott St. Rec & Park property, 0.90 acres,
stamp: **Japantown**. EAS on 1550 Scott: **Japantown**. ⚠ **Address discrepancy:** the Article 10
layer lists a "Western Addition Branch Library" at **1900 Geary Boulevard** — which is Hamilton
Rec Center's address, not the library's. Two city datasets disagree. The Rec & Park address is
the one that survives an EAS lookup. Flagged.

**40. Westside Courts** — public housing, 2501 Sutter St. Civic-art stamp: **Japantown**; the same
record's own prose says "**Lower Pacific Heights**, Westside Courts Housing Project, Central
Courtyard; bordered by Sutter, Broderick, Baker and Post Streets." A dataset contradicting itself
in one row. Holds **Beniamino Bufano, *Horse and Rider (St. Francis on Horseback)***, 1935,
granite, **164 × 62 × 26 in.**, accession **1942.13**, created for the Works Progress
Administration. ⚠ Straddler, and a private residential courtyard — public access is unestablished.
Low confidence as a guide entry; high value as a fact.

### 3.5 North of Sutter — the whole institutional heart, all of it officially Pacific Heights

Every entry in this block is ⚠. See §4.

**41. Japanese YWCA / Issei Women's Building** — 1830 Sutter St. EAS: **Pacific Heights**.
- **San Francisco Landmark No. 291, designated 2021.** (NOT 245 — see Trap 2.)
- **National Register of Historic Places, reference number 100004868, listed 10 January 2020.**
- Architect **Julia Morgan**, who donated her design services; the building opened in **1932**.
- Founded 1912 by Issei women excluded from the segregated YWCA. Because the Alien Land Law
  barred Asian property ownership, the San Francisco YWCA bought and held the property in trust.
- Closed 1942 under Executive Order 9066. Leased to the American Friends Service Committee
  1943–1959; CORE and the Mattachine Society used it, the latter holding a convention there in
  1954. **Nihonmachi Little Friends**, a Japanese-English bilingual childcare centre, has occupied
  it since 1985 and bought it after a 2002 settlement of the 1996 sale dispute.
- ⚠ Wikipedia calls it "the first independent Japanese YWCA in the United States" — **a superlative,
  banned from any source.** Drop it.
<https://en.wikipedia.org/wiki/Issei_Women%27s_Building> ·
`97yj-54sx` LM 291 · NPS nrhp_locations RESNAME "Japanese YWCA", CertDate 01/10/20

**42. Japanese Cultural and Community Center of Northern California** — 1840 Sutter St.
EAS: **Pacific Heights**. Planning began **1971** under the Redevelopment Agency's **Nihonmachi
Master Plan**; a $3 million "Vision 80's" capital campaign began **1982**, led by Mayor **Dianne
Feinstein** and **Yori Wada**; Phase I completed **1986**; the gymnasium/community hall, Phase II,
began construction **1988**. Now houses Kimochi, Inc. and the Japanese Community Youth Council
among others, with classrooms and a gymnasium/community hall.
<https://www.jcccnc.org/about/history/> · <https://www.jcccnc.org/about/>

**43. Kimochi, Inc.** — senior services, inside the JCCCNC at 1840 Sutter St. Same source. Ships
only if the arbitrator wants tenants as separate places; probably folds into 42.

**44. Kinmon Gakuen (Golden Gate Institute)** — 2031 Bush St. EAS: **Pacific Heights**.
**San Francisco Landmark No. 288, designated 2019.** Wikipedia narrows the date to 1 November 2019
and adds: the school opened in 1911 with 133 students; it was forced to close during the Second
World War and could not reopen until 1949; Emperor Hirohito visited in 1933 and 1935, and Crown
Prince Akihito with Crown Princess Michiko in 1960. ⚠ Wikipedia also asserts a **2026 National
Register listing**; that listing does **not** appear in the NPS `nrhp_locations` layer I queried,
which may lag. **Unverified — do not publish the NR claim.** The Landmark No. 288 claim is solid.
`97yj-54sx` · <https://en.wikipedia.org/wiki/Kinmon_Gakuen>
I did not obtain the building's construction year or architect; 1911 is the institute's founding,
not the building's. Verifier should chase LM288.pdf — the PDF exceeded the fetch size limit for me
at <https://sfplanninggis.org/docs/landmarks_and_districts/LM288.pdf>.

**45. Ohabai Shalome / Bush Street Temple** — 1881 Bush St. EAS: **Pacific Heights**.
**San Francisco Landmark No. 81, designated 1976.** Built as a synagogue; Sokoji Soto Zen Mission's
home until its 1984 move to Laguna Street — which makes this one building the hinge between the
Jewish Western Addition and Japanese Nihonmachi, and the single best-documented such hinge I found.
`97yj-54sx` · <http://www.sokoji.org/about-us>

**46. Konko Church of San Francisco** — 1909 Bush St. EAS: **Pacific Heights**. The roster names
it. Its own site gives the address and says the church has served since 1930, and states nothing
about the building. ⚠ The 1930 date is an operator's own trading-duration claim and does not
publish. **I found no architect, no construction year and no designation for this building.**
The roster asked for it and I can barely furnish it. Low confidence — §6.
<https://www.konkosf.org/>

**47. Buddhist Church of San Francisco** — 1881 Pine St. EAS: **Pacific Heights**. Both the
congregation's site and the encyclopedia article 404'd for me. Address confirmed by EAS only.
**No sourced facts beyond location.** Low confidence — §6.

**48. Christ United Presbyterian Church** — 1700 Sutter St. EAS: **Pacific Heights**. Unresearched.
**49. St. Francis Xavier Catholic Church** — 1801 Octavia St. EAS: **Pacific Heights**. Unresearched.
**50. Pine United Methodist Church** — 1298 Pine St. **No EAS row at that number** — the address
needs an independent locator before anyone assigns it a zone.
**51. Super Mira Market** — 1790 Sutter St. EAS: **Pacific Heights**.

### 3.6 Cottage Row — one district, four registers, and the wrong neighbourhood

**52. Bush Street–Cottage Row Historic District** — 2101–2125 Bush St, 1–6 Cottage Row, and
1940–1948 Sutter St. EAS on 2101 Bush, 2125 Bush and 1948 Sutter: **Pacific Heights**, all three.

- **National Register of Historic Places, reference number 82000983, entered 27 December 1982.**
  SHPO certification 9 November 1982; nomination prepared by **Anne Bloomfield**, 6 August 1982.
- **Article 10 landmark district** (`m22e-6hkz`: `a10 = "Listed"`, `nr = "Listed"`, Appendix K).
  ⚠ **DataSF gives the Article 10 adoption date as 1982-12-27 — byte-identical to the National
  Register entry date.** Two different governments do not designate on the same day by accident;
  this looks like a copied field. **I could not verify the local ordinance number or date** — the
  amlegal code library returned HTTP 403 on both the Appendix K URL and the Article 10 index.
  Cite the National Register reference number, which I verified twice. Treat the Article 10
  district date as unverified.
- Contents, from the nomination itself: **20 residences, a walkway and a small park**, on **1.2
  acres**; construction dates **1874–1882**; builders **The Real Estate Associates (TREA)** and
  **C. L. Taylor**; all two-storey frame structures, Italianate or early Stick, channel rustic
  siding, double-hung windows, panelled entry recess; the only non-residential use is an original
  small corner grocery on the ground floor of a residence at 2101–2101A Bush.
- TREA bought the whole block west of what is now Cottage Row in September 1874 for $25,250 and
  subdivided it into 23 lots. Its president was **William Hollis** (1839–1895). Taylor put up
  2101–2107 Bush in 1874 and 2109–2111 Bush with 1–6 Cottage Row in 1882; the 1882 work was
  announced in *The California Architect & Building News* as built by **Thomas Nash** for Taylor,
  with 2109–2111 to the design of **Taylor & Copeland**.
- The Planning Department's 1976 architecture survey rated the two Sutter Street houses "1" and
  the 2101 Bush group and Cottage Row "3" on a 0–5 scale.

<https://npgallery.nps.gov/NRHP/GetAsset/NRHP/82000983_text> ·
<https://data.sfgov.org/resource/m22e-6hkz.json?$limit=300> ·
NPS nrhp_locations, RESNAME "Bush Street-Cottage Row Historic District", CertDate 12/27/82

**53. Cottage Row (the walk)** — "from Sutter to Bush Street, ending between 2107–2109 Bush and
2115 Bush: bricked and landscaped pathway, recently re-bricked, large cypress tree." That is
contributing element 19 of the district, verbatim from the nomination. A pedestrian lane, and the
best single thing to walk in this zone.

**54. Cottage Row Mini Park** — Recreation & Park, **0.17 acres**, stamp: **Pacific Heights**;
Rec & Park carries no street address for it. The 1982 nomination lists it as **non-contributing**
element 20, "Mini Park (ca. 1942 Sutter Street): trees, gravel, ground cover, grass, chain link
fence, two small three-sided wood shelters with benches, drinking fountain, barbecue, former site
of a house essentially identical with Nos. 21–22." ⚠ Straddler.

**55. Building at 1735–1737 Webster Street** — **National Register of Historic Places, reference
number 73000444, listed 8 March 1973.** EAS on 1737 Webster: **Pacific Heights**. From the
nomination:

- originally **773 Turk Street**; a two-storey-and-basement wood-frame dwelling in the
  **Stick-Eastlake** style, square bay rising over two storeys to a crowning gable and steeple;
- connected to the water system in **1876**; original owner **Mr. F. Vollerni**, second owner
  **Mr. J. J. Volmer** who lived a few doors down Turk Street; every owner an absentee landlord;
- bought by the **San Francisco Redevelopment Agency in 1967**; zoning in the project area meant
  it had to be demolished or moved; it was moved to **Block 677, Lot 2** — Webster Street near
  Bush — "to become one in a row of handsome Victorian buildings which are to be rehabilitated";
- one of six Victorian structures the San Francisco Landmarks Preservation Advisory Board picked
  as having exceptional merit.
- The Cottage Row nomination adds the attribution: "A moved Victorian, 1737 Webster **by the
  Newsoms** and already on the National Register, adjoins the District to the southeast."
  ⚠ That attribution appears in the 1982 district nomination and **not** in the building's own
  1973 nomination, which names no architect. One source, moderate confidence.

<https://npgallery.nps.gov/NRHP/GetAsset/NRHP/73000444_text> ·
<https://npgallery.nps.gov/NRHP/GetAsset/NRHP/82000983_text>

**56. Stanyan House** — 2006 Bush St. **San Francisco Landmark No. 66, designated 1975.**
EAS: **Pacific Heights**. Unresearched beyond the register row. `97yj-54sx`

**57. Trinity Episcopal Church** — 1668 Bush St. **San Francisco Landmark No. 65, designated
1974.** EAS: **Western Addition**. ⚠ Three-way straddler: Japantown by vernacular, Western
Addition by EAS, and Pacific Heights owns the streets either side. `97yj-54sx`
*Careful: `97yj-54sx` holds two different LM 65 rows — Trinity Episcopal at 1668 Bush (1974) and
"Trinity Presbyterian Church" at 3261 23rd Street (1984). The register reuses the number. Anybody
citing "Landmark No. 65" must say which building.*

### 3.7 West of Fillmore — inside the official polygon, outside every guide

**58. Marcus Books and Jimbo's Bop City** — 1712–1716 Fillmore St. **San Francisco Landmark No.
266, designated 2014.** EAS: **Japantown**. ⚠ This is the Fillmore's African-American heritage
anchor — a bookshop and the site of the Bop City jazz club — and the city's address file puts it
in Japantown. No guide does. The most consequential single straddler in this file.
`97yj-54sx`

**59. Golden Gate Commandery of the Knights Templar (Macedonia Missionary Baptist Church)** —
2135 Sutter St. **San Francisco Landmark No. 202, designated 1993.** EAS: **Japantown**.
⚠ Same problem: officially Japantown, vernacularly Lower Pacific Heights / the Fillmore. `97yj-54sx`

**60. Rosa Parks Elementary School** — 1501 O'Farrell St. EAS: **Western Addition**. Houses the
**Japanese Bilingual Bicultural Program (JBBP)** — a Japantown institution on Western Addition
ground. ⚠ Straddler.
<https://en.wikipedia.org/wiki/Japantown,_San_Francisco>

**61. National Urban League, San Francisco Chapter** — 2015 Steiner St. EAS: **Pacific Heights**.
In the Article 10 layer with `landmarkno = 0` — **not designated**, Trap 1.

### 3.8 Area-scale entities — handle with care

**62. Japantown Community & Cultural Historic District** — from `m22e-6hkz`, objectid 104.
`cr = "Eligible"`, `nr = "Eligible"`, `a10 = "No"`, `a11 = "No"`. **87 contributors.** Period of
significance **1906–1960**. Origin: case **2014.1007E**, the San Francisco Japantown Historic
Resources Survey. Planning's own description supplies the best sourced narrative of the zone I
found anywhere:

> "the Western Addition site of the present Japantown was an established Victorian-era
> neighborhood… The 1900 Census shows a concentration of persons born in German speaking parts of
> Europe in the area… There were no Japanese households in the area at that time. However,
> immediately after the earthquake, San Francisco's Japanese relocated here in significant
> numbers. This process was recorded and encouraged by editorials in the publication *Shin-Sekai*
> (The New World) which predicted that rents in the area would soon be forced down as ruined parts
> of the city were rebuilt… By 1940, the Japanese population of Japantown… numbered over 5,000 —
> with more than 200 Japanese-owned businesses… Physically, most buildings are Victorian-era frame
> structures that pre-date the Japantown period."

⚠ **This is an eligibility determination, not a designation. It has no register identifier.** Under
the designation rule it cannot be written as protection status. The *Shin-Sekai* detail, the 1900
Census finding and the 1940 figures are facts about the place and look publishable.
`neighborhood` field on this row reads "Western Addition" — a fourth official body giving
Japantown a different name. <https://data.sfgov.org/resource/m22e-6hkz.json?$limit=300>

**63. Japantown Cultural District** — appears as a stamped value in DataSF's civic-art
`cultural_districts` field on both Asawa fountains. **I did not obtain the designating resolution
or ordinance, or the boundaries.** sf.gov returned 404 on every cultural-districts URL I tried.
Unverified. Do not claim it as a designation.

**Not places, listed so nobody mistakes them for places:** the Northern California Cherry Blossom
Festival (two weekends every April), the Nihonmachi Street Fair (one weekend in August), the
Osaka sister-city relationship established 1957 and ended by Osaka in 2018, and Japantown Bowl
(1976–2000, demolished for housing).

**Candidate count: 63.**

---

## 4. BOUNDARY WORK — the finding the arbitrator most needs

**The official Japantown polygon and the Japantown of every source are two different shapes, and
neither contains the other.**

### 4a. The north edge: Sutter Street splits the institutional heart from the shopping heart

The EAS puts the Sutter Street centreline at the Japantown/Pacific Heights line for part of its
run, and the effect is that **the malls are in Japantown and the institutions are not**:

| Place | Address | EAS `nhood` |
|---|---|---|
| Peace Plaza, Peace Pagoda | 1610 Geary Blvd | **Japantown** |
| Japan Center East / West, Kinokuniya | 1737 / 1581 Post & Webster | **Japantown** |
| AMC Kabuki 8, Hotel Kabuki | 1881 / 1625 Post St | **Japantown** |
| Buchanan Mall, Asawa fountains | 1707–1762 Buchanan St | **Japantown** |
| NJAHS Peace Gallery | 1684 Post St | **Japantown** |
| JACL / Nichi Bei Kai | 1765 Sutter St | **Japantown** |
| Building at 1813–1813B Sutter (NRHP 73000443) | 1813 Sutter St | **Japantown** |
| Sokoji Soto Zen Mission | 1691 Laguna St | **Japantown** |
| — | — | — |
| **Japanese YWCA / Issei Women's Building** (LM 291, NRHP 100004868) | 1830 Sutter St | **Pacific Heights** |
| **JCCCNC** | 1840 Sutter St | **Pacific Heights** |
| Christ United Presbyterian Church | 1700 Sutter St | **Pacific Heights** |
| Super Mira Market | 1790 Sutter St | **Pacific Heights** |
| **Konko Church** | 1909 Bush St | **Pacific Heights** |
| **Kinmon Gakuen** (LM 288) | 2031 Bush St | **Pacific Heights** |
| **Ohabai Shalome / Bush Street Temple** (LM 81) | 1881 Bush St | **Pacific Heights** |
| **Buddhist Church of San Francisco** | 1881 Pine St | **Pacific Heights** |
| **Bush Street–Cottage Row HD** (NRHP 82000983) | 2101–2125 Bush | **Pacific Heights** |
| **Building at 1735–1737 Webster** (NRHP 73000444) | 1737 Webster St | **Pacific Heights** |
| Stanyan House (LM 66) | 2006 Bush St | **Pacific Heights** |
| Cottage Row Mini Park | — | **Pacific Heights** (stamp) |
| Trinity Episcopal Church (LM 65) | 1668 Bush St | **Western Addition** |

Note what is on the wrong side of that line: **three of the four National Register listings, and
the two Article 10 landmarks that exist because the buildings are Japanese-American** — the YWCA
and Kinmon Gakuen. Take the official boundary literally and Japantown ships a shopping mall, a
cinema, a spa and two fountains, and Pacific Heights — already shipped, already closed — silently
owns the neighbourhood's entire designated heritage.

Note also what Pacific Heights **did not** claim in wave 1: none of them. Whatever the arbitrator
rules, nothing has to be taken back.

### 4b. The west edge: the polygon eats eight blocks of the Fillmore

EAS `nhood = 'Japantown'` runs west to **2593 Sutter, 2492 Post, 2398 Geary**, and takes in
Broderick (1405–1565), Baker (1322–1464), Divisadero (1501–1661), Scott, Steiner and Pierce. That
is the Fillmore. Consequences:

- **Marcus Books and Jimbo's Bop City**, Landmark No. 266 — officially Japantown.
- **Golden Gate Commandery / Macedonia Missionary Baptist Church**, Landmark No. 202 — officially
  Japantown.
- **Westside Courts** and the Bufano — officially Japantown; the record's own prose says Lower
  Pacific Heights.
- **Western Addition Branch Library**, 1550 Scott St — officially Japantown, and named for a
  different neighbourhood.
- **Hamilton Recreation Center** — officially Japantown, and generally read as the Fillmore.

Pacific Heights already owns **Fillmore Street as a street**. If Japantown takes Fillmore-frontage
buildings, two shipped zones describe the same pavement. Flagged.

### 4c. Three further straddlers

- **NJAHS**: gallery at 1684 Post St (Japantown) and the MIS Historic Learning Center at Building
  640, Crissy Field West (**Presidio**). One organisation, two zones.
- **Buchanan Street Mall**: the roster phrase names a Japantown pedestrian block *and* a Rec & Park
  property at 1151 Buchanan stamped "Western Addition, Hayes Valley." Hayes Valley is shipped.
- **Rosa Parks Elementary / JBBP**: 1501 O'Farrell St, EAS **Western Addition**.

### 4d. My judgement: **guide**, comfortably

Sixty-three candidates, four National Register reference numbers, eight Article 10 landmark
numbers within reach, two Ruth Asawa bronzes with accession numbers and measured dimensions, a
0.80-acre plaza and a 3.65-acre park with three documented artworks, a Julia Morgan building with
a Landmark number and a National Register number, and a district nomination that names its
builders, its dates and its cypress tree. This is a guide even after a hard verifier cut — but
**how large a guide depends entirely on §4a**, and I am not the one who decides it.

---

## 5. DESIGNATION NUMBERS FOUND

Eight Article 10 landmark numbers, one Article 10 landmark district, four National Register
reference numbers. Each re-fetched from the live register; each carries a register name and an
identifier, which is what the rule asks. **Per the arbitrator's standing ban, this tally exists
for you and must not appear in reader-facing prose.**

| # | Place | Register + identifier | Confidence |
|---|---|---|---|
| 1 | Japanese YWCA / Issei Women's Building, 1830 Sutter | SF Landmark **No. 291**, 2021 | high — and Wikipedia's "No. 245" is wrong |
| 2 | Japanese YWCA, 1830 Sutter | NRHP ref **100004868**, listed **10 Jan 2020** | high — NPS layer + Wikipedia agree |
| 3 | Kinmon Gakuen, 2031 Bush | SF Landmark **No. 288**, 2019 | high |
| 4 | Ohabai Shalome / Bush Street Temple, 1881 Bush | SF Landmark **No. 81**, 1976 | high |
| 5 | Bush Street–Cottage Row HD | NRHP ref **82000983**, entered **27 Dec 1982** | high — read off the signed nomination |
| 6 | Bush Street–Cottage Row HD | Article 10 landmark district, Appendix K | **date unverified — see §3.6** |
| 7 | Building at 1813–1813B Sutter | NRHP ref **73000443**, listed **8 Mar 1973** | high — signed nomination |
| 8 | Building at 1735–1737 Webster | NRHP ref **73000444**, listed **8 Mar 1973** | high — signed nomination |
| 9 | Marcus Books / Jimbo's Bop City, 1712–1716 Fillmore | SF Landmark **No. 266**, 2014 | high; ⚠ zone |
| 10 | Golden Gate Commandery / Macedonia Missionary Baptist, 2135 Sutter | SF Landmark **No. 202**, 1993 | high; ⚠ zone |
| 11 | Stanyan House, 2006 Bush | SF Landmark **No. 66**, 1975 | high; ⚠ zone |
| 12 | Trinity Episcopal Church, 1668 Bush | SF Landmark **No. 65**, 1974 | high; ⚠ the number is reused — say which building |
| 13 | Madame C J Walker House, 2066 Pine | SF Landmark **No. 211**, 1999 | **already owned by pacific-heights.json** |

**Carrying no designation number, despite appearances:** the Peace Pagoda, the Peace Plaza, the
JACL building at 1765 Sutter, the Western Addition Branch Library, the National Urban League
chapter house. All five sit in the Article 10 dataset with `landmarkno = 0`. See Trap 1.

**Carrying an eligibility finding, which is not a designation:** the Japantown Community &
Cultural Historic District (California Register Eligible, National Register Eligible, 87
contributors).

---

## 6. WHAT I AM LEAST CONFIDENT ABOUT

**(1) The Peace Plaza may be a building site.** Rec & Park's project feed carries "Japantown Peace
Plaza Renovation | Construction update, September 2026." I could not open the project page — the
sfrecpark URL 302s into a CivicPlus identity server. So I have the fact of a renovation and none
of its scope, dates or closure status. **This is the roster's headline place, and I cannot say
whether a visitor can stand in it.** Highest-priority item for the verifier.

**(2) Konko Church and the Buddhist Church of San Francisco are nearly bare.** The roster names
Konko explicitly. Its own site gives an address and a 1930 service date and states nothing about
the building — and a founding year from an operator's own site does not publish under the rules.
For the Buddhist Church at 1881 Pine I have an EAS-confirmed address and literally nothing else;
both the congregation's site and the encyclopedia article returned 404. Two of the zone's most
significant religious institutions and I can supply an address apiece. Either someone with a
working search finds architects and construction years, or these ship as bare locations, or they
do not ship.

**(3) The Article 10 date on the Bush Street–Cottage Row district is probably a copied field.**
DataSF's `dateadop` for the local district is 1982-12-27 — identical to the day the Keeper entered
it in the National Register. I could not check it: amlegal returned HTTP 403 on Appendix K and on
the Article 10 index. Wave 1's reviewers found exactly one wrong certification date by re-fetching;
this smells like the second. **Cite the National Register reference number, which I verified from
the signed nomination form; treat the local date as unverified.**

**Honourable mentions, in descending order of worry:** the Newsom attribution for 1735–1737
Webster rests on one sentence in a different building's nomination; Benkyodo's current status is
unknown and it may not be a place at all; Wikipedia's claim of a 2026 National Register listing
for Kinmon Gakuen does not appear in the NPS layer; the Japantown Cultural District has no
instrument I could find; and the Nominatim vernacular check that would have given §4 a third
independent locator returned HTTP 429 on all nine points, so the boundary finding rests on two
official sources and no informal one.
