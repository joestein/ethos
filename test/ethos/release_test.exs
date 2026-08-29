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
