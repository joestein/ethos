# Kew Gardens, Queens — VERDICTS (wave 6, independent verifier)

**Method.** Every URL the finder cited that I could reach, I re-fetched myself. The LPC report
LP-2175 was downloaded as a PDF and text-extracted locally (`pdftotext -layout`), so every `[Q-PDF]`
below is re-quoted from the machine-readable text, not from the finder. NYC Parks pages that block
the fetch tool were retrieved by `curl` with a browser UA and parsed locally. Where I confirm a
quote, I re-read it; where I could not, the verdict is `uncertain`, never `confirmed`.

**One instrument the finder did not use, and it decides most of the contested list.** The NYC
Department of City Planning geocoder (`geosearch.planninglabs.nyc/v2/search`) returns a neighborhood
label for any city address. This is the SAME instrument wave 4 used to rule on Forest Park
("the city's geocoder returns the neighborhood 'Forest Park' for its Park Lane address" —
forest-hills.json, forest-park record). Applying it consistently resolves seven of the finder's
fourteen contested items outright. Results are tabulated in §2.

---

# 1. HEADLINE COUNT

| | |
|---|---|
| Claims adjudicated (F1–F168) | **168** |
| Confirmed | **119** |
| Refuted | **11** |
| Uncertain | **38** |
| Candidate places recorded (P1–P41) | 41 |
| **Places surviving as publishable** | **14** |

Confirmation rate 71%. That is where it should be for a dossier whose strongest vein is a footnoted
LPC designation report and whose weakest is a single self-published blog post carrying twelve
apartment houses.

---

# 2. NEIGHBORHOOD ASSIGNMENT — THE RULINGS

Geocoder output for every candidate address, run 2026-09-02. `nbhd` is the DCP neighborhood label;
`zip` is the postal code the city returns for the parcel.

| Address queried | Geocoder label | nbhd | zip |
|---|---|---|---|
| 127-15 Kew Gardens Road | 127-15 KEW GARDENS ROAD | **Kew Gardens** | 11415 |
| 83-15 Kew Gardens Road (NRHP address) | 83-15 KEW GDNS ROAD | **Kew Gardens** | 11415 |
| 115-24 Grosvenor Road | 115-24 GROSVENOR ROAD | **Kew Gardens** | 11418 |
| 85-09 118th Street | 85-09 118 STREET | **Richmond Hill** | 11415 |
| 117-01 Park Lane South | 117-01 PARK LANE SOUTH | **Forest Park** | 11418 |
| 120-55 Queens Boulevard | 120-55 QUEENS BOULEVARD | **Kew Gardens** | 11415 |
| 125-01 Queens Boulevard | 125-01 QUEENS BOULEVARD | **Kew Gardens** | 11415 |
| 82-70 Austin Street | 82-70 AUSTIN STREET | **Kew Gardens** | 11415 |
| 82-17 Lefferts Boulevard | 82-17 LEFFERTS BOULEVARD | **Kew Gardens** | 11415 |
| 82-37 Kew Gardens Road | 82-37 KEW GARDENS ROAD | **Kew Gardens** | 11415 |
| 83-34 Kew Gardens Road | 83-34 KEW GDNS ROAD | **Kew Gardens** | 11415 |
| 81-05 Lefferts Boulevard | 81-05 LEFFERTS BOULEVARD | **Kew Gardens** | 11415 |
| 81-45 Lefferts Boulevard | 81-45 LEFFERTS BOULEVARD | **Kew Gardens** | 11415 |
| 83-30 Austin Street | 83-30 AUSTIN STREET | **Kew Gardens** | 11415 |
| 80-45 Kew Gardens Road | 80-45 KEW GARDENS ROAD | **Kew Gardens** | 11415 |
| 125-02 84th Road | 125-02 84 ROAD | **Kew Gardens** | 11415 |
| 116-14 Grosvenor Lane | 116-14 GROSVENOR LANE | **Kew Gardens** | 11418 |
| 119-17 Union Turnpike | 119-17 UNION TURNPIKE | **Forest Hills** | 11375 |
| 87-34 118th Street | 87-34 118 STREET | **Richmond Hill** | 11418 |
| 118-14 Hillside Avenue | 118-14 HILLSIDE AVENUE | **Richmond Hill** | 11418 |
| 85-12 Main Street | 85-12 MAIN STREET | **Briarwood** | 11435 |
| 72-33 Vleigh Place | 72-33 VLEIGH PLACE | **Kew Gardens Hills** | 11367 |
| 67-29 108th Street | 67-29 108 STREET | **Forest Hills** | 11375 |
| 111-02 Queens Boulevard | 111-02 QUEENS BOULEVARD | **Forest Hills** | 11375 |
| 91-45 121st Street | 91-45 121 STREET | **Richmond Hill** | 11418 |
| 120-85 83rd Avenue | **no match** (falls back to 120-23 83 AVENUE) | Kew Gardens | 11415 |
| 80-30 Park Lane (Forest Park, for comparison) | 80-30 PARK LANE | **Forest Park** | 11415 |

## 2.1 Maple Grove Cemetery — **KEW GARDENS**. Contested item 1 RESOLVED.

**Exact address: 127-15 Kew Gardens Road, Kew Gardens, NY 11415.**

The finder recorded a three-way conflict. It is not three-way. Two of the three legs hold and they
agree; the third is a misreading.

* **Friends of Maple Grove Cemetery** (the cemetery's own affiliated nonprofit) prints
  "127-15 Kew Gardens Road, Kew Gardens, New York, 11415". Re-fetched; **F72 confirmed.**
* **Wikipedia** lead sentence, re-quoted verbatim: *"Maple Grove Cemetery is a 65-acre (26 ha)
  cemetery at 127-15 Kew Gardens Road in the Briarwood and Kew Gardens neighborhoods of Queens in
  New York City, New York, U.S."* **F73 confirmed.** Kew Gardens is one of the two it names.
* **NYC Parks does NOT assign the cemetery to Richmond Hill. F74 is REFUTED as an assignment.**
  The sign's actual sentence, re-quoted from the live page:
  > "The site was located in what was then known as Hayestown, an area now mostly contained within
  > Richmond Hill, that was founded in the 19th century by general store owner Ambrose Hayes."
  That is a statement about a vanished 19th-century place name — *what the site was then known as* —
  qualified by "mostly". It is not a present-day neighborhood assignment and cannot be read as one.
  The finder's own contested-list entry ("**Richmond Hill** (NYC Parks)") overstates its source.
* **The city geocoder returns Kew Gardens** for the cemetery's address, and for the NRHP address too.

**Ruling: Maple Grove Cemetery is in Kew Gardens.** Best-evidenced by a wide margin: the
institution's own printed address, the city's own geocoder, and half of Wikipedia's straddle claim
all agree. The Briarwood half of the straddle is real (the cemetery's eastern edge runs to the Van
Wyck) and the author may say the grounds *extend toward* Briarwood, but the record belongs here.

**F78's NRHP claim is REFUTED, in the finder's favour.** The finder wrote "I could NOT confirm the
claimed 2004 NRHP listing… Treat 'NRHP-listed' as UNCONFIRMED." It is confirmed. I pulled the raw
wikitext of *National Register of Historic Places listings in Queens, New York* (the finder queried
the redirect title, which is why the row was missed) and the row reads:

```
|refnum=04000874  |type=HD  |name=Maple Grove Cemetery
|address=83-15 Kew Gardens Rd.  |city=[[Kew Gardens, Queens|Kew Gardens]]
|date=2004-08-20
```

**⚑ New conflict the finder did not have: two addresses.** The NRHP row gives **83-15 Kew Gardens
Rd.**; the cemetery's own nonprofit gives **127-15 Kew Gardens Road**. Both geocode to Kew Gardens
11415 and are real, distinct parcels on the same road. **Publish 127-15** — it is the institution's
own printed address. Do not print 83-15 without saying it is the National Register's address.
The nomination PDF (`npgallery.nps.gov/NRHP/GetAsset/NRHP/04000874_text`) returns the literal string
"The PDF file for this National Register record has not yet been digitized." — so the listing's
extent and period of significance remain unknown. Say "listed on the National Register in 2004" and
nothing more.

## 2.2 Church of the Resurrection — **RICHMOND HILL, not Kew Gardens.** Contested item 2 RESOLVED.

**Exact address: 85-09 118th Street, Queens, NY 11418.** (Note: the geocoder returns ZIP 11415 for
this parcel while Wikipedia's NRHP row and the church's Richmond Hill context imply 11418. Do not
print a ZIP for this building; you do not need one, and it is not yours to print in any case.)

* Wikipedia's article first sentence, re-quoted: *"The Church of the Resurrection is a historic
  Episcopal church and rectory in **Richmond Hill**, Queens, New York City."* **F130 confirmed.**
* Wikipedia's *Richmond Hill, Queens* article calls it *"an 1874 structure and is the oldest house
  of worship in Richmond Hill"* and places it at the northern edge of that neighborhood.
  **F131 confirmed.**
* The NRHP row hedges: `city=[[Kew Gardens, Queens|Kew Gardens]]/[[Richmond Hill, Queens|Richmond
  Hill]]`. **F129 confirmed verbatim from wikitext.** A hedge is not a ruling.
* **The city geocoder returns `Richmond Hill`** for 85-09 118 Street.
* The nomination that would settle it is **not digitized** — `03000090_text` returns the same
  placeholder string. **F133 confirmed.**

**Ruling: Richmond Hill.** The only leg pointing at Kew Gardens is a Wikipedia infobox field and one
half of a slash in a table. Against it: the article's own prose, a second Wikipedia article, and the
city geocoder. **The Kew Gardens page must not carry this church as a place, and must not narrate
Theodore Roosevelt at the Riis wedding, the 1874 date, Nathaniel W. Vickers, or the Elizabeth Riis
window.** All of that is Richmond Hill's, and Richmond Hill is a sibling file in this same wave.

## 2.3 Kent Manor — **NOT KEW GARDENS. Omit entirely.** New ruling; the finder called it a strong lead.

**117-01 Park Lane South.** The geocoder returns neighborhood **"Forest Park"**, ZIP 11418, on tax
block 3312 — the same block as Forest Park itself (Forest Park's own record in forest-hills.json is
BBL 4033122000, block 3312 lot 2000; Kent Manor is block 3312 lot 8). It sits inside the same
jointly-interested tabulation area on which wave 4 ruled that Forest Park belongs to **no**
neighborhood.

Against that, the NRHP row says `city=Kew Gardens` (**F134 confirmed**: refnum 100007667, listed
2022-04-28, address "117-01 Park Ln. South"). But the nomination is not digitized either, so the
building has **no year built, no architect, no style, no period of significance, and no prose of any
kind attached to it anywhere I could reach**.

**Ruling: uncertain assignment, and zero content. OMIT.** A place record whose only fact is its own
name, on a parcel the city labels "Forest Park", is not worth the risk of manufacturing a Kew
Gardens claim the corpus would then have to defend.

## 2.4 Kew-Forest School — **FOREST HILLS.** Contested item 5 RESOLVED.

**119-17 Union Turnpike, Forest Hills, NY 11375** — the school's own printed address, re-confirmed,
and the geocoder agrees (`Forest Hills`, 11375). I asked the source directly whether it ever says
the school is in Kew Gardens: it does not. It names Kew Gardens only as a neighbouring area.
**F135 confirmed.** Wikipedia's Kew Gardens timeline line "1918: Kew-Forest School established" and
the subway article's proximity sentence are both *proximity*, not containment.

**Ruling: Forest Hills. Not a Kew Gardens place.** The Kew Gardens page may say the neighborhood's
name is half of the school's name; it may not claim the school.

## 2.5 NYPD 102nd Precinct station house — **RICHMOND HILL.** Contested item 6 RESOLVED.

NYPD's own page, re-quoted: *"The 102nd Precinct serves a portion of central Queens containing Kew
Gardens, Richmond Hill East, Richmond Hill, Woodhaven, and the northern part of Ozone Park."*
Station house printed as **87-34 118th Street, Richmond Hill, NY, 11418-2527**. Geocoder: Richmond
Hill, 11418. **F145 confirmed verbatim; F146's address confirmed.**

**Ruling: the precinct SERVES Kew Gardens; it SITS in Richmond Hill.** Wikipedia's Kew Gardens
article prints the bare address inside a Kew Gardens section, which is how this error gets made.
Do not make it. Same for the two fire companies (**F144 confirmed**): Engine 305/Ladder 151 is
111-02 Queens Boulevard, **Forest Hills**; Squad 270/Division 13 is 91-45 121st Street, **Richmond
Hill** — geocoder confirms both.

## 2.6 Hoover-Manton Playgrounds — **NOT KEW GARDENS.** Contested item 11 RESOLVED.

NYC Parks page re-fetched by curl. Location line: *"Manton St. bet. 83 Ave., 134 St. and Main St."*
More About panel: **"Zip Code: 11435 / Community Board: 8 / Council Member: James F. Gennaro /
Park ID: Q220G / Acreage: 5.20 / Property Type: Neighborhood Park."** **F87 confirmed verbatim.**
CB8 and 11435 are Briarwood/Jamaica. **Ruled OUT of this file.**

## 2.7 The 1950 crash — **KEW GARDENS**, with the Richmond Hill name stated. Contested item 3 RESOLVED.

The article is titled *Richmond Hill train crash*, but its own body says the trains
*"collided between Kew Gardens and Jamaica stations in Kew Gardens, Queens, New York City"* and
gives *"Richmond Hill disaster"* as the alternate name. **F110, F111, F112 all confirmed.** The
Kew Gardens LIRR station article puts the collision east of that station.

**Ruling: the crash site is in Kew Gardens; the disaster is conventionally named for Richmond Hill.**
Both are true and the honest sentence says both. Do not write "the Richmond Hill disaster happened
in Richmond Hill" and do not write "in Kew Gardens" without the name. **This is not an exclusive
claim** — Richmond Hill's page in this same wave has an equally good right to the name half. The
author must write it so that both pages can stand, i.e. attribute the naming, don't own the event.

## 2.8 Kew Gardens–Union Turnpike station — **SHARED, may not be claimed.** Item 4 confirmed as contested.

Re-quoted: the station is at *"the border of Kew Gardens and Forest Hills, Queens"* with entrances
in each. **F64 confirmed. Neither page may claim it exclusively.** Forest Hills has shipped; check
what forest-hills.json already says before writing a competing record.

## 2.9 Streets and infrastructure — none claimable whole (items 7–10, 13, 14)

* **Lefferts Boulevard** (F44 confirmed): *"running through the communities of Kew Gardens, Richmond
  Hill, and South Ozone Park"*; 119th Street for its entire run; northern terminus Kew Gardens Road,
  southern terminus inside JFK. Not claimable whole.
* **Austin Street** (F41 confirmed in part): FNY — *"Austin Street runs along the tracks from Eliot
  Avenue to Metropolitan Avenue."* That spans Rego Park and Forest Hills. Not claimable whole. The
  finder's trailing clause "as a less crowded parallel to Queens Boulevard" did not come back in my
  re-fetch — **do not publish it as a quote.**
* **Kew Gardens Interchange** (F106, F107 confirmed): Wikipedia itself puts it *"between the
  neighborhoods of Kew Gardens, Kew Gardens Hills and Briarwood and Flushing Meadows-Corona Park"*.
  It is a four-way straddle **that touches a settled off-limits area**. Mention as the northern edge
  if you must; do not make a place record and do not narrate anything inside Flushing
  Meadows–Corona Park.
* **Jackie Robinson Parkway** (F108 confirmed in part): *"runs through Highland Park, along the
  north side of Ridgewood Reservoir, and through Forest Park"*, 4.95 miles, opened July 1935,
  eastern terminus *"at the Kew Gardens Interchange in Kew Gardens, Queens"*. The finder's Giuliani
  quote ("In April 1997, mayor Rudy Giuliani announced…") did **not** come back; what came back is
  *"The Interboro Parkway was renamed for Major League Baseball player Jackie Robinson in 1997."*
  **Uncertain — do not publish the Giuliani sentence as a quote.** The spelling conflict is real and
  confirmed: LPC prints "Interborough", Wikipedia prints "Interboro".
* **Queens Boulevard** (F109 **uncertain** — I did not re-fetch the article): and in any case the
  "Boulevard of Death" figures are corridor-wide. **Do not attribute pedestrian deaths to Kew
  Gardens.** The finder is right to warn; I am adding that the statistic should simply not appear.
* **Southern Kew Gardens Road** (F7 confirmed as a quote, **corrected as a gloss**): FNY's
  *"a little neighborhood that's not quite Kew Gardens, not quite Richmond Hill, and not quite
  Jamaica"* describes **one specific spot near the Van Wyck Expressway**, not the whole seam. The
  finder called it "the best single citation for 'contested' as a condition." It is not; it is a
  citation for one block being indeterminate. Do not generalise it into a boundary sentence.

## 2.10 The neighborhood's own boundaries (item 14) — WRITE THE WIKIPEDIA LINE, ATTRIBUTE THE LPC LINE

Both are confirmed verbatim, and they genuinely disagree.

**F1 confirmed** — LPC LP-2175 p. 3, re-read off the extracted PDF text:
> "Located in central Queens, the area known as Kew Gardens is bounded by the Jackie Robinson
> (originally Interborough) Parkway and Queens Boulevard on the north, Kew Gardens Road on the east,
> Myrtle Avenue on the south and Forest Park on the west."
Footnote 11, re-read: *"Information about Kew Gardens comes from, Barry Lewis, Kew Gardens: Urban
Village in the Big City (New York: Kew Gardens Council for Recreation and the Arts, 1999)."*
(The finder rendered the publisher as "Kew Gardens Council for **the** Recreation and the Arts" —
minor, but fix it if you cite it.)

**F2 confirmed and UPGRADED from `[P]` to `[Q]`** — I pulled the exact string:
> "bounded to the north by the Union Turnpike and the Jackie Robinson Parkway, to the east by the
> Van Wyck Expressway and 131st Street, to the south by Hillside Avenue, and to the west by Park
> Lane, Abingdon Road, and 118th Street."

**Ruling.** The LPC line is a 2005 report reciting a 1999 local-history book, and its eastern edge
(Kew Gardens Road) would place Maple Grove Cemetery — the neighborhood's oldest institution, whose
own address is *on* Kew Gardens Road — outside Kew Gardens. The city's geocoder puts the cemetery,
and every other address east of that line I tested, inside Kew Gardens. **The Wikipedia line is
better evidenced for the eastern edge.** For the south, Richmond Hill's own article says
*"Hillside Avenue forms its northern boundary with Kew Gardens east of Lefferts Boulevard"*
(**F5 confirmed**) — the two articles agree on Hillside Avenue, so the LPC's Myrtle Avenue (which
runs *inside* Forest Park) is the outlier.

Write the boundary with **both** attributed, or write neither. Do not write an unattributed
composite. Do not write "Kew Gardens extends to Hillside Avenue" as flat fact against Richmond Hill's
page in the same wave.

## 2.11 Places ruled to other files or to none — summary

| Place | Ruling | Evidence |
|---|---|---|
| Church of the Resurrection, 85-09 118th St | **Richmond Hill** | article prose + RH article + geocoder |
| Kew-Forest School, 119-17 Union Tpke | **Forest Hills** | own address + geocoder |
| 102nd Pct station house, 87-34 118th St | **Richmond Hill** | NYPD's own page + geocoder |
| Engine 305/Ladder 151, 111-02 Queens Blvd | **Forest Hills** | geocoder |
| Squad 270/Division 13, 91-45 121st St | **Richmond Hill** | geocoder |
| Hoover-Manton Playgrounds | **Briarwood/Jamaica (CB8, 11435)** | NYC Parks panel |
| Kent Manor, 117-01 Park Lane South | **no neighborhood (Forest Park JIA)** | geocoder, block 3312 |
| Hampton Court Apartments | **inside Forest Park → no file** | FNY, uncorroborated |
| Cong. Machane Chodosh, 67-29 108th St | **Forest Hills** | own site + geocoder |
| Ridgewood Savings Bank / Midway Theater / Our Lady Queen of Martyrs / Kennedy House | **Forest Hills** | FNY addresses + geocoder |
| QPL Kew Gardens Hills branch, 72-33 Vleigh Pl | **Kew Gardens Hills (Flushing 11367)** | QPL + geocoder |
| QPL Richmond Hill branch, 118-14 Hillside Ave | **Richmond Hill** | QPL + geocoder |
| QPL Briarwood branch, 85-12 Main St | **Briarwood** | QPL + geocoder |
| Parkway Village | **Jamaica** | LPC note 5 |
| Prospect Cemetery, 159th St & Beaver Rd | **Jamaica** | NYC Parks sign |
| Ev's Eleventh Hour Bar | **Hollis** | Genovese article |
| Forest Park | **no neighborhood file** (settled wave 4) | — |
| Flushing Meadows–Corona Park + 8 CitiFieldPlaces | **off-limits corpus-wide** | — |

---

# 3. THE STRUCTURAL QUESTION: ALLEY POND PARK AND THE MARQUEE GATE

## 3.1 What I verified about the gate

I read `test/ethos/seeds/queens_seed_data_test.exs` directly. The assertion is
`each marquee queens institution appears in exactly one neighborhood`, still carrying
`@tag :pending_queens`, over `@marquee_institutions` = Forest Park, **Alley Pond Park**, Astoria
Park, Socrates Sculpture Park, Louis Armstrong House Museum. Its failure message says zero
*"means it fell between two waves — the park rows span community districts, so each wave can assume
the other covered it."*

I then scanned all sixteen shipped `priv/seed_data/queens/*.json` for matching slugs:

* `forest-park` → **exactly one** occurrence, in `forest-hills.json`, with `town: "Queens"`,
  `address: "80-30 Park Lane, Queens, NY 11415"`, and history prose that begins *"The park is not
  administratively part of any neighborhood…"*. Passes at 1.
* `alley-pond-park` → **zero** occurrences anywhere. Fails at 0.
* `bayside.json` mentions "Alley Pond" **8 times** in prose, including a dedicated FAQ
  *"Is Alley Pond Park in Bayside?"* answered *"Alley Pond Park borders Bayside along the
  neighborhood's eastern edge."* `douglaston.json` mentions it **twice**, both "borders".

So both abutting files already carry the correct *non*-containment prose. What is missing is only
the record.

## 3.2 RULING: **(a). Alley Pond Park gets a hosted record, in `bayside.json`.**

I reject (b) and (c) on the merits, not on effort.

**(c) is the option that looks principled and is not.** The gate's own moduledoc says the list "has
to be written from outside the thing it checks", and that exactly-once was chosen over at-least-once
deliberately, because at-least-once catches the omission but not the duplicate. Any rewrite that
lets a listed institution sit at zero — "at most one", or a second list of parks exempt from the
floor — reopens precisely the fall-through the row exists to close, for Forest Park and for every
future park that spans two waves. And the exemption would have to be maintained by hand against a
verdict record, which is a second hand-written list that can go stale silently. The gate is not
wrong. It asserts something true: a marquee institution should be findable in the corpus exactly
once.

**(b) is incoherent as stated.** Removing `forest-park` from `forest-hills.json` moves Forest Park
from 1 to 0, so the gate then fails on *two* rows instead of one. (b) only "works" if it is silently
also (c). Worse, it deletes a live page — `/p/forest-park` exists today — to satisfy a gate, which
inverts the relationship between the corpus and its tests. And it costs the reader the only record
of a 506.86-acre flagship park in the entire Queens corpus.

**(a) is right because the corpus has already answered this question once, correctly.** "No
neighborhood may claim it" is a *containment* statement; "some file stores the record" is a
*storage* statement. `forest-hills.json`'s forest-park record is the proof they are separable:
`town: "Queens"` rather than `town: "Forest Hills"`, no containment claim anywhere in the JSON, and
history prose that states in its first clause that the park is in no neighborhood. Nothing about
that record asserts Forest Hills contains Forest Park. There is no principled difference between
Forest Park and Alley Pond Park that would justify one having a page and the other not — both are
marquee, both were ruled to no neighborhood, both are things a reader searches for by name. The
inconsistency the coordinator flagged is real, and the way to resolve an inconsistency between a
shipped good pattern and a gap is to extend the pattern, not to delete it.

## 3.3 Which file, and what the record may contain

**`priv/seed_data/queens/bayside.json`.** Both candidates are defensible; Bayside is better:

1. The wave-5 record (per the coordinator's brief) has **area favouring Bayside**. Area is the only
   one of the four cited factors that measures how much of the park is next to which neighborhood.
2. The gate's own moduledoc names the abutters in this order: *"Alley Pond Park through Bayside,
   Douglaston and Oakland Gardens, in district 11."* Bayside is first and Oakland Gardens is not in
   scope, so it cannot host.
3. `bayside.json` already carries **four times** as much Alley Pond prose as `douglaston.json`,
   including a question explicitly *about* the park. A record there lands next to prose that already
   frames the relationship correctly; a record in Douglaston would sit next to two passing clauses.
4. Bayside has an institutional tie neither other file has: the Bayside Historical Society, in its
   own words already quoted in `bayside.json`, was founded *"with three goals: The preservation and
   restoration of the Lawrence Family Cemetery , Alley Pond and Fort Totten."*

**This is an instruction to the COORDINATOR, not to any author in wave 6.** `bayside.json` and
`douglaston.json` both shipped in earlier waves; no Kew Gardens/Jamaica/Richmond Hill/Rockaway
author may touch them.

**What the record may contain — follow forest-park exactly:**

* `slug: "alley-pond-park"` (matches `~r/^alley-pond-park/`; a sub-place like
  `alley-pond-park-adventure-course` would also match and, in the same file, still counts as one).
* `kind: "park"`, `town: "Queens"`, `state: "New York"`, `county: "Queens"`.
* **No containment claim in any field.** Not "in Bayside", not "Bayside's Alley Pond Park".
* Prose must state plainly that the park is administratively part of no neighborhood, with the
  wave-5 grounds: no street address on any instrument, every source says *borders*, area favours
  Bayside, boundary favours Douglaston, a third abutter outranks Bayside, and it reaches Community
  District 13. That is the same shape as forest-park's history field.
* **Address: do NOT invent one, and do NOT reuse the Alley Pond Environmental Center's address.**
  Forest Park could use "80-30 Park Lane" because NYC Parks prints it and the geocoder resolves it.
  If NYC Parks prints no street address for Alley Pond Park, leave the field out or carry the Parks
  extent string. Borrowing the Environmental Center's address would create a false marquee address
  and would collide with a separately-recordable institution.
* Facts should come from the NYC Parks Alley Pond Park page only (Park ID, acreage, property type,
  the ZIP and community-board lists) — the same structural evidence that proves it spans several
  neighborhoods.

**And the gate stays as written.** Do not touch `@marquee_institutions` and do not weaken
`assert n == 1`.

---

# 4. PUBLISHABLE ADDRESSES

Fourteen places survive. Exact publishable strings:

| # | Place | Publishable address string | Assignment |
|---|---|---|---|
| 1 | Ralph Bunche House | `115-24 Grosvenor Road, Kew Gardens, Queens, NY` | Kew Gardens (unanimous) |
| 2 | Kew Gardens LIRR station / Lefferts Boulevard bridge shops | Lefferts Boulevard at Austin Street, Kew Gardens | Kew Gardens |
| 3 | Maple Grove Cemetery | `127-15 Kew Gardens Road, Kew Gardens, NY 11415` | **Kew Gardens (ruled §2.1)** |
| 4 | Maple Grove Park (NYC Parks Q220F) | no street address; ZIP 11415, CB 9, 1.50 acres, Triangle/Plaza | Kew Gardens (by ZIP + CB) |
| 5 | Queens Borough Hall | `120-55 Queens Boulevard, Kew Gardens, NY 11415` | Kew Gardens |
| 6 | Kew Gardens Cinema | `81-05 Lefferts Boulevard, Kew Gardens, NY` | **Kew Gardens (NEW — see §5.1)** |
| 7 | Kew Gardens Synagogue (Adath Yeshurun) | `82-17 Lefferts Boulevard, Kew Gardens, New York 11415` | Kew Gardens |
| 8 | P.S. 099 Kew Gardens | `82-37 Kew Gardens Road, Queens, NY 11415` | Kew Gardens |
| 9 | Le Petit Paris | `81-45 Lefferts Blvd., Kew Gardens` | Kew Gardens |
| 10 | Austin's Ale House | `82-70 Austin St., Kew Gardens` | Kew Gardens |
| 11 | Nabhya Indian Restaurant and Bar | `120-85 83rd Ave, Kew Gardens` **⚑ see §5.4** | Kew Gardens |
| 12 | Kew Gardens post office (USPS "Kew Gardens Station") | `83-30 Austin Street` | Kew Gardens ⚑ single-sourced |
| 13 | Newcombe Square (NYC Parks property) | no address; NYC Parks: "between Queens Boulevard, Kew Gardens Road, and 84th Street" | Kew Gardens |
| 14 | Kew Gardens–Union Turnpike subway station | Union Turnpike at Queens Boulevard | **shared — may not be claimed** |

**Withheld for want of a verified address:**
* **Queens Criminal Court / Queens Supreme Court, Criminal Term.** The finder's "commonly cited"
  125-01 Queens Boulevard does geocode to Kew Gardens 11415 — but a geocoder proves the *parcel*
  exists, not that it is the court's address. `nycourts.gov` still 403s. **F102 uncertain. Do not
  print an address.** You may say a county criminal court stands beside Borough Hall on Queens
  Boulevard; three sources support that (F67, F85, F96).
* **Queens Detention Complex / borough-based jail.** qns.com's "at Union Turnpike between 126th
  Street and 132nd Street" is, on re-reading, the site of the **parking garage and community space**
  — the source says *"on the west side of the existing parking lot at Union Turnpike between 126th
  Street and 132nd Street."* **The finder's F103 attributes that string to the jail site. Corrected.**
* **Kent Manor** — omitted (§2.3).
* **Women's Plaza** — see §5.2.

---

# 5. WHAT THE AUTHOR MUST BE WARNED ABOUT

## 5.1 One gap is now closed — Kew Gardens Cinema

The finder wrote "Do not print an address for this theater without checking." I checked. The
operator's own site (`kewgardenstheatre.com`, 200 by curl with a browser UA; it 403s the fetch tool)
prints, in its own location list:

> "Kew Gardens, NY / Kew Gardens Cinema / **81-05 Lefferts Boulevard**"

and identifies the operator as **H & K Cinemas** ("Kew Gardens Cinema Movie Theater in Kew Gardens,
NY | H & K Cinemas"). The geocoder resolves 81-05 Lefferts Boulevard to Kew Gardens, 11415.
**Address and operator are now sourced. Screen count is still unverified** — Wikipedia's
"six-screen multiplex" (F120 confirmed as a quote) is the only source and is single-sourced.

## 5.2 "Women's Plaza" is NOT an NYC Parks property name

I searched `nycgovparks.org` for "Women's Plaza": no such property is returned (the search returns
Queens Plaza East, James Madison Plaza, Tramway Plaza, Grand Army Plaza, etc. — not this). By
contrast the same search for "Newcombe" returns **"Newcombe Square, Queens"** as a real property, so
the search does work. **F98 confirmed as a Forgotten New York description; REFUTED as a park name.**
Write it as "the plaza in front of Borough Hall, which Forgotten New York describes as Women's
Plaza", or do not name it. The Civic Virtue arc itself is fully sourced and safe (F99–F101, F100
confirmed) with one correction: **$90,000 was the size of Angelina Crane's bequest**, not a
"cost to complete" — do not publish the finder's `[Q]` gloss.

## 5.3 Quotes the finder presented that I could NOT reproduce — do not publish as quotes

* **F124, the Mavilia quote.** The source gives *"Local neighborhoods are under siege. You know,
  they're losing their identity as a specific neighborhood."* The finder spliced on
  *"…Having an art exhibit dedicated to Kew Gardens makes them feel that their neighborhood
  matters."* across an ellipsis. **REFUTED as a single quotation.**
* **F62, the Comrie quote.** The source reads *"We remain committed to ensuring that the existing
  commercial tenants who have built their livelihoods on this bridge are not treated as if they are
  expendable."* The finder prefixed *"More importantly,"*. **REFUTED.**
* **F164, Q Gardens Gallery.** I asked the FNY Lefferts bridge article directly: **Q Gardens Gallery
  is not mentioned anywhere in it. REFUTED.** The finder was right about Dani's House of Pizza —
  confirmed to be in **reader comments only**, and it must not be used.
* **F159, "the Flankie."** qns.com says it *"has a chocolate chip cookie dough crust and a vanilla
  pastry on the inside"*. The finder wrote "a chocolate-chip-cookie crust pastry **topped with
  vanilla flan**." **REFUTED.** Use the source's wording.
* **F108, the Giuliani sentence.** Not reproduced. **Uncertain.**
* **F41's trailing clause, F119 (Dangerfield/Genovese above the Ale House), F138's "alma mater of
  Jerry Springer".** None came back in my re-fetch of the FNY article. **Uncertain — do not quote.**
* **F149–F155** (the Mowbray, Shellball, Park Lane Towers, Hampton Court, Homestead Hotel, All Green
  Towers, Windsor Court, Dale Gardens, Classic Condos, Chatillon Scale). Of the twelve FNY
  apartment-house lines only **Kew Hall** (*"Built in 1922, it was based on Manhattan's Dakota
  Apartments"*) and the Cinemas line came back. **The other ten are uncertain and single-sourced to
  a self-published blog. If any ships, it ships with in-text attribution to Forgotten New York or
  not at all.** Hampton Court in particular is placed by FNY *inside Forest Park* — do not touch it.

## 5.4 Nabhya's address does not resolve in the city address database

qns.com prints **"120-85 83rd Ave, Kew Gardens"** — confirmed verbatim. But the DCP geocoder does
not match 120-85 83rd Avenue; it falls back to 120-23 83 Avenue. Either the house number is a typo
in the source or the parcel is not in the address file. **Single-sourced and unresolvable. Publish
the address only with attribution ("qns.com gives the address as…"), or omit the address.**

## 5.5 Sourcing statement on businesses — confirmed, with the brief's rule restated

**No business in this dossier rests on a DOHMH or DCWP inspection record.** The finder states it did
not consult either dataset, and every business I checked (Le Petit Paris, Nabhya, Austin's Ale
House, Homestead Gourmet Shop, El Rinconcito) traces to qns.com editorial reporting or to Forgotten
New York. **Confirmed.** So the brief's inspection-record rule — existence and address publishable,
nothing in prose — **binds nothing here**, and every one of these businesses may appear in prose,
with the single-source caveats in §5.6.

## 5.6 Every single-sourced claim, and whether it may ship

| Claim | Sole source | May ship? |
|---|---|---|
| Le Petit Paris — owners, opening, hours, the Flankie | qns.com, 2026-01 | **Yes, with attribution.** Correct the Flankie wording. |
| Homestead Gourmet Shop — German/Polish deli, "nearly 80 years" | qns.com (one sentence) | **Yes, attributed.** No closing date exists; do not invent one. Do **not** link it to FNY's "Homestead Hotel"/"Homestead Building" — no source connects them. |
| Nabhya — owners, Eternity 2021–2024, hours | qns.com, 2024-12 | **Yes, attributed.** Address caveat §5.4. |
| El Rinconcito De Los Sabores #5 | qns.com, 2024-12 | **Uncertain — I could not re-fetch.** Owner name "Lorena Alfr" is visibly truncated. Ship only if re-verified. |
| Austin's Ale House at 82-70 Austin St | qns.com arts-day piece | **Yes.** Two independent sources give 82-70 Austin Street (qns.com and the Genovese article); the finder's worry that one might be wrong is resolved — **the bar occupies the ground floor of the building Genovese lived in.** Handle that adjacency with care, not as trivia. |
| Kew Gardens Cinema six screens | Wikipedia | Attributed only. |
| ~2,500 Iranian Jews after 1979 | Wikipedia | **Attributed only.** The Bukharian-community sentence did not come back verbatim — paraphrase or drop. |
| Kew Gardens Synagogue — 14→380 members, "one of the oldest Jewish congregations in the central Queens area", ~65 years | the congregation's own /about | **Yes, attributed to the congregation.** No founding year exists on the site; do not compute one from "65 years". |
| Kew Gardens post office addresses | Wikipedia | Attributed; not confirmed against USPS. |
| Yeshiva Tifereth Moshe / Bais Yaakov of Queens / Yeshiva Shaar HaTorah | Wikipedia, no addresses | **Name only, attributed, no addresses.** F140/F141 confirmed. |
| The notable-residents list (Chaplin, Bacharach, Gershwin, Parker, Nin, Will Rogers…) | Wikipedia list | **NO.** Only Bunche (LPC + NPS) and Genovese (her own article) are corroborated. **F168 confirmed as an assessment.** A name-dropping paragraph off that list is the single easiest way to earn a Critical here. |
| "Queens Bridge Golf Course" | Wikipedia, uncorroborated | **NO.** LPC names the Richmond Hill Country Club and separately a Kew Gardens Country Club; three accounts disagree. Do not name any golf course. |

## 5.7 Two internal contradictions inside the LPC report itself — do not smooth them

Re-reading the full extracted text turned up two the finder did not flag:

1. The **Summary** says Bunche served as Under Secretary-General *"From 1954 until his death in
   1971"*; the **body** says *"until his resignation due to ill health in 1971. He died later that
   same year."* Use the body.
2. The **Kew Gardens/Bunche section** says he was *"offered a job as Under Secretary of State in the
   Truman administration"*; the **biography section** says he *"turned down an offer from Harry
   Truman in 1953 to be Assistant Secretary of State"*. Different titles, different years. Use the
   biography section or attribute the discrepancy.

Also confirmed and worth keeping: the LPC's own **misspelling "Grovesnor"** in the Description
paragraph, against "Grosvenor" in the title line. Quote it `[sic]` or quote the title line instead.

## 5.8 The Bunche House ZIP, and the NRHP address artifact

The finder gives "115-24 Grosvenor Road, Kew Gardens, Queens, NY **11415**". **The city geocoder
returns ZIP 11418 for that parcel**, and no source I re-read prints a ZIP for the house at all — LPC
prints "115-24 Grosvenor Road, Kew Gardens, Queens" with none. **Publish without a ZIP.**
**F46's address artifact is confirmed**: the NRHP row genuinely reads `address=115-125 Grosvenor Rd.`
against LPC's `115-24 Grosvenor Road`. It is a transcription artifact of the hyphenated Queens
number. Print 115-24; do not print 115-125; do not "correct" the NRHP silently in prose.

**F55 confirmed: the house is private.** Nothing in LPC, NPS or Wikipedia indicates public access.
Do not write it as visitable.

## 5.9 Things this file must not do

* **Do not claim any part of Forest Park.** Settled. Kent Manor's Park Lane South address falls
  inside its tabulation area (§2.3) and is the new version of the same trap.
* **Do not narrate anything inside Flushing Meadows–Corona Park**, and do not touch the eight
  `Ethos.Seeds.CitiFieldPlaces` holdings as records **or as prose**. Wikipedia lists FMCP as lying
  to Kew Gardens' north (F4 confirmed) and the Kew Gardens Interchange article names it as a
  bordering area (F106 confirmed). **Neither is a licence.** A routing link to `/g/citi-field-guide`
  is the only move, and only if a routing sentence is genuinely warranted.
* **Do not write a waterfront sentence.** F15 confirmed as a negative — Kew Gardens is inland and
  Jamaica Bay is the Rockaway group's, not this file's.
* **Do not repeat Wikipedia's "Kew Gardens lacks any landmark protection" (F17).** Confirmed as a
  verbatim quote and confirmed to be *wrong as written* — the Ralph Bunche House at 115-24 Grosvenor
  Road is a designated NYC individual landmark (LP-2175, May 17, 2005) as well as an NHL. Write
  "no historic district" if you write anything.
* **Do not manufacture an industrial past.** F156 confirmed as an assessment: Chatillon Scale is the
  only manufacturer any source names, FNY calls it "a rare manufacturer in the neighborhood," and
  even that line is uncertain (§5.3). A garden suburb built on restrictive covenants (F24, confirmed
  verbatim) having almost no industry is structurally correct.
* **The Genovese case, if written at all, must be written as myth-and-correction.** F115 and F116
  both confirmed verbatim: the 2007 finding of *"no evidence for the presence of 38 witnesses, or
  that witnesses observed the murder, or that witnesses remained inactive"* and the *Times*' own
  admission that its reporting *"grossly exaggerated the number of witnesses and what they had
  perceived."* Any sentence repeating the 38-witnesses story is a factual error. **Confirmed: no
  memorial, plaque or marker to Genovese exists in Kew Gardens in any source I reached — do not
  assert one.** Sophia Farrar, who went to her and stayed until the ambulance came, is confirmed and
  is the fact worth carrying.
* **Do not claim Kew Gardens Hills anything.** Confirmed distinct: ZIP 11367, and the QPL branch of
  that name prints "Flushing, NY 11367".
