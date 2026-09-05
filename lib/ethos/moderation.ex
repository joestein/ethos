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

  `approve_review/2` and `revoke_review/2` verify their `admin` argument is
  THE configured admin (`Ethos.Accounts.admin?/1`) and return
  `{:error, :unauthorized}` otherwise. An earlier version of this module
  deliberately left that check out, on the reasoning that the router's
  `require_admin_user` plug already owned it and a second check here would
  just be redundant. That reasoning held only as long as the router was the
  only way to reach these functions — it no longer is, so the check moved
  here instead of staying implicit in the caller.
  """

  import Ecto.Query, warn: false

  alias Ethos.Accounts
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

  @doc """
  Reviews currently public, most recently decided first.

  `desc_nulls_last` on purpose: Postgres sorts NULLs first on a plain
  `DESC`, and a fast-laned review (published straight from
  `Ethos.Social.create_review/3`, without ever passing through `decide/3`)
  never gets a `moderated_at`. A plain `desc:` would pin every such review
  to the top of this list forever, ahead of everything actually decided
  today.
  """
  def list_approved_reviews do
    Repo.all(
      from r in Review,
        where: r.status == "approved",
        order_by: [desc_nulls_last: r.moderated_at, desc: r.id],
        preload: [:user]
    )
  end

  def get_review!(id), do: Repo.get!(Review, id)

  @doc """
  Publishes a review.

  Returns `{:error, :unauthorized}` if `admin` is not THE configured admin.
  The router's `require_admin_user` plug is not the only way in any more —
  see the moduledoc — so this context has to hold the line itself rather
  than trusting whoever calls it to have already checked.
  """
  def approve_review(%Review{} = review, %User{} = admin) do
    if Accounts.admin?(admin) do
      decide(review, "approved", admin)
    else
      {:error, :unauthorized}
    end
  end

  @doc """
  Hides a review, whether it was ever public or not.

  Returns `{:error, :unauthorized}` if `admin` is not THE configured admin.
  """
  def revoke_review(%Review{} = review, %User{} = admin) do
    if Accounts.admin?(admin) do
      decide(review, "revoked", admin)
    else
      {:error, :unauthorized}
    end
  end

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
