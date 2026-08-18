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

    meta_description =
      EthosWeb.Markdown.excerpt(guide.intro, 160) ||
        "#{guide.destination} · #{length(entries)} places and tips from a real trip"

    has_booking = Enum.any?(entries, &EthosWeb.Url.safe_http?(&1.booking_url))

    json_ld =
      [article_ld(guide), breadcrumb_ld(guide)] ++
        if(guide.faq not in [nil, []], do: [faq_ld(guide)], else: [])

    render(conn, :show,
      guide: guide,
      entries: entries,
      research: research,
      page_og: og,
      page_meta_description: meta_description,
      page_canonical: url(~p"/g/#{guide.slug}"),
      json_ld: json_ld,
      has_booking: has_booking
    )
  end

  defp article_ld(guide) do
    %{
      "@context" => "https://schema.org",
      "@type" => "Article",
      "headline" => guide.title,
      "description" => EthosWeb.Markdown.excerpt(guide.intro, 160),
      "datePublished" => DateTime.to_iso8601(guide.inserted_at),
      "dateModified" => DateTime.to_iso8601(guide.updated_at),
      "author" => %{"@type" => "Person", "name" => "An Ethos traveler"},
      "mainEntityOfPage" => url(~p"/g/#{guide.slug}")
    }
  end

  defp faq_ld(guide) do
    %{
      "@context" => "https://schema.org",
      "@type" => "FAQPage",
      "mainEntity" =>
        Enum.map(guide.faq, fn %{"question" => q, "answer" => a} ->
          %{
            "@type" => "Question",
            "name" => q,
            "acceptedAnswer" => %{"@type" => "Answer", "text" => a}
          }
        end)
    }
  end

  defp breadcrumb_ld(guide) do
    %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => [
        %{"@type" => "ListItem", "position" => 1, "name" => "Ethos", "item" => url(~p"/")},
        %{
          "@type" => "ListItem",
          "position" => 2,
          "name" => "Destinations",
          "item" => url(~p"/destinations")
        },
        %{
          "@type" => "ListItem",
          "position" => 3,
          "name" => guide.destination |> String.split(",") |> List.first(),
          "item" => url(~p"/destinations/#{guide.destination_slug}")
        },
        %{
          "@type" => "ListItem",
          "position" => 4,
          "name" => guide.title,
          "item" => url(~p"/g/#{guide.slug}")
        }
      ]
    }
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
