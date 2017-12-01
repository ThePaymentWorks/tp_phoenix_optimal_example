use Mix.Config

config :tp_phoenix_optimal_example, TpPhoenixOptimalExampleWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: "https://YOUR_HEROKU_APP_HERE.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  cache_static_manifest: "priv/static/cache_manifest.json"



# Do not print debug messages in production
config :logger, level: :info
