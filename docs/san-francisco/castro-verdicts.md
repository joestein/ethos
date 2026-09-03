# The Castro — VERIFIER's verdicts

Adjudicating `docs/san-francisco/castro-finder.md`. Zone `castro`, destination
`The Castro, California`. Verification run 2026-09-03.

Every ruling below is mine. I did not gather the finder's evidence and I owe it nothing.
Where I say REWRITE, the wording in the box is the wording the author uses verbatim.

**Headline: 62 PUBLISH · 21 REWRITE · 24 DROP. Tier: GUIDE, on 41 surviving places.
29 Article 10 landmark numbers and 6 NRHP reference numbers survived re-fetching — one
MORE than the finder claimed, because it missed one. Three of the six NRHP listing dates
are wrong and are corrected below.**

---

## 0. WHAT I RE-FETCHED

I pulled the registers myself rather than trusting the file.

| Source | Result |
|---|---|
| DataSF `97yj-54sx` Article 10 landmarks | 370 rows. **All 31 landmark numbers named in the finder file verified exactly** on name, address and year designated. |
| 14 designation documents, fetched and run through `pdftotext` | 13 carry real ordinance or resolution text; 1 is an image scan with no text layer. |
| NPS ArcGIS NRHP service (`mapservices.nps.gov`) | All 6 reference numbers return `STATUS: Listed`. **3 of the 6 listing dates in the finder file are wrong.** |
| DataSF `ramy-di5m` Enterprise Addressing System | 33 addresses geocoded to an `nhood`. An independent method from the finder's polygon test. |
| DataSF `gtr9-ntp6` Rec & Park properties | 255 rows. Every acreage in the file verified to two decimal places. |
| DataSF `knm6-5ej6` Article 10 landmark **districts** | 20 rows. **The finder never queried this dataset. It should have.** |
| DataSF `63x5-g3m4` survey historic districts | 204 rows. **The finder's categorical claim about this dataset is false.** |
| Own sites re-read | castrotheatre.com, glbthistory.org/museum, randallmuseum.org, sfrecpark.org (Corona Heights), pinktrianglepark.org, sfpl.org, cliffsvariety.com, rainbowhonorwalk.org, sfpublicworks.org/castrostreet, cafedunord.com, castrocountryclub.org, mhr.org, pcfma.org, twinpeakstavern.com |
| Wikipedia via `action=query` wikitext | 6 articles, checked fact by fact |

The tooling note in the finder's header is CORRECT and I confirmed it: `.superpowers/taken_slugs.py`
globs `priv/seed_data/rome/*.json` only. Its report of "every place already owned" is false.
The finder's manual corpus walk was the right response. **No candidate in this file collides
with a committed slug**, and none touches the seven Oracle Park code-seed places, all of which
are Mission Rock / China Basin.

---

## 1. WHAT THE FINDER GOT WRONG

Six things. Two are factual errors that would have shipped, one is a false statement about a
city dataset, two are misses, and one is an evidentiary weakness.

### 1.1 Three NRHP listing dates are wrong. The reference numbers are right.

I queried the National Park Service directly. All six numbers are real and `Listed`. Three
dates are not what the finder wrote:

| Ref. no. | Property | Finder said | **NPS says** | Verdict |
|---|---|---|---|---|
| 100004413 | Swedish American Hall | 20 September 2019 | **30 September 2019** | **WRONG — correct it** |
| 100002359 | The Women's Building | 30 April 2018 | **4 May 2018** | **WRONG** (hand-off to Mission) |
| 100008228 | Timothy L. Pflueger House | 30 September 2022 | **7 October 2022** | **WRONG** (not ours) |
| 72000251 | Mission Dolores | 16 March 1972 | 16 March 1972 | correct |
| 82000984 | Delano House | 29 October 1982 | 29 October 1982 | correct — but NPS spells the name **"Delane House"** |
| 85001016 | St. Joseph's Hospital | 9 May 1985 | 9 May 1985 | correct |

The pattern is a Wikipedia transcription error, and it matters because A12 (Swedish American
Hall) is the one NRHP number this page actually claims. A wrong date on a citable identifier
is exactly the defect the gate exists to catch.

### 1.2 Section G states something untrue about DataSF `63x5-g3m4`.

The finder writes: *"**Every one of these reads `a10=No, nr=No, cr=Eligible`** — they are
survey findings, not listings."* That is false of the dataset. In the same Castro-area slice
I pulled:

- **Duboce Park Historic District — `a10 = Listed`.** An Article 10 landmark district.
- **Liberty Street Historic District — `nr = Listed, cr = Listed`.** National Register listed.

The eight districts the finder actually enumerated *are* `cr=Eligible`, and its rule — do not
write "eligible" as a designation — is correct and must be kept. But the generalisation is
wrong, and it is wrong because the finder never queried **`knm6-5ej6`**, the Article 10
landmark-district register, at all. Confirmed independently there: **Duboce Park Landmark
District, Article 10 Appendix N, listed 13 July 2013.** Two real designations went missing.

### 1.3 It missed San Francisco Landmark No. 335, which is inside the zone.

**St. Nicholas Cathedral, 2005 15th Street.** EAS returns `Castro/Upper Market`. Ordinance
No. 73-26. The Mission finder found it, flagged it as leaning Castro, and the Castro finder
does not mention it anywhere. This is a nineteenth landmark number for the page. Added as
A19 below.

For completeness, two neighbouring numbers the finder also omitted, now resolved so nobody
re-derives them: **LM 223 Carmel Fallon Building, 1800–1806 Market → `Hayes Valley`**;
**LM 334 St. Matthew's Church, 3281 16th Street → `Mission`**. Neither is ours. Correctly
not claimed.

### 1.4 The straddler case for Kite Hill and Seward rests on the wrong evidence.

The finder argues H5/H6 belong to the Castro on **Nominatim**. The Haight-Ashbury finder
demonstrated that Nominatim's San Francisco neighbourhood labels are wrong three times out
of three — it called Amoeba Music "Cole Valley", Buena Vista Park "Mission" and Alvord Lake
"Richmond District". That leg will not bear weight.

The finder had a much better argument sitting in the row it was already quoting and did not
read the column:

| Park | `analysis_neighborhood` | **`planning_neighborhood`** |
|---|---|---|
| Kite Hill, 10 Stanton St, 2.87 ac | Twin Peaks | **Castro/Upper Market** |
| Seward Mini Park, 70 Corwin St, 0.42 ac | Twin Peaks | **Castro/Upper Market** |

That is the city contradicting itself inside a single row of its own dataset, which is a real
finding. Escalate H5 and H6 on the planning column and drop the Nominatim argument entirely.

### 1.5 Two claims about street geography are wrong, and one about the Castro Theatre is missing.

- **A6.** "Adjoins the Castro Camera block on the west side of Castro." 578–582 Castro (even)
  and 573–575 Castro (odd) are on **opposite sides of Castro Street**. They do not adjoin.
  DROP the sentence.
- **C10.** The finder says it could reach no city page for Jane Warner Plaza and recommends
  not shipping it. The SF Public Works page **it cites for D3** names the plaza in terms:
  *"the project will add special paving and barrier improvements to Jane Warner Plaza."* The
  source was in its hand.
- **A1.** The designation document for Landmark No. 100 is **Ordinance No. 109-23, File No.
  230192, amended in Board 6 June 2023** — an ordinance *amending the landmark designation*,
  which names the property "429–431 Castro Street" and cites the original Ordinance No.
  355-77. The 1977 date is right; the 2023 amendment to the zone's marquee landmark is
  unmentioned.

### 1.6 "Every one has a live ordinance document behind it" is an overclaim.

The finder writes that it fetched 18 designation PDFs, all returned 200, "so each number
below has a live ordinance document behind it." HTTP 200 does not establish that. I opened
them:

- **LM 264 (Twin Peaks Tavern)** — the linked document is **Historic Preservation Commission
  Resolution No. 689 of 19 September 2012**, a recommendation to the Board, *not* the enacting
  ordinance. Its text contains the words "Initiation" and "initiate".
- **LM 241 (José Theater)** — a 606 KB scan with no text layer. It establishes nothing on its own.

Both landmark numbers still stand, on the dataset. The provenance sentence does not.

**On the credit side, and this was the finder's biggest exposure:** the Mission finder
formally doubted the whole 2026 batch, arguing the `citypln-m-extnl.sfgov.org` document URLs
were what a *recently initiated* rather than *completed* designation looks like. **The Castro
finder is right and the doubt is resolved.** I extracted enacted ordinance numbers from every
one:

| Landmark | Property | **Ordinance** |
|---|---|---|
| 322 | Bob Ross House | **60-26** |
| 323 | Sha'ar Zahav (Historic Location) | **61-26** |
| 325 | Bank of Italy Branch Building | **63-26** |
| 326 | Castro Rock Steam Baths | **64-26** |
| 329 | Full Moon Coffeehouse | **67-26** |
| 333 | San Francisco AIDS Foundation | **71-26** |
| 335 | St. Nicholas Cathedral | **73-26** |

All carry a Board of Supervisors memorandum dated 15 May 2026. These are completed
designations and they publish.

---

## 2. RULINGS — SECTION A, DESIGNATED AND UNCONTESTED

Every one of these 18 landmark numbers verified exactly against `97yj-54sx`, and every
address independently returned `Castro/Upper Market` from the EAS — a different method from
the finder's polygon test, reaching the same answer. **All 18 PUBLISH.** Plus A19, added.

| # | Place | Number | Ruling |
|---|---|---|---|
| A1 | Castro Theatre, 429 Castro St | LM 100, 1977 | **PUBLISH** + rewrite below |
| A2 | Castro Camera & Harvey Milk Residence, 573–575 Castro St | LM 227, 2000 | **PUBLISH** |
| A3 | Twin Peaks Tavern, 401 Castro St | LM 264, 2012 | **PUBLISH** + rewrite |
| A4 | Rainbow Flag at Harvey Milk Plaza | LM 319, 2024 | **PUBLISH**, merged with C9 |
| A5 | Bank of Italy Branch Building, 400–410 Castro St | LM 325, 2026 | **PUBLISH** |
| A6 | Castro Rock Steam Baths, 578–582 Castro St | LM 326, 2026 | **PUBLISH** + drop adjacency |
| A7 | San Francisco AIDS Foundation, 514–520 Castro St | LM 333, 2026 | **PUBLISH** |
| A8 | Full Moon Coffeehouse, 4416 18th St | LM 329, 2026 | **PUBLISH** + rewrite |
| A9 | Bob Ross House, 4200 20th St | LM 322, 2026 | **PUBLISH**; **DROP** the *Bay Area Reporter* founding claim |
| A10 | Sha'ar Zahav (Historic Location), 220 Danvers St | LM 323, 2026 | **PUBLISH** |
| A11 | The José Theater / NAMES Project Building, 2362 Market St | LM 241, 2004 | **PUBLISH** |
| A12 | Swedish American Hall, 2174–2178 Market St | LM 267, 2015 + NRHP 100004413 | **PUBLISH** + **date correction** |
| A13 | New Era Hall, 2117–2123 Market St | LM 277, 2018 | **PUBLISH** |
| A14 | Alfred E. "Nobby" Clarke Mansion, 250 Douglass St | LM 80, 1975 | **PUBLISH** |
| A15 | The McCormick House, 4040 17th St | LM 208, 2000 | **PUBLISH** |
| A16 | Benedict-Gieling House, 22 Beaver St | LM 284, 2019 | **PUBLISH**; **DROP** "on the Corona Heights side of the zone" |
| A17 | Saint Francis Lutheran Church, 152 Church St | LM 39, 1971 | **PUBLISH** — and see 4.4, it is not a straddler |
| A18 | Miller-Joost House, 3224 Market St | LM 79, 1975 | **PUBLISH**; **DROP** "near the Corbett Avenue slope" |
| **A19** | **St. Nicholas Cathedral, 2005 15th St** | **LM 335, 2026** | **PUBLISH — the finder missed it** |

### Replacement wording, used verbatim

> **A1 designation.** "San Francisco Landmark No. 100, designated in 1977 under Article 10 of
> the Planning Code. The designation was amended by Ordinance No. 109-23 in 2023, which names
> the property 429–431 Castro Street."

> **A1 facts.** "The Castro Theatre opened on 22 June 1922 to a design by Timothy L. Pflueger.
> Its Art Deco marquee was added in 1937. The auditorium seats 1,400 for concerts and 1,150
> for films."

*Both superlatives the finder flagged are correctly banned and I uphold both: Wikipedia's
"one of San Francisco's premier movie houses" and the operator's "the world's largest and
most versatile digital organ" do not publish in any form.*

> **A3.** "San Francisco Landmark No. 264, designated in 2012. The building stands at the
> corner of Castro and Market Streets. No source states its opening hours, so none are given
> here."

*Wikipedia's "the first gay bar in the city, and possibly in the United States, with plate
glass windows" is a ranking and does not publish, attributed or not. Note the gate's
superlative regex does not list "the United States" as a comparison class — the ban is on the
practice, not on what the regex catches.*

> **A6.** "San Francisco Landmark No. 326, designated in 2026, at 578–582 Castro Street."

> **A8.** "San Francisco Landmark No. 329, designated in 2026. Seven Castro properties were
> designated under Article 10 in 2026: Landmarks 322, 323, 325, 326, 329, 333 and 335."

> **A12.** "San Francisco Landmark No. 267, designated in 2015. Listed on the National
> Register of Historic Places on **30 September 2019**, reference number 100004413."

> **A19.** "San Francisco Landmark No. 335, designated in 2026, at 2005 15th Street."

**Kind rulings, which the finder declined to make.** A3 Twin Peaks Tavern → `restaurant`.
A bar that serves the public on premises is a restaurant among the thirteen; `attraction`
would misdescribe a going concern. A17 and A19 (working churches) → `attraction`, not
`historic-site`, because a visitor can go in. A9, A10, A14, A15, A16, A18 → `historic-site`,
exterior only.

---

## 3. RULINGS — SECTIONS B THROUGH F

### B. Museums and civic institutions — 3 PUBLISH

**B1. GLBT Historical Society Museum, 4127 18th Street — PUBLISH.** I re-read the site. The
finder's hours are **verbatim correct**, including the split shift I initially doubted:
"Tuesday–Sunday: 11:00 a.m.–1:00 p.m. and 1:30 p.m.–5:00 p.m. Monday: Closed." The
contradictory footer block ("Wed 10:30am–5pm…") is also really there, and the finder's
judgement to prefer the primary block is right. Address and (415) 777-5455 confirmed.
**Add, from the same page:** the museum is free to all visitors on the first Wednesday of
every month, sponsored by the Bob Ross Foundation — which links neatly to A9.
All four superlatives the finder flagged are correctly banned. **Uphold.**
*Unverified in my crawl: the 35-minute audioguide and the exhibition title "Queer Past
Becomes Present". Re-read before writing them.*
*Correctly ruled out of scope: the Society's archives at 989 Market Street are SoMa's.*

**B2. Randall Museum, 199 Museum Way — PUBLISH.** Every claim verified verbatim, including
the café hours I suspected were invented: "Tuesday through Saturday Open 10 am – 5 pm.
Closed Sunday and Monday. Admission is FREE. Café Josephine Hours: Tue–Fri 9:30am–3pm,
Sat 9:30am–4pm." (415) 554-9600 confirmed. The Wikipedia history all checks: established
1937 as the Junior Museum in an old city jail on what is now the City College campus;
opened at Corona Heights in 1951 in a building by William Merchant; dedicated by Mayor Elmer
Robinson on 23 September 1951. The finder's statement that the museum and Corona Heights
Park physically adjoin is a permitted adjacency. **Uphold in full.**

**B3. Eureka Valley / Harvey Milk Memorial Branch Library, 1 José Sarria Court — PUBLISH.**
SFPL hours verified verbatim: Sun 1–5, Mon 10–6, Tue 10–8, Wed 10–8, Thu 10–8, Fri 1–6,
Sat 10–6; 415-355-5616. **The finder's two warnings are both correct and both important, and
I confirmed each against the raw data:**
1. The `97yj-54sx` row reads `landmarkno = 0, yeardesignated = 0.0`. **This building is not
   designated.** I count 40 such rows citywide. A landmark claim here fails the build and
   deserves to.
2. The `gtr9-ntp6` row named "Eureka Valley Branch Library" is `propertytype: Community
   Garden`, 0.43 acres, at **3555 16th Street** — the adjoining garden parcel, not the
   library. Do not merge them into one place with two addresses.

### C. Parks and open space — 8 PUBLISH, 1 demoted

**C1–C7 — PUBLISH.** I re-ran the query. **Every acreage in the finder's table is correct to
two decimal places** (13.24973014 → 13.25; 2.9114282 → 2.91; 2.25481227 → 2.25; 0.82012885 →
0.82; 0.38656205 → 0.39; 0.19406325 → 0.19; 0.10643145 → 0.11).

**REWRITE the framing, though.** The table is headed "All from `gtr9-ntp6` with
`analysis_neighborhood = Castro/Upper Market`". That query returns **nine** rows, not seven.
The finder silently moved Mission Dolores Park to straddlers (defensible) and the Eureka
Valley library garden parcel to B3 (also defensible), but presents a curated selection as a
query result. Say what was selected.

**C1 Corona Heights Park — PUBLISH,** and the finder is vindicated on two facts I doubted.
"Park Hours: 5 a.m. to Midnight" is verbatim on the RPD page, as is Bill Kraus Meadow, "a
triangular shaped patch of lawn at the park entrance at Museum Way and Roosevelt Way", and
the Bill Kraus Pathway to the off-leash dog area. The handrail fact is real, on Wikipedia:
"The steps leading up to the peak are not supported by handrails." Franciscan chert, terra
cotta red at the summit, base ~300 ft, peak 520 ft — all verified.

**Add, from the RPD page:** the meadow and pathway were dedicated in Kraus's honour in 1986;
a one-mile trail network winds to the summit; the descent to the 15th Street tennis courts
runs about 0.2 of a mile.

**THREE SUPERLATIVES ON THAT PAGE THE FINDER DID NOT FLAG, and the author will read it:**
- *"This park has some of the best views in San Francisco"* — **this one matches the gate's
  regex and will fail the build.**
- *"the most challenging section"* (of the trail)
- *"the only host plant for the callippe silverspot butterfly"*

The finder correctly caught RPD's "one of the city's most prominent political leaders" about
Bill Kraus, and correctly ruled "an unobstructed panoramic view" acceptable as description
rather than ranking. I agree on both.

**C8. Pink Triangle Park and Memorial — PUBLISH, with one DROP.** Verified on the own site:
15 granite pylons, each representing 1,000 lives lost; 501(c)(3); volunteer-run. Verified on
Wikipedia: dedicated on United Nations Human Rights Day, **10 December 2001**, by the Eureka
Valley Promotion Association; "a loose rock-filled triangle that includes rose crystals.
Visitors are encouraged to take a crystal."

- **DROP "less than 4,000 sq ft".** I searched the article; the figure is not there. It is
  unsourced and it must not ship.
- **Add:** the own site states 100,000 men were arrested between 1933 and 1945.
- Note the own site titles it **"Pink Triangle Memorial"**. Choose the name deliberately.
- Both superlatives correctly banned. Photo-blocked: the pylons are sculpture. **Uphold.**
- *Unverified: "faces Market with 17th Street behind, sits directly above Castro station."*

**C9. Harvey Milk Plaza — PUBLISH AS ONE PLACE WITH A4.** I take the finder's recommendation.
Verified: plaza dedicated to Milk in 1985; flagpole added in 1997 for the 20th anniversary of
his election; **Castro station opened in 1980**. *Caution: the "Reid & Tarics Associates"
attribution is uncited on Wikipedia. Attribute it or leave it out.*

**C10. Jane Warner Plaza — DEMOTE to a named feature, not its own place.** I reverse the
finder's reasoning while keeping its conclusion. A city source does exist and the finder
already had it: SF Public Works, on the Castro Street page, states the project "will add
special paving and barrier improvements to Jane Warner Plaza." That is enough to name the
plaza inside the Castro Street entry with a citation. It is not enough for a standalone
place — there is no address, no hours, no dimension.

### D. Walks, streetscape and transit — 1 PUBLISH, 2 as context, 1 merged

**D1. Rainbow Honor Walk — PUBLISH.** Own site verified verbatim: **46 installed plaques, 28
planned, currently fundraising.** Wikipedia verified: founded by David Perry; first round of
twenty installed 2014; second round of twenty-four completed 2019; planned to run from the
Harvey Milk Civil Rights Academy at 19th and Collingwood along Castro to Market, then along
Market to the SF LGBTQ Community Center at Octavia. **Add:** 24 new honorees were named in
2022, and the walk branches in both directions at 18th and Castro.
The finder's instruction to describe the Castro-street segment rather than the whole planned
route is correct — the Market Street leg leaves the zone. "World-famous Castro neighborhood"
correctly banned. Plaques photo-blocked. **Uphold.**

**D2. Castro Street History Walk — MERGE into D1.** Verified: twenty historical fact plaques,
ten covering pre-1776 to the 1960s. One place, not two. I take the finder's recommendation.

**D3. Castro Street Streetscape Improvement Project — PUBLISH as context inside another
entry, not as a place.** Verified verbatim: "Status: Completed. Location: Castro Street
between Market and 19th Streets. Districts: District 8. Budget: $10,000,000." **Add:** funded
by the 2011 Road Repaving & Street Safety Bond and the Federal Transportation Administration.
*Warning: that same page carries "one of the largest and most complex municipal operations in
the City". Banned.*

**D4. Castro Station and the F Market terminus — context, not a place.** Agree. Add the
verified 1980 opening date for Castro station.

### E. Worship and community — 2 PUBLISH, 3 DROP

**E1. Most Holy Redeemer, 100 Diamond Street — PUBLISH.** Every Mass time verified verbatim
on the parish site, plus the address and (415) 863-6259. **Add: Thanksgiving Day 10:00 a.m.**
**Kind: `attraction`**, not `historic-site` — it is a working parish a visitor can enter.

**E2. Metropolitan Community Church, 150 Eureka Street — DROP.** The EAS confirms 150 Eureka
St #201 is a real address in `Castro/Upper Market`, but an address-registry row is not
evidence that the congregation is there. No service time, no institutional confirmation of
the address. The finder's own instruction was that it needs a second source; it does not have
one. Does not ship.

**E3. Hartford Street Zen Center, 57 Hartford Street — DROP.** Domain does not resolve. The
EAS confirms the address exists in the zone; it does not confirm the institution occupies it.
The finder recommended not shipping. Agreed.

**E4. Harvey Milk Civil Rights Academy — context inside D1, not its own place.** EAS confirms
4235 19th St → `Castro/Upper Market`. It anchors the walk's route and that is the only reason
to name it. Agree with the finder.

**E5. Castro Country Club, 4058 18th Street — PUBLISH, and I recovered the hours the finder
truncated.**

> "Open Sunday to Thursday 7:00 a.m. to 9:00 p.m., and Friday and Saturday 7:00 a.m. to
> 10:00 p.m."

Address and 415-552-6102 verified. Kind `cafe` is right.

### F. Trading places — 9 PUBLISH, 8 DROP

**PUBLISH:**

- **F1. Cliff's Variety, 471–479 Castro Street.** Verified verbatim: address, (415) 431-5365,
  "Monday – Saturday 10:00am – 6:30pm, Sunday 10:00am – 6:00pm", and the services list. The
  finder correctly refuses the site's "Since our founding in 1936" — an operator's own
  trading-duration claim. **Its reasoning on the 1971 fact is also correct**: a Chronicle-sourced
  occupancy date is not sourced to the business. But write it as a date, not a duration:
  > "Cliff's Variety moved into 479 Castro Street, the remodelled 1910 Castro Theatre
  > building, in 1971."
- **F2. Café du Nord, 2174 Market Street — merge with A12**, same building. Verified: the
  site lists a live calendar under both "Cafe Du Nord" and "Swedish American Hall" room names
  and gives "2174 MARKET ST, SAN FRANCISCO, CA". Trading confirmed.
- **F3. The Café, 2369 Market Street.** Address and Thursday–Saturday 9 p.m.–2 a.m. Operator
  superlative correctly banned. "Above the Chevron station" is a physical fact and keeps.
- **F4. Midnight Sun, 4067 18th Street — address only.** The finder is right that the 1981
  move is an operator's trading history and does not publish. The plumbing-warehouse origin
  is the same kind of claim; drop it too.
- **F5. Beaux, 2344 Market Street — address only.** Thin but honest.
- **F6. Starbelly, 3583 16th Street — address only.** EAS confirms the zone.
- **F7. Frances, 3870 17th Street — address only.** Michelin correctly dropped as an award.
- **F8. Thorough Bread and Pastry, 248 Church Street — address only.** See 4.4: not a straddler.
- **F9. Castro Farmers' Market, 270 Noe Street — PUBLISH, and upgrade.** The finder reported
  only "Wednesday afternoons… check current season". The PCFMA page it cited gives exact terms:
  > "Wednesdays 3:00 p.m. to 7:00 p.m., from 1 April 2026 to 18 November 2026."

**DROP — eight trading places with no sourced address, exactly as the finder recommended, and
I uphold every one:** F10 Anchor Oyster Bar, F11 Orphan Andy's, F12 Hot Cookie, F13 Harvey's,
F14 Dog Eared Books Castro, F15 Toad Hall, F16 Moby Dick, F17 Reveille Coffee.

*On F13: the Elephant Walk / White Night Riots history is sourced to the* Bay Area Reporter
*and the* SF Examiner *via Wikipedia and may be written as neighbourhood history. It may not
be written as a trading business, because nothing establishes that it trades.*

**Twin Peaks Tavern (A3) belongs to this list too** and I confirm the finder's finding:
twinpeakstavern.com returns 200 with 291 characters of extractable text. Hours are unsourced.
Say so as a fact about the source, never about the page.

---

## 4. STRADDLERS I AM ESCALATING

Six live conflicts. The finder flagged thirteen; I resolve four of them and cede two.

### ESCALATED — the arbitrator must rule

**4.1 The Dolores seam — H1, H2, H3, H4. The Mission finder claims all four.**
This is a genuine, direct, two-finder conflict and neither finder resolved it. Correctly so.
Both reached the same boundary fact by different methods: the city's Analysis Neighborhood
line runs down the centre of Dolores Street, and the Mission finder verified it address by
address in the EAS (`320 DOLORES ST` → Castro/Upper Market, `333 DOLORES ST` → Mission).

| | Property | Identifier(s) — all re-verified | The conflict |
|---|---|---|---|
| H1 | Mission San Francisco de Asís, 310–320 Dolores St | **LM 1, 1968**; **NRHP 72000251, listed 16 March 1972** | City polygon says Castro. Roster's `mission` draw names it explicitly. Mission finder calls it "the single most consequential boundary call in the zone". |
| H2 | Mission Dolores Park, 646 Dolores St, 15.99 ac | — | **Both** `analysis_neighborhood` **and** `planning_neighborhood` read Castro/Upper Market — stronger than the finder stated. But `501 DOLORES ST` returns `Mission` in the EAS. Roster's `mission` draw names "Dolores Park". |
| H3 | Mission High School, 3750 18th St | **LM 255, 2007** | The Mission finder claims it outright as C6 with **no boundary check at all**. Direct conflict. |
| H4 | Tanforan Cottages, 214 and 220 Dolores St | **LM 67 and LM 68, both 1975** | Both finders independently confirm Castro/Upper Market and both flag it. Agreed contest, smaller stakes. |

**4.2 Kite Hill (H5) and Seward Mini Park (H6) — escalated on new evidence.**
See 1.4. Escalate on `planning_neighborhood = Castro/Upper Market`, not on Nominatim.
The finder's observation that Twin Peaks is a **declined** zone is the real point: if the
arbitrator follows `analysis_neighborhood`, both parks belong to no page at all. The finder
was right to refuse to grab them and right to insist they be looked at.

**4.3 Two Article 10 district designations nobody has claimed.** Newly surfaced from
`knm6-5ej6` and `63x5-g3m4` (see 1.2). **Duboce Park Historic District** (`a10=Listed`;
Appendix N, 13 July 2013) and **Liberty Street Historic District** (`nr=Listed, cr=Listed`).
Duboce Park's Rec & Park row points away from the Castro on both columns; Liberty Street sits
on the Castro/Noe seam. Neither is obviously ours. Both need an owner.

### RESOLVED — no longer straddlers

**4.4 H10 Thorough Bread, H11 St Francis Lutheran and Swedish American Hall — resolved to the
Castro.** EAS returns `Castro/Upper Market` for 248 Church St, 152 Church St and 2174 Market
St. The Mission finder's own "RESOLVED AND EXCLUDED" list explicitly cedes St Francis
Lutheran, Swedish American Hall, New Era Hall, the José Theater, the McCormick House and the
Bob Ross House to Castro/Upper Market. Duboce Triangle is not a rostered zone, so there is no
competing page. Ship them; stop calling them contested.

**4.5 H7 Duboce Park and H8 Buena Vista Park — CEDE.** Duboce Park: `analysis_neighborhood`
Haight Ashbury, `planning_neighborhood` Western Addition — **both point away from the
Castro**. Buena Vista Park: both columns Haight Ashbury. The Haight-Ashbury finder claims
both, and holds the Duboce Park Article 10 designation this finder missed. Corona Heights
adjoins Buena Vista Park and may say so; it may not claim it.

**4.6 H13 Maud's, LM 331 — the finder was right to cede it.** Verified: 929–941 Cole Street,
Ordinance No. 69-26. The Haight finder claims it and has read the ordinance. Correct call,
and the finder deserves credit for not grabbing a landmark from the same 2026 LGBTQ-heritage
batch as its own.

**4.7 H9 and H12 — clean hand-offs, numbers verified.** To Haight: Delane House NRHP 82000984
(29 Oct 1982) and St. Joseph's Hospital NRHP 85001016 (9 May 1985) — note the **Delane**
spelling. To Noe Valley: LM 133 Axford House, LM 186 David Lewis House, LM 259 Carnegie Noe
Valley / Sally Brunn Branch Library. All five verified.

---

## 5. TIER RULING

**GUIDE. Surviving place count: 41.**

I agree with the finder's tier, on a corrected count, and for a firmer reason than it gave.

| Group | Places |
|---|---|
| Designated, uncontested (A1–A19; A4 absorbs Harvey Milk Plaza; A12 absorbs Café du Nord) | 19 |
| Museums and the library (B1–B3) | 3 |
| Rec & Park properties (C1–C7) | 7 |
| Pink Triangle Park (C8) | 1 |
| Rainbow Honor Walk, with the History Walk merged (D1+D2) | 1 |
| Worship and community (E1, E5) | 2 |
| Trading places with a sourced address (F1, F3–F9) | 8 |
| **Total** | **41** |

Dropped: 8 trading places with no sourced address, plus E2 and E3. Demoted to context: C10,
D3, D4, E4. Escalated: 6 straddler groups.

**The finder's caveat that "the shape of the guide depends on how the arbitrator rules on the
Dolores seam" overstates the dependency, and I reject it.** Not one of the 41 is contested.
If the arbitrator awards Mission Dolores, Dolores Park, Mission High and both Tanforan
Cottages entirely to the Mission, the Castro still ships 41 places carrying 19 Article 10
landmark numbers and one NRHP reference number. The tier does not move.

The affirmative case is that this zone has an unusual density of places a visitor can **enter**,
with **hours I verified from the operator or the city**: two museums (one free, one with a
published free day), a landmark theatre trading on a live calendar, a 13-acre park with
published park hours and a measured trail network, a public library, a parish with published
Mass times, a farmers' market with an exact season, a sober community centre, and a hardware
store. That is what a guide's `food` / `sight` / `walk` entries are made of.

The contrast is instructive. The Haight-Ashbury finder recommended **town-page** because its
designated material was almost entirely private houses and offices — of eleven designated
properties, exactly one was somewhere a visitor could go inside, and it argued that a guide
would have to invent itineraries between buildings nobody can enter. The Castro has the
opposite problem, and it also has a genuine, sourced walk: the Rainbow Honor Walk and the
Castro Street History Walk share the 400 and 500 blocks of Castro Street, which is a real
route a `walk` entry can follow without inventing connective tissue the proximity ban forbids.

---

## 6. NOTES THE AUTHOR MUST CARRY

1. **Kind coverage.** I have ruled the ones the finder left open: Twin Peaks Tavern →
   `restaurant`; Most Holy Redeemer and St. Nicholas Cathedral → `attraction`; Harvey Milk
   Plaza / Rainbow Flag, Pink Triangle Park, the Rainbow Honor Walk → `attraction`; the
   Eureka Valley library → `attraction`; the designated houses → `historic-site`. Expect
   `attraction` and `historic-site` to carry the load, as the finder predicted.
2. **The `landmarkno = 0` trap is real.** I confirmed 40 such rows citywide. In this zone:
   the Eureka Valley branch library, First Baptist Church, the Orders of Foresters / Baha'i
   Temple, the Society for Individual Rights and 2 Clarendon Avenue. None is designated.
   *(The Society for Individual Rights at 529 Clayton Street is in Haight-Ashbury, not the
   Castro — the finder's "Castro box" was loose there. It is not designated either way.)*
3. **"Eligible" is not a designation.** The finder's rule stands even though its
   generalisation about the dataset does not. Every district it enumerated is `cr=Eligible`
   and none of them may be written as protection.
4. **The superlative regex is narrower than the rule.** Both this finder and the Haight
   finder found that the gate's comparison-class list omits "the United States", "America"
   and "the world". Several true, sourced claims in this file are rankings the regex would
   pass. The ban is on the practice. The finder banned them anyway, correctly, and its list
   in J4 should be carried into the author's brief intact.
5. **Photographs: emit `"photos": []` everywhere.** The finder's 17 USC 120(a) analysis is
   correct and I uphold it in full. Buildings are fine — the Castro Theatre facade and
   marquee, 575 Castro, the Swedish American Hall, the Bank of Italy branch, the Randall
   Museum. Not covered, because they are artworks: the Pink Triangle Park pylons, every
   Rainbow Honor Walk and History Walk plaque, the rainbow flag at Harvey Milk Plaza, the
   Harvey Milk murals at 575 Castro, and the rainbow crosswalks.
6. **Live status.** Confirmed trading from a live calendar: the Castro Theatre (events
   through January 2027) and Café du Nord / Swedish American Hall (events through October).
   Confirmed open with published hours: both museums, the library, Cliff's Variety, the
   Castro Country Club, Most Holy Redeemer, the farmers' market. Everything else in section F
   ships as an address or not at all.
7. **Provenance stays in this file.** No HTTP status, no "could not be reached", no "for this
   guide" reaches the page. Where a source is silent, the page writes the fact: "No source
   states its opening hours, so none are given here."
