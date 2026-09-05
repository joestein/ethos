defmodule Ethos.HouseAd do
  @moduledoc """
  The photograph pool behind the Connecticut Foliage Forecast house ad.

  Twenty-five Connecticut towns whose first photograph reads well at thumbnail
  size. Slugs rather than photo records: the list stays reviewable in a diff,
  and the photo data stays in one place — the guides that already own it.

  Resolved once at boot into `:persistent_term`, mirroring
  `Ethos.Foliage.Dataset`. A slug whose guide is unpublished or carries no
  usable photograph is skipped with a log line rather than raising. This is a
  promotional unit; it must never be able to take a page down.

  ## Attribution is a licence obligation, not a nicety

  420 of the 477 Connecticut guide photographs are CC BY or CC BY-SA. Both
  require visible attribution. `usable?/1` is what keeps an unattributable
  photograph out of the pool, so the rendering layer never has to decide.
  """

  require Logger

  import Ecto.Query

  alias Ethos.Guides.Guide
  alias Ethos.Repo

  @key {__MODULE__, :pool}

  @pool_slugs ~w(
    litchfield kent salisbury norfolk washington sharon cornwall
    woodbury essex chester old-lyme guilford madison stonington
    simsbury farmington avon granby suffield somers
    pomfret woodstock brooklyn canterbury lebanon
  )

  def child_spec(_opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, []}, type: :worker, restart: :temporary}
  end

  def start_link do
    load!()
    :ignore
  end

  @doc "Resolves the pool slugs to photographs and stores the result."
  def load! do
    :persistent_term.put(@key, build_pool())
    :ok
  end

  @doc "The loaded pool, or an empty list if it has not been loaded."
  def pool, do: :persistent_term.get(@key, [])

  @doc """
  Whether a photograph can be rendered at all.

  Requires an author and a licence: without both, displaying it would breach
  the licence on all but the 57 CC0 and public-domain images.
  """
  def usable?(photo) when is_map(photo) do
    present?(Map.get(photo, "author")) and present?(Map.get(photo, "license")) and
      present?(Map.get(photo, "src"))
  end

  def usable?(_), do: false

  @doc """
  A deterministic member of `pool` for `key`.

  Deterministic rather than random so a given URL always shows the same
  photograph — caches stay coherent and tests stay predictable.
  """
  def pick(_key, []), do: nil

  def pick(key, pool) when is_list(pool) do
    Enum.at(pool, :erlang.phash2(key || "", length(pool)))
  end

  defp build_pool do
    rows =
      Repo.all(
        from g in Guide,
          where:
            g.status == "published" and g.state_slug == "connecticut" and
              g.destination_slug in ^@pool_slugs,
          select: {g.destination_slug, g.photos}
      )
      |> Enum.sort_by(&elem(&1, 0))

    missing = @pool_slugs -- Enum.map(rows, &elem(&1, 0))

    cond do
      missing == [] ->
        :ok

      length(missing) == length(@pool_slugs) ->
        # No Connecticut corpus at all — an empty test database, or dev before
        # seeding. Expected, so it does not warn; a line that fires on every
        # boot is a line nobody reads.
        Logger.info("house ad: no Connecticut guides present, the unit will not render")

      true ->
        # Some slugs resolved and some did not, so guides have moved out from
        # under the pool list. That is drift worth an operator's attention.
        Logger.warning("house ad: no published guide for #{Enum.join(missing, ", ")}")
    end

    photos =
      Enum.flat_map(rows, fn {slug, photos} ->
        case Enum.find(photos || [], &usable?/1) do
          nil ->
            Logger.warning("house ad: #{slug} has no usable photograph, skipped")
            []

          photo ->
            [photo]
        end
      end)

    # Only warn here when guides resolved but none had a usable photograph —
    # the case where no guide resolved at all is the absent-corpus case
    # already covered by the :info branch above, and warning again on top of
    # it would be the same "fires on every empty-database run" problem this
    # fix exists to remove.
    if photos == [] and rows != [] do
      Logger.warning("house ad: pool is empty; the unit will not render")
    end

    photos
  end

  defp present?(value), do: is_binary(value) and String.trim(value) != ""
end
