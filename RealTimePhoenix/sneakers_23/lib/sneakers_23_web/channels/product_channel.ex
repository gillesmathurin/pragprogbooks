defmodule Sneakers23Web.ProductChannel do
  use Phoenix.Channel

  alias Sneakers23Web.{Endpoint, ProductHTML}

  def join("product:" <> _sku, %{}, socket) do
    {:ok, socket}
  end

  def notify_product_released(product = %{id: id}) do
    size_html = Phoenix.Template.render_to_string(
      ProductHTML,
      "_sizes",
      "html",
      product: product
    )
    Endpoint.broadcast("product:#{id}", "released", %{size_html: size_html})
  end
end
