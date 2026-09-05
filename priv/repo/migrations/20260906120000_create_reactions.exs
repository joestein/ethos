defmodule Ethos.Repo.Migrations.CreateReactions do
  use Ecto.Migration

  def change do
    create table(:reactions) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :subject_type, :string, null: false
      add :subject_id, :integer, null: false
      add :value, :string, null: false

      timestamps(type: :utc_datetime)
    end

    # One reaction per person per thing. The changeset checks this too, but
    # the index is what actually holds under a double-click race.
    create unique_index(:reactions, [:user_id, :subject_type, :subject_id])

    # Serves the count aggregate on every show page.
    create index(:reactions, [:subject_type, :subject_id, :value])

    # No foreign key to the subject: it is polymorphic, and Postgres cannot
    # reference three tables from one column. Rows for a deleted subject are
    # inert — nothing queries them — which is the accepted cost of one table
    # instead of three.
    create constraint(:reactions, :reactions_value_check, check: "value in ('up', 'down')")

    create constraint(:reactions, :reactions_subject_type_check,
             check: "subject_type in ('place', 'guide', 'collection')"
           )
  end
end
