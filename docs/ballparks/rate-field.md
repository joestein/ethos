# Rate Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/rate_field_places.ex`
and `lib/ethos/seeds/rate_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Chicago White Sox research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/chicago-white-sox.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**6 places and 1 guide shipped** from 6 researched places.

---

## The venue name

**Rate Field**, not Guaranteed Rate Field. Confirmed verdict: *"The venue's
current name is 'Rate Field', shortened from Guaranteed Rate Field in December
2024"*, cited to `ballparksofbaseball.com/ballparks/rate-field/` and corroborated
by the naming-history verdict, which records the full chain: Comiskey Park II
(1991), U.S. Cellular Field (2003, ended seven years early for $13 million),
Guaranteed Rate Field (2017-2024), Rate Field (December 2024, after Guaranteed
Rate's corporate rebrand).

The name decides the module names, the file names, the place slug
(`rate-field`), the guide slug and the roster row. The dispatch named this one
in advance as a case recollection gets wrong.

**The residual is published too.** `could_not_establish` records: *"Whether any
sponsorship renaming more recent than the December 2024 'Rate Field' shortening
has occurred. The White Sox's own site (mlb.com/whitesox) returned HTTP 406 to
every fetch and could not corroborate the current name from the operator."* An
FAQ answer states it.

---

## The county citation, checked

The artifact's own `could_not_establish` flags the weakness before a reader
could:

> A county statement from a source that names the ballpark or Armour Square
> specifically alongside 'Cook County' in one sentence — the county fact rests
> on the general Chicago article plus the Armour Square community-area article,
> not on a Rate Field-specific source. Both were independently fetched, but
> neither is a ballpark-specific citation for county.

That is a narrower gap than it sounds, and the chain is three confirmed verdicts
long, each independently sourced:

1. *"The stadium sits in Chicago's Armour Square neighborhood, next to
   Bridgeport."* — `en.wikipedia.org/wiki/Rate_Field`
2. *"Armour Square is one of Chicago's 77 community areas and is in Cook
   County."* — `en.wikipedia.org/wiki/Armour_Square,_Chicago`
3. *"Chicago is the county seat of Cook County; a small part of the city
   (O'Hare) sits in DuPage County, which does not apply here."* —
   `en.wikipedia.org/wiki/Chicago`

The value is `"Cook County"`, taken from verdict 2, whose own `source_url` is
the article that contains it — the check the dispatch requires. Verdict 3
disposes of the O'Hare/DuPage exception inside the verdict itself rather than
leaving it to a reader. The gap is a *citation-shape* gap, not a factual one,
and it is recorded in the guide's moduledoc where the county is set.

---

## 1. The two things this artifact settles about licence registers

The verifier applied one rule across every tenant record, and it is the wave-1
Baltimore lesson in a different form.

> A Chicago business licence establishes a licensee at an address, a licensed
> activity, and a dated act — it does not establish present-day operation,
> because AAI status persists until expiry whether or not the business is
> trading.

In Baltimore the register was *empty* and eight claims collapsed as citations.
Here the register is real: the verifier ran two independent WebFetch queries
against the same API and *"reproduced the finder's numbers exactly, including
specific dollar amounts and dates"*. The claims still do not reach present-day
trading. **Five of six places therefore carry no trading claim.**

Only Rate Field is published as operating, and the verdict is explicit about the
basis:

> What does establish current operation here is the separate,
> independently-confirmed Wikipedia identity fact in present tense: 'The club
> plays its home games at Rate Field.' That is a dated, maintained encyclopedia
> article describing current occupancy, not a licence renewal. Publish 'open' on
> that basis, not on the licence.

The second thing the register settled is a **count**. See below.

---

## 2. The refutation: "four addresses"

The finder wrote that CHISOX CORPORATION holds Commercial Garage licences at
four addresses. Refuted:

> Re-querying the same legal-name filter against the same API returns CHISOX
> CORPORATION Commercial Garage licences, status AAI, at SEVEN current
> addresses, not four … The four addresses named are real and their dates check
> out exactly … so nothing named is wrong — but 'at four addresses' asserts an
> exhaustive count that the same register the finder cited contradicts.

The correction ships verbatim in substance: *"at least seven addresses"*, with
all seven named. The verifier ties it to the roster's attribution-tuple rule —
an undercount is a defect even when every named item is correct — and an FAQ
answer states the correction.

---

## 3. Places, against the verdicts they rest on

### rate-field — Rate Field (`stadium`)

`333 West 35th Street, Chicago, IL 60616` · `official_url: nil`

Six confirmed place verdicts and eight confirmed `history` items with
`about: "ballpark"`, all published: the address, the Armour Square location next
to Bridgeport and the White Sox tenancy; the April 18, 1991 opening as Comiskey
Park II at US$137 million (approximately $324 million in 2025 dollars) to HOK
Sport's design; the four-name chain and every figure in it; the upper-deck
setback, the gradual rise, the unobstructed views, "one of the highest upper
decks in baseball" and the unconnected concourse; the 2001-2007 $118 million
program with Phase III at ~$20 million and Phase IV at ~$28 million removing
eight rows and 6,600 seats and cutting capacity 47,098 → 40,615; the flat roof
20 feet above the seating covering 13 of 21 rows; the 2016 video boards at $7.3
million with a 60-by-134-foot centre board; the Illinois Sports Facilities
Authority as owner-operator and the Kentucky Bluegrass surface; and the build
across 35th Street from Old Comiskey with the plaque, the painted foul lines and
the 503 feet due north.

`official_url` is `nil` because the club's page returned HTTP 406 to every
fetch. A URL that could not be read is not published as an official one.

**Not published, on instruction.** `could_not_establish` reads *"Any
architectural style for the ballpark — do not supply one."* None is supplied.
The upper-deck description that does ship is a design account from a separate
confirmed verdict, not a style label. Also not published: the 2026 schedule,
ticket or tour prices (MLB.com HTTP 406), and anything about a sportsbook.

`status_verdict`: **open**, on the encyclopedia's present tense, not on the
Public Place of Amusement licence — which is confirmed and which the guide's
prose does not use as a trading claim.

### chisox-bar-and-grill — ChiSox Bar & Grill (`restaurant`)

`320 West 35th Street, Chicago, IL 60616` · `official_url: nil`

One confirmed verdict, published in full: the address, ILLINOIS SPORTSERVICE,
INC. as licensee, the three licence types and their AAI status, and the Armour
Square community area.

**No trading claim.** The verdict on status refutes the "open" label while
keeping the evidence: *"publish the record, the address, and the licence
history: say nothing about whether it trades today."* `could_not_establish` adds
that no history, opening date or menu exists beyond the licence record, and that
no source states whether the club or Illinois Sportservice as concessionaire
operates it. Both gaps are stated in the summary.

### cork-and-kerry-on-33rd — Cork and Kerry on 33rd (`restaurant`)

`3258 South Princeton Avenue, Chicago, IL 60616`

One confirmed verdict, published in full, including the licensee's legal name
(Chicago Pizza Department Corp.), the two licence types, the AAI status, the
fee paid on May 2, 2026 and licensure through June 15, 2028.

**No trading claim**, same reasoning. `could_not_establish` records that the
business's own domain does not resolve (DNS not found), which the summary states
rather than leaving the missing `official_url` unexplained.

### 35th-street-red-hots — 35th Street Red Hots (`restaurant`)

`500 West 35th Street, Chicago, IL 60616`

One confirmed verdict, published in full: 35TH STREET REDHOTS LLC, a Retail Food
Establishment licence, AAI, Bridgeport community area.

**No trading claim.** `could_not_establish` notes that no liquor licence was
found under this name at this address, so whether it serves alcohol is not
established — published as a stated gap rather than as an absence a reader might
read either way.

### bridgeport-art-center — Bridgeport Art Center (`attraction`)

`1200 West 35th Street, Chicago, IL 60609` · `https://bridgeportart.com`

Two confirmed verdicts, published: the own-site description of three galleries,
studios, a Fashion Design Center, the Chicago Ceramic Center and two event
venues; and the licence row for EAST BANK STORAGE ON 35TH STREET, INC. dba
BRIDGEPORT ART CENTER, three licence types, AAI, fee paid September 15, 2025,
licensure through January 15, 2028.

**Not published: the building's history or any style.**
`could_not_establish` is explicit on both — the operator's own site calls the
building *"historic and visually breathtaking"* with *"timber construction,
exposed brick and hardwood floors"* but *"a business's own site cannot establish
a superlative, and it does not state a build year or a former tenant"*, and
*"[a]ny architectural style — none is stated by a source that can establish
one."* The guide states the gap and names what the site says about the fabric,
attributed to the site, without the superlative.

**No trading claim.**

### old-comiskey-park-home-plate-site — Old Comiskey Park home plate marker (`historic-site`)

`324 West 35th Street, Chicago, IL`

Four confirmed verdicts, published in full: the original park's address,
neighborhood, architects (Zachary Taylor Davis with Osborn Engineering), July 1,
1910 opening, September 30, 1990 closing and 1991 demolition; the marble plaque
across from Rate Field, the painted foul lines and the 503 feet due north;
Veeck's exploding-scoreboard pinwheels across his 1959-1961 and 1976-1981
ownerships and the scoreboard and centre-field bleachers among the last
structures standing; and Disco Demolition Night of July 12, 1979 with the 47,795
official attendance, Veeck's own 50,000-55,000 estimate, the 9-0 forfeit ordered
by Lee MacPhail and the fact that it remains the last American League game to be
forfeited.

**Three gaps published as gaps**, all from `could_not_establish`: no ZIP could be
corroborated for the now-vacant address, no historic-landmark designation was
found for the site or the plaque, and no source dated to 2026 confirms the plaque
and painted lines are still physically present.

`status_verdict`: a real uncertain rather than a hedge — a physical marker has no
licence trail, and the encyclopedia's present tense is the only evidence.

---

## 4. The guide

`slug: rate-field-guide` · `destination: "Chicago, Illinois"` ·
`state: "Illinois"` · `county: "Cook County"`

### Getting there

Seven `getting_there` items: six confirmed, one refuted on the garage count and
shipped through its correction. Published: Sox-35th's address, Red Line
membership, Dan Ryan median position and the article's own statement that it
serves Rate Field and originally served Comiskey Park; the September 28, 1969
opening with the other eight Dan Ryan branch stations and the former "35-Sox
Park" sign; the one island platform, two tracks, dual overpass entrances and the
elevators and escalators; the four connecting CTA bus routes with their
weekdays-only qualifications; the Metra Rock Island 35th Street station at 106
West 35th Street in Bronzeville, quoted as *"located east of Rate Field"*; the
seven CHISOX CORPORATION garage licences; and the two further garages licensed to
DIAMOND GROUP 35, LLC and TRIPLE CROWN ENTERTAINMENT, LLC.

**No station, garage or bus route becomes a place record** — which matters here
more than usual, because the artifact names nine licensed garages and two rail
stations and not one of them is a page.

**Not published:** a parking price, which no source states; and any claim that
a licensed garage is operating on a given day.

### Around the ballpark

Organised by street number along West 35th Street, which is checkable. Every
address is a place record's own.

**Not published:** any spatial relationship no verdict states. A first draft
placed Cork and Kerry "a block off" 35th Street; nothing measures that, and it
was replaced with the street address. A second draft called the two stations
"one on each side" of the ballpark; only the Metra station's direction is
sourced, so the sentence now distinguishes them by system instead.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and
`about: "team"`: the 1894 founding as the Sioux City Cornhuskers, the 1900 move
as the Chicago White Stockings and the 1904 rename; the AL Central since 1994;
the three titles and the 88-year drought described as the longest in the American
League at the time; the 1919 Black Sox scandal with all eight players named,
Landis' August 3, 1921 ban and his quoted words; Carlos Rodon's April 14, 2021
no-hitter, the club's 20th; and the 21-game losing streak of July 10 to August 5,
2024.

### FAQ

Six questions. Four state a limit rather than filling space: the possibility of a
rename after December 2024, the absent parking price, the corrected garage count,
and why no trading claim is made for five of six places.

---

## 5. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was lost
  to that rule here; no confirmed verdict in this artifact states one.
* **No vague proximity.** Every spatial claim is a street address, a street the
  ballpark was built across, a named community area, a compass direction quoted
  from a source, or a distance in feet a source states.
* **No unsourced superlative, and no self-sourced one.** Three ship, all inside
  confirmed verdict text: "one of the highest upper decks in baseball", "the
  longest MLB championship drought in the American League" as described at the
  time, and the last forfeited American League game. One was struck as an
  own-site claim (Bridgeport Art Center's building).
* **No architectural style anywhere on this site.** Two `could_not_establish`
  entries — the ballpark's and Bridgeport Art Center's — instruct against
  supplying one, and none is supplied. That is the opposite of the Fenway case,
  where a verdict *did* state a style and it shipped; the rule turns on the
  verdict, not on the category.
* **No trading claim for five of six places**, named with the reason in the guide
  prose and in an FAQ answer.
