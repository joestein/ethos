defmodule EthosWeb.GuideController do
  use EthosWeb, :controller

  alias Ethos.{Guides, Research}
  alias Ethos.Guides.Guide

  def show(conn, %{"slug" => slug}) do
    guide = Guides.get_published_guide_by_slug!(slug) |> ensure_og_image()
    entries = Guides.list_entries(guide)
    Guides.increment_view_count(guide)

    research = Research.cached_research_map(entries, guide.destination)

    og = %{
      title: "#{guide.title} — an Ethos guide",
      description: "#{guide.destination} · #{length(entries)} places and tips from a real trip",
      image: guide.og_image_path && url(~p"/#{guide.og_image_path}"),
      type: "article",
      url: url(~p"/g/#{guide.slug}")
    }

    render(conn, :show, guide: guide, entries: entries, research: research, page_og: og)
  end

  # Fly machines (and any other ephemeral filesystem) can lose the generated
  # OG PNG between deploys/restarts even though `og_image_path` is still set
  # in the DB. Regenerate lazily — and only when needed — rather than
  # rendering a broken og:image link. Best-effort: on failure we just render
  # without an image.
  defp ensure_og_image(%Guide{og_image_path: nil} = guide), do: guide

  defp ensure_og_image(%Guide{og_image_path: path} = guide) do
    full_path = Path.join(:code.priv_dir(:ethos) |> to_string(), Path.relative_to(path, ""))

    if File.exists?(full_path) do
      guide
    else
      case Ethos.OGCard.generate(guide) do
        {:ok, updated_guide} -> updated_guide
        {:error, _reason} -> guide
      end
    end
  end

  def research(conn, %{"slug" => slug, "entry_id" => entry_id}) do
    guide = Guides.get_published_guide_by_slug!(slug)
    entry = Guides.get_entry!(guide, entry_id)
    user = conn.assigns.current_user

    conn =
      cond do
        not is_nil(Research.cached_research(entry.name, guide.destination)) ->
          conn

        not Research.RateLimiter.allow?(user.id) ->
          put_flash(conn, :error, "Research limit reached — try again in an hour.")

        match?({:ok, _}, Research.research(entry.name, guide.destination)) ->
          conn

        true ->
          put_flash(conn, :error, "Couldn't fetch fresh info for #{entry.name}.")
      end

    redirect(conn, to: ~p"/g/#{guide.slug}" <> "#entry-#{entry.id}")
  end
end
