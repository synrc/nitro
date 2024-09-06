defmodule NITRO.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nitro,
      version: "9.9.6",
      description: "NITRO Nitrogen Web Framework",
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [mod: {:nitro, []}]
  end

  def package do
    [
      files: ~w(doc include priv lib src mix.exs rebar.config LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :nitro,
      links: %{"GitHub" => "https://github.com/synrc/nitro"}
    ]
  end

  def deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end
