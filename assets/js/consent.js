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

export const analyticsConsent = new Promise((resolve) => {
  const listen = () => {
    if (typeof window.__tcfapi !== "function") return false

    window.__tcfapi("addEventListener", 2, (data, success) => {
      if (!success || !data) return

      if (data.gdprApplies === false) return resolve()

      if (data.eventStatus !== "useractioncomplete" && data.eventStatus !== "tcloaded") return

      if (data.purpose && data.purpose.consents && data.purpose.consents[STORAGE_PURPOSE]) {
        resolve()
      }
    })

    return true
  }

  if (listen()) return

  // The CMP's stub can land after this bundle does, so a single check at load
  // is a race we would lose silently — and losing it means analytics never run
  // for anyone. Poll until the API exists, then stop.
  const timer = setInterval(() => {
    if (listen()) clearInterval(timer)
  }, 250)
})
