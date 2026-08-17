defmodule Ethos.Contributions do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Contributions.Suggestion
  alias Ethos.Guides

  def create_suggestion(author, guide, attrs) do
    %Suggestion{guide_id: guide.id, author_id: author.id, origin: "user"}
    |> Suggestion.changeset(attrs)
    |> Repo.insert()
  end

  def create_gap_fill_suggestions(guide, ideas) do
    suggestions =
      Enum.map(ideas, fn idea ->
        %Suggestion{guide_id: guide.id, origin: "gap_fill"}
        |> Suggestion.changeset(%{
          place_name: idea["name"],
          body: idea["reason"],
          url: idea["url"],
          kind_hint: idea["kind"]
        })
        |> Repo.insert!()
      end)

    {:ok, suggestions}
  end

  def list_pending_suggestions(guide) do
    Repo.all(
      from s in Suggestion,
        where: s.guide_id == ^guide.id and s.status == "pending",
        order_by: [asc: s.id],
        preload: [:author]
    )
  end

  def get_suggestion!(guide, id), do: Repo.get_by!(Suggestion, id: id, guide_id: guide.id)

  def accept_suggestion(%Suggestion{status: "pending"} = suggestion) do
    guide = Guides.get_guide!(suggestion.guide_id)
    source = if suggestion.origin == "gap_fill", do: "gap_fill", else: "suggestion"

    Repo.transaction(fn ->
      {:ok, entry} =
        Guides.create_entry(guide, %{
          kind: suggestion.kind_hint || "tip",
          name: suggestion.place_name,
          note: suggestion.body,
          source: source,
          credited_user_id: suggestion.author_id
        })

      {:ok, suggestion} =
        suggestion
        |> Ecto.Changeset.change(status: "accepted", accepted_entry_id: entry.id)
        |> Repo.update()

      %{suggestion: suggestion, entry: entry}
    end)
  end

  def decline_suggestion(%Suggestion{} = suggestion) do
    suggestion |> Ecto.Changeset.change(status: "declined") |> Repo.update()
  end
end
