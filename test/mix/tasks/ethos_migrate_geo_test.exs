defmodule Mix.Tasks.Ethos.MigrateGeoTest do
  use ExUnit.Case, async: true

  alias Mix.Tasks.Ethos.MigrateGeo

  @corpora ~w(connecticut manhattan brooklyn queens bronx san_francisco rome london)

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

  test "the Vatican is sovereign: a Rome-corpus row whose state says so leaves Italy" do
    # The one clause that reads `state`. Every other Roman row says "Italy";
    # these 30 say "Vatican City", and mapping them under italy/ would make
    # Task 10 derive addressCountry "IT" for St Peter's.
    assert MigrateGeo.path_for("rome", "Vatican City", "Rome", "Vatican City") ==
             "vatican-city"

    assert MigrateGeo.path_for("rome", "Italy", "Rome", "Borgo") == "italy/lazio/rome/borgo"
  end

  test "no committed seed file resolves a Vatican node inside Italy" do
    rows =
      for corpus <- @corpora,
          file <- Path.wildcard(Path.join(["priv", "seed_data", corpus, "*.json"])),
          data = Jason.decode!(File.read!(file)),
          row <- [data["guide"] | data["places"]] do
        {file, row["destination_path"]}
      end

    for {file, path} <- rows do
      refute String.starts_with?(path, "italy/") and String.contains?(path, "vatican"),
             "#{file} puts a Vatican node inside Italy: #{path}"
    end

    vatican = for {file, path} <- rows, Path.basename(file) == "vatican-city.json", do: path

    # One guide and 29 places, all on the sovereign root.
    assert length(vatican) == 30
    assert Enum.uniq(vatican) == ["vatican-city"]
  end

  test "the roster declares Vatican City as a root country and holds no orphan under Rome" do
    nodes = Jason.decode!(File.read!("priv/seed_data/destination_tree.json"))
    vatican = Enum.filter(nodes, &String.contains?(&1["path"], "vatican"))

    assert vatican == [
             %{
               "path" => "vatican-city",
               "kind" => "country",
               "name" => "Vatican City",
               "intro" => "Vatican City."
             }
           ]
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

    # And it must SAY it did nothing. The first version of `run/1` reported
    # `length(corpora)` — the number of directories it looked at — so this run,
    # which is the steady state of a one-shot rewrite, printed "Rewrote 9
    # corpora" having rewritten not one byte. The digest above proves the files
    # were untouched; this proves the operator is told so.
    assert output =~ "Rewrote 0 files"

    refute output =~ ~r/Rewrote [1-9]/,
           "the no-op run claimed work it did not do: #{inspect(output)}"
  end

  defp digest(files), do: Map.new(files, &{&1, :erlang.md5(File.read!(&1))})
end
