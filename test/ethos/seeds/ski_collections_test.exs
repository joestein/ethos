defmodule Ethos.Seeds.SkiCollectionsTest do
  use Ethos.DataCase, async: false

  alias Ethos.Seeds.SkiCollections

  @roster Path.join(["priv", "seed_data", "ski_areas_roster.json"])
  @ski_dir Path.join(["priv", "seed_data", "ski"])

  defp roster, do: @roster |> File.read!() |> Jason.decode!()

  test "the regional collection is published, with a blurb per guide" do
    attrs = SkiCollections.regional()

    assert attrs.slug == "skiing-new-england"
    assert attrs.published == true
    assert String.length(attrs.intro) > 200

    for item <- attrs.items do
      assert String.ends_with?(item.guide_slug, "-ski-guide")
      assert is_binary(item.blurb) and item.blurb != ""
    end
  end

  # Membership is DERIVED from the roster (spec §7). A regional collection
  # that lists 60 of 62 mountains is a page that looks complete and is not,
  # and no rendered page would say so.
  test "the New England collection holds every built New England guide, and only those" do
    expected =
      for a <- roster()["areas"],
          a["status"] == "build",
          a["region"] == "new-england",
          into: MapSet.new(),
          do: "#{a["slug"]}-ski-guide"

    actual = MapSet.new(SkiCollections.regional().items, & &1.guide_slug)

    assert MapSet.equal?(actual, expected),
           "collection and roster disagree — only in collection: " <>
             "#{inspect(MapSet.difference(actual, expected))}, " <>
             "only in roster: #{inspect(MapSet.difference(expected, actual))}"
  end

  test "the parent is a curated selection, not a second copy of the regional list" do
    parent = SkiCollections.parent()

    assert parent.slug == "skiing-and-snowboarding-united-states"
    assert parent.published == true

    n = length(parent.items)
    assert n >= 12 and n <= 15, "the parent curates 12-15 mountains; it has #{n}"

    regional = MapSet.new(SkiCollections.regional().items, & &1.guide_slug)
    curated = MapSet.new(parent.items, & &1.guide_slug)

    assert MapSet.subset?(curated, regional),
           "the parent names guides no regional collection carries: " <>
             inspect(MapSet.difference(curated, regional))

    assert MapSet.size(curated) < MapSet.size(regional),
           "the parent is a curated selection; if it holds everything the regional " <>
             "collection holds, it is a duplicate page"
  end

  # Round one publishes one region, and the parent's intro must say so rather
  # than implying a national selection — its 12-15 mountains are all in New
  # England. It must also not link to five collections that do not exist.
  test "the parent's intro is honest about what is published" do
    intro = SkiCollections.parent().intro

    assert intro =~ ~r/New England/,
           "the parent curates New England mountains only; its intro must say so"

    for absent <- ~w(skiing-the-rockies skiing-the-midwest skiing-the-pacific
                     skiing-the-mid-atlantic skiing-the-southeast skiing-alaska) do
      refute intro =~ absent,
             "the intro links to /c/#{absent}, which does not exist — a dead collection " <>
               "link renders as an ordinary link and 404s"
    end
  end

  # `Collections.upsert_collection!/1` writes each item through
  # `CollectionItem.changeset/2`, which caps `:blurb` at 255 and is a
  # varchar(255) underneath. Seven over-length steakhouse blurbs aborted
  # seed_collections/0 in production, leaving the collection unseeded.
  test "every blurb fits the cap CollectionItem enforces" do
    for attrs <- [SkiCollections.regional(), SkiCollections.parent()],
        item <- attrs.items do
      blurb = item[:blurb] || ""

      assert String.length(blurb) <= 255,
             "#{attrs.slug}/#{item[:guide_slug]}: blurb is #{String.length(blurb)} " <>
               "characters, over the 255 CollectionItem.changeset/2 accepts:\n#{blurb}"
    end
  end

  test "upsert_all!/0 seeds both collections, idempotently" do
    user = Ethos.AccountsFixtures.user_fixture()
    ExUnit.CaptureIO.capture_io(fn -> Ethos.Release.seed_ski(user.email) end)

    slugs = SkiCollections.upsert_all!() |> Enum.map(& &1.slug) |> Enum.sort()
    assert slugs == ["skiing-and-snowboarding-united-states", "skiing-new-england"]

    assert SkiCollections.upsert_all!() |> Enum.map(& &1.slug) |> Enum.sort() == slugs
  end

  # --- Content rules the corpus gate cannot see -----------------------------
  #
  # The corpus gate (test/ethos/seeds/ski_seed_data_test.exs) is scoped to
  # priv/seed_data/ski/*.json and never reads this Elixir module. So the same
  # rules that eight waves of guide review enforced — no unsourced vertical
  # drops, acreage, trail counts or snowfall figures; no superlatives; no
  # crowd/queue language — do not reach these 82 blurbs and two intros unless
  # something here enforces them. Rather than port every guide-content ban,
  # blurbs are constrained by construction and checked mechanically below.

  @superlatives ~w(biggest largest smallest steepest best finest premier
                    world-class iconic legendary oldest first)
  @units ~w(foot feet acre acres mile miles inch inches vertical trails lifts)

  defp all_blurbs_and_intros do
    regional = SkiCollections.regional()
    parent = SkiCollections.parent()

    intros = [{"regional intro", regional.intro}, {"parent intro", parent.intro}]

    blurbs =
      for {attrs, label} <- [{regional, "regional"}, {parent, "parent"}],
          item <- attrs.items,
          do: {"#{label}/#{item.guide_slug}", item.blurb}

    {blurbs, intros}
  end

  defp contains_word?(text, word) do
    Regex.match?(~r/(?<![A-Za-z])#{Regex.escape(word)}(?![A-Za-z])/i, text)
  end

  # Rule 1: no digits except sourced years. Every digit run in a blurb must be
  # a four-digit year that appears verbatim in that area's own shipped file.
  # This admits "founded in 1947" only when 1947 is actually in Mohawk's
  # file, and rejects every vertical drop, acreage, trail count and snowfall
  # figure outright — a one-line blurb has no business carrying a statistic.
  test "every blurb's digits are years sourced from that area's own JSON file" do
    {blurbs, _intros} = all_blurbs_and_intros()

    for {label, blurb} <- blurbs do
      # label is "regional/<slug>-ski-guide" or "parent/<slug>-ski-guide"
      guide_slug = label |> String.split("/", parts: 2) |> List.last()
      area_slug = String.replace_suffix(guide_slug, "-ski-guide", "")
      file = Path.join(@ski_dir, "#{area_slug}.json")

      assert File.exists?(file), "#{label}: no seed file at #{file} to check digits against"

      file_text = File.read!(file)
      digit_runs = Regex.scan(~r/\d+/, blurb) |> Enum.map(&hd/1)

      for run <- digit_runs do
        assert String.length(run) == 4 and String.contains?(file_text, run),
               "#{label}: blurb has digit run \"#{run}\" that is not a four-digit year " <>
                 "verbatim in #{file} — blurb: #{blurb}"
      end
    end
  end

  # Rule 2: no unit words in any blurb.
  test "no blurb uses a unit word" do
    {blurbs, _intros} = all_blurbs_and_intros()

    for {label, blurb} <- blurbs, word <- @units do
      refute contains_word?(blurb, word),
             "#{label}: blurb uses banned unit word \"#{word}\": #{blurb}"
    end
  end

  # Rule 3: no superlatives in any blurb or either intro.
  test "no blurb or intro uses a superlative" do
    {blurbs, intros} = all_blurbs_and_intros()

    for {label, text} <- blurbs ++ intros, word <- @superlatives do
      refute contains_word?(text, word),
             "#{label}: text uses banned superlative \"#{word}\": #{text}"
    end
  end

  # --- Ranking-and-primacy check (round-1 fix) -------------------------------
  #
  # Round 1 shipped an Abenaki blurb saying "among the longest-running ski
  # areas in the region" and a parent blurb saying "the region's longest
  # continuously running hills." Abenaki's own file makes exactly one ranking
  # claim, quoted and attributed: New England Ski History calling it "one of
  # the oldest ski areas in the country." Neither "longest" nor "continuously"
  # appears anywhere in that file, and the file's own text — closures during
  # World War II — refutes "continuously" outright. `@superlatives` didn't
  # catch it because "longest-running" and "continuously" aren't on that list.
  #
  # This is the same cheap mechanical proxy as the digit-year check, applied
  # to ranking and primacy language instead of numbers: if a blurb about one
  # area uses one of these words, that word must appear in that area's own
  # shipped file, not just somewhere in the corpus. It cannot verify the claim
  # is used the same way the source uses it (that took a human read for
  # Abenaki), but it catches every case where the word is invented outright —
  # which is what happened here.
  @ranking ~w(longest continuous continuously earliest only pioneer birthplace
              nation's country's region's state's)

  # "one of the" is handled separately below (`primacy_claim_word/1`) rather
  # than added to @ranking: the phrase itself has no reason to appear
  # verbatim in a source file the way a single word might, so what gets
  # checked is the word it modifies ("oldest," "largest," ...), not the
  # phrase.

  defp ranking_words_found(text) do
    for word <- @ranking, contains_word?(text, word), do: word
  end

  defp area_slug_for_guide(guide_slug), do: String.replace_suffix(guide_slug, "-ski-guide", "")

  defp area_file_text(area_slug) do
    File.read!(Path.join(@ski_dir, "#{area_slug}.json"))
  end

  defp full_ski_corpus_text do
    Path.join(@ski_dir, "*.json")
    |> Path.wildcard()
    |> Enum.map(&File.read!/1)
    |> Enum.join("\n")
  end

  # Stowe's blurb says "home to the birth of the National Ski Patrol," not
  # "birthplace" — a faithful compression of that exact phrase in its own
  # file. Reworded to match rather than special-cased, so no exception list
  # is needed here.
  test "every ranking or primacy word in a blurb is sourced in that area's own file" do
    {blurbs, _intros} = all_blurbs_and_intros()

    for {label, blurb} <- blurbs do
      guide_slug = label |> String.split("/", parts: 2) |> List.last()
      area_slug = area_slug_for_guide(guide_slug)
      file_text = area_file_text(area_slug)

      for word <- ranking_words_found(blurb) do
        assert contains_word?(file_text, word) or String.contains?(file_text, word),
               "#{label}: blurb uses ranking word \"#{word}\", which is not in " <>
                 "priv/seed_data/ski/#{area_slug}.json — blurb: #{blurb}"
      end
    end
  end

  # Neither intro is about one area, so there is no single file to check
  # against — checked instead against the union of every shipped ski file,
  # the intro's real source material. A ranking word invented out of nothing
  # (not grounded anywhere in the 82-guide corpus) still fails this; a claim
  # like "the state's only ski area," which restates something an area's own
  # file actually says, still passes.
  test "every ranking or primacy word in either intro is sourced somewhere in the ski corpus" do
    {_blurbs, intros} = all_blurbs_and_intros()
    corpus = full_ski_corpus_text()

    for {label, text} <- intros, word <- ranking_words_found(text) do
      assert String.contains?(String.downcase(corpus), String.downcase(word)),
             "#{label}: uses ranking word \"#{word}\", not sourced anywhere in " <>
               "priv/seed_data/ski/*.json — intro: #{text}"
    end
  end

  # Non-vacuity specimen test, in the corpus gate's three-way style: a
  # specimen the check catches, one a real source would spare, and proof it
  # does not trip on the shipped corpus. A check nobody has watched fail is a
  # check nobody knows works.
  test "the ranking-word check catches an invented claim and spares a sourced one" do
    source = ~s({"guide": {"intro": "Skiing at this small hill since 1980."}})

    # Catches: "longest" and "pioneer" are asserted but appear nowhere in the
    # area's own file — exactly the shape of the round-1 Abenaki defect.
    invented = "Vermont's longest-running hill and a snowmaking pioneer since 1980."

    caught =
      for word <- ranking_words_found(invented), not String.contains?(source, word), do: word

    assert caught == ["longest", "pioneer"],
           "specimen expected to be caught by the ranking check was not: #{inspect(caught)}"

    # Spared: the same word, used the way a real file would actually support
    # it, because the word is genuinely present in the source.
    sourced_text = ~s({"guide": {"intro": "Locals call it the only hill in town, since 1980."}})
    faithful = "Known locally as the only hill in town."

    spared =
      for word <- ranking_words_found(faithful),
          not String.contains?(sourced_text, word),
          do: word

    assert spared == [],
           "specimen expected to be spared by the ranking check was caught: #{inspect(spared)}"

    # Proof it does not trip on the shipped corpus: the real check, run for
    # real, over every real blurb and both real intros.
    {blurbs, intros} = all_blurbs_and_intros()

    blurb_failures =
      for {label, blurb} <- blurbs,
          area_slug =
            label |> String.split("/", parts: 2) |> List.last() |> area_slug_for_guide(),
          file_text = area_file_text(area_slug),
          word <- ranking_words_found(blurb),
          not (contains_word?(file_text, word) or String.contains?(file_text, word)),
          do: {label, word}

    corpus = full_ski_corpus_text()

    intro_failures =
      for {label, text} <- intros,
          word <- ranking_words_found(text),
          not String.contains?(String.downcase(corpus), String.downcase(word)),
          do: {label, word}

    assert blurb_failures == [] and intro_failures == [],
           "the shipped corpus should pass its own check: #{inspect(blurb_failures ++ intro_failures)}"
  end

  # "One of the" itself has no reason to appear verbatim in a source file —
  # New England Ski History's actual sentence is "one of the oldest ski areas
  # in the country," and no shipped file would ever contain the literal
  # phrase "one of the" as a standalone fragment. So instead of requiring the
  # phrase itself to be sourced, this pulls out the word the phrase modifies
  # ("oldest," in that example) and checks that word the same way every other
  # ranking word is checked. No blurb or intro currently uses the phrase, so
  # this exercises entirely through the specimen test below and the
  # not-currently-triggered pass over the real corpus.
  defp primacy_claim_word(text) do
    case Regex.run(~r/one of the\s+([a-z-]+)/i, text) do
      [_, word] -> String.downcase(word)
      nil -> nil
    end
  end

  test "\"one of the <word>\" claims are checked on the word they actually make" do
    {blurbs, _intros} = all_blurbs_and_intros()

    for {label, blurb} <- blurbs do
      case primacy_claim_word(blurb) do
        nil ->
          :ok

        word ->
          area_slug = label |> String.split("/", parts: 2) |> List.last() |> area_slug_for_guide()
          file_text = area_file_text(area_slug)

          assert String.contains?(String.downcase(file_text), word),
                 "#{label}: blurb claims \"one of the #{word}\", and \"#{word}\" is not in " <>
                   "priv/seed_data/ski/#{area_slug}.json — blurb: #{blurb}"
      end
    end
  end

  test "the \"one of the\" check catches an unsourced claim and spares a sourced one" do
    unsourced_file = ~s({"guide": {"intro": "A small hill with a rope tow."}})
    invented = "Locals call it one of the steepest hills in the county."
    word = primacy_claim_word(invented)
    assert word == "steepest"
    refute String.contains?(unsourced_file, word)

    sourced_file =
      ~s({"guide": {"intro": "New England Ski History calls it one of the oldest ski areas in the country."}})

    faithful = "Cited as one of the oldest ski areas in the country."
    word2 = primacy_claim_word(faithful)
    assert word2 == "oldest"
    assert String.contains?(sourced_file, word2)
  end
end
