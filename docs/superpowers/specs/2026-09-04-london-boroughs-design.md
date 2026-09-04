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


---

# Scoping findings, 2026-09-04 — what they changed

Five agents settled the questions this spec left open. Six of their findings
AMEND it, and they are recorded here rather than folded silently into the text
above, so that the change and its reason stay visible.

## 1. Freedom of panorama: the belief held, and one exclusion was missed

VERIFIED against legislation.gov.uk. s.62 CDPA 1988 applies to buildings, and
to sculptures, models for buildings and works of artistic craftsmanship "if
permanently situated in a public place or in premises open to the public";
s.62(2)(b) permits making a photograph and s.62(3) permits **issuing copies to
the public**, which is commercial publication with no attribution condition and
no non-commercial limit.

Three consequences the spec did not state:

- **s.4(2) defines "building" as including any FIXED STRUCTURE, and a part of
  one.** London's cover is therefore wider than 17 USC 120(a), not merely
  equal to it.
- **The architect's or sculptor's death date is irrelevant and must not be
  researched.** There is no modern-buildings blocklist for London. The Shard
  publishes.
- **"Premises open to the public" reaches ticketed premises**, so sculpture in
  a museum or a lobby is inside s.62.

THE EXCLUSION THIS SPEC MISSED: **"permanently situated"**. The Fourth Plinth
commissions are sculptures in a public place and are still OUT, because they
are temporary — Commons has deleted Hahn/Cock, Gift Horse, Alison Lapper
Pregnant, Ecce Homo and The End on exactly that ground. Shonibare's Nelson's
Ship in a Bottle publishes at the National Maritime Museum, where it is
permanent, and not on the plinth, where it was not.

Graphic works are excluded as predicted: s.4(2) defines them, s.62(1) does not
name them, so murals and street art are out however permanent. Banksy is a
reject twice over — graphic work, and living. Commons deleted Category:Banksy
in London on 31 December 2025. The EUIPO "flower bomber" decision is a TRADE
MARK bad-faith finding and must not be cited as copyright.

A NON-COPYRIGHT RESTRICTION APPLIES, of the same shape as Italy's Codice:
**Royal Parks and Other Open Spaces Regulations 1997, reg. 4(18)** requires
written permission for commercial photography in Hyde Park, Regent's Park,
Greenwich Park and Richmond Park among others. It is noted in the photo brief
and NOT gated — as with Italy, the corpus records the restriction and takes a
risk posture rather than pretending it does not exist.

## 2. The gate's section rule was wrong for this unit, and is amended

Assertion 7 above allows 2–3 sections including one headed exactly "Getting
there", which leaves one or two area sections. **Southwark cannot be navigated
in two.** The borough agent proposed, and this spec adopts:

    Bankside and Borough · Bermondsey and Rotherhithe ·
    Walworth, Peckham and Dulwich · Getting there

**Assertion 7 is amended: a London guide carries 2 to 5 sections, one headed
exactly "Getting there".** The upper bound moves because the unit is a borough
rather than a neighbourhood, which is the cost this spec accepted openly and
must now pay in the gate rather than in the prose.

## 3. The thoroughfare test is necessary but NOT sufficient

62% of the fifty real London addresses collected carry no house number, which
confirms the positive test is needed. But four real street names carry no
thoroughfare word either: **Bankside, The Cut, Smithfield, Upper Ground** — and
Kew. A positive test alone would reject them.

So the UK street rule is: accept a leading house number, OR a recognised
thoroughfare word, OR a segment that the postcode pattern confirms was
immediately followed by a valid postcode. The third clause is what rescues
"Bankside, London SE1 9DT", and it is safe because a postcode is a strong
signal that the preceding segment is an address rather than a description.

The postcode regex is VERIFIED: zero rejections over 100 real postcodes from
postcodes.io and all 50 London codes, and zero false positives over the 4,204
addresses already in the corpus. Note that the gov.uk BS 7666 regex requires a
space and therefore rejects "W1F7LW", a real printed address; ours makes the
space optional.

## 4. The NHLE exceeds San Francisco, but not through its website

**Use the ArcGIS FeatureServer, not historicengland.org.uk.** The website is
Cloudflare-protected and returns 403 intermittently to every user agent tried,
including a browser one — "a single 403 is a false negative, not unreachable".
The open-data API never 403'd across dozens of calls:

    services-eu1.arcgis.com/ZOdPfBS3aqqDYPUQ/.../National_Heritage_List_for_England_NHLE_v02_VIEW

Eleven layers under the Open Government Licence, fields ListEntry, Name, Grade,
ListDate and hyperlink. Verified worked examples: Westminster Abbey 1291494
(Grade I, 24 Feb 1958), Battersea Power Station 1357620 (II*, 14 Oct 1980),
Abbey Road Studios 1393688 (II, 23 Feb 2010). Measured grade counts reproduce
Historic England's published percentages exactly by two independent methods.

THREE TRAPS, all of which must reach the research briefs:

- **Curtilage.** A search for "Royal Albert Hall" returns three Grade II lamp
  standards beside the Grade I hall; "Tower of London" returns bollards. A
  finder that takes the first row gets a lamp post.
- **Grade on the wrong type.** Scheduled monuments, battlefields, wrecks and
  World Heritage Sites have NO Grade field. "Grade II scheduled monument" is a
  category error.
- **No borough field on the listed-building layers.** Attribution needs a
  spatial join or the per-entry page, so a wave cannot simply filter by
  borough.

Conservation areas carry a UID with values like 280 and 7143. **That is not a
list entry number and must never be published as one.** Blue plaques are
commemorative, carry no statutory protection and no re-fetchable identifier;
they may be mentioned as plaques and never as designations.

## 5. The finder brief must not ask for museums and markets

The borough agent measured yield two ways and found the axes disagree
SYSTEMATICALLY: inner boroughs carry their content as institutions, outer
boroughs as listed buildings. Hounslow returns 14 on one axis and 61 on the
other; Lewisham 7 and 30.

**A finder briefed on "museums, galleries and markets" will report the outer
boroughs as empty and be wrong.** Every outer-borough brief must lead with the
NHLE and treat institutions as secondary.

Measured Grade I + II* counts against visitor-category counts: Westminster
205/192, Southwark 33/67, Hackney 38/21, Bromley 31/15, Havering 21/12,
Barking and Dagenham 7/7.

**No borough fails to reach four places.** Barking and Dagenham clears eight to
ten, Havering fourteen. The town-page tier may end up with no occupants, which
is a fine outcome; the tier stays in the gate because a wave that produces a
thin page must have somewhere honest to put it.

## 6. Two definitional points the spec must fix

**The City of London is not a borough.** It is sui generis, a ceremonial county
with three authorities — the Corporation, the Inner Temple and the Middle
Temple. The roster carries 33 units and should say so; "the 32 boroughs and the
City" is the accurate phrasing.

**Inner and Outer London have two defensible definitions** and three boroughs
fall differently under them: Greenwich is Inner statutorily but Outer for ONS;
Haringey and Newham the reverse. **The roster uses the statutory definition
(London Government Act 1963) and records that it is doing so**, so that a page
never asserts a classification the source it cites does not support.

## 7. Sources, ranked by what actually answered

    NHLE ArcGIS FeatureServer   200 always      the designation spine
    TfL unified API             200, no key     nearest stop, modes, named lines
    OSM / Nominatim / Overpass  200             borough via city_district, GSS codes
    Wikidata                    200             P1216 = NHLE number, 401,458 statements
    London Datastore            200 but broken  package_search IGNORES its query
    Operator sites              6 of 8          britishmuseum.org and hrp.org.uk 403
    Borough websites            weakest tier    Westminster 404, Bromley 404

**London out-sources every previous destination: London > San Francisco > New
York > Rome.** A statutory national register published as a live OGL geospatial
API is something neither DataSF nor the National Register offered.

TWO TRAPS IN THIS TIER:

- **Southwark council returns 202 to everything, including its homepage.** Bot
  mitigation that passes a naive "status < 400" check while returning nothing.
  Any reachability check in this programme must inspect the body, not the code.
- **The London Datastore's package_search ignores its q parameter** — a
  nonsense query returns the same count and the same first result as a real
  one. It manufactures false negatives. Use /api/v3/datasets/export.json and
  filter locally.

**TfL changes what is possible.** /StopPoint with a lat, lon and radius returns
naptanId, modes and named lines. Every previous programme has failed on
transit — San Francisco produced fifteen instances of "No source states a bus
route or a rail station", false in every case and now a banned pattern. London
is the first destination that can state the nearest station and the lines
serving it from a first-party source, and the finder briefs will require it.
