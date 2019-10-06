defmodule LiveViewCommerceWeb.ProductPriceLive do
  use Phoenix.LiveView

  alias LiveViewCommerce.Catalog
  alias LiveViewCommerceWeb.ProductView
  alias LiveViewCommerce.Catalog.LiveUpdates

  def mount(session, socket) do

    LiveUpdates.subscribe_live_view(session[:id])

    {:ok, assign(socket, :price, session[:price])}
  end

  def render(assigns) do
    ProductView.render("price.html", assigns)
  end

  def handle_info({_requesting_module, [:product_price, :updated], [{:price, price}]}, socket) do
    IO.inspect(price)
    {:noreply, assign(socket, price: price)}
  end


end
