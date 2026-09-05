defmodule Ethos.Social.Review do
  @moduledoc """
  One person's rating of one subject, with the comment that justifies it.

  A rating cannot be posted bare — `body` is required — which is why every
  review carries text and therefore every review is moderated. That is the
  whole split between reviews and reactions: thumbs are instant because
  there is nothing in them to moderate.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Ethos.Social.Subject

  @statuses ~w(pending approved revoked)

  schema "reviews" do
    belongs_to :user, Ethos.Accounts.User
    field :subject_type, :string
    field :subject_id, :integer
    field :rating, :integer
    field :body, :string
    field :status, :string, default: "pending"
    field :moderated_at, :utc_datetime
    belongs_to :moderated_by, Ethos.Accounts.User, foreign_key: :moderated_by_id

    timestamps(type: :utc_datetime)
  end

  def statuses, do: @statuses

  def changeset(review, attrs) do
    review
    |> cast(attrs, [:user_id, :subject_type, :subject_id, :rating, :body, :status])
    |> validate_required([:user_id, :subject_type, :subject_id, :rating, :body])
    |> validate_inclusion(:subject_type, Subject.types())
    |> validate_inclusion(:status, @statuses)
    |> validate_inclusion(:rating, 1..10)
    |> validate_length(:body, min: 2, max: 2000)
    |> unique_constraint([:user_id, :subject_type, :subject_id],
      name: :reviews_user_id_subject_type_subject_id_index,
      message: "has already reviewed this"
    )
  end
end
