# Ditmars-Steinway, Queens — VERIFIER verdicts

Role: INDEPENDENT VERIFIER. Every URL cited by the finder was re-fetched by me. Every string below
in `"double quotes"` is one I re-extracted myself from the live source. Where the finder's quote and
the source's wording differ, the source's wording is given and the finder's is marked as refuted.

## HEADLINE

| Metric | Count |
|---|---|
| Claims adjudicated | 108 |
| Confirmed | 88 |
| Refuted | 12 |
| Uncertain | 8 |
| Places surviving as publishable **in Ditmars-Steinway** | **1** (up to 3 if the arbitrator rules) |

**The 81% confirmation rate is a warning sign, not a success.** It is high because the corpus is
overwhelmingly *one page* — `en.wikipedia.org/wiki/Astoria,_Queens` — quoted over and over. See the
structural finding below: several of the finder's "independent" sources are redirects to that single
page. High agreement between a page and itself is not corroboration.

---

## STRUCTURAL FINDING THE FINDER MISSED (most important item in this file)

I resolved the finder's cited titles through the MediaWiki API. **Four of the finder's cited URLs are
not separate articles at all.** They are redirects into the single Astoria article:

| Finder's cited URL | Actually resolves to |
|---|---|
| `en.wikipedia.org/wiki/Ditmars,_Queens` | `Astoria, Queens` § *Ditmars* |
| `en.wikipedia.org/wiki/Astoria_Heights,_Queens` | `Astoria, Queens` § *Astoria Heights* |
| `en.wikipedia.org/wiki/Ditmars-Steinway` | `Astoria, Queens` § *Ditmars* |
| `en.wikipedia.org/wiki/Astoria_Pool` | `Astoria Park` § *Pools* |

There is **no Wikipedia article for Ditmars, for Ditmars-Steinway, or for Astoria Heights.** There is
also no `Steinway Village` article (title missing). Consequences:

1. **F-B1 and F-B2 are not two attestations of the boundary text — they are one string on one page.**
   The finder suspected this ("this is one claim propagated, not two"); it is worse than suspected,
   because there is no second page for it to have propagated *to*.
2. **F-B5, F27 and F61 are cited to a URL that does not exist as an article.** Their content is real
   (I found it in the Astoria § Astoria Heights section) but the citation string must be corrected
   before shipping or it will read as an independent source when it is not.
3. **Every boundary definition of "Ditmars" in this entire corpus traces to one sentence on one
   tertiary page.** Nothing in the document independently corroborates that Ditmars-Steinway has the
   boundaries the author will be tempted to draw.

---

## NEIGHBORHOOD ASSIGNMENT RULINGS

For each candidate: what the sources **actually** say, verbatim, and the exact publishable address.

### The two marquee institutions (each may appear in exactly ONE file corpus-wide)

**ASTORIA PARK → ASTORIA. Not Ditmars-Steinway. Ruling is unambiguous.**
- Source (`en.wikipedia.org/wiki/Astoria_Park`), verbatim: *"Astoria Park is a 59.96-acre (24.26 ha)
  public park in the **Astoria** neighborhood of Queens in New York City."*
- Boundary, verbatim: *"It is bounded by Astoria Park South, an extension of Hoyt Avenue, to the
  south; the Hell Gate, a strait of the East River, to the west; **Ditmars Boulevard to the north**;
  and 19th Street to the east."*
- **The finder's C7 conflict is REFUTED.** Ditmars Boulevard being the park's *northern boundary*
  means the park **stops at** Ditmars — a boundary is where a thing ends, not where it enters. No
  source places any part of Astoria Park in Ditmars or Ditmars-Steinway. The "abuts/enters" framing
  in C7 is the finder's inference, not a source's statement.
- Publishable address: **no street address is published by the source.** The boundary string above is
  the only locator. NYC Parks (`nycgovparks.org/parks/astoria-park`) returned **HTTP 403** to me as
  well — the finder was honest about that failure; I reproduce it.
- **Astoria Pool / Play Center (C8): same ruling, ASTORIA.** `Astoria Pool` is a redirect *into* the
  Astoria Park article. It is not a separate place with a separate assignment.
- **Warning to the author: Astoria Park and Astoria Pool belong in the Astoria file. Writing either
  into Ditmars-Steinway would take a marquee institution from the neighborhood its own source
  assigns it to.**

**SOCRATES SCULPTURE PARK → the source genuinely contradicts itself. Neither reading is
Ditmars-Steinway.**
- Prose, verbatim: *"at the intersection of Broadway and Vernon Boulevard in the neighborhood of
  **Astoria**, Queens"* and *"Mark di Suvero created Socrates Sculpture Park on an abandoned landfill
  and illegal dumpsite on Gibbs Point in **Astoria**."*
- Infobox/mailing address, verbatim: *"32-01 Vernon Boulevard, **Long Island City**, NY 11106"*
- **C3 CONFIRMED — the contradiction is real and I reproduced both halves myself.**
- **Which is better evidenced: ASTORIA.** The prose states the neighborhood *twice*, in two different
  sections, as a claim about location. The "Long Island City" string is a **postal** designation in a
  mailing address; LIC 11101/11106 ZIP boundaries do not track neighborhood boundaries and a mailing
  city is weaker evidence of neighborhood than prose that says "in the neighborhood of."
- Publishable address: **"32-01 Vernon Boulevard, Long Island City, NY 11106"** — publish the address
  string exactly as the source gives it even if the prose assigns the park to Astoria. Do not silently
  rewrite the city line to "Astoria"; that would be fabricating an address.
- **Ruling for this wave: Socrates Sculpture Park is NOT a Ditmars-Steinway place under any reading.
  It goes to Astoria or to Long Island City. Ditmars-Steinway has no claim on it.**

### Full assignment table (C1–C18)

| # | Place | Exact publishable address | What the source ACTUALLY says | Ruling |
|---|---|---|---|---|
| C1 | Steinway Mansion | **"18-33 41st Street, Astoria, Queens, New York 11105"** | Opening sentence and infobox both say **Astoria**. No source I fetched places it in Ditmars-Steinway or in "Steinway." | **ASTORIA.** Finder's conflict **REFUTED** — the "sits in the Steinway sub-section" leg is the finder's own inference from a boundary description, not a source statement. |
| C2 | Steinway & Sons factory | **"One Steinway Place, Astoria, NY 11105"** (company's own site) | steinway.com: *"One Steinway Place, Astoria, NY 11105"*. Wikipedia infobox: *"One Steinway Place, Queens, New York, New York, U.S."* Wikipedia body: *"Steinway Village **later** became part of Long Island City."* | **ASTORIA.** Conflict **CONFIRMED but narrowed**: the LIC sentence is about the **historic 19th-c. village**, not the modern factory. The company's own current address governs. See misquote note below. |
| C3 | Socrates Sculpture Park | **"32-01 Vernon Boulevard, Long Island City, NY 11106"** | See above | **Astoria (prose) vs LIC (postal); Astoria better evidenced. NOT Ditmars-Steinway.** |
| C4 | Noguchi Museum | **"32-37 Vernon Boulevard, Long Island City, Queens, New York"** | Opening sentence verbatim: *"a museum and sculpture garden at 32-37 Vernon Boulevard in the **Long Island City** neighborhood of Queens in New York City."* Infobox also LIC. | **LONG ISLAND CITY.** Finder's "internal contradiction" **REFUTED** — I found no Astoria assignment in the article. The "filed under the Astoria category" claim is unverified and is a category tag, not a location statement. |
| C5 | Riker–Lent–Smith Homestead | **"78-03 19th Rd., East Elmhurst, New York"** | Opening sentence verbatim: *"The Riker–Lent–Smith Homestead and Cemetery are a historic house and cemetery in the **Steinway and East Elmhurst** neighborhoods of Queens in New York City."* | **CONFIRMED three-way. This is the ONLY place in the entire corpus that a source explicitly names as being in "Steinway."** Its published address says East Elmhurst. See "sole survivor" below. |
| C6 | St. Michael's Cemetery | **No street address published** — source gives only *"located in East Elmhurst, Queens, New York"*, 88 acres, founded 1852 | Own article: **East Elmhurst**. Astoria article: *"Ragtime composer Scott Joplin is buried **across the Grand Central Parkway** at St. Michael's Cemetery"* | **EAST ELMHURST.** Conflict CONFIRMED but resolves cleanly: the Astoria page's own wording places it *across* the parkway, i.e. outside. Not Astoria, not Ditmars-Steinway. |
| C7 | Astoria Park | none published | see above | **ASTORIA.** Conflict REFUTED. |
| C8 | Astoria Pool / Play Center | none published | redirect into Astoria Park | **ASTORIA.** Conflict REFUTED. |
| C9 | Bohemian Hall & Beer Garden | **"29-19 24th Avenue, Astoria, Queens, New York, U.S. 11105"** | Verbatim: *"a private benevolent society founded in 1892 in **Astoria**, Queens"* | **ASTORIA per source.** Conflict **REFUTED as sourced** — "the address falls inside the stated Ditmars box" is the finder doing geometry, not a source speaking. Flagging that the geometry is suggestive is fine; asserting it is an assignment the finder was not permitted to make. |
| C10 | Astoria–Ditmars Blvd station | **"23rd Avenue, Ditmars Boulevard and 31st Street Astoria, New York"** | Infobox says **Astoria** | **ASTORIA.** Conflict **REFUTED** — a station carrying "Ditmars" in its name is a naming fact, not a location claim. |
| C11 | Steinway Street station (M/R) | *"under Steinway Street between Broadway and 34th Avenue"* | **Astoria** | **ASTORIA. Name-misleading finding CONFIRMED** — this station is nowhere near the Steinway sub-section. Do not use it as a Ditmars-Steinway transit anchor. |
| C12 | Kaufman Astoria Studios | **"35th Ave., 35th, 36th, and 37th Sts., Astoria, Queens, New York City"** | **Astoria** | **ASTORIA — exclude deliberately.** |
| C13 | Museum of the Moving Image | **"35th Avenue and 36th Street, Astoria, Queens, New York City"** | **Astoria** | **ASTORIA — exclude deliberately.** |
| C14 | Frank Sinatra School of the Arts | **"35-12 35th Avenue, Astoria, New York 11106, United States"** | **Astoria** | **ASTORIA — exclude deliberately.** |
| C15 | Hell Gate Bridge | no street address | Verbatim: *"between **Astoria**, Queens, and Port Morris, Bronx, via Randalls and Wards Islands"* | **ASTORIA.** Conflict **REFUTED** — no source puts it in Ditmars. |
| C16 | Marine Air Terminal / LaGuardia | no street address published; *"LaGuardia Airport in Queens, New York City"*, on *"the southern shore of Bowery Bay"* | LaGuardia article verbatim: *"on the waterfront of Flushing and Bowery Bays in **East Elmhurst**, and borders the neighborhoods of Astoria and Jackson Heights."* | **EAST ELMHURST.** "Borders Astoria" is explicitly *bordering*, not containment. Not Ditmars-Steinway. |
| C17 | Bowery Bay | no address (a body of water) | **The finder truncated the decisive sentence.** Actual verbatim: *"It is located **near the Ditmars Steinway area** in the neighborhood of **Astoria** in the New York City borough of Queens."* | **ASTORIA — and this is the single most important correction in the file.** This is the **only** sentence in the whole corpus that uses the phrase "Ditmars Steinway" about a *place*, and it says **near**, not *in*. The finder quoted only *"off the East River in New York City"* and dropped it. |
| C18 | Steinway Tunnel | no address | Verbatim: *"under the East River between 42nd Street in Manhattan and 50th Avenue in **Long Island City**, Queens"* | **LONG ISLAND CITY.** Naming-vs-location finding CONFIRMED. |

### The sole survivor

**Exactly one candidate is placed in "Steinway" by an actual source sentence:**

> **Riker–Lent–Smith Homestead and Cemetery** — *"a historic house and cemetery in the **Steinway**
> and East Elmhurst neighborhoods of Queens in New York City."*
> Publishable address: **"78-03 19th Rd., East Elmhurst, New York"**

Note the tension the author must not paper over: the source *names* Steinway but *publishes* an East
Elmhurst address. Both must ship together; do not print "Steinway" as the address city.

Two further places are defensible **only if the arbitrator rules that the Steinway sub-section maps
onto the Ditmars-Steinway file** — a ruling neither finder nor verifier may make:
- **Steinway Mansion**, "18-33 41st Street, Astoria, Queens, New York 11105"
- **Steinway & Sons factory**, "One Steinway Place, Astoria, NY 11105"

Both are sourced to **Astoria**. Absent an arbitration ruling they belong in the Astoria file.

---

## DOHMH / DCWP SOURCING RULING

**No candidate in this document is sourced to a DOHMH or DCWP inspection record — zero.** I checked
every one of the 18 contested places and all 83 facts. The document lists **no restaurants, bars,
cafés, bakeries or retail businesses at all**; the finder declined to list any, deliberately and
correctly, rather than fall back on inspection rows.

The single commercial entity, **Steinway & Sons**, is sourced to `steinway.com` — the company's own
website — which is an institutional primary source, not an inspection dataset.

**Therefore the "address-only, nothing in prose" restriction applies to nothing in this file.**
Everything that survives verification may appear in prose, subject to the attribution rules below.

**Consequence the author must plan around:** Ditmars-Steinway will ship with **no commercial life
whatsoever** — no restaurant, no bar, no shop, no bakery, and no café. For a neighborhood whose most
documented feature is "Little Egypt" on Steinway Street (F66), that is a conspicuous hole. Do not fill
it by inventing businesses, and do not fill it from inspection data.

---

## SINGLE-SOURCED CLAIMS

**Nearly the entire document is single-sourced, and most of it to the same page.** Ranked by risk:

| Claim | Sole source | May it ship? |
|---|---|---|
| The whole Ditmars boundary definition (F-B1/F-B2) | one sentence, `Astoria, Queens` | **Yes, with explicit attribution** ("Wikipedia's Astoria article describes Ditmars as…"). Must **not** be stated as fact in the site's own voice. |
| The name "Ditmars-Steinway" itself (F-B4) | one sentence, same page | **Yes, with attribution only.** Verbatim: *"…with their convergence point bearing the neighborhood name 'Ditmars-Steinway'."* No primary or official source establishes it. |
| "Little Egypt" (F66) | `Astoria, Queens` only | **Yes, with attribution.** I independently confirmed "Little Egypt" is **NOT PRESENT** on the `Steinway Street` page — F68 confirmed. It rests on one sentence. |
| Maltese population, 20,000 (F64) | `Astoria, Queens` only | Yes, with attribution. Undated figure — do not present as current. |
| Greek population 22,579 (1980) → 18,127 (1990) (F63) | `Astoria, Queens` only | Yes, with attribution and the years attached. These are **35-year-old** figures. |
| Astoria Park "largest of NYC's public pools" (F44) | `Astoria, Queens` only | Yes, with attribution — but it is an Astoria claim, not a Ditmars-Steinway one. |
| All landmark designation dates (F19/F20/F25/F41/F72/F82) | Wikipedia infoboxes | Yes, with attribution. **No LPC designation report was obtained by the finder or by me** — I re-confirmed `nycgovparks.org` returns **403**. Every date is second-hand. |

---

## REFUTED CLAIMS — 12. Do not ship any of these as written.

1. **F-B7** — *"passes through Astoria, Ditmars, and Long Island City."* **Not in the source.** The
   opening sentence says only *"a major, 2.4-mile (3.9 km), two-way street in the borough of Queens."*
   The endpoints sentence names only **Astoria and Long Island City**: *"Steinway Street runs
   north–south between Berrian Boulevard in Astoria and Northern Boulevard in Long Island City."*
   **"Ditmars" does not appear.** This matters: the finder used it to argue Steinway Street crosses
   all three wave neighborhoods. It does not, per this source.
2. **C1** — Steinway Mansion conflict is finder inference, not a source conflict.
3. **C4** — Noguchi "internal contradiction" not evidenced; the article says Long Island City throughout.
4. **C7** — Astoria Park "abuts/enters Ditmars." A northern *boundary* is where the park **ends**.
5. **C8** — same, for Astoria Pool.
6. **C9** — Bohemian Hall "address falls inside the stated Ditmars box" is unsourced geometry.
7. **C10** — a station name is not a neighborhood assignment.
8. **C15** — Hell Gate Bridge; source says Astoria, no competing assignment exists.
9. **F13 (partial)** — *"line opened June 13, 1915"* is **wrong**. Source: *"The first IRT Steinway
   **test train** between Grand Central and Vernon Avenue ran June 13, 1915."* A test train is not a
   line opening. Also: the December 1892 event is dated **December 28, 1892** and described as
   *"an accident … during an attempt to heat frozen dynamite,"* not simply "an explosion."
10. **F17** — misquote. Source: *"original pocket doors with cut glass depicting many of Benjamin
    Pike Jr.'s scientific instruments"*, **not** "cut glass in pocket doors depicting a number of his
    scientific instruments." Substance survives; the quoted string does not.
11. **F43** — the Olympic-years "conflict" is not real. The article says, once and unambiguously:
    *"The pools hosted swimming trials for three Summer Olympic Games in 1936, 1952, and 1964."*
    The "1936 and 1964" reading was an extraction artifact. **Settled: 1936, 1952, 1964.**
12. **F45** — truncated quote that dropped the "near the Ditmars Steinway area … in the neighborhood
    of Astoria" clause. See C17. This is the most consequential quoting error in the document.

**Also a misquote, folded into C2 rather than counted separately:** the finder rendered Wikipedia as
*"eventually became part of Long Island City."* The source says *"Steinway Village **later** became
part of Long Island City."*

---

## UNCERTAIN — 8. Mark `uncertain`; do not ship without a second look.

- **F4** (Stephen Halsey / John Jacob Astor / $2000 / $500 naming story) — not re-verified.
- **F5** (Hallett's Cove, 12th and 14th Streets) — not re-verified.
- **F12** (factory "in operation since the late 19th century") — not re-verified.
- **F30** (Astoria article listing St. Michael's as an Astoria *landmark*) — I could not extract a
  quotable sentence saying "landmark." What I did find is *"buried across the Grand Central Parkway
  at St. Michael's Cemetery"* — which reads as **excluding** it from Astoria, not listing it.
- **F39** (Robert Moses, 23 pools, Aymar Embury II, Gilmore David Clarke) — not re-verified.
- **F61** (bus routes Q18/Q19/Q66/Q69/Q100/Q102) — cited to a URL that is a redirect; the routes sit
  in the Astoria article's general Transportation section, **not** in the Astoria Heights section as
  the finder implies. Bus routes change; verify against live MTA before shipping.
- **F65** (Muslim population from Lebanon, Kosovo, Albania, Bosnia-Herzegovina) — not re-verified.
- **F67** (Italian, German, Irish, Jewish, Brazilian, Balkan communities) — paraphrase, not re-verified.

Sub-claims I confirmed only in part, and which should be trimmed rather than shipped whole: F-B3's
*"largely developed as a company town by the Steinway & Sons piano company"* clause; F9's phone
number; F15's "Manhattan scientific instrument manufacturer"; F23's "Around 1800" expansion; F41's
designation-scope quote; F42's "Olympic Tryout Pool" nickname; F72's "national historic district";
F80's "circular two-story core, buff brick, flying-fish frieze."

---

## CONFLICTS I SETTLED

- **Bohemian Hall, 1892 vs 1910 (F70) — the contradiction is REAL. I re-verified both halves.**
  - `Astoria, Queens`: *"The oldest beer garden in New York City, Bohemian Hall, was founded in 1910
    when Astoria was largely Irish, Italian, Bohemian (Czech), and Slovak."*
  - `Bohemian Hall and Beer Garden`: *"a private benevolent society founded in **1892** in Astoria,
    Queens"* — and I confirm the oldest-beer-garden superlative is **NOT PRESENT** on that page.
  - **Likely resolution (not established): the Society was founded 1892, the beer garden opened 1910.
    They are two different things being given one date.** Until someone sources that, **ship
    neither the superlative nor a bare founding year.** The address is safe: "29-19 24th Avenue,
    Astoria, Queens, New York, U.S. 11105".
- **Marine Air Terminal, 1995 vs 1980/1982 (F83) — REAL, and I settled it.** Both strings re-verified:
  LaGuardia says *"In 1995, the MAT was designated as a historic landmark"*; the Marine Air Terminal
  article gives **NYCL November 25, 1980** and **NRHP July 9, 1982**. **The specific dated
  designations are better evidenced than the vague 1995 sentence.** Use 1980/1982. (Note the finder
  had only "late 1980" — the exact date is November 25, 1980.)
- **F1 vs F2 "date conflict" — NOT A CONFLICT.** *"elected in 1870"* and *"later became the first
  Mayor of Long Island City in 1870"* agree. Both re-verified. Drop the flag.
- **F6 vs F7 "tension" — NOT A CONFLICT.** Two overlapping lists of company-town amenities on two
  different pages. Both verbatim-confirmed. They complement; they do not contradict.
- **NEW CONFLICT THE FINDER MISSED — Riker–Lent–Smith construction year.** The `Lent Homestead and
  Cemetery` article says *"The earliest part of the house was built by Abraham Riker in **1656**"*
  (infobox: *"1656, 1729 additions"*). The Astoria article's Astoria Heights section says *"Built
  around **1655** by Abraham Riker under a patent from Nieuw Nederland's last governor, Peter
  Stuyvesant."* **1655 vs 1656 — unresolved.** Do not state a year without hedging.
- **F27 CONFIRMED and the finder's warning upheld.** Verbatim: *"it is believed to be the oldest
  remaining dwelling in **New York City** still used as a residence."* This is (a) **city-wide**, (b)
  hedged with *"believed to be"*, and (c) carries *"still used as a residence"*. F24 is a different,
  narrower, unhedged claim: *"The house is the oldest known existing residential structure in
  **Queens**."* **The author must not merge these two into one superlative.**

---

## WARNINGS TO THE AUTHOR

1. **Ditmars-Steinway may end up with one place.** Only the Riker–Lent–Smith Homestead is named by a
   source as being in "Steinway," and its published address says East Elmhurst. Do not backfill.
2. **Do not take Astoria Park, Astoria Pool, or Socrates Sculpture Park.** All three are assigned to
   Astoria (or LIC) by their own sources. They are marquee, single-file institutions and taking one
   here would strip the file that actually earns it.
3. **The strongest sentence about this neighborhood says "near."** Bowery Bay is *"near the Ditmars
   Steinway area in the neighborhood of Astoria."* If the corpus's best "Ditmars Steinway" citation
   is a *near*, the file cannot be written as though the boundary is settled.
4. **Never write "tour the Steinway factory."** Institutionally sourced and current: *"We are no
   longer conducting public factory tours and we are not taking reservations for any future tours."*
   The end date is still unestablished — do not supply one.
5. **Everything here is tertiary.** No LPC report, no NYC Parks page (403 for me too), no census data
   for Ditmars-Steinway. Attribute accordingly.
6. **Known gaps are gaps in method, not in the neighborhood** — no churches, no businesses, no
   Lawrence Family Graveyard, no Athens Square / Ralph DeMarco / Rainey Park, no Astoria Generating
   Station. The finder's account of why is honest and I reproduce it without correction.
