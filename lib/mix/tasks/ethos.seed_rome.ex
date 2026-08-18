defmodule Mix.Tasks.Ethos.SeedRome do
  use Mix.Task

  @shortdoc "Seeds the Rome flagship guide under the given owner email"

  @moduledoc """
  Creates or updates the "3 Days in Rome" flagship guide under the given
  owner email (creating the user, with a random password, if absent).
  Idempotent by slug — safe to run repeatedly.

      mix ethos.seed_rome --owner demo@ethos.example
  """

  @impl Mix.Task
  def run(args) do
    {opts, _rest, _invalid} = OptionParser.parse(args, strict: [owner: :string])

    email =
      opts[:owner] ||
        Mix.raise("expected --owner EMAIL to be given")

    Mix.Task.run("app.start")

    guide = Ethos.Seeds.RomeGuide.upsert!(email)
    Mix.shell().info("Seeded Rome guide: /g/#{guide.slug}")
  end
end
