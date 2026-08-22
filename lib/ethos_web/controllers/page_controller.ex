defmodule EthosWeb.PageController do
  use EthosWeb, :controller

  import Ecto.Query
  alias Ethos.Guides.Guide
  alias Ethos.Repo

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

    render(conn, :home, featured: featured, latest: latest, layout: false)
  end
end
