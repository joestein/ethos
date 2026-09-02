# Glendale, Queens — VERIFIER verdicts (wave 4, CD5)

**Role: INDEPENDENT VERIFIER.** Every URL cited by the finder that mattered was re-fetched by me and
re-quoted from my own retrieval. I did not defer to the finder's reasoning. Where I write "confirmed"
I have the source string in front of me; where I could not re-retrieve, the verdict is `uncertain`,
not `confirmed`.

**Headline: 286 claims adjudicated — 178 confirmed, 14 refuted, 94 uncertain. 20 places survive as
publishable for Glendale.**

Confirmation rate is 62%. The 94 `uncertain` are overwhelmingly Forgotten New York narrative, NYC
Parks sign prose for Forest Park interior features, and Wikipedia assertions I could confirm as
*text* but not as *fact*. A high confirmation rate would have been a warning sign; this one is not.

---

## 1. METHOD — what I actually did

Independent retrievals, all fresh this session:

| Source | What I pulled |
|---|---|
| DCP 2020 NTAs `9nt8-h7nd` | full GeoJSON, 262 features, all five boroughs |
| NYC Parks `enfh-gkve` | Forest Park MultiPolygon + property record |
| LPC Individual Landmark Sites `buis-pvji` | all 1,532 records |
| DOHMH `43nn-pn8j` | all 356 distinct establishments in ZIP 11385 |
| DCP GeoSearch | 26 candidate addresses geocoded, each point-in-polygon tested against the NTA layer myself |
| Wikipedia action API | *Glendale, Queens* full extract (27,886 chars); the three historic-district articles; *Glendale station (LIRR)*; *Fresh Pond Road station*; NRHP Queens listing **wikitext** |
| Direct HTTP | nycgovparks.org sign pages (Evergreen Park, Mafera Park, Maranzano, Dry Harbor); mountcarmelcemetery.com; unionfieldcemetery.org; allfaithscemetery.org; zumstammtisch.com; sacredheartrccglendale.org |

I ran the finder's quoted Wikipedia strings as 55 exact substring probes against my own extract.
**52 matched byte-for-byte. 3 "missed" only because the finder silently converted the source's
straight double quotes to single quotes** (see §6). No finder quote was substantively fabricated.
That is a genuinely clean quoting record and I say so.

---

## 2. THE FOREST PARK RULING — the live question, and I am overturning the standing one

The wave brief asks me to say plainly whether the sources put Forest Park inside Glendale.

### 2.1 They do not. And they do not put it in Forest Hills either.

**I re-ran the polygon test myself** rather than trusting either the finder or the wave-3 record.
I took NYC Parks' own Forest Park MultiPolygon from `enfh-gkve`, drew 400 uniformly random points
that fall inside it, and located each against the DCP 2020 NTA layer:

```
388/400   QN8291 Forest Park            (ntatype 9, Queens)
  8/400   QN0901 Kew Gardens
  2/400   QN0503 Glendale
  1/400   QN0574 Highland Park-Cypress Hills Cemeteries (North)
  1/400   QN0905 Woodhaven
  0/400   QN0602 Forest Hills
```

**97% of the park is in a neighborhood tabulation area that is not a neighborhood.** Glendale gets
2 samples out of 400 — *fewer than Kew Gardens*. This corroborates the wave-3 Rego Park verifier's
result (no sample in Forest Hills) while **refuting any reading of it that hands the park to
Glendale.** Edge bleed of 0.5% is a rasterisation artifact, not a claim of ownership.

### 2.2 The structural parallel to Flushing Meadows is exact — verified, not asserted

From the dataset, verbatim:

```
QN8191 | Flushing Meadows-Corona Park | type 9 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | type 9 | QN82 Forest Park (JIA 82 Approximation)
```

Same `ntatype`, same standalone-JIA CDTA construction. Wave 3 ruled that this instrument means
Flushing Meadows belongs to **no neighborhood file at all**. Forest Park carries the identical
instrument. **F21 is `confirmed` exactly as written.**

Note also, for contrast, `QN0191 | Astoria Park | type 9 | QN01 Astoria-Queensbridge (CD 1
Approximation)`. Astoria Park is also type 9 — but it sits *inside a community district's CDTA*.
That is why wave 1 could give Astoria Park to Astoria and why this wave cannot give Forest Park to
Glendale. The discriminator is the standalone JIA, not the type code.

### 2.3 The wave-3 ruling's factual basis does not survive measurement

Wave 3 gave Forest Park to Forest Hills on three grounds. I measured all three.

**Ground (a) — "3.3 metres of shared boundary against 567.9 m to Rego Park." This figure was
misinterpreted.** I computed, for each abutter, the minimum distance to the Forest Park NTA ring and
the length of boundary shared within a 5 m tolerance:

| NTA | min distance | shared boundary |
|---|---|---|
| QN0905 Woodhaven | 0.00 m | **~2,350 m** |
| **QN0503 Glendale** | 0.00 m | **~2,342 m** |
| QN0902 Richmond Hill | 0.00 m | ~1,241 m |
| **QN0602 Forest Hills** | 0.00 m | **~1,036 m** |
| QN0901 Kew Gardens | 0.00 m | ~986 m |
| QN0601 Rego Park | **565.58 m** | 0 m |

My 565.58 m for Rego Park reproduces wave 3's 567.9 m, so we are measuring the same geometry. But
"3.3 metres" was a **minimum distance** (a resolution artifact of ring vertices), not a shared
boundary — Forest Hills actually shares over a kilometre. Wave 3 therefore both *understated* Forest
Hills' contiguity and, more importantly, **used contiguity as a discriminator when it does not
discriminate**: Forest Hills ranks **4th of five** abutters. Woodhaven and Glendale share more than
twice as much. Contiguity is evidence for nobody.

**Ground (b) — named after the park.** Confirmed and untouched. Forest Hills is named for the park.
That is an etymology, not a location. Both wave-3 primaries say *proximity*.

**Ground (c) — the park's own ZIP/CB lists.** I pulled the record myself:

```
Forest Park | 80-30 PARK LANE | ZIP 11375, 11385, 11415, 11421 | 506.86 acres
            | Flagship Park | communityboard 305405406409 | gispropnum Q015
```

11385 (Glendale/Ridgewood) is in that list exactly as 11375 (Forest Hills) is. **The ZIP list
supports Glendale precisely as much as it supports Forest Hills — i.e. not at all**, because the
park spans four ZIPs and two boroughs' community boards.

**And its own mailing address defeats every claimant.** I geocoded it:

> `80-30 PARK LANE, Forest Park, NY, USA` → ZIP **11415**, bbl 4033122000 → **`QN0901 Kew Gardens`**

The park's address is in Kew Gardens, which claims it least of anyone.

### 2.4 A fourth, independent agency treats Forest Park as its own district

**This is new and the finder missed it.** The LPC Individual Landmark Sites dataset contains:

```
Forest Park Carousel | LP-02528 | designated 6/25/2013
address = "within Forest Park, west of Woodhaven Boulevard and north of West Main Drive"
borough = QN | cd = 482 | nta2020 = QN8291
```

**LPC codes the Carousel's community district as 482** — the JIA, not 405, not 406. DCP and LPC
independently agree that Forest Park is its own administrative district.

### 2.5 RULING

> **Forest Park is `refuted` for Glendale.** Glendale may state that it borders Forest Park and that
> Wikipedia says Glendale "contains… part of Forest Park" — attributed. **Glendale may not create a
> Forest Park place record, and may not create a record for any feature inside it.**
>
> **The wave-3 ruling is void by its own terms.** It wrote: *"What would overturn it: a Woodhaven,
> Richmond Hill, **Glendale** or Kew Gardens page entering the corpus… If either happens, this ruling
> is void and Forest Hills keeps only the etymology."* Glendale is entering the corpus in this wave.
> The condition has triggered. On the evidence above, Forest Park belongs to **no neighborhood file**,
> exactly as Flushing Meadows Corona Park does. **The coordinator should strip Forest Park from
> forest-hills.json and leave Forest Hills the etymology only.** I am not softening this to avoid
> disturbing a shipped page; the brief told me not to, and the geometry does not permit it.

**Off-limits to Glendale as records and as prose** (all inside QN8291): Forest Park itself, the
Forest Park Carousel, Dry Harbor Playground, Lawrence Linekin Children's Playground, the George
Seuffert, Sr. Bandshell, Oak Ridge, the Overlook, the Forest Park Golf Course, Victory Field, DeVoy
Playground, Jackson Pond Playground, PFC Lawrence Strack Meadow, the Richmond Hill War Memorial.

---

## 3. NEIGHBORHOOD ASSIGNMENT — every candidate place, ruled

All NTA results below are **my own** geocode + point-in-polygon, not the finder's.

### 3.1 UNCONTESTED — Glendale, no source disagrees

| Place | Exact street address | My NTA result | Verdict |
|---|---|---|---|
| "Uncle" Vito F. Maranzano Glendale Playground | `2869 Central Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| FDNY Engine Co. 286 / Ladder Co. 135 | `66-44 Myrtle Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Zum Stammtisch | `69-46 Myrtle Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| USPS Glendale Station | `69-36 Myrtle Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Queens Public Library, Glendale Branch | `78-60 73rd Place, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| The Shops at Atlas Park | `80-00 Cooper Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| St. Pancras R.C. Church | `72-22 68th Street, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Sacred Heart R.C. Church / Catholic Academy | `83-17 78th Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Yer Man's Irish Pub | `70-26 88th Street, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Cooper Avenue Row Historic District | `64-34 to 64-46 Cooper Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| 75th Avenue–61st Street Historic District | `75-02 61st Street` and adjoining 60th Lane / 62nd St | QN0503 Glendale | **confirmed Glendale** |
| Pinocchio Playground | `74-01 78th Avenue, Glendale, NY 11385` | QN0503 Glendale | **confirmed Glendale** |
| Drumm Triangle | Cooper Avenue, Cypress Hills Street & 65th Place (no street number) | — | **confirmed Glendale** — NYC Parks' own sign: *"a sanctuary for Glendale residents"* |
| Glendale Veterans Triangle / Glendale War Memorial | Myrtle Avenue & Cooper Avenue (no street number) | — | **confirmed Glendale** — monument record: `Donor: People of Glendale` |

### 3.2 I CLOSED THE FINDER'S OPEN GAP ON THE CENTRAL AVENUE DISTRICT

The finder could not geocode an address inside the NRHP boundary ("65th and 66th Sts.") and flagged
that its 68-10 test was the wrong block. I geocoded one:

> `66-10 CENTRAL AVENUE` → 40.702688, -73.888478, ZIP 11385, bbl 4036780005 → **`QN0503 Glendale`**

That point is ~150 m from the NRHP row's own coordinate (40.702778, -73.890278). **C2 resolves:
Central Avenue Historic District is in Glendale by DCP geometry.** Address to publish:
`Roughly bounded by Myrtle Avenue, 70th Avenue, 65th Street and 66th Street, Glendale, NY 11385`.

### 3.3 CONTESTED — my rulings, with both sources quoted

**C1–C3, the three National Register historic districts → GLENDALE, with the NRHP conflict disclosed.**

I pulled the NRHP Queens listing **wikitext** myself. All three rows, verbatim:

```
|name=75th Avenue-61st Street Historic District |refnum=83001764
|city=[[Ridgewood, Queens|Ridgewood]] |image=RIDGEWOOD-GLENDALE-FRESH POND 081.JPG
|name=Central Avenue Historic District        |refnum=83001761
|city=[[Ridgewood, Queens|Ridgewood]] |image=RIDGEWOOD-GLENDALE-FRESH POND 083.JPG
|name=Cooper Avenue Row Historic District     |refnum=83001765
|city=[[Ridgewood, Queens|Ridgewood]] |image=RIDGEWOOD-GLENDALE-FRESH POND 093.JPG
```

Against which each district's own article, which I re-fetched individually:

> *"75th Avenue–61st Street Historic District is a national historic district in **Glendale**, Queens, New York."*
> *"Central Avenue Historic District is a national historic district in **Glendale**, Queens, New York."*
> *"Cooper Avenue Row Historic District is a national historic district in **Glendale**, Queens, New York."*

**F193 is `confirmed`, and stronger than the finder claimed.** I searched the entire wikitext:
**the string "Glendale" occurs ZERO times in the NRHP Queens listing article.** Not one city field,
not one address, not one description. Meanwhile `Ridgewood` is the most common city value in the
table (17 entries).

**Ruling: Glendale, better evidenced.** Three independent lines beat one: (1) DCP geometry puts all
three in QN0503 — I tested all three myself; (2) the districts' own articles say Glendale; (3) the
NRHP `city` field is demonstrably ZIP-derived, and Wikipedia documents that mechanism *in Glendale's
own article* (F66, confirmed verbatim). **The author must disclose the conflict in the prose** — the
National Register itself files these under Ridgewood, and a reader who checks will find that.

**C4 Evergreen Park, `60-09 / 60-24 Saint Felix Avenue, Glendale, NY 11385` → GLENDALE, narrowly, and
the author must disclose.**

I fetched the sign. NYC Parks does not say "Ridgewood" in passing — **it narrates Ridgewood's
history at length on this park's page**, which the finder did not record:

> *"Evergreen Park is located in the Queens neighborhood of **Ridgewood**, bounded by Metropolitan
> Avenue and Evergreen Cemetery. It is the Queens extension of the Brooklyn neighborhood of the same
> name. The town was originally inhabited by the Mespachtes Indians… In the early 18th century, the
> English settled in **Ridgewood** and named it after the prominent topographical feature."*

Against: my own geocode of `60-24 SAINT FELIX AVENUE` → **`QN0503 Glendale`**, and Wikipedia's
Glendale article (confirmed verbatim): *"includes the neighborhoods of Evergreen (near and around
Evergreen Park) and Liberty Park."*

**Ruling: Glendale by DCP geometry, but this is the weakest Glendale assignment in the dossier.** The
author may create the record; the prose **must** say NYC Parks calls it a Ridgewood park. Do not
carry any of the Ridgewood-history paragraphs from that sign — they are about Ridgewood.

**C5 Mafera Park, `65 Place and Shaler Avenue` → RIDGEWOOD. Glendale may not claim it.**

Both non-Wikipedia sources point away. My geocode of `65-15 SHALER AVENUE` → **`QN0502 Ridgewood`**.
The sign, re-fetched and quoted from my own retrieval:

> *"During its early years, the park was known variously as Farmers Oval, Ridgewood Park, and Glen
> Ridge Park. **The latter name refers to the park's location on the boundary between Glendale and
> Ridgewood.**"*
> *"One year later, **the children of Ridgewood** were able to enjoy the play equipment…"*
> *"**A long-time Ridgewood resident**, Mafera (1895-1967)…"*

Only Wikipedia's section placement says Glendale, and section placement is not a sentence.
**Ruling: Ridgewood.** Glendale may cite the *Glendale Farmers Base Ball Club* — the sign names the
team as Glendale's in its own words (*"in tribute to the Glendale Farmers Base Ball Club, a
semi-professional team"*) — **as team history, without claiming the park.**

**C6/C7 Mount Carmel Cemetery → CONTESTED; the cemetery self-assigns to Glendale, DCP does not.**

Re-fetched from mountcarmelcemetery.com. Its own addresses, verbatim:

- Main Office / Section 1: `83-45 Cypress Hills Street, **Glendale NY 11385**`
- Sections 2 & 3: `66-02 Cooper Avenue, **Glendale NY 11385**`
- Section 4: `82-99 Cypress Avenue and Cypress Hills Street, **Glendale NY 11385**`
- Section 6 (Mount Neboh): `82-07 Cypress Hills Street, **Glendale NY 11385**`
- Section 5 (Knollwood Park): `57-80 Cooper Avenue, **Ridgewood NY 11386**`
- Mailing: `P.O. Box 860093, **Ridgewood NY 11386**`

Heading block confirmed: **"Mount Carmel Cemetery / Glendale, NY"**.

My geocodes: `83-45 Cypress Hills Street` → **QN0574**; `57-80 Cooper Avenue` → **QN0574**.
Both in the cemetery NTA, not QN0503.

**Ruling: `uncertain`, publishable with attribution.** This is the strongest self-identification in
the corpus and the author may publish `83-45 Cypress Hills Street, Glendale, NY 11385` **because the
cemetery prints it that way**, attributed to the cemetery. The author **must not** state that DCP
places it in Glendale — it does not. **Do not claim Section 5 (Knollwood Park), which the cemetery
itself assigns to Ridgewood.**

**C8 Union Field Cemetery → RIDGEWOOD, by its own words. Do not claim.**

Note a stale URL the finder did not catch: `unionfieldcemetery.com` now **301-redirects** to
`unionfieldcemetery.org`. Content confirmed at the live host:

> *"Chartered by Congregation Rodeph Sholom in 1846, Union Field Cemetery consists of 63 acres on the
> Brooklyn/Queens border."* — address block: **"8211 Cypress Avenue, Ridgewood, NY 11385"**

My geocode of `82-11 Cypress Hills Street` → QN0574. **Union Field and Mount Carmel are adjacent, on
the same street, and self-assign to different neighborhoods.** The finder called this the clearest
illustration of the wave's hazard and I agree. **Ruling: not Glendale's.**

**C9 Machpelah Cemetery (Houdini) → `refuted` for Glendale.**

`82-30 Cypress Hills Street` → **QN0574** (my geocode). No cemetery website exists to weigh against
it. And Wikipedia's own Glendale cemetery list — which I confirmed verbatim — **omits Machpelah**
while the same article claims Houdini. **Ruling: Glendale may not claim Houdini's grave.** A Glendale
page may say the Cemetery Belt rings the neighborhood; it may not put a marquee burial inside it.

**C10 Mount Lebanon Cemetery → `uncertain`, do not create.** `78-00 Myrtle Avenue` → QN0574. No
operating website. The finder's warning is `confirmed` and important: `mtlebanoncemetery.com` is a
**Pittsburgh** cemetery. Do not cite it.

**C11 Cypress Hills Cemetery → BROOKLYN. Do not claim.** Own site: `833 Jamaica Ave., Brooklyn, NY
11208`. Jackie Robinson and Mae West are buried there, not in Glendale.

**C12 All Faiths Cemetery → MIDDLE VILLAGE. No wave-4 file may claim it.** Re-fetched:
*"67-29 Metropolitan Avenue, **Middle Village, NY 11379**"*; my geocode → **QN0571**. Middle Village
is not a wave-4 file, so this simply goes unclaimed. Wikipedia's inclusion of "Lutheran All Faiths"
in Glendale's belt is `refuted` as an assignment.

**C13 Fresh Pond / Fremont Yards → `uncertain`, lean Ridgewood.** I confirmed both conflicting
Wikipedia sentences from my own retrievals. The *Fresh Pond Road station* article places the station
*"in Ridgewood"* and the yard east of it; my geocode of `66-01 Fresh Pond Road` → **QN0502
Ridgewood**. **Glendale may say the yards are nearby and cite Wikipedia's "located in Glendale" with
attribution. It may not create a place record.**

**C14 NYPD 104th Precinct station house → the BUILDING is RIDGEWOOD.** `64-02 CATALPA AVENUE` →
**QN0502 Ridgewood** (my geocode). Glendale is *patrolled by* the 104th — publishable. **The station
house may not be a Glendale place record.**

**C15 89-70 Cooper Avenue, the *All in the Family* house → GLENDALE, with three warnings.**

My geocode: `89-70 COOPER AVENUE` → **QN0503 Glendale**, but **ZIP 11374 (Rego Park)**, bbl
4031760045. Wikipedia (confirmed verbatim): *"The house seen in the opening of the show is at 89-70
Cooper Avenue."* Forgotten NY explicitly refuses to assign it: *"I have to pick one, so I'll make it
Glendale."* **Ruling: Glendale on geometry.** Warnings in §5.

**C18 78-16 Cooper Avenue → MIDDLE VILLAGE.** My geocode → **`QN0504 Middle Village`**, bbl
4038030014. Confirmed independently. Not Glendale's under any framing.

**C19 P.S. 68 → GLENDALE** (same St. Felix Avenue parcel as Evergreen Park, QN0503), notwithstanding
that NYC Parks calls the adjoining park Ridgewood's.

**C16 Forest Park → see §2. C17 Highland Park / Ridgewood Reservoir → not Glendale's**; its address
is `58-02 Vermont Avenue`, Brooklyn ZIPs 11207/11208, and Wikipedia's own sentence puts it *south of*
Glendale and *separated* from it. **C20 Christ the King H.S. → Middle Village. C21 St. John's
Cemetery → QN0573, its own NTA.** All four: do not claim.

**C22 Seither Stadium → `uncertain`, do not create a place record.** Single Wikipedia sentence,
confirmed as text. I re-checked the NYC Parks CB5 inventory: **no Seither Stadium record exists.**
No address is derivable. May be mentioned in prose with attribution; may not be a record.

### 3.4 The Brooklyn county line — a finder claim I must REFUTE

F7 states that the finder's resolver *"returned **Brooklyn NTAs** for some addresses that a careless
reader would assume are Queens (**F196, F197**)."* **This is wrong.** F196 is a Sacred Heart parish
quote about St. Pancras; F197 is a DERIVED result that reads `QN0503 Glendale`. Neither is a Brooklyn
NTA. **`refuted`.**

I tested all 26 candidate addresses. **Not one returned a Brooklyn NTA.** The only Brooklyn-addressed
candidate in the dossier is Cypress Hills Cemetery (`833 Jamaica Ave., Brooklyn, NY 11208`), and it
is not Glendale's on any reading. **Glendale's county is `Queens` throughout, and unlike Ridgewood
this page has no live Brooklyn-side hazard.** The finder overstated the risk via a broken
cross-reference.

---

## 4. THE DOHMH QUESTION — ruled per the brief

I pulled all 356 distinct establishments in ZIP 11385 from `43nn-pn8j` myself.

**P43. Yer Man's Irish Pub — DOHMH IS THE ONLY SOURCE FOR ITS ADDRESS.**

```
YER MAN'S IRISH PUB | 70-26 | 88 STREET | 11385 | Irish | Queens
```

No website, no press, no founding date, no ownership history, nothing in DCWP. **Its existence and
address may be published — `70-26 88th Street, Glendale, NY 11385` — and NOTHING about it may appear
in prose**, with one narrow exception: Wikipedia's single sentence *"Cooper's Ale House (now "Yer
Man's Irish Pub") is featured in the show The King of Queens as a local bar"* may be carried **with
attribution to Wikipedia and nothing added**. No atmosphere, no cuisine description, no hours, no
"beloved local." The DOHMH `Irish` cuisine code is a regulatory field, not a description — do not
render it as prose.

**P42. Zum Stammtisch — NOT DOHMH-only. Safe to write about at length.** The DOHMH row exists
(`ZUM STAMMTISCH | 69-46 | MYRTLE AVENUE | 11385 | German`), but the restaurant's own website is
primary and substantial. I re-fetched and confirmed: *"Since 1972, we've been the pride of Queens: a
Bavarian-style pub…"*, `69-46 Myrtle Avenue, / Glendale, NY 11385`, `(718) 386-3014`, `EST. 1972`,
and the full founding narrative (John Lehner, Freising, Bavaria; two partners bought out; 1988
expansion; Lehner's death October 1993; Hans and Werner). **This is the single best business
candidate on the page.** Note it self-identifies as **Glendale**, matching DCP.

**P44. The Assembly — `uncertain`, recommend DROP.** My own DOHMH sweep of all 356 records in 11385
returns **no match** for `ASSEMBLY`, `COOPER`, or `WOODS INN`. The finder's negative is `confirmed`.
There is no address, no website, and no evidence the bar exists today. One Wikipedia sentence about a
1996 film. **Do not create a place record.**

**No other business in the dossier rests on an inspection record.**

---

## 5. WARNINGS THE AUTHOR MUST HEED

1. **Do not attribute Zum Stammtisch's "Top 100 Restaurants in New York City" award to the New York
   Times.** I fetched the raw HTML because an automated read of the page *did* make exactly that
   error. The page reads, in bare sequence with no attribution: `Awarded / "Top 100 Restaurants in New
   York City" / for two consecutive years, 2023 & 2024`. The praise blurb (*"…best Jagershnitzel and
   bratwurst this side of Munich"*) is **also unattributed**. The Food Network and CBS New York
   mentions **are** attributed and may be used. The finder got this right; a careless author will not.
2. **The Stammtisch Pork Store is CLOSED** (the restaurant's own site says so, while its navigation
   still links "OUR PORK STORE"). Do not send anyone there.
3. **The Manhattan Project sentence must not ship.** Confirmed as Wikipedia text, `uncertain` as
   fact, zero corroboration anywhere. Same for **"film studios"** (one NYC Parks sign, uncorroborated).
4. **Publish no PLUTO `yearbuilt` values.** `1931` recurs across unrelated Glendale lots including
   every Cypress Hills Street cemetery. It is a placeholder. The Atlas Park `yearbuilt 1922` is the
   Atlas Terminal fabric, not the 2006 mall.
5. **Publish no City Council district number.** Wikipedia says the 30th; NYC Parks pages name three
   different members. Low value, moving target.
6. **The NYT cemetery quotes are second-hand.** *"more tombstones in Glendale… than living residents"*
   and *"a natural fence"* are **Wikipedia quoting the NYT**; I could not retrieve either original.
   The "40,000 graves" figure is implausible against Mount Carmel's own 135,000+ and All Faiths'
   540,000+. **Either source the originals or attribute as second-hand. Do not print 40,000.**
7. **Never repeat "November 31, 1924."** Confirmed verbatim on the Dry Harbor sign. It is not a date.
   (Moot anyway — Dry Harbor is inside the JIA and off-limits.)
8. **The *All in the Family* house is a private single-family residence.** Do not publish the owner
   name (PLUTO gives a named individual's living trust), and think hard before directing readers to a
   doorstep. Its ZIP is 11374 (Rego Park); print it as `89-70 Cooper Avenue, Queens, NY 11374` or
   omit the ZIP.
9. **The Woods Inn buildings on Edsall Avenue are private homes today.** Do not send visitors.
10. **No Forgotten New York reader comment may be published.** F52, F67, F267 and F273 are all
    user-generated. The finder flagged this correctly and I re-confirm it: the richest street-name
    detail on the Forgotten NY 1922 page is in comments, not Walsh's body text, which is four
    sentences long.
11. **Do not write that Glendale has a subway station.** Wikipedia's *"it still is served by the
    subway"* is confirmed as text and contradicted by its own transportation section. I verified all
    three nearby M stations independently: Fresh Pond Road — *"in Ridgewood"*; Forest Avenue — *"in
    Ridgewood, Queens"*; Metropolitan Avenue — *"in the neighborhood of Middle Village, Queens."*
12. **Do not publish MTA bus route destinations.** Unverified against current MTA data.
13. **The Notable People list must not be carried.** Richard Arkwright died in Lancashire in 1792 —
    `refuted` as a resident; only "P.S. 91 is named after him" is usable. Houdini is `refuted` (§3.3).
    Rafael Ramos's own entry says he moved away. Phil Rizzuto's entry contains no Glendale connection
    at all. Big Cass, Dan Schneider and Cree Cicchino carry no sourced detail. **Only Daniel Daly has
    a specific residence claim, and it is uncited.** Use the five NYC Parks-sourced figures instead
    (Maranzano, Drumm, Linekin, Koehler — and note Parks calls Mafera *"a long-time Ridgewood
    resident,"* so he is not Glendale's).
14. **"Central Queens Academy Charter" is `refuted` as a Glendale school.** Unsourced Wikipedia list
    item; the school is Elmhurst/Corona. Also, "Sacred Heart Elementary" is **Sacred Heart Catholic
    Academy** by its own name.
15. **All CB5 statistics are three- or four-neighborhood figures.** The 166,924 population, the
    $71,234 median income, the life expectancy, the bodega ratio and the 104th Precinct crime rank
    all cover Glendale *with* Ridgewood, Maspeth and Middle Village. Any use must say so. The 2010
    racial breakdown is internally impossible ("1.0% (5) Pacific Islander") — do not print it.
16. **Corrections to the finder's own arithmetic.** F108 glosses the Parks dataset value
    `communityboard 305405406409` as *"CBs 3, 5, 6, 9."* **`refuted`** — it decodes as **Brooklyn CB5
    + Queens CBs 5, 6 and 9**. There is no CB 3. Separately, the Parks web page's Community Board
    field rendered **empty** in my retrieval, so F108's *"Community Board: 5, 6, 9"* is `uncertain`.
17. **F192's sweep is incomplete.** Its headline — *"There is no New York City–designated individual
    landmark in Glendale"* — is **`confirmed`**: I found **zero** LPC records with `nta2020 = QN0503`.
    But the finder filtered on `cd = 405` and therefore missed two records: the **Forest Park
    Carousel (LP-02528, designated 6/25/2013, cd 482, QN8291)** and **Historic Street Lampposts (072)
    (LP-01961, QN0501 Maspeth)**. Neither is Glendale's, but do not write that the Carousel is
    unprotected — it is a designated NYC landmark as well as NRHP-listed.
18. **Quote fidelity.** The finder silently converted the source's straight double quotes to single
    quotes inside three passages marked verbatim QUOTE: `"Doddies"`, `"Yer Man's Irish Pub"` and
    `"Farmers Oval"`. Substance is correct in all three; if the author reproduces them as quotes,
    restore the source's punctuation. F127 also ends a quote with a period where the sign continues
    *", one of New York City's natural treasures."*

---

## 6. SINGLE-SOURCED CLAIMS — may they ship?

| Claim | Sole source | Ruling |
|---|---|---|
| Ivanhoe Park Hose Company, Henry Meyer, 1896 fire company | Wikipedia | **Ship with attribution.** Specific, internally coherent, ties to the Liberty Park section. Best Glendale-only history in the dossier. |
| ZIP-code fight (1963 Brooklyn ZIPs → 11385 in 1980; 2007 and 2012 revivals; the 11384 proposal) | Wikipedia | **Ship with attribution.** Richest Glendale-specific story available. **But the article contradicts itself twice** — `11237` vs `11227` for the shared Bushwick ZIP, and *"93 percent"* vs *"a majority"* on the ballot. I confirmed **all four strings** in my own extract. Do not silently pick one; either say the sources disagree or omit the disputed number. |
| Glendale War Memorial: German cannon captured by Andrew J. Hergenrother | Sacred Heart parish history | **Ship with attribution, in the past tense only.** Absent from the NYC Parks monument record; present-day presence unverified. Do not tell a reader they will see it. |
| Sacred Heart's 1929 parish boundary ("Beginning at the southeast corner of 78″ Avenue and 75 Street…") | Sacred Heart parish history | **Ship with attribution.** Re-confirmed verbatim. A dated, explicit primary-source boundary for East Glendale — genuinely strong. |
| George Schott's middle initial | four sources | **Do not pick one.** I re-confirmed both: Wikipedia says **George C. Schott**; NYC Parks and Sacred Heart both say **George S. Schott** (I have both pages). Date is 1860 / "early 1860's" / 1869 depending on source. Write around it or attribute. |
| "Dry Harbor" as Glendale's original name | NYC Parks sign | **Ship with attribution.** Confirmed verbatim; conflicts with Wikipedia's "Fresh Pond." Both may be given. |
| Seither Stadium | Wikipedia | **Prose only, attributed. No place record.** No Parks record, no address. |
| QueensWay parcel | `enfh-gkve` only | **`uncertain`, omit.** 0.032 acres, `Undeveloped`, and Parks assigns it to **CB 406**, not CB5. |
| Trader Joe's / Chili's in Glendale | Wikipedia, self-contradicting | **Do not publish.** The same article puts the Trader Joe's in **Rego Park**. |

---

## 7. WHAT SURVIVES — 20 publishable places

**Full records with prose (14):** Glendale (the neighborhood) · "Uncle" Vito F. Maranzano Glendale
Playground · Drumm Triangle · Glendale Veterans Triangle / Glendale War Memorial · Evergreen Park
*(disclose the Ridgewood conflict)* · 75th Avenue–61st Street Historic District · Central Avenue
Historic District · Cooper Avenue Row Historic District · Sacred Heart R.C. Church & Catholic Academy
· Queens Public Library Glendale Branch · USPS Glendale Station · FDNY Engine 286 / Ladder 135 ·
Zum Stammtisch · Glendale station (LIRR, closed 1998 — historical).

**Records with thin or constrained prose (6):** The Shops at Atlas Park *(no website exists — do not
link one, do not list tenants; the QPL annex is the only tenant in evidence)* · St. Pancras R.C.
Church *(address only; no founding date, architect or building history in evidence)* · Pinocchio
Playground *(address only; NYC Parks has no sign text — do not invent a history)* · Yer Man's Irish
Pub *(address only, per §4)* · Mount Carmel Cemetery *(cemetery's own Glendale address, attributed;
DCP disagrees)* · 89-70 Cooper Avenue *(private residence, per §5.8)*.

**The honest shape of this page.** Wikipedia's own words, which I confirmed verbatim, are the fairest
summary: Glendale *"lacked a major community hub."* It has **no waterfront, no museum, no NYC-designated
landmark, no NRHP listing filed under its own name, no subway station, no operating LIRR station and
no hospital.** With Forest Park correctly excluded, it is a residential neighborhood defined by what
rings it — the Cemetery Belt, a park it borders but does not contain, and the Fresh Pond rail
crossroads. That thinness is structural and correct, not a research failure. **Do not pad it by
reaching into Forest Park.**

---

## 8. WAVE-RULE COMPLIANCE — verified

- **Flushing Meadows / CitiFieldPlaces:** `confirmed` clean. I searched the finder for all eight
  holdings; Citi Field, the Unisphere, the Queens Museum and the Hall of Science appear **once each**,
  solely inside the §1.1 do-not-touch rule. None is a candidate. Glendale is CD5 and does not border
  the park. **No Glendale prose should mention it at all**; a `/g/citi-field-guide` link is not
  warranted here, because there is no routing question to answer.
- **Ridgewood Savings Bank collision:** `confirmed` avoided. `107-55` occurs **once** in the finder,
  inside the F6 guard. No candidate carries that address.
- **Brooklyn county line:** `confirmed` safe — see §3.4. Zero candidates in a Brooklyn NTA.
- **Ridgewood's own places:** the Ridgewood Theater Building (55-27 Myrtle Avenue) and the Onderdonk
  House (1820 Flushing Avenue) are both `QN0502` in the LPC dataset I pulled. Neither may be claimed
  here. Starr, Rosemary's, Benninger and Grover Cleveland Playgrounds are likewise Ridgewood's.
