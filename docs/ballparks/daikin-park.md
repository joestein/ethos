# Daikin Park — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/daikin_park_places.ex`
and `lib/ethos/seeds/daikin_park_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Houston Astros research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/houston-astros.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship — and, following the wave-1 and wave-2
precedent, a clause the verifier's own text **expressly states was confirmed**
is an adjudication of that clause and ships too, whether that text is a
verdict's `item`, a `reason` naming what confirmed, or a correction naming what
was confirmed verbatim. A finder's refuted item never ships as written.

**7 places and 1 guide shipped** from 7 researched places. **No place was
dropped.**

---

## Identity, the venue name, and the county

| Field | Value | Verdict |
|---|---|---|
| venue | **Daikin Park** | *"The Houston Astros' home ballpark is Daikin Park, at 501 Crawford Street, Houston, Texas 77002."* — confirmed, re-fetched from `mlb.com/astros/ballpark`, which "names the venue 'Daikin Park' and gives the address … verbatim". |
| city | Houston | as above |
| state | Texas | as above |
| county | **Harris County** | Not from the source the finder cited. See below. |

**The venue name is Daikin Park, and recollection would get it wrong.** A second
confirmed verdict establishes the whole naming history and the verifier
reproduced every date range: Enron Field from 2000; the February 27, 2002
agreement to end those rights and the change to Astros Field; Minute Maid from
later in 2002; and *"On January 1, 2025, the stadium was renamed to Daikin
Park,"* with the infobox listing a deal running through 2039.

A third piece of evidence is recorded here because it does double duty. Houston
METRO's route guide lists the stop as "Daikin Park", and the verifier calls it
*"a genuinely independent, government-operated source currently using the
venue's current name (unlike Harris County's own site), which is itself useful
corroborating evidence that Daikin Park is the venue's live, current name."*
That is also the ballpark's `status_verdict`: confirmed, on a third-party
government source rather than the club's own page.

### The county, and the miscitation the dispatch predicted

The finder's item — *"The ballpark is located in Houston, Texas, in Harris
County"* — is **refuted**, and the verifier's method is worth quoting because it
is exactly the failure the standing ruling describes:

> Pulled every field of the Wikipedia infobox verbatim: "Location: Houston,
> Texas, U.S." — no county named. Searched the full article body for every
> occurrence of "Harris County": all seven are about the Harris County-Houston
> Sports Authority (the owner/operator entity) and 1990s funding/referendum
> history, never a direct statement that the venue sits in Harris County.
> "Houston, Texas" is confirmed by this source; "in Harris County" is not.

**The county ships from the verdict that survived**, and that verdict's own
`source_url` carries it: `https://www.harriscountytx.gov/`, the county's own
government website, which the verifier re-fetched and found lists the venue in a
"Sports, Venues & Entertainment" section alongside NRG Park, the Toyota Center
and BBVA Compass Stadium. The verifier's assessment: *"This is the strongest
county evidence in the artifact: the county names itself as the administering
jurisdiction for this venue, which is the standard the county rule asks for."*

That verdict carries its own caveat — the county site *"does not mention 'Daikin
Park' anywhere"*, listing the venue under its former name — and the caveat is
published, in the guide's closing section and in an FAQ answer, rather than
quietly dropped. Two government sources, one updated and one not, is a useful
thing for a reader checking the name to know.

Houston is an ordinary city in an ordinary county, so the plain `"<Name>
County"` form ships.

---

## 1. Places, against the verdicts they rest on

Addresses are rendered in the corpus's form — `St` expanded to `Street`, `TX` to
`Texas`. That is a rendering, not a claim. Zip codes are published only where a
verdict carries one.

### daikin-park — Daikin Park (`stadium`)

`501 Crawford Street, Houston, Texas 77002` · `https://www.mlb.com/astros/ballpark`

Three confirmed place verdicts, four confirmed identity verdicts and three
confirmed `history` items, all published: the name and address; the 2000 opening
with its March 30 exhibition and April 7 regular-season dates; the Union Station
site with part of the building incorporated into the stadium, which the
verifier's reason specifies as the former main concourse now holding a
clubhouse, cafe, team store and office space; the replacement of the Astrodome;
the approximately $250 million construction cost; the 41,168 capacity, which the
infobox dates to 2017 onward; the HOK Sport (now Populous) design credit and the
retractable roof; the four names with all their dates and the 2039 term; the AL
West membership since the 2013 realignment; the 1962 founding as the Houston
Colt .45s and the December 1, 1964 rename reflecting Houston's role in the
American space program; and the 2017 and 2022 World Series titles with their
opponents.

`status_verdict: confirmed`, on METRO's route guide, as above.

### market-square-park-houston — Market Square Park (`park`)

`301 Milam Street, Houston, Texas 77002` · `https://downtownhouston.org/go/market-square-park`

Three confirmed verdicts, published in full: the address and the site's history
as Houston's city hall and later a parking lot; the 2010 reopening after a major
renovation led by Downtown Houston+, formerly Central Houston, with the City of
Houston Parks and Recreation Department; and the 25-foot "Points of View" by
James Surls dedicated in 1992, with the daily 6am-to-11pm hours.

`status_verdict: confirmed` as a public park, with the trading judgement
correctly not applicable.

### kennedy-bakery-la-carafe — Kennedy Bakery (La Carafe) (`historic-site`)

`813 Congress Street, Houston, Texas` · `official_url: nil`

Three confirmed verdicts, published in full: the 1860 construction by John
Kennedy, an Irish-born baker who arrived in Texas in 1842, in the Main
Street/Market Square Historic District, described as probably the oldest Houston
building on its original site; the National Register listing of July 27, 1979
and the Recorded Texas Historic Landmark designation of 1981, with the drug
store from 1873 and druggists as tenants through 1932; and the 1970 transfer to
William V. Berry, who opened La Carafe.

**Two hedged superlatives ship, both with their hedges.** "Probably the oldest
Houston building on its original site" keeps its "probably". "One of the oldest
bars operating in Houston as of 2012" keeps its date, and the verifier
specifically praises the finder for that: *"The item text correctly keeps the
finder's own 'as of 2012' hedge rather than inflating it into a present-tense
superlative — this is the right way to carry a dated claim forward."* The record
and the guide both keep it.

**`kind` is `historic-site`, not the artifact's `bar`.** The corpus's `kind`
enumeration has no `bar`, and the record's substance is the building: an 1860
structure with an NRHP listing, a state landmark designation and a documented
succession of tenants. That is a schema mapping, not a claim about the place.

**`status_verdict`: the verifier agrees the finder's uncertain call is right**,
having found no closure notice, successor or dated report either. No trading
claim, and the `could_not_establish` — current trading status from a source
other than the building's own recorded history — is published.

### sam-houston-park-heritage-society — Sam Houston Park / The Heritage Society (`museum`)

`1100 Bagby Street, Houston, Texas 77002` · `https://www.heritagesociety.org/`

**One verdict is refuted with three separate faults, and the corrected account
is what ships.** The verifier checked the cited page and the correct ones:

1. The 1900 land purchase and Mayor Brashear are absent from
   `heritagesociety.org`'s homepage entirely. *"That claim is true, but it is
   sourced to Wikipedia's Sam Houston Park article,"* which the verifier fetched
   and quotes: Brashear appointed Houston's first park committee in 1899 and
   *"acquired the park land from three owners"* around 1900. **Published on that
   source.**
2. The Heritage Society was founded in 1954 **by twelve people, not three**, and
   the verifier lists all twelve from the Society's own about-us page. Naming
   three *"misrepresents the founding — notably omitting Ima Hogg, a nationally
   known Houston civic figure."* **The published sentence gives twelve, names
   four of them including Ima Hogg, and says "among them".**
3. The Society did not hold the park from its founding: it *"took over [the]
   middle section of Sam Houston Park"* in **1959**, five years later.
   **Published as 1959.**

Two further verdicts are confirmed and published in full: the ten historic
structures spanning pre-Texas-Revolution times to 1891, with the Kellum-Noble
House of 1847 as Houston's oldest brick dwelling, the Nichols-Rice-Cherry House
of about 1850 and St. John Church, an 1891 building relocated to the park in
1968; and the museum gallery and historic house tour hours of Tuesday to
Saturday, 10 a.m. to 4 p.m., which the verifier reproduced verbatim from the
Society's own site.

**`status_verdict: refuted`, and the refutation makes the status *weaker*, not
stronger.** The finder recorded the institution as confirmed open on its own
hours page; the verifier: *"Rule 4 … applies here exactly as written; a museum
publishing its own hours is the paradigm case the rule is written to catch, not
an exception to it. No independent source was checked or found, so the correct
status is uncertain."* **No trading claim is made**, and the hours are published
as what the Society's own site states, with that limit named beside them.

### discovery-green — Discovery Green (`park`)

`1500 McKinney Street, Houston, Texas 77010` · `https://www.discoverygreen.com/`

Two confirmed verdicts, published in full: the 12 acres, the address, the daily
6am-to-11pm hours, the 501(c)(3) Discovery Green Conservancy and its statement
that more than 600 free events are held there every year; and the April 13, 2008
opening, the Hargreaves Associates design lead, the $10 million Kinder
Foundation gift within a $125 million project, and the LEED Gold certification of
October 2009.

**The land acquisition is published as the verifier corrected it**, inside an
otherwise confirmed verdict: *"Wikipedia says the City acquired part of the land
in 2002 and 'purchased the remainder of the land in 2004' — the item's 'land the
City of Houston purchased in 2004' describes only the final piece of a two-stage
acquisition, not the whole assembly, but is not false."* The two-stage version
ships, because that is what the verifier states the source says.

`status_verdict: confirmed` as a public park; trading judgement not applicable.

### house-of-blues-houston — House of Blues Houston (`theater`)

`1204 Caroline Street, Houston, Texas 77002` · `official_url: nil`

Its only `found` verdict is **refuted**, and the refutation is precise about
what survives: *"Address, 2008 opening, and 1,800 capacity are confirmed by the
cited Wikipedia article (its locations table gives '1204 Caroline St, Houston,
TX 77002,' opened 2008, capacity 1,800). But 'Music Hall,' 'The Bronze Peacock,'
and 'Foundation Room' appear nowhere in that article — I searched the full
article text twice and found no occurrence of any of the three names, for
Houston or any other House of Blues location."* The correction says the same in
one line: keep the venue, the address, the year and the capacity; **drop the
three-named-spaces clause**.

**That is exactly what ships**, and the guide says so rather than leaving the
record looking thin by accident.

**`official_url: nil`.** The venue's own site was not fetched by either pass;
the record rests on the encyclopedia.

**`status_verdict`: the verifier agrees with the finder's uncertain call**, for
the same reason as Kennedy Bakery — the venue's own listings page cannot
establish trading, and no independent source was found. No trading claim.

### downtown-aquarium-houston — Downtown Aquarium (`attraction`)

`410 Bagby Street, Houston, Texas 77002` · `official_url: nil`

Two confirmed verdicts, published in full: the address, Landry's, Inc. as
owner/operator, the 2003 opening, the 6-acre site redeveloping the former Fire
Station No. 1 and the Central Waterworks Building, and the Association of Zoos
and Aquariums accreditation; and the over-200 species, the Louisiana Swamp,
shipwreck-themed and Sunken Temple exhibits, the 110,000-gallon centerpiece
aquarium, the train ride through a shark habitat, the Ferris wheel and the
carousel.

**The superlative ships, and the verifier says why it may.** *"[T]he
110,000-US-gallon … centerpiece aquarium … the largest cylindrical tank in the
United States"* is *"a source-stated one (from the independent Wikipedia
article, not the operator's own site), so it passes the
no-unsourced-superlative rule."* It is published as the encyclopedia's
description, attributed.

**The AZA accreditation ships** because a confirmed verdict carries it — the
Baltimore lesson in its positive form: the accreditation is not taken from the
operator's own claim but from an independent article the verifier re-fetched.

**`official_url: nil`**, on the same basis as House of Blues: neither pass
fetched the operator's site.

**`status_verdict`: the verifier agrees with the finder's uncertain call.** No
trading claim.

---

## 2. The guide

`slug: daikin-park-guide` · `destination: "Houston, Texas"` ·
`state: "Texas"` · `county: "Harris County"`

### Getting there

All five `getting_there` items are confirmed and all five ship: the METRO route
guide's listing of Daikin Park under the Purple Line at Congress and Crawford;
the Purple and Green Lines' shared Convention District stations at Capitol and
Rusk and the shared EaDo/Stadium station; the Red Line's Preston station, listed
by METRO as R17; the bus routes; and the parking.

**The verifier left an instruction in the transit verdict and it was followed to
the letter:**

> Note for authors: do not import any of the Wikipedia phrasing about how many
> blocks/streets separate Preston or Convention District from the ballpark into
> guide prose — that would be banned vague-proximity language; this item
> correctly states none of that and should stay that way.

None is imported. The guide names the stations and their lines and **says in
terms that the distances are not described and why**, which is the honest form
of the omission rather than a silent one.

**On buses**, the confirmed item is deliberately generic — the verifier praises
it for *"stay[ing] generic … rather than claiming a specific route stops at the
gate, which is the correct level of claim for what the source actually
supports"*. The fifteen route numbers the verifier read out of the infobox are
published as serving downtown Houston, with the guide stating that no source
ties a particular one to the ballpark.

**On parking**, the item is confirmed on substance with a citation correction —
the figures live on the dedicated parking subpage rather than the landing page
the finder cited, and the verifier fetched the subpage and quotes it: *"It is
estimated that almost 25,000 parking spaces are available,"* the instruction to
*"look for signs and banners with the baseball 'P'"*, and the SpotHero
recommendation. **Not published:** the page's own description of that app in
superlative terms, which no verdict establishes as anything but the page's
promotion of it. **No price** is published, because the page states none.

**No station, garage or lot becomes a place record.** The former Union Station
is not a place record either — it is part of the ballpark, and the ballpark's
record says so.

### Around the ballpark

Every address is a place record's own published address. The only spatial
relationships published are the ones verdicts state: a historic district, a
street address, a site's former use. Nothing describes the gap between any two
of these places.

### The ballpark and the team

Restates the confirmed identity and `history` verdicts, and records the
two-government-sources disagreement about the venue's name.

### FAQ

Five questions. Four state a limit: the rename and the county site that has not
caught up, the mis-sourced county, the deliberately undescribed distances from
the rail stations, and the four places with no trading claim.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to it here; no confirmed verdict in this artifact states one.
* **No vague proximity**, and in this artifact that is a direct instruction from
  the verifier rather than an inference — see §2.
* **Three superlatives ship, all inside confirmed verdict text and all
  attributed**: the probably-oldest Houston building on its original site, one
  of the oldest bars operating in Houston as of 2012, and the largest
  cylindrical tank in the United States. **One does not**: the marketing
  description of the parking app on the club's own page.
* **No official URL for House of Blues Houston or the Downtown Aquarium**,
  because neither pass fetched one.
* **No zip code for Kennedy Bakery**, because no verdict carries one for it.
* **No named performance spaces at House of Blues Houston**, on a full-text
  search the verifier ran twice.
* **No three-founder account of The Heritage Society**, and no claim that it
  held the park from 1954.
* **No trading claim for four of the seven places**, with the reason named in
  each record and in the guide.
