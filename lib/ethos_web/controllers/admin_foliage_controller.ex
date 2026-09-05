defmodule EthosWeb.AdminFoliageController do
  use EthosWeb, :controller

  alias Ethos.Foliage
  alias Ethos.Foliage.Note

  def index(conn, _params) do
    render(conn, :index,
      changeset: Note.changeset(%Note{}, %{}),
      notes: Note.list(),
      routes: Foliage.routes(),
      page_title: "Field notes"
    )
  end

  def create(conn, %{"note" => params}) do
    case Note.create(normalize(params)) do
      {:ok, _note} ->
        conn
        |> put_flash(:info, "Note published.")
        |> redirect(to: ~p"/admin/foliage/notes")

      {:error, changeset} ->
        render(conn, :index,
          changeset: changeset,
          notes: Note.list(),
          routes: Foliage.routes(),
          page_title: "Field notes"
        )
    end
  end

  # An empty select renders as "", which is not the nil the statewide-scope
  # validation expects.
  defp normalize(%{"ref" => ""} = params), do: Map.put(params, "ref", nil)
  defp normalize(params), do: params
end
