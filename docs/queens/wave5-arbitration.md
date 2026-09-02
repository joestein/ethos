# Queens Wave 5 — ARBITRATION

**Pages arbitrated:** `flushing.json` (CD 7), `bayside.json` (CD 11), `douglaston.json` (CD 11).
**Inputs read in full:** `docs/queens/flushing-verdicts.md`, `docs/queens/bayside-verdicts.md`,
`docs/queens/douglaston-verdicts.md`.
**Independently re-checked by me, from the files themselves:** the `citi_field_guide.ex` destination
string; the eight `citi_field_places.ex` names and their two towns; the thirteen shipped Queens seed
files; the `Astoria Park` records in `astoria.json`; the custodial `Forest Park` record in
`forest-hills.json`; and §1.2–1.5 of `wave4-arbitration.md`.

Evidence rank used throughout, as the brief sets it:
1. the place's own street address and the neighborhood name in it;
2. what the best-evidenced source says explicitly;
3. community-district and boundary definitions the verdicts confirm.

This wave is unusual and the authors must hold it in mind: **Flushing is not adjacent to either of
the others.** Flushing is `QN0707` in CD 7; Bayside is `QN1102` and Douglaston-Little Neck is
`QN1103`, both in CD 11, several miles east. All three verifiers looked for a Flushing↔Bayside or
Flushing↔Douglaston tie and all three found none. **Do not manufacture one.** The one real adjacency
hazard the brief predicted — Bayside↔Douglaston — turns out to be smaller than expected too: the
Douglaston verifier recomputed it and the two NTAs share **zero** boundary and come no closer than
**29.72 m**, at Northern Boulevard over Alley Creek. Alley Pond Park is the reason, and it is the
first ruling below.

---

## 1. ALLEY POND PARK — the marquee ruling

### 1.1 The instrument, and the error the last two waves left behind

All three verifiers pulled DCP's 2020 NTA table `9nt8-h7nd` independently and returned the same row:

```
QN1191 | Alley Pond Park              | ntatype 9 | QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)
```

set against the two settled parks:

```
QN8191 | Flushing Meadows-Corona Park | ntatype 9 | QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)
QN8291 | Forest Park                  | ntatype 9 | QN82 Forest Park (JIA 82 Approximation)
```

**`ntatype 9` is not the Jointly Interested Area marker, and wave 3 and wave 4 wrote it imprecisely.**
The marker is the **CDTA**: a `QN8x` community-district tabulation area whose published name carries
the literal string `(JIA NN Approximation)`. Queens has ten `ntatype 9` rows and only four sit in a
JIA CDTA. The other six — Astoria Park, Kissena Park, Cunningham Park, Spring Creek Park, Rockaway
Community Park and **Alley Pond Park** — sit inside ordinary community-district CDTAs and are
ordinary park tabulation areas.

**Alley Pond Park is therefore NOT a Jointly Interested Area.** Any sentence in this wave that calls
it one, or that reaches "another JIA, so nobody publishes it", is wrong on the data and must not be
written. The Forest Park instrument does not reach this park. The corpus should record the
correction, because the next wave will otherwise inherit the error.

And the awardable precedent is real and already shipping: `QN0191 | Astoria Park | ntatype 9 | QN01
(CD 1 Equivalent)` is the identical configuration, and I confirmed `priv/seed_data/queens/astoria.json`
carries both `Astoria Park` and `Astoria Park Pool and Play Center` as its own records. So the
question here is genuinely open, and it has to be decided on evidence rather than on the wave-4 rule.

### 1.2 RULING — **ALLEY POND PARK BELONGS TO NO WAVE-5 FILE.**

> **Neither `bayside.json` nor `douglaston.json` creates an Alley Pond Park record, and
> `flushing.json` must not mention it at all.** It is not a JIA. It is a 635-acre park with its own
> DCP tabulation area, straddling two community districts, that no neighborhood contains.

Each rank of the evidence hierarchy points the same way, and the first two are decisive on their own.

**Rank 1 — the address.** There is none. NYC Parks publishes `Q001GROUP`, `Property Type: Park
Group`, and for a location only the boundary string **`Little Neck Bay to Springfield Blvd, Union
Tpke`** (`enfh-gkve`, `Q001`, `acres 635.514`, `typecategory "Flagship Park"`). Two verifiers pulled
that string separately and it matches. Rank 1 names no claimant, and **no author may invent a street
address to supply one.** Compare Forest Park, where the address existed and defeated every claimant
by naming a fourth neighborhood; here it does not even exist.

**Rank 2 — what the sources say explicitly.** Every source that speaks says *bordered by*, not *in*:

- Wikipedia, re-quoted by the Douglaston verifier: *"The park is bordered to the east by Douglaston,
  to the west by Bayside, to the north by Little Neck Bay, and to the south by Union Turnpike."*
- NYC Parks' own Udalls Park Preserve sign: *"These are the peninsulas of Great Neck, Bayside, and
  Douglaston that flank the pre-glacial river valley of Little Neck Bay and Udall's Cove."* The city
  treats Bayside and Douglaston as two separate landforms.
- **NYC Parks' Alley Pond Park page names no neighborhood at all.** The Douglaston verifier fetched
  it and counted: the strings "Douglaston" and "Bayside" occur **zero** times.

**Rank 3 — the boundary definitions.** `Community Board: 11, 13` and `Zip Code: 11361, 11362, 11363,
11364, 11426` on the live Parks page; the park reaches **outside CD 11 entirely**, and both the
Flushing and Douglaston verifiers' area samples independently landed points in `QN1302 Bellerose`,
which is CD 13 and is not in this wave at all.

**And the two measurable instruments disagree with each other, which is itself disqualifying.** Three
independent runs, by three verifiers who could not see each other:

| Instrument | Bayside `QN1102` | Douglaston-Little Neck `QN1103` | Also present |
|---|---|---|---|
| Area sample, Flushing verifier (600 pts) | **7.2%** | 4.8% | own NTA 80.7%; Bellerose 0.8%; Oakland Gardens 0.3% |
| Area sample, Douglaston verifier (4,000 pts) | **7.7%** | 5.8% | own NTA 80.2%; Bellerose 0.8%; Oakland Gardens 0.1% |
| Shared boundary, Bayside verifier | 2,942 m / 20.0% | **4,640 m / 31.6%** | Oakland Gardens 3,519 m / 23.9% |
| Shared boundary, Douglaston verifier | 2,929.9 m | **4,621.5 m** | perimeter 14,642 m |

Area favours Bayside; boundary favours Douglaston; the two area runs and the two boundary runs agree
with each other, so this is not measurement noise — it is a real split. **About four fifths of the
park is its own tabulation area, a third neighborhood (Oakland Gardens-Hollis Hills, `QN1104`) out-ranks
Bayside on shared boundary, and a fourth in another community district holds a share of it.** That is
not the Astoria Park case, where one neighborhood wholly enclosed a 61-acre park and no one else
touched it.

**The three verifiers converge, and none of them claims it.** Bayside's verifier: *"ALLEY POND PARK IS
NOT A BAYSIDE PLACE"*, adding that Douglaston has the better claim if awarded. Douglaston's verifier:
*"ALLEY POND PARK BELONGS TO NO NEIGHBORHOOD FILE"*, adding that Bayside leads on area. Flushing's
verifier: *"definitively NOT a Flushing place"*, zero of 600 samples in any CD 7 NTA, and recommends
a shared boundary-feature treatment with no exclusive record. **Two of the three independently
reached "no file", and the third's award recommendation is one it calls "not strong" on a
43-point-to-29-point margin.** I adopt "no file".

**This was close and I say so.** What would overturn it: a city instrument that actually places the
park in a neighborhood — a Parks street address naming Bayside or Douglaston, an LPC or DCP record
assigning `Q001` to `QN1102` or `QN1103`, or a DCP revision folding `QN1191` into a residential NTA.
None exists today. Prose sources will not do it; every one of them says *borders*.

### 1.3 What follows the park, and gets no record either

All of these sit inside `QN1191` and are off-limits to both CD 11 pages **as records and as this
page's own prose**:

**Oakland Lake · the Queens Giant · the Alley Pond Adventure Course · Windmill Pond · Cattail Pond ·
the LIRR viaduct over Alley Creek · Alley Playground · the Alley Pond Environmental Center (APEC) ·
the Alley Pond Golf Center / Knox Golf Academy (232-01 Northern Blvd) · the 2005 Douglaston Manor
Windmill replica.**

Two of those need their reasoning stated, because the verdicts disagreed:

- **APEC.** Bayside's verifier ruled it **Douglaston**, on APEC's own line *"229-10 Northern
  Boulevard, Douglaston, NY 11362"*. Douglaston's verifier geocoded the parcel: `"229-10 NORTHERN
  BOULEVARD, Alley Pond Park, NY, USA"`, WOF **Alley Pond Park**, ZIP **11363**, BBL `4075700001`,
  NTA `QN1191` — **and APEC's self-published ZIP is wrong** (11362 against the city's 11363 for that
  parcel). Rank 1 is a self-description with a demonstrable error in it; two city instruments say
  parkland. **APEC follows the park: no file.** Overturned by APEC correcting its own address, or by
  a city record placing BBL `4075700001` in `QN1103`.
- **The Queens Giant.** Bayside's verifier refuted the claim that Wikipedia assigns it to Douglaston
  — the article is a redirect to `Alley Pond Park#Queens Giant` and says only that the tree is *"near
  the Douglaston Plaza Mall"*. **Near a mall is not a neighborhood.** Douglaston's verifier
  point-in-polygon tested the published coordinates: `QN1191` only. **No file.** If either page names
  the tree at all it must carry Parks' own hedge — *"Some arborists estimate the tree's age at 250
  years"* — and never the unhedged "oldest living thing in New York City".

### 1.4 What Bayside and Douglaston MAY say, with no record

Each page may say that Alley Pond Park **adjoins** or **borders** it — Bayside on its west edge,
Douglaston on its east — because each has a confirmed source for exactly that and nothing more.
Beyond that:

**Bayside may also publish, because both are stewardship or etymology rather than containment:**
- The Bayside Historical Society's founding purpose, confirmed verbatim on `baysidehistorical.org`:
  founded 1964 *"with three goals: The preservation and restoration of the Lawrence Family Cemetery ,
  Alley Pond and Fort Totten."* (Quote it with the source's own stray space, or don't quote it.)
- The origin of the "Alley" name, confirmed verbatim in LP-2154: *"Initially, access was from Little
  Neck Bay, by boat, or via a road called the 'Alley' that ran along the shore."* A Bayside-subject
  LPC report is the source; this is legitimate Bayside prose.

**Douglaston may also publish** the Douglaston Park Golf Course clubhouse at **63-20 Marathon
Parkway** (see §3), and Aurora Gareiss as *"a feisty, middle-aged Douglaston resident"* in the Udalls
Cove Preservation Committee's own words — she is Udalls Cove's story, not the park's.

**Neither page may:** call the park its own; rank itself among the park's neighbours; publish the
metres or the percentages above (those are this wave's measurements, not a source, and "the largest
share" is an unsourced superlative); publish an acreage without saying whose (635.514 / 635 / 655.3
are all real and count different things); or write a banned proximity phrase to place it.

### 1.5 A note for the coordinator, not for the authors

The Queens marquee list will finish this wave with Alley Pond Park unheld. That is the correct
outcome on the evidence and it is not an author's problem to solve. If the coordinator later wants
the park in the corpus, the **only** lawful form is the `forest-park` precedent: a **custodial**
record with `town = "Queens"`, the Parks boundary string as its location, and prose stating in terms
that the park belongs to no neighborhood — the same three properties that make the Forest Park record
lawful in `forest-hills.json`. On the tiebreak between the two abutters, area share (7.2% and 7.7%,
twice measured) beats shared boundary here, because the question is what the park *is inside*, not
what it *touches*; so a custodial record would go to `bayside.json`. **That is a post-wave
bookkeeping decision by the coordinator. No author in this wave creates it, and the borough gate must
assert at most one such record.**

---

## 2. FLUSHING MEADOWS-CORONA PARK — the firewall, confirmed for Flushing

### 2.1 It stands, and it binds Flushing hardest of any page so far

Wave 3 ruled that Flushing Meadows-Corona Park belongs to no neighborhood file, and put the eight
`Ethos.Seeds.CitiFieldPlaces` holdings off-limits corpus-wide. **That ruling stands for Flushing,
without qualification.** I re-read `lib/ethos/seeds/citi_field_places.ex` myself: it declares exactly
eight places — **Citi Field, the Unisphere, the Queens Museum, the New York Hall of Science, the
Queens Zoo, the USTA Billie Jean King National Tennis Center, the New York State Pavilion and the
Queens Theatre** — under towns `Corona` and `Flushing`.

The instrument is exact and the Flushing verifier pulled the decisive row: `QN8191` sits in CDTA
`QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)`. **The City writes "JIA" into the name.**

**`flushing.json` must not create any of the eight under any slug, must not create the park, and must
not narrate any of their history.** The Bronx concourse precedent — a first draft that narrated those
places anyway and came back as two Criticals — is the exact failure mode available here, and it is
more available to Flushing than it was to Corona, because the park carries Flushing's name and the
ballpark's postal address says Flushing. **Flushing's park section will read thinner than the
neighborhood's fame suggests. That is the firewall working, not a research gap.**

### 2.2 What Flushing MAY say

This is the distinction the brief asked me to draw, and it is narrow:

- **That the park carries the neighborhood's name**, and that the City files it as its own tabulation
  area, `QN8191`, a joint interest area belonging to no neighborhood. Both are confirmed and both are
  facts about the *name and the filing*, not about the park's contents.
- **That the park lies beyond Flushing's own tabulation area, `QN0707 Flushing-Willets Point`, and
  that its ground reaches CD 7 among others.** The Flushing verifier confirmed from NYC Parks `Q099`:
  `communityboard "403404406407408"`, `zipcode "11354, 11355, 11367, 11368"`, `acres 870.761`. If the
  page states the community boards, state them as the multi-board list they are.
- **A routing sentence linking `/g/citi-field-guide`.** That link is the honest move and it is what
  routes the reader. Linking routes; narrating does not.
- **That `guide.destination` is `Flushing, New York`** — see §6.1; that is a build requirement, not a
  sentence.

### 2.3 What Flushing MAY NOT say

- **REFUTED — do not publish:** that the park "lies substantially in CD 4". The finder marked it a
  paraphrase and the verifier killed it: `Q099` spans five community boards **including CD 7**.
- Any history, description, opening date, architect, exhibit or anecdote attached to the eight
  holdings, in any section, including captions and link notes.
- The Rocket Thrower, the Statue of Tom Seaver, Etihad Park, the 1964–65 World's Fair Carousel,
  Meadow and Willow Lakes, the World's Fair Marina and the Queens Night Market. All are inside the
  JIA or on Corona ground. **None becomes a Flushing place.**
- The Bayside apparitions / Veronica Lueken vigils. The later vigil site is **inside the park**. The
  Bayside verifier's instruction is right and I extend it to Flushing: **do not narrate the Flushing
  Meadows half at all.** If Bayside touches the subject, the Diocese of Brooklyn's 1986 finding is
  negative and *"completely lacked authenticity"* must not be softened.

**Queens Botanical Garden is the one thing next to that park that is NOT firewalled** — see §3.

---

## 3. THE CONTESTED PLACES — RULINGS

Every place that appears in more than one verdict file, or whose assignment any source disputes.
"NO FILE" means no wave-5 page creates a record; where a page may still *mention* it, that is stated.

### 3.1 Flushing ↔ Bayside

| Place | RULING | Reason |
|---|---|---|
| **Fitzgerald/Ginsberg House, 145-15 Bayside Avenue** | **FLUSHING** | Both verifiers agree independently: LPC files it `nta2020 QN0704 Murray Hill-Broadway Flushing`, CD 7; GeoSearch returns `'145-15 BAYSIDE AVENUE, Flushing, NY, USA'`, ZIP 11354. **A street named Bayside Avenue is not the neighborhood of Bayside.** Bayside must not claim it, and must not claim the Q16 "via Union Street and Bayside Avenue" either. |
| **Oakland Lake as "Flushing's water source"** | **NEITHER PAGE** | The lake is inside `QN1191` (§1.3), so it is not Bayside's; and the finder's quotation was refuted — the source actually says the lake was used by *"the town of Flushing"* until 1898. Flushing may not claim a lake it does not contain; Bayside may not publish the refuted string. |
| **The "Bayside Quakers" plot, Section I, Flushing Cemetery** | **FLUSHING**, if at all | Inside Flushing Cemetery, which is a Flushing place. Single-sourced to a 1967 newspaper column: ships only with that attribution, and it says nothing about the modern neighborhoods. **Bayside may not use it as a Bayside connection.** |
| **The Long Island Koreatown corridor** | **FLUSHING**, bounded | A diaspora spreading east along Northern Boulevard is not two neighborhoods adjoining. Flushing writes its own confirmed bounds — **Union Street between 35th and 41st Avenues** — and stops. It may not write that Flushing borders Bayside. |
| **The 113- ZIP sectional centre "east to Bayside and Little Neck"** | **NEITHER** | A postal-administration boundary. Not a neighborhood link, not publishable as one. |
| **The historic town of Flushing (1683–1898)** | **FLUSHING**, with the consolidation stated | The colonial town contained ground that is now Bayside and Douglaston; the modern neighborhood does not. If the page writes the town's extent it must say *"the town of Flushing"* and make 1898 explicit in the same breath. This is the single largest false-tie risk in the wave. |
| **The Bayside Historical Society's letter supporting a Flushing designation** | **NEITHER** | A letter at a hearing is not a place. Do not create it, do not mention it. |
| **Bellcourt / Broadway-Flushing / Westmoreland (Rickert-Finlay tracts)** | **Bellcourt → BAYSIDE; Broadway-Flushing → FLUSHING; Westmoreland → LITTLE NECK (out of corpus)** | LP-1957 names all of them in one sentence and that sentence is the trap. Douglaston may quote it only if it keeps the boundary inside it visible. |

### 3.2 Bayside ↔ Douglaston

| Place | RULING | Reason |
|---|---|---|
| **Alley Pond Park** and everything inside it | **NO FILE** | §1. Not a JIA; no neighborhood contains it; area and boundary instruments disagree; no street address exists. |
| **Alley Pond Environmental Center** | **NO FILE** | Parcel geocodes to `Alley Pond Park`, `QN1191`, ZIP 11363; APEC's own Douglaston line carries the wrong ZIP. §1.3. |
| **Alley Pond Golf Center / Knox Golf Academy, 232-01 Northern Blvd** | **NO FILE** | WOF says Douglaston, NTA says `QN1191`, and the parcel is city parkland. Follows the park. (Its DOHMH entity has never been inspected — `inspection_date 1900-01-01`.) |
| **Douglaston Park Golf Course** | **DOUGLASTON — the clubhouse end only** | `63-20 Marathon Parkway` → WOF Douglaston, `QN1103`, Parks `communityboard 411`, ZIP 11362, PLUTO `yearbuilt 1927`. But `6710 Douglaston Parkway` geocodes into `QN1191`. **Publish the clubhouse address; do not describe the whole 104.6-acre property as Douglaston's**, and do not reconcile the 104.6-acre and 50.0-acre figures — say which. |
| **Cornelius Van Wyck House** | **DOUGLASTON** | Both verifiers concur. LPC `buis-pvji` gives `37-04 Douglaston Parkway`, BBL `4080560062`, `QN1103`; LP-0144's own header carries both forms. Publish **`126 West Drive aka 37-04 Douglaston Parkway, Douglaston, NY 11363`**. Wikipedia's bare "126 West Dr." is the weaker rendering. **Privately owned single-family house — no visit may be implied.** |
| **Benjamin P. Allen House / Allen-Beville House** | **DOUGLASTON** | LPC `29 Center Drive`, BBL `4080640076`, `QN1103`, PLUTO ZIP **11363**. **Never publish ZIP 11360** — GeoSearch resolves this landmark to a vacant lot in Bay Terrace. Use `29 Center Drive, Douglaston, NY 11363` or `236-12 Center Drive`. Private residence. |
| **Lawrence Graveyard · 35-34 Bell Boulevard (Cobblestone House) · Hawthorne Court Apartments · Ahles House** | **BAYSIDE (all four)** | LPC `cd 411`, `nta2020 QN1102` on every row; and Douglaston's verifier independently confirmed that `buis-pvji` returns exactly six individual landmarks in CD 11, of which **only two are Douglaston's** and *"the other four — Ahles House, Hawthorne Court, Lawrence Graveyard, 35-34 Bell Boulevard — are Bayside's."* Two verifiers, one answer. **Any claim of a third Douglaston individual landmark is wrong.** |
| **Crocheron Park** | **BAYSIDE** | NYC Parks `Q012`, `Community Board: 11`, `Zip Code: 11361`. Douglaston's verifier lists it as ruled out of `douglaston.json`. |
| **John Golden Park** | **BAYSIDE**, address unresolved | Parks `Q012B`, CB 11. **But the "Mr. Bayside" history page 302-redirected on the verifier and not one quote from it is confirmed** — the white suit, the silver-handled cane, the 1965 dedication, Tony DePhillips. **Re-fetch `nycgovparks.org/parks/Q012B/history` or publish none of it.** |
| **Cardozo High School** | **BAYSIDE** | Wikipedia verbatim: Douglaston is *"zoned for Benjamin N. Cardozo High School, in neighboring Bayside."* Douglaston may say it is zoned there; it may not hold the school. |
| **111th Precinct station house, 45-06 215th Street** | **BAYSIDE** | Geocodes `Bayside`, `QN1102`. It *serves* Douglaston and *is in* Bayside; Douglaston may say the former only. |
| **QPL Douglaston/Little Neck branch, 249-01 Northern Blvd** | **DOUGLASTON**, named for both | WOF Douglaston, ZIP 11362, `QN1103`. Publish with the branch's full name. |
| **QPL North Hills branch, 57-04 Marathon Parkway** | **DOUGLASTON** | WOF Douglaston, and the non-monotonic Marathon Parkway result is confirmed (`56-01` → Little Neck, `57-04` → Douglaston). |
| **The 248-25 / 249-11 / 249-17 Northern Blvd businesses** | **DOUGLASTON if used at all — weak** | WOF says Douglaston at address level; Wikipedia's "east of Marathon Parkway" rule says Little Neck, and the same article contradicts itself elsewhere. Address-level evidence beats a generalisation, so it is Douglaston's — **but the page must not lean on it**, and they are DOHMH-only regardless. |
| **Cornell-Appleton House, 214-33 33rd Road** | **BAYSIDE** | Confirmed verbatim. **The "second-oldest home in Queens" superlative must not ship — the source cited for it denies it** (its own footnote dates construction to 1852 and compares it unfavourably to Lent-Riker and Onderdonk). Publish only the source's weaker wording. No Titanic anecdote. |
| **Corbett House, 221-04 Corbett Road** | **BAYSIDE** | Confirmed verbatim, with a real NYT citation behind it (Nagler, 1 September 1985). |
| **Straiton-Storm Cigar Factory** | **NO RECORD, Bayside prose only** | No address exists in any source, and it conflicts with LP-2341's *"only remaining example of the substantial Second Empire buildings erected in Bayside"*. Ships only as a historical assertion with the NYT attribution and the conflict acknowledged. |

### 3.3 Douglaston ↔ Little Neck (the real hazard on that page)

The Bayside↔Douglaston adjacency the brief warned about barely exists; **the leak risk on
`douglaston.json` is eastward, into Little Neck, which is outside this corpus.** The flip point is
confirmed to the house number: `249-17 Northern Blvd` → Douglaston, `250-01 Northern Blvd` → Little
Neck.

| Place | RULING |
|---|---|
| **Il Bacco and the 30+ businesses from 250-01 to 255-13 Northern Blvd** | **LITTLE NECK — outside the corpus.** The single highest-risk leak on the page. `douglaston.json` must not name Il Bacco. |
| **Both post offices (56-01 Marathon Pkwy, 250-10 Northern Blvd)** | **LITTLE NECK.** There is no Douglaston post office in evidence. |
| **Little Neck Theater · the local newspaper · the DLNHS mailing address (`PO Box 630142, Little Neck, NY 11363`)** | **LITTLE NECK / shared.** DLNHS may be described as the two neighborhoods' society; its mailbox is not a Douglaston address. |
| **The Memorial Day parade** | **SHARED** — the organisation's own name is *"Little Neck - Douglaston Memorial Day Parade Organization, Inc."*, Little Neck first, and the route starts in Nassau County. **No claim about its size is in evidence; do not write one.** |
| **Udalls Park Preserve** | **DOUGLASTON** — Parks `Q452`, ZIP 11363, CB 411, 44.44 ac; boundary string only, no street address. |
| **Udalls Cove, the Ravine, Aurora Pond, Gabler's Creek** | **SHARED, and written as shared** — UCPC's own words place the Cove *"between the Douglaston and Great Neck peninsulas"* and the Ravine *"between Little Neck and Douglaston"*, with land held by the State, the City and the Village of Great Neck Estates. |
| **Virginia Point** | **LITTLE NECK — out.** |
| **Saddle Rock Mill** | **NASSAU COUNTY — out.** Parks' own sign says it went to the Nassau County Historical Society in 1950. |
| **Zion Episcopal Church (243-20 Church Street) and its rectory (242-02 44th Avenue)** | **DOUGLASTON**, with the district caveat: **inside the National Register Douglaston Hill district, outside the New York City one.** LPC says the church is outside its district three times in its own reports. Any sentence naming church and district together **must say which district.** |
| **Douglaston Manor (63-20 Commonwealth Blvd)** | **NOT a separate institution.** It shares a BBL with the golf-course clubhouse parcel; the inference is the verifier's and unsourced, so the page must simply not present it as an independent Douglaston venue. |
| **The Douglaston Manor Windmill** | **NO RECORD.** The object is gone; the 2005 replica stands on the `QN1191` parcel; and the only article about it is internally contradictory and **ruled unusable as a source**. Nothing on the page may rest on it. |

### 3.4 Fort Totten, Bay Terrace and the northern peninsula — no wave-5 file holds them

Every **geographic** instrument puts them outside Bayside, and every **pro-Bayside** source is a
postal-city field:

- DCP: `QN0761 | Fort Totten | ntatype 6 | QN07 (CD 7 Approximation)` and `QN0703 | Bay
  Terrace-Clearview | QN07`. Both are CD 7, and both are **their own NTAs** — so they are not
  Flushing's either. `flushing.json` is `QN0707`, and absorbs only `QN0704` (§4).
- NYC Parks: Fort Totten `Q458`, Little Bay `Q010A`, Bay Terrace Playground `Q399`, Clearview
  `Q010` — **all `Community Board: 7`**, against Crocheron `Q012`, **CB 11**.
- LPC 1999, LP-2040, verbatim: *"Fort Totten occupies a 136-acre site in northeast Queens, **north
  of Bayside**, on a peninsula jutting into the Long Island Sound."* The same agency's 1974 header
  said "Bayside"; **the agency corrected itself.**
- NRHP's `city=[[Bayside, Queens|Bayside]]` is literally a **mailing city** parameter; ZIP 11359's
  USPS city name is "Bayside", which is why every one of these reads that way.

> **RULING: NO WAVE-5 FILE publishes Fort Totten Park, the Officers' Club / The Castle, the Fort
> Totten Battery, the Fort Totten Historic District, Little Bay Park, Clearview Park Golf Course,
> Valentino's on the Green, Bay Terrace Playground, the Bay Terrace shopping center, the Throgs Neck
> Bridge's Queens landing, the FDNY EMS Training Academy or its museum, Thorne-Wilkins Cemetery,
> Alicia's Jewelers, or the QPL Bay Terrace branch.**
>
> **ONE EXCEPTION — the Bayside Historical Society is BAYSIDE's.** It is *the* Bayside institution,
> named for Bayside, its archive is the history of Bayside, and it prints its own address ending
> "Bayside, NY 11359". Publish it **exactly as BHS prints it — `208 Totten Avenue, Fort Totten,
> Bayside, NY 11359`** — and **write no prose asserting that Fort Totten is in Bayside.** The Castle
> is BHS's premises, not a Bayside landmark. This is rank 1 (the institution's own address, with the
> neighborhood name in it) beating rank 3 for the institution only, and rank 3 winning for the site.

### 3.5 Other places ruled out of all three files

| Place | Where it is | Note |
|---|---|---|
| **Oakland Gardens-Hollis Hills** | own NTA `QN1104`, a **peer** of Bayside, not a sub-area | Wikipedia's *"in southern Bayside"* is verbatim but outvoted by DCP and by CB 11's own peer listing. |
| **Cunningham Park** | `QN0891`, **CD 8** | 0 m shared boundary with Alley Pond Park. Not Bayside's. |
| **Bay Terrace (place)** | `QN0703`, CD 7 | *"often considered part of the larger area of Bayside"* is verbatim, and is a colloquial hedge against a hard boundary. Historically Bayside, administratively not. |
| **Bayside Cemetery** | Ozone Park (unconfirmed) | Neither verifier confirmed it. **Do not claim it either way.** |
| **Pomonok, Electchester, Kew Gardens Hills, Queens College, Mount Hebron Cemetery** | CD 8 | Not Flushing's. |
| **Frank Golden Park, Flushing Airport** | College Point | Out of scope. |
| **The World Journal HQ** | Whitestone, wave 6 | Out of scope. |
| **Moore-Jackson Cemetery** | Woodside — **already ships** | Never re-create. |
| **Raymond O'Connor Park, Motor Parkway** | outside `QN1103` | Ruled out of `douglaston.json` by its own verifier. |
| **Anything in Nassau County, Great Neck or Little Neck** | outside the corpus | Including the n20G NICE bus to Great Neck and Fitzgerald's Nassau settings. |

**East Flushing — a coordinator flag, not an author's problem.** DCP files `QN0705 East Flushing` in
**CD 7**; the project roster says CD 11, and the roster's own `source` field admits it was built from
Wikipedia without the DCP data. **DCP is right.** It is `in_scope: false` either way, so no page is
blocked; the roster should be corrected.

---

## 4. THE ALLOW-LISTS

A place assigned to another page **may still be mentioned in prose** where a verdict supports it —
but only as the neighbouring place it is, never as this page's own, and it gets **no place record
here**. Everything below still has to clear the fact-fidelity rules; an allow-list entry is
permission to hold the record, not permission to describe it beyond its verdicts.

### 4.1 `flushing.json` MAY PUBLISH (31)

**Full prose, primary-sourced (17):** Bowne House (`37-01 Bowne Street`) · Friends Meeting House
(`137-16 Northern Boulevard`) · Kingsland Homestead (`143-35 37th Avenue`) · Queens Historical
Society · Margaret I. Carman Green–Weeping Beech Park (`37th Avenue between Parsons Boulevard and
Bowne Street`) · Flushing Town Hall (`137-35 Northern Blvd.`) · Lewis H. Latimer House Museum
(`34-41 137th St`) · St. George's Church, Old Parish House and Graveyard (`38-02 Main Street`) ·
Bowne Street Community Church (`143-11 Roosevelt Avenue`) · Flushing High School (`35-01 Union
Street`) · RKO Keith's (**interior landmark only**) · Voelker Orth Museum (`149-19 38th Avenue`) ·
Fitzgerald/Ginsberg Mansion (`145-15 Bayside Avenue`) · **the Olde Towne of Flushing Burial Ground**
(`46 Ave. bet. 164 St. and 165 St.`) · Kissena Park (`164-01 Booth Memorial Avenue`, **ZIP 11365 —
do not tidy it to 11355**) · Kissena Velodrome · Korean War Memorial (Kissena Park).

**Prose with attribution, single institutional source (5):** Flushing Cemetery (`163-06 46th Avenue`)
· Hindu Temple Society of North America / Ganesh Temple (`45-57 Bowne Street`, **without** the "first
in North America" claim) · Temple Canteen · Bowne Park · James A. Bland Playground (**Parks' own
careful framing of minstrelsy must not be simplified into celebration**).

**Address only, zero prose, zero adjectives (9):** Queens Botanical Garden (`43-50 Main Street,
Flushing, NY 11355` — **awarded to Flushing**: its address point classifies to `QN0707`, PLUTO `cd
407`, and it is *not* in `QN8191`; but every descriptive fact came from a page that 403s, so **no
acreage, no hours, no admission, no "northeast corner" sentence**) · Nan Xiang Xiao Long Bao ·
Joe's Steam Rice Roll · White Bear · Xi'an Famous Foods (×2) · Szechuan Mountain House · Shanghai
You Garden · Tong Sam Gyup Goo Yi.

**Flushing also absorbs `QN0704` and Queensboro Hill.** Murray Hill, Broadway-Flushing and Queensboro
Hill are CD 7, `in_scope: false`, and get no file of their own; leaving two designated City landmarks
unwritten to honour a tabulation line the roster does not implement would be the worse error.

### 4.2 `bayside.json` MAY PUBLISH (16)

Lawrence Graveyard (`216th Street at 42nd Avenue`) · 35-34 Bell Boulevard / Cobblestone House ·
Hawthorne Court Apartments (`215-37 to 215-43 43rd Avenue and 42-22 to 42-38 216th Street`) · John
William and Lydia Ann Bell Ahles House (`39-24 to 39-26 213th Street`) · Crocheron Park · John Golden
Park (address unresolved; **history quotes unverified**) · All Saints Episcopal Church (`214-35 40th
Ave. Bayside, NY 11361`) · Bayside Village BID / Bell Boulevard (a district, not an address) ·
Bayside Historical Society (`208 Totten Avenue, Fort Totten, Bayside, NY 11359`) · Corbett House
(`221-04 Corbett Road`) · Cornell-Appleton House (`214-33 33rd Road`) · the 111th Precinct station
house (`45-06 215th Street`) · Benjamin N. Cardozo High School · Bellcourt (as a Rickert-Finlay
tract) · the Bayside LIRR station · Bayside's own streets and the Bell Boulevard corridor as the BID
defines it.

**Bayside's biggest content risk is Bell Boulevard dining.** There is no sourced coverage of it in
the corpus and **no DOHMH data was ever pulled for this page** — so there is not even an address-only
list. Describe the corridor from the BID's own words and stop. A dining paragraph from general
knowledge would be invention.

### 4.3 `douglaston.json` MAY PUBLISH (≈47, of which 14 are address-only)

**Prose:** Cornelius Van Wyck House · Benjamin P. Allen House / Allen-Beville House · Wynant Van Zandt
House / Douglaston Club (`600 West Drive`, **private**) · Zion Episcopal Church (`243-20 Church
Street`) and its rectory (`242-02 44th Avenue`) · the site of the Great White Oak (`233 Arleigh
Road`, **cut down 2009 — no present tense**) · Alfred Scheffer's house (`216 Beverly Road`) · the
Buchman & Fox mansion (`1008 Shore Road`) · Udalls Park Preserve · Catharine Turner Richardson Park ·
Douglaston Park Golf Course clubhouse (`63-20 Marathon Parkway`) · Douglaston LIRR station · National
Art League (`44-21 Douglaston Parkway`, **no founding date — the "c.1931" is an inference, not a
fact**) · Immaculate Conception Center (`72-45 Douglaston Parkway`) · Douglaston Plaza (`242-02 61st
Avenue`) · FDNY Engine 313 / Ladder 164 (`44-01 244th Street`) · QPL Douglaston/Little Neck branch ·
QPL North Hills branch · the individually addressed houses of the two historic districts on LP-1957 /
LP-2155 authority · the Udalls Cove Preservation Committee's own account, attributed.

**Address only, zero prose (14):** Il Sapore Italiano Pizzeria · Douglaston Deli · Ivory Kitchen ·
Best Garden Chinese Restaurant **and** New Best Garden (**two `camis` — a permit change, not one
continuous business**) · K Kimchi · El Paso · Il Toscano Ristorante · Picciotto · Mizumi · Nami Sushi
· Aegea West · Nana's Wonderland · Rokstar Chicken.

**Four of those have `inspection_date 1900-01-01` — a bare permit, never inspected** (Ivory Kitchen,
Picciotto, New Best Garden, and Knox Golf Academy which is out anyway). **Nothing may be written
about any of them beyond name and address, and nothing may assert that any is open.**

---

## 5. RULES BINDING ALL THREE AUTHORS

1. **Every published claim traces to a CONFIRMED verdict.** If a hole needs a fact no verdict
   confirms, **delete the claim.** Do not patch it with an invented one.
2. **No research-process prose.** Never write about what the page or the research did or did not
   find. This is the most-repeated defect in this corpus and it has reached production. In this wave
   the temptation is acute: "no verdict establishes which neighborhood holds Alley Pond Park",
   "sources disagree on the boundary", "the park is not covered here" are all forbidden.
3. **No invented aggregates.** No counts unless a verdict states the count. This wave is full of
   competing counts that must never be averaged or summed: Alley Pond Park 635.514 / 635 / 655.3
   acres; Udalls Cove 44.44 / 90 / 100; the Lawrence graves 48 / 40 / "between forty and fifty" with
   final burials 1925 / 1939; the Douglaston HD 600+ / 631 / 638 / 939 buildings; Douglaston Hill 31 /
   32 / 57 / 83; the Lawrence grant 1637 / 1639 / 1644 / 1645 under four different grantors; Flushing
   founded 1643 / 1645. **Pick one source, attribute it in line, say what it counts — or say none.**
4. **No unrestated modifiers, no unsourced superlatives.** Specifically barred this wave, each on its
   own verdict: "second-oldest home in Queens"; "the oldest known tree in New York City" unhedged;
   the Memorial Day parade's size; Flushing Town Hall as a Smithsonian affiliate (**the institution's
   own site does not say it**); the Ganesh Temple as "the first traditional Hindu temple in North
   America" (**the temple's own site does not say it**); "more than 200 houses of worship"; "one of
   the oldest Little India neighborhoods"; **any Flushing food superlative at all** — there is no
   third-party culinary recognition anywhere in this corpus.
5. **Provenance.** A DOHMH/DCWP record establishes that a business exists and where — and **may never
   appear in prose, not even the category noun.** A business's own site can establish identity and
   location but not awards, superlatives or how long it has traded. Absence from DOHMH is **not**
   evidence a business has closed.
6. **Banned phrasings, on every string including captions and link notes:** "steps from", "next
   door", "across the street from", "a few doors down", "down/up the street", "down/up the block",
   "within walking distance", "N blocks north/south/east/west", "north/south/east/west of the
   station|stadium|ballpark|arena|venue|site". **"Steps from" and "down the block" trip on their
   literal senses too** — write "stairs" and "along the block". Three captions in this corpus have
   already been reworded for exactly this.
7. **Attribution is for characterization, not information.** Never "according to Wikipedia, the
   building stands at 5 Elm Street".
8. **A neighbouring neighborhood's facts are not this page's own.**
9. **Dates that are traps:** the Weeping Beech was planted 1847, not the 1647 LPC printed, and **the
   tree died in 1998** — it is a landmark site, not a living tree. The *Sappho* year in LP-0944 is
   the Commission's own error; **do not print it**. Do not print "Five Nations" for the Matinecock.
   Do not print PLUTO's `yearbuilt 1990` for the Latimer House (the lot, not the house; LPC gives
   c.1887–89) or `2020` for 240-27 Depew Avenue. Louis Armstrong is **buried** in Flushing and
   **lived** in Corona, where wave 3 placed his house — keep them apart or the Corona page is
   contradicted.

---

## 6. THE TWO HARD GATES

### 6.1 `flushing.json`'s destination string

I read `lib/ethos/seeds/citi_field_guide.ex` myself. It contains, twice, verbatim:

```
destination: "Flushing, New York"
```

> **`flushing.json`'s `guide.destination` must be exactly `Flushing, New York`** — character for
> character, comma and single space included. **Not** "Flushing, Queens", **not** "Flushing, NY",
> **not** "Downtown Flushing, New York".

Identical destination strings derive identical destination slugs, and that is the entire mechanism by
which this page **co-lists** with `Ethos.Seeds.CitiFieldGuide` instead of competing with it. A gate
asserts it the moment the file exists. Institutional sources overwhelmingly write "Flushing, NY" with
a ZIP — **that does not license changing the string.** The co-listing requirement is a project rule,
not a source claim. Individual place records carry their own address strings; the guide destination
does not.

### 6.2 One record per marquee institution

The eight `CitiFieldPlaces` holdings exist in code and are **never** re-created in a seed file, under
their own slug or any other. Flushing Meadows-Corona Park gets no record. Alley Pond Park gets no
record in this wave. Forest Park's single custodial record stays in `forest-hills.json` and no
wave-5 page touches it. **The borough gate asserts exactly one record per marquee name once Queens
lands.**

---

## 7. WHAT WOULD OVERTURN THE CLOSE CALLS

| Ruling | How close | What would overturn it |
|---|---|---|
| **Alley Pond Park → no file** | **Close.** Area favours Bayside (7.2%, 7.7%), boundary favours Douglaston (31.6%), and the third abutter out-ranks Bayside on boundary. Two of three verifiers reached "no file" unprompted. | A city instrument that places the park *in* a neighborhood: a Parks street address naming one, an LPC or DCP record assigning `Q001` to `QN1102`/`QN1103`, or a DCP revision retiring `QN1191`. Prose sources cannot do it — every one says *borders*. |
| **APEC → no file** | **Close.** Its own address says Douglaston. | APEC correcting its self-published ZIP, or a city record placing BBL `4075700001` outside `QN1191`. |
| **Bayside Historical Society → Bayside, at a CD 7 site** | Deliberate exception, argued not assumed. | Nothing likely; but if the author cannot write it without asserting that Fort Totten is in Bayside, **drop the record instead**. |
| **The 248–249 Northern Blvd block → Douglaston** | **Close**, and the page must not lean on it. | A DCP or city gazetteer line separating Douglaston from Little Neck. The NTA cannot: `QN1103` is one polygon named for both, and only WOF's label distinguishes them. |
| **Queens Botanical Garden → Flushing** | Not close on geography; **very weak on content.** | Nothing on the award. But a JavaScript-capable re-fetch of `queensbotanical.org` would unlock the prose that is currently unpublishable, and the 39-acre figure needs resolving against PLUTO's ≈33.6 before any acreage ships. |
| **Flushing absorbs `QN0704`** | Pragmatic, not geographic. | A future Murray Hill or Broadway-Flushing page. Until one exists, two designated City landmarks would otherwise go unwritten. |

---

*Arbitrated for Queens wave 5 from three independent verifier files, with the destination string, the
eight code-held places, the shipped Astoria Park precedent and the Forest Park custodial precedent
re-checked directly against the repository.*
