# Nationals Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/nationals_park_places.ex`
and `lib/ethos/seeds/nationals_park_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 Washington Nationals research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/washington-nationals.json`,
`verified: true`).

**4 places and 1 guide shipped** from 4 researched places. Two verdicts were
`refuted`, both with corrections that ship in place of the finder's text.

---

## Identity, and the two fields decided by routing

| Field | Value | Basis |
|---|---|---|
| venue | Nationals Park | confirmed verdict, verbatim |
| city | Washington | confirmed verdict, verbatim |
| state | District of Columbia | confirmed verdict |
| county | **District of Columbia** | see below |
| guide `destination` | **"Washington DC, District of Columbia"** | see below |

### Why the county repeats the state

The artifact's `county` field is not a value at all — it reads *"none —
Washington, D.C. is a federal district and is not part of any state or
county"*. And the underlying fact is confirmed: the District has no counties.

But `county` is not only a fact field. Every place record renders a breadcrumb
linking to `/destinations/{state}/{county}`, and that URL 404s unless some
published guide carries the county. Leaving it empty would break the breadcrumb
on all four place pages. The field therefore carries the state's own string, and
the guide's moduledoc says why so a later author does not "fix" it into a 404.

The historical fact is published where it belongs — in the guide's closing
section and an FAQ answer — rather than in a field.

### Why the destination is "Washington DC, District of Columbia"

`Guide.derive_destination_slug/1` takes the text before the first comma, so this
derives `washington-dc`. Plain `"Washington"` would derive `washington` and be
shadowed by Washington **state**, because `DestinationController.show/2` tries
the state branch before the destination branch. This is recorded in the set's
spec; the guide's moduledoc restates it at the point of use.

### The 1871 refutation

Identity verdict #2 is **refuted**. The finder wrote that Congress abolished
Washington County *and Alexandria County* in 1871. The correction:

> The Organic Act of 1871 abolished the individual charters of the cities of
> Washington and Georgetown and abolished Washington County, creating a unified
> territorial government for the whole District. (Alexandria County, the
> separate Virginia-ceded portion of the original District, had already been
> retroceded to Virginia in 1846 and was not part of the 1871 act.)

Published in exactly that shape, retrocession included.

---

## 1. Places, against the verdicts they rest on

### nationals-park — Nationals Park (`stadium`)

`1500 South Capitol Street SE, Washington, D.C.` ·
`official_url: https://www.mlb.com/nationals/ballpark`

Confirmed and published: the address and the Navy Yard neighbourhood of
Southeast Washington along the Capitol Riverfront; opening March 22, 2008;
capacity 41,373; HOK Sport with Devrouax & Purnell Architects and Planners; the
name carried since opening **with no corporate naming rights on the facility
itself**; groundbreaking May 4, 2006; the expedited design-build approach; $693
million construction, $135 million upfront taxpayer funds, about $535 million in
municipal bonds, $84.2 million more on transportation, art and infrastructure,
$783.9 million total; the 2018 All-Star Game, Games 3-5 of the 2019 World
Series, and the 2015 NHL Winter Classic; the Johnson, Howard and Gibson statues
and what each honors; the Ring of Honor covering both Senators franchises, the
Homestead Grays and the Expos.

`could_not_establish`: current published single-game parking price. Named in the
guide, not in the record.

### albi-washington-dc — Albi (`restaurant`) · `official_url: nil`

Verdict #0 is **refuted**, correction: *"Albi serves Levantine/Palestinian
cuisine under chef-owner Michael Rafidi in the Navy Yard/Capitol Riverfront
neighborhood at 1346 4th Street SE. (Drop the 'adjacent to Maxwell Park'
clause.)"* The correction's sentence is what ships, and **"adjacent to Maxwell
Park" appears nowhere** — a spatial relationship the verifier would not stand
behind.

Verdicts #1 and #2 confirmed and published: the Michelin star; Rafidi's James
Beard Culinary Award reported June 13, 2024; establishment in February 2020; and
the April 2025 renovation report, published as what it is — the most recent
evidence of operation the research reached.

**Both awards ship** because a confirmed verdict carries them. The rule bans
awards a verdict does not carry.

`could_not_establish`: current hours and menu specifics. Stated in the record.

### the-yards-park-dc — The Yards Park (`park`) · `official_url: nil`

One confirmed verdict, published whole: 42 acres of waterfront along the
Anacostia River; Forest City Washington's development after the GSA award in
2004; M. Paul Friedberg as landscape architect; opened 2010; operated now by the
Capitol Riverfront Business Improvement District.

**No award is named**, and the record says why. `could_not_establish`: *"names of
the specific design/urban-planning awards mentioned generically by the source."*
A generic gesture at awards is not an award, and writing "award-winning" from it
would be exactly the self-praise the superlative rule bans.

### national-museum-of-the-united-states-navy (`museum`) · `official_url: nil`

Verdicts #0 and #1 confirmed and published: Building 76, the former Breech
Mechanism Shop of the old Naval Gun Factory, on the Washington Navy Yard
grounds; and the access rule in full — valid government or military credentials,
an escort who has them, or a day pass from the on-site visitors' center.

Verdict #2 is **refuted**, correction: the National Register listing is dated
**June 19, 1973** rather than the bare year, and the Navy Yard is *"described as
the oldest shore establishment/base of the U.S. Navy, established in 1799 and in
use since"* — **not** "the U.S. Navy's longest continuously operated federal
facility". The corrected form is what ships; the finder's superlative does not
appear.

`status_verdict: confirmed / "open with access restrictions"`, and the
restrictions are the substance of the record rather than a footnote to it.
`could_not_establish`: current admission hours and day-pass procedure details.
Both stated.

---

## 2. The guide

`slug: nationals-park-guide` · `destination: "Washington DC, District of Columbia"`
· `state: "District of Columbia"` · `county: "District of Columbia"`

### Getting there

Five confirmed `getting_there_verdicts`, all published: Navy Yard–Ballpark
station on the Green Line, its 2011 renaming from Navy Yard, both entrances, and
the center-field exit; Metrobus C51 and C55; water taxi from Alexandria and
Georgetown; **14 sanctioned parking lots or garages, parking described as
limited, and no published price** with the HTTP 406 recorded; free valet bicycle
parking at Garage C and 110 sidewalk bike racks.

No station, bus route or garage becomes a place record.

### Around the ballpark

Three places, each with its stated gaps. The museum's access restriction is
given as the practical fact it is rather than buried.

### The ballpark and the team

Five confirmed `history_verdicts`: the 2005 relocation from Montreal announced
September 29, 2004 and the choice of Nationals over Senators for legal and
political reasons; the 2019 championship over Houston in seven games, "the first
World Series in MLB history in which the road team won every game" — a
superlative inside confirmed verdict text; the construction and its financing;
the events hosted; the statues and the Ring of Honor. Then the corrected 1871
account.

---

## 3. What is absent from the whole site

* **"Adjacent to Maxwell Park"** — refuted, and the only spatial claim the
  artifact offered between two places.
* **"The U.S. Navy's longest continuously operated federal facility"** —
  refuted, replaced by the correction's "oldest shore establishment".
* **Alexandria County in the 1871 act** — refuted; the 1846 retrocession is
  published instead.
* **Any named award for The Yards Park**, its source naming none.
* **No parking price**, no hours for Albi, no admission hours or day-pass
  details for the museum.
* **No trip duration, and no distance between two places.**
