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

    all_hubs = Ethos.Guides.list_country_hubs()

    # /destinations (destination_controller.ex) lists the roots of the
    # destination tree and nothing else — everything below a country is reached
    # by walking into it. The homepage's "All N destinations" count must match
    # the page it links to, so it counts roots, not the hubs shown above it and
    # not every node in the tree.
    hub_count = length(Ethos.Destinations.roots())

    render(conn, :home,
      featured: featured,
      latest: latest,
      hubs: Enum.take(all_hubs, 5),
      hub_count: hub_count,
      collections: Ethos.Collections.list_published(),
      foliage_routes: Ethos.Foliage.routes(),
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
