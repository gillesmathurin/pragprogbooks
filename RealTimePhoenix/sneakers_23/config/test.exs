import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :sneakers_23, Sneakers23.Repo,
  username: "gillesmathurin",
  password: "",
  hostname: "localhost",
  database: "sneakers_23_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sneakers_23, Sneakers23Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QxSMwNiZe95xdqT++T3+us48d0gmen172T/vB1gTXJgV8uA1AporuVM660694c3r",
  server: false

# In test we don't send emails
config :sneakers_23, Sneakers23.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# Configure Wallaby for testing
config :wallaby,
  driver: Wallaby.Chrome,
  screenshot_on_failure: true,
  chromedriver: [
    headless: false,
    default_args: ["--no-sandbox", "--disable-dev-shm-usage"]
    ],
  screenshot_dir: "test/screenshots"
  # js_errors: false,
