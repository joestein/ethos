# PostHog analytics behind a certified consent layer — design

**Date:** 2026-09-06
**Status:** approved, awaiting implementation plan

## Goal

Product analytics on every public page, gated on a consent signal that keeps
AdSense compliant in the EEA and the UK, with a privacy policy that describes
what the site actually collects.

## Why this is not just a script tag

The obvious design — one banner, gating all three third-party scripts — does
not work for the one script that earns money.

`root.html.heex` loads three third parties today: Google AdSense, the
GetYourGuide affiliate widget, and (after this) PostHog. Google's publisher
policy has required, since January 2024, that publishers serving the EEA and
the UK use a **Google-certified CMP** integrated with the IAB Transparency &
Consent Framework. A consent banner written in this repo satisfies GDPR for
PostHog and GetYourGuide and does **not** satisfy that contractual requirement
for AdSense.

AdSense earns meaningfully on this site, so removing it from the EEA/UK to
dodge the requirement is not acceptable. The requirement is therefore met
rather than avoided, and the consequence shapes everything below: **the banner
is Google's, not ours.** We write a consent *reader*, not a consent *UI*.

## What is already here

- `root.html.heex` renders the AdSense script unconditionally and
  `EthosWeb.Affiliate.affiliate_head/1` conditionally.
- `config/runtime.exs` already has the pattern this needs:
  `GOOGLE_SITE_VERIFICATION` is read from the environment and rendered only
  when set. `POSTHOG_PUBLIC_KEY` follows it exactly.
- `.env` is gitignored; `.env.example` documents the variables.
- `assets/js/app.js` is the stock Phoenix file, 65 lines, no custom hooks.
- **There is no privacy policy page and no consent handling of any kind.**

## Architecture

Five units, each with one job. Only three of them are code in this repo — the
CMP is configured in Google's dashboard, and the privacy page is prose.

### 1. The CMP — Google's, configured outside this repo

Google Funding Choices, enabled in the AdSense dashboard. It renders the
banner, handles AdSense's own consent, and publishes the standard TCF
`window.__tcfapi`.

**This is a manual step in Google's dashboard and cannot be done from this
repo.** Until it is done, the signal never arrives and PostHog stays dark —
which makes deploy order load-bearing, and is stated again under Risks.

### 2. `assets/js/consent.js` — the reader

One module, one export: a promise that resolves when analytics storage is
permitted.

It waits for `__tcfapi` and registers an event listener. It resolves when the
visitor has granted **TCF Purpose 1** — "Store and/or access information on a
device" — which is the purpose PostHog's cookies actually need. It also
resolves immediately when the CMP reports that the visitor is outside the
scope of the framework (`gdprApplies === false`), which is how US and other
non-EEA traffic is tracked without a banner.

It never resolves on refusal. Nothing downstream loads.

**A timeout is deliberately NOT included.** A timeout that resolves on expiry
would load PostHog for a visitor whose CMP was slow — that is, it would treat
"no answer yet" as consent. A timeout that rejects on expiry is equivalent to
never resolving, which is already the behaviour. So the promise simply waits.

### 3. PostHog — loaded after consent, never before

`root.html.heex` gains a block that renders only when
`Application.get_env(:ethos, :posthog_public_key)` is set, passing the key to
the JS as a data attribute rather than interpolating it into a script body.

`app.js` imports the consent promise, and on resolution initialises PostHog
and captures the first pageview. It also registers a `phx:page-loading-stop`
handler to capture `$pageview` on LiveView navigation, which PostHog's
autocapture does not see.

`/foliage/embed` receives nothing: it calls `put_root_layout(false)`, so the
head block never renders there. That is correct rather than incidental — the
embed runs inside other people's sites, and tracking visitors there is a
different act from tracking them here.

### 4. GetYourGuide — moved behind the same gate

`affiliate_head/1` renders a third-party script that sets cookies. It is
currently unconditional wherever a locale resolves, including for EEA/UK
visitors. Since Rome is an Italian locale and London guides now ship, this is
live EEA/UK exposure today.

The same consent promise gates it. This is a behaviour change to existing
revenue-bearing code and is called out as such in the plan.

### 5. `/privacy` — the page the banner points at

A static page rendered by `PageController`, listing what each third party
does and what first-party cookies exist. Linked from the site footer and
configured as the CMP's privacy-policy URL.

It will be **drafted from the code's actual behaviour** — PostHog for product
analytics, AdSense for advertising, GetYourGuide for affiliate attribution,
plus the Phoenix session cookie and the 60-day remember-me cookie already in
`user_auth.ex`. It is a draft for the site owner to review. It is not legal
advice and this spec does not claim it is sufficient for any jurisdiction.

## Configuration and secrets

The key never enters the repository.

| Where | What |
|---|---|
| `.env.example` | `POSTHOG_PUBLIC_KEY=` with a comment, committed |
| `.env` | the real value, gitignored, loaded with `set -a; source .env; set +a` |
| `config/runtime.exs` | `if key = System.get_env("POSTHOG_PUBLIC_KEY"), do: config :ethos, :posthog_public_key, key` |
| Fly | `fly secrets set POSTHOG_PUBLIC_KEY=…`, set BEFORE the first deploy carrying this code |

Dev and test set nothing, so the head block renders nothing and no events are
sent. That is the default, and the failure direction is silence rather than
pollution.

`phc_`-prefixed PostHog keys are public client keys, designed to be visible in
browser JavaScript. Keeping it out of the repo is hygiene and deploy
discipline, not secrecy — it will appear in the page source of every
production page regardless.

## Testing

What is testable in ExUnit, and honestly bounded:

- `/privacy` returns 200 and is linked from the footer.
- The PostHog block renders when `:posthog_public_key` is configured, and
  renders **nothing** when it is not. The second half is the one that matters:
  it is the dev/test default and the guard against leaking events.
- The block is absent from `/foliage/embed`.
- No committed file contains a `phc_` string — a grep over the tree, so a
  future paste cannot slip the key into the repo unnoticed.

What is not:

- The consent handshake itself runs against Google's CMP in a real browser.
  There is no ExUnit assertion for "the banner appeared and the visitor
  clicked accept".

### Manual verification on production

The handshake has no automated coverage, so it gets an explicit checklist
rather than a hope. Run it once with an EEA/UK VPN and once without:

1. **Outside the EEA/UK** — no banner appears, and PostHog receives a pageview.
2. **Inside, before answering** — no PostHog request in the network tab, and
   no GetYourGuide script. The banner is showing.
3. **Inside, after accepting** — PostHog and GetYourGuide both load, and the
   pageview arrives.
4. **Inside, after declining** — neither loads, and no PostHog request is made
   for the rest of the session.
5. **AdSense** — ads still render in all four states above. This is the
   revenue check, and it is the one worth doing first.
6. **LiveView navigation** — open a guide, navigate to the editor, and confirm
   a second `$pageview` arrives.

## Risks

**The CMP is configured outside this repo, so deploy order matters.** Ship the
code before enabling Funding Choices and PostHog stays dark — no data, no
error, nothing obviously wrong. Enable the CMP first.

**This touches live ad revenue.** A misconfigured CMP changes AdSense
behaviour on every page. Verification on production is part of the work, not
an optional follow-up.

**EEA/UK analytics will look thin, and that is correct.** A visitor who
declines produces no PostHog data. London and Rome pages will under-report
relative to US pages, permanently. Reading that gap as a bug later would be
the mistake.

**GetYourGuide moves behind a gate it did not have.** Affiliate impressions in
the EEA/UK will fall for visitors who decline. That is the compliant
behaviour, and it is a revenue change, not a bug.

## Out of scope

A self-hosted reverse proxy for PostHog to evade ad blockers. Session
recording. Feature flags. Identifying logged-in users to PostHog — the current
design captures anonymous product analytics only, and tying events to accounts
is a separate decision with its own privacy consequences.
