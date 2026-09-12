defmodule Ethos.Seeds.BackfillLinksTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.Seeds

  test "backfill is idempotent and only links pages that exist" do
    user = user_fixture()
    Ethos.SeedDataHelpers.seed_destinations_for!([Seeds.ConnecticutPlaces])
    Seeds.ConnecticutPlaces.upsert_all!()
    Seeds.WoodburyGuide.upsert!(user.email)
    Seeds.SouthburyGuide.upsert!(user.email)
    # Manhattan guides absent — their edges must be skipped, not raise

    n1 = Seeds.BackfillLinks.upsert_all!()
    n2 = Seeds.BackfillLinks.upsert_all!()
    assert n1 == n2 and n1 > 0

    woodbury = Ethos.Guides.get_published_guide_by_slug!("woodbury-ct-travel-guide")
    connected = Ethos.Links.links_for("guide", woodbury.id)

    assert Enum.any?(
             connected,
             &(&1.other.slug == "southbury-ct-travel-guide" and &1.kind == "shared-history")
           )
  end

  # `upsert_all!/0` silently SKIPS an edge whose endpoints are not yet seeded
  # (by design, for ordering) rather than raising — which also means a guide
  # rename drops the edge with no error and no red test, unless something
  # reads `ski_migration_edges/0` directly and checks it against the corpus.
  test "every ski migration edge names two guides the seed corpus actually defines" do
    all_guides =
      for f <- Path.wildcard(Path.join(["priv", "seed_data", "*", "*.json"])),
          doc = f |> File.read!() |> Jason.decode!(),
          is_map(doc["guide"]),
          into: MapSet.new(),
          do: doc["guide"]["slug"]

    edges = Seeds.BackfillLinks.ski_migration_edges()

    # Four town->ski edges and their four ski->town reverse edges (spec: the
    # ski wave 8 migration links both directions).
    assert length(edges) == 8

    for {a, b, _kind, _note} <- edges do
      assert MapSet.member?(all_guides, a),
             "#{a}: not a guide slug any seed file defines — a rename would silently " <>
               "drop this edge, since BackfillLinks skips rather than raises"

      assert MapSet.member?(all_guides, b),
             "#{b}: not a guide slug any seed file defines — a rename would silently " <>
               "drop this edge, since BackfillLinks skips rather than raises"
    end
  end
end
