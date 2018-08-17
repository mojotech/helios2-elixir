# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :helios2, Helios2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NSblQRldp1Tn8cy5xQMu/LA3UoscOkCu3S0vPkrGvyUz+033uiEMTxulwfon2mDC",
  render_errors: [view: Helios2Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Helios2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configure Darksky def
config :darkskyx, api_key: System.get_env("DARKSKY_API_KEY"),
  defaults: [
    units: "us",
    lang: "en"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
