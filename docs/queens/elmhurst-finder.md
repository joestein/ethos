# Elmhurst, Queens — FINDER candidate file

**Role:** Finder only. **Nothing below is verified, confirmed, or adjudicated.** Every entry is a
CANDIDATE awaiting the verifier. Where I use quotation marks, the text inside them is copied
character-for-character from the cited page. Where I do not quote, the line is explicitly marked
`[PARAPHRASE]`. I have deliberately recorded conflicts rather than resolving them.

**Research constraint (disclose to verifier):** this session's WebSearch budget was already exhausted
on arrival (200/200 used) — the first and only Elmhurst query was refused. Everything below was
gathered by **direct retrieval of URLs I could name in advance** (WebFetch, plus `urllib` for hosts
that block WebFetch: nycgovparks.org, s-media.nyc.gov LPC PDFs, Socrata endpoints). Source discovery
was therefore **directed, not exhaustive**. Absence of a topic below is not evidence of absence.

**Source-quality note.** Primary/institutional here: LPC designation reports LP-2593, LP-2086,
LP-2131, LP-0138, LP-1292, LP-1177 (full PDFs read, not summaries); the LPC "Individual Landmark
Sites" open dataset (`buis-pvji`); DCP's 2020 NTA table (`9nt8-h7nd`); MTA's station dataset
(`39hk-dx4f`); NYC Parks Historical Signs Project pages; DOHMH restaurant inspections (`43nn-pn8j`);
Queens Public Library's own branch page. **Wikipedia is an aggregator** and is flagged as such
everywhere it is used; several Wikipedia claims below are directly contradicted by the LPC reports
and should not survive verification unchanged.

**Counts:** **171 candidate facts (F1–F171, numbered contiguously)** across **58 candidate places
(P1–P58)**.
**Contested neighborhood assignments: 21 rows in §N**, covering 19 distinct places plus one housing
complex counted once and one restaurant *cluster* counted once.

---

## §A — Boundaries and administrative geography

> This wave's hazard is Corona / Elmhurst / Forest Hills / Rego Park adjacency. Unlike Woodside,
> the City *does* treat Elmhurst as a single NTA — but it pairs Elmhurst with **Corona** in one
> Community District, and several sources below silently substitute "Elmhurst-Corona" statistics
> for "Elmhurst" ones. That substitution is the main trap here.

**F1.** DCP 2020 Neighborhood Tabulation Areas. Verbatim field values, queried
`$select=nta2020,ntaname,ntatype,cdta2020,cdtaname` `$where=boroname='Queens'`:

| nta2020 | ntaname | cdta2020 | cdtaname |
|---|---|---|---|
| `QN0401` | `Elmhurst` | `QN04` | `QN04 Elmhurst-Corona (CD 4 Approximation)` |
| `QN0402` | `Corona` | `QN04` | `QN04 Elmhurst-Corona (CD 4 Approximation)` |
| `QN0302` | `East Elmhurst` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |
| `QN0303` | `North Corona` | `QN03` | `QN03 Jackson Heights-East Elmhurst (CD 3 Approximation)` |
| `QN0601` | `Rego Park` | `QN06` | `QN06 Forest Hills-Rego Park (CD 6 Approximation)` |
| `QN0602` | `Forest Hills` | `QN06` | `QN06 Forest Hills-Rego Park (CD 6 Approximation)` |
| `QN0501` | `Maspeth` | `QN05` | `QN05 Ridgewood-Maspeth-Middle Village (CD 5 Approximation)` |
| `QN8191` | `Flushing Meadows-Corona Park` | `QN81` | `QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)` |

Source: https://data.cityofnewyork.us/resource/9nt8-h7nd.json
→ Note for the verifier: **Corona and North Corona are two different NTAs in two different Community
Districts.** Flushing Meadows-Corona Park is its own NTA (`ntatype` `9`, a "Joint Interest Area"),
in neither CD4 nor CD6.

**F2.** Elmhurst boundary description. Verbatim from Wikipedia article prose: "It is bounded by
Roosevelt Avenue on the north; the Long Island Expressway on the south; Junction Boulevard on the
east; and the New York Connecting Railroad on the west."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F3.** Wikipedia's Transportation section gives a *different* western boundary from F2. Verbatim
wikitext: "Elmhurst is bounded by the [[Long Island Expressway]] to the south and by the
[[Brooklyn-Queens Expressway]] to the west."
→ ⚠ **F2 says the west boundary is the New York Connecting Railroad; F3 says the BQE.** Same article,
two different west boundaries. Recorded, not resolved.
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (raw wikitext via MediaWiki API)

**F4.** Corona's own boundary claim. Verbatim from Wikipedia: "It borders Flushing and Flushing
Meadows–Corona Park to the east, Jackson Heights and Elmhurst to the west, Forest Hills and Rego
Park to the south, and East Elmhurst to the north."
Source: https://en.wikipedia.org/wiki/Corona,_Queens
→ This is the load-bearing adjacency statement for this wave: it places **Corona adjacent to
Elmhurst, Forest Hills AND Rego Park simultaneously.**

**F5.** Historic extent of the *town* of Newtown (of which Elmhurst village was the center).
Verbatim from LPC LP-2593, p.4: the village "was the population center for the larger town of
Newtown, an area that once extended from the East River to Flushing Bay, and from Brooklyn to
today's Forest Hills and Corona."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ The historic Town of Newtown **contained** the areas now called Forest Hills, Rego Park and
Corona. Any "Newtown" fact is therefore not automatically an Elmhurst fact.

**F6.** A second, different statement of the town's extent. Verbatim from Wikipedia: "The Town of
Newtown, which had a town hall, jail, tax office, and town clerk's office, was the center of a
municipality that comprised the villages that were located north of present-day Forest Park and west
of Flushing Meadows."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ F5 says "to today's Forest Hills and Corona"; F6 says "west of Flushing Meadows". Different
eastern limits. Recorded, not resolved.

**F7.** ZIP Code. Verbatim from Wikipedia: "Elmhurst is covered by [[ZIP Code]] 11373."
Two post offices, verbatim: "the Elmhurst A Station at 80-27 Broadway" and "the Elmhurst Station at
59-01 Junction Boulevard."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ ZIP 11373 is **not** coterminous with the Elmhurst NTA. See F160/F161 — a cluster of Woodside
Avenue restaurants carries ZIP 11373.

**F8.** Police precinct and community board. `[PARAPHRASE]` Wikipedia states Elmhurst is served by
the NYPD 110th Precinct and is in Queens Community Board 4.
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
Corroborating institutional value: every NYC Parks property page retrieved for Elmhurst (§F) prints
"Community Board: 4" and "Zip Code: 11373".

---

## §B — 17th- and 18th-century history

**F9.** Founding. Verbatim from LPC LP-2593, p.4: "The town was founded much earlier in 1652 as
Middleburgh, an outpost of New Amsterdam near the west end of Long Island."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F10.** Founding, Wikipedia's version. Verbatim: "The village was founded in 1652 in the Dutch
colony of New Netherland by English Puritans from Connecticut and Massachusetts. They named it
Middelburgh after the capital of the Dutch province of Zeeland, which had been a refuge of Puritans
fleeing religious persecution in England."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **THREE SPELLINGS of the same name across three sources**: LPC writes `Middleburgh`; Wikipedia
writes `Middelburgh`; NYC Parks (Frank D. O'Connor Playground sign) writes `Middleburg`; NYC Parks
(Middleburgh Triangle sign) writes `Middleburgh` for the town and `Middelburg` for the Dutch city.
Recorded, not resolved.

**F11.** Lenape agreement, 1656. Verbatim from LPC LP-2593, p.4: "In 1656, the Algonquian-speaking
Lenape people, whose settlement was known as Mas-pet or Wandowenock, agreed to share hunting,
fishing and gathering lands with the colonists."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F12.** The same episode, told with a different outcome. Verbatim from NYC Parks, Frank D. O'Connor
Playground historical sign: "When Dutch Governor Peter Stuyvesant threatened their patent, the
colonists approached the Algonquian-speaking Lenape, who agreed to share the surrounding territory.
The settlers ultimately took ownership of the property, and the Lenape were displaced."
Source: https://www.nycgovparks.org/parks/frank-d-oconnor-playground/history

**F13.** Third version, naming the tribe differently. Verbatim from NYC Parks, Moore Homestead
Playground historical sign: Rev. Moore was "responsible for the founding of the settlement in 1652
and arranging the peaceful purchase of Newtown from the Mespeatches tribe in 1656."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history
→ ⚠ F11 "agreed to share", F12 "agreed to share … the Lenape were displaced", F13 "peaceful
purchase". Three characterisations of the same 1656 transaction. Recorded, not resolved.

**F14.** Title deed. Verbatim from Wikipedia: "In a deed dated July 9, 1666, the settlers took title
to the lands of Newtown from the Native American tribes." (Wikipedia cites *Brooklyn Daily Eagle*,
October 22, 1899, "Residences Which Are Historical", p. 26.)
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F15.** English renaming. Verbatim from Wikipedia: "When the British took over New Netherland in
1664, they renamed Middleburgh as *Nieuwe Stad* (New Town) to maintain a connection to its Dutch
heritage. This was eventually simplified to Newtown."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F16.** A competing etymology for "Newtown". Verbatim from NYC Parks, Newtown Playground historical
sign: "Newtown Playground takes its name from one of the oldest European settlements in Queens. To
distinguish this area from the failed colony at Maspeth, the English settlers called it the new
town."
Source: https://www.nycgovparks.org/parks/newtown-playground/highlights/historical-signs
→ ⚠ F15 derives "Newtown" from Dutch *Nieuwe Stad*; F16 derives it from distinguishing the site from
Maspeth. Recorded, not resolved.

**F17.** The abandoned neighbouring colony. Verbatim from Wikipedia, the village was "just east of
the settlement at Maspat (now called Maspeth), which had been abandoned following threats and
attacks by local Lenape Native Americans."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F18.** Distance to New Amsterdam. `[PARAPHRASE]` Wikipedia states the village lay approximately
7 miles from New Amsterdam. Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F19.** The shared town building. Verbatim from Wikipedia: "A town building, near what is now
Broadway and Corona Avenue, was erected to serve as both a community and religious building. Use of
this building was shared by the different religious denominations in Middleburgh: the Church of
England, the Dutch Reformed Church, the Presbyterians, and the Quakers."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F20.** The same institution, LPC's account. Verbatim from LP-2593, p.4: "Under John Moore's
leadership, the townspeople constructed a meetinghouse that served a variety of community and
religious purposes as the schoolhouse, hall, church, and minister's house. This common facility was
financed by the townspeople and used cooperatively by everyone regardless of religious preference."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F21.** The 1669 church subscription. Verbatim from Wikipedia: "In 1669, the town planned a new
church for all of these denominations, on a plot of land donated by Ralph Hunt near Grand Avenue and
Queens Boulevard. According to the town records, the new building was to cost forty pounds, half in
corn and half in cattle." (Wikipedia cites *Brooklyn Times-Union*, September 25, 1927, p. 18.)
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F22.** Town seat. Verbatim from Wikipedia: "The village of Newtown was established as the town seat
for the township in 1683 … when Queens County was reorganized as a 'one county, five towns' model."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F23.** Rev. John Moore. Verbatim from LPC LP-2593, p.4: "the town's first planner and leader,
(Reverend) John Moore (c. 1620-1657), set up a local government and provided a system of taxes. He
also conducted church services, taught school, and established liaisons with the Native Americans.
Although this patriarch of the Moore family is sometimes identified as a minister, the record is
unclear about an official ordination."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ ⚠ LPC hedges the ordination ("record is unclear"); NYC Parks states flatly that "Rev. Moore was the
town's first minister" (F13); Wikipedia's Notable Residents list calls him "John Moore, founder of
Elmhurst and the first independent minister allowed in New England". Also ⚠ **LPC dates him
"c. 1620-1657"; NYC Parks dates him "(1620-1657)" without the "c."** Recorded, not resolved.

**F24.** Slavery in 17th-century Newtown. Verbatim from LPC LP-2593, p.4: "Census and tax data from
the late-17th century indicates that approximately two out of five households in Queens County
included one or more slaves. Although it is not clear how many parishioners of Old Saint James Church
owned slaves, a newspaper account noted in 1678 that Newtown counted '…183 white inhabitants and 93
Negro slaves.'"
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ The inner quotation is LPC quoting an unnamed 1678 newspaper account; I reproduce LPC's rendering
including its leading ellipsis.

**F25.** Population in 1700. Verbatim from Wikipedia: "By 1700, the town had a population of 1,000,
including 405 youths under the age of sixteen, 434 adults, and 161 slaves."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ Note for the verifier: 405 + 434 + 161 = 1,000. Internally consistent.

**F26.** The Ministry Act. Verbatim from LPC LP-2593, p.4: "The Ministry Act of 1693 established the
Church of England as the official church in the Province of New York."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F27.** SPG mission. Verbatim from LPC LP-2593, p.2: "In 1702, the Society for the Propagation of
the Gospel in Foreign Parts, under the Bishop of London, formed a Church of England mission parish
composed of Newtown, Flushing, and Jamaica."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ ⚠ LP-2593 p.5 gives a **different founding year for the SPG itself**: "the Society for the
Propagation of the Gospel in Foreign Parts (SPG) was established in 1701." And p.5 dates the parish
to 1704: "Saint James parish celebrates its official beginning in 1704 as 'The Church of England in
America, Mission Church at Newtowne.'" Three dates (1701 / 1702 / 1704) for adjacent events in one
report. Recorded, not resolved.

**F28.** Revolutionary War occupation. Verbatim from LPC LP-2593, p.6: "The parish minister at that
time, Reverend Joshua Bloomer, was a loyalist and continued to support the Crown while the British
army was encamped in Newtown Village. Some of the army's highest-ranking officers attended services
at the church including General William Howe, Commander-in-chief, and Prince William, who later
became King William IV of England."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F29.** Howe's headquarters. Verbatim from NYC Parks, Moore Homestead Playground sign: "During the
Revolutionary War, the Moores were loyalists and sympathetic to the crown. British encampments lined
up and down Broadway and Hoffman Boulevard, including the Moore property. British General William
Howe maintained his headquarters nearby at the Samuel Renne House (located at the modern-day
southwest corner of 57th Avenue and Queens Boulevard, demolished in 1937.)"
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history
→ **P1 — Samuel Renne House site**, SW corner of 57th Avenue and Queens Boulevard. Demolished 1937.
Note the surname also appears in LP-2593 as "James Renne, Jr." the carpenter of Old St. James (F41).

---

## §C — 19th century, the renaming, and Cord Meyer

**F30.** Free Black settlement. Verbatim from the Preservation League of New York State, quoted by
Wikipedia: "Newtown, what is now Elmhurst, was settled by free African Americans in 1828, one of
several such communities that popped up in New York City after slavery was abolished in 1827 (Seneca
Village, which was displaced to create Central Park, might be the most famous of these communities)."
Source: https://www.preservenys.org/blog/seven-to-save-spotlight-elmhurst-african-american-burial-ground

**F31.** **P2 — Elmhurst African American Burial Ground**, Corona Avenue and 90th Street.
Verbatim from Wikipedia: "In 1828, a year after slavery in New York state was finally abolished under
the terms of a 1799 gradual abolition law, landowner James Hunter and his wife deeded 2 acres to the
community for a church and parsonage. They had already been using land at Corona Avenue and 90th
Street as a burial ground since about 1818. This was associated with the United African Society of
Newtown, by 1906 known as St. Mark's A.M.E. Church. By 1886, more than 300 burials had been made in
the cemetery."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **CONTESTED LOCATION.** The address is *Corona Avenue* and 90th Street. See §N.

**F32.** The 2011 discovery. Verbatim from the Preservation League of NYS: archaeological research
"revealed her identity as most likely Martha Peterson, a 26-year-old African American woman buried
about 150 years before", and the discovery "revealed the existence of many more unmarked graves."
Source: https://www.preservenys.org/blog/seven-to-save-spotlight-elmhurst-african-american-burial-ground

**F33.** The failed disinterment. Verbatim from the Preservation League of NYS: the church "had stood
on the site until 1930"; before moving, officials "applied for a permit from the city to transfer all
burials to Mount Olivet Cemetery — but the permit was denied."
`[PARAPHRASE]` The League states records show only about 20 burials were relocated out of an
estimated 300-plus graves, that the site is now developer-owned, that the **Elmhurst History and
Cemeteries Preservation Society** advocates for it, and that the League named it to its **Seven to
Save** list.
Source: https://www.preservenys.org/blog/seven-to-save-spotlight-elmhurst-african-american-burial-ground

**F34.** Wikipedia's account of the same site, verbatim: "The church moved further east and gradually
the burial ground was forgotten until the remains of a woman were discovered in an iron coffin in
2011 during development. The church is hoping to buy the land for preservation."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ Wikipedia says the church hopes to buy the land; the Preservation League credits the Elmhurst
History and Cemeteries Preservation Society. Also ⚠ the League says the church moved "to Jackson
Heights"; Wikipedia says only "further east". Recorded, not resolved.

**F35.** Transport-driven growth. Verbatim from Wikipedia: "More concentrated residential development
in the area was spurred by the completion of a horsecar line, the Grand Street Line, which reached
New Town in 1854. The Long Island Rail Road's Main Line was built through Newtown in 1876, attracting
more residents to the neighborhood."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F36.** Population trajectory, LPC's Newtown High School / Elks version. Verbatim from LP-2131 p.2
and LP-2086 p.2 (identical wording in both): "By 1790, its population hovered around 2,000. It
remained mainly an agricultural community through the mid-nineteenth century, producing vegetables
and fruits for the growing urban markets in Long Island City, Brooklyn, and Manhattan. By 1850,
Newtown's population had increased to approximately 7,000."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf ; https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F37.** ⚠ The same population trajectory, LPC's 1987 version, which does not agree. Verbatim from
LP-1292 p.1: "In 1790, the number of inhabitants of the township hovered at about 2,000. By 1850,
there had only been an increase of 5,000 residents."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ ⚠ "increased to approximately 7,000" (F36) vs "an increase of 5,000 residents" (F37). These may be
reconcilable (2,000 + 5,000 = 7,000) but the second is ambiguously worded. Recorded, not resolved.

**F38.** Dutch settlement date, LPC. Verbatim from LP-2131 p.2 and LP-1292 p.1: "Newtown, which
bordered the East River and lay closest to Manhattan, was settled by the Dutch in 1640 and
incorporated in 1652."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf ; https://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ ⚠ **Directly contradicts F9/F10**, which say the town was founded in 1652 by English Puritans.
LPC itself carries both versions in different reports. Recorded, not resolved.

**F39.** Consolidation vote. Verbatim from LP-2131 p.2: "At the time of the consolidation of Greater
New York in 1898, the three westernmost townships of Queens County - Jamaica, Flushing, and Newtown
(now Elmhurst) - voted to become part of New York City. The remaining towns formed Nassau County."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F40.** **THE RENAMING — FOUR DIFFERENT DATES ACROSS FOUR SOURCES.** All quoted verbatim:

| Source | Wording | Date implied |
|---|---|---|
| LPC LP-2131 p.2 | "In 1896, Cord Meyer renamed the area Elmhurst, an allusion to the large number of elm trees in the area." | **1896** |
| LPC LP-2086 p.2 | "Large-scale development began in 1896, when the Cord Meyer Development Company … began operating in Newtown. Hoping to disassociate its housing development from nearby, foul-smelling Newtown Creek, Cord Meyer Development convinced the post office to rename the town Elmhurst for its large number of stately elm trees." | **1896** |
| Wikipedia | "Cord Meyer bought land at Broadway and Whitney Avenue in 1896. He proposed that the town be renamed 'Elmhurst', meaning 'a grove of elms'; in 1897, one year before Queens County was incorporated in the Greater City of New York, the town was renamed." | **1897** |
| NYC Parks, Middleburgh Triangle sign | "When the city was incorporated into New York City in 1898, the new name 'Elmhurst,' meaning 'a grove of elms,' was chosen because of the prevalence of elm trees in the area." | **1898** |

Sources: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf ;
https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf ;
https://en.wikipedia.org/wiki/Elmhurst,_Queens ;
https://www.nycgovparks.org/parks/middleburgh-triangle/history
→ Note also the **agent** differs: LP-2131 says Cord Meyer renamed it; LP-2086 says the company
convinced *the post office*; Wikipedia says Meyer *proposed* it. Recorded, not resolved.

**F41.** Cord Meyer the man. Verbatim from NYC Parks, Veterans Grove sign: "Cord Meyer (1854-1910)
and his brothers transformed it from a declining agricultural region into a middle-class residential
area. They laid down streets, constructed a sewer system, brought in gas and electricity, built a
bank, and set up a system of trolley cars."
Source: https://www.nycgovparks.org/parks/veterans-grove/history

**F42.** ⚠ Cord Meyer the company — a founding date that conflicts with F40. Verbatim from NYC Parks,
Middleburgh Triangle sign: "The Cord Meyer Company has a rich history in Queens, and was founded in
1899 by three brothers: Cord, Christian, and John Meyer, Jr."
Source: https://www.nycgovparks.org/parks/middleburgh-triangle/history
→ ⚠ A company "founded in 1899" cannot have begun "large-scale development … in 1896" (F40) or
renamed the town in 1896/1897. Recorded, not resolved.

**F43.** Scale of the Cord Meyer build-out. Verbatim from LP-2086 p.2: "By 1910, the company had
completed thousands of houses in the community."
Verbatim from Wikipedia: "Elmhurst developed as a fashionable district due to a housing development
built by the Cord Meyer Development Company between 1896 and 1910, north of the Port Washington
Branch railroad station. Cord Meyer expanded its holdings between 1905 and 1930, including Elmhurst
Square, Elmhurst South, Elmhurst Heights, and New Elmhurst."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf ; https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F44.** ⚠ Internal contradiction in a single NYC Parks sign. The Middleburgh Triangle sign says, in
consecutive sentences: "Elmhurst was established as Newtown in 1652, but between 1652 and 1664, the
area was known as Middleburgh after a city in the Netherlands. This triangle is named for Maspeth's
original name."
Source: https://www.nycgovparks.org/parks/middleburgh-triangle/history
→ The first sentence says Middleburgh was *Elmhurst's* original name; the second says the triangle is
named for *Maspeth's* original name. Recorded, not resolved. **P3 — Middleburgh Triangle**, Park ID
Q069, "Property Type: Triangle/Plaza", "Acreage: 0.00", Zip 11373, Community Board 4.

**F45.** Transport improvements of the 1910s–20s. Verbatim from LP-2131 p.3: "Additional development
in Elmhurst was stimulated by improvements in transportation during the 1910s, which included the
construction of another Long Island Railroad station, the enhancement of trolley service, new
elevated train service above Roosevelt Avenue, and the opening of Queens Boulevard."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F46.** The IND and its cost. Verbatim from LP-2131 p.4: "Growth in Elmhurst continued through the
1920s due in part to the opening of the Independent Subway (IND) line in Elmhurst with stops along
Queens Boulevard in the early 1930s. This encouraged denser development in the form of six-story
apartment houses and long rows of adjoining houses, as well as additional commercial and industrial
development."
Verbatim from Wikipedia: "In the 1930s, the Independent Subway System's Queens Boulevard line was
built through the neighborhood, spurring economic development but also destroying many old
buildings."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf ; https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F47.** Post-war ethnic transformation. Verbatim from LP-2131 p.5 (identical wording in LP-2086
p.2): "Demographic changes followed the Second World War as Elmhurst evolved from an almost
exclusively middle-class suburban community with a large Jewish and Italian population to one of the
most ethnically diverse neighborhoods in the city. By the 1980s, immigrants from 112 countries had
settled in Elmhurst, including people from China, Colombia, Korea, India, the Philippines, the
Dominican Republic, Ecuador, Pakistan, Peru, and Guyana."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf ; https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ This "112" figure appears in **three independent institutional/aggregator sources** (both LPC
reports and Wikipedia), which is unusually strong for this file.

---

## §D — Designated landmarks

**F48.** **THE AUTHORITATIVE LIST.** Querying the LPC "Individual Landmark Sites" dataset for
`nta2020='QN0401'` (Elmhurst) returns **exactly four individual landmarks**. Verbatim field values:

| lpc_name | address | lpc_lpnumb | desdate | cd | nta2020 |
|---|---|---|---|---|---|
| `Old Saint James Episcopal Church (Old Saint James Parish Hall)` | `86-02 Broadway` | `LP-02593` | `9/19/2017` | `404` | `QN0401` |
| `Benevolent and Protective Order of Elks, Lodge Number 878` | `82-10 Queens Boulevard` | `LP-02086` | `8/14/2001` | `404` | `QN0401` |
| `Reformed Dutch Church of Newtown and Fellowship Hall` | `85-15 Broadway` | `LP-00138` | `7/19/1966` | `404` | `QN0401` |
| `Newtown High School` | `48-01 90th Street` | `LP-02131` | `6/24/2003` | `404` | `QN0401` |

Source: https://data.cityofnewyork.us/resource/buis-pvji.json
(`$where=nta2020='QN0401'`, `$select=address,lpc_name,lpc_lpnumb,lpc_sitest,desdate,landmarkty,cd,nta2020,latitude,longitude,bbl`)
All four have `lpc_sitest` = `Designated` and `landmarkty` = `Individual Landmark`.
→ There are **no historic districts** in Elmhurst in this dataset, and no scenic landmarks.

**F49.** ⚠ **LPC'S OWN PROSE CONTRADICTS LPC'S OWN DATASET.** Two designation reports list a
*different* set of Elmhurst landmarks. Verbatim from LP-2086 p.2 (2001): "In addition to the
Benevolent and Protective Order of Elks, Lodge Number 878, Elmhurst's other designated New York City
Landmarks are the Reformed Church of Newtown (85-15 Broadway), the Remsen Cemetery (69-43 Trotting
Course Lane), and the Edward E. Sanford House (107-45 47th Avenue)."
Verbatim from LP-2131 p.4 (2003): "Elmhurst's other designated New York City Landmarks are the
Reformed Dutch Church of Newtown (85-15 Broadway), the Remsen Cemetery (69-43 Trotting Course Lane),
the Edward E. Sanford House (107-45 47th Avenue) and the Benevolent and Protective Order of Elks,
Lodge Number 878 (82-10 Queens Boulevard)."
Sources: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf ; https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf
→ **LPC prose assigns Remsen Cemetery and the Sanford House to Elmhurst. The LPC dataset assigns
Remsen Cemetery to `QN0601` (Rego Park, CD 406) and the Sanford House to `QN0402` (Corona, CD 404).**
See §N. Recorded, not resolved.

**F50.** ⚠ The Sanford House **address is contested inside LPC too.** The dataset gives
`102-45 47th Avenue`; the 2001 and 2003 reports both give `107-45 47th Avenue`; and the 1987
designation report itself is titled, verbatim: "102-45 47th AVENUE HOUSE, Borough of Queens. Built
c. 1871; architect unknown." — i.e. the 1987 report **does not use the name "Edward E. Sanford
House" at all, and names no neighborhood.**
Source: https://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ Three-way conflict: name, address, and neighborhood.

**F51.** ⚠ And the person's name is contested inside the 1987 report. Verbatim, p.1: "Built for
Edward E. Sanford about 1871". Verbatim, p.2: "Daniel Sanford Duncomb (1813-1883), a Manhattan
merchant, began to invest in village real estate and, having acquired the present site of the 102-45
47th Avenue House, sold it to **Edward R. Sanford** in April 1871."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ "Edward E." on p.1, "Edward R." on p.2. Recorded, not resolved.

**F52.** ⚠ The strongest evidence *against* an Elmhurst assignment for the Sanford House, from LPC's
own text. Verbatim from LP-1292 p.2: "One of the earliest investors was Benjamin W. Hitchcock who
owned the site of the Sanford house and the surrounding area, which he called the Village of West
Flushing in 1854."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1292.pdf
→ **"West Flushing" is the documented former name of Corona** (F153). Recorded, not resolved — this
is the verifier's call, not mine.

**F53.** **P4 — Remsen Cemetery.** Verbatim header of LP-1177: "REMSEN CEMETERY, between Alderton
Street and Trotting Course Lane, adjoining 69-43 Trotting Course Lane, Borough of Queens. Landmark
Site: Borough of Queens Tax Map Block 3178, Lot 44." Designated May 26, 1981, Designation List 144.
→ ⚠ The header says "Alderton **Street**"; the body says "near Alderton **Avenue**, formerly Orville
Street". Internal discrepancy.
Source: https://s-media.nyc.gov/agencies/lpc/lp/1177.pdf

**F54.** Remsen Cemetery detail, verbatim from LP-1177: "The Remsen family ancestors immigrated to
America in the 17th century from northern Germany and eventually settled in Queens County. The
founding father of the clan in America was Rem Jansen Van der Beeck; his sons adopted the surname
Remsen." Jeromus Remsen was "born on November 22, 1735" and "served during the French and Indian War
of 1757 and became active in Whig politics prior to the Revolutionary War." He was "appointed colonel
over half the militia of Kings and Queens counties and joined forces under the brigade of General
Greene in Brooklyn. These American forces were routed at the Battle of Long Island."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1177.pdf

**F55.** ⚠ **An impossible date printed in an LPC report.** Verbatim from LP-1177 p.1: "Jeromus had
married Ann(a), daughter of Cornelius Rapelje, on April 31, 1768."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1177.pdf
→ **April has 30 days.** Flagged for the verifier as a source error, not mine.

**F56.** Remsen Cemetery, physical description. Verbatim from LP-1177 p.2: "The oldest known grave is
that of Jeromus Remsen, from 1790. In a survey of 1925, the graves and gravestones of eight Remsen
family members were identified." … "These tombstones date from 1790 through 1819. Recently,
commemorative gravestones have been erected by the Veterans Administration in honor of Col. Remsen,
Major Abraham Remsen, and their two brothers Aert Remsen and Garrett Remsen, who were also
Revolutionary War officers. A World War I memorial, honoring the community's service in that war,
occupies the center of the cemetery. It consists of two doughboy statues flanking a flagpole."
Source: https://s-media.nyc.gov/agencies/lpc/lp/1177.pdf

**F57.** **P5 — Old Saint James Episcopal Church (now Old Saint James Parish Hall).** Verbatim
header of LP-2593: "OLD SAINT JAMES EPISCOPAL CHURCH (now Old Saint James Parish Hall), 86-02
Broadway (aka 85-08 51st Avenue), Queens. Built: 1735-36; enlarged: c. 1772; altered: 1883."
Designated September 19, 2017, Designation List 498.
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F58.** Its significance claim, verbatim from LP-2593 Summary: "It is New York City's oldest Church
of England (Episcopal) building and the City's second oldest religious building that is still
standing."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ Note the **two-part, carefully hedged claim**: oldest *Church of England* building; second-oldest
religious building overall. Wikipedia flattens this (F62).

**F59.** Its location within Elmhurst, verbatim from LP-2593 p.2: "Old Saint James Episcopal Church
(now Old Saint James Parish Hall) is located at the southwest corner of Broadway and 51st Avenue
within the central district of Elmhurst, Queens."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F60.** Construction narrative, verbatim from LP-2593 p.7: "The deed was dated April 19, 1733, and
signed by seventy-eight freeholders '…that twenty square rods of land….to have and to hold unto the
people or Society of ye Church of England that shall join with them to worship God in that way
forever.'" … "Joseph Moore, identified as a freeholder, served as the director of the building
committee and James Renne, Jr., as carpenter. 'By May [1735], the frame was raised and the roof
placed…' The church was completed in 1736, but the interior was not furnished until 1740."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ ⚠ Note "completed in 1736" vs the header's "Built: 1735-36" vs the interior finished 1740.

**F61.** Dimensions, verbatim from LP-2593 p.2: "The main section (58 feet by 30 feet) is clad with
wood shingles and has three bays of round-arched window openings along each long (north and south)
side". "The 1883 rear addition (25 feet by 15 feet) with clapboard siding is narrower and shorter
than the main section."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F62.** ⚠ **Wikipedia's St. James paragraph conflicts with LPC on at least three points.** Verbatim
from Wikipedia: "St. James Church (originally St. James Episcopal Church, at Broadway and 51st
Avenue) is Elmhurst's oldest extant building, having been built in 1734 under the rule of British
King George III. In 1848, it became a community center and Sunday school, upon which the church moved
to a new building that later burned down. A clock tower atop the original building was destroyed in
an 1882 storm."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ (a) Wikipedia says **1734**; LPC says **1735-36**. (b) Wikipedia says **"under the rule of British
King George III"** — George III's reign began in 1760, so this is anachronistic on either date.
(c) Wikipedia says a **clock tower** was "destroyed in an 1882 storm"; LPC says "In 1883 a small rear
addition replaced the west-end tower" as part of a deliberate remodeling, and describes the original
tower as topped by "a steeple with a spire surmounted by a huge weathervane in the form of a crowing
cock" — a steeple, not a clock tower. Recorded, not resolved; the verifier should weight LPC.

**F63.** The 1848 successor church and the moved graves, verbatim from LP-2593 p.7: "In 1848 a new
church was erected along Broadway, a block to the north. It was a wood Gothic Revival building
designed by Minard Lafever (1798-1854), a well-known New York City architect… A few years later in
1851, graves from the Old Saint James churchyard were moved to the new church's cemetery at 84-07
Broadway, located between Corona and St. James Avenue."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ **P6 — St. James Church cemetery, 84-07 Broadway**, between Corona Avenue and St. James Avenue.
→ ⚠ Wikipedia (F62) says the 1848 building "later burned down"; LP-2593 does not say this. Recorded.

**F64.** Samuel Seabury. Verbatim from LP-2593 p.5: "One of the most famous clergymen of the Jamaica
three-town mission parish was Reverend Samuel Seabury, Jr., (1729-1796) who served from 1757 to 1766.
He later became America's first consecrated bishop in 1784." And p.6: "the enterprising Reverend
Samuel Seabury, Jr., who had ministered at Saint James Church from 1757 to 1766, became the first
American Episcopal bishop by traveling to Scotland in 1784 where he was consecrated by bishops of the
Scottish Episcopal Church who did not require the oath."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F65.** Benjamin Moore and Clement Clarke Moore. Verbatim from LP-2593 pp.5–6: "Another well-known
congregant and Moore descendant was Reverend Benjamin Moore (1748-1816). He was born in Newtown,
ordained in 1774, and became acting president of King's (now Columbia) College from 1775 to 1784 and
president of Columbia College from 1801 to 1810. He later became the second bishop of the Episcopal
Diocese of New York, serving from 1815 to 1816. Author and landowner Clement Clarke Moore of Chelsea,
New York, was his son."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F66.** The 1761 charter. Verbatim from LP-2593 p.2: "In 1761 the parish separated from Jamaica and
Flushing and formally became the 'Church of England Parish of Saint James.'" And p.5: "The 1761
charter also noted the acquisition of an additional ¼ acre for the church cemetery."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F67.** The slave gallery. Verbatim from LP-2593 p.8: "Old Saint James Church followed this typical
arrangement as noted in an 1882 newspaper article with a reference to the presence of a separate room
for slaves in the tower. Additional description in the 1954 parish history indicates the room was
accessed by a '…small stairway [that] led …to an upper room called "the slave room," which was
directly on a level with the pulpit and had a window opening into the church.'"
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ The 1954 parish history is Minnie Germond, *A Brief History of St. James Parish* (1954), per LPC.

**F68.** The 2004 restoration. Verbatim from LP-2593 p.2: "In 2004, the building was restored to its
late 19th-century appearance using grants from the New York Landmarks Conservancy's Historic
Properties Fund and other sources."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf

**F69.** The Henrietta Moore Academy. Verbatim from LP-2593 p.7: "A school of higher education was
established by both Saint James Church and the First Presbyterian Church nearby. The clergy of both
churches supervised the curriculum and occasionally taught classes. The school was located along 51st
Avenue and was later known as The Henrietta Moore Academy until it closed in the 1870s."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ **P7 — Henrietta Moore Academy site**, along 51st Avenue. No longer extant.

**F70.** Who testified for designation in 2017 — useful for identifying live local institutions.
Verbatim from LP-2593 p.1: "The Commission also received letters in favor of designation from New
York City Council Member Daniel Dromm, United States Congresswoman Grace Meng, State Senator Tony
Avella, the Queens Preservation Council, the Juniper Park Civic Association, Newtown Historical
Society, Communities of Maspeth and Elmhurst Together (C.O.M.E.T.), and two individuals."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2593.pdf
→ **P8 — Newtown Historical Society**; **P9 — Communities of Maspeth and Elmhurst Together
(C.O.M.E.T.)**. Both are named organisations, not places with addresses.

**F71.** **P10 — Reformed Dutch Church of Newtown and Fellowship Hall**, 85-15 Broadway. Verbatim
header of LP-0138: "REFORMED DUTCH CHURCH OF NEWTOWN AND FELLOWSHIP HALL, 85-15 Broadway, Elmhurst,
Borough of Queens. Church built 1831; Hall built 1860. Landmark Site: Borough of Queens Tax Map Block
1836, Lot 112." Designated July 19, 1966, Number 2.
Source: https://s-media.nyc.gov/agencies/lpc/lp/0138.pdf
→ ⚠ Note the block/lot here (`Block 1836, Lot 112`) differs from the modern dataset's BBL
`4018360001` (Block 1836, Lot 1). Recorded.

**F72.** Its description, verbatim from LP-0138: "This Church, one of the oldest wood churches in the
City, can be seen and enjoyed by pedestrians and motorists from three directions. The gable end faces
west towards Broadway. The handsome little Church is one story high with a pitched roof. A flat
roofed porch provides shelter for the congregation and is supported by seven fine wooden columns with
a simple cornice." … "A beautiful octagonal bell tower with copper roof is supported on a square base
which straddles the ridge of the roof at the west end. From the Corona Avenue side, the cemetery,
with its many remaining headstones, has the appearance of a small colonial village churchyard."
Source: https://s-media.nyc.gov/agencies/lpc/lp/0138.pdf
→ **P11 — Reformed Church of Newtown graveyard**, on the Corona Avenue side of 85-15 Broadway.

**F73.** Its predecessor building, verbatim from LP-0138: "The first church built on the site was
completed by the congregation in 1735 employing volunteer labor. It was also built of wood and had an
octagonal plan with roof pitched to a peak above which was a small lantern. This church was replaced
by the present Church in 1831, using the original cornerstone as part of the new foundation. The
framing of the buildings is entirely of wood, but in 1965 random width aluminum shingles were applied
over the original wood shingles for protection."
Source: https://s-media.nyc.gov/agencies/lpc/lp/0138.pdf

**F74.** ⚠ Wikipedia dates the same congregation and building differently. Verbatim: "The Reformed
Church of Newtown (85-15 Broadway), founded in 1731. The original church was built in 1733, with a
replacement built in 1831, expanded in 1851, and fitted with stained glass by 1874."
And in its landmarks list, verbatim: "one of the oldest wood churches in New York City, first
established by Dutch immigrants in 1731".
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **Original church: LPC says completed 1735; Wikipedia says built 1733.** Congregation founding
1731 appears only in Wikipedia (citing a 1982 NYT article), not in LP-0138. Recorded, not resolved.

**F75.** Fellowship Hall, verbatim from LP-0138: "Built originally as a chapel, the Hall was located
to the south and apart from the Church. In 1906, it was moved back from the street and was aligned
with the main Church."
Source: https://s-media.nyc.gov/agencies/lpc/lp/0138.pdf

**F76.** The designation finding, verbatim from LP-0138: "the Reformed Church of Newtown and
Fellowship Hall, considered as a group, is one of the few all wood church groups remaining in the
City, that these two buildings with their porches, gable ends and towers, though built at different
times, are good examples of the Greek Revival style of architecture successfully and attractively
combined and that they represent an important part of the history of the neighborhood of which they
are the outstanding architectural monument."
Source: https://s-media.nyc.gov/agencies/lpc/lp/0138.pdf

**F77.** **P12 — Newtown High School**, 48-01 90th Street. Verbatim header of LP-2131: "NEWTOWN HIGH
SCHOOL, 48-01 90th Street, aka 48-02 91st Street, Non-Addressable Building Frontage on 50th Avenue,
and 90-14 48th Avenue, Borough of Queens. Built 1920-21, architect C.B.J. Snyder; additions 1930-31,
architect Walter C. Martin and 1956-58, architects Maurice Salo & Associates." Designated June 24,
2003, Designation List 348.
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F78.** ⚠ **A WebFetch summary of the Wikipedia Elmhurst article reported Newtown High School as
"Corona Avenue and 90th Street … built in 1897". Both halves conflict with LP-2131** (48-01 90th
Street; built 1920-21). I could not reproduce the "1897" string in the raw wikitext, so this may be
a summarizer artifact rather than a Wikipedia claim — **the verifier should treat "1897" as
unattributed and rely on LP-2131.** Flagged rather than asserted.

**F79.** The school's building campaigns, verbatim from LP-2131 Summary: "The school is the result of
several building campaigns, which began with the construction of a small, wooden school house in 1866
to serve children from the Village of Newtown and the surrounding farms. The school's first expansion
took place in 1898-1900, when a much larger, brick building, designed by the architectural firm
Boring & Tilton, was added to the site. The school accommodated both grammar and high school students
until 1910, when the lower grades were moved out and this facility was renamed Newtown High School,
in honor of Elmhurst's historic name. The 1866 and 1898-1900 buildings were subsequently demolished."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F80.** The 1866 school's scale, verbatim from LP-2131 p.2: "the Newtown School District decided to
replace its existing school house, which had room for only 170 of the township's 520 school-aged
children. The new school was a two-story, six-classroom building with room for 400 students from the
Village of Newtown and the surrounding farming community."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F81.** Elmhurst's late arrival to secondary education, verbatim from LP-2131 p.2: "Some sections of
Queens County also opened high schools in the nineteenth century: Flushing in 1875 and Long Island
City in 1889. Elmhurst, however, did not get a separate high school until 1910."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F82.** The 1900 wing, verbatim from LP-2131 p.2: "In 1897, eight adjoining lots were purchased and
the existing school was moved to a new foundation to make way for the new 65 by 156 foot edifice.
Construction began in early 1898, but was delayed when problems arose with the costs of construction
and the performance of the contractor… The new wing was finally opened on May 4, 1900."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf
→ Note: **1897 appears in LP-2131 as the year adjoining lots were purchased**, which may be the
origin of the erroneous "built in 1897" in F78.

**F83.** C.B.J. Snyder's design and the tower, verbatim from LP-2131 Summary: "In 1917-18, C.B.J.
Snyder, the noted Superintendent of School Buildings for the Board of Education, designed an
impressive Flemish Renaissance Revival-style addition to the school, which featured stepped gables
and a dramatic 169-foot, centrally-placed tower topped by a cupola and turrets. Snyder's choice of
the Flemish Renaissance Revival style showed his awareness of New York's, and particularly
Elmhurst's, beginning as a Dutch colony… It is one of a handful of public schools in New York City
executed in this style."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F84.** The delays, verbatim from LP-2131 Summary and p.3: "The start of construction was delayed
until 1920 by the First World War, a fire that destroyed the first set of blueprints, and problems
with the contractor. The new wing opened in September 1921." … "In February, a fire in the drafting
rooms in the Superintendent's office destroyed the entire set of drawings for the Newtown project. It
was a huge loss worth several thousand dollars and over a year of work." … "Ground was finally broken
on July 1, [1920]… The cornerstone was laid to much fanfare on December 2, 1920."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F85.** Cost escalation, verbatim from LP-2131 p.3: "That spring, the Board authorized $400,000 for
an addition to the school"; "In January 1918, the Board of Education realized that the original cost
estimate for the addition… was inadequate and allocated another $160,000 to the project"; "By the end
of the year, the cost of the entire project had risen to $700,000."; and a "new contract was awarded
to the T.A. Clarke Co. of Brooklyn in June 1920, the estimated price had risen to almost one million
dollars."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F86.** The 1921 wing's contents, verbatim from LP-2131 p.4: "Newtown High School's new wing included
fifteen additional classrooms, five laboratories, a music room, a study hall, a lecture hall, two
gymnasiums, offices, and an 1,100 seat auditorium named Dillingham Hall at the time of completion.
Dr. James Darius Dillingham served as the school's principal from 1894 through the mid-1930s, and
oversaw all of the school's expansions during that time. Newtown High School, with this enlargement,
now accommodated 1,507 students and 68 faculty."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf
→ **P13 — Dillingham Hall**, the 1,100-seat auditorium inside Newtown High School.

**F87.** C.B.J. Snyder. Verbatim from LP-2131 p.4: "Charles B.J. Snyder (1860-1945), Superintendent
of School Buildings, was the architect responsible for the planning, design, and construction of all
new and expanded schools in the five boroughs after consolidation in 1898. Appointed to this position
in 1891, when he oversaw only Manhattan and the annexed district of the Bronx, Snyder remained in
that post until 1923."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F88.** The 1930-31 additions, verbatim from LP-2131 p.5: "In July 1929, the Board of Education
budgeted 2.4 million dollars for the project… Construction commenced in early 1930, but was delayed
by the discovery of boulders on the site while the foundation was being excavated. After they were
removed, progress was very rapid. Both wings were largely completed by the end of the year, and the
students were admitted on February 2, 1931. The new wings, which provided the school with an
additional 1,716 seats, had thirty-five new classrooms, another gymnasium, and a variety of shops,
art rooms, and specialty rooms, including one called the 'girls' corrective training room.'"
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F89.** The 1956-58 wing, verbatim from LP-2131 pp.5–6: "it decided to construct a replacement wing
at a cost of 1.6 million dollars. The architectural firm of Maurice Salo & Associates of Manhattan
was contracted to produce the new wing. The firm's International Style design for the addition
consisted of a four-story and basement brick block, fronted by a low pavilion faced in limestone,
aluminum, and glass." … "The wing was finally completed in February 1958."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F90.** The building's inscriptions, verbatim from LP-2131 p.6: "The portico is topped by a scrolled
pediment, cartouches, coats-of-arms, incised lettering spelling out 'Newtown High School,' and a
surmounting balustrade topped with urns." And: "The central doorway is topped by a multi-pane fanlight
and the central cartouche has inscribed lettering spelling out 'Boys.'" (on the 50th Avenue facade).
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf

**F91.** Current scale, verbatim from LP-2131 Summary and p.6: "The remarkably intact Newtown High
School now serves a diverse body of 4,500 students and more than 200 teachers." … "The present-day
4,500-student body and 200-teacher roster at Newtown High School reflect the presence of these ethnic
groups."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2131.pdf
→ ⚠ **These are 2003 figures.** Do not present as current. Flagged.

**F92.** **P14 — Benevolent and Protective Order of Elks, Lodge Number 878**, 82-10 Queens Boulevard.
Verbatim header of LP-2086: "Benevolent and Protective Order of Elks, Lodge Number 878, 82-10 Queens
Boulevard, Queens. Built 1923-24; architect, The Ballinger Company. Landmark Site: Borough of Queens
Tax Map Block 2475, Lot 12 in part consisting of the land underneath the 1923-24 lodge building."
Designated August 14, 2001, Designation List 329.
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F93.** Its summary claim, verbatim from LP-2086: "The neo-Classical style building is modeled on the
Italian Renaissance palazzo type and is clad in brick, limestone, and granite." … "The structure,
which contains a series of recreational and social spaces, was considered one of the largest and
best-equipped fraternal homes in the country, and one of Queen's most handsome buildings at the time
of its completion. The building was prominently featured in an article about the design of fraternal
buildings that appeared in the *Architectural Forum* in 1926."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ ⚠ Wikipedia's landmarks list instead says the Elks Lodge was "once the largest Elks lodge in the
Eastern United States". LPC says "one of the largest… in the country". Different claims. Recorded.

**F94.** Construction and opening, verbatim from LP-2086 p.4: "In 1921, the Benevolent and Protective
Order of Elks purchased land on the south side of Queens Boulevard in Elmhurst, Queens, for the
construction of a new building for Lodge 878. The lodge was founded in 1903, and was holding its
meetings at Lodge 828 in Long Island City, Queens." … "Construction began in October 1923 by the
McIntee Construction Co. of Manhattan." … "The lodge, which cost $750,000, opened on October 26,
1924."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F95.** Its interior programme, verbatim from LP-2086 p.4: "Besides the pool and gymnasium, the
building (the interior of which is not subject to designation) had six bowling alleys, indoor
hardball courts, a grille room, a barber shop, a game room, lockers, lounges, a dining room, a
kitchen, office space, a main meeting room with space for 2,000 people, and twenty-eight bedrooms."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F96.** The elk statue, verbatim from LP-2086 Summary: "A large bronze statue of an elk, based on the
prototype statue designed for the club by the noted sculptor, Eli Harvey, is located on the front
terrace."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F97.** The Elks Bazaar, verbatim from LP-2086 p.5: "The annual 'Elks Bazaar,' considered the
borough's social event of the year, included raffling off two dozen Cadillacs. At the time, the lodge
employed a staff of twenty-six people."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F98.** Decline and sale, verbatim from LP-2086 pp.3 and 5: "The Queensborough Lodge's membership
peaked in the 1960s at 6,600, and included local politicians, businessmen, and professionals." … "By
2000, its ranks had fallen to fewer than 600 members, a decline of ninety percent." … "The building
was sold to the New Life Fellowship Church in 2001, although the lodge's remaining 550 members will
continue to use part of the building for meetings."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ ⚠ **This is a 2001 present-tense statement ("will continue"). Current status is not established by
this source.** Wikipedia corroborates the sale: "New Life Fellowship Church (82-10 Queens Boulevard)
is housed in the building of the Benevolent and Protective Order of Elks, Lodge Number 878."
**P15 — New Life Fellowship Church**, 82-10 Queens Boulevard.

**F99.** ⚠ **An internal contradiction in LP-2086 about the Elks' own founding year.** Summary, p.1,
verbatim: "The Benevolent and Protective Order of Elks is a fraternal organization founded in New
York in 1868 by a group of professional entertainers and actors." Body, p.2, verbatim: "The Benevolent
and Protective Order of Elks (the Elks) was founded in New York City in 1867 as the Jolly Corks…" and
"In February, 1868, the Jolly Corks officially became the Benevolent and Protective Order of Elks."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ 1867 (as Jolly Corks) vs 1868 (as the Elks). Recorded, not resolved.

**F100.** The Ballinger Company. Verbatim from LP-2086 p.3: "The Ballinger Company, a Philadelphia-
based architectural firm, was formed in 1920 by architect Walter Francis Ballinger (1867-1924), who
had been in partnership with Emile G. Perrot in the firm Ballinger & Perrot since 1902." And p.4:
"Its major New York commissions include the American Chicle Co. factory (1919-20, Ballinger &
Perrot) and the Motor Starter Co. factory (1918, Ballinger & Perrot), both in Long Island City, as
well as the Benevolent and Protective Order of Elks, Queensborough Lodge 878 (1923-24) in Elmhurst."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F101.** NRHP listings assigned to Elmhurst. Verbatim table entries: "Benevolent and Protective Order
of Elks, Lodge #878" | "82-10, 82-20 Queens Blvd." | November 19, 2014 | Elmhurst; and "First
Presbyterian Church of Newtown" | "54-05 Seabury St." | September 9, 2013 | Elmhurst.
Source: https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_Queens_County,_New_York
→ ⚠ NRHP gives the Elks a **two-part address** ("82-10, 82-20 Queens Blvd.") where LPC gives only
82-10. Recorded.

**F102.** Wikipedia's Elmhurst landmarks list also asserts NRHP status for St. James Church and the
Reformed Church of Newtown, citing NPS nomination PDFs 99001331 (St. James, dated November 12, 1999)
and 80002751 ("Reformed Church of Newtown Complex", dated April 23, 1980).
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ I was **unable to retrieve either NPS PDF** (NPGallery returned a placeholder image; nps.gov links
in the article are marked dead). **Unverified — flagged for the verifier.**

**F103.** **P16 — Jamaica Savings Bank, Elmhurst branch — a DE-designated landmark.** Verbatim from
Wikipedia: "The Elmhurst branch of the Jamaica Savings Bank was previously a New York City Landmark,
but the designation was removed in 2005."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ Consistent with F48: it does **not** appear in the current LPC dataset. Address not given by this
source. Flagged as a genuinely unusual item worth verifying.

**F104.** **P17 — Colonel Bernardus Bloom Farmhouse**, 90-11 56th Avenue — demolished. Verbatim from
Wikipedia: "The Colonel Bernardus Bloom Farmhouse at 90-11 56th Avenue, which existed from the 17th
century to 2015, was one of the oldest surviving farmhouses in Newtown through the 21st century."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (citing DNAinfo, October 23, 2015, on the
Newtown Civic Association's campaign to save it)
→ **P18 — Newtown Civic Association.**

---

## §E — Churches and religious institutions

> Wikipedia's Religion section is the only source I could retrieve for most of these. It draws heavily
> on **Forgotten NY** (a well-regarded but non-institutional blog), flagged per item.

**F105.** Verbatim list entries from Wikipedia's Religion section (each is a distinct candidate place):

- **P19** "Ascension Roman Catholic Church (86-13 55th Avenue)"
- **P20** "Bangladesh Hindu Mandir (94-39 44th Avenue)"
- **P21** "Christian Testimony Church (87-11 Whitney Avenue)" — "Originally a synagogue—as evidenced
  by the former presence of the word Mizpah (watchtower) above the front door—the building is now a
  Christian church with a congregation composed mainly of Chinese people, with services in both
  English and Mandarin Chinese."
- **P22** "Elmhurst Baptist Church (87-37 Whitney Avenue), founded in 1900, built in 1902. The
  congregation is very diverse and multi-ethnic." … "The church building is constructed of stone."
- **P23** "Elmhurst Islamic Center (EIC) (87-07 55th Avenue)"
- **P24** "Elmhurst Muslim Center (42-12 79th Street)"
- **P25** "Masjid Al Taufiq (41-02 Forley St)"
- **P26** "Geeta Temple Asharam (92-09 Corona Avenue)"
- **P27** "Jain Center of America (43-11 Ithaca Street), founded in 1973"
- **P28** "Satya Narayan Mandir (75-15 Woodside Avenue)"
- **P29** "St. Adalbert Roman Catholic Church (52-29 83rd Street), founded in 1892"
- **P30** "St. Bartholomew's Church (43-22 Ithaca Street), founded in 1906, present structure built in
  1930. The original church, built in 1910, is at Whitney and 43rd Avenues."

Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (raw wikitext)
→ ⚠ **P30 internal problem:** the entry says the church was "founded in 1906" but that "The original
church" was "built in 1910" — and the present structure dates from 1930. Recorded, not resolved.
→ ⚠ **P26** is at **92-09 Corona Avenue** and **P28** at **75-15 Woodside Avenue** — both on streets
named for adjacent neighborhoods. See §N.

**F106.** Whitney Avenue as a religious corridor. Verbatim from Wikipedia: "The majority of Whitney
Avenue, which stretches from 83rd Street in the west to Roosevelt Avenue and 93rd Street to the
northeast, is on a tilted street grid, developed in the early 20th century. The street grid consists
of Broadway; Aske, Benham, Case, Denman, Elbertson, Forley, Gleane, Hampton, Ithaca, Judge, Ketcham,
Layton, Macnish Streets; Ketcham Place; and Baxter, Pettit, Britton, Vietor, Elmhurst, Whitney, and
Lamont Avenues. **Whitney Avenue also has the most religious institutions of any street in
Elmhurst.**"
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (Wikipedia's source is Forgotten NY, March
2014, "WHITNEY AVENUE HOLINESS, Elmhurst")
→ This alphabetical-street grid (Aske, Benham, Case, Denman, Elbertson, Forley, Gleane, Hampton,
Ithaca, Judge, Ketcham, Layton, Macnish) is a strong, checkable, distinctly-Elmhurst feature.

**F107.** **P31 — First Presbyterian Church of Newtown.** Verbatim from Wikipedia's dedicated article:
address "54-05 Seabury St., Elmhurst, New York"; congregation founded 1652; current building 1895;
architect "Frank A. Collins"; parish house by "Meyer & Mathieu"; styles "Late Gothic Revival" and
"Collegiate Gothic"; "Added to NRHP September 9, 2013"; described as "the fifth church complex built
for the congregation."
Source: https://en.wikipedia.org/wiki/First_Presbyterian_Church_of_Newtown
→ ⚠ **ADDRESS CONFLICT.** The Elmhurst article gives its location as "(Queens Boulevard and 54th
Avenue)"; the dedicated article and the NRHP list give "54-05 Seabury St." Recorded, not resolved.
→ Note for the verifier: this church is **NRHP-listed but is NOT a NYC individual landmark** — it is
absent from the LPC dataset (F48). That distinction matters and is easy to get wrong.

**F108.** **P32 — The Rock Church at the former Elmwood Theatre**, 57-02 Hoffman Drive. Verbatim from
Wikipedia: "The Rock Church at Elmwood Theatre (57-02 Hoffman Drive), at 57th Avenue and Hoffman
Drive, is housed in the former Loews Elmwood Theater. The theater, built in 1928, was formerly one of
the largest theaters in the city and currently seats 3,000 people. Its name was a portmanteau word,
composed of the names 'Elmhurst' and 'Woodhaven', the latter alluding to nearby Woodhaven Boulevard.
One of the city's last community theaters, it was considered for demolition in 1968 and in 1999; both
times, the site was planned as an adjunct for the nearby, now-closed, St. John's Queens Hospital. The
theater closed in 2002 and was purchased by the Rock Church, but was temporarily used as a music
venue before the church opened in 2006. The theater has a water tower and a huge sign saying
'Elmwood' on the roof."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ **P33 — St. John's Queens Hospital** (described as "now-closed"). No address given by this source.
→ The Elmhurst/Woodhaven portmanteau is a very strong, distinctly-local detail.

---

## §F — Parks

> All NYC Parks data below retrieved directly (nycgovparks.org 403s WebFetch). Every property page
> below printed "Zip Code: 11373" and "Community Board: 4".

**F109.** **P34 — Elmhurst Park.** Verbatim from NYC Parks: location "Grand Ave., 57 Ave. bet. 74 St.
and 80 St. Queens"; "Park ID: Q492"; "Acreage: 6.22"; "Property Type: Community Park".
Description, verbatim: "Elmhurst Park, once an eyesore and traffic landmark, reopened in 2011 as a
magnificent community greenspace. The site of Elmhurst Park was once the location of two KeySpan
Newtown gas holders, a highway landmark popularly known as the 'Elmhurst gas tanks.' With the support
of the community, the site was sold by KeySpan to the City of New York for $1 and was cleaned up and
returned to the public as open space."
Source: https://www.nycgovparks.org/parks/elmhurst-park
→ ⚠ **Address conflict:** NYC Parks says "Grand Ave., 57 Ave. bet. 74 St. and 80 St."; Wikipedia says
"Elmhurst Park is on 57th Avenue west of 80th Street." Recorded.

**F110.** ⚠ **Tree count conflict inside one NYC Parks page.** The prose says the park "features…
more than 620 trees"; the same page's "Vital Signs" panel reports "370 Mapped Trees".
Source: https://www.nycgovparks.org/parks/elmhurst-park
→ Recorded, not resolved. (Mapped ≠ total is a plausible reconciliation but the page does not say so.)

**F111.** **P35 — Queens Vietnam Veterans Memorial**, in the northeast corner of Elmhurst Park.
Verbatim from NYC Parks: "In the northeast corner of the park, the Queens Vietnam Veterans Memorial
provides a contemplative space that honors those Queens residents who fell during the Vietnam War.
This semi-enclosed granite memorial is illuminated at night." The page's own news headline, verbatim:
"ELMHURST PARK IS NOW HOME TO THE CITY'S FIRST MEMORIAL TO QUEENS VIETNAM VETERANS".
Source: https://www.nycgovparks.org/parks/elmhurst-park
`[PARAPHRASE]` Wikipedia states the memorial was finished in 2019, citing *Queens Daily Eagle*,
December 27, 2019, headlined "Queens' first Vietnam War Memorial finally opens in Elmhurst".
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ NYC Parks says "the City's first"; the Queens Daily Eagle headline says "Queens' first". Different
scopes of claim. Recorded, not resolved.

**F112.** ⚠ **THE ELMHURST GAS TANKS — THREE DIFFERENT REMOVAL DATES.** All verbatim:
- Wikipedia article prose: "For many years, the Elmhurst gas tanks, a pair of large natural gas
  storage structures built in 1910 and 1921 on 57th Avenue between 74th and 80th Streets, were
  well-known landmarks, standing 200 feet high. Because the Long Island Expressway frequently became
  congested in that area, 'backup at the Elmhurst Gas Tanks' became a familiar phrase in radio traffic
  reporting. **The gas storage facilities were removed in 2001.**"
- *New York Times*, September 20, 1993, "Memory-Filled Tanks; Queens Loses 2 Roadside Landmarks", as
  quoted in the article: "The Elmhurst tanks — those 200-foot monoliths that stood sentinel to the
  changing landscape of Queens and as harbingers of hair-tearing delay on the highway to Manhattan —
  **are down, deflated forever**, their skeletal remains waiting to be dismantled".
- *Queens Tribune*, as quoted in the article: "But when the beloved landmarks weren't really doing the
  business anymore **they came down in 1996** and by 2001 there was almost no trace of the tanks that
  once supplied business and homes across the city."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ 1993 (NYT, present tense) vs 1996 (Queens Tribune) vs 2001 (Wikipedia prose). **P36 — Elmhurst gas
tanks (former).** Recorded, not resolved.

**F113.** **P37 — Moore Homestead Playground.** Verbatim from NYC Parks: location "Broadway., 82 St.,
45 Ave. Queens"; "Park ID: Q361"; "Acreage: 1.98"; "Property Type: Neighborhood Park".
History, verbatim: "In the mid-1600s the surviving children of Reverend John Moore (1620-1657) were
granted 80 acres of land in the area in recognition of his contributions to the settlement… Captain
Samuel Moore (1645-1717) built a house here in 1661, and the property was handed down to generations
of his descendants."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history

**F114.** The Newtown Pippin. Verbatim from NYC Parks: "The property is also known as the birthplace
of the famous 'Newtown Pippin' apple which arose from the farm of Gershom Moore, Captain Samuel
Moore's brother. The Newtown Pippin is the oldest commercially grown variety to be bred in the United
States and a famed apple during Colonial times. On December 31, 2013, the City of New York adopted
the Newtown Pippin as their official apple."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history

**F115.** ⚠ A competing account of where the Newtown Pippin arose. Verbatim from Wikipedia: "Among the
English settlers in the present Elmhurst section of Newtown was Gershom Moore, who lived at what is
now the intersection of Broadway, 45th Avenue, and Elmhurst Avenue. A chance seedling on his farm
eventually produced the Newtown Pippin, Colonial America's most famous apple." Wikipedia quotes the
*New York Times*, November 5, 2003: "The Newtown Pippin arose in the late 17th or early 18th century
as a seedling in the Moore family orchard, which stretched from the East River to what is now 54th
Street in Elmhurst (formerly Newtown), Queens."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ NYC Parks locates the origin at the Moore Homestead site (Broadway/82 St/45 Ave); Wikipedia
locates Gershom Moore at Broadway/45th Ave/Elmhurst Ave. Also NYC Parks calls it "the oldest
commercially grown variety to be bred in the United States", Wikipedia "Colonial America's most
famous apple", and the NYT locates the orchard as far west as the East River. Recorded, not resolved.

**F116.** How the Moore site became a park. Verbatim from NYC Parks: "Around the turn of the 20th
century, most of the Moore estate was divided into building lots and sold at auction. The site of the
homestead, however, remained in the family until the Board of Transportation acquired it during the
construction of the Independent Subway in 1930. The buildings were razed in 1933 and the property was
transferred to NYC Parks. In 1954, it was converted to Elmhurst Playground." … "In 1987, the City
Council renamed the playground to commemorate the location of the Moore homestead."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history

**F117.** The 1992 archaeology. Verbatim from NYC Parks: "In 1992, capital reconstruction of the park
was interrupted when workers unearthed a brick cistern formerly used to store water for the old
homestead. Subsequent archaeological investigation determined that the cistern was made of
European-made bricks used as ballast on ships bound for American shores. It contained old foundations
and household goods from 1900 to 1930, such as dishes, bottles, cans, and clothing."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history

**F118.** The 2020 rebuild. `[PARAPHRASE]` NYC Parks states that in 2020 a large-scale redesign was
completed through the **Parks Without Borders** capital initiative, reducing fence heights, increasing
ADA accessibility, upgrading play equipment and spray showers, and adding new ball courts, a new
amphitheater, and native plant species.
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history

**F119.** ⚠ **A genealogical error in an NYC Parks sign.** Verbatim: "Clement Clarke Moore (1779-1863)
was the better-known **ancestor** of Reverend Moore. Born in New York City, Clement spent much of his
boyhood at the family estate in Newtown."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history
→ Clement Clarke Moore (1779-1863) cannot be the *ancestor* of Rev. John Moore (1620-1657); the
relationship runs the other way, and LP-2593 (F65) makes Clement the son of Benjamin Moore
(1748-1816), himself "a Moore descendant". **Recorded as the source's own wording, flagged as
apparently reversed.** Wikipedia's Parks-derived version, verbatim: "The park is named after a nearby
homestead owned by Clement Clarke Moore, whose ancestor John Moore helped negotiate Newtown's land
area with the Native American population there." — i.e. Wikipedia states it correctly.

**F120.** "A Visit from St. Nicholas". Verbatim from NYC Parks: Moore "is best known as the author of
the children's poem, 'A Visit from St. Nicholas,' which he composed poem for his wife Catherine
Elizabeth Taylor Moore and their children in 1822. A family friend had the poem published anonymously
in the Troy Sentinel the following year… The poem became a classic popularly known as 'The Night
Before Christmas' and brought the idea of Santa Claus to mainstream culture. Moore died in Newport,
Rhode Island in 1863."
Source: https://www.nycgovparks.org/parks/moore-homestead-playground/history
→ (The garbled "composed poem for" is in the source; reproduced as-is.)
`[PARAPHRASE]` Wikipedia adds that "the site of his home is now a paved playground at Broadway and
82nd Street" — i.e. Moore Homestead Playground.

**F121.** **P38 — Veterans Grove.** Verbatim from NYC Parks: location "Whitney Ave., 43 Ave., bet.
Judge St. and Ketcham St. Queens"; "Park ID: Q013"; "Acreage: 0.63"; "Property Type: Playground".
History, verbatim: "The City acquired this land from the Cord Meyer Development Company by
condemnation in 1928. It was named Elmhurst Memorial Park at the request of the Elmhurst Post 298 of
the American Legion and renamed Veterans Grove in September 1985."
Source: https://www.nycgovparks.org/parks/veterans-grove/history
→ ⚠ Wikipedia says the park "was renovated in 1994–6" and gives its location as "43rd Avenue by Judge
and Ketcham Streets"; NYC Parks describes a **2017** reconstruction and includes Whitney Avenue in the
location. Recorded. **P39 — Elmhurst Post 298, American Legion.**

**F122.** The WWI dedication and the vanished howitzer. Verbatim from NYC Parks: "This parkland is
dedicated to the memory of those soldiers from Elmhurst who lost their lives serving in World War I.
A World War I-era howitzer once sat in the center of the triangle… Many Parks properties were adorned
with them but at the onset of World War II, they were collected and melted down to be made into to
weapons. The howitzer was replaced by a plaque celebrating all Elmhurst veterans."
Source: https://www.nycgovparks.org/parks/veterans-grove/history

**F123.** **P40 — Walentyna and Aleksander Janta-Połczyński house** (adjacent to Veterans Grove).
Verbatim from NYC Parks: "The home of humanitarian Walentyna Janta-Po?czy?ski and her husband,
Aleksander, was adjacent to this park. During World War II, Walentyna translated reports from the
Polish Underground State into English. They revealed Nazi atrocities, including the existence of
concentration camps in German-occupied Poland, to the United Nations. Walentyna and Aleksander met in
Buffalo, New York after the war and moved into the house in 1960, which became a haven for recent
migrants from Poland. Walentyna stayed in the house until April 2020 when she died at the age of
107."
Source: https://www.nycgovparks.org/parks/veterans-grove/history
→ The `?` characters are mojibake in the retrieved page for the Polish diacritics in
"Janta-Połczyński"; reproduced as retrieved and flagged. **This is one of the richest single facts in
the file and is sourced to a City agency, not a blog.**
→ ⚠ Note the internal tension: they "met in Buffalo… after the war", yet she translated Polish
Underground reports "During World War II". Recorded, not resolved.

**F124.** ⚠ NYC Parks' Veterans Grove sign gives yet another renaming account. Verbatim: "The area was
developed in the 1890s and was known as Newtown… To reflect the change in Newtown's fortunes, and to
disassociate it from the polluted Newtown Creek, it was renamed Elmhurst for the groves of elm trees
in the neighborhood. Elmhurst continued to develop through the 20th and 21st centuries and is now one
of the most diverse communities in the United States, home to immigrants from Asia, South America,
Europe, and Africa."
Source: https://www.nycgovparks.org/parks/veterans-grove/history
→ No year given here. Compare F40's four dates.

**F125.** **P41 — Frank D. O'Connor Playground.** Verbatim from NYC Parks: "Park ID: Q098"; "Acreage:
1.54"; "Property Type: Neighborhood Park". Wikipedia's location, verbatim: "on Broadway between
Woodside Avenue and 78th Street."
History, verbatim from NYC Parks: "This land was formerly part of the settlement of Middleburg,
established in 1652 by English Puritans." … "By the turn of the 20th century, this parcel was part of
a larger landholding owned by Stuard Hirschman, a real estate investor and philanthropist. The tract
remained undeveloped except for dirt paths for several decades." … "In 1935 the Board of
Transportation, which had acquired the property, permitted NYC Parks to use two parcels on the east
and west sides of 78th Street for recreational purposes. The property was developed by the Works
Progress Administration (WPA) in 1937 into a neighborhood playground and sitting area across from each
other." … "The park was named Frank D. O'Connor Playground in 1993, after remaining nameless for
several decades. The sitting area across the street became known as O'Connor's Tail."
Source: https://www.nycgovparks.org/parks/frank-d-oconnor-playground/history
→ ⚠ NYC Parks says the park was **named in 1993**; Wikipedia says "Opened in 1937 and renovated in
1996". **P42 — "O'Connor's Tail"**, the sitting area across 78th Street.

**F126.** Frank D. O'Connor. Verbatim from NYC Parks: "Frank D. O'Connor (1909-1992) led a
distinguished career in public service over four decades. Born in Manhattan to Irish immigrant parents
and raised in Elmhurst, Queens, O'Connor graduated from Newtown High School and Niagara University…
As a defense lawyer, he gained national attention in 1953, when he defended Christopher Emanuel
Balestrero, a musician who had been wrongfully accused of two holdups in Queens. Three years later,
Alfred Hitchcock directed 'The Wrong Man,' a movie based on the case. From 1955 to 1965, O'Connor
served as the Queens District Attorney, after which he was President of the City Council for three
years… his unsuccessful run for Governor against Nelson Rockefeller in 1966. O'Connor was elected to
the State Supreme Court in 1968. In 1976 Governor Hugh L. Carey appointed him to the Appellate
Division."
Source: https://www.nycgovparks.org/parks/frank-d-oconnor-playground/history
→ ⚠ **Birthplace conflict.** NYC Parks: "Born in Manhattan to Irish immigrant parents and raised in
Elmhurst". The *New York Times* obituary quoted by Wikipedia: "Mr. O'Connor was born on the West Side
of Manhattan on Dec. 20, 1909… The family moved to Elmhurst, Queens, the following year." Compatible,
but note the NYT gives a birth date of **December 20, 1909** and Parks gives only the year. Recorded.

**F127.** The hospital's arrival, from the same Parks sign. Verbatim: "It was at this time that City
Hospital (now NYC Health + Hospitals/Elmhurst) moved from Roosevelt Island and opened across the
street in 1957."
Source: https://www.nycgovparks.org/parks/frank-d-oconnor-playground/history
→ Institutional corroboration for F134. Note it places the hospital **across the street from the
playground on Broadway.**

**F128.** **P43 — Newtown Playground.** Verbatim from NYC Parks: "Park ID: Q041"; "Acreage: 0.70";
"Property Type: Neighborhood Park". Wikipedia's location, verbatim: "on 92nd Street and 56th Avenue…
It is one block away from Queens Center Mall and Newtown High School's athletic field."
Source: https://www.nycgovparks.org/parks/newtown-playground ; https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ Newtown Playground's own historical sign is **not about the park's history at all** — it is an
essay titled "Newtown Playground - House Sparrows in New York City Parks". Its only local content is
F16 and the Newtown Pippin/Newtown Creek naming note. Flagged so the verifier does not expect park
history there.

**F129.** The house-sparrow sign, since it is what NYC Parks actually posted in Elmhurst. Verbatim
excerpts: "Only 200 years ago, there were no house sparrows on the entire continent of North America.
Today, it is estimated that there are over 150 million." … "a group of New Yorkers imported eight
pairs from England in 1850 and released them into the city. They survived for a time, but died before
they were able to breed. Soon afterward, Nicholas Pike, the director of the Brooklyn Institute,
traveled to Liverpool, England to collect more sparrows. This time, 100 house sparrows were shipped
back to the city. Half of them were released on arrival in 1851, while the other half were bred in
Green-Wood Cemetery."
Source: https://www.nycgovparks.org/parks/newtown-playground/highlights/historical-signs
→ Note: this content is **not Elmhurst-specific** and would be a poor basis for an Elmhurst page.

**F130.** **P44 — Horsebrook Island** and **P45 — Libra Triangle.** Verbatim from Wikipedia:
"Horsebrook Island is a small triangular green space at the junction of 56th Avenue, Justice Avenue
and 90th Street that was named after a stream that once ran through the Newtown settlement. The creek
was buried in the first three decades of the twentieth century." And: "Libra Triangle is a small
triangular green space at the junction of Justice Avenue and Broadway."
And, from the Streets section, verbatim: "Horse Brook Island is a traffic island at the intersection
of 90th Street, Justice Avenue, and 56th Avenue. The traffic island is reminiscent of the former Horse
Brook, a creek that flowed to the Flushing River from the present-day intersection of Kneeland Avenue
and Codwise Place. The space was renovated from 1986 to 1994."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ Note the article spells it both "Horsebrook Island" and "Horse Brook Island", and Wikipedia cites
a single NYC Parks page (`/parks/libra-triangle/highlights/12231`) titled "Libra Triangle Horsebrook
Island" for both. **Whether these are one park or two is unresolved in the source.** Recorded.

**F131.** Other Parks properties named as nearby on the retrieved pages (candidate places, locations
not independently confirmed): **P46** Hoffman Park, **P47** Simeone Park, **P48** Crowley Playground,
**P49** Long Island Mews, **P50** General Hart Playground.
Sources: the "Other Parks Nearby" panels on
https://www.nycgovparks.org/parks/newtown-playground ,
https://www.nycgovparks.org/parks/elmhurst-park ,
https://www.nycgovparks.org/parks/moore-homestead-playground
→ ⚠ **Lost Battalion Hall Recreation Center** and **Horace Harding Playground** also appear in those
panels but are widely associated with Rego Park/Forest Hills. See §N. I did not retrieve their own
pages.

---

## §G — Health, education, library, civic

**F132.** **P51 — NYC Health + Hospitals/Elmhurst (Elmhurst Hospital Center)**, 79-01 Broadway.
`[PARAPHRASE]` Wikipedia gives the address as "79-01 Broadway, Elmhurst 11373, Queens, New York",
545 beds, a Level I Trauma Center, a teaching hospital in the NYC Health + Hospitals system, tracing
its history to City Hospital founded 1832, with the current structure dating to 1957 and a
renovation from 1989-1996 initially budgeted at $200 million that ultimately cost $250 million.
Source: https://en.wikipedia.org/wiki/NYC_Health_%2B_Hospitals/Elmhurst
→ ⚠ **I could not reach the hospital's own site**: https://www.nychealthandhospitals.org/elmhurst/
redirects to a Radware bot-management challenge (`validate.perfdrive.com`), so **every hospital fact
above rests on Wikipedia alone.** Flagged.
→ Institutional corroboration for the 1957 move exists in NYC Parks (F127).

**F133.** COVID-19. Verbatim from Wikipedia's Elmhurst article: "In March 2020, Elmhurst Hospital
became the 'center of the center' of the COVID-19 pandemic in New York state as the state itself
experienced the most cases in COVID-19 pandemic. The neighborhoods of Corona, East Elmhurst,
Elmhurst, and Jackson Heights were most affected by the pandemic in New York City. As of August 10,
2020, these communities, with a cumulative 303,494 residents, had recorded 12,954 COVID-19 cases and
1,178 deaths."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (citing NYC DOHMH COVID-19 Data by ZIP Code)
→ ⚠ The 303,494 / 12,954 / 1,178 figures are for **four neighborhoods combined**, not Elmhurst.
`[PARAPHRASE]` The hospital article adds that 13 people died in a single day, that the hospital
deployed tents and rented refrigerator trucks for morgue capacity, received 40 ventilators from the
city and 40 BiPAP machines from Tesla, Inc.
Source: https://en.wikipedia.org/wiki/NYC_Health_%2B_Hospitals/Elmhurst

**F134.** **P52 — Elmhurst branch, Queens Public Library.** ⚠ **ADDRESS CONFLICT between the library's
own site and Wikipedia.** QPL's branch page, verbatim: "86-07 Broadway, Elmhurst, NY 11373", phone
"(718) 271-1020". Wikipedia, verbatim: "The Queens Public Library's Elmhurst branch is located at
86-01 Broadway."
Sources: https://www.queenslibrary.org/about-us/locations/elmhurst ; https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ Recorded, not resolved. **Prefer the institution's own page.**

**F135.** The library rebuild. Verbatim from Wikipedia: "The original Elmhurst branch, a Carnegie
library constructed in 1906, was closed in 2011 and demolished in 2012 for a complete rebuild that was
designed to double the building's original size. Planned to be completed in two years, the
reconstruction of the library took more than twice the original expected time and exceeded its $27.8
million budget. The new four-story, 32,000 sqft building, which included elements of the original
structure, was opened to the public in December 2016 at a cost of $32 million."
Wikipedia quotes DNAinfo, December 14, 2016: "The four-story library — which, at 32,000 square feet is
double the size of the original building — will be celebrated with a grand reopening on Tuesday, Dec.
20, officials said."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **Cost conflict inside one article:** prose says "$32 million"; the DNAinfo headline it cites says
"$32.4M". Also ⚠ a *Queens Chronicle* piece cited alongside is headlined "Despite the construction
delays, the project has not gone over budget", which contradicts Wikipedia's "exceeded its $27.8
million budget". Recorded, not resolved.
→ **P53 — the former Carnegie library building (1906–2012), demolished.**

**F136.** Schools. `[PARAPHRASE]` Wikipedia lists PS 7 (Louis F. Simeone), PS 13 (Clement C. Moore),
PS 89 (Elmhurst), PS 102 (Bayview), IS 5 (The Walter Crowley Intermediate School), Newtown High
School, and Cathedral Preparatory School and Seminary.
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ **P54 — Cathedral Preparatory School and Seminary** is the only non-DOE institution here.

**F137.** Demographics — **read this one carefully.** Verbatim from Wikipedia: "Based on data from the
2022 census, the population of Elmhurst was 160,534, an increase of 72,107 from the 88,427 counted in
2010. Covering an area of 750.28 acres, the neighborhood had a population density of 117.9 [per
acre]." Racial makeup, verbatim: "6.7% White, 8.1% African American, 0.2% (133) Native American, 33.8%
Asian, 0.0% (28) Pacific Islander, 0.4% (338) from other races, and 1.6% (1,423) from two or more
races. Hispanic or Latino of any race were 49.6% of the population."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **STRONG CANDIDATE ERROR, FLAGGED FOR THE VERIFIER.** (a) The cited source is
`furmancenter.org/neighborhoods/view/**elmhurst-corona**` — an **Elmhurst-*and*-Corona** area, not
Elmhurst. (b) The same Wikipedia article states two paragraphs later, verbatim: "The entirety of
Community Board 4, which comprises Elmhurst and Corona, had **135,972 inhabitants** as of NYC Health's
2018 Community Health Profile". **160,534 for Elmhurst alone cannot coexist with 135,972 for Elmhurst
plus Corona.** (c) The percentage counts are internally odd: 0.2% is given as 133 people and 1.6% as
1,423 people, which imply a base near 66,500–89,000, not 160,534. Recorded, not resolved — but the
verifier should probably reject the 160,534 figure as an Elmhurst figure.

**F138.** Latino composition. Verbatim from Wikipedia: "Elmhurst's Latino population is 20.4% South
American (9.8% Ecuadorean, 7.2% Colombian, 1.8% Peruvian, 0.4% Argentinean, 0.4% Bolivian, 0.2%
Chilean, 0.2% Venezuelan), 11.6% Mexican, 3.1% Dominican, 1.8% Puerto Rican, 1.5% Central American
(0.5% Salvadoran, 0.4% Guatemalan, 0.3% Honduran), and 0.7% Cuban."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ **Ecuadorean is the single largest Latino origin group listed.** Distinctive and checkable.

**F139.** Community Board 4 health/economic figures, all verbatim from Wikipedia summarising NYC
Health's 2018 Community Health Profile: average life expectancy "85.4 years" (vs "81.2 for all New
York City neighborhoods"); median household income in CB4 in 2022 "$66,480"; "an estimated 17.9% of
Elmhurst and Corona residents lived in poverty, compared to 19% in all of Queens and 20% in all of New
York City"; "Rent burden… is 62% in Elmhurst and Corona, higher than the boroughwide and citywide
rates of 53% and 51% respectively"; uninsured "estimated to be 25%, which is higher than the citywide
rate of 12%"; "For every supermarket in Elmhurst and Corona, there are 16 bodegas."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **All of these are Elmhurst-*and*-Corona figures, never Elmhurst alone.** The CHP document is
literally titled "Elmhurst and Corona (Including Corona, Corona Heights, Elmhurst and Lefrak City)".

**F140.** 2020 census. Verbatim from Wikipedia: "As of the 2020 census data from New York City
Department of City Planning, Elmhurst is primarily populated by 55,800 Asian residents and 42,600
Hispanic residents, however there were between 5,000 to 9,999 White residents and less than 5,000
Black residents."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ 55,800 + 42,600 ≈ 98,400, consistent with an Elmhurst NTA around 105–110k — **and inconsistent with
F137's 160,534.** Recorded.

---

## §H — Malls and commerce

**F141.** **P55 — Queens Center.** Verbatim from Wikipedia's Elmhurst article: "The 150-store Queens
Center, bounded by Queens Boulevard, 57th and 59th Avenues, and 90th and 94th Streets, opened on
September 12, 1973, and was renovated and expanded across 92nd Street in 2002–4."
`[PARAPHRASE]` The dedicated Queens Center article gives the address as **90-15 Queens Boulevard**,
"on Queens Boulevard between 57th Avenue and Woodhaven Boulevard"; developer Taubman Centers; now
owned/managed by Macerich; anchors Macy's (1995), JCPenney (1989), Primark (2024); "over 150" stores;
the JCPenney/Burlington building separately owned by Ashkenazy Acquisition Corp; original 1973 anchors
Abraham & Straus and Ohrbach's; Steinbach 1987-1990.
Sources: https://en.wikipedia.org/wiki/Elmhurst,_Queens ; https://en.wikipedia.org/wiki/Queens_Center
→ ⚠ **SQUARE FOOTAGE CONFLICT between two Wikipedia articles:** the Elmhurst article says "With a
gross leasable area of 1,000,000 sqft"; the Queens Center article says "967,000 square feet". Also
⚠ boundary conflict: "90th and 94th Streets" vs "between 57th Avenue and Woodhaven Boulevard".
Recorded, not resolved.

**F142.** The sales-per-square-foot claim — **the strongest citation in this section.** Wikipedia
quotes the *New York Times*, March 3, 2004, "Commercial Real Estate: Regional Market -- Queens;
Renovations And Renewal For a Mall": "Macerich says that the center had average sales of $953 a square
foot in 2002, the last year for which figures are available; the national average for similar enclosed
shopping regional centers around the country in 2002 was $330 a square foot, according to the
International Council of Shopping Centers."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ These are **2002** figures reported in 2004. Wikipedia's own gloss — "the mall has had retail
sales per square foot nearly triple the national average" — is the article's inference; $953/$330 is
about 2.9×. Do not present as current.

**F143.** **P56 — Fairyland (former amusement park), site of Queens Center.** Verbatim from Wikipedia:
"It was built on land previously occupied by a 24-ride children's amusement park named Fairyland,
which opened in 1949 and closed in 1968. The site was also formerly a supermarket and automobile
parking."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F144.** **P57 — Queens Place Mall**, 88-01 Queens Boulevard. Verbatim from Wikipedia's Elmhurst
article: "The smaller Queens Place, bounded by Queens Boulevard and by Justice, 55th, and 56th
Avenues, is designed in a cylindrical shape and opened in 1965. Originally planned as a traditional
rectangular construction designed to replace several blocks of residences, the mall had to be
redesigned because the owner of the corner house at 55th Avenue and Queens Boulevard, **Mary Sendek**,
refused to sell what had been her childhood home. The site of the corner home was demolished after
Sendek died, and that site is now a small collection of stores."
`[PARAPHRASE]` The dedicated article gives the address 88-01 Queens Boulevard, opening date
**October 11, 1965**, original tenant Macy's, architect **Skidmore, Owings & Merrill**, 440,000 square
feet across 5 floors, and current tenants including Target, Macy's Furniture Gallery, Macy's
Backstage, and Lidl; it says the building was "originally planned to be completely round" but has "a
small notch on one corner" because of a holdout owner.
Sources: https://en.wikipedia.org/wiki/Elmhurst,_Queens ; https://en.wikipedia.org/wiki/Queens_Place_Mall
→ ⚠ Elmhurst article: "opened in 1965"; dedicated article: "October 11, 1965". Compatible.
→ The **Mary Sendek holdout** is a distinctive, highly checkable Elmhurst story.

**F145.** Wikipedia's framing, verbatim: "Elmhurst has two urban shopping malls: Queens Center and the
smaller Queens Place Mall." And from LP-2086 p.2, verbatim: "Development also continued, including the
borough's first enclosed shopping mall, which opened in 1973."
Sources: https://en.wikipedia.org/wiki/Elmhurst,_Queens ; https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ LPC's "the borough's first enclosed shopping mall" is an institutional claim about Queens Center and
is worth verifying — note Queens Place opened **1965**, eight years earlier, but may not have been
"enclosed mall" typologically (it was a single Macy's store). Recorded, not resolved.

---

## §I — Streets, roads and infrastructure

**F146.** Queens Boulevard's construction, verbatim from LP-2086 p.2: "After the Queensborough Bridge
was completed in 1909, new approach roads were needed to accommodate increasing traffic flowing into
the rapidly-developing borough. The construction of Queens Boulevard, an eight-mile-long,
two-hundred-foot wide arterial highway leading from the bridge to the heart of the borough, began in
1910. The new boulevard was completed by 1924, for the most part. In order to accommodate the wide new
road, many buildings along its route were either moved or demolished, and opportunities for new
development were created. **The segment of Queens Boulevard through Elmhurst was completed in 1923,
the same year that construction of the Elks Lodge began.**"
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf
→ This is the single best Elmhurst-specific Queens Boulevard fact I found, and it is institutional.

**F147.** Queens Boulevard's dimensions and reputation. `[PARAPHRASE]` Wikipedia's dedicated article
gives its length as 7.5 miles, widths of 100 ft (Queens Plaza–Van Dam St), 200 ft (Van Dam St–Union
Tpke), 150 ft (Union Tpke–Hillside Ave) and 80 ft (Hillside Ave–Jamaica Ave); says "Much of the road
has 12 lanes, and at its intersection with Yellowstone Boulevard in Forest Hills, it reaches a high
point of 16 lanes"; and states "Due to the high number of crashes, Queens Boulevard is known as the
Boulevard of Death" (also "Boulevard of Broken Bones"). Fatality figures given: 17 deaths in 1993,
18 in 1997, 4 in 2001, 1 in 2004; "Between 1993 and 2000, 72 pedestrians were killed"; "Between 1990
and 2017, 186 people, including 138 pedestrians, died". Speed limit cut from 30 to 25 mph in 2014;
a $100 million Vision Zero initiative began in 2015.
Source: https://en.wikipedia.org/wiki/Queens_Boulevard
→ ⚠ **LP-2086 says "eight-mile-long"; the Wikipedia article says "7.5 miles".** Recorded.
→ ⚠ The 16-lane maximum is **in Forest Hills**, not Elmhurst. Do not transplant it.

**F148.** Queens Boulevard's predecessors. Verbatim from Wikipedia's Elmhurst article: "Queens
Boulevard, a wide at-grade highway that stretches from Long Island City to Jamaica, was formerly
composed of two small dirt roads: Old Jamaica Road and Hoffman Boulevard. In the 1910s, it was paved
and widened to 12 lanes."
And: "Hoffman Drive is a remnant of the wide Hoffman Boulevard. Hoffman Boulevard was straightened and
renamed Queens Boulevard, but a short slip road, Hoffman Drive, leads from 57th Avenue to Woodhaven
Boulevard."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F149.** Newtown's oldest routes. Verbatim from LP-2086 p.4: "The site of the Elks lodge, not far from
the major intersection where Queens Boulevard crosses two of historic Newtown's oldest routes,
Broadway and Grand Avenue, had previously been part of a nearby estate."
Source: https://s-media.nyc.gov/agencies/lpc/lp/2086.pdf

**F150.** 57th Avenue's origin. Verbatim from Wikipedia: "57th Avenue was known as the Flushing and
Newtown Turnpike. Built in 1801, it connected with present-day Flushing Avenue in Maspeth, and
extended all the way to Williamsburg, Brooklyn." (Wikipedia cites James Riker, *The Annals of Newtown,
in Queens County, New-York*, D. Fanshaw, 1852, p. 258.)
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ **Riker's *Annals of Newtown* (1852) is a period primary source available on archive.org and is the
obvious next stop for anyone verifying colonial Newtown claims.**

**F151.** Justice Avenue and the town hall. Verbatim from Wikipedia: "Justice Avenue, an Elmhurst road
that has existed since the American colonial period, follows an unusual curved path through Elmhurst
due to a now-defunct railroad line immediately to the south. Its name relates to the former Newtown
Town Hall that stood at the intersection of Justice Avenue and Broadway."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ **P58 — Newtown Town Hall site**, Justice Avenue and Broadway. No longer extant.

**F152.** Woodhaven Boulevard's original name. Verbatim from Wikipedia: "Woodhaven Boulevard was known
as Trotting Course Lane because it was named when horses were the main mode of transport. Although it
extends to Cross Bay Boulevard in the Rockaways, two small parts of the original lane still exist in
Forest Hills."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ ⚠ **This directly bears on Remsen Cemetery**, whose LPC address is "69-43 Trotting Course Lane"
(F53) — and Wikipedia places surviving Trotting Course Lane **in Forest Hills**, while the LPC dataset
codes the cemetery to Rego Park and LPC prose calls it Elmhurst. See §N.

**F153.** Horace Harding Expressway. Verbatim from Wikipedia: "Horace Harding Expressway was once a
turnpike called Nassau Boulevard, which went from Elmhurst to Flushing, Bayside, and Little Neck. It
was renamed for Horace J. Harding (1863–1929), a finance magnate who directed the New York, New Haven
and Hartford Railroad and the New York Municipal Railways System; Harding encouraged city planner
Robert Moses's system of parkways on New York, and after Harding died, the boulevard—now the service
road of the Long Island Expressway—was renamed after him."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F154.** Elks Road and the Mathews flats. Verbatim from Wikipedia: "The Elks Lodge's name is shared by
a local street, Elks Road, a short road in a cluster of 2- and 3-story orange and yellow brick
buildings located between Grand Avenue, 79th Street, and Calamus Avenue, that were built in 1930 by
Louis Allmendinger for the Matthews Company."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (citing Forgotten NY, April 2002,
"MASPETH, Queens")
→ ⚠ **The cited Forgotten NY article is titled "MASPETH, Queens"** — the source itself may place Elks
Road in Maspeth. See §N. Also note the spelling "Matthews Company"; the Mathews Model Flats are
usually spelled with one 't'. Recorded.

---

## §J — Transit

**F155.** **AUTHORITATIVE MTA STATION DATA.** Verbatim field values from the MTA subway stations
dataset, `$where=borough='Q'`:

| stop_name | line | daytime_routes | structure | ada | gtfs_stop_id |
|---|---|---|---|---|---|
| `Elmhurst Av` | `Queens Blvd` | `M R` | `Subway` | `0` | `G13` |
| `Grand Av-Newtown` | `Queens Blvd` | `M R` | `Subway` | `0` | `G12` |
| `Woodhaven Blvd` | `Queens Blvd` | `M R` | `Subway` | `0` | `G11` |
| `Jackson Hts-Roosevelt Av` | `Queens Blvd` | `E F M R` | `Subway` | `1` | `G14` |
| `90 St-Elmhurst Av` | `Flushing` | `7` | `Elevated` | `0` | `708` |
| `82 St-Jackson Hts` | `Flushing` | `7` | `Elevated` | `0` | `709` |
| `74 St-Broadway` | `Flushing` | `7` | `Elevated` | `1` | `710` |
| `Junction Blvd` | `Flushing` | `7` | `Elevated` | `1` | `707` |
| `Woodhaven Blvd` | `Jamaica` | `J Z` | `Elevated` | `1` | `J15` |

Source: https://data.ny.gov/resource/39hk-dx4f.json
→ ⚠ **TWO DIFFERENT STATIONS ARE NAMED "Woodhaven Blvd"** — one on the Queens Boulevard Line (M R,
the Elmhurst-area one) and one on the Jamaica Line (J Z, far to the south). Any page must
disambiguate.
→ ⚠ **ADA: only Jackson Hts-Roosevelt Av, 74 St-Broadway and Junction Blvd are accessible (`ada`=1).
Elmhurst Av, Grand Av-Newtown, Woodhaven Blvd and 90 St-Elmhurst Av are `ada`=0.** Note
`74 St-Broadway` and `Jackson Hts-Roosevelt Av` share `complex_id` `616` — one complex.

**F156.** Wikipedia's transit statement, verbatim wikitext: "New York City Subway stations include
Jackson Heights–Roosevelt Avenue, Woodhaven Boulevard, Grand Avenue–Newtown, and Elmhurst Avenue, all
served by the {{NYCS trains|**Queens local**}} of the IND Queens Boulevard Line. In addition, the IRT
Flushing Line, served by the {{NYCS trains|Flushing}}, runs along Roosevelt Avenue, the north border
of Elmhurst, with stations at 74th Street–Broadway, 82nd Street–Jackson Heights, and 90th
Street–Elmhurst Avenue."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (raw wikitext)
→ **Correction to my own earlier note, disclosed for honesty:** a WebFetch *summary* of this article
reported the four Queens Boulevard stations as served by "E, F, M, and R". The raw wikitext says
"Queens local", which matches MTA's `M R`. **The "E F M R" reading was a summarizer artifact, not a
Wikipedia claim.** The verifier should use F155.
→ ⚠ Remaining genuine conflict: Wikipedia groups **all four** stations as "Queens local", but MTA
gives Jackson Hts-Roosevelt Av as `E F M R`. Recorded.
→ ⚠ **Three of the seven stations Wikipedia claims for Elmhurst are named for Jackson Heights or
Roosevelt Avenue** (Jackson Heights–Roosevelt Avenue, 82nd Street–Jackson Heights, 74th
Street–Broadway). See §N.

**F157.** Buses. Verbatim from Wikipedia: "Local buses include the Q11, Q14, Q29, Q47, Q52 SBS, Q53
SBS, Q58, Q59, Q60, Q72, Q88, Q98… Express buses going to and from Manhattan during weekday rush hours
include the QM10, QM11, QM12, QM40, QM42."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ Not independently confirmed against an MTA dataset. Flagged.

**F158.** Airport and highway connections. Verbatim from Wikipedia: "Elmhurst is connected to Manhattan
and Jamaica by Queens Boulevard, and is connected to John F. Kennedy International Airport by
Woodhaven Boulevard and to LaGuardia Airport by Junction Boulevard."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens

**F159.** **Vanished rail.** Verbatim from Wikipedia: "Elmhurst also was the site of the Grand Street
LIRR station just west of the current Grand Avenue – Newtown subway station. The Grand Street LIRR
station was served by the Main Line and the former Rockaway Beach Branch."
And, from F43: the Cord Meyer development was "north of the Port Washington Branch railroad station"
(the **Elmhurst LIRR station**, which Wikipedia links as `Elmhurst station (LIRR)`).
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens
→ Two former LIRR stations in Elmhurst — Grand Street (Main Line/Rockaway Beach Branch) and Elmhurst
(Port Washington Branch). Neither is in service. Strong "lost infrastructure" vein; I could not
retrieve either dedicated article.

---

## §K — Immigration, the Chinatown, and food

**F160.** The Elmhurst Chinatown. Verbatim from Wikipedia: "Elmhurst's growing Chinatown is the second
largest in Queens, the other Chinatown being located in Flushing. Previously a small area with Chinese
shops on Broadway between 81st Street and Cornish Avenue, this newly evolved second Chinatown in
Queens has now expanded to 45th Avenue and Whitney Avenue and is developing as a satellite of the
Flushing Chinatown."
And: "There are also many other Southeast Asian businesses and shops in the area, including Malaysian
Chinese, Singaporean Chinese, Indonesian, Thai, and Vietnamese. Hong Kong Supermarket and New York
Supermarket serve as the largest Chinese supermarkets selling different food varieties to the Elmhurst
Chinatown. The Cathay Bank serves as the only Chinese bank and the main financial resource business
for the growing enclave… Like Flushing's Chinatown, it is also very highly populated by Mandarin
speakers, although many also speak other varieties of Chinese."
And: "Since the 2000s, Elmhurst Chinatown has expanded to the nearby neighborhood of Corona, Queens."
Sources: https://en.wikipedia.org/wiki/Elmhurst,_Queens ; https://en.wikipedia.org/wiki/Chinatowns_in_Queens
→ The Chinatowns-in-Queens article adds, verbatim: "An annexation of the Elmhurst Chinatown is the
neighborhood of Corona, emerging as a Chinatown geographically connecting the larger Chinatowns in
Flushing and Elmhurst."
→ Named businesses here: **Hong Kong Supermarket**, **New York Supermarket**, **Cathay Bank
(Elmhurst branch)**.

**F161.** **DOHMH AGGREGATE PROFILE — read the sourcing caveat below.** Querying the DOHMH restaurant
inspection dataset for `zipcode='11373'` returned 3,482 inspection rows resolving to **265 unique
establishments**. Verbatim cuisine tallies (`cuisine_description` field):
Chinese 38, Latin American 27, Bakery Products/Desserts 23, Coffee/Tea 22, **Thai 18**, American 15,
Asian/Asian Fusion 12, Mexican 11, Japanese 10, Pizza 9, **Southeast Asian 7**, Chicken 6,
Juice/Smoothies/Fruit Salads 5, Hamburgers 5, Tex-Mex 4, **Peruvian 4**, Frozen Desserts 3,
**Indonesian 3**.
Street tallies: Queens Boulevard 61, Broadway 60, **Corona Avenue 24**, Grand Avenue 18, 82 Street 14,
**Woodside Avenue 12**, Junction Boulevard 10, Whitney Avenue 7, Baxter Avenue 7, 59 Avenue 5,
43 Avenue 5, 45 Avenue 4, Justice Avenue 4, 75 Street 3, 74 Street 3.
Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json
→ **The aggregate shape is defensible: an Elmhurst page can honestly say the ZIP's restaurant
registry skews Chinese, Latin American and Thai, with a small but real Indonesian presence.** That is
a claim about the dataset, not about any one business.

**F162.** ⚠ **SOURCING CONSTRAINT — READ BEFORE WRITING ANY RESTAURANT.** For **every individual
restaurant named below, the DOHMH inspection dataset is the ONLY source I obtained.** I have no
review, no press coverage, no institutional listing, and no proprietor statement for any of them.
WebSearch was unavailable, so I could not seek corroboration. Verbatim `dba` / `building` / `street`
/ `cuisine_description` values, offered strictly as leads:

- Indonesian: `AWANG KITCHEN` 84-05 Queens Boulevard; `SUMATERA` 86-20 Whitney Avenue;
  `ASIAN TASTE 86` 86-10 Whitney Avenue
- Malaysian/SE Asian: `TASTE GOOD` 82-18 45 Avenue; `SUMMER` 85-36 Grand Avenue;
  `TASTE OF HIMALAYA` 75-16 Broadway; `JOJU / JOJU BOWL` 83-25 Broadway
- Thai (Broadway/Whitney cluster): `BOON CHU` 83-18 Broadway; `EIM KHAO MUN KAI` 81-32 Broadway;
  `JAI SANG MA` 81-40 Broadway; `SARAN ROM` 81-10 Broadway; `SABAY THAI` 75-19 Broadway;
  `CHAO THAI` 85-03 Whitney Avenue; `NA RATH` 86-08 Whitney Avenue; `EATERNITI` 89-30 Queens Boulevard
- Thai (**Woodside Avenue cluster — see the adjacency flag below**): `AYADA` 77-08 Woodside Avenue;
  `ZAAB ZAAB` 76-04 Woodside Avenue; `KHAO KANG` 76-20 Woodside Avenue;
  `SPICY SHALLOT` 77-01 Woodside Avenue; `PATA PA-PLEAN` 76-21 Woodside Avenue;
  `HUG ESAN` 77-16 Woodside Avenue; `TEA CUP CAFE` 76-23 Woodside Avenue
- Chinese: `CORNER 28` 86-55 Broadway; `LAO BEI FANG DUMPLING HOUSE` 83-05 Broadway;
  `SHAXIAN SNACKS` 83-29 Broadway; `TAIWANESE CUISINE` 84-02 Broadway;
  `KULU DESSERTS / DUMPLING TOWN` 86-55 Broadway
- Filipino: `FILIPINIANA` 84-05 Queens Boulevard; `SARILING ATIN` 89-12 Queens Boulevard;
  `LAHI` 51-24 Van Loon Street
- Peruvian (**all on Corona Avenue or 43 Avenue**): `COSTA VERDE` 94-59 Corona Avenue;
  `LA UNION RESTAURANT` 91-18 Corona Avenue; `SONEROS` 92-02 Corona Avenue;
  `SABOR PERUANO IV` 90-28 43 Avenue

Source: https://data.cityofnewyork.us/resource/43nn-pn8j.json
→ ⚠ **ADJACENCY FLAG.** The seven-restaurant Thai cluster at 76xx–77xx **Woodside Avenue** carries
ZIP 11373 (Elmhurst) in DOHMH but sits on a street named for Woodside. I checked the completed
Woodside finder (`docs/queens/woodside-finder.md`): it contains **no** occurrence of "Ayada", "Zaab",
"Khao Kang", "Spicy Shallot", "Little Thailand" or "11373", so this cluster was **not** claimed in
wave 2 — but it remains genuinely contested. See §N.
→ ⚠ Note also `SATYA NARAYAN MANDIR` (P28) at 75-15 Woodside Avenue, same corridor.
→ I attempted https://en.wikipedia.org/wiki/Little_Thailand_Way (404) and could not establish whether
a "Little Thailand Way" co-naming exists on this stretch. **Unresolved; do not assert it.**

**F163.** ⚠ **Corona Avenue caution.** 24 of the 265 ZIP-11373 establishments are on **Corona
Avenue**, including all three Peruvian restaurants listed above and the Geeta Temple Ashram (P26).
Corona Avenue runs through both neighbourhoods. See §N.

---

## §L — People and popular culture

**F164.** Notable residents, with the citation Wikipedia attaches to each (all quotations are from the
cited outlet as reproduced by Wikipedia):

- **Harry Belafonte** (1927–2023) — *The New Yorker*, August 26, 1996: "In 1953, enjoying his first
  real taste of affluence, Belafonte moved from Washington Heights into a white neighborhood in
  Elmhurst, Queens."
- **William J. Casey** (1913–1987), Director of the CIA — *New York Times* obituary, May 7, 1987:
  "William Joseph Casey was born on March 13, 1913, in Elmhurst, Queens".
- **Antonin Scalia** (1936–2016) — *New York Times*, February 14, 2016: "He spent much of his
  childhood in a red brick home in Elmhurst, a neighborhood of Queens that is now largely Asian and
  Latino." Wikipedia adds he "attended PS 13".
- **Fumio Kishida** (born 1957), former Prime Minister of Japan — *Patch*, September 30, 2021: "In
  1963, when he was six years old, Kishida moved with his family to Queens for his father's job. He
  attended second and third grade at P.S. 13 in Elmhurst".
- **Carroll O'Connor** (1924–2001) — *New York Times*, June 22, 2001: "The O'Connors lived well, at
  first in the Bronx, later in a larger apartment in Elmhurst, Queens, and finally in a nice
  single-family home in Forest Hills, Queens".
- **Tony Pastor** (1832–1908), "sometimes called 'The Father of [American] Vaudeville'" — *New York
  Times*, August 27, 1908, headlined in part: "Famous Theatrical Man Expires After a Long Illness at
  His Elmhurst, L. I., Home."
- **Patty Duke** (1946–2016) — *Los Angeles Times*, March 29, 2016: "The actress was born Anna Marie
  Duke on Dec. 14, 1946, in Elmhurst, N.Y."
- **Omar Minaya** (born 1958), former Mets GM — *New York Times*, June 18, 2002: "raised since age 8
  in Elmhurst, Queens"; Wikipedia notes he is a Newtown High School alumnus.
- **Homeboy Sandman** (born 1980) — *The Guardian*, April 25, 2015: "Sandman grew up in the
  multicultural Elmhurst neighborhood of Queens".
- **Eric B** (born 1963) — Long Island Music Hall of Fame: "Eric B. was born in Elmhurst, Queens".
- **Charlie Villanueva** (born 1984) — ESPN, December 3, 2008: "I grew up in New York City, in a
  neighborhood called Elmhurst, in Queens."
- **Joan Hackett** (1934–1983) — *New York Times*, October 10, 1983: "The Hacketts soon moved to
  Elmhurst, Queens".
- **Lindy Remigino** (1931–2018), two-time 1952 Olympic gold medallist; **Bill Kenville** (1930–2018),
  NBA; **Smush Parker** (born 1981), NBA, "attended Newtown High School"; **Brian Brady** (born 1962),
  MLB; **Tommie Agee** (1942–2001), MLB; **Mose Allison** (1927–2016), jazz; **Julissa Bermudez**
  (born 1983); **Jessica Ramos** (born 1985), politician; **Dixie Roberts**, Ziegfeld Follies dancer;
  **Risë Stevens** (1913–2013), opera, "attended Newtown High School" `{{citation needed}}`;
  **Tommy Rettig** (1941–1996), "who played 'Jeff' on the Lassie TV series, attended PS 89"
  `{{citation needed}}`.
- **Clement Clarke Moore**, **Benjamin Moore**, **John Moore** — see §B/§F.

Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (raw wikitext, citations as printed)
→ ⚠ Risë Stevens and Tommy Rettig carry Wikipedia's own `{{citation needed}}` tags dated August 2017.
Flagged.
→ ⚠ Carroll O'Connor's citation says the family **ended up in Forest Hills** — an adjacency trap.

**F165.** **McDowell's / *Coming to America*.** Verbatim from Wikipedia: "McDowell's, the fictional
restaurant depicted in the 1988 film *Coming to America*, is located in Elmhurst. For the week-long
shot, the filmmakers cosmetically altered an existing Wendy's restaurant, which was closed in May 2013
and was razed by December 2013 to make way for condominiums. Images of surrounding streets were also
used in the movie."
Source: https://en.wikipedia.org/wiki/Elmhurst,_Queens (citing *Gothamist*, June 16, 2013, and a *Wall
Street Journal* blog post, June 14, 2013, headlined "Queens Boulevard Loses a Movie Icon, Disguised as
a Fast Food Joint")
→ **The WSJ headline places it on Queens Boulevard.** The building no longer exists — this is a
"vanished landmark" item, not a visitable one. Flagged so no one writes it as a destination.

---

## §M — Flushing Meadows Corona Park: DO NOT DUPLICATE

**F166.** The LPC dataset places the **Unisphere and Surrounding Reflecting Pool** (LP-01925,
designated 5/16/1995, address "Flushing Meadows-Corona Park") in `nta2020` = `QN8191`, `cd` = `481` —
**a separate NTA and a Joint Interest Area, in neither CD4 nor CD6.**
Source: https://data.cityofnewyork.us/resource/buis-pvji.json

**F167.** `[PARAPHRASE]` **Ethos.Seeds.CitiFieldPlaces already owns eight places inside Flushing
Meadows Corona Park** — Citi Field, the Unisphere, the Queens Museum, the New York Hall of Science,
the Queens Zoo, the USTA Billie Jean King National Tennis Center, the New York State Pavilion and the
Queens Theatre — under county "Queens", towns "Flushing" and "Corona".
→ **NONE of these may be re-created in the Elmhurst seed under any slug.** Elmhurst does not border
the park in any case (F2 puts Elmhurst's eastern boundary at Junction Boulevard; the park lies east of
that, beyond Corona). **The correct move for any Elmhurst page is to link to `/g/citi-field-guide`,
which is live. Link; do not narrate.** Recorded here so the writer cannot miss it.
→ Note the one real Elmhurst connection: Horse Brook, the buried creek behind Horsebrook Island
(F130), "flowed to the Flushing River" — the river that Flushing Meadows was built around. That is a
legitimate one-sentence link, not a licence to describe the park.

---

## §N — Contested neighbourhood assignments (recorded, NOT resolved)

> Per the brief: for every place any source assigns to a different one of Corona / Elmhurst /
> Forest Hills / Rego Park, the row below records **what each source says** and takes no position.

| # | Place | Address as given | Source A says | Source B says | Notes |
|---|---|---|---|---|---|
| N1 | **Remsen Cemetery** | "adjoining 69-43 Trotting Course Lane" (LPC data); "between Alderton Street and Trotting Course Lane" (LP-1177) | **Elmhurst** — LP-2086 p.2 and LP-2131 p.4 both list it among "Elmhurst's other designated New York City Landmarks" | **Rego Park** — LPC dataset `nta2020`=`QN0601`, `cd`=`406` | LP-1177 itself names **no neighbourhood**. Wikipedia says surviving stretches of Trotting Course Lane are **in Forest Hills** (F152). Three-way. |
| N2 | **Edward E. Sanford House / 102-45 47th Avenue House** | `102-45 47th Avenue` (LPC data) vs `107-45 47th Avenue` (LP-2086, LP-2131) | **Elmhurst** — LP-2086 p.2, LP-2131 p.4 | **Corona** — LPC dataset `nta2020`=`QN0402` | 1987 report LP-1292 names no neighbourhood and calls it only "102-45 47th AVENUE HOUSE"; it also says the site was in Benjamin W. Hitchcock's "**Village of West Flushing**", Corona's former name. Name, address AND neighbourhood all contested. |
| N3 | **Congregation Tifereth Israel** | `109-18 54th Avenue` (LPC data) vs `109-20 54th Ave.` (NRHP list) | **Corona** — LPC dataset `nta2020`=`QN0402`; NRHP list neighbourhood field "Corona" | — | Not claimed for Elmhurst by any source I found, but it is in **CD 404** alongside Elmhurst and the address differs between two official sources. Recorded for completeness. |
| N4 | **Fire Engine Company 289, Ladder Company 138** | `97-28 43rd Avenue` | **Corona** — LPC dataset `nta2020`=`QN0402`, `cd`=`404` | — | Same CD as Elmhurst. Do not import. |
| N5 | **LeFrak City** | "between Junction Boulevard to the west, 57th Avenue to the north, 99th Street to the east, and the Long Island Expressway to the south" | **"the southernmost region of Corona and the easternmost part of Elmhurst"** — Wikipedia's dedicated article, verbatim | **Elmhurst** — Wikipedia's Elmhurst Land Use section lists it among Elmhurst's "large developments" | Also: NYC Health's 2018 CHP is titled "Elmhurst and Corona (Including Corona, Corona Heights, Elmhurst and **Lefrak City**)"; and a source cited in the LeFrak article says Akinyele Adams "grew up in the sprawling LeFrak City co-op complex in **Rego Park**". **FOUR assignments.** |
| N6 | **Elmhurst African American Burial Ground** | "Corona Avenue and 90th Street" | **Elmhurst** — Preservation League of NYS calls it the "Elmhurst African American Burial Ground"; Wikipedia carries it in the Elmhurst article | The address is on **Corona Avenue** | The organisation advocating for it is the "**Elmhurst** History and Cemeteries Preservation Society"; the successor church moved "to **Jackson Heights**". |
| N7 | **Geeta Temple Asharam** | `92-09 Corona Avenue` | **Elmhurst** — Wikipedia's Elmhurst Religion list | Address is on **Corona Avenue** | Unresolved. |
| N8 | **Satya Narayan Mandir** | `75-15 Woodside Avenue` | **Elmhurst** — Wikipedia's Elmhurst Religion list | Address is on **Woodside Avenue** | Same corridor as N9. |
| N9 | **Thai restaurant cluster on Woodside Avenue** (Ayada 77-08, Zaab Zaab 76-04, Khao Kang 76-20, Spicy Shallot 77-01, Pata Pa-Plean 76-21, Hug Esan 77-16, Tea Cup Cafe 76-23) | 76xx–77xx **Woodside Avenue** | **Elmhurst** — DOHMH records all seven under `zipcode` `11373` | Street is named for **Woodside** | Counted as ONE row. The wave-2 Woodside finder did **not** claim any of them (verified by reading the file). Only source for each is DOHMH — see F162. |
| N10 | **Peruvian restaurants on Corona Avenue** (Costa Verde 94-59, La Union 91-18, Soneros 92-02) | Corona Avenue | **Elmhurst** — DOHMH `zipcode` `11373` | Street named for **Corona**; 94-59 is east of Junction Blvd numbering | DOHMH-only sourcing. |
| N11 | **Jackson Heights–Roosevelt Avenue station** | Roosevelt Ave / Broadway | **Elmhurst** — Wikipedia's Elmhurst Transportation section lists it first | Station is **named for Jackson Heights**; MTA `stop_name` = `Jackson Hts-Roosevelt Av` | Roosevelt Avenue is Elmhurst's *boundary* (F2), so the station sits on the line. |
| N12 | **82nd Street–Jackson Heights station** | Roosevelt Ave & 82 St | **Elmhurst** — Wikipedia's Elmhurst Transportation section | **Named for Jackson Heights**; MTA `stop_name` = `82 St-Jackson Hts` | Same boundary problem. |
| N13 | **74th Street–Broadway station** | Roosevelt Ave & 74 St | **Elmhurst** — Wikipedia's Elmhurst Transportation section | Shares `complex_id` `616` with Jackson Hts-Roosevelt Av | Same boundary problem. |
| N14 | **Junction Boulevard station** | Roosevelt Ave & Junction Blvd | Not claimed by the Elmhurst article | Junction Boulevard is Elmhurst's **eastern boundary** (F2) — the far side is Corona/North Corona | Recorded so it is not silently claimed. |
| N15 | **Woodhaven Boulevard station (IND Queens Blvd Line)** | Queens Blvd & Woodhaven Blvd | **Elmhurst** — Wikipedia's Elmhurst Transportation section | A **second, different station of the same name** exists on the Jamaica Line (`J Z`) far to the south | Name collision, not a neighbourhood dispute — but equally capable of producing a wrong page. |
| N16 | **Queens Center** | `90-15 Queens Boulevard`; "Queens Boulevard, 57th and 59th Avenues, and 90th and 94th Streets" | **Elmhurst** — both Wikipedia articles | The dedicated article also describes it as "between 57th Avenue and **Woodhaven Boulevard**", the Rego Park approach | Boundary descriptions conflict (F141); assignment itself is not seriously disputed. |
| N17 | **Elks Road / the 1930 Mathews flats** | "between Grand Avenue, 79th Street, and Calamus Avenue" | **Elmhurst** — Wikipedia's Elmhurst Streets section | Wikipedia's own cited source is Forgotten NY's article titled "**MASPETH**, Queens" | Recorded. |
| N18 | **Elmhurst Park** | "Grand Ave., 57 Ave. bet. 74 St. and 80 St." (NYC Parks) | **Elmhurst** — NYC Parks, Zip 11373, CB 4 | Its "Other Parks Nearby" list is headed by **Juniper Valley Park** (Middle Village/Maspeth) | Western edge abuts Maspeth, not one of this wave's four. Recorded. |
| N19 | **Lost Battalion Hall Recreation Center** | — | Appears in NYC Parks' "Other Parks Nearby" panel for **Newtown Playground** (0.37 mi) | Widely associated with **Rego Park** | I did **not** retrieve its own page. Do not claim for Elmhurst without checking. |
| N20 | **Horace Harding Playground** | — | Appears in NYC Parks' "Other Parks Nearby" panel for **Newtown Playground** (0.52 mi) | Named for the **Horace Harding Expressway**, the LIE service road that forms Elmhurst's *southern boundary* | Same caution as N19. |
| N21 | **Flushing Meadows Corona Park and everything in it** | — | `nta2020` = `QN8191`, a Joint Interest Area in **neither** CD4 nor CD6 | Already owned by **Ethos.Seeds.CitiFieldPlaces** under towns "Flushing" and "Corona" | **Hard exclusion, not a genuine dispute.** See §M. Link to `/g/citi-field-guide`; do not narrate. |

---

## §O — Gaps, and what I could not reach

**F168.** **Sources I attempted and failed to retrieve** (so the verifier does not assume I skipped
them):
- `https://www.nychealthandhospitals.org/elmhurst/` — 302 to a Radware bot-management challenge.
  **All hospital facts therefore rest on Wikipedia alone.**
- NPS/NPGallery NRHP nomination PDFs for St. James Church (99001331), Reformed Church of Newtown
  Complex (80002751), First Presbyterian Church of Newtown (13000696) and the Elks (14000938) — the
  nps.gov links are dead and NPGallery returned a placeholder PNG. **NRHP claims are unconfirmed at
  the primary level.**
- `https://en.wikipedia.org/wiki/Little_Thailand_Way` — 404. Whether a Thai co-naming exists on the
  Woodside Avenue corridor is **unestablished**.
- `https://en.wikipedia.org/wiki/Elmhurst_Gas_Tanks` and `Newtown High School (New York City)` — both
  are redirects with no independent content.
- DCP's 2020 community district profiles PDF — 403.

**F169.** **Topics in the brief I found little or nothing on, directly:**
- **The waterfront.** Elmhurst has none. Its boundaries (F2) are entirely inland; the historic *Town*
  of Newtown reached the East River and Flushing Bay (F5), but present-day Elmhurst does not. The only
  water is the **buried** Horse Brook (F130) and the nearby, notoriously polluted **Newtown Creek**,
  which appears in every renaming story (F40) as the thing Elmhurst was named to get *away* from.
  **This is a real structural feature of the neighbourhood, not a research gap.**
- **Industrial history.** Thin. Wikipedia's Land Use section says only, verbatim: "Light-manufacturing
  zones are located near the western end of the neighborhood, mainly between the LIRR's Port
  Washington Branch and 51st Avenue." LP-2131 p.4 notes 1930s "additional commercial and industrial
  development". No individual factory was identified.
- **Museums.** I found **none** in Elmhurst. The obvious candidates (Queens Museum, New York Hall of
  Science) are in Flushing Meadows Corona Park and are already owned elsewhere (§M).

**F170.** **The strongest, best-sourced veins for a writer**, in my assessment as finder (this is a
judgement about *source quality*, not a verdict on any fact):
1. **Old Saint James Episcopal Church** — a 30-page LPC report, read in full, with a hedged and
   precise significance claim (F58) and a documented slave gallery (F67).
2. **Newtown High School** — an equally detailed LPC report with a 169-foot tower, a fire that
   destroyed the drawings, and a 112-nations enrolment story that three sources repeat.
3. **The Moore family thread**, which ties Rev. John Moore (1652) → the Newtown Pippin → Benjamin
   Moore → Clement Clarke Moore → "The Night Before Christmas", all on NYC Parks and LPC letterhead.
4. **The Elmhurst gas tanks → Elmhurst Park → Queens Vietnam Veterans Memorial** sequence: an eyesore
   sold to the City for $1 and turned into a park, with a traffic-report catchphrase attached.
5. **Walentyna Janta-Połczyński** (F123) — a City agency's own sign, and a remarkable story.
6. **The Elmhurst African American Burial Ground** (F31–F34) — Preservation League + NYT.
7. **The Elks Lodge → New Life Fellowship Church** conversion, with a bronze elk and six bowling
   alleys documented by LPC.
8. **Mary Sendek's holdout house** and the round windowless Macy's it produced (F144).

**F171.** **A closing caution for the verifier.** This file deliberately surfaces a large number of
source-vs-source conflicts (F3, F6, F10, F13, F16, F23, F27, F36/F37, F38, F40, F42, F44, F49–F52,
F53, F55, F60, F62, F74, F78, F93, F99, F109, F110, F111, F112, F115, F119, F121, F125, F126, F130,
F134, F135, F137, F141, F145, F147, F156). **I have adjudicated none of them.** Several — F55's
"April 31, 1768", F119's reversed genealogy, F137's population figure, F62's "King George III" — look
to me like plain errors in the sources, but saying so is the verifier's job, not mine, and I have
confined myself to marking them ⚠ and quoting both sides.

---

*End of finder file. 171 candidate facts, 58 candidate places, 21 contested-assignment rows.
Nothing above is confirmed.*
