# Queens Wave 4 — ARBITRATION

**Neighborhoods:** Glendale, Maspeth and Ridgewood — all three in Community District 5, all three
bordering each other. Three authors write in parallel and cannot see each other's work. This file is
the ruling they follow instead of their own judgement.

**Evidence ranking used throughout (from the brief):**
1. The place's own street address, and the neighborhood name printed in it.
2. What the best-evidenced source says explicitly (LPC reports, NYC Parks agency pages, NRHP/NPS
   records, DOE/DCP/MTA datasets, the institution's own site).
3. Community-district and NTA/boundary definitions the verdicts confirm.

**Standing rule (carried from waves 1–3):** a place assigned to another neighborhood may be
MENTIONED in prose, if a confirmed verdict in *your own* dossier supports the mention, only as the
neighbouring place it is — never as this page's own — and it gets **no place record** in your file.

**Second standing rule, specific to this wave:** a ruling here that hands a place to a page whose own
verdict file carries no confirmed verdict for it is a ruling that **nobody publishes it**. Fact rule 1
(every published claim traces to a CONFIRMED verdict) is not overridden by an ownership ruling. Where
that applies I say so explicitly.

---

## 1. FOREST PARK — the wave's central ruling

### 1.1 The question put to me

Wave 3 gave Forest Park to Forest Hills, called the ruling weak, and wrote its own overturn
condition: *"a Woodhaven, Richmond Hill, **Glendale** or Kew Gardens page entering the corpus, or a
dedicated Forest Park page. If either happens, this ruling is void and Forest Hills keeps only the
etymology."* Glendale is entering the corpus in this wave. **The condition has triggered and the
wave-3 ruling is void by its own terms.** I am not reaffirming it.

The brief offered me two outcomes: (a) the park moves to Glendale, or (b) it stays with Forest Hills.
**The evidence supports neither, and I rule the third thing the evidence actually says.** I take the
brief's framing as a demand that I not duck the decision, not as a demand that I pick a wrong answer.

### 1.2 RULING — Forest Park belongs to NO neighborhood file, and it is NOT Glendale's

**Glendale's claim is REFUTED. Forest Hills' claim is VOID. No wave-4 file creates a Forest Park
record.**

Three verifiers measured the park independently this wave and agree:

| Test | Glendale verifier | Ridgewood verifier | Maspeth verifier |
|---|---|---|---|
| Area sampling | 388/400 in `QN8291 Forest Park`; **2/400 Glendale** — fewer than Kew Gardens | 5,091/5,262 (96.8%) in `QN8291`; **0.3% Glendale**; **0.0% Forest Hills** | did not sample (no Maspeth claim) |
| Shared boundary | Woodhaven ~2,350 m, **Glendale ~2,342 m**, Richmond Hill ~1,241 m, **Forest Hills ~1,036 m**, Kew Gardens ~986 m | Woodhaven 2,232 m, Kew Gardens 1,937 m, **Glendale 1,359 m**, Richmond Hill 1,178 m, **Forest Hills 409 m** | — |
| Wave-3's "3.3 m" | a **minimum distance** between ring vertices, not a shared boundary | "not a plausible measurement" for a 506-acre park | — |

The decisive fact is not the sampling, which only says who *doesn't* have it. It is the instrument:

```
QN8191 | Flushing Meadows-Corona Park | ntatype 9 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | ntatype 9 | QN82 Forest Park (JIA 82 Approximation)
```

Two verifiers pulled those rows independently. They are **the same object with a different name**.
Wave 3 ruled that this device puts Flushing Meadows Corona Park in **no neighborhood file at all**.
Forest Park carries the identical device, and consistency is the whole point of a corpus rule.

Corroborating, and each re-derived by a verifier in this wave rather than inherited:

- **The park's own address defeats every claimant.** `80-30 PARK LANE` geocodes to ZIP **11415** and
  `QN0901 Kew Gardens` — the neighbourhood that claims it least. Under evidence rank 1, the address
  names no claimant here.
- **A fourth agency treats it as its own district.** LPC's record for the Forest Park Carousel
  (LP-02528, designated 6/25/2013) carries `cd = 482` — the joint interest area, not CB 405 or 406 —
  and `nta2020 = QN8291`. DCP and LPC agree independently.
- **The ZIP/CB ground cited in wave 3 does not discriminate.** The Parks record reads
  `zipcode 11375, 11385, 11415, 11421` and `communityboard 305405406409`. 11385 (Glendale/Ridgewood)
  and CB 5 sit on that list exactly as 11375 (Forest Hills) and CB 6 do. It supports both equally,
  i.e. neither. (Note also: `305405406409` decodes as **Brooklyn CB 5 plus Queens CBs 5, 6 and 9**.
  There is no "CB 3".)
- **"Named after the park" is an etymology, not a location.** Both wave-3 primaries say *proximity*
  in the quoted sentence. That is still true, still confirmed, and still Forest Hills'.
- **Wikipedia's own sentence is an anti-containment claim:** the park draws *"the participation of the
  **surrounding neighborhoods** of Kew Gardens, Woodhaven, Richmond Hill, Forest Hills, and
  Glendale."* It names Forest Hills and Glendale as coequal neighbours.

### 1.3 What the coordinator must do to `priv/seed_data/queens/forest-hills.json`

I read the shipped file. **It does not, in fact, claim the park for Forest Hills** — the previous
arbitrator's three constraints were obeyed to the letter. The record reads:

```
slug    = "forest-park"
name    = "Forest Park"
town    = "Queens"            (not "Forest Hills")
county  = "Queens"
address = "80-30 Park Lane, Queens, NY 11415"
history = "The park is not administratively part of any neighborhood: the Department of City
           Planning gives it its own 2020 tabulation area, QN8291, a joint interest area…"
```

and the guide carries an explicit FAQ, *"Is Forest Park in Forest Hills?" — "No."*

**Therefore: no factual claim needs deleting, and I do not order the record destroyed.** Stripping it
would delete the corpus's only accurate statement about a 506-acre flagship park and give the park no
home at all — the Flushing Meadows case has `Ethos.Seeds.CitiFieldPlaces` to hold its contents;
Forest Park has nothing.

**The coordinator's required actions are these, and they are small:**

1. **Retain** the `forest-park` record in `forest-hills.json` **as custodial, not proprietary**. It
   already carries `town = "Queens"` and prose stating the park is in no neighborhood. Those two
   properties are what make retention lawful; if either is ever edited to say "Forest Hills", the
   record must be deleted instead.
2. **Change nothing else in `forest-hills.json`.** I checked every dependent string: the guide's two
   Cord Meyer/LPC sentences, the Yellowstone Park sentence *"Its name is derived from its proximity
   to Forest Park"*, the "Why is it called Forest Hills?" FAQ and the entry note *"The park Forest
   Hills is named after and borders"* are all **etymology or bordering**, which survive this ruling
   intact. There is no prose or link note to remove.
3. **When a Woodhaven, Richmond Hill or Kew Gardens page enters the corpus, or a borough-level
   holder is created, move the record there and out of `forest-hills.json`.** Kew Gardens is the
   natural destination on the address; a borough-level holder is better. This is a bookkeeping move,
   not a re-litigation.
4. **The borough gate must assert exactly one `forest-park` record.** It exists. It is in
   `forest-hills.json`. **Glendale must not create a second one under any slug.**

### 1.4 What Glendale may say about Forest Park, with no record

- That Glendale **borders** Forest Park. Confirmed, and Glendale has the second-longest shared
  boundary of any neighbourhood — but **do not publish the metres and do not rank it**; the numbers
  are this wave's own measurement, not a source, and "second-longest" is an unsourced superlative.
- That Wikipedia says Glendale *"contains… part of Forest Park"* — **attributed to Wikipedia**, and
  not restated in the page's own voice.
- **Nothing else.** No record for the park, and **no record for anything inside it**: the Forest Park
  Carousel, Dry Harbor Playground, Lawrence Linekin Children's Playground, the George Seuffert, Sr.
  Bandshell, Oak Ridge, the Overlook, the Forest Park Golf Course, Victory Field, DeVoy Playground,
  Jackson Pond Playground, PFC Lawrence Strack Meadow and the Richmond Hill War Memorial are all
  inside `QN8291` and are off-limits to Glendale as records **and as prose**.
- Ridgewood and Maspeth do not touch the park. `QN0502` and `QN0501` appear nowhere in either
  adjacency table. **Neither page may mention it at all**, and no routing sentence is warranted.

### 1.5 A note the coordinator should carry forward

Wave 3's tiebreaker was *"a marquee place that appears nowhere is as much a corpus failure as one
that appears twice."* That instinct produced a correct outcome by an incorrect route: the park is in
the corpus, at a borough-level address, saying true things. Keep the outcome; retire the reasoning.
**Contiguity and etymology are not location, and a neighbourhood ranking 4th or 7th among a park's
abutters has not earned it.**

---

## 2. OTHER MARQUEE INSTITUTIONS

**ALLEY POND PARK → NOBODY IN WAVE 4.** I searched all three wave-4 finders and verdict files: the
string "Alley Pond" appears **zero times** in any of them. It is in CD 11, on the other side of the
borough, and no wave-4 page touches it. Consistent with wave 2's ruling. **No record, no mention.**

**FLUSHING MEADOWS CORONA PARK and the eight `Ethos.Seeds.CitiFieldPlaces` holdings → NOBODY,
as records and as prose.** All three verifiers independently confirm the firewall held: nothing in
any wave-4 dossier reaches CD 4 or CD 7. **And no page in this wave gets a `/g/citi-field-guide`
routing sentence** — all three verifiers say the same thing in the same words, that there is no
routing question to answer, because none of these three neighbourhoods is adjacent to that park.
Writing one anyway is padding.

**RIDGEWOOD SAVINGS BANK, FOREST HILLS BRANCH, 107-55 Queens Boulevard → FOREST HILLS, already
shipped** (`slug = ridgewood-savings-bank-forest-hills`, `town = "Forest Hills"`). The name-collision
trap in the brief is real and all three dossiers avoided it: `107-55` appears in Glendale's file only
inside its own guard, and never in Maspeth's. **Ridgewood must not claim it.** Ridgewood's own
main office is a different building at Myrtle and Forest Avenues — see §4.

**RIDGEWOOD RESERVOIR → BROOKLYN, already shipped** in `brooklyn/highland-park.json`
(`slug = ridgewood-reservoir`, `county = "Brooklyn"`). Ridgewood may state the etymology — LP-2081:
*"Ridgewood was named for the reservoir…"* — and may not create the place. Glendale may not claim it
either; its address is `58-02 Vermont Avenue` in Brooklyn ZIPs 11207/11208.

**ONDERDONK HOUSE and RIDGEWOOD THEATER BUILDING → RIDGEWOOD.** These are the only two LPC individual
landmarks in all of Queens CD 5 (`buis-pvji?cd=405` returns exactly two rows), both `nta2020 =
QN0502`. Maspeth and Glendale both cede them explicitly. **Maspeth's individual-landmark count is
zero and Glendale's is zero; both pages must be allowed to be zero, and neither may reach for these
two to fill the vacuum.**

---

## 3. THE CONTESTED PLACES — RULINGS

### 3.1 Glendale ↔ Ridgewood

| Place | Address ruled from | **Ruling** | Rests on |
|---|---|---|---|
| **Evergreen Park** | `60-09 Saint Felix Avenue` | **RIDGEWOOD** | Rank 2 decides. NYC Parks states it in a sentence: *"Evergreen Park is located in the Queens neighborhood of **Ridgewood**, bounded by Metropolitan Avenue and Evergreen Cemetery."* Ridgewood's verifier computed the **park polygon's area centroid** → `QN0502`. Glendale's counter is a point-geocode of a *different house number* (`60-24`) → `QN0503`; a single address point on a park that straddles the line loses to the centroid of the whole polygon plus an explicit agency sentence. **Glendale creates no record.** |
| **P.S. 68** | Saint Felix Avenue parcel | **RIDGEWOOD, if its DOE twelve carries it; otherwise NOBODY** | Glendale's sole basis was "same parcel as Evergreen Park", and I have just ruled that parcel Ridgewood's. NYC Parks: *"Part of the park is jointly operated with the adjacent P.S. 68."* **Glendale creates no record.** Ridgewood publishes it only if it appears in the twelve DOE rows whose own `nta_name` reads `Ridgewood`. |
| **Mafera Park** | `65 Place and Shaler Avenue` | **RIDGEWOOD** | Both verifiers rule the same way and Glendale cedes. Parks centroid → `QN0502`; the sign says *"the children of Ridgewood"* and calls Mafera *"a long-time Ridgewood resident."* The sign's Glendale content — *"Glen Ridge Park… refers to the park's location on the boundary between Glendale and Ridgewood"* and the **Glendale Farmers Base Ball Club** — is **team and boundary history, and Glendale may write it without claiming the park.** Ridgewood should tell the boundary fact, not suppress it. |
| **Cooper Avenue Row Historic District** | `64-34 to 64-46 Cooper Avenue` | **GLENDALE** | Ridgewood cedes it outright (V-N2). Geometry `QN0503` from both sides; the district's own Wikipedia article opens *"a national historic district in **Glendale**, Queens."* |
| **75th Avenue–61st Street Historic District** | `75-02 61st Street` + 60th Lane / 62nd St | **GLENDALE** | Same three lines: DCP geometry `QN0503`, the district's own article says *"in **Glendale**, Queens"*, and the NRHP `city` field is demonstrably ZIP-derived. **Ridgewood must drop this from its NRHP set** — its verifier subtracted only Cooper Avenue Row, leaving this one and Central Avenue in a list of 13 that would have duplicated Glendale. |
| **Central Avenue Historic District** | `Roughly bounded by Myrtle Avenue, 70th Avenue, 65th Street and 66th Street` | **GLENDALE** | As above. Glendale's verifier closed the open gap by geocoding `66-10 CENTRAL AVENUE` → `QN0503`, ~150 m from the NRHP row's own coordinate. **Ridgewood must drop this too.** |
| — *disclosure binding on Glendale* — | | | The National Register files **all three** under `city = Ridgewood, Queens`, and the string "Glendale" occurs **zero times** in the whole NRHP Queens listing. **Glendale's prose must disclose that conflict** — a reader who checks the Register will find Ridgewood. Do not present the assignment as uncontested. |
| **68th Avenue–64th Place Historic District** | `64th Pl. from Catalpa Ave. to 68th Ave.` | **RIDGEWOOD** | NRHP `city = Ridgewood`, uncontested — Glendale's dossier never raises it, and Catalpa Avenue at 64th tests `QN0502`. No conflict to disclose. |
| **NYPD 104th Precinct station house** | `64-02 Catalpa Avenue` | **RIDGEWOOD** (the building) | Glendale's own verifier geocodes it `QN0502` and cedes. **Glendale is *patrolled by* the 104th and may say so** — that is a service fact, not a place. **Glendale creates no record.** Ridgewood publishes only if its own dossier confirms the building; a bare geocode from another page's file is not Ridgewood's verdict. |
| **Myrtle Avenue BID office** | `62-14 Myrtle Avenue` | **GLENDALE owns the building — but NOBODY publishes it** | Ridgewood's verifier rules it out of Ridgewood on three independent readings (`org_city = "Glendale"`, Nominatim Glendale, polygon `QN0503`) — so **Ridgewood creates no record**. Glendale's dossier contains no verdict for it at all, so under the second standing rule **Glendale creates none either.** Ridgewood **may** narrate the BID *district* it manages — *"Myrtle Avenue from Wyckoff Avenue to Fresh Pond Road and contiguous side streets"* — as Ridgewood's commercial spine, because that boundary is confirmed and is not the building. |
| **Drumm Triangle** | Cooper Avenue, Cypress Hills Street & 65th Place | **GLENDALE** | Rank 2: NYC Parks' own sign calls it *"a sanctuary for **Glendale** residents."* Ridgewood's centroid test returns `QN0574 Highland Park-Cypress Hills Cemeteries (North)` — a cemetery JIA that is nobody's neighbourhood and claims nothing. Ridgewood does not claim it. **Glendale keeps it, and must not write that DCP places it in Glendale** — DCP does not. |
| **Fresh Pond / Fremont Yards** | `66-01 Fresh Pond Road` | **RIDGEWOOD's side of the line; no record in Glendale** | `QN0502`, and the *Fresh Pond Road station* article places the station *"in Ridgewood"*. Glendale may cite Wikipedia's *"located in Glendale"* **with attribution** and may say the yards are nearby; **no place record**. |
| **Fresh Pond Rd, Forest Av, Seneca Av, Halsey St stations** | MTA coords | **RIDGEWOOD** | MTA `borough = Q`, all four polygon `QN0502`. **Glendale must not write that it has a subway station.** Wikipedia's *"it still is served by the subway"* is contradicted by its own transportation section, and all three nearby M stations verify to Ridgewood or Middle Village. |
| **Myrtle–Wyckoff Avenues station** | MTA coords | **BROOKLYN, already narrated** in `brooklyn/bushwick.json` | MTA `borough = Bk`, polygon `BK0402`. Link, do not narrate. |
| **Mount Carmel Cemetery** | `83-45 Cypress Hills Street, Glendale, NY 11385` | **GLENDALE, attributed, with a hard caveat** | Rank 1 on the cemetery's own printed address block, which says **Glendale** five times and heads itself *"Mount Carmel Cemetery / Glendale, NY"*. **This was close.** DCP puts the parcel in `QN0574`, not `QN0503`. Glendale may publish the address **because the cemetery prints it that way, attributed to the cemetery**, and **must not** state that DCP places it in Glendale. **Section 5 (Knollwood Park), `57-80 Cooper Avenue, Ridgewood NY 11386`, is excluded** — the cemetery itself assigns it to Ridgewood. **What would overturn this:** any agency record placing the parcel in a named neighbourhood; on DCP's geometry alone it would go to nobody. |
| **Union Field Cemetery** | `8211 Cypress Avenue, Ridgewood, NY 11385` | **RIDGEWOOD's on the evidence; publishable only if Ridgewood's own dossier confirms it** | Rank 1: its own site prints Ridgewood, and describes itself as *"63 acres on the Brooklyn/Queens border."* **Glendale must not claim it.** Union Field and Mount Carmel are adjacent, on the same street, and self-assign to different neighbourhoods — that is this wave in one sentence, and it is why rank 1 is applied to each place separately and never to a street. |
| **Machpelah Cemetery / Houdini's grave** | `82-30 Cypress Hills Street` | **NOBODY** | `QN0574`. Wikipedia's own Glendale cemetery list omits Machpelah while the same article claims Houdini. **Glendale may say the Cemetery Belt rings the neighbourhood; it may not put a marquee burial inside it.** |
| **Mount Lebanon Cemetery** | `78-00 Myrtle Avenue` | **NOBODY** | `QN0574`, no operating website. ⚠️ `mtlebanoncemetery.com` is a **Pittsburgh** cemetery — do not cite it. |
| **Cypress Hills Cemetery** | `833 Jamaica Ave., Brooklyn, NY 11208` | **BROOKLYN** | Its own address. Jackie Robinson and Mae West are not Glendale's. |
| **Evergreens Cemetery** | `1629 Bushwick Ave.` | **BROOKLYN** | Wikipedia's NRHP row saying `city = Ridgewood, Queens` is wrong; NYC Parks puts it *"along Bushwick Avenue on the Brooklyn-Queens border."* |
| **89-70 Cooper Avenue (*All in the Family* house)** | `89-70 Cooper Avenue` | **GLENDALE** | `QN0503` by geocode; Wikipedia confirms the address. ⚠️ Its ZIP is **11374**, so print `89-70 Cooper Avenue, Queens, NY 11374` or omit the ZIP. It is a **private single-family residence** — publish no owner name. |
| **Nowadays** | `56-06 Cooper Avenue` | **RIDGEWOOD — DOHMH-only, address and existence only** | `QN0502`. **No prose whatsoever**, not even the category noun. |
| **Grover Cleveland High School** and **Grover Cleveland Playground** | `21-27 Himrod Street` / `3-96 Grandview Avenue` | **RIDGEWOOD** | DOE's own `nta_name = Ridgewood`, polygon `QN0502`, Nominatim Ridgewood. Maspeth cedes (*"nearby"* is the Parks sign's own word). Glendale cedes. |
| **Middle Village Prep Charter School** | `68-02 Metropolitan Avenue` | **RIDGEWOOD**, with the conflict disclosed | DOE `nta_name = Ridgewood` and polygon `QN0502` against Nominatim's "Middle Village". Say the data places it in Ridgewood; do not assert it flatly against the reader's postal intuition. |

⚠️ **Cooper Avenue crosses two lines and cannot be reasoned about as a whole.** `56-06` is Ridgewood,
`64-34–64-46` is Glendale, `78-16` is **Middle Village**, `89-70` is Glendale. No page may generalise
about "Cooper Avenue".

### 3.2 Maspeth ↔ Ridgewood

| Place | Address ruled from | **Ruling** | Rests on |
|---|---|---|---|
| **Metropolitan Oval (the field)** | `60-58 60th Street, Maspeth, NY 11378` | **MASPETH** | Rank 1 and rank 2 agree: the organisation's own Location page prints *"Maspeth, NY 11378"*, U.S. Soccer's headline reads *"Making History in **Maspeth**, Queens"*, GeoSearch returns Maspeth. **Ridgewood creates no record.** The German-Hungarian **club's** community story — *"in Ridgewood, Queens, already home to a bustling German community"*, clubhouse at `576 Fairview Avenue` (Ridgewood) — is **Ridgewood's context and Maspeth may not annex it.** ⚠️ There is a second Metropolitan Oval **in the Bronx**, and the corpus ships Bronx pages. |
| **Luke J. Lang Square** | Fresh Pond Road / 59th Road / 61st Street | **MASPETH** | NYC Parks: *"This triangle is located in the Queens neighborhood of **Maspeth**."* ⚠️ **Lang himself is Ridgewood's** — the same sign says he *"lived on Bleecker Street in the nearby neighborhood of Ridgewood."* Maspeth must not write him as a Maspeth resident, and **must not repeat Wikipedia's citywide superlative** *"The smallest park in New York City"* on Wikipedia's word alone; NYC Parks does not make that claim. The 0.001-acre figure (Q063) is separately confirmed and may ship. |
| **Reiff Playground** | `59-25 Fresh Pond Road` | **MASPETH** | Parks assigns the man to *"his neighborhood of Maspeth"*; the Ridgewood-Metropolitan Civic Association is an organisation's **name**, not a location. |
| **Fresh Pond Road, the corridor itself** | probes | **SPLIT — and neither page may generalise** | `59-25`, `60-54`, `62-00` return **Maspeth**; `65-20`, `70-20` return **Ridgewood**. Every Fresh-Pond-Road business in Maspeth's dossier (`60-39`, `60-54`, `60-61`) is on the Maspeth side and is Maspeth's. From roughly `65-xx` south the street is Ridgewood's. |
| **Frank Principe Park** | Q131 | **MASPETH** | The structured Open Data row says ZIP `11378` alone; the web page's extra `11377` is a postal straddle at the northern edge, not an assignment. Woodside ships and does not claim it. |
| **Maspeth High School** | `54-40 74th Street` | **MASPETH** | Address, geocoder and the school article's own specific sentence. Its lede's "Elmhurst" is unsupported by anything else, and the Forest Hills and Middle Village references are to **former** campuses. **Elmhurst and Forest Hills already ship and neither may carry it.** |
| **Knockdown Center** | `52-19 Flushing Avenue, Maspeth, NY 11378` | **MASPETH** | Wikipedia *"located in the **Maspeth** neighborhood"* plus GeoSearch. Press files it under Bushwick/East Williamsburg/Ridgewood; **that is press error, not evidence, and Ridgewood may not claim it.** ⚠️ Its own site was unreachable to the verifier — everything sourced only to `knockdown.center` (the 50,000 sq ft figure, "Gleason-Tiebout", "invented here in 1956 by Samuel Sklar") is `uncertain`, conflicts with Wikipedia's 1903 / 1930s / 20,000 sq ft account, and **must not be blended with it.** |
| **"Ridgewood Gardens" co-ops, 65th Place** | none | **NOBODY — no record in any file** | No address, no acreage, no institutional source. Maspeth's verifier probed eight 65th Place addresses: four return Maspeth, two Woodside, one Middle Village, one Fresh Pond — **none returns Ridgewood.** The name is not evidence of location. **Ridgewood may not claim it on the name; Maspeth may repeat Wikipedia's sentence with attribution and no record.** |
| **Calvary Cemetery** | `49-02 Laurel Hill Boulevard` | **SUNNYSIDE, already ships** | The office geocodes to Sunnyside; Sunnyside and Woodside both ship. **Maspeth creates no Calvary Cemetery record**; its honest, non-duplicating claims are **Fourth Calvary** and the 1845 land purchase *"in Maspeth"*. |
| **Mount Olivet Cemetery** | *(Maspeth; no street address obtained)* | **MASPETH** | Wikipedia: *"located in the **Maspeth** neighborhood."* ⚠️ **The phrase "Mt. Olivet Lutheran Cemetery" must never appear**, even quoted, without an explicit correction: the cemetery was Episcopal, then non-sectarian from 1851, and never Lutheran. NYC Parks repeats the error across three signs. |
| **St. Saviour's** | Rust Street & 57th Drive / 57th Road | **STORY MASPETH, OBJECT MIDDLE VILLAGE — no place record** | The dismantled fabric is stored in Middle Village. ⚠️ The Drive/Road suffix conflict between Wikipedia and QNS is real — **write neither silently.** |
| **Newtown Creek / Kosciuszko Bridge / Grand Street Bridge** | — | **NOBODY OWNS THEM** | The creek drained parts of Bushwick, Williamsburg and Greenpoint **in Brooklyn** and Maspeth, Ridgewood, Sunnyside and LIC in Queens. Maspeth's distinct claim is **Maspeth Creek**. ⚠️ **The Greenpoint oil spill is a Brooklyn event and must not be annexed** — Brooklyn ships 69 guides. |

### 3.3 Places all three must leave alone

**All Faiths Cemetery** (`67-29 Metropolitan Avenue`, `QN0571`), **Juniper Valley Park**,
**Middle Village Playground**, **Middle Village Veterans Triangle** (all ZIP 11379),
**Christ the King H.S.**, **78-16 Cooper Avenue** (`QN0504`) → **MIDDLE VILLAGE**, which is not a
wave-4 file. They simply go unclaimed. Wikipedia's inclusion of "Lutheran All Faiths" in Glendale's
cemetery belt is **refuted** as an assignment.

**St. John's Cemetery** → `QN0573`, its own NTA. **Nobody.**

**Elmhurst Park / the Elmhurst gas tanks** → **ELMHURST**, already ships (CB 4, ZIP 11373).

**Middle Village–Metropolitan Avenue station** → **MIDDLE VILLAGE**. It is the nearest station to
Maspeth and Maspeth must say so — but ⚠️ **the phrase "the nearest" needs its own verdict**; write
that Maspeth has no subway station (confirmed twice: Wikipedia, and the Queens Library branch page's
own *"NO TRAINS STOP HERE"*) and name the Middle Village station as the station it is.

**Seither Stadium** → **GLENDALE in prose only, attributed, no record.** One Wikipedia sentence; no
NYC Parks record exists in the CB5 inventory and no address is derivable.

---

## 4. THE ALLOW-LISTS

A place on your list is yours to create as a place record. A place **not** on your list gets **no
record in your file**, whatever your dossier says — and may be mentioned only as the neighbouring
place it is, only where your own verdict file confirms the mention.

### 4.1 GLENDALE MAY PUBLISH (20)

`Glendale` (the neighborhood) · `"Uncle" Vito F. Maranzano Glendale Playground` (2869 Central Avenue)
· `Drumm Triangle` · `Glendale Veterans Triangle / Glendale War Memorial` ·
`75th Avenue–61st Street Historic District` · `Central Avenue Historic District` ·
`Cooper Avenue Row Historic District` · `Sacred Heart R.C. Church & Catholic Academy` (83-17 78th
Avenue) · `St. Pancras R.C. Church` (72-22 68th Street) · `Queens Public Library, Glendale Branch`
(78-60 73rd Place) · `USPS Glendale Station` (69-36 Myrtle Avenue) ·
`FDNY Engine Co. 286 / Ladder Co. 135` (66-44 Myrtle Avenue) · `Zum Stammtisch` (69-46 Myrtle Avenue)
· `Glendale station (LIRR)` (closed 1998, historical) · `The Shops at Atlas Park` (80-00 Cooper
Avenue) · `Pinocchio Playground` (74-01 78th Avenue) · `Yer Man's Irish Pub` (70-26 88th Street) ·
`Mount Carmel Cemetery` (attributed, per §3.1) · `89-70 Cooper Avenue` · and `P.S. 91` **only** for
the naming fact.

**Constrained:** Yer Man's is **address-only** (DOHMH is its sole source); the one permitted sentence
is Wikipedia's *"Cooper's Ale House (now 'Yer Man's Irish Pub') is featured in the show The King of
Queens as a local bar"*, attributed, with nothing added. Atlas Park has **no website** — do not link
one, do not list tenants. St. Pancras and Pinocchio are **address-only**; invent no history.

**Glendale may NOT publish:** Forest Park or anything inside it · Evergreen Park · P.S. 68 ·
Mafera Park · the 104th Precinct station house · the Myrtle Avenue BID office · Fresh Pond Yards ·
Union Field, Machpelah, Mount Lebanon, Cypress Hills or All Faiths cemeteries · Highland Park /
Ridgewood Reservoir · Christ the King · St. John's Cemetery · 78-16 Cooper Avenue · Seither Stadium
(record) · The Assembly (drop entirely — no DOHMH row, no address, no evidence it exists).

### 4.2 MASPETH MAY PUBLISH (45)

`Maspeth` (the neighborhood) · `Transfiguration Catholic Church` (64-14 Clinton Avenue) ·
`Holy Cross R.C. Church` (61-21 56th Road) · `Metropolitan Oval` (60-58 60th Street) ·
`Knockdown Center` (52-19 Flushing Avenue) · `Maspeth Town Hall` (53-37 72nd Street) ·
`Queens Public Library, Maspeth branch` (69-70 Grand Avenue) · `Reiff Playground` (59-25 Fresh Pond
Road) · `Mount Olivet Cemetery` · `Maspeth Station (USPS)` (55-02 69th Street — check USPS first) ·
`Maspeth Federal Savings` (**no address** unless one is found) · `FDNY Squad 288 / Hazmat 1` (56-29
68th Street — address only, see below) · `Maspeth High School` (54-40 74th Street) ·
`Luke J. Lang Square` · `Frank Principe Park` · the remaining **17 NYC Parks properties in ZIP
11378** · and the **20 DOHMH-only food businesses** as **existence and address only**.

**Constrained:** ⚠️ **Do not publish Squad 288's 19 fatalities** until checked against FDNY or the
9/11 Memorial — Wikipedia phrases the superlative two different ways on one page, and a wrong 9/11
casualty count is not a small error. Publish **no** library hours or events (they changed between
fetches). Publish **no** growth rate from the 2010 and 2020 populations. Use the agency's
`signname` spellings — **Peter Chahales Park**, **Quick Brown Fox Triangle** — and note alternates
rather than silently choosing. ⚠️ **"Park Slope" (Q360P) is a 0.005-acre strip behind an overpass at
61st Street and Borden Avenue. It is not the Brooklyn neighbourhood.**

**Maspeth may NOT publish:** Forest Park (and must not mention it) · Calvary Cemetery (the place) ·
the Ridgewood Theater or the Onderdonk House · All Faiths · Juniper Valley Park · Elmhurst Park ·
"Ridgewood Gardens" · St. Saviour's as a place · the Grand Avenue Bus Depot's fleet or routes.

### 4.3 RIDGEWOOD MAY PUBLISH (52, minus the two NRHP districts ruled to Glendale → **50**)

`Ridgewood` (the neighborhood) · `Vander Ende-Onderdonk House` (1820 Flushing Avenue) ·
`Ridgewood Theater Building` (55-27 Myrtle Avenue) · `St. Matthias RC Church Complex` (58-15 Catalpa
Avenue) · the **4 LPC historic districts** (Ridgewood North, Ridgewood South, Central Ridgewood,
Stockholm Street) · the **NRHP districts** minus `Cooper Avenue Row`, `75th Avenue–61st Street` and
`Central Avenue` · the **8 parks whose polygon centroid lands in `QN0502`** (Rosemary's, Starr,
Grover Cleveland, Mafera, Benninger, Evergreen, Clemens Triangle, Myrtle Avenue Clemens Triangle) ·
`Queens Public Library, Ridgewood branch` (20-12 Madison Street) · the **12 DOE schools** whose own
`nta_name` reads Ridgewood · the **4 subway stations** (Fresh Pond Rd, Forest Av, Seneca Av,
Halsey St) · `Gottscheer Hall` (657 Fairview Avenue) · `Rudy's Bakery and Café` (905 Seneca Avenue) ·
`Rolo's` (853 Onderdonk Avenue) · `TV Eye` (1647 Weirfield Street) · `Trans-Pecos` (915 Wyckoff
Avenue) · `Onderdonk Cafe` (353 Onderdonk Avenue) and `Nowadays` (56-06 Cooper Avenue), both
**address-only**.

**Constrained:** the theater is confirmed to be **in gym use** — **the operator's name is uncertain
and must not be published** (Wikipedia says Blink Fitness, Nominatim says PureGym). Do **not** publish
Norma's or Morscher's at all — no Ridgewood address, no DOHMH row, and Morscher's domain now serves
casino spam. No Rudy's hours. No Onderdonk House weekend hours as current. No bank asset figure, no
bestplaces.net income figure, no bus-route list beyond the two the museum itself names. Do not create
a place record for the bank's main office on a street number whose only support is OpenStreetMap —
use *"the intersection of Myrtle and Forest Avenues."* Do not create a `Linden Hill` record.
⚠️ Do not merge the 1983 NRHP `Central Ridgewood Historic District` with the 2014 LPC district of the
same name — different designations, different boundaries, 31 years apart.

**Ridgewood may NOT publish:** Forest Park (and must not mention it) · the three Glendale NRHP
districts · the Myrtle Avenue BID **office** · Metropolitan Oval · Ridgewood Reservoir · Evergreens
Cemetery · Myrtle–Wyckoff Avenues station · the Ridgewood Savings Bank Forest Hills branch ·
Knockdown Center · "Ridgewood Gardens".

---

## 5. RULES BINDING ALL THREE AUTHORS

1. **County is `"Queens"` on every record in all three files.** Ridgewood especially: sources
   routinely put its addresses in Brooklyn and use 11385 loosely. The county line is Ridgewood's
   boundary with Bushwick, and everything on the Brooklyn side belongs to Brooklyn's 69 guides.
   Glendale's verifier tested all 26 of its candidates and **not one returned a Brooklyn NTA** — the
   Brooklyn hazard is Ridgewood's alone in this wave.

2. **Shared statistics must be labelled as shared.** The 166,924 population, the $71,234 median
   income, the life expectancy, the bodega ratio and the 104th Precinct crime rank are **CD 5**
   figures covering Glendale, Ridgewood, Maspeth **and Middle Village** together. Every
   health/education/safety figure in Maspeth's dossier is a combined **"Maspeth and Ridgewood"**
   statistic that Ridgewood could publish identically. Any use must say what it covers. ⚠️ **The
   sentence "Maspeth and Middle Village are generally seen as safer than Ridgewood" must not appear
   in any form on any page** — it is an unattributed comparative judgement about a sibling page.
   The 2010 racial breakdown is internally impossible ("1.0% (5) Pacific Islander") — do not print it.

3. **DOHMH provenance.** An inspection record establishes that a business exists and where it is. It
   may **never** appear in prose, not even the category noun, and its `cuisine_description` is a
   regulatory field, not a description. This binds Yer Man's (Glendale), Onderdonk Cafe and Nowadays
   (Ridgewood), and all twenty of Maspeth's.

4. **No invented aggregates.** Do not write "the eight parks", "the twelve schools", "three historic
   districts", "twenty restaurants". Those counts are this arbitration's bookkeeping, not a source.
   Name the items; do not total them.

5. **No research-process prose.** Never write about what the page, the series or the research found
   or did not find. This is the most-repeated defect in this corpus and it has reached production.
   In particular: **do not write that Forest Park "belongs to no neighborhood" as a finding about the
   corpus.** If Glendale states the JIA fact at all, state it as a fact about the Department of City
   Planning's tabulation areas, attributed to DCP.

6. **The banned phrasings are enforced on every string, including captions and link notes**, and
   "steps from" and "down the block" trip on their **literal** senses too. Write "stairs" and "along
   the block". Three captions have already been reworded for exactly this.

7. **No unrestated modifiers.** Notably: "one of the largest" may **not** be upgraded to "the
   largest" (the 3,982-homes claim); "the nearest station" needs its own verdict; Glendale's boundary
   with Forest Park may not be ranked; and Wikipedia's *"smallest park in New York City"* may not be
   restated in any page's own voice.

8. **Publish no PLUTO `yearbuilt` values** (`1931` is a placeholder recurring across unrelated
   Glendale lots) and **no City Council district number** (sources disagree and it moves).

---

## 6. WHAT WOULD OVERTURN THE CLOSE CALLS

Three rulings in this file were close. Each is recorded with its overturn condition so a later wave
does not have to re-derive it:

- **Forest Park → no file.** Overturned by: a dedicated Forest Park page, a borough-level holder, or
  a Kew Gardens page (whose ZIP the park's own address carries). **Not** by a new abutter — that
  argument is now exhausted in both directions.
- **Mount Carmel Cemetery → Glendale.** Rests entirely on the cemetery's own printed address block
  against DCP geometry that says `QN0574`. Overturned by any agency record placing the parcel in a
  named neighbourhood.
- **Evergreen Park → Ridgewood.** Close because the park straddles the line and a Glendale house
  number on the same avenue tests `QN0503`. Overturned by NYC Parks revising the sentence, or by a
  parcel-level record showing the playground and the school sit on the Glendale side.
