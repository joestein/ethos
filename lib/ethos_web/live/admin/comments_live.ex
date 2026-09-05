defmodule EthosWeb.Admin.CommentsLive do
  @moduledoc """
  The comment moderation queue.

  Pending comments are invisible to everyone but their author until they are
  approved here, so this page is the only thing standing between a new
  account and the front of the site.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts
  alias Ethos.Moderation

  def mount(_params, _session, socket) do
    {:ok, load(socket)}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-3xl px-4 py-10">
      <EthosWeb.AdminNav.admin_nav current={:comments} />

      <h1 class="text-2xl font-bold">Comments</h1>

      <section class="mt-6">
        <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">Waiting</h2>

        <p :if={@pending == []} class="mt-3 text-zinc-500">Nothing waiting. 🎉</p>

        <ul id="pending-comments" class="mt-3 space-y-3">
          <li :for={review <- @pending} class="rounded-lg border p-4">
            <.review_row review={review} />
            <div class="mt-3 flex gap-2">
              <.button phx-click="approve" phx-value-id={review.id}>Approve</.button>
              <.button phx-click="revoke" phx-value-id={review.id} class="bg-red-600">
                Revoke
              </.button>
            </div>
          </li>
        </ul>
      </section>

      <section class="mt-10">
        <h2 class="text-sm font-semibold uppercase tracking-wide text-zinc-500">Published</h2>

        <p :if={@approved == []} class="mt-3 text-zinc-500">Nothing published yet.</p>

        <ul id="published-comments" class="mt-3 space-y-3">
          <li :for={review <- @approved} class="rounded-lg border p-4">
            <.review_row review={review} />
            <div class="mt-3">
              <.button phx-click="revoke" phx-value-id={review.id} class="bg-red-600">
                Revoke
              </.button>
            </div>
          </li>
        </ul>
      </section>
    </div>
    """
  end

  attr :review, :map, required: true

  defp review_row(assigns) do
    ~H"""
    <div>
      <p class="text-sm text-zinc-500">
        <span class="font-semibold text-zinc-900">{Accounts.display_name(@review.user)}</span>
        · {@review.rating}/10 · {@review.subject_type}
      </p>
      <p class="mt-1 whitespace-pre-line">{@review.body}</p>
    </div>
    """
  end

  def handle_event("approve", %{"id" => id}, socket) do
    {:noreply, decide(socket, id, &Moderation.approve_review/2, "Approved.")}
  end

  def handle_event("revoke", %{"id" => id}, socket) do
    {:noreply, decide(socket, id, &Moderation.revoke_review/2, "Revoked.")}
  end

  # `id` comes straight from the client, so it may name a row that was
  # already decided in another tab (or another admin) since this page was
  # rendered, or not be a row at all. `get_review!/1` raises on either —
  # `Ecto.NoResultsError` for a well-formed but missing id, and
  # `Ecto.Query.CastError` for a non-numeric one — so both are caught here
  # rather than crashing the LiveView process. `decide_fun`'s `{:error, _}`
  # is handled too: `Moderation` cannot return it today, but a handler that
  # only matches `{:ok, _}` would become a `MatchError` the day it can.
  defp decide(socket, id, decide_fun, success_message) do
    review = Moderation.get_review!(id)

    case decide_fun.(review, socket.assigns.current_user) do
      {:ok, _} ->
        socket |> put_flash(:info, success_message) |> load()

      {:error, _} ->
        socket |> put_flash(:error, "That decision could not be recorded.") |> load()
    end
  rescue
    _ in [Ecto.NoResultsError, Ecto.Query.CastError] ->
      socket |> put_flash(:error, "That comment no longer exists.") |> load()
  end

  defp load(socket) do
    assign(socket,
      pending: Moderation.list_pending_reviews(),
      approved: Moderation.list_approved_reviews(),
      page_title: "Comments"
    )
  end
end
