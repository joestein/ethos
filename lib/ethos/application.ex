defmodule Ethos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      EthosWeb.Telemetry,
      Ethos.Repo,
      Ethos.Foliage.Dataset,
      Ethos.HouseAd,
      {DNSCluster, query: Application.get_env(:ethos, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ethos.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ethos.Finch},
      # Start a worker by calling: Ethos.Worker.start_link(arg)
      # {Ethos.Worker, arg},
      Ethos.Research.RateLimiter,
      {Task.Supervisor, name: Ethos.AgentTaskSupervisor},
      # Start to serve requests, typically the last entry
      EthosWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ethos.Supervisor]

    case Supervisor.start_link(children, opts) do
      {:ok, _pid} = result ->
        warn_if_admin_unresolved()
        result

      other ->
        other
    end
  end

  # `ADMIN_EMAIL` (or its dev/test default) pointing at an address with no
  # matching account means nobody is admin and the console 404s for
  # everyone — and because registration is open, whoever registers that
  # address next silently becomes the admin. That is worth a loud warning
  # at boot, not silence.
  #
  # Deliberately never raises: a fresh database (no accounts at all yet) and
  # the test environment both legitimately boot with no admin account, and
  # raising here would turn a normal first boot into a crash loop.
  #
  # Skipped entirely in :test — `Mix.env()` isn't available in a release, so
  # this branches on the `:env` value config.exs already stamps in at
  # compile time (`config :ethos, env: config_env()`) rather than on
  # `Mix.env()` or on the query result being nil, which a legitimately
  # empty test database would trip on every run.
  #
  # Public (not `defp`) so the test suite can exercise it directly, without
  # calling `start/2` again and colliding with the already-running
  # supervision tree.
  @doc false
  def warn_if_admin_unresolved do
    if Application.get_env(:ethos, :env) != :test do
      admin_email = Application.get_env(:ethos, :admin_email)
      resolved? = is_binary(admin_email) and Ethos.Accounts.get_user_by_email(admin_email) != nil

      unless resolved? do
        Logger.warning(
          "No account exists for the configured admin_email " <>
            "(#{inspect(admin_email)}). The admin console is unreachable until " <>
            "someone registers with that address — and once they do, they become " <>
            "the admin."
        )
      end
    end
  rescue
    error ->
      Logger.warning(
        "Could not verify the configured admin account at boot: #{Exception.format(:error, error)}"
      )
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EthosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
