defmodule Ethos.Adjacency.LinkBuilderTest do
  use Ethos.DataCase, async: false

  import Ecto.Query
  import Ethos.GuidesFixtures

  alias Ethos.Adjacency.LinkBuilder
  alias Ethos.Links.Link
  alias Ethos.Repo

  defp ct_guide(town) do
    slug = town |> String.downcase() |> String.replace(~r/[^a-z0-9]+/, "-") |> String.trim("-")

    published_guide_fixture(%{
      title: town,
      destination: "#{town}, Connecticut",
      state: "Connecticut",
      county: "Hartford County"
    })
    |> Ecto.Changeset.change(slug: "#{slug}-ct-travel-guide")
    |> Ethos.Repo.update!()
  end

  defp nearby_count do
    Repo.aggregate(from(l in Link, where: l.kind == "nearby"), :count)
  end

  test "writes one edge per border between guides that exist" do
    # Avon borders Canton and Simsbury among others. With only these three
    # seeded, exactly the borders among them should be written.
    for t <- ["Avon", "Canton", "Simsbury"], do: ct_guide(t)

    assert :ok = LinkBuilder.build!()
    assert nearby_count() > 0
  end

  test "does not write both directions of the same border" do
    # Ethos.Links.links_for/2 unions outgoing and incoming edges, so a second
    # row for the reverse would list every neighbour twice on both pages.
    for t <- ["Avon", "Canton"], do: ct_guide(t)
    :ok = LinkBuilder.build!()

    avon = Repo.get_by!(Ethos.Guides.Guide, slug: "avon-ct-travel-guide")
    canton = Repo.get_by!(Ethos.Guides.Guide, slug: "canton-ct-travel-guide")

    both =
      Repo.all(
        from l in Link,
          where:
            l.kind == "nearby" and
              ((l.source_id == ^avon.id and l.target_id == ^canton.id) or
                 (l.source_id == ^canton.id and l.target_id == ^avon.id))
      )

    assert length(both) == 1
  end

  test "is idempotent" do
    for t <- ["Avon", "Canton", "Simsbury"], do: ct_guide(t)

    :ok = LinkBuilder.build!()
    first = nearby_count()
    :ok = LinkBuilder.build!()

    assert nearby_count() == first
  end

  test "skips a border whose guide is missing without raising" do
    # Only one of the pair exists; the border must be skipped, not raised on.
    ct_guide("Avon")
    assert :ok = LinkBuilder.build!()
  end

  test "writes nothing at all when no Connecticut guides exist" do
    assert :ok = LinkBuilder.build!()
    assert nearby_count() == 0
  end

  test "the note names the relationship" do
    for t <- ["Avon", "Canton"], do: ct_guide(t)
    :ok = LinkBuilder.build!()

    link = Repo.one!(from l in Link, where: l.kind == "nearby", limit: 1)
    assert link.note =~ "border"
  end

  test "skips a border that is already linked in the reverse direction" do
    for t <- ["Avon", "Canton"], do: ct_guide(t)

    avon = Repo.get_by!(Ethos.Guides.Guide, slug: "avon-ct-travel-guide")
    canton = Repo.get_by!(Ethos.Guides.Guide, slug: "canton-ct-travel-guide")

    # Someone else's curated edge, in the opposite direction to ours.
    Ethos.Links.upsert_link!(%{
      source: {:guide, canton.slug},
      target: {:guide, avon.slug},
      kind: "nearby",
      note: "Canton borders Avon; both are reached on US Route 44."
    })

    before = nearby_count()
    assert :ok = LinkBuilder.build!()

    # No second edge for that pair, and the curated note survives.
    assert nearby_count() == before

    edge =
      Repo.one!(
        from l in Ethos.Links.Link,
          where: l.kind == "nearby" and l.source_id == ^canton.id and l.target_id == ^avon.id
      )

    assert edge.note =~ "US Route 44"
  end
end
