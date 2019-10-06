defmodule LiveViewCommerceWeb.CatalogLive.Index do
  use Phoenix.LiveView

  alias LiveViewCommerce.Catalog
  alias LiveViewCommerceWeb.CatalogView

  def mount(_session, socket) do
    products = Catalog.list_products() |> Enum.chunk_every(4)
    {:ok, assign(socket, products: products)}
  end

  def render(assigns) do
    CatalogView.render("index.html", assigns)
  end
end
