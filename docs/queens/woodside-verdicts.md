# Woodside, Queens — VERIFIER verdicts

**Role:** Independent verifier. I re-fetched every cited URL myself. Nothing below rests on the
finder's transcription. Where I write "confirmed", I re-quoted the source in this session.

**Retrieval method.** WebSearch budget was exhausted for me too (200/200), same as the finder — so
source *discovery* here is also directed, not exhaustive. All retrieval was direct:
`urllib` with a full browser User-Agent and `Accept-Encoding: identity` (nycgovparks.org 403s a
short UA and returns gzip that silently decodes to zero bytes — a trap the finder may have hit),
`pdftotext` in both `-layout` and raw column order for LP-1956, Socrata/ArcGIS JSON endpoints, and
MediaWiki `action=raw` for Wikipedia.

---

## HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated | **169** (F1–F167, plus 2 apparatus claims in §C headers) |
| Confirmed | **139** |
| Refuted | **5** |
| Uncertain | **25** |
| Places surviving as publishable | **26** (17 with prose; **9 DOHMH-only, address+existence only**) |

The confirmation rate is high (82%) and I treated that as a warning sign, not a success. It is high
for one reason: roughly 100 of the 167 facts are verbatim transcriptions from four primary
institutional sources (NYC Parks Historical Signs, LPC LP-1956, DCP's NTA table, MTA/NYCHA/DOHMH
Socrata), and those transcriptions are genuinely accurate — I checked them character-by-character
and found no fabricated quote anywhere in the file. **Transcription accuracy is not the same as the
claim being true**, and every refutation below is a case where the finder transcribed correctly but
the underlying assertion is wrong, or where the finder made a *negative* claim it had not checked.

---

## 1. NEIGHBORHOOD ASSIGNMENT RULINGS

The wave hazard is real and the finder characterised it correctly: **the City does not treat
"Woodside" as one unit.** I re-queried DCP's 2020 NTA table
(`https://data.cityofnewyork.us/resource/9nt8-h7nd.json`, `boroname='Queens'`, 82 rows) and F1's
seven rows are **verbatim exact**, including `QN0104 Astoria (East)-Woodside (North)` under
`QN01 Astoria-Queensbridge (CD 1 Equivalent)`. Northern Woodside really is CD 1 in the City's own
geography, and the *name* "Woodside" really does appear in a CD 1 NTA label.

### 1.1 THE OVERRIDING RULING — Moore-Jackson Cemetery is NOT Woodside's

**This is the most important thing in this file and the finder could not have known it.**

The finder calls P11 "the ONLY NYC individual landmark LPC assigns to Woodside" and F79 is
**confirmed exactly**: I re-queried LPC's `Individual_Landmark_Lots_Points` layer with
`where=Borough='QN'`, got **86 records**, and exactly **one** carries `NEIGHBORHO = Woodside`:

```
LPC_NAME   = Moore-Jackson Cemetery
Address    = 51st to 54th Streets between 31st and 32nd Avenues
LPC_LPNumb = LP-01956
NEIGHBORHO = Woodside
Date_Comb  = 1733 - 1868
USE_ORIG   = Cemetery
```

**But wave 1 already awarded it to Astoria.** `docs/queens/wave1-arbitration.md` reads verbatim:

> | **Moore-Jackson Cemetery** | ASTORIA | Uncontested; the dataset row is complete and was
> truncated only by the finder. | `51st to 54th Streets between 31st and 32nd Avenues` |

and it appears on Astoria's §3.1 "ASTORIA may publish" list with that exact address string.

**RULING: Moore-Jackson Cemetery gets NO place record in `woodside.json`.** Under the corpus's
one-neighborhood rule it is spent. Woodside may *mention* it in prose as a neighbouring place where
a confirmed verdict supports the mention — LP-1956's own header and LPC's own GIS both say Woodside,
which is a legitimate thing to say about a place Astoria owns — but the record itself is Astoria's.

Note the irony for the arbitrator: wave 1 took it on the DCP `QN0104 Astoria (East)-Woodside (North)`
basis, i.e. on exactly the CD1/CD2 split the finder identified as this wave's hazard, and it took it
**against LPC's own explicit `NEIGHBORHO = Woodside` tag.** That is defensible but it is not
"uncontested", and the arbitrator should know that all 24 of §D's facts (F79–F97, F15–F18, F21) are
now facts about an Astoria place.

### 1.2 Places the sources place in WOODSIDE — confirmed, take them

Every one of these I re-fetched myself. NYC Parks metadata quoted verbatim from the live page.

| Place | Exact address string (NYC Parks / institution's own) | Evidence |
|---|---|---|
| **Lawrence Virgilio Playground / Windmuller Park** | `52 St., Woodside Ave. bet. 39 Rd. and 39 Dr.` | `Zip Code: 11377`, `Community Board: 2`, `Council Member: Julie Won`, `Park ID: Q031`, `Acreage: 3.01`, `Property Type: Neighborhood Park`. Sign text: *"a civic leader and businessman who summered on this **Woodside** hill"*. |
| **Doughboy Park** | `Woodside Ave. bet. 54 St. and 56 St.` | `Zip Code: 11377`, `CB: 2`, `Julie Won`, `Park ID: Q031A`, `Acreage: 1.71`, `Property Type: Triangle/Plaza`. |
| **Woodside Doughboy** (monument in Doughboy Park) | `Location: Woodside and Roosevelt Avenues, 39 Road and 52 Street` | Monument page: `Artist: Burt W. Johnson`, `Dedicated: 1923`, `Architect: C.N. Kent`, `Materials: Bronze, granite`, `Inscription: LEST WE FORGET / 1917-1918 /`. |
| **Big Bush Playground / Bush Park** | `Laurel Hill Blvd. bet. 61 St. and 64 St.` | `Zip Code: 11377`, `CB: 2`, `Q205A`, `2.50`, `Community Park`. Page text: *"a hub of recreation for **Woodside** families"*. |
| **General Hart Playground** | `Broadway, 37 Ave. bet. 65 St. and 69 St.` | `Zip Code: 11377`, `CB: 2`, `Q067A`, `0.90`. **See 1.3 — resolved in Woodside's favour.** |
| **Nathan Weidenbaum Playground** | `Laurel Hill Blvd., 48 Ave. bet. 63 St. and 64 St.` | `Zip Code: 11377`, `CB: 2`, `Julie Won`, `Park ID: Q205B`, `Acreage: 0.73`, `Playground`. Page: *"longtime **Woodside** resident Nathan Weidenbaum (1908-1983)"*. **I retrieved this page; the finder did not.** |
| **John Vincent Daniels Jr. Square** | `43 Ave., Roosevelt Ave. bet. 50 St., 51 St. and 52 St.` | `Zip Code: 11377`, `CB: 2`, `Park ID: Q065`, `Acreage: 0.25`, `Triangle/Plaza`. Page: *"a **Woodside** resident killed in action during World War I"*. **I retrieved this; the finder did not.** |
| **High Hopes Triangle** | `Between 66th St & 67th Street` | `Community Board: 2`, `Council Member: Julie Won`, `Park ID: QZ22`. **NO `Zip Code` and no `Acreage` field on the page.** See the refutation at §2.3. |
| **Queens Public Library, Woodside branch** | `54-22 Skillman Avenue Woodside, NY 11377` | QPL's own branch page, re-fetched. |
| **Woodside on the Move** | `51-23B Queens Boulevard, Woodside, NY 11377` | The org's own JSON-LD: `"streetAddress": "51-23B Queens Boulevard", "addressLocality": "Woodside", "postalCode": "11377"`, `"telephone": "(718) 476-8449"`. **The finder quoted this org four times and never reported its address.** |
| **Donovan's Pub** | `57-24 Roosevelt Avenue`, Woodside, NY 11377 | Own site markup, re-fetched: `"addressLocality":"Woodside"`. |
| **Sripraphai** | `64-13 39th Ave, Woodside, NY, 11377` (own site) | DOHMH says `64-15 39 AVENUE`. Both re-verified. Conflict is real; publish the business's own string. |
| **Big Six Towers** (management office) | `60-10 Queens Boulevard, Woodside, NY 11377 (basement level of the shopping center)` | Own site, re-fetched verbatim. |
| **U.S. Post Office, Woodside Station** | `39-25 61st Street` | Wikipedia only — single-sourced, attribution required. |
| **P.S. 11 Kathryn Phelan** | `54-25 Skillman Ave` | Woodside on the Move's own event JSON-LD. |

### 1.3 General Hart Playground — RESOLVED FOR WOODSIDE

The finder marked this "⚠ CONTESTED, recorded not resolved." **It is resolvable and the sibling
finder already conceded it.** `docs/queens/jackson-heights-finder.md` says verbatim:

> "S3 records both at **ZIP 11377, CB 402** (Woodside). Listed here only because S2's Travers Park
> page names **General Hart Playground** as one of the nearest parks (0.55 miles)… **Both appear to
> be Woodside's, not Jackson Heights'.**"

I confirm NYC Parks' own record: `Zip Code: 11377`, `Community Board: 2`, `Council Member: Julie
Won`, and the history page opens its "What was here before?" section with the *Woodside* colonial
history (F12, confirmed verbatim). The two counter-indicators the finder raised are both weak:
"Travers Park (0.55 miles)" is a proximity list, not an assignment, and *"a resident of Elmhurst"*
(confirmed verbatim) describes **where the honoree lived**, not where the park is. **Woodside takes
General Hart Playground.**

### 1.4 Places the sources place in SUNNYSIDE — Woodside must NOT claim these

| Place | Address | What the source actually says |
|---|---|---|
| **Torsney Playground / Lou Lodati Park** | `Skillman Ave. bet. 41 St. and 43 St.` | **SUNNYSIDE, decisively.** `Zip Code: 11104` (not Woodside's 11377). Sign text, re-quoted: *"supporter of parks and playgrounds for the **Sunnyside** area."* And the history page, which the finder did not retrieve, adds: *"Lou Lodati (1908-1996) earned the nickname **"Mayor of Sunnyside"** for his dedicated service to the community. He worked for the Woodside Herald, and was a member of the Kiwanis, the **Sunnyside Chamber of Commerce**"* and *"Torsney Playground is located on the northwest corner of Skillman Avenue and 43rd"*. **There is no source in the finder's file that assigns this park to Woodside** — the finder's §L row 5 lists the "Assigned Woodside by" column as the capital-project name and "Woodside adjacency," which is not an assignment. Refuted as a Woodside candidate. |
| **L/CPL Thomas P. Noonan Jr. Playground** | `47 Ave., Greenpoint Ave. bet. 42 St. and 43 St.` | `Zip Code: **11104, 11377**` (dual — the finder omitted the ZIP field entirely), `CB: 2`, `Park ID: Q044`, `Acreage: 1.05`. Neither the page nor the history page uses the word Woodside **or** Sunnyside. The finder's stated Woodside evidence is "Proximity/park-cluster," which is not evidence. **Uncertain; do not claim without arbitration.** |
| **Celtic Park** | `42nd–44th Sts, 48th & 50th Aves` | **SUNNYSIDE by the better source.** The dedicated article (actually titled *Celtic Park (Queens)*; the finder's `Celtic_Park_(New_York_City)` URL is a redirect) says in **both** its lead and its infobox: *"Celtic Park was an athletic facility in **Sunnyside**, Queens, New York City"* / `location = [[Sunnyside, Queens\|Sunnyside]]`. Its body's *"historically known as the **Laurel Hill** neighborhood… within the wider **Long Island City** district"* is a historical statement, not a present assignment. The Woodside article's *"on the border between Woodside and Laurel Hill"* is one sentence in a general article and does not even claim the site is *in* Woodside. **Better evidenced: Sunnyside.** Woodside may mention it as a border site. |
| **St. Pat's for All Parade** | starts `43rd Street and Skillman Avenue` | **Genuinely shared; the finder's framing is right.** Wikipedia's own body, re-quoted: *"The parade runds from **Sunnyside** to Woodside, with its starting point in 43rd Street and Skillman Avenue."* Woodside on the Move lists it at `Windmuller Park (52nd St. and 39th Drive)` — re-confirmed verbatim in the org's event JSON-LD. Two locations, two sources. **Coordinator must arbitrate.** Do not write it as Woodside's alone. |

### 1.5 Places the sources place in CD 1 / ASTORIA territory — flag, do not flatten

| Place | Ruling |
|---|---|
| **Woodside Houses (NYCHA)** | F108 and F109 **confirmed exactly**, field for field. The same agency, same row, says `city: WOODSIDE`, `zip_code: 11377` **and** `neighborhood_tabulation_area: QN0104`, `neighborhood_tabulation_area_1: Astoria (East)-Woodside (North)`, `community_district: 1`. 55 building rows returned. Wikipedia concedes *"in western Woodside, bordering Astoria."* **Publishable as Woodside on the mailing address, but the CD 1 fact must be disclosed, not suppressed.** Sample address: `31-05 49TH STREET`. |
| **Bulova former HQ** | See §2.4 — the finder's address is wrong and the 1875 claim is refutable from inside Wikipedia's own citation. |
| **Former trolley car barn / Tower Square** | `Northern Blvd & 51st St` is in the `QN0104` band. Wikipedia text confirmed verbatim, but its only citation is a **Forgotten NY blog post**, and the article's own image is titled *Steinway Railway Woodside barn*, naming a different company than the text's "New York and Queens Railroad Company." **Uncertain, single-sourced to a blog.** |
| **Northern Boulevard station** | MTA record confirmed: `latitude: 40.752885` — inside the CD 1 band. Wikipedia's `locale: Woodside` is an aggregator field. Flag. |
| **William Cullen Bryant High School** | The finder's own address `48-10 31st Avenue` is marked `[GAP]` **and it is unsourced in this file.** I did not source it either. **Do not publish an address for this school.** |

### 1.6 The eastern band — Little Manila and Jackson Heights

Both Wikipedia passages are **confirmed verbatim**, including *"the **69th Street station serves as
the gateway** to Queens' very own Little Manila"* and *"The coverage of Little Manila is along
Roosevelt Avenue, from 63rd Street to 71st Street"* (the latter cited to a 2011 *Daily News* piece
headlined *"Little Manila in Woodside Queens"*).

**Good news for the arbitrator: there is no collision here.** I searched
`jackson-heights-finder.md` and it does **not** claim Little Manila, Ihawan, Renee's Kitchenette,
Jollibee, or the 69th Street station. Woodside can take the district. But note the JH finder flags
*"the 'International Express' National Millennium Trail"* as *"claimable by **all three**"* wave-2
neighborhoods, and flags Travers Park's namesake as having served *"Democratic District Leader for
**Woodside-Jackson Heights**"*. **The Q70 SBS caveat at F128 is correct and should be honoured.**

**Little Manila Avenue co-naming** (`70th Street and Roosevelt Avenue`, June 12, 2022) — Wikipedia
text confirmed verbatim in **both** articles, each cited to a *Sunnyside Post* piece headlined
*"**Woodside** Street Corner to Be Co-Named 'Little Manila Avenue'"*. The NYC Council local law was
not retrieved by either of us. **Ships with attribution; do not call it a law.**

### 1.7 Calvary Cemetery

`49-02 Laurel Hill Blvd • Woodside, NY 11377 / 718-786-8000` — **confirmed verbatim** from the
Archdiocese operator's own site. But DCP gives it a standalone NTA, `QN0271 Calvary & Mount Zion
Cemeteries` (confirmed in my own query). Operator self-declaration is the strongest single signal
and the wave-1 arbitration precedent explicitly ranks *"a self-declared address is rank 1."*
**Publishable as Woodside on that precedent, with the standalone-NTA fact disclosed.** Its history
(F100, 1845 founding, 300 acres, three million burials) rests on **Wikipedia alone** — I did not
reach the Archdiocese's history page. Attribution required.

### 1.8 Marquee-list check — CLEAN

None of Forest Park, Alley Pond Park, Astoria Park, Socrates Sculpture Park or the Louis Armstrong
House Museum appears anywhere in the Woodside finder. **No marquee conflict in this file.** Jackson
Heights' historic district and Sunnyside Gardens likewise do not appear — Woodside makes no claim on
either, and LPC's individual-landmark layer returns no Queens record tagged Sunnyside or Jackson
Heights at all (they are *historic districts*, a different layer neither of us queried).

---

## 2. REFUTATIONS (5)

### 2.1 REFUTED — F106. The phrase the finder told you was unsourced is *in the article*.

The finder wrote: *"That phrase does **not** appear in the raw wikitext of the Woodside article,
which says only (verbatim): 'In addition, the [[Winfield Reformed Church]] is located in Woodside.'
**Treat 'began in 1880 as a Dutch Calvinist church' as unsourced**."*

**This is false.** The Woodside article mentions the church twice. Raw wikitext, re-fetched via
`action=raw` this session:

> "For example, the [[Winfield Reformed Church]] **began in 1880 as a Dutch Calvinist church** and
> in 1969 became the first Taiwanese congregation in America."

The finder made a negative claim it had not checked, and its §M item 13 "PARAPHRASE-LAUNDERING RISK"
warning is therefore misdirected for this phrase. **The author may use it, attributed to Wikipedia.**
(The parallel warning about the "(established 1874)" / "(founded 1896)" church dates at F102 **is**
correct — I searched and those dates are genuinely absent. Keep that half of the warning.)

### 2.2 REFUTED — F76. Nathan Weidenbaum Playground is not where Wikipedia says.

Wikipedia: *"south side of Laurel Hill Boulevard at 61st Street."* NYC Parks, the agency of record,
re-fetched: **`Laurel Hill Blvd., 48 Ave. bet. 63 St. and 64 St.`**, `Park ID: Q205B`,
`Acreage: 0.73`. Two blocks off. **Use the NYC Parks string.** The finder marked this `[GAP]` and did
not retrieve the page; it is retrievable.

### 2.3 REFUTED — F78 / P10. NYC Parks' High Hopes Triangle page says nothing about Sinatra.

The finder called this *"Genuinely unusual visitor draw (a park built around a Sinatra song)"* and
told the verifier to *"confirm the Sinatra/Sammy Cahn connection."* I retrieved the page. **NYC
Parks' Historical Signs text for High Hopes Triangle is about Monsignor Leopold Arcese (1887-1970),
pastor of the Nativity of the Blessed Virgin Mary Church "and an active member of the Ozone Park
community for over 35 years"** — and its Highlights link reads `Monsignor Arcese Triangle`. The
agency page contains **zero** references to the song, to lyrics, or to concrete markers. The page
also carries **no `Zip Code` and no `Acreage`.**

Wikipedia's only citation for the lyric markers is a **Wikimedia Commons photograph of a concrete
tile**, uploaded 2025 — a self-published image, not a source.

**Ruling:** the *name* `High Hopes Triangle`, `Park ID: QZ22`, `Community Board: 2` and the location
`Between 66th St & 67th Street` are confirmed and publishable. **The Sinatra story is not
publishable in prose.** It is single-sourced to a photo caption. (NYC Parks appears to be serving
mismatched sign text on this record; flag it, don't repair it.)

### 2.4 REFUTED — F116 / P24. "1 Bulova Avenue" is a filename, and the address is different.

The finder wrote *"Wikipedia's image caption gives the address as '1 Bulova Avenue'."* It does not.
The wikitext is `[[File:1 Bulova Avenue jeh.jpg|left|thumb|[[Bulova Corporation]] previous
headquarters in Woodside]]` — **"1 Bulova Avenue" is the image *filename*; the caption is
"Bulova Corporation previous headquarters in Woodside."** Same error pattern as the Childs building
at F115, where "5937 Queens Blvd" is likewise filename-only (the finder correctly hedged *there*).

Better: **Wikipedia's own citation quotes the address.** The QNS reference embedded in the article
reads verbatim: *"Bulova Corporation, a watch-making company, is selling its headquarters at
**26-15 Brooklyn-Queens Expressway** in Woodside for $30 million… The firm, which has owned the
two-story office building **since moving there in 1986**."*

**This settles the finder's F116 conflict decisively in the finder's favour and then goes further:**
Bulova occupied the Woodside building **from 1986**, so *"The headquarters opened in 1875"* is flatly
wrong for this site. Bulova's own corporate page (re-fetched verbatim) says only *"In New York City
in 1875, Joseph Bulova set out to transform how the world experienced time."* — a **founding** date
for the company, in New York City generally. **Do not write that Bulova's Woodside headquarters
opened in 1875.** If the building is written at all, the address is `26-15 Brooklyn-Queens
Expressway` and the occupancy is 1986–2014.

### 2.5 REFUTED — two apparatus claims in §C.

**(a) The Doughboy Park slug.** The finder's P2 header says *"Requesting the slug `doughboy-plaza`
redirects to the Doughboy Park page."* **The reverse is true.** This session:
`https://www.nycgovparks.org/parks/doughboy-park` → **HTTP 404**;
`https://www.nycgovparks.org/parks/Q031A` → **302 to `/parks/doughboy-plaza/`**. The live slug is
`doughboy-plaza` and the page `<title>` is "Doughboy Park". **F58's cited URL is dead** — the
headline *"NYC PARKS CELEBRATES NEW BLUESTONE PLAZA IN DOUGHBOY PARK"* is real, but it is on
`/parks/doughboy-plaza`. Fix the citation before publishing.

**(b) F5's corroborating clause.** *"every NYC Parks page for a Woodside park returns `Zip Code:
11377`."* **False, and the finder's own file contradicts it two sections later.** Torsney is
`11104`; Noonan is `11104, 11377`; High Hopes Triangle has **no ZIP field at all**. The narrower
claim in F6 — that every page lists `Community Board: 2` and `Council Member: Julie Won` — **is**
confirmed across all eleven pages I fetched.

---

## 3. DOHMH-ONLY BUSINESSES — existence and address may publish, NOTHING in prose

I re-queried `https://data.cityofnewyork.us/resource/43nn-pn8j.json` per name with
`zipcode='11377'`. **All nine of F156's rows are confirmed exactly**, including the two distinct
`WOODSIDE CAFE` establishments (do not merge them — different addresses, different cuisine labels).

| DBA | Address | ZIP | `cuisine_description` | rows |
|---|---|---|---|---|
| `IHAWAN` | `40-06 70 STREET` | 11377 | Filipino | 22 |
| `RENEE'S KITCHENETTE` | `69-14 ROOSEVELT AVENUE` | 11377 | Filipino | 22 |
| `JOLLIBEE` | `62-29 ROOSEVELT AVENUE` | 11377 | Chicken | 14 |
| `TITO RAD'S GRILL` | `49-10 QUEENS BOULEVARD` | 11377 | Filipino | 21 |
| `SEAN OG'S IRISH PUB` | `60-02 WOODSIDE AVENUE` | 11377 | Irish | 5 |
| `LA FLOR` | `53-02 ROOSEVELT AVENUE` | 11377 | Mexican | 8 |
| `DE MOLE` | `45-02 48 AVENUE` | 11377 | Mexican | 15 |
| `WOODSIDE CAFE` | `60-06 WOODSIDE AVENUE` | 11377 | American | 13 |
| `WOODSIDE CAFE` | `64-23 BROADWAY` | 11377 | Asian/Asian Fusion | 13 |

**For all nine: the ONLY source is the DOHMH restaurant-inspection dataset.** It establishes that a
permitted food establishment of that name exists at that address in ZIP 11377, and its DOHMH cuisine
label — **and nothing else.** No quality, no notability, no hours, no "beloved", no "the best", no
current-operation claim, no founding date. **Their existence and address may be published; nothing
about them may appear in prose.**

Three caveats the author must carry:
- `IHAWAN` (70th St) and `RENEE'S KITCHENETTE` (69-14 Roosevelt) sit in the 63rd–71st contested band.
  Wikipedia's *Little Manila* article names both, which is **not** an independent second source for
  the address — it is a source for the name only, and it gives no address at all.
- `DE MOLE` at `45-02 48 AVENUE` is in the low-40s streets. That is the Sunnyside-contested band and
  the same territory as Torsney (§1.4). **Weakest assignment in the set.**
- `TITO RAD'S GRILL` at `49-10 QUEENS BOULEVARD` vs Wikipedia's *"Queens Boulevard and 50th Street"*:
  compatible, not identical. Publish the DOHMH string.

**Not DOHMH-only** (own website re-fetched and quoted this session, so prose is permitted with
attribution): **Donovan's Pub**, **Sripraphai**, **Big Six Towers**, **Woodside on the Move**,
**Calvary Cemetery**, **Queens Public Library Woodside branch**.

---

## 4. SINGLE-SOURCED CLAIMS — may they ship?

**Ships with attribution ("according to Wikipedia" / "the business says"):**
- The whole of §B history that is Wikipedia-only (F7–F11, F13, F14, F19, F22, F24–F35). All quotes
  re-verified verbatim. Say who is talking.
- F104/F105 Winfield Reformed Church: *"It is the oldest Taiwanese church established in North
  America"* — **confirmed as the article's wording, but that sentence carries no inline citation**,
  and the church's own domain fails DNS. **Remarkable claim, thin source: attribute explicitly or
  drop.** The *"hotbed for Taiwanese independence activism"* sentence is cited to two dead links
  (`wufi.org.tw`, `forgotten-ny.com`) reachable only via archive.
- F111 Big Six Towers: `"almost 1,000 families"`, Mitchell-Lama status — the co-op's own site,
  confirmed. **The union origin is NOT on the site** — I searched the page for "Typographical" and it
  is absent. The finder's gap is real. **Do not write the Typographical Union No. 6 story.**
- F151 Donovan's "best burger in New York City" — **confirmed as the pub's own marketing copy**, not
  as press coverage. Neither of us reached the Time Out / NY Post / Daily News items. **May be
  written only as the pub's own claim, in its voice.** And the finder's warning is correct and
  important: *"landmark"* on that page is marketing language, **not** an LPC designation. Per F79
  (confirmed) Donovan's is not a designated landmark. Do not let that collapse.
- F157 Jollibee "opened its first branch in New York in February 2009, selecting Woodside" —
  confirmed as Wikipedia's wording, cited to a *NYT* piece of 15 Feb 2009 (*"Fast Food for the
  Filipino Soul"*) that **neither of us retrieved**. Strong draw, one unread source. Attribute.
- F167 Charlotte E. Ray. **Correcting the finder:** it says her Woodside connection *"needs an
  independent source."* Wikipedia supplies one — Henry Louis Gates, *Life Upon These Shores*, p. 173,
  quoted in the footnote as *"In 1897, she moved to Woodside in Queens."* Single-sourced but properly
  attributed. **Ships with attribution.** By contrast Wikipedia itself tags **Edmar Mednis** and
  **Joe Spinell** `{{citation needed|date=November 2017}}` — confirmed; **drop those two.**

**Does NOT ship:**
- **F103 St. Sebastian RC Church.** I independently failed to reach any primary source. **No address,
  no founding date, nothing.** It may be *named* only where a confirmed source names it — NYC Parks'
  1923 dedication text (*"blessings by ministers from St. Paul's and St. Sebastian's Churches"*,
  confirmed) and Donovan's own page (*"his neighbors across the street at St. Sebastian"*, confirmed).
- **F114 the four 19th-century buildings** (Hook and Ladder Company 1884; Otto Groeber house 1870;
  Woodside Pavilion 1877; Meyer's Hotel 1882). I re-fetched
  `https://forgotten-ny.com/2005/09/woodside-queens/` and **confirm HTTP 404**. Wikipedia citing a
  dead blog, no addresses, no images. **The finder's `[GAP — HIGH PRIORITY]` stands unresolved.
  Do not publish these as places.**
- **F113 the copper beech** — no location in any source. A visitor cannot find it. Prose only, no record.
- **F115 former Childs Restaurant** — filename-only address. No record.
- **F133 Bayanihan Filipino Community Center** — no address, no evidence it still operates. No record.
- **F160's business list** — undated, includes "video rental places". **Assume nothing is still open.**

---

## 5. NUMERIC AND INTERNAL CONFLICTS — all re-checked, all real

Every conflict the finder logged is genuine. I re-read both sides of each:

- **13,332 vs 13,000 acres** — LP-1956 *"a patent for 13,332 acres in northwestern Queens"*; NYC Parks
  *"a charter for 13,000 acres in 1642."* Both re-quoted. Also note they describe **different grants**:
  LPC's is to "a group of colonists from New England," Parks' is to "Massachusetts colonist Father
  John Doughty." **Not the same sentence — do not merge them.** ("John Doughty" does not appear in
  LP-1956 at all; I searched.)
- **Eight vs nine doughboy statues** — confirmed, same agency, two pages. History page: *"one of
  **eight** such statues"*; monument page: *"one of **nine** such statues."*
- **Ten vs thirteen WWI dead** — confirmed. History: *"**Ten** men who left from this site died in
  combat."* Monument: *"a stone marker… listing the names of the **13** servicemen from Woodside."*
  Different scopes (left-from-this-site vs from-Woodside). **Do not merge.**
- **51 graves / 40+ interments / 15 visible stones** — all three confirmed verbatim. Moot for this
  file: the place is Astoria's (§1.1).
- **1,357 / 1,353 vs 1,358 apartments** — NYCHA's live row confirmed: `total_number_of_apartments:
  1,357`, `number_of_current_apartments: 1,353`. Prefer NYCHA.
- **64-13 vs 64-15 39th Ave** — both confirmed live.
- **Grandstand 2,500 vs 8,000** — confirmed; note the infobox also says `capacity = 2,500 (grandstand)`,
  so 2,500 is the article's settled figure and 8,000 is a 1931 recollection. Moot: Celtic Park is
  Sunnyside's (§1.4).
- **2000 population 43,846 vs 90,000** — confirmed. Scope mismatch. **Use neither without saying which.**
- **Bush Park opened vs named 1987** — confirmed; NYC Parks says *"Commissioner Stern **named** the
  grounds Bush Park on June 18, 1987"* and that construction began 1971. Prefer NYC Parks.
- **Windmuller "acquired" vs "donated"** — confirmed on both sides.
- **Doughboy Park's three addresses** — all three confirmed verbatim this session. Use the park page
  header for the record; the monument's "Location:" line for the statue.
- **LP-1956's "between 31st Street and 32nd Street"** — **confirmed, the typo is real and is in the
  primary source.** Its own title block says 54th/51st Streets and the GIS says 31st–32nd **Avenues**.
- **F55 / F92 / F144 etc. are all "recorded, not resolved" in the finder and stay that way.** The
  finder was right not to resolve them and right to flag every one.

---

## 6. SCOPE WARNINGS — carried forward and reinforced

**F11, F32 and F166 are Woodside + Sunnyside figures, not Woodside figures.** Re-confirmed: the
$67,359 median-income citation is literally to Census Reporter's *"NYC-Queens Community District
2--**Sunnyside & Woodside** PUMA"*. The 135,972 population, the 85.4-year life expectancy, the 86%
on-time graduation and the 11% chronic absence are **all CD 2**. Writing any of them as "Woodside"
is a factual error and it also steals Sunnyside's numbers in a wave where Sunnyside is a sibling
file. **Do not.**

**F121 is time-sensitive and I did not re-check it.** The 61 St–Woodside reconstruction was ongoing
as of the article's October 2025 note with `<7>` express service curtailed and no announced
restoration date. **Verify before writing anything about express service.** Everything else in §G is
confirmed: MTA's live dataset gives `61 St-Woodside`, `daytime_routes: 7`, `structure_type:
Elevated`, `ada: 1`; `Northern Blvd` and `65 St` both `daytime_routes: M R`; only `61 St-Woodside`
and `Northern Blvd` carry `ada: 1`.

---

## 7. WHAT THE AUTHOR MUST BE WARNED ABOUT — short list

1. **Moore-Jackson Cemetery is Astoria's.** No place record. Prose mention only. §1.1.
2. **Torsney Playground and Celtic Park are Sunnyside's.** Noonan Playground is unresolved. §1.4.
3. **General Hart Playground is yours** — Jackson Heights conceded it. §1.3.
4. **No Sinatra prose for High Hopes Triangle.** §2.3.
5. **Bulova: `26-15 Brooklyn-Queens Expressway`, occupied 1986–2014. Never "opened in 1875".** §2.4.
6. **Nathan Weidenbaum Playground: use `Laurel Hill Blvd., 48 Ave. bet. 63 St. and 64 St.`** §2.2.
7. **Nine DOHMH-only businesses: address and existence only, zero prose.** §3.
8. **F11/F32/F166 are CD 2 figures — Woodside *and* Sunnyside.** §6.
9. **"Landmark" at Donovan's is marketing, not LPC.** §4.
10. **The finder's F106 warning is wrong — that phrase is in the article.** Its F102 warning is right. §2.1.
11. **`/parks/doughboy-park` 404s. The live slug is `/parks/doughboy-plaza`.** §2.5.
12. Both the finder and I had **zero WebSearch budget**. Source discovery was directed. **Absence of
    a topic in either file is not evidence of absence** — St. Sebastian, the Forgotten NY buildings,
    the Catherine Gregory local history (*Woodside, Queens County, New York: A Historical
    Perspective, 1652-1994*, cited by LPC — citation confirmed verbatim), the NYC Council co-naming
    law, and the 1874 and 2009 and 2013 *NYT* items all remain unread by anyone.
