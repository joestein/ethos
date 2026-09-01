# Bronx Park — authoring report

Replaces the report written for the reverted attempt. That attempt shipped an
entire transit section and a Wildlife Conservation Society headquarters claim
that no verdict backed; the top-up has since been adjudicated
(`docs/bronx/bronx-park-verdicts.md`, `## TOP-UP VERDICTS`) and this file is
authored against both the original 90-claim pass and the top-up, with nothing
taken from the finder's prose that a verdict does not restate.

Output: `priv/seed_data/bronx/bronx-park.json`.

## Tier and floors

**5 surviving places** — Bronx Park, New York Botanical Garden, Bronx Zoo,
Lorillard Snuff Mill, Bronx River Forest. Below six, so `"tier": "town-page"`.

- Intro: **121 words**, floor 90, ceiling (ungated) 130. (126 before the
  Fordham Road restoration; the boundary-street list was shortened to its five
  streets to make room, and the full compass form is kept verbatim in the
  Bronx Park place summary.)
- Outbound links: **2**, floor 2 — lowered from 3 for the Bronx in
  `af86ba2`/`481248c`, and Bronx Park is the page the gate comment names as
  the reason: its verified neighbours are Pelham Parkway, West Farms and
  Belmont, and the narrowing to 14 in-scope neighborhoods put two of the three
  out of scope. One adjacency plus one honest thematic tie is the structural
  ceiling here, not a thin page.
- Sections: 2 — `A park, a garden and a zoo`, and `Getting there` (byte-exact).
- FAQ: 3, one of them `How do I get to Bronx Park?`.
- Photos: `[]` on the guide and on every place, matching the two shipped Bronx
  pages. No candidate artifact exists for this neighborhood and none was
  invented.

## The two links

| Target | `kind` | Why that kind |
| --- | --- | --- |
| `guide:belmont-bronx-guide` | `nearby` | Rule 11's `nearby` means a shared border and nothing weaker. Belmont's own article gives its boundary as "Bronx Park to the east" (confirmed, original pass), and the verifier's flagged item 2 sides with the Belmont/West Farms/Bronx Park consensus. A genuine shared line. |
| `place:new-york-aquarium` | `see-also` | Rule 11 reserves `see-also` for cross-borough edges with a real named connection. This is Bronx → Coney Island, Brooklyn, on the shared Wildlife Conservation Society operator tie. Not `nearby` (no border), not `shared-history` (the tie is a present operator relationship, not a stated historical one). |

The aquarium note uses the verifier's leaner recommended wording verbatim:
"The Bronx Zoo is managed by the Wildlife Conservation Society, which also
operates the New York Aquarium in Coney Island." The headquarters clause is
now confirmed on `wcs.org/about-us`, but the verifier notes the link does not
need it, and the shorter sentence carries the tie without it — so the fuller
one did not earn its place. Both notes are under the 160-character limit (144
and 121).

**No third link.** Fordham Heights is not `nearby` — the corpus's own
boundaries put Belmont between it and Bronx Park — and it is not shipping.

## Corrections applied

- **Enid A. Haupt Conservatory** — designated a New York City landmark
  **October 16, 1973**. The 1976 date (a secondary guidebook) does not appear.
- **Mertz Library** — completed **1900**. No "1900 vs 1901 conflict" is
  described, because the verifier established it does not exist.
- **American Bison Society** — "founded in 1905" and the 1913 shipment of
  fourteen bison to the National Bison Range and Wind Cave. "Founded at the
  zoo" is not published; the sentence sits in the zoo's conservation
  paragraph, which is what the source supports.
- **Rose garden** — Farrand's 1916 design and the 2007 renovation ship; NYBG's
  own "hundreds of unique rose varieties" is cut.
- **Fordham Road** — **corrected after review; the first version of this page
  got it wrong, and the framing that caused it came from the dispatch, not from
  the verdicts.** The dispatch stated a flat "REFUTED: Fordham Road runs between
  the Zoo and the Garden." The actual refutation, at
  `docs/bronx/fordham-heights-verdicts.md:532`, is explicitly narrow — "REFUTED
  as Fordham-side corroboration … The 'bisects' fact remains separately
  confirmed on Bronx Park's own article (`bronx-park-verdicts.md:22`) and **may
  still be published there**." And in this page's own authority the fact is
  affirmative twice: `bronx-park-verdicts.md:22` ("Fordham Road bisects the park
  between zoo and garden — **confirmed**") and line 45 ("Contains NYBG (north)
  and Bronx Zoo (south), divided by Fordham Rd | confirmed"). That file's
  summary lists exactly two refutations and this is not one of them. Following
  the dispatch dropped a confirmed fact — and the most useful orienting fact
  about the place.

  **Restored.** The page now states that Fordham Road divides the park between
  the Zoo and the Garden, in the intro, the history section, the "why are they
  in the same park" FAQ and the Bronx Park place summary; the Garden and the
  Zoo place summaries are sited north and south of the road.

  The "eastern terminus" wording is separately confirmed and is kept — with its
  **attribution fixed**. The source sentence is "The Bronx Zoo and New York
  Botanical Garden are at the eastern terminus of Fordham Road in Bronx Park":
  it names *both* institutions. The first version attributed the terminus to
  the Garden alone, in three places. It now reads "both the Bronx Zoo and the
  New York Botanical Garden stand at the road's eastern terminus in the park."
- **"On the condition it be used as a zoo and botanical garden"** — cut, not in
  the source.

### The Lorillard acquisition date, made consciously

Three confirmed and irreconcilable dates exist (1870, 1884, 1888–89). The page
publishes neither an assertion of one nor a list of three. It ships the
sentence confirmed verbatim — "Much of the land came to the city under the 1884
New Parks Act, from Fordham University and from the Lorillard family" — in the
intro and in the Bronx Park place `history`. **This implies 1884 to a reader,
and that is a deliberate choice, not an oversight:** the 1884 New Parks Act is
the legal instrument the source names, it is confirmed independently of the
acquisition-date dispute, and the alternative — dropping the mechanism
entirely — would leave the park's origin unexplained on a page whose whole
subject is how two institutions came to share it. The 1888–89 and 1870 dates
are simply absent; no acquisition *year* is asserted.

## Transit — what shipped and what did not

Every transit claim traces to a top-up verdict.

**Shipped**, all tied to a named entrance or gate by NYBG's or the Zoo's own
page, per rule 6.2(4):

- Subway: B/D/4 to Bedford Park Boulevard → Bx25 or Bx26 east, or on foot, for
  the Mosholu Entrance; 2 to Allerton Avenue → Allerton, Bronx Park East,
  Waring Avenue for the East Gate (pedestrian, daytime only); 2 to Pelham
  Parkway → west on foot for the Zoo's Gate B. The Zoo's own untied
  enumeration (2 or 5 to West Farms Square–East Tremont, East 180th Street or
  Pelham Parkway) is presented as the page's own list with no gate attached,
  which is how the verifier ruled it should stay.
- Metro-North: the Harlem Line station named **Botanical Garden**, and that
  the Garden's own page says it serves the Mosholu Entrance. Both halves are
  the confirmed elements.
- Bus, by entrance: Bx19/Bx12/Bx22/Bx9/Bx17 → Main Entrance (2900 Southern
  Blvd); Bx25/Bx26/Bx41/Bx34 → Mosholu Entrance (2950 Southern Blvd);
  Bx9/Bx19 to 183rd & Southern and Bx12/Bx22 to Fordham & Southern → Gate C;
  Q44 to 180th & Boston Road → Gate A; BxM11 express → Gate B.
- Ferry: one sentence, "Neither institution's own directions page names an NYC
  Ferry landing" — the verifier confirmed this as a genuine gap. It shipped
  **twice** in the first version, in the section and again in the FAQ; the FAQ
  copy is cut.

**Voice, corrected after review.** The first version framed every transit fact
as what a page says — nine attribution constructions in `Getting there` alone
("the Garden's page gives", "the Zoo's page gives", "The same page separately
lists"). That was a defensible reflex after the revert and the wrong call:
these facts are confirmed on official sources, and a confirmed fact can be
stated as a fact. Attribution belongs on a source's *characterization*, not on
its *information* — "The Bx19 serves the Main Entrance" needs no preamble. The
scaffolding is stripped; two attributions survive in the section, for the
reasons given below.

**The FAQ's bus enumeration is cut.** The first version restated **eleven**
routes — Bx19, Bx12, Bx22, Bx9, Bx17, Bx25, Bx26, Bx41, Bx34, Q44, BxM11 — as a
near-verbatim compression of the section above it. Entrance-tying satisfies the
verifier's ruling but not §6.2(4), which permits route numbers only where no
subway station serves the neighborhood or the research records buses as a
primary means of access; subway stations do serve here. The page was carrying
one route more than the draft pulled for exactly this defect, and carrying it
twice. The FAQ now names **zero** bus routes and points to the section, where
the entrance-by-entrance detail belongs.
- Gates and entrances: Main, Mosholu, Everett Garden Gate, East Gate; Gates A,
  B, C and the Southern Boulevard car-service drop-off.

**Excluded, the top-up's six uncertains:** the Metro-North station's street
address (2999 Southern Boulevard), its Bedford Park siting, its two
high-level side platforms, the Bx41 SBS connection, and the WCS
five-facility / 4-million-visitor / AZA-for-all-five cluster. Per §2 an
uncertain is excluded outright; none of them is hedged, and — the specific
defect that produced the Critical finding on an earlier page — **none is
reproduced inside a disclaimer sentence that then disowns it.** They simply
are not in the file.

**Also excluded, and worth flagging:** the Zoo's own page names the Harlem Line
to **Fordham** station plus the Bx9 east as a second Metro-North route. It is
in the finder's top-up but **no verdict row adjudicates it** — the top-up's
Metro-North table covers the Botanical Garden station only. Under "every
transit claim must trace to a top-up verdict" it does not ship. A later pass
should adjudicate it; it is likely fine, and its absence makes the Zoo's rail
answer thinner than the source allows.

**Two sourced specifics dropped to clear the gates**, both by removing the
specific rather than rewording around the ban:

- The Zoo's "walk five blocks south" from Fordham & Southern to Gate C —
  proximity pattern 1 (`\d+ blocks (south|…)`). Published as "then south on
  foot".
- NYBG's phrase "directly across the street from the Garden's Mosholu
  Entrance" — proximity pattern 3 (`across the street from`). Published as the
  Garden's page naming the station and stating that it serves the Mosholu
  Entrance, which is the same confirmed fact without the banned phrasing.

Neither is a new gap in the gate; both are the gate working, and neither claim
lost anything a reader needs.

## The four rules earlier pages paid for

1. **DOHMH/DCWP:** zero DOHMH-only places here (the finder reports 0 and the
   verifier confirmed it). No inspection-derived date, grade, cuisine or
   category noun appears in any string.
2. **Research-process prose:** the first version of this report claimed this
   was "used once". That was wrong, and the review was right to say so: the
   ferry sentence shipped twice and `Getting there` carried nine
   source-attribution constructions besides. After the rewrite **eight
   attributions remain in the whole file**, two of them in `Getting there`, and
   each survives because the claim under it is a characterization, a
   quotation, or a self-reported or decaying figure — never a plain direction:

   | # | Where | Why it survives |
   | --- | --- | --- |
   | 1 | `Getting there` — the Zoo's untied "2 or 5 to West Farms Square–East Tremont, East 180th Street or Pelham Parkway" | The verifier ruled this enumeration must stay flagged as unresolved rather than presented as settled. Stating it flatly would claim a gate tie the source does not make. |
   | 2 | `Getting there` — the ferry sentence | A page-level negative. "No ferry serves Bronx Park" would be a claim about the world; what is confirmed is that neither official page names a landing. |
   | 3 | NYBG summary — "on a 2016 figure" | A vintage qualifier on a decaying number, not a source preamble. Without it the visitor count reads as current. |
   | 4 | NYBG history — the 2002 *New York Times* "75 percent / 70 percent" line | A direct quotation; attribution is required by construction. |
   | 5 | Zoo history — World of Darkness as "the world's first major exhibit designed specifically for nocturnal animals" | An unverifiable superlative. §15 requires the source to be named or the claim dropped. |
   | 6 | Snuff Mill summary — "the oldest existing tobacco manufacturing building in the United States" | Same. Confirmed as the article's own claim, so it ships attributed — but **once**, not twice; the trailing "which is that article's characterization" is cut. |
   | 7 | Bronx River Forest summary — "a remnant of the original forests and floodplains" | A characterization by the managing organization, not a measurement. |
   | 8 | Bronx River Forest history — "more than a hundred partner organizations" | An organization's self-reported count of itself. |

   The verdict
   on the Forever Wild / Thain Family Forest / Bronx River Forest relationship
   is "do not merge or imply a relationship", and the way that is honoured is
   silence: the three are described separately and no sentence anywhere in the
   file discusses whether they relate. Saying so in prose would have added
   another research-process sentence for no reader benefit.
3. **Verdict decides the name, slug follows:** `bronx-park`,
   `new-york-botanical-garden`, `bronx-zoo`, `lorillard-snuff-mill`,
   `bronx-river-forest`. The two marquee slugs match the gate's front-anchored
   patterns. All five verified globally unique.
4. **No minimum word count** was applied to any field but the intro's 90.

## Marquee rule

Confirmed by grep over `priv/seed_data/` and
`lib/ethos/seeds/connecticut_places.ex` and by running the gate's own
`marquee_occurrences/2` walk with the shipped patterns: the New York Botanical
Garden and the Bronx Zoo each appear as a place in **exactly one** file, this
one. Belmont mentions both only inside `links[].note` prose, which is not a
place record.

## Place kinds and addresses

| Place | `kind` | `address` |
| --- | --- | --- |
| Bronx Park | `park` | boundary list (no house number) |
| New York Botanical Garden | `park` | "Southern Boulevard and Bedford Park Boulevard" — the NRHP-sourced intersection |
| Bronx Zoo | `attraction` | "2300 Southern Boulevard, Bronx, NY 10460" |
| Lorillard Snuff Mill | `historic-site` | "Snuff Mill Road, New York Botanical Garden, Bronx, NY" |
| Bronx River Forest | `park` | `null` — no acreage, boundary or street is sourced |

`park` for the Botanical Garden follows `brooklyn-botanic-garden` in
`prospect-heights.json`. There is no `zoo` in the closed set, so the Bronx Zoo
is `attraction`.

## Census

`test/ethos_web/components/structured_data_test.exs` moved by four rows, not
five: Bronx River Forest ships `"address": null` and the setup rejects nil
addresses, so it never reaches the emitter.

| Assertion | Before | After |
| --- | --- | --- |
| `length(emitted)` | 2113 | **2117** |
| `streetAddress` | 1575 | **1576** |
| `is_nil(streetAddress)` | 538 | **541** |
| `postalCode` | 1712 | **1713** |
| locality-only | 248 | **251** |

Each digit is accounted for in the test's own comment, following the corrected
pattern: `streetAddress` +1 with `is_nil(streetAddress)` +3 proves exactly one
of the four carries a house number (the zoo's 2300 Southern Boulevard) and the
other three went to the street-less bucket; `postalCode` +1 proves the ZIP
(10460) and nothing else does; locality-only +3 proves neither half, and is
the check that the street-less rows landed where they should.

## One test precondition changed, and why it is not a weakened gate

`test/ethos/release_test.exs`'s `seed_bronx/1` test seeded Manhattan only.
`Ethos.Links.resolve!/1` raises on an unknown target and aborts the whole link
pass, so the new `place:new-york-aquarium` edge — defined in
`priv/seed_data/brooklyn/coney-island.json` — made it fail. The fix is
`Ethos.Release.seed_brooklyn(user.email)` added in runbook order, which is
exactly what that test's own comment anticipated ("If a wave authors an edge to
a Brooklyn guide, seed_brooklyn/1 belongs here too") and what the production
runbook already does. No assertion was relaxed; the guide count still filters
on `county == "Bronx"`, so the extra seed calls cannot inflate it.

## Validation

- `mix format --check-formatted` — clean.
- `mix test` — **650 tests, 0 failures, 32 excluded**, matching baseline.
- Only tolerated warning observed: `lib/ethos_web/gettext.ex:23`.
- No `@trip_duration_allowlist` or `@proximity_allowlist` entry was added, and
  no pattern was touched.
