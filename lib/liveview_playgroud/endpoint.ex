defmodule LiveviewPlayground.Endpoint do
  use Phoenix.Endpoint, otp_app: :liveview_playground
  socket("/live", Phoenix.LiveView.Socket)
  plug(LiveviewPlayground.ProxyRouter)
end
