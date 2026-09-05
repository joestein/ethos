defmodule EthosWeb.FoliageController do
  use EthosWeb, :controller

  alias Ethos.Foliage
  alias EthosWeb.StructuredData

  @title "Connecticut Foliage Forecast"
  @description "When Connecticut's leaves turn, town by town — derived from the state's own foliage map and joined to a guide for each of the 169 towns."

  def index(conn, params) do
    week = week_param(params)

    render(conn, :index,
      week: week,
      weeks: Foliage.weeks(),
      towns: Foliage.towns(),
      routes: Foliage.routes(),
      note: Foliage.latest_note("statewide"),
      counties: counties(),
      page_title: @title,
      page_meta_description: @description,
      # Every ?week= variant points at the bare URL: nine views of one page,
      # not nine pages.
      page_canonical: url(~p"/foliage"),
      page_og: %{
        title: @title,
        description: @description,
        type: "website",
        url: url(~p"/foliage"),
        image: StructuredData.absolute_url("uploads/og/foliage.png")
      },
      json_ld: [dataset_ld()]
    )
  end

  def route(conn, %{"route_slug" => slug} = params) do
    case Foliage.route(slug) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(EthosWeb.ErrorHTML)
        |> render(:"404")

      route ->
        week = week_param(params)
        stops = Enum.map(route.stops, &%{stop: &1, town: Foliage.town(&1.town_slug)})
        title = "#{route.name} — Connecticut foliage route"

        description =
          "The #{route.name} foliage route passes through #{length(stops)} Connecticut towns. When each one turns, and what is in it."

        render(conn, :route,
          route: route,
          stops: stops,
          week: week,
          weeks: Foliage.weeks(),
          note: Foliage.latest_note("route", route.slug),
          page_title: title,
          page_meta_description: description,
          page_canonical: url(~p"/foliage/#{route.slug}"),
          page_og: %{
            title: title,
            description: description,
            type: "website",
            url: url(~p"/foliage/#{route.slug}"),
            image: StructuredData.absolute_url("uploads/og/foliage.png")
          },
          json_ld: [trip_ld(route, stops)]
        )
    end
  end

  defp trip_ld(route, stops) do
    %{
      "@context" => "https://schema.org",
      "@type" => "TouristTrip",
      "name" => route.name,
      "description" => Foliage.attribution(),
      "url" => url(~p"/foliage/#{route.slug}"),
      "itinerary" => %{
        "@type" => "ItemList",
        "numberOfItems" => length(stops),
        "itemListElement" =>
          stops
          |> Enum.with_index(1)
          |> Enum.map(fn {%{stop: stop, town: town}, position} ->
            %{
              "@type" => "ListItem",
              "position" => position,
              "item" => %{
                "@type" => "TouristDestination",
                "name" => town.name,
                "url" => url(~p"/g/#{stop.guide_slug}")
              }
            }
          end)
      }
    }
  end

  def embed(conn, params) do
    conn
    # The default secure headers forbid framing, which is the one thing an
    # embed must permit. Nothing on this page is interactive or authenticated.
    |> delete_resp_header("x-frame-options")
    |> put_resp_header("content-security-policy", "frame-ancestors *")
    |> put_root_layout(false)
    |> put_layout(false)
    |> render(:embed, week: week_param(params))
  end

  @doc false
  def week_param(%{"week" => raw}) do
    case Integer.parse(to_string(raw)) do
      {n, _} when n in 1..9 -> n
      _ -> Foliage.current_week_index()
    end
  end

  def week_param(_), do: Foliage.current_week_index()

  defp counties do
    Foliage.towns()
    |> Enum.group_by(& &1.county)
    |> Enum.map(fn {county, towns} ->
      %{
        name: county,
        town_count: length(towns),
        peak:
          towns |> Enum.map(& &1.peak_week) |> median() |> Foliage.week() |> Map.fetch!(:label)
      }
    end)
    |> Enum.sort_by(& &1.name)
  end

  defp median(values) do
    sorted = Enum.sort(values)
    Enum.at(sorted, div(length(sorted), 2))
  end

  defp dataset_ld do
    %{
      "@context" => "https://schema.org",
      "@type" => "Dataset",
      "name" => @title,
      "description" => Foliage.attribution(),
      "spatialCoverage" => %{"@type" => "Place", "name" => "Connecticut"},
      "isBasedOn" => "https://portal.ct.gov/DEEP/Forestry/Foliage/Connecticuts-Fall-Foliage",
      "creator" => StructuredData.publisher(),
      "url" => url(~p"/foliage")
    }
  end
end
