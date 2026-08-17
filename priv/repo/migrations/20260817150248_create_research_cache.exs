defmodule Ethos.Repo.Migrations.CreateResearchCache do
  use Ecto.Migration

  def change do
    create table(:research_cache) do
      add :key, :string, null: false
      add :kind, :string, null: false
      add :payload, :map, null: false
      add :fetched_at, :utc_datetime, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:research_cache, [:key])
  end
end
