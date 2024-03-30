Mix.install([
  {:liveview_playground, path: "../../"}
])

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold underline">
      Hello world!
    </h1>
    """
  end
end

LiveviewPlayground.start(scripts: ["https://cdn.tailwindcss.com"])
