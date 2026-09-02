# Flushing, Queens — INDEPENDENT VERIFIER verdicts

**Role:** independent verifier. I did not defer to the finder's reasoning. Every verdict below rests
on a source I re-fetched myself in this session, or is marked `uncertain` precisely because I could
not. Where the finder presented a quotation, I re-quoted it from the source before confirming it.

**Input:** `docs/queens/flushing-finder.md` — 367 candidate facts (F1–F367), 71 candidate places
(P1–P71). I re-parsed the file programmatically: the numbering **is** contiguous F1–F367 with no
gaps and no duplicates. That count claim is CONFIRMED.

**Source-class census of the finder** (my own parse, not the finder's claim):

| Source class | Facts | Treatment |
|---|---|---|
| LPC designation reports / LPC datasets | 68 | primary — re-read |
| NYC Open Data (Socrata) + DCP GeoSearch | 31 | primary — re-queried |
| NYC Parks (Historical Signs, Properties) | 33 | institutional — re-fetched |
| Institution websites | 53 | self-description — re-fetched |
| **Wikipedia only** | **174** | **aggregator — cannot confirm** |
| Repo files / finder's own inference | 8 | re-read |

**174 of 367 facts — 47% of this file — rest on Wikipedia and nothing else.** That is the single
most important number in this document. The finder disclosed that its WebSearch budget was exhausted
on arrival and that discovery was "directed, not exhaustive"; the source mix is the consequence.

---

## §1 — HEADLINE COUNT

| | |
|---|---|
| **Claims adjudicated** | **367** |
| **Confirmed** | **168** |
| **Refuted** | **9** |
| **Uncertain** | **190** |
| **Places surviving as publishable** | **31 of 71** |

Confirmation rate is **45.8%**. That is deliberately low. I refused to confirm any Wikipedia-only
claim, because re-fetching an aggregator only proves the aggregator still says it — it is not
verification. A high confirmation rate here would have been a failure of the verifier, not a success
of the finder.

The finder's *primary-sourced* material, by contrast, verified extremely well: of the 68 LPC facts
and 31 Socrata/GeoSearch facts I re-ran, essentially all reproduced character-for-character. The
finder is honest and careful. Its weakness is coverage, not integrity.

---

## §2 — THE HARD REQUIREMENT ON THE AUTHOR: the destination string

**F1, F2 — CONFIRMED.** I read `lib/ethos/seeds/citi_field_guide.ex` directly. It contains, verbatim:

```
      destination: "Flushing, New York",
```

and in its moduledoc:

> `destination: "Flushing, New York"`. The ballpark's own address is a
> Flushing one, and three of this guide's places carry Corona addresses; the
> place records keep each town as its source gives it rather than flattening
> both to the borough.

**RULING — `flushing.json`'s `guide.destination` must be the exact string `Flushing, New York`.**
Character for character, including the comma and the single space. Not "Flushing, Queens", not
"Flushing, NY", not "Downtown Flushing, New York". Identical destination strings derive identical
destination slugs, and that is the whole mechanism by which this page co-lists with
`Ethos.Seeds.CitiFieldGuide` instead of competing with it. A gate asserts this the moment the file
exists.

**F3 — CONFIRMED, and it changes nothing.** I re-fetched six of the seven institutional address
strings the finder cited and matched them verbatim (Bowne House, Queens Historical Society, Flushing
Town Hall, Ganesh Temple, Flushing Cemetery, Lewis Latimer House); the seventh (Queens Botanical
Garden) now returns HTTP 403 to me, but DCP GeoSearch and PLUTO independently return `43-50 MAIN
STREET`, `11355`. Institutional sources do overwhelmingly write "Flushing, NY" with a ZIP. **This
does not license changing the destination string.** The co-listing requirement is a project rule,
not a source claim. Author: use "Flushing, New York" in `guide.destination` and let individual place
records carry their own address strings.

**F4 — CONFIRMED on a sample.** I re-queried DCP GeoSearch for five of the fifteen addresses and got
`"neighbourhood": "Flushing"`, `"borough": "Queens"` on all five, with labels of the form
`'37-01 BOWNE STREET, Flushing, NY, USA'`.

---

## §3 — THE FLUSHING MEADOWS–CORONA PARK FIREWALL

### 3.1 The eight holdings — CONFIRMED and FIREWALLED

I read `lib/ethos/seeds/citi_field_places.ex`. It declares exactly eight places — Citi Field,
Unisphere, Queens Museum, New York Hall of Science, Queens Zoo, USTA Billie Jean King National
Tennis Center, New York State Pavilion, Queens Theatre — under towns `Corona` and `Flushing`.

**None may be created in `flushing.json` under any slug, and none may be narrated in prose.** The
Bronx concourse precedent the brief cites (a first draft that narrated the history anyway and came
back as two Criticals) applies with full force here. Link to `/g/citi-field-guide`. Linking routes
the reader; narrating does not.

The finder's §I firewall ledger (20 rows) is **CONFIRMED as a correct statement of the boundary** and
I adopt its recommendations for rows 1–16 and 18–20: the Rocket Thrower, the Statue of Tom Seaver,
Etihad Park, the 1964–65 World's Fair Carousel, Meadow and Willow Lakes, the World's Fair Marina and
the Queens Night Market are all inside the Jointly Interested Area or on Corona ground. **None
becomes a Flushing place.** Row 17 is the exception and I rule on it below.

### 3.2 I found the actual instrument, and the finder understated it

**F5 — CONFIRMED, and stronger than the finder stated.** The finder reported only that the Queens NTA
list "contains, as distinct entries, `Flushing Meadows-Corona Park` and `Flushing-Willets Point`".
The full row I pulled from `9nt8-h7nd` is decisive:

```
QN8191 | Flushing Meadows-Corona Park | FlshMdwCPk | ntatype 9 | QN81 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | FrstPk     | ntatype 9 | QN82 | QN82 Forest Park (JIA 82 Approximation)
```

**The City labels these "JIA" in the CDTA name itself.** Flushing Meadows–Corona Park is not merely
outside Flushing's NTA; it is outside every community district's tabulation area, in a CDTA whose
published name is literally `(JIA 81 Approximation)`. Forest Park sits in `(JIA 82 Approximation)`.
That is the instrument that carried wave 3 and wave 4, and it is exact.

**F223 — REFUTED.** The finder wrote, marked `[PARAPHRASE]`, that "Flushing Meadows–Corona Park itself
lies substantially in CD 4," and told the verifier not to take it on trust. Correctly so. NYC Parks
property `Q099 Flushing Meadows Corona Park` returns `communityboard: "403404406407408"` and
`zipcode: "11354, 11355, 11367, 11368"`, acreage `870.761`. **The park spans five community boards —
3, 4, 6, 7 and 8 — including CD 7.** It is not "substantially in CD 4". The claim must not print.
(This changes nothing about the ruling: the park is a JIA and belongs to no neighborhood file.)

---

## §4 — NEIGHBORHOOD ASSIGNMENT RULINGS

### 4.1 QUEENS BOTANICAL GARDEN → **FLUSHING**. The finder's "hardest boundary call" is settled.

The finder recorded this as unresolved (P26, F221–F228) and offered three possible dispositions. It
is resolvable, on the same instrument that decided Forest Park.

**Test.** I took the Garden's address point from DCP GeoSearch — `43-50 Main Street, Queens, NY
11355` → `-73.827732, 40.751085` — and classified it against all 82 Queens NTA polygons from
`9nt8-h7nd` (point-in-polygon, holes honoured).

**Result:**

```
-73.827732, 40.751085  ->  QN0707 | Flushing-Willets Point | QN07 | QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation)
```

**It is not in `QN8191`. It is not in the Jointly Interested Area. It is inside Flushing's own core
NTA, inside CD 7.** Corroborating: PLUTO returns `cd: 407`; GeoSearch returns
`"neighbourhood": "Flushing"`; NYC Parks' Properties dataset has **no** park property for the Queens
Botanical Garden at all (my `signname like '%Botanical%'` sweep returned only the George Washington
Carver Botanical Garden in South Jamaica and Manhattan's 6BC Botanical Garden), so Parks does not
treat it as one of its own park properties despite owning the land; and it is not among the eight
CitiFieldPlaces holdings.

**F221 — the crux quote — UNCERTAIN, and it does not matter.** `queensbotanical.org` returned HTTP
403 to me on both `/about/` and `/`, so I could not re-quote "Located at the northeast corner of
Flushing Meadows-Corona Park in Flushing". **Author: do not reproduce that sentence — no verifier has
confirmed it.** The Garden's *other* self-description, "moved to its current location on Main Street
in Flushing" (F224), points the same way as the City's geography, but it too is unre-verified.

**RULING — Queens Botanical Garden is a FLUSHING place.**
**Address: `43-50 Main Street, Flushing, NY 11355`** (institution's own, PLUTO and GeoSearch all
agree; BBL `4051070200`).

Publishable with that address. **But almost nothing about it is publishable in prose**, because every
descriptive fact the finder gathered (mission, hours, admission, the two 1939 blue atlas cedars, the
1961-vs-1963 move date, the 39-acre figure) came from a page I could not re-fetch. Those are all
`uncertain`. The acreage is additionally contradicted: 39 acres claimed vs PLUTO `lotarea 1463449`
sq ft ≈ 33.6 acres. **Do not publish an acreage. Do not publish hours or admission prices.** A second
finder with a JavaScript-capable or differently-headered fetch should re-take this page.

### 4.2 ALLEY POND PARK — the live marquee question. **It is NOT a Jointly Interested Area.**

This is the ruling the brief asked for and it goes the opposite way to the last two parks. The brief
warned me not to assume the JIA answer just because Forest Park and Flushing Meadows went that way.
It was right to warn me.

**The finder's parallel (F9) is REFUTED as an inference.** The finder observed that "DCP gives Alley
Pond Park its own NTA (`QN1191`, ntatype 9) in CD 11, exactly as it gives Kissena Park its own NTA
(`QN0791`) in CD 7," and offered the parallel to the Bayside and Douglaston finders. The observation
is correct; the inference anyone would draw from it is wrong.

**`ntatype 9` is not the JIA marker.** Here is the full Queens set of `ntatype 9` areas:

| nta2020 | ntaname | cdta2020 | cdtaname | JIA? |
|---|---|---|---|---|
| `QN0191` | Astoria Park | `QN01` | QN01 Astoria-Queensbridge (CD 1 Equivalent) | **no** |
| `QN0791` | Kissena Park | `QN07` | QN07 Flushing-Murray Hill-Whitestone (CD 7 Approximation) | **no** |
| `QN0891` | Cunningham Park | `QN08` | QN08 Fresh Meadows-Hillcrest-Briarwood (CD 8 Approximation) | **no** |
| `QN1091` | Spring Creek Park | `QN10` | QN10 South Ozone Park-Howard Beach (CD 10 Approximation) | **no** |
| **`QN1191`** | **Alley Pond Park** | **`QN11`** | **QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)** | **no** |
| `QN1491` | Rockaway Community Park | `QN14` | QN14 The Rockaways (CD 14 Approximation) | **no** |
| `QN8191` | Flushing Meadows-Corona Park | `QN81` | QN81 Flushing Meadows-Corona Park **(JIA 81** Approximation) | **YES** |
| `QN8291` | Forest Park | `QN82` | QN82 Forest Park **(JIA 82** Approximation) | **YES** |
| `QN8491` | Jamaica Bay (East) | `QN84` | QN84 Jamaica Bay (East) **(JIA 84** Approximation) | **YES** |
| `QN8492` | Jacob Riis Park-Fort Tilden-Breezy Point Tip | `QN84` | QN84 Jamaica Bay (East) **(JIA 84** Approximation) | **YES** |

**The JIA marker is the `QN8x` CDTA whose published name contains the literal string "(JIA NN
Approximation)".** Every `ntatype 9` park that sits inside a real community-district CDTA is an
ordinary park tabulation area, not a Jointly Interested Area. Alley Pond Park is one of those.

**The governing precedent confirms this.** Astoria Park is `QN0191`, `ntatype 9`, CDTA `QN01` — and
wave 1 awarded it to Astoria. I confirmed it ships: `priv/seed_data/queens/astoria.json` contains
place records named `Astoria Park` and `Astoria Park Pool and Play Center`. **A `ntatype 9` park
inside a real community district is awardable and has already been awarded once in this borough.**

**So the honest answer is NOT "nobody publishes it."** Whoever writes Bayside or Douglaston may
publish Alley Pond Park if the evidence supports an award. But the evidence for *which* of them is
weak, and here are the measurements so the arbitrator does not have to take my word for it.

**Test — area sampling, the same method three wave-4 verifiers used on Forest Park.** I took the NYC
Parks property polygon for Alley Pond Park (`Q001`) and drew 600 uniform random points inside it,
classifying each against the 82 Queens NTA polygons:

| NTA | ntaname | CDTA | share |
|---|---|---|---|
| `QN1191` | **Alley Pond Park** | QN11 | **484 / 600 = 80.7%** |
| `QN1102` | Bayside | QN11 | 43 / 600 = **7.2%** |
| — | (unclassified — water / boundary slivers) | — | 37 / 600 = 6.2% |
| `QN1103` | Douglaston-Little Neck | QN11 | 29 / 600 = **4.8%** |
| `QN1302` | **Bellerose** | **QN13** | 5 / 600 = 0.8% |
| `QN1104` | Oakland Gardens-Hollis Hills | QN11 | 2 / 600 = 0.3% |

Compare Kissena Park (`Q024`), same method, 600 points: **99.5% `QN0791 Kissena Park`**, 0.5%
`QN0705 East Flushing`. Kissena is a clean, self-contained park NTA in CD 7.

**Corroborating facts I pulled from NYC Parks:**
- Its web page is `Q001GROUP`, `Property Type: **Park Group**` — not a single property.
- `Zip Code: 11361, 11362, 11363, 11364, 11426` — five ZIPs (Bayside, Little Neck, Douglaston,
  Oakland Gardens, Bellerose).
- `Community Board: **11, 13**` — **two** community districts. The Socrata Properties row for `Q001`
  says `411` alone; the live page says 11 *and* 13. The park reaches outside CD 11 entirely.
- `Council Member: Vickie Paladino , Linda Lee` — two council members.
- Acreage `635.514` (Socrata `Q001`); the page reports `530.4 Acres of Natural Areas`.
- **NYC Parks publishes no street address for it.** The location line is a boundary string:
  **`Little Neck Bay to Springfield Blvd, Union Tpke`**.
- **Its Historical Signs page is empty.** `https://www.nycgovparks.org/parks/alley-pond-park/history`
  returns page chrome and no narrative. NYC Parks publishes no history essay for this park.

**MY RULING on Alley Pond Park, stated plainly:**

1. **It is not a Jointly Interested Area.** The Forest Park / Flushing Meadows instrument does not
   reach it. Anyone who writes "another JIA, so nobody publishes it" is wrong on the data.
2. **No neighborhood holds a plurality of it.** Four fifths of it is its own tabulation area. Bayside
   holds 7.2%, Douglaston-Little Neck 4.8% — Bayside's edge is real but both are slivers, and the
   park also reaches Oakland Gardens and Bellerose, the latter in a different community district
   that is not in this wave at all.
3. **There is no publishable street address.** Only the boundary string `Little Neck Bay to
   Springfield Blvd, Union Tpke` and five ZIPs.
4. **It is definitively NOT a Flushing place.** Zero of my 600 samples landed in any CD 7 NTA. It is
   miles east, in a different community district. **The Flushing page must not create it and must
   not narrate it.**

**Recommendation to the arbitrator:** if it is awarded at all, **Bayside** has the better-evidenced
claim on area share (7.2% vs 4.8%) — but that is a 43-point-to-29-point margin on slivers, and I
would not call it strong. A defensible alternative is a shared boundary-feature treatment: both pages
may say the park adjoins them, neither creates it as an exclusive record. **What must not happen is
either page describing Alley Pond Park as *its* park, or either page inventing a street address for
it.** If it is created, the location string must be the Parks boundary string verbatim, and the prose
must come from somewhere other than NYC Parks, which publishes none.

### 4.3 KISSENA PARK → **FLUSHING**, with a caveat the finder found and I confirm

99.5% of the polygon is `QN0791 Kissena Park` inside `QN07` (CD 7). Same structure as Astoria Park.
Awardable to Flushing on the wave-1 precedent.

**Address — the finder never gave one, and there is one.** NYC Parks Properties `Q024` publishes
`address: "164-01 BOOTH MEMORIAL AVE"`, `zipcode: "11365"`, `communityboard: "407"`,
`acres: "237.147"`, `typecategory: "Community Park"`.

**CONFIRMED caveat (F229, §L row 8):** the ZIP is **11365**, which is not one of Flushing's three
ZIPs (11354 / 11355 / 11358). 11365 is Fresh Meadows. GeoSearch nonetheless returns
`neighbourhood: 'Flushing'` for `164-01 Booth Memorial Avenue` (snapping to `164-15`). The NTA
evidence is CD 7 and decisive; the ZIP is an artefact. **Publish the address as
`164-01 Booth Memorial Avenue, Flushing, NY 11365`, or omit the ZIP. Do not silently change it to
11355 to make it look tidier.**

Acreage: **237.15 (NYC Parks)**, not 234 (Wikipedia). §N row 19 resolved in favour of Parks.

### 4.4 Places sources place in FLUSHING, with exact addresses — CONFIRMED

I re-ran the LPC `buis-pvji` query myself. **All 23 rows reproduced character-for-character** against
the finder's F95 table. The nine individual landmarks in `QN0707 Flushing-Willets Point`:

| Place | LPC address (verbatim) | LP number | designated |
|---|---|---|---|
| Bowne House | `37-01 Bowne Street` | LP-00143 | 2/15/1966 |
| Flushing High School | `35-01 Union Street` | LP-01798 | 1/8/1991 |
| Flushing Town Hall | `137-35 Northern Boulevard` | LP-00139 | 7/30/1968 |
| Friends Meeting House | `137-16 Northern Boulevard` | LP-00141 | 8/18/1970 |
| Kingsland Homestead, Amendment to Landmark Site | `143-35 37th Avenue` | LP-00005A | 10/14/1965 |
| Lewis H. Latimer House | `34-41 137th Street` | LP-01924 | 3/21/1995 |
| Protestant Reformed Dutch Church of Flushing (Bowne Street Community Church) | `143-11 (143-19) Roosevelt Avenue` | LP-02137 | 12/13/2016 |
| Saint George's Church, Old Parish House and Graveyard | `38-02 Main Street` | LP-02053 | 2/8/2000 |
| Weeping Beech Tree | `Weeping Beech Park, 37th Avenue between Parsons Boulevard and Bowne Street` | LP-00142 | 4/19/1966 |

Plus two in `QN0704 Murray Hill-Broadway Flushing`:

| Fitzgerald/Ginsberg House | `145-15 Bayside Avenue` | LP-02160 | 9/20/2005 |
| Voelker Orth Museum, Bird Sanctuary and Victorian Garden | `149-19 38th Avenue` | LP-02272 | 10/30/2007 |

**All eleven are Flushing places.** GeoSearch returns `"neighbourhood": "Flushing"` for every address
I spot-checked, PLUTO returns `cd: 407`, and **no landmark is claimed by both Flushing and either
Bayside or Douglaston** — I re-ran the query across all fourteen CD 7 and CD 11 NTAs and the
`QN1102` / `QN1103` rows (35-34 Bell Boulevard, Hawthorne Court Apartments, Ahles House, Lawrence
Graveyard, Benjamin P. Allen House, Cornelius Van Wyck House) are disjoint from Flushing's. **There
is no overlap to arbitrate between the three wave-5 pages.**

### 4.5 **145-15 BAYSIDE AVENUE IS IN FLUSHING.** The trap, defused.

**CONFIRMED, and the author must not get this wrong.** The Fitzgerald/Ginsberg Mansion sits on a
street called **Bayside Avenue**. It is not in Bayside.

- LPC assigns it `nta2020 = QN0704 Murray Hill-Broadway Flushing` — a CD 7 NTA.
- DCP GeoSearch, my own query: `'145-15 BAYSIDE AVENUE, Flushing, NY, USA'`,
  `neighbourhood='Flushing'`, `borough='Queens'`, `postalcode='11354'`.

**A street named Bayside Avenue is not the neighborhood of Bayside.** Same for the Q16 bus routed
"via Union Street and Bayside Avenue". §L row 14 CONFIRMED.

### 4.6 Places that are NOT Flushing — CONFIRMED out of scope

| Place | Where it actually is | Evidence |
|---|---|---|
| Pomonok, Electchester | **CD 8** — `QN0802 Pomonok-Electchester-Hillcrest`, `QN08` | my NTA query |
| Kew Gardens Hills / Queens College site | **CD 8** — `QN0801 Kew Gardens Hills` | my NTA query |
| Mount Hebron Cemetery | **CD 8** — `QN0871`, `ntatype 7` | my NTA query |
| Alley Pond Park | **CD 11 + CD 13** | §4.2 above |
| Frank Golden Park, Flushing Airport | College Point | finder's Parks fetch, not re-tested — `uncertain` |
| Moore-Jackson Cemetery | Woodside (ships already) | finder — `uncertain` |
| The World Journal HQ | Whitestone (wave 6, out of scope) | Wikipedia only — `uncertain` |
| 1964–65 World's Fair Carousel | Corona ground, inside the JIA | firewalled regardless |

**East Flushing (§L row 2) — the roster/DCP conflict is CONFIRMED and it is a coordinator issue.**
I read both files. DCP: `QN0705 | East Flushing | ntatype 0 | QN07` — **CD 7**. The roster:
`{'slug': 'east-flushing', 'name': 'East Flushing', 'community_district': 11, 'wave': 8,
'in_scope': False}` — **CD 11**. The roster's own `source` field admits its method was
"Wikipedia's fourteen Queens Community Board articles … reconciled against Wikipedia's List of Queens
neighborhoods, fetched 2026-08-31. Web search was unavailable for this pass, so the NYC Department of
City Planning Neighborhood Tabulation Areas and community distric[t]…" — i.e. the roster was built
*without* the DCP data I just queried. **DCP is right and the roster is wrong.** Flag to the
coordinator; it does not block this page, since East Flushing is `in_scope: false` either way.

**F11 — CONFIRMED verbatim.** Murray Hill, Broadway–Flushing and Queensboro Hill are all
`community_district: 7, wave: 5, in_scope: False`. **They get no file of their own.** The two
landmarked museums in `QN0704` (Voelker Orth, Fitzgerald/Ginsberg) would otherwise go unwritten.
**RULING: the Flushing page absorbs them.** They are CD 7, GeoSearch calls them Flushing, no other
in-scope file can claim them, and leaving two designated City landmarks unwritten to honour a
tabulation boundary the roster does not even implement would be a worse error.

---

## §5 — BAYSIDE / DOUGLASTON: DO NOT MANUFACTURE TIES

The brief warned that the adjacency hazard is real between Bayside and Douglaston and **essentially
absent** between either of them and Flushing. I tested this and the brief is right.

**Flushing is in `QN07`. Bayside and Douglaston are in `QN11`.** A whole community district boundary
lies between them, and Auburndale and Oakland Gardens lie in between geographically. **I found no
source that places any *place* in Flushing in Bayside or Douglaston, or vice versa.**

The finder found five cross-references and every one is a non-tie. My verdicts:

| # | The cross-reference | Verdict | Author's instruction |
|---|---|---|---|
| §L 4 | The Long Island Koreatown "originated in Flushing" and spread east along Northern Blvd to Murray Hill, Auburndale, Bayside, Douglaston, Little Neck, Nassau | `uncertain` (Wikipedia only) | This is a **diaspora spreading along a road**, not neighborhoods adjoining. Write Flushing's own six blocks — **Union Street between 35th and 41st Avenues** — and stop. Do not write that Flushing borders Bayside. |
| §L 14 | "Bayside Avenue" | **CONFIRMED as Flushing** | See §4.5. Not a tie. |
| §L 16 | The Bayside Historical Society's president wrote in support of a Flushing designation | `uncertain` | **A letter at a hearing is not a place.** Do not create it, do not mention it. |
| §L 17 | "The Bayside Quakers" plot, Section I, Flushing Cemetery, sourced to a 1967 newspaper column | `uncertain`, single-sourced | Half an acre of graves. If it ships at all it ships with attribution to the 1967 column, and it says nothing about the modern neighborhoods. |
| §L 18 | The 113- ZIP sectional centre "extends … east to Bayside and Little Neck" | `uncertain` (Wikipedia only) | **A postal-administration boundary, not a neighborhood link.** It must not be written as a claim that the neighborhoods adjoin. |
| §L 19 | The historic **town** of Flushing (1683–1898) ran east to what became the Nassau County line | `uncertain` | **This is the single largest risk of manufacturing a false tie.** The historic town contained the ground that is now Bayside and Douglaston. **The modern neighborhood does not.** If the page writes about the colonial town's extent, it must say "the town of Flushing" and make the 1898 consolidation explicit in the same breath. |

**Anything sources place in Nassau County, Great Neck or Little Neck is outside this corpus** and
must not be written — including the n20G NICE bus to Great Neck.

---

## §6 — PUBLISHABLE STREET ADDRESSES

**Places with a publishable street address — CONFIRMED (I re-quoted each string):**

| Place | Exact address string | Confirmed against |
|---|---|---|
| Bowne House | `37-01 Bowne Street, Flushing, NY 11354` | LPC LP-00143 PDF; `bownehouse.org/about` ("37-01 BOWNE STREET, FLUSHING NY 11354"); GeoSearch; PLUTO |
| Old Quaker / Friends Meeting House | `137-16 Northern Boulevard, Flushing, NY 11354` | LPC LP-00141 PDF; GeoSearch |
| Kingsland Homestead / Queens Historical Society | `143-35 37th Avenue, Flushing, NY 11354` | QHS `/location-hours`; LPC LP-00005A; PLUTO; GeoSearch |
| Flushing Town Hall | `137-35 Northern Blvd., Flushing, NY 11354` | LPC LP-00139 PDF; `flushingtownhall.org` footer |
| Lewis H. Latimer House Museum | `34-41 137th St, Flushing, NY 11354` | LPC LP-01924 PDF; museum `/visit` (live page reads `34-41 137th St Flushing, NY 11354`, **no period after "St"** — the finder added one) |
| St. George's Church | `38-02 Main Street, Flushing, NY 11354` | LPC LP-02053 PDF gives the aka itself |
| Bowne Street Community Church | `143-11 Roosevelt Avenue, Flushing, NY 11354` | LPC LP-02137 PDF header gives both forms |
| Flushing High School | `35-01 Union Street, Flushing, NY 11354` | LPC LP-01798 PDF; GeoSearch |
| Weeping Beech / Margaret I. Carman Green | `37th Avenue between Parsons Boulevard and Bowne Street` | LPC LP-00142 — a between-streets string, not a house number |
| Fitzgerald/Ginsberg Mansion | `145-15 Bayside Avenue, Flushing, NY 11354` | LPC; GeoSearch |
| Voelker Orth Museum | `149-19 38th Avenue, Flushing, NY 11354` | LPC; GeoSearch |
| Queens Botanical Garden | `43-50 Main Street, Flushing, NY 11355` | PLUTO; GeoSearch; BBL 4051070200 |
| Ganesh Temple | `45-57 Bowne Street, Flushing, NY 11355` | temple `/about`; GeoSearch; DOHMH |
| Flushing Cemetery | `163-06 46th Avenue, Flushing, NY 11358` | cemetery homepage, re-quoted; GeoSearch |
| Kissena Park | `164-01 Booth Memorial Avenue, Flushing, NY 11365` | NYC Parks Properties `Q024` |
| Olde Towne of Flushing Burial Ground | `46 Ave. bet. 164 St. and 165 St.`, ZIP 11358 | NYC Parks `Q017` page, re-quoted |
| RKO Keith's (interior landmark) | `135-29 – 135-45 Northern Boulevard, Flushing, NY 11354` | LPC LP-01257 PDF, re-read |
| Free Synagogue of Flushing | `41-60 Kissena Blvd., Flushing, NY 11355` | NRHP `09000834` — `uncertain`, see §8 |
| Flushing Armory | `137-58 Northern Boulevard` | NRHP `95000274`/GeoSearch — `uncertain`, see §8 |

**Places with NO publishable street address:**
- **Alley Pond Park** — NYC Parks publishes only `Little Neck Bay to Springfield Blvd, Union Tpke`.
- **Flushing Chinatown, Koreatown, Little India** — these are districts, not addressed places. They
  may be described by their confirmed street bounds only.
- **Sikh Center of New York** — sourced to a photo caption with no address. **Do not create it.**
- **Pure Presbyterian Church** — a photo caption gives `142-08 32nd Avenue`, single-sourced,
  aggregator. `uncertain`.

---

## §7 — BUSINESSES: THE DOHMH-ONLY RULING

**I re-ran the DOHMH query myself** against `43nn-pn8j`, filtered `boro='Queens'` and
`zipcode in('11354','11355','11358')`, per DBA. **All eight rows reproduced exactly** — same DBA
string, same building-and-street, same ZIP, same `cuisine_description`. The finder's table is
CONFIRMED character-for-character.

| # | DBA (verbatim) | Address (verbatim) | ZIP | Cuisine | Sourcing | Verdict |
|---|---|---|---|---|---|---|
| P50 | `NAN XIANG XIAO LONG BAO` | `39-16 PRINCE STREET` | 11354 | `Chinese` | **DOHMH ONLY** | address only |
| P51 | `JOE'S STEAM RICE ROLL` | `136-20 ROOSEVELT AVENUE` | 11354 | `Chinese` | **DOHMH ONLY** | address only |
| P52 | `WHITE BEAR` | `135-02 ROOSEVELT AVENUE` | 11354 | `Chinese` | **DOHMH ONLY** | address only |
| P53 | `XI'AN FAMOUS FOODS` | `133-36 37 AVENUE` | 11354 | `Chinese` | **DOHMH ONLY** (see below) | address only |
| P54 | `XI'AN FAMOUS FOODS` | `41-10 MAIN STREET` | 11355 | `Asian/Asian Fusion` | **DOHMH ONLY** | address only |
| P55 | `SZECHUAN MOUNTAIN HOUSE` | `39-16 PRINCE STREET` | 11354 | `Chinese` | **DOHMH ONLY** | address only |
| P56 | `SHANGHAI YOU GARDEN` | `135-33 40 ROAD` | 11354 | `Chinese` | **DOHMH ONLY** | address only |
| P57 | `TONG SAM GYUP GOO YI` | `162-23 DEPOT ROAD` | 11358 | `Korean` | **DOHMH ONLY** | address only |
| P42 | `TEMPLE CANTEEN` | `45-57 BOWNE STREET` | 11355 | `Indian` | DOHMH **+ the temple's own website** | **not DOHMH-only** |

**RULING, stated as plainly as the brief demands:**

**Eight of these nine businesses have a DOHMH/DCWP inspection record as their ONLY source.** For each
of them — Nan Xiang Xiao Long Bao, Joe's Steam Rice Roll, White Bear, both Xi'an Famous Foods
locations, Szechuan Mountain House, Shanghai You Garden and Tong Sam Gyup Goo Yi — **its existence
and its address may be published, and NOTHING about it may appear in prose.**

A DOHMH row establishes exactly one thing: that a business trading under that name was inspected at
that address. It establishes **nothing** about quality, fame, history, hours, whether it is still
open, or whether it is worth travelling for. **No DOHMH-only business may be called notable, famous,
acclaimed, beloved, celebrated, a destination, a must-visit, or "the best" anything.** No adjective.
No sentence of description. Name and address, or omit.

**I upgrade the finder's treatment of the two "navbox" entries to DOHMH-only.** The finder gave
Xi'an Famous Foods and Szechuan Mountain House a second source: the Wikipedia Flushing navbox. I
re-read the finder's own F317 and agree with its own caveat — **a navbox entry means an article
exists, not that the business is significant.** It is not an independent source about the business.
Treat all three rows as DOHMH-only.

**P42 Temple Canteen — the one genuine exception.** I re-fetched `nyganeshtemple.org/about/` and
confirmed the string `Temple Canteen` appears on the temple's own site, and the DOHMH address
`45-57 BOWNE STREET` matches the temple's own `45-57 Bowne Street, Flushing, NY 11355` exactly. It is
**not** DOHMH-only and may carry modest prose.

**F318 — CONFIRMED and important.** Fifteen named restaurants (Spicy & Tasty, Hunan House, Golden
Shopping Mall, New World Mall, Little Lamb, Guan Fu, Tianjin, Happy Stony Noodle, Laoshan, Dumpling
Galaxy, Fu Run, Hangawi, Kum Gang San, Mapo Korean BBQ, Sik Gaek) return no DOHMH row under those
names. **Absence is NOT evidence a place does not exist or has closed.** DOHMH records the legal DBA,
and food courts trade under the operator's name. **The author must not write "X has closed" from
this.**

**F319 — CONFIRMED as a gap, and it is consequential.** No Michelin, no James Beard, no third-party
culinary recognition was obtained by the finder, and I did not obtain any either. **Flushing's entire
reputation as a food destination rests, in this corpus, on one uncited aggregator sentence (F291,
"food mecca"). The author may NOT write Flushing's food scene in superlatives.** Describe the
enclaves' confirmed geography instead.

---

## §8 — SINGLE-SOURCED CLAIMS: what may ship, and how

**The governing rule: 174 facts are Wikipedia-only. None of them is confirmed.** My blanket ruling:

- **A Wikipedia-only claim that is descriptive, low-stakes and carries no superlative or contested
  number** (street bounds of an enclave, the existence of a subsection, a ZIP list) **may ship with
  attribution**, phrased so the reader knows it is a general reference work speaking.
- **A Wikipedia-only claim carrying a superlative, a record, a first, a ranking, or a precise
  statistic MAY NOT SHIP AT ALL.** These are exactly the claims a general reference work is least
  reliable on and this page is most tempted by.

**Named claims that MUST NOT SHIP:**

| Claim | Why |
|---|---|
| Flushing Town Hall is "an affiliate of the Smithsonian Institution" (F160) | **I re-fetched `flushingtownhall.org` and the string "Smithsonian" does not appear anywhere on it.** The institution does not claim this about itself. Wikipedia-only. **Do not publish.** (Note: the site's nav *does* carry "Mission & History" and "Visitor Info" pages, contra the finder's report that they 404 — a second finder should mine them.) |
| The Ganesh Temple was "the very first of the traditional Hindu temple organized in North America" (F272) | Wikipedia-only, ungrammatical in the source, **and I searched the temple's own `/about` page for "first", "oldest", "traditional" and "1977" — not one appears.** The institution does not make this claim about itself. **Do not publish.** |
| "There are more than 200 houses of worship in Flushing" (F271) | Wikipedia-only and uncited in the source. |
| "over 30,000 individuals born in China alone, the largest Chinatown by this metric outside Asia" (F283) | Wikipedia-only; and §N row 27 shows the same encyclopedia contradicting itself about whether Flushing or Brooklyn is larger, giving Brooklyn the larger number **in the same paragraph**. |
| "one of the oldest Little India neighborhoods in North America" (F311) | Wikipedia-only, uncited. |
| The Weeping Beech planting date **1647** (F146) | **See §9.1. Never publish 1647.** |
| The Broadway–Flushing ethnicity block (F31) | Sums to **116.7%**. Internally impossible. |
| "following Northern Blvd. **west** into Nassau County" (F315) | Nassau is **east**. The source's compass is wrong. |
| Any Chinatown romanisation (F285) | Two Wikipedia articles give different Jyutping and different Hokkien POJ for the same characters. **No romanisation without a language-competent check.** |
| The 1966 Bowne House ownership sentence as present tense (F111) | I could not locate that sentence in LP-00143 on my read — `uncertain`. And PLUTO gives the current owner as `NYC DEPARTMENT OF PARKS AND RECREATION`. Ownership changed after 1966. |
| Lewis Latimer House closure dates "Saturday, July 4 and Sunday, July 12" (F176) | **Still live on the page and still carrying no year.** Stale-risk. Publish hours if at all; never the closure dates. |
| Any duration | The corpus bans durations. Drop the museum's "45-minute" tour, the "approximately 15 minutes" walk and the "approximately 10 minutes" bus. |
| Louis Armstrong as a Flushing figure | He is **buried** in Flushing Cemetery; he **lived** in Corona, where his house museum is and where wave 3 placed it. **Burial is not residence.** Keep them apart or the Corona page is contradicted. |

**Single-sourced claims that MAY ship WITH attribution:**
- The Flushing Cemetery jazz burials — but **each name individually**, and framed as burials, not as
  Flushing lives. The list is an aggregator list on a weakly-sourced page.
- The enclave street bounds: Main Street between Kissena Boulevard and Roosevelt Avenue (Chinatown's
  heart, marked by the LIRR Port Washington Branch overpass); Union Street between 35th and 41st
  Avenues (Koreatown's origin); south of Franklin Avenue (the South Asian corridor). These are
  precise, walkable and low-stakes.
- The causal account of why Flushing's Chinatown is Mandarin-speaking rather than Cantonese
  (F289) — a strong and interesting claim, but attribute it.

---

## §9 — CORRECTIONS THE AUTHOR MUST HAVE

### 9.1 THE WEEPING BEECH TREE IS DEAD. This is the likeliest single error on the page.

**I read LP-00142 myself.** The PDF header reads, verbatim:

> `THE WEEPnm BEECH TREE, .37th Avenue between Parsons Boulevard and Bowne Street, Flushing, Borough of Queens. 1647.`

**"1647" is genuinely what the Commission printed** — and I confirm the string **"1847" appears
nowhere in LP-00142**. So this is the Commission's own typesetting error, not OCR damage, and the
finder's transcription is CONFIRMED as a quotation. Meanwhile NYC Parks, republished by the Queens
Historical Society, says the tree "lived for 151 years, **from 1847 to 1998**" — which I re-fetched
and confirmed verbatim on `queenshistoricalsociety.org/weeping-beech-park`.

**RULINGS:**
1. **Never publish 1647.** The date is `uncertain`; 1847 is far better evidenced.
2. **The tree died in 1998.** A writer working from the 1966 LPC report alone would describe a living
   landmark standing behind an iron fence. **It is a landmark site, not a living tree.** LPC's
   present-tense description ("Today it is over sixty feet high…", "stands in its imposing majesty
   for all to admire") is 1966 text about a tree that no longer exists.
3. The park is now **Margaret I. Carman Green–Weeping Beech Park**, `2.074 Acres` (QHS/Parks,
   re-confirmed). NYC Parks' own page for it 404s — I retried and got 404 too.

### 9.2 Other date-and-fact traps I confirmed

- **Lewis H. Latimer House**: PLUTO's `yearbuilt: 1990` and `lotarea: 325000` describe the **parkland
  lot**, not the house. LPC LP-01924, which I re-read, gives `Built c. 1887-89`. **Do not publish
  1990.** The house was moved in 1988 — LPC verbatim: "In 1988, when the house was threatened with
  demolition, it was moved to its present site across the street from the Latimer Gardens housing
  project, which had been named in Lewis Latimer's honor".
- **Kingsland Homestead** was moved in **1968**. That is why four addresses exist.
- **St. George's**: PLUTO `yearbuilt: 1907` is the **Old Parish House**, not the 1853–54 church.
- **RKO Keith's is an INTERIOR landmark only.** I re-read LP-01257: the designation is of the "ground
  floor interior consisting of the ticket lobby and original ticket booth, grand foyer, twin
  staircases leading to the mezzanine promenade…". I also re-queried `ncre-qhxs` and found **twelve**
  rows for it, all `lm_type = Interior Landmark`, spanning `135-27 NORTHERN BOULEVARD` and
  `35-10` through `35-28 FARRINGTON STREET`. **The author must not describe the building's exterior
  as landmarked.** (F96 is refuted only in presenting one of twelve rows as the row.)
- **Bowne House "the oldest [house] in Queens"** — CONFIRMED verbatim from LP-00143. It is a 1966
  LPC finding. Attribute it to LPC and to 1966; do not assert it flatly for 2026.
- **The "oldest house of worship" collision is real.** LP-00141, which I re-read, says of the Friends
  Meeting House: "This is the oldest house of worship standing in New York City, and one of the
  oldest in the country." NYC Parks/QHS say of the **Bowne House**: "perhaps the oldest existing
  house of worship in America." Both re-confirmed verbatim. **They cannot both anchor a sentence.**
  Prefer LPC's, which is narrower and primary.
- **F122 quote correction.** The finder rendered `forty-~oot oak timbers`. The PDF reads
  `forty~oot oak timbers` — no hyphen. The substance ("forty-foot oak timbers, each hand hewn from a
  single tree") is CONFIRMED and it is the best physical detail in the file.

### 9.3 Primary material I confirmed that the finder undersold

- **Samuel Seabury, from LP-02053 directly** — "In 1761, under the leadership of Samuel Seabury, who
  later became the first bishop of the Episcopal Church in America, the church was officially
  incorporated under a Royal Charter from George III". Primary, verbatim, CONFIRMED.
- **Agnes Fairchild Northrop, from LP-02137 directly** — "Several of the windows were designed by
  artist and congregant Agnes Fairchild Northrop of Tiffany Studios." Primary, verbatim, CONFIRMED.
  Also confirmed: the church was `Built: 1891-92; architect, George E. Potter (attributed); builder,
  Edward Richardson` — a build date the finder never recorded.
- **Flushing High School, LP-01798 verbatim** — "Built 1912-15; architect C.B.J. Snyder,
  Superintendent of School Buildings, New York City Board of Education" and "the oldest public
  secondary school institution in New York". CONFIRMED as LPC's wording. Note §N row 14: three
  sources give three different scopes for this superlative. **Use LPC's exact scope or none.**
- **The Olde Towne of Flushing Burial Ground — I recovered the full NYC Parks text the finder could
  not, and it is the strongest material on the page.** CONFIRMED verbatim: established 1840 as a
  pauper's burial ground; "Over time, the burials were mostly people of African American and Native
  American descent"; names over time including "Town Ground", "Pauper's Burial Ground" and "Colored
  Cemetery of the Olde Towne of Flushing"; "as many as 1,000 people"; "more than half of those
  interred here are under the age of five and only a quarter are over the age of 30"; final burial
  1898; transferred to Parks 1914; a 1919 survey recording four marble headstones — **Alfred E. Bunn
  (died 1876, age 3), George H. Bunn (died 1887, age 17), James Bunn (died 1890, age 53) and Willie
  Curry (died 1874, age 4)**; the 1930s "Martin's Field" playground built over it, "The bodies were
  never relocated, and the grounds were completely desecrated", with contemporary reports of "bones
  galore"; and community activist **Mandingo Osceola Tshaka (1931–2022)**, whose advocacy led to the
  National Register listing. The memorial has "a commemorative wall engraved with the names of 320
  people that were identified, with room for additional names that may be discovered". Park ID
  `Q017`, 3.474 acres, CB 7, ZIP 11358, location `46 Ave. bet. 164 St. and 165 St.`
  **This is a Flushing place, fully sourced to NYC Parks, and it should anchor the page.**

### 9.4 F43 — REFUTED, and the correction matters little but the sloppiness matters

The finder wrote that the `skyk-mpzq` historic-districts query "returned zero rows for CD 7 (the only
Queens historic districts returned were the Douglaston and Douglaston Hill districts, in CD 11)."
**That is wrong.** My re-run returns **thirteen** Queens historic districts: Addisleigh Park, Cambria
Heights-222nd Street, Cambria Heights-227th Street, Central Ridgewood, Douglaston Hill HD Amendment,
Douglaston HD, **Fort Totten**, Hunters Point, Jackson Heights, Ridgewood North, Ridgewood South,
Stockholm Street, and Sunnyside Gardens. **Fort Totten Historic District is in CD 7.**

**The surviving substance is still sound**, and it is what the page needs: there is **no LPC historic
district in `QN0707 Flushing-Willets Point` or `QN0704 Murray Hill-Broadway Flushing`**. Waldheim and
Broadway–Flushing really are not LPC-designated districts — Broadway–Flushing is on the **National**
Register only (`06000373`). The author may say Flushing has no City historic district; the author may
not cite the finder's version of the query.

### 9.5 F99 — CONFIRMED by my own query

I searched `ncre-qhxs` for Queens rows matching ARMORY, SYNAGOGUE, MAIN STREET and POST OFFICE:
**zero rows each.** The Flushing Armory, the Free Synagogue of Flushing, the Main Street Subway
Station and the US Post Office–Flushing Main are **National Register properties that are NOT
LPC-designated.** The finder marked this as an untested inference; it is now confirmed. **The author
must not call any of them a City landmark.**

The NRHP table itself (F98, 14 rows) is `uncertain` as a block — it was parsed from Wikipedia
wikitext, not from the NPS National Register Information System, and I did not re-fetch NPS. **Any
NRHP reference number the page prints should be checked against NPS first.**

---

## §10 — PLACES SURVIVING AS PUBLISHABLE (31)

**Fully publishable, with prose, primary-sourced (17):**
Bowne House · Old Quaker / Friends Meeting House · Kingsland Homestead · Queens Historical Society ·
Margaret I. Carman Green–Weeping Beech Park (site; **tree dead 1998**) · Flushing Town Hall ·
Lewis H. Latimer House Museum · St. George's Church, Old Parish House and Graveyard ·
Bowne Street Community Church · Flushing High School · RKO Keith's (**interior only**) ·
Voelker Orth Museum · Fitzgerald/Ginsberg Mansion · **The Olde Towne of Flushing Burial Ground** ·
Kissena Park · Kissena Velodrome · Korean War Memorial (Kissena Park).

**Publishable with prose, institutional single source — attribute (5):**
Flushing Cemetery · Hindu Temple Society of North America / Ganesh Temple (**without** the
"first in North America" claim) · Temple Canteen · Bowne Park · James A. Bland Playground
(**Parks' own careful framing of minstrelsy must not be simplified into celebration**).

**Publishable as ADDRESS ONLY, no prose (9):**
Queens Botanical Garden (address confirmed; **all descriptive content unverified — 403**) ·
Nan Xiang Xiao Long Bao · Joe's Steam Rice Roll · White Bear · Xi'an Famous Foods (×2) ·
Szechuan Mountain House · Shanghai You Garden · Tong Sam Gyup Goo Yi.

**NOT publishable (40 of 71):** the eight CitiFieldPlaces holdings and the twelve other §I firewall
rows; Flushing Meadows–Corona Park itself; **Alley Pond Park** (not Flushing); Mount Hebron Cemetery,
Pomonok, Electchester, Queens College, Frank Golden Park, Flushing Airport, the World Journal,
Moore-Jackson Cemetery, the 1964–65 Carousel (all out of scope); the Sikh Center and Pure
Presbyterian Church (photo captions only); the eleven other congregations from F270 for which **seven
institutional domains failed to resolve** — *do not write about any of them from Wikipedia's list
alone*; and the subsection "places" P1–P8, which are areas, not places.

---

## §11 — WHAT THE AUTHOR MUST BE WARNED ABOUT, IN ORDER

1. **`guide.destination` must be exactly `Flushing, New York`.** A gate asserts it. Any other string
   breaks co-listing with the Citi Field guide.
2. **The eight CitiFieldPlaces holdings and Flushing Meadows–Corona Park are firewalled** — no
   records, and **no narration of their history**. Link `/g/citi-field-guide`. The park carries
   Flushing's name and the ballpark's postal address says Flushing; that is exactly why the
   temptation is worse here than it was in Corona. Flushing's park section will read thinner than
   its fame suggests. **That is the firewall working, not a research gap.**
3. **The Weeping Beech tree is dead (1998).** Never publish 1647.
4. **Eight restaurants are DOHMH-only: address only, zero adjectives, zero prose.**
5. **No Flushing food superlatives.** There is no third-party culinary recognition in this corpus.
6. **Do not manufacture a Bayside or Douglaston tie.** The Koreatown corridor, the 113- ZIP sectional
   centre and the historic town's 1683–1898 extent are not claims that the neighborhoods adjoin.
   **Bayside Avenue is in Flushing.**
7. **Alley Pond Park is not a Flushing place** and is not this page's to write.
8. **47% of the finder rests on Wikipedia.** Every superlative in it is unconfirmed. Prefer the LPC
   reports and the NYC Parks signs, which are excellent and which I have re-read for you.

---

*Verified independently, against re-fetched sources, by the Flushing verifier. 367 claims adjudicated:
168 confirmed, 9 refuted, 190 uncertain. 31 of 71 places survive as publishable.*
