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
    |> transliterate()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end

  # Hawaii's "Lānaʻi" derived "l-na-i" — a URL no reader could guess or
  # type. Neither the macron in "ā" nor the ʻokina (U+02BB) is [a-z0-9], so the
  # replace above turned each of them into a hyphen. This step is ADDITIVE and
  # sits in front of that pipeline, which is unchanged: NFD-decompose, then drop
  # combining diacritical marks so a letter falls back to its base letter
  # ("ā" -> "a", "é" -> "e", "ü" -> "u", "ñ" -> "n"), and drop spacing modifier
  # letters outright — the ʻokina is a letter in Hawaiian orthography, not
  # punctuation, but it has no ASCII equivalent, so removing it ("lanai") is the
  # correct transliteration where hyphenating it ("lana-i") is not.
  #
  # Neither dropped range overlaps ASCII, and NFD leaves ASCII untouched, so
  # pure-ASCII input derives byte-identically to what it derived before. That is
  # the binding property here; guide_geo_test.exs asserts it on real corpus
  # destinations.
  @combining_marks 0x0300..0x036F
  @modifier_letters 0x02B0..0x02FF

  defp transliterate(string) do
    string
    |> :unicode.characters_to_nfd_binary()
    |> String.to_charlist()
    |> Enum.reject(&(&1 in @combining_marks or &1 in @modifier_letters))
    |> List.to_string()
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
