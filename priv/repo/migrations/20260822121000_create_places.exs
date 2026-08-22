defmodule Ethos.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :slug, :string, null: false
      add :name, :string, null: false
      add :kind, :string, null: false
      add :town, :string, null: false
      add :town_slug, :string, null: false
      add :state, :string, null: false
      add :state_slug, :string, null: false
      add :county, :string, null: false
      add :county_slug, :string, null: false
      add :summary, :text, null: false
      add :history, :text
      add :address, :string
      add :official_url, :string
      add :booking_url, :string
      add :photos, {:array, :map}, default: [], null: false
      add :status, :string, default: "open", null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:places, [:slug])
    create index(:places, [:state_slug, :county_slug])
    create index(:places, [:town_slug])
    create index(:places, [:kind])
  end
end
