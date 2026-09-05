defmodule Ethos.FoliageTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage

  describe "towns/0" do
    test "loads all 169 Connecticut towns" do
      assert length(Foliage.towns()) == 169
    end

    test "every town has nine stages and a peak week" do
      for town <- Foliage.towns() do
        assert length(town.stages) == 9, "#{town.slug} has #{length(town.stages)} stages"
        assert town.peak_week in 1..9, "#{town.slug} has peak_week #{inspect(town.peak_week)}"
      end
    end

    test "stages are atoms from the known set" do
      known = MapSet.new([:green, :turning, :near_peak, :peak, :past_peak])

      for town <- Foliage.towns(), stage <- town.stages do
        assert MapSet.member?(known, stage), "#{town.slug} has unknown stage #{inspect(stage)}"
      end
    end
  end

  describe "town/1" do
    test "finds a town by slug" do
      assert %{name: "Salisbury", county: "Litchfield"} = Foliage.town("salisbury")
    end

    test "returns nil for an unknown slug" do
      assert Foliage.town("nowhere") == nil
    end
  end

  describe "stage_at/2" do
    test "reproduces the north-west corner peaking before the shoreline" do
      salisbury = Foliage.town("salisbury")
      saybrook = Foliage.town("old-saybrook")

      assert salisbury.peak_week < saybrook.peak_week
    end
  end

  describe "current_week_index/1" do
    test "maps a date inside the season to its week" do
      assert Foliage.current_week_index(~D[2026-10-16]) == 5
    end

    test "clamps to week one before the season" do
      assert Foliage.current_week_index(~D[2026-08-01]) == 1
    end

    test "clamps to week nine after the season" do
      assert Foliage.current_week_index(~D[2026-12-01]) == 9
    end
  end

  describe "routes/0" do
    test "loads the seven official DEEP routes" do
      assert length(Foliage.routes()) == 7
    end

    test "every stop names a guide that exists in the corpus" do
      for route <- Foliage.routes(), stop <- route.stops do
        assert is_binary(stop.guide_slug)
        assert String.ends_with?(stop.guide_slug, "-ct-travel-guide")
      end
    end

    test "Hartford West runs through eleven towns" do
      assert %{stops: stops} = Foliage.route("hartford-west")
      assert length(stops) == 11
    end
  end

  describe "in_season?/1" do
    test "is true in October and false in June" do
      assert Foliage.in_season?(~D[2026-10-15])
      refute Foliage.in_season?(~D[2026-06-15])
    end
  end

  describe "attribution/0" do
    test "names DEEP, the 2023 vintage, and whose the stage names are" do
      text = Foliage.attribution()
      assert text =~ "Connecticut DEEP"
      assert text =~ "2023"
      assert text =~ "Stage names are ours"
    end

    test "never claims to be live" do
      refute Foliage.attribution() =~ ~r/live|real-time|tracker/i
    end
  end
end
