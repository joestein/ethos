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

# Affiliate placement, keyed by DESTINATION NODE PATH. See
# docs/superpowers/specs/2026-08-31-affiliate-placement-design.md
#
# A page resolves to the locale whose key is its node's path or a prefix of it,
# longest key first. The key is therefore the campaign's geography, expressed in
# the same vocabulary the URL, the tree and the loaders already share — not a
# display name derived from one of them.
#
# That is why there is no `:counties` allowlist any more. There used to be one,
# because the registry was keyed on a page's derived state slug: GetYourGuide's
# "new-york" campaign is New York CITY, and keying on the state alone would hand
# a Hudson Valley or Niagara guide a campaign for a city 300 miles away. The
# allowlist matched borough NAMES, listed "Bronx" while the roster names the
# borough "The Bronx", and so switched every Bronx page's widget off silently:
# HTTP 200, a correct-looking page, no unit. Keyed on
# `united-states/new-york/new-york-city`, an upstate node is not under the key
# at all, so the case the guard defended against cannot be expressed and there
# is no name left to spell differently.
#
# Staten Island needs no entry of its own: it is a borough beneath this node, so
# it is covered the day the roster gains it.
config :ethos, :affiliate_locales, %{
  "united-states/new-york/new-york-city" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "new-york"
  },
  # Lazio, not Italy and not Rome, and the depth is load-bearing both ways.
  #
  # Keyed on "italy" the campaign would reach a Florence or Venice guide at
  # `italy/tuscany/*` and sell them Rome tours. Keyed on `italy/lazio/rome` it
  # would miss the Lazio hub and every page filed on the region itself. The
  # region node is exactly the campaign's reach.
  #
  # GetYourGuide issues city-scoped codes and there is no "lazio" code, so a
  # region-wide key carrying cmp=rome is not a mismatch — it is the only code
  # that exists for this geography. When a second Lazio city ships, split this
  # into `italy/lazio/rome` plus a key of its own rather than widening it; a
  # deeper key wins over a shallower one, so the split needs no other change.
  "italy/lazio" => %{
    network: :getyourguide,
    partner_id: "ZA4AIMF",
    cmp: "rome",
    placement: :top
  }
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
