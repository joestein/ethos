defmodule Ethos.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :destination, :string, null: false
      add :starts_on, :date
      add :ends_on, :date
      add :status, :string, null: false, default: "draft"
      add :view_count, :integer, null: false, default: 0
      add :og_image_path, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false
      timestamps(type: :utc_datetime)
    end

    create unique_index(:guides, [:slug])
    create index(:guides, [:user_id])
  end
end
