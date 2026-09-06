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

  ## A town is resolved by its node, not by a guide-slug convention

  This originally reached a town's guide through
  `Ethos.Foliage.Routes.guide_slug_for/2`, which derives the string
  `"<town>-ct-travel-guide"` and looks it up. On the destination tree a guide's
  geography is the node it is filed against, so that convention is a naming
  habit rather than a fact the database enforces: rename one guide and its
  borders silently stop being written, with nothing to distinguish that from a
  town whose guide is genuinely unpublished.

  So the lookup is keyed on the guide's `destination_node`, narrowed to the
  Connecticut subtree by `Ethos.Destinations.subtree_match/1` — the query-side
  counterpart of `Destinations.under?/2`, and segment-bounded the same way, so
  a hypothetical `united-states/connecticut-valley` could never be swept in by
  a prefix match. `Routes.covering_town/1` still supplies the one alias the
  roster needs (Mansfield has no node; Storrs, a village inside it, does).
  """

  require Logger

  import Ecto.Query

  alias Ethos.Adjacency
  alias Ethos.Destinations
  alias Ethos.Foliage
  alias Ethos.Foliage.Routes
  alias Ethos.Guides.Guide
  alias Ethos.Links
  alias Ethos.Links.Link
  alias Ethos.Repo

  def build! do
    guides = connecticut_guides_by_town()

    {written, already_linked, missing} =
      Enum.reduce(Adjacency.ordered_pairs(), {0, 0, 0}, fn {a, b},
                                                           {written, already_linked, missing} ->
        with {slug_a, id_a} <- Map.get(guides, Routes.covering_town(a)),
             {slug_b, id_b} <- Map.get(guides, Routes.covering_town(b)) do
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

  # Town slug to `{guide_slug, guide_id}`, for every published guide filed on a
  # node inside Connecticut. Two guides on the same node would collide here, but
  # the roster has one town guide per town node and the corpus gate asserts it.
  defp connecticut_guides_by_town do
    {ct_path, ct_pattern} = Destinations.subtree_match(Foliage.connecticut_path())

    Repo.all(
      from g in Guide,
        join: d in assoc(g, :destination_node),
        where:
          g.status == "published" and
            (d.path == ^ct_path or like(d.path, ^ct_pattern)),
        select: {d.slug, g.slug, g.id}
    )
    |> Map.new(fn {town, slug, id} -> {town, {slug, id}} end)
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
