defmodule Ethos.Foliage.SamplerTest do
  use ExUnit.Case, async: true

  alias Ethos.Foliage.Sampler

  describe "weeks/0" do
    test "has nine weeks in DEEP's order" do
      weeks = Sampler.weeks()
      assert length(weeks) == 9
      assert Enum.map(weeks, & &1.index) == Enum.to_list(1..9)
      assert hd(weeks).label == "Sept 16–22"
      assert List.last(weeks).label == "Past peak"
    end

    test "week nine carries no date range" do
      assert List.last(Sampler.weeks()).starts == nil
    end

    test "each week names its DEEP tile service" do
      assert hd(Sampler.weeks()).service == "FallFoliage_Week1_Sept16_22"
      assert List.last(Sampler.weeks()).service == "FallFoliage_Week9_PastPeak"
    end
  end

  describe "modal_stage/2" do
    test "returns the most common classified stage" do
      samples = [{:ok, :peak}, {:ok, :peak}, {:ok, :turning}, :unknown]
      assert Sampler.modal_stage(samples, 0.5) == {:ok, :peak}
    end

    test "ignores unknown pixels when counting" do
      samples = [{:ok, :green}, :unknown, :unknown, :unknown, {:ok, :green}, {:ok, :green}]
      assert Sampler.modal_stage(samples, 0.5) == {:ok, :green}
    end

    test "fails when too few pixels classified" do
      samples = [{:ok, :green}, :unknown, :unknown, :unknown, :unknown]
      assert Sampler.modal_stage(samples, 0.5) == {:error, :insufficient_samples}
    end
  end

  describe "monotonic?/1" do
    test "accepts a sequence that only advances" do
      assert Sampler.monotonic?([:green, :green, :turning, :near_peak, :peak, :past_peak])
    end

    test "rejects a sequence that goes backwards" do
      refute Sampler.monotonic?([:green, :peak, :turning])
    end
  end

  describe "peak_week/1" do
    test "returns the first week at :peak when a town reaches it" do
      assert Sampler.peak_week([:green, :turning, :near_peak, :peak, :peak, :past_peak]) == 4
    end

    test "returns the most advanced week when a town never reaches :peak" do
      # Greenwich's real sequence shape: DEEP's map runs out of weeks before the
      # south-west corner turns red, so it goes near_peak straight to past_peak.
      assert Sampler.peak_week([:green, :green, :turning, :near_peak, :past_peak]) == 4
    end

    test "returns nil when every week is already past peak" do
      assert Sampler.peak_week([:past_peak, :past_peak]) == nil
    end
  end
end
