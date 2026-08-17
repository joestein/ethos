defmodule Ethos.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :day, :integer
      add :kind, :string, null: false
      add :name, :string, null: false
      add :note, :text
      add :verdict, :string
      add :position, :integer, null: false, default: 0
      add :enrichment, :map
      add :lat, :float
      add :lng, :float
      add :credited_user_id, references(:users, on_delete: :nilify_all)
      add :source, :string, null: false, default: "manual"
      timestamps(type: :utc_datetime)
    end

    create index(:entries, [:guide_id, :position])
  end
end
