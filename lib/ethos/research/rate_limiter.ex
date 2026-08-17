defmodule Ethos.Research.RateLimiter do
  @moduledoc "ETS sliding-window limiter: 10 research calls per user per hour. Resets on deploy (accepted per spec)."
  use GenServer

  @table __MODULE__
  @limit 10
  @window_ms :timer.hours(1)

  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  def allow?(user_id) do
    now = System.monotonic_time(:millisecond)
    cutoff = now - @window_ms
    stamps = case :ets.lookup(@table, user_id) do
      [{^user_id, list}] -> Enum.filter(list, &(&1 > cutoff))
      [] -> []
    end

    if length(stamps) < @limit do
      :ets.insert(@table, {user_id, [now | stamps]})
      true
    else
      :ets.insert(@table, {user_id, stamps})
      false
    end
  end

  def reset(user_id), do: :ets.delete(@table, user_id)

  @impl true
  def init(nil) do
    :ets.new(@table, [:named_table, :public, :set])
    {:ok, nil}
  end
end
