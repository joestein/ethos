# Hunts Point, Bronx — independent verifier's verdicts

Role: **VERIFIER.** I re-fetched every URL the finder cited, from scratch, with my own
fetcher (`scratchpad/hp_verifier_fetch.py`, saved pages under `scratchpad/hp_verify_pages/`).
I read Wikipedia as raw wikitext, NYC Parks with a browser User-Agent via Python, and I
re-queried the DOHMH API myself. I did not read the finder's reasoning as evidence; where I
mark something `confirmed` it is because I found the words in the source, and I quote them.

**Independent confirmation of the finder's access constraint:** my own WebSearch call
returned *"Web search was not performed: this session has used its web search budget
(200 of 200 WebSearch calls)."* WebSearch is genuinely unavailable. Nothing below rests
on a search engine.

**Warning about the confirmation rate.** 196 of 219 items are confirmed. That number is
high because the finder mostly transcribed source text verbatim and I could match the
strings. It does **not** mean the research is sound. Read §0 first: the refutations cluster
in exactly the places the author will get hurt — the neighborhood-boundary question, the
addresses, and four quotes that are paraphrases dressed as quotations.

---

## 0. Read this before anything else

Five things the finder got wrong that would have shipped as errors:

1. **The library is not in Hunts Point, and the finder had the sentence that proves it and
   dropped it.** Wikipedia's *Hunts Point, Bronx* article says, in full: *"The New York
   Public Library operates the Hunts Point branch at 877 Southern Boulevard **in Longwood,
   near Hunts Point**."* The finder's F128 quotes the next sentence and omits this one, then
   spends N1 treating the question as open and inferring from a ZIP code. It is not open.
   The source says Longwood. **P20 is refuted.**

2. **Hunts Point Avenue station is in two neighborhoods, and the finder truncated that too.**
   The article reads: *"It is located at Hunts Point Avenue and Southern Boulevard in the
   **Longwood and Hunts Point** neighborhoods of the Bronx."* Infobox `locale = Longwood,
   Hunts Point`. F153 quotes only up to "Southern Boulevard". The station may ship, but not
   as an unqualified Hunts Point site.

3. **Four "verbatim" quotes are paraphrases the finder wrote itself** — F83, F84, F102, F113.
   F83 is the worst: the finder quotes the Bruner award page as saying *"no safe access to
   the river for the first time in over 60 years"*, calls the wording "garbled" and tells the
   verifier to "re-derive the claim." The page is not garbled. It says: *"the park is now a
   riverfront oasis with **safe access to the river for the first time in over 60 years**."*
   The word "no" is the finder's insertion. Do not trust any string in the finder's file that
   I have not re-quoted below.

4. **The finder never opened four NYC Parks pages that contain the addresses it says are
   unknown**, and got the address of its single richest site (Drake Park) wrong by guessing.
   Real addresses are in §3. Hunts Point Playground even carries a full Historical Signs text
   that independently corroborates the 1874 annexation date the finder called single-sourced.

5. **The Fish Parade banner is stale.** *"Saturday, June 20th from 12-4PM"* for 2026 is a date
   that has already passed. Do not publish it as upcoming.

---

## 1. Headline verdict on the boundary question

Ruled explicitly, because the author depends on it.

**In Hunts Point (confirmed by the source's own words or by NYC Parks ZIP 10474 + CB2):**
Joseph Rodman Drake Park & Enslaved African Burial Ground; Barretto Point Park; Hunts Point
Riverside Park; Tiffany Street Pier; Barretto Park; Hunts Point Playground; Julio Carballo
Fields; Corpus Christi Monastery; American Bank Note Company Printing Plant; THE POINT CDC
(940 Garrison Ave); THE POINT Riverside Campus (1391 Lafayette Ave); Bronxlandia; the three
food-market facilities (Cooperative, Terminal Produce, New Fulton Fish).

**Straddling — must be qualified in prose:** Hunts Point Avenue subway station. Wikipedia
places it *"in the Longwood and Hunts Point neighborhoods."*

**NOT in Hunts Point — do not present as a Hunts Point place:**
- **Hunts Point Library, 877 Southern Boulevard** — Wikipedia: *"in Longwood, near Hunts
  Point."* NYPL ZIP 10459, not 10474. **Longwood.**
- **Longwood Avenue station** — its own article: *"Located at Longwood Avenue and Southern
  Boulevard in the Longwood neighborhood of the Bronx."* Infobox `locale = Longwood`.
  **Longwood.** (Note the Hunts Point article does list it as serving Hunts Point; the
  station's own article is the better source for where the station is.)
- **41st Precinct station house, 1035 Longwood Avenue** — Longwood address; the precinct
  patrols both. **Longwood.**
- **"Fort Apache" / 1086 Simpson Street** — Simpson Street is Longwood. **Longwood.**
- **Soundview Park** — across the Bronx River. NYC Parks lists it 0.18 mi from Riverside
  Park and 0.59 mi from Drake Park; proximity is not membership. **Soundview.**
- **Lincoln Hospital** — THE POINT's own wording is the clinic was *"near Hunts Point."*
  **Mott Haven.**
- **The second Drake tablet** — *"near the Lorillard Snuff Mill in the New York Botanical
  Garden."* **Bronx Park.**
- **Milly's Corner Restaurant and Bar, 1129 Longwood Avenue** — Longwood address, DOHMH ZIP
  10474. DOHMH-only regardless; see §4.
- **Port Morris:** nothing in the finder's file is a Port Morris candidate. No claim to rule on.

---

## 2. The DOHMH-only ruling — read this literally

I re-queried `https://data.cityofnewyork.us/resource/43nn-pn8j.json` filtered to
`zipcode='10474'` myself: **461 inspection rows, 35 distinct DBA names, 35 distinct CAMIS
IDs.** The finder's list of 35 and every address in it match my query exactly. **F162 is
confirmed.**

**Exactly two of the 35 have a source that is not DOHMH:**
- **Boogie Down Grind Café** — own site `https://www.boogiedowngrind.com` (verified live).
- **Bronxlandia** — own site `https://bronxlandia.com` (verified live).

**The other 33 are DOHMH-ONLY.** For every one of them, stated plainly:

> Its existence and its street address may be published, because a city inspection record
> establishes both. **NOTHING about it may appear in prose — not one word, not even the
> category noun.** You may not call it a restaurant, a café, a pizzeria, a bar, a deli or a
> coffee shop. You may not say it is popular, small, long-standing, family-run, open, or
> good. You may not say what it serves. A DOHMH row proves that a food-service permit exists
> at an address on an inspection date. It proves nothing else, and every adjective is
> invention.

The 33 DOHMH-only rows (verified against the API): Albert's Coffee Shop (405 Hunts Point
Ave); Allen Restaurant (1201 Randall Ave); Baldor Bistro (155 Food Center Dr); Bascom
Catering & Events (940 Garrison Ave); Best Bite Pizza (889 Hunts Point Ave); Cafe Italia (500
Tiffany St); Diamond Club (673 Hunts Point Ave); Dunkin (880 Garrison Ave); Fratilli's Pizza
& Cafe (404 Hunts Point Ave); Fulton Cafe (800 Food Center Dr); Happy Garden (1236 Spofford
Ave); Hunts Point Juice Bar & Deli (620 Manida St); Jay's Spanish Restaurant (898 Hunts Point
Ave); Johnny's Cafe (1232 Randall Ave); Kennedy Fried Chicken (870 Hunts Point Ave); La
Posada Mexicana (1176 Garrison Ave); La Salle Grocery (1232 Randall Ave); Market Restaurant
(C-D Block) (355 Food Center Dr); McDonald's (875 Garrison Ave); Metro Cafe (100 Oakpoint
Ave); Mexican Grill (Hunts Point Terminal Market); Milly's Corner Restaurant and Bar (1129
Longwood Ave); New Peperoni's Pizza (1308 Lafayette Ave); Oasis Coffee Shop (390 Tiffany St);
Pop N Waffle (1012 Garrison Ave); Randall Restaurant (1328 Randall Ave); Ruta 55 Restaurant
(1318 Lafayette Ave); Snack Bar (355 Food Center Dr); Southside Cafe (Produce Market) (300C
Hunts Point Terminal Market); The Point Cafe & Grill (402 Hunts Point Ave); Valencia Coffee
Room (801 Edgewater Rd); Xin Rong and Xin Rong Chinese Restaurant (741 Hunts Point Ave — two
DBA strings, two CAMIS IDs, one address; I could not establish they are one business).

**A trap the finder did not flag.** Most of these names *contain* the forbidden category noun
— "Pizza", "Restaurant", "Coffee Shop", "Cafe", "Juice Bar", "Grocery". Printing the name is
functionally printing the category. Given that the rule exists to stop DOHMH rows becoming
recommendations, **my ruling is that none of the 33 should appear in the guide at all**, in
any list, table or address block. The permitted-by-the-letter minimum (name + address, zero
prose) still reads to a visitor as a recommendation. Do not use them.

**Additional caution:** seven of the 33 (Baldor Bistro, Fulton Cafe, Market Restaurant, Snack
Bar, Southside Cafe, Mexican Grill, Metro Cafe) sit inside the food distribution centre /
terminal market, which **no source establishes as publicly accessible.**

---

## 3. Publishable street addresses — exact strings

Verified by me against the source named. Use these strings, not the finder's.

| Place | Exact address string | Source |
|---|---|---|
| Joseph Rodman Drake Park & Enslaved African Burial Ground | **Oak Pt. Ave. bet. Hunts Pt. Ave. and Longfellow Ave., Bronx** | nycgovparks.org/parks/joseph-rodman-drake-park |
| Barretto Point Park | **Viele Ave. bet. Tiffany St. and Barretto St., Bronx** | nycgovparks.org/parks/barretto-point-park |
| Hunts Point Riverside Park | **Lafayette Av bet. Edgewater Rd and the Bronx River, Bronx** | nycgovparks.org/parks/hunts-point-riverside-park |
| Tiffany Street Pier | **Tiffany St. at Viele Ave., Bronx** | nycgovparks.org/parks/tiffany-street-pier |
| Barretto Park | **Barretto St bet. Randall Av and Spoffard Av, Bronx** (Parks' own spelling of Spofford) | nycgovparks.org/parks/barretto-park |
| Hunts Point Playground | **Spofford Av bet. Faile St and Hunts Point Av, Bronx** | nycgovparks.org/parks/hunts-point-playground |
| Julio Carballo Fields | **Manida St bet. Spofford Av and Lafayette Av, Bronx** | nycgovparks.org/parks/julio-carballo-fields |
| Corpus Christi Monastery | **1230 Lafayette Ave., Bronx, NY 10474** | corpuschristimonastery.org |
| American Bank Note Company Printing Plant | **1201 Lafayette Avenue, Bronx** | Wikipedia infobox |
| THE POINT CDC | **940 Garrison Ave., Bronx, NY 10474** | thepoint.org |
| THE POINT — Riverside Campus for Arts and The Environment | **1391 Lafayette Ave, Bronx, NY 10474** | thepoint.org footer |
| Bronxlandia | **910 Hunts Point Avenue, Bronx, NY 10474** | bronxlandia.com **and** DOHMH — the two agree |
| Hunts Point Avenue station | **Hunts Point Avenue and Southern Boulevard, Bronx** | Wikipedia infobox |
| Hunts Point Library *(Longwood, not Hunts Point)* | **877 Southern Boulevard, Bronx, NY 10459** | nypl.org |

**No publishable address exists for:** Hunts Point Cooperative Market, New York City Terminal
Produce Market, New Fulton Fish Market (no source gives a street address; "Hunts Point Food
Distribution Center" is not an address); Hunts Point Landing (Wikipedia says only *"at the
end of Farragut Street, which was partially demapped"* — single-sourced, no Parks page);
Hunts Point Palace (nothing); **Boogie Down Grind Café — see below.**

**Boogie Down Grind Café has NO publishable address.** Its own site says *"868 Hunts Point
Ave, The Bronx NY"*. DOHMH puts it at **1200 Seneca Avenue**. I confirmed both strings
myself. The conflict is unresolved and WebSearch is unavailable to resolve it. Publish the
business in prose (it has a non-DOHMH source, so prose is permitted) but **print no street
address.**

---

## 4. Single-sourced claims — and whether they may ship

| Claim | Sole source | May it ship? |
|---|---|---|
| Hunts Point Palace, a jazz/dance hall (F131) | THE POINT CDC, one sentence | **Yes, one attributed clause only** — "THE POINT CDC's neighborhood history names the Hunts Point Palace among the clubs and dance halls where jazz musicians played." No address, no dates, no present tense, no claim that it stands. |
| Spofford Youth House / Juvenile Center (F132) | THE POINT CDC | **Yes with attribution.** The characterisation *"a symbol of pain, abuse, corruption, and neglect"* is an advocacy organisation's judgement of a facility it campaigned against, and must be attributed to THE POINT, never stated in the guide's own voice. No closure date is sourced. |
| Hunts Point Landing (F101, F104) | Wikipedia's *South Bronx Greenway* article only; NYC Parks 404 (I reproduced the 404) | **Marginal.** If used, attribute: "the South Bronx Greenway includes Hunts Point Landing, which opened in 2012." No address, no acreage (Wikipedia itself says 1 or 1.5 acres "by various sources"). Safer to omit. |
| THE POINT Riverside Campus, 1391 Lafayette Ave (F138) | thepoint.org footer only | **Yes, address only.** No hours, no description, no programming claims — the footer carries nothing else. |
| Library is a NYC designated landmark (F128) | Wikipedia, citing an LPC press release | **Yes with attribution**, and only on a page that places the library in Longwood. NYPL's own page does not mention landmark status. |
| The three markets' scale/history (§7, F108–F115) | Wikipedia articles only; no official market website resolves | **Background prose only, attributed, past tense.** See §5. |
| Fish Parade "first parade circa 2003–2004" (F141 note) | Nobody — this is the finder's arithmetic from "20th anniversary in 2023" | **No.** The site does not state a founding year. Ship "THE POINT CDC marked the festival's 20th anniversary in 2023" and stop there. |
| Casitas and community gardens (F148) | THE POINT CDC | **Yes with attribution.** Vivid and specific, but one advocacy source, past tense, no location. |
| "Que Viva Puerto Rico Libre" graffiti (F149) | THE POINT CDC | **Yes with attribution**, explicitly past tense ("in the 1970s"). Nothing suggests it survives. |

---

## 5. Visitability — rule on this before writing a word of "things to do"

- **Hunts Point Cooperative Market, New York City Terminal Produce Market, New Fulton Fish
  Market.** I re-read all four Wikipedia articles in full. **Not one sentence in any of them
  mentions public visiting, hours, tours or admission.** The Cooperative Market article
  describes a 24/7 wholesale facility with its own private security force ("Hunts Point
  Department of Public Safety... about 45 NYC special patrolmen"). **The finder's caution is
  upheld and I make it a ruling: do not write these as places a visitor can go.** They are
  background — what the peninsula does, not what a reader can do.
- **Corpus Christi Monastery.** Its own site: *"a Dominican community of **cloistered**
  contemplative nuns."* No hours, no Mass schedule, no visitor information anywhere on the
  site (I read the whole thing — it is one page, ~1,600 characters). **Do not write it as
  visitable.** Address and identity only.
- **North and South Brother Islands**, visible from Barretto Point Park. Wikipedia's Barretto
  article adds a sentence the finder omitted: ***"The islands themselves are closed to the
  public."*** Include that if the view is described.
- **American Bank Note Printing Plant** is a charter school and an HRA office. Exterior only.

---

## 6. Verdicts on the facts, F1–F168

**Confirmed: 157. Refuted: 10. Uncertain: 1.**

Everything not listed as refuted or uncertain below is **`confirmed`** — I located the
quoted string in the re-fetched source. A blanket caveat applies to roughly 60 of them:
"confirmed" means *the cited source says this*, not *this is true*. F105–F115 are confirmed
as Wikipedia's wording only, and Wikipedia contradicts itself repeatedly (see §7).

### Refuted — 10

- **F52 — refuted as a complete transcription.** The quoted inscription is accurate as far as
  it goes but the finder cut the final line. NYC Parks' transcription ends:
  *"...FITZ-GREENE HALLECK / **ERECTED BY / THE BRONX SOCIETY OF ARTS AND SCIENCES / MAY 29,
  1915 /**"*. If the inscription is published, publish it whole.
- **F77 — refuted in part.** True: NYC Parks has no Historical Signs text for Hunts Point
  Riverside Park and no `/history` tab. False: *"Both /history and /highlights render only
  the navigation chrome and the park data panel — there is no body text."* The main page
  carries two paragraphs the finder never read: *"Hunts Point Riverside Park is a gateway to
  the revitalized Bronx River, a major connector to the Bronx River Greenway, and a home to
  kayakers, canoers, and paddlers from across the city. This park, once an illegal dumping
  ground, has been transformed into a waterfront oasis, with a pier for fishing, and a kayak
  and canoe launch. Even the spray shower and playground takes the shape of built-in canoes,
  as kids can safely play in the 'water' on hot days."* It also carries a street address, a
  facilities list (Barbecuing Areas, Fishing, Kayak/Canoe Launch Sites, Wi-Fi Hot Spots), and
  Vital Signs: **Park Condition Score 91, Recent Investment $754K, Mapped Trees 98.** The
  "documentary gap" the finder declares does not exist. **This is the best NYC Parks prose
  available for that park and it was reported as absent.**
- **F83 — refuted.** Source's actual words: *"the park is now a riverfront oasis with safe
  access to the river for the first time in over 60 years."* The finder's "no safe access"
  is an insertion. The page is not garbled and needs no re-derivation.
- **F84 — refuted as a verbatim quote.** The finder's single quoted string does not exist.
  Actual: *"There's a new pier for fishing and a kayak and canoe launch, and the playground
  offers a canoe fountain so kids can safely play in water on hot days. The expansive green
  oval and amphitheater offer space for community gatherings and youth programs."* Substance
  is right; the quotation marks are not.
- **F102 — refuted as a verbatim quote.** Actual: *"The project was first envisioned by
  Majora Carter of The Point Community Development Corporation in the late 1990s as part of
  a $1.25 million federal transportation grant application."* Substance confirmed.
- **F113 — refuted as a verbatim quote.** Actual: *"In January 2021, over 1400 workers at the
  market arranged a strike in support of a $1-per-hour wage increase and a $0.60 hourly
  increase for healthcare benefits. This strike was the first to occur at the market since
  1986."* Substance confirmed.
- **F128 — refuted as a characterisation of the source.** See §0.1. The article's own
  placement sentence was omitted. The article also says something the finder missed and the
  author will want: *"It was the last Carnegie library built for the New York Public Library
  system and is a New York City designated landmark."*
- **F129 — refuted on hours.** NYPL's page today: **Monday CLOSED**, Tue–Fri 10 AM–6 PM,
  Sat & Sun closed. The finder published "Monday–Friday 10 AM–6 PM". Address and ZIP
  (877 Southern Boulevard, Bronx, NY 10459) confirmed.
- **F153 — refuted as an adequate rendering.** See §0.2.
- **F161 — refuted as a quote, and refuted on the bus routes.** The string *"Two IRT Pelham
  Line subway stations operate here: Longwood Avenue and Hunts Point Avenue"* does not exist
  in the article. Actual: *"The following New York City Subway stations serve Hunts Point:"*
  followed by a bulleted list. And the finder's claim that bus endpoints were "compressed by
  the fetch summarizer" is false — they are fully present in the raw wikitext, which the
  finder says it read: **Bx5** to Co-op City and Bay Plaza Shopping Center (via Bruckner Blvd
  and Story Avenue); **Bx6** and **Bx6 Select Bus Service** to Washington Heights or Hunts
  Point Cooperative Market (via Hunts Point Avenue); **Bx46** to Longwood or Hunts Point
  Cooperative Market (via Longwood Avenue and Tiffany Street). Wikipedia is still not an
  adequate source for live bus service; treat these as illustrative, not as directions.

### Uncertain — 1

- **F114 — uncertain, do not ship.** The article body says *"a renovation of Hunts Point
  Market was proposed, with an estimated cost of over $600 million"*; the state approved
  $130M in 2023, followed by $130M city and $145M federal; Mayor Adams announced the rebuild
  in December 2025. The **$635M** figure appears only inside citation titles (Bloomberg, The
  Real Deal), not in the article's prose — and those citations are about the **Produce**
  Market while the text sits on the **Cooperative** (meat) Market page. Forward-looking,
  muddled, and unstable. Omit.

### Corrections to "confirmed" facts the author must carry forward

- **F27 — confirmed, but the finder's note on it is refuted.** The 1874 annexation is **not**
  single-sourced. NYC Parks' Hunts Point Playground historical sign, which the finder never
  opened, says independently: *"In 1874, New York City, which at the time included only
  Manhattan, began to annex sections of the Bronx. Hunts Point, originally part of West Farms
  in what was then lower Westchester County, became the newest part of New York City."*
  Two independent sources. Ship it.
- **F73 — confirmed, incomplete.** Add: *"The islands themselves are closed to the public."*
- **F96 — confirmed on every stated field, incomplete on two.** Tiffany Street Pier is
  **Acreage 4.23**, Property Type **Waterfront Facility** (not omitted-and-unknown). Also
  worth having: Wikipedia's Barretto Point Park article says *"To the immediate west of
  Barretto Point Park is the Tiffany Street Pier, a recreational space that predates the
  park."*
- **F101/F103 — confirmed and refinable.** The Greenway article is more precise than the
  finder reported: *"The first section of the greenway to be built was Hunts Point Riverside
  Park, with construction begun in 2004 and completed in May 2007."* Randalls Island
  Connector *"was completed in 2016."*
- **F133 — confirmed, with a wart.** The site renders the strapline both as *"Developing
  Leadership in Hunts Point Since 1994"* and, in the hero, *"Developing Leadership in Hunts
  Points Since 1994"* (sic). Use the correct spelling; do not quote the typo.
- **F140 — confirmed, but STALE.** *"The Hunts Point Fish Parade & Arts Festival 2026 /
  Saturday, June 20th from 12-4PM"* is on the site, and that date has passed. Publish the
  festival as an annual June event run by THE POINT CDC; publish no date.
- **F159 — confirmed in substance, misquoted in form.** Actual: *"Located at Longwood Avenue
  and Southern Boulevard in the Longwood neighborhood of the Bronx."*
- **F166–F168 — confirmed, but Bronxlandia's site is stale.** Its event listings carry
  day-and-month with no year ("MAY 23 FRI") and the copyright line reads "© 2025". Publish
  the venue and its address; publish no event dates.
- **F118 — confirmed, with a sourcing wrinkle.** Wikipedia lists the monastery's official
  website as **opbronx.org**, not corpuschristimonastery.org. Both may be the community's;
  I could not check without WebSearch. Cite the site you actually read.

---

## 7. Verdicts on the conflicts, C1–C12

**All 12 confirmed as real conflicts.** I reproduced both sides of each. Resolutions where
one side is clearly better:

- **C1** confirmed. 690 acres (neighborhood, DCP) vs 1,124 acres (NTA BX0201). Different
  geographies. Use 690 for "the neighborhood"; never mix them in one sentence.
- **C2** confirmed. Use Wikipedia's reconciling formulation: *"the Wecquaesgeek, a
  Munsee-speaking band of Wappinger people."* NYC Parks' "Weckquaesgeek" is a variant
  spelling; NYC Parks' Barretto Park sign spells it a third way, **"Weckguasgeek"**.
- **C3** confirmed. Seven feet (Historical Signs text) vs `H: 8'` (Monuments record). Do not
  publish a height.
- **C4** confirmed. Wikipedia's Hunts Point article says *"the {{convert|5|acre}} Barretto
  Point Park"*; NYC Parks and Wikipedia's own Barretto article both say **12.22 acres**.
  **Resolved: use 12.22.** NYC Parks is the property owner.
- **C5** confirmed. The Bruner page really does list *"Operator: New York City Department of
  Transportation"*. It also lists *"Submitted By: Bronx River Alliance/NYC Dept. of Parks &
  Rec."* **Resolved: it is an NYC Parks property (X336). Do not publish DOT as operator.**
- **C6** confirmed and worse than stated. Four figures: 0.43 (NYC Parks & Wikipedia infobox),
  1.0 (Bruner), 1.4 (Wikipedia body), 1.72 (Greenway article). **Resolved: publish 0.43 or no
  acreage at all.** The Wikipedia infobox's "established 1940" is inconsistent with the 2004
  groundbreaking — do not publish it.
- **C7** confirmed. **Resolved in favour of the awarding body:** "2009 Silver Medalist of the
  Rudy Bruner Award for Urban Excellence." The Hunts Point article's "won the 2009 Rudy
  Bruner Award for Excellence in Public Spaces" is wrong on both the medal and the award name.
- **C8** confirmed. The Riverside Park article credits *"The POINT Community Development
  Corporation's Majora Carter"*; the Greenway article credits *"Majora Carter of The Point
  Community Development Corporation"*; the Majora Carter article credits **Sustainable South
  Bronx**, founded August 2001, and I confirmed the string "Point Community" / "THE POINT"
  appears **nowhere** in the Majora Carter article. **Ship the person, not the affiliation:**
  "Majora Carter spearheaded the park." Do not assert which organisation.
- **C9** confirmed. 38 ac / six buildings / 1974 (Hunts Point article) vs 60 ac / seven
  buildings / built 1962 as a 40-acre facility (dedicated article). Both Wikipedia. **Do not
  publish acreage, building counts, revenue or dates for the markets.**
- **C10** confirmed and **understated — there are four dates, not three.** THE POINT says the
  IRT was *"erected in 1908"*; NYC Parks' **Barretto Point Park** sign says *"after the IRT
  subway was established in 1908"*; NYC Parks' **Hunts Point Playground** sign says *"after
  the IRT subway line to Manhattan was built in 1904"*; Wikipedia says the Pelham Line was
  built *"in the period following World War I"* with both stations opening **January 7,
  1919**. **Resolved: publish only the station opening date, January 7, 1919**, which is
  documented to a contemporaneous NYT source. Publish no "the subway arrived in 19xx" line.
- **C11** confirmed. Same article: lead *"founded in 1891"*, history *"Nine years later"*
  after 1880 = 1889. **Publish neither, or publish "founded 1891" attributed to Wikipedia
  and note it is the article's own lead.** Best: say "founded in the 1890s".
- **C12** confirmed. Own site 868 Hunts Point Ave; DOHMH 1200 Seneca Avenue. Unresolved.
  **No address for Boogie Down Grind.**

---

## 8. Verdicts on the neighborhood flags, N1–N8

**All 8 confirmed** as correctly flagged. N1 is upgraded from "flag" to **settled** — see
§0.1 and §1; the library is in Longwood by the finder's own primary source, and the "single
most consequential boundary question in this research" was already answered in a sentence the
finder had in front of it.

---

## 9. Verdicts on the dead ends, D1–D10

**Confirmed: 2. Refuted: 1. Uncertain: 7.**

- **D1 confirmed.** I reproduced the identical 200/200 budget message.
- **D7 confirmed.** `nycgovparks.org/parks/hunts-point-landing` returns **HTTP 404** to my
  fetcher too.
- **D8 refuted in part.** Correct for Tiffany Street Pier (its main page genuinely has no
  body text). **Wrong for Hunts Point Riverside Park** — see F77.
- **D2, D3, D4, D5, D6, D9 uncertain.** I did not re-test WebFetch against nycgovparks, the
  failed market domains, huntspoint.com, huntspointproduce.com, the thepoint.org 404 paths,
  or the Wikipedia rate limit. Nothing depends on them and I will not confirm what I did not
  check. **D4 (huntspoint.com is a New Hampshire meat retailer) is the one worth a later
  pass's time to re-verify, because a careless author could cite it.**
- **D10 uncertain, and partly overstated.** No LPC report was retrieved, true. But the
  primary sources are *identified*, not missing: Wikipedia's ABN article cites the LPC
  designation report directly — *"American Bank Note Company Printing Plant, February 5,
  2008, New York City Landmarks Preservation Commission, Designation List 400, LP-2298"* —
  and the article body states *"The New York City Landmarks Preservation Commission
  designated the site as a New York City landmark in 2008."* The Hunts Point article cites an
  LPC press release for the library. A later pass should fetch
  `nyc.gov/html/lpc/downloads/pdf/reports/American_Bank_Note .pdf`.

---

## 10. Verdicts on the candidate places, P1–P21

**Confirmed: 17. Refuted: 1. Uncertain: 3.**

| # | Place | Verdict | Ruling |
|---|---|---|---|
| P1 | Joseph Rodman Drake Park & Enslaved African Burial Ground | **confirmed** | In Hunts Point. **Address corrected** — the finder's "Hunts Point Ave / Oak Point Ave / Longfellow Ave area" was a guess; Parks says *"Oak Pt. Ave. bet. Hunts Pt. Ave. and Longfellow Ave."* X015, 2.49 ac. Richest and best-sourced site here. **Publishable.** |
| P2 | Barretto Point Park | **confirmed** | In Hunts Point. X307, 12.22 ac, opened 2006. **Publishable.** |
| P3 | Hunts Point Riverside Park | **confirmed** | In Hunts Point. X336, 0.43 ac. Parks page has usable prose (see F77). **Publishable.** |
| P4 | Tiffany Street Pier | **confirmed** | In Hunts Point. X304, 4.23 ac, Waterfront Facility, sole facility "Fitness Equipment", no history text. **Publishable but thin** — a pier with a view, nothing more. |
| P5 | Hunts Point Cooperative Market | **confirmed as located here; not publishable as a destination** | Wikipedia-only, contradicts itself (C9), no official site resolves, **no public-access source**, private security force. Background prose only, attributed. No address, no hours, no acreage. |
| P6 | New York City Terminal Produce Market | **confirmed as located here; not publishable as a destination** | Same. Wikipedia's figures carry the source's own staleness marker *"as recently as 1998"*. |
| P7 | New Fulton Fish Market | **confirmed as located here; not publishable as a destination** | Same. Opening date November 14, 2005 and $85M cost are solid; 400,000 sq ft (dedicated article) vs 450,000 (Hunts Point article) — publish neither. |
| P8 | Corpus Christi Monastery | **confirmed** | In Hunts Point. **1230 Lafayette Ave., Bronx, NY 10474.** **Cloistered — not visitable.** No hours, no Mass schedule, no architect, no build date, no landmark status. Address and identity only. |
| P9 | American Bank Note Company Printing Plant | **confirmed** | In Hunts Point per the article's own words. **1201 Lafayette Avenue.** Kirby, Petit & Green; 1909–1911; Gothic-inspired; NYC landmark 2008. Now a charter school and HRA offices — **exterior only.** No NRHP listing (verified absent). |
| P10 | THE POINT CDC | **confirmed** | **940 Garrison Ave., Bronx, NY 10474.** Mon–Fri 10:00 am–6:00 pm, Sat & Sun closed. Self-sourced — the mission and reputation text is the organisation's own and must be attributed, never voiced as the guide's assessment. **Publishable.** |
| P11 | THE POINT — Riverside Campus | **confirmed** | **1391 Lafayette Ave, Bronx, NY 10474.** Footer-only; no hours, no description. Address as a second location, nothing more. |
| P12 | Hunts Point Fish Parade & Arts Festival | **confirmed as a recurring event** | Real, annual, June, run by THE POINT CDC, 20th anniversary in 2023 (theme "Rooted Visions"). **The only dated instance on the site — Saturday, June 20th, 2026 — has passed.** Publish no date. Publish no founding year. |
| P13 | Hunts Point Avenue station (6) | **confirmed, with a boundary caveat** | Wikipedia: *"in the Longwood and Hunts Point neighborhoods."* ADA-accessible since November 18, 2014 ($17.8M, three elevators). Squire Vickers mosaic friezes in blue/grey/beige with pale pink; *"The large identifying plaques show 'H P'."* Dark green I-beam columns. Excellent concrete detail — **publishable**, qualified. |
| P14 | Boogie Down Grind Café | **uncertain (address); confirmed (existence, non-DOHMH source)** | Own site verified live. Not DOHMH-only, so **prose is permitted**. But **no publishable address** (C12). Hours *"Mon–Fri 7AM–4PM • Wed until 10PM • Sat 11AM–4PM"* are the business's own — attribute, and note no Sunday is listed. The "What People Are Saying" Google/Yelp excerpts are marketing copy the business chose about itself — **never quote them.** |
| P15 | Bronxlandia | **confirmed** | **910 Hunts Point Avenue, Bronx, NY 10474** — own site and DOHMH agree, the only business here with two concordant sources. Self-described *"Live Events Venue in The South Bronx"*, bookable rehearsal/event space. Event dates stale. **Publishable.** |
| P16 | Hunts Point Landing | **uncertain** | Single-sourced (Greenway Wikipedia); Parks 404 reproduced. Opened 2012; *"at the end of Farragut Street, which was partially demapped"*; 1 or 1.5 acres "by various sources"; granite reused from the Willis Avenue Bridge. Ship attributed or omit. |
| P17 | Barretto Park | **confirmed** | Distinct from Barretto Point Park — X248, **0.12 acres**, *"Barretto St bet. Randall Av and Spoffard Av."* Tiny. Has its own historical sign (Coster Street named for Barretto's wife Julia Coster). **Publishable**; do not conflate with P2. |
| P18 | Hunts Point Playground | **confirmed** | X113, 0.72 ac, *"Spofford Av bet. Faile St and Hunts Point Av."* **Carries the fullest NYC Parks neighborhood history of any site here** — 1874 annexation, the Fox/Tiffany/Leggett landowners, the 1929–30 acquisition, the 1954 playground, the 1986 Blumberg & Butter restoration, Community Parks Initiative 2015. The finder never opened it. **Publishable and undervalued.** |
| P19 | Julio Carballo Fields | **confirmed** | X260, 3.35 ac, *"Manida St bet. Spofford Av and Lafayette Av."* Named for Julio Carballo (1950–1996), founder of the Carballo Youth Baseball League. **Publishable.** |
| P20 | Hunts Point Library | **REFUTED as a Hunts Point place** | **Longwood.** Wikipedia: *"at 877 Southern Boulevard in Longwood, near Hunts Point."* ZIP 10459. Address and building history are publishable **only on a page that says Longwood.** Hours corrected: **Mon closed**, Tue–Fri 10 AM–6 PM, Sat–Sun closed. |
| P21 | Hunts Point Palace | **uncertain** | One clause, one source, no address, no dates, survival unknown. Ship as one attributed sentence in past tense or omit. |

---

## Headline count

- **Claims adjudicated: 219** — 168 facts (F1–F168), 21 candidate places (P1–P21),
  12 source conflicts (C1–C12), 8 neighborhood flags (N1–N8), 10 dead ends (D1–D10).
- **Confirmed: 196.**
- **Refuted: 12.**
- **Uncertain: 11.**
- **Places that survive as publishable: 15** — 13 with an exact street address (Drake Park,
  Barretto Point Park, Hunts Point Riverside Park, Tiffany Street Pier, Barretto Park, Hunts
  Point Playground, Julio Carballo Fields, Corpus Christi Monastery *(address only, not
  visitable)*, American Bank Note Printing Plant *(exterior only)*, THE POINT CDC, THE POINT
  Riverside Campus, Bronxlandia, Hunts Point Avenue station *(qualified as Longwood/Hunts
  Point)*); plus **Boogie Down Grind Café in prose with NO address**; plus **the Fish Parade
  as an annual event with NO date**.
- **Not publishable as destinations: 6** — the three markets (no public-access source), Hunts
  Point Landing (single-sourced, no Parks page), Hunts Point Palace (one clause), Hunts Point
  Library (Longwood, not Hunts Point).
- **Barred from prose entirely: 33** DOHMH-only businesses. My ruling in §2 goes further than
  the project rule: because most of their names contain the category noun, **omit all 33.**
