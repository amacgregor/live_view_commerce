defmodule LiveViewCommerceWeb.PageController do
  use LiveViewCommerceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
