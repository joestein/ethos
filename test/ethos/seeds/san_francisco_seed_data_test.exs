defmodule Ethos.Seeds.SanFranciscoSeedDataTest do
  @moduledoc """
  The gate every San Francisco research wave must pass.

  Written before the corpus it guards, exactly as the Bronx, Queens and Rome
  gates were, so it lands excluded: over a `priv/seed_data/san_francisco/`
  holding only `.gitkeep`, roster equality and every non-vacuity floor fail by
  construction, and a gate that fails because there is nothing to check yet is
  noise rather than information. See `test/test_helper.exs` for the removal
  stages.

  ## What this gate inherits, and what it does differently

  The five prose bans are carried from Rome essentially unchanged, because they
  were learned the hard way there: three rounds of agents reading prose found
  most instances of each and never all of them, and only regexes converged.
  Each ban ships with a self-test proving the pattern can fail and a specimen
  list proving it does not fire on prose that must publish — the specimens
  matter more than the patterns, because every Rome ban produced false
  positives and each narrowing is recorded as one of these.

  Two things differ from Rome, and both are consequences of San Francisco being
  in the United States rather than Italy.

  **Designation claims publish here, with a citation.** Rome banned every
  protection claim outright because Vincoli in Rete and the Catalogo generale
  were unreachable from that network, so no claim could be checked against
  anything. San Francisco's registers answered during scoping on 2026-09-03 —
  the DataSF Socrata API, SF Planning and the National Register all returned
  200 — so the ban inverts into a citation requirement. That inversion is only
  coherent because the Rome ban was written as provenance-conditional rather
  than as a matter of taste; see `priv/seed_data/rome_roster.json`.

  **The photo rule relaxes for buildings and holds for artworks.** Italy has no
  freedom of panorama, which forced Rome's four-gate rule and a blocklist of
  modern buildings. 17 USC 120(a) gives it back for architectural works, so the
  simpler Bronx and Queens rule applies again. It does NOT cover sculptures,
  murals or other public artworks, which keep full copyright, and San Francisco
  is dense with them — so the subject check survives in narrowed form and this
  gate carries an artwork blocklist rather than a building one.
  """
  use Ethos.DataCase, async: false

  # @moduletag :pending_san_francisco removed 2026-09-03 by wave 1, which landed
  # the first twelve seed files — 468 places between them. Everything in this
  # module now runs except the roster-equality test, which keeps its own `@tag`
  # until all 23 zones ship.

  alias Ethos.SeedDataHelpers

  @roster_path Path.expand("../../../priv/seed_data/san_francisco_roster.json", __DIR__)
  @seed_dir Path.expand("../../../priv/seed_data/san_francisco", __DIR__)

  # ------------------------------------------------------------------
  # The five prose bans, carried from Rome
  # ------------------------------------------------------------------

  # Research method must not reach the reader. The provenance argument belongs
  # in docs/san-francisco/; the page carries the fact it supports. A reader who
  # wants to know why a page gives no opening hours is served by "no source
  # states them", not by a status code.
  @method_patterns [
    ~r/\bcould not be (?:reached|re-?read|certified|confirmed)\b/i,
    ~r/\b(?:did not|does not|failed to) (?:resolve|answer)\b/i,
    ~r/\bHTTP\s*\d{3}\b/i,
    ~r/\bself-signed certificate\b/i,
    ~r/\bfootprint (?:test|score|lies|falls)\b/i,
    ~r/\btests? (?:wholly|cleanly|inside|into)\b/i,
    ~r/\bno vertex\b|\bvertices\b/i,
    ~r/\b(?:during|for|in) (?:this |the )?research\b(?!\s+for\b)/i,
    ~r/\bthis research\b/i,
    ~r/\bindependent (?:checks?|geometric methods?|geocoding methods?)\b/i,
    ~r/\bre-?fetched on\b/i,
    ~r/\bfor this guide\b/i,
    ~r/\bis published here\b/i,
    ~r/\b(?:was|were) obtained for (?:this|the) (?:guide|record|entry)\b/i,
    ~r/\b(?:was|were) reached\b/i,
    ~r/\bboundary (?:research|geometry|method)\b/i,
    ~r/\breturn(?:s|ed) (?:an?\s+)?(?:error|\d{3})\b/i
  ]

  @method_specimens [
    "No source states its opening hours, so none are given here.",
    "SF Planning and the National Register disagree about the construction date.",
    "The Landmarks Preservation Advisory Board recommended designation in 1977."
  ]

  # The page must not narrate its own editorial decisions. Rome's worst ban by
  # volume — 218 instances across 29 of 30 files. A page with no restaurants
  # does not list restaurants; it does not announce that it has none.
  #
  # The distinction from the permitted refusal is the SUBJECT of the sentence:
  # "No source states its hours" is about the FACT and publishes; "No hours are
  # named here" is about the PAGE and does not.
  @self_reference_patterns [
    ~r/\b(?:is|are|was|were)\s+(?:not\s+)?written\s+(?:here|there|on this page|as a place|in\b)/i,
    ~r/\bon this page\b/i,
    ~r/\bthis page (?:carries|holds|cannot|does not|gives|says|stops|publishes)\b/i,
    ~r/\bthis guide (?:carries|holds|writes|does not pretend|gives none|establishes)\b/i,
    ~r/\bthis record (?:claims|carries|states|holds)\b/i,
    ~r/\bbelongs? to \w+(?:'s)? (?:page|guide)\b/i,
    # "named" is deliberately NOT in this alternation. The gate contradicted
    # itself on wave 1: it blessed "so none are given here" as the permitted
    # refusal in its own specimen list, then flagged SoMa's "no source
    # establishes which occupies which address, so none is named here" —
    # the identical construction with a different verb. The refusal is about
    # the FACT and publishes; the Rome case this pattern was written for is
    # the page describing its own choices, which the next line still catches.
    ~r/\b(?:is|are) (?:recorded|reported|gathered) here\b/i,
    ~r/\bis named here rather than\b/i,
    ~r/\bnothing here should be read as\b/i,
    ~r/\ba gap in this guide\b/i
  ]

  # RULING, 2026-09-03. Three wave-2 fix agents independently flagged the
  # trailing "so none are given here" as self-reference and — correctly —
  # escalated it rather than diverging one file from the other twenty-two.
  # The answer is that it stays, and the reason is worth recording because the
  # question will be asked again.
  #
  # The subject test applies to the MAIN clause. "No source states its opening
  # hours" is about the fact and carries the sentence; the trailing consequence
  # is what makes the refusal legible to a reader, who would otherwise see a
  # bare absence and wonder whether the hours are somewhere else on the page.
  #
  # It is also 676 instances across San Francisco and Rome. A house style
  # applied consistently is worth more than a marginal gain from changing it
  # everywhere, and inconsistency between two cities would be worse than
  # either choice.
  @self_reference_specimens [
    "No source states its opening hours, so none are given here.",
    "The mural stands here, on the Balmy Alley side of the building.",
    "SF Planning records the landmark designation as Article 10 number 72.",
    "No source establishes which business occupies which address, so none is named here."
  ]

  # No ranking claims, from any source, attributed or not. A ranking is
  # identifiable by its comparison class — the thing it ranks against. "The
  # oldest bar in the Mission" ranks; "the first church on the site, in 1776"
  # is a sequence of events and publishes.
  @superlative_patterns [
    ~r/(?<![-\w])(?:only|first|oldest|largest|smallest|finest|grandest|greatest|best|tallest|richest|most\s+\w+)\s+(?:\w+\s+){0,2}(?:in|of|on)\s+(?:the\s+)?(?:city|neighborhood|neighbourhood|San Francisco|California|the Bay Area|the Mission|the district)\b/i,
    ~r/\bone of the (?:most|best|finest|largest|oldest|greatest)\b/i,
    ~r/\b(?:the (?:city|neighborhood|district)'s|San Francisco's|California's)\s+(?:only|oldest|largest|smallest|finest|greatest|best)\b/i,
    ~r/\b[A-Z][a-z]+(?:'s|s')\s+only\b/,
    ~r/\b(?:southern|northern|eastern|western)most\b/i,
    ~r/\bthe one (?:genuinely|thing|source|entry)\b/i,
    ~r/\bmost (?:travellers|travelers|visitors|guidebooks|guides|people)\b/i,
    ~r/\bthe only (?:one|stretch|example|work|surviving)\b/i
  ]

  @superlative_specimens [
    "The Ferry Building opened in 1898.",
    "Mission Dolores is the sixth of the twenty-one Alta California missions.",
    "The cable car climbs a grade of 21 percent.",
    "Last admission is 4.30pm."
  ]

  # No orientation by impression. A sourced measurement publishes; two
  # structures that physically adjoin may be said to adjoin; the side of a
  # named square or street is a usable locator. What is banned is orientation
  # at NEIGHBORHOOD scale, which a reader cannot act on.
  @proximity_patterns [
    # "edge" as well as "end". A wave-1 reviewer found "on the northern edge of
    # the neighbourhood" evading this because the pattern was written around one
    # word, and quoted the arbitration's own principle back at it: the ban is on
    # the practice, not on what the regex happens to catch.
    ~r/\bat the (?:north|south|east|west|northern|southern|eastern|western|far|top|bottom) (?:end|edge) of (?:the )?(?:neighborhood|neighbourhood|district|quarter|city)\b/i,
    ~r/\bon the (?:northern|southern|eastern|western) edge of (?:the )?(?:neighborhood|neighbourhood|district|quarter)\b/i,
    ~r/\ba (?:short|ten-minute|five-minute|brief) walk\b/i,
    ~r/\bjust (?:around the corner|off|beyond)\b/i,
    ~r/\ba stone's throw\b/i,
    ~r/\bsteps (?:from|away)\b/i,
    ~r/\bnot far from\b/i,
    ~r/\bworth the walk\b/i,
    ~r/\bup the hill from\b/i
  ]

  @proximity_specimens [
    "The Conservatory of Flowers stands beside John F. Kennedy Drive.",
    "Coit Tower is at 1 Telegraph Hill Boulevard.",
    "SF Planning gives the distance as 400 feet.",
    "The cottage adjoins the shipyard wall."
  ]

  # ------------------------------------------------------------------
  # The photo policy is not the reader's business
  # ------------------------------------------------------------------
  #
  # Wave 1 published the corpus's own copyright reasoning as prose: "The murals
  # are artworks rather than architecture", "The flag is a designed work and is
  # not an architectural one", "The pylons are sculpture rather than
  # architecture." All four are the page explaining to a traveller WHY it has
  # no photograph — which is a rule about us, not a fact about the place.
  #
  # The distinction is real and worth keeping: "the pylons are steel" is a
  # description and publishes. "The pylons are sculpture RATHER THAN
  # architecture" is 17 USC 120(a) reasoning wearing a description's clothes.
  @photo_policy_patterns [
    ~r/\b(?:artworks?|sculpture|a designed work)s? rather than (?:architecture|an? architectural)/i,
    ~r/\bis not an architectural (?:one|work)\b/i,
    ~r/\barchitectural work under\b/i,
    ~r/\bfreedom of panorama\b/i,
    ~r/\b17 USC\b/i
  ]

  @photo_policy_specimens [
    "The pylons are steel and stand fifteen feet high.",
    "The mural was painted in 1984 by a collective of Mission artists.",
    "The flag flies from a pole at the plaza's centre."
  ]

  # ------------------------------------------------------------------
  # The transit negative
  # ------------------------------------------------------------------
  #
  # Five wave-2 files wrote some form of "No source states a bus route or a
  # rail station for the neighbourhood, so none is given here." It is never
  # true. Muni, Caltrain and SFMTA publish routes for every square foot of this
  # city, and the Presidio's own sources describe its shuttle — its reviewer
  # found the finder had recorded exactly that.
  #
  # This is a FETCH FAILURE WRITTEN AS A FACT ABOUT THE WORLD, which is the
  # most damaging shape in the corpus: it is unfalsifiable-looking, it sits in
  # the one section a reader acts on, and it is false. Saying nothing about
  # transit is fine. Asserting that nobody publishes it is not.
  @transit_negative_patterns [
    ~r/\bno source (?:states|names|gives)\s+(?:a\s+)?(?:bus route|rail station|transit|metro|streetcar)/i,
    ~r/\bno source (?:states|names|gives)[^.]{0,60}(?:bus route|rail station|transit line|shuttle)/i
  ]

  @transit_negative_specimens [
    "The N Judah runs on Judah Street.",
    "No source states its opening hours, so none are given here.",
    "Steer by the addresses.",
    "Caltrain publishes 4th and King as the nearest station."
  ]

  # ------------------------------------------------------------------
  # The designation rule — a CITATION requirement, not a ban
  # ------------------------------------------------------------------
  #
  # A sentence claiming protection status must name the register and carry an
  # identifier. "A designated landmark" does not publish; "San Francisco
  # Landmark No. 72, designated 1975" does, and so does an NRHP reference
  # number. This is the opposite of the Rome rule and the reason is
  # reachability, recorded in san_francisco_roster.json.
  @designation_claim ~r/\b(?:designated|listed|landmark(?:ed)?|registered|nominated)\b/i

  @designation_citation ~r/(?:San Francisco Landmark(?:\s+District)?\s*(?:No\.?|number)?\s*\d+|Article\s*10\b|National Register(?: of Historic Places)?|NRHP|NR reference|reference number\s*\d{6,})/i

  # ------------------------------------------------------------------
  # The photo rule — buildings are free, artworks are not
  # ------------------------------------------------------------------
  #
  # 17 USC 120(a) permits pictorial representation of an ARCHITECTURAL WORK
  # visible from a public place. It says nothing about sculptures, murals or
  # other public artworks, which keep full copyright for life plus seventy
  # years. So a photograph whose framing features one of these needs its
  # artist established; a photograph of a building does not.
  @live_artwork_subjects [
    {"cupids-span", "Claes Oldenburg d. 2022 and Coosje van Bruggen d. 2009"},
    {"cupid's span", "Claes Oldenburg d. 2022 and Coosje van Bruggen d. 2009"},
    {"vaillancourt", "Armand Vaillancourt is living"},
    {"balmy-alley", "Mission murals, many artists living"},
    {"balmy alley", "Mission murals, many artists living"},
    {"clarion-alley", "Mission murals, many artists living"},
    {"clarion alley", "Mission murals, many artists living"},
    {"goldsworthy", "Andy Goldsworthy is living — Spire, Wood Line, Earth Wall"},
    {"spire-presidio", "Andy Goldsworthy is living"}
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

  defp files, do: SeedDataHelpers.seed_files("san_francisco")

  defp decoded_files do
    Enum.map(files(), fn path ->
      {Path.basename(path), path |> File.read!() |> Jason.decode!()}
    end)
  end

  # Every string a reader can see. Slugs and source URLs are excluded — a
  # Commons URL legitimately contains a subject's name. ENTRY NOTES ARE
  # INCLUDED: Rome shipped 153 of them unchecked because this function was
  # written before entries existed and nobody widened it.
  defp prose(doc) do
    guide = doc["guide"] || %{}

    [
      guide["title"],
      guide["intro"],
      guide["sections"] |> List.wrap() |> Enum.flat_map(&[&1["heading"], &1["body"]]),
      guide["faq"] |> List.wrap() |> Enum.flat_map(&[&1["question"], &1["answer"]]),
      (doc["places"] || []) |> Enum.flat_map(&[&1["name"], &1["summary"], &1["history"]]),
      (doc["links"] || []) |> Enum.map(& &1["note"]),
      (doc["entries"] || []) |> Enum.flat_map(&[&1["name"], &1["note"]])
    ]
    |> List.flatten()
    |> Enum.filter(&is_binary/1)
  end

  defp photos(doc) do
    ((doc["guide"] || %{})["photos"] || []) ++
      ((doc["places"] || []) |> Enum.flat_map(&(&1["photos"] || [])))
  end

  defp hit?(patterns, text), do: Enum.any?(patterns, &Regex.match?(&1, text))

  # ------------------------------------------------------------------
  # Self-tests. These run against fixtures rather than the corpus, so they
  # hold from the day this file lands and prove each ban can actually fail.
  # A ban that cannot fail is decoration.
  # ------------------------------------------------------------------

  test "the research-method ban catches leaked provenance, and only there" do
    assert hit?(@method_patterns, "The museum's own site returned HTTP 403.")
    assert hit?(@method_patterns, "The parcel tests wholly inside the Mission.")

    for s <- @method_specimens do
      refute hit?(@method_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the self-reference ban separates the page from the fact" do
    assert hit?(@self_reference_patterns, "The square is not written as a place here.")
    assert hit?(@self_reference_patterns, "This page carries no restaurants.")

    for s <- @self_reference_specimens do
      refute hit?(@self_reference_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the superlative ban catches a ranking, and spares a date" do
    assert hit?(@superlative_patterns, "The oldest bar in the Mission.")
    assert hit?(@superlative_patterns, "It is one of the most important examples of the style.")
    assert hit?(@superlative_patterns, "Maybeck's only surviving rotunda.")

    for s <- @superlative_specimens do
      refute hit?(@superlative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "the proximity ban separates wayfinding from adjacency" do
    assert hit?(@proximity_patterns, "It sits at the north end of the neighborhood.")
    assert hit?(@proximity_patterns, "It is a short walk from the station.")

    for s <- @proximity_specimens do
      refute hit?(@proximity_patterns, s), "rejected an adjacency that must publish: #{s}"
    end
  end

  test "the photo-policy ban keeps copyright reasoning off the page" do
    assert hit?(@photo_policy_patterns, "The murals are artworks rather than architecture.")
    assert hit?(@photo_policy_patterns, "The flag is a designed work and is not an architectural one.")

    for s <- @photo_policy_specimens do
      refute hit?(@photo_policy_patterns, s), "rejected a description that must publish: #{s}"
    end
  end

  test "no committed prose explains the photo policy to the reader" do
    offenders =
      for {file, doc} <- decoded_files(),
          text <- prose(doc),
          hit?(@photo_policy_patterns, text),
          do: {file, String.slice(text, 0, 140)}

    assert offenders == [],
           "prose carries the corpus's own copyright reasoning. Why a page has no photograph " <>
             "is a rule about us, not a fact about the place:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
  end

  test "the transit-negative ban catches a fetch failure dressed as a fact" do
    assert hit?(@transit_negative_patterns,
                "No source states a bus route or a rail station for the neighbourhood.")

    assert hit?(@transit_negative_patterns,
                "No source states the routes or timetable of a shuttle between the districts.")

    for s <- @transit_negative_specimens do
      refute hit?(@transit_negative_patterns, s), "rejected prose that must publish: #{s}"
    end
  end

  test "no committed prose claims transit is unpublished" do
    offenders =
      for {file, doc} <- decoded_files(),
          text <- prose(doc),
          hit?(@transit_negative_patterns, text),
          do: {file, String.slice(text, 0, 140)}

    assert offenders == [],
           "prose asserts that no source publishes transit. Muni, Caltrain and SFMTA publish " <>
             "routes for the whole city; this is a failed fetch written as a fact, in the one " <>
             "section a reader acts on. Say nothing, or find the route:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
  end

  test "a designation claim needs a register and an identifier" do
    # The inversion of Rome's rule. The claim is welcome; the bare claim is not.
    refute designation_ok?("The building is a designated landmark.")
    refute designation_ok?("The house is listed.")

    assert designation_ok?("San Francisco Landmark No. 72, designated in 1975.")
    assert designation_ok?("Listed on the National Register of Historic Places in 1972.")
    assert designation_ok?("Designated under Article 10 of the Planning Code.")

    # A sentence making no designation claim at all is not required to cite one.
    assert designation_ok?("The Conservatory of Flowers opened in 1879.")
  end

  defp designation_ok?(text) do
    not Regex.match?(@designation_claim, text) or Regex.match?(@designation_citation, text)
  end

  test "the artwork blocklist catches a live-copyright subject, and spares a building" do
    assert blocked_artwork(%{"title" => "Cupid's Span on the Embarcadero"})
    assert blocked_artwork(%{"title" => "Balmy Alley murals, Mission District"})

    refute blocked_artwork(%{"title" => "The Ferry Building from Market Street"}),
           "a building is covered by 17 USC 120(a) and must publish"

    refute blocked_artwork(%{"title" => "Coit Tower from Washington Square"}),
           "a building is covered by 17 USC 120(a) and must publish"
  end

  defp blocked_artwork(photo) do
    haystack =
      [photo["title"], photo["description"], photo["src"]]
      |> Enum.filter(&is_binary/1)
      |> Enum.join(" ")
      |> String.downcase()

    Enum.find(@live_artwork_subjects, fn {needle, _} -> String.contains?(haystack, needle) end)
  end

  # ------------------------------------------------------------------
  # Corpus assertions
  # ------------------------------------------------------------------

  test "the roster-equality reference set is the in-scope subset" do
    all = MapSet.new(roster()["zones"], & &1["slug"])
    scoped = in_scope_slugs()

    assert MapSet.size(scoped) > 0, "no san francisco zone is in scope"
    assert MapSet.subset?(scoped, all)

    # The declined candidates are a separate list, so a future wave promoting
    # one has to move it deliberately rather than flipping a flag nobody reads.
    assert is_list(roster()["declined"]), "the roster records no declined candidates"
  end

  for {name, patterns_fun, label} <- [
        {"narrates the research", :method, "research method"},
        {"adjudicates its own coverage", :self_reference, "editorial self-reference"},
        {"states a superlative", :superlative, "a ranking claim"},
        {"orients by impression", :proximity, "orientation no source states"}
      ] do
    @patterns_fun patterns_fun
    @label label
    test "no committed san francisco prose #{name}" do
      patterns =
        case @patterns_fun do
          :method -> @method_patterns
          :self_reference -> @self_reference_patterns
          :superlative -> @superlative_patterns
          :proximity -> @proximity_patterns
        end

      offenders =
        for {file, doc} <- decoded_files(),
            text <- prose(doc),
            hit?(patterns, text),
            do: {file, String.slice(text, 0, 140)}

      assert offenders == [],
             "san francisco prose carries #{@label}:\n" <>
               Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
    end
  end

  # A FAQ is a question and its answer, and a reader sees both. Checking the
  # two strings separately flagged Hayes Valley's "were designated together in
  # 1977" as uncited when its own question reads "Which buildings does San
  # Francisco Landmark No. 84 cover?" — the citation was there, one string
  # away. So the designation check joins each pair; every other ban still
  # reads strings individually, because none of them is answered by context.
  defp designation_texts(doc) do
    guide = doc["guide"] || %{}

    faq_pairs =
      (guide["faq"] || [])
      |> Enum.map(fn f -> "#{f["question"]} #{f["answer"]}" end)

    non_faq =
      [
        guide["title"],
        guide["intro"],
        (guide["sections"] || []) |> Enum.flat_map(&[&1["heading"], &1["body"]]),
        (doc["places"] || []) |> Enum.flat_map(&[&1["name"], &1["summary"], &1["history"]]),
        (doc["links"] || []) |> Enum.map(& &1["note"]),
        (doc["entries"] || []) |> Enum.flat_map(&[&1["name"], &1["note"]])
      ]
      |> List.flatten()
      |> Enum.filter(&is_binary/1)

    non_faq ++ faq_pairs
  end

  test "every designation claim names its register and identifier" do
    offenders =
      for {file, doc} <- decoded_files(),
          text <- designation_texts(doc),
          not designation_ok?(text),
          do: {file, String.slice(text, 0, 140)}

    assert offenders == [],
           "a designation claim publishes without a register and identifier. Unlike Rome, " <>
             "San Francisco's registers are reachable, so the claim is welcome — but it must " <>
             "cite an Article 10 landmark number or an NRHP reference:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t} -> "  #{f}: #{t}" end)
  end

  test "no photograph features a live-copyright artwork" do
    offenders =
      for {file, doc} <- decoded_files(),
          photo <- photos(doc),
          hit = blocked_artwork(photo),
          hit != nil do
        {needle, why} = hit
        {file, needle, why}
      end

    assert offenders == [],
           "a photograph features a public artwork still in copyright. 17 USC 120(a) covers " <>
             "BUILDINGS and not sculptures or murals, so a public vantage is no defence here:\n" <>
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
    # Read off the schema rather than copied. Rome shipped three places with an
    # invented "church" kind because the brief listed kinds that do not exist,
    # and the changeset rejected them at seed time — surfacing as two
    # unrelated-looking failures in other suites rather than here.
    valid = MapSet.new(Ethos.Places.Place.kinds())

    offenders =
      for {file, doc} <- decoded_files(),
          place <- doc["places"] || [],
          not MapSet.member?(valid, place["kind"]),
          do: {file, place["slug"], place["kind"]}

    assert offenders == [],
           "places carry a kind the schema will reject at seed time. Valid: " <>
             inspect(Enum.sort(valid)) <>
             "\n" <> Enum.map_join(offenders, "\n", fn {f, s, k} -> "  #{f}: #{s} — #{k}" end)
  end

  test "every guide carries entries that resolve to its own places" do
    # Rome shipped twelve rioni to production with "entries": [] and 450 places
    # unreachable from their own guides. The place pages resolved, so an
    # HTTP-and-image check passed completely.
    valid_kinds = MapSet.new(~w(food tour walk sight stay tip))

    offenders =
      for {file, doc} <- decoded_files() do
        entries = doc["entries"] || []
        slugs = MapSet.new(doc["places"] || [], & &1["slug"])

        cond do
          entries == [] ->
            {file, "entries is empty — every place would be unreachable from the guide"}

          Enum.any?(entries, &(not MapSet.member?(slugs, &1["place_slug"]))) ->
            {file, "an entry place_slug does not resolve, which aborts the seed run"}

          Enum.any?(entries, &(not MapSet.member?(valid_kinds, &1["kind"]))) ->
            {file, "an entry kind is not one of food/tour/walk/sight/stay/tip"}

          true ->
            nil
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [],
           Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "every committed file is valid, globally unique, and routes correctly" do
    files = files()
    assert files != [], "no san francisco seed file has been committed yet"

    for path <- files do
      doc = path |> File.read!() |> Jason.decode!()
      name = Path.basename(path)

      assert is_map(doc["guide"]), "#{name} has no guide object"

      assert doc["guide"]["state"] == "California",
             "#{name} does not carry state \"California\", so it will not route under " <>
               "/destinations/california/san-francisco"

      assert doc["guide"]["county"] == "San Francisco",
             "#{name} does not carry county \"San Francisco\""
    end

    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end

  test "no san francisco destination derives a slug already used elsewhere" do
    # derive_destination_slug/1 takes only the FIRST comma-segment and discards
    # the state, so "Chinatown, California" and "Chinatown, New York" would
    # co-list on one page. Three of the twenty-three collide with Manhattan and
    # the roster resolves each by changing the destination STRING.
    #
    # Co-listing is sometimes WANTED — Flushing and Citi Field share one
    # destination page deliberately — so this compares against seed files only,
    # never against code seeds.
    ours =
      for {name, doc} <- decoded_files(),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(doc["guide"]["destination"]), name}

    others =
      for path <- SeedDataHelpers.all_seed_files(),
          not String.contains?(path, "/san_francisco/"),
          doc = path |> File.read!() |> Jason.decode!(),
          dest = get_in(doc, ["guide", "destination"]),
          is_binary(dest),
          into: %{},
          do: {Ethos.Guides.Guide.derive_destination_slug(dest), Path.basename(path)}

    collisions =
      for {slug, name} <- ours, other = others[slug], do: {name, slug, other}

    assert collisions == [],
           "a san francisco destination derives a slug another seed file already derives, " <>
             "which co-lists two cities' neighborhoods on one page. Resolve by changing the " <>
             "destination string, never by deleting this assertion: #{inspect(collisions)}"
  end

  # Tag removed 2026-09-03 by wave 2, which landed the last eleven zones and
  # brought the corpus to all twenty-three: twenty neighborhoods plus the
  # Presidio, Golden Gate Park and Ocean Beach. Roster equality now holds in
  # both directions and this runs on every suite.
  test "the shipped corpus matches the in-scope roster exactly" do
    expected = in_scope_slugs()
    shipped = files() |> Enum.map(&Path.rootname(Path.basename(&1))) |> MapSet.new()

    assert MapSet.size(expected) > 0, "no san francisco zone is in scope"

    assert MapSet.equal?(shipped, expected),
           "corpus does not match the in-scope roster.\n" <>
             "  rostered but not shipped: " <>
             inspect(expected |> MapSet.difference(shipped) |> Enum.sort()) <>
             "\n  shipped but not rostered: " <>
             inspect(shipped |> MapSet.difference(expected) |> Enum.sort())
  end

  test "a tier matches the file it labels" do
    # The gate shipped without this and wave 1 immediately produced two files
    # marked "town-page" carrying 41 and 26 places. A town-page is the SHORT
    # form — under six places, a 90-word intro floor and two outbound links —
    # and labelling a 41-place guide as one misdescribes it to every later
    # assertion that keys off tier.
    offenders =
      for {file, doc} <- decoded_files() do
        guide = doc["guide"] || %{}
        places = length(doc["places"] || [])
        intro_words = guide["intro"] |> to_string() |> String.split(~r/\s+/, trim: true) |> length()
        headings = Enum.map(guide["sections"] || [], & &1["heading"])
        faq = length(guide["faq"] || [])
        links = length(doc["links"] || [])

        cond do
          guide["tier"] == "town-page" and places >= 6 ->
            {file, "tier town-page carries #{places} places; the form is for fewer than six"}

          guide["tier"] == "town-page" and intro_words < 90 ->
            {file, "town-page intro is #{intro_words} words, floor is 90"}

          guide["tier"] == "town-page" and links < 2 ->
            {file, "town-page has #{links} outbound links, floor is 2"}

          guide["tier"] == "town-page" ->
            nil

          guide["tier"] == "guide" and places < 4 ->
            {file, "tier guide carries #{places} places; the form needs at least four"}

          guide["tier"] == "guide" and (intro_words < 100 or intro_words > 160) ->
            {file, "guide intro is #{intro_words} words, want 100-160"}

          guide["tier"] == "guide" and (faq < 4 or faq > 6) ->
            {file, "guide has #{faq} FAQ entries, want 4-6"}

          guide["tier"] == "guide" and "Getting there" not in headings ->
            {file, "guide has no section headed exactly Getting there: #{inspect(headings)}"}

          guide["tier"] == "guide" ->
            nil

          true ->
            {file, "unknown tier #{inspect(guide["tier"])}"}
        end
      end
      |> Enum.reject(&is_nil/1)

    assert offenders == [],
           "tier does not match the file:\n" <>
             Enum.map_join(offenders, "\n", fn {f, r} -> "  #{f}: #{r}" end)
  end

  test "a guide title fits the column the schema gives it" do
    # Ethos.Guides.Guide validates title at 120 characters. The gate shipped
    # without this and wave 1 produced one title of 121, which surfaced as an
    # Ecto.InvalidChangesetError in the release and destination suites rather
    # than here — two unrelated-looking failures for a defect that belongs to
    # this file.
    #
    # 120 is duplicated from the schema rather than read, because
    # validate_length/3 exposes no accessor. If the schema loosens, this fails
    # loudly and gets updated, which is the safe direction.
    offenders =
      for {file, doc} <- decoded_files(),
          title = get_in(doc, ["guide", "title"]),
          is_binary(title),
          String.length(title) > 120,
          do: {file, String.length(title)}

    assert offenders == [],
           "a guide title is longer than the 120 characters the schema allows, so the " <>
             "changeset rejects it at seed time:\n" <>
             Enum.map_join(offenders, "\n", fn {f, n} -> "  #{f}: #{n} characters" end)
  end

  test "every link carries a valid kind and a note the column accepts" do
    # `kind` was missing from the shape brief this wave's authors were given,
    # so one file shipped three links with none and the changeset rejected them
    # at seed time — surfacing as an ArgumentError about nil comparison in the
    # release suite rather than as a finding here.
    #
    # The 160-character note limit is a database constraint: a longer note
    # aborts the whole run, and seeding is not transactional, so earlier files
    # stay published while later ones do not.
    #
    # Dangling TARGETS are deliberately not asserted here. This file cannot
    # cheaply know which code-seed guides exist — oracle-park-guide is defined
    # inline in lib/ethos/seeds/ rather than as a module attribute — and the
    # release test already catches them by actually seeding, which is the
    # honest check.
    valid = MapSet.new(Ethos.Links.Link.kinds())

    offenders =
      for {file, doc} <- decoded_files(),
          link <- doc["links"] || [],
          reason = link_fault(link, valid),
          reason != nil,
          do: {file, link["target"], reason}

    assert offenders == [],
           "links will be rejected at seed time:\n" <>
             Enum.map_join(offenders, "\n", fn {f, t, r} -> "  #{f}: #{t} — #{r}" end)
  end

  defp link_fault(link, valid) do
    cond do
      not MapSet.member?(valid, link["kind"]) ->
        "kind #{inspect(link["kind"])} is not one of #{inspect(Enum.sort(valid))}"

      String.length(link["note"] || "") > 160 ->
        "note is #{String.length(link["note"])} characters, limit is 160"

      true ->
        nil
    end
  end

  test "the seed directory the gate reads is the one the corpus lives in" do
    assert File.dir?(@seed_dir), "priv/seed_data/san_francisco does not exist"
  end
end
