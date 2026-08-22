defmodule EthosWeb.BadgeController do
  use EthosWeb, :controller

  alias Ethos.Badges

  def index(conn, _params) do
    user = conn.assigns.current_user
    earned = Map.new(Badges.earned_badges(user), &{&1.badge_key, &1.awarded_at})

    render(conn, :index,
      definitions: Badges.definitions(),
      earned: earned,
      page_title: "Your badges"
    )
  end
end
