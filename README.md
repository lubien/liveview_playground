# Your first LiveView!

The easiest way to have your LiveView running without boilerplate

## Installation

Create a file named `main.exs`:

```elixir
Mix.install([
  {:liveview_playground, "~> 0.1.0"}
])

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :name, "World")}
  end

  def render(assigns) do
    ~H"""
    Hello <%= @name %>
    """
  end
end

LiveviewPlayground.start()
```

Then run `elixir main.exs`. Congratulations! You have LiveView running at http://localhost:4000
