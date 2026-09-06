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
    field :tier, :string, default: "guide"
    field :view_count, :integer, default: 0
    field :og_image_path, :string
    field :intro, :string
    field :sections, {:array, :map}
    field :faq, {:array, :map}
    field :photos, {:array, :map}
    field :destination_slug, :string
    belongs_to :destination_node, Ethos.Destinations.Destination, foreign_key: :destination_id
    belongs_to :user, Ethos.Accounts.User
    has_many :entries, Ethos.Guides.Entry, preload_order: [asc: :position]
    timestamps(type: :utc_datetime)
  end

  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:title, :destination, :starts_on, :ends_on, :destination_id])
    |> validate_required([:title, :destination])
    |> validate_length(:title, max: 120)
    |> maybe_put_slug()
    |> put_destination_slug()
    |> unique_constraint(:slug)
  end

  def seo_changeset(guide, attrs) do
    guide
    |> cast(attrs, [:intro, :sections, :faq])
    |> validate_length(:intro, max: 10_000)
  end

  def status_changeset(guide, status) when status in @statuses do
    change(guide, status: status)
  end

  @photo_path_re ~r{^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$}

  def photos_changeset(guide, attrs) do
    guide
    |> cast(attrs, [:photos])
    |> validate_change(:photos, fn :photos, photos ->
      ok? =
        is_list(photos) and
          Enum.all?(photos, fn p ->
            is_map(p) and
              Enum.all?(~w(src thumb title description), &is_binary(Map.get(p, &1))) and
              Regex.match?(@photo_path_re, p["src"]) and
              Regex.match?(@photo_path_re, p["thumb"]) and
              (not Map.has_key?(p, "source_url") or Ethos.Url.safe_http?(p["source_url"]))
          end)

      if ok?,
        do: [],
        else: [photos: "each photo needs src/thumb under /photos/ plus title and description"]
    end)
  end

  def derive_destination_slug(destination) when is_binary(destination) do
    destination
    |> String.split(",")
    |> List.first()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end

  defp put_destination_slug(changeset) do
    case get_field(changeset, :destination) do
      nil ->
        changeset

      destination ->
        put_change(changeset, :destination_slug, derive_destination_slug(destination))
    end
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
