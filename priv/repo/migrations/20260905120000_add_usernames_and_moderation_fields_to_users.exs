defmodule Ethos.Repo.Migrations.AddUsernamesAndModerationFieldsToUsers do
  use Ecto.Migration

  alias Ethos.Accounts.UsernameBackfill

  @admin_username "buoewe"

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
        |> UsernameBackfill.backfill(admin_email, @admin_username)
        |> Enum.each(fn {id, username, provisional} ->
          repo().query!(
            "UPDATE users SET username = $1, username_provisional = $2 WHERE id = $3",
            [username, provisional, id]
          )
        end)
    end
  end
end
