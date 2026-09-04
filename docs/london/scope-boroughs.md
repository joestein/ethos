# London scoping — Angle 4: the 33 units, and what each one actually carries

**Wave:** London boroughs, scoping (2026-09-04)
**Spec under test:** `docs/superpowers/specs/2026-09-04-london-boroughs-design.md`
**Brief:** the roster is settled; whether each unit can carry a page is not.

---

## 0. Method, and what bit

**Tool failures worth recording.**

- `WebFetch` was unavailable for the whole session ("claude-sonnet-5[1m] is temporarily
  unavailable, so auto mode cannot determine the safety of WebFetch"). All fetching was done
  with `python3` + `urllib`, as the brief anticipated.
- **The WebSearch budget was not the constraint; the classifier was.** Several `Bash` calls
  were refused with the same classifier-unavailable error and had to be retried verbatim. Nothing
  was lost, but the session was slower than the token cost suggests.
- **`en.wikipedia.org/w/api.php` returns HTTP 503 from this network**, consistently, for every
  action including `meta=siteinfo`. Article HTML (`/wiki/...`), `index.php?action=raw`, and
  `api/rest_v1/page/html/...` all return 200. Every measurement below therefore comes from
  `action=raw` wikitext or from scraped category HTML. **A later wave should not assume the
  MediaWiki API is reachable.**
- **`historicengland.org.uk` returns HTTP 403 to `urllib`** on both
  `/listing/the-list/results/?searchType=NHLE+Simple&search=Southwark` and the Advanced
  equivalent. I could not query the National Heritage List directly. Historic England's ArcGIS
  org (`https://services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/ArcGIS/rest/services?f=json`) **does**
  respond 200 and lists hundreds of FeatureServers, but there is no service literally named
  `Listed_Buildings` (that URL 400s). Establishing NHLE reachability is Angle 2's brief; I record
  the 403 and the working ArcGIS root as input to it.
- The shell prepended stray output from a sibling agent's script (`places 42 entries 14 … North
  Beach, California`) to almost every `Bash` result. It did not corrupt my data — my scripts write
  to uniquely-named files — but it confirms the shared-scratchpad hazard the brief warned about.
  My scratch files are all prefixed `angle4_`.

**Two independent measurement axes.** Because no single source answers "how many places could a
guide honestly write about", I measured every unit twice and report both, including where they
disagree.

- **Axis A — NHLE-backed.** Distinct `uid=` values (the Historic England list entry number) in
  Wikipedia's `EH listed building row` tabulations, i.e. the articles
  `Grade I and II* listed buildings in <formal name>`. These are transcriptions of the National
  Heritage List with list entry numbers, so each row is a designation the spec's gate assertion 12
  could cite directly. Example row, from Barking and Dagenham:
  `| name= [[Eastbury Manor House]] … | uid= 1359303`.
- **Axis B — visitor-facing.** The deduplicated union of three Wikipedia categories per unit —
  `Museums in X`, `Theatres in X`, `Tourist attractions in X` — with list-articles, parks
  constabularies, cemeteries and crematoria filtered out.

Scripts: `angle4_boroughs_fetch.py`, `angle4_yield_probe.py`, `angle4_all33.py`,
`angle4_nhle_count.py`, `angle4_crossborder.py`, `angle4_sections.py`, in the session scratchpad.

**Axis B's known bias, stated up front.** It counts *articles*, not *open attractions*. Verified
by reading the leads: Southwark's 67 includes **Vinopolis** ("was a commercial visitor attraction
in Southwark … from 1999 to 2015 … closed permanently at the end of 2015"), the **Cuming Museum**
("was a museum … its collections have been rehoused in a new Southwark Heritage Centre"), the
**Bramah Tea and Coffee Museum** ("The museum closed that year [2008] … it never reopened") and
the **Livesey Museum for Children** ("was on the Old Kent Road"). At least seven of Southwark's 67
are defunct. **Treat Axis B as an upper bound and require the finder to confirm current opening.**

---

## 1. The authoritative list

Source: `https://en.wikipedia.org/wiki/List_of_London_boroughs` (fetched via `action=raw`,
2026-09-04). Its own framing: *"This is a list of local authority districts within Greater London,
including 32 London boroughs and the City of London. The London boroughs were all created on
1 April 1965. Upon creation, twelve were designated Inner London boroughs and the remaining twenty
were designated Outer London boroughs. The Office for National Statistics has amended the
designations of three boroughs for statistics purposes only. Three boroughs have been granted the
designation royal borough and one has city status."*

The GLA's own publication of this list is Angle 1's brief; I did not duplicate it. What follows is
the formal name, the statutory designation, and the charter status of each unit.

| # | Formal name | Short name | Designation (1965 statute) | ONS statistical | Charter status |
|---|---|---|---|---|---|
| 1 | **City of London** | City of London | *(Inner)* — see note | Inner | City; ceremonial county; *sui generis*. **Not a London borough.** |
| 2 | **City of Westminster** | Westminster | Inner | Inner | **City** (declared a city in 1540) |
| 3 | **Royal Borough of Kensington and Chelsea** | Kensington and Chelsea | Inner | Inner | **Royal borough**, 1965 |
| 4 | **Royal Borough of Greenwich** | Greenwich | **Inner** | **Outer** | **Royal borough**, 2012 |
| 5 | **Royal Borough of Kingston upon Thames** | Kingston upon Thames | Outer | Outer | **Royal borough**, ancient prescriptive right, confirmed 1927 |
| 6 | London Borough of Camden | Camden | Inner | Inner | — |
| 7 | London Borough of Hackney | Hackney | Inner | Inner | — |
| 8 | London Borough of Hammersmith and Fulham | Hammersmith and Fulham | Inner | Inner | — |
| 9 | London Borough of Islington | Islington | Inner | Inner | — |
| 10 | London Borough of Lambeth | Lambeth | Inner | Inner | — |
| 11 | London Borough of Lewisham | Lewisham | Inner | Inner | — |
| 12 | London Borough of Southwark | Southwark | Inner | Inner | — |
| 13 | London Borough of Tower Hamlets | Tower Hamlets | Inner | Inner | — |
| 14 | London Borough of Wandsworth | Wandsworth | Inner | Inner | — |
| 15 | London Borough of Barking and Dagenham | Barking and Dagenham | Outer | Outer | — |
| 16 | London Borough of Barnet | Barnet | Outer | Outer | — |
| 17 | London Borough of Bexley | Bexley | Outer | Outer | — |
| 18 | London Borough of Brent | Brent | Outer | Outer | — |
| 19 | London Borough of Bromley | Bromley | Outer | Outer | — |
| 20 | London Borough of Croydon | Croydon | Outer | Outer | — |
| 21 | London Borough of Ealing | Ealing | Outer | Outer | — |
| 22 | **London Borough of Enfield** | Enfield | Outer | Outer | — |
| 23 | London Borough of Haringey | Haringey | **Outer** | **Inner** | — |
| 24 | London Borough of Harrow | Harrow | Outer | Outer | — |
| 25 | London Borough of Havering | Havering | Outer | Outer | — |
| 26 | London Borough of Hillingdon | Hillingdon | Outer | Outer | — |
| 27 | London Borough of Hounslow | Hounslow | Outer | Outer | — |
| 28 | London Borough of Merton | Merton | Outer | Outer | — |
| 29 | London Borough of Newham | Newham | **Outer** | **Inner** | — |
| 30 | London Borough of Redbridge | Redbridge | Outer | Outer | — |
| 31 | London Borough of Richmond upon Thames | Richmond upon Thames | Outer | Outer | — |
| 32 | London Borough of Sutton | Sutton | Outer | Outer | — |
| 33 | London Borough of Waltham Forest | Waltham Forest | Outer | Outer | — |

**Notes carried verbatim from the source.**

- City of London status column: *"Sui generis / City / Ceremonial county"*; footnote: *"The City of
  London is not a London borough but is treated in legislation as if it were an Inner London
  borough."* Its authorities are the **Corporation of London, Inner Temple and Middle Temple** —
  three, not one. Population 10,847 (2022 est), area 1.12 sq mi.
- The Inner/Outer footnote: *"Haringey and Newham are Inner London for statistics; Greenwich is
  Outer London for statistics."* **Three units therefore have two defensible answers to
  "Inner or Outer".** If any page or gate assertion states Inner/Outer, the spec must say which
  definition it uses. My recommendation: use the 1965 statutory designation (the "Designation"
  column) and never the ONS one, because the ONS variant exists "for statistics purposes only".
- Two boroughs were renamed after 1965 and the source cites the *London Gazette* for both:
  **Barking and Dagenham** *"Renamed from London Borough of Barking 1 January 1980"* (Gazette
  issue 48021, 4 December 1979, p.15280); **Hammersmith and Fulham** *"Renamed from London Borough
  of Hammersmith 1 April 1979"* (Gazette issue 47771, 13 February 1979, p.2095). Anything written
  about these two before those dates must use the old name.

**Royal and city charter provenance**, from
`https://en.wikipedia.org/wiki/List_of_place_names_with_royal_styles_in_the_United_Kingdom`
(`Royal borough` redirects there). The source notes: *"Since 1926 the entitlement to the title
'royal borough' has been strictly enforced."*

- **Greenwich** — royal borough, charter 2012, *"To mark the Diamond Jubilee of Elizabeth II"*;
  Letters Patent dated 3 February 2012, *London Gazette* issue 60205 p.13300, 11 July 2012.
  *"Location of the erstwhile Palace of Placentia, birthplace of Henry VIII, Mary I and
  Elizabeth I."*
- **Kensington and Chelsea** — royal borough, charter 1965, *"Transferred from Kensington"*. The
  predecessor Metropolitan Borough of Kensington was granted the style in 1901 (letters patent
  18 November 1901, *London Gazette* issue 27378, 19 November 1901, p.7472), *"In memory of Queen
  Victoria, born at Kensington Palace"*; that charter lapsed in 1965 when the present borough took
  it up.
- **Kingston upon Thames** — royal borough by *"Ancient prescriptive right, confirmed in 1927"*
  (*The Times*, 27 October 1927, p.14), transferred from the Surrey municipal borough to the London
  borough council in 1965. *"Coronation place of King Æthelstan in 924–925. Æthelstan described
  Kingston as royal town in a charter, as did Eadred later in the 10th century."*
- **Westminster** — *"The City of Westminster is a London borough with city status in Greater
  London"*; *"Westminster … was declared a city in 1540"*
  (`https://en.wikipedia.org/wiki/City_of_Westminster`).

**The two slug collisions.** The spec's resolution is factually sound and I confirm both formal
names against the table above:

| Borough | Formal name (verified) | Destination string | Derives |
|---|---|---|---|
| Greenwich | Royal Borough of Greenwich | `"Royal Borough of Greenwich, England"` | `royal-borough-of-greenwich` |
| Enfield | London Borough of Enfield | `"London Borough of Enfield, England"` | `london-borough-of-enfield` |

**One thing the spec has not noticed.** If formal names are used only for these two, the corpus
will hold `royal-borough-of-greenwich` alongside a bare `kensington-and-chelsea` and
`kingston-upon-thames` — two of the three royal boroughs styled formally, one not. That is
internally inconsistent but harmless, and it is the smaller evil: styling all 33 formally would
give slugs like `london-borough-of-sutton`, which no reader will ever type. **I recommend the spec
say explicitly that formal names are a collision remedy, not a naming convention**, so a later
wave does not "fix" the inconsistency.

---

## 2. Yield, measured

The six requested boroughs, both axes. "Where I counted from" is given per cell.

| Borough | Axis A — distinct NHLE `uid` (Grade I + II\*) | Source article | Axis B — visitor union | Verdict |
|---|---|---|---|---|
| **Westminster** | **205** (Grade I only) | `Grade I listed buildings in the City of Westminster` | **192** | Full guide, overflowing |
| **Southwark** | **33** (4 Grade I + 29 Grade II\*) | `Grade I and II* listed buildings in the London Borough of Southwark` | **67** (≈60 net of closures) | Full guide |
| **Hackney** | **38** (8 + 30) | same pattern | **21** | Full guide |
| **Bromley** | **31** (8 + 23) | same pattern | **15** | Full guide |
| **Havering** | **21** (6 + 15) | same pattern | **12** | Full guide |
| **Barking and Dagenham** | **7** (3 + 4) | same pattern | **7** | Full guide, comfortably — see §4 |

Fuller per-facet counts for the six, from `Museums / Art museums and galleries / Parks and open
spaces / Theatres / Grade I / Grade II* / Tourist attractions / Houses / Religious buildings`
categories (`angle4_yield_A.json`, `angle4_yield_B.json`). The deduplicated union across the six
visitor-facing facets, noise removed:

| Borough | Museums | Parks & open spaces | Theatres | Tourist attractions | Grade I cat. | Grade II\* cat. | **Deduped union** |
|---|---|---|---|---|---|---|---|
| Westminster | 42 | 27 | 58 | 96 | 100 | 106 | **366** |
| Southwark | 22 | 28 | 11 | 45 | 5 | 18 | **106** |
| Hackney | 5 | 16 | 6 | 11 | 2 | 8 | **40** |
| Bromley | 3 | 20 | 2 | 11 | 5 | 8 | **41** |
| Havering | 3 | 31 | 2 | 8 | 2 | 6 | **45** |
| Barking and Dagenham | 2 | 9 | 1 | 5 | 2 | 4 | **17** |

`Art museums and galleries in X` does not exist as a category for any of the six; neither does
`Religious buildings and structures in X` for five of the six. Do not build a gate or a finder
brief on those two category names.

**The headline finding: the spec's tier split is wrong, in the safe direction.** The spec expects
`town-page` to catch outer boroughs. On these numbers **every one of the 33 clears the 4-place
`guide` floor**, including the borough the spec names as the likely floor case. Barking and
Dagenham's seven NHLE Grade I/II\* entries alone are four honest places once the two non-visitable
ones are dropped (see §4), and the visitor axis adds a market, a park and a theatre on top.

**Full 33-unit measurement**, sorted by Axis B ascending (`angle4_all33.json`):

| Unit | Axis B | Axis A | Unit | Axis B | Axis A |
|---|---|---|---|---|---|
| Redbridge | 0 † | 13 | Croydon | 15 | 16 |
| Kingston upon Thames | 5 | 14 | Hammersmith and Fulham | 16 | 26 |
| Ealing | 6 | 24 | Wandsworth | 18 | 38 |
| Harrow | 6 | 24 | Newham | 20 | 10 |
| Waltham Forest | 6 | 13 ‡ | Hackney | 21 | 38 |
| Barking and Dagenham | 7 | 7 | Greenwich | 27 | 73 |
| Brent | 7 | 9 | City of London | 32 | 85 § |
| Lewisham | 7 | 30 | Islington | 33 | 44 |
| Enfield | 9 | 26 | Richmond upon Thames | 33 | 40 § |
| Sutton | 9 | 13 | Kensington and Chelsea | 35 | 16 § |
| Bexley | 10 | 15 | Lambeth | 37 | 61 |
| Hillingdon | 11 | 38 | Tower Hamlets | 47 | 59 |
| Merton | 11 | 14 | Southwark | 67 | 33 |
| Havering | 12 | 21 | Camden | 80 | 56 § |
| Haringey | 13 | 27 | Westminster | 192 | 205 § |
| Hounslow | 14 | 61 | | | |
| Barnet | 15 | 35 | | | |
| Bromley | 15 | 31 | | | |

† Redbridge's `Tourist attractions in the London Borough of Redbridge` category contains exactly
one member, `List of public art in the London Borough of Redbridge`, which my noise filter removed;
`Museums in the London Borough of Redbridge` 404s. The 0 is a **category-coverage artefact, not a
finding about Redbridge**. See §4.
‡ Waltham Forest has **no** `Grade I and II* listed buildings in…` article and no
`Grade I listed buildings in the London Borough of Waltham Forest` (404). Only
`Grade II* listed buildings in the London Borough of Waltham Forest` exists: 13 entries. **Waltham
Forest's Grade I count is unestablished by this method.**
§ Grade I only — these units use separate Grade I and Grade II\* articles, so Axis A understates
them relative to boroughs with a combined article. Westminster's true Grade I + II\* is well above
205. **The two axes are not comparable across this footnote boundary**, and an arbitrator should
not rank boroughs on Axis A alone.

**The two axes disagree, sharply, and the disagreement is itself a finding.** Hounslow scores 14
on the visitor axis and **61** on NHLE; Lewisham 7 and **30**; Hillingdon 11 and **38**; Ealing and
Harrow 6 and **24** each. Conversely Newham scores 20 and only **10**, and Southwark 67 against
**33**. The pattern is legible: **outer boroughs carry their content as listed buildings, inner
boroughs as institutions.** A finder briefed only on "museums, galleries, markets, theatres" will
report outer boroughs as empty and be wrong. **The finder brief for outer boroughs must lead with
the National Heritage List, not with attraction lists.** Ealing looks bare until you notice
Pitzhanger Manor; Harrow until Bentley Priory; Lewisham until the Horniman Museum.

---

## 3. The heterogeneity problem, concretely

### 3a. A structural conflict between §Scope and the gate, which must be resolved first

The spec's mitigation (§Scope) is: *"a borough page is expected to use two or three sections that a
reader can navigate by."* The spec's gate (assertion 7) is: *"`guide` is 4+ places with a 100–160
word intro, **2–3 sections one headed exactly 'Getting there'**, and 4–6 FAQ."*

Read literally, a guide has **2–3 sections total, one of which is "Getting there"** — leaving
**one or two** area sections. Southwark cannot be navigated in one or two headings. **This is a
contradiction between the mitigation and the gate that enforces it, and it must be settled before
the gate is written**, not after eleven boroughs have been authored against it.

Recommended resolution: read assertion 7 as **2–3 *content* sections plus a mandatory "Getting
there"**, i.e. 3–4 sections in the file. Everything below assumes that reading and flags where two
would not be enough.

### 3b. Southwark

What one page must actually hold. Measured list, Axis B, 67 entries (`angle4_all33.json`),
including but not limited to: Borough Market, Tate Modern, The View from The Shard, Shakespeare's
Globe, Sam Wanamaker Playhouse, Imperial War Museum, Dulwich Picture Gallery, HMS Belfast, Tower
Bridge, London Bridge, Millennium Bridge, Old Operating Theatre Museum and Herb Garret, Golden
Hinde, Winchester Palace, The Clink, The George Inn, The Anchor Bankside, Oxo Tower, Hay's
Galleria, More London, The Queen's Walk, Brunel Museum, Fashion and Textile Museum, Bermondsey Beer
Mile, Surrey Docks Farm, South London Gallery, Peckham Platform, Theatre Peckham, Menier Chocolate
Factory, The Old Vic, Bridge Theatre, Unicorn Theatre, Southwark Playhouse, Cross Bones, Michael
Faraday Memorial, East Street Market, Mercato Metropolitano, Kirkaldy Testing Museum, Flat Time
House, The Crown and Greyhound, Dulwich Outdoor Gallery, Herne Hill Velodrome, Champion Hill.

These are not one place. They are five, strung along four miles of a borough that is one mile wide.
**Three area sections plus "Getting there":**

1. **"Bankside and Borough"** — Tate Modern, Shakespeare's Globe, Sam Wanamaker Playhouse,
   Millennium Bridge, Oxo Tower, Borough Market, Southwark Cathedral, the Old Operating Theatre,
   Winchester Palace, The Clink, The George Inn, The Anchor, Golden Hinde, Cross Bones, the Shard
   and the View from it, HMS Belfast, Hay's Galleria, Tower Bridge's south approach.
   *This one section is already a full guide's worth. If the gate forces two content sections, this
   is where the split has to be, and "Bankside" and "Borough and London Bridge" become two.*
2. **"Bermondsey and Rotherhithe"** — Fashion and Textile Museum, Bermondsey Street, the Bermondsey
   Beer Mile, Brunel Museum and the Thames Tunnel shaft, Surrey Docks Farm, Rotherhithe's
   riverside.
3. **"Walworth, Peckham and Dulwich"** — Imperial War Museum, East Street Market, Michael Faraday
   Memorial, South London Gallery, Theatre Peckham, Peckham Platform, Dulwich Picture Gallery,
   Dulwich Village, The Crown and Greyhound.
4. **"Getting there"** — mandatory.

The three headings are geographic, not thematic, and each maps to a walk a reader can actually do
in an afternoon. That is the test a section heading should pass: **a section is good if a reader
could spend a day inside it.** Thematic headings ("Museums", "Riverside") fail that test because
they scatter the reader across the borough.

### 3c. An outer borough — Bromley

Bromley (Axis A 31, Axis B 15) is 57.97 sq mi, the largest borough, and its content sits in three
places that have nothing to do with each other:

1. **"Crystal Palace and Beckenham"** — Crystal Palace Park, the Crystal Palace Dinosaurs (Grade I
   listed), Crystal Palace National Sports Centre (Grade II\*), Crystal Palace Bowl, the Bowie
   Bandstand in Croydon Road Recreation Ground, St George's Church Beckenham (Grade II\*).
2. **"Chislehurst and Orpington"** — Chislehurst Caves, Chislehurst Common, Scadbury Park, Crofton
   Roman Villa, the Church of All Saints Orpington (Grade II\*), Camden Place (Grade II\*), High
   Elms Country Park.
3. **"Downe and the Darwin country"** — Down House (Grade I listed, Darwin's home), Downe Bank,
   St Mary's Church Downe (Grade II\*), Keston Windmill (Grade I), Keston Common, Holwood House
   (Grade I), Wickham Court (Grade I).
4. **"Getting there"** — mandatory, and load-bearing here in a way it is not in Southwark: these
   three areas are not walkable from one another and the reader needs to be told so.

**Havering** splits the same way and I record it because the spec names Havering as a risk case:
*"Romford"* (Romford Market, The Liberty, Brookside Theatre, Raphael Park, Havering Museum);
*"Hornchurch, Upminster and Rainham"* (Queen's Theatre Hornchurch, Upminster Windmill, Upminster
Hall, Rainham Hall, Church of St Helen and St Giles Rainham (Grade I), Rainham Marshes);
*"The green edge"* (Havering Country Park, Bedfords Park, Bower House (Grade I), Hainault Forest,
Ingrebourne Valley, Thames Chase); *"Getting there"*.

---

## 4. The thin end

**Plainly: I could not find a borough that fails to reach four honest places.** The spec's risk
paragraph — *"Barking and Dagenham, Havering and Sutton do not carry what Westminster carries"* —
is true but does not imply a `town-page`. Havering measures 21 NHLE entries and Sutton 13/14. The
`town-page` tier may end up with **no occupants**, and the spec should be prepared for that rather
than for a page being padded to fill a tier that was never needed.

The five thinnest on the combined evidence, with what each actually carries:

**Barking and Dagenham — thinnest on both axes (7 / 7).** The full NHLE Grade I and II\* list, with
list entry numbers, from the tabulation article:
- **Eastbury Manor House**, Barking — Grade I, **NHLE 1359303**, 16th century, listed 28 May 1954.
  National Trust; open to visitors.
- *Garden walls of Eastbury Manor House* — Grade I, **NHLE 1064414**. A separate list entry but
  **not a separate visitable place**; do not count it, and do not let the finder count it.
- **Church of St Margaret**, Barking — Grade I, **NHLE 1064408**, 13th century.
- **Church of St Peter and St Paul**, Dagenham — Grade II\*, **NHLE 1359302**, 1688.
- **Eastbrook** public house, Dagenham — Grade II\*, **NHLE 1393600**, built 1937–38, listed 2009.
- **Fire Bell Gate (the Curfew Tower), Barking Abbey** — Grade II\*, **NHLE 1064407**.
- **Valence House** — Grade II\*, **NHLE 1064404**, 13th century; Valence House Museum.
Plus, from the visitor axis: **Barking Market**, **Barking Park**, **The Broadway** (theatre),
**Barking Learning Centre**, **Dagenham Roundhouse**, Mayesbrook Park, Parsloes Park, Becontree
Heath, and **Barking station** (Grade II, **NHLE 1242678**). **That is comfortably eight to ten
honest places — a guide, not a town-page.** The spec's own examples (Eastbury Manor House, Valence
House) are correct and are the two strongest.

**Redbridge — the one I would actually watch.** Axis A 13 (1 Grade I + 12 Grade II\*), and the
visitor categories are effectively empty (no `Museums in…` category at all). But the borough article
names real content: *"Valentines Mansion is a Georgian country house and gardens in the grounds of
Valentines Park, Ilford"*; *"Kenneth More Theatre in Oakfield Road, Ilford opened in 1975"*;
*"Redbridge Museum, which opened in 2000, is situated on the second floor of Redbridge Central
Library, Clements Road, Ilford"*; *"Hainault Forest Country Park, with 300 acres of countryside…";*
*"Claybury Woods and Park"*; *"Roding Valley Park"*; plus the Embassy Cinema, Chadwell Heath (Art
Deco, *"currently the focus of a major restoration project"* — verify status before publishing) and
Wanstead Park / Wanstead Flats, which are part of Epping Forest (see §5). **Six to eight. Clears
four, but Redbridge is the borough where a lazy finder will report nothing.**

**Kingston upon Thames (Axis B 5, Axis A 14).** Kingston Museum, Rose Theatre Kingston, the
Coronation Stone, Chessington World of Adventures, Bentalls. Thin on articles, but Kingston has All
Saints' Church, the Market Place, Kingston Bridge and the riverside, none of which appear in these
categories. **The measurement understates it; a finder will not.**

**Waltham Forest (Axis B 6, Axis A ≥13).** William Morris Gallery, Vestry House Museum, Queen
Elizabeth's Hunting Lodge (Grade II\*), Walthamstow Market (Europe's longest daily street market),
Walthamstow Pumphouse Museum, Walthamstow Wetlands, plus Epping Forest and a share of the Olympic
Park. **Not thin in reality; thin only in Wikipedia's category tree, which lacks a Grade I article
for it entirely.**

**Sutton (Axis B 9, Axis A 13/14 — 1 Grade I + 12 Grade II\*).** Whitehall, Cheam; Honeywood
Museum; Little Holland House; Carshalton House and the Water Tower; Nonsuch Park and Mansion (part
in Epsom & Ewell — a cross-boundary case, see §5); Charles Cryer Theatre; Secombe Theatre. Sutton is
the borough where I am least confident in either axis and where **I could not establish a reliable
count**: several of its named assets (Honeywood, Little Holland House) appear in neither category
set I sampled. Treat Sutton as unmeasured and give it a dedicated finder pass.

**Brent (Axis B 7, Axis A 9)** looks thin on both axes and is not: Wembley Stadium, Wembley Arena,
BAPS Shri Swaminarayan Mandir, Kiln Theatre, Ace Cafe, Kilburn, Neasden Temple. **A borough can be
low on listed buildings and high on landmarks. Axis A alone would have mis-tiered Brent.**

---

## 5. What spans boroughs — the cases an arbitrator must rule on

The spec's gate assertion 14 is *"Marquee institutions in exactly one file."* Every case below is a
place where two boroughs can each make an honest claim, so the assertion forces a ruling rather
than describing one. Ranked by how much damage getting it wrong does.

**Ruled by evidence — VERIFIED, the arbitrator only has to choose:**

1. **Queen Elizabeth Olympic Park — four boroughs, no borough.**
   *"The park occupies an area straddling four east London boroughs; Newham, Tower Hamlets, Hackney
   and Waltham Forest."* Its operator is the **London Legacy Development Corporation**, which the
   boroughs list separately names as one of three active development corporations that are **not**
   boroughs. Inside it: London Stadium, ArcelorMittal Orbit, London Aquatics Centre, Lee Valley
   VeloPark. **This is the single worst case in the programme** — four pages can each claim it and
   none owns it. The ruling must name one home borough (Newham is the conventional answer, Stratford
   being in Newham) and require the other three to reference it without listing it as a place.
   Source: `https://en.wikipedia.org/wiki/Queen_Elizabeth_Olympic_Park`.

2. **Hampstead Heath — Camden and Barnet, governed by the City of London.**
   *"The heath is managed by the City of London Corporation, and lies mostly within the London
   Borough of Camden, with the adjoining Hampstead Heath Extension and Golders Hill Park in the
   London Borough of Barnet."* Kenwood House adjoins it, in Camden. Note the third party: the
   **City of London Corporation** governs land in two boroughs it is not in, which will read oddly
   on the City of London page if not handled. Source:
   `https://en.wikipedia.org/wiki/Hampstead_Heath`.

3. **Epping Forest — two boroughs plus a county, governed by the City of London.**
   *"an area of ancient woodland … which straddles the border between Greater London and Essex …
   stretches from Epping in the north, to Chingford … South of Chingford, the forest narrows and
   becomes a green corridor extending deep into east London, as far as Forest Gate."* Chingford is
   Waltham Forest; Wanstead Park and Wanstead Flats are Redbridge; Forest Gate is Newham. The
   London/Essex straddle is **VERIFIED**; the specific borough split is **INFERRED** from the place
   names in that sentence and should be confirmed. Both thin boroughs in §4 lean on it, which makes
   the ruling consequential for them. Source: `https://en.wikipedia.org/wiki/Epping_Forest`.

4. **The Imperial War Museum — one institution, three boroughs, and the gate will catch it.**
   *"in 1936 it acquired a permanent home at the former Bethlem Royal Hospital in **Southwark**,
   which serves as its headquarters"* — but the infobox address is *"IWM London: Lambeth Road,
   London"*, which reads as Lambeth and is not. Its other London sites: **HMS Belfast**, *"The
   Queen's Walk"* (Southwark), and **Churchill War Rooms**, *"an underground wartime command centre
   in Wes[tminster]"*. So "Imperial War Museum" can legitimately appear on the Southwark page twice
   and the Westminster page once. **Assertion 14 will fail unless the arbitrator rules that IWM
   London, HMS Belfast and Churchill War Rooms are three distinct places with three distinct
   slugs**, and that the umbrella name is never used as a place. Source:
   `https://en.wikipedia.org/wiki/Imperial_War_Museum`.

5. **Regent's Park — Westminster and Camden.**
   *"It occupies … in north-west Inner London, administratively split between the City of
   Westminster and the Borough of Camden."* London Zoo and Regent's University sit inside it.
   Source: `https://en.wikipedia.org/wiki/Regent%27s_Park`.

6. **Kensington Gardens — Westminster and Kensington and Chelsea.**
   *"The gardens are shared by the City of Westminster and the Royal Borough of Kensington and
   Chelsea and sit immediately to the west of Hyde Park."* And: *"Kensington Gardens, Hyde Park,
   Green Park, and St. James's Park together form an almost continuous 'green lung'"* — so the
   reader's mental unit is the green lung, which is not a borough at all. Kensington Palace, the
   Albert Memorial and the Serpentine Galleries sit in or on the edge of this shared ground.
   Source: `https://en.wikipedia.org/wiki/Kensington_Gardens`.

7. **The Royal Parks — one charity, five boroughs.**
   *"They are part of the hereditary possessions of The Crown, now managed by The Royal Parks, a
   charity which manages eight royal parks and certain other areas of parkland in London."* The
   eight distribute across Westminster, Camden, Kensington and Chelsea, Greenwich and Richmond upon
   Thames. Two of the eight are verified as wholly Richmond: **Richmond Park**, *"in the London
   Borough of Richmond upon Thames, is the largest of London's Royal Parks"*, and **Bushy Park**,
   *"in the London Borough of Richmond upon Thames is the second largest"*. **The "eight" is
   VERIFIED; the full borough mapping is INFERRED and a later wave should verify each.** Note that
   Richmond Park's own article assigns it wholly to Richmond despite Kingston Gate; if a finder
   claims any of it for Kingston upon Thames, the arbitrator should refuse on this source.
   Source: `https://en.wikipedia.org/wiki/The_Royal_Parks`.

8. **Crystal Palace — five boroughs, and the sources contradict each other.**
   *"The area has no defined boundaries and **straddles five London boroughs** and three postal
   districts, although there is a Crystal Palace electoral ward and Crystal Palace Park in the
   London Borough of Bromley."* The article's own infobox says `london_borough = Croydon`.
   Crystal Palace Park's infobox says `operator = London Borough of Bromley`. **So the area is
   Croydon, the park is Bromley, and the neighbourhood is five boroughs — three answers from two
   articles.** The five are **not enumerated in the source I read**; Bromley, Croydon, Lambeth,
   Lewisham and Southwark is the conventional set but I am marking it **INFERRED, not verified**.
   The park, the Dinosaurs and the National Sports Centre should all go to Bromley on the operator
   evidence. Sources: `https://en.wikipedia.org/wiki/Crystal_Palace,_London`,
   `https://en.wikipedia.org/wiki/Crystal_Palace_Park`.

9. **Wimbledon — Merton, cleanly, but the brand is not.**
   *"Wimbledon is a suburb of southwest London … it is the main commercial centre of the London
   Borough of Merton … It is home to the Wimbledon Championships and New Wimbledon Theatre, and
   contains Wimbledon Common."* The All England Lawn Tennis and Croquet Club is *"a private members'
   club based at Church Road in the Wimbledon area of London"* — **its own article never names the
   borough**, which is exactly how a finder ends up guessing. Merton also holds the Wimbledon Lawn
   Tennis Museum, Wimbledon Windmill, the Museum of Wimbledon and Southside House. The risk is the
   reverse of the others: not two boroughs claiming it, but **a finder assuming "Wimbledon" is its
   own destination and not filing it under Merton at all.** Wimbledon Common's western edge abuts
   Wandsworth (Putney Vale) — a minor boundary case worth a ruling.
   Sources: `https://en.wikipedia.org/wiki/Wimbledon,_London`,
   `https://en.wikipedia.org/wiki/All_England_Lawn_Tennis_and_Croquet_Club`.

10. **Kew and Hampton Court — both Richmond upon Thames, and this is the borough that will be
    under-served.** **Kew Gardens**: infobox `location = London Borough of Richmond upon Thames`;
    *"a botanic garden in southwest London founded in 1759 … It is one of London's top tourist
    attractions and is a World Heritage Site"*, 2,250,355 visitors in 2025. **Hampton Court
    Palace**: *"a Grade I listed royal palace in the London Borough of Richmond upon Thames"* —
    **not Kingston upon Thames**, despite the postal address and the Kingston Bridge proximity, and
    **not Surrey**. Richmond therefore holds Kew, Hampton Court, Richmond Park, Bushy Park, Ham
    House, Marble Hill, Strawberry Hill and Twickenham. Its Axis B score of 33 badly understates it.
    **The likely error here is a finder giving Hampton Court to Kingston.** Rule it explicitly.
    Sources: `https://en.wikipedia.org/wiki/Kew_Gardens`,
    `https://en.wikipedia.org/wiki/Hampton_Court_Palace`, `https://en.wikipedia.org/wiki/Bushy_Park`.

11. **Tower Bridge — Tower Hamlets and Southwark, and the City owns it.**
    *"It crosses the River Thames close to the Tower of London and is one of five London bridges
    owned and maintained by the City Bridge Foundation, a charitable trust founded in 1282."*
    **Tower Bridge appears in Wikipedia's `Tourist attractions in the London Borough of Southwark`
    category** — VERIFIED by my own scrape — while the Tower of London is Tower Hamlets. So does
    **London Bridge**, and **Millennium Bridge, London** (which lands in the City of London on the
    north bank). **Every Thames bridge is a two-borough object with a third-party owner.** The
    arbitrator should set one rule for all of them rather than adjudicating bridge by bridge.
    Source: `https://en.wikipedia.org/wiki/Tower_Bridge`.

**The two pan-London cases, which cannot be assigned at all:**

12. **The River Thames.** *"Below Teddington Lock … the river is subject to tidal activity from the
    North Sea … The tidal stretch of the river is known as the Tideway."* Teddington Lock is in
    Richmond upon Thames, so **the tidal limit of the Thames — a genuinely notable point — sits in
    one specific borough** and should be claimed there. Governance splits at the same line:
    *"This part of the river is managed by the Port of London Authority"* below the lock; *"The
    non-tidal section of the river is managed by the Environment Agency"* above it. The named
    tributaries give each riparian borough its own anchor: *"the rivers Crane, Brent, Wandle,
    Ravensbourne (the final part of which is called Deptford Creek), Lea (the final part of which is
    called Bow Creek), Roding (Barking Creek), Darent and Ingrebourne"* — Hounslow, Brent,
    Wandsworth, Lewisham, Tower Hamlets/Newham, Barking and Dagenham, Bexley, Havering respectively.
    **Recommended ruling: the Thames is never a place; named riverside things are.** The Thames
    Barrier (Greenwich), Teddington Lock (Richmond), the Thames Path, and every pier need the same
    rule as the bridges. Source: `https://en.wikipedia.org/wiki/River_Thames`.

13. **The Tube and TfL.** Pan-London by construction; the spec already carries a transit-negative
    prose ban and a mandatory "Getting there" section, which together imply transit is *context*,
    not *content*. But the boundary is not clean: **Barking station is Grade II listed, NHLE
    1242678** (verified in the Barking and Dagenham tabulation), and a listed station is a
    designation claim under gate assertion 12. **The ruling needed: may a station be a `place`? I
    recommend yes only where it carries its own NHLE entry, and never otherwise** — which admits
    Barking, and the obvious listed termini, and excludes the other 260-odd.

**Two more the arbitrator should expect, flagged but NOT verified by me:**

14. **Nonsuch Park / Nonsuch Mansion** straddles the Sutton boundary with Epsom and Ewell in
    **Surrey**, i.e. outside Greater London entirely. If true, it is the only case in the programme
    where a place spans the jurisdiction boundary and the `state: "England"` / `county: "London"`
    routing breaks. **I could not verify this in the time available. It matters most for Sutton,
    already the least-measured borough.**
15. **Wembley Stadium and Wembley Arena** are both in Wembley, Brent — the stadium's article says
    only *"an association football stadium in Wembley, London, England"* and **never names the
    borough**, the same failure mode as the All England Club. Low risk of a dispute, high risk of a
    finder leaving Brent's two biggest assets unattributed.
    Source: `https://en.wikipedia.org/wiki/Wembley_Stadium`.

---

## 6. What I could not establish

- **NHLE counts direct from Historic England.** `historicengland.org.uk` 403s to `urllib`. Every
  Axis A number is a Wikipedia transcription of the NHLE, not the register itself. The list entry
  numbers quoted are as good as the transcription; **the totals are floors, not counts**, because
  the tabulations only cover buildings someone has transcribed.
- **Waltham Forest's Grade I listed buildings.** No article exists.
- **Sutton's true yield.** Neither axis captured Honeywood Museum, Little Holland House or
  Carshalton House. Sutton is the one borough I would call genuinely unmeasured.
- **The five boroughs Crystal Palace straddles.** The source asserts "five" and does not list them.
- **The full Royal Parks-to-borough mapping.** Only Richmond Park and Bushy Park are verified.
- **Whether Nonsuch Park crosses the Greater London boundary.**
- **Whether any borough genuinely needs the `town-page` tier.** On my measurements, none does.
