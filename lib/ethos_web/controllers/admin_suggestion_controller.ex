defmodule EthosWeb.AdminSuggestionController do
  use EthosWeb, :controller

  alias Ethos.Contributions

  def index(conn, _params) do
    render(conn, :index,
      suggestions: Contributions.list_all_pending_suggestions(),
      page_title: "Suggestion queue"
    )
  end

  def accept(conn, %{"id" => id}) do
    suggestion = Contributions.get_suggestion_by_id!(id)

    case Contributions.accept_suggestion(suggestion) do
      {:ok, _} ->
        put_flash(conn, :info, "Accepted #{suggestion.place_name}.")

      {:error, :already_processed} ->
        put_flash(conn, :error, "That suggestion was already handled.")

      {:error, _} ->
        put_flash(conn, :error, "Could not accept that suggestion.")
    end
    |> redirect(to: ~p"/admin/suggestions")
  end

  def decline(conn, %{"id" => id}) do
    suggestion = Contributions.get_suggestion_by_id!(id)

    case Contributions.decline_suggestion(suggestion) do
      {:ok, _} ->
        put_flash(conn, :info, "Declined #{suggestion.place_name}.")

      {:error, :already_processed} ->
        put_flash(conn, :error, "That suggestion was already handled.")
    end
    |> redirect(to: ~p"/admin/suggestions")
  end
end
