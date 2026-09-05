defmodule Ethos.Repo.Migrations.CreateFoliageNotes do
  use Ecto.Migration

  def change do
    create table(:foliage_notes) do
      add :scope, :string, null: false
      add :ref, :string
      add :published_on, :date, null: false
      add :body, :text, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:foliage_notes, [:scope, :ref, :published_on])
  end
end
