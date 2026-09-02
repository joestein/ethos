# Rockaway Beach, Queens — VERDICTS (independent verification)

Role: VERIFIER. Every URL cited by the finder was re-fetched by me. Method notes first, because
they change what the finder could and could not know.

---

## 0. METHOD — WHAT I DID DIFFERENTLY, AND WHY IT MATTERS

**0.1 — I did not use WebFetch's extraction model for Wikipedia.** The finder's §0.2 caveat is
correct and it mattered: I downloaded **raw wikitext** (`action=raw`) for all 22 cited Wikipedia
articles and read them directly with Python. Three of the finder's most consequential claims turn
out to be **extraction-model errors, not source errors** (F-B8, F-91, F-96). The finder was right
to flag its own quotes as unattested; the verifier's job here was real and it produced refutations.

**0.2 — WebSearch was exhausted for me too** (200/200). Everything below is WebFetch, `curl` with
a browser User-Agent, or NYC Open Data.

**0.3 — NYC PARKS IS NOT 403. The finder's §0.5 is operationally refuted.**
`https://www.nycgovparks.org/parks/rockaway-beach-and-boardwalk` returns **HTTP 200, 35,544 bytes**
to a Safari User-Agent. The 403 was bot-blocking, not a dead endpoint. This recovers the single most
important missing institutional source, and it changes two rulings below (§6.1, §6.3).

**0.4 — I read both NRHP nomination PDFs myself.** Downloaded from npgallery.nps.gov, extracted with
`pdftotext -layout`, and machine-diffed **every one of the finder's 42 courthouse quotes and 42
temple quotes** against the OCR with a fuzzy matcher. Result below in §3.

**0.5 — I resolved LPC from the authoritative dataset,** not by inference. NYC Open Data
`buis-pvji` (LPC Individual Landmark Sites), 1,532 rows, 86 in Queens.

**0.6 — DOHMH/DCWP: I confirm the finder's §0.7 disclosure.** No candidate in this document rests on
an inspection dataset. I did not consult one either. **Therefore the "existence and address only, no
prose" constraint attaches to NOTHING on this page.** Both businesses rest on their own live
websites, which is a *different* weakness (self-description) with a different remedy (attribute, and
do not assert operating status).

---

## 1. THE BOUNDARY PROBLEM — RULED

### 1.1 F-B1 vs F-B2: the finder's central FLAG, answered

**VERDICT: CONFIRMED — and the article genuinely contains BOTH lists. Neither extraction was
unreliable.** `Rockaway,_Queens` carries two independent, mutually inconsistent enumerations.

**List A — the lead**, introduced by: *"The peninsula is divided into nine neighborhoods or sections,
with Riis Park in between two of such sections. From east to west, they are:"*
> `*[[Arverne, Queens|Arverne]], from Beach 56th Street to Beach 77th Street`
> `*[[Rockaway Beach, Queens|Rockaway Beach]], from 77th Street to Beach 97th Street`
> `*[[Rockaway Park, Queens|Rockaway Park]], from Beach 98th Street to Beach 126th Street`

**List B — a separate `==Communities==` section**, alphabetical, thirteen entries, containing four
names List A omits (Broad Channel, Hammels, Roxbury, Seaside):
> `*[[Hammels, Queens|Hammels]] – along Beach 84th Street; also extends to Beach 79th Street`
> `*[[Rockaway Beach, Queens|Rockaway Beach]] – between Beach 73rd Street and Beach 108th Street`
> `*[[Rockaway Park, Queens|Rockaway Park]] –  between Beach 105th Street and Beach 126th Street`
> `*[[Seaside, Queens|Seaside]] – between Beach 84th Street and Beach 105th Street`

Both verbatim. F-B1 and F-B2 are **both CONFIRMED as accurate reports of the source**, and the
source contradicts itself. List B is also internally inconsistent: Rockaway Beach ends at 108th and
Rockaway Park begins at 105th, overlapping three blocks.

**RULING FOR THE AUTHOR: do not narrate any street range as the neighborhood's boundary.** Neither
list is citable as fact. Use the ZIP (§1.3) and the two NRHP forms instead.

### 1.2 Which range the better sources support

| Source | Tier | Range |
|---|---|---|
| Temple of Israel NRHP §8 p.2 (**I read it**) | primary, SHPO/NPS | Beach 84th–107th, "the heart of Rockaway Beach" |
| Temple of Israel NRHP §8 p.3 (**I read it**) | primary | Moses demolished "from Beach 73rd Street to Beach 108th Street" |
| Shore Front Parkway article infobox | tertiary | Beach 73rd–108th; location = Arverne, Hammels, Rockaway Beach |
| Wikipedia List A | tertiary | Beach 77th–97th |
| Wikipedia List B | tertiary | Beach 73rd–108th |

**Three of five instruments, including both primary ones, point at roughly Beach 73rd–108th.** F-35
is verbatim and independent of Wikipedia. So where a place must be tested against a range, use
**Beach 73rd–108th** as the working extent — while writing no boundary sentence.

### 1.3 F-B15 — ZIP 11693 — CONFIRMED, and it is the best discriminator

Verified in four places: the `Rockaway Beach, Queens` infobox (`postal_code = 11693`); both NRHP
forms' §2 "zip code 11693" (read directly); and — new — **NYCHA's own Hammel development fact
sheet, which stamps 11693 on all fourteen buildings**. Seaside/Rockaway Park = 11694 (confirmed in
the `Seaside, Queens` infobox). The finder's judgment that ZIP beats street range is **CONFIRMED and
endorsed**.

### 1.4 F-B6 (Hammels inside) vs F-B7 (Seaside beside) — RULED

- **F-B6 CONFIRMED verbatim:** *"Hammels is an area within Rockaway Beach on the Rockaway Peninsula
  in the New York City borough of Queens."* / *"It is located west of Arverne and east of Seaside,
  and is centered on Beach 84th Street."*
- **F-B7 CONFIRMED verbatim:** *"Seaside is a section of the Rockaway Peninsula…"* / *"It is bordered
  by the Rockaway Beach neighborhood on the east, and by the neighborhood of Rockaway Park on the
  west."* ZIP 11694 confirmed.
- **NEW, AND THE FINDER MISSED IT:** the `Seaside, Queens` article opens with the maintenance tag
  **`{{one source|date=October 2020}}`** — Wikipedia's own flag that the article is inadequately
  sourced. F-B7 is single-sourced *by the encyclopedia's own admission*.

**RULING: Hammels is INSIDE Rockaway Beach (F-B6, corroborated by NRHP F-B5's "comprised of various
local districts"). Seaside is BESIDE it and is NOT ours** — on the ZIP (11694), on its own article,
and on the NRHP form which calls Seaside and Hammels *peer* communities (F-B11). The finder's
"F-B7 vs F-B8 direct contradiction" **dissolves** — see §11.

### 1.5 Peninsula guardrails

F-B12, F-B13, F-B14 **CONFIRMED**. Community District 14 confirmed in the infobox
(`[[Queens Community Board 14|Queens 14]]`) and by NYC Parks ("Community Board: 14"). Council
members per Parks: Joann Ariola, Selvena N. Brooks-Powers.

---

## 2. HISTORY (§2 of the finder) — ALL CONFIRMED VERBATIM

I read the `Rockaway Beach, Queens` History section in raw wikitext. **F-1 through F-17 are every
one verbatim**, including the finder's §0.4-caveated long block. The extraction was faithful.
The caveat can be lifted.

Two additions the author should have:
- **F-11 / F-97 nickname conflict RESOLVED as a real double:** the *Rockaway Beach, Queens* article
  says *"road from nowhere to nowhere"*; the *Shore Front Parkway* article says *"road to nowhere"*.
  Both verbatim. Attribute whichever you use; do not merge them.
- **F-14 CONFIRMED verbatim,** including *"Dayton Towers West in nearby Rockaway Park."* **Caution:
  its only citation is an Emporis page marked `url-status=usurped`** — a dead commercial source. See
  §8.

---

## 3. THE NRHP NOMINATIONS — THE FINDER'S BEST WORK, AND IT HOLDS

I machine-verified all 84 quoted strings the finder attributed to the two nomination forms.

**Result: 78 EXACT, 4 near-exact (OCR hyphenation only), 2 apparent misses that are page-break and
footnote artifacts** — F-22 spans a page footer ("Section 8 Page 2 Queens County, New York") and
F-38 has footnote 9 injected mid-sentence by the OCR. **Zero substantive discrepancies.**

**VERDICT: F-18–F-41, F-42–F-59, F-60–F-75, F-B3, F-B5, F-B9, F-B10, F-B11, F-B13 — ALL CONFIRMED,
attestably verbatim.** The finder's §0.3 claim to have read these itself is vindicated. These may be
quoted as quotes.

### Place record — Rockaway Courthouse (P-1)
- **Address: `90-01 Beach Channel Drive, Rockaway Beach, NY 11693`** — CONFIRMED three ways: NRHP
  form §2 ("city or town: Rockaway Beach", "county Queens", "zip code 11693"); the NRHP Queens list
  wikitext row (`|refnum=13001155 |address=90-01 Beach Channel Dr. |city=[[Rockaway Beach, New
  York|Rockaway Beach]]`); the article infobox. **PUBLISHABLE.**
- Listed **February 5, 2014**, ref. **#13001155**. Confirmed against the NPS weekly list citation.
- **F-59 — CURRENT STATUS: UNCERTAIN. THE AUTHOR MUST NOT USE THE PRESENT TENSE.** The Wikipedia
  sentence *"Today the building is being reconstructed as a medical center"* is **uncited**, and the
  image caption dates the observation to **November 2019**. The nomination's "will be rehabilitating"
  is from 2013. I could not establish 2026 status (no WebSearch). Write it in the past: *the 2013
  nomination recorded that Harmony Rockaway LLC had bought the building intending a medical centre.*
- **NEW CONFLICT the finder missed:** the Wikipedia article says the building is *"steel frame and
  [[limestone]]"*; the NRHP form's material fields say **Stone, Structural Clay Tile, Brick**; and
  the 1932 newspaper account quoted in the form says **"constructed of Tennessee marble."** Prefer
  the form. Do not write "limestone."

### Place record — Temple of Israel Synagogue (P-2)
- **Address: `1-88 Beach 84th Street, Rockaway Beach, NY 11693`** — CONFIRMED: NRHP §2, and the NRHP
  Queens list row (`|refnum=13001156 |address=1-88 Beach 84th St. |city=…Rockaway Beach`).
  **PUBLISHABLE.**
- **Correction to F-60:** the Wikipedia article's actual title is **`Temple of Israel Synagogue
  (Rockaway Beach, New York)`**, not "(Queens)". The finder's URL redirects. Minor, but the finder's
  worry that Wikipedia "says Rockaway, not Rockaway Beach" is **REFUTED** — the article title,
  the NRHP list row and the form all say Rockaway Beach.
- **F-61 — 1921 vs 1922: UNCERTAIN, and correctly so.** Cornerstone laid August 25, 1921 (F-68,
  verbatim); Period of Significance begins 1921. Write "cornerstone 1921, completed 1922" or say
  the form dates it 1921. Do not assert a single completion year.
- **F-74 — UNCERTAIN.** "Haven Ministries" (NRHP owner field, 2013) vs "Haven International
  Ministries" (Wikipedia). Both are 12+ years old. **Do not assert current occupancy.**

---

## 4. NEIGHBORHOOD ASSIGNMENT — THE FOURTEEN CONTESTED ROWS, RULED

The finder declined to resolve these. That was its job. Resolving them is mine.

| # | Place | RULING | Evidence |
|---|---|---|---|
| 1 | **Rockaways' Playland** | **ROCKAWAY BEACH — confirmed** | See §11. The "Seaside" reading is an extraction error. |
| 2 | **Beach 98th Street station** | **ROCKAWAY BEACH — confirmed** | Four sources, incl. two the finder misread. See §5. |
| 3 | **Beach 105th Street station** | **NOT OURS — REFUTED** | See §5. |
| 4 | **St. Camillus RC Church** | **ROCKAWAY PARK — REFUTED for us** | Address found: **99-15 Rockaway Beach Blvd, Rockaway Park**. |
| 5 | **Hammel Houses** | **ROCKAWAY BEACH (in Hammels) — confirmed** | NYCHA's own record: ZIP **11693**, all 14 buildings. |
| 6 | **NYC Ferry Rockaway landing** | **NOT OURS — REFUTED** | Operator's own page. See §7. |
| 7 | **Ice hockey rink, Beach 109th** | **NOT OURS — REFUTED** | Outside Beach 73rd–108th; Parks files it under Shore Front Parkway. |
| 8 | **Beach 106th St concession** | **NOT OURS — REFUTED** | Outside every range except List B's overlap zone. |
| 9 | **Beach 97th St concession** | **UNCERTAIN — do not record** | Sits exactly on List A's line. No independent instrument. |
| 10 | **Surf beach, Beach 67th–69th** | **NOT OURS — REFUTED** | Arverne under both lists. |
| 11 | **Shore Front Parkway** | **SHARED — may not be claimed** | Its own infobox: `location = Arverne, Hammels, Rockaway Beach`. |
| 12 | **Surfside Park Apartments** | **UNCERTAIN — do not record** | No address; only source's sole citation is dead. |
| 13 | **"Seaside" as a district** | **NOT INSIDE — beside** | §1.4. |
| 14 | **Rockaway Beach Hospital** | **NOT OURS — REFUTED** | No address; the one source locates it in Far Rockaway. |

### 4.1 St. Camillus (row 4) — the finder asked for the address first. Here it is.

`List of churches in the Roman Catholic Diocese of Brooklyn`, re-fetched:
> "St. Camillus Church, **99-15 Rockaway Beach Blvd**, Rockaway Park"

with the note that the two congregations "Combined with St. Virgillus in 2008."

**RULING: St. Camillus is in ROCKAWAY PARK. REFUTED for this page as a place record.**
Beach 99th is Rockaway Park under List A, Seaside under the Seaside article, and only Rockaway Beach
under List B's disputed western reach. Every modern source — the diocesan list, the schools list,
the `Broad Channel` article — says Rockaway Park, and now the address agrees with them.

**What the 1932 quote may still be used for:** F-51 is attestably verbatim and describes a *person
at an event* — "the Rev. Joseph F. Curran, pastor of the St. Camillus Roman Catholic Church of
Rockaway Beach." That is quotable **as a 1932 quotation inside the courthouse-dedication narrative**.
It is not a licence to record St. Camillus as a Rockaway Beach place, and the author must not write
"St. Camillus, in Rockaway Beach" in its own voice.

### 4.2 Hammel Houses (row 5) — REFUTING the "Far Rockaway" postal address

**F-102 CONFIRMED as a report:** the `Hammel Houses` infobox does read
`address=84-16 Rockaway Beach Boulevard, [[Far Rockaway]], [[New York City|New York]]`.

**But the claim it encodes is REFUTED by NYCHA itself.** NYCHA's development fact sheet
(`nyc.gov/assets/nycha/downloads/pdf/Hammel.pdf`, "Prepared by: NYCHA Performance Tracking &
Analytics Department (August 2021)") lists every building with **ZIP CODE 11693**, including
> `5  005  84-16 ROCKAWAY BEACH BOULEVARD  11693`

11693 is Rockaway Beach. Far Rockaway is 11691. The Wikipedia infobox is a postal mislabel.

**RULING: Hammel Houses is in Hammels, inside Rockaway Beach. Address `84-16 Rockaway Beach
Boulevard, Queens, NY 11693`. PUBLISHABLE.** The prose should say Hammels, per F-B6.

**Unit/date conflict — RULED.** 712 vs 700 and September 1954 vs April 1955: the `Hammels, Queens`
article's own cited source (QNS Made) says **"712 apartments … Completed April 30, 1955"** — i.e. it
contradicts the 700 that Wikipedia derived from it. NYCHA's `Hammel_IAPv2.pdf` is cited for 712.
**Use 712. Do not assert a completion date** — three sources give September 1954, April 1955 and a
1964 rebuild (F-13, verbatim). Say "opened in the mid-1950s" or attribute.

---

## 5. THE SUBWAY STATIONS — TWO EXTRACTION ERRORS CORRECTED

### 5.1 F-91 — **REFUTED. This is the finder's most consequential error.**

The finder wrote: *"The IND Rockaway Line article … lists the Rockaway Park Branch stations by
neighborhood and puts Beach 90th, Beach 98th AND Beach 105th all in 'Rockaway Beach.'"*

**The article does not say that.** The raw wikitext table uses `rowspan=2`:

```
|rowspan=2|[[Rockaway Beach, Queens|Rockaway Beach]]
|  |{{stl|NYCS|Beach 90th Street}}   …
|  |{{stl|NYCS|Beach 98th Street}}   …
|rowspan=2|[[Rockaway Park, Queens|Rockaway Park]]
|  |{{stl|NYCS|Beach 105th Street}}  …
|  |{{stl|NYCS|Rockaway Park–Beach 116th Street}} …
```

**Beach 90th and Beach 98th → Rockaway Beach. Beach 105th and Beach 116th → ROCKAWAY PARK.** The
extraction model flattened a rowspan. The finder's "four-way disagreement" over Beach 105th
collapses to a near-consensus *against* us.

### 5.2 Beach 90th Street–Holland (P-7) — **CONFIRMED. PUBLISHABLE.**
Infobox: `address = Beach 90th Street & [[Rockaway Freeway]], Queens, New York`;
`locale = [[Rockaway Beach, Queens|Rockaway Beach]]`; `other_name = Beach 90th Street–Holland`.
Lead confirms "served by the Rockaway Park Shuttle at all times and ten daily rush-hour only A
trains." Uncontested. **F-89 CONFIRMED.**
*Correction to the finder:* the LIRR predecessor was built "at Holland Avenue and **Beach 92nd
Street** between May and June 1880," not at Beach 90th. Do not conflate the 1880 and modern sites.

### 5.3 Beach 98th Street–Playland (P-8) — **CONFIRMED for Rockaway Beach. PUBLISHABLE.**
Four instruments now say Rockaway Beach:
1. Station infobox `locale = Rockaway Beach`, `address = Beach 98th Street & Rockaway Freeway`.
2. **The neighborhood's own article**, Transportation section, verbatim: *"The neighborhood's
   stations are [[Beach 90th Street…]] and [[Beach 98th Street…]]."*
3. The IND Rockaway Line table (§5.1).
4. The `Rockaways' Playland` lead, which puts the park it is named for in Rockaway Beach (§11).

Against: List A, and the `{{one source}}`-tagged Seaside article. **The preponderance is decisive.**

### 5.4 Beach 105th Street — **REFUTED. DO NOT RECORD.**
Against us: the IND table (Rockaway Park); the Seaside article; List A and List B's Rockaway Park
row; and **the station is officially signed `Beach 105th Street–Seaside`**. For us: only its own
infobox `locale`, whose citation is a **Google Maps link** — the weakest source in this entire
corpus. Decisive: **the neighborhood's own article lists two stations and this is not one of them.**

---

## 6. THE BEACH, BOARDWALK AND PARKS — NOW PARKS-SOURCED

### 6.1 P-6 Rockaway Beach and Boardwalk — **PUBLISHABLE, BUT NEVER AS A WHOLE**

NYC Parks' own page (recovered, §0.3) is now the primary record:
> "Rockaway Beach and Boardwalk"
> **"Beach 3 St. to Beach 153 St. and Boardwalk to Atlantic Ocean."**
> **"Zip Code: 11691, 11692, 11693, 11694"**
> "Park ID: Q162GROUP"  •  "Property Type: Park Group"  •  "Community Board: 14"

**Parks itself stamps the park with four ZIPs.** That is the citable, institutional proof that this
park belongs to no single neighborhood — far better than the finder's inference. **Use it.**

**F-80 — PARTLY REFUTED.** The finder framed "Beach 3rd–153rd vs Beach 9th–149th" as unresolved and
implied the Wikipedia lead figure was the weaker one. **NYC Parks, the manager, says Beach 3 St. to
Beach 153 St.** — matching the neighborhood article's lead, not the boardwalk article's. Rule:
the **park group** runs Beach 3–153 (Parks); the **beach proper** is described as Beach 9th–149th and
the **boardwalk** as Beach 9th–126th (Wikipedia, itself Parks-cited). Both may be stated with
attribution. They are not in conflict — they measure different things.

**"largest urban beach in the United States" — UNCERTAIN, ATTRIBUTE OR DROP.** Its sole source is a
one-line aside in a 2007 *Vancouver Sun* travel piece ("Rockaway Beach is the largest urban beach in
the States"). **NYC Parks does not make this claim anywhere on its own page.** Single-sourced to a
newspaper filler line. May ship only as *"a 2007 Vancouver Sun piece called it…"* — better dropped.

### 6.2 F-79, F-81, F-82, F-83, F-85 — **CONFIRMED verbatim** in the boardwalk wikitext, including
"food concessions at Beach 17th, 86th, 97th, and 106th Streets" and "maintained by the New York City
Department of Parks and Recreation since 1938." **F-81's phase dates are only partly supported** —
the current lead compresses them to "sections between Beach 19th and 109th Streets in three phases
between 1928 and 1930." Mark the per-phase street ranges **UNCERTAIN**; the 1923 first section
(Beach 109th–126th) and the 1963 concrete section (Beach 9th–19th) are verbatim.

### 6.3 P-NEW — **Rockaway Beach Skate Park. THE FINDER UNDER-SOLD THIS; IT IS THE CLEANEST
NON-NRHP ASSIGNMENT ON THE PAGE.**

The boardwalk article's Description section walks the peninsula neighborhood by neighborhood and
says, verbatim:
> "**In the neighborhood of [[Rockaway Beach, Queens|Rockaway Beach]] is the [[Rockaway Beach Skate
> Park]] at Beach 91st Street.** There is an ice hockey rink at Beach 109th Street."

That is an *explicit* containment sentence, not an inference from a street number. **CONFIRMED.
Address: Beach 91st Street (boardwalk). PUBLISHABLE.** The same sentence puts the hockey rink at
Beach 109th, which is **NOT ours** (row 7).

The same passage also gives, verbatim: *"Within Hammels, there are eight handball and two basketball
courts west of Beach 81st Street, and two playgrounds at Beach 84th Street."* Hammels is inside
Rockaway Beach (§1.4), so these are available — as facilities, not as place records.

### 6.4 F-86 amphitheater at Beach 94th — **CONFIRMED**, and note its citation:
**O'Flynn, Fiona, "A New Gateway To The Rockaways," `rockawave.com`, June 16, 2023.** *The Wave is
reachable at rockawave.com.* The finder's §14 lament that it never found a working URL is
**answered**: rockawave.com is live and is cited by three separate Wikipedia articles I read
(the amphitheater, the Rockaway Freeway fatality, and the "Census Nonsense" population piece).

### 6.5 P-NEW — **Whaleamena. THE FINDER MISSED THIS ENTIRELY, AND IT NEEDS CARE.**

Boardwalk article, verbatim:
> "A gray-and-aquamarine stucco sculpture called \"Whaleamena\", formerly of the [[Central Park
> Zoo|Central Park Children's Zoo]], is situated at the **Beach 95th Street** entrance to the park."

But the `Rockaway, Queens` article, verbatim, says the opposite about the same object:
> "\"Whalemina,\" a large, brightly colored statue of a smiling whale that had been a beloved iconic
> symbol of Rockaway since the 1990s, disappeared from **Beach 94th Street** near the Boardwalk and
> was presumed to have been swept out to sea."

Two spellings, two streets, and one says it is there while the other says it vanished in Sandy.
**VERDICT: UNCERTAIN. Beach 95th is inside Rockaway Beach under every range, so the assignment is
safe, but the present tense is not.** Do not record it as a place until a current source is found.

### 6.6 Exclusions — **CONFIRMED from the NRHP Queens list wikitext**
Jacob Riis Park HD (`|city=[[Rockaway, Queens|Rockaway]]`, 1981-06-17, #81000081) and Fort Tilden HD
(`|city=[[Rockaway, Queens|Rockaway]]`, 1984-04-20, #84002917) both carry "Rockaway Beach Blvd."
addresses and are **filed under "Rockaway," not "Rockaway Beach."** The finder's name-trap warning
is **CONFIRMED**. Far Rockaway Beach Bungalow HD is `|city=[[Far Rockaway, Queens|Far Rockaway]]` —
**it belongs to the sibling page.**

### 6.7 F-84 surfing — split ruling
NYC Parks, verbatim: *"the city's only legal surfing beach, located between 67-69 Street and 87-92
Street."* Wikipedia pluralises it. **Beach 87th–92nd: CONFIRMED ours. Beach 67th–69th: REFUTED
(Arverne).** Never claim both. Note Parks writes "beach" singular for two stretches; quote Parks, not
Wikipedia, and say "one of the two stretches."

---

## 7. THE FERRY — REFUTED FOR THIS PAGE, ON THE OPERATOR'S OWN WORDS

I re-fetched `ferry.nyc/routes-and-schedules/route/rockaway/` live. It gives, verbatim, twice:
> "Rockaway"
> "**Beach 108th Street and Beach Channel Drive**"
> "**Far Rockaway, NY 11694**"

and, for accessible pick-up:
> "**107-98 Beach Channel Drive**"
> "**Rockaway Park, NY 11694**"

**So the operator uses two different labels for the same corner — Far Rockaway and Rockaway Park —
and neither is Rockaway Beach.** The `NYC Ferry` article agrees verbatim: the SeaStreak slip was
"at Beach 108th Street and [[Beach Channel Drive]] in [[Rockaway Park, Queens]]."

Third, independent corroboration turned up in an unexpected place — **the Rockaway Beach Surf Club's
own site**: *"Take the ferry to Rockaway Beach! Walk the boardwalk from 108th to 87th, then head
inland to reach RBSC."* A Rockaway Beach business describes the landing as a walk away.

**RULING: the NYC Ferry landing is NOT a Rockaway Beach place. The finder's recommendation is
ADOPTED — routing sentence only** ("the neighborhood is reached by the NYC Ferry's Rockaway route,
landing at Beach 108th Street"), no place record. F-92's ferry sentence is CONFIRMED verbatim in the
neighborhood article and may be quoted as the neighborhood article's claim, but must not be upgraded
into a location.

---

## 8. HOUSING, CIVIC, EDUCATION

- **P-11 Peninsula Library — CONFIRMED. PUBLISHABLE.** Queens Public Library's own page, re-fetched:
  **"92-25 Rockaway Beach Boulevard, Rockaway Beach, NY 11693"**, branch name "Peninsula". Address,
  neighborhood and ZIP all agree. Institutional source. The finder's warning not to conflate it with
  the historical "Seaside Branch" (F-55, verbatim) is **CONFIRMED and important** — note further
  that a **modern Seaside branch also exists, at 116-15 Rockaway Beach Boulevard** (cited in the
  `Rockaway, Queens` wikitext). Beach 116th is Rockaway Park. **Three different libraries share this
  boulevard. Do not merge any two.**

- **F-103 Dayton Beach Park / Surfside Park Apartments — UNCERTAIN, DO NOT RECORD.** No address
  found by either of us, and the sole citation for the whole passage is an **Emporis page flagged
  `url-status=usurped`** — a dead commercial database. The prose (F-14) is verbatim and may be used
  *as history*, attributed, but neither building may become a place record.

- **F-105 SCHOOLS — PARTLY REFUTED. THE AUTHOR MUST READ THIS.**
  The Education section says residents are *"zoned to"* P.S. 183 or P.S. 225 — a zoning statement,
  not a location statement. And the DOE citation for P.S. 225 reads, verbatim:
  > "P.S. 225 **Seaside**, Q225, Borough of Queens, **Zip Code 11694**"

  **P.S. 225 is in ZIP 11694 and is named "Seaside." It is NOT a Rockaway Beach place. REFUTED.**
  P.S. 183 ("P.S. 183 Dr. Richard R. Green") has no address in any source I reached — **UNCERTAIN,
  do not record.** St. Camillus → Rockaway Park (§4.1). Only **St. Rose of Lima's** academy is
  supportable, and only because the NRHP form (F-72, verbatim) places "St. Rose of Lima Roman
  Catholic Church and its affiliated school" immediately south of 1-88 Beach 84th Street.

- **F-106, F-107 — CONFIRMED as historical, UNCERTAIN as extant.** The Rockaway Cultural Society,
  the Rockaway Repertory Theatre and the Rockaway Beach Board of Trade are attested only in the 1932
  and 1970s passages of the NRHP form. **No place records. Historical prose only, past tense.**

- **LPC — RESOLVED. The finder's "zero" is REAL, and I can prove it.**
  NYC Open Data `buis-pvji` (LPC Individual Landmark Sites) contains **four** designations in
  Community District QN414 (the whole Rockaway peninsula):
  | Landmark | Address | NTA | Designated |
  |---|---|---|---|
  | Firehouse, Engine Cos. 264 & 328 / Ladder Co. 134 | 16-15 Central Avenue | QN1401 | 2018-05-29 |
  | 53rd (now 101st) Precinct Police Station | 16-12 Mott Avenue | QN1401 | 2018-05-29 |
  | Firehouse, Engine Co. 268 & Hook & Ladder Co. 137 | 259 Beach 116th Street | QN1403 | 2013-02-12 |
  | Richard Cornell Graveyard | adjacent to 1463 Gateway Boulevard | QN1401 | 1970-08-18 |

  **None is in Rockaway Beach.** Three are in QN1401 (Far Rockaway); the fourth is at Beach 116th
  (Rockaway Park). **CONFIRMED: Rockaway Beach has two NRHP listings and zero NYC landmarks.** The
  author may state this. **FOR THE COORDINATOR: three of these four belong to the sibling
  far-rockaway page and its finder may not have them** — the Richard Cornell Graveyard in particular
  is a 1970 designation and a significant place.

---

## 9. BUSINESSES — BOTH LIVE, BOTH CO-LOCATED, NEITHER INSPECTION-SOURCED

**P-12 Rockaway Beach Surf Club — CONFIRMED, live today.** `rockawaybeachsurfclub.com` returned 200
and reads, verbatim:
> "302 Beach 87th Street"  /  "Rockaway Beach, NY 11693"
> "Located on the corner of Beach 87th Street and Rockaway Freeway. Underneath the A train line."
> "Surf • Music • Margs • Tacos • Community • Art • Skate •"

**P-13 Tacoway Beach — CONFIRMED, live today.** `tacowaybeach.com` returned 200 and reads, verbatim:
> "302 beach 87th street"  /  "Rockaway Beach , NY 11693"

**RULING ON THE FINDER'S QUESTION:** the two are at **one address**, and the Surf Club's own tagline
advertises tacos. Treat them as **one venue with two names** — record the Surf Club as the place and
mention Tacoway as the taco counter operating inside it, or record both and say plainly they share
302 Beach 87th Street. **Do not present them as two separate destinations on different corners.**

**SINGLE-SOURCING — MAY SHIP, WITH LIMITS.** Each rests solely on its own website. That is
self-description. **May ship: name, address, and the self-described offering with attribution.**
**May NOT ship: opening dates, ownership, "since 19xx", awards, or any claim about quality or
popularity.** And because a live website is not proof of current operation, avoid hours.

**DOHMH/DCWP: neither business — and no place on this page — rests on an inspection record.** The
"address only, no prose" constraint applies to **nothing here.** Confirmed.

**F-111 The Rockaway Hotel — CONFIRMED as an exclusion.** Recorded so no one claims it: its own site
says Rockaway Park, ZIP 11694, and describes Rockaway Beach as somewhere it is *near*.
**F-112 Rockaway Brewing Company — CONFIRMED UNREACHABLE** (expired TLS). The finder's flag that the
name does not imply the location is sound; no candidate.

---

## 10. ST. ROSE OF LIMA — CONFIRMED, AND BETTER THAN THE FINDER KNEW

**P-3. PUBLISHABLE.** From the raw wikitext infobox and lead, verbatim:
> `| location = [[Rockaway Beach, Queens]], New York City`
> `| address = 130 Beach 84th Street, Rockaway Beach, New York, 11693`
> "Saint Rose of Lima Roman Catholic Church is a Catholic church located at 130 Beach 84th Street in
> [[Rockaway Beach, Queens]] New York. It is a currently active parish church…"

All of F-76 **CONFIRMED**: founded August 30, 1886; groundbreaking July 1, 1906; first Mass and
dedication September 27, 1907; architect **John W. Ingle**; Romanesque Revival. **New and usable:**
capacity 800 (500 in the first building), construction cost US$125,000 (US$6,000 for the first),
still active, masses in English, Spanish and Polish, Queens 10 Deanery, and the first building stood
"on Fairview Avenue (modern day Beach 84th Street) and Barry Place." Its own site is
`stroseoflima-queens.org`. **Independently corroborated by the NRHP form (F-72, verbatim).**
**No NRHP or LPC designation — CONFIRMED** against both the NRHP Queens list and the LPC dataset.

---

## 11. ROCKAWAYS' PLAYLAND — THE FINDER'S "DIRECT CONTRADICTION" IS AN EXTRACTION ERROR

**F-B8 — REFUTED.** The finder reported the article as saying the park "was situated in Rockaway
Beach, specifically in the Seaside neighborhood," and built its sharpest FLAG on the resulting clash
with F-B7. **The article says no such thing.** The raw wikitext lead:

> "'''Rockaways' Playland''' was an amusement park that operated from 1902 to 1987 **in [[Rockaway
> Beach, Queens|Rockaway Beach]]** in Queens, New York City. Bounded by Beach 97th and Beach 98th
> Streets between [[Rockaway Beach Boulevard]] and the [[Rockaway Beach and Boardwalk]]…"

The word "Seaside" appears **once**, in a sentence about a *different, earlier* transaction:

> "In 1900, George Tilyou, owner of Steeplechase Park in Brooklyn's Coney Island, purchased land in
> the [[Seaside, Queens|Seaside]] neighborhood along Rockaway Beach."

**The extraction model welded two unrelated sentences together.** There is no contradiction with
F-B7. **RULING: Rockaways' Playland was in ROCKAWAY BEACH. CONFIRMED. Record it as a historical
place, Beach 97th–98th Streets. PUBLISHABLE (defunct).**

**Date rulings:**
- Opening: **1902**, verbatim, twice. **The finder's parenthetical — "sources vary on the exact
  opening year (1901, 1902, or 1903 are cited)" — is NOT IN THE ARTICLE. REFUTED as a quote.**
  (Body text does mention Thompson buying by 1901 and the 1903 ferry dock; that is not the same
  claim.) The `Rockaway Beach, Queens` History section separately says "built in 1901" — verbatim,
  and a real conflict. **Write 1902 and note the neighborhood article says 1901, or write "the early
  1900s."**
- Closing: **1987** per the park article; **1985 per the Beach 98th Street station article** — both
  verbatim. **RESOLVED by the park article's own detail:** *"The 1985 season was the last operating
  season for Playland, though at the time, Richard Geist did not intend for the park to close
  permanently."* Then, verbatim: *"The following year, insurance premiums increased eightfold, from
  $50,000 in 1985 to $408,000 in 1986. At that time, Geist decided not to reopen the park."*
  **Write: last season 1985; permanently closed thereafter.** The finder's $50,000→$408,000 figure
  is **CONFIRMED verbatim** and is the best single detail in this section.
- **Rides — PARTLY REFUTED.** The Gravity Wonder (1924) was *"The first roller coaster in the park"*
  — not merely "a" coaster. The Rig-a-Jig and Leaping Lena were **Geist's early-1930s flat rides**,
  alongside "Cave O'Laffs, and the Pretzel" — the finder's framing loses that. Atom Smasher: 1938,
  **designed by Vernon Keenan**, 3,000 ft long, 70 ft high.
- **The finder missed two strong facts:** *"Between 1928 and 1970, Rockaways' Playland was extremely
  successful, drawing 175 million visitors"*, and *"Playland was also shown in the 1982 movie
  Sophie's Choice."* Both verbatim.

---

## 12. DEMOGRAPHICS, CULTURE, PEOPLE — CORRECTIONS

**F-114 — PARTLY REFUTED. Do not write "population 13,449 (2010 census)."**
13,449 is an **infobox value**. The article's actual Demographics section reports census data for a
**different, combined area — "Breezy Point/Belle Harbor/Rockaway Park/Broad Channel … 28,018"** —
which does not include Rockaway Beach at all. The neighborhood figure the section gives is
> "The community itself has a total population of more than 13,000 people, making it the third most
> populated neighborhood on the peninsula"
cited to **The Wave**, not to the census. **Write "more than 13,000 as of 2010, per The Wave."**

"Irish Riviera" **CONFIRMED**, cited to a 2006 *Village Voice* piece. The 25.4% figure is
**CONFIRMED verbatim but is a 2000-census ZCTA statistic**, assembled by a Wikipedia editor from
FactFinder — the "2nd most Irish region in the whole country" comparison to Boston's South Shore is
that editor's synthesis. **Single-sourced and quarter-century-old. May ship only with both
qualifiers: "as of the 2000 census" and attribution.**

**F-115 — one REFUTATION, several confirmations.** Radio Days (1987, on location), *Our Hawaii*
(2010, by **Kryssa Schemmerling**), Jill Eisenstadt's *From Rockaway* (1987) and *Swell* (2017), and
the Ramones' "Rockaway Beach" reaching **#66 on the Billboard Hot 100** as their highest-charting
single — **all CONFIRMED verbatim.**
**The finder's guess is REFUTED:** the unnamed "recent prestige drama" is not *How To with John
Wilson*; the article names **The Marvelous Mrs. Maisel** (season 2, episode 1) — and note it says
Susie was raised in **"The Rockaways,"** not Rockaway Beach, so it is a weak peg. The 1973
*All in the Family* item is **present but entirely uncited**, as are the *Sons of Anarchy*,
*Ramona and Her Father* and Matt Booshell items. **UNCERTAIN — do not ship the uncited four.**
The Eisenstadt entry's citation is to an unrelated children's book (*Lily's Crossing*) — a broken
citation. Attribute carefully or drop.

**F-116 — mixed.** **CONFIRMED with supporting citation text:** Patti Smith (**the memoir IS named:
*M Train*** — the finder said "do not assume"; it is now confirmed), Al McGuire ("raised in Rockaway
Beach"), Skip Campbell ("born in Rockaway Beach"), Jonathan Monaghan ("born and raised in Rockaway
Beach"), Andrew VanWyngarden ("bought a house in Rockaway Beach in 2012"), Kenny Vance (citation:
"A resident of Rockaway Beach in Queens for 38 years"). **UNCERTAIN:** Vito J. Castellano and
Michael "Iz the Wiz" Martin — both are listed, but **neither cited source visibly asserts a Rockaway
Beach connection** (an obituary and a hip-hop birthday post). Ship them only as "listed by
Wikipedia," or omit.
**Emil Lucev / Rockaway Beach Hospital — the finder's warning is CONFIRMED and correct.** Do not
claim the hospital.

**F-96 aviation — REFUTED, and the finder's own guess was wrong too.** The article says the four
Navy-Curtiss seaplanes *"took off in **[[Neponsit, Queens|Neponsit]]**"* — far **west**, not "further
east" as the finder speculated. Also the whole passage carries `{{Citation needed|date=December
2025}}`. **Not ours, and not usable at all.**

---

## 13. THE ALLEY POND PARK STRUCTURAL QUESTION — RULED: **(a)**

I read the gate itself (`test/ethos/seeds/queens_seed_data_test.exs`, `@marquee_institutions` at
line 376, the assertion at line 1129) before ruling.

**I choose (a): ALLEY POND PARK GETS A HOSTED RECORD, in `priv/seed_data/queens/douglaston.json`.**

**Why, on the merits and not on effort.**

The gate's own header states what it is: *"Not a content rule — a coverage rule."* Its stated failure
mode is that *"a wave that owns one half of a park can reasonably assume the other half's wave
covered the institution, and that wave can reasonably assume the reverse, and the institution falls
through the gap."* **A park that has been ruled to belong to no neighborhood is not the exception to
that hazard — it is the maximal case of it.** Every abutter can now point at the ruling and decline.
Zero is exactly the outcome the gate exists to catch, and the fact that this particular zero was
reached deliberately does not make the reader better served.

**Hosting is not claiming, and the corpus already has the vocabulary for the difference.** I read the
Forest Park record in `forest-hills.json`: `"town": "Queens"` — not "Forest Hills" — with
`"history"` opening *"The park is not administratively part of any neighborhood…"*. That record makes
`/p/forest-park` exist, gives a 506-acre Flagship Park an address, and states in plain prose that it
is in no neighborhood. It answers both questions correctly at once. **The corpus is not inconsistent
because Forest Park is hosted; it is inconsistent because Alley Pond Park is not.**

**Why (b) is wrong.** Removing Forest Park's record to match Alley Pond's absence resolves the
inconsistency in the direction that loses information. It would 404 `/p/forest-park` while
`forest-hills.json`'s guide prose and FAQ still discuss the park at length (I read both: the intro,
`sections/0`, `faq/1` and `faq/2` all reference it). It converts a **coverage** rule into a
**containment** rule, which is not what the gate says it is. And it deletes a well-sourced record to
make a test pass — the exact move the gate's own comment forbids in its sibling form ("never delete
a row").

**Why (c) is wrong, and why saying so matters.** Rewriting the assertion to
"institutions with a determinable home appear exactly once; institutions ruled to none appear zero
times" makes **the ruling itself the escape hatch**. Any future wave facing an expensive
cross-boundary park could rule it homeless and be excused from covering it — reintroducing precisely
the gap the gate was written from outside the corpus to prevent. That is weakening a gate to make a
failure go away, wearing a distinction as a disguise. **Reject.**

### What the coordinator must do

**`bayside.json` and `douglaston.json` have both already shipped, so this is an instruction to the
coordinator, not to any author in this wave.**

**File: `priv/seed_data/queens/douglaston.json`.** Between Bayside and Douglaston, the wave-5 record
states that *area* favours Bayside but *boundary* favours Douglaston, and that a third abutter
outranks Bayside — so Bayside's only claim is the one already beaten. Shared-boundary length is also
the same class of evidence that decided Forest Park in wave 4, so choosing Douglaston keeps the
**method** consistent, not just the pattern.

**The record may contain, and may contain only:**
- `"slug": "alley-pond-park"` (the gate matches `~r/^alley-pond-park/` on slug prefix)
- `"kind": "park"`, `"town": "Queens"` — **never `"Douglaston"`**
- `"county": "Queens"`, `"state": "New York"`
- `"address"`: the park's own NYC Parks street address, verified by the coordinator against
  nycgovparks.org — **which now answers to a browser User-Agent (§0.3)**, so this is checkable
- `"summary"`: NYC Parks' own facts — acreage, designation, the roads that bound it
- `"history"`: **must state plainly that the park is in no neighborhood**, and should say why: no
  instrument places it, every source says *borders*, and it reaches Community District 13. Mirror
  the Forest Park wording, which I quote above.
- **NO containment sentence anywhere.** Not "in Douglaston," not "Douglaston's park," not
  "on Douglaston's edge" in a way that implies ownership.
- A matching `entries` row of `"kind": "sight"` with a note that repeats the no-neighborhood fact,
  as `forest-hills.json` does.

**Also for the coordinator — a second marquee row, and a trap in it.** The gate's comment invites a
future row for Rockaway Beach: *"Rockaway Beach (spans the whole peninsula) — `rockaway-beach` is in
scope, so a row for it is safe to add."* **It is not safe as written.** A pattern
`~r/^rockaway-beach/` would match `rockaway-beach-boulevard`, `rockaway-beach-branch`,
`rockaway-beach-surf-club`, `rockaway-beach-skate-park` **and the neighborhood guide slug itself**.
Multiple matches inside one file are harmless (the assertion counts *files*, and its message says so
explicitly), **but far-rockaway.json is landing in this same wave and will plausibly carry a
`rockaway-beach-…`-prefixed slug of its own — which makes the count 2 and fails.**

If a row is added, it must be anchored to the park:
`{"Rockaway Beach and Boardwalk", ~r/^rockaway-beach-and-boardwalk/}`, and the record must live in
**exactly one** file. **Host it in `rockaway-beach.json`**, on the Forest Park naming precedent — the
park's Parks-registered name is "Rockaway Beach and Boardwalk" and this is the neighborhood it is
named for. `far-rockaway.json` must then reference it, not re-create it.

---

## 14. WHAT THE AUTHOR MUST BE WARNED ABOUT

1. **Never write a street-range boundary sentence.** The one article that supplies them supplies two
   incompatible ones and an internal three-block overlap (§1.1).
2. **The Rockaway Beach and Boardwalk may not be claimed whole** — NYC Parks stamps it with four ZIP
   codes and calls it a Park Group. Quote that; it is your proof.
3. **Rockaway Beach Boulevard, Beach Channel Drive, Rockaway Freeway and Shore Front Parkway all run
   the length of the peninsula.** Shore Front Parkway's own infobox names three neighborhoods. None
   may be claimed whole. Far Rockaway is a sibling page in this wave and shares all four.
4. **Nothing in this document is in Nassau County, Atlantic Beach, Lawrence or Inwood.** Confirmed.
5. **Do not narrate Seaside, Rockaway Park, Arverne, Edgemere, Belle Harbor, Neponsit or Breezy
   Point as ours.** None has a page. Do not narrate Far Rockaway's places either — Redfern, the
   bungalow historic district, Temple Israel of Far Rockaway, the Richard Cornell Graveyard.
6. **Temple of Israel (ours, Beach 84th) and Temple Israel of Far Rockaway are two different
   congregations with nearly the same name.** F-75 is verbatim and says so. Do not merge them.
7. **Three libraries sit on Rockaway Beach Boulevard**: Peninsula (92-25, ours), the modern Seaside
   branch (116-15, Rockaway Park), and the historical Seaside Branch of 1932 (F-55). Do not merge.
8. **The Rockaway Courthouse's current use is unknown. No present tense.**
9. **Whaleamena, Dayton Beach Park, Surfside Park Apartments, P.S. 183, the Moulin Rouge Inn and the
   Rockaway Beach Board of Trade have no publishable address.** History prose only, past tense.
10. **The Flushing Meadows–Corona Park constraint does not bind this page** — no
    `Ethos.Seeds.CitiFieldPlaces` holding is anywhere near the peninsula, and nothing in the finder
    reaches for one. Link to `/g/citi-field-guide` only if a routing sentence is genuinely warranted;
    on this page it almost certainly is not.
11. **`rockawave.com` is live** and is the richest unexploited source for this neighborhood, exactly
    as the finder suspected. Three Wikipedia articles I read cite it directly.

---

## HEADLINE COUNT

- **Claims adjudicated: 131** (F-B1–F-B15 and F-1–F-116), plus the 14 contested-assignment rows and
  the Alley Pond structural question ruled separately.
- **Confirmed: 103**
- **Refuted: 13**
- **Uncertain: 15**
- **Places surviving as publishable: 12**

**The twelve, with the exact address string each may ship:**

| # | Place | Address |
|---|---|---|
| 1 | Rockaway Courthouse (NRHP #13001155) | `90-01 Beach Channel Drive, Rockaway Beach, NY 11693` |
| 2 | Temple of Israel Synagogue (NRHP #13001156) | `1-88 Beach 84th Street, Rockaway Beach, NY 11693` |
| 3 | St. Rose of Lima Roman Catholic Church | `130 Beach 84th Street, Rockaway Beach, NY 11693` |
| 4 | Peninsula Library (Queens Public Library) | `92-25 Rockaway Beach Boulevard, Rockaway Beach, NY 11693` |
| 5 | Hammel Houses (NYCHA) | `84-16 Rockaway Beach Boulevard, Queens, NY 11693` |
| 6 | Rockaway Beach Surf Club | `302 Beach 87th Street, Rockaway Beach, NY 11693` |
| 7 | Tacoway Beach | `302 Beach 87th Street, Rockaway Beach, NY 11693` (same address as 6) |
| 8 | Rockaway Beach and Boardwalk | `Beach 3 St. to Beach 153 St., Queens, NY` — shared, never whole |
| 9 | Rockaway Beach Skate Park | `Beach 91st Street, Rockaway Beach, NY 11693` |
| 10 | Beach 90th Street–Holland station | `Beach 90th Street & Rockaway Freeway, Queens, NY 11693` |
| 11 | Beach 98th Street–Playland station | `Beach 98th Street & Rockaway Freeway, Queens, NY 11693` |
| 12 | Rockaways' Playland (defunct, 1902–1985) | `Beach 97th–98th Streets, Rockaway Beach, NY 11693` |

**Places rejected that the finder listed or entertained: 6** — St. Camillus (Rockaway Park), the NYC
Ferry landing (Rockaway Park / Far Rockaway per its operator), Beach 105th Street station (Rockaway
Park), P.S. 225 (ZIP 11694, "Seaside"), the ice hockey rink (Beach 109th), Rockaway Beach Hospital
(Far Rockaway). **Haven Ministries** is not a thirteenth place — it is the current occupant of #2 and
belongs in that record's prose, with its currency flagged.

**Businesses whose only source is a DOHMH/DCWP inspection record: ZERO.** No place on this page is
subject to the "existence and address may be published but nothing may appear in prose" constraint.
