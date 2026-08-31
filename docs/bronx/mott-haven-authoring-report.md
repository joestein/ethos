# Mott Haven — authoring report

Output: `priv/seed_data/bronx/mott-haven.json`. Inputs: `docs/bronx/mott-haven-verdicts.md`
(authority), `docs/bronx/mott-haven-finder.md` (context and citations),
`docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` (contract),
`priv/seed_data/bronx/belmont.json` (shape).

## Tier

**9 surviving places → `"tier": "guide"`**, set explicitly. Nine clears rule 3's
six-place threshold. Note that the verdicts file's closing paragraph counts
*claims per place* ("5 places clear the 6-confirmed threshold"); rule 3 counts
**surviving places**, not claims per place, so the guide tier is the correct
call and the verdicts' own phrasing is not the tier test.

## What shipped

| Place | kind | entry kind |
| --- | --- | --- |
| Mott Haven Historic District | `historic-site` | `walk` |
| Mott Haven East Historic District | `historic-site` | `walk` |
| Bertine Block Historic District | `historic-site` | `walk` |
| St. Ann's Church and Graveyard | `historic-site` | `sight` |
| Mott Haven Library | `attraction` | `sight` |
| Bronx General Post Office | `historic-site` | `sight` |
| St. Mary's Park | `park` | `walk` |
| La Morada Restaurant | `restaurant` | `food` |
| The Bronx Brewery Tap Room | `brewery` | `food` |

Intro 149 words. Three sections, the last headed exactly `Getting there`. Five FAQ
entries, one of them `How do I get to Mott Haven?`. No photos (Belmont ships none
and the research carried no candidates). All nine slugs checked against every
`priv/seed_data/*/*.json` and `lib/ethos/seeds/*.ex` — no collisions.

## The three refutations

1. **Bronx General Post Office exterior designation** — published as
   **September 14, 1976**, with the place's `history` naming the November 25,
   1975 date explicitly as a newspaper report of the pending designation rather
   than the designating act. The correction is used as given.
2. **Firehouse tenant roster** — moot; the firehouse is cut (below).
3. **The Bronx Brewery** — the word "craft" appears nowhere in the file. The
   business name and the two-location claim (Bronx; Hudson Yards, Manhattan)
   ship as confirmed.

## The one uncertain

**This section was wrong as first written and is corrected here; see "Fix round
1" at the end for what actually shipped.** As of that fix, the Star of Munster
Ballroom's "center of Irish music for decades" gloss is **deleted**. What
survives is the confirmed location: "The Star of Munster Ballroom was at the
northeast corner of Willis Avenue and East 138th Street."

## Cut, and why

- **Firehouse, Engine Company 60 / Ladder Company 17** — cut as a *place*, but
  **not cut from the page**, and the distinction matters. An active working
  firehouse with no public access, and once the refuted tenant roster is
  stripped what remains is an address and a designation date: the stub shape
  this corpus removed on purpose. So no place record. Its landmark fact survives
  in `guide.sections[1].body` as one sentence naming 341 East 143rd Street, the
  **corrected** roster exactly as `mott-haven-verdicts.md:157` gives it — Engine
  Company 60, Ladder Company 17 and Battalion 14, with Squad 41 correctly absent
  because it is a different, unlandmarked firehouse at 330 East 150th Street —
  the June 20, 2000 designation, and the plain statement that it is not written
  up here as a place to go. That is §2's "keep the item using the correction
  exactly as given" doing its job, not a deletion.
- **"Swedish sea captain"** (Jonas Bronck) — the verdict restated only "Bronx
  named after Jonas Bronck". The occupation and nationality rode along in the
  finder's sentence and were not restated, so they are cut under §2's New Lots
  rule. The intro says "Jonas Bronck farmed here" and nothing more.
- **"One of the largest parades in New York City"** — same rule. The verdict
  restated "Large IRA-veteran parade, late 1940s/early 1950s"; the citywide
  ranking was not restated. Published as "Irish Republican Army veterans
  organized a large parade here in the late 1940s or early 1950s."
- **"Art Deco"** (Bronx General Post Office) and **"row-house"** (Mott Haven
  East and Bertine Block) — style/type clauses that appear only in the finder's
  own "What it is" headers, never in a verifier-authored field. Cut. "Row
  houses" and the Gothic/Queen Anne/Romanesque list survive **only** for the
  Mott Haven Historic District, where the verdict restates them verbatim; the
  library's "neo-renaissance" survives on the same basis.
- **Every DOHMH and licence reference.** *The original wording of this bullet
  was wrong and is replaced.* It claimed the addresses and the cuisine could
  ship "as plain facts about the place, with no citation to the record that
  established them." **Removing the citation does not change the provenance.**
  DOHMH is permitted as identity evidence — which is the structured `address`
  field — and never as prose. As of fix round 1, no DOHMH-derived content
  appears in any prose string: no inspection date, no grade, no dataset, no
  cuisine, and neither 308 Willis Avenue nor 856 East 136th Street inside a
  sentence. Both addresses remain in the `address` field, which is the
  permitted use. **That last sentence was still wrong, and round 2 fixed it
  properly: coarsening "Mexican" to "restaurant" did not launder the
  provenance, because the source is the NYC *restaurant* inspection dataset and
  membership is what establishes the category. La Morada is withdrawn
  entirely. See "Fix round 2".**

## Judgment calls honored

- **Mott Haven Library's 1969 date** is written as inherited from the Mott
  Haven Historic District's July 29, 1969 designation, with the reason stated:
  the boroughwide list carries no separate library entry, and the Bronx's
  individually landmarked NYPL branches are Morrisania, Hunts Point and
  Woodstock.
- **The 149th Street transit cluster** — Case C throughout. The `Getting there`
  section names all seven stations and their lines and then says the article
  lists them without saying where any physically sits, that East 149th Street is
  the neighborhood's stated northern boundary, and that no station is therefore
  described as being inside Mott Haven. Metro-North is Case B: Harlem–125th
  Street and Yankees–East 153rd Street are named as the closest stops and
  explicitly placed outside the neighborhood. **Gap recorded for a later pass:
  no source resolves which side of East 149th Street the two 149th Street
  station entrances sit on.**

## The gap that was closed

**St. Ann's street address: resolved.** `295 St. Ann's Avenue, Bronx, NY`, from
Wikipedia's article on the church (`St._Ann's_Episcopal_Church_(Bronx)`), fetched
2026-08-31. The place's `summary` says where the address came from, since the
research artifacts carried none. Two facts on that page were **not** imported —
its "1840" build year (the verdicts confirm **1841**, and the verdicts are the
authority) and an NRHP listing date of April 16, 1980, which no verdict carries.
The page also has no ZIP, so the place ships without one.

## Other gaps recorded

- **`"links": []`.** No outbound edge could be authored from the research. The
  only other Bronx guide is Belmont, which neither borders Mott Haven nor sits
  in the same part of the borough, so `nearby` and `same-region` are both false.
  A cross-borough `see-also` would need a named Manhattan *neighborhood*, and
  the research gives none: the Third Avenue Bridge is confirmed as connecting
  "Manhattan and the Bronx" with no neighborhood named, and rule 6.3's own note
  says a stop whose name contains a neighborhood name ("Harlem–125th Street") is
  not a location claim. Picking a target would have been my own knowledge, which
  rule 2 forbids. A later pass covering Port Morris or Melrose closes this
  cheaply — the verdicts already establish that the "North Side"/"North New
  York" naming belongs jointly to Mott Haven and Port Morris.
- **`St. Mary's Park` ships with `"address": null`** — the research established
  no street address and `nycgovparks.org` returned 403 to the finder on two URL
  variants, so `official_url` is `null` too. No address was guessed.
- **No lodging.** The only candidate, the Opera House Hotel at 436 East 149th
  Street, is Melrose's by Wikipedia's own infobox. The "Where can I stay"
  FAQ says so and says the absence is a gap rather than a finding. No `links`
  edge accompanies it because Melrose has no guide (`in_scope: false`).
- **No photos.** No candidates in the research; none invented.

## Test-file change, and why it is not a gate weakening

`test/ethos_web/components/structured_data_test.exs` carries a recorded corpus
census that its own comment says to "update deliberately when the corpus grows;
never to make a failing test pass." The corpus grew, so the five numbers moved
and the comment now accounts for every digit:

| assertion | was | now | delta |
| --- | ---: | ---: | ---: |
| total emitted | 2106 | 2114 | +8 |
| with `streetAddress` | 1571 | 1576 | +5 |
| without `streetAddress` | 535 | 538 | +3 |
| with `postalCode` | 1709 | 1713 | +4 |
| locality-only | 245 | 248 | +3 |

Nine places, eight with an address (St. Mary's Park is `null`). Five carry a
house number; the three historic districts carry street ranges and so emit
locality with no `streetAddress`, exactly the ciccarone-park shape the previous
re-measurement documented. Postal is +4 rather than +5 because St. Ann's address
carries no ZIP. No assertion was loosened and no threshold was widened.

## Verification

- `mix format --check-formatted` — clean.
- `mix test test/ethos/seeds/bronx_seed_data_test.exs` — 23 tests, 0 failures,
  2 excluded. The Bronx gate now runs over 2 seed files.
- `mix test` — **650 tests, 0 failures, 32 excluded**, matching the baseline.
- Tolerated pre-existing warnings only: `gettext.ex:23`, `data_guide_test.exs:16`,
  `ct_guides_test.exs:21`.
- No allowlist entry was added to either the trip-duration or the proximity
  allowlist; both remain empty.

---

# Fix round 1 (of 5) — fact-fidelity review

One Critical, three Important, one class of Minor. **Four of the five were
fixed here; the fifth — the DOHMH finding — was only partly fixed and round 2
completes it. The "All five fixed" this section originally claimed was an
overstatement and is withdrawn.** **Deletion
was preferred over rewording in every case where the confirmed material stood on
its own**, which was all but two. The `address` fields, the place count, the
slugs and the structured-data census are unchanged, so the numbers in the table
above still hold.

### Deleted outright

| What | Where | Why |
| --- | --- | --- |
| "What Wikipedia says about the ballroom beyond its corner — that it was a center of Irish music for decades — was not independently verified…" | `guide.sections[0].body` | **The Critical.** This reproduced the `uncertain` specific verbatim and then licensed the reader to keep it — a hedge in a novel form, worse than "reportedly" because the claim is on the page in full. §2's remedy is deletion. The confirmed corner survives in the preceding sentence. |
| "and much of what the neighborhood is known for stands on or near it" | `guide.sections[0].body` | In neither the verdicts nor the finder. Verdict:30 restates only "E. 138th St as primary east–west thoroughfare". |
| "From the end of the nineteenth century through the 1940s" | `guide.sections[0].body` | New Lots rider. Verdict:31 restates only the German/Irish split at E.145th; the date range is finder:58. §2 names dates as the paradigm case. |
| "between the Dutch authorities and the Wecquaesgeek chiefs" | `guide.intro` | New Lots rider. Verdict:24 restates the chiefs and the house, not the parties. Now reads "the peace treaty with the chiefs Ranaqua and Tackamuck was signed in his house." |
| "Neither of those two has an article of its own that this research reached; both rest on Wikipedia's Mott Haven article and the boroughwide landmarks list." | `guide.sections[1].body` | Research-process prose. |
| "and was not cross-checked against a second source" / "and no second source was checked against it here" | `guide.sections[1].body`, `places[3].summary` | Research-process prose. The required attribution — "Wikipedia's Mott Haven article calls it the Bronx's oldest church; that is the article's own characterization" — is kept in both. |
| "That gap is recorded rather than papered over." | `guide.sections[2].body` | Research-process prose. The Case C statement itself stands. |
| "No article devoted to the district was reached by this research; both facts rest on…" (and its Bertine twin) | `places[1].summary`, `places[2].summary` | Research-process prose. |
| "The research this page was built from carried no street address for the church, so the one published here comes from Wikipedia's article on the building." | `places[3].summary` | Research-process prose. The provenance is recorded in this report instead, which is where it belongs. |
| "and is carried by nothing else this research reached" | `places[4].summary` | Research-process prose. The attribution "which is the library's claim about itself" is kept. |
| "The city's own park page could not be opened by this research, so no official link is published here." | `places[6].summary` | Research-process prose. `official_url` stays `null`, which says it silently. |
| "Nothing about its founding, its family or its cooking was established by this research… The domain that looks like the restaurant's own resolves to an unrelated expired-domain page, so no official link is given." | `places[7].summary` | Research-process prose, and the second clause is also a present-tense claim about a third party, banned by rule 15. |
| "That site states no founding year and prints no street address." | `places[8].summary` | Research-process prose. |
| "Wikipedia's article does not spell out that the purchase is the act that named the place…" | `guide.faq[1].answer` | Research-process prose. The verifier ruled the naming confirmed; the meta-commentary was mine. |
| "because nothing reached establishes what the building does now" and "Wikipedia's account of that 2025 lease is the freshest source this research reached…" | `guide.faq[3].answer` | Research-process prose. Now opens "This page does not say what the building holds today." |
| "The one lodging candidate this research examined" → "The"; "No hotel inside Mott Haven was established by this research." | `guide.faq[4].answer` | Research-process prose. The gap statement that opens the answer already carries the point. |

### Reworded, not deleted — two, and only because a bare deletion left a gap

1. **"brownstones" → "row houses"**, in `guide.sections[1].body` and
   `places[0].summary`. Verdict:60 restates only the two nicknames; verdict:59
   restates **row houses**, not brownstones. The sentence needs a noun for the
   nicknames to attach to, so the unrestated word is replaced with the restated
   one rather than dropped. (In `places[0].summary` the second mention became
   "some of them", since "row houses" already appears earlier in that sentence.)
2. **La Morada and the Bronx Brewery summaries and notes**, stripped of every
   DOHMH-derived element. `places[7].summary` is now the single sentence "A
   restaurant in Mott Haven." — the cuisine ("Mexican", Socrata's cuisine field,
   verdicts:138) and the prose address (verdicts:137) are both gone, and
   `entries[7].note` matches. `places[8].summary` drops 856 East 136th Street
   (verdicts:145) and keeps only what the brewery's own site states;
   `entries[8].note` likewise. `Place.changeset` requires a non-empty `summary`,
   so a one-sentence summary is the floor here rather than an empty one — and
   there is no minimum word count in this corpus, so one true sentence is a
   pass. Both `address` fields are untouched.

### Two corrections to this report itself

- **"The one uncertain" section** claimed the gloss was "removed, not hedged."
  Half of that was false — no "reportedly" or "said to have been" appeared, but
  the specific itself was on the page verbatim. The section is corrected above
  and points here.
- **The DOHMH bullet under "Cut, and why"** framed dropping the citation as
  sufficient. It is not: provenance is not a function of whether it is cited.
  The bullet is rewritten above.
- **The firehouse bullet** described the firehouse as simply "cut", which
  undersold it. It is cut as a *place*; its landmark fact and the corrected
  tenant roster survive in prose. Rewritten above.

### Verification after the fix

- `mix format --check-formatted` — clean.
- `mix test` — **650 tests, 0 failures, 32 excluded**.
- Swept the file for `this research`, `was reached`, `could not be opened`,
  `Mexican`, `brownstone`, `expired-domain`, `prints no street`, `308 Willis`,
  `856 East 136th`, `reportedly`, `said to have been`, `center of Irish music` —
  zero hits outside the two `address` fields. **The sweep's term list was itself
  incomplete: it did not include `restaurant`, which is the word that still
  carried DOHMH provenance. A sweep is only as good as its terms, and this one
  was built from the phrases already deleted rather than from the rule.**
- Intro is now 144 words, still inside 100-160. Nine places, nine entries, five
  FAQ entries, three sections; none of those counts moved. (Round 2 takes the
  places and entries to eight.)

---

# Fix round 2 (of 5) — re-review

Four of round 1's five findings came back ADDRESSED. The fifth was deeper than a
sentence, and four new findings came with it. All done.

## La Morada Restaurant — withdrawn entirely

The coordinator's ruling, and it is right. Every publishable fact about the
place is DOHMH-derived: `mott-haven-finder.md:175` says the pass produced "only
the DOHMH identity/address record above", and `mott-haven-verdicts.md:137-141`
lists exactly three claims, all marked existence/identity evidence and never
prose. There is no fourth claim a summary could be drawn from.

Round 1 tried to satisfy `Place.changeset`'s non-empty `summary` requirement
(`place.ex:49`) by coarsening "Mexican" to "restaurant". **That does not work,
and the reason is worth writing down: the DOHMH rule is a provenance rule, not a
specificity rule.** The source is the NYC *restaurant inspection* dataset;
membership in it is what establishes the category, so "restaurant" carries the
same provenance "Mexican" did, only vaguer. And on the merits, "A restaurant in
Mott Haven." is exactly the inspection-record boilerplate the rule exists to
prevent — it tells a reader nothing. This is the same call that cut the
firehouse: strip what cannot be published and what is left is a stub.

Deleted: the `places` entry `la-morada-restaurant` and its matching `entries`
entry. **8 places remain**, still clear of rule 3's six-place threshold, so
`"tier": "guide"` is unaffected and `tier_violations` (which fails a guide under
4 places) is nowhere near firing.

## The Bronx Brewery — kept, "tap room" out of prose

Unlike La Morada it has non-DOHMH sourcing: `verdicts.md:148` confirms the
business name and the two locations from the brewery's own site. But "tap room"
comes from the DOHMH DBA `THE BRONX BREWERY-TAP ROOM` (`verdicts.md:145`), so it
is out of the prose. `places[7].summary` now reads "The Bronx Brewery's Bronx
location. Its own site gives the business name as The Bronx Brewery and states
that it runs this Bronx location and a second at Hudson Yards in Manhattan."
`entries[7].note` never carried the phrase.

**One thing I did not change, flagged rather than decided unilaterally** — see
"Disagreement / open question" below: the `name` and `slug` fields still read
`The Bronx Brewery Tap Room` / `the-bronx-brewery-tap-room`.

## The four other findings

1. **Two scoped absences had become unscoped denials.** Round 1 turned "No
   source reached by this research names an NYC Ferry landing for Mott Haven"
   into "No NYC Ferry landing is named for Mott Haven" — trading research-process
   prose for an agentless passive that reads as a flat denial of NYC Ferry
   service. Nothing supports that; neither artifact mentions ferries at all.
   Both now use the page-voice shape: `sections[2].body` reads "This page does
   not name an NYC Ferry landing for Mott Haven." and `faq[0].answer` ends "This
   page does not name a ferry landing for Mott Haven." Same construction as
   `faq[3]`'s "This page does not say what the building holds today."
2. **A dangling reference left by a round-1 deletion.** Cutting the date range
   left "East 138th Street is the primary east–west thoroughfare through Mott
   Haven. **This** was a mixed German-American and Irish-American
   neighborhood…", where "This" pointed at the street. Now: "The neighborhood
   was a mixed German-American and Irish-American one, the German households
   north of East 145th Street and the Irish south of it."
3. **St. Ann's address provenance is now in a tracked artifact.**
   `docs/bronx/mott-haven-verdicts.md` gains an addendum at the end, headed and
   dated, stating plainly that it was appended at authoring time and is not part
   of the independent adjudication. It records the address, the source URL
   (`en.wikipedia.org/wiki/St._Ann's_Episcopal_Church_(Bronx)`), the fetch date,
   the one cross-check that agreed (the June 9, 1967 designation), and the two
   facts on that page deliberately not imported — its "1840" build year, which
   the verdicts contradict with 1841, and an NRHP date no verdict carries. Every
   fact on the page now traces to an artifact rather than to session scrollback.
4. **The report's own headline claim, corrected above.** "No DOHMH-derived
   content appears in any prose string" was false under the very principle the
   same bullet stated. The Fix-round-1 preamble's "All five fixed" and the
   closing sweep's term list carried the same overstatement; both are annotated
   in place rather than silently rewritten, since a report that quietly repairs
   itself teaches the next reader nothing.

## Census

`test/ethos_web/components/structured_data_test.exs` moves again, because
La Morada carried a street address with a house number and a ZIP. Every
assertion stays an exact `==`; the comment accounts for each digit.

| assertion | round 1 | round 2 | delta |
| --- | ---: | ---: | ---: |
| total emitted | 2114 | 2113 | -1 |
| with `streetAddress` | 1576 | 1575 | -1 |
| without `streetAddress` | 538 | 538 | 0 |
| with `postalCode` | 1713 | 1712 | -1 |
| locality-only | 248 | 248 | 0 |

The two street-less counts holding still is the check that the row removed was
the shape claimed — a place with both a house number and a ZIP ("308 Willis
Avenue, Bronx, NY 10454"), not one of the district rows.

## Untouched, as instructed

No `address` field was edited. The ballroom corner, the firehouse roster, the
September 14, 1976 designation and "row houses" are all as the re-review
confirmed them. Slugs, tier, section headings, FAQ count and the `Getting there`
heading are unchanged. Intro is 144 words.

## Disagreement / open question

**One, and it is a question rather than a disagreement.** The instruction was to
strip "tap room" from the brewery's *prose*, which I read as `summary` and
`note`, leaving `places[7].name` (`The Bronx Brewery Tap Room`) and
`places[7].slug` (`the-bronx-brewery-tap-room`) alone as identity fields, in the
same class as `address`. Two things argue for leaving them, and one against:

- *For:* the phrase is not raw DOHMH here. The verifier's own section heading at
  `verdicts.md:143` is "The Bronx Brewery — Tap Room", and §2's Wave 3 corollary
  says text the verifier itself wrote counts as restated "even when it appears
  in a field other than `item` or `reason`". The design spec's "a verdict decides
  the name, and the slug follows the name" then points at exactly this string.
- *For:* the slug is globally unique across every seed directory and the
  Connecticut module; changing it is a wider edit than this round authorises and
  would need a fresh uniqueness check.
- *Against:* `name` renders to the reader as a heading, so it is prose in every
  sense that matters to someone reading the page, and the identity/prose line I
  drew is the same kind of line round 1 drew wrongly around "citation versus
  provenance".

I have left it and am flagging it rather than deciding it. If round 3 wants it
gone, the change is `name` → "The Bronx Brewery", `slug` →
`the-bronx-brewery-mott-haven` (bare `the-bronx-brewery` risks colliding with a
later Port Morris or Melrose wave), plus the matching `entries[7].name` and
`place_slug`, and a re-run of the global slug-uniqueness assertion.

## Verification after the fix

- `mix format --check-formatted` — clean.
- `mix test` — **650 tests, 0 failures, 32 excluded**.
- Swept every string in the file, excluding `address` and `name`, for `tap
  room`, `La Morada`, `Mexican`, `308 Willis`, `856 East 136th`, `this
  research`, `brownstone`, `center of Irish music` — zero hits.
- 8 places, 8 entries, no dangling `place_slug`, three sections with `Getting
  there` intact, five FAQ entries including `How do I get to Mott Haven?`.

---

# Fix round 3 (of 5) — the flagged naming question, ruled

Round 3 was only the open question round 2 raised. **Ruling: rename.** The name
is **The Bronx Brewery** and the slug is **`the-bronx-brewery-mott-haven`**.

## Why the argument I made for keeping it was wrong

I had leaned on §2's Wave 3 corollary — verifier-authored text counts as
restated even outside `item` and `reason` — to treat `verdicts.md:143`'s heading
"The Bronx Brewery — Tap Room" as a restatement. **That reads the corollary too
widely.** The corollary applies when the verifier is *restating a claim*. A
section heading naming its own subject is not an adjudication; it identifies
*which DOHMH row is under review*. What the verifier actually adjudicated is at
`verdicts.md:148`, and that confirms the business name "The Bronx Brewery" and
the two locations from the brewery's own site. "Tap Room" is not in it.

And the project already has a rule that disposes of this without needing the
identity-versus-prose distinction I was weighing at all — from the ballpark
programme, carried into every wave since and restated at
`2026-08-30-bronx-neighborhoods-design.md:140-141`:

> A verdict decides the name, and the slug follows the name. Nothing enters a
> URL that a verdict does not carry.

Verdict:148 carries "The Bronx Brewery". So that is the name, and the slug
follows from it. The observation that `name` renders as a heading and is
therefore prose to a reader was correct but unnecessary — the naming rule gets
there on its own, and it binds `name` regardless of how it renders. Worth
recording, because the instinct to reason from *how a field renders* rather than
*which rule governs it* is what produced the round-1 DOHMH mistake too.

## The slug qualifier

`the-bronx-brewery-mott-haven`, not bare `the-bronx-brewery`. Verdict:148 itself
confirms two locations, and Port Morris and Melrose are both rostered, so the
bare form is a collision waiting for a later wave. A location qualifier is a
disambiguator rather than a name claim, and the corpus already does this —
`antonios-trattoria-belmont`, `mikes-deli-arthur-avenue`, `belmont-playground-bronx`.
Satisfies both rules at once.

## Every place the old slug or name appeared, before the change

Exhaustive, from a repo-wide grep of `the-bronx-brewery-tap-room`,
`The Bronx Brewery Tap Room` and `Bronx Brewery` across `priv/`, `lib/`, `test/`
and `docs/`:

| Location | Old value | Action |
| --- | --- | --- |
| `priv/seed_data/bronx/mott-haven.json:146` — `places[7].slug` | `the-bronx-brewery-tap-room` | changed to `the-bronx-brewery-mott-haven` |
| `priv/seed_data/bronx/mott-haven.json:147` — `places[7].name` | `The Bronx Brewery Tap Room` | changed to `The Bronx Brewery` |
| `priv/seed_data/bronx/mott-haven.json:204` — `entries[7].name` | `The Bronx Brewery Tap Room` | changed to `The Bronx Brewery` |
| `priv/seed_data/bronx/mott-haven.json:205` — `entries[7].place_slug` | `the-bronx-brewery-tap-room` | changed to `the-bronx-brewery-mott-haven` |

**Four occurrences, all in the seed file, all changed.** Nothing else in `priv/`
or `lib/` referenced either string — the old slug had never been committed
anywhere else, which is what makes this a clean rename rather than a migration.

**No prose change was needed.** Round 2 had already taken "tap room" out of
`places[7].summary` and `entries[7].note`, so the page never called it one thing
and linked another; this round only brings the identity fields into line with
the prose that was already correct. `official_url` is untouched.

Two stale mentions were left deliberately rather than silently corrected:

- `test/ethos_web/components/structured_data_test.exs:128` says "the Bronx
  Brewery tap room" inside the round-1 census comment. That comment is a dated
  record of what the census delta was at the time, and this round was told not
  to touch the census. Correcting it would falsify a historical note; noting it
  here is the honest alternative.
- The place table near the top of this report lists the old name. Left as-is for
  the same reason the round-1 and round-2 overstatements were annotated rather
  than rewritten: a report that quietly repairs itself teaches the next reader
  nothing. **The shipped name and slug are the ones in this section.**

## Global slug uniqueness — ran and passed

`Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0` is the corpus-wide
check: it walks every `priv/seed_data/*/*.json` — Connecticut, Manhattan,
Brooklyn, Queens and the Bronx — plus the Connecticut code module, and counts
owners with `length` rather than `uniq`, so an in-file duplicate collides too.
It is invoked from five per-directory gates plus its own helper test. **All six
were run explicitly, not just the Bronx one**, since a new slug is exactly what a
corpus-wide check exists for and `the-bronx-brewery-mott-haven` has never
existed before:

```
mix test test/ethos/seeds/seed_data_helpers_test.exs \
         test/ethos/seeds/bronx_seed_data_test.exs \
         test/ethos/seeds/brooklyn_seed_data_test.exs \
         test/ethos/seeds/manhattan_seed_data_test.exs \
         test/ethos/seeds/connecticut_seed_data_test.exs \
         test/ethos/seeds/queens_seed_data_test.exs \
         test/ethos/seeds/bare_places_roster_test.exs
→ 67 tests, 0 failures, 30 excluded
```

## Untouched, as instructed

The census and its four `==` assertions, every `address` field, the ferry
sentences, the verdicts addendum, the ballroom corner, the firehouse roster, the
September 14, 1976 designation and "row houses" — all unchanged. Still 8 places,
8 entries, `"tier": "guide"`, intro 144 words, `Getting there` heading intact.

## Verification after the fix

- `mix format --check-formatted` — clean.
- Global slug-uniqueness gate — ran, passed (above).
- `mix test` — **650 tests, 0 failures, 32 excluded**.
- Repo-wide grep for `the-bronx-brewery-tap-room` and `The Bronx Brewery Tap
  Room` across `priv/` and `lib/` — zero hits.
