defmodule Ethos.Adjacency.LinkBuilder do
  @moduledoc """
  Writes a `nearby` edge between the guides of every pair of Connecticut towns
  that share a border.

  One edge per border, not per direction: `Ethos.Links.links_for/2` unions
  outgoing and incoming edges, so a stored edge already appears on both pages.
  `Ethos.Adjacency.ordered_pairs/0` supplies each border once with a stable
  ordering, which is also what makes re-running update rows rather than add
  their reverses.

  Skip-if-missing, like `Ethos.Foliage.LinkBuilder`: a town whose guide is
  unpublished is a corpus state, not a programming error.
  """

  require Logger

  import Ecto.Query

  alias Ethos.Adjacency
  alias Ethos.Foliage.Routes
  alias Ethos.Guides.Guide
  alias Ethos.Links
  alias Ethos.Repo

  def build! do
    published =
      Repo.all(from g in Guide, where: g.status == "published", select: g.slug) |> MapSet.new()

    {written, skipped} =
      Enum.reduce(Adjacency.ordered_pairs(), {0, 0}, fn {a, b}, {written, skipped} ->
        with slug_a when not is_nil(slug_a) <- Routes.guide_slug_for(a, published),
             slug_b when not is_nil(slug_b) <- Routes.guide_slug_for(b, published) do
          upsert(slug_a, slug_b)
          {written + 1, skipped}
        else
          _ -> {written, skipped + 1}
        end
      end)

    Logger.info("adjacency links: #{written} borders written, #{skipped} skipped")
    :ok
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
