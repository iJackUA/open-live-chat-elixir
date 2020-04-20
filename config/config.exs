# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :olc,
  ecto_repos: [Olc.Repo]

# Configures the endpoint
config :olc, OlcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N0XRxGgLqfWIg1pDXQSnFIsd7r+w5wv9z2JgC4cK69xilOuU1FHstbkhmLVE4sA8",
  render_errors: [view: OlcWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Olc.PubSub,
  live_view: [signing_salt: "UKuPEE/O"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
