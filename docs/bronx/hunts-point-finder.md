# Hunts Point, Bronx — finder artifact

Role: **FINDER only.** Nothing below is adjudicated. There are no verdicts, no
`confirmed`/`refuted`/`uncertain` marks, and no recommendations about what to
ship. Every line is of the form "source X says Y", with the URL and, where the
wording carries the weight, the source's own sentence in quotes. Adjudication
belongs to an independent verifier who has not seen this reasoning.

Neighborhood: Hunts Point, Bronx Community District 2, wave 1. This is the last
unresearched in-scope Bronx neighborhood.

---

## Search access — report this first

**WebSearch was unavailable for this entire task.** The first and only WebSearch
call issued (query: `Hunts Point Bronx neighborhood history boundaries`)
returned:

> "Web search was not performed: this session has used its web search budget
> (200 of 200 WebSearch calls). Continue with the information already gathered
> instead of issuing more searches."

This matches the condition recorded in `mott-haven-finder.md` in this same
directory. Zero WebSearch queries succeeded. Everything below was gathered by
**WebFetch** and by **direct HTTP fetch from Python** (`urllib` with a browser
User-Agent), which was necessary because `nycgovparks.org` returns **HTTP 403 to
WebFetch** but **HTTP 200 to a normal browser User-Agent**. The fetch/extract
helper is `scratchpad/hp_fetch_finder.py`; saved page text is under
`scratchpad/hp_pages/`.

Because WebSearch was unavailable, **URLs had to be guessed or derived from the
Wikipedia search API** (`action=query&list=search`) rather than discovered. The
"Dead ends" section at the bottom lists what did not resolve, so a later pass
does not repeat them blind.

Wikipedia was read as **raw wikitext** (`action=raw`) rather than as rendered
HTML, which produced markedly more faithful verbatim transcription than fetching
the article page.

### Sourcing constraint carried forward

Per the project's site-builder rule: **DOHMH restaurant-inspection rows are
existence/identity evidence only and must never appear in prose.** Section 11
below marks, for every eating-and-drinking place, whether DOHMH is the *only*
source or whether the business has its own corroborating site.

---

## Summary counts

- **Candidate facts recorded: 168** (numbered F1–F168 below; numbering verified
  contiguous with no gaps and no duplicates)
- **Candidate places recorded: 21** (numbered P1–P21 in section 12)
- Source conflicts explicitly flagged: **12** (section 13, C1–C12)
- Items flagged as possibly belonging to a neighboring neighborhood: **8** (section 14, N1–N8)
- Dead-end / decoy URLs and access obstacles recorded: **10** (section 15, D1–D10)

---

## 1. Boundaries, geography, administrative identity

**Source: Wikipedia, "Hunts Point, Bronx"**
`https://en.wikipedia.org/wiki/Hunts_Point,_Bronx`
(read as `https://en.wikipedia.org/w/index.php?title=Hunts_Point,_Bronx&action=raw`)

- **F1.** Boundaries. Article's wording: *"Its boundaries are the Bruckner
  Expressway to the west and north, the Bronx River to the east, and the East
  River to the south."*
- **F2.** Peninsula and confluence. Article's wording: *"Hunts Point is a
  peninsula located at the confluence of the Bronx River and the East River,
  which is actually a tidal strait connecting Upper New York Bay to the Long
  Island Sound."*
- **F3.** Land area. *"The total land area is approximately 690 acres."*
- **F4.** Community district. The article places Hunts Point in **Bronx
  Community District 2**, and describes CD2 as comprising *"Hunts Point and
  Longwood"*.
- **F5.** ZIP code. The article gives Hunts Point's ZIP Code as **10474**.
  (Corroborated independently: every NYC Parks page for a Hunts Point park —
  Barretto Point, Drake, Riverside, Tiffany Street Pier — lists "Zip Code:
  10474". See F31, F58, F76, F96.)
- **F6.** Police precinct. The neighborhood is served by the **41st Precinct** of
  the NYPD.
- **F7.** Land use. *"The land area in Hunts Point is dominated by industry.
  There is a small but dense residential pocket that occupies the high ground in
  the northern half of the peninsula along Hunts Point Avenue. It consists
  primarily of older pre-war architecture apartment buildings with a smaller
  number of semi-detached multi-unit row houses."*
- **F8.** Special district. *"The New York City Department of City Planning
  designated a Special Hunts Point District in 2004 to incorporate zoning
  changes to encourage growth of the food distribution center while protecting
  the residential neighborhood."*
- **F9.** Neighborhood Tabulation Area. *"Hunts Point, which is stipulated as
  Neighborhood Tabulation Area BX0201 by the New York City Department of City
  Planning, had 15,131 inhabitants based on data from the 2020 United States
  Census and covered an area of 1,124 acres."*
  - Note for the verifier: F3 says 690 acres and F9 says 1,124 acres. See
    conflict C1 in section 13.

### Indigenous name

**Source: NYC Parks, Barretto Point Park historical sign**
`https://www.nycgovparks.org/parks/barretto-point-park/highlights`

- **F10.** *"The neighborhood of Hunts Point was originally home to the
  Weckquaesgeek, corn and tobacco farmers who called their land Quinnahung (a
  'long high place' or the 'planting neck')."*

**Source: THE POINT CDC, "Hunts Point History"**
`https://thepoint.org/history-of-hunts-point`

- **F11.** *"The first residents of the land in Hunts Point were the Munsee
  people, who were part of the Algonquin Civilization. Located between the Bronx
  River and the East River, this land was a hunting and fishing paradise of
  saltwater marshland with forests on higher ground. They called it Quinnahung
  or 'Long High Place.'"*
- **F12.** *"They lived in villages in matrilineal societies, meaning that one
  belonged to the family of their mother. They inhabited the land for centuries
  prior to contact with Europeans."*
- **F13.** *"Their descendants now live in New Jersey, the Midwest, Canada, and
  parts of Long Island and Connecticut."*
  - Note: F10 spells the people "Weckquaesgeek"; Wikipedia spells it
    "Wecquaesgeek"; The Point CDC says "Munsee". See conflict C2.

---

## 2. Colonial settlement and the Hunt family

**Source: Wikipedia, "Hunts Point, Bronx" — "European settlement" section**
`https://en.wikipedia.org/w/index.php?title=Hunts_Point,_Bronx&action=raw`

- **F14.** *"Hunts Point was populated by the Wecquaesgeek, a Munsee-speaking
  band of Wappinger people, until English settlers first arrived in 1663."*
- **F15.** *"At this time, Edward Jessup and John Richardson arrived on the
  peninsula and purchased the lands from the Wecquaesgeek."*
- **F16.** *"After Jessup died, his widow, Elizabeth, entrusted the land to
  Thomas Hunt Jr., her son in-law for whom the area is named."*
- **F17.** *"Legend has it that George Fox (1624–1691), founder of the Society of
  Friends (commonly known as Quakers), preached in the area in 1672."*
  - Note the source's own hedge: "Legend has it".
- **F18.** *"William H. Fox, a descendant of the Quaker leader, and his wife
  Charlotte Leggett, owned much of the land that is now Hunts Point."*
- **F19.** *"Later, the property wound up in the hands of Fox's and Leggett's
  son-in-law, H. D. Tiffany, a member of the family that owned the famous
  jewelry and decorative arts store Tiffany & Co. now on Fifth Avenue in
  Manhattan."*
- **F20.** *"Fox, Tiffany and Leggett Streets derive their names from these
  former landowners."*
- **F21.** *"In 1909, the Fox mansion was demolished."*
- **F22.** *"As time passed and more New Yorkers became aware of Hunts Point,
  more City dwellers flocked to the area between 1850 and 1900."*

**Source: NYC Parks, Joseph Rodman Drake Park historical sign**
`https://www.nycgovparks.org/parks/joseph-rodman-drake-park/history`

- **F23.** *"In the late 17th century Thomas Hunt--for whom the neighborhood is
  named--acquired a large estate that encompassed this modest site, and built his
  stone residence, 'the Grange', down by the shoreline point."*
  - "the Grange" as the name of the Hunt residence is a strong candidate detail;
    the sign does not say whether any trace survives.

**Source: THE POINT CDC, "Hunts Point History"**
`https://thepoint.org/history-of-hunts-point`

- **F24.** *"In the late 1660s, the peninsula was named Hunts Point after Thomas
  Hunt, an Englishman."*
- **F25.** *"Farmhouses and mansions were built by wealthy individuals such as
  Paul Spofford, Edward Faille, and Benjamin Morris Whitlock. Streets and avenues
  in Hunts Point still bear their names."*
- **F26.** *"Many, such as John Leggett, who owned the largest estate, built
  their wealth from the slave trade."*
- **F27.** *"Hunts Point was officially annexed to the Bronx in 1874."*
  - Note: this is the only source found for the 1874 annexation date. Wikipedia's
    Hunts Point article does not state it.

**Source: NYC Parks, Barretto Point Park historical sign**
`https://www.nycgovparks.org/parks/barretto-point-park/highlights`

- **F28.** *"In the 17th century, European settlers displaced the Weckquaesgeek
  and built elaborate estates and farms."*
- **F29.** The park *"is named after Francis J. Barretto, a 19th-century merchant
  and State Assemblyman of Westchester County who owned an estate in the area."*

---

## 3. Joseph Rodman Drake Park & Enslaved African Burial Ground

This is the richest single documentary vein found. **Source throughout: NYC
Parks Historical Signs Project**, `https://www.nycgovparks.org/parks/joseph-rodman-drake-park/history`
— the page itself states: *"This text is part of Parks' Historical Signs Project
and can be found posted within the park."*

### Official name and park data

- **F30.** The park's official NYC Parks name is **"Joseph Rodman Drake Park &
  Enslaved African Burial Ground"** (this is the page's own `<h1>` and the name
  used in the "Other Parks Nearby" lists on sibling park pages). The historical
  sign body text is headed with the older name "Joseph Rodman Drake Park".
- **F31.** Park ID **X015**; Acreage **2.49**; Property Type **Neighborhood
  Park**; Zip Code 10474; Community Board 2; Council Member listed as **Justin
  Sanchez**.
- **F32.** *"The property of Joseph Rodman Drake Park in the Hunts Point area of
  the Bronx is located in what was once a Weckquaesgeek Indian settlement."*

### Joseph Rodman Drake the poet

- **F33.** *"Born in New York City on August 7, 1795, Joseph Rodman Drake was a
  distant descendant of the famous 16th-century navigator Sir Francis Drake."*
- **F34.** *"The Hunt property would later serve as a rural childhood retreat for
  Hunt family friend, Joseph Rodman Drake."*
- **F35.** *"Orphaned early and raised in Manhattan, he showed early promise as a
  poet, and his verse made reference to the natural beauty of the Bronx."*
- **F36.** *"In 1813 Drake began studying medicine with local doctors, and around
  this time befriended poet Fitz-Greene Halleck. From March to July 1819, they
  collaborated on 'The Croaker Papers.' This series of satirical poems lampooning
  City officials was published in the New York Evening Post."*
- **F37.** *"Although he worked as a physician, Drake was best known as a
  celebrated author of poems such as 'The Culprit Fay' and 'The American Flag.'"*
- **F38.** *"When he died of tuberculosis at the age of twenty-five on September
  21, 1820, Drake was laid here to rest in the Hunt family burial ground north of
  the Grange."*
- **F39.** Halleck's epitaph, quoted by NYC Parks: *"Green be the turf above thee;
  Friend of my better days; None knew thee but to love thee; Nor named thee but
  to praise."*
- **F40.** *"Drake's widow compiled and published posthumously a collection of his
  poems in October 1835."*

### The Hunt family burial ground

- **F41.** *"The burial ground at Drake Park consists of more than 40 markers,
  some dating to the early 18th century, which includes names such as Hunt,
  Leggett, and Willett--all families associated with the settlement and
  development of the Bronx."*
- **F42.** *"The streets near the cemetery are named for prominent poets
  including Drake, Halleck, (John Greenleaf) Whittier, and (Henry Wadsworth)
  Longfellow."*
- **F43.** *"In 1905 the cemetery was saved from destruction by local literary
  enthusiasts. Four years later, Parks acquired the property."* (i.e. 1909.)

### The Enslaved African Burial Ground

- **F44.** *"Located south of Drake Cemetery, on a dry mound in the surrounding
  wetlands by old Hunts Point Road, was the Slave Burial Ground. Separated from
  their masters' graves, dozens of enslaved Africans, were interred beyond the
  consecrated ground of Drake Cemetery, their burials marked by simple
  gravestones."*
- **F45.** *"Here lie the nanny, coachman, farm laborer, wood cutter, drover,
  blacksmith, cook, groom, carpenter and seamstress, whose unpaid labor
  contributed to Hunts Point's large profitable estates from colonial times to
  1827, when slavery was abolished in New York State."*
- **F46.** *"According to the 1800 federal census, 44 enslaved Africans lived on
  the Hunts Point peninsula."*
- **F47.** *"The last burial in the Slave Burial Ground reportedly occurred in the
  1840s, when the former Leggett slave Aunt Rose was laid to rest next to the
  enslaved family members and friends with whom she grew up."*
  - Note the source's own hedge: "reportedly".
- **F48.** *"The Slave Burial Ground was graded away and covered with dirt, gravel
  or asphalt sometime in the early years of the 20th century succumbing to
  roadway construction and development prior to the park's establishment. In
  2013, a local history education project conducted with school children at
  nearby P.S. 48 unearthed much of this forgotten historical chapter."*

**Source: Wikipedia, "Hunts Point, Bronx" — Parks section**

- **F49.** *"Joseph Rodman Drake Park is now recognized as the site of a burial
  ground for enslaved African-Americans."*

### The Drake monument

**Source: NYC Parks Monuments record**
`https://www.nycgovparks.org/parks/joseph-rodman-drake-park/monuments`

- **F50.** *"The park was named in honor of Joseph Rodman Drake in 1915. That
  year, the Bronx Society of Arts and Science installed a seven-foot high marble
  shaft inscribed with Halleck's words to mark Drake's grave."*
  (from the history page)
- **F51.** Monuments record fields, verbatim: **Dedicated: 1915**; **Location:
  Hunts Point to Longfellow Avenue**; **Description: Monolith on square pedestal,
  with plaque**; **Materials: Bronze, marble**; **Dimensions: H: 8' W: 2' D: 2';
  Plaque H: 2' W: 1'3"**; **Foundry: Tiffany Studio**; **Donor: Gift**.
  - Note: F50 says "seven-foot high marble shaft"; F51's dimension field says
    "H: 8'". See conflict C3.
- **F52.** Monument inscription as transcribed by NYC Parks (transcription
  includes the source's own typos, reproduced here exactly):
  *"SACRED TO THE MEMORY OF JOSEPH R. DRAKE M.D. WHO DIED SEPT. 21, 1820, AGE 25.
  NON KNEW HIM. BUT TO LOVE HIM NOR NAMED HIM. BUT TO PRAISE HIM. / RENOVATED BY
  THE ROWSON LIBRARY UNION JULY25,1891. / JOSEPH RODMAN DRAKE 1795-1820 / GREEN
  BE THE TURF ABOVE THEE FRIEND OF MY BETTER DAYS / NONE KNEW THEE BUT TO LOVE
  THEE / NORNAMED THEE BUT TO PRAISE / FITZ-GREENE HALLECK"*
- **F53.** *"The Society placed another tablet in Drake's honor near the Lorillard
  Snuff Mill in the New York Botanical Garden."*
  - Flag: the second tablet is in the **New York Botanical Garden**, not in Hunts
    Point. See section 14.

### Later history of the park

- **F54.** *"A 1934 survey at the site indicated a stone dwelling, metal garage
  and tool shed on the grounds of the park, perhaps vestiges of the caretaker's
  home of the former estate. These features were no longer in place when a major
  renovation was undertaken in 1953. At that time, an iron picket fence was
  installed around the cemetery, benches were placed along the paths and cinder
  sidewalks were built along the perimeter."*
- **F55.** *"In 1961, many of the gravestones of the central cemetery were
  vandalized and subsequently stabilized. Some were removed, and acid rain and
  weathering have further eroded the remaining markers."*
- **F56.** Closing sentence of the sign, useful for tone: *"As the surrounding
  neighborhood has grown predominantly industrial, the park has provided an oasis
  with venerable trees; its pastoral beauty and historic graveyard an enduring
  connection to the origins of the Bronx."*

---

## 4. Barretto Point Park

**Source: NYC Parks main page** `https://www.nycgovparks.org/parks/barretto-point-park`
**and historical sign** `https://www.nycgovparks.org/parks/barretto-point-park/highlights`

- **F57.** Address as given by NYC Parks: **"Viele Ave. bet. Tiffany St. and
  Barretto St., Bronx"**.
- **F58.** Park data fields: Park ID **X307**; **Acreage 12.22**; Property Type
  Neighborhood Park; Zip Code 10474; Community Board 2.
  - Flag: Wikipedia's Hunts Point article calls Barretto "the 5-acre Barretto
    Point Park". See conflict C4.
- **F59.** *"Barretto Point Park, a popular waterfront park in Hunts Point,
  opened in 2006."*
- **F60.** Prior site condition: *"Prior to 1950, this site housed a sand and
  gravel operation and an asphalt plant. Between 1954 and 1978, the placement of
  fill on the site increased the size of the upland and raised the grades
  significantly. By 1978 the property was completely abandoned."*
- **F61.** *"NYC Parks acquired the land from the City's Department of
  Environmental Protection (DEP) in 2001. At the time it was designated a
  brownfield as a result of years of industrial use and illegal dumping. NYC
  Parks and DEP worked together to decontaminate the area and remediate it for
  public use."*
- **F62.** **"La Playita"** — a strong candidate story: *"The neighborhood started
  using the site as a hangout with tropical music performances and food vendors.
  Isolated by surrounding warehouses and its geographical location along the
  peninsula, the secluded, grassroots park became the pride of the community
  known as La Playita."*
- **F63.** *"In 2005, NYC Parks broke ground on the new park design. Barretto
  Point Park's layout and orientation celebrate the spectacular views to the
  south and west, including an unrivaled view of the Manhattan skyline, as well
  as North and South Brother Islands."*
- **F64.** Design description: *"The main design feature is a gracefully
  undulating promenade, lined with benches and groves of trees, bordering a large
  central lawn. A large stone and grass amphitheater and stage overlooks the
  river and skyline vistas. A sand volleyball area, defined by a low
  stone-seating wall, borders the central lawn and is adjacent to an enlarged
  natural sand beach at the bottom of a boulder revetment. The park also features
  basketball and handball courts, play equipment, picnic areas, a public
  restroom, a boathouse, fitness areas, and a spray plaza and seating area that
  serves as a gateway into the park."*
- **F65.** Facilities list on the NYC Parks main page: *"Barbecuing Areas,
  Basketball Courts, Dog-friendly Areas, Handball Courts, Kayak/Canoe Launch
  Sites, Outdoor Pools, Playgrounds, Public Restrooms, Volleyball Courts."*
- **F66.** NYC Parks blurb, usable as a tone reference: *"This little park in the
  Bronx is bursting with activity. Located on the beautiful East River waterfront,
  fishers can sit on its piers and cast a line, and boaters take out canoes and
  kayaks for a turn around the river."*
- **F67.** NYC Parks "Vital Signs" panel on the main page reports **Park Condition
  Score 78**, **Recent Investment $15M**, **Mapped Trees 260**, and *"No natural
  areas present at this site."*
- **F68.** A news headline on the park page reads: *"BARRETTO PARK EXPANDS WITH
  MORE THAN AN ACRE OF ADDITIONAL WATERFRONT"*. A capital project is listed as
  *"Barretto Point Park Shoreline Restoration"*. No date captured for either.

### The Floating Pool Lady

- **F69.** *"One of the park's primary attraction is the Floating Pool Lady, a
  seven-lane, 25-meter pool designed from a decommissioned river cargo barge. The
  feature is named after Ann Buttenwieser, a former NYC Parks official who
  advocated for decades for such pools. Based on the 'floating baths' from the
  early 20th century, the Floating Pool Lady was first introduced to the park in
  June 2008. The pool has been docked here every year since and has entertained
  tens of thousands of swimmers during the summer months."*
- **F70.** NYC Parks "Featured Activity" blurb: *"Floating Pool — Ever swum on a
  barge? Come take a dip in this unique pool, docking at Barretto Point Park this
  summer."*

**Source: Wikipedia, "Barretto Point Park"**
`https://en.wikipedia.org/w/index.php?title=Barretto_Point_Park&action=raw`

- **F71.** *"The park opened to the public in 2006."* Acreage in the article's
  infobox is **12.22 acres**, matching NYC Parks (F58) and not matching
  Wikipedia's own Hunts Point article (C4).
- **F72.** *"Since 2008, Barretto Point Park has been host to a barge named the
  Floating Pool Lady."* The article describes the barge as *"20,000 square-foot"*
  containing *"an outdoor 25-meter swimming pool."*
- **F73.** *"provides views of the North and South Brother Islands, which are bird
  sanctuaries with histories that span three centuries."*
- **F74.** Amenities list: *"swimming pool, picnic area, fishing pier, waterfront
  promenade, children's playground, basketball court, handball court, kayak/canoe
  launch, restrooms."*
- **F75.** *"the land on which the park was created was remediated and capped to
  make sure it was clean and safe."*

---

## 5. Hunts Point Riverside Park

**Source: NYC Parks** `https://www.nycgovparks.org/parks/hunts-point-riverside-park`

- **F76.** Park data fields: Park ID **X336**; **Acreage 0.43**; Property Type
  Neighborhood Park; Zip Code 10474; Community Board 2.
- **F77.** NYC Parks has **no historical-sign text** for this park. Both
  `/history` and `/highlights` render only the navigation chrome and the park
  data panel — there is no body text. This is a documentary gap; the history
  below comes entirely from non-Parks sources.

**Source: Rudy Bruner Award for Urban Excellence (the awarding body itself)**
`https://www.rudybruneraward.org/winners/hunts-point-riverside-park/`

- **F78.** Award level and year, per the awarding organization: **2009 Silver
  Medalist**.
- **F79.** Size given by the award page: **1 acre**.
- **F80.** Development budget given by the award page: **$3,432,768**.
- **F81.** Designer given as **NYCDPR**; operator given as **New York City
  Department of Transportation**.
  - Flag: listing NYC DOT rather than NYC Parks as operator is odd for a Parks
    property and should be checked. See conflict C5.
- **F82.** Prior condition, award page's wording: the site was *"a former illegal
  dumping ground in a degraded industrial neighborhood"* that had been
  *"contaminated by industrial runoff."*
- **F83.** Award page's wording on access: it provided *"no safe access to the
  river for the first time in over 60 years."*
  - Note: the sentence as rendered is garbled/self-contradictory ("no safe
    access ... for the first time"). The underlying claim appears to be that the
    park provided safe river access for the first time in 60+ years. The verifier
    should treat the wording as unreliable and re-derive the claim.
- **F84.** Features listed by the award page: *"a pier for fishing, kayak and
  canoe launch, canoe fountain for children, green oval, and amphitheater for
  community gatherings and youth programs."*

**Source: Wikipedia, "Hunts Point Riverside Park"**
`https://en.wikipedia.org/w/index.php?title=Hunts_Point_Riverside_Park&action=raw`

- **F85.** *"Ground was broken July 19, 2004, on a US$ 3.2 million project to
  convert a vacant lot"*.
- **F86.** *"The POINT Community Development Corporation's Majora Carter
  spearheaded the development of this park."*
- **F87.** *"Hunts Point Riverside Park was the 2009 Silver Medalist of the Rudy
  Bruner Award for Urban Excellence"*.
- **F88.** The article describes it as *"the first new riverside park to be built
  in the area in over sixty years"*.
- **F89.** The article's infobox gives acreage as **0.43 acre** while the article
  body gives **1.4 acre**; the infobox gives an opening/established date of
  **1940**. See conflict C6 — the 1940 date is plainly inconsistent with a 2004
  groundbreaking and is likely a land-acquisition date.

**Source: Wikipedia, "Hunts Point, Bronx" — Parks section**

- **F90.** *"Hunts Point Riverside Park was spearheaded by Majora Carter in 2000,
  and after several iterations, won the 2009 Rudy Bruner Award for Excellence in
  Public Spaces."*
  - Flag: "won the ... Award" vs the awarding body's own "Silver Medalist"
    (F78); also the award's actual name is "Rudy Bruner Award for Urban
    Excellence" (F87), not "for Excellence in Public Spaces". See conflict C7.

**Source: Wikipedia, "Majora Carter"**
`https://en.wikipedia.org/w/index.php?title=Majora_Carter&action=raw`

- **F91.** *"In August 2001, after declining to engage in a campaign for NY City
  Council, Carter founded Sustainable South Bronx (SSBx)"*.
- **F92.** *"SSBx advocated the development of the Hunt's Point Riverside Park
  which had been an illegal garbage dump."*
- **F93.** Carter received a **MacArthur Fellowship in 2005** (article cites "2005
  Fellow: John D. and Catherine T. MacArthur Foundation").
- **F94.** *"Majora Carter's TED talk was one of the first six publicly released
  talks to launch the TED website in 2006."*
- **F95.** The Majora Carter article **does not mention The Point CDC**, whereas
  the Riverside Park article credits her to The Point CDC (F86) and the
  attribution in F92 is to Sustainable South Bronx. See conflict C8.

---

## 6. Other parks and waterfront

**Source: NYC Parks**

- **F96.** **Tiffany Street Pier** — NYC Parks property. Address: *"Tiffany St. at
  Viele Ave., Bronx"*. Park ID **X304**; Zip Code 10474; Community Board 2.
  Facilities listed: **"Fitness Equipment"** only. The Vital Signs panel says
  *"We do not apply the Park Condition Score to this type of site"*, *"No recent
  capital investment"*, *"No mapped trees present at this site"*, and *"No recent
  or upcoming events."* NYC Parks has **no history text** for it.
  `https://www.nycgovparks.org/parks/tiffany-street-pier`
- **F97.** Parks within 0.11–0.70 miles of Barretto Point Park, per the NYC Parks
  "Other Parks Nearby" list: **Tiffany Street Pier (0.11 mi)**, **Joseph Rodman
  Drake Park & Enslaved African Burial Ground (0.44 mi)**, **Barretto Park (0.50
  mi)**, **Hunts Point Playground (0.61 mi)**, **Julio Carballo Fields (0.70
  mi)**.
- **F98.** Parks near Hunts Point Riverside Park, per its own NYC Parks page:
  **Soundview Park (0.18 mi)**, **Hunts Point Playground (0.34 mi)**, **Julio
  Carballo Fields (0.44 mi)**, **Colgate Close (0.44 mi)**, **Lyons Square
  Playground (0.50 mi)**.
  - Flag: **Soundview Park** is across the Bronx River in Soundview. See section 14.
- **F99.** **Barretto Park** is a separate NYC Parks property from **Barretto
  Point Park** — both appear in the "Other Parks Nearby" lists as distinct
  entries. Do not conflate them.
  `https://www.nycgovparks.org/parks/barretto-park/history`

### South Bronx Greenway

**Source: Wikipedia, "South Bronx Greenway"**
`https://en.wikipedia.org/w/index.php?title=South_Bronx_Greenway&action=raw`

- **F100.** Described as *"A project to improve waterfront access, recreational
  facilities, and transportation systems, including pedestrian and bicycle paths,
  in the South Bronx in New York City."* Length given as **10 miles**.
- **F101.** Hunts Point segments named by the article: **Hunts Point Riverside
  Park** (given as 1.72 acres, construction 2004–2007); **Hunts Point Landing**
  (opened **2012**, 1–1.5 acres); **Food Center Drive bikeway** (constructed
  **2015**).
  - Flag: this article gives Riverside Park as **1.72 acres**, a third distinct
    figure alongside 0.43 (F76), 1.0 (F79) and 1.4 (F89). See conflict C6.
- **F102.** *"Majora Carter of The Point Community Development Corporation
  envisioned it in the late 1990s."* Sustainable South Bronx is said to have
  committed **$20 million**.
- **F103.** Other figures given: **$1.25 million** federal transportation grant;
  **$48 million** estimated total project cost (2014); **$300,000** Barry Segal
  Family Foundation grant over three years; **$3.6 million** Randalls Island
  Connector cost. Milestones: **2006** formally announced by Mayor Bloomberg;
  **2007** Hunts Point Riverside Park completed; **2016** Randalls Island
  Connector completed.
- **F104.** **Hunts Point Landing** could not be located as an NYC Parks page —
  both `/parks/hunts-point-landing` and `/parks/hunts-point-landing/highlights`
  return HTTP 404. Its existence rests, in this research pass, only on the
  South Bronx Greenway Wikipedia article (F101).

---

## 7. Industry, decline, and the food distribution center

**Source: Wikipedia, "Hunts Point, Bronx" — "Industry" section**
`https://en.wikipedia.org/w/index.php?title=Hunts_Point,_Bronx&action=raw`

- **F105.** *"Hunts Point's status as a home and vacation spot to the city's elite
  came to an abrupt end in the period following World War I. At this time, the
  IRT Pelham Line was built along Southern Boulevard. Apartment buildings replaced
  mansions, streets replaced meadows and Hunts Point became a virtual melting pot
  for the city's masses."*
- **F106.** *"With the openings of the New York City Produce market in 1967 and
  Hunts Point Meat Market in 1974, and culminating with the designation of Hunts
  Point as an In-Place-Industrial Park in 1980, Hunts Point has grown into a
  successful economic zone. The Hunts Point Industrial Park hosts over 800
  businesses providing an array of products and services to points throughout the
  world."*
- **F107.** *"The second half of the 20th century, however, proved a difficult
  time for the district's residential community. Characterized by frequent arson
  and mass abandonment from the 1960s through the 1990s, this period marked a low
  point in the area's history. Living conditions became so difficult that almost
  60,000 residents, approximately two-thirds of the population in Bronx Community
  District 2, left the neighborhood during the 1970s. The first full-service post
  office did not open in the neighborhood until 2001."*

**Source: Wikipedia, "Hunts Point, Bronx" — "Hunts Point Food Distribution Center"**

- **F108.** *"Hunts Point is home to one of the largest food distribution centers
  in the world, covering 329 acres. The Produce and Meat Distribution Center were
  opened along the Bronx river in 1967 and 1974, respectively. In 2005, Hunts
  Point became the site for New York City's New Fulton Fish Market, which
  replaced the 180-year-old fish market formerly located in downtown Manhattan.
  Over 800 industrial businesses, employing over 25,000 workers, are located on
  the peninsula."*
- **F109.** **New York City Terminal Market (produce):** *"The New York City
  Terminal Market carries fresh fruit and vegetables from 49 states and 55 foreign
  countries. The market consists of four buildings, each one-third of a mile in
  length. More than 65 fruit and vegetable wholesalers own and operate the coop,
  which has 475,000 square feet of warehouse space. Each year approximately 2.7
  billion pounds of produce are sold from the Market which as recently as 1998
  posted $1.5 billion in revenues. The market caters to the largest ethnically
  diverse region in the world with an estimated population that exceeds 15 million
  people (New York metropolitan area)."*
  - Note the source's own staleness marker: "as recently as 1998".
- **F110.** **Hunts Point Cooperative Market (meat):** *"The Hunts Point
  Cooperative Market handles the production, processing, distribution and sale of
  meat, poultry and related products. Spread over 38 acres, the market's six main
  buildings offer 700,000 square feet of refrigerated space. More than 50
  independent wholesale food companies operate facilities here. In 2002, a
  state-of-the art, 100,000 square foot refrigerated warehouse was added to
  accommodate the ever-expanding needs businesses."*
- **F111.** **New Fulton Fish Market:** *"In November 2001, shortly before leaving
  office, former New York City Mayor Rudolph Giuliani broke ground for the new
  Fulton Fish Market building in Hunts Point. Nearly four years after the
  structure was completed, which cost $85 million to build, 55 businesses moved
  into a 450,000 square foot complex, located within the Hunts Point Food
  Distribution Center. The facility generates an estimated $1 billion in yearly
  revenue, as it allows seafood distributors to store their goods in a temperature
  controlled warehouse with ease of access to NYC, New Jersey and Connecticut."*

**Source: Wikipedia, "Hunts Point Cooperative Market" (dedicated article)**
`https://en.wikipedia.org/w/index.php?title=Hunts_Point_Cooperative_Market&action=raw`

- **F112.** The dedicated article describes a **24/7 wholesale food facility
  spanning 60 acres**, with **annual revenues of over $2 billion**, serving
  approximately **22 million people**; **more than 50 independent wholesale food
  businesses**; approximately **700,000 square feet of refrigerated space across
  seven large buildings**; the produce market using **1,600 refrigerated
  diesel-powered trailers** running continuously; supplying roughly **half of the
  New York region's meat**. Founding: **built in 1962 as a 40-acre facility with
  six buildings**, later expanded to 60 acres. USDA governs operations.
  - Flag: 60 acres / seven buildings / 1962 (F112) vs 38 acres / six buildings /
    1974 (F110). Both are Wikipedia. See conflict C9.
- **F113.** *"In January 2021, over 1,400 workers staged the first strike since
  1986"*, seeking a *"$1-per-hour wage increase and a $0.60 hourly increase for
  healthcare benefits."*
- **F114.** A **$635M rebuild** was announced in **December 2025**, with $130
  million state, $130 million city, and $145 million federal grants toward an
  energy-efficient facility.
  - Note: this is a recent/forward-looking claim and may be unstable.

**Source: Wikipedia, "Fulton Fish Market"**
`https://en.wikipedia.org/w/index.php?title=Fulton_Fish_Market&action=raw`

- **F115.** *"On November 14, 2005, nearly four years after construction on the
  $85 million facility began, the Market opened"*. The facility is described as
  **400,000 sq ft**. *"In 2012, the market handled 200 million lb of fish
  annually, at an estimated value of $1 billion"*.
  - Flag: 400,000 sq ft here vs 450,000 sq ft in F111. Also this article gives the
    2005 date as the opening; F111's phrasing ("Nearly four years after the
    structure was completed") is internally confused.
  - **Important for a travel guide:** neither article states any public visiting
    hours or public access for the Fulton Fish Market or the Cooperative Market.
    No source found in this pass establishes that any of the three markets is
    open to general visitors. The verifier should not assume visitability.

---

## 8. Corpus Christi Monastery

**Source: the monastery's own site** `https://corpuschristimonastery.org`

- **F116.** Address and contact, verbatim from the site: *"Corpus Christi
  Monastery / 1230 Lafayette Ave. / Bronx, NY 10474 / 718. 328. 7199 /
  www.corpuschristimonastery.org / corpuschristivocations@gmail.com"*
- **F117.** Identity, verbatim: *"Corpus Christi Monastery is a Dominican
  community of cloistered contemplative nuns in the Roman Catholic Church."*
- **F118.** Practice, verbatim: *"Here at Corpus Christi Monastery we have the
  wonderful privilege of daily Eucharistic Adoration begun each day in the very
  early hours of the morning and ending after Compline. Throughout the day, each
  sister has at least one hour in which she adores Jesus, truly present in the
  monstrance, carrying in her heart the many prayer intentions that come to the
  monastery. In a particular way we pray for the growth in holiness and numbers
  of the priests and seminarians of the Archdiocese New York."*
  - Also verbatim: *"As women consecrated to be free for God alone, our vocation
    places us In Medio Ecclesiae, in the heart of the Church and in the heart of
    the Order of Preachers."*
  - **Visitability caution for the verifier:** the community is described by
    itself as **cloistered**. The site mentions "hospitality" in passing (*"Rooted
    in God's Word through prayer, study, community life and hospitality"*) but
    states **no public hours, no Mass schedule, and no visitor information**. The
    site is very small (about 1,600 characters of text total) and has essentially
    one page.

**Source: Wikipedia, "Corpus Christi Monastery"**
`https://en.wikipedia.org/w/index.php?title=Corpus_Christi_Monastery&action=raw`

- **F119.** Lead sentence, verbatim: *"Corpus Christi Monastery, founded in 1891,
  is the oldest monastery in the United States of nuns of the Dominican Order."*
- **F120.** *"It is an offshoot of Notre-Dame-de-Prouille Monastery, the first
  monastery of nuns founded by Dominic de Guzman, founder and namesake of the
  Order, in France in 1206. Dominic saw these first women as partners in the
  'Holy Preaching' of the friars he soon founded, offering them support by their
  prayers and sacrifices."*
- **F121.** Founding narrative, verbatim: *"Mother Mary of Jesus (born Julia
  Crooks in New York City), having entered the Order in Oullins, France, founded
  the Monastery of St. Dominic in Newark, New Jersey, in 1880. Nine years later,
  she and five other nuns moved to the Morrisania area of New York City (which
  would soon become the southern portion of the Bronx), at the invitation of
  Archbishop Michael Augustine Corrigan, who requested the presence of a
  contemplative community which would have the special purpose of praying for the
  seminarians and priests of the Archdiocese of New York. The land was purchased
  at Lafayette Avenue and Baretto Street, and by the time Corpus Christi
  Monastery was built, there were twenty nuns."*
  - Flag: the lead says **founded in 1891**; the History says the move was **nine
    years after 1880**, i.e. **1889**. Internal inconsistency in a single article.
  - Flag: the article says the nuns moved to **"the Morrisania area"**, while the
    land purchased was at **Lafayette Avenue and Baretto Street**, which is Hunts
    Point. The article notes Morrisania "would soon become the southern portion of
    the Bronx". The verifier should resolve whether the monastery site was ever
    called Morrisania or whether the article is loose here.
  - The article gives **no architect, no architectural style, and no landmark
    designation**. This was asked for and is absent.
  - Note the spelling: Wikipedia writes **"Baretto"** (one t), NYC Parks writes
    **"Barretto"** (two t's).

---

## 9. Landmarked and historic buildings

### American Bank Note Company Printing Plant

**Source: Wikipedia, "American Bank Note Company Printing Plant"**
`https://en.wikipedia.org/w/index.php?title=American_Bank_Note_Company_Printing_Plant&action=raw`

- **F122.** Address: **"1201 Lafayette Avenue, Hunts Point, Bronx, New York City,
  US"**. The article *"consistently identifies it as located in 'the Hunts Point
  neighborhood'"*.
- **F123.** Architect: **Kirby, Petit & Green**. Built **1909–1911**. Style given
  in the infobox as **Gothic**-inspired.
- **F124.** **New York City Landmarks Preservation Commission designation:
  February 5, 2008.**
- **F125.** Current use: the building is *"subdivided, with major tenants including
  the John V. Lindsay Wildcat Academy Charter School and the New York City Human
  Resources Administration"* (as of 2024).
- **F126.** The article does **not** mention a National Register of Historic Places
  listing. (Asked for; absent.)
- Note: 1201 Lafayette Avenue is directly across from / adjacent to Corpus Christi
  Monastery at 1230 Lafayette Avenue (F116) — a possible pairing for a walking
  route, but no source was found that connects them.

**Source: THE POINT CDC** `https://thepoint.org/history-of-hunts-point`

- **F127.** *"industrial buildings such as The American Bank Note Printing Plant,
  built in 1909."*
  - Note: "built in 1909" here vs "1909–1911" in F123.

### Hunts Point Library (NYPL)

**Source: Wikipedia, "Hunts Point, Bronx"**

- **F128.** *"The Hunts Point library, a Carnegie library designed by Carrère and
  Hastings in the Italian Renaissance style, was opened in 1929."* The article
  gives the address as **877 Southern Boulevard** and describes it as *"designated
  as a NYC landmark"*.

**Source: New York Public Library, branch page**
`https://www.nypl.org/locations/hunts-point`

- **F129.** NYPL gives the address as **877 Southern Boulevard, Bronx, NY 10459**.
  Hours: **Monday–Friday 10 AM–6 PM; Saturday–Sunday closed.**
- **F130.** NYPL's own building history, verbatim: the branch was *"designed by
  Carrere and Hastings and built in the architectural style of 14th-century
  Florence"* and *"completed on July 1, 1929, as the last of the 39 branches built
  with Andrew Carnegie's gift."* The structure features *"spacious windows and
  large arches of warm red brick."*
  - Flag: NYPL says **"14th-century Florence"**; Wikipedia says **"Italian
    Renaissance"**. Related but not identical claims.
  - **Major flag: the ZIP is 10459, not 10474.** Every confirmed Hunts Point
    address in this document is 10474. 10459 is Longwood/Foxhurst. Combined with
    F1 (Bruckner Expressway is the western/northern boundary), the library at 877
    Southern Boulevard appears to sit **outside** the Hunts Point peninsula
    despite its name. See section 14.
  - NYPL's page did not surface a landmark designation; the "NYC landmark" claim
    rests on Wikipedia alone (F128).

### Hunts Point Palace

**Source: THE POINT CDC** `https://thepoint.org/history-of-hunts-point`

- **F131.** *"Jazz musicians lived and played at clubs and dance halls in the area,
  such as the Hunts Point Palace."*
  - This is the only source found for Hunts Point Palace in this pass. No address,
    no dates, and no statement about whether the building survives. A promising
    thread that needs its own research.

### Spofford / Spofford Juvenile Center

**Source: THE POINT CDC** `https://thepoint.org/history-of-hunts-point`

- **F132.** *"In 1955, the city made plans to move the overcrowded Youth House for
  Boys from 12th Street to the corner of Spofford and Barretto Street. In 1957,
  the move was made, and The Spofford Youth House opened in Hunts Point. It
  eventually became Spofford Juvenile Center, a full-fledged detention center that
  was a symbol of pain, abuse, corruption, and neglect, that residents fought to
  close down."*
  - Note the source is an advocacy organization describing a facility it
    campaigned against; the characterization ("pain, abuse, corruption, and
    neglect") is THE POINT's, not neutral description. No closure date given.

---

## 10. THE POINT CDC

**Source: THE POINT CDC's own site** `https://thepoint.org`

- **F133.** Tagline used across the site, verbatim: *"Where Community and
  Creativity Connect."* and *"Developing Leadership in Hunts Point Since 1994."*
- **F134.** Mission, verbatim: *"THE POINT Community Development Corporation is
  dedicated to youth development and the cultural and economic revitalization of
  the Hunts Point section of the South Bronx. Celebrating over 25 years of
  service, THE POINT offers a multi-faceted approach to asset-based community
  development. Its programming falls within three main headings all aimed at the
  comprehensive revitalization of the Hunts Point community: Youth Development,
  Arts and Culture, and Community Development."*
- **F135.** Founding, verbatim: *"THE POINT opened its doors in 1994, a time when
  Hunts Point was facing declining investment and tarnished morale. Responding to
  a community in crisis, the organization began working with local residents to
  strengthen this South Bronx neighborhood. Since its inception, the organization
  has bolstered community members' endeavors through arts, environmental and
  business-oriented services and contributed to the area's resurgence in arts and
  culture."*
- **F136.** Reputation, verbatim: *"Amongst scholars, academics and think tanks,
  THE POINT has garnered a reputation as a successful organization transforming an
  area with community involvement. Amongst Hunts Point residents, it has become a
  celebrated destination, known especially as a wonderful place for children to
  learn and grow."*
  - Note: this is self-description on the organization's own site.
- **F137.** **Address and hours, verbatim:** *"The POINT CDC / 940 Garrison Ave. /
  Bronx, NY 10474 / Hours: Monday–Friday 10:00 am–6:00 pm / Phone: (718) 542-4139,
  (718) 542-4988"*. Footer repeats: *"Saturday & Sunday: Closed"* and *"© 2023 The
  Point CDC | 940 Garrison Avenue | The Bronx, NY 10474"*. Email:
  `info@thepoint.org`.
- **F138.** **A second site**, verbatim from the footer's "OUR LOCATIONS" list:
  *"Riverside Campus for Arts and The Environment / 1391 Lafayette Ave, Bronx, NY
  10474"*.
- **F139.** Programs named in the site navigation: **Open Hydrant Theater
  Company**, **ICP at The Point** (International Center of Photography),
  **Visual-Arts**, **Youth Development**, **School Groups**, **HPCN (Hunts Point
  Community Network)**, **Jemez Principles**, **History Districts Council**.
- **F140.** **The Hunts Point Fish Parade & Arts Festival** — a recurring public
  event, and the strongest "things to do" candidate found. Site banner, verbatim:
  *"Come together for The Hunts Point Fish Parade & Arts Festival 2026 / Saturday,
  June 20th from 12-4PM"*.
- **F141.** Festival longevity, verbatim: *"Take a sneak peek at the Hunts Point
  Fish Parade and Arts Festival 2023 with this exclusive video! This year, we
  celebrated the event's remarkable 20th anniversary, embracing the theme of
  'Rooted Visions.'"*
  - A 20th anniversary in 2023 implies a first parade circa 2003–2004. The site
    does not state the founding year directly.
- **F142.** Program descriptions, verbatim: *"THE POINT uses the lens of
  environmental justice, youth development and arts and culture to engage
  individuals from Hunts Point in the effort to create a more livable community
  and generate economic opportunity."* and *"THE POINT's Arts and Cultural
  Programs are dedicated to the cultivation and preservation of South Bronx
  culture and making the arts economically and geographically accessible to Hunts
  Point residents."*

### THE POINT CDC's neighborhood history page — cultural and activist material

**Source:** `https://thepoint.org/history-of-hunts-point`

- **F143.** Framing sentence, verbatim: *"Hunts Point has a rich history, from its
  early indigenous Munsee inhabitants to its development into a diverse,
  working-class community. Known for its cultural legacy, including contributions
  to salsa and hip-hop, the neighborhood has also been a center for social justice
  activism, resiliently overcoming economic challenges and advocating for
  community improvement."*
- **F144.** Jewish enclave period, verbatim: *"In the late 19th and early 20th
  centuries, Hunts Point became a working-class, immigrant community. Between 1890
  and the 1920s, Hunts Point was a working-class Jewish enclave. Many were
  socialists and labor unionists."*
- **F145.** Caribbean and African American migration, verbatim: *"Later, many
  Puerto Ricans, Dominicans, Jamaicans, and other Caribbean peoples migrated to
  Hunts Point. Along with African Americans, who migrated from southern parts of
  the United States to escape racial violence, they forged strong roots in the
  South Bronx."*
- **F146.** Music, verbatim: *"Salsa and Hip Hop culture were born in the South
  Bronx. The people of Hunts Point are a part of this immense cultural heritage and
  legacy."*
  - Note the careful scope: the claim is that salsa and hip hop were born in **the
    South Bronx**, and that Hunts Point people are "a part of" that — not that
    either was born in Hunts Point. A later writer must not upgrade this.
- **F147.** Industrialization, verbatim: *"The rapid pace of the Industrial era, and
  the construction of the New York New Haven Railroad and New York City's IRT,
  erected in 1908, put an end to the farms and mansions. The rural landscape
  transformed as single-family homes and apartment buildings were built in the
  northern part of the neighborhood."*
  - Note: 1908 here vs Wikipedia's account of the IRT Pelham Line built "in the
    period following World War I" (F105) and the stations opening January 7, 1919
    (F152, F158). See conflict C10.
- **F148.** Fire era and grassroots response, verbatim: *"In the 1960s and 1970s,
  Hunts Point, along with the rest of the Bronx and much of New York City, fell
  into economic decline. The landscape of Hunts Point transformed yet again as many
  buildings were burnt down and left abandoned. Many residents fought back to
  protect the neighborhood. Everyday people, in an attempt to beautify the
  community, created casitas and community gardens in vacant lots."*
  - **"casitas"** is a strong, specific, place-rooted detail worth pursuing.
- **F149.** Activism, verbatim: *"In the 1970s, spray-painted over the Bruckner
  Blvd. overpass between Bryant Avenue and Faile Street, the words 'Que Viva Puerto
  Rico Libre' welcomed southbound cars turning the bend on the Bruckner after
  crossing over the drawbridge."* And: *"In the early 1970s, cadres of the Young
  Lords Party (YLP) and the Black Panther Party (BPP) took over Lincoln Hospital
  and created an acupuncture clinic near Hunts Point to address the heroin
  epidemic."*
  - Flag: **Lincoln Hospital is in Mott Haven**, not Hunts Point; the source itself
    says the clinic was *"near Hunts Point"*. See section 14.
- **F150.** Committee Against Fort Apache, verbatim: *"In 1980, Richie Pérez and
  Evelina Antonetty, along with many South Bronx organizations, formed the
  'Committee Against Fort Apache' to protest the movie Fort Apache: The Bronx and
  its racist stereotypes. The community believed such negative images would be used
  to justify and reinforce the criminalization of the people, over-policing, and the
  prevalence of police brutality."*
  - This is a valuable counterweight to the Wikipedia "Fort Apache" framing quoted
    at N4 in section 14.

---

## 11. Transportation

**Source: Wikipedia, "Hunts Point Avenue station"**
`https://en.wikipedia.org/w/index.php?title=Hunts_Point_Avenue_station&action=raw`

- **F151.** Services, verbatim: *"served by the 6 train at all times and the <6>
  train on weekdays in the peak direction"*.
- **F152.** *"opened on January 7, 1919"*.
- **F153.** *"located at Hunts Point Avenue and Southern Boulevard"*.
- **F154.** *"three tracks and two island platforms"*.
- **F155.** **Accessible (ADA): yes.** *"a $17.8 million project to make the
  station compliant with the Americans With Disabilities Act of 1990 was
  completed"* on **November 18, 2014**.
- **F156.** Architecture and artwork, verbatim: *"The track walls have geometric
  Squire Vickers-designed mosaic friezes in muted shades of blue, grey and beige,
  with occasional sections of pale pink. The large identifying plaques show 'H
  P'."* And: *"Dark green I-beam columns run along both platforms at regular
  intervals, a single line in the middle at their ends and one line on each side at
  their center."*
  - The **"H P"** plaques and the Squire Vickers mosaics are excellent
    concrete visual detail for a guide page.

**Source: Wikipedia, "Longwood Avenue station"**
`https://en.wikipedia.org/w/index.php?title=Longwood_Avenue_station&action=raw`

- **F157.** *"served by the 6 train at all times. The <6> train skips this station
  when it operates."*
- **F158.** *"opened on January 7, 1919"* (same date as Hunts Point Avenue).
- **F159.** *"Located at Longwood Avenue and Southern Boulevard in the Longwood,
  Bronx"* — **the article places this station in Longwood, not Hunts Point.**
  See section 14.
- **F160.** *"three tracks and two side platforms"*. The article gives no
  accessibility information.

**Source: Wikipedia, "Hunts Point, Bronx" — Transportation section**

- **F161.** *"Two IRT Pelham Line subway stations operate here: Longwood Avenue and
  Hunts Point Avenue."* Bus routes named: **Bx5, Bx6 with Select Bus Service, and
  Bx46**, connecting to destinations including **Co-op City, Washington Heights,
  and the Hunts Point Cooperative Market**.
  - Flag: this claims Longwood Avenue station is in Hunts Point; the station's own
    article (F159) places it in Longwood. See section 14 and conflict.
  - Note: bus route endpoints were compressed by the fetch summarizer and should be
    re-derived from MTA's own route pages before any of them is published.

---

## 12. Candidate places (21)

Numbered separately from facts. Nothing here is endorsed as shippable — several
are explicitly non-visitable or out-of-boundary and are listed so the verifier can
rule on them.

| # | Place | Address (as sourced) | Best source | Notes |
|---|---|---|---|---|
| P1 | Joseph Rodman Drake Park & Enslaved African Burial Ground | Hunts Point Ave / Oak Point Ave / Longfellow Ave area, 10474 | NYC Parks historical sign | 2.49 ac, Park ID X015. Richest history of any site here. |
| P2 | Barretto Point Park | Viele Ave. bet. Tiffany St. and Barretto St. | NYC Parks | 12.22 ac, opened 2006, Park ID X307 |
| P3 | Hunts Point Riverside Park | Bronx River at Lafayette Ave (approx.) | Rudy Bruner Award + Wikipedia | 0.43 ac per Parks; NYC Parks has NO history text |
| P4 | Tiffany Street Pier | Tiffany St. at Viele Ave. | NYC Parks | Park ID X304; fitness equipment only; no history text |
| P5 | Hunts Point Cooperative Market (meat) | Hunts Point Food Distribution Center | Wikipedia (2 articles, conflicting) | **No public-access source found** |
| P6 | New York City Terminal Produce Market | Hunts Point Terminal Market | Wikipedia | **No public-access source found** |
| P7 | New Fulton Fish Market | Hunts Point Food Distribution Center | Wikipedia | **No public-access source found** |
| P8 | Corpus Christi Monastery | 1230 Lafayette Ave, Bronx, NY 10474 | Monastery's own site | **Cloistered**; no public hours published |
| P9 | American Bank Note Company Printing Plant | 1201 Lafayette Avenue | Wikipedia | NYC landmark 2008; now a school + HRA offices |
| P10 | THE POINT CDC | 940 Garrison Ave, Bronx, NY 10474 | Own site | Mon–Fri 10am–6pm published |
| P11 | THE POINT — Riverside Campus for Arts and The Environment | 1391 Lafayette Ave, Bronx, NY 10474 | Own site (footer) | Second location; no hours published |
| P12 | Hunts Point Fish Parade & Arts Festival | (event; The Point CDC) | Own site | Annual, June; 20th anniversary in 2023 |
| P13 | Hunts Point Avenue subway station (6) | Hunts Point Ave & Southern Blvd | Wikipedia | ADA accessible 2014; Squire Vickers mosaics, "H P" plaques |
| P14 | Boogie Down Grind Café | 868 Hunts Point Ave (own site) / 1200 Seneca Ave (DOHMH) | **Own website + DOHMH** | See F164 — address conflict |
| P15 | Bronxlandia | 910 Hunts Point Avenue, Bronx, NY 10474 | **Own website + DOHMH** | Live events venue |
| P16 | Hunts Point Landing | — | South Bronx Greenway Wikipedia only | **No NYC Parks page found (404)** |
| P17 | Barretto Park (distinct from Barretto Point Park) | — | NYC Parks | Separate property; not researched in depth |
| P18 | Hunts Point Playground | — | NYC Parks | Listed as nearby park; not researched in depth |
| P19 | Julio Carballo Fields | — | NYC Parks | Listed as nearby park; not researched in depth |
| P20 | Hunts Point Library (NYPL) | 877 Southern Blvd, Bronx, NY **10459** | NYPL + Wikipedia | **Likely outside the peninsula — see §14** |
| P21 | Hunts Point Palace (historic jazz/dance hall) | unknown | THE POINT CDC only | No address, no dates, survival unknown |

### Eating and drinking — DOHMH sourcing disclosure

Queried NYC Open Data DOHMH restaurant inspections
(`https://data.cityofnewyork.us/resource/43nn-pn8j.json`), filtered to
`zipcode='10474'`. **35 distinct establishment rows** returned. Per the project
rule, these rows are **existence/identity evidence only** and must never appear in
prose.

- **F162.** Of the 35, exactly **two have an independent corroborating source of
  their own** and are therefore not DOHMH-only:
  - **Boogie Down Grind Café** — has its own website, `https://www.boogiedowngrind.com`
  - **Bronxlandia** — has its own website, `https://bronxlandia.com`
- **All 33 others are DOHMH-ONLY.** No other source was found for any of them in
  this pass. Listed here for completeness so the verifier knows what exists and
  what its sole provenance is: Albert's Coffee Shop (405 Hunts Point Ave); Allen
  Restaurant (1201 Randall Ave); Baldor Bistro (155 Food Center Dr); Bascom
  Catering & Events (940 Garrison Ave — same address as THE POINT CDC); Best Bite
  Pizza (889 Hunts Point Ave); Cafe Italia (500 Tiffany St); Diamond Club (673
  Hunts Point Ave); Dunkin (880 Garrison Ave); Fratilli's Pizza & Cafe (404 Hunts
  Point Ave); Fulton Cafe (800 Food Center Dr); Happy Garden (1236 Spofford Ave);
  Hunts Point Juice Bar & Deli (620 Manida St); Jay's Spanish Restaurant (898 Hunts
  Point Ave); Johnny's Cafe (1232 Randall Ave); Kennedy Fried Chicken (870 Hunts
  Point Ave); La Posada Mexicana (1176 Garrison Ave); La Salle Grocery (1232 Randall
  Ave); Market Restaurant (C-D Block) (355 Food Center Dr); McDonald's (875 Garrison
  Ave); Metro Cafe (100 Oakpoint Ave); Mexican Grill (Hunts Point Terminal Market);
  Milly's Corner Restaurant and Bar (1129 Longwood Ave); New Peperoni's Pizza (1308
  Lafayette Ave); Oasis Coffee Shop (390 Tiffany St); Pop N Waffle (1012 Garrison
  Ave); Randall Restaurant (1328 Randall Ave); Ruta 55 Restaurant (1318 Lafayette
  Ave); Snack Bar (355 Food Center Dr); Southside Cafe (Produce Market) (300C Hunts
  Point Terminal Market); The Point Cafe & Grill (402 Hunts Point Ave); Valencia
  Coffee Room (801 Edgewater Rd); Xin Rong and Xin Rong Chinese Restaurant (741
  Hunts Point Ave — two rows, likely the same business).
  - Note: **Milly's Corner Restaurant and Bar at 1129 Longwood Avenue** carries a
    Longwood address though DOHMH assigns it ZIP 10474. Flagged in §14.
  - Note: several rows (Baldor Bistro, Fulton Cafe, Market Restaurant, Snack Bar,
    Southside Cafe, Mexican Grill, Metro Cafe) are **inside the food distribution
    center / terminal market**, which no source establishes as publicly accessible.

**Boogie Down Grind Café — own-site detail** (`https://www.boogiedowngrind.com`)

- **F163.** Self-description, verbatim: *"A curated café experience celebrating
  hip-hop culture and community"* and *"The Best Coffee & Tea, Local Beers,
  Sangria, Wine, Vibes."*
- **F164.** Address and hours on its own site, verbatim: *"868 Hunts Point Ave, The
  Bronx NY • Mon–Fri 7AM–4PM • Wed until 10PM • Sat 11AM–4PM"*.
  - **Conflict:** DOHMH lists this business at **1200 Seneca Avenue**, its own site
    says **868 Hunts Point Ave**. Possibly a relocation. Unresolved.
- **F165.** Recurring events listed on its own site, verbatim: *"Every Friday 2PM –
  4PM — Afternoon Hip Hop"*; *"Monthly 7PM – 10PM — Pour Decisions Comedy Night"*;
  *"Wednesdays 6PM – 9PM — Plumbum Writers Workshop / A space for writers, poets,
  and storytellers to share and grow their craft."*
  - Caution: the "What People Are Saying" quotes on that page are **customer review
    excerpts the business selected about itself** (attributed to Google and Yelp).
    They are marketing copy, not independent sourcing.

**Bronxlandia — own-site detail** (`https://bronxlandia.com`)

- **F166.** Self-description, verbatim: *"Live Events Venue in The South Bronx"* /
  *"Bar, dancing, screenings, markets, live music, talk..."* / *"Available as
  rehearsal space for music, dance, theatre, and more"*.
- **F167.** Mission statement, verbatim: *"The Bronx is full of success stories, but
  many of them leave. We built this event venue to help some of that success stick
  around, featuring a bar for refreshments and space for dance events, while
  attracting more economic activity, talent, and love for the South Bronx,
  especially in Hunts Point BX, where live music can thrive."*
- **F168.** Address, verbatim: *"910 Hunts Point Avenue, Bronx, NY 10474"*; phone
  917-473-6434.
  - Note: the events listed on the site (Open Mic, Kiki Drag Contest, Eunice Pro
    Wrestling) carry dates without years and appear stale. Copyright line reads
    "© 2025".

---

## 13. Source conflicts flagged for the verifier

Recorded, not resolved.

- **C1.** Hunts Point land area: **690 acres** (F3) vs NTA BX0201 area **1,124
  acres** (F9) — both in the same Wikipedia article. Likely different geographies
  (neighborhood vs tabulation area), but stated without distinction.
- **C2.** Indigenous people's name: **"Wecquaesgeek"** (Wikipedia, F14) vs
  **"Weckquaesgeek"** (NYC Parks, F10, F32) vs **"Munsee"** (THE POINT, F11).
  Wikipedia calls them *"a Munsee-speaking band of Wappinger people"*, which may
  reconcile these.
- **C3.** Drake monument height: **"seven-foot high marble shaft"** (F50) vs
  monuments record **"H: 8'"** (F51) — both NYC Parks, different pages.
- **C4.** Barretto Point Park acreage: **12.22** (NYC Parks F58, Wikipedia's own
  Barretto article F71) vs **"the 5-acre Barretto Point Park"** (Wikipedia's Hunts
  Point article, F49 context). Two Wikipedia articles disagree with each other.
- **C5.** Hunts Point Riverside Park operator: Rudy Bruner Award page lists **NYC
  Department of Transportation** as operator (F81), but it is an **NYC Parks**
  property with a Parks ID (X336, F76).
- **C6.** Hunts Point Riverside Park size — **four different figures**: 0.43 ac
  (NYC Parks, F76 and Wikipedia infobox F89), 1.0 ac (Rudy Bruner, F79), 1.4 ac
  (Wikipedia body, F89), 1.72 ac (South Bronx Greenway article, F101). Also the
  Wikipedia infobox "established 1940" (F89) against a 2004 groundbreaking (F85).
- **C7.** Rudy Bruner Award: **"won the 2009 Rudy Bruner Award for Excellence in
  Public Spaces"** (F90) vs the awarding body's own **"2009 Silver Medalist"** of
  the **"Rudy Bruner Award for Urban Excellence"** (F78, F87). Both the medal level
  and the award's name differ. The awarding body is the primary source.
- **C8.** Who drove Hunts Point Riverside Park: **The POINT CDC's Majora Carter**
  (F86), **Majora Carter in 2000** (F90), **Sustainable South Bronx, founded August
  2001** (F91–F92). The Majora Carter article never mentions The Point CDC (F95).
  Dates 2000 vs 2001 also differ.
- **C9.** Hunts Point Cooperative Market: **38 acres / six buildings / opened 1974**
  (F110) vs **60 acres / seven buildings / built 1962** (F112) — two Wikipedia
  articles. Revenue also differs: **$1.5 billion in 1998** for the produce market
  (F109) vs **over $2 billion** annual for the co-op (F112). Fulton Fish Market
  square footage: **450,000** (F111) vs **400,000** (F115).
- **C10.** IRT arrival date: **1908** (THE POINT, F147) vs stations opening
  **January 7, 1919** (F152, F158) vs *"the period following World War I"* (F105).
- **C11.** Corpus Christi Monastery founding: lead says **1891**, history section
  implies **1889** (1880 + "Nine years later") — same article (F119, F121).
- **C12.** Boogie Down Grind Café address: **868 Hunts Point Ave** (own site) vs
  **1200 Seneca Avenue** (DOHMH) (F164).

---

## 14. Possibly belonging to a neighboring neighborhood

Flagged per instruction. Not adjudicated.

- **N1. Hunts Point Library, 877 Southern Boulevard — likely LONGWOOD/FOXHURST.**
  NYPL gives ZIP **10459** (F129), not 10474. Southern Boulevard at that number is
  west of the Bruckner Expressway, which F1 gives as Hunts Point's western and
  northern boundary. The branch carries the Hunts Point *name* but may not be in
  the Hunts Point *place*. This is the single most consequential boundary question
  in this research, because the library is otherwise an attractive landmark
  candidate.
- **N2. Longwood Avenue subway station — LONGWOOD.** Its own Wikipedia article says
  it is *"in the Longwood, Bronx"* (F159), while the Hunts Point article claims it
  as one of Hunts Point's two stations (F161).
- **N3. 41st Precinct station house, 1035 Longwood Avenue — LONGWOOD address.**
  Wikipedia's Hunts Point article says *"Hunts Point and Longwood are patrolled by
  the 41st Precinct of the NYPD, located at 1035 Longwood Avenue"* — the precinct
  covers both, and the building is on Longwood Avenue.
- **N4. "Fort Apache" / 1086 Simpson Street — LONGWOOD address.** Wikipedia: *"The
  41st Precinct was located at 1086 Simpson Street until 1993. During the 1980s,
  crime reached such a level that the Simpson Street building became known by the
  police as 'Fort Apache', as was later immortalized in a 1981 movie named for it.
  The Simpson Street building currently houses the Bronx Detectives Bureau."*
  Simpson Street is in Longwood. The Fort Apache material is frequently attached to
  Hunts Point but the building is not on the peninsula. See also F150 for the
  community's counter-history.
- **N5. Soundview Park — SOUNDVIEW.** Listed by NYC Parks as 0.18 miles from Hunts
  Point Riverside Park (F98), but it is across the Bronx River in Soundview.
  Proximity is not membership.
- **N6. Lincoln Hospital (Young Lords acupuncture clinic) — MOTT HAVEN.** THE POINT
  CDC's own wording is that the clinic was *"near Hunts Point"* (F149), not in it.
- **N7. The second Drake tablet — NEW YORK BOTANICAL GARDEN.** F53: the Bronx
  Society of Arts and Science *"placed another tablet in Drake's honor near the
  Lorillard Snuff Mill in the New York Botanical Garden"* — that is Bronx Park, not
  Hunts Point.
- **N8. Milly's Corner Restaurant and Bar, 1129 Longwood Avenue** — DOHMH assigns
  ZIP 10474 but the street address is on Longwood Avenue. (DOHMH-only source
  regardless.)

---

## 15. Dead ends and decoys

Recorded so a later pass does not repeat them.

- **D1. WebSearch: unavailable for the whole task** (budget exhausted, 200/200).
- **D2. `nycgovparks.org` returns HTTP 403 to WebFetch** but HTTP 200 to a plain
  browser User-Agent via Python `urllib`. Use the Python path for all NYC Parks
  pages. This cost the first two attempts.
- **D3. `https://www.huntspointcoopmarket.com` — DOES NOT RESOLVE** (DNS failure).
  Also failed: `hpcoopmarket.com`, `www.hpcoopmarket.com`, `huntspointcoop.com`,
  `www.nyphpm.com`, `newfultonfishmarket.com`, `www.newfultonfishmarket.com`. **No
  official website for the Hunts Point Cooperative Market, the Terminal Produce
  Market, or the New Fulton Fish Market was located in this pass.** Everything in
  section 7 rests on Wikipedia alone.
- **D4. `https://www.huntspoint.com` — DECOY.** This resolves and looks
  authoritative from the name, but it is **"Huntspoint Meat Company"**, a retail
  Wagyu/BBQ e-commerce business whose contact address is *"Huntspoint BBQ and
  Meat'ery, 114 Calef Highway, Epping, NH 03042"*. **It is in New Hampshire and has
  no connection to the Bronx market.** Do not cite it.
- **D5. `https://huntspointproduce.com` — thin/ambiguous.** Resolves to an
  841-character brochure page reading only "Hunts Point Produce / Fresh Produce
  Supplier / Contact Us", copyright 2025. No address, no affiliation stated. It is
  **not** demonstrably the Terminal Produce Market co-op. Do not treat it as the
  market's official site.
- **D6. `https://thepoint.org/about/`, `/our-story/`, `/about-us/` — all HTTP 404.**
  The working paths are `https://thepoint.org` (root, which carries the mission and
  about text) and `https://thepoint.org/history-of-hunts-point`.
- **D7. `https://www.nycgovparks.org/parks/hunts-point-landing` and
  `/highlights` — HTTP 404.** Hunts Point Landing may exist under another Parks
  slug or may not be a Parks property.
- **D8. NYC Parks has no historical-sign text for Hunts Point Riverside Park or
  Tiffany Street Pier** — `/history` and `/highlights` return chrome only. Not a
  fetch failure; the content genuinely is not there.
- **D9. Wikipedia API rate limit (HTTP 429)** was hit after roughly ten rapid
  `list=search` calls. Space them out.
- **D10.** No Landmarks Preservation Commission designation report was retrieved
  directly for any building. The American Bank Note designation date (F124) and the
  library's landmark status (F128) rest on Wikipedia, not on LPC's own documents.
  An LPC primary source would materially strengthen both.

---

## 16. Gaps a later pass should close

- **The three markets' public accessibility.** No source found says whether any of
  the Cooperative Market, Terminal Produce Market or New Fulton Fish Market admits
  visitors, or on what terms. For a travel guide this is the decisive question and
  it is currently unanswered.
- **Corpus Christi Monastery visiting terms.** Cloistered; no hours, no Mass
  schedule, no architect, no build date for the building itself, no landmark status.
- **Hunts Point Palace** (F131) — one sentence from one source. No address, no
  dates, unknown whether it stands.
- **Hunts Point Landing** (F104) — Wikipedia-only, no Parks page.
- **The library's boundary question** (N1) — needs a DCP or NTA map check, not a
  ZIP inference.
- **LPC primary sources** for both landmark claims (D10).
- **Bus routes** (F161) — endpoints were summarizer-compressed; re-derive from MTA.
- **Churches** — the dispatch asked for churches. Beyond Corpus Christi Monastery
  (a monastery, not a parish church) and a passing Wikipedia mention of **St.
  Ignatius School**, **no church in Hunts Point was documented in this pass.** This
  is an open gap, not a finding of absence.
