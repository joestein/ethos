defmodule Ethos.HouseAdTest do
  # load!/0 writes to :persistent_term, which is process-global rather than
  # sandboxed per test. The "resolves a seeded pool town" test below calls
  # load!/0, which would race any other test in this file (or, if this file
  # ever ran concurrently with another that reads Ethos.HouseAd.pool/0) under
  # async: true. Keeping the file async: false trades a little wall-clock
  # time for the guarantee that nothing else observes a pool mid-mutation.
  use Ethos.DataCase, async: false

  import ExUnit.CaptureLog

  alias Ethos.HouseAd

  defp photo(attrs \\ %{}) do
    Map.merge(
      %{
        "src" => "/photos/ct/avon/x.jpg",
        "thumb" => "/photos/ct/avon/x.jpg",
        "title" => "A church",
        "author" => "Daderot",
        "license" => "CC0",
        "source_url" => "https://commons.wikimedia.org/wiki/File:X.jpg"
      },
      attrs
    )
  end

  describe "usable?/1" do
    test "accepts a photo with an author and a licence" do
      assert HouseAd.usable?(photo())
    end

    test "rejects a photo with no author" do
      refute HouseAd.usable?(photo(%{"author" => ""}))
      refute HouseAd.usable?(Map.delete(photo(), "author"))
    end

    test "rejects a photo with no licence" do
      # 420 of the 477 Connecticut photographs are CC BY or CC BY-SA. Rendering
      # one without its licence is a licence breach, not a cosmetic gap.
      refute HouseAd.usable?(photo(%{"license" => ""}))
      refute HouseAd.usable?(Map.delete(photo(), "license"))
    end

    test "rejects a non-map" do
      refute HouseAd.usable?(nil)
      refute HouseAd.usable?("photo")
    end
  end

  describe "pick/2" do
    setup do
      %{pool: Enum.map(1..5, fn i -> photo(%{"title" => "photo #{i}"}) end)}
    end

    test "returns nil for an empty pool" do
      assert HouseAd.pick("/anything", []) == nil
    end

    test "is deterministic for a given key", %{pool: pool} do
      assert HouseAd.pick("/g/avon-ct-travel-guide", pool) ==
               HouseAd.pick("/g/avon-ct-travel-guide", pool)
    end

    test "varies across keys", %{pool: pool} do
      picks = Enum.map(1..40, &HouseAd.pick("/page/#{&1}", pool))
      assert length(Enum.uniq(picks)) > 1
    end

    test "always returns a member of the pool", %{pool: pool} do
      for i <- 1..40, do: assert(HouseAd.pick("/page/#{i}", pool) in pool)
    end

    test "handles a nil key without raising" do
      assert HouseAd.pick(nil, [photo()]) == photo()
    end
  end

  describe "pool/0" do
    test "returns a list even when nothing has been loaded" do
      assert is_list(HouseAd.pool())
    end
  end

  describe "pool/0 after load!/0" do
    setup do
      # `load!/0` writes to :persistent_term, which is global and outside the
      # Ecto sandbox — the DB transaction rolls back but the pool does not.
      # Restore it so later test files see the boot-time value.
      previous = Ethos.HouseAd.pool()
      on_exit(fn -> :persistent_term.put({Ethos.HouseAd, :pool}, previous) end)
      :ok
    end

    test "resolves a seeded pool town to its photograph" do
      # The pool loads at boot, before any test data exists, so asserting over
      # pool/0 as-loaded would be vacuously true. Seed a real pool town and
      # reload so this exercises build_pool/0 rather than an empty list.
      guide =
        Ethos.GuidesFixtures.published_guide_fixture(%{
          title: "Litchfield",
          destination: "Litchfield, Connecticut",
          state: "Connecticut",
          county: "Litchfield County"
        })

      {:ok, _} =
        Ethos.Guides.update_guide_photos(guide, [
          %{
            "src" => "/photos/ct/litchfield/green.jpg",
            "thumb" => "/photos/ct/litchfield/green.jpg",
            "title" => "Litchfield Green",
            "description" => "The green.",
            "author" => "Someone",
            "license" => "CC BY-SA 4.0",
            "source_url" => "https://commons.wikimedia.org/wiki/File:Litchfield.jpg"
          }
        ])

      log =
        capture_log(fn ->
          assert :ok = Ethos.HouseAd.load!()
        end)

      # Only Litchfield is seeded, so build_pool/0 takes the "some slugs
      # resolved, some did not" branch and warns by name about the rest. That
      # is drift worth an operator's attention in production, but it fired on
      # every `mix test` run when this test seeded only one town — this
      # assertion turns the noise into coverage of the drift branch instead of
      # silencing it blind.
      assert log =~ "house ad: no published guide for"
      assert log =~ "kent"

      pool = Ethos.HouseAd.pool()
      assert pool != []
      assert Enum.all?(pool, &Ethos.HouseAd.usable?/1)
      assert Enum.any?(pool, &(&1["title"] == "Litchfield Green"))
    end
  end

  describe "build_pool/0 when the database is unavailable" do
    setup do
      previous = Ethos.HouseAd.pool()
      on_exit(fn -> :persistent_term.put({Ethos.HouseAd, :pool}, previous) end)
      :ok
    end

    test "load!/0 still returns :ok and pool/0 degrades to [], rather than crashing boot" do
      # Ethos.HouseAd starts before EthosWeb.Endpoint in the supervision tree
      # (lib/ethos/application.ex). A raising query here must not propagate,
      # or Supervisor.start_link/2 fails and the whole site — including the
      # database-free /foliage pages — never boots.
      #
      # Forcing the sandbox to :manual mode strips this test process of the
      # connection ownership the case-wide `shared: true` setup granted it, so
      # `Repo.all` inside `build_pool/0` raises `DBConnection.OwnershipError`
      # exactly as it would against an unreachable production database — no
      # mock needed to exercise the real rescue clause.
      Ecto.Adapters.SQL.Sandbox.mode(Ethos.Repo, :manual)

      log = capture_log(fn -> assert :ok = Ethos.HouseAd.load!() end)

      assert log =~ "house ad: pool could not be loaded"
      assert Ethos.HouseAd.pool() == []
    end
  end
end
