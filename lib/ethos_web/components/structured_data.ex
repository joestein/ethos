defmodule EthosWeb.StructuredData do
  @moduledoc """
  Builders for the schema.org JSON-LD the site emits.

  Before this module every controller hand-built its own maps, and five of the
  six breadcrumb builders wrote literal `position` integers — which is how a
  hardcoded `position => 5` survived in the photos breadcrumb until the
  destination-pages work found it. Positions are derived here and nowhere else.
  """

  use Phoenix.VerifiedRoutes, endpoint: EthosWeb.Endpoint, router: EthosWeb.Router

  @context "https://schema.org"

  @doc "A BreadcrumbList from an ordered trail of `%{name:, url:}`."
  def breadcrumb(crumbs) when is_list(crumbs) do
    %{
      "@context" => @context,
      "@type" => "BreadcrumbList",
      "itemListElement" =>
        crumbs
        |> Enum.with_index(1)
        |> Enum.map(fn {crumb, position} ->
          %{
            "@type" => "ListItem",
            "position" => position,
            "name" => crumb.name,
            "item" => crumb.url
          }
        end)
    }
  end

  @doc "The two crumbs every trail on the site starts with."
  def root_crumbs do
    [
      %{name: "Ethos", url: url(~p"/")},
      %{name: "Destinations", url: url(~p"/destinations")}
    ]
  end

  def collection_page(name, page_url, opts \\ []) do
    %{"@context" => @context, "@type" => "CollectionPage", "name" => name, "url" => page_url}
    |> maybe_put("description", opts[:description])
    |> maybe_put("hasPart", opts[:has_part])
  end

  @doc "Absolutises a stored photo `src` such as `/photos/foo/bar.jpg`."
  def absolute_url(nil), do: nil
  def absolute_url(src), do: url(~p"/") <> String.trim_leading(src, "/")

  def maybe_put(map, _key, nil), do: map
  def maybe_put(map, key, value), do: Map.put(map, key, value)
end
