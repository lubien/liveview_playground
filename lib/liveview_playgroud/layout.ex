defmodule LiveviewPlayground.Layout do
  use LiveviewPlaygroundWeb, :live_view

  def render("live.html", assigns) do
    assigns =
      assign_new(assigns, :scripts, fn ->
        Application.fetch_env!(:liveview_playground, :scripts)
      end)

    ~H"""
    <script :for={script <- @scripts} src={script}>
    </script>
    <script src="https://cdn.jsdelivr.net/npm/phoenix@1.7.0-rc.2/priv/static/phoenix.min.js">
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/phoenix_live_view@0.18.2/priv/static/phoenix_live_view.min.js"
    >
    </script>
    <script>
      let liveSocket = new window.LiveView.LiveSocket("/live", window.Phoenix.Socket)
      liveSocket.connect()
    </script>
    <style>
      * { font-size: 1.1em; }
    </style>
    <%= @inner_content %>
    """
  end

  def render(assigns) do
    ~H""
  end
end
