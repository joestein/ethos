defmodule Ethos.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :subject_type, :string, null: false
      # bigint, matching reactions.subject_id: places, guides and collections
      # all have bigserial primary keys, and widening later is a data migration.
      add :subject_id, :bigint, null: false
      add :rating, :integer, null: false
      add :body, :text, null: false
      add :status, :string, null: false, default: "pending"
      add :moderated_at, :utc_datetime
      # nilify rather than delete_all: losing the moderator's account must not
      # silently delete the moderation decisions they made.
      add :moderated_by_id, references(:users, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:reviews, [:user_id, :subject_type, :subject_id])

    # Serves the public "approved reviews for this subject" read on every show
    # page, and the admin queue's status filter.
    create index(:reviews, [:subject_type, :subject_id, :status])
    create index(:reviews, [:status])

    create constraint(:reviews, :reviews_rating_check, check: "rating >= 1 AND rating <= 10")

    create constraint(:reviews, :reviews_status_check,
             check: "status in ('pending', 'approved', 'revoked')"
           )

    create constraint(:reviews, :reviews_subject_type_check,
             check: "subject_type in ('place', 'guide', 'collection')"
           )
  end
end
