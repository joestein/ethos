defmodule EthosWeb.SearchController do
  use EthosWeb, :controller

  def index(conn, params) do
    q = Map.get(params, "q", "")
    results = Ethos.Search.query(q)

    render(conn, :index,
      q: q,
      results: results,
      noindex: true,
      page_title: if(q == "", do: "Search", else: "Search: #{q}")
    )
  end
end
