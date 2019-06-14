defmodule NITRO.Mixfile do
  use Mix.Project

  def project do
    [app: :nitro, version: "4.4.0", description: "NITRO Web Framework and HTML5 DSL", package: package(), deps: deps()]
  end

  def application do
    [mod: {:nitro, []}]
  end

  def package do
    [
      files: ["src", "include", "priv", "LICENSE", "README.md", "rebar.config"],
      licenses: ["DHARMA"],
      maintainers: ["Namdak Tonpa"],
      name: :nitro,
      links: %{"GitHub" => "https://github.com/synrc/nitro"}
    ]
  end

  def deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end
