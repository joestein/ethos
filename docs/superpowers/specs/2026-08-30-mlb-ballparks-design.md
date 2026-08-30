# MLB Ballparks, and a Repeatable Site-Builder Pattern

**Status:** approved design, ready for planning
**Date:** 2026-08-30
**Predecessor:** `docs/superpowers/specs/2026-08-29-place-research-wave-design.md`

## Goal

Publish a guide for each of the thirty Major League Baseball ballparks, covering
what a visitor does around it on game day — and capture the pattern in
`docs/site-builder.md` so the same machinery runs again for NFL stadiums,
national parks, or any other themed set of sites.

The pattern document is the durable deliverable. The ballparks are its first
instance and its proof.

## Three findings that shaped this

**The geographic structure does not need building.** There is no states table.
`/destinations/illinois` and `/destinations/illinois/cook-county` are `GROUP BY`
queries over the guides table (`lib/ethos/guides.ex:88-107`). A guide carrying
`state: "Illinois", county: "Cook County"` produces both hubs on its next seed.
Adding eighteen hubs — the set spans nineteen jurisdictions, and New York
already had one — is a property of the content, not a migration.

**Duplicate protection is already mechanical, but only halfway.** Place slugs
carry a global unique index *and* a gate assertion (`assert_place_slugs_globally_unique!/0`)
that fails the build when two files claim one. What no index catches is the same
business under a different name — "Murphy's Bleachers" against "Murphy's". The
research contract therefore checks **addresses**, not names, before minting a
slug.

**Research capacity is the binding constraint, not design.** The Woodbury
antiques finder reported `WebSearch 200/200 exhausted` before its first query and
fell back to direct URL fetches; its verifier hit the same shared budget. Before
that, a 394-place wave came back **82% rate-limited**, and re-running at a
quarter of the concurrency did not help — the limit is session-cumulative or
source-side, not concurrency-scaled.

Thirty ballparks is roughly three hundred new places across nineteen
jurisdictions — seventeen US states, the District of Columbia and Ontario — where
we have no local open-data fallback of the kind Connecticut's business registry
provided. **This spec is therefore written to be executed in waves over time**,
and the pattern document exists partly so that a later session can resume without
re-deriving any of it.

## Design

### A ballpark is a guide

Each of the thirty is a guide, not a place-with-attachments:

| field | value |
|---|---|
| `destination` | `"Chicago, Illinois"` — the city, so the destination hub is the city |
| `state` / `county` | `"Illinois"` / `"Cook County"` |
| `tier` | `"guide"` |
| intro | the ballpark and the team it belongs to |
| entries | the places around it |

Guides already own entries, breadcrumbs, FAQs, photo pages, collections and the
link graph. Nothing is built to make this work.

**New York uses borough-as-county**, already established: `dumbo.json` carries
`county: "Brooklyn"` and `soho.json` carries `county: "Manhattan"`. Yankee
Stadium therefore takes `county: "Bronx"` and Citi Field `county: "Queens"`,
producing `/destinations/new-york/bronx` and `/destinations/new-york/queens`
without special handling. This is the Bronx case, and it needs no new idea.

### The ballpark is also a place

So it can be visited and badged like anything else, and so the guide has an
anchor entry. This needs one new kind: **`stadium`**, mapped to schema.org
`StadiumOrArena` — the same one-line change made for `shop`, and covered by the
existing test asserting every kind maps to a real type.

### What becomes a place, and what does not

Food, bars, shops, museums and parks around the ballpark become places with their
own pages.

**Parking and public transport become prose in a "Getting there" section, not
place records.** This is a deliberate departure from a literal reading of the
request and is recorded as such.

Thirty parking-garage pages would be thin by construction — the failure mode the
place-research programme spent a whole wave removing — and a subway platform is
not somewhere a visitor spends the day. The Brooklyn programme already settled
this shape: one *Getting there* section per guide covering subway, rail, bus and
driving. The day-tripper gets every fact; it simply does not fragment into stubs.

The section covers, per ballpark: the rail or subway lines and the stations that
serve it, bus routes where they are the realistic answer, official parking and
its published cost where a source states it, and the practical note that matters
locally.

### Sections

Each guide carries, at minimum:

1. **Getting there** — transit and parking, as above.
2. **Around the ballpark** — the food, drink and shopping the entries point at.
3. **The ballpark and the team** — history of both. This is where the request's
   "some description about the history of the stadium and the team" lives.

### A collection

`mlb-ballparks`, holding all thirty guides. Every ballpark guide then shows
*"Part of MLB Ballparks"* under its title from the existing template line
(`guide_html/show.html.heex:7-9`) with no template change — the same mechanism
the Antique Trail uses.

### Duplicate checking

Three layers, in increasing cost:

1. **The global slug index and gate.** Free, mechanical, already exists.
2. **Address matching before minting a slug.** The finder checks the existing
   corpus for the street address, because an address collision is a reliable
   signal and a name is not.
3. **Judgement on name variants.** Irreducible. Recorded in the pattern document
   as a thing a human or a verifier must catch.

For MLB specifically the overlap risk is low: only New York touches the existing
corpus, and it holds Manhattan and Brooklyn, not the Bronx or Queens.

## `docs/site-builder.md` — the durable deliverable

A pattern document for building a themed set of sites, written to be run again
without re-deriving anything. It captures:

- **Roster first.** A committed list of the N sites before any research, so
  nothing is silently skipped. `priv/seed_data/bare_places_roster.json` is the
  precedent and its lesson: assert the roster's *attribution* fields, not only
  its membership, because the field a wave dispatches on is the one that must not
  drift.
- **The research contract.** Finder plus *independent* adversarial verifier. The
  finder never writes verdicts — that separation collapsed once and produced a
  44-of-44 confirmation rate that had to be thrown out. The eight hard rules,
  including: a closure needs positive evidence; a business's own site cannot
  establish an award or that it is still trading; there is no minimum length.
- **The checkpoint.** One site end to end, reviewed, contract amended, *then* the
  rest. Thirty-one places produced six contract amendments last time, every one
  of which would have compounded across four hundred.
- **Geography is derived.** Set `state` and `county` on the guide; the hubs
  appear. Never build a table for it.
- **Transit and parking are prose.**
- **The dedup ladder** above.
- **What to change for a different set** — NFL stadiums are the same shape with a
  different roster; national parks differ in that the "around it" radius is much
  larger and gateway towns matter more than walkable blocks.
- **The deferred question**, below.

## Deferred: a place that owns entries

The request also described places, towns and regions carrying "other places
around it" — the Bronx itself, rather than a stadium in it.

Today only guides own entries. A place has a summary, photos and a sibling list
derived by town; it cannot carry a curated list of nearby places. Making it able
to means a join table, a place-page section, a seed-format change, a loader
change and gate assertions.

**Not in this spec.** The ballpark work needs none of it, and thirty ballparks
will teach us what the shape should be before we commit to one. Recorded in
`site-builder.md` so the next person finds the question rather than rediscovering
it.

## Risks

**The roster may not be exactly thirty, and this is the likeliest way to ship a
wrong fact.** There are thirty clubs, but "thirty ballparks" is an assumption,
not a given. Sponsorship renamings are frequent; at least one club has been
playing in a temporary venue; and a club in transition may share or borrow a
park, which would make the roster twenty-nine venues or thirty-one.

So the roster is built as **one entry per club**, and the venue for each club is
established at research time. Nothing about which team plays where, or what a
park is currently called, is taken from a model's recollection — that is exactly
the class of fact that goes stale silently and reads as confident. A verdict
establishes it or it does not ship.

**Twenty-seven new states arrive with one guide each.** A state hub with a single
guide is a thin page. Accepted: it is honest, and it is how Connecticut started.

**Washington shadows Washington, and this set contains both.**
`DestinationController.show/2` (`lib/ethos_web/controllers/destination_controller.ex:47-51`)
tries the **state** branch first and falls back to the town hub, and both serve
`/destinations/:slug`. So a guide carrying `state: "Washington"` shadows any
guide whose `destination_slug` is `washington`.

This set hits it squarely: one club plays in Washington, DC — whose natural
destination string derives `destination_slug: "washington"` — and another plays
in Washington **state**. The DC ballpark's hub would silently render the state
page instead.

**Decided: the DC ballpark carries `destination: "Washington DC, District of
Columbia"`,** deriving `destination_slug: "washington-dc"` and avoiding the
shadow. Recorded here rather than in a workspace ledger because the ledger is
git-ignored and this decision has to survive the programme.

A second instance of the same class has no live collision but is worth naming:
`derive_destination_slug/1` (`lib/ethos/guides/guide.ex:74-81`) takes the text
before the first comma, so `"Kansas City, Missouri"` and `"Kansas City, Kansas"`
would merge into one hub. Only one club plays in a Kansas City, so nothing
collides today.

**The research is large and the budget is not.** Stated above; the waves are
sized to it, and the pattern document is written so a later session can resume.

## Success criteria

- `docs/site-builder.md` exists and is specific enough to run for a different
  themed set without consulting this spec.
- A committed roster of **one entry per MLB club**, each naming its verified
  venue, city, state and county, asserted by a test that fails in both
  directions. The venue count is whatever research establishes, not assumed to
  be thirty.
- The `stadium` kind exists and maps to `StadiumOrArena`.
- One ballpark shipped end to end and reviewed, with contract amendments recorded
  before the rest begin.
- Every published claim traces to a verifier's verdict.
- No place slug collides with the existing corpus; no duplicate business ships
  under a variant name that address-matching would have caught.
- Full suite green.
