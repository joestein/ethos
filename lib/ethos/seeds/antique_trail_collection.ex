defmodule Ethos.Seeds.AntiqueTrailCollection do
  @moduledoc """
  Seeds the Antique Trail of CT collection. Idempotent by slug.

  The Woodbury town guide is an item here as well as the trail guide itself.
  That is what makes the Woodbury page show "Part of Antique Trail of CT"
  under its title — `guide_html/show.html.heex` renders a line for every
  published collection the guide belongs to.
  """

  alias Ethos.Collections

  def upsert! do
    Collections.upsert_collection!(%{
      slug: "antique-trail-of-ct",
      title: "Antique Trail of CT",
      published: true,
      intro: """
      Woodbury's antiques dealers stand along one street, listed by a
      Connecticut dealers' association and by the state tourism office. This
      collection pairs the shop-by-shop trail with the town guide that gives
      the street its context — the Glebe House, the Jekyll garden, and the
      places to eat between stops. The trail begins in Woodbury and has room
      to grow.
      """,
      items: [
        %{
          guide_slug: "antique-trail-of-connecticut",
          blurb:
            "Sixteen dealers on Woodbury's Main Street and a Saturday flea market at Route 64 — address, stock, and where the published hours disagree."
        },
        %{
          guide_slug: "woodbury-ct-travel-guide",
          blurb:
            "The town the trail runs through: the Glebe House, the only public Gertrude Jekyll garden in America, and Main Street's restaurants and inn."
        }
      ]
    })
  end
end
