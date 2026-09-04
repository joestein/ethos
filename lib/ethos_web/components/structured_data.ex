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
  @site_name "Ethos"

  @doc """
  The site's `Organization`, for top-level emission on the home page.

  `publisher/0` is the same node without `@context`, for nesting.
  """
  def organization, do: with_context(publisher())

  @doc """
  The site's `Organization` as a **nested** node — no `@context`.

  This is the node other pages hang off `publisher`. JSON-LD only needs
  `@context` once, at the top of the document it is declared in, so a nested
  copy would be redundant noise; `organization/0` adds it back for the one
  place that emits the Organization in its own right.

  `logo` is an SVG. That is valid schema.org, but Google's logo rich result
  documents JPG/PNG/GIF — an SVG may simply not earn that treatment. The site
  has no raster logo to point at yet, and producing one is a design task, not
  a metadata one.
  """
  def publisher do
    %{
      "@type" => "Organization",
      "name" => @site_name,
      "url" => url(~p"/"),
      "logo" => static_url(EthosWeb.Endpoint, "/images/logo.svg")
    }
  end

  @doc """
  The site's `WebSite`, carrying the `SearchAction` for sitelinks search.

  The `urlTemplate` is built from `~p"/search"` and the `q` parameter that
  `EthosWeb.SearchController.index/2` actually reads, so a rename on either
  side breaks the build or the test rather than silently publishing a search
  endpoint that answers nothing.
  """
  def website do
    with_context(%{
      "@type" => "WebSite",
      "name" => @site_name,
      "url" => url(~p"/"),
      "potentialAction" => %{
        "@type" => "SearchAction",
        "target" => %{
          "@type" => "EntryPoint",
          "urlTemplate" => url(~p"/search") <> "?q={search_term_string}"
        },
        "query-input" => "required name=search_term_string"
      }
    })
  end

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

  @doc """
  A `PostalAddress` for a place, decomposed from its free-text address.

  `nil` when there is no address at all, so callers can pipe it through
  `maybe_put/3`.

  `streetAddress` is emitted only when `Ethos.Places.Address.parse/1` recovers a
  street line beginning with a house number. Everything else — a descriptive
  location ("Along Shore Road"), a cross-street clause, a multi-parcel note — is
  a true statement of where the place is and a false street address, so it ships
  locality, region and whatever postal code the text contains, and no street
  line. There is deliberately **no fallback to the raw address string**: that
  fallback was the bug this builder replaced, which published the locality and
  region twice, once inside the street line and once beside it. The whole
  address stays rendered on the page, which is where a human reads it.

  `locality` and `region` are passed in from the caller's `town` and `state`
  columns rather than taken from the parse, because the columns are
  authoritative and the parse is not — 840 of the corpus's 2,066 addressed
  places have a parsed locality that differs from their town (a place in
  Bushwick whose address says "Brooklyn"). Only `postalCode` comes from the
  parse, because no column holds it.
  """
  def postal_address(nil, _locality, _region), do: nil

  # A place's `state` holds a US state name for American destinations and the
  # country name for everywhere else. Until Rome landed, every destination was
  # American and `addressCountry` was the literal "US" — which meant the first
  # 122 addressed Roman places would have told search engines the Pantheon is
  # in the United States.
  #
  # A country name is not a region, so when one is matched here the region is
  # dropped rather than emitted: Italy is the country, and the corpus does not
  # carry Lazio. `addressLocality` still ships the rione.
  # "Vatican City" is here for the same reason the whole map is: a place inside
  # it is not in Italy, and emitting IT for St Peter's would be the same class
  # of error as the hardcoded "US" this replaced. The corpus carries it as its
  # own state because it is a sovereign one — it routes to its own destination
  # rather than under Rome, which is correct and is why the Rome seed gate
  # exempts that one file from its Italy/Rome assertion.
  # "England" carries GB, the ISO code for the United Kingdom. England is the
  # jurisdiction of the National Heritage List, which is why the corpus uses it
  # as the region — but it is not a country in ISO terms, and emitting "EN"
  # would be a code no consumer recognises.
  @country_by_region %{"Italy" => "IT", "Vatican City" => "VA", "England" => "GB"}

  def postal_address(address, locality, region) do
    parsed = Ethos.Places.Address.parse(address)

    {country, region} =
      case Map.fetch(@country_by_region, region) do
        {:ok, code} -> {code, nil}
        :error -> {"US", region}
      end

    %{"@type" => "PostalAddress", "addressCountry" => country}
    |> maybe_put("streetAddress", parsed.street)
    |> maybe_put("addressLocality", locality)
    |> maybe_put("addressRegion", region)
    |> maybe_put("postalCode", parsed.postal_code)
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

  defp with_context(node), do: Map.put(node, "@context", @context)
end
