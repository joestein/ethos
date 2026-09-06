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

  test "a blurb longer than the column is rejected by the changeset, not by Postgres" do
    # `add :blurb, :string` is a varchar(255), and the changeset validated 300
    # for as long as this schema existed — so a blurb in that gap passed
    # validation and then raised a Postgrex error at insert time, reporting a
    # database constraint rather than a blurb being too long. This is the
    # regression guard: the two numbers must not drift apart again.
    g = published_guide_fixture(%{title: "Long blurb"})

    over = String.duplicate("a", 256)

    assert_raise Ecto.InvalidChangesetError, fn ->
      Collections.upsert_collection!(%{
        slug: "long-blurb-col",
        title: "Long",
        intro: nil,
        published: true,
        items: [%{guide_slug: g.slug, blurb: over}]
      })
    end

    # And the boundary itself publishes, so the rule is exactly the column
    # width rather than merely somewhere below it.
    at_limit = String.duplicate("a", 255)

    collection =
      Collections.upsert_collection!(%{
        slug: "at-limit-col",
        title: "At limit",
        intro: nil,
        published: true,
        items: [%{guide_slug: g.slug, blurb: at_limit}]
      })

    assert [%{blurb: ^at_limit}] = Collections.get_published_by_slug(collection.slug).items
  end
end
