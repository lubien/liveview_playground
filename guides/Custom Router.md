## CustomRouter LiveView

Soon enough you will need more than one route. You can specify a `router` option on your `LiveviewPlayground.start`.

```
Mix.install([
  {:liveview_playground, "~> 0.1.6"}
])

defmodule CustomRouter do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/" do
    pipe_through(:browser)

    live("/", PageLive, :index)
    live("/other", OtherPageLive, :about)
  end
end

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>PageLive</h1>
    <ul>
      <.link navigate={~p"/other"}>Go to other</.link>
    </ul>
    """
  end
end

defmodule OtherPageLive do
  use LiveviewPlaygroundWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>OtherPageLive</h1>
    <.link navigate={~p"/"}>Go to home</.link>
    """
  end
end

LiveviewPlayground.start(router: CustomRouter)
```
