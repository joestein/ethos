defmodule Ethos.Places.DeletedPlacesTest do
  use Ethos.DataCase, async: true

  alias Ethos.Places
  alias Ethos.Places.DeletedPlaces

  # The manifest ships empty and waves append to it, so nothing here may assume
  # a particular entry. The module compiles its list at build time, which also
  # rules out stubbing it — a stub would only ever test the stub. Everything
  # below is therefore either an invariant of the machinery or an invariant of
  # the manifest that holds at any size.

  describe "the compiled manifest" do
    test "compiles into a slug set" do
      assert %MapSet{} = DeletedPlaces.slugs()
    end

    test "all/0 returns entries as maps with string keys" do
      assert is_list(DeletedPlaces.all())
      assert Enum.all?(DeletedPlaces.all(), &is_map/1)
      assert Enum.all?(DeletedPlaces.all(), fn e -> Enum.all?(Map.keys(e), &is_binary/1) end)
    end

    test "slugs/0 is exactly the slugs of all/0" do
      expected = DeletedPlaces.all() |> Enum.map(& &1["slug"]) |> MapSet.new()
      assert DeletedPlaces.slugs() == expected
    end

    test "no slug is listed twice" do
      slugs = Enum.map(DeletedPlaces.all(), & &1["slug"])
      assert length(slugs) == length(Enum.uniq(slugs))
      assert length(slugs) == MapSet.size(DeletedPlaces.slugs())
    end

    test "every listed slug is a well-formed place slug" do
      for slug <- DeletedPlaces.slugs() do
        assert Regex.match?(~r/^[a-z0-9-]+$/, slug), "#{inspect(slug)} is not a valid place slug"
      end
    end

    test "deleted?/1 agrees with slugs/0, and is false for anything unlisted" do
      for slug <- DeletedPlaces.slugs() do
        assert DeletedPlaces.deleted?(slug)
      end

      refute DeletedPlaces.deleted?("a-slug-that-is-not-in-the-manifest")
    end

    test "the compiled list matches the manifest file on disk" do
      on_disk =
        :ethos
        |> :code.priv_dir()
        |> Path.join("seed_data/deleted_places.json")
        |> File.read!()
        |> Jason.decode!()

      assert on_disk == DeletedPlaces.all()
    end

    test "every manifest entry carries its evidence" do
      for entry <- DeletedPlaces.all() do
        for key <- ~w(slug name town region deleted_on reason source_url) do
          assert is_binary(entry[key]) and entry[key] != "",
                 "manifest entry #{inspect(entry["slug"])} is missing #{key}"
        end
      end
    end

    test "every deleted_on is an ISO 8601 date" do
      for entry <- DeletedPlaces.all() do
        assert {:ok, _} = Date.from_iso8601(entry["deleted_on"]),
               "manifest entry #{inspect(entry["slug"])} has a bad deleted_on"
      end
    end
  end

  describe "delete_by_slugs!/1" do
    test "removes exactly the named places" do
      keep = place_attrs("keep-me")
      drop = place_attrs("drop-me")
      Places.upsert_place!(keep)
      Places.upsert_place!(drop)

      assert {1, nil} = Places.delete_by_slugs!(["drop-me"])

      assert Places.get_place_by_slug("keep-me")
      refute Places.get_place_by_slug("drop-me")
    end

    test "on an empty list deletes nothing" do
      Places.upsert_place!(place_attrs("keep-me"))
      assert {0, nil} = Places.delete_by_slugs!([])
      assert Places.get_place_by_slug("keep-me")
    end

    test "a slug that is not present is not an error" do
      assert {0, nil} = Places.delete_by_slugs!(["never-existed"])
    end

    test "counts only the rows it actually removed" do
      Places.upsert_place!(place_attrs("drop-me"))

      assert {1, nil} = Places.delete_by_slugs!(["drop-me", "never-existed"])
      assert {0, nil} = Places.delete_by_slugs!(["drop-me"])
    end

    test "removes several at once and leaves the rest alone" do
      for slug <- ~w(drop-one drop-two keep-one keep-two) do
        Places.upsert_place!(place_attrs(slug))
      end

      assert {2, nil} = Places.delete_by_slugs!(~w(drop-one drop-two))

      refute Places.get_place_by_slug("drop-one")
      refute Places.get_place_by_slug("drop-two")
      assert Places.get_place_by_slug("keep-one")
      assert Places.get_place_by_slug("keep-two")
    end

    test "a deleted place also leaves list_places/1" do
      node = woodbury_node()
      Places.upsert_place!(place_attrs("drop-me", node))
      slugs = fn -> Places.list_places(destination_id: node.id) |> Enum.map(& &1.slug) end

      assert "drop-me" in slugs.()
      assert {1, nil} = Places.delete_by_slugs!(["drop-me"])
      refute "drop-me" in slugs.()
    end
  end

  defp woodbury_node do
    Ethos.Destinations.upsert_destination!(%{
      path: "connecticut/litchfield-county/woodbury",
      name: "Woodbury",
      kind: "town",
      intro: "Woodbury."
    })
  end

  defp place_attrs(slug, node \\ nil) do
    %{
      slug: slug,
      name: "Test Place",
      kind: "park",
      town: "Woodbury",
      state: "Connecticut",
      county: "Litchfield County",
      summary: "A park.",
      destination_id: node && node.id
    }
  end
end
