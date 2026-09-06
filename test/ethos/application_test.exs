defmodule Ethos.ApplicationTest do
  # async: false — this mutates the process-global `:ethos, :admin_email` and
  # `:ethos, :env` application config for the duration of each test, which
  # would race an async module reading either.
  use Ethos.DataCase, async: false

  import ExUnit.CaptureLog

  import Ethos.AccountsFixtures

  describe "warn_if_admin_unresolved/0" do
    test "logs nothing in :test, even with an unresolvable admin_email" do
      # This IS the test environment, so the real (unmodified) :env config
      # already exercises the skip this test is about — no override needed,
      # and none would be honest: overriding :env here would stop testing
      # the actual guard.
      Application.put_env(:ethos, :admin_email, "nobody-#{System.unique_integer()}@example.com")
      on_exit(fn -> Application.put_env(:ethos, :admin_email, "cryptcom@gmail.com") end)

      assert capture_log(&Ethos.Application.warn_if_admin_unresolved/0) == ""
    end

    test "logs a warning outside :test when admin_email resolves to no account" do
      Application.put_env(:ethos, :env, :prod)
      Application.put_env(:ethos, :admin_email, "nobody-#{System.unique_integer()}@example.com")

      on_exit(fn ->
        Application.put_env(:ethos, :env, :test)
        Application.put_env(:ethos, :admin_email, "cryptcom@gmail.com")
      end)

      log = capture_log(&Ethos.Application.warn_if_admin_unresolved/0)

      assert log =~ "No account exists for the configured admin_email"
    end

    test "logs nothing outside :test when admin_email resolves to a real account" do
      admin = admin_fixture()

      Application.put_env(:ethos, :env, :prod)
      on_exit(fn -> Application.put_env(:ethos, :env, :test) end)

      log = capture_log(&Ethos.Application.warn_if_admin_unresolved/0)

      assert log == ""
      # Sanity: the fixture really did use the configured email, so this
      # test would have failed loudly (not vacuously) had resolution broken.
      assert admin.email == Application.get_env(:ethos, :admin_email)
    end
  end
end
