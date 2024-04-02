defmodule LiveviewPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :liveview_playground,
      version: "0.1.4",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      description: description(),
      package: package(),
      name: "LiveView Playground",
      source_url: "https://github.com/lubien/liveview_playground",
      docs: [
        # The main page in the docs
        main: "readme",
        # logo: "path/to/logo.png",
        extras: ["README.md", "guides/Number Counter.md", "guides/Custom Router.md", "guides/Tailwind.md"],
        groups_for_extras: groups_for_extras()
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.7.0"},
      {:phoenix_live_view, "~> 0.20.14"},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "The easiest way to make a LiveView REPL"
  end

  defp package do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE.md),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/lubien/liveview_playground"}
    ]
  end

  defp groups_for_extras do
    [
      Examples: ~r/guides\/[^\/]+\.md/
    ]
  end
end
