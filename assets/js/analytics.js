// Everything third-party that stores anything on the visitor's device loads
// from here, and only after `analyticsConsent` resolves. Neither PostHog nor
// GetYourGuide may go back to being a plain <script src> in root.html.heex: a
// tag in <head> runs before any consent signal exists.
//
// AdSense is the deliberate exception and is NOT loaded here — a certified CMP
// handles it, and putting our own check around it would change ad behaviour on
// every page.
//
// PostHog comes from its CDN snippet rather than an npm import because this
// project has no package.json: esbuild resolves imports out of Elixir deps via
// NODE_PATH (config/config.exs), so there is nowhere for posthog-js to live.
import { analyticsConsent } from "./consent.js"

const injectScript = (src, attrs = {}) => {
  const el = document.createElement("script")
  el.src = src
  el.async = true
  Object.entries(attrs).forEach(([k, v]) => el.setAttribute(k, v))
  document.head.appendChild(el)
  return el
}

// Rendered by root.html.heex only when a key is configured — unset in dev and
// test, so nothing initialises there.
const posthogKey = () => {
  const tag = document.querySelector("meta[name='posthog-key']")
  return tag && tag.getAttribute("content")
}

// Rendered by EthosWeb.Affiliate.affiliate_head/1, on exactly the pages that
// carry an affiliate unit.
const gygPartnerId = () => {
  const tag = document.querySelector("meta[name='gyg-partner-id']")
  return tag && tag.getAttribute("content")
}

analyticsConsent.then(() => {
  const key = posthogKey()

  if (key) {
    !(function (t, e) {
      var o, n, p, r
      e.__SV ||
        ((window.posthog = e),
        (e._i = []),
        (e.init = function (i, s, a) {
          function g(t, e) {
            var o = e.split(".")
            2 == o.length && ((t = t[o[0]]), (e = o[1]))
            t[e] = function () {
              t.push([e].concat(Array.prototype.slice.call(arguments, 0)))
            }
          }
          ;(p = t.createElement("script")).type = "text/javascript"
          p.async = !0
          p.src = s.api_host + "/static/array.js"
          ;(r = t.getElementsByTagName("script")[0]).parentNode.insertBefore(p, r)
          var u = e
          for (
            void 0 !== a ? (u = e[a] = []) : (a = "posthog"),
              u.people = u.people || [],
              u.toString = function (t) {
                var e = "posthog"
                return "posthog" !== a && (e += "." + a), t || (e += " (stub)"), e
              },
              u.people.toString = function () {
                return u.toString(1) + ".people (stub)"
              },
              o =
                "capture identify alias people.set people.set_once set_config register register_once unregister opt_out_capturing has_opted_out_capturing opt_in_capturing reset".split(
                  " "
                ),
              n = 0;
            n < o.length;
            n++
          )
            g(u, o[n])
          e._i.push([i, s, a])
        }),
        (e.__SV = 1))
    })(document, window.posthog || [])

    // capture_pageview: false, then captured by hand — this is a LiveView app,
    // where most navigation never reloads the document and PostHog's automatic
    // capture would see one pageview per session.
    window.posthog.init(key, {
      api_host: "https://us.i.posthog.com",
      capture_pageview: false
    })

    window.posthog.capture("$pageview")

    // The second listener on this event; the first drives topbar in app.js.
    // "initial" is the document load we just captured above, so counting it
    // here too would double every entry page.
    window.addEventListener("phx:page-loading-stop", (info) => {
      if (info.detail && info.detail.kind === "initial") return
      window.posthog.capture("$pageview")
    })
  }

  const partnerId = gygPartnerId()

  if (partnerId) {
    injectScript("https://widget.getyourguide.com/dist/pa.umd.production.min.js", {
      "data-gyg-partner-id": partnerId
    })
  }
})
