defmodule EthosWeb.SocialReviewsLiveTest do
  use EthosWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    %{guide: published_guide_fixture()}
  end

  defp live_island(conn, guide) do
    live_isolated(conn, EthosWeb.SocialLive,
      session: %{"subject_type" => "guide", "subject_id" => guide.id}
    )
  end

  describe "the form" do
    test "a logged-out visitor gets no review form", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      refute has_element?(view, "#review-form")
    end

    test "a logged-in user gets a form with ten rating buttons", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(log_in_user(conn, user_fixture()), guide)

      assert has_element?(view, "#review-form")

      for rating <- 1..10 do
        assert has_element?(view, "button[phx-value-rating=#{rating}]")
      end
    end
  end

  describe "submitting" do
    setup %{conn: conn} do
      %{conn: log_in_user(conn, user_fixture())}
    end

    test "a rating and comment creates a pending review", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      view |> element("button[phx-value-rating=8]") |> render_click()

      html =
        view
        |> form("#review-form", review: %{body: "Genuinely good."})
        |> render_submit()

      assert html =~ "waiting to be approved"
      assert Social.approved_reviews(guide) == []
    end

    test "the pending review is not shown to anyone else", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)
      view |> element("button[phx-value-rating=8]") |> render_click()
      view |> form("#review-form", review: %{body: "Not yet public."}) |> render_submit()

      {:ok, _other, html} = live_island(build_conn(), guide)

      refute html =~ "Not yet public."
    end

    test "an empty comment is refused", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      view |> element("button[phx-value-rating=8]") |> render_click()
      html = view |> form("#review-form", review: %{body: ""}) |> render_submit()

      assert html =~ "can&#39;t be blank" or html =~ "can't be blank"
    end

    test "submitting without choosing a rating is refused", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      html = view |> form("#review-form", review: %{body: "No stars picked."}) |> render_submit()

      assert html =~ "Pick a rating"
    end
  end

  describe "the approved list" do
    test "shows an approved review with the author's username", %{conn: conn, guide: guide} do
      author = user_fixture(%{username: "voyager"})
      admin = user_fixture()
      {:ok, review} = Social.create_review(author, guide, %{"rating" => "9", "body" => "Superb."})
      {:ok, _} = Moderation.approve_review(review, admin)

      {:ok, _view, html} = live_island(conn, guide)

      assert html =~ "Superb."
      assert html =~ "voyager"
      assert html =~ "9"
    end

    test "shows the average out of ten", %{conn: conn, guide: guide} do
      admin = user_fixture()

      for rating <- [7, 8, 10] do
        {:ok, review} =
          Social.create_review(user_fixture(), guide, %{
            "rating" => to_string(rating),
            "body" => "Scored."
          })

        {:ok, _} = Moderation.approve_review(review, admin)
      end

      {:ok, _view, html} = live_island(conn, guide)

      assert html =~ "8.3"
    end

    test "shows nothing about ratings when there are none", %{conn: conn, guide: guide} do
      {:ok, _view, html} = live_island(conn, guide)

      refute html =~ "out of 10"
    end
  end

  describe "editing" do
    test "an approved review returns to pending when its author edits it", %{
      conn: conn,
      guide: guide
    } do
      author = user_fixture()
      admin = user_fixture()
      {:ok, review} = Social.create_review(author, guide, %{"rating" => "9", "body" => "First."})
      {:ok, _} = Moderation.approve_review(review, admin)

      {:ok, view, _html} = live_island(log_in_user(conn, author), guide)

      view |> element("button[phx-value-rating=4]") |> render_click()
      view |> form("#review-form", review: %{body: "Edited afterwards."}) |> render_submit()

      assert Social.approved_reviews(guide) == []
      assert Social.user_review(author, guide).status == "pending"
    end
  end

  # These bypass the rendered DOM on purpose. Every test above drives buttons
  # and forms that the template controls, so none of them can ever send a
  # frame the DOM itself would refuse to produce. `render_click/3` fires the
  # named event with arbitrary params directly against the LiveView process,
  # the same way a crafted socket message would — which is exactly what
  # caught `handle_event("rate", ...)` calling `String.to_integer/1` on
  # unchecked client input and crashing the island.
  describe "adversarial input" do
    setup %{conn: conn} do
      user = user_fixture()
      %{conn: log_in_user(conn, user), user: user}
    end

    test "a non-numeric rating does not crash the island", %{
      conn: conn,
      guide: guide,
      user: user
    } do
      {:ok, view, _html} = live_island(conn, guide)

      render_click(view, "rate", %{"rating" => "abc"})

      html = render(view)
      assert html =~ "review-form"
      assert Social.user_review(user, guide) == nil
    end

    test "an out-of-range rating is not accepted, including trailing garbage", %{
      conn: conn,
      guide: guide,
      user: user
    } do
      {:ok, view, _html} = live_island(conn, guide)

      render_click(view, "rate", %{"rating" => "99"})
      render_click(view, "rate", %{"rating" => "5x"})

      view |> form("#review-form", review: %{body: "Trying to cheat."}) |> render_submit()

      assert Social.user_review(user, guide) == nil
    end

    test "a missing rating key does not crash", %{conn: conn, guide: guide} do
      {:ok, view, _html} = live_island(conn, guide)

      render_click(view, "rate", %{})

      html = render(view)
      assert html =~ "review-form"
    end

    test "a logged-out session cannot submit a review directly", %{guide: guide} do
      {:ok, view, _html} = live_island(build_conn(), guide)

      render_click(view, "submit_review", %{"review" => %{"body" => "Sneaky."}})

      assert Social.approved_reviews(guide) == []
    end
  end
end
