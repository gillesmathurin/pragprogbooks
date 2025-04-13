Code.require_file("support/feature_case.ex", __DIR__)
Application.put_env(:wallaby, :base_url, Sneakers23Web.Endpoint.url())
Ecto.Adapters.SQL.Sandbox.mode(Sneakers23.Repo, :manual)
ExUnit.start()
