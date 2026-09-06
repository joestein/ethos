defmodule Ethos.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(museum theater restaurant cafe brewery hotel bnb park historic-site amusement-park shop stadium attraction)
  @statuses ~w(open closed)
  @photo_path_re ~r{^/photos/[a-z0-9/_-]+\.(jpg|jpeg|png|webp)$}
  @photo_keys ~w(src thumb title description author license source_url)

  def kinds, do: @kinds

  schema "places" do
    field :slug, :string
    field :name, :string
    field :kind, :string
    field :summary, :string
    field :history, :string
    field :address, :string
    field :official_url, :string
    field :photos, {:array, :map}, default: []
    field :status, :string, default: "open"
    belongs_to :destination_node, Ethos.Destinations.Destination, foreign_key: :destination_id
    timestamps(type: :utc_datetime)
  end

  def changeset(place, attrs) do
    place
    |> cast(attrs, [
      :slug,
      :name,
      :kind,
      :summary,
      :history,
      :address,
      :official_url,
      :photos,
      :status,
      :destination_id
    ])
    |> validate_required([:slug, :name, :kind, :summary])
    |> validate_inclusion(:kind, @kinds)
    |> validate_inclusion(:status, @statuses)
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> validate_safe_url(:official_url)
    |> validate_photos()
    |> unique_constraint(:slug)
  end

  defp validate_safe_url(changeset, field) do
    validate_change(changeset, field, fn ^field, url ->
      if is_nil(url) or Ethos.Url.safe_http?(url),
        do: [],
        else: [{field, "must be an http(s) URL"}]
    end)
  end

  defp validate_photos(changeset) do
    validate_change(changeset, :photos, fn :photos, photos ->
      ok? =
        is_list(photos) and
          Enum.all?(photos, fn p ->
            is_map(p) and
              Enum.all?(@photo_keys, &is_binary(Map.get(p, &1))) and
              Regex.match?(@photo_path_re, p["src"]) and
              Regex.match?(@photo_path_re, p["thumb"]) and
              Ethos.Url.safe_http?(p["source_url"])
          end)

      if ok?,
        do: [],
        else: [
          photos:
            "each photo needs src/thumb under /photos/ plus title, description, author, license, source_url"
        ]
    end)
  end
end
