# Rome — Source Hierarchy Research (Angle 4)

Research wave input for the Rome scope spec. **Evidence, not adjudication.** A later step decides.

Probe date: 2026-09-02. All HTTP statuses below were observed by me in this environment, not assumed.

---

## 0. Environment constraints that shaped this research (read first)

Two things bit hard and both change what the programme can rely on:

**(a) The Bash tool was unavailable for the whole session.** Every call returned
`claude-sonnet-5[1m] is temporarily unavailable, so auto mode cannot determine the safety of Bash`.
I could not run the python-urllib probe script I wrote
(`<scratchpad>/a4_probe1.py`). **All statuses below therefore come from the WebFetch
tool**, which reports HTTP status codes and transport errors faithfully but returns page
*content* as an LLM summary rather than raw bytes.

**(b) WebFetch summarisation corrupts numbers.** Concrete instance: fetching
`https://www.wikidata.org/wiki/Special:EntityData/Q914255.json` (Trastevere), the summariser
reported *"an area measurement of 180.08 km²"*. The real value is **1.8008 km²** — it dropped
the decimal point and it is off by 100×. Independently, it.wikipedia's rioni table gives
Trastevere as **1.8008 km²**, which is what the Wikidata claim actually encodes.

> **Finding for the spec:** any Rome fact-fidelity gate that reads sources through WebFetch is
> reading an LLM paraphrase, not the source. The NY waves could `curl` an LPC PDF and quote it.
> Rome verification needs raw-bytes fetching (python urllib) to be a working precondition of the
> wave, or numeric claims must be double-sourced. I flagged this because a verifier who trusts
> a WebFetch summary of a number will pass a wrong number.

**(c) WebSearch was not needed** — I worked entirely against URLs named in advance, as briefed.
I did not exhaust a search budget, so I cannot report on one.

---

## 1. The headline result: the Italian state heritage register is UNREACHABLE from here

Every host on the Ministero della Cultura network refused the TCP connection. This is not a 403,
not a timeout, not a robots block — the connection is **refused at the socket**, and every refused
host resolves into the same `2.42.229.0/24` block (an Italian netblock).

| Host | Observed result | Attempts |
|---|---|---|
| `vincoliinrete.beniculturali.it` | `ECONNREFUSED 2.42.229.6:443` | 2 (root, `/VincoliInRete/vir/bene/ricercabeni`) |
| `catalogo.beniculturali.it` | `ECONNREFUSED 84.240.191.189:443` | 1 |
| `dati.cultura.gov.it` | `ECONNREFUSED 2.42.229.47:443` | 1 |
| `dati.beniculturali.it/sparql` | `ECONNREFUSED 2.42.229.47:443` | 1 |
| `www.beniculturali.it` | `ECONNREFUSED 2.42.229.1:443` | 1 |

**VERIFIED:** none of these responded. **INFERRED (not verified):** the shared `/24` and the
uniform refusal suggest a network-level block (egress filter, or the MiC edge refusing
non-Italian/datacentre traffic) rather than five independent outages. I could not test from a
second network to confirm, and I could not run `traceroute`/`openssl s_client` because Bash was
down. **A later step should re-test these five hosts from a different network before concluding
they are permanently unavailable** — the difference between "blocked here" and "dead" changes the
whole programme.

### Why this is the single most important finding

Vincoli in Rete + the Catalogo generale are the only real structural analogues to the LPC
designation report: a state register, per-property records, a legal designation act behind each
one. **If they stay unreachable, Rome has no equivalent of the LP-NNNN PDF.** Nothing else in
the list below can do that job, and the spec has to be written knowing it.

Separately, and independent of reachability, I **could not confirm** that Vincoli in Rete exposes
an API at all, or that its records carry stable public per-bene permalinks. That question is still
open and is a prerequisite for treating it as a citable source even if access is restored.

---

## 2. Ranked hierarchy of what actually works

Ranked by evidential weight a verdict could rest on, not by convenience.

### Tier 1 — Reachable, machine-readable, authoritative for *geography*

**1. OpenStreetMap via Overpass API** — `https://overpass-api.de/api/interpreter` — **HTTP 200**
(`/api/status` returned a live slot count; one heavy bbox query returned **504**, a retry with a
tighter query returned 200 — so budget queries carefully).

This is the strongest source Rome has, and it is the one thing that carries over unchanged from
the NY waves.

- **VERIFIED: all 22 rioni exist as boundary relations.** Query
  `rel["place"="quarter"](41.86,12.44,41.93,12.53)` returned exactly **22** relations, matching the
  canonical Roman-numeral list I–XXII. IDs: Monti 5451988, Trevi 5452710, Colonna 5452709,
  Campo Marzio 5452743, Ponte 2529127, Parione 5452744, Regola 5452745, Sant'Eustachio 5452746,
  Pigna 5452758, Campitelli 5454237, Sant'Angelo 5454238, Ripa 5454276, Trastevere 2529081,
  Borgo 5454294, Esquilino 5454309, Ludovisi 5454323, Sallustiano 5454324, Castro Pretorio 5454327,
  Celio 5454335, Testaccio 5454344, San Saba 5454343, Prati 5454355.
- **Tag shape (verified on r2529081):**
  `boundary=place`, `place=quarter`, `type=boundary`, `name=Trastevere`,
  `official_name=Rione XIII Trastevere`, `ref=XIII`, `wikidata=Q914255`,
  `wikipedia=it:Trastevere`, `population=18834`.
- **Trap: `ref` is not normalised.** Trastevere carries `ref=XIII`; Ponte carries `ref=R. V`;
  every quartiere carries `ref=Q. NN`. A roster keyed on `ref` must normalise, or it will fail to
  join.
- **Trap: `admin_level=10` is the MUNICIPIO, not the rione.** A bbox query for
  `boundary=administrative][admin_level=10` over the historic centre returned
  *Municipio Roma I* (r1458218), *Municipio Roma XII*, *Municipio Roma XIII* — no rioni at all.
  Anyone porting the NY Overpass boundary check by analogy will query the wrong admin_level and
  get 15 municipi instead of 22 rioni.
- **VERIFIED: quartieri are also present**, tagged `place=suburb` with
  `official_name="Quartiere NN Name"`. A query filtered on `official_name~"^Quartiere"` over
  bbox `(41.75,12.30,42.05,12.70)` returned **31** relations, Q.I–Q.XXXI, contiguous and complete
  over that range. **INFERRED:** the four absentees (Q.XXXII Europa and the three Ostia/Lido
  quartieri, XXXIII–XXXV) fall west of my bbox's 12.30 western edge, so this is very likely a
  bbox artefact rather than missing data — but I did not re-query to prove it, so **the complete
  35-quartiere coverage is unconfirmed**.
- **What a verdict can cite it for:** which rione or quartiere a place falls in; boundary
  geometry; the official rione/quartiere numbering. **Not** for history, dating, or protection
  status — OSM is crowd-sourced and this corpus should attribute it, not state it.

**2. Nominatim** — `https://nominatim.openstreetmap.org/search` — **HTTP 200**, raw JSON returned
intact (this is the one endpoint whose output survived WebFetch uncorrupted, because it is short).

- **VERIFIED:** the rione name is a first-class component of the reverse address hierarchy.
  A museum lookup returned
  `display_name: "Museo di Roma in Trastevere, 1/b, Via della Paglia, Trastevere, Municipio Roma I, Roma, Roma Capitale, Lazio, 00153, Italia"`.
- A settlement-typed search for `Trastevere` resolved to `osm_type=relation, osm_id=2529081,
  category=place, type=quarter, addresstype=quarter`, with a bounding box.
- **This is the nearest functioning analogue to the DCP geocoder**: address in → neighbourhood
  out, with a stable OSM relation id to key on. It is the mechanism by which a Rome roster can
  assign a place to a rione at all.
- Note it returned `population=18834` for Trastevere where it.wikipedia's table says 12,962 —
  **these disagree** and I did not resolve which is current. Do not cite either as population
  without a third source.

**3. ISTAT** — `https://www.istat.it/it/archivio/222527` (administrative boundaries) and
`https://www.istat.it/it/archivio/104317` (basi territoriali) — **both HTTP 200**.

- Administrative boundaries (`Confini delle unità amministrative a fini statistici`): shapefile,
  WGS84 UTM32N, generalised and non-generalised, annual as at 1 January, **1991–2026**. Regions,
  provinces, comuni. Comune-level only — it does **not** descend to rione.
- Basi territoriali: `Sezioni di censimento`, `Aree di censimento`, **`Aree sub comunali`**,
  `Località`, for 1991/2001/2011/2021, SHP + XLS/CSV, **Roma explicitly listed** among the ~43
  cities with 2011 and 2021 coverage.
- **The `Aree sub comunali` layer is the closest thing Rome has to DCP's tabulation areas** and
  is the one lead worth chasing hardest. **INFERRED, NOT VERIFIED:** I did not download the file
  and therefore **cannot confirm whether Rome's ASC units are the 15 municipi, the ~155 zone
  urbanistiche, or the rioni.** That is a concrete, answerable question and it should be resolved
  before the roster is drawn, because it determines whether official statistics can ever be joined
  to a neighbourhood page.
- **What a verdict can cite it for:** official statistical geography and census-derived figures —
  the only fully machine-readable *government* source I could reach.

### Tier 2 — Reachable, authoritative, but not machine-readable

**4. Sovrintendenza Capitolina ai Beni Culturali** — `https://www.sovraintendenzaroma.it/` —
**HTTP 200**. `/i_luoghi` → **404**. `/sitemap.xml` → **404**.

The Comune's own heritage body, and the closest institutional analogue to LPC that actually
answers. It publishes `Mappa dei luoghi`, thematic heritage sections (ancient Rome, medieval and
modern, historic villas, museums), an academic journal
(*Bullettino della Commissione Archeologica Comunale di Roma*), `Archivi e cataloghi`, and a
`Progetto Osservatori — un gis per il monitoraggio dei monumenti di Roma`. Verified live path:
`https://www.sovraintendenzaroma.it/content/servizi-scientifici`.

- **I could not establish the per-monument URL pattern.** Two guessed paths 404'd and there is no
  sitemap to enumerate from. Discovering the real path shape is unfinished work.
- The GIS monument-monitoring project is the most LPC-shaped thing on the site and **I could not
  determine whether its data is published**. Worth a direct probe.
- **What a verdict can cite it for:** municipal ownership, dating and history of a monument, as a
  named institutional source — *if* a stable per-monument URL exists. Human-readable only.

**5. Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma** —
`https://www.soprintendenzaspecialeroma.it/` — **HTTP 200**. (Reachable despite being a state
body, because it is hosted off the MiC netblock — worth noting as the one state heritage voice
that answers.)

Remit, in its own words: *"Soprintendenza Speciale Archeologia Belle Arti e Paesaggio di Roma"*.
Maintains a `Luoghi della cultura` directory (e.g. Terme di Caracalla, Basilica di Sant'Agostino)
and `Attività istituzionale` notices. **Explicitly: I found no evidence of a systematic catalogue
with persistent identifiers.** It is a news-and-directory site, not a register.

**6. Musei in Comune / Zètema** — `https://www.museiincomuneroma.it/` — **HTTP 200**.
The municipal museum system. Per-museum sites (`museicapitolini.org`, `arapacis.it`). The portal
itself does **not** carry hours and prices centrally; it delegates to each museum's own site, so
operational facts need a per-museum fetch. Cross-check available: OSM carried a structured
`opening_hours` string for Museo di Roma in Trastevere
(`Tu-Su 10:00-20:00; Dec 24,31 09:00-14:00; Jan 01 off; May 01 off; Dec 25 off`) plus
`operator=Zètema Progetto Cultura S.r.l.` — useful as a second opinion, never as the primary.

**7. 060608 — Roma Capitale tourism/culture contact centre** —
`https://www.060608.it/` → **301** to `https://060608.comune.roma.it/` → **HTTP 200**.
Self-described as *"Il contact center di informazione turistica e culturale di Roma Capitale"*
(the tourism and cultural information contact centre of Roma Capitale). Official municipal voice
for opening hours and events. **I could not confirm a per-attraction page pattern** from the
homepage — category browsing only was visible. This is the most plausible official source for
operational facts (hours, closures, prices) and deserves a follow-up probe for its URL shape.

### Tier 3 — Reachable aggregators (attribute, never state)

**8. Italian Wikipedia** — `https://it.wikipedia.org/` — **HTTP 200**. As predicted, far richer
than English. `Rioni_di_Roma` gives a complete I–XXII table with per-rione population and area in
km², and it agrees with OSM's numbering on every one of the 22. It dates the modern set to
*"nel 1921, la Giunta Municipale dispose di istituire altri sette rioni"* ("in 1921 the Municipal
Council resolved to institute a further seven rioni"), citing **Deliberazione della Giunta
Municipale di Roma n. 20 del 20 agosto 1921**. That deliberazione is the primary act; **I did not
locate a copy of it** and it is exactly the kind of document a verifier should want in hand.

**9. Wikidata** — `https://www.wikidata.org/w/api.php` — **HTTP 200**, and the API is genuinely
machine-readable. Its real value here is as a **bridge to the unreachable registers**: Q914255
(Trastevere) carries `P757 = ...` style external heritage identifiers, reported as P1296, P5901
and P12855 with values `0067253`, `113`, `08051806`. **UNVERIFIED — treat with suspicion:** those
property *labels* came through the WebFetch summariser and at least one looks misassigned to me.
The property numbers and values should be re-read from raw JSON before anyone builds on them. If
they hold, they are a route to Catalogo/ICCD record numbers without touching the blocked hosts.

### Tier 4 — Wanted, could not reach

**10. UNESCO World Heritage Centre** — `whc.unesco.org` — **HTTP 403 on all three paths tried**
(`/en/list/91/`, `/en/list/91`, `/en/list/91/documents/`). Bot-blocked, not down.

I obtained the property ID anyway, from two reachable and mutually independent sources:

- Wikidata `Q18448486` → `P757` (World Heritage Site ID) = **`"91"`** (raw claim value).
- it.wikipedia `Centro_storico_di_Roma`: reference **91**, inscribed **1980**, criteria
  **(i)(ii)(iii)(iv)(vi)**; the property is *"Centro storico di Roma, le proprietà
  extraterritoriali della Santa Sede nella città e la Basilica di San Paolo fuori le mura"*
  ("the historic centre of Rome, the extraterritorial properties of the Holy See in the city, and
  the Basilica of San Paolo fuori le mura").

**VERIFIED: the property ID is 91.** **NOT CONFIRMED:** the 1990 extension (widely reported, but
I could not reach a primary source for it), the official property and buffer-zone areas in
hectares, and — most importantly for scope — **the actual inscribed boundary geometry**. The
it.wikipedia article describes the historic centre as the 22 rioni within the Aurelian and
Janiculan walls, ~15.47 km², but that is the *city's* historic centre, which is **not** the same
polygon as the inscribed property (which includes extraterritorial Holy See properties scattered
outside it, and San Paolo fuori le Mura, well outside). **Anyone tempted to use "inside the WHS"
as a scope rule needs the real boundary file and does not have it yet.**

**11. Comune di Roma open data** — `https://dati.comune.roma.it/` — **UNREACHABLE. 3 attempts,
3 failures, 3 different paths:** `/catalog/dataset` timed out (60s), `/catalog/api/3/action/package_list`
timed out (60s), `/` returned `socket hang up`. Note this host is *not* on the MiC netblock, so
this is a distinct failure from §1 — it looks like the portal itself is down or very slow rather
than blocked, but I cannot distinguish those.

This is a painful loss: it is the only candidate that might have published official rione/quartiere
boundaries and a municipal geocoder — the true DCP analogue. **Indirect evidence that it exists and
publishes useful data:** OSM's municipio relations carry
`source:population=Open Data Roma Capitale: http://dati.comune.roma.it/download/popolazione-e-societa/popolazione-italiana-e-straniera-iscritta-anagrafe-municipio-e-sess-2`,
i.e. an OSM mapper successfully pulled municipio-level population from this portal at some point.
**Re-testing this host is the single highest-value follow-up after the MiC block.**

---

## 3. The question the brief actually asked: what carries LPC's weight?

**Plain statement: nothing currently reachable does, and the spec should not pretend otherwise.**

The LPC designation report was load-bearing in the NY waves because it was simultaneously
(a) a legal act with a citable number, (b) a per-property document, (c) a narrative with architect,
date and style, and (d) fetchable as a stable PDF. Rome's only candidates for (a)+(b) — Vincoli in
Rete and the Catalogo generale — score zero on (d) from this environment, and I could not confirm
(b) even in principle.

What the reachable set can carry, honestly stated:

- **Geography and roster membership: solid.** OSM + Nominatim + ISTAT can carry a rione/quartiere
  roster and boundary verdicts at NY-comparable rigour. This part of the programme is safe.
- **Protection/designation status: not covered.** No reachable source states whether a given
  building is `vincolato`. A verdict of the form "designated in YYYY" has no Rome source today.
- **History, dating, attribution: partially covered, human-readable only**, via Sovrintendenza
  Capitolina and Soprintendenza Speciale — and only once someone establishes their per-monument
  URL patterns, which I could not.
- **Operational facts (hours, prices): weakest link.** 060608 and the individual museum sites are
  the official voices; neither offers a machine-readable feed I could find, and the portal-level
  pages delegate rather than state.

**The disagreement I am surfacing for the arbitrator:** Rome's geographic spine is *stronger* than
NY's (22 rioni are unambiguous, numbered, and legally fixed since 1921, versus DCP's synthetic
tabulation areas), while Rome's per-property evidential spine is *far weaker*. A spec that assumes
symmetry with the NY programme will over-promise on designation claims and under-use a cleaner
neighbourhood geography than New York ever had.

---

## 4. Concrete follow-ups, in priority order

1. Re-test the five MiC hosts from a different network. Blocked-here vs dead is the whole question.
2. Re-test `dati.comune.roma.it`. Distinct failure mode; may simply have been down today.
3. Download ISTAT `Aree sub comunali` for Roma and find out what the units actually are.
4. Establish the per-monument URL pattern for `sovraintendenzaroma.it` (no sitemap; guessing 404s).
5. Re-read Wikidata Q914255 raw JSON and confirm the heritage-identifier property numbers.
6. Get the real UNESCO property-91 boundary from a non-`whc.unesco.org` mirror.
7. Restore raw-bytes fetching (Bash/urllib) before any fact-fidelity pass runs — see §0(b).
