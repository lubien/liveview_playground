defmodule LiveviewPlayground do
  @moduledoc """
  Documentation for `LiveviewPlayground`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LiveviewPlayground.hello()
      :world

  """
  def start(opts \\ []) do
    router = Keyword.get(opts, :router, LiveviewPlayground.Router)
    endpoint = Keyword.get(opts, :endpoint, LiveviewPlayground.Endpoint)

    LiveviewPlayground.ProxyRouter.set_router(router)

    Application.put_env(:liveview_playground, endpoint,
      http: [ip: {127, 0, 0, 1}, port: 4000],
      server: true,
      live_view: [signing_salt: "aaaaaaaa"],
      secret_key_base: String.duplicate("a", 64)
    )

    Application.put_env(:liveview_playground, :router, router)

    {:ok, _} = Supervisor.start_link([endpoint], strategy: :one_for_one)
    Process.sleep(:infinity)
  end

  # def make_endpoint(router) do
  #   LiveviewPlayground.Endpoint
  # end
end
