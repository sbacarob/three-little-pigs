# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :three_little_pigs,
  ecto_repos: [ThreeLittlePigs.Repo]

# Configures the endpoint
config :three_little_pigs, ThreeLittlePigsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rXzwWoh0MXHY+SLaraObP+6wGTlvYjgCjWLUwzLJAec89d5MBhsHt0HSfqhyDJoo",
  render_errors: [view: ThreeLittlePigsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ThreeLittlePigs.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "GhKIJHwIGKfuEwEqzjiEmu4jg6/Jox/A"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
