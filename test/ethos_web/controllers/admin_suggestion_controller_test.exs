defmodule EthosWeb.AdminSuggestionControllerTest do
  # async: false — `admin_conn/1` builds an admin via `admin_fixture/1`,
  # whose email is fixed (it must match the configured :admin_email).
  # Running alongside other async modules that do the same caused
  # intermittent Postgres deadlocks on the concurrent same-email inserts;
  # do not flip this back without giving admin fixtures distinct emails
  # instead.
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures
  alias Ethos.Contributions

  defp admin_conn(_) do
    admin = admin_fixture()
    %{conn: log_in_user(build_conn(), admin), admin: admin}
  end

  defp pending_suggestion do
    author = user_fixture()
    guide = published_guide_fixture(%{title: "Suggestible"})

    {:ok, s} =
      Contributions.create_suggestion(author, guide, %{
        place_name: "New Spot",
        body: "Try this",
        kind_hint: "food"
      })

    {s, guide, author}
  end

  describe "as admin" do
    setup :admin_conn

    test "lists all pending suggestions across guides", %{conn: conn} do
      {_s, guide, author} = pending_suggestion()
      html = conn |> get(~p"/admin/suggestions") |> html_response(200)
      assert html =~ "New Spot"
      assert html =~ guide.title
      assert html =~ author.username
    end

    test "accept creates credited entry; decline resolves; double-accept flashes error", %{
      conn: conn
    } do
      {s, guide, author} = pending_suggestion()

      conn2 = post(conn, ~p"/admin/suggestions/#{s.id}/accept")
      assert redirected_to(conn2) == ~p"/admin/suggestions"

      entries = Ethos.Guides.list_entries(guide)
      assert [entry] = Enum.filter(entries, &(&1.name == "New Spot"))
      assert entry.credited_user_id == author.id
      assert entry.source == "suggestion"

      conn3 = post(conn, ~p"/admin/suggestions/#{s.id}/accept")
      assert Phoenix.Flash.get(conn3.assigns.flash, :error) =~ "already"

      {s2, _g, _a} = pending_suggestion()
      post(conn, ~p"/admin/suggestions/#{s2.id}/decline")
      html = conn |> get(~p"/admin/suggestions") |> html_response(200)
      refute html =~ s2.place_name
    end
  end

  test "non-admin gets 404; logged-out redirected to log in" do
    user = user_fixture(%{email: "not-admin@example.com"})
    conn = log_in_user(build_conn(), user)
    assert conn |> get(~p"/admin/suggestions") |> html_response(404)

    conn = build_conn() |> get(~p"/admin/suggestions")
    assert redirected_to(conn) == ~p"/users/log_in"
  end
end
