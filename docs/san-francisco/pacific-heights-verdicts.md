# Pacific Heights — Verifier's verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/pacific-heights-finder.md`.
Every ruling below is binding on the author. Where a ruling says REWRITE, the wording in
**bold quotes** is the replacement text and is to be used verbatim.

**Counts: 21 PUBLISH · 18 REWRITE · 23 DROP.**
**Tier: GUIDE, on 39 surviving places.**
**Designation identifiers: 40 of 42 survived re-fetching. 2 failed.**
**16 subjects escalated to the arbitrator.**

---

## 0. What I re-fetched

| Source | Result |
|---|---|
| DataSF `97yj-54sx` Article 10 landmarks | 200, **370 rows** — matches the finder's count exactly |
| DataSF `63x5-g3m4` Historic Districts | 200, 204 rows |
| DataSF `gtr9-ntp6` Recreation & Parks Properties | 200, 255 rows |
| NPS `nrhp_locations` MapServer layers 0 and 1 | 200; **69 features** in a wider envelope than the finder used (−122.4700/37.7800/−122.4100/37.8050), plus per-refnum and city-wide queries (191 SF rows) |
| `haas-lilienthalhouse.org/house-tours` and `/walking-tours` | 200 |
| `bpatisserie.com`, `spqrsf.com`, `pizzeriadelfina.com`, `hoteldrisco.com/contact/` | 200 |
| `sfswedenborgian.org/contact/`, `audium.org/contact`, `sherithisrael.org`, `stdominics.org` | 200 |
| `browserbooks.com`, `janeonfillmore.com`, `jacksoncourt.com`, `theelitecafe.com`, `lamedsf.com` | dead — see §4 |
| Wikipedia wikitext via `api.php` for 9 articles | 200 |

**Every one of the 28 in-zone Article 10 landmark numbers re-fetched clean** — number, name,
address and designation year all matched the finder's table row for row. So did all 14
adjacent-zone numbers it recorded to stop re-derivation. That is unusually good work and it is
the reason most of this file is PUBLISH rather than DROP.

### 0a. The taken-slug defect is real
`.superpowers/taken_slugs.py` line 11 globs `priv/seed_data/rome/*.json` only and reports
"1279 places already owned across 31 shipped files" — Rome only. I ran my own scan over
`priv/seed_data/**/*.json` (3,921 places) plus `lib/**/*.ex` (686 slugs) and confirm the finder's
conclusion: **no Pacific Heights candidate is taken.** The only near-misses are unrelated —
`westbourne-playground` (Far Rockaway), `lafayette-grand-cafe-bakery` (NoHo),
`the-fillmore-detroit` (Comerica Park seed), `the-william-vale` (Williamsburg),
`house-at-175-belden-street` (City Island). `priv/seed_data/san_francisco/` contains only a
`.gitkeep`; no SF zone has shipped. The Oracle Park seven are all Mission Bay and touch nothing
here.

---

## 1. THE TWO IDENTIFIERS THAT FAILED — do not write either

### 1a. NRHP 82002247, "Fillmore-Pine Building", 1946 Fillmore Street — **FABRICATED. DROP.**
The finder wrote that this was "**Confirmed twice**: NPS ArcGIS `nrhp_locations` MapServer layers
0 and 1 … and Wikipedia." It is confirmed by neither.

- Not in my envelope query, which is **wider than the finder's** on all four sides and covers
  1946 Fillmore (≈37.7873, −122.4337) comfortably.
- Direct query `NRIS_Refnum='82002247'` on layer 0: **0 features.** On layer 1: **0 features.**
- City-wide query `City='San Francisco' AND State='CALIFORNIA'` returns 191 rows. The only two
  containing "Fillmore" are Calvary Presbyterian (78000755) and Sacred Heart Parish Complex
  (100001665). There is no listing at 1946 Fillmore Street under any name.

This is the single worst thing in the finder file, because a reference number looks citable.
**Delete the Fillmore-Pine Building entirely.** It is not a candidate and it carries no register
claim of any kind.

### 1b. NRHP 100012857, Kinmon Gakuen — **UNCONFIRMABLE. DROP the NRHP claim.**
Direct refnum query on both layers: **0 features.** Name query `RESNAME LIKE '%Kinmon%'` across
California: **0 features.** The finder flagged this honestly and its instinct was right.
**San Francisco Landmark No. 288, designated 2019, is solid** and came straight out of
`97yj-54sx`. If Kinmon Gakuen is written at all it carries the landmark number and nothing else —
and see §5, it is probably Japantown's.

### 1c. The finder was WRONG in the other direction on 73000444 — **UPGRADE**
The finder wrote that "Building at 1735–1737 Webster Street, 73000444 … did not come back in the
NPS envelope query, which covered its coordinates. Treat as unconfirmed."

It came back for me twice. Envelope query returns it; direct query
`NRIS_Refnum='73000444'` on layer 0 returns exactly one feature:
`RESNAME='Building at 1735--1737 Webster Street'`, `Address='1735--1737 Webster St.'`,
`CertDate='03/08/73'`, `City='San Francisco'`. **The reference number is good.** The finder's
own envelope covered the coordinate, so the miss was in its query, not in the register. The
subject is still a Japantown straddle (§5) — but the identifier is not the reason to hesitate.

---

## 2. DESIGNATION CLAIMS — the exact sentences that are cleared to publish

Every claim below re-fetched clean. Where Wikipedia carries a **precise designation date** and
DataSF carries only a year, I have used the precise date; it is better and it is cited.

| Subject | Cleared sentence (verbatim) |
|---|---|
| Haas-Lilienthal House | **"San Francisco Landmark No. 69, designated on 4 January 1975. Listed on the National Register of Historic Places, reference number 73000438, on 2 July 1973."** |
| Spreckels Mansion | **"San Francisco Landmark No. 197, designated on 9 June 1990."** |
| Whittier Mansion | **"San Francisco Landmark No. 75, designated on 8 November 1975. Listed on the National Register of Historic Places, reference number 76000524, on 26 April 1976."** |
| Bourn Mansion | **"San Francisco Landmark No. 38, designated in 1971."** |
| Atherton House | **"San Francisco Landmark No. 70, designated in 1975. Listed on the National Register of Historic Places, reference number 79000527, on 31 January 1979."** |
| Tobin House | **"San Francisco Landmark No. 260, designated in 2008. Listed on the National Register of Historic Places, reference number 09000806, on 5 October 2009."** |
| Calvary Presbyterian Church | **"San Francisco Landmark No. 103, designated in 1978. Listed on the National Register of Historic Places, reference number 78000755, on 3 May 1978."** |
| Clay Theatre | **"San Francisco Landmark No. 302, designated on 6 May 2022."** |
| St. Brigid's Church | **"San Francisco Landmark No. 252, designated in 2006."** |
| Talbot-Dutton House | **"San Francisco Landmark No. 57, designated in 1973."** |
| Leale House | **"San Francisco Landmark No. 45, designated in 1972."** |
| Ellinwood House | **"San Francisco Landmark No. 207, designated in 1994."** |
| Gibbs Residence and Caretaker's Cottage | **"San Francisco Landmark No. 203, designated in 1993."** |
| Chambers Mansion | **"San Francisco Landmark No. 119, designated in 1980."** |
| Richard E. Queen House | **"San Francisco Landmark No. 198, designated in 1990."** |
| Health Sciences Library | **"San Francisco Landmark No. 115, designated in 1980."** |
| Edward Coleman House | **"San Francisco Landmark No. 54, designated in 1973."** |
| Isaac Wormser House / John C. Coleman House | **"San Francisco Landmark No. 53, designated in 1973."** |
| Lilienthal-Orville Pratt House | **"San Francisco Landmark No. 55, designated in 1973."** |
| William Vale House | **"San Francisco Landmark No. 168, designated in 1984."** |
| Madame C J Walker House | **"San Francisco Landmark No. 211, designated in 1999."** |
| Ortman-Shumate House | **"San Francisco Landmark No. 98, designated in 1977."** |
| Congregation Sherith Israel | **"Listed on the National Register of Historic Places, reference number 10000114, on 31 March 2010."** |
| C. A. Belden House | **"Listed on the National Register of Historic Places, reference number 83001229, on 11 August 1983."** |
| Dallam-Merritt House | **"Listed on the National Register of Historic Places, reference number 84001185, on 19 April 1984."** |
| The Real Estate Associates (TREA) Houses | **"Listed on the National Register of Historic Places, reference number 85000705, on 4 April 1985."** |
| Webster Street Historic District | **"San Francisco Landmark District No. 2, designated under Article 10 of the Planning Code by Ordinance 166-81 on 8 April 1981."** |

### 2a. Notes the author must respect

**Webster Street district number.** The number "2" comes from Wikipedia's districts table only;
DataSF `63x5-g3m4` gives `a10 = Listed`, `dateadop = 1981-04-08` and `origin = Ord. 166-81` but
no number. I have therefore written the ordinance into the cleared sentence — it is a
first-party identifier from the city's own dataset and it carries the claim on its own if the
number is ever challenged. **Do not write the district number without the ordinance.**

**Landmark No. 65 is duplicated in the source dataset.** `97yj-54sx` returns No. 65 twice:
Trinity Episcopal Church, 1668 Bush Street, 1974 — and Trinity Presbyterian Church, 3261 23rd
Street, 1984. This is a defect in the city's data. Trinity Episcopal is a Cathedral Hill / Western
Addition orphan and is not this page's anyway, but the collision is recorded so nobody trips on it.

**Bare-claim ban applies to the finder's own §2b list.** Pacific Heights Historic District, Upper
Fillmore Neighborhood Commercial, Raycliff Terrace, Normandie Terrace, Japantown Community &
Cultural, Presidio Heights, California Street — I re-pulled all of them and every one returns
`a10 = No`, `nr = No`, `cr = Eligible`. **Eligible is not designated. No register word attaches to
any of them.** The finder is correct and emphatic on this and it is upheld.

**Confirmed absent from both registers** — I searched `97yj-54sx` by name and by street number,
and the 191-row NPS city list, for each: Congregation Sherith Israel (Article 10 only — its NRHP
listing is real), St. Dominic's, Hotel Drisco, Lafayette Park, Alta Plaza Park, the Lyon Street
Steps, Hamlin School, Convent & Stuart Hall, Town School, Raycliff Terrace, Normandie Terrace,
Vedanta, Audium, Swedenborgian (Article 10 only — its NHL listing is real), 2640 Steiner.
**None of these may carry a protection claim in any form.**

---

## 3. RULINGS, ENTRY BY ENTRY

### PUBLISH — 21

**Presidio Library Mini Park** — `park` — 3150 Sacramento Street. 0.679 acres.
Cleaner than the finder claimed: the RecPark row returns **all four** attributions as Pacific
Heights — `analysis`, `mons`, `realtor` **and** `planning` — not the three it listed. No caveat
needed.

**Atherton House** — everything re-fetched: built 1881–1882, Queen Anne with Stick/Eastlake,
horizontal lines, a clipped gable and a short tower; architect thought to be John Marquis;
renumbered from 1950 to 1990 California Street in 1900; bought 1923 by the architect Charles J.
Rousseau, who subdivided it into 13 apartments; his widow Carrie lived there with fifty cats until
her death in 1974. Two owners the finder missed and may be added: Edgar Mills, brother of Darius
Ogden Mills of the Bank of California, and from 1908 George Chauncey Boardman.

**b. patisserie** — 2821 California Street at Divisadero, San Francisco CA 94115, (415) 440-1700.
Hours re-fetched off the shop's front page word for word: **Wednesday to Friday 8–4, Saturday and
Sunday 8–5, closed Mondays and Tuesdays.** The sister restaurant at 2794 California Street is on
the page but unnamed; write it as "a sister restaurant at 2794 California Street" or not at all.

**The thirteen bare-number Article 10 houses** — Tobin, Talbot-Dutton, Leale, Ellinwood, Gibbs
Residence and Caretaker's Cottage, Chambers, Richard E. Queen, Edward Coleman, Isaac Wormser /
John C. Coleman, Lilienthal-Orville Pratt, William Vale, Madame C J Walker, Ortman-Shumate.
Each publishes as **name + street address + the cleared designation sentence from §2 + the fact
that it is a private residence for which no source states opening hours.** No biography, no
architect, no anecdote unless the author opens `LM<N>.pdf` first. The finder recorded no
biography for these and that restraint is upheld.

**Health Sciences Library, 2395 Sacramento Street, San Francisco Landmark No. 115, designated
1980** — **RESTORED BY ME.** The finder put it in its §2a table and then silently dropped it from
§3; there is no ruling against it and no straddle. It is an in-zone numbered landmark on
Sacramento Street and it belongs on the page.

**C. A. Belden House** (2004–2010 Gough), **Dallam-Merritt House** (2355 Washington), **The Real
Estate Associates (TREA) Houses** (2503, 2524, 2530 and 2536 Clay) — NRHP references all three
re-fetched clean against NPS. The TREA connection to Cottage Row publishes as history even though
the Cottage Row district itself goes to Japantown.

**St. Brigid's Church**, 2151 Van Ness Avenue — No. 252 confirmed. Thin, as the finder said, but
a numbered landmark on a named street is a legitimate short entry. Write the designation, the
address, and that it no longer functions as a parish. Nothing else without `LM252.pdf`.

### REWRITE — 18

**Haas-Lilienthal House.** Tour block re-fetched and confirmed exactly: 2026 docent-led tours on
select Wednesdays (12:30pm, 2pm) and Saturdays (noon, 1pm, 2pm); general admission $10; children
12 and under free; SF Heritage members free; allow at least one hour; 2007 Franklin Street, San
Francisco CA 94109; (415) 441-3000. Three corrections:

- The finder wrote "a lift serves the upper floors". The site says something different. Use:
  **"The house is wheelchair accessible at ground level through the tour entrance, and an
  elevator is available for moving between floors."**
- **DROP "11,500 square feet."** Not in the Wikipedia article and not on the operator's site. I
  looked for it and there is no match. It is unsourced.
- The 1928 Gardner Dailey addition is on Wikipedia but carries a `{{Citation needed}}` tag. Write
  it as **"A 1928 addition of living quarters over a garage is attributed to the architect Gardner
  Dailey."** or leave it out.

The 1906 sequence is confirmed and publishes: **"The house withstood the 1906 earthquake with
only slight damage. The Haas family watched the fire from the roof and left to camp in Lafayette
Park; three days after the earthquake the fire was stopped at Van Ness Avenue."**
The 2012 National Treasure naming publishes because it names its body: **"Named a National
Treasure by the National Trust for Historic Preservation in 2012."** The donation publishes:
**"The house was given to the Foundation for San Francisco's Architectural Heritage, now San
Francisco Heritage, in 1973."** The finder's ban on "the one Victorian open to the public" is
upheld — Wikipedia's version of that sentence is a comparison class and does not publish.

**Lafayette Park.** DataSF re-fetched to the decimal: **12.48 acres (543,742 square feet)**,
2101 Washington Street, and all four attributions Pacific Heights. Amenities confirmed on
Wikipedia: two tennis courts, a children's playground, an off-leash dog area, restroom facilities
and a picnic area, bounded by Washington, Sacramento, Gough and Laguna.

The finder was right to distrust the 1936 date but wrong about why. **The Lafayette Park article
contains no mention of 1906 at all** — I searched it and there is no match. The 1906 camping
account comes from the Haas–Lilienthal House article, not from this one, and the 1936 "created"
date is sourced to a dead SF RecPark project-status PDF. Ruling: **write neither date.** Write
the acreage, the boundary streets and the amenities.

Two facts the finder missed and which are better than what it had, both from the SF Rec & Park
citation in the article's infobox: the park is **open all year, 5am to midnight**, and it gives
views toward the Marina district, Alcatraz Island, San Francisco Bay, Buena Vista Park and Twin
Peaks. The hours publish. The views publish as a statement about sightlines.

**Alta Plaza Park.** DataSF re-fetched: **12.94 acres (563,451 square feet)**, 2501 Jackson
Street, four-way Pacific Heights. Wikipedia confirms three hard-surface tennis courts, a small
playground at the centre, a large grass park on the northern half and terraced lawns on the
southern half; bordered by Jackson north, Clay south, Steiner east, Scott west, with the plaza
cutting off the east–west continuation of Washington Street and the north–south continuation of
Pierce Street.

**HALS No. CA-16 is confirmed** — it is in the article's external-links block as
`{{HALS |survey=CA-16 |id=ca3613 |title=Alta Plaza, San Francisco, San Francisco County, CA}}`.
It publishes, and it must be written as what it is: **"Recorded by the Historic American
Landscapes Survey as HALS No. CA-16."** Do not let it drift into sounding like a protection.

The film claim needs one word changed. The article says "the steps at Alta Plaza", not the
terraced south steps. Use: **"The steps at Alta Plaza appear in the 1972 film *What's Up, Doc?*.
They were used without permission and were badly damaged during the chase sequence, and the damage
can still be seen."** Also available and missed: established 1888, and open all year 5am to
midnight.

**Spreckels Mansion.** Re-fetched and almost all of it holds: 2080 Washington Street, completed
c.1912–1913, three storeys, French Baroque château manner, George Adrian Applegarth (1876–1972)
and Kenneth A. MacDonald Jr. of MacDonald & Applegarth; Alma went to Europe to stock the house,
met Auguste Rodin on the same trip and brought thirteen of his bronzes back for the 1915
Panama–Pacific International Exposition; **eight Victorian homes were moved to Jackson and
Washington Streets** to clear the combined lots; Danielle Steel added a very tall hedge; the
exterior served as the nightclub in *Pal Joey* (1957).

Two changes. The 55 rooms are hedged in the source and must stay hedged: **"The house is reported
to have 55 rooms and a Louis XVI ballroom."** And the finder's "the seed of the Legion of Honor"
overstates its source, which says the bronzes "later inspired the creation of" it. Use:
**"The Rodin bronzes she brought back later inspired the creation of the California Palace of the
Legion of Honor."** The finder's "divided into four units after 1968" is not established — the
sentence I retrieved is truncated at "After 1968, the mansion was divide…". Write **"divided into
apartments after 1968 and later restored to a single residence"** and drop the number.
"Faces Lafayette Park across Washington Street" is upheld — the source says "located across the
street from Lafayette Park", and a named street between two named things is an allowed adjacency.

**Whittier Mansion.** The finder did not notice that the money is unsourced. The $152,000 build
cost, the $400,000 sale price, the 32 monthly instalments and the August 1896 occupation **all sit
inside a `{{Citation needed}}` block** in the article. Drop all four figures or find a source.

What is heavily sourced — San Francisco Chronicle, April 1941, and the HABS record — is the German
Reich transaction, and the finder's version of it overstates. Wikipedia's body says the buyer was
the Nazi consulate; only the uncited lead calls it a headquarters. Use:
**"On 29 April 1941 the mansion's title was transferred to the German Reich, which paid $44,000
in cash for it and used it as its consulate. The California Historical Society occupied the
building later."** Drop "West Coast headquarters of the Nazi Party."
Drop "purported to be haunted" — it is sourced to a 1989 popular paperback and adds nothing.
The finder's ban on "one of few buildings to survive the 1906 Earthquake" is upheld.

**Bourn Mansion.** The designation re-fetched clean and the Willis Polk attribution is safe. The
9,762 sq ft / 28 rooms / 14 fireplaces / 2011 retrofit / 2012 renovation figures I did not
independently confirm. Write the designation, the address, the 1896 build, William Bowers Bourn II
and Agnes Moody Bourn, Willis Polk, the red clinker brick and the English-townhouse manner. **Hold
the room and fireplace counts until the author has re-read the article.** Note the dataset spells
the name "Bourne"; the building is "Bourn Mansion".

**Webster Street Historic District.** Use the §2 sentence with the ordinance. The DataSF
description is better than the finder's and publishes: **"The district takes in 25 Italianate
houses built between 1878 and 1880, sharing a vertical emphasis, angled bay windows and a dominant
cornice line."** Wikipedia's table calls it "3 Blocks, 25 Parcels" and places it "in the Western
Addition"; DataSF puts the polygon in Pacific Heights. Write the block and parcel counts if you
like; **do not write either neighborhood name into the entry** — the address does that work.

**Congregation Sherith Israel.** Address and phone re-fetched off the congregation's own site:
2266 California Street, San Francisco CA 94115, (415) 346-1720. Historic Sanctuary Tours, the
Czech Torah, the seismic retrofit and the organ all have their own pages there, so they publish as
identity.

**DROP the 1851 founding year.** The finder argued it "does publish because it is on the National
Register nomination and not merely on the congregation's own site." I checked. Wikipedia's
founding narrative cites `sherithisrael.org` and Wikipedia itself tags that citation
`{{self-published inline}}`; the infobox `established = 1851` carries no inline citation at all. I
fetched the nomination draft at `ohp.parks.ca.gov` — it returns HTTP 200 and 296KB of PDF, but its
text layer would not extract, so I could not read 1851 out of it. That leaves a trading-duration
claim resting on the congregation's own site, which is exactly the thing the rule forbids. It does
not publish unless the author reads the nomination and quotes it.

The graft trials **do** publish, because Wikipedia attributes that sentence to the National
Register nomination form and not to the congregation: **"The synagogue was a principal site of the
San Francisco graft prosecution trials held between 1905 and 1908."**

The finder under-researched this building badly. All of the following is in the article, sourced,
and is exactly the kind of material this programme wants: architect **Albert Pissis**,
École des Beaux-Arts trained; the site at the north-east corner of California and Webster bought
on 8 September 1902; ground broken 8 October 1903; cornerstone laid 22 February 1904; sanctuary
consecrated 24 September 1905; cost $250,000; the building stands 140 feet above California
Street; the dome is 60 feet in outside diameter; the interior holds 20,000 square feet, 3,500
organ pipes and seating for 1,385. Those are dates, counts and measurements. Use them.
Both superlatives the finder flagged are correctly banned, and "one of San Francisco's most
prominent architectural landmarks" is `{{Citation needed}}` on Wikipedia as well as being a
ranking.

**Calvary Presbyterian Church.** Both identifiers re-fetched clean. The congregational chronology
(founded 23 July 1854; Bush Street 14 January 1855; Union Square 16 May 1869; present building
1901; first Fillmore service Thanksgiving Day 1902; dedicated 7 February 1904; the 1906
sheltering of St. Luke's Episcopal, Old First Presbyterian and Temple Emanu-El and the Superior
Court in the basement) I did not re-read line by line — the author must, before writing it. The
"one million bricks" reuse figure in particular should be checked against the article. The
finder's ban on "the largest Protestant church building on the west coast" is upheld.

**St. Dominic's Catholic Church**, 2390 Bush Street. The parish site re-fetched: it carries
Docent Tours, Upcoming Tours, a Twilight Tour hosted by St. Dominic's Docents, a Shrine of St.
Jude, a columbarium, a Mass Times page and a "Sermon in Stone" page. All of that publishes as
identity. I independently confirmed the finder's negative: **no Article 10 row by name or by
street number, and no NRHP row.** Write it with no protection claim of any kind. The parish
history page is an operator claim about founding — **do not use it for a trading-duration
statement.**

**Clay Theatre.** The finder's truncated February 2024 fact is now resolved and it changes the
entry. Confirmed: opened c.1913–1914 as The Regent, a nickelodeon often showing Mary Pickford
films; The Avalon from 1931; The Clay International from 1935 under Herbert Rosener, showing
foreign film; the exterior heavily modified in the 1950s, with the ticket booth moved and the
archway entrance changed; 325 seats latterly; part of the Landmark Theatres chain from 1991;
closed January 2020.

Then: **"In February 2024 the theatre and the adjacent building were bought by investment trusts
linked to Neil Mehta. In June 2025 the Upper Fillmore Revitalization Project announced plans to
reopen the Clay as a 200-seat repertory cinema after renovations to upgrade its facilities and
improve fire safety and accessibility. The building is not open, and no source states opening
hours."**

Drop the two 1935 film titles — I could not find them in the article. Drop "first theater in the
city dedicated to foreign film"; the finder is right that it is a comparison class.

**Convent & Stuart Hall (Schools of the Sacred Heart)**, 2222 Broadway — publishes as an
institution at an address with no designation. The finder's naming trap is real and important:
the James C. Flood Mansion at 1000 California Street is Nob Hill's, is **San Francisco Landmark
No. 64 (1974)** and is **NRHP 66000230 with `Is_NHL = X`** — I confirmed both. Two different Flood
houses. **Do not merge them and do not let No. 64 or the NHL flag anywhere near 2222 Broadway.**

**The Hamlin School**, 2120 Broadway. Publishes as an institution: a private day school for girls,
K–8, founded by Sarah Dix Hamlin, who bought the Van Ness Seminary at 1849 Jackson Street in April
1896; the school was renamed in 1898, moved to 2230 Pacific Avenue in 1907, and Hamlin died 25
August 1923. No designation. **Do not carry over Wikipedia's "near Pacific Heights"** — that is a
hedge in the source, and orientation by impression here. Give the address.

**Broadway between Divisadero and Lyon.** Publishes as an `attraction` on the strength of the SF
Heritage self-guided Broadway walking tour, whose measurement I re-fetched: **"approximately 15
blocks (0.8 miles) of North Pacific Heights", described by SF Heritage as moderate with a few
hills.** That is a sourced measurement and it survives the proximity ban. The finder's ban on
"Billionaires' Row", "the Gold Coast" and every wealth formulation is upheld — SF Heritage's own
blurb calls the neighborhood "one of the most expensive and wealthiest neighborhoods in San
Francisco" and **that sentence must not travel**.

**Fillmore Street.** Everything re-fetched. The counterbalance is exactly as the finder had it and
it is the best fact on the street: **"Streetcar service on Fillmore began in July 1895, and the
following month the Fillmore Counterbalance was installed to work the 24.54 percent grade between
Green Street and Broadway."** Sourced in the article to the *Street Railway Journal*, June 1896.
Also confirmed: the Western Addition was platted in the 1860s; the area acquired the name "The
Fillmore" in the 1880s; decorative arches lined the intersections between 1907 and 1943 and were
removed for scrap for the war effort. One caution the finder missed — **the Millard Fillmore
namesake sentence carries a `{{Citation needed}}` tag.** Write it as an attribution or not at all.
I did not confirm the 22 Fillmore bus claim; check it or drop it. The boundary care in the
finder's note is upheld: this page's Fillmore is the blocks between roughly Bush and Broadway,
the Fillmore Auditorium is Western Addition's and Marcus Books is Japantown's.

**SPQR** — 1911 Fillmore Street, San Francisco CA 94115. Re-fetched: à la carte or a $102
four-course menu seven days a week, 5–9pm; a $69 five-course pasta tasting menu on Wednesdays and
Thursdays, 5–9pm; online reservations for parties of up to six, via Resy; **corkage $40 per
750ml bottle with a two-bottle maximum**, which the finder had as "corkage stated on site" and
which can now be written. Add the ZIP. **The site's "ten-time recipient of a Michelin star", the
2014 Food & Wine "Best New Chef", the James Beard nomination and "the very highest emblem of
what's possible in contemporary Italian cuisine" are all awards or superlatives from the business
itself and none of them publish.** The finder correctly recorded none of them; hold that line.

**Pizzeria Delfina, Pacific Heights** — the finder's gap is closed. From the group's own
locations block: **2406 California Street, San Francisco CA 94115, 415.440.1189**, offering menu,
pickup and reservations. The site names exactly four locations — Burlingame, Mission District,
Pacific Heights, Palo Alto — and the self-declared "Pacific Heights" label is as good as the
finder said. **No hours are stated on the site; write none.**

**Hotel Drisco** — the finder's caution is resolved in its favour. The front page genuinely does
not carry the street number, but the hotel's own contact page does:
**2901 Pacific Avenue, San Francisco, California 94115, (415) 346-2880, reservations@hoteldrisco.com.**
That is the operator establishing its own location and it publishes. **Everything else on that
site is poison**: "Consistently rated as the #1 Hotel in San Francisco", "#1 Hotel in San
Francisco on Tripadvisor", the MICHELIN Guide One Key listings for 2024 and 2025 — all rankings
and awards from the business itself. Do not quote "a boutique Pacific Heights hideaway" either;
it is marketing. Write the address, the phone, and that it has a dining room and event space.

### DROP — 23

| # | Subject | Reason |
|---|---|---|
| 1 | SF Heritage self-guided Pacific Heights walking tour (finder's entry 2) | Not a place. It is a PDF and a Google Maps route with no location of its own. The 0.8-mile / 15-block measurement is good and survives **inside** the Haas-Lilienthal House and Broadway entries. |
| 2 | Cottage Row Mini Park | Escalated. Four-way split re-confirmed to the decimal: analysis Pacific Heights, **mons Japantown**, realtor Lower Pacific Heights, planning Western Addition. Not a wave-1 Pacific Heights place. |
| 3 | Bush & Broderick Mini Park | 0.195 acres, and the finder reported three of the four attributions. The fourth is `planning = Western Addition`. Three of four are not Pacific Heights proper. Too thin and too contested. |
| 4 | Ohabai Shalome / Bush Street Temple | Escalated to Japantown. No. 81 (1976) is solid; ownership is not. |
| 5 | 2640 Steiner Street (*Mrs. Doubtfire*) | The finder could not source the address and recommends dropping it. Upheld. A private residence sourced to nothing. |
| 6 | The 1990 film *Pacific Heights* | Recorded for the file only. Not filmed at a Pacific Heights address. |
| 7 | Town School for Boys | No designation, thin sourcing, nothing to write. |
| 8 | The Broadway consulate row | Upheld. The finder reached neither consulate's own site, the one consulate it could source is in another zone, and "consulate row" is an unsourced vernacular label. |
| 9 | Lyon Street Steps | Escalated. Broadway end Pacific Heights on both layers; Washington end Presidio / Presidio Heights. One object across three units, one of them a separate in-scope page. |
| 10 | Raycliff Terrace | Gated private cul-de-sac; California Register **eligible** only, so no register word; and a guide should not route readers up a private street. |
| 11 | Normandie Terrace | Same. |
| 12 | Jackson Court | Confirmed: `jacksoncourt.com` returns HTTP 200 with a **114-byte, zero-text body**. Nothing establishes that it trades. |
| 13 | Molly Stone's Markets | Chain grocer, unverified, and the finder itself calls it thin. Nothing a guide needs. |
| 14 | Browser Books | Confirmed: `browserbooks.com` redirects to `hugedomains.com/domain_profile.cfm?d=browserbooks.com`. Parked and for sale. |
| 15 | Jane on Fillmore | Confirmed: serves a "janeonfillmore.com is for sale" broker page. |
| 16 | The Elite Cafe | Confirmed: `theelitecafe.com` now serves an Indonesian online-gambling site. Closed. |
| 17 | La Méditerranée | Confirmed: `lamedsf.com` does not resolve. Status unknown, so nothing publishes. |
| 18 | Casebolt House | Escalated. See §5. |
| 19 | Swedenborgian Church | Escalated. See §5. |
| 20 | Audium | Escalated. See §5. |
| 21 | Roos House, 3500 Jackson | Presidio Heights on both layers. Not this page's. No. 56 (1973) and NRHP 09000805 both re-fetched clean and are recorded so the Presidio finder does not re-derive them. |
| 22 | Koshland House, 3800 Washington | Presidio Heights on both. No. 95 (1977) and NRHP **84001186, certified 05 January 1984** both re-fetched clean. The finder was right to prefer the NPS date over Wikipedia's 9 December 1983. |
| 23 | Paige Motor Car Co. Building, 1699 Van Ness | NRHP 83001234 re-fetched clean, but the finder itself calls it "weak", a reader would call it Van Ness, and it has no relationship to anything else on this page. |

Also correctly given away by the finder and upheld without further comment: the Colonial Dames
Octagon House, Sherman House, Metro Theater, Golden Gate Valley Carnegie Library, North End Police
Station, Allyne Park, both Vedanta temples and the former Russian consulate (Marina); the Alhambra
Theater, Engine Co. #8 and the Church for the Fellowship of All People (Russian Hill); the Fillmore
and Marcus Books (Western Addition / Japantown). Every landmark number it recorded for those
re-fetched clean.

---

## 4. Arithmetic and bookkeeping errors in the finder file

- **"Four rows in the dataset carry `landmarkno = 0`"** — then five are listed. There are **40**
  such rows corpus-wide and **five** in this area (Wolski House 3655 Clay, Russell House 3778
  Washington, National Urban League SF Chapter 2015 Steiner, Office of Dr. Carlton B. Goodlett
  1843–1849 Fillmore, Congregation Emanu-El School Buildings 1337 Sutter). The conclusion —
  no number, no publishable claim — is right; the count is wrong.
- **"85 candidates."** I count 55 numbered entries in §3 plus the giveaways, straddlers and
  orphans. The headline number is inflated relative to what the file actually proposes for this
  page, and it is what produced the over-confident tier note.
- **Health Sciences Library, No. 115** appears in the §2a table and then vanishes from §3. Restored.
- **"42 designation identifiers found"** — 40 survive. See §1.

---

## 5. STRADDLERS ESCALATED TO THE ARBITRATOR — 16

I am not resolving any of these. Each carries new evidence from my re-fetch that the arbitrator
should have.

### Against Japantown (8)
Cottage Row Mini Park · Bush Street–Cottage Row Historic District · Kinmon Gakuen ·
Japanese YWCA / Issei Women's Building · Stanyan House · Ohabai Shalome / Bush Street Temple ·
Building at 1735–1737 Webster Street · Sweet Maple.

**New evidence, and it cuts against Pacific Heights.** The finder rested the Japantown case on the
SF Find layer and on subject matter. Two further authorities now say the same thing without being
asked:

- Wikipedia's landmark-districts table describes District No. 9 as "Residential buildings of flat
  front Italianate and Stick design **in Japantown**."
- DataSF's own `63x5-g3m4` description of the same district places it in the **Western Addition**.

So of the four descriptions available for the Cottage Row district — analysis polygon, SF Find,
Wikipedia and DataSF's own prose — **only the analysis polygon says Pacific Heights.** The
`mons_neighborhood` for the mini park inside it says Japantown outright. On my reading the
Japantown case is now stronger than the finder presented it, and I say so explicitly because the
finder was scrupulous about not arguing it.

`73000444` (1735–1737 Webster) should go into that decision **as a confirmed reference number**,
not as the doubtful one the finder marked it.

### Against the Marina / Cow Hollow (5)
Albert Wilford Houses (NRHP 85001914, confirmed) · Burr House (No. 31, 1970; NRHP 14000967,
confirmed) · Golden Gate Valley Carnegie Library (No. 300, 2022, confirmed) · Vedanta New Temple ·
**Casebolt House**.

Casebolt runs the other way and is the hardest call on the page. Both DataSF layers put 2727
Pierce Street in Pacific Heights. But Wikipedia's **first sentence**, cited to Sinclair's *San
Francisco: A Cultural and Literary History* (2004), reads "Casebolt House is a historic residence
in the **Cow Hollow** district of San Francisco" — so the Cow Hollow attribution has a published
book behind it, not just an association's map. **No. 51, designated 5 March 1973**, re-fetched
clean, as did the architects Hoagland and Newsom, the c.1865 build for Henry Casebolt, the
Italianate style, and the four storeys / roughly 5,875 square feet. Whoever gets it: **"the oldest
house in the neighborhood" is sourced and still banned**, and the finder is right about that. The
cable-line and salvaged-material details are unverified.

### Orphans worth rescuing (3)
- **Swedenborgian Church** — the strongest thing in the area that no in-scope page owns.
  **NHL confirmed: NRHP 04001154, certified 18 August 2004, `Is_NHL = X` on NPS layer 1.** Both
  DataSF layers say Presidio Heights; Wikipedia's first sentence says Pacific Heights.
  I re-fetched the church's contact page and the finder **understated what is there**: it is not
  "in-depth tours by arrangement". The church runs **in-depth educational tours every Sunday at
  1pm, approximately one hour, no reservations required except for large groups**, on top of
  drop-in visits during office hours. Sanctuary and garden at 2107 Lyon Street at Washington;
  office and mail at 3200 Washington Street at Lyon; office and visiting hours Monday–Friday
  10am–6pm and Sunday 12pm–2pm, closed major holidays except Sundays; Sunday worship 11am–12pm;
  (415) 346-6466 main office, (415) 346-6468 events. An NHL that is open, welcomes visitors and
  publishes a weekly tour time is worth a boundary argument. The superlative warning stands:
  "one of California's earliest pure Arts and Crafts buildings" and "Maybeck's only…" do not
  publish under any circumstances.
- **Audium**, address confirmed off its own contact page: **1616 Bush Street (at Franklin), San
  Francisco CA 94109, (415) 771-1616.** 176 speakers, 49 seats, performed in darkness, open most
  every weekend, each month's schedule posted about two weeks ahead — all confirmed verbatim. One
  correction: *Audium V: Rewind*, by Stan Shaff and remixed by David Shaff, is a **dated run,
  11–26 September 2026**, not "the current programme". Write it as a season with its dates or omit
  it. Do not write "nothing else in San Francisco is like it" — that is a comparison class.
- **Lyon Street Steps** — flagged for the Presidio finder as well as the arbitrator.

---

## 6. TIER RULING

**GUIDE. Surviving count: 39 places.**

21 PUBLISH plus 18 REWRITE, with the Japantown eight, Casebolt, the Lyon Street Steps, the
Swedenborgian Church and Audium all removed pending the arbitrator. If the arbitrator returns
even half of those the count rises above 45.

The finder's tier call is upheld, but not on the evidence it gave. It argued the guide from
"85 candidates", "twenty-eight numbered city landmarks" and "twenty-one National Register
references". The honest figures for what this page will actually own are **22 clean in-zone
Article 10 landmark numbers, one Article 10 landmark district with its ordinance, nine in-zone
NRHP reference numbers and one HALS record.** That is still comfortably a guide: it has one
interior open to the public with published tour times and admission, two twelve-acre parks with
DataSF acreage and city opening hours, a designated theatre with a dated reopening plan, four
food-and-lodging entries with re-fetched addresses and hours, and a shopping street carrying a
sourced 24.54 percent gradient. Sections, a walk and a FAQ all have something to stand on.

The finder's two structural cautions are upheld in full and should be read by the author before
a word is written. This zone is a superlative minefield — SF Heritage, Hotel Drisco, SPQR,
Wikipedia's Casebolt, Whittier, Sherith Israel and Swedenborgian articles and DataSF's own Cottage
Row description **each** contain at least one banned ranking, and several of them are the most
quotable sentence on the page. Write from dates, counts, measurements and register numbers.

---

## 7. Photographs

`"photos": []` everywhere. The finder's freedom-of-panorama analysis is upheld: everything of
consequence here is a building, 17 USC 120(a) covers it, and I found no public sculpture or mural
in the surviving set that would trigger the artwork blocklist. The Peace Pagoda is Japantown's
and it carries `landmarkno = 0` in `97yj-54sx`, so it has no publishable designation either way.
