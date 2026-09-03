# Fisherman's Wharf — Verifier's verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/fishermans-wharf-finder.md`.
Every ruling below is mine. I re-fetched the DataSF Article 10 dataset, the NPS NRHP
ArcGIS service (both the points and the polygons layer), the NPS park pages and eleven
operator sites. Where I disagree with the finder I say so and give the replacement wording.

**Counts: 13 PUBLISH as written · 18 PUBLISH after REWRITE · 15 DROP.**
**Surviving places: 31. Tier ruling: GUIDE.**

---

## 0. The finder's two corrections to the brief — one right, one overreaching

**`.superpowers/taken_slugs.py` is broken exactly as the finder says.** Confirmed by reading
it: line 11 globs `priv/seed_data/rome/*.json` only. It cannot see San Francisco, Connecticut,
the boroughs, or the Oracle Park code seed in `lib/`. Run as the brief instructs it returns a
false all-clear. I re-ran a corpus-wide check of my own over all eight seed regions plus the
`lib/` code seeds and confirm the finder's result: **no Fisherman's Wharf candidate is taken**,
and the Oracle Park seven are all Mission Bay and touch nothing here. This should be fixed
before another finder trusts the shipped script.

**The boundary panic is overreaching and I am overruling it.** The finder concludes "every
place in this zone is formally a straddler" and hands 45 places to the arbitrator. That is
wrong on the governing document. `priv/seed_data/san_francisco_roster.json` states in its own
`source` field that SF Planning's 41 Analysis Neighborhoods are one of several lists and that
"neither matches the units a visitor uses" — the roster *declined* that geography. It then
assigns this zone its draw explicitly: "Pier 39 and the sea lions, the Hyde Street Pier historic
ships, Ghirardelli Square, the Musee Mecanique, Aquatic Park." Point-in-polygon against a
geography the roster refused cannot unmake that.

The neighbouring finders agree. Russian Hill's file writes **"roster assigns Fisherman's Wharf"**
beside Ghirardelli Square, the Haslett Warehouse, the Buena Vista, the Dolphin Club and the
Hyde & Beach turntable, and says outright that the Hyde & Beach turntable "is Fisherman's
Wharf's". North Beach's file writes **"These are Fisherman's Wharf's and I do not claim them"**
of Pier 39, the Aquarium, the Musée, Ripley's, the SkyStar Wheel, Boudin and Scoma's.

So the Russian Hill and North Beach straddles are **not contested by anybody** and I am not
escalating them. Five genuine straddlers remain; they are in §4.

---

## 1. Designation numbers — every one re-fetched

### Article 10 — DataSF `97yj-54sx`, re-fetched, HTTP 200, 370 rows

Both of the finder's numbers verify **exactly**, field for field:

| Claimed | Register value | Verdict |
|---|---|---|
| No. 30, Ghirardelli Square, 900 North Point Street, 1970 | `30 / Ghirardelli Square / 900 North Point Street / 1970.0` | **PUBLISH** |
| No. 59, Haslett Warehouse Building, 680 Beach Street, 1974 | `59 / Haslett Warehouse Building / 680 Beach Street / 1974.0` | **PUBLISH** |

I also confirm the negative: sweeping the whole 370-row set for *pier, beach, north point,
jefferson, hyde, aquatic, cannery, del monte, argonaut* returns nothing else in this zone. **There
is no Article 10 landmark for Pier 39, Pier 43, Pier 45, the Musée Mécanique or The Cannery.**
The finder is right; do not invent one. Note the trap it correctly avoided: **No. 15 "Old
Ghirardelli Building" and No. 16 "Regency House – Ghirardelli Annex" are on Jackson Street** and
are North Beach's, not this zone's.

### National Register — NPS ArcGIS `nrhp_locations`, re-fetched

The finder sourced these to Wikipedia. I went to the register. Districts live in the **polygons**
layer, which is why a points-only lookup would have reported three of them missing.

| Ref | NPS `RESNAME` | NPS address | Cert | NHL | Verdict |
|---|---|---|---|---|---|
| **75000172** | Haslett Warehouse | 680 Beach St. | 03/28/75 | — | **PUBLISH** |
| **82002249** | Pioneer Woolen Mills and D. Ghirardelli Company | 900 N. Point St. | 04/29/82 | — | **PUBLISH** |
| **84001183** | Aquatic Park Historic District | Bounded by Van Ness Ave., Hyde and Polk Sts. | 01/26/84 | **X** | **PUBLISH** |
| **86000089** | USS PAMPANITO (submarine) | Fisherman's Wharf-Pier 45 | 01/14/86 | **X** | **PUBLISH** |
| **76000178** | BALCLUTHA | Pier 41 East | 11/07/76 | **X** | **PUBLISH** |
| **66000229** | C.A. THAYER | SF Maritime State Historic Park | 11/13/66 | **X** | **PUBLISH** |
| **73000229** | EUREKA | SF Maritime State Historic Park, 2905 Hyde St. | 04/24/73 | **X** | **PUBLISH** |
| **75000179** | ALMA (Scow Schooner) | 2905 Hyde St. (Hyde St. Pier) | 10/10/75 | **X** | **PUBLISH** |
| **75000225** | HERCULES (tugboat) | Maritime Unit, Hyde St. Pier | 01/17/75 | **X** | **PUBLISH — finder said none existed** |

**Thirteen wharf-owned identifiers survive re-fetching** — the nine NRHP numbers above, the two
Article 10 numbers, the Aquatic Park NHL district designation of 28 May 1987, and one register
the finder never looked at (below).

### Three corrections to the finder's designation table

**a. The finder declared the *Hercules* reference number unfindable.** It exists:
**NRHP 75000225**, certified 17 January 1975, NHL. The finder's fallback — "those two ships carry
no designation sentence" — is overturned for *Hercules*. Use:
> "Listed on the National Register of Historic Places in 1975, reference number 75000225."

**b. *Eppleton Hall* has no National Register listing at all.** It appears in neither the points
nor the polygons layer under any spelling. The finder's "NRHP 27 June 1988" is a
misattribution of **01000281 — "San Francisco Maritime National Historic Site", Fort Mason
Bldg. 201, cert 06/27/88**, which is a Fort Mason site record and belongs to the Marina. The
finder flagged 01000281 as "unconfirmed" and guessed the wrong reason. **DROP every designation
sentence for *Eppleton Hall*.**

**c. Two labels are wrong.** `85002433` is **"San Francisco Port of Embarkation, US Army"**, not
"Fort Mason (NHL District)" — number and 02/04/85 date are right, the name is not. And the
**NHL date 14 January 1986 belongs to *Pampanito*, not to the *Jeremiah O'Brien*** — the finder
copied it across. O'Brien's certification is **07 June 1978**. Both are Marina/Fort Mason
material regardless; the point is that a wrong name or date on a real number is the exact
failure mode the brief warns about.

**d. One register the finder missed.** Aquatic Park also carries a **California Historical
Landmark: "Entrance of the San Carlos into San Francisco Bay", designated 1936, Reference no.
236.** Register named, identifier present — it clears the gate. Use:
> "California Historical Landmark No. 236, designated in 1936, marks the entrance of the San Carlos into San Francisco Bay."

**e. The finder's §2 conflicts, settled.** Aquatic Park's NHL date is **28 May 1987** and its NRHP
listing **26 January 1984** — the Wikipedia district article and the NPS register agree, and the
Maritime Museum article that gave 1984 as the NHL date is simply repeating the NRHP date. Both
dates publish. The two Fort Mason listings are indeed separate records; they are the Marina's.

**f. Hyde Street Pier carries no designation.** Explicit on the Aquatic Park district article:
"Hyde Street Pier, though part of the San Francisco Maritime National Historical Park, **is not
part of Aquatic Park Historic District**." Do not let a district sentence drift onto the pier.

---

## 2. The Mare Island finding — CONFIRMED verbatim, and it is the finder's best work

Re-fetched `nps.gov/safr/index.htm` and `/planyourvisit/basicinfo.htm`, both HTTP 200. The
quotes are exact:

> "Since 2025, our museum ships have been at Mare Island Naval Shipyard. They will remain there
> while their longtime home, Hyde Street Pier in San Francisco, is rebuilt."

> "Hyde Street Pier is closed at this time. The ships are berthed at the Mare Island Coal Sheds.
> Mare Island Coal Sheds, 860 Nimitz Ave. Vallejo, CA 94592"

The finder is right that a sentence reading "moored at Hyde Street Pier" is currently false. I
adopt its second option, which keeps the subject on the world rather than the page. **Every ship
record uses this sentence verbatim:**

> "The ships of San Francisco Maritime National Historical Park are berthed at the Mare Island Coal Sheds in Vallejo while Hyde Street Pier is rebuilt."

The county assertion survives: the NRHP addresses of record for *Balclutha*, *Eureka*,
*C. A. Thayer*, *Alma* and *Hercules* are all in San Francisco County, and a place record carries
the address of record, not a temporary berth.

**One thing the finder got wrong here: *Pampanito* is not affected.** It is not an NPS vessel —
it is operated by the San Francisco Maritime National Park Association, its NRHP address of
record is "Fisherman's Wharf-Pier 45", and NPS's closure notice does not cover it. Do not put
the Mare Island sentence on *Pampanito*.

---

## 3. Place-by-place rulings

### PUBLISH as written (13)

**1. Pier 39** — opened **4 October 1978**, developed by Warren Simmons; both confirmed on
Wikipedia. Hours re-fetched from the operator and match: retail 10:00–21:00, full-service
restaurants 11:00–22:00, fast food 10:00–21:00, attractions 10:00–21:00. You may add the row
the finder missed: outdoor vendor carts and kiosks 11:00–20:00.

**3. Aquarium of the Bay** — re-fetched: "Hours Monday – Sunday 10:00 AM – 5:00 PM, PIER 39, San
Francisco". Confirmed.

**4. Pier 45** — fish-handling sheds, *Pampanito*'s berth, Musée Mécanique in Shed A. No
designation claim attached, correctly.

**5. USS *Pampanito*** — Balao-class diesel-electric, Portsmouth Naval Shipyard, Kittery, Maine;
launched 12 July 1943; commissioned 6 November 1943; museum ship in San Francisco since 21
November 1975. NRHP 86000089. All confirmed. *(Do not name the sponsor — the article's infobox
and body disagree, "Mrs. James Wolfender" against "Mrs. Violet Wolfenden".)*

**8. Pier 43 Ferry Arch** — opened 1914; headhouse a decorated hoisting tower for loading rail
cars on and off ferries, built 1914 to serve the Belt Railroad; wood pier replaced 1996;
headhouse rehabilitated 2002–2003 to the Secretary of the Interior's Standards after a fire in
1998. Confirmed. Write "the Belt Railroad", which is what the source says.

**19. Park Visitor Center** — independently confirmed by the Haslett Warehouse article: the
building "today contains the National Park Service visitor center and the Argonaut Hotel."

**22. Aquatic Park Cove** — confirmed open; the park's 50 acres "have grown around Aquatic Park
Cove, a protected area in the San Francisco Bay."

**24. Victorian Park** — now independently sourced, which the finder could not manage: the
Aquatic Park district article gives "a grassy area known as Victorian Park, which contains the
Hyde Street cable car turnaround." Beach Street at Hyde. Still no build date; give none.

**35. Pompei's Grotto** — **the finder wrote this off and it publishes.** `pompeisgrotto.com`
answers: **340 Jefferson Street, San Francisco, CA 94133**; "Open daily at 11:00 a.m."; "open for
lunch and dinner 363 days a year (closed Christmas Eve night and Christmas Day), serving dinner
all day and lunch until 4 p.m. daily." Address and hours publish. **Its "opened on February 1,
1946" does not** — founding year from the operator's own site.

**37. Ripley's Believe It or Not! San Francisco** — **the finder's doubt resolves in its favour.**
`ripleys.com/sanfrancisco/` redirects to a live attraction page, "Ripley's Believe It or Not! San
Francisco | Tickets, Hours, Events". It is trading. Jefferson Street.

**43. Powell-Hyde cable car turntable, Hyde & Beach** and **44. Powell-Mason turntable, Bay &
Taylor** — SFMTA confirms turntables "at Bay & Taylor and Hyde & Beach Streets". Russian Hill's
finder concedes Hyde & Beach explicitly. No operating hours published; give none.

**NEW. SkyStar Wheel** — **the finder missed this entirely, though it is named in the Wikipedia
zone article it cited.** Operator site: **2860 Taylor Street, San Francisco, CA 94133**, "open
daily from 10:00 a.m. to 10:00 p.m."; 150 feet; gondolas enclosed and climate-controlled. Opening
date independently sourced: "On November 13, 2023, the SkyStar Wheel began operations in
Fisherman's Wharf." 🚫 Its "the city's only observation wheel" and "The Best View in San
Francisco" are superlatives and do not publish.

### PUBLISH after REWRITE (18)

**2. The sea lions, Pier 39** — colony "first began hauling-out on Pier 39 in September 1989"
confirmed. 🚫 **"K Dock" is not in any source and I could not find it either. DROP the dock
letter.** The brief asserting it does not make it citable. Replacement:
> "A colony of California sea lions began hauling out at Pier 39 in September 1989."

**7. Musée Mécanique** — Pier 45, Shed A; founded by **Ed Zelinsky**, directed by his son **Dan
Zelinsky**; over 300 machines with about 200 displayed; a Praxinoscope built in 1884; a
steam-powered motorcycle built in Sacramento in 1912; the Royal Court diorama, shown at the
Panama–Pacific International Exposition; Laffing Sal, a six-foot laughing automaton; Playland
1928–1972, then the Cliff House basement from 1972. Both operator domains still fail
(`museemecanique.com` serves an empty JavaScript shell, `museemecaniquesf.com` has no route), so
**no hours and no admission** — correct, give none.
🚫 **DROP "the National Park Service moved it to Fisherman's Wharf in 2002."** I could not source
it; the only "2002" on the article is a visitor-count year, and I suspect that is where it came
from. 🚫 DROP "the oldest is a Praxinoscope" (write "a Praxinoscope built in 1884"), 🚫 DROP
"the only steam-powered motorcycle in the world" — the finder already stripped this one
correctly, keep it stripped — and 🚫 DROP "one of the world's largest privately owned
collections."

**10. San Francisco Maritime National Historical Park** — 🚫 **DROP the "2 Marina Boulevard,
Building E" HQ address.** The finder itself notes it is in Fort Mason; carrying it puts a Marina
address on a wharf place. Establishment year is sourced ("Established in 1988") and publishes.
Replacement anchor:
> "San Francisco Maritime National Historical Park was established in 1988, and its 50 acres have grown around Aquatic Park Cove."

**11. Hyde Street Pier** — 2905 Hyde Street; principal automobile-ferry terminal before the
Golden Gate and Bay Bridges, carrying US 101 to Sausalito and US 40 to Berkeley; Golden Gate
Ferry Company; merged with Southern Pacific's auto-ferry system in early 1929, service taken over
by Southern Pacific-Golden Gate Ferries, Ltd. from 1 May 1929. All confirmed verbatim. Add the
closure as fact. 🚫 **Do not attach any district designation** — see §1f.

**12. *Balclutha*** — 1886, Charles Connell & Co. Ltd.; dimensions and trades as the finder has
them; NRHP 76000178. Add the Mare Island sentence.

**13. *Eureka*** — 1890, John Dickie, Tiburon, originally *Ukiah*; NRHP 73000229. 🚫 **DROP "the
last intact wooden-hulled side-wheel steamer afloat in the continental United States"** — a
ranking with a comparison class. The finder called this correctly; note it slips the gate's
regex, so it has to be caught by hand. Add the Mare Island sentence.

**14. *C. A. Thayer*** — 1895, Hans D. Bendixsen; NRHP 66000229. Add the Mare Island sentence.

**15. *Alma*** — 1891, Fred Siemer; NRHP 75000179. Add the Mare Island sentence.

**16. *Hercules*** — 1907, John H. Dialogue and Son, Camden, New Jersey, for the Shipowners' and
Merchants' Tugboat Company's Red Stack fleet; 151 ft, riveted steel, original triple-expansion
steam engine (confirmed on the NPS page). **Add the designation the finder said did not exist:**
> "Listed on the National Register of Historic Places in 1975, reference number 75000225."

Add the Mare Island sentence.

**18. Maritime Museum / Aquatic Park Bathhouse** — every element confirmed on the NPS page:
**William Mooser II** supervised, his son **William Mooser III** designed it, Streamline Moderne
"defined by sweeping lines, curved facades, stainless steel railings, and porthole windows",
design "evoked a ship at port", WPA construction **1936 to 1939**, $1.5 million, dedication
ceremony **22 January 1939** drawing a crowd of 10,000. Contributing to Aquatic Park Historic
District, NRHP 84001183. 🚫 **DROP "has housed the maritime museum since 1951"** — I could not
source the year. 🚫 Do not borrow NPS's "the pinnacle of modernity."

**21. Aquatic Park Historic District** — "Bounded by Van Ness Ave., Hyde and Polk Sts." verified
word for word against the register. Contributing elements: beach, bathhouse, municipal pier,
restrooms, concessions stand, stadia, two speaker towers. NRHP 84001183 listed 26 January 1984;
NHL district 28 May 1987. **Add California Historical Landmark No. 236** (§1d).

**23. Municipal Pier** — the finder had only its existence. Now sourced: "To the west is the
horseshoe-shaped Municipal Pier", and it is named among the district's contributing elements. Its
closure is real and citable to SFGATE, 23 November 2022. Still **no build date or length** — give
none. Replacement:
> "The horseshoe-shaped Municipal Pier is a contributing element of the district. It has been closed to the public since 2022."

**25. Dolphin Club** — re-fetched and confirmed: "a volunteer-led community of 1800+ members,
centered at Aquatic Park, with a boathouse at Lake Merced"; open to members seven days a week,
5 a.m.–10 p.m.; public-access day use Monday/Wednesday/Friday, 9 a.m.–5 p.m. from 1 November to
30 April and 8 a.m.–5 p.m. from 1 May to 31 October. 🚫 **"Founded in 1877" does not publish** —
the finder is right. ⚠️ **The address is contested**: this file says 502 Jefferson, Russian Hill's
finder says 500 Jefferson, and I could not settle it. **Write "at Aquatic Park" and no street
number** until someone sources it.

**27. Ghirardelli Square** — Landmark No. 30 (1970) and NRHP 82002249 (29 April 1982) both
verified. 🔧 **The 1893 sentence is wrong.** The source says "In 1893, Domenico Ghirardelli
**purchased the entire city block** in order to make it into the headquarters of the Ghirardelli
Chocolate Company" — a purchase, not a construction. Replacement:
> "Domenico Ghirardelli bought the whole city block in 1893 to make it the headquarters of the Ghirardelli Chocolate Company."

🚫 **DROP the architects "Maarten Getkate Sr. and William S. Mooser"** — not in the source I
re-fetched. Confirmed and publishable: the company was bought by the Golden Grain Macaroni
Company in the early 1960s, which moved the headquarters to San Leandro and put the square up for
sale; **William M. Roth and his mother Lurline Matson Roth** bought the land in **1962**; they
hired **Lawrence Halprin** and **Wurster, Bernardi & Emmons**; it opened in **1964**; Benjamin
Thompson and Associates renovated the Clock Tower's lower floor in 1965 for a Design Research
store. 🚫 "the first major adaptive re-use project in the United States" and 🚫 the operator's
"A BAYSIDE LANDMARK SINCE 1862" both stay out — the finder called both correctly, and I confirm
the operator's site carries that line and almost nothing else (413 characters of text, no hours).

**28. Haslett Warehouse / Argonaut Hotel** — everything verified: built **1907–1909**, architect
**William S. Mooser Jr.**, for the **California Fruit Canners Association**, storing Central
Valley produce canned east of the warehouse; NPS leased it to Kimpton in **2002** on a 57-year
term; roughly **198,000 sq ft**, **252 rooms**, opened **August 2003**; still part of the park.
Landmark No. 59 and NRHP 75000172 both verified. Good extra the finder missed: in 1916 the
California Fruit Canners Association merged into California Packing, which sold under the **Del
Monte** label. 🔧 **On the address, pick 680 Beach Street** — it is the address of record in both
registers; mention 495 Jefferson Street as the hotel's own frontage if useful. 🚫 DROP the
hotel's "award-winning", 🚫 its "AAA Four Diamond Award", and 🚫 Wikipedia's "the only AAA 4
diamond hotel in Fisherman's Wharf" — the finder caught the first and missed the other two.
🚫 Do not borrow the hotel's "mere steps to next door Ghirardelli Square" — orientation by
impression.

**30. Boudin Bakery — Bakers Hall, Bistro Boudin** — the wharf page confirms the structure: a
working bakery watched through a **30-foot observation window** with a two-way intercom to the
bakers; **Bakers Hall** holding the marketplace, cafe and espresso bar; **Bistro Boudin**, a
full-service waterfront restaurant. Breakfast at Bakers Hall 8:00–11:00. ⚠️ **The address "160
Jefferson Street" did not appear on any page I fetched** — verify it or write the place without a
street number. Confirmed correct: no full hours are published, so give none. 🚫 Do not borrow
"the best local flavors."

**31. Buena Vista Cafe** — 🔧 **the hours are wrong on three of the four rows.** The site says:
**Mon–Thu 10am–11pm, Fri 9am–12am, Sat 9am–12am, Sun 9am–11pm, kitchen closed 9:30pm.** The
finder wrote Mon–Thu from 09:00, Sat from 08:00 and Sun from 08:00. Use the corrected line
verbatim:
> "Monday to Thursday 10.00–23.00, Friday and Saturday 9.00–24.00, Sunday 9.00–23.00. The kitchen closes at 21.30."

Address 2765 Hyde Street at Beach confirmed. The finder is right that any "first Irish coffee in
America" claim is a superlative; the site does carry an "Irish Coffee Story" page, and it stays
unfetched and unused.

**32. Scoma's** — address and hours verified exactly as the finder has them: 1965 Al Scoma Way,
Pier 47; Mon–Thu and Sun 12:00–21:30, Fri–Sat 12:00–22:00, bar from 11:30 daily. Add: closed
Thanksgiving Day, Christmas Eve and Christmas Day. 🚫 **The finder flagged one superlative and
missed four.** None of these publish: "The Best Seafood Restaurant in San Francisco"; "named one
of San Francisco's Top 100 Bay Area restaurants by the San Francisco Chronicle"; "OpenTable
ranked Scoma's as one of the Top 10 Most Booked Restaurants in San Francisco"; "an award-winning
bar program"; "famous for serving the freshest seafood". 🚫 Nor do "Founded in 1965", "Family-owned
for three generations" or "For more than 60 years" — all trading duration from the operator's own
site. What survives is the address, the hours, and that it sits on a working pier.

### DROP (15)

**6. SS *Jeremiah O'Brien*** — **DROP from this zone.** The finder flagged a Pier 35/Pier 45
conflict and could not settle it. It is settled, and against the wharf: the NRHP address of
record is **"Pier 3, Fort Mason Center"**; the article's own photo caption reads "at its
**former** berth at Pier 45"; and the body says she "moved to Fort Mason on the San Francisco
waterfront just to the west of Fisherman's Wharf." Escalated in §4. Also note the finder's NHL
date for her is *Pampanito*'s.

**9. Alcatraz Landing, Pier 33** — out of zone, as the finder says. DROP.

**17. Paddle tug *Eppleton Hall*** — no National Register record exists (§1b), so no designation
sentence; its "the only intact example of a Tyne-built paddle tug" is a superlative; and the
vessel is at Mare Island. Nothing publishable is left standing. DROP.

**20. Maritime Research Center** — nothing sourced. DROP.

**26. South End Rowing Club** — **the finder's warning is confirmed and it was right not to follow
the link.** `south-end.org` 301-redirects off-host to `kaya33.net`, an Indonesian gambling site.
I also tried `sercsf.org`, which does not resolve. No current official domain, no sourced fact.
DROP. Whoever revisits this: do not cite the obvious domain.

**29. The Cannery at Del Monte Square** — I re-tried both Wikipedia titles the finder tried plus
`Del_Monte_Square`; all 404. It is not in the Article 10 list — I confirmed that against the full
370 rows. No build date, architect or conversion date exists anywhere I could reach. DROP, as the
finder recommended.

**33. Alioto's** — `aliotos.com` does not resolve. Operating status cannot be established. DROP.

**34. Fishermen's Grotto** — `fishermensgrotto.com` returns an empty document. DROP.

**36. Ghirardelli Ice Cream & Chocolate Shop** — no independently sourced address or hours; the
square's own site is 413 characters and gives neither. DROP.

**38. Madame Tussauds San Francisco** and **39. San Francisco Dungeon** — **the finder's
unconfirmed impression was right and I have now confirmed it.**
`madametussauds.com/san-francisco/` returns 404, and `thedungeons.com/san-francisco/` redirects to
the global site whose location list is UK and Europe only — London, Edinburgh, Blackpool, York,
Alton Towers, Warwick, Amsterdam, Berlin, Hamburg — with no San Francisco. Both DROP. The
Wikipedia zone article still lists Tussauds; it is stale, and a stale tertiary source does not
beat two operator sites.

**40. Blue & Gold Fleet** and **41. Red & White Fleet** — unsourced. DROP.

**42. Pier 39 Carousel** — unsourced. DROP. (The finder's photo note is right and worth keeping in
the research file: a carousel is a sculptural work, so 17 USC 120(a) does not reach it.)

**45. Fishermen's and Seamen's Memorial Chapel** — one subordinate clause of source, no address,
no build date, no builder. DROP.

---

## 4. Straddlers I am escalating — five, not forty-five

1. **SS *Jeremiah O'Brien*.** Register address Fort Mason Pier 3; infobox Pier 35; Pier 45
   described as former. Marina or Telegraph Hill, not this zone. Needs one owner.
2. **San Francisco Maritime National Historical Park as an administrative unit.** Its HQ is at
   2 Marina Boulevard in Fort Mason while its visitor center, museum and cove are here. I have
   written it as a wharf place with the Fort Mason address dropped; the arbitrator may prefer to
   split it.
3. **The five NPS ships during the rebuild.** Register addresses in San Francisco County,
   physical location in Solano County. I rule they stay, on address of record, with the Mare
   Island sentence. Flagging it because it is a judgement, not a lookup.
4. **Municipal Pier and the Dolphin Club** — over water, inside no polygon of any geography. They
   need a rule rather than a point-in-polygon result.
5. **The Embarcadero line.** The roster declined "The Embarcadero" as a zone and split it between
   the Financial District and Fisherman's Wharf without setting the boundary. Pier 33 and Pier 35
   sit exactly on the unset line.

I am **not** escalating the Russian Hill or North Beach straddles. See §0: the roster assigns
them and both neighbouring finders decline them in writing.

---

## 5. Tier ruling

**GUIDE, on 31 surviving places.** Not a town page.

Thirty-one places, thirteen verified designation identifiers across three registers, and a
narrative that runs from the 1886 *Balclutha* through the 1907–09 Haslett Warehouse and the
1936–39 WPA bathhouse to the 1964 Ghirardelli conversion, the 1978 opening of Pier 39 and the
2023 SkyStar Wheel. Entry kinds are all fillable: `food` (Boudin, Buena Vista, Scoma's, Pompei's
Grotto), `sight` (Pier 39 and the sea lions, the Musée, Pampanito, the bathhouse, Pier 43 Ferry
Arch), `walk` (Aquatic Park, Victorian Park, the cove, Municipal Pier), `stay` (the Argonaut) and
`tip` (the two turntables, the Mare Island closure, the Aquarium).

The finder feared the tier could collapse if the Russian Hill straddle took Ghirardelli Square,
Aquatic Park and the Haslett Warehouse — and with them both Article 10 numbers. That fear is
unfounded: Russian Hill's own finder concedes all three to this zone. The tier is not close to
the line and does not depend on the arbitration.

---

## 6. Photography — no change, with one addition

`"photos": []` this wave. The finder's copyright analysis is sound and I am not disturbing it:
buildings are fine under 17 USC 120(a); the bathhouse interior is not, because Hiler (d. 1966),
Johnson (d. 1967) and Bufano (d. 1970) are all inside life+70; and its warning that **Sargent
Claude Johnson's carved slate is on the main facade**, so even an exterior frame can feature a
live-copyright artwork, is the sharpest observation in the file. Add to the list: **the SkyStar
Wheel is a structure rather than an architectural work**, and the ships' figureheads and the
Pier 39 carousel are sculptural — none of them ride on 120(a).

---

## 7. What the finder got wrong

Credit first, because two calls were genuinely good: the `taken_slugs.py` diagnosis is correct and
load-bearing, and the Mare Island closure is the most consequential fact in the zone, found from
the primary source and quoted accurately.

Against that:

1. **The straddle framing was the biggest error** — 45 places handed up for arbitration on the
   authority of a geography the roster explicitly declined, when the roster's own `draw` field and
   both neighbouring finders already settle it. Five straddlers are real.
2. **The Buena Vista hours are wrong on three of four rows.**
3. **It declared the *Hercules* reference number unfindable.** It is 75000225.
4. **It missed California Historical Landmark No. 236** on Aquatic Park.
5. **It attributed 01000281 to the Maritime Museum and *Eppleton Hall*.** It is Fort Mason Bldg 201.
6. **It put *Pampanito*'s NHL date on the *Jeremiah O'Brien*.**
7. **It treated Pier 45 as the O'Brien's live berth** when the article it cited calls it former.
8. **It missed five superlatives on Scoma's, two on the Argonaut and two on the Musée** — several
   of which slip the gate's regexes and would have shipped.
9. **It wrote off two places that publish** — Pompei's Grotto has a live site with address and
   hours, and Ripley's is confirmed trading.
10. **It missed the SkyStar Wheel entirely**, though it is named in the Wikipedia zone article it
    cited and North Beach's finder flagged it as this zone's.
11. **It read Ghirardelli's 1893 as a construction date** when the source says purchase.
12. **It asserted the NPS moved the Musée in 2002** and the bathhouse "has housed the museum since
    1951"; neither is sourced.
