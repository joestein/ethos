defmodule Ethos.Search do
  @moduledoc "Postgres full-text search over published guides and places."

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place

  def query(q, limit \\ 20)

  def query(q, limit) when is_binary(q) do
    q = String.trim(q)

    if String.length(q) < 2 do
      %{guides: [], places: []}
    else
      %{guides: search_guides(q, limit), places: search_places(q, limit)}
    end
  end

  def query(_q, _limit), do: %{guides: [], places: []}

  defp search_guides(q, limit) do
    Repo.all(
      from g in Guide,
        where: g.status == "published",
        where:
          fragment(
            "to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
            g.title,
            g.destination,
            g.intro,
            ^q
          ),
        order_by: [
          desc:
            fragment(
              "ts_rank(to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')), websearch_to_tsquery('english', ?))",
              g.title,
              g.destination,
              g.intro,
              ^q
            )
        ],
        limit: ^limit
    )
  end

  # ## Why the destination node is joined in

  # A place's geography used to be the `town`/`state`/`county` columns it
  # carried, and `town` was in the FTS vector: searching "Waterbury" returned
  # that town's places. The tree replaced those columns with a node reference,
  # and dropping them silently took geography out of search with them.
  #
  # So the node's `name` is matched alongside the place's own text. It is a
  # separate `OR`ed vector rather than one concatenated expression because a
  # Postgres index expression may only reference the table it indexes: the place
  # side uses `places_fts_idx` and the node side `destinations_fts_idx`, where a
  # single vector spanning the join could use neither.
  #
  # `left_join`, not `join`: `destination_id` is nullable — a place seeded
  # before the tree, or created outside a loader, has no node — and an inner
  # join would drop those places out of search entirely.
  defp search_places(q, limit) do
    Repo.all(
      from p in Place,
        left_join: d in assoc(p, :destination_node),
        where:
          fragment(
            "to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
            p.name,
            p.summary,
            p.history,
            ^q
          ) or
            fragment(
              "to_tsvector('english', coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
              d.name,
              ^q
            ),
        order_by: [
          desc:
            fragment(
              "ts_rank(to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')), websearch_to_tsquery('english', ?))",
              p.name,
              p.summary,
              p.history,
              d.name,
              ^q
            ),
          asc: p.name
        ],
        limit: ^limit,
        preload: [:destination_node]
    )
  end
end
