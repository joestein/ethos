# lib/ethos_web/live/guide_live/share.ex — REPLACED IN TASK 15
defmodule EthosWeb.GuideLive.Share do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>share</div>"
end
