defmodule LiveviewPlayground.Router do
  use LiveviewPlaygroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser
    live "/", PageLive, :index
  end
end
