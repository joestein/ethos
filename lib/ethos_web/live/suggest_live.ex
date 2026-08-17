# lib/ethos_web/live/suggest_live.ex — REPLACED IN TASK 18
defmodule EthosWeb.SuggestLive do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>suggest</div>"
end
