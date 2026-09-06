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
  alias Ethos.Accounts.Username
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

          attrs = %{
            email: email,
            password: password,
            username: Username.derive_from_email(email)
          }

          case Accounts.register_user(attrs) do
            {:ok, user} ->
              user

            {:error, changeset} ->
              raise "could not auto-create owner account #{email}: #{inspect(changeset.errors)}"
          end
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

  # A guide's geography is the node it names and nothing else. The state and
  # county this used to derive alongside the id were columns, and the columns
  # are gone; every reader — the breadcrumb, the hub, the affiliate resolver —
  # walks the node's ancestry instead.
  defp destination_attrs(data), do: %{"destination_id" => destination_node(data).id}

  # Code-module guides (the ballparks, the Connecticut six) carry a
  # :destination_path; JSON guides arrive already resolved to an id. Accept
  # either, so both seeding routes share one runner.
  #
  # There is deliberately no catch-all clause. One stood here between Tasks 7
  # and 6 so the code-seed guides could keep their `state`/`county` pair for a
  # commit, and it was a silent hole: a guide misspelling `destination_pth:`
  # fell through to `Map.get(data, :state)` and published a nil state instead of
  # raising. Every guide now names a node, so a guide that names none — or
  # misspells the key — raises here, which is the only reliable report of that
  # typo.
  defp destination_node(%{destination_id: id}) when is_integer(id),
    do: Repo.get!(Ethos.Destinations.Destination, id)

  defp destination_node(%{destination_path: path}) when is_binary(path) do
    Ethos.Destinations.get_by_path(path) ||
      raise ArgumentError, "unknown destination node #{path}"
  end

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
