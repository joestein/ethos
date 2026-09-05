defmodule Ethos.Repo.Migrations.MigrateVisitsToReactions do
  use Ecto.Migration

  @moduledoc """
  Converts every "I've been here" check-off into a thumbs-up, then drops the
  table.

  Continuity is the requirement: the badge system used to count rows in
  `place_visits`, and now counts reactions. Without this conversion every
  user would silently lose every badge they had earned. The conversion runs
  BEFORE the drop and in the same migration, so a failure leaves the visit
  data intact.
  """

  def up do
    # ON CONFLICT because Task 5 shipped the thumbs UI before this migration
    # runs: a user may already have reacted to a place they had also checked
    # off. Their existing reaction — which may be a thumbs-down they chose
    # deliberately — wins over the implied thumbs-up from the old button.
    execute """
    INSERT INTO reactions (user_id, subject_type, subject_id, value, inserted_at, updated_at)
    SELECT user_id, 'place', place_id, 'up', inserted_at, updated_at
    FROM place_visits
    ON CONFLICT (user_id, subject_type, subject_id) DO NOTHING
    """

    drop table(:place_visits)
  end

  def down do
    create table(:place_visits) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :place_id, references(:places, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    # Both indexes, matching 20260822123000_create_place_visits.exs exactly — that
    # migration creates a unique index AND a plain index on :place_id. A `down` that
    # restores only one of them leaves the schema subtly different from what it dropped.
    create unique_index(:place_visits, [:user_id, :place_id])
    create index(:place_visits, [:place_id])

    execute """
    INSERT INTO place_visits (user_id, place_id, inserted_at, updated_at)
    SELECT user_id, subject_id, inserted_at, updated_at
    FROM reactions
    WHERE subject_type = 'place' AND value = 'up'
    """
  end
end
