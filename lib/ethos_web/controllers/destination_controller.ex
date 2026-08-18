defmodule EthosWeb.DestinationController do
  use EthosWeb, :controller

  # Shell controller added in Task 3 so `~p"/destinations"` and
  # `~p"/destinations/:slug"` verify at compile time. Filled in by Task 4.

  def index(conn, _params) do
    conn |> put_status(:not_found) |> text("not implemented")
  end

  def show(conn, %{"slug" => _slug}) do
    conn |> put_status(:not_found) |> text("not implemented")
  end
end
