defmodule Ethos.Agents.Actions.ParseDump do
  @moduledoc "One Claude call: raw import text -> structured entry proposal. Spec §4.1."
  use Jido.Action,
    name: "parse_dump",
    description: "Structure a raw trip dump into proposed guide entries",
    schema: [import_id: [type: :integer, required: true]]

  alias Ethos.Guides
  alias Ethos.Guides.Entry

  @impl true
  def run(%{import_id: import_id}, _context) do
    import = Guides.get_import!(import_id)
    guide = Guides.get_guide!(import.guide_id)
    {:ok, import} = Guides.mark_import(import, "parsing")

    case Ethos.Claude.impl().parse_dump(import.raw_text, guide.destination) do
      {:ok, raw_entries} ->
        proposal = Enum.filter(raw_entries, &(&1["kind"] in Entry.kinds()))
        {:ok, _} = Guides.mark_import(import, "parsed", %{proposal: proposal})
        {:ok, %{import_id: import_id, proposal: proposal}}

      {:error, reason} ->
        {:ok, _} = Guides.mark_import(import, "failed", %{error: inspect(reason)})
        {:error, reason}
    end
  end
end
