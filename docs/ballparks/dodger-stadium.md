# Dodger Stadium — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/dodger_stadium_places.ex`
and `lib/ethos/seeds/dodger_stadium_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 Los Angeles Dodgers research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/los-angeles-dodgers.json`,
`verified: true`).

**3 places and 1 guide shipped.** The artifact researched **two** places; the
ballpark's own record is built from confirmed `identity` and `history` verdicts,
because the artifact has no `places` entry for it and the set's structure
requires the ballpark to be a place with `kind: "stadium"`.

**This is a short site, and shortness is not a defect here.** The content gate
has no length floor by design; a floor is what manufactures the boilerplate the
gate exists to ban. Nothing was invented to lengthen it.

---

## Identity and county

| Field | Value | Verdict |
|---|---|---|
| venue | Dodger Stadium | *"The stadium's overall name remains 'Dodger Stadium'"* — see the refutation below |
| city | Los Angeles | *"The stadium's address is 1000 Vin Scully Avenue, in the Elysian Park neighborhood of Los Angeles, California."* — confirmed |
| state | California | as above |
| county | Los Angeles County | *"The City of Los Angeles is the county seat and most populous city of Los Angeles County, California — establishing the stadium's county as Los Angeles County given its city is Los Angeles."* — confirmed |

### The naming-rights refutation

Identity verdict #1 is **refuted**. The finder wrote that team president Stan
Kasten and ownership stated the stadium's name *"will never be for sale."* The
correction: *"Drop the quoted clause attributed to Stan Kasten and ownership; it
is not supported by the cited source (or by the corroborating Yahoo article,
which also carries no such quote)."*

The correction then supplies the publishable form verbatim, and that form is
what appears in the place record, the guide's closing section and an FAQ answer:
the stadium's own name remains Dodger Stadium; in 2026 the Dodgers signed a
naming-rights deal with Uniqlo covering only the playing field, branded "Uniqlo
Field at Dodger Stadium" — the first naming-rights agreement in the stadium's
60-plus-year history.

**No quotation from any Dodgers official appears anywhere in this site.**

---

## 1. Places, against the verdicts they rest on

### dodger-stadium — Dodger Stadium (`stadium`) · `official_url: nil`

`1000 Vin Scully Avenue, Los Angeles, CA`

| Published | Verdict |
|---|---|
| address and Elysian Park neighborhood | identity verdict #3, confirmed, verbatim |
| the Uniqlo field-naming sentence | identity verdict #1's **correction**, verbatim |
| "A large terraced parking area is built behind the main stands, at elevations that let ticket holders park at roughly the level of their seats." | `getting_there` verdict #4, confirmed, with its correction applied: *"prefer 'a large terraced parking area built behind the main stands' to track the source precisely, rather than 'surrounded by parking lots.'"* |
| groundbreaking September 17, 1959; opened April 10, 1962; under three years; about $23 million; first MLB stadium since the original Yankee Stadium built with 100% private financing | `history` verdict #2, confirmed, verbatim |
| 2012-2013 renovations under new ownership, HD video boards and facility upgrades | `history` verdict #3, confirmed, verbatim |
| the Chavez Ravine acquisition, the collapse of the housing project after 1953, the June 3, 1958 referendum, the Dodgers' acquisition, and the "Battle of Chavez Ravine" | `history` verdict #1, confirmed, verbatim |

**No ZIP code is published**, because no verdict gives one. **No
`official_url`**: the one MLB URL in the artifact is cited for the club's
existence, not as the venue's page, and a source cited for one thing does not
vouch for another.

### elysian-park — Elysian Park (`park`) · `official_url: nil`

`835 Academy Rd, Los Angeles, CA 90012`

Four confirmed verdicts, published: the address; creation by city ordinance
April 5, 1886, sponsored by city engineer George Hansen, "at a time when the
city had few other parks"; the site considered worthless land, originally part
of the Spanish land grant for the Pueblo of Los Angeles; 600 acres; the land
swap with the Dodgers when the stadium was built; Angels Point, a hill within
the park, overlooking the stadium and the downtown skyline; the Chavez Ravine
Arboretum, open 1893, more than 100 varieties of trees.

**Not published: the administering department.** The `status_verdict` reads
`uncertain (administering body specifically), confirmed (park exists and is
public)`, with the correction *"Either drop the specific department name or cite
it to a source that states it … rather than to discoverlosangeles.com, which
does not say it."* Dropped. The record says the park is a public one.

**Not published: `official_url`, hours or amenities.** `could_not_establish`:
*"Could not confirm current visitor amenities or hours from the official
laparks.org page — it returned an HTTP 403 to this fetch on every attempt."* The
record says so in as many words. An unreachable domain is not a verified one —
the Cubby Bear precedent from the Wrigley checkpoint.

### philippe-the-original — Philippe The Original (`restaurant`)

`1001 N. Alameda Street, Los Angeles, CA 90012`

Confirmed and published: the 1908 founding by Philippe Mathieu at 300 N.
Alameda Street; Martin and Binder family ownership since 1927; the 1951 move
after the original site was displaced by Hollywood Freeway construction; "at the
edge of Chinatown"; the sandwich list and the rest of the menu; the James Beard
Foundation's America's Classics listing.

**The award ships** because a confirmed verdict carries it. The rule bans awards
a verdict does not carry, not awards it does.

**The origin claim is published as a claim.** The verdict's own wording:
*"Philippe's claims to have created the 'French Dipped Sandwich' — this is the
restaurant's own claim, restated by Wikipedia as a claim rather than an
established fact."* The place record and the FAQ both say so.

**The superlative is the verifier's, not the finder's.** `status_verdict` is
*refuted (as sourced)* with the correction *"Cite the lead sentence — 'well
known for continuously operating since 1908, making it one of the oldest
restaurants in Los Angeles' — rather than the 'longest continuously operating'
superlative, which the article itself marks as the restaurant's own claim."*
"One of the oldest" is what ships. "Longest continuously operating" appears
nowhere.

---

## 2. The guide

`slug: dodger-stadium-guide` · `destination: "Los Angeles, California"` ·
`state: "California"` · `county: "Los Angeles County"`

### Getting there — and the two frequencies that were cut

| Published | Verdict |
|---|---|
| Chinatown station is the nearest rail station | confirmed, verbatim |
| the Dodger Stadium Express: free, Metro-operated, for ticket holders during home games | confirmed, verbatim |
| Union Station route: non-stop, dedicated bus lane along Sunset Boulevard and Vin Scully Avenue, until the end of the second inning | confirmed — **minus the headway** |
| South Bay route: via the Harbor Transitway, stopping at Slauson, Manchester, Harbor Freeway, Rosecrans and the Harbor Gateway Transit Center | confirmed — **minus the headway** |
| no published parking rate could be established; MLB.com and third-party ticketing and parking pages returned bot-blocked errors on every attempt | confirmed, verbatim |

**Why the headways were cut.** Both are stated in the source as intervals in
minutes. They are bus *frequencies*, not trip durations, and a reader loses
something real when they go. But the duration gate matches the string, not the
meaning, and its allowlist is keyed `{file, phrase}` over a whole module — a
pardon for one of these would also pardon any genuine travel claim added to the
same file later. `test/ethos/seeds/ballpark_seed_data_test.exs` records that
reasoning explicitly and keeps its allowlist empty; the Wrigley checkpoint hit
the same wall once, with Southport Grocery's sourced closing interval, and
dropped the clause rather than widen the pardon.

Both the guide section and an FAQ answer say plainly that the frequencies exist,
that they are not published here, and that the transit agency has them. **This
is the one place in this wave where a gate cost the corpus a sourced fact**, and
it is recorded here rather than left invisible.

### Around the ballpark — and the boundary disagreement

Philippe's verdict #3 is **refuted**. The finder attributed Chinatown's northern
boundary at Stadium Way and Dodger Stadium/Chavez Ravine to the Los Angeles
Times' Mapping L.A. The correction: *"The boundary is per the Community
Redevelopment Agency of the City of Los Angeles (CRA/LA), not the LA Times. If
the Times' classification is mentioned at all, it should be noted that Mapping
L.A. places this bordering strip in Elysian Park rather than Chinatown — a
genuine disagreement between sources, not corroboration."*

Published exactly that way: CRA/LA draws the line there, Mapping L.A. puts the
same strip in Elysian Park, and the guide reports the disagreement rather than
picking a winner. This is the Wrigley goat-ejection ruling in another costume —
two sources, two answers, so the guide gives the disagreement.

### The ballpark and the team

The four confirmed `history` verdicts in order: O'Malley's failed Brooklyn dome
and the move west; Chavez Ravine and the Battle of Chavez Ravine; the
construction and the private financing; the 2012-2013 renovations. Then the
naming-rights correction.

---

## 3. What is absent from the whole site

* **No trip duration** — and no bus headway, for the reason recorded above.
* **No proximity between two places** beyond what a source states: Angels Point
  overlooking the stadium, Philippe's at the edge of Chinatown.
* **No quotation attributed to Stan Kasten or Dodgers ownership.**
* **No "longest continuously operating restaurant in Los Angeles."**
* **No parking price**, and no park hours or amenities.
* **No administering department for Elysian Park.**
