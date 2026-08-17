defmodule EthosWeb.GuideLive.New do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Guide

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(Guide.changeset(%Guide{}, %{})), page_title: "New guide")}
  end

  @impl true
  def handle_event("save", %{"guide" => params}, socket) do
    case Guides.create_guide(socket.assigns.current_user, params) do
      {:ok, guide} ->
        {:noreply, push_navigate(socket, to: ~p"/guides/#{guide.id}/import")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>Start a guide</.header>
    <.simple_form for={@form} id="guide-form" phx-submit="save">
      <.input field={@form[:title]} label="Trip title" placeholder="Lisbon in 5 days" />
      <.input field={@form[:destination]} label="Destination" placeholder="Lisbon, Portugal" />
      <.input field={@form[:starts_on]} type="date" label="Started (optional)" />
      <.input field={@form[:ends_on]} type="date" label="Ended (optional)" />
      <:actions><.button>Continue</.button></:actions>
    </.simple_form>
    """
  end
end
