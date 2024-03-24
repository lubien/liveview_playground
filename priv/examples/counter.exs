Mix.install([
  {:liveview_playground, path: "../../"}
])

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  def render(assigns) do
    ~H"""
    Counter: <%= @count %>
    <button phx-click="inc">+</button>
    <button phx-click="dec">-</button>
    """
  end

  def handle_event("inc", _params, socket) do
    {:noreply, assign(socket, :count, socket.assigns.count + 1)}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, assign(socket, :count, socket.assigns.count - 1)}
  end
end

LiveviewPlayground.start()
