defmodule Ethos.PostHogConfigTest do
  use ExUnit.Case, async: true

  # A bare "phc_" search also matches this repo's own documentation, which
  # explains the key shape in prose ("phc_-prefixed", "phc_ keys") — every
  # such match is a false positive that would make this guard cry wolf on
  # every run. The tempting fix under pressure is to exclude docs/ from the
  # search, but that is exactly where a careless paste of a real key is most
  # likely to land, so blinding the guard there defeats its purpose. Instead,
  # match the real key's shape: "phc_" followed by 43 alphanumeric characters
  # in production, so requiring 20+ here rejects the prose forms (which are
  # followed by a hyphen or a space, not more alphanumerics) while still
  # catching any realistic key.
  @key_pattern "phc_[A-Za-z0-9]{20,}"

  test "no committed file contains a PostHog project key" do
    # phc_ keys are public client keys and appear in production page source
    # regardless, so this is not about secrecy — it is about the key reaching
    # production through `fly secrets` rather than through a paste into a file
    # nobody re-reads. A key committed here would be the one in the repo
    # forever, including after it is rotated.
    root = Path.expand("../..", __DIR__)

    {out, status} =
      System.cmd("git", ["grep", "-nE", @key_pattern], cd: root, stderr_to_stdout: true)

    # git grep exits 1 when it finds no match — that is the passing case, not
    # an error. Any other non-zero status means the command itself failed
    # (bad pattern, not a git repo, etc.) and should not be read as "clean".
    assert status in [0, 1], "git grep failed unexpectedly: #{out}"

    offenders =
      out
      |> String.split("\n", trim: true)
      # This test file names the pattern in order to search for it.
      |> Enum.reject(&String.contains?(&1, "posthog_config_test.exs"))

    assert offenders == [],
           "a PostHog key is committed in: #{Enum.join(offenders, ", ")}"
  end

  test "the key is unset in test, so nothing is sent" do
    # The default that matters. If this ever fails, the test suite is firing
    # events into a real PostHog project.
    assert Application.get_env(:ethos, :posthog_public_key) == nil
  end
end
