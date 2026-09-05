defmodule EthosWeb.SocialLive do
  @moduledoc """
  The social block, embedded in the place, guide and collection show pages.

  Those pages are plain controllers, and they stay that way: all of the
  SEO work — JSON-LD, canonical URLs, OG cards, meta descriptions — lives
  in those controllers, and converting them to LiveViews would rewrite
  code other branches are actively editing for no user-visible gain. So
  this renders as an island via `live_render/3` instead. It server-renders
  on first paint, which is what keeps the content indexable.

  One LiveView serves all three subject types; `Ethos.Social.Subject` is
  what knows the difference.
  """
  use EthosWeb, :live_view

  on_mount {EthosWeb.UserAuth, :mount_current_user}

  alias Ethos.Accounts
  alias Ethos.Social
  alias Ethos.Social.Subject

  def mount(_params, %{"subject_type" => type, "subject_id" => id}, socket) do
    subject = Subject.get!(type, id)

    {:ok, socket |> assign(subject: subject) |> load_reactions()}
  end

  def render(assigns) do
    ~H"""
    <section class="mt-10 rounded-xl border p-5">
      <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">
        What travelers think
      </h2>

      <div class="mt-4 flex items-start gap-8">
        <.thumb
          value="up"
          label="👍"
          count={@counts.up}
          mine={@mine == "up"}
          interactive={@interactive}
        />
        <.thumb
          value="down"
          label="👎"
          count={@counts.down}
          mine={@mine == "down"}
          interactive={@interactive}
        />
      </div>

      <p :if={@prompt} class="mt-4 text-sm text-zinc-500">{@prompt}</p>
    </section>
    """
  end

  attr :value, :string, required: true
  attr :label, :string, required: true
  attr :count, :integer, required: true
  attr :mine, :boolean, required: true
  attr :interactive, :boolean, required: true

  # The count sits directly beneath its own button, so "34 people liked this"
  # reads off the layout without a legend.
  defp thumb(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-1">
      <button
        :if={@interactive}
        type="button"
        phx-click="react"
        phx-value-value={@value}
        aria-pressed={to_string(@mine)}
        class={[
          "rounded-lg border px-4 py-2 text-xl transition",
          @mine && "border-zinc-900 bg-zinc-100",
          !@mine && "hover:bg-zinc-50"
        ]}
      >
        {@label}
      </button>
      <span :if={!@interactive} class="rounded-lg border px-4 py-2 text-xl opacity-60">
        {@label}
      </span>
      <%!-- data-reaction-count is the hook the tests read. Without it they would have
            to assert on bare text, which passes on any stray digit on the page. --%>
      <span data-reaction-count={@value} class="text-sm font-medium text-zinc-600">
        {@count}
      </span>
    </div>
    """
  end

  def handle_event("react", %{"value" => value}, socket) do
    # Checked here and not only in the template: the buttons are absent for a
    # visitor who may not react, but a crafted socket message does not care
    # what the template rendered.
    if socket.assigns.interactive do
      Social.react(socket.assigns.current_user, socket.assigns.subject, value)
      {:noreply, load_reactions(socket)}
    else
      {:noreply, socket}
    end
  end

  defp load_reactions(socket) do
    user = socket.assigns[:current_user]
    subject = socket.assigns.subject

    assign(socket,
      counts: Social.counts(subject),
      mine: Social.user_reaction(user, subject),
      interactive: interactive?(user),
      prompt: prompt_for(user)
    )
  end

  defp interactive?(nil), do: false
  defp interactive?(user), do: not Accounts.needs_username?(user)

  defp prompt_for(nil), do: "Log in to react."

  defp prompt_for(user) do
    if Accounts.needs_username?(user), do: "Pick a username to join in.", else: nil
  end
end
