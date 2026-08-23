defmodule Ethos.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :slug, :string, null: false
      add :title, :string, null: false
      add :intro, :text
      add :published, :boolean, default: false, null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:collections, [:slug])

    create table(:collection_items) do
      add :collection_id, references(:collections, on_delete: :delete_all), null: false
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :position, :integer, null: false, default: 0
      add :blurb, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:collection_items, [:collection_id, :guide_id])
    create index(:collection_items, [:guide_id])
  end
end
