defmodule Ethos.ResearchTest do
  use Ethos.DataCase, async: false
  import Mox

  alias Ethos.Research

  setup :verify_on_exit!
  setup :set_mox_from_context

  test "enrich_place/2 calls exa once then serves from cache forever" do
    expect(Ethos.ExaMock, :search, 1, fn "Ramiro Lisbon, Portugal", _opts ->
      {:ok, [%{title: "Ramiro", url: "https://cervejariaramiro.pt", snippet: "seafood"}]}
    end)

    assert {:ok, %{"official_url" => "https://cervejariaramiro.pt"}} =
             Research.enrich_place("Ramiro", "Lisbon, Portugal")

    # Second call must NOT hit exa (expect count above is 1)
    assert {:ok, %{"official_url" => "https://cervejariaramiro.pt"}} =
             Research.enrich_place("ramiro", "Lisbon, Portugal")
  end

  test "research/2 refetches after the 7-day TTL" do
    expect(Ethos.ExaMock, :search, 2, fn _query, _opts ->
      {:ok, [%{title: "News", url: "https://example.com", snippet: "still open"}]}
    end)

    assert {:ok, _} = Research.research("Ramiro", "Lisbon")
    # age the cache row past TTL
    Ethos.Repo.update_all(Ethos.Research.CacheEntry,
      set: [fetched_at: DateTime.add(DateTime.utc_now(), -8, :day) |> DateTime.truncate(:second)]
    )

    assert {:ok, _} = Research.research("Ramiro", "Lisbon")
  end

  test "cached_research/2 returns nil without fetching" do
    assert Research.cached_research("Nowhere", "Lisbon") == nil
  end

  test "rate limiter allows 10 then denies" do
    Ethos.Research.RateLimiter.reset(42)
    results = for _ <- 1..11, do: Ethos.Research.RateLimiter.allow?(42)
    assert Enum.count(results, & &1) == 10
    assert List.last(results) == false
  end

  test "cached_research_map/2 batches lookups for multiple entries" do
    expect(Ethos.ExaMock, :search, 2, fn _query, _opts ->
      {:ok, [%{title: "News", url: "https://example.com", snippet: "still open"}]}
    end)

    fresh = %{id: 1, name: "Ramiro"}
    stale = %{id: 2, name: "Old Place"}
    missing = %{id: 3, name: "Nowhere"}

    assert {:ok, _} = Research.research(fresh.name, "Lisbon")
    assert {:ok, _} = Research.research(stale.name, "Lisbon")

    Ethos.Repo.update_all(
      from(c in Ethos.Research.CacheEntry, where: c.key == ^"research:old place:lisbon"),
      set: [fetched_at: DateTime.add(DateTime.utc_now(), -8, :day) |> DateTime.truncate(:second)]
    )

    result = Research.cached_research_map([fresh, stale, missing], "Lisbon")

    assert %{1 => %{"results" => [%{"title" => "News"}]}, 2 => nil, 3 => nil} = result
  end
end
