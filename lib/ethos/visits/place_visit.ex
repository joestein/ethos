defmodule Ethos.Visits.PlaceVisit do
  use Ecto.Schema

  schema "place_visits" do
    belongs_to :user, Ethos.Accounts.User
    belongs_to :place, Ethos.Places.Place
    timestamps(type: :utc_datetime)
  end
end
