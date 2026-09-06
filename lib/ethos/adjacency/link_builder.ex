defmodule Ethos.Adjacency.LinkBuilder do
  @moduledoc """
  Writes a `nearby` edge between the guides of every pair of Connecticut towns
  that share a border.

  One edge per border, not per direction: `Ethos.Links.links_for/2` unions
  outgoing and incoming edges, so a stored edge already appears on both pages.
  `Ethos.Adjacency.ordered_pairs/0` supplies each border once with a stable
  ordering, which is also what makes re-running update rows rather than add
  their reverses.

  This builder is not the only writer of `nearby` edges, though: the
  Connecticut expansion work already codified `nearby` as "the towns share a
  border" and hand-wrote curated edges — with real notes about shared lakes,
  parks, and town-line history — for roughly a third of Connecticut's
  borders. `ordered_pairs/0` guarantees this builder writes each border it
  touches once, but it cannot know some other writer already stored the
  reverse of a pair. So before upserting, this checks both directions for an
  existing `nearby` edge between the two guides and skips if one is already
  there — an edge in either direction already connects both pages via
  `Links.links_for/2`, and skipping keeps the better curated note instead of
  shadowing it with the generic one.

  Skip-if-missing, like `Ethos.Foliage.LinkBuilder`: a town whose guide is
  unpublished is a corpus state, not a programming error.
  """

  require Logger

  import Ecto.Query

  alias Ethos.Adjacency
  alias Ethos.Foliage.Routes
  alias Ethos.Guides.Guide
  alias Ethos.Links
  alias Ethos.Links.Link
  alias Ethos.Repo

  def build! do
    guides =
      Repo.all(from g in Guide, where: g.status == "published", select: {g.slug, g.id})
      |> Map.new()

    published = guides |> Map.keys() |> MapSet.new()

    {written, already_linked, missing} =
      Enum.reduce(Adjacency.ordered_pairs(), {0, 0, 0}, fn {a, b},
                                                           {written, already_linked, missing} ->
        with slug_a when not is_nil(slug_a) <- Routes.guide_slug_for(a, published),
             slug_b when not is_nil(slug_b) <- Routes.guide_slug_for(b, published),
             id_a when not is_nil(id_a) <- Map.get(guides, slug_a),
             id_b when not is_nil(id_b) <- Map.get(guides, slug_b) do
          if already_linked?(id_a, id_b) do
            {written, already_linked + 1, missing}
          else
            upsert(slug_a, slug_b)
            {written + 1, already_linked, missing}
          end
        else
          _ -> {written, already_linked, missing + 1}
        end
      end)

    Logger.info(
      "adjacency links: #{written} borders written, #{already_linked} already linked, #{missing} missing guide"
    )

    :ok
  end

  defp already_linked?(source_id, target_id) do
    Repo.exists?(
      from l in Link,
        where:
          l.kind == "nearby" and l.source_type == "guide" and l.target_type == "guide" and
            ((l.source_id == ^source_id and l.target_id == ^target_id) or
               (l.source_id == ^target_id and l.target_id == ^source_id))
    )
  end

  defp upsert(source, target) do
    Links.upsert_link!(%{
      source: {:guide, source},
      target: {:guide, target},
      kind: "nearby",
      note: "The two towns share a border"
    })
  rescue
    ArgumentError ->
      Logger.warning("adjacency links: skipped #{source} -> #{target}, guide missing")
      :ok
  end
end
