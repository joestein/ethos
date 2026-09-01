defmodule Ethos.ReleaseTest do
  use Ethos.DataCase, async: false

  import ExUnit.CaptureIO
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
    # only, so the two extra seed calls cannot inflate them.
    Ethos.Release.seed_manhattan(user.email)
    Ethos.Release.seed_brooklyn(user.email)

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

    bronx = fn ->
      Ethos.Guides.list_published_guides() |> Enum.filter(&(&1.county == "Bronx"))
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
