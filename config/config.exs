# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :geboku,
  ecto_repos: [Geboku.Repo]

config :geboku_web,
  ecto_repos: [Geboku.Repo],
  generators: [context_app: :geboku]

# Configures the endpoint
config :geboku_web, GebokuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fqy3dWnbd76StL8l7f7r8EJuvKbIH+t6YQ7fANyA5e53qFiQRJ5N42LfiWYdbWfF",
  render_errors: [view: GebokuWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Geboku.PubSub,
  live_view: [signing_salt: "QNPBGYZx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :slack, api_token: System.get_env("SLACK_API_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
