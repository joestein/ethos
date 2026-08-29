defmodule EthosWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use EthosWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint EthosWeb.Endpoint

      use EthosWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import EthosWeb.ConnCase
    end
  end

  setup tags do
    Ethos.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  @doc """
  Decodes every `application/ld+json` block on the page, in document order.

  Shared so structured-data assertions decode and inspect the JSON-LD rather
  than substring-matching it.
  """
  def json_ld_blocks(html) do
    ~r{<script type="application/ld\+json">(.*?)</script>}s
    |> Regex.scan(html, capture: :all_but_first)
    |> Enum.map(fn [json] -> Jason.decode!(json) end)
  end

  @doc """
  The first decoded JSON-LD block whose `"@type"` is `type`, or nil.
  """
  def json_ld_of_type(html, type) do
    html |> json_ld_blocks() |> Enum.find(&(&1["@type"] == type))
  end

  @doc """
  Decodes the page's `BreadcrumbList` JSON-LD block, or nil if there isn't one.
  """
  def breadcrumb_json_ld(html), do: json_ld_of_type(html, "BreadcrumbList")

  @doc """
  Setup helper that registers and logs in users.

      setup :register_and_log_in_user

  It stores an updated connection and a registered user in the
  test context.
  """
  def register_and_log_in_user(%{conn: conn}) do
    user = Ethos.AccountsFixtures.user_fixture()
    %{conn: log_in_user(conn, user), user: user}
  end

  @doc """
  Logs the given `user` into the `conn`.

  It returns an updated `conn`.
  """
  def log_in_user(conn, user) do
    token = Ethos.Accounts.generate_user_session_token(user)

    conn
    |> Phoenix.ConnTest.init_test_session(%{})
    |> Plug.Conn.put_session(:user_token, token)
  end
end
