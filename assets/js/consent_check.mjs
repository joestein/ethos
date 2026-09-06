// Run me:
//
//     node assets/js/consent_check.mjs
//
// Exits 0 if every scenario holds, non-zero with a diff on the first failure.
// No dependencies, no package.json, no test runner — this project has none.
//
// WHY THIS EXISTS. The Elixir suite proves the GetYourGuide widget host is GONE
// from `<head>`. Nothing in it proves `analytics.js` still PUTS IT BACK after
// consent, because that injection happens in a browser the suite never opens. A
// regression that dropped the injection — a bad merge in `analytics.js`, a
// renamed meta tag, a `consent.js` promise that stopped resolving — would leave
// CI entirely green while silently switching off affiliate revenue on every
// page. The same blind spot covers the other direction: a change that made the
// consent gate resolve too eagerly would load both scripts for visitors who
// never agreed, and CI would be green for that too.
//
// So this asserts the two claims the Elixir tests structurally cannot:
//
//   * consent granted  → BOTH scripts are injected
//   * consent withheld → NEITHER is, in every way it can be withheld
//
// It loads the REAL `consent.js` and `analytics.js` — not copies, not a
// paraphrase — against a stubbed `document`/`window`. If the shipped files stop
// behaving, this stops passing.
//
// HOW THE FILES ARE LOADED. Node treats a bare `.js` in a directory with no
// `package.json` as CommonJS, so `import "./analytics.js"` from here would fail
// to parse. The harness therefore copies both files, byte for byte apart from
// one rewritten import specifier (`./consent.js` → `./consent.mjs`), into a
// fresh temp directory per scenario. The rewrite lives HERE and not in the
// shipped files, which are left exactly as they are served. A fresh directory
// per scenario is what makes each one independent: `consent.js` builds its
// promise once at module-evaluation time, and Node caches modules by URL, so
// re-importing the same path would hand back the FIRST scenario's already
// settled promise and every later assertion would be meaningless.

import { mkdtempSync, readFileSync, writeFileSync, rmSync } from "node:fs"
import { tmpdir } from "node:os"
import { join, dirname } from "node:path"
import { fileURLToPath, pathToFileURL } from "node:url"

const HERE = dirname(fileURLToPath(import.meta.url))
const CONSENT_SRC = readFileSync(join(HERE, "consent.js"), "utf8")
const ANALYTICS_SRC = readFileSync(join(HERE, "analytics.js"), "utf8")

const POSTHOG_HOST = "https://us.i.posthog.com/static/array.js"
const GYG_HOST = "https://widget.getyourguide.com/dist/pa.umd.production.min.js"

const KEY = "phc_harness_key_not_a_real_project"
const PARTNER = "HARNESS_PARTNER"

// --- the stubbed browser -----------------------------------------------------

// Only the surface the two files actually touch. Anything they reach for that
// is missing throws, which is the point: a silent `undefined` would let a
// broken file pass.
const makeBrowser = ({ posthogKey, gygPartnerId, tcfapi }) => {
  const injected = []
  const captures = []
  const listeners = new Map()

  const makeElement = () => {
    const attrs = {}
    return {
      attrs,
      setAttribute(name, value) {
        attrs[name] = value
      }
    }
  }

  // PostHog's snippet inserts its <script> before the first one on the page
  // rather than appending to <head>, so the harness has to offer both routes or
  // it would only ever see the GetYourGuide injection.
  const firstScript = { parentNode: { insertBefore: (node) => injected.push(node) } }

  const metas = {
    "meta[name='posthog-key']": posthogKey,
    "meta[name='gyg-partner-id']": gygPartnerId
  }

  const document = {
    createElement: () => makeElement(),
    head: { appendChild: (node) => injected.push(node) },
    getElementsByTagName: (tag) => (tag === "script" ? [firstScript] : []),
    querySelector: (selector) => {
      if (!(selector in metas)) throw new Error(`unstubbed querySelector: ${selector}`)
      const content = metas[selector]
      return content ? { getAttribute: () => content } : null
    }
  }

  const window = {
    addEventListener: (name, fn) => {
      if (!listeners.has(name)) listeners.set(name, [])
      listeners.get(name).push(fn)
    }
  }

  if (tcfapi) window.__tcfapi = tcfapi

  return { document, window, injected, captures, listeners }
}

// Fake interval timers. The real poller runs for 30 seconds; nobody waits that
// long for a check, and "did it STOP polling" is only observable if the harness
// owns the clock.
const makeClock = () => {
  const timers = new Map()
  let nextId = 1

  return {
    setInterval(fn) {
      const id = nextId++
      timers.set(id, fn)
      return id
    },
    clearInterval(id) {
      timers.delete(id)
    },
    tick() {
      for (const fn of [...timers.values()]) fn()
    },
    get running() {
      return timers.size
    }
  }
}

// Promise callbacks queue as microtasks; a real `setTimeout(0)` yields to them.
const flush = async () => {
  for (let i = 0; i < 5; i++) await new Promise((r) => setTimeout(r, 0))
}

// --- loading the real files --------------------------------------------------

let scenarioSeq = 0

const loadAnalytics = async () => {
  const dir = mkdtempSync(join(tmpdir(), `consent-check-${scenarioSeq++}-`))
  writeFileSync(join(dir, "consent.mjs"), CONSENT_SRC)
  writeFileSync(join(dir, "analytics.mjs"), ANALYTICS_SRC.replace("./consent.js", "./consent.mjs"))

  try {
    await import(pathToFileURL(join(dir, "analytics.mjs")).href)
  } finally {
    rmSync(dir, { recursive: true, force: true })
  }
}

const run = async (browser, clock, body) => {
  const saved = {
    document: globalThis.document,
    window: globalThis.window,
    posthog: globalThis.posthog,
    setInterval: globalThis.setInterval,
    clearInterval: globalThis.clearInterval
  }

  globalThis.document = browser.document
  globalThis.window = browser.window
  globalThis.setInterval = clock.setInterval
  globalThis.clearInterval = clock.clearInterval

  try {
    await loadAnalytics()
    await flush()
    if (body) await body()
    await flush()
  } finally {
    Object.assign(globalThis, saved)
    if (saved.document === undefined) delete globalThis.document
    if (saved.window === undefined) delete globalThis.window
  }
}

// A TCF stub that hands the given payload to whatever `consent.js` registers.
const tcf = (payload, { success = true } = {}) => {
  const stub = (command, _version, callback) => {
    if (command !== "addEventListener") return
    stub.fire = (data = payload) => callback(data, success)
    stub.fire()
  }
  return stub
}

const GRANTED = { gdprApplies: true, eventStatus: "tcloaded", purpose: { consents: { 1: true } } }
const REFUSED = {
  gdprApplies: true,
  eventStatus: "useractioncomplete",
  purpose: { consents: { 1: false } }
}
const OUT_OF_SCOPE = { gdprApplies: false }
const BANNER_OPEN = {
  gdprApplies: true,
  eventStatus: "cmpuishown",
  purpose: { consents: { 1: true } }
}

// --- assertions --------------------------------------------------------------

const failures = []
let current = ""

const srcs = (browser) => browser.injected.map((el) => el.src)

const expect = (label, actual, wanted) => {
  const a = JSON.stringify(actual)
  const w = JSON.stringify(wanted)
  if (a !== w) failures.push(`${current}\n    ${label}\n      expected ${w}\n      got      ${a}`)
}

const expectInjected = (browser, { posthog, gyg }) => {
  const loaded = srcs(browser)
  expect("PostHog script", loaded.includes(POSTHOG_HOST), posthog)
  expect("GetYourGuide script", loaded.includes(GYG_HOST), gyg)
}

const scenario = (name) => {
  current = `  ${name}`
}

// --- the scenarios -----------------------------------------------------------

const both = { posthogKey: KEY, gygPartnerId: PARTNER }

// 1. The revenue case, and the one the Elixir suite cannot see: consent given,
//    so the GetYourGuide widget host is injected back into the page.
scenario("consent granted (EEA, TCF purpose 1) injects BOTH scripts")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(GRANTED) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: true, gyg: true })
}

// 2. Refused. Neither may load — this is the whole point of the branch.
scenario("consent refused injects NEITHER script")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(REFUSED) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: false, gyg: false })
}

// 3. No CMP at all. Nothing loads, AND the poller stops asking — if this ever
//    starts injecting, someone has added a resolve-on-timeout to `consent.js`,
//    which turns "nobody was asked" into "everybody agreed".
scenario("no CMP injects NEITHER script, and the poller stops")
{
  const browser = makeBrowser({ ...both, tcfapi: null })
  const clock = makeClock()
  await run(browser, clock, async () => {
    // Short of the 120-attempt bound it must still be asking; otherwise this
    // scenario would pass against a poller that never started.
    tickTo(clock, 100)
    expect("still polling short of the bound", clock.running, 1)
    tickTo(clock, 30)
  })
  expectInjected(browser, { posthog: false, gyg: false })
  expect("polling stopped at the bound", clock.running, 0)
}

// 4. Outside the GDPR's scope. The ONE line that makes analytics work for US
//    traffic: `gdprApplies === false` resolves with no user action at all. If
//    this scenario is the one that breaks, read Task 5 Step 7 of the plan
//    before touching `consent.js`.
scenario("gdprApplies false (outside the EEA/UK) injects BOTH scripts")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(OUT_OF_SCOPE) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: true, gyg: true })
}

// 5. The banner is on screen and the payload already carries a stale consent.
//    Nothing may load until the visitor has actually answered.
scenario("CMP banner still open injects NEITHER script")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(BANNER_OPEN) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: false, gyg: false })
}

// 6. A CMP that reports failure is not a consenting visitor.
scenario("CMP callback reporting failure injects NEITHER script")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(GRANTED, { success: false }) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: false, gyg: false })
}

// 7. The stub lands after this bundle does. This is the race the poller exists
//    for; if it regressed, analytics would be dark for everyone and no test
//    would say so.
scenario("a CMP stub arriving late still injects BOTH scripts")
{
  const browser = makeBrowser({ ...both, tcfapi: null })
  const clock = makeClock()
  await run(browser, clock, async () => {
    tickTo(clock, 3)
    browser.window.__tcfapi = tcf(GRANTED)
    clock.tick()
    await flush()
  })
  expectInjected(browser, { posthog: true, gyg: true })
  expect("polling stopped once the CMP answered", clock.running, 0)
}

// 8. Consent given on a page carrying no affiliate unit. PostHog loads; the
//    widget must not appear where no partner id was rendered.
scenario("no gyg-partner-id meta injects PostHog only")
{
  const browser = makeBrowser({ posthogKey: KEY, gygPartnerId: null, tcfapi: tcf(GRANTED) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: true, gyg: false })
}

// 9. Dev and test render no key. Nothing may initialise, but the affiliate
//    widget is a separate decision and still loads.
scenario("no posthog-key meta injects GetYourGuide only")
{
  const browser = makeBrowser({ posthogKey: null, gygPartnerId: PARTNER, tcfapi: tcf(GRANTED) })
  await run(browser, makeClock())
  expectInjected(browser, { posthog: false, gyg: true })
}

// 10. The LiveView pageview allowlist. "patch" and "redirect" are navigation;
//     "initial" is the load already captured, and "element" fires for any
//     element carrying phx-page-loading — counting it would make every click a
//     pageview.
scenario("LiveView pageviews count patch and redirect only")
{
  const browser = makeBrowser({ ...both, tcfapi: tcf(GRANTED) })
  await run(browser, makeClock(), async () => {
    const handlers = browser.listeners.get("phx:page-loading-stop") || []
    expect("a pageview handler was registered", handlers.length, 1)
    for (const kind of ["patch", "redirect", "initial", "element", "invented"]) {
      handlers.forEach((fn) => fn({ detail: { kind } }))
    }
  })

  // The snippet's stub records calls as ["capture", "$pageview"] tuples: one
  // for the document load, then one per navigation.
  const pageviews = (browser.window.posthog || []).filter(
    (call) => Array.isArray(call) && call[0] === "capture" && call[1] === "$pageview"
  )
  expect("pageviews (1 load + patch + redirect)", pageviews.length, 3)
}

// --- helpers used above ------------------------------------------------------

function tickTo(clock, n) {
  for (let i = 0; i < n; i++) clock.tick()
}

// --- report ------------------------------------------------------------------

if (failures.length > 0) {
  console.error(`\nconsent_check: ${failures.length} failure(s)\n`)
  failures.forEach((f) => console.error(f + "\n"))
  process.exit(1)
}

console.log("consent_check: 10 scenarios, 0 failures")
