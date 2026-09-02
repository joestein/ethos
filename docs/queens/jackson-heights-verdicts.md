# Jackson Heights, Queens — VERIFIER VERDICTS

**Role:** INDEPENDENT VERIFIER. I re-fetched every cited URL myself. I did not read the finder's
local text file; I downloaded LP-1831 fresh (`http://s-media.nyc.gov/agencies/lpc/lp/1831.pdf`,
244 pages, 436,714 chars extracted via pypdf) and re-quoted against my own extraction. Every
"confirmed" below means *I matched the string in a source I fetched*, not that the finder said so.

Working copies (mine, not the finder's):
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/jhVERIF_lp1831.pdf`
`…/jhVERIF_lp1831.txt`

---

## 0. HEADLINE

| | |
|---|---|
| Claims adjudicated | **128** (F-1…F-67 = 67 facts; P-1…P-61 = 61 places) |
| **Confirmed** | **84** |
| **Refuted** | **19** |
| **Uncertain** | **25** |
| **Places surviving as publishable** | **63** — of which **17 are DOHMH-only** (address may ship, prose may not) |

**Confirmation rate on the LPC report is high (44/45) and that is not a warning sign here** — S1 is
a single 244-page primary document and the finder quoted it carefully. **The confirmation rate on
everything else is low.** Nine of my nineteen refutations are of aggregator handling, and the two
worst errors are *false negatives* — the finder concluded "no source exists" about two things that
are plainly in the sources it already cited.

---

## 1. THE FINDING THAT CHANGES THE DOSSIER: S10 AND S12 ARE ONE SOURCE

**REFUTED — structural.** The finder's source register lists as independent:

- S10 = `https://en.wikipedia.org/wiki/Jackson_Heights,_Queens`
- S12 = `https://en.wikipedia.org/wiki/Jackson_Heights_Historic_District`

Both are **redirects to the same article.** MediaWiki API, `action=query&redirects=1`:

```
{'from': 'Jackson Heights, Queens',            'to': 'Jackson Heights'}
{'from': 'Jackson Heights Historic District',  'to': 'Jackson Heights', 'tofragment': 'Historic district'}
```

Both resolve to page **`Jackson Heights`**, wikitext length **132,859** — one article, one revision,
one set of citations.

**Consequences the author must absorb:**

1. Every place in §B/§C where the finder writes "S10 and S12 (aggregators) say X" is **single-sourced,
   not double-sourced.** This affects F-25, F-26, F-31, F-34, F-46, F-48, F-49.
2. Every "**Discrepancy:** S10 says … S12 says …" is **spurious** — a single article cannot disagree
   with itself across sources. What the finder read as two aggregators disagreeing is one article's
   prose differing from its own infobox, which is an internal inconsistency of one aggregator, not
   corroboration or contradiction between two.
3. The finder's tiering ("two aggregators, two different years", F-63) collapses.

The finder's caution about aggregator tier was right in spirit; its arithmetic on how many
aggregators it had was wrong.

---

## 2. NEIGHBORHOOD ASSIGNMENT — EXPLICIT RULINGS

The brief requires a ruling per candidate place with quoted source wording and exact street address.

### 2.1 The marquee-list check — CLEAN

The Queens marquee list is Forest Park, Alley Pond Park, Astoria Park, Socrates Sculpture Park, the
Louis Armstrong House Museum. **None of the five surfaces anywhere in this dossier.** I queried NYC
Open Data Parks Properties for every property carrying ZIP 11372 and got exactly four exact-match
records plus two multi-ZIP records — Northern Playground (Q363), Junction Playground (Q122), Travers
Park (Q303), Rory Staunton Field (Q502), Elmjack Mall, Mall Thirty Four XXXIV. No marquee park is
among them. **No wave-1 marquee collision on parks. Jackson Heights takes nothing from Astoria or
Socrates.**

### 2.2 The contested subject named in the brief: the historic district

**RULING: the Jackson Heights Historic District is Jackson Heights', uncontested, and Sunnyside
Gardens is not in play here at all.**

LP-1831's own metes-and-bounds (my extraction, verbatim): *"The Jackson Heights Historic District in
the Borough of Queens consists of the property bounded by a line beginning at the southeast corner of
the intersection of 78th Street and 34th Avenue…"*, running east to *"northerly along the western
curbline of 88m Street"* [OCR: 88th] and south along *"easterly along the northern curbline of
Roosevelt Avenue"*. Every street named lies between 76th and 88th Streets. **Sunnyside Gardens is a
separate LPC district in Community District 2 and appears nowhere in LP-1831's boundary.** There is
no Jackson Heights / Sunnyside Gardens contest. The Sunnyside author is free.

**However — the one genuinely shared LP-1831 passage:** *"which are located in Sunnyside, Astoria,
and Woodside, all in Queens."* (confirmed verbatim, my extraction). Architect **Andrew J. Thomas**
is shared across all three wave-2 neighborhoods *and* wave-1 Astoria. Jackson Heights may write
Thomas's Jackson Heights buildings; it may **not** claim Thomas as its own architect.

### 2.3 Addresses the finder called "gaps" — ALL FILLED FROM S1's OWN INVENTORY

**This is the finder's largest omission.** LP-1831 is 244 pages; the finder appears to have read the
~40-page narrative and stopped. Pages 75–225 are a **building-by-building inventory with street
addresses, block/lot numbers, dates, architects and NB numbers**, and pages iii–vi are an
**alphabetical index with addresses**. Everything the finder marked "address gap" is in there.
Verbatim from my extraction:

| Place | Exact address (LP-1831 inventory/index) | Finder said |
|---|---|---|
| Laurel Court | **33-01—33-21 82nd Street** | no number |
| Greystone Apartments, The | **35-15—35-55 80th Street** | no number |
| Linden Court | **37-11—37-59 84th Street and 37-12—37-60 85th Street** | no number |
| The Chateau | **34-01—34-47 80th Street and 34-02—34-48 81st Street** | no number |
| The Towers | **33-15—33-51 80th Street and 33-16—33-52 81st Street** | "north of 34th Ave" — **wrong, see 2.4** |
| Spanish Gardens | **37-15—37-57 83rd Street and 37-16—37-58 84th Street** | "adjacent block" only |
| Hawthorne Court | **35-13—35-55 76th Street** | no number |
| Cambridge Court | **37-13—37-57 85th Street and 37-14—37-58 86th Street** | no number |
| Laburnum Court | **37-15—37-31 79th Street** | "address gap" |
| Elm Court | **34-27—34-49 79th Street and 34-28—34-50 80th Street** | "address gap" |
| Hampton Court | **35-15—35-55 78th Street** | "address gap" |
| Hayes Court | **33-53 82nd Street** | "address gap" |
| Ivy Court | **34-01—34-09 83rd Street and 34-02—34-10 84th Street** | "address gap" |
| Cedar Court | **83-01—83-09 35th Avenue** | "address gap" |
| Dunolly Gardens | **78-02—78-20 34th Avenue** | block only |
| Berkeley Hall/(now) Berkeley Gardens | **77-02—77-12 35th Avenue** (a/k/a 35-01 77th St, 35-02 78th St) | block only |
| First Church of Christ, Scientist | **86-01—86-17 35th Avenue** | "address gap" |
| Jewish Center of Jackson Heights | **34-25 82nd Street** (a/k/a 34-24 83rd St) | "77th St & 37th Ave" — **wrong** |
| Young Israel of Jackson Heights | **86-15—86-29 37th Avenue** | "no house number" |
| Community United Methodist Church Complex | **81-02—81-10 35th Avenue** (Block 1281 Lot 1) | S10 block only |
| St. Mark's Episcopal Church | **81-01—81-11 34th Avenue** | S10 block only |
| Saint Joan of Arc R.C. Church Complex | church **35-02 83rd Street**; rectory **82-00 35th Avenue**; school **35-07 82nd Street**; convent **35-24 83rd Street** | S10 block only |
| P.S. 69 (Public School 69) | **77-02 37th Avenue** (a/k/a 37-01 77th St, 37-02 78th St), Block/lot 1288/1 | flagged **UNVERIFIED** — it is verified |
| U.S. Post Office, Jackson Heights | **78-02 37th Avenue** | "candidate address only, unverified" — it is verified |
| Queens Borough Public Library – Jackson Heights Branch | **35-51 81st Street**, Block/lot 1281/48 | S10 only |

I geocoded every one of these against DCP GeoSearch. **All return `neighbourhood = Jackson Heights,
postalcode = 11372`.** There is no ambiguity on any of them and none is claimable by Sunnyside or
Woodside.

**Place the finder missed entirely, and the author should want:**
**Queensboro Corporation Headquarters (Morrell Smith, 1928)** — LP-1831 Fig. 38 caption, verbatim:
*"Queensboro Corporation Headquarters (Morrell Smith, 1928), southwest corner of 37th Avenue and
82nd Street, c. 1935"*. The developer's own building, in the district, on the commercial spine.

### 2.4 REFUTED assignments and locations

**P-7 The Towers — location REFUTED.** The finder places it "north of 34th Avenue between 80th and
81st Streets." LP-1831's inventory heading reads: *"80th Street between Northern Boulevard and 34th
Avenue (East Side) THE TOWERS 33-15—33-51 80th Street and 33-16—33-52 81st Street Block/lot: 1253/1
… Type: Garden Apartments (8 buildings) Stories: 6 Style: Neo-Romanesque"*. The block is **Northern
Boulevard to 34th Avenue**, addressed 33-xx, not 34-xx. The finder derived it from the narrative's
"the block directly to the north" and never checked the inventory. Still Jackson Heights (GeoSearch:
33-15 80 Street → Jackson Heights 11372) — but the address it would have shipped was wrong.

**P-20 Jewish Center of Jackson Heights — address REFUTED.** Finder: "S10 gives 77th Street & 37th
Avenue." LP-1831 inventory: *"82nd Street between 34th Avenue and 35th Avenue (East Side) THE JEWISH
CENTER OF JACKSON HEIGHTS 34-25 82nd Street (a/k/a 34-24 83rd Street) Block/lot: 1443/19"*. Primary
source beats aggregator. **34-25 82nd Street.**

**P-43 NY Lhasaliang Fen and P-49 Nepali Bhanchha Ghar — Elmhurst flag REFUTED.** The finder put
both in §E3 as Jackson Heights/Elmhurst conflicts on the grounds that "S5 for the 74-10 Roosevelt
Ave block → Elmhurst." **It geocoded the wrong address.** Their DOHMH addresses are 74-17 and 74-11
(north side, odd numbers), not 74-10. GeoSearch, my query:

```
74-17 Roosevelt Avenue → 74-17 ROOSEVELT AVENUE, Jackson Heights, NY | nbhd=Jackson Heights | zip=11372
74-11 Roosevelt Avenue → 74-11 ROOSEVELT AVENUE, Jackson Heights, NY | nbhd=Jackson Heights | zip=11372
74-10 Roosevelt Avenue → 74-10 ROOSEVELT AVENUE, Elmhurst,        NY | nbhd=Elmhurst        | zip=11372
```

Roosevelt Avenue is the boundary itself: **north side = Jackson Heights, south side = Elmhurst.**
Both places are Jackson Heights'. Not contested.

**P-61 Lent Homestead — the finder's reasoning is wrong but its conclusion is right.** Finder: "S11's
Queens NRHP list did not return it under Jackson Heights." It does — verbatim from the list's
wikitext: `|refnum=84002918 |article=Lent Homestead and Cemetery |address=78-03 19th Rd. |city=[[Jackson
Heights, Queens|Jackson Heights]] |date=1984-02-02`. So S11 **does** file it under Jackson Heights.
But the subject article's own infobox reads `location = 78-03 19th Rd., [[East Elmhurst, New York]]`
with coordinates 40°46′23″N — roughly a mile north of the district, past Northern Boulevard.
**Better-evidenced assignment: East Elmhurst / Ditmars-Steinway. Jackson Heights must not take it.**
Wave-1 collision avoided, but on corrected grounds.

### 2.5 Confirmed contested — arbitrator input required

**F-51 "International Express" National Millennium Trail — CONFIRMED and genuinely three-way.**
Re-quoted from the article wikitext, verbatim: *"[[International Express Trail|International
Express]] – {{convert|5|mi|km}} – [[Queens|Queens County, New York]] from [[Sunnyside,
Queens|Sunnyside]] to [[Flushing, Queens|Flushing]] follows the route of the [[New York City
Subway]]'s [[IRT Flushing Line]]"*. The finder's quote is accurate. Designated by the White House
Millennium Council, announced **June 26, 1999** (the finder gave only "1999"). **The trail's own
wording anchors it at Sunnyside. Sunnyside has the strongest textual claim; Woodside and Jackson
Heights are en route. Arbitrator must assign to exactly one.**

**F-66 Travers Park's namesake — CONFIRMED, and the cross-boundary wording is real.** I reached NYC
Parks at `https://www.nycgovparks.org/parks/Q303/history` (the `travers-park` path 403s; the park-ID
path works). Verbatim: *"He served as Democratic District Leader for Woodside-Jackson Heights from
1940 until his death in 1958."* Also confirmed verbatim: the Trains Meadow sentence, the 1909 /
325 acres / John C. Jackson (1809-1899) sentence, the 1948 condemnation paragraph, and the 2020
rebuild paragraph. Park data panel: **Zip 11372, Community Board 3, Council Member Shekar Krishnan,
Park ID Q303, Acreage 1.92, Property Type Playground.** Official name **Thomas J. Travers Park**.
**The park is unambiguously Jackson Heights'. The man's district was shared — Woodside may cite the
same sentence about the person.**

**F-64 Chester Carlson — CONFIRMED as a real wave-1 conflict; ruling below.** Carlson's own article,
verbatim: *"By the fall of 1938, Carlson's wife had convinced him that his experiments needed to be
conducted elsewhere. He rented a room on the second floor of a house owned by his mother-in-law at
32-05 37th Street in [[Astoria, Queens]]."* The Jackson Heights article says, verbatim: *"[[Chester
Carlson]] (1906–1968), invented Xerox copy machine in his Jackson Heights kitchen."* (sourced to a
Queens Tribune archive page). The Carlson article is categorised in **both** `People from Astoria,
Queens` and `People from Jackson Heights, Queens`.
**RULING: the invention site is Astoria — 32-05 37th Street — and that is wave-1 territory.
Jackson Heights may say Carlson lived in Jackson Heights. Jackson Heights may NOT say xerography was
invented there. If wave 1 already wrote Carlson, Jackson Heights drops him entirely.**

**Subway stations — the sources assign them to two neighborhoods each. Verbatim, re-fetched:**

- **74th Street complex**: infobox `address = Roosevelt Avenue, 74th Street & Broadway<br />Jackson
  Heights, New York`; `locale = [[Jackson Heights]], [[Elmhurst, Queens|Elmhurst]]`. **The address
  field says Jackson Heights alone; the locale field says both.** GeoSearch: 74-01 Broadway →
  Elmhurst 11373; 74-10 Roosevelt Ave → Elmhurst. **Best evidence: Jackson Heights, since the
  station carries the name and the address field is unqualified — but flag it.**
- **82nd Street–Jackson Heights**: *"Located at the intersection of 82nd Street and Roosevelt Avenue
  on the border of [[Jackson Heights]] and [[Elmhurst, Queens|Elmhurst]] in Queens"* — confirmed
  verbatim. GeoSearch 82-01 Roosevelt Ave → **Jackson Heights**; 82-10 → **Elmhurst**. North side is
  Jackson Heights. **Assign to Jackson Heights, name-supported.**
- **90th Street–Elmhurst Avenue**: *"Located at 90th Street and Elmhurst Avenue on the border of
  [[Elmhurst, Queens|Elmhurst]] and [[Jackson Heights, Queens|Jackson Heights]] in Queens"* —
  confirmed. **Note the finder's P-37 adds "& Roosevelt Avenue" to the address; the source does not
  say that.** Name favours Elmhurst. **Weakest Jackson Heights claim of the four; recommend drop.**
- **Junction Boulevard**: GeoSearch 94-01 Roosevelt Ave → Jackson Heights; 40-05 Junction Blvd →
  **South Corona**. Corona border. **Recommend drop.**

**Woodside boundary on Roosevelt Avenue — the finder is right and I confirm it.** GeoSearch, mine:

```
72-20 ROOSEVELT AVENUE → Woodside | zip=11372   (Himalayan Yak — ZIP says JH, geocoder says Woodside)
69-11 ROOSEVELT AVENUE → Woodside | zip=11377   (Lhasa Snack Cafe — both say Woodside)
72-10 / 73-10 ROOSEVELT AVENUE → Woodside | zip=11372
```
**P-40 Himalayan Yak (72-20 Roosevelt Avenue) is the real Jackson Heights/Woodside conflict in this
wave.** DCP's geocoder and the ZIP disagree at the same address. The geocoder is a neighborhood
determination; a ZIP is a mail route. **Better evidence: Woodside.** P-42 Lhasa Snack Cafe is
Woodside on both signals — **not Jackson Heights'.**

**P-55 Satya Narayan Mandir — Jackson Heights REFUTED.** Article, verbatim: *"Satya Narayan Mandir,
at the corner of 76 street and Woodside Avenue, is the oldest Hindu-Sikhism combination temple in the
United States (and, it claims, the Americas). It was incorporated in 1987."* GeoSearch 76-16 Woodside
Avenue → **Elmhurst, 11373**. Note the article's own hedge *"and, it claims"* — the finder dropped
that hedge. **Not Jackson Heights'. Not Woodside's either. Elmhurst. Drop.**

**Elmjack Mall / Mall Thirty Four — confirmed straddles, from the City's own record.** My query of
`enfh-gkve`: Elmjack Mall zipcode `"11372, 11373"`, communityboard `"403404"`; Mall Thirty Four XXXIV
zipcode `"11368, 11372"`, location `"34 Ave. bet. 79 St. and 92 St., Junction Blvd. and 111 St."`.
Both straddle by the City's own data. Publish address-only or not at all.

---

## 3. PUBLISHABLE STREET ADDRESSES — EXACT STRINGS

Every string in §2.3 is publishable as written, sourced to LP-1831's inventory and cross-checked in
GeoSearch. Additionally:

| Place | Exact publishable address | Source |
|---|---|---|
| Garden School | **33-16 79th Street, Jackson Heights, NY 11372** | school's own site footer, re-fetched |
| 82nd Street Partnership | **37-06 82nd Street, Suite 309, Jackson Heights, NY 11372** | own site, re-fetched |
| Jackson Heights Beautification Group | **PO Box 720253, Jackson Heights, NY 11372** — **PO box, NOT a street address** | own site, re-fetched |
| Travers Park | **34 Ave. bet. 77 St. and 78 St.** (Parks intersection string, not a house number) | `enfh-gkve` |
| Rory Staunton Field | **78 St., 79 St. bet. Northern Blvd. and 34 Ave.** | `enfh-gkve` |
| Northern Playground | **Northern Blvd. bet. 93 St. and 94 St.** | `enfh-gkve` |
| Junction Playground | **34 Ave. bet. 96 St. and Junction Blvd.** | `enfh-gkve` |
| Julio Rivera Corner | **78th Street and 37th Avenue** (intersection, no house number) | Murder of Julio Rivera |
| US Post Office–Jackson Heights Station | **78-02 37th Avenue** (NRHP list renders it `7802 37th Ave.`) | LP-1831 index + NRHP list |

**No publishable street address exists for:** the two historic districts (boundaries only), the
Charles Peck rowhouses (LP-1831 gives only *"the west side of 83rd Street just north of Roosevelt
Avenue"*), the Queensboro Corporation Headquarters (corner only), P-56 Muhammadi Community Center,
P-57 Eagle Theatre, P-58 Diversity Plaza, P-59 Greenmarket, P-60 schools.

---

## 4. DOHMH-ONLY BUSINESSES — THE PROSE PROHIBITION

**P-39 … P-54 plus Jackson Diner: 17 businesses whose ONLY source is the DOHMH restaurant inspection
dataset (`43nn-pn8j`).** I re-queried the dataset by trade name and confirmed every DBA/building/
street/ZIP tuple the finder tabulated. **For all seventeen, name + street address + cuisine code +
ZIP may be published. NOTHING about any of them may appear in prose** — not founding date, not
founder, not quality, not community significance, not "a beloved institution", not "since 19xx". A
DOHMH row proves a permit existed at an address on an inspection date. It proves nothing else, and
it does not even prove the business is open today.

### 4.1 REFUTED: Jackson Diner IS in the dataset

The finder wrote: *"Searched for and NOT found in S4 within ZIPs 11372/11377/11104/11373: JACKSON
DINER…"* and *"Jackson Diner in particular is a widely known 74th Street institution that I could
**not** source at all."* **Refuted.** My query, filtering on DBA and not on ZIP, returns 17 rows:

```
{'dba': 'JACKSON DINER', 'boro': 'Queens', 'building': '37-40B', 'street': '74 STREET',
 'zipcode': None, 'cuisine_description': 'Indian', 'inspection_date': '2025-08-13'}
```

**The `zipcode` field is null, so a ZIP-filtered query silently drops it** — exactly the false
negative the brief warns about. GeoSearch: `37-40 74 Street → 37-40 74 STREET, Jackson Heights, NY,
USA | Jackson Heights | 11372`. **Jackson Diner, 37-40B 74 Street, Jackson Heights, cuisine Indian —
publishable as address-only, and it is still bound by the prose prohibition in §4.** The finder's
"unresolved gap" language must not be carried into the file.

I re-ran the same DBA-only query for the finder's other "not found" names — DELHI HEIGHTS, TABLE
WINE, TORTAS NEZA, RAJBHOG, PATEL BROTHERS, MUSTANG, SHIVA SHANKAR, BIRRIA. **Those eight are
genuinely absent.** The finder's absence claim holds for eight of nine and fails for the one that
mattered most.

### 4.2 WARNING: Arepa Lady has a second location in wave-1 territory

DOHMH returns **two** Arepa Lady records:

```
('AREPA LADY', '77-17', '37 AVENUE', '11372')   → Jackson Heights
('AREPA LADY', '34-41', '31 STREET',  '11106')  → GeoSearch: 34-41 31 STREET, Astoria, NY | Astoria
```

**If the wave-1 Astoria or Ditmars-Steinway file already published Arepa Lady, this is a duplicate
across the corpus.** Coordinator must check before Jackson Heights ships P-39.

---

## 5. SINGLE-SOURCED CLAIMS — SHIP OR DON'T

**May ship with explicit attribution** (source is named, reputable, and self-describing about its
own subject):

- Everything from LP-1831 — single-sourced but *primary institutional*. Attribute to the LPC
  designation report, LP-1831, October 19, 1993.
- Travers Park history (NYC Parks Historical Signs Project) — attribute to NYC Parks.
- Garden School's own history — attribute to the school. **Flag its internal contradiction:** the
  narrative says the first high school class graduated *"in the spring of 1929"*, but the milestone
  timeline on the same page reads *"1927 Garden School moves to its current location and graduates
  its first 3 students!"* Ship 1929 or ship neither.
- 82nd Street Partnership and JHBG self-descriptions — attribute to the organizations.
- **F-62 Tibetan community.** The finder called this "aggregator-only." It is **cited in the article
  to a named scholarly source**: Tenzin Dorjee, *Himalaya: The Journal of the Association for Nepal
  and Himalayan Studies*, vol. 37 no. 1, June 2017. The article's wording, verbatim: *"Because of its
  large and vibrant Tibetan community, it has been called 'the second (if unofficial) capital of the
  exile Tibetan world, after [[Dharamsala]], India.'"* **May ship with the "(if unofficial)" hedge
  intact and attribution to that source. Do not drop the hedge.**
- **F-60 NYT "most culturally diverse."** The finder called this "a quote-of-a-quote… the underlying
  NYT article is not cited to a URL here. Treat as unverified attribution." **Refuted.** The article
  cites it: Michael Kimmelman, *"Jackson Heights, Queens: Walk Where the World Finds a Home,"* The
  New York Times, 2020, `nytimes.com/interactive/2020/08/27/arts/design/jackson-heights-queens-virtual-walk-tour.html`.
  **May ship, attributed to the NYT.**

**MUST NOT ship:**

- **F-61 commercial-corridor ethnography** (74th Street South Asian, 73rd Street Pakistani/Bangladeshi,
  37th Avenue Colombian, Northern Blvd Peruvian, Roosevelt Avenue street food). Single aggregator,
  and the DOHMH cuisine codes are **not** corroboration — a cuisine code is a permit field, not a
  community history. Uncertain. Do not write.
- **P-56 Muhammadi Community Center, P-57 Eagle Theatre, P-58 Diversity Plaza, P-59 Greenmarket,
  P-60 the eight schools.** Unsourced or aggregator-only. Note P-57: the Jackson Heights article does
  carry an image captioned "Eagle Theater," which is weak evidence a theatre exists but is no source
  for anything about it.
- **F-16 exclusionary covenants.** I independently confirm the finder's negative: my extraction of
  LP-1831 returns **0 hits** for "Negro", "negro", "racial", "covenant", "restrictive". The deed
  restrictions LP-1831 does describe are aesthetic and use-based only. **The neighborhood's
  exclusionary history is real in the wider literature but is UNSOURCED in this dossier. The author
  must not write it, and must not write anything that implies its absence either.**

---

## 6. REFUTED QUOTES — DO NOT TRUST THESE STRINGS

**F-63 Scrabble — REFUTED as a quotation.** The finder presents as an exact quote from the Alfred
Mosher Butts article: *"Butts was a resident of Jackson Heights, New York, and the game of Scrabble
was invented there."* **That sentence is not in the article.** My regex for `resident of Jackson
Heights` over the full wikitext: NOT FOUND. What the article actually says, verbatim: *"To memorialize
his importance to the invention of the game, a street sign at 35th Avenue and 81st Street in Jackson
Heights is stylized using letters with their values in Scrabble as a [[Subscript and
superscript|subscript]]."* and, in the lead, that Butts was *"famous for inventing the board game
Scrabble in 1931."* The finder's rendering of the sign sentence also silently drops the opening
clause. **Ship 1931 and the corrected sign sentence; do not ship the fabricated residency quote.**
(The 1931-vs-1938 "two aggregators" framing also dies with §1 — the 1938 figure is one aggregator's
prose against a different article's lead.)

**S12's "69rd" typo — REFUTED.** The finder quotes S12 as reading *"from 93rd Street through 69rd
Street"* and marks "[sic]". The article reads: *"The Jackson Heights New York State and National
Register Districts range from 93rd Street through 69th Street between Northern Boulevard and
Roosevelt Avenue."* **There is no typo. The finder introduced it.** This also removes one leg of the
finder's F-47 "three-way boundary conflict."

**F-52 station location — REFUTED as a sentence.** The finder quotes: *the complex is "located at
'Roosevelt Avenue, 74th Street & Broadway' in Jackson Heights and Elmhurst, Queens."* My regex for
`Jackson Heights and Elmhurst` over that article's wikitext: **NOT FOUND.** The finder stitched two
infobox fields into a sentence and presented it as the source's prose. Substance survives (see §2.5);
the quotation does not.

**F-52 ridership figures — UNCERTAIN.** "15,086,001 annual riders in 2024" and "ranked 9 out of 423"
are **not in the wikitext** — they are emitted by `{{Infobox NYCS/ridership/year}}` and
`{{Infobox NYCS/ridership/rank}}`, live templates that change when MTA data updates. The finder read
rendered output. **Do not ship a hard number that will silently drift.** "The busiest subway station
in Queens" *is* in the article text and may ship.

**F-53 "$132 million" — UNCERTAIN.** I could not locate that figure in the article. *"one of the
first green buildings in the MTA system"* and *"The Jackson Heights bus terminal opened on July 13,
2005"* are both confirmed verbatim. Ship those, drop the cost.

---

## 7. REFUTED NEGATIVES — THINGS THE FINDER SAID WERE UNSOURCED THAT ARE NOT

**P-23 Post Office — REFUTED, and this is a place the author should want.** The finder wrote: *"no
Wikipedia article exists (404); NRHP listing unconfirmed — S11's Queens County NRHP list returned
only ONE Jackson Heights entry, the historic district, and did NOT list a post office."* All three
sub-claims are wrong. The article exists at `United_States_Post_Office_(Jackson_Heights,_Queens)` —
the finder tried "…,_New_York)" and "Jackson_Heights_Post_Office" and stopped. The NRHP county list
carries it verbatim:

```
{{NRHP row |pos=104 |refnum=88002504 |type=NRHP
 |article=United States Post Office (Jackson Heights, Queens)
 |name=US Post Office-Jackson Heights Station |address=7802 37th Ave.
 |city=[[Jackson Heights, Queens|Jackson Heights]] |date=1988-11-17 }}
```

Opening sentence of the article, verbatim: *"US Post Office-Jackson Heights Station is a historic
post office building located at Jackson Heights in Queens County, New York, United States."*
**CONFIRMED: NRHP ref 88002504, listed November 17, 1988, Benjamin C. Flournoy, 1936–37, 78-02 37th
Avenue, Jackson Heights.** Independently corroborated by LP-1831's index (*"Jackson Heights Post
Office 78-02 37th Avenue 108"*) and the JHBG's *"Annual Holiday Post Office Lighting"* program.
**Three independent sources. One of the best-supported places in the file.**

**F-46 "~600 buildings" — REFUTED.** The finder: *"I did not locate a building count in the S1 text I
extracted. Unverified count — flagged."* The count is not in LP-1831 (I confirm — my regex for
`\d{3,4} buildings` over the full report: NOT FOUND), but it **is** in the cited article and it is
cited there to a 1994 NYT piece: *"Almost 600 buildings in the neighborhood—a rectangle stretching
roughly from 76th to 88th Streets and from Roosevelt Avenue almost up to Northern Boulevard—were
designated as a New York City Historic District by the New York City Landmarks Preservation
Commission on October 19, 1993."* **May ship as "almost 600," attributed. The "rectangle" gloss is
the aggregator's simplification and the finder was right to flag it — LP-1831's boundary is a
lot-by-lot line, which I confirmed by reading the full metes-and-bounds.**

**F-31 "12 buildings" at the Chateau — REFUTED (in the finder's favour).** The finder asked the
verifier to "check whether '12 buildings' is sourced or inferred." **It is sourced, in LP-1831
itself**, inventory heading: *"THE CHATEAU 34-01—34-47 80th Street and 34-02—34-48 81st Street …
Type: Garden Apartments (12 buil[dings])"*. Consistent with the narrative's *"each blockfront
composed of six buildings."* Ship it.

**F-48 NR district size — UNCERTAIN but better than the finder thought.** *"2,203 contributing
buildings, 19 contributing sites, and three contributing objects"* is confirmed verbatim in the
article, cited to the actual NRHP registration by **Kathleen LaFrank, April 1998**, at
`catalog.archives.gov/id/75321098`. **The finder declared the nomination "not digitized" on the
strength of one npgallery URL returning a stub.** The NARA catalog record exists; I could not render
its file objects, so I mark this uncertain rather than confirmed — but the author should know the
nomination is *findable*, contrary to the dossier's §0. "300 acres" I could not confirm; the article's
1,101.36-acre figure is the **neighborhood**, not the district. Do not conflate.

---

## 8. LP-1831 INTERNAL INCONSISTENCIES THE FINDER DID NOT CATCH

All four are S1 disagreeing with itself. The author must pick one reading and not present the report
as univocal.

1. **The Towers.** Narrative p.3: *"the Towers (1923), on the block directly to the north."*
   Narrative p.26: *"The Chateau (1922) and the Towers (1923-25)."* **1923 vs 1923-25.**
2. **The Greystones.** Body: *"The Greystone Apartments (1917-18)"* and *"the Corporation began
   construction of Wells's Greystone Apartments in 1916."* Figure 16 caption: *"Greystone Apartments
   (George H. Wells, 1916-18)."* **1916-18 vs 1917-18.**
3. **C.B.J. Snyder's tenure.** Narrative: *"Superintendent of Buildings for the Board of Education
   from 1891 until 1923."* P.S. 69 inventory entry: *"responsible for the design of schools
   throughout the five boroughs from 1898 until his retirement in 1923."* **1891 vs 1898.**
4. **P.S. 69's date.** Summary line: *"(P.S. 69, C.B.J. Snyder, 1924)"* — the finder shipped this.
   Inventory entry: *"Date: 1922-24 [NB 8511-1922]"*. **Prefer 1922-24; it carries the New Building
   number.**

Also: **Berkeley Hall and Berkeley Gardens are one building, not two.** The narrative reads *"that
block was developed with Berkeley Hall and Berkeley Gardens,"* which the finder took as two
buildings (P-14). The index reads *"Berkeley Hall/(now) Berkeley Gardens 77-02—77-12 35th Avenue"*
and the inventory heading is *"BERKELEY HALL/(now) BERKELEY GARDENS"* — a **rename**, Joshua
Tabatchnik, 1936-37. (A separate *"Berkeley Apartments 35-25 77th Street"* also exists — do not
merge it in.)

And a correction to **P-15**: LP-1831's fuller passage reads *"The first speculative buildings in the
district were the rowhouses, designed by Charles Peck and built in 1911 on 82nd and 83rd streets,
just north of Roosevelt Avenue… The rowhouses on 82nd Street have been demolished or altered for
commercial purposes, but those on 83rd Street are still standing."* **Only the 83rd Street row
survives.** The finder's shorter quote is accurate but omits that the 82nd Street half is gone —
which is precisely the detail a visitor-facing file needs.

---

## 9. CONFIRMED WITHOUT QUALIFICATION

Re-quoted by me, byte-for-byte, against my own extraction/fetch. All of F-1, F-3, F-5 … F-45 from
LP-1831 (44 of 45 checked strings matched; the five initial mismatches were all page-break headers,
footnote markers `51`/`52`, or figure markers `[Fig. 36]`/`[Fig. 37]` intruding mid-sentence — the
finder disclosed the footnote deletions but **not** the `[Fig. n]` deletions, a minor undisclosed
edit the author should be aware of). Plus:

- **F-35's "no"** — I confirm the finder's flag. The word is the source's: *"Until the early 1920s
  there were no houses of worship in Jackson Heights, rather congregations held services in
  storefronts or at the Community Casino (no longer extant)."* Genuine.
- **F-2** Travers Park's 1909/325-acres sentence — confirmed verbatim. **F-1/F-3 date conflict is
  real:** NYC Parks says 1909, LP-1831 says *"in 1910"*. Two primary agencies. Report both or neither.
- **F-4** — both versions confirmed. The article, verbatim: *"The Queensboro Corporation named the
  land Jackson Heights after Jackson Avenue, which was itself a namesake of John C. Jackson."*
  NYC Parks says named after the man. Real conflict.
- **F-57 Julio Rivera** — both quotes confirmed verbatim, including *"In 2000, the corner of 78th
  Street and 37th Avenue, where Rivera was killed, was renamed in his memory."* The finder's
  schoolyard/corner tension is genuine and unresolved in the source; **write the corner renaming,
  do not assert the schoolyard was the P.S. 69 schoolyard** — no source says so.
- **F-58 Queens Pride** — confirmed: founder field *"[[Daniel Dromm]] and Maritza Martinez"*, first
  *1993-06-06*, *"Around 1,000 people joined the march"*, *"Queens Pride has attracted crowds of
  over 40,000 people"*. Route, fuller than the finder gave: *"Parade on 37th Avenue from 89th Street
  to 75th Street; festival at 75th Street and 37th Road."* Martinez is described as *"Cuban-born
  LGBTQ rights activist."*
- **F-67 Paseo Park** — I confirm the finder's negative. My name search of `enfh-gkve` for "Paseo"
  returns **0 records**. "Paseo Park" is not a Parks property name. **Mall Thirty Four XXXIV** is the
  Parks record on that corridor, and it reaches 111th Street into ZIP 11368 (Corona). Do not write
  "Paseo Park" as an official park name.
- **F-49** — confirmed verbatim: *"Unlike the State and National Districts, the local designation
  comes with aesthetic protections."*

---

## 10. WHAT THE AUTHOR MUST BE WARNED ABOUT

1. **S10 and S12 are one Wikipedia article.** Treat every "two aggregators agree" as one source.
2. **Read LP-1831 pages 75–225.** The address gaps are not gaps. Use §2.3.
3. **The Towers is on 33-xx, not 34-xx.** The Jewish Center is 34-25 82nd Street, not 77th & 37th.
4. **Jackson Diner is sourced** (DOHMH, 37-40B 74 Street) — but prose-locked like every other §4 name.
5. **Nothing in §4 gets prose.** Seventeen businesses, address-only.
6. **Carlson's kitchen is in Astoria.** Residence only, or drop.
7. **Do not write the Scrabble residency quote or the "69rd" typo** — the finder invented both.
8. **Do not ship the 15,086,001 ridership number or the $132M cost.**
9. **Do not write the exclusionary-covenant history.** It is unsourced here in either direction.
10. **Check Arepa Lady against wave 1** before shipping it.
11. **Three items need arbitration:** the International Express trail (Sunnyside has the best textual
    claim), Thomas J. Travers the man (Woodside shares him; the park does not), and Andrew J. Thomas
    the architect (all four neighborhoods).
