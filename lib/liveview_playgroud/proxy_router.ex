defmodule LiveviewPlayground.ProxyRouter do
  use Agent
  use Phoenix.Router

  @agent LiveviewPlayground.ProxyRouterAgent

  def set_router(router) do
    start_agent()

    Agent.update(@agent, fn _ ->
      router.init([])
      router
    end)
  end

  def init(_opts) do
    start_agent()
    []
  end

  def call(conn, _opts) do
    mod = Agent.get(@agent, & &1)
    mod.call(conn, [])
  end

  defp start_agent do
    unless Process.whereis(@agent) do
      {:ok, _pid} =
        Agent.start(
          fn ->
            LiveviewPlayground.Router.init([])
            LiveviewPlayground.Router
          end,
          name: @agent
        )
    end
  end
end
