# Golden Gate Park — Finder report

Zone: Golden Gate Park, San Francisco. NOT a neighborhood. It is a single Recreation & Park
regional park that the city's own datasets carry as its own analysis neighborhood, and it abuts
five different residential zones plus Ocean Beach.

Ownership check run first:

    python3 .superpowers/taken_slugs.py golden-gate   -> 0 (Rome-only script; see below)
    python3 .superpowers/vf_taken_all.py "golden gate park" "de young" "academy of sciences" \
        "conservatory" "stow" "windmill" "tea garden" "bison" "spreckels" "botanical" \
        "strybing" "kezar" "polo field" "aids memorial" "beach chalet" "mclaren"
    -> 4389 places across 349 files. NOTHING inside Golden Gate Park is owned.

    IMPORTANT: `.superpowers/taken_slugs.py` globs `priv/seed_data/rome/*.json` ONLY. It reports
    "0 places across 31 shipped files" for every San Francisco query and is USELESS here. The
    corpus-wide scan is `.superpowers/vf_taken_all.py`. Verified a second way by loading
    `priv/seed_data/san_francisco/haight-ashbury.json` directly (41 places, listed below).

One collision, one adjacency risk, both flagged in the STRADDLERS section:
  * `park-emergency-hospital-haight-ashbury` (811 Stanyan Street) is ALREADY SHIPPED in
    haight-ashbury.json. It sits on APN 1700001 — the Golden Gate Park parcel — and the NRHP
    nomination lists it as a contributing building of the Kezar Complex INSIDE the park.
  * `stanyan-park-hotel-haight-ashbury` (750 Stanyan) is the NRHP "Park View Hotel"
    (ref 83001235). It is on the EAST side of Stanyan, outside the park. No conflict.

---

## SOURCE KEY

| tag | source | URL |
|---|---|---|
| [NOM] | National Register nomination, Golden Gate Park, ref. 04001137, 54pp, prepared by Douglas Nelson / Royston Hanamoto Alley & Abey, July 2003 rev. June 2004, certified 10/15/2004 | https://npgallery.nps.gov/NRHP/GetAsset/NRHP/04001137_text |
| [NPS] | NPS nrhp_locations MapServer, layers 0 and 1, queried over envelope -122.515,37.758,-122.448,37.780 | https://mapservices.nps.gov/arcgis/rest/services/cultural_resources/nrhp_locations/MapServer |
| [A10] | DataSF Article 10 landmarks, dataset 97yj-54sx | https://data.sfgov.org/resource/97yj-54sx.json |
| [LM##] | SF Planning designation PDF | https://sfplanninggis.org/docs/landmarks_and_districts/LM###.pdf |
| [HD] | DataSF historic districts / surveyed districts, dataset m22e-6hkz | https://data.sfgov.org/resource/m22e-6hkz.json |
| [RP] | DataSF Recreation & Parks properties, dataset gtr9-ntp6 | https://data.sfgov.org/resource/gtr9-ntp6.json |
| [ART] | DataSF Civic Art Collection, dataset r7bn-7v9c | https://data.sfgov.org/resource/r7bn-7v9c.json |
| [GGGP] | Gardens of Golden Gate Park (operator of Conservatory, Tea Garden, Botanical Garden) | https://gggp.org/ |
| [CAS] | California Academy of Sciences | https://www.calacademy.org/plan-your-visit |
| [BC] | Beach Chalet Brewery & Restaurant | https://www.beachchalet.com/ |
| [PC] | Park Chalet | https://www.parkchalet.com/ |
| [BHB] | Blue Heron Boathouse (formerly Stow Lake Boathouse) | https://blueheronboathouse.com/ |
| [MYC] | San Francisco Model Yacht Club | https://www.sfmyc.org/ |
| [JTG] | Japanese Tea Garden Gift Shop and Tea House | https://japaneseteagardensf.com/ |

---

## BOUNDARY EVIDENCE — read this before assigning anything

Three independent registers each draw the edge differently. The arbitrator needs all three.

**1. National Register [NOM] / [NPS], ref. 04001137.**
Street & number as certified: *"Bounded by Fulton St., Stanyan St., Fell St., Baker St., Oak St.,
Lincoln Way, and The Great Highway."* City or town: San Francisco; vicinity: *"Sunset and
Richmond Districts."* Acreage of property: *"1017 Acres."*
Critically, this boundary **includes the Panhandle**: [NOM] §7 p.3 lists a "Panhandle (Baker Street
to Stanyan Street)" zone with four resources, and §7 p.7 says *"The Panhandle is an additional
appendage that extends from the east end of the park."* It also **includes the Kezar complex**
(Kezar Stadium, Kezar Pavilion, Park Emergency Aid Station, Park Police Station) as its own zone.

**2. SF Recreation & Park property records [RP].** Seven parcels, all with mailing address
**501 Stanyan St** (McLaren Lodge) and `psa` = "GGP":

| property_name | acres | zip | analysis_neighborhood | mons_neighborhood |
|---|---|---|---|---|
| Golden Gate Park - Section 1 | 115.88 | 94117 | Golden Gate Park | Golden Gate Park, Panhandle |
| Golden Gate Park - Section 2 | 81.27 | 94118 | Golden Gate Park | Golden Gate Park |
| Golden Gate Park - Section 3 (complex "GGP-Section 3 - Gardens of GGP") | 52.73 | 94122 | Golden Gate Park | Golden Gate Park |
| Golden Gate Park - Section 4 | 243.52 | 94118 | Golden Gate Park | Golden Gate Park |
| Golden Gate Park - Section 5 | 224.10 | 94122 | Golden Gate Park | Golden Gate Park |
| Golden Gate Park - Section 6 | 212.13 | 94121 | **Golden Gate Park, Outer Richmond** | Golden Gate Park, Outer Richmond |
| Golden Gate Park - Section 7 | 102.23 | 94122 | Golden Gate Park | Golden Gate Park |

So the city's own analysis-neighborhood layer treats **"Golden Gate Park" as a neighborhood in its
own right** — which supports this zone being its own page. Note Section 6 (the western end, where
the Dutch Windmill, Murphy Windmill and Beach Chalet sit) is dual-coded Golden Gate Park + Outer
Richmond. The `mons_neighborhood` for Section 1 is dual-coded Golden Gate Park + Panhandle.
No separate "Panhandle" property row exists in [RP] under that name.

**3. SF Planning historic-district survey [HD], objectid 158, "Golden Gate Park Historic District",
neighborhood field = "Golden Gate Park", nr = "Listed", cr = "Listed", period 1871–1943.** Planning
carries a second, unlisted potential district inside the park: objectid 18, "Conservatory Valley
Historic District", neighborhood "Golden Gate Park", cr = "Eligible", period 1872–1939 — with a
staff note in the data reading *"This is a weird one b/c Conservatory is LM No. 50."* That one is
**eligible, not designated**, and must not be written as a designation.

Three adjacent surveyed districts are OUTSIDE the park and belong to neighbours: "Panhandle Historic
District" (objectid 147, neighborhood "Haight Ashbury", CR-eligible — this is the *housing* around
the Panhandle strip, not the strip itself), "NOPA Historic District" (objectid 119), "Haight Ashbury
Historic District" (objectid 120). All three are CR-eligible only, a10 = "No", nr = "No".

---

## DESIGNATION NUMBERS FOUND — 13 identifiers, all re-fetched live

**National Register (2):**
1. **Golden Gate Park** — historic district, NRHP ref. **04001137**, certified **10/15/2004**.
   37 contributing buildings, 47 contributing sites, 13 contributing structures, 36 contributing
   objects; 20/12/20/4 noncontributing. [NPS] layer 1; [NOM] §5.
2. **Golden Gate Park Conservatory** — building, NRHP ref. **71000184**, certified **10/14/1971**.
   Address as recorded: *"Mount Link, N of John F. Kennedy Dr. at E end of Golden Gate Park."*
   [NPS] layer 0.
3. **Beach Chalet** — building, NRHP ref. **81000172**, certified **07/22/1981**, *"1000 Great Hwy."*
   [NPS] layer 0.
   (Counted as 2 individual + 1 district above; [NOM] §5 records *"Number of contributing resources
   previously listed in the National Register ___2___"*, i.e. the Conservatory and the Beach Chalet.)

**San Francisco Article 10 landmarks on APN 1700001 (the Golden Gate Park parcel) — 10 rows [A10]:**

| LM no. | name as recorded | address as recorded | yeardesignated | designation PDF |
|---|---|---|---|---|
| **50** | Golden Gate Conservatory | John F. Kennedy Drive | 1972 | LM50.pdf |
| **96** | Frances Scott Key Monument *(sic, misspelled in the dataset)* | 0 N.E. End Concourse | 1977 | LM96.pdf |
| **124** | Sharon Building | Golden Gate Park | 1981 | LM124.pdf |
| **147** | Dutch Windmill (North Windmill) | Golden Gate Park | 1981 | LM147.pdf |
| **175** | McLaren Lodge | Golden Gate Park | 1984 | LM175.pdf |
| **179** | Beach Chalet | 1000 Great Highway | 1985 | LM179.pdf |
| **181** | Lawn Bowling Clubhouse and Greens | Golden Gate Park | 1986 | LM181.pdf |
| **201** | Park Emergency Hospital | 811 Stanyan Street | 1991 | LM201.pdf |
| **210** | Murphy Windmill and Millwright's Cottage | M.L. King Drive & Golden Gate Park | 2000 | LM210.pdf |
| **249** | Music Concourse | *(blank)* | 2005 | LM249.pdf |

Cross-check: [NOM] §7 independently names LM #50, #96, #124, #147, #175, #179, #181, #201 and #210,
matching the dataset. LM #249 (Music Concourse, 2005) postdates the nomination and appears only in
[A10].

**Other engineering designation (1):**
* **Alvord Bridge** — [NOM] §7 p.25: *"Alvord Bridge was designated as a National Historic Civil
  Engineering Landmark in 1969."* No number is given in the nomination; ASCE does not number these.
  A verifier should decide whether "National Historic Civil Engineering Landmark, designated 1969"
  satisfies the register-plus-identifier rule with a year alone.

**Two rows to NOT cite.** [A10] also returns "Stow Lake Boathouse" and "Kezar Stadium" with
`landmarkno` = "0", `yeardesignated` = "0.0", no APN and no designation PDF. Those are unnumbered
rows in the same table (survey/pending entries). **Neither is a designated landmark.** [NOM]
independently classes Kezar Stadium as *noncontributing* and the Stow Lake Boathouse as
*noncontributing*.

Per the standing rule: **do not tally these.** The list above is a working sheet for the writer, not
copy. Name the buildings and cite their numbers.

---

## CANDIDATES

148 candidates below, numbered 1–148. Zone assignment for every one is "Golden Gate Park" unless the
entry says otherwise. Dates and attributions are from [NOM] §7 unless another tag is given; [NOM] gives a
date and, where known, a designer for each contributing resource, which is why the confirmation rate
here looks high — it is one document doing the work, and a verifier should treat it as one source,
not as 90 independent ones.

### A. Music Concourse group

1. **Music Concourse** — landscape/plaza. SF Landmark No. 249, designated 2005 [A10].
   [NOM]: *"Music Concourse, 1900, Contributing Site"*; *"The Music Concourse bowl is approximately
   ten feet below the surrounding roadway"*; surface *"asphalt paths with fields of decomposed
   granite at its southwest end, and turf at its northeast end"*; planting is a bosque of pollarded
   deciduous trees, *"The primary species are London Plane and Scotch Elm."* Laid out following the
   1894 Mid Winter Fair.
2. **Spreckels Temple of Music (the bandshell)** — structure, 1900. [NOM]: *"built with funds
   donated by the sugar magnate Claus Spreckels… masonry and concrete structure clad on the exterior
   with Colusa sandstone. Designed by the Reid Brothers architects, the structure consists of a
   central half dome bandshell with two flanking colonnades of eight pairs of ionic columns."*
   Damaged 1906 and 1989; *"An extensive restoration and seismic upgrade was completed in 1994."*
   Its spandrels are separately catalogued: [ART] accession **1899.1**, "Spandrels on Spreckles
   Temple of Music", Robert Ingersoll Aitken, cast concrete, 240 × 554 × 12 in.
3. **de Young Museum** — art museum. **50 Hagiwara Tea Garden Drive, San Francisco, CA 94118**
   ([ART] street_address_or_intersection for works sited at the museum). [NOM] p.18 covers the
   *predecessor* building only: the 1894 Midwinter Fair Egyptian Revival Fine Arts building given to
   the Park Commission; 1919 Spanish Plateresque rebuilding; *"The central section and the tower
   were added in 1921, and the west wing in 1925"*; original 1894 building *"deemed unsafe and
   demolished in 1929"*; Brundidge wing and rear expansion added 1965; *"The buildings were
   demolished in 2003 and a new building is scheduled to be opened in 2005."* The present building
   is therefore 2005 and is classed **noncontributing** in the NR district.
   *GAP: no primary source captured for the present building's architect (famsf.org returned HTTP
   403 on two paths). Needs one before any architect claim is written.*
4. **California Academy of Sciences** — natural history museum, **55 Music Concourse Drive, San
   Francisco, CA 94118** [CAS]. Hours [CAS]: *"Monday–Saturday: 9:30 a.m.–5 p.m. Sunday:
   11 a.m.–5 p.m."* Named venues inside [CAS]: Steinhart Aquarium, Morrison Planetarium, Osher
   Rainforest (*"four-story rainforest, housed in a spectacular glass dome"*), Kimball Natural
   History Museum, and a Living Roof. [NOM] p.18 dates the *previous* Academy buildings:
   *"First built was the North American Hall (now Wild California) followed by Steinhart Aquarium,
   1923; Simson African Hall, 1934; Morrison Planetarium, 1952; Cowell Hall, 1969; Wattis Hall…
   1976; the Fish Roundabout, 1977; and Life Through Time, 1990"*, all classed noncontributing;
   founded in San Francisco in 1853.
   [CAS] carries superlatives ("one of the most advanced and biodiverse aquariums in the world",
   "one of the largest all-digital planetarium domes in the world") — **strip both.**
5. **Steinhart Aquarium** — likely a feature of #4 rather than a separate place; flagged so the
   arbitrator can rule. Two bronze portrait reliefs by Edgar Walters, [ART] accessions **1923.2.1**
   and **1923.2.2**, *"Commissioned by the architect Lewis Hobart upon construction of the Steinhart
   Aquarium in 1923."*
6. **Morrison Planetarium** — same question as #5. [NOM] dates the original 1952.
7. **Japanese Tea Garden** — **75 Hagiwara Tea Garden Drive, San Francisco, CA 94118** [JTG].
   Hours [JTG]: *"Open Everyday. Winter 9AM - 4:45PM; Summer 9AM - 5:45PM"* (gate closes 4:30 pm
   winter, 5:30 pm summer). [NOM] p.19: created by **George Turner Marsh** as a *"Japanese Village"*
   feature of the 1894 Mid Winter Exposition; *"designed and constructed by Makoto Hagiwara"*;
   *"Originally one acre in size, the garden was expanded to five acres in 1902 and Makoto Hagiwara
   designed the expanded garden. The Hagiwara family continued to live and work in the garden until
   1942 when the family was interned during World War II."* Main Gate dated 1894, reconstructed
   1985; South Gate reconstructed 1985; *"The five-story pagoda was originally constructed for a
   Japanese village at the 1915 Panama Pacific International Exposition."* [GGGP] adds the Dry
   Landscape Garden designed 1953 by **Nagao Sakurai** and the tea house *"built for the Mid-Winter
   Exposition of 1894."* [GGGP] superlative *"the oldest operating public Japanese Garden in North
   America"* — **strip.**
8. **Amazarasti-no-Hotoke (the bronze Buddha), Japanese Tea Garden** — [NOM] p.19: *"Buddha, Created
   1790, Placed in Tea Garden 1945, Noncontributing Object… Gift of S. & G. Gump Company in memory of
   A. Livingston Gump — Alfred Gump and William Gump, 1945. Amazarasti-no-Hotoke, the bronze Buddha,
   was cast in 1790 in Tajima Province on Honshu for the Taioriji Temple."* [GGGP] agrees: *"Cast in
   1790 in Japan."*
9. **Hagiwara Family Plaque, Japanese Tea Garden** — [ART] accession **1974.24.a-f**, artist
   **Ruth Asawa**, 1974, bronze on rock, 20 × 24 × 15 in., *"Gift of the John McLaren Society for the
   Japanese Tea Garden"*, facility "Hagiwara Tea Garden".
10. **Rideout Fountain** — Music Concourse centre. [NOM] p.18: by **M. Earl Cummings**, cast stone,
    1924, *"Bequest of Corinne Rideout ($10,000)"*; *"a saber-toothed tiger in combat with a
    cobra-headed serpent."* [ART] accession **1923.1** gives creation_date 1923 and medium
    "Granite", 114 × 173 × 173 in. — **the two registers disagree on year and material; do not
    write either without resolving.**
11. **Page Fountains** — 2 objects, 1914. [NOM]: *"a gift of the widow of Charles Page… two circular
    reflecting pools with granite coping."*
12. **Phoebe Hearst Fountain** — 1926, *"a cast stone double tier fountain with a pair of flanking
    classical stair cases."*
13. **North Tunnel (under JFK Drive)** — 1897, contributing structure. [NOM] p.19: designed by
    **Coxhead & Coxhead**, *"carved Rocklin granite arches that were loosely based on the Arch of
    Titus from ancient Rome… approximately 130 feet long."*
14. **Music Concourse tunnels** — three tunnels, ca. 1900, classed noncontributing; [NOM] p.17 was
    written mid-demolition for the underground garage. **Current state unverified — low confidence.**
15. **Pool of Enchantment** — M. Earl Cummings, bronze, [ART] accession **1917.1.a-b**, 1917, gift of
    Maria Becker; 78 × 330 × 290 in. [NOM] p.18: *"a young Indian boy playing a musical pipe to two
    listening California mountain lions"*; the sculpture was **removed** from the demolished museum
    and, at the time of the nomination, *"currently not present."* [ART] now records it "Public
    Display", *"East Of De Young Museum"*, at 50 Hagiwara Tea Garden Drive. Treat as reinstalled.

### B. Music Concourse monuments (all [NOM] pp.19–22 and [ART])

16. **Miguel de Cervantes Memorial** — Jo Mora, bronze and natural stone, 1916, [ART] **1916.1.a-c**.
    *"Miguel de Cervantes… looks down at two of his fictional creations, Don Quixote and Sancho
    Panza, who kneel before him."* Museum Drive.
17. **Sphinxes** — 2 objects, Arthur Putnam, cast concrete, 1903, [ART] **1903.2.1** and **1903.2.2**,
    each roughly 94–96 × 60 × 144 in. Flank the footpath entrance to the de Young parking area.
18. **U.S. Grant Memorial** — Rupert Schmid, bronze on granite, [NOM] dates 1896, [ART] accession
    **1908.2** gives creation_date "ca. 1908"; 161 × 108 × 108 in. **Year conflict — resolve.**
19. **Sundial** — M. Earl Cummings, bronze and cast stone, [NOM] 1907, [ART] **1907.1** creation_date
    1905. Gift of the National Society of Colonial Dames of America in California. **Year conflict.**
20. **Leonidas (Roman Gladiator)** — George/Guillaumo Geefs, bronze on granite. [NOM] dates the object
    1884 and its gift 1894; [ART] **1893.1** gives creation_date 1881. **Year conflict.**
21. **Lion** — R. Hinton Perry, bronze, [NOM] 1906, [ART] **1906.1** creation_date 1898, 61 × 75 × 87
    in., *"East Of De Young Museum"*. **Year conflict.**
22. **Robert Emmet Memorial** — Jerome Connor, bronze on granite, 1919, gift of James D. Phelan.
    [NOM]: *"Eamon De Valera, President of the Irish Republic in 1919, spoke at the dedication."*
23. **Ludwig van Beethoven Monument** — Henry Baerer, bronze and granite, 1915, gift of the Beethoven
    Maennerchor of New York; dedicated August 15, 1915. [ART] **1951.2** lists artist "Anonymous" and
    creation_date "Unknown". **Attribution conflict.**
24. **Giuseppe Verdi Monument** — Orazio Grossoni, bronze and granite, 1914, [ART] **1914.2.a-b**,
    246 × 179 × 140 in.; gift of the Italian Colony of San Francisco. [NOM] states *"Over 20,000
    people attended the dedication"* and *"this 52-ton statue"* — the tonnage is a measurement and
    publishes; the attendance figure is a crowd claim and should be dropped.
25. **Goethe and Schiller Monument** — Ernst Rietschel, bronze and granite, 1901, [ART] **1901.1**.
26. **The (Apple) Cider Press** — Thomas Shields-Clark, bronze, [NOM] 1894, [ART] **1894.2.a-b**
    creation_date 1892. Purchased by M.H. de Young. **Year conflict.**
27. **Francis Scott Key Monument** — William Wetmore Story, bronze/travertine/marble, [NOM] 1888,
    [ART] **1887.1.a-f** creation_date 1887; gift of the James Lick bequest. **SF Landmark No. 96,
    designated 1977** [A10]. [NOM]: *"the monument was moved in 1909 to the courtyard entrance of the
    Academy of Sciences… placed in storage in 1966… re-erected in its present location at the east
    end of the Music Concourse and dedicated on July 4, 1977."*
    **LOW CONFIDENCE — SEE WARNINGS.**
28. **General John J. Pershing Monument** — Haig Patigian, bronze, [NOM] 1922, [ART] **1922.1**
    creation_date 1921. [NOM] contains *"It is the only statue in Golden Gate Park with its own
    endowment fund"* — that is a superlative construction; **strip.**
29. **Padre Junípero Serra Monument** — Douglas Tilden, bronze and granite, [NOM] 1907, [ART]
    **1907.2** creation_date 1906; base designed by architect Edgar Mathews.
    **LOW CONFIDENCE — SEE WARNINGS.**
30. **Thomas Starr King Memorial** — Daniel Chester French, bronze and granite, [NOM] 1892, [ART]
    **1892.1** creation_date 1890. At JFK Drive and Academy of Sciences Drive.
31. **"Where the Land Meets the Sea"** — Maya Lin, [ART] accession **2008.14**, 2008, marine grade
    stainless steel, 360 × 720 × 180 in., commissioned for the California Academy of Sciences.
32. **"What is Missing?"** — Maya Lin, [ART] accession **2013.2**, 2009–2010, bronze, reclaimed
    redwood and single-channel video with audio, commissioned for the California Academy of Sciences.
33. **"Untitled (Three Dancing Figures)"** — Keith Haring, [ART] accession **2001.1**, fabricated
    1989, enamel on aluminum, facility recorded as "DeYoung Museum". 137.5 × 195 × 175 in.
34. **La poème de la vigne** — Paul Gustave Doré, bronze, [ART] **1894.1**, created 1877–1878, gift of
    M. H. de Young, 186 × 72 × 74 in.

### C. Conservatory Valley

35. **Conservatory of Flowers** — **NRHP ref. 71000184, listed 10/14/1971**; **SF Landmark No. 50,
    designated 1972**. [NOM] p.15: *"The Conservatory of Flowers was the first building in Golden
    Gate Park… The conservatory was acquired for the park from an estate while it was still in
    crates and constructed in 1878… A fire damaged the building in 1883, with repairs that enlarge
    the building made by 1885. The wood and glass building was damaged by storms 1995."*
    Galleries today [GGGP]: Aquatic Plants, Highland Tropics, Lowland Tropics, Potted Plants, West
    Gallery; [GGGP] notes *"The West Gallery is closed for renovation."*
    [GGGP] superlative *"the oldest public wood-and-glass conservatory in North America"* — **strip.**
    [NOM]'s own *"remains its most significant"* — **strip.**
36. **Conservatory Valley** — landscape site, 1872. [NOM]: *"graded in 1872 under the direction of
    William Hammond Hall as a setting for a conservatory… sunken to provide additional shelter from
    the strong ocean winds."* Paved between 1882 and sometime in the 1890s. See [HD] objectid 18 for
    the CR-**eligible** (not designated) Conservatory Valley Historic District, period 1872–1939.
37. **Dahlia Garden** — 1939, in the centre of the Conservatory access drive turnaround. [NOM]:
    *"planted with numerous varieties of dahlias, San Francisco's official flower."*
38. **Arizona Garden** — 1894, *"a historic collection of succulent plants, located east of the
    Conservatory"*, added for the 1894 Mid Winter Fair.
39. **Tunnel under Main Drive (at Conservatory Valley)** — ca. 1890, concrete tunnel with retaining
    wall and balustrade; on axis with the Conservatory.
40. **James A. Garfield Monument** — Frank Happersberger, bronze on granite, 1885, [ART] **1885.1.a-e**,
    200 × 203 × 208 in.; acquired by public subscription. Stands on a knoll east of the Conservatory
    on John F. Kennedy Drive.
41. **Tree Fern Dell** — 1939 planting. [NOM] p.29: *"Australian tree ferns were reportedly first
    brought to the park by Alice Eastwood, Curator of Botany at the California Academy of
    Sciences."* Across JFK Drive from Conservatory Valley. [NOM]'s *"one of the most notable
    features in the park"* — **strip.**

### D. Children's Quarter

42. **Koret Children's Quarter (Children's Playground)** — ca. 1888 site, classed noncontributing
    because no fabric survives from the period. [NOM] p.14: *"the Children's Quarter may be the first
    area of a public park in the United States that is dedicated to children"* — hedged superlative,
    **strip**; the 1888 date publishes.
43. **Sharon Building** — **SF Landmark No. 124, designated 1981** [A10]. 1888. [NOM] p.14: designed
    by architects **George W. Percy and Frederick F. Hamilton**; sandstone Richardsonian Romanesque;
    *"severely damaged in the 1906 earthquake and was rebuilt according to the original plans. A fire
    damaged the building in 1974. A phased restoration of the building was completed in 1992."* Now
    used as an art centre (Sharon Art Studio).
44. **Carousel Building and Ticket Pavilion** — 2 contributing buildings, 1889, designed by architect
    **Arthur Page Brown**. [NOM]: *"essentially a circular Greek temple with its domed roof supported
    by sixteen fluted, tapered wood Doric columns"*; open-air originally, *"a glass and metal
    enclosure was added in 1964"*; 2002 rehabilitation gave it a new metal roof.
45. **Golden Gate Park Carousel** — structure. [NOM]: *"The carousel was built in 1914 (some records
    say 1912) by the Herschell-Spillman Company of North Tonawanda, New York. It originally operated
    in Lincoln Park in Los Angeles and was used at the 1939 Golden Gate International Exposition,
    before being purchased and installed in Golden Gate Park in 1941."* Restored 1984.
46. **Sharon Meadow** — ca. 1880 landscape site. **NAMING FLAG:** the meadow was renamed for Robin
    Williams; [NOM] predates that and uses "Sharon Meadow" only. No source captured for the new name
    — do not use it without one.
47. **Foresters of America Memorial** — 1927 marble fountain, just west of the Sharon Building,
    *"honors foresters killed in World War I, 1917-1919."*
48. **Sarah B. Cooper Memorial** — [ART] accession **1939.1**, artist **Jack Moxom**, 1939,
    sandstone on concrete, 70 × 156 × 90 in., location_description *"Sharon Meadow Picnic"*.
49. **Koret Children's Quarter animal sculptures** — Vicki Saulls, [ART] accession **2007.34.1-5**,
    2007, cast concrete aggregate: yellow crab, pink crab, purple crab, pelican, tortoise. Commissioned
    by the San Francisco Arts Commission.
50. **Alvord Lake Bridge** — 1889 contributing structure. [NOM] p.25: *"it is the first steel
    reinforced concrete bridge in the United States. It was designed by engineer Ernest Ransome and
    is an ornamental structure with imitation stone finish on its exterior, and concrete stalactites
    hanging from inside the 20' span. Alvord Bridge was designated as a National Historic Civil
    Engineering Landmark in 1969."* The "first … in the United States" is a **sequence claim, not a
    superlative** — it should survive; the ASCE designation carries a year but no number.
51. **Alvord Lake** — 1882 site. [NOM]: *"Park Commissioner William Alvord donated $200 for
    construction of a lily pond to grow hardy lilies. The pond was enlarged in 1889… The pond is
    lined with concrete (unlike other park lakes which are lined with clay) and rocks including a
    small island."*

### E. Kezar complex — ALL STRADDLERS with Haight-Ashbury

52. **Kezar Stadium** — **670 Stanyan Street** (Wikipedia infobox; needs a primary source). [NOM]
    p.13: *"The original Kezar Stadium was built in 1924 on the site of the former nursery. It was
    expanded in 1928 with a seating capacity of 65,000 and was home of the San Francisco Forty-niners
    until 1969. The concrete stadium stands were demolished in 1989 for a stadium reconstruction in
    1990."* Classed **noncontributing**. NOT a designated landmark (see the landmarkno-0 warning).
    [ART] accession **1991.3.a-l**, "Kezar Stadium Gates", artist **Alan Fleming**, galvanized metal,
    each 138 in. high, commissioned by the SF Arts Commission for Kezar Stadium.
53. **Kezar Pavilion** — 1926 contributing building. [NOM]: *"a gymnasium building with seats for
    4,000. The Spanish Mission style building was designed by Masten, Bangs, Hurd, and Chace,
    Architects and Engineers, of San Francisco. Willis Polk was also involved in the design… cast
    concrete walls with steel framing and a tile roof. The building fronts on Stanyan Street."*
54. **Park Emergency Aid Station / Park Emergency Hospital** — **SF Landmark No. 201, designated
    1991**, 811 Stanyan Street, **APN 1700001** [A10]. 1902 contributing building. [NOM] p.13: *"the
    first freestanding building of the San Francisco Department of Public Health's emergency hospital
    service. It served as an emergency aid station until 1978. From then until 1991, the building
    served as an ambulance station… load bearing brick walls covered with stucco and plaster."*
    **ALREADY SHIPPED AS `park-emergency-hospital-haight-ashbury`. HARD CONFLICT.**
55. **Park Police Station (Park District Police Station)** — 1910 contributing building, concrete or
    stucco with a tile roof and an attached former stables annex joined by a breezeway.

### F. Other eastern park — Stanyan Street to Crossover Drive

56. **McLaren Lodge** — **SF Landmark No. 175, designated 1984** [A10]. **501 Stanyan St** — the
    mailing address of all seven GGP parcels [RP]. 1896 contributing building. [NOM] p.25: *"built in
    1896 to house the (then) Park Commission and as a residence for Superintendent John McLaren.
    McLaren lived in the Lodge for forty-seven years… designed in a Moorish-Gothic style by architect
    Edward R. Swain. The exterior walls are 18" thick ashlar basalt masonry with sandstone quoins."*
    Administrative headquarters of the Recreation and Park Department.
57. **McLaren Lodge Annex** — 1950 yellow brick and glass, connected to the Lodge by a breezeway.
    Noncontributing.
58. **Haight Street Gate** — 1998 concrete and stone gate; noncontributing. [NOM]: replaced *"granite
    pillars and benches that were constructed in 1909 to commemorate William McCauley."*
    STRADDLER-adjacent: at the Haight/Stanyan corner.
59. **Arguello Gate** — 1915 contributing structure at **Fulton Street and Arguello Boulevard**,
    *"two large pylons and flanking walls… stone ornamented with polychrome terra cotta and copper
    metal urns and globes. The gate was a gift of Philomen Clark in memory of Crawford W. Clark."*
    STRADDLER with the Inner Richmond (Fulton Street edge).
60. **Brown Gate (bear and cougar), 8th Avenue and Fulton Street** — M. Earl Cummings, bronze on
    sandstone, 1908, [ART] **1908.3.a** (Bear, 115 × 72 × 48 in.) and **1908.3.b** (Lion,
    116 × 87 × 64 in.); gift of Suzanna Brown. [NOM]: *"In 1948 the road needed widening, so the
    gateway was moved several feet apart."* STRADDLER — Fulton Street edge.
61. **Stanyan/Fulton wall** — ca. 1902 contributing structure. [NOM] p.26: *"The stone masonry wall
    extends along Stanyan Street from Fell Street and along Fulton Street to 2nd Ave… rustic
    stone-like rectangular blocks and a concrete cap."* STRADDLER along two zone edges at once.
62. **Golden Gate Park tennis courts** — 1901 contributing site. [NOM] p.26: *"Eight tennis courts
    were originally installed in 1901. As of 1935, there were twenty-one courts, the same number
    that exists today, in the exact arrangement as they were during the historic period."*
    **NAMING FLAG:** the courts were rebuilt as a named tennis centre after 2004; no source captured.
    The [NOM] 1950 tennis clubhouse (noncontributing) is probably gone. **Low confidence on current
    state.**
63. **Lawn Bowling Clubhouse and Greens** — **SF Landmark No. 181, designated 1986** [A10].
    [NOM] p.26: greens 1901–1928 — *"The first lawn bowling green was constructed in 1901 and is
    reportedly, the first public lawn bowling green in the United States. Another lawn bowling green
    for women was built in 1913, and a third green was completed in 1928."* Clubhouse 1915,
    *"a flat-roofed, wood frame Edwardian style building, built in 1915 to replace an earlier
    clubhouse dating to 1902"*, extension added 1971.
64. **Big Rec (Recreation Grounds) baseball grounds** — 1893 contributing site. [NOM] p.27:
    *"Originally shown on William Hammond Hall's 1870 plan… officially developed in 1893.
    Approximately 12 acres in size, the large open meadow once held as many as nine baseball games…
    Today, there are two regulation baseball diamonds with skinned infields and concrete stands. The
    east stands were constructed in 1950… The grandstands are named in honor of James Nealon, founder
    of a benefit fund for injured ballplayers, and Charles Graham, first owner of the San Francisco
    Seals."*
65. **Handball courts** — 1902–1937 contributing building, *"a concrete structure with glass skylight
    roof."*
66. **Horseshoe courts and the horseshoe bas relief** — 1922–1937 contributing site plus one
    contributing object. [NOM] p.28: *"The area includes 16 courts and they were reportedly first
    developed on this site in 1922… At the end of the courts, on the hillside, is a monumental bas
    relief concrete horse created in 1937 by Jesse "Vet" Anderson of the Horseshoe Club."* Located on
    the side of Mt. Lick at the northeast corner of the park.
67. **Shakespeare Garden** — 1928 contributing site. [NOM] p.28: *"created in 1928 from an idea of
    Alice Eastwood, Curator of Botany at the California Academy of Sciences… approximately 1/2 acre
    in size… The focal point is a brick wall which contains six bronze panels with 88 floral
    quotations from Shakespeare's plays, and a recessed case containing a bronze bust of Shakespeare.
    The bust was a gift from the citizens of Stratford-on-Avon, England, and is a copy of the cast
    made in 1814 by George Bullock… a cast iron and limestone sundial at its center which was created
    by L Cardini and installed in 1928."* The bust is [ART] accession **1928.2**, 1814, bronze on
    concrete, 38.5 × 25 × 12 in.
68. **Peacock Meadow** — 1895 contributing site, between Conservatory Valley and McLaren Lodge.
69. **Casino Meadow** — 1896 contributing site, west of the Conservatory. [NOM] p.28: *"the site of a
    casino originally built in 1882… expanded with a second story in 1890 and apparently removed in
    1896. The meadow now hosts the annual Shakespeare in the Park festival."*
70. **Sunken Meadow** — contributing site, date unknown, *"bisected by JFK (Main) Drive near 14th Ave."*
71. **National AIDS Memorial Grove (de Laveaga Dell / Deer Glen)** — 1902 to present, classed
    noncontributing. [NOM] p.29: *"developed into a landscape feature in 1902 by John McLaren, with
    funds donated by Joseph de Laveaga. McLaren used a natural seasonal spring and created a rockery
    cascade under the canopy of oaks… Prior to this development, the site was called the Deer Glen
    and was a fenced compound housing the park's deer collection. The area fell into disuse and
    became overgrown until 1991, when a volunteer group chose the site for the AIDS Memorial Grove."*
    *GAP: nationalaidsmemorial.org returned only a tracking pixel on three paths. The federal
    designation (an act of Congress in the 1990s) is NOT sourced here. Do not write it without one.*
72. **Quarry Lake (Lily Pond)** — 1902 contributing site, *"created from one of several red rock
    quarries in the park."*
73. **Powell Street Railway Shelter** — 1889 contributing building. [NOM] p.29: *"constructed in 1889
    and as a gateway to the park for riders of the Powell Street Cable Car. It served the railroad
    until 1906, and now serves as a pedestrian entrance… gable-roofed rectangular structure that is
    open on both ends. The walls are a combination of wood, concrete, and brick. The roof structure
    is composed of exposed heavy timber trusses with mortise and tenon joints."*
74. **John McLaren Memorial Rhododendron Dell** — 1942 contributing site. [NOM] p.29: *"the new
    rhododendron dell stretches across 25 acres on the north facing slope of the park's middle
    ridge… It was started in 1942, and designated as the John McLaren Memorial Rhododendron Dell
    after his death in 1943."*
75. **John McLaren statue** — M. Earl Cummings, bronze, [NOM] dates the work 1911 and its placement
    1944, [ART] **1944.1** gives "ca. 1944", 67 × 25 × 28 in., gift of A.B. Spreckels. [NOM]: *"the
    bronze figure stands at ground level, absent the standard granite pedestal… the superintendent
    refused to accept the statue made in 1911 in his honor. The work stood on Cummings' doorstep for
    years until its placement in 1944 after McLaren's death."* Classed noncontributing.
    [NOM]'s *"the longest serving superintendent"* — **strip.**
76. **General Henry Halleck Monument** — Carl H. Conrads, granite, 1886, [ART] **1886.1**,
    190 × 72 × 72 in., gift of Major General G.W. Callum. On JFK Drive across from Peacock Meadow.
77. **Baseball Player / Ball Thrower** — Douglas Tilden, bronze on granite, [NOM] dedicated 1891 and
    placed 1892; [ART] accession **1889.1** gives creation_date 1889, 131.25 × 69 × 54 in.
    **Year conflict.** Gift from W.E. Brown of the Southern Pacific Railroad.
78. **Robert Burns Memorial** — M. Earl Cummings, bronze and granite, [NOM] 1908, [ART] **1908.1**
    creation_date 1906, 218 × 204 × 127 in.; gift of the Scots of San Francisco. On the south side of
    JFK Drive opposite the 8th Avenue and Fulton Street entrance. **Year conflict.**
79. **Father William D. McKinnon Monument** — D. John McQuarrie, bronze and granite, 1927; chaplain of
    the First California Volunteers of 1898 and 1899.
80. **Heroes Redwood Grove and Gold Star Mothers Rock** — grove 1939, *"a 15-acre memorial… on the
    north side of the park between 10th Ave. and Park Presidio Blvd."*; the rock 1932, *"the 20-ton
    boulder was removed from Twin Peaks."* STRADDLER with the Inner Richmond (10th Avenue/Fulton).
81. **The Redwood Memorial Grove, The Doughboy and Doughboy Meadow** — grove 1930, *"consists of 37
    redwood trees, one for each fallen member"*; the Doughboy by **M. Earl Cummings**, [NOM] 1930,
    [ART] **1930.1** creation_date 1928, bronze, 168 × 126 × 97 in., *"a hatless male figure holding
    a wreath to his chest… flanked by two wood flag poles… north of JFK Drive near 16th Avenue."*
82. **Rose Garden and Thomas Masaryk Memorial** — garden 1961, noncontributing; [NOM] p.30:
    *"developed in 1961 on the site of what was once a roadway between 14th Ave. and Main (JFK)
    Drive. The roadway was removed when Park Presidio Bypass was built in 1939… a double row of
    rectangular beds."* The Masaryk bust by **J. Matatka**, bronze and granite, 1962, at the garden
    entrance on JFK Drive; *"previously exhibited at the 1939 World's Fair on Treasure Island."*
83. **Pioneer Log Cabin** — 1911 contributing building. [NOM] p.31: *"built as a meeting house for
    the Association of Pioneer Women of California. It was built in 1911 and expanded in 1931. The
    building is constructed of unpeeled redwood logs from Humboldt County and has two rustic masonry
    chimneys."* Restored 1995.
84. **Pioneer Mother** — Charles Grafly, bronze, [ART] **1914.1**, created 1914, installed 1940,
    181 × 91 × 78 in. Near the Pioneer Log Cabin at the Stow Lake entrance off JFK Drive; exhibited
    at the 1915 Panama-Pacific International Exposition.
85. **Prayer Book Cross** — 1894 contributing object by **Ernest Coxhead**, sandstone. [NOM] p.31:
    *"erected by the Northern California Episcopal Diocese to commemorate the first religious service
    in the English language on the Pacific Coast, held by Francis Fletcher, chaplain to Sir Francis
    Drake, on the shores of Drake's Bay on June 24, 1579. The sandstone cross stands 57 feet high,
    and was modeled after a Celtic Cross on the Scottish island of Iona. It was unveiled on opening
    day of the Mid Winter Fair, January 1, 1894."* On a hill north of JFK Drive opposite 20th Avenue.
86. **Rainbow Falls and Cascade** — 1930 contributing site, *"a man-made waterfall and rockery, with
    water pumped from Lloyd Lake… a gift of Mr. and Mrs. Herbert Fleishhacker, who returned from a
    trip to Paris in 1924 with pictures of a waterfall in the Bois de Boulogne."*
87. **Ninth Avenue playground** — noncontributing site at Fulton Street and Ninth Avenue, at the north
    end of the tunnel under JFK Drive. STRADDLER with the Inner Richmond.

### G. Strybing Arboretum / San Francisco Botanical Garden

88. **San Francisco Botanical Garden (Strybing Arboretum and Botanical Gardens)** — **1199 9th
    Avenue, San Francisco, CA 94122** ([ART] street_address_or_intersection for accession 1968.66).
    [NOM] p.22: *"The 70-acre site consists of a series of geographic and thematic gardens… John
    McLaren first proposed an arboretum on this site in 1890, based on the idea of Harvard
    University's Arnold Arboretum… in 1926 Helene Strybing gave a gift to the Park Commission for
    development of the arboretum as a memorial to her late husband Christian Strybing. A 1930s
    master plan established the design concepts… The arboretum officially opened in May 1940.
    Gardens have been added through the years, and 55 of the 70 acres are developed."*
    [GGGP] today: *"Explore 55 beautiful acres of landscaped gardens and open spaces that showcase
    more than 8,000 different kinds of plants from around the world"*; opened 1940. Named
    collections [GGGP]: Andean Cloud Forest, Australia, California, Chile, Mediterranean,
    Mesoamerican Cloud Forest, New Zealand, South Africa, Southeast Asia Cloud Forest, Temperate
    Asia; Camellias, High Elevation Palms, Magnolias, Rhododendrons; Ancient Plants, Moon Viewing
    Garden, Children's Garden, Conifer Lawn, Celebration Garden, Fountain Plaza, Garden of Fragrance,
    Great Meadow, Succulent Garden, Zellerbach Garden. STRADDLER with the Inner Sunset (9th Ave/
    Lincoln Way corner); the [RP] parcel is Section 3, analysis_neighborhood "Golden Gate Park".
89. **San Francisco County Fair Building (formerly the Hall of Flowers)** — 1960, noncontributing.
    [NOM] p.23: *"contains an auditorium, meeting rooms, exhibition space, and offices for Strybing
    Arboretum. The Mid-century Modern building was designed by architects Appleton and Wolfard and is
    constructed of cast concrete walls that are scored into blocks and a metal pan roof. The name was
    changed in 1986 to avoid confusion with the Conservatory of Flowers."*
90. **Helen Crocker Russell Library of Horticulture** — 1972, noncontributing. [NOM] p.23:
    *"designed by the firm of Yuill-Thorton, Warner and Levikow, and dedicated in 1972… an extension
    of the County Fair Building."*
91. **St. Francis of Assisi (Feeding the Birds)** — Clara Huntington, bronze, [ART] accession
    **1958.26**, created 1939, gift of the artist in 1958, 78 in. H × 35 in. W, facility "San
    Francisco Botanical Garden".
92. **Granite stupa, San Francisco Botanical Garden** — [ART] accession **1968.66**, anonymous,
    granite, *"Gift from Gumps to the Recreation and Park Commission"*, 1199 9th Avenue.

### H. Stow Lake / Blue Heron Lake area

93. **Stow Lake / Blue Heron Lake** — 1893 contributing site. [NOM] p.23: *"The 12.7-acre lake is
    built on the flank of Strawberry Hill, the largest bedrock hill in the park… Stow Lake was
    completed, along with Huntington Falls, in 1893… It was built as an overflow lake for a major
    reservoir set on top of Strawberry Hill… The lake was constructed with a 10-inch layer of clay on
    top of which was placed a 3-inch layer of crushed rock that was rolled into the clay."*
    **NAMING CONFLICT, HIGH PRIORITY:** the concessionaire's site now trades as
    **Blue Heron Boathouse** at **50 Blue Heron Lake Dr, San Francisco, CA 94118** [BHB], and
    `stowlakeboathouse.com` issues a **301 Moved Permanently** to `blueheronboathouse.com` —
    strong evidence the lake and its drive were officially renamed. But [BHB]'s own image captions
    still read *"Stow Lake Boat House"* and *"Stow Lake Bridge"*, and [NOM] and [A10] both say Stow
    Lake. **No source captured for the renaming ordinance or its date.** Whichever name the writer
    uses, it needs one. Treat "largest lake in Golden Gate Park" and "largest bedrock hill" as
    superlatives — **strip both**; the 12.7-acre figure is a measurement and publishes.
94. **Strawberry Hill** — the island in the lake. [NOM] p.23: *"Prior to construction of Stow Lake,
    Strawberry Hill was known as "The Island" because it was a vegetated hill in a sea of sand…
    A carriage road traversed up the side of the hill."*
95. **Blue Heron Boathouse (Stow Lake Boathouse)** — 1893 and 1946, noncontributing building. [NOM]
    p.23: *"first constructed in 1893 and later rebuilt in 1946. It is situated at the northernmost
    part of Stow Lake. The building provides space for boat rentals, a food concession, a gardeners'
    office, and concession office… The gabled building has horizontal wood siding and an
    asphalt-shingled roof."* [BHB] today: **50 Blue Heron Lake Dr, San Francisco, CA 94118**;
    rents *"American-Made row and pedal boats"* by the hour; café serving *"lattes to local wine,
    hamburgers to salads."* [BHB] states no hours.
96. **Huntington Falls** — 1893 and 1984, noncontributing site. [NOM] p.24: *"The falls consist of
    concrete sculpted to look like natural rock and provide a cascade approximately 90 feet high. In
    1962, a broken irrigation line undermined much of the concrete foundations for the falls, causing
    its collapse. The falls were completely reconstructed in 1984. The falls are named in honor of
    railroad magnate Collis P. Huntington."*
97. **Chinese Pavilion** — 1981, noncontributing structure. [NOM] p.24: *"a gift from San Francisco's
    sister city Taipei, Taiwan. The wood and concrete structure was built in 1981 as a Chinese-style
    moon-viewing platform."*
98. **Sweeney Observatory ruin** — 1891, noncontributing site. [NOM] p.24: *"a two-story circular
    stone structure for viewing… built with funds donated by Thomas U. Sweeney… The observatory was
    destroyed in the 1906 earthquake and never rebuilt. All that remains today is the circular
    concrete foundation and a few of the building stones."*
99. **Roman Bridge** — 1893 contributing structure by **Arthur Page Brown**, *"a gentle arch…
    constructed of iron-reinforced, smooth-finished concrete"*, crossing the north side of the lake.
100. **Rustic Stone Bridge** — 1893 contributing structure, also **Arthur Page Brown**, *"a more
     steeply arching pedestrian bridge that crosses the south arm of Stow Lake… covered with bulging
     rustic stones."*

### I. Middle park — Crossover Drive to the Chain of Lakes

101. **Golden Gate Park Stadium (the Polo Field)** — 1906–1909 contributing site. [NOM] pp.31–32:
     *"built in 1909 as a scaled down version of what was planned to be the world's largest
     amphitheater designed by architect brothers James and Merritt Reid"* (**strip the superlative,
     keep the Reid attribution**). *"One 200'-long, experimental section of the grand stadium was
     built in 1909… The stadium included a trotting track on the outside perimeter, a cinder path for
     bicycles inside the stadium, and space (lots of it) for polo and football in the center (large
     enough for six football fields). A 10'-high graded berm, with the trotting track on top,
     encloses the 17-acre field. Eighteen sections of concrete stands line the embankment on the
     north side of the field, and another six sections on the south side."*
102. **Golden Gate Park Stables** — 6 contributing buildings, 1939. [NOM] p.32: *"a WPA project
     completed in 1939. The facility consists of a quadrangle of stables around a central riding
     ring. The buildings are concrete with gabled clay tile roofs… The grandstand structure was built
     in 1909 as part of the Golden Gate Park Stadium."*
103. **Park Police Stables** — 1936 contributing building. [NOM] p.32: *"house the San Francisco
     Police Department's mounted unit horses. It is a two-story concrete T-shaped building with a red
     tile roof… A copper cupola sits on the ridgeline of the roof."* Renovated 1995.
104. **Anglers' Lodge and Fly Casting Pools** — 1936 contributing building. [NOM] p.32: *"constructed
     in 1936 with WPA funds. It is home to the Golden Gate Anglers and Casting Club, which was
     founded in 1890… a single story wood frame rustic building situated on a rise overlooking the
     flycasting pools… The shutters have a carved fish motif… The flycasting pools are concrete with
     sloping sides, 450' wide by 185' long, and are divided into three sections."*
105. **Breon Gate (19th Avenue)** — 1924 contributing structure at 19th Avenue and Lincoln Way,
     *"two large ornamented stone pylons. The inscription reads "This gateway dedicated by Cristine
     Breon to all who enter the park, 1924.""* STRADDLER with the Inner Sunset.
106. **Lloyd Lake** — 1892 contributing site, *"a naturalistic reflecting pond 1.4 acres in size…
     named in honor of Ruben Lloyd (1835-1909), park commissioner."*
107. **Portals of the Past** — 1909 contributing object. [NOM] p.33: *"the portico of the former
     mansion of A.N. Towne, President of the Southern Pacific Railroad. The mansion, designed by
     architect Arthur Page Brown, stood at California and Taylor streets until it was destroyed by
     the fire resulting from the 1906 earthquake. The only thing left standing was the stone portico…
     The portico was donated to the park and erected in 1909."*
108. **Speedway Meadow (Hellman Hollow)** — 1907 contributing site. [NOM] p.33: *"A "speed road" was
     completed in 1894 as a place to race horses. It was a straight road .9 mile long… The site was
     used as a camp for a while after the 1906 earthquake, after which it was returned to park use as
     a meadow."* **NAMING FLAG:** renamed Hellman Hollow after the nomination; no source captured.
109. **Marx Meadow** — 1907 contributing site. [NOM] p.33: *"named for Lawrence Marx, who was the
     Conservatory foreman for many years (another reference states that it was named for Johanne
     Augusta Emily Marx, who willed $5,000 to the park… upon her death in 1914). In 1936, a road was
     built through the meadow as part of the construction of Crossover Drive. The road was closed to
     traffic in 1981, and returned to meadow the following year."*
110. **Lindley Meadow** — 1902 contributing site, *"named in honor of former president of the Park
     Commission, Curtis Lindley."* [NOM]: *"Historic photographs show that sheep were once used to
     maintain the grass."*
111. **Little Speedway Meadow** — ca. 1907 contributing site, between Chain of Lakes Drive and the
     Polo Field, *"the western remnant of the speed road which was removed with the construction of
     the Polo Field in 1906."*
112. **Spreckels Lake** — 1904 contributing site. [NOM] p.34: *"approximately six acres in size. Its
     primary function, in addition to its role as a landscape feature, is for model boating. Unlike
     other lakes in the park, Spreckels Lake is surrounded by a concrete edge and sidewalk."*
113. **San Francisco Model Yacht Club** — 1938 contributing building. [NOM] p.34: *"constructed in
     1938 to house boats of the San Francisco Model Yacht Club… concrete walls with a hipped red tile
     roof. Two attached restrooms flank either side of the building. This building replaced an
     earlier clubhouse built in 1904."* [MYC]: *"We are located in San Francisco's historic Golden
     Gate Park at the 36th Avenue and Fulton Street entrance"*; *"Established in 1898."* [MYC]'s
     *"believed to be the oldest such organization in the United States"* — **strip**; the 1898
     founding year is a trading-duration claim from the club's own site and **does not publish**
     under the standing rule, but the 1938 and 1904 clubhouse dates from [NOM] do.
     STRADDLER — Fulton Street edge, Central Richmond.
114. **Senior Center (former San Francisco Police Training Academy)** — 1932 contributing building.
     [NOM] p.34: *"originally built as the San Francisco Police Training academy in 1932. It was
     converted to a senior center in 1965… scored concrete with cast stone quoins at the corners and
     a glazed tile roof. A semicircular driveway connects the building to Fulton Street."* STRADDLER
     — one of only three park buildings that face outward rather than inward.
115. **Pétanque court** — 1907 contributing site, *"a gravel or dirt surface and low sideboards."*
116. **Buffalo (Bison) Paddock** — 1900 contributing site. [NOM] p.34: *"Buffalo (correctly called
     bison) were introduced into the park in 1890 as part of a national effort to prevent their
     extinction. They were initially placed in a paddock near the de Laveaga Dell. The small herd was
     moved to the current location in the western end of the park around 1900. The paddock consists
     of a large fenced open space. A feeding shelter and isolation pens (dates unknown) are located
     at the west end."*
117. **Dog Training Field** — 1905 contributing site, *"a 1.2-acre field located behind the Buffalo
     Paddock… surrounded by a low chain link fence."*
118. **Metson Lake** — 1906 contributing site, *"about one acre in size and is named for William
     Metson, a park commissioner at the time of the 1906 earthquake. At its east end is a contrived
     rockery from which water flows into the lake."*
119. **Mallard Lake** — 1909 contributing site, *"1.4 acres in size and sits on the site of what was a
     natural seasonal fresh water pond… located along MLK Drive near 27th Avenue."*
120. **Elk Glen Lake and Elk Glen Meadow** — lake ca. 1935, 1.8 acres. [NOM] p.35: *"Elk Glen had been
     a fenced compound for Roosevelt Elk… The remaining elk were removed to the zoo in 1935, and Elk
     Glen Lake was created soon after… for the purpose of additional reservoir storage for the park's
     water system."*
121. **Mothers Meadow, playground and restroom** — meadow date unknown, contributing; restroom 1936,
     with a bronze plaque reading *"Built by Works Progress Administration 1935-1936."*
122. **Chain of Lakes — North Lake** — 1898 contributing site, 3.8 acres. [NOM] p.36: *"the lowest
     lake in the park's water system… There are several small islands that were connected with rustic
     bridges (no longer present). The islands are planted with wetland trees such as swamp cypress,
     weeping willows, and alders. The lake has undergone an extensive rehabilitation completed in
     2004."*
123. **Chain of Lakes — Middle Lake** — 1898 contributing site, 1.3 acres, *"well hidden by tules and
     other dense planting."*
124. **Chain of Lakes — South Lake** — 1898 contributing site, 1.1 acres.
125. **Urban Forestry Center** — noncontributing maintenance site; [NOM] p.35 notes it occupies the
     site of the McQueens water treatment plant (ca. 1935), *"the first secondary water treatment
     plant."*
126. **Park nursery** — 1924 contributing site, *"established in 1924 as a replacement for the
     original nursery which was located on the site of Kezar Stadium."*

### J. Western park — west of the Chain of Lakes

127. **Dutch Windmill (North Windmill)** — **SF Landmark No. 147, designated 1981** [A10].
     1902 contributing structure. [NOM] p.37: *"built in 1902 to pump water from wells near the
     windmill to the reservoir on Strawberry Hill. The Park Commission approved development of a
     "windmill of the Holland type."… It was designed by Alpheus Bull, Jr., a mechanical engineer
     from the Union Iron Works and had a capacity of 30,000 gallons per hour. The structure is 75
     feet tall, and has a 5-foot thick concrete foundation with a diameter of 33 feet. The tower is a
     wood frame structure covered with wood shingles. The pumps were electrified in 1913… During
     World War II, the internal machinery was removed for the scrap metal drive… Funds were donated
     for a rehabilitation, which was completed in 1981 after several years of work donated by the
     U.S. Navy Construction Battalion (the Sea Bees)… A caretaker's cottage was built adjacent to the
     mill in 1903. The cottage was demolished sometime after 1935."* STRADDLER with Ocean Beach.
128. **Queen Wilhelmina Tulip Garden** — contributing site, date unknown. [NOM] p.37: *"Queen
     Wilhelmina of the Netherlands reportedly visited the site at some time. Upon her death in 1962,
     the garden was named in her honor."* Adjacent to the Dutch Windmill. STRADDLER with Ocean Beach.
129. **Murphy's (South) Windmill** — **SF Landmark No. 210, designated 2000** (with the Millwright's
     House) [A10]. 1905 contributing structure. [NOM] p.38: *"With funds donated by Samuel Murphy, a
     larger windmill with a capacity of 40,000 gallons per hour, was built in 1905 at the southwest
     corner of the park. At 95 feet tall and a span of 114 feet, it was the largest windmill of its
     kind in the world"* (**strip the superlative; keep 95 feet and the 114-foot span**). *"The
     structure has a massive concrete foundation supporting a wood-framed tower that is covered with
     slate roofing shingles. It was said to be designed after English style windmills and is
     sometimes referred to as the English Windmill. The windmill was not used for pumping water after
     1913 when electric pumps were installed."* STRADDLER with Ocean Beach.
130. **Millwright's House** — 1909 contributing building, part of **SF Landmark No. 210**. [NOM] p.38:
     *"a small, two story brick building with a slate shingle roof. The house, designed by the Reid
     Brothers, is most significant when viewed in context with the windmill."*
131. **Beach Chalet** — **NRHP ref. 81000172, listed 07/22/1981**; **SF Landmark No. 179, designated
     1985** [A10]. **1000 Great Highway, San Francisco, CA 94121** [BC]. 1925 contributing building.
     [NOM] p.37: *"the second structure of that name on the Great Highway… The first Beach Chalet was
     built in 1900 on the west side of the Great Highway. It was removed in 1925 with the
     construction of the new Beach Chalet which was the last commission of noted San Francisco
     architect Willis Polk. The building is a simple stucco Spanish-Moorish revival pavilion. The
     upper floor housed a restaurant and the lower floor had a public lounge and changing rooms for
     visitors to the beach. The interior was significantly enhanced in 1936 and 1937 with the
     addition of frescoes, mosaics and wood carvings. The work, funded by the Federal Art Project of
     the Works Progress Administration (WPA), was designed by San Francisco artist Lucien Labaudt…
     The Beach Chalet was used by the Army during World War II… The building was closed for
     renovations by the city in 1981. The building's artwork underwent a restoration in 1987, but the
     building remained closed to the public until December 1996 when it reopened with a new
     restaurant on the second floor and the park's first visitor center on the ground floor."*
     STRADDLER with Ocean Beach — its address is on the Great Highway.
132. **"People and Places of San Francisco" (Lucien Labaudt WPA frescoes)** — [ART] accession
     **1936.2**, artist **Lucien Labaudt**, 1936, fresco, 109 × 814 × 331 in.,
     *"WPA Mural Project for the Beach Chalet at Golden Gate Park"*, facility "Golden Gate Park".
     [BC] describes *"Historic Lucien Labaudt WPA murals inside the Golden Gate Park Visitor Center."*
     **This is a mural, not architecture — 17 USC 120(a) does not reach it. Writable, not
     photographable, and the page must say nothing about why.**
133. **Beach Chalet Brewery & Restaurant** — **1000 Great Highway @ Ocean Beach, San Francisco, CA
     94121** [BC]. Hours [BC]: *"Monday-Friday: 11 a.m. - 9 p.m.; Saturday-Sunday: 10 a.m. - 9 p.m.;
     Happy Hour: Weekdays 4 p.m. - 6 p.m.; Weekend Brunch: 10 a.m. - 2:30 p.m."* STRADDLER with
     Ocean Beach.
134. **Park Chalet** — **1000 Great Highway, San Francisco, CA 94121** [PC], a coastal restaurant and
     beer garden on the park side of the Beach Chalet building. Hours [PC]:
     *"Monday-Friday: 12pm-7pm; Saturday-Sunday: 10am-7pm; Happy Hour: Monday-Friday 4pm-6pm;
     Brunch (weekends): 10am-2:30pm."* STRADDLER with Ocean Beach.
135. **Roald Amundsen Monument** — Hans Jauchen, red Norwegian granite and bronze, [NOM] 1929, [ART]
     **1929.1** "ca. 1929", 139 × 38 × 38.5 in. [NOM] p.37: *"honors Roald Amundsen who completed the
     first crossing of the almost mythical Northwest Passage in 1906… Amundsen made the voyage around
     the top of North America in a small sloop, the Gjoa, completing the journey in San Francisco.
     The crew was honored by the city, and the Gjoa was placed at Ocean Beach. The monument, located
     just north of the Beach Chalet, was dedicated in 1929. Gjoa remained at the monument until 1972
     when it was returned to Norway."* A second bronze plaque, [ART] accession **2000.2**, artists
     **John and Rolph Kricken**, 2000, *"Amundsen Historical Plaque."* STRADDLER with Ocean Beach.
136. **Beach Chalet Soccer Fields** — contributing site; [NOM] p.38: *"Soccer fields have been located
     at this site, just southeast of the Beach Chalet, since at least 1935."*
137. **Bercut Equitation Field** — contributing site. [NOM] p.38: *"a fenced arena with small
     grandstand and judging booth used for training of horses and riders… which was the west end of
     the Speed Road. The equitation field was dedicated to Commissioner Peter Bercut in 1949."*
138. **Archery field** — 1938 contributing site, *"a meadow approximately four acres in size near the
     47th Avenue entrance from Fulton Street. Archery targets are located at the east end of the
     meadow."* STRADDLER — Fulton Street edge, Outer Richmond.
139. **Golden Gate Park Golf Course and clubhouse** — 1951, noncontributing. [NOM] p.36: *"The
     nine-hole golf course was created in 1951 and comprises an area of about 20 acres. The course is
     well hidden within the trees."* Clubhouse 1950s, *"a small, flat-roofed, one-story building. The
     flat roof cantilevers to cover the adjacent walkway."*
140. **Western park entry monuments** — ca. 1998, 2 noncontributing objects, *"Two large boulder
     groupings inscribed with Golden Gate Park are located at the Great Highway/JFK Drive and
     Fulton/MLK Drive entries."*
141. **46th Avenue playground** — noncontributing site at 46th Avenue and Lincoln Way. [NOM] p.38:
     *"A lifeboat of unknown origin sits in the sand."* STRADDLER with the Outer Sunset.

### K. The Panhandle — inside the NR boundary, outside the everyday one

142. **The Panhandle (The Avenue)** — ca. 1872 contributing site. [NOM] p.12: *"The Panhandle is the
     oldest part of Golden Gate Park"* (**strip the superlative**). *"The narrow strip, one block wide
     and eight blocks long, was constructed as a connecting carriage road from the edge of the
     developed city to the park. It was originally called The Avenue and consisted of a meandering
     roadway down the center, lined with trees and shrubs to mitigate the prevailing westerly winds…
     In the 1920s Masonic Street was extended across the Panhandle. This was accomplished by voter
     approved ordinance over the objections of the Park Commission… Two paths run the length of the
     Panhandle today, the northern path for bicyclists, and the southern for pedestrians."*
     Hall's own words, quotable: *"to plan and plant this Avenue reservation as a park, to impart a
     wooded effect, and by the overlapping of suitable tree masses, to arrest the sweep of the winds
     through it…"* **BIG STRADDLER — see below.**
143. **William McKinley Monument** — Robert Ingersoll Aitken, bronze and marble on granite, 1904,
     [ART] **1904.2.a-b**, 409 × 513 × 513 in.; location_description *"Panhandle; Between Oak And Fell
     St. Facing Baker St."*, street_address_or_intersection *"Fell Street & Baker Street."*
     [NOM] p.12: *"Gift of the McKinley Monument Committee, 1904… The 15-foot-high bronze figure at
     the top of the pedestal represents "Justice." McKinley was shot on September 5, 1901, and died
     nine days later."* **STRADDLER.**
144. **Panhandle playground and basketball court** — noncontributing site; *"The current playground
     equipment was installed in 1996."* **STRADDLER.**

### L. Park-wide, and things a guide would write about that are not in any register

145. **The park's forest** — [NOM] §7 p.1: *"A man-made forest of over 30,000 trees covers the park."*
     Species [NOM] p.10: *"the evergreen pine (primarily Monterey Pine), Monterey Cypress, and
     eucalyptus."* p.10: *"In the eastern part of Golden Gate Park, some of the bedrock hills are
     covered with oak woodlands. This is the only surviving indigenous vegetation in the park"* —
     that last is a superlative construction; **strip.**
146. **The park's shape and scale** — [NOM] §7 p.7: *"Golden Gate Park is roughly shaped as a
     rectangle, .5 mile wide and 3.5 miles long."* §7 p.1: *"a 1,017-acre urban park."* Both publish
     as measurements.
147. **William Hammond Hall and John McLaren** — the two named Architect/Builder entries in [NOM] §8.
     Hall surveyed the site in 1870, was appointed the park's first superintendent in 1871, served
     1871–1876 and again 1886–1889. McLaren became superintendent in 1889/1890 and served until his
     death in 1943. Between them: William Bond Prichard (1876–1881), F.P. Hennessey and John J.
     McEwen (1881–1882). [NOM] §8 pp.39–40 also quotes Olmsted's 1871 letter to Hall: *"…the
     conditions are so peculiar and the difficulties so great that I regard the problem as unique and
     that it must be solved if at all by wholly new means and methods. It requires invention, not
     adaptation."* **Careful:** most of §8's framing ("first application of Olmsted park design
     principles in the western United States", "one of the pioneering examples") is superlative and
     **does not publish**; the 1871 start date, the tenures, and the Olmsted quotation do.
148. **Buildings and structures removed during the period of significance** — [NOM] p.11 gives a dated
     list that a history-minded page could use without any live-state risk: 1874 several small rustic
     shelters and the First Superintendent's Lodge; 1881 The Casino restaurant (removed 1896); 1882
     Original Music Stand in Conservatory Valley (removed ca. 1888); 1890 Aviary; 1891 Suspension
     Bridge; 1891 Sweeney Observatory; 1892 New Aviary (removed ca. 1930); 1894 temporary Mid-Winter
     Fair buildings; 1937 Richmond-Sunset Sewage Treatment Plant (removed 1996).

---

## STRADDLERS — flagged, NOT resolved

The arbitrator has all eleven zones; these are the eleven-zone questions this finder produced.

**S1. The Panhandle (candidates 142–144).** The National Register boundary explicitly includes it
(*"Bounded by Fulton St., Stanyan St., Fell St., Baker St., Oak St., Lincoln Way, and The Great
Highway"*, [NOM] §2) and [NOM] §7 gives it its own resource zone. [RP] Section 1's
`mons_neighborhood` is *"Golden Gate Park, Panhandle."* But the eight-block strip is physically
detached from the park's main rectangle, sits between Fell and Oak in what SF Planning's own survey
calls the **Haight Ashbury** neighborhood ([HD] objectid 147, "Panhandle Historic District",
neighborhood "Haight Ashbury"), and haight-ashbury.json is already shipped without it. The park page
can claim it on register grounds or leave it unclaimed; it should not be claimed by both.

**S2. Park Emergency Hospital, 811 Stanyan Street (candidate 54). HARD CONFLICT — already shipped.**
`park-emergency-hospital-haight-ashbury` exists in priv/seed_data/san_francisco/haight-ashbury.json.
Every register puts the building inside Golden Gate Park: [A10] gives APN **1700001** (the park
parcel) for SF Landmark No. 201, and [NOM] §7 p.3 lists it under the "Kezar Complex" zone of the
NR district. The arbitrator must either leave it with Haight-Ashbury or move it; a park page that
takes it silently would put one place in two seed files.

**S3. The rest of the Kezar complex (candidates 52, 53, 55).** Kezar Stadium, Kezar Pavilion and the
Park Police Station are inside the NR district and on park land, but [NOM] p.13 itself says
*"This area is separated from the rest of the park by the busy Kezar Drive. The structures in this
complex have little relationship to the rest of the park… The stadium and buildings face out towards
the street, unlike most other facilities which are oriented inward."* Haight-Ashbury claimed none of
them. Same question as S2, without the shipped-file collision.

**S4. The Ocean Beach edge (candidates 127–137, 140).** The Beach Chalet, Park Chalet, Murphy
Windmill, Dutch Windmill, Queen Wilhelmina Tulip Garden, Amundsen Monument, Beach Chalet Soccer
Fields and the western entry monuments all sit in [RP] **Section 6**, whose analysis_neighborhood is
dual-coded *"Golden Gate Park, Outer Richmond"*. The Beach Chalet's own address is **1000 Great
Highway** [BC] — the Great Highway is the NR district's western boundary line, and Ocean Beach is a
separate zone in this wave. The Chalet is simultaneously a park landmark (LM 179), an NR-listed
building inside the park district (81000172), and a beachfront restaurant addressed on the highway.

**S5. The Fulton Street edge (candidates 59, 60, 61, 80, 87, 113, 114, 138).** Arguello Gate, the
Brown Gate bear and cougar, the Stanyan/Fulton wall, Heroes Redwood Grove, the Ninth Avenue
playground, the Model Yacht Club (whose own site places it *"at the 36th Avenue and Fulton Street
entrance"* [MYC]), the Senior Center (which faces Fulton) and the archery field near 47th Avenue all
touch the Richmond side. The Richmond is NOT a shipped zone and may not be a zone in this wave at
all — if it is not, these fall to the park by default and the flag is cheap. If it is, they are live.

**S6. The Lincoln Way / 9th Avenue edge (candidates 88, 105, 141).** The San Francisco Botanical
Garden's public address is **1199 9th Avenue** — a Sunset address for a garden wholly inside the
park. Breon Gate is at 19th Avenue and Lincoln Way; the 46th Avenue playground is at 46th and
Lincoln Way. Same conditional as S5, for the Sunset.

**S7. Stow Lake vs. Blue Heron Lake (candidates 93, 95).** Not a zone straddler but an identity one,
and it will bite whoever writes it. See candidate 93.

---

## WARNINGS — the things most likely to be wrong

**W1. The Francis Scott Key and Padre Junípero Serra monuments (candidates 27 and 29) — LOWEST
CONFIDENCE ON THE SHEET.** [ART] records both as `current_location` = **"Public Display"** at the
Music Concourse, and [A10] still lists the Key monument as SF Landmark No. 96. Both statues were
attacked during the 2020 protests and I could not verify their present state: this session had
exhausted its WebSearch budget (200/200) before I reached them, and the DataSF civic-art extract
carries no `data_as_of` movement for either row. **A dataset that says "Public Display" is not
evidence that a statue is standing.** Anyone writing either one must confirm the present state
against a 2024-or-later source first. The designation number for LM 96 is real regardless; what is
unverified is whether there is anything there to look at.

**W2. Everything downstream of one document.** 130 of these 148 candidates get their date, designer
and description from a single source — the 2004 National Register nomination [NOM]. The
confirmation rate looks superb and that is exactly the warning sign. [NOM] is authoritative for
1871–2004 and worthless for anything after: it was written mid-demolition of both museums, describes
the de Young and the Academy of Sciences as buildings that no longer exist, describes Music Concourse
tunnels that were being torn out as it was typed, and predates the renaming of at least three
features. **Treat [NOM] as one source, not 130.** Every present-tense claim needs a second, current
source.

**W3. Eight year-and-attribution conflicts between [NOM] and [ART].** Rideout Fountain (1924 cast
stone vs 1923 granite), U.S. Grant (1896 vs ca. 1908), Sundial (1907 vs 1905), Leonidas (1884 vs
1881), Lion (1906 vs 1898), Cider Press (1894 vs 1892), Baseball Player (1891 vs 1889), Robert Burns
(1908 vs 1906), Doughboy (1930 vs 1928), Beethoven (Henry Baerer vs "Anonymous"). These are two city
registers disagreeing with each other. Do not average them and do not pick the prettier one.

**W4. Three renamings I could not source.** Sharon Meadow → Robin Williams Meadow; Speedway Meadow →
Hellman Hollow; Stow Lake → Blue Heron Lake (with the boathouse's own address now reading **50 Blue
Heron Lake Dr** and `stowlakeboathouse.com` 301-ing to `blueheronboathouse.com`). The 301 is real
evidence; the ordinance is not in hand. Also unsourced: the current name and opening date of the
rebuilt tennis centre, and the car-free status of John F. Kennedy Drive.

**W5. Sources that would not yield.** `nationalaidsmemorial.org` returned only a tracking pixel on
three separate paths, so the Grove's acreage and its federal designation are **not sourced here**.
`famsf.org` returned HTTP 403 on both de Young paths, so the present museum building's architect is
**not sourced here**. `goldengatepark.com` returned HTTP 526. Every sfrecpark.org facility URL I
guessed was wrong — one returned a page about Esprit Park, another about Prentiss Mini Park, which is
a reminder that a wrong-but-successful fetch is more dangerous than a 404.

**W6. Superlatives harvested, listed so they get stripped rather than rediscovered.** "oldest public
wood-and-glass conservatory in North America" [GGGP]; "oldest operating public Japanese Garden in
North America" [GGGP]; "one of the most advanced and biodiverse aquariums in the world" and "one of
the largest all-digital planetarium domes in the world" [CAS]; "believed to be the oldest such
organization in the United States" [MYC]; and from [NOM] itself: "the largest lake in Golden Gate
Park", "the largest bedrock hill in the park", "the largest windmill of its kind in the world", "the
world's largest amphitheater", "Being the largest open space in the park", "the longest serving
superintendent", "the oldest part of Golden Gate Park", "the only surviving indigenous vegetation in
the park", "the only statue in Golden Gate Park with its own endowment fund", "one of the most
notable features in the park", "remains its most significant", "the first application of Olmsted park
design principles in the western United States". **Attribution does not launder any of these.**
What survives the rule and should be kept: 1,017 acres; 0.5 by 3.5 miles; 12.7 acres of lake; a
90-foot cascade; a 57-foot cross; a 75-foot windmill with a 33-foot foundation; a 95-foot windmill
with a 114-foot span; flycasting pools 450 by 185 feet; a 20-ton boulder; a 52-ton statue; a 130-foot
tunnel; a 20-foot bridge span; sixteen Doric columns; eight pairs of ionic columns; twenty-one tennis
courts; sixteen horseshoe courts; 88 floral quotations; 37 redwood trees; 30,000 trees; 30,000 and
40,000 gallons per hour. And the sequence claims — the first steel-reinforced concrete bridge in the
United States (candidate 50) and the first freestanding building of the city's emergency hospital
service (candidate 54) — which are firsts by date, not rankings by merit.

**W7. Do not tally.** [NOM] §5 offers 37/47/13/36 contributing and 20/12/20/4 noncontributing, and
[A10] offers ten rows on APN 1700001. Those numbers are in this report so the verifier can check
them. They are a live dataset's row counts, not facts about the park, and none of them belongs in
reader-facing prose.
