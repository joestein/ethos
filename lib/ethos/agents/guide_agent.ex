defmodule Ethos.Agents.GuideAgent do
  @moduledoc """
  Orchestrates the Jido action pipeline for a guide.
  Async by default (Task.Supervisor); `sync: true` runs inline for tests.
  """

  alias Ethos.Agents.Actions.{EnrichEntries, GapFill, ParseDump}

  def subscribe_import(import_id),
    do: Phoenix.PubSub.subscribe(Ethos.PubSub, "import:#{import_id}")

  def subscribe_guide(guide_id),
    do: Phoenix.PubSub.subscribe(Ethos.PubSub, "guide:#{guide_id}")

  # max_retries: 0 — Jido.Exec.run/3 defaults to 1 automatic retry on any
  # {:error, _} return, which would silently double the Claude/exa call
  # budget (and re-run each action's side effects) on failure. The spec
  # guarantees exactly one Claude call per parse/gap-fill run, so retries
  # are disabled here; ParseDump/EnrichEntries/GapFill already degrade
  # gracefully on their own errors.
  @exec_opts [max_retries: 0]

  def parse_import(import_id, opts \\ []) do
    run(opts, fn ->
      case Jido.Exec.run(ParseDump, %{import_id: import_id}, %{}, @exec_opts) do
        {:ok, _} -> broadcast("import:#{import_id}", {:import_parsed, import_id})
        {:error, _} -> broadcast("import:#{import_id}", {:import_failed, import_id})
      end
    end)
  end

  def publish_pipeline(guide_id, opts \\ []) do
    run(opts, fn ->
      {:ok, _} = Jido.Exec.run(EnrichEntries, %{guide_id: guide_id}, %{}, @exec_opts)
      {:ok, _} = Jido.Exec.run(GapFill, %{guide_id: guide_id}, %{}, @exec_opts)
      broadcast("guide:#{guide_id}", {:pipeline_done, guide_id})
    end)
  end

  defp run(opts, fun) do
    if Keyword.get(opts, :sync, Application.get_env(:ethos, :agent_sync, false)) do
      fun.()
      :ok
    else
      {:ok, _pid} = Task.Supervisor.start_child(Ethos.AgentTaskSupervisor, fun)
      :ok
    end
  end

  defp broadcast(topic, message),
    do: Phoenix.PubSub.broadcast(Ethos.PubSub, topic, message)
end
