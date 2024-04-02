## Using Tailwind

This is an example on how to pass the `tailwind` cdn to be inserted as a `<head>` script.

```
Mix.install([
  {:liveview_playground, "~> 0.1.6"}
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
```
