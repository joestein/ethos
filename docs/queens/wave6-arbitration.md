# Queens wave 6 — ARBITRATION

Five pages, two groups that do not touch: **Jamaica (CD 12), Kew Gardens and Richmond Hill (CD 9)**
inland; **Far Rockaway and Rockaway Beach (CD 14)** on the peninsula. Every ruling below is binding
on the authors. A place ruled to another file may still be MENTIONED as the neighbouring place it is,
where a verdict supports the mention — it gets no place record here, and it is never written as this
page's own.

Evidence rank used throughout, in order: (1) the place's own street address with a neighborhood name
in it; (2) what the best-evidenced source says explicitly; (3) community-district / tabulation-area
and boundary definitions the verdicts confirm.

---

# PART 1 — THE MARQUEE HOSTING QUESTION

Two marquee questions are live in this wave. Both are answered the same way, on the same principle:
**hosting a record is a filing decision; containment is a factual claim. They are separable, and the
corpus already proved it separable when wave 4 hosted `forest-park` in `forest-hills.json` with
`town: "Queens"` and history prose opening "The park is not administratively part of any
neighborhood."**

## 1.1 ALLEY POND PARK — option (a). Hosted record, in `bayside.json`. UNANIMOUS on (a); 3–2 on the file.

**All five verifiers independently chose (a)** — host the record, keep the gate at `== 1`, do not
delete `forest-park`, do not weaken `@marquee_institutions`. Their reasoning converges and I adopt
it: (b) moves Forest Park from 1 to 0 and fails the gate on two rows instead of one while 404-ing a
live page; (c) makes the ruling itself the escape hatch and reopens exactly the between-waves gap the
assertion was written from outside the corpus to close.

**The file is contested and I rule `bayside.json`.** Jamaica, Kew Gardens and Richmond Hill say
Bayside; Far Rockaway and Rockaway Beach say Douglaston. It was close, and both sides are honest.

- For Douglaston: Far Rockaway's verifier sampled the park's own polygon (`Q001`, 2,568 vertices)
  against the 2020 NTA layer and got centroid **QN1191 Alley Pond Park** — its own tabulation area,
  the Forest Park QN8291 pattern exactly — with north and east edges in **QN1103
  Douglaston-Little Neck**, west in **QN1102 Bayside**, south in QN1104 Oakland Gardens-Hollis Hills.
  Two edges to one. Rockaway Beach adds that boundary length is the method-consistent tiebreak.
- For Bayside: area favours it; `bayside.json` already carries eight Alley Pond mentions to
  `douglaston.json`'s two, including an FAQ *"Is Alley Pond Park in Bayside?"* answered *"Alley Pond
  Park borders Bayside along the neighborhood's eastern edge"*; and the Bayside Historical Society,
  already quoted in the shipped file, was founded *"with three goals: The preservation and
  restoration of the Lawrence Family Cemetery , Alley Pond and Fort Totten."*

**Decisive:** the Forest Park precedent is a *hosting* precedent, and wave 4 hosted against the
polygon, not with it — its own sampling returned Forest Park at the centre and Kew Gardens, Richmond
Hill and Glendale at the edges, **with no sample in Forest Hills**, and the record still went to
`forest-hills.json` on naming and prose gravity. Rockaway Beach's claim that shared-boundary length
"is the same class of evidence that decided Forest Park in wave 4" is the one leg of the Douglaston
case that does not hold: boundary length was the *losing* side of that ruling. Applying the method
consistently — editorial gravity, since neither abutter has any containment claim at all — gives
Bayside, and the 3–2 majority agrees.

**What would overturn this:** a NYC Parks or DCP instrument that gives Alley Pond Park a *street
address* which geocodes to Douglaston-Little Neck. Forest Park was hostable in part because
`80-30 Park Lane` exists and resolves. If such a string is found for `Q001`, the polygon and the
address would then point the same way and this ruling should be revisited.

### Binding record constraints (instruction to the COORDINATOR, not to any wave-6 author)

`bayside.json` and `douglaston.json` shipped in earlier waves. **No wave-6 author may touch either.**

- `slug: "alley-pond-park"`, `kind: "park"`, `town: "Queens"` — **never `"Bayside"`** —
  `county: "Queens"`, `state: "New York"`.
- **`address`: OMIT.** `Q001` has no `address` field at all. Publish the Parks location string
  `Little Neck Bay to Springfield Blvd, Union Tpke` and nothing else. Do not borrow the Alley Pond
  Environmental Center's address; that is a separately recordable institution and reusing it would
  manufacture a false marquee address.
- Publishable Parks facts: signname **"Alley Pond Park"**, park ID **Q001**, **635.514 acres**,
  typecategory **"Flagship Park"**, acquired **1934-08-16**, ZIPs **11361, 11362, 11363, 11364,
  11426**.
- **CORRECTION to the wave-5 record, from Far Rockaway's verifier:** `Q001` records
  `communityboard: 411` **alone**. Kew Gardens' and Richmond Hill's verdicts both repeat "it reaches
  Community District 13" and offer it as grounds to publish. **It is not what NYC Parks says.** Do
  not write the CD-13 claim. (Parks does list multiple boards when they apply — compare Forest Park's
  `communityboard: 305405406409`.) Cite QN1191 as the instrument instead.
- **No containment claim in any field.** History must state plainly that the park is administratively
  part of no neighborhood, in the Forest Park register. It may say it borders Bayside,
  Douglaston-Little Neck and Oakland Gardens-Hollis Hills.
- `douglaston.json` gains **no** record — a second one puts the count at 2 and fails the gate the
  other way. Both files' existing prose should be re-read so neither implies containment.
- The gate needs no edit; `~r/^alley-pond-park/` matches at the front anchor. Do not touch
  `@marquee_institutions`; do not weaken `assert n == 1`. The `@tag :pending_queens` comes off only
  once this record exists.

## 1.2 ROCKAWAY BEACH AND BOARDWALK — hosted in `rockaway-beach.json`, and it is THIS wave's own marquee trap.

This is the structural question the borough completes on, because unlike Alley Pond Park **both
candidate files are landing right now.**

NYC Parks (recovered by both peninsula verifiers with a browser UA; the 403 was bot-blocking) is the
custodial source and settles the extent:

> **"Beach 3 St. to Beach 153 St. and Boardwalk to Atlantic Ocean."**
> Zip Code: **11691, 11692, 11693, 11694** · Park ID: **Q162GROUP** · Property Type: **Park Group** ·
> Community Board: 14

Four ZIPs and a Park Group across five sub-properties (`Q162`, `Q162I`, `Q163`, `Q164`, `Q050`).
**Neither page may claim it whole**, and both verdicts say so independently.

**Ruling: exactly one record, in `rockaway-beach.json`.** Grounds: the Parks-registered name is
"Rockaway Beach and Boardwalk", and hosting follows the name — the same tiebreak that put Forest Park
in the file named for it. `town: "Queens"`, no containment claim, prose stating the four-ZIP
Park Group fact as the proof it belongs to no single neighborhood. **`far-rockaway.json` references
it by slug and does not re-create it**, and may say Far Rockaway fronts the easternmost slice.

**The gate trap, for the coordinator.** If a `@marquee_institutions` row is added for this, it must
be anchored `{"Rockaway Beach and Boardwalk", ~r/^rockaway-beach-and-boardwalk/}`. A bare
`~r/^rockaway-beach/` would match `rockaway-beach-boulevard`, `rockaway-beach-skate-park`,
`rockaway-beach-surf-club` and the neighborhood guide slug itself — harmless inside one file, but
`far-rockaway.json` lands in this same wave and will plausibly carry a `rockaway-beach-…` slug of its
own, which makes the count 2 and fails.

**Neither page may import the other's slice.** The Parks amenity line *"the city's only legal surfing
beach, located between 67-69 Street and 87-92 Street"* splits: **Beach 87th–92nd is Rockaway
Beach's; Beach 67th–69th is Arverne's** and belongs to no file. Far Rockaway may not import the
surfing sentence at all.

## 1.3 What stands from earlier waves, restated as binding

- **FOREST PARK** — belongs to no neighborhood file; record stays in `forest-hills.json`. Kew Gardens
  and Richmond Hill both border it and **both are tempted; wave 4 already refuted the two claims that
  looked strongest.** No record, no history paragraph, no Kent Manor workaround (§2.4). Richmond
  Hill: the **Battle of Long Island ridge story is located inside Forest Park** and is confirmed in
  two sources — it is still out of scope. **Do not narrate it.**
- **FLUSHING MEADOWS–CORONA PARK and the eight `Ethos.Seeds.CitiFieldPlaces` holdings** — off-limits
  corpus-wide, as records **and as prose**. Wikipedia listing FMCP to Kew Gardens' north, and the Kew
  Gardens Interchange article naming it as a bordering area, are **not a licence**.
- **ALLEY POND PARK** — no wave-6 page touches it in any form.
- Link `/g/citi-field-guide` only where a routing sentence is genuinely warranted. On all five of
  these pages, it almost certainly is not.

---

# PART 2 — CONTESTED PLACES, INLAND GROUP (Jamaica / Kew Gardens / Richmond Hill)

## 2.1 Church of the Resurrection, 85-09 118th Street → **RICHMOND HILL**

Both the Kew Gardens and Richmond Hill verifiers ruled it Richmond Hill independently. Article's own
first sentence: *"a historic Episcopal church and rectory in **Richmond Hill**, Queens"*; Wikipedia's
Richmond Hill article: *"The northern edge of Richmond Hill contains the Church of the
Resurrection"*; DCP geocoder returns `Richmond Hill`; point-in-polygon returns `QN0902` twice, once
on the geocode and once on the NRHP table's own coordinate. Against: a Wikipedia **page title** used
as a disambiguator, one half of a slash in an NRHP table, and ZIP 11415.

**A page title is not a claim.** The ZIP is the only real counter and the NRHP cover sheet gives the
whole historic district as "11415, 11418", so 11415 reaches into Richmond Hill. **Kew Gardens must
not carry this church as a place and must not narrate Theodore Roosevelt at the Riis wedding, the
1874 date, Nathaniel W. Vickers, or the Elizabeth Riis window.** Jamaica must not touch it at all.
Richmond Hill: the ZIP oddity is a genuine fact about the seam and may be recorded in prose — and the
nomination puts the building *"just east of the historic district"*, so **do not write that it is in
the historic district**; the HD article's contrary sentence loses to the primary document.

## 2.2 Maple Grove Cemetery, 127-15 Kew Gardens Road → **KEW GARDENS**

The institution's own affiliated nonprofit prints `127-15 Kew Gardens Road, Kew Gardens, New York,
11415`; the geocoder returns Kew Gardens for that address and for the NRHP address; Wikipedia names
Kew Gardens as one of the two neighborhoods it straddles. The NYC Parks "Richmond Hill" leg is
**refuted as an assignment** — the sign's sentence is about *Hayestown*, a vanished 19th-century
place name, hedged with "mostly". Jamaica's own verdict already routes the cemetery away.

**Publish 127-15**, the institution's own address; do not print the NRHP's `83-15` without saying it
is the National Register's address. NRHP listing 2004 is confirmed (refnum 04000874); the nomination
is not digitized, so **say "listed on the National Register in 2004" and nothing more**. The
Briarwood half of the straddle is real — the grounds may be said to extend toward Briarwood.

## 2.3 Ralph Bunche House, 115-24 Grosvenor Road → **KEW GARDENS** (uncontested)

Richmond Hill's verifier tested it and declined it: LPC row NTA `QN0901`, NRHP `city=Kew Gardens`,
PIP `QN0901` on both the LPC and NRHP coordinates, geocoder `Kew Gardens`. **No source anywhere
places it in Richmond Hill.** Print `115-24`, not the NRHP's `115-125` transcription artifact, and
**print no ZIP** — no source gives one and the geocoder's 11418 contradicts the finder's 11415. The
NRHP row is `type=NHL`: this is a **National Historic Landmark**, which Kew Gardens should say.
Private house; do not write it as visitable.

## 2.4 Kent Manor, 117-01 Park Lane South → **NO FILE.** Nobody publishes it.

Kew Gardens' and Richmond Hill's verifiers split — RH says Kew Gardens (NRHP `city=Kew Gardens`, PIP
`QN0901` twice); KG says omit entirely (geocoder returns neighborhood **"Forest Park"**, tax block
**3312 — the same block as Forest Park itself**, whose record is BBL 4033122000, block 3312 lot 2000;
Kent Manor is lot 8).

**I rule with Kew Gardens: no record in any file.** The tie-break is content, not geography. The
nomination (refnum 100007667, listed 2022-04-28) is **not digitized** — no year built, no architect,
no style, no period of significance, no prose anywhere. A place record whose only fact is its own
name, on a parcel the city labels "Forest Park", is the wave-4 Forest Park trap in a new costume.
**Kew Gardens: do not create it. Richmond Hill: do not create it.**

## 2.5 The Richmond Hill Historic District's northern tier → **KEW GARDENS' tabulation area, but no records anywhere**

Richmond Hill's verifier refuted its own finder's blanket claim that all sixteen §3.1 addresses
geocode to `QN0902`. **`84-48 118th Street` and `117-03 85th Avenue` are Kew Gardens by every
instrument** (GeoSearch label `Kew Gardens`, ZIP 11415/11418, PIP `QN0901`) — and they are the pair
the nomination singles out as its Wade & Cullingford exemplars. Four more return GeoSearch
`Kew Gardens` while PIP still says Richmond Hill, including **116-03 85th Avenue, the Albon Platt Man
house**.

This is structural: the district's northern tier is the 84th Avenue / old Division Avenue line, which
*is* the Kew Gardens boundary, exactly as the nomination says. A house can be in the Richmond Hill
Historic District and in Kew Gardens' tabulation area at once.

**Ruling: Richmond Hill owns the district as a subject and may write it. It must not write 84-48
118th Street or 117-03 85th Avenue as Richmond Hill addresses.** All twelve contributing houses are
private single-family residences — **material for prose about the district, never place records** —
and the Gati house must not appear at all. **Kew Gardens gets no record from this tier either**; the
district is Richmond Hill's subject.

## 2.6 The 1950 train crash → **KEW GARDENS holds the event; RICHMOND HILL holds the name; JAMAICA holds neither**

Both verifiers confirm the same body text: the trains *"collided between Kew Gardens and Jamaica
stations in Kew Gardens, Queens, New York City, killing 78 people and injuring 363"*, and the
disaster is *"also known as the Richmond Hill disaster"*. Jamaica's finder mistook a redirect for a
title and reached for the story; **Jamaica may not tell it.**

**This is not an exclusive claim and neither page may write it as one.** Kew Gardens: the site
sentence, with the conventional name attributed, never "in Kew Gardens" bare. Richmond Hill: the name
half, attributed, never "the Richmond Hill disaster happened in Richmond Hill". Written that way both
pages stand.

## 2.7 Emergency services and civic buildings — ruled by address

| Place | Address | Ruling | Basis |
|---|---|---|---|
| NYPD 102nd Precinct station house | `87-34 118th Street` | **RICHMOND HILL** | NYPD's own page prints `Richmond Hill, NY, 11418-2527`; geocoder + PIP `QN0902`. Both verifiers concur |
| Squad 270 / Division 13 | `91-45 121st Street` | **RICHMOND HILL** | geocoder + PIP `QN0902`; both verifiers concur |
| Engine 294 / Ladder 143 | `101-02 Jamaica Avenue` | **RICHMOND HILL** | geocoder + PIP `QN0902` |
| Engine 305 / Ladder 151 | `111-02 Queens Boulevard` | **FOREST HILLS** (shipped) | geocoder; neither wave-6 file |
| Engine 285 / Ladder 142 | `103-17 98th Street` | **NO FILE** | GeoSearch `Ozone Park`, ZIP 11417, PIP `QN1002`, CD 10. Wikipedia's "Richmond Hill contains" is refuted |
| USPS Richmond Hill Station | `122-01 Jamaica Avenue` | **RICHMOND HILL** | geocoder + PIP `QN0902` |
| USPS South Richmond Hill | `117-04 101 Avenue` | **NO FILE** | PIP `QN1001 South Ozone Park`, CD 10; Wikipedia's own hedge is "nearby" |
| USPS Jamaica Station | `88-40 164th Street` | **JAMAICA** | Jamaica article's own string |
| Kew Gardens post office | `83-30 Austin Street` | **KEW GARDENS** | single-sourced to Wikipedia; attribute |
| Queens Borough Hall | `120-55 Queens Boulevard` | **KEW GARDENS** | Jamaica's verdict routes it here; geocoder Kew Gardens 11415 |

**The 102nd Precinct SERVES Kew Gardens; it SITS in Richmond Hill.** Wikipedia prints the bare
address inside a Kew Gardens section, which is how the error gets made. Kew Gardens may say the
neighborhood is served by the 102nd; it may not record the station house. Richmond Hill should note
it is a three-neighborhood command.

## 2.8 Libraries — one branch each, and the Jamaica trap

| Branch | Address | Ruling |
|---|---|---|
| QPL Central Library | `89-11 Merrick Boulevard` | **JAMAICA** — and it is Jamaica's ONLY branch record |
| QPL Richmond Hill | `118-14 Hillside Avenue` | **RICHMOND HILL** — uncontested; both verifiers concur |
| QPL Lefferts | `103-34 Lefferts Boulevard` | **NO FILE** — PIP `QN1001 South Ozone Park`, CD 10 |
| QPL Kew Gardens Hills | `72-33 Vleigh Place` | **NO FILE** — Kew Gardens Hills, prints "Flushing, NY 11367" |
| QPL Briarwood | `85-12 Main Street` | **NO FILE** — Briarwood |
| QPL Baisley Park, Rochdale Village, South Jamaica | — | **NO FILE** — confirmed addresses, but none is Jamaica's |

Jamaica's two Central Library buildings must not be blended: the *original* on Parsons Boulevard
opened 1930, Renaissance Revival, WPA-expanded 1941; the **present** building cost $5.7 million,
holds 195,000 sq ft, opened **1966**, and *"was the first major branch of an urban library to place
all public services on one floor."*

## 2.9 Kew-Forest School, 119-17 Union Turnpike → **FOREST HILLS** (shipped). Not Kew Gardens.

The school's own printed address and the geocoder both say Forest Hills 11375, and the source names
Kew Gardens only as a neighbouring area. Wikipedia's Kew Gardens timeline line "1918: Kew-Forest
School established" is proximity, not containment. **Kew Gardens may say the neighborhood's name is
half of the school's name. It may not claim the school.**

## 2.10 Stations — three rulings

**121st Street (BMT Jamaica) → RICHMOND HILL.** One sentence names both: *"Located at the
intersection of 121st Street and Jamaica Avenue in Richmond Hill and Kew Gardens, Queens."* Genuinely
close. Richmond Hill wins on three grounds: the source names it first; Richmond Hill also holds
**111th Street** and **104th Street** on the same line by explicit single-neighborhood sentences,
making a coherent set; and Kew Gardens' own verifier did not list it among its fourteen publishable
places. **Kew Gardens may mention it as the station at its southern edge; no record.** What would
overturn: a station-article revision or an MTA source naming Kew Gardens alone.

**Kew Gardens–Union Turnpike → SHARED with Forest Hills, which has shipped.** Confirmed at *"the
border of Kew Gardens and Forest Hills, Queens"* with entrances in each. **Coordinator: check
`forest-hills.json` first. If it already carries a record, Kew Gardens mentions only and creates
none.** If it does not, Kew Gardens may create one, with no containment claim.

**Jamaica's own stations → JAMAICA, uncontested.** Jamaica station (LIRR) `93-02 Sutphin Boulevard`,
architect Kenneth M. Murchison; Sutphin Boulevard–Archer Avenue–JFK Airport; Jamaica Center–Parsons/
Archer (opened December 11, 1988; renamed 2004). **Jamaica–Van Wyck belongs to no file** — it sits on
the Van Wyck, which every source makes Richmond Hill's *eastern edge*, and an edge is a boundary, not
a container.

## 2.11 Places ruled OUT of all three inland files

| Place | Where it belongs | One-line basis |
|---|---|---|
| Captain Tilly Park | Jamaica Hills (no page) | *"in Jamaica Hills, Queens, north of downtown Jamaica"* — north of Hillside Ave is outside CD12 |
| Baisley Pond Park | South Jamaica / Rochdale / St. Albans | the article never says Jamaica |
| Jamaica High School, 167-01 Gothic Drive | Jamaica Hills or Jamaica Estates | two instruments disagree and **both** disagree with Jamaica |
| Queens Hospital Center | Jamaica Hills / Hillcrest | mailing address says Jamaica, prose says otherwise — **prose wins** |
| Rochdale Village | CD12 cluster | *"grouped as part of Greater Jamaica"* is not "in Jamaica" |
| Jamaica Race Course | defunct | demolished 1960; Rochdale took the land, Aqueduct took the racing |
| Archbishop Molloy HS; St. John's University | unverified | navbox membership is not a source statement |
| Parkway Village | Jamaica (LPC note 5) | Kew Gardens must not take it; **Jamaica's own verdicts do not confirm it — no record in this wave** |
| Hoover-Manton Playgrounds | Briarwood/Jamaica, CB 8, ZIP 11435 | NYC Parks' own panel |
| Ev's Eleventh Hour Bar | Hollis | Genovese article |
| Hampton Court Apartments | inside Forest Park | FNY places it inside the park; uncorroborated |
| Cong. Machane Chodosh; Ridgewood Savings Bank; Midway Theater; Our Lady Queen of Martyrs; Kennedy House | Forest Hills (shipped) | own addresses + geocoder |
| Sikh Cultural Society | **nowhere** | the address `95-30 118th Street` is the finder's own hypothesis and **no source states it**. No record, no address, not even a mention |
| Prospect Cemetery | **JAMAICA** | `159th St. and Beaver Rd., Jamaica` — Kew Gardens' verdict concurs |

**Richmond Hill: the Sikh gurdwara hole is real and must not be papered over.** The neighborhood
Wikipedia calls home to *"the largest Sikh population in the city"* ships with no gurdwara. Write
nothing about it rather than something unsourced — and **no research-process sentence about the
absence either.**

## 2.12 Corridors and boundaries — none claimable whole

- **Jamaica Avenue** — Jamaica and Richmond Hill both front it; neither claims it. Confirmed: the el
  *"runs above Jamaica Avenue through the Cypress Hills section of Brooklyn along with Woodhaven and
  Richmond Hill"* — **the el does not run over Jamaica Avenue in Jamaica.**
- **Lefferts Boulevard** — *"running through the communities of Kew Gardens, Richmond Hill, and South
  Ozone Park."* Not claimable whole.
- **Liberty Avenue** — 8 miles across Brooklyn and Queens. Richmond Hill writes only the South
  Richmond Hill stretch, on the nomination's own viaduct precedent.
- **Austin Street, Queens Boulevard, Kew Gardens Interchange, Jackie Robinson Parkway** — all
  multi-neighborhood; no records. The Interchange straddles four areas **including a settled
  off-limits one**; mention as a northern edge at most. Queens Boulevard's "Boulevard of Death"
  figures are corridor-wide and **should simply not appear.**
- **Southern Kew Gardens Road** — FNY's *"not quite Kew Gardens, not quite Richmond Hill, and not
  quite Jamaica"* describes **one specific spot near the Van Wyck**, not the seam. Do not generalise
  it into a boundary sentence.
- **Kew Gardens' own boundaries** — the LPC (LP-2175) and Wikipedia lines genuinely disagree. Write
  both attributed or write neither; **never an unattributed composite**, and never "Kew Gardens
  extends to Hillside Avenue" as flat fact against Richmond Hill's page in the same wave.

## 2.13 Is Jamaica adjacent to Kew Gardens? **At a corner, and not usefully.**

Kew Gardens' listed neighbours do not include Jamaica; Jamaica's own border sentence names *Kew
Gardens Hills*, a different place. CD12's northern edge (Hillside Avenue) and western edge (Van Wyck)
meet at the one corner that is also Kew Gardens' southeast corner. **The two pages share no place.
Neither may manufacture an adjacency sentence.**

Richmond Hill *is* genuinely adjacent to both: *"The area borders Kew Gardens and Forest Park to the
north, Jamaica and South Jamaica to the east, South Ozone Park to the south, and Woodhaven and Ozone
Park to the west."* Kew Gardens and Richmond Hill may both say so.

---

# PART 3 — CONTESTED PLACES, PENINSULA GROUP (Far Rockaway / Rockaway Beach)

**Method warning that governs the whole group, from Far Rockaway's verifier:** the 2020 NTA scheme
**cannot** adjudicate here. Every Far Rockaway candidate returns the joint `QN1401
Far Rockaway-Bayswater`; Rockaway Beach's centroid returns the joint `QN1402
Rockaway Beach-Arverne-Edgemere`. **An arbitrator or author who reaches for an NTA lookup on this
peninsula gets a false confirmation.** ZIP and each source's own wording decide instead:
**11691 = Far Rockaway (and Bayswater, and part of Edgemere); 11693 = Rockaway Beach; 11694 =
Rockaway Park / Seaside / Belle Harbor.**

## 3.1 Hammel Houses / Hammels → **ROCKAWAY BEACH**

The Wikipedia infobox reads `address=84-16 Rockaway Beach Boulevard, [[Far Rockaway]]`. **Refuted by
NYCHA itself**: the development fact sheet stamps **ZIP 11693** on all fourteen buildings, including
`5 005 84-16 ROCKAWAY BEACH BOULEVARD 11693`. 11693 is Rockaway Beach; Far Rockaway is 11691. The
infobox is a postal mislabel, which is the peninsula's signature error.

**Publish `84-16 Rockaway Beach Boulevard, Queens, NY 11693` in `rockaway-beach.json`. Far Rockaway
must not take it.** Hammels is *inside* Rockaway Beach — *"Hammels is an area within Rockaway Beach"*
— confirmed independently by both peninsula verifiers. Use **712 apartments**; **assert no completion
date** (September 1954, April 1955 and a 1964 rebuild all appear).

## 3.2 Richard Cornell Graveyard → **FAR ROCKAWAY**

Rockaway Beach's LPC dataset pull independently routes it away (QN1401) and its verifier flags it to
the sibling page. **Publish the NYC Parks boundary string `Caffrey Ave. bet. New Haven Ave. and
Davies Rd.`** — not the LPC's "1457 Greenport Road" (a street name that no longer exists; the article
says the site is on Gateway Boulevard, *"formerly Greenport Road and Greenwood Avenue"*), and not a
Gateway Boulevard number. Cite LPC refnum 0741, August 18, 1970 for landmark status only. **NRHP
status is refuted, not merely unestablished** — it appears nowhere in the Queens NRHP list.
**Rockaway Beach must not narrate it.**

## 3.3 The two LPC firehouses/station houses → **FAR ROCKAWAY**

`16-12 Mott Avenue` (53rd, now 101st, Precinct Police Station) and `16-15 Central Avenue` (Firehouse,
Engine Cos. 264 & 328 / Ladder Co. 134), both designated 2018-05-29, both `borough=Far Rockaway` in
the LPC list and both NTA `QN1401` in Rockaway Beach's independent dataset pull. **Rockaway Beach has
zero NYC individual landmarks and may say so**; the fourth peninsula designation (Engine Co. 268 /
H&L 137, `259 Beach 116th Street`) is **Rockaway Park — no file.**

## 3.4 NYC Ferry Rockaway landing → **NEITHER PAGE.** Rockaway Park / Far Rockaway per the operator.

`ferry.nyc` prints the same corner under two labels — *"Beach 108th Street and Beach Channel Drive,
**Far Rockaway**, NY 11694"* and, for accessible pick-up, *"107-98 Beach Channel Drive, **Rockaway
Park**, NY 11694"*. ZIP 11694 is neither page's. The `NYC Ferry` article says Rockaway Park.

**Ruling: no place record on either page.** **Rockaway Beach** may write a routing sentence only —
"the neighborhood is reached by the NYC Ferry's Rockaway route, landing at Beach 108th Street" — and
may quote its own article's ferry sentence *as that article's claim*, never upgraded into a location.
**Far Rockaway may write no "reached by ferry" sentence at all.** The wave brief's framing that the
peninsula is reached by ferry is true of the peninsula and **false of far-rockaway.json**.

## 3.5 O'Donohue Park → **FAR ROCKAWAY**, but no record and no address

Its only source is the Wikipedia article, which places it *"in the **Far Rockaway**
neighborhood... at the eastern tip of the Rockaway Beach and Boardwalk"* — the neighborhood
assignment is fine. But **NYC Parks has no property under that name**: it is absent from all 58 CB-414
properties, `/parks/odonohue-park` returns **404**, and the footprint is carried as two
sub-properties of the beach (`Q162J Beach 17 Playground`, `Q162J01 Beach 9 Playground`). The article
also contradicts itself on age (infobox 2008 against "In 1963, the NYC Parks Department constructed
the current park").

**Far Rockaway may name it in prose, attributed, as a named area within Rockaway Beach and Boardwalk.
No place record, and no street address — the city has none.** Rockaway Beach may not touch it.

## 3.6 Bayswater — **NO FILE.** Two parks and a bearing.

- **Bayswater Point State Park** — *"located at the western end of Mott Avenue in **Bayswater** near
  Far Rockaway."* A source that says *near* Far Rockaway says *not in* it. The `1479 Point Breeze
  Place, Far Rockaway` string is an infobox **USPS mailing town**, and 11691 demonstrably covers
  Bayswater. **17 acres, not 12** (12 was the 1986 Trust for Public Land parcel). The NYS Parks
  mission quote is **unverified — parks.ny.gov 403s for everyone. Do not publish it.** Note the trap:
  the mansion on the site was itself named *"Breezy Point"* — not Breezy Point the neighborhood.
- **"Michaelis-Bayswater Park"** — NYC Parks' current sign name is **Bayswater Park** (`Q007`,
  `Dwight Ave., Seagirt Blvd. bet. Beach 38 St. and Bay 32 St.`, 40.16 acres). Beach 38th is west of
  Far Rockaway's own stated extent. **Out of scope.** The Jules Michaelis biography ties to Far
  Rockaway High School and Wavecrest — that is prose about a person, not a claim on the park.
- **Bayswater's bearing, resolved:** the two articles say northeast and northwest; the coordinates
  (Bayswater 40.605, −73.765; Far Rockaway 40.601, −73.757) make it **north and west**. **Do not
  repeat "northeast."**

## 3.7 Everything else on the peninsula that has no file

| Place | Where | Basis |
|---|---|---|
| St. Camillus RC Church | Rockaway Park | diocesan list: `99-15 Rockaway Beach Blvd, Rockaway Park` |
| Beach 105th Street station | Rockaway Park | IND table `rowspan=2` reads Rockaway Park; officially signed **Beach 105th Street–Seaside** |
| P.S. 225 | Seaside | DOE: *"P.S. 225 **Seaside**, Q225 … Zip Code 11694"* |
| Ice hockey rink, Beach 109th | outside both | the boardwalk article's own sentence |
| Beach 106th / Beach 97th concessions | outside / on the line | no independent instrument |
| Surf beach Beach 67th–69th | Arverne | Parks' own split |
| Beach 44th, Beach 36th stations | Edgemere | IND station table |
| Beach 67th, Beach 60th stations | Arverne | IND station table |
| Jacob Riis Park HD; Fort Tilden HD | filed `city=Rockaway` | not "Rockaway Beach" — a name trap, confirmed |
| Sh'or Yoshuv | **Lawrence, Nassau County** | outside the corpus |
| Beach Channel High School | Rockaway Park | a trap for anyone writing about local schooling |
| Arverne East Nature Preserve | Edgemere/Arverne | `Q520`, ZIP 11692 |
| Rockaway Beach Hospital | **nowhere** | no address in any source; **no record on either page** |
| The Rockaway Hotel; Rockaway Brewing Co. | Rockaway Park / unreachable | the hotel's own site says Rockaway Park 11694 |
| Whaleamena; Dayton Beach Park; Surfside Park Apartments; P.S. 183; Moulin Rouge Inn; Rockaway Beach Board of Trade | — | **no publishable address. History prose only, past tense** |

## 3.8 Corridors — none claimable whole, and they run through both pages

**Rockaway Beach Boulevard, Beach Channel Drive, Rockaway Freeway and Shore Front Parkway all run the
length of the peninsula.** Shore Front Parkway's own infobox names three neighborhoods
(`Arverne, Hammels, Rockaway Beach`). **Neither page claims any of them whole.** Rockaway Beach
Boulevard carries **three different libraries** — Peninsula (92-25, Rockaway Beach), the modern
Seaside branch (116-15, Rockaway Park) and the historical 1932 Seaside Branch. **Do not merge any
two.**

## 3.9 Two name collisions that will bite

- **Temple of Israel Synagogue** (`1-88 Beach 84th Street`, Rockaway Beach) and **Temple Israel of
  Far Rockaway** are two different congregations with nearly the same name. **Do not merge them, and
  neither page may narrate the other's.**
- **"Jamaica" on the peninsula is never the neighborhood.** The raw wikitext behind Far Rockaway's
  Caribbean-migration sentence links `[[Jamaica]]` — **the country**. NYC Parks owns a `Q309 Jamaica
  Bay Park` in CB 414 — **not this page's**. And **Jamaica Bay appears in no Richmond Hill source and
  must not be introduced there**; the nomination's *"the Town of Jamaica"* is the colonial town.
  **No adjacency, no shared place and no cross-reference exists between the peninsula group and the
  inland group. Do not manufacture ties across Jamaica Bay.**

---

# PART 4 — ALLOW-LISTS

A place on your list may get a record. A place not on it may not, whatever your finder said.
Everything here still passes through your own verdict file's warnings — this list rules **ownership**,
not sourcing.

## 4.1 JAMAICA may publish

King Manor (`150-03 Jamaica Avenue, Jamaica, NY 11432`) · Rufus King Park (11.5 acres; bounded by
Jamaica Avenue, 150th Street, 89th Avenue, 153rd Street) · Grace Episcopal Church and Graveyard
(**Jamaica Avenue, no house number** — LPC 155-03 vs NRHP 155-15 is unresolved) · First Reformed
Church of Jamaica / Jamaica Performing Arts Center (`153-10 Jamaica Avenue`) · Jamaica Center for
Arts & Learning (`161-04 Jamaica Avenue`) · Jamaica Chamber of Commerce Building (`89-31 161st
Street`) · Jamaica Savings Bank (`161-02 Jamaica Avenue`) **and no other branch** · J. Kurtz and Sons
Store Building (`162-24 Jamaica Avenue`) · La Casina (`90-33 160th Street`) · Loew's Valencia Theatre
/ Tabernacle of Prayer (`165-11 Jamaica Avenue`, **no designation date**) · St. Monica's Church
(`94-20 160th Street`) · Prospect Cemetery (`159th Street and Beaver Road`) · Chapel of the Sisters /
Illinois Jacquet Performance Space · Masjid Al-Mamoor / Jamaica Muslim Center (`85-37 JMC Way`) ·
QPL Central Library (`89-11 Merrick Boulevard`) · York College, CUNY (**no street address**) · Jamaica
station (LIRR) · Sutphin Boulevard–Archer Avenue–JFK Airport station · Jamaica Center–Parsons/Archer
station · Greater Jamaica Development Corporation (`90-04 161st Street`) · USPS Jamaica Station
(`88-40 164th Street`) · 165th Street Bus Terminal (**past tense only — closed June 1, 2025**) ·
168th Street Bus Terminal (`90-01 168th Street`, opened June 1, 2025, **temporary**) · Jamaica High
School / Jamaica Learning Center (`162-02 Hillside Avenue`) — **admissible but marginal; never merged
with the Gothic Drive school**.

**Jamaica-specific bans:** the Colosseum Mall **closed permanently January 31, 2026** — nothing in the
present tense; **no bus-route counts**; **no Trumps, no Jamaica Estates or South Jamaica residents**;
the two etymology quotes are different claims (a word vs a people) and **must not be blended**; label
every CD12 figure against every neighborhood figure; the crime and school statistics are for **Jamaica
and Hollis jointly**. **The page will have no food or retail coverage. Say nothing that papers over
it — and no sentence about the absence.**

## 4.2 KEW GARDENS may publish

Ralph Bunche House (`115-24 Grosvenor Road, Kew Gardens, Queens, NY` — **no ZIP**, NHL) · Kew Gardens
LIRR station / Lefferts Boulevard bridge shops · **Maple Grove Cemetery (`127-15 Kew Gardens Road,
Kew Gardens, NY 11415`)** · Maple Grove Park (`Q220F`, no street address) · Queens Borough Hall
(`120-55 Queens Boulevard`) · Kew Gardens Cinema (`81-05 Lefferts Boulevard`, operator H & K Cinemas)
· Kew Gardens Synagogue / Adath Yeshurun (`82-17 Lefferts Boulevard`) · P.S. 099 Kew Gardens
(`82-37 Kew Gardens Road`) · Le Petit Paris (`81-45 Lefferts Blvd.`) · Austin's Ale House
(`82-70 Austin St.`) · Nabhya (`120-85 83rd Ave` **attributed only**) · Kew Gardens post office
(`83-30 Austin Street`) · Newcombe Square (no address).

**Kew Gardens-specific bans:** no address for the Queens Criminal Court; **"Women's Plaza" is not a
Parks property name**; no waterfront sentence; do not repeat "Kew Gardens lacks any landmark
protection" (the Bunche House refutes it — write "no historic district"); no manufactured industrial
past; the Genovese case is **myth-and-correction or nothing**, and **no memorial exists**; **no
name-dropping paragraph** off the notable-residents list — only Bunche and Genovese are corroborated;
no golf course.

## 4.3 RICHMOND HILL may publish

Richmond Hill Republican Club (`86-15 Lefferts Boulevard`) · Public School 66 (`85-11 102nd Street`)
· Eldridge House (`87-61 111th Street` — LP-2473's spelling, not the dataset typo) · **Church of the
Resurrection (`85-09 118th Street`)** · St. Benedict Joseph Labre Parish (`94-40 118th Street`) ·
Phil "Scooter" Rizzuto Park (`125-02 Atlantic Avenue`) · Richmond Hill High School (`89-30 114th
Street`) · **102nd Precinct (`87-34 118th Street`)** · Engine 294 / Ladder 143 (`101-02 Jamaica
Avenue`) · **Squad 270 / Division 13 (`91-45 121st Street`)** · USPS Richmond Hill Station
(`122-01 Jamaica Avenue`) · Richmond Hill Historical Society (`112-13 84th Avenue`) · RKO Keith's
Theater (`117-09 Hillside Avenue`) · Holy Child Jesus (`111-11 86th Avenue` — **existence and address
only**) · QPL Richmond Hill (`118-14 Hillside Avenue`) · **121st Street station** · 111th Street
station · 104th Street station · Clarenceville station (Atlantic Branch, historical) · Richmond Hill
LIRR station (**no publishable address** — describe by the Montauk Branch viaduct) · Morris Park World
War Memorial (`Atlantic Avenue and Lefferts Blvd.`) · McConnell Park and the `Q142`/`Q217` parks
(**Parks location strings only, never a fabricated street number**) · the Richmond Hill Historic
District as a subject.

**Richmond Hill-specific bans:** the twelve contributing houses are **private residences — prose,
not records**, and the Gati house not at all; **nothing in the DOHMH section may be narrated**, not
even a cuisine noun, and **say nothing about what occupies 86-15 Lefferts Boulevard today in either
direction**; publish the *shape* of the cuisine distribution, **never a count**; no Sikh Cultural
Society in any form; no Battle of Long Island; **every CD-9 statistic must carry its geography** — none
is a Richmond-Hill-only number.

## 4.4 FAR ROCKAWAY may publish

Far Rockaway–Mott Avenue station · Beach 25th Street–Wavecrest station · Far Rockaway station (LIRR,
`Nameoke Avenue and Redfern Avenue`) · **Richard Cornell Graveyard (`Caffrey Ave. bet. New Haven Ave.
and Davies Rd.`)** · Far Rockaway Beach Bungalow Historic District (`Beach 24th, Beach 25th &
Beach 26th Sts.`) · First Presbyterian Church of Far Rockaway / Russell Sage Memorial Church
(`1324 Beach 12 St.`) · **101st Precinct station house (`16-12 Mott Avenue`)** · **Firehouse,
Engine Cos. 264 & 328 / Ladder Co. 134 (`16-15 Central Avenue`)** · Queens Public Library, Far
Rockaway branch (`1637 Central Avenue, Far Rockaway, NY 11691`) · Far Rockaway High School building /
Educational Campus (`821 Bay 25th Street`) · Yeshiva Darchei Torah (`257 Beach 17th St`) · Redfern
Houses (**boundary string only**) · Nameoke Park (`Nameoke Ave. bet. Brunswick Ave. and Augustina
Ave.`) · **US Post Office–Far Rockaway (`1836 Mott Ave.`)** · **Trinity Chapel (`1874 Mott Avenue`)**
· **Richard Mott House (`12-72 Norton Drive` — existence and address only)** · **The White Shul
(no address — do not invent one)** · **Sorrentino Recreation Center (`Cornaga Ave. bet. Beach 19 St.
and Morse Ct.`)** · Redfern, Westbourne, Lanett and Grassmere Playgrounds (Parks location strings) ·
DOHMH-only businesses in 11691 **filtered to Beach street numbers below 32** — address and existence
only.

**Far Rockaway-specific bans:** no Mott Avenue ridership figures (not in the source); **no ferry
sentence**; no Bayswater parks; no address for O'Donohue Park; the $117 million was a **nine-station**
programme; **do not attach the Breezy Point Sandy fire**; **do not write Jonas Salk as an FRHS
alumnus**; publish **ZIP 11691 only**; cite redirect targets, not the finder's URLs.

## 4.5 ROCKAWAY BEACH may publish

Rockaway Courthouse (`90-01 Beach Channel Drive, Rockaway Beach, NY 11693`) · Temple of Israel
Synagogue (`1-88 Beach 84th Street`) · St. Rose of Lima RC Church (`130 Beach 84th Street`) ·
Peninsula Library (`92-25 Rockaway Beach Boulevard`) · **Hammel Houses (`84-16 Rockaway Beach
Boulevard, Queens, NY 11693`)** · Rockaway Beach Surf Club (`302 Beach 87th Street`) · Tacoway Beach
(**same address — one venue, two names; say so plainly**) · **Rockaway Beach and Boardwalk (hosted
here per §1.2 — `Beach 3 St. to Beach 153 St.`, never claimed whole)** · Rockaway Beach Skate Park
(`Beach 91st Street` — the boardwalk article's explicit containment sentence) · Beach 90th
Street–Holland station · Beach 98th Street–Playland station · Rockaways' Playland (defunct, **last
season 1985**, Beach 97th–98th Streets).

**Rockaway Beach-specific bans:** **never a street-range boundary sentence** — the one article that
supplies them supplies two incompatible ones; the courthouse's current use is **unknown, no present
tense**, and it is **not limestone**; "largest urban beach in the United States" is a 2007 travel-piece
aside — attribute or drop; population is **"more than 13,000 as of 2010, per The Wave"**, not the
infobox 13,449; the "Irish Riviera" 25.4% is a **2000-census ZCTA** figure and needs both qualifiers;
Whaleamena gets no record; **do not narrate Seaside, Rockaway Park, Arverne, Edgemere, Belle Harbor,
Neponsit or Breezy Point as ours, and do not narrate Far Rockaway's places.**

---

# PART 5 — INSTRUCTIONS TO THE COORDINATOR

1. **Add the `alley-pond-park` record to `bayside.json`** under the §1.1 constraints. Omit the
   address. **Drop the "reaches Community District 13" claim** — `Q001` records `communityboard: 411`
   alone. `douglaston.json` gains nothing. The gate needs no edit and the `@tag :pending_queens` comes
   off only once this record exists.
2. **`rockaway-beach.json` hosts `rockaway-beach-and-boardwalk`; `far-rockaway.json` references it.**
   If a marquee row is added, anchor it `~r/^rockaway-beach-and-boardwalk/` — **never
   `~r/^rockaway-beach/`**, which would count `far-rockaway.json`'s own `rockaway-beach-…` slugs and
   fail at 2.
3. **Check `forest-hills.json` for a Kew Gardens–Union Turnpike station record** before Kew Gardens
   writes one (§2.10).
4. **Tell Kew Gardens' file the Bunche House is `type=NHL`** if it has not said so.
5. **`kew-gardens.json` and `richmond-hill.json` must not both carry the 121st Street station.**
   Ruled to Richmond Hill (§2.10).
6. **Three of the peninsula's four LPC designations belong to `far-rockaway.json`** and its finder may
   not have had them: `16-12 Mott Avenue`, `16-15 Central Avenue`, and the Richard Cornell Graveyard
   (a 1970 designation and a significant place).
7. **Richmond Hill ships with no gurdwara.** Flag for targeted retrieval; do not let the author
   paper over it, and do not let a research-process sentence about it reach the page.
