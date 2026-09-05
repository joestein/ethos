defmodule Ethos.Accounts.Username do
  @moduledoc """
  The rules a username must satisfy, in one place.

  Three callers need to agree on these rules and none of them can reasonably
  import the others: the `Ethos.Accounts.User` changeset, the backfill
  migration that invents usernames for pre-existing accounts, and the
  username picker LiveView. Pure functions with no Ecto and no Phoenix, so
  every caller can hold them.
  """

  @min_length 3
  @max_length 20
  @format ~r/^[a-z0-9_]+$/

  @reserved ~w(
    admin ethos root support help about api
    moderator staff system anonymous deleted
  )

  def min_length, do: @min_length
  def max_length, do: @max_length
  def format, do: @format
  def reserved, do: @reserved

  @doc """
  Canonical form: trimmed and downcased.

  Applied on cast so that `BuoEwe` and `buoewe` are the same name before
  uniqueness is ever checked. Non-binaries pass through so this is safe to
  hand a `nil` from an empty form field.
  """
  def normalize(value) when is_binary(value), do: value |> String.trim() |> String.downcase()
  def normalize(value), do: value

  @doc """
  A valid username derived from an email address.

  Used only by the backfill migration, for accounts that predate usernames.
  The result is provisional — the user is asked to pick a real one — but it
  must still satisfy every rule above, because it is written straight to the
  column without passing through a changeset.
  """
  def derive_from_email(email) when is_binary(email) do
    email
    |> String.split("@")
    |> List.first()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9_]/, "")
    |> String.slice(0, @max_length)
    |> pad()
  end

  defp pad(candidate) when byte_size(candidate) >= @min_length, do: candidate
  defp pad(candidate), do: String.pad_trailing(candidate, @min_length, "0")

  @doc """
  `base` if it is free, otherwise `base` with a counter appended.

  `taken` is a `MapSet` of names already spoken for. The counter is appended
  within the length limit rather than beyond it, so the result is always a
  legal username.
  """
  def uniquify(base, %MapSet{} = taken) do
    if MapSet.member?(taken, base), do: uniquify(base, taken, 2), else: base
  end

  defp uniquify(base, taken, counter) do
    suffix = Integer.to_string(counter)
    candidate = String.slice(base, 0, @max_length - String.length(suffix)) <> suffix

    if MapSet.member?(taken, candidate),
      do: uniquify(base, taken, counter + 1),
      else: candidate
  end
end
