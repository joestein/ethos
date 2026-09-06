defmodule Ethos.Foliage.LinkBuilder do
  @moduledoc """
  Writes `same-region` edges between the guides that share a foliage driving
  route, so each town guide gains inbound links from its neighbours through the
  existing `ConnectedPages` component rather than through new plumbing.

  Skip-if-missing, like `Ethos.Seeds.BackfillLinks`: an unpublished guide is a
  corpus state, not a programming error.
  """

  require Logger

  alias Ethos.Foliage
  alias Ethos.Links

  def build! do
    for route <- Foliage.routes() do
      slugs = Enum.map(route.stops, & &1.guide_slug)

      for {source, index} <- Enum.with_index(slugs),
          target <- Enum.slice(slugs, (index + 1)..(index + 2)//1) do
        upsert(source, target, route.name)
      end
    end

    :ok
  end

  defp upsert(source, target, note) do
    Links.upsert_link!(%{
      source: {:guide, source},
      target: {:guide, target},
      kind: "same-region",
      note: "Both on the #{note} foliage route"
    })
  rescue
    ArgumentError ->
      Logger.warning("foliage links: skipped #{source} -> #{target}, guide missing")
      :ok
  end
end
