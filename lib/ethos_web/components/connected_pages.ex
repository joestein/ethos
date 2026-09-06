defmodule EthosWeb.ConnectedPages do
  @moduledoc "Renders grouped page links between guides and places."

  use Phoenix.Component
  use EthosWeb, :verified_routes

  @order ~w(nearby shared-history same-region see-also)
  @headings %{
    "nearby" => "Nearby",
    "shared-history" => "Shared history",
    "same-region" => "Same region",
    "see-also" => "See also"
  }

  attr :connected, :list, required: true

  def connected_pages(assigns) do
    groups =
      assigns.connected
      |> Enum.group_by(& &1.kind)
      |> Enum.sort_by(fn {kind, _} ->
        Enum.find_index(@order, &(&1 == kind)) || 99
      end)

    assigns = assign(assigns, :groups, groups) |> assign(:headings, @headings)

    ~H"""
    <section :if={@connected != []} class="mt-10 border-t border-line pt-6">
      <h2 class="text-xl font-semibold">Connected pages</h2>
      <div :for={{kind, items} <- @groups} class="mt-4">
        <h3 class="text-sm uppercase tracking-wide text-ink-muted">
          {Map.get(@headings, kind, kind)}
        </h3>
        <ul class="mt-2 space-y-2">
          <li :for={item <- items}>
            <.link navigate={other_path(item.other)} class="font-medium underline">
              {item.other.title}
            </.link>
            <span class="text-sm text-ink-muted">· {item.other.subtitle}</span>
            <p :if={item.note} class="text-sm text-ink-muted">{item.note}</p>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  defp other_path(%{type: "guide", slug: slug}), do: ~p"/g/#{slug}"
  defp other_path(%{type: "place", slug: slug}), do: ~p"/p/#{slug}"
end
