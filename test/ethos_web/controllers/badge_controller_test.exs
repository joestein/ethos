defmodule EthosWeb.BadgeControllerTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.{Places, Social}

  setup :register_and_log_in_user

  test "shows earned and locked badges", %{conn: conn, user: user} do
    place =
      Places.upsert_place!(%{
        slug: "p1",
        name: "P1",
        kind: "museum",
        town: "Waterbury",
        state: "Connecticut",
        county: "New Haven County",
        summary: "x"
      })

    {:ok, :added} = Social.react(user, place, "up")

    html = conn |> get(~p"/badges") |> html_response(200)
    assert html =~ "First Steps"
    assert html =~ "Earned"
    assert html =~ "Local Foodie"
  end

  test "requires auth" do
    conn = build_conn() |> get(~p"/badges")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
