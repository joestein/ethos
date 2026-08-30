# PNC Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/pnc_park_places.ex`
and `lib/ethos/seeds/pnc_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Pittsburgh Pirates research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/pittsburgh-pirates.json`,
`verified: true`), adjudicated by an independent adversarial verifier. The
verifier's own count is **30 of 46 items confirmed (~65%)**, and its note gives
the reason: two identity/proximity claims were miscited to sources that do not
contain them, and several own-site superlatives were correctly excluded.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**7 places and 1 guide shipped** from 7 researched places.

---

## Identity and the county field — the miscitation this wave was warned about

| Field | Value | Verdict |
|---|---|---|
| venue | PNC Park | *"PNC Park is the home ballpark of the Pittsburgh Pirates … located at 115 Federal Street, Pittsburgh, Pennsylvania, in Pittsburgh's North Side/North Shore area."* — confirmed. The naming-rights verdict adds *"a 2021 extension runs the naming-rights agreement through 2031, so PNC Park is the venue's current name."* — confirmed. |
| city | Pittsburgh | as above |
| state | Pennsylvania | as above |
| county | **Allegheny County** | **refuted, and re-sourced by the correction.** |

The finder's county item read *"PNC Park sits within the North Shore
neighborhood of Pittsburgh's North Side, which the article situates in Allegheny
County, Pennsylvania"*, cited to `en.wikipedia.org/wiki/Pittsburgh_Pirates`. The
verifier fetched that article targeted specifically at a county mention and
reported: *"No county is mentioned anywhere in the ballpark description or
surrounding text."* Refuted, with the correction:

> Re-cite the county attribution to `https://en.wikipedia.org/wiki/PNC_Park`
> (infobox owner "Sports & Exhibition Authority of Pittsburgh and Allegheny
> County"; smoking-ban sentence naming Allegheny County) or to
> `https://en.wikipedia.org/wiki/North_Shore_(Pittsburgh)` ("Allegheny County,
> Pennsylvania"). Do not cite Pittsburgh_Pirates for this fact.

This is the exact case the wave-2 dispatch names. The **value** is unchanged —
`"Allegheny County"` — and the **citation** is taken from the surviving
correction, whose two named URLs are the ones that carry the county. The
artifact's `county` field agreed with the answer and would have shipped the
wrong source with it.

---

## A ruling this ballpark forced: `uncertain` verdicts that carry a correction

Wave 1 established the Wrigley precedent: a **refuted** verdict whose correction
names publishable text ships that text and nothing else. Three verdicts here are
**`uncertain`** rather than refuted while carrying exactly that shape — the
verifier's `reason` states in terms which clauses were confirmed verbatim and
which were not, and the `correction` names what to drop.

They are treated the same way, and each is listed below with what shipped and
what did not:

1. **The architect item.** *"…based in Kansas City, in collaboration with the
   Pittsburgh firm L.D. Astorino & Associates."* Reason: *"The Kansas
   City/Populous/HOK Sport attribution is confirmed verbatim … L.D. Astorino &
   Associates' involvement as co-designer is confirmed. But … 'contains no
   description identifying them as Pittsburgh-based or local.'"* Correction:
   drop "the Pittsburgh firm". **Published:** "Kansas City-based Populous, then
   HOK Sport, designed it in collaboration with L.D. Astorino & Associates."
   **Not published:** that Astorino is a Pittsburgh firm.
2. **The National Aviary item.** Reason: the bird-focused zoological-facility
   description *"is confirmed on the site"*; the AZA accreditation is *"[s]uggestive
   but not established"*. **Published:** a zoological facility focused on birds.
   **Not published:** accreditation.
3. **The parking item.** Reason: the garage name, its three named entrance
   streets, the absence of a published rate and the referral to ParkPGH.org and
   ALCO Parking Corporation are *"all confirmed verbatim"*; the named surface
   lots *"found none of these lot names present on the fetched page content"*.
   **Published:** the garage, the entrances, the absent rate, the referral.
   **Not published:** Gold 1, 2, 4, Red 5, the 7 Lots, Green 21-23.

Nothing ships from an `uncertain` verdict that the verifier's own reason does
not state was confirmed.

---

## 1. Places, against the verdicts they rest on

### pnc-park — PNC Park (`stadium`)

`115 Federal Street, Pittsburgh, PA 15212` ·
`official_url: https://www.mlb.com/pirates/ballpark`

| Published | Verdict |
|---|---|
| home ballpark of the Pirates at 115 Federal Street, North Side / North Shore | confirmed, verbatim |
| National League Central, home games here since 2001, on the banks of the Allegheny River | confirmed, verbatim |
| "a two-deck ballpark, the first built in the United States since 1953, … Kasota limestone facade and steel … natural Kentucky bluegrass playing surface" | confirmed, verbatim. The "first since 1953" is the source's own and rides inside the verdict. |
| home dugout on the third-base line so the Downtown skyline is visible behind the field | confirmed, verbatim |
| capacity 38,747 | confirmed, verbatim ("38,747 (2018-present)") |
| groundbreaking April 7, 1999; opened March 31, 2001; roughly 24 months of construction | confirmed, verbatim |
| Kansas City-based Populous (then HOK Sport) with L.D. Astorino & Associates | **uncertain with correction**; see the ruling above |
| PNC naming rights, August 1998, $30m over 20 years, extended 2021 through 2031 | confirmed, verbatim |
| the four statues — Wagner, Clemente, Stargell, Mazeroski | four separate confirmed verdicts, each verbatim |
| "The Roberto Clemente Bridge, formerly the Sixth Street Bridge, stands near the southeast corner of the site." | **refuted with correction.** The finder cited mlb.com; a targeted fetch returned *"Roberto Clemente Bridge/Sixth Street Bridge: No mention found."* The correction re-cites to the PNC Park article, which places it *"near the southeast corner of the site of the park"* — the correction's own wording, and what ships. |
| the three rankings — ESPN's Jim Caple at 95/100, the 2017 Washington Post panel at second, ABC News' America's 7 Best Ballparks in 2010 | three confirmed verdicts. Third-party rankings, each attributed to the body that made it. |

`status_verdict: open` — the only trading claim this site makes.

**Not published:** any parking price (see the guide).

### andy-warhol-museum — The Andy Warhol Museum (`museum`)

`117 Sandusky Street, Pittsburgh, PA 15212`

Verdict #0 is **refuted**: *"'Largest collection… in the world' is a superlative
sourced only to the museum's own site … which per the research contract cannot
establish a superlative about itself."* Correction: *"Drop the superlative. The
museum's own site can establish that it exists, what it holds, and its address —
e.g. 'The Andy Warhol Museum explores Warhol's life and legacy through its
collection of his art and archives.'"* The correction's sentence is what ships.

Verdict #1 confirmed: North Shore, the same neighborhood as PNC Park and
Acrisure Stadium.

**`status_verdict: uncertain`**, `could_not_establish`: the founding/opening
date. No trading claim.

### kamin-science-center — Kamin Science Center (`museum`)

`One Allegheny Avenue, Pittsburgh, PA 15212`

Confirmed and published: the current name, and the museum's own statement that
it was formerly the Carnegie Science Center; the USS Requin (SS 481), a Cold
War-era submarine, on display.

**Refuted with correction:** *"Drop 'Pittsburgh's most-visited museum' unless an
independent source … is found. Keep: 'Kamin Science Center features five floors
of interactive STEM exhibits.'"* The keep-list is what the summary carries. The
verifier notes the rule turns on the source, not the hedge — attributing a
ranking to "its own site" does not rescue it.

A fourth verdict is **refuted** on a different point: the North Shore Connector
article supports *"Allegheny station serves … visitors to the Acrisure Stadium …
the Carnegie Science Center"*, but a targeted fetch confirmed the word "Kamin"
appears nowhere in it — the parenthetical was the finder's. The guide therefore
states the station's service using the article's own name for the museum and
attributes the rename to `kaminsciencecenter.org`, which is where the correction
puts it.

**`status_verdict: uncertain`**, `could_not_establish`: the founding year. No
trading claim.

### national-aviary — National Aviary (`attraction`)

`700 Arch Street, Pittsburgh, PA 15212`

**Uncertain with correction** on the identity item; see the ruling above. A
zoological facility focused on birds ships; accreditation does not.

Confirmed and published: *"National Aviary references 46 years of Andean Condor
conservation work, indicating decades of operation, though no specific founding
date is given."* Published in those terms, including the absence of a date.

**`status_verdict: uncertain`.** No trading claim.

### mattress-factory — Mattress Factory (`museum`)

`509 Jacksonia Street, Pittsburgh, PA 15212`

Two confirmed verdicts, both published in full: an artist-centered contemporary
art museum and international residency program focused on installation art; a
Greer Lankton Collection.

**`status_verdict: uncertain`**, `could_not_establish`: founding date and
institutional history. No trading claim.

### federal-galley — Federal Galley (`restaurant`)

`200 Children's Way, Pittsburgh, PA 15212`

**Refuted with correction.** Reason: *"The four vendor names, full-service bar,
and shared seating are all confirmed verbatim on the cited page. But a direct
fetch targeted at the 'North Shore' characterization found: 'the content does not
explicitly reference the North Shore location by name — only the address … is
provided.'"* Correction: cite the neighborhood to the Wikipedia North Shore
article, or drop it.

**Dropped.** The address already carries zip 15212, and the identity verdict
independently establishes that 15212 is the North Shore's zip; attaching the
neighborhood to this record would have required a second inference the record
does not need. The four vendors, the bar and the shared seating ship.

**`status_verdict: uncertain`.** No trading claim.

### rivers-casino-pittsburgh — Rivers Casino & The Landing Hotel (`hotel`)

`777 Casino Drive, Pittsburgh, PA 15212`

One confirmed verdict, published in full: a casino and hotel property on
Pittsburgh's North Shore with gaming tables, slot machines, a sportsbook, dining
and an event center.

**`status_verdict: uncertain`**, `could_not_establish`: *"Opening date; no source
stating distance or walkability from PNC Park was found, so no proximity claim
is made. Noted approvingly: the finder correctly declined to fabricate a
vague-proximity claim here."* The record and the guide both say so explicitly
rather than leaving a silence a reader might fill.

---

## 2. The guide

`slug: pnc-park-guide` · `destination: "Pittsburgh, Pennsylvania"` ·
`state: "Pennsylvania"` · `county: "Allegheny County"`

### Getting there

Seven of eight `getting_there` items ship. Confirmed and published: the North
Side station underground near General Robinson Street and the elevated Allegheny
station, both opened on the North Shore Connector in spring 2012; the
Connector's Blue, Red and Silver lines under the river from Gateway; the
pay-on-entry / pay-on-exit system and the Downtown / North Shore free-fare zone
covering PNC Park; roughly 95 bus routes across Allegheny County on a flat fare
since 2017, ConnectCard or cash, time-based transfers across bus and rail; I-279
exit 1B and within one mile of I-376 and I-579; and the three bridges by which
the North Shore borders Downtown.

The Roberto Clemente Bridge sentence ships through its correction, re-cited to
the PNC Park article. The parking item ships in part, per the ruling above.

**No station, garage, lot or bus route becomes a place record.**

### Around the ballpark

Every address is a place record's own published address. The neighborhood
paragraph rests on two confirmed verdicts: the North Shore's zip 15212 and its
three named venues, and the Smoky Island / Killbuck Island history.

**Not published:** any spatial relationship between the casino hotel and the
ballpark. The guide states that absence rather than passing over it.

### The ballpark and the team

Restates the confirmed `history` items with `about: "ballpark"` and
`about: "history"`, plus the identity verdict that places the Pirates in the
National League Central at PNC Park since 2001. The rankings paragraph names the
ranking body each time, because that is what makes them publishable.

### FAQ

Seven questions, each answered only from the verdicts above. Three of them —
parking, the Warhol superlative, the aviary's accreditation — state what could
not be established rather than filling the space.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to that rule here: "roughly 24 months of construction" is a build period
  rather than a journey, and no confirmed verdict in this artifact states a
  travel time.
* **No vague proximity.** Every spatial claim published is a street name, an
  interstate exit, a distance in miles, a bordering relationship or a
  neighborhood a verdict names. The casino hotel's relationship to the ballpark
  is stated as unestablished.
* **No superlative sourced to the party it flatters.** Two were struck, both
  own-site claims. Four ship, all inside confirmed verdict text and all
  third-party or factual: the first two-deck ballpark built in the US since
  1953, and the ESPN, Washington Post and ABC News rankings.
* **No trading claim for six of seven places**, named with the reason in the
  guide prose and in an FAQ answer.
