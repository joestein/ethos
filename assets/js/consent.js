// Purpose 1 of the TCF v2 purpose list: "Store and/or access information on a
// device". Analytics storage and the GetYourGuide widget's cookies both live
// under it, so one signal gates both.
//
// There is deliberately NO timeout on this promise. A timeout that RESOLVES on
// expiry would treat "the visitor has not answered yet" as consent, which is
// the exact thing this file exists to prevent; a timeout that REJECTS is
// indistinguishable, for every caller, from never resolving at all — which is
// already what happens. Non-EEA visitors are covered by the gdprApplies check
// below, not by a clock.
const STORAGE_PURPOSE = 1

const POLL_INTERVAL_MS = 250

// 120 × 250ms = 30 seconds of asking.
//
// The number is not the reasoning; the shape of the race is. A real CMP
// injects its `__tcfapi` stub from a tag in <head>, so it is normally present
// before this bundle even parses. The poll exists only for the ordering case
// where the stub lands a moment after we do — a race measured in hundreds of
// milliseconds, not seconds. Thirty seconds is therefore already absurdly
// generous against a slow CMP on a slow connection, and anything still absent
// after it is not late, it is not coming.
//
// The bound stops the ASKING, not the waiting, and those are different things.
// Without a bound, every page view where no CMP appears leaves a 250ms timer
// running for the life of the session.
const MAX_ATTEMPTS = 120

// --- the US opt-out path -----------------------------------------------------
//
// WHY THIS EXISTS. `__tcfapi` is served by Google's European regulations
// message, and that message is scoped to the EEA, UK and Switzerland. There is
// no AdSense setting that serves the TCF API worldwide. So for a US visitor the
// TCF branch above never fires at all: no stub appears, the poller gives up,
// the promise stays pending, and analytics is dark for what is probably most of
// the traffic — silently, with a clean console and a green suite.
//
// The fix is NOT to resolve when the TCF poller gives up. That would convert
// every non-answer into consent, for EEA visitors too, since one timer cannot
// tell a US visitor from a European one whose CMP was slow or blocked. It is to
// read the signal US visitors ACTUALLY get: the IAB Global Privacy Platform,
// published by Google's US state regulations message.
//
// The legal shapes are not the same and this code must not pretend they are.
// The EEA is opt-IN: absent a recorded "yes", nothing may load, which is why
// the TCF branch resolves only on an explicit purpose-1 consent. The US state
// regimes are opt-OUT: processing is permitted until the visitor objects, so a
// GPP section that records no opt-out is a real permission signal rather than
// an absence of one. That asymmetry is the entire justification for this branch
// existing, and it is why the branch reads a section and never a clock.
const US_OPT_OUT_FIELDS = ["SaleOptOut", "SharingOptOut", "TargetedAdvertisingOptOut"]

// In a parsed GPP section these fields are tri-state: 0 "not applicable",
// 1 "opted out", 2 "did not opt out". Only 1 is an objection; treating 0 as one
// would make every section that simply does not carry the field look like a
// refusal.
//
// `Gpc` is the Global Privacy Control browser signal, which several states
// (California among them) treat as a legally binding opt-out on its own. It is
// honoured here for that reason and not as a courtesy.
const optedOut = (section) => {
  if (!section || typeof section !== "object") return false
  if (section.Gpc === true) return true
  return US_OPT_OUT_FIELDS.some((field) => section[field] === 1)
}

// Only the US sections. `parsedSections` can also carry `tcfeuv2` for a visitor
// the European message covers, and that section is the TCF branch's business,
// not this one's — reading it here would let the opt-out rule decide an opt-in
// case.
const usSections = (ping) =>
  Object.entries((ping && ping.parsedSections) || {}).filter(([name]) =>
    name.startsWith("us")
  )

export const analyticsConsent = new Promise((resolve) => {
  let settled = false
  let timer = null

  // Settling ends the polling too. Once the promise has resolved no later
  // signal can change it, so continuing to hunt for the other API would leave a
  // 250ms timer running for the rest of the session to answer a question that
  // is already answered. There is no matching path for "refused": that state
  // never settles, by design, so its polling is stopped by the bound instead.
  const grant = () => {
    settled = true
    resolve()
    if (timer) clearInterval(timer)
  }

  // Each `listen*` returns whether there is any point asking again: `true`
  // means stop polling for that API. Note that "stop polling" is NOT "no
  // consent" and NOT "consent" — it only means the function has nothing left to
  // try. Whether the promise ever settles is decided entirely inside the
  // callbacks below.
  const listenTcf = () => {
    if (typeof window.__tcfapi !== "function") return false

    try {
      window.__tcfapi("addEventListener", 2, (data, success) => {
        if (!success || !data) return

        if (data.gdprApplies === false) return grant()

        if (data.eventStatus !== "useractioncomplete" && data.eventStatus !== "tcloaded") return

        if (data.purpose && data.purpose.consents && data.purpose.consents[STORAGE_PURPOSE]) {
          grant()
        }
      })
    } catch (_error) {
      // A CMP that throws when called will throw again in 250ms, so there is
      // nothing to retry: stop asking. Deliberately no resolve() here — a
      // broken CMP is not a consenting visitor, so this fails closed and
      // nothing loads. Uncaught, this throw would escape the interval callback
      // and leave the timer running forever, which is the leak this catch
      // exists to close rather than a signal it exists to interpret.
    }

    return true
  }

  const listenGpp = () => {
    if (typeof window.__gpp !== "function") return false

    try {
      window.__gpp("addEventListener", (event, success) => {
        if (!success || !event) return

        // The GPP CMP fires repeatedly while it boots and while the visitor is
        // still deciding. `signalStatus: "ready"` is the only state in which the
        // string is final; anything earlier is a work in progress and reading it
        // would be reading a half-written answer.
        const ping = event.pingData || event
        if (ping.signalStatus !== "ready") return

        const sections = usSections(ping)

        // No US section applies to this visitor, so this API has told us
        // nothing about them — a visitor outside every supported state reaches
        // exactly this branch. Silence here is not permission, so it does not
        // resolve; it simply leaves the decision to the TCF branch, which for
        // such a visitor will not fire either. That is the same pending state
        // as before this branch existed, deliberately preserved.
        if (sections.length === 0) return

        // One objection anywhere is an objection. A visitor covered by two
        // sections who opted out under either has opted out.
        if (sections.some(([, section]) => optedOut(section))) return

        grant()
      })
    } catch (_error) {
      // Same reasoning as the TCF catch above: fail closed, stop asking.
    }

    return true
  }

  let tcfDone = listenTcf()
  let gppDone = listenGpp()

  if (settled || (tcfDone && gppDone)) return

  // Either stub can land after this bundle does, so a single check at load is a
  // race we would lose silently. Poll until both exist or the bound is reached.
  // The two are tracked separately because a page can carry one without the
  // other — that is the normal case, not an edge one — and a shared flag would
  // stop looking for the second as soon as the first arrived.
  let attempts = 0

  timer = setInterval(() => {
    attempts += 1

    if (!tcfDone) tcfDone = listenTcf()
    if (!gppDone) gppDone = listenGpp()

    // DO NOT add a resolve() to this branch. Reaching the bound means no CMP
    // ever appeared, which is precisely the "no answer" case the no-timeout
    // rule above is about: the promise stays PENDING forever, nothing loads,
    // and the visitor is treated exactly as they are now. All that stops here
    // is the polling. Resolving on give-up would turn "nobody asked" into
    // "yes", which is the one outcome this file exists to prevent.
    if ((tcfDone && gppDone) || attempts >= MAX_ATTEMPTS) clearInterval(timer)
  }, POLL_INTERVAL_MS)
})
