defmodule Ethos.Repo.Migrations.CreatePageLinks do
  use Ecto.Migration

  def change do
    create table(:page_links) do
      add :source_type, :string, null: false
      add :source_id, :integer, null: false
      add :target_type, :string, null: false
      add :target_id, :integer, null: false
      add :kind, :string, null: false
      add :note, :string
      timestamps(type: :utc_datetime)
    end

    create unique_index(:page_links, [:source_type, :source_id, :target_type, :target_id, :kind],
             name: :page_links_edge_index
           )

    create index(:page_links, [:source_type, :source_id])
    create index(:page_links, [:target_type, :target_id])
  end
end
