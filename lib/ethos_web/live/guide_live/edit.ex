defmodule EthosWeb.GuideLive.Edit do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {:ok,
     socket |> assign(guide: guide, page_title: "Edit guide") |> load_entries() |> reset_form()}
  end

  @impl true
  def handle_event("add", %{"entry" => params}, socket) do
    case Guides.create_entry(socket.assigns.guide, params) do
      {:ok, _entry} -> {:noreply, socket |> load_entries() |> reset_form()}
      {:error, changeset} -> {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    entry = Guides.get_entry!(socket.assigns.guide, id)
    {:ok, _} = Guides.delete_entry(entry)
    {:noreply, load_entries(socket)}
  end

  defp load_entries(socket),
    do: assign(socket, entries: Guides.list_entries(socket.assigns.guide))

  defp reset_form(socket),
    do: assign(socket, form: to_form(Entry.changeset(%Entry{}, %{})))

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      {@guide.title}
      <:subtitle>{@guide.destination}</:subtitle>
      <:actions>
        <.link navigate={~p"/guides/#{@guide.id}/share"}>
          <.button>Publish</.button>
        </.link>
      </:actions>
    </.header>

    <ul class="mt-6 space-y-3">
      <li :for={entry <- @entries} class="rounded-lg border p-4 flex items-start justify-between">
        <div>
          <p class="font-semibold">{entry.name}</p>
          <p class="text-sm text-zinc-500">
            {entry.kind}
            <span :if={entry.day}>· day {entry.day}</span>
            <span :if={entry.verdict}>· {entry.verdict}</span>
          </p>
          <p :if={entry.note} class="text-sm mt-1">{entry.note}</p>
        </div>
        <button phx-click="delete" phx-value-id={entry.id} class="text-sm text-red-600 underline">
          Delete
        </button>
      </li>
    </ul>

    <h3 class="mt-10 font-semibold">Add an entry</h3>
    <.simple_form for={@form} id="entry-form" phx-submit="add">
      <.input field={@form[:name]} label="Place / activity" />
      <.input field={@form[:kind]} type="select" label="Kind" options={Entry.kinds()} />
      <.input
        field={@form[:verdict]}
        type="select"
        label="Verdict"
        prompt="—"
        options={Entry.verdicts()}
      />
      <.input field={@form[:day]} type="number" label="Day (optional)" />
      <.input field={@form[:note]} type="textarea" label="Note (optional)" />
      <:actions>
        <.button>Add</.button>
      </:actions>
    </.simple_form>
    """
  end
end
