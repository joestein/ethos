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

  describe "derive_from_email/1" do
    test "uses the local part" do
      assert Username.derive_from_email("cryptcom@gmail.com") == "cryptcom"
    end

    test "downcases" do
      assert Username.derive_from_email("JoeStein@example.com") == "joestein"
    end

    test "strips characters a username may not contain" do
      assert Username.derive_from_email("joe.stein+travel@example.com") == "joesteintravel"
    end

    test "truncates to the maximum length" do
      result = Username.derive_from_email("averyveryverylongnameindeed@example.com")
      assert String.length(result) == 20
      assert result == "averyveryverylongnam"
    end

    test "pads a local part that is too short" do
      assert Username.derive_from_email("jo@example.com") == "jo0"
    end

    test "pads a local part that strips down to nothing" do
      assert Username.derive_from_email("...@example.com") == "000"
    end

    test "always produces something the format accepts" do
      for email <- ["A@b.com", "j.o.e@x.io", "UPPER+tag@y.net", "..@z.org"] do
        derived = Username.derive_from_email(email)
        assert Regex.match?(Username.format(), derived)
        assert String.length(derived) >= Username.min_length()
        assert String.length(derived) <= Username.max_length()
      end
    end
  end

  describe "uniquify/2" do
    test "returns the base when it is free" do
      assert Username.uniquify("buoewe", MapSet.new()) == "buoewe"
    end

    test "appends a counter when the base is taken" do
      assert Username.uniquify("buoewe", MapSet.new(["buoewe"])) == "buoewe2"
    end

    test "keeps counting past the first collision" do
      taken = MapSet.new(["buoewe", "buoewe2", "buoewe3"])
      assert Username.uniquify("buoewe", taken) == "buoewe4"
    end

    test "keeps the result within the maximum length" do
      base = String.duplicate("a", 20)
      result = Username.uniquify(base, MapSet.new([base]))
      assert String.length(result) == 20
      assert String.ends_with?(result, "2")
    end

    test "stays within the maximum length when the counter needs two or three digits" do
      base = String.duplicate("a", 20)

      taken_10 = MapSet.new([base | for(n <- 2..10, do: String.slice(base, 0, 19) <> "#{n}")])
      two_digit = Username.uniquify(base, taken_10)
      assert String.length(two_digit) == 20

      taken_100 =
        MapSet.new([
          base
          | for(n <- 2..9, do: String.slice(base, 0, 19) <> "#{n}") ++
              for(n <- 10..100, do: String.slice(base, 0, 18) <> "#{n}")
        ])

      three_digit = Username.uniquify(base, taken_100)
      assert String.length(three_digit) == 20
    end
  end
end
