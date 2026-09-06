defmodule Ethos.ModerationBanTest do
  # async: false — admin_fixture/1 inserts the configured admin email, and
  # concurrent inserts of that unique value deadlock.
  use Ethos.DataCase, async: false

  import Ethos.AccountsFixtures
  import Ethos.GuidesFixtures

  alias Ethos.Accounts
  alias Ethos.Moderation
  alias Ethos.Social

  setup do
    %{admin: admin_fixture(), user: user_fixture(), guide: guide_fixture()}
  end

  describe "ban_user/3" do
    test "records the ban and its reason", %{admin: admin, user: user} do
      assert {:ok, banned} = Moderation.ban_user(user, "Spamming every guide.", admin)

      assert banned.banned_at
      assert banned.ban_reason == "Spamming every guide."
      assert Moderation.banned?(banned)
    end

    test "revokes every session the user holds", %{admin: admin, user: user} do
      token_one = Accounts.generate_user_session_token(user)
      token_two = Accounts.generate_user_session_token(user)

      assert Accounts.get_user_by_session_token(token_one)
      assert Accounts.get_user_by_session_token(token_two)

      {:ok, _} = Moderation.ban_user(user, "Enough.", admin)

      refute Accounts.get_user_by_session_token(token_one)
      refute Accounts.get_user_by_session_token(token_two)
    end

    test "hides the user's approved reviews from the public", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "9", "body" => "Great."})
      {:ok, _} = Moderation.approve_review(review, admin)

      assert length(Social.approved_reviews(guide)) == 1

      {:ok, _} = Moderation.ban_user(user, "Enough.", admin)

      assert Social.approved_reviews(guide) == []
      assert Social.rating_summary(guide) == %{average: nil, count: 0}
    end

    test "refuses a non-admin", %{user: user} do
      assert {:error, :unauthorized} = Moderation.ban_user(user, "No.", user_fixture())
    end

    # The sharp case this closes: a trusted author with an open LiveView
    # socket, banned mid-session, whose process still holds the pre-ban
    # `current_user` and would otherwise keep minting fast-laned "approved"
    # reviews nobody moderates. The disconnect is what forces that process
    # to re-authenticate (and fail, per mount_current_user's ban check)
    # instead of continuing to run as the banned user.
    test "disconnects every live socket the user holds", %{admin: admin, user: user} do
      token_one = Accounts.generate_user_session_token(user)
      token_two = Accounts.generate_user_session_token(user)

      topic_one = "users_sessions:#{Base.url_encode64(token_one)}"
      topic_two = "users_sessions:#{Base.url_encode64(token_two)}"

      EthosWeb.Endpoint.subscribe(topic_one)
      EthosWeb.Endpoint.subscribe(topic_two)

      {:ok, _} = Moderation.ban_user(user, "Enough.", admin)

      assert_receive %Phoenix.Socket.Broadcast{event: "disconnect", topic: ^topic_one}
      assert_receive %Phoenix.Socket.Broadcast{event: "disconnect", topic: ^topic_two}
    end

    test "a rolled-back ban (blank reason) does not disconnect anyone", %{
      admin: admin,
      user: user
    } do
      token = Accounts.generate_user_session_token(user)
      topic = "users_sessions:#{Base.url_encode64(token)}"

      EthosWeb.Endpoint.subscribe(topic)

      assert {:error, _changeset} = Moderation.ban_user(user, "", admin)

      refute_receive %Phoenix.Socket.Broadcast{event: "disconnect", topic: ^topic}
    end

    test "refuses to ban the admin", %{admin: admin} do
      assert {:error, :cannot_ban_admin} = Moderation.ban_user(admin, "Oops.", admin)
    end

    test "requires a reason", %{admin: admin, user: user} do
      assert {:error, changeset} = Moderation.ban_user(user, "", admin)
      assert %{ban_reason: _} = errors_on(changeset)
    end
  end

  describe "unban_user/2" do
    test "clears the ban and restores the user's reviews", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "9", "body" => "Back."})
      {:ok, _} = Moderation.approve_review(review, admin)
      {:ok, banned} = Moderation.ban_user(user, "Temporary.", admin)

      assert Social.approved_reviews(guide) == []

      assert {:ok, restored} = Moderation.unban_user(banned, admin)

      refute restored.banned_at
      refute restored.ban_reason
      assert length(Social.approved_reviews(guide)) == 1
    end

    test "refuses a non-admin", %{admin: admin, user: user} do
      {:ok, banned} = Moderation.ban_user(user, "Enough.", admin)

      assert {:error, :unauthorized} = Moderation.unban_user(banned, user_fixture())
    end
  end

  describe "approving trusts the author" do
    test "the first approval sets trusted_at", %{admin: admin, user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "8", "body" => "Good."})

      refute Ethos.Repo.reload!(user).trusted_at

      {:ok, _} = Moderation.approve_review(review, admin)

      assert Ethos.Repo.reload!(user).trusted_at
    end

    test "a later approval does not move trusted_at", %{admin: admin, user: user, guide: guide} do
      {:ok, first} = Social.create_review(user, guide, %{"rating" => "8", "body" => "One."})
      {:ok, _} = Moderation.approve_review(first, admin)

      trusted_at = Ethos.Repo.reload!(user).trusted_at

      {:ok, second} =
        Social.create_review(user, guide_fixture(), %{"rating" => "7", "body" => "Two."})

      {:ok, _} = Moderation.approve_review(second, admin)

      assert Ethos.Repo.reload!(user).trusted_at == trusted_at
    end

    test "revoking does not trust anyone", %{admin: admin, user: user, guide: guide} do
      {:ok, review} = Social.create_review(user, guide, %{"rating" => "2", "body" => "Bad."})

      {:ok, _} = Moderation.revoke_review(review, admin)

      refute Ethos.Repo.reload!(user).trusted_at
    end
  end

  describe "trust_user/2 and untrust_user/2" do
    test "trusting by hand skips the earn-it path", %{admin: admin, user: user} do
      assert {:ok, trusted} = Moderation.trust_user(user, admin)
      assert trusted.trusted_at
    end

    test "untrusting sends the author back to the queue", %{
      admin: admin,
      user: user,
      guide: guide
    } do
      {:ok, trusted} = Moderation.trust_user(user, admin)
      assert {:ok, untrusted} = Moderation.untrust_user(trusted, admin)

      refute untrusted.trusted_at

      {:ok, review} =
        Social.create_review(untrusted, guide, %{"rating" => "8", "body" => "Back in line."})

      assert review.status == "pending"
    end

    test "trusting again does not move an existing date", %{admin: admin, user: user} do
      {:ok, trusted} = Moderation.trust_user(user, admin)
      {:ok, again} = Moderation.trust_user(trusted, admin)

      assert again.trusted_at == trusted.trusted_at
    end

    test "both refuse a non-admin", %{user: user} do
      assert {:error, :unauthorized} = Moderation.trust_user(user, user_fixture())
      assert {:error, :unauthorized} = Moderation.untrust_user(user, user_fixture())
    end

    # The admin is not a moderation target — the same invariant ban_user/3
    # holds. Without this, the Users tab let the admin self-trust then
    # self-untrust with no crafted id needed, since the template rendered
    # both buttons on the admin's own row.
    test "both refuse the admin as a target, even from the admin themself", %{admin: admin} do
      assert {:error, :cannot_target_admin} = Moderation.trust_user(admin, admin)
      assert {:error, :cannot_target_admin} = Moderation.untrust_user(admin, admin)
    end

    test "trust still refuses a non-admin caller before checking the target", %{admin: admin} do
      assert {:error, :unauthorized} = Moderation.trust_user(admin, user_fixture())
    end
  end
end
