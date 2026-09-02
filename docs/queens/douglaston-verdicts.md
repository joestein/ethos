# Douglaston, Queens — VERIFIER verdicts (wave 5, Community District 11)

**Role: INDEPENDENT VERIFIER.** I re-fetched the finder's cited sources myself and re-quoted them.
Nothing below defers to the finder's reasoning. Where I re-quote, the words are from my own
retrieval, not from the dossier.

**Headline: 302 claims adjudicated (F1–F272, C1–C30) — 214 confirmed, 17 refuted, 71 uncertain.
≈47 places survive as publishable, of which 14 are DOHMH-only and may carry an address and nothing
else.**

The confirmation rate is high and I want to be plain about why, because a high rate is normally a
warning sign. It is high because the dossier's spine is **primary institutional text and city open
data** — two full LPC designation reports, Socrata datasets, PLUTO, Parks Properties, DCP NTA
geometry — and I could re-pull all of it byte-for-byte. Every single one of the ~90 LPC quotations
I probed came back verbatim, including the report's own errors and typography. The *uncertain*
bucket is large (71) and is where the real risk sits: it is almost entirely Wikipedia-only claims,
un-retested negative retrievals, and derived statistics I did not recompute.

---

## 1. THE MARQUEE RULING — ALLEY POND PARK

### 1.1 What I ran

I did not accept the finder's geometry. I re-pulled the DCP 2020 NTA polygons and the NYC Parks
Properties polygon for `Q001` and ran three independent tests.

**Test 1 — the instrument the corpus rules on.** Re-pulled from `9nt8-h7nd`:

```
QN1191 | Alley Pond Park              | ntatype 9 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
QN8191 | Flushing Meadows-Corona Park | ntatype 9 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | ntatype 9 | QN82 Forest Park (JIA 82 Approximation)
QN0191 | Astoria Park                 | ntatype 9 | QN01 Astoria-Queensbridge (CD 1 Equivalent)
```

**F31, F32 CONFIRMED, and they matter more than the finder allowed.** The wave-4 arbitration states
its own decisive instrument in terms: *"The decisive fact is not the sampling… It is the
instrument: `QN8191 … (JIA 81 Approximation)` / `QN8291 … (JIA 82 Approximation)`."*
**Alley Pond Park does not carry that device.** It carries `ntatype 9` inside a normal community
district CDTA — which is **the Astoria Park configuration**, and Astoria Park was *awarded* to
Astoria in wave 1. So `ntatype 9` alone is demonstrably not sufficient to void a park, and the
FMCP/Forest Park precedent does **not** transfer. The finder is right, against the brief's
expectation, and I confirm it independently.

**Test 2 — area sampling of the park's own polygon** (the test the three wave-4 verifiers ran on
Forest Park). 4,000 random points inside the Parks `Q001` MultiPolygon, tested against all Queens
NTAs:

| Landing NTA | points | share |
|---|---|---|
| `QN1191` Alley Pond Park | 3,210 | **80.2%** |
| `QN1102` **Bayside** | 307 | **7.7%** |
| `QN1103` **Douglaston-Little Neck** | 231 | **5.8%** |
| outside all NTAs (water / parkway) | 215 | 5.4% |
| `QN1302` Bellerose (**CD 13**) | 33 | 0.8% |
| `QN1104` Oakland Gardens-Hollis Hills | 4 | 0.1% |

**Bayside gets more of the park's area than Douglaston does.** Neither gets a fifth of it.

**Test 3 — shared boundary and the Bayside gap.** My own recomputation:

- `QN1102` ∩ `QN1103` shared vertices: **0**. Shared boundary: **0.0 m**.
- Minimum distance Bayside↔Douglaston: **29.72 m**, at **lon −73.7537704, lat 40.7653046** — Northern
  Boulevard at the Alley Creek crossing. Reciprocal identical. **F27 confirmed to the metre.**
- Alley Pond Park shares **4,621.5 m** of boundary with Douglaston-Little Neck and **2,929.9 m** with
  Bayside, out of a **14,642 m** perimeter. Barely half its edge touches either.

*(Minor refutation: the finder's vertex counts were 912 and 706; mine are 918 and 719. Rounding.
The substantive results — zero shared vertices, 29.7 m, the nearest-approach coordinate — match
exactly.)*

### 1.2 What the prose sources actually say

Re-quoted by me:

- **Wikipedia, Alley Pond Park** — `"The park is bordered to the east by Douglaston, to the west by
  Bayside, to the north by Little Neck Bay, and to the south by Union Turnpike."` **Bordered by, not
  in.** F29 CONFIRMED.
- **NYC Parks, Udalls Park Preserve historical sign** — `"These are the peninsulas of Great Neck,
  Bayside, and Douglaston that flank the pre-glacial river valley of Little Neck Bay and Udall's
  Cove."` The city's own sign treats Bayside and Douglaston as **two separate landforms**. F30
  CONFIRMED.
- **NYC Parks' own Alley Pond Park page** — I fetched it and counted: the strings "Douglaston" and
  "Bayside" appear **zero times**. The page gives `Zip Code: 11361, 11362, 11363, 11364, 11426`,
  `Community Board: 11, 13`, `Council Member: Vickie Paladino, Linda Lee`, `Park ID: Q001GROUP`,
  `Property Type: Park Group`. **NYC Parks does not place this park in any neighborhood.**
  F34 CONFIRMED verbatim, including the dataset/website community-board conflict (`411` vs `11, 13`)
  — and my Bellerose sample points independently vindicate the website's "13".
- **Parks dataset `enfh-gkve`, `Q001`** — `signname` `"Alley Pond Park"`, `acres` `"635.514"`,
  `typecategory` `"Flagship Park"`, `location` `"Little Neck Bay to Springfield Blvd, Union Tpke"`.
  F33 CONFIRMED verbatim. **There is no street address**, only a boundary string.

### 1.3 RULING

> ## ALLEY POND PARK BELONGS TO **NO NEIGHBORHOOD FILE**.
> Neither douglaston.json nor bayside.json creates an Alley Pond Park record.

**But it is important that the coordinator record the correct grounds, because the finder is right
that the wave-3/wave-4 reasoning does not reach this park.** Alley Pond Park is **not** a Jointly
Interested Area. If the ruling is written as "another JIA, like Forest Park," it is written on a
false premise and the next wave will inherit the error.

The grounds that do hold, each independently sufficient:

1. **DCP publishes it as its own place, not as part of one.** 80.2% of its own polygon falls in its
   own tabulation area. It is inside no residential NTA.
2. **It is not contained by any neighborhood — it separates two.** Bayside and Douglaston share
   *zero* boundary and never touch; the park is the entire reason. A place cannot belong to a
   neighborhood whose edge it defines from the outside.
3. **The residual splits the wrong way for Douglaston.** Bayside holds 7.7% of the park's area to
   Douglaston's 5.8%. Douglaston leads only on shared boundary (4,622 m to 2,930 m). The two
   instruments disagree, which is itself disqualifying — this is not the Astoria Park case, where
   one neighborhood wholly enclosed a 61-acre park. This is a 635-acre park across **five ZIPs and
   two community districts**.
4. **No source in evidence places it *in* either neighborhood.** Both sources that speak — Wikipedia
   and the city's own park sign — name it as *bordering* or *flanked by* both. NYC Parks names no
   neighborhood at all.
5. **It has no publishable street address.** Parks gives a boundary string only.

**If the coordinator overrides me and awards it, Douglaston has the better claim on shared boundary
and Bayside the better claim on area — and the author should be told the evidence is that close.**

**Consequential dependants, which follow the park and are therefore also NO FILE:**

- **Queens Giant (P41).** Wikipedia's coordinates 40°45′12″N 73°44′49″W are inside `QN1191`. I
  point-in-polygon tested them: `QN1191` only. F204 CONFIRMED verbatim, including
  `"133.8 feet (40.8 m) tall with a 19-foot (5.8 m) circumference as of 2004"` and
  `"between 350 and 450 years old in 2004"`. **F205 CONFIRMED and it is the more important quote:**
  `"NYC Parks is unsure of the margin of error regarding the Queens Giant's age… Some arborists
  estimate the tree's age at 250 years, making it younger than other trees in the city."`
  The Douglaston–Little Neck article's unhedged `"the oldest known tree (and living thing) in New
  York City"` is also confirmed as text — **and must not be used.** Prefer the hedge.
- **Windmill Pond, Cattail Pond (P51, P52)**, and the **LIRR viaduct over Alley Creek (P73)** —
  inside the park, no addresses.
- **Alley Pond Environmental Center (P49)** and **Alley Pond Golf Center / Knox Golf Academy (P53
  parcel, 232-01 Northern Blvd)** — see §2.3. Both land in `QN1191`.

---

## 2. NEIGHBORHOOD ASSIGNMENT — MY RULINGS

Method: I re-geocoded every address through DCP GeoSearch myself and re-ran point-in-polygon against
the NTA polygons I downloaded. I did not reuse the finder's numbers.

### 2.1 The Bayside line — no hazard here at all

**F28 CONFIRMED and I will state it more strongly than the finder did.** In city tabulation
geography Bayside and Douglaston are **not adjacent**. There is no shared frontage anywhere. The
brief's stated adjacency hazard between Bayside and Douglaston is, on the evidence, **absent**.
Control checks I ran: `45-06 215 Street` → GeoSearch `"45-06 215 STREET, Bayside, NY, USA"`, WOF
**Bayside**, NTA `QN1102`. The resolver separates them cleanly.

**The real hazard on this page is LITTLE NECK, and the finder is right to have inverted the brief's
warning.** I confirm the flip point exactly.

### 2.2 The Little Neck line — CONFIRMED to the house number

My own GeoSearch pulls, verbatim `label` and `neighbourhood`:

| Address | GeoSearch label | WOF | ZIP | NTA |
|---|---|---|---|---|
| 248-09 Northern Blvd | `248-09 NORTHERN BOULEVARD, Douglaston, NY, USA` | **Douglaston** | 11362 | QN1103 |
| 248-25 Northern Blvd | `248-25 NORTHERN BOULEVARD, Douglaston, NY, USA` | **Douglaston** | 11362 | QN1103 |
| 249-11 Northern Blvd | `249-11 NORTHERN BOULEVARD, Douglaston, NY, USA` | **Douglaston** | 11362 | QN1103 |
| 249-17 Northern Blvd | `249-17 NORTHERN BOULEVARD, Douglaston, NY, USA` | **Douglaston** | 11362 | QN1103 |
| **250-01 Northern Blvd** | `250-01 NORTHERN BOULEVARD, Little Neck, NY, USA` | **Little Neck** | 11362 | QN1103 |
| 250-10 Northern Blvd | `250-10 NORTHERN BOULEVARD, Little Neck, NY, USA` | **Little Neck** | 11362 | QN1103 |
| 253-24 Northern Blvd | `253-24 NORTHERN BOULEVARD, Little Neck, NY, USA` | **Little Neck** | 11362 | QN1103 |
| 255-13 Northern Blvd | `255-13 NORTHERN BOULEVARD, Little Neck, NY, USA` | **Little Neck** | 11362 | QN1103 |

**F39 CONFIRMED: the flip is between 249-17 and 250-01.** F40's non-monotonic Marathon Parkway result
CONFIRMED: `56-01 Marathon Parkway` → **Little Neck**, `57-04 Marathon Parkway` → **Douglaston**.
**F11 CONFIRMED and it is the most important methodological caveat on this page:** the NTA is a
single polygon named "Douglaston-Little Neck". Every one of the addresses above sits in `QN1103`.
**The NTA test cannot separate Douglaston from Little Neck. Only the WOF label can, and it is one
gazetteer's opinion, not a city boundary.** F41 CONFIRMED — Wikipedia's "east of Marathon Parkway"
rule and the WOF line disagree over the 248–249 block. **Record both; the author must not present
either as settled.**

**RULING on C9 (248-25 / 249-11 / 249-17 Northern Blvd, 7–8 food businesses):** WOF says Douglaston,
Wikipedia's rule says Little Neck. **Uncertain. Best evidenced is WOF, because it is address-level
and Wikipedia's rule is a generalisation the same article contradicts elsewhere (F14 vs F16).** If
the page uses them, it must not lean on them.

**RULING on C10 (250-01 → 255-13 Northern Blvd, 30+ businesses including IL BACCO):**
**LITTLE NECK. Outside this corpus.** I re-geocoded `253-24 Northern Boulevard` → `Little Neck`.
**Il Bacco is a Little Neck restaurant and douglaston.json must not name it.** This is the single
highest-risk leak on the page and I confirm the finder's flag.

**RULING on C11, C12 (both post offices):** `56-01 Marathon Parkway` → **Little Neck**;
`250-10 Northern Boulevard` → **Little Neck**. **Neither is Douglaston. There is no Douglaston post
office in evidence.** F-confirmed.

**RULING on C13 (QPL Douglaston/Little Neck branch, 249-01 Northern Blvd):** I geocoded it —
`249-01 NORTHERN BOULEVARD, Douglaston, NY, USA`, WOF **Douglaston**, ZIP 11362, NTA `QN1103`.
**Douglaston, but the branch is named for both.** Publishable with that caveat.
**C14 (QPL North Hills branch, 57-04 Marathon Pkwy):** WOF **Douglaston**. Publishable.

**RULING on C16–C19 (Little Neck Theater; the Memorial Day parade; the ambulance corps; DLNHS):**
**All shared, none exclusively Douglaston's.** I confirmed the parade organisation's own name from
its own site: `"Little Neck - Douglaston Memorial Day Parade Organization, Inc."` — Little Neck
first. Wikipedia's route `"runs from Great Neck to Douglaston Parkway along Northern Boulevard"` —
**it starts in Nassau County.** DLNHS's own site gives its mailing address as
`"Douglaston and Little Neck Historical Society, Inc. PO Box 630142 Little Neck, NY 11363"`.
**No source anywhere in my retrieval calls this parade the largest in the country. The author must
not write that.**

**RULING on C21 (Saddle Rock Mill):** **NASSAU COUNTY. Outside the corpus.** Re-quoted from the NYC
Parks sign: `"The mill, now called the Saddle Rock Mill, remained in the Udall family until 1950,
when it was donated to the Nassau County Historical Society."` **Do not claim it.**

**RULING on C24, C25, C26, C27, C28:** all **outside Douglaston**, confirmed.
Wikipedia verbatim on Cardozo: `"zoned for Benjamin N. Cardozo High School, in neighboring
Bayside."` The 111th Precinct house at 45-06 215th Street geocodes **Bayside** — it *serves*
Douglaston but is *in* Bayside. Bellcourt is Bayside's and Westmoreland is Little Neck's; LP-1957's
sentence naming all of Rickert-Finlay's tracts together is the trap, and I re-quote it so the author
sees the boundary inside it: `"Their projects included Norwood in Long Island City,
Broadway-Flushing in Flushing, Bellcourt in Bayside, Douglas Manor in Douglaston, and Westmoreland
in Little Neck."`

### 2.3 Places I rule inside DOUGLASTON, with exact addresses

Every row below: I geocoded it, I read the WOF label, I ran point-in-polygon, and where a landmark
is involved I cross-checked LPC's own dataset and PLUTO. All are `QN1103`.

| Place | **Exact publishable address** | WOF | Corroboration |
|---|---|---|---|
| Cornelius Van Wyck House | **126 West Drive aka 37-04 Douglaston Parkway, Douglaston, NY 11363** | Douglaston | LPC `buis-pvji` BBL `4080560062`; PLUTO `yearbuilt` **1735** |
| Benjamin P. Allen House / Allen-Beville House | **29 Center Drive, Douglaston, NY 11363** (PLUTO current: 236-12 Center Drive) | — see warning | LPC BBL `4080640076`; PLUTO `yearbuilt` **1850**, ZIP **11363** |
| Wynant Van Zandt House / Douglaston Club | **600 West Drive, Douglaston, NY 11363** | Douglaston | PLUTO `ownername` `"DOUGLASTON CLUB INC"` |
| Zion Episcopal Church | **243-20 Church Street, Douglaston, NY 11363** (mailing 243-01 Northern Blvd) | Douglaston | PLUTO `"ZION EPISCOPAL CHURCH"`; church's own site |
| Zion rectory | **242-02 44th Avenue, Douglaston, NY 11363** | Douglaston | LP-2155 |
| Site of the Great White Oak | **233 Arleigh Road, Douglaston, NY 11363** | Douglaston | LP-1957 |
| Alfred Scheffer's own house | **216 Beverly Road, Douglaston, NY 11363** | Douglaston | LP-1957 |
| Buchman & Fox mansion | **1008 Shore Road, Douglaston, NY 11363** | Douglaston | LP-1957 |
| Udalls Park Preserve | Northern Blvd., 244 St. to 247 St., Douglas Rd., Little Neck Bay — **no street address** | — | Parks `Q452`, 44.44 ac, CB 411 |
| Catharine Turner Richardson Park | Douglaston Pkwy., Prospect Ave. bet. Poplar St. and Pine St. — **no street address** | — | Parks `Q059`, 0.101 ac, ZIP 11363 |
| Douglaston Park Golf Course clubhouse | **63-20 Marathon Parkway, Douglaston, NY 11362** | Douglaston | PLUTO NYC Parks, `yearbuilt` **1927** |
| Douglaston station (LIRR) | **235th Street and 41st Avenue, Douglaston, NY 11363** | Douglaston | Wikipedia only — see §4 |
| National Art League | **44-21 Douglaston Parkway, Douglaston, NY 11363** | Douglaston | Its own site + PLUTO `"NATIONAL ART LEAGUE"` |
| Immaculate Conception Center | **72-45 Douglaston Parkway, Douglaston, NY 11362** | Douglaston | Its own site + PLUTO `"ROCKLYN ECCLESIASTICAL CORP."` |
| Douglaston Plaza | **242-02 61st Avenue, Douglaston, NY 11362** | Douglaston | PLUTO `"DOUGLASTON SHOPPING CENTER OWNER LLC"` |
| FDNY Engine 313 / Ladder 164 | **44-01 244th Street, Douglaston, NY 11363** | Douglaston | Wikipedia + geocode |

Plus the individually addressed houses in the two historic districts (P4–P9, P13–P31), all of which
I accept on LP-1957 / LP-2155 authority — see §3.

**RULING on C4 (Douglaston Park Golf Course):** **SPLIT, confirmed by my own geocoding.**
`63-20 Marathon Parkway` → WOF **Douglaston**, NTA `QN1103`. `6710 Douglaston Parkway` →
`"6710 DOUGLASTON PARKWAY, Alley Pond Park, NY, USA"`, WOF **Alley Pond Park**, NTA `QN1191`.
**Award the clubhouse end (63-20 Marathon Parkway) to Douglaston; the page must not describe the
whole 104.6-acre property as Douglaston's.** Parks gives `communityboard` `411`, ZIP `11362`.

**RULING on C2 (Alley Pond Environmental Center, 229-10 Northern Blvd):** **NOT DOUGLASTON.**
My geocode returns `"229-10 NORTHERN BOULEVARD, Alley Pond Park, NY, USA"`, WOF **Alley Pond Park**,
ZIP **11363**, BBL `4075700001`, NTA `QN1191`. The only Douglaston claim is APEC's own line, which I
re-quote from its live site: `"Click here to learn more and visit our center at 229-10 Northern
Boulevard, Douglaston, NY 11362!"` — **and that self-description carries the wrong ZIP** (11362; the
city returns 11363 for that parcel). A self-published address with a demonstrable error in it is not
strong enough to override two city instruments. **APEC follows Alley Pond Park: no file.**

**RULING on C3 (Alley Pond Golf Center / 232-01 Northern Blvd):** WOF says **Douglaston** but NTA
says **`QN1191`** — I reproduced both. The parcel is city parkland. **Follows Alley Pond Park: no
file.** The DOHMH entity there, `KNOX GOLF ACADEMY`, has never been inspected (see §5).

**RULING on C5, C6, C7, C8 (Udalls Cove, the Ravine, Gabler's Creek, Aurora Pond, Virginia Point):**
**Udalls Park Preserve is Douglaston's** — Parks `Q452`, ZIP 11363, CB 411, and the preserve's
`location` string runs to Douglas Road. **But the Cove itself is shared and partly in Nassau
County**, and I re-quote UCPC's own words, which are decisive against any exclusive claim:
`"Udalls Cove is an inlet of Little Neck Bay… between the Douglaston and Great Neck peninsulas."`
and, of the Ravine, `"a deep wooded gully that lies between Little Neck and Douglaston."`
and `"Much of the area has been acquired by New York State and City, and the Village of Great Neck
Estates."` **Virginia Point is at the northern end of Little Neck Parkway — Little Neck.**
**Aurora Pond and the Ravine are shared by the source's own words and must be written as shared.**

**RULING on C22 (Douglaston Manor Windmill):** the object no longer exists; the 2005 replica stands
on the APEC parcel, which is `QN1191`. **No Douglaston record.** The origin claim may be narrated in
past tense only, and only if the author accepts a source I judge unusable — see §4.

**RULING on C29 (Zion Episcopal Church district membership):** **F83 CONFIRMED, and it is the
sharpest factual trap on the page.** I re-quote all four LPC statements from my own extractions:
- LP-2155 fn 7 and LP-1957 fn 3, identically: `"Zion Church is located outside the historic
  district."`
- LP-2155, on 240-45: `"...the nearly identical rectory of the nearby Zion Episcopal Church, located
  at 242-02 44th A venue (not in the historic district)."` *(the PDF renders "Avenue" as "A venue")*
- LP-2155, on Grantham: `"...included the new Zion Episcopal Church in 1924-25 (not located inside
  the historic district)."`
Against which Wikipedia's NRHP summary: `"It includes 83 contributing buildings and two contributing
sites. The buildings include Zion Episcopal Church (1830)…"`
**RULING: the church is inside the NATIONAL REGISTER Douglaston Hill district and outside the NEW
YORK CITY Douglaston Hill district. Both are true of different districts. Any sentence naming the
church and the district in the same breath MUST say which district.** Better evidenced: the LPC
exclusion, because LPC says it three times in its own designation reports and the NRHP claim reaches
me only through Wikipedia (the NRHP nomination text is not in evidence — F2).

---

## 3. THE DESIGNATION REPORTS — I RE-READ BOTH IN FULL

I downloaded both PDFs and extracted the text myself.

- **LP-2155**, `http://s-media.nyc.gov/agencies/lpc/lp/2155.pdf` — **33,348,309 bytes**, exactly as
  the finder reported. **F9 CONFIRMED.**
- **LP-1957**, `http://s-media.nyc.gov/agencies/lpc/lp/1957.pdf` — **169.7 MB**. **F8 CONFIRMED.**

**I probed ~90 of the finder's LPC quotations against my own extractions. Every one came back
verbatim.** This is the strongest part of the dossier by a wide margin and the author may rely on it.
Confirmed verbatim, among others: F20, F21, F22, F24, F46, F47, F48, F52, F53, F55, F56, F61, F62,
F64, F65, F67, F68, F70, F72, F74, F75, F78, F79, F80, F81, F83, F84, F87, F88, F89, F90, F91, F93,
F94, F95, F96, F97, F98, F102, F103, F104, F105, F106, F107, F109, F110, F111, F114, F115, F116,
F117, F119, F120, F123, F126, F127, F128, F129, F130, F133, F134, F135, F136, F137, F138, F140,
F142, F143, F145, F150, F151, F152, F153, F157, F158, F160, F161, F164, F166, F173, F177, F188,
F193, F194, F241, F242.

**Including the report's own errors, which I confirm are the report's and not the finder's:**

- **F23 CONFIRMED — do not quote this sentence.** LP-1957 really does say
  `"Douglaston's location on a peninsula jutting into Flushing Bay at the eastern border of Queens
  County…"` — one paragraph after saying the peninsula extends into **Little Neck Bay**. The error is
  the Commission's. The finder's instruction to suppress it is correct.
- **F80 CONFIRMED including the typography.** The PDF's own text layer reads `"tum-of-the-century"`.
  It is the rendering of "turn". The author may print "turn-of-the-century" but must not present
  "tum" as a quotation.
- **F85 CONFIRMED including `"43rct"`** — the PDF's rendering of superscript "rd". Same rule.
- **F91 CONFIRMED — the two reports genuinely contradict each other.** LP-2155 (2004):
  `"Van Beuren sold it in 1843 to Jeremiah Lambertson, a local farmer, who held the property until
  1853, when he laid it out in an urban grid, named the subdivision Marathon, and sold the lots at
  auction."` LP-1957 (1997): `"William Douglas apparently attempted a suburban subdivision half a
  century earlier south of Douglas Manor… He named a number of new streets after the abundant trees
  on his property (Pine, Poplar, Willow, Cherry)."` **Two LPC reports, two different people credited
  with laying out Douglaston Hill and naming its streets. Record both, resolve neither — the finder
  is right.**
- **F107 CONFIRMED — the report is internally inconsistent about Denis O'Leary.** The essay lists
  `"Assistant Corporation Counsel for New York City, Public Works Commissioner, Queens District
  Attorney, and United States Congressman"`; the Summary omits Queens District Attorney. Both are in
  the report I extracted.

**The two scanned reports.** I downloaded and extracted LP-0944 (1977) and LP-0144 (1966) myself.

- **F178 CONFIRMED exactly.** LP-0944's header OCRs as
  `"Landmarf(s Pre~ervatton Ccmm1s$fon Januat-y 11, 1971, !'Sumber 4 LP ...094·lf"` while its body
  says `"On November g, 1976, tho Landmarr,s Pres~rvatlon Commission held a publte hearfng"` and the
  LPC dataset gives `1/11/1977`. **The designation date is 11 January 1977.**
- **F168 CONFIRMED verbatim, corruption and all:** `"At that time no speakers appeared to testifY.
  The Commission continued the public hearing until February 8, 1966 (Item No. 45). At that time
  four epeale rs spoke in favor of designation, including the representative of the O'k1ler .. of
  the building."` My extraction adds a clean sentence the finder did not record:
  **`"There were no speakers in opposition to designation at either meeting."`**
- **F169, F170, F179, F180, F181, F182, F184, F186 CONFIRMED verbatim.**
- **F71 — REFUTED IN ITS HEDGE, and this matters.** The finder wrote that the "1876" for *Sappho*
  `"may be an OCR corruption."` It is not. My extraction reads
  `"Wflllam P. Douglas attained national stature when htG yacht "Sappho11 successfully defeated
  Brtttsh challengers in 1876 and wen what has $lnce become the Amerrca Cup."` The digits are clean;
  the surrounding letters are the corrupt part. **1876 is the 1977 report's own printed text, and it
  is wrong — *Sappho* defended in 1871. This is a factual error by the Landmarks Preservation
  Commission. The author must not print the year at all.**
- **F60 CONFIRMED verbatim**, including `"the Matfnfeoc tndfans of the Five Natfons"`. The finder is
  right that this is historically contested and unsupported by any other source; LP-2155 places the
  Matinecock among `"the Munsee-speaking groups of western Long Island."` **Do not print "Five
  Nations."** I also found a **third** founding date for Flushing in LP-0944:
  `"VUss1ngem chartered in 16lfS by GC>ftrnor Kieft"` — i.e. **1645**, against LP-2155's **1643** and
  matching the Parks sign's **1645**.
- **F10 REFUTED IN PART.** The finder says both scans "OCR badly." LP-0944 does. **LP-0144 does
  not** — its title block, hearing paragraph and full architectural description all extracted
  cleanly in my copy. `"CORNELIUS VANWYCK HOUSE, 37-04 Douglaston Parkway (126 West Drive),
  Douglaston, Borough of Queens. Built about 1735, architect unknown. Landmark Site: Borough of
  Queens Tax Map Block 8056, Lot 62."` The author may quote LP-0144's description passage directly.

---

## 4. THE OPEN DATA — RECOMPUTED, AND ONE REAL ERROR FOUND

**Confirmed exactly by my own queries:** F25, F26 (substance), F27, F31, F32, F33, F34, F36, F38,
F39, F45, F77, F82, F118, F123, F137, F165, F176, F189, F191, F207, F232, F234, F235, F236, F237,
F249, F250, F263.

Highlights I re-pulled:

- **F165 CONFIRMED.** `buis-pvji` filtered `borough='QN' AND cd='411'` returns **exactly six**
  individual landmarks. **Exactly two are in Douglaston: Cornelius Van Wyck House (37-04 Douglaston
  Parkway) and Benjamin P. Allen House (29 Center Drive).** The other four — Ahles House, Hawthorne
  Court, Lawrence Graveyard, 35-34 Bell Boulevard — are Bayside's. **Any claim of a third Douglaston
  individual landmark is wrong.**
- **F77 CONFIRMED including the dataset's self-contradiction.** `skyk-mpzq` really does give the
  Douglaston Hill **Amendment** `desdate` `2007-01-30` *before* its `caldate` `2007-04-03`. And the
  **base LP-2155 district is genuinely absent from the dataset** — only `LP-01957` (Douglaston HD)
  and `LP-02255` (the Amendment) are present. The finder is right.
- **F82 / F123 CONFIRMED.** My counts: `gpmc-yuvp` → Douglaston HD **939**, Douglaston Hill HD **55**
  + Amendment **2** = **57**. PLUTO → Douglaston Hill **31** + Amendment **1** = **32**; Douglaston
  HD **638** *(finder said 636 — minor refutation, PLUTO version drift)*. Against LP-1957's
  `"more than 600 houses"` / `"over 600 houses and some 150 related structures"`, LP-2155's
  **thirty-one**, and Wikipedia's NRHP **631** and **83**. **All these numbers are real and they
  count different things. The author must say which.**
- **F176 CONFIRMED exactly.** 5,583 PLUTO lots in ZIPs 11362/11363; exactly **five** with
  `yearbuilt` before 1900: 1735 (126 West Drive), 1850 (221 Arleigh Road), 1850 (236-12 Center
  Drive), 1850 (240-02 Poplar Street), 1870 (231 Manor Road). **126 West Drive is the oldest by 115
  years.** Owner `"VAN WYCK HOUSE, LLC"`, `unitsres` 1. **A privately owned single-family house.
  There is no evidence it is open to the public and the page must not imply a visit.**
- **F189 CONFIRMED.** 600 West Drive: `"DOUGLASTON CLUB INC"`, `bldgclass` `Q9`, `yearbuilt`
  **1931**, **no landmark flag**. Against LP-1957's 1819-with-post-1906-alterations. **F188
  CONFIRMED: the Douglaston Club building is a contributing building in the historic district, NOT
  an individual landmark.**
- **F111 CONFIRMED.** PLUTO gives 240-27 Depew Avenue `yearbuilt` **2020**, flatly contradicting
  LP-2155's possible-pre-1853 oysterman's cottage. **Do not trust PLUTO's year on this lot.**
- **F234 CONFIRMED.** 6320 Marathon Parkway, NYC Parks, `yearbuilt` **1927** — independently
  corroborating Wikipedia's opening date. `lotarea` **2,178,000 sq ft = exactly 50.0 acres**, against
  the Parks property's 104.6 acres.

### 4.1 REFUTED — the Allen-Beville House geocode

**F177's derived geocode is WRONG, and the finder's own instinct about it was right for the wrong
reason.** The finder reported `29 Center Drive` → BBL `4080220075`, ZIP `11360`, and dismissed the
ZIP as `"a geocoder artifact."` It is not an artifact. I reproduced the geocode —
`"29-29 CENTRE DRIVE, Douglaston, NY, USA"`, BBL `4080220075` — and then looked that BBL up in
PLUTO. **It is a different parcel entirely:** address `30 AVENUE`, ZIP `11360`, `bldgclass` `V0`
(vacant land), owner `"DOUGLAS MANOR ASSOCIATION"`. **GeoSearch resolved the landmark to a vacant
lot.** And `236-12 Center Drive` geocodes worse still — to `"12 CENTRE DRIVE, Whitestone, NY, USA"`,
BBL `4044420017`, ZIP 11357.

The correct identifiers, from LPC's own landmark dataset and PLUTO, which agree, and from the 1977
report's own header (`"Tar. Map 81()ek 8061t, t.ot 76"` = Block 8064, Lot 76):

> **Benjamin P. Allen House / Allen-Beville House — BBL 4080640076, PLUTO address
> `236-12 CENTER DRIVE`, ZIP `11363`, `yearbuilt` 1850, owner `"MENGLER, CHRISTOPHER"`,
> `unitsres` 1, `landmark` `"INDIVIDUAL LANDMARK"`, `histdist` `"Douglaston Historic District"`.**

**AUTHOR WARNING: publish the address as "29 Center Drive, Douglaston, NY 11363" (LPC's own
designation address) or "236-12 Center Drive" (PLUTO's current address). NEVER publish ZIP 11360 —
that is Bay Terrace. Do not run this address through GeoSearch and trust the answer.**
The house is **privately owned and occupied. Not a museum. No visit.**

---

## 5. THE DOHMH-ONLY RULING — CONFIRMED, AND WORSE THAN THE DOSSIER SAYS

I re-pulled `43nn-pn8j` for ZIPs 11362 and 11363 myself: **689 inspection rows resolving to 77
unique `camis` establishments** — matching F249 exactly.

> **RULING, applying to every food business on this page: for each of the businesses below the ONLY
> source is the DOHMH inspection dataset. Their EXISTENCE and ADDRESS may be published. NOTHING
> about them may appear in prose.** No adjective, no history, no "beloved", "long-running",
> "popular", "family-run", no cuisine characterisation beyond the bare dataset code, and no claim
> that they are open. DOHMH records that a permit existed at an address on a date and what code an
> inspector typed. It establishes nothing else.

**Douglaston-assigned, DOHMH-only (14):** `IL SAPORE ITALIANO PIZZERIA` (44-17 Douglaston Pkwy);
`DOUGLASTON DELI` (44-23); `IVORY KITCHEN` (44-25); `BEST GARDEN CHINESE RESTAURANT` **and** `NEW
BEST GARDEN CHINESE RESTAURANT INC` (44-35, **two `camis`, i.e. a permit change — not one continuous
business**); `K KIMCHI` (44-37); `EL PASO` (40-45 235 St); `IL TOSCANO RISTORANTE` (42-05 235 St);
`PICCIOTTO` (42-34 235 St); `MIZUMI` (231-10 Northern Blvd); `NAMI SUSHI` (242-03); `AEGEA WEST`
(242-05); `NANA'S WONDERLAND` (45-07 248 St); `ROKSTAR CHICKEN` (242-02 61 Ave, a Douglaston Plaza
tenant); `DOUGLASTON MANOR` (63-20 Commonwealth Blvd).

**Two adverse findings the dossier does not carry, which I found by pulling inspection dates:**

1. **Nine of the 77 establishments carry `inspection_date` `1900-01-01` — DOHMH's placeholder for a
   permit with NO completed inspection.** Among them: **`KNOX GOLF ACADEMY`** (232-01 Northern Blvd),
   **`IVORY KITCHEN`** (44-25 Douglaston Pkwy), **`PICCIOTTO`** (42-34 235 St), **`NEW BEST GARDEN`**
   (44-35 Douglaston Pkwy), plus `BOSTON MARKET`, `JIN XI 99 INC`, `LIMA 33 RESTAURANT INC`, a second
   `CARVEL` and a second `GONG CHA`. **For these, DOHMH has not even inspected. The record is a bare
   permit. They are the weakest entries in the whole dossier.**
2. **Several records are badly stale.** `DOUGLASTON CLUB`, 600 West Drive — **last inspection
   2019-11-20**, over six years old. `DOUGLASTON MANOR`, 63-20 Commonwealth Blvd — **2022-12-03**.
   `IL TOSCANO RISTORANTE` — **2024-10-11**. **F191's caution is right and should be sharpened: the
   DOHMH row for the Douglaston Club is six years stale and is not evidence that anyone may eat
   there. It is a private club.**

**Two further findings:**

- **`DOUGLASTON MANOR` (63-20 Commonwealth Boulevard) geocodes to BBL `4083100125` — the SAME BBL as
  `63-20 Marathon Parkway`, the municipal golf course clubhouse.** It appears to be an operation on
  the golf course parcel rather than an independent venue. I mark this **uncertain** — the inference
  is mine and no source states it — but the author must not present "Douglaston Manor" as a separate
  Douglaston institution. **C30's name-collision warning is CONFIRMED and now has a fourth sense.**
- **F249 REFUTED on a small internal point:** it promises `"Three exceptions"` with a second source
  and then supplies only two (Douglaston Club, Douglaston GC). Rokstar Chicken is DOHMH-only.

**F251 REFUTED on its numbers.** My recount of cuisine codes across all 77: **Chinese 17** (not 13),
**None 9** (omitted by the finder), **Korean 6** (not 7), **American 6** (omitted), **Pizza 5** (not
4), **Japanese 5**, **Coffee/Tea 5** (not 4). The finder's qualitative point survives and I endorse
its warning: **this cuisine profile describes the Little Neck end of Northern Boulevard, not
Douglaston.** A food paragraph built from these codes would be writing about Little Neck.

**F250 REFUTED on one detail:** `FERN & AURORA DESSERT SHOP` at 39-02 Little Neck Parkway is ZIP
**11363**, not 11362. Its Little Neck assignment stands.

---

## 6. SINGLE-SOURCED CLAIMS — WHAT MAY AND MAY NOT SHIP

**F1's core disclosure is the most important sentence in the dossier and I endorse it: THERE IS NO
PRESS REPORTING IN EVIDENCE.** No QNS, no Queens Chronicle, no TimesLedger, no *Little Neck Ledger*,
no *New York Times*. I did not attempt to repair this. **Every "locals say", "known for", "beloved",
"famous for", "a favourite" sentence has zero support and must not be written.**

**F2 UNCERTAIN — I did not retest the NRHP PDFs.** Treat the finding as standing: **no NRHP
nomination text is in evidence.** Every "NRHP" fact on this page reaches the author through
Wikipedia. It must be attributed that way, and the 83 / 631 contributing-building counts must never
be presented as if read from a nomination.

**F6 UNCERTAIN — I did not retest mta.info.** **All bus route numbers (Q12, Q30, Q36, QM5, QM8,
QM35, n20G, n20X) remain Wikipedia-only.** I confirm the Wikipedia sentence exists verbatim. **My
recommendation: do not print route numbers.** They change, and a wrong one is a reader stranded.

**F7 UNCERTAIN.** Both library addresses are Wikipedia-only; I confirmed both geocode to Douglaston,
which corroborates the addresses without corroborating the branches.

**F4 CONFIRMED by my own attempt:** `douglastonclub.org` fails with an SSL protocol error on both
schemes. **There is no citable Douglaston Club website.** Everything about the Club is LP-1957,
PLUTO, or Wikipedia.

**May ship with attribution** (single-sourced but from a competent, self-interested-but-checkable
source, and I re-quoted each from the live site):

- **Udalls Cove Preservation Committee** — Aurora Gareiss, the 1970 Earth Day gathering, Gabler's
  Creek, the Ravine, Aurora Pond, the wildlife list, the pre-1950s history. Attribute as "the Udalls
  Cove Preservation Committee says". **F212 CONFIRMED verbatim, and it is the best human story on
  the page:** `"Then one woman said, 'Enough.' Aurora Gareiss, a feisty, middle-aged Douglaston
  resident whose home looked out on Udalls Cove, determined that what was left of the wetlands and
  woods around the Cove should be conserved."` **She is explicitly a Douglaston resident, by the
  organisation she founded.** F213, F214, F215, F216, F217, F218 all CONFIRMED verbatim.
- **NYC Parks' Udalls Park Preserve historical sign** — F30, F44, F51, F59, F99, F209, F210, F211 all
  CONFIRMED verbatim. Attribute as "NYC Parks". The glacial-boulder legend (F209) is excellent
  material and is the city's own text.
- **Zion Episcopal Church's own site** — F192 CONFIRMED verbatim including
  `"Church Address: 24320 Church St. Douglaston, NY 11363"` and `"Mailing Address: 243-01 Northern
  Blvd."`
- **National Art League's own site** — F/P74 CONFIRMED verbatim including the address, the phone
  `718-224-3957`, and `"95th Annual Online Juried Open Exhibition"`. **The finder's arithmetic
  inference to a c.1931 founding is NOT a fact and I refuse to confirm it. No founding date is in
  evidence. Do not print one.**
- **Immaculate Conception Center's own site** — P77 CONFIRMED verbatim, including `"over 80 acres"`
  against PLUTO's 27.5-acre tax lot. Unresolved; print neither as fact, or print both.
- **DLNHS's own site** — P75 CONFIRMED verbatim, including the photo captions and the fact that
  **Northern Boulevard was formerly Broadway**, which is genuinely useful and comes from the local
  society itself.

**Ships only as "Wikipedia says", or better, not at all:**

- **F243, the 1962 station house by Allan Gordon Lorimer.** CONFIRMED as Wikipedia text. It is the
  best modern-architecture item on the page **and it has exactly one source, with no MTA
  corroboration.** Attribute explicitly or drop it.
- **F225, APEC's 1972 founding by Joan and Hy Rosner.** CONFIRMED as Wikipedia text. **APEC's own
  "Mission & History" page served no founding narrative — I checked.** Single-sourced. And APEC is
  outside this file anyway (§2.3).
- **F265, the notable-residents list.** CONFIRMED verbatim — Merton, Tenet, Ginger Rogers, Angela
  Lansbury, the McEnroes, Jean Nidetch, George Grosz and the rest are all in the article.
  **But the list is for "Douglaston–Little Neck" and Wikipedia gives NO address for ANY of them.**
  **RULING: the page may not claim any individual as a Douglaston resident.** The finder's suggested
  cross-check — the DLNHS "Thomas Van Riper Celebrity Map" PDF — I did not retrieve either.
  **UNCERTAIN. Do not build a "famous residents" section.**
- **F272, "the last stop on the Underground Railroad until 1865."** CONFIRMED as Wikipedia text, and
  I confirm it is **about Little Neck, bare, unelaborated and uncorroborated by anything else in my
  retrieval. Doubly out: wrong neighborhood and unverified. Do not print it.**
- **F271, the *Great Gatsby* line.** CONFIRMED as text: the claim is about the **rail line**, not
  about Douglaston. **Do not upgrade it.** Fitzgerald's settings are Nassau County.

**Do not use at all:**

- **F228 — the Douglaston Manor Windmill article.** I read it in full and I confirm every
  contradiction the finder catalogued: `"built in Little Neck"` versus `"originally situated on
  Arleigh Road in Douglaston"`; `"In 1876, Douglas' son, William, generously donated a station
  building"` against every other source's 1866/1867; `"Thirty years later, William developed a
  private community known as Douglaston Manor, which now comprises 570 homes"` against LP-1957's
  Rickert-Finlay and 600+; and a present-tense sentence about a 1990s designation campaign.
  **RULING: this article is not a usable source. Nothing on this page should rest on it.**
- **F172 CONFIRMED as an error in its source:** Wikipedia's Van Wyck article really says
  `"Upon George Van Zandt's death, his son William inherited the property."` **There was no George
  Van Zandt.** Do not reuse.
- **F223 CONFIRMED as garbled:** `"off Little Neck Bay between Douglaston and Little Neck Bay."`
  **Do not quote.**
- **F175 CONFIRMED as unattributed:** Wikipedia's `"most impressive architectural remnant of the
  early Dutch Culture"` names no source. Treat as unsourced.
- **F185 CONFIRMED as text, UNCONFIRMED as fact.** Wikipedia's 1917 clubhouse fire appears in no LPC
  source I read. LP-2155's only fire is **Zion Church, 1924**. **Do not conflate. Do not print the
  1917 fire.**

---

## 7. THINGS THE AUTHOR MUST BE WARNED ABOUT

1. **ALLEY POND PARK GETS NO RECORD** — but not because it is a JIA. It is not one. See §1.3 for the
   grounds that actually hold. Do not write the ruling on the Forest Park premise.
2. **The Queens Giant, Windmill Pond, Cattail Pond, APEC and the Alley Pond Golf Center all follow
   the park and get no record either.**
3. **NEVER publish ZIP 11360 for the Allen-Beville House.** GeoSearch resolves both of its addresses
   to the wrong parcel. Use `29 Center Drive, Douglaston, NY 11363` or `236-12 Center Drive`. §4.1.
4. **Zion Episcopal Church: say WHICH district.** In the NRHP one, out of the LPC one. §2.3.
5. **Both individual landmarks are private homes.** 126 West Drive is a single-family residence owned
   by an LLC; 236-12 Center Drive is a single-family residence in private hands. **Neither is a
   museum. The Douglaston Club is private. The Douglas Manor shorefront is privately held in common
   by the Douglas Manor Association — it is not public parkland.** Do not write a visit into any of
   them. The unambiguously public destinations are: **Udalls Park Preserve, Catharine Turner
   Richardson Park, Douglaston Park Golf Course, the National Art League gallery, and the streets of
   the two historic districts.**
6. **Every address in LP-2155 is a pre-2012 address.** 43rd Avenue is Pine Street; 42nd Avenue is
   Poplar Street; 240th Street is Prospect Avenue; Willow Street became Depew Avenue. **F92's
   substance is confirmed by PLUTO's current addresses, though the 2012 renaming itself is
   Wikipedia-only.** Print current names, or print both.
7. **IL BACCO IS IN LITTLE NECK.** So are the thirty-plus businesses from 250-01 Northern Boulevard
   eastward, both post offices, the local newspaper, the theatre, and the historical society's
   mailbox. **The commercial heart of the strip is not Douglaston's.**
8. **Do not manufacture a Flushing tie.** I confirm the finder's finding: Flushing appears in this
   corpus only in its seventeenth-century sense — Vlissingen, the town that contained the Alley Pond
   settlement — plus Samuel Parsons's nursery and Rickert-Finlay's Broadway-Flushing tract.
   **No modern Flushing connection exists in any source I retrieved.**
9. **Flushing Meadows-Corona Park and the eight `Ethos.Seeds.CitiFieldPlaces` holdings appear NOWHERE
   in this dossier and I found no trace of them in any source I fetched.** Douglaston is about six
   miles from Citi Field. **There is no routing sentence to write here and no temptation to resist.**
   Do not add a `/g/citi-field-guide` link to this page merely because the wave brief mentions one;
   nothing on this page warrants it.
10. **Do not average the acreages or the building counts.** Alley Pond Park: 635.514 / 635 / 655.3.
    Udalls Cove: 44.44 / 90 / 100. Douglas's purchase: 240 / 120 / 180 / 175. Douglaston HD: 600+ /
    631 / 638 / 939. Douglaston Hill HD: 31 / 32 / 57 / 83. **All confirmed as real, all counting
    different things. Say which, or say neither.**
11. **The Great White Oak was cut down in 2009.** A present-tense sentence about it is false.
12. **No claim about the Memorial Day parade's size is in evidence.** I looked; there is none.
13. **Do not print the *Sappho* year.** LPC's own 1977 report says 1876 and is wrong. §3.
14. **Do not print "Five Nations"** for the Matinecock. §3.
15. **Spelling is unsettled and the author must pick one and stay consistent, noting the variation:**
    Matinicoc / Matinecoc / Matinecock / Mattinecock; Wynant / Wyant / Winant Van Zandt; Madnan's
    Neck / Little Madman's Neck / Madnan Neck. All confirmed as genuinely present across the sources.

---

## 8. COUNTS

| | |
|---|---|
| **Claims adjudicated (F1–F272, C1–C30)** | **302** |
| **Confirmed** | **214** |
| **Refuted** | **17** |
| **Uncertain** | **71** |
| **Places surviving as publishable** | **≈47** |
| — of which DOHMH-only (address may be published, **no prose**) | **14** |
| — of which have no street address, only a boundary string | **6** |
| Places ruled OUT of douglaston.json | **Alley Pond Park, the Queens Giant, APEC, the Alley Pond Golf Center, Windmill Pond, Cattail Pond, the Alley Creek viaduct, the Douglaston Manor Windmill, Il Bacco and the 30+ businesses east of 250-01 Northern Blvd, both post offices, the Little Neck Theater, Virginia Point, the Saddle Rock Mill, Cardozo High School, the 111th Precinct house, Fort Totten, Bellcourt, Westmoreland, Crocheron Park, John Golden Park, Raymond O'Connor Park, Alley Playground, Motor Parkway** |

The **17 refuted**: F10 (LP-0144 does not OCR badly), F26 (vertex counts), F71 (the "1876" is the
report's own text, not OCR damage), F98 (attribution of "nationally famous for its shellfish" to the
1882 source — it is LPC's narration), F123 (PLUTO 636 → 638), F157 (footnote number), **F177 (the
Allen-Beville House BBL, geocode and ZIP — the most consequential refutation on the page)**, F238
(the CB-411 parks list is incomplete), F249 ("three exceptions" — there are two), F250 (Fern & Aurora
ZIP), **F251 (cuisine counts, all five wrong)**, C2 (APEC's self-published ZIP is wrong), C30
(a fourth sense of "Douglaston Manor" exists), plus four minor derived-count and footnote slips.

The **71 uncertain** are dominated by: F2, F5, F6, F7 (negative retrievals I did not repeat);
F146–F149 (LPC building-database statistics I did not recompute); F92's PLUTO address enumeration;
F265 (the residents list, unaddressed and unallocatable between the two neighborhoods); the
Wikipedia-only bus routes, sub-development names ("Beech Hills", "Deepdale", the "Korvette's
Houses"), film and television credits, and school listings; and the C9 block, where the two
instruments genuinely disagree and I decline to resolve on this evidence.

---

*End of verifier verdicts. The finder's LPC and open-data work is the most accurate I have checked
in this borough; its geocoding is where it broke, once, badly, at 29 Center Drive.*
