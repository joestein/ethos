defmodule Ethos.Seeds.GolfCollectionTest do
  @moduledoc """
  The membership gate for the golf collection.

  A collection missing one guide renders as a page one row short, and the guide
  it dropped simply stops showing its *"Part of …"* line. Both are silent: no
  raise, no warning, and no count anywhere that disagrees.

  So the assertion is set equality and it fails in **both** directions. A count
  alone passes on a collection listing forty-eight golf guides and one
  Connecticut town, and "expected 49, got 48" sends the reader to count rows
  rather than to the guide that is missing.

  The ballpark copy of this gate compares against
  `Ethos.Seeds.Catalog.guide_modules/1`. Golf's guides are JSON, so the corpus
  side is the directory listing — strictly better, because it is derived from
  the files that actually seed rather than from a hand-maintained list.
  """
  use ExUnit.Case, async: true

  alias Ethos.SeedDataHelpers
  alias Ethos.Seeds.{DataGuide, GolfCollection}

  @roster "priv/seed_data/golf_courses_roster.json"
          |> File.read!()
          |> Jason.decode!()

  defp corpus_guide_slugs do
    for f <- SeedDataHelpers.seed_files("golf"), do: DataGuide.load!(f)["guide"]["slug"]
  end

  defp item_guide_slugs, do: Enum.map(GolfCollection.data().items, & &1.guide_slug)

  # Derived rather than a literal 49, so Vermont landing updates this test by
  # resolving its roster row and not by editing a number here. The roster gate
  # already enforces that a resolved row and a seeding file arrive together, so
  # these two counts cannot drift apart silently.
  defp resolved_states, do: Enum.count(@roster, & &1["verified"])

  test "every golf guide is an item, and every item is a golf guide" do
    corpus = corpus_guide_slugs()
    items = item_guide_slugs()

    # Non-vacuous twice over: both lists are derived, and two empty lists are
    # equal. The roster is fifty rows whatever happens, so a resolved count of
    # zero would fail here rather than pass quietly.
    assert resolved_states() > 0, "no roster row is resolved; this gate would be vacuous"

    assert length(corpus) == resolved_states(),
           "priv/seed_data/golf/ holds #{length(corpus)} guides but the roster marks " <>
             "#{resolved_states()} states resolved — a state resolves and seeds together " <>
             "or not at all"

    assert length(items) == length(Enum.uniq(items)),
           "a guide is listed twice in the collection: " <> inspect(items -- Enum.uniq(items))

    missing = corpus -- items
    unexpected = items -- corpus

    assert missing == [],
           "golf guides that seed but are absent from the collection, so their pages " <>
             "show no \"Part of\" line: " <> inspect(missing)

    assert unexpected == [],
           "the collection lists guides the golf directory does not seed, so " <>
             "Collections.upsert_collection!/1 will raise at seed time: " <> inspect(unexpected)
  end

  # Vermont is the one state deliberately absent, and it is absent for a reason
  # recorded in docs/golf/vermont.md rather than by oversight. Pinning it here
  # means the day it lands, this test is what tells you to add its item.
  test "the only unresolved state is the one the record says it is" do
    unresolved = for e <- @roster, not e["verified"], do: e["slug"]

    assert unresolved == ["vermont"],
           "the set of unresolved golf states changed to #{inspect(unresolved)}. If a " <>
             "state resolved, add its item to Ethos.Seeds.GolfCollection and its file to " <>
             "priv/seed_data/golf/. If one regressed, say why in docs/golf/<state>.md"
  end

  # /destinations lists every collection by title in one flat column, next to
  # "Korean BBQ", "Major League Ballparks" and "Skiing New England". This title
  # shipped once as "A Public Course, State by State" — accurate, fine on the
  # collection's own page, and unidentifiable in that list, because nothing in
  # it said golf. No gate could catch it: the string was true. So the subject
  # word is pinned here instead.
  test "the title says what the collection is about" do
    title = GolfCollection.data().title

    assert title =~ ~r/\bgolf\b/i,
           "a reader scanning /destinations sees only this title beside Korean BBQ, " <>
             "Major League Ballparks and Steakhouses, and nothing in it says what the " <>
             "subject is: " <> title
  end

  # The title claims forty-nine states' worth of courses, not fifty. A title
  # saying "every state" over a forty-nine-row page is the one error no gate
  # here could catch, so the claim is pinned to the count instead.
  test "the title does not claim more states than the corpus has" do
    data = GolfCollection.data()

    if length(data.items) < 50 do
      refute data.title =~ ~r/every state/i,
             "the collection lists #{length(data.items)} states and its title claims " <>
               "every state: " <> data.title
    end
  end

  test "every blurb is free of banned phrasing" do
    offenders =
      for item <- GolfCollection.data().items,
          phrase <- Ethos.GolfProse.banned_phrases(item.blurb),
          do: {item.guide_slug, phrase}

    assert offenders == [],
           "collection blurbs are prose in an Elixir module, which the JSON gate does " <>
             "not see — this is exactly how burys_collection.ex shipped \"within a short " <>
             "drive\" to production: " <> inspect(offenders)
  end

  test "the intro is free of banned phrasing" do
    assert Ethos.GolfProse.banned_phrases(GolfCollection.data().intro) == []
  end

  # Non-vacuity specimen for the two tests above, in the corpus gate's three-way
  # style: a specimen the check catches, one it must spare, and the real pass
  # over the shipped blurbs. An empty banned_phrases/1 would pass both of those
  # tests silently, and this is what notices.
  test "the banned-phrase check catches a drive-time blurb and spares a plain one" do
    caught = Ethos.GolfProse.banned_phrases("The hotel is a short drive from the first tee.")

    assert caught != [],
           "the specimen phrasing that reached production from burys_collection.ex is " <>
             "not being caught by Ethos.GolfProse.banned_phrases/1"

    assert Ethos.GolfProse.banned_phrases(
             "The Judge in Prattville, Alabama — rank 7 on Golf Digest Best in State."
           ) == [],
           "a plain, sourced blurb is being rejected"
  end
end
