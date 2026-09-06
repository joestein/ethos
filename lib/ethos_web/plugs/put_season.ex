defmodule EthosWeb.Plugs.PutSeason do
  @moduledoc """
  Assigns the season the page should render in.

  In the `:browser` pipeline so every HTML response carries it, including the
  404s `EthosWeb.UserAuth.require_admin_user/2` renders.
  """

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts), do: assign(conn, :season, Ethos.SiteSettings.active_season())
end
