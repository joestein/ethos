defmodule Ethos.Links do
  @moduledoc """
  The page-link graph: typed edges between guides and places. Nodes are
  polymorphic {type, id} pairs; rendering unions outgoing and incoming
  edges, so one stored edge connects both pages.
  """

  import Ecto.Query, warn: false
  require Logger

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
      Map.new(
        Repo.all(from p in Place, where: p.id in ^place_ids, preload: [:destination_node]),
        &{&1.id, &1}
      )

    edges
    |> Enum.flat_map(fn {link, {ot, oid}} ->
      case hydrate(ot, oid, guides, places) do
        nil ->
          Logger.warning("page link skipped: dangling #{ot} #{oid}")
          []

        other ->
          [%{kind: link.kind, note: link.note, other: other}]
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
        %{
          type: "place",
          id: p.id,
          slug: p.slug,
          title: p.name,
          subtitle: "#{p.kind} · #{node_name(p)}"
        }
    end
  end

  # The place's node by name, which is what the dropped `town` column held. Nil
  # for a place with no node, and then the subtitle is just the kind.
  defp node_name(%Place{destination_node: %Ethos.Destinations.Destination{name: name}}), do: name
  defp node_name(%Place{}), do: nil

  @doc """
  Makes `source`'s outgoing edges exactly `links`, dropping any it no longer
  declares. Seed files are the authority for their own outgoing edges, so
  re-seeding a corrected file must retire the edge it corrected — `upsert_link!/1`
  keys on `{source, target, kind}`, so a re-typed edge would otherwise leave the
  old row behind and the target would render under two headings.

  Callers that also author outgoing edges from these sources (`Ethos.Seeds.BackfillLinks`)
  must run AFTER this, which is the order `Ethos.Release` and the deploy runbook use.
  """
  def replace_outgoing_links!(source, links) do
    {st, sid} = resolve!(source)

    {:ok, :ok} =
      Repo.transaction(fn ->
        Repo.delete_all(from l in Link, where: l.source_type == ^st and l.source_id == ^sid)
        Enum.each(links, &upsert_link!(Map.put(&1, :source, source)))
        :ok
      end)

    :ok
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
