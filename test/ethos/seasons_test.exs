defmodule Ethos.SeasonsTest do
  @moduledoc """
  Boundaries, exhaustively. Every season's first and last day, and the day
  either side of it — off-by-one at a season boundary is the whole risk in a
  function this small, and it would show up in production exactly once a
  quarter.
  """
  use ExUnit.Case, async: true

  alias Ethos.Seasons

  describe "current/1 at each boundary" do
    test "spring runs Mar 20 to May 31" do
      assert Seasons.current(~D[2026-03-19]) == :winter
      assert Seasons.current(~D[2026-03-20]) == :spring
      assert Seasons.current(~D[2026-05-31]) == :spring
      assert Seasons.current(~D[2026-06-01]) == :summer
    end

    test "summer runs Jun 1 to Sep 21" do
      assert Seasons.current(~D[2026-05-31]) == :spring
      assert Seasons.current(~D[2026-06-01]) == :summer
      assert Seasons.current(~D[2026-09-21]) == :summer
      assert Seasons.current(~D[2026-09-22]) == :autumn
    end

    test "autumn runs Sep 22 to Nov 30" do
      assert Seasons.current(~D[2026-09-21]) == :summer
      assert Seasons.current(~D[2026-09-22]) == :autumn
      assert Seasons.current(~D[2026-11-30]) == :autumn
      assert Seasons.current(~D[2026-12-01]) == :winter
    end

    test "winter wraps the year end" do
      assert Seasons.current(~D[2026-11-30]) == :autumn
      assert Seasons.current(~D[2026-12-01]) == :winter
      assert Seasons.current(~D[2026-12-31]) == :winter
      assert Seasons.current(~D[2027-01-01]) == :winter
      assert Seasons.current(~D[2027-03-19]) == :winter
      assert Seasons.current(~D[2027-03-20]) == :spring
    end
  end

  test "today is summer, and the site turns autumn on September 22" do
    # The dates this plan was written against. If someone shifts a boundary,
    # this is the test that says what the shift means in plain terms.
    assert Seasons.current(~D[2026-09-06]) == :summer
    assert Seasons.current(~D[2026-09-22]) == :autumn
  end

  test "every day of a leap year resolves to exactly one season" do
    # 2028 is a leap year: Feb 29 must not fall through the winter clauses.
    for d <- Date.range(~D[2028-01-01], ~D[2028-12-31]) do
      assert Seasons.current(d) in Seasons.all(),
             "#{d} resolved to something that is not a season"
    end

    assert Seasons.current(~D[2028-02-29]) == :winter
  end

  test "all/0 and valid?/1 agree" do
    assert Seasons.all() == [:spring, :summer, :autumn, :winter]
    for s <- Seasons.all(), do: assert(Seasons.valid?(s))
    refute Seasons.valid?(:monsoon)
    refute Seasons.valid?("summer")
  end
end
