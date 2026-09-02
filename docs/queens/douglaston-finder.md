# Douglaston, Queens — FINDER dossier (wave 5, Community District 11)

**Role: FINDER only.** Nothing below is adjudicated, confirmed, or verified. Every item is a
**candidate**. Verdicts belong to the verifier. Where sources disagree I record *both* and resolve
*neither*.

**Quotation convention (read this before using anything below):**
- Text inside `"…"` following the marker **QUOTE** (alone, or as `QUOTE (source):`) is copied
  verbatim from the cited source.
- Text following **PARAPHRASE** is my own wording. It is NOT a quote and must never be presented
  as one.
- **QUOTE [OCR]** marks verbatim text from a scanned PDF whose OCR is visibly corrupt. The
  characters are as the OCR produced them. Do not quote these strings in prose without
  re-checking the original page image.
- **DERIVED:** marks a result I computed from open data (geocode + point-in-polygon, or geometry
  arithmetic). It is evidence, not a sentence any source wrote, and must never be quoted.
- Where a source contradicts itself or another source I record **both** strings and pick neither.

**Counts: 272 candidate facts (F1–F272, contiguous) across 78 candidate places (P1–P78,
contiguous), plus a 30-row contested-assignment register (C1–C30) in §14.**

---

## 0. METHOD AND LIMITATION DISCLOSURE

**F1.** This session's WebSearch budget was **already exhausted (200 of 200 calls) before my first
search**. The single WebSearch I attempted returned the budget error. Everything below was
therefore retrieved by **direct HTTP fetch with a browser user-agent** against specific URLs, by
**WebFetch** where that worked, plus:

- the **Wikipedia action API** (`action=query&prop=extracts&explaintext=1`; `action=parse&prop=wikitext`),
- the **NYC Open Data / Socrata API** — LPC Individual Landmark Sites `buis-pvji`; LPC Historic
  Districts `skyk-mpzq`; LPC Individual Landmark and Historic District Building Database
  `gpmc-yuvp`; DCP 2020 NTAs `9nt8-h7nd`; Parks Properties `enfh-gkve`; PLUTO `64uk-42ks`;
  DOHMH restaurant inspections `43nn-pn8j`,
- **`s-media.nyc.gov/agencies/lpc/lp/<n>.pdf`**, which served the *full original LPC designation
  reports* (this is the single richest vein in the dossier — see §0.2),
- the **NYC DCP GeoSearch** geocoder (`geosearch.planninglabs.nyc/v2/search`).

**Consequence: coverage is very deep on LPC / DCP / Parks primary sources and thin on press.**
Local outlets (QNS, Queens Chronicle, TimesLedger / *Little Neck Ledger*) and the *New York Times*
could not be searched without WebSearch, and my URL guesses at them 404'd. **There is no press
reporting in evidence in this dossier.** Any claim below that reads like journalism is in fact
Wikipedia, and is labelled as such.

### 0.1 Failed retrievals, recorded so the verifier does not repeat them

**F2.** All four Douglaston **National Register nomination PDFs** are unavailable. Requests to
`https://npgallery.nps.gov/NRHP/GetAsset/NRHP/<refnum>_text` for refnums **83001760**
(Allen-Beville House), **00001016** (Douglaston Hill HD), **05000937** (Douglaston HD) and
**83004149** (Cornelius Van Wyck House) each returned the **identical 22,151-byte PDF**
(md5 `5a5935ef18defe9117af9f29969055d5`) whose entire text is —
QUOTE: `"The PDF file for this National Register record has not yet been digitized."`
**The primary NRHP nomination text is therefore NOT in evidence for any Douglaston listing.**
Everything below attributed to "NRHP" comes from the Wikipedia NRHP listing table or from the
individual Wikipedia articles, and is flagged as such each time.

**F3.** The **NYC Parks historical-sign text for Alley Pond Park is not served**.
`/parks/alley-pond-park/history`, `/parks/Q001/history` and `/parks/Q001A/history` all return the
page chrome with the line QUOTE: `"This text is part of Parks' Historical Signs Project and can be
found posted within the park."` and **no body text**, because Alley Pond Park is registered as
Park ID `Q001GROUP`, property type `Park Group`. The Udalls Park Preserve sign text (`Q452`) *does*
serve and is used heavily below.

**F4.** `douglastonclub.org` (both `http` and `https`) resets the connection. **There is no
retrievable official website for the Douglaston Club.** Do not cite one.

**F5.** These hostnames do not resolve at all: `douglastonplaza.com`, `douglastonplazany.com`,
`douglastoncommunitychurch.org`, `stanastasiaqueens.org`, `littleneckparade.org`,
`littleneckdouglastonmemorialdayparade.org`. **There is no retrievable official website in
evidence for Douglaston Plaza, the Douglaston Community Church, or St. Anastasia's.**

**F6.** `mta.info` returns HTTP 403 to this client; `nycgovparks.org` returns 403 to WebFetch but
200 to a direct fetch with a browser user-agent. **No MTA-sourced fact is in evidence.**

**F7.** The Queens Public Library location pages (`queenslibrary.org/…/douglaston`) returned a
244-byte stub. **No QPL-sourced fact is in evidence**; the branch addresses below come from
Wikipedia only.

### 0.2 What DID retrieve — the two primary designation reports

**F8.** `http://s-media.nyc.gov/agencies/lpc/lp/1957.pdf` served the complete
**Douglaston Historic District Designation Report, LP-1957, June 24, 1997** (169,722,826 bytes;
Volume I text extracted cleanly, 69 KB of digital text — it is NOT a scan).

**F9.** `http://s-media.nyc.gov/agencies/lpc/lp/2155.pdf` served the complete
**Douglaston Hill Historic District Designation Report, LP-2155, December 14, 2004**
(33,348,309 bytes; 110 KB of clean digital text).

**F10.** `.../lp/0144.pdf` and `.../lp/0944.pdf` served the 1966 Van Wyck House and 1977
Allen-Beville House designation reports. **Both are scans and both OCR badly** — the 1977 report
in particular renders "Allen-Beville" as "Atlen•Bevft 1e", "A11en•BevJlte", "AHen•Bevtl le" and
"Allen·Bevflle" within a single page. Quotes from these two are marked **QUOTE [OCR]**.

### 0.3 The geocode + NTA resolver used throughout

Because this wave's stated hazard is the Bayside/Douglaston line (and, as it turns out, a second
and larger Douglaston/**Little Neck** line), I built a reproducible test and ran every candidate
address through it:

1. geocode the street address with **DCP GeoSearch**, taking the returned point, BBL, ZIP, and the
   `neighbourhood` label GeoSearch attaches (a Who's-On-First name — this is the closest thing to
   a machine-readable "which neighborhood is this in" answer that exists in city data);
2. test that point against the **DCP 2020 Neighborhood Tabulation Area** polygons for Queens
   (`9nt8-h7nd`), point-in-polygon with hole handling.

Results are labelled **DERIVED (NTA)** and **DERIVED (WOF)**. Script at
`/private/tmp/claude-501/-Users-charmalloc-dev-ethos/cf4d99e1-2917-4a8e-9a40-64cfbdb1b1c7/scratchpad/dgl_kit.py`.

**F11. The single most important limitation of the NTA test for this page:** DCP's NTA is named
**"Douglaston-Little Neck" (QN1103)**. It is ONE polygon covering **both** neighborhoods.
A DERIVED (NTA) result of `QN1103` therefore proves a point is *not in Bayside* and *not in Alley
Pond Park* — it says **nothing** about whether the point is in Douglaston or in Little Neck.
For the Douglaston/Little Neck split the only machine-readable signal I found is the GeoSearch
`neighbourhood` (WOF) label, which is *not* an official city boundary. Treat it as one source's
opinion, not as a ruling.

---

## 1. BOUNDARIES — AND THE THREE LINES THAT MATTER

### 1.1 What the sources say the neighborhood is

**F12.** English Wikipedia has **no article titled "Douglaston, Queens"** — that title is a
redirect. The article is **"Douglaston–Little Neck, Queens"**, i.e. Wikipedia treats Douglaston and
Little Neck as one neighborhood with two sections.
Source: `https://en.wikipedia.org/wiki/Douglaston%E2%80%93Little_Neck,_Queens`

**F13.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Douglaston–Little Neck is a neighborhood in
the northeastern part of the New York City borough of Queens. The community is on the North Shore
of Long Island, bordered to the east by Great Neck in Nassau County, to the south by Glen Oaks and
the North Shore Towers, and to the west by Bayside."`

**F14.** QUOTE (same): `"The neighborhood has two main sections. Little Neck generally refers to
the area east of Marathon Parkway and/or north of Northern Boulevard, while Douglaston is the rest
of the neighborhood; these classifications may overlap depending on different interpretations of
boundaries."`
*Note for the verifier: this sentence is internally strange — read literally it places the
Douglas Manor peninsula (which is north of Northern Boulevard) in Little Neck. It is the clearest
in-evidence statement that the Douglaston/Little Neck line is unsettled.*

**F15.** QUOTE (same): `"Douglaston–Little Neck is bounded by Cross Island Parkway to the west,
Grand Central Parkway to the south, the New York City-Nassau County border to the east, and Little
Neck Bay to the north."`

**F16.** QUOTE (same): `"Douglaston is considered the area west of Marathon Parkway and north of
Grand Central Parkway. According to The New York Times, Douglaston has six distinct neighborhoods.
Douglas Bay, Douglas Manor, and Douglaston Hill are north of Northern Boulevard, on the peninsula
abutting Little Neck Bay. Douglas Manor takes up most of the peninsula north of the Long Island
Rail Road's Port Washington Branch, while Douglaston Hill takes up a small section between the
LIRR and Northern Boulevard. Douglaston Park is the area between Northern Boulevard and Interstate
495 (I-495, the Long Island Expressway). There are two areas south of I-495, Winchester Estates and
an area simply called Douglaston. Winchester Estates is west of Douglaston Park and the remainder
of the area south of I-495 is without a distinct name other than Douglaston."`
*The underlying NYT piece is cited by Wikipedia but I could not retrieve it. This is Wikipedia
reporting the NYT, not the NYT.*

**F17.** QUOTE (same): `"Little Neck is the area east of Marathon Parkway and north of Grand
Central Parkway. Little Neck itself has three subsections: Pines, Westmoreland, and Little Neck
Hills."`
*Note F14 and F16/F17 give **two different** Marathon Parkway rules ("east of Marathon Parkway
and/or north of Northern Boulevard" vs "east of Marathon Parkway"). Wikipedia contradicts itself
inside one article.*

**F18.** QUOTE (same): `"Douglaston–Little Neck is in Queens Community District 11 and its ZIP
Codes are 11362 and 11363."`

**F19.** QUOTE (same): `"The section between Northern Boulevard and Long Island Expressway is
covered by 11362, while the Little Neck peninsula north of Northern Boulevard is within 11363."`
*Note the source calls the Douglas Manor peninsula "the Little Neck peninsula." LPC uses the same
phrase (see F20). The peninsula that Douglas Manor sits on is called the Little Neck peninsula in
both primary and tertiary sources. That is a naming trap, not a boundary claim.*

**F20.** QUOTE (LPC, LP-2155, p. 6): `"The Native American presence on the Little Neck peninsula,
today known as Douglaston, included the Matinicoc,"`
Source: `http://s-media.nyc.gov/agencies/lpc/lp/2155.pdf`

**F21.** QUOTE (LPC, LP-1957, p. 5): `"The Native American presence on the Little Neck peninsula
today known as Douglaston included the Matinecoc,"`
Source: `http://s-media.nyc.gov/agencies/lpc/lp/1957.pdf`

**F22.** QUOTE (LPC, LP-1957, Introduction): `"The Douglaston Historic District contains more than
600 houses set along landscaped streets on a mile-long peninsula extending into Little Neck Bay,
at the northeastern edge of Queens adjoining Nassau County."`

**F23.** A **source error worth knowing about before quoting LP-1957.** QUOTE (LPC, LP-1957,
Introduction): `"Douglaston's location on a peninsula jutting into Flushing Bay at the eastern
border of Queens County is an important factor in establishing the character of the district."`
The peninsula juts into **Little Neck Bay**, as the same report says one paragraph earlier (F22).
"Flushing Bay" is an error in the designation report itself. **Do not quote this sentence.**

**F24.** QUOTE (LPC, LP-2155, Introduction): `"The Douglaston Hill Historic District, located in
northeastern Queens near the border with Nassau County, is significant for its principles of
mid-nineteenth and early-twentieth-century community planning and development, and as an example
of an early twentieth century suburb."`

### 1.2 The Bayside line — DERIVED geometry (this is the strongest evidence in the dossier)

**F25. DERIVED (NTA geometry).** In DCP's 2020 Neighborhood Tabulation Areas, Queens Community
District 11 is approximated by CDTA **QN11 "Auburndale-Bayside-Douglaston (CD 11 Approximation)"**
and contains exactly five NTAs:
- `QN1101` Auburndale
- `QN1102` Bayside
- `QN1103` Douglaston-Little Neck
- `QN1104` Oakland Gardens-Hollis Hills
- `QN1191` **Alley Pond Park** (`ntatype` = 9, i.e. a park-only tabulation area)

**F26. DERIVED (NTA geometry). The Bayside NTA and the Douglaston-Little Neck NTA do not touch.**
Vertex sets: `QN1102` has 365 distinct vertices, `QN1103` has 912, `QN1191` has 706.
- `QN1102` ∩ `QN1103` shared vertices: **0**
- `QN1102` ∩ `QN1191` shared vertices: **62**
- `QN1103` ∩ `QN1191` shared vertices: **92**

**F27. DERIVED (NTA geometry).** Minimum distance from any Bayside NTA vertex to the
Douglaston-Little Neck NTA boundary: **29.7 m**. The reciprocal minimum is the same, 29.7 m.
Minimum distance from the Alley Pond Park NTA to each of the other two: **0.0 m** (they share
boundary exactly). The point of nearest approach between Bayside and Douglaston-Little Neck is at
**lon −73.753770, lat 40.765305** — on Northern Boulevard at the Alley Creek crossing, roughly
231st Street.

**F28. DERIVED, plain reading of F25–F27:** in official city tabulation geography, **Bayside and
Douglaston are not adjacent**. Alley Pond Park lies between them along their entire common front,
and the two residential NTAs come within 30 m of each other at exactly one place — Northern
Boulevard over Alley Creek — without ever meeting. *This is evidence for the verifier and the
author to weigh. I am not ruling on it.*

**F29.** Wikipedia's Alley Pond Park article states the same relation in words.
QUOTE: `"The park is bordered to the east by Douglaston, to the west by Bayside, to the north by
Little Neck Bay, and to the south by Union Turnpike."`
Source: `https://en.wikipedia.org/wiki/Alley_Pond_Park`
*i.e. Wikipedia has the park **bordered by** both, not **in** either.*

**F30.** The NYC Parks historical sign for Udalls Park Preserve names the peninsulas as three
separate things. QUOTE: `"These are the peninsulas of Great Neck, Bayside, and Douglaston that
flank the pre-glacial river valley of Little Neck Bay and Udall's Cove."`
Source: `https://www.nycgovparks.org/parks/udalls-park-preserve/history`

### 1.3 Alley Pond Park — the marquee item the brief asked to be ruled on

I record the evidence and **do not rule**.

**F31. DERIVED (NTA).** Alley Pond Park has its own DCP tabulation area, `QN1191`, `ntaname`
"Alley Pond Park", `ntatype` **9**. So does Flushing Meadows-Corona Park (`QN8191`) and Forest Park
(`QN8291`).

**F32. DERIVED (NTA) — and this is the difference the verifier will need.** The *CDTA* assignments
are NOT parallel:
- Flushing Meadows-Corona Park `QN8191` → CDTA **QN81**, `cdtaname` = `"QN81 Flushing Meadows-Corona Park (JIA 81 Approximation)"`
- Forest Park `QN8291` → CDTA **QN82**, `cdtaname` = `"QN82 Forest Park (JIA 82 Approximation)"`
- Alley Pond Park `QN1191` → CDTA **QN11**, `cdtaname` = `"QN11 Auburndale-Bayside-Douglaston (CD 11 Approximation)"`

So Flushing Meadows-Corona Park and Forest Park are **Jointly Interested Areas** with their own
CDTAs, sitting outside any community district. **Alley Pond Park is not a JIA.** It is a park NTA
*inside* Community District 11. The wave-3 and wave-4 precedents (FMCP, Forest Park) rest on a
structural feature that Alley Pond Park **does not share**. Whether that changes the ruling is for
the verifier and the coordinator, not for me.

**F33.** QUOTE (NYC Parks Properties dataset `enfh-gkve`, record `Q001`): `signname` =
`"Alley Pond Park"`, `acres` = `"635.514"`, `typecategory` = `"Flagship Park"`, `location` =
`"Little Neck Bay to Springfield Blvd, Union Tpke"`, `zipcode` =
`"11361, 11362, 11363, 11364, 11426"`, `communityboard` = `"411"`.

**F34.** The Parks *website* gives a different community-board answer from the Parks *dataset*.
The page `https://www.nycgovparks.org/parks/alley-pond-park` states `Community Board: 11, 13` and
`Park ID: Q001GROUP`, `Property Type: Park Group`. The dataset record `Q001` says `411` only.
**Record both; resolve neither.**

**F35.** Wikipedia gives a *third* acreage. QUOTE: `"Alley Pond Park is the second-largest public
park in Queens, New York City, occupying 655.3 acres (265.2 ha)."` Parks says 635.514 acres (F33);
Wikipedia's Douglaston–Little Neck article says QUOTE: `"a 635-acre (2.57 km2) wildlife and bird
sanctuary"`. **Three figures: 635.514, 635, 655.3.**

**F36. DERIVED (NTA + WOF).** Two well-known "Alley Pond" institutions geocode **into the Alley
Pond Park NTA, not into Douglaston-Little Neck**:
- `229-10 Northern Boulevard` (Alley Pond Environmental Center) → GeoSearch label
  `"229-10 NORTHERN BOULEVARD, Alley Pond Park, NY, USA"`, WOF neighbourhood **"Alley Pond Park"**,
  ZIP 11363, BBL 4075700001 → NTA **QN1191 Alley Pond Park**.
- `232-01 Northern Boulevard` (Parks golf/driving-range parcel, see P41) → WOF neighbourhood
  "Douglaston" but NTA **QN1191 Alley Pond Park**. *The two signals disagree on this one lot.*

**F37.** APEC's own website places itself in Douglaston. QUOTE: `"Click here to learn more and
visit our center at 229-10 Northern Boulevard, Douglaston, NY 11362!"`
Source: `https://www.alleypond.org/`
*Note APEC writes ZIP 11362; USPS/GeoSearch return 11363 for that address. Both recorded.*

**F38. DERIVED (NTA).** Douglaston Park Golf Course likewise straddles: the Parks record `Q411`
gives `location` `"61 Ave. bet. Marathon Pkwy., Commonwealth Blvd. and 242 St."`, ZIP 11362,
CB 411; but the address `6710 Douglaston Parkway` geocodes with WOF neighbourhood
**"Alley Pond Park"** and NTA **QN1191**, while `63-20 Marathon Parkway` (the clubhouse address in
DOHMH and PLUTO) geocodes WOF **"Douglaston"**, NTA `QN1103`. **The golf course is split by the
NTA line.**

### 1.4 The Little Neck line — larger and more consequential than the Bayside line

The brief warns about Bayside. The evidence says the **Little Neck** line is where Douglaston
actually leaks, because the two share a single NTA (F11) and because the entire Northern Boulevard
commercial strip sits on it.

**F39. DERIVED (WOF), the sharpest single result in the dossier.** GeoSearch's neighbourhood label
flips from "Douglaston" to "Little Neck" on Northern Boulevard **between house number 249-17 and
house number 250-01**:
- `248-09`, `248-25`, `249-11`, `249-17` Northern Boulevard → **"Douglaston"**
- `250-01`, `250-10`, `251-03`, `251-09`, `251-13`, `251-18`, `251-20`, `251-28`, `252-01`,
  `252-11`, `252-20`, `252-29`, `253-05`, `253-07`, `253-09`, `253-11`, `253-13`, `253-21`,
  `253-24`, `253-25`, `253-32`, `254-04`, `254-12`, `254-18`, `254-19`, `254-22`, `255-05`,
  `255-07`, `255-09`, `255-13` Northern Boulevard → **"Little Neck"**

Every one of those addresses is in NTA `QN1103` "Douglaston-Little Neck", so the NTA test cannot
separate them. **The commercial heart of the strip — roughly 250th Street eastward — is assigned to
Little Neck by the only machine-readable source, and Little Neck is outside this corpus.**

**F40. DERIVED (WOF).** Same flip on the north–south streets:
- `Marathon Parkway`: `46-19` → "Little Neck"; `56-01` → "Little Neck"; `56-07`, `56-09`, `56-21`
  → "Little Neck"; **but** `57-04` → **"Douglaston"**; `61-20` → **"Douglaston"**.
  *The Marathon Parkway assignments are not monotonic — 56-xx reads Little Neck and 57-04 reads
  Douglaston. Flagged, not resolved.*
- `Little Neck Parkway`: `39-02`, `58-25` → "Little Neck".
- `Horace Harding Expressway`: `249-00` through `254-65` → "Little Neck"; **but** `242-24` →
  **"Douglaston"**.
- `61 Avenue`: `242-02` → "Douglaston"; `249-15` → "Little Neck".

**F41.** Wikipedia's rule (F14/F16, "east of Marathon Parkway") and the WOF line (F39/F40) **do not
agree**. Marathon Parkway meets Northern Boulevard at about house number 245; WOF puts the flip at
about 250. Under Wikipedia's rule 248-25 and 249-17 Northern Boulevard are Little Neck; under WOF
they are Douglaston. **Record both. Resolve neither.**

### 1.5 What is outside the corpus, per the brief

**F42.** QUOTE (Wikipedia): `"bordered to the east by Great Neck in Nassau County"` — Great Neck,
Kings Point, Saddle Rock and Great Neck Estates are **Nassau County** and outside this corpus.

**F43.** QUOTE (Udalls Cove Preservation Committee): `"Much of the area has been acquired by New
York State and City, and the Village of Great Neck Estates, and is now protected as the Udalls Cove
Park and Preserve."` Source: `https://www.udallscove.org/`
*Part of the Udalls Cove preserve is therefore in Nassau County and outside the corpus.*

**F44.** QUOTE (NYC Parks, Udalls Park Preserve sign): `"In 1833, Richard Udall, for whom the cove
is named, bought a mill formerly owned by the Allen family on the eastern side of the cove. The
mill, now called the Saddle Rock Mill, remained in the Udall family until 1950, when it was donated
to the Nassau County Historical Society."`
**The Saddle Rock Grist Mill is in Nassau County. It is outside this corpus.** Douglaston's page
must not claim it.

**F45. DERIVED (NTA).** Control checks confirming the resolver separates Bayside correctly:
`45-06 215th Street` (111th Precinct station house) → WOF "Bayside", NTA `QN1102` Bayside.
`61-15 233rd Street` → WOF "Bayside", NTA `QN1104` Oakland Gardens-Hollis Hills.

---

## 2. NATIVE AMERICAN AND COLONIAL HISTORY

**F46.** QUOTE (LPC, LP-2155, p. 6): `"The Native American presence on the Little Neck peninsula,
today known as Douglaston, included the Matinicoc, one of the Munsee-speaking groups of western
Long Island. Their land during the contact period (1550 - ca. 1750) reputedly extended from
Newtown eastward to the Nissequogue River and southward to the center of Long Island. Their name
roughly translates to 'at the hilly land.'"`

**F47.** QUOTE (LPC, LP-1957, p. 5): `"The Matinecoc, who farmed the peninsula and apparently also
produced wampum, were summarily evicted in the 1660s by Thomas Hicks, later Judge Hicks, in what
has been described as the only such seizure of property recorded in Flushing town records."`

**F48.** QUOTE (LPC, LP-2155, p. 6): `"Colonial settlement along the northeastern shore began near
Alley Pond in 1647, and a decade later when, in 1656, the Dutch assigned to Thomas Hicks a
peninsula then called 'Little Madman's Neck,' which encompassed much of the present-day
Douglaston. Hicks evicted the Matinecoc Indian Tribe from its fishing ground on Little Neck Bay in
the 1660s in what is the only such seizure of property documented in Flushing town records."`

**F49.** Wikipedia gives a different spelling of the place-name and a different gloss.
QUOTE: `"Soon after, the British and Dutch gained control of the Matinecock lands peacefully,
except for a small area known as Madnan's Neck (possibly a shortened form of Native American name
for the area, Menhaden-ock, or 'place of fish'). Thomas Hicks, of the Hicks family that eventually
founded Hicksville, and a band of armed settlers forcibly drove out the Matinecock in a battle at
today's Northern Boulevard and Marathon Parkway."`
**Four spellings of the place-name are in evidence: "Little Madman's Neck" (LP-2155), "Madnan's
Neck" (Wikipedia), "Madnan Neck" (LP-0944 [OCR]), "Madnan's Neck". Three spellings of the people:
"Matinicoc" (LP-2155 body), "Matinecoc" (LP-1957 body and both reports' footnotes), "Matinecock"
(Wikipedia and both reports' footnote 4/1: QUOTE (LP-1957 fn 1): `"Or 'Matinecock.'"`).**

**F50.** QUOTE [OCR] (LPC, LP-0944, Allen-Beville House, 1977): `"The aroa was known as Madnan Neck
to the Indians. Ourfng the 18th century It was eatled Thorne•, Neck. ~nd later Wllken•s Ntaek,
after Jacob Thor"o ~md t.fllllam Wilkens, respeetlvtaly, In the t9th century It was first known as
Lfttte Neck and later as Doug11!ston,"`
PARAPHRASE of the same passage, de-OCR'd: the area was known as Madnan Neck to the Indians; during
the 18th century it was called Thorne's Neck, and later Wilkens's Neck, after Jacob Thorne and
William Wilkens respectively; in the 19th century it was first known as Little Neck and later as
Douglaston.
*The four successive names — Madnan Neck → Thorne's Neck → Wilkens's Neck → Little Neck →
Douglaston — appear in no other source I retrieved. The OCR is bad enough that the verifier should
re-read the page image before this goes into prose.*

**F51.** QUOTE (NYC Parks, Udalls Park Preserve sign): `"In 1645, the Dutch established the town of
Flushing, and land in Little Neck was granted to settlers such as Thomas Hicks and Richard Cornell.
The Mattinecock Indians, led by Chief Tackapousha (d. 1694), disputed these claims and brought the
issue before Governor Thomas Dongan (1634-1715). Tackapousha was at first able to delay white
settlement but after a few years, Thomas Hicks led a force of Europeans in a raid against the
Indian settlement, and forcibly took the land."`
*Note a fifth spelling — "Mattinecock" — and a **1645** founding date for Flushing where LP-2155
says **1643**: QUOTE (LP-2155): `"Vlissingen (Flushing), founded in 1643"`. Both recorded.*

**F52.** QUOTE (LPC, LP-2155, p. 6): `"By the mid-1600s, several English and Dutch colonial towns
and farming villages had been established in what is now northeastern Queens, such as Mespat
(Maspeth), founded in 1642, Vlissingen (Flushing), founded in 1643, and Jamaica, founded in 1650."`

**F53.** QUOTE (LPC, LP-2155, p. 6): `"In 1683, Queens County was established as one of ten English
counties, divided into five towns: Newtown, Jamaica, Flushing, Hempstead, and Oyster Bay, made up
of various villages and settlements. The Alley Pond settlement, including present-day Douglaston,
lay within the town of Flushing."`

**F54.** QUOTE (LPC, LP-2155, p. 6): `"During the Revolutionary War, Queens County served as a
staging ground for British troops, and by the war's end in 1783, the extensive tracts of primeval
forest that had characterized the county had been devastated and many of its farms had been
pillaged."`

**F55.** The Matinecoc burial ground and its removal. QUOTE (LPC, LP-1957, p. 5): `"In the 1930s,
according to local histories, a Matinecoc burial ground was destroyed to make way for a widening
of Northern Boulevard, and the remains reinterred in the cemetery of Zion Church."`

**F56.** LP-2155 adds the marker's design. QUOTE (LP-2155, footnote 7): `"In the 1930s, according
to local histories, a Matinecoc burial ground was destroyed to make way for a widening of Northern
Boulevard, and the remains re-interred in the cemetery of Zion Church under a stone monument
depicting a tree growing from a split rock, their tribal mark."`

**F57.** Wikipedia adds the location, the newspaper photograph and the inscription.
QUOTE: `"An old Matinecock cemetery remained on Northern Boulevard between Cornell Lane and Jesse
Court. One of the last photographs of the cemetery was taken by the Daily News in August 1931, a
few months before it was removed to make room for a widened Northern Boulevard. The remains from
the cemetery were moved to the Zion Episcopal Church of Douglaston and placed under a stone marker
that reads 'Here rest the last of the Matinecoc.'"`
*The date differs: LPC says "the 1930s"; Wikipedia says the photograph is August 1931 and removal
followed months later. LPC footnotes its claim to a 1992 Zion Church history and a 1956 Douglas
Manor Association history; Wikipedia's Daily News citation I could not retrieve.*

**F58.** QUOTE (LPC, LP-1957, footnote 2): the Commission's own 1996 archaeological key records
`"Site No. 5, on the tip of the peninsula: 'Habitation site and shell midden,' and Site No. 6, on
the tip of the peninsula: 'Shell midden,'"` both identified in Arthur C. Parker, *The
Archaeological History of New York* (1922), vol. 2, with a further `"shell midden on the western
shoreline"` identified by Reginald Pelham Bolton.

**F59.** QUOTE (NYC Parks, Udalls Park Preserve sign): `"The earliest human inhabitants of this area
probably arrived about 4,000 years ago, when a deciduous forest first appeared here. The people
came during the warmer months, hunting white-tailed deer and game birds such as wild turkey that
lived in the forest. Later visitors came to harvest the waters' clams and oysters."`

**F60.** QUOTE [OCR] (LPC, LP-0944): `"Madn~tn Neek was a favored 1oeatton of the Matfnfeoc tndfans
of the Five Natfons \'lhO prior to the 18th c:entury used the vast oyster and e1am be<fs to supply
them with food and '\tampum." the sheUs used ~sa form of currency."`
*The phrase "of the Five Nations" is a claim no other source makes and is historically contested
(the Matinecock were Munsee/Lenape, per LP-2155 F46). Flagged.*

---

## 3. THE VAN ZANDT AND DOUGLAS ESTATES (1813–1906)

**P1. Wynant Van Zandt House / the Douglaston Club — 600 West Drive, Douglaston, NY 11363.**
DERIVED (NTA/WOF): geocodes lon −73.752214, lat 40.776536, BBL 4080310001, ZIP 11363, WOF
neighbourhood **"Douglaston"**, NTA `QN1103`. No source assigns it elsewhere.

**F61.** QUOTE (LPC, LP-2155, p. 6): `"In 1813, ownership of the land presently comprising the
Douglaston Hill Historic District and its environs passed to Wynant Van Zandt III (1767-1831). A
prominent New York City merchant, he had been a city alderman and a vestryman of Trinity Church in
Manhattan before retiring to Little Neck as a gentleman farmer. He built a large manor in 1819,
which survives as the Douglaston Club (600 West Drive, located in the Douglaston Historic
District)."`

**F62.** QUOTE (LPC, LP-1957, p. 5): `"The property seized by Thomas Hicks in the 1660s passed
through the hands of several of his family members, and several subsequent sales to other families,
before being acquired in 1813 by Wynant Van Zandt. In 1819 Van Zandt bought an adjoining farm from
the Van Wyck family."`

**F63.** QUOTE (LPC, LP-1957, p. 6): `"As a city alderman, Van Zandt served as chairman, starting
in 1803, of the building committee for City Hall, and in 1804 as chairman of a committee on water
supply, among other duties."`

**F64.** QUOTE (LPC, LP-2155, p. 7): `"In 1824, he financed the construction of a causeway across
the marsh, creating a more direct and efficient route to Flushing."` and, in footnote 10, QUOTE:
`"This causeway became a section of the North Hempstead Turnpike from Flushing, and was the
forerunner of today's Northern Boulevard."`

**F65.** QUOTE (LPC, LP-2155, p. 7): `"In 1829, he bequested land and funds for the construction of
Zion Episcopal Church, which was completed the following year."`

**F66. Spelling conflict on the name, four variants in evidence.**
- `"Wynant Van Zandt III (1767-1831)"` — LPC LP-2155
- `"Wynant Van Zandt"` — LPC LP-1957
- `"Wyant Van Zandt"` — Wikipedia, Douglaston–Little Neck
- `"Winant Van Zandt"` — LPC LP-0144 [OCR], 1966, and Wikipedia, Cornelius Van Wyck House
- `"Wynant Van Zandt"` — Wikipedia, Douglaston Manor Windmill (as `"Wyant Van Zandt"`)
**Do not present any one of these as the settled spelling without the verifier ruling.**

**F67.** QUOTE (LPC, LP-1957, p. 6): `"In May 1835, following Wynant Van Zandt's death, George
Douglas acquired the estate from Robert B. Van Zandt; the deed identifies Van Zandt as a 'farmer'
and Douglas as a 'gentleman.'"` Footnote 5, QUOTE: `"By deed of May 28,1835, for $38,000, Robert
Van Zandt 'farmer' sold the farm called Little Neck to George Douglas 'Gentleman.'"`

**F68.** Two obituaries of George Douglas, quoted by LPC. QUOTE (LP-1957, p. 6): `"One obituary, in
the Flushing Journal Weekly, described Douglas as 'what the world would call an eccentric man.'
Another, in the New York Evening Post, described him as a wealthy young man from Scotland, who
during a fifteen-year stay in Europe 'collected some very valuable pictures,' and later turned to
philanthropy."` Footnote 7 adds QUOTE: `"His philanthropic efforts included a $30,000 donation to
the American Bible Society."`

**F69. Acreage conflict on what George Douglas bought.**
- QUOTE (Wikipedia): `"In 1835, George Douglas bought 240 acres (0.97 km2) of land along with Van
  Zandt's mansion."`
- QUOTE (Wikipedia, Douglaston Manor Windmill): `"Eventually, George Douglas, a wealthy Scot,
  acquired the Van Zandt manor house and approximately 120 acres of land in 1835."`
- QUOTE (LPC LP-1957, quoting *Real Estate Record and Guide*, March 31, 1906): `"Title has just
  been taken to the Douglass [sic] homestead of about 180 acres by the Douglass Manor Co."`
- QUOTE [OCR] (LPC LP-0944): `"Portfons of hfs large estate of approxlmatt!ly 180 aero! ware
  offered as part of a vJ1Jage development scheme"`
- QUOTE (Wikipedia): `"the Rickert-Finlay Realty Company of Manhattan purchased 175 acres (0.71
  km2) of the Douglas' family holdings"`
**240 / 120 / 180 / 175 acres are all in evidence and they are not describing the same transaction.
Do not average them.**

**F70.** QUOTE (LPC, LP-1957, p. 6): `"Douglas's son, William Proctor Douglas, inherited the
property after his father's death in 1862. The younger Douglas served as vice-commodore of the New
York Yacht Club in 1871-74. During his tenure, Douglas Manor became a center for New York society
yachting and polo. In later years, Douglas rented out the estate house to a variety of
well-connected tenants, including European royalty."`

**F71.** QUOTE [OCR] (LPC, LP-0944): `"Wflllam P. Douglas attained national stature when htG yacht
'Sappho' successfully defeated Brtttsh challengers in 1876 and wen what has $lnce become the
Amerrca Cup."`
PARAPHRASE: William P. Douglas's yacht *Sappho* defeated British challengers in 1876 and won what
has since become the America's Cup.
*Caution: the historical record for *Sappho*'s America's Cup defence is **1871**, not 1876. The
report's own number may be an OCR corruption or an error in the 1977 text. **Flagged; do not
quote the year without checking the page image.***

**F72. The landscape and the specimen trees — the most distinctive material about the estate.**
QUOTE (LPC, LP-1957, p. 6): `"In 1869, Douglas hired landscape architect William McMillen to, in
the words of McMillen's daughter, 'superintend the Estate, improve driveways, and lay out plantings
and trees and ornamental shrubs.' McMillen was later associated with Frederick Law Olmsted and his
work on the park system in Buffalo, New York. Although McMillen spent six years working on the
estate, it is not known exactly what he undertook for Douglas."`

**F73.** QUOTE (LPC, LP-1957, p. 7): `"it appears that under Douglas's ownership the landscape was
characterized by 'an informal "English" look ... with English ivy, winterberry, Boston ivy and
wisteria.'"` (LPC quoting Wendy Darby, "Historic Landscape Report," 1994.)

**F74.** QUOTE (LPC, LP-1957, p. 7): `"It was also during Douglas's tenure that a number of exotic
specimen trees were planted on the property. Local histories suggest a connection with Samuel
Parsons (1819-1906), a pioneer horticulturist with a nursery in Flushing; Parsons owned land near
the Douglas Estate. The trees have been a distinguishing characteristic of Douglas Manor since
William Douglas's day."`

**F75.** The Rickert-Finlay sales brochure's own list of the trees. QUOTE (LP-1957, p. 11, quoting
a 1906 promotional brochure): `"Scotch Holly, Magnolia, Japanese Maidenhair, Chinese Cypress,
European Beech, Scarlet Maple, Horse Chestnut, Tulip, Lime, evergreens... Even Central Park does
not possess a greater variety of rare trees...."`

**F76.** A different tree list, from a much weaker source. QUOTE (Wikipedia, Douglaston Manor
Windmill): `"He adorned the area with the planting of exotic trees such as Gingko, copper beech,
and weeping beach (though only one of these survives to this day)."` *"weeping beach" is presumably
"weeping beech"; the article is poorly edited throughout (see F168).*

---

## 4. DOUGLASTON HILL AND THE VILLAGE OF MARATHON (1853–1930)

**P2. Douglaston Hill Historic District (LPC), LP-2155, designated December 14, 2004.**
**P3. Douglaston Hill Historic District (NRHP), refnum 00001016, listed 2000-08-31.**

**F77.** QUOTE (LPC Historic Districts dataset `skyk-mpzq`): `borough` = `"QN"`, `lp_number` =
`"LP-02255"`, `area_name` = `"Douglaston Hill Historic District Amendment"`, `status_of_` =
`"DESIGNATED"`, `desdate` = `"2007-01-30T00:00:00.000"`, `caldate` = `"2007-04-03T00:00:00.000"`,
`public_hea` = `"3/13/2007"`, `boundary_n` = `"AMENDMENT KNOWN AS BOTH LP-2155A AND LP-02255"`.
*Note the dataset's own `desdate` (2007-01-30) precedes its own `caldate` (2007-04-03) — the
dataset is internally inconsistent on this record. Also note the **base** Douglaston Hill district
LP-2155 is NOT in this dataset; only the amendment is.*

**F78.** QUOTE (LPC, LP-2155 cover/title page): `"DOUGLASTON HILL HISTORIC DISTRICT / Designation
Report / New York City Landmarks Preservation Commission / December 14, 2004"`, `"Text and building
profiles researched and written by Donald G. Presa"`, `"Photographs by Carl Forster"`, `"Map by
Kenneth Reid"`, `"Research Department / Mary Beth Betts, Director"`, `"ROBERT B. TIERNEY, Chair"`,
`"PABLO E. VENGOECHEA, Vice-Chair"`.

**F79.** QUOTE (LPC, LP-2155): `"Landmarks Preservation Commission / December 14, 2004, Designation
List 358 / LP-2155"`. The map caption reads QUOTE: `"Calendared: April 13, 2004 / Heard, August 3,
2004 / Designated: December 14, 2004"`.

**F80.** QUOTE (LPC, LP-2155, Summary): `"The Douglaston Hill Historic District consists of
thirty-one wood frame houses constructed largely between 1890 and 1930. Well-preserved
tum-of-the-century residential suburbs of free-standing wood-frame houses were once relatively
common in New York City, but are now becoming increasingly rare due to newer development or
inappropriate alterations. The majority of the houses were designed using either the Queen Anne,
neo-Colonial, or Arts & Crafts styles, making the district visually coherent."`
*(the OCR-free text does read "tum-of-the-century" — the PDF's own typography renders "turn" that
way. Quote it as "turn-of-the-century" only if the verifier re-checks the page image.)*

**F81.** QUOTE (LPC, LP-2155, Introduction): `"The district consists of thirty-one freestanding
single-family homes that are fine examples of many late nineteenth and early twentieth century
architectural styles, including Queen Anne, Colonial Revival, Shingle, Arts and Crafts and Tudor
Revival. The district's park-like setting, architectural expression and social history, represents
the evolution of the commuter suburb, and is a precursor to the speculative suburban development
which remade Queens in the twentieth century."`

**F82. Building-count conflict between LPC and NRHP for the same-named district.**
- LPC (LP-2155): **thirty-one** houses (F80, F81).
- QUOTE (Wikipedia, Douglaston Hill Historic District): `"It includes 83 contributing buildings and
  two contributing sites. The buildings include Zion Episcopal Church (1830), houses and garages,
  and commercial buildings. The sites are Zion cemetery and public park."`
- DERIVED (LPC building database `gpmc-yuvp`): 55 records with `hist_dist` =
  `"Douglaston Hill Historic District"` plus 2 with `"Douglaston Hill Historic District Amendment"`
  — i.e. **57** buildings in the LPC database, counting garages, against 31 houses in the report
  text and 83 contributing buildings in the NRHP district.
- DERIVED (PLUTO `64uk-42ks`): **31** tax lots with `histdist` = `"Douglaston Hill Historic
  District"` and **1** with the Amendment.
**Four numbers — 31, 32, 57, 83 — and the LPC and NRHP districts are demonstrably not the same
polygon (see F83).**

**F83. The single most consequential district discrepancy on this page.** The NRHP Douglaston Hill
district **includes Zion Episcopal Church**; the LPC Douglaston Hill district **excludes it**, and
LPC says so three separate times.
- QUOTE (Wikipedia, Douglaston Hill Historic District, describing the NRHP listing): `"The
  buildings include Zion Episcopal Church (1830), houses and garages, and commercial buildings.
  The sites are Zion cemetery and public park."`
- QUOTE (LPC, LP-2155, footnote 7): `"Zion Church is located outside the historic district."`
- QUOTE (LPC, LP-2155, on 240-45 43rd Avenue): `"...attributed to local architect/builder Samuel
  Lindbloom, who in 1890 designed and built the nearly identical rectory of the nearby Zion
  Episcopal Church, located at 242-02 44th Avenue (not in the historic district)."`
- QUOTE (LPC, LP-2155, on Aubrey B. Grantham): `"...their work included the new Zion Episcopal
  Church (not located inside the historic district)."`
- QUOTE (LPC, LP-1957, footnote 3): `"Zion Church is located outside the historic district."`
**A sentence saying "Zion Episcopal Church is in the Douglaston Hill Historic District" is true of
the National Register district and false of the New York City district. Whichever the page says, it
must say which one.**

**F84.** QUOTE (LPC, LP-2155, Testimony): `"On August 3, 2004, the Landmarks Preservation
Commission held a public hearing on the proposed designation of the Douglaston Hill Historic
District (Item No. 2). The hearing was duly advertised in accordance with the provisions of the
law. Nineteen people spoke in favor of the designation, including Councilperson Tony Avella, the
Queens Borough Historian, and representatives of State Assemblyperson Ann Margaret Carrozza, Queens
Community Board 11, the Douglaston-Little Neck Historical Society, the Douglaston Civic
Association, the Queens County Farm Museum, and the Historic Districts Council. The Commission also
received several letters and e-mails in support of designation, including from New York State
Senator Frank Padavan and the Society for the Preservation of Long Island Antiquities."`
*Note: **nobody spoke in opposition** at this hearing. Contrast the 1997 Douglas Manor hearing,
where somebody did (F118).*

**F85.** The boundary description of the LPC Douglaston Hill district is a full metes-and-bounds
paragraph in LP-2155 pp. 2–3, running along 243rd Street, 43rd Avenue, 42nd Avenue, 240th Street,
Depew Avenue, 40th Avenue, the Long Island Railroad right-of-way and 242nd Street. It opens
QUOTE: `"The Douglaston Hill Historic District consists of the properties bounded by a line
beginning at northwest comer of 43rct Avenue and 243rct Street, extending northerly along the
western curbline of 243rct Street,"` (the "rct" strings are the PDF's rendering of superscript
"rd"). **The full text is in the report; do not paraphrase it loosely.**

**F86.** Wikipedia's NRHP boundary description differs. QUOTE (Wikipedia NRHP listing table,
Douglaston Hill Historic District): `address` = `"Roughly bounded by Douglaston Pkwy., Northern
Blvd., 244th St., 243rd St., and Long Island RR"`, `date` = `"2000-08-31"`, `refnum` = `"00001016"`.
*Note this NRHP boundary reaches **east** to 244th Street and **south** to Northern Boulevard,
which the LPC boundary does not. That is why Zion Church (243-20 Church Street) falls inside the
NRHP district and outside the LPC one.*

**F87. The founding of the village.** QUOTE (LPC, LP-2155, p. 7): `"The portion to the south,
encompassing what is now Douglaston Hill, was sold in 1834 to Joseph DeForest. One year later,
Cortland Van Beuren acquired the property from DeForest. Van Beuren sold it in 1843 to Jeremiah
Lambertson, a local farmer, who held the property until 1853, when he laid it out in an urban grid,
named the subdivision Marathon, and sold the lots at auction."`

**F88.** QUOTE (LPC, LP-2155, p. 7): `"The timing of Lambertson's subdivision suggests that he was
anticipating the arrival of passenger train service on the Flushing and Northside Railroad, which
was being extended eastward at the time, reaching Flushing in 1854, with plans to reach Great Neck,
Long Island, via Douglaston, by the late 1860s."`

**F89.** QUOTE (LPC, LP-2155, p. 7): `"On February 15, 1853, the Flushing Journal reported that a
party of sixteen persons arriving by omnibus had purchased the Lambertson farm with the intent of
building country seats upon it. Property deed records show that title was transferred on July 23
and 27, 1853 to twenty-five buyers, with most buyers purchasing three or four lots each."`
Footnote 14, QUOTE: `"Of these, twenty were from New York City (which at that time included
Manhattan and part of the Bronx), while fo ur came fro m the City of Williamsburgh and one from
Brooklyn."`

**F90.** The street names — a fact the page will want. QUOTE (LPC, LP-2155, p. 7): `"Lambertson had
laid out generous 200 foot by 200 foot lots on the sloping land, and named the streets for trees:
Pine, Cherry, Poplar and Willow."` Footnote 15 cites QUOTE: `"'Map of the Village of Marathon, at
the head of Little Neck Bay,' filed July 23, 1853 at the Office of the Queens County Register."`

**F91.** LP-1957 attributes the same subdivision to **William Douglas**, not to Lambertson.
QUOTE (LP-1957, p. 7): `"Although the suburban development called Douglas Manor dates from 1906,
William Douglas apparently attempted a suburban subdivision half a century earlier south of Douglas
Manor... Even in the 1850s, anticipating the railroad's extension to the Little Neck peninsula,
William Douglas had subdivided part of his property (the area today known as 'the Hill'). ... He
named a number of new streets after the abundant trees on his property (Pine, Poplar, Willow,
Cherry)."`
**LP-2155 (2004) credits Jeremiah Lambertson; LP-1957 (1997) credits William Douglas. The two LPC
designation reports contradict each other on who laid out Douglaston Hill and who named the
streets. Record both.**

**F92. The 2012 street renaming — verified independently in PLUTO.**
QUOTE (Wikipedia, Douglaston Hill Historic District): `"In 2012, some numbered streets in the
historic district were renamed to their original names, with 43rd Avenue becoming Pine Street."`
**DERIVED (PLUTO):** of the 32 tax lots PLUTO tags as Douglaston Hill Historic District, the
current addresses are on **Pine Street** (240-11, 240-16, 240-17, 240-25, 240-34, 240-35, 240-40,
240-44, 240-45, 240-48, 240-51, 24022, 242-01, 242-03, 242-09, 242-19), **Poplar Street** (36,
240-02, 240-18, 240-24 rear, 240-38, 240-40, 240-42), **Prospect Avenue** (8, 41-10, 41-14, 41-23,
41-45, 42-11, 42-17) and **Depew Avenue** (240-27, 240-35). LP-2155 (2004) describes the same
houses as being on 43rd Avenue, 42nd Avenue and 240th Street.
**Consequence for the author: every address in LP-2155 is a pre-2012 address. 240-25 "43rd Avenue"
in the report is 240-25 Pine Street today. Do not print the report's addresses as current.**

**F93.** QUOTE (LPC, LP-2155, p. 7): `"The Lambertson family continued to be an important presence
in the area, retaining their farmstead located at Northern Boulevard and Main Street (now
Douglaston Parkway) into the 1870s."`
*i.e. **Douglaston Parkway was formerly Main Street**.*

**F94. Douglaston Hill's place in the history of American suburbs — the strongest "why travel
here" argument in the dossier.** QUOTE (LPC, LP-2155, p. 7): `"Because the Douglaston Hill
subdivision was one of the earliest in northeastern Queens (Woodside and Bayside, both earlier
stops on the Flushing and Northside Railroad, were not laid out until 1867 and 1872, respectively),
its evolution from mapped lots to built form provides a window into how the commuter suburb
developed as a physical and psychological manifestation of American middle class values."`

**F95.** QUOTE (LPC, LP-2155, p. 8): `"In 1853, Davis and Llewellyn Haskell, a developer, created
Llewellyn Park, New Jersey, the first American suburb."` and QUOTE: `"Laid out around the same time
as Llewellyn Park, the Lambertson subdivision at Douglaston Hill lacked the curving streets and
instead consisted of a traditional street grid and lotting system, but the commodious lots were
consistent with the suburban principles being advanced at the time."`
*i.e. LPC dates Douglaston Hill's layout to the same year as Llewellyn Park, which it calls the
first American suburb.*

**F96.** QUOTE (LPC, LP-2155, p. 5): `"By 1939, the Federal Writers' Project New York City Guide
had designated Queens the 'borough of homes,' a result of some fifty years of intensive
speculative, mostly suburban, housing development."`

**F97. The Alley Pond village and the oystermen.** QUOTE (LPC, LP-2155, p. 8): `"At the time of the
1853 Marathon subdivision, the Village of Alley Pond was a shipping and trading hub, its general
store providing an immense variety of goods, 'from needle to anchor.' A community of oystermen was
thriving, with more than a dozen sloops and schooners operating on Little Neck Bay at the foot of
Old House Landing Road (now Little Neck Parkway)."`

**F98.** QUOTE (LPC, LP-2155, footnote 19, quoting *History of Queens County* 1882): the shipment
of oysters and clams was `"the principal industry now carried on at Little Neck,"` by then
`"nationally famous for its shellfish."`

**F99.** QUOTE (NYC Parks, Udalls Park Preserve sign): `"During the 1830s, a shellfishing community
developed around the docks at Oldhouse Landing Road (now Little Neck Parkway) and Sand Hill Road.
The industry thrived as the demand for oysters and Little Neck Clams grew. But by 1893, the local
shellfish industry was finished, a victim of overharvesting, poaching, and pollution. Today, the
stanchions and bulkheads at the end of Little Neck Parkway are all that remain of the bygone era."`
*Note the spelling difference: LPC writes "Old House Landing Road", Parks writes "Oldhouse Landing
Road". Note also **this is at Little Neck Parkway and is therefore on the Little Neck side of the
line (F40)**.*

**F100. The littleneck clam.** QUOTE (Wikipedia, Douglaston–Little Neck and, identically, Little
Neck Bay): `"From the 1860s through the 1890s, small hard clams (quahogs) from Little Neck Bay were
served in the best restaurants of New York and several European capitals. Eventually, the term
'littleneck' or 'littleneck clam' came to be used as a size category for all hard clams, regardless
of origin."`

**F101.** QUOTE (Wikipedia, Little Neck Bay): `"Saddle-rock oysters are also found in the bay. The
bay was closed to harvesting in 1909 due to pollution."`
*Parks says the industry was finished by **1893** (F99); Wikipedia says the bay closed in **1909**.
Both recorded.*

**F102.** QUOTE (LPC, LP-2155, p. 9): `"Area census records from 1870 and 1880 portray a rural
population comprised of farmers, farmhands, baymen, laborers, oystermen, house keepers, grooms,
coachmen, wheelwrights, and stone masons, as well as a stockbroker and an insurance agent."`

**F103. An 1887 description of the place, in the local paper.** QUOTE (LPC, LP-2155, p. 10, quoting
the *Flushing Journal*, June 18, 1887): `"Possessing all of the requisite features which tend to
make a place of sojourn acceptable, Douglaston, indeed, is the Elysium of restfulness and peace.
From the old curbed wells that can be found in the yards of most of the farm houses to the stately
trees that line the drives leading to the same - everything smacks of rural life in its most
pleasing form."`

**F104.** QUOTE (LPC, LP-2155, Summary): `"One Douglaston observer noted: 'By 1910 the old farms
are disappearing .... by 1920 our village assumes an air of suburban dignity.'"`

**F105.** QUOTE (LPC, LP-2155, on 240-35 Depew Avenue etc.): `"...the enormous growth period of the
1920s, when the population of the Douglaston/Little Neck area increased from 2,000 to 8,000"`.

### 4.1 The three families who built Douglaston Hill

**F106.** QUOTE (LPC, LP-2155, Summary): `"Development proceeded, slowly until the 1890s, when a
small group of families acting as realtors, developers and home owners shaped the community.
William J. and Josephine Hamilton, Denis and Ellen O'Leary, and several members of the Stuart
family were among the first to build in the area and were all prominent residents. William
Hamilton, described as the 'well-known builder of Douglaston,' developed several lots."`
Footnote 25 sources the epithet to QUOTE: `"Flushing Daily Times (Oct. 21, 1907)."`

**F107.** QUOTE (LPC, LP-2155, p. 11): `"Denis O'Leary was typical of an early suburban commuter. A
prominent attorney and politician, he was active in civic affairs. He served as an Assistant
Corporation Counsel for New York City, Public Works Commissioner, Queens District Attorney, and
United States Congressman. Locally, he was a founding officer of the Douglaston Hose Company No. 1,
and was active in numerous charitable and fraternal organizations, including the Shinnecock
Democratic Club of Flushing, the Flushing Council, the Catholic Benevolent Legion, and the Holy
Name Society of Sacred Heart Church."`
*Note the report's Summary (p. 4) lists O'Leary's offices as `"Assistant Corporation Counsel for
New York City, Public Works Commissioner, U. S. Congressman"` and **omits Queens District
Attorney**, which the essay (p. 11) includes. The report is internally inconsistent. Both recorded.*

**F108.** QUOTE (LPC, LP-2155, p. 11): `"Denis and Ellen O'Leary were Douglaston Hill residents from
about 1901 through 1943, the year that Denis O'Leary died."` Footnote 26, QUOTE: `"Their daughters
remained in Douglaston Hill through the 1950s, living in separate houses across 43rd Avenue from
their childhood home."`

**F109.** QUOTE (LPC, LP-2155, p. 11): `"Each member of the Stuart family, also long-term Douglaston
Hill and Little Neck residents, worked in differing areas of the building trades and appear to have
collaborated in the construction of several houses. John Stuart of Little Neck, whose name often
appeared as the architect of record on plans filed at the Department of Buildings, was listed as a
building material supplier in early-twentieth-century city directories and censuses. His building
plans were often noted in the local newspapers, such as the Flushing Daily Times. The same sources
described James Stuart, Jr., as a contractor, Frederick Stuart as a painter, and Charles Stuart as
a carpenter."`

**F110.** QUOTE (LPC, LP-2155, p. 12): `"The houses were designed by the architect D.S. Hopkins of
Grand Rapids, Michigan, who published several books of house plans from the 1890s through the
1920s."` (on 240-35 and 240-25 43rd Avenue, now Pine Street). Also QUOTE: `"The designs were
produced by the architectural firm, Frank P. Allen & Son, another well-known producer of plan
books, also based in Grand Rapids."` (on 240-24 to 240-42 42nd Avenue, now Poplar Street). And
QUOTE: `"the O'Learys built 240-34 43rd Avenue from plans made by the Keith Corp. of Minneapolis,
another prominent producer of architectural plan books"`.
**PARAPHRASE of the significance: three of the district's houses come from mail-order pattern
books published in Grand Rapids and Minneapolis. Footnote 29 adds that Frank P. Allen's
QUOTE: `"house plans were often published in The Ladies' Home Journal, which helped to popularize
the use of architectural plan books in house construction."`**

**P4. 240-27 Depew Avenue — possible oysterman's cottage.** **F111.** QUOTE (LPC, LP-2155, p. 9):
`"Two possible oystermen cottages from the early or mid-nineteenth century may have survived within
the Douglaston Hill Historic District. No. 240-27 Depew Avenue (originally Willow Street) is a 1
V2-story, altered frame cottage with some vaguely Greek Revival-style detailing... The building
appears on the Beers Atlas of 1873, which is the earliest-available map of the area showing
buildings. The house possibly predates the 1853 subdivision and sale, and could have been built by
Jeremiah Lambertson or Cortland Van Beuren."`
*PLUTO gives `240-27 DEPEW AVENUE` a `yearbuilt` of **2020**, which contradicts LPC entirely and is
almost certainly a PLUTO data error following a renovation. Recorded so the verifier does not trust
PLUTO's year here.*

**P5. 240-35 Depew Avenue.** **F112.** QUOTE (LPC, LP-2155, p. 9): `"The neighboring house at
240-35 Depew Avenue may be of a similar origin, but was greatly expanded and appears to have been
moved to the rear of the lot in the early-twentieth century."` PLUTO `yearbuilt` = **1902**.

**P6. 41-45 240th Street (now 41-45 Prospect Avenue).** **F113.** QUOTE (LPC, LP-2155, p. 9):
`"The house at 41-45 240th Street (originally Prospect Avenue) appears to date to period of the
railroad's arrival. This two-story frame, altered Italianate-style house, which appears on the 1873
Beers Atlas, still occupies its original 200 by 200 foot lot that was purchased by August Michan of
New York in 1853."`

**P7. 42-25 240th Street — the Jeannie Clark house.** **F114.** QUOTE (LPC, LP-2155, p. 10): `"The
shingled Queen Anne-style house at 42-25 240th Street was built in 1899-1900 for Jeannie Clark.
Featuring a polygonal comer tower and turret with paneled moldings and brackets, and a tall brick
chimney, this 2 V2-story house was designed by architect John A. Sinclair and constructed by
builder Herman Haak."`

**P8. 240-16 43rd Avenue (now Pine Street) — where St. Anastasia's parish was founded.**
**F115.** QUOTE (LPC, LP-2155, p. 13): `"No. 240-16 43rct Avenue was built by Adolph Helmus of
Douglaston from plans filed by Walter J. Halliday of Jamaica, Queens... Helmus and his wife,
Otillie, occupied this house for many years. In 1915, meetings that led to the founding of St.
Anastasia Roman Catholic Church were held at the Helmus residence. Masses, baptisms, and church
meetings also took place in this home while the congregation was being formed."`

**P9. 240-51 43rd Avenue (now Pine Street) — the last house built in the district.**
**F116.** QUOTE (LPC, LP-2155, p. 16): `"The final house to be constructed in the historic district
is the postwar Modern-style dwelling at 240-51 43rct Avenue, which was designed and built by Thomas
Arcidiacono in 1958-62, on a lot that formerly belonged to 240-45 43rct Avenue. This 1 V2-story
house consists of three wings of varying heights, including one which is offset to create the
building's asymmetrical plan. The house is further characterized by its flat roofs with wide
overhangs, exposed joists, ribbon windows, and veneer brick highlights."`

**F117.** QUOTE (LPC, LP-2155, p. 16, "Later History"): `"During the 1930s and 40s, no additional
houses were constructed in the Douglaston Hill Historic District, but several garages were built as
automobiles became the prevalent mode of transportation."` and QUOTE: `"Nevertheless, a larger
number of homeowners in the Douglaston Hill Historic District chose to maintain original building
fabric during these years and to replace worn materials in kind, or even to restore lost detail. As
a result, the district continues to evoke the nineteenth and early-twentieth century suburban
ideals that guided its development and displays a distinct sense of place."`

---

## 5. DOUGLAS MANOR AND THE DOUGLASTON HISTORIC DISTRICT (1906–)

**P10. Douglaston Historic District (LPC), LP-1957, designated June 24, 1997.**
**P11. Douglaston Historic District (NRHP), refnum 05000937, listed 2005-09-01.**

**F118.** QUOTE (LPC Historic Districts dataset `skyk-mpzq`): `borough` = `"QN"`, `lp_number` =
`"LP-01957"`, `area_name` = `"Douglaston Historic District"`, `status_of_` = `"DESIGNATED"`,
`desdate` = `"1997-06-24T00:00:00.000"`, `caldate` = `"1996-11-19T00:00:00.000"`, `public_hea` =
`"1/14/1997"`, `extension` = `"No"`.

**F119.** QUOTE (LPC, LP-1957, Testimony): `"On January 14, 1997, the Landmarks Preservation
Commission held a public hearing on the proposed designation of the Douglaston Historic District
(Item No. 5). The hearing had been duly advertised in accordance with the provisions of law.
Thirty-two people spoke in favor of the designation, including Deputy Queens Borough President
Peter Magnani and representatives of State Senator Frank Padavan, Community Board 11, the
Douglaston & Little Neck Historical Society, the Queensborough Preservation League, the Queens
Historical Society, the Historic Districts Council, and the New York Landmarks Conservancy. One
speaker expressed concerns about the proposed boundaries of the district. The Commission received
letters in support of designation from Queens Borough President Claire Shulman, Councilman Michael
Abel, and the Douglas Manor Association. In addition, the Commission received much correspondance
prior to the public hearing in support of the historic district, as well as several letters in
opposition."`
*"correspondance" is the report's own spelling.*

**F120. The designation came from the neighborhood, not from the Commission.**
QUOTE (LPC, LP-1957, Acknowledgments): `"Area residents, led by Kevin Wolfe of the Douglaston &
Little Neck Historical Society, petitioned the Landmarks Preservation Commission for the creation
of a historic district and sponsored the preparation of 'Research for the Proposed Douglas Manor
Historic District, Douglas Manor, Queens,' a six-volume compilation of articles, books,
miscellaneous publications, and specially commissioned studies on the history and architecture of
Douglaston, which was submitted to the Commission in February 1996."` and QUOTE: `"In 1996
Commission Chairman Jennifer J. Raab directed the staff to study the available materials and
propose boundaries for a historic district."`

**F121.** QUOTE (LPC, LP-1957 title page): `"Editor: Marjorie Pearson, Director of Research"`,
`"Research/ Writing: Anthony Robins, Director of Special Projects / Donald G. Presa, Landmarks
Preservationist / Tamara McKenna, Research Consultant"`, `"Photography: Jeffrey A. Meyer"`,
`"Map: Marion Cleaver"`, `"Jennifer J. Raab, Chairman"`, `"Pablo E. Vengoechea, Vice-Chairman"`.

**F122.** QUOTE (LPC, LP-1957, Introduction): `"Its history over the past four centuries ranges from
a native American settlement to an eighteenth-century farm, a nineteenth-century estate called
Douglas Manor, and an early twentieth-century planned suburb, also called Douglas Manor. The
Douglaston Historic District encompasses the entire Douglas Manor suburban development, plus
several contiguous blocks."`

**F123. Building-count evidence, four sources, four numbers.**
- QUOTE (LPC, LP-1957, Introduction): `"more than 600 houses"`.
- QUOTE (LPC, LP-1957, The Architecture of the Douglaston Historic District): `"The architectural
  styles of the over 600 houses and some 150 related structures (mostly garages) in the historic
  district reflect three centuries of Douglaston's built history."`
- QUOTE (Wikipedia, Douglaston Historic District, describing the NRHP listing): `"It includes 631
  contributing buildings and three contributing sites on a mile-long peninsula extending into
  Little Neck Bay. All but one of the buildings are in residential use"`.
- DERIVED (LPC building database `gpmc-yuvp`): **939** records with `hist_dist` = `"Douglaston
  Historic District"` (houses + garages + outbuildings).
- DERIVED (PLUTO): **636** tax lots with `histdist` = `"Douglaston Historic District"`.
**600+, 631, 636, 939 — all defensible depending on what is being counted. Say which.**

**F124.** QUOTE (Wikipedia NRHP listing table, Douglaston Historic District): `address` = `"Roughly
bounded by Shore Rd., Marinette St., Douglas Rd. and Cherry St."`, `date` = `"2005-09-01"`,
`refnum` = `"05000937"`.

**F125.** The LPC boundary description (LP-1957 p. 2) is a metes-and-bounds paragraph running the
shoreline of Block 8010 Lot 1, the shoreline of Lots 101 and 117, 233rd Place, Bay Street, West
Drive, Douglaston Parkway, Cherry Street (39th Avenue), Douglas Road, and the eastern edges of
Block 8162. It opens QUOTE: `"The Douglaston Historic District consists of the property bounded by
a line beginning at the northern end of Block 8010, Lot 1, extending approximately southerly along
the outer edge of Lot 1 (approximately the eastern shoreline of Little Neck Bay),"`.

**F126.** QUOTE (LPC, LP-1957, Introduction): `"The very early buildings surviving in the district
include the c.1735 Van Wyck House, the c.1819 Van Zandt manor house (expanded in the early
twentieth century for use as the Douglaston Club), and the Greek Revival style c.1848-50 Benjamin
Allen House."`

**F127. The great white oak — a marquee item that no longer exists.**
QUOTE (LPC, LP-1957, Introduction, 1997): `"The landscape includes many impressive and exotic
specimen trees planted on the mid-nineteenth-century estate, as well as a great white oak, located
at 233 Arleigh Road, believed to be 600 years old."`
QUOTE (Wikipedia, Alley Pond Park): `"The nearby Great White Oak in Douglaston, though smaller, may
have been about 600 years old when it was cut down in 2009, though that tree's age is also
disputed."`
QUOTE (Wikipedia, Douglaston Manor Windmill): `"This area is notable for once being home to the
largest tree on Long Island, a magnificent 600-year-old White Oak with a remarkable 69" girth,
located at 233 Arleigh Road. It was taken down in 2009."`
**P12. 233 Arleigh Road, Douglaston — site of the Great White Oak (cut down 2009).**
DERIVED (NTA/WOF): `233 Arleigh Road` → lon −73.749746, lat 40.775451, BBL 4080470050, ZIP 11363,
WOF **"Douglaston"**, NTA `QN1103`.
**The tree is gone. A present-tense sentence about it would be false.**

### 5.1 Rickert-Finlay and the covenants

**F128.** QUOTE (LPC, LP-1957, p. 8): `"The Rickert-Finlay Realty Company, which bought Douglas
Manor, was active in real-estate development in Queens and Nassau Counties in the early years of
the century, buying up large farms and estates on the north shore of Long Island, preferably those
with attractive topographical features, and subdividing them into new suburban communities. Their
projects included Norwood in Long Island City, Broadway-Flushing in Flushing, Bellcourt in Bayside,
Douglas Manor in Douglaston, and Westmoreland in Little Neck."`
*This one sentence is the cleanest in-evidence statement of how Douglaston, Bayside and Little Neck
are related — same developer, different tracts. It is also a place where a careless author could
slide Bellcourt (Bayside) or Westmoreland (Little Neck) into Douglaston's page. **Both are outside
this page.***

**F129.** QUOTE (LPC, LP-1957, p. 8, quoting E.J. Rickert in *Architecture and Building*, 1914):
`"The first property developed was Bellcourt in Bayside, which was improved along the same lines as
had heretofore prevailed on Long Island -- that is, gravel sidewalks were laid, streets were graded
and shade trees were set out, no other improvements being made. In the sale of Bellcourt, however,
it was found that there was a demand for better improvements, and, consequently, when Douglas Manor
was developed, cement sidewalks were laid, macadam roads were built and trees and hedges were set
out. Broadway-Flushing and Westmoreland, which came next, were developed to about the same extent
as Douglas Manor, all then being considered the best improved properties on Long Island."`

**F130.** QUOTE (LPC, LP-1957, p. 8): `"By 1908, the company, with offices at 45 West 34th Street in
Manhattan, was advertising itself as 'The Largest Developers of Real Estate in Queens Borough --
over 10,000 lots within the limits of New York City.'"`
*Footnote 26 elsewhere in the report gives the company's address as `"1 West 34th St in Manhattan"`
for the first Douglas Manor Association meeting. **45 West 34th and 1 West 34th are both in
evidence.***

**F131.** QUOTE (LPC, LP-1957, p. 7, quoting the *Real Estate Record and Guide*, December 22, 1906):
`"The development of numerous farms into building lots and the erection of hundreds of new
buildings have necessarily advanced the value of real estate in that section of Greater New York.
It is said that more than 8,000 new apportionments have been made in the Borough of Queens during
1906, and that considerably more than 10,000 acres of land have been cut up into lots...."`

**F132.** QUOTE (LPC, LP-1957, p. 7): `"In 1906, the year Rickert-Finlay bought Douglas Manor,
several major transportation projects to speed connections between Manhattan and Queens were
underway: the Pennsylvania Railroad and Long Island Railroad tunnels under the East River, and the
Queensborough Bridge at 59th Street."`

**F133. The covenants themselves — the substance of what makes Douglas Manor look the way it does.**
QUOTE (LPC, LP-1957, p. 9): `"The covenants affected the architectural character of the houses only
peripherally -- by prohibiting flat roofs, thereby encouraging a more romantic roofline. Instead,
they focused on the kind and size of houses and the nature of the landscaping of the new
development. They required all houses to be single-family residences, with the sole exception of
the Douglaston Club (commercial uses and two-family buildings and flats were specifically
prohibited). They encouraged an economically mixed development, with a boulevard of substantial
mansions along the Shore Road waterfront, while smaller, less expensive houses would predominate on
the peninsula's east. (Such conditions were guaranteed by requiring houses of a certain cost and
lots of a certain size). A verdant landscape was ensured by requiring houses to be set back 20
feet, leaving room for greenery, and by prohibiting fences and encouraging hedges, creating vistas
not of individual, fenced-off gardens, but rather of a continuous, green, park-like, landscaped
environment."`

**F134.** The covenants' cost tiers, verbatim from LP-1957 footnote 25: QUOTE: `"Cost: Houses built
on blocks 1 to 43 had to cost at least $5000, those on blocks 44 to 57 from $3000 to $5000."`
Also QUOTE: `"'erected on plots having a frontage of less than 100 feet in blocks 1 to 12 inclusive
fronting on the Shore road'"`; QUOTE: `"Siting: Houses were required to be set back at least 20 feet
from the front and sides of the lot, and had to front on the street. Stables and other outbuildings
had to be set back at least 60 feet from the front and side lot lines in blocks 1-12 on Shore Road
and several other blocks; stables were completely prohibited on various other specified blocks."`;
QUOTE: `"Landscaping: No fences, 'except hedge or shrubbery,' were permitted any closer than 20 feet
from the front or sides of the lots."`; QUOTE: `"Architectural detail: The only restriction was a
prohibition on 'flat roofs.'"`
**NOTE FOR THE VERIFIER: LP-1957's enumeration of the covenants contains no racial or religious
restriction. I searched the report's covenant footnote and found none. That is an absence of
evidence in this source, not evidence of absence; I make no claim either way.**

**F135. The Douglas Manor Association.** QUOTE (LPC, LP-1957, p. 10): `"Rickert-Finlay went even
further, taking steps to protect that environment and shape the community's social character by
creating, in 1906, the Douglas Manor Association. Its stated objectives were the creation and
maintenance of a club house to promote 'social intercourse' among the residents, and to preserve
and protect the development's physical amenities, including the roads, parks, shorefront, and
plantings."`

**F136.** QUOTE (LPC, LP-1957, footnote 26): `"The first meeting of the Association was held June
22, 1906, at the offices of Rickert-Finlay at 1 West 34th St in Manhattan, three of the five
directors being E.J. and C.H. Rickert, and C.E. Finlay."`

**F137. The commonly held land — still owned by the Association today.**
QUOTE (LPC, LP-1957, footnote 26): `"Property held in common by the Douglas Manor Association
includes the shorefront along Little Neck Bay, much of the land east of Douglas Road facing Udal's
Cove, and two small triangular park areas formed by the intersection of Center Drive and East Drive
at Warwick Avenue, and West Drive and East Drive at Knollwood Avenue."`
**DERIVED (PLUTO):** a tax lot addressed `DOUGLAS ROAD`, ZIP 11363, `bldgclass` `V0`,
`lotarea` **263,779 sq ft** (≈6.06 acres), `ownername` = **`"DOUGLAS MANOR ASSOC"`**. The
Association's common holding is confirmed in the city's own tax records.

**F138. The sales pitch.** QUOTE (LPC, LP-1957, p. 11, quoting a 1906 Rickert-Finlay brochure):
`"only 33 Minutes to Manhattan, 52 Trains a Day"` and `"20 Minutes to Herald Square, when
Pennsylvania-Long Island Tunnels are completed."` The brochure also called Douglaston station
QUOTE: `"being the only station on the line near enough to the Sound to bring the shore front within
easy walking distance."`

**F139.** QUOTE (same brochure, via LP-1957 p. 11): `"preserved and increased by setting out hedges
along winding roads, following the natural contour of the land as much as possible.... The shore
drive, curving along the bay for over a mile, will be made the finest boulevard on Long Island."`
and QUOTE: `"city water, stone sidewalks, macadamized streets"` and `"full benefit of all
departments of the city government, including schools, water, police and fire protection."`

**F140.** QUOTE (LPC, LP-1957, p. 8): `"The company's typical strategy for selecting development
sites was described by E.J. Rickert in a 1914 article in Architecture and Building: 'It was
selected because it was on high ground, with a splendid outlook . . . and only four blocks from a
railway station. It was . . . noted for the magnificent row of maples and lindens, nearly a mile
long, extending through the entire property.'"`

**F141.** QUOTE (LPC, LP-1957, p. 9): `"The qualities of the nineteenth-century Douglas Manor on
which the Rickert-Finlay development capitalized included its hilly topography, its mile-long
waterfront accessible to the entire narrow peninsula, and its lush plantings, especially the
specimen trees planted during Douglas's tenure. The development also based its new road system on
the major farm roads already in place, which became West, East, and Centre [Center] Drives."`
Footnote 23, QUOTE: `"In recent years, the American spelling, 'Center,' has prevailed."`

**F142.** QUOTE (LPC, LP-1957, p. 12): `"From 1906 through the Depression, several hundred houses
were erected in Douglas Manor, following the plan suggested by the Rickert-Finlay covenants. In
general, the lots along Shore Road on the west were developed first, with larger, more substantial
houses, followed by the more modest homes to the east towards Udalls Cove. Property owners often
acquired lots adjacent to those on which their houses were built to accommodate more generous lawns
or gardens. The mile-long waterfront remained undeveloped, held in common by the Douglas Manor
Association."`

**F143.** QUOTE (LPC, LP-1957, p. 12): `"Douglas Manor is a contemporary of several other planned
communities in New York City, notably Fieldston in the Bronx and Forest Hill Gardens in Queens, all
three of which began as subdivisions in the first decade of the century, and blossomed in the late
teens and twenties."`
*Note the report writes "Forest Hill Gardens"; the standard name is Forest Hills Gardens.*

**F144.** QUOTE (LPC, LP-1957, footnote 32, quoting Starrett 1914): `"In development of previous
properties, the Company found that it was not safe to leave the architectural character of the
houses to the discretion of the purchasers, for whereas a majority of the home builders would
employ good architects, others would not do so, and the beauty of the property would be marred by
architectural failures."`
*i.e. Rickert-Finlay imposed design review at its **later** Kensington development, having NOT done
so at Douglas Manor. This is why Douglas Manor is stylistically varied.*

### 5.2 The architecture and the architects of Douglas Manor

**F145.** QUOTE (LPC, LP-1957, Introduction): `"The houses of the historic district, which are
representative of twentieth-century residential architecture, were designed in a variety of styles
including the many variants of the Colonial Revival, many houses in the English manner incorporating
Tudor Revival, English cottage, and Arts and Crafts motifs, as well as the Mediterranean Revival.
In most cases, they were designed by local Queens architects, including over a dozen who lived in
Douglaston itself. The district includes three houses of the Craftsman type pioneered by Gustav
Stickley. Eight of the houses in the district were designed by Josephine Wright Chapman, one of
America's earliest successful women architects, and they constitute an important body of her work."`

**F146. DERIVED (LPC building database `gpmc-yuvp`, 996 records across the three Douglaston
districts).** Most common `style_prim` values: Colonial Revival 254; Not determined 187; English
Cottage 106; Vernacular Colonial Revival 47; Arts & Crafts 44; Contemporary 39; Ranch 36; Tudor
Revival 32; Contemporary Colonial Revival 32; neo-Colonial 18; Colonial Revival Bungalow 15;
Mediterranean Revival 14; Raised Ranch 12; Altered Colonial Revival 11; Dutch Colonial Revival 9.

**F147. DERIVED (same database).** Most frequently named `arch_build` values: Not determined 529;
**John C. W. Cadoo 32**; **Philip Resnyk 26** (+7 more "attributed"); **Albert Humble 19**;
**Alfred A. Scheffer 13**; **Josephine Wright Chapman 12**; E. L. Maher 10; Hanford J. Bush
Building Company 8; Louis Wistoft 7; George J. Hardway 6; J. Sarsfield Kennedy 5; Charles Flores 5;
William S. Worrall, Jr. 5; Aubrey B. Grantham 5; William Heckman 4; Kenneth G. How 4; Lionel Moses
4; W. J. McKenna 4; Frank P. Allen & Son 4.
*Note the database credits Chapman with **12** buildings; the 1997 report text says **eight houses**
(F145, F153). Record both.*

**F148. DERIVED (same database).** Streets with the most Douglaston Historic District buildings:
Hollywood Avenue 82, Beverly Road 79, Manor Road 70, Grosvenor Street 66, Arleigh Road 61, Ridge
Road 60, Park Lane 51, Forest Road 50, Richmond Road 41, Warwick Avenue 41, Shore Road 38, Hillside
Avenue 32, Knollwood Avenue 28, Kenmore Road 26, West Drive 24, Little Neck Road 22, Bay Street 20,
Prospect Avenue 19, Douglas Road 17, Cherry Street 17, Oak Lane 17.

**F149. DERIVED (same database).** Exactly **one** building in the three districts carries a
`build_nme`: **P13. "Roselawn", 16 Manor Road (aka 12-16 Manor Road; 33-06 West Drive)**, `1919`,
architect **Alfred Busselle**, Colonial Revival, `use_orig` "Residential, single-family",
Douglaston Historic District.

**F150.** QUOTE (LPC, LP-1957, p. 15): `"Among the better known firms from outside the neighborhood
who worked in the historic district, Buchman & Fox, architects of many Manhattan office buildings,
designed 1008 Shore Road, a substantial Colonial Revival mansion overlooking the Bay. George
Keister, whose practice included churches, hotels and Broadway theaters, designed 24 Knollwood
Avenue, an Arts and Crafts style house, and 104 Hollywood Avenue, a Colonial Revival house. Diego
DeSuarez, who planned villa gardens at both La Pietra, outside Florence, and Vizcaya, outside
Miami, designed a one-story Mediterranean fantasy at 231 Beverly Road. Lionel Moses, of the firm of
McKim, Mead & White, designed a house in the English cottage manner at 1102 Shore Road overlooking
Little Neck Bay. The architectural firm of McKim, Mead & White is credited with the formal French
Renaissance Revival style house at 4 Ardsley Road. Dating from 1919, it is constructed of hollow
terra-cotta block, a form of fireproof construction, and faced with stucco."`
**P14. 1008 Shore Road (Buchman & Fox). P15. 24 Knollwood Avenue and P16. 104 Hollywood Avenue
(George Keister). P17. 231 Beverly Road (Diego DeSuarez). P18. 1102 Shore Road (Lionel Moses).
P19. 4 Ardsley Road (credited to McKim, Mead & White).**
DERIVED (NTA/WOF): `1008 Shore Road` → lon −73.752519, lat 40.781234, BBL 4080130001, ZIP 11363,
WOF **"Douglaston"**, NTA `QN1103`.

**F151.** QUOTE (LPC, LP-1957, footnote 36): `"This form of fireproof construction for residential
architecture enjoyed a brief period of popularity between about 1915 and 1925. About 25 houses in
the district, as well as a handful of garages, employ this construction method."`

**F152.** QUOTE (LPC, LP-1957, p. 16): `"Almost 60 of the over 600 houses in the historic district,
built in the first decades of the century, are known to be the work of fourteen Douglaston
architects."` Footnote 37, QUOTE: `"Queens telephone directories list them all in Douglaston."`
The report then names them: `"Alfred Scheffer, whose views are quoted above, designed at least
ten... John C.W. Cadoo designed at least sixteen houses, mostly Colonial Revival in style. Frank
Forster designed at least three houses, one Colonial Revival, the others in the English cottage
manner, as well as overseeing the restoration of the eighteenth-century Van Wyck House. Albert
Humble designed at least ten houses, most in the Colonial Revival style. Other Douglas Manor
architects include F.W. Bowman, the H.J. Bush Building Company, Palmer Clingman, John Davis,
Froelich & Quackenbush, Inc. builders, Aubrey Butler Grantham, Elbert McGran Jackson, Isaac Van
Dyke, J. Hart Welch, and Winthrop Welch. Most worked for real estate development companies or acted
as their own developers, buying groups of lots from the Douglas Manor Association and then building
houses for sale, rather than designing houses for individual clients."`
The footnotes list their addresses: Scheffer — QUOTE: `"316 Bayview, 378 Beverly, 16 Cedar, 256
Hollywood, 249 Manor, 125 Park, 236 and 268 Ridge, 1 Warwick, and his own home at 216 Beverly."`
Cadoo — QUOTE: `"130, 245 and 259 Arleigh, 310 Bayview, 351 Beverly, 237 Forest, 228 Grosvenor, 7
and 121 Hollywood, 336 Kenmore, 216 Manor, 235 Ridge, and 323, 329, 333 and 345 Warwick."`
Forster — QUOTE: `"304 Shore Road and 22 and 110 West Drive."`
Humble — QUOTE: `"121, 260, and 303 Arleigh; 314 Hillside; 221 Hollywood; 218 and 265 Park; 256
Ridge; 7 Shore; and 12 Westmoreland."`

**F153. Josephine Wright Chapman — the strongest single "why travel here" hook in Douglas Manor.**
QUOTE (LPC, LP-1957, p. 17): `"Eight houses in the historic district are known to have been designed
in the 1910s and 1920s by one of America's earliest successful women architects, Josephine Wright
Chapman (1867-?). Chapman was professionally active from 1892 to 1927, but little is known about
her education or commissions. She pursued her interest in a career in architecture over opposition
from her family, working from 1892 to 1897 as a draftsman in the office of Boston architect Clarence
H. Blackall. Very few academically trained women became architects in the last two decades of the
nineteenth century, and Chapman may have entered the profession as an apprentice. By 1898 she was
listed in the Boston City Directory as an architect, and developed a successful practice, despite
the rejection of her application for membership in the American Institute of Architects."`

**F154.** QUOTE (LPC, LP-1957, p. 17): `"Chapman's first major project was the New England Building
at the Pan-American Exposition in Buffalo in 1901. Other known work includes the Craigie Arms
Apartments (1897) in Cambridge, Mass., the Episcopal Church in Leominster, Mass., and the Women's
Clubs in Worcester and Lynn, Mass."`

**F155.** QUOTE (LPC, LP-1957, p. 17): `"In 1905, Chapman began to devote herself to the design of
houses. She preferred the 'English type,' long, low and rambling, with gables and timber and
plaster detailing. In 1907 she moved to New York, where she was listed in directories as an
architect until 1925. Among her few published works was a sixteen-story apartment building on Park
Avenue, described as demonstrating 'the feminine idea of correct planning ... and many innovations
were to be introduced.' While in New York, she also received the commission for Hillandale, an
Italian Renaissance style villa in Washington, D.C., built 1922-25."`

**F156.** QUOTE (LPC, LP-1957, p. 17, quoting historian Gwendolyn Wright): `"Neither Chapman's early
public success in Boston nor her conversion to professional pursuit more appropriate for a woman
qualified her for coverage in the architectural press. But her career was remarkable, for few women
had the financial independence to experiment with their own offices."`

**F157. Chapman's Douglaston addresses.** QUOTE (LPC, LP-1957, footnote 52): `"237 Arleigh, 363, 367
and 371 Grosvenor, 2 Hillcrest, 320 Kenmore, and 111 and 249 Ridge."` And QUOTE (p. 18): `"Chapman's
known Douglaston houses, which date from 1909 to 1917, are in the historic district's two prevalent
stylistic modes -- five Colonial Revival and three in the English cottage manner. They share
picturesque silhouetttes with rooflines that feature gambrel or gabled roofs with hipped or shed
dormers, and exposed brick chimneys; and distinctive entry and porch details, including one with
Tuscan columns, one with a pointed-arch batten door, and one with a panelled entrance with
side-lights and transom."`
**The eight Chapman houses, enumerated: P20. 237 Arleigh Road. P21. 363 Grosvenor Street.
P22. 367 Grosvenor Street. P23. 371 Grosvenor Street. P24. 2 Hillcrest Avenue. P25. 320 Kenmore
Road. P26. 111 Ridge Road. P27. 249 Ridge Road.**
Footnote 52 also cites QUOTE: `"Kevin Wolfe, 'Josephine Wright Chapman,' Metropolis, July/August
1992, pp. 17 ff."` — i.e. the scholarship on Chapman was done by the head of the local historical
society. **The report says eight; the LPC building database says twelve (F147). Unresolved.**

**F158. The Craftsman houses.** QUOTE (LPC, LP-1957, p. 18): `"Several Craftsman style houses,
including No. 122 Arleigh Road, 140 Prospect Avenue, and 111 Hollywood Avenue, may be one of the
largest such collections in any New York City neighborhood."`
**P28. 122 Arleigh Road. P29. 140 Prospect Avenue. P30. 111 Hollywood Avenue.**

**F159.** QUOTE (LPC, LP-1957, p. 19): `"No. 122 Arleigh Road corresponds to Craftsman plan number
70, a 'Ten-Room House for Town or Country Life' published originally in the Craftsman in July 1909
and again in More Craftsman Homes."` and QUOTE: `"No. 140 Prospect Road correspond to Craftsman plan
number 85, a 'Small Two-Story Cement House with Recessed Porch and Balcony,' published originally
in the Craftsman in March 1910 and again in More Craftsman Homes."` and QUOTE: `"No. 111 Hollywood
Road was designed by the Craftsman architects in 1914. The interior follows the Craftsman aesthetic,
while the exterior borrows the distinctive eyebrow window and brick Tudor arched entrance from
neighboring houses."`
*Note the report calls the same streets "Prospect Avenue"/"Prospect Road" and "Hollywood
Avenue"/"Hollywood Road" within two pages. Both spellings are the report's own.*

**F160. An architect describing his own Douglaston house, 1929 — unusually good colour.**
**P31. 216 Beverly Road — Alfred Scheffer's own house.**
QUOTE (LPC, LP-1957, p. 13, quoting Alfred Scheffer, "Gracious Type of House on Small Lot", *Arts
and Decoration* 30, October 1929): `"The water is only a stone's throw -- of a conservative
marksman -- from our front door and the second floor bay window has a certain suggestion of the
forecastle deck of a ship, for the intervening land and highway are quite lost to sight and I can
get a fine sense of sailing the seas, when I stand there."`
And QUOTE: `"The construction is quite definitely in the English manner although I was not concerned
with making it exact or authentic."`
And QUOTE: `"stucco and halftimber walls with slate roof ... The substantial chimney of common brick
is typical of many English country houses.... The main entrance doorway of the house, at the end of
a narrow flagstone walk, forms a Gothic arch of oak timber, framing a paneled oak door with iron
straps and two small leaded glass windows, the effect completed by a semi-circular stone stoop.
Beside the door is a lantern of pierced wrought-iron in the shape of an inverted tunnel, with
wrought-iron bracket."`
And QUOTE: `"The interior of the house, will probably grow from year to year. Things will be taken
out and others put in until eventually, it comes near to realizing my mental image of what it ought
to be. Already, I think, it has the liveable quality which is most essential of all."`
DERIVED (NTA/WOF): `216 Beverly Road` → lon −73.750901, lat 40.776902, BBL 4080340007, ZIP 11363,
WOF **"Douglaston"**, NTA `QN1103`.
*NOTE: the report calls him "Alfred Scheffer" throughout and then, once, `"loosely adapted by
architects like Frank Scheffer"` — an error in the report. The LPC database spells him
`"Alfred A. Scheffer"`.*

**F161.** QUOTE (LPC, LP-1957, p. 14): `"An additional group of houses in the historic district, on
the south side of Bay Street, predates the Douglas Manor development by several years. Designed
c.1900, they are excellent examples of the Colonial Revival and Queen Anne styles popular at the
end of the nineteenth century."`

**F162. Garages, which LPC treats as contributing.** QUOTE (LPC, LP-1957, p. 14): `"Playing an
important role in the historic district are the many related garage structures, often designed in
architectural styles compatible with the houses they serve. Some were constructed originally as
carriage houses and stables, often with residential accommodations, and later converted for garage
use. By about 1920, the automobile had supplanted the horse, and garages were built as freestanding
structures, some with chauffeur's quarters at the second story, usually situated close to a side or
rear lot line."`

**F163.** QUOTE (LPC, LP-1957, p. 14, quoting *Architectural Forum*, October 1925, on a Frank
Forster house): the writer praised Forster's `"excellent use of half-timber in connection with brick
or stucco"` and his `"rare skill in grouping, which creates a picturesque and architectural
composition, wholly unaffected or exaggerated and involving no sacrifice in the matter of interior
planning to secure this effect."`

**F164.** QUOTE (LPC, LP-1957, Introduction): `"The Douglaston Historic District survives today as an
important example of an early twentieth-century planned suburb adapted to the site of a
nineteenth-century estate. The stylistically varied suburban residences, the distinctive topography,
the landscaped setting, and the winding streets create a distinct sense of place and give the
district its special character."`

---

## 6. THE TWO INDIVIDUAL LANDMARKS

**F165. DERIVED (LPC Individual Landmark Sites `buis-pvji`, filtered `borough='QN' AND cd='411'`).**
Community District 11 contains exactly **six** individual landmarks. Two are in NTA `QN1103`
Douglaston-Little Neck; the other four are in NTA `QN1102` Bayside and belong to Bayside's page,
not this one:

| lpc_name | address | LP no. | designated | NTA |
|---|---|---|---|---|
| **Cornelius Van Wyck House** | 37-04 Douglaston Parkway | LP-00144 | 4/19/1966 | **QN1103** |
| **Benjamin P. Allen House** | 29 Center Drive | LP-00944 | 1/11/1977 | **QN1103** |
| John William and Lydia Ann Bell Ahles House | 39-24 to 39-26 213th Street | LP-02341 | 4/12/2016 | QN1102 |
| Hawthorne Court Apartments | 215-37 to 215-43 43rd Avenue and 42-22 to 42-38 216th Street | LP-02461 | 11/25/2014 | QN1102 |
| Lawrence Graveyard | 216th Street at 42nd Avenue | LP-00630 | 8/2/1967 | QN1102 |
| 35-34 Bell Boulevard | 35-34 Bell Boulevard | LP-02154 | 10/19/2004 | QN1102 |

**There are exactly two individually designated New York City landmarks in Douglaston. Any claim of
a third is wrong.**

### 6.1 Cornelius Van Wyck House

**P32. Cornelius Van Wyck House — 126 West Drive, aka 37-04 Douglaston Parkway, Douglaston, NY
11363.**
DERIVED (NTA/WOF): `126 West Drive` → lon −73.752533, lat 40.773294, BBL **4080560062**, ZIP 11363,
WOF **"Douglaston"**, NTA `QN1103`. `37-04 Douglaston Parkway` geocodes to the **same BBL**.
No source assigns it to any other neighborhood.

**F166. The address is genuinely double, and the sources split on which comes first.**
- LPC Individual Landmark Sites dataset: `address` = `"37-04 Douglaston Parkway"`.
- LPC building database `gpmc-yuvp`: `des_addres` = `"126 West Drive"`, `lm_orig` = `lm_new` =
  `"Cornelius Van Wyck House"`.
- QUOTE [OCR] (LPC, LP-0144, 1966): `"CORNELIUS VANWYCK HOUSE, 37-04 Douglaston Parkway (126 West
  Drive), Douglaston, Borough of Queens. Built about 1735, architect unknown."`
- QUOTE (LPC, LP-2155, p. 6): `"the Van Wyck House of 1735 (126 West Drive, aka 37-04 Douglaston
  Parkway, both an individually designated New York City Landmark and located within the Douglaston
  Historic District)"`.
- QUOTE (LPC, LP-1957, p. 5): `"the Cornelius Van Wyck House, at 126 West Drive aka 37-04 Douglaston
  Parkway, a designated New York City landmark"`.
- QUOTE (Wikipedia NRHP listing table): `address` = `"37-04 Douglaston Parkway"`, `refnum` =
  `"83004149"`, `date` = `"1983-10-06"`.
**Both addresses are correct and both are LPC's own. Use both or say "aka".**

**F167.** QUOTE [OCR] (LPC, LP-0144, 1966): `"Landmark Site: Borough of Queens Tax Map Block 8056,
Lot 62."` **DERIVED (PLUTO)** confirms: BBL `4080560062` = Block 8056, Lot 62.

**F168.** QUOTE [OCR] (LPC, LP-0144, 1966): `"On January 11, 1966, the Landmarks Preservation
Commission held a public hearing on the proposed designation as a Landmark of the Cornelius Van
Wyck House and the proposed designation of the related Landmark Site. (Item No. 46). At that time
no speakers appeared to testifY. The Commission continued the public hearing until February 8, 1966
(Item No. 45). At that time four epeale rs spoke in favor of designation, including the
representative of the O'k1ler .. of the building."`
PARAPHRASE: at the first hearing, 11 January 1966, no speakers appeared; at the continued hearing,
8 February 1966, four speakers spoke in favour, including a representative of the owner.

**F169.** QUOTE [OCR] (LPC, LP-0144): `"This picturesque Eighteenth Century Dutch Colonial house
with its hand-hewn shingles and salt-box type roof faces Little Neck Bay on Long Island. It is
situated in a beautifully landscaped property that leads down through a garden to a sandy beach.
The initial portion of the house was built by Cornelius Van Wyck in 1735, and consisted of what are
today the dining room, the master bedroom and the living hall. These rooms have superb oak beams.
Between the years 1735-1770 the house was expanded to the south and west . The present kitchen-wing
dates from 1930. There are handsome Georgian mantlepieces in the present living room and in the
downstairs bedroom. The present study has an excellent, fully panelled fireplace-wall with a classic
box cornice."`
*This passage OCR'd cleanly and is the best short description of the house in evidence.*

**F170.** QUOTE [OCR] (LPC, LP-0144): `"Cornelius VanWyck was the eldest son of Johannes VanWyck,
whose f ather had emigrated from Holland in 1660. Cornelius ha d three sons, Stephen, Cornelius II
and Gilbert. Stephen inherited the property and added to the house. He became a delegate to the
Continental Congress. The VanWyck family sold the house in 1819 to Winant Van Zandt who added 120
acres to the property, including an area to the north known as 'The Point'."`

**F171. Wikipedia contradicts LPC on the Van Wyck succession.**
QUOTE (Wikipedia, Cornelius Van Wyck House): `"Cornelius Van Wyck's father, Johannes Van Wyck,
purchased 125 acres of land from Richard and Sarah Cornell. This property was inherited by Cornelius
when his father died in 1734."` and QUOTE: `"Upon his death, the house passed to his son Stephen Van
Wyck, who built additions to the house. However, Stephen, the eldest of Cornelius' 3 sons, showed no
interest in farming; therefore, he sold his share of the inheritance to his cousin Cornelius, who
was the last Van Wyck to live in the home."`
**LPC (1966) says Stephen inherited, added to the house and became a delegate to the Continental
Congress. Wikipedia says Stephen sold out to a cousin. Wikipedia does not mention the Continental
Congress. Both recorded.**

**F172. Wikipedia's Van Wyck article contains a plainly garbled sentence — do not reuse it.**
QUOTE (Wikipedia, Cornelius Van Wyck House): `"In 1819, Van Zandt constructed a large mansion on the
Point. Upon George Van Zandt's death, his son William inherited the property."`
There was no "George Van Zandt". The people are George Douglas and his son William Proctor Douglas
(F70). **This sentence is wrong in its source. Flagged.**

**F173.** QUOTE (LPC, LP-1957, p. 12): `"The Cornelius Van Wyck House, at 126 West Drive, survives as
the oldest extant house in the district, and one of the oldest in New York City (it is a designated
New York City landmark). Built c.1735 for an early Dutch settler as a farmstead, the house reflects
eighteenth-century New York colonial styles. Douglas, who transformed the farm to Douglas Manor, is
said to have used the house as an 'entrance lodge to his estate.' In 1907, one year after the
acquisition of the Manor by the Rickert-Finlay Company, the Douglaston Country Club enlarged the
building for use as a clubhouse. In 1921, the Van Wyck House passed back into use as a
single-family residence, and its owner, E.N. Wicht, hired Frank J. Forster, designer of Colonial
Revival and Tudor Revival style houses in the new Douglas Manor development, to restore it to its
original Dutch Colonial appearance."`
*Footnote 29 cites QUOTE: `"'The Conservation of a Relic of Colonial Days, House of E.N. Wicht,
Douglaston,' American Architect 126 (September 24, 1924), 286."`*

**F174. Wikipedia dates the Wicht purchase differently.** QUOTE (Wikipedia, Cornelius Van Wyck
House): `"William Douglas sold the entire tract in 1906 to the Douglaston Club. The smaller house
was purchased by Edward Wicht in 1915; Wicht restored the structure to its original condition and
furnished it in keeping with the design and architecture of the previous structure. When Wicht died
in 1936, Mr. and Mrs. Larsen purchased the house."`
**LPC says the house returned to single-family use in 1921 and the restoration architect was Frank
J. Forster; Wikipedia says Wicht bought it in 1915 and does not name Forster. Also LPC says the
1907 club was "the Douglaston Country Club"; Wikipedia says the 1906 sale was "to the Douglaston
Club". Record all four differences.**

**F175.** QUOTE (Wikipedia, Cornelius Van Wyck House): `"The Cornelius Van Wyck House is considered
to be the 'most impressive architectural remnant of the early Dutch Culture' in New York."`
*Wikipedia does not attribute this quoted phrase to a named source in the extract. Treat as
unsourced.*

**F176. DERIVED (PLUTO).** `126 WEST DRIVE`, ZIP 11363, `ownername` = **`"VAN WYCK HOUSE, LLC"`**,
`bldgclass` `A3`, `landuse` `1`, `yearbuilt` **1735**, `numfloors` 1.75, `lotarea` 22,632 sq ft,
`bldgarea` 5,071 sq ft, `unitsres` 1, `histdist` `"Douglaston Historic District"`, `landmark`
`"INDIVIDUAL LANDMARK"`.
**DERIVED (PLUTO), important for the author: this is a privately owned single-family residence.
It is not a museum and there is no evidence in this dossier that it is open to the public. Of the
5,583 PLUTO lots in ZIPs 11362 and 11363, exactly five have a `yearbuilt` before 1900, and this is
the oldest by 115 years:** 1735 (126 West Drive), 1850 (221 Arleigh Road), 1850 (236-12 Center
Drive), 1850 (240-02 Poplar Street), 1870 (231 Manor Road).

### 6.2 Allen-Beville House / Benjamin P. Allen House

**P33. Allen-Beville House, aka Benjamin P. Allen House — 29 Center Drive, Douglaston, NY 11363.**
DERIVED (NTA/WOF): `29 Center Drive` geocodes to `"29-29 CENTRE DRIVE, Douglaston, NY, USA"`,
lon −73.75122, lat 40.77865, BBL 4080220075, WOF **"Douglaston"**, NTA `QN1103`.
**GeoSearch returns ZIP 11360 for that geocode, which is Bay Terrace's ZIP; every other source says
11363. This looks like a geocoder artifact and is recorded so the verifier does not take 11360
seriously.**

**F177. The name is genuinely double and LPC has changed it.**
- LPC building database `gpmc-yuvp`, record for `"29 Center Drive (aka 38-01 Cedar Lane; 36-02--36-12
  Forest Road)"`: `lm_orig` = **`"Allen-Beville House"`**, `lm_new` = **`"Benjamin P. Allen House"`**.
- LPC Individual Landmark Sites dataset `buis-pvji`: `lpc_name` = **`"Benjamin P. Allen House"`**.
- QUOTE [OCR] (LPC, LP-0944, 1977): `"ALLEN•BEVJLLE HOUSE. 29 Center Ortve, Doug1stton."`
- QUOTE (LPC, LP-1957, p. 12): `"The Benjamin P. Allen House (a/k/a the Allen-Beville House, a
  designated New York City landmark) at 29 Center Drive, built c.1848-50, is another rare Queens
  farm house."`
- QUOTE (Wikipedia NRHP listing table): `name` = `"Allen-Beville House"`, `address` = `"29 Center
  Dr."`, `refnum` = `"83001760"`, `date` = `"1983-09-22"`.
- DERIVED (PLUTO): the lot's current address is **`236-12 CENTER DRIVE`**, ZIP 11363, `ownername`
  `"MENGLER, CHRISTOPHER"`, `bldgclass` `A3`, `yearbuilt` **1850**, `lotarea` 18,400 sq ft,
  `bldgarea` 2,688 sq ft, `unitsres` 1, `histdist` `"Douglaston Historic District"`, `landmark`
  `"INDIVIDUAL LANDMARK"`.
**Four addresses in evidence for one house: 29 Center Drive, 236-12 Center Drive, 38-01 Cedar Lane,
36-02–36-12 Forest Road. Two names. It is privately owned and occupied.**

**F178. The 1977 report's own date line is internally wrong.** QUOTE [OCR] (LP-0944 header):
`"Landmarf(s Pre~ervatton Ccmm1s$fon / Januat-y 11, 1971, !'Sumber 4 / LP ...094·lf"` — i.e. the
OCR reads "January 11, 1971", while the body says the hearing was `"On November g, 1976"` and the
LPC dataset gives `desdate` **1/11/1977**. **The designation date is 11 January 1977.** The "1971"
is an OCR misread of 1977.

**F179.** QUOTE [OCR] (LPC, LP-0944): `"The A11en•Bevt 1ht Houtcs Is an exeeptlona1 ty. f-ine Greek
Revival structure bull t du'".fn9 the tate 1840s fn what fs now Douglaston, O.ueens ~ tt fs one of
the few renm:Jnlng farm hoases of the many buflt tn New York during the t9th century."`
PARAPHRASE: the Allen-Beville House is an exceptionally fine Greek Revival structure built during
the late 1840s in what is now Douglaston, Queens; it is one of the few remaining farmhouses of the
many built in New York during the 19th century.

**F180. The architectural description — quotable and clean enough.** QUOTE [OCR] (LPC, LP-0944):
`"The Allen·Bevtlte house fs a symmetrical two•and•one·half•story rectangular whlte clapboard
structure set on a low basement. It ts ftve bays wide and three bays deep, with front and rear
porches extendfng the full wtdth of the house. Fu11·helght wlndows wfth transoms are crowned by
eared enframements and open onto these porches. · Elegant fluted Doric columns, so characteristic
of the Greek Revfva1 style, support the entablature which Is ornamented with dentfts and paired
brackets. These brackets may be a later addttfon, since In form they are typical of the ltallanate
style. A pafr of handsome Queen Anne doors, replacing the Greeft Revival doors, Is set fn the
ortgfnal battered and eared enframement."` … `"A bracketed octagonal cupola crowns the house and Is
one of fts most strfldng t'eatures."`
PARAPHRASE, de-OCR'd: a symmetrical two-and-a-half-storey rectangular white clapboard structure on
a low basement, five bays wide and three bays deep, with full-width front and rear porches;
full-height windows with transoms under eared enframements; fluted Doric columns supporting an
entablature ornamented with dentils and paired brackets (the brackets possibly a later, Italianate
addition); a pair of Queen Anne doors replacing the original Greek Revival ones; and a bracketed
octagonal cupola crowning the house.

**F181. The chain of title.** QUOTE [OCR] (LPC, LP-0944): `"The sJto of the Atlon·Bevl He Mouse was
fnherhed by Danfe1 K. Allen from hfs uncle Rfchard Allen. !he entfre estate befng ~ form of
appronfmately sixteen acres whfch ~e ~mass~d through purchases from EliJah AHen, Philip A11~n, and
Cornelius Van Wyek prior to 1820. Bf!njsmht P. Allen shortly after eequfred the site of the house
on August 11. 18~7, fran Daniel K. Al1en. Thfs was fn satisfaction of s tegal dectsJon hand$d d~~n
In 1844 by Master· tn•Chancery P. T~ Ruggers concernJng the Rf ctusrd A11ea estate."`
PARAPHRASE: the site was inherited by Daniel K. Allen from his uncle Richard Allen, the estate being
a farm of approximately sixteen acres amassed through purchases from Elijah Allen, Philip Allen and
Cornelius Van Wyck prior to 1820; Benjamin P. Allen acquired the house site on 11 August 1847 from
Daniel K. Allen, in satisfaction of an 1844 legal decision by Master-in-Chancery concerning the
Richard Allen estate.
*Wikipedia's version: QUOTE: `"The site was inherited by Daniel K. Allen from his uncle, Richard
Allen. Originally a farm of 16 acres (65,000 m2), he had purchased the land from Elijah Allen,
Philip Allen and Cornelius Van Wyck prior to 1820. In 1847, Benjamin Allen acquired the site and
built the house."`*

**F182.** QUOTE [OCR] (LPC, LP-0944): `"BenJamin P. All~n (b. 1819)- and his wife C~thertne (b.
1832). had seven ehf ldren between 1855 and 1874. fn 1865 111r. Allen reportedly provided space for
a school within hts homG fer the children of the community. During the perfod from 1866 to 1883
Benjamfn P. Allen served as vestryman and at times as warden for the Zton Eptseopat Church In
Dougleston."`
PARAPHRASE: Benjamin P. Allen (b. 1819) and his wife Catherine (b. 1832) had seven children between
1855 and 1874; in 1865 Allen reportedly provided space for a school within his home for the
children of the community; from 1866 to 1883 he served as vestryman and at times warden of Zion
Episcopal Church in Douglaston.

**F183.** QUOTE [OCR] (LPC, LP-0944): `"The orlgina1 church structure was opened fn June of 1830.
The adjoining cem$tery wes established tn 1834, and tncludes the burtel places of Benjsmrn P. Allen,
who died on February 27, 1883, and many members of the Allen family."`
PARAPHRASE: the original Zion church structure opened in June 1830; the adjoining cemetery was
established in 1834 and includes the burial places of Benjamin P. Allen (d. 27 February 1883) and
many members of the Allen family.
**This is the only date in evidence for the founding of Zion's cemetery.**

**F184. Later ownership.** QUOTE [OCR] (LPC, LP-0944): `"In 1905•1906 the Douglas Manor Company
bought the Douglas estate end subdfvfded the land as a real estate development. The area became an
attractive middle-class suburb. Anne R. Faddfs purchased approximately seventeen tots tn thls
development Including the Allen·BevJlte House. Twentywfour years later tt was bought by Walter
Scott Faddfs and was sold by his e~ecutors to Alan Warner fn 1945, who ln turn sold ft to the
present owners, Hugh and Eleanor Bev11te, fn 1946."`
PARAPHRASE: the Douglas Manor Company bought the Douglas estate in 1905–06 and subdivided it; Anne
R. Faddis bought roughly seventeen lots including the Allen-Beville House; twenty-four years later
it was bought by Walter Scott Faddis and sold by his executors to Alan Warner in 1945, who sold it
to Hugh and Eleanor **Beville** in 1946 — hence the hyphenated name.
*Note the report says **"the Douglas Manor Company"**; LP-1957 says **"the Rickert-Finlay Realty
Company"**; the 1906 *Real Estate Record and Guide* says **"the Douglass Manor Co."** (F69). Three
company names for one purchase. Record all three.*

**F185. Wikipedia adds a claim about the clubhouse fire that LPC does not make.**
QUOTE (Wikipedia, Allen-Beville House): `"In the late 19th century, William P. Douglas, for whom
Douglaston was named, purchased the home for use as a guest home for his estate, which was the
original Douglaston Club building. When the clubhouse burned in 1917, the architects used this
house as a model to create the current club."`
**No LPC source in this dossier mentions a 1917 clubhouse fire. LP-2155 footnote 11 mentions a fire,
but at Zion Church and in 1924 (F193). Do not conflate them. Flagged as an unconfirmed
Wikipedia-only claim.**

**F186.** QUOTE [OCR] (LPC, LP-0944, Findings): `"the AHen•Bevtl le House h a handsome example of
Greek RGvlval architecture; that It retains moGt of fts fine detafls; th1t It survives as an example
of a mfd 19th-century country house; that It fs one of the oldest structures ln Douglaston, Queens;
that ft was the home of one of the oldest famffles tn the eommuntty: and that ft fs attractively
sltuat~d on spacious grounds."`

**F187.** QUOTE (Wikipedia, Allen-Beville House): `"The Allen-Beville House is a historic house on
the Little Neck peninsula in the Douglaston neighborhood of Queens, New York City. Constructed
between 1848 and 1850, it is one of the few surviving 19th-century structures in Queens built as a
farmhouse that survives."` *(the doubled "survives" is Wikipedia's own).*

### 6.3 The Douglaston Club

**F188. The Douglaston Club building is NOT an individual landmark.** It is a contributing building
inside the Douglaston Historic District (F165 shows only two individual landmarks in the NTA, and
neither is the Club). QUOTE (LPC, LP-1957, p. 12): `"The Wynant Van Zandt House, at 600 West Drive,
reflects both the older and the newer history of Douglaston. Built in 1819 as a home for Wynant Van
Zandt, it was significantly altered after 1906 for use as the Douglaston Club, but still reflects
some of the character of Van Zandt's original two-story Greek Revival manor house."`

**F189. DERIVED (PLUTO) — a date conflict on the Club building.** `600 WEST DRIVE`, ZIP 11363,
`ownername` = **`"DOUGLASTON CLUB INC"`**, `bldgclass` `Q9`, `landuse` `9`, `yearbuilt` **1931**,
`numfloors` 3, `lotarea` 102,060 sq ft (≈2.34 acres), `bldgarea` 17,100 sq ft, `histdist`
`"Douglaston Historic District"`, and **no** `landmark` flag.
**LPC says the fabric is 1819 with post-1906 alterations. PLUTO says 1931. Wikipedia says a
clubhouse burned in 1917 and was rebuilt (F185). Three incompatible stories about one building.
Record all three; resolve none.**

**F190.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Today, this mansion houses the Douglaston
Club, a private club with tennis courts, social activities and swimming pools."` and QUOTE: `"It is
a part of the Douglaston Club, a country club based in Douglas' original mansion in Douglas Manor.
The Douglaston Club is also site of various community events, such as the Douglaston Chess
Congress' annual championships, which decides the community's best players."`
*It is a **private club**. F4 records that its website is unreachable.*

**F191.** DERIVED (DOHMH `43nn-pn8j`): `DOUGLASTON CLUB`, `600 WEST DRIVE`, ZIP 11363, `cuisine`
`"American"`. **The Douglaston Club appears in the DOHMH restaurant inspection dataset. That is the
only dataset in this dossier that documents its food service, and DOHMH is an inspection record —
it is not evidence that the public may eat there.**

---

## 7. ZION EPISCOPAL CHURCH

**P34. Zion Episcopal Church — 243-20 Church Street (mailing 243-01 Northern Boulevard),
Douglaston, NY 11363.**
DERIVED (NTA/WOF): `243-01 Northern Boulevard` → lon −73.743693, lat 40.766461, BBL 4081110086,
ZIP 11363, WOF **"Douglaston"**, NTA `QN1103`. No source assigns it elsewhere.

**F192.** QUOTE (Zion Episcopal Church's own website): `"Zion is God's light shining on a hill in
the Queens community since 1830, inviting all people to join in loving, joyful worship and ministry
as we strive to be Christ's hands and heart in the world."`
The site gives QUOTE: `"Church Address: 24320 Church St. Douglaston, NY 11363"` and QUOTE: `"Mailing
Address: 243-01 Northern Blvd. Douglaston, NY 11363"`, and QUOTE: `"Our parking lot is located
behind the church at the corner of Church Street and Orient Ave."` and QUOTE: `"If you are locating
us with a GPS app, enter 'Church St. & Orient Ave., Douglaston, NY' as the address."`
Source: `https://www.zionepiscopal.org/` and `https://www.zionepiscopal.org/about-us/`
*"24320" is the site's own rendering of 243-20.*

**F193. The building on the site today is not the 1830 church.**
- QUOTE (LPC, LP-2155, footnote 11): `"The original building was destroyed by fire in 1924 and
  rebuilt shortly thereafter."`
- QUOTE (LPC, LP-2155): `"their work included the new Zion Episcopal Church (not located inside the
  historic district)"` — the architects being **Aubrey B. Grantham** and builder **Samuel
  Lindbloom**, and the date QUOTE: `"the new Zion Episcopal Church in 1924-25"`.
- QUOTE (LPC, LP-0944 [OCR]): `"The orlgina1 church structure was opened fn June of 1830."`
- DERIVED (PLUTO): `243-20 CHURCH STREET`, ZIP 11363, `ownername` `"ZION EPISCOPAL CHURCH"`,
  `bldgclass` `M1`, `landuse` `8`, `yearbuilt` **1931**, `numfloors` 1, `lotarea` **189,225 sq ft**
  (≈4.34 acres), `bldgarea` 6,900 sq ft.
- QUOTE (Wikipedia, Douglaston Hill Historic District, on the NRHP district): `"The buildings
  include Zion Episcopal Church (1830)"`.
**LPC dates the present church to 1924–25; PLUTO says 1931; the NRHP listing (via Wikipedia) says
1830. A sentence calling the standing building "the 1830 church" is contradicted by LPC. Flagged
hard.**

**F194.** QUOTE (LPC, LP-2155): `"the nearly identical rectory of the nearby Zion Episcopal Church,
located at 242-02 44th Avenue (not in the historic district)"`, designed and built in 1890 by
**Samuel Lindbloom**.
**P35. Zion Episcopal Church rectory, 242-02 44th Avenue.** DERIVED (NTA/WOF): lon −73.74464,
lat 40.76637, BBL 4081110013, ZIP 11363, WOF **"Douglaston"**, NTA `QN1103`.
*Note this lot's BBL (Block 8111 Lot 13) is on the same block as the church (Block 8111 Lot 86).*

**F195. The Matinecoc memorial stone** is in Zion's cemetery — see F55, F56, F57. The inscription
in evidence is QUOTE (Wikipedia): `"Here rest the last of the Matinecoc."` The marker's design is
described by LPC as QUOTE (LP-2155 fn 7): `"a stone monument depicting a tree growing from a split
rock, their tribal mark."`
**P36. The Matinecoc memorial stone, Zion Episcopal Church cemetery, Douglaston.**
*The wording of the inscription comes from Wikipedia only; LPC does not quote it. If the page prints
the inscription, that is a Wikipedia-sourced quotation and should be verified against a photograph.*

**F196.** QUOTE (Wikipedia, Douglaston–Little Neck): `"The Zion Episcopal Church was the setting for
the movie First Reformed starring Ethan Hawke as well as the television series The Blacklist."`

**F197.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Other community activities include Theater á
la Cartè, which provides live theater at the Douglaston Community Church and the Douglaston
Community Theater players, who perform at the Zion Episcopal Church. ... Monthly concerts are held
at the Douglaston Community Church."`
**P37. Douglaston Community Church** — no address in evidence, no reachable website (F5).
**P38. Theater á la Carte** and **P39. Douglaston Community Theater** — Wikipedia-only, no
independent source retrieved.

---

## 8. PARKS, THE WATERFRONT AND THE NATURAL SETTING

### 8.1 Alley Pond Park — see §1.3 for the boundary evidence

**P40. Alley Pond Park.** See F29–F38 for the assignment evidence. History facts below.

**F198.** QUOTE (Wikipedia, Alley Pond Park): `"Alley Pond Park was mostly acquired and cleared by
the city in 1929, as authorized by a resolution of the New York City Board of Estimate in 1927."`
and QUOTE: `"Queens borough president Maurice E. Connolly wrote a letter to the city in 1927,
suggesting that the tributary of the Little Neck Bay south of Northern Boulevard could be acquired
for one such park called Alley Park. His successor Bernard M. Patten also supported the purchase of
the land, and Douglaston civics groups argued in favor of the park."`
*Note: **Douglaston civic groups are credited with pushing for the park's creation.** This is the
clearest Douglaston-side claim on Alley Pond Park in evidence.*

**F199.** QUOTE (Wikipedia, Alley Pond Park): `"the city acquired the Alley site for such purposes on
June 24, 1929. Later that year, the New York City Department of Parks and Recreation (NYC Parks)
expanded the park into a 330-acre (130 ha) landscape surrounding the Alley and removed some older
structures, including the Burhman store. After this acquisition had been approved, Mayor James J.
Walker declared that 'there is no better site in Queens' for a park."`

**F200.** QUOTE (Wikipedia, Alley Pond Park): `"These sections officially opened in 1935 with a
ceremony attended by Mayor Fiorello H. La Guardia and Parks Commissioner Robert Moses. At opening,
the park had 26 acres (11 ha) of new playing fields; the Alley Pond Park Nature Trail, the first of
its kind in the city; a 23-acre (9.3 ha) bird sanctuary; bridle paths; tennis court; picnic areas;
and a 200-space parking lot."`

**F201.** QUOTE (Wikipedia, Alley Pond Park): `"an 18th-century commercial and manufacturing center
there became known as 'the Alley'"` and QUOTE: `"The valley also contained the region's first mail
route, established in 1764. Colonists also used the valley as a route to Brooklyn, the Hempstead
Plains and the Manhattan ferries, and U.S. president George Washington is thought to have used this
route for his 1790 tour of Long Island."`

**F202. A 1959 dispute that directly involved Douglaston landowners.** QUOTE (Wikipedia, Alley Pond
Park): `"A 1959 proposal to add 91 acres (37 ha) along the bay to Alley Pond Park was controversial
among Douglaston landowners, who wanted the land to be used for a commercial amusement center. The
related legislation was rejected almost unanimously by the New York City Council, with only the two
representatives of borough president John T. Clancy voting in favor of the expansion."`

**F203.** QUOTE (Wikipedia, Alley Pond Park): `"By the mid-1990s, development around Alley Pond Park
had led to pollution... This led local groups to propose that the city hire an administrator to run
numerous parks in eastern Queens, including Alley Pond Park, Crocheron Park, Cunningham Park,
Douglaston Park, Fort Totten, and Udalls Cove."`
*Note the list treats **Douglaston Park** as a park name distinct from Alley Pond Park. In the Parks
dataset the only "Douglaston Park" record is `Q411 Douglaston Park Golf Course`.*

### 8.2 The Queens Giant

**P41. The Queens Giant (also Alley Pond Giant / Alley Pond Park Giant), Alley Pond Park.**
**F204.** QUOTE (Wikipedia, Alley Pond Park): `"The Queens Giant (also known as the Alley Pond Giant
or Alley Pond Park Giant), at 40°45′12″N 73°44′49″W, is an old tulip poplar (Liriodendron
tulipifera) that is located in Alley Pond Park. It is the tallest carefully measured tree in New
York City, measuring 133.8 feet (40.8 m) tall with a 19-foot (5.8 m) circumference as of 2004, and
it might also be the oldest living thing in the New York metropolitan area, being between 350 and
450 years old in 2004."`
**DERIVED (NTA):** the stated coordinates 40.7533 N, −73.7469 W fall inside NTA `QN1191` Alley Pond
Park.

**F205. The age claim is contested inside its own source.** QUOTE (Wikipedia, Alley Pond Park):
`"However, NYC Parks is unsure of the margin of error regarding the Queens Giant's age, and its true
age may have a margin of error of several decades or centuries. Some arborists estimate the tree's
age at 250 years, making it younger than other trees in the city."`
Wikipedia's Douglaston–Little Neck article states the stronger claim without the caveat: QUOTE:
`"home to the Queens Giant, the oldest known tree (and living thing) in New York City."`
**Two Wikipedia articles, two different strengths of claim. Prefer the hedged one.**

**F206.** QUOTE (Wikipedia, Alley Pond Park): `"The Queens Giant is hidden within a grove, barely
visible from the westbound Long Island Expressway. The tree is near the Douglaston Plaza Mall, and
is accessible by foot from Alley Pond Park. The tree can be viewed by entering the park at Horace
Harding Expressway and East Hampton Boulevard, a small plaque at this entrance describes the tree
and its history and significance. The Queens Giant is surrounded by a metal fence on all sides to
protect it, and a hill and a sign describing the tree stand in front of it."` and QUOTE: `"The Queens
Giant is featured in the 2018 documentary film The World Before Your Feet."`

### 8.3 Udalls Cove and Udalls Park Preserve

**P42. Udalls Park Preserve (Parks ID Q452) / Udalls Cove.**
**F207.** DERIVED (Parks Properties `enfh-gkve`, `Q452`): `signname` = `"Udalls Park Preserve"`,
`acres` = **`"44.44"`**, `typecategory` = `"Nature Area"`, `location` = `"Northern Blvd., 244 St. to
247 St., Douglas Rd., Little Neck Bay"`, `zipcode` = `"11363"`, `communityboard` = `"411"`. The
Parks web page repeats `Acreage: 44.44`, `Zip Code: 11362, 11363`.

**F208. The acreage is contested across three sources.**
- Parks dataset and Parks web page: **44.44 acres**.
- QUOTE (Wikipedia, Douglaston–Little Neck): `"To the east along the water is Udalls Cove, a 90-acre
  (360,000 m2) wildlife sanctuary."`
- QUOTE (Wikipedia, Udalls Cove): `"The marsh wetlands of Udalls Cove measure up to 100 acres (40
  ha)."`
**44.44 / 90 / 100. Note the Parks figure is city parkland only; the Wikipedia figures may include
Nassau County land (F43). Do not reconcile silently.**

**F209. The glacial origin story, with the Native legend Parks prints first.**
QUOTE (NYC Parks, Udalls Park Preserve historical sign): `"According to local Native American lore,
there once lived on the shores of Long Island Sound two tribes of giants. When they were at war
with each other, the tribe on the Connecticut side would break off pieces of their mountains and
hurl them at the giants on Long Island. The Long Island giants, because they had no mountains,
would reciprocate by hurling boulders—a strategy that proved successful. The Long Island tribe's
victory is the legend that explains why Connecticut is strewn with boulders for many miles inland,
while Long Island has boulders along its northern shore."`

**F210.** QUOTE (same sign): `"As temperatures began to rise 15,000 years ago, the last glacier
receded from Long Island and debris was deposited throughout the landscape. On Long Island, it
created the range of hills along the North Shore—called the Harbor Hill Terminal Moraine. North of
these hills other flat-topped hills formed that now project into the Long Island Sound. These are
the peninsulas of Great Neck, Bayside, and Douglaston that flank the pre-glacial river valley of
Little Neck Bay and Udall's Cove. As the glacier continued to melt, runoff formed streams that cut
into the landscape, creating ravines. Here at Udall's Cove, the streams carried sand and silt, which
formed shallow intertidal flats that now collect water from throughout the area."`
*Note Parks writes "Udall's Cove" with an apostrophe throughout the sign and "Udalls Park Preserve"
without one in its own park name. Both are the city's own usage.*

**F211.** QUOTE (NYC Parks, Udalls Park Preserve sign): `"The Udall's Cove Preservation Committee
initiated the acquisition of Udall's Park Preserve. The group of local residents organized in 1969
in order to prevent development of the land and promote public ownership. Udall's Cove was first
mapped as a New York City park on December 7, 1972. The Preserve was created by a cooperative
agreement between Parks and the New York State Department of Environmental Conservation; the state
owns most of the land, but Parks manages the property."`

**F212. Aurora Gareiss — the founding figure, and the best human story on the waterfront.**
QUOTE (Udalls Cove Preservation Committee): `"Then one woman said, 'Enough.' Aurora Gareiss, a
feisty, middle-aged Douglaston resident whose home looked out on Udalls Cove, determined that what
was left of the wetlands and woods around the Cove should be conserved. And so, in late 1969, along
with a few dedicated friends and neighbors, she founded the Udalls Cove Preservation Committee
(UCPC)."` Source: `https://www.udallscove.org/`
**She is explicitly described as a Douglaston resident by the organisation she founded.**

**F213.** QUOTE (UCPC): `"On a Saturday morning in April, 1970, on the occasion of our nation's first
Earth Day, a dedicated group of citizens from Douglaston, Little Neck and Great Neck assembled at
the 'Back Road' (Sandhill Road) west of the Little Neck railroad station, between Little Neck and
Douglaston. Standing at the edge of a picturesque, one-acre freshwater pond, they committed
themselves to preserving the last remnants of undeveloped marshlands, shoreline and wooded uplands
in the Udalls Cove watershed. They followed up with the first of what would become annual cleanups
of the wetlands and the shoreline."`
**Note the site itself is described as "between Little Neck and Douglaston" — a contested location
by the source's own words.**

**F214.** QUOTE (UCPC): `"In recognition of Ms. Gareiss' outstanding contributions to conservation in
Udalls Cove and around the City and State, the lovely freshwater pond, with its water fowl and
muskrat and turtles, was officially named Aurora Pond."` and QUOTE: `"Aurora Pond itself was in dire
need of restoration – a project completed in 2006"` and QUOTE: `"Since 2004, UCPC has invested over
$240,000 in major restoration projects in the Aurora Pond, Ravine and Virginia Point sections of the
park."`
**P43. Aurora Pond. P44. The Ravine. P45. Virginia Point.**

**F215. Gabler's Creek and the geography of the preserve — the source's own description.**
QUOTE (UCPC): `"Udalls Cove is an inlet of Little Neck Bay, part of Long Island Sound, between the
Douglaston and Great Neck peninsulas. At the head of the Cove (its southern end) is a large and
healthy salt water marsh. Behind that, Aurora Pond lies at the center of freshwater wetlands,
bounded by steep, wooded slopes."`
QUOTE (UCPC): `"Two freshwater streams drain into the Cove. One of these, Gabler's Creek, runs
through the Wildlife Preserve. It flows north from Northern Boulevard (opposite St. Anastasia's
Church) through 'The Ravine,' a deep wooded gully that lies between Little Neck and Douglaston.
Gabler's Creek passes underneath the Long Island Railroad tracks just west of the Little Neck
Station. It flows into Aurora Pond, then back out and through a culvert underneath Sandhill Road
(known locally as 'the Back Road'), then out to the Cove through the salt marsh."`
**P46. Gabler's Creek.** **The Ravine is described by UCPC as lying "between Little Neck and
Douglaston" — a genuinely shared feature, flagged for the contested register.**

**F216.** QUOTE (UCPC): `"Udalls Cove is home to a wide variety of wildlife including egrets, herons,
ducks, geese, and swans; mammals such as muskrat, raccoons, fox, and even coyotes; toads, frogs and
salamanders; turtles; and many kinds of fish. Osprey – large 'fish eagles' that nest nearby – use
the area for fishing."`

**F217.** QUOTE (UCPC): `"Prior to the 1950's, the area between Douglaston and Great Neck north of
the Long Island Railroad was sparsely developed. Two small boatyards at the northern end of Little
Neck Parkway, at what is now called Virginia Point, were surrounded by salt marsh. During the
1950's and 1960's many more houses were built, and plans were even made for a golf course to be
built on filled wetlands. At the same time, the wooded uplands were being whittled away also, as
development encroached from all sides. To make matters worse, the remaining marshlands and woods
had become dump sites, littered with garbage, demolition debris and even wrecked cars."`

**F218.** QUOTE (UCPC): `"Founded in 1969, the Udalls Cove Preservation Committee (UCPC) is a
volunteer organization dedicated to the conservation, preservation and restoration of Udalls Cove,
and its associated wetlands and wooded uplands."` and QUOTE: `"UCPC has been providing 'CPR' to the
community ever since -- Conservation, Preservation and Restoration"`. Current president per the
site: **Walter Mugdan**; earlier presidents named as QUOTE: `"With Aurora Gareiss as its first
president, and later with Doug MacKay, Ralph Kamhi and Walter Mugdan as her successors"`.
**P47. Udalls Cove Preservation Committee.**

**F219.** QUOTE (Wikipedia, Udalls Cove): `"It contains a 15-acre oblong ravine, which was left
behind as a remnant of the Ice Age by a glacier. The ravine measures 200 feet wide, between
backyards of single-family homes, and has fresh-water streams in it that feed Udalls Cove."`

**F220.** QUOTE (Wikipedia, Udalls Cove): `"The Great Neck Estates Village Board paid $400,000 for 53
acres of marshland in Nassau County, bordering Udalls Cove in March 1967. On October 20, 1969, the
Udalls Cove Preservation Committee was established and its first meeting was held the day after
that."`
*UCPC's own site says "in late 1969" (F212); Wikipedia gives 20 October 1969. Both recorded.*

**F221. A 1970s development fight, quoted by Wikipedia from primary material in the Aurora Gareiss
Collection at Queens Borough Public Library.** QUOTE (Wikipedia, Udalls Cove): `"Mr. Sheldon Lobel,
an attorney from Woodside, represented two developers who wanted to eliminate a ravine, a 'hazardous
eyesore,' by building an enclosed mall opposite St. Anastasia Church on Northern Boulevard."` and
QUOTE: `"Virginia Dent of Douglaston, however, opposed, this plan and stated 'We're very upset and we
feel it's a rape of the community. It's all right for the Church to make money, but not at the
expense of the environment.'"`
*The Wikipedia sentence is ungrammatical ("opposed, this plan"); the inner quotation is presented by
Wikipedia as Virginia Dent's words. **P48. Virginia Dent** is identified as "of Douglaston".*

**F222.** QUOTE (Wikipedia, Udalls Cove): `"Aurora Gareiss stated, in response to how she feared her
efforts may have been for naught, 'Every time we have gone one step forward, we seem to have gone
two steps backward.'"`

**F223.** QUOTE (Wikipedia, Udalls Cove): `"Udalls Cove is a marshland and wetland area located in
Queens, New York City, off Little Neck Bay between Douglaston and Little Neck Bay. It is one of the
few remaining salt marshes on the North Shore in the Metropolitan area; another being the salt marsh
southwest of the cove, at Alley Pond Park."`
*The phrase "between Douglaston and Little Neck Bay" is nonsense as written — the source is
garbled. **Do not quote this sentence.** The substantive claim — one of the few remaining North
Shore salt marshes — is worth verifying elsewhere.*

### 8.4 The Alley Pond Environmental Center and the windmill

**P49. Alley Pond Environmental Center (APEC) — 229-10 Northern Boulevard.**
**Assignment is contested. See F36 and F37.** APEC's own site says Douglaston, ZIP 11362; GeoSearch
returns ZIP 11363, WOF neighbourhood **"Alley Pond Park"**, NTA **`QN1191` Alley Pond Park**.

**F224.** QUOTE (APEC's own site): `"For over 50 years, we have strived to educate children and
adults in the New York metropolitan area, protect and preserve Alley Pond Park, open spaces and
waterbodies, and advocate for sustainable environmental policies and practices."`
QUOTE (APEC, Mission & History page): `"The Alley Pond Environmental Center (APEC), a nonprofit
environmental education organization, is dedicated to educating children and adults in the New York
metropolitan area, protecting and preserving Alley Pond Park, open spaces and waterbodies, and
advocating for sustainable environmental policies and practices."`
Source: `https://www.alleypond.org/` and `https://www.alleypond.org/mission--history.html`
*The "Mission & History" page served only the Mission. **No founding narrative is in evidence from
APEC itself.***

**F225. Founding — Wikipedia only, and it gives two versions.**
- QUOTE (Wikipedia, Alley Pond Park): `"The Alley Pond Environmental Center (APEC) was founded in
  1972 by Joan and Hy Rosner as a grassroots organization that advocated for the park. The APEC
  building, on the south side of Northern Boulevard, was announced in 1975 as part of a series of
  improvements across Queens. The building opened in 1976 and contains a library, museum and animal
  exhibits. By 2011, it had eight staff members and 1,000 volunteers, and its programs had served
  over 62,000 students."`
- QUOTE (Wikipedia, Douglaston–Little Neck's parent text is silent; but Wikipedia, Alley Pond Park,
  Conservation section): `"The Alley Pond Environmental Center (APEC), founded in 1972, moved to its
  own building on Northern Boulevard four years later."`
- QUOTE (Wikipedia, Douglaston Manor Windmill): `"In 1972, an inspiring collaboration between
  nature-focused community members and the NYC Parks Department led to the establishment of APEC
  (Alley Pond Park Environmental Center) on the property. Led by activists Hy and Joan Rosner and
  other residents,"`.

**F226.** QUOTE (Wikipedia, Alley Pond Park): `"The Alley Pond Environmental Center relocated to a
temporary location at 224–75 76th Avenue in Oakland Gardens in 2019, after a renovation of its
Northern Boulevard headquarters had begun that September. The renovation of the APEC building was
delayed due to the COVID-19 pandemic. The restored complex is now open and tours are scheduled
daily."`
*The current APEC site (F224) gives 229-10 Northern Boulevard as the visiting address, consistent
with a completed return.*

**P50. Douglaston Manor Windmill (c.1870s–1988) and its 2005 replica at APEC.**
**F227. This is a Douglaston object that no longer stands in Douglaston.**
QUOTE (Wikipedia, Alley Pond Park): `"An 1870s-era windmill 1 mile (1.6 km) away at Arleigh Road, on
the Douglaston peninsula, was relocated to the park when the windmill's original site was threatened
with development, and was intended to be used as an APEC exhibit; however, the windmill was burned in
an arson two years later. APEC volunteers raised money to build a 40-foot (12 m) replica, which was
completed in 2005."`
QUOTE (Wikipedia, Douglaston Manor Windmill): `"Douglaston Manor Windmill (c.1870s-1988) was a Dutch
windmill built in Little Neck, New York to pump water for farming. Alley Pond Park has a standing
windmill (built 2005) that is a replica of the Douglaston Manor windmill. The windmill's tower was
relocated to Alley Pond Park after being threatened with demolition in November 1986, having been
originally situated on Arleigh Road in Douglaston. A committee formed to save the windmill raised
US$50,000 to relocate the structure."`
**Note the first sentence says the windmill was "built in Little Neck" and the third says it was
"originally situated on Arleigh Road in Douglaston". Arleigh Road is in Douglas Manor. The article
contradicts itself in three sentences.**

**F228. The Douglaston Manor Windmill Wikipedia article is low quality and contradicts itself
repeatedly. Use with care or not at all.** Instances found:
- "built in Little Neck" vs "originally situated on Arleigh Road in Douglaston" (F227).
- QUOTE: `"In 1876, Douglas' son, William, generously donated a station building to the Flushing and
  North Shore Railroad, which decided to name a new stop after him"` — every other source dates the
  station donation to **1866/1867** (F236, F239).
- QUOTE: `"Thirty years later, William developed a private community known as Douglaston Manor,
  which now comprises 570 homes."` — LP-1957 attributes the 1906 development to Rickert-Finlay, not
  to William Douglas (F128), and counts over 600 houses (F123).
- QUOTE: `"the recently formed Douglaston Little Neck Historical Society is actively pursuing
  historic district designation for Douglas Manor and the adjacent Hill section."` — written in the
  present tense about events of the 1990s; both districts were designated in 1997 and 2004.
- The article dates the relocation to 1986 and the fire to QUOTE: `"a regrettable February 23, 1988
  incident"`, while the Alley Pond Park article says the windmill burned `"two years later"` after
  relocation.
**Recorded in full only so the verifier can see how bad it is.**

**F229.** QUOTE (Wikipedia, Douglaston Manor Windmill): `"The Douglaston mill stands out from the
typical tall, octagonal curved windmills found in other parts of Long Island. Unlike its
counterparts, this mill has a unique squat design with four sides, and its original round shingles
have been covered with stucco over time. Unfortunately, it suffered significant damage during a
severe hurricane in 1938, rendering its sails beyond repair. Now, empty black sprockets serve as a
reminder of where the blades once fit."`
*Wikipedia presents this as a quotation from an unnamed source. **Provenance unclear.***

**F230.** QUOTE (Wikipedia, Douglaston Manor Windmill): `"The primary purpose of this windmill is to
draw water from a well that reaches a depth of 55 feet. The water is then pumped through a
300-foot-long pipe system, eventually reaching a picturesque irrigation pond surrounded by lush
foliage."` and QUOTE: `"One of two standing Aermotor windpumps in Queens, (The other is the Adriance
Farm Windmill at the Queens Farm Museum), it is the only one with a dry 800 gallon holding tank and
pumps water to a pond."`

**F231.** QUOTE (Wikipedia, Alley Pond Park): `"Windmill Pond, near the Alley Pond Environmental
Center at Northern Boulevard, is powered by a windmill. Cattail Pond, also near the APEC building,
is at the lowest point of a cattail marsh that includes Marsh St. John's wort and swamp milkweed as
well as water plantain and arrow arum."`
**P51. Windmill Pond. P52. Cattail Pond.**

### 8.5 Douglaston Park Golf Course

**P53. Douglaston Park Golf Course (Parks ID Q411).** **Assignment split by the NTA line — see
F38.**
**F232.** DERIVED (Parks Properties `enfh-gkve`, `Q411`): `signname` = `"Douglaston Park Golf
Course"`, `acres` = **`"104.6"`**, `typecategory` = `"Managed Sites"`, `location` = `"61 Ave. bet.
Marathon Pkwy., Commonwealth Blvd. and 242 St."`, `zipcode` = `"11362"`, `communityboard` = `"411"`.

**F233.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Southern Douglaston–Little Neck has an
18-hole, par 67 golf course. Formerly known as the North Hills Country Club, the 104-acre (0.42
km2) course opened in 1927 and became a municipal course in the 1960s. The Douglaston Park Golf
Course underwent significant renovations in 2004. The course is situated at one of the highest
points in the borough of Queens, providing views of the Manhattan skyline, and has a restaurant."`

**F234. DERIVED (PLUTO).** `6320 MARATHON PARKWAY`, ZIP 11362, `ownername` = `"NYC DEPARTMENT OF
PARKS AND RECREATION"`, `bldgclass` `Q5`, `landuse` `9`, `yearbuilt` **1927**, `numfloors` 2,
`lotarea` **2,178,000 sq ft** (exactly 50.0 acres), `bldgarea` 32,000 sq ft.
**The 1927 date in PLUTO independently corroborates the Wikipedia opening date. The 50-acre tax lot
is only part of the 104.6-acre Parks property.**

**F235.** DERIVED (DOHMH): `DOUGLASTON GC GOLF COURSE`, `63-20 MARATHON PARKWAY`, ZIP 11362,
`cuisine` `"American"`. **DOHMH is the ONLY source in this dossier documenting food service at the
golf course beyond Wikipedia's bare "has a restaurant". No name for the restaurant is in evidence.**

### 8.6 Other parkland in and around Douglaston

**F236. DERIVED (Parks Properties `enfh-gkve`, `borough='Q'`, `communityboard='411'`).** Parks
properties in Community District 11 whose ZIP is 11362 or 11363 (i.e. the Douglaston–Little Neck
ZIPs), with their own `location` strings:

| signname | acres | typecategory | location | zip |
|---|---|---|---|---|
| **P54. Douglaston Park Golf Course** | 104.6 | Managed Sites | 61 Ave. bet. Marathon Pkwy., Commonwealth Blvd. and 242 St. | 11362 |
| **P55. Udalls Park Preserve** | 44.44 | Nature Area | Northern Blvd., 244 St. to 247 St., Douglas Rd., Little Neck Bay | 11363 |
| **P56. Louis Pasteur Park** | 3.673 | Jointly Operated Playground | 248 St. bet. Van Zandt Ave. and 52 Ave. | 11362 |
| **P57. Challenge Playground** | 2.035 | Jointly Operated Playground | 251 St. bet. 61 Ave. and 63 Ave. | 11362 |
| **P58. Admiral Playground** | 0.759 | Jointly Operated Playground | Little Neck Pkwy. bet. 42 Ave. and 43 Ave. | 11363 |
| **P59. Alameda Malls** | 0.553 | Mall | Alameda Ave. bet. Northern Blvd., Hanford St. and Northern Blvd., 247 St. | 11362 |
| **P60. Nassau Mall** | 0.836 | Triangle/Plaza | Horace Harding Exwy. Sr. Rd. N., Little Neck Pkwy., Nassau Blvd. | 11362 |
| **P61. Nassau Mall South** | 0.834 | Triangle/Plaza | Horace Harding Exwy. Sr. Rd. S., 254 St., 57 Ave. | 11362 |
| **P62. Glenwood Landing** | 0.3 | Triangle/Plaza | Glenwood St., 39 Rd. | 11363 |
| **P63. Catharine Turner Richardson Park** | 0.101 | Triangle/Plaza | Douglaston Pkwy., Prospect Ave. bet. Poplar St. and Pine St. | 11363 |

**F237. Catharine Turner Richardson Park is the single most Douglaston-specific small park, and its
Parks `location` string uses the post-2012 street names** — `"Douglaston Pkwy., Prospect Ave. bet.
Poplar St. and Pine St."` — i.e. it sits inside the Douglaston Hill Historic District street grid.
The Parks web page gives `Acreage: 0.10`, `Zip Code: 11363`, `Community Board: 11`, `Park ID: Q059`.
**Its Historical Signs page served only the boilerplate line (F3-type failure) — there is NO
history text and NO biography of Catharine Turner Richardson in evidence.**
*Independent trace: LP-1957's own Van Wyck material and Wikipedia's Van Wyck article both mention a
"Mrs. C. Turner Richardson". QUOTE (Wikipedia, Cornelius Van Wyck House): `"Mrs. C. Turner
Richardson described the history and significance of this house to 60 members of the Museums Group
of the Women's Club of Douglaston during a meeting in the same house in 1950."` **This is the only
in-evidence link between the park's namesake and a person, and it is not stated as such by any
source. Flagged as an inference, NOT a fact.***

**F238.** DERIVED (Parks Properties): parks in CD 11 that are **not** in the Douglaston ZIPs and
belong to Bayside or Oakland Gardens, listed here only so the author does not claim them:
**P64. Crocheron Park** (45.79 ac, `"214 Pl., 214 La., 215 Pl, Cross Island Pkwy. bet. 33 Ave. and
35 Ave."`, 11361); **P65. John Golden Park** (17.0 ac, 11360/11361); **P66. Raymond O'Connor Park**
(5.4 ac, 11361); **P67. Alley Park** playground (2.446 ac, `"67 Ave. bet. 230 St. and 233 St."`,
11364); **P68. Motor Parkway** nature area (13.894 ac, 11364); Bayside Fields; Francis Lewis
Playground; Oakland Gardens; Tall Oak Playground; Saul Weprin Playground; Marie Curie Playground;
Seven Gables Playground; Telephone Playground; Linnaeus Park; Captain Dermody Triangle; Bell Malls;
Mall Forty Two XLII.

**F239.** DERIVED (Parks Properties): **P69. Cross Island Parkway** (`Q135`, 326.895 ac, ZIPs
`"11003, 11357, 11359, 11360, 11361, 11362, 11364, …"`, `communityboard` `"407411413"`) and
**P70. Grand Central Parkway** (`Q084`, 160.415 ac, `communityboard` `"408411413"`) are Parks
properties and both are named as Douglaston's boundaries by Wikipedia (F15).

---

## 9. TRANSPORTATION

**P71. Douglaston station, LIRR Port Washington Branch — 235th Street and 41st Avenue.**
DERIVED: `235th Street and 41st Avenue` failed to geocode as an intersection; the nearby DOHMH
addresses `40-45`, `42-05` and `42-34 235 Street` all return WOF **"Douglaston"**, NTA `QN1103`,
ZIP 11363. DERIVED (PLUTO): a `U7` (railroad) lot addressed `230 STREET`, ZIP 11363, `ownername`
**`"MTA - LIRR"`**, lotarea 286,280 sq ft.

**F240.** QUOTE (Wikipedia, Douglaston station): `"Douglaston is a station on the Long Island Rail
Road's Port Washington Branch in the Douglaston neighborhood of Queens, New York City. The station
is at 235th Street and 41st Avenue, off Douglaston Parkway and Wainscott Avenue, and is 13.9 miles
(22.4 km) from Penn Station in Midtown Manhattan. The station is part of CityTicket, and has an
underground walkway between the two platforms."` and QUOTE: `"The station has two at-grade
high-level side platforms, each 10 cars long."`

**F241. The station's origin — and the naming of the neighborhood. Four accounts, all different.**
- QUOTE (Wikipedia, Douglaston station): `"Douglaston station was originally built on October 27,
  1866 by the North Shore Railroad of Long Island, a subsidiary of the New York and Flushing
  Railroad that named it Little Neck Station. A depot at the station was built in April–May 1867 at
  the expense of William P. Douglas, owner of most of the land in the area, and was named Douglaston
  in his honor, though the station was listed on timetables as 'Little Neck' from 1866 to June
  1870."`
- QUOTE (Wikipedia, Douglaston station): `"In 1870, a new Little Neck Station was built east of this
  one at its present location by the Flushing and North Side Railroad, and the existing station was
  renamed for land-owner and developer William P. Douglas."`
- QUOTE (LPC, LP-2155, p. 9): `"In 1866-67, the Flushing and Northside Railroad reached the Little
  Neck area. William Douglas donated a farm building from his estate to serve as the railroad
  station; in exchange, he asked that the station and the village around be called Douglaston."`
- QUOTE (LPC, LP-1957, p. 7): `"Douglas donated land for the railroad's right of way, and later,
  according to local histories, relocated one of his farm buildings to be used as a railroad
  station, asking in exchange that the new village be called 'Douglaston' (instead of Marathon, a
  competing name)."`
- QUOTE [OCR] (LPC, LP-0944): `"Wtlltsm P. Douglas donated the 'Douglaston' refYroad station. In the
  1860s, and despite the objectrons of many vtlJ&gers of Marathon, the tot-m scon became known •s
  Douglaston."`
- QUOTE (Wikipedia, Douglaston–Little Neck): `"The Little Neck and Douglaston stations opened in 1866
  on the North Shore Railroad (now the Long Island Rail Road's Port Washington Branch and the same
  line featured prominently in the famous F. Scott Fitzgerald novel The Great Gatsby) to serve the
  community and the dock area."`
**Railroad named as: "North Shore Railroad of Long Island" / "New York and Flushing Railroad" /
"Flushing and North Side Railroad" / "Flushing and Northside Railroad" / "Flushing and Northside
Railroad" / "Flushing and North Shore Railroad" (windmill article, F228). Date of the donation:
1866, 1866–67, 1867, "the 1860s", 1876. What Douglas gave: land for the right of way; a relocated
farm building; a donated depot. THE ONLY THING ALL SOURCES AGREE ON IS THAT THE NEIGHBORHOOD IS
NAMED AFTER WILLIAM (P.) DOUGLAS, IN EXCHANGE FOR SOMETHING HE GAVE THE RAILROAD, AND THAT THE
LOSING NAME WAS "MARATHON."**

**F242.** QUOTE (LPC, LP-2155, footnote 21): `"In 1887, Douglas and resident subscribers funded a
Queen Anne-style depot building and landscaping at the new Douglaston station. Flushing Journal,
April 9, 1887."`
QUOTE (Wikipedia, Douglaston station): `"In 1887, Douglas himself replaced the original station and
built a Queen Anne-style building for $6,000. The original depot was moved to a private site on
Little Neck Parkway, where it was still in use as a storehouse in 1914."`

**F243. The current station house is a named piece of architecture.**
QUOTE (Wikipedia, Douglaston station): `"Long after the F&NS was acquired by the LIRR, the
Douglas-built depot was torn down and replaced with a one-story Mid-Century modern station house in
1962, as was the case with many LIRR stations during the 1950s and 1960s. In this case, the previous
station was genuinely in poor condition, and the newer station was designed by a local resident
Allan Gordon Lorimer, and accepted both by the LIRR and Douglaston residents. The wooden shelters
were replaced with matching tunnel entrances. Aside from the high-level platforms and the addition
of MTA Ticket Vending Machines, the station has remained in the same condition ever since."`
**P72. The 1962 Douglaston station house, by Allan Gordon Lorimer, a Douglaston resident.**
*This is the strongest "modern architecture" item on the page and it comes from Wikipedia only.
No MTA source is in evidence (F6).*

**F244. There is no subway.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Though there are no New
York City Subway stations near Douglaston–Little Neck, the neighborhood is served by MTA Regional
Bus Operations' Q12, Q30 and Q36 local buses, which connect to the subway. In addition, the QM5,
QM8 and QM35 express buses provide direct service to Manhattan, while the n20G and n20X buses
provide closed-door bus service between the neighborhood and Roslyn."`
**All bus routes here are Wikipedia-only; MTA returned 403 (F6). Verify before printing route
numbers.**

**F245.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Two major Long Island highways pass through
Douglaston–Little Neck: Interstate 495 (the Long Island Expressway) and the Cross Island Parkway. A
third, the Grand Central Parkway, forms the southern boundary of the neighborhood."`

**F246. The Little Neck station level crossing — a claim about a place that is NOT Douglaston.**
QUOTE (Wikipedia, Douglaston–Little Neck): `"The Little Neck station is located at Little Neck
Parkway and 39th Road. The latter is located next to a busy railroad crossing with Little Neck
Parkway, which is regarded as one of the most dangerous in New York City due to its high volume of
traffic."`
**Little Neck station is in Little Neck (DERIVED (WOF): `39-02 Little Neck Parkway` → "Little
Neck"). Outside this corpus. Recorded so it is not accidentally imported.**

**F247.** QUOTE (Wikipedia, Alley Pond Park): `"Alley Creek is surrounded by some of the last
remaining old-growth forest in Queens. The creek is crossed by a masonry-and-metal span carrying
Northern Boulevard and a viaduct carrying the Long Island Rail Road's Port Washington Branch."`
**P73. The LIRR viaduct over Alley Creek.**

---

## 10. INSTITUTIONS, CIVIC LIFE AND COMMERCE

**P74. National Art League — 44-21 Douglaston Parkway, Douglaston, NY 11363.**
QUOTE (nationalartleague.org, via WebFetch): `"The National Art League is a nonprofit that unites
professional artists, students, and art enthusiasts to advance the arts of drawing, painting, and
sculpture."` The site gives the address `44-21 Douglaston Parkway, Douglaston, NY 11363`, phone
718-224-3957, and references a **"95th Annual Online Juried Open Exhibition"** in 2026.
**No founding date is stated on the retrieved page.** The `/about-us`, `/about` and `/history` paths
all returned 404.
DERIVED (PLUTO): `44-21 DOUGLASTON PARKWAY`, ZIP 11363, `ownername` = **`"NATIONAL ART LEAGUE"`**,
`bldgclass` `W8`, `landuse` `8`, `yearbuilt` **1934**, `numfloors` 2, `lotarea` 2,375 sq ft,
`bldgarea` 1,900 sq ft.
QUOTE (Wikipedia, Douglaston–Little Neck): `"The National Art League on Douglaston Parkway offers
classes and provides a place for artists to show and sell their work."`
**A 95th annual exhibition in 2026 implies a first exhibition around 1931–32, and the building dates
from 1934. That is an inference, not a fact, and I am not asserting it.**

**P75. Douglaston and Little Neck Historical Society, Inc. — PO Box 630142, Little Neck, NY 11363.**
QUOTE (dlnhs.org): `"Help us publicize, preserve, and protect the historical significance of
Douglaston and Little Neck. Support the collection, research, and dissemination of historical
information to the public through our free bi-yearly newsletter and our various educational
activities."` Mailing address on the site: QUOTE: `"Douglaston and Little Neck Historical Society,
Inc. / PO Box 630142 / Little Neck, NY 11363"`. The site advertises QUOTE: `"Read our SPRING 2026
Newsletter. Special Edition – AMERICA 250"` and QUOTE: `"View the Thomas Van Riper Celebrity Map!
(pdf)"` (credited to Gloria Bodie).
The homepage carousel captions are themselves historical records — QUOTE: `"A.P. Wright & Son Garage
on Broadway (now Northern Blvd) circa 1922. Alfred Wright is behind the car and son Elbert is on the
left."`; QUOTE: `"251-10 Northern Blvd (circa 1930-1940). Former Carriage House/Garage of Alfred P.
Wright. This picture was taken after the widening of Northern blvd."`; QUOTE: `"Carriage Shop on
Broadway (Northern Blvd) before 1922"`; QUOTE: `"Carriage in front of Van Wyck house"`.
**Note: Northern Boulevard was formerly called BROADWAY, per the society's own captions. Note also
the society's own PO box is a Little Neck address, and 251-10 Northern Blvd is on the Little Neck
side of the WOF line (F39).**
LPC calls it QUOTE (LP-1957): `"the Douglaston & Little Neck Historical Society"` (ampersand) and
QUOTE (LP-2155): `"the Douglaston-Little Neck Historical Society"` (hyphen); the society itself
writes `"Douglaston and Little Neck Historical Society, Inc."` **Three renderings of the name.**

**P76. Douglaston Yacht Squadron.** QUOTE (douglastonyachtsquadron.com): the site advertises
`"Mooring Registration"` and a `"Launch Service Schedule"`, with `"Gatehouse phone number:
718-224-4827"`. **The retrieved page is a stale 2024 season page (19 KB) with no history, address or
description.**
QUOTE (Wikipedia, Douglaston–Little Neck): `"The Douglaston Yacht Squadron is the local yacht club
(there is also a junior yachting program called Douglaston Junior Sailing (DJYS), which teaches
youngsters under the age of 16 years how to sail). It is a part of the Douglaston Club"`.
*Wikipedia's abbreviation "DJYS" does not match the expansion "Douglaston Junior Sailing" it gives.
Source error, flagged.*

**P77. Immaculate Conception Center — 7200 Douglaston Parkway (PLUTO: 72-45 Douglaston Parkway),
Douglaston, NY 11362.**
DERIVED (NTA/WOF): `7200 Douglaston Parkway` → lon −73.733307, lat 40.747189, BBL 4083100300, ZIP
11362, WOF **"Douglaston"**, NTA `QN1103`.
DERIVED (PLUTO): `72-45 DOUGLASTON PARKWAY`, ZIP 11362, `ownername` = **`"ROCKLYN ECCLESIASTICAL
CORP."`**, `bldgclass` `M9`, `landuse` `8`, `yearbuilt` **1964**, `numfloors` 3, `lotarea`
**1,197,900 sq ft** (≈27.5 acres), `bldgarea` **268,500 sq ft**. *This is the single largest
privately owned building in ZIPs 11362/11363.*
QUOTE (immaculateconceptioncenter.org): `"The mission of the Immaculate Conception Center is to
provide a place for our guests to 'come away' from the world, to rest in silence, and to listen to
the voice of God. All are welcome!"` and QUOTE: `"The retreat center is situated on over 80 acres of
gardens, fields and forests."` and QUOTE: `"Our Main House and Guest House can lodge up to 75
individuals, with access to a chapel, full-service dining (for groups), conference halls, meeting
and break-out rooms, catering kitchen (for groups wishing to prepare their own meals), outdoor
stations of the cross, walking paths and recreational fields."` and QUOTE: `"Individuals interested
in completing the Spiritual Exercises of St. Ignatius may do so within a 30-day retreat."`
**PLUTO gives the tax lot as 27.5 acres; the Center says "over 80 acres." Recorded, unresolved —
the Center may count adjoining lots.**
The site also advertises QUOTE: `"Lithuanian Summer Festival / Sunday, August 2nd / 10am - 5pm"` and
QUOTE: `"Franciscan University / School of Spiritual Direction / Become a certified Spiritual
Director"`.

**F248.** The seminary history behind the building.
QUOTE (Wikipedia, Douglaston–Little Neck): `"The Immaculate Conception Center, formerly a
college-level seminary named Cathedral College of the Immaculate Conception and owned by the Diocese
of Brooklyn, is located in southern Douglaston. It is a large conference center, hosting Diocese
events and activities including language immersion classes, lay ministry preparation, adult
continuing education, seminarian instruction, parish retreats, and also hosts community civic
conferences. In the Fall of 2011, all administrative offices were relocated and the building hosted
eighty undergraduate seminarians studying at nearby St. John's University, in addition to retired
priests from the Diocese of Brooklyn."`
QUOTE (Wikipedia, Cathedral Preparatory School and Seminary): `"In 1967, Cathedral College of the
Immaculate Conception converted to a four-year college seminary and moved to Douglaston, New York."`
and QUOTE: `"In early 1914, Charles E. McDonnell, bishop of the Diocese of Brooklyn, decided that the
diocese needed a minor seminary (high school seminary) to ensure a supply of priests. He appointed
then Monsignor George Mundelein as the first rector of Cathedral College of the Immaculate
Conception."`
**Cathedral Preparatory School and Seminary itself is in ELMHURST, not Douglaston. Only Cathedral
College of the Immaculate Conception moved here in 1967. Do not conflate them.**

**P78. Douglaston Plaza / Douglaston Shopping Center — 242-02 61st Avenue, Douglaston, NY 11362.**
DERIVED (NTA/WOF): `242-02 61 Avenue` → lon −73.738536, lat 40.754667, BBL 4082860185, ZIP 11362,
WOF **"Douglaston"**, NTA `QN1103`.
DERIVED (PLUTO): `242-02 61 AVENUE`, `ownername` = **`"DOUGLASTON SHOPPING CENTER OWNER LLC"`**,
`bldgclass` **`K6`** (department store / shopping centre), `landuse` `5`, `yearbuilt` **1964**,
`numfloors` 3, `lotarea` **547,200 sq ft** (≈12.6 acres), `bldgarea` **296,432 sq ft**.
QUOTE (Wikipedia, Douglaston–Little Neck): `"The Douglaston Plaza Shopping Center is a major hub of
the community's economic activity. It contains a supermarket and other retail outlets and
restaurants."` and QUOTE: `"The First Tuesday in August also marks National Night Out, a community
building event in Douglaston, held at the Douglaston Plaza."`
Wikipedia's Alley Pond Park article calls it QUOTE: `"the Douglaston Plaza Mall"`.
**No official website resolves (F5). Names in evidence: "Douglaston Plaza", "Douglaston Plaza
Shopping Center", "Douglaston Plaza Mall", "Douglaston Shopping Center" (PLUTO owner name).**

**Rokstar Chicken**, `242-02 61 AVENUE`, ZIP 11362, cuisine `"Korean"` — DERIVED (DOHMH). This is the
same BBL as Douglaston Plaza, i.e. a tenant of the mall. **DOHMH is the ONLY source.**

**The 1950s–80s housing tracts.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Douglaston Park
contains a mixture of large, older homes as well as Capes, Tudors, and ranch-style homes dating from
the 1960s. The areas adjacent to the Douglaston Shopping Center are occupied mainly by attached
single-family homes built in the 1950s through 1970s (Beech Hills, Deepdale, and another development
known colloquially as the 'Korvette's Houses' due to the former proximity of an E.J. Korvette
department store), as well as four-story condominiums added in the mid-1980s."`
**"Beech Hills", "Deepdale" and the "Korvette's Houses" are three named sub-developments with no
source in evidence other than Wikipedia.**

**The Little Neck Theater.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Northern Boulevard was
developed into a commercial and cultural hub, and the Little Neck Theater, a 576-seat movie theater,
was opened in 1929 at the intersection of Northern Boulevard and Morgan Street. The theater was
closed in 1983."`
**Named "Little Neck Theater". DERIVED (WOF): Morgan Street is not in the geocoder's Douglaston
range. Treat as Little Neck unless the verifier finds otherwise.**

**Douglaston Hose Company No. 1.** QUOTE (LPC, LP-2155, p. 4 and p. 11): Denis O'Leary was
`"a founding officer of the Douglaston Hose Company No. 1."` LP-2155's bibliography cites
QUOTE: `"History of Douglaston Hose Company No. 1. Douglaston, New York: Douglaston Hose Co. No. 1,
1929."`
**A volunteer fire company. No date of founding is in evidence, only that O'Leary (a resident from
c.1901) was a founding officer and that a house history was published in 1929.**

**The modern fire company.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Douglaston–Little Neck
contains a New York City Fire Department (FDNY) fire station, Engine Co. 313/Ladder Co. 164, at
44-01 244th Street."` DERIVED (NTA/WOF): `44-01 244 Street` → lon −73.742199, lat 40.766809, BBL
4081120192, ZIP 11363, WOF **"Douglaston"**, NTA `QN1103`.
*Note the same Wikipedia paragraph continues QUOTE: `"The FDNY EMS Training Academy is located in Bay
Terrace at Fort Totten."` — **Fort Totten and Bay Terrace are NOT Douglaston.***

**The Memorial Day parade.** QUOTE (lndmemorialdayparade.org): the organisation names itself
`"Little Neck - Douglaston Memorial Day Parade Organization, Inc."` and describes itself as
`"Dedicated to those who gave their lives in the service of the United States of America"`. The page
references `"the Bishop Family Little Neck Douglaston Memorial Day Parade photo archive 2011 -
2013"` and mentions `"the annual art & essay contest, the interfaith service, various award
ceremonies, fundraising events and the parade."` It names a `"Former Grand Marshall Chet Marcus / RIP
4-13-2020"`.
QUOTE (Wikipedia, Douglaston–Little Neck): `"Every year Douglaston–Little Neck hosts a Memorial Day
Parade which runs from Great Neck to Douglaston Parkway along Northern Boulevard."`
**The parade's own name puts Little Neck FIRST. Its route as Wikipedia describes it starts in
NASSAU COUNTY (Great Neck) and ends at Douglaston Parkway. It is a shared event, not a Douglaston
event. No claim about its size is in evidence — I found no source calling it the largest Memorial
Day parade in the country, and the author must not assume one.**

**Libraries.** QUOTE (Wikipedia, Douglaston–Little Neck): `"The Queens Public Library operates two
branches in the neighborhood. The Douglaston/Little Neck branch is located at 249-01 Northern
Boulevard, and the North Hills branch is located at 57-04 Marathon Parkway."`
DERIVED (NTA/WOF): `249-01 Northern Boulevard` → WOF **"Douglaston"**, ZIP 11362, NTA `QN1103`.
`57-04 Marathon Parkway` → WOF **"Douglaston"**, ZIP 11362, NTA `QN1103`.
**QPL's own pages did not retrieve (F7). Both branches geocode to Douglaston, but the first is
NAMED for both neighborhoods.**

**Post offices.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Horace Harding Station – 56-01
Marathon Parkway"` and `"Little Neck Station – 250-10 Northern Boulevard"`.
DERIVED (WOF): `56-01 Marathon Parkway` → **"Little Neck"**; `250-10 Northern Boulevard` →
**"Little Neck"**. **Neither post office geocodes to Douglaston. There is no Douglaston-named post
office in evidence.**

**Schools.** QUOTE (Wikipedia, Douglaston–Little Neck): `"PS 94 David D. Porter (grades PK-5) / PS 98
The Douglaston School (grades PK-5) / PS 221 North Hills (grades PK-5) / PS 811 Multiple Handicap
School of Queens (grades 1–6)"`, feeding into `"JHS 67 Louis Pasteur Middle School"`, and QUOTE:
`"After middle school, Douglaston–Little Neck's public school students are zoned for Benjamin N.
Cardozo High School, in neighboring Bayside."`
QUOTE (same): `"Divine Wisdom Catholic Academy is a private Catholic school, with classes from the
pre-school level to 8th grade."`
**Only PS 98 carries the Douglaston name. Cardozo HS is explicitly placed in Bayside by the source.
No school addresses are in evidence.**

---

## 11. RESTAURANTS AND FOOD BUSINESSES — AND THE DOHMH-ONLY WARNING

**F249. READ THIS BEFORE WRITING A SINGLE RESTAURANT SENTENCE.** Every food business listed in this
section was found in **one** dataset: the **NYC DOHMH Restaurant Inspection Results** file
(`43nn-pn8j`). I retrieved 689 inspection rows for ZIPs 11362 and 11363, resolving to **77 unique
`camis` establishments**. I then geocoded every one of them.

**For every business named below, the ONLY source is the DOHMH inspection dataset unless the entry
says otherwise.** DOHMH tells you a permit existed at an address on an inspection date and what
cuisine code an inspector typed. It does **not** establish that a place is currently open, that it
is notable, that it is good, or that anything at all has been written about it. **Three exceptions**
appear below where a second source exists.

### 11.1 The businesses the geocoder assigns to DOUGLASTON

**Douglaston Parkway cluster (ZIP 11363) — five establishments, all DOHMH-only:**
- `IL SAPORE ITALIANO PIZZERIA`, 44-17 Douglaston Parkway, cuisine `"Pizza"`
- `DOUGLASTON DELI`, 44-23 Douglaston Parkway, cuisine `"Sandwiches"`
- `IVORY KITCHEN`, 44-25 Douglaston Parkway, cuisine `None`
- `BEST GARDEN CHINESE RESTAURANT` / `NEW BEST GARDEN CHINESE RESTAURANT INC`, 44-35 Douglaston
  Parkway, cuisine `"Chinese"` — **two separate `camis` records at one address, i.e. an ownership
  or permit change. Do not present as one continuous business.**
- `K KIMCHI`, 44-37 Douglaston Parkway, cuisine `"Korean"`
DERIVED (WOF/NTA): all → **"Douglaston"**, `QN1103`.
*Note: this is the block that also contains the National Art League at 44-21 Douglaston Parkway.*

**235th Street cluster, by the LIRR station (ZIP 11363) — three establishments, all DOHMH-only:**
- `EL PASO`, 40-45 235 Street, cuisine `"Mexican"`
- `IL TOSCANO RISTORANTE`, 42-05 235 Street, cuisine `"Italian"`
- `PICCIOTTO`, 42-34 235 Street, cuisine `None`
DERIVED (WOF/NTA): all → **"Douglaston"**, `QN1103`.

**Northern Boulevard, western (Douglaston-assigned) end — DOHMH-only:**
- `MIZUMI`, 231-10 Northern Boulevard, ZIP 11363, cuisine `"Japanese"` → WOF "Douglaston", `QN1103`
- `NAMI SUSHI`, 242-03 Northern Boulevard, ZIP 11363, cuisine `"Japanese"` → WOF "Douglaston"
- `AEGEA WEST`, 242-05 Northern Boulevard, ZIP 11363, cuisine `"Pizza"` → WOF "Douglaston"
- `KNOX GOLF ACADEMY`, 232-01 Northern Boulevard, ZIP 11363, cuisine `None` → **WOF "Douglaston" but
  NTA `QN1191` Alley Pond Park**, and PLUTO says that lot is owned by **NYC Parks** (F236 area).
  **This is the Alley Pond Golf Center parcel. Contested. See F250.**

**248-249 Northern Boulevard block (ZIP 11362) — WOF says Douglaston, Wikipedia's Marathon Parkway
rule says Little Neck (F41). All DOHMH-only:**
`CAFE BLESSING` (248-25, `"Coffee/Tea"`); `DUNKIN' / BASKIN ROBBINS` (248-09, `"Donuts"`);
`TOSKANA PIZZERIA` (248-25, `"Pizza"`); `SUNGBOOKDONG BBQ` (248-25, `"Korean"`);
`NEW GREAT WOK (KING WOK)` (248-25, `"Chinese"`); `MANNA SUSHI SEN` (248-25, `"Japanese"`);
`TI HU TAIWANESE CUISINE` (249-11, `"Chinese"`); `TEN SECONDS YUNNAN RICE NOODLE(S)` (249-17,
`"Chinese"`, **two `camis` records**).
**248-25 Northern Boulevard holds five separate establishments — it is a multi-tenant building.**

**Elsewhere, Douglaston-assigned, DOHMH-only:**
- `NANA'S WONDERLAND`, 45-07 248 Street, ZIP 11362, cuisine `"American"` → WOF "Douglaston"
- `ROKSTAR CHICKEN`, 242-02 61 Avenue, ZIP 11362, `"Korean"` → WOF "Douglaston" — **tenant of
  Douglaston Plaza (same BBL, P78)**
- `DOUGLASTON MANOR`, 63-20 Commonwealth Boulevard, ZIP 11362, `"American"` → WOF "Douglaston".
  **Name collision hazard: "Douglaston Manor" is (a) the historic Douglas Manor development, (b)
  this catering/event business at 63-20 Commonwealth Boulevard, and (c) the title of a Wikipedia
  article about a windmill. Three different things.**

**The two with a second source:**
- `DOUGLASTON CLUB`, 600 West Drive, ZIP 11363, `"American"` — second source: LPC LP-1957 (F188).
  **Private club.**
- `DOUGLASTON GC GOLF COURSE`, 63-20 Marathon Parkway, ZIP 11362, `"American"` — second source:
  Wikipedia's `"and has a restaurant"` (F233). **The restaurant's own name is not in evidence.**

### 11.2 The businesses the geocoder assigns to LITTLE NECK — outside this corpus

**F250. This is where the page will leak if nobody is careful.** DERIVED (WOF): the following 30+
establishments are all in ZIP 11362 and all in NTA `QN1103` "Douglaston-Little Neck", but the
geocoder assigns every one of them to **"Little Neck"**:

`MCDONALD'S` (250-01 Northern Blvd); `LN 1380` (251-03); `OMAKASE ICHI` (251-09); `NEW NORTHERN
MANOR` (251-13); `EL HUARACHE MEXICAN GRILL` (251-18); `CHA MENYA` (251-20); `PRODE THAI` (251-28);
`GONG CHA` ×2 and `DON KITCHEN` (252-01); `YASAIYA SHABU-SHABU` (252-11); `LITTLE SOUP DUMPLING` and
`PARIS BAGUETTE` (252-20); `BEAN N BEAN` (252-29); `ACE BAGELS` (253-05); `CHAR SIU BAO BAKERY`
(253-07); `LITTLE SAIGON CUISINE` (253-09); `ROYAL ROOSTER HOTPOT` and `JIN XI 99 INC` (253-11);
`LINS'S LITTLE MOOSHU` (253-13); `BANGKOK AVENUE` (253-21); **`IL BACCO` (253-24)**; `SWEET WONTON
HOUSE` (253-25); `GOOD COMPANY TAVERN` (253-32); `LIMA 33` / `LIMA 33 RESTAURANT INC` (254-04);
`KEBAB HOUSE` (254-12); `DONUT CRAFT` (254-18); `BOCCONCINI` (254-19); `CHICKEN IS BACK` (254-22);
`1480 HK CAFE` (255-05); `RED LOTUS BAKERY & CAFE` (255-07); `LA BARAKA` (255-09); `CAFE 1 OF A
KIND` (255-13); plus `CARVEL` ×2, `TASTY COW 88 SZECHUAN CUISINE`, `PARIS BAGUETTE`, `JADE ASIAN
BISTRO`, `JIAN RESTAURANT`, `STARBUCKS`, `FIVE GUYS`, `CHIPOTLE MEXICAN GRILL`, `BOSTON MARKET` (all
Horace Harding Expressway); `FERN & AURORA DESSERT SHOP` (39-02 Little Neck Pkwy); `CAFE AZUL`
(58-25 Little Neck Pkwy); `MARATHON CAFE` (46-19 Marathon Pkwy); `JOE'S PIZZA & PASTA` (56-07);
`DANGO CHICKEN` (56-09); `MYUNG DONG NOODLE HOUSE` (56-21 Marathon Pkwy).

**`IL BACCO` at 253-24 Northern Boulevard is the best-known restaurant in the whole 11362/11363
sample and the geocoder places it in LITTLE NECK.** If the page names it, it is naming a Little Neck
restaurant. Flagged as the highest-risk single item in this section.

**F251. A demographic pattern visible in the data itself, offered as a candidate, not a conclusion.**
DERIVED (DOHMH cuisine codes across all 77 establishments in 11362/11363): the modal cuisines are
**Chinese (13), Korean (7), Japanese (5), Coffee/Tea (4), Pizza (4)**. This is consistent with, but
does not prove, Wikipedia's demographic statement at F252. **A page that describes the food scene
from these codes is describing the Little Neck end of Northern Boulevard, not Douglaston.**

**F252.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Douglaston–Little Neck has many independently
owned and operated restaurants and shops, many of which are located in the area around the
intersection of Douglaston Parkway or Little Neck Parkway and Northern Boulevard. This area is home
to a distinct cultural presence and traditional New York City–style pizzerias, delis, and bodegas."`
*The sentence names **both** Douglaston Parkway **and** Little Neck Parkway as the commercial
centres — again a shared claim.*

**F253.** QUOTE (Wikipedia, Alley Pond Park): `"The Alley Pond Golf Center is east of the Northern
Boulevard bridge over Alley Creek. The golf center has operated since the 1950s and has 70 stalls.
The golf center is especially popular among the Korean-American population of the surrounding area,
and signs at the complex are posted in both English and Korean."`
**This is the 232-01 Northern Boulevard parcel (F250, DOHMH `KNOX GOLF ACADEMY`). NTA says Alley
Pond Park; WOF says Douglaston; PLUTO says NYC Parks owns it. Triple-contested.**

---

## 12. DEMOGRAPHICS, CIVIC AND HEALTH DATA (all Wikipedia; all for the COMBINED area)

**F254. Every demographic figure below is for "Douglaston–Little Neck" or for the whole of Community
Board 11 (which also includes Bayside, Auburndale and Oakland Gardens). NONE of it is for Douglaston
alone. A page that prints these numbers as "Douglaston's" is misattributing them.**

**F255.** QUOTE: `"Based on data from the 2010 United States census, the population of
Douglaston–Little Neck was 24,739. The racial makeup of the neighborhood was 53.3% (13,195) White,
1.3% (317) African American, (15) Native American, 35.6% (8,818) Asian, 0.0% (2) Pacific Islander,
0.3% (69) from other races, and 1.2% (308) from two or more races. Hispanic or Latino of any race
were 8.1% (2,015) of the population."`

**F256.** QUOTE: `"The entirety of Community Board 11, which comprises both Douglaston–Little Neck
and Bayside, had 119,628 inhabitants as of NYC Health's 2018 Community Health Profile, with an
average life expectancy of 84.7 years. This is higher than the median life expectancy of 81.2 for
all New York City neighborhoods."`
*Note the source says CB 11 "comprises both Douglaston–Little Neck and Bayside" — it also comprises
Auburndale and Oakland Gardens (F25). The source undercounts.*

**F257.** QUOTE: `"As of 2017, the median household income in Community Board 11 was $70,155. In
2018, an estimated 14% of Douglaston–Little Neck and Bayside residents lived in poverty, compared to
19% in all of Queens and 20% in all of New York City. One in seventeen residents (6%) were
unemployed, compared to 8% in Queens and 9% in New York City. Rent burden ... is 49% in
Douglaston–Little Neck and Bayside, lower than the boroughwide and citywide rates of 53% and 51%
respectively. Based on this calculation, as of 2018, Douglaston–Little Neck and Bayside are
considered to be high-income relative to the rest of the city and not gentrifying."`
*Wikipedia's own summary elsewhere gives a different income figure: `"The median household income was
$85,500 (2019)"` per the WebFetch summary of the same article. **$70,155 (CB11, 2017) vs $85,500
(2019). Different geographies and years.***

**F258.** QUOTE: `"As of 2018, with a non-fatal assault rate of 8 per 100,000 people,
Douglaston–Little Neck and Bayside's rate of violent crimes per capita is the lowest of any area in
New York City."` and QUOTE: `"Douglaston–Little Neck and Bayside are patrolled by the 111th Precinct
of the NYPD, located at 45-06 215th Street. The 111th Precinct ranked 8th safest out of 69 patrol
areas for per-capita crime in 2010."`
DERIVED (NTA/WOF): `45-06 215th Street` → WOF **"Bayside"**, NTA `QN1102` Bayside. **The precinct
house is in Bayside.**

**F259.** QUOTE: `"Douglaston–Little Neck is one of New York City's least traditionally urban
communities, with many areas (particularly those north of Northern Boulevard) having a distinctly
suburban feel, similar to that of Nassau County towns nearby, such as Great Neck."`

**F260.** QUOTE: `"The area is also known for its historical society and other civic groups, notably
the Douglaston Civic Association and the Douglas Manor Association."`

**F261.** QUOTE: `"A local volunteer ambulance corps, the Little Neck–Douglaston Community Ambulance
Corps is supported and run by people in the community. It hosts blood drives and free classes to
teach the community CPR."`
*Another institution whose name puts Little Neck first.*

**F262.** QUOTE: `"For every supermarket in Douglaston–Little Neck and Bayside, there are 5
bodegas."` and QUOTE: `"The nearest major hospital is Long Island Jewish Medical Center in Glen Oaks.
Little Neck Hospital closed in 1996."`

**F263.** QUOTE: `"Douglaston–Little Neck is represented by the New York City Council's 19th and 23rd
Districts."`
DERIVED (Parks web pages): the Council Member listed for Udalls Park Preserve, Catharine Turner
Richardson Park and Douglaston Park Golf Course is **Vickie Paladino**; Alley Pond Park lists
**Vickie Paladino, Linda Lee** (two members, consistent with the park spanning two districts).

**F264.** QUOTE: `"The area is served by the Little Neck Ledger, owned by the TimesLedger Newspapers,
a chain of 14 weekly newspapers spread throughout Queens. Media giant News Corporation, which also
owns the New York Post, bought TimesLedger in October 2006."`
*The local paper is named for **Little Neck**. **I could not retrieve any issue of it** — see F1.*

---

## 13. NOTABLE RESIDENTS AND POPULAR CULTURE (all Wikipedia; all for the COMBINED area)

**F265. The list below is Wikipedia's "Notable residents" section of the Douglaston–Little Neck
article. It does not distinguish Douglaston from Little Neck, and Wikipedia gives no address for any
of them.** Verbatim from the article: Claudio Arrau (1903–1991), pianist; Lidia Bastianich (born
1947), celebrity chef (current resident); Ruth Benedict (1887–1948), anthropologist, `"lived here
after her marriage in 1914"`; Deborah Berke (born 1954), architect and dean of Yale School of
Architecture since 2016; Hugh Auchincloss Brown (1879–1975); John Matthew Cannella (1908–1996);
Mary Carillo (born 1957), sportscaster and former professional tennis player; James Conlon (born
1950), conductor; Alex Corbisiero (born 1988); Whitey Ford (1928–2020); **George Grosz (1893–1959),
artist**; Hedda Hopper (1885–1966); Jill Johnston (1929–2010); Alan Kalter (1943–2021); Philip La
Follette (1897–1965), three-term Governor of Wisconsin; **Angela Lansbury (1925-2022), actress**;
Crystal Liu (born 1987); Dick Lynch (1936–2008); Harold McCracken (1894–1983); **John McEnroe (born
1959)** and **Patrick McEnroe (born 1966)**, tennis players; **Thomas Merton (1915–1968), Trappist
monk and author of The Seven Storey Mountain**; Robert Neffson (born 1949); **Jean Nidetch
(1923–2015), founder of Weight Watchers**; **Ginger Rogers (1911–1995)**; Anthony Saidy (born 1937),
chess champion; Fred Saidy (1907–1982), playwright and screenwriter, `"whose works included Finian's
Rainbow"`; C. I. Scofield (1843–1921), `"creator of the Scofield Reference Bible"`; Oscar Shaw
(1887–1967); Frank Spangenberg (born 1957), `"record-holding Jeopardy! champion"`; **George Tenet
(born 1953), Director of Central Intelligence**; Arthur Treacher (1894–1975); Julian M. Wright
(1884–1938).

**F266.** DLNHS publishes its own version of this list as a map. QUOTE (dlnhs.org): `"Celebrity Map /
View the Thomas Van Riper Celebrity Map! (pdf)"`, credited `"Credit: Gloria Bodie"`.
**I did not retrieve the PDF. It is the one local-authority cross-check on the residents list and
the verifier should try it: it may distinguish Douglaston from Little Neck addresses, which
Wikipedia does not.**

**F267.** QUOTE (Wikipedia): `"Scenes from the movies American Gangster, Black Rain, Little Children,
The Arrangement, I Never Sang for My Father, Cops and Robbers, and After-Life were filmed in the
community. The films Rabbit Hole (2010), Son of No One (2011), and Run All Night (2014) were shot in
Douglaston–Little Neck."`

**F268.** QUOTE (Wikipedia): `"In the 30 Rock episode 'Hiatus', the community stood in for Needmore,
Pennsylvania. Mary Hudson, a character in 'The Laughing Man', a short story by J. D. Salinger, is
from this community. 'Machine', the masked character from the 1999 film 8mm, lived with his mother
in Douglaston–Little Neck and some of the film was shot in the neighborhood."`

**F269.** QUOTE (Wikipedia): `"In Jessica Jones season 1, the neighborhood served as the location of
Jessica's childhood home. Douglaston also appeared in Daredevil season 3 as the location of Ray
Nadeem's house."` and see F196 for *First Reformed* and *The Blacklist* at Zion Church.

**F270.** QUOTE (Wikipedia): `"In the 1931 film 'Smart Woman' starring Mary Astor (as Mrs. Nancy
Gibson), letters are addressed to Nancy at her mansion in 'Little Neck Hills, NY.'"`

**F271. The Great Gatsby claim — handle carefully.** QUOTE (Wikipedia, Douglaston–Little Neck):
`"the North Shore Railroad (now the Long Island Rail Road's Port Washington Branch and the same line
featured prominently in the famous F. Scott Fitzgerald novel The Great Gatsby)"`.
**The claim as written is about the *line*, not about Douglaston. Fitzgerald's Great Neck/Manhasset
Neck settings are in Nassau County. Do not upgrade this into "Gatsby was set in Douglaston."**

**F272.** QUOTE (Wikipedia, Douglaston–Little Neck): `"Little Neck was also famous for being the last
stop on the Underground Railroad until 1865."`
**This is a bare, unelaborated assertion about LITTLE NECK, not Douglaston. No other source in this
dossier mentions it. It is outside this page's territory AND unverified. Flagged twice.**

---

## 14. CONTESTED NEIGHBORHOOD ASSIGNMENT — THE REGISTER

Per the brief, every place any source assigns to a different one of the three wave-5 neighborhoods,
or to Little Neck, Bayside or Nassau County. **Recorded, not resolved.**

| # | Place | Address | Sources say | Verdict needed on |
|---|---|---|---|---|
| C1 | **Alley Pond Park** | Little Neck Bay to Springfield Blvd / Union Tpke | Parks dataset: CB **411**. Parks website: CB **11, 13**. DCP: its own NTA `QN1191`, inside CDTA QN11 (NOT a JIA, unlike FMCP and Forest Park). Wikipedia: `"bordered to the east by Douglaston, to the west by Bayside"`. Parks sign: Bayside and Douglaston are separate peninsulas. | Whether it belongs to Douglaston, to Bayside, to both, or (like FMCP and Forest Park) to no neighborhood file. **The brief asks for a ruling. The structural argument that carried FMCP and Forest Park — JIA CDTA status — does NOT apply here (F32).** |
| C2 | **Alley Pond Environmental Center**, 229-10 Northern Blvd | — | APEC itself: `"Douglaston, NY 11362"`. GeoSearch: ZIP **11363**, WOF **"Alley Pond Park"**, NTA **`QN1191`**. | Douglaston vs Alley Pond Park. Its self-description is the only Douglaston claim. |
| C3 | **Alley Pond Golf Center / Knox Golf Academy**, 232-01 Northern Blvd | ZIP 11363 | WOF: **"Douglaston"**. NTA: **`QN1191` Alley Pond Park**. PLUTO owner: **NYC Parks**. Wikipedia: `"east of the Northern Boulevard bridge over Alley Creek"`. | Douglaston vs Alley Pond Park. |
| C4 | **Douglaston Park Golf Course** | 61 Ave bet. Marathon Pkwy, Commonwealth Blvd, 242 St | Parks: ZIP 11362, CB 411. `63-20 Marathon Pkwy` → WOF **"Douglaston"**, NTA `QN1103`. `6710 Douglaston Pkwy` → WOF **"Alley Pond Park"**, NTA **`QN1191`**. Wikipedia: `"Southern Douglaston–Little Neck"`. | The property is **split by the NTA line**. Which end the page claims. |
| C5 | **Udalls Cove / Udalls Park Preserve** | Northern Blvd, 244 St to 247 St, Douglas Rd, Little Neck Bay | Parks: ZIPs **11362 and 11363**, CB 411. UCPC: the Cove lies `"between the Douglaston and Great Neck peninsulas"`; the Ravine `"lies between Little Neck and Douglaston"`; part of the preserve is owned by **Great Neck Estates (Nassau County)**. Wikipedia: `"To the east along the water is Udalls Cove"`. | Douglaston vs Little Neck vs Nassau County. **Part of it is definitively outside NYC.** |
| C6 | **The Ravine / Gabler's Creek** | Northern Blvd opposite St. Anastasia's, north to Aurora Pond | UCPC, verbatim: `"a deep wooded gully that lies between Little Neck and Douglaston."` | Shared by the source's own words. |
| C7 | **Aurora Pond / Sandhill Road ("the Back Road")** | west of Little Neck LIRR station | UCPC: the 1970 gathering was `"west of the Little Neck railroad station, between Little Neck and Douglaston"`; Gabler's Creek passes `"just west of the Little Neck Station"`. | Douglaston vs Little Neck. |
| C8 | **Virginia Point** | northern end of Little Neck Parkway | UCPC: `"Two small boatyards at the northern end of Little Neck Parkway, at what is now called Virginia Point"`. Little Neck Parkway addresses geocode WOF **"Little Neck"**. | Almost certainly Little Neck. Recorded because UCPC (a Douglaston-founded group) treats it as theirs. |
| C9 | **248-25 and 249-11/249-17 Northern Blvd** (7 food businesses) | ZIP 11362 | WOF: **"Douglaston"**. Wikipedia's rule (`"east of Marathon Parkway"` = Little Neck): **Little Neck**. | The two rules disagree at exactly this block. |
| C10 | **250-01 through 255-13 Northern Blvd** (30+ businesses incl. **Il Bacco**) | ZIP 11362 | WOF: **"Little Neck"**. NTA: `QN1103` "Douglaston-Little Neck" (cannot separate). | Highest-volume leak risk. **Il Bacco is the marquee name and WOF says Little Neck.** |
| C11 | **Horace Harding Station post office**, 56-01 Marathon Pkwy | ZIP 11362 | Wikipedia: a post office of "Douglaston–Little Neck". WOF: **"Little Neck"**. | Little Neck, probably. |
| C12 | **Little Neck Station post office**, 250-10 Northern Blvd | ZIP 11362 | Wikipedia: a post office of "Douglaston–Little Neck". WOF: **"Little Neck"**. Named Little Neck. | Little Neck. |
| C13 | **QPL Douglaston/Little Neck branch**, 249-01 Northern Blvd | ZIP 11362 | WOF: **"Douglaston"**. Its own name: both. | Shared by name. |
| C14 | **QPL North Hills branch**, 57-04 Marathon Pkwy | ZIP 11362 | WOF: **"Douglaston"**. Named for **North Hills**, which is a Nassau County village name. | Douglaston, but the name misleads. |
| C15 | **Marathon Parkway 56-xx vs 57-04** | ZIP 11362 | `56-01`, `56-07`, `56-09`, `56-21` → WOF **"Little Neck"**; `57-04` → WOF **"Douglaston"**. Non-monotonic. | The WOF polygon is ragged here. |
| C16 | **Little Neck Theater** (1929–1983), Northern Blvd at Morgan St | — | Wikipedia places it in the combined "Douglaston–Little Neck" history section. Named **Little Neck**. | Little Neck, presumptively. |
| C17 | **Little Neck–Douglaston Memorial Day Parade** | Northern Blvd, Great Neck → Douglaston Pkwy | Org's own name puts **Little Neck first**. Route **starts in Nassau County**. | Shared event; not Douglaston's alone. |
| C18 | **Little Neck–Douglaston Community Ambulance Corps** | — | Name puts Little Neck first. | Shared. |
| C19 | **Douglaston and Little Neck Historical Society** | PO Box 630142, **Little Neck, NY 11363** | Named for both; **mailing address is Little Neck**. | Shared; its mail is Little Neck's. |
| C20 | **Little Neck Bay** | — | Wikipedia: `"The political boundary between Nassau County and the borough of Queens runs through the bay"`. | Partly Nassau County. |
| C21 | **Saddle Rock Mill** | eastern side of Udalls Cove | Parks sign: `"donated to the Nassau County Historical Society"`. | **Nassau County. Outside the corpus. Do not claim.** |
| C22 | **Douglaston Manor Windmill** (the object) | orig. Arleigh Rd, Douglaston; now a 2005 replica at APEC | Wikipedia's own article says both `"built in Little Neck"` and `"originally situated on Arleigh Road in Douglaston"`. The replica stands on the APEC parcel, which is NTA `QN1191` **Alley Pond Park**. | Origin Douglaston; present location Alley Pond Park; source self-contradictory. |
| C23 | **Queens Giant** | 40.7533 N, −73.7469 W | NTA: **`QN1191` Alley Pond Park**. Wikipedia: in Alley Pond Park, `"near the Douglaston Plaza Mall"`. | Follows whatever C1 is ruled. |
| C24 | **Benjamin N. Cardozo High School** | — | Wikipedia, verbatim: `"in neighboring Bayside"`. | **Bayside. Outside this page.** |
| C25 | **111th Precinct station house**, 45-06 215th St | — | WOF **"Bayside"**, NTA `QN1102`. Serves Douglaston. | **Bayside building, Douglaston service area.** |
| C26 | **FDNY EMS Training Academy / Fort Totten** | Bay Terrace | Wikipedia, verbatim: `"located in Bay Terrace at Fort Totten"`. | **Not Douglaston.** |
| C27 | **Bellcourt (Bayside) and Westmoreland (Little Neck)** | — | LPC LP-1957: same developer as Douglas Manor, different tracts. | **Neither is Douglaston.** The Rickert-Finlay story invites the error. |
| C28 | **Crocheron Park, John Golden Park, Raymond O'Connor Park, Alley Playground, Motor Parkway** | ZIPs 11360/11361/11364 | Parks: CB 411 but Bayside/Oakland Gardens ZIPs. | **Not Douglaston.** |
| C29 | **Zion Episcopal Church** | 243-20 Church St | WOF **"Douglaston"** — but **inside the NRHP** Douglaston Hill district and **outside the LPC** Douglaston Hill district (F83). | Not a neighborhood dispute — a **district-membership** dispute. Equally dangerous. |
| C30 | **The name "Douglaston Manor"** | — | Refers to (a) Douglas Manor, the 1906 development; (b) an event/catering business at 63-20 Commonwealth Blvd; (c) a Wikipedia article about a windmill. | Pure name collision. |

---

## 15. THE RICHEST VEINS, RANKED (finder's assessment of source quality only — not a verdict on
any fact)

1. **LPC LP-1957 (1997) and LP-2155 (2004), full designation reports.** Primary, institutional,
   footnoted to deeds, censuses, the *Flushing Journal*, the *Real Estate Record and Guide* and
   named architectural periodicals. They carry the Rickert-Finlay covenants verbatim, the
   Josephine Wright Chapman biography, the fourteen resident architects with addresses, the
   Marathon subdivision, the three building families, and Alfred Scheffer describing his own house.
   **Everything else in this dossier is a distant second.**
2. **The LPC building database `gpmc-yuvp`** — 996 buildings with date, architect, style, material
   and original use. This is per-building evidence for any specific house the page names.
3. **The DCP NTA geometry** — the only rigorous statement of where Douglaston is not (§1.2).
4. **NYC Parks' Udalls Park Preserve historical sign** — the glacial geology, the Matinecock
   dispossession, the shellfishing collapse, and the Udall/Saddle Rock chain of title.
5. **The Udalls Cove Preservation Committee's own site** — Aurora Gareiss, the 1970 Earth Day
   gathering, Gabler's Creek and the Ravine. The best modern human story on the page.
6. **PLUTO** — ownership, lot sizes, build years, and the confirmation of the 2012 street renaming.
7. **Wikipedia** — broad but derivative, and (as F172, F223, F228 show) it contains outright errors
   about Douglaston that would be embarrassing to repeat.
8. **DOHMH** — addresses and cuisine codes only. Nothing more.

## 16. THE THINNEST AREAS — where the page will be tempted to invent

- **No press coverage at all** (F1). Any "locals say", "known for", "beloved" or "long-running"
  sentence has zero support in this dossier.
- **No NRHP nomination text** (F2) — so no contributing-resource lists, no NRHP-specific
  architectural analysis.
- **No MTA source** (F6) — bus route numbers and station details are Wikipedia-only.
- **No Douglaston Club source** (F4) — everything about the Club is LPC 1997, PLUTO, or Wikipedia.
- **No history for Catharine Turner Richardson Park** (F237) — the namesake is unidentified in
  evidence.
- **No founding date for the National Art League** (P74) — only a "95th Annual" exhibition in 2026.
- **No Alley Pond Park historical sign** (F3).
- **No visitor information anywhere.** Neither individual landmark is a museum; both are private
  homes (F176, F177). The Douglaston Club is private (F190). Douglas Manor's shorefront is
  **privately held in common by the Douglas Manor Association** (F137) — it is not public parkland.
  **The only unambiguously public destinations in Douglaston proper are Udalls Park Preserve,
  Catharine Turner Richardson Park, the Douglaston Park Golf Course, the National Art League
  gallery, and the streets of the two historic districts themselves.**

## 17. WAVE-LEVEL NOTES THE COORDINATOR ASKED FOR

- **Flushing Meadows-Corona Park and the eight Ethos.Seeds.CitiFieldPlaces holdings do not appear
  anywhere in this dossier.** Douglaston is roughly six miles from Citi Field and no source I
  retrieved connects them. There is no routing sentence to write and no temptation to resist.
- **Flushing appears in this dossier only in its 17th-century sense** — as the colonial town
  (Vlissingen) that contained the Alley Pond settlement (F53), and as the location of Samuel
  Parsons's nursery (F74) and of Rickert-Finlay's Broadway-Flushing development (F128).
  **No modern Flushing tie is in evidence and none should be manufactured.**
- **The Bayside adjacency the brief warns about is, in DCP geometry, not an adjacency at all**
  (F26–F28). Alley Pond Park sits between them. The real leak on this page is **Little Neck**
  (§1.4, C9–C19), which shares a single NTA with Douglaston and owns the commercial strip, the
  post offices, the local newspaper, the parade and the historical society's mailbox.

---

*End of finder dossier. No verdicts have been rendered above. Every item is a candidate.*
