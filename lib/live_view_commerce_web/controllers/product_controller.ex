defmodule LiveViewCommerceWeb.ProductController do
  use LiveViewCommerceWeb, :controller

  alias LiveViewCommerce.Catalog
  alias LiveViewCommerce.Catalog.Product

  def show(conn, %{"id" => id}) do
    product = Catalog.get_product!(id)
    render(conn, "show.html", product: product)
  end
end
