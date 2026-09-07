defmodule EthosWeb.AdminSeasonController do
  use EthosWeb, :controller

  alias Ethos.Seasons
  alias Ethos.SiteSettings

  def index(conn, _params) do
    render(conn, :index,
      override: SiteSettings.season_override(),
      active: SiteSettings.active_season(),
      seasons: Seasons.all(),
      page_title: "Season"
    )
  end

  def update(conn, %{"season" => "auto"}) do
    {:ok, _} = SiteSettings.put_season_override(nil)

    conn
    |> put_flash(:info, "Following the calendar again.")
    |> redirect(to: ~p"/admin/season")
  end

  def update(conn, %{"season" => season}) when is_binary(season) do
    # The form posts a string; only a string naming one of the four seasons
    # is converted. Anything else is refused here rather than reaching
    # SiteSettings, so no unknown value ever gets near an atom conversion.
    case Enum.find(Seasons.all(), &(Atom.to_string(&1) == season)) do
      nil ->
        conn
        |> put_flash(:error, "That is not a season.")
        |> redirect(to: ~p"/admin/season")

      found ->
        {:ok, _} = SiteSettings.put_season_override(found)

        conn
        |> put_flash(:info, "The site is now #{found}.")
        |> redirect(to: ~p"/admin/season")
    end
  end

  # A post with no season at all, rather than a 500.
  def update(conn, _params) do
    conn
    |> put_flash(:error, "Choose a season.")
    |> redirect(to: ~p"/admin/season")
  end
end
