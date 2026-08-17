defmodule Ethos.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  @statuses ~w(draft published)

  schema "guides" do
    field :title, :string
    field :slug, :string
    field :destination, :string
    field :starts_on, :date
    field :ends_on, :date
    field :status, :string, default: "draft"
    field :view_count, :integer, default: 0
    field :og_image_path, :string
    belongs_to :user, Ethos.Accounts.User
    has_many :entries, Ethos.Guides.Entry, preload_order: [asc: :position]
    timestamps(type: :utc_datetime)
  end

  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:title, :destination, :starts_on, :ends_on])
    |> validate_required([:title, :destination])
    |> validate_length(:title, max: 120)
    |> maybe_put_slug()
    |> unique_constraint(:slug)
  end

  def status_changeset(guide, status) when status in @statuses do
    change(guide, status: status)
  end

  defp maybe_put_slug(changeset) do
    case {get_field(changeset, :slug), get_change(changeset, :title)} do
      {nil, title} when is_binary(title) ->
        suffix =
          for _ <- 1..6, into: "", do: <<Enum.random(~c"abcdefghijklmnopqrstuvwxyz0123456789")>>

        slug =
          title
          |> String.downcase()
          |> String.replace(~r/[^a-z0-9\s-]/, "")
          |> String.replace(~r/\s+/, "-")
          |> String.slice(0, 60)

        put_change(changeset, :slug, "#{slug}-#{suffix}")

      _ ->
        changeset
    end
  end
end
