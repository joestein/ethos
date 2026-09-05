defmodule Mix.Tasks.Ethos.MigrateGeoTest do
  use ExUnit.Case, async: true

  alias Mix.Tasks.Ethos.MigrateGeo

  test "maps each corpus to its full ancestry path" do
    assert MigrateGeo.path_for("connecticut", "Connecticut", "Litchfield County", "Woodbury") ==
             "united-states/connecticut/litchfield-county/woodbury"

    assert MigrateGeo.path_for("manhattan", "New York", "Manhattan", "Alphabet City") ==
             "united-states/new-york/new-york-city/manhattan/alphabet-city"

    assert MigrateGeo.path_for("brooklyn", "New York", "Brooklyn", "Bath Beach") ==
             "united-states/new-york/new-york-city/brooklyn/bath-beach"

    assert MigrateGeo.path_for("queens", "New York", "Queens", "Astoria") ==
             "united-states/new-york/new-york-city/queens/astoria"

    assert MigrateGeo.path_for("bronx", "New York", "Bronx", "Belmont") ==
             "united-states/new-york/new-york-city/bronx/belmont"

    assert MigrateGeo.path_for("san_francisco", "California", "San Francisco", "The Castro") ==
             "united-states/california/san-francisco/the-castro"

    assert MigrateGeo.path_for("rome", "Italy", "Rome", "Ardeatino") ==
             "italy/lazio/rome/ardeatino"

    assert MigrateGeo.path_for("london", "England", "London", "Barking and Dagenham") ==
             "united-kingdom/england/london/barking-and-dagenham"
  end

  test "London places nest their town under the guide's borough" do
    borough = "united-kingdom/england/london/barking-and-dagenham"

    assert MigrateGeo.place_path_for("london", borough, "Barking") ==
             "united-kingdom/england/london/barking-and-dagenham/barking"

    # A place whose town is the borough attaches to the borough itself.
    assert MigrateGeo.place_path_for("london", borough, "Barking and Dagenham") == borough
  end

  test "every other corpus puts places on the same node as their guide" do
    node = "italy/lazio/rome/ardeatino"
    assert MigrateGeo.place_path_for("rome", node, "Ardeatino") == node
    assert MigrateGeo.place_path_for("connecticut", "x/y/z/andover", "Andover") == "x/y/z/andover"
  end

  test "raises on a corpus it has no rule for rather than guessing" do
    assert_raise ArgumentError, ~r/no mapping rule/, fn ->
      MigrateGeo.path_for("atlantis", "Atlantis", "Deep", "Trench")
    end
  end

  test "swap_geo puts destination_path where the first legacy key stood" do
    place =
      Jason.OrderedObject.new([
        {"slug", "andover-rail-trail"},
        {"name", "Hop River State Park Trail"},
        {"kind", "park"},
        {"town", "Andover"},
        {"state", "Connecticut"},
        {"county", "Tolland County"},
        {"address", "Burnap Brook Road"},
        {"status", "open"}
      ])

    swapped = MigrateGeo.swap_geo(place, ~w(state county town), "x/y/z/andover")

    # At index 3, where "town" was — not appended after "status", which would
    # move the comma onto the last line and churn the file.
    assert swapped.values == [
             {"slug", "andover-rail-trail"},
             {"name", "Hop River State Park Trail"},
             {"kind", "park"},
             {"destination_path", "x/y/z/andover"},
             {"address", "Burnap Brook Road"},
             {"status", "open"}
           ]
  end

  test "swap_geo on a guide, which carries no town, inserts where state stood" do
    guide =
      Jason.OrderedObject.new([
        {"slug", "andover-guide"},
        {"destination", "Andover, Connecticut"},
        {"state", "Connecticut"},
        {"county", "Tolland County"},
        {"tier", "town-page"}
      ])

    assert MigrateGeo.swap_geo(guide, ~w(state county), "x/y/z/andover").values == [
             {"slug", "andover-guide"},
             {"destination", "Andover, Connecticut"},
             {"destination_path", "x/y/z/andover"},
             {"tier", "town-page"}
           ]
  end

  test "the roster splice appends parseable JSON without disturbing what was there" do
    raw = """
    [
      {"path": "italy", "kind": "country", "name": "Italy",
       "intro": "Italy."},
      {"path": "italy/lazio", "kind": "region", "name": "Lazio",
       "intro": "Lazio.", "legacy_paths": ["lazio"]}
    ]
    """

    node =
      Jason.OrderedObject.new([
        {"path", "italy/lazio/rome"},
        {"kind", "city"},
        {"name", "Rome"},
        {"intro", "Rome."}
      ])

    spliced = MigrateGeo.splice_nodes(raw, [node])

    assert Jason.decode!(spliced) ==
             Jason.decode!(raw) ++
               [
                 %{
                   "path" => "italy/lazio/rome",
                   "kind" => "city",
                   "name" => "Rome",
                   "intro" => "Rome."
                 }
               ]

    # Byte-for-byte: the hand-authored two-keys-to-a-line layout survives,
    # which is the whole reason the splice exists rather than a re-encode.
    assert String.contains?(
             spliced,
             ~s({"path": "italy", "kind": "country", "name": "Italy",\n   "intro": "Italy."},)
           )

    assert String.contains?(
             spliced,
             ~s({"path":"italy/lazio/rome","kind":"city","name":"Rome","intro":"Rome."})
           )
  end

  test "splicing nothing leaves the roster untouched" do
    raw = ~s([\n  {"path": "italy", "kind": "country", "name": "Italy", "intro": "Italy."}\n]\n)
    assert MigrateGeo.splice_nodes(raw, []) == raw
  end

  test "the CLI refuses a corpus it has no rule for, before reading anything" do
    assert_raise Mix.Error, ~r/no mapping rule for corpus "atlantis"/, fn ->
      MigrateGeo.run(["atlantis"])
    end
  end

  @corpus_files Path.wildcard(
                  "priv/seed_data/{connecticut,manhattan,brooklyn,queens,bronx,san_francisco,rome,london}/*.json"
                ) ++ ["priv/seed_data/destination_tree.json"]

  test "re-running over the migrated corpus is a no-op, on disk and in the roster" do
    before = digest(@corpus_files)

    output = ExUnit.CaptureIO.capture_io(fn -> MigrateGeo.run([]) end)

    assert output =~ "0 leaf nodes"
    assert digest(@corpus_files) == before
  end

  defp digest(files), do: Map.new(files, &{&1, :erlang.md5(File.read!(&1))})
end
