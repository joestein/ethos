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

  describe "rendering inside the guide page" do
    test "no reaction buttons are rendered for anyone", %{conn: conn, guide: guide} do
      Social.react(user_fixture(), guide, "up")

      anon = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      signed_in =
        conn |> log_in_user(user_fixture()) |> get(~p"/g/#{guide.slug}") |> html_response(200)

      for html <- [anon, signed_in] do
        assert html |> Floki.parse_document!() |> Floki.find(~s([phx-click="react"])) == []
        refute html =~ "data-reaction-count"
      end
    end
  end

  describe "reacting" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture())}
    end

    test "clicking up records a reaction and shows the count", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      render_click(view, "react", %{"value" => "up"})

      assert Social.counts(guide) == %{up: 1, down: 0}
    end

    test "clicking up twice clears it", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      render_click(view, "react", %{"value" => "up"})
      render_click(view, "react", %{"value" => "up"})

      assert Social.counts(guide) == %{up: 0, down: 0}
    end

    test "clicking down after up switches", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(conn, guide)

      render_click(view, "react", %{"value" => "up"})
      render_click(view, "react", %{"value" => "down"})

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

  describe "closed places" do
    import Ethos.PlacesFixtures

    test "a closed place renders read-only with an explanatory line, even for a logged-in user",
         %{conn: conn} do
      place = place_fixture(%{status: "closed"})

      {:ok, view, html} =
        live_isolated(log_in_user(conn, user_fixture()), EthosWeb.SocialLive,
          session: %{"subject_type" => "place", "subject_id" => place.id}
        )

      refute has_element?(view, "button[phx-value-value=up]")
      refute has_element?(view, "button[phx-value-value=down]")
      assert html =~ "permanently closed"
    end

    test "a forged react event against a closed place is refused", %{conn: conn} do
      place = place_fixture(%{status: "closed"})

      {:ok, view, _html} =
        live_isolated(log_in_user(conn, user_fixture()), EthosWeb.SocialLive,
          session: %{"subject_type" => "place", "subject_id" => place.id}
        )

      render_click(view, "react", %{"value" => "up"})

      assert Social.counts(place) == %{up: 0, down: 0}
    end

    # Reviews used to share the reactions' `interactive?/2` predicate, which
    # answers false for a closed place — so the review form vanished right
    # alongside the thumbs. That silently trapped a closed place's pending
    # reviews forever: their author could never edit one back into an
    # approvable shape. A closed place is exactly the kind of thing people
    # want to leave a considered review about, so the form has its own
    # predicate now and stays up regardless.
    test "a closed place still offers the review form to a logged-in user with a username",
         %{conn: conn} do
      place = place_fixture(%{status: "closed"})

      {:ok, view, _html} =
        live_isolated(log_in_user(conn, user_fixture()), EthosWeb.SocialLive,
          session: %{"subject_type" => "place", "subject_id" => place.id}
        )

      assert has_element?(view, "#review-form")
    end

    test "an author with a pending review can still edit it after the place closes",
         %{conn: conn} do
      user = user_fixture()
      place = place_fixture()

      {:ok, _review} =
        Social.create_review(user, place, %{"rating" => "6", "body" => "Nice spot."})

      place |> Ecto.Changeset.change(status: "closed") |> Ethos.Repo.update!()

      {:ok, view, _html} =
        live_isolated(log_in_user(conn, user), EthosWeb.SocialLive,
          session: %{"subject_type" => "place", "subject_id" => place.id}
        )

      assert has_element?(view, "#review-form")

      view |> element("button[phx-value-rating=9]") |> render_click()

      html =
        view
        |> form("#review-form", review: %{body: "Updated after closing."})
        |> render_submit()

      assert html =~ "Updated after closing."

      updated = Social.user_review(user, place)
      assert updated.body == "Updated after closing."
      assert updated.status == "pending"
    end
  end

  describe "badge flash" do
    import Ethos.PlacesFixtures

    test "a newly earned badge appears in the flash", %{conn: conn} do
      user = user_fixture()
      place = place_fixture()

      {:ok, view, _html} =
        live_isolated(log_in_user(conn, user), EthosWeb.SocialLive,
          session: %{"subject_type" => "place", "subject_id" => place.id}
        )

      render_click(view, "react", %{"value" => "up"})

      # Scoped to the flash element itself: the site nav has its own "Badges"
      # link, so a bare `html =~ "Badge"` would pass even with no flash at all.
      assert view |> element("#social-badge-flash") |> render() =~ "First Steps"
    end

    test "reacting to a guide never queries or flashes badges", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_isolated_social(log_in_user(conn, user_fixture()), guide)

      render_click(view, "react", %{"value" => "up"})

      refute has_element?(view, "#social-badge-flash")
    end
  end

  defp live_isolated_social(conn, guide) do
    live_isolated(conn, EthosWeb.SocialLive,
      session: %{"subject_type" => "guide", "subject_id" => guide.id}
    )
  end
end
