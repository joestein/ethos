defmodule EthosWeb.GuideLive.Suggestions do
  use EthosWeb, :live_view

  alias Ethos.{Accounts, Contributions, Guides}

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)
    {:ok, socket |> assign(guide: guide, page_title: "Suggestions") |> load()}
  end

  @impl true
  def handle_event("accept", %{"id" => id}, socket) do
    suggestion = Contributions.get_suggestion!(socket.assigns.guide, id)

    case Contributions.accept_suggestion(suggestion) do
      {:ok, _} -> :ok
      # Already accepted/declined by a concurrent click — just refresh the list.
      {:error, :already_processed} -> :ok
    end

    {:noreply, load(socket)}
  end

  def handle_event("decline", %{"id" => id}, socket) do
    suggestion = Contributions.get_suggestion!(socket.assigns.guide, id)

    case Contributions.decline_suggestion(suggestion) do
      {:ok, _} -> :ok
      {:error, :already_processed} -> :ok
    end

    {:noreply, load(socket)}
  end

  defp load(socket),
    do: assign(socket, suggestions: Contributions.list_pending_suggestions(socket.assigns.guide))

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Suggestions &amp; nearby ideas
      <:subtitle>
        Accepting adds the place to your guide (with credit for reader suggestions).
      </:subtitle>
    </.header>

    <p :if={@suggestions == []} class="mt-6 text-zinc-500">Nothing pending. 🎉</p>

    <ul class="mt-6 space-y-3">
      <li :for={s <- @suggestions} class="rounded-lg border p-4">
        <div class="flex items-start justify-between gap-4">
          <div>
            <p class="font-semibold">{s.place_name}</p>
            <p class="text-sm text-zinc-500">
              {s.kind_hint || "tip"} · {if s.origin == "gap_fill",
                do: "nearby idea (auto)",
                else: "suggested by #{s.author && Accounts.display_name(s.author)}"}
            </p>
            <p :if={s.body} class="text-sm mt-1">{s.body}</p>
            <a
              :if={s.url && EthosWeb.Url.safe_http?(s.url)}
              href={s.url}
              class="text-xs underline"
              rel="nofollow"
            >
              {s.url}
            </a>
            <span :if={s.url && !EthosWeb.Url.safe_http?(s.url)} class="text-xs text-zinc-400">
              {s.url}
            </span>
          </div>
          <div class="flex gap-2 shrink-0">
            <.button phx-click="accept" phx-value-id={s.id}>Accept</.button>
            <button phx-click="decline" phx-value-id={s.id} class="text-sm underline text-zinc-500">
              Decline
            </button>
          </div>
        </div>
      </li>
    </ul>
    """
  end
end
