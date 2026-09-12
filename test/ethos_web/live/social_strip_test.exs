defmodule EthosWeb.SocialStripTest do
  @moduledoc """
  The compact strip that replaced the tall social block, and the modal behind
  it.

  The strip sits directly under the page title and above the destination line,
  so everything here is about it staying small, staying honest about what a
  visitor can do, and letting anyone read reviews whether or not they have an
  account.
  """
  # `async: false`: admin_fixture/1 inserts the configured admin email, and
  # concurrent inserts of the same address deadlock in Postgres.
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Social

  setup do
    %{guide: published_guide_fixture()}
  end

  defp doc(html), do: Floki.parse_document!(html)

  describe "the thumbs, logged out" do
    test "are a link to log in, not a dead control", %{conn: conn, guide: guide} do
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      # The defect this replaces: an inert <span> that differed from the real
      # <button> only by `opacity-60`. It looked exactly like a button, so
      # clicking it and getting nothing was the whole complaint. A visitor who
      # cannot react now gets a link to the thing that would let them.
      links =
        html
        |> doc()
        |> Floki.find(~s(a[href="/users/log_in"]))
        |> Enum.filter(&(Floki.find(&1, "[data-reaction-count]") != []))

      assert length(links) == 2, "expected both thumbs to be log-in links"

      refute html =~ "px-4 py-2 text-xl opacity-60",
             "the old inert thumb styling is still being rendered"
    end

    test "no react button is offered", %{conn: conn, guide: guide} do
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html |> doc() |> Floki.find(~s([phx-click="react"])) == []
    end
  end

  describe "the strip" do
    test "shows the average and review count once a review is approved", %{
      conn: conn,
      guide: guide
    } do
      author = user_fixture()
      {:ok, review} = Social.create_review(author, guide, %{"rating" => 8, "body" => "Good."})
      {:ok, _} = Ethos.Moderation.approve_review(review, admin_fixture())

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html =~ "8.0"
      assert html =~ "1 review"
    end

    test "invites the first review when there are none", %{conn: conn, guide: guide} do
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      # "0 reviews" reads as a dead end; the empty state is the one that most
      # needs to invite.
      assert html =~ "Be the first to review"
      refute html =~ "0 reviews"
    end

    test "sits above the destination line, under the title", %{conn: conn, guide: guide} do
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      # Scoped to the <header>, not the whole document. The destination also
      # appears in the title tag, og:description and JSON-LD, all of which come
      # earlier in the source — comparing positions across the whole page
      # compares against the <head> and is meaningless.
      header =
        html
        |> doc()
        |> Floki.find("article header")
        |> Floki.raw_html()

      title_at = :binary.match(header, guide.title) |> elem(0)
      strip_at = :binary.match(header, "data-reaction-count") |> elem(0)
      destination_at = :binary.match(header, guide.destination) |> elem(0)

      assert title_at < strip_at, "the strip should follow the title"
      assert strip_at < destination_at, "the strip should sit above the destination line"
    end
  end

  describe "the review modal" do
    test "a logged-out visitor can read approved reviews", %{conn: conn, guide: guide} do
      author = user_fixture(%{email: "reviewer@example.com"})
      {:ok, review} = Social.create_review(author, guide, %{"rating" => 9, "body" => "Worth it."})
      {:ok, _} = Ethos.Moderation.approve_review(review, admin_fixture())

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      # Reading is open to everyone — only adding needs an account. The modal's
      # contents are in the DOM and hidden by CSS, so this asserts the body is
      # genuinely served rather than fetched on open.
      assert html =~ "Worth it."
      refute html =~ "reviewer@example.com", "a reviewer's email must never be public"
    end

    test "a logged-out visitor is not offered the rating form", %{conn: conn, guide: guide} do
      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html |> doc() |> Floki.find(~s([phx-click="rate"])) == []
      assert html =~ "Log in to react"
    end

    test "a logged-in user with a username is offered the rating form", %{
      conn: conn,
      guide: guide
    } do
      conn = log_in_user(conn, user_fixture())

      html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

      assert html |> doc() |> Floki.find(~s([phx-click="rate"])) != []
    end
  end
end
