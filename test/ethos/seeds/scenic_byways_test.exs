defmodule Ethos.Seeds.ScenicBywaysTest do
  use Ethos.DataCase, async: false

  import Ethos.GuidesFixtures

  alias Ethos.Collections
  alias Ethos.Seeds.ScenicBywaysCollections

  # Listed explicitly rather than with ~w, because "New Canaan" contains a
  # space and the sigil would split it into two towns.
  @towns %{
    "merritt-parkway" => [
      "Greenwich",
      "Stamford",
      "New Canaan",
      "Norwalk",
      "Westport",
      "Fairfield",
      "Trumbull",
      "Stratford"
    ],
    "route-169" => ["Woodstock", "Pomfret", "Brooklyn", "Canterbury", "Lisbon"],
    "route-207" => ["Hebron", "Lebanon", "Franklin", "Sprague"],
    "route-7-in-the-northwest" => ["Sharon", "Salisbury", "Canaan"]
  }

  defp ct_guide(town) do
    slug = town |> String.downcase() |> String.replace(~r/[^a-z0-9]+/, "-") |> String.trim("-")

    published_guide_fixture(%{
      title: town,
      destination: "#{town}, Connecticut",
      state: "Connecticut",
      county: "Fairfield County"
    })
    |> Ecto.Changeset.change(slug: "#{slug}-ct-travel-guide")
    |> Ethos.Repo.update!()
  end

  defp seed_towns do
    names = @towns |> Map.values() |> List.flatten() |> Enum.uniq()

    for name <- names do
      ct_guide(name)
    end
  end

  test "seeds four published collections" do
    seed_towns()
    collections = ScenicBywaysCollections.upsert_all!()

    assert length(collections) == 4
    slugs = collections |> Enum.map(& &1.slug) |> Enum.sort()
    assert slugs == ["merritt-parkway", "route-169", "route-207", "route-7-in-the-northwest"]
    assert Enum.all?(collections, & &1.published)
  end

  test "every collection names its designation year and who designated it" do
    seed_towns()

    for c <- ScenicBywaysCollections.upsert_all!() do
      assert c.intro =~ ~r/\b(1991|1993|2002|2022)\b/, "#{c.slug} states no designation year"

      assert c.intro =~ "Department of Transportation",
             "#{c.slug} does not say where the route data comes from"
    end
  end

  test "the two National Scenic Byways say so and the two state roads do not" do
    seed_towns()
    by_slug = Map.new(ScenicBywaysCollections.upsert_all!(), &{&1.slug, &1})

    assert by_slug["merritt-parkway"].intro =~ "National Scenic Byway"
    assert by_slug["route-169"].intro =~ "National Scenic Byway"
    refute by_slug["route-207"].intro =~ "National Scenic Byway"
    refute by_slug["route-7-in-the-northwest"].intro =~ "National Scenic Byway"
  end

  test "no collection quotes a distance in miles" do
    # The source milepoints are per-direction: the Merritt's segments sum to
    # 74.5 miles because both carriageways are present, while the parkway is
    # about 37. Distances are excluded rather than halved and hoped.
    seed_towns()

    for c <- ScenicBywaysCollections.upsert_all!() do
      refute c.intro =~ ~r/\bmiles?\b/i, "#{c.slug} quotes a distance"

      for item <- Ethos.Repo.preload(c, :items).items do
        refute (item.blurb || "") =~ ~r/\bmiles?\b/i, "#{c.slug} blurb quotes a distance"
      end
    end
  end

  test "each collection has one item per town, in route order" do
    seed_towns()
    by_slug = Map.new(ScenicBywaysCollections.upsert_all!(), &{&1.slug, &1})

    expected = %{
      "merritt-parkway" => 8,
      "route-169" => 5,
      "route-207" => 4,
      "route-7-in-the-northwest" => 3
    }

    for {slug, count} <- expected do
      items = Ethos.Repo.preload(by_slug[slug], :items).items
      assert length(items) == count, "#{slug} has #{length(items)} items, expected #{count}"
      assert Enum.map(items, & &1.position) == Enum.to_list(0..(count - 1))
      assert Enum.all?(items, &(String.trim(&1.blurb || "") != ""))
    end
  end

  test "is idempotent" do
    seed_towns()
    ScenicBywaysCollections.upsert_all!()
    ScenicBywaysCollections.upsert_all!()

    assert length(Collections.list_published()) >= 4
    c = Enum.find(Collections.list_published(), &(&1.slug == "route-207"))
    assert length(Ethos.Repo.preload(c, :items).items) == 4
  end
end
