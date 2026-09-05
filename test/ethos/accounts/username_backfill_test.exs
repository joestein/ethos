defmodule Ethos.Accounts.UsernameBackfillTest do
  use ExUnit.Case, async: true

  alias Ethos.Accounts.UsernameBackfill

  @admin_email "cryptcom@gmail.com"
  @admin_username "buoewe"

  test "the admin gets the fixed username and is not provisional" do
    rows = [{1, @admin_email}]

    assert UsernameBackfill.backfill(rows, @admin_email, @admin_username) ==
             [{1, @admin_username, false}]
  end

  test "the admin's email match is case-insensitive" do
    rows = [{1, String.upcase(@admin_email)}]

    assert UsernameBackfill.backfill(rows, @admin_email, @admin_username) ==
             [{1, @admin_username, false}]
  end

  test "every non-admin account gets a derived username and is provisional" do
    rows = [{1, "joestein@example.com"}]

    assert UsernameBackfill.backfill(rows, @admin_email, @admin_username) ==
             [{1, "joestein", true}]
  end

  test "a base that collides with the reserved list is bumped past it" do
    rows = [{1, "admin@example.com"}]

    assert UsernameBackfill.backfill(rows, @admin_email, @admin_username) ==
             [{1, "admin2", true}]
  end

  test "two emails that derive to the same base get distinct usernames" do
    rows = [{1, "joe@example.com"}, {2, "joe@other.com"}]

    assert UsernameBackfill.backfill(rows, @admin_email, @admin_username) ==
             [{1, "joe", true}, {2, "joe2", true}]
  end

  test "the admin keeps the fixed username even when a lower-id row would otherwise claim it, regardless of row order" do
    colliding_email = "buoewe@gmail.com"

    rows_admin_first = [{1, @admin_email}, {2, colliding_email}]
    rows_admin_last = [{1, colliding_email}, {2, @admin_email}]

    assert UsernameBackfill.backfill(rows_admin_first, @admin_email, @admin_username) ==
             [{1, @admin_username, false}, {2, "buoewe2", true}]

    assert UsernameBackfill.backfill(rows_admin_last, @admin_email, @admin_username) ==
             [{1, "buoewe2", true}, {2, @admin_username, false}]
  end

  test "no rows means no updates" do
    assert UsernameBackfill.backfill([], @admin_email, @admin_username) == []
  end
end
