defmodule Ethos.Research.CacheEntry do
  use Ecto.Schema

  schema "research_cache" do
    field :key, :string
    field :kind, :string
    field :payload, :map
    field :fetched_at, :utc_datetime
    timestamps(type: :utc_datetime)
  end
end
