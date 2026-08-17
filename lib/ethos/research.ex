defmodule Ethos.Research do
  import Ecto.Query, warn: false
  alias Ethos.Repo
  alias Ethos.Research.CacheEntry

  @research_ttl_days 7

  def enrich_place(name, destination) do
    key = cache_key("enrichment", name, destination)

    cache_first(key, "enrichment", :infinity, fn ->
      with {:ok, results} <- Ethos.Exa.impl().search("#{name} #{destination}", num_results: 3) do
        {:ok,
         %{
           "official_url" => results |> List.first(%{}) |> Map.get(:url),
           "links" => Enum.map(results, &%{"title" => &1.title, "url" => &1.url}),
           "source" => "exa",
           "fetched_at" => DateTime.to_iso8601(DateTime.utc_now())
         }}
      end
    end)
  end

  def research(entry_name, destination) do
    key = cache_key("research", entry_name, destination)

    cache_first(key, "research", @research_ttl_days, fn ->
      query = "#{entry_name} #{destination} hours open reviews"

      with {:ok, results} <- Ethos.Exa.impl().search(query, num_results: 3) do
        {:ok,
         %{
           "results" =>
             Enum.map(results, &%{"title" => &1.title, "url" => &1.url, "snippet" => &1.snippet}),
           "fetched_at" => DateTime.to_iso8601(DateTime.utc_now())
         }}
      end
    end)
  end

  def cached_research(entry_name, destination) do
    case fresh_entry(cache_key("research", entry_name, destination), @research_ttl_days) do
      nil -> nil
      entry -> entry.payload
    end
  end

  @doc """
  Batched version of `cached_research/2` for rendering a whole guide page without
  running one cache query per entry. Returns `%{entry.id => payload_or_nil}`.
  """
  def cached_research_map(entries, destination) do
    keys_by_id =
      Map.new(entries, fn entry -> {entry.id, cache_key("research", entry.name, destination)} end)

    keys = keys_by_id |> Map.values() |> Enum.uniq()
    cutoff = DateTime.add(DateTime.utc_now(), -@research_ttl_days, :day)

    payload_by_key =
      from(c in CacheEntry,
        where: c.kind == "research" and c.key in ^keys and c.fetched_at > ^cutoff,
        select: {c.key, c.payload}
      )
      |> Repo.all()
      |> Map.new()

    Map.new(keys_by_id, fn {id, key} -> {id, Map.get(payload_by_key, key)} end)
  end

  @doc "Up to 3 exa queries for gap-fill candidates. Returns a flat candidate list."
  def destination_candidates(destination, kinds) when is_list(kinds) do
    kinds
    |> Enum.take(3)
    |> Enum.flat_map(fn kind ->
      key = cache_key("gap_fill", kind, destination)

      case cache_first(key, "gap_fill", :infinity, fn ->
             with {:ok, results} <-
                    Ethos.Exa.impl().search("best #{kind} #{destination}", num_results: 5) do
               {:ok,
                %{
                  "results" =>
                    Enum.map(
                      results,
                      &%{"title" => &1.title, "url" => &1.url, "snippet" => &1.snippet}
                    )
                }}
             end
           end) do
        {:ok, %{"results" => results}} -> Enum.map(results, &Map.put(&1, "kind_hint", kind))
        _ -> []
      end
    end)
  end

  defp cache_key(kind, a, b) do
    normalize = fn s ->
      s |> String.downcase() |> String.replace(~r/\s+/, " ") |> String.trim()
    end

    "#{kind}:#{normalize.(a)}:#{normalize.(b)}"
  end

  defp cache_first(key, kind, ttl, fetch_fun) do
    case fresh_entry(key, ttl) do
      %CacheEntry{payload: payload} ->
        {:ok, payload}

      nil ->
        with {:ok, payload} <- fetch_fun.() do
          Repo.insert!(
            %CacheEntry{
              key: key,
              kind: kind,
              payload: payload,
              fetched_at: DateTime.truncate(DateTime.utc_now(), :second)
            },
            on_conflict: {:replace, [:payload, :fetched_at]},
            conflict_target: :key
          )

          {:ok, payload}
        end
    end
  end

  defp fresh_entry(key, ttl) do
    case Repo.get_by(CacheEntry, key: key) do
      nil ->
        nil

      entry ->
        case ttl do
          :infinity ->
            entry

          days ->
            if DateTime.compare(entry.fetched_at, DateTime.add(DateTime.utc_now(), -days, :day)) ==
                 :gt,
               do: entry,
               else: nil
        end
    end
  end
end
