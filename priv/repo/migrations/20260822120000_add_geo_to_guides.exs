defmodule Ethos.Repo.Migrations.AddGeoToGuides do
  use Ecto.Migration

  def change do
    alter table(:guides) do
      add :state, :string
      add :state_slug, :string
      add :county, :string
      add :county_slug, :string
    end

    create index(:guides, [:state_slug])
    create index(:guides, [:state_slug, :county_slug])
  end
end
