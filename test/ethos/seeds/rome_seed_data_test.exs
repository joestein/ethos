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

  @moduletag :pending_rome

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

    (guide_text ++ place_text ++ link_text)
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

  defp vatican_place?(place) do
    haystack = String.downcase("#{place["slug"]} #{place["name"]}")

    Enum.any?(
      ["st-peter", "st peter", "san-pietro", "vatican-museum", "vatican museum", "sistine"],
      &String.contains?(haystack, &1)
    )
  end

  test "every committed rome seed file is valid, globally unique, and loads twice" do
    files = files()

    assert files != [], "no rome seed file has been committed yet"

    for path <- files do
      doc = path |> File.read!() |> Jason.decode!()

      assert is_map(doc["guide"]), "#{Path.basename(path)} has no guide object"

      assert doc["guide"]["state"] == "Italy",
             "#{Path.basename(path)} does not carry state \"Italy\", so it will not " <>
               "route under /destinations/italy/rome"

      assert doc["guide"]["county"] == "Rome",
             "#{Path.basename(path)} does not carry county \"Rome\""
    end

    SeedDataHelpers.assert_place_slugs_globally_unique!()
  end

  # Delete this @tag when the last in-scope wave lands — 31 zones — and not
  # before: until then the corpus is a prefix of the in-scope set and this
  # fails by construction.
  @tag :pending_rome
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

  test "the seed directory the gate reads is the one the corpus lives in" do
    # Cheap, but it is the assertion that would have caught a gate silently
    # watching an empty directory while the corpus grew somewhere else.
    assert File.dir?(@seed_dir), "priv/seed_data/rome does not exist"
  end
end
