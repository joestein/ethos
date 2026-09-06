defmodule EthosWeb.GuideAuthoringAccessTest do
  @moduledoc """
  Guide authoring is the admin's tool now.

  Nothing is deleted — the LiveViews, the AI agents and the import pipeline all
  still work — but a regular user has no door to them and no sign one exists.

  `async: false` because `admin_fixture/1` inserts the configured admin email.
  """
  use EthosWeb.ConnCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Guides

  @authoring_paths ["/guides", "/guides/new"]

  describe "a regular logged-in user" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture(%{email: "regular@example.com"}))}
    end

    test "gets a 404 from every authoring path", %{conn: conn} do
      for path <- @authoring_paths do
        assert conn |> get(path) |> html_response(404),
               "expected 404 from #{path}"
      end
    end

    test "gets a 404 from the per-guide authoring paths", %{conn: conn} do
      guide = guide_fixture()

      for path <- ["/guides/#{guide.id}/edit", "/guides/#{guide.id}/share"] do
        assert conn |> get(path) |> html_response(404),
               "expected 404 from #{path}"
      end
    end

    test "sees no authoring links in the header", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      refute html =~ "Make a guide"
      refute html =~ "Your guides"
    end

    test "does not see the research form on a published guide page", %{conn: conn} do
      guide = published_guide_fixture()

      {:ok, _entry} =
        Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      refute html =~ "/research"
    end
  end

  describe "the admin" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, admin_fixture())}
    end

    test "can still reach the authoring paths", %{conn: conn} do
      for path <- @authoring_paths do
        assert conn |> get(path) |> html_response(200),
               "expected 200 from #{path}"
      end
    end

    test "still sees the authoring links", %{conn: conn} do
      html = conn |> get(~p"/") |> html_response(200)

      assert html =~ "Make a guide"
    end

    test "sees the research form on a published guide page", %{conn: conn} do
      guide = published_guide_fixture()

      {:ok, _entry} =
        Guides.create_entry(guide, %{kind: "food", name: "Ramiro", verdict: "loved"})

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "/research"
    end
  end

  test "a logged-out visitor is sent to log in, not 404ed", %{conn: conn} do
    # The authentication guard runs first, so a stranger gets the normal login
    # redirect rather than a 404 that would tell them the path exists.
    assert conn |> get("/guides/new") |> redirected_to() == ~p"/users/log_in"
  end
end
