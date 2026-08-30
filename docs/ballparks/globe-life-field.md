# Globe Life Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/globe_life_field_places.ex` and
`lib/ethos/seeds/globe_life_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Texas Rangers research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/texas-rangers.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship — and a clause the verifier's own text
expressly states was confirmed is an adjudication of that clause and ships too.

**6 places and 1 guide shipped** from 6 researched places. **No place was
dropped. No verdict in this artifact is refuted.**

---

## 0. The confirmation rate, and why it is not a clean pass

A fully confirmed artifact is a warning sign on principle, and the verifier
addresses it directly rather than leaving it to be taken on trust:

> This batch confirms at a much higher rate than the corpus's
> Brooklyn/Connecticut place research, and that is worth explaining rather than
> treating as a clean pass. Every source here is either a major-venue Wikipedia
> infobox (subject to heavy editorial scrutiny, unlike a small local business's
> page) or an operator's own site used only for the categories rule 4 explicitly
> allows an operator's own site to establish (existence, services, address)
> rather than for trading status or superlatives. I independently refetched
> every cited URL myself rather than trusting the finder's paraphrase, including
> the single highest-risk sentence in the file … at the verbatim level, and it
> held up.

Two things follow that this site publishes rather than smooths over: **one real
source-internal discrepancy** (AT&T Stadium's construction cost, §1), and **one
place correctly left uncertain** (Texas Live!, §1).

---

## Identity and the county

| Field | Value | Verdict |
|---|---|---|
| venue | Globe Life Field | confirmed twice, and the verifier adds that there is *"[n]o sign of a more recent rename; the venue's own live website (globelifefield.com) also still uses this name and branding."* |
| city | Arlington | confirmed |
| state | Texas | confirmed |
| county | **Tarrant County** | *"Arlington is described as 'a city in Tarrant County, Texas, United States' …"* — confirmed, cited to `https://en.wikipedia.org/wiki/Arlington,_Texas`. |

**The county citation was checked, per the standing ruling.** The verifier's
reason quotes the article back: *"Arlington is located in Tarrant County,
Texas"*, and rules on the form as well as the fact — *"Tarrant County is an
ordinary US county administering the address; no independent-city or
borough-style exception applies here, so the county rule's default case
governs."* The plain `"<Name> County"` form ships.

**The venue name was taken from the verdict**, which matters in this set even
where nothing has changed: the sponsorship-rename hazard is live across the
batch, and here the verifier checked for a more recent rename and found none.
The *predecessor* venue is a live rename and is published as one — Globe Life
Park became Choctaw Stadium on August 25, 2021.

---

## 1. Places, against the verdicts they rest on

**Addresses ship only where a verdict or the verifier's own text carries one.**
Three do: Globe Life Field's (confirmed against the infobox), Texas Live!'s
(inside the confirmed verdict's own item), and the Loews Arlington Hotel's
(from the operator's own site, with the verifier's `could_not_establish` noting
that no independent source for it was found — which is published beside it).
**Three do not** — Choctaw Stadium's, AT&T Stadium's and Esports Stadium
Arlington's — and each record says so.

**Two of these places are stadiums and neither carries `kind: "stadium"`.** In
the ballparks region that kind is the set's roster key, asserted by
`test/ethos/seeds/ballpark_seed_data_test.exs` to be exactly the thirty rostered
MLB venues, so Choctaw Stadium and Esports Stadium Arlington carry `attraction`.
A schema constraint, not a claim: the prose calls both what they are.

### globe-life-field — Globe Life Field (`stadium`)

`734 Stadium Drive, Arlington, Texas` · `https://www.globelifefield.com/`

Two confirmed place verdicts, four confirmed identity verdicts and six
confirmed `history` items, all published: the 2020 opening replacing Globe Life
Park; the retractable roof and artificial turf; the $1.1 billion cost; the HKS,
Inc. and VLK Architects design credit; the May 29, 2020 first event and the July
24, 2020 first regular-season game; the former-parking-lot site, the 2016
announcement, the September 2017 groundbreaking and the December 2019
construction roof fire; the 2020 World Series, the first two games of the 2023
World Series and the 2024 All-Star Game; the franchise's 1961 founding as the
Washington Senators, its Griffith Stadium and RFK Stadium years, the 10-2 vote
of September 21, 1971, and the Arlington Stadium and Ballpark in Arlington eras;
and the 2023 World Series win over the Diamondbacks, the three pennants and the
seven division titles.

**No architectural style is published**, on an explicit `could_not_establish`:
*"Any stated architectural style term for the building."* The corpus's rule is
that a style ships **only** where a verdict states one, and here none does. The
architects ship, because a verdict names them.

**No per-game parking price**, on the other `could_not_establish`.

`status_verdict: confirmed` open, on independent evidence — the hosting record
through 2024 and the venue's own live site still operating under the name.

### choctaw-stadium — Choctaw Stadium (`attraction`)

`address: nil` · `official_url: nil`

Three confirmed verdicts, published in full: the tenancy from 1994 to 2019 under
two earlier names and the August 25, 2021 rename; the current multi-purpose use
across XFL/UFL football, North Texas SC soccer through 2025, Dallas Jackals
rugby until 2024 and high school sports; and the siting of Globe Life Field on
its former surface parking lot.

**Two sponsor names the research compressed past are restored**, on the
verifier's own note: *"the venue in fact carried two more interim sponsor names
between these two ('Ameriquest Field in Arlington', 2005-2006, and 'Rangers
Ballpark in Arlington', 2007-2013) that the item's 'and then' compresses past.
That omission does not make anything the item states false."* Published as the
verifier states them.

**The spatial claim ships, and the verifier ruled on it directly:** *"This is a
sourced site-history statement, not a proximity/walking-distance claim about
visiting the two venues, so it does not run afoul of the vague-proximity ban."*
It is also phrased to name the stadium rather than "the ballpark", so it does
not read as the generic form the corpus's gate catches.

**A dated limit is published rather than dropped.** `could_not_establish`:
*"Which, if any, tenants occupy the venue for the 2026 season specifically — the
source's tenant list is dated to 2024-2025."* The verifier separately notes that
North Texas SC is described as scheduled to leave in 2026, and that this *"bears
on which events it hosts, not on whether the venue itself is operating"*. The
record states the dating limit and claims no 2026 tenant.

`status_verdict: confirmed` open, on the source describing a continuing
multi-purpose venue.

### att-stadium — AT&T Stadium (`attraction`)

`address: nil` · `https://www.attstadium.com/`

Three confirmed verdicts, published in full: the Cowboys' tenancy, the HKS
design with Bryan Trubey as lead architect, the May 27, 2009 public opening and
the September 2005 groundbreaking; the 80,000 capacity expandable beyond
100,000 and the 70,649 configuration for the 2026 FIFA World Cup; and the tour
types and contemporary art collection on the stadium's own site.

**The construction cost is published as a source-internal disagreement**, on the
verifier's flag: *"the same article's prose separately states the actual
construction cost 'rose to $1.15 billion' ($650 million was the original
estimate) — the cited article is internally inconsistent between its infobox and
its body text … A more careful sentence would note both figures exist in the
source."* Both figures are published and neither is preferred.

**A superlative on the operator's own site is excluded**, and the verifier
records both that it exists and that the finder was right to leave it out:
*"Separately confirmed the operator's own page does carry a 'world's largest
domed structure' superlative, which the finder correctly excluded rather than
publishing."* It appears nowhere here. **Tour prices** are likewise absent, on a
`could_not_establish`.

**The operator's own site is used for what an operator's site may establish** —
what the venue offers — and the verifier says so in terms.

`status_verdict: confirmed` open.

### texas-live — Texas Live! (`attraction`)

`1650 E. Randol Mill Road, Arlington, Texas 76011` · `https://texas-live.com/`

One confirmed verdict, published in full: the complex, its address and the
venues its own site lists. The verifier explains why an operator-only source
still confirms this one: *"Rated confirmed rather than uncertain because the
claim is limited to existence, address and what it offers — exactly the class of
fact rule 4 says an operator's own site is sufficient to establish."*

**`status_verdict: uncertain`, and no trading claim is made.** The verifier tried
an independent route and reports the result: *"I independently tried a plausible
route to third-party corroboration (a Wikipedia article on 'Texas Live!') and it
resolved to a bare redirect with no content on the complex. No positive evidence
of closure exists either."* The record and the guide both say this.

**A ranking on the operator's own site is excluded**, on its own
`could_not_establish`: *"A 'Best Entertainment District in the DFW' claim appears
on the operator's own site and is not carried into the record — a business's own
site cannot establish an award or ranking."*

### loews-arlington-hotel — Loews Arlington Hotel (`hotel`)

`888 Nolan Ryan Expressway, Arlington, Texas 76011` · `https://www.loewshotels.com/arlington-hotel`

Three confirmed verdicts, published in full: the connection to the Arlington
Convention Center and the sky bridge to the 300-room Live! by Loews Arlington
Hotel, from the hotel's own site and matched exactly by the verifier; the
corporate property listing carrying both hotels as current United States
properties, distinct from a future Americana by Loews; and Globe Life Field's
own article recording that development planning included *"a new shopping mall,
a Loews Hotel, and a ballpark village"*, quoted verbatim.

**The address is published with its limit named.** `could_not_establish`: *"An
independent (non-operator) source for the exact street address; the address
comes from the hotel's own site only."* An operator's own site may establish its
own address; the record says that is where this one comes from. **No opening
date** is published, on the second `could_not_establish`.

`status_verdict: confirmed` open, on third-party evidence — and the verifier
notes why the corporate listing counts: the current-versus-future distinction is
*"a meaningful distinction the source draws rather than an inference."*

### esports-stadium-arlington — Esports Stadium Arlington (`attraction`)

`address: nil` · `official_url: nil`

Two confirmed verdicts, published in full: the 100,000 square feet, the 2,500
seats, the convention-center and theater functions, and the venue's original
billing as the largest dedicated esports facility in North America; and OpTic
Gaming's operation since January 2022 with the expansion into wrestling and
other entertainment.

**The superlative ships with its own hedging intact**, and the verifier
specifically approves the framing: *"The source states this as a historical
superlative about the venue at opening ('originally was the largest…'); the
item's 'billed as' framing is, if anything, more cautious than the source, not
an inflation of it."*

**No spatial relationship to the ballpark is published**, on an explicit
`could_not_establish`: *"Its precise distance or bordering relationship to Globe
Life Field — the source situates it in the same entertainment district by
address only, not by a stated distance or adjacency."* The guide says that in
terms rather than leaving the omission to be noticed.

`status_verdict: confirmed` open, on a named current operator and a dated 2024
event roster.

---

## 2. The guide

`slug: globe-life-field-guide` · `destination: "Arlington, Texas"` ·
`state: "Texas"` · `county: "Tarrant County"`

### Getting there

All five `getting_there` items are confirmed and all five ship: the parking tax
of up to $3 in the ballpark's financing; the ballpark's own parking policies —
cashless lots, advance purchase through the app, online or at the lot entrance,
a strict no in-and-out rule with no refunds, and no published price; the Trinity
Railway Express's five, two and three stops in Fort Worth, Irving and Dallas
with no station in Arlington; Arlington's decades without a public transport
system and Via Arlington's December 2017 launch as an on-demand shared-ride van
service; and the Metro Arlington Xpress pilot, its route, its August 2013 start
and its December 29, 2017 shutdown.

**The one superlative in "Getting there" was checked verbatim by the verifier**,
who calls it *"the single highest-risk sentence in the file — a flat
superlative"* and quotes the article word for word. It ships as the source's own
description.

**MAX is published as defunct on purpose.** The verifier notes the source
*"unambiguously describe[s] [it] as no longer running"*, and the guide names it
only so that it is not mistaken for a current option.

**No station, garage or lot becomes a place record.**

### Around the ballpark

Every published address is a place record's own. **One spatial claim ships** —
the site-history relationship between the two ballparks, ruled publishable by
the verifier — and **one is expressly withheld**, the relationship between the
esports venue and the ballpark, on its own `could_not_establish`.

### The ballpark and the team

Restates the confirmed `history` items and identity verdicts.

### FAQ

Five questions. Three state a limit: the absent rail service, the absent parking
price, and Texas Live!'s unconfirmed operation.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to it here; no confirmed verdict in this artifact states one.
* **No vague proximity.** The one spatial claim published is a sourced
  site-history statement the verifier ruled on directly, and the one that was
  unavailable is named as unavailable.
* **Three superlatives ship, all inside confirmed verdict text**: Arlington as
  the largest US city without a public transportation system, Esports Stadium
  Arlington as originally billed the largest dedicated esports facility in North
  America, and Arlington as the second-largest city in Tarrant County. **Two do
  not**, both from operators' own sites and both recorded as excluded by the
  verifier: AT&T Stadium's world's-largest-domed-structure claim and Texas
  Live!'s best-in-region ranking.
* **No architectural style for Globe Life Field**, because no source states one.
* **No street address for three of the six places**, because no verdict carries
  one.
* **No prices** — not for parking per game, not for stadium tours, not for
  esports admission — because no source reached publishes any.
* **No trading claim for Texas Live!**, with the reason named in the record, in
  the guide prose and in an FAQ answer.
* **No 2026 tenant list for Choctaw Stadium**, because the source's list is
  dated 2024-2025.
