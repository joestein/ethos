defmodule Ethos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

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
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EthosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
