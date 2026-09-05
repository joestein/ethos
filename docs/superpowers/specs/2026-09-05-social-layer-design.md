# Ethos Social Layer

Date: 2026-09-05
Branch: `worktree-social-layer`
Status: approved design, ready for implementation planning

## Goal

Turn Ethos from a publication into a place people gather. Today a reader can
check off "I've been here" and nothing else; there is no way to express an
opinion, no way to read anyone else's, and no reason to come back. This
release adds reactions, reviews, public identity, and the moderation
apparatus that makes user-generated text safe to host — plus a visual
identity that changes with the season.

Three things are removed or hidden in the same release: guide authoring for
regular users, and every affiliate surface.

## Decisions

Settled during brainstorming, recorded here so the implementation does not
relitigate them:

| Question | Decision |
|---|---|
| Badges after "I've been here" is removed | Any reaction counts as a visit |
| What is social | Places, guides, and collections |
| When comments go public | Trusted-author fast lane |
| Rating scale | Integer 1–10, no halves |
| Comment on a rating | Required |
| Guide authoring | Admin-only, hidden from everyone else |
| Suggestion queue | Kept, merged into the moderation console |
| Ban | Full block — cannot log in |
| Username backfill | Seed from email, force-choose on next login |
| Theme switching | CSS variables, auto by date, admin override |
| Heading font | Fraunces, self-hosted |

## Architecture

Place, guide, and collection pages stay dead controllers. All the SEO
investment — JSON-LD, canonical URLs, OG cards, meta descriptions — lives in
those controllers and is untouched.

The social block is a **LiveView island** embedded in each show template:

```heex
{live_render(@conn, EthosWeb.SocialLive,
  id: "social",
  session: %{"subject_type" => "place", "subject_id" => @place.id})}
```

One LiveView serves all three subject types. It server-renders on first paint,
so crawlers index the reviews. Reactions and reviews update over the socket
with no page reload.

The island renders as a single "Community" block below the page's main
content and above the connected-pages footer — thumbs and their counts first,
then the review form, then the comment list. One island rather than two
(thumbs in the page header, reviews below) because two islands mean two
sockets, two mounts, and two copies of the same aggregate query per page
view.

The alternative — converting the three show pages to full LiveViews — was
rejected: it rewrites controllers that the `destination-pages` worktree is
actively editing, for no user-visible gain.

### New contexts

- **`Ethos.Social`** — reactions, reviews, aggregates, and the queries that
  used to live in `Ethos.Visits`. The only module that knows the polymorphic
  subject shape.
- **`Ethos.Moderation`** — approve, revoke, trust, ban. Kept separate from
  `Ethos.Social` because moderation acts *on* content rather than being part
  of how content works, and because the admin console is the only caller.
- **`Ethos.Seasons`** — date → season, and the admin override.

`Ethos.Visits` and `Ethos.Visits.PlaceVisit` are deleted.

## Data model

### `reactions`

| Column | Type | Notes |
|---|---|---|
| `user_id` | references(:users), null: false | `on_delete: :delete_all` |
| `subject_type` | string, null: false | `"place"` \| `"guide"` \| `"collection"` |
| `subject_id` | integer, null: false | |
| `value` | string, null: false | `"up"` \| `"down"` |

- `unique_index(:reactions, [:user_id, :subject_type, :subject_id])` — one
  reaction per person per thing.
- `index(:reactions, [:subject_type, :subject_id, :value])` — serves the
  count aggregate.

No foreign key to the subject: it is polymorphic. Rows for a deleted subject
are inert (nothing queries them) and cleaned up by a periodic task if it ever
matters. This is the accepted cost of one table over three.

`Social.react/3` semantics: no existing row inserts; a row with the opposite
value updates; a row with the same value deletes. One round trip, expressed
as an upsert plus a conditional delete.

### `reviews`

| Column | Type | Notes |
|---|---|---|
| `user_id` | references(:users), null: false | |
| `subject_type` | string, null: false | as above |
| `subject_id` | integer, null: false | |
| `rating` | integer, null: false | 1–10 inclusive, DB check constraint |
| `body` | text, null: false | 2–2000 chars, validated in the changeset |
| `status` | string, null: false, default `"pending"` | `pending` \| `approved` \| `revoked` |
| `moderated_at` | utc_datetime | |
| `moderated_by_id` | references(:users) | |

- `unique_index(:reviews, [:user_id, :subject_type, :subject_id])`
- `index(:reviews, [:subject_type, :subject_id, :status])`

Because a comment is required, **every review carries text and every review is
moderated**. Thumbs are the frictionless instant path; reviews are the
considered, reviewed one. That split is the whole product story and it falls
out of the schema.

Editing an approved review returns it to `pending` unless the author is
trusted. This closes the obvious bypass: post something innocuous, get
approved, then edit it into something else.

### `users` additions

| Column | Type | Notes |
|---|---|---|
| `username` | citext, null: false | unique |
| `username_provisional` | boolean, null: false, default `false` | |
| `trusted_at` | utc_datetime | non-nil means comments post instantly |
| `banned_at` | utc_datetime | non-nil means blocked |
| `ban_reason` | text | admin-facing only, never rendered publicly |

The `citext` extension is already enabled by the initial auth migration, so
`Bob` and `bob` collide as they should.

Username rules: 3–20 characters, `^[a-z0-9_]+$`, downcased on cast, and a
reserved-word blocklist (`admin`, `ethos`, `root`, `support`, `help`, `about`,
`api`, `moderator`, `staff`, `system`, `anonymous`, `deleted`).

### `site_settings`

A two-column `key`/`value` string table with a unique index on `key`. Holds
the season override — and nothing else for now. A table rather than
`Application.put_env/3` because the override must survive a deploy; the
admin should not have to re-pick autumn every time the app restarts.

## Identity

Registration takes **username and email as separate fields**. The username is
the public byline; the email is never rendered outside the account's own
settings page.

The root layout currently prints `@current_user.email` in the header. That
becomes `@current_user.username`.

**This is enforced by a test, not by vigilance.** A regression test creates a
user with a distinctive email, has them post an approved review, requests the
place page, and asserts the email string does not appear anywhere in the
response body. The same assertion runs against the guide and collection
pages. A future template that reaches for `.email` fails the suite.

### Backfill

A data migration:

1. Derives a provisional username for every existing user from the email
   local-part: downcase, strip characters outside `[a-z0-9_]`, truncate to 20,
   pad to 3 if too short, and append `2`, `3`, … on collision.
2. Sets `username_provisional = true` on those rows.
3. Looks up the user whose email matches `Application.get_env(:ethos,
   :admin_email)` (configured as `cryptcom@gmail.com`) and sets their username
   to `buoewe` with `username_provisional = false`.

Step 3 is a no-op when that user does not exist, which is the case in test and
in any fresh database. The migration must not fail there.

### Choosing a real username

`EthosWeb.UsernameLive` at `/users/username`. Any user with
`username_provisional == true` who attempts a social action is sent there
first. Rather than a global plug — which would trap people mid-read — the
gate lives in two places:

- `SocialLive` renders "Pick a username to join in →" instead of the
  reaction buttons and review form.
- The LiveView event handlers reject the action defensively, so a crafted
  socket message cannot bypass the UI.

## Reactions

Thumbs up and thumbs down, side by side, with the counts rendered directly
below them:

```
   👍            👎
   34            3
```

No moderation. Instant. A logged-out visitor sees the counts and gets a login
prompt on click. A banned user's reactions are excluded from every count.

### Badges

`Ethos.Badges` currently counts rows in `place_visits`. Every rule predicate
re-points to "distinct places this user has reacted to" — thumbs up **or**
down, since either proves they were there. The four query functions move from
`Ethos.Visits` into `Ethos.Social` with the same shapes:

- `reacted_place_count/1`
- `reacted_place_count_by_town/2`
- `reacted_place_count_by_kinds/2`
- `reacted_place_count_in_county/3`

Badge definitions, thresholds, town overrides, and the `/badges` page are
unchanged. Awarding moves from the visit controller action to
`Social.react/3`, and keeps its `rescue` clause — a badge failure must never
break a reaction.

**Continuity is the requirement.** One migration converts every `place_visits`
row into an `up` reaction on that place, and only then drops the table. A test
asserts that a user who had earned Brass City Explorer still has it
afterwards.

`POST /p/:slug/visit`, `PlaceController.visit/2`, `Ethos.Visits`,
`Ethos.Visits.PlaceVisit`, `test/ethos/visits_test.exs`, and
`test/ethos_web/controllers/place_visit_test.exs` are all removed.

## Reviews

A 10-star picker plus a required comment box. One review per person per
subject, editable.

Ten stars in a row is too wide for a card, so input and display differ:

- **Input**: ten star glyphs, click to set.
- **Display**: `8.3 / 10` with a proportional bar, plus the count of
  ratings. Lists and cards show only the score.

The aggregate is `AVG(rating)` over approved reviews by non-banned authors,
rounded to one decimal.

Counts and averages are **computed on read**, not denormalized. At this
scale the `GROUP BY` is sub-millisecond with the indexes above, and
denormalized counters are the classic source of drift. Adding a counter cache
later is a contained change behind the `Ethos.Social` API.

## Moderation console

`/admin` becomes a console with a shared tab bar:

**Comments** (`/admin/comments`) — the pending queue with approve and revoke
actions, and a separate published stream that can be revoked retroactively.
Each row shows the author's username, their trust state, the subject with a
link, the rating, and the body. Approving a review also sets the author's
`trusted_at` if it is nil — that is what earns the fast lane.

**Users** (`/admin/users`) — search by username or email, with trust/untrust
and ban/unban. Banning requires a reason. The list surfaces each user's
review count and how many of their reviews have been revoked, so the
"one bad comment" case is distinguishable from a pattern.

**Suggestions** (`/admin/suggestions`) — the existing place-suggestion queue,
brought under the same tab bar and restyled. Its controller and
`Ethos.Contributions` logic are untouched; only the template changes. Merging
the surface is the goal, not rewriting working code.

Comments and Users are LiveViews — they need search and per-row actions
without full reloads. Suggestions stays a controller.

### Ban semantics

A full block. `Ethos.Moderation.ban/3`:

1. Sets `banned_at` and `ban_reason`.
2. Deletes every row in `users_tokens` for that user, which revokes all
   sessions immediately.

Login is refused in `UserSessionController.create/3` with "This account has
been suspended." — not the generic invalid-credentials message, because a
banned user retrying their correct password forever generates support mail.
This is deliberately *not* subject to the user-enumeration concern that
governs the invalid-password path: the message is only reachable by someone
who already supplied correct credentials.

`fetch_current_user` also treats a banned user as logged out, as a
belt-and-braces guard against a session that survives the token delete by a
race.

All of a banned user's reviews are hidden site-wide and their reactions stop
counting. `Ethos.Social`'s read queries join `users` and filter
`is_nil(u.banned_at)`. Unbanning restores everything.

## Removals

### Guide authoring

Every authoring route moves behind `require_admin_user`:

```
/guides, /guides/new, /guides/:id/import, /guides/:id/confirm,
/guides/:id/edit, /guides/:id/share, /guides/:id/suggestions,
POST /g/:slug/entries/:entry_id/research
```

`require_admin_user` already renders 404 rather than 403, so the surface is
not advertised. In `Layouts.site_header/1`, "Your guides" and the "Make a
guide" CTA render only for admins; the home page's "Make your guide" hero
button is replaced with "Browse destinations".

No code is deleted. The Claude and Exa integrations, the parse/enrich/gap-fill
agents, and the import pipeline all stay working for admin authoring. The
change is reversible by editing the router scope.

`/g/:slug/suggest` stays open to all logged-in users — suggesting a place is
contribution, not authoring, and it feeds the moderation console.

### Affiliate surfaces

The base branch carries more affiliate machinery than expected. Four surfaces
must go dark:

1. `EthosWeb.Affiliate.affiliate_head/1` — the GetYourGuide script tag in
   `root.html.heex`.
2. `EthosWeb.Affiliate.affiliate_unit/1` — the widget in `app.html.heex`.
3. The amber "Planning your own trip?" fallback aside on the guide show page.
4. Per-entry `entry.booking_url` sponsored links on the guide show page.

**There is a trap here.** Surface 3 renders precisely when
`Affiliate.unit_renders?/1` returns `false`. Forcing `renders?/1` to `false`
as a kill switch would therefore turn the amber CTA *on* across every page —
strictly more affiliate content than today. The moduledoc documents this
inversion; the implementation must respect it.

The correct shape is a new predicate that all four surfaces consult
independently:

```elixir
def enabled?, do: Application.get_env(:ethos, :affiliate_links_enabled, false)
```

Defaulting to `false` means the flag is off in every environment without a
config edit, and off in test — which keeps affiliate assertions from
interfering with the new social tests. The existing affiliate test suite is
updated to set the flag explicitly for the cases that assert rendering, so
the machinery stays covered and can be switched back on later with
confidence.

`entry.booking_url` stays in the schema and in the admin guide editor. Hiding
the public link is a display decision; discarding the stored data is not, and
was not asked for.

**Out of scope, flagged for a decision:** `root.html.heex` also loads Google
AdSense (`adsbygoogle.js`). That is display advertising rather than an
affiliate link, so this release leaves it alone. Removing it is a one-line
change if wanted.

## Seasonal design system

### Tokens

`assets/css/app.css` defines semantic tokens as space-separated RGB triples,
one `:root[data-season="…"]` block per season:

`--c-surface`, `--c-surface-raised`, `--c-ink`, `--c-ink-muted`, `--c-line`,
`--c-accent`, `--c-accent-ink`, `--c-accent-soft`, `--c-positive`,
`--c-negative`, `--c-star`.

`tailwind.config.js` maps them to real utilities:

```js
colors: {
  surface: "rgb(var(--c-surface) / <alpha-value>)",
  ink:     "rgb(var(--c-ink) / <alpha-value>)",
  accent:  "rgb(var(--c-accent) / <alpha-value>)",
  // …
}
```

Templates then use ordinary `bg-surface`, `text-ink`, `border-line`,
`bg-accent` classes and reskin for free. Opacity modifiers such as
`bg-accent/10` keep working — that is what `<alpha-value>` buys.

Palettes:

| Token | Summer | Autumn | Winter | Spring |
|---|---|---|---|---|
| `surface` | `255 253 247` | `255 251 245` | `248 250 252` | `253 253 248` |
| `ink` | `28 25 23` | `28 25 23` | `15 23 42` | `26 46 5` |
| `ink-muted` | `120 113 108` | `120 113 108` | `100 116 139` | `101 118 84` |
| `line` | `231 229 228` | `232 226 218` | `226 232 240` | `228 230 220` |
| `accent` | `13 148 136` | `194 65 12` | `3 105 161` | `77 124 15` |
| `accent-soft` | `204 251 241` | `255 237 213` | `224 242 254` | `236 252 203` |
| `star` | `245 158 11` | `217 119 6` | `56 189 248` | `132 204 22` |

`positive` (`5 150 105`), `negative` (`220 38 38`), and `accent-ink`
(`255 255 255`) are constant across seasons — a thumbs-down should not read as
seasonal decoration.

### Resolution

`Ethos.Seasons.current/1` takes a `Date` and returns an atom:

| Season | Range |
|---|---|
| `:spring` | Mar 20 – May 31 |
| `:summer` | Jun 1 – Sep 21 |
| `:autumn` | Sep 22 – Nov 30 |
| `:winter` | Dec 1 – Mar 19 |

Today, 2026-09-05, resolves to `:summer`; the site turns autumn on Sep 22.

`Ethos.Seasons.active/0` returns the `site_settings` override when one is set
and `current/1` on today's date otherwise. A plug in the `:browser` pipeline
assigns it, and `root.html.heex` stamps `<html data-season={@season}>`.

The admin console gets a season selector: Auto, Spring, Summer, Autumn,
Winter. "Auto" clears the override.

### Beyond color

Color alone will not fix "blank and generic". Also in scope:

- **Type**: Fraunces (variable, self-hosted `woff2` in `priv/static/fonts`,
  `font-display: swap`, latin subset) for headings, system sans for body.
  Self-hosted rather than Google's CDN — no third-party request, no layout
  shift from a late-arriving font.
- **A type scale** rather than ad-hoc `text-3xl` per page.
- **Cards** with `rounded-2xl` and real elevation, replacing the current
  hairline `border` treatment.
- **A seasonal gradient hero** on the home page, built from `accent` and
  `accent-soft`.
- **The site header**, currently `text-zinc-900` throughout, rebuilt on
  tokens.

Page templates migrate from hardcoded `zinc`/`emerald`/`amber` utilities to
tokens. This touches many templates but each change is mechanical.

## Testing

TDD throughout. Beyond unit coverage of each context function:

**Social**
- Reaction toggle: none → up; up → down on opposite click; up → none on same
  click.
- One review per user per subject is enforced by the DB, not just the
  changeset.
- Rating outside 1–10 is rejected by the changeset *and* the check
  constraint.
- An empty body is rejected — a rating cannot be posted bare.
- Aggregates exclude pending, revoked, and banned-author reviews.

**Moderation**
- A new user's first review is `pending` and absent from the public page.
- Approving it publishes it and sets `trusted_at`.
- That user's next review is `approved` on insert and immediately public.
- Editing an approved review by an untrusted user returns it to `pending`;
  by a trusted user it does not.
- Revoking removes it from the public page and from the aggregate.

**Ban**
- Banning deletes the user's tokens.
- A banned user cannot log in and sees the suspension message.
- Their reviews vanish from public pages and their reactions stop counting.
- Unbanning restores both.

**Identity**
- Registration requires both username and email.
- Reserved and malformed usernames are rejected; case-insensitive uniqueness
  holds.
- The backfill produces valid unique usernames, marks them provisional, and
  sets the admin to `buoewe`.
- A provisional user cannot react or review, at the event-handler level and
  not merely in the template.
- **Email never appears in the public HTML of a place, guide, or collection
  page that carries an approved review.**

**Badges**
- A user with pre-existing `place_visits` retains every badge after the
  migration.
- A thumbs-down earns badge progress, same as a thumbs-up.
- A badge-award failure does not break the reaction.

**Removals**
- Every authoring route returns 404 for a logged-in non-admin and 200 for the
  admin.
- With the flag off, no page renders the GetYourGuide script, the widget, the
  amber fallback aside, or an entry booking link. This is asserted against a
  New York guide specifically — the geography that resolves to a live locale
  and would render the widget if the flag leaked.

**Seasons**
- Boundary dates: Mar 19/20, May 31/Jun 1, Sep 21/22, Nov 30/Dec 1.
- The override wins over the date; clearing it restores auto.

## Out of scope

Named so nobody adds them mid-implementation:

- Threaded replies to reviews.
- Notifications of any kind.
- Following users, user profile pages, activity feeds.
- A user-facing "report this comment" button — moderation is admin-initiated
  in v1.
- Rate limiting beyond the one-review-per-subject constraint. Worth revisiting
  once the site has enough traffic to attract spam; the trusted-author gate
  handles the current threat model.
- Removing Google AdSense.

## Rollout

This is a large release. It is one spec because the pieces share a data model
and ship together, but the implementation plan should stage it so each phase
leaves the suite green and the site deployable:

1. **Identity** — username column, registration, backfill migration, the
   `buoewe` assignment, the username interstitial, and the
   email-never-public test. Nothing user-visible changes except the header
   byline.
2. **Reactions and badge migration** — `reactions` table, `Ethos.Social`,
   `place_visits` conversion and drop, `Ethos.Badges` re-pointed. The
   "I've been here" button becomes thumbs.
3. **Reviews** — `reviews` table, the star picker and comment form, aggregate
   display, all three subject types wired up.
4. **Moderation** — `Ethos.Moderation`, the console with its three tabs, the
   trusted fast lane, ban enforcement.
5. **Removals** — authoring routes behind admin, affiliate flag.
6. **Design system** — tokens, Tailwind wiring, Fraunces, template migration,
   season resolution and the admin override.

Phases 1–4 are strictly ordered. Phases 5 and 6 depend only on the others
having landed the templates they touch, and 5 is small enough to slot in
anywhere after 1.

All migrations are additive except the `place_visits` drop, which runs in the
same migration as the reaction backfill and only after it — so a failure
leaves the data intact.

Work happens on `worktree-social-layer`, branched from `origin/main` at
`58c1ad1`, leaving the `destination-pages` and `foliage-tools` worktrees
undisturbed.
