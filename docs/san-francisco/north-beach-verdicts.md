# North Beach, San Francisco — VERIFIER VERDICTS

Adjudicated 2026-09-03 against `docs/san-francisco/north-beach-finder.md`. I did not gather the
finder's evidence and I owe it no loyalty. Every ruling below is mine.

**Headline: 62 PUBLISH · 24 REWRITE · 79 DROP · TIER = GUIDE (31 surviving places).**

**38 designation identifiers re-fetched; 38 verified in their registers; 37 survive as
place-attached claims.** The one casualty is the most dangerous kind — a real reference number
bolted to the wrong building (§2.1).

**Three finder DROP-recommendations overturned in the place's favour** (§3): Saints Peter and Paul
Church, The Saloon and Pioneer Park all have working sources the finder said did not exist. The
finder's self-declared "highest-risk entry" was a failed hostname guess, not a missing source.

**Fourteen straddlers escalated** (§8). One is new: the finder missed an Article 10 landmark
inside its own sweep box.

---

## 1. Sources I re-fetched myself

Twelve, not the five required, because most of the finder's rulings turn on whether a host answers
and that is cheap to re-test.

| Source | Result |
|---|---|
| `data.sfgov.org/resource/97yj-54sx.json` (Article 10 landmarks) | **200, 370 rows.** All 28 landmark numbers the finder cites confirmed — number, name, address and year, verbatim |
| `data.sfgov.org/resource/m22e-6hkz.json` (historic districts) | **200, 175 rows.** Telegraph Hill, Northeast Waterfront, Jackson Square, Washington Square, Upper Grant all confirmed on `a10`/`nr`/`cr`/`origin`/`dateadop` |
| `mapservices.nps.gov/.../nrhp_locations/MapServer/0/query` | **200, 49 features in a tight North Beach box.** All 8 NRIS reference numbers confirmed with addresses and certification dates |
| `sfrecpark.org/facilities/facility/details/Coit-Tower-290` | **Confirms** every Coit Tower fact the finder took, **and yields six more they left on the table** (§4) |
| `sfrecpark.org/Facilities/Facility/Details/Washington-Square-388` | **Confirms** address, park hours, restroom hours and the five features, verbatim |
| `sfpl.org/locations/north-beach` + `/north-beach-library-history` | **Confirms hours the finder said were unobtainable — and destroys their NRHP claim.** §2.1 |
| `kerouac.com` | **Confirms** the closure timeline, the 1910 build year and the Swiss-American Hotel Building, verbatim |
| `vesuvio.com` | Fetches — **but the page contradicts itself on hours.** §2.3 |
| `caffetrieste.com` | Fetches. **Finder correct** that the hours sit inside a post dated June 18, 2020 |
| `citylights.com`, `www.citylights.com`, `/visit/` | 307 from a Sucuri WAF with **no `Location` header at all.** Same outcome, wrong diagnosis. §2.4 |
| `shrinesf.org` (http, https, www) | **403 on every scheme and host, from Cloudflare.** I cannot reproduce the finder's fetch. §2.2 |
| `data.sfgov.org/resource/3mea-di5p.json` (EAS) | **200.** I re-ran 29 address lookups. The finder's Analysis/EAS column is correct in every case, **including Piazza Pellegrini — which reverses their diagnosis of it.** §2.5 |
| `data.sfgov.org/resource/3tsw-4idn.json` (parcels) | **200, 5,574 rows pulled.** Every `yearbuilt` and every parcel `name` the finder quotes is confirmed |
| `sfplanninggis.org/docs/landmarks_and_districts/LM{n}.pdf` | **200 for all fourteen tested**, including two the finder never found |
| `sfblues.net` | **200, and redirects to `thesaloonsf.com`.** The finder called it dead. §3.2 |
| `sspeterpaulsf.org` → `salesiansspp.org` | **Both 200, both current.** The finder called the parish unsourceable. §3.1 |
| `15romolo.com` | **200 — and lands on `90phutzba.tv`.** The domain is gone. §2.6 |

---

## 2. Six things the finder got wrong

### 2.1 NRHP 11000501 is not the library that stands there — SERIOUS

The finder wrote:

> **North Beach Branch Library** … 850 Columbus Avenue per OSM; **the NRHP record gives 2000 Mason
> St.** for the same institution — the building occupies the corner and both addresses appear in
> official sources.

"The same institution" is doing illegitimate work. They are two buildings. SFPL's own history page
says so in three sentences:

> "The branch was renamed in 1958 and a new North Beach Branch was erected at **2000 Mason Street**
> next to Joe DiMaggio Playground. The new North Beach Branch located at **850 Columbus Avenue
> opened on May 10, 2014.** It was undertaken by the firm of **Leddy Maytum Stacy Architects**."

A building that opened in 2014 cannot be the property the National Register certified on
2011-08-08. The reference number is real and the listing is real; the attachment is false. The EAS
carries 850 Columbus and 2000 Mason as two separate address rows forty metres apart, and SF
Planning's parcel row for 850 Columbus has **no `yearbuilt` at all** while carrying a
`ceqacodereason` of "National Register Individual" — a stale parcel flag, which is exactly the trap
the finder correctly identified for `ceqacodereason` elsewhere and then walked into here.

**DROP** any National Register claim about the library at 850 Columbus. This is the single worst
defect in the file, because a wrong-but-formatted reference number passes the citation gate and
reads as authority.

**What replaces it is better than what it loses.** SFPL gives the current branch's hours, which the
finder said were "not established in this file" because they did not isolate the row. §4.

### 2.2 The shrine's hours are not established

The finder recorded main-church hours, Porziuncola Nuova hours, mass times, confession times, a
phone number and "Run by the Capuchin Franciscans", all sourced to `shrinesf.org` over plain HTTP.
I tried `http://shrinesf.org/`, `http://www.shrinesf.org/`, `https://shrinesf.org/` and
`https://shrinesf.org/mass-times/`. Every one is refused by Cloudflare. I cannot reproduce a single
character of it.

The brief is explicit: drop when the source could not actually be fetched. **All six of those
claims DROP.** Landmark No. 5 stands — it comes from the Article 10 dataset, which I re-pulled.

There is now a **third** address in play. The Archdiocese of San Francisco's venue page
(`sfarch.org/venue/national-shrine-of-saint-francis-of-assisi/`, 200, carrying October 2026 events)
gives **600 Vallejo Street**. The Article 10 register gives **620–624 Vallejo Street**. The finder
read **610 Vallejo Street** off the shrine's own site. The EAS has a row for 610 Vallejo and none
for 600 or 620. Ruling in §5.

### 2.3 Vesuvio's own site gives two different sets of hours

The finder took "Sun–Thurs 11–1, Fri–Sat 11–2" from the header. The footer of the same page reads
"Monday-Thursday 11am to 1am / Friday & Saturday 11am to 2am". Sunday is in one and absent from the
other; Monday is in one and absent from the other. **The operator contradicts itself, so no hours
publish.** Address and identity stand.

The finder flagged "Serving All Wanderers Since 1948" and missed that the same page also carries
"first established in 1948" and "This world-renowned San Francisco saloon". All three DROP.

### 2.4 City Lights is not redirecting; it is refusing

The finder wrote "cross-host redirect not followed per tooling policy". There is no cross-host
redirect. The response carries **no `Location` header whatsoever** and the `Server` header is
`Sucuri/Cloudproxy`. It is a bot challenge. The conclusion is unchanged — no hours from the
operator — but the reasoning was wrong, and reasoning is what a later agent will reuse. Nothing
about either version reaches the reader.

### 2.5 Piazza Pellegrini's coordinate is fine; the label is wrong

The finder wrote: *"I think the EAS coordinate for this address is bad, but I did not prove it …
note that if the EAS coordinate is bad for one Columbus Avenue address it may be bad for others in
the same block."*

I re-ran it. 659 Columbus Avenue returns **37.800980, −122.411503** — which is Columbus at Union,
on the west side of Washington Square, exactly where 659 Columbus is. The coordinate is correct.
What is wrong is the `analysis_neighborhood` string attached to it, which comes back "Chinatown".

This inverts the finder's warning. There is no reason to distrust EAS geometry on the Columbus
blocks, and every reason to distrust that one row's neighborhood label. **The finder's caution
against other Columbus Avenue coordinates DROPS**; the escalation of Piazza Pellegrini itself
stands, on better grounds.

### 2.6 `15romolo.com` now serves a hijacked domain

`https://www.15romolo.com/` returns 200 and resolves to `https://90phutzba.tv/`. The finder listed
it as a source without noting this. **DROP it as a source for anything.**

---

## 3. Three overturns in the place's favour

### 3.1 Saints Peter and Paul Church is fully sourced

The finder called this "the highest-risk entry in the file" and wrote that four candidate parish
domains failed DNS or 404'd, leaving "no working official source for it at all". They tried
`stspeterpaulsf.org`, `www.stspeterpaulsf.org`, `spp-sf.org` and `sspeterandpaulsf.org`.

They did not try `sspeterpaulsf.org` — **no "and"** — which is the school, resolves, and links
straight to the parish at **`salesiansspp.org`**, which resolves and is current (parish bulletins
dated August 2026, events listed for September 2026). It gives, verbatim:

- 666 Filbert Street, San Francisco, CA 94133; (415) 421-0809
- "The Church is open from 7:00 AM-3:00 PM Monday-Friday and 7:30 AM-6:00 PM Saturday & Sunday."
- Parish Office Hours: Mon–Fri 7:00 AM–3:00 PM; Sat–Sun Closed
- "We are a Ministry of the Salesians of Don Bosco"
- Weekday Mass Mon–Fri 7:00 AM and 9:00 AM; Saturday 7:30 AM, 9:00 AM, 5:00 PM Vigil; Sunday
  8:45 AM (English), 10:15 AM (Cantonese / English), 12:00 PM (Italian / English), 5:00 PM (English)
- Confession Friday 7:30–8:30 AM and 4:00–5:00 PM; Adoration Friday 7:30–8:30 AM

The finder's substantive ruling — that the church carries **no** designation, is absent from the
Article 10 register, and that its parcel `ceqacodereason` of "California Register Historic District"
means *eligible* — is **correct and I confirm it**. I dumped every Article 10 row whose name
contains church, peter, paul, shrine or cathedral: 29 rows, and this is not one of them. The church
is now a well-sourced place with no designation claim, which is a much better outcome than the
finder's "name it, place it, and nothing else".

### 3.2 The Saloon has a live official site

The finder: *"own site `sfblues.net` **404 and TLS failure**"*. `https://sfblues.net/` returns 200
and redirects to **`https://thesaloonsf.com/`**, which gives 1232 Grant Avenue, San Francisco,
California 94133; 1-415-989-7666; "Open Daily … 12:00 pm – 02:00 am"; live music 4pm–8pm and
9:30pm–1:30am. All publishable. The site also has an "Awards and Recognition" page — **do not use
it.**

### 3.3 Pioneer Park is sourced after all

The finder: *"I have **no verified official page** for Pioneer Park and no hours."* SF Rec & Park's
own Coit Tower page states it: *"Pioneer Park, which surrounds Coit Tower, was established in 1876
on the former site of the telegraph station."* That is an institutional source, a date and a
containment relationship. No hours, correctly — but Pioneer Park is a writable place, not a gap.

---

## 4. Six Coit Tower facts the finder left on the table

All from the same SF Rec & Park page they already cited, all publishable:

1. Pioneer Park established 1876 on the former site of the telegraph station (above).
2. "Telegraph Hill takes its name from a semaphore telegraph erected on its summit in 1850."
3. Arthur Brown, Jr. is named as "architect of San Francisco's City Hall".
4. Elevator fees, as a table: Adult $8 resident / $11 non-resident; Senior 62+ $5 / $8; Youth 12–17
   $5 / $8; Child 5–11 $2 / $3; Child 4 and under free.
5. Docent mural tours: groups of at least 4 and not more than 6, about 30–40 minutes, $10 per
   person for the full mural tour and $5 for the second floor only, tickets bought at Coit Tower.
6. The 1934 sequence: controversy during the longshoremen's strike, some elements painted over, the
   tower padlocked for several months, the frescoes opened to the public in the fall of 1934.

**Two sentences on that page must not be carried across.** "the neighborhood's most famous (and
noisiest) residents" is a ranking. "In 2017, San Francisco became the first city where every
resident lives within a 10-minute walk of a park" is a ranking *and* would trip the proximity ban.
A superlative is banned from any source, attributed or not.

---

## 5. REWRITE — exact replacement wording, to be used verbatim

| # | Finder's wording | Ruling and replacement |
|---|---|---|
| R1 | "Listed on the National Register of Historic Places in 2011 (reference number 11000501)" applied to the North Beach Branch Library | **REWRITE.** Delete the claim. Replace the whole record body with: `The North Beach Branch of the San Francisco Public Library is at 850 Columbus Avenue. The branch opened on 10 May 2014 and was undertaken by the firm of Leddy Maytum Stacy Architects, with funding secured from Proposition D, approved by voters in November 2007. An earlier North Beach Branch stood at 2000 Mason Street.` |
| R2 | "Bounded by Filbert, Stockton, Union and Powell Streets" (Washington Square) | **REWRITE.** SF Rec & Park does not say this. Use: `San Francisco Recreation and Parks gives the address as Filbert and Stockton, San Francisco, CA 94133.` |
| R3 | "Listed features: accessible children's play area, accessible parking …" | **REWRITE.** The word *listed* trips the designation regex and would demand a register. Use: `Recreation and Parks records an accessible children's play area, accessible parking, an accessible restroom, a playground and restrooms.` |
| R4 | "610 Vallejo Street per the shrine's own site, but 620–624 Vallejo Street in the Article 10 dataset" | **REWRITE.** Three sources, three addresses, and the shrine's own is unfetchable. Use: `The National Shrine of Saint Francis of Assisi stands on Vallejo Street between Columbus Avenue and Grant Avenue. San Francisco Landmark No. 5, designated in 1968.` Give no street number. |
| R5 | Vesuvio hours "Sun–Thurs 11–1, Fri–Sat 11–2" | **REWRITE.** Use: `Vesuvio Cafe is at 255 Columbus Avenue, at Jack Kerouac Alley. No source states its opening hours consistently, so none are given.` |
| R6 | Caffe Trieste hours "Monday – Sunday 7:00 am – 10:00 pm" | **REWRITE.** Use: `Caffe Trieste is at 601 Vallejo Street and the Caffe Trieste Annex Retail Store at 609 Vallejo Street. No current source states their opening hours, so none are given.` |
| R7 | "SF Planning's description names Richard Neutra and Irvine Goldstine as architects within it" | **REWRITE.** That is an `arch` data field, not a description. Use: `SF Planning's historic-district record names Richard Neutra and Irvine Goldstine among the architects who worked within it.` |
| R8 | "designed by the firm of Arthur Brown, Jr." | **PUBLISH as written** — and do not shorten to "designed by Arthur Brown, Jr.". Extend: `The tower was designed by the firm of Arthur Brown, Jr., architect of San Francisco's City Hall, and was completed in 1933.` |
| R9 | Old Spaghetti Factory Cafe written in the present tense | **REWRITE.** Use: `The building at 478 Green Street is San Francisco Landmark No. 127, designated in 1981.` Say nothing about who trades there. |
| R10 | "Parcel `yearbuilt` 2001 — treat as a reconstruction date" (Bauer & Schweitzer) | **REWRITE.** Correct, but the number must not reach the reader at all. Use: `530–550 Chestnut Street is San Francisco Landmark No. 129, designated in 1981.` No date. |
| R11 | Greenwich Steps "Same district caveat; I did not PIP the Greenwich alignment separately" | **REWRITE.** No district claim publishes for the Greenwich Steps. Use: `The Greenwich Steps descend the east face of Telegraph Hill.` |
| R12 | Grace Marchant Garden as `park` | **REWRITE** to `attraction`. It is private land with no operator hours and is not a Recreation and Parks facility; `park` asserts a civic status no source gives it. |
| R13 | Green Tortoise Hostel as `hotel` | **REWRITE** to `attraction`, or drop. `hotel` misdescribes a hostel and the schema has no better fit. |
| R14 | "the Powell–Mason line's northern terminus" (cable car turntable) | **REWRITE.** OSM alone. Use: `The Powell–Mason cable car line turns at Taylor and Bay Streets.` and carry no further claim. |
| R15 | Beat Museum: "we've occupied for 20 years" material | **REWRITE.** Trading duration from the operator. Use: `The Beat Museum is at 540 Broadway, in the Swiss-American Hotel Building, built in 1910. The museum's own site states the building has been vacated for a soft-story seismic retrofit and that a reopening date has not been announced, so no opening hours are given.` |
| R16 | "seven Article 10 individual landmarks inside the conservative boundary and ten within reach" | **REWRITE — the count is not defensible.** §7. Never state a count of landmarks in reader-facing prose; it invites a superlative and it is wrong. |
| R17 | Washington Square proposed with an unqualified slug | **REWRITE.** `washington-square-park` is already owned by `manhattan/greenwich-village.json`. Slugs are globally unique. Use `washington-square-north-beach`. |
| R18 | Tosca Cafe slug | **REWRITE.** `tosca-restaurant-suffield` exists in `connecticut/suffield.json`. Use `tosca-cafe-north-beach`. |
| R19 | "Filbert Steps … descending to Sansome Street" | **REWRITE — GATE TRAP.** The proximity regex is `\bsteps (?:from|away)\b`, case-insensitive. Any sentence putting "Steps" immediately before "from" fails the build. Never write "the Filbert Steps from Telegraph Hill Boulevard". Use: `The Filbert Steps run down the east face of Telegraph Hill between Telegraph Hill Boulevard and Sansome Street.` |
| R20 | "a designated landmark"-adjacent phrasings anywhere | **REWRITE — GATE TRAP.** `@designation_claim` fires on the bare words *listed*, *registered*, *nominated*, *landmark*. "Listed features", "a registered charity", "a landmark of North Beach" all demand a register and identifier they cannot supply. Reword rather than cite. |
| R21 | Sentinel Building "OSM records architects 'Salfield & Kohlberg'" | **REWRITE.** OSM is not a source for an attribution. Use: `916–920 Kearny Street is San Francisco Landmark No. 33, designated in 1970.` |
| R22 | Paper Doll Bar "Designated for its significance in LGBTQ history per the designation document" | **REWRITE.** The finder confirmed the PDF resolves and says they did not read it. I confirm it resolves and I did not read it either. Use: `524 Union Street is San Francisco Landmark No. 287, designated in 2019.` The significance statement stays a lead. |
| R23 | Julius Castle "Tested outside the Telegraph Hill Historic District" | **PUBLISH the negative as a fact, but not as prose.** A page does not say what a building is *not* in. Use: `302–304 Greenwich Street is San Francisco Landmark No. 121, designated in 1980.` |
| R24 | Coit Tower "Analysis = North Beach, SF Find = Telegraph Hill" reaching the page in any form | **REWRITE.** Boundary method is research method. Use: `Coit Tower is at 1 Telegraph Hill Boulevard.` |

---

## 6. DROP

**Sourced only to the business itself, and therefore inadmissible (12).** Vesuvio "Serving All
Wanderers Since 1948"; Vesuvio "first established in 1948"; Vesuvio "world-renowned San Francisco
saloon"; Comstock Saloon "Founded in 1907"; Condor "Since 1964"; Condor "San Francisco's Original
Topless Club"; Caffe Trieste "Over 50 years"; Caffe Trieste "Celebrating 65 Years"; Caffe Trieste
"the first Espresso coffee house on the West Coast in 1956"; Caffe Trieste "still serve the finest
in Italian Style coffee"; Caffe Trieste "Espresso Pioneer of the West Coast"; The Beat Museum "the
space we've occupied for 20 years". The finder caught the first eight of these and missed the last
four; all twelve go.

**Unfetchable, so unwritable (7).** Shrine main-church hours; Porziuncola Nuova hours; shrine mass
times; shrine confession times; shrine phone (415) 986-4557; "Run by the Capuchin Franciscans";
"610 Vallejo Street per the shrine's own site".

**Designation claims that do not stand (9).** NRHP 11000501 attached to the library at 850 Columbus
(§2.1); Washington Square Historic District as a designation (`cr = Eligible`, `nr = No`,
`a10 = No` — confirmed); Upper Grant Avenue Historic District as a designation (`cr = Eligible`,
`a10 = No` — confirmed); Southeast Telegraph Hill HD; Gardner Dailey/Telegraph Hill HD; North Point
Sewage Treatment Plant HD; Jackson Square HD Extension (`nr = Eligible`, `cr = Eligible` —
confirmed); Momo's 440 Club as a landmark (`landmarkno = 0` — confirmed, 40 such rows); any
National Register claim for Jackson Square Historic District, which has no reference number in
anyone's evidence including mine — the NPS *points* layer carries no district row for it.

**Sourced to OpenStreetMap alone, with no operator site, register row or institutional page (23
records).** Specs' Twelve Adler Museum Cafe (and there is no EAS row for William Saroyan Place at
all); Jack Early Park; San Francisco Chinese Baptist Church; the Taylor & Bay cable car turntable
as anything more than a named location; Little City Market; Z Cioccolato; Libreria Pino; 101 Music;
Liguria Bakery; Victoria Pastry Company; Stella Pastry; Mama's on Washington Square; Savoy Tivoli;
Caffè Sport; Bocce Cafe; Sodini's; Maykadeh; Il Casaro; Il Pollaio; Gino and Carlo; Washington
Square Inn; Caffè Greco; Mara's Italian Pastry.

**Sourced to a dead or hostile host (4).** Tosca Cafe (404 both schemes — confirmed); Tony's Pizza
Napoletana (403 both schemes — confirmed); XOX Truffles (`chocolatepicture.com` returns 114 bytes
of nothing — confirmed); 15 Romolo (`15romolo.com` now lands on `90phutzba.tv` — §2.6).

**The unsourced nightlife tail (1 ruling, 14 names).** Peña Pachamama, Monroe, Paname, Cold Drinks
Bar, Grant & Green, Chief Sullivan's, Maggie McGarry's, Kell's, Tope, Tony Nik's, Columbus Cafe,
Bodega Wine Bar, Little Vine, Otherwise Brewing. None independently sourced; none writes.

**The residential-hotel cluster (4).** The Basque Hotel, Golden Eagle Hotel, Castro Hotel, Il
Triangolo Hotel. The finder's own instinct is right and I adopt it as a ruling rather than a
caution: an OSM `tourism=hotel` tag on an SRO building is not evidence of visitor lodging.

**Monuments and public art as place records (8).** Statue of Benjamin Franklin; Guglielmo Marconi
Memorial; "Language of Birds"; Telegraph Hill Semaphore; the Juana Briones plaque; the "1st Jewish
Religious Services in SF" plaque; the Frank Marini memorial; the Jazz mural. All OSM-only, all
artworks outside 17 USC 120(a). The **Volunteer Firefighters Memorial** is the exception and is
kept as prose, not as a place: SF Rec & Park's Coit Tower page states Lillie Hitchcock Coit's
bequest funded "a monument to Coit's beloved volunteer firefighters, in nearby Washington Square".
The **Christopher Columbus statue** removal is unsourced and the statue must not be written as
present — the finder is right on both halves.

**The named alleys as place records (1 ruling, 5 names).** Kenneth Rexroth Place, Bob Kaufman
Alley, Via Ferlinghetti, Peter Macchiarini Steps, Jack Micheline Place. These are streets with no
operator and no hours. They may be named in a section body; they are not places.

**Not North Beach's, on both layers (5).** Bimbo's 365 Club (Russian Hill / Russian Hill — my EAS
run confirms Russian Hill); Levi's Plaza; Transamerica Redwood Park; **Our Lady of Guadalupe Church
at 906 Broadway, San Francisco Landmark No. 204, designated 1993** — an Article 10 landmark the
finder never surfaced, which my EAS run puts in **Nob Hill**; and the whole Analysis-polygon
overspill north of Bay Street (Pier 39, Aquarium of the Bay, Musée Mécanique, Ripley's, the Skystar
Wheel, Boudin, Scoma's and the souvenir shops), which is Fisherman's Wharf's.

**Rankings carried in from otherwise-good sources (2).** SF Rec & Park's "the neighborhood's most
famous (and noisiest) residents" and "San Francisco became the first city where every resident
lives within a 10-minute walk of a park".

**Research method that must not reach the page (4).** Every boundary-layer disagreement; every
status code; "no EAS row for William Saroyan"; the Nominatim rate-limit narrative. The provenance
argument stops at the edge of the research file, and the finder says so and then writes several
sentences that would not survive the regex if lifted. The honest reader-facing form is always about
the fact: `No source states its opening hours, so none are given here.`

---

## 7. The register sweep was under-run

The finder wrote: *"A naive read of the dataset yields 8 North Beach landmarks; the true count is
7."* That is right about `landmarkno = 0` and wrong about the sweep. I ran point-in-polygon over
every row's own geometry across a generous North Beach / Telegraph Hill / lower Columbus box and
got **36 Article 10 landmarks**, against the 11 plus 17 Jackson Square rows the finder enumerated.
The eight they never surfaced:

| No. | Name | Address | Designated |
|---|---|---|---|
| 46 | House of the Flag / Old Sheppard-Dakin House | 1652–1656 Taylor Street | 1972 |
| 91 | Gibb-Sanborn Warehouse, Trinidad Bean & Elevator Co. | 855 Front Street | 1977 |
| 92 | Gibb-Sanborn Warehouse, North Pelican Paper | 901–925 Front Street | 1977 |
| 97 | Atkinson-Escher House | 1032 Broadway Street | 1977 |
| 102 | Italian Swiss Colony Warehouse Building | 1265 Battery Street | 1978 |
| 104 | Independent Wood Co. Building (Cargo West) | 1105 Battery Street | 1979 |
| **114** | **Belt Line Railroad Roundhouse Complex** | **Embarcadero / Lombard Street** | **1980** |
| 204 | Our Lady of Guadalupe Church | 906 Broadway Street | 1993 |
| 311 | Colombo Market Arch | Sydney Walton Park | 2023 |

LM 114 matters most: it is the **same property** the finder listed as NRHP 86000207 "Belt Railroad
Engine House and Sandhouse", and they cited only the federal listing when a city landmark number
was sitting in the dataset they had already pulled. Similarly, **NRHP 07001469 "Colombo Building",
certified 2008-01-31 at 1-21 Columbus Ave**, is the federal twin of their LM 237 and went
unreported. Four more North Beach-box NRHP listings are absent from their table entirely: 97001189
Gibb, Daniel, & Co. Warehouse; 01001101 Fuller Company Glass Warehouse; 09001117 Armour & Co.
Building; 09001300 One Lombard Street.

The finder also missed a district: the **Port of San Francisco Embarcadero Historic District**
(`nr = Listed`, `cr = Listed`, `neighborhood` = "Financial District; North Beach; SOMA"). Their §2.2
sentence — "only two districts carry `a10 = Listed` **and** `neighborhood` North Beach" — is
literally true, and it hid a third listed district by asking the wrong question.

**None of these nine changes the tier and most are straddlers.** They are recorded so the
arbitrator has the real set.

**And the finder's methodological catch is correct and should be escalated to the coordinator.**
`.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` only. I verified corpus-wide by
hand: 350 seed files, 3,921 places, **zero with town "San Francisco"**. So no shipped file claims a
North Beach place, and the Oracle Park seven are a code seed and none is in North Beach — but the
tool every one of the twelve San Francisco finders was told to trust is checking one twelfth of the
corpus, and it is why R17 and R18 above were nearly missed.

---

## 8. Straddlers escalated to the arbitrator

1. **City Lights Booksellers (LM 228)** — both layers Chinatown; I re-ran the EAS and confirm
   Chinatown for 261 Columbus. Contest with Chinatown.
2. **Vesuvio Cafe** — both layers Chinatown (255 Columbus confirmed). The operator self-describes as
   North Beach; that is not authority.
3. **Jack Kerouac Alley** — both layers Chinatown.
4. **Comstock Saloon** — both layers Chinatown (155 Columbus confirmed).
5. **Coit Tower (LM 165 / NRHP 07001468)** — Analysis North Beach, SF Find Telegraph Hill. Telegraph
   Hill was declined as a zone with the note that Coit Tower is "North Beach's marquee". I read that
   as a steer and not a ruling, and I decline to launder it into one.
6. **Filbert Steps, Greenwich Steps, Grace Marchant Garden, Julius Castle (LM 121), House at
   1254–1256 Montgomery (NRHP 79000532), Bob Kaufman Alley** — the same North Beach / Telegraph Hill
   split.
7. **The Jackson Square cluster** — 17 Article 10 numbers, plus NRHP 79000535 Old Ohio Street Houses
   and NRHP 07001469 Colombo Building. Analysis says Chinatown, SF Find says North Beach, SF
   Planning's own `neighborhood` field says North Beach, the roster gives Jackson Square to the
   Financial District. Four sources, three answers. The largest question in the file, and the
   finder is right not to resolve it.
8. **Molinari, Caffè Greco, Mara's, Club Fugazi, Sentinel Building (LM 33), Fugazi Bank Building
   (LM 52), Bix, Kenneth Rexroth Place** — Analysis Chinatown, SF Find North Beach. My EAS re-run
   confirms Chinatown for every one I tested.
9. **Otis Elevator Company Building (NRHP 99001265)** — North Beach vs Fisherman's Wharf.
10. **Northeast Waterfront Historic District (Article 10, Ord. 171-83, adopted 1983-04-08)** — plus
    LM 91, 92, 102, 104 and 114 and NRHP 97001189 / 01001101 / 09001117 / 09001300 inside it. SF
    Planning labels it North Beach; the geography is the Embarcadero, which the roster folded into
    the Financial District and Fisherman's Wharf.
11. **Port of San Francisco Embarcadero Historic District** (`nr` and `cr` Listed, `neighborhood`
    includes North Beach) — **NEW**, missed by the finder. Note it touches Red's Java House, which
    is an Oracle Park code seed, so this needs care from whoever takes it.
12. **Piazza Pellegrini** — escalated on corrected grounds (§2.5): good coordinate, bad
    neighborhood label. Not North Beach's on either layer as the data stands.
13. **Our Lady of Guadalupe Church (LM 204, 906 Broadway)** — **NEW**. EAS says Nob Hill. An Article
    10 landmark nobody has claimed.
14. **Bimbo's 365 Club and Levi's Plaza** — escalated only to record that North Beach does not want
    them. Russian Hill's and the Financial District's respectively.

---

## 9. Tier ruling

**GUIDE. 31 surviving places.**

Ruled against the surviving count honestly, after every drop above and assuming the harshest
arbitration — every Chinatown straddler and the entire Jackson Square cluster lost:

**Unambiguous, both layers North Beach, at least one non-OSM source (26):** Washington Square
(LM 226) · Pioneer Park · Joe DiMaggio Playground · North Beach Branch Library · Telegraph Hill
Historic District (Article 10, Ord. 442-86) · Saints Peter and Paul Church · National Shrine of
Saint Francis of Assisi (LM 5) · The Beat Museum · Caffe Trieste · Biordi Art Imports · The
Stinking Rose · Hotel Boheme · Mario's Bohemian Cigar Store Cafe · Golden Boy Pizza · Sotto Mare ·
Buon Gusto Sausage Factory (NRHP 100006073) · Original Joe's · Paper Doll Bar (LM 287) · Tommaso's ·
Ristorante Fior d'Italia · San Remo Hotel · The Saloon · Telegraph Hill Books · Old Spaghetti
Factory Cafe building (LM 127) · Bauer & Schweitzer Malting Company (LM 129) · The Lost Church.

**Plus five Telegraph Hill straddlers the roster steers here (5):** Coit Tower (LM 165 / NRHP
07001468) · Filbert Steps · Greenwich Steps · Grace Marchant Garden · Julius Castle (LM 121).

Twenty-six is a guide before the steer is applied. Five Article 10 individual landmark numbers
(5, 127, 129, 226, 287), one Article 10 historic district with its ordinance, and two NRHP
reference numbers (07001468, 100006073) survive **inside the unambiguous set alone** — every one of
them re-fetched by me from its own register today. Two civic spaces carry published hours, a church
carries published hours and a mass schedule, a public library carries published hours and a named
architect, and roughly a dozen food-and-drink addresses have live official sites.

The finder's own tier argument reaches the same answer by a worse route: it leans on a landmark
count that is wrong in both directions (§7) and on a library listing that does not exist (§2.1).
The conclusion survives the correction comfortably, which is the test.

---

## 10. Photographs

Wave 2, `"photos": []` everywhere, and I confirm the finder sourced and linked no image.

For the record, and it changes what is worth writing: Coit Tower, Saints Peter and Paul's spires,
the Sentinel Building, the Fugazi Bank Building, Julius Castle, the Bauer & Schweitzer malt house
and the Jackson Square fronts are **buildings** under 17 USC 120(a). The Coit Tower interior murals,
the Language of Birds, the Jack Kerouac Alley inlays, the Benjamin Franklin statue, the Volunteer
Firefighters Memorial and the Marconi Memorial are **artworks** and are not covered.

**One the finder missed:** SFPL's North Beach branch page carries "Sound Sculptures by Bill
Fontana" as an installed work at 850 Columbus. Bill Fontana is living. Any photograph framing that
installation fails the artwork gate; a photograph of the Leddy Maytum Stacy building does not.
