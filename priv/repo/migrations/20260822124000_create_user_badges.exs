defmodule Ethos.Repo.Migrations.CreateUserBadges do
  use Ecto.Migration

  def change do
    create table(:user_badges) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :badge_key, :string, null: false
      add :awarded_at, :utc_datetime, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:user_badges, [:user_id, :badge_key])
  end
end
