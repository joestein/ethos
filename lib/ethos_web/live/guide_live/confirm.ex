defmodule EthosWeb.GuideLive.Confirm do
  use EthosWeb, :live_view

  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)
    import = Guides.latest_import(guide)

    proposal =
      case import do
        %{status: "parsed", proposal: proposal} when is_list(proposal) -> proposal
        _ -> []
      end

    {:ok, assign(socket, guide: guide, proposal: proposal, page_title: "Confirm entries")}
  end

  @impl true
  def handle_event("remove", %{"index" => index}, socket) do
    proposal = List.delete_at(socket.assigns.proposal, String.to_integer(index))
    {:noreply, assign(socket, proposal: proposal)}
  end

  def handle_event("update", %{"index" => index, "field" => field, "value" => value}, socket) do
    index = String.to_integer(index)
    proposal = List.update_at(socket.assigns.proposal, index, &Map.put(&1, field, value))
    {:noreply, assign(socket, proposal: proposal)}
  end

  def handle_event("confirm", _params, socket) do
    {:ok, _entries} =
      Guides.replace_entries_from_proposal(socket.assigns.guide, socket.assigns.proposal)

    {:noreply, push_navigate(socket, to: ~p"/guides/#{socket.assigns.guide.id}/edit")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Here's what we found — confirm before saving
      <:subtitle>Nothing is saved until you confirm. Remove or tweak anything.</:subtitle>
    </.header>

    <div :if={@proposal == []} class="mt-6 text-zinc-500">
      No parsed entries. <.link navigate={~p"/guides/#{@guide.id}/import"} class="underline">Go back and import</.link>
      or <.link navigate={~p"/guides/#{@guide.id}/edit"} class="underline">add manually</.link>.
    </div>

    <ul class="mt-6 space-y-3">
      <li :for={{entry, index} <- Enum.with_index(@proposal)} class="rounded-lg border p-4 flex items-start justify-between">
        <div>
          <p class="font-semibold"><%= entry["name"] %></p>
          <p class="text-sm text-zinc-500">
            <%= entry["kind"] %>
            <span :if={entry["day"]}>· day <%= entry["day"] %></span>
            <span :if={entry["verdict"]}>· <%= entry["verdict"] %></span>
          </p>
          <p :if={entry["note"]} class="text-sm mt-1"><%= entry["note"] %></p>
        </div>
        <button phx-click="remove" phx-value-index={index} class="text-sm text-red-600 underline">
          Remove
        </button>
      </li>
    </ul>

    <div :if={@proposal != []} class="mt-6">
      <.button id="confirm-entries" phx-click="confirm">Looks right — save these</.button>
    </div>
    """
  end
end
