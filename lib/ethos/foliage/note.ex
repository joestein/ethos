defmodule Ethos.Foliage.Note do
  @moduledoc """
  A dated editorial note on the foliage forecast.

  The derived numbers never change during a season — they are a climatological
  normal, not an observation. This is the part that does: a short note saying
  what is actually happening, and where the normal is running early or late.
  It is the only part of the forecast that is Ethos's own reporting, and the
  only reason to come back to the page.
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Ethos.Repo

  @scopes ~w(statewide route)

  schema "foliage_notes" do
    field :scope, :string
    field :ref, :string
    field :published_on, :date
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(note, attrs) do
    note
    |> cast(attrs, [:scope, :ref, :published_on, :body])
    |> validate_required([:scope, :published_on, :body])
    |> validate_inclusion(:scope, @scopes)
    |> validate_length(:body, min: 20, max: 2000)
    |> validate_ref()
  end

  def create(attrs), do: %__MODULE__{} |> changeset(attrs) |> Repo.insert()

  def list do
    Repo.all(from n in __MODULE__, order_by: [desc: n.published_on, desc: n.id])
  end

  def latest(scope, ref \\ nil) do
    Repo.one(
      from n in __MODULE__,
        where: n.scope == ^scope,
        where: ^ref_condition(ref),
        order_by: [desc: n.published_on, desc: n.id],
        limit: 1
    )
  end

  defp ref_condition(nil), do: dynamic([n], is_nil(n.ref))
  defp ref_condition(ref), do: dynamic([n], n.ref == ^ref)

  # A statewide note with a ref, or a route note without one, would silently
  # never render — `latest/2` filters on exactly this pair.
  defp validate_ref(changeset) do
    case {get_field(changeset, :scope), get_field(changeset, :ref)} do
      {"statewide", nil} ->
        changeset

      {"statewide", _} ->
        add_error(changeset, :ref, "must be blank for a statewide note")

      {"route", nil} ->
        add_error(changeset, :ref, "is required for a route note")

      {"route", ref} ->
        if Ethos.Foliage.route(ref),
          do: changeset,
          else: add_error(changeset, :ref, "is not a known foliage route")

      _ ->
        changeset
    end
  end
end
