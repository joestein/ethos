defmodule EthosWeb.GuideController do
  use EthosWeb, :controller

  alias Ethos.{Collections, Guides, Links, Research}
  alias Ethos.Guides.Guide
  alias EthosWeb.StructuredData

  def show(conn, %{"slug" => slug}) do
    guide = Guides.get_published_guide_by_slug!(slug) |> ensure_og_image()
    entries = Guides.list_entries(guide)
    Guides.increment_view_count(guide)

    research = Research.cached_research_map(entries, guide.destination)

    og = %{
      title: "#{guide.title} — an Ethos guide",
      description: "#{guide.destination} · #{length(entries)} places and tips from a real trip",
      # `~p` percent-encodes an interpolated segment, so building this tag from
      # `~p"/#{guide.og_image_path}"` published `/uploads%2Fog%2F<slug>.png` —
      # a path the static plug does not serve. `absolute_url/1` joins the same
      # way the Article node does, and is nil-safe, so the two properties now
      # name the same file and a guide without a card omits the tag as before.
      image: StructuredData.absolute_url(guide.og_image_path),
      type: "article",
      url: url(~p"/g/#{guide.slug}")
    }

    meta_description =
      EthosWeb.Markdown.excerpt(guide.intro, 160) ||
        "#{guide.destination} · #{length(entries)} places and tips from a real trip"

    json_ld =
      [article_ld(guide, meta_description), breadcrumb_ld(guide)] ++
        if(guide.faq not in [nil, []], do: [faq_ld(guide)], else: [])

    destination_name = guide.destination |> String.split(",") |> List.first()

    render(conn, template_for(guide),
      guide: guide,
      entries: entries,
      research: research,
      connected: Links.links_for("guide", guide.id),
      collections: Collections.collections_for_guide(guide),
      page_title: "#{guide.title} — #{destination_name} guide",
      page_og: og,
      page_meta_description: meta_description,
      page_canonical: url(~p"/g/#{guide.slug}"),
      json_ld: json_ld,
      foliage: foliage_assign(guide)
    )
  end

  defp template_for(%Guide{tier: "town-page"}), do: :town_page
  defp template_for(%Guide{}), do: :show

  @doc """
  Foliage context for a Connecticut town guide, or nil.

  Seasonal: out of season the guides should not carry a foliage block at all,
  so this returns nil rather than the template hiding a populated one.
  """
  def foliage_assign(guide, today \\ Date.utc_today())

  def foliage_assign(%Guide{tier: "town-page", state_slug: "connecticut"} = guide, today) do
    with true <- Ethos.Foliage.in_season?(today),
         town when not is_nil(town) <- Ethos.Foliage.town(guide.destination_slug) do
      week = Ethos.Foliage.current_week_index(today)

      %{
        town: town,
        week: week,
        stage: Ethos.Foliage.stage_at(town, week),
        route:
          Enum.find(Ethos.Foliage.routes(), fn route ->
            Enum.any?(route.stops, &(&1.town_slug == town.slug))
          end)
      }
    else
      _ -> nil
    end
  end

  def foliage_assign(%Guide{}, _today), do: nil

  # `image` comes from the `og_image_path` that `ensure_og_image/1` already
  # resolved above — so a guide whose stored PNG went missing publishes the
  # regenerated card rather than a dead link, and a guide that has no card at
  # all omits the property instead of shipping a null. `absolute_url/1` is
  # nil-safe, so the omission needs no branch of its own.
  #
  # `publisher` is the shared Organization node, nested without its own
  # `@context` — see `StructuredData.publisher/0`.
  defp article_ld(guide, fallback_description) do
    %{
      "@context" => "https://schema.org",
      "@type" => "Article",
      "headline" => guide.title,
      "description" => EthosWeb.Markdown.excerpt(guide.intro, 160) || fallback_description,
      "datePublished" => DateTime.to_iso8601(guide.inserted_at),
      "dateModified" => DateTime.to_iso8601(guide.updated_at),
      "author" => %{"@type" => "Person", "name" => "An Ethos traveler"},
      "publisher" => StructuredData.publisher(),
      "mainEntityOfPage" => url(~p"/g/#{guide.slug}")
    }
    |> StructuredData.maybe_put("image", StructuredData.absolute_url(guide.og_image_path))
  end

  defp faq_ld(guide) do
    %{
      "@context" => "https://schema.org",
      "@type" => "FAQPage",
      "mainEntity" =>
        Enum.map(guide.faq, fn item ->
          %{
            "@type" => "Question",
            "name" => Map.get(item, "question", ""),
            "acceptedAnswer" => %{
              "@type" => "Answer",
              "text" => Map.get(item, "answer", "")
            }
          }
        end)
    }
  end

  # Mirrors the visible breadcrumb on the guide page — same segments, same
  # order — by walking the same trail. Guides without a county (or without any
  # geography) simply produce a shorter list rather than a nil-slug link.
  defp breadcrumb_ld(guide), do: StructuredData.breadcrumb(guide_trail(guide))

  defp guide_trail(guide) do
    StructuredData.root_crumbs() ++
      Enum.map(EthosWeb.GuideBreadcrumb.trail(guide), fn crumb ->
        %{name: crumb.name, url: unverified_url(EthosWeb.Endpoint, crumb.path)}
      end) ++
      [%{name: guide.title, url: url(~p"/g/#{guide.slug}")}]
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

  def photos(conn, %{"slug" => slug}) do
    case Guides.get_published_guide_by_slug(slug) do
      %Guide{photos: photos} = guide when photos not in [nil, []] ->
        destination_name = destination_name(guide)
        page_title = "Pictures from #{destination_name} — #{guide.title}"

        page_meta_description =
          "Photos from #{destination_name} — #{guide.title}, a real Ethos trip guide."

        first_photo = List.first(photos)

        og = %{
          title: page_title,
          description: page_meta_description,
          image: StructuredData.absolute_url(first_photo["src"]),
          type: "website",
          url: url(~p"/g/#{guide.slug}/photos")
        }

        render(conn, :photos,
          guide: guide,
          photos: photos,
          page_title: page_title,
          page_og: og,
          page_meta_description: page_meta_description,
          page_canonical: url(~p"/g/#{guide.slug}/photos"),
          json_ld: [photos_breadcrumb_ld(guide), gallery_ld(guide)]
        )

      _ ->
        conn
        |> put_status(:not_found)
        |> put_view(EthosWeb.ErrorHTML)
        |> render(:"404")
    end
  end

  defp destination_name(guide), do: guide.destination |> String.split(",") |> List.first()

  defp photos_breadcrumb_ld(guide) do
    StructuredData.breadcrumb(
      guide_trail(guide) ++
        [%{name: "Photos", url: url(~p"/g/#{guide.slug}/photos")}]
    )
  end

  defp gallery_ld(guide) do
    %{
      "@context" => "https://schema.org",
      "@type" => "ImageGallery",
      "name" => "Pictures from #{destination_name(guide)} — #{guide.title}",
      "url" => url(~p"/g/#{guide.slug}/photos"),
      "image" =>
        Enum.map(guide.photos, fn p ->
          %{
            "@type" => "ImageObject",
            "name" => p["title"],
            "description" => p["description"],
            "contentUrl" => StructuredData.absolute_url(p["src"]),
            "thumbnailUrl" => StructuredData.absolute_url(p["thumb"])
          }
        end)
    }
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
