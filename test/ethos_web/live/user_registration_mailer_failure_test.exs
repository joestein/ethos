defmodule EthosWeb.UserRegistrationMailerFailureTest do
  @moduledoc """
  Registering must not depend on a mail server being reachable.

  Every other environment hides this. `config/test.exs` uses
  `Swoosh.Adapters.Test` and `config/dev.exs` uses `Local`, and both return
  `{:ok, _}` unconditionally — so no existing test can reach the failure
  branch, and production is the only place the branch runs at all.

  `async: false`: this swaps `Ethos.Mailer`'s adapter, which is global.
  """
  use EthosWeb.ConnCase, async: false

  import Phoenix.LiveViewTest
  import Ethos.AccountsFixtures

  defmodule RefusingAdapter do
    @moduledoc """
    A Swoosh adapter that always fails, standing in for production's
    unconfigured mailer. `Swoosh.Adapters.Test` cannot be made to fail, so
    the failure has to come from somewhere.
    """
    @behaviour Swoosh.Adapter

    @impl true
    def deliver(_email, _config), do: {:error, :no_mailer_configured}

    @impl true
    def deliver_many(_emails, _config), do: {:error, :no_mailer_configured}

    @impl true
    def validate_config(_config), do: :ok
  end

  setup do
    previous = Application.get_env(:ethos, Ethos.Mailer)
    Application.put_env(:ethos, Ethos.Mailer, adapter: RefusingAdapter)
    on_exit(fn -> Application.put_env(:ethos, Ethos.Mailer, previous) end)
    :ok
  end

  test "the confirmation email refusing to send does not stop registration", %{conn: conn} do
    # Sanity: the adapter really is refusing. Without this the test could pass
    # because delivery quietly succeeded, proving nothing.
    assert {:error, :no_mailer_configured} =
             Ethos.Mailer.deliver(
               Swoosh.Email.new(
                 to: "someone@example.com",
                 from: {"Ethos", "contact@example.com"},
                 subject: "probe",
                 text_body: "probe"
               )
             )

    {:ok, lv, _html} = live(conn, ~p"/users/register")

    email = unique_user_email()
    username = unique_username()

    form =
      form(lv, "#registration_form",
        user: valid_user_attributes(email: email, username: username)
      )

    render_submit(form)
    conn = follow_trigger_action(form, conn)

    assert redirected_to(conn) == ~p"/"

    conn = get(conn, "/")
    response = html_response(conn, 200)
    assert response =~ username
    assert response =~ "Log out"
  end

  test "the account is created even though the email failed", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/users/register")

    email = unique_user_email()

    lv
    |> form("#registration_form",
      user: valid_user_attributes(email: email, username: unique_username())
    )
    |> render_submit()

    # The row is what matters: a half-completed registration that inserts the
    # user and then dies is worse than one that refuses outright, because the
    # address is taken and the person cannot register again.
    assert Ethos.Accounts.get_user_by_email(email)
  end
end
