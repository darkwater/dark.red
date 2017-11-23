defmodule Generator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :generator,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: false,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:cmark, "~> 0.7"},
    ]
  end
end
