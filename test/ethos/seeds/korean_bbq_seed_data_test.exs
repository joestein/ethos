defmodule Ethos.Seeds.KoreanBbqSeedDataTest do
  @moduledoc """
  The gate every Korean BBQ research wave must pass.

  ## Five bans, not seven

  It inherits research method, editorial self-reference, superlative, proximity
  and photo policy from the London gate, each with the self-test proving it can
  fail and the specimen list proving it does not fire on prose that must
  publish. Two are deliberately DROPPED rather than inherited unexamined:

    * **Designation citation.** A restaurant has no NHLE number, and the rule
      would fire on the ordinary word "listed" in a sentence like "the menu
      lists eight cuts".
    * **The transit negative.** These are subject pages, not area pages. They
      carry no "Getting there" section for it to police.

  The superlative ban matters more here than in any previous corpus. Restaurant
  writing is made of rankings, and "the best Korean BBQ in Los Angeles" is
  exactly the sentence this corpus does not write. A price, a founding date, a
  count of grills and a published closing time are facts and all publish.

  ## The grill assertion is the collection

  `every place's prose names the grill` is the definition made mechanical. A
  place whose summary cannot say the meat is cooked at the table does not belong
  here, and this is what stops a later wave quietly re-admitting a tofu house
  because it is famous.
  """
  use Ethos.DataCase, async: false

  # @moduletag :pending_korean_bbq removed by the wave that landed the first
  # five guides — Los Angeles, Chicago, Chicago's north suburbs, the South Bay
  # and Puget Sound, the five metros with no neighborhood corpus of their own.
  # Everything now runs except the two assertions carrying their own `@tag`:
  # the ten-guide/100-restaurant one and the collection one, both of which
  # wait on later tasks.

  alias Ethos.SeedDataHelpers

  @seed_dir Path.expand("../../../priv/seed_data/korean_bbq", __DIR__)

  @zones ~w(
    los-angeles manhattan queens brooklyn london chicago
    chicago-north-suburbs san-francisco south-bay puget-sound
  )

  @collection_slug "korean-bbq"

  # ------------------------------------------------------------------
  # The five inherited bans
  # ------------------------------------------------------------------

  @method_patterns [
    ~r/\bcould not be (?:reached|re-?read|certified|confirmed)\b/i,
    ~r/\b(?:did not|does not|failed to) (?:resolve|answer)\b/i,
    ~r/\bHTTP\s*\d{3}\b/i,
    ~r/\breturn(?:s|ed) (?:an?\s+)?(?:error|\d{3})\b/i,
    ~r/\b(?:during|for|in) (?:this |the )?research\b(?!\s+for\b)/i,
    ~r/\bthis research\b/i,
    ~r/\bre-?fetched on\b/i,
    ~r/\bfor this guide\b/i,
    ~r/\bis published here\b/i,
    ~r/\b(?:was|were) reached\b/i,
    ~r/\bdead (?:website|site)\b/i,
    ~r/\bno website\b/i
  ]

  @method_specimens [
    "No source states its opening hours, so none are given here.",
    "The restaurant's own menu names eight cuts of beef.",
    "It opened in 1996 and moved to West 32nd Street in 2004."
  ]

  @self_reference_patterns [
    ~r/\b(?:is|are|was|were)\s+(?:not\s+)?written\s+(?:here|there|on this page|as a place|in\b)/i,
    ~r/\bon this page\b/i,
    ~r/\bthis page (?:carries|holds|cannot|does not|gives|says|stops|publishes)\b/i,
    ~r/\bthis guide (?:carries|holds|writes|does not pretend|gives none|establishes)\b/i,
    ~r/\bthis collection (?:carries|holds|counts|excludes|does not)\b/i,
    ~r/\bbelongs? to \w+(?:'s)? (?:page|guide)\b/i,
    ~r/\b(?:is|are) (?:recorded|reported|gathered) here\b/i,
    ~r/\ba gap in this guide\b/i
  ]

  @self_reference_specimens [
    "No source states its opening hours, so none are given here.",
    "The grill is set into the table and the meat is cooked in front of you.",
    "Jongro stands at 22 West 32nd Street."
  ]

  @superlative_patterns [
    ~r/(?<![-\w])(?:densest|busiest|biggest|newest|priciest|cheapest|rarest|only|first|oldest|largest|best|finest|greatest|most\s+\w+)\s+(?:\w+\s+){0,3}(?:in|of|on)\s+(?:the\s+)?(?:nation|country|state|world|US|U\.S\.|America|city|borough|neighborhood|neighbourhood|county|area|region|Los Angeles|Manhattan|Queens|Brooklyn|London|Chicago|San Francisco|Seattle)\b/i,
    ~r/\bone of the (?:most|best|finest|largest|oldest|greatest)\b/i,
    ~r/\b(?:the city's|LA's|London's|Chicago's|Manhattan's)\s+(?:only|oldest|largest|finest|greatest|best)\b/i,
    ~r/\bbest Korean\b/i,
    ~r/\bmust-(?:try|visit|eat)\b/i,
    ~r/\bworth the (?:trip|wait|queue|line)\b/i,
    ~r/\bhidden gem\b/i,
    ~r/\bmost (?:travellers|travelers|visitors|diners|people)\b/i,
    ~r/\bthe only (?:one|place|restaurant)\b/i
  ]

  # A date, a count, a price and a rank in an official series are facts. So is
  # a Michelin distinction, which is an award a body conferred on a date, not
  # the corpus ranking anything itself.
  @superlative_specimens [
    "It opened in 1996.",
    "Eleven of the fifteen are on West 32nd Street.",
    "Dinner service ends at 11pm.",
    "It holds one Michelin star, awarded in 2019."
  ]

  @proximity_patterns [
    ~r/\ba (?:short|ten-minute|five-minute|brief) walk\b/i,
    ~r/\bjust (?:around the corner|off|beyond)\b/i,
    ~r/\ba stone's throw\b/i,
    ~r/\bsteps (?:from|away)\b/i,
    ~r/\bnot far from\b/i,
    ~r/\bworth the walk\b/i,
    ~r/\bone street over\b/i
  ]

  # A named street, a block count a map confirms, and adjacency between
  # buildings that touch all publish.
  @proximity_specimens [
    "It stands on West 32nd Street between Fifth Avenue and Broadway.",
    "Mapo BBQ is one block from the Murray Hill LIRR station.",
    "The dining room is above the market on the same block."
  ]

  @photo_policy_patterns [
    ~r/\bfreedom of panorama\b/i,
    ~r/\bs\.?\s?62\b|\bsection 62\b/i,
    ~r/\bCDPA\b/,
    ~r/\bpermanently situated\b/i,
    ~r/\bgraphic work\b/i,
    ~r/\b17 USC\b/i
  ]

  @photo_policy_specimens [
    "The dining room has thirty tables, each with a gas grill set into it.",
    "The sign above the door is in Hangul and English."
  ]

  @publishable_licenses [
    "CC0",
    "CC BY 2.0",
    "CC BY 3.0",
    "CC BY 4.0",
    "CC BY-SA 2.0",
    "CC BY-SA 3.0",
    "CC BY-SA 4.0",
    "Public domain"
  ]

  # ------------------------------------------------------------------
  # The grill assertion — the definition, made mechanical
  # ------------------------------------------------------------------

  @grill_evidence ~r/\b(?:grill(?:s|ed|ing)?|grille)\b/i

  @tabletop_evidence ~r/(?:set into the table|built into the table|in the table|at (?:the|each|every) table|tabletop|table-top|table grill|smokeless grill|grills? (?:is |are )?set into)/i

  # ------------------------------------------------------------------
  # Helpers
  # ------------------------------------------------------------------

  defp files, do: SeedDataHelpers.seed_files("korean_bbq")

  defp decoded_files do
    Enum.map(files(), fn path ->
      {Path.basename(path), path |> File.read!() |> Jason.decode!()}
    end)
  end

  defp prose(doc) do
    guide = doc["guide"] || %{}

    [
      guide["title"],
      guide["intro"],
      (guide["sections"] || []) |> Enum.flat_map(&[&1["heading"], &1["body"]]),
      (guide["faq"] || []) |> Enum.flat_map(&[&1["question"], &1["answer"]]),
      (doc["places"] || []) |> Enum.flat_map(&[&1["name"], &1["summary"], &1["history"]]),
      (doc["links"] || []) |> Enum.map(& &1["note"]),
      (doc["entries"] || []) |> Enum.flat_map(&[&1["name"], &1["note"]])
    ]
    |> List.flatten()
    |> Enum.filter(&is_binary/1)
  end

  defp hit?(patterns, text), do: Enum.any?(patterns, &Regex.match?(&1, text))

  # Sentence-scoped, because presence-anywhere is not evidence. Checking the two
  # patterns independently over the whole blob accepted "The chef grills bulgogi
  # in an open kitchen. Diners are seated at the table" — a grill in sentence
  # one, a table in sentence two, and the meat cooked exactly where this
  # collection says it must not be. "At the table" is ordinary restaurant prose
  # and appears constantly for reasons that have nothing to do with a grill.
  defp grill_at_the_table?(text) do
    text
    |> String.split(~r/(?<=[.!?])\s+/)
    |> Enum.any?(fn sentence ->
      Regex.match?(@grill_evidence, sentence) and Regex.match?(@tabletop_evidence, sentence)
    end)
  end

  defp photos(doc) do
    ((doc["guide"] || %{})["photos"] || []) ++
      ((doc["places"] || []) |> Enum.flat_map(&(&1["photos"] || [])))
  end

  defp licence_fault(photo) do
    cond do
      photo["license"] not in @publishable_licenses ->
        "licence #{inspect(photo["license"])} is not on the allowlist"

      not is_binary(photo["author"]) or photo["author"] == "" ->
        "no photographer credited"

      not is_binary(photo["source_url"]) or photo["source_url"] == "" ->
        "no source URL, so the licence claim cannot be re-checked"

      true ->
        nil
    end
  end

  # ------------------------------------------------------------------
  # Self-tests — these hold from the day this file lands
  # ------------------------------------------------------------------

  test "the research-method ban catches leaked provenance, and only there" do
    assert hit?(@method_patterns, "The restaurant's site returned a 403.")
    assert hit?(@method_patterns, "It has a dead website.")

    for s <- @method_specimens do
      refute hit?(@method_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the self-reference ban separates the page from the fact" do
    assert hit?(@self_reference_patterns, "This collection excludes tofu houses.")
    assert hit?(@self_reference_patterns, "This page carries no fried chicken.")

    for s <- @self_reference_specimens do
      refute hit?(@self_reference_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the superlative ban catches a ranking and spares an award" do
    assert hit?(@superlative_patterns, "The best Korean BBQ in Los Angeles.")
    assert hit?(@superlative_patterns, "It is one of the finest grills in the city.")
    assert hit?(@superlative_patterns, "A hidden gem.")

    for s <- @superlative_specimens do
      refute hit?(@superlative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the superlative ban catches a comparative ranking against a nation or a region" do
    # These are the shapes restaurant writing reaches for, and every one of them
    # slipped past the first version of this ban. "densest in the nation" was
    # written into a link note and published a ranking claim the corpus does not
    # make.
    assert hit?(@superlative_patterns, "It remains the densest in the nation.")
    assert hit?(@superlative_patterns, "the busiest Korean restaurant row in the country")
    assert hit?(@superlative_patterns, "the biggest Koreatown in America")

    # Still not rankings: a count, a measurement, a date and an award all publish.
    refute hit?(@superlative_patterns, "Korean businesses on Lawrence Avenue fell from 158 in 1997 to 50 by 2017.")
    refute hit?(@superlative_patterns, "Twenty-five restaurants sit inside the city limits.")
    refute hit?(@superlative_patterns, "It holds one Michelin star, awarded in 2019.")
  end

  test "the proximity ban separates wayfinding from a named location" do
    assert hit?(@proximity_patterns, "It is a short walk from the station.")

    for s <- @proximity_specimens do
      refute hit?(@proximity_patterns, s), "rejected a location that must publish: #{s}"
    end
  end

  test "the photo-policy ban keeps copyright reasoning off the page" do
    assert hit?(@photo_policy_patterns, "Section 62 does not reach a graphic work.")

    for s <- @photo_policy_specimens do
      refute hit?(@photo_policy_patterns, s), "rejected a description that must publish: #{s}"
    end
  end

  test "the grill evidence patterns recognise a tabletop grill and reject a kitchen one" do
    assert Regex.match?(@tabletop_evidence, "A gas grill is set into each table.")
    assert Regex.match?(@tabletop_evidence, "Charcoal grills at the table.")
    assert Regex.match?(@tabletop_evidence, "Every table has a smokeless grill.")

    refute Regex.match?(@tabletop_evidence, "The kitchen grills the short rib and brings it out.")
    refute Regex.match?(@tabletop_evidence, "A soondubu house with no grill.")
  end

  test "grill evidence must appear in one sentence, not merely somewhere in the blob" do
    assert grill_at_the_table?("A gas grill is set into each table.")
    assert grill_at_the_table?("Charcoal grills at the table.")
    assert grill_at_the_table?("Every table has a smokeless grill.")

    # The case that defeated the first version of this check: a grill in one
    # sentence, a table in the next, and the meat cooked in the kitchen.
    refute grill_at_the_table?(
             "The chef grills bulgogi in an open kitchen. " <>
               "Diners are seated at the table for family-style service."
           )

    refute grill_at_the_table?("The kitchen grills the short rib and brings it out.")
    refute grill_at_the_table?("A soondubu house with no grill.")
  end

  test "a bare charcoal or gas grill is not evidence of a grill at the table" do
    # A kitchen can have a charcoal grill. This is the hole a South Bay summary
    # came through: "the option to grill their meat over a charcoal grill" cleared
    # the gate while never establishing that the grill was at the table.
    refute grill_at_the_table?("The option to grill their meat over a charcoal grill burning mesquite.")
    refute grill_at_the_table?("A gas grill runs the length of the kitchen.")

    # Still evidence, because these bind the grill to the table:
    assert grill_at_the_table?("A charcoal grill is set into each table.")
    assert grill_at_the_table?("Gas grills at the table.")

    # "smokeless" stays: a downdraft smokeless grill is tabletop by construction.
    assert grill_at_the_table?("Every table has a smokeless grill.")
  end

  # ------------------------------------------------------------------
  # Corpus assertions
  # ------------------------------------------------------------------

  for {name, key, label} <- [
        {"narrates the research", :method, "research method"},
        {"adjudicates its own coverage", :self_reference, "editorial self-reference"},
        {"states a superlative", :superlative, "a ranking claim"},
        {"orients by impression", :proximity, "orientation no source states"},
        {"explains the photo policy", :photo_policy, "the corpus's own copyright reasoning"}
      ] do
    @key key
    @label label
    test "no committed korean bbq prose #{name}" do
      patterns =
        case @key do
          :method -> @method_patterns
          :self_reference -> @self_reference_patterns
          :superlative -> @superlative_patterns
          :proximity -> @proximity_patterns
          :photo_policy -> @photo_policy_patterns
        end

      offenders =
        for {file, doc} <- decoded_files(),
            text <- prose(doc),
            hit?(patterns, text),
            do: {file, String.slice(text, 0, 140)}

      assert offenders == [],
             "korean bbq prose carries #{@label}:\n" <>
               Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
    end
  end

  test "every place's prose names a grill at the table" do
    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          text = "#{place["summary"]} #{place["history"]}",
          not grill_at_the_table?(text),
          do: {file, place["slug"]}

    assert offenders == [],
           "places whose prose does not establish a grill at the table. This collection " <>
             "promises tabletop Korean BBQ, and a place that cannot say the meat is cooked " <>
             "at the table does not belong in it:\n" <>
             Enum.map_join(offenders, "\n", fn {f, s} -> "  #{f}: #{s}" end)
  end

  test "every place is a restaurant, with a status the schema accepts" do
    valid = MapSet.new(Ethos.Places.Place.kinds())
    assert MapSet.member?(valid, "restaurant"), "the schema no longer has a restaurant kind"

    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          place["kind"] != "restaurant" or place["status"] not in ["open", "closed"],
          do: {file, place["slug"], place["kind"], place["status"]}

    assert offenders == [],
           "every place in this collection is a restaurant with status open or closed:\n" <>
             Enum.map_join(offenders, "\n", fn {f, s, k, st} ->
               "  #{f}: #{s} — kind #{inspect(k)}, status #{inspect(st)}"
             end)
  end

  test "every guide carries entries that resolve, and links that name a guide which exists" do
    entry_kinds = MapSet.new(~w(food tour walk sight stay tip))
    link_kinds = MapSet.new(Ethos.Links.Link.kinds())
    known = known_guide_slugs()

    offenders =
      for {file, doc} <- decoded_files() do
        entries = doc["entries"] || []
        own = MapSet.new(doc["places"] || [], & &1["slug"])

        bad_link =
          Enum.find(doc["links"] || [], fn l ->
            not MapSet.member?(link_kinds, l["kind"]) or
              (String.starts_with?(l["target"] || "", "guide:") and
                 not MapSet.member?(known, String.replace_prefix(l["target"], "guide:", "")))
          end)

        cond do
          entries == [] ->
            {file, "entries is empty — every place unreachable from the guide"}

          Enum.any?(entries, &(not MapSet.member?(entry_kinds, &1["kind"]))) ->
            {file, "an entry kind is not one of food/tour/walk/sight/stay/tip"}

          # A place this file OWNS must have an entry here, or it is orphaned.
          not MapSet.subset?(own, MapSet.new(entries, & &1["place_slug"])) ->
            {file, "a place this file owns has no entry, so no guide links it"}

          bad_link ->
            {file, "link #{inspect(bad_link["target"])} names no guide that exists, or a bad kind"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [], Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  defp known_guide_slugs do
    from_files =
      for path <- SeedDataHelpers.all_seed_files(),
          slug = path |> File.read!() |> Jason.decode!() |> get_in(["guide", "slug"]),
          is_binary(slug),
          do: slug

    from_code = for {guide, _owner} <- SeedDataHelpers.code_guides(), do: guide.slug

    MapSet.new(from_files ++ from_code)
  end

  test "a guide's shape matches its file, with two to four cluster sections" do
    # There is NO "Getting there" section, and that is deliberate. Every
    # previous gate required one because every previous guide was an area page
    # a reader travels to. These are subject pages; the clusters are what a
    # reader navigates by, and a page that lists forty restaurants in one
    # undifferentiated run has failed even if every fact is sourced.
    offenders =
      for {file, doc} <- decoded_files() do
        g = doc["guide"] || %{}
        words = g["intro"] |> to_string() |> String.split(~r/\s+/, trim: true) |> length()
        sections = length(g["sections"] || [])
        faq = length(g["faq"] || [])
        expected_slug = Path.rootname(file) <> "-korean-bbq-guide"

        cond do
          g["slug"] != expected_slug ->
            {file, "guide slug is #{inspect(g["slug"])}, want #{inspect(expected_slug)}"}

          String.length(g["title"] || "") > 120 ->
            {file, "title is #{String.length(g["title"])} characters, limit is 120"}

          words < 100 or words > 160 ->
            {file, "intro is #{words} words, want 100-160"}

          sections < 2 or sections > 4 ->
            {file, "has #{sections} sections, want 2-4 cluster sections"}

          faq < 4 or faq > 6 ->
            {file, "has #{faq} FAQ entries, want 4-6"}

          length(doc["links"] || []) < 2 ->
            {file, "has fewer than two links"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [], Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "no korean bbq destination derives a slug already used elsewhere" do
    ours =
      for {name, doc} <- decoded_files(),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(doc["guide"]["destination"]), name}

    others =
      for path <- SeedDataHelpers.all_seed_files(),
          not String.contains?(path, "/korean_bbq/"),
          doc = path |> File.read!() |> Jason.decode!(),
          dest = get_in(doc, ["guide", "destination"]),
          is_binary(dest),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(dest), Path.basename(path)}

    collisions = for {slug, name} <- ours, other = others[slug], do: {name, slug, other}

    assert collisions == [],
           "a korean bbq destination derives a slug another seed file already derives, which " <>
             "co-lists two places on one page: #{inspect(collisions)}"
  end

  test "every photograph carries a publishable licence and its attribution" do
    offenders =
      for {file, doc} <- decoded_files(),
          photo <- photos(doc),
          reason = licence_fault(photo),
          reason != nil,
          do: {file, photo["title"] || photo["src"], reason}

    assert offenders == [],
           "photographs fail the licence gate:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t, r} -> "  #{f}: #{t} — #{r}" end)
  end

  test "the seed directory the gate reads is the one the corpus lives in" do
    assert File.dir?(@seed_dir), "priv/seed_data/korean_bbq does not exist"
  end

  # Delete this @tag when the last wave lands, and not before: until then the
  # corpus is a prefix of the ten and both assertions fail by construction.
  @tag :pending_korean_bbq
  test "all ten guides ship and the collection holds at least 100 restaurants" do
    shipped = files() |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()
    expected = MapSet.new(@zones)

    assert MapSet.equal?(shipped, expected),
           "corpus does not match the ten guides.\n" <>
             "  expected but not shipped: " <>
             inspect(expected |> MapSet.difference(shipped) |> Enum.sort()) <>
             "\n  shipped but not expected: " <>
             inspect(shipped |> MapSet.difference(expected) |> Enum.sort())

    # Counts every restaurant the collection PRESENTS, which is entries rather
    # than places: a restaurant whose place record lives in a neighborhood file
    # still counts, and that is most of Manhattan, London and San Francisco.
    total =
      decoded_files()
      |> Enum.flat_map(fn {_f, doc} -> doc["entries"] || [] end)
      |> Enum.map(& &1["place_slug"])
      |> Enum.uniq()
      |> length()

    assert total >= 100,
           "the collection presents #{total} restaurants and promises at least 100. " <>
             "DO NOT loosen the grill definition to close this gap — extend to Atlanta " <>
             "(Duluth/Gwinnett) and northern Virginia (Annandale), or lower the promise."
  end

  # Tagged for the same reason as the assertion above: the collection is
  # created by the task that lands the tenth guide, so until then this fails
  # because nothing has created it yet, not because anything is wrong.
  @tag :pending_korean_bbq
  test "the collection exists, is published, and holds every korean bbq guide" do
    collection = Ethos.Collections.get_published_by_slug(@collection_slug)

    assert collection, "no published collection at /c/#{@collection_slug}"

    item_slugs = MapSet.new(collection.items, & &1.guide.slug)
    want = MapSet.new(@zones, &(&1 <> "-korean-bbq-guide"))

    assert MapSet.subset?(want, item_slugs),
           "the collection is missing: " <>
             inspect(want |> MapSet.difference(item_slugs) |> Enum.sort())
  end
end
