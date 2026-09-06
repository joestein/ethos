defmodule Ethos.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ethos.Accounts` context.
  """

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def unique_username, do: "user#{System.unique_integer([:positive])}"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      username: unique_username(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Ethos.Accounts.register_user()

    user
  end

  @doc """
  Builds a user whose email matches the configured `:admin_email`, which is
  what makes `Ethos.Accounts.admin?/1` return true for them.

  The email is load-bearing — do not randomise it or generate it per call.
  Every test that needs an admin should go through this single helper
  (reading the real config rather than a hardcoded literal) so there is
  exactly one place inserting that email, instead of several async test
  files racing each other to insert the same unique value. Modules that
  call this must run `async: false`; concurrent inserts of the same email
  across separate async test processes is what caused the flaky
  `Postgrex.Error 40P01 deadlock_detected` failures this fixes.
  """
  def admin_fixture(attrs \\ %{}) do
    if Map.has_key?(attrs, :email) or Map.has_key?(attrs, "email") do
      raise ArgumentError,
            "admin_fixture/1 does not accept :email — the admin's email is fixed by " <>
              "the :admin_email config, not by the caller"
    end

    admin_email = Application.fetch_env!(:ethos, :admin_email)

    attrs
    |> Enum.into(%{email: admin_email})
    |> user_fixture()
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
