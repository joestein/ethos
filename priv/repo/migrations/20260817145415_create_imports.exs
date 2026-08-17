defmodule Ethos.Repo.Migrations.CreateImports do
  use Ecto.Migration

  def change do
    create table(:imports) do
      add :guide_id, references(:guides, on_delete: :delete_all), null: false
      add :raw_text, :text, null: false
      add :status, :string, null: false, default: "pending"
      add :error, :string
      add :proposal, {:array, :map}
      timestamps(type: :utc_datetime)
    end

    create index(:imports, [:guide_id])
  end
end
