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
  alias Ethos.Repo
  alias Ethos.Social.Reaction
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
  """
  def react(%User{} = user, subject, value) do
    {type, id} = Subject.ref(subject)
    do_react(user, type, id, value)
  end

  defp do_react(user, type, id, value) do
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
            if unique_reaction_collision?(changeset) do
              # Lost a race with a concurrent insert for the same
              # (user, subject) pair: a row now exists where a moment ago
              # there was none. Re-reading and falling back into the
              # existing-row branches below keeps this function's
              # contract intact instead of surfacing a spurious
              # {:error, changeset} for what is, from the caller's point
              # of view, a perfectly normal toggle.
              do_react(user, type, id, value)
            else
              {:error, changeset}
            end
        end

      %Reaction{value: ^value} = existing ->
        Repo.delete!(existing)
        {:ok, :cleared}

      existing ->
        existing
        |> Reaction.changeset(%{value: value})
        |> Repo.update()
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
end
