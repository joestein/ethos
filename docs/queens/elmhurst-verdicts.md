# Elmhurst, Queens — VERIFIER VERDICTS

**Role:** Independent verifier. I re-fetched the finder's cited URLs myself. Every quotation below
that I mark `confirmed` was re-extracted by me from the source, not copied from the finder.

**Method.** LPC designation reports LP-2593, LP-2086, LP-2131, LP-0138, LP-1177 and LP-1292 were
downloaded as PDFs from `s-media.nyc.gov` and converted with `pdftotext -layout`; quotations were
matched against the extracted text after whitespace/quote normalisation. Wikipedia was re-fetched as
**raw wikitext via the MediaWiki API** (not as a rendered summary), because the finder correctly
identified two prior errors — F78's "1897" and F156's "E F M R" — as WebFetch *summarizer artifacts*
rather than Wikipedia claims. Both of those diagnoses are **confirmed**: neither string exists in the
wikitext. Datasets (`buis-pvji`, `9nt8-h7nd`, `39hk-dx4f`, `43nn-pn8j`) were queried live. NYC Parks
pages were retrieved with `urllib`.

**Decisive addition of my own:** I ran **point-in-polygon tests of each candidate's coordinates
against DCP's official 2020 NTA polygons** (`the_geom` on `9nt8-h7nd`), and cross-checked with NYC
Planning Labs **GeoSearch**. This resolves most of §N by geometry rather than by argument, and it is
the basis for every neighborhood ruling below.

**A caution about my own "misses."** My first automated pass reported ~30 quotation failures. On
inspection **almost all were extraction artifacts**, not source errors: the LPC reports are printed
in two columns and `pdftotext` interleaves them, and Wikipedia's prose is broken by `[[wikilinks]]`
and `{{templates}}`. I re-checked every failure by hand before recording any verdict. **F2 in
particular I nearly refuted in error** — the sentence is there, wrapped in wikilinks. A verifier who
trusts a first-pass string match would have produced a badly wrong file here.

---

## HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated | **171** (F1–F171, numbering audited: contiguous, no gaps, no duplicates) |
| **Confirmed** | **121** |
| **Refuted** | **16** |
| **Uncertain** | **34** |
| Candidate places | 58 (P1–P58, audited: contiguous) |
| **Places surviving as publishable** | **33** |
| Businesses publishable as address-only, barred from prose | **22** |

The finder's own counts (171 / 58 / 21 §N rows) are **confirmed** by direct audit of the file.

---

## 1. NEIGHBORHOOD ASSIGNMENT — THE RULINGS

Method note: DCP's NTA polygons are the best available public boundary. Where LPC *prose* and LPC's
own *geodata* disagree, I rule for the geodata, because the prose sentences in question are
throwaway "see also" lists written to orient a reader, while the geodata is the Commission's own
georeferenced site record.

### 1a. The two marquee-list places. Both are RULED OUT of Elmhurst.

**LOUIS ARMSTRONG HOUSE MUSEUM — NOT ELMHURST. Corona's claim, not Elmhurst's.**

Exact address, ruled from the museum's own website, quoted verbatim:

> "The Louis Armstrong Center is located at: **34-56 107th Street, Corona, NY 11368**"
> — louisarmstronghouse.org/visit/, retrieved by me

The site footer repeats "34-56 107th Street, Queens, NY 11368". The LPC dataset independently gives
`Louis Armstrong House` | `34-56 107th Street` | `LP-01555`. **The address 34-56 107th Street in the
brief is confirmed exactly.**

Its neighborhood, three ways:
- **The institution says Corona** ("Corona, NY 11368"; the museum's own exhibition is titled "The
  Corona Collection", and its text speaks of "life in Corona" and "their Corona home").
- **Wikipedia's Corona article says Corona**, verbatim: "The [[Louis Armstrong House]] attracts
  visitors to the neighborhood and preserves the legacy of musician Louis Armstrong, **one of
  Corona's most prominent historical residents**."
- **DCP geometry says North Corona.** My point-in-polygon test returns `QN0303 North Corona`, and
  GeoSearch independently labels it "34-56 107 STREET, **North Corona**, NY, USA". The LPC dataset
  agrees: `nta2020` = `QN0303`, `cd` = `403`.

⚠ **Note for the arbitrator, since this cuts across waves:** DCP puts this address in **North
Corona, Community District 3** — i.e. in the *Jackson Heights–East Elmhurst* CDTA, **not** in CD4
alongside Elmhurst and Corona. If a wave-1 Jackson Heights file claimed it on a CD3 argument there
would be a real conflict. But the better-evidenced assignment is **Corona**, because the institution
itself, and the neighborhood article, both say Corona, and "North Corona" is a statistical
subdivision that no source outside DCP uses for this building.

**Ruling: Corona. The Elmhurst file may not create it under any slug.** The Elmhurst finder did not
attempt to claim it — the Wikipedia Elmhurst article contains **zero** occurrences of "Armstrong",
which I verified directly. No action needed beyond not adding it.

**FOREST PARK — NOT ELMHURST. Forest Hills' claim, not Elmhurst's.**

Forest Park is **its own Joint Interest Area**, exactly like Flushing Meadows Corona Park:

| nta2020 | ntaname | ntatype | cdta2020 | cdtaname |
|---|---|---|---|---|
| `QN8291` | `Forest Park` | `9` | `QN82` | `QN82 Forest Park (JIA 82 Approximation)` |

(Confirmed by me against `9nt8-h7nd`.) The LPC dataset places the Forest Park Carousel at
`nta2020` = `QN8291`, `cd` = `482`, address "within Forest Park, west of Woodhaven Boulevard and
north of West Main Drive".

Forest Park is in **neither CD4 nor CD6** and is nowhere near Elmhurst. Elmhurst's *southern*
boundary is the Long Island Expressway; Forest Park lies far to the south, below Forest Hills. The
only appearance of "Forest Park" in the entire Wikipedia Elmhurst article is historical and is about
the vanished *Town* of Newtown, verbatim:

> "…was the center of a municipality that comprised the villages that were located north of
> present-day [[Forest Park (Queens)|Forest Park]] and west of [[Flushing Meadows-Corona Park|Flushing Meadows]]."

**That sentence describes the 17th-century township, not the modern neighborhood, and must not be
used to claim Forest Park.** Ruling: **Forest Park belongs to Forest Hills' file**, and even there it
is a JIA rather than an in-NTA feature. The Elmhurst file may not create it.

### 1b. The two contested LPC landmarks — both RULED OUT of Elmhurst

The finder correctly recorded that LPC's prose and LPC's dataset disagree. I re-read both. **The
prose quotations are confirmed verbatim** (I reproduce them below with the OCR noise marked), **but
the underlying assignment is refuted.**

**N1 — REMSEN CEMETERY → REGO PARK.**

LPC prose, LP-2131 p.4, confirmed verbatim by me:
> "…Landmarks are the Reformed Dutch Church of Newtown (85-15 Broadway), the **Remsen Cemetery
> (69-43 Trotting Course Lane)**, the Edward E. Sanford House (107-45 47th Avenue) and the
> Benevolent and Protective Order of Elks, Lodge Number 878 (82-10 Queens Boulevard)"

— introduced by "Elmhurst's other designated New York City Landmarks are…". Confirmed. LP-2086 p.2
carries the same list. **Confirmed as a quotation.**

Against it: the LPC dataset gives `nta2020` = `QN0601`, `cd` = `406`, and **my point-in-polygon test
of the Commission's own coordinates returns `QN0601 Rego Park`.** LP-1177, the actual designation
report, **names no neighborhood at all** — I confirmed this by searching its full text for
"Elmhurst", "Rego Park" and "Forest Hills": **all three return zero hits.** Wikipedia separately
places the surviving stretches of Trotting Course Lane in Forest Hills.

**Ruling: Rego Park, better evidenced.** The 2001/2003 prose is a two-decade-old aside; the geodata
is georeferenced. **Not Elmhurst. Do not create it here.**

⚠ **Refuted detail in the finder's own §N:** row N1 attributes the string "adjoining 69-43 Trotting
Course Lane" to "(LPC data)". It is not. The **dataset** string is "**adjacent to** 69-43 Trotting
Course Lane"; "adjoining" is LP-1177's header wording. Small, but the finder presented it as a quote.

**N2 — EDWARD E. SANFORD HOUSE → CORONA. Address is 102-45 47th Avenue.**

Dataset: `Edward E. Sanford House` | `102-45 47th Avenue` | `LP-01292` | `nta2020` = `QN0402`
(**Corona**) | `cd` = `404`. My point-in-polygon test of its coordinates returns **`QN0402 Corona`**.

**And here the finder made a real error, which I refute.** F50 states that the 1987 report "**does
not use the name 'Edward E. Sanford House' at all, and names no neighborhood**." Both halves are
wrong:

1. LP-1292 p.1 opens, verbatim: "**Built for Edward E. Sanford about 1871**, this small, two-story,
   frame house is one of the last intact 19th-century [buildings] remaining in what was the
   [village] of Newtown". The finder itself quotes this sentence in **F51** — so F50 and F51
   contradict each other inside the finder.
2. LP-1292 **does** name a neighborhood, repeatedly, in its photo credits. Verbatim, four times:
   "102-45 47th Avenue Built: c. 1871 Landmarks Preservation **Corona, Queens**".

So the 1987 report itself says Corona. Confirming the finder's F52, LP-1292 p.2 reads verbatim:
> "One of the earliest investors was Benjamin W. Hitchcock who owned the site of the Sanford house
> and the surrounding area, which he called the **Village of West Flushing** in 1854."

and its note 3, which the finder did not find, closes the loop verbatim:
> "The current name for the neighborhood, **Corona**, came into common usage after a branch of the
> Post Office was opened in the community in 1882."

**Ruling: Corona, overwhelmingly. Exact address 102-45 47th Avenue** (the "107-45" in the 2001 and
2003 reports is a typo repeated between them). **Not Elmhurst. Do not create it here.**

**N3 Congregation Tifereth Israel (109-18 54th Avenue) and N4 Fire Engine Company 289 / Ladder
Company 138 (97-28 43rd Avenue)** — both `QN0402` **Corona**, both confirmed by my geometry test.
Same CD as Elmhurst, which is the trap. **Not Elmhurst.**

### 1c. Contested rows that RESOLVE IN ELMHURST'S FAVOUR

I geocoded every one of these and tested it against the NTA polygons. **All land inside `QN0401`
Elmhurst.**

| §N row | Place | Address | Ruling |
|---|---|---|---|
| N7 | **Geeta Temple Asharam** | 92-09 Corona Avenue | **Elmhurst.** GeoSearch: "92-09 CORONA AVENUE, **Elmhurst**, NY". The street name is a red herring — Corona Avenue runs well into Elmhurst. |
| N8 | **Satya Narayan Mandir** | 75-15 Woodside Avenue | **Elmhurst.** GeoSearch: "75-15 WOODSIDE AVENUE, **Elmhurst**, NY". |
| N9 | **Thai cluster, 76xx–77xx Woodside Avenue** (7 businesses) | see §3 | **Elmhurst.** All seven test inside `QN0401`. Wave-2 Woodside did not claim them — I re-checked. **But see the DOHMH prose bar in §3.** |
| N10 | **Peruvian restaurants on Corona Avenue** | 94-59, 91-18, 92-02 Corona Ave | **Elmhurst.** All three test inside `QN0401`, **including 94-59** — the finder's guess that "94-59 is east of Junction Blvd numbering" is **refuted**; Corona Avenue runs diagonally and its 94-xx block is still Elmhurst. **DOHMH prose bar applies.** |
| N6 | **Elmhurst African American Burial Ground** | Corona Avenue & 90th Street | **Elmhurst.** The Corona Avenue frontage near 90th St tests inside `QN0401`. ⚠ But see the sourcing warning in §4. |
| N16 | **Queens Center** | 90-15 Queens Boulevard | **Elmhurst.** GeoSearch: "90-15 QUEENS BOULEVARD, **Elmhurst**, NY". Never seriously disputed. |
| N18 | **Elmhurst Park** | Grand Ave., 57 Ave. bet. 74 St. and 80 St. | **Elmhurst.** NYC Parks prints "Zip Code: 11373", "Community Board: 4" — I confirmed both strings on the page. |

**All twelve religious institutions P19–P30 test inside `QN0401` Elmhurst.** I geocoded each
individually; every one returns a GeoSearch label ending "Elmhurst, NY, USA". This includes the two
the finder flagged (P26 Corona Avenue, P28 Woodside Avenue) and the two I independently worried
about on address-numbering grounds (**P24 Elmhurst Muslim Center, 42-12 79th Street** and **P20
Bangladesh Hindu Mandir, 94-39 44th Avenue**, both of which sit close to the Roosevelt Avenue and
Junction Boulevard boundaries). **All clear.**

Also confirmed inside Elmhurst by geocoding: **P31** First Presbyterian Church of Newtown (54-05
Seabury Street), **P32** The Rock Church / Elmwood Theatre (57-02 Hoffman Drive), **P51** Elmhurst
Hospital (79-01 Broadway), **P52** QPL Elmhurst (86-07 Broadway), **P55** Queens Center (90-15
Queens Boulevard), **P57** Queens Place Mall (88-01 Queens Boulevard), **P6** St. James cemetery
(84-07 Broadway), **P17** Bloom Farmhouse site (90-11 56th Avenue).

### 1d. The transit rows N11–N15

Wikipedia does list the Roosevelt Avenue stations under Elmhurst. **MTA's dataset is confirmed
exactly as the finder printed it** — I re-queried `39hk-dx4f` and every field matches, including the
two points the finder flagged:

- `Jackson Hts-Roosevelt Av` is **`E F M R`**, not "Queens local" — so Wikipedia's grouping of all
  four Queens Boulevard stations as "Queens local" is **refuted** by MTA.
- ADA: `Jackson Hts-Roosevelt Av`, `74 St-Broadway`, `Junction Blvd` and the **Jamaica-line**
  `Woodhaven Blvd` are `ada=1`. **`Elmhurst Av`, `Grand Av-Newtown`, the Queens-Blvd `Woodhaven
  Blvd` and `90 St-Elmhurst Av` are `ada=0`.** Confirmed.
- `74 St-Broadway` and `Jackson Hts-Roosevelt Av` share `complex_id` `616`. Confirmed.

**Ruling.** Roosevelt Avenue is Elmhurst's *boundary*, per F2 (confirmed below), so these stations
sit **on the line, not inside it**, and three of them are *named for Jackson Heights or Broadway*.
**Elmhurst's own stations are `Elmhurst Av`, `Grand Av-Newtown`, the Queens-Boulevard `Woodhaven
Blvd`, and `90 St-Elmhurst Av`.** The author may say the Flushing Line "runs along Roosevelt Avenue,
the north border of Elmhurst" — that is Wikipedia's own verbatim phrasing and I confirmed it — but
**must not present Jackson Heights–Roosevelt Avenue, 82nd Street–Jackson Heights or 74th
Street–Broadway as Elmhurst stations.** Wave 1 owns Jackson Heights.

⚠ **N15 stands and is dangerous:** there are genuinely **two different stations named "Woodhaven
Blvd"** — `G11` on the Queens Boulevard Line (`M R`, Elmhurst) and `J15` on the Jamaica Line
(`J Z`, far south). Confirmed. Any sentence must disambiguate.

### 1e. Flushing Meadows Corona Park — hard exclusion, and Elmhurst does not even touch it

**F2 is CONFIRMED verbatim** (this is the load-bearing boundary sentence, and I nearly mis-refuted
it — it is wrapped in wikilinks in the source):

> "It is bounded by [[Roosevelt Avenue]] on the north; the [[Long Island Expressway]] on the south;
> [[Junction Boulevard]] on the east; and the [[New York Connecting Railroad]] on the west."

cited in the article to the *New York Times*, August 4, 1985, "If You're Thinking of Living in
Elmhurst". **Elmhurst's eastern boundary is Junction Boulevard.** Flushing Meadows Corona Park lies
east of that, beyond Corona. **Elmhurst does not border the park.**

F166 confirmed: the Unisphere is `nta2020` = `QN8191`, `cd` = `481`, a Joint Interest Area in
neither CD4 nor CD6.

**None of the eight `Ethos.Seeds.CitiFieldPlaces` places may be created here under any slug, and —
this is the part the Bronx concourse draft got wrong — none of them may be NARRATED here either.**
Do not tell the story of the Unisphere, the World's Fairs, the Queens Museum, the Hall of Science or
the Mets. **Link to `/g/citi-field-guide` and move on.** Linking routes the reader; narrating
duplicates the corpus and returns as a Critical.

The one legitimate connection, which the finder identified correctly and which I confirm, is
**Horse Brook**: Wikipedia states verbatim that the buried creek "flowed to the [[Flushing River]]
from the present-day intersection of Kneeland Avenue and Codwise Place." **That is one sentence of
hydrology, not a licence to describe the park.**

---

## 2. PUBLISHABLE STREET ADDRESSES

**33 places survive as publishable.** Exact strings, as I verified them:

**Designated landmarks (LPC dataset, all four confirmed exactly; `lpc_sitest`=`Designated`,
`landmarkty`=`Individual Landmark`, `cd`=`404`, `nta2020`=`QN0401`):**

| Place | Address (exact string) |
|---|---|
| P5 Old Saint James Episcopal Church (Old Saint James Parish Hall) | `86-02 Broadway` (LP-2593 header adds "aka 85-08 51st Avenue") |
| P10 Reformed Dutch Church of Newtown and Fellowship Hall | `85-15 Broadway` |
| P12 Newtown High School | `48-01 90th Street` |
| P14 Elks Lodge 878 / P15 New Life Fellowship Church | `82-10 Queens Boulevard` |

F48 is **confirmed exactly**: querying `buis-pvji` for `nta2020='QN0401'` returns **exactly these
four and no others**. **There are no historic districts and no scenic landmarks in Elmhurst.**
Confirmed.

**Other places with publishable addresses:** P6 St. James Church cemetery `84-07 Broadway`;
P31 First Presbyterian Church of Newtown `54-05 Seabury St.`; P32 The Rock Church at Elmwood
Theatre `57-02 Hoffman Drive`; P51 NYC Health + Hospitals/Elmhurst `79-01 Broadway`;
**P52 Queens Public Library, Elmhurst branch `86-07 Broadway, Elmhurst, NY 11373`**;
P55 Queens Center `90-15 Queens Boulevard`; P57 Queens Place Mall `88-01 Queens Boulevard`;
and the twelve religious institutions P19–P30 at the addresses printed in F105 — all twelve
addresses re-checked and all twelve geolocated to Elmhurst.

**Parks (NYC Parks property records; every page prints "Zip Code: 11373" / "Community Board: 4",
which I confirmed):** P3 Middleburgh Triangle (Q069, Triangle/Plaza, Acreage 0.00); P34 Elmhurst
Park (Q492, 6.22 ac, Community Park, "Grand Ave., 57 Ave. bet. 74 St. and 80 St. Queens");
P35 Queens Vietnam Veterans Memorial (northeast corner of Elmhurst Park); P37 Moore Homestead
Playground (Q361, 1.98 ac, "Broadway., 82 St., 45 Ave. Queens"); P38 Veterans Grove (Q013, 0.63 ac,
"Whitney Ave., 43 Ave., bet. Judge St. and Ketcham St. Queens"); P41 Frank D. O'Connor Playground
(Q098, 1.54 ac); P43 Newtown Playground (Q041, 0.70 ac); P44 Horsebrook Island. **All park IDs and
acreages confirmed.**

**P2 Elmhurst African American Burial Ground** — publishable, but its only stated location is the
*intersection* "Corona Avenue and 90th Street", not a street number. See §4.

**NOT publishable as places (25):** P4 Remsen Cemetery (Rego Park); P1, P7, P58 (vanished sites,
intersections only); P16 Jamaica Savings Bank branch, P33 St. John's Queens Hospital, P54 Cathedral
Preparatory School (no address in any source I could reach); P8, P9, P18, P39 (organisations, not
places); P11, P13, P42 (sub-features — fold into their parents); P17, P36, P53, P56, P40 (demolished
or vanished — usable in prose, not as place records); P45 Libra Triangle (unresolved whether it is
distinct from P44); P46–P50 (Hoffman Park, Simeone Park, Crowley Playground, Long Island Mews,
General Hart Playground — appear only in "Other Parks Nearby" panels; **I did not verify their
locations and neither did the finder; do not create them**).

⚠ **N19/N20 stand: Lost Battalion Hall Recreation Center and Horace Harding Playground are Rego
Park / Forest Hills territory.** Neither the finder nor I retrieved their property pages. **Do not
claim either.**

---

## 3. THE DOHMH-ONLY BUSINESSES — EXISTENCE AND ADDRESS ONLY, NOTHING IN PROSE

**F162's sourcing constraint is confirmed and I restate it as a hard rule.**

For **all 22 individual restaurants** listed in F162, the **DOHMH restaurant inspection dataset
(`43nn-pn8j`) is the only source in existence for this project.** No review, no press coverage, no
institutional listing, no proprietor statement was obtained by the finder, and I obtained none
either. I re-queried the dataset and **confirmed the `dba`, `building` and `street` values for every
name I tested** — the addresses are real.

**Therefore: their existence and their street address may be published. NOTHING about them may
appear in prose.** No adjective, no dish, no "beloved", no "one of the city's best", no claim about
what they serve beyond the dataset's own `cuisine_description` field, no history, no founding date,
no atmosphere. A health-inspection record is proof that a food business is licensed at an address on
a date. **It is not a source about a restaurant.**

This applies to all of: `AWANG KITCHEN`, `SUMATERA`, `ASIAN TASTE 86`, `TASTE GOOD`, `SUMMER`,
`TASTE OF HIMALAYA`, `JOJU / JOJU BOWL`, `BOON CHU`, `EIM KHAO MUN KAI`, `JAI SANG MA`, `SARAN ROM`,
`SABAY THAI`, `CHAO THAI`, `NA RATH`, `EATERNITI`, `AYADA`, `ZAAB ZAAB`, `KHAO KANG`,
`SPICY SHALLOT`, `PATA PA-PLEAN`, `HUG ESAN`, `TEA CUP CAFE`, `CORNER 28`,
`LAO BEI FANG DUMPLING HOUSE`, `SHAXIAN SNACKS`, `TAIWANESE CUISINE`, `KULU DESSERTS`,
`FILIPINIANA`, `SARILING ATIN`, `LAHI`, `COSTA VERDE`, `LA UNION RESTAURANT`, `SONEROS`,
`SABOR PERUANO IV`.

⚠ **Also barred from prose: `Hong Kong Supermarket`, `New York Supermarket` and `Cathay Bank`
(F160).** These are named only inside a Wikipedia sentence whose own citation is a **dead
about.com photo gallery**. That is not a source for a named business. Do not describe them.

⚠ **"Little Thailand Way" — DO NOT ASSERT IT.** The finder could not establish it; neither could I.
**Uncertain. Omit entirely.**

### F161 — the aggregate profile is REFUTED on its numbers, CONFIRMED in shape

I re-ran the query. **The finder's tallies do not reproduce.** Today's dataset returns **3,482
inspection rows** (matches) resolving to **268 unique establishments, not 265**. Divergences:
`Chicken` is **9**, not 6; `Queens Boulevard` is **63**, not 61; `82 Street` is **15**, not 14;
**12 establishments carry no `cuisine_description` at all**, which the finder's tally silently
dropped; and the field value is literally `Juice, Smoothies, Fruit Salads`, not
"Juice/Smoothies/Fruit Salads". This is a live dataset and drift is expected — which is exactly why
**no specific count from it may be published as a fact.**

The **shape** is confirmed and may ship **with attribution to the dataset and without numbers**:
the ZIP-11373 restaurant registry skews Chinese, Latin American and Thai, with a small but real
Indonesian and Southeast Asian presence.

⚠ **And a correction the author needs: ZIP 11373 is NOT the Elmhurst NTA.** I tested all 268
establishments against the NTA polygons: **258 fall in Elmhurst, 9 in Corona, 1 in Maspeth.** Close,
but not identical. **Never write "Elmhurst has 268 restaurants."**

---

## 4. SINGLE-SOURCED CLAIMS AND WHAT MAY SHIP

**May ship WITH attribution** (single-sourced but the source is institutional and named in-text):

- **The Walentyna and Aleksander Janta-Połczyński house (F123).** Confirmed verbatim on NYC Parks'
  Veterans Grove page, including "Walentyna stayed in the house until April 2020 when she died at
  the age of 107." Sole source, but it is a City agency's own sign. **Attribute to NYC Parks.**
  ⚠ Its internal tension is real and unresolved: they "met in Buffalo, New York **after the war**"
  yet she translated Polish Underground reports "**During World War II**." **Do not smooth this
  over.** Write only what Parks says, attributed, or drop the Buffalo clause.
  ⚠ The house has **no address** — "adjacent to this park". Not a place record.
- **The Elmhurst gas tanks → Elmhurst Park → Vietnam Veterans Memorial sequence.** Confirmed
  verbatim on NYC Parks, including "the site was sold by KeySpan to the City of New York for $1".
  ⚠ **Removal date is UNCERTAIN — three sources, three dates (1993 NYT, present tense "are down,
  deflated forever"; 1996 Queens Tribune; 2001 Wikipedia prose).** Do not pick one silently. The
  1993 NYT is contemporaneous and strongest; if the date is stated at all, attribute it.
  ⚠ **Tree count: confirmed conflict inside one page — prose "more than 620 trees", Vital Signs
  panel "370 Mapped Trees". Both strings verified. Publish neither number.**
  ⚠ **"the City's first" (NYC Parks) vs "Queens' first" (Queens Daily Eagle) memorial — different
  claims. Uncertain. Use the Parks wording, attributed, or say neither.**
- **The Elmhurst African American Burial Ground (F30–F34).** Preservation League of NYS page
  confirmed verbatim, including "settled by free African Americans in 1828", "most likely Martha
  Peterson, a 26-year-old African American woman", the denied Mount Olivet permit, and — a detail
  the finder missed, which I add — "**In 1931, the city de-mapped the cemetery**". The League also
  states the church "is now located in **Jackson Heights**, Queens", resolving F34's conflict in the
  League's favour over Wikipedia's vaguer "further east".
  ⚠ **CRITICAL SOURCING WARNING: the League's page does NOT contain the strings "Corona Avenue" or
  "90th Street".** I checked. **The address is single-sourced to Wikipedia alone.** Publish the
  place; attribute the location loosely ("near Corona Avenue and 90th Street") or omit the
  intersection.
  ⚠ Wikipedia says "The church is hoping to buy the land"; the League credits the **Elmhurst History
  and Cemeteries Preservation Society**. **Unresolved. Prefer the League, attributed.**
- **LP-2086's "the borough's first enclosed shopping mall, which opened in 1973."** Confirmed
  verbatim. ⚠ **But LP-2086 never names Queens Center.** The identification is an inference. Ship
  the LPC sentence attributed, or ship Queens Center's 1973 opening — **not the two welded
  together**. Note Queens Place opened in **1965**, eight years earlier.

**MAY NOT SHIP — uncertain, no attribution rescues them:**

- **F132/F133 — every Elmhurst Hospital fact rests on Wikipedia alone.** The hospital's own site is
  behind a Radware bot challenge; the finder failed and so did I. **545 beds, Level I Trauma Center,
  1832 founding, the $200m→$250m renovation, the 40 ventilators and 40 Tesla BiPAP machines — all
  UNCERTAIN.** The **only** institutionally corroborated hospital fact is the 1957 move, confirmed
  verbatim on NYC Parks: "City Hospital (now NYC Health + Hospitals/Elmhurst) moved from Roosevelt
  Island and opened across the street in 1957." **Use that one; attribute it to NYC Parks.**
  The COVID-19 "center of the center" framing may be used **only** as a quotation attributed to
  Wikipedia's source, and ⚠ **the 303,494 / 12,954 / 1,178 figures are for FOUR neighborhoods
  combined and must never be presented as Elmhurst's.**
- **F102 — NRHP status for St. James Church and the Reformed Church of Newtown is UNCONFIRMED at the
  primary level.** Neither the finder nor I could retrieve the NPS nomination PDFs. The Elks
  (NRHP 2014) and First Presbyterian (NRHP September 9, 2013) listings are confirmed only via
  Wikipedia's NRHP-listings table. **Attribute all NRHP claims to Wikipedia or omit.**
  ⚠ **First Presbyterian Church of Newtown is NRHP-listed but is NOT a NYC individual landmark** —
  it is absent from `buis-pvji`. Confirmed. **Easy to get wrong; do not call it a City landmark.**
- **F103 Jamaica Savings Bank de-designation (2005)** — single-sourced to a dead Curbed blog post,
  and **no address is given by any source**. **Uncertain. Omit or attribute explicitly.**
- **F157 bus routes** — never checked against an MTA dataset by the finder or by me. **Uncertain.**
- **F164 — Risë Stevens and Tommy Rettig carry Wikipedia's own `{{citation needed}}` tags.** Omit
  both. The other residents' quotations I confirmed present in the wikitext, but **I did not
  re-fetch the underlying newspaper articles**; attribute to the named outlet as Wikipedia does.
  ⚠ **Carroll O'Connor's own citation ends the family in Forest Hills** — an adjacency trap in a
  wave-3 file. Handle carefully or drop him.
- **F131 / P46–P50** — "Other Parks Nearby" panel entries only. **Uncertain. Do not create.**

---

## 5. REFUTED — the full list (16)

1. **F50** — LP-1292 "names no neighborhood" and never uses "Edward E. Sanford House". **False on
   both counts.** It says "Built for Edward E. Sanford about 1871" and captions its plates
   "Corona, Queens" four times. (Contradicts the finder's own F51.)
2. **F49 as fact, for Remsen Cemetery** — quotation confirmed, assignment refuted. **Rego Park.**
3. **F49 as fact, for the Sanford House** — quotation confirmed, assignment refuted. **Corona.**
4. **F137's 160,534** — the Wikipedia sentence is confirmed verbatim, but it is **not an Elmhurst
   figure**. Its cited source is `furmancenter.org/neighborhoods/view/**elmhurst-corona**`, which I
   confirmed in the wikitext, and the same article gives CB4 (Elmhurst *plus* Corona) as
   **135,972**. The finder's arithmetic check also holds. **Reject 160,534.** F140's 2020 DCP
   figures (55,800 Asian + 42,600 Hispanic) are the usable ones.
5. **F134's "86-01 Broadway"** — refuted by the institution. QPL's own branch page reads verbatim
   "**86-07 Broadway / Elmhurst, NY 11373**", phone "(718) 271-1020". I re-fetched it.
6. **F62(a)** — Wikipedia's "built in 1734". LP-2593's header reads "Built: 1735-36"; the body says
   the frame was raised in May 1735 and "The church was completed in 1736". **Use LPC.**
7. **F62(b)** — "under the rule of British King George III". **Anachronistic**; his reign began
   1760. Plain error.
8. **F62(c)** — the "clock tower … destroyed in an 1882 storm". LP-2593 describes a **steeple with a
   spire surmounted by a huge weathervane in the form of a crowing cock** (confirmed verbatim), and
   a deliberate 1883 remodeling in which a rear addition replaced the west-end tower. **Not a clock
   tower, not a storm.**
9. **F74** — Wikipedia's "The original church was built in 1733". LP-0138 states verbatim: "The
   first church built on the site was **completed by the congregation in 1735**." **Use LPC.**
10. **F78's "1897 / Corona Avenue and 90th Street" for Newtown High School** — I searched the raw
    wikitext and **the string does not exist**. The finder's diagnosis (a summarizer artifact) is
    correct. LP-2131 governs: **48-01 90th Street, built 1920-21.**
11. **F156's "E F M R" as a Wikipedia claim** — likewise absent from the wikitext; the article says
    "Queens local". Summarizer artifact, correctly diagnosed. **But MTA does give
    `Jackson Hts-Roosevelt Av` as `E F M R`, so Wikipedia's "Queens local" grouping is itself
    wrong.**
12. **F119** — NYC Parks' "Clement Clarke Moore (1779-1863) was the better-known **ancestor** of
    Reverend Moore". Confirmed verbatim as the source's wording, and **refuted as fact**: the
    relationship runs the other way. LP-2593 makes Clement the **son** of Benjamin Moore
    (1748-1816), himself a Moore descendant. **Do not repeat the Parks phrasing.**
13. **F55** — LP-1177's "April 31, 1768". Confirmed verbatim, **refuted as a date: April has 30
    days.** Source error. Do not publish the day.
14. **F42's 1899 Cord Meyer founding date** — NYC Parks' Middleburgh Triangle sign, confirmed
    verbatim, but it cannot stand beside the 1896 land purchase and the 1896 renaming in two LPC
    reports. **Prefer LPC.**
15. **F10's "three spellings across three sources"** — overstated. Wikipedia carries **both**
    spellings in one article: its lead says "originally named '''Middleburgh'''" while the body says
    "{{lang|nl|Middelburgh}} ('Middleburgh')". Not a clean three-way split.
16. **N1's "adjoining … (LPC data)"** — misattributed quotation; the dataset says "**adjacent to**".
17. **F161's tallies** — do not reproduce (see §3).

*(Counted as 16 distinct claims; F49 is split across two rows because it makes two assignments.)*

---

## 6. CONFIRMED HIGHLIGHTS — the material that is genuinely safe

Everything in this list I re-extracted from the primary source myself.

- **F48** — exactly four individual landmarks in Elmhurst, no historic districts. Exact.
- **F1** — the NTA table, every field value. Exact. Corona and North Corona are different NTAs in
  different CDs; FMCP and Forest Park are Joint Interest Areas (`ntatype` `9`).
- **F155** — the MTA station table, every field. Exact.
- **F2** — the boundary sentence, cited to NYT 1985.
- **F58** — LP-2593's carefully hedged claim, verbatim: "It is New York City's oldest Church of
  England (Episcopal) building and the City's second oldest religious building that is still
  standing." **Ship the hedge intact. Do not flatten it to "oldest building in New York."**
- **F59** — "located at the southwest corner of Broadway and 51st Avenue within the central district
  of Elmhurst, Queens."
- **F67** — the slave room, verbatim, including the 1954 parish history's "…small stairway [that]
  led …to an upper room called 'the slave room'".
- **F24** — "…183 white inhabitants and 93 Negro slaves." Verbatim, LPC's own rendering.
- **F146** — "The segment of Queens Boulevard through Elmhurst was completed in 1923, the same year
  that construction of the Elks Lodge began." Verbatim. The best Elmhurst-specific Queens Boulevard
  fact in the file, and institutional.
- **F47** — the 112-countries sentence, confirmed **in both LP-2131 and LP-2086** independently.
- **F83, F84, F86, F88, F91** — the 169-foot tower, the drafting-room fire, Dillingham Hall, the
  "girls' corrective training room", the 4,500 students. All verbatim. ⚠ **F91's 4,500/200 are 2003
  figures. Do not present as current.**
- **F92–F97** — the Elks: The Ballinger Company, "$750,000, opened on October 26, 1924", six bowling
  alleys, "noted sculptor, Eli Harvey", "raffling off two dozen Cadillacs". All verbatim.
- **F98** — membership peak 6,600, sale to New Life Fellowship Church in 2001. ⚠ **"will continue to
  use part of the building" is a 2001 present-tense statement. Current status is NOT established.**
- **F71, F72, F73, F75, F76** — LP-0138 in full, including "85-15 Broadway, **Elmhurst**, Borough of
  Queens" in the designation clause, and "From the Corona Avenue side, the cemetery…".
- **F106** — the alphabetical street grid (Aske, Benham, Case, Denman, Elbertson, Forley, Gleane,
  Hampton, Ithaca, Judge, Ketcham, Layton, Macnish) and "Whitney Avenue also has the most religious
  institutions of any street in Elmhurst." Verbatim. Distinctly Elmhurst, and checkable.
- **F109, F111, F113, F114, F116, F117, F121, F122, F125, F126, F127** — every NYC Parks quotation
  I tested came back verbatim, including the Newtown Pippin adoption on December 31, 2013 and
  O'Connor's defence of Christopher Emanuel Balestrero behind Hitchcock's *The Wrong Man*.
- **F144** — the **Mary Sendek** holdout. Confirmed. Distinctive and safe.
- **F108** — the **Elmhurst + Woodhaven** portmanteau behind "Elmwood". Confirmed verbatim.
- **F165** — McDowell's / *Coming to America*, "cosmetically altered an existing Wendy's restaurant".
  Confirmed. ⚠ **The building was razed by December 2013. Write it as vanished, never as a
  destination.**
- **F138** — the Latino composition breakdown, Ecuadorean largest at 9.8%. ⚠ **Sourced to the same
  furmancenter elmhurst-corona page as F137. Treat as Elmhurst-and-Corona, not Elmhurst.**

**Unresolved source conflicts the author must NOT silently resolve** (all confirmed as genuine, both
sides re-read by me): F13/F11/F12 the 1656 transaction ("agreed to share" / "displaced" / "peaceful
purchase"); F15/F16 the origin of "Newtown"; F27's 1701/1702/1704; F38 vs F9/F10 (1640 Dutch vs 1652
English founding — **LPC carries both, in different reports**); **F40's renaming date — 1896
(LP-2131), 1896 (LP-2086), 1897 (Wikipedia), 1898 (NYC Parks)**; F44's internal contradiction on the
Middleburgh Triangle sign; F99's 1867/1868; F115's Newtown Pippin origin; F130's one-park-or-two;
F135's library cost; F141's square footage; F147's 7.5 vs 8 miles. **Where a date is contested, give
the range or attribute. Do not pick one and state it flatly.**

⚠ **F147 trap, confirmed:** Queens Boulevard's **16-lane maximum is at Yellowstone Boulevard in
Forest Hills**, not in Elmhurst. **Do not transplant it.** Wave 3 includes Forest Hills.

⚠ **F154/N17:** Wikipedia's own cited source for Elks Road and the 1930 Mathews flats is Forgotten
NY's article titled "**MASPETH, Queens**". **Uncertain. Attribute or omit.**

⚠ **F169 confirmed as structural, not a gap:** Elmhurst has **no waterfront** and **no museum**. Its
only water is the buried Horse Brook. Do not invent either. And Corona-adjacent fame does not
transfer across Junction Boulevard.

---

*End of verdicts. 171 claims adjudicated: 121 confirmed, 16 refuted, 34 uncertain. 33 places
publishable; 22 businesses address-only and barred from prose.*
