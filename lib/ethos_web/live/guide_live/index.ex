defmodule EthosWeb.GuideLive.Index do
  use EthosWeb, :live_view

  alias Ethos.Guides

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       guides: Guides.list_user_guides(socket.assigns.current_user),
       page_title: "Your guides"
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Your guides
      <:actions>
        <.link navigate={~p"/guides/new"}>
          <.button>New guide</.button>
        </.link>
      </:actions>
    </.header>

    <ul id="guides" class="mt-6 divide-y">
      <li :for={guide <- @guides} class="py-4 flex items-center justify-between">
        <div>
          <p class="font-semibold">{guide.title}</p>
          <p class="text-sm text-zinc-500">{guide.destination} · {guide.status}</p>
        </div>
        <div class="flex gap-3">
          <.link
            :if={guide.status == "published"}
            href={~p"/g/#{guide.slug}"}
            class="text-sm underline"
          >
            View
          </.link>
          <.link navigate={~p"/guides/#{guide.id}/edit"} class="text-sm underline">Edit</.link>
        </div>
      </li>
    </ul>
    <p :if={@guides == []} class="mt-6 text-zinc-500">No guides yet — start with your last trip.</p>
    """
  end
end
