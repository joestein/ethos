defmodule EthosWeb.Plugs.PutSeasonTest do
  use EthosWeb.ConnCase, async: true

  alias EthosWeb.Plugs.PutSeason

  test "assigns the calendar season", %{conn: conn} do
    assert PutSeason.call(conn, []).assigns.season in Ethos.Seasons.all()
  end

  test "assigns the override when one is set", %{conn: conn} do
    {:ok, _} = Ethos.SiteSettings.put_season_override(:winter)

    assert PutSeason.call(conn, []).assigns.season == :winter
  end
end
