defmodule EthosWeb.GuideLive.Confirm do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @editable_fields ~w(name kind verdict day note)

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

  def handle_event("update_row", params, socket) do
    index = String.to_integer(params["index"])
    current = Enum.at(socket.assigns.proposal, index)

    updated =
      Enum.reduce(@editable_fields, current, fn field, acc ->
        value = Map.get(params, field, Map.get(acc, field))
        Map.put(acc, field, normalize(field, value))
      end)

    proposal = List.replace_at(socket.assigns.proposal, index, updated)
    {:noreply, assign(socket, proposal: proposal)}
  end

  def handle_event("confirm", _params, socket) do
    case Guides.replace_entries_from_proposal(socket.assigns.guide, socket.assigns.proposal) do
      {:ok, _entries} ->
        {:noreply, push_navigate(socket, to: ~p"/guides/#{socket.assigns.guide.id}/edit")}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "One of the rows is invalid — check names")}
    end
  end

  defp normalize(field, "") when field in ["day", "verdict"], do: nil
  defp normalize(_field, value), do: value

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
      <li :for={{entry, index} <- Enum.with_index(@proposal)} class="rounded-lg border p-4">
        <form phx-change="update_row" id={"proposal-row-#{index}"} class="flex items-start gap-4">
          <input type="hidden" name="index" value={index} />
          <div class="flex-1 grid grid-cols-2 gap-2">
            <input
              type="text"
              name="name"
              value={entry["name"]}
              placeholder="Name"
              class="col-span-2 rounded-md border-zinc-300 text-sm font-semibold"
            />
            <select name="kind" class="rounded-md border-zinc-300 text-sm">
              <option :for={kind <- Entry.kinds()} value={kind} selected={kind == entry["kind"]}><%= kind %></option>
            </select>
            <select name="verdict" class="rounded-md border-zinc-300 text-sm">
              <option value="" selected={entry["verdict"] in [nil, ""]}>—</option>
              <option :for={verdict <- Entry.verdicts()} value={verdict} selected={verdict == entry["verdict"]}>
                <%= verdict %>
              </option>
            </select>
            <input type="number" name="day" value={entry["day"]} placeholder="Day" class="rounded-md border-zinc-300 text-sm" />
            <textarea name="note" placeholder="Note" class="col-span-2 rounded-md border-zinc-300 text-sm"><%= entry["note"] %></textarea>
          </div>
          <button type="button" phx-click="remove" phx-value-index={index} class="shrink-0 text-sm text-red-600 underline">
            Remove
          </button>
        </form>
      </li>
    </ul>

    <div :if={@proposal != []} class="mt-6">
      <.button id="confirm-entries" phx-click="confirm">Looks right — save these</.button>
    </div>
    """
  end
end
