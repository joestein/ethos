# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :ethos,
  ecto_repos: [Ethos.Repo],
  generators: [timestamp_type: :utc_datetime],
  env: config_env(),
  admin_email: "cryptcom@gmail.com"

# Configures the endpoint
config :ethos, EthosWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: EthosWeb.ErrorHTML, json: EthosWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Ethos.PubSub,
  live_view: [signing_salt: "/QPxO/iE"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :ethos, Ethos.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  ethos: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  ethos: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Affiliate placement, keyed by state slug. See
# docs/superpowers/specs/2026-08-31-affiliate-placement-design.md
#
# `counties` is a GUARD, not decoration. GetYourGuide's "new-york" campaign is
# New York CITY. Every New York page in the corpus today is a borough, so
# keying on state alone is correct today and silently wrong the day a Hudson
# Valley or Niagara guide ships and inherits a campaign for a city 300 miles
# away. Remove this list only when a separate upstate campaign exists.
#
# Staten Island is listed although no Staten Island content exists yet: it is a
# borough and the campaign covers it. It is the one forward-looking entry.
config :ethos, :affiliate_locales, %{
  "new-york" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "new-york",
    counties: ["Manhattan", "Brooklyn", "Bronx", "Queens", "Staten Island"]
  },
  # Country-level scope with a city campaign code, and those are not in tension:
  # GetYourGuide issues city-scoped codes and there is no "italy" code to use.
  # No :counties key, so every Italian page resolves.
  #
  # The consequence, recorded rather than guarded: when Florence or Venice ship
  # they inherit cmp=rome unless this entry is split first. It is deliberately
  # not guarded now — a guard over a one-city corpus guards nothing.
  #
  # But the fix is NOT just "add :counties the way new-york does". Adding
  # `counties: ["Rome"]` here on its own is inert: `county_allowed?/2` in
  # lib/ethos/affiliates.ex matches `{_counties, nil} -> true` first, and every
  # Italian guide seeded the way Rome was carries NO county, so Florence would
  # hit that clause and still resolve to cmp=rome — silently, with the guard
  # sitting right here looking like it works. (That nil-county clause is
  # load-bearing for the New York state hub, so it cannot simply be dropped.)
  #
  # Whoever ships the second Italian city must therefore do BOTH: backfill a
  # county on the Italian guides (Rome included) and then add the allowlist.
  "italy" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "rome",
    placement: :top
  }
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
