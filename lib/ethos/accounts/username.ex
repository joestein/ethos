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
end
