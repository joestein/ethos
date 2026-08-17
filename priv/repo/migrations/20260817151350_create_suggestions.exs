defmodule Ethos.Repo.Migrations.CreateSuggestions do
  use Ecto.Migration

  def change do
    create table(:suggestions) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :entry_id, references(:entries, on_delete: :nilify_all)
      add :author_id, references(:users, on_delete: :nilify_all)
      add :origin, :string, null: false, default: "user"
      add :place_name, :string, null: false
      add :body, :text
      add :url, :string
      add :kind_hint, :string
      add :status, :string, null: false, default: "pending"
      add :accepted_entry_id, references(:entries, on_delete: :nilify_all)
      timestamps(type: :utc_datetime)
    end

    create index(:suggestions, [:guide_id, :status])
  end
end
