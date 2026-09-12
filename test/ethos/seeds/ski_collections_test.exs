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
end
