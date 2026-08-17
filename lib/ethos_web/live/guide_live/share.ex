defmodule EthosWeb.GuideLive.Share do
  use EthosWeb, :live_view

  alias Ethos.Agents.GuideAgent
  alias Ethos.Guides

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {guide, polishing} =
      if guide.status == "draft" do
        {:ok, guide} = Guides.publish_guide(guide)
        {:ok, _} = Ethos.OGCard.generate(guide)
        if connected?(socket), do: GuideAgent.subscribe_guide(guide.id)
        GuideAgent.publish_pipeline(guide.id)
        {guide, true}
      else
        {guide, false}
      end

    {:ok,
     assign(socket,
       guide: guide,
       polishing: polishing,
       public_url: url(~p"/g/#{guide.slug}"),
       page_title: "Share your guide"
     )}
  end

  @impl true
  def handle_info({:pipeline_done, _guide_id}, socket) do
    {:noreply, assign(socket, polishing: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Your guide is live 🎉
      <:subtitle>Share the link anywhere — no account needed to view it.</:subtitle>
    </.header>

    <div class="mt-6 flex gap-2">
      <input type="text" readonly value={@public_url} id="share-url"
             class="w-full rounded-md border-zinc-300 text-sm" />
      <.button phx-click={JS.dispatch("phx:copy", to: "#share-url")}>Copy</.button>
    </div>

    <p class="mt-4">
      <.link href={~p"/g/#{@guide.slug}"} class="underline">View your public guide →</.link>
    </p>

    <div class="mt-6 rounded-md bg-zinc-50 p-4 text-sm">
      <p :if={@polishing}>✨ Polishing your guide — adding official links and nearby ideas…</p>
      <p :if={!@polishing}>
        Done. Review
        <.link navigate={~p"/guides/#{@guide.id}/suggestions"} class="underline">nearby ideas &amp; suggestions</.link>.
      </p>
    </div>
    """
  end
end
