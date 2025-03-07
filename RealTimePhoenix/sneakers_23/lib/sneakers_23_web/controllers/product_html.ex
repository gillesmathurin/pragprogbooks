defmodule Sneakers23Web.ProductHTML do
  @moduledoc """
  This module contains pages rendered by ProductController.

  See the `product_html` directory for all templates available.
  """
  use Sneakers23Web, :html

  import Sneakers23Web.ProductComponents

  embed_templates "product_html/*"

end
