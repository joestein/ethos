defmodule Ethos.Repo.Migrations.AddUsernamesAndModerationFieldsToUsers do
  use Ecto.Migration

  alias Ethos.Accounts.Username

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

  # Calls into Ethos.Accounts.Username rather than freezing a copy of its
  # rules here.
  #
  # That breaks the usual "a migration must not depend on application code"
  # rule, and the exception is deliberate: every call below happens inside a
  # loop over rows that already exist. A fresh database has no users, so the
  # loop body never runs and the module is never reached — Elixir resolves
  # remote calls at runtime, so even deleting the module later would not
  # break `mix ecto.setup`. Any database that does reach these calls runs
  # this migration exactly once, so the rules cannot drift underneath it.
  defp backfill_usernames do
    %{rows: rows} = repo().query!("SELECT id, email FROM users ORDER BY id")

    admin_email = String.downcase(Application.get_env(:ethos, :admin_email) || "")

    # Seeded with the reserved names so that an account like
    # admin@example.com backfills to "admin2" rather than to a name the
    # changeset would later refuse.
    initial_taken = MapSet.new(Username.reserved())

    {updates, _taken} =
      Enum.map_reduce(rows, initial_taken, fn [id, email], taken ->
        admin? = String.downcase(email) == admin_email

        base = if admin?, do: @admin_username, else: Username.derive_from_email(email)
        username = Username.uniquify(base, taken)

        {{id, username, not admin?}, MapSet.put(taken, username)}
      end)

    Enum.each(updates, fn {id, username, provisional} ->
      repo().query!(
        "UPDATE users SET username = $1, username_provisional = $2 WHERE id = $3",
        [username, provisional, id]
      )
    end)
  end
end
