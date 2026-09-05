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

  # The countries the roster holds, as ISO 3166-1 alpha-2. This is the whole
  # map, not a prefix of one: `country_code/1` raises on anything absent rather
  # than defaulting, because the value a default would produce is "US", and
  # "US" is exactly the wrong answer that this whole mechanism exists to stop
  # being published. A sixth country added to the tree must fail loudly here on
  # its first request, not ship a corpus of American addresses.
  #
  # "United Kingdom" carries GB — the ISO code — rather than anything derived
  # from "England". England is the jurisdiction of the National Heritage List
  # and is a `region` node in the tree, which is where it now belongs; it is not
  # a country in ISO terms and "EN" is a code no consumer recognises.
  #
  # "Vatican City" is a root `country` node with nothing below it, so a place
  # inside it has NO country ancestor — the node itself is the country. That is
  # why `country_code/1` searches the whole trail rather than the ancestors:
  # emitting IT for St Peter's would be the same class of error as the "US" this
  # replaced.
  @iso_alpha2 %{
    "United States" => "US",
    "Italy" => "IT",
    "Vatican City" => "VA",
    "United Kingdom" => "GB",
    "Canada" => "CA"
  }

  @doc """
  The ISO 3166-1 alpha-2 code for the country a destination trail sits in.

  `trail` is root-first with the node itself last — `Destinations.ancestors/1`
  plus the node — each entry anything answering to `.kind` and `.name`, which is
  the same shape `Ethos.Destinations.legacy_geo_from_trail/1` takes and lets the
  corpus gates feed it trails read straight off the roster JSON.

  Raises on a trail with no country node, and on a country the map does not
  know. Both are programmer errors that must not reach a search engine as a
  guess.
  """
  def country_code(trail) when is_list(trail) do
    case Enum.find(trail, &(&1.kind == "country")) do
      nil ->
        raise ArgumentError,
              "no country node in destination trail #{inspect(Enum.map(trail, & &1.name))}"

      %{name: name} ->
        case Map.fetch(@iso_alpha2, name) do
          {:ok, code} ->
            code

          :error ->
            raise ArgumentError,
                  "no ISO 3166-1 alpha-2 code for country #{inspect(name)} — add it to " <>
                    "EthosWeb.StructuredData's @iso_alpha2 rather than letting it default"
        end
    end
  end

  @doc """
  A `PostalAddress` for a place, from its free-text address and its node's
  ancestry trail.

  `nil` when there is no address at all, so callers can pipe it through
  `maybe_put/3`.

  `addressLocality` is the node's own name and `addressCountry` is
  `country_code/1` over the trail. Deriving the country from the tree rather
  than from the place's `state` column is what closes the defect this replaced:
  the column holds a US state name for American places and, since the tree
  landed, the *region* name for everywhere else — so a Roman place's state
  became "Lazio", the country lookup keyed on it missed, and `addressCountry`
  fell through to "US". Re-seeding would have told search engines the Pantheon
  and the Sistine Chapel are in the United States. A country ancestor is immune
  to what the region is called.

  `addressRegion` is the trail's nearest `region` node — Connecticut, Lazio,
  England, Ontario — or absent when there is none, as for a place in Vatican
  City. The predecessor dropped the region entirely for Italy and England,
  because in the single conflated `state` column those names stood in the
  *country* slot and emitting them beside a country code would have
  contradicted it. They no longer stand in for a country: the country is its own
  node, and a region node's name is a region.

  `streetAddress` is emitted only when `Ethos.Places.Address.parse/1` recovers a
  street line beginning with a house number. Everything else — a descriptive
  location ("Along Shore Road"), a cross-street clause, a multi-parcel note — is
  a true statement of where the place is and a false street address, so it ships
  locality, region and whatever postal code the text contains, and no street
  line. There is deliberately **no fallback to the raw address string**: that
  fallback was the bug this builder replaced, which published the locality and
  region twice, once inside the street line and once beside it. The whole
  address stays rendered on the page, which is where a human reads it.

  Locality comes from the tree rather than from the parse because the tree is
  authoritative and the parse is not — 840 of the corpus's 2,066 addressed
  places parse a locality that differs from the node they are filed under (a
  place in Bushwick whose address says "Brooklyn"). Only `postalCode` comes from
  the parse, because nothing else holds it.
  """
  def postal_address(nil, trail) when is_list(trail), do: nil

  def postal_address(address, [_ | _] = trail) do
    parsed = Ethos.Places.Address.parse(address)

    %{"@type" => "PostalAddress", "addressCountry" => country_code(trail)}
    |> maybe_put("streetAddress", parsed.street)
    |> maybe_put("addressLocality", List.last(trail).name)
    |> maybe_put("addressRegion", region_name(trail))
    |> maybe_put("postalCode", parsed.postal_code)
  end

  # Nearest-first, matching `Ethos.Destinations.legacy_geo_from_trail/1`. No
  # trail in the roster carries two region nodes, but reading from the leaf is
  # the rule everywhere else that walks one.
  defp region_name(trail) do
    trail
    |> Enum.reverse()
    |> Enum.find_value(fn d -> if d.kind == "region", do: d.name end)
  end

  @doc """
  `postal_address/2` for a place with no destination node.

  Transitional, and unreachable from the seeded corpus: every loader resolves a
  `destination_path` to a node and raises on a miss, so every place in
  production has one. `places.destination_id` is nullable, though, and test
  fixtures exercise the nodeless shape, so the legacy `town`/`state` columns
  remain the fallback until Task 12 drops them and this clause with them.

  Left exactly as it was, `@country_by_region` included, so nothing about the
  nodeless shape changes while it still exists. That map is why the defect above
  was possible: it is keyed on a *region* string, and the value the tree now
  derives for a Roman place is "Lazio", which it does not hold. Keyed on a
  country node, `country_code/1` cannot miss that way.
  """
  # A place's `state` holds a US state name for American destinations and the
  # country name for everywhere else. Until Rome landed, every destination was
  # American and `addressCountry` was the literal "US" — which meant the first
  # 122 addressed Roman places would have told search engines the Pantheon is
  # in the United States.
  #
  # A country name is not a region, so when one is matched here the region is
  # dropped rather than emitted: Italy is the country, and this column pair does
  # not carry Lazio. `addressLocality` still ships the rione.
  @country_by_region %{"Italy" => "IT", "Vatican City" => "VA", "England" => "GB"}

  def postal_address(nil, _locality, _region), do: nil

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
