defmodule Ethos.Repo.Migrations.CreateDestinations do
  use Ecto.Migration

  def change do
    create table(:destinations) do
      add :path, :string, null: false
      add :name, :string, null: false
      add :intro, :text, null: false
      add :photos, {:array, :map}, null: false, default: []

      timestamps(type: :utc_datetime)
    end

    create unique_index(:destinations, [:path])
  end
end
