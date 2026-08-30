# Rogers Centre — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/rogers_centre_places.ex`
and `lib/ethos/seeds/rogers_centre_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 Toronto Blue Jays research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/toronto-blue-jays.json`,
`verified: true`). Web search was exhausted before the first query in both the
research and the verification pass, and **eight vendor domains blocked or failed
every fetch** — rogerscentre.com, marriott.com, tripadvisor.com, thestar.com,
greenp.com, filetofsole.ca, looseemoosetaphouse.com and playrec.com. Toronto's
open-data portal was tried as the block-by-block discovery substitute and its
DineSafe dataset returned as "Retired". Discovery therefore ran on encyclopedic
cross-linking.

**10 places and 1 guide shipped** from 10 researched places.

---

## Identity, and the set's one non-US site

| Field | Value | Verdict |
|---|---|---|
| venue | Rogers Centre | *"Rogers Centre is the current name of the ballpark (originally SkyDome from 1989 to 2005); the Toronto Blue Jays of Major League Baseball are its primary tenant."* — confirmed, and corroborated by a second confirmed verdict on an independent third source |
| city | Toronto | *"The stadium's street address is 1 Blue Jays Way, in downtown Toronto, Ontario."* — confirmed |
| state | **Ontario** | *"Ontario is a Canadian province, not a U.S. state; Toronto is Ontario's provincial capital."* — confirmed |
| county | **Toronto** | *"Toronto is a single-tier municipality in Ontario, Canada, and is not part of any county."* — confirmed |

`state` carries a province because it is the corpus's field for the first-level
subdivision, not because Ontario is a state; the verdict saying so is published
in the guide's closing section. `county` carries the city's own name for the
same reason St. Louis and Baltimore City do in this wave — a hub the guide and
its ten places can share.

---

## 1. Places, against the verdicts they rest on

### rogers-centre — Rogers Centre (`stadium`) · `official_url: nil`

Confirmed and published: 1 Blue Jays Way, downtown Toronto, west of the CN
Tower; home of the Blue Jays since it opened; Rogers Communications ownership
and Rogers Stadium Limited Partnership operation; capacity 39,150 after the
2023-2024 renovation; the retractable roof as a notable original feature, its
345,000 square feet and its cold-weather restriction; groundbreaking October 3,
1986; $570 million construction, about $1.25 billion in 2025 dollars; the 2005
renaming and the $25 million purchase; the $400 million two-phase Populous
renovation and the capacity sequence 50,516 (1989-1998) to 41,500 to 39,150; the
Marriott within the stadium.

**No `official_url`.** rogerscentre.com was unreachable to the research tool,
and no verdict establishes any other domain as the venue's own page.

**The roof's operating interval is not published.** The confirmed verdict gives
it in minutes. Every duration-shaped string is banned corpus-wide, and — as at
Wrigley with Southport Grocery's closing interval and at Dodger Stadium with the
Express headways — the clause is dropped rather than the allowlist widened.
Because the ban is enforced by a scan over module **source**, the moduledocs
describe this omission instead of quoting it.

**Two opening dates, both published.** History verdict #3 confirms June 3, 1989
from Wikipedia; verdict #4 confirms that a separate source gives June 5, 1989.
Both are confirmed as what their source says, so both ship and neither is
preferred — the Wrigley goat-ejection ruling in another costume.

### cn-tower — CN Tower (`attraction`) · `official_url: nil`

Three confirmed verdicts, published whole: completion 1976 and public opening
June 26, 1976; CA$63 million; the 32-year record from 1975 to 2007 as the
world's tallest free-standing structure, and the standing claim as the tallest
free-standing structure on land in North America; The Top at 446.5 m, Main at
346 m, Lower with glass floor at 342 m; the revolving restaurant, gift shop and
EdgeWalk.

Both superlatives are inside confirmed verdict text and therefore ship.

**`status_verdict: uncertain`** — Wikipedia's statement that the tower is open is
*"a general encyclopedia claim rather than a dated operator statement"*, and
cntower.ca was not fetched. No trading claim, and no admission pricing.

### ripleys-aquarium-of-canada — Ripley's Aquarium of Canada (`attraction`) · `official_url: nil`

Both verdicts confirmed. Verdict #1 carries a correction that sharpens its
spatial claim, and the correction's wording is what ships: *"The aquarium sits
just southeast of the CN Tower and east of Rogers Centre in downtown Toronto,
and is accessible from Union Station via the SkyWalk."* The finder's vaguer
"sits near the CN Tower … in an area that also includes Rogers Centre" does not
appear.

That is the proximity rule doing what it is for: the checkable form replaces the
gesture, rather than both being deleted.

### steam-whistle-brewing — Steam Whistle Brewing (`brewery`)

Four confirmed verdicts, published whole: the 2000 founding by Greg Cromwell,
Greg Taylor and Cam Heaps after being laid off by Upper Canada Brewing; Bays 1
to 14 of the 1929 John Street Roundhouse; the working roof whistle sounding
daily at end of workday; the February 2022 Beau's acquisition; the address,
tours, retail shop and listed hours from its own site. `status_verdict:
confirmed`, on the third-party Beau's acquisition rather than on the brewery's
own word.

### toronto-railway-museum — Toronto Railway Museum (`museum`) · `official_url: nil`

Three confirmed verdicts, published whole: opening May 28, 2010; year-round
operation; about two-thirds of the roundhouse; five full-sized locomotives,
passenger and freight cars, a diesel cab simulator; Don Station of 1896 as the
ticket office, Signal Cabin D, the watchman's shanty, the water tower and the
coaling tower; the warm-months miniature railway.

`official_url` is nil — torontorailwaymuseum.com returned HTTP 403 — and
`could_not_establish` records that current pricing and hours could not be
checked. Both stated in the record.

### the-rec-room-roundhouse — The Rec Room (Roundhouse Park) (`attraction`) · `official_url: nil`

Verdicts #0 and #2 confirmed and published: the June 2017 opening alongside a
West Edmonton Mall location, and its status as the roundhouse's third tenant, a
Cineplex entertainment complex, alongside Steam Whistle and the railway museum.

**Verdict #1 is `uncertain` and does not ship**: The Void virtual-reality
attraction, and the general Rec Room mix of arcades, bowling, darts,
restaurants, bars and cinema-style event space. The record says outright that
what this location contains could not be confirmed.

`status_verdict` was **upgraded** from the finder's `uncertain` to `confirmed`
on evidence the finder did not surface — a fresh fetch listing ten currently
operating Rec Room locations including Roundhouse Park. Verification improving a
record rather than only cutting it is worth recording.

### real-sports-bar-and-grill — Real Sports Bar & Grill (`restaurant`)

Three confirmed verdicts, published whole: 15 York Street Unit A; multiple large
screens, full food menu, golf simulator, private dining for groups of 13 or
more; the MLSE connection shown by the site's job postings and system
integration; hours Monday to Saturday 11:30 AM to 12:00 AM and Sunday 11:30 AM
to 11:00 PM.

**`status_verdict: uncertain`** — everything comes from the business's own site,
which cannot establish that it is still trading. No trading claim, and no
founding date.

### fort-york-national-historic-site — Fort York National Historic Site (`historic-site`) · `official_url: nil`

Five confirmed verdicts, published whole: the 1793 establishment by 100 Queen's
Rangers around Garrison Creek; destruction in the Battle of York in April 1813
and rebuilding to about 1815; museum conversion from 1932 and formal reopening
on Victoria Day 1934; the year-round grounds, including Garrison Common and the
military cemeteries, against museum hours for the buildings; and **"about 900 m
inland of the original waterfront by the 1920s"** after land reclamation from
1850 — a sourced distance, published as the source gives it.

`could_not_establish`: current pricing and 2026 hours. Stated.

### toronto-marriott-city-centre-hotel — Toronto Marriott City Centre Hotel (`hotel`) · `official_url: nil`

Both verdicts confirmed: the 348 rooms with 70 overlooking the field; the
current Marriott City Centre name; the Sportsnet Grill overlooking the field;
the 1999 sale to Renaissance for a reported $31 million and the former
Renaissance Toronto Downtown branding.

**Why the address is "Within Rogers Centre".** `could_not_establish`: *"a street
address independently sourced from the hotel operator (the address here is
inferred from the Wikipedia statement that the hotel is 'within Rogers
Centre')."* The record publishes the sourced description and says plainly that
it is a description rather than a street address. The name is established by a
confirmed verdict, so the identity rule does not block publication.

**The room count carries its own caveat**, per the second
`could_not_establish`: the 2023-2024 renovation may have changed it and no more
recent figure was reachable.

**`status_verdict: uncertain`** — marriott.com returned HTTP 403 on three
different paths with an eight-hour retry-after, and TripAdvisor and Expedia were
blocked too. No trading claim.

### wheat-sheaf-tavern — The Wheat Sheaf Tavern (`restaurant`)

Verdicts #0 and #1 confirmed: the 1849 building date from Wikipedia's list of
the oldest buildings and structures in Toronto, the 667 King Street West address
in the Niagara neighbourhood of Old Toronto, and the site's listed hours.
Verdict #2, the Lambton House cross-reference, is `uncertain` and does not ship.

**"Toronto's Oldest Bar" is not published.** Verdict #1 confirms that the
tavern's own site *headlines itself* that way; it does not confirm the claim.
Publishing the phrase would put an unsourced superlative in reader-facing prose,
which is the ruling that kept Sluggers' self-superlatives out of the Wrigley
checkpoint. The 1849 date, which a third-party list carries, is the substance
and it ships.

**`status_verdict: uncertain`, and the reason is specific.** The artifact's note
records a Wikipedia search snippet referencing a headline, *"Regulars worry as
Toronto's oldest bar, the Wheat Sheaf, closes for renovations"*, whose
underlying article could not be reached to establish a date or a reopening.

**This site does not publish that closure**, because an untraceable snippet is
not evidence a business has shut — and it does not publish that the tavern is
open either. What it publishes is the question: whether the tavern is trading
now could not be established, and a reference to a renovation-closure headline
could not be traced to a reachable article. The second `could_not_establish` is
also published: whether the tavern has operated continuously since 1849, or
under that name throughout, is unestablished.

---

## 2. The guide

`slug: rogers-centre-guide` · `destination: "Toronto, Ontario"` ·
`state: "Ontario"` · `county: "Toronto"`

### Getting there — and the SkyWalk refutation

| Published | Verdict |
|---|---|
| Union subway station on TTC Line 1 Yonge-University | confirmed, verbatim |
| Union Station as the hub for seven named GO lines, VIA Rail, and the Union Pearson Express from June 6, 2015 | confirmed, verbatim |
| streetcar routes 509 Harbourfront and 510 Spadina boardable underground | confirmed, verbatim |
| **the SkyWalk, approximately 160 metres, connecting Union Station to the CN Tower and Rogers Centre** | **refuted**. The finder wrote "approximately 500 metres (1,600 ft) long"; the correction, checked against the dedicated SkyWalk article, gives approximately 160 metres. |
| the under-stadium lot in four sections — Sun, Moon, Star, Cloud — plus a Hotel Zone, and no published rate | confirmed, verbatim |

The verifier's note flags the SkyWalk error as the point of the exercise: *"Two
items were refuted by re-fetching the finder's own cited source and finding a
different figure than the one asserted — the same failure class the authoring
contract calls out as the reason adversarial verification exists."*

### The roundhouse heritage refutation

History verdict #8 is **refuted**. The finder wrote that the John Street
Roundhouse "was also protected under Ontario's Heritage Act and made part of the
Union Station Heritage Conservation District in 2008." The correction:
designation under **Part V** of the Heritage Act as part of that district by
**by-law 634-2006, passed July 27, 2006**, with a separate heritage easement
agreement registered in 2008. The corrected form ships, in the guide section and
in an FAQ answer.

### What is `uncertain` and therefore absent

History verdict #2 — the 2020 and 2021 seasons at Sahlen Field in Buffalo and TD
Ballpark in Dunedin, and the July 30, 2021 return to Toronto — is `uncertain`.
It is well known and would have been easy to write. It does not appear.

---

## 3. What is absent from the whole site

* **The roof's operating interval**, per the duration ban.
* **The SkyWalk at 500 metres** — refuted; 160 metres ships.
* **The roundhouse's 2008 designation date** — refuted; the 2006 by-law ships.
* **The 2020-2021 Buffalo and Dunedin seasons** — `uncertain`.
* **The Rec Room's amenities** — `uncertain`.
* **"Toronto's Oldest Bar"** — a self-description a verdict reports but does not
  confirm.
* **No trading claim** for the CN Tower, Real Sports, the Marriott or the Wheat
  Sheaf — and **no closure claim** for the Wheat Sheaf either.
* **Six `official_url: nil` records**, each because the domain blocked or failed
  every fetch.
