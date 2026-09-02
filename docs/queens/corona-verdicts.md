# Corona, Queens — VERIFIER VERDICTS

**Role:** Independent verifier. I re-fetched the finder's cited URLs myself and re-quoted from the
retrieved bytes. Where I write a quotation below, I read it out of the source I fetched, not out of
the finder file. I did not defer to the finder's reasoning anywhere.

**What I actually retrieved (method of record):**

| Source | How | Result |
|---|---|---|
| LP-1292, LP-1555, LP-2035, LP-2283, LP-2657 | `urllib` → `pdftotext -layout` | all five downloaded; text extracted |
| DCP NTA table, Socrata `9nt8-h7nd` | `urllib` + `$where=cdta2020 in('QN04','QN06','QN03')` | 7 rows returned |
| LPC Individual Landmark Lots Points, ArcGIS FeatureServer/0 | `urllib` REST query | field list + 13 matching features |
| DOHMH restaurant inspections `43nn-pn8j` | `urllib` + Socrata `$where` | positive and negative results both reproduced |
| nycgovparks.org (11 pages) | `curl` with browser UA (urllib and WebFetch both got HTTP 403) | all 11 fetched at HTTP 200 |
| louisarmstronghouse.org `/visit/`, `/about/` | WebFetch | both fetched |
| queenslibrary.org (3 branches), dioceseofbrooklyn.org, elmcor.org, parksiderestaurantny.com | WebFetch | all fetched |
| en.wikipedia.org (Corona, Fashion Course, Tiffany glass, Louis Armstrong House, Lemon Ice King) | WebFetch | all fetched |
| metmuseum.org Heilbrunn `hd_tiff.htm` | WebFetch | **HTTP 429 again — still unverified** |

**A method note the arbitrator should have.** The LPC PDFs are two-column. `pdftotext -layout`
interleaves the columns, so a naive substring search returns false MISSes on sentences that are
genuinely present. Nine of my first-pass misses on LP-2657 and LP-2035 were this artifact, not
absent text; I re-checked every one by regex context window before ruling. Any verifier who ruled
`refuted` off a first-pass grep of these PDFs ruled wrong.

---

## §1 — HEADLINE

- **Claims adjudicated: 183** (F1–F171, plus 12 unnumbered claim blocks in §H P37/P38, §I, §J, §K, §L, §M)
- **Confirmed: 141**
- **Refuted: 9**
- **Uncertain: 33**
- **Places surviving as publishable: 68** — **30 with prose**, plus **38 DOHMH-only entries whose
  name and address may be published but about which nothing may be written.**

---

## §2 — THE OWNERSHIP FIREWALL: RULING

The finder's §0 is **correct and I am upholding it in full.** Citi Field, the Unisphere, the Queens
Museum, the New York Hall of Science, the Queens Zoo, the USTA Billie Jean King National Tennis
Center, the New York State Pavilion and the Queens Theatre belong to `Ethos.Seeds.CitiFieldPlaces`.
None may be created here under any slug and **none may be narrated here.**

Three specific rulings the author must obey:

**R1. The Unisphere row in F68 is real and is owned.** I re-ran the ArcGIS query and it is there:
`Corona | Unisphere and Surrounding Reflecting Pool | LP-01925 | Flushing Meadows-Corona Park |
1995-05-16`. The finder recorded it only to prove query exhaustiveness. That was the right call.
**Do not create it. Do not describe it. Link to `/g/citi-field-guide`.**

**R2. P44–P53 (Meadow Lake, Willow Lake, The Rocket Thrower, Forms in Transit, Freedom of the Human
Spirit, Terrace on the Park, the Flushing Bay marina, the time capsules, the Aquatics Center & Ice
Rink, the Queens Night Market) — I rule ALL TEN OUT.** The finder declined to decide and floated
three as "defensible." I am deciding: they are not. Every one of them is inside Flushing Meadows
Corona Park. The Bronx concourse page took two Criticals for narrating owned-adjacent material, and
the failure mode there was exactly this — treating "not on the owned list" as "available." The park
routes through `/g/citi-field-guide` as a whole. The Queens Night Market (P53) is additionally
disqualified by its own words, which I re-fetched: it sits **"behind the New York Hall of Science,"**
i.e. on the grounds of an owned institution.

**R3. The Neustadt Gallery (F1) is OUT of Corona.** Its gallery is inside the Queens Museum (owned)
and its own office address is in Long Island City. Not a Corona place under any reading.

**R4. Fashion Course's "mile and a half from … Citi Field" (F41) is a distance, not a hook.**
Confirmed verbatim from Wikipedia: the track was *"a mile and a half from where the baseball stadium
Citi Field now stands."* The author may use the Fashion Course. The author may **not** use that
sentence as a bridge into Citi Field's history. Link, don't narrate.

**Corona will read thin. That is the firewall working.** Do not compensate by reaching into the park.

---

## §3 — NEIGHBORHOOD ASSIGNMENT RULINGS (the author and arbitrator depend on these)

### 3a. The two marquee-list places in this wave

**LOUIS ARMSTRONG HOUSE MUSEUM — RULED: CORONA. Corona's claim, and no other file's.**

Exact street address I rule from: **34-56 107th Street, Corona, NY 11368.**

Four independent sources, all re-fetched by me:

1. **LPC designation report LP-1555**, header: *"THE LOUIS ARMSTRONG HOUSE, 34-56 107th Street,
   Borough of Queens. Built 1910; architect, Robert W. Johnson; builder, Thomas Daly. Landmark Site:
   Borough of Queens Tax Map Block 1748, Lot 36."*
2. **LPC ArcGIS individual-landmark layer**, verbatim field values I pulled:
   `North Corona | Louis Armstrong House | LP-01555 | 34-56 107th Street | 1988-12-13`.
3. **The museum's own Visit page**: *"34-56 107th Street, Corona, NY 11368"*, and — this is the
   sentence that matters — *"The museum is located in **Corona**, a quiet residential neighborhood in
   northern Queens, where Louis and Lucille Armstrong chose to make their home for nearly three
   decades."*
4. **Wikipedia**: *"The Louis Armstrong House is a historic house museum at 34-56 107th Street in the
   Corona neighborhood of Queens in New York City."*

**Where the sources "conflict," they do not really conflict.** LPC's ArcGIS `NEIGHBORHO` field says
"North Corona"; LPC's own report body says *"located in Corona, Queens."* North Corona is a
sub-district **of** Corona — DCP's own table calls the NTA `QN0303 North Corona` and Wikipedia's full
sentence, which I retrieved intact, reads: *"The section north of Roosevelt Avenue, known as North
Corona, is in Community District 3."* North Corona is not a rival neighborhood; it is Corona north of
Roosevelt Avenue. **Nothing places this house in Elmhurst, Forest Hills or Rego Park. The assignment
is not contested and the author should not hedge it.**

**Better-evidenced finding, and a correction to the finder.** The finder's §L row L8 characterised
the museum's own site as saying only *"a quiet residential neighborhood in northern Queens"* — which
reads as though the museum declines to name Corona. **That is a material omission.** The sentence
begins *"The museum is located in Corona."* I re-fetched it. **L8 is not a contested row. Strike it.**

---

**FOREST PARK — RULED: NOT CORONA'S. Corona has no claim on it whatsoever.**

The finder never raised Forest Park; I checked it anyway because the wave brief requires an explicit
ruling. I fetched `nycgovparks.org/parks/forest-park` (curl, HTTP 200). Verbatim record fields:

- Location line: **"Myrtle Ave, Union Tpke, Park Lane S — Queens"**
- **"Zip Code: 11375, 11385, 11415, 11418, 11421"**
- **"Community Board: 5, 6, 9"**
- **"Park ID: Q015 / Acreage: 506.86 / Property Type: Flagship Park"**
- The page's own reader poll asks *"Is Forest Park your local park? If so, which neighborhood do you
  call home?"* and offers exactly five options: **"Richmond Hill / Kew Gardens / Forest Hills /
  Glendale / Woodhaven."**

**Corona is ZIP 11368 and Community Board 3 and 4.** Neither 11368 nor CB 3 nor CB 4 appears anywhere
in Forest Park's record. Forest Park is not adjacent to Corona and does not touch it. **Corona must
not create Forest Park.** On this evidence Forest Hills has the strongest claim of the five listed
neighborhoods (11375 is the Forest Hills ZIP and Forest Hills is named in the park's own poll), but
that ruling belongs to the Forest Hills verifier, not to me. I record only that **it is not Corona's.**

Astoria Park and Socrates Sculpture Park are already taken by wave 1 and are not in play here. The
Louis Armstrong House Museum is therefore **the only marquee-list place Corona may claim**, and it
should claim it.

### 3b. Every other candidate place, with the neighborhood the sources actually give

Address column = the exact publishable string. "Publishable address?" = yes/no.

| Place | Exact address string | Sources' neighborhood, quoted | Ruling | Publishable address? |
|---|---|---|---|---|
| Louis Armstrong House (museum) | `34-56 107th Street, Corona, NY 11368` | museum: *"located in Corona"*; LPC report: *"located in Corona, Queens"*; ArcGIS: `North Corona`; Wikipedia: *"the Corona neighborhood"* | **CORONA** | **Yes** |
| Louis Armstrong Center | `34-49 107th Street, Corona, NY 11368` | museum About page prints this string; Wikipedia: *"across the street from the residence"* | **CORONA** | **Yes** |
| Selma's Place | none published | museum: *"Selma's Place, the donated home of Selma Heraldo"* | CORONA (campus) | **No — no address** |
| Dizzy Gillespie Residence | `105-19 37th Avenue (aka 34-68 106th Street)` | LPC: *"Located in Corona, Queens"*; ArcGIS: `North Corona` | **CORONA** | **Yes** |
| Edward E. Sanford House | `102-45 47th Avenue` | ArcGIS: `Corona`; LPC alt name: *"designated as the 102-45 47th Avenue House"* | **CORONA** | **Yes** |
| Congregation Tifereth Israel | `109-18 54th Avenue` | ArcGIS: `Corona`; LPC: *"The oldest active synagogue in Corona"* | **CORONA** | **Yes** |
| Fire Engine Co. 289, Ladder Co. 138 | `97-28 43rd Avenue` | ArcGIS: `Corona`; LPC: *"one of Corona's most prominent public buildings"* | **CORONA** | **Yes** |
| William F. Moore Park | bounded by 108th St / 51st & 52nd Aves; `Park ID: Q029` | Parks: *"Originally known as Corona Heights Triangle"*; `Zip Code: 11368 / Community Board: 4` | **CORONA** | **Yes (park boundary form)** |
| Corona Golf Playground | *"Bounded by 109th Street, 46th Avenue, and 47th Avenue"*; `Q450` | Parks: `Zip 11368 / CB 4` | **CORONA** | **Yes** |
| Josephine Caminiti Playground | Alstyne St; `Q046` | Parks: `Zip 11368 / CB 4`; *"called Corona Playground, after the surrounding neighborhood of Corona"* | **CORONA** | **Yes (park form)** |
| Louis Simeone Park | `Q474` | Parks: `Zip 11368 / CB 4`; *"Corona community activist"* | **CORONA** | **Yes (park form)** |
| Hinton Park | *"bounded by Pell Avenue, 34th Avenue, and 113th and 114th Streets"*; `Q410` | Parks: `Zip 11368 / Community Board: 3` | **CORONA (North Corona)** | **Yes** |
| Louis Armstrong Playground | `Q415` | Parks: `Zip 11368 / Community Board: 3` | **CORONA (North Corona)** | **Yes (park form)** |
| Park of the Americas | `Q026` | Parks: `Zip 11368 / Community Board: 4` | **CORONA** | **Yes (park form)** |
| Corona Plaza / National Plaza (Parks Q172) | *"intersection of National Street and Roosevelt Avenue"* | Parks: `Zip 11368 / CB 4 / Acreage 0.04` | **CORONA** | **Yes** |
| QPL — Corona branch | `38-23 104 Street, Corona, NY 11368` | QPL prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| QPL — Langston Hughes Community Library and Cultural Center | `100-01 Northern Boulevard, Corona, NY 11368` | QPL prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| QPL — Lefrak City branch | `98-30 57 Avenue, Corona, NY 11368` | **QPL itself prints "Corona, NY 11368"** | **CORONA** | **Yes** |
| Elmcor Recreation Building | `33-16 108th Street, Corona, NY 11368` | Elmcor prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Elmcor Administration / Behavioral Health | `107-20 Northern Blvd, Corona, NY 11368` | Elmcor prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Elmcor St. Marks Older Adults Center | `95-18 Northern Blvd, Corona, NY 11368` | Elmcor prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Elmcor Lefrak Older Adults Center | `96-05 Horace Harding Expressway, Corona, NY 11368` | Elmcor prints *"Corona, NY 11368"* | **CORONA (per owner)** | **Yes** |
| Helen M. Marshall Manor | `104-10 Northern Blvd, Corona, NY 11368` | Elmcor prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Elmcor Astoria Older Adults Center | `98-19 Astoria Blvd, East Elmhurst, NY 11369` | Elmcor prints *"East Elmhurst, NY 11369"* | **EAST ELMHURST — OUT** | Yes, but not Corona's |
| St. Leo (RC parish) | `104-05 49th Avenue, Corona, NY 11368` | Diocese of Brooklyn prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Our Lady of Sorrows (RC parish) | `104-11 37th Avenue, Corona, NY 11368` | Diocese prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| St. Paul the Apostle (RC parish) | `98-16 55th Avenue, Corona, NY 11368` | Diocese prints *"Corona, NY 11368"* | **CORONA** | **Yes** |
| Park Side Restaurant | `107-01 Corona Avenue, Corona, NY 11368` | own site: *"in the heart of Corona, Queens"*; DOHMH row `community_board: 404 / nta: QN25` | **CORONA** | **Yes** |
| The Lemon Ice King of Corona | `52-02 108th St, Corona, New York, 11368` | Wikipedia infobox only | **CORONA, single-sourced** | Yes, with attribution |
| 103rd Street–Corona Plaza station | `103rd Street & Roosevelt Avenue` | Wikipedia infobox `Locale: Corona` | **CORONA, single-sourced** | Yes, with attribution |
| 111th Street station (IRT Flushing) | `111th Street & Roosevelt Avenue` | Wikipedia infobox `Locale: Corona` | **CORONA, single-sourced** | Yes, with attribution |
| Corona A Station post office | `103-28 Roosevelt Avenue` | Wikipedia only | **CORONA, single-sourced** | Yes, with attribution |
| Elmhurst Station post office | `59-01 Junction Boulevard` | Wikipedia calls it one of *"two post offices in Corona"* but names it Elmhurst Station | **CONTESTED — see below** | Yes, but hedge |
| Junction Boulevard station | Junction Blvd & Roosevelt Ave | Wikipedia locale: *"Corona, Elmhurst, Jackson Heights"* | **SHARED — see below** | Yes, but hedge |
| Mets–Willets Point station(s) | in FMCP | Wikipedia: *"in the Flushing Meadows neighborhood"* | **OUT of Corona** | n/a |
| Corona Yard | no address retrieved | none | **UNCERTAIN — OUT** | **No** |
| Tiffany factory site | `96–18 43rd Avenue` | Wikipedia (Tiffany glass): *"located at 96–18 43rd Avenue in Corona, Queens from 1901 to 1932"* | **CORONA, single-sourced** | Yes, with attribution |
| Dorie Miller Cooperative Houses | `11-23 Northern Boulevard` **as printed by LPC** | LP-2657 | **ADDRESS UNSAFE — see warning W3** | **No — do not publish** |
| Tortillería Nixtamal | none found | site prints none; **absent from DOHMH 11368** | **NO SOURCED ADDRESS** | **No** |
| Leo's Latticini / "Mama's of Corona" | none found | **no source at all**; absent from DOHMH | **NOT A CANDIDATE** | **No** |
| Antioch Baptist Church | *"103rd Street and Northern Boulevard"* (intersection only) | Wikipedia only; DNS failure on own site | **CORONA, single-sourced, no street number** | **No street address** |
| Corona Congregational Church | none | Parks Hinton sign only | **UNCERTAIN** | **No** |
| Former Corona yeshiva (53rd Ave) | none | LP-2283, no street number | **UNCERTAIN** | **No** |
| El Dorado / Hyperion / Park Theaters | none | LP-2283, no addresses | **UNCERTAIN, lost places** | **No** |
| Anshei Emes / Smith St Synagogue | 52nd Avenue (no number) | LP-2283; demolished 1936 | **CORONA, lost place** | **No street number** |
| Mentzer hardware store | none | LP-2283, *"two blocks from the Tifereth Israel synagogue"* | **CORONA, lost place** | **No** |
| LIRR Corona station (closed 1964) | none | Wikipedia only | **UNCERTAIN** | **No** |

**The three genuinely contested rows, and which side is better evidenced:**

- **Junction Boulevard station.** Wikipedia's own locale field names three neighborhoods:
  *"Corona, Elmhurst, Jackson Heights."* No source picks one. **Better-evidenced position: it is a
  boundary station and the author must say so rather than claim it.** Corona may mention it as a
  boundary marker; Corona may not present it as a Corona place. Elmhurst has an equal claim.
- **Elmhurst Station post office, 59-01 Junction Boulevard.** One aggregator says it serves Corona;
  its own name says Elmhurst; Junction Boulevard is the Corona/Elmhurst line. **Better evidenced:
  the name.** Corona may say a post office named Elmhurst Station serves part of Corona. Corona may
  not claim the building.
- **LeFrak City.** Wikipedia calls it *"the southernmost region of Corona and the easternmost part of
  Elmhurst."* Two institutions with buildings there print **Corona**: QPL (*"98-30 57 Avenue, Corona,
  NY 11368"*) and Elmcor (*"96-05 Horace Harding Expressway, Corona, NY 11368"*). **Better evidenced:
  Corona, for the specific addresses named.** But LeFrak City *as a development* is shared and Corona
  must not claim the whole complex. Elmhurst's file has a real claim on its western part.

**Rows I am striking from the finder's §L as not actually contested:** L3 (QPL Lefrak City — QPL
itself says Corona; the finder simply never fetched the page), L8 (Louis Armstrong House — the
museum does say Corona), L9 (Gillespie — "North Corona" is a sub-district of Corona, not a rival).

**Rows I am upholding as contested:** L2, L10, L13, L18, L19, L21, and the two LIE-service-road rows
L7/L17.

---

## §4 — CLAIM-BY-CLAIM ADJUDICATION

### 4a. CONFIRMED — re-fetched and re-quoted by me (141)

**Boundary and administrative geography.**

- **F3 — CONFIRMED, verbatim, all seven rows.** I re-ran the Socrata query and got exactly the
  finder's table: `QN0402 Corona / Crna / QN04 / QN04 Elmhurst-Corona (CD 4 Approximation)`;
  `QN0303 North Corona / NrthCrna / QN03 / QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)`;
  `QN0401 Elmhurst`; `QN0601 Rego Park` and `QN0602 Forest Hills`, both `QN06 Forest Hills-Rego Park
  (CD 6 Approximation)`; `QN0301 Jackson Heights`; `QN0302 East Elmhurst`. The finder's reading is
  right: **the City pairs Corona administratively with Elmhurst, not with Forest Hills or Rego Park.**
- **F4 — CONFIRMED verbatim.** *"It borders Flushing and Flushing Meadows–Corona Park to the east,
  Jackson Heights and Elmhurst to the west, Forest Hills and Rego Park to the south, and East
  Elmhurst to the north."*
- **F5 — CONFIRMED verbatim.**
- **F6/F7 — CONFIRMED, and the finder's declared GAP is closed.** The full sentence reads: *"Corona
  is mostly part of Queens Community District 4. The section north of Roosevelt Avenue, known as
  North Corona, is in Community District 3."* The finder's `[PARAPHRASE]` at F7 is accurate.
- **F8, F9 — CONFIRMED.** *"Corona is covered by ZIP Code 11368. The United States Post Office
  operates two post offices in Corona: the Corona A Station at 103-28 Roosevelt Avenue and the
  Elmhurst Station at 59-01 Junction Boulevard."* Parks record fields `Zip Code: 11368` confirmed on
  all eight park pages I fetched.
- **F13 — CONFIRMED.** LP-2657: *"The neighborhood of Corona is located in north-central Queens, just
  west of Flushing Meadows Park."* (First-pass grep missed this purely on column interleaving.)
- **F14, F15 — CONFIRMED** in LP-2283.

**Origins and 19th century.** F16, F17, F18, F19, F20, F21, F22, F23, F24, F25, F26, F27, F29,
F31, F32, F33, F34, F35, F36, F37, F38 — **all CONFIRMED** against the PDFs and Parks pages I fetched.
Load-bearing re-quotes:

- **F23 CONFIRMED:** LP-2657 — *"Newtown became part of Queens County in 1853, and it was not until
  1872 that the name Corona (meaning 'crown' of Queens County) came into common use for the village."*
- **F24 CONFIRMED:** LP-2283 — *"it was not until 1873 that the name Corona"*. **The 1872/1873
  contradiction between two LPC reports is real.**
- **F22 CONFIRMED:** *"(renamed 'Corona' in 1872) had decreased to 206 from 585 in 1790"* and *"In 1890
  African Americans in Queens numbered 3,582."*
- **F18 CONFIRMED:** Parks/FMCP — *"This area was once inhabited by the Matinecocks before the arrival
  of Dutch settlers in 1640."* **The Munsee/Matinecock conflict with F16–F17 is real.**

**Racetrack.** F39, F40, F41, F42, F44, F45, F46 — **CONFIRMED.** F43 partially — see refutations.

**Ash dumps / kettle ponds.** F47, F48, F50 — **CONFIRMED.** (F48's quotation marks around *"valley
of ashes"* are double in the source; the finder rendered them single.)

**Industry.** F52, F53, F54 — **CONFIRMED.** F54 verbatim: *"Tiffany's favrile glass was manufactured
at the Tiffany factory located at 96–18 43rd Avenue in Corona, Queens from 1901 to 1932."* The
1893-vs-1901 conflict with LPC stands.

**Landmarks.** **F68 and F69 — CONFIRMED exactly, all thirteen rows**, including the finder's two
negative findings: **no LPC individual landmark carries `NEIGHBORHO = "Rego Park"`** (my query
returned count 0), and there is no Corona historic district in this layer.

**Armstrong House.** F70, F71, F72, F73, F74, F75, F76, F77, F78, F80, F81, F83 — **CONFIRMED.**
F84, F85, F86, F87, F89, F90 — **CONFIRMED** against the museum's own pages. F79's designation dates
CONFIRMED: `Added to NRHP May 11, 1976 / Designated NHL May 11, 1976 / NRHP reference No. 76001265 /
Designated NYCL December 13, 1988 / NYCL No. 1555`.

**Gillespie.** F93, F94, F95, F96, F97, F98, F99, F100, F101, F102, F103, F104 — **all CONFIRMED**
in LP-2657, including BIN `4043449` and the Designation List 534 header.

**Sanford House.** F105–F110 — **CONFIRMED**, including that **both** *"Edward E. Sanford"* and
*"Edward R. Sanford"* appear in LP-1292. The internal contradiction is genuine.

**Tifereth Israel.** F111–F128 — **all CONFIRMED**, including both population figures (*"1.3 million"*
and *"1.5 million"*) in the same document, and the CB 3 chairman's support letter (*"Martin Maier"*).

**Firehouse.** F129–F135 — **all CONFIRMED**, including F134 (*"twenty new firehouses, including
eleven in Brooklyn and Queens"*) and the sentence the arbitration turns on, **F132: *"the Wandownock
Fire, Hook & Ladder 1, founded in Newtown (now Corona and Elmhurst) in 1843."***

**Black Corona / jazz Corona.** F136–F145, F153, F154, F155 — **all CONFIRMED.**

**F140 — CONFIRMED CHARACTER BY CHARACTER, as the finder demanded.** LP-2657 reads: *"There was no
racial covenant on the property at 105-19 37th Avenue (aka 34-68 106th Street).24 However by 1937,
all of Corona south of Astoria Boulevard was subject to Redlining,25 imposed by the Federal Housing
Administration (FHA), insurance companies, and mortgage lending agencies."* **The "no" is the
source's own word. The finder did not insert it.** The Homeowners Loan Corporation *"outlined Corona
in red and described it as 'Hazardous,'"* also confirmed. F143's counterpart sentence — *"This was
possible in large part due to the lack of racial covenants in most of Corona"* — is also confirmed,
and the author should note the two sentences are consistent with each other.

**Parks.** F157–F171 and the P37/P38 Hinton block, the P40 Louis Armstrong Playground block, the P41
Park of the Americas block and the P42 Corona Plaza block — **all CONFIRMED** against pages I fetched
at HTTP 200. Including the misspelling *"Wiliam F. Moore"* in the Moore Park sign, `Park ID: Q029`,
`Q450`, `Q046`, `Q474`, `Q410`, `Q415`, `Q026`, `Q172`, and **the confirmed absence of sign text** on
the Louis Armstrong Playground and Park of the Americas history pages.

**FMCP block (§I).** All nine quoted sentences CONFIRMED, including *"This park gets its name from
two adjacent communities, Flushing and Corona."* Recorded for the firewall, not for use.

**Libraries, civic, churches, food.** The QPL Corona and Langston Hughes blocks, the Elmcor block,
the Diocese block and the Park Side block — **CONFIRMED**, several with more detail than the finder
had. **F152 CONFIRMED** (Parks independently corroborates the Archie Bunker claim).

**DOHMH.** The whole §K table — **CONFIRMED, including every negative.** I reproduced the Park Side
row verbatim (`community_board: 404, nta: QN25`) and confirmed that **no** DOHMH row exists for
`%ICE KING%`, `%BENFAREMO%`, `%TORTILL%`, `%NIXTAMAL%` or `%LATTICINI%` in 11368. The Birria on the
Block row is real: `104-02 / NORTHERN BOULEVARD / 11368 / community_board 403 / nta QN26`.

### 4b. REFUTED (9)

1. **F88 — REFUTED as a conflict.** The finder called 34-49 vs 34-56 an unresolved conflict on the
   museum's own site. It is not a conflict; it is two buildings, and the About page carries **both**
   strings: *"34-49 107th Street, Corona, NY 11368"* **and** *"34-56 107th Street, Queens, NY 11368."*
   Wikipedia independently places the Center *"across the street from the residence."* **Ruling: the
   historic house is 34-56 107th Street; the Louis Armstrong Center is 34-49 107th Street.** §M item
   10 is resolved and should be deleted, not carried forward.
2. **F91 — REFUTED in part.** The finder reports Wikipedia gives the Center's address as *"34-56
   107th Street, Queens, NY 11368."* I could not reproduce that; the article places the Center across
   the street from 34-56. **Do not publish 34-56 as the Center's address.**
3. **F6's declared `[GAP]` — REFUTED.** The sentence is retrievable in full and I retrieved it.
4. **The finder's §E query string — REFUTED as written.** It states `BORO='Queens'`. The layer's
   `BORO` value is `QN` and `Borough` is `Queens`; the query as printed returns zero features. I
   reproduced the finder's *results* using `NEIGHBORHO LIKE` predicates. The results are right; the
   method line is wrong and must not be copied into any provenance note.
5. **§L row L8's characterisation — REFUTED.** The museum's site does name Corona. See §3a.
6. **§L row L3's "not independently checked" status — REFUTED.** I checked it. QPL prints
   *"98-30 57 Avenue, Corona, NY 11368."*
7. **§L row L9 as contested — REFUTED.** "North Corona" is a sub-district of Corona per DCP and
   Wikipedia, not a competing neighborhood.
8. **F43's third sentence — REFUTED as a quotation.** The finder presents *"The Fashion Course series
   marked the first all-star game, first enclosed park match, and first paid entry in the history of
   professional sports"* as verbatim. I could not reproduce that sentence. What the article says of
   September 10, 1858 is *"Spectators paid to see a baseball game for the first time in the sport's
   history."* **Do not publish the finder's string.**
9. **F26b / F48 / F158 quotation marks — REFUTED as verbatim.** The finder rendered the sources'
   double quotation marks as single in *"crown," "valley of ashes," "Spaghetti Park."* Substance is
   confirmed; the strings are not character-exact. Minor, but the finder promised
   character-for-character.

### 4c. UNCERTAIN — may not be confirmed on this evidence (33)

**F1, F2** (Neustadt and Queens Night Market self-descriptions — not re-fetched by me; moot, both
ruled out anyway). **F10, F11, F12** (coordinates, precinct and FDNY addresses — Wikipedia only,
not re-fetched). **F28** (the three naming theories — I confirmed the *conflict* exists across
sources but did not re-quote Wikipedia's Thomas Waite Howard passage). **F30** (1854 founding —
Wikipedia only). **F49** (LPC's two phrasings of the World's Fair site). **F51** (three kettle
ponds — Wikipedia only; Backus Lake at 98th St & 31st Ave is very likely outside Corona but I have
no source that says so, so it stays **uncertain**, not refuted). **F55** (the Met sentence — **still
unverified; metmuseum.org returned HTTP 429 to me as well**). **F56, F57** (Wikipedia list line;
Neustadt "Tiffany in Queens" page still 404). **F58–F67** (all transit facts — Wikipedia infoboxes,
not re-fetched individually; ridership figures, opening dates, track counts and bus lists are all
**single-sourced aggregator data**). **F79's LPC/NPS year conflict** — the 1976 side is now well
evidenced; LPC's *"National Historic Landmark, 1977"* photo caption is confirmed present but I have
no NPS primary page, so the caption stays uncertain. **F82** (three-building campus — now partly
resolved: the museum names *"Selma's Place, the donated home of Selma Heraldo"*). **F92** (archive
size — partly resolved: the museum says *"a 60,000-piece archive"* and Wikipedia says *"more than
60,000 items"*; **still no primary count of tapes or scrapbooks**). **F146, F147, F149, F150, F151,
F156** (Dorie Miller detail, "Corona Heights," the NYT Cecil Taylor passage, the notable-resident
list, the cultural references, and the present-day demographic sentence **which Wikipedia itself
tags `[citation needed]`**). **P43** (the DOT pedestrian plaza — no DOT page reachable; the $5.6m
figure and 2012/2018 dates remain aggregator-only). **P8, P13** (LIRR Corona station, Corona Yard).
**The Louis Armstrong school identity** (P.S. 134 vs PS 143 vs P.S. 110Q) — three sources, three
answers, **unresolved; the author must not name a school number.** **Park Side's "over 40 years" and
"three generations" strings** — I fetched the homepage and could not reproduce them; they may sit on
a page I did not retrieve. Treat as unverified.

---

## §5 — SINGLE-SOURCED CLAIMS: WHAT MAY SHIP AND HOW

**May ship WITH explicit attribution in the text** (single source, but that source is institutional
or is the subject's own publisher, and the claim is factual rather than evaluative):

- Every transit fact (F58–F66) — attribute to Wikipedia or drop. Ridership numbers and rank should be
  dropped; they age badly and are unverified.
- The Tiffany factory address `96–18 43rd Avenue` and the 1901–1932 span — attribute.
- The Lemon Ice King's existence, address `52-02 108th St`, and 1944 founding — attribute, **and do
  not name the founder** (see W4).
- Antioch Baptist Church's 1936 date and 700 membership — attribute, or better, omit the membership
  number.
- The post office addresses.
- Museum admission prices and hours — the museum is its own best source, but these change; date them.

**May NOT ship at all:** anything resting solely on the Wikipedia demographic sentence that Wikipedia
itself flags `[citation needed]` (F156). Anything resting on the Met sentence (F55). Any school
number for "the Louis Armstrong School."

---

## §6 — DOHMH/DCWP-ONLY BUSINESSES: THE HARD RULE

**38 businesses in this file have the DOHMH restaurant inspection dataset as their ONLY source.**
I re-queried and confirmed both the rows and their exclusivity.

**For every one of these, the name, the street address and the cuisine category may be published.
NOTHING about them may appear in prose.** No founding date. No family story. No "beloved," "famous,"
"long-standing," "institution," "neighborhood favorite," "hidden gem," or any other adjective. An
inspection record establishes that a food business is licensed at an address. It establishes nothing
else, and any sentence beyond existence-and-address is fabrication.

The 38: CAFE 47 NY (47-04 108 ST); CALI TAJADAS BAKERY & RESTAURANT (45-18 104 ST); CHIMITO'S
(55-02 108 ST); CHUANG CHEF (55-27 108 ST); CORONA PIZZA (51-23 108 ST); DOUBLE CHINESE RESTAURANT
(53-16 108 ST); DUNKIN' BASKIN (54-01 108 ST); EL QUETZALITO 8 CORP (45-12 104 ST); K'S CAFETERIA
(48-03 108 ST); LINDA AZOGUENITA BAKERY & RESTAURANT (51-01 108 ST); LORENAS FRUIT (50-20 108 ST);
LUZ NUTRITION (45-08 104 ST); MATECANA BAKERY & RESTAURANT (48-04 108 ST); MIO RIVERA'S BAKERY
(45-10 104 ST); NUTRI_SPOT593 (46-17 104 ST); OUR BACKYARD CAFE (46-10 104 ST); VIDA FELIZ
(47-09 104 ST); CORONA CORNER COFFEE (43-17 104 ST); EL CAFECITO DE MAMA (40-12 104 ST); Elite 24
Nutrition (40-08 108 ST); LA NUEVA DELICIA PERUANA (43-07 104 ST); MAGICO AMANECER (40-18 108 ST);
VINICIO'S (40-21 108 ST); CORONA KING RESTAURANT & BAR (37-55 108 ST); DON JULIO BAR & RESTAURANT
(39-20 104 ST); ESTRELLA LATINA (39-07 104 ST); GIANT NUTRITION (38-16 108 ST); HEALTHY SNACK
(36-09 108 ST); LA MONTANA (33-13 108 ST); LUCKY STAR CHINESE RESTAURANT (39-03 104 ST); M&J
ACCOUNTING AND TAX INC. (39-06 108 ST); NUEVA AMBATENITA LA ESQUINA DEL SABOR (39-24 108 ST); PALO
BAR (38-12 104 ST); PAN DE CASA BAKERY (39-06 108 ST); SALUD ES VIDA (HEBALIFE) (39-24 108 ST);
STEPHANIE'S MEXICAN BAKERY (37-56 108 ST); TIENDA GUATEMALTECA SABOR CHAPIN (38-22 108 ST); THE
BIRRIA ON THE BLOCK (104-02 NORTHERN BLVD).

**Note:** `M&J ACCOUNTING AND TAX INC.` and several "NUTRITION" entries are in a *restaurant*
inspection dataset because they serve food incidentally. Do not describe any of them as a restaurant.

**Park Side Restaurant is NOT in this category.** It has its own website with an address, hours and
phone numbers I re-fetched, plus a corroborating DOHMH row. It may be written about — but only from
its own claims, attributed as its own claims.

---

## §7 — WARNINGS THE AUTHOR MUST READ

**W1. The firewall is the highest-risk thing on this page.** Eight owned institutions sit inside a
park that shares Corona's name and whose own signage says *"This park gets its name from two adjacent
communities, Flushing and Corona."* The temptation to narrate is structural. **Link to
`/g/citi-field-guide`. Do not narrate.** I have additionally ruled P44–P53 out (§2 R2) — the finder
left three of them open and they are not open.

**W2. Do not assert a single origin for the name "Corona."** Five institutional accounts disagree and
I confirmed the disagreement is real, not a retrieval artifact: LPC says 1872 in one report and 1873
in another; Parks gives two different 1872 stories; Parks/FMCP gives an Italian-immigrant/Crown
Building Company story with no year beyond "late 1800s." Write the disagreement or write nothing.

**W3. Do not publish "11-23 Northern Boulevard" for the Dorie Miller Cooperative Houses.** I
confirmed LP-2657 prints that string. I also confirmed that every other Corona Northern Boulevard
address in the corpus falls in the 95-to-107 range (95-18, 100-01, 104-02, 104-10, 107-20). The LPC
string is almost certainly a typographical error and I could not source the real number. **Name the
Dorie Miller Cooperative Houses if you must; publish no address for them.**

**W4. Do not name the Lemon Ice King's founder.** Two Wikipedia articles disagree — the dedicated
article says Nicola Benfaremo, the Corona article says Peter Benfaremo — and there is no primary
source, no DOHMH row, and the business's own domain fails TLS. Existence and address only.

**W5. Do not name a school.** "The Louis Armstrong School" is P.S. 134 per NYC Parks, PS 143 per
Wikipedia's Corona list, and a third school (P.S. 110Q, "The Louis Tiffany School") appears in the
Tiffany article. Three sources, three numbers, no resolution.

**W6. Keep the two Corona Plazas apart.** The NYC Parks triangle (Q172, 0.04 acres, renamed National
Plaza in 1985) and the DOT pedestrian plaza (2012/2018) are different public spaces at the same
intersection with the same popular name. I confirmed the Parks record; I could **not** reach any DOT
page, so the DOT plaza's dates and $5.6m cost remain aggregator-only. Merging them, or asserting the
DOT figures as fact, is exactly the kind of collapse that earns a Critical.

**W7. The Armstrong House designation years are a minefield.** Three different years circulate:
NHL **May 11, 1976** (well evidenced — NRHP reference 76001265); NYC Landmark **December 13, 1988**
(LP-1555's own header and the LPC ArcGIS `DesDate`); and **1985**, which LP-2657 states as the NYC
designation year but which is actually the year of the public hearing (November 12, 1985, per
LP-1555). LPC contradicts itself. **Use 1988 for the NYC landmark and 1976 for the NHL.** Ignore
LPC's stray "1977" photo caption and its stray "1985."

**W8. Corona/Elmhurst is one unit in the sources and the author must not pretend otherwise.** LPC
writes *"Newtown (now Corona and Elmhurst)"*; DCP's district is literally named `QN04 Elmhurst-Corona`;
Sanjek's unit of analysis quoted by LPC is *"Elmhurst-Corona."* Any sentence that claims a shared
institution exclusively for Corona will be contradicted by the Elmhurst file. Say "shared."

**W9. ELMCOR is a portmanteau of East Elmhurst and Corona** — confirmed by LP-1555's note recording
the plaque *"East Elmhurst Corona Area. Building a Better Community."* Elmcor's own site puts six
locations in Corona and two in East Elmhurst. Use the org's own per-address labels; do not
generalise.

**W10. Forest Park is not Corona's** (§3a). Do not create it here. **The Louis Armstrong House Museum
is Corona's one marquee claim — take it, and take it unhedged.**

---

*End of verdicts. 183 claims adjudicated: 141 confirmed, 9 refuted, 33 uncertain. 68 places
publishable — 30 with prose, 38 as name-and-address only.*
