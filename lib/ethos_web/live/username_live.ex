defmodule EthosWeb.UsernameLive do
  @moduledoc """
  Lets a user claim a real username.

  Reached by anyone whose name was invented by the backfill migration. It is
  not gated to those users only — changing your mind about your name is
  reasonable — but the header only advertises it while the provisional flag
  is set.
  """
  use EthosWeb, :live_view

  alias Ethos.Accounts

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Pick your username
        <:subtitle>
          This is the name shown on everything you post. Your email address is
          never public.
        </:subtitle>
      </.header>

      <.simple_form for={@form} id="username_form" phx-submit="save" phx-change="validate">
        <.input field={@form[:username]} type="text" label="Username" required />

        <:actions>
          <.button phx-disable-with="Saving..." class="w-full">Save username</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    # Starts empty rather than prefilled with the current (possibly
    # backfill-derived) name: prefilling would make "keep the name derived
    # from my email address" the one-click default. Passing an explicit
    # empty string (rather than %{}) is what makes the field empty — an
    # empty attrs map casts no change, and the form would fall back to
    # displaying the underlying (unwanted) current value.
    changeset = Accounts.change_user_username(user, %{"username" => ""})

    {:ok, assign_form(socket, changeset)}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset =
      socket.assigns.current_user
      |> Accounts.change_user_username(params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"user" => params}, socket) do
    case Accounts.update_user_username(socket.assigns.current_user, params) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "You're now #{user.username}.")
         |> redirect(to: ~p"/")}

      {:error, changeset} ->
        {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
    end
  end

  defp assign_form(socket, changeset) do
    assign(socket, form: to_form(changeset, as: "user"))
  end
end
