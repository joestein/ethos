# Mission District, San Francisco — VERIFIER verdicts

Adjudicated 2026-09-03 against the finder file `docs/san-francisco/mission-finder.md`.
Every ruling below is mine. I re-fetched the evidence rather than reading the finder's
account of it. Where the finder was right I say so; where it was wrong the correction is
here with the query that produced it.

**Headline: the finder's designation work is excellent and its boundary work is not.**
All 37 Article 10 numbers and all 11 NRHP numbers survive re-fetching. But one landmark
number is attached to the wrong building by the city's own data, one place is an
unflagged straddler in direct conflict with a live zone, two straddlers it flagged
dissolve on checking, and two designated places in the Mission it never found.

---

## 0. What I re-fetched

| Source | Query | Result |
|---|---|---|
| Article 10 landmarks | `data.sf.gov/resource/97yj-54sx.json?$limit=600` | 200, **370 rows** (not "380-odd") |
| Article 10 designation PDFs | `sfplanninggis.org/docs/landmarks_and_districts/LM<n>.pdf` | 9 fetched, all 200, one read page-by-page |
| Article 10 districts | `data.sf.gov/resource/knm6-5ej6.json` | 200, 20 rows |
| Survey districts | `data.sf.gov/resource/63x5-g3m4.json` | 200, 204 rows |
| NRHP | NPS ArcGIS `nrhp_locations/MapServer/0/query`, field `NRIS_Refnum` | 200, **170 SF rows** |
| EAS addresses | `data.sf.gov/resource/ramy-di5m.json` | 200, **70 addresses** checked |
| Rec & Park | `data.sf.gov/resource/gtr9-ntp6.json` | 200, 17 Mission rows |
| Board of Supervisors | `webapi.legistar.com/v1/sfgov/matters` | 200, resolved Calle 24 |
| Operator sites | 19 fetched | 17×200, 1×404, 1 DNS failure |

**I did not take the NRHP numbers from Wikipedia.** The finder itself said its reference
numbers "should ideally be re-confirmed against NPGallery before shipping". I confirmed
all twelve against the NPS National Register point layer, which carries `NRIS_Refnum`,
`RESNAME`, `Address` and `CertDate`. That check is what caught the one bad year.

---

## 1. THE COLLISION TOOL — the finder is right and the brief is wrong

The brief says `taken_slugs.py` "reads the shipped files, so it is always current" across
"Connecticut, New York and Rome". It does not. Line 11 globs
`priv/seed_data/rome/*.json` only. **The finder caught this and was right to.**

I walked every `priv/seed_data/*/*.json` myself: **3,921 places across 333 files**, and
**zero** carry a town containing "Francisco". The Oracle Park seven are a code seed, not a
seed file, so no seed-file slug collision is possible. The Castro finder independently
walked the same tree and got the same 3,921. `priv/seed_data/san_francisco/` holds only
`.gitkeep`.

**Ruling: no candidate in this zone is already owned.** The finder's §0 stands, including
its Flour + Water slug-trap flag — `2401 HARRISON ST` returns `Mission`, so that is a
genuinely different restaurant from `flour-and-water-pizza-shop-mission-rock`, and a
distinct slug is required.

---

## 2. DESIGNATION NUMBERS — 37 of 37 verify, but one is attached to the wrong building

I checked every claimed number against `name`, `address` **and** `yeardesignated`.

**36 are exactly right** — LM 1, 67, 68, 74, 99, 108, 118, 123, 125, 136, 137, 139, 150,
178, 187, 189, 191, 206, 214, 215, 234, 238, 245, 255, 276, 286, 296, 303, 312, 313, 315,
327, 330, 332, 334, 335. Name, street number and year match the city's row in every case.
That is unusually clean work and I want it recorded as such.

### 2.1 LM 65 — the finder called this right for the wrong reason, and the real answer is recoverable

The finder found two rows numbered 65 and concluded "one of the two numbers is wrong…
prefer the NRHP citation and drop the landmark number". Correct outcome, incomplete
reasoning. I settled it.

Duplicate `landmarkno` values are **not** automatically errors — LM 316 (Sacred Heart
Parish Complex) legitimately appears four times, once per parcel. So duplication alone
proves nothing. What proves it here:

1. Trinity Presbyterian's own `designationdocument` URL is **`LM166.pdf`**, not `LM65.pdf`.
2. Across all 370 rows, **Trinity Presbyterian is the only row whose document filename
   disagrees with its `landmarkno`.**
3. **166 is the only missing number in the range 160–170.**
4. I read `LM166.pdf`. It is **Ordinance No. 82-84, File No. 90-83-9**, "DESIGNATING
   TRINITY PRESBYTERIAN CHURCH AS A LANDMARK PURSUANT TO ARTICLE 10 OF THE CITY PLANNING
   CODE", 3261 23rd Street, passed 14 February 1984 and approved 28 February 1984 — which
   matches `yeardesignated` 1984. Its neighbours LM 165 (Coit Tower) and LM 167 are also
   1984 designations, so 166 fits the sequence.

**Trinity Presbyterian Church is San Francisco Landmark No. 166. The value 65 in the
DataSF row is a transcription error.**

**But I still rule the number DOES NOT PUBLISH.** The ordinance text nowhere states the
digits "166"; that identifier rests on a filename convention plus a gap, which is
inference, not citation. A wrong landmark number is worse than none because it looks
citable — that is the brief's own standard and it binds me here.

**The ordinance itself is fully citable, and better than a number.** Exact wording for the author:

> Trinity Presbyterian Church at 3261 23rd Street was designated under Article 10 of the
> City Planning Code by Ordinance No. 82-84, approved on 28 February 1984. It was listed
> on the National Register of Historic Places in 1982, reference number 82002252.

This passes the gate twice over: `Article\s*10` and `National Register` both satisfy
`@designation_citation`. Record "probably Landmark No. 166" in research only.

**Bonus, from the official case report inside LM166.pdf** — a primary source, so it beats
the finder's secondary material: built **1891–1892**, architects **Percy & Hamilton**, Bay
Area vernacular Romanesque, wood frame on brick base, original pipe organ, original seating
capacity 800, and the church **served as a relief centre after the 1906 fire and
earthquake**. All publish. Do **not** lift the report's "important architectural firm" —
write "designed by the firm of Percy & Hamilton".

### 2.2 The 2026 batch — the finder's top worry is unfounded

The finder rated LM 327, 330, 332, 334, 335 its **least confident** item and asked that a
designation document be opened before any publishes, on the theory that a
`citypln-m-extnl.sfgov.org` URL rather than `LM<n>.pdf` is "what an *initiated* rather than
*completed* designation would look like".

**Rejected.** The URL pattern reflects which document vault SF Planning filed the PDF in,
not the status of the designation. Three independent disproofs:

- LM 319 (2024, Rainbow Flag) sits at an `sfplanning.org/sites/default/files/…` path — a
  third pattern entirely — and is plainly complete.
- LM 312 and LM 313, both 2024 and both in this zone, use the stable `LM<n>.pdf` pattern.
  So 2020s designations are not uniformly vaulted.
- The Castro finder fetched **six** of the 2026 cohort's vault documents (LM 322, 323, 325,
  326, 329, 333) and reports every one returned 200.

All five Mission rows carry a real `yeardesignated`, a real address and a real APN.
**The 2026 numbers publish.** The finder's caution was reasonable a priori and wrong on
the evidence; I am overruling it rather than deferring to it.

### 2.3 California Historical Landmark 327-1 — REWRITE, it does not satisfy the gate

The finder counted this among its designation identifiers. **It is not one, as far as the
build is concerned.** `@designation_citation` accepts only an SF Landmark number,
`Article 10`, `National Register`/`NRHP`/`NR reference`, or `reference number` + 6 digits.
"California Historical Landmark No. 327-1" matches none of them, so a sentence pairing it
with "landmark"/"designated"/"listed" **fails the build**.

It publishes only alongside a citation that does qualify, in the same string:

> Mission San Francisco de Asís is San Francisco Landmark No. 1, designated in 1968, and
> was listed on the National Register of Historic Places in 1972, reference number
> 72000251. California State Parks records the site of the original chapel and the Laguna
> de los Dolores as California Historical Landmark No. 327-1.

---

## 3. NRHP — 11 of 11 verify, one year is wrong, one listing was missed

All eleven finder references matched an NPS row on name **and** street address:

| Ref | NPS `RESNAME` | NPS address | `CertDate` | Verdict |
|---|---|---|---|---|
| 72000251 | Mission Dolores | 320 Dolores St. | 03/16/72 | 1972 ✓ |
| 01001206 | New Mission Theater | 2550 Mission St. | 11/09/01 | 2001 ✓ |
| **100005987** | Mission Cultural Center | 2868 Mission St. | **01/04/21** | **finder says 2020 — WRONG** |
| 100002359 | Women's Building, The | 3543 18th St. | 05/04/18 | 2018 ✓ |
| 78000758 | San Francisco National Guard Armory and Arsenal | 1800 Mission St. | 11/14/78 | 1978 ✓ |
| 78000759 | Schoenstein and Company Pipe Organ Factory | 3101 20th St. | 11/14/78 | 1978 ✓ |
| 82002252 | Trinity Presbyterian Church | 3261 23rd St. | 03/02/82 | 1982 ✓ |
| 100001338 | Geilfuss, Henry, House | 811 Treat Ave. | 07/27/17 | 2017 ✓ |
| 79000531 | Girls Club | 362 Capp St. | 11/06/79 | 1979 ✓ |
| 94000995 | Ohlandt Newlyweds House | 1260 Potrero Ave. | 08/19/94 | 1994 ✓ |
| 86003727 | Pioneer Trunk Factory--C. A. Malm & Co. | 2185--2199 Folsom and 3180 18th Sts. | 03/05/87 | 1987 ✓ |

**REWRITE C1.** The finder wrote "Listed on the National Register of Historic Places in
2020, reference number 100005987." NPS certification is **4 January 2021**. Exact wording:

> Listed on the National Register of Historic Places in 2021, reference number 100005987.

The 1987 date on Pioneer Trunk Factory, which looks wrong against an `86`-prefixed
reference number, is **correct** — NPS certifies 05 March 1987. The finder was right and I
checked it because it looked wrong.

**MISSED — two designated Mission places the finder never found:**

**N1. Liberty Street Historic District** — `63x5-g3m4` carries it as `nr: Listed`,
`cr: Listed`, adopted 15 September 1983, period 1867–1911. NPS confirms:
**reference number 83001230, listed 15 September 1983, "Roughly 15-188 Liberty St."**
`50 LIBERTY ST` and `150 LIBERTY ST` both return `Mission`. This is a **listed** district,
unlike the 25th Street district the finder correctly rejected as merely eligible, and NPS
supplies the street extent — so unlike Liberty Hill, its boundary can be stated. See §5 for
the Noe Valley conflict.

**N2. Timothy L. Pflueger House, 1015 Guerrero Street** — NRHP **100008228**, certified
7 October 2022. `1015 GUERRERO ST` → `Mission`. The Castro finder found this, marked it
"Mission side" and handed it over; the Mission finder did not pick it up.

**Designation identifiers surviving re-fetch: 49 usable.** 36 Article 10 landmark numbers
(37 verified, LM 65 withdrawn), 1 Article 10 district, 12 NRHP reference numbers. Plus 3
Calle 24 legislative numbers (§6) and CHL 327-1 as a dependent citation.

---

## 4. BOUNDARIES — the finder's weakest work

The finder machine-checked 19 addresses and left roughly 30 unchecked, including the
landmark it placed in a plain candidate list. **I checked 70.** Method reproduced:
`ramy-di5m.json?$select=address,nhood&$where=address_number='N' and upper(street_name)='S'`.

### 4.1 One unflagged straddler, and it is a marquee place

**C6 Mission High School, 3750 18th Street → `Castro/Upper Market`.**

The finder put Mission High in §3.4 as an ordinary Mission candidate with the nhood column
left blank and **no straddler flag**. It is not in the Mission by the city's layer. The
Castro finder flagged the same building as its straddler **H3** — "Inside the
`Castro/Upper Market` polygon; faces Dolores Park; named 'Mission' High School. Every
signal points a different way."

**This is the finder's most serious error.** An unflagged straddler is worse than a flagged
one, because it reaches the author looking settled. Escalated in §5.

### 4.2 Two flagged straddlers dissolve

- **S4 St. Matthew's Church (D6), 3281 16th Street → `Mission`.** The finder called it
  "NOT machine-checked… likely straddler". It is cleanly Mission. **S4 is withdrawn; D6
  publishes as an ordinary Mission place with LM 334.**
- **S9 Zeitgeist (199 Valencia) and Creativity Explored (3245 16th) → both `Mission`.**
  The finder worried 199 Valencia sat at "the Mission / SoMa / Duboce triple point" and
  that SoMa is live. It does not. **S9 is withdrawn.** The 94103 ZIP misled the finder;
  ZIP is not the neighborhood layer.

### 4.3 Everything the finder left unchecked, checked

All of these return `Mission` and publish: 2550 Mission, 2961 16th, 2665 Mission, 2868
Mission, 3543 18th, 2940 16th, 3359 24th, **300 Bartlett**, 3101 20th, 2778 24th, 1348 S
Van Ness, 1381 S Van Ness, 827 Guerrero, 845 Guerrero, 1366 Guerrero, 224 Guerrero, 200
Fair Oaks, 2731 Folsom, 1458 Valencia, 376 Shotwell, 362 Capp, 3175 24th, 1311 S Van Ness,
3245 16th, 199 Valencia, 826 Valencia, 1062 Valencia, 2781 24th, 2534 Mission, 3639 18th,
3692 18th, 2779 Folsom, 2981 24th, 1015 Guerrero, 2401 Harrison, 3125 16th, 2 and 50 Balmy,
3100 26th, 2857 24th, 2840 16th, 1266 Florida, 544 Capp, 3316 24th, 777 Valencia, 2948
16th, 170 Valencia, 50 and 150 Liberty.

**Two returned no EAS row** — `2353 MISSION` (El Capitan) and `2185 FOLSOM` (Pioneer Trunk
Factory). Both addresses are city-sourced from the Article 10 and NRHP records
respectively, so both still publish; they simply have no independent EAS confirmation.

**One trap worth recording: `2501 25TH` is ambiguous by street type.** `2501 25TH AVE`
returns `Sunset/Parkside`; `2501 25TH ST` returns `Mission`. E11 (Engine Co. No. 37) is the
Street. The finder's answer was right; the query needed the suffix to be right.

### 4.4 Parks — all 14 confirmed, acreages exact

Every acreage in the finder's §4.4 table matches `gtr9-ntp6` to the rounding. Two
corrections, both cosmetic: the dataset spells it **"Parque Ninos Unidos"** without the
tilde, and Kid Power Park's address is "45 Hoff Street". **The 14 parks publish.**

`49 S Van Ness Avenue` — the finder recommended dropping it outright. **Upheld, with a
better reason than the finder gave:** its `planning_neighborhood` is *South of Market*,
not Mission, and its `propertytype` is "Other Non-Park Property". **DROP.**

---

## 5. STRADDLERS I AM ESCALATING

Eleven places in six groups. I am not resolving any of them; the arbitrator holds all
twelve zones.

**E1. The Dolores seam — Mission Dolores, the Basilica, the Cemetery, Dolores Park,
Mission High School, the two Tanforan Cottages, St. Nicholas Cathedral.** Nine places.

I confirmed every reading: `320 DOLORES ST`, `3321 16TH ST`, `214 DOLORES ST`,
`220 DOLORES ST`, `3750 18TH ST` and `2005 15TH ST` all return **`Castro/Upper Market`**;
Mission Dolores Park's Rec & Park row carries `analysis_neighborhood` **and**
`planning_neighborhood` = `Castro/Upper Market`. Against that, `333 DOLORES ST` and
`501 DOLORES ST` return `Mission`, so the finder's centre-line reading of Dolores Street
is correct as far as it goes.

**The decisive fact for the arbitrator is that both finders flagged all of this and
neither claimed it.** The Castro file's H1–H4 covers Mission Dolores, Dolores Park,
Mission High and the Tanforan Cottages and says "**This is the single most consequential
straddle in the file**". The Mission file's S1–S3 says the same. **There is no land grab
here — there is a genuine tie that only the arbitrator can break.** The roster's `mission`
draw names "Mission Dolores" and "Dolores Park" explicitly, which is editorial intent
pointing one way while the city's own polygon points the other.

Add to the Castro finder's list: **St. Nicholas Cathedral (LM 335)**, which the Castro file
does not mention and which returns `Castro/Upper Market`.

**E2. Liberty Hill Historic District and Liberty Street Historic District — a conflict the
finder did not see.** The roster assigns **"the Victorians of Liberty Hill" to NOE
VALLEY** (`priv/seed_data/san_francisco_roster.json`, `noe-valley` draw). The finder
claimed Liberty Hill for the Mission without noticing. EAS returns `Mission` for 50 and
150 Liberty Street, so the city layer favours the Mission and the roster favours Noe
Valley. Both districts ride on this one ruling. Noe Valley has no wave-1 finder file, which
makes this quieter than the Dolores seam but not settled.

**E3. SOMA West Dog Park and SOMA West Skate Park.** The finder flagged these and was
right to. New evidence sharpens it: their `planning_neighborhood` values are literally
**"South of Market, Mission"** and **"Mission, South of Market"** — the city records them
as belonging to *both*. SoMa is a live wave-1 zone whose roster note says boundaries "are
genuinely contested". **Direct conflict; do not claim without a ruling.**

**E4. Potrero seam — ZSFG Hospital (1001 Potrero) and Ohlandt Newlyweds House (1260
Potrero).** Both return `Mission`. Potrero Hill is declined, so nothing competes. Publish
in the Mission unless the arbitrator objects.

**E5. San Jose Avenue seam — Juri Commons and Mission Folk Victorian Home (LM 332).**
Both `Mission`; Bernal Heights declined. Publish.

**E6. Fallen Bridge Mini Park and Potrero del Sol.** Both `Mission` on both Rec & Park
columns. Potrero Hill declined. Publish.

---

## 6. CALLE 24 — the finder's top open question, answered

The finder called the Calle 24 legislative instrument its **"highest-value single
follow-up"** and could not find it; `sfplanning.org/project/calle-24-latino-cultural-district`
404s, and Wikipedia's article confirms a May 2014 resolution and a 2017 ordinance without
giving either number. I queried the Board of Supervisors legislative API
(`webapi.legistar.com/v1/sfgov/matters`) and got all three:

- **Resolution No. 168-14**, file 140421 — "Resolution establishing the Calle 24
  ('Veinticuatro') Latino Cultural District in San Francisco." **Enacted 28 May 2014.**
- **Resolution No. 201-14**, file 140659 — corrects 168-14 "by removing La Raza Park and
  Precita Park". **Enacted 19 June 2014.** (This independently vindicates the finder's
  note that Precita Park is Bernal's, not the Mission's.)
- **Ordinance No. 085-17**, file 170028 — "Ordinance amending the Planning Code to create
  the Calle 24 Special Use District, and revising the Zoning Map… generally bounded by
  22nd Street, Potrero Avenue, Cesar Chavez Street, and Capp Street, as well as 24th
  Street to Bartlett Street". **Enacted 31 March 2017.**

**The gate mechanics matter here and the author must follow them exactly.** None of these
numbers matches `@designation_citation`. But `@designation_claim` fires only on
*designated | listed | landmark | registered | nominated* — and **"established" and
"created" are not on that list**. So the claim passes by not being a designation claim at
all. Exact wording:

> The San Francisco Board of Supervisors established the Calle 24 Latino Cultural District
> by Resolution No. 168-14 on 28 May 2014, and corrected its boundaries by Resolution No.
> 201-14 on 19 June 2014. Ordinance No. 085-17, adopted on 31 March 2017, amended the
> Planning Code to create the Calle 24 Special Use District, generally bounded by 22nd
> Street, Potrero Avenue, Cesar Chavez Street and Capp Street, together with 24th Street
> as far as Bartlett Street.

**Do not write "designated" anywhere in that paragraph** — it would demand a citation the
sentence cannot supply, and the build would fail.

Use the **ordinance's** boundary, not the organisation's. Calle 24's own site says "Mission
Street to the West"; the ordinance says **Capp Street** and adds the Bartlett spur. The
ordinance is the authority. The organisation's 1999 founding year describes a nonprofit,
not a trading business — but it is still a founding year from the body's own site, and the
brief's rule is unqualified. **DROP the 1999.**

---

## 7. PROSE RULINGS ON EVERY SOURCED CLAIM

### 7.1 Superlatives — finder correct on all five, all confirmed present at source

I re-read each page. Every quotation the finder flagged is really there, and every one is
correctly banned:

- Roxie: "**one of the oldest continuously operated cinemas in the United States**" —
  matches `\bone of the (?:most|best|finest|largest|oldest|greatest)\b`. **DROP.**
- Mission Dolores parish: "is both **the oldest original intact Mission in California** and
  **the oldest building in San Francisco**". **DROP both.**
- Foreign Cinema: "**one of the most romantic and beautiful restaurants in San
  Francisco**". **DROP.**
- Wikipedia on the cemetery: "the oldest cemetery in San Francisco". **DROP.**

**One the finder did not flag, and it is a live hazard.** The Mission Dolores Wikipedia
article contains "**It is the oldest intact structure in San Francisco**" *immediately
after* the 1791 sentence the finder recommends lifting. An author copying that passage will
take the superlative with it. Lift the date only:

> The adobe chapel was completed in 1791. Construction of its walls began in 1788, and
> Ohlone labourers manufactured about 36,000 bricks; the walls were finished, plastered
> and whitewashed by 1790.

Confirmed safe substitutes: "**the sixth of the twenty-one Alta California missions**"
(Wikipedia's infobox gives `founding_order=Sixth`) — a sequence, not a ranking, and the
gate's own specimen list blesses this exact sentence. Clarion Alley's "560 ft long and 15
ft. wide" — verbatim at source, a measurement, publishes. Every park acreage publishes.

### 7.2 Trading duration and founding years — finder correct, plus two it missed

Correctly banned by the finder and confirmed at source: Roxie "for over one hundred
years"; Brava "40 Years of Brava!… and 100 Years of the Historic Theater" (block-party
promotion for 17 October 2026); Creativity Explored "over 40 years"; Precita Eyes "Since
1977" and "45th Anniversary Gala".

**Two the finder listed as publishable facts and should not have:**

- **J1, 826 Valencia.** The finder recorded "Founded 2002 by Nínive Calegari and Dave
  Eggers" as a sourced fact. It is a founding year from the organisation's own About page —
  the exact thing the brief says does not publish. **DROP the 2002 and the founders.** What
  survives: address 826 Valencia Street, that it is a tutoring and writing nonprofit, and
  that the Pirate Supply Store fronts its Mission Center.
- **J2, The Marsh.** "founded 1989" — same defect, same source. **DROP.** Also drop "a
  breeding ground for new performance", which is promotional voice rather than fact.

### 7.3 Hours — one set publishes, one set does not exist

- **Bi-Rite: PUBLISH, exactly as the finder has it.** Its locations page reads "Bi-Rite
  Market 18th Street… 3639 18th St… Hours: 8am-9pm daily" and "Bi-Rite Creamery… 3692 18th
  St… Hours: 12pm-9pm daily". Verbatim match.
- **Foreign Cinema: DROP the hours.** The finder gives "dinner Mon–Thu 17:00–21:30, Fri–Sat
  17:00–22:00, Sun 17:00–21:00; brunch Sat–Sun 10:30–14:00". **None of that is on the
  page.** The site returns its address, a reservations block and a list of sold-out dates,
  and nothing else. The restaurant publishes on address and identity alone.
- **Zeitgeist: REWRITE, publish only the visible part.** The page gives "199 VALENCIA
  STREET… 21 AND UP", "WE OPEN AT 12PM ON SATURDAY & 11AM ON SUNDAY", and opening times of
  2 PM Monday through Thursday. The finder's Thursday-to-Sunday *closing* times are not
  recoverable from the page. Write the openings and the age limit; write no closing time.
- **Mission Dolores: REWRITE, the finder mis-scoped these hours.** It attached them to the
  Basilica alone. The parish page heads them "**Old Mission, Giftshop, Museum, Cemetery &
  Basilica Hours: Monday to Friday: 10:00 a.m. - 4:00 p.m. Saturday/Sunday: 10:00 a.m. -
  5:00 p.m.**" — one visitor complex, not one building. This is also an argument for
  folding A1–A3 into a single place, which I recommend.

### 7.4 The 1776 date conflict — DROP both dates

The finder found the parish site saying "founded June 29, 1776" and Wikipedia saying
9 October 1776, and proposed naming both with their meanings. I checked: Wikipedia's
article says "founded on October 9, 1776, by Frs Francisco Palóu and Pedro Benito Cambón"
and contains **no** 29 June date at all, so the two are not the reconcilable "first Mass
vs. formal dedication" pair the finder assumed — one is simply the operator's own claim.
A founding year from an operator's own site does not publish. **Use the construction dates
in §7.1 instead**, which are third-party and carry the same weight.

### 7.5 Mission Branch Library — REWRITE, the finder's status is right and current

Confirmed verbatim at `sfpl.org/locations/mission`: "The Mission Branch located at 300
Bartlett Street is closed for renovation. We are now offering full in-person service in the
former Yoga Tree studio". Temporary location **1234 Valencia Street**, telephone
415-355-2800, hours **Sun 1–5, Mon 10–6, Tue 10–8, Wed 10–8, Thu 10–8, Fri 1–6, Sat 10–6**.
A book-drop closure notice dates the renovation to at least October 2022.

The address conflict the finder rated its 4th least-confident item **does not matter for
zoning** — `3359 24TH ST` and `300 BARTLETT ST` both return `Mission`. It is a corner
building. Assert the SFPL address, 300 Bartlett Street, since SFPL operates it.

**Do not reuse SFPL's phrase "around the corner on Valencia Street"** — it is orientation
by impression and the brief bans that class. Exact wording:

> The Mission Branch Carnegie Library at 300 Bartlett Street is San Francisco Landmark
> No. 234, designated in 2004. The branch is closed for renovation, and the library service
> runs from a temporary location at 1234 Valencia Street, open Sunday 1–5, Monday 10–6,
> Tuesday to Thursday 10–8, Friday 1–6 and Saturday 10–6.

### 7.6 Two gate hazards the finder created and did not see

- **"Landmark" is itself a claim word.** `@designation_claim` fires on the bare word
  *landmark*. The finder's §4.6 describes the BART plazas as "genuine Mission landmarks in
  the vernacular sense". Written into prose, that sentence demands a register and an
  identifier it cannot supply, and **fails the build**. Same hazard in any phrase like "a
  landmark of the neighborhood". Use "well-known" or name the thing plainly.
- **The gate tests whole strings, not sentences.** `prose/1` feeds each `summary`,
  `history` and entry `note` in whole. So one stray "designated" anywhere in a long history
  forces a citation into **that same field**. Keep each designation sentence in the field
  that also carries its number.

### 7.7 Photographs — finder correct, and the blocklist confirms it

`"photos": []` everywhere. For the record, the gate's `@live_artwork_subjects` hard-codes
**"balmy-alley"**, **"balmy alley"**, **"clarion-alley"** and **"clarion alley"** as
substring matches over a photo's title, description **and `src`**. So a Balmy Alley photo
cannot pass this gate even if someone later clears the artists — the block is on the
subject string. MaestraPeace, the Chata Gutiérrez Mural and the Carnaval Mural are not on
the hard-coded list but are murals, so 17 USC 120(a) does not reach them either. Buildings
— the Armory, the four Mission Street theatres, the Carnegie library, Trinity Presbyterian
— are fine from public land.

### 7.8 Kinds

**Zeitgeist: the finder was right that there is no `bar`.** I read the list off the schema
rather than the roster: `Ethos.Places.Place` line 7 gives exactly `museum theater restaurant
cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction`.
`brewery` is a false statement — Zeitgeist does not brew. **Ruling: `restaurant`.** It
serves food and drink and the kind is an approximation either way; `restaurant` is the one
that is not factually wrong. Escalating to the arbitrator as a preference, not a blocker.

Also needing a kind chosen rather than invented: the churches and schools (D1–D7) →
`historic-site`; Calle 24, Balmy Alley, Clarion Alley, the two murals → `attraction`.

---

## 8. DROPS

| Candidate | Ruling |
|---|---|
| J6 Galería de la Raza | **DROP.** Left 2857 24th; own site gives 2779 Folsom for administration and Studio 16 "currently under construction". Not established as visitable. Finder's own caution upheld. |
| 49 S Van Ness Avenue | **DROP.** `planning_neighborhood` = South of Market; "Other Non-Park Property". |
| G2 25th Street Historic District | **DROP the designation.** Confirmed `cr: Eligible, nr: No, a10: No`. Eligible is not listed. May be described with no protection claim. |
| Fair Oaks Street HD | **DROP.** Also `Eligible` only. (Not claimed by the finder; recorded so it is not re-found. E8 at 200 Fair Oaks is a separate individual landmark and stands.) |
| St. Peter's Church | **DROP.** Parish site not reached; the sourced site serves the school. |
| Community Music Center (544 Capp) | **DROP.** `sfmusic.org` refused connection. `544 CAPP ST` → Mission, so re-findable later. |
| Dance Mission Theater (3316 24th) | **DROP.** 404. Address is Mission. |
| The Chapel (777 Valencia) | **DROP.** 404. Address is Mission. |
| The Lab (2948 16th) | **DROP.** Unsourced. Address is Mission. |
| BART plazas | **DROP as places.** No source, and see the "landmark" hazard in §7.6. |
| Tartine, La Taqueria, El Farolito, Delfina, Ritual, Four Barrel, La Palma, St. Francis Fountain, Humphry Slocombe, Trick Dog, Doc's Clock, El Rio, Dog Eared Books, Alley Cat, Adobe Books, Paxton Gate, Community Thrift | **DROP, all 17.** No confirmed address. I re-tested two: `tartinebakery.com` returns 200 with 75 characters of text, and `lataqueriasf.com` fails DNS. The finder's own instruction — "none should ship without one" — is upheld. |
| Foreign Cinema hours | **DROP.** Not present on the page (§7.3). |
| Precita Eyes "1.5 hours" tour | **DROP.** Trip duration. |
| CHL 327-1 as a standalone citation | **DROP.** Fails the gate alone (§2.3). |

---

## 9. TIER RULING

**GUIDE. Surviving count: 66 places, before any straddler is awarded.**

Counted honestly, straddlers excluded and drops removed:

| Group | Count |
|---|---|
| Article 10 landmarks, clean in the Mission | 31 |
| NRHP-only listings (incl. Pflueger House) | 5 |
| Liberty Street Historic District | 1 |
| Roxie Theater (no designation) | 1 |
| Mural places and Calle 24 | 5 |
| Arts organisations without designation | 5 |
| Rec & Park properties | 14 |
| Eating, drinking, shops | 4 |
| **Total** | **66** |

The finder claimed 96 candidates and judged "guide". **I confirm the tier and reject the
count.** 96 counts straddlers, explicit non-candidates and 17 places with no sourced
address. The honest figure is 66, and 66 is still comfortably guide-shaped: 36 usable
Article 10 numbers, 12 NRHP references, a listed historic district, a four-theatre cluster
on one street, two mural alleys, a cultural district with three legislative citations, and
fourteen parks with measured acreages. It clears the bar without needing a single
straddler.

If the arbitrator awards the Dolores seam to the Mission, the count rises to 75 and the
guide gains its marquee draw. If it goes to the Castro, **the tier does not change** —
which is the useful thing for the arbitrator to know: this ruling is not hostage to that one.

---

## 10. SUMMARY OF WHAT THE FINDER GOT WRONG

1. **Mission High School is a straddler and was not flagged** — `3750 18TH ST` returns
   `Castro/Upper Market`, and the Castro finder flagged the same building. Most serious error.
2. **Mission Cultural Center's NRHP year is 2021, not 2020.** Only error among 11 references.
3. **Foreign Cinema's hours are not on Foreign Cinema's website.** Asserted, unsourced.
4. **826 Valencia's 2002 founding and The Marsh's 1989** were recorded as publishable facts;
   both are founding years from the organisations' own sites and both are banned.
5. **Mission Dolores' hours were mis-scoped** to the Basilica; they cover the Old Mission,
   gift shop, museum, cemetery and Basilica together.
6. **Liberty Hill was claimed without noticing the roster gives Liberty Hill to Noe Valley.**
7. **Two designated Mission places were missed** — Liberty Street Historic District
   (NRHP 83001230) and the Pflueger House (NRHP 100008228), the latter handed over in the
   Castro file the finder did not read.
8. **The 2026 batch worry was unfounded** — the vault URL reflects filing, not status.
9. **CHL 327-1 was counted as a designation identifier** but does not satisfy the gate.
10. **Two straddler flags were false alarms** (St. Matthew's, Zeitgeist/Creativity Explored),
    costing the zone three places it can simply have.
11. **370 rows, not "380-odd".** Minor, but it is the row count everything else rests on.

**What the finder got right, and it is a lot:** all 37 landmark numbers verify exactly on
name, address and year; all 11 NRHP references resolve to the right buildings at NPS; every
superlative and duration claim it flagged is genuinely present at source and genuinely
banned; the `taken_slugs.py` gap is real and the brief is wrong about it; the Trinity 65
anomaly is real; the Precita/Bernal and Noe Valley exclusions are correct; the "eligible is
not designated" ruling is correct; and the Flour + Water slug trap is real. The designation
research is the strongest part of this file and I found nothing wrong with it beyond one year.
