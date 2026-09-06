defmodule Ethos.Social.Subject do
  @moduledoc """
  What a reaction or review can be attached to.

  Reactions are polymorphic — one table serves places, guides and
  collections — which means the mapping between a struct and the
  `{subject_type, subject_id}` pair stored in the database has to live
  somewhere. It lives here, and nowhere else, so adding a fourth kind of
  subject is one module to change rather than a grep.

  Unknown types raise rather than returning `nil`. A subject type that
  does not match is a programming error, not a runtime condition: silently
  returning `nil` would let a typo write rows that no query ever reads
  again.
  """

  alias Ethos.Collections.Collection
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place
  alias Ethos.Repo

  @types ~w(place guide collection)

  def types, do: @types

  def valid_type?(type), do: type in @types

  def type(%Place{}), do: "place"
  def type(%Guide{}), do: "guide"
  def type(%Collection{}), do: "collection"

  @doc "The `{subject_type, subject_id}` pair for a subject struct."
  def ref(subject), do: {type(subject), subject.id}

  @doc """
  Whether a subject may still be reacted to.

  A permanently closed place is the only subject that answers `false` — its
  status can no longer change, so freezing its reactions is safe. Guides and
  collections have no such state and are always reactable.
  """
  def reactable?(%Place{status: "closed"}), do: false
  def reactable?(_subject), do: true

  @doc "Loads a subject by its stored type and id. Raises if absent."
  def get!("place", id), do: Repo.get!(Place, id)
  def get!("guide", id), do: Repo.get!(Guide, id)
  def get!("collection", id), do: Repo.get!(Collection, id)

  @doc """
  Loads a subject by its stored type and id, tolerating a missing row.

  `reviews.subject_id` is polymorphic with no foreign key, so the place,
  guide or collection a review points at can be deleted out from under it.
  `get!/2` is right for callers who already know the row must exist (a page
  reached by the subject's own slug); this is for callers — the moderation
  console is the one today — that hold a `subject_id` from a row that may
  have outlived what it points to, and need to say so rather than crash.
  """
  def fetch(type, id) do
    {:ok, get!(type, id)}
  rescue
    Ecto.NoResultsError -> :error
  end
end
