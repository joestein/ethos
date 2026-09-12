defmodule Ethos.Seeds.DestinationTreeTest do
  # `async: false`: three of these tests call `upsert_all!/0`, whose whole job is
  # to write every roster row. Run async it is a concurrent writer of the same
  # rows as every other full-roster seeder, and two such transactions deadlock or
  # get cancelled — the suite failed about one run in three until the six async
  # writers were dealt with. This one cannot be narrowed: the roster is the
  # subject, not the fixture.
  use Ethos.DataCase, async: false

  alias Ethos.Destinations
  alias Ethos.Seeds.DestinationTree

  test "every roster node declares a known kind and a resolvable parent" do
    nodes = DestinationTree.load!()
    paths = MapSet.new(nodes, & &1["path"])

    for node <- nodes do
      assert node["kind"] in Ethos.Destinations.Destination.kinds(),
             "#{node["path"]} has kind #{inspect(node["kind"])}"

      parent = node["path"] |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      if parent != "" do
        assert MapSet.member?(paths, parent),
               "#{node["path"]} has no parent node #{parent}"
      end
    end
  end

  # The two numbers `docs/runbooks/seeding.md` quotes at the operator: the
  # roster size they verify `Destinations.list_destinations()` against after a
  # rebuild, and the number of curated overlay files whose prose that rebuild
  # restores (which is also where the runbook's 891 tripwire comes from —
  # roster + overlays is the count you see when the overlays are keyed wrong
  # and insert rows of their own).
  #
  # Literals, deliberately, in a suite that otherwise derives everything. A
  # derived expectation cannot go stale, which is exactly why it cannot serve
  # here: the runbook is prose, it says "confirm the count reads 757", and
  # nothing else in this repository would notice the day that stopped being
  # true. An operator following a stale number either proceeds through a short
  # rebuild or stops on a complete one. So the numbers live here, once, and
  # this test failing is the instruction to update that document — change both
  # in the same commit, never one alone.
  test "the roster and overlay counts docs/runbooks/seeding.md quotes are still true" do
    assert length(DestinationTree.load!()) == 876,
           "the roster changed size: update docs/runbooks/seeding.md, which tells the " <>
             "operator to confirm a count of 876 after a rebuild, and this assertion"

    overlays =
      [:code.priv_dir(:ethos) |> to_string(), "seed_data", "destinations", "*.json"]
      |> Path.join()
      |> Path.wildcard()

    assert length(overlays) == 15,
           "the curated overlay corpus changed size: update docs/runbooks/seeding.md, " <>
             "which quotes the file count in step 14 and derives its 891 tripwire from " <>
             "it, and this assertion"
  end

  # docs/runbooks/seeding.md's "Full rebuild total" is the sum the operator
  # compares a from-scratch restore against. It moves with every content wave,
  # and the ski corpus (step 13) is the newest addend — the runbook once said
  # 450 and named twelve corpora, both stale by exactly ski's 82. This is the
  # same class of literal `korean_bbq` once got wrong in production: a step
  # that raises partway through publishes some but not all of its files, and
  # a stale total that is too LOW makes a short run look complete.
  #
  # Every JSON-directory addend is re-derived here rather than hardcoded, the
  # same way the runbook itself says to ("re-derive them ... rather than
  # trusting this sum"): `Path.wildcard/1` over each corpus directory.
  #
  # Two addends stay literal, matching the runbook's own derivation sentence
  # rather than `Ethos.Seeds.Catalog.guide_modules/1`: that function's
  # "connecticut" region also holds `AntiqueTrailGuide`, and its "rome" region
  # is exactly the one Rome-flagship module the runbook already names — so
  # `catalog_count.("connecticut")` returns 6, one more than the "5 CT-5" the
  # runbook's sentence and this total have always meant (Waterbury,
  # Middlebury, Danbury, Southbury, Woodbury only). Whether the Antique Trail
  # guide belongs in this total at all is a pre-existing question this test
  # does not take a position on; it pins the runbook's stated 5 and 1 rather
  # than silently changing what the total means. The ballparks addend IS
  # pulled from the catalog, matching the runbook's own step-7 check, because
  # that region holds nothing else.
  # Only the final expectation, 532, is a literal — this test failing is the
  # instruction to update docs/runbooks/seeding.md's "Full rebuild total" line
  # (and its derivation list, and the "Expected published counts" table's
  # step-13 row) in the same commit as this assertion.
  test "the runbook's full-rebuild total is still 532" do
    dir_count = fn dir ->
      [:code.priv_dir(:ethos) |> to_string(), "seed_data", dir, "*.json"]
      |> Path.join()
      |> Path.wildcard()
      |> length()
    end

    ct5 = 5
    rome_flagship = 1
    ballparks = Ethos.Seeds.Catalog.guide_modules("ballparks") |> length()

    total =
      dir_count.("manhattan") +
        ct5 +
        dir_count.("connecticut") +
        dir_count.("brooklyn") +
        dir_count.("bronx") +
        dir_count.("queens") +
        ballparks +
        dir_count.("san_francisco") +
        dir_count.("london") +
        dir_count.("rome") +
        rome_flagship +
        dir_count.("korean_bbq") +
        dir_count.("steakhouse") +
        dir_count.("ski")

    assert total == 532,
           "the full-rebuild total changed to #{total}: update docs/runbooks/seeding.md's " <>
             "\"Full rebuild total\" line, its derivation list, and the \"Expected published " <>
             "counts\" table's step-13 row, and this assertion, in the same commit"
  end

  # docs/runbooks/seeding.md's step 15 says `seed_collections/0` seeds "eleven
  # collections" and names all eleven — nothing mechanical checked that count
  # before this. Two of the three addends are code lists this test mirrors
  # rather than reads by reflection (Ethos.Release.seed_collections/0's fixed
  # five-module list, and Ethos.Seeds.ScenicBywaysCollections.upsert_all!/0's
  # fixed four), so this test goes stale exactly when either of those two
  # source lists does, same as the runbook's own prose would. The ski addend
  # is genuinely derived: SkiCollections seeds exactly regional/0 and
  # parent/0, so its count is `length/1` of that pair, not a literal.
  test "the runbook's eleven-collections figure at step 15 is still accurate" do
    # Ethos.Release.seed_collections/0's fixed list: BurysCollection,
    # AntiqueTrailCollection, MlbBallparksCollection, KoreanBbqCollection,
    # SteakhouseCollection.
    fixed_collections = 5
    # Ethos.Seeds.ScenicBywaysCollections.upsert_all!/0's fixed list: Merritt
    # Parkway, Route 169, Route 207, Route 7.
    scenic_byways = 4

    ski_collections =
      length([Ethos.Seeds.SkiCollections.regional(), Ethos.Seeds.SkiCollections.parent()])

    total = fixed_collections + scenic_byways + ski_collections

    assert total == 11,
           "seed_collections/0 now seeds #{total} collections, not eleven: update " <>
             "docs/runbooks/seeding.md's step 15, which names all eleven, and this assertion"
  end

  test "roster paths are unique" do
    paths = Enum.map(DestinationTree.load!(), & &1["path"])
    assert length(paths) == length(Enum.uniq(paths))
  end

  test "legacy paths are unique across the whole roster" do
    legacy = Enum.flat_map(DestinationTree.load!(), &(&1["legacy_paths"] || []))
    assert length(legacy) == length(Enum.uniq(legacy))
  end

  # The structural guard behind the 301s, and it names its offenders because
  # the roster now carries hundreds of legacy paths and a bare "n != n - 1" locates
  # nothing.
  #
  # Repeated: `Destinations.get_by_legacy_path/1` is a `Repo.one`, which
  # *raises* on a second match rather than picking one. A duplicate would not
  # be a wrong redirect, it would be a 500 on one unlucky indexed URL and a
  # green suite everywhere else.
  #
  # Shadowing: a legacy path equal to some node's own path is a URL two nodes
  # claim. `DestinationController.show/2` resolves the exact node first, so the
  # real node wins and the legacy entry is dead weight that reads like a live
  # redirect — `vatican-city` is the case this caught, a country node and a
  # guide's town slug at once. The rule is that the roster cannot express one.
  test "no legacy path repeats, and none shadows a real node path" do
    nodes = DestinationTree.load!()

    owners =
      for node <- nodes, legacy <- node["legacy_paths"] || [], reduce: %{} do
        acc -> Map.update(acc, legacy, [node["path"]], &[node["path"] | &1])
      end

    repeated = for {legacy, [_, _ | _] = claimants} <- owners, do: {legacy, Enum.sort(claimants)}

    assert repeated == [],
           "legacy paths claimed by more than one node: #{inspect(repeated)}"

    paths = MapSet.new(nodes, & &1["path"])
    shadowing = for {legacy, _} <- owners, MapSet.member?(paths, legacy), do: legacy

    assert shadowing == [],
           "legacy paths that are also real node paths, so the redirect is dead: " <>
             inspect(Enum.sort(shadowing))
  end

  test "upsert_all!/0 wires parent_id to match every path, idempotently" do
    count = DestinationTree.upsert_all!()
    assert count == length(DestinationTree.load!())

    manhattan = Destinations.get_by_path("united-states/new-york/new-york-city/manhattan")
    assert manhattan.kind == "borough"

    assert Enum.map(Destinations.ancestors(manhattan), & &1.path) == [
             "united-states",
             "united-states/new-york",
             "united-states/new-york/new-york-city"
           ]

    assert DestinationTree.upsert_all!() == count

    assert Destinations.get_by_path("united-states/new-york/new-york-city/manhattan").id ==
             manhattan.id
  end

  test "every seeded node's parent_id agrees with its path" do
    DestinationTree.upsert_all!()

    for d <- Destinations.list_destinations() do
      expected = d.path |> String.split("/") |> Enum.drop(-1) |> Enum.join("/")

      case d.parent_id do
        nil -> assert expected == "", "#{d.path} is a root but its path has a parent"
        id -> assert Ethos.Repo.get!(Destinations.Destination, id).path == expected
      end
    end
  end

  # The ski corpus files every area on the town node where it sits in an
  # incorporated town and the county node where it does not (spec §3), and
  # `DataGuide.upsert_places!/1` RAISES on a path no node owns — a missing node
  # is a seed-time abort partway through a production restore, not a silent
  # orphan. So the roster's paths and the tree's paths are checked against each
  # other here, before any content exists to trip over them.
  test "every built ski roster row names a node the tree declares" do
    roster =
      ["priv", "seed_data", "ski_areas_roster.json"]
      |> Path.join()
      |> File.read!()
      |> Jason.decode!()

    paths = MapSet.new(DestinationTree.load!(), & &1["path"])

    missing =
      for area <- roster["areas"],
          area["status"] == "build",
          not MapSet.member?(paths, area["destination_path"]),
          do: "#{area["slug"]} -> #{area["destination_path"]}"

    assert missing == [],
           "these ski areas name destination nodes the roster does not declare, and " <>
             "seeding them would raise: #{inspect(missing)}"
  end
end
