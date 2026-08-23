defmodule Ethos.LinksTest do
  use Ethos.DataCase, async: true

  import Ethos.GuidesFixtures
  alias Ethos.{Links, Places}

  defp place!(slug, name) do
    Places.upsert_place!(%{
      slug: slug,
      name: name,
      kind: "museum",
      town: "Testville",
      state: "New York",
      county: "Manhattan",
      summary: "x"
    })
  end

  test "upsert_link! resolves slugs, is idempotent, updates note" do
    g = published_guide_fixture(%{title: "Guide A"})
    p = place!("place-a", "Place A")

    l1 =
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:place, "place-a"},
        kind: "nearby",
        note: "steps away"
      })

    l2 =
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:place, "place-a"},
        kind: "nearby",
        note: "around the corner"
      })

    assert l1.id == l2.id
    assert l2.note == "around the corner"
    assert l1.source_type == "guide" and l1.source_id == g.id
    assert l1.target_type == "place" and l1.target_id == p.id
  end

  test "bad slug, bad kind, long note, and self-link raise" do
    g = published_guide_fixture(%{title: "Guide B"})

    assert_raise ArgumentError, ~r/no-such-slug/, fn ->
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:guide, "no-such-slug"},
        kind: "nearby",
        note: nil
      })
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:guide, g.slug},
        kind: "nearby",
        note: nil
      })
    end

    g2 = published_guide_fixture(%{title: "Guide C"})

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:guide, g2.slug},
        kind: "friends",
        note: nil
      })
    end

    assert_raise Ecto.InvalidChangesetError, fn ->
      Links.upsert_link!(%{
        source: {:guide, g.slug},
        target: {:guide, g2.slug},
        kind: "nearby",
        note: String.duplicate("a", 161)
      })
    end
  end

  test "links_for returns union of outgoing and incoming, hydrated" do
    g = published_guide_fixture(%{title: "Hub Guide", destination: "Hubtown, New York"})
    p1 = place!("out-place", "Out Place")
    p2 = place!("in-place", "In Place")

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:place, "out-place"},
      kind: "nearby",
      note: nil
    })

    Links.upsert_link!(%{
      source: {:place, "in-place"},
      target: {:guide, g.slug},
      kind: "shared-history",
      note: "old ties"
    })

    results = Links.links_for("guide", g.id)
    assert length(results) == 2

    nearby = Enum.find(results, &(&1.kind == "nearby"))
    assert nearby.other.slug == "out-place"
    assert nearby.other.title == "Out Place"
    assert nearby.other.type == "place"
    assert nearby.other.subtitle == "museum · Testville"

    hist = Enum.find(results, &(&1.kind == "shared-history"))
    assert hist.other.slug == "in-place"
    assert hist.note == "old ties"

    assert p1.id != p2.id
  end

  test "prune_orphans removes edges whose endpoints are gone" do
    g = published_guide_fixture(%{title: "Doomed"})
    g2 = published_guide_fixture(%{title: "Stays"})

    Links.upsert_link!(%{
      source: {:guide, g.slug},
      target: {:guide, g2.slug},
      kind: "see-also",
      note: nil
    })

    Repo.delete!(g)
    assert Links.prune_orphans() == 1
    assert Links.links_for("guide", g2.id) == []
  end
end
