# Chase Field — what was published, and the verdict behind each sentence

The sentence-by-sentence audit trail for `lib/ethos/seeds/chase_field_places.ex`
and `lib/ethos/seeds/chase_field_guide.ex`.

**This file is committed on purpose.** The research artifact lives under
`.superpowers/`, which `.gitignore` excludes. A moduledoc citing a git-ignored
path has no audit trail a year from now; the moduledocs cite this file instead.

Source: the 2026-08-30 Arizona Diamondbacks research artifact
(`.superpowers/sdd/2026-08-30-mlb-ballparks/research/arizona-diamondbacks.json`,
`verified: true`), adjudicated by an independent adversarial verifier.

**The governing rule:** a verdict vouches only for what its own `item` text
restates. Only `confirmed` verdicts ship — and a clause the verifier's own text
expressly states was confirmed is an adjudication of that clause and ships too.
A finder's refuted item never ships as written.

**7 places and 1 guide shipped** from 7 researched places. **No place was
dropped.**

---

## 0. Three trading claims rested on quotations that do not exist

This is the second artifact in the wave with invented evidence, and here it
happens three times. Each was caught by the verifier searching the cited
article's full text.

| Place | The quotation the finder gave | What the verifier found | Outcome |
|---|---|---|---|
| Herberger Theater Center | the venue *"remains active"* | *"Searched the full article text for the word 'active': zero occurrences … it is a fabricated quotation, not a paraphrase."* | **Downgraded to uncertain. No trading claim.** |
| Pizzeria Bianco | the article *"states the restaurant remains operational"* | *"Re-fetched specifically to check for a present-tense operating statement: there is none. The article uses past tense throughout."* | **Downgraded to uncertain. No trading claim.** |
| Rosson House Museum | *"remains open to the public as a museum"*, in quotation marks | that exact string is not in the article, but *"it is nonetheless a fair paraphrase of the article's actual present-tense sentence"* | **Status stands, on the real sentence. The invented quotation is published nowhere.** |

The verifier adds one general point on Pizzeria Bianco worth keeping: *"A July
2026 edit timestamp on an encyclopedia article is not itself a statement that a
business is trading — it only shows the page was touched, not why."*

**No closure evidence exists for any of the three**, and none is asserted for
any of them.

---

## Identity, the county, and a name that reads like an error

| Field | Value | Verdict |
|---|---|---|
| venue | Chase Field | confirmed twice, and the verifier notes the second does not rest on the club's own site: *"Cross-confirmed independently by Wikipedia's Chase Field article, which also gives 'Chase Field' as the current official name with no pending rename noted."* |
| city | Phoenix | confirmed |
| state | Arizona | confirmed |
| county | **Maricopa County** | The finder's citation was **refuted**; the value survives on a corrected source. |

### The county miscitation, which is the dispatch's warning happening again

The finder's item read *"Chase Field is located in Maricopa County, Arizona"*,
cited to the encyclopedia's Chase Field article. **Refuted:**

> The cited Wikipedia article does not contain this sentence. Its infobox
> 'Location' field reads only 'Phoenix, Arizona, U.S.' with no county; the only
> two appearances of 'Maricopa' in the article are the 'Owner' field ('Maricopa
> County Stadium District') and a funding-history sentence about the 'Maricopa
> County Board of Supervisors' approving a sales-tax increase — an entity name
> and a funding fact, neither a statement of the venue's jurisdiction. This is
> the same shape of miscitation the Wrigley Field checkpoint's finder was caught
> on for Cook County: a plausible-sounding county claim attributed to a page that
> does not say it.

**This is the Houston pattern exactly** — a county name appearing in an article
only inside an owning entity's proper name — and it is the third instance the
project has recorded. The same finder repeated the same unsupported citation
inside the ballpark's own place record, and the verifier refuted that too:
*"Repeating the same unsupported county citation here is the same defect, not a
second confirmation of it."*

**The county ships from the correction**, whose `source_url` is
`https://en.wikipedia.org/wiki/Phoenix,_Arizona` and which the verifier states
carries it: the article's infobox gives Phoenix's county as Maricopa, and,
combined with the independently confirmed address, *"Phoenix does not span
county lines, so an address in Phoenix is in Maricopa County."* The value is
right and the source published for it is the one that says so.

Phoenix is an ordinary city in an ordinary county, so the plain `"<Name>
County"` form ships.

### The Mortgage Matchup Center

The arena beside the ballpark carries a name a reader is likely to assume is
wrong, and the verifier anticipated exactly that: *"This is a real, dated 2025
renaming, not a hallucinated venue name — verified worth flagging as such given
how implausible it reads."* The encyclopedia's naming history ends *"Mortgage
Matchup Center (2025-present)"*, and the venue's own site names itself the same
way at the same address. It was the Footprint Center before 2025. **The name
comes from the verdict**, which is the standing rule for this set, and the
record and an FAQ answer both say why it is not a mistake.

---

## 1. Places, against the verdicts they rest on

### chase-field — Chase Field (`stadium`)

`401 East Jefferson Street, Phoenix, Arizona 85004` · `https://www.mlb.com/dbacks/ballpark`

Two confirmed place verdicts, three confirmed identity verdicts and three
confirmed `history` items, published in full: the address; the March 31, 1998
opening as Bank One Ballpark and the 2005 rename after the Bank One/JPMorgan
Chase merger; the $100 million naming-rights purchase over 30 years; the 48,330
capacity since 2023; the retractable roof and the swimming pool, with the
summer-heat and monsoon framing; and the franchise's March 9, 1995
establishment, its 1998 first season and its 2001 World Series win over the
three-time defending Yankees.

**The superlative ships**, and the verifier records that it is the source's:
*"the 2001 win over the Yankees made them 'the fastest expansion team in MLB
history to win the World Series' … The superlative is the source's own wording,
not an added embellishment."* Published as the source's description.

**The zip ships** because the verifier's own county correction restates the full
address including it.

**Not published:** MLB's own "one of the game's most recognizable landmarks"
framing, which sits in the source the verdict cites but not in the verdict's
`item`; and any parking garage name or rate, on an explicit
`could_not_establish` — the club's transportation subpages returned HTTP 406.

`status_verdict: confirmed` open, on two sources with no indication of closure
or relocation.

### mortgage-matchup-center-phoenix — Mortgage Matchup Center (`attraction`)

`201 East Jefferson Street, Phoenix, Arizona 85004` · `https://www.mortgagematchupcenter.com`

Two confirmed verdicts, published in full: the address, the current name since
2025 with the encyclopedia's naming history, and the Suns and Mercury tenancies;
and the venue's own site naming itself the same way at the same address.

The verifier notes the rule that lets the operator's own site count here: *"A
business's own site is sufficient to establish its own name and address (rule 4
bars it only for awards/superlatives/trading status), and it is corroborated
independently by Wikipedia here regardless."*

`status_verdict: confirmed` open, on two independent sources agreeing on the
current name and active tenancy.

### rosson-house-museum — Rosson House Museum (`museum`)

`113 North 6th Street, Phoenix, Arizona` · `official_url: nil`

Three confirmed verdicts, published in full: the Victorian-era mansion at 113
North 6th Street at the corner of Monroe Street, within Heritage Square; the
1894-95 construction in the Stick-Eastlake Queen Anne style of Victorian
architecture and the National Register listing of June 3, 1971; and the City of
Phoenix's 1974 purchase and restoration, with the Heritage Square Foundation
and Guild operating it as a historic house museum in the city's Heritage and
Science Park and offering public tours.

**The architectural style ships because a verdict states it** — the verifier
says so in terms: *"Architectural style is sourced, so it ships."*

**The corner-of-Monroe-Street location ships and is not the banned form.** It
names two streets, which is the checkable kind of spatial claim the rule
protects.

**`status_verdict: confirmed`, on the real sentence rather than the invented
one.** See §0. The published prose paraphrases the article's actual wording —
the foundation operates the restored house as a museum and offers public tours
— and nowhere presents the finder's quotation as a quote.

### arizona-science-center — Arizona Science Center (`museum`)

`600 Washington Street, Phoenix, Arizona` · `official_url: nil`

Three confirmed verdicts, published in full: the 1980 conception as a pilot
science center by the Junior League of Phoenix and the 1984 opening as the
Arizona Museum of Science & Technology; the 1997 relocation to the
120,000-square-foot Antoine Predock-designed facility; and the April 2026
statement that Tammy Stewart is the center's Hazel A. Hare President and CEO,
with the October 2025 opening of the renovated Dorrance DOME, an 8K-plus
resolution LED dome display.

**The address is the verdict's, not the artifact header's.** The header proposes
"600 East Washington Street"; the confirmed verdict's item says "600 Washington
Street", and a verdict vouches only for what its item restates.

`status_verdict: confirmed` open, and the verifier ranks it: *"This is genuine
positive dated evidence (an April 2026 leadership statement and an October 2025
renovation opening), not merely absence of a closure notice — one of the
stronger open-status confirmations in this batch."*

### herberger-theater-center — Herberger Theater Center (`theater`)

`222 East Monroe Street, Phoenix, Arizona` · `official_url: nil`

Two confirmed verdicts, published in full: the address, the three stages, the
1989 opening and the downtown-redevelopment framing; and the naming after G.
Robert Herberger, founder of the Herberger's department store chain, with more
than 40 performances a year drawing about 175,000 patrons and 30,000 school
children annually.

**The three stages are named from the verifier's own reason**, which lists them:
Center Stage, Stage West, and the Performance Outreach/Kax Stage.

**The attendance figures are published as undated**, which both the finder and
the verifier flagged: *"Neither the article nor this item attaches a date to the
attendance figures."* The record says so on its face.

**`status_verdict: refuted`, reassessed to uncertain — no trading claim.** See
§0. The `could_not_establish` — no dated 2025 or 2026 independent confirmation —
is published.

### pizzeria-bianco-heritage-square — Pizzeria Bianco (`restaurant`)

`623 East Adams Street, Phoenix, Arizona` · `official_url: nil`

Three confirmed verdicts, published in full: the original location at 623 East
Adams Street, the 1987 establishment and the 1996 move to Heritage Square; Chris
Bianco's 2003 James Beard Foundation award for best Southwest Chef, the source's
description of him as the only pizza chef to have won a regional James Beard
award, and the Zagat score of 29 in 2000; and the Biltmore-area location of 2013
and the Los Angeles location of 2022.

**The award and the superlative both ship** because a confirmed verdict carries
them, and the verifier says so: *"The superlative is the source's own claim, not
an added one."* This is the standing rule working in its permissive direction —
the ban is on awards a confirmed verdict does not carry.

**`status_verdict: refuted`, reassessed to uncertain — no trading claim.** See
§0.

**No zip is published**, because the confirmed item gives the street address
without one.

### matts-big-breakfast-phoenix — Matt's Big Breakfast (`cafe`)

`address: nil` · `https://mattsbigbreakfast.com/`

Two confirmed verdicts, published in full: the late-October 2004 downtown
opening, the scratch-cooking description and the 7am-to-2pm daily hours from the
restaurant's own site; and the Phoenix New Times directory listing with its Best
of Phoenix awards in 2012, 2013, 2014, 2015, 2016, 2018 and 2019.

**The awards ship** and they are the strongest form available here, because the
Phoenix New Times is independent of the restaurant. They are also published with
their end date visible, which is what makes them honest: nothing in that source
is dated later than 2019.

**`address: nil`, and the disagreement is published instead.** The
`could_not_establish` names it: *"which of the two published street-number
addresses (817 vs. 825 N 1st St) is correct"*. Both numbers appear in the
record's prose; neither goes in the address field, because putting one there
would present an open question as settled. This follows the corpus's practice of
publishing source disagreements rather than silently choosing.

**`status_verdict`: the verifier endorses the finder's uncertain call** — *"This
is the correct verdict, arrived at the correct way — not overturned."* **No
trading claim.**

---

## 2. The guide

`slug: chase-field-guide` · `destination: "Phoenix, Arizona"` ·
`state: "Arizona"` · `county: "Maricopa County"`

### Getting there

All three `getting_there` items are confirmed and all three ship: the two Valley
Metro Rail A Line stations serving the ballpark, 3rd Street/Jefferson eastbound
and 3rd Street/Washington westbound, which the verifier notes carry *"no
distance or duration attached — clean of the proximity/duration bans"*; the A
Line's run from the Downtown Phoenix Hub to Gilbert Road/Main Street; and the
absence of any published parking price, with the HTTP 406 failures named.

**"East of 7th Street" ships**, and the verifier ruled on it: *"'east of 7th
Street' is a sourced directional fact, not banned vague proximity (it is not
phrased relative to another business or in blocks/steps)."*

**No station, garage or lot becomes a place record.**

### Around the ballpark

Every published address is a place record's own. **No spatial relationship
between the ballpark and any other place is published**, including between the
ballpark and the arena, because no verdict states one. The two containments that
do ship — Heritage Square and the Heritage and Science Park — are each stated by
a confirmed verdict.

### The ballpark and the team

Restates the confirmed `history` items and the identity verdicts.

### FAQ

Five questions, four of which state a limit: the corrected county citation, the
absent parking price, the three places with no trading claim, and the
unresolved street number.

---

## 3. What is absent from the whole site

* **No trip duration of any kind**, per docs/site-builder.md §8. Nothing was
  lost to it here; no confirmed verdict in this artifact states one.
* **No vague proximity.** Two spatial claims ship and both are checkable: a
  street corner, and a compass direction from a numbered street.
* **Three superlatives and two awards ship**, every one inside confirmed verdict
  text: the fastest expansion team to a World Series, the only pizza chef with a
  regional James Beard award, Chris Bianco's 2003 James Beard award itself, the
  Zagat score, and the Phoenix New Times awards. **One framing does not**: MLB's
  own "most recognizable landmarks" description of Chase Field, which no
  verdict's item restates.
* **No street address for Matt's Big Breakfast**, because two sources disagree
  and the verifier names the question as open.
* **No official URL for four of the seven places**, because none was confirmed.
* **No parking rates or garage names**, because the pages that would carry them
  could not be fetched.
* **No trading claim for three of the seven places**, two of them because the
  evidence offered was quotations that do not exist.
