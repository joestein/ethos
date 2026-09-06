# Task 7 report: the home hero, cards, and the social island

**Status:** Complete. Commit `3e3d75442ae217c714ab5b0dcc35047ce6b1c40b` on branch `social-seasons`.

## What changed

- `lib/ethos_web/controllers/page_html/home.html.heex` — the hero is now
  wrapped in `bg-gradient-to-b from-accent-soft to-surface`, with the
  headline on `font-display text-display-lg text-ink`. All 12 hardcoded
  `zinc-*` colour classes in the file are gone, replaced per the mapping
  table (`text-zinc-400/500/600` → `text-ink-muted`, `bg-zinc-900` on the
  primary CTA → `bg-accent` + `text-accent-ink`). The featured-guide card and
  the latest-guides `<li>` now carry
  `rounded-2xl border border-line bg-surface-raised p-6 shadow-sm transition hover:shadow-md`
  in place of the old bare `border`. Copy is untouched. The house-ad block
  (lines 1-9) is untouched, per Amendment D.
- `lib/ethos_web/live/social_live.ex` — all `zinc`/`amber`/`red` classes
  migrated to tokens. Thumbs: the "mine" highlight is now
  `border-positive bg-positive/10` for thumbs-up and
  `border-negative bg-negative/10` for thumbs-down specifically (previously
  both shared one neutral `border-zinc-900 bg-zinc-100` style regardless of
  which thumb). The 1-10 rating picker's filled cells are `bg-star
  border-star` with explicit `text-ink` for the digit. The rating-error text
  is `text-negative`. Bare `border`/`border-t` everywhere got `border-line`.
  Hover states (`hover:bg-zinc-50`) became `hover:bg-surface-raised`.
- `assets/tailwind.config.js` safelist — added `bg-gradient-to-b`,
  `from-accent-soft`, `to-surface`, `border-positive`, `bg-positive/10`,
  `border-negative`, `bg-negative/10`, `bg-star`, `border-star`.
- `test/ethos_web/token_migration_test.exs` — added the two files to `@files`.
- `test/ethos_web/controllers/page_controller_test.exs` — added the
  brief's "the hero carries the seasonal gradient" test. Also **fixed three
  pre-existing assertions** that would otherwise have broken from this
  migration and were not called out in the brief: the CTA-button assertion
  hardcoded `class="rounded-md bg-zinc-900` (now `bg-accent`), and two
  heading assertions hardcoded `text-zinc-400` for the Collections and
  Foliage-routes `<h2>`s (now `text-ink-muted`). This is a plan defect per
  Amendment F, not scope creep — without the fix these three tests fail on
  the very migration the task requires.
- `test/ethos_web/season_tokens_test.exs` — added a new test, "the hero
  gradient utilities are actually generated", that reads the *compiled*
  `priv/static/assets/app.css` (mirroring the file's existing pattern) for
  `.bg-gradient-to-b`, `.from-accent-soft`, `.to-surface`. This is the check
  that actually proves Tailwind emitted the CSS, as opposed to
  `page_controller_test.exs`'s assertion, which only checks the class name
  appears in the rendered HEEx source and would pass even if the CSS were
  never generated.

## Scope decision: bare `border` left untouched in three home.html.heex list sections

The brief's Amendment B mapping table says "bare `border` → `border
border-line`" as a general rule, but Step 4 of this task explicitly scopes
the elevation upgrade to only "the featured-guide card and the
latest-guides list." The hubs, collections, and foliage-routes `<li>`s
(3 more bare-`border` cards) were left as plain `rounded-xl border p-4`,
matching the brief's literal scope. Tailwind's `border` utility with no
colour resolves to its built-in `borderColor.DEFAULT` (a hardcoded gray),
so these three list types keep a non-seasonal hairline. This is a
deliberate scope decision, flagged here per Amendment F rather than
silently expanded or silently left inconsistent without comment.

## Amendment F discrepancies found

- Brief said "14 occurrences" of hardcoded colour classes in
  `social_live.ex`; actual count of `zinc|emerald|amber|red-|rose-` lines
  was 13. `home.html.heex`'s count of 12 matched exactly.
- The brief's Step 3 snippet showed only the opening tags of the new
  gradient wrapper, not where it closes. I wrapped the *entire* existing
  content div (hero through the foliage-routes section) in the gradient,
  matching the snippet's literal nesting (gradient div outermost, the
  existing `mx-auto max-w-3xl` div nested inside) rather than closing the
  gradient early after the CTA buttons. This means the gradient's colour
  stop technically spans the full page height, though visually it reads as
  a fade concentrated near the top because `to-surface` is very close to
  `bg-surface` (the page's own background) in all four palettes.

## Non-vacuity check: the safelist experiment did NOT fail as expected

Per the task's instruction, I removed `from-accent-soft` from the
`tailwind.config.js` safelist, ran `mix assets.build`, and re-ran
`test/ethos_web/season_tokens_test.exs`. **All 5 tests still passed**, and
`priv/static/assets/app.css` still contained `.from-accent-soft { ... }`.

Reason: Tailwind's JIT content scanner (`content: [...]` in the config)
already globs `../lib/ethos_web/**/*.*ex`, which matches `.heex` files too.
Because `from-accent-soft` is a literal, statically-visible class string in
`home.html.heex`, Tailwind generates it from content-scanning alone,
independent of the safelist. The safelist entries for the gradient classes
are therefore currently redundant defensive entries, not load-bearing ones —
unlike, e.g., a class assembled by string interpolation, which content
scanning cannot see. I restored the safelist entries as instructed (harmless
and consistent with the rest of the file's convention), but the "prove it's
not vacuous" experiment the task specified genuinely did not demonstrate
what it was expected to for this particular utility. Reporting this
verbatim per Amendment F rather than writing around it.

## Contrast ratios (WCAG 2.1 relative-luminance formula, computed directly from `assets/css/app.css`'s RGB triples)

| Pairing | summer | autumn | winter | spring |
|---|---|---|---|---|
| `text-ink` on `bg-star` (filled rating cell) | 8.14:1 | 5.49:1 | 8.33:1 | 7.40:1 |
| `text-negative` on `bg-surface` (rating-error text) | 4.75:1 | 4.68:1 | 4.62:1 | 4.73:1 |
| `text-accent-ink` (white) on `bg-accent` (primary CTA, pre-existing, unchanged) | 5.47:1 | 5.18:1 | 5.93:1 | 4.99:1 |

All four clear WCAG AA's 4.5:1 in every season. The `positive`/`bg-positive/10`
and `negative`/`bg-negative/10` thumb highlights carry no new coloured text —
the button content is an emoji glyph, not a text string reading through the
tint — so Amendment B's specific "dark token text on pale token background"
trap does not apply there; I did not create a new colour-text-on-colour-tint
pairing anywhere in this task.

## Full suite

`MIX_TEST_PARTITION=_social mix test --max-cases 8`, foreground, twice
(once before the safelist experiment, once after restoring it):
**1391 tests, 0 failures, 4 excluded** both times. Baseline was 1389; the
two new tests (`page_controller_test.exs`'s gradient test and
`season_tokens_test.exs`'s generated-CSS test) account for the +2.
`mix assets.build` exits 0 and leaves a non-minified `priv/static/assets/app.css`
(2269 lines, readable, starts with the standard Tailwind banner comment).

## Browser check

`config/dev.exs` hardcodes port 4000, which was already held (both IPv4
`0.0.0.0:4000` and IPv6 wildcard) by the stale `ethos-app` Docker container
mentioned in the trap warning — `mix phx.server` cannot bind port 4000 while
that container is running. Rather than stop someone else's container, I
temporarily edited `config/dev.exs`'s port from 4000 to 4020 (a genuinely
free port), ran the server, verified, and then reverted the file with an
exact inverse edit — confirmed by `git diff config/dev.exs` showing no diff
afterward. No `git checkout` was used.

- **Summer** (today, 2026-09-06, resolves to summer per
  `Ethos.Seasons.current/1` since Sept 6 ≤ Sept 21): `curl -4
  127.0.0.1:4020/` returned HTTP 200 with `data-season="summer"` in the
  markup, `from-accent-soft` and `font-display` present in the hero markup.
  My own server's log showed `EthosWeb.PageController.home/2` handled the
  request and `Sent 200 in 35ms`, ruling out the Docker container having
  answered instead. Summer's tokens (`assets/css/app.css`): `--c-accent-soft:
  204 251 241` (pale mint/teal, `#CCFBF1`) fading to `--c-surface: 255 253
  247` (warm off-white cream). The headline renders in Fraunces
  (`font-display`) at `text-display-lg`.
- **Autumn**: ran `mix run -e 'Ethos.SiteSettings.put_season_override(:autumn)'`
  against the running server (confirmed by its own log inserting a
  `site_settings` row with `value: "autumn"`), then re-curled the same URL.
  `data-season="autumn"` now appears in the markup, same gradient class
  names, but the underlying CSS custom properties changed: `--c-accent-soft:
  255 237 213` (pale peach, `#FFEDD5`) fading to `--c-surface: 255 251 245`.
  The gradient visibly shifts from a cool mint wash to a warm peach wash
  between the two seasons. Log again showed `EthosWeb.PageController.home/2`
  and `Sent 200 in 38ms` for this second request.
- Cleared the override afterward
  (`Ethos.SiteSettings.put_season_override(nil)`), confirmed via a third curl
  that `data-season="summer"` returned (the calendar default), stopped the
  background `mix phx.server` task, and confirmed port 4020 was free again.

I did not take a screenshot (no browser automation tool was used — this was
curl + reading the rendered HTML/CSS values directly), but the colour values
above are read directly from the CSS custom properties that were actually
served, not inferred.

## Concerns for the next reviewer

1. The gradient div now wraps the *entire* page body content (hero through
   foliage routes), not just the above-the-fold hero, per the literal
   reading of the brief's snippet (see "Amendment F discrepancies" above).
   If the intent was a shorter, hero-only gradient, that's a follow-up edit
   to close the gradient div earlier — I did not do this unilaterally
   because the brief's own snippet nests the divs the way I built them.
2. Three list sections in `home.html.heex` (hubs, collections, foliage
   routes) still use bare `border` (Tailwind's hardcoded gray default), not
   `border-line`, per the scope decision above.
3. The safelist entries for `bg-gradient-to-b`/`from-accent-soft`/`to-surface`
   are currently redundant given the existing content-scan globs; they cost
   nothing but aren't the thing making the utility exist, contrary to what
   the task's verification instructions assumed.
