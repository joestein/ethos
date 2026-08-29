defmodule EthosWeb.CollectionController do
  use EthosWeb, :controller

  alias Ethos.Collections
  alias EthosWeb.StructuredData

  def show(conn, %{"slug" => slug}) do
    case Collections.get_published_by_slug(slug) do
      nil ->
        conn |> put_status(:not_found) |> put_view(EthosWeb.ErrorHTML) |> render(:"404")

      collection ->
        meta_description = EthosWeb.Markdown.excerpt(collection.intro, 160) || collection.title

        render(conn, :show,
          collection: collection,
          page_title: collection.title,
          page_meta_description: meta_description,
          page_canonical: url(~p"/c/#{collection.slug}"),
          json_ld: [collection_ld(collection), breadcrumb_ld(collection)]
        )
    end
  end

  defp collection_ld(collection) do
    StructuredData.collection_page(collection.title, url(~p"/c/#{collection.slug}"),
      has_part:
        Enum.map(collection.items, fn item ->
          %{
            "@type" => "Article",
            "headline" => item.guide.title,
            "url" => url(~p"/g/#{item.guide.slug}")
          }
        end)
    )
  end

  defp breadcrumb_ld(collection) do
    StructuredData.breadcrumb(
      StructuredData.root_crumbs() ++
        [%{name: collection.title, url: url(~p"/c/#{collection.slug}")}]
    )
  end
end
