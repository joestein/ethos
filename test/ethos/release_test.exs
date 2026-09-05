defmodule Ethos.ReleaseTest do
  use Ethos.DataCase, async: false

  import ExUnit.CaptureIO
  import ExUnit.CaptureLog
  import Ethos.AccountsFixtures

  alias Ethos.Places
  alias Ethos.Places.DeletedPlaces
  alias Ethos.SeedDataHelpers

  # This test was originally written against an empty priv/seed_data/brooklyn/,
  # asserting that seeding it was a no-op rather than a crash so the release
  # runbook order was valid before any wave landed. Wave 1 has landed, so the
  # empty-directory premise is gone; what still needs proving is the same
  # runbook property in its post-wave form — seed_brooklyn/1 publishes exactly
  # the committed files and can be run again without duplicating them.
  test "seed_brooklyn/1 publishes the committed Brooklyn seed files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("brooklyn"))

    # The runbook order is seed_manhattan -> seed_connecticut ->
    # seed_connecticut_expansion -> seed_brooklyn, so Manhattan's guides always
    # exist by the time Brooklyn is seeded. Wave 2 is the first wave to author
    # the cross-borough see-also edges rule 11 of the content rules provides
    # for (Williamsburg and South Williamsburg both link to the Lower East Side
    # over the Williamsburg Bridge), and Links.resolve!/1 raises on an unknown
    # target rather than skipping the edge. Reproduce the documented
    # precondition here; the assertions below still count Brooklyn guides only.
    Ethos.Release.seed_manhattan(user.email)

    Ethos.Release.seed_brooklyn(user.email)

    brooklyn = fn ->
      Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Brooklyn"))
    end

    assert length(brooklyn.()) == expected

    Ethos.Release.seed_brooklyn(user.email)

    assert length(brooklyn.()) == expected
  end

  # The Bronx equivalent, written at the stage Brooklyn's was: the directory
  # holds only .gitkeep. What needs proving now is not that guides publish —
  # none exist — but that the release hook points at a directory that is really
  # there. `seed_directory/2` takes the directory as a string literal and globs
  # it, so `seed_directory("brnox", email)` seeds nothing, raises nothing, and
  # prints a cheerful "Seeded 0 files": a silent production no-op that
  # bronx_seed_data_test.exs cannot see, because the gate reads the filesystem
  # and never calls the release module.
  #
  # Written against `seed_files("bronx")` rather than against the literal 0, so
  # it does not expire the way Brooklyn's did. When wave 1 lands this becomes
  # the same publishes-exactly-the-committed-files assertion Brooklyn's is now,
  # with no edit.
  test "seed_bronx/1 publishes exactly the committed Bronx seed files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("bronx"))

    # The runbook order is seed_manhattan -> seed_connecticut ->
    # seed_connecticut_expansion -> seed_brooklyn -> seed_bronx. Manhattan is
    # reproduced here because Links.resolve!/1 raises on an unknown target
    # rather than skipping the edge, and the Bronx's cross-borough see-also
    # edges point across the Harlem River. If a wave authors an edge to a
    # Brooklyn guide, seed_brooklyn/1 belongs here too.
    #
    # A wave now has: priv/seed_data/bronx/bronx-park.json carries a see-also
    # edge to `place:new-york-aquarium`, which priv/seed_data/brooklyn/
    # coney-island.json defines — the shared Wildlife Conservation Society
    # operator tie. So seed_brooklyn/1 is reproduced here as well, in runbook
    # order. Without it Links.resolve!/1 raises on that target and aborts the
    # whole Bronx link pass, which is exactly the production failure the
    # runbook order exists to prevent — the precondition is real, not a
    # convenience for this test. The assertions below still count Bronx guides
    # only, so the extra seed calls cannot inflate them.
    #
    # A later wave adds a third, and this one is NOT a sibling directory:
    # priv/seed_data/bronx/concourse.json links to `guide:yankee-stadium-guide`,
    # a code seed in the "ballparks" region. That edge is load-bearing rather
    # than decorative — the Yankee Stadium guide owns twelve places that sit
    # inside Concourse's boundaries, since a marquee institution belongs to
    # exactly one seed file, and Concourse links to them instead of restating
    # them. So seed_ballparks/1 is now a genuine precondition of seed_bronx/1
    # and belongs in the runbook order before it. It is called through the
    # release function rather than the two modules directly, because what this
    # test exists to catch is a production seed that silently does the wrong
    # thing, and shortcutting the real call is how that check goes soft.
    Ethos.Release.seed_manhattan(user.email)
    Ethos.Release.seed_brooklyn(user.email)
    Ethos.Release.seed_ballparks(user.email)

    output = capture_io(fn -> Ethos.Release.seed_bronx(user.email) end)

    # The directory literal is the thing under test, and the only place it is
    # observable is what the module prints — so parse it back OUT of the report
    # rather than asserting a substring of it.
    #
    # `=~` is containment, which is the wrong tool here and failed the way
    # containment always does: "Seeded 0 files from priv/seed_data/bronxs\n"
    # CONTAINS "…/bronx". Transposition typos (brnox) were caught; every
    # prefix-extension typo — bronxs, bronx2, bronx_guides, "bronx/" — was not.
    # An earlier version of this test also asserted File.dir? on a "bronx"
    # hardcoded here, which never consulted what seed_bronx/1 passes and so
    # could not fail for the reason its own message gave.
    #
    # Captured to the newline and compared for equality, then resolved on disk
    # through the SAME captured value, so both the name and its existence are
    # checked against what the module actually did.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_bronx/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "bronx",
           "seed_bronx/1 seeds priv/seed_data/#{dir}, not priv/seed_data/bronx — a directory " <>
             "literal that matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_bronx/1 names priv/seed_data/#{dir}, which does not exist — a silent no-op"

    # seed_ballparks/1 above published the Yankee Stadium guide, whose county is
    # "Bronx", so it has to come back out of this count — it is a code seed, not
    # one of the files seed_bronx/1 is being measured on. Rejected by slug
    # rather than by bumping `expected`, so a committed file that stopped
    # publishing still fails here instead of being masked by the extra guide.
    bronx = fn ->
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "Bronx"))
      |> Enum.reject(&(&1.slug == "yankee-stadium-guide"))
    end

    assert length(bronx.()) == expected

    capture_io(fn -> Ethos.Release.seed_bronx(user.email) end)

    assert length(bronx.()) == expected
  end

  # Queens ships before its research does, so `expected` is 0 for now and the
  # publishes-exactly-the-committed-files half of this test is vacuous. The
  # directory-literal half is NOT — it is fully load-bearing at zero files,
  # because seed_directory/2 prints its report whether or not it matched
  # anything. That is the exact inversion of the gate's situation, and it is
  # why this test ships running rather than tagged.
  test "seed_queens/1 names the Queens seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("queens"))

    # Manhattan is reproduced because Links.resolve!/1 raises on an unknown
    # target rather than skipping the edge. When a wave authors see-also edges
    # to Brooklyn or Bronx guides, add those seeders here too.
    Ethos.Release.seed_manhattan(user.email)

    # Wave 1 made seed_ballparks/1 a real precondition of seed_queens/1, the
    # same way concourse.json made it one for seed_bronx/1. Both Queens guides
    # that link outside the borough link to /g/citi-field-guide, and they link
    # there because Ethos.Seeds.CitiFieldPlaces already owns eight places in
    # county "Queens" — the Unisphere, the Queens Museum, the Hall of Science,
    # the Queens Zoo, the Tennis Center, the State Pavilion and the Queens
    # Theatre, alongside the ballpark. Neighborhood guides reference those and
    # never re-create them, so the link is what keeps that rule honest and it
    # has to resolve. Without this line the Queens link pass raises here.
    #
    # It runs BEFORE `before` is measured, which is what keeps the delta below
    # correct: the Citi Field guide's county is "Queens", so it must be inside
    # the baseline rather than arriving between the two counts.
    Ethos.Release.seed_ballparks(user.email)

    before =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    output = capture_io(fn -> Ethos.Release.seed_queens(user.email) end)

    # The directory literal is the thing under test, and the only place it is
    # observable is what the module prints — so parse it back OUT of the report
    # rather than asserting a substring of it. `=~` is containment, which is the
    # wrong tool here: "Seeded 0 files from priv/seed_data/queenss\n" CONTAINS
    # "…/queens". Every prefix-extension typo — queenss, queens2, queens_guides,
    # "queens/" — survives containment. Captured to the newline and compared for
    # equality, then resolved on disk through the SAME captured value.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_queens/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "queens",
           "seed_queens/1 seeds priv/seed_data/#{dir}, not priv/seed_data/queens — a directory " <>
             "literal that matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_queens/1 names priv/seed_data/#{dir}, which does not exist — a silent no-op"

    # A DELTA, not an absolute count. citi-field-guide is code-defined and
    # carries county "Queens"; an absolute count would be correct only for as
    # long as this test never seeds code guides, and would then fail pointing
    # at the seed directory rather than at the guide it did not expect.
    after_first =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_queens(user.email) end)

    after_second =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county == "Queens"))

    assert after_second == after_first, "seed_queens/1 is not idempotent"
  end

  # Rome ships before its research does, so `expected` is 0 for now and the
  # publishes-exactly-the-committed-files half is vacuous — the same position
  # seed_queens/1 was in when it landed. The directory-literal half is fully
  # load-bearing at zero files, because seed_directory/2 prints its report
  # whether or not it matched anything, and that is why this ships running
  # rather than tagged.
  #
  # Rome is the first destination outside the United States, so this is also
  # the first place the county/state pair is checked for a non-US corpus:
  # "Italy"/"Rome" rather than a state name and a county name.
  # San Francisco ships before its research does, so `expected` is 0 for now and
  # the publishes-what-was-committed half is vacuous. The directory-literal half
  # is fully load-bearing at zero files, because seed_directory/2 prints its
  # report whether or not it matched anything — which is the exact inversion of
  # the gate's situation and why this ships running rather than tagged.
  test "seed_san_francisco/1 names its seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("san_francisco"))

    # oracle-park-guide is a CODE seed and carries county "San Francisco", so it
    # has to come out of this count — seed_san_francisco/1 calls
    # seed_ballparks/1 internally, which would otherwise inflate the delta by
    # one. Rejected by slug rather than by bumping `expected`, so a committed
    # file that stopped publishing still fails here instead of being masked by
    # the extra guide. This is the shape the Bronx test uses for Yankee Stadium.
    sf = fn ->
      Ethos.Guides.list_published_guides()
      |> Enum.filter(&(&1.county == "San Francisco"))
      |> Enum.reject(&(&1.slug == "oracle-park-guide"))
      |> length()
    end

    before = sf.()

    output = capture_io(fn -> Ethos.Release.seed_san_francisco(user.email) end)

    # Parsed back OUT of the report and compared for equality, not containment —
    # "Seeded 0 files from priv/seed_data/san_franciscos\n" CONTAINS the right
    # path, so every prefix-extension typo survives `=~`.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_san_francisco/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "san_francisco",
           "seed_san_francisco/1 seeds priv/seed_data/#{dir} — a directory literal that " <>
             "matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_san_francisco/1 names priv/seed_data/#{dir}, which does not exist"

    # seed_ballparks/1 is called inside seed_san_francisco/1 because Oracle Park
    # owns seven Mission Bay places that the Mission Bay guide links to rather
    # than restates. Asserting the ballpark guide is present afterwards is what
    # stops that ordering being removed later as redundant.
    assert Enum.any?(
             Ethos.Guides.list_published_guides(),
             &(&1.slug == "oracle-park-guide")
           ),
           "seed_san_francisco/1 did not publish the Oracle Park guide, so any Mission Bay " <>
             "link to it will abort the run at Links.resolve!/1"

    after_first = sf.()

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_san_francisco(user.email) end)

    after_second = sf.()

    assert after_second == after_first, "seed_san_francisco/1 is not idempotent"
  end

  test "seed_rome_zones/1 names the Rome seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("rome"))

    # Counts BOTH counties the directory publishes. Thirty of its thirty-one
    # files carry county "Rome"; vatican-city.json carries "Vatican City",
    # because a sovereign state is not in the Metropolitan City of Rome and
    # saying so would be false. Counting only "Rome" asserts 30 against a
    # directory of 31.
    rome_counties = ["Rome", "Vatican City"]

    before =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county in rome_counties))

    output = capture_io(fn -> Ethos.Release.seed_rome_zones(user.email) end)

    # Parsed back OUT of the report and compared for equality, not containment —
    # "Seeded 0 files from priv/seed_data/romes\n" CONTAINS "…/rome", so every
    # prefix-extension typo survives `=~`.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_rome_zones/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "rome",
           "seed_rome_zones/1 seeds priv/seed_data/#{dir}, not priv/seed_data/rome — a directory " <>
             "literal that matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_rome_zones/1 names priv/seed_data/#{dir}, which does not exist — a silent no-op"

    # seed_rome_zones/1 calls seed_rome/1 first, on purpose: zone files link to
    # three-days-in-rome-real-trip-guide and Links.resolve!/1 raises on an
    # unknown target, aborting a run that is not transactional and leaving
    # earlier files published. Asserting the flagship is present after the call
    # is what keeps that ordering from being quietly removed as redundant.
    assert Enum.any?(
             Ethos.Guides.list_published_guides(),
             &(&1.slug == "three-days-in-rome-real-trip-guide")
           ),
           "seed_rome_zones/1 did not publish the flagship Rome guide, so any zone file " <>
             "linking to it will abort the run at Links.resolve!/1"

    after_first =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county in rome_counties))

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_rome_zones(user.email) end)

    after_second =
      Ethos.Guides.list_published_guides()
      |> Enum.count(&(&1.county in rome_counties))

    assert after_second == after_first, "seed_rome_zones/1 is not idempotent"
  end

  # London ships before its research does, so `expected` is 0 for now and the
  # publishes-what-was-committed half is vacuous. The directory-literal half is
  # fully load-bearing at zero files, because seed_directory/2 prints its report
  # whether or not it matched anything — a seeder pointed at
  # priv/seed_data/londons would seed nothing, raise nothing, and report
  # success, and the corpus gate cannot catch that because the gate reads the
  # directory rather than the seeder.
  test "seed_london/1 names its seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("london"))

    # County "London" and state "England". The City of London is in this count
    # like every other file: it is sui generis rather than a borough, which is a
    # fact about its governance and not about where its guide routes.
    london = fn ->
      Ethos.Guides.list_published_guides() |> Enum.count(&(&1.county == "London"))
    end

    before = london.()

    output = capture_io(fn -> Ethos.Release.seed_london(user.email) end)

    # Parsed back OUT of the report and compared for equality, not containment —
    # "Seeded 0 files from priv/seed_data/londons\n" CONTAINS the right path, so
    # every prefix-extension typo survives `=~`.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_london/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "london",
           "seed_london/1 seeds priv/seed_data/#{dir} — a directory literal that matches " <>
             "nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_london/1 names priv/seed_data/#{dir}, which does not exist"

    after_first = london.()

    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_london(user.email) end)

    assert london.() == after_first, "seed_london/1 is not idempotent"
  end

  # Korean BBQ ships before its research does, so `expected` is 0 for now and
  # the publishes-what-was-committed half is vacuous. The directory-literal
  # half is fully load-bearing at zero files, because seed_directory/2 prints
  # its report whether or not it matched anything: a seeder pointed at
  # priv/seed_data/korean_bbqs would seed nothing, raise nothing, and report
  # success, and the corpus gate cannot catch that because the gate reads the
  # directory rather than the seeder.
  test "seed_korean_bbq/1 names its seed directory and publishes its files, idempotently" do
    user = user_fixture()
    expected = length(SeedDataHelpers.seed_files("korean_bbq"))

    kbbq = fn ->
      Ethos.Guides.list_published_guides()
      |> Enum.count(&String.ends_with?(&1.slug, "-korean-bbq-guide"))
    end

    before = kbbq.()

    # Ten Korean BBQ guides now exist, and five of them present restaurants
    # whose place records live in neighborhood files rather than in
    # priv/seed_data/korean_bbq/ itself — Manhattan, Queens, Brooklyn, San
    # Francisco and London. `GuideRunner.replace_entries!/2` resolves each
    # entry through `Places.get_place_by_slug!/1`, which raises rather than
    # skipping, and seeding is not transactional, so seeding Korean BBQ against
    # a database where none of those five have been seeded aborts partway
    # through with an `Ecto.NoResultsError` on the first entry that reaches
    # outside the directory. That is exactly the precondition
    # `seed_korean_bbq/1`'s own @doc documents — "MUST RUN AFTER every
    # destination whose neighborhood files own places these guides reach by
    # entry" — so this is the production runbook order, not a convenience for
    # this test. Reproduced here the same way seed_manhattan/1,
    # seed_brooklyn/1 and seed_ballparks/1 are reproduced above
    # seed_bronx/1. The counting function below filters on the
    # "-korean-bbq-guide" slug suffix, so these five extra seed calls —
    # none of which publish a guide with that suffix — cannot inflate what
    # is being measured.
    #
    # seed_ballparks/1 is included too, ahead of seed_queens/1, for the same
    # reason the Queens test above reproduces it: Queens' own neighborhood
    # files link out to /g/citi-field-guide, a code seed `seed_ballparks/1`
    # owns, and `Links.resolve!/1` raises on that unresolved target rather
    # than skipping it. That precondition belongs to seed_queens/1 itself,
    # independent of Korean BBQ, but it still has to be satisfied here for
    # seed_queens/1 to complete.
    capture_io(fn ->
      Ethos.Release.seed_manhattan(user.email)
      Ethos.Release.seed_ballparks(user.email)
      Ethos.Release.seed_queens(user.email)
      Ethos.Release.seed_brooklyn(user.email)
      Ethos.Release.seed_san_francisco(user.email)
      Ethos.Release.seed_london(user.email)
    end)

    output = capture_io(fn -> Ethos.Release.seed_korean_bbq(user.email) end)

    # Parsed back OUT of the report and compared for equality, not containment —
    # "Seeded 0 files from priv/seed_data/korean_bbqs\n" CONTAINS the right
    # path, so every prefix-extension typo survives `=~`.
    assert [_, dir] =
             Regex.run(~r{Seeded #{expected} files from priv/seed_data/(\S+)\n}, output),
           "seed_korean_bbq/1 printed no seed-directory report: #{inspect(output)}"

    assert dir == "korean_bbq",
           "seed_korean_bbq/1 seeds priv/seed_data/#{dir} — a directory literal that " <>
             "matches nothing seeds nothing, raises nothing, and reports success"

    assert File.dir?(Path.join([to_string(:code.priv_dir(:ethos)), "seed_data", dir])),
           "seed_korean_bbq/1 names priv/seed_data/#{dir}, which does not exist"

    after_first = kbbq.()
    assert after_first - before == expected

    capture_io(fn -> Ethos.Release.seed_korean_bbq(user.email) end)
    assert kbbq.() == after_first, "seed_korean_bbq/1 is not idempotent"
  end

  # Production runs a release, not Mix, so Ethos.Release.foliage_links/0 is
  # the only way to run Ethos.Foliage.LinkBuilder.build!/0 and
  # Ethos.Foliage.Dataset.warn_dangling_guides/1 after a deploy. Before this
  # existed, both were reachable only from test code — this proves the
  # release path actually calls them, rather than trusting that it would.
  describe "foliage_links/0" do
    # Avon and Canton are consecutive stops on the committed `hartford-west`
    # route (priv/foliage/routes.json). Every other route's guides are
    # deliberately left unseeded, so this run also exercises
    # warn_dangling_guides/1 against dozens of really-missing guides.
    @avon Path.expand("../../priv/seed_data/connecticut/avon.json", __DIR__)
    @canton Path.expand("../../priv/seed_data/connecticut/canton.json", __DIR__)

    test "writes route link edges and logs dangling route guides" do
      user = user_fixture()

      for path <- [@avon, @canton] do
        Ethos.Seeds.DataGuide.upsert_places!(path)
        Ethos.Seeds.DataGuide.upsert_guide!(path, user.email)
      end

      avon = Ethos.Guides.get_published_guide_by_slug!("avon-ct-travel-guide")

      log =
        capture_log(fn ->
          assert :ok = Ethos.Release.foliage_links()
        end)

      connected = Ethos.Links.links_for("guide", avon.id)

      assert Enum.any?(
               connected,
               &(&1.other.slug == "canton-ct-travel-guide" and &1.kind == "same-region")
             )

      # Every stop outside Avon/Canton resolves to a guide this test never
      # seeded, so the dangling-guide check has real orphans to report.
      assert log =~ "foliage: route"
      assert log =~ "links missing guide"
    end
  end

  # The manifest ships empty and waves append to it, so none of these may
  # assume a size. The load-bearing one while it is still empty is the last:
  # prune deletes only what the manifest names, so a place absent from the
  # seed corpus — or a whole seed directory that failed to load — is never a
  # deletion signal.
  describe "prune_deleted_places/0" do
    test "reports both the rows deleted and the slugs the manifest listed" do
      listed = MapSet.size(DeletedPlaces.slugs())

      output = capture_io(fn -> Ethos.Release.prune_deleted_places() end)

      assert output =~ ~r/^Pruned \d+ deleted places \(manifest lists #{listed}\)\n$/
    end

    test "deletes every place the manifest names, and returns that count" do
      for slug <- DeletedPlaces.slugs(), do: Places.upsert_place!(place_attrs(slug))
      listed = MapSet.size(DeletedPlaces.slugs())

      count = capture_io_result(&Ethos.Release.prune_deleted_places/0)

      assert count == listed
      for slug <- DeletedPlaces.slugs(), do: refute(Places.get_place_by_slug(slug))
    end

    test "is idempotent — a second run deletes nothing but still reports the manifest size" do
      for slug <- DeletedPlaces.slugs(), do: Places.upsert_place!(place_attrs(slug))
      capture_io(&Ethos.Release.prune_deleted_places/0)

      output = capture_io(fn -> assert Ethos.Release.prune_deleted_places() == 0 end)

      assert output =~
               "Pruned 0 deleted places (manifest lists #{MapSet.size(DeletedPlaces.slugs())})"
    end

    test "leaves every place the manifest does not name" do
      unlisted = "a-place-the-manifest-never-mentions"
      refute DeletedPlaces.deleted?(unlisted)
      Places.upsert_place!(place_attrs(unlisted))
      before = length(Places.list_places())

      # No manifest slug has a row here, so a manifest-driven prune must delete
      # exactly nothing. A corpus-diff-driven one would delete this place, and
      # every other row that no seed file happened to mention.
      assert capture_io_result(&Ethos.Release.prune_deleted_places/0) == 0

      assert Places.get_place_by_slug(unlisted)
      assert length(Places.list_places()) == before
    end
  end

  defp capture_io_result(fun) do
    parent = self()
    capture_io(fn -> send(parent, {:result, fun.()}) end)
    assert_received {:result, result}
    result
  end

  defp place_attrs(slug) do
    %{
      slug: slug,
      name: "Test Place",
      kind: "park",
      town: "Woodbury",
      state: "Connecticut",
      county: "Litchfield County",
      summary: "A park."
    }
  end
end
