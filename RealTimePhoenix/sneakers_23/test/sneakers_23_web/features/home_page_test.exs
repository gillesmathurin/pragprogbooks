defmodule Acceptance.HomePageTest do
  use Sneakers23Web.FeatureCase

  alias Sneakers23Web.Router.Helpers, as: Routes

  feature "home page loads", %{session: session} do
    session
    |> visit(Routes.product_path(Sneakers23Web.Endpoint, :index)) #
    |> sleep(1000)
    # |> assert_has(Query.text("Hop Man 3"))
    # |> assert_has(Query.text("Breezy Boost"))
    # |> assert_has(Query.text("Shop Now"))
    # |> assert_has(Query.text("Cart"))
  end
end
