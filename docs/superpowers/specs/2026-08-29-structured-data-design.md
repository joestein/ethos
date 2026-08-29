# Structured Data: Fix What Is Broken, Emit What We Have

**Status:** approved design, ready for planning
**Date:** 2026-08-29
**Predecessor:** `docs/superpowers/specs/2026-08-29-destination-pages-design.md`

## Goal

Make the site's schema.org output correct and complete **for the data that
already exists in the repository**. No data acquisition, no external calls, no
new content.

## What changed between the proposal and this spec

Sub-project C was originally scoped as "geo coordinates, opening hours, price
range, FAQ schema." A recon of the corpus found that **three of those four have
no data behind them**, and the fourth is already shipped:

| Proposed | Finding |
|---|---|
| FAQ schema | **Already shipped.** `guide.faq` is populated on 278/278 guides (1,307 items), `FAQPage` is emitted at `guide_controller.ex:65-81`, visibly rendered on both templates, and covered by a test that also asserts its absence when `faq` is empty. |
| Geo coordinates | **Does not exist.** Not on `Place`, `Guide` or `Destination`, and in none of the 285 seed files. `Entry.lat`/`Entry.lng` columns exist but are never written and sit on the wrong entity. |
| Opening hours | **Does not exist as data.** Prose only, on ~22% of places, with coverage worst where it matters most: 0 of 95 hotels, 0 of 42 B&Bs, 2 of 72 theaters, 10 of 415 parks. |
| Price | **2.6% coverage** (56 of 2,158), and the `$` signal is dominated by renovation costs in the millions. `priceRange` is schema-invalid on the 46% of places that are not `LocalBusiness` subtypes. |

Geo is deferred, not dropped — see Out of Scope.

What the recon found instead is a set of properties whose data is already in
hand and is currently either omitted or **emitted wrongly**. That is this spec.

## The bug this fixes

`place_controller.ex:89-99` puts the entire `Place.address` string into
`streetAddress`, alongside the `addressLocality` and `addressRegion` it also
emits. Google currently sees:

```json
"address": {
  "@type": "PostalAddress",
  "streetAddress": "9 Main Street North, Bethlehem, CT 06751",
  "addressLocality": "Bethlehem",
  "addressRegion": "CT",
  "addressCountry": "US"
}
```

2,116 of 2,158 places have an address. 1,669 contain a postal code that is
emitted nowhere. **No test anywhere asserts the contents of a `PostalAddress`,**
which is why this went uncaught — every structured-data assertion in the suite
is a substring match on `"@type"` that says nothing about the properties inside.

## Design

### 1. `EthosWeb.StructuredData` — the shared module, built first

Today every JSON-LD map is hand-built as a `defp` in its controller. The
duplication is concrete:

- **Six breadcrumb builders** across four controllers — `place_controller.ex:105`,
  `destination_controller.ex:172`/`:194`/`:212`/`:228`, `collection_controller.ex:41`,
  `guide_controller.ex:86`/`:172` — five of which hardcode literal `position`
  integers.
- **`collection_ld` written twice**, at `destination_controller.ex:163` and
  `collection_controller.ex:24`.
- **The photo-absolutisation expression** `url(~p"/") <> String.trim_leading(src, "/")`
  copied to five sites across three controllers, with a comment at
  `destination_controller.ex:35-36` acknowledging the copy.
- **`maybe_put/2`**, private to `place_controller.ex:102`.

The module exposes `breadcrumb/1` (taking `[%{name:, url:}]` and deriving
positions), `collection_page/3`, `absolute_url/1`, and `maybe_put/3`.

`guide_controller.ex:86-111` is the one builder that already derives its trail
from a shared source and uses `Enum.with_index(trail, 1)` instead of literal
positions. **The module generalises that one.** The others are rewritten to call
it.

This lands first because every other item in this spec edits the same
controllers, and because hand-written `position` integers are exactly where an
off-by-one hides — sub-project A found and fixed one (`position => 5` hardcoded
in `photos_breadcrumb_ld/1`).

### 2. `Ethos.Places.Address` — decomposition as domain logic

A pure module, `parse/1`, returning
`%{street: string | nil, locality: string | nil, region: string | nil, postal_code: string | nil}`.

It lives in `Ethos.Places`, not in the web layer: it is a fact about an address,
it needs no conn and no route, and it is testable offline against the whole
corpus.

**The binding rule: `streetAddress` is emitted only when the street segment
begins with a house number.**

394 places — overwhelmingly parks — carry descriptive locations rather than
postal addresses:

> `"Bounded by Lafayette Avenue, Tompkins Avenue, Greene Avenue and Marcy Avenue"`
> `"Cropsey Avenue between 21st Avenue and Bay Parkway"`
> `"Along Shore Road"`

Each is a true statement of where the place is and a false `streetAddress`.
Those records emit `addressLocality`, `addressRegion` and `postalCode` and omit
the street line. Expected split: ~1,541 places with a street line, ~575 without.

The 131 addresses that do not decompose at all — trailing parentheticals,
multi-parcel descriptions, cross-street clauses — **fall back to today's whole-
string behaviour** rather than losing their address entirely. Degrading is
acceptable; disappearing is not.

`postalCode` is emitted whenever a five-digit code is found, independent of
whether the street line qualifies.

### 3. The home page, which currently emits nothing

`page_controller.ex:8-26` assigns no `page_title`, no `page_meta_description`,
no `page_canonical`, no `page_og`, and no `json_ld`. The page renders with the
title `Ethos · Ethos`. This is the largest single gap on the site and the
cheapest to close.

It gains the standard four, plus two JSON-LD nodes:

- **`Organization`** — `name`, `url`, `logo`. `priv/static/images/logo.svg`
  exists and is what `logo` points at. **Noted honestly:** Google's logo rich
  result wants a raster (JPG/PNG/WebP); an SVG is valid schema.org but may not
  earn that specific treatment. Producing a raster logo is out of scope here and
  recorded as a follow-up.
- **`WebSite`** — `name`, `url`, and a `SearchAction` pointing at the existing
  `/search` route (`router.ex:31`).

`Organization` also becomes the `publisher` node that the guide `Article`
currently lacks.

### 4. Guides: `Article.image` and `publisher`

`guide.og_image_path` is already resolved in the controller at
`guide_controller.ex:18`. Google's Article guidance treats `image` as strongly
recommended; without it these pages are ineligible for image-bearing treatment.
`publisher` points at the `Organization` from item 3.

### 5. Places: `sameAs` from `official_url`

1,714 of 2,158 places have an `official_url`, already rendered on the page at
`place_html/show.html.heex:76-78` and currently absent from the structured data.

**`url` is deliberately left pointing at our own canonical page.** Repointing it
at the business's own site would make it ambiguous which page represents the
entity. `sameAs` is the property that says "this same thing is also over there,"
which is exactly the claim being made.

### 6. Destination hubs

- The **destinations index** and **town destination pages** emit only a
  breadcrumb, while state and county pages emit a `CollectionPage`. They gain one,
  for consistency.
- State and county `CollectionPage` nodes carry only `name` and `url`. Sub-project
  B gave all thirteen destinations a written intro, so they gain a `description` —
  the same prose the page displays, which satisfies the rule that structured data
  reflect visible content.

### Testing

Every structured-data assertion in the suite today is a substring match:
`html =~ ~s("@type":"Article")`. That confirms a type is present and says
nothing about the properties inside it, which is the direct reason the
`streetAddress` bug survived.

`EthosWeb.ConnCase.breadcrumb_json_ld/1` (`test/support/conn_case.ex:39-50`)
already parses all `ld+json` blocks and returns the first `BreadcrumbList`. It
is generalised to `json_ld_of_type(html, type)`, and the new tests assert
**property contents**, not type presence:

- `PostalAddress` field-by-field, including the house-number rule in both
  directions and the unparseable fallback.
- `Address.parse/1` exercised against the whole corpus offline: every place's
  address parses or falls back, and no emitted `streetAddress` contains its own
  `addressLocality`.
- The home page's `Organization`, `WebSite` and `SearchAction`.
- `Article.image` present when the guide has one, absent when it does not.

## Out of scope

- **Geo coordinates — deferred by decision, not dropped.** Acquiring them means
  2,158 authoring-time lookups under the zero-external-API-in-shipped-code rule,
  a licensing decision (ODbL attribution for OSM/Nominatim; Google's terms forbid
  storing Geocoding results), and a verification pass — 93.7% of addresses parse
  but 394 are descriptive park locations with no point address, and a wrong
  coordinate publishes a false location. That is a data project with its own
  spec, not a property added to an existing map.
- **Opening hours and price.** No data. Deriving hours from prose is a parser
  problem whose false positives publish wrong facts — the day-name regex fires on
  a church whose summary mentions "average Sunday attendance of 184."
- **Town pages typed as `Article`.** A town orientation page is not an article
  and `WebPage` would be more honest, but changing a type that currently earns
  rich results risks more than the accuracy gains. Considered and rejected.
- **`ItemList` on the hub pages.** Valid, but Google does little with it for
  link lists.
- **A raster logo** for Google's logo rich result. Follow-up.

## Risks

**The refactor is the risk, not the additions.** Rewriting six breadcrumb
builders to call one function touches every page type on the site. Mitigated by
doing it first, alone, in its own task, with the existing breadcrumb tests
(`guide_controller_test.exs:113`/`:154`/`:185`/`:210`,
`place_controller_test.exs:38`, `destination_controller_test.exs:23`,
`guide_photos_page_test.exs:39`) as the regression net — they already pin the
shape of every trail. The refactor must produce **byte-identical** JSON-LD.

**The address rule drops a street line from ~575 places.** That is the intended
behaviour and a deliberate reduction in emitted data, on the grounds that a
false `streetAddress` is worse than an absent one. If it proves wrong, it is one
predicate in one pure function.

## Success criteria

- No `streetAddress` contains its own `addressLocality`, asserted across the
  whole corpus.
- `postalCode` emitted for every place whose address carries one.
- The home page emits a title, description, canonical, OG tags, `Organization`
  and `WebSite`.
- Breadcrumb JSON-LD is byte-identical before and after the refactor, on every
  page type.
- No literal `position` integer remains in any controller.
- Structured-data tests assert property contents, not just type presence.
- Full suite green.
