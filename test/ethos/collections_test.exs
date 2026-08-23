defmodule Ethos.CollectionsTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.Collections

  test "upsert_collection! creates, replaces items in order, idempotent" do
    g1 = published_guide_fixture(%{title: "Waterbury"})
    g2 = published_guide_fixture(%{title: "Woodbury"})

    attrs = %{
      slug: "test-collection",
      title: "Test Collection",
      intro: "An **intro**.",
      published: true,
      items: [
        %{guide_slug: g1.slug, blurb: "First"},
        %{guide_slug: g2.slug, blurb: "Second"}
      ]
    }

    c1 = Collections.upsert_collection!(attrs)
    c2 = Collections.upsert_collection!(%{attrs | items: Enum.reverse(attrs.items)})
    assert c1.id == c2.id

    loaded = Collections.get_published_by_slug("test-collection")
    assert [%{blurb: "Second"}, %{blurb: "First"}] = loaded.items
    assert [g2.id, g1.id] == Enum.map(loaded.items, & &1.guide_id)

    assert Collections.collections_for_guide(g1) |> Enum.map(& &1.slug) == ["test-collection"]
  end

  test "unknown guide slug raises; unpublished hidden" do
    assert_raise ArgumentError, ~r/nope-guide/, fn ->
      Collections.upsert_collection!(%{
        slug: "bad",
        title: "Bad",
        intro: nil,
        published: true,
        items: [%{guide_slug: "nope-guide", blurb: nil}]
      })
    end

    g = published_guide_fixture(%{title: "Hidden member"})

    Collections.upsert_collection!(%{
      slug: "draft-col",
      title: "Draft",
      intro: nil,
      published: false,
      items: [%{guide_slug: g.slug, blurb: nil}]
    })

    assert Collections.get_published_by_slug("draft-col") == nil
    assert Collections.list_published() |> Enum.map(& &1.slug) == []
    assert Collections.collections_for_guide(g) == []
  end
end
