# Affiliate Placement: Geography-Keyed Widgets

**Status:** approved design, ready for planning
**Date:** 2026-08-31

## Goal

Put the GetYourGuide widget on every New York page — guides, places, destination
hubs and collections — without touching any other page, and build it so Rome,
Amsterdam and a second affiliate network are configuration rather than code.

Two tags, from the partner dashboard, verbatim:

```html
<!-- head -->
<script async defer
        src="https://widget.getyourguide.com/dist/pa.umd.production.min.js"
        data-gyg-partner-id="ZA4AIMF"></script>

<!-- body -->
<div data-gyg-widget="auto" data-gyg-partner-id="ZA4AIMF" data-gyg-cmp="new-york"></div>
```

Both values in those tags — the partner id and the campaign — come from
configuration in the shipped implementation. They are written out here so the
plan can assert against the exact strings.

## What exists today

**One GetYourGuide unit, on guide pages only.** An amber aside in
`lib/ethos_web/controllers/guide_html/show.html.heex:35-51`, linking to
`gyg_partner_url()` — a generic partner link to the GetYourGuide home page,
configurable via `Application.get_env(:ethos, :gyg_partner_url, ...)`. It renders
on **every** guide: Rome, all 165 Connecticut towns, all 30 ballparks, every
borough. It sits **above** the entries list.

**Per-entry `booking_url` product links.** `show.html.heex:90-96` renders a "Book
this" button per entry when the entry carries a `booking_url`. The Rome guide's
Colosseum arena-floor tour is one. These are specific products with purchase
intent, not browse links.

**A third-party script already lives in the head.** Google AdSense, unconditional,
`root.html.heex:13-18`. So a `<script>` in `<head>` is not a new category of
thing for this site.

**Place pages, destination hubs, collections and search carry no affiliate unit
at all.**

## Decisions taken before design

Recorded because each one closes a question the implementation would otherwise
reopen:

1. **Non-New-York pages keep the amber CTA unchanged.** Zero regression across
   200-plus existing pages. The amber aside becomes the fallback, and each
   destination flips from fallback to widget as its campaign code is configured.
2. **One unit per page, at the bottom.** Not in the amber aside's current
   mid-page slot. Content first.
3. **All four page types**: guides, places, destination hubs, collections.
4. **Per-entry `booking_url` links are untouched.** A specific product link
   converts better than a generic browse widget; replacing them would trade
   revenue for uniformity.

## Design

### Both tags live in the layouts

This is the decision that makes "it must not break for pages added later" true
rather than aspirational.

`lib/ethos_web/components/layouts/app.html.heex` renders `{@inner_content}`
inside the content column. The widget goes **immediately after it**, inside the
same `max-w-2xl` div — the bottom of the content, on every page, automatically.
The script goes in `root.html.heex`'s `<head>`, beside the AdSense tag.

A new controller, a new page type, a new borough therefore inherits both tags
with no work. The alternative — assigning a locale in each controller action —
is one forgotten `assign` away from silently missing on every page added after
this ships, and nothing would fail.

**The home page is the one exception** and it is correct. `page_controller.ex:39`
renders with `layout: false`, so it receives neither tag. It is not a New York
page.

### The resolver: `EthosWeb.Affiliate.locale_from_assigns/1`

Called from both layouts. Returns a locale map or `nil`. Clauses are tried in
this order, and the order is load-bearing because a page may carry more than one
of these keys:

| # | Assign present | Rule |
| --- | --- | --- |
| 1 | `:guide` (singular) | Resolve from `guide.state_slug` and `guide.county` |
| 2 | `:place` | Resolve from `place.state_slug` and `place.county` |
| 3 | `:collection` | Unanimity over `collection.items[].guide` |
| 4 | `:guides` (list) | Unanimity over the list |
| 5 | none of the above | `nil` |

Both `Ethos.Guides.Guide` and `Ethos.Places.Place` carry `state`, `state_slug`,
`county` and `county_slug`, so clauses 1 and 2 read the same two fields.

**Unanimity means: resolve every guide in the list; if they all yield the same
locale, that is the page's locale; otherwise `nil`.** A list containing even one
guide that resolves to `nil` is not unanimous.

Clause 4 covers all three destination-hub shapes without naming them, because
each assigns `guides` — verified, not assumed: `state_show`
(`destination_controller.ex:119-121`), `county/2` (`:154-160`), and `town_show`
(`:76-79`). The state hub also assigns `shadowed`
— guides from *other* states that share a destination slug. **`shadowed` is
deliberately not consulted.** Those guides are not what the page is about.

**An unrecognised page shape yields `nil`.** The failure mode of this design is
a missing widget, never a wrong one. That asymmetry is the reason the resolver
reads assigns rather than being handed an explicit tag by each controller: a
controller that forgets to tag itself gets nothing, which is safe, and it costs
nothing to add the tag later.

### Unanimity earns its keep immediately, in a place we did not plan for

`/destinations/madison` serves two guides: `priv/seed_data/brooklyn/madison.json`
("Madison, New York") and `priv/seed_data/connecticut/madison.json` ("Madison,
Connecticut"). They derive the same `destination_slug` and co-list on one page —
a live collision recorded in `docs/content-defects.md`.

Under unanimity that page resolves to `nil` and gets no widget, which is the
right answer: it is half a New York page. A rule that took the first guide, or a
majority, would have put a New York City tours widget on a page that is also
about a Connecticut shoreline town.

The same rule excludes the MLB ballparks collection: 30 ballparks across 19
distinct state values — 17 US states plus District of Columbia and Ontario. A
New York widget on a page about Dodger Stadium and Fenway is wrong in a way that
costs trust rather than merely conversion. Today unanimity means no collection
carries a widget; it turns on by itself the day a single-geography collection
exists.

### The registry

```elixir
config :ethos, :affiliate_locales, %{
  "new-york" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "new-york",
    counties: ~w(Manhattan Brooklyn Bronx Queens Staten Island)
  }
}
```

Keyed by **state slug**. Resolution: look up `state_slug`; if absent, `nil`. If
present and the entry has a `counties` list, the page's county must be in it —
**except when the county is `nil`**, which is the state-hub case
(`/destinations/new-york`) and resolves to the locale.

**The `counties` list is a guard, not decoration.** GetYourGuide's `new-york`
campaign is New York *City*. Every New York page in the corpus today is a
borough — the only counties present are Bronx, Brooklyn and Manhattan, with
Queens scaffolded — so keying on state alone is correct today and silently wrong
the day a Hudson Valley or Niagara guide ships, which would inherit a campaign
for a city 300 miles away. Remove the list only when a separate upstate campaign
exists.

Staten Island is listed although no Staten Island content exists yet, because it
is a borough and the campaign covers it. This is the one entry in the list that
is forward-looking rather than descriptive.

Rome and Amsterdam are one config entry each, no code. A second affiliate
network is a new `network:` value and one more clause in the components.

### The components

`EthosWeb.Affiliate`, two function components:

- **`<.affiliate_head locale={...} />`** — renders the script when a locale is
  present, nothing when `nil`. `async defer`, so it never blocks render.
- **`<.affiliate_unit locale={...} />`** — renders the widget div when a locale
  is present, nothing when `nil`.

Both dispatch on `locale.network`. With one network there is one clause each;
the seam exists so a second network is an addition rather than a rewrite.

### What happens to the amber CTA

It stays exactly as it is on every page whose locale is `nil` — Rome,
Connecticut, the ballparks.

On a page **with** a locale it is suppressed. So a Belmont guide loses the
mid-page amber aside and gains the widget below its entries: content first, one
affiliate unit, no doubling.

The suppression condition is the presence of a locale, not a hardcoded state
check, so Rome's amber aside turns into Rome's widget the day a Rome entry lands
in the registry — with no template edit.

## Testing

Render tests carry little information here; the interesting assertions are the
ones that can fail.

**Resolver:**

- A guide in each of the four boroughs resolves to the New York locale.
- **A fabricated upstate New York guide — state `New York`, county `Albany` —
  resolves to `nil`.** This is the assertion that makes the `counties` guard
  load-bearing. Without it the list could be deleted and every test would stay
  green.
- A Connecticut guide, a Rome guide and a place in Connecticut all resolve to
  `nil`.
- `/destinations/new-york` — county `nil` — resolves to the locale. The
  nil-county exception has its own test because it is the one branch that reads
  like an oversight.
- **The real `/destinations/madison` guide list resolves to `nil`.** Built from
  the committed seed files, not a fixture, so it cannot rot into a case that
  stops matching production.
- **The real MLB ballparks collection resolves to `nil`**, same reasoning.
- A list containing one unresolvable guide is not unanimous.

**Rendering, both directions — each alone passes trivially:**

- A New York guide page renders the widget div **and not** the amber aside.
- A Rome guide page renders the amber aside **and not** the widget and **not**
  the script.
- The script appears on a New York page and is absent from a Connecticut page.
  Its absence is the assertion; its presence alone would pass against an
  unconditional tag.

**Corpus-wide:**

- **No page renders two widget divs.** One walk over every page type. This is
  the assertion that catches the future mistake of adding the unit to a template
  when it already comes from the layout.
- Exact-string assertions on the rendered script `src`, `data-gyg-partner-id`,
  `data-gyg-widget` and `data-gyg-cmp`, against the values at the top of this
  spec. A widget with a wrong campaign renders perfectly and earns nothing.

## Risks

**A third-party script that tracks users.** AdSense is already unconditional in
the head, so this is not a new category, but this one is deliberate and scoped:
it loads only on pages with a locale. Stated so the choice is on the record
rather than inherited.

**The widget's rendered appearance is unverifiable before deploy.**
GetYourGuide's auto widget chooses its own layout, and the content column is
`max-w-2xl`. If it renders badly there, the fix is the container, not the
architecture. Check it on the first deploy.

**Suppressing the amber aside changes a page that currently converts.** The
amber CTA on New York guides is above the fold; the widget is below the content.
The trade is deliberate — content first was the instruction — but it is a real
change in placement, and if New York affiliate revenue drops after this ships,
the placement is the first thing to look at, not the widget.

**`data-gyg-cmp` values are not validated against anything.** A typo in a
campaign code produces a widget that renders and earns nothing. The exact-string
tests cover the New York entry; every future entry needs the same, which is a
note for whoever adds Rome.

## Success criteria

- Every guide, place and destination hub whose locale resolves to New York
  carries exactly one widget div and one script tag.
- No page outside New York carries either.
- No page carries two widget divs.
- The amber CTA is unchanged on every page without a locale, and absent on every
  page with one.
- Per-entry `booking_url` links are unchanged everywhere.
- A new page type added later inherits both tags with no code change — verified
  by the corpus-wide walk, not by assertion in prose.
- Full suite green.
