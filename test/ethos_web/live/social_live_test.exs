defmodule EthosWeb.SocialLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social

  setup do
    # published_guide_fixture/0, not guide_fixture/1 — guide_fixture builds a DRAFT,
    # and these tests fetch the guide's public page.
    %{guide: published_guide_fixture()}
  end

  # Reads the count rendered beneath one thumb. Scoped to the element rather than
  # asserting `html =~ "1"`, which would pass on any stray digit anywhere on the page.
  defp rendered_count(html, value) do
    html
    |> Floki.parse_document!()
    |> Floki.find(~s([data-reaction-count="#{value}"]))
    |> Floki.text()
    |> String.trim()
  end

  describe "rendering inside the guide page" do
    test "a logged-out visitor sees counts and a login prompt", %{conn: conn, guide: guide} do
      Social.react(user_fixture(), guide, "up")

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "Log in to react"
      assert rendered_count(html, "up") == "1"
      assert rendered_count(html, "down") == "0"
    end

    test "a logged-in user gets working buttons", %{conn: conn, guide: guide} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      {:ok, view, _html} = live_isolated_social(conn, guide)

      assert has_element?(view, "button[phx-value-value=up]")
      assert has_element?(view, "button[phx-value-value=down]")
    end
  end

  describe "reacting" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture())}
    end

    test "clicking up records a reaction and shows the count", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      html = view |> element("button[phx-value-value=up]") |> render_click()

      assert rendered_count(html, "up") == "1"
      assert Social.counts(guide) == %{up: 1, down: 0}
    end

    test "clicking up twice clears it", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      view |> element("button[phx-value-value=up]") |> render_click()
      view |> element("button[phx-value-value=up]") |> render_click()

      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "clicking down after up switches", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      view |> element("button[phx-value-value=up]") |> render_click()
      view |> element("button[phx-value-value=down]") |> render_click()

      assert Social.counts(guide) == %{up: 0, down: 1}
    end
  end

  describe "provisional usernames" do
    test "a user who has not chosen a username is prompted instead", %{conn: conn, guide: guide} do
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, view, html} = live_isolated_social(log_in_user(conn, user), guide)

      assert html =~ "Pick a username"
      refute has_element?(view, "button[phx-value-value=up]")
    end

    test "the event handler refuses even if the button is forged", %{conn: conn, guide: guide} do
      user =
        user_fixture()
        |> Ecto.Changeset.change(username_provisional: true)
        |> Ethos.Repo.update!()

      {:ok, view, _html} = live_isolated_social(log_in_user(conn, user), guide)

      render_click(view, "react", %{"value" => "up"})

      assert Social.counts(guide) == %{up: 0, down: 0}
    end
  end

  defp live_isolated_social(conn, guide) do
    live_isolated(conn, EthosWeb.SocialLive,
      session: %{"subject_type" => "guide", "subject_id" => guide.id}
    )
  end
end
