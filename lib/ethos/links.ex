defmodule Ethos.Links do
  @moduledoc """
  The page-link graph: typed edges between guides and places. Nodes are
  polymorphic {type, id} pairs; rendering unions outgoing and incoming
  edges, so one stored edge connects both pages.
  """

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Links.Link
  alias Ethos.Guides.Guide
  alias Ethos.Places.Place

  def upsert_link!(%{source: source, target: target, kind: kind} = attrs) do
    {st, sid} = resolve!(source)
    {tt, tid} = resolve!(target)

    case Repo.get_by(Link,
           source_type: st,
           source_id: sid,
           target_type: tt,
           target_id: tid,
           kind: kind
         ) do
      nil -> %Link{}
      link -> link
    end
    |> Link.changeset(%{
      source_type: st,
      source_id: sid,
      target_type: tt,
      target_id: tid,
      kind: kind,
      note: Map.get(attrs, :note)
    })
    |> Repo.insert_or_update!()
  end

  defp resolve!({:guide, slug}) do
    case Repo.get_by(Guide, slug: slug) do
      nil -> raise ArgumentError, "page link references unknown guide #{slug}"
      g -> {"guide", g.id}
    end
  end

  defp resolve!({:place, slug}) do
    case Repo.get_by(Place, slug: slug) do
      nil -> raise ArgumentError, "page link references unknown place #{slug}"
      p -> {"place", p.id}
    end
  end

  def links_for(type, id) when type in ["guide", "place"] do
    outgoing =
      Repo.all(from l in Link, where: l.source_type == ^type and l.source_id == ^id)

    incoming =
      Repo.all(from l in Link, where: l.target_type == ^type and l.target_id == ^id)

    edges =
      Enum.map(outgoing, &{&1, {&1.target_type, &1.target_id}}) ++
        Enum.map(incoming, &{&1, {&1.source_type, &1.source_id}})

    guide_ids = for {_l, {"guide", gid}} <- edges, do: gid
    place_ids = for {_l, {"place", pid}} <- edges, do: pid

    guides =
      Map.new(Repo.all(from g in Guide, where: g.id in ^guide_ids), &{&1.id, &1})

    places =
      Map.new(Repo.all(from p in Place, where: p.id in ^place_ids), &{&1.id, &1})

    edges
    |> Enum.flat_map(fn {link, {ot, oid}} ->
      case hydrate(ot, oid, guides, places) do
        nil -> []
        other -> [%{kind: link.kind, note: link.note, other: other}]
      end
    end)
    |> Enum.uniq_by(&{&1.other.type, &1.other.id, &1.kind})
  end

  defp hydrate("guide", id, guides, _places) do
    case guides[id] do
      nil -> nil
      g -> %{type: "guide", id: g.id, slug: g.slug, title: g.title, subtitle: g.destination}
    end
  end

  defp hydrate("place", id, _guides, places) do
    case places[id] do
      nil ->
        nil

      p ->
        %{type: "place", id: p.id, slug: p.slug, title: p.name, subtitle: "#{p.kind} · #{p.town}"}
    end
  end

  def delete_links_for(type, id) when type in ["guide", "place"] do
    Repo.delete_all(
      from l in Link,
        where:
          (l.source_type == ^type and l.source_id == ^id) or
            (l.target_type == ^type and l.target_id == ^id)
    )
  end

  def prune_orphans do
    {n1, _} =
      Repo.delete_all(
        from l in Link,
          where:
            (l.source_type == "guide" and
               l.source_id not in subquery(from g in Guide, select: g.id)) or
              (l.target_type == "guide" and
                 l.target_id not in subquery(from g in Guide, select: g.id))
      )

    {n2, _} =
      Repo.delete_all(
        from l in Link,
          where:
            (l.source_type == "place" and
               l.source_id not in subquery(from p in Place, select: p.id)) or
              (l.target_type == "place" and
                 l.target_id not in subquery(from p in Place, select: p.id))
      )

    n1 + n2
  end
end
