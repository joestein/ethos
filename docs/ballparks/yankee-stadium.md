# Yankee Stadium — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/yankee_stadium_places.ex`
and `lib/ethos/seeds/yankee_stadium_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes. A moduledoc citing a git-ignored path has no audit trail
a year from now.

Source: the 2026-08-30 New York Yankees research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/new-york-yankees.json`,
`verified: true`), adjudicated by an independent adversarial verifier. Web
search was exhausted (200/200) before the first query of the batch, so every
fact was fetched directly, and New York City's public restaurant dataset stood
in for discovery on River Avenue.

**12 places and 1 guide shipped** from 12 researched places.

---

## Identity, and why the county is "Bronx"

| Field | Value | Verdict |
|---|---|---|
| venue | Yankee Stadium | *"The current official name of the venue is Yankee Stadium; the New York Yankees of MLB play there, address 1 East 161st Street, the Bronx."* — confirmed |
| city | Bronx | same |
| state | New York | same |
| county | **Bronx** | `identity.county` value "Bronx County" — **refuted**, correction: **"Bronx"** |

The verifier's refutation is worth quoting in full because it is not a fact
about New York, it is a fact about this corpus. Its stated basis:
*docs/site-builder.md (§3, 'The New York convention: borough-as-county');
corroborated by grep of priv/seed_data/brooklyn/\*.json and
priv/seed_data/manhattan/\*.json showing "county": "Brooklyn" / "county":
"Manhattan"*.

The legal name is correct and is not in dispute — a separate confirmed verdict
records that the Bronx is coextensive with Bronx County, separated from New York
County in 1914, and that fact is published in the guide's history section. What
was refuted is putting it in the `county` **field**, where it derives
`/destinations/new-york/bronx-county` and strands this guide on a hub of its
own instead of the borough hub its neighbours share.

---

## 1. Places, against the verdicts they rest on

### yankee-stadium-bronx — Yankee Stadium (`stadium`)

`1 East 161st Street, Bronx, NY 10451` · `official_url: https://www.mlb.com/yankees/ballpark`

| Published | Verdict `item` |
|---|---|
| "The home ballpark of the New York Yankees, at 1 East 161st Street in the Bronx." | *"Yankee Stadium is the home ballpark of the New York Yankees at 1 East 161st Street, Bronx, NY 10451."* — confirmed |
| "opened in 2009, cost about $2.3 billion including $1.2 billion in public subsidies, and was designed by Populous with Turner Construction as general contractor" | verbatim confirmed `item` |
| "25 fixed concession stands and 112 movable ones, with food operations run by Legends Hospitality" | verbatim confirmed `item` |
| groundbreaking August 16, 2006; opened April 2, 2009 as a workout day; first exhibition April 3; regular-season play April 16, 2009 | confirmed `history` item, `about: ballpark` |
| replaced the 1923-2008 original; demolition completed May 13, 2010; site became Heritage Field | confirmed `history` item. Its correction is a citation fix — cite the 1923 stadium article rather than the Heritage Field disambiguation page — and changes no published word. |
| the Grand Concourse sentence: 5.2 miles, 1894-1909, extended 1927, Louis Aloys Risse, Champs-Élysées model, National Register district 1987, LPC district 2011 | verbatim confirmed `history` item |

### hard-rock-cafe-yankee-stadium — Hard Rock Cafe Yankee Stadium (`restaurant`)

One confirmed verdict, published whole: Gate 6, corner of 161st Street and River
Avenue; opened March 30, 2009; seats 165; full bar; 15 large flat-screen TVs;
open year-round to ticketholders and non-ticketholders.

The second verdict is the DOHMH dataset row and is **not published as prose** —
see "What the dataset rows became" below.

### nyy-steak — NYY Steak (`restaurant`)

Confirmed: at Gate 6; billed as "The Steak & Seafood Restaurant of the NY
Yankees"; dry-aged USDA Prime steaks and seafood; roughly 100 wine options;
sister location at Seminole Casino, Coconut Creek, Florida. The billing is
published as the site's own words, because the verdict states it that way.

`could_not_establish`: no chef name and no exact opening date on the official
site. Named in the record rather than left as a silence.

### new-york-yankees-museum — New York Yankees Museum (`museum`)

Both verdicts confirmed and published whole: main level at Gate 6; opened 2009;
sponsored and presented by Bank of America; the Larsen/Berra perfect-game
tribute, the "Ball Wall", Munson's locker, Jeter's 3,000th-hit uniform, three
authenticated Ruth uniforms, the 2011 rings display, the Steinbrenner memorial.

**`status_verdict: uncertain`**, `could_not_establish: "Current (2026) operating
hours or whether it remains accessible on non-game days."` Both gaps are stated
in the summary. No trading claim.

### bronx-county-courthouse — Bronx County Courthouse (`historic-site`)

Both verdicts confirmed and published whole, including the style: *"in the Art
Deco style with Classical Revival and Neo-Classical elements"*. A verdict states
it, so it ships. `still_trading: n/a`.

### joyce-kilmer-park — Joyce Kilmer Park (`park`)

Both verdicts confirmed and published whole: Concourse section; NYC Parks;
Lorelei Fountain / Heinrich Heine Memorial by Ernst Herter, 1896, unveiled July
8, 1899; vandalised from 1900, arms cut off; restored and reopened at its
current location 1999. `still_trading: n/a`.

### heritage-field — Heritage Field (`park`)

Both verdicts confirmed and published whole: 10 acres; on the 1923 stadium's
site; demolition completed May 13, 2010; groundbreaking June 29, 2010; opened
April 2012; blue grass outline of the old diamond including home plate's
position.

`could_not_establish`: *"A single street-numbered address; sources give only the
cross streets."* The `address` field is therefore the cross streets, and the
summary says so. This is the Alta Vista Terrace precedent — a descriptive
address the source supports beats a street number it does not.

### bronx-museum-of-the-arts — Bronx Museum of the Arts (`museum`)

Verdicts #0 and #2 confirmed and published whole: 1040 Grand Concourse,
northeast corner of 165th Street; established May 11, 1971 by the Bronx Council
on the Arts with the Metropolitan Museum of Art; founder Irma Fleck; moved to a
former synagogue May 1983; expanded 1988 ($5.8m) and 2006 ($19m, doubling to
33,000 sq ft); free admission every day since March 29, 2012, previously Fridays
only; hours Wednesday-Sunday 11 a.m.-6 p.m.; the 2026 calendar including "The
Seventh AIM Biennial: Forms of Connection", January 23 to September 6, 2026.

**Verdict #1 is `uncertain` and does not ship**: the permanent collection of
"more than 800 paintings, sculptures, photographs and works on paper focused on
20th-century and contemporary American, Latin American, African and Asian art".
It is a plausible and appealing sentence, which is exactly why it is named here
rather than quietly omitted.

### bronx-terminal-market — Bronx Terminal Market (`attraction`)

Both verdicts confirmed and published whole: the 1934-35 wholesale market under
La Guardia; the Bronx House of Detention, closed 2000, demolished for
redevelopment; The Related Companies' $42.5m 2004 buyout; construction from
August 14, 2006; about $500 million; reopening September 12, 2009 with the
anchors Target, The Home Depot, Burlington, Lidl, BJ's Wholesale Club, Food
Bazaar and Best Buy.

**`status_verdict: uncertain`**, `could_not_establish: "Current (2026) tenant
list — the source's tenant roster is not freshly dated."` The anchor list is
therefore published **as of the 2009 reopening**, in those words, in the record,
in the guide and in an FAQ answer. A present-tense list of shops would be the
same failure the Wrigley rooftop revenue share was rewritten to avoid.

### billys-sports-bar-bronx, stans-sports-bar-bronx, the-clubhouse-cafe-bronx

`856`, `836` and `812 River Avenue, Bronx, NY 10451`.

Each has exactly one confirmed verdict, and it is a row in NYC's public
restaurant dataset. Each `could_not_establish` reads: *"Founding date and any
history — no independent source beyond the city inspection record could be
reached (WebSearch exhausted; no official site found)."*

**What the dataset rows became.** The rows carry a name, an address, a cuisine
category, a date, and a grade letter. The first four are published; the grade
letter and the word "inspection" are not, and neither is the Clubhouse Cafe's
"no violations". `test/ethos/seeds/place_content_gate_test.exs` bans
inspection-record prose as a **practice**, not as one phrasing, and its
moduledoc records that roughly twenty summaries in this corpus already read as
boilerplate because that rule did not exist when they were written. Three more
would not be an improvement. The same rule applies to the Hard Rock Cafe's and
NYY Steak's second verdicts, which are also dataset rows and are also unpublished
as prose — those two records had a real source to publish instead.

Each record names its own single-source limitation. None claims the business is
trading: the artifact's `status_verdict` for these places carries a `status` but
no `verdict` key, so there is no adjudicated status to rest on.

---

## 2. The guide

`slug: yankee-stadium-guide` · `destination: "Bronx, New York"` ·
`state: "New York"` · `county: "Bronx"`

### Getting there

| Published | Verdict |
|---|---|
| 161st Street–Yankee Stadium station at 161st Street and River Avenue: the 4 at all times, **the B on weekdays during rush hours and middays only**, the D at all times except rush hours in the peak direction | **refuted**, correction: *"the B train on weekdays, during rush hours and middays only"*. The corrected clause is what ships; the rest of the item stands. |
| Yankees–East 153rd Street on Exterior Street: daily Metro-North Hudson Line local service, selected Harlem and New Haven Line trains including "Yankee Clipper" trains on game days | confirmed, verbatim |
| Bx6: Riverside Drive & 158th Street, Washington Heights, to Hunts Point Cooperative Market, passing 161st Street/River Avenue | confirmed, verbatim |
| Bx13: George Washington Bridge Bus Station to Bronx Terminal Market at East 149th Street and River Avenue; some AM rush trips extended to the stadium, some PM rush trips originating there | confirmed, verbatim |
| $25 per game, **as an expectation recorded against the construction project**; NYCIDA's $225m in tax-exempt bonds for three garages of 3,600 spaces plus renovation of 5,569 existing spaces | confirmed — but the verdict's own verb is *"was expected to cost"*, and the source is the 2009-stadium construction account. Published as history, with an explicit statement that it is not a 2026 rate. |

No station, garage or bus route becomes a place record.

### Around the ballpark

Places are grouped by where the sources put them — Gate 6, River Avenue in
street-number order, and the Grand Concourse — and no distance or direction
between any two is published, because the artifact measures none.

The closing paragraph names the four places with no trading claim and says
plainly that this is not evidence of closure.

### The ballpark and the team

The five confirmed `history` items, published whole: the 1903 Highlanders under
Farrell and Devery, renamed the Yankees in 1913; the American League and the AL
East since 1969; 27 World Series titles through 2009 (published with that "through
2009" boundary intact, because the verdict carries it); the current stadium's
construction dates and cost; the 1923 stadium and Heritage Field; the Grand
Concourse.

The 1914 separation of Bronx County from New York County is published here — as
history, where it is a fact — rather than in the `county` field, where it was
refuted.

### FAQ

Six questions. Two of them exist because a reader would otherwise be misled by
an omission: why the River Avenue entries are short, and whether the Bronx
Terminal Market's shop list is current. A third explains the county field, so
the borough-as-county convention is legible to the next author rather than only
to the gate.

---

## 3. What is absent from the whole site

* **No trip duration of any kind.**
* **No proximity between two places.** The artifact carries no distance at all,
  so none is published, in blocks or otherwise.
* **No inspection-record prose**, and no grade letters — three records that
  could only have been dataset rows say so in plain terms instead.
* **No unsourced superlative.**
* **No trading claim** for the Yankees Museum, the Bronx Terminal Market, or the
  three River Avenue businesses.
* **One confirmed-adjacent claim dropped**: the Bronx Museum's permanent
  collection, `uncertain`.
