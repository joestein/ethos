defmodule EthosWeb.AdminNav do
  @moduledoc """
  The admin console's tab bar.

  A component rather than a layout because the console is half LiveView
  (comments) and half controller (suggestions), and a shared component is
  the only thing both can render identically.
  """
  use Phoenix.Component
  use Phoenix.VerifiedRoutes, endpoint: EthosWeb.Endpoint, router: EthosWeb.Router

  attr :current, :atom, required: true

  def admin_nav(assigns) do
    ~H"""
    <nav class="mb-6 flex gap-4 border-b text-sm">
      <.tab label="Comments" href={~p"/admin/comments"} active={@current == :comments} />
      <.tab label="Users" href={~p"/admin/users"} active={@current == :users} />
      <.tab label="Suggestions" href={~p"/admin/suggestions"} active={@current == :suggestions} />
      <.tab label="Season" href={~p"/admin/season"} active={@current == :season} />
    </nav>
    """
  end

  attr :label, :string, required: true
  attr :href, :string, required: true
  attr :active, :boolean, required: true

  defp tab(assigns) do
    ~H"""
    <.link
      href={@href}
      class={[
        "-mb-px border-b-2 px-1 pb-2",
        @active && "border-zinc-900 font-semibold",
        !@active && "border-transparent text-zinc-500 hover:text-zinc-900"
      ]}
    >
      {@label}
    </.link>
    """
  end
end
