# Fenway Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/fenway_park_places.ex`
and `lib/ethos/seeds/fenway_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes — the arrangement that lost the
Brooklyn research artifacts. A moduledoc citing a git-ignored path has no audit
trail a year from now. The moduledocs cite this file instead.

Source: the 2026-08-30 Boston Red Sox research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/boston-red-sox.json`,
`verified: true`), adjudicated by an independent adversarial verifier. The
verifier's own count is **34 of 44 items confirmed (77%)**.

**The governing rule:** a verdict vouches only for what its own `item` text
restates, not for every clause of the sentence the finder wrote around it.

**The refuted-with-correction rule:** where a verdict is `refuted` but its
correction names what may still be published, that named text ships and nothing
else from the item does. This is the Wrigley precedent — Metro's 1927 building
year and the ballpark's "jewel-box" wording both reached the corpus through a
refuted verdict's correction.

**9 places and 1 guide shipped** from 9 researched places.

---

## Identity and the county field

| Field | Value | Verdict |
|---|---|---|
| venue | Fenway Park | *"Fenway Park's current official name is Fenway Park; it opened April 20, 1912, and the Boston Red Sox play there."* — confirmed |
| city | Boston | same verdict + *"…address 4 Jersey Street, Boston, MA 02215, since 1912 to the present."* — confirmed |
| state | Massachusetts | as above |
| county | **Suffolk County** | *"Boston is part of Suffolk County, Massachusetts … county government in Suffolk County was abolished in 1999 … the jurisdiction name itself (Suffolk County) is still the one Massachusetts and federal sources use for Boston addresses."* — confirmed |

The county is taken from the verdict, not from a recollection of Massachusetts
administrative geography. The 1999 abolition of county government does not
change the jurisdiction name the verdict settles on, and that name is what
derives `/destinations/massachusetts/suffolk-county`.

---

## 1. Places, against the verdicts they rest on

### fenway-park — Fenway Park (`stadium`)

`4 Jersey Street, Boston, MA 02215` · `official_url: https://www.mlb.com/redsox/ballpark`

| Published | Verdict `item` |
|---|---|
| "The home ballpark of the Boston Red Sox, at 4 Jersey Street in Boston. It opened on April 20, 1912, and the club has played there since." | *"Fenway Park, at 4 Jersey Street, Boston, MA 02215, is the home ballpark of the Boston Red Sox, open since April 20, 1912."* — confirmed |
| "Capacity is listed as 37,305 for day games and 37,755 for night games." | *"Capacity is listed as 37,305 for day games and 37,755 for night games."* — confirmed |
| "The Red Sox Hall of Fame is among the concourse features." | *"Fenway Park includes the Red Sox Hall of Fame among its concourse features."* — confirmed |
| the Yawkey Way / Jersey Street sentence | verbatim confirmed `item` |
| the Green Monster sentence, including 37.167 feet and 2003 terrace seating | verbatim confirmed `item` |
| Pesky's Pole, 302 feet, "the shortest outfield distance in Major League Baseball", dedicated September 27, 2006 | verbatim confirmed `item`. The superlative is the source's and is carried by the verdict, so it ships. |
| "added to the National Register of Historic Places on March 7, 2012" | verbatim confirmed `item` |
| "a pending Boston Landmark rather than a currently designated one; designation would regulate future changes" | verbatim confirmed `item` |

**Not published:** any parking price (see the guide); anything about 2026
schedules or tickets.

### isabella-stewart-gardner-museum — Isabella Stewart Gardner Museum (`museum`)

Both verdicts confirmed and published in full: 25 Evans Way, in the Fenway
neighborhood; built 1898-1901 by Isabella Stewart Gardner on land she purchased
in the Fenway; modeled on a 15th-century Venetian palace; opened to the public
January 1, 1903; Renzo Piano wing 2012; over 7,500 items — paintings, sculpture,
tapestries and decorative arts — spanning ancient Rome through the 19th century.

**`status_verdict: uncertain`**, `could_not_establish: "a source-dated
confirmation that it is open in 2026"`. Nothing here says the museum is open.

### museum-of-fine-arts-boston — Museum of Fine Arts, Boston (`museum`)

Both verdicts confirmed and published in full: 465 Huntington Avenue;
established 1870; moved to the Fenway in 1909 into a neoclassical Guy Lowell
building with a 500-foot granite facade; 8,161 paintings and over 450,000
artworks; "described as the 20th-largest art museum in the world by public
gallery area"; more than 1.2 million annual visitors; Foster and Partners Art of
the Americas Wing, 2010.

The ranking and the architectural label both sit inside confirmed verdict text
and therefore ship. Treating "no unsourced architectural style" as a blanket ban
on sourced ones has already cost this corpus content.

**`status_verdict: uncertain`** — same gap as the Gardner. No trading claim.

### back-bay-fens — Back Bay Fens (`park`)

Both verdicts confirmed and published in full: Olmsted, 1879, former tidal
marsh; Boylston Street to Avenue Louis Pasteur; Muddy River through its center;
Fenway-Kenmore neighborhood, which it names; Boston Landmark 1983; on the
National Register; Fenway Victory Gardens (1942, "one of only two remaining
WWII-era victory gardens in the US"); Kelleher Rose Garden (1930, expanded
1933). `status_verdict: confirmed / open`.

The address field is the source's own extent, `Boylston Street to Avenue Louis
Pasteur` — the artifact's parenthetical neighborhood tag is dropped, because the
neighborhood is stated in the summary where it is sourced.

### cask-n-flagon — Cask 'n Flagon (`restaurant`)

`62 Brookline Avenue, Boston, MA 02215`

Verdict #0 is **refuted**, with the correction: *"Cite the address (62 Brookline
Ave) to casknflagon.com/contact/, not the homepage or locations page. Drop
'directly by Fenway Park' — no source states a distance or a sourced spatial
relationship between the two."* Both halves obeyed: the address published is 62
Brookline Avenue, sourced to the contact page the verifier fetched, and **no
spatial relationship to the ballpark is published at all**.

Verdict #1 is confirmed and carries the discrepancy: the City of Boston's Active
Food Establishment Licenses dataset records "Cask N Flagon" added December 7,
2006 at **48 Brookline**. Published, because a record that hides a
source disagreement is worse than one that states it.

**`status_verdict: refuted / uncertain`.** The record says the licence
establishes a dated 2006 act and not present-day operation, and makes no trading
claim. This is the "uncertain trading does not block publication" rule: the name
and address are established, so there is something to publish.

**Not published:** "directly by Fenway Park".

### bleacher-bar — Bleacher Bar (`restaurant`)

`82A Lansdowne Street, Boston, MA 02215`

Verdict #0 is **refuted**, correction: *"Drop 'the only bar located inside the
ballpark itself.' Keep the sourced, non-superlative description: established
2008, beneath the center-field bleachers, with a retractable garage door opening
onto the field."* The keep-list is exactly what the summary carries; the
superlative is gone.

Verdict #1 confirmed: the City dataset records "Bleacher Bar" added April 2, 2008
at **70 Lansdowne**, against the business's own 82A. Published as an unresolved
disagreement.

**Why this ships despite an unresolved street number.** The `could_not_establish`
entry is about which of two numbers is current, not about whether the business
has an established address at all — the business's own site states one and the
verifier re-fetched it. That is unlike the Wrigley case the identity rule was
written for, where The Park at Wrigley's address was *inferred* from a licence
row that did not name the place. Both numbers are published, attributed.

**`status_verdict: refuted / uncertain`.** No trading claim.

### sweet-cheeks-q — Sweet Cheeks Q (`restaurant`)

`1381 Boylston Street, Boston, MA 02215`

Verdict #0 **refuted**, correction: *"Drop 'operated by Big Heart Hospitality'
unless it can be sourced to a statement (not a URL fragment) … Keep the address
and the five confirmed service offerings."* The operator is gone; the address and
the five offerings — dine-in, takeout, delivery, reservations, catering — are
what ships.

Verdict #1 confirmed: the City dataset lists "Sweet Cheeks" at **144 Brookline**
with the same phone number, 617-266-1300, as the restaurant's own site; the
number ties the records together and the address disagreement is unresolved. The
licence carries no expiration date, so it establishes nothing about present-day
operation — published in those words.

**`status_verdict: refuted / uncertain`.** No trading claim.

### citgo-sign — Citgo Sign (`attraction`)

`660 Beacon Street, Boston, MA 02215` · `official_url: nil`

Both verdicts confirmed: 60-foot-square, double-faced, illuminated, at 660 Beacon
Street in Kenmore Square; installed 1940 as a Cities Service sign; Citgo trimark
1965; visible above the Green Monster in Red Sox broadcasts; Boston Landmarks
Commission vote November 2018 and the mayoral veto; 30-year Related Beal lease
through 2048; October 2025 plans to relocate it 30 feet higher and 130 feet east.

**Not published: the "See It Go" nickname.** Verdict #0 is confirmed but carries
the correction *"Re-source or drop the 'See It Go' nickname specifically before
publishing unless a direct quote for it is located"*. No direct quote was
located, so it is dropped. A confirmed verdict with a carve-out does not vouch
for the carved-out clause.

The artifact's address field ends "(Kenmore Square)"; the parenthetical is moved
into prose rather than into the `address` field, which is a postal address.

### hotel-commonwealth — Hotel Commonwealth (`hotel`)

`500 Commonwealth Avenue, Boston, MA 02215`

Verdict #0 confirmed: a hotel at that address, in Kenmore Square — sourced to the
hotel's own site, which is what the record says.

Verdict #1 confirmed but **about a different building**, and published as such:
*"Kenmore Square's Hotel Kenmore (built 1915, a different, earlier building) was
historically known as the 'baseball hotel' housing visiting MLB teams after
World War II."* The parenthetical in the verdict text is the reason this needed
care; a summary that quietly attached the baseball-hotel history to the
Commonwealth would be the §9 failure exactly.

**`status_verdict: uncertain`**, `could_not_establish: "independent
(non-self-published) confirmation that the hotel is currently operating"`. No
trading claim.

---

## 2. The guide

`slug: fenway-park-guide` · `destination: "Boston, Massachusetts"` ·
`state: "Massachusetts"` · `county: "Suffolk County"`

### Getting there

Four transit facts and one parking fact, all from `getting_there`:

| Published | Verdict |
|---|---|
| Kenmore station: B, C and D branches of the MBTA Green Line, under Kenmore Square at Commonwealth Avenue, approximately 1,000 feet south of Fenway Park, primary transit access point | confirmed, verbatim |
| Fenway station: Green Line D branch, under Park Drive near the Riverway; **"slightly further from the stadium than Kenmore station"**; renamed from "Fenway Park" to "Fenway" in the mid-1970s | **refuted**, correction: *"Replace 'significantly farther' with the source's own comparative: the station is only 'slightly further from the stadium than Kenmore station,' per Wikipedia — not significantly farther."* The correction's wording is what ships. |
| Lansdowne station: 85 Brookline Avenue, MBTA Commuter Rail Framingham/Worcester Line, renamed from "Yawkey" effective April 8, 2019, opened 1988 for limited service to games, Fenway Center partially over it | confirmed, verbatim |
| MBTA bus route 55: West Fenway to Arlington Station | confirmed, verbatim |
| No published price for official game-day parking; MLB.com's transportation and parking pages returned HTTP 406/404 | confirmed, verbatim |

No station, bus route or garage becomes a place record.

### Around the ballpark

Every address in this section is a place record's own published address. The
three licence-dataset disagreements are stated together, in one paragraph, so a
reader meets them as a pattern in the record rather than as three separate
oddities. The closing paragraph names the six places with no trading claim and
says plainly that this is not evidence of closure.

**Not published:** any spatial relationship between two of these places. A first
draft opened a paragraph "South and west of the square…"; no verdict measures
those relationships, and it was cut.

### The ballpark and the team

The ballpark paragraphs restate the eight confirmed `history` items with
`about: "ballpark"`. The team paragraph restates the two with `about: "team"`:
the 1901 founding as an American League original franchise, the first modern
World Series in 1903 against Pittsburgh, titles in 1912, 1915, 1916 and 1918,
the 86-year gap to 2004 "popularly attributed to the sale of Babe Ruth to the
New York Yankees in 1920 and referred to as the 'Curse of the Bambino'", and
2007, 2013 and 2018.

The curse is published as an attribution — "popularly attributed", "referred to
as" — because that is how the verdict states it.

### FAQ

Six questions, each answered only from the verdicts above. The parking answer
and the trading-status answer both state what could not be established rather
than filling the space.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8.
* **No vague proximity.** The only distance published is the source's own
  "approximately 1,000 feet", attached to Kenmore station where the source
  attaches it — not to any business.
* **No unsourced superlative.** Two superlatives ship, both inside confirmed
  verdict text: Pesky's Pole as the shortest outfield distance in MLB, and the
  MFA as described the 20th-largest art museum in the world by public gallery
  area. Two were struck: Bleacher Bar's "only bar inside the ballpark" and
  Cask 'n Flagon's "directly by Fenway Park".
* **No trading claim for six of nine places.** Named, with the reason, in both
  the guide prose and the FAQ.
