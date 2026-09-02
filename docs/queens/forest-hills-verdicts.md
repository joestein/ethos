# Forest Hills, Queens — INDEPENDENT VERIFIER verdicts

**Role:** Independent verifier. I did not defer to the finder's reasoning. Every claim below was
re-adjudicated against sources I fetched myself. Where I write a quotation, I re-read it from the
bytes myself; where I could not, I say `uncertain` rather than confirm.

## How I re-fetched

- **LPC designation reports** LP-2066, LP-2522, LP-1177 downloaded fresh from
  `s-media.nyc.gov` (5.76 MB / 3.03 MB / 1.14 MB, all valid `%PDF-`) and converted with
  `pdftotext` in **both** `-layout` and raw reading order. The finder's `-layout` output
  interleaves the two-column pages; raw order is what I quote from.
- **NYC/NY Open Data** re-pulled directly: `buis-pvji` (LPC individual landmarks),
  `skyk-mpzq` (historic districts), `qexa-qpj6` (scenic landmarks), `9nt8-h7nd` (2020 NTAs,
  **including `the_geom`**), `enfh-gkve` (Parks properties), `wg9x-4ke6` (DOE schools),
  `43nn-pn8j` (DOHMH), `64uk-42ks` (**PLUTO** — the finder never used this), `39hk-dx4f` (MTA).
- **DCP GeoSearch** was returning HTTP 503 for my first two hours and then recovered. Because I
  could not rely on it, I built an independent check the finder did not have: I pulled DCP's
  **2020 NTA polygons** and ran my own point-in-polygon against lat/longs taken from LPC's own
  dataset and from PLUTO. That is a stronger test than a geocoder's `neighbourhood` label,
  because it is DCP's actual boundary file. Both methods are reported below and I say when they
  disagree.
- **Wikipedia** re-read as `action=raw` wikitext **and** as API plaintext extracts, not through a
  summarizing layer. This matters: several finder `[Q-2nd]` items turned out accurate and one
  `[Q]` item turned out to have hidden a fact.
- **Institutional sites** re-fetched with a browser User-Agent.

## Access, re-tested

The finder's constraint disclosures are **CONFIRMED**, one for one:

| Host | My result |
|---|---|
| `foresthillstennis.com` (West Side Tennis Club) | **HTTP 503** — still down |
| `foresthillsgardens.org` (FHG Corporation) | **ConnectionResetError(54)** — refused |
| `churchinthegardens.org` | **114 bytes, empty body** |
| `nycgovparks.org` | 403 to plain fetch; **fine with a browser User-Agent** |
| `foresthillsstadium.com` | OK |
| `foresthillsgardensfoundation.org` | OK |
| `ourladyqueenofmartyrs.org` | OK |

So the finder did not overstate its difficulties. The West Side Tennis Club — the single most
important subject on this page — still has **no institutional self-description** in evidence.

---

# 1. THE RULINGS THE AUTHOR AND ARBITRATOR DEPEND ON

## 1.1 MARQUEE: Forest Park — **Forest Hills may claim it, weakly, and must not publish it as a Forest Hills address**

**Verdict: `confirmed` that Forest Park is not administratively part of Forest Hills.
Assignment ruling: Forest Hills has the only live claim in the corpus, but it is a claim of
naming and adjacency, not of containment.**

The finder recorded this as contested and declined to resolve it. I resolve it, and the decisive
evidence is one the finder never pulled.

**DCP gives Forest Park its own NTA and its own community-district equivalent.** From
`9nt8-h7nd`, re-read by me:

```
QN8291 | Forest Park | ntatype 9 | QN82 Forest Park (JIA 82 Approximation)
QN0602 | Forest Hills | ntatype 0 | QN06 Forest Hills-Rego Park (CD 6 Approximation)
```

`ntatype 9` is DCP's park code and `JIA` is "Joint Interest Area" — the same structure DCP uses
for **Flushing Meadows-Corona Park (QN8191 / QN81)** and for **Astoria Park (QN0191)**. Forest
Park is therefore in **no neighborhood NTA at all**. It is not inside QN0602 Forest Hills, and it
is not inside QN0601 Rego Park.

**Its street address is not a Forest Hills address.** PLUTO, re-read by me:

```
80-30 PARK LANE | zipcode 11415 | cd 482 | 40.7099881, -73.8376636 | NYC DEPARTMENT OF PARKS AND RECREATION
```

`cd 482` is the Forest Park joint-interest-area code, not 406. ZIP **11415 is Kew Gardens**. DCP
GeoSearch, once it recovered, agrees and is blunter than either:

```
"80-30 Park Lane, Queens" -> ("80-30 PARK LANE, Forest Park, NY, USA", neighbourhood "Forest Park", postalcode "11415")
```

DCP's own geocoder puts the address in a neighborhood called **Forest Park**.

**But the park does physically abut Forest Hills.** My point-in-polygon run on DCP's boundary
file measured the minimum distance between the Forest Park NTA ring and the Forest Hills NTA ring
at **3.3 metres** — contiguous within the file's own coordinate precision — against **567.9
metres** to Rego Park. Forest Hills is the adjacent neighborhood; Rego Park is not.

**And the naming derivation is primary-sourced and I re-quote it myself.** LP-2066, raw text,
verbatim:

> `"In 1906, developer Cord Meyer who had previously been active in the Elmhurst section of
> Queens, purchased 600 acres (comprising the land of six farms) in the area known as the
> Hopedale section of Whitepot. Changing the name to Forest Hills because of its high ground and
> its proximity to the beautiful terrain of Forest Park, he began to lay out streets, install
> utilities, and construct the first houses."`

NYC Parks' Yellowstone Park sign, re-fetched and re-quoted by me, independently:

> `"Forest Hills was once farmland owned by Frederick Backus, George Backus, and Horatio N.
> Squires. The Cord Meyer Development Company bought much of the land. Its name is derived from
> its proximity to Forest Park."`

Note the word both sources use: **proximity**. The neighborhood is named for a park it is next
to, not a park it contains. LPC's language is evidence *against* containment, not for it.

**Parks' own multi-claimant record**, re-read by me from `enfh-gkve`:

```
Forest Park | zipcode "11375, 11385, 11415, 11421" | communityboard "305405406409" | councildistrict "29, 32" | Flagship Park | 80-30 PARK LANE | 506.86 acres
```

and from the web page's data panel, re-fetched by me:
`Zip Code: 11375, 11385, 11415, 11418, 11421` / `Community Board: 5, 6, 9`. **F172 and F173 are
both `confirmed`, and the finder is right that NYC Parks contradicts NYC Parks** — the page adds
11418 and drops Brooklyn CB 5.

**RULING.** Forest Park may appear in the Forest Hills file, because Forest Hills is the only
neighborhood page in the corpus that is (a) contiguous with the park, (b) named after it in two
independent primary sources, and (c) among its four listed ZIPs and four listed community boards.
No competing claimant — Woodhaven, Richmond Hill, Glendale, Kew Gardens, Ridgewood — ships a page.

**Three hard constraints on the author:**

1. **Do not publish "80-30 Park Lane, Forest Hills, NY 11375."** That address is
   `Forest Park, NY 11415` in DCP's own geocoder and Kew Gardens by ZIP. If the page prints a
   street address for the park it must print `80-30 Park Lane, Queens, NY 11415`, or print no
   address and give cross-streets (`Myrtle Ave, Union Tpke, Park Lane S` — Parks' own `location`).
2. **Do not write that Forest Park is in Forest Hills.** Write that Forest Hills is named for it
   and borders it. Both sources say *proximity*; the page may say no more.
3. Forest Park's own named features that the Parks sign lists — **Oak Ridge**, the **Overlook**,
   the **Forest Park Carousel**, the **George Seuffert, Sr. Bandshell**, **Victory Field**, the
   **Richmond Hill War Memorial** — are Woodhaven/Richmond Hill-side features. `F177`/`F178` are
   `confirmed` as quotations but the author should link, not annex.

## 1.2 MARQUEE: Louis Armstrong House Museum — **NOT Forest Hills. Corona's, and the coordinator must check wave 1 first.**

**Verdict: `confirmed` that it is not in Forest Hills. `confirmed` address. `uncertain` which
Corona-family page owns it, and that is a coordinator problem, not mine.**

I ruled from the address, as instructed. Three sources, all re-read by me:

**NRHP listings table (raw wikitext, re-read by me):**

> `|refnum=76001265 |type=NHL |name=Louis Armstrong House |address=3456 107th St. |city=[[Corona, Queens|Corona]] |date=1976-05-11`

Note `type=NHL` — it is a **National Historic Landmark**, not merely NRHP-listed. The finder
recorded it as plain NRHP.

**PLUTO, re-read by me:**

```
34-56 107 STREET | zipcode 11368 | cd 403 | 40.7545640, -73.8615973 | NYC DEPARTMENT OF CULTURAL AFFAIRS
```

**DCP GeoSearch, re-read by me:**

```
"34-56 107 Street, Queens" -> ("34-56 107 STREET, North Corona, NY, USA", neighbourhood "North Corona", postalcode "11368")
```

**My own point-in-polygon against DCP's 2020 NTA boundary file: `North Corona`.**

**Exact publishable street address: `34-56 107th Street, Corona, NY 11368`.**

**RULING.** The Louis Armstrong House Museum is **not in Forest Hills** under any test — not by
ZIP (11368 vs 11375), not by community district (Queens 3 vs Queens 6), not by NTA, not by
geocoder, not by NRHP locality. It is 4.6 km from the Forest Hills NTA. Forest Hills has **no
claim** and the author must not reach for it. `F004` is `confirmed`.

**Warning I am escalating to the arbitrator, outside my neighborhood but material.** DCP's NTA is
**North Corona (QN0303)**, and QN0303 sits under **`QN03 Jackson Heights-East Elmhurst (CD 3
Approximation)`**, not under `QN04 Elmhurst-Corona`. PLUTO agrees: `cd 403`. So the marquee that
the wave brief calls "Corona's likely claim" is, by DCP's own geography, in **Community District
3** — the district of **Jackson Heights, which already ships as wave 1**. The postal city and the
NRHP locality both say "Corona", which is the better ground for giving it to the Corona page, and
I would rule that way. But the coordinator must confirm the wave-1 Jackson Heights file did not
already take it, because a marquee may appear in exactly one file and the NTA/CD evidence points
at a page that has already shipped.

## 1.3 Remsen Cemetery — **REGO PARK. Not this page's. The finder's Forest Hills evidence does not survive.**

**Verdict: `refuted` that the street supports a Forest Hills claim. Assignment: Rego Park, on
four independent axes.**

This is the finder's "sharpest conflict in the wave" and it is not close once the right tests are
run.

**LP-1177 names no neighborhood. `F085` is `confirmed`, and I can put it stronger than the
finder did.** I converted the full three-page report and searched the whole document:

```
'Forest Hills' present in LP-1177: False
'Rego Park'    present in LP-1177: False
```

The header, re-quoted verbatim from my own conversion:

> `"REMSEN CEMETERY, between Alderton Street and Trotting Course Lane, adjoining 69-43 Trotting
> Course Lane, Borough of Queens."` … `"Landmark Site: Borough of Queens Tax Map Block 3178,
> Lot 44."`

and the body's evasion, verbatim: `"The Remsen Cemetery is a tangible reminder of the colonial
past of this section of Queens."` The best source class is genuinely silent.

**Everything else points one way.**

1. **LPC's own dataset**, re-pulled by me — CD 406 contains exactly three individual landmarks
   and Remsen is tagged to Rego Park:
   ```
   Ridgewood Savings Bank, Forest Hills Branch | 107-55 Queens Boulevard | LP-02066 | nta QN0602 | council 29
   Firehouse, Engine Company 305 and Hook & Ladder 151 | 111-02 Queens Boulevard | LP-02522 | nta QN0602 | council 29
   Remsen Cemetery | adjacent to 69-43 Trotting Course Lane | LP-01177 | nta QN0601 | council 30 | 40.71242, -73.8584997
   ```
   `F053`, `F068`, `F086` all `confirmed` character-for-character, including the "exactly three"
   count.
2. **My point-in-polygon against DCP's boundary file**, on LPC's own coordinates
   (40.71242, -73.8584997) → **Rego Park**. On PLUTO's coordinates for the same lot
   (40.7125052, -73.8585897) → **Rego Park**. Two different coordinate sources, same answer.
3. **PLUTO**: `69-43 TROTTING COURSE LANE | zipcode 11374 | cd 406`. **NYC Parks**:
   `Remsen Family Cemetery | zipcode 11374 | councildistrict 30`, and the page data panel
   (re-fetched by me) reads `Zip Code: 11374  Community Board: 6  Council Member: Phil Wong
   Park ID: Q480  Acreage: 0.25  Property Type: Cemetery`. `F100` and `F101` `confirmed`.
4. **DCP GeoSearch, once it recovered** — and this is where the finder's case collapses:
   ```
   "69-43 Trotting Course Lane, Queens" ->
      ("69-43 TROTTING COURSE LANE, Rego Park, NY, USA", "Rego Park", "11374")
      ("69-27 TROTTING COURSE LANE, Rego Park, NY, USA", "Rego Park", "11374")
      ("69-23 TROTTING COURSE LANE, Rego Park, NY, USA", "Rego Park", "11374")
   ```

**`refuted`: the finder's §16 assertion that "the street itself geocodes to Forest Hills."** The
finder supported that with GeoSearch hits on `8138`, `8064` and `7204/7206/7208 TROTTING COURSE
LANE`. Two of those carry **ZIP 11385**, which is Ridgewood/Glendale — a different end of a long
street, kilometres away, and no evidence at all about Block 3178 Lot 44. The **69-block**, which
is the landmark's actual block, returns Rego Park on every result.

**And Rego Park's own article says so**, a sentence the finder read but did not surface:

> `"The Remsen family created a burial ground, which is still located on Alderton Street near
> Metropolitan Avenue."`

**RULING: Remsen Cemetery / Remsen Family Cemetery belongs to Rego Park.** Address as LPC gives
it: adjoining `69-43 Trotting Course Lane`, between Alderton Street and Trotting Course Lane,
Block 3178 Lot 44. **The Forest Hills author must not create it under any slug.** The naming
conflict `F100` (LPC "Remsen Cemetery" vs NYC Parks "Remsen Family Cemetery") is `confirmed` and
is now the Rego Park author's problem.

One consequence for this page: **`P.S. 144 Col Jeromus Remsen`, 93-02 69 Avenue**, geocodes to
**Forest Hills, 11375** (re-verified by me) and DOE tags it `nta QN17`. The *school* is Forest
Hills'. The *cemetery* is not. `F189` — the finder's inference that the school is named for the
colonel in that grave — is `uncertain`: neither source says it, the finder flagged that honestly,
and I could not confirm it either. **The author must not narrate the cemetery on the strength of
the school.**

## 1.4 Russell Sage Playground and J.H.S. 190 — **FOREST HILLS. The finder's contest resolves.**

**Verdict: assignment `Forest Hills`, on evidence the finder mis-read.**

The finder set up NYC Parks' ZIP against NYC Parks' sign text and declined to call it. The tie is
broken by a field the finder explicitly told the verifier to ignore, wrongly.

**The sign text is real. `F157` `confirmed`,** re-quoted by me from the live page:

> `"This playground is named after the adjacent Russell Sage School, J.H.S.190, in the Rego Park
> section of Queens."`

**But DOE's own file separates the two neighborhoods, and the finder said it does not.** See
§2.5 below for the full refutation of `F182`. In short: DOE CD-406 rows carry **two** NTA codes,
`QN17` and `QN18`, which are the 2010-vintage **Forest Hills** and **Rego Park** NTAs. The three
`QN18` rows are `P.S. 139 Rego Park`, `P.S. 174 William Sidney Mount` (65-10 Dieterle Crescent)
and `P.S. 206 The Horace Harding School` (61-02 98 Street) — all unambiguously Rego Park, one of
them named "Rego Park". **`J.H.S. 190 Russell Sage` at `68-17 AUSTIN STREET` carries `QN17` =
Forest Hills.**

Add: GeoSearch `"68-17 Austin Street, Queens"` → `68-17 AUSTIN STREET, Forest Hills, NY, USA`,
`11375`. Parks' `zipcode 11375`. Council Member Lynn Schulman (District 29, Forest Hills).

**RULING: Forest Hills**, 3-to-1. The Parks sign is a single undated sign-text sentence about the
*school's* setting; DOE's own neighborhood tag for that school says Forest Hills.

**Address warning the finder did not catch.** Parks' `address` field for the playground is
`"68-17 68 AVENUE"`. I geocoded it:

```
"68-17 68 Avenue, Queens" -> ("144-17 68 AVENUE, Kew Gardens Hills, NY, USA", "Kew Gardens Hills", "11367")
```

**That address does not resolve in Forest Hills and must not be published.** Publish the
playground by Parks' `location` string only: `Booth Street between 68th Avenue and 68th Drive`.

## 1.5 Annadale Playground and P.S. 175 — **FOREST HILLS, with a genuine ZIP conflict to disclose**

**Verdict: assignment `Forest Hills`. ZIP `uncertain` — three city sources, two answers.**

**The sign text is real. `F162` `confirmed`,** re-quoted by me:

> `"Rego Park, the surrounding neighborhood, derives its name from the REal GOod Construction
> Company, which developed the neighborhood in the 1920s."`

Against it: DOE tags `P.S. 175 The Lynn Gross Discovery School` at `64-35 102 STREET` as
**`QN17` = Forest Hills**; GeoSearch returns `64-35 102 STREET, **Forest Hills**, NY, USA`; my
point-in-polygon on PLUTO's coordinates (40.7310161, -73.8522073) returns **Forest Hills**;
Parks' `zipcode` is `11375`.

**RULING: Forest Hills.** But note the disclosure:

- Parks `enfh-gkve` says ZIP **11375**
- PLUTO for the same tax lot says ZIP **11374**
- GeoSearch returns neighbourhood **Forest Hills** with postalcode **11374**

So the city says Forest Hills with Rego Park's ZIP. **The author may publish the address
`64-35 102 Street` and the neighborhood Forest Hills, but must not print a ZIP for this place** —
the sources do not agree on one. `F160` is `confirmed` as a quotation of the Parks dataset and
`uncertain` as a statement of fact about the ZIP.

**And the finder's warning here is right and I reinforce it:** the REal GOod / Chinese-farmer
etymology in `F162` is **Rego Park's history**, verbatim from a sign about Rego Park. The Forest
Hills page must not annex it. Same for the Bukharan material — see `F219` below.

## 1.6 Trylon Theater — **finder's answer stands, but it is 3-to-1, not unanimous, and the dissent is DCP's own boundary file**

**Verdict: assignment `Rego Park`, `confirmed`; but I am recording a real dissent the finder did
not know about.**

For Rego Park: PLUTO `98-81 QUEENS BOULEVARD | zipcode 11374 | cd 406 | owner TRYLON, LLC`;
GeoSearch returns `Rego Park` / `11374` on all three results I pulled; the Rego Park article
narrates it (`F212` `confirmed` verbatim).

Against: **my point-in-polygon on PLUTO's coordinates (40.7279347, -73.8551185) against DCP's
2020 NTA boundary file returns `Forest Hills`**, and it is not a borderline artifact — the point
sits **224 m** from the nearest Rego Park NTA boundary vertex. I sanity-checked the same routine
against Lost Battalion Hall and Remsen Cemetery and it returned `Rego Park` for both, so the
routine is sound.

**RULING: leave it to Rego Park.** ZIP, geocoder and the sibling's own article outvote the
polygon 3-to-1, and the finder was right to keep it off this page. But the Forest Hills author
should know that if anyone ever challenges the exclusion, DCP's boundary file is on the other
side. `F213` `confirmed` as a geocoder result.

## 1.7 Lost Battalion Hall — **REGO PARK, uncontested**

PLUTO `93-29 QUEENS BOULEVARD | zipcode 11374 | cd 406 | NYC DEPARTMENT OF PARKS AND RECREATION`;
GeoSearch → `Rego Park` / `11374`; my point-in-polygon → **Rego Park**; Parks
`zipcode 11374, councildistrict 24, location "Queens Blvd. bet. 62 Ave. and 62 Rd."`; the Rego
Park article narrates it. `F214`, `F215`, `F216` all `confirmed`. **Keep it off this page.**

## 1.8 Council-district-24 properties — **Forest Hills, weakly; publish by cross-streets**

`Underbridge Dog Run`, `Playground Sixty Two LXII` and `Barrier Playground` all carry Parks
`zipcode 11375` and `communityboard 406` but sit in **council district 24**. I geocoded them:

```
"64-02 Grand Central Parkway, Queens" -> ("64-02 GRAND CENTRAL PARKWAY, Forest Hills, NY, USA", 11375)
"105-25 62 Road, Queens"              -> ("105-25 62 DRIVE, Forest Hills, NY, USA", 11375)   <- note: DRIVE, not ROAD
```

**RULING: Forest Hills.** No source assigns any of the three elsewhere; the finder's flag was
prudence, not evidence. But see the address refutation under `F171`.

## 1.9 Forest Hills Gardens is NOT landmarked — **`confirmed`, and I have a second, stronger negative the finder missed**

`F041` and `F042` are `confirmed` exactly. I re-pulled both datasets:

- `skyk-mpzq`: **141 rows total, 13 in borough `QN`** — Cambria Heights-222nd Street, Cambria
  Heights-227th Street, Ridgewood South, Jackson Heights, Addisleigh Park, Central Ridgewood,
  Sunnyside Gardens, Stockholm Street, Hunters Point, Douglaston, Douglaston Hill (Amendment),
  Ridgewood North, Fort Totten. Full-text search for "Forest Hills" across all 141 rows:
  **False**.
- `qexa-qpj6`: **8 rows** — Bryant Park, Central Park, Grand Army Plaza, Morningside Park, Verdi
  Square, Fort Tryon Park (MN); Prospect Park, Coney Island (Riegelmann) Boardwalk (BK).
  **No Queens scenic landmark exists.**

**New, and load-bearing for the same warning.** The West Side Tennis Club article states, and I
re-quote it myself:

> `"Following the 1978 departure of the Open the stadium fell into such disrepair that by 2011 it
> was called a "crumbling ruin" and was denied landmark status by the [[New York City Landmarks
> Preservation Commission]]."`

So **Forest Hills Stadium was affirmatively denied landmark status**, not merely never
designated. The author must not describe the stadium or the Gardens as landmarked. This is the
strongest form of the finder's warning and the finder did not have it.

---

# 2. REFUTATIONS

Ten claims do not survive. They cluster exactly where it matters — the historic-register census,
the school-neighborhood split, and the counts.

## 2.1 `F043` — **REFUTED.** Forest Hills has THREE NRHP listings, not one. This is the file's most consequential error.

The finder reported that the Queens NRHP table "returned exactly ONE Forest Hills entry" and
built conflict-box #7 around it, concluding the question was "unresolvable in this corpus."

I re-fetched the article as raw wikitext — note the finder's URL is a **redirect**; the live
title is `National Register of Historic Places listings in Queens, New York` — and parsed every
`{{NRHP row}}`. Rows with `city=[[Forest Hills, Queens|Forest Hills]]`:

```
The Church-in-the-Gardens          | 50 Ascan Ave.      | 2009-12-11 | 09001086 NRHP
St. Luke's Episcopal Church        | 85 Greenway South  | 2010-11-10 | 10000900 NRHP
US Post Office-Forest Hills Station| 10628 Queens Blvd. | 1988-11-17 | 88002503 NRHP
```

The post-office row carries its own USPS citation in the source: `address1=10628+QUEENS+BLVD,
city=FOREST+HILLS, state=NY, zip5=11375`.

**Consequences:**

- **`F044` is `confirmed`.** S28's prose — `"The Church-in-the-Gardens, St. Luke's Episcopal
  Church, and United States Post Office are listed on the National Register of Historic Places."`
  — is verbatim correct, and I re-quote it myself. **Conflict box #7 is RESOLVED: three, not
  one.** The finder's weaker source was right and its stronger-seeming source was mis-read.
- **`F142` is `refuted`.** The finder wrote that S28's St. Luke's claim "is directly contradicted
  by F043/S29." It is not contradicted; it is corroborated by the same table the finder was
  reading.
- **`F211` is `refuted`.** The finder wrote "I have no source confirming the post office is at
  this address." Two now exist. PLUTO, re-read by me:
  `106-28 QUEENS BOULEVARD | zipcode 11375 | cd 406 | owner UNITED STATES POSTAL SERVICE`. My
  point-in-polygon on those coordinates: **Forest Hills**. GeoSearch:
  `106-28 QUEENS BOULEVARD, Forest Hills, NY, USA`, `11375`.
- The finder's parenthetical that S29 "reported none" for Rego Park is also wrong: the table
  carries `Rego Park Jewish Center | 97-30 Queens Blvd. | 2009-10-28 | 09000864`.

**Two new publishable places with exact addresses fall out of this:**

- **St. Luke's Episcopal Church, `85 Greenway South, Forest Hills, NY 11375`** — NRHP
  **#10000900**, listed **November 10, 2010**. GeoSearch, re-run by me:
  `("85 GREENWAY SOUTH, Forest Hills, NY, USA", "Forest Hills", "11375")`. The finder called this
  place "essentially undocumented" with "no address." It has both.
- **US Post Office–Forest Hills Station, `106-28 Queens Boulevard, Forest Hills, NY 11375`** —
  NRHP **#88002503**, listed **November 17, 1988**.

## 2.2 `F182` — **REFUTED on three counts, and the third one decides two contested places.**

The finder reported "twelve" DOE rows in CD 406, "all with `nta`: `QN17`", and instructed:
*"The DOE file assigns all twelve to one blended code. Do not read QN17 as 'Forest Hills'."*

I re-queried `wg9x-4ke6` for `community_district='406'`:

1. **16 rows, 15 distinct schools — not 12.** The finder missed `P.S. 139 Rego Park`
   (93-06 63 Drive), `P.S. 174 William Sidney Mount` (65-10 Dieterle Crescent) and
   `P.S. 206 The Horace Harding School` (61-02 98 Street, duplicated in the file).
2. **Not all are `QN17`.** Those three carry **`QN18`**.
3. **`QN17` and `QN18` are the 2010-vintage Forest Hills and Rego Park NTAs, and the file does
   separate them.** The three `QN18` schools are unambiguously Rego Park — one is *named* "P.S.
   139 Rego Park." The `QN17` set includes `Forest Hills High School` and `P.S. 101 School in the
   Gardens`, unambiguously Forest Hills. The finder's instruction not to read QN17 as Forest
   Hills is exactly backwards, and following it would have thrown away the field that settles
   §1.4 and §1.5.

Also `refuted`: `P.S. Q233`'s category is `"K-12 all grades"`, not `"Special Education"`.

`F183` is `confirmed` — I re-geocoded every listed address and all return Forest Hills:
`67-01 110 STREET`, `2 RUSSELL PLACE`, `68-17 AUSTIN STREET`, `64-35 102 STREET`,
`91-30 METROPOLITAN AVENUE`, plus `93-02 69 AVENUE` and `71-25 113 STREET` which I added.

## 2.3 `F017` — **REFUTED.** The population figure is not in the source.

The finder attributes to S28, via a summarizer: a 2010 population of **83,728** with
*"White 58.3%, Asian 24.2%, Hispanic 12.4%, Black 2.5%"*.

I searched the full plaintext extract of `Forest Hills, Queens` (27,919 chars) for `83,728`:
**not present**. The racial percentages as quoted are not present either. This is a `[Q-2nd]`
that did not survive contact with the source, which is precisely what the finder's own grading
convention predicted could happen.

**The author must not publish any Forest Hills population figure.** The only demographic figure
that survives is `F018`, which I re-quote verbatim and which is `confirmed`:

> `"The entirety of Community Board 6, which comprises Rego Park and Forest Hills, had 115,119
> inhabitants as of NYC Health's 2018 Community Health Profile, with an average life expectancy
> of 85.4 years."`

— and that is a **combined CD 6** number covering both neighborhoods. The finder's warning that
it must not be written as Forest Hills' is correct and I second it.

## 2.4 `F109` — **REFUTED as characterized.** The truncation concealed a date that is in the source.

The finder presented a clipped quote beginning `"…ite in Forest Hills, Queens, was purchased"`,
stated that "**the year the site was purchased is therefore missing from my quote**," and offered
S28's 1914 as the independent supply.

The source is not ambiguous. Raw wikitext, re-read by me:

> `"In 1908, the club moved again to a property at 238th Street and Broadway. … In 1912, a site
> in [[Forest Hills, Queens]], was purchased. The signature [[Tudorbethan architecture|Tudor-style]]
> clubhouse was built the next year. In 1915, the United States Lawn Tennis Association National
> Championship, later renamed the U.S. Open, moved to West Side."`

**The year is 1912, and it is right there.** Which also dissolves conflict #5: the site was
**purchased in 1912**, the clubhouse built **1913**, and S28's *"In 1914, the West Side Tennis
Club moved from Manhattan to Forest Hills Gardens"* (`F110`, `confirmed` verbatim) is describing
the move, not the purchase — while being wrong that the club came from Manhattan, since the same
article has it in the Bronx from 1908. **Best-evidenced sequence: purchased 1912, clubhouse 1913,
club in residence by 1914, championship arrives 1915.**

## 2.5 `F194` — **REFUTED as a quotation.** Substance survives from a different source.

The sentence *"The two subway stops in Forest Hills opened in 1936 along with six other stations
on the Queens Boulevard line"* does **not** appear in the `Forest Hills, Queens` extract. The
substance is `confirmed` from the 71st Avenue article instead, which I re-quote:

> `"On December 31, 1936, the IND Queens Boulevard Line was extended by eight stops, and 3.5 miles
> (5.6 km), from its previous terminus at Roosevelt Avenue to Union Turnpike, and the 71st Avenue
> station opened as part of this extension."`

Attribute it there, not to S28.

## 2.6 `F171` — **REFUTED on two dataset fields, one of which is an unpublishable address.**

Re-read from `enfh-gkve`:

- `Underbridge Dog Run` — `typecategory` is **`"Neighborhood Park"`**, not
  `"Sitting Area/Triangle/Mall"` as the finder wrote.
- `Barrier Playground` — `typecategory` is **`"Neighborhood Park"`**; the finder gave none.
- `Playground Sixty Two LXII` — the finder gives address `"105-25 62 Road"`. **That address does
  not exist.** GeoSearch returns `("105-25 62 DRIVE, Forest Hills, NY, USA", "Forest Hills",
  "11375")`. **Do not publish "105-25 62 Road."**

The rest of `F171` — acreages, locations, community board 406, council districts — is
`confirmed`.

## 2.7 `F218` — **REFUTED on the count.** 226, not 215.

The finder's query returned 1,200 inspection rows — the Socrata default page cap — and it counted
distinct `dba` **within that truncated page**. I ran the aggregate server-side:

```
$select=count(distinct dba) where boro='Queens' and zipcode='11375'  ->  226
```

The number is wrong but the **constraint the finder attached to it is right and I am restating it
with full force** — see §4.

## 2.8 `F187` — **REFUTED as "block unknown."** Ramones Way is locatable.

The finder had only "2017 designation" and no location, and flagged it as a strong candidate
needing the block. The article states it, and I re-quote it:

> `"The band was recognized with the designation in 2017 of Ramones Way at 67th Avenue and 110th
> Street, in front of Forest Hills High School."`

That is the corner of `67-01 110 Street` — Forest Hills High School's own address, which I
geocoded to `Forest Hills, 11375`. **`Ramones Way` is a publishable place with a locatable
corner.**

## 2.9 `F142` — **REFUTED.** See §2.1.

## 2.10 `F211` — **REFUTED.** See §2.1.

---

# 3. NEIGHBORHOOD ASSIGNMENT AND PUBLISHABLE ADDRESS — every candidate place

Each row: what the sources actually say, the exact address string, and whether it may ship.
`PIP` = my point-in-polygon against DCP's 2020 NTA boundary file. `GS` = DCP GeoSearch.

| # | Place | Exact publishable address | Assignment, and who says so | Ships? |
|---|---|---|---|---|
| P01 | West Side Tennis Club | `1 Tennis Place, Forest Hills, NY 11375` | **Forest Hills**, uncontested. GS → `1 TENNIS PLACE, Forest Hills, NY, USA`, `11375`; PIP on 40.7196/-73.8487 → Forest Hills; article lead → `"located in Forest Hills"` | **YES** |
| P02 | Forest Hills Stadium | `1 Tennis Pl, Forest Hills, NY 11375` (venue's own footer, re-read by me) | **Forest Hills**. Same site as P01 — the author must decide one record or two, not two addresses | **YES** |
| P03 | Forest Hills Gardens | no single street address | **Forest Hills**. LPC prose; **NOT** an LPC historic district, **NOT** a scenic landmark | **YES**, as an area |
| P04 | Station Square | `1 Station Square, Forest Hills, NY 11375` | **Forest Hills**. GS → `1 STATION SQUARE, Forest Hills`; PLUTO `zipcode 11375, cd 406, owner STATION SQUARE APARTMENTS CORP`; PIP → Forest Hills | **YES** |
| P05 | Forest Hills Inn | **none** | Named only as `"the building known as the 'Forest Hills Inn' located across Station Square"` — one aggregator clause, no address | **NO** — no address |
| P06 | Ridgewood Savings Bank, Forest Hills Branch (LP-2066) | `107-55 Queens Boulevard, Forest Hills, NY 11375` | **Forest Hills**. LPC `nta2020 QN0602`; GS → Forest Hills; PLUTO owner `RIDGEWOOD SAVINGS BANK`; PIP → Forest Hills | **YES** |
| P07 | Firehouse, Engine Co. 305 / Hook & Ladder 151 (LP-2522) | `111-02 Queens Boulevard, Forest Hills, NY 11375` (aka 111-02 to 111-04 Queens Blvd; **111-50 75th Avenue** — one building) | **Forest Hills**. LPC's own summary says `"in Forest Hills, Queens"`; `nta2020 QN0602`; GS → Forest Hills; PIP → Forest Hills | **YES** |
| P08 | Remsen Cemetery | adjoining `69-43 Trotting Course Lane` | **REGO PARK** — §1.3. Four axes | **NO** — sibling's |
| P09 | Our Lady Queen of Martyrs | `110-06 Queens Boulevard, Forest Hills, NY 11375` | **Forest Hills**. Parish's own letterhead, re-read by me; GS → Forest Hills | **YES** |
| P10 | The Church-in-the-Gardens (NRHP #09001086) | `50 Ascan Avenue, Forest Hills, NY 11375` | **Forest Hills**. NRHP table `city=Forest Hills`; GS → Forest Hills | **YES** |
| P11 | **St. Luke's Episcopal Church** (NRHP **#10000900**, listed **2010-11-10**) | **`85 Greenway South, Forest Hills, NY 11375`** | **Forest Hills**. NRHP table; GS → Forest Hills. **New — see §2.1** | **YES** |
| P12 | The Women's Club | **none** | Named only in the FHG Foundation's links panel, which I re-read | **NO** — no address |
| P13 | Arbor Close and Forest Close | no house numbers; `"abut the site of the Firehouse"` (111-02 Queens Blvd) | **Forest Hills**, LP-2522, completed **1925** and **1927** | **YES**, by adjacency |
| P14 | Yellowstone Park | `68-01 Yellowstone Boulevard, Forest Hills, NY 11375` | **Forest Hills**. Parks `zipcode 11375`; GS → Forest Hills | **YES** |
| P15 | MacDonald Park | **no street address in any source** — `Queens Blvd. bet. Yellowstone Blvd. and 70 Rd.` | **Forest Hills**. Parks `zipcode 11375`, `cb 406`, `cd 29`, `Park ID Q207`, `1.42 ac` | **YES**, cross-streets only |
| P16 | Ehrenreich-Austin Playground | `76-10 Austin Street, Forest Hills, NY 11375` | **Forest Hills**. Parks `11375`; GS → Forest Hills; PIP → Forest Hills | **YES** |
| P17 | Russell Sage Playground | **`68-17 68 Avenue` IS UNPUBLISHABLE** — geocodes to Kew Gardens Hills 11367. Use `Booth Street between 68th Avenue and 68th Drive` | **Forest Hills** — §1.4 | **YES**, cross-streets only |
| P18 | Annadale Playground | `64-35 102 Street, Forest Hills` — **print no ZIP** (11375 vs 11374) | **Forest Hills** — §1.5 | **YES**, no ZIP |
| P19 | Willow Lake Playground | `71-25 113 Street, Forest Hills, NY 11375` | **Forest Hills**. Parks `11375`, `cb 406`, `cd 29`, `Q348`; GS → Forest Hills; PIP → Forest Hills | **YES** |
| P20 | Project Eden (GreenThumb garden) | no street address — `Kessel St. bet. Yellowstone Blvd. and Selfridge St.` | **Forest Hills**. Parks `11375`, `cb 406`, `Garden` / `Greenthumb` | **YES**, cross-streets only |
| P21 | Underbridge Dog Run | `64-02 Grand Central Parkway, Forest Hills, NY 11375` | **Forest Hills**. GS confirms. `typecategory` is **Neighborhood Park** | **YES** |
| P22 | Playground Sixty Two LXII | **`105-25 62 Road` DOES NOT EXIST** — GS returns `105-25 62 DRIVE` | **Forest Hills** by ZIP/CB | **NO** unless the author verifies `62 Drive` |
| P23 | Barrier Playground | no address — `Horace Harding Exwy. Sr. Rd. S., 62 Ave. bet. 102 St. and Yellowstone Blvd.` | **Forest Hills** by ZIP/CB. `typecategory` **Neighborhood Park** | **YES**, cross-streets only |
| P24 | Forest Park | `80-30 Park Lane, Queens, NY **11415**` — **not a Forest Hills address** | **No neighborhood.** DCP NTA `QN8291` / CDTA `QN82`. GS → neighbourhood `Forest Park` — §1.1 | **YES**, with the §1.1 constraints |
| P25 | Forest Hills–71 Av subway station | Queens Blvd at 71st Ave / Continental Ave | **Forest Hills**. MTA `stop_name "Forest Hills-71 Av"`, `G08`, `E F M R`, **`ada 1/1/1` fully accessible** | **YES** |
| P26 | 75th Avenue subway station | 75th Ave and Queens Blvd | **Forest Hills** per the article lead. MTA `F07`, `stop_name "75 Av"`, `daytime_routes "E F"`, **`ada 0` — NOT accessible** | **YES** |
| P27 | Forest Hills station (LIRR), code FHL | in Station Square — `"above 71st (Continental) Avenue between Austin and Burns Streets"` | **Forest Hills**, re-quoted by me | **YES** |
| P28 | Forest Hills High School | `67-01 110 Street, Forest Hills, NY 11375` | **Forest Hills**. DOE `cd 406`, `nta QN17`; GS → Forest Hills. Opened `1941-07-01` | **YES** |
| P29 | P.S. 101 School in the Gardens | `2 Russell Place, Forest Hills, NY 11375` | **Forest Hills**. DOE `QN17`; GS → Forest Hills; PIP → Forest Hills. Opened `1927-07-01` | **YES** |
| P30 | J.H.S. 190 Russell Sage | `68-17 Austin Street, Forest Hills, NY 11375` | **Forest Hills** — §1.4. DOE `QN17` beats the Parks sign | **YES** |
| P31 | Queens Metropolitan HS / MELS / P.S. Q233 | `91-30 Metropolitan Avenue, Forest Hills, NY 11375` | **Forest Hills**. GS → Forest Hills; PIP → Forest Hills. One building, three DOE records | **YES**, as one place |
| P32 | **Ramones Way** | **`67th Avenue and 110th Street`**, at Forest Hills High School | **Forest Hills**, designated **2017** — §2.8 | **YES** |
| P33 | **US Post Office–Forest Hills Station** (NRHP **#88002503**, listed **1988-11-17**) | **`106-28 Queens Boulevard, Forest Hills, NY 11375`** | **Forest Hills**. PLUTO owner `UNITED STATES POSTAL SERVICE`; GS → Forest Hills; PIP → Forest Hills. **New — §2.1** | **YES** |
| P34 | **NYPD 112th Precinct** | **`68-40 Austin Street, Forest Hills, NY 11375`** | **Forest Hills**. GS → `68-40 AUSTIN STREET, Forest Hills, NY, USA`, `11375`. Source states `"Forest Hills and Rego Park are patrolled by the 112th Precinct of the NYPD, located at 68-40 Austin Street."` **New — the finder had the precinct but not its address** | **YES** |
| P35 | P.S. 144 Col Jeromus Remsen | `93-02 69 Avenue, Forest Hills, NY 11375` | **Forest Hills**. DOE `QN17`; GS → Forest Hills. **Namesake link to the cemetery is `uncertain`** | **YES** |

**Explicitly NOT this page's:** Remsen Cemetery (Rego Park), Lost Battalion Hall Recreation Center
(Rego Park), Trylon Theater (Rego Park), Rego Park Jewish Center (Rego Park), Louis Armstrong
House Museum (Corona), and all eight `CitiFieldPlaces` holdings inside Flushing Meadows Corona
Park.

**Places that cannot ship for want of a verifiable address:** P05 Forest Hills Inn,
P12 The Women's Club, P22 Playground Sixty Two LXII.

**Total surviving as publishable: 32** (P01–P04, P06, P07, P09–P11, P13–P21, P23–P35), of which
**24 carry an exact, verified street address** and 8 must be published by cross-streets or as an
area.

---

# 4. THE DOHMH CONSTRAINT — restated in full force

**`F218` count `refuted` (226, not 215); the constraint `confirmed` and I am hardening it.**

I re-ran the query server-side: `boro='Queens' and zipcode='11375'` yields
**226 distinct `dba` values**. I spot-verified the finder's sample against the live dataset and
the records are real: `RADICI` at `100-11 METROPOLITAN AVENUE` (Italian), `OBA GRILL` at
`70-35 AUSTIN STREET` (Turkish), `AMAR PERUVIAN KITCHEN` at `68-54 AUSTIN STREET` (Peruvian),
`PRINCE TEA HOUSE` at `15 STATION SQUARE` (Coffee/Tea), `JADE EATERY AND LOUNGE` at
`1 STATION SQUARE` (Japanese). I also found a second `OBA GRILL` at `104-02 METROPOLITAN AVENUE`
listed as Mediterranean — the same trade name at two addresses with two cuisine codes, which is
itself a caution about treating `dba` as an identity.

**RULING, as the brief requires me to state plainly. For every one of these 226 businesses, a
DOHMH inspection record is the ONLY source in evidence.** Their **existence and address may be
published. NOTHING about any of them may appear in prose.** Not a description, not a cuisine
characterization, not "long-standing", not "popular", not "a neighborhood fixture", not an
opening date, not a recommendation. An inspection record establishes only that DOHMH inspected an
address under that trade name on a given date. It does not establish that the business is open
today.

Three specific traps:

1. **`Cinemart Cinemas`** — the finder recorded `106-03 Metropolitan Avenue` geocoding to Forest
   Hills and no source for the business. I re-verified the geocode
   (`106-03 METROPOLITAN AVENUE, Forest Hills, NY, USA`) and I too found **no source for the
   cinema**. Not even DOHMH. **It may not be written at all** — not existence, not address-as-a-
   cinema. `uncertain`.
2. **Austin Street** rests on one clause: `"The area's main commercial street, Austin Street, has
   many restaurants and chain stores."` I re-quote it myself; `F208` is `confirmed` **as a
   quotation from a single aggregator sentence**. It may ship **with attribution** and nothing
   more. No history of the strip, no character, no "vibrant", no merchant count.
3. **The 113-, 116- and 118-block Queens Boulevard addresses** sit at the eastern end of ZIP
   11375 toward Union Turnpike and Kew Gardens. A ZIP query cannot place them. `uncertain` —
   do not publish them as Forest Hills without a per-address geocode.

---

# 5. SINGLE-SOURCED CLAIMS — may they ship?

| Claim | Sole source | May it ship? |
|---|---|---|
| `F040` prefab: `"approximately 170 standardized precast concrete panels"` | Wikipedia only. Verbatim `confirmed` by me | **With attribution only**, or not at all. A specific number on aggregator-only footing |
| `F034` `142 acres` / Margaret Sage / 1908 | Wikipedia only. Verbatim `confirmed` | Only inside the acreage conflict, never as the fact |
| `F036` Atterbury + John Almy Tompkins II | Wikipedia only. Verbatim `confirmed` | With attribution |
| `F188` Spider-Man at `20 Ingram Street` | Wikipedia only. `confirmed`, with coordinates 40.712805/-73.843281 | **Only if framed as fiction.** It is a fictional address |
| `F184` Simon and Garfunkel, class of 1958 | Wikipedia only. Verbatim `confirmed` | With attribution |
| `F208` Austin Street | one clause. `confirmed` as a quotation | With attribution, nothing added |
| `F150` `"In the 1980s, Forest Hills saw a new wave of immigrants from Europe and Asia."` | one undated park-sign sentence. `confirmed` verbatim | **With attribution and the hedge.** This is the ONLY immigration evidence for the whole neighborhood. It cannot carry an immigration section |
| `F132` Durham cathedral model | the parish about itself. `confirmed` verbatim | With attribution — institutional self-description, not analysis |
| `F161` Annadale/"Anna" lore | `confirmed`, and **the source hedges itself**: `"There is scant information to prove the truth of this tale"` | Only with that hedge carried over |
| `F201` `"More crashes happen along Queens Boulevard than any other roadway statewide."` | Wikipedia, undated. `confirmed` as a quotation | **No.** Undated superlative. `"Boulevard of Death"` alone may ship with attribution |
| `F126` the stadium/Gardens litigation | Wikipedia only, live and ongoing | **Counsel against.** See §6 |

---

# 6. WARNINGS TO THE AUTHOR

1. **Flushing Meadows Corona Park.** `F001`–`F005` all `confirmed`. I independently verified that
   no source in this corpus gives any of the eight `CitiFieldPlaces` holdings a Forest Hills
   address. The one genuinely load-bearing FMCP fact is the U.S. Open's departure, and it is now
   **settled** — see #2. The honest construction is a link to `/g/citi-field-guide` and no
   narration of the Tennis Center's history. The Bronx concourse page returned as two Criticals on
   exactly this shape. **Link. Do not narrate.**
2. **The U.S. Open departure year is RESOLVED: 1977 was the last Forest Hills tournament; the
   move took effect for 1978.** Conflict #4 closed. Three re-read strings: the succession box
   gives West Side `1915–1920` and `1924–1977`, with `"[[USTA Billie Jean King National Tennis
   Center]] ([[1978 U.S. Open (tennis)|1978]]–present)"` after it; the body says `"By 1978, the
   tournament had outgrown West Side, and the USTA moved the tournament to the new USTA National
   Tennis Center in Flushing Meadows under USTA President William Hester"`; and S28's own lead
   says `"hosted the U.S. Open from 1915 through 1977"` while its body says `"until 1978"` — S28
   contradicts itself, so its 1978 is not a real dissent. Write **1977**, or write "left for
   Flushing Meadows in 1978." Never both as if they conflicted.
3. **Stadium capacity is NOT resolved. Do not print a number.** Conflict #3 stands.
   **14,000** (article lead, `"a 14,000 seat outdoor tennis stadium and concert venue"`, and again
   `"a 14,000-seat horseshoe-shaped stadium"`) vs **13,000** (the venue's own site, re-quoted by
   me: `"the 13,000 capacity stadium is the only outdoor venue of its kind and size in the
   city"`; and S28's `"approximately 13,000 seats"`). Tennis seats and concert capacity are not
   the same quantity and no source reconciles them. `uncertain`.
4. **Nothing here is landmarked, and the stadium was affirmatively refused.** No LPC historic
   district, no scenic landmark, and the stadium `"was denied landmark status by the New York City
   Landmarks Preservation Commission"` in 2011. The three NRHP listings (§2.1) are federal, not
   city, designations — do not blur them.
5. **Two LPC reports are one source.** `F021`, `F023`, `F112` `confirmed`: LP-2522 reuses
   LP-2066's Cord Meyer passage. **Count them once.** I also found where they diverge — LP-2066:
   `"By 1921, his company had constructed 200 homes, some designed by architects Robert Tappan and
   William Patterson"`; LP-2522: `"By 1921, Meyer's company had constructed some 200 homes, and
   several apartment buildings."` `F027`/`F028` both `confirmed`; the "200" is soft in the later
   report and the architects appear only in the earlier one.
6. **S20 and S21 are the same article.** `Forest Hills Stadium` is a **redirect** to
   `West Side Tennis Club` — I confirmed the redirect. The finder's source table notes this but
   then cites S20 and S21 as if they corroborated each other. **They do not. It is one source.**
7. **Acreage/buyer/year for Forest Hills Gardens is NOT resolved.** Conflict #1 stands. All four
   strings `confirmed` verbatim by me: LP-2066 `"the sale of 160 acres south of the railroad line
   to the Russell Sage Foundation"`; LP-2522 `"In 1906, the Russell Sage Foundation purchased 160
   acres of land south of the railroad line"`; S28 `"Margaret Sage, the founder of the Russell
   Sage Foundation, bought 142 acres (57 ha) of land from the Cord Meyer Development Company in
   1908"`; and NYC Parks `"Olivia also founded the Russell Sage Foundation in 1907"` — which makes
   LP-2522's 1906 Foundation purchase internally impossible. **Do not average, do not pick the
   prettiest.** `uncertain`.
   **New, and it makes it worse:** S28 also says Cord Meyer `"bought 660 acres (270 ha)"` where
   both LPC reports say **600 acres**. A fourth number the finder did not flag.
8. **Authorship of the Gardens is NOT resolved.** Conflict #2 stands; all four attributions
   `confirmed` verbatim. LP-2522 is the best-evidenced: `"the collaborative creation of landscape
   architect and planner Frederick Law Olmsted, Jr. and the architect and housing reform activist
   Grosvenor Atterbury."` If the page names anyone, name those two and attribute to LPC 2012.
9. **The Sliney attribution must be written as attributed.** `F073` `confirmed`: LPC's own header
   says `"John R. Sliney, architect (attributed)"` and its summary `"has been attributed to"`. And
   the FDNY's own annual reports, quoted inside the same LPC report and re-quoted by me, say the
   opposite: `"there will be no architect employed in connection with the erection of these
   buildings"` and `"thus the fees of architects were saved."` **Preserve the tension. Never write
   Sliney as the architect.**
10. **`"April 31, 1768"` is not a real date.** `F092` `confirmed` — the error is LPC's, and it is
    in a report about a place that isn't ours anyway. Omit the day if it is ever used.
11. **Do not write 2000-era or 2012-era descriptions in the present tense.** `F066` (the bank's
    condition, LPC 2000 — including `"the addition of two signs for an A TM machine"`), `F074`
    (`"continues to serve the Forest Hills community today"`, LPC 2012), `F180`
    (`"Forest Park Nature Center is currently closed to the public"`, undated) and `F152`
    (undated amenity list) are all `confirmed` **as of their dates**. I found **no source** on
    whether 107-55 Queens Boulevard is still a bank branch, whether Engine 305 is still active,
    or whether the Nature Center is still closed. Attribute and date, or omit.
12. **OCR artifacts.** `F148`'s internal contradiction is real and I re-read it:
    `"named for Council Member Andrew Katzman (1903-1993). Arthur J. Katzman served on New York's
    City Council for 29 years."` Same paragraph, two first names. `uncertain` — **do not name
    this man**, or name him only as the playground's namesake without a first name. The finder's
    preserved artifacts (`modem`, `granit~`, `impo1tant`, `excel lent`, `8raves`, `I!'"ebruary`,
    `Rems·e~`, `(Newto~`, `Remsen,settled`, `Eduacation`, `Queens borough Bridge`) I re-observed
    in my own conversions and they are genuine — though the finder silently normalized `A venue`→
    `Avenue`, `ofthe`→`of the` and `venti lating`→`ventilating` while claiming to preserve
    everything. Immaterial, but its OCR-fidelity promise is not perfect.
13. **`"Hook and Ladder Company 15"` vs `"Hook & Ladder Company 151"`.** `F168` `confirmed` — NYC
    Parks really does write `15`. LPC writes `151` throughout, including in a designation
    report's title. **LPC is right; Parks dropped a digit.** Ruling made so the author doesn't
    hedge in prose.
14. **The Ehrenreich-Austin namesake was a Kew Gardens man.** `F166`/`F168` `confirmed`:
    `"the unofficial mayor of Kew Gardens"`, and his advocacy covered `"Kew Gardens and Forest
    Hills"`. The **playground** is Forest Hills'. **The man is not.** Do not make him a Forest
    Hills figure. Parks also gives his death: `"Ehrenreich passed away on December 8, 1962."`
15. **Whitepot is shared ground.** `F025` `confirmed` — that sentence is in the **Rego Park**
    article, about Rego Park. LP-1177 offers a *different* colonial name for overlapping ground,
    `"Hempstead Swamp"` (`F088`, `confirmed`). **Do not merge the two names and do not imply
    Whitepot was Forest Hills alone.**
16. **Do not annex Rego Park's demographic story.** `F219` is `uncertain` and correctly withheld
    by the finder. The article spells it **"Bukharan"**, not "Bukharian", and every sentence about
    it is about **Rego Park**: `"Most of the residents are Bukharan Jewish"`, `"Most of the
    Bukharan Jewish immigrants in the neighborhood come from Uzbekistan and Tajikistan"`. There is
    **no source in this corpus describing that community in Forest Hills.** The 108th Street
    DOHMH trade names are not a source for it. **Do not extend it across the boundary.**
17. **Do not narrate the active lawsuit.** `F126` `confirmed` verbatim, and I recovered the
    sentence the finder's extraction truncated: `"On March 25, 2025, the Forest Hills Gardens
    Corporation, a private group that manages the surrounding residential community, refused to
    give the New York City Police Department (NYPD) access to close the privately owned streets
    for concerts and denied the stadium permits for summer concerts later in the year."` This is
    live, litigated, aggregator-sourced material about a private dispute between neighbours, and
    it is still moving. **I counsel strongly against narrating it.** It is also the only evidence
    that the Forest Hills Gardens Corporation exists as a legal entity, since its site refuses
    connection — so if the page names the Corporation at all it is leaning on this paragraph.
18. **`75th Avenue station is NOT wheelchair accessible.** MTA `39hk-dx4f`, re-read by me:
    `F07 | 75 Av | ada 0 | ada_northbound 0 | ada_southbound 0`, against
    `G08 | Forest Hills-71 Av | ada 1 | 1 | 1`. The finder surfaced the accessible one and not the
    inaccessible one. **A visitor-facing page that says "Forest Hills' subway is accessible"
    without this distinction is wrong.**
19. **Queens Boulevard house numbers flip neighborhoods.** `F209` `uncertain` as to the specific
    near-miss strings, but the method warning is sound and I verified the shape of it: `107-55`,
    `110-06`, `111-02` and `106-28` all return **Forest Hills / 11375**, while `93-29` and `98-81`
    return **Rego Park / 11374**. **Verify every Queens Boulevard address character-exact.** Note
    also that `P06` (107-55), `P07` (111-02), `P09` (110-06) and `P33` (106-28) sit on a road the
    Rego Park article calls one of Rego Park's own boundaries (`F012`, `confirmed` verbatim).
    Their individual assignments are strong; **do not describe Queens Boulevard as running
    *through* Forest Hills** without checking the sibling's file.
20. **Forest Hills has no waterfront and no industrial history.** Both absences `confirmed` — I
    found nothing to the contrary either. The nearest water in evidence is Willow Lake, which is
    inside FMCP. `F001` `confirmed`: Parks' own "Other Parks Nearby" module on the Willow Lake
    Playground page reads `"Flushing Meadows Corona Park (0.35 miles)"` on a page whose data
    panel reads `Zip Code: 11375`. **Write the playground. Never the lake.**
21. **Gaps that remain gaps.** MacDonald Park's history page is a **stub** — I re-fetched it and
    confirmed it carries the boilerplate `"This text is part of Parks' Historical Signs Project
    and can be found posted within the park."` and then nothing. Same for Remsen Family Cemetery
    and Willow Lake Playground. There is still **no source for who MacDonald was**. The
    Rego-Forest Preservation Council (`F133`, `confirmed` — the parish really does credit
    `"Photo courtesy Michael Perlman, Rego-Forest Preservation Council"`) remains unfetched and is
    still the richest untapped vein. The Queens Public Library Forest Hills branch still has no
    address in evidence. **Do not fill these with plausible prose.**

---

# 7. HEADLINE COUNT

- **Claims adjudicated: 220** (F001–F220)
- **Confirmed: 197**
- **Refuted: 10** — `F017`, `F043`, `F109`, `F142`, `F171`, `F182`, `F187`, `F194`, `F211`,
  `F218`
- **Uncertain: 13** — `F019`, `F127`, `F189`, `F191`, `F193`, `F195`, `F198`, `F199`, `F200`,
  `F207`, `F209`, `F219`, `F220`
- **Places surviving as publishable: 32** (24 with an exact verified street address; 8 by
  cross-streets or as an area)

**On the confirmation rate.** 90% is high and I treat that as something to explain rather than
boast about. It is driven by composition, not leniency: roughly 120 of the 220 claims are verbatim
quotations from three LPC designation-report PDFs and from government JSON, and I re-downloaded
the PDFs, re-converted them in two modes, and re-pulled every dataset. Those quotations are
genuinely character-accurate and there is nothing to refute in them. The finder's `[Q]`/`[Q-2nd]`/
`[P]` discipline was honest and it held up.

**But the errors are not evenly distributed, and they are not minor.** They land on the historic-
register census (`F043` — one listing reported where there are three, which cost the page two
addressable NRHP places), on the school-neighborhood field (`F182` — the finder told the verifier
to discard the one field that resolves two of its three contested assignments), on the population
figure (`F017` — a number that is simply not in the source), and on three counts and two addresses
that would have shipped wrong. A reader who trusted the finder's §16 as written would have given
Remsen Cemetery a Forest Hills claim it does not have, withheld Russell Sage and Annadale from
Forest Hills, published an address in Kew Gardens Hills as a Forest Hills playground, and printed
a street that does not exist.
