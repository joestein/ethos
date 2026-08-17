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

    render(conn, :home, featured: featured, layout: false)
  end
end
