# lib/ethos_web/live/guide_live/confirm.ex — REPLACED IN TASK 14
defmodule EthosWeb.GuideLive.Confirm do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>confirm</div>"
end
