defmodule Ethos.Moderation do
  @moduledoc """
  The admin's verbs over user-generated content.

  Separate from `Ethos.Social` on purpose: `Social` is how content works,
  this is what an administrator does *to* it. The console is the only
  caller, and keeping the two apart means a moderation change cannot
  accidentally alter how a page reads.

  Every decision records who made it and when. That is not bookkeeping for
  its own sake — a revoked comment is a dispute waiting to happen, and the
  answer to "who took this down" should not be "nobody knows".
  """

  import Ecto.Query, warn: false

  alias Ethos.Accounts.User
  alias Ethos.Repo
  alias Ethos.Social.Review

  @doc "Reviews awaiting a decision, oldest first."
  def list_pending_reviews do
    Repo.all(
      from r in Review,
        where: r.status == "pending",
        order_by: [asc: r.inserted_at, asc: r.id],
        preload: [:user]
    )
  end

  @doc "Reviews currently public, most recently decided first."
  def list_approved_reviews do
    Repo.all(
      from r in Review,
        where: r.status == "approved",
        order_by: [desc: r.moderated_at, desc: r.id],
        preload: [:user]
    )
  end

  def get_review!(id), do: Repo.get!(Review, id)

  @doc "Publishes a review."
  def approve_review(%Review{} = review, %User{} = admin), do: decide(review, "approved", admin)

  @doc "Hides a review, whether it was ever public or not."
  def revoke_review(%Review{} = review, %User{} = admin), do: decide(review, "revoked", admin)

  defp decide(%Review{} = review, status, %User{} = admin) do
    review
    |> Ecto.Changeset.change(
      status: status,
      moderated_at: DateTime.utc_now() |> DateTime.truncate(:second),
      moderated_by_id: admin.id
    )
    |> Repo.update()
  end
end
