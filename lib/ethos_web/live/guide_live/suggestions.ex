# lib/ethos_web/live/guide_live/suggestions.ex — REPLACED IN TASK 18
defmodule EthosWeb.GuideLive.Suggestions do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>suggestions</div>"
end
