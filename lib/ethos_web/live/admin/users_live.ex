defmodule EthosWeb.Admin.UsersLive do
  @moduledoc """
  The Users tab: who is here, what they have written, and the levers.

  Trust is normally earned rather than granted — approving someone's comment
  on the Comments tab trusts them automatically. The buttons here are the
  override: granting it to somebody known-good without waiting, and taking it
  back from somebody who turned out not to be.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts
  alias Ethos.Moderation

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(query: "", page_title: "Users") |> load_users()}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-3xl px-4 py-10">
      <EthosWeb.AdminNav.admin_nav current={:users} />

      <h1 class="text-2xl font-bold">Users</h1>

      <%!-- Plain inputs rather than <.input>: that component is built around a
            Phoenix.HTML.FormField, and these forms carry loose params rather
            than a changeset. --%>
      <form id="user-search" phx-change="search" class="mt-4">
        <input
          type="text"
          name="search[query]"
          value={@query}
          placeholder="Search by username or email"
          class="w-full rounded-lg border-zinc-300"
        />
      </form>

      <p :if={@rows == []} class="mt-6 text-zinc-500">Nobody matches that.</p>

      <ul class="mt-6 space-y-3">
        <li :for={row <- @rows} class="rounded-lg border p-4">
          <div class="flex flex-wrap items-baseline justify-between gap-2">
            <div>
              <span class="font-semibold">{Accounts.display_name(row.user)}</span>
              <span :if={row.user.trusted_at} class="ml-2 text-xs text-emerald-700">trusted</span>
              <span :if={row.user.banned_at} class="ml-2 text-xs text-red-700">banned</span>
            </div>
            <p class="text-sm text-zinc-500">
              {row.review_count} {if row.review_count == 1, do: "review", else: "reviews"} · {row.revoked_count} revoked
            </p>
          </div>

          <p :if={row.user.ban_reason} class="mt-2 text-sm text-red-700">
            {row.user.ban_reason}
          </p>

          <div class="mt-3 flex flex-wrap items-end gap-2">
            <.button
              :if={is_nil(row.user.trusted_at) and not Accounts.admin?(row.user)}
              phx-click="trust"
              phx-value-id={row.user.id}
            >
              Trust
            </.button>

            <.button
              :if={not is_nil(row.user.trusted_at) and not Accounts.admin?(row.user)}
              phx-click="untrust"
              phx-value-id={row.user.id}
            >
              Untrust
            </.button>

            <.button :if={row.user.banned_at} phx-click="unban" phx-value-id={row.user.id}>
              Unban
            </.button>

            <form
              :if={is_nil(row.user.banned_at) and not Accounts.admin?(row.user)}
              id={"ban-#{row.user.id}"}
              phx-submit="ban"
              class="flex items-end gap-2"
            >
              <input type="hidden" name="ban[id]" value={row.user.id} />
              <input
                type="text"
                name="ban[reason]"
                placeholder="Reason"
                class="rounded-lg border-zinc-300 text-sm"
              />
              <.button class="bg-red-600">Ban</.button>
            </form>
          </div>
        </li>
      </ul>
    </div>
    """
  end

  def handle_event("search", %{"search" => %{"query" => query}}, socket)
      when is_binary(query) do
    {:noreply, socket |> assign(query: query) |> load_users()}
  end

  def handle_event("ban", %{"ban" => %{"id" => id, "reason" => reason}}, socket)
      when is_binary(id) and is_binary(reason) do
    {:noreply, apply_ban(socket, id, reason)}
  end

  def handle_event("unban", %{"id" => id}, socket) when is_binary(id) do
    {:noreply,
     apply_action(socket, id, &Moderation.unban_user(&1, socket.assigns.current_user), "Unbanned")}
  end

  def handle_event("trust", %{"id" => id}, socket) when is_binary(id) do
    {:noreply,
     apply_action(socket, id, &Moderation.trust_user(&1, socket.assigns.current_user), "Trusted")}
  end

  def handle_event("untrust", %{"id" => id}, socket) when is_binary(id) do
    {:noreply,
     apply_action(
       socket,
       id,
       &Moderation.untrust_user(&1, socket.assigns.current_user),
       "Untrusted"
     )}
  end

  # A crafted socket frame with a differently-shaped payload — a non-binary
  # id, a missing key, an event name we don't handle — must not raise and
  # kill this process.
  def handle_event(_event, _params, socket), do: {:noreply, socket}

  # `id` comes straight from the client, so it may name an account already
  # deleted since this page was rendered, or not be a row at all. `get_user!`
  # raises on either — `Ecto.NoResultsError` for a well-formed but missing
  # id, `Ecto.Query.CastError` for a non-numeric one — mirroring
  # `EthosWeb.Admin.CommentsLive.decide/4`, so both are caught here rather
  # than crashing the LiveView process.
  defp apply_action(socket, id, action_fun, success_verb) do
    case action_fun.(Accounts.get_user!(id)) do
      {:ok, user} ->
        socket
        |> put_flash(:info, "#{success_verb} #{Accounts.display_name(user)}.")
        |> load_users()

      {:error, :cannot_target_admin} ->
        put_flash(socket, :error, "You cannot change your own trust status.")

      {:error, _} ->
        put_flash(socket, :error, "That could not be changed.")
    end
  rescue
    _ in [Ecto.NoResultsError, Ecto.Query.CastError] ->
      put_flash(socket, :error, "That account no longer exists.")
  end

  defp apply_ban(socket, id, reason) do
    case Moderation.ban_user(Accounts.get_user!(id), reason, socket.assigns.current_user) do
      {:ok, user} ->
        socket
        |> put_flash(:info, "Banned #{Accounts.display_name(user)}.")
        |> load_users()

      {:error, :cannot_ban_admin} ->
        put_flash(socket, :error, "You cannot ban yourself.")

      {:error, _} ->
        put_flash(socket, :error, "That ban needs a reason.")
    end
  rescue
    _ in [Ecto.NoResultsError, Ecto.Query.CastError] ->
      put_flash(socket, :error, "That account no longer exists.")
  end

  defp load_users(socket) do
    assign(socket, rows: Accounts.list_users_for_moderation(search: socket.assigns.query))
  end
end
