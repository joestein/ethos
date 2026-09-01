# City Island — authoring report

Output: `priv/seed_data/bronx/city-island.json`. Sources: `docs/bronx/city-island-verdicts.md`
(source of truth), `docs/bronx/city-island-finder.md` (context), structure matched to
`priv/seed_data/bronx/bronx-park.json` and `priv/seed_data/bronx/mott-haven.json`.

## Tier

**12 surviving places → `"tier": "guide"`.** Twelve is double the six-place threshold, so the
call is not marginal. Guides carry no link floor and no honest outbound edge exists yet, so
`"links": []` ships, as Mott Haven's does. Pelham Bay Park has no seed file, and
`Ethos.Links.resolve!/1` aborts the whole link pass on an unknown target, so the confirmed
relationship material (block E, ruling 6) was written into prose on this side and left
unlinked. The Pelham Bay page can carry the edge when it lands.

## Places published (12)

| Place | Slug | kind | Address |
| --- | --- | --- | --- |
| City Island Nautical Museum | `city-island-nautical-museum` | museum | 190 Fordham Street |
| Grace Episcopal Church | `grace-episcopal-church-city-island` | historic-site | 116 City Island Avenue |
| House at 175 Belden Street | `house-at-175-belden-street` | historic-site | 175 Belden Street |
| Sammy's Fish Box | `sammys-fish-box` | restaurant | 41 City Island Avenue |
| Johnny's Reef Restaurant | `johnnys-reef-restaurant` | restaurant | 2 City Island Avenue |
| The Original Crab Shanty | `the-original-crab-shanty` | restaurant | 361 City Island Avenue |
| Samuel Pell House | `samuel-pell-house` | historic-site | 586 City Island Avenue |
| William H. Schofield House | `william-h-schofield-house` | historic-site | 65 Schofield Street |
| Captain John H. Stafford House | `captain-john-h-stafford-house` | historic-site | 95 Pell Place |
| Samuel H. and Mary T. Booth House | `samuel-h-and-mary-t-booth-house` | historic-site | 30 Centre Street |
| 21 Tier Street | `21-tier-street` | historic-site | 21 Tier Street |
| City Island Yacht Club | `city-island-yacht-club` | attraction | 63 Pilot Street |

Twelve entries, one per place. Five FAQ entries. Three sections — a consolidated history
deep-dive, "City Island Avenue and the waterfront", and `Getting there`. Intro 159 words. No
photos —
the three shipped Bronx pages carry none and no candidate artifact exists for this one.

Places 7–11 ship on two confirmed claims each (name-with-address and designation date) and
nothing else. Nothing about their architecture or appearance is confirmed, so nothing about it
is written. Rule 4 of the dispatch — no minimum word count — is what makes those entries
legitimate rather than thin.

## The restaurants — what sourced each summary

All three shipped. **Every publishable sentence about each comes from the business's own site**;
the DOHMH inspection rows are used for nothing except the independent confirmation of
existence and address recorded in the verdicts, and no inspection date, grade, cuisine or
category noun derived from that dataset appears anywhere in the file.

- **Sammy's Fish Box** — `https://www.sammysfishbox.com/`: the name in that styling, 41 City
  Island Avenue, what it offers ("fresh seafood, lobster feasts and waterfront dining", surf
  and turf, lobster dishes, fried seafood specialties), and the 1966 founding (verdict 4.2,
  permitted as own-site description). The apparent name conflict is not mentioned, because per
  C2 and ruling 2 it does not exist: `SAMMY'S FISHBOX` at 41 and `SAMMY'S ORIGINAL SHRIMP BOX`
  at 64 are two businesses. The Shrimp Box is not published.
- **Johnny's Reef Restaurant** — `https://www.johnnysreefrestaurant.com/`: 2 City Island
  Avenue, and the cafeteria-style Fried, Steam, Clam and Soda sections, the bar, and the
  indoor and outdoor picnic-table seating overlooking the water.
- **The Original Crab Shanty** — `https://www.originalcrabshanty.com/`: 361 City Island
  Avenue, the 1977 takeover, and the building's earlier life as a silent movie theater, then
  the City Island Post Office, with Crab Lane through what is now the parking lot.

Excluded from all three, per rule 4 and verdicts 4.4, 4.5, 5.3, 5.4, 5.5, 6.7: every award,
ranking, press-list title, self-superlative, trading-duration claim and the Bloomberg
quotation. No open/closed status is asserted for any of them; all three carry the schema
default `status: "open"`, which renders nothing.

Name and slug follow the verdict: **Sammy's Fish Box**, `sammys-fish-box`.

## Corrections applied

- **City Island Bridge start year dropped entirely** (F1 `uncertain`; prose 1898, infobox
  1899). The completion date, July 4, 1901, is published; the start year appears nowhere, and
  there is no hedge and no disclaimer sentence stating the range. Two other 1899s in the file
  are the Harlem Yacht Club clubhouse opening (B16) and the steam yacht *Kanahwa* (B11).
- **$200,000 published as a projected cost** (F6), with the source's own $7,740,000 2025
  conversion.
- **Seven spans not published.** F5's prose configuration ships instead: five fixed spans and
  one central swing section.
- **Harlem Yacht Club Memorial Day Regatta: "western Long Island Sound"** (B20). The "for over
  60 years" clause was also dropped — B20's verdict restates only the western-Sound wording,
  and per §2 a clause the verdict does not restate does not ship.
- **PS 17's style published as "Gothic, Neo-Georgian"** (1.3), both parts or neither.
- **America's Cup attributed to the yard, not the man** (B1, ruling 5): "built in the Nevins
  Boat Yard on City Island." Nevins's own biography — 1907, age 29, the Hansen Boat Yard, the
  later Byles Yard, *Baby Bootlegger* with George Crouch, the 1924–25 Gold Cups, the wartime
  minesweepers — ships separately and carries no Cup claim.
- **Pelham Bay Park station's pedestrian bridge: "leads to Pelham Bay Park"** (D8 refuted). It
  is not presented as reaching City Island. The Getting there section states positively that
  the City Island Bridge is the island's only road connection, so a visitor cannot act on the
  refuted claim; no research-process negative was needed to fix it.
- **The bridge is a City Island asset** (ruling 4). Its eastern end is on City Island and its
  western end on Rodman's Neck, whose wooded portion is within Pelham Bay Park; the Pelham Bay
  Park article's "the island's only connecting road to the mainland" is quoted in substance.
  Pelham Bay should reference it as a relationship, never claim it as a place.
- **"three yacht clubs" not published as a count** (B22). The sentence names the Harlem, City
  Island and Morris clubs "among the island's clubs", plus Barron's Boatyard and the North and
  South Minneford Yacht Clubs.
- **Grace Episcopal's companion names corrected** (2.4): "Saint Mary Star of the Sea Holy Roman
  Catholic Church" and Temple Beth El as "a non-denominational liberal synagogue".
- **A7b honoured**: the 1761 renaming sentence names no prior name. "Minneford Island" appears
  only in the separate sentence sourced to the Rodman's Neck article (E5/E7).
- **B10's superlative attributed** as a contemporaneous description ("described at the time
  as"), not asserted. The 1908 launch and the wartime submarine chasers are written as
  Consolidated's work *before* it moved to City Island, so neither is implied to have happened
  on the island.
- **A17's date qualifier dropped**: the tycoons sentence carries no "early-20th-century".
- **1.12 kept "allegedly"** for the 2007 fire's cause.
- **cityisland.com not quoted** (A51's typo); the page paraphrases nothing from it.

## The uncertains — every one excluded

| Verdict | Item | Treatment |
| --- | --- | --- |
| A7b | "Minnewits"/"Minneford" attached to the 1761 renaming | Specific removed from that sentence; the earlier name kept only on E5's separate source |
| F1 | Bridge construction start year (1898 vs 1899) | Specific removed; completion date kept, no hedge, no disclaimer |
| 4.4 | Sammy's "over 55 years", "legendary" portions | Excluded |
| 4.5 | Sammy's currently trading | Excluded; no open/closed sentence written |
| 5.3 | Johnny's Reef "over 60 years" | Excluded |
| 5.4 | Johnny's Reef Bloomberg quotation | Excluded |
| 5.5 | Johnny's Reef press-list titles | Excluded |
| 6.7 | Crab Shanty "Voted Best Restaurant in the Bronx 2017" | Excluded |

That is the full uncertain set from the verdicts' totals table (A7b, F1, and the six
restaurant items across places 4, 5 and 6). No uncertain place or lodging ships: Le Refuge Inn
is excluded and is **not** recorded as closed, per verdict and rule 3.

## Not published, and not mentioned

Tony's Pier Restaurant, Seashore Restaurant, City Island Lobster House and Turtle Cove Golf
Center — DOHMH-only, existence evidence only, no prose of any kind including a category noun.
None of the four names appears anywhere in the seed file. Also excluded: Artie's Steak &
Seafood (unconfirmed), Le Refuge Inn (uncertain), Pelham Cemetery (bare caption), Minneford
Yacht Yard, Sammy's Original Shrimp Box (DOHMH-only), Morris Yacht & Beach Club as a place
record (named in prose from B22's Wikipedia sentence only; the verdicts' surviving-place list
does not carry it), City Island Avenue as a place record.

Orchard Beach, the Bartow-Pell Mansion and Hunter Island are deliberately absent as places:
they belong to Pelham Bay Park, and `@marquee_institutions` in the Bronx gate asserts
`^orchard-beach` and `^bartow-pell-mansion` appear in exactly one file each.

## Style and gate discipline

- **No research-process prose**, with one deliberate exception used **once**: "This page names
  no Metro-North station and no NYC Ferry landing serving City Island." It appears in the
  Getting there section and is *not* repeated in the transit FAQ. The NYC Ferry advocacy fact
  (D10) is published beside it as a positive claim, which is what it is.
- **Attribution is used for two distinct reasons, and this bullet has been wrong twice about
  which.** The first commit claimed transit facts were "stated flat, with no preamble" while
  nine constructions wrapped a source's information; round 1 stripped those. The round-1
  rewrite then said attribution is used "only where a claim rests on a source's
  characterization", which is also not true of the file. The accurate statement:

  1. **Characterization** — required because the claim *is* the source's judgement: B14's
     "third oldest continuously functioning yacht club in the City of New York", and the
     Temple Beth El description (2.4). Two.
  2. **Provenance under rule 4** — required because the fact comes from a business's own site
     or from a single boroughwide list, and presenting it unattributed would launder its
     source. This covers the own-site wrappers on the museum, the three restaurants and their
     entry notes, and the two boroughwide-landmarks-list attributions. **Several of these wrap
     a bare year or a service format** — Sammy's 1966, the Crab Shanty's 1977, Johnny's
     ordering sections — which rule 4.2 expressly permits as own-site description. They are
     not characterizations, and the wrapper is there for provenance, not judgement.

  Every confirmed bus route, subway line, terminal, address and bridge fact is stated flat.
- No trip duration and no vague proximity anywhere; "24 hours a day" is a published service
  fact from D4 and trips no pattern (pattern 11 is anchored on a preceding "in", pattern 6
  requires a mode word). No allowlist entry was added to either ban.
- `county` is `"Bronx"` on the guide and on all twelve places.
- Section heading is byte-exact `Getting there`, covering subway, bus, Metro-North and ferry.
- FAQ carries `How do I get to City Island?`.

## Fact-fidelity review, round 1 — what changed

No Critical. The review re-fetched all three restaurant sites and confirmed every barred item
is absent. Three Important, two Minor, and one editorial finding that mattered more than the
three. All addressed; nothing in the "do not touch" list was touched — the restaurants'
own-site sourcing, every address, the census figures, `"links": []` and the twelve-place list
are unchanged.

**1. "Seafood" cut from The Original Crab Shanty.** `places[5].summary` now reads "A restaurant
at 361 City Island Avenue." Verdicts 6.1–6.6 license the name, address, phone, 1977, the
theater, the Post Office and Crab Lane; the only category evidence was **6.2, the DOHMH row**,
which is barred from prose. "Restaurant" survives on 6.1's own-site name. "Seafood" came from
the finder's unadjudicated "What it is:" line and had no verdict behind it. Sammy's keeps it
(4.3 licenses "Fresh Seafood" from the own site) and Johnny's keeps it (5.2 restates a "Clam
Section"); the title's hook is licensed by the same 4.3.

**2. Two unrestated clauses cut — the New Lots pattern.** "the 475-ton **luxury** steam yacht
Kanahwa" → "the 475-ton steam yacht Kanahwa": B11 restates tonnage, year, owner and the 1917
conversion, not the adjective. "The Island Current, a local **monthly** newspaper" → "a local
newspaper": A20 restates only the October 1971 first printing, and frequency is a volatile
specific nobody pinned.

**3. Nine attribution constructions stripped**, each wrapping a source's information rather
than its characterization:

| Where | Was | Now |
| --- | --- | --- |
| `sections[2].body` | "The main City Island article gives the island's public transit as…" | "The island's other public transit link is two rush-hour extended round-trips of the BxM8…" |
| `faq[0].answer` | "The main City Island article adds two rush-hour…" | "Two rush-hour extended round-trips of the BxM8 express route run to Manhattan." |
| `sections[1].body` | "The Pelham Bay Park article describes the two small land berms … as the island's only connecting road" | "Two small land berms between Rodman's Neck and City Island carry the island's only connecting road to the mainland." |
| `faq[2].answer` | "The Pelham Bay Park article describes the crossing … as" | "The crossing between Rodman's Neck and City Island is the island's only connecting road to the mainland" |
| `sections[2].body` | "Wikipedia's NYC Ferry article records that City Island residents advocated…" | "City Island residents advocated for a ferry stop there." |
| `faq[1].answer` | "Wikipedia's article on Rodman's Neck calls the island by an earlier name, Minneford Island, in describing…" | "The island was earlier known as Minneford Island, and Samuel Rodman ran a ferry from it across to Anne's Hoeck…" |
| `sections[0].body` | "The main City Island article names the Harlem Yacht Club, the City Island Yacht Club and the Morris Yacht and Beach Club among the island's clubs" | "The Harlem Yacht Club, the City Island Yacht Club and the Morris Yacht and Beach Club are among the clubs on the island" |
| `entries[11].note` | "one of several yacht clubs the main City Island article names on the island" | "one of several yacht clubs on City Island" |
| `places[1].history` | "The main City Island article names four houses of worship on the island:" | "Four houses of worship stand on the island:" |

The `faq[1]` case was the worst of the nine: `sections[1].body` already stated the Minneford
name flat, so the file contradicted itself on the same fact. Both now state it flat, and
neither asserts it as one sentence with the 1761 renaming (A7b).

The Temple Beth El clause keeps its attribution — "which the main City Island article describes
as a non-denominational liberal synagogue" is a characterization, and 2.4 pins it to those
words. B22's non-exhaustive framing survives the rewrite: "are among the clubs on the island"
still refuses the count.

**4. A21 used; the intro now opens on what the place is.** The first commit ran a chronology —
1654 → 1761 → 1819 → 1895 → 1898 — accurate but a sequence rather than a portrait, and it left
A21 on the table. cityisland.com's confirmed self-description is publishable as a paraphrase
(the source page carries a typo, "in th Bronx", so it must not be quoted verbatim), and it is
the sentence that carries the village feeling. The new opening:

> City Island is a small community at the edge of New York City, just beyond Pelham Bay Park in
> the Bronx and surrounded by the waters of Long Island Sound: an island roughly 1.5 miles long
> by half a mile wide at the Sound's extreme western end, east of Eastchester Bay.

The shipbuilding-to-daytrippers arc (A11) now follows immediately, before the chronology, so
the intro says what the island *is* before what happened to it. Intro is 159 words, inside the
100–160 range; the trims to make room removed detail ("English physician", "of New York") and
added nothing.

**The 1901 New York Times line now opens the yacht club paragraph** rather than sitting buried
mid-paragraph: "In 1901 the New York Times observed that in place of the fishing smacks and
oyster boats that once anchored in East Chester Bay is the fleet of the Harlem Yacht Club." It
is the most evocative confirmed sentence on the page and it now lands. The paragraph's
remaining facts are unchanged and in the same order.

**Minor — causation cut from the Crab Shanty building.** "put up in the early 1900s as a silent
movie theater, which is where its tall ceilings come from" → "the building, with its tall
ceilings, was a silent movie theater in the early 1900s". The site gives the ceilings as a
feature of the building, not as an inheritance from the theater; 6.4 restates only the detail.

**Minor — the D8 correction reordered so it cannot be read past.** The pedestrian-bridge
sentence used to close a paragraph, with "By road, the City Island Bridge is the island's only
connection" opening the next — leaving the walk-from-the-station inference alive across the
break. Both sentences now sit adjacent in the same paragraph: "A pedestrian bridge from the
station entrance crosses the Bruckner Expressway and leads to Pelham Bay Park. The island
itself is reached by road: the City Island Bridge, landing on Rodman's Neck at its western end,
is its only connection to the mainland." The refutation is closed by a positive statement, with
no research-process negative.

## Fact-fidelity re-review — the fourth section, and the consolidation it forced

All five round-1 findings were judged addressed, with no Critical and no Important. One
editorial verdict remained: *"It is now, precisely, a chronology with a much better first
line."* The gain from A21 was real and confined to the top — 118 of the intro's 159 words were
still the 1654/1761/1819/1895/1898 chain, and below the intro nothing had changed in kind. Two
of three headings were history and the third was logistics, so **the three restaurants, this
page's precedent-setting achievement, appeared in no section body at all.** A reader met them
only in place records, after roughly 330 words of Nevins and Consolidated corporate history.

**A fourth section was the fix, and rule 5 does not allow one.** Rule 5 permits two to three
sections, one of which must be `Getting there`. Four would have broken it, and the rule's own
instruction is to consolidate rather than drop the new section. So:

**Consolidated.** "Shipbuilding, yacht clubs and the America's Cup" and "The bridge, and the
ways across before it" are now one history section, **"Shipbuilding, the yacht clubs and the
bridge"** (786 words). The compression fell on the corporate shipbuilding detail, which the
re-review named as the page's weakest material.

**Cut from Consolidated Shipbuilding**, all three sanctioned in advance: the 1896 merger
constituents (the Charles L. Seabury Company and the Gas Engine & Power Company with their
founding dates and locations); the steam yacht *Kanahwa* with its owner and 1917 conversion;
and the July 16, 1908 launch with its 111-foot length, 21-foot beam and 260 horsepower. Cutting
the last of those removed B10's "described at the time as" wrapper with it.

**Kept:** the June 1896 formation, the wartime tugboats, 51 of the 343 PC-461-class submarine
chasers, **the 3,000 skilled tradespeople**, the postwar move to the former Robert Jacobs
shipyard on City Island, and the 1958 exit from shipbuilding. Nothing about the bridge, the
Nevins yard or the Harlem Yacht Club was touched.

> **Correction, made at the final check rather than in the consolidating commit.** The 3,000
> workers went out with the corporate detail in that commit, and this accounting listed it in
> neither column — a confirmed fact (B12) removed silently, and one that adjudication 5 names
> explicitly among what ships intact: "Consolidated (1896–1958, 51 of 343 submarine chasers,
> 3,000 workers)". It was not among the three cuts sanctioned. It is restored:
>
> > Consolidated Shipbuilding Corporation, also known as Consolidated Yachts, was formed in
> > June 1896 and built tugboats and 51 of the 343 PC-461-class submarine chasers during the
> > Second World War, employing as many as 3,000 skilled tradespeople.
>
> The reviewer's reason for caring is the right one to record: it is the human fact in a
> paragraph that is otherwise corporate dates, and three thousand people at work for a yard
> that would move onto an island a mile and a half long is what makes the shipbuilding history
> mean anything. Losing it while compressing corporate detail was the opposite of what the
> compression was for. The workforce figure attaches to the company's wartime output, which
> predates its move to City Island — the sentence keeps that order so the work is not implied
> to have happened on the island.

**Added: "City Island Avenue and the waterfront"** (310 words), the third section, placed
between the history and `Getting there`.

**It adds no claims.** Every element was already licensed and already on the page, scattered
across the two history sections and the twelve place records; gathering them under a heading is
organization, not assertion. Its four paragraphs:

1. **The addresses on the avenue**, assembled from the place records: Johnny's Reef at 2,
   Sammy's at 41, Grace Episcopal at 116, the Crab Shanty at 361, the Samuel Pell House at 586,
   the Bx29's western terminal at the avenue and Rochelle Street (D4), the Nautical Museum at
   190 Fordham Street, and the other individual landmarks on Belden Street, Schofield Street,
   Pell Place, Centre Street and Tier Street. **The paragraph has no thesis sentence, by
   decision.** It opened with "City Island Avenue is the island's address spine" until the
   final check. No verdict characterizes the avenue — the exclusions table treats it as a
   street and not a place record — so the clause was an unsourced characterization, defensible
   as organization and true on the page's own data, but exactly the kind of clause four earlier
   pages established does not ship however true it is. An aggregation over addresses already
   published would have been ours to make; a metaphor about a spine is not. It is cut, the
   enumeration opens the section, and the first address is written in full ("2 City Island
   Avenue") so the avenue is named before the later entries shorten to bare numbers.
2. **The three restaurants**, each from its own site with the wrapper intact — Johnny's Fried,
   Steam, Clam and Soda sections, its bar and its picnic tables indoors and out overlooking the
   water (5.2); Sammy's fresh seafood, lobster feasts and waterfront dining and its 1966 date
   (4.2, 4.3); the Crab Shanty's 1977 takeover and the building's life as a silent movie
   theater and then the City Island Post Office (6.3–6.5).
3. **The water and the resort era** — Stepping Stones Light off the southern tip marking the
   main shipping channel into New York, Hart Island east across City Island Harbor, High Island
   northeast (A14); Belden Point and William Belden's 1887 amusement park and resort, and Astor,
   Morgan and Hearst (A16, A17), all moved here from the history section rather than duplicated.
4. **Orientation figures** — 0.395 square miles, Community District 10, ZIP 10464, the 2020
   census count of 4,417, and The Island Current's October 1971 first printing, also moved
   rather than duplicated.

Two constraints checked explicitly: **no trip duration and no vague proximity** — the section
names streets, house numbers and compass bearings and never how long anything takes or "a
morning" of anything; and **the attribution discipline holds** — the own-site wrappers are
present because rule 4 requires them, while the flat statements of where things sit carry none.
One sentence was cut in drafting because it was not true: "the water is in all three
descriptions" would have claimed a waterfront reference the Crab Shanty's own site does not
carry. "Landmarked houses" became "individual landmarks", because 21 Tier Street is confirmed
as a designated landmark and not as a house.

**Section count: 3.** Inside rule 5's two-to-three range, with the required `Getting there`
heading byte-exact and last.

**Two Minors fixed.**

- `sections[0].body`: "Two small land berms … **carry** the island's only connecting road" →
  "**consist of** the island's only connecting road", E5's confirmed verbatim. The source says
  the berms *are* the road, and §2 says prefer the artifact's own phrasing for a specific.
- `sections[2].body`: "The island's other public transit link **is** two rush-hour extended
  round-trips of the BxM8…" → "Two rush-hour extended round-trips of the BxM8 express route run
  to Manhattan." The definite singular asserted that Bx29 plus BxM8 is the complete set; D5
  confirms only that the main article presents those two. The FAQ already carried the
  non-exhaustive form and both now match.

Untouched per instruction: the intro, the restaurants' own-site sourcing, every address, the
census figures, `"links": []`, the twelve-place list.

## Census move

`test/ethos_web/components/structured_data_test.exs` updated, every assertion an exact `==`,
with the delta reasoned in the comment above it:

| Assertion | Before | After |
| --- | ---: | ---: |
| `length(emitted)` | 2117 | **2129** |
| `streetAddress` | 1576 | **1588** |
| `is_nil(streetAddress)` | 541 | **541** |
| `postalCode` | 1713 | **1718** |
| locality-only | 251 | **251** |

All twelve places carry an address, so total moves by 12 and none is filtered out of the
setup. All twelve addresses begin with a house number on a non-ordinal street, so
`streetAddress` moves by 12 and `is_nil(streetAddress)` does not move at all — that pair is
what proves the house numbers. Five carry a ZIP (10464): the Nautical Museum from the museum's
own site, the three restaurants from their own sites, and the City Island Yacht Club from the
DOHMH row that supplies its address — so `postalCode` moves by 5, and nothing else here proves
the ZIPs. The other seven are sourced to Wikipedia's landmark and NRHP lists, which give a
street address and no five-digit code; none was invented for them. Locality-only holds at 251
because a row with a non-nil `streetAddress` is definitionally outside that bucket, and it
holding still is the check that no City Island row went to the street-less side.

## Validation

- `mix format --check-formatted` — clean.
- `mix test test/ethos/seeds/bronx_seed_data_test.exs` — 23 tests, 0 failures, 2 excluded.
- `mix test` — **650 tests, 0 failures, 32 excluded**, matching baseline.
- Warnings: only the three tolerated ones (`gettext.ex:23`, `data_guide_test.exs:16`,
  `ct_guides_test.exs:21`).
- Place slugs checked repo-wide before writing; no collision with any
  `priv/seed_data/*/*.json` file or with `lib/ethos/seeds/connecticut_places.ex`.

## Gaps and things not done

- **No outbound links.** The only honest edge is to Pelham Bay Park, whose guide does not
  exist. Not a defect of this page; pick it up from the Pelham Bay side.
- **No photos.** No photo artifact exists for the Bronx wave and none was invented.
- **Museum hours and admission not published** (1.14). The own site's seasonal schedule and
  prices are volatile and cannot establish trading status; per the verdict's recommendation
  neither ships.
- **Morris Yacht & Beach Club** clears the same evidentiary bar as the City Island Yacht Club
  (Wikipedia name-mention plus a DOHMH address, B23 vs 12.2) but is not on the verdicts'
  twelve-place list, so it was left in prose rather than promoted. Flagging it for a later
  pass rather than deciding it here.
- **The City Island Bridge is not a place record**, only prose. Ruling 4 assigns it to City
  Island but the verdicts' surviving-place list does not carry it, and this task publishes what
  survived verification and nothing else.
