# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :tp_phoenix_optimal_example, TpPhoenixOptimalExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y85LDG14S3TQBFlx6KlqXtF5/AdilpqkrFUde22mSIyfI8d9nAajSKrzukOll+I5",
  render_errors: [view: TpPhoenixOptimalExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TpPhoenixOptimalExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
