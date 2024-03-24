defmodule LiveviewPlayground.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/" do
    pipe_through(:browser)

    live("/", PageLive, :index)
  end
end
