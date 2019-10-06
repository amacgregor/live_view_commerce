defmodule LiveViewCommerce.Catalog.LiveUpdates do
  @topic inspect(__MODULE__)

  def subscribe_live_view do
    Phoenix.PubSub.subscribe(LiveViewCommerce.PubSub, topic(), link: true)
  end

  def subscribe_live_view(product_id) do
    Phoenix.PubSub.subscribe(LiveViewCommerce.PubSub, topic(product_id), link: true)
  end

  def notify_live_view(message) do
    Phoenix.PubSub.broadcast(LiveViewCommerce.PubSub, topic(), message)
  end

  def notify_live_view(product_id, message) do
    Phoenix.PubSub.broadcast(LiveViewCommerce.PubSub, topic(product_id), message)
  end

  defp topic, do: @topic
  defp topic(product_id), do: topic() <> to_string(product_id)
end
