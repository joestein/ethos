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

Twelve entries, one per place. Five FAQ entries. Three sections. Intro 155 words. No photos —
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
- **Attribution used only where a claim rests on a source's characterization**: the Harlem
  Yacht Club's "third oldest continuously functioning" (B14, a source-carried superlative), the
  1908 "largest yacht in the world" (B10), the restaurants' own-site descriptions, the museum's
  own-site exhibit description, and the Pelham Bay Park article's framing of the bridge. The
  confirmed bus routes, subway lines and terminals are stated flat, with no preamble.
- No trip duration and no vague proximity anywhere; "24 hours a day" is a published service
  fact from D4 and trips no pattern (pattern 11 is anchored on a preceding "in", pattern 6
  requires a mode word). No allowlist entry was added to either ban.
- `county` is `"Bronx"` on the guide and on all twelve places.
- Section heading is byte-exact `Getting there`, covering subway, bus, Metro-North and ferry.
- FAQ carries `How do I get to City Island?`.

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
