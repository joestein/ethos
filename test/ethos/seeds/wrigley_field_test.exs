defmodule Ethos.Seeds.WrigleyFieldTest do
  use Ethos.DataCase, async: true

  import Ethos.AccountsFixtures
  alias Ethos.{Guides, Places}
  alias Ethos.Seeds
  alias Ethos.Seeds.BallparkPlaces

  defp place(slug), do: Enum.find(BallparkPlaces.places(), &(&1.slug == slug))

  # Section bodies are wrapped heredocs, so a phrase a reader sees as one line
  # can carry a newline in the middle of it. Every prose assertion below reads
  # through this, or it asserts about the author's line breaks by accident.
  defp flat(text), do: String.replace(text, ~r/\s+/, " ")

  test "the guide seeds idempotently with every entry linked to a place" do
    user = user_fixture()
    BallparkPlaces.upsert_all!()
    Seeds.WrigleyFieldGuide.upsert!(user.email)
    guide = Seeds.WrigleyFieldGuide.upsert!(user.email)

    assert guide.slug == "wrigley-field-guide"
    assert guide.status == "published"
    assert guide.destination == "Chicago, Illinois"

    # The county is the field that decides the /destinations/illinois/cook-county
    # hub URL. The research finder cited it to an article that does not contain
    # the words "Cook County"; the verifier re-sourced it before confirming.
    assert guide.state == "Illinois"
    assert guide.state_slug == "illinois"
    assert guide.county == "Cook County"
    assert guide.county_slug == "cook-county"

    entries = Guides.list_entries(guide)
    assert length(entries) == length(BallparkPlaces.places())
    assert Enum.all?(entries, & &1.place_id), "every entry links a place"

    # Idempotent: a second run replaces the entries rather than doubling them.
    assert Guides.list_published_guides()
           |> Enum.count(&(&1.slug == "wrigley-field-guide")) == 1
  end

  test "every entry place_slug resolves to a seeded Cook County place" do
    BallparkPlaces.upsert_all!()

    for entry <- Seeds.WrigleyFieldGuide.data().entries do
      place = Places.get_place_by_slug(entry.place_slug)
      assert place, "missing place #{entry.place_slug}"
      assert place.town == "Chicago"
      assert place.state == "Illinois"
      assert place.county == "Cook County"
    end
  end

  test "the ballpark itself is a stadium, so its page emits StadiumOrArena" do
    BallparkPlaces.upsert_all!()
    wrigley = Places.get_place_by_slug!("wrigley-field")

    assert wrigley.kind == "stadium"
    assert EthosWeb.PlaceHTML.schema_type(wrigley.kind) == "StadiumOrArena"
    assert wrigley.state_slug == "illinois"
    assert wrigley.county_slug == "cook-county"
  end

  # Strange Cargo was a candidate on the assumption it sits at 3448 N Clark St.
  # The licence register shows the entity moved to 5216 N Clark (ZIP 60640,
  # outside Wrigleyville's sourced boundaries) and a successor now holds the old
  # address. The verifier's ruling was to drop it rather than relocate it, and
  # recommended this assertion so a later wave cannot quietly restore it —
  # the same precedent as `antique_trail_test.exs`'s excluded-dealer check.
  #
  # The Park at Wrigley carries an `uncertain` verdict on its own current name
  # and an address inferred from a licence row that does not name the plaza.
  # Cubs Store's licensee is Levy Premium Foodservice, not the club, so the
  # record could not say what it sells or who runs it.
  test "the corpus names nothing the verification excluded" do
    text = inspect(BallparkPlaces.places()) <> inspect(Seeds.WrigleyFieldGuide.data())

    refute text =~ "Strange Cargo"
    refute text =~ "3448 N Clark"
    refute text =~ "5216 N Clark"
    refute text =~ "the-park-at-wrigley"
    refute text =~ "Park at Wrigley"
    refute text =~ "cubs-store"
  end

  # Three ZIPs the finder gave as 60613 are 60657 in the City register, and one
  # pair that looks like an inconsistency is not one: the Music Box at 3733 N
  # Southport is 60613 while Southport Grocery at 3552 on the same street is
  # 60657. A later tidy-up that "fixes" that pair would be introducing an error.
  test "the verifier's ZIP corrections hold, including the pair that looks wrong" do
    for slug <- ~w(sluggers-chicago merkles-bar-and-grill nisei-lounge) do
      assert place(slug).address =~ "60657", "#{slug} lost its corrected ZIP"
    end

    assert place("music-box-theatre-chicago").address =~ "60613"
    assert place("southport-grocery-and-cafe").address =~ "60657"
  end

  # The sourced rooftop agreement ended in 2023. The finder dropped the end
  # date, and written in the present tense the clause is a false statement about
  # today. Both places it appears must carry the date.
  test "the rooftop revenue share is written as history, with its end date" do
    data = Seeds.WrigleyFieldGuide.data()

    carriers =
      Enum.map(data.sections, &flat(&1["body"])) ++
        Enum.map(data.faq, &flat(&1["answer"]))

    mentions = Enum.filter(carriers, &(&1 =~ "17%"))
    assert mentions != [], "the rooftop share is no longer published at all"

    for text <- mentions do
      assert text =~ "ran until 2023", "a 17% mention with no end date: #{inspect(text)}"
      refute text =~ ~r/rooftop owners (?:pay|are required to pay)\b/i
    end
  end

  # docs/site-builder.md §8: the heading is exactly "Getting there" — lowercase
  # t, no trailing mode — and the section is prose, so no station, garage or bus
  # route becomes a place record.
  test "transit and parking are one prose section and mint no places" do
    data = Seeds.WrigleyFieldGuide.data()
    headings = Enum.map(data.sections, & &1["heading"])

    assert "Getting there" in headings
    assert headings == ["Getting there", "Around the ballpark", "The ballpark and the team"]

    getting_there =
      data.sections
      |> Enum.find(&(&1["heading"] == "Getting there"))
      |> Map.fetch!("body")
      |> flat()

    assert getting_there =~ "Addison station"
    assert getting_there =~ "Red Top Parking"

    names = Enum.map(BallparkPlaces.places(), & &1.name)
    refute Enum.any?(names, &(&1 =~ ~r/station|parking|garage/i))

    # No parking price was reachable and none may be published; nor may any
    # garage be called an official Cubs lot.
    refute getting_there =~ ~r/\$\d/
    assert getting_there =~ "official Cubs lot"
  end
end
