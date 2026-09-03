# Fisherman's Wharf — Finder's research file

Zone slug `fishermans-wharf`, in scope per `priv/seed_data/san_francisco_roster.json`.
Finder pass, 2026-09-03. Nothing here is adjudicated: a verifier rules on each fact and
one arbitrator rules ownership across all twelve zones. Straddlers are flagged, never resolved.

---

## 0. Two corrections to the brief, both load-bearing

**`.superpowers/taken_slugs.py` does not do what the brief says it does.** It globs
`priv/seed_data/rome/*.json` only (line 11). It cannot see San Francisco, Connecticut, or any
New York borough, and it cannot see the Oracle Park code seed at all, because that lives in
`lib/`, not `priv/`. Run as instructed it would have reported "0 places already owned" for every
San Francisco candidate — a false all-clear.

I wrote a corpus-wide replacement at
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/check.py`
which walks all eight seed regions plus the `lib/` code seeds: **4,607 slug rows across 350 seed
files.** Recommend this be fixed before other finders trust the shipped script.

**The result of the real check: no Fisherman's Wharf candidate is taken.** Zero hits corpus-wide
on *ghirardelli, aquatic, alcatraz, balclutha, pampanito, cannery, musee, mecanique, boudin,
argonaut, jeremiah, anchorage, eureka, hercules, thayer, dolphin, wax, buena vista*. The Oracle
Park seven (`oracle-park`, `reds-java-house`, `momos-san-francisco`,
`flour-and-water-pizza-shop-mission-rock`, `arsicault-bakery-mission-rock`,
`blue-bottle-coffee-mission-rock`, `china-basin-park`) are all Mission Bay and touch nothing here.
The only `wharf` hit in the whole corpus is `wharf-restaurant-madison` in Connecticut.

---

## 1. The boundary problem — read this before ruling on any place

**SF Planning's 41 Analysis Neighborhoods contain no "Fisherman's Wharf" at all.** This is not a
lookup failure; the unit does not exist in the official geography. I pulled the polygons and ran
point-in-polygon myself (`hoods.py`, dataset `j2bu-swwd`, 41 features).

Note `p5b7-5n3h` — the dataset the roster's own scoping notes point at — returns
`[{},{}]`, rows with no fields and null geometry. `j2bu-swwd` is the one carrying geometry.

Every candidate in this zone falls in **North Beach** or **Russian Hill**:

| Point | DataSF Analysis Neighborhood | Nominatim `neighbourhood` | Nominatim `quarter` |
|---|---|---|---|
| Pier 39 / sea lions | North Beach | — | North Beach |
| Pier 45 (Musée, Pampanito) | North Beach | Fisherman's Wharf | North Beach |
| Pier 43 Ferry Arch | North Beach | Fisherman's Wharf | North Beach |
| Boudin, Jefferson St | North Beach | Fisherman's Wharf | North Beach |
| Hyde Street Pier | **Russian Hill** | Fisherman's Wharf | North Beach |
| Maritime Museum / Bathhouse | **Russian Hill** | Fisherman's Wharf | — |
| Aquatic Park Cove | **Russian Hill** | Fisherman's Wharf | — |
| Ghirardelli Square | **Russian Hill** | Fisherman's Wharf | — |
| Haslett Warehouse / Argonaut | **Russian Hill** | Fisherman's Wharf | North Beach |
| The Cannery | **Russian Hill** | Fisherman's Wharf | North Beach |
| Buena Vista Cafe | **Russian Hill** | Fisherman's Wharf | — |
| Victorian Park | **Russian Hill** | Fisherman's Wharf | — |
| Fort Mason Center | **Marina** | — | Marina District |
| Pier 35 | North Beach | **Telegraph Hill** | Financial District |
| Municipal Pier, Dolphin Club | outside all polygons (over water) | — | — |

**The two authorities disagree, and the disagreement is structural.** OSM/Nominatim carries an
explicit `Fisherman's Wharf` neighbourhood covering everything from Pier 45 west through
Ghirardelli Square and Aquatic Park, nested inside `quarter=North Beach`. SF Planning carries no
such unit and splits the same ground down roughly the Hyde/Larkin line.

Wikipedia's own boundary statement matches the vernacular reading: Fisherman's Wharf runs "from
Pier 35 and the intersection of The Embarcadero and Bay Street westward to Hyde Street and
Aquatic Park, or further west to Van Ness Avenue"
(<https://en.wikipedia.org/wiki/Fisherman%27s_Wharf,_San_Francisco>).

**Consequence for the arbitrator: every place in this zone is formally a straddler.** North Beach
and Russian Hill are both in-scope zones with their own finders, and under SF Planning's geography
each has a complete claim to half of this list. I have not resolved any of it. Section 5 sorts the
contested set by which zone contests it.

---

## 2. Designation identifiers found

Thirteen citable identifiers. Register + number, which is what the gate requires.

### San Francisco Article 10 landmark numbers
Source for both: DataSF Socrata `97yj-54sx`, "Landmarks Listed in Article 10 of the San Francisco
Planning Code", 370 rows, fields `landmarkno` / `name` / `address` / `yeardesignated`.
<https://data.sfgov.org/resource/97yj-54sx.json>

| # | Landmark | Address | Designated |
|---|---|---|---|
| **No. 30** | Ghirardelli Square | 900 North Point Street | 1970 |
| **No. 59** | Haslett Warehouse Building | 680 Beach Street | 1974 |

Those are the only two Article 10 landmarks inside the zone. I checked the whole corridor —
North Point, Beach, Jefferson, Hyde, Larkin, Polk, Leavenworth, Taylor, Jones, Columbus,
Embarcadero, Bay, Francisco, Chestnut, Lombard — and the other 28 corridor hits all sit in
Nob Hill, North Beach, Russian Hill or the Marina (Cable Car Barn No. 43, S.F. Art Institute
No. 85, Ferry Building No. 90, City Lights No. 228, Grace Cathedral No. 170, and so on).
**There is no Article 10 landmark for Pier 39, Pier 43, Pier 45, the Musée Mécanique or
The Cannery.** Do not invent one.

### National Register reference numbers

| Resource | NRHP ref | Listed | NHL |
|---|---|---|---|
| Aquatic Park Historic District | **84001183** | 26 Jan 1984 | 28 May 1987 |
| Ghirardelli Sq. (as "Pioneer Woolen Mills and D. Ghirardelli Company") | **82002249** | 29 Apr 1982 | — |
| Haslett Warehouse | **75000172** | 28 Mar 1975 | — |
| *Alma* (scow schooner) | **75000179** | 10 Oct 1975 | 1988 |
| *Balclutha* | **76000178** | 7 Nov 1976 | 1985 |
| *C. A. Thayer* | **66000229** | 13 Nov 1966 | 1984 |
| *Eureka* (ferryboat) | **73000229** | 24 Apr 1973 | yes, date unconfirmed |
| USS *Pampanito* | **86000089** | — | 14 Jan 1986 |
| SS *Jeremiah O'Brien* | **78003405** | — | 14 Jan 1986 |
| Fort Mason Historic District | **72000109** | 25 Apr 1972 | — |
| Fort Mason (NHL District) | **85002433** | — | 4 Feb 1985 |

Sources: <https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_San_Francisco>,
<https://en.wikipedia.org/wiki/USS_Pampanito>, <https://en.wikipedia.org/wiki/SS_Jeremiah_O%27Brien>,
<https://en.wikipedia.org/wiki/Aquatic_Park_Historic_District>,
<https://en.wikipedia.org/wiki/Ghirardelli_Square>, <https://en.wikipedia.org/wiki/Haslett_Warehouse>,
<https://en.wikipedia.org/wiki/Fort_Mason>.

**Three unresolved conflicts the verifier must settle before any of these publish:**

1. **Aquatic Park NHL date.** The district article gives NHL 28 May 1987 and NRHP 26 Jan 1984.
   The Maritime Museum article gives NHL 26 Jan 1984 — i.e. it reports the NRHP date as the NHL
   date. DataSF's Historic Districts set (`63x5-g3m4`) gives a third date, 31 Oct 1984, with a
   period of significance of 1936–1939. Safest publishable form is the NRHP line alone:
   "Listed on the National Register of Historic Places in 1984, reference number 84001183."
2. **Two Fort Mason listings.** 72000109 (1972 NRHP district) and 85002433 (1985 NHL district)
   are separate records, not a duplicate. Do not merge them into one claim.
3. **"San Francisco Maritime National Historic Site, ref 01000281, 27 Jun 1988"** appears on the
   Maritime Museum article, and the identical date 27 Jun 1988 appears on the *Eppleton Hall*
   article. One of the two is likely misattributed. Treat 01000281 as unconfirmed.

No reference number found for the tug *Hercules* (NHL 1986 confirmed by NPS) or for
*Eppleton Hall* (NRHP 27 Jun 1988, per note 3 above). **Under the gate, an NHL year with no
number and no register name does not publish.** Either the verifier finds the numbers or those
two ships carry no designation sentence.

---

## 3. THE MAJOR CURRENT-STATUS FINDING — Hyde Street Pier is closed and the fleet has left the city

From the park's own front page, <https://www.nps.gov/safr/index.htm>:

> "Since 2025, our museum ships have been at Mare Island Naval Shipyard. They will remain there
> while their longtime home, Hyde Street Pier in San Francisco, is rebuilt."

Corroborated at <https://www.nps.gov/safr/planyourvisit/basicinfo.htm>, which gives the temporary
site as "Mare Island Coal Sheds, 860 Nimitz Ave., Vallejo, CA 94592", open "Saturdays and Sundays
from 12 pm to 4 pm, pending staff availability", and states Hyde Street Pier is closed for the
Hyde Street Rebuild Project.

**This affects six of the strongest candidates in the zone.** *Balclutha*, *Eureka*,
*C. A. Thayer*, *Alma*, *Hercules* and *Eppleton Hall* are not at Fisherman's Wharf and are not
in San Francisco. Vallejo is in Solano County — outside the `county: "San Francisco"` that
`san_francisco_seed_data_test.exs` asserts on every guide.

I am not ruling on this. But the arbitrator should know that a guide sentence reading "moored at
Hyde Street Pier" is currently false, and that a place record for any of the six would carry a
San Francisco address for a vessel that is not there. Options, in my judgement order: write the
ships as part of the Hyde Street Pier / Maritime Park record rather than as six standalone places;
or write them with the closure stated as fact ("the ships are at Mare Island Naval Shipyard while
Hyde Street Pier is rebuilt"), which is a fact about the world and clears the self-reference ban.
What must not happen is six place records asserting a Hyde Street berth.

Still open at the wharf per the same page: the **Visitor Center** (in the Haslett Warehouse), the
**Maritime Museum**, and **Aquatic Park Cove**.

---

## 4. Candidates — 45

Kinds are drawn from `Ethos.Places.Place.kinds/0` (`lib/ethos/places/place.ex` line 7):
`museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium
attraction`. There is no ship, monument, church or pier kind.

### 4.1 Piers and the Pier 39 group

**1. Pier 39** — `attraction`. The Embarcadero & Beach Street, San Francisco, CA 94133 (own site).
Developed by Warren Simmons, opened **4 October 1978**. Hours from own site: retail 10:00–21:00,
full-service restaurants 11:00–22:00, attractions 10:00–21:00.
<https://www.pier39.com/> · <https://en.wikipedia.org/wiki/Pier_39>

**2. The sea lions at K Dock, Pier 39** — `attraction`. Sea lions began hauling out in
**September 1989**; "By January 1990, their numbers had increased to 150 animals." Monitored daily
by volunteers and staff of the Marine Mammal Store and Interpretive Center.
⚠️ **"K Dock" is not confirmed by any source I reached.** Wikipedia describes the colony without
naming K Dock; Pier 39's own site describes the sea lions without naming it; the Marine Mammal
Center page names Pier 39 but not K Dock. The dock letter is in the brief but I could not source
it. Either the verifier sources it or the record says "the west marina" or nothing.
<https://en.wikipedia.org/wiki/Pier_39> ·
<https://www.marinemammalcenter.org/animal-care/learn-about-marine-mammals/pinnipeds/california-sea-lion>

**3. Aquarium of the Bay** — `attraction`. "PIER 39 Embarcadero & Beach St. San Francisco, CA
94133", daily 10:00–17:00. Non-profit. Galleries: Discover the Bay, Go with the Flow, Under the
Bay (two 300-foot tunnels, more than 200 species), Touch the Bay; river otters.
<https://www.aquariumofthebay.org/>

**4. Pier 45** — `historic-site`. Fish-handling sheds; berth of *Pampanito* and the memorial
chapel. Shed A houses the Musée Mécanique. No Article 10 designation.

**5. USS *Pampanito*** — `museum`. Balao-class diesel-electric submarine, built at Portsmouth
Naval Shipyard, Kittery, Maine; launched **12 July 1943**, commissioned **6 November 1943**.
Berthed Pier 45. Operated by the San Francisco Maritime National Park Association.
NRHP **86000089**; NHL **14 January 1986**. <https://en.wikipedia.org/wiki/USS_Pampanito>

**6. SS *Jeremiah O'Brien*** — `museum`. Liberty ship, EC2-S-C1 class, built by New England
Shipbuilding Corporation, South Portland, Maine; launched **19 June 1943**. Operated by the
National Liberty Ship Memorial, Inc. NRHP **78003405**; NHL **14 January 1986**.
⚠️ **Berth conflict.** Wikipedia's infobox gives "Pier 35, San Francisco"; the ship's long-standing
public berth is Pier 45. The operator's own site could not be used to settle it —
`www.ssjeremiahobrien.org` presents a certificate valid only for `*.cloudwaysapps.com`, and
`ssjeremiahobrien.org` returns 403. **Do not publish a pier number until this is settled**, and
note that Nominatim places Pier 35 in Telegraph Hill / Financial District, not the wharf — so the
berth answer may also change which zone owns the ship. <https://en.wikipedia.org/wiki/SS_Jeremiah_O%27Brien>

**7. Musée Mécanique** — `museum`. Pier 45, Shed A. Founded by **Ed Zelinsky**. Over 300
coin-operated machines, roughly 200 displayed: music boxes, fortune tellers, Mutoscopes, player
pianos, peep shows, photo booths, dioramas, pinball. Named pieces: an 1884 Praxinoscope, a
steam-powered motorcycle built in Sacramento in 1912, and the Laffing Sal automaton. Collection
was at Playland 1928–1972, then the Cliff House basement from 1972; the National Park Service
moved it to Fisherman's Wharf in **2002**.
⚠️ Both operator domains failed: `museemecaniquesf.com` refused the connection (ECONNREFUSED
64.98.135.104:443) and `museemecanique.com` returned an empty body. **No sourced hours or
admission** — so the record gives none. <https://en.wikipedia.org/wiki/Mus%C3%A9e_M%C3%A9canique>

**8. Pier 43 Ferry Arch** — `historic-site`. Built **1914** as a hoisting tower for loading rail
cars on and off ferries for the San Francisco Belt Railroad. Wooden pier replaced 1996; headhouse
damaged by fire in 1998 and restored 2002–2003 to the Secretary of the Interior's Standards.
No landmark number found. <https://en.wikipedia.org/wiki/Pier_43_Ferry_Arch>

**9. Alcatraz Landing, Pier 33** — ⚠️ **probably OUT OF ZONE.** Nominatim puts Pier 33 in
Telegraph Hill / Financial District. Listed only so the arbitrator sees it was considered and
placed elsewhere. Alcatraz itself is GGNRA and not a wharf place.

### 4.2 San Francisco Maritime National Historical Park

**10. San Francisco Maritime National Historical Park** — `park` or `museum`. Park HQ mailing
address 2 Marina Boulevard, Building E, 2nd Floor, San Francisco, CA 94123 — note that address is
in **Fort Mason**, i.e. the Marina, not the wharf. <https://www.nps.gov/safr/index.htm>

**11. Hyde Street Pier** — `historic-site`. 2905 Hyde Street. Principal automobile-ferry terminal
before the Golden Gate and Bay Bridges opened, carrying US 101 to Sausalito and US 40 to Berkeley.
Ferries run by the Golden Gate Ferry Company; in early 1929 that company merged with Southern
Pacific's auto-ferry system, with service taken over by Southern Pacific-Golden Gate Ferries, Ltd.
from 1 May 1929. **Currently closed for the Hyde Street Rebuild Project** (§3).
No construction date sourced. <https://en.wikipedia.org/wiki/Hyde_Street_Pier>

**12. *Balclutha*** — `historic-site`. Three-masted square-rigged ship, built **1886** by
**Charles Connell & Co. Ltd.** near Glasgow. 256.50 ft length, 38.65 ft beam, 22.75 ft depth of
hold, 1689.30 gross tons. Grain, California–Europe, 1887–1899; Pacific lumber under Hawaiian
registry 1899–1902; Alaska salmon trade as *Star of Alaska* 1902–1930; film ship *Pacific Queen*
1933–1954. NRHP **76000178**; NHL 1985. <https://www.nps.gov/safr/learn/historyculture/balclutha.htm>

**13. *Eureka*** — `historic-site`. Side-wheel paddle steamboat, built **1890** by **John Dickie**
at Tiburon, California, originally named ***Ukiah***. 299.5 ft overall, 78 ft extreme width,
2,420 gross tons. Built to carry railway cars and passengers between Sausalito and San Francisco
for the SF&NPRR; rebuilt 1923 and renamed *Eureka*; ran until 1957. Deeded to California State
Parks 1963, transferred to NPS 1977. NRHP **73000229**.
🚫 The NPS page calls her "the last intact wooden-hulled side-wheel steamer afloat in the
continental United States" — **a superlative with a comparison class; it does not publish.**
<https://www.nps.gov/safr/learn/historyculture/eureka.htm>

**14. *C. A. Thayer*** — `historic-site`. Three-masted bald-headed lumber schooner, built **1895**
by **Hans D. Bendixsen** (1842–1902) near Humboldt Bay. 219 ft full length, 156 ft deck length,
11.38 ft depth of hold, 453 gross tons, 105 ft mainmast. Lumber 1895–1912 (Grays Harbor to San
Francisco, with voyages to Mexico, Hawaii and Fiji); Bristol Bay salmon 1912–1924; Bering Sea cod
1925–1950; roadside "pirate ship" in Hood Canal 1954–1957; museum ship from 1963.
NRHP **66000229**; NHL 1984. <https://www.nps.gov/safr/learn/historyculture/c-a-thayer.htm>

**15. *Alma*** — `historic-site`. Scow schooner, built **1891** by **Fred Siemer**. 80 ft overall,
59 ft registered, 22.6 ft beam, 4 ft depth, 41.76 gross tons, 67 ft foremast. Hay and lumber under
sail; masts removed 1918 and worked as a towed salt barge; from 1926 hauled oyster shell to
Petaluma, 110–125 tons a week, until 1957. Bought by California 1959, restored from 1964, NPS 1978.
NRHP **75000179**; NHL 1988. <https://www.nps.gov/safr/learn/historyculture/alma.htm>

**16. Tug *Hercules*** — `historic-site`. Built **1907** by **John H. Dialogue and Son**, Camden,
New Jersey, for the Shipowners' and Merchants' Tugboat Company's Red Stack fleet. 151 ft length,
26 ft beam, 409 gross tons. Towed her sister *Goliah* around South America to San Francisco; towed
sailing vessels, log rafts and barges, including a caisson for the Pearl Harbor dry dock and
another for Panama Canal construction; later Western Pacific Railroad car barges until 1962.
NHL 1986 — **no reference number found.**
<https://www.nps.gov/safr/learn/historyculture/hercules.htm>

**17. Paddle tug *Eppleton Hall*** — `historic-site`. Built **1914** by **Hepple and Company**,
South Shields, England, for Lambton and Hetton Collieries Ltd, to tow colliers on the Wear and
Tyne. Sold for scrap 1967 and left part-burnt on a mud bank; acquired by **Scott Newhall**, rebuilt
near Hebburn in 1969, sailed 18 September 1969 via the Panama Canal, arriving late March 1970.
Moored at Hyde Street Pier, not open for boarding. NRHP 27 June 1988 — **no reference number**,
and see §2 note 3.
🚫 "the only intact example of a Tyne-built paddle tug" — **superlative, does not publish.**
<https://en.wikipedia.org/wiki/Eppleton_Hall>

**18. San Francisco Maritime Museum / Aquatic Park Bathhouse** — `museum`. Foot of Polk Street.
Designed by **William Mooser III** under the supervision of his father **William Mooser II**;
built **1936–1939**, dedicated **22 January 1939**. **Streamline Moderne**, shaped as a ship at
port: sweeping lines, curved facades, stainless steel railings, porthole windows. WPA funded,
$1.5 million. Has housed the maritime museum since 1951. Contributing to the Aquatic Park Historic
District, NRHP **84001183**.
<https://www.nps.gov/safr/learn/historyculture/aquatic-park-bathhouse.htm> ·
<https://en.wikipedia.org/wiki/San_Francisco_Maritime_Museum>

**19. Park Visitor Center** — `museum`. In the Haslett Warehouse; open per the park front page.

**20. Maritime Research Center** — ⚠️ named in the brief's orbit but I found no page giving
address or hours. Low confidence; may be a function of #19 rather than a place.

### 4.3 Aquatic Park

**21. Aquatic Park Historic District** — `historic-site`. "Bounded by Van Ness Ave., Hyde and Polk
Sts." Built by the WPA; period of significance 1936–1939 per DataSF `63x5-g3m4`. Contributing
elements: the bathhouse (now the Maritime Museum), the horseshoe-shaped Municipal Pier, the
bleachers/stadia, speaker towers, beach, lagoon and concessions stand. NRHP **84001183**, listed
26 January 1984; NHL 28 May 1987 (but see §2 note 1).
<https://en.wikipedia.org/wiki/Aquatic_Park_Historic_District>

**22. Aquatic Park Cove** — `park`. Confirmed open on the park front page. The swimming cove used
by the Dolphin and South End clubs.

**23. Municipal Pier** — `park` or `historic-site`. Horseshoe-shaped, contributing to the district.
⚠️ NPS page 404'd and the Wikipedia title I tried does not exist. **No build date, length or
current closure status sourced** — and I believe it has been closed for structural reasons, which I
could not confirm. Low confidence on everything but its existence and district membership.

**24. Victorian Park** — `park`. Beach Street at Hyde; the Powell-Hyde turntable stands in it.
Nominatim returns "781;789, Beach Street, Fisherman's Wharf". No build date sourced.

**25. Dolphin Club** — `attraction`. **502 Jefferson, San Francisco, CA 94109.** Volunteer-led
club of 1800+ members centred at Aquatic Park, with a boathouse at Lake Merced; open-water swimming
and rowing. Day use to visitors Monday, Wednesday, Friday; winter (1 Nov–30 Apr) 09:00–17:00,
summer (1 May–31 Oct) 08:00–17:00; $12 day-use fee, cash/check/credit; "there is no public-access
on state or federal holidays."
🚫 The site's "founded in 1877" is a **trading-duration claim from the operator's own site and does
not publish** under the brief's rule. <https://www.dolphinclub.org/>

**26. South End Rowing Club** — `attraction`. ⚠️ **DO NOT CITE THE OBVIOUS DOMAIN.**
`https://www.south-end.org/` now 301-redirects off-host to `https://kaya33.net/`, an unrelated
site. The domain appears to have lapsed and been re-registered. I did not follow it and no fact
about this club is sourced. Either the verifier finds the current official domain or the club is
dropped.

### 4.4 Buildings and squares

**27. Ghirardelli Square** — `shop`. 900 North Point Street. Original factory built **1893** for
Domenico Ghirardelli as the Ghirardelli Chocolate Company headquarters; architects **Maarten
Getkate Sr.** and **William S. Mooser**. Bought **1962** by **William M. Roth and his mother
Lurline Matson Roth** to prevent demolition; they hired landscape architect **Lawrence Halprin**
and **Wurster, Bernardi & Emmons** for the conversion, which opened in **1964**. Benjamin Thompson
and Associates renovated the Clock Tower's lower floor in 1965.
**San Francisco Landmark No. 30, designated 1970** (DataSF `97yj-54sx`). **NRHP 82002249**, listed
29 April 1982 as "Pioneer Woolen Mills and D. Ghirardelli Company".
🚫 Wikipedia's "the first major adaptive re-use project in the United States" is a **superlative and
does not publish**. 🚫 The operator's own "A BAYSIDE LANDMARK SINCE 1862" is both a bare designation
claim and a trading-duration claim — **neither publishes**; the Article 10 number replaces it.
⚠️ Wikipedia locates the square "at the foot of Russian Hill" — a straddle signal, see §5.
<https://en.wikipedia.org/wiki/Ghirardelli_Square> · <https://www.ghirardellisq.com/>

**28. Haslett Warehouse / Argonaut Hotel** — `hotel`. **680 Beach Street** (the hotel's own address
is given as **495 Jefferson Street, San Francisco, CA 94109**; both are the same building on
different frontages — the verifier should pick one and say why). Built **1907–1909**, architect
**William S. Mooser Jr.**, as a warehouse for the **California Fruit Canners Association**, storing
Central Valley produce canned at the facility east of the warehouse. NPS leased it to Kimpton
Hotels in 2002 on a 57-year term; the roughly 198,000 sq ft building became a 252-room hotel that
opened **August 2003**, and remains part of San Francisco Maritime National Historical Park.
**San Francisco Landmark No. 59, designated 1974**. **NRHP 75000172**, listed 28 March 1975.
🚫 The hotel's own "award-winning" does not publish. <https://en.wikipedia.org/wiki/Haslett_Warehouse>
· <https://www.argonauthotel.com/>

**29. The Cannery at Del Monte Square** — `shop`. ⚠️ **LEAST CONFIDENT CANDIDATE IN THE ZONE.**
Four Wikipedia titles 404'd (`The_Cannery_(San_Francisco)`, `The_Cannery_at_Del_Monte_Square`,
`Del_Monte_Cannery`) and the DataSF parcel query returned HTTP 400 on the address field. The web
search budget was exhausted before I could route around it. It is **not** in the Article 10 list.
I have **no sourced build date, architect, company or conversion date** — only that the building
exists at Leavenworth and Beach and falls in Russian Hill by DataSF, Fisherman's Wharf by
Nominatim. Recommend it ships only if the verifier can source it independently.

### 4.5 Food and drink

Trading-duration claims from an operator's own site do not publish; each is marked.

**30. Boudin Bakery — Bakers Hall, Bistro Boudin** — `restaurant` / `cafe`. **160 Jefferson
Street, Upper Level, San Francisco, CA 94133**; Bakers Hall at 160 Jefferson Street, Lower Level.
The flagship building holds a working bakery visible to visitors, a casual cafe, a museum of the
company's sourdough, and Bistro Boudin, a full-service waterfront restaurant. **No hours listed on
the site** — so the record gives none. <https://boudinbakery.com/locations/>

**31. Buena Vista Cafe** — `cafe`. **2765 Hyde St (@ Beach), San Francisco, CA 94109.**
Mon–Thu 09:00–23:00, Fri 09:00–24:00, Sat 08:00–24:00, Sun 08:00–23:00; kitchen closes 21:30.
The site carries a photo captioned "Stanton Delaplane at the Buena Vista in 1975". ⚠️ The Irish
coffee origin story sits behind a link I did not fetch; any "first Irish coffee in America" claim
is a **superlative and must not publish**. <https://www.thebuenavista.com/>

**32. Scoma's** — `restaurant`. **1965 Al Scoma Way, Pier 47, Fisherman's Wharf, San Francisco, CA
94133.** Mon–Thu & Sun 12:00–21:30, Fri–Sat 12:00–22:00, bar from 11:30 daily. "Located on a
working pier, Scoma's has its own fish receiving station, dealing directly with local fishers."
🚫 The site's "60+ year reputation" is a **trading-duration claim and does not publish**.
<https://scomas.com/>

**33. Alioto's**, **34. Fishermen's Grotto**, **35. Pompei's Grotto** — `restaurant`. Named in the
Wikipedia zone article as family-owned houses spanning three generations. ⚠️ **No address, hours or
operating status sourced for any of the three**, and I could not confirm whether Alioto's is still
trading. The "three generations" line is a trading-duration claim and does not publish.
<https://en.wikipedia.org/wiki/Fisherman%27s_Wharf,_San_Francisco>

**36. Ghirardelli Ice Cream & Chocolate Shop** — `cafe`. In Ghirardelli Square. No independently
sourced address or hours; the square's own site gave neither.

### 4.6 Commercial attractions

**37. Ripley's Believe It or Not!** and **38. Madame Tussauds San Francisco** — `museum`. Both
named in the zone article as Jefferson Street attractions. ⚠️ **Neither operator site was fetched
and I could not verify current operating status** — I have an unconfirmed impression that at least
one of the two closed, and with the search budget gone I could not test it. Low confidence.

**39. San Francisco Dungeon** — `attraction`. Same building group as Tussauds; same doubt, weaker.

**40. Blue & Gold Fleet**, **41. Red & White Fleet** — `attraction`. Bay cruise operators from
Pier 39 / Pier 43½. Unsourced this pass.

**42. Pier 39 Carousel** — `attraction`. Unsourced this pass. Note a carousel is a **sculptural
work**, not a building, so 17 USC 120(a) does not cover it — relevant to the photo wave.

### 4.7 Civic and transport

**43. Powell-Hyde cable car turntable, Hyde & Beach** — `attraction`. SFMTA confirms turntables
"at Bay & Taylor and Hyde & Beach Streets", both being ends of lines that "start at Powell and
Market and continue to the Fisherman's Wharf area". Advance purchase via MuniMobile or Clipper is
required at Powell & Market, Bay & Taylor and Hyde & Beach between 08:00 and 20:00 daily. No
operating hours published on that page. <https://www.sfmta.com/getting-around/muni/cable-cars>

**44. Powell-Mason cable car turntable, Bay & Taylor** — `attraction`. Same source.
Note the **Cable Car Museum is Nob Hill's** — Article 10 No. 43, Cable Car Barn and Power House,
1201 Mason Street. Not a wharf claim.

**45. Fishermen's and Seamen's Memorial Chapel, Pier 45** — `historic-site`. ⚠️ **Sourced only by
one clause**: "Pier 45 has a chapel in memory of the 'Lost Fishermen' of San Francisco and Northern
California." The dedicated Wikipedia title 404'd. No address, build date, builder, or ceremony
date. Second-least-confident candidate.
<https://en.wikipedia.org/wiki/Fisherman%27s_Wharf,_San_Francisco>

### Considered and placed elsewhere
Fort Mason Center for Arts & Culture (2 Marina Blvd, Landmark Building C, Suite 260, SF 94123;
est. 1976; ~two dozen resident arts non-profits; NHL district 85002433, NRHP district 72000109;
<https://fortmason.org/>) — **both authorities say Marina**, and the roster already lists Fort
Mason under the Marina's draw. Recorded here because the brief named it, but I do not claim it.
Also: Pier 35 and Pier 33 (Telegraph Hill / Financial District per Nominatim); the Cable Car
Museum, Grace Cathedral, S.F. Art Institute, City Lights (other zones' Article 10 landmarks).

---

## 5. Straddlers — flagged, not resolved

Per §1, **all 45 are formally straddlers** because SF Planning recognises no Fisherman's Wharf.
Sorted by the zone that contests them:

**Contested with RUSSIAN HILL** (DataSF: Russian Hill; Nominatim: Fisherman's Wharf) — Ghirardelli
Square, Haslett Warehouse / Argonaut Hotel, The Cannery, Hyde Street Pier and all six historic
ships, the Maritime Museum / Aquatic Park Bathhouse, Aquatic Park Historic District, Aquatic Park
Cove, Victorian Park, Buena Vista Cafe, the Powell-Hyde turntable, the Dolphin Club, the Park
Visitor Center. **This is the sharper of the two conflicts** — it includes the zone's two Article 10
landmarks and its NHL district. Extra weight for Russian Hill: Wikipedia independently places
Ghirardelli Square "at the foot of Russian Hill".

**Contested with NORTH BEACH** (DataSF: North Beach; Nominatim: Fisherman's Wharf, quarter North
Beach) — Pier 39 and the sea lions, Aquarium of the Bay, Pier 45, USS *Pampanito*, Musée
Mécanique, SS *Jeremiah O'Brien*, Pier 43 Ferry Arch, Boudin, Scoma's, Ripley's, Madame Tussauds,
the Powell-Mason turntable, the memorial chapel. Weaker conflict: Nominatim nests Fisherman's
Wharf *inside* North Beach rather than setting them side by side, so a ruling for the wharf here
does not contradict OSM.

**Contested with MARINA** — Fort Mason and everything in it, plus the Maritime Park's HQ address
at 2 Marina Boulevard. Both authorities say Marina. I lean strongly to Marina and have not claimed
it.

**Contested with FINANCIAL DISTRICT / TELEGRAPH HILL** — Pier 35, Pier 33 Alcatraz Landing, and,
if its berth is really Pier 35, the SS *Jeremiah O'Brien*. Note the roster declined "The
Embarcadero" as a zone and split it between the Financial District and Fisherman's Wharf, so the
line between those two along the waterfront is unset and this is where it bites.

**Over water, in no polygon at all** — Municipal Pier, the Dolphin and South End clubhouses, and
strictly speaking every pier deck. Point-in-polygon cannot answer these; they need a rule, not a
lookup.

---

## 6. Photography notes for the later wave

`"photos": []` everywhere this wave. For the record:

- **Buildings are fine** under 17 USC 120(a): Ghirardelli Square, the Haslett Warehouse, the
  Cannery, Pier 39's structures, the bathhouse **exterior massing**.
- 🚫 **The Aquatic Park Bathhouse interior is not.** Hilaire Hiler's lobby murals of Atlantis and
  Mu (executed with **Ann Sonia Medalie**), **Richard Ayer's** third-floor "Nautical Abstractions",
  **Sargent Claude Johnson's** veranda tile mosaic (assisted by **Mohammed Zyani**) and
  **Beniamino Bufano's** granite and marble animal sculptures are artworks, not architecture.
  Hiler d. 1966, Johnson d. 1967, Bufano d. 1970 — all still in copyright on life+70.
  ⚠️ **Johnson's carved green Vermont slate is on the main facade**, so even an exterior photograph
  can feature a live-copyright artwork. Frame with care or skip.
- 🚫 The Pier 39 carousel and the ships' figureheads are sculptural works, not buildings.
- Ships themselves are useful subjects but are **at Mare Island**, so any new photograph shows
  Vallejo, not the wharf.

---

## 7. Judgement

**Guide.** Not a town page. Forty-five candidates, thirteen designation identifiers including two
Article 10 landmark numbers and an NHL district, a coherent maritime-industrial narrative running
from the 1886 *Balclutha* through the 1907–09 Haslett Warehouse and the 1936–39 WPA bathhouse to
the 1964 Ghirardelli conversion and the 1978 opening of Pier 39, plus enough food, transport and
attraction material to fill entry kinds `food`, `sight`, `walk`, `stay` and `tip`. The zone
carries a guide comfortably.

The two things that could shrink it are both in the arbitrator's hands, not mine: whether the
Russian Hill straddle takes Ghirardelli Square, Aquatic Park and the Haslett Warehouse away — which
would remove both Article 10 numbers at once — and how the six relocated ships are handled given
they are currently in Solano County.

**Least confident, in order:** The Cannery at Del Monte Square (§4.4 #29, nothing sourced beyond
existence); the Fishermen's and Seamen's Memorial Chapel (§4.7 #45, one clause of source); and
Madame Tussauds / the San Francisco Dungeon (§4.6 #38–39, operating status unverified). Also
genuinely shaky: "K Dock" as the sea lions' location, which is in the brief but which I could not
source anywhere.
