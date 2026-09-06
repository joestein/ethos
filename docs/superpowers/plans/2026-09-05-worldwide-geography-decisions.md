# Worldwide Geography — Decision Record

Date: 2026-09-05
Branch: `worktree-worldwide-geography`
Spec: `2026-09-05-worldwide-geography-design.md`
Plan: `2026-09-05-worldwide-geography.md`

Every decision taken during execution without asking, each with its reasoning
and what it costs if wrong. Recorded because several of them override the spec
or the plan, and a future reader comparing the shipped code against those
documents will otherwise find contradictions with no explanation.

Numbering is the order the decisions were made, not their importance. The ones
that most changed what shipped are C7 (roster moved out of a globbed directory),
C8 (ordered JSON decoding, which is what made the 393-file rewrite reviewable),
C11 (the Vatican restored as sovereign), C22 (422 town-hub redirects that were
nearly abandoned), and C24 (the curated hub content defect, which became Task 13).

---

## C1

Task 6 removes town/state/county from the 31 code modules, but
`Place.changeset/2` still requires them until Task 12 — the Task 7 shim was
only wired into the JSON loader, so `ConnecticutPlaces.upsert_all!/0` and the
ballpark place modules would fail validate_required. Decided: move the shim
into `Places.upsert_place!/1` itself, so every caller (JSON loader and code
module alike) gets the legacy triple derived from the node. Cost if wrong:
one extra query per place insert during the transition, deleted in Task 12.

---

## C2

ballpark *guide* modules pass their map to `GuideRunner.upsert!/2`,
which after Task 7 reads `data.destination_id` — but Task 6 has them carry
`destination_path`. Decided: `GuideRunner.upsert!/2` accepts either, resolving
`:destination_path` to a node when `:destination_id` is absent. Cost if wrong:
a second resolution path to delete later; caught immediately by the ballpark
seed test.

---

## C3

the roster gives `italy/lazio/rome` a legacy path of `"italy"`,
but `"italy"` is also a real node (the country). Exact-node resolution runs
first, so `/destinations/italy` renders the Italy country hub and the Task 9
redirect test asserting a 301 would fail. Decided: drop `"italy"` from Rome's
legacy_paths and drop that row from the redirect test — the country hub now
exists and listing Lazio is better behaviour than redirecting past it. This
supersedes the spec's "one lossy case" note. Cost if wrong: `/destinations/italy`
shows a country page with a single region instead of jumping to Rome.

---

## C4

execution order is 1,2,3,4,5,**7,6**,8,9,10,11,12 — Task 6 depends
on the shim introduced in Task 7 (see C1/C2). Numbering in the plan is
unchanged; only dispatch order swaps. Cost if wrong: none, the two are
independent apart from the shim.

---

## C5

the Global Constraint "mix format clean before every commit" cannot
hold branch-wide — six files inherited from origin/main are unformatted
(lib/mix/tasks/ethos.optimize_rome_photos.ex, lib/ethos/places/address.ex,
test/ethos/places/address_test.exs, test/ethos/seeds/rome_seed_data_test.exs,
test/ethos/seeds/london_seed_data_test.exs,
test/ethos/seeds/san_francisco_seed_data_test.exs). Decided: the constraint
binds the files a task TOUCHES, verified with `mix format --check-formatted
<touched files>`. Reformatting inherited files would produce a large unrelated
diff that collides with the four live worktrees. Cost if wrong: those six files
stay unformatted until whoever owns them reformats.

---

## C6

task reviewers cannot re-run the suite (100s each), so suite counts
are report-sourced. Decided: accept the implementer's count when the reviewer
confirms the diff matches the report's file list, and independently verify the
full suite at two checkpoints — after Task 5 (the irreversible 393-file
rewrite) and at the final whole-branch review. Running the suite in the
controller while an implementer is live would collide on the shared
ethos_test_wwgeo database, so these verifications happen between tasks.
Cost if wrong: a false green goes unnoticed for at most a few tasks.

---

## C7

the Task 3 review found a FOURTH glob over
priv/seed_data/destinations/*.json —
lib/mix/tasks/ethos.optimize_destination_photos.ex:11 — which the implementer
missed and which crashes today (tree.json decodes to a list, so ["photos"]
raises). The plan text mandates the roster live at
priv/seed_data/destinations/tree.json, and the spec names that path too.
Decided: OVERRIDE both. Move the roster to priv/seed_data/destination_tree.json
(sibling to the directory, not inside it) and revert all three exclusions.
Four independent globs already assume uniform shape in that directory; a fifth
added later would break the same way, and nothing forces its author to learn
the exclusion convention. Making the shape boundary structural rather than
name-based is the smaller long-term cost. Cost if wrong: one path constant and
two doc references to update; no behavioural risk.

---

## C8

the plan's Task 5 code used plain Jason.decode!/encode!. Elixir maps
are unordered, so re-encoding reshuffles every key — measured on
priv/seed_data/rome/ardeatino.json as 692 of 700 lines changed. Across 393
files that makes the review gate on the IRREVERSIBLE task worthless and the
"no prose was touched" guarantee unverifiable. Decided: decode with
`objects: :ordered_objects` (Jason 1.4.5 is in mix.lock and supports it), and
swap the geo keys IN PLACE — insert destination_path at the index the first
dropped key occupied rather than appending, which would add a trailing comma
to the preceding key and churn 84 extra lines per file. Verified empirically
before dispatch: ordered round-trip is byte-identical, and the real rewrite
touches 42 added / 125 removed lines and ZERO non-geo lines. Added a mechanical
grep gate to Task 5 step 6 that must print nothing. Cost if wrong: caught
immediately by that gate.

---

## C9

the Global Constraint "the suite must be green after every task"
cannot hold between Task 5 and Task 7. The corpora lost their legacy geo triple
in Task 5, but the loader that still demands it
(DataGuide.validate_shape!/@required_guide_keys) is only updated in Task 7.
Making them one commit would fuse a 396-file data rewrite with a loader change
into a single unreviewable diff — exactly what the separate review gate on the
irreversible task exists to prevent. Decided: accept a RED suite for the Task 5
-> Task 7 window only. Task 7 must restore 766/0/4, and no task after 7 may
commit while red. Cost if wrong: a genuine regression could hide among the 34
expected failures — mitigated by having the Task 5 reviewer check a sample of
the 34 for real content loss.

---

## C10

the Task 5 implementer found that
lib/ethos_web/controllers/place_controller.ex:113 builds JSON-LD PostalAddress
from place.town/place.state (the legacy DB columns). Task 7's shim keeps
writing them so output is correct for now, but when Task 12 drops the columns,
addressCountry silently regresses to "US" for Rome and London and
addressLocality disappears corpus-wide — a schema.org correctness bug that no
current test would catch. Decided: fold the fix into Task 10, which already
owns JSON-LD, deriving addressLocality from the node and addressCountry from
the country ancestor. Cost if wrong: structured data on 5350 place pages is
wrong about which country they are in.

---

## C11

(CONTROLLER-FOUND DEFECT, not raised by any reviewer): Task 5
annexed the Vatican into Italy. The Rome corpus deliberately carried 29 places
and 1 guide as sovereign — state: "Vatican City", town: "Vatican City" — and
lib/ethos_web/components/structured_data.ex:148-153 carries an explicit comment
saying a place inside it is NOT in Italy and that emitting IT for St Peter's
would be the same class of error as the hardcoded "US" it replaced
(@country_by_region maps "Vatican City" => "VA"). Task 5's rule
`path_for("rome", _state, _county, town)` ignores state entirely, so all 30
landed at italy/lazio/rome/vatican-city.

---

## C12

Task 7's shim derives `state` from the node's REGION, so a Roman place's state is now
"Lazio" rather than "Italy". StructuredData's @country_by_region has no "Lazio" key, so
addressCountry falls through to "US" — ruling C10's bug, arriving EARLIER than predicted: at the next
production re-seed rather than at Task 12's column drop. No test catches it (every corpus gate reads
JSON, not the DB) and it cannot be tested without touching postal_address/3, which Task 10 owns.
Decided: NO production re-seed until Task 10 has landed. Recording it in the plan's Deployment section
as a hard ordering constraint, and extending C10's required assertions to cover Vatican City => VA
alongside Rome => IT and London => GB. Cost if wrong: schema.org tells search engines the Pantheon,
the Sistine Chapel and 1,250 Roman places are in the United States.

---

## C13

deriving county from the node name moves two interim hub URLs —
/destinations/new-york/bronx becomes the-bronx (node name "The Bronx"), and /destinations/england/london
splits into one hub per borough. Both are TRANSITIONAL only: Task 8 serves hubs from node paths and
Task 12 drops the columns, so neither URL survives to production. Decided: accept, and confirmed the
roster's legacy_paths already cover "new-york/bronx" and "england/london" so Task 9's redirects catch
them. Connecticut, Manhattan, Brooklyn, Queens and SF verified byte-identical to the pre-Task-5 corpus.
Cost if wrong: caught by Task 9's redirect tests.

---

## C14

two Important findings are FORWARD-DEPENDENCIES, not Task 7 defects, so Task 7 opens no fix round.
  (a) structured_data_test's region_for/1 feeds "Italy" while production feeds "Lazio", so the suite conceals
      the C12 regression. Task 7's brief FORBIDS touching postal_address/3 (Task 10 owns it), so Task 7 cannot
      close this. Carried into Task 10's brief with a hard requirement: drive those tests from a place row read
      back from the DATABASE, never from a literal or the seed JSON.
  (b) GuideRunner.destination_node/1's third nil clause is a silent catch-all that, paired with
      Map.get(data, :state), turns a misspelled `destination_pth:` into a nil state instead of a raise. The
      clause is REQUIRED until Task 6 gives the 37 code-seed guides a real destination_path. Carried into
      Task 6's brief as an explicit deletion step.
  Rationale for not looping: neither is fixable within Task 7's own scope; both are now written into the plan
  (commit for Tasks 6 and 10), so they are gated by a brief rather than by memory. Cost if wrong: (a) a wrong
  country ships to search engines if Task 10 also misses it; (b) a typo in Task 6 lands silently.

---

## C15

the reviewer dissented on C13, calling the hub-slug move (/destinations/new-york/bronx ->
the-bronx; england/london splitting per borough) "a real decision the user should make, not a silent carry."
Re-examined and C13 STANDS: those slugs are only reachable between Tasks 7 and 8, Task 8 serves hubs from
node paths, Task 12 drops the columns, and the roster already carries "new-york/bronx" and "england/london"
as legacy_paths so Task 9 301s both. No interim deploy is planned. The public URL set is governed by the
roster's explicit legacy_paths, not by the derived county name. Dissent recorded rather than buried.

---

## C16

Task 6 dropped the county tier for the 31 ballpark corpora (my plan told it to — "the county in
the existing triple is dropped, not modelled"). The consequence the implementer flagged, and correctly called
unowned work: THIRTY /destinations/{state}/{county} hub URLs lose their mapping. /destinations/illinois/cook-county
listed the Wrigley Field guide and would now 404, because that guide's county derives from its city node and
reads "Chicago". Letting them 404 would contradict the option the user explicitly chose for this project —
full hierarchy WITH 301s from every indexed URL. Decided: assign to Task 9 as Step 2b — add each old county-hub
path to the CITY node's legacy_paths so it 301s to the page that now lists that guide, derived mechanically from
git history rather than by hand. Two honesty constraints written into the step: it is a redirect, not an
equivalence (the county name is not added to the node and is never rendered), and cities that legitimately have
a county node already (CT towns, NYC boroughs) are left alone. Cost if wrong: a county URL points at a city page
that is inside that county — a redirect users would call correct even if a cartographer would not.

---

## C17

the implementer found a SECOND instance of the class — the "italy" affiliate locale. Task 7's shim
made the 30 Rome neighbourhood guides derive state "Lazio", so they match no locale and render no widget. The
implementer declined to fix it, calling it a campaign decision (switching a unit ON across 30 live pages) and
escalated. Checked config/config.exs at 0a3fb9a: the "italy" locale is keyed on state_slug with NO :counties
guard, and its own comment reads "No :counties key, so every Italian page resolves." Before Task 7 those guides
carried state "Italy" -> state_slug "italy" -> the widget rendered. So the unit was ALREADY ON for exactly those
30 pages and this refactor switched it OFF. Decided: this is a regression we introduced, not a campaign
expansion, and restoring it is my call — register the locale under "lazio" as well as "italy" (RomeGuide is
hand-rolled and still writes state: "Italy", so both keys stay live until it moves onto the tree), and extend
the new positive test to a Rome guide. Cost if wrong: an affiliate unit renders on 30 pages where it rendered
before this project started.

---

## C18

the whole affiliate mechanism reads state_slug/county_slug, which TASK 12 DROPS. Left alone it would
blank every widget site-wide, silently, exactly like C17 but everywhere. Decided: write the constraint into
Task 12's brief — move locale matching onto the tree there, and NOT by resolving the node per row
(locale_for/2 runs over whole lists inside a layout component, so that costs a DB read per row per request);
preload destination_node or denormalise a country_slug. The Task 6 positive tests must keep passing, since they
are the only reason this class is visible. Cost if wrong: caught by those tests, which is the point of them.

---

## C19

(extends C18): both new affiliate gates read Destinations.legacy_geo_from_trail/1, which Task 12
removes — they will not COMPILE after the shim goes. Deleting a gate because it stopped compiling is exactly
how this class arrived twice. Decided: Task 12's brief now requires porting both gates in the SAME change and
watching each fail against its reintroduced bug before the task is done. Cost if wrong: the affiliate class
goes invisible again and the next occurrence ships silently.

---

## C20

Task 8 deliberately WEAKENED three hub rows in json_ld_parity_test from full breadcrumb trails to
the 2-crumb stub, because node_breadcrumb/2 is stubbed until Task 10. Reviewer confirmed this was the minimum
possible loss — the stub returns exactly root_crumbs(), so no stronger assertion is expressible — and that all
three depths still run through the parity machinery. This is the ONLY assertion-strength reduction in the whole
project. Decided: it is a debt with a due date, not an acceptance. Task 10's brief now has Step 3b requiring all
three restored to assert the COMPLETE trail, verified by reverting node_breadcrumb/2 to the stub and watching
all three go red. Cost if wrong: breadcrumb JSON-LD ships untested on hub pages.

---

## C21

Task 8 moved hub URLs onto tree paths, but sitemap_controller.ex, guide_breadcrumb.ex,
place_controller.ex and place_html/show.html.heex still EMIT the pre-tree URLs from legacy columns — reviewer
confirmed the exact lines. Those URLs 404 as of Task 8, so every guide and place page currently has broken
breadcrumb links and the sitemap would publish 404s to Google. Decided: the deploy gate is now Tasks 9 AND 10,
in that order — 9 lands the redirects that catch the old URLs, 10 re-points the emitters. Written into the
plan's Deployment section, not just here. Cost if wrong: a deploy in this window publishes a sitemap of 404s,
strictly worse than before this project started, since the old URLs at least resolved.

---

## C22

the implementer reported the ~423 orphaned /destinations/:slug town hubs as "not mechanically
fixable, since town slugs collide across regions (Washington, Arlington, Berlin)" and proposed a follow-up.
I measured it before accepting: 392 distinct slugs in the JSON corpus, 391 unambiguous, ONE genuine collision
(madison — CT New Haven County vs Brooklyn). Washington was already a legacy path; Arlington and Berlin do not
collide at all. The named examples were plausible but unchecked. Decided: map them, since abandoning 400+
indexed URLs would break the exact promise the user chose this option for. 422 mappings added across BOTH
corpus halves, with four exclusions each for a distinct reason: vatican-city (a real node path — must render),
washington + connecticut (already legacy paths), madison (collision — deliberately left 404 with a test pinning
it, because sending Brooklyn traffic to Connecticut returns 200 and looks like it worked). Cost if wrong:
caught by the roster-uniqueness gate, which makes duplicates and node-path shadows unrepresentable.

---

## C23

the reviewer's open ⚠️ — the town-hub derivation was a scratch script, not a gate, so a guide added
LATER publishes no legacy path and its pre-refactor URL 404s. Judged not worth a fix round: guides created after
this refactor never had a /destinations/:slug URL to preserve, so the gap only bites when merging a corpus
written against the old scheme — which is exactly the four concurrent worktrees. Decided: document the
re-derivation procedure in the plan's "Notes for the executor", beside the existing instruction to re-run
mix ethos.migrate_geo over late-arriving corpora, since that is the moment someone will need it. Cost if wrong:
a merged corpus's old town-hub URLs 404 until someone re-runs the derivation.

---

## C24

(CRITICAL, blocks deploy): all 13 curated hub-content files in priv/seed_data/destinations/ are
keyed on paths that are now LEGACY paths (connecticut, rome, new-york/manhattan, ...). Release.seed_destinations/0
upserts them as real Destination rows with kind: nil and parent_id: nil, because DataDestination requires only
path/name/intro and validate_inclusion skips an absent change. Four verified consequences: (1) exact-path
resolution renders the bare row so 13 REDIRECTS ARE SILENTLY DISABLED; (2) all 13 enter the sitemap —
a data defect the Task 10 sitemap test cannot see because it seeds only the tree; (3) parent_id: nil puts them
in roots/0, so /destinations lists Connecticut, New York and Rome AS COUNTRIES beside United States and Italy;
(4) ~1KB of curated prose per hub is orphaned while the real nodes carry roster stubs.
The reviewer established it is THREE COUPLED CHANGES, not one — re-keying alone fails, because
GuideBreadcrumb.curated_destination_crumb/1 only matches thanks to those bare rows (and
guide_breadcrumb_corpus_test.exs:80 asserts bare_paths != []), and because DestinationTree.upsert_all!/0
rewrites intro on every node, so a tree re-seed clobbers the curated prose back to the stub.
Decided: new TASK 13 in the plan carrying all three plus the country-code gate, to run after Task 11 and
before Task 12. Same shape as every serious defect in this run — the Task 9 roster-uniqueness gate would have
caught it, but it reads the ROSTER FILE, not the database. Cost if wrong: 13 dead redirects, three fake
countries on the index, and the site's best hub prose unreachable.

---

## C25

the implementer reported its mid-task lock failures as "pre-existing flakiness". I measured it
instead: 3 full-suite runs with nothing else touching the DB gave 1 failure (query_canceled in
PlaceControllerTest) — a 1-in-3 rate, which makes "0 failures" worthless as a gate, and this project's entire
verification story rests on that gate. FIFTH sighting of the class (burys deadlock, json_ld_parity lock order,
Task 11 pool timeout dismissed as environmental, two mid-task failures here, mine). Root cause found by
grepping: SIX async: true files each seeded the full 724-node roster, so concurrent transactions wrote the same
rows. Every SYNC full-roster seeder was already async: false — those were the reactive per-victim fixes from
earlier tasks. Decided: fix the WRITERS not the victim (place_controller_test was a bystander), keep tests
parallel where they only need a handful of nodes, comment every async: false so nobody flips it back for speed,
and require FIVE consecutive runs because three clean runs is exactly what the previous two attempts reported
before failing on the fourth. Cost if wrong: a slightly slower suite.
Task 13: fix round 1/5 (flakiness; commit f6077f8) — 3 made async: false with why-comments (destination_tree_test,
         destination_redirect_test, and the sitemap roster assertion SPLIT into its own module so the file's other
         3 tests stay parallel), 3 converted to partial seeding and still async.
Task 13: VERIFIED INDEPENDENTLY — 8 consecutive clean full runs (implementer 5, controller 3), all 821/0/4.
Task 13: review verdict spec OK / quality APPROVED, 3 Minors, no Critical/Important.
Task 13: reviewer REPRODUCED 3 of 4 intro-precedence failures against pre-fix code, incl.
         "re-seeding the tree replaced the curated intro with 'Connecticut, county by county.'"
Task 13: reviewer judged the rewritten guide_breadcrumb_corpus_test invariant STRICTLY STRONGER — the old
         assertion guarded only a collision case and its non-vacuity guard held only because the buggy bare rows
         existed; the new one asserts every guide's trail is real ancestry, that a county-filed guide carries its
         county, and converts the deleted guard into the regression pin for the Critical defect.
Task 13: CORRECTION to the implementer's report — it said "several async files" call seed_code_destinations!/0;
         it is exactly one. But the reviewer found the real residual is BROADER: ~11 async files write
         overlapping shared ancestor rows via seed_destination_paths!/1.
Task 13: fix round 2/5 (2 structural guards; commit d582070) — DataDestination.upsert!/1 now RAISES on a path
         no node owns (the exact mechanism of the Critical defect, previously CI-only), and a new test asserts
         roots/0 == the five countries under the PRODUCTION combination (roster + 13 overlays), which is the one
         combination where the bug actually appeared and which nothing automated exercised. Demonstrated both
         ways: with the guard, re-keying connecticut.json fails in setup; with it disabled, the assertions fail
         naming "connecticut" as an extra root. 827 tests, 0 failures, two runs.
Task 13: minor (deferred): extend seed_destination_paths!/1 to write legacy_paths so destination_redirect_test
         could go back to async
Task 13: minor (deferred): ~11 async files still write overlapping shared ancestor rows — same class, 50 rows
         not 724, 8/8 clean since. WATCH IF IT RECURS.
Task 13: minor (deferred): destination_controller_test asserts a substring rather than a node_path/1 href
Task 13: minor (deferred, pre-existing on main): destination_seed_data_test.exs:502 fails when run alone
Task 13: complete (commits 506d0c5..d582070, review clean after 2 fix rounds; 827 tests, 0 failures)

---

## C26

the reviewer found — and proved with a throwaway ConnCase — that the campaign's own headline hub
rendered no affiliate unit: GET /destinations/united-states/new-york/new-york-city returned 200 with no
data-gyg-widget. locale_from_assigns/1 inferred a hub's locale from assigns[:guides], but INTERIOR nodes hold
child nodes rather than guides, so the list was empty and no unit rendered. Every hub test in the suite files a
guide directly on the node under test, so the suite only ever exercised LEAF hubs — the shape that ships was
never tested. Same lesson as the Bronx widget, one last time: green because the tests tested a shape production
does not have. Decided: resolve a hub from its OWN node path (clause ordered above the :guides clause, since
Elixir matches top-down and below it would be dead for any assigns carrying guides), AND add a gate that walks
interior nodes from the committed roster inside locales from the committed registry, with a non-vacuity floor
of >=6 interior hubs across >=2 campaigns so no fixture can satisfy it. Cost if wrong: caught by the gate.
Task 12: the gate found SEVEN hubs rendering no unit, not the one the reviewer had verified — every NYC borough
         hub plus italy/lazio and italy/lazio/rome.
Task 12: fix round 1/5 (3 addressed — F1 interior hubs, F2 dangling search separator, F3 dead Guides functions;
         commit 63d9d0a). 830 tests, 0 failures, twice.
Task 12: the implementer SUPERSEDED ITS OWN earlier decision, deleting Guides.list_destinations/0 and
         list_published_guides_for_destination/1 with the seo_fields_test case that was their only caller —
         correctly distinguishing a test that GUARDS shipping code from one that PROPS UP dead code.
Task 12: re-review reproduced the interior-hub gate failure naming all 7 hubs verbatim, confirmed the new clause
         is ordered ABOVE :guides, re-verified the gates bite by reinjecting italy/lazio -> italy/latium, and
         confirmed no dangling references after the deletions. No new breakage.
Task 12: minor (deferred): ethos.bare_places emits the path slug where place.town held a display name
Task 12: minor (deferred): the single-seed_destination_paths!-call lock-order invariant is comment-enforced only
Task 12: minor (deferred, NOT a regression): 30 vatican-city corpus rows resolve to no locale — those places
         carried state "Vatican City" before this project, which never matched the "italy" key either
Task 12: minor (deferred): Place.changeset/2 still does not require destination_id; 51 test call sites create
         nodeless places. Reviewer assessed the risk as LOW post-drop — a nodeless place degrades to no unit,
         no crumbs, no PostalAddress, with no crash path, and the US-default fabrication is gone.
Task 12: complete (commits d582070..63d9d0a, review clean after 1 fix round; 830 tests, 0 failures)

---

## C27

N1 — the search fix's design claim is FALSE. EXPLAIN ANALYZE on 20k rows shows Hash Left Join ->
two Seq Scans with the OR applied as a post-join filter; NEITHER index is used, and destinations_fts_idx is
dead weight. Each branch alone does use its index, so it is the cross-table OR that defeats both; a UNION of
two indexed sub-selects would not. Results are CORRECT. Decided: PARK, do not open a second fix wave — the
skill allows one fix wave after the final review and this is not load-bearing (correct results; the corpus is
5,350 places and 724 nodes, where a seq scan is cheap). But the comments in search.ex and the migration assert
index usage that does not happen, and a knowingly-false comment is worse than none — surfacing both to the
user as the first follow-up. Cost if wrong: every place search scans two small tables until someone rewrites
the OR as a UNION.

---

## C28

N3-b — the caveat that `mix ecto.migrate` will NOT re-run 20260905140000 on a database that
already applied it (so a dev/staging box migrated from this branch before today silently keeps its shadow
rows, reproducing C2 locally) exists ONLY in the fix report. Nothing in docs/ or the migration says it.
Decided: PARK as a two-line runbook follow-up rather than a second fix wave, and surface it to the user
prominently — this is the one residual that can bite someone tomorrow. Cost if wrong: a staging box shows
three fake countries and 13 dead redirects, and whoever hits it has no documentation to explain why.

---

