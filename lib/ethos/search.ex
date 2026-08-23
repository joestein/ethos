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

  defp search_places(q, limit) do
    Repo.all(
      from p in Place,
        where:
          fragment(
            "to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')) @@ websearch_to_tsquery('english', ?)",
            p.name,
            p.town,
            p.summary,
            p.history,
            ^q
          ),
        order_by: [
          desc:
            fragment(
              "ts_rank(to_tsvector('english', coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'') || ' ' || coalesce(?,'')), websearch_to_tsquery('english', ?))",
              p.name,
              p.town,
              p.summary,
              p.history,
              ^q
            ),
          asc: p.name
        ],
        limit: ^limit
    )
  end
end
