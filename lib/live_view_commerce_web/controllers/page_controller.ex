defmodule LiveViewCommerceWeb.PageController do
  use LiveViewCommerceWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, LiveViewCommerceWeb.CatalogLive.Index, session: %{})
  end
end
