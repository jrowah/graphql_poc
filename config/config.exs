# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :blog_api,
  ecto_repos: [BlogApi.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :blog_api, BlogApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: BlogApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BlogApi.PubSub,
  live_view: [signing_salt: "Sc1TIRtc"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :blog_api, BlogApi.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :blog_api, BlogApi.Guardian,
  issuer: "blog_api",
  secret_key: "zI4auIub3pmG2803I8BuMeghhARrXR+NbJqGUAouys4JhXRe1btZQei1qZaJrPdE"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
