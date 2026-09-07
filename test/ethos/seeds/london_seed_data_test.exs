defmodule Ethos.Seeds.LondonSeedDataTest do
  @moduledoc """
  The gate every London research wave must pass.

  Written before the corpus it guards, as the Bronx, Queens, Rome and San
  Francisco gates were, so it lands excluded: over a `priv/seed_data/london/`
  holding only `.gitkeep`, roster equality and every non-vacuity floor fail by
  construction, and a gate that fails for want of content is noise rather than
  information. See `test/test_helper.exs` for the removal stages.

  ## The seven prose bans are inherited, not re-derived

  Each carries a self-test proving the pattern can fail and a specimen list
  proving it does not fire on prose that must publish. The specimens matter
  more than the patterns: across Rome and San Francisco every ban produced
  false positives — "Italy's first king" is a succession, "the Capitolium at
  the north end" is architecture, a working hospital that "is not a visitor
  site" is open, and "so none is named here" is the permitted refusal — and
  each narrowing became a regression test. This file is where that knowledge
  survives into a seventh programme.

  ## What London does differently

  **The section rule is 2 to 5, not 2 to 3.** Every previous gate allowed two
  or three sections including one headed exactly "Getting there", which leaves
  one or two for content. That was written for neighbourhoods. London's unit is
  the borough, chosen knowingly over the neighbourhood for its provenance and
  its complete coverage, and the scoping wave's answer was blunt: Southwark
  cannot be navigated in two. A page holding Borough Market, Tate Modern, the
  Shard and Dulwich Village needs Bankside and Borough, Bermondsey and
  Rotherhithe, and Walworth, Peckham and Dulwich before it reaches Getting
  there. The upper bound moving is the cost of the unit being paid in the gate
  rather than in the prose.

  **Designation claims want an NHLE list entry number.** This is San
  Francisco's citation rule from a stronger register: Historic England gives
  every listed building a seven-digit number and a grade. It is emphatically
  NOT Rome's ban — Rome forbade the claim because no register was reachable,
  and London's is a live OGL geospatial API.

  **There is no photo blocklist of buildings, and there is one of two other
  things.** s.62 CDPA 1988 covers buildings — s.4(2) defines those as any fixed
  structure and a part of one — and sculptures and works of artistic
  craftsmanship, if permanently situated. So the architect's death date is
  irrelevant and the Shard publishes, where Rome rejected MAXXI for exactly
  that. What is excluded is graphic works, which keeps murals and Banksy out,
  and anything NOT PERMANENTLY SITUATED, which keeps the Fourth Plinth out
  although it is sculpture in a public place.
  """
  use Ethos.DataCase, async: false

  # @moduletag :pending_london removed 2026-09-04 by wave 1, which landed the
  # City and ten inner boroughs. Everything in this module now runs except the
  # roster-equality test, which keeps its own `@tag` until the corpus reaches
  # all thirty-three.

  alias Ethos.SeedDataHelpers

  @roster_path Path.expand("../../../priv/seed_data/london_roster.json", __DIR__)
  @seed_dir Path.expand("../../../priv/seed_data/london", __DIR__)

  # ------------------------------------------------------------------
  # The seven prose bans
  # ------------------------------------------------------------------

  @method_patterns [
    ~r/\bcould not be (?:reached|re-?read|certified|confirmed)\b/i,
    ~r/\b(?:did not|does not|failed to) (?:resolve|answer)\b/i,
    ~r/\bHTTP\s*\d{3}\b/i,
    ~r/\breturn(?:s|ed) (?:an?\s+)?(?:error|\d{3})\b/i,
    ~r/\bfootprint (?:test|score|lies|falls)\b/i,
    ~r/\btests? (?:wholly|cleanly|inside|into)\b/i,
    ~r/\b(?:during|for|in) (?:this |the )?research\b(?!\s+for\b)/i,
    ~r/\bthis research\b/i,
    ~r/\bre-?fetched on\b/i,
    ~r/\bfor this guide\b/i,
    ~r/\bis published here\b/i,
    ~r/\b(?:was|were) obtained for (?:this|the) (?:guide|record|entry)\b/i,
    ~r/\b(?:was|were) reached\b/i,
    ~r/\bspatial join\b/i,
    ~r/\bFeatureServer\b/i
  ]

  @method_specimens [
    "No source states its opening hours, so none are given here.",
    "Historic England and the borough disagree about the date of listing.",
    "The Royal Parks give the acreage as 350."
  ]

  # The page must not narrate its own editorial decisions. Rome's worst ban by
  # volume — 218 instances across 29 of 30 files.
  @self_reference_patterns [
    ~r/\b(?:is|are|was|were)\s+(?:not\s+)?written\s+(?:here|there|on this page|as a place|in\b)/i,
    ~r/\bon this page\b/i,
    ~r/\bthis page (?:carries|holds|cannot|does not|gives|says|stops|publishes)\b/i,
    ~r/\bthis guide (?:carries|holds|writes|does not pretend|gives none|establishes)\b/i,
    ~r/\bthis record (?:claims|carries|states|holds)\b/i,
    ~r/\bbelongs? to \w+(?:'s)? (?:page|guide)\b/i,
    ~r/\b(?:is|are) (?:recorded|reported|gathered) here\b/i,
    ~r/\bnothing here should be read as\b/i,
    ~r/\ba gap in this guide\b/i
  ]

  # "so none are given here" is the PERMITTED refusal and stays. The subject
  # test applies to the main clause: "No source states its hours" is about the
  # fact; "No hours are named here" is about the page. Three fix agents asked
  # about this in the San Francisco programme and none diverged unilaterally;
  # it is 676 instances across two cities and it is house style.
  @self_reference_specimens [
    "No source states its opening hours, so none are given here.",
    "The hall stands here, on the south side of Kensington Gore.",
    "Historic England records the listing as Grade I, NHLE 1217742."
  ]

  @superlative_patterns [
    ~r/(?<![-\w])(?:only|first|oldest|largest|smallest|finest|grandest|greatest|best|tallest|richest|most\s+\w+)\s+(?:\w+\s+){0,2}(?:in|of|on)\s+(?:the\s+)?(?:borough|city|London|England|Britain|the UK|the country|the capital)\b/i,
    ~r/\bone of the (?:most|best|finest|largest|oldest|greatest)\b/i,
    ~r/\b(?:the (?:borough|city|capital)'s|London's|England's|Britain's)\s+(?:only|oldest|largest|smallest|finest|greatest|best)\b/i,
    ~r/\b[A-Z][a-z]+(?:'s|s')\s+only\b/,
    ~r/\b(?:southern|northern|eastern|western)most\b/i,
    ~r/\bthe one (?:genuinely|thing|source|entry)\b/i,
    ~r/\bmost (?:travellers|travelers|visitors|guidebooks|guides|people)\b/i,
    ~r/\bthe only (?:one|stretch|example|work|surviving)\b/i
  ]

  # A date, a count, a measurement and a position in an official series are all
  # facts rather than rankings, and a GRADE is a category rather than a ranking
  # even though it reads like one.
  @superlative_specimens [
    "Westminster Abbey was listed on 24 February 1958.",
    "Grade I covers 2.5% of listed buildings nationally.",
    "The borough is the sixth by population.",
    "Last admission is 4.30pm."
  ]

  @proximity_patterns [
    ~r/\bat the (?:north|south|east|west|northern|southern|eastern|western|far|top|bottom) (?:end|edge) of (?:the )?(?:borough|neighbourhood|neighborhood|district|city)\b/i,
    ~r/\ba (?:short|ten-minute|five-minute|brief) walk\b/i,
    ~r/\bjust (?:around the corner|off|beyond)\b/i,
    ~r/\ba stone's throw\b/i,
    ~r/\bsteps (?:from|away)\b/i,
    ~r/\bnot far from\b/i,
    ~r/\bworth the walk\b/i,
    ~r/\bup the hill from\b/i,
    ~r/\bone street over\b/i
  ]

  # Adjacency between structures that touch, a sourced measurement, and the
  # side of a NAMED street all publish. San Francisco's ban was narrowed twice
  # for exactly these.
  @proximity_specimens [
    "The Orangery stands beside Kensington Palace.",
    "Historic England gives the distance as 200 metres.",
    "The gallery is on the north side of Trafalgar Square.",
    "Tate Modern faces St Paul's across the Millennium Bridge."
  ]

  # The photo policy is not the reader's business. San Francisco published its
  # own copyright reasoning as prose — "The murals are artworks rather than
  # architecture" — which is 17 USC 120(a) explaining why a page has no picture.
  # The UK equivalents are named here.
  @photo_policy_patterns [
    ~r/\b(?:artworks?|sculpture|a designed work)s? rather than (?:architecture|an? architectural)/i,
    ~r/\bis not an architectural (?:one|work)\b/i,
    ~r/\bfreedom of panorama\b/i,
    ~r/\bs\.?\s?62\b|\bsection 62\b/i,
    ~r/\bCDPA\b/,
    ~r/\bpermanently situated\b/i,
    ~r/\bgraphic work\b/i
  ]

  @photo_policy_specimens [
    "The plinth has stood empty since 1841 and now carries a rotating commission.",
    "The mural was painted in 1983 by a collective of Brixton artists.",
    "The sculpture is bronze and stands four metres high."
  ]

  # A fetch failure written as a fact about the world, and the most damaging
  # shape the corpus produces: San Francisco wrote it fifteen times across
  # fourteen of twenty-three files, in the one section a reader acts on.
  #
  # London has less excuse than any predecessor. TfL's unified API answers with
  # no key and returns the nearest stop, its modes and its named lines.
  @transit_negative_patterns [
    ~r/\bno source (?:states|names|gives)\s+(?:a\s+)?(?:bus route|tube station|rail station|transit|Underground|station)/i,
    ~r/\bno source (?:states|names|gives)[^.]{0,60}(?:bus route|rail station|tube|Underground|transit line)/i
  ]

  @transit_negative_specimens [
    "Tottenham Court Road is on the Central, Northern and Elizabeth lines.",
    "No source states its opening hours, so none are given here.",
    "TfL gives the nearest stop as Southwark, on the Jubilee line."
  ]

  # ------------------------------------------------------------------
  # The designation rule — a CITATION requirement, from a strong register
  # ------------------------------------------------------------------
  #
  # NOT Rome's ban. Rome forbade every protection claim because Vincoli in Rete
  # and the Catalogo generale were unreachable; the National Heritage List is a
  # live OGL geospatial API. So the claim is welcome and must carry its number.
  #
  # Conservation areas are the deliberate exception: they are borough-designated
  # and carry no national number, so naming one as a conservation area
  # satisfies this rule without an identifier. Their internal UID — values like
  # 280 and 7143 — must never be published as a list entry number, which is why
  # the citation pattern does not accept a bare number.
  @designation_claim ~r/\b(?:listed|designated|scheduled|registered)\b/i

  @designation_citation ~r/(?:NHLE\s*(?:list entry\s*)?\d{6,7}|list entry\s*(?:number\s*)?\d{6,7}|National Heritage List|Historic England|conservation area|World Heritage Site|scheduled monument)/i

  # ------------------------------------------------------------------
  # The photo rule — the broadest cover this corpus has met, with two holes
  # ------------------------------------------------------------------
  #
  # There is NO blocklist of buildings for London. The architect's death date
  # is irrelevant: s.4(2) makes any fixed structure a building and s.62 exempts
  # photographing it, so the Shard publishes where Rome rejected MAXXI.
  #
  # These are the two exclusions, and both are subject-side rather than
  # licence-side, so a clean CC tag says nothing about them.
  @excluded_subjects [
    {"fourth-plinth",
     "temporary — s.62 requires permanently situated; Commons deleted Hahn/Cock, Gift Horse and Alison Lapper Pregnant on that ground"},
    {"fourth plinth", "temporary — s.62 requires permanently situated"},
    {"banksy",
     "graphic work and living; Commons deleted Category:Banksy in London on 31 Dec 2025"},
    {"mural", "a graphic work under s.4(2), which s.62(1) does not name"},
    {"street-art", "graphic work"},
    {"street art", "graphic work"},
    {"graffiti", "graphic work"}
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
  # Helpers
  # ------------------------------------------------------------------

  defp roster, do: @roster_path |> File.read!() |> Jason.decode!()

  defp in_scope_slugs do
    roster()["zones"] |> Enum.filter(& &1["in_scope"]) |> MapSet.new(& &1["slug"])
  end

  defp files, do: SeedDataHelpers.seed_files("london")

  defp decoded_files do
    Enum.map(files(), fn path ->
      {Path.basename(path), path |> File.read!() |> Jason.decode!()}
    end)
  end

  # Entry notes ARE included. Rome shipped 153 of them unchecked because this
  # function was written before entries existed and nobody widened it.
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

  # A FAQ is a question and its answer, and a reader sees both. Checking them
  # separately flagged a San Francisco answer as uncited when its own question
  # carried the number.
  defp designation_texts(doc) do
    guide = doc["guide"] || %{}
    pairs = Enum.map(guide["faq"] || [], &"#{&1["question"]} #{&1["answer"]}")

    Enum.reject(
      prose(doc),
      &(&1 in Enum.flat_map(guide["faq"] || [], fn f -> [f["question"], f["answer"]] end))
    ) ++ pairs
  end

  defp photos(doc) do
    ((doc["guide"] || %{})["photos"] || []) ++
      ((doc["places"] || []) |> Enum.flat_map(&(&1["photos"] || [])))
  end

  defp hit?(patterns, text), do: Enum.any?(patterns, &Regex.match?(&1, text))

  defp designation_ok?(text) do
    not Regex.match?(@designation_claim, text) or Regex.match?(@designation_citation, text)
  end

  defp blocked_subject(photo) do
    haystack =
      [photo["title"], photo["description"], photo["src"]]
      |> Enum.filter(&is_binary/1)
      |> Enum.join(" ")
      |> String.downcase()

    Enum.find(@excluded_subjects, fn {needle, _} -> String.contains?(haystack, needle) end)
  end

  # ------------------------------------------------------------------
  # Self-tests — these hold from the day this file lands
  # ------------------------------------------------------------------

  test "the research-method ban catches leaked provenance, and only there" do
    assert hit?(@method_patterns, "Historic England returned a 403.")
    assert hit?(@method_patterns, "Borough attribution needed a spatial join.")

    for s <- @method_specimens do
      refute hit?(@method_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the self-reference ban separates the page from the fact" do
    assert hit?(@self_reference_patterns, "The palace is not written as a place here.")
    assert hit?(@self_reference_patterns, "This page carries no restaurants.")

    for s <- @self_reference_specimens do
      refute hit?(@self_reference_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the superlative ban catches a ranking, and spares a grade" do
    assert hit?(@superlative_patterns, "The oldest church in the borough.")
    assert hit?(@superlative_patterns, "It is one of the finest Wren interiors.")

    for s <- @superlative_specimens do
      refute hit?(@superlative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the proximity ban separates wayfinding from adjacency" do
    assert hit?(@proximity_patterns, "It sits at the north end of the borough.")
    assert hit?(@proximity_patterns, "It is a short walk from the station.")

    for s <- @proximity_specimens do
      refute hit?(@proximity_patterns, s), "rejected an adjacency that must publish: #{s}"
    end
  end

  test "the photo-policy ban keeps copyright reasoning off the page" do
    assert hit?(@photo_policy_patterns, "The murals are artworks rather than architecture.")
    assert hit?(@photo_policy_patterns, "Section 62 does not reach a graphic work.")

    for s <- @photo_policy_specimens do
      refute hit?(@photo_policy_patterns, s), "rejected a description that must publish: #{s}"
    end
  end

  test "the transit-negative ban catches a fetch failure dressed as a fact" do
    assert hit?(
             @transit_negative_patterns,
             "No source states a bus route or a tube station for the borough."
           )

    for s <- @transit_negative_specimens do
      refute hit?(@transit_negative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "a designation claim needs its register and, where one exists, its number" do
    refute designation_ok?("The house is listed.")
    refute designation_ok?("It was designated in 1958.")

    assert designation_ok?("Grade I listed, NHLE 1291494.")
    assert designation_ok?("Listed Grade II* in 1980, list entry number 1357620.")
    assert designation_ok?("Historic England lists it at Grade II.")

    # Conservation areas are borough-designated and carry no national number.
    assert designation_ok?("The terrace stands in the Bankside conservation area.")

    # A scheduled monument is a different designation with no Grade field.
    assert designation_ok?("It is a scheduled monument.")

    # A sentence making no designation claim needs no citation.
    assert designation_ok?("The hall opened in 1871.")
  end

  test "the excluded-subject list catches what s.62 does not reach" do
    assert blocked_subject(%{"title" => "Fourth Plinth, Trafalgar Square"}),
           "the Fourth Plinth is sculpture in a public place and still out — it is temporary"

    assert blocked_subject(%{"title" => "Banksy mural, Shoreditch"})

    # There is NO building blocklist for London. This is the case Rome rejected
    # and San Francisco allowed, and the UK allows it too.
    refute blocked_subject(%{"title" => "The Shard from London Bridge"}),
           "s.4(2) makes any fixed structure a building; the architect being alive is irrelevant"

    refute blocked_subject(%{"title" => "Eros at Piccadilly Circus"}),
           "a permanent sculpture in a public place is inside s.62"
  end

  # ------------------------------------------------------------------
  # Corpus assertions
  # ------------------------------------------------------------------

  test "the roster-equality reference set is the in-scope subset" do
    all = MapSet.new(roster()["zones"], & &1["slug"])
    scoped = in_scope_slugs()

    assert MapSet.size(scoped) > 0, "no london borough is in scope"
    assert MapSet.subset?(scoped, all)
    assert MapSet.size(all) == 33, "the roster is not the GLA's 33 units"
  end

  for {name, key, label} <- [
        {"narrates the research", :method, "research method"},
        {"adjudicates its own coverage", :self_reference, "editorial self-reference"},
        {"states a superlative", :superlative, "a ranking claim"},
        {"orients by impression", :proximity, "orientation no source states"},
        {"explains the photo policy", :photo_policy, "the corpus's own copyright reasoning"},
        {"claims transit is unpublished", :transit_negative, "a fetch failure written as a fact"}
      ] do
    @key key
    @label label
    test "no committed london prose #{name}" do
      patterns =
        case @key do
          :method -> @method_patterns
          :self_reference -> @self_reference_patterns
          :superlative -> @superlative_patterns
          :proximity -> @proximity_patterns
          :photo_policy -> @photo_policy_patterns
          :transit_negative -> @transit_negative_patterns
        end

      offenders =
        for {file, doc} <- decoded_files(),
            text <- prose(doc),
            hit?(patterns, text),
            do: {file, String.slice(text, 0, 140)}

      assert offenders == [],
             "london prose carries #{@label}:\n" <>
               Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
    end
  end

  test "every designation claim names its register" do
    offenders =
      for {file, doc} <- decoded_files(),
          text <- designation_texts(doc),
          not designation_ok?(text),
          do: {file, String.slice(text, 0, 140)}

    assert offenders == [],
           "a designation claim publishes with no register. Unlike Rome, the National Heritage " <>
             "List is a live OGL API, so the claim is welcome — but a listed building must carry " <>
             "its NHLE number:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
  end

  test "no photograph shows a subject s.62 does not reach" do
    offenders =
      for {file, doc} <- decoded_files(),
          photo <- photos(doc),
          hit = blocked_subject(photo),
          hit != nil do
        {needle, why} = hit
        {file, needle, why}
      end

    assert offenders == [],
           "a photograph shows a subject outside s.62 CDPA. There is no building blocklist for " <>
             "London — the exclusions are graphic works and anything not permanently situated:\n" <>
             Enum.map_join(offenders, "\n", fn {f, s, w} -> "  #{f}: #{s} — #{w}" end)
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

  test "every place carries a kind the schema accepts" do
    valid = MapSet.new(Ethos.Places.Place.kinds())

    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          not MapSet.member?(valid, place["kind"]),
          do: {file, place["slug"], place["kind"]}

    assert offenders == [],
           "places carry a kind the schema rejects at seed time. Valid: " <>
             inspect(Enum.sort(valid)) <>
             "\n" <> Enum.map_join(offenders, "\n", fn {f, s, k} -> "  #{f}: #{s} — #{k}" end)
  end

  test "every guide carries entries that resolve to its own places" do
    valid = MapSet.new(~w(food tour walk sight stay tip))

    offenders =
      for {file, doc} <- decoded_files() do
        entries = doc["entries"] || []
        slugs = MapSet.new(doc["places"] || [], & &1["slug"])

        cond do
          entries == [] ->
            {file, "entries is empty — every place unreachable from the guide"}

          Enum.any?(entries, &(not MapSet.member?(slugs, &1["place_slug"]))) ->
            {file, "an entry place_slug does not resolve, which aborts the seed run"}

          Enum.any?(entries, &(not MapSet.member?(valid, &1["kind"]))) ->
            {file, "an entry kind is not one of food/tour/walk/sight/stay/tip"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [], Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "every link carries a valid kind, a note the column accepts, and a target that exists" do
    valid = MapSet.new(Ethos.Links.Link.kinds())

    offenders =
      for {file, doc} <- decoded_files(),
          link <- doc["links"] || [],
          reason = link_fault(link, valid, known_guide_slugs()),
          reason != nil,
          do: {file, link["target"], reason}

    assert offenders == [],
           "links will be rejected at seed time:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t, r} -> "  #{f}: #{t} — #{r}" end)
  end

  # Every guide slug the corpus can resolve: the JSON files and the code seeds
  # both, because a London file may legitimately link to either.
  #
  # This test asserted only that a target ENDED IN "-guide" until London wave 1
  # shipped "guide:southwark-guide", which ends in "-guide", is not a slug that
  # exists, passed this gate cleanly and aborted the seed run at
  # `Links.resolve!/1` — partway through, since seeding is not transactional, so
  # earlier files were published and later ones were not. A shape check cannot
  # catch a wrong name. Only the real set can.
  defp known_guide_slugs do
    from_files =
      for path <- SeedDataHelpers.all_seed_files(),
          slug = path |> File.read!() |> Jason.decode!() |> get_in(["guide", "slug"]),
          is_binary(slug),
          do: slug

    from_code = for {guide, _owner} <- SeedDataHelpers.code_guides(), do: guide.slug

    MapSet.new(from_files ++ from_code)
  end

  defp link_fault(link, valid, known) do
    target = link["target"] || ""

    cond do
      not MapSet.member?(valid, link["kind"]) ->
        "kind #{inspect(link["kind"])} is not one of #{inspect(Enum.sort(valid))}"

      String.starts_with?(target, "guide:") and
          not MapSet.member?(known, String.replace_prefix(target, "guide:", "")) ->
        "target #{inspect(target)} names no guide that exists — Links.resolve!/1 raises on it " <>
          "and aborts the seed run partway through"

      String.length(link["note"] || "") > 160 ->
        "note is #{String.length(link["note"])} characters, limit is 160"

      true ->
        nil
    end
  end

  test "a tier matches the file it labels, with two to five sections" do
    # The section bound is 2..5 rather than 2..3 because the unit is a borough.
    # Southwark cannot be navigated in two: Bankside and Borough, Bermondsey
    # and Rotherhithe, and Walworth, Peckham and Dulwich all precede Getting
    # there. That is the cost of the unit, paid here rather than in the prose.
    offenders =
      for {file, doc} <- decoded_files() do
        g = doc["guide"] || %{}
        places = length(doc["places"] || [])
        words = g["intro"] |> to_string() |> String.split(~r/\s+/, trim: true) |> length()
        headings = Enum.map(g["sections"] || [], & &1["heading"])
        faq = length(g["faq"] || [])
        links = length(doc["links"] || [])

        cond do
          String.length(g["title"] || "") > 120 ->
            {file, "title is #{String.length(g["title"])} characters, limit is 120"}

          g["tier"] == "town-page" and places >= 6 ->
            {file, "tier town-page carries #{places} places; the form is for fewer than six"}

          g["tier"] == "town-page" and (words < 90 or links < 2) ->
            {file, "town-page needs a 90-word intro and two links; has #{words} and #{links}"}

          g["tier"] == "town-page" ->
            nil

          g["tier"] == "guide" and places < 4 ->
            {file, "tier guide carries #{places} places; the form needs at least four"}

          g["tier"] == "guide" and (words < 100 or words > 160) ->
            {file, "guide intro is #{words} words, want 100-160"}

          g["tier"] == "guide" and (faq < 4 or faq > 6) ->
            {file, "guide has #{faq} FAQ entries, want 4-6"}

          g["tier"] == "guide" and length(headings) < 2 ->
            {file, "guide has #{length(headings)} sections, want 2-5"}

          g["tier"] == "guide" and length(headings) > 5 ->
            {file, "guide has #{length(headings)} sections, want 2-5"}

          g["tier"] == "guide" and "Getting there" not in headings ->
            {file, "no section headed exactly Getting there: #{inspect(headings)}"}

          g["tier"] == "guide" ->
            nil

          true ->
            {file, "unknown tier #{inspect(g["tier"])}"}
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [],
           "tier or shape does not match the file:\n" <>
             Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "every committed file is valid, globally unique, and routes correctly" do
    files = files()
    assert files != [], "no london seed file has been committed yet"

    for path <- files do
      doc = path |> File.read!() |> Jason.decode!()
      name = Path.basename(path)

      assert is_map(doc["guide"]), "#{name} has no guide object"

      # Asserted on the node path, which replaced the state/county pair the
      # corpus carried until the destination tree landed. The pair said state
      # "England", county "London"; the path says the same thing and three
      # tiers more of it, so a file filed under Manchester — or under London
      # with no borough — fails here rather than routing to a hub that happens
      # to share a slug.
      london = "united-kingdom/england/london"
      guide_path = doc["guide"]["destination_path"]

      assert String.starts_with?(guide_path, london <> "/"),
             "#{name} is filed under #{inspect(guide_path)}, not under a borough of " <>
               "#{inspect(london)}"

      # The places of a borough file belong to that borough — at the borough
      # node itself or at one of its towns, which is where most of them sit.
      for p <- doc["places"] do
        assert p["destination_path"] == guide_path or
                 String.starts_with?(p["destination_path"], guide_path <> "/"),
               "#{name}: place #{p["slug"]} is filed under " <>
                 "#{inspect(p["destination_path"])}, outside its own guide's " <>
                 "#{inspect(guide_path)}"
      end

      # The guide slug follows the FILE, not the destination string. Greenwich
      # shipped as "royal-borough-of-greenwich-guide" in wave 1, derived from
      # its destination — and the formal name genuinely does belong in the
      # destination, where it resolves a collision with Greenwich, Connecticut.
      # It does not belong in the slug: two sibling files linked to
      # "greenwich-london-guide", the name the file predicts, and both were
      # wrong in a way no reader of either file could see.
      expected = Path.rootname(name) <> "-london-guide"

      assert doc["guide"]["slug"] == expected,
             "#{name} carries guide slug #{inspect(doc["guide"]["slug"])}, but every sibling " <>
               "linking to it will write #{inspect(expected)}"
    end

    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end

  test "no london destination derives a slug already used elsewhere" do
    # derive_destination_slug/1 keeps only the first comma-segment and discards
    # the state, so "Greenwich, England" and "Greenwich, Connecticut" collide.
    # The roster resolves both by formal name. Compared against seed files only,
    # never code seeds, so deliberate co-listing stays possible.
    ours =
      for {name, doc} <- decoded_files(),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(doc["guide"]["destination"]), name}

    others =
      for path <- SeedDataHelpers.all_seed_files(),
          not String.contains?(path, "/london/"),
          doc = path |> File.read!() |> Jason.decode!(),
          dest = get_in(doc, ["guide", "destination"]),
          is_binary(dest),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(dest), Path.basename(path)}

    collisions = for {slug, name} <- ours, other = others[slug], do: {name, slug, other}

    assert collisions == [],
           "a london destination derives a slug another seed file already derives, which " <>
             "co-lists two places on one page. Resolve by changing the destination string, " <>
             "never by deleting this assertion: #{inspect(collisions)}"
  end

  # @tag :pending_london removed 2026-09-04 by wave 3, which landed the final
  # eleven and brought London to all thirty-three units. This assertion now
  # runs, and from here it is what stops a file being deleted or a borough
  # being quietly dropped.
  test "the shipped corpus matches the in-scope roster exactly" do
    expected = in_scope_slugs()
    shipped = files() |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    assert MapSet.size(expected) > 0, "no london borough is in scope"

    assert MapSet.equal?(shipped, expected),
           "corpus does not match the in-scope roster.\n" <>
             "  rostered but not shipped: " <>
             inspect(expected |> MapSet.difference(shipped) |> Enum.sort()) <>
             "\n  shipped but not rostered: " <>
             inspect(shipped |> MapSet.difference(expected) |> Enum.sort())
  end

  test "the seed directory the gate reads is the one the corpus lives in" do
    assert File.dir?(@seed_dir), "priv/seed_data/london does not exist"
  end
end
