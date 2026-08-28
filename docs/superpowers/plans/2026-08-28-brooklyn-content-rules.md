# Brooklyn Content Authoring Rules

Binding rules for every content-wave task in
`docs/superpowers/plans/2026-08-28-brooklyn-neighborhoods.md` (Tasks 5-12,
the eight waves covering all 69 neighborhoods in
`priv/seed_data/brooklyn_roster.json`). **Read this whole file before
authoring any seed JSON.** Every wave dispatch names this path and requires
it; nothing below is optional or advisory unless it says so.

Successor to `docs/superpowers/plans/2026-08-22-manhattan-content-rules.md`
(shape and voice) and `docs/superpowers/plans/2026-08-23-connecticut-content-rules.md`
(tiers, the orientation floor, and the duration ban). Where Brooklyn differs
from either, this file wins.

Two things are worth knowing before you start. First, the Connecticut
program proved that a prose rule restated in every dispatch and checked in
every review is **not** enough: 58 unverifiable drive-time claims reached the
live site across 28 committed files anyway. The rules here that catch
**drift** — a fixed string quietly reverting to Manhattan's, a required
element going missing, an unverifiable claim creeping in — are therefore
also gates in `test/ethos/seeds/brooklyn_seed_data_test.exs`.

But not every rule is gated, deliberately. Rules that describe an
**editorial range** — intro word ceilings, place and entry counts, photo
counts — are left to the wave review. A gate that fails a build over a
165-word intro is a gate somebody eventually weakens, and a weakened suite
is worse than an ungated range. **Section 16 tells you exactly which rules
the machine catches and which the reviewer catches. Read it before you
assume a green gate means a compliant file.**

Second, the rules a machine does not check are written to be checkable by a
**reviewer without a judgment call**. If you find yourself deciding whether
something "feels" compliant, you have found a defect in this document — say
so in your wave report.

---

## 1. Inputs

For each neighborhood you are assigned you receive two JSON research
artifacts, produced by the wave's own research steps. The exact paths are in
your dispatch; the canonical locations are:

- **`.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/{slug}.json`**
  — the per-neighborhood finder + verifier artifact. Its shape follows the
  Manhattan artifact: a `found` object holding the researcher's material
  grouped by category (history facts, transit, attractions, food, lodging,
  and a closed-or-unverified bucket), plus a `verify` object holding the
  adversarial verifier's per-item verdicts. Brooklyn's transit group is
  **wider than Manhattan's**: it covers subway, NYC Ferry, LIRR and bus, not
  subway alone (see rule 6).

- **`.superpowers/sdd/2026-08-28-brooklyn-neighborhoods/research/brooklyn/photos-wave{K}.json`**
  — the wave's Wikimedia Commons photo candidates, one record per candidate
  carrying at least the landmark, the neighborhood, the Commons **file page**
  URL, the **direct image** URL, the licence and the author.

`{K}` is the wave number from your dispatch, matching the `wave` field in
`priv/seed_data/brooklyn_roster.json`. Both artifacts are git-ignored: they
are inputs to your wave, not deliverables.

**The artifacts are the only permitted source of fact.** Read the keys your
wave's finder actually produced rather than assuming the names above; the
grouping is stable, the exact key spellings are the finder's to choose. If a
key you expect is absent, that is a research gap to record in your report,
never a licence to fill it from your own knowledge.

---

## 2. Verdict filtering (non-negotiable)

Apply this to every item before you write a single line of copy.

- **`refuted` → excluded.** If the verifier supplied a correction, you may
  keep the item using the correction *exactly as given*. You may not keep a
  refuted item by softening it.
- **`uncertain` → excluded from places and from lodging.** No exceptions: an
  uncertain restaurant, museum, park or hotel does not ship.
- **`uncertain` history fact → may be kept only by rewording to remove the
  unverified specific.** If the disputed element is a date, drop the date and
  keep the event. If removing the specific leaves a sentence that says
  nothing, drop the sentence. You may not keep the specific and hedge it
  ("reportedly", "said to have been", "around 1890").
- **Unchecked items** (the verifier issued no verdict) survive **only** if
  the researcher's evidence cites an official site or 2025-2026 coverage.
  Anything else is excluded.
- **Never add anything absent from the artifacts** — not a fact, not a
  place, not a date, not an address, not a superlative, not a subway line,
  not a ferry landing, not a neighbourhood boundary. Your own knowledge of
  Brooklyn is not a source. Fewer verified items beat more padded ones, and
  the tier system in rule 3 exists precisely so that a thin neighborhood can
  ship honestly instead of being inflated.

There is no mechanical gate behind this rule. It is enforced by the wave's
fact-fidelity review, which traces every claim in every file back to the
artifacts. Write so that trace is easy: prefer the artifact's own phrasing
for any specific.

---

## 3. Tier decision

Every seed file declares `"tier"` inside its `guide` object: `"guide"` or
`"town-page"`. Omitting the key means `"guide"`; write it explicitly anyway.

**Count the places that survive rule 2's filtering.** That count, and
nothing else, decides the tier:

- **6 or more surviving places → `"tier": "guide"`.** The full format,
  section 5.
- **Fewer than 6 → `"tier": "town-page"`.** The orientation format,
  section 8.

The tier is decided **from what survived, never from the neighborhood's
reputation.** A neighborhood nobody expects much from can earn a full guide.
A famous one whose listings will not verify does not get padded into one.
Deciding the tier before research, then hunting for six places to justify
it, is the exact failure this rule exists to prevent.

**Record the surviving count and the resulting tier for every neighborhood
in your wave report**, so the reviewer checks the call against a number
rather than taking it on trust.

The gate is deliberately looser than this rule: it fails only clear
mislabels — a `"guide"` with fewer than 4 places, or a `"town-page"` with 6
or more. **Meeting the gate is not the same as making the right call.** A
guide with 5 surviving places passes the gate and violates this rule; the
per-wave reviewer catches it from your recorded count.

---

## 4. Seed JSON shape

One file per neighborhood at `priv/seed_data/brooklyn/{slug}.json`, where
`{slug}` is the roster's slug. All keys are strings, exactly this shape:

```json
{
  "guide": {
    "slug": "{slug}-brooklyn-guide",
    "title": "{Neighborhood}, Brooklyn: {concrete hook, 4-8 words}",
    "destination": "{Neighborhood}, New York",
    "state": "New York",
    "county": "Brooklyn",
    "tier": "guide",
    "intro": "markdown, 100-160 words",
    "sections": [{"heading": "...", "body": "markdown"}],
    "faq": [{"question": "...", "answer": "..."}],
    "photos": [{"src": "...", "thumb": "...", "title": "...", "description": "...",
                "author": "...", "license": "...", "source_url": "https://commons.wikimedia.org/wiki/File:..."}]
  },
  "places": [
    {"slug": "...", "name": "...", "kind": "...", "town": "{Neighborhood}",
     "state": "New York", "county": "Brooklyn", "address": "...",
     "official_url": "... or omit the key", "summary": "1-3 sentences",
     "history": "optional markdown", "status": "open", "photos": []}
  ],
  "entries": [
    {"kind": "sight|food|stay|walk", "name": "...", "place_slug": "...", "note": "1-2 sentences"}
  ],
  "links": [
    {"target": "guide:{other-slug}-brooklyn-guide", "kind": "nearby", "note": null}
  ]
}
```

Fixed values, identical in every Brooklyn file, no variation:

| Field | Value |
| --- | --- |
| `guide.slug` | `{neighborhood-slug}-brooklyn-guide` |
| `guide.destination` | `{Neighborhood}, New York` |
| `guide.state` and `places[].state` | `New York` |
| `guide.county` and `places[].county` | `Brooklyn` |
| `places[].town` | the neighborhood's display name from the roster |
| `places[].status` | `open` |

`county` is `"Brooklyn"`, not `"Kings County"` and not `"Kings"`, everywhere
it appears.

**Only `guide.county` is gated.** The gate counts published guides whose
`county == "Brooklyn"` and asserts the count equals the number of committed
files, so a typo *there* fails the build. Nothing checks the rest of this
table: `Place.changeset` requires `county` to be present but not to hold any
particular value, so a place carrying `"Kings County"` — or the wrong
`state`, or a `town` that is not the neighborhood, or a `guide.destination`
or `guide.slug` that does not follow the pattern — publishes cleanly and
wrong. Copy the table exactly and let the reviewer check it against section
16's ungated list.

Shape rules the loader (`Ethos.Seeds.DataGuide.load!/1`) enforces on read,
before anything else runs:

- `guide` is an object; `places` and `entries` are arrays (use `[]`, never
  omit them, never `null`).
- `guide.slug`, `guide.title`, `guide.destination`, `guide.state`,
  `guide.county` and `guide.intro` are all present and non-empty strings.
- `guide.tier`, if present, is exactly `"guide"` or `"town-page"`.
- `links` is optional at load time but required in practice by rules 8
  and 11. Every target is `guide:<slug>` or `place:<slug>`; any other form
  raises.
- Omit `official_url` entirely when the research gives none. Do not write
  `null`, `""`, or a guessed URL. The same applies to `history`.
- `official_url` must be an `http`/`https` URL; anything else fails the
  changeset at seed time.
- `places[].photos` is `[]` when the place has no photo of its own.
- **Do not use `booking_url`.** The `places` schema accepts it (validated as
  a safe http(s) URL like `official_url`), but Brooklyn authors no booking
  links — there is no verified booking source in the research artifacts, and
  a guessed one would violate rule 2. Omit the key.

---

## 5. Full guide requirements (`"tier": "guide"`)

**Intro** — 100-160 words, history-forward, third person, editorial voice.
Built only from verified history facts. Never a fabricated first-person
experience ("walking down Court Street you feel…"): you did not go there.
Count words the way the gate does — whitespace-separated tokens:

```bash
python3 -c "import json,sys; print(len(json.load(open(sys.argv[1]))['guide']['intro'].split()))" \
  priv/seed_data/brooklyn/{slug}.json
```

**Sections** — two to three:

1. One **history deep-dive**, drawn from the richest verified material.
2. One with the heading exactly **`Getting there`** — see rule 6. Required.
3. Optionally a third where the research genuinely supports one (a
   waterfront, an industrial legacy, a "Where to stay" note per rule 7).
   Do not invent a third section to reach three.

**FAQ** — four to six entries. One must be
**`How do I get to {Neighborhood}?`** — not "by subway", since Brooklyn's
answer is not always a subway. Every other question is answered from
verified material only: name origins, whether a named place is still open,
where to stay, which park is which.

**The transit question is gated** on both tiers: every file's FAQ must carry
a question matching `how do i get to` (case-insensitive). The match is loose
on purpose — "How do I get to Red Hook without a subway?" satisfies it — so
the gate catches the entry *going missing*, not its wording. The count (4-6,
or 2-3 on an orientation page) is not gated; that is the wave review's.

**Places** — six to twelve, each with a `kind` from rule 10, `town` set to
the neighborhood display name, address and `official_url` taken only from
the research. `summary` is one to three sentences.

**Entries** — six to twelve, one per place you want featured. Every entry's
`place_slug` must be defined as a place **in the same file**, unless your
dispatch explicitly names a cross-file slug. This is mechanically fatal, not
stylistic: `Ethos.Seeds.GuideRunner` calls `Places.get_place_by_slug!/1`, so
an unresolvable `place_slug` raises during the guide pass and the wave's
gate run dies there.

Entry `kind` is one of `sight`, `food`, `stay`, `walk`:

- attractions, museums, historic sites, landmarks → `sight`
- a park or greenway you frame as a stroll → `walk` (otherwise `sight`)
- restaurants, cafés, bakeries, breweries → `food`
- hotels and B&Bs → `stay`

The `entries` schema also accepts `tour` and `tip`; Brooklyn does not use
them, matching Manhattan and Connecticut.

---

## 6. The "Getting there" section

This is the section that differs most from Manhattan, and the one where a
careless author does the most damage. Manhattan used a single uniform
heading, `"Getting there by subway"`, because in Manhattan the subway is
always the answer. **In Brooklyn it is not.** Red Hook has no subway
station at all. Greenpoint and the Williamsburg waterfront are ferry-first.
East New York has an LIRR station. Sea Gate, Gerritsen Beach and Mill Basin
are reached by bus. A section that names a distant station and lets the
reader assume it serves the neighborhood is the single most likely
unverifiable claim in this program.

### 6.1 The heading

The heading is exactly `Getting there` — lowercase `t` in "there", no
trailing mode. Not `Getting There`, not `Getting there by subway`, not
`Getting around`. Same string on full guides and orientation pages.

**This is gated.** Every committed file must carry a section whose heading
is byte-for-byte `Getting there`; the gate fails with the offending file and
the headings it actually has. The assertion exists because this is the most
likely drift in the whole program: you will have read Manhattan guides that
all say `Getting there by subway`, and the heading does not drift alone — it
takes the entire multi-modal rule in 6.2 and 6.3 with it.

### 6.2 What to name, in this order

Cover only the modes that actually apply, in this order, and only from the
research artifact's transit material.

> **Every station, line, landing, route and bus number in this section is an
> illustration of *shape*, not a fact you may copy.** They are here so you
> can see what a compliant sentence looks like. The actual names in your
> file come from your neighborhood's research artifact and nowhere else —
> including the Red Hook example in 6.3, which must still be re-derived from
> the wave-4 artifact before it ships. **The one exception is the LIRR list
> in item 3, which is a closed set** — Brooklyn has exactly those three
> stations, and naming a fourth is always an error.

1. **Subway.** Name the line designations and the station names, spelled as
   the MTA spells them (`Broadway Junction`, `Smith–Ninth Streets`,
   `Court Street–Borough Hall`). Name which lines call at which station.
2. **NYC Ferry.** Where a landing exists, name the **landing** and the
   **route** (for example the East River route at India Street/Greenpoint).
   A route without its landing, or a landing without its route, is half an
   answer.
3. **LIRR.** Where a station exists, name it. Brooklyn's are
   **Atlantic Terminal**, **Nostrand Avenue** and **East New York**. There
   are no others; do not name one.
4. **Bus.** Name a route number in exactly two cases, and no others:
   (a) no subway station sits in or on the edge of the neighborhood, or
   (b) the research artifact records the bus as a primary means of access.
   Never list bus routes for completeness. A bus route named beside a subway
   station that already serves the neighborhood is padding, and padding here
   reads as authority the research does not support.

### 6.3 The proximity rule

**A station, landing or stop may be presented as serving the neighborhood
only when the research places it inside the neighborhood or on its edge.**

There are three cases, and the artifact tells you which one you are in.

**Case A — the artifact places the station in or on the edge of the
neighborhood.** Write it as serving the neighborhood:

> Carroll Street on the F and G is the neighborhood's station.

**Case B — the artifact places the station in a different neighborhood.**
Name that neighborhood:

> The nearest subway is Carroll Street on the F and G, in Carroll Gardens.

not

> ~~Carroll Street on the F and G serves the neighborhood.~~

**Case C — the artifact lists the station for the neighborhood but does not
say where it sits.** This is the common case, and the two rules above would
otherwise deadlock: you may not claim it serves the neighborhood, and you
cannot name the neighborhood it is in without supplying outside knowledge,
which rule 2 forbids outright. **Do neither.** Name the station and its
lines, and assert nothing about location:

> Carroll Street is served by the F and G.

not

> ~~Carroll Street on the F and G serves the neighborhood.~~ (unsupported)
> ~~The nearest subway is Carroll Street, in Carroll Gardens.~~ (invented)

Then **record the gap in your wave report** — "artifact lists Carroll Street
for this neighborhood but does not locate it" — so the reviewer knows the
flat phrasing is deliberate rather than careless, and so a later research
pass can close it.

This is checkable without judgment: for every station you name, a reviewer
asks which case the artifact puts you in, then checks the sentence matches
that case. A location claim in Case C is a fabrication; a flat sentence in
Case A is merely thin, and is never wrong.

**Where there is no subway, write that plainly and move on to the real
answer.** Red Hook is the canonical case:

> Red Hook has no subway station. NYC Ferry's South Brooklyn route calls at
> the Red Hook/Atlantic Basin landing, and the B61 bus runs into the
> neighborhood along Van Brunt Street.

Straining to present Smith–Ninth Streets as Red Hook's station — because
some station must be named — is exactly the failure this rule forbids.

### 6.4 Never state a trip duration

**No trip duration, for any mode, ever. Not in minutes, not in hours, not
as "a short ride", not as "a ten-minute walk", not as a stop count standing
in for a duration.**

This is not a style preference. A station name and a line designation are
published, stable facts. "Twenty minutes to Midtown" is not: it varies by
hour, it changes with every service revision, no research artifact supports
it, and nobody will ever come back to correct it. Connecticut's identical
ban lived in every wave dispatch and every review checklist and still leaked
58 claims onto the live site. Brooklyn's is mechanical.

**The fix is always the same: name the line, the station or the ferry
landing. Never reword around the regex.** The ban is on the underlying
claim, not on the specific phrasing a pattern happens to catch. A duration
phrased so the gate misses it is a worse outcome than one it catches,
because it ships.

Also banned, though only some are caught mechanically:

- walking durations — a "ten-minute walk" is a duration like any other;
- stop counts used as a proxy ("two stops from Atlantic Terminal") — service
  patterns change what a stop count means;
- vague duration language — "a short hop", "not far", "quick trip".

State proximity in checkable terms instead: which line, which station, which
landing, which street the entrance is on, which neighborhood a station sits
in.

### 6.5 Service caveats

State a service caveat **only** where the MTA has published one and the
research artifact records it. "The 2 runs here at all times; the 5 does not
stop here on weekends" is fine when the artifact carries it. Your own sense
of how a line behaves is not a source, and a caveat that decays is as bad as
a duration that decays.

### 6.6 What the gate actually catches

`test/ethos/seeds/brooklyn_seed_data_test.exs` walks **every string value in
every committed Brooklyn seed file** and fails the build if any of **eleven**
patterns matches. Read this list so a red gate is never a surprise:

| # | Catches |
| --- | --- |
| 1 | **Any digit run followed by `minute` or `minutes`**, with optional spaces or a hyphen/en-dash between — `10-minute`, `10 minute`, `25 minutes`, `45 minutes`. Unconditional: no mode word, hedge or direction needed anywhere near it. Fires on walks, tours and ride run times too — see the note below. |
| 2 | A number plus `min` / `mins` / `minute` / `minutes` followed by one of: `south` `north` `east` `west` `away` `drive` `ride` `from` `by car` `by subway` `by train` `by ferry` `uptown` `downtown` `up` `down` `along`. |
| 3 | A hedge — `roughly` `about` `around` `approximately` `just` `only` `under` `over` `some` — then a number then `min`. |
| 4 | `half an hour` / `half-hour` / `quarter hour` / `an hour` / `an hour and a half`, followed within 40 characters (same sentence) by `drive` `ride` `away`, a compass direction, `by car` `by subway` `by train` `by ferry` `to Manhattan` `to Midtown`. |
| 5 | `drive` / `ride` / `trip` / `commute` + `of` + optional hedge + a number + `min`. |
| 6 | A number plus `hour` / `hours` followed by `drive` `ride` `away`, a compass direction, `by car` `by subway` `by train`. |
| 7 | A spelled-out number — `five` `ten` `fifteen` `twenty` `twenty-five` `thirty` `forty` `forty-five` `fifty` `sixty` `ninety` — followed by `minute` / `minutes`. **Unconditional**: no mode word needed. |
| 8 | `short` / `quick` / `easy` / `brief` + `drive` / `ride` / `hop` / `trip` / `commute`. |
| 9 | `within a short/quick/easy drive/ride/trip`. |
| 10 | `reaches` / `gets you to` / `puts you in` / `takes you to`, followed within 40 characters by `in` and a number. |
| 11 | `in` + optional hedge (`about` `roughly` `around` `under` `over` `just` `only`) + a number + `hour` / `hours` — `in 2 hours`, `in about 2 hours`. |

Matching is case-insensitive. The patterns deliberately overlap: one bad
sentence commonly trips three of them, and that is the detector working.

**Patterns 1 and 11 close the plainest hole.** Until review, the single most
natural way to write the banned claim escaped all of the others:

> ~~The F train runs to Midtown in 25 minutes.~~

Pattern 1 was singular-only; 2 needs a direction or mode word *after* the
duration; 3 needs a hedge *before* it; 7 covers spelled-out numbers only; 10
needs one of its four verbs, and "runs to" is not among them. Pattern 1 is
now plural-tolerant and pattern 11 closes the same hole for hours, which 6
catches only when a mode word follows. **Pattern 11 is anchored on a
preceding `in` on purpose**: a bare "N hours" would fire on "open 24 hours",
which is a legitimate thing to say about a diner.

**Pattern 1's widening is deliberate, and it catches innocents.** "The
Wonder Wheel ride lasts 10 minutes" and "the 45-minute tour" now fail the
gate. That is the intended trade — a categorical ban with a hole is worse
than an over-broad net — and the phrase-keyed allowlist in 6.8 is exactly
how a genuine non-travel duration gets through. Reword first; allowlist if
the duration is real and not a travel claim.

**Known gaps you must respect anyway.** Pattern 7's spelled-out number list
is not exhaustive (`twelve`, `thirty-five`, `ninety-five` are not on it),
and a spelled-out number with `hours` (`two hours`) is not covered at all.
Pattern 8's mode list omits `walk`, so "a short walk" passes the gate; "a
few minutes' walk" passes. None of these are permitted — rule 6.4 is the
rule; the eleven patterns are a net under it, not its definition. Writing
into a known gap is the specific behaviour that put 58 claims on the
Connecticut site, and a reviewer who finds one will treat it as a deliberate
evasion. If you find a *new* gap, report it so the pattern list grows —
that is what happened to produce patterns 1 and 11.

### 6.7 Where durations hide

The gate walks every string in the file, and so must your own read. In
Connecticut, at least one of these survived a pass that fixed the others, on
several waves. Check **all** of them for every neighborhood you touch, not
just the transit section:

`guide.title` · `guide.intro` · `guide.sections[].heading` ·
`guide.sections[].body` · `guide.faq[].question` · `guide.faq[].answer` ·
`guide.photos[].title` · `guide.photos[].description` ·
`places[].summary` · `places[].history` · `places[].photos[].title` ·
`places[].photos[].description` · `entries[].note` · `links[].note`

### 6.8 The allowlist

`@trip_duration_allowlist` in the gate pardons a **specific matched phrase
in a specific field of a specific file** — a 3-tuple of
`{file basename, JSON path, matched phrase}`. It is applied after the regex
runs, so a genuine duration claim appended to the same field still fails.
JSON paths use dots for object keys and `[i]` for array indices, exactly as
the gate builds them: `guide.faq[0].answer`, `places[3].summary`,
`links[1].note`.

It starts empty. It exists for durations that are **not travel claims** — a
ride's run time, a tour's advertised length, a ferry crossing stated as a
scheduled service fact from a cited source, a history sentence where pattern
10 collides with a year ("the line took you to Coney Island in 1920").

Before adding an entry:

1. **Try rewording first.** Almost every collision has a clean rewrite —
   "opened in 1920, running to Coney Island" clears pattern 10 without an
   allowlist entry, and rewriting is always preferred.
2. If the phrase genuinely must stay, add the 3-tuple with a code comment
   giving the reason and the source, and record it in your wave report with
   the same justification.
3. **Never weaken, delete or narrow a pattern**, and never key an entry on
   the file alone — that would excuse the whole file.

A wave that adds an allowlist entry without a justification in its report is
incomplete.

---

## 7. Lodging

**List a hotel as a place only when a verified hotel is physically in the
neighborhood.** Verified means it survived rule 2: `refuted` and `uncertain`
lodging is excluded, without exception.

**Never import a neighboring neighborhood's hotel as a place record.** The
place carries `"town": "{Neighborhood}"`, so importing one publishes a false
statement about where that hotel is, and it also claims the global place slug
(rule 9) for the wrong neighborhood.

When a neighborhood has no verified hotels of its own, write a short
**"Where to stay"** note — as the optional third section, or as an FAQ
answer — that names the **nearest verified option** and the neighborhood it
is actually in, and **add a `links` edge to that neighborhood's guide**.

That edge is not decoration. It is load-bearing:

- it gives the reader a real next step instead of a dead end;
- it is exactly how a thin neighborhood reaches the **3-link orientation
  floor** in rule 8 — the lodging note and the link are one move, not two.

The target guide must exist by seed time (rule 11). If the nearest verified
option is in a neighborhood no wave has covered yet, name it in prose
without the link and pick up the edge from a covered neighbour instead.

---

## 8. Orientation page requirements (`"tier": "town-page"`)

The honest format for a neighborhood with fewer than 6 surviving places.

- **Intro** — 90-130 words of real, neighborhood-specific history, from
  verified history facts only. Same voice as a full guide, same word-count
  method (rule 5).
- **Sections** — a `Getting there` section, per rule 6, on the same terms as
  a full guide. **Both of rule 6's gates apply to orientation pages too**:
  the exact heading, and the trip-duration ban. An optional second section
  only where the research genuinely supports one.
- **"What's here"** — list every verified place, however few. If the
  neighborhood yields **zero** verified places, ship `"places": []` and
  `"entries": []`; the template omits the section rather than rendering it
  empty. Do not manufacture a place to avoid an empty array.
- **A Nearby block** — the `links` array (rule 11), rendered as the page's
  onward navigation.
- **FAQ** — two to three entries, one of which is
  `How do I get to {Neighborhood}?` (gated, per rule 5).
- **Photos** — at most one, and only if a free-licensed candidate for *that
  neighborhood* exists. Otherwise `"photos": []`. Do not reach for a loosely
  related image from a neighbouring neighborhood.

### The floor — what does not ship

An orientation page must clear **both**:

- an intro of **at least 90 words** of real, neighborhood-specific history,
  **and**
- **at least 3 outbound links** in its `links` array.

Both halves are mechanically enforced, and the gate applies them **only to
`"town-page"` files** — but a full guide that cannot reach 3 links has a
different problem worth raising in your report.

A neighborhood that cannot clear the floor is **omitted**, and the omission
is recorded in the wave report with the reason. **Never ship a stub to fill
the roster.** With 69 neighborhoods, several of them small residential
pockets, some omissions are the expected outcome, not a failure of the wave.

---

## 9. Place slugs

- Kebab-case of the place name: lowercase `a-z`, digits and hyphens only.
  `Ethos.Places.Place`'s changeset enforces `^[a-z0-9-]+$` — no underscores,
  no apostrophes, no accents, no capitals.
- **Append `-{neighborhood-slug}` whenever the name is generic or could
  recur elsewhere.** `frenchette` is fine on its own; `the-park`,
  `city-diner`, `main-street-bakery` are not.

**Slugs are unique across the entire site, not just Brooklyn.**
`Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0` checks every
`priv/seed_data/*/*.json` file — Brooklyn, Manhattan and Connecticut — plus
the Connecticut code module `lib/ethos/seeds/connecticut_places.ex`, and
fails if any slug has more than one owner. It counts owners with `length`,
not `uniq`, so two places sharing a slug **inside one file** collide too.
The underlying reason is a global `unique_index` on `places.slug`: in
production a collision fails partway through a non-transactional run,
leaving earlier files published and later ones unseeded.

**Brooklyn's known collision risks.** Each of these names both a place and a
neighborhood, so the bare kebab-case slug is already claimed by the
neighborhood's own naming or will be:

| Name | Note |
| --- | --- |
| Sunset Park | park **and** neighborhood (wave 7) |
| Marine Park | park **and** neighborhood (wave 1) |
| Washington Park | generic park name; Manhattan already owns `washington-market-park` (Tribeca) and `washington-square-park` (Greenwich Village) — suffix it |
| Highland Park | park spanning the Queens line **and** neighborhood (wave 1) |
| Manhattan Beach | beach **and** neighborhood (wave 8) |

For every one of these, slug the **place** with the neighborhood suffix —
`sunset-park-sunset-park`, `marine-park-marine-park` and so on read
awkwardly, so prefer a descriptive disambiguator the research supports
(`sunset-park-brooklyn`, `marine-park-salt-marsh`). Either is acceptable;
what is not acceptable is the bare name.

**Later waves must not redefine a place slug an earlier wave owns.** Before
writing a slug you are unsure about:

```bash
grep -rn '"slug": "your-candidate-slug"' priv/seed_data/ lib/ethos/seeds/connecticut_places.ex
```

---

## 10. Place kinds

`kind` comes from a **closed set**, verified against
`lib/ethos/places/place.ex`:

```
museum  theater  restaurant  cafe  brewery  hotel  bnb
park  historic-site  amusement-park  attraction
```

Anything else fails changeset validation at seed time — the gate's
load-twice pass will raise, and so will production seeding.

Brooklyn-specific mappings, so two authors classify the same thing the same
way:

- **Beaches** (Coney Island beach, Manhattan Beach, Brighton Beach) →
  `park` if it is a city parkland unit, otherwise `attraction`.
- **The Riegelmann Boardwalk** → `park` or `attraction`.
- **Luna Park** → `amusement-park`. So is Deno's Wonder Wheel Amusement
  Park. The Cyclone and the Wonder Wheel, as individual rides, are
  `attraction`.
- **Bakeries, delis, pizzerias by the slice, coffee counters** → `cafe` by
  default. Use `restaurant` only when the research describes table service
  or a full sit-down menu. Applying the default is never wrong.
- **Breweries and distilleries** → `brewery`.
- **Churches, synagogues and landmarked buildings** → `historic-site`.
- **Cemeteries** (Green-Wood) → `historic-site`, or `park` where the
  research frames it as parkland.
- **Piers, bridges, viewpoints** → `attraction`.
- **B&Bs and small inns** → `bnb`; full-service hotels → `hotel`.

There is no `beach`, no `bar`, no `shop`, no `gallery`, no `bakery`, no
`landmark`. Map to the closed set or do not ship the place.

---

## 11. Links

The `links` array holds this guide's **outgoing** edges. `kind` is one of
four, enforced by `Ethos.Links.Link`:

- **`nearby`** — the two neighborhoods **share a border**. Nothing weaker.
- **`same-region`** — close but not bordering, or in the same part of the
  borough. **When you are not certain two neighborhoods border each other,
  use `same-region`.** A Connecticut wave-2 review caught five `nearby`
  edges between towns with another town between them; Brooklyn's contested
  boundaries (rule 13) make this easier to get wrong, not harder.
- **`shared-history`** — a stated historical relationship, with a note
  quoting it.
- **`see-also`** — cross-borough edges only. See below.

Mechanical constraints:

- `note` is `null` or a string of **at most 160 characters** (validated).
- A page may not link to itself.
- One direction per pair is enough: rendering unions incoming and outgoing
  edges. Direction is free — links are applied in their own pass, so a file
  may link to any guide in the same run regardless of file order.
- **Every note is a factual claim like any other.** It must trace to the
  research for one of the two neighborhoods, and the trip-duration ban
  applies to it (rule 6.7 lists `links[].note` for exactly this reason). Do
  not characterise a neighborhood's region, nickname or industry from your
  own knowledge.

### The cross-borough constraint is a hard failure mode

`Ethos.Links.resolve!/1` raises `ArgumentError` on an unknown target. That
does not skip the edge — it **aborts the entire link-upsert pass**. And the
link pass runs *third*, after every guide in the run has already been
upserted and published. The result in production is a live-looking site with
a half-replaced link graph: guides published, edges partly retired and
partly not. This is not a style note.

Therefore:

- Author a `see-also` **only where a real named connection exists** in the
  research — a bridge, a shared line, a documented historical tie. Not
  "these are both interesting places".
- A `see-also` target **must be a Manhattan guide slug that already
  exists.** Manhattan's 38 guides follow `{neighborhood}-manhattan-guide`,
  but do not construct the slug from memory — read it:

```bash
grep -h '"slug": ".*-manhattan-guide"' priv/seed_data/manhattan/*.json
```

  At least one is irregular: Hell's Kitchen is
  `hell-s-kitchen-manhattan-guide`, not `hells-kitchen-manhattan-guide`.
- Brooklyn targets are safe **within the run** — the gate and
  `Ethos.Release.seed_brooklyn/1` seed all files' places, then all guides,
  then all links — so a wave-8 file may link to a wave-1 file and vice
  versa. It is **not** safe to link to a neighborhood that no wave has
  authored yet, or to one that was omitted under rule 8's floor. Check
  `priv/seed_data/brooklyn/` before writing the edge.
- `place:` targets are permitted by the loader but are not part of this
  program's link plan; use `guide:` targets unless your dispatch says
  otherwise.

---

## 12. Photos

**Source.** Wikimedia Commons only, chosen only from the wave's photo
artifact. Never substitute an image from anywhere else, and never substitute
an unlicensed image because a neighborhood would otherwise have none.

**Licences.** The `license` string must be one of these, matched exactly:

- `Public domain` — this exact capitalisation. `Public Domain` fails.
- `CC0` — bare. `CC0 1.0` fails.
- `CC BY x.y` or `CC BY-SA x.y` — matched by `^CC BY(-SA)? \d\.\d$`: a
  single digit, a dot, a single digit. `CC BY 4.0` and `CC BY-SA 3.0` pass.
  `CC BY 4.0 International`, `CC-BY 4.0` and `CC BY 4` all fail.

**Counts.** Two to four per full guide. At most one per orientation page.
Zero where nothing acceptable exists — `"photos": []` is a valid, expected
outcome and the layout tolerates it.

**Attribution.** Copy `author`, `license` and the Commons **file page** URL
verbatim from the artifact. `source_url` is the **file page** URL
(`https://commons.wikimedia.org/wiki/File:...`), never the direct image URL.
All seven keys — `src`, `thumb`, `title`, `description`, `author`,
`license`, `source_url` — must be present and non-null strings on every
photo, on guides and places alike. Write your own `title` and `description`:
**`title` at most 8 words, `description` one sentence of at most 25 words**,
both factual and describing what is actually in the frame. Neither is a
place to add a fact the research does not carry, and both are walked by the
trip-duration gate (6.7).

**Paths.**

```
"src":   "/photos/ny/brooklyn/{neighborhood-slug}/{label}.jpg"
"thumb": "/photos/ny/brooklyn/{neighborhood-slug}/{label}_thumb.jpg"
```

The path is validated against `^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$`
— lowercase only, no dots inside the label, no capitals.

**Labels are the optimizer's lookup key, and they are global.**
`mix ethos.optimize_brooklyn_photos` resolves every
`/photos/ny/brooklyn/{hood}/{label}.jpg` from a **single flat directory**,
`images/brooklyn/{label}.*`. One label therefore means one source image
across all of Brooklyn — not one per neighborhood. The gate enforces exactly
this: it groups every photo by label across every committed file and fails
if one label carries more than one `source_url`.

So: **every label is globally unique across Brooklyn, and appears in exactly
one neighborhood's photo paths.** Suffix `-{neighborhood-slug}` whenever the
label could recur (`carousel-dumbo`, not `carousel`). The gate would tolerate
one label reused across two neighborhoods *for the same image*; this contract
does not, because it makes the flat `images/brooklyn/` directory ambiguous
for every later wave. One label, one image, one neighborhood.

**Attach** each photo to the guide gallery, and additionally to a place's
`photos` array when the photo depicts that specific place (copy the same
seven-key map).

**The manifest is required, not optional.**
`priv/seed_data/brooklyn_photo_manifest.json` maps every label to
`{"source_url": "<Commons file page URL>", "sha256": "<hex digest of the downloaded file>"}`.
Two independent things depend on it:

- `mix ethos.optimize_brooklyn_photos` verifies the sha256 of
  `images/brooklyn/{label}.*` against the manifest **before** writing the
  published file, and fails loudly on a mismatch — so a swapped source image
  can never publish under another image's author and licence credit.
- The gate asserts that `manifest[label]["source_url"]` **equals** the
  `source_url` printed on the photo, in every file. A label missing from the
  manifest fails this too.

**Files must be on disk.** The gate asserts that both `src` and `thumb`
exist under `priv/`. Run the optimizer before the gate, or every photo you
added fails.

**You fetch the images yourself.** Nothing downstream does it: the optimizer
reads from disk and fails if the file is not already there. Download each
chosen `direct_image_url` to `images/brooklyn/{label}.{ext}` (rule 14, step
2), then **record the `{label} → direct_image_url}` pairs in your report** —
that is what lets the wave's photo step fetch them, and what makes the
pairing auditable afterwards.

---

## 13. Boundary language

Brooklyn's neighborhood edges are genuinely contested, and no source
settles them. Known contested pairs and areas, from the roster:

- Bushwick / East Williamsburg
- Ocean Hill / Bedford-Stuyvesant (and Stuyvesant Heights within Bed-Stuy)
- Gravesend / Homecrest / Madison
- The Flatbush cluster — Flatbush, Ditmas Park, Prospect Park South,
  East Flatbush, Kensington, Remsen Village, Rugby, Farragut
- Greenwood / Windsor Terrace / Sunset Park
- Boerum Hill / Cobble Hill / Carroll Gardens

**Describe boundaries as commonly understood; never assert a definitive
line.** In practice:

| Write | Not |
| --- | --- |
| "the blocks generally considered East Williamsburg" | "East Williamsburg begins at Bushwick Avenue" |
| "commonly grouped with Bedford-Stuyvesant" | "Ocean Hill is part of Bedford-Stuyvesant" |
| "the area around Cortelyou Road, usually called Ditmas Park" | "Ditmas Park runs from Coney Island Avenue to Ocean Avenue" |

A reviewer checks this by looking for definitive boundary verbs — "begins
at", "extends to", "runs from X to Y", "is bounded by", "ends at" — applied
to a neighborhood edge. Streets are fine as landmarks ("the shops along
Cortelyou Road"); they are not fine as declared borders.

The roster's `community_district` field is an administrative fact from NYC
DCP and may be stated as such. A community district is **not** a
neighborhood boundary, and must not be presented as one.

---

## 14. Validation before commit

Run in this order. Steps 1-4 must all happen before step 5, or the photo
assertions fail on files you did add correctly.

1. **Write the seed files.**
2. **Download every chosen image to `images/brooklyn/{label}.{ext}`**, where
   `{label}` is the label in that photo's `src` path and `{ext}` is the
   Commons original's extension (`jpg` `jpeg` `png` `tif` `tiff`, upper or
   lower case). This directory is flat and git-ignored, and it is where
   `find_source!/1` looks — the optimizer in step 4 raises
   `no source image for {label} under images/brooklyn/` if the file is not
   there. **Validate magic bytes, not just file size**: Commons serves HTML
   error pages that a size check happily accepts, and 41 of them were once
   saved as `.jpg` in the Connecticut program. Re-fetch anything that fails.
3. **Update `priv/seed_data/brooklyn_photo_manifest.json`** with a
   `{"source_url", "sha256"}` entry for every new label — the sha256 being
   the digest of the file you just downloaded in step 2.
4. **`mix ethos.optimize_brooklyn_photos`** — reads
   `images/brooklyn/{label}.*`, verifies its sha256 against the manifest,
   and writes `priv/photos/ny/brooklyn/{slug}/{label}.jpg` and `_thumb.jpg`.
5. **`mix test test/ethos/seeds/brooklyn_seed_data_test.exs`** — the gate,
   over every committed Brooklyn file including earlier waves'.
6. **`mix test`** — the full suite.

Steps 2 and 3 are the two the gate cannot remind you about until it is too
late: skip 2 and the optimizer raises; skip 3 and the `unpinned` assertion
fails on every photo you added.

Both test runs green, **with your wave's files added**, before you commit.
A gate failure is never fixed by editing the gate: not by weakening a
regex, not by narrowing an assertion, not by adding an unjustified
allowlist entry. Fix the content.

---

## 15. Copy quality bar

Concrete and specific, warm but not breathless. Write like the Connecticut
and Manhattan guides.

**Banned outright**, because they are checkable:

- Filler openers: "nestled in the heart of", "tucked away", "steeped in
  history", "boasts".
- Unverifiable superlatives: "best pizza in Brooklyn", "the city's finest",
  "world-famous" — unless the research carries the claim *and its source*,
  in which case attribute it.
- AI-tells: "vibrant tapestry", "hidden gem", "melting pot", "rich history",
  "eclectic mix", "must-visit", "a testament to".
- First-person or second-person fabrication of experience: "you'll find
  yourself", "wandering these streets, I…". Third person, always.
- Present-tense claims about anything that closes, changes hours or changes
  hands, beyond what the research verified.

**Titles** follow `{Neighborhood}, Brooklyn: {hook}`, hook 4-8 words, naming
something real:

> Red Hook, Brooklyn: Warehouses, Water, and No Subway

not

> ~~Red Hook, Brooklyn: A Hidden Gem~~
> ~~Greenpoint, Brooklyn: Where Old Meets New~~

The test a reviewer applies: **does the hook name a thing that exists, and
does that thing appear in the research artifact?** A hook is a factual claim
like any other — the good example above is a shape to imitate, not a title
to reuse.

---

## 16. Rule ↔ gate map

Every mechanical assertion that can fail a Brooklyn seed file, and the rule
it enforces. This covers both the assertions written in
`test/ethos/seeds/brooklyn_seed_data_test.exs` and the schema validations it
reaches transitively through `DataGuide.load!/1`, `Place.changeset/2`,
`Guide.photos_changeset/2`, `Entry.changeset/2`, `Link.changeset/2` and
`GuideRunner.upsert!/2` during the load-twice pass. Use it when a gate goes
red, and when reviewing a wave.

| Gate assertion | Rule |
| --- | --- |
| `DataGuide.load!` — `guide` is a map, `places`/`entries` are lists | 4 |
| `DataGuide.load!` — required guide keys non-empty (`slug` `title` `destination` `state` `county` `intro`) | 4 |
| `DataGuide.load!` — `tier` ∈ `{guide, town-page}` | 3, 4 |
| `DataGuide.load!` — link target parses as `guide:`/`place:` | 4, 11 |
| `assert_place_slugs_globally_unique!` — one owner per slug across all seed dirs + CT module | 9 |
| `license_violations` — `Public domain` / `CC0` / `^CC BY(-SA)? \d\.\d$` | 12 |
| `tier_violations` — guide with < 4 places; town-page with ≥ 6 | 3 |
| `floor_violations` — town-page intro < 90 words | 8 |
| `floor_violations` — town-page with < 3 links | 8, 7 |
| `getting_there_violations` — every file has a section headed exactly `Getting there` (both tiers) | 6.1 |
| `transit_faq_violations` — every file's FAQ has a question matching `/how do i get to/i` (both tiers) | 5, 8 |
| `trip_duration_violations` — **eleven** patterns over every string in every file | 6.4, 6.6, 6.7 |
| `@trip_duration_allowlist` — `{file, path, phrase}` tuples | 6.8 |
| `label_dups` — one label may not carry two `source_url`s | 12 |
| `missing` — `src` and `thumb` exist under `priv/` | 12, 14 |
| `unpinned` — `manifest[label].source_url` == photo `source_url` | 12 |
| Manhattan corpus seeded first, then `upsert_links!` — `Links.resolve!` raises on unknown target | 11 |
| Three-pass load, twice — idempotency | 14 |
| `Places.get_place_by_slug!` during the guide pass — `entries[].place_slug` resolves | 5 |
| `Place.changeset` — `kind` in the closed set | 10 |
| `Place.changeset` — `status` ∈ `{open, closed}` | 4 |
| `Place.changeset` — `official_url` and `booking_url` are safe http(s) URLs when present | 4 |
| `Entry.changeset` — entry `kind` ∈ `{food, tour, walk, sight, stay, tip}` (this contract narrows it to four) | 5 |
| `Place.changeset` — slug matches `^[a-z0-9-]+$` | 9 |
| `Place.changeset` — all 7 photo keys are strings, path regex, safe `source_url` | 12 |
| `Guide.photos_changeset` — `src`/`thumb`/`title`/`description` are strings, path regex, safe `source_url` | 12 |
| `allowed_license?` crashes on a missing `license` key — so `license` is required on guide photos too, even though the changeset does not demand it | 12 |
| `Link.changeset` — kind ∈ `{nearby, shared-history, same-region, see-also}`, note ≤ 160 chars, no self-link | 11 |
| published Brooklyn guides == committed file count (`county == "Brooklyn"`) | 4 |

**Rules with no gate behind them.** These leak unless a human checks them,
and the per-wave fact-fidelity reviewer is that human. **A green gate does
not mean a compliant file** — it means nothing in this table was checked.

| Rule | Unenforced part |
| --- | --- |
| 2 | All verdict filtering — nothing mechanical can tell a verified fact from an invented one |
| 3 | The 6-place threshold itself (the gate only fails clear mislabels: guide < 4, town-page ≥ 6) |
| 4 | **Every fixed value except `guide.county`**: `places[].county`, `places[].state`, `places[].town`, `places[].status` beyond `{open,closed}`, `guide.destination`, and the `{slug}-brooklyn-guide` slug pattern. `Place.changeset` requires `county` and `state` to be *present*, never to hold a particular value — a place carrying `"Kings County"` publishes cleanly and wrong |
| 5 | **Intro 100-160 words**; 2-3 sections; **FAQ count 4-6**; **places 6-12**; **entries 6-12** |
| 6 | The proximity rule (6.3); mode coverage (6.2); service caveats (6.5); the regexes' known gaps (6.6) |
| 7 | Hotel-in-neighborhood requirement and the "Where to stay" note |
| 8 | **Intro 90-130 words** (only the 90 floor is gated, never the ceiling); **FAQ count 2-3**; **at most one photo**; the omission decision |
| 11 | `nearby` meaning a shared border; notes tracing to research |
| 12 | **Photo counts (2-4 on guides, ≤ 1 on orientation pages)**; attribution copied verbatim |
| 13 | Boundary language |
| 15 | The whole copy bar |

The **bolded** entries are mechanizable and were considered and declined —
the ranges and counts because a build that fails over a 165-word intro or a
thirteenth place is a build somebody eventually weakens, and a weakened
suite protects nothing; rule 4's fixed values because they are copy-paste
constants that a reviewer checks in seconds against the table in rule 4.
Drift gets a gate; range
gets a reviewer. Count them yourself with the command in rule 5.
