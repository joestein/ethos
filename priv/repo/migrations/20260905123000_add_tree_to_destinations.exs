defmodule Ethos.Repo.Migrations.AddTreeToDestinations do
  use Ecto.Migration

  # `kind` is nullable here and tightened to NOT NULL in the final cleanup
  # migration, once the roster has given every row one. Backfilling it with a
  # default would write a tier that is wrong for most rows.
  def change do
    alter table(:destinations) do
      add :parent_id, references(:destinations, on_delete: :restrict)
      add :kind, :string
      add :slug, :string
      add :position, :integer, null: false, default: 0
      add :legacy_paths, {:array, :string}, null: false, default: []
    end

    create index(:destinations, [:parent_id])
    create index(:destinations, [:legacy_paths], using: :gin)

    create constraint(:destinations, :destinations_kind_check,
             check:
               "kind is null or kind in ('country','region','county','city','borough','town','neighborhood')"
           )
  end
end
