defmodule Scraper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Scraper.Worker.start_link(arg)
      # {Scraper.Worker, arg}
      PageProducer,
      Supervisor.child_spec(PageConsumer, id: :consumer_a),
      Supervisor.child_spec(PageConsumer, id: :consumer_b)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Scraper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
