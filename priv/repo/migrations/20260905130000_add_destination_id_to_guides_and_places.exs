defmodule Ethos.Repo.Migrations.AddDestinationIdToGuidesAndPlaces do
  use Ecto.Migration

  # Nullable on arrival. The seed corpora are rewritten to carry a
  # destination_path in a later commit, and only once every row has an id do
  # the legacy state/county/town columns come out.
  def change do
    alter table(:guides) do
      add :destination_id, references(:destinations, on_delete: :nilify_all)
    end

    alter table(:places) do
      add :destination_id, references(:destinations, on_delete: :nilify_all)
    end

    create index(:guides, [:destination_id])
    create index(:places, [:destination_id])
  end
end
