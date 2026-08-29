defmodule EthosWeb.PageController do
  use EthosWeb, :controller

  import Ecto.Query
  alias Ethos.Guides.Guide
  alias Ethos.Repo
  alias EthosWeb.StructuredData

  # The layout appends " · Ethos" to whatever page_title is set, so this reads
  # as "Travel guides from real trips · Ethos". Leaving it unset rendered the
  # site name twice.
  @page_title "Travel guides from real trips"

  # Named destinations rather than a generic claim, because these are the only
  # three the corpus actually covers: every Connecticut town, the Manhattan and
  # Brooklyn neighborhoods, and Rome.
  @description "Travel guides written from real trips — Connecticut town by town, Manhattan and Brooklyn neighborhood by neighborhood, and three days in Rome."

  def home(conn, _params) do
    featured =
      Repo.one(
        from g in Guide,
          where: g.status == "published",
          order_by: [desc: g.view_count, desc: g.id],
          limit: 1
      )

    latest =
      Repo.all(
        from g in Guide,
          where: g.status == "published" and g.id != ^((featured && featured.id) || 0),
          order_by: [desc: g.updated_at, desc: g.id],
          limit: 6
      )

    render(conn, :home,
      featured: featured,
      latest: latest,
      layout: false,
      page_title: @page_title,
      page_meta_description: @description,
      page_canonical: url(~p"/"),
      page_og: %{
        title: "Ethos — travel guides from real trips",
        description: @description,
        type: "website",
        url: url(~p"/"),
        # No raster share image exists yet; the layout omits og:image when this
        # is nil rather than publishing an empty one.
        image: nil
      },
      json_ld: [StructuredData.organization(), StructuredData.website()]
    )
  end
end
