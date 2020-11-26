defmodule SlackBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :slack_bot,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {SlackBot.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:slack, github: "aMikeChen/Elixir-Slack", branch: "master"}
    ]
  end
end
