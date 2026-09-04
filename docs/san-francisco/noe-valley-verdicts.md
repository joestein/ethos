# Noe Valley — verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/noe-valley-finder.md`.
I re-fetched eleven sources, not the five required, and every designation identifier
the finder claimed. I reproduced the finder's point-in-polygon work from scratch
rather than accepting it. Rulings below are binding on the author.

**Counts: 11 PUBLISH · 15 REWRITE · 35 DROP · 4 ESCALATED.**
**Tier: GUIDE, on 21 surviving places (23 if both straddlers land here).**
**Designation identifiers: 4 claimed, 4 survived. Plus 1 the finder missed.**

This is the most accurate finder file I have adjudicated. Every number in §5 —
including all eight vertex ratios — reproduced exactly. Its three self-flagged
weak points were all correctly self-flagged. It is wrong in four places, listed
in §9, and one of those is a count.

---

## 1. What I re-fetched, and what it said

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks (370 rows) | **4/4 numbers confirmed.** Names, addresses, years exact |
| `j2bu-swwd` Noe Valley polygon | **Single ring, 182 vertices**, bbox −122.447399…−122.421328 / 37.741534…37.756631 — exact |
| `knm6-5ej6` Landmark Districts (20 rows) | **Zero districts touch Noe Valley.** Liberty Hill = App. F, 1985-10-25 confirmed |
| `gtr9-ntp6` Rec & Park (255 rows) | **8 properties, all vertex counts exact.** Clipper Terrace = Public Works confirmed |
| NPS `nrhp_locations` layer 0 | **8 features in envelope, 0 inside Noe Valley.** All 8 refnums confirmed |
| `m22e-6hkz` survey districts (175 rows) | **SEVEN Noe Valley rows, not six.** All `cr`=Eligible, `a10`=No, `nr`=No |
| `LM259.pdf` (34,558 chars extracted) | File No. 080189, Block 6539/Lot 034, John Reid Jr. — all confirmed verbatim |
| `LM292.pdf` (118,749 chars extracted) | Ordinance No. 74-21, File No. 210286, Res. 507-20 — all confirmed verbatim |
| `LM133.pdf` / `LM186.pdf` | **129 chars and 4 chars.** Both unreadable, exactly as the finder warned |
| `r7bn-7v9c` Civic Art (1,038 rows) | **11 Noe Valley rows.** Every accession and every dimension exact |
| `3mea-di5p` EAS, 20 probes | Every zone assignment confirmed. 1268 Sanchez really has no parcel |
| `sfpl.org/locations/noe-valley` | Hours confirmed **including the unusual Mon 11–6**. Phone 415-355-5707 |
| Eight operator sites | See §6. Five confirmed verbatim; three failed |

### Every identifier, re-verified

| Property | Identifier | Verified value |
|---|---|---|
| Axford House | SF Landmark **133** | 1190 Noe Street, `yeardesignated` 1981 |
| David Lewis House | SF Landmark **186** | 4143 23rd Street, `yeardesignated` 1988 |
| Carnegie Noe Valley/Sally Brunn Branch Library | SF Landmark **259** | 451-455 Jersey Street, `yeardesignated` 2008 |
| — same, ordinance | BoS **File No. 080189** | Passed on first reading 26 February 2008, Ayes 9 |
| Lyon Martin House | SF Landmark **292** | 651 Duncan Street, `yeardesignated` **2021** |
| — same, ordinance | **Ordinance No. 74-21**, File No. 210286 | Confirmed verbatim in the PDF |

**The finder never gave a designation year for Landmark No. 292.** The register
gives 2021, consistent with Ordinance 74-21. Ship **"designated in 2021."**

### The identifier the finder missed

`m22e-6hkz` objectid 57 gives the Liberty Hill Historic District an **ordinance
number: `Ord. 484-85`**, alongside `dateadop` 1985-10-25 and `a10` = Listed. The
finder had only the date. If the arbitrator reopens the Mission page for Liberty
Hill, this is the citation to use.

---

## 2. Two dataset errors — one the finder caught, one it did not

**Caught, and correctly.** `97yj-54sx` carries `apn` = `"0857001A"` for Landmark
No. 259. The ordinance says **Assessor's Block 6539, Lot 034**, and EAS returns
`parcel_number` **6539034** for 451 Jersey Street. The dataset is wrong. Do not
reproduce its APN.

**Missed.** `97yj-54sx` carries `apn` = `"6.60404e+006"` for Landmark No. 292 —
a float-mangled field that decodes to 6604040. The ordinance and EAS both say
**6604036**. Same class of defect, same row set. Do not reproduce it either.

Neither APN belongs in reader-facing prose regardless. Recorded so the corpus has it.

---

## 3. PUBLISH — 11

Ships as a place, wording as found.

**Carnegie Noe Valley / Sally Brunn Branch Library** — 451 Jersey Street, 94114.
Designation sentence, verbatim:
> San Francisco Landmark No. 259, designated in 2008 under Article 10 of the Planning Code, by an ordinance carried as Board of Supervisors File No. 080189.

Publishable supporting facts, all from the ordinance or sfpl.org: architect
**John Reid, Jr.**, named in the designation findings as "Association with the
work of a master architect"; period of significance begins **1915**; Assessor's
Block 6539, Lot 034; the ordinance passed on first reading on **26 February 2008**;
the designation names three interior features — the ornamental ceiling of the Main
Reading Room, the glazed and panelled partition between the Main Reading Room and
the Children's Room, and a deck and garden at the rear. Hours: **Sunday 1–5,
Monday 11–6, Tuesday 10–8, Wednesday 12–8, Thursday 10–6, Friday 1–6, Saturday
10–6.** Telephone **415-355-5707**.

**Do not write the ordinance number.** It OCRs as "3D -DZ" and is not legible.
The file number is the citation.
**Do not write a National Register claim.** The ordinance says the board found the
building *eligible* under Criteria A and C. Eligible is not listed. The finder is
right and the NPS query confirms it: zero listed properties inside the zone.

**Lyon-Martin House** — 651 Duncan Street, 94131. Designation sentence, verbatim:
> San Francisco Landmark No. 292, designated in 2021 by Ordinance No. 74-21, Board of Supervisors File No. 210286.

Publishable, every one confirmed verbatim against the ordinance and Fact Sheet:
designation initiated by Board **Resolution No. 507-20**, adopted 20 October 2020
and approved by the Mayor on 30 October 2020, which identified the property as
649-651 Duncan Street, Assessor's Block 6604, Lot Nos. 036 and 037; recommended
by Historic Preservation Commission **Resolution No. 1170**; Fact Sheet dated
**17 February 2021**; Planning Department Record Docket No. **2020-011305DES**.
Lot 036 is **2,848 square feet**; zoning RH-1. The first building on the parcel
was constructed in **1907-1908**, on a permit issued to owner Charles L. Duning
for a "one-story cottage" costing **$300**, measuring **20 feet by 20 feet**, clad
with rustic siding; the present footprint "appears to have been constructed
sometime between 1914 and 1938". The Fact Sheet states **Architect: Unknown** and
**Year Built: Unknown**. Period of significance **1955 to 2020**.

Biography, all confirmed verbatim, all sequence and date rather than rank:
the Daughters of Bilitis was founded in San Francisco in **1955 by four couples**,
among them Phyllis Lyon and Del Martin; Martin was elected the organisation's
first president in 1955, served as national president **1957–1960** and edited
*The Ladder* **1960–1962**; Lyon was first secretary in 1955 and edited *The
Ladder* **1956–1960**; *The Ladder* began publication in **1956**; Lyon and Martin
met in Seattle, Washington in **1950**, both working for building-trades
publications. The 1957 Polk's Directory lists both at 651 Duncan Street.

See §5 for the two phrases in this document that do not publish.

**Noe Valley Town Square** — 3861 24th Street. Rec & Park mini park, **0.27605287
acres / 12,024.91 square feet**, property_id 957227. 14 of 14 boundary vertices
inside the zone.

**Douglass Playground** — 1098 Douglass Street. Rec & Park neighborhood park or
playground, **7.88730383 acres / 343,572.33 square feet**, property_id 8. 420/420.

**Upper Noe Recreation Center** — 295 Day Street. **2.91807067 acres / 127,111.67
square feet**, property_id 22. 193/193. Building `yearbuilt` 1957, APN 6638007.

**Noe Valley Courts** — 780 Douglass Street. **1.10423261 acres / 48,100.56 square
feet**, property_id 72. 32/32.

**Duncan & Castro Open Space** — 592 Duncan Street. **0.65081602 acres / 28,349.66
square feet**, property_id 178. 23/23.

**29th & Diamond Open Space** — 1701 Diamond Street. **0.93141186 acres / 40,572.46
square feet**, property_id 194. 104/104.

**Clipper Terrace Community Garden** — 855 Clipper Terrace. Community garden,
**0.46778950 acres / 20,376.99 square feet**, property_id 135193. 227/227.
**Owned by San Francisco Public Works, not Recreation & Park** — confirmed, and
the only one of the eight so recorded. Say so; do not call it a Rec & Park property.

**Lovejoy's Tea Room** — 1351 Church Street, 94114. Confirmed verbatim from the
site: **"Open Thursday ~ Sunday; 11~5pm (our last seating 3pm)"**; reservations by
phone **(415) 648-5895** or online; walk-ups welcome; outdoor dining available.
Its own description: mismatched china and furniture, handmade tea **cozies**
(the site's spelling; the finder wrote "cosies"), broken china mosaics.

**Firefly** — 4288 24th Street, 94114. Confirmed verbatim: **"Hours Tuesday -
Saturday 5:30 to 8:30pm"**, and the site places itself at "4288 24th Street in
Noe Valley". Reservations online or by phone after 3 pm Tuesday–Saturday. The
site states no cuisine; say none.

---

## 4. REWRITE — 15

### 4.1 Axford House — 1190 Noe Street, 94114

**Ships. The designation publishes; nothing else in the finder's entry does.**
Replacement wording, entire:
> San Francisco Landmark No. 133, designated in 1981 under Article 10 of the Planning Code. It is a private house at the corner of Noe and 25th Streets.

DROP the 1877 build date, the Stick style, the carriage house, the iron fence, the
hay lift, William Axford and the Mission Iron Works. All rest on noehill.com, a
secondary. **`LM133.pdf` extracts 129 characters and every one of them is
bibliography** — I confirmed this myself. There is no primary to check them
against and the assessor gives 1900. The finder was right to flag it and right
not to trust it.

### 4.2 David Lewis House — 4143 23rd Street, 94114

**The finder's hold is lifted. There is no date conflict.** A Final Case Report
dated 2 September 1987 is a case report; the Board designates afterwards. The
register says 1988. Those are consistent, not contradictory.
Replacement wording, entire:
> San Francisco Landmark No. 186, designated in 1988 under Article 10 of the Planning Code. It is a private house on 23rd Street between Castro and Diamond.

DROP the 1892 build date, Queen Anne, David Lewis the cabinetmaker, the stair-
building firm and the retained custom cabinetry. **`LM186.pdf` extracts four
characters.** Same reasoning as Axford.

### 4.3 The three artworks fold into the sites that hold them

They are not separate places. Each is street furniture on a park the guide already
ships, exactly as MaestraPeace is a fact inside the Women's Building on the
shipped Mission page. Fold, with these words:

Into **Noe Valley Town Square**:
> Two bronze pieces by Wowhaus stand in the square, catalogued by the San Francisco Arts Commission as "Garden Guardians", accession 2017.2.a-b. One measures 36 by 24 by 16 inches, the other 28 by 18 by 12 inches.

Into **Upper Noe Recreation Center**:
> Six steel and glass pieces by Troy Corliss, catalogued as "Noe Valley Natives", accession 2008.13.1-6, stand at the park and playground entrances. Two are at the 30th Street entrance, two at the Day Street west entrance, one at the Day Street east entrance and one at the playground entrance. The largest measures 108 by 51 by 51 inches and the smallest 15 by 7 by 6 inches.

Into **Douglass Playground**:
> A mosaic by Lois Anderson dated 1988, accession 1988.3, is fixed to the exterior of the fieldhouse at Douglass and 26th Streets. It measures 36½ by 32 by 2½ inches and is made of tiles, glass, metal, buttons and jewelry on fibre-glassed plywood.

All three accession numbers, all dimensions and all media confirmed against
`r7bn-7v9c`. **Say nothing about photographs or why there are none.**

### 4.4 StreetSmArts mural — 4049 24th Street

Folds into the 24th Street entry. The dataset records no title.
> A StreetSmArts mural by Shawn Bullen, dated 2014/15 in the city's record, is painted at 4049 24th Street.

### 4.5 Noe Valley Church & Ministry — 1021 Sanchez Street, 94114

**The name is wrong.** The site's own title and navigation read **"Noe Valley
Church & Ministry"**. Use that, not "Noe Valley Ministry / Noe Valley Church".

Publishable, confirmed verbatim: the Sanctuary and Labyrinth Hall together are
**2,941 square feet**, with "a stained glass window and elevated stage with a
Steinway D concert grand"; maximum capacity 200 with auditorium seating, 80 at
banquet tables; **the sanctuary seats 110**, Labyrinth Hall holds 40. A conference
room of 156 square feet, a meditation room of 106 square feet, a library/mezzanine
of 298 square feet opening to the sanctuary, and a kitchen that is not commercial-
grade. Telephone (415) 282-2317. APN 3652033.

DROP **1888**. The site states no denomination, no founding year, no architect and
no construction date, and I confirmed the history pages do not exist. DROP the
assessor's 1880 as a build date in prose — it is an unevaluated parcel field
against a subject whose own institution publishes nothing. No designation claim
exists: the building is not in `97yj-54sx`.

### 4.6 Noe Music folds into the church

Not a place; a concert series at someone else's address, and its own /about page
does not carry the Sanchez Street address.
> Noe Music presents concerts in the building; telephone (415) 648-5236.

DROP "world-class" and "internationally acclaimed".

### 4.7 St Paul's Catholic Church — 221 Valley Street, 94131

Ships thin. EAS confirmed, APN 6619031, `ceqacode` A on a Historic Survey Result.
**Not an Article 10 landmark — make no designation claim.** The parish domain
redirects to the school's site, so no hours and no service times. DROP the 1992
feature film entirely; the finder did not assert it and neither may the author.

### 4.8 St Paul's School — 1690 Church Street, 94131

Ships. The school places itself "in San Francisco's Noe Valley neighborhood" in
its own words, which settles its zone. Publishable: nine regular classrooms, one
per grade K–8, plus art, science, extended care, a technology/library centre and
a gym/parish centre; **most classes average fewer than 20 students**.

**DROP: "In 2023, St. Paul's School was awarded the highest accreditation — six
years — by WASC."** The finder did not flag this. It is an award and a superlative
in one sentence, sourced to the institution itself. It fails twice.

### 4.9 St Philip the Apostle — 725 Diamond Street, 94114

Ships thin. APN 2831022. **`ceqacode` A here reads "California Register Historic
District", which means it contributes to an *eligible* district. That is not a
designation. Make no protection claim.** No site reached, so no hours.

### 4.10 Twenty-fourth Street

Ships as the commercial spine. The hard identifier is the Planning Code zoning
district, named **"24TH STREET- NOE VALLEY NEIGHBORHOOD COMMERCIAL"** (NCD) in
`acdm-wktn`.

**DROP the "204 parcels" tally.** A count of rows in a live zoning dataset is the
same defect as counting landmarks: it changes when the dataset changes and it is
a claim about the data rather than about the street. Name the district; do not
size it.
**DROP any suggestion that the 24th Street Commercial Corridor Historic District
is a designation.** See §7.

### 4.11 Noe Valley Bakery — 4073 24th Street, 94114

Ships. Publishable: the address; that it sells cakes, cupcakes, cookies, breakfast
pastries, bread, desserts, pies and lunch items; that a second location is at 28 W
Portal Avenue, outside the zone. Building APN 6507020.

**DROP "Since 1995"** — trading duration from the operator, confirmed present on
the page.
**DROP the San Francisco Legacy Business claim.** The finder could not verify it;
neither could I. It is a real register with numbered applications, so an
unverifiable version of it is worse than none.
**DROP "THE BEST almond croissant … in SF"** — it sits on the homepage as a
customer testimonial. A superlative is a superlative whoever is quoted saying it.
**Ship no hours.** The finder's weekday 07:00–19:00 / weekend 07:00–18:00 did not
appear on the page I fetched. Hours that cannot be re-confirmed do not ship.

### 4.12 Omnivore Books on Food — 3885A Cesar Chavez Street, 94131

Ships. Publishable and confirmed verbatim: **"Located in an old butcher shop in
Noe Valley"** — the shop places itself in the zone, which settles it; new and
vintage books on food and drink, plus vintage menus, risographs, aprons and
kitchen moulds; **"We are open daily."** APN 6578030.

**DROP "the Bay Area's only culinary bookshop"** — present on the page, and the
finder slightly misquoted it as "only dedicated culinary bookshop". Either way it
is a superlative and it does not publish.
**DROP "Est. 2008"** and any founding-year phrasing — trading duration.
**DROP "founded by Celia Sack, a former rare-book specialist."** Not on the page
I fetched.
**Ship "open daily", not the specific hours**, which I could not re-confirm.

### 4.13 Drewes Bros. Meats — 1706 Church Street, 94131

Ships. Confirmed verbatim: **"Hours M - F 9:30 - 7:30 Sat 9:00 - 6:30 Sun 10:00 -
6:00"**, telephone 415.821.0515, "a full service butcher shop" at 1706 Church St.

**DROP "Providing quality, all natural, free-range meats for over 100 years"** —
trading duration, and it is the site's banner line, so the author will meet it first.
**DROP "specializes in only the highest quality products"** — superlative.
**Flag to the arbitrator:** the rest of that page is dated — it carries a "Holiday
Hours 2011" block. The weekly hours line is live text and I am allowing it, but if
the arbitrator wants a stricter rule on stale operator pages, this is the candidate.

---

## 5. Two phrases in the Lyon-Martin ordinance that do not publish

The finder asked me to rule on the first. Both are in the primary document and
both are still barred.

**"the first lesbian-rights organization in the United States"** — DROP.
It is the ordinance's own finding, and it is still a claim of primacy over a
national scope, which is structurally identical to "the oldest X in the city".
The rule says **from any source, attributed or not**. Replace it with the
sequence and dates, which are stronger and entirely safe:
> The Daughters of Bilitis was founded in San Francisco in 1955 by four couples, among them Phyllis Lyon and Del Martin, who lived at 651 Duncan Street.

**"internationally known"** — DROP. Reputation without an identifier. The
biography in §3 carries the same weight with dates instead.

---

## 6. The operator sites, one by one

| Site | Result |
|---|---|
| `lovejoystearoom.com` | Hours, phone and description **confirmed verbatim** |
| `fireflysf.com` | Hours and self-placement in Noe Valley **confirmed verbatim** |
| `drewesbros.com` | Hours **confirmed verbatim**; page otherwise dated to 2011 |
| `noevalleyministry.org` | All room measurements and capacities **confirmed verbatim**; name is "Noe Valley Church & Ministry" |
| `sfpl.org/locations/noe-valley` | Address, phone, email and all seven days' hours **confirmed** |
| `laciccia.com` | Hours **confirmed** (5:30–9:45 Tue–Thu, 5:30–10:00 Fri–Sat); "Sardinian" **not found** on the page I reached |
| `noevalleybakery.com` | "Since 1995" present; **no Legacy Business claim and no hours found** |
| `omnivorebooks` | "Est. 2008" and the "only culinary bookshop" line both present; **specific hours not found** |
| `stpaulschoolsf.org` | Carries an **unflagged award superlative**; see §4.8 |
| `noemusic.org/about` | Reached; **does not carry the 1021 Sanchez address** |
| `noevalleytownsquare.com` | Reached; **does not carry the Rec & Park coordination line or the 4104 24th Street address** the finder cited |
| `charliescorner.com` | HTTP 200, **zero bytes of text**. Dead. DROP, as the finder said |
| `foliosf.com` | **Now redirects off-domain to `gairloch-fishing.co.uk`, serving gambling spam.** Worse than the 403 the finder got. DROP and do not link |

Where a fact could not be re-confirmed I have said so above and ruled it out.
That is not a research note for the reader; it is an instruction to the author.
None of it goes in the prose.

---

## 7. DROP — the six eligible districts, and the finder's own count of them

**The finder's reading is upheld in full.** `cr` = Eligible names the California
Register but supplies no listing number and no certification date. Under "a claim
must name its register and carry an identifier", these do not publish as
designation claims. **No page in this zone may say "the Jersey Street Historic
District" as though it were a protection.** They are build-date and builder
sources and nothing else.

They are also not places. DROP all six as candidates: 24th Street Commercial
Corridor, Diamond & Elizabeth Streets, Noe & Alvarado Streets, Clipper Street,
27th Street, Jersey Street.

**But the finder counted them, and the count is wrong.** §4(c) says "`m22e-6hkz`
returns six districts whose `neighborhood` field reads Noe Valley". It returns
**seven**. The seventh is **North Point Historic District** (`origin` 2013.0788E,
`pos_1` 1905, architect John A. Porporato, `neighborhood` = Noe Valley), which is
almost certainly a mislabelled row — North Point is nowhere near Noe Valley — and
that is exactly the point. This is the second time in two waves that a tally of a
live preservation dataset has come out wrong. The ban on counting exists for this
and it applies to eligible districts as much as to landmarks. Name them or do not.

Builder names that survive as sources: **Fernando Nelson** and **John Anderson**
(Noe & Alvarado), **Bernhard Schapiro** (Clipper Street), **Charles Monson,
builder** (27th Street). All confirmed in the `arch` field.

---

## 8. ESCALATED — 4

**Portola Open Space.** `gtr9-ntp6` property_id 37264 carries
`analysis_neighborhood` = **"Noe Valley, Twin Peaks"** — I confirmed the field
holds both names — and my own point-in-polygon returns **157 of 226 vertices
inside Noe Valley**, matching the finder exactly. 0.81201880 acres / 35,371.68
square feet, no street address. **Twin Peaks was declined from the roster**, so
there is no rival page. The arbitrator should decide whether a 70/30 parcel with
no address is worth a place at all.

**La Ciccia, 291 30th Street, 94131.** EAS returns **Glen Park** for parcel
6656049. Nominatim returns Noe Valley. Both confirmed. **Glen Park is not one of
the zones and is not even among the roster's declined candidates**, so if this
does not land in Noe Valley it lands nowhere. Hours confirmed: Tue–Thu 5:30–9:45
pm, Fri–Sat 5:30–10:00 pm. The "Sardinian" descriptor was not on the page I
reached and must be re-sourced before it ships. Note the address is ambiguous
citywide — EAS also returns a 291 30th **Avenue** in Seacliff, 94121.

**Billy Goat Hill.** **Dropped from Noe Valley and escalated because the roster
handed it over by name.** Rec & Park `gtr9-ntp6` property_id 5, 294 Beacon Street,
3.6688939 acres, `analysis_neighborhood` = Glen Park; zero of 224 vertices inside
the Noe Valley polygon; Nominatim says Glen Park. Three locators, no disagreement.
**The roster's own draw for `noe-valley` names it and the roster is wrong.** It
ships nowhere in this wave. Same ruling for Walter Haas Playground, Topaz Open
Space, George Christopher Playground and Glen Canyon Park, none of which were
claimed.

**Liberty Hill.** Also named in the roster draw, also not in Noe Valley. Article 10
**Appendix F**, adopted **1985-10-25**, **`Ord. 484-85`**, `neighborhood` = Mission,
`a10` = Listed. The National Register carries the **Liberty Street Historic
District**, refnum **83001230**, certified **09/15/1983**, "Roughly 15-188 Liberty
St." — I re-fetched the refnum and the date and both are exact. EAS puts 15 and
188 Liberty Street in the Mission. `mission.json` ships 69 places and owns neither;
I read the file and confirmed it. **Unowned, and not Noe Valley's.** The
arbitrator decides whether the Mission page reopens.

**Correction to the finder on this one.** It says the Liberty Street district has
"51 contributing buildings". `m22e-6hkz` objectid 160 says `total_prop` **51**,
`contributors` **37**, `non_contrib` **14**. Fifty-one is the total, not the
contributing count. If this ships anywhere, ship 37.

---

## 9. What the finder got wrong

Four things, and one of them is a count.

1. **It counted the eligible districts and got six. There are seven** (§7). The
   corpus banned tallies of designations for exactly this failure mode, and the
   finder — which correctly refused to count the four landmarks in its own prose,
   and said so — went and counted the districts in the same file.
2. **"51 contributing buildings" for the Liberty Street Historic District** is the
   total property count. The contributing count is 37 (§8).
3. **It held the David Lewis House designation year unnecessarily** (§4.2). A 1987
   case report and a 1988 designation are the normal sequence, not a conflict. The
   register says 1988 and that is the answer.
4. **It missed the second mangled APN** in the same dataset row-set it caught the
   first one in (§2), and it missed the award superlative on the St Paul's School
   page it did fetch (§4.8).

Set against that: it reproduced the polygon, the eight park geometries, eleven
civic-art accessions, twenty EAS parcels and two full ordinances without a single
numeric error, it caught a genuine DataSF APN defect, it caught the zero-landmark-
number trap, it refused three trading-duration claims and two superlatives before
I saw them, and it correctly declined to resolve four straddlers. The tooling
defect it reports is real: **`.superpowers/taken_slugs.py` globs
`priv/seed_data/rome/*.json` only** — I read the file — and
`vf_taken_all.py` really does return 4,389 places across 349 files. Fix
`taken_slugs.py` before the next zone runs; this is the second wave it has
misled.

---

## 10. Reservation

No surviving candidate collides with anything owned. I ran the corpus-wide scan
and I also read `mission.json` and `castro.json` end to end rather than trusting
a substring search.

- `noe-beaver-mini-park-castro` (1 Beaver Street) and `castro-farmers-market`
  (270 Noe Street) are Castro's, correctly, and neither is claimed here.
- `nobby-clarke-mansion-castro` is at **250 Douglass Street**; Douglass Playground
  (1098) and Noe Valley Courts (780) are different properties. No conflict.
- `24th-and-york-mini-park-mission-district` and
  `casa-sanchez-building-mission-district` are the Mission's 24th Street and
  Sanchez, not ours.
- Nothing in this file touches the seven Oracle Park slugs.

---

## 11. Tier

**GUIDE, on 21 surviving places.** A town-page is under six places with a 90-word
intro floor and two links; twenty-one is not close to that line, so the floor
never binds. Twenty-three if the arbitrator lands both Portola Open Space and
La Ciccia here.

The surviving twenty-one: Axford House · David Lewis House · Sally Brunn Branch
Library · Lyon-Martin House · Noe Valley Town Square · Douglass Playground ·
Upper Noe Recreation Center · Noe Valley Courts · Duncan & Castro Open Space ·
29th & Diamond Open Space · Clipper Terrace Community Garden · Noe Valley Church
& Ministry · St Paul's Catholic Church · St Paul's School · St Philip the Apostle
· Twenty-fourth Street · Noe Valley Bakery · Omnivore Books on Food · Lovejoy's
Tea Room · Firefly · Drewes Bros. Meats.

Four are designated and cite their numbers. Seven are parks with measurements.
Ten are institutions and shops carrying hours, addresses or capacities. Two links
minimum: **the Castro** (Noe Street runs between them and Castro owns the Noe
Street market) and **the Mission** (Dolores Street is the shared edge, and the
Liberty Hill question sits on it).

**Emit `"photos": []` everywhere.**
