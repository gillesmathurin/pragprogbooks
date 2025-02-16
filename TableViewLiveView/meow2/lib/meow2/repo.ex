defmodule Meow2.Repo do
  use Ecto.Repo,
    otp_app: :meow2,
    adapter: Ecto.Adapters.Postgres
end
