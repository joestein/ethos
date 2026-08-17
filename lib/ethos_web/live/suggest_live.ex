defmodule EthosWeb.SuggestLive do
  use EthosWeb, :live_view

  alias Ethos.{Contributions, Guides}
  alias Ethos.Contributions.Suggestion

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    guide = Guides.get_published_guide_by_slug!(slug)

    {:ok,
     assign(socket,
       guide: guide,
       form: to_form(Suggestion.changeset(%Suggestion{}, %{})),
       page_title: "Suggest a place"
     )}
  end

  @impl true
  def handle_event("save", %{"suggestion" => params}, socket) do
    case Contributions.create_suggestion(
           socket.assigns.current_user,
           socket.assigns.guide,
           params
         ) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Thanks! The guide owner will review your suggestion.")
         |> push_navigate(to: ~p"/g/#{socket.assigns.guide.slug}")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Suggest a place for “{@guide.title}”
      <:subtitle>If the owner accepts it, you'll be credited on the guide.</:subtitle>
    </.header>

    <.simple_form for={@form} id="suggest-form" phx-submit="save">
      <.input field={@form[:place_name]} label="Place / tip" />
      <.input
        field={@form[:kind_hint]}
        type="select"
        label="Kind"
        prompt="—"
        options={Ethos.Guides.Entry.kinds()}
      />
      <.input field={@form[:body]} type="textarea" label="Why it belongs in this guide" />
      <:actions>
        <.button>Send suggestion</.button>
      </:actions>
    </.simple_form>
    """
  end
end
