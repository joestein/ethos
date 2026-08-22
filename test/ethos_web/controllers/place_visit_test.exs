defmodule EthosWeb.PlaceVisitTest do
  use EthosWeb.ConnCase, async: true

  alias Ethos.{Places, Visits}

  @attrs %{
    slug: "mattatuck-museum",
    name: "Mattatuck Museum",
    kind: "museum",
    town: "Waterbury",
    state: "Connecticut",
    county: "New Haven County",
    summary: "x"
  }

  setup :register_and_log_in_user

  test "POST toggles visit and flashes", %{conn: conn, user: user} do
    place = Places.upsert_place!(@attrs)

    conn2 = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn2) == ~p"/p/#{place.slug}"
    assert Visits.visited?(user, place)

    conn3 = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn3) == ~p"/p/#{place.slug}"
    refute Visits.visited?(user, place)
  end

  test "closed place flashes error", %{conn: conn} do
    place = Places.upsert_place!(Map.put(@attrs, :status, "closed"))
    conn = post(conn, ~p"/p/#{place.slug}/visit")
    assert Phoenix.Flash.get(conn.assigns.flash, :error) =~ "permanently closed"
  end

  test "requires auth" do
    conn = build_conn()
    place = Places.upsert_place!(@attrs)
    conn = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
