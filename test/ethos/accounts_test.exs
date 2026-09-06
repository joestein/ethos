defmodule Ethos.AccountsTest do
  use Ethos.DataCase

  alias Ethos.Accounts

  import Ethos.AccountsFixtures
  alias Ethos.Accounts.{User, UserToken}

  describe "get_user_by_email/1" do
    test "does not return the user if the email does not exist" do
      refute Accounts.get_user_by_email("unknown@example.com")
    end

    test "returns the user if the email exists" do
      %{id: id} = user = user_fixture()
      assert %User{id: ^id} = Accounts.get_user_by_email(user.email)
    end
  end

  describe "get_user_by_email_and_password/2" do
    test "does not return the user if the email does not exist" do
      refute Accounts.get_user_by_email_and_password("unknown@example.com", "hello world!")
    end

    test "does not return the user if the password is not valid" do
      user = user_fixture()
      refute Accounts.get_user_by_email_and_password(user.email, "invalid")
    end

    test "returns the user if the email and password are valid" do
      %{id: id} = user = user_fixture()

      assert %User{id: ^id} =
               Accounts.get_user_by_email_and_password(user.email, valid_user_password())
    end
  end

  describe "get_user!/1" do
    test "raises if id is invalid" do
      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_user!(-1)
      end
    end

    test "returns the user with the given id" do
      %{id: id} = user = user_fixture()
      assert %User{id: ^id} = Accounts.get_user!(user.id)
    end
  end

  describe "register_user/1" do
    test "requires email and password to be set" do
      {:error, changeset} = Accounts.register_user(%{})

      assert %{
               password: ["can't be blank"],
               email: ["can't be blank"]
             } = errors_on(changeset)
    end

    test "validates email and password when given" do
      {:error, changeset} = Accounts.register_user(%{email: "not valid", password: "not valid"})

      assert %{
               email: ["must have the @ sign and no spaces"],
               password: ["should be at least 12 character(s)"]
             } = errors_on(changeset)
    end

    test "validates maximum values for email and password for security" do
      too_long = String.duplicate("db", 100)
      {:error, changeset} = Accounts.register_user(%{email: too_long, password: too_long})
      assert "should be at most 160 character(s)" in errors_on(changeset).email
      assert "should be at most 72 character(s)" in errors_on(changeset).password
    end

    test "validates email uniqueness" do
      %{email: email} = user_fixture()
      {:error, changeset} = Accounts.register_user(%{email: email})
      assert "has already been taken" in errors_on(changeset).email

      # Now try with the upper cased email too, to check that email case is ignored.
      {:error, changeset} = Accounts.register_user(%{email: String.upcase(email)})
      assert "has already been taken" in errors_on(changeset).email
    end

    test "registers users with a hashed password" do
      email = unique_user_email()
      {:ok, user} = Accounts.register_user(valid_user_attributes(email: email))
      assert user.email == email
      assert is_binary(user.hashed_password)
      assert is_nil(user.confirmed_at)
      assert is_nil(user.password)
    end
  end

  describe "change_user_registration/2" do
    test "returns a changeset" do
      assert %Ecto.Changeset{} = changeset = Accounts.change_user_registration(%User{})
      assert changeset.required == [:password, :username, :email]
    end

    test "allows fields to be set" do
      email = unique_user_email()
      password = valid_user_password()

      changeset =
        Accounts.change_user_registration(
          %User{},
          valid_user_attributes(email: email, password: password)
        )

      assert changeset.valid?
      assert get_change(changeset, :email) == email
      assert get_change(changeset, :password) == password
      assert is_nil(get_change(changeset, :hashed_password))
    end
  end

  describe "change_user_email/2" do
    test "returns a user changeset" do
      assert %Ecto.Changeset{} = changeset = Accounts.change_user_email(%User{})
      assert changeset.required == [:email]
    end
  end

  describe "apply_user_email/3" do
    setup do
      %{user: user_fixture()}
    end

    test "requires email to change", %{user: user} do
      {:error, changeset} = Accounts.apply_user_email(user, valid_user_password(), %{})
      assert %{email: ["did not change"]} = errors_on(changeset)
    end

    test "validates email", %{user: user} do
      {:error, changeset} =
        Accounts.apply_user_email(user, valid_user_password(), %{email: "not valid"})

      assert %{email: ["must have the @ sign and no spaces"]} = errors_on(changeset)
    end

    test "validates maximum value for email for security", %{user: user} do
      too_long = String.duplicate("db", 100)

      {:error, changeset} =
        Accounts.apply_user_email(user, valid_user_password(), %{email: too_long})

      assert "should be at most 160 character(s)" in errors_on(changeset).email
    end

    test "validates email uniqueness", %{user: user} do
      %{email: email} = user_fixture()
      password = valid_user_password()

      {:error, changeset} = Accounts.apply_user_email(user, password, %{email: email})

      assert "has already been taken" in errors_on(changeset).email
    end

    test "validates current password", %{user: user} do
      {:error, changeset} =
        Accounts.apply_user_email(user, "invalid", %{email: unique_user_email()})

      assert %{current_password: ["is not valid"]} = errors_on(changeset)
    end

    test "applies the email without persisting it", %{user: user} do
      email = unique_user_email()
      {:ok, user} = Accounts.apply_user_email(user, valid_user_password(), %{email: email})
      assert user.email == email
      assert Accounts.get_user!(user.id).email != email
    end
  end

  describe "deliver_user_update_email_instructions/3" do
    setup do
      %{user: user_fixture()}
    end

    test "sends token through notification", %{user: user} do
      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_update_email_instructions(user, "current@example.com", url)
        end)

      {:ok, token} = Base.url_decode64(token, padding: false)
      assert user_token = Repo.get_by(UserToken, token: :crypto.hash(:sha256, token))
      assert user_token.user_id == user.id
      assert user_token.sent_to == user.email
      assert user_token.context == "change:current@example.com"
    end
  end

  describe "update_user_email/2" do
    setup do
      user = user_fixture()
      email = unique_user_email()

      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_update_email_instructions(%{user | email: email}, user.email, url)
        end)

      %{user: user, token: token, email: email}
    end

    test "updates the email with a valid token", %{user: user, token: token, email: email} do
      assert Accounts.update_user_email(user, token) == :ok
      changed_user = Repo.get!(User, user.id)
      assert changed_user.email != user.email
      assert changed_user.email == email
      assert changed_user.confirmed_at
      assert changed_user.confirmed_at != user.confirmed_at
      refute Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not update email with invalid token", %{user: user} do
      assert Accounts.update_user_email(user, "oops") == :error
      assert Repo.get!(User, user.id).email == user.email
      assert Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not update email if user email changed", %{user: user, token: token} do
      assert Accounts.update_user_email(%{user | email: "current@example.com"}, token) == :error
      assert Repo.get!(User, user.id).email == user.email
      assert Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not update email if token expired", %{user: user, token: token} do
      {1, nil} = Repo.update_all(UserToken, set: [inserted_at: ~N[2020-01-01 00:00:00]])
      assert Accounts.update_user_email(user, token) == :error
      assert Repo.get!(User, user.id).email == user.email
      assert Repo.get_by(UserToken, user_id: user.id)
    end
  end

  describe "change_user_password/2" do
    test "returns a user changeset" do
      assert %Ecto.Changeset{} = changeset = Accounts.change_user_password(%User{})
      assert changeset.required == [:password]
    end

    test "allows fields to be set" do
      changeset =
        Accounts.change_user_password(%User{}, %{
          "password" => "new valid password"
        })

      assert changeset.valid?
      assert get_change(changeset, :password) == "new valid password"
      assert is_nil(get_change(changeset, :hashed_password))
    end
  end

  describe "update_user_password/3" do
    setup do
      %{user: user_fixture()}
    end

    test "validates password", %{user: user} do
      {:error, changeset} =
        Accounts.update_user_password(user, valid_user_password(), %{
          password: "not valid",
          password_confirmation: "another"
        })

      assert %{
               password: ["should be at least 12 character(s)"],
               password_confirmation: ["does not match password"]
             } = errors_on(changeset)
    end

    test "validates maximum values for password for security", %{user: user} do
      too_long = String.duplicate("db", 100)

      {:error, changeset} =
        Accounts.update_user_password(user, valid_user_password(), %{password: too_long})

      assert "should be at most 72 character(s)" in errors_on(changeset).password
    end

    test "validates current password", %{user: user} do
      {:error, changeset} =
        Accounts.update_user_password(user, "invalid", %{password: valid_user_password()})

      assert %{current_password: ["is not valid"]} = errors_on(changeset)
    end

    test "updates the password", %{user: user} do
      {:ok, user} =
        Accounts.update_user_password(user, valid_user_password(), %{
          password: "new valid password"
        })

      assert is_nil(user.password)
      assert Accounts.get_user_by_email_and_password(user.email, "new valid password")
    end

    test "deletes all tokens for the given user", %{user: user} do
      _ = Accounts.generate_user_session_token(user)

      {:ok, _} =
        Accounts.update_user_password(user, valid_user_password(), %{
          password: "new valid password"
        })

      refute Repo.get_by(UserToken, user_id: user.id)
    end
  end

  describe "generate_user_session_token/1" do
    setup do
      %{user: user_fixture()}
    end

    test "generates a token", %{user: user} do
      token = Accounts.generate_user_session_token(user)
      assert user_token = Repo.get_by(UserToken, token: token)
      assert user_token.context == "session"

      # Creating the same token for another user should fail
      assert_raise Ecto.ConstraintError, fn ->
        Repo.insert!(%UserToken{
          token: user_token.token,
          user_id: user_fixture().id,
          context: "session"
        })
      end
    end
  end

  describe "get_user_by_session_token/1" do
    setup do
      user = user_fixture()
      token = Accounts.generate_user_session_token(user)
      %{user: user, token: token}
    end

    test "returns user by token", %{user: user, token: token} do
      assert session_user = Accounts.get_user_by_session_token(token)
      assert session_user.id == user.id
    end

    test "does not return user for invalid token" do
      refute Accounts.get_user_by_session_token("oops")
    end

    test "does not return user for expired token", %{token: token} do
      {1, nil} = Repo.update_all(UserToken, set: [inserted_at: ~N[2020-01-01 00:00:00]])
      refute Accounts.get_user_by_session_token(token)
    end
  end

  describe "delete_user_session_token/1" do
    test "deletes the token" do
      user = user_fixture()
      token = Accounts.generate_user_session_token(user)
      assert Accounts.delete_user_session_token(token) == :ok
      refute Accounts.get_user_by_session_token(token)
    end
  end

  describe "deliver_user_confirmation_instructions/2" do
    setup do
      %{user: user_fixture()}
    end

    test "sends token through notification", %{user: user} do
      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_confirmation_instructions(user, url)
        end)

      {:ok, token} = Base.url_decode64(token, padding: false)
      assert user_token = Repo.get_by(UserToken, token: :crypto.hash(:sha256, token))
      assert user_token.user_id == user.id
      assert user_token.sent_to == user.email
      assert user_token.context == "confirm"
    end
  end

  describe "confirm_user/1" do
    setup do
      user = user_fixture()

      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_confirmation_instructions(user, url)
        end)

      %{user: user, token: token}
    end

    test "confirms the email with a valid token", %{user: user, token: token} do
      assert {:ok, confirmed_user} = Accounts.confirm_user(token)
      assert confirmed_user.confirmed_at
      assert confirmed_user.confirmed_at != user.confirmed_at
      assert Repo.get!(User, user.id).confirmed_at
      refute Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not confirm with invalid token", %{user: user} do
      assert Accounts.confirm_user("oops") == :error
      refute Repo.get!(User, user.id).confirmed_at
      assert Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not confirm email if token expired", %{user: user, token: token} do
      {1, nil} = Repo.update_all(UserToken, set: [inserted_at: ~N[2020-01-01 00:00:00]])
      assert Accounts.confirm_user(token) == :error
      refute Repo.get!(User, user.id).confirmed_at
      assert Repo.get_by(UserToken, user_id: user.id)
    end
  end

  describe "deliver_user_reset_password_instructions/2" do
    setup do
      %{user: user_fixture()}
    end

    test "sends token through notification", %{user: user} do
      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_reset_password_instructions(user, url)
        end)

      {:ok, token} = Base.url_decode64(token, padding: false)
      assert user_token = Repo.get_by(UserToken, token: :crypto.hash(:sha256, token))
      assert user_token.user_id == user.id
      assert user_token.sent_to == user.email
      assert user_token.context == "reset_password"
    end
  end

  describe "get_user_by_reset_password_token/1" do
    setup do
      user = user_fixture()

      token =
        extract_user_token(fn url ->
          Accounts.deliver_user_reset_password_instructions(user, url)
        end)

      %{user: user, token: token}
    end

    test "returns the user with valid token", %{user: %{id: id}, token: token} do
      assert %User{id: ^id} = Accounts.get_user_by_reset_password_token(token)
      assert Repo.get_by(UserToken, user_id: id)
    end

    test "does not return the user with invalid token", %{user: user} do
      refute Accounts.get_user_by_reset_password_token("oops")
      assert Repo.get_by(UserToken, user_id: user.id)
    end

    test "does not return the user if token expired", %{user: user, token: token} do
      {1, nil} = Repo.update_all(UserToken, set: [inserted_at: ~N[2020-01-01 00:00:00]])
      refute Accounts.get_user_by_reset_password_token(token)
      assert Repo.get_by(UserToken, user_id: user.id)
    end
  end

  describe "reset_user_password/2" do
    setup do
      %{user: user_fixture()}
    end

    test "validates password", %{user: user} do
      {:error, changeset} =
        Accounts.reset_user_password(user, %{
          password: "not valid",
          password_confirmation: "another"
        })

      assert %{
               password: ["should be at least 12 character(s)"],
               password_confirmation: ["does not match password"]
             } = errors_on(changeset)
    end

    test "validates maximum values for password for security", %{user: user} do
      too_long = String.duplicate("db", 100)
      {:error, changeset} = Accounts.reset_user_password(user, %{password: too_long})
      assert "should be at most 72 character(s)" in errors_on(changeset).password
    end

    test "updates the password", %{user: user} do
      {:ok, updated_user} = Accounts.reset_user_password(user, %{password: "new valid password"})
      assert is_nil(updated_user.password)
      assert Accounts.get_user_by_email_and_password(user.email, "new valid password")
    end

    test "deletes all tokens for the given user", %{user: user} do
      _ = Accounts.generate_user_session_token(user)
      {:ok, _} = Accounts.reset_user_password(user, %{password: "new valid password"})
      refute Repo.get_by(UserToken, user_id: user.id)
    end
  end

  describe "admin?/1" do
    test "returns false for nil" do
      refute Accounts.admin?(nil)
    end

    test "returns true for the configured admin email" do
      user = user_fixture(%{email: "cryptcom@gmail.com"})
      assert Accounts.admin?(user)
    end

    test "is case-insensitive" do
      user = user_fixture(%{email: "CRYPTCOM@GMAIL.COM"})
      assert Accounts.admin?(user)
    end

    test "returns false for any other email" do
      user = user_fixture()
      refute Accounts.admin?(user)
    end

    test "returns false for a banned account even with the admin email" do
      user =
        %{email: "cryptcom@gmail.com"}
        |> user_fixture()
        |> Ecto.Changeset.change(banned_at: DateTime.utc_now() |> DateTime.truncate(:second))
        |> Repo.update!()

      refute Accounts.admin?(user)
    end
  end

  describe "inspect/2 for the User module" do
    test "does not include password" do
      refute inspect(%User{password: "123456"}) =~ "password: \"123456\""
    end
  end

  describe "register_user/1 username validation" do
    import Ethos.AccountsFixtures

    test "requires a username" do
      {:error, changeset} =
        Ethos.Accounts.register_user(%{
          email: unique_user_email(),
          password: valid_user_password()
        })

      assert %{username: ["can't be blank"]} = errors_on(changeset)
    end

    test "rejects a username that is too short or too long" do
      {:error, short} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "ab"))

      {:error, long} =
        Ethos.Accounts.register_user(valid_user_attributes(username: String.duplicate("a", 21)))

      assert %{username: ["should be at least 3 character(s)"]} = errors_on(short)
      assert %{username: ["should be at most 20 character(s)"]} = errors_on(long)
    end

    test "rejects characters outside a-z, 0-9 and underscore" do
      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "joe stein"))

      assert %{username: ["can only contain lowercase letters, numbers and underscores"]} =
               errors_on(changeset)
    end

    test "rejects a reserved username" do
      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "admin"))

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "rejects the admin's public username — an ordinary user cannot register as the admin" do
      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "buoewe"))

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "downcases and trims before storing" do
      {:ok, user} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "  Voyager  "))

      assert user.username == "voyager"
    end

    test "rejects a username already taken in a different case" do
      taken = user_fixture(username: "voyager")

      {:error, changeset} =
        Ethos.Accounts.register_user(valid_user_attributes(username: "VOYAGER"))

      assert %{username: ["has already been taken"]} = errors_on(changeset)
      assert taken.username == "voyager"
    end

    test "a newly registered user is not provisional" do
      {:ok, user} = Ethos.Accounts.register_user(valid_user_attributes())
      refute user.username_provisional
    end
  end

  describe "update_user_username/2" do
    import Ethos.AccountsFixtures

    test "sets the username and clears the provisional flag" do
      user = user_fixture()
      {:ok, updated} = Ethos.Accounts.update_user_username(user, %{"username" => "voyager"})

      assert updated.username == "voyager"
      refute updated.username_provisional
    end

    test "applies the same rules as registration" do
      user = user_fixture()

      assert {:error, changeset} =
               Ethos.Accounts.update_user_username(user, %{"username" => "admin"})

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "rejects the admin's public username" do
      user = user_fixture()

      assert {:error, changeset} =
               Ethos.Accounts.update_user_username(user, %{"username" => "buoewe"})

      assert %{username: ["is reserved"]} = errors_on(changeset)
    end

    test "rejects a username someone else already holds" do
      user_fixture(username: "voyager")
      other = user_fixture()

      assert {:error, changeset} =
               Ethos.Accounts.update_user_username(other, %{"username" => "voyager"})

      assert %{username: ["has already been taken"]} = errors_on(changeset)
    end
  end

  describe "needs_username?/1" do
    import Ethos.AccountsFixtures

    test "is false for a user who chose their own name" do
      refute Ethos.Accounts.needs_username?(user_fixture())
    end

    test "is true for a backfilled user" do
      user = user_fixture()
      provisional = %{user | username_provisional: true}
      assert Ethos.Accounts.needs_username?(provisional)
    end

    test "is false for nobody" do
      refute Ethos.Accounts.needs_username?(nil)
    end
  end

  describe "list_users_for_moderation/1" do
    import Ethos.GuidesFixtures

    test "returns every user with zero counts when nobody has reviewed" do
      user = user_fixture()

      assert [row] = Ethos.Accounts.list_users_for_moderation()
      assert row.user.id == user.id
      assert row.review_count == 0
      assert row.revoked_count == 0
    end

    test "counts a user's reviews and how many were revoked" do
      user = user_fixture()
      # Pin both guides' author to `user` — otherwise guide_fixture/1 mints
      # its own author via user_fixture/0 and the assertion below sees three
      # users instead of one.
      guide_one = guide_fixture(%{user: user})
      guide_two = guide_fixture(%{user: user})

      {:ok, _kept} =
        Ethos.Social.create_review(user, guide_one, %{"rating" => "8", "body" => "Kept."})

      {:ok, gone} =
        Ethos.Social.create_review(user, guide_two, %{"rating" => "2", "body" => "Gone."})

      gone |> Ecto.Changeset.change(status: "revoked") |> Ethos.Repo.update!()

      assert [row] = Ethos.Accounts.list_users_for_moderation()
      assert row.review_count == 2
      assert row.revoked_count == 1
    end

    test "searches by username" do
      match = user_fixture(%{username: "findme"})
      _other = user_fixture(%{username: "somebodyelse"})

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "findm")
      assert row.user.id == match.id
    end

    test "searches by email, case-insensitively" do
      match = user_fixture(%{email: "Needle@example.com"})
      _other = user_fixture()

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "needle")
      assert row.user.id == match.id
    end

    test "a plain search with no special characters behaves as before" do
      match = user_fixture(%{username: "plainsearch"})
      _other = user_fixture(%{username: "somebodyelse"})

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "plains")
      assert row.user.id == match.id
    end

    test "a literal underscore in the search is not treated as a wildcard" do
      match = user_fixture(%{username: "foo_bar"})
      _decoy = user_fixture(%{username: "fooxbar"})

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "foo_bar")
      assert row.user.id == match.id
    end

    test "a literal percent sign in the search is not treated as a wildcard" do
      match = user_fixture(%{email: "100%off@example.com"})
      _decoy = user_fixture(%{email: "100xoff@example.com"})

      assert [row] = Ethos.Accounts.list_users_for_moderation(search: "100%off")
      assert row.user.id == match.id
    end

    test "an empty search returns everyone" do
      user_fixture()
      user_fixture()

      assert length(Ethos.Accounts.list_users_for_moderation(search: "")) == 2
    end
  end
end
