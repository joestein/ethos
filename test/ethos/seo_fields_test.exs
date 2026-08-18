defmodule Ethos.SeoFieldsTest do
  use Ethos.DataCase, async: true

  alias Ethos.Guides
  import Ethos.GuidesFixtures

  test "destination_slug derives from destination on create and update" do
    guide = guide_fixture(%{destination: "Rome, Italy"})
    assert guide.destination_slug == "rome"

    {:ok, guide} = Guides.update_guide(guide, %{destination: "San Sebastián, Spain"})
    assert guide.destination_slug == "san-sebasti-n"
  end

  test "update_guide_seo/2 stores intro, sections, faq" do
    guide = guide_fixture()

    {:ok, guide} =
      Guides.update_guide_seo(guide, %{
        intro: "Three **real** days in Rome.",
        sections: [%{"heading" => "Getting around", "body" => "Walk. Everything is close."}],
        faq: [%{"question" => "How many days?", "answer" => "Three is enough for the center."}]
      })

    assert guide.intro =~ "real"
    assert [%{"heading" => "Getting around"}] = guide.sections
    assert [%{"question" => "How many days?"}] = guide.faq
  end

  test "entry booking_url must be http(s)" do
    guide = guide_fixture()

    {:ok, entry} =
      Guides.create_entry(guide, %{
        kind: "tour", name: "Arena floor", verdict: "loved",
        booking_url: "https://example.com/t/1", booking_label: "Book it"
      })

    assert entry.booking_url == "https://example.com/t/1"

    {:error, changeset} =
      Guides.create_entry(guide, %{kind: "tour", name: "Bad", booking_url: "javascript:alert(1)"})

    assert %{booking_url: _} = errors_on(changeset)
  end

  test "destination listing helpers" do
    g = published_guide_fixture(%{destination: "Rome, Italy"})
    _draft = guide_fixture(%{destination: "Rome, Italy"})
    _other = published_guide_fixture(%{destination: "Tokyo, Japan"})

    dests = Guides.list_destinations()
    assert %{slug: "rome", name: "Rome", count: 1} in dests
    assert %{slug: "tokyo", name: "Tokyo", count: 1} in dests

    assert [%{id: id}] = Guides.list_published_guides_for_destination("rome")
    assert id == g.id
    assert length(Guides.list_published_guides()) == 2
  end
end
