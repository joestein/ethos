# Busch Stadium — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/busch_stadium_places.ex`
and `lib/ethos/seeds/busch_stadium_guide.ex`.

Committed on purpose: the research artifact lives under `.superpowers/`, which
`.gitignore` excludes.

Source: the 2026-08-30 St. Louis Cardinals research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/st-louis-cardinals.json`,
`verified: true`). The verifier re-fetched every cited source and records why
the confirmation rate is high without being a rubber stamp: the finder cited
primary and official sources for nearly every clause, kept its item text
narrower than the underlying source in places (it did not carry forward Salt +
Smoke's own "award-winning"), and surfaced its own gaps rather than papering
over them.

**11 places and 1 guide shipped** from 11 researched places.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Busch Stadium | *"The St. Louis Cardinals play at Busch Stadium."* — confirmed |
| city | St. Louis | *"The ballpark's address is 700 Clark Street, St. Louis, MO 63102 per the Cardinals' own MLB.com ballpark page."* — confirmed |
| state | Missouri | as above |
| county | **St. Louis** | *"St. Louis is an independent city in the U.S. state of Missouri, having separated from St. Louis County in 1877; it is not located within any county."* — confirmed |

**The county comes from the verdict, not from the artifact's field.** That field
holds a sentence — `"St. Louis (an independent city, not part of any county)"` —
rather than a value. The value the verdict settles on is `"St. Louis"`, and it
is what derives `/destinations/missouri/st-louis`, keeping the guide and its
eleven places on one hub. Publishing the parenthetical, or a blank, would break
every place breadcrumb on the site.

### The naming-rights refutation

Identity verdict #1 is **refuted**. The finder wrote that Wikipedia *"gives no
indication of any current sponsorship rename."* The correction: *"Wikipedia
states Anheuser-Busch's 20-year naming-rights deal was signed in 2004
(nominally running to 2024) and gives no information on renewal; the article is
not silent on sponsorship, it is silent on renewal."*

Published in exactly that shape, in the place record, the guide's closing
section and an FAQ answer. The distinction matters: "silent on sponsorship"
would invite a reader to conclude there is no deal.

### The address suffix

`could_not_establish`: *"A single canonical street-suffix form of the address —
MLB.com gives '700 Clark Street' and Wikipedia's infobox gives '700 Clark Ave';
both name the same address but the two sources disagree on suffix."* The
`address` field carries the club's own form and the summary states the other.

---

## 1. Places, against the verdicts they rest on

### busch-stadium — Busch Stadium (`stadium`)

Five confirmed place verdicts plus five confirmed `history` verdicts, all
published: the club and address; opening April 4, 2006 by exhibition and April
10 for the first Major League game; MetroLink Red and Blue service at the
Stadium station; capacity 46,861; the $365 million cost (about $583 million in
2025 dollars); groundbreaking January 17, 2004; Populous, formerly HOK Sport,
with Kennedy Associates/Architects Inc. and Jim Chibnall as lead designer; the
I-64/55/44 interchange, 7th and Clark, the Busch Memorial Stadium site; and Gate
3's Eads Bridge resemblance.

### st-louis-ballpark-village — Ballpark Village (`attraction`)

Four confirmed verdicts, published: the mixed-use development on the demolished
Busch Memorial Stadium site; Phase One March 27, 2014 and Phase Two from June
2020; the August 2026 tenant list in full; The Clydesdale listed to open August
27, 2026.

**`status_verdict` is `refuted`**, correction: *"Change status from 'open' to
'uncertain-leans-open' (or plain 'uncertain'), matching the treatment given to
Salt + Smoke and the Anheuser-Busch Brewery in this same file."* No trading
claim is published, and the tenant list is framed as the operator's own account
rather than as a current inventory.

**The missing venue is published as a conflict.** `could_not_establish`:
*"Wikipedia's article lists a 'Cardinals Hall of Fame and Museum' as a Ballpark
Village venue, but the operator's own current (Aug 2026) tenant list does not
mention it under that name — this batch could not determine whether it has
closed, relocated, or been renamed/absorbed … This is a genuine conflict between
two sources, not a confirmed closure."* The history field and an FAQ answer say
exactly that.

### st-louis-salt-and-smoke-ballpark-village — Salt + Smoke (Ballpark Village) (`restaurant`)

Three confirmed verdicts, published: the eight St. Louis-area locations by name;
the St. Louis-style barbecue, the signature rub, the cherry wood, the chicken,
brisket and pulled pork; the Ballpark Village tenant listing.

**No trading claim** — `still_trading: uncertain-leans-open`, both facts from
self-published sites. **No suite number**, because none could be found, and the
record says so. **"Award-winning" never entered the artifact**: the verifier
notes the finder declined to carry that self-praise forward from the
restaurant's own site, so there was nothing here to strike.

### st-louis-gateway-arch — Gateway Arch (`attraction`)

Confirmed and published: within Gateway Arch National Park under the National
Park Service; Saarinen's 1947 design; construction February 12, 1963 to October
28, 1965 at $13 million, about $98.4 million in 2024 dollars; opened to the
public June 10, 1967 and dedicated by Vice President Humphrey May 25, 1968; 630
feet, the world's tallest arch and the tallest memorial in the United States;
the west entrance facing Fourth Street and the Old Courthouse.

**Verdict #4 is `uncertain`** — the 70,000-square-foot underground visitor
centre and the Museum of Westward Expansion — with the correction *"Verify the
museum's opening year (1976 vs. 1977) … if unresolved, drop the year rather than
assert either."* Unresolved, so **no year is published**. The size, the museum
and the $176 million renovation finished July 2018 are published; the completion
year is not, and the record says why.

Two superlatives ship, both in confirmed verdict text.

### st-louis-old-courthouse — Old Courthouse (`historic-site`)

Six confirmed verdicts, published whole, **including three architectural
styles**: Federal for the 1828 core by Laveille & Morton, Greek Revival for
Singleton's 1839 addition, and Italian Renaissance for Rumbold's cast-iron dome
of 1861-1864 modeled on St. Peter's Basilica. Also Mitchell's 1851 redesign; 192
feet and Missouri's tallest habitable building 1864-1894; Dred Scott v. Sandford
and the 1857 ruling against Dred and Harriet Scott; the 1930 abandonment, the
donors' descendants' suit and the 1940 transfer; the four NPS history galleries
and the two restored courtrooms.

Style ships because verdicts state it. `address` is the facing street, because
`could_not_establish` records that no street number was sourced.

### st-louis-citygarden — Citygarden (`park`)

Four confirmed verdicts, published whole. `address` is the bounding streets, and
the record says both that and that current hours could not be confirmed.

### st-louis-kiener-plaza — Kiener Plaza (`park`) · `official_url: nil`

Six confirmed verdicts, published whole, including *"Adjacent to the Old
Courthouse and Gateway Arch National Park"* — a bordering description of a named
landmark, which the Giants verifier in this same wave ruled is not vague
proximity. `could_not_establish` records that no official site, hours or
admission policy could be sourced, and the record says so.

### st-louis-city-museum — City Museum (`museum`)

Five confirmed verdicts, published: the October 25, 1997 opening; Bob and Gail
Cassilly; the former International Shoe Company factory bought in 1993; the
whale, the Enchanted Caves, the Wurlitzer, the rooftop Ferris wheel and
MonstroCity; 300,000 visitors in two years and over 700,000 by 2010.

**`status_verdict` is `refuted`**, correction: *"Change status from 'open' to
'uncertain-leans-open'."* No trading claim. The artifact's own note is honest
about the gradient — *"a live current-day hours listing is a meaningfully
stronger signal than a static claim"* — and the record still declines to assert
it. No admission price, because none was retrieved.

### st-louis-union-station — St. Louis Union Station (`attraction`)

Seven confirmed verdicts, published whole: the September 1, 1894 opening;
Theodore Link and George H. Pegram; 31 tracks under an enclosed train shed; the
world's largest and busiest railroad station on completion; Amtrak's departure
October 31, 1978; National Historic Landmark 1970; the 1985 adaptive-reuse
renovation; the Grand Hall's gold-leafed ceiling, Romanesque arches, 65-foot
barrel vault and stained glass; Indiana limestone and a 230-foot clock tower;
the 567-room Curio Collection by Hilton hotel; the St. Louis Aquarium of
December 25, 2019 with more than 13,000 animals across over 250 species; the
200-foot Ferris wheel; and The Train Shed, The Pitch Athletic Club & Tavern and
the Soda Fountain.

**This place required a gate exemption, and it is the only one in this wave.**
`test/ethos/seeds/ballpark_seed_data_test.exs` fails any ballpark place whose
name matches `station|parking|garage|bus route|lot`, because thirty ballparks
would otherwise mint thirty subway-platform records. This building stopped
carrying trains in 1978 and is a National Historic Landmark holding a hotel, an
aquarium and a Ferris wheel — a destination with a paragraph of sourced content,
not infrastructure with an address.

The exemption is keyed on the exact slug, not on the pattern, and the test now
also asserts (a) that every exempted slug exists and (b) that the pattern still
fires on the exempted name. A stale pardon is how an allowlist quietly widens,
and both assertions exist to make that fail loudly.

**The MetroLink station of the same name mints no record** and is prose in
"Getting there". That is the rule working, not being bent.

### st-louis-lacledes-landing — Laclede's Landing (`historic-site`) · `official_url: nil`

Four confirmed verdicts, published whole, including *"the only remaining section
of St. Louis's 19th-century commercial riverfront"* — a superlative inside
confirmed verdict text — and *"Sits north of Gateway Arch National Park,
separated from it by the Eads Bridge"*, a sourced bordering relationship.

`could_not_establish`: *"The name of any specific business currently trading in
the district."* The record says so rather than implying the warehouses are full.

### st-louis-anheuser-busch-brewery — Anheuser-Busch Brewery (`brewery`)

Four confirmed verdicts, published whole: 142 acres and 189 buildings; National
Historic Landmark District and City of St. Louis Landmark; NRHP listing and NHL
designation November 13, 1966; red brick Romanesque; the Brew House of 1891-1892
with hop chandeliers, ironwork and natural light; the Clydesdales' exercise
field and carriage house; the Lyon Schoolhouse Museum; daily tours 10am-5pm in
five named formats with no price stated.

**Two addresses, unreconciled.** The artifact's `address` field is itself a
sentence recording the conflict: Wikipedia's infobox gives 721 Pestalozzi
Street, the brewery's own tour site gives 1200 Lynch St for the tour entrance.
The record uses the tour entrance and states the other.

**No trading claim.** `still_trading: uncertain-leans-open`; no independent
source confirmed current tour operation. The tour hours are published as what
the brewery's own site states.

---

## 2. The guide

`slug: busch-stadium-guide` · `destination: "St. Louis, Missouri"` ·
`state: "Missouri"` · `county: "St. Louis"`

### Getting there

Six confirmed `getting_there` verdicts, all published: MetroLink Red and Blue at
the Stadium station; the transit agency's own quoted sentence; the shared
16-station downtown alignment with Union Station, Civic Center, Stadium, 8th &
Pine, Convention Center and Laclede's Landing named; the Old Courthouse from 8th
& Pine; **no official parking price**, with the HTTP 406 responses recorded; and
**no confirmable bus route**, published in the verdict's own framing as *"a gap
in this batch's research, not a statement that no bus route exists."*

### Around the ballpark

Ordered by the MetroLink alignment the places sit on, which is a fact the
sources give rather than a distance this guide invented. No distance or
direction between two places is published except the sourced ones — Laclede's
Landing north of the Arch grounds across the Eads Bridge, Kiener Plaza adjacent
to the Old Courthouse.

The closing paragraph names the four places with no trading claim and says
plainly that this is not evidence of closure.

### The ballpark and the team

The confirmed `history` verdicts: the 1882 founding and the NL Central; the 11
World Series titles by year, second-most behind the Yankees, and 19 pennants,
third-most — both superlatives inside confirmed verdict text; the construction;
and the naming-rights correction.

---

## 3. What is absent from the whole site

* **No trip duration.**
* **No parking price** and **no bus route**, each published as a stated gap.
* **No trading claim** for Ballpark Village, Salt + Smoke, the City Museum or
  the brewery.
* **No visitor-centre completion year** for the Gateway Arch.
* **No "the article is silent on sponsorship"** — refuted and replaced by the
  correction's precise reading.
* **Two address disagreements and one venue conflict published as such**, not
  resolved silently and not read as closures.
