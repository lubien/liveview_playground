defmodule LiveviewPlayground.Endpoint do
  use Phoenix.Endpoint, otp_app: :liveview_playground
  socket "/live", Phoenix.LiveView.Socket
  plug :router

  defp router(conn, []) do
    config = Application.fetch_env!(:liveview_playground, __MODULE__)
    router = Keyword.fetch!(config, :router)
    router.call(conn, [])
  end
end
