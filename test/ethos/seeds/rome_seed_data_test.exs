defmodule Ethos.Seeds.RomeSeedDataTest do
  @moduledoc """
  The gate every Rome research wave must pass.

  Written before the corpus it guards, exactly as the Bronx and Queens gates
  were, so it lands excluded: over a `priv/seed_data/rome/` holding only
  `.gitkeep`, roster equality and every non-vacuity floor fail by construction,
  and a gate that fails because there is nothing to check yet is noise rather
  than information. See `test/test_helper.exs` for the removal stages.

  ## Why this gate is not a copy of the Queens one

  Three findings from the 2026-09-02 scoping wave make Rome structurally
  different from a New York borough, and each becomes an assertion here.

  **There is no Rome equivalent of an LPC designation report.** The New York
  waves could cite a legal act with a number — "LP-1234, designated 1974" —
  for any landmark. Rome's only candidates for that role, Vincoli in Rete and
  the Catalogo generale dei Beni Culturali, are unreachable from this network,
  and the scoping agent could not confirm they carry per-property records even
  in principle. So no reachable source states whether a Roman building is
  `vincolato`. The corpus therefore may not say one is. This is the same shape
  as the DOHMH rule the New York waves ran under — a category of claim banned
  because its provenance cannot be established, not because it is false.

  **Italy has no freedom of panorama, and a Commons licence tag does not tell
  you whether a photograph is publishable.** The photographer's licence and
  the subject's copyright are separate questions, and Commons washes its hands
  of the second: its own guideline says non-copyright restrictions "are not
  grounds for deletion" and are "up to the reusers". The scoping agent verified
  the consequence rather than assuming it — it found CC-licensed Commons
  photographs of MAXXI and Meier's Ara Pacis carrying no restriction tag at
  all, despite both architects' copyrights being live. Under the Bronx and
  Queens rule, which accepted any CC-BY-SA or CC0 file, both would have
  shipped, and both would have been ordinary copyright infringements. So the
  absence of a tag carries no information and cannot be used as clearance;
  this gate holds a blocklist of subjects instead.

  **Vatican City is a sovereign state and cannot be a rione.** It gets a
  standalone page claimed by no rione, the way Forest Park and Alley Pond Park
  were ruled to belong to no Queens neighborhood. The Lateran Treaty
  extraterritorial properties are a third legal tier rather than a border —
  Art. 15 grants the immunities of diplomatic headquarters on Italian soil,
  and visitors follow Italian law — so they publish under the unit they
  physically stand in. San Paolo fuori le Mura forces the point: it is
  extraterritorial and sits in Q.X Ostiense, two kilometres outside the walls.

  ## What this gate deliberately does not assert

  It does not require a photograph per page. Rome's supply of publishable
  images is large but the four-gate rule rejects a whole class of modern
  subject, and a page that honestly has no clearable picture is a better
  outcome than one that ships a live-copyright photograph to satisfy a floor.
  """
  use Ethos.DataCase, async: false

  # @moduletag :pending_rome removed 2026-09-02 by wave 1, which landed the
  # first four seed files — Campitelli, Monti, Trastevere and Borgo, 220 places
  # between them. Everything in this module now runs except the roster-equality
  # test, which keeps its own `@tag :pending_rome` until all 31 zones ship.

  alias Ethos.SeedDataHelpers

  @roster_path Path.expand("../../../priv/seed_data/rome_roster.json", __DIR__)
  @seed_dir Path.expand("../../../priv/seed_data/rome", __DIR__)

  # ------------------------------------------------------------------
  # The designation ban
  # ------------------------------------------------------------------
  #
  # Each pattern names a way of asserting that a building carries a legal
  # protection status. None of them is checkable against a source we can
  # reach, so none may appear in Rome prose. The Italian terms are here
  # because a research agent reading Italian sources is exactly who would
  # reach for them.
  #
  # These are bans on the CLAIM, not on the subject. A page may say the
  # Colosseum is a Roman amphitheatre completed under Titus; it may not say
  # the Colosseum is a protected monument, because nothing we can fetch
  # says so.
  @designation_patterns [
    ~r/\bvincolat[oaie]\b/i,
    ~r/\bvincolo\s+(?:monumentale|architettonico|storico)/i,
    ~r/\bnotified\s+as\s+(?:a\s+)?(?:monument|cultural\s+propert)/i,
    ~r/\b(?:designated|listed|scheduled|declared)\s+(?:as\s+)?(?:a\s+)?(?:national\s+)?(?:monument|landmark|heritage\s+(?:site|asset)|cultural\s+propert)/i,
    ~r/\bunder\s+(?:state|ministerial|government)\s+protection\b/i,
    ~r/\bprotected\s+(?:monument|building|status)\b/i,
    ~r/\bheritage-?listed\b/i,
    # `vincolato` alone is already caught by the first pattern; this one
    # carries only `tutelato`, which is not.
    ~r/\bbene\s+culturale\s+tutelato\b/i,
    ~r/\bdichiarazione\s+di\s+(?:interesse\s+culturale|notevole\s+interesse)/i
  ]

  # ------------------------------------------------------------------
  # The superlative ban
  # ------------------------------------------------------------------
  #
  # All three wave arbitrators reached this independently and each stated it
  # more strictly than its own verifiers had: no priority or ranking claim
  # publishes, FROM ANY SOURCE, attributed or not. Wave 1 put it plainest —
  # attribution does not save a priority claim, because attributing "the oldest
  # fountain in the rione" to Roma Capitale still asserts a ranking the corpus
  # cannot check against any other candidate.
  #
  # That is a stricter line than the New York corpus runs, and it is deliberate.
  # New York had LPC designation reports to check a superlative against. Rome
  # has no reachable per-property register at all, so a ranking claim here is
  # unfalsifiable in a way it was not there.
  #
  # Held mechanically for the same reason as the method ban: three rounds of
  # agents reading prose found most of these and never all of them.
  # A first attempt at these banned the WORDS, and flagged "the first church was
  # built in 1150" and "last admission 18.30" — a date and an opening time. The
  # ban is on the CLAIM, and a ranking claim is identifiable by its comparison
  # class: the thing it ranks against. "The oldest fountain IN THE RIONE" ranks;
  # "the first church on the site, in 1150" is a sequence of events. So every
  # pattern below requires either an explicit comparison class, a possessive
  # that supplies one, or a word that can only be a ranking.
  @superlative_patterns [
    # "the largest square of the rione", "the oldest church in Rome".
    #
    # The lookbehind rejects a HYPHENATED ordinal rather than a bare `\b`: a
    # hyphen is a non-word character, so `\bfirst` matched inside
    # "the twenty-first of Rome's rioni by toponymic code" — a position in an
    # official series, which is the carve-out this ban exists not to touch.
    ~r/(?<![-\w])(?:only|first|oldest|largest|smallest|finest|grandest|greatest|best|tallest|richest|most\s+\w+)\s+(?:\w+\s+){0,2}(?:in|of|on)\s+(?:the\s+)?(?:rione|Rome|Italy|the city|the street|the quarter|that street|this rione|this page)\b/i,
    # "one of the most important examples of the Baroque"
    ~r/\bone of the (?:most|best|finest|largest|oldest|greatest|richest)\b/i,
    # "the rione's only true square", "Rome's finest".
    #
    # "first" is deliberately NOT in this alternation. It caught "Italy's first
    # king" — Vittorio Emanuele II, a position in a succession and precisely the
    # sequence carve-out this ban is not meant to touch. A genuine "Rome's first
    # X" ranking is still caught by the comparison-class pattern above, which
    # requires the "in Rome" / "of the rione" tail.
    ~r/\b(?:the (?:rione|city|quarter|street|guide)'s|Rome's|Italy's|Europe's)\s+(?:only|oldest|largest|smallest|finest|grandest|greatest|best|one\b)/i,
    # "Caravaggio's only wall painting", "Palladio's only Roman work"
    ~r/\b[A-Z][a-z]+(?:'s|s')\s+only\b/,
    # geographic rankings
    ~r/\b(?:southern|northern|eastern|western)most\b/i,
    # "the one genuinely enterable museum", "the one building of X to survive"
    # "building" and "place" are NOT in this alternation. "the Oratory, the
    # Biblioteca Vallicelliana and the Archivio share the one building" is a
    # count of buildings, not a claim about which is best.
    ~r/\bthe one (?:genuinely|thing|source|entry)\b/i,
    # claims about what visitors or guidebooks generally do
    ~r/\bmost (?:travellers|visitors|guidebooks|guides|people)\b/i,
    ~r/\bthe (?:single )?most likely\b/i,
    # "the only one of the twenty-two", "the only stretch of that line"
    ~r/\bthe only (?:one|stretch|example|work|surviving)\b/i,
    # bare evaluative superlatives with no possible source
    ~r/\bthe (?:easiest|cleanest|simplest|best) \w+ (?:in|of|on|to)\b/i
  ]

  # Formulations that survive the ban and must keep publishing. A count, a
  # date, and an ordinal that names a position in an official series are all
  # facts rather than rankings.
  @superlative_specimens [
    "Roma Capitale gives the rione 0,2 km2 and 2.191 residents.",
    "Parione is the sixth of Rome's rioni by toponymic code.",
    "The church was begun in 1634 and finished in 1664.",
    "The Sovrintendenza Capitolina records a restoration carried out in 2025."
  ]

  # ------------------------------------------------------------------
  # The research-method ban
  # ------------------------------------------------------------------
  #
  # Added after three rounds of fix agents kept finding the same category by
  # eye and never converging. Every wave leaked how the research was DONE into
  # what a reader sees: which host returned a 403, which domain did not
  # resolve, how many OpenStreetMap vertices fell inside a boundary, that "every
  # independent check made for this series" agreed.
  #
  # None of it is false. All of it is addressed to the wrong audience — it is
  # the provenance argument, not the fact the argument supports, and the
  # corpus's convention is that the argument lives in docs/rome/ and the fact
  # lives on the page. A reader who wants to know why a page gives no opening
  # hours is served by "no source states them"; they are not served by the
  # status code.
  #
  # This is a MECHANICAL rule, which is why it belongs here rather than in a
  # reviewer's instructions. An agent reading prose finds most of them; a regex
  # finds all of them, and finds them again next wave.
  @method_patterns [
    ~r/\bcould not be (?:reached|re-?read|certified|confirmed)\b/i,
    ~r/\b(?:did not|does not|failed to) (?:resolve|answer)\b/i,
    ~r/\bHTTP\s*\d{3}\b/i,
    ~r/\bself-signed certificate\b/i,
    ~r/\breset the connection\b/i,
    ~r/\bfootprint (?:test|score)s?\b/i,
    ~r/\btests? (?:wholly|cleanly|inside|into)\b/i,
    ~r/\bno vertex\b|\bvertices\b/i,
    # The negative lookahead spares "identified in 2001, in research for the
    # Clement XI exhibition" — somebody else's research, reported as a fact
    # about the object. Ours is what this ban is about.
    ~r/\b(?:during|for|in) (?:this |the )?research\b(?!\s+for\b)/i,
    ~r/\bthis research\b/i,
    ~r/\bindependent (?:checks?|research waves?|geometric methods?|geocoding methods?)\b/i,
    ~r/\b(?:was|were) probed\b/i,
    ~r/\bthe network this\b/i,
    ~r/\bre-?fetched on\b/i,
    ~r/\bresearch software\b/i,
    ~r/\bno source we can reach\b/i,
    # Added after the first sweep. The agents doing the rewriting reported these
    # from inside their own files — each is the same leak in a phrasing the
    # first pattern set walked past. Recording that here because it is the
    # argument for a mechanical gate in miniature: a regex that misses a case
    # misses it identically every time, and is fixed once.
    ~r/\bboundary (?:research|geometry)\b/i,
    ~r/\breturn(?:s|ed) (?:an?\s+)?(?:error|\d{3})\b/i,
    ~r/\bwhen this entry was written\b/i,
    ~r/\bfootprint (?:lies|falls|is)\b/i,
    ~r/\btests? to (?:Trevi|Colonna|Pigna|Monti|Campitelli|Borgo|Prati)\b/i,
    ~r/\brests? its location on\b/i,
    ~r/\b(?:was|were) reachable\b/i,
    ~r/\bnot obtainable\b/i,
    ~r/\breturned nothing usable\b/i,
    ~r/\bfrom a source that could be reached\b/i,
    ~r/\bpoint testing\b/i,
    ~r/\btested \w+ points\b/i,
    # Added after wave 4. The nine new files leaked in a family the earlier
    # patterns walked past entirely: not a failed fetch, but the SOURCING RULE
    # itself recited to the reader — "no institutional page was obtained for
    # this guide", "nothing further about how long the business has traded is
    # published here". The rule is correct and it is why the fact is absent;
    # the reader wants the absence, not the policy behind it.
    ~r/\b(?:was|were) obtained for (?:this|the) (?:guide|record|entry)\b/i,
    ~r/\bis published here\b/i,
    ~r/\b(?:available|consulted|sourced) here\b/i,
    ~r/\bfor this guide\b/i,
    ~r/\bthis (?:guide|record|entry) (?:can|could) source\b/i,
    # Reported by the sweep agents from inside their own files, as the same
    # family in phrasings these patterns walked past: "no other source for it
    # was reached", "all this guide establishes".
    #
    # Note what is NOT banned. "This guide does not say the rione lies inside
    # the property, because the record does not" is a refusal grounded in the
    # SOURCE and it publishes — it is one of the specimens below. What is
    # banned is a sentence grounded in OUR FETCHING.
    ~r/\b(?:was|were) reached\b/i,
    ~r/\ball this guide establishes\b/i,
    ~r/\bthis guide (?:establishes|obtained|fetched|reached)\b/i
  ]

  # ------------------------------------------------------------------
  # The vague-proximity ban
  # ------------------------------------------------------------------
  #
  # Carried from the New York corpus, where it was enforced by reviewers, and
  # moved here for the reason the other three moved: three waves of reviewers
  # found most of these and never all of them.
  #
  # The distinction that matters, and the one an earlier draft got wrong: two
  # buildings that PHYSICALLY ADJOIN may be described as adjoining. "The
  # baptistery beside the basilica" is architectural fact — the Lateran
  # baptistery touches it. What is banned is orientation a reader cannot act
  # on and no source states: "at the north end of the rione", "the top of the
  # hill above the square", "a visitor would take them for one block".
  @proximity_patterns [
    # Requires a ZONE as the object. Without it this caught "the Capitolium at
    # the north end" of a forum and "the bimah at the far end" of a prayer
    # hall — positions inside a single structure, which is architectural
    # description and exactly what a reader wants.
    ~r/\bat the (?:north|south|east|west|northern|southern|eastern|western|far|top|bottom) end of (?:the )?(?:rione|quartiere|zone|town|city)\b/i,
    ~r/\bat the (?:northern|southern|eastern|western|far) edge\b/i,
    # "on the <direction> side of X" is NOT banned, and an earlier draft that
    # banned it was wrong. Sant'Agnese really is on the west side of Piazza
    # Navona and Santa Maria del Popolo on the north side of its square; both
    # are specific, checkable, and how every source describes them. That is an
    # address in all but form.
    #
    # The scale is what separates orientation from wayfinding. A square has
    # distinguishable sides. A RIONE does not have a usable "north end" — it is
    # an impression a reader cannot act on and no source states — which is why
    # the patterns here are all rione-scale or distance-based.
    ~r/\babove the square\b|\bup the hill from\b/i,
    ~r/\ba (?:short|ten-minute|five-minute|brief) walk\b/i,
    ~r/\bjust (?:around the corner|off|beyond)\b/i,
    ~r/\ba stone's throw\b/i,
    ~r/\bsteps (?:from|away)\b/i,
    ~r/\bwould take (?:it|them) for\b/i,
    ~r/\bnot far from\b/i,
    # Flagged by a sweep agent: an explicitly banned shape that no pattern
    # caught, because the ban had been written around distance and direction
    # rather than around the invitation.
    ~r/\bworth the walk\b/i
  ]

  # Adjacency that must keep publishing: a physical relationship between two
  # structures, which is description rather than wayfinding.
  @proximity_specimens [
    "The baptistery beside the basilica was built in the fourth century.",
    "A small circular building standing in a cloister attached to the church.",
    "Via Scossacavalli separates it from Palazzo dei Penitenzieri.",
    "The Sovrintendenza gives the distance as 300 metres."
  ]

  # ------------------------------------------------------------------
  # The self-reference ban
  # ------------------------------------------------------------------
  #
  # A sibling of the method ban and, by volume, worse. Where that one leaked
  # HOW THE RESEARCH WAS DONE, this leaks HOW THE CORPUS ADJUDICATED — the page
  # explaining to a traveller which rione won an ownership argument, what it has
  # decided not to carry, and which of its sibling pages holds the thing you
  # were looking for:
  #
  #   "all stand on it and are written here"
  #   "the square is not written as a place by either rione"
  #   "belongs to Castro Pretorio and is written there"
  #   "This page cannot tell you. No restaurant is written here, and the
  #    absence is a gap in this guide"
  #   "an honest guide to a residential quartiere rather than a complete
  #    portrait of it"
  #
  # Wave 5's reviewers found fifteen in one file and a whole section of it in
  # another. All of it is true, and none of it is addressed to the reader: a
  # page with no restaurants simply does not list restaurants. It does not
  # announce that it has none, and it certainly does not explain why.
  #
  # The distinction from the permitted refusal is the SUBJECT. "No source states
  # its opening hours, so none are given here" is about the FACT and publishes.
  # "It is not written here" is about the PAGE and does not.
  @self_reference_patterns [
    ~r/\b(?:is|are|was|were)\s+(?:not\s+)?written\s+(?:here|there|on this page|as a place|in\b)/i,
    ~r/\bwritten (?:under|by) (?:the\s+)?(?:rione|quartiere|[A-Z])/,
    ~r/\bon this page\b/i,
    ~r/\bthis page (?:carries|holds|cannot|does not|gives|says|stops|publishes)\b/i,
    ~r/\bthis guide (?:carries|holds|writes|does not pretend|gives none)\b/i,
    ~r/\bbelongs? to [A-Z][\w']+(?:'s)? (?:page|guide)\b/,
    ~r/\bin that (?:rione|quartiere)'s guide\b/i,
    ~r/\ba gap in this guide\b/i,
    ~r/\b(?:is|are) (?:recorded|reported|gathered|named) here\b/i,
    ~r/\bnothing is claimed for (?:them|it) here\b/i,
    ~r/\bneither (?:guide|rione) writes\b/i,
    ~r/\brather than a complete portrait\b/i,
    ~r/\bis a separate record\b/i,
    # Reported by the sweep agents from inside their own files as the same
    # defect in a phrasing the pattern set walked past. "This record claims
    # nothing on the right bank" is the page describing the limits of its own
    # assertion, which is exactly what this ban is for.
    ~r/\bthis record (?:claims|carries|states|holds)\b/i,
    ~r/\bnothing here should be read as\b/i,
    ~r/\b(?:deliberately )?absent from this page\b/i
  ]

  # The permitted refusal and the ordinary uses of "here" that must keep
  # publishing. Every one of these is about a fact or a place; none is about
  # the page.
  @self_reference_specimens [
    "No source states its opening hours, so none are given here.",
    "No admission price is stated.",
    "The church stands here, at the corner of via Merulana.",
    "Roma Capitale records a restoration carried out in 2025."
  ]

  # Prose that mentions sources or absence of them WITHOUT narrating the
  # fetch. Each must keep publishing: refusing to state something, and saying
  # why in the reader's terms, is a thing this corpus does deliberately.
  @method_specimens [
    "No source states its opening hours, so none are given here.",
    "Roma Capitale's tourism service and it.wikipedia disagree about its date.",
    "This guide does not say the rione lies inside the property, because the record does not.",
    "The Sovrintendenza Capitolina records a restoration carried out in 2025."
  ]

  # Sentences that read like a designation claim but are not, and must keep
  # publishing. Each is a real formulation a Rome page would want.
  @designation_specimens [
    "The Historic Centre of Rome was inscribed on the UNESCO World Heritage List in 1980.",
    "Roma Capitale lists the rione under toponymic code 110 in its Annuario statistico.",
    "The basilica is one of the properties the Lateran Treaty places under the immunities granted to diplomatic headquarters."
  ]

  # ------------------------------------------------------------------
  # Photo gate 2: subjects whose architect's copyright is live
  # ------------------------------------------------------------------
  #
  # Italy has no freedom of panorama, so "shot from a public street" is not a
  # defence. A photograph whose framing features any of these is an infringing
  # derivative work regardless of what licence the photographer applied.
  # Each entry carries the fact that dates it.
  @live_copyright_subjects [
    {"maxxi", "Zaha Hadid died 2016; protected to 2087"},
    {"ara-pacis-museum", "Richard Meier is living"},
    {"ara pacis museum", "Richard Meier is living"},
    {"auditorium-parco-della-musica", "Renzo Piano is living"},
    {"auditorium parco della musica", "Renzo Piano is living"},
    {"palazzo-della-civilta", "co-architect Giovanni Guerrini died 1972; blocked until 2043"},
    {"palazzo della civilta", "co-architect Giovanni Guerrini died 1972; blocked until 2043"},
    {"square colosseum", "the Palazzo della Civilta Italiana under its nickname"}
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

  defp roster do
    @roster_path |> File.read!() |> Jason.decode!()
  end

  defp roster_rows, do: roster()["zones"]

  defp in_scope_slugs do
    roster_rows()
    |> Enum.filter(& &1["in_scope"])
    |> MapSet.new(& &1["slug"])
  end

  defp files, do: SeedDataHelpers.seed_files("rome")

  defp decoded_files do
    Enum.map(files(), fn path ->
      {Path.basename(path), path |> File.read!() |> Jason.decode!()}
    end)
  end

  # Every string a reader can see, from one file. Slugs and source URLs are
  # excluded: a Commons URL legitimately contains a subject's name, and
  # banning it there would make the file unciteable.
  defp prose(doc) do
    guide = doc["guide"] || %{}

    guide_text = [
      guide["title"],
      guide["intro"],
      guide["sections"] |> List.wrap() |> Enum.flat_map(&[&1["heading"], &1["body"]]),
      guide["faq"] |> List.wrap() |> Enum.flat_map(&[&1["question"], &1["answer"]])
    ]

    place_text =
      (doc["places"] || [])
      |> Enum.flat_map(&[&1["name"], &1["summary"], &1["history"]])

    link_text = (doc["links"] || []) |> Enum.map(& &1["note"])

    # Entry notes were absent from this list until they existed, and then went
    # on being absent for a full suite run after 153 of them landed — the bans
    # all passed because nothing was reading the newest reader-facing text in
    # the corpus. An entry note sits on the guide page beside the place's name,
    # so it is exactly as public as the intro and is held to the same rules.
    entry_text = (doc["entries"] || []) |> Enum.flat_map(&[&1["name"], &1["note"]])

    (guide_text ++ place_text ++ link_text ++ entry_text)
    |> List.flatten()
    |> Enum.filter(&is_binary/1)
  end

  defp photos(doc) do
    guide_photos = (doc["guide"] || %{})["photos"] || []
    place_photos = (doc["places"] || []) |> Enum.flat_map(&(&1["photos"] || []))
    guide_photos ++ place_photos
  end

  # ------------------------------------------------------------------
  # Self-tests. These run against fixtures, not the corpus, so they hold
  # from the day this file lands and prove each ban can actually fail.
  # A ban that cannot fail is decoration.
  # ------------------------------------------------------------------

  defp designation_hit?(text) do
    Enum.any?(@designation_patterns, &Regex.match?(&1, text))
  end

  test "the designation ban catches a protection claim, and only there" do
    assert designation_hit?("The palazzo has been vincolato since the 1930s."),
           "the Italian term for a protected building slipped through"

    assert designation_hit?("The church was designated a national monument."),
           "the English designation formula slipped through"

    assert designation_hit?("The facade is heritage-listed."),
           "the hyphenated form slipped through"

    for specimen <- @designation_specimens do
      refute designation_hit?(specimen),
             "the designation ban rejected a sentence that must publish: #{specimen}"
    end
  end

  test "each designation pattern is individually load-bearing" do
    # A pattern that never fires alone is either dead or shadowed by another,
    # and either way it misrepresents what this gate checks. Queens caught two
    # such patterns this way.
    for {pattern, index} <- Enum.with_index(@designation_patterns) do
      others = List.delete_at(@designation_patterns, index)

      sample =
        Enum.find(
          [
            "The palazzo is vincolato.",
            "It carries a vincolo monumentale.",
            "The site was notified as a monument in 1912.",
            "The theatre was designated a national monument.",
            "The ruins are under state protection.",
            "It is a protected monument.",
            "The villa is heritage-listed.",
            "It is a bene culturale tutelato.",
            "A dichiarazione di interesse culturale followed."
          ],
          fn s -> Regex.match?(pattern, s) end
        )

      assert sample,
             "designation pattern #{index} matches none of this test's samples — " <>
               "either the pattern is wrong or the sample list needs the case it guards"

      refute Enum.any?(others, &Regex.match?(&1, sample)),
             "designation pattern #{index} is shadowed: another pattern already " <>
               "catches #{inspect(sample)}, so this one carries no weight"
    end
  end

  test "the live-copyright blocklist catches a banned subject" do
    photo = %{
      "title" => "MAXXI museum, Rome",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:MAXXI.jpg"
    }

    assert blocked_subject(photo),
           "a photograph titled for MAXXI passed the live-copyright gate — " <>
             "this is the exact file the scoping wave found untagged on Commons"

    clear = %{
      "title" => "The Colosseum from the Via Sacra",
      "license" => "CC BY-SA 4.0",
      "source_url" => "https://commons.wikimedia.org/wiki/File:Colosseo_2020.jpg"
    }

    refute blocked_subject(clear),
           "the live-copyright gate rejected a first-century monument"
  end

  defp blocked_subject(photo) do
    haystack =
      [photo["title"], photo["description"], photo["src"], photo["thumb"]]
      |> Enum.filter(&is_binary/1)
      |> Enum.join(" ")
      |> String.downcase()

    Enum.find(@live_copyright_subjects, fn {needle, _why} ->
      String.contains?(haystack, needle)
    end)
  end

  # ------------------------------------------------------------------
  # Corpus assertions
  # ------------------------------------------------------------------

  test "the roster-equality reference set is the in-scope subset, not the whole roster" do
    all = MapSet.new(roster_rows(), & &1["slug"])
    scoped = in_scope_slugs()

    assert MapSet.size(scoped) > 0, "no rome zone is in scope"

    assert MapSet.subset?(scoped, all),
           "in_scope_slugs/0 returned slugs the roster does not carry: " <>
             inspect(scoped |> MapSet.difference(all) |> Enum.sort())
  end

  defp superlative_hit?(text), do: Enum.any?(@superlative_patterns, &Regex.match?(&1, text))
  defp method_hit?(text), do: Enum.any?(@method_patterns, &Regex.match?(&1, text))

  test "the superlative ban catches a ranking claim, and only there" do
    assert superlative_hit?("The largest square of the rione."),
           "a bare ranking slipped through"

    assert superlative_hit?("It is one of the most important examples of the Baroque in Rome."),
           "an attributed ranking slipped through — attribution does not save a priority claim"

    assert superlative_hit?("Caravaggio's only wall painting."), "a uniqueness claim slipped through"

    for specimen <- @superlative_specimens do
      refute superlative_hit?(specimen),
             "the superlative ban rejected a sentence that must publish: #{specimen}"
    end
  end

  test "the research-method ban catches leaked provenance, and only there" do
    assert method_hit?("The sanctuary's own site returned HTTP 403."), "a status code slipped through"

    assert method_hit?("The palazzo's outline tests wholly inside Colonna."),
           "a footprint result slipped through"

    assert method_hit?("Every independent check made for this series agreed."),
           "a method summary slipped through"

    for specimen <- @method_specimens do
      refute method_hit?(specimen),
             "the research-method ban rejected a sentence that must publish: #{specimen}"
    end
  end

  test "no committed rome prose states a superlative" do
    offenders =
      for {name, doc} <- decoded_files(),
          text <- prose(doc),
          superlative_hit?(text) do
        {name, String.slice(text, 0, 140)}
      end

    assert offenders == [],
           "rome prose states a ranking claim. All three wave arbitrators ruled these out " <>
             "from any source, attributed or not — Rome has no reachable per-property register " <>
             "to check a ranking against:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t} -> "  #{n}: #{t}" end)
  end

  defp proximity_hit?(text), do: Enum.any?(@proximity_patterns, &Regex.match?(&1, text))

  test "the proximity ban separates wayfinding from adjacency" do
    assert proximity_hit?("Porta del Popolo stands at the north end of the rione."),
           "unsourced orientation slipped through"

    assert proximity_hit?("It is a short walk from the station."), "a duration slipped through"

    for specimen <- @proximity_specimens do
      refute proximity_hit?(specimen),
             "the proximity ban rejected an adjacency that must publish: #{specimen}"
    end
  end

  test "no committed rome prose orients by impression" do
    offenders =
      for {name, doc} <- decoded_files(),
          text <- prose(doc),
          proximity_hit?(text) do
        {name, String.slice(text, 0, 140)}
      end

    assert offenders == [],
           "rome prose orients a reader by an impression no source states. A sourced " <>
             "measurement publishes; two structures that adjoin may be said to adjoin:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t} -> "  #{n}: #{t}" end)
  end

  defp self_reference_hit?(text) do
    Enum.any?(@self_reference_patterns, &Regex.match?(&1, text))
  end

  test "the self-reference ban separates the page from the fact" do
    assert self_reference_hit?("The square is not written as a place by either rione."),
           "an ownership adjudication slipped through"

    assert self_reference_hit?("The monument belongs to Castro Pretorio and is written there."),
           "a pointer to a sibling page slipped through"

    assert self_reference_hit?("This page cannot tell you."), "a page self-reference slipped through"

    for specimen <- @self_reference_specimens do
      refute self_reference_hit?(specimen),
             "the self-reference ban rejected prose that must publish: #{specimen}"
    end
  end

  test "no committed rome prose adjudicates its own coverage" do
    offenders =
      for {name, doc} <- decoded_files(),
          text <- prose(doc),
          self_reference_hit?(text) do
        {name, String.slice(text, 0, 140)}
      end

    assert offenders == [],
           "rome prose explains its own editorial decisions to the reader. A page with no " <>
             "restaurants does not list restaurants; it does not announce that it has none:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t} -> "  #{n}: #{t}" end)
  end

  test "no committed rome prose narrates the research" do
    offenders =
      for {name, doc} <- decoded_files(),
          text <- prose(doc),
          method_hit?(text) do
        {name, String.slice(text, 0, 140)}
      end

    assert offenders == [],
           "rome prose tells the reader how the research was done. The provenance argument " <>
             "belongs in docs/rome/; the page carries the fact it supports:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t} -> "  #{n}: #{t}" end)
  end

  # What "closed" has to mean for a status field to be wrong: the PLACE cannot
  # be visited at all, now. This was three attempts getting narrower, and the
  # two things it had to learn to ignore are worth naming, because both look
  # like closures and neither is one.
  #
  #   * A PAST closure. The Vittoriano's history records that it was closed
  #     after the Second World War and later relaunched. The monument is open;
  #     the sentence is about 1945.
  #   * A PARTIAL closure. "it is closed every Wednesday" is a weekly closing
  #     day, and "the ticket outlet is closed until further notice" is a box
  #     office, not the venue. Both belong on a page whose place is open.
  #
  # So a bare "is closed" is not enough — the phrase has to say the place is
  # shut to visitors indefinitely. The check found five genuine contradictions
  # before this narrowing and three false ones; the five all survive it.
  defp closed_to_visitors do
    ~r/\b(?:(?:is|are|remains?|stays?)\s+(?:currently\s+|permanently\s+|temporarily\s+)?closed to the public|(?:is|are)\s+not open to the public|cannot be (?:entered|visited)|no walk-in|not on a walk-in basis|closed since \d{4}|not a building (?:a visitor )?can walk into|does not offer (?:regular )?public visits)\b/i
  end

  # Every false positive this check produced had the same shape: the thing that
  # is closed is not the place, it is a PART of the place. A box office, a
  # weekly closing day, one interior room of a surviving facade. So the closure
  # phrase is only believed when nothing in the words just before it names a
  # sub-part — which is as close to reading the sentence's subject as a regex
  # should get, and it is stated as a rule rather than as four exceptions.
  @sub_part ~r/\b(?:room|rooms|interior|outlet|box office|ticket|wing|crypt|cloister|basement|sale storiche|upper floor|garden)\b/i

  # A closure followed by "from ..." is a ROUTE restriction, not a closure:
  # "the Pyramid cannot be entered from the garden" says which way in does not
  # work, and appears on a page whose place is open. A closure with no such
  # qualifier is a closure.
  @route_qualifier ~r/^\s+from\b/i

  defp place_shut_to_visitors?(text) do
    case Regex.run(closed_to_visitors(), text, return: :index) do
      nil ->
        false

      [{start, len} | _] ->
        # BYTE offsets, not character offsets. `Regex.run/3` with
        # `return: :index` reports bytes, and Rome's prose is full of à, é and
        # «»  — so String.slice/3, which counts characters, reads the wrong
        # window and silently never matched. That is why an earlier version of
        # this guard did nothing at all.
        preceding = byte_window(text, max(start - 90, 0), min(start, 90))
        following = byte_window(text, start + len, 20)

        not Regex.match?(@sub_part, preceding) and
          not Regex.match?(@route_qualifier, following)
    end
  end

  # binary_part/3 raises when the requested range runs past the end, which a
  # closure phrase near the end of a summary does routinely.
  defp byte_window(bin, start, len) do
    available = max(byte_size(bin) - start, 0)
    binary_part(bin, start, min(len, available))
  end

  test "the closure test ignores past and partial closures" do
    # Regression for all three false positives, each of which shipped in a file
    # whose place is genuinely open.
    for open_prose <- [
          "After the war it was closed to the public and tried for offesa estetica, and it was relaunched under President Ciampi.",
          "It is closed every Wednesday and on 1 January, Easter and 25 December.",
          "The box office outlet is closed until further notice; tickets are available online.",
          "One small interior room survives and, as of 2023, is not open to the public.",
          "The Pyramid is seen well from the old cemetery but cannot be entered from the garden."
        ] do
      refute place_shut_to_visitors?(open_prose),
             "the closure test flagged a place that is open: #{open_prose}"
    end

    for shut_prose <- [
          "The casino is closed to the public.",
          "The palace is not open to the public.",
          "It cannot be visited.",
          "The museum has been closed since 1995."
        ] do
      assert place_shut_to_visitors?(shut_prose),
             "the closure test missed a genuinely shut place: #{shut_prose}"
    end
  end

  test "a status field agrees with its own prose" do
    # Four files shipped a place marked open whose own summary says you cannot
    # go in. Cheap to check, and it is the one contradiction a reader would
    # actually act on.
    offenders =
      for {name, doc} <- decoded_files(),
          place <- doc["places"] || [],
          place["status"] == "open",
          text = "#{place["summary"]} #{place["history"]}",
          place_shut_to_visitors?(text) do
        {name, place["slug"]}
      end

    assert offenders == [],
           "a place is marked open while its own prose says it is not:\n" <>
             Enum.map_join(offenders, "\n", fn {n, s} -> "  #{n}: #{s}" end)
  end

  test "no committed rome prose claims a heritage designation" do
    offenders =
      for {name, doc} <- decoded_files(),
          text <- prose(doc),
          designation_hit?(text) do
        {name, String.slice(text, 0, 160)}
      end

    assert offenders == [],
           "rome prose claims a protection status no reachable source states. " <>
             "Vincoli in Rete and the Catalogo generale are unreachable, so a " <>
             "designation claim cannot be checked and must not be published:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t} -> "  #{n}: #{t}" end)
  end

  test "no committed rome photograph depicts a live-copyright subject" do
    offenders =
      for {name, doc} <- decoded_files(),
          photo <- photos(doc),
          hit = blocked_subject(photo),
          hit != nil do
        {needle, why} = hit
        {name, needle, why}
      end

    assert offenders == [],
           "rome photographs feature subjects whose architect's copyright is live. " <>
             "Italy has no freedom of panorama, so a public-street vantage is not a " <>
             "defence and the photographer's CC licence does not reach the building:\n" <>
             Enum.map_join(offenders, "\n", fn {n, s, w} -> "  #{n}: #{s} — #{w}" end)
  end

  test "every rome photograph carries a publishable licence and its attribution" do
    offenders =
      for {name, doc} <- decoded_files(),
          photo <- photos(doc),
          reason = licence_fault(photo),
          reason != nil do
        {name, photo["title"] || photo["src"], reason}
      end

    assert offenders == [],
           "rome photographs fail the licence gate:\n" <>
             Enum.map_join(offenders, "\n", fn {n, t, r} -> "  #{n}: #{t} — #{r}" end)
  end

  defp licence_fault(photo) do
    cond do
      photo["license"] not in @publishable_licenses ->
        "licence #{inspect(photo["license"])} is not on the allowlist"

      not is_binary(photo["author"]) or photo["author"] == "" ->
        "no photographer credited — CC BY and CC BY-SA both require attribution"

      not is_binary(photo["source_url"]) or photo["source_url"] == "" ->
        "no source URL, so the licence claim cannot be re-checked"

      true ->
        nil
    end
  end

  test "vatican city is claimed by no rione or quartiere" do
    # The sovereignty ruling, held as an invariant rather than a convention.
    # A rione page that lists a Vatican place would be asserting that a
    # sovereign state's territory is part of an Italian administrative unit.
    offenders =
      for {name, doc} <- decoded_files(),
          name != "vatican-city.json",
          place <- doc["places"] || [],
          vatican_place?(place) do
        {name, place["slug"]}
      end

    assert offenders == [],
           "a Rome zone page claims a place inside Vatican City, which is a " <>
             "sovereign state and belongs to no rione:\n" <>
             Enum.map_join(offenders, "\n", fn {n, s} -> "  #{n}: #{s}" end)
  end

  # Rome has a great many churches called San Pietro and only one of them is in
  # the Vatican. Wave 1 shipped three that are not — San Pietro in Montorio and
  # its Tempietto in Trastevere, San Pietro in Borgo — and an earlier version of
  # this function flagged all three, because it matched the bare dedication.
  #
  # So the needles name the Vatican building, not the saint. `in-vaticano` is
  # the disambiguator Italian itself uses, and every false positive above
  # carries its own `in-<somewhere-else>` qualifier for the same reason.
  @vatican_needles [
    "st-peters-basilica",
    "st-peter-s-basilica",
    "st peters basilica",
    "st peter's basilica",
    "basilica-di-san-pietro",
    "san-pietro-in-vaticano",
    "st-peters-square",
    "st peter's square",
    "piazza-san-pietro",
    "vatican-museum",
    "vatican museum",
    "musei-vaticani",
    "sistine-chapel",
    "sistine chapel",
    "cappella-sistina"
  ]

  # A slug carrying one of these is somewhere else in Rome, whatever else it
  # says. Piazza San Pietro in Montorio is a real square in Trastevere and would
  # otherwise trip `piazza-san-pietro`.
  @not_vatican_qualifiers ["montorio", "in-borgo", "in-vincoli", "in-carcere"]

  defp vatican_place?(place) do
    haystack = String.downcase("#{place["slug"]} #{place["name"]}")

    Enum.any?(@vatican_needles, &String.contains?(haystack, &1)) and
      not Enum.any?(@not_vatican_qualifiers, &String.contains?(haystack, &1))
  end

  test "the vatican check names the building, not the saint" do
    # Regression for the over-broad needle. All three shipped in wave 1 and all
    # three are on Italian soil.
    for slug <- [
          "san-pietro-in-montorio-trastevere-rome",
          "tempietto-di-san-pietro-in-montorio-rome",
          "chiesa-di-san-pietro-in-borgo-rome"
        ] do
      refute vatican_place?(%{"slug" => slug, "name" => slug}),
             "#{slug} is in Rome, not the Vatican — the check is matching the dedication"
    end

    for slug <- [
          "st-peters-basilica",
          "piazza-san-pietro",
          "vatican-museums",
          "sistine-chapel"
        ] do
      assert vatican_place?(%{"slug" => slug, "name" => slug}),
             "#{slug} is inside Vatican City and must not be claimed by a rione"
    end
  end

  test "every committed rome seed file is valid, globally unique, and loads twice" do
    files = files()

    assert files != [], "no rome seed file has been committed yet"

    for path <- files do
      doc = path |> File.read!() |> Jason.decode!()

      assert is_map(doc["guide"]), "#{Path.basename(path)} has no guide object"

      # Vatican City is the one file in this directory that is NOT in Italy and
      # NOT in Rome. It sits here because a traveller planning Rome needs it and
      # because the rione files link to it, but it is a sovereign state: filing
      # it under Italy would publish a false claim, and would make
      # StructuredData emit addressCountry IT for St Peter's.
      #
      # So it names a root country node of its own rather than one under
      # italy/lazio/rome. That is not an exception grudgingly made; it is the
      # vatican_ruling applied to the field that encodes where a thing is.
      #
      # Asserted on the node path rather than on the state/county pair the
      # corpus carried until the destination tree landed. That pair said state
      # "Italy", county "Rome", and "Italy" was itself the defect this refactor
      # exists to fix — Italy is the country and Lazio the region, so the pair
      # could not say both. The path says the whole ancestry and cannot go
      # stale the same way.
      guide_path = doc["guide"]["destination_path"]

      expected_ancestry =
        if Path.basename(path) == "vatican-city.json",
          do: "vatican-city",
          else: "italy/lazio/rome"

      assert guide_path == expected_ancestry or
               String.starts_with?(guide_path, expected_ancestry <> "/"),
             "#{Path.basename(path)} is filed under #{inspect(guide_path)}, which is not " <>
               "under #{inspect(expected_ancestry)}"

      # The places of a zone file belong to that zone. Without this the guide
      # could sit in Rome while its places named any node in the roster.
      for p <- doc["places"] do
        assert p["destination_path"] == guide_path,
               "#{Path.basename(path)}: place #{p["slug"]} is filed under " <>
                 "#{inspect(p["destination_path"])}, not its own guide's " <>
                 "#{inspect(guide_path)}"
      end
    end

    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end

  # Tag removed 2026-09-03 by the last in-scope wave, which landed Vatican City
  # and brought the corpus to all thirty-one zones: 22 rioni, 8 tier-1
  # quartieri and the sovereign state. Roster equality now holds in both
  # directions and this runs on every suite.
  test "the shipped rome corpus matches the in-scope roster exactly" do
    expected = in_scope_slugs()

    shipped =
      files()
      |> Enum.map(&Path.rootname(Path.basename(&1)))
      |> MapSet.new()

    assert MapSet.size(expected) > 0, "no rome zone is in scope"

    assert MapSet.equal?(shipped, expected),
           "rome seed corpus does not match the in-scope roster.\n" <>
             "  rostered but not shipped: " <>
             inspect(expected |> MapSet.difference(shipped) |> Enum.sort()) <>
             "\n  shipped but not rostered: " <>
             inspect(shipped |> MapSet.difference(expected) |> Enum.sort())
  end

  test "every rome place carries a kind the schema accepts" do
    # Waves 1 to 3 were briefed with an INVENTED kind list — church, monument,
    # square, bridge — none of which the schema has. Three Sallustiano churches
    # shipped as kind "church" and the changeset rejected them at seed time,
    # which surfaced as two unrelated-looking failures in the release and
    # destination suites rather than here, where it belonged.
    #
    # Read off `Ethos.Places.Place` rather than copied into this file: a
    # hardcoded list here would be a second place for the allowlist to live and
    # would go stale the first time the schema gained a kind.
    valid = MapSet.new(Ethos.Places.Place.kinds())

    offenders =
      for {name, doc} <- decoded_files(),
          place <- doc["places"] || [],
          not MapSet.member?(valid, place["kind"]) do
        {name, place["slug"], place["kind"]}
      end

    assert offenders == [],
           "rome places carry a kind the schema will reject at seed time. Valid kinds are " <>
             inspect(Enum.sort(valid)) <>
             ":\n" <> Enum.map_join(offenders, "\n", fn {n, s, k} -> "  #{n}: #{s} — #{k}" end)
  end

  test "the seed directory the gate reads is the one the corpus lives in" do
    # Cheap, but it is the assertion that would have caught a gate silently
    # watching an empty directory while the corpus grew somewhere else.
    assert File.dir?(@seed_dir), "priv/seed_data/rome does not exist"
  end
end
