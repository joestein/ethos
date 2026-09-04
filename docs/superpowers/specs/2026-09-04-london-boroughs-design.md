# London Boroughs — Design

**Date:** 2026-09-04
**Status:** approved in chat, pending spec review

## Goal

Thirty-three London pages in the Ethos corpus — the City of London and the 32
London boroughs — researched, sourced, gated, illustrated and deployed, in the
shape the Manhattan, Brooklyn, Bronx, Queens, Rome and San Francisco
programmes already ship.

This is the seventh run of the pattern and the third jurisdiction. The spec is
short about what transfers and long only about what differs.

## Scope

All 33 units of the Greater London Authority's own list:

    city-of-london

    camden · greenwich · hackney · hammersmith-and-fulham · islington
    kensington-and-chelsea · lambeth · lewisham · southwark · tower-hamlets
    wandsworth · westminster

    barking-and-dagenham · barnet · bexley · brent · bromley · croydon
    ealing · enfield · haringey · harrow · havering · hillingdon · hounslow
    kingston-upon-thames · merton · newham · redbridge · richmond-upon-thames
    sutton · waltham-forest

**Why the borough and not the neighbourhood.** San Francisco's roster was a
hand-picked visitor list whose `source` field had to say "editorial selection".
London's is the GLA's, which is a real authority. It also gives complete
coverage with no arbitrary exclusions, and it collides with the existing corpus
twice rather than five times.

**The cost, stated plainly.** The borough is the wrong unit for a traveller.
Nobody says "I am going to Southwark", and a Southwark page must hold Borough
Market, Tate Modern, the Shard and Dulwich Village, which have little to do
with one another. The mitigation is structural rather than editorial: the
`sections` field exists to group a page by area, and a borough page is expected
to use two or three sections that a reader can navigate by. A page that lists
thirty places in one undifferentiated run has failed even if every fact in it
is sourced.

## Routing and identity

    state:  "England"
    county: "London"

routing to `/destinations/england/london`. `England` rather than `United
Kingdom` because it is the jurisdiction of the National Heritage List, which is
this corpus's designation authority here; `addressCountry` still emits `GB`,
the ISO code for the United Kingdom, through the same map in
`EthosWeb.StructuredData` that already special-cases Italy and Vatican City.

### The two destination-slug collisions

`Guide.derive_destination_slug/1` keeps only the first comma-segment and
discards the state, so `"Greenwich, England"` and `"Greenwich, Connecticut"`
both derive `greenwich`. Measured against the 359 destination slugs already
committed, exactly two of the thirty-three collide, both with Connecticut
towns:

| Borough | Derives | Already owned by |
|---|---|---|
| Greenwich | `greenwich` | connecticut/greenwich.json |
| Enfield | `enfield` | connecticut/enfield.json |

Resolved by using each borough's FORMAL name in the destination string, which
is factually correct rather than a workaround:

    "Royal Borough of Greenwich, England"   -> royal-borough-of-greenwich
    "London Borough of Enfield, England"    -> london-borough-of-enfield

The gate carries the same no-collision assertion, scoped to London, and
excludes code-seed guides so that deliberate co-listing stays possible.

## What transfers unchanged

Six programmes of precedent, inherited rather than re-derived:

- **The five-phase wave** — find → verify → arbitrate → author → review, with
  ONE arbitrator per wave. Rome's three concurrent blind arbitrators produced a
  real collision; a single arbitrator has no such failure mode.
- **Seven prose bans as gate regexes**, each with a self-test proving it can
  fail and a specimen list proving it does not fire on prose that must publish:
  superlative, research-method, editorial self-reference, vague-proximity,
  photo-policy, transit-negative, and status-agrees-with-prose.
- **`entries` non-empty**, 8–14 per page, every `place_slug` resolving. Rome
  shipped twelve neighbourhoods with `"entries": []` and 450 places unreachable
  from their own guides.
- **`taken_slugs.py`** as a mechanical reservation.
- **Live verification counts `/p/` links**, not just HTTP 200 and an image.

## What differs for London

### 1. The address parser needs a UK branch — the only real code in this spec

UK addresses defeat every existing path:

    "10 Downing Street, London SW1A 2AA"
    "Great Russell Street, London WC1B 3DG"

`@full` requires two commas and a two-letter region; these have one comma and
no region. `@italian` requires a two-letter province. `@vatican` requires
"Città del Vaticano". And `scan_postal/1` looks for five digits, so it finds
nothing in `SW1A 2AA` — meaning a London place would publish with NO street
AND NO postcode, which is worse than Rome's starting position, where the digit
scan at least recovered 44 CAPs.

So the parser gains:

- a UK postcode pattern, `[A-Z]{1,2}\d[A-Z\d]?\s*\d[A-Z]{2}`, matching the
  outward and inward code with the space optional;
- a `@uk` branch of the shape `<street>, <locality> <postcode>`, with the
  postcode optional so `"Trafalgar Square, London"` still yields a locality;
- a street test. The American house-number rule works for `"10 Downing
  Street"` but not for `"Trafalgar Square"` or `"Bank"`, so London is held to
  the same positive thoroughfare test Rome uses, with a British vocabulary:
  street, road, lane, place, square, gardens, terrace, crescent, mews, row,
  hill, walk, way, close, court, avenue, embankment, bridge, wharf, yard.

The Italian branch is consulted only after both American passes fail, and the
UK branch only after all three. Each can turn a nil into a value and never one
value into another — asserted, not assumed.

### 2. Freedom of panorama is broader here than in either previous jurisdiction

Rome had none, which forced a four-gate rule and a blocklist of modern
buildings. San Francisco has it for buildings only under 17 USC 120(a), which
inverted the blocklist to artworks.

Section 62 of the Copyright, Designs and Patents Act 1988 is believed to be
broader still, covering buildings AND sculptures AND works of artistic
craftsmanship permanently situated in a public place — but NOT two-dimensional
graphic works, which would keep murals and street art out.

**This is not settled and the spec does not treat it as settled.** The scoping
wave reads s.62 and the Commons country page for the United Kingdom, quotes the
operative text, and the photo rule is written from what it finds. If the
broader reading holds, London is the most permissive of the three and the photo
brief says so; if it does not, the rule tightens. What must not happen is a
permission granted on recollection.

### 3. Designation claims publish with a citation, from a better register

Historic England's National Heritage List for England gives every listed
building a list entry number and a grade. So the San Francisco rule applies
with a stronger source:

    GOOD: "Grade I listed, NHLE list entry 1066234."
    GOOD: "Listed Grade II* in 1970, NHLE 1234567."
    BAD:  "a listed building"    BAD: "Grade I listed"  (grade without a number)

The gate asserts a designation claim names its register and carries an
identifier. Conservation areas are borough-designated and carry no national
number; they may be named as conservation areas without one, which the gate's
citation pattern accommodates explicitly.

## File structure

    priv/seed_data/london_roster.json              the 33, from the GLA list
    priv/seed_data/london/*.json                   33 seed files
    priv/seed_data/london_photo_manifest.json
    priv/photos/gb/london/{borough}/               optimized images
    lib/mix/tasks/ethos.optimize_london_photos.ex
    test/ethos/seeds/london_seed_data_test.exs     the gate
    docs/london/{borough}-finder.md, -verdicts.md, wave{N}-arbitration.md

`Ethos.Release.seed_london/1` delegates to `seed_directory/2`. No ballpark
precondition applies; London has no code-seed places.

The photo tree is `priv/photos/gb/london/` — country segment first, as Rome's
`it/` and San Francisco's `us/ca/` do. New York's `ny/` predates the convention
and is not being migrated.

## The gate

`Ethos.Seeds.LondonSeedDataTest`, written BEFORE the corpus and landing
excluded behind `@moduletag :pending_london`, exactly as the four previous
gates did. Removed in two stages: the module tag at the first wave, the
roster-equality `@tag` and the `test_helper.exs` entry at the last.

Assertions:

1. Roster equality, both directions, non-vacuous.
2. Place kinds read off `Ethos.Places.Place.kinds/0`, not copied.
3. Entry kinds, entries non-empty, every `place_slug` resolving.
4. Link `kind` from `Ethos.Links.Link.kinds/0`; link notes ≤160 characters.
5. Link targets are full `{slug}-london-guide` slugs.
6. Guide titles ≤120 characters.
7. Tier matches the file: `guide` is 4+ places with a 100–160 word intro, 2–3
   sections one headed exactly "Getting there", and 4–6 FAQ; `town-page` is
   under six places with a 90-word floor and two links.
8. `state == "England"`, `county == "London"`.
9. Globally unique place slugs.
10. No destination-slug collision with a non-London seed file.
11. The seven prose bans, each with self-tests and specimens.
12. Designation claims carry a register and an identifier.
13. Photo licences on the allowlist with author and source URL.
14. Marquee institutions in exactly one file.

Every ban ships with BOTH a positive self-test and a specimen list. Across Rome
and San Francisco every ban produced false positives — "Italy's first king" is
a succession, "the Capitolium at the north end" is architecture, a hospital
that "is not a visitor site" is open, "so none is named here" is the permitted
refusal — and each narrowing became a regression test. The specimens are how
that knowledge survives into a seventh programme.

## Wave plan

1. **Scoping** — one wave, five agents: the GLA borough list and its
   provenance; the National Heritage List's API and its reachability; s.62
   CDPA and what the photo rule may permit; the UK address and postcode forms
   the corpus will meet; and what plays the role DataSF played for San
   Francisco.
2. **Scaffolding** — roster, gate, parser branch with tests, photo task,
   seeder, release test. Gate dark.
3. **Waves 1–3** — eleven boroughs each, one arbitrator per wave, each reading
   its predecessors' arbitrations.
4. **Fix passes** — driven by the gate's own output.
5. **Photo wave** — one image per borough, fragments merged serially.
6. **Ship** — full suite, commit, push, deploy, seed, verify live.

## Testing

The gate is the oracle: agents write, the suite judges. The corpus-wide address
and structured-data censuses are updated once per wave with every digit
accounted for.

The UK parser branch gets its own tests in
`test/ethos/places/address_test.exs`, in the shape the Italian branch already
uses: that a UK address decomposes; that a postcode-less one still yields a
locality; that a descriptive location yields no street; and — the important one
— that the UK branch cannot alter an address the American or Italian passes
already parse.

## Risks

- **The borough is the wrong unit and this spec knows it.** If a wave produces
  a page that is a list rather than a guide, the answer is better sections, not
  a narrower roster. The scope was chosen deliberately and completely.
- **Outer boroughs will be thin.** Barking and Dagenham, Havering and Sutton do
  not carry what Westminster carries. `town-page` tier exists for exactly this,
  and a short honest page beats a padded one.
- **The FoP reading may be wrong.** It is flagged as unverified throughout and
  the scoping wave settles it before any photograph is sourced.
