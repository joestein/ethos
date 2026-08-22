defmodule Ethos.Repo.Migrations.AddPlaceIdToEntries do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :place_id, references(:places, on_delete: :nilify_all)
    end

    create index(:entries, [:place_id])
  end
end
