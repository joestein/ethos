# Truist Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/truist_park_places.ex`
and `lib/ethos/seeds/truist_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Atlanta Braves research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/atlanta-braves.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship. A confirmed `status_verdict`'s
`reason` is itself a confirmed adjudication and is treated as one; a `refuted`
verdict ships nothing, including its correction.

**13 places and 1 guide shipped** from 13 researched places. **No place was
dropped.** The verifier counts 41 confirmed, 9 refuted and 1 uncertain across 51
verdicts.

---

## 0. The refutation pattern, stated first because it shapes eleven records

Six of the nine refutations are the same defect. The finder cited The Battery
Atlanta's **per-tenant subpages** — Coca-Cola Roxy, Silverspot Cinema, Mizuno
Experience Center, Baseballism, Yard House, Superica — and the verifier found
each of those pages to be a stale legacy page, several carrying literal January
2019 bylines and no tenant text at all. The **live directory indexes**
(`/shop`, `/dine`, `/play`), which the verifier re-fetched on 2026-08-30, do
list every one of those tenants.

The verifier's own summary: *"The underlying facts mostly held up; the citations
mostly didn't."*

**What that means for what ships.** Each tenant's current tenancy is carried by
its confirmed `status_verdict`, whose reason states the live-index listing in
the verifier's own words, so every tenancy ships. Each tenant's **street
address** appeared only inside the refuted `found` item and its correction, and
refuted verdicts ship nothing here — so **no tenant address is published**.
Truist Park and the Coca-Cola Roxy keep theirs, because a confirmed verdict
states each verbatim.

This is the one place in this ballpark where a different reading of the project's
rule would change the output. If a refuted verdict's *correction* is taken as
publishable text — the reading wave 1 applied at Wrigley and wave 2 applied to
Heritage Bank Center — then ten tenant records regain the address
`800 Battery Avenue SE, Atlanta, Georgia 30339`, and nothing else changes. It is
recorded here rather than decided quietly.

The other three refutations are substantive and are dealt with in §2 and §3: a
parking-space figure cited to a page that does not contain it, a
construction-versus-relocation sequencing error, and a transit-branding claim
the source does not make.

---

## Identity, the town, and the county

| Field | Value | Verdict |
|---|---|---|
| venue | Truist Park | *"The Braves' home ballpark is named Truist Park."* — confirmed, re-fetched, with the verifier noting "no more-recent renaming found anywhere else in this research". |
| town | **Cumberland** | *"Truist Park is situated in Cumberland, described as 'an edge city in Cobb County located in an unincorporated area of the northwest Atlanta metropolitan area,' roughly 10 miles northwest of downtown Atlanta."* — confirmed. |
| state | Georgia | as above |
| county | **Cobb County** | *"Wikipedia's article on the Atlanta Braves independently states the current home ballpark as Truist Park, in Cumberland, Cobb County, Georgia, opened April 14, 2017."* — confirmed, cited to `https://en.wikipedia.org/wiki/Atlanta_Braves`. |

**The county citation was checked, per the standing ruling.** The artifact's own
`county` field carries a value rather than an explanatory sentence, but the
value was still not taken from it. Two independent confirmed verdicts name Cobb
County, and the second one's cited source carries it in the verifier's own
quotation of the article: *"approximately 10 miles (16 km) northwest of downtown
Atlanta in the unincorporated community of Cumberland, in Cobb County,
Georgia."* The word "county" and the county's name are both on the cited page.
The verifier's summary independently records `county_settled: "Cobb County"`.

**The town is a judgment and is recorded as one.** The artifact's `city` field
is one of the ones that carries an explanatory sentence instead of a value:
*"Atlanta (postal/mailing city per official addresses; the ballpark itself sits
in Cumberland, an unincorporated community, not an incorporated city)."* Both
halves of that sentence are separately confirmed — the MLB.com address giving
Atlanta, and two verdicts placing the ballpark in Cumberland.

`town: "Cumberland"` ships, for one reason that is not stylistic: **the City of
Atlanta does not lie in Cobb County.** A record reading `town: "Atlanta"` beside
`county: "Cobb County"` would assert a jurisdiction that does not exist, and the
`town` and `county` fields are what group the destination hubs. The postal city
is published where the sources put it — inside the address line, exactly as
MLB.com states it — and both the guide moduledoc and an FAQ answer explain the
split.

**The venue name was taken from the verdict.** This artifact is one of the
sponsorship-rename cases the dispatch warns about, in its resolved form: the
ballpark opened as SunTrust Park and the current name is Truist Park, confirmed
twice and with the January 14, 2020 announcement date attached.

---

## 1. Places, against the verdicts they rest on

Addresses are rendered in the corpus's form — `Ave` expanded to `Avenue`, `GA`
to `Georgia`. That is a rendering, not a claim.

### truist-park — Truist Park (`stadium`)

`755 Battery Avenue SE, Atlanta, Georgia 30339` · `https://www.mlb.com/braves/ballpark`

Two confirmed place verdicts, three confirmed identity verdicts and three
confirmed `history` items, all published: the address as MLB.com gives it; the
April 14, 2017 opening as SunTrust Park and the January 2020 renaming; the
25-year naming-rights agreement and the January 14, 2020 announcement following
the SunTrust/BB&T merger that created Truist Financial; the Cumberland location
with the "edge city" and "unincorporated area" quotes and the ten-mile distance
northwest of downtown Atlanta; Turner Field from 1997 to 2016, built as the
85,000-seat Centennial Olympic Stadium for the 1996 Olympics and converted into
a 49,000-seat baseball-only park; and The Battery Atlanta's proposal, groundbreaking,
staged opening, roughly $400 million cost and Wakefield Beasley & Associates
architect credit.

`status_verdict: confirmed`, on a **corrected source**. The finder's evidence was
MLB's own ballpark page asserting that its own ballpark is in use, which cannot
establish trading; the verifier substituted the encyclopedia's Braves article,
re-fetched, which states in the present tense that the club's home is Truist
Park. The status verdict is confirmed on that basis, and the guide's closing
paragraph names the corrected source rather than the finder's.

The ten-mile distance ships and is not vague proximity: it is a distance in
miles with a compass direction from a named place, the checkable form the rule
protects.

### omni-hotel-battery-atlanta — Omni Hotel at The Battery Atlanta (`hotel`)

`address: nil` · `official_url: nil`

Three confirmed verdicts and one confirmed `history` item, all published: the
16 floors, the January 3, 2018 opening, the two-story restaurant, rooftop
hospitality suites and pool deck with views into the ballpark; the property's
"Stay" page listing it as one of two hotels with 236 rooms, 28 suites and over
20,000 square feet of meeting space; and the 50/50 ownership by the Braves and
Omni Hotels & Resorts.

**The room count is published as a disagreement.** The verifier: *"Wikipedia does
say 264 rooms; the property's own Stay page does say 236 rooms plus 28 suites.
Both quotes are accurate to their respective sources — this is a genuine
disagreement between two real sources, not a finder error."* Neither figure is
preferred here. The hotel's own page returned HTTP 403 and could not break the
tie, which the `could_not_establish` records and the record states.

`status_verdict: confirmed`, on the landlord's hub page being third-party
evidence for a tenant.

`address: nil` — no confirmed verdict carries one for this hotel.

### aloft-battery-atlanta — Aloft Atlanta at The Battery Atlanta (`hotel`)

`address: nil` · `official_url: nil`

One confirmed verdict, published in full: the property's "Stay" page lists the
Aloft as one of two hotels, re-fetched directly by the verifier.

**Nothing else ships, and the `could_not_establish` says why:** Marriott's own
Aloft property page returned HTTP 403 with a long retry-after, so no room count,
no exact address and no history could be confirmed.

That entry also carries a warning this author acted on. The property's own
marketing copy calls the hotel *"steps away from Truist Park"*, and the verifier
flags it in terms as *"a vague-proximity phrase that must not be carried into
published copy under the banned-proximity rule"*. It is not carried. The
corpus's proximity gate would have caught it — `steps from` is pattern 6 — but
the phrase never reached the module.

`status_verdict: confirmed`, on the same landlord-directory reasoning.

### coca-cola-roxy — Coca-Cola Roxy (`attraction`)

`800 Battery Avenue SE #500, Atlanta, Georgia 30339` · `https://cocacolaroxy.com/`

Two confirmed verdicts, published in full: the address and the Live Nation
operator, which the verifier accepts from the venue's own site because *"[t]his
is a plain existence/operator fact, not an award or trading-status claim"*; and
the standing-room capacity of 4,000, the roughly 40 music and comedy shows a
year, and the development with Live Nation.

A third verdict, on the property-directory listing, is **refuted** — the cited
subpage is content-free — and ships nothing. The current listing is published
instead from the confirmed `status_verdict`, whose reason states that the live
`batteryatl.com/play` index, re-fetched 2026-08-30, lists the venue.

### silverspot-cinema-battery-atlanta — Silverspot Cinema (`theater`)

`address: nil` · `official_url: nil`

Its only `found` verdict is **refuted**, on the stale-subpage defect, and ships
nothing — including the address. What ships is the confirmed `status_verdict`'s
reason: the live `batteryatl.com/play` index, independently re-fetched, lists
Silverspot Cinema among current entertainment venues.

`could_not_establish`: Silverspot's own domain could not be resolved (DNS
error), so the property directory is the only source. The record says so.

### mizuno-experience-center — Mizuno Experience Center (`shop`)

`address: nil` · `official_url: nil`

Same shape: the `found` verdict is refuted on the stale-subpage defect and ships
nothing; the confirmed `status_verdict` reason establishes the current listing
among retail tenants on `batteryatl.com/shop`.

**Not published:** any claim that this is Mizuno's only multi-sport experience
centre in the United States. The `could_not_establish` records that Mizuno's own
page returned HTTP 404 and the claim "could not be independently verified and is
not included". It is also a superlative with no confirmed verdict behind it,
which is independently disqualifying.

### baseballism-battery-atlanta — Baseballism (`shop`)

`address: nil` · `official_url: nil`

Same shape again, with one addition. The refuted verdict's correction states
that the description *"baseball-themed apparel retailer"* **"was not
independently verified on any source fetched"**, and the `could_not_establish`
adds that Baseballism's own retail-locations page listed no physical stores in
the content retrieved. **So the record does not say what the shop sells**, and
says that it does not, which is the honest form of the gap.

### yard-house-battery-atlanta — Yard House (`restaurant`)

`address: nil` · `official_url: nil`

Refuted `found` verdict, confirmed `status_verdict`: the live
`batteryatl.com/dine` index lists Yard House among current dining tenants. That
listing is the whole record.

### superica-battery-atlanta — Superica (`restaurant`)

`address: nil` · `official_url: nil`

Two verdicts, split. The first is refuted on the stale-subpage defect and ships
nothing. The second is **confirmed** and ships: *"Superica is chef Ford Fry's
restaurant concept, according to Wikipedia's article on The Battery Atlanta"*,
which the verifier reproduced as "chef Ford Fry's Superica restaurant". The
confirmed `status_verdict` adds the current dining-directory listing.

### garden-and-gun-club-battery-atlanta — Garden & Gun Club (`restaurant`)

`address: nil` · `official_url: nil`

One confirmed verdict, published in full: listed among the property's
restaurant and bar tenants and described on the property's own site as offering
specialty cocktails for evening entertainment. The verifier adds that it is
independently present on the current dining directory index.

`could_not_establish`: no dedicated page loaded any detail beyond the homepage
listing. The record says so, and no address is published.

### c-elletts-steakhouse — C. Ellet's Steakhouse (`restaurant`)

`address: nil` · `official_url: nil`

One confirmed verdict, published in full: listed among the property's
restaurants, with a Saturday jazz brunch, and the verifier's own reproduction of
the source — a "Jazz Duo plays from 11-3pm every Saturday and Sunday".

`could_not_establish`: the restaurant's own domain returned a self-signed
certificate error, no dedicated property subpage could be located, and *"address
is the general property address only"* — which is precisely why none is
published for it.

### achies-battery-atlanta — Achie's (`restaurant`)

`address: nil` · `official_url: nil`

One confirmed verdict, published in part and the part is the point. The item
reads: *"Achie's, located within the Omni Hotel at The Battery Atlanta, is
described by Wikipedia as chef Hugh Acheson's eighth restaurant."* The
verifier's reason confirms it and then draws a line inside its own source:

> Note: the item text restates only "eighth restaurant," not the James Beard
> award clause, and this verdict vouches only for what the item text restates —
> the award claim is not confirmed for publication by this verdict.

**The award is not published.** This is the governing rule stated by the
verifier against a clause sitting in the same sentence of the same source.

**`status_verdict: uncertain`, and no trading claim is made.** The verifier
notes the current dining directory does not list Achie's, and immediately rules
on it: *"per the hard rule an absence from a directory is not positive evidence
of closure — no closure notice, dated report, or successor tenant was found.
Uncertain remains the correct call."* That reason states a fact without
authorising its publication, so the directory absence is **not** published
either; what is published is the `could_not_establish` — that no independent,
dateable source confirming current operation was found. Uncertain trading does
not block publication and the identity is confirmed, so the place ships.

### antico-pizza-battery-atlanta — Antico Pizza (`restaurant`)

`address: nil` · `official_url: nil`

One confirmed verdict, published in full: the encyclopedia names Antico Pizza
among the restaurants at The Battery Atlanta — specifically, among the first
restaurants announced for the development.

**`status_verdict` upgraded from the finder's `uncertain` to `confirmed`**, and
the mechanism is worth recording: *"the finder looked only for a dedicated
per-restaurant subpage (which does not exist for this tenant) and did not check
the general directory index. The live batteryatl.com/dine index, independently
fetched 2026-08-30, explicitly lists 'Antico Pizza' among current dining
tenants."* The upgrade ships; the address, which no confirmed verdict carries,
does not.

---

## 2. The guide

`slug: truist-park-guide` · `destination: "Cumberland, Georgia"` ·
`state: "Georgia"` · `county: "Cobb County"`

### Getting there

Five of the seven `getting_there` items are confirmed and all five ship: the
absence of rail, on two independent sources; CobbLinc route 10A on weekdays and
the Cumberland Transfer Center's connections to MARTA bus route 12 and CobbLinc
routes 10, 10B, 20, 25 and 50, the last of which comes from the verifier's own
reason; the Braves' "circulator" bus system, confirmed verbatim; and the
oversized-vehicle parking rates with the club's own page carrying no standard
rate.

**Not published:**

* **The 11,000-space parking figure (`refuted`).** The verifier searched the
  cited page's full text twice, specifically for "11,000" and "spaces", and
  found neither: *"The 11,000 figure is real, but the citation is wrong — it
  does not appear on the cited page … This is the exact class of error the
  operating manual warns about."* The correction re-sources it to the
  encyclopedia. Only confirmed verdicts ship, so no space count appears, and the
  guide says why.
* **The Battery Atlanta's list of transit services (`refuted`).** The source's
  own sentence is a flat list; the finder read "Hopper" as the Cumberland
  Circulator's brand name, which nothing on the page says. The whole item is
  dropped rather than repaired.
* **"the nearby Cumberland Transfer Center"**, which is the confirmed item's own
  wording. The word "nearby" is an unmeasurable gesture, and the corpus's
  proximity rule bans those even when a source uses them — the wave-2 precedent
  where an adjacency a source stated as "immediately adjacent to" was dropped
  for want of a measured distance. The transfer centre is named; the gesture is
  not. Note this is stricter than the gate, which rejected a `nearby` pattern as
  cry-wolf after measuring 474 repo-wide hits.

**No station or lot becomes a place record.** The Cumberland Transfer Center is
prose, and so is the lot named in the oversized-vehicle rates.

### Around the ballpark

Every place in this section is a tenant of one development, and the section says
so before naming any of them. The only addresses published are Truist Park's and
the Coca-Cola Roxy's.

**Not published:** any spatial relationship among the thirteen places beyond the
containment the verdicts state — that these are tenants of The Battery Atlanta,
and that Achie's is within the Omni Hotel. In particular the Aloft's own
"steps away" copy is not carried, on the verifier's explicit instruction.

### The ballpark and the team

Restates the confirmed `history` items plus the naming and identity verdicts,
and states in terms which historical item was dropped and why.

### FAQ

Five questions. Four state a limit: the Atlanta-versus-Cumberland split, the
absence of rail, the absent standard parking rate and space count, the absent
tenant addresses, and Achie's unconfirmed trading status.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to it here; no confirmed verdict in this artifact states one.
* **No vague proximity.** Two spatial claims ship and both are checkable: the
  ten miles northwest of downtown Atlanta, and the containment of the tenants
  within The Battery Atlanta. The source's "steps away" and the finder's
  "nearby" are both dropped.
* **No superlative, ranking or award.** Three were available and none ships: the
  James Beard award the verifier expressly withheld, the Mizuno uniqueness claim
  it could not verify, and no other appears in a confirmed verdict.
* **No street address for eleven of the thirteen places**, for the reason set
  out in §0.
* **No official URL for eleven of the thirteen places**, because none was
  confirmed.
* **No trading claim for Achie's**, with the reason named in the module, in the
  guide prose and in an FAQ answer.
* **No description of what Baseballism sells**, because the verifier records that
  the description was not verified on any source fetched.
* **Nothing from any of the nine refuted verdicts**, including their corrections.
