defmodule Ethos.Repo.Migrations.AddUsernamesAndModerationFieldsToUsers do
  use Ecto.Migration

  alias Ethos.Accounts.{Username, UsernameBackfill}

  # This migration is one transaction: the ALTER TABLE below takes ACCESS
  # EXCLUSIVE on `users` and holds it to COMMIT, and inside that window
  # come one round trip per user (backfill_usernames/0), a SET NOT NULL
  # full table scan, and a non-concurrent unique index build. `fly.toml`
  # runs migrations as `release_command` against the live database while
  # the previous release still serves traffic, so every authenticated
  # request blocks for the duration. backfill_usernames/0 is O(N) round
  # trips with an O(N^2)-in-memory `Username.uniquify/2` on a shared base
  # (each new name is checked against every name assigned so far). That is
  # acceptable only because this table is small; do not copy this shape as
  # a template for a migration against a large table.
  def up do
    alter table(:users) do
      add :username, :citext
      add :username_provisional, :boolean, null: false, default: false
      add :trusted_at, :utc_datetime
      add :banned_at, :utc_datetime
      add :ban_reason, :text
    end

    flush()

    backfill_usernames()

    alter table(:users) do
      modify :username, :citext, null: false
    end

    create unique_index(:users, [:username])
  end

  # This down is not the inverse of up in the way a `down` usually implies.
  # It drops `username` — including every name a user deliberately chose —
  # plus `trusted_at`, `banned_at`, and `ban_reason` (bans, once a later
  # plan uses them). It neither fails nor corrupts data, but a
  # down-then-up cycle re-derives email-based provisional names for users
  # who had already picked their own, silently republishing their email
  # local-part and resetting `username_provisional` back to `true`.
  def down do
    drop unique_index(:users, [:username])

    alter table(:users) do
      remove :username
      remove :username_provisional
      remove :trusted_at
      remove :banned_at
      remove :ban_reason
    end
  end

  # Delegates the naming logic to Ethos.Accounts.UsernameBackfill (which in
  # turn calls Ethos.Accounts.Username) rather than freezing a copy of the
  # rules here.
  #
  # That breaks the usual "a migration must not depend on application code"
  # rule, and the exception is deliberate: the call into UsernameBackfill
  # below is guarded by `rows == []`. A fresh database has no users, so that
  # branch is never taken — and since Elixir resolves remote calls only at
  # the point they are dispatched, neither UsernameBackfill nor Username is
  # ever reached on a fresh database. Deleting or renaming either module
  # later would not break `mix ecto.setup`. Any database that does reach
  # this branch runs this migration exactly once, so the rules cannot drift
  # underneath it.
  defp backfill_usernames do
    %{rows: rows} = repo().query!("SELECT id, email FROM users ORDER BY id")

    case rows do
      [] ->
        :ok

      rows ->
        admin_email = Application.get_env(:ethos, :admin_email)

        rows
        |> Enum.map(fn [id, email] -> {id, email} end)
        |> UsernameBackfill.backfill(admin_email, Username.admin_username())
        |> Enum.each(fn {id, username, provisional} ->
          repo().query!(
            "UPDATE users SET username = $1, username_provisional = $2 WHERE id = $3",
            [username, provisional, id]
          )
        end)
    end
  end
end
