defmodule Ethos.Repo.Migrations.CreatePlaceVisits do
  use Ecto.Migration

  def change do
    create table(:place_visits) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :place_id, references(:places, on_delete: :delete_all), null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:place_visits, [:user_id, :place_id])
    create index(:place_visits, [:place_id])
  end
end
