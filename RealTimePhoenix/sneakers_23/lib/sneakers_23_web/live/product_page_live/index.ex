defmodule Sneakers23Web.ProductPageLive.Index do
  use Sneakers23Web, :live_view

  import Sneakers23Web.ProductComponents

  def mount(_params, _session, socket) do
    # socket = assign(socket, :products, []) # Valeur par défaut
    case Sneakers23.Inventory.get_complete_products() do
      {:error, reason} ->
        {:ok, assign(socket, :products, [])}

      {:ok, products} ->
        socket =
          socket
          |> assign(:products, products)

        if connected?(socket) do
          IO.puts("Connected to socket")
          subscribe_to_products(products)
        else
          IO.puts("Not connected to socket")
        end

        {:ok, socket}
    end

    {:ok, socket}
  end

  defp subscribe_to_products(products) do
    Enum.each(products, fn %{id: id} ->
      Phoenix.PubSub.subscribe(Sneakers23.PubSub, "product:#{id}")
    end)
  end

  def handle_info(%{event: "released"}, socket) do
    {:noreply, load_products_from_memory(socket)}
  end

  def handle_info(%{event: "stock_change"}, socket) do
    {:noreply, load_products_from_memory(socket)}
  end

  defp load_products_from_memory(socket) do
    {:ok, products} = Sneakers23.Inventory.get_complete_products()
    assign(socket, :products, products)
  end
end
