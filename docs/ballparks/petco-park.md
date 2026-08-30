# Petco Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/petco_park_places.ex`
and `lib/ethos/seeds/petco_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 San Diego Padres research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/san-diego-padres.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship — and a clause the verifier's own text
expressly states was confirmed is an adjudication of that clause and ships too.

**7 places and 1 guide shipped** from 7 researched places. **No place was
dropped.** One `getting_there` verdict is refuted; nothing else is.

---

## 0. The duration ban cost a sourced, confirmed clause

MTS's game-day page states how frequently trolleys run before games, and the
verifier confirmed the wording exactly against the page. **It is not published,
and the reason is the one the dispatch names in terms.**

A service frequency is not a trip duration. The corpus's gate matches the
*shape* rather than the meaning, it scans module source rather than published
fields, and its allowlist is keyed `{file, phrase}` over a whole module and
cannot be narrowed below one — so pardoning this clause would pardon every
duration-shaped string in that file, including one added later by someone else.
**The clause was dropped rather than the allowlist widened**, following the
wave-1 precedent with the Dodger Stadium Express headways and the wave-2
precedent with American Family Field's roof interval.

The side effect those waves recorded holds again: because the ban scans module
source, **neither moduledoc can quote the clause it records dropping**. Both
describe it. This file is Markdown and is not scanned, and it still describes
rather than quotes, so that a copy-paste from here into a module cannot
reintroduce it.

What ships from the same confirmed item is the half that is not duration-shaped:
additional service runs after games as needed. The guide says the frequency
exists and why it is absent, and an FAQ answer says it again.

---

## Identity and the county

| Field | Value | Verdict |
|---|---|---|
| venue | Petco Park | *"Petco Park is the current official name of the ballpark."* — confirmed, and the verifier adds: *"No sponsorship-renaming activity found anywhere else checked (Wikipedia, MTS, Gaslamp Quarter Association) that contradicts this."* |
| city | San Diego | confirmed twice |
| state | California | confirmed twice |
| county | **San Diego County** | Confirmed twice, on two different sources. |

**The county citation was checked, per the standing ruling that it has been
miscited in every wave.** Here it holds twice over. The encyclopedia's Petco
Park article *"gives address 100 Park Blvd / 19 Tony Gwynn Way, city San Diego,
state California, county San Diego"* — a county field, not an owner's name. And
the article on San Diego yields the exact sentence *"San Diego is the county
seat of San Diego County, California"*, which the verifier obtained verbatim.

**San Diego is not a consolidated city-county**, so the plain `"<Name> County"`
form ships rather than the bare-city rendering used for San Francisco,
Philadelphia and Denver.

**The venue name was taken from the verdict**, and the verifier's explicit
search for renaming activity across four sources is what makes it safe to
publish in a set where sponsorship renames are live.

---

## 1. Places, against the verdicts they rest on

### petco-park — Petco Park (`stadium`)

`100 Park Boulevard, San Diego, California 92101` · `https://www.mlb.com/padres/ballpark`

Three confirmed place verdicts, five confirmed identity verdicts and ten
confirmed `history` items, all published: both addresses and the reason the
second exists; the 2004 opening replacing San Diego Stadium, later Qualcomm
Stadium, where the Padres played from 1969 to 2003; the April 8, 2004 first
game and its 4-3 ten-inning result against the Giants; the Populous/HOK Sport
design with Antoine Predock credited, the cost over $450 million and the
public-private partnership naming the Center City Development Corporation and
the San Diego Redevelopment Agency; the 2006 World Baseball Classic
championship and the 2016 All-Star Game; the October 9, 2024 attendance record
of 47,773; Gallagher Square and its function as a free local park on non-game
days; the 1969 founding and NL West membership; the 1984 and 1998 World Series
losses, to the Tigers and, swept, to the Yankees; the Tony Gwynn description and
the Hall of Famer list; and the three dated ownership events.

**The superlative ships** because a confirmed verdict carries it and the
verifier checked its provenance: *"the exact superlative quote is present and
attributed to the article itself (not to Gwynn's own promotional material)."*
It is published as the article's description rather than as this corpus's
judgment.

**The ownership record is published as dated and unfinished** — a pending sale
announced May 2, 2026 and not finalized as of the article's August 4, 2026
state. That is the honest form for a fact in motion, and it tells a later reader
what to re-check.

`status_verdict: confirmed` open, and the verifier is explicit that it does not
rest on the club: *"Independent (non-team) evidence of current 2024-2026
operation exists: Wikipedia documents an October 9, 2024 attendance record set
at the park, and the same article's coverage of a pending 2026 ownership sale
presumes the team is still playing there … Ruled open on independent evidence,
not on the team's self-report alone."*

**No parking rate**, on a `could_not_establish` the verifier reproduced by
fetching the same page and getting the same HTTP 406.

### gaslamp-museum-davis-horton-house — Gaslamp Museum at the Davis-Horton House (`museum`)

`410 Island Avenue, San Diego, California 92101` · `https://www.gaslampmuseum.org/`

Three confirmed verdicts, published in full: the 1850 construction, the
pre-fabricated saltbox shipped from the East Coast, and the description as the
oldest structure in the New Town San Diego area William Heath Davis helped
establish; the operation as a museum under its current name; and the address,
the Thursday-to-Saturday hours with a 3:30 p.m. last entry, and the Gaslamp
Quarter Historical Foundation headquarters claim.

**One nuance is published because the verifier insisted on it.** The article
*"also states this specific building 'wasn't Davis's house, but of the same
style and age of the Davis home' — the item does not claim it was Davis's actual
residence."* The record and the guide both state the distinction rather than
leaving a reader to assume the obvious wrong thing, and an FAQ answer states it
a third time.

**`status_verdict: uncertain`, and no trading claim is made.** The verifier
checked the Gaslamp Quarter Association's directory as a candidate independent
source and *"found no listing for this museum under any of its names"*, and
ruled on the finder's non-standard label: *"The finder's 'uncertain-but-positive'
label is not a standard status; treat it as uncertain, full stop."* The
encyclopedia's description of the house as open to the public is published as
the encyclopedia's, and the limit is published beside it.

`could_not_establish`: the date the house opened as a museum. Not published.

### museum-of-illusions-san-diego — Museum of Illusions San Diego (`museum`)

`665 Fifth Avenue, San Diego, California 92101` · `https://moisandiego.com`

Two confirmed verdicts, published in full: the address and the description of
perspective-changing rooms, installations and optical illusions, guided or
self-paced; and the Gaslamp Quarter Association directory listing at the same
address.

**Not published:** the site's own promotional adjective for its installations,
which the verdict's `item` does not restate and which the house voice would not
carry in any case.

**`status_verdict: uncertain`, no trading claim** — the verifier ruled that
neither the museum's own site nor the directory is third-party evidence.
`could_not_establish`: the opening year. Not published.

### gaslamp-quarter-historic-district — Gaslamp Quarter Historic District (`historic-site`)

`Roughly bounded by Broadway and Harbor Drive, and Fourth and Sixth Avenues …` · `https://gaslamp.org`

Five confirmed verdicts, published in full: the 1867 Horton land purchase and
the choice of Fifth Avenue as the main street; the Stingaree era from the 1880s
to 1916 with its saloons, gambling halls and bordellos and the 1916 demolition
and renaming; the San Diego Historic Landmark designation of June 2, 1978 and
the National Register listing of May 23, 1980; the Association's own history
page corroborating the 1980 listing and recording its 1982 charter as a Business
Improvement District; and the over-90 historic buildings with Petco Park in the
adjacent East Village.

**Two small corrections from the verifier's reasons are carried.** The article's
own word is "anti-vice campaigners" rather than the finder's "vice reformers",
and the article *"additionally notes it was San Diego's first Chinatown"*. Both
are published as the article has them.

**The spatial claim is the one the verifier told the author to keep, and the one
it told the author to drop.** Its reason is worth the space:

> Note: the source's own wording is the vaguer 'one block away in the East
> Village neighborhood' (a distance claim this project's rules would not allow to
> publish); the item text correctly avoids repeating that and instead states only
> the checkable bordering relationship ('adjacent'), which is the form the
> contract permits.

**"Adjacent" ships; "one block away" does not**, in either module or in the
guide, and the guide states the substitution rather than making it silently.

**The address field is a boundary description and says so**, on an explicit
`could_not_establish`: *"A single street address, since this is a multi-block
historic district rather than a single-address site; the address field above is
a boundary description, not a mailing address."*

`status_verdict: confirmed not applicable` — an active neighborhood and business
improvement district rather than a single business.

### asti-ristorante — Asti Ristorante (`restaurant`)

`728 5th Avenue, San Diego, California 92101` · `https://www.astisandiego.com`

Two confirmed verdicts, published in full: the address, the Italian fine-dining
description, the Victorian-style brick interior, the outdoor patio and the
private event space for up to 120 guests, together with the site's own claim of
operating over 20 years; and the Gaslamp Quarter Association directory listing.

**The "over 20 years" is published as the restaurant's claim, not as a date**,
which is how the finder framed it and what the verifier approved: *"the 'over 20
years' self-claim (correctly framed by the item as coming from the site, not as
a verified fact)."* `could_not_establish`: the exact founding year.

**`status_verdict: uncertain`, no trading claim.** The verifier also records
that *"any superlative framing [is] correctly excluded from being treated as
verified"*, and none appears here.

### cafe-sevilla-san-diego — Cafe Sevilla (`restaurant`)

`353 Fifth Avenue, San Diego, California 92101` · `https://cafesevilla.com/san-diego/`

Two confirmed verdicts, published in full: the address and the description of a
restaurant and tapas bar with live music and flamenco shows, an associated
nightclub and private event hosting; and the directory listing under the fuller
name.

**`status_verdict: uncertain`, no trading claim.** `could_not_establish`: the
founding or opening year. Not published.

### the-field-irish-pub — The Field Irish Pub (`restaurant`)

`544 5th Avenue, San Diego, California 92101` · `https://www.thefield.com`

One confirmed verdict, published in full and framed exactly as the verifier
framed it: the address, the site's own origin story of a pub shipped piece by
piece from Ireland, and the private party area for up to 200 guests. The
verifier's note is the reason for the framing: *"The item text is correctly
scoped to reporting what the site says, not asserting the origin story as
independently verified history — appropriate given no independent source was
found."*

**Not published:** the site's own description of the city, a superlative in its
marketing copy.

**`status_verdict: uncertain`, no trading claim**, and the verifier checked
twice over: the Gaslamp Quarter Association directory *"found no listing for
this business"*, and the site's current seasonal promotion *"is suggestive but is
still self-sourced and cannot establish trading status"*. Three
`could_not_establish` entries — the founding year, independent corroboration of
the address or the origin story, and current trading status — are all published.

---

## 2. The guide

`slug: petco-park-guide` · `destination: "San Diego, California"` ·
`state: "California"` · `county: "San Diego County"`

### Getting there

Seven of the eight `getting_there` items are confirmed and ship: the Green Line
via Gaslamp Quarter station; the Blue and Orange Lines via 12th & Imperial or
Park & Market; Gaslamp Quarter station's lines, its boundary description and the
verbatim "accessible from the station"; the Rapid 215, 225 and 235 to City
College with the trolley transfer; the Park & Ride lots with only the UTC lot
carrying a cost note; the unavailable ballpark parking price with its HTTP 406
cause; and the post-game additional service.

**One is refuted, and both halves of the corrected fact ship, each on its own
source.** The finder attributed four claims about Park & Market station to MTS's
page. The verifier queried that page specifically and found it carries only two
of them — the Blue and Orange Line service and the 0.2-mile distance — with *"no
cross-street/neighborhood text for Park & Market at all"*. The other two are
true, and the verifier confirmed them on the station's own encyclopedia article:
the Silver Line service, and the Park Boulevard location between Market Street
and Island Avenue in the East Village. The verifier names the defect class:
*"misattributed to a source that does not contain them, which is exactly the
class of miscitation this project's process document calls out as its most
costly failure mode."* The guide states both halves and says which source
carries which.

**One confirmed clause is dropped**, and §0 sets out why.

**"About 0.2 miles from Petco Park" ships** — a distance in miles is the
checkable form the proximity rule protects, not the gesture it bans.

**No station or lot becomes a place record.**

### Around the ballpark

Every published address is a place record's own. The only spatial relationships
published are the district's boundary description, the ballpark's position in
the adjacent East Village, and the 0.2 miles above.

### The ballpark and the team

Restates the confirmed `history` items and identity verdicts, and publishes the
ownership transition with its dates and its unfinished state.

### FAQ

Five questions. Four state a limit: the absent parking price, the five places
with no trading claim, the house that was not Davis's house, and the frequency
the corpus cannot print.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8 — and here that
  cost a sourced, confirmed clause. See §0.
* **No vague proximity**, including the source's own "one block away", which
  the verifier flagged and which is replaced by the bordering relationship.
* **One superlative ships**, inside confirmed verdict text and attributed to the
  article that states it: Tony Gwynn as widely considered the greatest Padres
  player ever. **Others do not**: the marketing superlatives on two businesses'
  own sites.
* **No founding year for three restaurants and no opening year for one museum**,
  each on an explicit `could_not_establish`.
* **No parking rate**, because the pages that would carry one returned HTTP 406.
* **No mailing address for the historic district**, because it does not have
  one; what the field carries is a boundary description, and the record says so.
* **No trading claim for five of the seven places**, with the reason named in
  each record and in the guide.
