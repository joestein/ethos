defmodule Ethos.Social do
  @moduledoc """
  Reactions, and the counts drawn from them.

  Every query that touches the `reactions` table lives here. Callers pass
  subject structs and get plain data back; nothing outside this module
  needs to know that reactions are stored polymorphically.

  Counts are computed on read rather than denormalised onto the subject.
  At this scale the grouped query is sub-millisecond with the index from
  the reactions migration, and a counter cache is the classic source of
  drift. If it ever matters, adding one is a change behind this API.
  """

  import Ecto.Query, warn: false

  alias Ethos.Accounts.User
  alias Ethos.Places.Place
  alias Ethos.Repo
  alias Ethos.Social.Reaction
  alias Ethos.Social.Review
  alias Ethos.Social.Subject

  @reaction_unique_constraint "reactions_user_id_subject_type_subject_id_index"

  @doc """
  Records `user`'s reaction to `subject`.

  Toggle semantics, which are what a thumbs button has to do:

    * nothing yet → insert, `{:ok, :added}`
    * the opposite value → update, `{:ok, :switched}`
    * the same value again → delete, `{:ok, :cleared}`

  The same-value case is what makes the button un-clickable: a second
  click on thumbs-up takes it back rather than doing nothing.

  A permanently closed place refuses every reaction, mirroring the guard
  the old `Visits.toggle_visit/2` had for the same reason: a closed place
  cannot gain new visitors, so its badge-relevant counts must not move.
  This is deliberately a hard refusal rather than a query-side filter —
  see `Subject.reactable?/1` and the county-complete note on
  `reacted_places_query/1` below for why a reaction that already exists
  is never retroactively excluded.
  """
  def react(%User{}, %Place{status: "closed"}, _value), do: {:error, :closed}

  def react(%User{} = user, subject, value) do
    case do_react(user, subject, value) do
      {:ok, :added} = result ->
        maybe_award_badges(user, subject)
        result

      {:ok, _outcome} = result ->
        result

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # Badges are awarded for reacting to a place at all — see the badge count
  # functions below for why a thumbs-down counts. Never awarded for guides or
  # collections, which have no badge rules.
  #
  # Only called for the `:added` outcome: a switch leaves the set of reacted
  # places unchanged and a clear only shrinks it, so neither can newly satisfy
  # a badge rule. Running the full evaluation on those outcomes anyway would
  # be dozens of wasted queries per click for no possible award.
  #
  # `check_and_award/2` has its own rescue clause, so a badge failure cannot
  # break the reaction. That property is load-bearing: reacting must never
  # fail because badge evaluation did.
  defp maybe_award_badges(user, %Place{} = place), do: Ethos.Badges.check_and_award(user, place)
  defp maybe_award_badges(_user, _subject), do: :ok

  defp do_react(%User{} = user, subject, value) do
    {type, id} = Subject.ref(subject)
    do_react(user, type, id, value, _retry? = true)
  end

  defp do_react(user, type, id, value, retry?) do
    case Repo.get_by(Reaction, user_id: user.id, subject_type: type, subject_id: id) do
      nil ->
        %Reaction{}
        |> Reaction.changeset(%{
          user_id: user.id,
          subject_type: type,
          subject_id: id,
          value: value
        })
        |> Repo.insert()
        |> case do
          {:ok, _reaction} ->
            {:ok, :added}

          {:error, changeset} ->
            if retry? and unique_reaction_collision?(changeset) do
              # Lost a race with a concurrent insert for the same
              # (user, subject) pair: a row now exists where a moment ago
              # there was none. Re-reading and falling back into the
              # existing-row branches below keeps this function's
              # contract intact instead of surfacing a spurious
              # {:error, changeset} for what is, from the caller's point
              # of view, a perfectly normal toggle. Bounded to a single
              # retry: a second collision in a row means something is
              # churning this (user, subject) pair fast enough that
              # resolving it here would just be a live-lock, so we hand
              # back the error instead of looping forever.
              do_react(user, type, id, value, _retry? = false)
            else
              {:error, changeset}
            end
        end

      %Reaction{value: ^value} = existing ->
        # The row read above can be gone by the time this runs — another
        # request may have deleted or switched it in between. Without
        # :stale_error_field, Ecto raises Ecto.StaleEntryError on a
        # zero-row delete; with it, a stale write comes back as an
        # ordinary {:error, changeset} instead of crashing the caller.
        case Repo.delete(existing, stale_error_field: :id) do
          {:ok, _reaction} -> {:ok, :cleared}
          {:error, changeset} -> {:error, changeset}
        end

      existing ->
        existing
        |> Reaction.changeset(%{value: value})
        |> Repo.update(stale_error_field: :id)
        |> case do
          {:ok, _reaction} -> {:ok, :switched}
          {:error, changeset} -> {:error, changeset}
        end
    end
  end

  defp unique_reaction_collision?(changeset) do
    Enum.any?(changeset.errors, fn
      {_field, {_message, opts}} ->
        Keyword.get(opts, :constraint) == :unique and
          Keyword.get(opts, :constraint_name) == @reaction_unique_constraint

      _ ->
        false
    end)
  end

  @doc """
  Public thumbs tally for a subject, as `%{up: n, down: n}`.

  Excludes banned users. The join is what enforces that, so a ban takes
  effect on every page the moment it is applied, with no backfill.
  """
  def counts(subject) do
    {type, id} = Subject.ref(subject)

    tally =
      Repo.all(
        from r in Reaction,
          join: u in User,
          on: u.id == r.user_id,
          where: r.subject_type == ^type and r.subject_id == ^id and is_nil(u.banned_at),
          group_by: r.value,
          select: {r.value, count(r.id)}
      )
      |> Map.new()

    %{up: Map.get(tally, "up", 0), down: Map.get(tally, "down", 0)}
  end

  @doc "This user's own reaction to a subject, or nil. `nil` user is a logged-out visitor."
  def user_reaction(nil, _subject), do: nil

  def user_reaction(%User{} = user, subject) do
    {type, id} = Subject.ref(subject)

    case Repo.get_by(Reaction, user_id: user.id, subject_type: type, subject_id: id) do
      nil -> nil
      reaction -> reaction.value
    end
  end

  ## Badge counts
  #
  # These four replace the identically shaped functions that used to live in
  # `Ethos.Visits`. The rule the spec settled on is that ANY reaction counts
  # as having been there — a thumbs-down is still a visit, and someone who
  # disliked five museums has still seen five museums.

  @doc "How many distinct places this user has reacted to."
  def reacted_place_count(%User{} = user) do
    user |> reacted_places_query() |> Repo.aggregate(:count, :id)
  end

  @doc "How many places in one town this user has reacted to."
  def reacted_place_count_by_town(%User{} = user, town_slug) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.town_slug == ^town_slug)
    |> Repo.aggregate(:count, :id)
  end

  @doc "How many places of the given kinds this user has reacted to."
  def reacted_place_count_by_kinds(%User{} = user, kinds) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.kind in ^kinds)
    |> Repo.aggregate(:count, :id)
  end

  @doc "How many places in one county this user has reacted to."
  def reacted_place_count_in_county(%User{} = user, state_slug, county_slug) do
    user
    |> reacted_places_query()
    |> where([_r, p], p.state_slug == ^state_slug and p.county_slug == ^county_slug)
    |> Repo.aggregate(:count, :id)
  end

  # The join to `places` alone is not enough to restrict these to place
  # reactions: a reaction on a guide whose id happens to match a place id
  # would satisfy `p.id == r.subject_id` too. Pinning subject_type == "place"
  # is what actually excludes it.
  #
  # Deliberately NOT filtering on `p.status == "open"` here. `react/3` already
  # refuses new reactions to a closed place, so this query only ever includes
  # a closed place for a reaction that was made while it was still open —
  # progress the user legitimately earned. Adding an open-only filter here
  # would silently take that progress away the moment a place closes, which
  # is not what the old check-off system did either.
  defp reacted_places_query(%User{} = user) do
    from r in Reaction,
      join: p in Ethos.Places.Place,
      on: p.id == r.subject_id,
      where: r.user_id == ^user.id and r.subject_type == "place"
  end

  ## Reviews
  #
  # A review is a rating out of ten plus the comment that justifies it. The
  # body is required, so every review carries text and every review is
  # moderated — which is exactly why reactions are instant and these are not.

  @doc """
  Records a pending review. Never publishes: an admin has to approve it.
  """
  def create_review(%User{} = user, subject, attrs) do
    {type, id} = Subject.ref(subject)

    %Review{}
    |> Review.changeset(
      Map.merge(normalize_review_attrs(attrs), %{
        user_id: user.id,
        subject_type: type,
        subject_id: id,
        status: "pending"
      })
    )
    |> Repo.insert()
  end

  @doc """
  Edits a review, returning it to `pending`.

  The reset is the point: without it, posting something innocuous, waiting
  for approval, then editing it into something else would publish
  unmoderated text.
  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(Map.put(normalize_review_attrs(attrs), :status, "pending"))
    |> Repo.update()
  end

  @doc "This user's own review of a subject, at any status, or nil."
  def user_review(nil, _subject), do: nil

  def user_review(%User{} = user, subject) do
    {type, id} = Subject.ref(subject)

    Repo.get_by(Review, user_id: user.id, subject_type: type, subject_id: id)
  end

  @doc """
  The publicly visible reviews for a subject, newest first, author preloaded.

  Excludes anything not approved and anyone banned. The ban filter lives in
  the join so a ban takes effect on every page immediately, with no backfill.
  """
  def approved_reviews(subject) do
    subject
    |> public_reviews_query()
    |> order_by([r], desc: r.inserted_at, desc: r.id)
    |> preload(:user)
    |> Repo.all()
  end

  @doc """
  Average rating out of ten and how many reviews it is drawn from.

  `average` is `nil` rather than `0.0` when there is nothing to average —
  "no rating yet" and "rated zero" must not render the same, and the scale
  starts at 1 anyway.
  """
  def rating_summary(subject) do
    query = public_reviews_query(subject)

    case Repo.one(from r in query, select: {avg(r.rating), count(r.id)}) do
      {nil, _} -> %{average: nil, count: 0}
      {avg, count} -> %{average: avg |> Decimal.to_float() |> Float.round(1), count: count}
    end
  end

  defp public_reviews_query(subject) do
    {type, id} = Subject.ref(subject)

    from r in Review,
      join: u in User,
      on: u.id == r.user_id,
      where:
        r.subject_type == ^type and r.subject_id == ^id and
          r.status == "approved" and is_nil(u.banned_at)
  end

  # The form posts strings; the tests and the console pass atoms or strings
  # interchangeably. Normalising here keeps `Review.changeset/2` from having to
  # care which it got.
  #
  # Restricted to the fields a caller is ever allowed to set. `user_id`,
  # `subject_type` and `subject_id` are supplied by `create_review/3` itself
  # and never come from caller attrs, and `status` is pinned by
  # `create_review/3`/`update_review/2` after this runs — see the merge/put
  # calls above. Using a known allowlist rather than
  # `String.to_existing_atom/1` on whatever keys show up also means an
  # unrecognised key (typo, stray form field, or a deliberate probe) is
  # dropped silently instead of raising `ArgumentError` and turning into a
  # 500: the changeset reports a missing required field the normal way.
  @castable_review_keys ~w(rating body status)a

  defp normalize_review_attrs(attrs) do
    Enum.reduce(@castable_review_keys, %{}, fn key, acc ->
      case Map.fetch(attrs, key) do
        {:ok, value} ->
          Map.put(acc, key, value)

        :error ->
          case Map.fetch(attrs, Atom.to_string(key)) do
            {:ok, value} -> Map.put(acc, key, value)
            :error -> acc
          end
      end
    end)
  end
end
