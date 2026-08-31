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

The Star of Munster Ballroom's "center of Irish music for decades" gloss is
**removed, not hedged**. What survives is the confirmed location: "The Star of
Munster Ballroom was at the northeast corner of Willis Avenue and East 138th
Street." The section then says in plain terms that the music claim was not
independently verified and is therefore not repeated as fact. No "reportedly",
"said to have been" or "around" appears anywhere in the file.

## Cut, and why

- **Firehouse, Engine Company 60 / Ladder Company 17** — cut as a place. An
  active working firehouse with no public access, and once the refuted tenant
  roster is stripped what remains is an address and a designation date: the stub
  shape this corpus removed on purpose. Its landmark fact is folded into the
  "Alexander Avenue and the landmarked blocks" section as one sentence naming
  341 East 143rd Street, its actual tenants (Engine 60, Ladder 17, Battalion 14
  — Squad 41 does **not** appear), the June 20, 2000 designation, and the plain
  statement that it is not written up here as a place to go.
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
- **Every DOHMH and licence reference** — no inspection date, grade, dataset or
  the phrase "inspection record" appears in any published string. La Morada's
  and the brewery's addresses and La Morada's cuisine ship as plain facts about
  the place, with no citation to the record that established them.

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
