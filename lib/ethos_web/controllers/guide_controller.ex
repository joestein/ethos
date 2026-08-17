defmodule EthosWeb.GuideController do
  use EthosWeb, :controller

  alias Ethos.{Guides, Research}

  def show(conn, %{"slug" => slug}) do
    guide = Guides.get_published_guide_by_slug!(slug)
    entries = Guides.list_entries(guide)
    Guides.increment_view_count(guide)

    research =
      Map.new(entries, fn entry ->
        {entry.id, Research.cached_research(entry.name, guide.destination)}
      end)

    og = %{
      title: "#{guide.title} — an Ethos guide",
      description: "#{guide.destination} · #{length(entries)} places and tips from a real trip",
      image: guide.og_image_path && url(~p"/#{guide.og_image_path}")
    }

    render(conn, :show, guide: guide, entries: entries, research: research, page_og: og)
  end

  def research(conn, %{"slug" => slug, "entry_id" => entry_id}) do
    guide = Guides.get_published_guide_by_slug!(slug)
    entry = Guides.get_entry!(guide, entry_id)
    user = conn.assigns.current_user

    conn =
      cond do
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
