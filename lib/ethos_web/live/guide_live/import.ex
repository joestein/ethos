defmodule EthosWeb.GuideLive.Import do
  use EthosWeb, :live_view

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {:ok,
     assign(socket,
       guide: guide,
       parsing: false,
       parse_failed: false,
       form: to_form(%{"raw_text" => ""}, as: :import),
       page_title: "Import notes"
     )}
  end

  @impl true
  def handle_event("submit", %{"import" => %{"raw_text" => raw_text}}, socket) do
    case Guides.create_import(socket.assigns.guide, raw_text) do
      {:ok, import} ->
        GuideAgent.subscribe_import(import.id)
        GuideAgent.parse_import(import.id)
        {:noreply, assign(socket, parsing: true, parse_failed: false)}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Paste some notes first.")}
    end
  end

  @impl true
  def handle_info({:import_parsed, _import_id}, socket) do
    {:noreply, push_navigate(socket, to: ~p"/guides/#{socket.assigns.guide.id}/confirm")}
  end

  def handle_info({:import_failed, _import_id}, socket) do
    {:noreply, assign(socket, parsing: false, parse_failed: true)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>Paste your trip notes</.header>
    <p class="mt-2 text-zinc-600">
      Anything works: your notes app, the thread of recs friends sent you, a rough day-by-day.
      We'll structure it — you confirm before anything is saved.
    </p>

    <div :if={@parse_failed} class="mt-4 rounded-md bg-red-50 p-4 text-red-800">
      We couldn't structure this dump. Tweak your notes and try again, or <.link
        navigate={~p"/guides/#{@guide.id}/edit"}
        class="underline"
      >add entries manually</.link>.
    </div>

    <.simple_form for={@form} id="import-form" phx-submit="submit">
      <.input field={@form[:raw_text]} type="textarea" rows="14" label="Trip notes" />
      <:actions>
        <.button disabled={@parsing} phx-disable-with="Structuring...">
          {if @parsing, do: "Structuring your trip…", else: "Structure my trip"}
        </.button>
      </:actions>
    </.simple_form>
    """
  end
end
