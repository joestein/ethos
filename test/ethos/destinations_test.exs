defmodule Ethos.DestinationsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Destinations

  @valid %{
    path: "connecticut/litchfield-county",
    name: "Litchfield County",
    intro: "A county in the northwest corner of the state.",
    photos: []
  }

  test "upsert_destination!/1 creates then updates by path" do
    d = Destinations.upsert_destination!(@valid)
    assert d.path == "connecticut/litchfield-county"
    assert d.name == "Litchfield County"

    updated = Destinations.upsert_destination!(%{@valid | intro: "Revised."})
    assert updated.id == d.id
    assert updated.intro == "Revised."
    assert length(Destinations.list_destinations()) == 1
  end

  test "get_by_path/1 finds a destination and returns nil for an unknown path" do
    Destinations.upsert_destination!(@valid)

    assert %{name: "Litchfield County"} =
             Destinations.get_by_path("connecticut/litchfield-county")

    assert Destinations.get_by_path("connecticut/nope-county") == nil
  end

  test "path, name and intro are required" do
    for missing <- [:path, :name, :intro] do
      attrs = Map.delete(@valid, missing)

      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(attrs)
      end
    end
  end

  test "a non-string path fails as a changeset error, not an opaque raise" do
    # The lookup guard is is_binary/1 rather than truthiness, so a JSON
    # `"path": false` cannot short-circuit into the existing-record branch and
    # reach Destination.changeset/2 as the struct argument.
    for bad <- [false, 42, %{}] do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(%{@valid | path: bad})
      end
    end
  end

  test "path must be lowercase slug segments separated by single slashes" do
    for bad <- ["Connecticut", "new york", "new-york/", "/connecticut", "a//b"] do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Destinations.upsert_destination!(%{@valid | path: bad})
      end
    end

    for good <- ["connecticut", "new-york/brooklyn", "rome"] do
      assert %{path: ^good} = Destinations.upsert_destination!(%{@valid | path: good})
    end
  end

  test "accepts a path deeper than two segments and derives its slug" do
    d =
      Destinations.upsert_destination!(%{
        path: "united-states/new-york/new-york-city/manhattan/alphabet-city",
        name: "Alphabet City",
        intro: "Loisaida's community gardens.",
        kind: "neighborhood"
      })

    assert d.slug == "alphabet-city"
    assert d.kind == "neighborhood"
    assert d.position == 0
    assert d.legacy_paths == []
  end

  test "rejects a kind outside the vocabulary" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Destinations.upsert_destination!(%{
        path: "atlantis",
        name: "Atlantis",
        intro: "Not a real tier.",
        kind: "planet"
      })
    end
  end

  test "kinds/0 is the seven-tier vocabulary" do
    assert Ethos.Destinations.Destination.kinds() ==
             ~w(country region county city borough town neighborhood)
  end
end
