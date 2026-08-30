# Oracle Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/oracle_park_places.ex`
and `lib/ethos/seeds/oracle_park_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 San Francisco Giants research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/san-francisco-giants.json`,
`verified: true`). The verifier re-fetched every cited Wikipedia article, the
Port of San Francisco parking page, four business sites and six open-data
registry queries. Of roughly 58 items, **three came back `uncertain` and none
was flatly refuted**.

**7 places and 1 guide shipped** from 7 researched places.

---

## Identity and county

| Field | Value | Verdict |
|---|---|---|
| venue | Oracle Park | *"The venue's current name is Oracle Park, with naming history Pacific Bell Park (2000-2003), SBC Park (2004-2005), AT&T Park (2006-2018), Oracle Park (from January 10, 2019)."* — confirmed, and corroborated by a second confirmed verdict on the team's own article |
| city | San Francisco | *"Oracle Park is the home ballpark of the San Francisco Giants … at 24 Willie Mays Plaza, San Francisco, California."* — confirmed |
| state | California | as above |
| county | **San Francisco** | *"San Francisco is a consolidated city-county with no separate county government; became one in 1856."* — confirmed, plus *"The ballpark is 'located in San Francisco County.'"* — confirmed |

`"San Francisco"`, not `"San Francisco County"`. The artifact's own identity
summary names the reason: this is the independent-city case, parallel to St.
Louis and Baltimore City in this same wave, and the county shares the city's
name and government.

**One identity verdict is `uncertain` and does not ship as written.** The finder
cited registry rows for "Giants Marketing Group" and "Giants Dugout" at the
address; neither reproduced on independent re-fetch. The correction supplies a
substitute that did: *"Cite 'San Francisco Giants Baseball Club LLC' (active
since 2016-01-01, no end date) at 24 Willie Mays Plaza instead — independently
reproduced."* That is what the ballpark record carries.

---

## 1. Places, against the verdicts they rest on

### oracle-park — Oracle Park (`stadium`) · `official_url: nil`

`24 Willie Mays Plaza, San Francisco, CA 94107`

Confirmed and published: the address and club; opening March 31, 2000;
groundbreaking December 11, 1997; HOK Sport, now Populous; $357 million, about
$667 million in 2025 dollars; the first MLB ballpark built without public funds
since Dodger Stadium in 1962, **with the $10 million tax abatement and $80
million infrastructure caveat the verdict carries**; the four names and their
dates; capacity 41,331 as of 2021; the 2007 All-Star Game; LEED Silver in April
2010; Bonds's 756th on August 7, 2007; Sanchez's no-hitter July 10, 2009; the
24-foot right-field wall for Mays and the 309-foot foul pole; the Mays statue
and 24 palm trees; the McCovey, Marichal, Cepeda and Perry statues with their
dates and locations; McCovey Cove and the splash-hit count as of August 16,
2026; South Beach, China Basin.

**Not published: an architectural style, and the artifact says why.**
`history_could_not_establish` reads: *"Any architectural style attributed to the
ballpark by a source. Wikipedia names the architecture firm (HOK Sport /
Populous) but no fetch surfaced a style term (e.g. 'jewel-box') applied to
Oracle Park the way one is applied to Wrigley Field. Do NOT supply a style."*
The verifier's note: *"Independently checked … Correctly withheld."*

This is the rule cutting the other way from Wrigley, where a refuted verdict's
correction *authorised* the jewel-box wording. Style ships when a verdict states
one and never otherwise, and both records say which case they are.

**No `official_url`.** mlb.com and every mlb.com/giants page returned HTTP 406.

**Not published:** the 2026 schedule, ticket or tour prices; any sponsorship
renaming after January 2019. All three named as unestablished in the artifact.

### reds-java-house — Red's Java House (`restaurant`)

`30 Pier, San Francisco, CA 94105`

Confirmed and published: the waterfront diner format and the menu, including the
burgers on San Francisco sourdough with onions, pickles and yellow mustard; the
registry history — Red's Java House at Pier 30 from November 1, 2010 to June 30,
2016, then Red's Java House Inc from July 1, 2016 with no end date.

**The 1955 date is published as the business's own statement.**
`could_not_establish`: *"1955 as a verified founding date from any source other
than the business's own site — per the contract, a business's own site cannot
establish that a historical claim is accurate, only that the business states
it."* The history field says so in those terms.

**The ZIP disagreement is published.** `could_not_establish`: *"the business
registry gives 94133 for the current registration and 94105 for the prior one at
the same Pier 30 address; the business's own site gives 94105. This is a genuine
discrepancy across sources, not a typo I can resolve."* The `address` field
carries 94105, the two-source majority and the business's own; the summary
states the other.

### momos-san-francisco — MoMo's (`restaurant`)

`760 2nd St, San Francisco, CA 94107`

Verdict #0 confirmed: an American bar and grill at that address, from its own
site. Verdict #1 — the registry row — is **`uncertain`**, with the correction
*"Do not cite this specific registry row as confirmed third-party evidence
unless it can be reproduced."* `still_trading` is downgraded to `uncertain` on
the same grounds.

**No trading claim.** The `status_verdict` states the principle this wave
follows throughout: *"Correctly does not block publication under the
site-builder contract, but must not be asserted as open; address and existence
remain confirmed via the business's own site."* Uncertain trading does not block
publication; uncertain identity would.

**Not published: "one of San Francisco's landmark dining destinations."** The
artifact flags it: *"a self-superlative its own site cannot establish and must
not be published."*

### flour-and-water-pizza-shop-mission-rock — Flour + Water Pizza Shop (`restaurant`)

`1090 Dr Maya Angelou Lane, Suite A, San Francisco, CA 94158`

Three confirmed verdicts, published: the wood-fired pizza operation and the
group's flagship handmade pastas and Neapolitan-style pizzas; the registry entry
from February 25, 2025 with no end date; the Mission Rock location, "across
McCovey Cove from Oracle Park".

**The name disagreement is published.** `could_not_establish`: the registry says
"Flour + Water Pizza Shop", the Mission Rock article says "Flour + Water
Pizzeria", and which is the current public-facing name could not be resolved.

**Why this still ships.** The identity rule blocks a place whose name is
*unestablished*; here two sources each establish a name and disagree about which
is current. The register is the name of record — the ruling applied at Wrigley
when only the City of Chicago licence register carried a name — so the
registry's form becomes the `name` and the `slug`, and the summary states the
other.

### arsicault-bakery-mission-rock — Arsicault Bakery (`cafe`)

Three confirmed verdicts, published: the self-description as "a French bakery
with a simple mission - Serve the food we love", quiches and baguettes; the
registry entry from July 10, 2024 with no end date and the three sibling
locations; Mission Rock, across McCovey Cove from Oracle Park.

**Not published: any award or ranking.** `could_not_establish` names it — none
were fetched from a third-party source, only the bakery's own self-description.
The record says so.

### blue-bottle-coffee-mission-rock — Blue Bottle Coffee (`cafe`) · `official_url: nil`

Two confirmed verdicts and nothing else: the registry entry from August 5, 2025
with no end date, and the Mission Rock article's listing.
`could_not_establish`: the company's own site could not be reached, so what this
location serves beyond the coffee-shop format is unpublished — and the record
says that rather than assuming a menu from the brand.

### china-basin-park — China Basin Park (`park`) · `official_url: nil`

Four confirmed verdicts, published: five acres at the mouth of Mission Creek in
Mission Bay, across from Oracle Park; opened to the public before the Giants'
home opener on April 5, 2024, official grand opening April 25; the hilly lawn,
dog run, artificial beach, amphitheater seating, Willie McCovey statue and the
Bay Trail section; fifteen years of planning alongside Mission Rock; Port of San
Francisco jurisdiction rather than Recreation and Parks.

`address` is descriptive, because `could_not_establish` records that no precise
street address was found and the Port's site could not be reached for one.

---

## 2. The guide

`slug: oracle-park-guide` · `destination: "San Francisco, California"` ·
`state: "California"` · `county: "San Francisco"`

### Getting there — and the block count that was not carried

| Published | Verdict |
|---|---|
| 2nd and King station adjacent to the ballpark, opened 1998, a major hub from 2000 | confirmed, verbatim |
| N Judah serving it, Caltrain depot to Ocean Beach and the Great Highway, listed as serving Oracle Park | confirmed, verbatim |
| T Third Street rerouted away in January 2023 | confirmed, verbatim |
| **the two addresses and the King Street corridor** | confirmed — but with the correction *"If proximity must be stated, use the two addresses (700 Fourth St at King St; 24 Willie Mays Plaza) or note both are reached via the King Street corridor, rather than a block count."* |
| Caltrain's extra game-day trains | confirmed, verbatim |
| Muni 15, 30, 45; N Bus, N Owl, T Bus, 91 Owl overnight | confirmed, verbatim |
| all three Bay Ferry Oracle Park routes and their terminals | three confirmed verdicts, verbatim |
| the ferry terminal outside the eastern edge and the pier behind center field | confirmed, verbatim |
| three separate parking findings, no price | confirmed, verbatim |

**The block count.** The source says the Caltrain station is one block from the
ballpark, and the verdict confirming it still carries a correction against
publishing it that way. The verifier's summary repeats the caution: a sourced
block count *"reads as the same defect the hard rule bans in directional form;
it should not be carried into published prose verbatim."* Neither the place
records nor the guide contains it.

The verifier also ruled the other way on two constructions, and this site
follows that ruling: *"'Across McCovey Cove from' and 'adjacent to'
constructions were treated as permitted bordering/location descriptions, not
vague proximity, since they describe fixed geographic relationships to a named
landmark rather than an unmeasured walking nearness."*

**No parking price.** The verdict's own instruction is *"Do NOT publish a
parking cost from this batch."* The three findings behind it — MLB.com's 406,
SFMTA's non-resolving pages, the Port's metered-parking note and third-party
garage-finder link — are published instead.

### Around the ballpark

Grouped city-side and Mission Rock-side, with each source disagreement stated
where it belongs. The closing paragraph names the discovery method's blind spot:
the registry finds registered businesses and is blind to unregistered ones and
to press coverage, so this is not a complete inventory and does not claim to be.

### The ballpark and the team

Fourteen confirmed `history` verdicts. Three superlatives ship, all inside
confirmed verdict text: the first MLB ballpark without public funds since 1962
(with its caveat), the second National League team to win three championships in
five years, and the franchise's most wins and most Hall of Fame representatives.

---

## 3. What is absent from the whole site

* **No trip duration.**
* **No block count**, even a sourced one — see above.
* **No architectural style**, explicitly and on instruction.
* **No parking price**, explicitly and on instruction.
* **No trading claim for MoMo's**, and no claim of closure.
* **No self-superlative**: MoMo's "landmark dining destination" and any award
  for Arsicault are both absent, each named in the record as absent.
* **Two source disagreements published as disagreements**: Red's ZIP code and
  the Mission Rock pizza shop's public-facing name.
