defmodule Ethos.Research.RateLimiter do
  @moduledoc "ETS sliding-window limiter: 10 research calls per user per hour. Resets on deploy (accepted per spec). All checks serialized through GenServer to avoid race conditions."
  use GenServer

  @table __MODULE__
  @limit 10
  @window_ms :timer.hours(1)

  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  def allow?(user_id) do
    GenServer.call(__MODULE__, {:allow?, user_id})
  end

  def reset(user_id) do
    GenServer.call(__MODULE__, {:reset, user_id})
  end

  @impl true
  def init(nil) do
    :ets.new(@table, [:named_table, :protected, :set])
    {:ok, nil}
  end

  @impl true
  def handle_call({:allow?, user_id}, _from, state) do
    now = System.monotonic_time(:millisecond)
    cutoff = now - @window_ms

    stamps =
      case :ets.lookup(@table, user_id) do
        [{^user_id, list}] -> Enum.filter(list, &(&1 > cutoff))
        [] -> []
      end

    allowed = length(stamps) < @limit
    :ets.insert(@table, {user_id, if(allowed, do: [now | stamps], else: stamps)})
    {:reply, allowed, state}
  end

  def handle_call({:reset, user_id}, _from, state) do
    :ets.delete(@table, user_id)
    {:reply, :ok, state}
  end
end
