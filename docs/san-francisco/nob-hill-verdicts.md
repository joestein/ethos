# Nob Hill, San Francisco — VERDICTS

Adjudicated 2026-09-03 against `docs/san-francisco/nob-hill-finder.md`.
Zone slug `nob-hill`, destination `Nob Hill, California`.

This file is the research record. Provenance arguments, quoted superlatives and
failed sources live here and must not cross into a seed file.

**Ruling: `tier: "guide"`. 13 surviving places. See §6.**

---

## 0. WHAT WAS RE-FETCHED

Everything below was pulled fresh, not taken from the finder.

| source | result |
|---|---|
| `97yj-54sx` Article 10 landmarks, `$limit=1000` | 370 rows. **All 18 landmark numbers re-verified**, name/address/year/APN |
| NPS `nrhp_locations` layer 0 (points) | 8 of our refs |
| NPS `nrhp_locations` layer 1 (polygons) | 3 of our refs, both NHL flags |
| `63x5-g3m4` historic districts | 204 rows, full records for both districts |
| `3tsw-4idn` parcel/CEQA | 17 parcels resolved by `stname` + `lowstnum`/`highstnum` |
| `gtr9-ntp6` Rec & Park property register | 255 rows |
| `r7bn-7v9c` Civic Art Collection | 1,038 rows |
| `j2bu-swwd` (41) and `gfpk-269f` (117) | re-run point-in-polygon from landmark geometry |
| gracecathedral.org `/`, `/architecture/`, `/history/`, `/our-labyrinths/` | all 200 |
| cablecarmuseum.org, sfmta.com, topofthemark.com, nobhillcafe.com, sfmasonic.com, stanfordcourt.com, fairmont-san-francisco.com | all 200 |
| huntingtonhotel.com, big4restaurant.com | **timed out again** |

**Designation numbers surviving re-fetch: 27 of 27** — 18 Article 10 numbers and
9 National Register references. Not one was wrong. This is the finder's
strongest work and it deserves saying plainly.

### The 18 Article 10 numbers, re-verified

| No. | name as designated | address | designated | APN |
|---|---|---|---|---|
| 36 | Feusier Octagon House/Kenny Residence | 1067 Green Street | 1970 | 0126022A |
| 42 | Dennis T. Sullivan Memorial Home | 870 Bush Street | 1971 | 0274010 |
| 43 | Cable Car Barn And Power House | 1201 Mason Street | 1971 | 0190005 |
| 44 | Donaldina Cameron House | 920 Sacramento Street | 1971 | 0224008 |
| 46 | House Of The Flag; Old Sheppard-Dakin Hs | 1652-1656 Taylor Street | 1972 | 0149032 |
| 64 | Old Flood Mansion -Pacific Union Club | 1000 California Street | 1974 | 0245001 |
| 97 | Atkinson-Escher House | 1032 Broadway Street | 1977 | 0150045 |
| 106 | Chambord Apartments | 1298 Sacramento Street | 1979 | 0221125 |
| 122 | Clay Street Center | 965 Clay Street | 1981 | 0224079 |
| 159 | Gaylord Hotel | 620 Jones Street | 1983 | 0305036 |
| 170 | Grace Cathedral | 1051-1055 Taylor Street | 1984 | 0246001 |
| 184 | Mark Hopkins Hotel | 850 Mason Street | 1987 | 0255002 |
| 185 | Fairmont Hotel | 950 Mason Street | 1987 | 0244001 |
| 195 | Islam Temple (Alcazar Theater) | 650 Geary Boulevard | 1989 | 0304025 |
| 204 | Our Lady of Guadalupe Church | 906 Broadway Street | 1993 | 0149009 |
| 220 | Engine Company Number 31 Fire House | 1088 Green Street | 1998 | 0121010 |
| 235 | Chinatown Branch Carnegie Library | 1135 Powell Street | 2002 | 0191004 |
| 251 | Glazer-Keating House | 1110 Taylor Street | 2005 | 0222018 |

Grace Cathedral's number is now **double-sourced**: the cathedral's own
architecture page says it "became San Francisco City Landmark #170 in 1984",
independently of the DataSF row, and adds that the designation covers "the
bordering Crocker walls and Diocesan House".

### The 9 National Register references, re-verified

Field is `NRIS_Refnum`, not `REFNUM`. A query on `REFNUM` returns HTTP 400 and
zero features, which reads exactly like "not listed" and is not.

| ref | name | address as NPS holds it | certified | NHL | layer |
|---|---|---|---|---|---|
| 66000230 | Flood, James C., Mansion | California and Mason Sts. | 1966-11-13 | **X** | 1 |
| 66000233 | San Francisco Cable Cars | 1390 Washington St. | 1966-10-15 | **X** | 1 |
| 91000957 | Lower Nob Hill Apartment Hotel District | Roughly 590–1209 Bush, 680–1156 Sutter, 600–1099 Post Sts. and the intersecting cross streets | 1991-07-31 | — | 1 |
| 02000373 | Fairmont Hotel | 950 Mason St. | 2002-04-17 | — | 0 |
| 84001184 | Chambord Apartments | 1298 Sacramento St. | 1984-09-20 | — | 0 |
| 74000554 | Feusier Octagon House | 1067 Green St. | 1974-03-24 | — | 0 |
| 87002288 | Russian Hill--Paris Block Architectural District | Roughly 1017--1067 Green St. | 1988-01-07 | — | 0 |
| 87002289 | Russian Hill--Vallejo Street Crest District | Roughly 1020-1032 Broadway, 1-49 Florence, 1728-1742 Jones, 1-7 Russian Hill Pl., 1629-1715 Taylor, & 1000-1085 Vallejo | 1988-01-22 | — | 0 |
| 87002290 | Engine House No. 31 | 1088 Green St. | 1988-01-07 | — | 0 |

The finder's split of layer 0 and layer 1 is correct and matters: the Flood
Mansion, the cable cars and the Lower Nob Hill district appear **only** on
layer 1. Querying points alone loses both National Historic Landmarks.

**NRHP 100009644 (St. Luke's Episcopal Church)** re-fetched: address, city,
county and certification date are all null. The finder's refusal to cite it
stands. **DROP.**

---

## 1. VERDICTS — GRACE CATHEDRAL

**PUBLISH 1.** San Francisco Landmark No. 170, designated 1984. Double-sourced.

**PUBLISH 2.** Address **1100 California Street, San Francisco, CA 94108** —
the cathedral's own footer, verified on four separate pages. SF Planning's
1051–1055 Taylor Street is the parcel. Use the cathedral's own. The parcel at
1100 California is APN 0246001, the same APN the landmark row carries, which
settles the discrepancy: one property, two street frontages.

**PUBLISH 3.** Hours **Monday–Saturday 10am–5pm, Sundays 1–5pm**. Verified in
the site footer.

**PUBLISH 4.** Dimensions, verbatim from the architecture page: "The Cathedral
is 329 feet (100m) long, 162 (49m) feet wide at the transepts and the nave
vaulting rises to 91 feet (27m)." Measurements are expressly permitted.

**PUBLISH 5 — THE FINDER MISSED THIS.** The same page gives: "The cathedral
faces 9˚15'south of due west, parallel to adjacent California Street. The
sanctuary floor, surrounding the High Altar steps, is at 299.5 feet (91.4m)
above mean sea level." Two more measurements and a bearing. All publishable,
and the bearing is a genuinely good sentence.

**PUBLISH 6.** Architect **Lewis Hobart** chose French Gothic; cruciform plan,
twin towers, central fleche and polygonal apse; Amiens, Notre-Dame, Beauvais
and Chartres as influences; wide nave, narrow piers and absent triforium after
Aragonese Gothic and Palma, Majorca; English nave clerestory; Chapel of Grace
after the Sainte-Chapelle. All verified verbatim.

**PUBLISH 7.** Fabric: raw concrete and steel because "the 1906 earthquake made
structural strength necessary"; riveted steel lattices, beams and rebar
1927–1943; clustered steel rebar and beams 1960–1964; Guastavino acoustic tile
for the vaulting. Verified.

**PUBLISH 8.** The chronology, all verified on `/history/`: Grace Chapel in the
1849 Gold Rush on Powell near Jackson; a brick Gothic church at California and
Stockton in 1862, burned 1906; the William H. Crockers gave their block to the
diocese; pro-cathedral 1907; cornerstone 1910; Bodley, then Cecil Hare, then
Hobart; Founders Crypt 1914–1930; present cathedral begun 1927; Chapel of
Grace opened 1930; two-thirds built and opened for use by 1934; north tower
1936–1943; work resumed 1960; consecrated 1964; Cathedral School for Boys begun
1956; close finished 1995; close occupies "a 2.5-acre (1hc) city block".

**PUBLISH 9.** The spite fence: Nicholas Yung, a German undertaker, refused to
sell to Charles Crocker when Crocker was buying up the block in 1874; the fence
remained until 1904. Verified verbatim. A date, not a ranking.

**REWRITE 1 — the Big Four clause.** The source says "one of the Big Four
builders of America's first transcontinental railroad". The finder flagged it;
it is right. Use verbatim:

> In 1876 Charles Crocker, one of the Big Four builders of the
> transcontinental railroad, built a mansion on the block where the cathedral
> nave now stands. The hill took its name from "nabob".

**REWRITE 2 — the diocese.** The source phrasing is "Grace Cathedral, of the
Diocese of California". Use verbatim:

> Grace Cathedral is the cathedral of the Episcopal Diocese of California.

**REWRITE 3 — the labyrinths.** Verified: "Grace Cathedral has an indoor and an
outdoor labyrinth. The indoor one is available to you during cathedral visitor
services hours, and the latter is available to you 24/7!" and, on the history
page, "Canon Artress introduced the labyrinth in 1991." Use verbatim:

> Grace Cathedral has an indoor and an outdoor labyrinth, both in the Chartres
> pattern. The indoor labyrinth is open during cathedral visitor hours and the
> outdoor labyrinth is open at all hours. Canon Lauren Artress introduced the
> labyrinth in 1991.

**DROP 1.** "Grace Cathedral is the third largest Episcopal Cathedral in the
nation, after sister cathedrals in New York and Washington D.C." A ranking with
its comparison class stated outright. Finder flagged it correctly.

**DROP 2.** "the Modern Labyrinth Movement that began in 1991" and "The Modern
Labyrinth Movement was founded at Grace Cathedral!" Both are primacy claims.
The bare 1991 date survives; the movement claim does not.

---

## 2. THE HARING ALTARPIECE — THE FINDER'S LARGEST ERROR

The finder made this its **third least-confident item** and instructed the
author: "Do not publish it as written until a page names it." It said "I did
not obtain a page on the cathedral's own site naming the altarpiece."

**That is wrong.** `gracecathedral.org/architecture/` — a page the finder
itself fetched and reported as answering — names it in full:

> The first major furnishing obtained for the chapel was a casting of the
> striking triptych altarpiece "The Life of Christ" (1990) by New York pop
> artist Keith Haring... The altarpiece was obtained with the help of his
> friend Yoko Ono and local activist Frank Malifrando. Shaped like a Russian
> icon, it depicts a multi-armed figure of compassion...

The same page names the chapel: "The AIDS Interfaith Memorial Chapel at Grace
Cathedral is a sacred and welcoming place that serves many needs. It is a site
of pilgrimage..." and records the north tower lobby area was "set aside in
1995".

The finder fetched the page, quoted four other passages from it, and did not
read to the bottom. A verifier that took its word would have deleted a
first-rate, fully sourced fact.

**REINSTATED — REWRITE 4.** Two rankings must come out first: "only one of a
handful of such chapels dedicated to people impacted by AIDS" / "one of only a
handful in the United States", and "his last work before his own death from
AIDS". Use verbatim:

> The AIDS Interfaith Memorial Chapel occupies the north tower lobby, set aside
> in 1995. Its first major furnishing was a casting of "The Life of Christ", a
> triptych altarpiece Keith Haring made in 1990. The cathedral records that the
> casting was obtained with the help of Haring's friend Yoko Ono and the local
> activist Frank Malifrando, and that it is shaped like a Russian icon.

**Photo note stands.** Haring died in 1990, the work is indoors, and 17 USC
120(a) reaches architecture only. Writable, not photographable. Same for both
labyrinths, which are paving.

---

## 3. VERDICTS — THE REST OF THE CORE

### Cable Car Museum — `museum`

**PUBLISH 10.** Address **1201 Mason Street**, verified in the site's own
footer: "Cable Car Museum - 1201 Mason Street - San Francisco". Admission
**free**. Run by the **Friends of the Cable Car Museum**, "a nonprofit
organization dedicated to the preservation of cable car history". Housed, in
its own words, in the "Washington-Mason powerhouse and carbarn on Nob Hill".

**PUBLISH 11.** The building is **San Francisco Landmark No. 43 (Cable Car Barn
And Power House), designated 1971**. SF Planning's parcel 0190005 gives year
built **1900**, CEQA code A.

**PUBLISH 12.** **NRHP reference number 66000233, listed 15 October 1966**, a
**National Historic Landmark** (`Is_NHL: X` on layer 1). NPS addresses it 1390
Washington Street — the same building off its other frontage.

**REWRITE 5 — opening days.** The site really does carry "Open Daily" and
"Closed Mondays" in the same line. The finder's caution is right. Use verbatim:

> Admission is free. The museum's own site gives its opening days in two ways
> that do not agree, so no days are given here.

This is the sanctioned form: the subject is the source and the fact, not the
page's editorial choices.

**DROP 3.** SF Planning's district description — "The San Francisco Cable Car
Historic District are the only ones still operating in a United States City" —
re-fetched and confirmed verbatim. A ranking. Must not publish, attributed or
not. Finder flagged it correctly.

### The cable car lines — `attraction`

**PUBLISH 13.** SFMTA, verified verbatim: "Choose from three cable car lines -
two start at Powell and Market and continue to the Fisherman's Wharf area; one
starts at California and Market and continues to Van Ness Avenue." And: "To
board cable cars at Powell & Market, Bay & Taylor and Hyde & Beach Streets, you
must purchase your fare in advance (applies 8 a.m. to 8 p.m. daily)." No grade
percentage and no fare figure appears; the finder is right about that.

**REWRITE 6 — which line is Nob Hill's.** The finder wrote that the California
line "is the one that crosses the hill's summit". No source states that. The
line's route along California Street is sourced; the summit claim is not. Use
verbatim:

> The California Street cable car line runs along California Street across Nob
> Hill. SFMTA gives three lines in all: two start at Powell and Market and
> continue to the Fisherman's Wharf area, and one starts at California and
> Market and continues to Van Ness Avenue.

The Powell/Market turntable is Union Square's — the roster names it in Union
Square's draw. Nob Hill must not take it.

**REWRITE 7 — the district citation.** The finder wanted to cite the "San
Francisco Cable Car Historic District" from `63x5-g3m4`. Re-fetched: `cr:
Listed`, `nr: Listed`, `a10: No`, `pos_1: 1873`, `dateadop: 1978-04-03`. The
adoption date the finder gave is correct. **But the district row carries no
reference number**, and a designation claim needs an identifier. Cite the NHL
instead, which does:

> The cable cars were listed on the National Register of Historic Places on 15
> October 1966 as San Francisco Cable Cars, reference number 66000233, and are
> a National Historic Landmark.

### Pacific-Union Club / Flood Mansion — `historic-site`

**PUBLISH 14.** LM 64, designated 1974, 1000 California Street, APN 0245001.
**PUBLISH 15.** NRHP 66000230, listed 13 November 1966, National Historic
Landmark. **PUBLISH 16.** Parcel 0245001 year built **1911**, CEQA A.

**REWRITE 8 — write the building, not a visit.** Use verbatim:

> The Flood Mansion at 1000 California Street is San Francisco Landmark No. 64,
> designated in 1974, and was listed on the National Register of Historic
> Places on 13 November 1966 as the James C. Flood Mansion, reference number
> 66000230. It is a National Historic Landmark. The building houses the
> Pacific-Union Club, which is private, so there are no visiting hours.

**DROP 4.** "the only remaining pre-earthquake structures on Nob Hill", quoted
by the finder from the Fairmont nomination. A ranking. Finder flagged it.

**FLAGGED, NOT DROPPED.** The architect attributions — Augustus Laver (1886)
and Willis Polk's 1909 conversion — come from the Fairmont's NRHP nomination
(02000373). **I could not re-fetch the nomination text.** npgallery returns a
1,965-byte placeholder PNG for every `_text` asset; the NARA catalog API
returned non-JSON. The finder plainly did have it: it reports NPS Form 10-900
box fields (Architectural Classification, Period of Significance, Areas of
Significance, Significant Dates) and an oddly specific negative,
"Architect/Builder: n/a" for the Lower Nob Hill district. That is not
confabulable shape. **Ruling: publishable, but attribute it in-sentence to the
nomination** so a reader can see the source is a register document:

> The Fairmont Hotel's National Register nomination records that the Flood
> Mansion was built in 1886 to a design by the architect Augustus Laver, and
> that Willis Polk renovated it in 1909 for the Pacific-Union Club.

If the author cannot open the nomination either, drop the architects and keep
the 1911 parcel date. Do not promote them to unattributed fact.

### The Fairmont San Francisco — `hotel`

**PUBLISH 17.** LM 185, designated 1987. **PUBLISH 18.** NRHP 02000373, listed
17 April 2002. **PUBLISH 19.** Address 950 Mason Street, verified on its own
site.

**PUBLISH 20.** Dining rooms named on its own site navigation, verified:
**Laurel Court Restaurant & Bar**, **Tonga Room**, **Cirque Bar**, plus Timeless
Tea, Bin 415 and in-room dining. The finder's list is right as far as it goes.

**REWRITE 9 — no hours anywhere.** Use verbatim:

> The hotel names Tonga Room & Hurricane Bar, Laurel Court Restaurant & Bar and
> Cirque Bar among its dining rooms. No source states their hours, so none are
> given here.

**DROP 5 — NEW, THE FINDER MISSED IT.** The Fairmont's own homepage: "Tonga
Room & Hurricane Bar **A San Francisco institution since 1945**". That is a
trading-duration claim sourced only to the operator. It does not publish. The
finder concluded the Tonga Room was undocumented because `tongaroom.com` and
the `/dining/` paths 404 — but the homepage it did fetch carries the claim, and
the claim is exactly the kind the rules bar.

**DROP 6 — NEW.** Same homepage: "the **best panoramic views in the City**". A
ranking.

**FLAGGED.** Beaux Arts Classicism, Reid Brothers (pre-1906) / Julia Morgan
(post-1906), period of significance 1907–1945, the lobby-level room list, and
"the rooftop of the Plunge (now the Tonga Room)" all rest on the same
un-re-fetched nomination. Same ruling as the Flood Mansion: attribute to the
nomination in-sentence, or drop. The Plunge-to-tiki-bar fact is the best one in
the file and is worth the attribution sentence.

### InterContinental Mark Hopkins — `hotel`

**PUBLISH 21.** LM 184 (Mark Hopkins Hotel), designated 1987. Landmark address
850 Mason Street. **PUBLISH 22.** Parcel 0255002 is 999 California Street, year
built **1926**, CEQA A. Both re-verified. **PUBLISH 23.** No NRHP listing — the
NPS name search over San Francisco County returns nothing for Mark Hopkins.

**REWRITE 10 — the one-year conflict.** The gate's own specimen list blesses
this exact construction. Use verbatim:

> SF Planning records the building as built in 1926; the Fairmont Hotel's
> National Register nomination gives its architects as Weeks and Day and its
> date as 1925.

Note the hotel's own site refused a TLS handshake and IHG returns 403, on my
re-fetch as on the finder's. The address is safe because it is corroborated by
the parcel record and by Top of the Mark's own site.

### Top of the Mark — `restaurant`

**PUBLISH 24.** Address **999 California Street, San Francisco, CA 94108**.
**PUBLISH 25.** Hours, verified verbatim: "Sunday - Thursday 4:00 pm - 11:00 pm
Friday - Saturday 3:00 pm - 12:30 am (kitchen: 4:00 pm - 9:30 pm last order)".
The finder transcribed these correctly.

**DROP 7.** "SAN FRANCISCO'S FAVORITE PENTHOUSE COCKTAIL LOUNGE". A ranking.
Finder flagged it.

**DROP 8 — NEW, THE FINDER MISSED IT.** The same page carries "**Since 1939**"
and "**For 86 years**, Top of the Mark has provided panoramic views of the City
skyline". A trading duration sourced only to the operator. It does not publish,
and neither does a founding year derived from it.

**REWRITE 11.** Use verbatim:

> Top of the Mark is a cocktail lounge on the top floor of the InterContinental
> Mark Hopkins at 999 California Street. It opens Sunday to Thursday 4pm to
> 11pm and Friday and Saturday 3pm to 12.30am. The kitchen takes its last order
> at 9.30pm.

### Huntington Park — `park`

**PUBLISH 26.** Rec & Park property 137, re-verified in full: official name
**Collis P Huntington Park**, address **1000 Taylor St**, zip 94108,
**1.29616036 acres / 56,460.97 square feet**, perimeter 953.18 feet, property
type **Civic Plaza or Square**, ownership Recreation & Park, supervisor
district 3, analysis neighborhood **Nob Hill**. Every figure the finder gave is
right.

**PUBLISH 27.** Civic Art, re-verified: **"Fountain of the Tortoises"**, artist
**Taddeo**, 1900, marble and bronze, accession 1954.18, "Gift of Mrs. William
H. Crocker", "In center of park, Park boarded by Taylor, Sacramento, California
and Cushman Streets". **"Dancing Sprites"**, **Henri Leon Greber**, ca. 1942,
bronze, 45" H by 4' diameter, accession 1942.1, "Gift of Mrs. James L. Flood".

**REWRITE 12 — hours.** Use verbatim:

> Huntington Park occupies the block bounded by Taylor, Sacramento, California
> and Cushman Streets. San Francisco Recreation and Parks records it as Collis
> P Huntington Park, a civic plaza or square of 1.29 acres. No source states its
> opening hours, so none are given here.

The bounding streets are sourced from the Civic Art location description, so
they are a sourced locator rather than orientation by impression. Cushman
Street and Pleasant Street survive as street names on the same basis.

**Photo note.** The Tortoises (1900) is out of copyright and photographable.
Dancing Sprites is not architecture; establish Greber's death year before the
photo wave. The finder's instinct to verify is right and the caution costs
nothing.

### Chambord Apartments, Glazer-Keating House — `historic-site`

**PUBLISH 28.** Chambord: LM 106 (1979), 1298 Sacramento Street, APN 0221125;
NRHP 84001184, listed 20 September 1984; parcel year built **1922**, CEQA A,
reason "Article 10 Individual Landmark, National Register Individual". All
re-verified.

**PUBLISH 29.** Glazer-Keating: LM 251 (2005), 1110 Taylor Street, APN 0222018;
parcel year built **1906**, CEQA A. Re-verified. No NRHP — correctly not
claimed.

### The Masonic — `theater`

**PUBLISH 30.** Name **The Masonic**, address **1111 California St, San
Francisco, CA 94108**, from its own site. **NEW:** the site's own footer gives
the operator — "© 2026 **Live Nation** Worldwide" — which the finder did not
record and which is worth having.

**PUBLISH 31.** Parcel 0253020, 1111–1171 California, year built **1956**, CEQA
A, reason "Historic Survey Result". Re-verified.

**PUBLISH 32.** Not an Article 10 landmark and not on the National Register —
confirmed by name search across all 370 landmark rows and both NPS layers. The
finder's negative is correct. **No designation sentence.**

**DROP 9.** Architect Albert Roller, a 28 September 1958 opening and capacity
3,481, all from an uncited Wikipedia infobox. The finder was right to refuse
them and the author must not reinstate them.

**REWRITE 13.** Use verbatim:

> The Masonic is a concert hall at 1111 California Street, operated by Live
> Nation. SF Planning records the building as built in 1956.

### Nob Hill Cafe — `restaurant`

**PUBLISH 33.** Address **1152 Taylor Street** from its own site — which
overrides the OSM tag of 1148, exactly as the finder said. Hours verified:
"Dinner Hours Sun–Thur 5-9pm Fri & Sat 5-10pm Brunch Hours Sat–Sun 11am–3pm".
**NEW:** "No reservations - Walk-ins only", worth carrying.

**DROP 10 — NEW, THE FINDER MISSED IT.** Its own site says it is "Set **only a
block from** Grace Cathedral" and "The Masonic Theater is **just down the
street**." Both are orientation by impression. The second matches the banned
family directly. Neither publishes.

**REWRITE 14.** Use verbatim:

> Nob Hill Cafe is at 1152 Taylor Street and serves home-cooked Italian food.
> Dinner is Sunday to Thursday 5pm to 9pm and Friday and Saturday 5pm to 10pm;
> brunch is Saturday and Sunday 11am to 3pm. It takes no reservations.

### Stanford Court — `hotel`

**PUBLISH 34.** Address **905 California Street, Nob Hill, San Francisco, CA
94108** from its own site. Parcel 0255001 covers 901–905 California, year built
**1971**, CEQA B. Both re-verified.

**DROP 11 — NEW, THE FINDER MISSED IT.** The site carries "**Stanford Court
Ranked Top 10 San Francisco Hotel**" and "**Awarded Trip Advisor Certificate of
Excellence**". An award and a ranking sourced to the business itself.

**DROP 12 — NEW.** The same site: "places you and your dog **steps from** some
of the city's favorite green spaces". "Steps from" is on the banned list
verbatim. The finder reported this site as saying "nothing about the building's
history", which is true and beside the point — it did not read it for banned
claims, and there are three.

**REWRITE 15.** Use verbatim:

> The Stanford Court is at 905 California Street. SF Planning records the
> building as built in 1971.

### Huntington Hotel and The Big 4 — DROP ENTIRELY

**DROP 13.** `huntingtonhotel.com` and `big4restaurant.com` both timed out
again on re-fetch, with no response at all. Neither business's trading status
can be established from any source. Neither may be written as a place.

**DROP 14.** The National Register claim. SF Planning's parcel 0254024 does
give CEQA A with reason "National Register Individual" — I re-verified that —
but both NPS layers return nothing for Huntington anywhere in San Francisco
County, and no reference number exists to cite. A designation claim without an
identifier fails the gate. The finder ruled this correctly and firmly; I
endorse it without qualification.

**PUBLISH 35 (narrow).** The building at 1075 California Street is real and
dated: year built **1924**, CEQA A. That fact survives, and only that fact. It
is not enough for a place entry.

---

## 4. THE PARCEL-DATASET SOURCING DEFECT

The finder attributes building **names** to `3tsw-4idn` roughly twenty times —
"name 'CABLE CAR BARN AND POWER HOUSE'", "name 'CALIFORNIA MEMORIAL MASONIC
TEMPLE'", "BROCKLEBANK APARTMENTS", "Morsehead Apartments", "CATHEDRAL
HOUSE-DEMOLISHED 1994", and the whole list in its §3.

**`3tsw-4idn` has no name column.** Its complete field set, taken as the union
of keys over a 5,000-row sample, is:

    apn, ceqacode, ceqacodea10a11, ceqacodereason,
    highstnum, lowstnum, stname, sttype, yearbuilt

There is not even an `address` field — the address is assembled from
`lowstnum`/`highstnum`/`stname`/`sttype`, which is why every naive address
query against it returns HTTP 400.

The **years and CEQA codes are all correct** — I re-resolved seventeen parcels
and every single `yearbuilt` and `ceqacode` the finder gave matched. The names
did not come from this dataset, and no other source in the file supplies them.

**Ruling by case:**

- **PUBLISH** where the name is independently sourced anyway: Cable Car Barn
  And Power House (Article 10 row, LM 43), Mark Hopkins Hotel (LM 184), Fairmont
  Hotel (LM 185), Chambord Apartments (LM 106), Glazer-Keating House (LM 251),
  Old Flood Mansion – Pacific Union Club (LM 64), Grace Cathedral (LM 170), The
  Masonic and Stanford Court (own sites).
- **DROP 15.** The names with no surviving source: **Morsehead Apartments,
  De Martini John and David Building, Cathedral Apartments, The Park Lane,
  The Nob Hill, Marie Antoinette Apartments, The Saint Elizabeth, Salomon M.
  Building, San Francisco Korean Methodist Church, Low Apartments, Lambert
  Apartments, Brocklebank Apartments, Cathedral House.** The author may write
  "the building at 1001 California Street, built in 1914" — the year publishes.
  It may not name it.
- **DROP 16.** "1100 Sacramento St — The Park Lane, 1933" — the parcel at 1100
  Sacramento is CEQA **B**, reason "No evaluation and 45 years or older", not
  what the finder implies. Nothing here to write.
- **DROP 17 — Lambert Apartments as a district contributor.** The finder claims
  925 Jones is "a contributor to the Lower Nob Hill Apartment Hotel District,
  NRHP 91000957, so a designation sentence IS available for it." The parcel
  reason re-verified as "National Register Historic District, California
  Register Historic District" — it **names no district**. Jones Street is not in
  91000957's address range; it would have to qualify as an "intersecting cross
  street", which is an inference, not a record. A designation sentence built on
  an inferred district membership is exactly the wrong-number-that-looks-citable
  failure. No sentence.

---

## 5. STRADDLERS ESCALATED TO THE ARBITRATOR

I re-ran point-in-polygon using each landmark's **own geometry from the
Article 10 dataset**, not a hand-typed coordinate. Every one of the finder's
neighborhood assignments held. Its geometry work is sound and I could not break
it.

### 5a. Nob Hill ↔ Russian Hill — analysis says Nob Hill, SF Find says Russian Hill

| item | identifier | analysis | SF Find |
|---|---|---|---|
| Feusier Octagon House/Kenny Residence, 1067 Green St | LM 36 (1970); NRHP 74000554 | Nob Hill | Russian Hill |
| House of the Flag / Old Sheppard-Dakin House, 1652–1656 Taylor St | LM 46 (1972) | Nob Hill | Russian Hill |
| Atkinson-Escher House, 1032 Broadway St | LM 97 (1977); in NRHP 87002289 | Nob Hill | Russian Hill |
| Our Lady of Guadalupe Church, 906 Broadway St | LM 204 (1993) | Nob Hill | Russian Hill |
| Russian Hill–Vallejo Street Crest District | NRHP 87002289 | overlaps | Russian Hill |
| Russian Hill–Paris Block Architectural District | NRHP 87002288 | overlaps | Russian Hill |
| Ina Coolbrith Park, 1700 Taylor St | Rec & Park 145, 0.867 acres | Nob Hill | Russian Hill |

**My reading: all seven are Russian Hill's**, by name and by the tighter
polygon. I concur with the finder. Nob Hill must not take them.

**CORRECTION.** The finder listed **Engine Company Number 31 Firehouse, 1088
Green St (LM 220, 1998; NRHP 87002290)** among the straddlers. It is not one —
both layers return **Russian Hill**. It is Russian Hill's outright and needs no
arbitration.

### 5b. Nob Hill ↔ Chinatown — analysis says Chinatown, SF Find says Nob Hill

| item | identifier | analysis | SF Find |
|---|---|---|---|
| Donaldina Cameron House, 920 Sacramento St | LM 44 (1971) | Chinatown | Nob Hill |
| Clay Street Center, 965 Clay St (Chinese Historical Society of America) | LM 122 (1981) | Chinatown | Nob Hill |
| Chinatown Branch Carnegie Library, 1135 Powell St | LM 235 (2002) | Chinatown | Nob Hill |

**My reading: all three are Chinatown's**, by the analysis polygon and by
subject. I concur with the finder. Note `chsa.org` returned **403** to me, so I
could not re-verify the CHSA hours the finder quotes; Chinatown's author must
re-fetch them rather than inherit them.

### 5c. Nob Hill ↔ Lower Nob Hill / Tenderloin / Union Square — the big one

The analysis polygon swallows the whole of SF Find's `Lower Nob Hill`. **The
roster carries no Lower Nob Hill zone, no Tenderloin zone and no Polk Gulch
zone**, so several of these have no home among the twenty-three at all. That is
the arbitrator's problem, not the author's, but it must be stated.

1. **Dennis T. Sullivan Memorial Home, 870 Bush St — LM 42 (1971).** Analysis
   Nob Hill, SF Find Lower Nob Hill. The genuine coin-flip of the zone. Carries
   M. Earl Cummings' 1921 bronze plaque (Civic Art 1921.1, 88 × 41½ × 5½ in.,
   analysis neighborhood recorded as Nob Hill), re-verified. Cummings died 1936,
   so the plaque is photographable. **If Nob Hill keeps it**, use verbatim:
   > The Dennis T. Sullivan Memorial Home at 870 Bush Street is San Francisco
   > Landmark No. 42, designated in 1971. It is the Fire Chief's residence and
   > carries M. Earl Cummings' bronze plaque to Dennis T. Sullivan (1852–1906),
   > dated 1921, accession 1921.1 in the Civic Art Collection.
2. **Lower Nob Hill Apartment Hotel Historic District — NRHP 91000957.**
   Straddles Nob Hill, Lower Nob Hill and the Tenderloin. **No single zone owns
   it.** Nob Hill may cite it as a neighbour without claiming to contain it:
   > The Lower Nob Hill Apartment Hotel Historic District was listed on the
   > National Register of Historic Places on 31 July 1991, reference number
   > 91000957, with a period of significance from 1906 to 1940.
   The district's own SF Planning description — "a dense area primarily
   comprised of 3- to 7-story multi-unit residential buildings. Most of the
   structures were built between 1906 and 1925, leading to a stylistically
   consistent district" — re-verified verbatim and publishes as quoted fact.
   The **Addition** is `cr: Eligible`, `nr: No`. **No claim for the Addition.**
3. **HOMELESS — no rostered zone contains them.** Gaylord Hotel, 620 Jones St
   (**LM 159**, 1983) and Islam Temple / Alcazar Theater, 650 Geary Blvd
   (**LM 195**, 1989) are analysis **Tenderloin**, SF Find **Lower Nob Hill**.
   Both carry good landmark numbers and neither has a page to live on. Escalated
   explicitly so the arbitrator decides rather than letting them vanish.
4. **Bohemian Club, 624 Taylor St** — analysis **Tenderloin**, SF Find **Lower
   Nob Hill**. The finder said "analysis Nob Hill", which my re-run does not
   support. Either way it is not Nob Hill's.
5. **Union Square's on any reading**: San Francisco Playhouse, Un-Scripted
   Theater (533 Sutter), Gallery 444 (444 Post), Kensington Park Hotel (450–460
   Post), Chancellor Hotel (433 Powell). The roster has a Union Square zone; send
   them there.
6. The Olympic Club, Metropolitan Club, Francisca Club, Marines' Memorial, the
   Bush/Sutter/Post hotel row, Stookey's Club Moderne and the Sutter Street
   galleries: analysis Nob Hill, SF Find Lower Nob Hill. **My reading matches
   the finder's — everything south of Bush Street is not Nob Hill's**, and the
   page should be built on the SF Find polygon.

### 5d. Polk Gulch — also homeless

Old First Presbyterian Church, St Luke's Episcopal Church, Hi-Lo Club, Encore
Karaoke, Providence, St George and Kidanemheret Ethiopian Orthodox Church, and
the SFMTA Bush & Polk Garage with Bruce Hasson's 1993 "Trolleys". No Polk Gulch
zone exists. Escalated. **NRHP 100009644 must not be cited for St Luke's** —
re-fetched, address and city and certification date all null.

---

## 6. TIER

**Surviving places: 13.**

| # | place | kind | address |
|---|---|---|---|
| 1 | Grace Cathedral | historic-site | 1100 California Street |
| 2 | Cable Car Museum | museum | 1201 Mason Street |
| 3 | Flood Mansion / Pacific-Union Club | historic-site | 1000 California Street |
| 4 | The Fairmont San Francisco | hotel | 950 Mason Street |
| 5 | InterContinental Mark Hopkins | hotel | 999 California Street |
| 6 | Top of the Mark | restaurant | 999 California Street |
| 7 | Huntington Park | park | 1000 Taylor Street |
| 8 | Chambord Apartments | historic-site | 1298 Sacramento Street |
| 9 | Glazer-Keating House | historic-site | 1110 Taylor Street |
| 10 | The Masonic | theater | 1111 California Street |
| 11 | Nob Hill Cafe | restaurant | 1152 Taylor Street |
| 12 | Stanford Court | hotel | 905 California Street |
| 13 | California Street cable car line | attraction | California Street |

Every one of the thirteen sits inside **both** DataSF Nob Hill polygons, so
none depends on the straddle rulings above. Every one has an address from a
register or the operator's own site. Nine carry a verified designation number.

**Thirteen clears six. `tier: "guide"`** — and with room to spare. Even if the
arbitrator merges Top of the Mark into the Mark Hopkins and treats the cable
car line as Union Square's, eleven remain.

Excluded from the count, deliberately: the Brocklebank (name unsourced, CEQA B,
nothing to say beyond a year), the Huntington Hotel and The Big 4 (trading
status unestablished), the Cathedral School for Boys (an operating boys' school,
not visitor material — the 1956 date stays as a cathedral fact), and every
OSM-only shop, hotel and restaurant in the finder's §3 (see DROP 18).

**DROP 18.** Venticello, Ciccino, Wreck Room, The Hyde Out, Uncle Vito's
Pizzeria, Sushi Rapture, CityPop, Beanstalk Cafe, Inga Donut, altoVino, Le Beau
Market, Trader Joe's, Nob Hill Hardware, Pine-Taylor Market, Cottage Market
Liquors, VJ Grocery, Larkin Corner Market, Presidio Post, Nob Hill Inn,
Courtyard On Nob Hill, Executive Hotel Vintage Court, Cable Car Hotel, San
Francisco Suites. OSM tags only; not one was checked against an operator site.
The finder says so itself and is right to. An address from a crowd-sourced map
is not enough for an entry.

**DROP 19.** "The Great Stairs at Grace Cathedral" — Nominatim is the only
source and Nominatim is the layer the finder itself proved unreliable here
(`suburb: South of Market` for every Nob Hill point). Not corroborated, not
written.

**DROP 20.** The Brocklebank's *Vertigo* association. No source obtained, and
the finder correctly refused to assert it.

**PUBLISH 36.** The brick cisterns of the Auxiliary Water Supply System at
Taylor & Clay, Powell & Bush, Mason & California and Jones & Jackson are good
walk material and publish as street fabric. The AWSS district is `cr: Eligible`,
`nr: Eligible` — re-verified — so **no designation sentence**, exactly as the
finder ruled.

---

## 7. WHAT THE FINDER GOT WRONG

1. **It buried the Haring altarpiece.** Named in full on a page it fetched and
   quoted from; it declared the attribution unverified and told the author not
   to publish. §2. This is the error that cost the most.
2. **It missed four claims that must not publish**, all on sites it fetched:
   Top of the Mark's "Since 1939" / "For 86 years"; the Tonga Room's "A San
   Francisco institution since 1945"; Stanford Court's "Ranked Top 10 San
   Francisco Hotel" and Trip Advisor award; and the Fairmont's "best panoramic
   views in the City". It caught five superlatives and missed four more plus
   three trading-duration claims. Its rule was "check for rankings"; it needed
   to be "check for rankings, awards, durations and proximity".
3. **It missed three banned proximity phrasings**: Nob Hill Cafe's "only a
   block from Grace Cathedral" and "just down the street"; Stanford Court's
   "steps from", which is on the banned list verbatim.
4. **It attributed building names to a dataset that has no name column.**
   `3tsw-4idn` carries nine fields and none of them is a name. Twenty-odd names
   are cited to it. The years are all correct; the names have no source. §4.
5. **It built a designation sentence on an inferred district membership** for
   the Lambert Apartments. The parcel names no district. §4, DROP 17.
6. **It called Engine Company No. 31 a straddler.** Both layers say Russian
   Hill. §5a.
7. **It put the Bohemian Club in the analysis Nob Hill polygon.** My re-run
   returns Tenderloin. §5c.
8. **It missed a good measurement**: the cathedral's bearing and its sanctuary
   floor elevation, on the page it quoted four other passages from. §1,
   PUBLISH 5.

### What it got right, and it matters more than the list above

**All 27 designation identifiers survived re-fetching — 18 Article 10 numbers
and 9 NRHP references, every name, address, year and NHL flag.** Not one wrong
number. It also correctly refused three claims it could have made and would
have been wrong to: the Huntington Hotel's National Register status, NRHP
100009644 for St Luke's, and the Masonic's Wikipedia architect. Refusing a
citable-looking number is the hardest thing this job asks and it did it three
times.

Its geometry is sound: I re-ran point-in-polygon from the landmarks' own
dataset geometry and every assignment held. Its reading that Nob Hill should be
built on the **SF Find polygon** rather than the analysis polygon is correct and
the author should follow it.

Its catch on **`.superpowers/taken_slugs.py`** is real and should be escalated
beyond this zone: the script globs `priv/seed_data/rome/*.json` only, while its
docstring claims corpus coverage. I confirmed the corpus independently — **3,921
places across 333 files carrying places**, exactly the finder's number. No Nob
Hill candidate collides by slug or by name; the nearest matches (Collis P.
Huntington State Park in Redding, Huntington Homestead Museum in Scotland, both
Connecticut) are not San Francisco places. The Oracle Park seven are a code
seed in `lib/`, are all Mission Bay / Mission Rock, and touch nothing here.

---

## 8. COUNTS

- **PUBLISH: 36**
- **REWRITE: 15** (exact replacement wording given for each; the author uses it
  verbatim)

**All fifteen replacement wordings were run against the gate's own five pattern
sets** — `@method_patterns`, `@self_reference_patterns`, `@superlative_patterns`,
`@proximity_patterns` and the designation claim/citation pair, transcribed from
`test/ethos/seeds/san_francisco_seed_data_test.exs`. All fifteen pass.

**One caution on placement.** `prose/1` tests each field as a whole string, so a
designation claim and its identifier must stay in the **same field**. "It is a
National Historic Landmark." is a bare claim on its own and fails if split into
a separate `summary`/`history` field from its reference number. Keep each
rewrite block intact in one field.
- **DROP: 20**
- **Designation numbers surviving re-fetch: 27 of 27**
- **Surviving places: 13 → `tier: "guide"`**
- **Straddlers escalated: 4 groups** — Russian Hill (7 items), Chinatown (3),
  Lower Nob Hill / Tenderloin / Union Square (6 numbered blocks, including 2
  landmark numbers with no rostered home), Polk Gulch (1 block, also homeless)

Emit `"photos": []` everywhere. Not photographable when the wave comes: both
labyrinths, the Haring altarpiece, Dancing Sprites, Plaything of the Wind,
Active Memory, Trolleys, Resting Hermes. Clear: the Fountain of the Tortoises
(Taddeo, 1900) and the Sullivan plaque (Cummings, d. 1936). SF Planning's
landmark photographs at `sfplanninggis.org` state no licence and are not on the
allowlist.
