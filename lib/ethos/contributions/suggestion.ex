defmodule Ethos.Contributions.Suggestion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suggestions" do
    field :origin, :string, default: "user"
    field :place_name, :string
    field :body, :string
    field :url, :string
    field :kind_hint, :string
    field :status, :string, default: "pending"
    belongs_to :guide, Ethos.Guides.Guide
    belongs_to :entry, Ethos.Guides.Entry
    belongs_to :author, Ethos.Accounts.User
    belongs_to :accepted_entry, Ethos.Guides.Entry
    timestamps(type: :utc_datetime)
  end

  def changeset(suggestion, attrs) do
    suggestion
    |> cast(attrs, [:place_name, :body, :url, :kind_hint])
    |> validate_required([:place_name])
    |> validate_length(:place_name, max: 120)
    |> validate_length(:body, max: 2000)
    |> validate_inclusion(:kind_hint, Ethos.Guides.Entry.kinds() ++ [nil])
  end
end
