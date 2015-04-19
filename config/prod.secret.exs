use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :calculon, Calculon.Endpoint,
  secret_key_base: "vm6Vyj7KZE0Y4EQSlQDWVY5OGhd6mFgozzyPF//+RRouBQo5XlV6UBpo31S9CGbn"

# Configure your database
config :calculon, Calculon.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "calculon_prod"
