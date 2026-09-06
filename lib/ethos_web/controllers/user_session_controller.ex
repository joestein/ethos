defmodule EthosWeb.UserSessionController do
  use EthosWeb, :controller

  alias Ethos.Accounts
  alias EthosWeb.UserAuth

  def create(conn, %{"_action" => "registered"} = params) do
    create(conn, params, "Account created successfully!")
  end

  def create(conn, %{"_action" => "password_updated"} = params) do
    conn
    |> put_session(:user_return_to, ~p"/users/settings")
    |> create(params, "Password updated successfully!")
  end

  def create(conn, params) do
    create(conn, params, "Welcome back!")
  end

  defp create(conn, %{"user" => user_params}, info) do
    %{"email" => email, "password" => password} = user_params

    case Accounts.get_user_by_email_and_password(email, password) do
      nil ->
        # Don't disclose whether the email is registered.
        conn
        |> put_flash(:error, "Invalid email or password")
        |> put_flash(:email, String.slice(email, 0, 160))
        |> redirect(to: ~p"/users/log_in")

      user ->
        if Ethos.Moderation.banned?(user) do
          # Deliberately a different message from the one above. It is only
          # reachable by someone who supplied the CORRECT password, so it
          # tells an attacker nothing they did not already know — and a
          # banned user retyping their own working password forever is a
          # support email nobody needs.
          conn
          |> put_flash(:error, "This account has been suspended.")
          |> redirect(to: ~p"/users/log_in")
        else
          conn
          |> put_flash(:info, info)
          |> UserAuth.log_in_user(user, user_params)
        end
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
