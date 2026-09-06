# Korean BBQ collection — design

**Date:** 2026-09-05
**Status:** approved, awaiting implementation plan

## Goal

Publish the corpus's first cross-city collection: at least 100 Korean BBQ
restaurants, each in a guide that can honestly claim it, all reachable from
`/c/korean-bbq`.

## What a collection is, and the constraint that follows

`collection_items` carries a `guide_id`. A collection is a list of **guides**,
not places, and `/c/:slug` renders guide items with blurbs. There is no way to
put 100 restaurants directly into a collection without changing the data model,
and changing it would make collections two different things at once.

So the collection holds ten Korean BBQ guides, and the restaurants live inside
those guides as entries. This is the Antique Trail shape — that collection holds
a trail guide *and* the town guide the trail runs through.

The mechanism that makes it work without duplicating place records is already
in the seeder: **seeding is three-pass at the directory level** — all files'
places, then all guides, then all links — so a guide's entries may reference
places another file owns. `GuideRunner.replace_entries!/2` resolves each entry
through `Places.get_place_by_slug!/1`, which raises on a miss rather than
skipping, so a wrong slug fails loudly at seed time.

## The definition, which is the whole collection

A restaurant qualifies **only if meat is cooked at the table on a built-in
grill** — set into the table, gas or charcoal, cooked by the diner or a server
in front of them.

Excluded however good and however Korean: tofu houses (BCD Tofu House, Cho Dang
Gol), fried chicken (Bonchon, Kyochon), Korean restaurants with no tabletop
grill, tasting-menu and modern Korean without a real grill, and anywhere the
meat arrives already grilled from the kitchen. All-you-can-eat is **in** where
the grill is at the table — AYCE is a pricing model, not a disqualifier.

This definition is not negotiable against the count. A city that yields eight
real ones is a better answer than a city padded to twenty, and a padded
collection would be lying about its own contents on the page where a reader is
most likely to check.

## Yield, measured 2026-09-05

A scoping wave measured every candidate city before this spec was written, the
way the London programme's did. Files are under `.superpowers/kbbq-scoping/`.

| City | Confirmed | Inside city limits | Uncertain |
|---|---|---|---|
| Los Angeles | 35 | 26 | 24 |
| San Francisco | 20 | 9 | 5 |
| Chicago | 18 | 10 | 5 |
| Manhattan | 15 | 15 | 6 |
| London | 13 | 13 | 22 |
| Seattle | 12 | 4 | 15 |
| Queens | 8 | 8 | 32 |
| Brooklyn | 6 | 6 | 5 |
| **Total** | **127** | **91** | **114** |

**91 in-city today; 100 comes from the uncertain column.** Those 114 are mostly
real restaurants whose grill evidence was not settled, not speculative
candidates. Queens' agent lost WebSearch entirely and reported 8 against 32
unresolved, so Queens is realistically 20–30. Los Angeles' 26 is explicitly a
floor with ~25 further City-of-LA candidates behind it.

## The ten guides

| Guide | state | county | est. places |
|---|---|---|---|
| Korean BBQ in Los Angeles | California | Los Angeles | 26 → ~40 |
| Korean BBQ in Manhattan | New York | Manhattan | 15 |
| Korean BBQ in Queens | New York | Queens | 8 → ~25 |
| Korean BBQ in Brooklyn | New York | Brooklyn | 6 |
| Korean BBQ in London | England | London | 13 → ~20 |
| Korean BBQ in Chicago | Illinois | Cook County | 10 |
| Korean BBQ in Chicago's North Suburbs | Illinois | Cook County | 8 |
| Korean BBQ in San Francisco | California | San Francisco | 9 |
| Korean BBQ in the South Bay | California | Santa Clara | 11 |
| Korean BBQ in Puget Sound | Washington | Puget Sound | 12 |

Routing needs nothing new: `/destinations/:state_slug/:county_slug` is driven by
each guide's `state` and `county`. A non-county value in the county field is
already precedented — Rome carries county "Rome" and Vatican City carries
"Vatican City" — which is what lets "Puget Sound" sit there honestly, since the
region spans King, Snohomish and Pierce counties and no single county name is
true of it.

Seed files live in a new `priv/seed_data/korean_bbq/` directory, one per guide,
seeded by a new `Ethos.Release.seed_korean_bbq/1`.

### Guide shape

A subject page, not an area page, and the shape differs from every previous
corpus accordingly:

- `tier: "guide"`, `title` ≤ 120 characters, `intro` 100–160 words.
- **Sections: 2 to 4, grouped by cluster, and there is no "Getting there".**
  Every previous gate required that heading because every previous guide was an
  area page a reader travels to. These are subject pages, and the clusters are
  what a reader navigates by: Manhattan's sections are "W 32nd Street" and
  "Beyond Koreatown"; Puget Sound's are its four corridors. A page that lists
  forty restaurants in one undifferentiated run has failed even if every fact is
  sourced — the failure London's section rule exists to prevent.
- `faq`: 4–6 entries. At least one must answer what tabletop Korean BBQ is and
  what this collection counts, because that is the question the definition
  raises and the page should answer it once rather than defend it forty times.
- Every place: `kind: "restaurant"`, a real street address, `town` naming the
  **physical municipality** rather than the postal one, and a summary that names
  the grill.
- `links`: 2 or more, to the neighborhood guides this page's restaurants sit in
  and to sibling Korean BBQ guides. Targets are checked against the real set of
  guide slugs.
- `entries`: one per restaurant the page presents, including those whose place
  records another file owns.

## Where each restaurant's place record lives

Two cases, decided by whether the corpus already covers the ground.

**A neighborhood guide exists** — the restaurant becomes a place **and an entry
in that neighborhood file**, and the Korean BBQ guide carries a second entry
pointing at the same place. One place record, two pages. Jongro joins
`manhattan/koreatown.json`; the Richmond cluster joins
`san_francisco/inner-richmond.json`; London's confirmed thirteen join their
borough files.

The entry must be added alongside the place. A place added to a seed file
*without* an entry is orphaned — it exists but no guide links it, which is what
happened to 450 Rome places in production and is invisible to an HTTP check.

**No neighborhood guide exists** — the Korean BBQ file owns the place outright.
This covers all of Los Angeles, Chicago, Chicago's North Suburbs, the South Bay
and Puget Sound, and it also covers gaps inside cities we do cover:

- **Queens has no Murray Hill, Auburndale or Little Neck guide**, and the Kimchi
  Belt's densest single block is 149th Place at 41st Avenue in Murray Hill —
  Hahm Ji Bach, New Kum Sung, Han Joo, Daori, with Mapo a block away. Those
  places are owned by the Korean BBQ file. `flushing`, `bayside` and
  `douglaston` do exist and take theirs.
- **San Francisco has `inner-richmond` but no Central or Outer Richmond guide.**
  Restaurants on the outer Geary/Clement stretch are owned by the Korean BBQ
  file rather than absorbed into Inner Richmond, because absorbing them would
  assert a containment that is false.

This half of the work **edits files that are live in production** — five
corpora, two of them (San Francisco, London) behind gates that will re-run. It
is the riskiest part of the project and gets its own reviewed wave.

## Geography rulings

Each is a scoping-wave finding, recorded here so a later wave cannot quietly
undo it.

**Puget Sound, not Seattle.** Four confirmed restaurants are inside Seattle's
city limits — Meet Korean BBQ (Capitol Hill), Baegopa (Chinatown-ID), Son of a
Butcher (Eastlake), ONMI (Aurora Ave N) — and the number is fragile: Palmi,
Trove and Girin are all gone. The region's Korean BBQ is four suburban
corridors: Pacific Highway S through Federal Way, Highway 99 through Lynnwood
and Edmonds, S Tacoma Way through Lakewood (Pierce County, ~40 miles), and
Aurora Ave N in Shoreline. **Yetgol Old Village prints a "Seattle, WA 98133"
mailing address and is physically in Shoreline, north of N 145th St** — the
corpus uses physical location, never the postal address.

**Chicago's Koreatown has collapsed, and the city page must not pretend
otherwise.** Korean businesses on Lawrence Avenue fell from 158 to 50 between
1997 and 2017; Kang Nam and Gogi are closed; Ssyal and Dancen have no tabletop
grills. Ten qualifying restaurants are inside the city but scattered — Chinatown
(Daebak, Jiang Niu, Shinhwa), Wicker Park (Iron Age, Daebak), the West Loop
(Perilla), Streeterville (Wu's) — with only three on the north-side corridor.
Niles, Morton Grove, Glenview and Northbrook are separate incorporated
municipalities and get their own page. Albany Park, Lincoln Square and North
Center **are** community areas of the City of Chicago and belong on the city
page.

**Los Angeles needs no fudging, and two traps.** Koreatown is inside the City of
Los Angeles — Vermont to Western, 3rd to Olympic — and 23 of the 26 in-city
restaurants are in it or the adjacent Wilshire/Western corridor. **Northridge
and Van Nuys are LA neighborhoods, not separate cities**, so their branches are
legally City of Los Angeles despite being 20 miles north; a later wave will get
this wrong if it is not told. Torrance, Cerritos, Alhambra, Glendale, West
Covina, Temple City and Arcadia are separate incorporated cities; Rowland
Heights is unincorporated and belongs to no municipality. **Buena Park and
Garden Grove are Orange County entirely**, 25–30 miles away, and appear on no
page in this collection.

**Manhattan is nearly a synonym for Koreatown.** Twelve of fifteen sit between
W 31st and W 36th, Broadway to Madison; eleven are on W 32nd Street or the two
blocks of Fifth Avenue east of it. Three sit outside — Cote (16 W 22nd,
Flatiron), Nubiani's second location (243 E 58th, Midtown East), Yoon Haeundae
Galbi (W 36th). Of the four Korean places the corpus already owns in Koreatown,
**only New Wonjo qualifies**; Cho Dang Gol is a tofu house, HanGawi is
vegetarian, Osamil has no tabletop grill.

**Queens' belt does not stop at the city line.** The Kimchi Belt runs east from
Flushing along Northern Boulevard through Murray Hill, Auburndale, Bayside,
Douglaston and Little Neck — and continues into Nassau County, which is outside
New York City and outside this page.

**Brooklyn is a complete census, not a best-of.** Six locations, five operators,
four of sixty-nine neighborhoods, two of them branches of a national AYCE chain.
The page must not imply Brooklyn is a Korean BBQ destination. The Infatuation's
fifteen-restaurant NYC guide lists exactly one Brooklyn entry.

**San Francisco is a nine-entry cross-city page and has no Koreatown.** Three
clusters share no walking radius: the Richmond's Geary/Clement corridor (four),
Inner Sunset's 9th Avenue (two), Japantown's Post Street (two), plus ABSteak in
Union Square. The SF Chronicle's April 2026 top-20 Bay Area Korean list makes
six San Francisco picks and **not one is a tabletop-grill restaurant**; every
tabletop pick it makes is Santa Clara, Sunnyvale or Fremont — which is why the
South Bay gets its own page.

**London's Korean BBQ is not where London's Koreatown is.** All thirteen
confirmed are scattered across nine boroughs — Westminster 5, Camden 2,
Islington 2, and one each in Lewisham, Greenwich, Newham and Merton — and **not
one is in New Malden**. New Malden has roughly eighteen Korean businesses on and
around its High Street and Burlington Road, but they are fried-chicken shops,
noodle houses, rice-cake shops, pocha and dish-based restaurants, and all eleven
venues that might plausibly have a grill sit behind blank or dead websites.

**The London page ships its thirteen and says nothing about the gap.** No
apology and no explanation: the research-method ban forbids telling a reader
what research could not reach, and the self-reference ban forbids the page
adjudicating its own coverage. New Malden is simply absent until a source
appears. Because New Malden is in the Royal Borough of Kingston upon Thames,
which is inside Greater London, nothing has to be exiled to a separate town —
the municipality problem that breaks Seattle and Chicago does not exist here.

## The gate

`test/ethos/seeds/korean_bbq_seed_data_test.exs`, landing dark behind
`@moduletag :pending_korean_bbq` over a `priv/seed_data/korean_bbq/` holding
only `.gitkeep`, and removed in two stages as every predecessor was.

It inherits **five** of the seven prose bans with their self-tests and specimen
lists: research method, editorial self-reference, superlative, proximity and
photo policy. Two do not carry over and are deliberately dropped rather than
inherited unexamined — **designation citation**, because a restaurant has no
NHLE number and the rule would fire on the ordinary word "listed"; and the
**transit negative**, because these guides are subject pages rather than area
pages and carry no "Getting there" section for it to police.

The superlative ban matters more here than anywhere. Restaurant writing is made
of rankings, and "the best Korean BBQ in Los Angeles" is exactly the sentence
this corpus does not write. A price, a founding date, a count of grills and a
published closing time are facts and all publish.

Three assertions are specific to this collection:

1. **Every place's prose names the grill.** The definition made mechanical: a
   place whose summary cannot say the meat is cooked at the table does not
   belong in this collection. This is the assertion that stops a later wave
   quietly re-admitting a tofu house.
2. **Every place is `kind: "restaurant"`.** Read off `Ethos.Places.Place.kinds/0`
   rather than copied, so the two cannot drift.
3. **The collection holds every Korean BBQ guide, and the corpus totals at least
   100 places.** The target asserted rather than hoped for.

It also carries the assertions that closed gaps found by shipping London:
link targets checked against the real set of guide slugs rather than a shape,
guide slug matching its own filename, entries resolving, and destination-slug
collision checked against every committed destination.

**The ≥100 assertion can fail honestly.** If verification lands 96, the gate
goes red and the decision is the user's — extend to Atlanta (Duluth/Gwinnett)
and northern Virginia (Annandale), the next largest Korean-American centres, or
lower the number. The definition does not move to make the number.

## Waves

1. **Verify** — all 114 uncertain candidates, and re-confirm the 127. One agent
   per city, adversarial: the job is to refute a tabletop grill, not to find
   one. This is the phase that turns 91 into 100+, and where Queens gets its
   real number.
2. **Arbitrate** — one arbitrator, not several blind ones. Municipality
   assignment against the rulings above, slug collisions against every place in
   the corpus, and which neighborhood file each restaurant joins. One
   arbitrator per wave is the rule three programmes have now paid for: Rome ran
   three in parallel and it cost a real collision.
3. **Author** — ten guides in parallel, then a separate reviewed wave for the
   neighborhood-file patches, because that half edits production files.
4. **Collection and destinations** — `Ethos.Seeds.KoreanBbqCollection`, and
   destination records for Washington and Illinois.
5. **Photos** — one per guide, under `priv/photos/`, by the fragment pattern:
   parallel agents write fragments, a coordinator merges serially.
6. **Deploy** — commit, push, deploy, seed, verify live by counting `/p/` links
   per guide and confirming the collection lists all ten.

## Testing

- The gate above, run against every committed file.
- `Ethos.Release.seed_korean_bbq/1` gets a release test asserting the directory
  literal by equality — `priv/seed_data/korean_bbqs` would seed nothing, raise
  nothing and report success.
- A collection test asserting `/c/korean-bbq` resolves and holds ten items.
- The full suite, which re-runs the San Francisco and London gates over the
  neighborhood files this project edits.

## Out of scope

Neighborhood programmes for Los Angeles, Chicago or Seattle. Each city enters
the corpus as a single-subject destination and can grow later. Extending the
data model so collections can hold places directly.
