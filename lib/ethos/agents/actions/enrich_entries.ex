defmodule Ethos.Agents.Actions.EnrichEntries do
  @moduledoc "exa enrichment per entry, cache-first, zero AI. Spec §4.2."
  use Jido.Action,
    name: "enrich_entries",
    description: "Resolve official links for each guide entry via exa",
    schema: [guide_id: [type: :integer, required: true]]

  alias Ethos.{Guides, Research}

  @impl true
  def run(%{guide_id: guide_id}, _context) do
    guide = Guides.get_guide!(guide_id)

    {enriched, failed} =
      guide
      |> Guides.list_entries()
      |> Enum.filter(&(&1.kind != "tip" and is_nil(&1.enrichment)))
      |> Enum.reduce({0, 0}, fn entry, {ok, err} ->
        case Research.enrich_place(entry.name, guide.destination) do
          {:ok, payload} ->
            {:ok, _} = Guides.set_entry_enrichment(entry, payload)
            {ok + 1, err}

          {:error, _} ->
            {ok, err + 1}
        end
      end)

    {:ok, %{guide_id: guide_id, enriched: enriched, failed: failed}}
  end
end
