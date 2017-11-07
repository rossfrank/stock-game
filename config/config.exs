# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :stock_game,
  ecto_repos: [StockGame.Repo]

# Configures the endpoint
config :stock_game, StockGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NlFPaNAF95/p0s3lfpkP2Ju6dwzAbmVWOcDErTPTHS9d79ze+9zMtrK243+6lXuU",
  render_errors: [view: StockGameWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StockGame.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
