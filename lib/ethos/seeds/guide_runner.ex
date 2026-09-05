defmodule Ethos.Seeds.GuideRunner do
  @moduledoc """
  Shared upsert logic for guide seeds, whether the data comes from a
  code module (the Connecticut town guides) or a JSON seed file (Manhattan
  onward, via `Ethos.Seeds.DataGuide`). The caller supplies a `data` map
  (naming its destination node with either `:destination_id` or
  `:destination_path`); this runner idempotently upserts the guide by slug,
  replaces its entries (linking each to a seeded place), sets SEO fields and
  photos, and publishes it.
  """

  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Accounts
  alias Ethos.Accounts.User
  alias Ethos.Guides
  alias Ethos.Guides.{Guide, Entry}
  alias Ethos.Places

  @doc """
  Creates or updates the given town's guide under the user with the given
  email (creating that user, with a random password, if they don't exist
  yet — dev/test only). Idempotent by slug — safe to run repeatedly.
  """
  def upsert!(data, email) when is_binary(email) do
    user = find_or_create_user!(email)
    guide = find_or_insert_guide!(user, data)

    {:ok, guide} =
      Repo.transaction(fn ->
        guide =
          guide
          |> Guide.changeset(guide_attrs(data))
          |> Ecto.Changeset.put_change(:slug, data.slug)
          |> Ecto.Changeset.put_change(:tier, Map.get(data, :tier, "guide"))
          |> Repo.update!()

        {:ok, guide} =
          Guides.update_guide_seo(guide, %{
            intro: data.intro,
            sections: data.sections,
            faq: data.faq
          })

        {:ok, guide} = Guides.update_guide_photos(guide, data.photos)

        replace_entries!(guide, data.entries)

        {:ok, published} = Guides.publish_guide(guide)
        published
      end)

    Guides.get_guide!(guide.id)
  end

  # Mirrors Ethos.Seeds.RomeGuide's owner resolution exactly: look up by
  # email; only auto-create (with a random password, no confirmation step —
  # RomeGuide performs none) when running in dev/test.
  defp find_or_create_user!(email) do
    case Accounts.get_user_by_email(email) do
      %User{} = user ->
        user

      nil ->
        if Application.get_env(:ethos, :env) in [:dev, :test] do
          password = :crypto.strong_rand_bytes(24) |> Base.encode64()
          {:ok, user} = Accounts.register_user(%{email: email, password: password})
          user
        else
          raise "owner account #{email} not found — register it first"
        end
    end
  end

  defp guide_attrs(data) do
    Map.merge(
      %{"title" => data.title, "destination" => data.destination},
      destination_attrs(data)
    )
  end

  # Transitional counterpart of the shim in `Ethos.Places.upsert_place!/1`.
  # `guides.state` and `guides.county` still drive /destinations routing and the
  # breadcrumbs, so they are derived from the node rather than nulled; Tasks
  # 8-11 move those readers onto `destination_id` and Task 12 drops the columns
  # and this derivation with them.
  defp destination_attrs(data) do
    case destination_node(data) do
      nil ->
        %{"state" => Map.get(data, :state), "county" => Map.get(data, :county)}

      node ->
        node
        |> Ethos.Destinations.legacy_geo()
        |> Map.take(["state", "county"])
        |> Map.put("destination_id", node.id)
    end
  end

  # Code-module guides (the ballparks, the Connecticut five) carry a
  # :destination_path; JSON guides arrive already resolved to an id. Accept
  # either, so both seeding routes share one runner.
  defp destination_node(%{destination_id: id}) when is_integer(id),
    do: Repo.get!(Ethos.Destinations.Destination, id)

  defp destination_node(%{destination_path: path}) when is_binary(path) do
    Ethos.Destinations.get_by_path(path) ||
      raise ArgumentError, "unknown destination node #{path}"
  end

  # The code seeds still name their geography with the legacy pair. Task 6 moves
  # them onto :destination_path, after which nothing reaches this clause.
  defp destination_node(_data), do: nil

  defp find_or_insert_guide!(user, data) do
    case Repo.get_by(Guide, slug: data.slug) do
      %Guide{} = guide ->
        guide

      nil ->
        %Guide{user_id: user.id}
        |> Guide.changeset(guide_attrs(data))
        |> Ecto.Changeset.put_change(:slug, data.slug)
        |> Repo.insert!()
    end
  end

  defp replace_entries!(guide, entries) do
    Repo.delete_all(from e in Entry, where: e.guide_id == ^guide.id)

    Enum.each(entries, fn e ->
      place = Places.get_place_by_slug!(e.place_slug)

      {:ok, _entry} =
        Guides.create_entry(
          guide,
          %{
            "kind" => e.kind,
            "name" => e.name,
            "note" => e.note,
            "place_id" => place.id,
            "source" => "manual"
          },
          :privileged
        )
    end)
  end
end
