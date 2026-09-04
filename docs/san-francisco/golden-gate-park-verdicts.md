# Golden Gate Park — verdicts

Adjudicated against `docs/san-francisco/golden-gate-park-finder.md`.
I re-fetched eleven sources, not the five required, and every designation identifier
the finder claimed. Rulings below are binding on the author.

**Counts: 88 PUBLISH · 54 REWRITE · 6 DROP · 29 ESCALATED.**
**Tier: GUIDE, on 92 surviving places (floor of 72 if every straddler lands elsewhere).**
**Designation identifiers: 13 claimed, 13 survived re-fetching. Zero wrong numbers.**

---

## 1. What I re-fetched, and what it said

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks | **10/10 numbers confirmed** on APN 1700001; names, addresses and years exact, including the dataset's own misspelling "Frances Scott Key Monument" |
| `97yj-54sx`, the two warning rows | **Confirmed.** "Stow Lake Boathouse" and "Kezar Stadium" carry `landmarkno` `0`, `yeardesignated` `0.0`, no APN, no document. Neither is designated |
| NPS `nrhp_locations` layers 0 and 1 | **3/3 reference numbers confirmed**, all `STATUS: Listed`. Field is `NRIS_Refnum`, not `REFNUM` |
| `LM249.pdf` (full packet, 186k chars) | **The designation is real.** Ordinance File No. **051590**, "designating a portion of Lot 1 in Assessor's Block 1700 (Golden Gate Park), the Music Concourse, as Landmark No. 249", passed on first reading **22 November 2005** |
| `04001137_text` nomination PDF, 2.1 MB | Downloaded and text-extracted. **154 of 162 finder quotations confirmed verbatim**; 6 of the 8 misses are OCR hyphenation only. The two real ones are below |
| `gtr9-ntp6` Rec & Park | Seven GGP sections, **acreages exact to eight decimals**, all `501 Stanyan St`, `psa` GGP. Section 1 `mons` = "Golden Gate Park, Panhandle"; Section 6 dual-coded Outer Richmond |
| `m22e-6hkz` districts | objectid 158 `nr`=Listed `cr`=Listed `a10`=**No**, `dateadop` 2004-10-15; objectid 18 `cr`=Eligible; 147/119/120 all neighborhood "Haight Ashbury" |
| `knm6-5ej6` Article 10 landmark districts | 20 rows. **No Golden Gate Park district.** The park has individual landmarks and no Article 10 district |
| `ajp5-b2md` analysis neighborhoods | **"Golden Gate Park" is one of the City's 41 analysis neighborhoods.** There is no "Panhandle" neighborhood. The zone is validated |
| `r7bn-7v9c` Civic Art | **44/44 accession numbers exist.** Values checked one by one; four the finder mis-transcribed, one new conflict, one renaming the finder said was unsourced |
| `3psu-pn9h` street centerlines | **`STOW LAKE DR`, active, nhood Golden Gate Park. No `BLUE HERON LAKE DR` exists.** Decisive — see §4 |
| `calacademy.org` | Address, hours and five venue names verbatim; both superlatives present; finder missed Thursday NightLife and two measurements |
| `japaneseteagardensf.com` | Address and both seasonal hour ranges verbatim, gate times included |
| `beachchalet.com` / `parkchalet.com` | Addresses and every hour range verbatim; **two claims the finder missed** — see §3 |
| `sfmyc.org` | "Established in 1898" and the oldest-organisation superlative both present; finder ruled both out correctly |
| `gggp.org` | All three superlatives and the 55-acre / 8,000-plant figures confirmed. **Hours and addresses are NOT on the page** the finder cited |
| `blueheronboathouse.com` | Address and menu range verbatim; **"In operation since 1893"** present and unflagged by the finder |
| `stowlakeboathouse.com` | **Returns HTTP 403, not a 301.** The finder's "strong evidence" does not reproduce |
| `famsf.org` | HTTP 403 for me too. The de Young architect gap **stands** |
| `nationalaidsmemorial.org` | Tracking pixel only, for me too. The federal designation **stays unsourced** |
| a guessed `sfrecpark.org` facility URL | Returned **Glen Canyon Park**. The finder's W5 warning is correct and I repeated the mistake to prove it |

### Every identifier, re-verified

| Property | Identifier | Verified value |
|---|---|---|
| Golden Gate Park (district) | NRHP **04001137** | Listed, certified **10/15/2004**; 37 C bldg, 36 C obj, 47 C site, 13 C stru |
| Golden Gate Park Conservatory | NRHP **71000184** | building, Listed, certified **10/14/1971** |
| Beach Chalet | NRHP **81000172** | building, "1000 Great Hwy.", Listed, certified **07/22/1981** |
| Golden Gate Conservatory | SF Landmark **50** | John F. Kennedy Drive, 1972, APN 1700001 |
| Frances Scott Key Monument | SF Landmark **96** | "0 N.E. End Concourse", 1977 |
| Sharon Building | SF Landmark **124** | Golden Gate Park, 1981 |
| Dutch Windmill (North Windmill) | SF Landmark **147** | Golden Gate Park, 1981 |
| McLaren Lodge | SF Landmark **175** | Golden Gate Park, 1984 |
| Beach Chalet | SF Landmark **179** | 1000 Great Highway, 1985 |
| Lawn Bowling Clubhouse and Greens | SF Landmark **181** | Golden Gate Park, 1986 |
| Park Emergency Hospital | SF Landmark **201** | 811 Stanyan Street, 1991 |
| Murphy Windmill and Millwright's Cottage | SF Landmark **210** | M.L. King Drive & Golden Gate Park, 2000 |
| Music Concourse | SF Landmark **249** | 2005, Ordinance File No. 051590 |

**The finder got every number right.** That is the first zone in this wave where nothing
in the citation table had to be corrected. The errors are all elsewhere.

### The ASCE question the finder asked

The finder asked whether *"National Historic Civil Engineering Landmark, designated 1969"*
satisfies register-plus-identifier with a year and no number. **It does. PUBLISH.**
The register is named, ASCE issues no numbers, and the nomination carries the designation
twice — once in the narrative and once as a standing entry in its own resource inventory
table. Write it as the nomination has it and attach no number.

---

## 2. The two real quotation failures

**Kezar Pavilion, candidate 53.** The nomination as scanned reads
*"designed by Masten, Bangs, **Kurd**, and Chace"*. The finder wrote **Hurd**. I cannot
establish which is the firm's real name from the document, and a wrong architect reads as
citable exactly the way a wrong landmark number does. **REWRITE: drop the firm name.**
Write: *"Kezar Pavilion is a gymnasium building of 1926 with seats for four thousand, in
the Spanish Mission style, of cast concrete walls with steel framing and a tile roof.
Willis Polk was also involved in the design. The building fronts on Stanyan Street."*

**Senior Center, candidate 114.** The finder wrote *"one of only three park buildings that
face outward rather than inward."* The nomination's actual sentence is
*"The Senior Center is the **only** building in the park, other than the Beach Chalet and
the Park Emergency Aid Station, that is…"* — an only-construction repackaged as a count.
It is the same claim wearing a hat. **DROP the claim.** The 1932 build, the 1965 conversion,
the scored concrete with cast stone quoins, the glazed tile roof and the semicircular
driveway to Fulton Street all publish.

---

## 3. What the finder missed

**Six things, in descending order of how much they would have cost.**

1. **`STOW LAKE DR` is a live street in the City's own centerline layer and
   `BLUE HERON LAKE DR` does not exist in it.** See §4 — this reverses the finder's
   recommendation.
2. **"In operation since 1893"** is on `blueheronboathouse.com`. That is a trading-duration
   claim from the operator's own site. It does not publish. The finder attributed 1893 to
   the nomination, which is legitimate as a *construction* date, and then failed to notice
   the same year making an illegitimate claim on the business's own page.
3. **"SINCE 1996"** and **"A San Francisco landmark"** are both on `beachchalet.com`.
   The first is a trading-duration claim; the second is a bare designation claim with no
   register and no number. **Both DROP.** LM 179 and NRHP 81000172 cover the building.
4. **Robin Williams Meadow is sourced, in a dataset the finder already had.**
   `r7bn-7v9c` accession **1939.1**, the Sarah B. Cooper Memorial, carries
   `location_description` = *"Sharon Meadow Picnic Area now Robin Williams Meadow;
   Near Koret Playground"*, `data_as_of` 2024-04-17. The finder wrote "No source captured
   for the new name — do not use it without one." The source was in hand. **Write Robin
   Williams Meadow.** No renaming date is available, so give none.
5. **A ninth year conflict.** `r7bn-7v9c` **1914.2.a-b** gives the Verdi monument
   `creation_date` **"ca. 1913"**, not 1914. The finder's W3 list has ten entries and
   should have eleven. **Drop the Verdi year.**
6. **`04001137` contradicts itself on the tennis courts.** The resource description says
   *"Eight tennis courts were originally installed in 1901"*; the historical narrative says
   the Recreation Grounds were added in 1893 *"followed by the tennis courts in 1894."*
   Same document, two dates. **Write neither.**

**Four Civic Art transcriptions to correct:** the Brown Gate pair are recorded as
**Bear** (1908.3.a) and **Lion** (1908.3.b), not "bear and cougar"; Cervantes' sculptor is
recorded **"Mora, Joseph Jacinto"**; the Cider Press sculptor is **"Shields-Clarke, Thomas"**;
the gladiator is **"Leonitus (Roman Gladiator)"** by **"Geefs, Guillaumo"**. The Haring is
dated **"2001 (Fabricated in 1989)"** in one field, not two. The stupa's title is
**"Unknown [Granite stupa]"** and the row carries no gift attribution — **drop the
"Gift from Gumps" line**, which I could not find in the record.

**Three things the finder under-sold, which the author may use:**
Thursday NightLife at the Academy, *"6–10 p.m."*, 21+; the Steinhart's
*"212,000-gallon living coral reef"* and *"over 1,000 animal species"* (measurements, both
publish, both sit inside sentences the finder correctly stripped); and the fact that the
LM 249 ordinance draws its landmark boundary to include *"the three reconstructed
pedestrian tunnels"* — which resolves candidate 14 from "current state unverified" to a
sourced feature of a designated landmark.

---

## 4. S7 RESOLVED: the lake is Stow Lake

The finder called the boathouse's 301 redirect *"strong evidence the lake and its drive
were officially renamed."* It is not evidence, and it is not a 301.

- `stowlakeboathouse.com` returns **HTTP 403** to a direct request, on both schemes.
  The redirect the finder saw does not reproduce.
- The City's active street centerline layer `3psu-pn9h` carries **`STOW LAKE DR`**,
  `active` true, nhood Golden Gate Park. A query for `BLUE HERON LAKE` returns **nothing**.
- `gtr9-ntp6` has no Blue Heron row of any kind.
- `r7bn-7v9c` accession **1914.1** (Pioneer Mother) gives the intersection as
  **"Stowe Lake Drive & John F. Kennedy Drive"**.
- The nomination and the Article 10 dataset both say Stow Lake.
- The boathouse's own image captions still say Stow Lake.

Against all that, one operator's contact block reading "50 Blue Heron Lake Dr" is a single
unsupported string. **RULING: write Stow Lake and Stow Lake Boathouse. Do not write
"Blue Heron Lake", "Blue Heron Boathouse" or the address "50 Blue Heron Lake Dr".**
Give the boathouse no address; the nomination places it at the north part of the lake.
The boat rental and the café's range of goods publish as what the business sells.
Strip *"the largest lake in Golden Gate Park"* and *"the largest bedrock hill in the park"*;
keep 12.7 acres, 1893, and the ten-inch clay with three-inch rolled crushed rock.

Hellman Hollow gets the opposite ruling for the same reason: no Rec & Park row, no Civic
Art row, nothing. **Write Speedway Meadow.**

---

## 5. DROP — 6

| # | Candidate | Reason |
|---|---|---|
| 27 | Francis Scott Key Monument | Present state unverified and unverifiable here. `r7bn-7v9c` says "Public Display" as of 2024-04-17, which is a dataset row, not a standing statue. **LM 96 is real; what is unproven is that there is anything there.** Do not write it as present |
| 29 | Padre Junípero Serra Monument | Identical, without even a landmark number to fall back on |
| 54 | Park Emergency Hospital | **Already shipped** as `park-emergency-hospital-haight-ashbury` in `priv/seed_data/san_francisco/haight-ashbury.json`, at 811 Stanyan Street, with LM 201 already cited there. Taking it puts one building in two seed files |
| 142 | The Panhandle | See S1 below |
| 143 | William McKinley Monument | See S1 below |
| 144 | Panhandle playground | See S1 below |

Claims dropped inside surviving candidates, not counted above: the de Young's present
architect and 2005 opening; the AIDS Grove's federal designation and acreage; the Model
Yacht Club's 1898; the Beach Chalet restaurant's 1996 and its bare landmark claim; the
boathouse's 1893 trading claim; the Children's Quarter first-in-the-nation claim; the lawn
bowling green's *"reportedly, the first public lawn bowling green in the United States"*
(hedged, and unlike the Alvord bridge it has no independent designation behind it); the
Verdi crowd figure; Queen Wilhelmina's *"reportedly visited"*; the golf course *"well
hidden within the trees"*; the tennis clubhouse "probably gone"; the McQueens plant's
*"the first secondary water treatment plant"*; and every superlative in W6, including the
one that will be rediscovered because it also sits in `m22e-6hkz` objectid 158's
`pimdescription_12` — *"the first application of Olmsted park design priciples in the
western United States"*, typo and all.

---

## 6. REWRITE — 54, with replacement wording

**Zone-critical**

- **52 Kezar Stadium.** The finder's address, 670 Stanyan Street, comes from a Wikipedia
  infobox and is wrong. `r7bn-7v9c` **1991.3.a-l** gives **670 Kezar Drive**, with
  `analysis_neighborhood` "Golden Gate Park". Write **670 Kezar Drive**. Do not call it a
  landmark. Write: *"Kezar Stadium stands at 670 Kezar Drive. The first stadium on the site
  was built in 1924 on the ground of the former park nursery and was expanded in 1928 to a
  seating capacity of 65,000. It was home of the San Francisco Forty-niners until 1969.
  The concrete stands were demolished in 1989 and the stadium was rebuilt in 1990. The gates
  are by Alan Fleming, galvanized metal, each 138 inches high."*
- **93, 95 Stow Lake and Stow Lake Boathouse.** Per §4.
- **108 Speedway Meadow.** Per §4.
- **46 Robin Williams Meadow.** Per §3. Write: *"Robin Williams Meadow, which the
  nomination records as Sharon Meadow, is a bowl-shaped meadow of about 1880 below the
  Sharon Building."*
- **60 Brown Gate.** Write **Bear** and **Lion**, both M. Earl Cummings, bronze on
  sandstone, 1908, gift of Suzanna Brown, at 8th Avenue and Fulton Street, northeast and
  northwest corners. The road was widened in 1948 and the gateway moved several feet apart.
- **130 Millwright's House.** The Article 10 record names the landmark *"Murphy Windmill
  and Millwright's Cottage"*. Cite the landmark by that name and describe the building as
  the nomination does: two storeys, brick, slate shingle roof, designed by the Reid Brothers.

**Year and attribution conflicts — drop the year, keep everything else**

18 U.S. Grant (1896 / ca. 1908) · 19 Sundial (1907 / 1905) · 20 Roman Gladiator
(1884 / 1881) · 21 Lion (1906 / 1898) · 24 Verdi (1914 / ca. 1913, newly found) ·
26 Cider Press (1894 / 1892) · 77 Ball Thrower (1891 / 1889) · 78 Robert Burns (1908 / 1906)
· 81 Doughboy (1930 / 1928) · 75 John McLaren statue (1911 work, 1944 placement / ca. 1944).
**10 Rideout Fountain** loses both year and material (1924 cast stone / 1923 granite);
keep *"a saber-toothed tiger in combat with a cobra-headed serpent"*, by M. Earl Cummings,
the bequest of Corinne Rideout. **23 Beethoven** loses its sculptor (Henry Baerer /
Anonymous); keep 1915, the gift of the Beethoven Maennerchor of New York, and the
dedication of 15 August 1915. **25 Goethe and Schiller** keeps 1901 from the nomination
and the sculptor Ernst Rietschel.

**Superlative strips, otherwise intact**

4 Academy of Sciences · 7 Japanese Tea Garden · 35 Conservatory of Flowers (three, one of
them the nomination's own *"remains its most significant"*) · 41 Tree Fern Dell ·
42 Children's Quarter · 28 Pershing · 63 lawn bowling · 94 Strawberry Hill · 101 Polo Field
(keep the Reid brothers, the 200-foot experimental section, the 10-foot berm, the 17-acre
field, eighteen sections of stands north and six south) · 113 Model Yacht Club ·
129 Murphy Windmill (keep 95 feet, the 114-foot span, 40,000 gallons per hour) ·
145 the forest · 147 Hall and McLaren.

**Present-tense claims from a 2004 document — write the date, not the present**

- **62 Tennis courts.** *"Eight tennis courts were installed in 1901. As of 1935 there were
  twenty-one."* Stop there. No present tense, no tennis centre, no clubhouse speculation.
  The nomination's own 1894 date for the courts contradicts its 1901 one; write neither as
  the founding year.
- **69 Casino Meadow.** Drop *"now hosts the annual Shakespeare in the Park festival"*.
- **141 46th Avenue playground.** Drop the lifeboat.
- **14 Music Concourse tunnels.** Rescued. Write: *"Three pedestrian tunnels run under the
  concourse; the ordinance designating San Francisco Landmark No. 249 draws the landmark
  boundary to include them."*
- **3 de Young Museum.** Keep the address, 50 Hagiwara Tea Garden Drive. Write the
  predecessor building only — 1894 Midwinter Fair Fine Arts building, 1919 rebuilding,
  central section and tower 1921, west wing 1925, original demolished 1929, Brundidge wing
  1965, demolished 2003. **No architect and no opening year for the present building.**
  Give no hours.
- **5, 6 Steinhart Aquarium and Morrison Planetarium.** Fold into the Academy as named
  venues. Not separate places. The Walters reliefs of 1923 belong in the Academy's prose.
- **35 Conservatory of Flowers.** Drop the West Gallery closure — a live-state claim from a
  page whose content I could not re-confirm.
- **71 AIDS Memorial Grove.** Keep the de Laveaga Dell history, 1902, the rockery cascade,
  the Deer Glen, the 1991 volunteer group. Nothing federal, no acreage.
- **125 Urban Forestry Center.** Drop the first-plant claim. It is a maintenance site of the
  1980s on the ground of the McQueens water treatment plant of about 1935.

**Small corrections:** 16 Cervantes' sculptor · 33 Haring's date field · 45 drop
*"(some records say 1912)"* · 49 the Koret animals are recorded as *"Untitled [group of
animals]"* by Vicki Saulls · 53 Kezar Pavilion per §2 · 92 the stupa per §3 ·
114 Senior Center per §2 · 128 Queen Wilhelmina · 133 Beach Chalet restaurant per §3 ·
135 Amundsen, drop *"almost mythical"* · 139 golf course.

---

## 7. Straddlers escalated — 29

**S1. The Panhandle, candidates 142–144. I rule DROP and escalate.**
The finder framed this as a two-way question between the park and Haight-Ashbury. It is a
four-way one. The National Register boundary includes the strip. Rec & Park Section 1's
`mons_neighborhood` reads "Golden Gate Park, Panhandle". SF Planning's survey puts the
Panhandle Historic District in **Haight Ashbury**. And `r7bn-7v9c` assigns the McKinley
Monument — the one substantial object on the strip, at Fell and Baker — to
`analysis_neighborhood` **"Lone Mountain/USF"**. There is no Panhandle analysis
neighborhood. Four registers, three answers, and the strip is physically detached from the
park's rectangle. A page that claims it is claiming ground three City layers put elsewhere.
Leave it unclaimed unless the arbitrator says otherwise.

**S2. Park Emergency Hospital, candidate 54. Escalated and dropped.** Shipped. §5.

**S3. The rest of Kezar, candidates 52, 53, 55. I rule KEEP.**
`r7bn-7v9c` puts the Kezar Stadium Gates at 670 Kezar Drive with `analysis_neighborhood`
**"Golden Gate Park"**, and Haight-Ashbury shipped without them. The park takes them.
Do not carry over the nomination's *"separated from the rest of the park by the busy Kezar
Drive… have little relationship to the rest of the park"* — that is orientation by
impression. The named street may be written; "busy" may not.

**S4. The Ocean Beach edge, candidates 127–137 and 140. Twelve escalated. I recommend KEEP.**
Ocean Beach is a live zone in this wave. But `r7bn-7v9c` assigns every 1000 Great Highway
row — the Labaudt frescoes, the Amundsen monument and its 2000 plaque — to
`analysis_neighborhood` **"Golden Gate Park"**, and Rec & Park Section 6 is coded
"Golden Gate Park, Outer Richmond" with no Ocean Beach component. The Great Highway is the
National Register district's western boundary, and everything here is inside it. The
arbitrator should confirm, because the Beach Chalet's restaurant and the Park Chalet are
addressed on the highway and are the strongest candidates for Ocean Beach to want.

**S5. The Fulton Street edge, candidates 59, 60, 61, 80, 87, 113, 114, 138. Eight escalated.
The Richmond IS a live zone and the finder's "cheap flag" reasoning fails.**
`inner-richmond-finder.md` exists. Worse for the park: `r7bn-7v9c` assigns **both Brown
Gate figures to `analysis_neighborhood` "Inner Richmond"**, not Golden Gate Park. That is
the City contradicting the default the finder assumed. Candidate 60 should go to the Inner
Richmond. The other seven need the same test applied one at a time.

**S6. The Lincoln Way / 9th Avenue edge. I resolve 88 and escalate 105 and 141.**
The San Francisco Botanical Garden's Ninth Avenue address resolves in the park's favour:
`r7bn-7v9c` **1958.26** and **1968.66**, both at 1199 9th Avenue, carry
`analysis_neighborhood` **"Golden Gate Park"**. **The park keeps the Botanical Garden.**
Breon Gate at 19th and Lincoln and the 46th Avenue playground stay open for the Sunset.

**S7. RESOLVED.** §4.

---

## 8. Tier

**GUIDE.** Ninety-two of the surviving candidates are stand-alone places — buildings,
gardens, lakes, meadows, bridges, recreation grounds, two museums, two restaurants and the
park itself. Twenty of those are escalated straddlers, so the honest floor if every one
lands elsewhere is **72**. Either number is an order of magnitude above the town-page
threshold of six, and the 90-word intro floor and two-link minimum are irrelevant here.

The remaining fifty surviving candidates are monuments, fountains, tunnels, gates, plaques
and single sculptures. They are prose inside a place, not places. Do not seed a page for
each statue on the Music Concourse; seed the Music Concourse and write them into it.

**And do not tally anything.** Not the landmarks, not the contributing resources, not the
statues. The finder handed over 37/36/47/13 and ten Article 10 rows so that I could check
them, and I did, and they are all correct, and none of them belongs in a sentence a reader
will see. The park has 133 contributing resources this month. It is a live dataset. Name
the buildings, cite their numbers, and count nothing.
