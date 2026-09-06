# Homepage hubs and the house ad — design

Date: 2026-09-05
Status: approved for planning
Scope: a `Travel Guides` and a `Collections` section on the homepage, and a
site-wide promotional unit for the Connecticut Foliage Forecast.

## 1. Summary

Two changes that share a motive — nothing on the site currently points a reader
or a crawler at the breadth of the corpus, and the foliage forecast shipped with
no promotion beyond one homepage line.

The homepage gains a `Travel Guides` section listing the five destination hubs
with real depth, and a `Collections` section below it. A small house ad fills
the affiliate slot on pages that have neither an affiliate widget nor a foliage
panel, showing a Connecticut photograph with full attribution and a link to the
forecast.

## 2. What was verified

Checked against the production site and the corpus on 2026-09-05.

**Guides are reachable, but thinly.** `/g/avon-ct-travel-guide` sits at depth 3
from the homepage by three paths:

| Path | Depth | Sibling guide links on the linking page |
|---|---|---|
| `/destinations` → `/destinations/connecticut` | 3 | **171** |
| `/destinations` → `/destinations/connecticut/hartford-county` | 3 | 29 |
| `/foliage` → `/foliage/hartford-west` | 3 | **11** |

Plus lateral `same-region` edges from route neighbours. The homepage itself
links **7 guides** — one featured, six latest — out of roughly 480.

**Production hub depth** (the dev database is only partially seeded and
disagrees; production is authoritative):

| Hub | Guides | Sub-hubs |
|---|---|---|
| Connecticut | 171 | 8 counties |
| New York | 143 | 4 boroughs |
| England | 33 | 1 |
| Italy | 31 | 1 |
| California | 28 | 5 |
| the other 18 hubs | 1–2 each | — |

Those 18 are single-ballpark states, already gathered by the Major League
Ballparks collection.

**`Guides.list_states/0` already returns what the section needs** —
`%{state:, slug:, count:}`, ordered by count descending. No new query.

**The affiliate slots are empty on exactly the right pages.**
`EthosWeb.Affiliate.affiliate_unit/1` renders only when
`render_here?(locale, position)` is true, and `Ethos.Affiliates.locale_for/2`
returns `nil` for Connecticut — verified for `avon-ct-travel-guide` and
`hartford-ct-travel-guide`. Only `new-york` and `italy` have configured
locales. So all 171 Connecticut guide pages render two empty slots today.

**The photographs already exist and are already licensed.** 970 images under
`priv/photos/ct/`; 477 attached to Connecticut guides; 170 of 171 guides carry
at least one. Every one has `author`, `license` and `source_url` — Avon's first
photo is a CC0 Wikimedia image of Avon Congregational Church.

**Attribution is mandatory, not a nicety.** Licence distribution across the 477:

```
198  CC BY-SA 4.0     81  CC BY 4.0      21  CC BY-SA 2.0     9  CC BY 3.0
 90  CC BY-SA 3.0     33  CC0           15  CC BY 2.0        6  CC BY 2.5
                      24  Public domain
```

**420 of 477 require visible attribution.** The site already has the pattern —
`— {author}, {license}, via Wikimedia Commons` in `guide_html/photos.html.heex`,
`town_page.html.heex` and `place_html/show.html.heex`. The ad follows it.

## 3. Premises this design rejects

- **"A homepage section fixes the SEO."** It does not. A homepage section holds
  five links; it cannot change crawl equity for 480 pages. What it fixes is that
  the homepage currently gives a crawler no signal about the corpus's breadth,
  and it strengthens the five hubs those pages hang off. The change that
  genuinely improved Avon's position was the foliage route pages — a tight link
  neighbourhood of 11 rather than 171. More route-shaped pages is the real
  lever, and it is out of scope here.
- **"Source 25 new images."** 970 already exist, already licensed, already
  optimised. Sourcing more is work already done.
- **"Visit Connecticut" branding.** That is the state tourism board's identity.
  Using it implies an endorsement that does not exist, in the same season the
  plan is to ask them for one. The unit carries Ethos branding and credits DEEP
  as the data source, exactly as the forecast pages do.
- **A new ad slot on every page.** The affiliate slots are already in the
  layout and already empty where this matters. Adding a slot would put two
  ad-shaped units on pages that have an affiliate widget.

## 4. Homepage

Two new sections, appended below the existing featured guide and latest-six
list. Nothing is removed.

```
Travel Guides
  Connecticut     171 towns           → /destinations/connecticut
  New York        143 neighbourhoods  → /destinations/new-york
  England          33 boroughs        → /destinations/england
  Italy            31 zones           → /destinations/italy
  California       28 neighbourhoods  → /destinations/california
  All {n} destinations →      (n = length(Guides.list_states()))

Collections
  Antique Trail of CT · Major League Ballparks · The Burys of Connecticut
```

`Guides.list_states() |> Enum.take(5)` — computed at request time, so the list
reorders itself as the corpus grows and there is no hardcoded set to go stale.
The trailing link goes to `/destinations`. Its count comes from
`length(Guides.list_states())` rather than the literal 23, so it cannot drift
from the page it points at.

Collections come from `Collections.list_published/0`, which already orders by
title.

**The nouns are editorial.** "towns", "neighbourhoods", "boroughs", "zones"
describe what each hub actually contains and are better than a uniform
"guides". They live in a small map keyed by hub slug with `"guides"` as the
fallback, so an unmapped hub degrades to something true rather than to
something wrong.

## 5. The house ad

### Where it renders

```
render the house ad  ⟺  this is a controller-rendered public page
                    AND  no affiliate widget renders here
                    AND  no foliage panel renders on this page
```

The first clause is easy to omit and wrong to omit.
`Ethos.Affiliates.locale_for/2` returns `nil` for LiveViews, so "no affiliate
widget renders here" is trivially true on every authoring and account screen —
the guide editor, the import and publish screens, the suggestions inbox, user
settings. Without the clause the ad would appear on all of them. Detect it the
same way `Affiliate.locale_from_assigns/1` already does, with
`Map.has_key?(assigns, :socket) or Map.has_key?(assigns, :live_module)`, and
render nothing when either is present.

The second clause is not optional. Without it, an in-season Connecticut town
guide would promote the foliage forecast twice within about 200 pixels — once
in the panel, once in the ad. The rule also gets the targeting right without
any extra logic:

- **In season**, the 171 Connecticut guides carry the panel, which is specific
  and town-level. The ad appears on the roughly 70 other pages — New York,
  England, Italy, California, ballparks, places, hubs — introducing the
  forecast to readers who have not met it.
- **Out of season**, the panel disappears and the ad takes over on Connecticut
  pages too.

One rule, correct in both seasons. The page assigns already carry what is
needed: `assigns[:foliage]` is set by `GuideController.show/2` and is `nil`
whenever the panel does not render.

### Placement

`:bottom` only. The `:top` slot reserves 400px for the affiliate widget and
sits above the `<h1>` on pages whose entire value is organic search. A promo
after the content is also the better read — a reader who has finished the Avon
guide is exactly the reader for "when Avon's leaves turn".

### The unit

Small: a thumbnail, three lines, a credit line.

```
┌────────────────────────────────────────────────┐
│ [photo]  Connecticut Foliage Forecast          │
│          169 towns · seven state driving routes│
│          — Daderot, CC0, via Wikimedia Commons │
└────────────────────────────────────────────────┘
```

The whole unit links to `/foliage`. When the contextual town is known, the
second line names it and its window instead — "Avon · estimated peak Oct 21–27"
— using `Ethos.Foliage.peak_label/1` and honouring `peak_verified?/1`, so a
town that never reaches full colour reads "most advanced" here exactly as it
does on the forecast pages. The honesty rule does not get relaxed because the
surface is an advertisement.

## 6. Choosing the photograph

1. **Contextual.** If the page's assigns carry a guide or a place that
   resolves to one of the 169 foliage towns, and it has photos, use its first
   photo. No query — the guide or place is already loaded.

   The two schemas key differently and the difference is load-bearing: a
   `Guide` carries `destination_slug`, a `Place` carries `town_slug`. Reading
   `destination_slug` off a place returns `nil` silently and every Connecticut
   place page would quietly fall through to the generic pool.
2. **Otherwise**, a deterministic pick from a curated pool. The key is
   `assigns[:page_canonical]` when set — every public page assigns it — falling
   back to `assigns[:page_title]`, and to the first pool entry when neither is
   present. `@conn` is deliberately not used: the layout does not reference it
   today, and reaching for it would couple the component to the controller
   pipeline for no gain. Hash the key with `:erlang.phash2/2` over the pool
   size. No randomness, so caching and tests both stay predictable.

### The pool

About 25 Connecticut town slugs, chosen editorially for photographs that read
well at thumbnail size, listed as a module attribute. `Ethos.HouseAd.Pool`
resolves them to photo maps once at boot and stores the result in
`:persistent_term`, mirroring `Ethos.Foliage.Dataset`.

Slugs rather than photo records because the slug list is reviewable in a diff
and the photo data stays in one place. A slug whose guide is unpublished or
has no photos is skipped with a log line, not a raise — the ad is promotional,
and it must never be able to take a page down.

**Degradation:** an empty pool renders no ad at all rather than a broken image.
A fresh deploy against an unseeded database therefore shows nothing, which is
correct.

## 7. Attribution

Every rendered ad carries `— {author}, {license}, via Wikimedia Commons`,
matching the existing pattern, with the source URL linked when
`EthosWeb.Url.safe_http?/1` passes. This is a licence obligation for 420 of the
477 photographs, not a stylistic choice, and it is consistent with a site whose
whole pitch is meticulous sourcing.

A photo missing `author` or `license` is not rendered. Better no ad than an
unattributed one.

## 8. Validation and testing

- The ad renders on a non-Connecticut guide page.
- The ad is **absent** on an in-season Connecticut town guide — asserted both
  ways, since this is the no-duplication rule.
- The ad **is** present on a Connecticut town guide out of season, with the
  date injected rather than read from `Date.utc_today/0`.
- The ad never renders on a page where a live affiliate widget renders.
- The ad never renders on a LiveView — assert against an authoring screen such
  as the guide editor, which has no affiliate locale and would otherwise
  qualify.
- Every rendered ad contains an author and a licence string.
- A town whose peak is unverified renders "most advanced", not "estimated peak".
- The pool degrades to no ad when empty, without raising.
- The homepage lists five hubs with counts matching `Guides.list_states/0`, and
  a Collections section listing every published collection.
- Assertions go through real HTTP requests, not only through helper functions.
  A helper-only test leaves the template's call site unguarded.

## 9. Not doing

No new images sourced. No new layout slot. No CMS or admin for the pool — a
module attribute. No impression or click tracking. No changes to the affiliate
system's own behaviour. No new route-shaped pages, though that is the real SEO
lever and should be its own piece of work.

## 10. Risks

- **The pool goes stale.** Slugs are resolved at boot; an unpublished guide
  silently drops out of rotation. Mitigated by the skip-and-log behaviour and
  by the pool being small enough to eyeball.
- **The no-duplication rule depends on an assign.** If a future page renders
  the foliage panel without setting `assigns[:foliage]`, both would show.
  Mitigated by the two-way test.
- **A photo reads poorly at thumbnail size.** Editorial, not technical; the
  pool is a one-line-per-entry list and easy to revise.
