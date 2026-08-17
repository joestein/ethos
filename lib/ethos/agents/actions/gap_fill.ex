defmodule Ethos.Agents.Actions.GapFill do
  @moduledoc "Publish-time only. Max 3 exa queries + exactly 1 Claude call. Spec §4.3."
  use Jido.Action,
    name: "gap_fill",
    description: "Suggest up to 5 nearby ideas the author didn't mention",
    schema: [guide_id: [type: :integer, required: true]]

  alias Ethos.{Contributions, Guides, Research}

  @query_kinds ~w(food sight walk)

  @impl true
  def run(%{guide_id: guide_id}, _context) do
    guide = Guides.get_guide!(guide_id)
    entries = Guides.list_entries(guide)
    existing = Enum.map(entries, & &1.name)
    candidates = Research.destination_candidates(guide.destination, @query_kinds)

    # No candidates means there's nothing for Claude to pick from — the exa
    # budget is a ceiling, not a guarantee, and an empty candidate list can't
    # yield ideas. Skip the (budgeted) Claude call entirely in that case.
    if candidates == [] do
      {:ok, %{guide_id: guide_id, created: 0}}
    else
      with {:ok, ideas} <-
             Ethos.Claude.impl().pick_nearby(guide.destination, existing, candidates),
           {:ok, suggestions} <-
             Contributions.create_gap_fill_suggestions(guide, Enum.take(ideas, 5)) do
        {:ok, %{guide_id: guide_id, created: length(suggestions)}}
      else
        _ -> {:ok, %{guide_id: guide_id, created: 0}}
      end
    end
  end
end
