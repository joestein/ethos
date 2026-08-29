defmodule EthosWeb.StructuredData do
  @moduledoc """
  Builders for the schema.org JSON-LD the site emits.

  Before this module every controller hand-built its own maps, and six of the
  eight breadcrumb builders wrote literal `position` integers. Positions are
  derived here, in `breadcrumb/1`, and nowhere else.

  Historically that duplication did bite: a hardcoded `"position" => 5` once
  survived in the photos breadcrumb after the trail grew a county crumb, and
  went unnoticed until earlier destination-pages work found it. By the time
  this module landed the photos builder had already been fixed to compute
  `length(parents) + 1`, so the bug is history rather than a description of the
  code replaced here — but it is why positions are derived in one place.
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

  @doc """
  A CollectionPage for a hub that lists other pages.

  `:description` and `:has_part` are both optional and are omitted from the
  emitted map when nil, so a hub with neither ships just `name` and `url`.
  """
  def collection_page(name, page_url, opts \\ []) do
    %{"@context" => @context, "@type" => "CollectionPage", "name" => name, "url" => page_url}
    |> maybe_put("description", opts[:description])
    |> maybe_put("hasPart", opts[:has_part])
  end

  @doc "Absolutises a stored photo `src` such as `/photos/foo/bar.jpg`."
  def absolute_url(nil), do: nil
  def absolute_url(src), do: url(~p"/") <> String.trim_leading(src, "/")

  @doc """
  Puts `value` under `key` unless it is nil.

  Only nil is dropped — `false` and `[]` are real values and are kept, so an
  empty `hasPart` still ships as `[]` rather than vanishing.
  """
  def maybe_put(map, _key, nil), do: map
  def maybe_put(map, key, value), do: Map.put(map, key, value)
end
