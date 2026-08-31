# Rome Affiliate Locale, and Per-Locale Placement

**Status:** approved design, ready for planning
**Date:** 2026-08-31
**Predecessor:** `docs/superpowers/specs/2026-08-31-affiliate-placement-design.md`

## Goal

Put the GetYourGuide widget on Rome pages with the `rome` campaign, at the top
of the page rather than the bottom, and add the per-locale placement field that
requires.

The tags, verbatim from the partner dashboard:

```html
<script async defer
        src="https://widget.getyourguide.com/dist/pa.umd.production.min.js"
        data-gyg-partner-id="ZA4AIMF"></script>

<div data-gyg-widget="auto" data-gyg-partner-id="ZA4AIMF" data-gyg-cmp="rome"></div>
```

This is sub-project A of two. Sub-project B — deep research of Rome's rioni and
quartieri for churches, historic sites, religious stops and hotels — gets its own
spec and inherits this locale for free.

## The blocker: a config entry alone cannot work

The shipped registry is keyed on **state slug**, which assumed US-style
state/county geography.

`lib/ethos/seeds/rome_guide.ex` sets no `state` and no `county`. Its `data/0`
returns `slug`, `title`, `destination`, `intro`, `sections`, `faq`, `entries`,
`photos` — nothing geographic beyond `destination: "Rome, Italy"` — and its
`upsert!/1` passes only `title` and `destination` to `Guide.changeset`. So
`state_slug` is `nil`, and the resolver's first clause is
`locale_for(nil, _county), do: nil`.

A `"rome"` entry in the registry would never fire. That is why this alters an
interface rather than adding a line of config.

## The campaign code: scope and code differ, deliberately

The owner chose **country-level scope** — one entry covering all of Italy, no
city guard — and the campaign code is **`rome`**.

Those are not in tension. GetYourGuide issues city-scoped campaign codes;
`rome` is the code that exists. There is no `italy` code to use. So the entry
covers `italy` and reports under `rome`.

**The consequence, recorded so it is not a surprise:** when Florence or Venice
ship, they inherit `cmp=rome` unless the entry is split first. Deferring the
guard is deliberate — a guard over a one-city corpus guards nothing.

**Correction to the fix path recorded here originally.** It said the remedy was
"the same allowlist mechanism `new-york` uses". On its own, it is not — it is
inert. `county_allowed?/2` (`lib/ethos/affiliates.ex:64-70`) reads:

```elixir
case {Map.get(locale, :counties), county} do
  {nil, _} -> true
  {_counties, nil} -> true
  {counties, county} -> county in counties
end
```

Rome carries no county, and every Italian guide seeded the way Rome was will
carry none either. So a future `counties: ["Rome"]` on the `italy` entry is
matched by the **second** clause, not the third, and Florence resolves anyway —
still reporting `cmp=rome`, silently, with the guard in place and looking
correct.

That nil-county clause is load-bearing for the New York state hub
(`/destinations/new-york` resolves with a nil county) and must not be removed.

**So the real fix path, for whoever ships the second Italian city:** backfill a
`county` on the Italian guides — Rome's included — *and then* add the
`:counties` allowlist. Either half alone changes nothing.

## Design

### Rome gets a state

`rome_guide.ex`'s `data/0` gains `state: "Italy"`, and `upsert!/1` passes it
through `Guide.changeset`, which already casts `:state` (`guide.ex:33`) and
derives `state_slug` from it via `put_geo_slugs/1`. No county.

**Side effect, and it is a new public page:** `/destinations/italy` starts
serving as a state hub listing the Rome guide, and the sitemap picks it up as a
new indexed URL. This is consistent with how Connecticut and New York work —
every other guide's state produces a hub — but it is a page that did not exist
before, and it will exist with exactly one guide on it until sub-project B runs.

### The registry entry

```elixir
"italy" => %{
  network: :getyourguide,
  partner_id: "ZA4AIMF",
  cmp: "rome",
  placement: :top
}
```

No `counties` key. `county_allowed?/2` returns `true` when the key is absent, so
every Italian page resolves — the country-level scope, expressed by omission
rather than by a new mechanism.

### Per-locale placement

This is the only real code in the sub-project.

A new **optional** `placement` field, `:top` or `:bottom`, **defaulting to
`:bottom`**. The default matters: New York's entry is not edited, and any future
entry that omits the field behaves like New York rather than like Rome.

`affiliate_unit/1` gains a `position` attr and renders only when the locale
resolves **and** its placement matches that position. `app.html.heex` calls it
twice:

```heex
<div class="mx-auto max-w-2xl">
  <.flash_group flash={@flash} />
  <EthosWeb.Affiliate.affiliate_unit position={:top} locale={...} />
  {@inner_content}
  <EthosWeb.Affiliate.affiliate_unit position={:bottom} locale={...} />
</div>
```

**The one-unit-per-page invariant survives** because the two slots are mutually
exclusive on a single locale — but that is an assertion, not an assumption, and
it is tested at both placements.

The unit's vertical margin flips with placement: `mt-10` separates a
bottom-placed unit from the content above it, and a top-placed unit needs
`mb-10` to separate it from the content below. The disclosure line stays
directly beneath the widget in both cases, so "Tours and activities shown above"
remains accurate at either placement.

**`unit_renders?/1` stays placement-agnostic.** It answers "will this page carry
a unit at all", which is what the guide show template needs to decide whether to
suppress the amber CTA and the booking-link disclosure. Making it
placement-aware would suppress the amber CTA only at one placement, which is
not the question it is asked.

### What top placement actually means, stated plainly

`{@inner_content}` is the entire page template, including its `<h1>`. A
top-placed unit therefore renders **above the page title**, not below it.

That is aggressive. It pushes the title and all content below the widget, and on
a phone it may be the whole first screen. The alternative — below the `<h1>` but
above the article — requires a per-template slot, which is exactly what the
predecessor spec rejected because it destroys the layout-inheritance property
that makes new page types work with no code.

The owner asked for top placement for Rome specifically, so this ships as asked.
It is recorded here as the thing to look at first if Rome's engagement metrics
move the wrong way, and as the reason the field defaults to `:bottom`.

### The registry-shape guard extends

`test/ethos_web/affiliate_corpus_test.exs:78` already iterates every configured
entry asserting `network`, `partner_id` and `cmp`. It gains: **if `placement` is
present it must be `:top` or `:bottom`.**

That test is the one thing protecting whoever adds Amsterdam. A misspelled
placement — `:above`, `"top"` — would otherwise match neither slot and render
nothing at all, silently, which is the failure mode this whole registry keeps
producing and the reason the guard exists.

## Testing

Presence assertions are near-worthless here; both placements render the same
markup. The assertions that carry information:

- **Ordering.** On a Rome page, the widget div's position in the HTML is
  **before** a known content marker (the page `<h1>`). On a New York page it is
  **after**. Asserting presence alone passes identically for both placements and
  proves nothing about the feature.
- **Exactly one unit** on a Rome page and on a New York page. Two slots exist
  now; this is the assertion that catches both firing.
- **Rome renders `data-gyg-cmp="rome"`, New York renders `data-gyg-cmp="new-york"`**
  on the same deploy. A shared-campaign regression would otherwise be invisible.
- **A locale omitting `placement` renders at the bottom.** This pins the default,
  which is what keeps New York unchanged.
- **An invalid placement value fails the registry-shape test**, proved by
  mutation — set one and confirm exactly that test goes red.
- **Rome's amber CTA disappears and its Colosseum `booking_url` link survives**,
  with the booking-link disclosure still rendering, per the predecessor spec's
  final fix. Rome is the only guide in the corpus carrying both an affiliate
  locale and a sponsored entry link, so it is the only page where that
  interaction is observable.
- **`/destinations/italy` returns 200 and carries the widget.**

## Risks

**Top placement above the `<h1>`** — described above. First thing to check after
deploy.

**`/destinations/italy` is a new indexed URL with one guide on it.** Thin, until
sub-project B fills it. Not a defect, but it will appear in the sitemap and in
Search Console before it has content to justify it.

**`cmp=rome` on any future Italian page.** Recorded above; the fix is a county
backfill **plus** a guard, added when the second city ships, not now. The guard
alone does nothing — see the correction above.

**Two placement slots is a shape that invites a third.** The field is
deliberately two-valued. A future "top and bottom" or "inline" request should
re-open this design rather than adding a value, because the one-unit-per-page
invariant is what keeps the pages from reading as an ad farm.

## Success criteria

- Rome pages carry the script and exactly one widget, campaign `rome`, above the
  content.
- New York pages are unchanged: one widget, campaign `new-york`, below the
  content.
- A registry entry omitting `placement` renders at the bottom.
- An invalid `placement` fails the registry-shape test.
- `/destinations/italy` serves.
- Rome's amber CTA is gone; its per-entry booking link and the booking-link
  disclosure both remain.
- Full suite green.
