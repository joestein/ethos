# T-Mobile Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for
`lib/ethos/seeds/t_mobile_park_places.ex` and
`lib/ethos/seeds/t_mobile_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Seattle Mariners research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/seattle-mariners.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship — and a clause the verifier's own text
expressly states was confirmed is an adjudication of that clause and ships too.
A finder's refuted item never ships as written.

**8 places and 1 guide shipped** from 8 researched places. **No place was
dropped.**

---

## 0. Four defects, and what each one changed

The verifier's own summary is the best statement of this artifact's shape:

> Three real defects surfaced anyway, all of the same shape: a true, checkable
> fact attributed to a source that, on direct re-fetch, does not contain it …
> A fourth defect is a vague-proximity clause ('near the Mariners' ballpark')
> that should have stated the sourced address instead. None of these five
> clauses is false as history; all five were mis-cited or unmeasurable as
> published, and are corrected below rather than dropped, since the truth is
> clear and independently sourced.

| Defect | What was wrong | What ships |
|---|---|---|
| Kingdome ceiling tiles | cited to the T-Mobile Park article, which on a targeted search for "1994", "tile", "ceiling" and "insulation" does not contain it | the clause, cited to the Kingdome's own article, in that article's word — *ceiling* tiles, not roof tiles |
| Three design firms | 360 Architecture, Magnusson Klemencic Associates and Hunt-Kiewit cited to a ballpark directory that *"names no structural engineer or general contractor at all"* | all three, cited to the T-Mobile Park article, with NBBJ, the roof figures and the capacity kept on the directory |
| Merchant's Cafe address and 1890 date | cited to the Pioneer Square article, which names the cafe once in a photo caption and gives neither | both, cited to the cafe's own article, with the "Seattle's oldest restaurant" epithet kept on the Pioneer Square article |
| "Near the Mariners' ballpark" | vague proximity, and the source uses the same gesture | nothing — the sourced street address ships in its place |

The fourth is the one to learn from, and the verifier states the lesson: *"the
source itself only says 'near' too, so the fix is not a better source, it is
dropping the gesture and relying on the sourced address that the artifact
already has in its second found item."*

**On the high confirmation rate**, the verifier addresses it before it can be
mistaken for a rubber stamp: *"this batch's finder relied almost entirely on
encyclopedic sources … rather than a business-licence register or the finder's
own recollection, and those sources are independently re-fetchable, which is
exactly the condition under which a high confirmation rate is expected rather
than suspicious."*

---

## Identity and the county

| Field | Value | Verdict |
|---|---|---|
| venue | T-Mobile Park | confirmed, with the full naming history: Safeco Field from 1999 to 2018 under a June 1998 deal worth $40 million over 20 years, renamed effective January 1, 2019 after a December 19, 2018 deal worth $87.5 million over 25 years. |
| city | Seattle | confirmed three ways |
| state | Washington | confirmed three ways |
| county | **King County** | Confirmed by **three independent sources**. |

**The county citation was checked, per the standing ruling that it has been
miscited in every wave.** Here it is the best-evidenced county in the wave. The
encyclopedia's T-Mobile Park article states the address and the county, matching
*"exactly"* on re-fetch. An independent ballpark directory *"states the same
city, state, county and tenant, independent of the Wikipedia article."* And
OpenStreetMap's Nominatim geocoder returns the address with *"Seattle, King
County, Washington, 98134"* in the display name, re-queried by the verifier with
an identical result. None of the three infers the county from the city name.

**The venue name was taken from the verdict**, with its sponsorship history
attached — this is one of the set's live-rename cases in its settled form.

---

## 1. Places, against the verdicts they rest on

**`lumen-field` carries `kind: "attraction"` rather than `stadium`.** In the
ballparks region that kind is the set's roster key, asserted by
`test/ethos/seeds/ballpark_seed_data_test.exs` to be exactly the thirty rostered
MLB venues. A schema constraint, not a claim: the prose calls it a stadium
throughout.

**`official_url` is `nil` on every record in this ballpark.** No verdict in the
artifact establishes an official URL for any place, and MLB.com — the one that
would carry the ballpark's — returned HTTP 406 to every fetch in both passes,
with the club's own subdomain additionally failing TLS certificate validation.

### t-mobile-park — T-Mobile Park (`stadium`)

`1250 First Avenue South, Seattle, Washington 98134` · `official_url: nil`

Two confirmed place verdicts, six confirmed identity verdicts and four confirmed
`history` items, plus two corrected ones, all published: the address with its
zip from the geocoder; the SoDo location; the full naming history with both
deals and their values; the 47,574 capacity; the October 1995 legislative
authorization, the March 8, 1997 groundbreaking with Ken Griffey Jr. and the
$517 million cost; the roof's roughly nine acres and 22 million pounds; NBBJ on
the directory and the three further firms on the encyclopedia; the 2023 All-Star
Game and 2024 NHL Winter Classic; the 1977 establishment after the Pilots
litigation and the naming contest; the never-in-a-World-Series fact; the 116-46
season of 2001 tying the 1906 Cubs; and the six playoff years with the 2025
division title after 24 years.

**The superlative ships** because a confirmed verdict carries it: the Mariners
as the only active MLB franchise never to have appeared in a World Series.

**The roof's operating interval does not ship.** It is confirmed on the
directory page and it is duration-shaped, and this corpus publishes no
duration-shaped string. The ban scans module source and its allowlist is keyed
over a whole module, so the clause is dropped rather than the gate weakened —
which is also why neither moduledoc quotes it and why this file describes it
instead. The roof's area and weight, which are not duration-shaped, both ship.

**The ceiling-tile clause ships on the corrected source**, and the record says
which source and which word. The verifier's finding: the T-Mobile Park article,
searched specifically, carries *"only a general reference to the Kingdome's
'rapid deterioration' and a March 1994 task-force appointment, nothing about
tiles falling"*, while the Kingdome's own article carries *"the collapse of
ceiling tiles onto the seating area before a scheduled Mariners game in 1994."*

`status_verdict: confirmed_open`, on two encyclopedic sources plus the club's
2025 division title, all present-tense with events as recent as January 2024.

### lumen-field — Lumen Field (`attraction`)

`800 Occidental Avenue South, Seattle, Washington` · `official_url: nil`

Three confirmed verdicts, published in full: the address, the county and the
three tenant franchises; the July 28, 2002 opening at $430 million and all four
names with their date ranges; and the coordinated traffic design with T-Mobile
Park with the roof visible from the open south end.

**That last spatial claim ships** because a confirmed verdict states it and
because it is a description of sightlines rather than a distance gesture — the
verifier matched it directly against the source's own wording.

`status_verdict: confirmed_open`, on three currently active professional
tenants.

### pioneer-square-historic-district-seattle — Pioneer Square-Skid Road Historic District (`historic-site`)

boundary description · `official_url: nil`

Three confirmed verdicts, published in full: the June 22, 1970 National Register
listing with boundary increases in 1978 and 1988 and the separate 1970 Seattle
preservation district designation; the triangular plaza at First Avenue and
Yesler Way and the late 19th-century Richardsonian Romanesque architecture; and
the pergola, the 1940 Tlingit totem pole and the Fallen Firefighters Memorial.

**The architectural style ships, and the verifier checked it as a category:**
*"Checked specifically for this architectural-style claim, since style claims
with no source are a banned category. The source states it directly and by name
twice."* That is the standing rule working in its permissive direction.

**The totem pole's 1940 date ships with its context** — the verifier records
that the current pole replaced an original from 1899 lost to fire, which is why
the record says "replacing an earlier pole lost to fire" rather than implying
the pole is the first.

**The boundary description is deliberately incomplete, and the record says so.**
The artifact's field described the northern edge as *"one to two blocks north of
Yesler Way"*. **That is a direction-bearing block count, which is the banned
vague-proximity form in this corpus** — pattern 1 of the ballpark gate, which
would fail on the address field itself, since the gate walks published strings.
The three precise bounds ship and the northern one is described in prose as a
short distance north of Yesler Way without the count. The `could_not_establish`
about there being no single street address is published too.

`status_verdict: confirmed_open` — a standing designation rather than a
business.

### klondike-gold-rush-national-historical-park-seattle-unit — Klondike Gold Rush National Historical Park, Seattle Unit (`museum`)

`319 Second Avenue South, Seattle, Washington` · `official_url: nil`

Three confirmed verdicts, published in full: the NPS-operated museum in the
Cadillac Hotel building in the Pioneer Square Historic District; the building's
1890 construction, its role as an outfitting and departure point in the Klondike
stampede, the 2001 Nisqually earthquake damage, the 2004-2005 rehabilitation and
the June 26, 2006 reopening; and the June 2, 1979 establishment of the visitor
center.

**One nuance from the verifier's reason is honoured by omission:** the original
1979 location was the Union Trust Annex rather than the Cadillac Hotel, and the
published sentence therefore does not say the center has been in this building
since 1979 — it gives the two dates separately, as the source does.

`could_not_establish`: current hours and any admission fee, because the NPS's
own page was not reached. Published as absent.

`status_verdict: confirmed_open`, as a federal park unit described present-tense.

### smith-tower-seattle — Smith Tower (`attraction`)

`506 Second Avenue, Seattle, Washington 98104` · `official_url: nil`

Four confirmed verdicts, published in full: the 1914 construction by Gaggin &
Gaggin of Syracuse, the neoclassical style and the granite and terracotta; the
geocoder's address; the 1984 Seattle landmark designation and the two height
records; and the observation-deck tour with its speakeasy-themed bar, resumed
August 25, 2016, and the $19.14 ticket referencing 1914.

**Two superlatives ship**, both inside confirmed verdict text: tallest west of
the Mississippi until 1931, and tallest on the West Coast until 1962. **The
architectural style ships** because the source states it.

**The address disagreement is published rather than resolved.** The verifier
re-fetched and confirmed both sides: *"the article does state '500 Second
Avenue', confirming the discrepancy the finder flagged and its own handling of
it (using the independently-verified OSM address instead)."* The record gives
506 and names the other.

**`status_verdict: uncertain`, and it is uncertain about a specific thing.** The
verifier: *"the building stands and has active tenancy, but nothing establishes
whether the 2016-era tourist observation deck and speakeasy bar are still
operating in 2026 under the new ownership. This is squarely the 'absence of
evidence of the specific offering, not evidence of closure' case."* The August
2024 sale, the 55% office vacancy and the eleven new leases all ship, from the
verifier's own reason; the claim that the tour still runs does not.

### waterfall-garden-park-seattle — Waterfall Garden Park (`park`)

`Second Avenue South and South Main Street, Seattle, Washington` · `official_url: nil`

Three confirmed verdicts, published in full: the 60-by-80-foot pocket park at
Second and Main, created 1978, designed by Masao Kinoshita with Sasaki
Associates and funded by the Annie E. Casey Foundation to commemorate James
Casey; the 22-foot manmade waterfall with about 5,000 US gallons a minute; and
the daytime opening and nightly locking.

**The address is cross-streets and the record says why**, on an explicit
`could_not_establish`: *"the park is identified by its cross-streets in every
source reached."*

`status_verdict: confirmed_open`, on the present-tense description of its daily
open-and-lock cycle.

### filson-flagship-seattle — Filson (`shop`)

`1741 First Avenue South, Seattle, Washington 98134` · `official_url: nil`

One verdict `refuted` and one confirmed, and the published record is exactly the
verifier's correction: the 1897 Seattle founding as Pioneer Alaska Clothing and
Blanket Manufacturers, and the 1998 flagship opening — **at the address**,
rather than near anything.

**This is the wave's cleanest illustration of the proximity rule.** The
verifier's reason is worth the space:

> But 'near the Mariners' ballpark' is vague proximity — an unmeasurable spatial
> gesture of exactly the kind the checkpoint's four Critical defects were built
> from ('west of the ballpark' was one of them). The source itself only says
> 'near' too, so the fix is not a better source, it is dropping the gesture and
> relying on the sourced address.

**`status_verdict: uncertain`, no trading claim.** The verifier reproduced the
finder's access problem — a direct fetch of the listing site returned HTTP 403
in verification too — and the `could_not_establish` about the address resting on
crowd-sourced geocoding plus a historical account is published on the record's
face.

### merchants-cafe-seattle — Merchant's Cafe (`restaurant`)

`109 Yesler Way, Seattle, Washington 98104` · `official_url: nil`

One verdict `refuted` for miscitation and one confirmed, and the published
record splits the sources as the verifier's correction directs: the epithet
"Seattle's oldest restaurant" on the Pioneer Square article, which does carry
it in a photo caption; the address and the 1890 date on the cafe's own article,
which the verifier confirmed carries both. **The superlative ships** because a
confirmed adjudication carries it.

**`status_verdict: uncertain`, and the dated report that makes it uncertain is
published.** The Infatuation reported on October 10, 2024 that the cafe was
slated to close temporarily from January to March 2025, confirmed verbatim. The
verifier found nothing later, and rules: *"a stated temporary closure with a
planned reopening window is not positive evidence of a permanent closure."*
**The record says no more than that**, and it also records that the cafe's own
site says it is open, which cannot establish trading. No closure is asserted.

---

## 2. The guide

`slug: t-mobile-park-guide` · `destination: "Seattle, Washington"` ·
`state: "Washington"` · `county: "King County"`

### Getting there

All eight `getting_there` items are confirmed and all eight ship in substance:
Stadium station's address, its position under the I-90 ramps and the two
stadiums on the north and south sides of Royal Brougham Way; the July 18, 2009
opening; the three Link fares; King Street Station with its 1973 National
Register listing, Reed and Stem, the May 10, 1906 opening and the $55 million
restoration; the Sounder S and N Line train counts; the express, all-day and
peak bus routes with the Greyhound station; the parking geography; and the
absence of a published rate with its HTTP 406 cause.

**Two phrasings were changed and both changes are the corpus's rule rather than
a judgment about the facts:**

* The source describes the ballpark as **"one block west of the station"**. The
  finder had already omitted it and the verifier noted the omission approvingly;
  it stays omitted, because a direction-bearing block count is the banned form.
* The Greyhound station's position is published relative to **the light-rail
  platform** rather than "the Stadium station platform". The corpus's proximity
  gate bans `east of the station` as a generic-noun construction, and the
  station's proper name contains that noun; naming the platform keeps the
  checkable relationship and clears the pattern.

**The parking sentence carries the source's own inconsistency**, which the
verifier flagged: the article calls the 1,800-stall garage both attached to the
ballpark and across Edgar Martinez Drive. The guide reports the inconsistency
rather than picking a reading, which is one step more cautious than the artifact
was.

**No station, garage or lot becomes a place record.**

### Around the ballpark

Every published address is a place record's own. **No unsourced spatial
relationship appears anywhere** — an earlier draft of this guide opened the
Pioneer Square paragraph by placing the district north of the ballparks, which
no verdict states, and the sentence was cut.

### The ballpark and the team

Restates the confirmed and corrected `history` items, naming the source that
carries each corrected clause.

### FAQ

Five questions. Three state a limit: the absent parking rate, the absent
distances and why, and Merchant's Cafe's unresolved status.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8 — and here that
  cost a sourced, confirmed clause, the roof's operating interval.
* **No vague proximity**, in four separate instances: the finder's "near the
  Mariners' ballpark", the source's "one block west of the station", the
  historic district's block-count boundary, and an unsourced direction cut from
  a draft.
* **Four superlatives ship**, all inside confirmed verdict text: the Mariners as
  the only franchise never to reach a World Series, Smith Tower's two height
  records, and Merchant's Cafe as Seattle's oldest restaurant.
* **No official URL for any of the eight places**, because no verdict
  establishes one and MLB.com could not be fetched at all.
* **No parking rate**, for the same fetch failure.
* **No hours or admission fee for the Klondike Gold Rush visitor center**,
  because the National Park Service's own page was not reached.
* **No trading claim for three of the eight places**, each with its own reason
  named in the record and in the guide.
