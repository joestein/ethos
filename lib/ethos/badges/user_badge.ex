defmodule Ethos.Badges.UserBadge do
  use Ecto.Schema

  schema "user_badges" do
    belongs_to :user, Ethos.Accounts.User
    field :badge_key, :string
    field :awarded_at, :utc_datetime
    timestamps(type: :utc_datetime)
  end
end
