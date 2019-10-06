defmodule LiveViewCommerce.Repo do
  use Ecto.Repo,
    otp_app: :live_view_commerce,
    adapter: Ecto.Adapters.Postgres
end
