defmodule Meow2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Meow2Web.Telemetry,
      Meow2.Repo,
      {DNSCluster, query: Application.get_env(:meow2, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Meow2.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Meow2.Finch},
      # Start a worker by calling: Meow2.Worker.start_link(arg)
      # {Meow2.Worker, arg},
      # Start to serve requests, typically the last entry
      Meow2Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Meow2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Meow2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
