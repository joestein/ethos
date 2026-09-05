defmodule Ethos.Social.Reaction do
  @moduledoc """
  One person's thumbs up or thumbs down on one subject.

  Deliberately has no moderation state. A reaction carries no text, so
  there is nothing to moderate — that is the whole reason thumbs are
  instant and reviews are not.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Ethos.Social.Subject

  @values ~w(up down)

  schema "reactions" do
    belongs_to :user, Ethos.Accounts.User
    field :subject_type, :string
    field :subject_id, :integer
    field :value, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [:user_id, :subject_type, :subject_id, :value])
    |> validate_required([:user_id, :subject_type, :subject_id, :value])
    |> validate_inclusion(:subject_type, Subject.types())
    |> validate_inclusion(:value, @values)
    |> unique_constraint([:user_id, :subject_type, :subject_id],
      name: :reactions_user_id_subject_type_subject_id_index,
      message: "has already reacted to this"
    )
  end
end
