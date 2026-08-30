# Comerica Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/comerica_park_places.ex` and
`lib/ethos/seeds/comerica_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Detroit Tigers research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/detroit-tigers.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**11 places and 1 guide shipped** from 11 researched places.

---

## Identity, the county field, and a name with a dated expiry

| Field | Value | Verdict |
|---|---|---|
| venue | Comerica Park | *"The ballpark's current name is Comerica Park. In December 1998 Comerica Bank secured the naming rights, agreeing to pay $66 million over 30 years; the agreement was extended in 2018 through 2034."* — confirmed |
| city | Detroit | *"Comerica Park's address is 2100 Woodward Avenue, Detroit, Michigan, Wayne County."* — confirmed |
| state | Michigan | as above |
| county | **Wayne County** | the same verdict, plus *"Detroit is the county seat of Wayne County"* — confirmed, cited to `en.wikipedia.org/wiki/Detroit`, which carries it. |

**The rebrand is published, not resolved.** A separate confirmed verdict reads:
*"Fifth Third Bank's acquisition of Comerica Bank (announced Oct 6 2025,
completed Feb 1 2026) means Comerica Park 'will be rebranded before the 2027
season' per the ballpark's own Wikipedia article; as of August 2026 the name is
still Comerica Park."* A sixth confirmed verdict corroborates the acquisition's
figures from the Fifth Third article and records that that article *"does not
itself discuss Comerica Park naming rights"* — so the rebrand claim rests on the
ballpark's article alone, and the record says which source carries it.

The current name is what ships, in the place record, the roster row and the
guide, with the pending change stated beside it. The ballpark's own
`could_not_establish` carries the same flag forward.

---

## 1. The one refutation: the tiger statues

The finder wrote *"eight heroic-sized tiger statues beyond the main gate"*.
Refuted, with the reason:

> Re-fetched … and asked it to quote every tiger-statue sentence verbatim. The
> source describes ONE 15-foot tiger statue at the main entrance, PLUS 8
> additional heroic-sized tiger statues located 'throughout the park, including
> two prowling on top of the scoreboard in left field' — not eight statues
> clustered 'beyond the main gate.' The item conflates the single entrance
> statue with the separate group of eight and misplaces two of them.

The correction's full text ships, including the Ty Cobb and Jackie Robinson
clauses, which the verifier confirmed as accurate within the same item. An FAQ
answer records the correction.

Worth noting for future waves: the error was caught by **asking the source to
quote itself verbatim rather than trusting a paraphrase**. The verifier's note
names that as the step whose omission produces false confirmations.

---

## 2. Two `uncertain` clauses inside otherwise confirmed sentences

Both are the governing rule applied inside a single sentence.

1. **Grand Circus Park's underground garage.** The verdict is `uncertain`:
   *"the Russell Alger Memorial Fountain and Henry Bacon as its designer are
   confirmed. The 1957 underground parking garage claim was not returned by this
   re-fetch at all and could not be independently checked … left uncertain for
   that specific clause rather than assumed confirmed by association with the
   rest of the sentence."* **Published:** the fountain and its architect. **Not
   published:** the garage. An FAQ answer states the gap.
2. **Grand Trunk Pub's building history.** The verdict is `uncertain`: the
   business's own site restates the 1905 ticket-station and Metropole Hotel
   history, but the likely independent corroborator returned a 404 and nothing
   else was reachable. *"[A] business's own site establishes that it exists,
   what it serves and its address, but not a history claim beyond that."*
   **Published:** what it is, what it serves, where it is. **Not published:**
   the history.

---

## 3. Places, against the verdicts they rest on

### comerica-park — Comerica Park (`stadium`)

`2100 Woodward Avenue, Detroit, MI 48201` · `https://www.mlb.com/tigers/ballpark`

Four confirmed place verdicts and five confirmed `history` items ship, plus the
tiger correction: the Tigers' home since 2000; the April 11, 2000 opening
against the Seattle Mariners; the $300 million cost; the address; Populous
(formerly HOK Sport), SHG Inc. and the Rockwell Group as architects; capacity
41,083 as of 2018; the 45,280 attendance record of July 26, 2008 against the
Chicago White Sox; the 342/412/330 field dimensions; the fountain's GM
sponsorship 2000-2008 and its return as the Chevrolet Fountain in 2010; and the
corrected tiger, Ty Cobb and Jackie Robinson text.

`status_verdict: confirmed` — an active MLB franchise's home venue, corroborated
independently.

### fox-theatre-detroit — Fox Theatre (`theater`)

`2211 Woodward Avenue, Detroit, MI 48201`

Four confirmed verdicts, published in full: the 1928 opening, C. Howard Crane's
Art Deco design blending Burmese, Indian, Persian, Chinese and Hindu motifs; the
NRHP listing of 1985, the National Historic Landmark designation of 1989 and the
Michigan State Historic Site designation of 1991; operation as a live event and
performing-arts venue by 313 Presents for owner Olympia Entertainment; and the
address.

The architectural style ships because a confirmed verdict states it.

**`status_verdict: uncertain`.** The verifier's reason: *"The only evidence of
current-day trading is the operator's own booking platform … which … cannot
itself establish that a venue is still trading — it is self-referential for the
entity that runs the site."* The finder's own framing was *"likely open,
self/operator source only"*, which the verdict calls the right instinct and not
a verdict. **No trading claim is made**, and the record says which source was
the only one reached.

### the-fillmore-detroit — The Fillmore Detroit (`theater`)

`2115 Woodward Avenue, Detroit, MI 48201` · `official_url: nil`

Three confirmed verdicts, published in full: the 1925 build as The State
Theatre, Crane's Beaux-Arts Italian Renaissance design and the Francis Palms
Building, with the Palms-State (1937), Palms (1946) and State (1982) renames;
the NRHP listing of November 24, 1982; and the 2007 Live Nation rebrand with
Fergie's June 13, 2007 inaugural show, the twelve-story building, the 2,900
capacity and the State Bar & Grill's separate entrance.

**`status_verdict: uncertain`** — *"the only description of current operation is
Wikipedia's undated prose"*. No trading claim.

### cliff-bells — Cliff Bell's (`restaurant`)

`2030 Park Avenue, Detroit, MI 48226` · `https://www.cliffbells.com`

Two confirmed verdicts, published in full: opened as a jazz club in 1935, closed
1985, reopened 2005, renovated 2006, continues to host jazz performances; the
address, the menu and the Art Deco setting from its own site.

**`status_verdict: uncertain`.** The verifier re-fetched and confirmed specific
shows listed through October 2026, and still declined to call it open: *"per §4
rule 4 a business's own site cannot establish that it is still trading."* No
trading claim, and no listed show dates are published as evidence of one.

### elwood-bar-and-grill — Elwood Bar & Grill (`restaurant`)

`300 East Adams Avenue, Detroit, MI 48226` · `https://www.elwoodgrill.com`

Three confirmed verdicts, published in full: Charles Noble's 1936 Streamline
Moderne building at Elizabeth and Woodward; Chuck Forbes' acquisition in the
1980s, the family's move of the building at their own expense when Comerica
Park's construction threatened it in 1997, and the rededication on Opening Day,
April 5, 2002; and Historic Detroit's status field reading "Open", updated April
2026.

**`status_verdict: confirmed`**, and the verifier calls it *"the
strongest-sourced open status in this file"* because `historicdetroit.org` is an
independent architectural-history site with an explicit current-status field —
third-party evidence rather than a self-claim.

### grand-trunk-pub — Grand Trunk Pub (`restaurant`)

`612 Woodward Avenue, Detroit, MI 48226` · `https://grandtrunkpub.com`

One confirmed verdict, published: an American restaurant and bar serving fish
and chips, chicken and waffles, reubens, and an extensive Michigan craft beer
selection. The history verdict is `uncertain` and is not published; see §2.

**`status_verdict: uncertain`.** No trading claim.

### grand-circus-park-detroit — Grand Circus Park (`park`)

`Woodward Avenue between Clifford, John R, and Adams Streets, Detroit, MI 48226`

Three confirmed verdicts plus the confirmed half of one `uncertain` verdict: the
1850 establishment under Woodward's post-1805 plan, the 1867 build-out, the
Woodward Avenue bisection and roughly 5 acres; the Russell Alger Memorial
Fountain by Henry Bacon; the Grand Circus Park Historic District's 1983 NRHP
listing with 2000 and 2012 boundary expansions; and the People Mover station of
the same name serving it.

The People Mover station is named as a fact about the park and **mints no place
record**; the park itself is a park with its own historic district, not transit
infrastructure.

`status_verdict: confirmed`, with the verifier's note that no `still_trading`
claim applies to public open space and its absence is correct rather than a gap.

### campus-martius-park — Campus Martius Park (`park`)

`Intersection of Woodward Avenue and Michigan Avenue, Detroit, MI 48226`

Two confirmed verdicts, published in full: the location, Woodward's design as
the focal point of the post-1805 rebuilding, the name from the square in
Marietta, Ohio; the loss of the original park in the 1900s to vehicular traffic,
the 1.2-acre re-established park dedicated November 19, 2004, the two
performance stages, sculptures and seasonal ice rink, the Detroit 300
Conservancy as operator, and the Motown Winter Blast and Christmas tree-lighting.

### central-united-methodist-church-detroit — Central United Methodist Church (`historic-site`)

`23 East Adams Street, Detroit, MI 48226`

Three confirmed verdicts, published in full. The architectural styles — Tudor
Revival and Gothic Revival — ship because a confirmed verdict states them, as do
the 1936 sanctuary redesign in carved Appalachian white oak with a 30-foot
reredos and the 1956 Henry Lee Willett Studios glass.

`status_verdict: confirmed`, with the verifier's reasoning recorded: this is not
a commercial trading claim, so the dated-evidence bar for businesses does not
squarely apply, and an actively described congregation with no closure evidence
is reasonably called open.

### st-johns-episcopal-church-detroit — St. John's Episcopal Church (`historic-site`)

`2326 Woodward Avenue, Detroit, MI 48201`

Three confirmed verdicts, published in full, including the Victorian Gothic
Revival style, the 170-by-65-foot plan with a 105-foot belfry, the rubble
limestone with Kelly Island sandstone trim, the six memorial windows of
1880-1954, and the congregation's use of the traditional 1928 Book of Common
Prayer. `status_verdict: confirmed`, on the same reasoning as Central United
Methodist.

### little-caesars-arena — Little Caesars Arena (`attraction`)

`2645 Woodward Avenue, Detroit, MI`

Two confirmed verdicts, published in full: the September 5, 2017 opening, the
Red Wings and Pistons tenancies with PWHL Detroit due in 2026; and the Midtown
Detroit location in the District Detroit district near the Cass Corridor.

`status_verdict: confirmed` on multiple ongoing major-league tenancies.

---

## 4. The guide

`slug: comerica-park-guide` · `destination: "Detroit, Michigan"` ·
`state: "Michigan"` · `county: "Wayne County"`

### Getting there

All four `getting_there` items are confirmed and all four ship: the Detroit
People Mover at Broadway and Grand Circus Park; the QLine at Montcalm Street;
SMART FAST Michigan 261, Woodward 461 and 462, and DDOT Route 4; and the whole
parking item.

**On the parking item's "open two hours before game time".** This is a facility
opening time, not a journey, and it does not match any of the eleven
trip-duration patterns — "two" is a word, not a digit, and no pattern reaches a
spelled-out hour count. It is published as the source states it. The judgment
here is deliberate and narrow: wave 1 dropped Southport Grocery's kitchen-closing
interval because that phrase **did** match the gate and the allowlist could not
be narrowed. This one does not match, and it is a gate-opening fact a reader
planning a trip actually needs.

**Not published: a standard parking price**, because the confirmed verdict is
that the Tigers do not publish one online. What is published is what the source
publishes: the $60 oversized-vehicle pass, the two phone numbers, Lot 4 as a
point of sale, and the SpotHero partnership with no lots or prices named.

**No station, garage, lot or bus route becomes a place record.**

### Around the ballpark

Every address is a place record's own published address. The section is
organised by street number along Woodward Avenue and the streets off it, which
is checkable; no relationship between two places is asserted that a verdict does
not state.

**Not published:** any "within a block", "across from" or similar. A first draft
opened the theatre paragraph "Two theatres by the same architect stand within a
block of each other"; no verdict measures that, and it was replaced with the two
street numbers.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and the one with
`about: "team"` — the 1894 establishment in the minor-league Western League and
the 1901 charter membership of the American League — plus the naming-rights and
rebrand verdicts from the identity section.

### FAQ

Six questions. Four state what could not be established or what the sources do
not carry: the pending rebrand, the absent parking price, the tiger-statue
correction, and the unverified garage under Grand Circus Park.

---

## 5. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to that rule here; the one interval published is a lot-opening time, not
  a journey, and it matches no pattern.
* **No vague proximity.** Every spatial claim is a street address, a street
  intersection, a set of bounding streets, or a named district a verdict states.
* **No unsourced superlative.** The rankings that ship — Fifth Third as the
  ninth-largest U.S. bank, the first organized Protestant congregation in
  Michigan Territory — sit inside confirmed verdict text.
* **No trading claim for four of eleven places**, named with the reason in the
  guide prose and in an FAQ answer, alongside the one place whose open status is
  independently sourced.
