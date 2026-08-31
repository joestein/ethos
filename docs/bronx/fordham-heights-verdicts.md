# Fordham Heights — independent verifier's verdicts

Role: VERIFIER. I have not seen the finder's reasoning, only its artifact
(`docs/bronx/fordham-heights-finder.md`). Every verdict below rests on a URL I
re-fetched myself in this session. WebSearch was unavailable throughout
(budget exhausted); all re-fetching was WebFetch. `nycgovparks.org` and
`web.archive.org` were not attempted, per the standing block.

The eight hard rules of `docs/site-builder.md` §4 bind this pass, together with
the ninth: **a `confirmed` verdict vouches for what this verdict's own text
restates, not for every clause of the finder's sentence.** Where I quote, the
end of the quotation is the edge of what is confirmed.

---

## 0. Headline ruling — the boundary question

### What is actually established

Every item in this subsection was re-fetched and is quoted from the source.

1. **The roster construct.** `priv/seed_data/bronx_roster.json`: `fordham-heights`
   = "Fordham Heights", community district **5**, `in_scope: true`, wave 2.
   `fordham-manor` = community district **7**, `in_scope: false`, wave 3.
   `kingsbridge-heights` = community district **7**, `in_scope: false`, wave 3.
   Two future roster rows are therefore reserved for exactly the territory in
   dispute. — verified by reading the roster file directly.

2. **Bronx Community Board 5's own stated boundary.** "It is delimited by
   **Webster Avenue to the east**, Hall of Fame Terrace, West 183rd Street, and
   **Fordham Road to the north**, the Harlem River to the west, and Washington
   Bridge and the Cross Bronx Expressway to the south." The article names its
   neighborhoods as "Fordham, Morris Heights, Mount Hope, and University
   Heights" and **never uses the string "Fordham Heights."**
   — https://en.wikipedia.org/wiki/Bronx_Community_Board_5

   Two boundaries matter, not one. The finder reported the Fordham Road line and
   **did not report the Webster Avenue line.** The Webster Avenue line is the
   one that decides Rose Hill and Fordham Plaza.

3. **The "Fordham, Bronx" article describes the *northern* area.** "Fordham is
   roughly bordered by East 196th Street to the north, the Harlem River to the
   west, **Fordham Road to the south**, and Southern Boulevard to the east."
   — https://en.wikipedia.org/wiki/Fordham,_Bronx

   On its own stated boundary, that article's subject area lies **north of
   Fordham Road** — i.e. the CD7 half, the `fordham-manor` row's territory. The
   article elsewhere says the neighborhood sits in both Community Board 5 and
   Community Board 7, divided at Fordham Road; the two statements are in tension
   inside a single article. The finder's suspicion that the article covers a
   wider area than the roster slug is **confirmed, and understated**: the
   article's own boundary box excludes the CD5 sliver entirely.

4. **The subway locale labels, five of them, form a clean north–south
   progression along the Grand Concourse.** Re-fetched individually:
   - 182nd–183rd Streets (IND Concourse), E 182nd St & Grand Concourse —
     Locale: **"Fordham Heights"**.
     — https://en.wikipedia.org/wiki/182nd%E2%80%93183rd_Streets_(IND_Concourse_Line)
   - Fordham Road (IND Concourse), E Fordham Rd & Grand Concourse — Locale:
     **"Fordham Heights"**. *The finder did not report this one; it is a fifth
     independent source and it strengthens the finder's own flag.*
     — https://en.wikipedia.org/wiki/Fordham_Road_(IND_Concourse_Line)
   - Kingsbridge Road (IND Concourse), E Kingsbridge Rd & Grand Concourse —
     "Located within the **Fordham Manor and Kingsbridge Heights** neighborhoods
     in the Bronx." Infobox Locale: "Fordham Manor, Kingsbridge Heights".
     Station succession confirms it is the **next station north of Fordham
     Road** (preceding: Fordham Road; following: Bedford Park Boulevard).
     — https://en.wikipedia.org/wiki/Kingsbridge_Road_(IND_Concourse_Line)
   - Kingsbridge Road (IRT Jerome Ave) — "Located at the intersection of
     Kingsbridge Road and Jerome Avenue in the **Kingsbridge Heights**
     neighborhood of the Bronx."
     — https://en.wikipedia.org/wiki/Kingsbridge_Road_(IRT_Jerome_Avenue_Line)
   - Fordham Road (IRT Jerome Ave) — "Located at the intersection of Fordham
     Road and Jerome Avenue in the **University Heights and Fordham**
     neighborhoods of the Bronx."
     — https://en.wikipedia.org/wiki/Fordham_Road_(IRT_Jerome_Avenue_Line)

   **Net:** the label "Fordham Heights" attaches to the Grand Concourse corridor
   from E 182nd Street up to and including Fordham Road, and stops there. The
   very next station north is Fordham Manor / Kingsbridge Heights.

5. **Landmark and Register neighborhood columns are plain "Fordham" and are
   internally inconsistent.** Poe Cottage — LPC list neighborhood "Fordham";
   NRHP list location "Fordham". Loew's Paradise Theater — "Fordham". Bronx
   Library Center — "Fordham section of the Bronx". Rose Hill / St. John's /
   Alumni House — "Fordham University Rose Hill campus" (a campus, not a
   neighborhood). Dollar Savings Bank, 2516–2530 Grand Concourse — LPC list
   says **"Fordham Manor"**, the NRHP list says **"Fordham"** for the same
   building at the same address.
   — https://en.wikipedia.org/wiki/List_of_New_York_City_Designated_Landmarks_in_the_Bronx
   and https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx

   **No source anywhere in this corpus applies the string "Fordham Heights" to
   any of the nine proposed places.** The designation records say "Fordham",
   which is the ambiguous parent term that spans both roster rows and resolves
   nothing.

### The decisive argument

Every one of the nine places is sourced to plain **"Fordham"**. There are
therefore only two coherent readings:

- **Apply the CD discriminator** (Fordham Road north, Webster Avenue east, plus
  the five subway locale labels) consistently to all nine.
- **Apply it to none**, in which case `fordham-heights` swallows Poe Cottage,
  Poe Park and the Bronx Library Center — the exact material the scheduled
  `fordham-manor` and `kingsbridge-heights` rows (wave 3) exist to hold. That
  guarantees the duplication defect already on record in this corpus.

Selective application — discriminating where it costs nothing and abstaining
where it costs a place — is not available. **I apply the discriminator.**

### Ruling per affected place

| Place | Ruling | Basis |
|---|---|---|
| **Edgar Allan Poe Cottage** (2640 Grand Concourse, at Kingsbridge Rd) | **`fordham-manor`** | The identical intersection — E Kingsbridge Rd & Grand Concourse — is assigned by the IND Kingsbridge Road station article to "Fordham Manor and Kingsbridge Heights". North of CB5's stated northern boundary. No source places it in Fordham Heights. |
| **Poe Park** (same site; cottage sits "in the northern part of Poe Park", dedicated "at the corner of Kingsbridge Road and the Grand Concourse") | **`fordham-manor`** | Same site, same basis. |
| **Bronx Library Center** (310 E Kingsbridge Road, "between Fordham Road and East 192nd Street") | **`fordham-manor`** | North of CB5's Fordham Road boundary; on the Kingsbridge Road corridor whose only positive neighborhood attribution is Fordham Manor / Kingsbridge Heights. **This is the closest call of the three** — it sits immediately north of the line — but the evidence that exists points one way and none points the other. |
| **Kingsbridge Road corridor generally** | **`fordham-manor` / `kingsbridge-heights`** | Three independent station articles; no contrary source. |

**Consequence, stated plainly as requested: Poe Cottage, Poe Park and the Bronx
Library Center have no home. `fordham-manor` is out of scope and will not ship.
This material simply does not get published in this wave.** That is the honest
answer and it is not the convenient one — it removes the neighborhood's single
most recognisable attraction.

### A second boundary problem the finder did not flag

The finder flagged the Fordham Road line. It did not flag the **Webster Avenue**
line, and Webster Avenue removes two further places:

- **Fordham Road's own article:** "**East of Webster Avenue** and directly across
  from Fordham University, Fordham Plaza is a major hub for buses and a stop on
  the Metro-North Railroad's Harlem and New Haven lines."
  — https://en.wikipedia.org/wiki/Fordham_Road
- **CB5's eastern boundary is Webster Avenue** (quoted above).

Therefore **Fordham Plaza is east of Webster Avenue**, and **Fordham University
is directly across from Fordham Plaza**, i.e. also east of Webster Avenue. Both
lie outside Community Board 5 on CB5's own stated boundary. Corroborating:
Fordham Plaza's own article calls it "a major commercial and transportation hub
in the **Fordham and Belmont** neighborhoods"; the Theodore Roosevelt campus at
500 East Fordham Road, "directly across the street from" Fordham University,
gives its own position as "**at the northern edge of the Belmont section**… and
the southern edge of Fordham University's campus."
— https://en.wikipedia.org/wiki/Fordham_Plaza,
https://en.wikipedia.org/wiki/Theodore_Roosevelt_Educational_Campus

| Place | Ruling |
|---|---|
| **Fordham University — Rose Hill campus** | **Not `fordham-heights`.** East of Webster Avenue and north of Fordham Road; outside CD5 on CB5's own boundary. Sources place it in "Fordham" (parent term) adjoining Belmont. Which roster row it belongs to is **unresolvable** on available sources — but it is not this one. |
| **Fordham Plaza** | **Not `fordham-heights`.** East of Webster Avenue; its own article says "Fordham and Belmont". **Genuinely contested** between `fordham-manor` and `belmont`. |

I record this reluctantly and without enthusiasm: it costs the page its two
largest remaining anchors. The evidence is what it is.

### Confirming the binding Bronx Park ruling was respected — **confirmed**

The finder proposed neither the New York Botanical Garden nor the Bronx Zoo as a
place record, and reproduced the "occupy dozens of acres of land within the
neighborhood" line only as Flag 4, explicitly not used to site them. Re-checked
against `docs/bronx/bronx-park-verdicts.md` §"Flagged item 2". **The finder
respected the ruling in full. Not reopened.**

---

## Place 1 — Fordham University, Rose Hill campus

**Boundary verdict: not in `fordham-heights` (see §0). Does not survive for this
file.** Claim verdicts recorded anyway so a `fordham-manor` or `belmont` pass can
reuse them.

| Claim | Verdict |
|---|---|
| Founded 1841 by Bishop John Hughes as St. John's College | **confirmed** |
| Hughes purchased "the 106-acre Rose Hill Manor farm in the village of Fordham, New York, for $29,750" in 1839 | **confirmed**, verbatim |
| Campus now "Situated on 85 acres (34.4 ha) in the central Bronx" | **confirmed**, verbatim |
| "Rose Hill" named 1787 by Robert Watts for his family's ancestral home in Scotland | **confirmed** |
| St. Joseph's Seminary 1840, St. Joseph's College 1841, transferred to the Jesuits 1846 for $40,000 | **confirmed** on https://en.wikipedia.org/wiki/Fordham,_Bronx |
| "Collegiate Gothic architecture, expansive lawns, ivy-covered buildings, and cobblestone streets" | **confirmed** |
| "just north of the Belmont neighborhood" and "immediately west of the Bronx Zoo and the New York Botanical Garden" | **confirmed**, verbatim: "Rose Hill is on Fordham Road, just north of the Belmont neighborhood, described as the 'real Little Italy of New York', and immediately west of the Bronx Zoo and the New York Botanical Garden." |
| Cunniffe House / Rose Hill administration building "constructed in 1838" | **confirmed** |
| Rose Hill (Fordham University Administration Building) — NYC landmark **August 18, 1970** | **confirmed** on the boroughwide list |
| St. John's Residence Hall — NYC landmark **August 18, 1970** | **confirmed** |
| St. John's Residence Hall address "Fordham Road and East 179th Street" | **uncertain** — the boroughwide list's row returned name, neighborhood ("Fordham University Rose Hill campus") and date on re-fetch, not this address. East 179th Street is not adjacent to Fordham Road, which makes the pairing suspect. Do not publish this address without a fresh source. |
| Alumni House — NYC landmark **February 3, 1981** | **confirmed** (listed as "Alumni House (Housing Office)") |
| Alumni House address "East Fordham Road and 191st Street" | **uncertain** — same reason as above. |
| University Church built 1845; altar from St. Patrick's Cathedral; stained glass from King Louis Philippe I | **confirmed** |
| Bell named "old Edgar", "may have been the inspiration for [Poe's] poem 'The Bells'" | **confirmed as a hedged local tradition** — the article credits it as local tradition, not as fact. Under the authoring contract an uncertain specific may not be published behind a hedge; publish the bell's existence or nothing. |
| Includes Fordham College at Rose Hill and the Gabelli School of Business | **confirmed** |

**Rose Hill sub-features — I agree with the finder.** Cunniffe House, University
Church, St. John's Residence Hall and Alumni House have no independent address,
gate, admission or visitability apart from the campus. This is the same test the
Bronx Park verifier applied to Astor Court, Congo Gorilla Forest, JungleWorld and
NYBG's Conservatory, and it produces the same answer. Landmark designation is not
independent visitability. **Keep them as features of the campus record, never as
separate places.**

Surviving claims: **13 confirmed, 3 uncertain.** Surviving *place* for this file:
**0** (boundary).

---

## Place 2 — Edgar Allan Poe Cottage

**Boundary verdict: `fordham-manor`. Does not survive for this file.**

| Claim | Verdict |
|---|---|
| Address "2640 Grand Concourse, Fordham, Bronx, NY" | **confirmed** — note the neighborhood word is "Fordham", never "Fordham Heights" |
| **Construction date 1797 vs 1812** | **uncertain — publish no construction date.** See ruling below. |
| Poe, Virginia Clemm and Maria moved in "around May 1846"; Virginia died January 30, 1847 | **confirmed** |
| "Annabel Lee" and "Ulalume" written there; "Literati of New York City" published there; "Landor's Cottage" "likely inspired by" the home | **confirmed as stated** — the last is hedged in the source and must not be published as a flat claim |
| Designated a Bronx landmark 1962 | **confirmed** |
| LPC city landmark **February 15, 1966** | **confirmed**, and independently corroborated by the boroughwide list's "Poe Cottage" row, same date |
| NRHP **August 19, 1980**, ref **#80002588**, address 2640 Grand Concourse | **confirmed**, independently corroborated by the NRHP-listings-in-the-Bronx table, same date, same reference number, location column "Fordham" |
| Administered by the Bronx County Historical Society since 1975 | **confirmed** |
| Part of the Historic House Trust | **confirmed** |
| Visitor center opened 2008 | **confirmed** — and the re-fetch adds an architect the finder missed: designed by **Toshiko Mori** |
| "in the northern part of Poe Park"; relocated/dedicated **November 13, 1913** at Kingsbridge Road and the Grand Concourse | **confirmed**, verbatim: "on November 13, 1913, Poe Cottage in Poe Park was dedicated at the corner of Kingsbridge Road and the Grand Concourse." |

### Flagged item 1 — the 1797 vs 1812 construction date: **uncertain**

Traced. Neither figure comes from a designation record.

- **1812** appears in the article's **infobox**, paired with architect **John
  Wheeler**, and is repeated independently in a second article: the Grand
  Concourse article's landmark list reads "Edgar Allan Poe Cottage, the last home
  of Edgar Allan Poe (NRHP, NYCL; **built 1812**; architect John Wheeler)."
  — https://en.wikipedia.org/wiki/Edgar_Allan_Poe_Cottage,
  https://en.wikipedia.org/wiki/Grand_Concourse_(Bronx)
- **1797** appears once, in body prose, hedged: "The house **is believed to have
  been built** in 1797."
  — https://en.wikipedia.org/wiki/Edgar_Allan_Poe_Cottage

This is **not** the shape the dispatch anticipated (designation record vs.
secondary guidebook). Both figures are Wikipedia; the underlying LPC designation
report and the NRHP nomination form are the records that would settle it and
neither was reachable this pass (`nycgovparks.org` 403s, `web.archive.org`
refused, WebSearch exhausted). **Verdict: uncertain.** 1812 is the
better-corroborated figure — two articles, an architect attribution, an infobox
position — but corroboration inside one encyclopedia is not independence, and
1797 is not refuted, merely hedged. Per the authoring contract, remove the
specific rather than hedge it: publish the cottage without a construction date.

Surviving claims: **10 confirmed, 1 uncertain.** Surviving *place* for this file:
**0** (boundary).

---

## Place 3 — Poe Park

**Boundary verdict: `fordham-manor`. Does not survive for this file.**

| Claim | Verdict |
|---|---|
| Listed in "List of parks in New York City", West Bronx section, as "Poe Park, including Edgar Allan Poe Cottage" | **confirmed** — re-fetched; the entry is a redlink with **no acreage, address or neighborhood** attached |
| Cottage sits "in the northern part of Poe Park", near Kingsbridge Road and Grand Concourse | **confirmed** |
| `searched: incomplete` on acreage / boundary / founding date | **confirmed as an honest gap** — I reproduced it; no reachable source carries these |

Even setting the boundary aside, Poe Park's identity rests on a redlink in a list
plus one locative sentence in another article's text. That is thin but it does
establish name and location, which is the survival test.

Surviving claims: **3 confirmed.** Surviving *place* for this file: **0**
(boundary).

---

## Place 4 — Grand Concourse (boulevard) / Grand Concourse Historic District

**Boundary verdict: the boulevard passes through Fordham Heights (confirmed by
two station locale labels on it). The Historic District does not — see the
refutation.**

| Claim | Verdict |
|---|---|
| "5.2-mile-long (8.4 km) thoroughfare", 180 feet (55 m) wide for most of its length | **confirmed** |
| Runs from East 138th Street to Mosholu Parkway | **confirmed** |
| Passes through "Bedford Park, Concourse, Highbridge, Fordham, Mott Haven, Norwood and Tremont" | **confirmed**, verbatim |
| Designed by Louis Aloys Risse, "an immigrant from Saint-Avold, Lorraine, France", who "first conceived of the road in 1890" | **confirmed** |
| Built 1894–1909; extension 1927; total cost $14 million | **confirmed** — with one correction: the 1927 work is described as a **southward** extension; do not publish it as an unqualified "extension" if direction matters |
| "By the mid-1930s, almost three hundred apartment buildings had been constructed"; Art Deco and Art Moderne | **confirmed** |
| In 1939 called "the Park Avenue of middle-class Bronx residents" | **confirmed** — attributed in the source to the 1939 WPA guide; publish the attribution with the quote |
| Grand Concourse Historic District added to NRHP **August 24, 1987** | **confirmed** as a date, ref **#87001388** |
| **The NRHP historic district covers part of the boulevard relevant to this file** | **REFUTED.** The NRHP listings table gives the district's address range as "**730–1675 Grand Concourse**" and its location column as "**Concourse**". Poe Cottage is at 2640 and the Paradise Theater at 2403 — the district's northern limit at 1675 stops far south of Fordham Road and of this neighborhood entirely. **Correction: the Grand Concourse Historic District lies in the Concourse neighborhood and does not reach Fordham Heights.** — https://en.wikipedia.org/wiki/National_Register_of_Historic_Places_listings_in_the_Bronx |
| NRHP architectural styles "Late 19th and 20th Century Revivals, Art Deco" | **confirmed** — but these describe the Concourse-neighborhood district, not this stretch |
| 2011 LPC historic district covers "153rd to 167th Streets", well south of Fordham Road | **confirmed** — and the re-fetch adds the designation date the finder omitted: **October 25, 2011** |
| At Fordham Road "the main road passes underneath in a grade-separated junction, while the service roads intersect with Fordham Road" | **confirmed** |

**Ruling on the place itself.** The boulevard is real, visitable, and confirmed to
run through this neighborhood (the 182nd–183rd Streets and Fordham Road IND
stations both sit on it with Locale "Fordham Heights"). It survives — but
**every historic-district clause must be stripped**, because both designated
districts sit in a different neighborhood. What is left is a boulevard, its
dimensions, its designer and its Fordham Road junction.

Surviving claims: **11 confirmed, 1 refuted.** Surviving place: **1.**

---

## Place 5 — Paradise Theater (formerly Loew's Paradise Theatre)

**Boundary verdict: `fordham-heights`.** 2403 Grand Concourse sits south of
Fordham Road, between the two stations whose Locale is "Fordham Heights", and its
own article places it "close to the Fordham Road station" of the IND Concourse
Line. **This is the strongest-sited place on the page.**

| Claim | Verdict |
|---|---|
| Current name "Paradise Theater"; formerly "Loew's Paradise Theatre" | **confirmed** |
| Address 2403 Grand Concourse | **confirmed**, corroborated independently by https://en.wikipedia.org/wiki/Grand_Concourse_(Bronx) ("built 1929 at 2403 Grand Concourse") |
| Opened **September 7, 1929**; architect **John Eberson** | **confirmed** |
| Atmospheric theatre, Italian Baroque design, with Spanish-style decoration | **confirmed** — the Spanish-style comparison is to the Valencia Theatre |
| Original seating ≈3,885; current (as of 2012) 3,855 | **confirmed** |
| **Exterior** NYC landmark **April 15, 1997**, ref **#1891** | **confirmed** — and independently corroborated by the boroughwide list's "Loew's Paradise Theater" row, same April 15, 1997 date. *My first re-fetch returned these two designations transposed; a second, targeted re-fetch against the infobox and designation section resolved it in the finder's favour. The finder had it right.* |
| **Lobbies and auditorium interior** NYC landmark **May 16, 2006**, ref **#2193** | **confirmed** |
| Leased 2012 to World Changers Church International, vacated 2020, vacant as of 2023 | **confirmed** — re-fetch adds the month: leased **October** 2012 |
| Bronx Independent Cinema Center began hosting events there in 2025 | **confirmed** |
| Sits close to the Fordham Road station (IND Concourse) | **confirmed** |
| **Is it open?** | **uncertain.** Vacant as of 2023 with 2025 events hosted by a third party is not a confirmed operating status, and it is **not** positive evidence of closure either. Per rule 3, uncertain — never `refuted`, and uncertain does not delete. Publish the building and its history; make no claim about current operation or ticketing. |

Surviving claims: **10 confirmed, 1 uncertain.** Surviving place: **1.**

---

## Place 6 — Fordham Plaza

**Boundary verdict: not `fordham-heights` — east of Webster Avenue (see §0).
Genuinely contested between `fordham-manor` and `belmont`; its own article says
"Fordham and Belmont". Does not survive for this file.**

| Claim | Verdict |
|---|---|
| "a major commercial and transportation hub in the Fordham and Belmont neighborhoods of the Bronx", "on the south side of Fordham Road at Third and Webster Avenues" | **confirmed** |
| Fordham Place (400 East Fordham Road) and One Fordham Plaza (14 storeys) | **confirmed** |
| "The plaza was built in the 1920s in conjunction with the reconstruction of the railroad station, which was completed by 1926." | **confirmed**, verbatim |
| 1973 plan for a shopping complex on the Postal Service site anchored by E. J. Korvette | **confirmed** |
| One Fordham Plaza groundbreaking October 1984, "opened in August 1986 at the cost of about $65 million" | **confirmed** |
| Bus terminal "officially opened on August 28, 1997" | **confirmed** |
| Construction began February 2013; "the entire plaza opened to the public on January 20, 2016"; $7.2 million TIGER grant | **confirmed** on the dates and the grant; **uncertain** on the month "February" — the re-fetch returned only "2013" |
| "Sits directly above the Metro-North's Fordham station, one of the busiest in that system" | **uncertain** — not returned on re-fetch. The Fordham station article says the station "is part of the Fordham Plaza complex", which is a weaker relation than "directly above". Publish the complex relation, not the vertical one. |
| "the closest subway stop to the plaza is the Fordham Road station of the IND Concourse Line six blocks west" | **confirmed** |

Surviving claims: **7 confirmed, 2 uncertain.** Surviving *place* for this file:
**0** (boundary).

---

## Place 7 — Bronx Library Center

**Boundary verdict: `fordham-manor`. Does not survive for this file.** The
closest call of the three Kingsbridge Road places, ruled in §0.

| Claim | Verdict |
|---|---|
| 310 East Kingsbridge Road, Bronx, NY 10458 | **confirmed** by both sources independently |
| Located "between Fordham Road and East 192nd Street, two blocks east of the Grand Concourse" | **confirmed** |
| Opened to the public **January 17, 2006** | **confirmed** by both sources |
| Dattner Architects, led by Richard Dattner | **confirmed** |
| 78,000 square feet; "an estimated $50 million" | **confirmed** |
| Replaced the Fordham Branch Library, in service since 1923, 25,000 sq ft, closed November 2005; "three times as much space as its predecessor" | **confirmed** — re-fetch adds the predecessor's address, **2556 Bainbridge Avenue** |
| "the first 'green' library in New York City with LEED Silver certification" | **confirmed** as Wikipedia's wording. NYPL's own page says only "NYPL's first green library" — a narrower claim. Under rule 4 the operator cannot establish the superlative; Wikipedia can and does, so publish **Wikipedia's** wording, not NYPL's. |
| LEED Silver certification **in 2007** | **uncertain.** The year appears **only** on NYPL's own page ("presented with the LEED Silver Certification Award in 2007"). Wikipedia states the certification without a year. Rule 4 bars an institution's own site from establishing an award about itself. Publish the certification, not the year. |
| "the largest public library building in the Bronx" | **confirmed with correction.** Wikipedia says "**the largest library in the borough**"; NYPL's own page says "the largest public library in the Bronx". Neither says "building". **Correction: use "the largest library in the borough", sourced to Wikipedia** — https://en.wikipedia.org/wiki/Bronx_Library_Center |
| Wikipedia names Fordham University and Poe Cottage as nearby landmarks | **confirmed** |

Surviving claims: **9 confirmed (1 corrected), 1 uncertain.** Surviving *place*
for this file: **0** (boundary).

---

## Place 8 — Fordham Road (shopping corridor / Business Improvement District)

**Boundary verdict: `fordham-heights`, partially — the BID's extent is confirmed
as "from Third and Webster Avenues west to Jerome Avenue", which runs along and
inside CB5's northern edge. Fordham's own article describes the BID as operating
"on the northern border of the neighborhood." Survives, with the boundary
language kept hedged per programme convention.**

| Claim | Verdict |
|---|---|
| "a major thoroughfare in the Bronx… that runs west-east from the Harlem River to Bronx Park"; 2.4 miles (3.9 km); "a two-way, four-lane road" | **confirmed** |
| Divides into East and West Fordham Road at Jerome Avenue, addresses increasing away from it | **confirmed** |
| Geographically separates the North Bronx from the South Bronx | **confirmed** |
| "houses the borough's largest and most diverse shopping district" | **confirmed**, verbatim |
| Managed by "the Fordham Road Business Improvement District, a non-profit organization under contract with the City of New York", which maintains, develops and markets merchants and hosts community events | **confirmed** |
| BID is "the third largest shopping district in the city" | **confirmed as stated**, verbatim from https://en.wikipedia.org/wiki/Fordham_Road_(IND_Concourse_Line) — with the extent the finder omitted: "**stretching from Third and Webster Avenues west to Jerome Avenue**" |
| Fordham's article calls the retail district "the longest in the Bronx" | **confirmed**, verbatim — and it adds "The Fordham Road Business Improvement District operates on the **northern border** of the neighborhood" |
| Monroe University's article: "about 80 buildings that house nearly 300 businesses" | **confirmed** |
| Named adjacent institutions: Rose Hill, Theodore Roosevelt High School, St. Nicholas of Tolentine Church | **confirmed** as named by the article |

### Flagged item 2 — the shopping-district superlative conflict: **the conflict dissolves**

Three superlatives, re-fetched:

- "Fordham Road houses **the borough's largest and most diverse** shopping
  district." — https://en.wikipedia.org/wiki/Fordham_Road
- "the Fordham Road Business Improvement District, **the third largest shopping
  district in the city**"
  — https://en.wikipedia.org/wiki/Fordham_Road_(IND_Concourse_Line)
- "This retail district is **the longest in the Bronx**."
  — https://en.wikipedia.org/wiki/Fordham,_Bronx

**These are not in conflict.** Largest-in-borough, longest-in-borough and
third-largest-in-city are three compatible propositions about the same district —
being the biggest in the Bronx is entirely consistent with ranking third across
the five boroughs, and "longest" is a different measure again. The finder flagged
a contradiction that is not there. This is the same shape as the "1900 vs 1901"
item the dispatch cites: a conflict that dissolves on a direct re-read.

**On rule 4:** all three are third-party (Wikipedia), none from the BID's own
site or publications, so the rule is not triggered. But they are unattributed,
undated editorial superlatives. **Recommend publishing "the borough's largest and
most diverse shopping district" only** — the one carried by the road's own
dedicated article — and dropping the city-wide ranking, which is the most
load-bearing and the least supported of the three.

Surviving claims: **9 confirmed.** Surviving place: **1.**

---

## Place 9 — Monroe University (Bronx campus)

**Boundary verdict: `fordham-heights`, marginally.** The only location the
sources give is "Fordham, Bronx neighborhood" and "near the Fordham shopping
district" — and the BID's confirmed extent runs from Third/Webster west to
Jerome Avenue, the western half of which lies inside CB5. No source gives a
street address or a side of Fordham Road. This is the weakest siting on the page
and I record it as such.

| Claim | Verdict |
|---|---|
| Current institution name "Monroe University" | **confirmed** |
| "founded in 1933 by Mildred King as the Monroe School of Business, a women's business school, in the West Farms section of the Bronx" | **confirmed**, verbatim |
| "The campus has been located in Fordham, Bronx neighborhood since 1967." | **confirmed**, verbatim |
| West Farms facilities closed and all programs consolidated in the Fordham Road area | **confirmed with correction.** The finder presents this as following from the 1967 move, in one sentence. The source gives a different year: "**in 1977** the West Farms facilities were closed and all Monroe programs were consolidated in the Fordham Road area." **Correction: 1977, not 1967 — and these are two separate events ten years apart, not one.** — https://en.wikipedia.org/wiki/Monroe_University |
| "It has seven buildings that are located near the Fordham shopping district" | **confirmed** |
| Campuses in New Rochelle, New York and Saint Lucia | **confirmed** |
| Street address for the Bronx campus | **uncertain — none exists in the source.** Targeted re-fetch: "The article does not provide a street address or cross street for the Bronx campus." Identity survives on name + neighborhood location, not on an address. |

Surviving claims: **5 confirmed, 1 corrected, 1 uncertain.** Surviving place:
**1** (marginal).

---

## Neighborhood-level, transit and excluded material

**Neighborhood history** — all re-fetched against
https://en.wikipedia.org/wiki/Fordham,_Bronx and **confirmed**: Jan Arcer /
John Archer, 1666, 225th Street; "Fordham Manor" 1671–1762, six square miles;
Rose Hill 1838 purchase for $29,750; seminary 1840 / college 1841 / Jesuits 1846
for $40,000; "remained rural until about 1900"; the ford / John Fordham name
origin; the 1920s–1970s demographic account and the present one; population
43,394, 0.507 sq mi, median income $26,143; the January 9, 2022 fire killing "at
least 19 people, including nine children"; ZIP codes 10453, 10457, 10458, 10468.
**One correction:** the finder gives the demographic period as "from the 1920s
through the 1970s"; the source says "from the 1920s through the **late** 1970s".

**Caution the authoring pass must observe:** this history is the history of
*Fordham*, the parent area, most of which this file has just ruled out of scope.
Publishing it wholesale under `fordham-heights` would smuggle the boundary
problem back in through the prose. The 1751 manor house, Rose Hill, the 1666
settlement at 225th Street and "Fordham Manor" the patent are all north of, or
outside, this neighborhood. Keep the neighborhood-level history to what the
narrow slice can carry.

**Transit** — per rule 7 this is prose in "Getting there", never place records.
Confirmed: Fordham Road IRT (June 2, 1917; Fordham Rd & Jerome Ave; 4 train;
four-corner stairs plus southeast-corner elevator; Bx12, Bx12 SBS, Bx32);
Kingsbridge Road IRT (June 2, 1917, northern terminal of the line's initial
section, adjacent to the Kingsbridge Armory); Fordham Road IND (July 1, 1933;
B weekdays, D all times); 182nd–183rd Streets IND (July 1, 1933; B weekdays, D
all times except peak-direction rush hours); Kingsbridge Road IND (July 1, 1933);
Fordham Metro-North station (417 East Fordham Road, Harlem and New Haven Lines,
opened March 1, 1841, two below-ground side platforms eight cars long on the
outer tracks of a four-track mainline, part of the Fordham Plaza complex, bus
routes Bx9/Bx12/Bx12 SBS/Bx15/Bx17/Bx22/Bx41/Bx41 SBS and Bee-Line 60/61/62);
University Heights Bridge facts as cited (not re-fetched this pass —
**uncertain**, and the bridge is outside this neighborhood in any case).

**Fordham station superlatives — confirmed as stated, recommended dropped.**
"busiest reverse-peak commutation station in the United States", "busiest
Metro-North station in the Bronx", "third-busiest station outside Manhattan" all
appear verbatim, but the re-fetch establishes that **none is attributed or dated**
in the source. Three undated ridership superlatives in one sentence is exactly
the clause a `confirmed` verdict is not meant to carry. Publish the station, its
lines and its address; drop the rankings.

**Ferry gap** — **confirmed as an honest gap**, correctly stated as such.

**Trip durations** — correctly excluded by the finder. Confirmed.

**Excluded candidates — I agree with all five exclusions.** Devoe Park (redlink
in a list, nothing else reachable); St. James' Episcopal Church (November 25,
1980 designation confirmed on the boroughwide list, neighborhood "Fordham", but
no address, architect or date anywhere); St. Nicholas of Tolentine (the Wikipedia
title resolves to an Atlantic City parish — a namesake, correctly rejected under
rule 8); Theodore Roosevelt Educational Campus (its own article says "at the
northern edge of the Belmont section"); Dollar Savings Bank Building (both
designation dates confirmed — LPC July 19, 1994; NRHP November 18, 2024, ref
#100010987, 2516–2530 Grand Concourse — but the LPC list's neighborhood column
says "**Fordham Manor**", which under §0 puts it out of scope regardless).

**DOHMH — confirmed: zero DOHMH-only places.** Nothing in the finder's material
is an eatery or shop resting on an inspection record. No DOHMH or DCWP text
appears anywhere in the artifact. The finder's report of 0 is accurate.

**Dedup check — confirmed as performed and correct.** No collision with
`belmont.json` or `mott-haven.json`. I add one forward-looking hazard the finder
did not flag: under §0, `fordham-manor` and `kingsbridge-heights` (wave 3) will
hold Poe Cottage, Poe Park and the Bronx Library Center. **A test should gate
those three slugs and the address 310 East Kingsbridge Road out of
`fordham-heights.json`**, in the pattern of
`connecticut_places_test.exs:54-74`, so a later wave cannot quietly restore them.

---

## The Fordham–Bronx Park relationship — **the tie holds**

This is load-bearing for Bronx Park's third outbound link. Adjudicated
individually.

| Claim | Verdict |
|---|---|
| **1884 New Parks Act — land for Bronx Park acquired from Fordham University** | **CONFIRMED**, verbatim from the Fordham side: "At one time spanning over 100 acres, much of the land for adjacent Bronx Park was acquired from the university with funds authorized by the 1884 New Parks Act intended to preserve lands that would soon become part of New York City." — https://en.wikipedia.org/wiki/Fordham_University |
| …the **Lorillard family** half of the transfer | **not established on the Fordham side.** The Lorillard family is **not mentioned** in Fordham University's article. This half rests solely on Bronx Park's own already-confirmed verdict (`bronx-park-verdicts.md:19`). Attribute it there, not here. |
| …"on the condition it be used as a zoo and botanical garden" | **REFUTED as sourced.** The finder places this clause immediately after the quotation. The sentence ends "…that would soon become part of New York City." **Correction: the cited sentence carries no condition. Drop the clause.** — https://en.wikipedia.org/wiki/Fordham_University |
| **Rose Hill reduced by the transfer, and its resulting position** | **CONFIRMED.** "At one time spanning over 100 acres" and "Situated on 85 acres (34.4 ha)" and "immediately west of the Bronx Zoo and the New York Botanical Garden" — the reduction and the acquisition sit in the same sentence, so the causal link is the source's, not the finder's. **One correction: the article says "over 100 acres", not 106.** The 106-acre figure is a separate sentence about the 1839 farm purchase and is also confirmed; do not merge them into "reduced from 106 to 85". |
| **Fordham Road runs between the Zoo and the Garden** | **REFUTED as Fordham-side corroboration.** Fordham Road's own article says: "**The Bronx Zoo and New York Botanical Garden are at the eastern terminus of Fordham Road in Bronx Park.**" A targeted re-fetch confirms **no sentence** in that article says the road runs between, divides or bisects them. **Correction: the Fordham-side wording is "at the eastern terminus of Fordham Road in Bronx Park."** The "bisects" fact remains separately confirmed on Bronx Park's own article (`bronx-park-verdicts.md:22`) and may still be published there — but it is not independently corroborated from Fordham, and the finder's framing overstated it. — https://en.wikipedia.org/wiki/Fordham_Road |

**Ruling: the tie holds. Bronx Park can take its third outbound link.** Two of
three claims are confirmed outright and the third is confirmed in corrected form.

**But the link note must be built on Fordham Road, not on Rose Hill.** Under §0,
Rose Hill is not in `fordham-heights`, so a link note resting on the campus
would trace to a place this file does not publish. The clean, in-scope tie is
the road: "Fordham Road… runs west-east from the Harlem River to Bronx Park" and
"The Bronx Zoo and New York Botanical Garden are at the eastern terminus of
Fordham Road in Bronx Park" — both confirmed, both about a place that survives
here. Use those.

---

## Tally

| Place | Boundary | Survives here? |
|---|---|---|
| Fordham University — Rose Hill | not `fordham-heights` (east of Webster Ave, north of Fordham Rd) | **no** |
| Edgar Allan Poe Cottage | `fordham-manor` | **no** |
| Poe Park | `fordham-manor` | **no** |
| Grand Concourse (boulevard) | `fordham-heights` (historic district refuted) | **yes** |
| Paradise Theater | `fordham-heights` | **yes** |
| Fordham Plaza | contested `fordham-manor` / `belmont` | **no** |
| Bronx Library Center | `fordham-manor` | **no** |
| Fordham Road (shopping corridor / BID) | `fordham-heights` | **yes** |
| Monroe University | `fordham-heights` (marginal) | **yes** |

**Surviving places: 4 — Grand Concourse (boulevard), Paradise Theater, Fordham
Road (shopping corridor / BID), Monroe University.**

**This does not clear six. `tier: "town-page"`.**

Total claims adjudicated: **76.** Confirmed **62**, refuted **3**, uncertain
**11**. Confirmation rate 82% — not perfect, which is the point.

**And note the shape of what survives: a boulevard, a road, a movie palace and a
university with no published address.** Two of the four are thoroughfares. The
orientation-page floor is 3 outbound links and a 90-word intro, and this page
faces exactly the test Bronx Park stalled on. The three outbound links are
reachable — Bronx Park (via Fordham Road's eastern terminus), Belmont (Fordham
Plaza and Rose Hill both sit on the shared edge and can be named as adjacent
without being claimed), and Mott Haven or Concourse (via the Grand Concourse
running south to East 138th Street). The 90-word intro is achievable from the
Fordham Road / Grand Concourse crossing and the Paradise Theater alone. I flag it
as tight, not as blocked.

---

## What changed because I checked

1. **The headline boundary ruling went against the page.** Poe Cottage, Poe Park
   and the Bronx Library Center all sit in `fordham-manor` — out of scope, no
   home, will not ship. The neighborhood loses its most recognisable attraction.
2. **A second boundary problem the finder did not flag.** CB5's *eastern*
   boundary is Webster Avenue, and Fordham Road's own article puts Fordham Plaza
   — and by its own words Fordham University directly opposite — east of it. Two
   more places out. The finder flagged one line; there were two.
3. **The Grand Concourse Historic District is in the wrong neighborhood.** NRHP
   ref #87001388 covers 730–1675 Grand Concourse, location "Concourse". Poe
   Cottage is at 2640 and the Paradise at 2403. Every historic-district clause
   must be stripped from this file.
4. **The Fordham-side "runs between the Zoo and the Garden" claim is refuted.**
   The article says "at the eastern terminus of Fordham Road in Bronx Park".
   Bronx Park still ships — but its link note must be built on Fordham Road and
   must use the corrected wording.
5. **A condition attached to the 1884 transfer does not exist in the cited
   sentence.** "on the condition it be used as a zoo and botanical garden" is
   the finder's, not the source's.
6. **The Grand Concourse superlative "conflict" dissolved on a direct re-read.**
   Largest-in-borough, longest-in-borough and third-largest-in-city are three
   compatible statements, not a contradiction.
7. **Monroe University's consolidation is 1977, not 1967** — two events ten
   years apart, presented by the finder as one.
8. **The Bronx Library Center is "the largest library in the borough", not "the
   largest public library building in the Bronx"**, and its LEED year rests only
   on NYPL's own page — barred by rule 4.
9. **In the finder's favour, twice.** Its Paradise Theater designation dates
   survived a re-fetch that initially appeared to transpose them — a second,
   targeted fetch confirmed the finder was right and my first fetch was wrong. And
   I found a **fifth** boundary source it missed (Fordham Road IND station,
   Locale "Fordham Heights") which strengthens rather than weakens its flag.
10. **The Poe Cottage date conflict is not the shape it was expected to be.**
    Neither 1797 nor 1812 traces to a designation record — both are Wikipedia,
    and the records that would settle it were unreachable. Uncertain; publish no
    date.
