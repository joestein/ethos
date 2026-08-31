defmodule Ethos.Seeds.DataGuide do
  @moduledoc """
  Loads a JSON seed file (guide + places + entries) and upserts it through
  `Ethos.Seeds.GuideRunner`. Seed files live under `priv/seed_data/` and are
  the authoring format for all data-driven destinations (Manhattan onward).

  Seeding is three-pass at the directory level (see `Ethos.Release.seed_manhattan/1`):
  all files' places, then all guides, then all links — so entries may reference
  places, and links may reference guides, defined in any file of the same run
  regardless of the order the files are processed in.

  ## `status: "open"` is not a trading claim, and uncertain places still ship

  `Ethos.Places.Place` validates `status` into `open|closed` and defaults it to
  `"open"`. Read as a claim, that would mean a place whose current trading a
  verification left *uncertain* could never be published — and a wave that
  believes it would discard the majority of what it researched. Belmont came
  within one commit of shipping 12 of 40 verified places for exactly that
  reason.

  It is not a claim. `place_html/show.html.heex` renders a banner only when
  `status == "closed"`; `"open"` renders nothing at all. "Open" is the
  **absence of a closed claim**, not an assertion of trading. A record
  therefore makes no claim about whether a place trades today unless its own
  prose does.

  So the rule, and it applies to every wave: **uncertain trading does not block
  publication — it forbids writing that the place is open.** Publish what the
  verification confirmed, which is what a place is and where it is. Write
  nothing that says it trades today, currently operates, is still going, or
  serves anything at this moment. Uncertain *identity* is the thing that blocks
  publication, because a record whose name or address is unestablished has
  nothing left to say.

  A seed file may optionally declare a top-level `"links"` array — edges
  from that file's guide to other guides or places, in the form
  `{"target": "guide:<slug>"|"place:<slug>", "kind": "...", "note": "..."}`.
  These are authored intentionally by whoever wrote the file, so resolution
  is strict: an unknown target raises with the offending file path, unlike
  the skip-if-missing backfill in `Ethos.Seeds.BackfillLinks` (which links
  pages that may or may not have been seeded yet).
  """

  alias Ethos.Places
  alias Ethos.Seeds.GuideRunner

  @required_guide_keys ~w(slug title destination state county intro)

  def upsert_from_file!(path, email) do
    upsert_places!(path)
    guide = upsert_guide!(path, email)
    upsert_links!(path)
    guide
  end

  def load!(path) do
    raw =
      case File.read(path) do
        {:ok, raw} -> raw
        {:error, reason} -> raise ArgumentError, "#{path}: cannot read (#{inspect(reason)})"
      end

    data =
      case Jason.decode(raw) do
        {:ok, data} -> data
        {:error, err} -> raise ArgumentError, "#{path}: invalid JSON — #{Exception.message(err)}"
      end

    validate_shape!(path, data)
    data
  end

  def upsert_places!(path) do
    data = load!(path)
    Enum.map(data["places"], &Places.upsert_place!/1)
  end

  def upsert_guide!(path, email) do
    data = load!(path)
    g = data["guide"]

    runner_data = %{
      slug: g["slug"],
      title: g["title"],
      destination: g["destination"],
      state: g["state"],
      county: g["county"],
      intro: g["intro"],
      tier: g["tier"] || "guide",
      sections: g["sections"] || [],
      faq: g["faq"] || [],
      photos: g["photos"] || [],
      entries:
        Enum.map(data["entries"], fn e ->
          %{kind: e["kind"], name: e["name"], note: e["note"], place_slug: e["place_slug"]}
        end)
    }

    GuideRunner.upsert!(runner_data, email)
  end

  @doc """
  Applies the file's `"links"` edges. Runs as its own directory-level pass so a
  file may link to any guide in the run, not only ones seeded before it.
  """
  def upsert_links!(path) do
    data = load!(path)
    source_slug = data["guide"]["slug"]

    links =
      for l <- data["links"] || [] do
        %{target: parse_ref!(path, l["target"]), kind: l["kind"], note: l["note"]}
      end

    try do
      Ethos.Links.replace_outgoing_links!({:guide, source_slug}, links)
    rescue
      e in ArgumentError ->
        reraise ArgumentError, [message: "#{path}: #{Exception.message(e)}"], __STACKTRACE__
    end
  end

  defp parse_ref!(_path, "guide:" <> slug), do: {:guide, slug}
  defp parse_ref!(_path, "place:" <> slug), do: {:place, slug}

  defp parse_ref!(path, other),
    do:
      raise(
        ArgumentError,
        "#{path}: bad link target #{inspect(other)} (want guide:<slug> or place:<slug>)"
      )

  defp validate_shape!(path, data) do
    guide = data["guide"]

    cond do
      not (is_map(guide) and is_list(data["places"]) and is_list(data["entries"])) ->
        raise ArgumentError, "#{path}: missing guide/places/entries keys"

      Enum.any?(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == "")) ->
        missing =
          Enum.filter(@required_guide_keys, &(not is_binary(guide[&1]) or guide[&1] == ""))

        raise ArgumentError, "#{path}: guide missing required keys #{inspect(missing)}"

      not is_nil(guide["tier"]) and guide["tier"] not in ["guide", "town-page"] ->
        raise ArgumentError,
              "#{path}: bad tier #{inspect(guide["tier"])} (want \"guide\" or \"town-page\")"

      true ->
        :ok
    end
  end
end
