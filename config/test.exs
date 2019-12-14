use Mix.Config

# Configure your database
config :three_little_pigs, ThreeLittlePigs.Repo,
  username: "postgres",
  password: "postgres",
  database: "three_little_pigs_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :three_little_pigs, ThreeLittlePigsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
