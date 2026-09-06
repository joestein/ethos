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
// This is the expected state between this deploy and the Funding Choices
// switch being thrown in the Google dashboard — the design spec says so: "Ship
// the code before enabling Funding Choices and PostHog stays dark." Without a
// bound, every one of those page views leaves a 250ms timer running for the
// life of the session.
const MAX_ATTEMPTS = 120

export const analyticsConsent = new Promise((resolve) => {
  // Returns whether there is any point asking again: `true` means stop
  // polling. Note that "stop polling" is NOT "no consent" and NOT "consent" —
  // it only means this function has nothing left to try. Whether the promise
  // ever settles is decided entirely inside the callback below.
  const listen = () => {
    if (typeof window.__tcfapi !== "function") return false

    try {
      window.__tcfapi("addEventListener", 2, (data, success) => {
        if (!success || !data) return

        if (data.gdprApplies === false) return resolve()

        if (data.eventStatus !== "useractioncomplete" && data.eventStatus !== "tcloaded") return

        if (data.purpose && data.purpose.consents && data.purpose.consents[STORAGE_PURPOSE]) {
          resolve()
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

  if (listen()) return

  // The CMP's stub can land after this bundle does, so a single check at load
  // is a race we would lose silently — and losing it means analytics never run
  // for anyone. Poll until the API exists or the bound is reached.
  let attempts = 0

  const timer = setInterval(() => {
    attempts += 1

    // DO NOT add a resolve() to this branch. Reaching the bound means no CMP
    // ever appeared, which is precisely the "no answer" case the no-timeout
    // rule above is about: the promise stays PENDING forever, nothing loads,
    // and the visitor is treated exactly as they are now. All that stops here
    // is the polling. Resolving on give-up would turn "nobody asked" into
    // "yes", which is the one outcome this file exists to prevent.
    if (listen() || attempts >= MAX_ATTEMPTS) clearInterval(timer)
  }, POLL_INTERVAL_MS)
})
