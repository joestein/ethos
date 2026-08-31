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
  permitted use.

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

One Critical, three Important, one class of Minor. All five fixed. **Deletion
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
  zero hits outside the two `address` fields.
- Intro is now 144 words, still inside 100-160. Nine places, nine entries, five
  FAQ entries, three sections; none of those counts moved.
