# Haight-Ashbury — verdicts

Adjudicated 2026-09-03 against `docs/san-francisco/haight-ashbury-finder.md`.
I re-fetched eight sources, not the five required, and every designation
identifier the finder claimed. Rulings below are binding on the author.

**Counts: 34 PUBLISH · 13 REWRITE · 27 DROP · 9 ESCALATED.**
**Tier: TOWN-PAGE, on 34 surviving places (43 if every straddler lands here).**
**Designation identifiers: 14 claimed, 14 survived. Plus 1 the finder missed.**

---

## 1. What I re-fetched, and what it said

| Source | Result |
|---|---|
| `97yj-54sx` Article 10 landmarks | **7/7 numbers confirmed**, names/addresses/years exact |
| NPS NRHP ArcGIS layer 0 | **6/6 reference numbers confirmed**, all `STATUS: Listed` |
| `knm6-5ej6` Landmark Districts | Duboce Park, **Appendix N, 2013-07-13** confirmed. No Haight-Ashbury district |
| `gtr9-ntp6` Rec & Park | 4 parks in the zone, acreages exact |
| `kvj8-g7jh` business register | Amoeba **1997-11-15 at 1855 Haight St** confirmed |
| `rzic-39gi` Landmarks | Society for Individual Rights: no `landmarkno`, status "Work Program" |
| `magnoliabrewing.com` | hours confirmed verbatim; so were the claims I am dropping |
| `stanyanpark.com` | address confirmed; **four** award/rating claims, not one |
| `haightandashbury.org` | RFP dates confirmed; **the visitor-access claim is not there** |
| `p5b7-5n3h` | returns `[{},{},{},{},{}]` — the finder's stub call is correct |

The finder's two corrections to the brief both hold. `.superpowers/taken_slugs.py`
really does glob `priv/seed_data/rome/*.json` only, so it is blind to every other
region; and `p5b7-5n3h` really is an empty stub. Both should be fixed before the
next zone runs. No candidate collides with a committed slug.

### Every identifier, re-verified

| Property | Identifier | Verified value |
|---|---|---|
| Abner Phelps House | SF Landmark **32** | 1111 Oak Street, designated 1970 |
| Abner Phelps House | NRHP **71000187** | "Phelps, Abner, House", Listed, 05/23/79 |
| Old Mish House | SF Landmark **62** | 1153 Oak Street, designated 1974 |
| Mish House | NRHP **79000534** | Listed, 05/21/79 |
| Charles L. Hinkel House and Carriage House | SF Landmark **190** | 280 Divisadero Street, 1988 |
| Doolan/Larson Residence and Storefronts | SF Landmark **253** | 557 Ashbury Street, 2006 |
| Doolan, Richard P., Residence and Storefronts | NRHP **09001201** | Listed, 05/11/11 |
| American Indian Historical Society/Chautauqua House | SF Landmark **324** | 1451 Masonic Avenue, 2026 |
| Firehouse : Hose Company #30 | SF Landmark **328** | 1757 Waller Street, 2026 |
| Maud's | SF Landmark **331** | **929-941 Cole Street**, 2026 |
| Park View Hotel | NRHP **83001235** | 750 Stanyan St., Listed, 08/11/83 |
| Spencer, John, House | NRHP **05000273** | 1080 Haight St., Listed, 04/14/05 |
| Whelan, John A., House | NRHP **100005794** | 1315 Waller St., Listed, 11/20/20 |
| Duboce Park Landmark District | Article 10 **Appendix N** | Listed 2013-07-13 |

**Maud's address discrepancy is RESOLVED in the finder's favour.** The
authoritative dataset gives `929-941 Cole Street`, matching the ordinance body.
Write 929–941. Ignore the Fact Sheet heading.

---

## 2. PUBLISH — 34

### 2.1 Designated, in zone under both definitions — 5

**Doolan-Larson Building** — 557 Ashbury Street / 1500–1512 Haight Street.
Designation sentence, verbatim:
> San Francisco Landmark No. 253, designated in 2006, and listed on the National Register of Historic Places in 2011 under reference number 09001201.

Publishable supporting facts: built 1903, Colonial Revival; Charles J. U. Koenig
and Frank T. Doolan; raised in 1907 to put retail underneath, the storefront row
to the west added at the same time; Holcombe Jewelers held the corner space
1937–1988; 1510 Haight Street housed the boutique Mnasidika between 1965 and
1968; Norm Larson gave the property to San Francisco Heritage in 2017. Kind
`historic-site`.

**Firehouse: Hose Company #30** — 1757 Waller Street.
> San Francisco Landmark No. 328, designated in 2026 under Article 10 of the Planning Code.

Built 1895, Italianate, granite and wood. Operated as a firehouse until 1959.
Chemical Company Number 5 moved in in 1918; Truck Company Number 12 was resident
1912–1956. The City sold the building at public auction in 1956. First-storey
molded panels are lettered "Chemical 5", "S.F.F.D." and "Truck 12" — use this,
it is the one concrete visual detail in the entry. Kind `historic-site`.

**American Indian Historical Society / Chautauqua House** — 1451 Masonic Avenue.
> San Francisco Landmark No. 324, designated in 2026 under Article 10 of the Planning Code.

The Society was founded in 1964 by Rupert Costo (Cahuilla), Jeannette
Henry-Costo (Eastern Cherokee) and thirteen other California American Indians;
moved here in 1967 and named the building Chautauqua House; held gallery space
for American Indian artists and published the quarterly *The Indian Historian*;
ceased operations in 1986. Richard Oakes (Mohawk) led an educational committee
that met here. Kind `historic-site`. Zoned residential — write it for the pavement.

**Stanyan Park Hotel** — 750 Stanyan Street. Kind `hotel`. See REWRITE 3.3.

**John A. Whelan House** — 1315 Waller Street. Kind `historic-site`. See REWRITE 3.10.

### 2.2 Undesignated anchors — 4

**Amoeba Music** — 1855 Haight Street, kind `shop`. Opened 15 November 1997 in a
former bowling alley of 24,000 square feet. Two independent sources agree and I
confirmed the register row. This date publishes.

**Buena Vista Park** — 1293 Haight Street, kind `park`. 38.35 acres. Established
in 1867 as Hill Park and later renamed. The hill peaks at 575 feet. Bounded by
Haight Street to the north and by Buena Vista Avenue West and Buena Vista Avenue
East.

**Mount Olympus** — 480 Upper Terrace, kind `attraction`. A Recreation and Park
mini park of 0.21 acres. Adolph Sutro gave the *Triumph of Light* statue; the
statue is gone and its pedestal remains; trees and buildings obstruct the view.
**I rule this IN.** The roster's own draw for this zone names "the Victorians of
Ashbury Heights", so the roster intends Ashbury Heights in scope, and DataSF puts
Mount Olympus in Haight Ashbury. Wikipedia's "Buena Vista neighborhood" loses.

**Haight Ashbury Free Clinic** — kind `historic-site`, status `closed`. See REWRITE 3.5.

### 2.3 The Haight Street strip — 25

All 25 rows in the finder's table publish **as name, address and kind only**. I
spot-checked five addresses against the register and all five matched. Binding
constraints:

- `location_start_date` is a registration date. **It must not be written, in any
  form, as a founding date or a trading duration.** No "since", no "for over",
  no "has traded here since".
- The register rows I retrieved carry **no closure-date field**, so the register
  cannot prove current trading. Do not assert hours or open/closed status for any
  of the 25 **except Magnolia Brewing**, whose own live site gives hours.
- **Magnolia Brewing** takes kind `brewery`, which the finder did not assign and
  the schema does allow. Hours publish: 12pm–12am Sunday to Thursday, 12pm–1am
  Friday and Saturday, kitchen until 10pm.
- **Zam Zam**, not "Aub Zam Zam" — the register `dba_name` is "Zam Zam".

---

## 3. REWRITE — 13. Use this wording verbatim.

**3.1 Doolan-Larson visitor access.** The finder wrote "As of the organisation's
own site the building is not open to visitors." The site says no such thing —
it makes no statement about visitor access at all. Replace with:
> No source states visiting arrangements for the building, so none are given here.

**3.2 Doolan-Larson, San Francisco Heritage's own description.** Do not write "a
landmark of the counterculture"; I could not find that phrase on the site. Do not
write "a National Historic Treasure" either — it is a National Trust programme
label, not a statutory register, and printing it beside two real identifiers
would read as a third. The RFP status publishes as:
> San Francisco Heritage issued a request for proposals for the building on 6 February 2026 and received three final proposals on 12 June 2026.

**3.3 Stanyan Park Hotel designation.** The operator's site does not call the
building the Park View Hotel; the National Register does. Write:
> Listed on the National Register of Historic Places in 1983 under reference number 83001235, as the Park View Hotel.

**3.4 Buena Vista Park.** Replace "the oldest official park in San Francisco" with:
> Established in 1867 as Hill Park and later renamed.

**3.5 Haight Ashbury Free Clinic.** Drop "the first of more than 600 free
clinics". Name the merger partner the source names. Write:
> The clinic operated from 7 June 1967 until July 2019. It merged with Walden House in 2011, and in 2012 the combined organisation took the name HealthRIGHT 360.

Do not write 558 Clayton Street. The source does not carry an address.

**3.6 Magnolia Brewing history.** Drop "a cornerstone of Haight and Masonic for
over 20 years" — trading duration from the operator. Drop "Built in 1903", the
Schumate's Pharmacy line, the Drogstore Cafe line and "Magnolia Thunderpussy's":
all four are history from an interested party and none is second-sourced. The
entry carries address, kind and hours.

**3.7 Maud's address.** Write 929–941 Cole Street. Resolved above.

**3.8 Maud's status.** The bar closed in 1989. Write it `historic-site` with
status `closed`, never as a going concern. Take the ordinance's facts and none of
its adjectives: period of significance 1967–1986, association with Rikki
Streicher, and the locator "on the west side of Cole Street between Parnassus
Avenue and Carl Street", which the proximity rule permits.

**3.9 Amoeba Music.** Write "Opened on 15 November 1997". Do not write any phrase
of the form "has been on Haight Street for", which converts a date into a duration.

**3.10 John A. Whelan House.** No architect, build year or narrative is
established. The whole entry is:
> A private house at 1315 Waller Street, listed on the National Register of Historic Places in 2020 under reference number 100005794.

**3.11 Hose Company #30 present use.** "Now offices" comes from the ordinance and
is undated. Write "The building was restored as a private residence after the
1956 sale." Do not assert what it is today.

**3.12 Mount Olympus.** Do not write that the view is obstructed as though it were
an impression. Write:
> The statue is lost and its pedestal remains. Trees and buildings now block the view from the summit.

**3.13 The strip, collectively.** See the three binding constraints at 2.3.

---

## 4. DROP — 27

### 4.1 Golden Gate Park material — 5. Not escalated; the roster settles it.
The roster makes Golden Gate Park an in-scope standalone page "claimed by no
neighborhood ... it touches the Richmond, the Sunset and Haight-Ashbury alike".
That is dispositive. **Alvord Lake, Hippie Hill, Kezar Stadium, the Panhandle**
and **Golden Gate Park Section 1** all DROP. Section 1's `planning_neighborhood`
of "Golden Gate Park, Haight Ashbury" does not override a roster ruling. The
Alvord Lake Bridge material — 1889, Ernest L. Ransome, 64 feet wide, 20-foot span
— goes with it, and "the first reinforced concrete bridge built in America" is a
ranking that would be banned even if the place stayed.

### 4.2 Cole Valley shops — 5.
**Cole Street Hardware, Zazie, The Ice Cream Bar, Say Cheese, Cole Valley Tavern.**
Outside Definition B, and Cole Valley is not named in the roster's draw for this
zone, unlike Ashbury Heights. Each carries a name, an address and a registration
date and nothing else. Dropped on both grounds.

### 4.3 Sourcing failures — 5.
- **710 Ashbury Street.** No source. See ESCALATION 5.9 — the roster commissioned it.
- **Richard Spreckels Mansion, 737 Buena Vista Avenue West.** No designation, no
  article, nothing but a geocode, and a live confusion risk with the building
  Pacific Heights is writing. Nothing to publish.
- **The Red Victorian, 1665 Haight Street.** The register shows only that "Red
  Victorian LLC" registered there on 2024-12-31. Shipping it as a `hotel` asserts
  a trading status no source establishes. The finder was right to doubt it.
- **All Saints Episcopal Church, 1350 Waller Street.** No designation, no build
  date, and no `church` kind in the schema.
- **Society for Individual Rights, 529 Clayton Street.** I confirmed it: no
  `landmarkno`, `status` "Work Program". Under study, not designated. Correctly held.

### 4.4 Claims the source does not support — 2.
- Doolan-Larson "not open to visitors" (see 3.1).
- "a landmark of the counterculture" attributed to SF Heritage (see 3.2).

### 4.5 Operator-sourced awards and durations — 6.
On `stanyanpark.com` the finder caught one award and there are **four**: "Featured
in Oprah's 'O' Magazine", "8.2 Hotel Rating on Booking.com", and the Michelin
Guide, Frommer's and TripExpert endorsements. All drop. Magnolia's "over 20
years" drops, and its unsourced building history drops (3.6).

### 4.6 Rankings — 2.
Buena Vista "oldest official park in San Francisco"; Free Clinic "first of more
than 600". Both true, both bans.

### 4.7 Etymology — 2.
**Haight Street.** Genuinely contested: the Haight Street article says Weltha
Haight, citing Angus MacFarlane's "Naming of Haight Street, Part 4" on FoundSF;
the Haight-Ashbury article says Henry Haight. Do not write it. If the author
wants it, MacFarlane is the stronger source — a named four-part study beats a
passing mention — but that is a research task, not an authoring one.
**Ashbury Street.** "Munroe Ashbury, Board of Supervisors 1864–1870" rests on a
1984 print book I cannot reach. Not verifiable, so not publishable.

### 4.8 Out of zone — 1.
**McMorry-Lagan Building, San Francisco Landmark No. 164** (188–198 Haight
Street, designated 1983, built 1883, Italianate, Thomas J. Welsh). A real
identifier the finder missed, but 188 Haight is Lower Haight — outside Definition
B and, at roughly −122.4245, outside Definition A's eastern edge of −122.43157 as
well. Belongs to Hayes Valley if to anyone. Recorded so it is not lost.

---

## 5. ESCALATED to the arbitrator — 9

I resolved two of the finder's straddlers (Mount Olympus IN, Golden Gate Park
OUT) and add one it missed. These nine I do not resolve.

**5.1 Abner Phelps House** — 1111 Oak Street. SF Landmark 32 + NRHP 71000187.
**5.2 Old Mish House** — 1153 Oak Street. SF Landmark 62 + NRHP 79000534.
**5.3 Charles L. Hinkel House** — 280 Divisadero Street. SF Landmark 190.

5.1–5.3 are inside Definition A and outside Definition B, whose eastern limit is
Baker Street. Locally the ground reads NoPa / Alamo Square / Western Addition.
**The roster DECLINED Alamo Square**, noting the Painted Ladies "sit at the edge
of Hayes Valley's reach" — so if Haight-Ashbury does not take these three, only
Hayes Valley can, and three Article 10 numbers and two NRHP numbers ride on the
call. This is the expensive one.

**5.4 John Spencer House** — 1080 Haight Street. NRHP 05000273. Marginal at the
Baker Street line; I cannot call it either.

**5.5 Maud's** — 929–941 Cole Street. SF Landmark 331. The designating ordinance
itself says "Located in Cole Valley, near the Haight-Ashbury neighborhood". Two
sources put it out, one puts it in. Unlike the Cole Valley shops it carries an
Article 10 number, so it is worth the arbitration.

**5.6 Duboce Park Landmark District** — 50 Scott Street, 4.79 acres, Article 10
Appendix N, listed 13 July 2013. Three City answers: `analysis_neighborhood`
"Haight Ashbury", `planning_neighborhood` "Western Addition", and local usage
"Duboce Triangle". Whoever takes it gets an identifier.

**5.7 Grattan Playground** — 1180 Stanyan Street, 1.87 acres. DataSF says Haight
Ashbury; at latitude 37.7626 it is south of Frederick Street, i.e. Cole Valley.
No designation, so the cost of dropping it is low.

**5.8 Park Emergency Hospital — SF Landmark No. 201, designated 1991.**
811 Stanyan Street. Built 1902, Beaux Arts, Newton J. Tharp. **The finder missed
this entirely.** Stanyan Street is Definition B's western boundary and the
building sits at the Golden Gate Park edge, so it is a live Golden-Gate-Park
straddle with a real Article 10 number attached. Rule on it.

**5.9 710 Ashbury Street.** The roster's own draw for this zone names "the
Grateful Dead house at 710 Ashbury", and no source supports anything beyond the
existence of a private house at that address. A commissioned draw is not a
source. My ruling is DROP; the arbitrator owns the conflict with the roster.

---

## 6. Tier ruling — TOWN-PAGE

**I agree with the finder, on 34 surviving places, and my reasoning is partly
different from its own.** The finder argued from inaccessibility: one enterable
designated property, the rest pavement-only, and the proximity ban stripping out
the connective language a walking route needs. That holds.

The stronger argument is content depth. Of 34 survivors, **25 are shops carrying
a name, an address and a kind, with the registration date explicitly barred from
becoming a founding date** — the single richest fact about most of them is
unpublishable. Four more are a park, a hill, a record shop and a closed clinic.
Only five entries carry designation narrative. A guide tier would be asserting
depth this material does not have, and would have to invent itineraries between
houses nobody can enter.

Even if all nine escalations land here, the count reaches 43 but the shape does
not change: it adds six pavement-only houses, a park, a playground and an
address with no source. **Town-page.**

---

## 7. What the finder got wrong

1. **Missed two Article 10 landmarks.** No. 201 Park Emergency Hospital (811
   Stanyan, 1991) and No. 164 McMorry-Lagan Building (188–198 Haight, 1983). It
   reported "7 Article 10 landmark numbers" as the zone's total; a street-name
   sweep of `rzic-39gi` returns nine. No. 201 is a live straddler with a real
   number, which is exactly the kind of thing that must not be missed.
2. **Read silence as a fact.** "The building is not open to visitors" is not on
   `haightandashbury.org`. The finder inferred a closure from an absent statement
   and stated it as sourced.
3. **Misquoted San Francisco Heritage.** The site says "a National Historic
   Treasure", not "a landmark of the counterculture" — and the finder built a
   whole gate-trap illustration in section 7 on the phrase.
4. **Wrong about the gate catching Maud's superlative.** It claimed "one of San
   Francisco's most popular and longest running lesbian bars" is "caught by the
   `one of the most` pattern". It is not: that pattern is `one of the (most|
   best|…)`, and "one of San Francisco's most" does not match it. The third
   pattern's alternation after "San Francisco's" is `only|oldest|largest|
   smallest|finest|greatest|best` and does not include "most". The regex misses
   it entirely. The ban still applies — but the finder's confidence was misplaced,
   which is worse than its correctly-flagged known gaps.
5. **Counted the landmark districts wrong.** "I checked all twenty in the
   dataset" — `knm6-5ej6` returns 16. The conclusion (no Haight-Ashbury district)
   is right; the check behind it was not what was described.
6. **Found one award claim where there are four**, all on the same short page.
7. **Left Magnolia Brewing with no kind**, having read the kind list closely
   enough to note there is no `church`. There is a `brewery`.
8. **Got the register name slightly wrong** — `dba_name` is "Zam Zam".

### Credit where it is due
The two corrections to the brief are both real and both verified: `taken_slugs.py`
reads Rome only, and `p5b7-5n3h` returns empty objects. Every one of the 14
identifiers it claimed survived re-fetching with names, addresses and dates
intact, which is rare. Its refusal to write the Free Clinic address, the Haight
etymology, the Nominatim neighbourhood labels and the Society for Individual
Rights designation were all correct, and I confirmed the last of these directly.
The Maud's address discrepancy it declined to resolve resolves in its favour.
