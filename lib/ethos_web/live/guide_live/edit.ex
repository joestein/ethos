defmodule EthosWeb.GuideLive.Edit do
  use EthosWeb, :live_view

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    guide = Guides.get_user_guide!(socket.assigns.current_user, id)

    {:ok,
     socket
     |> assign(guide: guide, page_title: "Edit guide")
     |> load_entries()
     |> reset_form()
     |> assign_seo(guide)}
  end

  @impl true
  def handle_event("add", %{"entry" => params}, socket) do
    case Guides.create_entry(socket.assigns.guide, params) do
      {:ok, _entry} -> {:noreply, socket |> load_entries() |> reset_form()}
      {:error, changeset} -> {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    entry = Guides.get_entry!(socket.assigns.guide, id)
    {:ok, _} = Guides.delete_entry(entry)
    {:noreply, load_entries(socket)}
  end

  def handle_event("add-section", _params, socket) do
    {:noreply,
     update(socket, :seo, fn seo ->
       Map.update!(seo, :sections, &(&1 ++ [%{"heading" => "", "body" => ""}]))
     end)}
  end

  def handle_event("remove-section", %{"index" => index}, socket) do
    {:noreply, remove_seo_row(socket, :sections, index)}
  end

  def handle_event("add-faq", _params, socket) do
    {:noreply,
     update(socket, :seo, fn seo ->
       Map.update!(seo, :faq, &(&1 ++ [%{"question" => "", "answer" => ""}]))
     end)}
  end

  def handle_event("remove-faq", %{"index" => index}, socket) do
    {:noreply, remove_seo_row(socket, :faq, index)}
  end

  def handle_event("update_booking", %{"entry" => %{"id" => id} = params}, socket) do
    entry = Guides.get_entry!(socket.assigns.guide, id)

    case Guides.update_entry(entry, Map.take(params, ["booking_url", "booking_label"])) do
      {:ok, _entry} ->
        {:noreply, load_entries(socket)}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Couldn't save the booking link — check the URL")}
    end
  end

  def handle_event("seo_changed", %{"seo" => params}, socket) do
    {:noreply, assign(socket, seo: normalize_seo(params, reject_blank?: false))}
  end

  def handle_event("save_seo", %{"seo" => params}, socket) do
    case Guides.update_guide_seo(socket.assigns.guide, normalize_seo(params)) do
      {:ok, guide} ->
        {:noreply,
         socket
         |> assign(guide: guide)
         |> assign_seo(guide)
         |> put_flash(:info, "Saved")}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Couldn't save — check the fields")}
    end
  end

  defp remove_seo_row(socket, key, index) do
    case Integer.parse(index) do
      {i, ""} ->
        update(socket, :seo, fn seo -> Map.update!(seo, key, &List.delete_at(&1, i)) end)

      _ ->
        socket
    end
  end

  defp load_entries(socket),
    do: assign(socket, entries: Guides.list_entries(socket.assigns.guide))

  defp reset_form(socket),
    do: assign(socket, form: to_form(Entry.changeset(%Entry{}, %{})))

  defp assign_seo(socket, guide) do
    assign(socket,
      seo: %{
        intro: guide.intro || "",
        sections: guide.sections || [],
        faq: guide.faq || []
      }
    )
  end

  defp normalize_seo(params, opts \\ []) do
    reject_blank? = Keyword.get(opts, :reject_blank?, true)

    %{
      intro: Map.get(params, "intro", ""),
      sections:
        params
        |> Map.get("sections", %{})
        |> indexed_map_to_list(["heading", "body"], reject_blank?),
      faq:
        params
        |> Map.get("faq", %{})
        |> indexed_map_to_list(["question", "answer"], reject_blank?)
    }
  end

  defp indexed_map_to_list(map, fields, reject_blank?) when is_map(map) do
    rows =
      map
      |> Enum.sort_by(fn {index, _row} -> String.to_integer(index) end)
      |> Enum.map(fn {_index, row} -> Map.take(row, fields) end)

    if reject_blank? do
      Enum.reject(rows, fn row -> Enum.all?(fields, &blank?(Map.get(row, &1))) end)
    else
      rows
    end
  end

  defp indexed_map_to_list(_map, _fields, _reject_blank?), do: []

  defp blank?(value), do: value in [nil, ""]

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      {@guide.title}
      <:subtitle>{@guide.destination}</:subtitle>
      <:actions>
        <.link navigate={~p"/guides/#{@guide.id}/share"}>
          <.button>Publish</.button>
        </.link>
      </:actions>
    </.header>

    <ul class="mt-6 space-y-3">
      <li :for={entry <- @entries} class="rounded-lg border p-4 flex items-start justify-between">
        <div class="flex-1">
          <p class="font-semibold">{entry.name}</p>
          <p class="text-sm text-zinc-500">
            {entry.kind}
            <span :if={entry.day}>· day {entry.day}</span>
            <span :if={entry.verdict}>· {entry.verdict}</span>
          </p>
          <p :if={entry.note} class="text-sm mt-1">{entry.note}</p>

          <form phx-submit="update_booking" class="mt-2 flex flex-wrap items-end gap-2">
            <input type="hidden" name="entry[id]" value={entry.id} />
            <div>
              <label class="block text-xs text-zinc-500">Booking URL</label>
              <input
                type="text"
                name="entry[booking_url]"
                value={entry.booking_url}
                class="rounded border px-2 py-1 text-sm"
              />
            </div>
            <div>
              <label class="block text-xs text-zinc-500">Booking button label</label>
              <input
                type="text"
                name="entry[booking_label]"
                value={entry.booking_label}
                class="rounded border px-2 py-1 text-sm"
              />
            </div>
            <button class="text-sm underline">Save booking link</button>
          </form>
        </div>
        <button phx-click="delete" phx-value-id={entry.id} class="text-sm text-red-600 underline">
          Delete
        </button>
      </li>
    </ul>

    <h3 class="mt-10 font-semibold">Story &amp; SEO</h3>
    <.simple_form for={%{}} as={:seo} id="seo-form" phx-change="seo_changed" phx-submit="save_seo">
      <.input type="textarea" name="seo[intro]" label="Intro (markdown)" value={@seo.intro} rows="6" />

      <div :for={{section, i} <- Enum.with_index(@seo.sections)} class="rounded border p-3">
        <.input
          name={"seo[sections][#{i}][heading]"}
          label="Section heading"
          value={section["heading"]}
        />
        <.input
          type="textarea"
          name={"seo[sections][#{i}][body]"}
          label="Body (markdown)"
          value={section["body"]}
          rows="4"
        />
        <button
          type="button"
          phx-click="remove-section"
          phx-value-index={i}
          class="text-sm text-red-600 underline"
        >
          Remove section
        </button>
      </div>
      <button type="button" id="add-section" phx-click="add-section" class="text-sm underline">
        + Add section
      </button>

      <div :for={{item, i} <- Enum.with_index(@seo.faq)} class="rounded border p-3">
        <.input name={"seo[faq][#{i}][question]"} label="Question" value={item["question"]} />
        <.input
          type="textarea"
          name={"seo[faq][#{i}][answer]"}
          label="Answer"
          value={item["answer"]}
          rows="2"
        />
        <button
          type="button"
          phx-click="remove-faq"
          phx-value-index={i}
          class="text-sm text-red-600 underline"
        >
          Remove FAQ
        </button>
      </div>
      <button type="button" id="add-faq" phx-click="add-faq" class="text-sm underline">
        + Add FAQ
      </button>

      <:actions>
        <.button>Save story &amp; SEO</.button>
      </:actions>
    </.simple_form>

    <h3 class="mt-10 font-semibold">Add an entry</h3>
    <.simple_form for={@form} id="entry-form" phx-submit="add">
      <.input field={@form[:name]} label="Place / activity" />
      <.input field={@form[:kind]} type="select" label="Kind" options={Entry.kinds()} />
      <.input
        field={@form[:verdict]}
        type="select"
        label="Verdict"
        prompt="—"
        options={Entry.verdicts()}
      />
      <.input field={@form[:day]} type="number" label="Day (optional)" />
      <.input field={@form[:note]} type="textarea" label="Note (optional)" />
      <.input field={@form[:booking_url]} label="Booking URL (optional)" />
      <.input field={@form[:booking_label]} label="Booking button label (optional)" />
      <:actions>
        <.button>Add</.button>
      </:actions>
    </.simple_form>
    """
  end
end
