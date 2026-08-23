# Google Search Console runbook

Property: Domain property `ethosguides.com` (verified 2026-08-23 via the
Route 53 TXT record `google-site-verification=HAuBTTvhwPv9QoR6huT-NIxVEkCjhssp8MlwUAVTKbs`).
A URL-prefix property can additionally be added anytime; the site serves a
matching `google-site-verification` meta tag from the
`GOOGLE_SITE_VERIFICATION` Fly secret.

## After verification (one-time)
1. Search Console → Sitemaps → add `https://ethosguides.com/sitemap.xml`.
2. URL Inspection → Request indexing for `/`, `/destinations/connecticut`,
   `/destinations/new-york/manhattan`, and `/c/the-burys-of-connecticut`.

## Per content launch
- The sitemap is dynamic — new guides/places/collections appear
  automatically; optionally re-submit the sitemap to nudge recrawl.
- Request indexing for the highest-value new hub (e.g. a new state or
  collection page).

## Rotation / recovery
- Meta tag: update the `GOOGLE_SITE_VERIFICATION` secret
  (`fly secrets set GOOGLE_SITE_VERIFICATION=... -a ethos`) and deploy.
- DNS: the TXT record lives in Route 53 zone `ethosguides.com`
  (Z08945076X91CIDSYLDO), record type TXT at the apex.
- robots.txt is served dynamically at `/robots.txt` and always points at
  the canonical sitemap URL.
