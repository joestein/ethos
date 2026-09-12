defmodule EthosWeb.SocialBlockedThumbTest do
  @moduledoc """
  Where a thumb sends someone who cannot react.

  The destination has to follow the REASON, not the mere fact of being
  blocked. A signed-in visitor with no username was sent to `/users/log_in`,
  which redirects an authenticated visitor straight back out — so clicking a
  thumb appeared to do nothing at all.

  The reason also has to be visible in the strip. It used to live only inside
  the review modal, which meant a visitor had to open a dialog to discover why
  the thing they just clicked did not work.
  """
  use EthosWeb.ConnCase, async: true

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  setup do
    %{guide: published_guide_fixture()}
  end

  defp thumb_hrefs(html) do
    html
    |> Floki.parse_document!()
    |> Floki.find("a")
    |> Enum.filter(&(Floki.find(&1, "[data-reaction-count]") != []))
    |> Enum.map(&(Floki.attribute(&1, "href") |> List.first()))
  end

  test "a logged-out visitor is sent to log in", %{conn: conn, guide: guide} do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert thumb_hrefs(html) == ["/users/log_in", "/users/log_in"]
    assert html =~ "Log in to react"
  end

  test "a signed-in visitor with no username is sent to pick one", %{conn: conn, guide: guide} do
    # `username_provisional: true` is the shape Plan 1's backfill left on every
    # account that predated usernames.
    user = user_fixture()
    {:ok, user} = user |> Ecto.Changeset.change(username_provisional: true) |> Ethos.Repo.update()

    html = conn |> log_in_user(user) |> get(~p"/g/#{guide.slug}") |> html_response(200)

    # NOT /users/log_in. That page bounces an authenticated visitor away, which
    # is indistinguishable from the button being broken.
    assert thumb_hrefs(html) == ["/users/username", "/users/username"]
    assert html =~ "Pick a username to react"
  end

  test "the reason is visible in the strip, not only inside the modal", %{
    conn: conn,
    guide: guide
  } do
    html = conn |> get(~p"/g/#{guide.slug}") |> html_response(200)

    strip =
      html
      |> Floki.parse_document!()
      |> Floki.find("div.flex.flex-wrap.items-center")
      |> Floki.text()

    assert strip =~ "Log in to react",
           "the strip gives no reason; a visitor would have to open the modal to find it"
  end

  test "a user with a username gets real buttons", %{conn: conn, guide: guide} do
    html = conn |> log_in_user(user_fixture()) |> get(~p"/g/#{guide.slug}") |> html_response(200)

    assert thumb_hrefs(html) == []
    assert html |> Floki.parse_document!() |> Floki.find(~s([phx-click="react"])) != []
  end
end
