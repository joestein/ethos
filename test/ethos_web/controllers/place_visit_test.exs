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

  # Badges are now earned by reacting (see Ethos.Social.react/3), not by this
  # legacy check-off — checking off a place no longer writes a reaction, so it
  # cannot satisfy a badge rule on its own. This whole flow is removed in
  # Task 7 along with this test file.
  test "checking off a place does not award a badge on its own", %{conn: conn} do
    place = Places.upsert_place!(@attrs)

    conn = post(conn, ~p"/p/#{place.slug}/visit")

    refute Phoenix.Flash.get(conn.assigns.flash, :info) =~ "Badge earned:"
    assert Phoenix.Flash.get(conn.assigns.flash, :info) =~ "Checked off #{place.name}!"
  end

  test "requires auth" do
    conn = build_conn()
    place = Places.upsert_place!(@attrs)
    conn = post(conn, ~p"/p/#{place.slug}/visit")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
