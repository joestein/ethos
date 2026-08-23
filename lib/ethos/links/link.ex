defmodule Ethos.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @kinds ~w(nearby shared-history same-region see-also)
  @types ~w(guide place)

  def kinds, do: @kinds

  schema "page_links" do
    field :source_type, :string
    field :source_id, :integer
    field :target_type, :string
    field :target_id, :integer
    field :kind, :string
    field :note, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(link, attrs) do
    link
    |> cast(attrs, [:source_type, :source_id, :target_type, :target_id, :kind, :note])
    |> validate_required([:source_type, :source_id, :target_type, :target_id, :kind])
    |> validate_inclusion(:source_type, @types)
    |> validate_inclusion(:target_type, @types)
    |> validate_inclusion(:kind, @kinds)
    |> validate_length(:note, max: 160)
    |> validate_not_self()
    |> unique_constraint([:source_type, :source_id, :target_type, :target_id, :kind],
      name: :page_links_source_type_source_id_target_type_target_id_kind_index
    )
  end

  defp validate_not_self(changeset) do
    st = get_field(changeset, :source_type)
    si = get_field(changeset, :source_id)
    tt = get_field(changeset, :target_type)
    ti = get_field(changeset, :target_id)

    if st == tt and si == ti and not is_nil(si) do
      add_error(changeset, :target_id, "cannot link a page to itself")
    else
      changeset
    end
  end
end
