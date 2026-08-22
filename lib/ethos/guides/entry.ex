defmodule Ethos.Guides.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(food tour walk sight stay tip)
  @verdicts ~w(loved good skip)
  @sources ~w(import manual suggestion gap_fill)

  def kinds, do: @kinds
  def verdicts, do: @verdicts

  schema "entries" do
    field :day, :integer
    field :kind, :string
    field :name, :string
    field :note, :string
    field :verdict, :string
    field :position, :integer, default: 0
    field :enrichment, :map
    field :lat, :float
    field :lng, :float
    field :source, :string, default: "manual"
    field :booking_url, :string
    field :booking_label, :string
    belongs_to :guide, Ethos.Guides.Guide
    belongs_to :credited_user, Ethos.Accounts.User
    belongs_to :place, Ethos.Places.Place
    timestamps(type: :utc_datetime)
  end

  @doc """
  Public changeset for entries created from external/web-facing input
  (LiveView forms, imports). Deliberately does NOT cast `:source` or
  `:credited_user_id` — those are set internally only, via
  `privileged_changeset/2`, so a form submission can never forge
  provenance or attribute an entry to another user.
  """
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [
      :day,
      :kind,
      :name,
      :note,
      :verdict,
      :position,
      :lat,
      :lng,
      :booking_url,
      :booking_label
    ])
    |> validate_required([:kind, :name])
    |> validate_inclusion(:kind, @kinds)
    |> validate_inclusion(:verdict, @verdicts ++ [nil])
    |> validate_inclusion(:source, @sources)
    |> validate_change(:booking_url, fn :booking_url, url ->
      if is_nil(url) or Ethos.Url.safe_http?(url) do
        []
      else
        [booking_url: "must be an http(s) URL"]
      end
    end)
    |> validate_length(:booking_label, max: 80)
  end

  @doc """
  Internal-only changeset used by context-internal callers (e.g. accepting a
  suggestion) that legitimately need to set `:source` and `:credited_user_id`.
  Never call this with attrs sourced directly from a web request.
  """
  def privileged_changeset(entry, attrs) do
    entry
    |> changeset(attrs)
    |> cast(attrs, [:source, :credited_user_id, :place_id])
  end
end
