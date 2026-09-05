defmodule Ethos.Accounts.UsernameTest do
  use ExUnit.Case, async: true

  alias Ethos.Accounts.Username

  describe "normalize/1" do
    test "downcases and trims" do
      assert Username.normalize("  BuoEwe  ") == "buoewe"
    end

    test "passes non-binaries through untouched" do
      assert Username.normalize(nil) == nil
    end
  end

  describe "rules" do
    test "length bounds are 3 and 20" do
      assert Username.min_length() == 3
      assert Username.max_length() == 20
    end

    test "format accepts lowercase letters, digits and underscores" do
      assert Regex.match?(Username.format(), "buoewe_2")
    end

    test "format rejects anything else" do
      refute Regex.match?(Username.format(), "Buoewe")
      refute Regex.match?(Username.format(), "buo ewe")
      refute Regex.match?(Username.format(), "buo-ewe")
      refute Regex.match?(Username.format(), "buo.ewe")
    end

    test "reserved list includes the names that must never be claimed" do
      for name <- ~w(admin ethos root support moderator staff system anonymous deleted) do
        assert name in Username.reserved()
      end
    end
  end
end
