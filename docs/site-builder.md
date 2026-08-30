# Building a themed set of sites

How to publish a guide for each of N related sites — thirty ballparks, thirty-two
stadiums, sixty-three national parks — where each guide covers the site itself
and the places around it.

**Read this before writing any dispatch, seed file or roster.** It is the
operating manual, not background reading. Tasks in a set-building plan cite this
document instead of restating it, so a rule weakened here is weakened everywhere.

## How to read it

Every rule below carries the failure that produced it. That is deliberate and it
is the most important property of this document. A rule stated bare — "scan every
prose field", "record whether the search completed" — looks like fussiness, and
the next person to touch the pipeline will reasonably optimise it away. A rule
carrying its cost does not get optimised away, because the cost is legible.

The numbers quoted are measurements from the place-research programme of
2026-08-29 and the Brooklyn and Connecticut content waves before it. Where a
number is quoted it was counted, not estimated.

**The numbers are restated here rather than cited to a workspace, on purpose.**
The SDD ledgers those measurements came from live under `.superpowers/`, which
`.gitignore:42` excludes; they are untracked and will not survive a fresh clone.
That is not hypothetical — the Brooklyn research artifacts were lost exactly that
way, which is why `docs/content-defects.md` exists in `docs/` and says so in its
own opening paragraph. Anything a later programme must not re-derive belongs in
`docs/`. This file is that.

---

## 1. What this pattern is for

A **themed set of N sites**, where each site becomes one guide, and the guide's
entries are the places around that site. The site itself is also a place, so it
has its own page, can be badged, and gives the guide an anchor entry.

Instances:

| set | the site | the "around it" | roster source |
|---|---|---|---|
| MLB ballparks | the ballpark | bars, restaurants, shops, museums within walking distance | one entry per club |
| NFL stadiums | the stadium | the same, plus more parking-dominated approaches | one entry per club |
| National parks | the park | gateway towns, trailheads, lodges — see §10 | one entry per park unit |

The platform already owns everything a set needs. Guides own entries, FAQs and
photo galleries (`lib/ethos/seeds/guide_runner.ex` upserts all three), plus
breadcrumbs (`EthosWeb.GuideBreadcrumb`), collections (`Ethos.Collections` and
the seed modules) and the link graph (`DataGuide.upsert_links!/1`,
`Ethos.Seeds.BackfillLinks`). Places own pages, addresses, structured data
and the badge system. **Nothing is built to make a set work.** If you find
yourself designing a schema, stop and check §3 and §11 first — one of them
probably already covers what you are about to build, or explains why it is
deliberately not built yet.

### The sequence

Do these in this order. The ordering constraints are not mechanical convenience;
each one is explained in the section named.

1. **Write or amend this document** for anything the set changes. (§10)
2. **Add the place `kind`** if the site type is new — one word in
   `lib/ethos/places/place.ex:7` and one mapping in
   `lib/ethos_web/controllers/place_html.ex`, with the existing test asserting
   every kind maps to a real schema.org type.
3. **Commit the roster.** N entries, identity fields only, everything researched
   left null. (§2)
4. **Write the set's own `<set>_seed_data_test.exs`**, modelled on
   `test/ethos/seeds/brooklyn_seed_data_test.exs`. Then **add whichever halves of
   your set are written in Elixir to the corpus-gate call sites** — the two
   triggers are independent, so check each:
   - **places in an Elixir module** → four call sites, plus a seed call so the
     places exist before any guide's entries resolve.
   - **guides in Elixir modules** → one call site, the guide list.
   - **both** → six edits. **Neither** (all JSON) → none.

   Most of the gates in this document are per-directory, and the corpus-wide ones
   name the code half of the corpus explicitly; you inherit less than it looks
   like. See below. Write it before the checkpoint, so the checkpoint site is the
   first thing it checks.
5. **Run one site end to end and stop.** Research, author, seed, render, review,
   amend this document. (§6)
6. **Run the rest in waves**, sized to search budget, not to concurrency. (§4)
7. **Assert the roster is exhausted** mechanically. (§2)
8. **Ship the collection and the runbook entry.** (§8, and
   `docs/runbooks/seeding.md`)

Step 5 before step 6 is the single ordering constraint that exists for a reason
other than mechanics, and it is the one most likely to be parallelised away by
someone in a hurry. §6 is about why.

### Which gates you inherit, and which you must write

Get this wrong and you will believe a rule is enforced when nothing is checking
it. There are **two** axes, not one, and missing the second is how this section
was wrong in its first draft:

1. **Corpus-wide or per-directory.** A gate that walks
   `SeedDataHelpers.all_seed_files/0` covers a new **guide-corpus** directory;
   one scoped to a named directory does not. "Guide-corpus" is load-bearing —
   `all_seed_files/0` rejects `@non_guide_dirs = ["destinations"]`
   (`test/support/seed_data_helpers.ex:27-43`), and that exclusion is pinned by
   its own test at `seed_data_helpers_test.exs:38-53`. See the note on
   `destinations/` below.
2. **JSON or code module.** No corpus-wide gate discovers Elixir seed modules;
   each one enumerates them **by name**, and this is true of **both halves** —
   places modules *and* guide modules. The places lists hold exactly one name,
   `Ethos.Seeds.ConnecticutPlaces`. The guide list holds seven, and is a
   different list in a different file.

There are four seed directories today — `brooklyn`, `connecticut`, `manhattan`
and `destinations` — and four destination tests, one per directory.

#### Free, if your places live in JSON

These walk every guide-corpus file, so a new `priv/seed_data/<set>/` is covered
the moment the first file lands — with `destinations/` excluded throughout, per
the note below:

- `test/ethos/seeds/place_content_gate_test.exs` — the banned-prose patterns over
  every string, orphaned entries, and manifest/corpus disjointness.
- `Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0`. Three
  destination tests call it (`brooklyn:242`, `manhattan:23`, `connecticut:99`;
  the destination-page test does not), and `seed_data_helpers_test.exs:55-57`
  runs it unscoped — which is the run that covers you.
- **Loader and changeset validation, through the production path — for JSON
  files only.** `destination_seed_data_test.exs:340-357` seeds *every* file from
  `all_seed_files/0` through `DataGuide.upsert_places!/1` and
  `upsert_guide!/2` — the same functions `Ethos.Release` drives — so a malformed
  file, an invalid `kind`, a non-http `official_url`, an unknown tier or an entry
  naming a place that does not exist raises there without you writing anything.
  **A guide written as an Elixir module gets none of this**; see the guide-module
  row below.
  **Links are deliberately not applied** in that pass, so your `links` array is
  *not* covered; `upsert_links!/1` runs only where each directory's own test
  calls it (`brooklyn:314`, `connecticut:231`, `manhattan:44` — with Brooklyn and
  Connecticut additionally running it over Manhattan's directory at `brooklyn:308`
  and `connecticut:225`, to stand up the cross-guide link-target universe).

#### Not free: anything scoped to a directory

Every destination test scopes itself to one directory — Brooklyn through
`SeedDataHelpers.seed_files("brooklyn")`
(`brooklyn_seed_data_test.exs:14`, helper at
`test/support/seed_data_helpers.ex:20-25`), destination pages through
`seed_files("destinations")` (`destination_seed_data_test.exs:15`), Connecticut
and Manhattan through their own hardcoded globs
(`connecticut_seed_data_test.exs:7`, `manhattan_seed_data_test.exs:7`).
Everything they assert applies to that directory alone:

- the `Getting there` heading assertion (§8),
- **the trip-duration ban** (§8) — the single most important one to port,
- photo licence validation, label uniqueness, on-disk photo checks and manifest
  provenance,
- tier/place-count agreement, orientation-page floors, intro length,
- roster-to-corpus agreement for that directory,
- the transit FAQ requirement,
- link resolution over your own files.

A set publishing into `priv/seed_data/nfl-stadiums/` with no test of its own gets
**none** of that list.

#### The one directory where all of this runs backwards: `destinations/`

`priv/seed_data/destinations/` holds destination-page records — a path, a name,
an intro and photos, with no guide, places or entries — so `all_seed_files/0`
excludes it by name and every "free" gate above is **void** there. Nothing in
`place_content_gate_test.exs` and no slug-uniqueness check ever reads one, and
the loader pass at `destination_seed_data_test.exs:340-357` never sees one
either.

Inheritance runs the other way instead. A file added to `destinations/` gets the
**entire** destination gate for nothing — intro floor and ceiling, licences,
label uniqueness, on-disk photos, manifest provenance, photo-directory
containment, and the strongest of the three duration copies (§8). You write no
test at all.

What you must do by hand is get the file admitted. `@destination_roster`
(`destination_seed_data_test.exs:288-302`) is a **literal thirteen-path list**,
and `unresolvable_path_violations` additionally requires the path to be one a
destination page is actually served from. **A set adding
`illinois/cook-county` fails that test until the roster is extended by hand** —
and if the set's guides are Elixir modules, extending the roster is not enough,
because the path never enters `legitimate_paths/0` in the first place. See the
guide-module table below.

And know that you may not need the file at all. Destination pages are optional:
the hubs are `GROUP BY`-derived (§3), and `DestinationController` handles a
missing record on every branch — town at `destination_controller.ex:69`, state at
`:101`, county at `:137`, each passing `nil` through to a template that gates on
it. A destination record adds an intro and photos to a hub that already exists
without one. Add them where a set's hubs deserve editorial copy, not as a step
you owe.

**The general case behind this, for any non-guide directory.** `@non_guide_dirs`
is a literal list holding one entry. A *second* non-guide directory under
`priv/seed_data/` is therefore picked up by `all_seed_files/0`, handed to
`DataGuide.load!/1`, and raises through `validate_shape!` on the missing
`guide`/`places`/`entries` keys — taking **every** corpus-wide gate down with it,
not just its own. That failure is loud and immediate, so the risk is low; but if
your set needs a directory that is not a guide corpus, add it to `@non_guide_dirs`
in the same change that creates it.

#### Not free, and easy to miss: a code module is invisible to the corpus gates

This one is sharp, and it applies to the ballpark shape directly, because a set
holding its places in `lib/ethos/seeds/<set>_places.ex` and its guides in
`lib/ethos/seeds/<set>_guide.ex` rather than in JSON is a supported and sometimes
correct choice — it is the shape `connecticut_places.ex` and the five town guide
modules already use.

**There are two lists, not one, and fixing the places half fixes half the
problem.** Read both tables below before concluding you are covered.

##### The places half — four call sites, in three files

The corpus-wide gates read the places half of the code corpus as a hardcoded call
to `Ethos.Seeds.ConnecticutPlaces.places()`, and nothing else. **Count the lines,
not the files:**

| file | line | what it feeds |
|---|---|---|
| `place_content_gate_test.exs` | `:118` | `corpus_slugs/0` — the orphaned-entry and deleted-place checks |
| `place_content_gate_test.exs` | **`:176`** | `prose/0` — **the banned-prose scan itself** (§6: excluded today) |
| `bare_places_roster_test.exs` | `:66` | the roster's corpus tuple |
| `test/support/seed_data_helpers.ex` | `:58` | `assert_place_slugs_globally_unique!/0` |

The second row is the one an implementer who counts files instead of lines drops,
and it is the banned-prose scan — the reason this subsection exists at all.

One honest caveat on that row: both tests `prose/0` feeds carry
`@tag :pending_wave` and are excluded by default — they are the "2 excluded" in
every `mix test` line. **Extending `:176` buys you nothing until that exclusion
lifts**, which is §6's own rule ("an excluded gate is not a gate") pointing at
this document. Extend it anyway: the exclusion is a deferral with a numbered
re-enabling step attached, and a call site that was never extended is how a gate
comes back on and silently skips your set.

**A new places module is scanned by none of the four.** Concretely,
`ballpark_places.ex` would get:

- no banned-prose scan and no address-stub check,
- no orphaned-entry check,
- and **no global slug-uniqueness assertion** — so a ballpark place slug
  colliding with a Brooklyn one is not caught at test time at all. It surfaces as
  the production unique index firing partway through a seed run that is not
  transactional, "leaving earlier files published and later ones unseeded", which
  is the failure `seed_data_helpers.ex`'s own moduledoc opens by describing.

So if your places live in a module, **extend all four call sites above to name
it** as part of step 4. It is four one-line changes and it is the difference
between §7's dedup ladder having a bottom rung and not. It is not, on its own,
the whole fix — read the guide half below.

Extend `lib/mix/tasks/ethos.bare_places.ex:69` and `:79` with them. That task is
not a gate, so nothing breaks if you skip it — but it is the generator behind
§2's roster precedent, and a code-module set is invisible to it too, which means
the roster it produces would silently omit every place in your module.

##### The guide half — seven names on two lines, in one function

`seed_guide_corpus!` (`destination_seed_data_test.exs:340-357`) is the
corpus-wide loader gate listed as free above. It takes its **JSON** files from
`all_seed_files/0`, which discovers them, but its **Elixir** seeds from seven
hardcoded names in **two separate places**, and this matters for what you edit:

- `:341` — `ConnecticutPlaces.upsert_all!()`, a standalone **places** call.
- `:343-350` — the `for mod <- [...]` **guide** list of six: `WaterburyGuide`,
  `MiddleburyGuide`, `DanburyGuide`, `SouthburyGuide`, `WoodburyGuide` and
  `RomeGuide`.

Seven names, one list of six. Adding a guide module to `:343-350` does not seed
its places.

Two consequences, both distinct from the places half:

- **A set whose guides are Elixir modules gets no free loader or changeset
  validation at all.** Everything the free list promises — shape, `kind`
  inclusion, `official_url` scheme, entry resolution — is reached by seeding, and
  your modules are never seeded there. The places half was only half the blind
  spot.
- **Your destination slugs never enter `legitimate_paths/0`.** That set is built
  from the corpus this function seeds, so a `destinations/` file your set ships
  fails `unresolvable_path_violations` — and it fails for a reason the roster
  paragraph above does not predict, because the path is missing from the
  *universe*, not from the *roster*. Extending `@destination_roster` alone will
  not fix it.

**Count by which halves you wrote in Elixir, not by "is this a code-module
set".** Each of the three sites has its own independent trigger:

| site | you need it when |
|---|---|
| the four in the table above | your **places** are in an Elixir module |
| the guide list, `:343-350` | your **guides** are Elixir modules |
| a seed call beside `:341` | your **places** are in an Elixir module **and any guide in the corpus has entries naming them** |

So: all-JSON needs nothing; Elixir guides over JSON places needs one; and **the
ballpark shape — both halves in Elixir — needs six.**

The third row is the one a reader who sees only "add it to the guide list" will
miss, and it is worth stating by mechanism rather than by set shape, because the
mechanism is what decides it. `:341` exists so that places declared in a module
are in the database before any guide's entries are resolved;
`GuideRunner.replace_entries!` resolves each entry through
`Places.get_place_by_slug!/1` (`guide_runner.ex:102`), which raises on a place
that was never seeded. **Whether the guide holding those entries is JSON or
Elixir does not change that** — what matters is that the places came from a
module nothing seeds.

The failure is loud and immediate rather than silent, so this is a low-risk
omission. But it surfaces inside a test named for destination pages, which is
not where anyone will look first.

#### One gate you inherit without being told, and it names the wrong state

`connecticut_seed_data_test.exs:266-281` globs **every** `lib/ethos/seeds/*.ex`,
excludes `rome_guide.ex` by name, and runs Connecticut's nine drive-time patterns
over the raw source text. Your guide module is not on the exclusion list, so a
new set's module containing "a 20-minute walk" fails a test called *"connecticut
prose in lib/ethos/seeds/\*.ex is free of banned drive-time phrasing"*.

That is the correct outcome reached by a confusing route, and it is worth knowing
in advance rather than debugging at 2am: **the failure is real, the rule is one
you should be following anyway (§8), and the test name points at the wrong
state.**

It exists because the gap was live. `burys_collection.ex` and
`middlebury_guide.ex` shipped "within a short drive", "ten minutes east", "ten
minutes southwest" and "about ten minutes away" **to production**, because the
JSON-only glob never read code-module source. If your set adds a places module or
guide modules, that scan is the only duration coverage they have.

#### What you do not inherit, despite appearances

`bare_places_roster_test.exs` reads through `all_seed_files/0`, but it **gates
nothing of yours**. It asserts a fixed count of 424 entries and *one-way*
membership — every roster row must match a corpus place. Adding a directory only
enlarges the corpus, so a new set can never fail it. It is a precedent to copy
(§2), not coverage you receive.

Copy `test/ethos/seeds/brooklyn_seed_data_test.exs` for the per-directory shape,
change the directory, take the duration gate from `destination_seed_data_test.exs`
(§8 says why), and drop the parts your set has no equivalent of rather than
adapting them.

---

## 2. Roster first

**Before any research, commit a file listing the N sites.** It is the work list;
without it there is nothing to dispatch at, no way to tell a wave what it covers,
and no way to prove at the end that nothing was skipped.

Precedent: `priv/seed_data/bare_places_roster.json` (424 entries) with
`test/ethos/seeds/bare_places_roster_test.exs`.

### What goes in a roster entry, and what does not

Two kinds of field, and the distinction is load-bearing:

- **Identity fields** — what you need to dispatch research *at* something. For
  clubs, the club name and a slug. These are taken as given.
- **Researched fields** — venue name, city, state, county. These start `null`
  and are filled only from confirmed verdicts.

A roster that asserted venues up front would launder N unverified facts into a
committed file that every later task would treat as settled. Venue naming is
exactly the class of fact that goes stale silently and reads as confident:
sponsorship renamings are frequent, a club may be playing in a temporary venue,
and a club in transition may share a park — which is why "thirty clubs" is a
fact and "thirty ballparks" is an assumption. Take the stable identity, research
the rest.

Assert that the two move together: an entry is either fully resolved with
`verified: true`, or fully null. **A half-filled row means someone wrote down
what they thought they knew and stopped**, and there is no later signal that
distinguishes it from research output.

### Assert attribution, not only membership

This is the rule people get wrong, and it was found by mutation testing rather
than by review.

The bare-places roster test originally flattened the corpus to a list of slugs
and checked membership. Every entry was present, so it passed. Then it was
mutated: a row's `seed_file` was repointed at a different file, a row's `region`
was set to `"atlantis"`, and a row's `name` was changed. **All three mutations
passed every assertion.**

`seed_file` is the field roughly 850 agent runs dispatch on. A repointed row
sends an agent to open a file that does not contain the slug — and the
roster-exhaustion check at the end still counts that row as covered. The failure
is silent in precisely the place it can least be afforded.

The fix is to check the whole identity tuple against the live corpus —
`{slug, name, region, seed_file}` — not the slug alone. See
`test/ethos/seeds/bare_places_roster_test.exs:41-51`.

The same test deliberately leaves `kind` and `town` **out** of the tuple while
still asserting them non-empty. A wave may legitimately correct either, and
asserting them would fail the test for the programme doing its job. The rule
generalises: **put in the tuple the fields that identify which record this is;
leave out the fields the work is allowed to improve.**

### Exhaustion is a mechanical check, not a feeling

At the end, assert against the roster that every entry is resolved. N sites
researched across parallel waves is exactly the shape where one is skipped
silently — a batch reports success, its report is read, and nobody notices the
one row no batch claimed.

---

## 3. Geography is derived, never built

**There is no states table and there must not be one.**

`/destinations/illinois` and `/destinations/illinois/cook-county` are `GROUP BY`
queries over the guides table:

- `Ethos.Guides.list_states/0` — `lib/ethos/guides.ex:88-96`. Groups published
  guides by `state`/`state_slug` where `state_slug` is not null.
- `Ethos.Guides.list_counties_for_state/1` — `lib/ethos/guides.ex:98-108`. Groups
  by `county`/`county_slug` within one state.
- Routes: `lib/ethos_web/router.ex:26-28`.

You set two string fields on the guide — `state` and `county`. `Guide.changeset/2`
derives `state_slug` and `county_slug` from them
(`lib/ethos/guides/guide.ex:113-124`, via `derive_destination_slug/1`), and both
hub pages exist on the next seed. Adding twenty-seven states to the site is a
property of the content, not a migration.

**If you are about to write a migration to add a geographic hierarchy, you have
misread this section.** The hierarchy is a projection of the guides.

### The New York convention: borough-as-county

New York guides put the **borough** in the county slot.
`priv/seed_data/brooklyn/dumbo.json` carries `"state": "New York"` and
`"county": "Brooklyn"` — not `"Kings County"`, not `"Kings"`. Manhattan files
carry `"county": "Manhattan"`.

So a Bronx site takes `county: "Bronx"` and a Queens site `county: "Queens"`,
producing `/destinations/new-york/bronx` and `/destinations/new-york/queens` with
no special handling. Follow the convention rather than the county's legal name;
a set that introduces `"Kings County"` alongside the existing `"Brooklyn"` splits
one borough into two hubs, and nothing in the schema will complain —
`Place.changeset` requires `county` to be present but not to hold any particular
value.

### Three things that will bite you

**The state branch shadows the destination branch.**
`DestinationController.show/2` (`lib/ethos_web/controllers/destination_controller.ex:47-51`)
tries `list_published_guides_for_state/1` first and only falls back to the
destination hub when that returns `[]`. Both live at `/destinations/:slug`. If a
set introduces `state: "Washington"` while a guide already publishes
`destination_slug: "washington"`, the state hub wins and the city hub becomes
unreachable at that path. Check for the collision before choosing, not after.

**Destination hubs key on the city name alone.** `derive_destination_slug/1`
takes the text before the first comma, so `"Kansas City, Missouri"` and
`"Kansas City, Kansas"` both produce `destination_slug: "kansas-city"` and merge
into one hub. That may be what you want. It is never what you want by accident —
decide, and record the decision in the guide module's moduledoc.

**`county` may be null and that is a legitimate choice.**
`lib/ethos/seeds/antique_trail_guide.ex` carries `state: "Connecticut"` and no
county on purpose, because the trail spans towns; it lists on the state page
rather than under one county, and its moduledoc says so. A site that genuinely
spans counties should do the same rather than pick one.

---

## 4. The research contract

Nothing ships from recollection. Every published clause traces to a `confirmed`
verdict.

### Two agents, and they must be two

A **finder** gathers material and cites sources. An **independent verifier**
adjudicates each item: `confirmed`, `refuted`, `uncertain`. **The finder never
writes verdicts.**

That separation has collapsed once, in the Brooklyn programme, and it produced a
**44-of-44 confirmation rate that had to be thrown out entirely**. An agent
asked to check its own work confirms its own work. The rate is the tell: a
perfect confirmation rate is a warning sign, not a clean result, and a batch
reporting one should be required to explain why rather than to present it.

Adversarial verification works when it is real, and the measure is that it
changes outcomes. From one 31-place checkpoint and the 73-place wave after it:

- A room count refuted by **re-fetching the finder's own cited source** — 353
  rooms, not 347.
- A founding year and a chef's name attributed to an Infatuation article that
  **contains neither**.
- "Distributed nationally" against a page that says "the New York Tri-State
  area" — a regional claim inflated to a national one.
- A 1968 construction date and an "apprenticed under Frank Lloyd Wright" claim
  absent from the cited Wikipedia article after three targeted re-fetches. Both
  refuted.
- Ratings and review counts drifting: 3.6 not 4/5; 205 not 279 reviews; 273 not
  226.
- And in the other direction — a verifier **upgraded** a status the finder had
  called unclear, on evidence the finder missed.

Those are the errors a self-checking finder returns as 44-of-44.

### The eight hard rules

These bind every wave. Restate the list in each dispatch; do not paraphrase it.

1. **The authoring contract binds.**
   `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` governs verdict
   filtering, seed shape, section requirements and voice. Read it whole before
   authoring. Its §2 in particular: `refuted` is excluded unless the verifier
   supplied a correction, which you use *exactly as given*; `uncertain` is
   excluded from places and lodging with no exceptions; an uncertain history fact
   may be kept only by removing the unverified specific, never by hedging it
   ("reportedly", "said to have been", "around 1890").

2. **There is no minimum word count, anywhere, and none may be added.** A length
   floor is the obvious way to enforce "no more thin summaries" and it
   manufactures the exact defect it is meant to prevent: roughly twenty summaries
   in this corpus read as inspection-record boilerplate *because something had to
   fill the space*. A seven-word summary that says the one true thing is a pass.
   The gate bans **patterns**, not brevity — see
   `test/ethos/seeds/place_content_gate_test.exs:5-12`.

3. **A closure requires positive evidence.** A closure notice, a dated report, a
   "permanently closed" marker on a source that maintains one, a successor
   business at the address. "I could not confirm it is open" is `uncertain`, and
   **uncertain never deletes.** This rule exists because a checkpoint verifier
   ruled a restaurant closed with its own words being "precautionary, since no
   accessible source in 2026 confirms it's still open" — which under a
   delete-on-closure policy would have destroyed a live record *and its guide
   entry* on absence of evidence. Deleting a business that is open is far worse
   than leaving a closed one listed: one is a wrong fact on a page, the other is
   a page that no longer exists.

4. **A business's own site cannot establish an award, a ranking, a superlative,
   or that it is still trading.** It can establish that it exists, what it
   serves, and where. Applied at the checkpoint this downgraded a "Michelin-guide
   recommended", a "Three Michelin Keys in 2025", and a hotel's own open status.
   The precise reading matters: an operator's page is third-party evidence for
   its *tenants* and self-referential for *itself*, and one verifier got that
   exactly right on a market's own status while leaving its tenants open.

5. **The finder never writes verdicts.** See above — 44 of 44.

6. **The gate scans every prose field, and a wave cleans every mention of its
   places anywhere in the file.** §9 and the measurements in §6.

7. **Parking and public transport are prose in a "Getting there" section, never
   place records.** §8.

8. **Nothing about identity — which team plays where, what a venue is currently
   called, which town a business is in — is taken from recollection or from an
   unchecked list.** A verdict establishes it or it does not ship.

   **This is the one rule of the nine stated partly from anticipation, and it is
   marked as such deliberately.** No shipped file in this corpus has yet been
   caught carrying a stale venue name, because no set has been built before this
   one. What the corpus *does* hold are two instances of the same failure with a
   source in place of a memory, both recorded in
   `lib/ethos/seeds/antique_trail_guide.ex:17-22`: a dealer excluded because a
   directory **mislocated a Southbury business into Woodbury**, and another
   excluded because it rested on one line of a trade association's courtesy list
   — **the same list still carrying a company Connecticut revoked in 2013.** A
   list that looks authoritative and is years stale is exactly what recollection
   feels like from the inside, and both were caught only because identity was
   verified rather than assumed. That guide ships sixteen dealers, two researched
   ones having been excluded.

   Both exclusions are **gated, not merely documented** —
   `connecticut_places_test.exs:54-74` asserts neither slug nor the mislocated
   business's address ever reappears, and `antique_trail_test.exs:81-89` asserts
   the guide names neither. That is the pattern to copy when research excludes
   something: a test, so a later wave cannot quietly restore it.

   Nearest instance of the pure form, one domain over: during the same
   programme an agent wrote a module docstring asserting that a controller
   already served 410 Gone for deleted slugs. Nothing in `lib/` matched 410 at
   the time — the feature was two tasks away from existing, and only shipped
   later (`place_controller.ex:90`). It was confident, checkable,
   wrong, and it was caught by an implementer reading the code rather than by a
   reviewer reading the prose. Treat "which team plays where" the same way.

A ninth rule sits inside the authoring contract and is worth surfacing, because
it is the subtlest: **a `confirmed` verdict vouches for what the verdict's own
`item` text restates, not for every clause in the finder's original sentence.**
A file once shipped a clause calling a church "one of the Landmarks Preservation
Commission's earliest individual designations" on a `confirmed` verdict whose
item text restated only the designation and its date. Confirming the designation
did not confirm the superlative riding along with it. Architectural style is the
most common clause of this kind — a verifier checks that a building is the one
named and stands where it is said to stand, not what its ornament is. Before
publishing a sentence built from a confirmed item, compare it against the
verdict's own restatement and drop what the verdict did not say. Where a verifier
quotes a source verbatim, **where the quotation stops is the edge of what is
confirmed.**

### Record whether the search actually happened

Every site gets `"searched": "complete" | "rate_limited" | "blocked"` from the
finder.

**An empty result from a throttled finder is indistinguishable from a site with
nothing to find.** Both read as "nothing to say", and under the no-minimum-length
rule both would legitimately ship a short summary — so the failure is invisible
at every downstream gate.

The rule was written after exactly two places came back with empty findings and
the reason surfaced only in a verifier's prose ("search access had been
rate-limited during the original research for those two specifically"). **It was
written for two places and it caught sixty**: the next wave came back 60 of 73
rate-limited or blocked, and without the flag those 60 partial results would have
been indistinguishable from 60 finished ones. Extrapolated to the wave's full
remit — the ~394 places left on the roster after the checkpoint — the programme
would have reported the lot "complete" while genuinely researching a fraction.

### Search access is the binding constraint, and it is not concurrency

Budget for this at planning time, because it decides schedule more than anything
else in the design.

| run | concurrent agents | rate-limited or blocked |
|---|---:|---|
| checkpoint | 8 | 2 of 31 (6%) |
| wave run 1 | 24 | 60 of 73 (82%) |
| wave re-run | 8 | essentially all |

The first two rows look like a clean concurrency effect. The third row falsifies
it. Re-running at the checkpoint's agent count did **not** restore completion;
one verifier tried WebSearch, Bing, DuckDuckGo, Yelp, TripAdvisor, OpenCorporates
and the Wayback Machine and was blocked or CAPTCHA-walled on every one. Another
finder reported `WebSearch 200/200 exhausted` before issuing its first query.

The constraint is session-cumulative or source-side. Two correlated data points
were enough to name a cause and the third disproved it — which is itself the
lesson. **Expect throttling, run small waves spread out, check `searched` values
before banking a wave as done, and stop when throttling dominates rather than
pushing through and recording partial work as complete.**

Re-queued batches **extend** their existing artifact rather than starting over.
`rate_limited` batches are not empty — they hold real confirmed facts — and
re-researching from zero would waste them and re-spend the budget that is already
the bottleneck.

---

## 5. Verdicts gate publication; `searched` gates completeness accounting

Two different questions, and conflating them costs a wave.

- **A site with at least one confirmed verdict is authored**, whatever its
  `searched` value says.
- **Only a site with no confirmed verdict *and* an incomplete search is
  re-queued.**
- `searched` still records coverage honestly, so a later pass knows where to
  look. It just does not veto work that succeeded.

The measurement that forces this: across 73 places, **60 were flagged
rate-limited or blocked, and 64 of 73 (88%) still had at least one independently
confirmed verdict** — 226 confirmed verdicts between them. The flag and the yield
are almost decoupled.

The rule originally read "anything not `complete` is re-queued rather than
treated as researched", which was written for the case where a throttled finder
returned an *empty* found list. Applied literally to that wave it would have
re-queued 60 places holding 226 confirmed facts — and the re-run had just
demonstrated that re-queueing does not clear the flag, so it would have looped
forever. Under the corrected rule the re-queue set is **9 of 73, not 60**.

The general failure: `searched` was written as a proxy for "did we get
anything", and the proxy diverged from the thing the moment the environment
changed. When a flag and the outcome it stands for can be measured separately,
gate on the outcome.

Cost if this is wrong in the other direction: some sites are published from
partial research. They were already published from *no* research, and every
published clause still needs a confirmed verdict.

---

## 6. The checkpoint

**Run one site completely — research, author, seed, render, review — and stop.
Amend this document. Then run the rest.**

Pick the hardest useful case, not the easiest. A checkpoint that only sees easy
cases certifies a contract the hard cases break. For ballparks that meant a dense
walkable neighbourhood with rail service in a state the corpus had never
published, so it exercised geography creation, entry density and transit prose at
once. For a set spanning two authoring surfaces — JSON seed files and Elixir seed
modules — cover both, because editing `lib/ethos/seeds/connecticut_places.ex`
(atom keys, no per-file gate) is a materially different operation from editing a
JSON seed file (string keys, loader validation, per-file gate).

### What a checkpoint is worth

The place-research programme's checkpoint was **31 places** and it amended the
contract **six times**:

1. A closure requires positive evidence; "could not confirm open" never deletes.
2. Finders must distinguish "searched and found nothing" from "could not search".
3. A business's own site cannot establish an award, ranking, superlative or
   trading status.
4. The gate scans every prose field, not just summaries.
5. A wave cleans every mention of its places anywhere in the file.
6. Patterns ban the practice, not one phrasing of it.

Every one of those would have compounded across the remaining ~393 places. The
checkpoint was the cheapest place on the whole programme to find them, and it
found all six.

Two of those are worth their measurements, because they are the ones that read as
pedantry until you see the count move:

**Rule 4 — every prose field.** The gate read only place `summary` fields. Eight
summaries in one file were rewritten to drop banned prose while the *section
body* one field away still read "Each is carried in the city's restaurant
inspection records at its address, with an inspection dated 2025 or 2026." Same
file, same banned phrase, invisible. Extending the gate to every prose field
moved the known-defect count **from 14 to 23** — nine fields nobody was looking
at, spread across five files, including boilerplate sitting in the same record as
a summary the old gate *did* read.

**Rule 6 — the practice, not the phrasing.** The pattern matched "restaurant
inspection records" but not "inspected by the city in August 2025", which was the
phrasing the entry notes actually used — 20 occurrences across five files.
Widening it to the practice moved the count **from 23 to 55**, in nine files —
five of which were not on anyone's list, and two of which had been invisible to
*every* prior version of the gate. The real footprint was four times the number
the programme started from.

So: 14 → 23 → 55, from two rule changes, on a corpus everyone believed was
measured. That is what a checkpoint buys.

**Do not widen a pattern mid-count.** The author deliberately did not widen the
regex until after the before/after numbers were recorded, because a moving regex
makes a measurement meaningless. Measure, then widen, then measure again.

**Design a gate against crying wolf, and measure that too.** The inspection-grade
letter is matched case-sensitively — `(?-i:[A-C])` inside an otherwise
case-insensitive pattern — because a bare `grade` fires inside "accessibility
upgrades" and a case-insensitive `[a-c]\s+grade` matches the indefinite article
in "a grade-separated right-of-way". Measured against the corpus: the loose forms
gave five hits, all legitimate railway and roadway prose; the case-sensitive form
gave eight, all genuine. Rejected alternatives are recorded *in the test file*
with their reasons, so nobody re-proposes them. **A gate that cries wolf gets
excluded, and an excluded gate is not a gate.**

That last point has teeth. The two content assertions in
`test/ethos/seeds/place_content_gate_test.exs` are tagged `:pending_wave` and
excluded in `test/test_helper.exs`, because they legitimately fail on today's
corpus and a red baseline makes every later task's test run ambiguous — an
implementer cannot tell their own regression from the expected failure. That is a
deferral with a list attached, and both files say in prose when and how to delete
the exclusion. **A permanently excluded gate is a hole with a comment on it.** If
your set adds an excluded assertion, put its re-enabling in a numbered step of a
later task, not in a note.

### The checkpoint review

Dispatch a **fact-fidelity reviewer** whose job is to trace every published claim
back to a verdict and to report **any contract defect that would compound across
the remaining N-1**. Amend this document before the next wave starts, and record
each amendment where it survives — `docs/`, not a workspace.

Also worth knowing: gate-defect surveys tend to find defects **clustered, not
scattered**. One survey found 28 defects in 8 files, all in one region's JSON,
zero in the code module — one authoring session that went wrong, not a systemic
problem across 424 records. That changes wave planning: put the checkpoint on top
of the worst file rather than sampling blind.

And **prove your assertions bite before you trust them.** Two techniques, both
cheap:

- **Probe with one entry.** A test that computed `before - MapSet.size(slugs())`
  passed vacuously against an empty manifest, because at size zero it reads
  `before - 0`. Only a temporary one-entry probe revealed it. Adopt this whenever
  a gate reads a list that ships empty.
- **Choose the probe so it can fail two ways.** A disjointness probe was seeded
  with an *atom-keyed* Connecticut slug rather than a JSON one, which proved both
  that the assertion was non-vacuous *and* that the atom-keyed half of the corpus
  was genuinely being read. A string-key read there would have yielded nil for
  all 50 slugs and let the probe pass green while leaving every Connecticut place
  unguarded.

---

## 7. The dedup ladder

Three rungs, in increasing cost. **Two are automatic and one is not**, and the
document is explicit about which so nobody assumes the tooling covers the third.

**(a) The global slug index and the gate assertion — free and mechanical.**
Place slugs carry a database unique index, and
`Ethos.SeedDataHelpers.assert_place_slugs_globally_unique!/0`
(`test/support/seed_data_helpers.ex:49`) fails the build when two files claim one
slug. It is directory-qualified, because two destinations may hold the same
basename and a basename comparison would hide a genuine cross-destination
collision; and it groups on `length(owners) > 1` rather than uniqueness, because
two places sharing a slug *inside one file* collide too. It catches exactly one
thing: the same slug twice.

**You get it for nothing only if your places are in JSON.** Its code-module half
is the single hardcoded line `Ethos.Seeds.ConnecticutPlaces.places()`
(`test/support/seed_data_helpers.ex:58`), so a set holding places in its own
module has **no rung (a) at all** until that line names it too — the collision
then surfaces as the production unique index firing mid-seed rather than as a red
test. §1 has the call sites to extend — four for places, plus one for guides.

**(b) Address matching before minting a slug — a contract step, not a tool.**
Before creating any place, the finder checks the existing corpus for that street
address. **An address collision is a reliable signal and a name is not.** Nothing
runs this for you; it is a numbered step in the research dispatch, and if the
dispatch omits it the check does not happen. Put it in the dispatch.

**(c) Judgement on name variants — irreducible.** "Murphy's Bleachers" against
"Murphy's". "The Mercer" against "Mercer Street Hotel". No index catches this and
no regex will. It is caught by a human or a verifier reading the candidate list
against the corpus, or it is not caught. **Say so plainly in the dispatch rather
than implying the tooling covers it** — an agent that believes rung (a) is
complete duplicate protection will mint the duplicate confidently.

The overlap risk is set-dependent and worth assessing up front. For MLB it was
low: only New York touches the existing corpus, and the corpus holds Manhattan
and Brooklyn, not the Bronx or Queens. For a set covering territory already
published, budget real time for rung (c).

One related gate to keep green: **removing a place and recording it as deleted
are two halves of one change.** Seeding is upsert-only, so a manifest entry whose
row is still in a seed file gets re-created by every seed run and deleted again by
every prune, indefinitely. `place_content_gate_test.exs:219-237` asserts the
corpus and `priv/seed_data/deleted_places.json` are disjoint, which catches the
half-done change at test time instead of in production.

---

## 8. Transit and parking are prose, never place records

One **"Getting there"** section per guide, covering rail and subway lines and the
stations that serve the site, bus routes where they are the realistic answer,
official parking and its published cost where a source states it, and the
practical local note. The day-tripper gets every fact; it simply does not
fragment into stubs.

**The reason: N parking-garage pages are thin by construction, and that thinness
is the exact defect a whole programme was spent removing.** The place-research
backlog exists because 424 place records were under 25 words, photoless and
history-less; a wave was spent rewriting them and the backlog still stands at 320
(`docs/place-research-backlog.md`). Minting thirty new records that can never be
more than an address and a rate card would be manufacturing the same defect on
purpose. A subway platform is also not somewhere a visitor spends the day, which
is the test for whether something deserves a page.

This is a deliberate departure from a literal reading of a request for "places
around it", and it should be recorded as such wherever the set is specified, so
it does not get re-litigated as an oversight.

### Writing the section

The rules are in `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md`
§6, and they generalise. The important ones:

**The heading is exactly `Getting there`** — lowercase `t`, no trailing mode.
Not `Getting There`, not `Getting there by subway`. This is the most likely drift
in a set: an author who has read the previous programme's guides will reproduce
its heading, **and the heading does not drift alone — it takes the multi-modal
rule below with it.**

**It is gated for Brooklyn only** —
`test/ethos/seeds/brooklyn_seed_data_test.exs:248-250`, over
`seed_files("brooklyn")`. Your directory has no such assertion until you write
one. This is step 4 of §1's sequence, and the reason it is a step rather than a
note is the paragraph four down: a prose rule restated in every dispatch and
checked in every review demonstrably does not hold.

**Name only the modes that actually apply.** Manhattan used a single uniform
heading because in Manhattan the subway is always the answer. In Brooklyn it is
not: Red Hook has no subway station at all, Greenpoint is ferry-first, East New
York has an LIRR station, and several neighbourhoods are reached by bus. Where
there is no rail, **write that plainly and move on to the real answer** rather
than straining to name a distant station because some station must be named. Bus
routes listed "for completeness" beside a station that already serves the site
are padding, and padding here reads as authority the research does not support.

**The proximity rule, which is the one that produces fabrications.** A station may
be presented as *serving* the site only when the research places it in or on the
edge of the site's area. Three cases:

- **A — the artifact locates it there.** "Carroll Street on the F and G is the
  neighborhood's station."
- **B — the artifact locates it elsewhere.** Name that elsewhere: "The nearest
  subway is Carroll Street on the F and G, in Carroll Gardens."
- **C — the artifact lists it but does not say where it sits.** This is the
  common case and it deadlocks the first two rules. **Do neither.** Name the
  station and its lines and assert nothing about location: "Carroll Street is
  served by the F and G." Then record the gap in the wave report, so the flat
  phrasing reads as deliberate and a later pass can close it.

A location claim in Case C is a fabrication; a flat sentence in Case A is merely
thin, and thin is never wrong.

**Never publish a trip duration or a drive time. This is categorical.** No "a
twenty-minute walk from the station", no "forty minutes from the gateway town",
no "a short drive", no "about an hour by car". Station names, line designations,
road numbers, directions, distances in miles and bordering relationships are
published and stable; a duration is not — it varies by time of day, changes with
every service revision or roadworks, and **no research artifact supports one**,
which means every duration in the corpus was supplied by an author rather than
by a verdict.

It is the rule this document's own §10 makes it easiest to break: the moment you
write "a park's entries are a drive rather than a walk", the next sentence wants
to be "a forty-minute drive." Do not write it. State the road, the direction and
the mileage instead.

**Why this is gated rather than trusted, and what it cost when it was not.** A
prose rule restated in every dispatch and checked in every review is *not*
enough. The drive-time ban was written into every Connecticut wave's dispatch and
checked in every review, and it still leaked: one audit found **58 occurrences
across 28 committed files**, some already live on the public site, that reviewers
had read past. A duration claim can hide in any of six places a reviewer reads
separately — the intro, a section body, an FAQ answer, a place summary, a photo
description, or a link note — and across several waves at least one of the six
was missed every time.

Three of the four existing directories now gate it mechanically over **every
string in every seed file**, not just the transit section. There are three copies
and **they are not equivalent** — take the last one:

| copy | patterns | has specimen assertions? |
|---|---:|---|
| `connecticut_seed_data_test.exs:25-58` | 9, ported from the detector script used to find the 58 | no |
| `brooklyn_seed_data_test.exs:25-73` | 11 | no |
| **`destination_seed_data_test.exs:36-112`** | **11, byte-identical to Brooklyn's** | **yes — `:100-112`, asserted at `:457`** |

**Port the destination copy, and carry `@trip_duration_specimens` with it.**
The eleventh pattern in all three exists because the plainest phrasing of all,
"…in 25 minutes", escaped the other ten. But eleven patterns are load-bearing
only *in aggregate*: the `trip_duration.json` fixture fires patterns 1, 2 and 3,
so **4 through 11 could be deleted wholesale, or quietly weakened, and the suite
would stay green.** The destination copy closes that with one specimen per
pattern — a phrasing only that pattern was written to catch — and a test
asserting each fires on its own indexed line. Its comment at `:87-94` names the
hole and says outright: *"The Brooklyn gate has the same gap."*

Porting the copy that cannot tell you when it has been weakened, into a document
whose §6 is about gates that get weakened, would be the same mistake twice. Take
the specimens.

Carry its comment at `:36-41` too — **"Do not re-derive, condense or 'improve'
one of these: a subtly weaker pattern is exactly the failure the gate exists to
prevent, and it does not show up as a test failure."** That is the rule about
copies generally, and it is why the table above ranks by *what each copy can
prove about itself* rather than by pattern count.

Manhattan has no duration gate at all, which is the point of the previous
section: the ban is a rule of this document, and whether it is enforced in your
directory is something you decide by writing a test or not.

Two more things to keep when you port. The **allowlist starts empty** and is
keyed on `{file, json path, matched phrase}` so that pardoning one phrase does
not excuse the rest of the string; every entry needs a manual read and a stated
reason in a wave report. And the hour pattern is anchored on a preceding "in"
rather than a bare `\d+\s*hours?`, because the bare form fires on "open 24
hours" — a legitimate and common thing to say about a diner. That is the
cry-wolf discipline of §6 applied here.

**And if your set authors any prose in Elixir**, the JSON gate does not see it.
`burys_collection.ex` and `middlebury_guide.ex` shipped "within a short drive",
"ten minutes east", "ten minutes southwest" and "about ten minutes away" **to
production** for exactly that reason. `connecticut_seed_data_test.exs:266-281`
now scans every `lib/ethos/seeds/*.ex` as raw text — see §1, including why it
will fail your module under a Connecticut-sounding test name.

**Which rules belong in a test, and which belong to a reviewer.** Rules that
catch drift — a fixed string quietly reverting, a required element going missing,
an unverifiable claim creeping in — belong in a test. Rules describing an
editorial *range* — word ceilings, entry counts, photo counts — belong to the
reviewer, because a gate that fails a build
over a 165-word intro is a gate somebody eventually weakens, and a weakened suite
is worse than an ungated range.

### The rest of the guide

Three sections minimum:

1. **Getting there** — above.
2. **Around the site** — the food, drink and shopping the entries point at.
3. **The site itself** — its history and the institution it belongs to.

The guide module's **moduledoc states which verdicts the content rests on and
what was dropped**, as `lib/ethos/seeds/antique_trail_guide.ex` does — including
the two dealers it declined to publish and why. That docstring is what makes the
content auditable a year later, when the research workspace is gone.

Wire seeding as **places before guides**, following
`Ethos.Release.seed_connecticut/1` (`lib/ethos/release.ex:29-50`). Entries resolve
by `place_slug` through `Places.get_place_by_slug!/1`
(`lib/ethos/seeds/guide_runner.ex:102`), which raises on a missing place — loud at
seed time, and caught earlier by the gate's orphaned-entry assertion. Collections
run **after** guides, for the same reason in reverse. Add the new seed function to
`docs/runbooks/seeding.md` with its ordering constraint spelled out.

A set gets a **collection** — `lib/ethos/seeds/antique_trail_collection.ex` is
the model. Every member guide then shows *"Part of <Collection>"* under its title
from the existing template line
(`lib/ethos_web/controllers/guide_html/show.html.heex:7-9`), with no template
change.

---

## 9. Method note: enumerate by slug, never grep for the phrasing

**To find every field that talks about a site, enumerate that site's fields by its
slug through the data structure and read them. Do not grep for the phrase.**

This is the most transferable thing the programme produced.

A text search for a defect finds only the defects you already know how to spell,
and **a claim about a place need not name the place recognisably.** The canonical
example: an entry note reading *"SoHo's original five-star hotel, in a landmark
Romanesque Revival building"* — a superlative and an architectural style, both
banned, both already removed from the place's summary, still published on the
guide page. It contains neither the hotel's name nor any banned word. Grepping
would have missed it entirely. Matching entries on `place_slug` and walking the
structure found it.

The same principle applies to the gate itself. `collect_strings/2` in
`place_content_gate_test.exs:145-161` walks the decoded structure and gathers
every string rather than enumerating field paths, because an enumerated list —
summary, history, intro, body, question, answer, note — is a list someone forgets
to extend the day a new prose field is added, and the gate goes quiet about it.
The walk cannot go quiet: a new field is covered the moment it holds a string. It
also sweeps fields that are not prose at all, which is deliberate — the patterns
are narrow enough that a URL or a slug cannot match, so the over-broad sweep
costs nothing and guessing which fields are "prose" costs a hole.

**Three failures, one error.** Field coverage (the gate read only summaries),
place coverage (the grep missed a note that named neither the place nor a banned
word), and phrasing coverage (the regex banned one wording of a practice) are the
same mistake: **assuming the thing you are looking for will announce itself in the
form you expected.** When you catch yourself searching for a defect by its
surface, switch to enumerating the structure.

A corollary for verification of a different kind: when two shipped files
contradict each other, **record it rather than guessing.**
`docs/content-defects.md` is the register — each entry says what the corpus
asserts, what was checked, why it is still open, and what would close it. Two
files disagreeing on a merger date could be "fixed" in either direction, and both
branches decide by guess a question the corpus cannot settle; one recorded
contradiction is cheaper than one confidently wrong edit, and the register keeps
resolved entries so nobody re-opens them.

---

## 10. What changes for a different set

**NFL stadiums: nothing structural.** Same shape, different roster. One entry per
club, venues null until verified — sponsorship renaming is if anything more
frequent than in baseball, so rule 8 of §4 matters more, not less. Expect the
"around it" set to skew slightly toward parking-dominated approaches and away
from walkable blocks; that changes what the *Getting there* prose emphasises, not
what a place record is.

**National parks: the same machinery, a different unit of "around".** Three
things change:

- **The radius is much larger.** A ballpark's entries are a walk; a park's are a
  drive. The entry set is **gateway towns, trailheads, visitor centres and
  lodges**, not bars within four blocks. **This is the sentence that makes the
  duration ban hardest to keep** — "a drive" invites "a forty-minute drive", and
  a parks directory with no seed-data test of its own has nothing to stop it.
  State the road, the direction and the mileage. See §8, and write the test at
  step 4 before you author anything.
- **Gateway towns matter more than blocks.** A gateway town may deserve its own
  guide, which raises a genuine design question: is the town an entry on the
  park's guide, or its own guide linked from it? Prefer the entry until a town
  has enough verified material to stand alone, then promote it and link — the
  link graph already supports `guide:` targets.
- **County is often ambiguous or plural.** A park spanning three counties should
  take the county its main visitor centre sits in, or `nil` (see §3), and the
  moduledoc should say which was chosen and why. Do not invent a hyphenated
  compound; it produces a hub nobody links to.

**For any set, the questions to answer before starting:**

1. What is the roster's unit — the institution or the venue? (§2)
2. Does the site type need a new place `kind`, and what schema.org type does it
   map to?
3. What is the "around it" radius, and what counts as inside it?
4. Does the set touch territory the corpus already publishes? (§7 rung c)
5. What is the state/county convention for the territories involved, and does any
   state slug collide with an existing destination slug? (§3)
6. Which single site is the hardest useful checkpoint? (§6)

---

## 11. The deferred question: a place that owns entries

Requests for a set frequently describe *a place* carrying "other places around
it" — the borough itself rather than the stadium in it, a region rather than a
venue.

**Today only guides own entries.** A place has a summary, photos and a sibling
list derived by town; it cannot carry a curated list of nearby places. Everything
in this document routes around that by making the site a *guide* that also has a
place record, which works cleanly for a venue and less cleanly for a region.

Making a place own entries costs, at minimum:

- **A join table** — places-to-places with a position and a note, or a
  generalisation of the existing entries table beyond its `guide_id`.
- **A place-page section** to render them, plus its structured-data implications.
- **A seed-format change**, in both authoring surfaces: the JSON shape and the
  atom-keyed code modules.
- **A loader change** in `Ethos.Seeds.DataGuide` and whatever upserts places, with
  the same place-before-reference ordering constraint guides already have.
- **Gate assertions** — orphaned place-entries, and slug uniqueness across the new
  relation.

**Deliberately not built.** No set so far has needed it, and running a set of
thirty teaches what the shape should be before committing to one. It is recorded
here rather than in a workspace so the next person finds the question instead of
rediscovering it — and so that anyone tempted to build it mid-set can see the
five-part cost before starting.

---

## Reference: the files this pattern touches

| what | where |
|---|---|
| Geographic hubs, derived | `lib/ethos/guides.ex:88-108`, `lib/ethos/guides/guide.ex:113-124` |
| Destination routing | `lib/ethos_web/router.ex:26-28`, `lib/ethos_web/controllers/destination_controller.ex:47-51` |
| Place kinds and schema types | `lib/ethos/places/place.ex:7`, `lib/ethos_web/controllers/place_html.ex` |
| Guide upsert | `lib/ethos/seeds/guide_runner.ex` |
| Guide module model | `lib/ethos/seeds/antique_trail_guide.ex` |
| Collection model | `lib/ethos/seeds/antique_trail_collection.ex` |
| Code-module places | `lib/ethos/seeds/connecticut_places.ex` |
| Seed wiring and ordering | `lib/ethos/release.ex`, `docs/runbooks/seeding.md` |
| Roster precedent and its test | `priv/seed_data/bare_places_roster.json`, `test/ethos/seeds/bare_places_roster_test.exs` |
| Content gate | `test/ethos/seeds/place_content_gate_test.exs`, `test/test_helper.exs` |
| Global slug uniqueness | `test/support/seed_data_helpers.ex:49` |
| **Per-directory gate to copy** (heading, licences, tiers, links) | `test/ethos/seeds/brooklyn_seed_data_test.exs` — also `connecticut_`, `manhattan_`, `destination_seed_data_test.exs` |
| **Duration gate to copy** — the only copy that proves its own patterns | `destination_seed_data_test.exs:36-112`, specimens at `:100-112`, asserted at `:457` |
| Other duration/drive-time copies (no specimen assertions) | `brooklyn_seed_data_test.exs:25-73`, `connecticut_seed_data_test.exs:25-58` |
| Duration scan over **code modules** — will fail your module under a Connecticut name | `connecticut_seed_data_test.exs:266-281` |
| Corpus-wide loader/changeset validation, free for JSON | `destination_seed_data_test.exs:340-357` |
| The **four** call sites to extend for a code-module **places** file | `place_content_gate_test.exs:118` **and `:176`**; `bare_places_roster_test.exs:66`; `test/support/seed_data_helpers.ex:58` |
| Code-module **guides** — one more site, also feeds `legitimate_paths/0` | `destination_seed_data_test.exs:343-350` (the `for mod` list of six) |
| Code-module **places**, seeding half — so entries can resolve | `destination_seed_data_test.exs:341` (`ConnecticutPlaces.upsert_all!()`) |
| Roster generator, same blind spot (not a gate) | `lib/mix/tasks/ethos.bare_places.ex:69`, `:79` |
| Deletion manifest | `priv/seed_data/deleted_places.json` |
| Authoring contract | `docs/superpowers/plans/2026-08-28-brooklyn-content-rules.md` |
| Borough-as-county example | `priv/seed_data/brooklyn/dumbo.json` |
| Outstanding research debt | `docs/place-research-backlog.md` |
| Known contradictions | `docs/content-defects.md` |
