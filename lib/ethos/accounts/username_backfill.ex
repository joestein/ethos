defmodule Ethos.Accounts.UsernameBackfill do
  @moduledoc """
  Computes the usernames the migration backfills onto accounts that predate
  the `username` column.

  Extracted out of
  `Ethos.Repo.Migrations.AddUsernamesAndModerationFieldsToUsers` so this
  logic — in particular the admin's guaranteed name and the
  uniquify/provisional-flag interaction — can be exercised directly by
  tests instead of only by a migration that runs once. The migration reads
  rows, calls `backfill/3`, and writes the results back via raw SQL; it
  holds none of the naming logic itself.
  """

  alias Ethos.Accounts.Username

  @doc """
  Given `rows` (a list of `{id, email}` pairs, processed in the given
  order), the admin's email, and the username to reserve for the admin,
  returns a list of `{id, username, provisional?}`.

  The admin — the row whose email matches `admin_email`, case-insensitively
  — always gets `admin_username` outright, regardless of where their row
  falls in `rows` and regardless of what any other row would otherwise
  derive to. `admin_username` is reserved before any row is processed, so
  no other account can ever be assigned it, even one that sorts earlier
  than the admin's row. The admin's `provisional?` is `false`; every other
  row's is `true`, since that name was invented rather than chosen.

  Every non-admin row gets a username derived from its email with
  `Username.derive_from_email/1`, then run through `Username.uniquify/2`
  against the reserved names, the admin's name, and every name already
  assigned earlier in `rows`.
  """
  def backfill(rows, admin_email, admin_username)
      when is_list(rows) and is_binary(admin_username) do
    admin_email = String.downcase(admin_email || "")

    initial_taken =
      Username.reserved()
      |> MapSet.new()
      |> MapSet.put(admin_username)

    {updates, _taken} =
      Enum.map_reduce(rows, initial_taken, fn {id, email}, taken ->
        if String.downcase(email) == admin_email do
          {{id, admin_username, false}, taken}
        else
          base = Username.derive_from_email(email)
          username = Username.uniquify(base, taken)
          {{id, username, true}, MapSet.put(taken, username)}
        end
      end)

    updates
  end
end
