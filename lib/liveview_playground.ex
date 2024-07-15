defmodule LiveviewPlayground do
  @moduledoc """
  Documentation for `LiveviewPlayground`.
  """

  @doc """
  Starts liveview playground

  All options are optional. They are:

    * `:router` - the Phoenix.Router module

    * `:endpoint` - the Phoenix.Endpoint module

    * `:script` - list of binaries that will be included as scripts on the layout <head>

  """
  def start(opts \\ []) do
    router = Keyword.get(opts, :router, LiveviewPlayground.Router)
    endpoint = Keyword.get(opts, :endpoint, LiveviewPlayground.Endpoint)
    scripts = Keyword.get(opts, :scripts, [])
    ip = Keyword.get(opts, :ip, {127, 0, 0, 1})
    port = Keyword.get(opts, :port, 4000)

    Application.put_env(:liveview_playground, endpoint,
      http: [ip: ip, port: port],
      server: true,
      live_view: [signing_salt: "aaaaaaaa"],
      secret_key_base: String.duplicate("a", 64),
      router: router
    )

    Application.put_env(:liveview_playground, :router, router)
    Application.put_env(:liveview_playground, :scripts, scripts)

    {:ok, _} = Supervisor.start_link([endpoint], strategy: :one_for_one)
    Process.sleep(:infinity)
  end
end
