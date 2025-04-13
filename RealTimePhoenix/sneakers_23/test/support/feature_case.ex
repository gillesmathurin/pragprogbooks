defmodule Sneakers23Web.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.Feature

      alias Sneakers23.Repo
      import Ecto.Query
      import Ecto.Changeset
      # import Sneakers23.Factory
      import Phoenix.LiveViewTest

      import Sneakers23Web.Router
      @endpoint Sneakers23Web.Endpoint
    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Sneakers23.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)

    {:ok, session: Wallaby.start_session()}
  end
end
