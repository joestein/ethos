# lib/ethos_web/live/guide_live/edit.ex — REPLACED IN TASK 14
defmodule EthosWeb.GuideLive.Edit do
  use EthosWeb, :live_view
  def mount(_p, _s, socket), do: {:ok, socket}
  def render(assigns), do: ~H"<div>edit</div>"
end
