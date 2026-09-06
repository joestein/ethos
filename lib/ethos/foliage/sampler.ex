defmodule Ethos.Foliage.Sampler do
  @moduledoc """
  The week list and the pure decision functions the build gate applies to a
  sampled stage sequence.

  Week ranges are stored year-agnostically, as DEEP labelled them. They are
  climatological bins, not this year's calendar weeks, so pinning them to 2026
  dates would be both wrong and an annual maintenance task.
  """

  alias Ethos.Foliage.Tiles

  @weeks [
    %{
      index: 1,
      label: "Sept 16–22",
      starts: {9, 16},
      ends: {9, 22},
      service: "FallFoliage_Week1_Sept16_22"
    },
    %{
      index: 2,
      label: "Sept 23–29",
      starts: {9, 23},
      ends: {9, 29},
      service: "FallFoliage_Week2_Sept23_29"
    },
    %{
      index: 3,
      label: "Sept 30–Oct 6",
      starts: {9, 30},
      ends: {10, 6},
      service: "FallFoliage_Week3_Sept30_Oct6"
    },
    %{
      index: 4,
      label: "Oct 7–13",
      starts: {10, 7},
      ends: {10, 13},
      service: "FallFoliage_Week4_Oct7_Oct13"
    },
    %{
      index: 5,
      label: "Oct 14–20",
      starts: {10, 14},
      ends: {10, 20},
      service: "FallFoliage_Week5_Oct14_Oct20"
    },
    %{
      index: 6,
      label: "Oct 21–27",
      starts: {10, 21},
      ends: {10, 27},
      service: "FallFoliage_Week6_Oct21_Oct27"
    },
    %{
      index: 7,
      label: "Oct 28–Nov 3",
      starts: {10, 28},
      ends: {11, 3},
      service: "FallFoliage_Week7_Oct28_Nov3"
    },
    %{
      index: 8,
      label: "Nov 4–10",
      starts: {11, 4},
      ends: {11, 10},
      service: "FallFoliage_Week8_Nov4_Nov10"
    },
    %{index: 9, label: "Past peak", starts: nil, ends: nil, service: "FallFoliage_Week9_PastPeak"}
  ]

  def weeks, do: @weeks

  @doc """
  The modal classified stage, or an error when fewer than `floor` of the
  samples landed on the ramp at all. A town smaller than the sampling footprint
  is the realistic failure mode and it must stop the build, not guess.
  """
  def modal_stage(samples, floor) when is_list(samples) do
    classified = for {:ok, stage} <- samples, do: stage

    if length(classified) / max(length(samples), 1) < floor do
      {:error, :insufficient_samples}
    else
      {stage, _count} =
        classified
        |> Enum.frequencies()
        |> Enum.max_by(fn {_stage, count} -> count end)

      {:ok, stage}
    end
  end

  @doc "True when a stage sequence never regresses toward green."
  def monotonic?(stages) do
    order = Enum.with_index(Tiles.stages()) |> Map.new()
    ranks = Enum.map(stages, &Map.fetch!(order, &1))
    ranks == Enum.sort(ranks)
  end

  @doc """
  The week a town is most advanced before it goes past peak.

  Not "the first `:peak` week". DEEP's map runs out of real weeks before the
  shoreline and the south-west corner reach the red band, and its ninth layer
  is a blanket statewide past-peak fill rather than an observation, so 36 of
  the 169 towns never show `:peak` at all. For the 133 that do, this returns
  exactly the first `:peak` week — the two definitions agree wherever the
  narrower one was defined.
  """
  def peak_week(stages) do
    order = Enum.with_index(Tiles.stages()) |> Map.new()

    case Enum.reject(stages, &(&1 == :past_peak)) do
      [] ->
        nil

      reachable ->
        top = Enum.max_by(reachable, &Map.fetch!(order, &1))
        Enum.find_index(stages, &(&1 == top)) + 1
    end
  end
end
